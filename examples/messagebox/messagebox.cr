require "../../src/win32cr"
require "../../src/win32cr/ui/windows_and_messaging"

Win32cr::UI::WindowsAndMessaging::C.MessageBoxW(nil, "Message Box Body".to_utf16, "Title".to_utf16, Win32cr::UI::WindowsAndMessaging::MESSAGEBOX_STYLE::MB_OK)