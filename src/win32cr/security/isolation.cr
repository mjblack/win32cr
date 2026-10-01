require "./../foundation.cr"
require "./../system/com.cr"
require "./../security.cr"
require "./../system/registry.cr"

module Win32cr::Security::Isolation
  extend self
  WDAG_CLIPBOARD_TAG = "CrossIsolatedEnvironmentContent"

  CLSID_IsolatedAppLauncher = LibC::GUID.new(0xbc812430_u32, 0xe75e_u16, 0x4fd1_u16, StaticArray[0x96_u8, 0x41_u8, 0x1f_u8, 0x9f_u8, 0x1e_u8, 0x2d_u8, 0x9a_u8, 0x1f_u8])


  @[Extern]
  struct IsolatedAppLauncherTelemetryParameters
    property enable_for_launch : Win32cr::Foundation::BOOL
    property correlation_guid : LibC::GUID
    def initialize(@enable_for_launch : Win32cr::Foundation::BOOL, @correlation_guid : LibC::GUID)
    end
  end

  @[Extern]

  record IIsolatedAppLauncherVtable,
    query_interface : Proc(IIsolatedAppLauncher*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IIsolatedAppLauncher*, UInt32),
    release : Proc(IIsolatedAppLauncher*, UInt32),
    launch : Proc(IIsolatedAppLauncher*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Security::Isolation::IsolatedAppLauncherTelemetryParameters*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IIsolatedAppLauncher, lpVtbl : IIsolatedAppLauncherVtable* do
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

  @[Extern]

  record IIsolatedProcessLauncherVtable,
    query_interface : Proc(IIsolatedProcessLauncher*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IIsolatedProcessLauncher*, UInt32),
    release : Proc(IIsolatedProcessLauncher*, UInt32),
    launch_process : Proc(IIsolatedProcessLauncher*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    share_directory : Proc(IIsolatedProcessLauncher*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_container_guid : Proc(IIsolatedProcessLauncher*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    allow_set_foreground_access : Proc(IIsolatedProcessLauncher*, UInt32, Win32cr::Foundation::HRESULT),
    is_container_running : Proc(IIsolatedProcessLauncher*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IIsolatedProcessLauncher, lpVtbl : IIsolatedProcessLauncherVtable* do
    GUID = LibC::GUID.new(0x1aa24232_u32, 0x9a91_u16, 0x4201_u16, StaticArray[0x88_u8, 0xcb_u8, 0x12_u8, 0x2f_u8, 0x9d_u8, 0x65_u8, 0x22_u8, 0xe0_u8])
    def query_interface(this : IIsolatedProcessLauncher*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IIsolatedProcessLauncher*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IIsolatedProcessLauncher*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def launch_process(this : IIsolatedProcessLauncher*, process : Win32cr::Foundation::PWSTR, arguments : Win32cr::Foundation::PWSTR, workingDirectory : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.launch_process.call(this, process, arguments, workingDirectory)
    end
    def share_directory(this : IIsolatedProcessLauncher*, hostPath : Win32cr::Foundation::PWSTR, containerPath : Win32cr::Foundation::PWSTR, readOnly : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.share_directory.call(this, hostPath, containerPath, readOnly)
    end
    def get_container_guid(this : IIsolatedProcessLauncher*, guid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_container_guid.call(this, guid)
    end
    def allow_set_foreground_access(this : IIsolatedProcessLauncher*, pid : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.allow_set_foreground_access.call(this, pid)
    end
    def is_container_running(this : IIsolatedProcessLauncher*, running : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_container_running.call(this, running)
    end

  end

  @[Extern]

  record IIsolatedProcessLauncher2Vtable,
    query_interface : Proc(IIsolatedProcessLauncher2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IIsolatedProcessLauncher2*, UInt32),
    release : Proc(IIsolatedProcessLauncher2*, UInt32),
    launch_process : Proc(IIsolatedProcessLauncher2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    share_directory : Proc(IIsolatedProcessLauncher2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_container_guid : Proc(IIsolatedProcessLauncher2*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    allow_set_foreground_access : Proc(IIsolatedProcessLauncher2*, UInt32, Win32cr::Foundation::HRESULT),
    is_container_running : Proc(IIsolatedProcessLauncher2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    launch_process2 : Proc(IIsolatedProcessLauncher2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IIsolatedProcessLauncher2, lpVtbl : IIsolatedProcessLauncher2Vtable* do
    GUID = LibC::GUID.new(0x780e4416_u32, 0x5e72_u16, 0x4123_u16, StaticArray[0x80_u8, 0x8e_u8, 0x66_u8, 0xdc_u8, 0x64_u8, 0x79_u8, 0xfe_u8, 0xef_u8])
    def query_interface(this : IIsolatedProcessLauncher2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IIsolatedProcessLauncher2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IIsolatedProcessLauncher2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def launch_process(this : IIsolatedProcessLauncher2*, process : Win32cr::Foundation::PWSTR, arguments : Win32cr::Foundation::PWSTR, workingDirectory : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.launch_process.call(this, process, arguments, workingDirectory)
    end
    def share_directory(this : IIsolatedProcessLauncher2*, hostPath : Win32cr::Foundation::PWSTR, containerPath : Win32cr::Foundation::PWSTR, readOnly : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.share_directory.call(this, hostPath, containerPath, readOnly)
    end
    def get_container_guid(this : IIsolatedProcessLauncher2*, guid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_container_guid.call(this, guid)
    end
    def allow_set_foreground_access(this : IIsolatedProcessLauncher2*, pid : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.allow_set_foreground_access.call(this, pid)
    end
    def is_container_running(this : IIsolatedProcessLauncher2*, running : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_container_running.call(this, running)
    end
    def launch_process2(this : IIsolatedProcessLauncher2*, process : Win32cr::Foundation::PWSTR, arguments : Win32cr::Foundation::PWSTR, workingDirectory : Win32cr::Foundation::PWSTR, correlationGuid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.launch_process2.call(this, process, arguments, workingDirectory, correlationGuid)
    end

  end

  def getAppContainerNamedObjectPath(token : Win32cr::Foundation::HANDLE, app_container_sid : Win32cr::Security::PSID, object_path_length : UInt32, object_path : Win32cr::Foundation::PWSTR, return_length : UInt32*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.GetAppContainerNamedObjectPath(token, app_container_sid, object_path_length, object_path, return_length)
    {% end %}
  end

  def isProcessInWDAGContainer(reserved : Void*, isProcessInWDAGContainer : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.IsProcessInWDAGContainer(reserved, isProcessInWDAGContainer)
    {% end %}
  end

  def isProcessInIsolatedContainer(isProcessInIsolatedContainer : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.IsProcessInIsolatedContainer(isProcessInIsolatedContainer)
    {% end %}
  end

  def isProcessInIsolatedWindowsEnvironment(isProcessInIsolatedWindowsEnvironment : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.IsProcessInIsolatedWindowsEnvironment(isProcessInIsolatedWindowsEnvironment)
    {% end %}
  end

  def isCrossIsolatedEnvironmentClipboardContent(isCrossIsolatedEnvironmentClipboardContent : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.IsCrossIsolatedEnvironmentClipboardContent(isCrossIsolatedEnvironmentClipboardContent)
    {% end %}
  end

  def createAppContainerProfile(pszAppContainerName : Win32cr::Foundation::PWSTR, pszDisplayName : Win32cr::Foundation::PWSTR, pszDescription : Win32cr::Foundation::PWSTR, pCapabilities : Win32cr::Security::SID_AND_ATTRIBUTES*, dwCapabilityCount : UInt32, ppSidAppContainerSid : Win32cr::Security::PSID*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.CreateAppContainerProfile(pszAppContainerName, pszDisplayName, pszDescription, pCapabilities, dwCapabilityCount, ppSidAppContainerSid)
    {% end %}
  end

  def deleteAppContainerProfile(pszAppContainerName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.DeleteAppContainerProfile(pszAppContainerName)
    {% end %}
  end

  def getAppContainerRegistryLocation(desiredAccess : UInt32, phAppContainerKey : Win32cr::System::Registry::HKEY*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.GetAppContainerRegistryLocation(desiredAccess, phAppContainerKey)
    {% end %}
  end

  def getAppContainerFolderPath(pszAppContainerSid : Win32cr::Foundation::PWSTR, ppszPath : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.GetAppContainerFolderPath(pszAppContainerSid, ppszPath)
    {% end %}
  end

  def deriveRestrictedAppContainerSidFromAppContainerSidAndRestrictedName(psidAppContainerSid : Win32cr::Security::PSID, pszRestrictedAppContainerName : Win32cr::Foundation::PWSTR, ppsidRestrictedAppContainerSid : Win32cr::Security::PSID*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.DeriveRestrictedAppContainerSidFromAppContainerSidAndRestrictedName(psidAppContainerSid, pszRestrictedAppContainerName, ppsidRestrictedAppContainerSid)
    {% end %}
  end

  def deriveAppContainerSidFromAppContainerName(pszAppContainerName : Win32cr::Foundation::PWSTR, ppsidAppContainerSid : Win32cr::Security::PSID*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.DeriveAppContainerSidFromAppContainerName(pszAppContainerName, ppsidAppContainerSid)
    {% end %}
  end

  @[Link("kernel32")]
  @[Link("isolatedwindowsenvironmentutils")]
  @[Link("userenv")]
  {% if !flag?(:docs) %}
  lib C
    # :nodoc:
    fun GetAppContainerNamedObjectPath(token : Win32cr::Foundation::HANDLE, app_container_sid : Win32cr::Security::PSID, object_path_length : UInt32, object_path : Win32cr::Foundation::PWSTR, return_length : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun IsProcessInWDAGContainer(reserved : Void*, isProcessInWDAGContainer : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun IsProcessInIsolatedContainer(isProcessInIsolatedContainer : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun IsProcessInIsolatedWindowsEnvironment(isProcessInIsolatedWindowsEnvironment : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun IsCrossIsolatedEnvironmentClipboardContent(isCrossIsolatedEnvironmentClipboardContent : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun CreateAppContainerProfile(pszAppContainerName : Win32cr::Foundation::PWSTR, pszDisplayName : Win32cr::Foundation::PWSTR, pszDescription : Win32cr::Foundation::PWSTR, pCapabilities : Win32cr::Security::SID_AND_ATTRIBUTES*, dwCapabilityCount : UInt32, ppSidAppContainerSid : Win32cr::Security::PSID*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DeleteAppContainerProfile(pszAppContainerName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetAppContainerRegistryLocation(desiredAccess : UInt32, phAppContainerKey : Win32cr::System::Registry::HKEY*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetAppContainerFolderPath(pszAppContainerSid : Win32cr::Foundation::PWSTR, ppszPath : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DeriveRestrictedAppContainerSidFromAppContainerSidAndRestrictedName(psidAppContainerSid : Win32cr::Security::PSID, pszRestrictedAppContainerName : Win32cr::Foundation::PWSTR, ppsidRestrictedAppContainerSid : Win32cr::Security::PSID*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DeriveAppContainerSidFromAppContainerName(pszAppContainerName : Win32cr::Foundation::PWSTR, ppsidAppContainerSid : Win32cr::Security::PSID*) : Win32cr::Foundation::HRESULT

  end
  {% end %}
end