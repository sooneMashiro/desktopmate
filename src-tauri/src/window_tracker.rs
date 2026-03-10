use std::thread;
use std::time::Duration;
use tauri::{AppHandle, Manager};

#[cfg(windows)]
use windows::Win32::Foundation::HWND;
#[cfg(windows)]
use windows::Win32::UI::WindowsAndMessaging::{GetForegroundWindow, GetWindowTextW};

#[derive(Clone, serde::Serialize)]
struct WindowChangedPayload {
    title: String,
}

#[cfg(windows)]
fn get_active_window_title() -> String {
    unsafe {
        let hwnd: HWND = GetForegroundWindow();
        if hwnd.0 == 0 {
            return String::new();
        }

        let mut buffer = [0u16; 512];
        let len = GetWindowTextW(hwnd, &mut buffer);
        
        if len > 0 {
            String::from_utf16_lossy(&buffer[..len as usize])
        } else {
            String::new()
        }
    }
}

#[cfg(not(windows))]
fn get_active_window_title() -> String {
    String::from("Unsupported platform")
}

pub fn start_window_tracker(app_handle: AppHandle) {
    thread::spawn(move || {
        let mut last_title = String::new();

        loop {
            thread::sleep(Duration::from_secs(2));

            let current_title = get_active_window_title();

            if !current_title.is_empty() && current_title != last_title {
                last_title = current_title.clone();

                let _ = app_handle.emit_all(
                    "window-changed",
                    WindowChangedPayload {
                        title: current_title,
                    },
                );
            }
        }
    });
}
