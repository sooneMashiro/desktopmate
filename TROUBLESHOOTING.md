# Troubleshooting Guide

## Common Issues and Solutions

### 1. "npm: command not found"

**Problem**: Node.js is not installed or not in PATH.

**Solution**:
```bash
# Install Node.js
winget install OpenJS.NodeJS

# Or download from: https://nodejs.org/
```

Restart your terminal after installation.

---

### 2. "cargo: command not found" or "Rust not found"

**Problem**: Rust is not installed.

**Solution**:
```bash
# Install Rust
winget install Rustlang.Rustup

# Or visit: https://rustup.rs/
```

Restart your terminal and verify:
```bash
rustc --version
cargo --version
```

---

### 3. "error: linker 'link.exe' not found"

**Problem**: Visual Studio C++ Build Tools not installed.

**Solution**:
```bash
# Install Build Tools
winget install Microsoft.VisualStudio.2022.BuildTools
```

During installation, select:
- ✅ Desktop development with C++
- ✅ MSVC v143 - VS 2022 C++ x64/x86 build tools
- ✅ Windows 10/11 SDK

---

### 4. "WebView2 not found"

**Problem**: WebView2 Runtime is missing.

**Solution**:
```bash
winget install Microsoft.EdgeWebView2Runtime
```

Or download from: https://developer.microsoft.com/microsoft-edge/webview2/

---

### 5. Mascot window is not transparent

**Possible causes**:
- GPU acceleration disabled
- Windows transparency effects disabled
- Running in VM or Remote Desktop

**Solutions**:

1. Enable Windows transparency:
   - Settings → Personalization → Colors
   - Enable "Transparency effects"

2. Try running as administrator:
   ```bash
   # Right-click start.bat → Run as administrator
   ```

3. Check GPU drivers are up to date

---

### 6. Mascot doesn't react to applications

**Problem**: Window detection not working.

**Debug steps**:

1. Add debug logging in `src/hooks/useMascotBrain.ts`:
   ```typescript
   listen<{ title: string }>("window-changed", (event) => {
     console.log("Window:", event.payload.title);  // ADD THIS
     // ... rest of code
   });
   ```

2. Open DevTools:
   - Right-click mascot → Inspect Element
   - Check Console tab for window titles

3. Verify app title matches:
   - Window titles must contain keywords like "Visual Studio Code", "Chrome", etc.
   - Add custom detection if needed

---

### 7. "npm run tauri:dev" fails with Rust errors

**Common Rust compilation errors**:

**Error**: "failed to run custom build command for `windows`"
**Solution**: Update Rust:
```bash
rustup update
```

**Error**: "could not compile `tauri`"
**Solution**: Clear cargo cache:
```bash
cd src-tauri
cargo clean
cd ..
npm run tauri:dev
```

---

### 8. Mascot appears but images are broken

**Problem**: Image paths incorrect or images not found.

**Solution**:

1. Verify images exist:
   ```bash
   dir src\assets\mascot_idle.png
   dir src\assets\mascot_talk.png
   ```

2. Regenerate images if missing (see README)

3. Check import paths in `Mascot.tsx`

---

### 9. Speech bubbles don't appear

**Problem**: Framer Motion not working or timing issues.

**Debug**:

1. Check console for errors
2. Verify `isVisible` state in DevTools React tab
3. Reduce `REACTION_COOLDOWN` temporarily:
   ```typescript
   const REACTION_COOLDOWN = 5000; // 5 seconds for testing
   ```

---

### 10. High CPU usage

**Causes**:
- Too frequent window polling
- Animation running constantly
- Memory leak

**Solutions**:

1. Increase polling interval in `window_tracker.rs`:
   ```rust
   thread::sleep(Duration::from_secs(5)); // Instead of 2
   ```

2. Disable animations temporarily in `Mascot.tsx`:
   ```typescript
   // Comment out animate prop
   // animate={{ y: [0, -5, 0] }}
   ```

3. Check for memory leaks in DevTools Performance tab

---

### 11. "Port 1420 already in use"

**Problem**: Vite dev server port is occupied.

**Solution**:

1. Kill process using port:
   ```bash
   netstat -ano | findstr :1420
   taskkill /PID <PID> /F
   ```

2. Or change port in `vite.config.ts`:
   ```typescript
   server: {
     port: 1421,  // Different port
   }
   ```

---

### 12. Build succeeds but .exe doesn't run

**Problem**: Missing dependencies or antivirus blocking.

**Solutions**:

1. Check antivirus logs
2. Add exception for the .exe
3. Run from command line to see errors:
   ```bash
   cd src-tauri\target\release
   .\desktop-mascot.exe
   ```

4. Ensure WebView2 is installed on target machine

---

### 13. Mascot freezes or becomes unresponsive

**Problem**: Event loop blocked or Rust thread crashed.

**Solutions**:

1. Check Rust logs in terminal
2. Restart the application
3. Check for infinite loops in event handlers
4. Verify window polling thread is running

---

### 14. Can't drag the mascot

**Problem**: Framer Motion drag not working.

**Solutions**:

1. Verify `drag` prop is set:
   ```typescript
   <motion.div drag dragMomentum={false}>
   ```

2. Check CSS doesn't have `pointer-events: none`

3. Ensure window is not maximized or fullscreen

---

### 15. Development mode works but build fails

**Problem**: Build optimization issues.

**Solutions**:

1. Try debug build first:
   ```bash
   npm run tauri:build -- --debug
   ```

2. Check for dynamic imports or runtime dependencies

3. Verify all assets are included in build

---

## Getting More Help

### Enable verbose logging:

**Rust side**:
```bash
$env:RUST_LOG="debug"
npm run tauri:dev
```

**Frontend side**:
Add to `useMascotBrain.ts`:
```typescript
console.log("State:", state);
console.log("Last reaction:", lastReactionTime);
```

### Check versions:
```bash
node --version
npm --version
rustc --version
cargo --version
```

### Clean install:
```bash
# Remove all dependencies
rmdir /s /q node_modules
rmdir /s /q src-tauri\target

# Reinstall
npm install
npm run tauri:dev
```

---

## Still Having Issues?

1. Check the full error message in terminal
2. Search error on GitHub: https://github.com/tauri-apps/tauri/issues
3. Check Tauri documentation: https://tauri.app/
4. Verify all prerequisites are installed correctly

---

**Most issues are related to missing prerequisites or PATH configuration!**
