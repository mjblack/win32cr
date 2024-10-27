require "./../foundation.cr"
require "./../security.cr"

module Win32cr::System::Mailslots


  @[Link("kernel32")]
  lib C
    fun CreateMailslotA(lpName : Win32cr::Foundation::PSTR, nMaxMessageSize : UInt32, lReadTimeout : UInt32, lpSecurityAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*) : Win32cr::Foundation::HANDLE

    fun CreateMailslotW(lpName : Win32cr::Foundation::PWSTR, nMaxMessageSize : UInt32, lReadTimeout : UInt32, lpSecurityAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*) : Win32cr::Foundation::HANDLE

    fun GetMailslotInfo(hMailslot : Win32cr::Foundation::HANDLE, lpMaxMessageSize : UInt32*, lpNextSize : UInt32*, lpMessageCount : UInt32*, lpReadTimeout : UInt32*) : Win32cr::Foundation::BOOL

    fun SetMailslotInfo(hMailslot : Win32cr::Foundation::HANDLE, lReadTimeout : UInt32) : Win32cr::Foundation::BOOL

  end
end