#![cfg_attr(not(debug_assertions), windows_subsystem = "windows")]

mod window_tracker;

use tauri::{CustomMenuItem, SystemTray, SystemTrayMenu, SystemTrayEvent, Manager};

fn main() {
    let quit = CustomMenuItem::new("quit".to_string(), "Fechar Mascote");
    let show = CustomMenuItem::new("show".to_string(), "Mostrar");
    let hide = CustomMenuItem::new("hide".to_string(), "Esconder");
    
    let tray_menu = SystemTrayMenu::new()
        .add_item(show)
        .add_item(hide)
        .add_native_item(tauri::SystemTrayMenuItem::Separator)
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
                    "show" => {
                        let window = app.get_window("main").unwrap();
                        window.show().unwrap();
                    }
                    "hide" => {
                        let window = app.get_window("main").unwrap();
                        window.hide().unwrap();
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
