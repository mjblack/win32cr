require "../../src/win32cr"
require "../../src/win32cr/system/com"

Win32cr::System::Com::C.CoInitializeEx(nil, Win32cr::System::Com::COINIT::COINIT_APARTMENTTHREADED | Win32cr::System::Com::COINIT::COINIT_DISABLE_OLE1DDE)

begin
  com = Win32cr::ComPtr(Win32cr::UI::Shell::IFileOpenDialog).new(Win32cr::UI::Shell::CLSID_FileOpenDialog, Win32cr::UI::Shell::IFileOpenDialog::GUID)
  com.show(Pointer(Void).null)
rescue e
  puts e.message
end

Win32cr::System::Com::C.CoUninitialize