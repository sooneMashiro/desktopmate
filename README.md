# Desktop Mascot - Windows Companion

A lightweight, playful desktop mascot that floats on your Windows desktop, reacts to your active applications, and speaks random phrases.

## Features

✨ **Transparent floating window** - Always on top, frameless, draggable  
💬 **Speech bubbles** - Shows contextual phrases  
🎯 **App detection** - Reacts to VS Code, browsers, File Explorer  
🎨 **Simple animations** - Bouncing and talking animations  
🖱️ **Draggable** - Click and drag to move around  
⚡ **Lightweight** - Built with Tauri + React + TypeScript  

## Tech Stack

- **Frontend**: React + TypeScript + Vite + TailwindCSS + Framer Motion
- **Desktop**: Tauri (Rust)
- **Platform**: Windows (with native window detection)

## Prerequisites

Before you begin, ensure you have the following installed:

### 1. Node.js
Download and install from: https://nodejs.org/  
Recommended version: 18.x or higher

### 2. Rust
Install Rust using rustup:
```bash
# Open PowerShell and run:
winget install Rustlang.Rustup
```

Or download from: https://rustup.rs/

### 3. Visual Studio C++ Build Tools
Required for Rust compilation on Windows:
```bash
winget install Microsoft.VisualStudio.2022.BuildTools
```

Or download from: https://visualstudio.microsoft.com/downloads/

During installation, select "Desktop development with C++"

### 4. WebView2
Usually pre-installed on Windows 10/11. If not:
```bash
winget install Microsoft.EdgeWebView2Runtime
```

## Installation

### Step 1: Navigate to project folder
```bash
cd C:\Users\gabriel.teles\Documents\desktop-mascot
```

### Step 2: Install dependencies
```bash
npm install
```

This will install all frontend dependencies (React, Vite, Tailwind, etc.)

### Step 3: Run development mode
```bash
npm run tauri:dev
```

This will:
- Compile the Rust backend
- Start the Vite dev server
- Launch the mascot window

**First run may take 5-10 minutes** as Rust compiles all dependencies.

## Usage

### Running the App

Development mode (with hot reload):
```bash
npm run tauri:dev
```

Build production version:
```bash
npm run tauri:build
```

The executable will be in: `src-tauri/target/release/desktop-mascot.exe`

### Interacting with the Mascot

- **Drag**: Click and hold to move the mascot around
- **Watch**: The mascot will react when you open:
  - Visual Studio Code
  - Chrome/Firefox/Edge
  - File Explorer
- **Wait**: Every 2-5 minutes, it will say something random

### Customizing Phrases

Edit `src/data/phrases.ts` to add your own phrases:

```typescript
export const phrases = {
  idle: ["your phrase here", ...],
  vscode: ["coding time!", ...],
  browser: ["researching?", ...],
  // ...
};
```

### Replacing Mascot Images

Replace these files with your own drawings (256x256 PNG with transparent background):

- `src/assets/mascot_idle.png` - Default idle state
- `src/assets/mascot_talk.png` - When speaking

## Project Structure

```
desktop-mascot/
├── src/                      # Frontend React code
│   ├── App.tsx              # Main app component
│   ├── main.tsx             # Entry point
│   ├── components/
│   │   ├── Mascot.tsx       # Mascot component with drag
│   │   └── SpeechBubble.tsx # Speech bubble UI
│   ├── hooks/
│   │   └── useMascotBrain.ts # Logic for reactions
│   ├── data/
│   │   └── phrases.ts       # All phrases
│   └── assets/
│       ├── mascot_idle.png  # Idle mascot image
│       └── mascot_talk.png  # Talking mascot image
│
├── src-tauri/               # Rust backend
│   ├── src/
│   │   ├── main.rs          # Tauri entry point
│   │   └── window_tracker.rs # Windows API integration
│   ├── tauri.conf.json      # Tauri configuration
│   └── Cargo.toml           # Rust dependencies
│
├── package.json             # Node dependencies
├── vite.config.ts           # Vite configuration
├── tailwind.config.js       # Tailwind CSS config
└── README.md                # This file
```

## Configuration

### Window Settings

Edit `src-tauri/tauri.conf.json` to change window properties:

```json
{
  "windows": [{
    "width": 220,           // Window width
    "height": 220,          // Window height
    "transparent": true,    // Transparent background
    "alwaysOnTop": true,    // Always on top
    "decorations": false,   // No title bar
    "skipTaskbar": true     // Don't show in taskbar
  }]
}
```

### Timing Settings

Edit `src/hooks/useMascotBrain.ts`:

```typescript
const REACTION_COOLDOWN = 20000;  // 20 seconds between reactions
const IDLE_MIN = 120000;          // 2 minutes minimum idle time
const IDLE_MAX = 300000;          // 5 minutes maximum idle time
const SPEECH_DURATION = 5000;     // 5 seconds speech display
```

## How It Works

### Frontend (React)
1. `useMascotBrain` hook listens to events from Rust backend
2. When window changes, it checks if it's a known app (VS Code, browser, etc.)
3. Displays appropriate phrase with cooldown system
4. Random idle comments trigger every 2-5 minutes

### Backend (Rust)
1. `window_tracker.rs` polls active window every 2 seconds using Windows API
2. Gets window title using `GetForegroundWindow` and `GetWindowTextW`
3. Emits `window-changed` event to frontend when title changes
4. Frontend receives event and reacts accordingly

### Animation
- Framer Motion handles smooth animations
- Mascot bounces gently when idle
- Speech bubble fades in/out
- Drag interaction pauses animations

## Troubleshooting

### "Rust not found"
Ensure Rust is installed and in PATH:
```bash
rustc --version
```

### "Build failed"
Install Visual Studio C++ Build Tools (see Prerequisites)

### "WebView2 error"
Install WebView2 Runtime (see Prerequisites)

### Mascot doesn't react to apps
- Check if app titles match in `useMascotBrain.ts`
- Windows API requires exact or partial title match
- Add console.log to debug received titles

### Window not transparent
- Ensure GPU acceleration is enabled
- Try running as administrator
- Check Windows transparency settings

## Customization Ideas

### Add more app detections
Edit `src/hooks/useMascotBrain.ts`:
```typescript
if (title.includes("spotify")) {
  showPhrase(getRandomPhrase("music"));
}
```

### Change mascot size
Edit `src/components/Mascot.tsx`:
```typescript
<img className="w-48 h-48" /> // Change w-48 h-48
```

### Add system tray menu
Uncomment system tray in `tauri.conf.json` and add menu items

### Multiple mascots
Duplicate window config in `tauri.conf.json` with different positions

## Performance

- **Memory**: ~50-80 MB
- **CPU**: <1% idle, ~2% when animating
- **Startup**: 2-3 seconds (after first compile)

## Building for Distribution

Create installer:
```bash
npm run tauri:build
```

Output locations:
- `.exe`: `src-tauri/target/release/desktop-mascot.exe`
- `.msi`: `src-tauri/target/release/bundle/msi/`

## License

Free to use and modify. Replace placeholder assets with your own art!

## Credits

Built with:
- [Tauri](https://tauri.app/)
- [React](https://react.dev/)
- [Vite](https://vitejs.dev/)
- [Tailwind CSS](https://tailwindcss.com/)
- [Framer Motion](https://www.framer.com/motion/)

---

**Enjoy your new desktop companion! 🎉**
