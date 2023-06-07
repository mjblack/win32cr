require "../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:advapi32.dll")]
@[Link(ldflags: "/DELAYLOAD:user32.dll")]
{% else %}
@[Link("advapi32")]
@[Link("user32")]
{% end %}
lib LibWin32
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


  enum SHUTDOWN_REASON : UInt32
    SHTDN_REASON_NONE = 0
    SHTDN_REASON_FLAG_COMMENT_REQUIRED = 16777216
    SHTDN_REASON_FLAG_DIRTY_PROBLEM_ID_REQUIRED = 33554432
    SHTDN_REASON_FLAG_CLEAN_UI = 67108864
    SHTDN_REASON_FLAG_DIRTY_UI = 134217728
    SHTDN_REASON_FLAG_MOBILE_UI_RESERVED = 268435456
    SHTDN_REASON_FLAG_USER_DEFINED = 1073741824
    SHTDN_REASON_FLAG_PLANNED = 2147483648
    SHTDN_REASON_MAJOR_OTHER = 0
    SHTDN_REASON_MAJOR_NONE = 0
    SHTDN_REASON_MAJOR_HARDWARE = 65536
    SHTDN_REASON_MAJOR_OPERATINGSYSTEM = 131072
    SHTDN_REASON_MAJOR_SOFTWARE = 196608
    SHTDN_REASON_MAJOR_APPLICATION = 262144
    SHTDN_REASON_MAJOR_SYSTEM = 327680
    SHTDN_REASON_MAJOR_POWER = 393216
    SHTDN_REASON_MAJOR_LEGACY_API = 458752
    SHTDN_REASON_MINOR_OTHER = 0
    SHTDN_REASON_MINOR_NONE = 255
    SHTDN_REASON_MINOR_MAINTENANCE = 1
    SHTDN_REASON_MINOR_INSTALLATION = 2
    SHTDN_REASON_MINOR_UPGRADE = 3
    SHTDN_REASON_MINOR_RECONFIG = 4
    SHTDN_REASON_MINOR_HUNG = 5
    SHTDN_REASON_MINOR_UNSTABLE = 6
    SHTDN_REASON_MINOR_DISK = 7
    SHTDN_REASON_MINOR_PROCESSOR = 8
    SHTDN_REASON_MINOR_NETWORKCARD = 9
    SHTDN_REASON_MINOR_POWER_SUPPLY = 10
    SHTDN_REASON_MINOR_CORDUNPLUGGED = 11
    SHTDN_REASON_MINOR_ENVIRONMENT = 12
    SHTDN_REASON_MINOR_HARDWARE_DRIVER = 13
    SHTDN_REASON_MINOR_OTHERDRIVER = 14
    SHTDN_REASON_MINOR_BLUESCREEN = 15
    SHTDN_REASON_MINOR_SERVICEPACK = 16
    SHTDN_REASON_MINOR_HOTFIX = 17
    SHTDN_REASON_MINOR_SECURITYFIX = 18
    SHTDN_REASON_MINOR_SECURITY = 19
    SHTDN_REASON_MINOR_NETWORK_CONNECTIVITY = 20
    SHTDN_REASON_MINOR_WMI = 21
    SHTDN_REASON_MINOR_SERVICEPACK_UNINSTALL = 22
    SHTDN_REASON_MINOR_HOTFIX_UNINSTALL = 23
    SHTDN_REASON_MINOR_SECURITYFIX_UNINSTALL = 24
    SHTDN_REASON_MINOR_MMC = 25
    SHTDN_REASON_MINOR_SYSTEMRESTORE = 26
    SHTDN_REASON_MINOR_TERMSRV = 32
    SHTDN_REASON_MINOR_DC_PROMOTION = 33
    SHTDN_REASON_MINOR_DC_DEMOTION = 34
    SHTDN_REASON_UNKNOWN = 255
    SHTDN_REASON_LEGACY_API = 2147942400
    SHTDN_REASON_VALID_BIT_MASK = 3238002687
  end

  enum SHUTDOWN_FLAGS : UInt32
    SHUTDOWN_FORCE_OTHERS = 1
    SHUTDOWN_FORCE_SELF = 2
    SHUTDOWN_RESTART = 4
    SHUTDOWN_POWEROFF = 8
    SHUTDOWN_NOREBOOT = 16
    SHUTDOWN_GRACE_OVERRIDE = 32
    SHUTDOWN_INSTALL_UPDATES = 64
    SHUTDOWN_RESTARTAPPS = 128
    SHUTDOWN_SKIP_SVC_PRESHUTDOWN = 256
    SHUTDOWN_HYBRID = 512
    SHUTDOWN_RESTART_BOOTOPTIONS = 1024
    SHUTDOWN_SOFT_REBOOT = 2048
    SHUTDOWN_MOBILE_UI = 4096
    SHUTDOWN_ARSO = 8192
    SHUTDOWN_CHECK_SAFE_FOR_SERVER = 16384
    SHUTDOWN_VAIL_CONTAINER = 32768
    SHUTDOWN_SYSTEM_INITIATED = 65536
  end

  enum EXIT_WINDOWS_FLAGS : UInt32
    EWX_HYBRID_SHUTDOWN = 4194304
    EWX_LOGOFF = 0
    EWX_POWEROFF = 8
    EWX_REBOOT = 2
    EWX_RESTARTAPPS = 64
    EWX_SHUTDOWN = 1
  end


  # Params # lpmachinename : PSTR [In],lpmessage : PSTR [In],dwtimeout : UInt32 [In],bforceappsclosed : LibC::BOOL [In],brebootaftershutdown : LibC::BOOL [In]
  fun InitiateSystemShutdownA(lpmachinename : PSTR, lpmessage : PSTR, dwtimeout : UInt32, bforceappsclosed : LibC::BOOL, brebootaftershutdown : LibC::BOOL) : LibC::BOOL

  # Params # lpmachinename : LibC::LPWSTR [In],lpmessage : LibC::LPWSTR [In],dwtimeout : UInt32 [In],bforceappsclosed : LibC::BOOL [In],brebootaftershutdown : LibC::BOOL [In]
  fun InitiateSystemShutdownW(lpmachinename : LibC::LPWSTR, lpmessage : LibC::LPWSTR, dwtimeout : UInt32, bforceappsclosed : LibC::BOOL, brebootaftershutdown : LibC::BOOL) : LibC::BOOL

  # Params # lpmachinename : PSTR [In]
  fun AbortSystemShutdownA(lpmachinename : PSTR) : LibC::BOOL

  # Params # lpmachinename : LibC::LPWSTR [In]
  fun AbortSystemShutdownW(lpmachinename : LibC::LPWSTR) : LibC::BOOL

  # Params # lpmachinename : PSTR [In],lpmessage : PSTR [In],dwtimeout : UInt32 [In],bforceappsclosed : LibC::BOOL [In],brebootaftershutdown : LibC::BOOL [In],dwreason : SHUTDOWN_REASON [In]
  fun InitiateSystemShutdownExA(lpmachinename : PSTR, lpmessage : PSTR, dwtimeout : UInt32, bforceappsclosed : LibC::BOOL, brebootaftershutdown : LibC::BOOL, dwreason : SHUTDOWN_REASON) : LibC::BOOL

  # Params # lpmachinename : LibC::LPWSTR [In],lpmessage : LibC::LPWSTR [In],dwtimeout : UInt32 [In],bforceappsclosed : LibC::BOOL [In],brebootaftershutdown : LibC::BOOL [In],dwreason : SHUTDOWN_REASON [In]
  fun InitiateSystemShutdownExW(lpmachinename : LibC::LPWSTR, lpmessage : LibC::LPWSTR, dwtimeout : UInt32, bforceappsclosed : LibC::BOOL, brebootaftershutdown : LibC::BOOL, dwreason : SHUTDOWN_REASON) : LibC::BOOL

  # Params # lpmachinename : PSTR [In],lpmessage : PSTR [In],dwgraceperiod : UInt32 [In],dwshutdownflags : SHUTDOWN_FLAGS [In],dwreason : SHUTDOWN_REASON [In]
  fun InitiateShutdownA(lpmachinename : PSTR, lpmessage : PSTR, dwgraceperiod : UInt32, dwshutdownflags : SHUTDOWN_FLAGS, dwreason : SHUTDOWN_REASON) : UInt32

  # Params # lpmachinename : LibC::LPWSTR [In],lpmessage : LibC::LPWSTR [In],dwgraceperiod : UInt32 [In],dwshutdownflags : SHUTDOWN_FLAGS [In],dwreason : SHUTDOWN_REASON [In]
  fun InitiateShutdownW(lpmachinename : LibC::LPWSTR, lpmessage : LibC::LPWSTR, dwgraceperiod : UInt32, dwshutdownflags : SHUTDOWN_FLAGS, dwreason : SHUTDOWN_REASON) : UInt32

  # Params # phiberboot : BOOLEAN* [In],bclearflag : BOOLEAN [In]
  fun CheckForHiberboot(phiberboot : BOOLEAN*, bclearflag : BOOLEAN) : UInt32

  # Params # uflags : EXIT_WINDOWS_FLAGS [In],dwreason : UInt32 [In]
  fun ExitWindowsEx(uflags : EXIT_WINDOWS_FLAGS, dwreason : UInt32) : LibC::BOOL

  # Params # 
  fun LockWorkStation : LibC::BOOL

  # Params # hwnd : LibC::HANDLE [In],pwszreason : LibC::LPWSTR [In]
  fun ShutdownBlockReasonCreate(hwnd : LibC::HANDLE, pwszreason : LibC::LPWSTR) : LibC::BOOL

  # Params # hwnd : LibC::HANDLE [In],pwszbuff : Char* [In],pcchbuff : UInt32* [In]
  fun ShutdownBlockReasonQuery(hwnd : LibC::HANDLE, pwszbuff : Char*, pcchbuff : UInt32*) : LibC::BOOL

  # Params # hwnd : LibC::HANDLE [In]
  fun ShutdownBlockReasonDestroy(hwnd : LibC::HANDLE) : LibC::BOOL
end
