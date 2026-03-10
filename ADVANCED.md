# Advanced Configuration Guide

## Custom App Detection

Add detection for any Windows application by editing `src/hooks/useMascotBrain.ts`:

```typescript
// Add this in the window-changed event listener:
if (title.includes("spotify")) {
  showPhrase("listening to music?");
  setLastReactionTime(Date.now());
}
```

## Custom Phrase Categories

Add new categories in `src/data/phrases.ts`:

```typescript
export interface PhraseCategory {
  idle: string[];
  vscode: string[];
  browser: string[];
  explorer: string[];
  random: string[];
  spotify: string[];  // NEW
  gaming: string[];   // NEW
}

export const phrases: PhraseCategory = {
  // ... existing phrases
  spotify: [
    "nice song!",
    "turn it up!",
    "music time",
  ],
  gaming: [
    "gaming break?",
    "one more round?",
    "gg!",
  ],
};
```

## Window Position

Change initial position in `src-tauri/tauri.conf.json`:

```json
{
  "windows": [{
    "x": 100,    // pixels from left
    "y": 100,    // pixels from top
    "center": false
  }]
}
```

## Mascot Size

Edit `src/components/Mascot.tsx`:

```typescript
<motion.img
  src={isTalking ? mascotTalk : mascotIdle}
  className="w-64 h-64"  // Change from w-48 h-48
/>
```

## Animation Speed

Edit `src/components/Mascot.tsx`:

```typescript
animate={{
  y: isDragging ? 0 : [0, -10, 0],  // Bounce height
}}
transition={{
  y: {
    duration: 1.5,  // Speed (lower = faster)
    repeat: Infinity,
  },
}}
```

## Speech Bubble Style

Edit `src/components/SpeechBubble.tsx`:

```typescript
<motion.div
  className="bg-gradient-to-r from-purple-400 to-pink-400"  // Custom colors
>
```

## Polling Frequency

Change how often the mascot checks active window in `src-tauri/src/window_tracker.rs`:

```rust
thread::sleep(Duration::from_secs(1));  // Check every 1 second instead of 2
```

## Multiple Mascots

Duplicate window config in `src-tauri/tauri.conf.json`:

```json
{
  "windows": [
    {
      "title": "Mascot 1",
      "x": 100,
      "y": 100,
      // ... other settings
    },
    {
      "title": "Mascot 2",
      "x": 300,
      "y": 100,
      // ... other settings
    }
  ]
}
```

## System Tray Icon

Already configured! The mascot appears in system tray.

To add menu items, edit `src-tauri/src/main.rs`:

```rust
use tauri::{CustomMenuItem, SystemTray, SystemTrayMenu, SystemTrayEvent};

fn main() {
    let quit = CustomMenuItem::new("quit".to_string(), "Quit");
    let mute = CustomMenuItem::new("mute".to_string(), "Mute");
    let tray_menu = SystemTrayMenu::new()
        .add_item(mute)
        .add_item(quit);
    
    let system_tray = SystemTray::new().with_menu(tray_menu);

    tauri::Builder::default()
        .system_tray(system_tray)
        .on_system_tray_event(|app, event| match event {
            SystemTrayEvent::MenuItemClick { id, .. } => {
                match id.as_str() {
                    "quit" => {
                        std::process::exit(0);
                    }
                    "mute" => {
                        // Implement mute logic
                    }
                    _ => {}
                }
            }
            _ => {}
        })
        .setup(|app| {
            let app_handle = app.handle();
            window_tracker::start_window_tracker(app_handle);
            Ok(())
        })
        .run(tauri::generate_context!())
        .expect("error while running tauri application");
}
```

## Debug Mode

See what window titles are being detected:

Edit `src/hooks/useMascotBrain.ts`:

```typescript
listen<{ title: string }>("window-changed", (event) => {
  console.log("Window detected:", event.payload.title);  // ADD THIS
  // ... rest of code
});
```

Open DevTools: Right-click mascot → Inspect Element

## Performance Tuning

### Reduce memory usage:
- Use smaller images (128x128 instead of 256x256)
- Disable animations in `Mascot.tsx`
- Increase polling interval in `window_tracker.rs`

### Reduce CPU usage:
- Increase `REACTION_COOLDOWN` to 30000 (30 seconds)
- Increase window polling to 5 seconds
- Disable Framer Motion animations

## Building Optimized Release

```bash
npm run tauri:build -- --release
```

The `.exe` will be optimized and much smaller.

## Auto-start on Windows Boot

1. Build the release version
2. Create shortcut to `.exe`
3. Press `Win + R`, type `shell:startup`
4. Paste shortcut in Startup folder

## Keyboard Shortcuts

Add global shortcuts in `src-tauri/tauri.conf.json`:

```json
{
  "tauri": {
    "allowlist": {
      "globalShortcut": {
        "all": true
      }
    }
  }
}
```

Then in `main.rs`:

```rust
use tauri::GlobalShortcutManager;

app.global_shortcut_manager()
    .register("Ctrl+Shift+M", move || {
        // Toggle mascot visibility
    })
    .unwrap();
```

---

**Experiment and have fun! 🎨**
