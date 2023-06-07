require "../foundation.cr"
require "../security.cr"
require "../security/authorization/ui.cr"
require "../ui/controls.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:dssec.dll")]
{% else %}
@[Link("dssec")]
{% end %}
lib LibWin32
  DSSI_READ_ONLY = 1_u32
  DSSI_NO_ACCESS_CHECK = 2_u32
  DSSI_NO_EDIT_SACL = 4_u32
  DSSI_NO_EDIT_OWNER = 8_u32
  DSSI_IS_ROOT = 16_u32
  DSSI_NO_FILTER = 32_u32
  DSSI_NO_READONLY_MESSAGE = 64_u32

  alias PFNREADOBJECTSECURITY = Proc(LibC::LPWSTR, UInt32, SECURITY_DESCRIPTOR**, LPARAM, HRESULT)
  alias PFNWRITEOBJECTSECURITY = Proc(LibC::LPWSTR, UInt32, SECURITY_DESCRIPTOR*, LPARAM, HRESULT)
  alias PFNDSCREATEISECINFO = Proc(LibC::LPWSTR, LibC::LPWSTR, UInt32, ISecurityInformation*, PFNREADOBJECTSECURITY, PFNWRITEOBJECTSECURITY, LPARAM, HRESULT)
  alias PFNDSCREATEISECINFOEX = Proc(LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, UInt32, ISecurityInformation*, PFNREADOBJECTSECURITY, PFNWRITEOBJECTSECURITY, LPARAM, HRESULT)
  alias PFNDSCREATESECPAGE = Proc(LibC::LPWSTR, LibC::LPWSTR, UInt32, HPROPSHEETPAGE*, PFNREADOBJECTSECURITY, PFNWRITEOBJECTSECURITY, LPARAM, HRESULT)
  alias PFNDSEDITSECURITY = Proc(LibC::HANDLE, LibC::LPWSTR, LibC::LPWSTR, UInt32, LibC::LPWSTR, PFNREADOBJECTSECURITY, PFNWRITEOBJECTSECURITY, LPARAM, HRESULT)


  # Params # pwszobjectpath : LibC::LPWSTR [In],pwszobjectclass : LibC::LPWSTR [In],dwflags : UInt32 [In],ppsi : ISecurityInformation* [In],pfnreadsd : PFNREADOBJECTSECURITY [In],pfnwritesd : PFNWRITEOBJECTSECURITY [In],lpcontext : LPARAM [In]
  fun DSCreateISecurityInfoObject(pwszobjectpath : LibC::LPWSTR, pwszobjectclass : LibC::LPWSTR, dwflags : UInt32, ppsi : ISecurityInformation*, pfnreadsd : PFNREADOBJECTSECURITY, pfnwritesd : PFNWRITEOBJECTSECURITY, lpcontext : LPARAM) : HRESULT

  # Params # pwszobjectpath : LibC::LPWSTR [In],pwszobjectclass : LibC::LPWSTR [In],pwszserver : LibC::LPWSTR [In],pwszusername : LibC::LPWSTR [In],pwszpassword : LibC::LPWSTR [In],dwflags : UInt32 [In],ppsi : ISecurityInformation* [In],pfnreadsd : PFNREADOBJECTSECURITY [In],pfnwritesd : PFNWRITEOBJECTSECURITY [In],lpcontext : LPARAM [In]
  fun DSCreateISecurityInfoObjectEx(pwszobjectpath : LibC::LPWSTR, pwszobjectclass : LibC::LPWSTR, pwszserver : LibC::LPWSTR, pwszusername : LibC::LPWSTR, pwszpassword : LibC::LPWSTR, dwflags : UInt32, ppsi : ISecurityInformation*, pfnreadsd : PFNREADOBJECTSECURITY, pfnwritesd : PFNWRITEOBJECTSECURITY, lpcontext : LPARAM) : HRESULT

  # Params # pwszobjectpath : LibC::LPWSTR [In],pwszobjectclass : LibC::LPWSTR [In],dwflags : UInt32 [In],phpage : HPROPSHEETPAGE* [In],pfnreadsd : PFNREADOBJECTSECURITY [In],pfnwritesd : PFNWRITEOBJECTSECURITY [In],lpcontext : LPARAM [In]
  fun DSCreateSecurityPage(pwszobjectpath : LibC::LPWSTR, pwszobjectclass : LibC::LPWSTR, dwflags : UInt32, phpage : HPROPSHEETPAGE*, pfnreadsd : PFNREADOBJECTSECURITY, pfnwritesd : PFNWRITEOBJECTSECURITY, lpcontext : LPARAM) : HRESULT

  # Params # hwndowner : LibC::HANDLE [In],pwszobjectpath : LibC::LPWSTR [In],pwszobjectclass : LibC::LPWSTR [In],dwflags : UInt32 [In],pwszcaption : LibC::LPWSTR [In],pfnreadsd : PFNREADOBJECTSECURITY [In],pfnwritesd : PFNWRITEOBJECTSECURITY [In],lpcontext : LPARAM [In]
  fun DSEditSecurity(hwndowner : LibC::HANDLE, pwszobjectpath : LibC::LPWSTR, pwszobjectclass : LibC::LPWSTR, dwflags : UInt32, pwszcaption : LibC::LPWSTR, pfnreadsd : PFNREADOBJECTSECURITY, pfnwritesd : PFNWRITEOBJECTSECURITY, lpcontext : LPARAM) : HRESULT
end
