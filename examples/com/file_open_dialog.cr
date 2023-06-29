require "../../src/win32cr"
require "../../src/win32cr/system/com"

LibWin32.CoInitializeEx(nil, LibWin32::COINIT::COINIT_APARTMENTTHREADED | LibWin32::COINIT::COINIT_DISABLE_OLE1DDE)

begin
  com = ComPtr(LibWin32::IFileOpenDialog).new(LibWin32::CLSID_FileOpenDialog, LibWin32::IID_IFileOpenDialog)
  com.show(Pointer(Void).null)
rescue e
  puts e.message
end

LibWin32.CoUninitialize