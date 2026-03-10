import { useState } from "react";
import { motion } from "framer-motion";
import { SpeechBubble } from "./SpeechBubble";
import mascotIdle from "../assets/mascot_idle.png";
import mascotTalk from "../assets/mascot_talk.png";

interface MascotProps {
  phrase: string;
  isVisible: boolean;
  isTalking: boolean;
}

export function Mascot({ phrase, isVisible, isTalking }: MascotProps) {
  const [isDragging, setIsDragging] = useState(false);

  return (
    <motion.div
      drag
      dragMomentum={false}
      onDragStart={() => setIsDragging(true)}
      onDragEnd={() => setIsDragging(false)}
      className="relative cursor-move select-none"
      whileHover={{ scale: 1.05 }}
      animate={{
        y: isDragging ? 0 : [0, -5, 0],
      }}
      transition={{
        y: {
          duration: 2,
          repeat: Infinity,
          ease: "easeInOut",
        },
      }}
    >
      <SpeechBubble text={phrase} isVisible={isVisible} />
      
      <motion.img
        src={isTalking ? mascotTalk : mascotIdle}
        alt="Desktop Mascot"
        className="w-48 h-48 drop-shadow-lg"
        animate={{
          rotate: isDragging ? 0 : [-2, 2, -2],
        }}
        transition={{
          rotate: {
            duration: 3,
            repeat: Infinity,
            ease: "easeInOut",
          },
        }}
      />
    </motion.div>
  );
}
