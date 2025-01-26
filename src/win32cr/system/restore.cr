require "./../foundation.cr"

module Win32cr::System::Restore
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
    APPLICATION_INSTALL = 0_u32
    APPLICATION_UNINSTALL = 1_u32
    DEVICE_DRIVER_INSTALL = 10_u32
    MODIFY_SETTINGS = 12_u32
    CANCELLED_OPERATION = 13_u32
  end
  enum RESTOREPOINTINFO_EVENT_TYPE : UInt32
    BEGIN_NESTED_SYSTEM_CHANGE = 102_u32
    BEGIN_SYSTEM_CHANGE = 100_u32
    END_NESTED_SYSTEM_CHANGE = 103_u32
    END_SYSTEM_CHANGE = 101_u32
  end

  @[Extern]
  struct RESTOREPOINTINFOA
    property dwEventType : Win32cr::System::Restore::RESTOREPOINTINFO_EVENT_TYPE
    property dwRestorePtType : Win32cr::System::Restore::RESTOREPOINTINFO_TYPE
    property llSequenceNumber : Int64
    property szDescription : Win32cr::Foundation::CHAR[64]
    def initialize(@dwEventType : Win32cr::System::Restore::RESTOREPOINTINFO_EVENT_TYPE, @dwRestorePtType : Win32cr::System::Restore::RESTOREPOINTINFO_TYPE, @llSequenceNumber : Int64, @szDescription : Win32cr::Foundation::CHAR[64])
    end
  end

  @[Extern]
  struct RESTOREPOINTINFOW
    property dwEventType : Win32cr::System::Restore::RESTOREPOINTINFO_EVENT_TYPE
    property dwRestorePtType : Win32cr::System::Restore::RESTOREPOINTINFO_TYPE
    property llSequenceNumber : Int64
    property szDescription : UInt16[256]
    def initialize(@dwEventType : Win32cr::System::Restore::RESTOREPOINTINFO_EVENT_TYPE, @dwRestorePtType : Win32cr::System::Restore::RESTOREPOINTINFO_TYPE, @llSequenceNumber : Int64, @szDescription : UInt16[256])
    end
  end

  @[Extern]
  struct RESTOREPTINFOEX_
    property ftCreation : Win32cr::Foundation::FILETIME
    property dwEventType : UInt32
    property dwRestorePtType : UInt32
    property dwRPNum : UInt32
    property szDescription : UInt16[256]
    def initialize(@ftCreation : Win32cr::Foundation::FILETIME, @dwEventType : UInt32, @dwRestorePtType : UInt32, @dwRPNum : UInt32, @szDescription : UInt16[256])
    end
  end

  @[Extern]
  struct STATEMGRSTATUS
    property nStatus : UInt32
    property llSequenceNumber : Int64
    def initialize(@nStatus : UInt32, @llSequenceNumber : Int64)
    end
  end

  @[Link("sfc")]
  lib C
    fun SRSetRestorePointA(pRestorePtSpec : Win32cr::System::Restore::RESTOREPOINTINFOA*, pSMgrStatus : Win32cr::System::Restore::STATEMGRSTATUS*) : Win32cr::Foundation::BOOL

    fun SRSetRestorePointW(pRestorePtSpec : Win32cr::System::Restore::RESTOREPOINTINFOW*, pSMgrStatus : Win32cr::System::Restore::STATEMGRSTATUS*) : Win32cr::Foundation::BOOL

  end
end