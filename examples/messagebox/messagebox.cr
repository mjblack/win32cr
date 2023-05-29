require "../../src/win32cr"
require "../../src/win32cr/ui/windowsandmessaging"

LibWin32.MessageBoxW(nil, "Message Box Body".to_utf16, "Title".to_utf16, LibWin32::MESSAGEBOX_STYLE::MB_OK)