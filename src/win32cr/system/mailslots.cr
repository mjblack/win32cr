require "./../foundation.cr"
require "./../security.cr"

module Win32cr::System::Mailslots
  extend self


  def createMailslotA(lpName : Win32cr::Foundation::PSTR, nMaxMessageSize : UInt32, lReadTimeout : UInt32, lpSecurityAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*) : Win32cr::Foundation::HANDLE
    C.CreateMailslotA(lpName, nMaxMessageSize, lReadTimeout, lpSecurityAttributes)
  end

  def createMailslotW(lpName : Win32cr::Foundation::PWSTR, nMaxMessageSize : UInt32, lReadTimeout : UInt32, lpSecurityAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*) : Win32cr::Foundation::HANDLE
    C.CreateMailslotW(lpName, nMaxMessageSize, lReadTimeout, lpSecurityAttributes)
  end

  def getMailslotInfo(hMailslot : Win32cr::Foundation::HANDLE, lpMaxMessageSize : UInt32*, lpNextSize : UInt32*, lpMessageCount : UInt32*, lpReadTimeout : UInt32*) : Win32cr::Foundation::BOOL
    C.GetMailslotInfo(hMailslot, lpMaxMessageSize, lpNextSize, lpMessageCount, lpReadTimeout)
  end

  def setMailslotInfo(hMailslot : Win32cr::Foundation::HANDLE, lReadTimeout : UInt32) : Win32cr::Foundation::BOOL
    C.SetMailslotInfo(hMailslot, lReadTimeout)
  end

  @[Link("kernel32")]
  lib C
    # :nodoc:
    fun CreateMailslotA(lpName : Win32cr::Foundation::PSTR, nMaxMessageSize : UInt32, lReadTimeout : UInt32, lpSecurityAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun CreateMailslotW(lpName : Win32cr::Foundation::PWSTR, nMaxMessageSize : UInt32, lReadTimeout : UInt32, lpSecurityAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun GetMailslotInfo(hMailslot : Win32cr::Foundation::HANDLE, lpMaxMessageSize : UInt32*, lpNextSize : UInt32*, lpMessageCount : UInt32*, lpReadTimeout : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetMailslotInfo(hMailslot : Win32cr::Foundation::HANDLE, lReadTimeout : UInt32) : Win32cr::Foundation::BOOL

  end
end