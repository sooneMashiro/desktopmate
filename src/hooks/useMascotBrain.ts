import { useState, useEffect, useCallback } from "react";
import { listen } from "@tauri-apps/api/event";
import { getRandomPhrase } from "../data/phrases";

interface MascotState {
  currentPhrase: string;
  isVisible: boolean;
  isTalking: boolean;
}

const REACTION_COOLDOWN = 20000; // 20 seconds
const IDLE_MIN = 120000; // 2 minutes
const IDLE_MAX = 300000; // 5 minutes
const SPEECH_DURATION = 5000; // 5 seconds

export function useMascotBrain() {
  const [state, setState] = useState<MascotState>({
    currentPhrase: "",
    isVisible: false,
    isTalking: false,
  });

  const [lastReactionTime, setLastReactionTime] = useState(0);

  const showPhrase = useCallback((phrase: string) => {
    setState({
      currentPhrase: phrase,
      isVisible: true,
      isTalking: true,
    });

    setTimeout(() => {
      setState((prev) => ({
        ...prev,
        isVisible: false,
        isTalking: false,
      }));
    }, SPEECH_DURATION);
  }, []);

  const canReact = useCallback(() => {
    return Date.now() - lastReactionTime > REACTION_COOLDOWN;
  }, [lastReactionTime]);

  // Listen to window changes from Rust backend
  useEffect(() => {
    const unlisten = listen<{ title: string }>("window-changed", (event) => {
      if (!canReact()) return;

      const title = event.payload.title.toLowerCase();

      if (title.includes("visual studio code") || title.includes("vscode")) {
        showPhrase(getRandomPhrase("vscode"));
        setLastReactionTime(Date.now());
      } else if (
        title.includes("chrome") ||
        title.includes("firefox") ||
        title.includes("edge") ||
        title.includes("browser")
      ) {
        showPhrase(getRandomPhrase("browser"));
        setLastReactionTime(Date.now());
      } else if (title.includes("explorer")) {
        showPhrase(getRandomPhrase("explorer"));
        setLastReactionTime(Date.now());
      }
    });

    return () => {
      unlisten.then((fn) => fn());
    };
  }, [canReact, showPhrase]);

  // Random idle comments
  useEffect(() => {
    const scheduleIdleComment = () => {
      const delay = IDLE_MIN + Math.random() * (IDLE_MAX - IDLE_MIN);
      return setTimeout(() => {
        if (canReact()) {
          const category = Math.random() > 0.5 ? "idle" : "random";
          showPhrase(getRandomPhrase(category));
          setLastReactionTime(Date.now());
        }
        scheduleIdleComment();
      }, delay);
    };

    const timer = scheduleIdleComment();
    return () => clearTimeout(timer);
  }, [canReact, showPhrase]);

  return state;
}
