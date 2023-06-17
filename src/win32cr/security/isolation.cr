require "../foundation.cr"
require "../system/com.cr"
require "../security.cr"
require "../system/registry.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:shcore.dll")]
@[Link(ldflags: "/DELAYLOAD:isolatedwindowsenvironmentutils.dll")]
@[Link(ldflags: "/DELAYLOAD:userenv.dll")]
{% else %}
@[Link("shcore")]
@[Link("isolatedwindowsenvironmentutils")]
@[Link("userenv")]
{% end %}
lib LibWin32
  CLSID_IsolatedAppLauncher = LibC::GUID.new(0xbc812430_u32, 0xe75e_u16, 0x4fd1_u16, StaticArray[0x96_u8, 0x41_u8, 0x1f_u8, 0x9f_u8, 0x1e_u8, 0x2d_u8, 0x9a_u8, 0x1f_u8])

  struct IsolatedAppLauncherTelemetryParameters
    enable_for_launch : LibC::BOOL
    correlation_guid : Guid
  end


  struct IIsolatedAppLauncherVTbl
    query_interface : Proc(IIsolatedAppLauncher*, Guid*, Void**, HRESULT)
    add_ref : Proc(IIsolatedAppLauncher*, UInt32)
    release : Proc(IIsolatedAppLauncher*, UInt32)
    launch : Proc(IIsolatedAppLauncher*, LibC::LPWSTR, LibC::LPWSTR, IsolatedAppLauncherTelemetryParameters*, HRESULT)
  end

  IIsolatedAppLauncher_GUID = "f686878f-7b42-4cc4-96fb-f4f3b6e3d24d"
  IID_IIsolatedAppLauncher = LibC::GUID.new(0xf686878f_u32, 0x7b42_u16, 0x4cc4_u16, StaticArray[0x96_u8, 0xfb_u8, 0xf4_u8, 0xf3_u8, 0xb6_u8, 0xe3_u8, 0xd2_u8, 0x4d_u8])
  struct IIsolatedAppLauncher
    lpVtbl : IIsolatedAppLauncherVTbl*
  end


  # Params # token : LibC::HANDLE [In],appcontainersid : PSID [In],objectpathlength : UInt32 [In],objectpath : Char* [In],returnlength : UInt32* [In]
  fun GetAppContainerNamedObjectPath(token : LibC::HANDLE, appcontainersid : PSID, objectpathlength : UInt32, objectpath : Char*, returnlength : UInt32*) : LibC::BOOL

  # Params # reserved : Void* [In],isprocessinwdagcontainer : LibC::BOOL* [In]
  fun IsProcessInWDAGContainer(reserved : Void*, isprocessinwdagcontainer : LibC::BOOL*) : HRESULT

  # Params # isprocessinisolatedcontainer : LibC::BOOL* [In]
  fun IsProcessInIsolatedContainer(isprocessinisolatedcontainer : LibC::BOOL*) : HRESULT

  # Params # isprocessinisolatedwindowsenvironment : LibC::BOOL* [In]
  fun IsProcessInIsolatedWindowsEnvironment(isprocessinisolatedwindowsenvironment : LibC::BOOL*) : HRESULT

  # Params # pszappcontainername : LibC::LPWSTR [In],pszdisplayname : LibC::LPWSTR [In],pszdescription : LibC::LPWSTR [In],pcapabilities : SID_AND_ATTRIBUTES* [In],dwcapabilitycount : UInt32 [In],ppsidappcontainersid : PSID* [In]
  fun CreateAppContainerProfile(pszappcontainername : LibC::LPWSTR, pszdisplayname : LibC::LPWSTR, pszdescription : LibC::LPWSTR, pcapabilities : SID_AND_ATTRIBUTES*, dwcapabilitycount : UInt32, ppsidappcontainersid : PSID*) : HRESULT

  # Params # pszappcontainername : LibC::LPWSTR [In]
  fun DeleteAppContainerProfile(pszappcontainername : LibC::LPWSTR) : HRESULT

  # Params # desiredaccess : UInt32 [In],phappcontainerkey : HKEY* [In]
  fun GetAppContainerRegistryLocation(desiredaccess : UInt32, phappcontainerkey : HKEY*) : HRESULT

  # Params # pszappcontainersid : LibC::LPWSTR [In],ppszpath : LibC::LPWSTR* [In]
  fun GetAppContainerFolderPath(pszappcontainersid : LibC::LPWSTR, ppszpath : LibC::LPWSTR*) : HRESULT

  # Params # psidappcontainersid : PSID [In],pszrestrictedappcontainername : LibC::LPWSTR [In],ppsidrestrictedappcontainersid : PSID* [In]
  fun DeriveRestrictedAppContainerSidFromAppContainerSidAndRestrictedName(psidappcontainersid : PSID, pszrestrictedappcontainername : LibC::LPWSTR, ppsidrestrictedappcontainersid : PSID*) : HRESULT

  # Params # pszappcontainername : LibC::LPWSTR [In],ppsidappcontainersid : PSID* [In]
  fun DeriveAppContainerSidFromAppContainerName(pszappcontainername : LibC::LPWSTR, ppsidappcontainersid : PSID*) : HRESULT
end