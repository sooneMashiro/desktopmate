import { Mascot } from "./components/Mascot";
import { useMascotBrain } from "./hooks/useMascotBrain";

function App() {
  const { currentPhrase, isVisible, isTalking } = useMascotBrain();

  return (
    <div className="w-screen h-screen flex items-center justify-center">
      <Mascot phrase={currentPhrase} isVisible={isVisible} isTalking={isTalking} />
    </div>
  );
}

export default App;
