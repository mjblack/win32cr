require "./../system/com.cr"
require "./../foundation.cr"
require "./../system/windows_programming.cr"

module Win32cr::Storage::FileHistory
  extend self
  FHCFG_E_CORRUPT_CONFIG_FILE = -2147220736_i32
  FHCFG_E_CONFIG_FILE_NOT_FOUND = -2147220735_i32
  FHCFG_E_CONFIG_ALREADY_EXISTS = -2147220734_i32
  FHCFG_E_NO_VALID_CONFIGURATION_LOADED = -2147220733_i32
  FHCFG_E_TARGET_NOT_CONNECTED = -2147220732_i32
  FHCFG_E_CONFIGURATION_PREVIOUSLY_LOADED = -2147220731_i32
  FHCFG_E_TARGET_VERIFICATION_FAILED = -2147220730_i32
  FHCFG_E_TARGET_NOT_CONFIGURED = -2147220729_i32
  FHCFG_E_TARGET_NOT_ENOUGH_FREE_SPACE = -2147220728_i32
  FHCFG_E_TARGET_CANNOT_BE_USED = -2147220727_i32
  FHCFG_E_INVALID_REHYDRATION_STATE = -2147220726_i32
  FHCFG_E_RECOMMENDATION_CHANGE_NOT_ALLOWED = -2147220720_i32
  FHCFG_E_TARGET_REHYDRATED_ELSEWHERE = -2147220719_i32
  FHCFG_E_LEGACY_TARGET_UNSUPPORTED = -2147220718_i32
  FHCFG_E_LEGACY_TARGET_VALIDATION_UNSUPPORTED = -2147220717_i32
  FHCFG_E_LEGACY_BACKUP_USER_EXCLUDED = -2147220716_i32
  FHCFG_E_LEGACY_BACKUP_NOT_FOUND = -2147220715_i32
  FHSVC_E_BACKUP_BLOCKED = -2147219968_i32
  FHSVC_E_NOT_CONFIGURED = -2147219967_i32
  FHSVC_E_CONFIG_DISABLED = -2147219966_i32
  FHSVC_E_CONFIG_DISABLED_GP = -2147219965_i32
  FHSVC_E_FATAL_CONFIG_ERROR = -2147219964_i32
  FHSVC_E_CONFIG_REHYDRATING = -2147219963_i32
  FH_STATE_NOT_TRACKED = 0_u32
  FH_STATE_OFF = 1_u32
  FH_STATE_DISABLED_BY_GP = 2_u32
  FH_STATE_FATAL_CONFIG_ERROR = 3_u32
  FH_STATE_MIGRATING = 4_u32
  FH_STATE_REHYDRATING = 5_u32
  FH_STATE_TARGET_FS_LIMITATION = 13_u32
  FH_STATE_TARGET_ACCESS_DENIED = 14_u32
  FH_STATE_TARGET_VOLUME_DIRTY = 15_u32
  FH_STATE_TARGET_FULL_RETENTION_MAX = 16_u32
  FH_STATE_TARGET_FULL = 17_u32
  FH_STATE_STAGING_FULL = 18_u32
  FH_STATE_TARGET_LOW_SPACE_RETENTION_MAX = 19_u32
  FH_STATE_TARGET_LOW_SPACE = 20_u32
  FH_STATE_TARGET_ABSENT = 21_u32
  FH_STATE_TOO_MUCH_BEHIND = 240_u32
  FH_STATE_NO_ERROR = 255_u32
  FH_STATE_BACKUP_NOT_SUPPORTED = 2064_u32
  FH_STATE_RUNNING = 256_u32

  CLSID_FhConfigMgr = LibC::GUID.new(0xed43bb3c_u32, 0x9e9_u16, 0x498a_u16, StaticArray[0x9d_u8, 0xf6_u8, 0x21_u8, 0x77_u8, 0x24_u8, 0x4c_u8, 0x6d_u8, 0xb4_u8])

  CLSID_FhReassociation = LibC::GUID.new(0x4d728e35_u32, 0x16fa_u16, 0x4320_u16, StaticArray[0x9e_u8, 0x8b_u8, 0xbf_u8, 0xd7_u8, 0x10_u8, 0xa_u8, 0x88_u8, 0x46_u8])

  enum FH_TARGET_PROPERTY_TYPE
    FH_TARGET_NAME = 0_i32
    FH_TARGET_URL = 1_i32
    FH_TARGET_DRIVE_TYPE = 2_i32
    MAX_TARGET_PROPERTY = 3_i32
  end
  enum FH_TARGET_DRIVE_TYPES
    FH_DRIVE_UNKNOWN = 0_i32
    FH_DRIVE_REMOVABLE = 2_i32
    FH_DRIVE_FIXED = 3_i32
    FH_DRIVE_REMOTE = 4_i32
  end
  enum FH_PROTECTED_ITEM_CATEGORY
    FH_FOLDER = 0_i32
    FH_LIBRARY = 1_i32
    MAX_PROTECTED_ITEM_CATEGORY = 2_i32
  end
  enum FH_LOCAL_POLICY_TYPE
    FH_FREQUENCY = 0_i32
    FH_RETENTION_TYPE = 1_i32
    FH_RETENTION_AGE = 2_i32
    MAX_LOCAL_POLICY = 3_i32
  end
  enum FH_RETENTION_TYPES
    FH_RETENTION_DISABLED = 0_i32
    FH_RETENTION_UNLIMITED = 1_i32
    FH_RETENTION_AGE_BASED = 2_i32
    MAX_RETENTION_TYPE = 3_i32
  end
  enum FH_BACKUP_STATUS
    FH_STATUS_DISABLED = 0_i32
    FH_STATUS_DISABLED_BY_GP = 1_i32
    FH_STATUS_ENABLED = 2_i32
    FH_STATUS_REHYDRATING = 3_i32
    MAX_BACKUP_STATUS = 4_i32
  end
  enum FH_DEVICE_VALIDATION_RESULT
    FH_ACCESS_DENIED = 0_i32
    FH_INVALID_DRIVE_TYPE = 1_i32
    FH_READ_ONLY_PERMISSION = 2_i32
    FH_CURRENT_DEFAULT = 3_i32
    FH_NAMESPACE_EXISTS = 4_i32
    FH_TARGET_PART_OF_LIBRARY = 5_i32
    FH_VALID_TARGET = 6_i32
    MAX_VALIDATION_RESULT = 7_i32
  end
  enum FhBackupStopReason
    BackupInvalidStopReason = 0_i32
    BackupLimitUserBusyMachineOnAC = 1_i32
    BackupLimitUserIdleMachineOnDC = 2_i32
    BackupLimitUserBusyMachineOnDC = 3_i32
    BackupCancelled = 4_i32
  end

  @[Extern]
  record IFhTargetVtbl,
    query_interface : Proc(IFhTarget*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFhTarget*, UInt32),
    release : Proc(IFhTarget*, UInt32),
    get_string_property : Proc(IFhTarget*, Win32cr::Storage::FileHistory::FH_TARGET_PROPERTY_TYPE, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_numerical_property : Proc(IFhTarget*, Win32cr::Storage::FileHistory::FH_TARGET_PROPERTY_TYPE, UInt64*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IFhTarget, lpVtbl : IFhTargetVtbl* do
    GUID = LibC::GUID.new(0xd87965fd_u32, 0x2bad_u16, 0x4657_u16, StaticArray[0xbd_u8, 0x3b_u8, 0x95_u8, 0x67_u8, 0xeb_u8, 0x30_u8, 0xc_u8, 0xed_u8])
    def query_interface(this : IFhTarget*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFhTarget*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFhTarget*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_string_property(this : IFhTarget*, property_type : Win32cr::Storage::FileHistory::FH_TARGET_PROPERTY_TYPE, property_value : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_property.call(this, property_type, property_value)
    end
    def get_numerical_property(this : IFhTarget*, property_type : Win32cr::Storage::FileHistory::FH_TARGET_PROPERTY_TYPE, property_value : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_numerical_property.call(this, property_type, property_value)
    end

  end

  @[Extern]
  record IFhScopeIteratorVtbl,
    query_interface : Proc(IFhScopeIterator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFhScopeIterator*, UInt32),
    release : Proc(IFhScopeIterator*, UInt32),
    move_to_next_item : Proc(IFhScopeIterator*, Win32cr::Foundation::HRESULT),
    get_item : Proc(IFhScopeIterator*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IFhScopeIterator, lpVtbl : IFhScopeIteratorVtbl* do
    GUID = LibC::GUID.new(0x3197abce_u32, 0x532a_u16, 0x44c6_u16, StaticArray[0x86_u8, 0x15_u8, 0xf3_u8, 0x66_u8, 0x65_u8, 0x66_u8, 0xa7_u8, 0x20_u8])
    def query_interface(this : IFhScopeIterator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFhScopeIterator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFhScopeIterator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def move_to_next_item(this : IFhScopeIterator*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_to_next_item.call(this)
    end
    def get_item(this : IFhScopeIterator*, item : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_item.call(this, item)
    end

  end

  @[Extern]
  record IFhConfigMgrVtbl,
    query_interface : Proc(IFhConfigMgr*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFhConfigMgr*, UInt32),
    release : Proc(IFhConfigMgr*, UInt32),
    load_configuration : Proc(IFhConfigMgr*, Win32cr::Foundation::HRESULT),
    create_default_configuration : Proc(IFhConfigMgr*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    save_configuration : Proc(IFhConfigMgr*, Win32cr::Foundation::HRESULT),
    add_remove_exclude_rule : Proc(IFhConfigMgr*, Win32cr::Foundation::BOOL, Win32cr::Storage::FileHistory::FH_PROTECTED_ITEM_CATEGORY, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_include_exclude_rules : Proc(IFhConfigMgr*, Win32cr::Foundation::BOOL, Win32cr::Storage::FileHistory::FH_PROTECTED_ITEM_CATEGORY, Void**, Win32cr::Foundation::HRESULT),
    get_local_policy : Proc(IFhConfigMgr*, Win32cr::Storage::FileHistory::FH_LOCAL_POLICY_TYPE, UInt64*, Win32cr::Foundation::HRESULT),
    set_local_policy : Proc(IFhConfigMgr*, Win32cr::Storage::FileHistory::FH_LOCAL_POLICY_TYPE, UInt64, Win32cr::Foundation::HRESULT),
    get_backup_status : Proc(IFhConfigMgr*, Win32cr::Storage::FileHistory::FH_BACKUP_STATUS*, Win32cr::Foundation::HRESULT),
    set_backup_status : Proc(IFhConfigMgr*, Win32cr::Storage::FileHistory::FH_BACKUP_STATUS, Win32cr::Foundation::HRESULT),
    get_default_target : Proc(IFhConfigMgr*, Void**, Win32cr::Foundation::HRESULT),
    validate_target : Proc(IFhConfigMgr*, Win32cr::Foundation::BSTR, Win32cr::Storage::FileHistory::FH_DEVICE_VALIDATION_RESULT*, Win32cr::Foundation::HRESULT),
    provision_and_set_new_target : Proc(IFhConfigMgr*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    change_default_target_recommendation : Proc(IFhConfigMgr*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    query_protection_status : Proc(IFhConfigMgr*, UInt32*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IFhConfigMgr, lpVtbl : IFhConfigMgrVtbl* do
    GUID = LibC::GUID.new(0x6a5fea5b_u32, 0xbf8f_u16, 0x4ee5_u16, StaticArray[0xb8_u8, 0xc3_u8, 0x44_u8, 0xd8_u8, 0xa0_u8, 0xd7_u8, 0x33_u8, 0x1c_u8])
    def query_interface(this : IFhConfigMgr*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFhConfigMgr*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFhConfigMgr*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def load_configuration(this : IFhConfigMgr*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_configuration.call(this)
    end
    def create_default_configuration(this : IFhConfigMgr*, overwrite_if_exists : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_default_configuration.call(this, overwrite_if_exists)
    end
    def save_configuration(this : IFhConfigMgr*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_configuration.call(this)
    end
    def add_remove_exclude_rule(this : IFhConfigMgr*, add : Win32cr::Foundation::BOOL, category : Win32cr::Storage::FileHistory::FH_PROTECTED_ITEM_CATEGORY, item : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_remove_exclude_rule.call(this, add, category, item)
    end
    def get_include_exclude_rules(this : IFhConfigMgr*, include__ : Win32cr::Foundation::BOOL, category : Win32cr::Storage::FileHistory::FH_PROTECTED_ITEM_CATEGORY, iterator : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_include_exclude_rules.call(this, include__, category, iterator)
    end
    def get_local_policy(this : IFhConfigMgr*, local_policy_type : Win32cr::Storage::FileHistory::FH_LOCAL_POLICY_TYPE, policy_value : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_local_policy.call(this, local_policy_type, policy_value)
    end
    def set_local_policy(this : IFhConfigMgr*, local_policy_type : Win32cr::Storage::FileHistory::FH_LOCAL_POLICY_TYPE, policy_value : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_local_policy.call(this, local_policy_type, policy_value)
    end
    def get_backup_status(this : IFhConfigMgr*, backup_status : Win32cr::Storage::FileHistory::FH_BACKUP_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_backup_status.call(this, backup_status)
    end
    def set_backup_status(this : IFhConfigMgr*, backup_status : Win32cr::Storage::FileHistory::FH_BACKUP_STATUS) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_backup_status.call(this, backup_status)
    end
    def get_default_target(this : IFhConfigMgr*, default_target : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_default_target.call(this, default_target)
    end
    def validate_target(this : IFhConfigMgr*, target_url : Win32cr::Foundation::BSTR, validation_result : Win32cr::Storage::FileHistory::FH_DEVICE_VALIDATION_RESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.validate_target.call(this, target_url, validation_result)
    end
    def provision_and_set_new_target(this : IFhConfigMgr*, target_url : Win32cr::Foundation::BSTR, target_name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.provision_and_set_new_target.call(this, target_url, target_name)
    end
    def change_default_target_recommendation(this : IFhConfigMgr*, recommend : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.change_default_target_recommendation.call(this, recommend)
    end
    def query_protection_status(this : IFhConfigMgr*, protection_state : UInt32*, protected_until_time : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_protection_status.call(this, protection_state, protected_until_time)
    end

  end

  @[Extern]
  record IFhReassociationVtbl,
    query_interface : Proc(IFhReassociation*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFhReassociation*, UInt32),
    release : Proc(IFhReassociation*, UInt32),
    validate_target : Proc(IFhReassociation*, Win32cr::Foundation::BSTR, Win32cr::Storage::FileHistory::FH_DEVICE_VALIDATION_RESULT*, Win32cr::Foundation::HRESULT),
    scan_target_for_configurations : Proc(IFhReassociation*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_configuration_details : Proc(IFhReassociation*, UInt32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::FILETIME*, Win32cr::Foundation::HRESULT),
    select_configuration : Proc(IFhReassociation*, UInt32, Win32cr::Foundation::HRESULT),
    perform_reassociation : Proc(IFhReassociation*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IFhReassociation, lpVtbl : IFhReassociationVtbl* do
    GUID = LibC::GUID.new(0x6544a28a_u32, 0xf68d_u16, 0x47ac_u16, StaticArray[0x91_u8, 0xef_u8, 0x16_u8, 0xb2_u8, 0xb3_u8, 0x6a_u8, 0xa3_u8, 0xee_u8])
    def query_interface(this : IFhReassociation*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFhReassociation*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFhReassociation*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def validate_target(this : IFhReassociation*, target_url : Win32cr::Foundation::BSTR, validation_result : Win32cr::Storage::FileHistory::FH_DEVICE_VALIDATION_RESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.validate_target.call(this, target_url, validation_result)
    end
    def scan_target_for_configurations(this : IFhReassociation*, target_url : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.scan_target_for_configurations.call(this, target_url)
    end
    def get_configuration_details(this : IFhReassociation*, index : UInt32, user_name : Win32cr::Foundation::BSTR*, pc_name : Win32cr::Foundation::BSTR*, backup_time : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_configuration_details.call(this, index, user_name, pc_name, backup_time)
    end
    def select_configuration(this : IFhReassociation*, index : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.select_configuration.call(this, index)
    end
    def perform_reassociation(this : IFhReassociation*, overwrite_if_exists : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.perform_reassociation.call(this, overwrite_if_exists)
    end

  end

  def fhServiceOpenPipe(start_service_if_stopped : Win32cr::Foundation::BOOL, pipe : Win32cr::System::WindowsProgramming::FH_SERVICE_PIPE_HANDLE*) : Win32cr::Foundation::HRESULT
    C.FhServiceOpenPipe(start_service_if_stopped, pipe)
  end

  def fhServiceClosePipe(pipe : Win32cr::System::WindowsProgramming::FH_SERVICE_PIPE_HANDLE) : Win32cr::Foundation::HRESULT
    C.FhServiceClosePipe(pipe)
  end

  def fhServiceStartBackup(pipe : Win32cr::System::WindowsProgramming::FH_SERVICE_PIPE_HANDLE, low_priority_io : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
    C.FhServiceStartBackup(pipe, low_priority_io)
  end

  def fhServiceStopBackup(pipe : Win32cr::System::WindowsProgramming::FH_SERVICE_PIPE_HANDLE, stop_tracking : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
    C.FhServiceStopBackup(pipe, stop_tracking)
  end

  def fhServiceReloadConfiguration(pipe : Win32cr::System::WindowsProgramming::FH_SERVICE_PIPE_HANDLE) : Win32cr::Foundation::HRESULT
    C.FhServiceReloadConfiguration(pipe)
  end

  def fhServiceBlockBackup(pipe : Win32cr::System::WindowsProgramming::FH_SERVICE_PIPE_HANDLE) : Win32cr::Foundation::HRESULT
    C.FhServiceBlockBackup(pipe)
  end

  def fhServiceUnblockBackup(pipe : Win32cr::System::WindowsProgramming::FH_SERVICE_PIPE_HANDLE) : Win32cr::Foundation::HRESULT
    C.FhServiceUnblockBackup(pipe)
  end

  @[Link("fhsvcctl")]
  lib C
    # :nodoc:
    fun FhServiceOpenPipe(start_service_if_stopped : Win32cr::Foundation::BOOL, pipe : Win32cr::System::WindowsProgramming::FH_SERVICE_PIPE_HANDLE*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun FhServiceClosePipe(pipe : Win32cr::System::WindowsProgramming::FH_SERVICE_PIPE_HANDLE) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun FhServiceStartBackup(pipe : Win32cr::System::WindowsProgramming::FH_SERVICE_PIPE_HANDLE, low_priority_io : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun FhServiceStopBackup(pipe : Win32cr::System::WindowsProgramming::FH_SERVICE_PIPE_HANDLE, stop_tracking : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun FhServiceReloadConfiguration(pipe : Win32cr::System::WindowsProgramming::FH_SERVICE_PIPE_HANDLE) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun FhServiceBlockBackup(pipe : Win32cr::System::WindowsProgramming::FH_SERVICE_PIPE_HANDLE) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun FhServiceUnblockBackup(pipe : Win32cr::System::WindowsProgramming::FH_SERVICE_PIPE_HANDLE) : Win32cr::Foundation::HRESULT

  end
end