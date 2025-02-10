require "./../foundation.cr"
require "./../security.cr"

module Win32cr::System::Mailslots
  extend self


  def createMailslotA(lpName : Win32cr::Foundation::PSTR, nMaxMessageSize : UInt32, lReadTimeout : UInt32, lpSecurityAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*) : Win32cr::Foundation::HANDLE
    {% if !flag?(:docs) %}
    C.CreateMailslotA(lpName, nMaxMessageSize, lReadTimeout, lpSecurityAttributes)
    {% end %}
  end

  def createMailslotW(lpName : Win32cr::Foundation::PWSTR, nMaxMessageSize : UInt32, lReadTimeout : UInt32, lpSecurityAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*) : Win32cr::Foundation::HANDLE
    {% if !flag?(:docs) %}
    C.CreateMailslotW(lpName, nMaxMessageSize, lReadTimeout, lpSecurityAttributes)
    {% end %}
  end

  def getMailslotInfo(hMailslot : Win32cr::Foundation::HANDLE, lpMaxMessageSize : UInt32*, lpNextSize : UInt32*, lpMessageCount : UInt32*, lpReadTimeout : UInt32*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.GetMailslotInfo(hMailslot, lpMaxMessageSize, lpNextSize, lpMessageCount, lpReadTimeout)
    {% end %}
  end

  def setMailslotInfo(hMailslot : Win32cr::Foundation::HANDLE, lReadTimeout : UInt32) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SetMailslotInfo(hMailslot, lReadTimeout)
    {% end %}
  end

  @[Link("kernel32")]
  {% if !flag?(:docs) %}
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
  {% end %}
end