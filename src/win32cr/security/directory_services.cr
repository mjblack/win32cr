require "./../foundation.cr"
require "./../security.cr"
require "./authorization/ui.cr"
require "./../ui/controls.cr"

module Win32cr::Security::DirectoryServices
  alias PFNREADOBJECTSECURITY = Proc(Win32cr::Foundation::PWSTR, UInt32, Win32cr::Security::PSECURITY_DESCRIPTOR*, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT)

  alias PFNWRITEOBJECTSECURITY = Proc(Win32cr::Foundation::PWSTR, UInt32, Win32cr::Security::PSECURITY_DESCRIPTOR, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT)

  alias PFNDSCREATEISECINFO = Proc(Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, Void**, Win32cr::Security::DirectoryServices::PFNREADOBJECTSECURITY, Win32cr::Security::DirectoryServices::PFNWRITEOBJECTSECURITY, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT)

  alias PFNDSCREATEISECINFOEX = Proc(Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, Void**, Win32cr::Security::DirectoryServices::PFNREADOBJECTSECURITY, Win32cr::Security::DirectoryServices::PFNWRITEOBJECTSECURITY, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT)

  alias PFNDSCREATESECPAGE = Proc(Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, Win32cr::UI::Controls::HPROPSHEETPAGE*, Win32cr::Security::DirectoryServices::PFNREADOBJECTSECURITY, Win32cr::Security::DirectoryServices::PFNWRITEOBJECTSECURITY, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT)

  alias PFNDSEDITSECURITY = Proc(Win32cr::Foundation::HWND, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Security::DirectoryServices::PFNREADOBJECTSECURITY, Win32cr::Security::DirectoryServices::PFNWRITEOBJECTSECURITY, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT)

  DSSI_READ_ONLY = 1_u32
  DSSI_NO_ACCESS_CHECK = 2_u32
  DSSI_NO_EDIT_SACL = 4_u32
  DSSI_NO_EDIT_OWNER = 8_u32
  DSSI_IS_ROOT = 16_u32
  DSSI_NO_FILTER = 32_u32
  DSSI_NO_READONLY_MESSAGE = 64_u32


  @[Link("dssec")]
  lib C
    fun DSCreateISecurityInfoObject(pwszObjectPath : Win32cr::Foundation::PWSTR, pwszObjectClass : Win32cr::Foundation::PWSTR, dwFlags : UInt32, ppSI : Void**, pfnReadSD : Win32cr::Security::DirectoryServices::PFNREADOBJECTSECURITY, pfnWriteSD : Win32cr::Security::DirectoryServices::PFNWRITEOBJECTSECURITY, lpContext : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::HRESULT

    fun DSCreateISecurityInfoObjectEx(pwszObjectPath : Win32cr::Foundation::PWSTR, pwszObjectClass : Win32cr::Foundation::PWSTR, pwszServer : Win32cr::Foundation::PWSTR, pwszUserName : Win32cr::Foundation::PWSTR, pwszPassword : Win32cr::Foundation::PWSTR, dwFlags : UInt32, ppSI : Void**, pfnReadSD : Win32cr::Security::DirectoryServices::PFNREADOBJECTSECURITY, pfnWriteSD : Win32cr::Security::DirectoryServices::PFNWRITEOBJECTSECURITY, lpContext : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::HRESULT

    fun DSCreateSecurityPage(pwszObjectPath : Win32cr::Foundation::PWSTR, pwszObjectClass : Win32cr::Foundation::PWSTR, dwFlags : UInt32, phPage : Win32cr::UI::Controls::HPROPSHEETPAGE*, pfnReadSD : Win32cr::Security::DirectoryServices::PFNREADOBJECTSECURITY, pfnWriteSD : Win32cr::Security::DirectoryServices::PFNWRITEOBJECTSECURITY, lpContext : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::HRESULT

    fun DSEditSecurity(hwndOwner : Win32cr::Foundation::HWND, pwszObjectPath : Win32cr::Foundation::PWSTR, pwszObjectClass : Win32cr::Foundation::PWSTR, dwFlags : UInt32, pwszCaption : Win32cr::Foundation::PWSTR, pfnReadSD : Win32cr::Security::DirectoryServices::PFNREADOBJECTSECURITY, pfnWriteSD : Win32cr::Security::DirectoryServices::PFNWRITEOBJECTSECURITY, lpContext : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::HRESULT

  end
end