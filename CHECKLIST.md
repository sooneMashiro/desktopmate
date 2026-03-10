# Pre-Flight Checklist ✈️

Before running the mascot, verify everything is ready!

## ✅ Prerequisites Installed

Run these commands to verify:

```bash
# Node.js
node --version
# Should show: v18.x.x or higher

# npm
npm --version
# Should show: 9.x.x or higher

# Rust
rustc --version
# Should show: rustc 1.x.x

# Cargo
cargo --version
# Should show: cargo 1.x.x
```

If any command fails, install the missing prerequisite!

---

## ✅ Project Files

Verify these files exist:

### Root Files
- [ ] `package.json`
- [ ] `package-lock.json`
- [ ] `vite.config.ts`
- [ ] `tsconfig.json`
- [ ] `tailwind.config.js`
- [ ] `postcss.config.js`
- [ ] `index.html`
- [ ] `README.md`
- [ ] `start.bat`

### Source Files
- [ ] `src/main.tsx`
- [ ] `src/App.tsx`
- [ ] `src/index.css`
- [ ] `src/components/Mascot.tsx`
- [ ] `src/components/SpeechBubble.tsx`
- [ ] `src/hooks/useMascotBrain.ts`
- [ ] `src/data/phrases.ts`

### Assets
- [ ] `src/assets/mascot_idle.png`
- [ ] `src/assets/mascot_talk.png`

### Tauri Files
- [ ] `src-tauri/Cargo.toml`
- [ ] `src-tauri/build.rs`
- [ ] `src-tauri/tauri.conf.json`
- [ ] `src-tauri/src/main.rs`
- [ ] `src-tauri/src/window_tracker.rs`

### Icons
- [ ] `src-tauri/icons/32x32.png`
- [ ] `src-tauri/icons/128x128.png`
- [ ] `src-tauri/icons/icon.png`

---

## ✅ Dependencies Installed

```bash
# Check if node_modules exists
dir node_modules
# Should show a list of folders

# If not, run:
npm install
```

---

## ✅ Quick Test

Try running the dev server (without Tauri):

```bash
npm run dev
```

- Should start Vite dev server on http://localhost:1420
- Open in browser to see if React app loads
- Press Ctrl+C to stop

---

## ✅ Ready to Launch!

If all checks pass, you're ready to run:

```bash
npm run tauri:dev
```

Or double-click `start.bat`

---

## 🚨 If Something is Missing

### Missing prerequisites:
See `TROUBLESHOOTING.md` section 1-4

### Missing files:
Re-download or regenerate the project

### Dependencies not installed:
```bash
npm install
```

### Build errors:
```bash
# Clean and reinstall
rmdir /s /q node_modules
rmdir /s /q src-tauri\target
npm install
```

---

## 📊 Expected First Run

1. **Terminal output**:
   ```
   Running BeforeDevCommand: npm run dev
   Compiling tauri v1.5.x
   Compiling desktop-mascot v0.1.0
   ```

2. **Time**: 5-10 minutes (first time only)

3. **Result**: Small purple mascot window appears!

4. **Behavior**:
   - Mascot bounces gently
   - Can be dragged around
   - Will react to VS Code/browsers
   - Shows speech bubbles

---

## 🎉 Success Indicators

You'll know it's working when:

- ✅ Mascot window appears
- ✅ Window is transparent
- ✅ Mascot image is visible
- ✅ You can drag it around
- ✅ It bounces/animates
- ✅ Speech bubble appears (wait 2-5 min or open VS Code)

---

## 📝 Next Steps

After successful launch:

1. **Customize phrases**: Edit `src/data/phrases.ts`
2. **Replace images**: Update `src/assets/mascot_*.png`
3. **Adjust timing**: Edit `src/hooks/useMascotBrain.ts`
4. **Add features**: See `EXTENSIONS.md` for ideas

---

## 🆘 Need Help?

1. Check `TROUBLESHOOTING.md`
2. Read `README.md`
3. Check terminal for error messages
4. Verify all prerequisites are installed

---

**Good luck! 🚀**
