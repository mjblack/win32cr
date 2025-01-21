require "./../foundation.cr"

module Win32cr::System::Shutdown
  MAX_REASON_NAME_LEN = 64_u32
  MAX_REASON_DESC_LEN = 256_u32
  MAX_REASON_BUGID_LEN = 32_u32
  MAX_REASON_COMMENT_LEN = 512_u32
  SHUTDOWN_TYPE_LEN = 32_u32
  POLICY_SHOWREASONUI_NEVER = 0_u32
  POLICY_SHOWREASONUI_ALWAYS = 1_u32
  POLICY_SHOWREASONUI_WORKSTATIONONLY = 2_u32
  POLICY_SHOWREASONUI_SERVERONLY = 3_u32
  SNAPSHOT_POLICY_NEVER = 0_u32
  SNAPSHOT_POLICY_ALWAYS = 1_u32
  SNAPSHOT_POLICY_UNPLANNED = 2_u32
  MAX_NUM_REASONS = 256_u32

  @[Flags]
  enum SHUTDOWN_REASON : UInt32
    SHTDN_REASON_NONE = 0_u32
    SHTDN_REASON_FLAG_COMMENT_REQUIRED = 16777216_u32
    SHTDN_REASON_FLAG_DIRTY_PROBLEM_ID_REQUIRED = 33554432_u32
    SHTDN_REASON_FLAG_CLEAN_UI = 67108864_u32
    SHTDN_REASON_FLAG_DIRTY_UI = 134217728_u32
    SHTDN_REASON_FLAG_MOBILE_UI_RESERVED = 268435456_u32
    SHTDN_REASON_FLAG_USER_DEFINED = 1073741824_u32
    SHTDN_REASON_FLAG_PLANNED = 2147483648_u32
    SHTDN_REASON_MAJOR_OTHER = 0_u32
    SHTDN_REASON_MAJOR_NONE = 0_u32
    SHTDN_REASON_MAJOR_HARDWARE = 65536_u32
    SHTDN_REASON_MAJOR_OPERATINGSYSTEM = 131072_u32
    SHTDN_REASON_MAJOR_SOFTWARE = 196608_u32
    SHTDN_REASON_MAJOR_APPLICATION = 262144_u32
    SHTDN_REASON_MAJOR_SYSTEM = 327680_u32
    SHTDN_REASON_MAJOR_POWER = 393216_u32
    SHTDN_REASON_MAJOR_LEGACY_API = 458752_u32
    SHTDN_REASON_MINOR_OTHER = 0_u32
    SHTDN_REASON_MINOR_NONE = 255_u32
    SHTDN_REASON_MINOR_MAINTENANCE = 1_u32
    SHTDN_REASON_MINOR_INSTALLATION = 2_u32
    SHTDN_REASON_MINOR_UPGRADE = 3_u32
    SHTDN_REASON_MINOR_RECONFIG = 4_u32
    SHTDN_REASON_MINOR_HUNG = 5_u32
    SHTDN_REASON_MINOR_UNSTABLE = 6_u32
    SHTDN_REASON_MINOR_DISK = 7_u32
    SHTDN_REASON_MINOR_PROCESSOR = 8_u32
    SHTDN_REASON_MINOR_NETWORKCARD = 9_u32
    SHTDN_REASON_MINOR_POWER_SUPPLY = 10_u32
    SHTDN_REASON_MINOR_CORDUNPLUGGED = 11_u32
    SHTDN_REASON_MINOR_ENVIRONMENT = 12_u32
    SHTDN_REASON_MINOR_HARDWARE_DRIVER = 13_u32
    SHTDN_REASON_MINOR_OTHERDRIVER = 14_u32
    SHTDN_REASON_MINOR_BLUESCREEN = 15_u32
    SHTDN_REASON_MINOR_SERVICEPACK = 16_u32
    SHTDN_REASON_MINOR_HOTFIX = 17_u32
    SHTDN_REASON_MINOR_SECURITYFIX = 18_u32
    SHTDN_REASON_MINOR_SECURITY = 19_u32
    SHTDN_REASON_MINOR_NETWORK_CONNECTIVITY = 20_u32
    SHTDN_REASON_MINOR_WMI = 21_u32
    SHTDN_REASON_MINOR_SERVICEPACK_UNINSTALL = 22_u32
    SHTDN_REASON_MINOR_HOTFIX_UNINSTALL = 23_u32
    SHTDN_REASON_MINOR_SECURITYFIX_UNINSTALL = 24_u32
    SHTDN_REASON_MINOR_MMC = 25_u32
    SHTDN_REASON_MINOR_SYSTEMRESTORE = 26_u32
    SHTDN_REASON_MINOR_TERMSRV = 32_u32
    SHTDN_REASON_MINOR_DC_PROMOTION = 33_u32
    SHTDN_REASON_MINOR_DC_DEMOTION = 34_u32
    SHTDN_REASON_UNKNOWN = 255_u32
    SHTDN_REASON_LEGACY_API = 2147942400_u32
    SHTDN_REASON_VALID_BIT_MASK = 3238002687_u32
  end
  @[Flags]
  enum SHUTDOWN_FLAGS : UInt32
    SHUTDOWN_FORCE_OTHERS = 1_u32
    SHUTDOWN_FORCE_SELF = 2_u32
    SHUTDOWN_RESTART = 4_u32
    SHUTDOWN_POWEROFF = 8_u32
    SHUTDOWN_NOREBOOT = 16_u32
    SHUTDOWN_GRACE_OVERRIDE = 32_u32
    SHUTDOWN_INSTALL_UPDATES = 64_u32
    SHUTDOWN_RESTARTAPPS = 128_u32
    SHUTDOWN_SKIP_SVC_PRESHUTDOWN = 256_u32
    SHUTDOWN_HYBRID = 512_u32
    SHUTDOWN_RESTART_BOOTOPTIONS = 1024_u32
    SHUTDOWN_SOFT_REBOOT = 2048_u32
    SHUTDOWN_MOBILE_UI = 4096_u32
    SHUTDOWN_ARSO = 8192_u32
    SHUTDOWN_CHECK_SAFE_FOR_SERVER = 16384_u32
    SHUTDOWN_VAIL_CONTAINER = 32768_u32
    SHUTDOWN_SYSTEM_INITIATED = 65536_u32
  end
  enum EXIT_WINDOWS_FLAGS : UInt32
    EWX_HYBRID_SHUTDOWN = 4194304_u32
    EWX_LOGOFF = 0_u32
    EWX_POWEROFF = 8_u32
    EWX_REBOOT = 2_u32
    EWX_RESTARTAPPS = 64_u32
    EWX_SHUTDOWN = 1_u32
  end

  @[Link("advapi32")]
  @[Link("user32")]
  lib C
    fun InitiateSystemShutdownA(lpMachineName : Win32cr::Foundation::PSTR, lpMessage : Win32cr::Foundation::PSTR, dwTimeout : UInt32, bForceAppsClosed : Win32cr::Foundation::BOOL, bRebootAfterShutdown : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun InitiateSystemShutdownW(lpMachineName : Win32cr::Foundation::PWSTR, lpMessage : Win32cr::Foundation::PWSTR, dwTimeout : UInt32, bForceAppsClosed : Win32cr::Foundation::BOOL, bRebootAfterShutdown : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun AbortSystemShutdownA(lpMachineName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    fun AbortSystemShutdownW(lpMachineName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    fun InitiateSystemShutdownExA(lpMachineName : Win32cr::Foundation::PSTR, lpMessage : Win32cr::Foundation::PSTR, dwTimeout : UInt32, bForceAppsClosed : Win32cr::Foundation::BOOL, bRebootAfterShutdown : Win32cr::Foundation::BOOL, dwReason : Win32cr::System::Shutdown::SHUTDOWN_REASON) : Win32cr::Foundation::BOOL

    fun InitiateSystemShutdownExW(lpMachineName : Win32cr::Foundation::PWSTR, lpMessage : Win32cr::Foundation::PWSTR, dwTimeout : UInt32, bForceAppsClosed : Win32cr::Foundation::BOOL, bRebootAfterShutdown : Win32cr::Foundation::BOOL, dwReason : Win32cr::System::Shutdown::SHUTDOWN_REASON) : Win32cr::Foundation::BOOL

    fun InitiateShutdownA(lpMachineName : Win32cr::Foundation::PSTR, lpMessage : Win32cr::Foundation::PSTR, dwGracePeriod : UInt32, dwShutdownFlags : Win32cr::System::Shutdown::SHUTDOWN_FLAGS, dwReason : Win32cr::System::Shutdown::SHUTDOWN_REASON) : UInt32

    fun InitiateShutdownW(lpMachineName : Win32cr::Foundation::PWSTR, lpMessage : Win32cr::Foundation::PWSTR, dwGracePeriod : UInt32, dwShutdownFlags : Win32cr::System::Shutdown::SHUTDOWN_FLAGS, dwReason : Win32cr::System::Shutdown::SHUTDOWN_REASON) : UInt32

    fun CheckForHiberboot(pHiberboot : Win32cr::Foundation::BOOLEAN*, bClearFlag : Win32cr::Foundation::BOOLEAN) : UInt32

    fun ExitWindowsEx(uFlags : Win32cr::System::Shutdown::EXIT_WINDOWS_FLAGS, dwReason : Win32cr::System::Shutdown::SHUTDOWN_REASON) : Win32cr::Foundation::BOOL

    fun LockWorkStation : Win32cr::Foundation::BOOL

    fun ShutdownBlockReasonCreate(hWnd : Win32cr::Foundation::HWND, pwszReason : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    fun ShutdownBlockReasonQuery(hWnd : Win32cr::Foundation::HWND, pwszBuff : UInt16*, pcchBuff : UInt32*) : Win32cr::Foundation::BOOL

    fun ShutdownBlockReasonDestroy(hWnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::BOOL

  end
end