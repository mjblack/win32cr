require "../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:sfc.dll")]
{% else %}
@[Link("sfc")]
{% end %}
lib LibWin32
  MIN_EVENT = 100_u32
  BEGIN_NESTED_SYSTEM_CHANGE_NORP = 104_u32
  MAX_EVENT = 104_u32
  MIN_RPT = 0_u32
  DESKTOP_SETTING = 2_u32
  ACCESSIBILITY_SETTING = 3_u32
  OE_SETTING = 4_u32
  APPLICATION_RUN = 5_u32
  RESTORE = 6_u32
  CHECKPOINT = 7_u32
  WINDOWS_SHUTDOWN = 8_u32
  WINDOWS_BOOT = 9_u32
  FIRSTRUN = 11_u32
  BACKUP_RECOVERY = 14_u32
  BACKUP = 15_u32
  MANUAL_CHECKPOINT = 16_u32
  WINDOWS_UPDATE = 17_u32
  CRITICAL_UPDATE = 18_u32
  MAX_RPT = 18_u32
  MAX_DESC = 64_u32
  MAX_DESC_W = 256_u32


  enum RESTOREPOINTINFO_TYPE : UInt32
    APPLICATION_INSTALL = 0
    APPLICATION_UNINSTALL = 1
    DEVICE_DRIVER_INSTALL = 10
    MODIFY_SETTINGS = 12
    CANCELLED_OPERATION = 13
  end

  enum RESTOREPOINTINFO_EVENT_TYPE : UInt32
    BEGIN_NESTED_SYSTEM_CHANGE = 102
    BEGIN_SYSTEM_CHANGE = 100
    END_NESTED_SYSTEM_CHANGE = 103
    END_SYSTEM_CHANGE = 101
  end

  struct RESTOREPOINTINFOA
    dw_event_type : RESTOREPOINTINFO_EVENT_TYPE
    dw_restore_pt_type : RESTOREPOINTINFO_TYPE
    ll_sequence_number : Int64
    sz_description : CHAR[64]*
  end
  struct RESTOREPOINTINFOW
    dw_event_type : RESTOREPOINTINFO_EVENT_TYPE
    dw_restore_pt_type : RESTOREPOINTINFO_TYPE
    ll_sequence_number : Int64
    sz_description : Char[256]*
  end
  struct RESTOREPTINFOEX
    ft_creation : FILETIME
    dw_event_type : UInt32
    dw_restore_pt_type : UInt32
    dw_rp_num : UInt32
    sz_description : Char[256]*
  end
  struct STATEMGRSTATUS
    n_status : UInt32
    ll_sequence_number : Int64
  end


  # Params # prestoreptspec : RESTOREPOINTINFOA* [In],psmgrstatus : STATEMGRSTATUS* [In]
  fun SRSetRestorePointA(prestoreptspec : RESTOREPOINTINFOA*, psmgrstatus : STATEMGRSTATUS*) : LibC::BOOL

  # Params # prestoreptspec : RESTOREPOINTINFOW* [In],psmgrstatus : STATEMGRSTATUS* [In]
  fun SRSetRestorePointW(prestoreptspec : RESTOREPOINTINFOW*, psmgrstatus : STATEMGRSTATUS*) : LibC::BOOL
end
