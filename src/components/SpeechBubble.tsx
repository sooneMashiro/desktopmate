import { motion, AnimatePresence } from "framer-motion";

interface SpeechBubbleProps {
  text: string;
  isVisible: boolean;
}

export function SpeechBubble({ text, isVisible }: SpeechBubbleProps) {
  return (
    <AnimatePresence>
      {isVisible && (
        <motion.div
          initial={{ opacity: 0, y: 10, scale: 0.8 }}
          animate={{ opacity: 1, y: 0, scale: 1 }}
          exit={{ opacity: 0, y: -10, scale: 0.8 }}
          transition={{ duration: 0.3 }}
          className="absolute -top-16 left-1/2 -translate-x-1/2 bg-white rounded-2xl px-4 py-2 shadow-lg border-2 border-gray-800 min-w-[120px] max-w-[200px]"
        >
          <div className="text-sm font-medium text-gray-800 text-center whitespace-nowrap">
            {text}
          </div>
          <div className="absolute -bottom-2 left-1/2 -translate-x-1/2 w-0 h-0 border-l-8 border-r-8 border-t-8 border-l-transparent border-r-transparent border-t-gray-800"></div>
          <div className="absolute -bottom-1 left-1/2 -translate-x-1/2 w-0 h-0 border-l-6 border-r-6 border-t-6 border-l-transparent border-r-transparent border-t-white"></div>
        </motion.div>
      )}
    </AnimatePresence>
  );
}
