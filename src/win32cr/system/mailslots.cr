require "../foundation.cr"
require "../security.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
{% else %}
{% end %}
lib LibWin32

  # Params # lpname : PSTR [In],nmaxmessagesize : UInt32 [In],lreadtimeout : UInt32 [In],lpsecurityattributes : SECURITY_ATTRIBUTES* [In]
  fun CreateMailslotA(lpname : PSTR, nmaxmessagesize : UInt32, lreadtimeout : UInt32, lpsecurityattributes : SECURITY_ATTRIBUTES*) : LibC::HANDLE

  # Params # lpname : LibC::LPWSTR [In],nmaxmessagesize : UInt32 [In],lreadtimeout : UInt32 [In],lpsecurityattributes : SECURITY_ATTRIBUTES* [In]
  fun CreateMailslotW(lpname : LibC::LPWSTR, nmaxmessagesize : UInt32, lreadtimeout : UInt32, lpsecurityattributes : SECURITY_ATTRIBUTES*) : LibC::HANDLE

  # Params # hmailslot : LibC::HANDLE [In],lpmaxmessagesize : UInt32* [In],lpnextsize : UInt32* [In],lpmessagecount : UInt32* [In],lpreadtimeout : UInt32* [In]
  fun GetMailslotInfo(hmailslot : LibC::HANDLE, lpmaxmessagesize : UInt32*, lpnextsize : UInt32*, lpmessagecount : UInt32*, lpreadtimeout : UInt32*) : LibC::BOOL

  # Params # hmailslot : LibC::HANDLE [In],lreadtimeout : UInt32 [In]
  fun SetMailslotInfo(hmailslot : LibC::HANDLE, lreadtimeout : UInt32) : LibC::BOOL
end
