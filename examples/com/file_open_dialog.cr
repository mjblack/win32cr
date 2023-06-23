require "../../src/win32cr"
require "../../src/win32cr/system/com"

hr = LibWin32.CoInitializeEx(nil, LibWin32::COINIT::COINIT_APARTMENTTHREADED | LibWin32::COINIT::COINIT_DISABLE_OLE1DDE)
clsid = pointerof(LibWin32::CLSID_FileOpenDialog)
iid = pointerof(LibWin32::IID_IFileOpenDialog)
com_dialog = Pointer(Void).malloc(sizeof(Void))
hr = LibWin32.CoCreateInstance(clsid, nil, LibWin32::CLSCTX::CLSCTX_ALL, iid, pointerof(com_dialog))

if hr == LibWin32::S_OK
  puts "Successfully created instance"
elsif hr == LibWin32::REGDB_E_CLASSNOTREG
  LibWin32.CoUninitialize
  puts "CoCreateInstance Failed #{hr}: Class not registered"
  exit 1
end

pcom_dialog = com_dialog.unsafe_as(Pointer(LibWin32::IFileOpenDialog))
pcom_dialog.value.show(pcom_dialog, Pointer(Void).null)