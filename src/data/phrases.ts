export interface PhraseCategory {
  idle: string[];
  vscode: string[];
  browser: string[];
  explorer: string[];
  random: string[];
}

export const phrases: PhraseCategory = {
  idle: [
    "hello",
    "still there?",
    "thinking...",
    "hmm...",
    "coding gremlin mode",
    "bored...",
    "what are we doing?",
    "zzzz...",
    "poke me",
    "I'm watching",
  ],
  vscode: [
    "coding time",
    "VS Code opened",
    "did you break the build?",
    "another bug to fix?",
    "let's code!",
    "time to debug",
    "ctrl+z is your friend",
    "syntax error incoming",
    "commit your code!",
    "push to main? brave.",
  ],
  browser: [
    "browsing again?",
    "stackoverflow time?",
    "researching or procrastinating?",
    "found the answer?",
    "copy paste detected",
    "another tutorial?",
    "chrome eats RAM",
    "close some tabs!",
    "incognito mode? sus",
    "debugging in console?",
  ],
  explorer: [
    "file explorer opened",
    "looking for something?",
    "organizing files?",
    "where did I save that?",
    "downloads folder chaos",
    "delete temp files!",
  ],
  random: [
    "that looks suspicious",
    "interesting...",
    "I see you",
    "keep going",
    "nice work",
    "take a break?",
    "hydrate!",
    "stretch time",
    "coffee break?",
    "you got this",
    "focus mode",
    "productivity!",
    "don't give up",
    "almost there",
  ],
};

export function getRandomPhrase(category: keyof PhraseCategory): string {
  const categoryPhrases = phrases[category];
  return categoryPhrases[Math.floor(Math.random() * categoryPhrases.length)];
}
