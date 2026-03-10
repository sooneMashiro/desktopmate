# 🚀 Quick Start Guide

## Prerequisites Check

Before running, make sure you have:

- ✅ Node.js (v18+)
- ✅ Rust (via rustup)
- ✅ Visual Studio C++ Build Tools
- ✅ WebView2 Runtime

## Installation Commands

```bash
# 1. Navigate to project
cd C:\Users\gabriel.teles\Documents\desktop-mascot

# 2. Install dependencies (already done!)
npm install

# 3. Run the mascot
npm run tauri:dev
```

## Or use the batch file:

Double-click `start.bat` in the project folder!

## First Run

⏱️ **First compilation takes 5-10 minutes** - Rust is compiling all dependencies.  
☕ Grab a coffee!

Subsequent runs will be much faster (2-3 seconds).

## What to Expect

1. A small purple blob mascot will appear on your screen
2. You can drag it around
3. It will bounce gently
4. Open VS Code → it will react
5. Open Chrome/Firefox → it will comment
6. Wait 2-5 minutes → random idle comment

## Customization

### Change phrases:
Edit `src/data/phrases.ts`

### Replace mascot image:
Replace `src/assets/mascot_idle.png` and `mascot_talk.png`

### Adjust timing:
Edit `src/hooks/useMascotBrain.ts`

## Troubleshooting

### "Rust not found"
```bash
winget install Rustlang.Rustup
```

### "Build tools missing"
```bash
winget install Microsoft.VisualStudio.2022.BuildTools
```

### "WebView2 error"
```bash
winget install Microsoft.EdgeWebView2Runtime
```

## Need Help?

Check the full README.md for detailed documentation!

---

**Have fun with your new desktop companion! 🎉**
