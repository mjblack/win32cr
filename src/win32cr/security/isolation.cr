require "./../foundation.cr"
require "./../system/com.cr"
require "./../security.cr"
require "./../system/registry.cr"

module Win32cr::Security::Isolation

  CLSID_IsolatedAppLauncher = LibC::GUID.new(0xbc812430_u32, 0xe75e_u16, 0x4fd1_u16, StaticArray[0x96_u8, 0x41_u8, 0x1f_u8, 0x9f_u8, 0x1e_u8, 0x2d_u8, 0x9a_u8, 0x1f_u8])


  @[Extern]
  record IsolatedAppLauncherTelemetryParameters,
    enable_for_launch : Win32cr::Foundation::BOOL,
    correlation_guid : LibC::GUID

  @[Extern]
  record IIsolatedAppLauncherVtbl,
    query_interface : Proc(IIsolatedAppLauncher*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IIsolatedAppLauncher*, UInt32),
    release : Proc(IIsolatedAppLauncher*, UInt32),
    launch : Proc(IIsolatedAppLauncher*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Security::Isolation::IsolatedAppLauncherTelemetryParameters*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f686878f-7b42-4cc4-96fb-f4f3b6e3d24d")]
  record IIsolatedAppLauncher, lpVtbl : IIsolatedAppLauncherVtbl* do
    GUID = LibC::GUID.new(0xf686878f_u32, 0x7b42_u16, 0x4cc4_u16, StaticArray[0x96_u8, 0xfb_u8, 0xf4_u8, 0xf3_u8, 0xb6_u8, 0xe3_u8, 0xd2_u8, 0x4d_u8])
    def query_interface(this : IIsolatedAppLauncher*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IIsolatedAppLauncher*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IIsolatedAppLauncher*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def launch(this : IIsolatedAppLauncher*, appUserModelId : Win32cr::Foundation::PWSTR, arguments : Win32cr::Foundation::PWSTR, telemetryParameters : Win32cr::Security::Isolation::IsolatedAppLauncherTelemetryParameters*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.launch.call(this, appUserModelId, arguments, telemetryParameters)
    end

  end

  @[Link("kernel32")]
  @[Link("api-ms-win-security-isolatedcontainer-l1-1-1")]
  @[Link("api-ms-win-security-isolatedcontainer-l1-1-0")]
  @[Link("isolatedwindowsenvironmentutils")]
  @[Link("userenv")]
  lib C
    fun GetAppContainerNamedObjectPath(token : Win32cr::Foundation::HANDLE, app_container_sid : Win32cr::Foundation::PSID, object_path_length : UInt32, object_path : UInt16*, return_length : UInt32*) : Win32cr::Foundation::BOOL

    fun IsProcessInWDAGContainer(reserved : Void*, isProcessInWDAGContainer : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    fun IsProcessInIsolatedContainer(isProcessInIsolatedContainer : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    fun IsProcessInIsolatedWindowsEnvironment(isProcessInIsolatedWindowsEnvironment : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    fun CreateAppContainerProfile(pszAppContainerName : Win32cr::Foundation::PWSTR, pszDisplayName : Win32cr::Foundation::PWSTR, pszDescription : Win32cr::Foundation::PWSTR, pCapabilities : Win32cr::Security::SID_AND_ATTRIBUTES*, dwCapabilityCount : UInt32, ppSidAppContainerSid : Win32cr::Foundation::PSID*) : Win32cr::Foundation::HRESULT

    fun DeleteAppContainerProfile(pszAppContainerName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun GetAppContainerRegistryLocation(desiredAccess : UInt32, phAppContainerKey : Win32cr::System::Registry::HKEY*) : Win32cr::Foundation::HRESULT

    fun GetAppContainerFolderPath(pszAppContainerSid : Win32cr::Foundation::PWSTR, ppszPath : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun DeriveRestrictedAppContainerSidFromAppContainerSidAndRestrictedName(psidAppContainerSid : Win32cr::Foundation::PSID, pszRestrictedAppContainerName : Win32cr::Foundation::PWSTR, ppsidRestrictedAppContainerSid : Win32cr::Foundation::PSID*) : Win32cr::Foundation::HRESULT

    fun DeriveAppContainerSidFromAppContainerName(pszAppContainerName : Win32cr::Foundation::PWSTR, ppsidAppContainerSid : Win32cr::Foundation::PSID*) : Win32cr::Foundation::HRESULT

  end
end