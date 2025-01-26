require "./com.cr"
require "./../foundation.cr"

module Win32cr::System::ServerBackup
  WSB_MAX_OB_STATUS_VALUE_TYPE_PAIR = 5_u32
  WSB_MAX_OB_STATUS_ENTRY = 5_u32
  WSBAPP_ASYNC_IN_PROGRESS = 7995396_i32

  enum WSB_OB_STATUS_ENTRY_PAIR_TYPE
    WSB_OB_ET_UNDEFINED = 0_i32
    WSB_OB_ET_STRING = 1_i32
    WSB_OB_ET_NUMBER = 2_i32
    WSB_OB_ET_DATETIME = 3_i32
    WSB_OB_ET_TIME = 4_i32
    WSB_OB_ET_SIZE = 5_i32
    WSB_OB_ET_MAX = 6_i32
  end

  @[Extern]
  struct WSB_OB_STATUS_ENTRY_VALUE_TYPE_PAIR
    property m_wszObStatusEntryPairValue : Win32cr::Foundation::PWSTR
    property m_ObStatusEntryPairType : Win32cr::System::ServerBackup::WSB_OB_STATUS_ENTRY_PAIR_TYPE
    def initialize(@m_wszObStatusEntryPairValue : Win32cr::Foundation::PWSTR, @m_ObStatusEntryPairType : Win32cr::System::ServerBackup::WSB_OB_STATUS_ENTRY_PAIR_TYPE)
    end
  end

  @[Extern]
  struct WSB_OB_STATUS_ENTRY
    property m_dwIcon : UInt32
    property m_dwStatusEntryName : UInt32
    property m_dwStatusEntryValue : UInt32
    property m_cValueTypePair : UInt32
    property m_rgValueTypePair : Win32cr::System::ServerBackup::WSB_OB_STATUS_ENTRY_VALUE_TYPE_PAIR*
    def initialize(@m_dwIcon : UInt32, @m_dwStatusEntryName : UInt32, @m_dwStatusEntryValue : UInt32, @m_cValueTypePair : UInt32, @m_rgValueTypePair : Win32cr::System::ServerBackup::WSB_OB_STATUS_ENTRY_VALUE_TYPE_PAIR*)
    end
  end

  @[Extern]
  struct WSB_OB_STATUS_INFO
    property m_guidSnapinId : LibC::GUID
    property m_cStatusEntry : UInt32
    property m_rgStatusEntry : Win32cr::System::ServerBackup::WSB_OB_STATUS_ENTRY*
    def initialize(@m_guidSnapinId : LibC::GUID, @m_cStatusEntry : UInt32, @m_rgStatusEntry : Win32cr::System::ServerBackup::WSB_OB_STATUS_ENTRY*)
    end
  end

  @[Extern]
  struct WSB_OB_REGISTRATION_INFO
    property m_wszResourceDLL : Win32cr::Foundation::PWSTR
    property m_guidSnapinId : LibC::GUID
    property m_dwProviderName : UInt32
    property m_dwProviderIcon : UInt32
    property m_bSupportsRemoting : Win32cr::Foundation::BOOLEAN
    def initialize(@m_wszResourceDLL : Win32cr::Foundation::PWSTR, @m_guidSnapinId : LibC::GUID, @m_dwProviderName : UInt32, @m_dwProviderIcon : UInt32, @m_bSupportsRemoting : Win32cr::Foundation::BOOLEAN)
    end
  end

  @[Extern]
  record IWsbApplicationBackupSupportVtbl,
    query_interface : Proc(IWsbApplicationBackupSupport*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWsbApplicationBackupSupport*, UInt32),
    release : Proc(IWsbApplicationBackupSupport*, UInt32),
    check_consistency : Proc(IWsbApplicationBackupSupport*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::PWSTR*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWsbApplicationBackupSupport, lpVtbl : IWsbApplicationBackupSupportVtbl* do
    GUID = LibC::GUID.new(0x1eff3510_u32, 0x4a27_u16, 0x46ad_u16, StaticArray[0xb9_u8, 0xe0_u8, 0x8_u8, 0x33_u8, 0x2f_u8, 0xf_u8, 0x4f_u8, 0x6d_u8])
    def query_interface(this : IWsbApplicationBackupSupport*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWsbApplicationBackupSupport*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWsbApplicationBackupSupport*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def check_consistency(this : IWsbApplicationBackupSupport*, wszWriterMetadata : Win32cr::Foundation::PWSTR, wszComponentName : Win32cr::Foundation::PWSTR, wszComponentLogicalPath : Win32cr::Foundation::PWSTR, cVolumes : UInt32, rgwszSourceVolumePath : Win32cr::Foundation::PWSTR*, rgwszSnapshotVolumePath : Win32cr::Foundation::PWSTR*, ppAsync : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.check_consistency.call(this, wszWriterMetadata, wszComponentName, wszComponentLogicalPath, cVolumes, rgwszSourceVolumePath, rgwszSnapshotVolumePath, ppAsync)
    end

  end

  @[Extern]
  record IWsbApplicationRestoreSupportVtbl,
    query_interface : Proc(IWsbApplicationRestoreSupport*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWsbApplicationRestoreSupport*, UInt32),
    release : Proc(IWsbApplicationRestoreSupport*, UInt32),
    pre_restore : Proc(IWsbApplicationRestoreSupport*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOLEAN, Win32cr::Foundation::HRESULT),
    post_restore : Proc(IWsbApplicationRestoreSupport*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOLEAN, Win32cr::Foundation::HRESULT),
    order_components : Proc(IWsbApplicationRestoreSupport*, UInt32, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::PWSTR**, Win32cr::Foundation::PWSTR**, Win32cr::Foundation::HRESULT),
    is_roll_forward_supported : Proc(IWsbApplicationRestoreSupport*, UInt8*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWsbApplicationRestoreSupport, lpVtbl : IWsbApplicationRestoreSupportVtbl* do
    GUID = LibC::GUID.new(0x8d3bdb38_u32, 0x4ee8_u16, 0x4718_u16, StaticArray[0x85_u8, 0xf9_u8, 0xc7_u8, 0xdb_u8, 0xc4_u8, 0xab_u8, 0x77_u8, 0xaa_u8])
    def query_interface(this : IWsbApplicationRestoreSupport*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWsbApplicationRestoreSupport*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWsbApplicationRestoreSupport*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def pre_restore(this : IWsbApplicationRestoreSupport*, wszWriterMetadata : Win32cr::Foundation::PWSTR, wszComponentName : Win32cr::Foundation::PWSTR, wszComponentLogicalPath : Win32cr::Foundation::PWSTR, bNoRollForward : Win32cr::Foundation::BOOLEAN) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pre_restore.call(this, wszWriterMetadata, wszComponentName, wszComponentLogicalPath, bNoRollForward)
    end
    def post_restore(this : IWsbApplicationRestoreSupport*, wszWriterMetadata : Win32cr::Foundation::PWSTR, wszComponentName : Win32cr::Foundation::PWSTR, wszComponentLogicalPath : Win32cr::Foundation::PWSTR, bNoRollForward : Win32cr::Foundation::BOOLEAN) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.post_restore.call(this, wszWriterMetadata, wszComponentName, wszComponentLogicalPath, bNoRollForward)
    end
    def order_components(this : IWsbApplicationRestoreSupport*, cComponents : UInt32, rgComponentName : Win32cr::Foundation::PWSTR*, rgComponentLogicalPaths : Win32cr::Foundation::PWSTR*, prgComponentName : Win32cr::Foundation::PWSTR**, prgComponentLogicalPath : Win32cr::Foundation::PWSTR**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.order_components.call(this, cComponents, rgComponentName, rgComponentLogicalPaths, prgComponentName, prgComponentLogicalPath)
    end
    def is_roll_forward_supported(this : IWsbApplicationRestoreSupport*, pbRollForwardSupported : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_roll_forward_supported.call(this, pbRollForwardSupported)
    end

  end

  @[Extern]
  record IWsbApplicationAsyncVtbl,
    query_interface : Proc(IWsbApplicationAsync*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWsbApplicationAsync*, UInt32),
    release : Proc(IWsbApplicationAsync*, UInt32),
    query_status : Proc(IWsbApplicationAsync*, Win32cr::Foundation::HRESULT*, Win32cr::Foundation::HRESULT),
    abort : Proc(IWsbApplicationAsync*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWsbApplicationAsync, lpVtbl : IWsbApplicationAsyncVtbl* do
    GUID = LibC::GUID.new(0x843f6f7_u32, 0x895c_u16, 0x44a6_u16, StaticArray[0xb0_u8, 0xc2_u8, 0x5_u8, 0xa5_u8, 0x2_u8, 0x2a_u8, 0xa3_u8, 0xa1_u8])
    def query_interface(this : IWsbApplicationAsync*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWsbApplicationAsync*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWsbApplicationAsync*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def query_status(this : IWsbApplicationAsync*, phrResult : Win32cr::Foundation::HRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_status.call(this, phrResult)
    end
    def abort(this : IWsbApplicationAsync*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.abort.call(this)
    end

  end

end