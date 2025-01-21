# Based on code from @cyberarm on GitHub and Matthew J. Black.
# Original code just displayed the dialog but nothing else. This code
# will display the dialog box and will display the result from the
# get_display_name method and then display the selected file or directory.
require "../../src/win32cr"
require "../../src/win32cr/system/com"
require "../../src/win32cr/ui/shell"

Win32cr::System::Com::C.CoInitializeEx(nil, Win32cr::System::Com::COINIT::COINIT_APARTMENTTHREADED | Win32cr::System::Com::COINIT::COINIT_DISABLE_OLE1DDE)

begin
  com = Win32cr::ComPtr(Win32cr::UI::Shell::IFileOpenDialog).new(Win32cr::UI::Shell::CLSID_FileOpenDialog, Win32cr::UI::Shell::IFileOpenDialog::GUID)
  default_flags = Win32cr::UI::Shell::FILEOPENDIALOGOPTIONS::None
  com.get_options(pointerof(default_flags))
  com.set_options((default_flags | Win32cr::UI::Shell::FILEOPENDIALOGOPTIONS::FOS_PATHMUSTEXIST | Win32cr::UI::Shell::FILEOPENDIALOGOPTIONS::FOS_PICKFOLDERS))
  com.show(Pointer(Void).null)

  vitem = Pointer(Void).malloc(sizeof(Win32cr::UI::Shell::IShellItem))
  buffer = Pointer(UInt16).malloc(sizeof(UInt16))
  if com.get_folder(pointerof(vitem))
    item = vitem.unsafe_as(Pointer(Win32cr::UI::Shell::IShellItem))
    result = item.value.get_display_name(item, Win32cr::UI::Shell::SIGDN::SIGDN_FILESYSPATH, pointerof(buffer))
    pp "Result is #{result}"
    pp "File/Dir selected is #{String.from_utf16(buffer)[0]}"
  else
    puts "Failed."
  end
rescue e
  puts e.message
end

at_exit {
  Win32cr::System::Com::C.CoUninitialize
}
