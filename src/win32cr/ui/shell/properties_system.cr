require "./../../system/com.cr"
require "./../../foundation.cr"
require "./../../system/com/structured_storage.cr"
require "./../../system/search/common.cr"
require "./common.cr"

module Win32cr::UI::Shell::PropertiesSystem
  PKEY_PIDSTR_MAX = 10_u32

  CLSID_InMemoryPropertyStore = LibC::GUID.new(0x9a02e012_u32, 0x6303_u16, 0x4e1e_u16, StaticArray[0xb9_u8, 0xa1_u8, 0x63_u8, 0xf_u8, 0x80_u8, 0x25_u8, 0x92_u8, 0xc5_u8])

  CLSID_InMemoryPropertyStoreMarshalByValue = LibC::GUID.new(0xd4ca0e2d_u32, 0x6da7_u16, 0x4b75_u16, StaticArray[0xa9_u8, 0x7c_u8, 0x5f_u8, 0x30_u8, 0x6f_u8, 0xe_u8, 0xae_u8, 0xdc_u8])

  CLSID_PropertySystem = LibC::GUID.new(0xb8967f85_u32, 0x58ae_u16, 0x4f46_u16, StaticArray[0x9f_u8, 0xb2_u8, 0x5d_u8, 0x79_u8, 0x4_u8, 0x79_u8, 0x8f_u8, 0x4b_u8])

  @[Flags]
  enum GETPROPERTYSTOREFLAGS : UInt32
    GPS_DEFAULT = 0_u32
    GPS_HANDLERPROPERTIESONLY = 1_u32
    GPS_READWRITE = 2_u32
    GPS_TEMPORARY = 4_u32
    GPS_FASTPROPERTIESONLY = 8_u32
    GPS_OPENSLOWITEM = 16_u32
    GPS_DELAYCREATION = 32_u32
    GPS_BESTEFFORT = 64_u32
    GPS_NO_OPLOCK = 128_u32
    GPS_PREFERQUERYPROPERTIES = 256_u32
    GPS_EXTRINSICPROPERTIES = 512_u32
    GPS_EXTRINSICPROPERTIESONLY = 1024_u32
    GPS_VOLATILEPROPERTIES = 2048_u32
    GPS_VOLATILEPROPERTIESONLY = 4096_u32
    GPS_MASK_VALID = 8191_u32
  end
  @[Flags]
  enum PKA_FLAGS : UInt32
    PKA_SET = 0_u32
    PKA_APPEND = 1_u32
    PKA_DELETE = 2_u32
  end
  enum PSC_STATE
    PSC_NORMAL = 0_i32
    PSC_NOTINSOURCE = 1_i32
    PSC_DIRTY = 2_i32
    PSC_READONLY = 3_i32
  end
  enum PROPENUMTYPE
    PET_DISCRETEVALUE = 0_i32
    PET_RANGEDVALUE = 1_i32
    PET_DEFAULTVALUE = 2_i32
    PET_ENDRANGE = 3_i32
  end
  @[Flags]
  enum PROPDESC_TYPE_FLAGS : UInt32
    PDTF_DEFAULT = 0_u32
    PDTF_MULTIPLEVALUES = 1_u32
    PDTF_ISINNATE = 2_u32
    PDTF_ISGROUP = 4_u32
    PDTF_CANGROUPBY = 8_u32
    PDTF_CANSTACKBY = 16_u32
    PDTF_ISTREEPROPERTY = 32_u32
    PDTF_INCLUDEINFULLTEXTQUERY = 64_u32
    PDTF_ISVIEWABLE = 128_u32
    PDTF_ISQUERYABLE = 256_u32
    PDTF_CANBEPURGED = 512_u32
    PDTF_SEARCHRAWVALUE = 1024_u32
    PDTF_DONTCOERCEEMPTYSTRINGS = 2048_u32
    PDTF_ALWAYSINSUPPLEMENTALSTORE = 4096_u32
    PDTF_ISSYSTEMPROPERTY = 2147483648_u32
    PDTF_MASK_ALL = 2147491839_u32
  end
  @[Flags]
  enum PROPDESC_VIEW_FLAGS : UInt32
    PDVF_DEFAULT = 0_u32
    PDVF_CENTERALIGN = 1_u32
    PDVF_RIGHTALIGN = 2_u32
    PDVF_BEGINNEWGROUP = 4_u32
    PDVF_FILLAREA = 8_u32
    PDVF_SORTDESCENDING = 16_u32
    PDVF_SHOWONLYIFPRESENT = 32_u32
    PDVF_SHOWBYDEFAULT = 64_u32
    PDVF_SHOWINPRIMARYLIST = 128_u32
    PDVF_SHOWINSECONDARYLIST = 256_u32
    PDVF_HIDELABEL = 512_u32
    PDVF_HIDDEN = 2048_u32
    PDVF_CANWRAP = 4096_u32
    PDVF_MASK_ALL = 7167_u32
  end
  enum PROPDESC_DISPLAYTYPE
    PDDT_STRING = 0_i32
    PDDT_NUMBER = 1_i32
    PDDT_BOOLEAN = 2_i32
    PDDT_DATETIME = 3_i32
    PDDT_ENUMERATED = 4_i32
  end
  enum PROPDESC_GROUPING_RANGE
    PDGR_DISCRETE = 0_i32
    PDGR_ALPHANUMERIC = 1_i32
    PDGR_SIZE = 2_i32
    PDGR_DYNAMIC = 3_i32
    PDGR_DATE = 4_i32
    PDGR_PERCENT = 5_i32
    PDGR_ENUMERATED = 6_i32
  end
  @[Flags]
  enum PROPDESC_FORMAT_FLAGS : UInt32
    PDFF_DEFAULT = 0_u32
    PDFF_PREFIXNAME = 1_u32
    PDFF_FILENAME = 2_u32
    PDFF_ALWAYSKB = 4_u32
    PDFF_RESERVED_RIGHTTOLEFT = 8_u32
    PDFF_SHORTTIME = 16_u32
    PDFF_LONGTIME = 32_u32
    PDFF_HIDETIME = 64_u32
    PDFF_SHORTDATE = 128_u32
    PDFF_LONGDATE = 256_u32
    PDFF_HIDEDATE = 512_u32
    PDFF_RELATIVEDATE = 1024_u32
    PDFF_USEEDITINVITATION = 2048_u32
    PDFF_READONLY = 4096_u32
    PDFF_NOAUTOREADINGORDER = 8192_u32
  end
  enum PROPDESC_SORTDESCRIPTION
    PDSD_GENERAL = 0_i32
    PDSD_A_Z = 1_i32
    PDSD_LOWEST_HIGHEST = 2_i32
    PDSD_SMALLEST_BIGGEST = 3_i32
    PDSD_OLDEST_NEWEST = 4_i32
  end
  enum PROPDESC_RELATIVEDESCRIPTION_TYPE
    PDRDT_GENERAL = 0_i32
    PDRDT_DATE = 1_i32
    PDRDT_SIZE = 2_i32
    PDRDT_COUNT = 3_i32
    PDRDT_REVISION = 4_i32
    PDRDT_LENGTH = 5_i32
    PDRDT_DURATION = 6_i32
    PDRDT_SPEED = 7_i32
    PDRDT_RATE = 8_i32
    PDRDT_RATING = 9_i32
    PDRDT_PRIORITY = 10_i32
  end
  enum PROPDESC_AGGREGATION_TYPE
    PDAT_DEFAULT = 0_i32
    PDAT_FIRST = 1_i32
    PDAT_SUM = 2_i32
    PDAT_AVERAGE = 3_i32
    PDAT_DATERANGE = 4_i32
    PDAT_UNION = 5_i32
    PDAT_MAX = 6_i32
    PDAT_MIN = 7_i32
  end
  enum PROPDESC_CONDITION_TYPE
    PDCOT_NONE = 0_i32
    PDCOT_STRING = 1_i32
    PDCOT_SIZE = 2_i32
    PDCOT_DATETIME = 3_i32
    PDCOT_BOOLEAN = 4_i32
    PDCOT_NUMBER = 5_i32
  end
  @[Flags]
  enum PROPDESC_SEARCHINFO_FLAGS : UInt32
    PDSIF_DEFAULT = 0_u32
    PDSIF_ININVERTEDINDEX = 1_u32
    PDSIF_ISCOLUMN = 2_u32
    PDSIF_ISCOLUMNSPARSE = 4_u32
    PDSIF_ALWAYSINCLUDE = 8_u32
    PDSIF_USEFORTYPEAHEAD = 16_u32
  end
  enum PROPDESC_COLUMNINDEX_TYPE
    PDCIT_NONE = 0_i32
    PDCIT_ONDISK = 1_i32
    PDCIT_INMEMORY = 2_i32
    PDCIT_ONDEMAND = 3_i32
    PDCIT_ONDISKALL = 4_i32
    PDCIT_ONDISKVECTOR = 5_i32
  end
  enum PROPDESC_ENUMFILTER
    PDEF_ALL = 0_i32
    PDEF_SYSTEM = 1_i32
    PDEF_NONSYSTEM = 2_i32
    PDEF_VIEWABLE = 3_i32
    PDEF_QUERYABLE = 4_i32
    PDEF_INFULLTEXTQUERY = 5_i32
    PDEF_COLUMN = 6_i32
  end
  enum PERSIST_SPROPSTORE_FLAGS_
    FPSPS_DEFAULT = 0_i32
    FPSPS_READONLY = 1_i32
    FPSPS_TREAT_NEW_VALUES_AS_DIRTY = 2_i32
  end
  @[Flags]
  enum PSTIME_FLAGS : UInt32
    PSTF_UTC = 0_u32
    PSTF_LOCAL = 1_u32
  end
  enum PROPVAR_COMPARE_UNIT
    PVCU_DEFAULT = 0_i32
    PVCU_SECOND = 1_i32
    PVCU_MINUTE = 2_i32
    PVCU_HOUR = 3_i32
    PVCU_DAY = 4_i32
    PVCU_MONTH = 5_i32
    PVCU_YEAR = 6_i32
  end
  @[Flags]
  enum PROPVAR_COMPARE_FLAGS : UInt32
    PVCF_DEFAULT = 0_u32
    PVCF_TREATEMPTYASGREATERTHAN = 1_u32
    PVCF_USESTRCMP = 2_u32
    PVCF_USESTRCMPC = 4_u32
    PVCF_USESTRCMPI = 8_u32
    PVCF_USESTRCMPIC = 16_u32
    PVCF_DIGITSASNUMBERS_CASESENSITIVE = 32_u32
  end
  @[Flags]
  enum PROPVAR_CHANGE_FLAGS : UInt32
    PVCHF_DEFAULT = 0_u32
    PVCHF_NOVALUEPROP = 1_u32
    PVCHF_ALPHABOOL = 2_u32
    PVCHF_NOUSEROVERRIDE = 4_u32
    PVCHF_LOCALBOOL = 8_u32
    PVCHF_NOHEXSTRING = 16_u32
  end
  @[Flags]
  enum DRAWPROGRESSFLAGS : UInt32
    DPF_NONE = 0_u32
    DPF_MARQUEE = 1_u32
    DPF_MARQUEE_COMPLETE = 2_u32
    DPF_ERROR = 4_u32
    DPF_WARNING = 8_u32
    DPF_STOPPED = 16_u32
  end
  @[Flags]
  enum SYNC_TRANSFER_STATUS : UInt32
    STS_NONE = 0_u32
    STS_NEEDSUPLOAD = 1_u32
    STS_NEEDSDOWNLOAD = 2_u32
    STS_TRANSFERRING = 4_u32
    STS_PAUSED = 8_u32
    STS_HASERROR = 16_u32
    STS_FETCHING_METADATA = 32_u32
    STS_USER_REQUESTED_REFRESH = 64_u32
    STS_HASWARNING = 128_u32
    STS_EXCLUDED = 256_u32
    STS_INCOMPLETE = 512_u32
    STS_PLACEHOLDER_IFEMPTY = 1024_u32
  end
  @[Flags]
  enum PLACEHOLDER_STATES : UInt32
    PS_NONE = 0_u32
    PS_MARKED_FOR_OFFLINE_AVAILABILITY = 1_u32
    PS_FULL_PRIMARY_STREAM_AVAILABLE = 2_u32
    PS_CREATE_FILE_ACCESSIBLE = 4_u32
    PS_CLOUDFILE_PLACEHOLDER = 8_u32
    PS_DEFAULT = 7_u32
    PS_ALL = 15_u32
  end
  @[Flags]
  enum PROPERTYUI_NAME_FLAGS : UInt32
    PUIFNF_DEFAULT = 0_u32
    PUIFNF_MNEMONIC = 1_u32
  end
  @[Flags]
  enum PROPERTYUI_FLAGS : UInt32
    PUIF_DEFAULT = 0_u32
    PUIF_RIGHTALIGN = 1_u32
    PUIF_NOLABELININFOTIP = 2_u32
  end
  @[Flags]
  enum PROPERTYUI_FORMAT_FLAGS : UInt32
    PUIFFDF_DEFAULT = 0_u32
    PUIFFDF_RIGHTTOLEFT = 1_u32
    PUIFFDF_SHORTFORMAT = 2_u32
    PUIFFDF_NOTIME = 4_u32
    PUIFFDF_FRIENDLYDATE = 8_u32
  end
  enum PDOPSTATUS
    PDOPS_RUNNING = 1_i32
    PDOPS_PAUSED = 2_i32
    PDOPS_CANCELLED = 3_i32
    PDOPS_STOPPED = 4_i32
    PDOPS_ERRORS = 5_i32
  end
  @[Flags]
  enum SYNC_ENGINE_STATE_FLAGS : UInt32
    SESF_NONE = 0_u32
    SESF_SERVICE_QUOTA_NEARING_LIMIT = 1_u32
    SESF_SERVICE_QUOTA_EXCEEDED_LIMIT = 2_u32
    SESF_AUTHENTICATION_ERROR = 4_u32
    SESF_PAUSED_DUE_TO_METERED_NETWORK = 8_u32
    SESF_PAUSED_DUE_TO_DISK_SPACE_FULL = 16_u32
    SESF_PAUSED_DUE_TO_CLIENT_POLICY = 32_u32
    SESF_PAUSED_DUE_TO_SERVICE_POLICY = 64_u32
    SESF_SERVICE_UNAVAILABLE = 128_u32
    SESF_PAUSED_DUE_TO_USER_REQUEST = 256_u32
    SESF_ALL_FLAGS = 511_u32
  end

  @[Extern]
  struct PROPERTYKEY
    property fmtid : LibC::GUID
    property pid : UInt32
    def initialize(@fmtid : LibC::GUID, @pid : UInt32)
    end
  end

  @[Extern]
  struct SERIALIZEDPROPSTORAGE
    def initialize()
    end
  end

  @[Extern]
  struct PROPPRG
    property flPrg : UInt16
    property flPrgInit : UInt16
    property achTitle : Win32cr::Foundation::CHAR[30]
    property achCmdLine : Win32cr::Foundation::CHAR[128]
    property achWorkDir : Win32cr::Foundation::CHAR[64]
    property wHotKey : UInt16
    property achIconFile : Win32cr::Foundation::CHAR[80]
    property wIconIndex : UInt16
    property dwEnhModeFlags : UInt32
    property dwRealModeFlags : UInt32
    property achOtherFile : Win32cr::Foundation::CHAR[80]
    property achPIFFile : Win32cr::Foundation::CHAR[260]
    def initialize(@flPrg : UInt16, @flPrgInit : UInt16, @achTitle : Win32cr::Foundation::CHAR[30], @achCmdLine : Win32cr::Foundation::CHAR[128], @achWorkDir : Win32cr::Foundation::CHAR[64], @wHotKey : UInt16, @achIconFile : Win32cr::Foundation::CHAR[80], @wIconIndex : UInt16, @dwEnhModeFlags : UInt32, @dwRealModeFlags : UInt32, @achOtherFile : Win32cr::Foundation::CHAR[80], @achPIFFile : Win32cr::Foundation::CHAR[260])
    end
  end

  @[Extern]
  record IInitializeWithFileVtbl,
    query_interface : Proc(IInitializeWithFile*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInitializeWithFile*, UInt32),
    release : Proc(IInitializeWithFile*, UInt32),
    initialize__ : Proc(IInitializeWithFile*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IInitializeWithFile, lpVtbl : IInitializeWithFileVtbl* do
    GUID = LibC::GUID.new(0xb7d14566_u32, 0x509_u16, 0x4cce_u16, StaticArray[0xa7_u8, 0x1f_u8, 0xa_u8, 0x55_u8, 0x42_u8, 0x33_u8, 0xbd_u8, 0x9b_u8])
    def query_interface(this : IInitializeWithFile*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInitializeWithFile*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInitializeWithFile*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IInitializeWithFile*, pszFilePath : Win32cr::Foundation::PWSTR, grfMode : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pszFilePath, grfMode)
    end

  end

  @[Extern]
  record IInitializeWithStreamVtbl,
    query_interface : Proc(IInitializeWithStream*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInitializeWithStream*, UInt32),
    release : Proc(IInitializeWithStream*, UInt32),
    initialize__ : Proc(IInitializeWithStream*, Void*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IInitializeWithStream, lpVtbl : IInitializeWithStreamVtbl* do
    GUID = LibC::GUID.new(0xb824b49d_u32, 0x22ac_u16, 0x4161_u16, StaticArray[0xac_u8, 0x8a_u8, 0x99_u8, 0x16_u8, 0xe8_u8, 0xfa_u8, 0x3f_u8, 0x7f_u8])
    def query_interface(this : IInitializeWithStream*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInitializeWithStream*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInitializeWithStream*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IInitializeWithStream*, pstream : Void*, grfMode : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pstream, grfMode)
    end

  end

  @[Extern]
  record IPropertyStoreVtbl,
    query_interface : Proc(IPropertyStore*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPropertyStore*, UInt32),
    release : Proc(IPropertyStore*, UInt32),
    get_count : Proc(IPropertyStore*, UInt32*, Win32cr::Foundation::HRESULT),
    get_at : Proc(IPropertyStore*, UInt32, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::Foundation::HRESULT),
    get_value : Proc(IPropertyStore*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    set_value : Proc(IPropertyStore*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    commit : Proc(IPropertyStore*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPropertyStore, lpVtbl : IPropertyStoreVtbl* do
    GUID = LibC::GUID.new(0x886d8eeb_u32, 0x8cf2_u16, 0x4446_u16, StaticArray[0x8d_u8, 0x2_u8, 0xcd_u8, 0xba_u8, 0x1d_u8, 0xbd_u8, 0xcf_u8, 0x99_u8])
    def query_interface(this : IPropertyStore*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPropertyStore*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPropertyStore*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_count(this : IPropertyStore*, cProps : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, cProps)
    end
    def get_at(this : IPropertyStore*, iProp : UInt32, pkey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_at.call(this, iProp, pkey)
    end
    def get_value(this : IPropertyStore*, key : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, pv : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_value.call(this, key, pv)
    end
    def set_value(this : IPropertyStore*, key : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_value.call(this, key, propvar)
    end
    def commit(this : IPropertyStore*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end

  end

  @[Extern]
  record INamedPropertyStoreVtbl,
    query_interface : Proc(INamedPropertyStore*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INamedPropertyStore*, UInt32),
    release : Proc(INamedPropertyStore*, UInt32),
    get_named_value : Proc(INamedPropertyStore*, Win32cr::Foundation::PWSTR, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    set_named_value : Proc(INamedPropertyStore*, Win32cr::Foundation::PWSTR, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    get_name_count : Proc(INamedPropertyStore*, UInt32*, Win32cr::Foundation::HRESULT),
    get_name_at : Proc(INamedPropertyStore*, UInt32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INamedPropertyStore, lpVtbl : INamedPropertyStoreVtbl* do
    GUID = LibC::GUID.new(0x71604b0f_u32, 0x97b0_u16, 0x4764_u16, StaticArray[0x85_u8, 0x77_u8, 0x2f_u8, 0x13_u8, 0xe9_u8, 0x8a_u8, 0x14_u8, 0x22_u8])
    def query_interface(this : INamedPropertyStore*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INamedPropertyStore*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INamedPropertyStore*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_named_value(this : INamedPropertyStore*, pszName : Win32cr::Foundation::PWSTR, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_named_value.call(this, pszName, ppropvar)
    end
    def set_named_value(this : INamedPropertyStore*, pszName : Win32cr::Foundation::PWSTR, propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_named_value.call(this, pszName, propvar)
    end
    def get_name_count(this : INamedPropertyStore*, pdwCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name_count.call(this, pdwCount)
    end
    def get_name_at(this : INamedPropertyStore*, iProp : UInt32, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name_at.call(this, iProp, pbstrName)
    end

  end

  @[Extern]
  record IObjectWithPropertyKeyVtbl,
    query_interface : Proc(IObjectWithPropertyKey*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IObjectWithPropertyKey*, UInt32),
    release : Proc(IObjectWithPropertyKey*, UInt32),
    set_property_key : Proc(IObjectWithPropertyKey*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::Foundation::HRESULT),
    get_property_key : Proc(IObjectWithPropertyKey*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IObjectWithPropertyKey, lpVtbl : IObjectWithPropertyKeyVtbl* do
    GUID = LibC::GUID.new(0xfc0ca0a7_u32, 0xc316_u16, 0x4fd2_u16, StaticArray[0x90_u8, 0x31_u8, 0x3e_u8, 0x62_u8, 0x8e_u8, 0x6d_u8, 0x4f_u8, 0x23_u8])
    def query_interface(this : IObjectWithPropertyKey*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IObjectWithPropertyKey*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IObjectWithPropertyKey*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_property_key(this : IObjectWithPropertyKey*, key : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property_key.call(this, key)
    end
    def get_property_key(this : IObjectWithPropertyKey*, pkey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_key.call(this, pkey)
    end

  end

  @[Extern]
  record IPropertyChangeVtbl,
    query_interface : Proc(IPropertyChange*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPropertyChange*, UInt32),
    release : Proc(IPropertyChange*, UInt32),
    set_property_key : Proc(IPropertyChange*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::Foundation::HRESULT),
    get_property_key : Proc(IPropertyChange*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::Foundation::HRESULT),
    apply_to_prop_variant : Proc(IPropertyChange*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPropertyChange, lpVtbl : IPropertyChangeVtbl* do
    GUID = LibC::GUID.new(0xf917bc8a_u32, 0x1bba_u16, 0x4478_u16, StaticArray[0xa2_u8, 0x45_u8, 0x1b_u8, 0xde_u8, 0x3_u8, 0xeb_u8, 0x94_u8, 0x31_u8])
    def query_interface(this : IPropertyChange*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPropertyChange*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPropertyChange*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_property_key(this : IPropertyChange*, key : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property_key.call(this, key)
    end
    def get_property_key(this : IPropertyChange*, pkey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_key.call(this, pkey)
    end
    def apply_to_prop_variant(this : IPropertyChange*, propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, ppropvarOut : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.apply_to_prop_variant.call(this, propvarIn, ppropvarOut)
    end

  end

  @[Extern]
  record IPropertyChangeArrayVtbl,
    query_interface : Proc(IPropertyChangeArray*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPropertyChangeArray*, UInt32),
    release : Proc(IPropertyChangeArray*, UInt32),
    get_count : Proc(IPropertyChangeArray*, UInt32*, Win32cr::Foundation::HRESULT),
    get_at : Proc(IPropertyChangeArray*, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    insert_at : Proc(IPropertyChangeArray*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    append : Proc(IPropertyChangeArray*, Void*, Win32cr::Foundation::HRESULT),
    append_or_replace : Proc(IPropertyChangeArray*, Void*, Win32cr::Foundation::HRESULT),
    remove_at : Proc(IPropertyChangeArray*, UInt32, Win32cr::Foundation::HRESULT),
    is_key_in_array : Proc(IPropertyChangeArray*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPropertyChangeArray, lpVtbl : IPropertyChangeArrayVtbl* do
    GUID = LibC::GUID.new(0x380f5cad_u32, 0x1b5e_u16, 0x42f2_u16, StaticArray[0x80_u8, 0x5d_u8, 0x63_u8, 0x7f_u8, 0xd3_u8, 0x92_u8, 0xd3_u8, 0x1e_u8])
    def query_interface(this : IPropertyChangeArray*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPropertyChangeArray*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPropertyChangeArray*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_count(this : IPropertyChangeArray*, pcOperations : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, pcOperations)
    end
    def get_at(this : IPropertyChangeArray*, iIndex : UInt32, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_at.call(this, iIndex, riid, ppv)
    end
    def insert_at(this : IPropertyChangeArray*, iIndex : UInt32, ppropChange : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_at.call(this, iIndex, ppropChange)
    end
    def append(this : IPropertyChangeArray*, ppropChange : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.append.call(this, ppropChange)
    end
    def append_or_replace(this : IPropertyChangeArray*, ppropChange : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.append_or_replace.call(this, ppropChange)
    end
    def remove_at(this : IPropertyChangeArray*, iIndex : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_at.call(this, iIndex)
    end
    def is_key_in_array(this : IPropertyChangeArray*, key : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_key_in_array.call(this, key)
    end

  end

  @[Extern]
  record IPropertyStoreCapabilitiesVtbl,
    query_interface : Proc(IPropertyStoreCapabilities*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPropertyStoreCapabilities*, UInt32),
    release : Proc(IPropertyStoreCapabilities*, UInt32),
    is_property_writable : Proc(IPropertyStoreCapabilities*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPropertyStoreCapabilities, lpVtbl : IPropertyStoreCapabilitiesVtbl* do
    GUID = LibC::GUID.new(0xc8e2d566_u32, 0x186e_u16, 0x4d49_u16, StaticArray[0xbf_u8, 0x41_u8, 0x69_u8, 0x9_u8, 0xea_u8, 0xd5_u8, 0x6a_u8, 0xcc_u8])
    def query_interface(this : IPropertyStoreCapabilities*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPropertyStoreCapabilities*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPropertyStoreCapabilities*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def is_property_writable(this : IPropertyStoreCapabilities*, key : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_property_writable.call(this, key)
    end

  end

  @[Extern]
  record IPropertyStoreCacheVtbl,
    query_interface : Proc(IPropertyStoreCache*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPropertyStoreCache*, UInt32),
    release : Proc(IPropertyStoreCache*, UInt32),
    get_count : Proc(IPropertyStoreCache*, UInt32*, Win32cr::Foundation::HRESULT),
    get_at : Proc(IPropertyStoreCache*, UInt32, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::Foundation::HRESULT),
    get_value : Proc(IPropertyStoreCache*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    set_value : Proc(IPropertyStoreCache*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    commit : Proc(IPropertyStoreCache*, Win32cr::Foundation::HRESULT),
    get_state : Proc(IPropertyStoreCache*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::UI::Shell::PropertiesSystem::PSC_STATE*, Win32cr::Foundation::HRESULT),
    get_value_and_state : Proc(IPropertyStoreCache*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::UI::Shell::PropertiesSystem::PSC_STATE*, Win32cr::Foundation::HRESULT),
    set_state : Proc(IPropertyStoreCache*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::UI::Shell::PropertiesSystem::PSC_STATE, Win32cr::Foundation::HRESULT),
    set_value_and_state : Proc(IPropertyStoreCache*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::UI::Shell::PropertiesSystem::PSC_STATE, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPropertyStoreCache, lpVtbl : IPropertyStoreCacheVtbl* do
    GUID = LibC::GUID.new(0x3017056d_u32, 0x9a91_u16, 0x4e90_u16, StaticArray[0x93_u8, 0x7d_u8, 0x74_u8, 0x6c_u8, 0x72_u8, 0xab_u8, 0xbf_u8, 0x4f_u8])
    def query_interface(this : IPropertyStoreCache*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPropertyStoreCache*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPropertyStoreCache*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_count(this : IPropertyStoreCache*, cProps : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, cProps)
    end
    def get_at(this : IPropertyStoreCache*, iProp : UInt32, pkey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_at.call(this, iProp, pkey)
    end
    def get_value(this : IPropertyStoreCache*, key : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, pv : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_value.call(this, key, pv)
    end
    def set_value(this : IPropertyStoreCache*, key : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_value.call(this, key, propvar)
    end
    def commit(this : IPropertyStoreCache*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end
    def get_state(this : IPropertyStoreCache*, key : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, pstate : Win32cr::UI::Shell::PropertiesSystem::PSC_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_state.call(this, key, pstate)
    end
    def get_value_and_state(this : IPropertyStoreCache*, key : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pstate : Win32cr::UI::Shell::PropertiesSystem::PSC_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_value_and_state.call(this, key, ppropvar, pstate)
    end
    def set_state(this : IPropertyStoreCache*, key : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, state : Win32cr::UI::Shell::PropertiesSystem::PSC_STATE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_state.call(this, key, state)
    end
    def set_value_and_state(this : IPropertyStoreCache*, key : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, state : Win32cr::UI::Shell::PropertiesSystem::PSC_STATE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_value_and_state.call(this, key, ppropvar, state)
    end

  end

  @[Extern]
  record IPropertyEnumTypeVtbl,
    query_interface : Proc(IPropertyEnumType*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPropertyEnumType*, UInt32),
    release : Proc(IPropertyEnumType*, UInt32),
    get_enum_type : Proc(IPropertyEnumType*, Win32cr::UI::Shell::PropertiesSystem::PROPENUMTYPE*, Win32cr::Foundation::HRESULT),
    get_value : Proc(IPropertyEnumType*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    get_range_min_value : Proc(IPropertyEnumType*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    get_range_set_value : Proc(IPropertyEnumType*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    get_display_text : Proc(IPropertyEnumType*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPropertyEnumType, lpVtbl : IPropertyEnumTypeVtbl* do
    GUID = LibC::GUID.new(0x11e1fbf9_u32, 0x2d56_u16, 0x4a6b_u16, StaticArray[0x8d_u8, 0xb3_u8, 0x7c_u8, 0xd1_u8, 0x93_u8, 0xa4_u8, 0x71_u8, 0xf2_u8])
    def query_interface(this : IPropertyEnumType*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPropertyEnumType*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPropertyEnumType*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_enum_type(this : IPropertyEnumType*, penumtype : Win32cr::UI::Shell::PropertiesSystem::PROPENUMTYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enum_type.call(this, penumtype)
    end
    def get_value(this : IPropertyEnumType*, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_value.call(this, ppropvar)
    end
    def get_range_min_value(this : IPropertyEnumType*, ppropvarMin : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_range_min_value.call(this, ppropvarMin)
    end
    def get_range_set_value(this : IPropertyEnumType*, ppropvarSet : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_range_set_value.call(this, ppropvarSet)
    end
    def get_display_text(this : IPropertyEnumType*, ppszDisplay : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_text.call(this, ppszDisplay)
    end

  end

  @[Extern]
  record IPropertyEnumType2Vtbl,
    query_interface : Proc(IPropertyEnumType2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPropertyEnumType2*, UInt32),
    release : Proc(IPropertyEnumType2*, UInt32),
    get_enum_type : Proc(IPropertyEnumType2*, Win32cr::UI::Shell::PropertiesSystem::PROPENUMTYPE*, Win32cr::Foundation::HRESULT),
    get_value : Proc(IPropertyEnumType2*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    get_range_min_value : Proc(IPropertyEnumType2*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    get_range_set_value : Proc(IPropertyEnumType2*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    get_display_text : Proc(IPropertyEnumType2*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_image_reference : Proc(IPropertyEnumType2*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPropertyEnumType2, lpVtbl : IPropertyEnumType2Vtbl* do
    GUID = LibC::GUID.new(0x9b6e051c_u32, 0x5ddd_u16, 0x4321_u16, StaticArray[0x90_u8, 0x70_u8, 0xfe_u8, 0x2a_u8, 0xcb_u8, 0x55_u8, 0xe7_u8, 0x94_u8])
    def query_interface(this : IPropertyEnumType2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPropertyEnumType2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPropertyEnumType2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_enum_type(this : IPropertyEnumType2*, penumtype : Win32cr::UI::Shell::PropertiesSystem::PROPENUMTYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enum_type.call(this, penumtype)
    end
    def get_value(this : IPropertyEnumType2*, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_value.call(this, ppropvar)
    end
    def get_range_min_value(this : IPropertyEnumType2*, ppropvarMin : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_range_min_value.call(this, ppropvarMin)
    end
    def get_range_set_value(this : IPropertyEnumType2*, ppropvarSet : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_range_set_value.call(this, ppropvarSet)
    end
    def get_display_text(this : IPropertyEnumType2*, ppszDisplay : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_text.call(this, ppszDisplay)
    end
    def get_image_reference(this : IPropertyEnumType2*, ppszImageRes : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_image_reference.call(this, ppszImageRes)
    end

  end

  @[Extern]
  record IPropertyEnumTypeListVtbl,
    query_interface : Proc(IPropertyEnumTypeList*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPropertyEnumTypeList*, UInt32),
    release : Proc(IPropertyEnumTypeList*, UInt32),
    get_count : Proc(IPropertyEnumTypeList*, UInt32*, Win32cr::Foundation::HRESULT),
    get_at : Proc(IPropertyEnumTypeList*, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_condition_at : Proc(IPropertyEnumTypeList*, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    find_matching_index : Proc(IPropertyEnumTypeList*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPropertyEnumTypeList, lpVtbl : IPropertyEnumTypeListVtbl* do
    GUID = LibC::GUID.new(0xa99400f4_u32, 0x3d84_u16, 0x4557_u16, StaticArray[0x94_u8, 0xba_u8, 0x12_u8, 0x42_u8, 0xfb_u8, 0x2c_u8, 0xc9_u8, 0xa6_u8])
    def query_interface(this : IPropertyEnumTypeList*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPropertyEnumTypeList*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPropertyEnumTypeList*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_count(this : IPropertyEnumTypeList*, pctypes : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, pctypes)
    end
    def get_at(this : IPropertyEnumTypeList*, itype : UInt32, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_at.call(this, itype, riid, ppv)
    end
    def get_condition_at(this : IPropertyEnumTypeList*, nIndex : UInt32, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_condition_at.call(this, nIndex, riid, ppv)
    end
    def find_matching_index(this : IPropertyEnumTypeList*, propvarCmp : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pnIndex : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_matching_index.call(this, propvarCmp, pnIndex)
    end

  end

  @[Extern]
  record IPropertyDescriptionVtbl,
    query_interface : Proc(IPropertyDescription*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPropertyDescription*, UInt32),
    release : Proc(IPropertyDescription*, UInt32),
    get_property_key : Proc(IPropertyDescription*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::Foundation::HRESULT),
    get_canonical_name : Proc(IPropertyDescription*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_property_type : Proc(IPropertyDescription*, UInt16*, Win32cr::Foundation::HRESULT),
    get_display_name : Proc(IPropertyDescription*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_edit_invitation : Proc(IPropertyDescription*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_type_flags : Proc(IPropertyDescription*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_TYPE_FLAGS, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_TYPE_FLAGS*, Win32cr::Foundation::HRESULT),
    get_view_flags : Proc(IPropertyDescription*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_VIEW_FLAGS*, Win32cr::Foundation::HRESULT),
    get_default_column_width : Proc(IPropertyDescription*, UInt32*, Win32cr::Foundation::HRESULT),
    get_display_type : Proc(IPropertyDescription*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_DISPLAYTYPE*, Win32cr::Foundation::HRESULT),
    get_column_state : Proc(IPropertyDescription*, UInt32*, Win32cr::Foundation::HRESULT),
    get_grouping_range : Proc(IPropertyDescription*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_GROUPING_RANGE*, Win32cr::Foundation::HRESULT),
    get_relative_description_type : Proc(IPropertyDescription*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_RELATIVEDESCRIPTION_TYPE*, Win32cr::Foundation::HRESULT),
    get_relative_description : Proc(IPropertyDescription*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_sort_description : Proc(IPropertyDescription*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_SORTDESCRIPTION*, Win32cr::Foundation::HRESULT),
    get_sort_description_label : Proc(IPropertyDescription*, Win32cr::Foundation::BOOL, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_aggregation_type : Proc(IPropertyDescription*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_AGGREGATION_TYPE*, Win32cr::Foundation::HRESULT),
    get_condition_type : Proc(IPropertyDescription*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_CONDITION_TYPE*, Win32cr::System::Search::Common::CONDITION_OPERATION*, Win32cr::Foundation::HRESULT),
    get_enum_type_list : Proc(IPropertyDescription*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    coerce_to_canonical_value : Proc(IPropertyDescription*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    format_for_display : Proc(IPropertyDescription*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_FORMAT_FLAGS, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    is_value_canonical : Proc(IPropertyDescription*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPropertyDescription, lpVtbl : IPropertyDescriptionVtbl* do
    GUID = LibC::GUID.new(0x6f79d558_u32, 0x3e96_u16, 0x4549_u16, StaticArray[0xa1_u8, 0xd1_u8, 0x7d_u8, 0x75_u8, 0xd2_u8, 0x28_u8, 0x88_u8, 0x14_u8])
    def query_interface(this : IPropertyDescription*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPropertyDescription*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPropertyDescription*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_property_key(this : IPropertyDescription*, pkey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_key.call(this, pkey)
    end
    def get_canonical_name(this : IPropertyDescription*, ppszName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_canonical_name.call(this, ppszName)
    end
    def get_property_type(this : IPropertyDescription*, pvartype : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_type.call(this, pvartype)
    end
    def get_display_name(this : IPropertyDescription*, ppszName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_name.call(this, ppszName)
    end
    def get_edit_invitation(this : IPropertyDescription*, ppszInvite : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_edit_invitation.call(this, ppszInvite)
    end
    def get_type_flags(this : IPropertyDescription*, mask : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_TYPE_FLAGS, ppdtFlags : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_TYPE_FLAGS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_flags.call(this, mask, ppdtFlags)
    end
    def get_view_flags(this : IPropertyDescription*, ppdvFlags : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_VIEW_FLAGS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_view_flags.call(this, ppdvFlags)
    end
    def get_default_column_width(this : IPropertyDescription*, pcxChars : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_default_column_width.call(this, pcxChars)
    end
    def get_display_type(this : IPropertyDescription*, pdisplaytype : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_DISPLAYTYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_type.call(this, pdisplaytype)
    end
    def get_column_state(this : IPropertyDescription*, pcsFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_column_state.call(this, pcsFlags)
    end
    def get_grouping_range(this : IPropertyDescription*, pgr : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_GROUPING_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_grouping_range.call(this, pgr)
    end
    def get_relative_description_type(this : IPropertyDescription*, prdt : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_RELATIVEDESCRIPTION_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_relative_description_type.call(this, prdt)
    end
    def get_relative_description(this : IPropertyDescription*, propvar1 : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, propvar2 : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, ppszDesc1 : Win32cr::Foundation::PWSTR*, ppszDesc2 : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_relative_description.call(this, propvar1, propvar2, ppszDesc1, ppszDesc2)
    end
    def get_sort_description(this : IPropertyDescription*, psd : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_SORTDESCRIPTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sort_description.call(this, psd)
    end
    def get_sort_description_label(this : IPropertyDescription*, fDescending : Win32cr::Foundation::BOOL, ppszDescription : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sort_description_label.call(this, fDescending, ppszDescription)
    end
    def get_aggregation_type(this : IPropertyDescription*, paggtype : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_AGGREGATION_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_aggregation_type.call(this, paggtype)
    end
    def get_condition_type(this : IPropertyDescription*, pcontype : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_CONDITION_TYPE*, popDefault : Win32cr::System::Search::Common::CONDITION_OPERATION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_condition_type.call(this, pcontype, popDefault)
    end
    def get_enum_type_list(this : IPropertyDescription*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enum_type_list.call(this, riid, ppv)
    end
    def coerce_to_canonical_value(this : IPropertyDescription*, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.coerce_to_canonical_value.call(this, ppropvar)
    end
    def format_for_display(this : IPropertyDescription*, propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pdfFlags : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_FORMAT_FLAGS, ppszDisplay : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.format_for_display.call(this, propvar, pdfFlags, ppszDisplay)
    end
    def is_value_canonical(this : IPropertyDescription*, propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_value_canonical.call(this, propvar)
    end

  end

  @[Extern]
  record IPropertyDescription2Vtbl,
    query_interface : Proc(IPropertyDescription2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPropertyDescription2*, UInt32),
    release : Proc(IPropertyDescription2*, UInt32),
    get_property_key : Proc(IPropertyDescription2*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::Foundation::HRESULT),
    get_canonical_name : Proc(IPropertyDescription2*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_property_type : Proc(IPropertyDescription2*, UInt16*, Win32cr::Foundation::HRESULT),
    get_display_name : Proc(IPropertyDescription2*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_edit_invitation : Proc(IPropertyDescription2*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_type_flags : Proc(IPropertyDescription2*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_TYPE_FLAGS, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_TYPE_FLAGS*, Win32cr::Foundation::HRESULT),
    get_view_flags : Proc(IPropertyDescription2*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_VIEW_FLAGS*, Win32cr::Foundation::HRESULT),
    get_default_column_width : Proc(IPropertyDescription2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_display_type : Proc(IPropertyDescription2*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_DISPLAYTYPE*, Win32cr::Foundation::HRESULT),
    get_column_state : Proc(IPropertyDescription2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_grouping_range : Proc(IPropertyDescription2*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_GROUPING_RANGE*, Win32cr::Foundation::HRESULT),
    get_relative_description_type : Proc(IPropertyDescription2*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_RELATIVEDESCRIPTION_TYPE*, Win32cr::Foundation::HRESULT),
    get_relative_description : Proc(IPropertyDescription2*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_sort_description : Proc(IPropertyDescription2*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_SORTDESCRIPTION*, Win32cr::Foundation::HRESULT),
    get_sort_description_label : Proc(IPropertyDescription2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_aggregation_type : Proc(IPropertyDescription2*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_AGGREGATION_TYPE*, Win32cr::Foundation::HRESULT),
    get_condition_type : Proc(IPropertyDescription2*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_CONDITION_TYPE*, Win32cr::System::Search::Common::CONDITION_OPERATION*, Win32cr::Foundation::HRESULT),
    get_enum_type_list : Proc(IPropertyDescription2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    coerce_to_canonical_value : Proc(IPropertyDescription2*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    format_for_display : Proc(IPropertyDescription2*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_FORMAT_FLAGS, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    is_value_canonical : Proc(IPropertyDescription2*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    get_image_reference_for_value : Proc(IPropertyDescription2*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPropertyDescription2, lpVtbl : IPropertyDescription2Vtbl* do
    GUID = LibC::GUID.new(0x57d2eded_u32, 0x5062_u16, 0x400e_u16, StaticArray[0xb1_u8, 0x7_u8, 0x5d_u8, 0xae_u8, 0x79_u8, 0xfe_u8, 0x57_u8, 0xa6_u8])
    def query_interface(this : IPropertyDescription2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPropertyDescription2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPropertyDescription2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_property_key(this : IPropertyDescription2*, pkey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_key.call(this, pkey)
    end
    def get_canonical_name(this : IPropertyDescription2*, ppszName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_canonical_name.call(this, ppszName)
    end
    def get_property_type(this : IPropertyDescription2*, pvartype : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_type.call(this, pvartype)
    end
    def get_display_name(this : IPropertyDescription2*, ppszName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_name.call(this, ppszName)
    end
    def get_edit_invitation(this : IPropertyDescription2*, ppszInvite : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_edit_invitation.call(this, ppszInvite)
    end
    def get_type_flags(this : IPropertyDescription2*, mask : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_TYPE_FLAGS, ppdtFlags : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_TYPE_FLAGS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_flags.call(this, mask, ppdtFlags)
    end
    def get_view_flags(this : IPropertyDescription2*, ppdvFlags : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_VIEW_FLAGS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_view_flags.call(this, ppdvFlags)
    end
    def get_default_column_width(this : IPropertyDescription2*, pcxChars : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_default_column_width.call(this, pcxChars)
    end
    def get_display_type(this : IPropertyDescription2*, pdisplaytype : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_DISPLAYTYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_type.call(this, pdisplaytype)
    end
    def get_column_state(this : IPropertyDescription2*, pcsFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_column_state.call(this, pcsFlags)
    end
    def get_grouping_range(this : IPropertyDescription2*, pgr : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_GROUPING_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_grouping_range.call(this, pgr)
    end
    def get_relative_description_type(this : IPropertyDescription2*, prdt : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_RELATIVEDESCRIPTION_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_relative_description_type.call(this, prdt)
    end
    def get_relative_description(this : IPropertyDescription2*, propvar1 : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, propvar2 : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, ppszDesc1 : Win32cr::Foundation::PWSTR*, ppszDesc2 : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_relative_description.call(this, propvar1, propvar2, ppszDesc1, ppszDesc2)
    end
    def get_sort_description(this : IPropertyDescription2*, psd : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_SORTDESCRIPTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sort_description.call(this, psd)
    end
    def get_sort_description_label(this : IPropertyDescription2*, fDescending : Win32cr::Foundation::BOOL, ppszDescription : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sort_description_label.call(this, fDescending, ppszDescription)
    end
    def get_aggregation_type(this : IPropertyDescription2*, paggtype : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_AGGREGATION_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_aggregation_type.call(this, paggtype)
    end
    def get_condition_type(this : IPropertyDescription2*, pcontype : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_CONDITION_TYPE*, popDefault : Win32cr::System::Search::Common::CONDITION_OPERATION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_condition_type.call(this, pcontype, popDefault)
    end
    def get_enum_type_list(this : IPropertyDescription2*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enum_type_list.call(this, riid, ppv)
    end
    def coerce_to_canonical_value(this : IPropertyDescription2*, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.coerce_to_canonical_value.call(this, ppropvar)
    end
    def format_for_display(this : IPropertyDescription2*, propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pdfFlags : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_FORMAT_FLAGS, ppszDisplay : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.format_for_display.call(this, propvar, pdfFlags, ppszDisplay)
    end
    def is_value_canonical(this : IPropertyDescription2*, propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_value_canonical.call(this, propvar)
    end
    def get_image_reference_for_value(this : IPropertyDescription2*, propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, ppszImageRes : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_image_reference_for_value.call(this, propvar, ppszImageRes)
    end

  end

  @[Extern]
  record IPropertyDescriptionAliasInfoVtbl,
    query_interface : Proc(IPropertyDescriptionAliasInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPropertyDescriptionAliasInfo*, UInt32),
    release : Proc(IPropertyDescriptionAliasInfo*, UInt32),
    get_property_key : Proc(IPropertyDescriptionAliasInfo*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::Foundation::HRESULT),
    get_canonical_name : Proc(IPropertyDescriptionAliasInfo*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_property_type : Proc(IPropertyDescriptionAliasInfo*, UInt16*, Win32cr::Foundation::HRESULT),
    get_display_name : Proc(IPropertyDescriptionAliasInfo*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_edit_invitation : Proc(IPropertyDescriptionAliasInfo*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_type_flags : Proc(IPropertyDescriptionAliasInfo*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_TYPE_FLAGS, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_TYPE_FLAGS*, Win32cr::Foundation::HRESULT),
    get_view_flags : Proc(IPropertyDescriptionAliasInfo*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_VIEW_FLAGS*, Win32cr::Foundation::HRESULT),
    get_default_column_width : Proc(IPropertyDescriptionAliasInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_display_type : Proc(IPropertyDescriptionAliasInfo*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_DISPLAYTYPE*, Win32cr::Foundation::HRESULT),
    get_column_state : Proc(IPropertyDescriptionAliasInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_grouping_range : Proc(IPropertyDescriptionAliasInfo*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_GROUPING_RANGE*, Win32cr::Foundation::HRESULT),
    get_relative_description_type : Proc(IPropertyDescriptionAliasInfo*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_RELATIVEDESCRIPTION_TYPE*, Win32cr::Foundation::HRESULT),
    get_relative_description : Proc(IPropertyDescriptionAliasInfo*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_sort_description : Proc(IPropertyDescriptionAliasInfo*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_SORTDESCRIPTION*, Win32cr::Foundation::HRESULT),
    get_sort_description_label : Proc(IPropertyDescriptionAliasInfo*, Win32cr::Foundation::BOOL, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_aggregation_type : Proc(IPropertyDescriptionAliasInfo*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_AGGREGATION_TYPE*, Win32cr::Foundation::HRESULT),
    get_condition_type : Proc(IPropertyDescriptionAliasInfo*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_CONDITION_TYPE*, Win32cr::System::Search::Common::CONDITION_OPERATION*, Win32cr::Foundation::HRESULT),
    get_enum_type_list : Proc(IPropertyDescriptionAliasInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    coerce_to_canonical_value : Proc(IPropertyDescriptionAliasInfo*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    format_for_display : Proc(IPropertyDescriptionAliasInfo*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_FORMAT_FLAGS, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    is_value_canonical : Proc(IPropertyDescriptionAliasInfo*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    get_sort_by_alias : Proc(IPropertyDescriptionAliasInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_additional_sort_by_aliases : Proc(IPropertyDescriptionAliasInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPropertyDescriptionAliasInfo, lpVtbl : IPropertyDescriptionAliasInfoVtbl* do
    GUID = LibC::GUID.new(0xf67104fc_u32, 0x2af9_u16, 0x46fd_u16, StaticArray[0xb3_u8, 0x2d_u8, 0x24_u8, 0x3c_u8, 0x14_u8, 0x4_u8, 0xf3_u8, 0xd1_u8])
    def query_interface(this : IPropertyDescriptionAliasInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPropertyDescriptionAliasInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPropertyDescriptionAliasInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_property_key(this : IPropertyDescriptionAliasInfo*, pkey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_key.call(this, pkey)
    end
    def get_canonical_name(this : IPropertyDescriptionAliasInfo*, ppszName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_canonical_name.call(this, ppszName)
    end
    def get_property_type(this : IPropertyDescriptionAliasInfo*, pvartype : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_type.call(this, pvartype)
    end
    def get_display_name(this : IPropertyDescriptionAliasInfo*, ppszName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_name.call(this, ppszName)
    end
    def get_edit_invitation(this : IPropertyDescriptionAliasInfo*, ppszInvite : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_edit_invitation.call(this, ppszInvite)
    end
    def get_type_flags(this : IPropertyDescriptionAliasInfo*, mask : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_TYPE_FLAGS, ppdtFlags : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_TYPE_FLAGS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_flags.call(this, mask, ppdtFlags)
    end
    def get_view_flags(this : IPropertyDescriptionAliasInfo*, ppdvFlags : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_VIEW_FLAGS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_view_flags.call(this, ppdvFlags)
    end
    def get_default_column_width(this : IPropertyDescriptionAliasInfo*, pcxChars : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_default_column_width.call(this, pcxChars)
    end
    def get_display_type(this : IPropertyDescriptionAliasInfo*, pdisplaytype : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_DISPLAYTYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_type.call(this, pdisplaytype)
    end
    def get_column_state(this : IPropertyDescriptionAliasInfo*, pcsFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_column_state.call(this, pcsFlags)
    end
    def get_grouping_range(this : IPropertyDescriptionAliasInfo*, pgr : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_GROUPING_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_grouping_range.call(this, pgr)
    end
    def get_relative_description_type(this : IPropertyDescriptionAliasInfo*, prdt : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_RELATIVEDESCRIPTION_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_relative_description_type.call(this, prdt)
    end
    def get_relative_description(this : IPropertyDescriptionAliasInfo*, propvar1 : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, propvar2 : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, ppszDesc1 : Win32cr::Foundation::PWSTR*, ppszDesc2 : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_relative_description.call(this, propvar1, propvar2, ppszDesc1, ppszDesc2)
    end
    def get_sort_description(this : IPropertyDescriptionAliasInfo*, psd : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_SORTDESCRIPTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sort_description.call(this, psd)
    end
    def get_sort_description_label(this : IPropertyDescriptionAliasInfo*, fDescending : Win32cr::Foundation::BOOL, ppszDescription : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sort_description_label.call(this, fDescending, ppszDescription)
    end
    def get_aggregation_type(this : IPropertyDescriptionAliasInfo*, paggtype : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_AGGREGATION_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_aggregation_type.call(this, paggtype)
    end
    def get_condition_type(this : IPropertyDescriptionAliasInfo*, pcontype : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_CONDITION_TYPE*, popDefault : Win32cr::System::Search::Common::CONDITION_OPERATION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_condition_type.call(this, pcontype, popDefault)
    end
    def get_enum_type_list(this : IPropertyDescriptionAliasInfo*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enum_type_list.call(this, riid, ppv)
    end
    def coerce_to_canonical_value(this : IPropertyDescriptionAliasInfo*, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.coerce_to_canonical_value.call(this, ppropvar)
    end
    def format_for_display(this : IPropertyDescriptionAliasInfo*, propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pdfFlags : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_FORMAT_FLAGS, ppszDisplay : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.format_for_display.call(this, propvar, pdfFlags, ppszDisplay)
    end
    def is_value_canonical(this : IPropertyDescriptionAliasInfo*, propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_value_canonical.call(this, propvar)
    end
    def get_sort_by_alias(this : IPropertyDescriptionAliasInfo*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sort_by_alias.call(this, riid, ppv)
    end
    def get_additional_sort_by_aliases(this : IPropertyDescriptionAliasInfo*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_additional_sort_by_aliases.call(this, riid, ppv)
    end

  end

  @[Extern]
  record IPropertyDescriptionSearchInfoVtbl,
    query_interface : Proc(IPropertyDescriptionSearchInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPropertyDescriptionSearchInfo*, UInt32),
    release : Proc(IPropertyDescriptionSearchInfo*, UInt32),
    get_property_key : Proc(IPropertyDescriptionSearchInfo*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::Foundation::HRESULT),
    get_canonical_name : Proc(IPropertyDescriptionSearchInfo*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_property_type : Proc(IPropertyDescriptionSearchInfo*, UInt16*, Win32cr::Foundation::HRESULT),
    get_display_name : Proc(IPropertyDescriptionSearchInfo*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_edit_invitation : Proc(IPropertyDescriptionSearchInfo*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_type_flags : Proc(IPropertyDescriptionSearchInfo*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_TYPE_FLAGS, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_TYPE_FLAGS*, Win32cr::Foundation::HRESULT),
    get_view_flags : Proc(IPropertyDescriptionSearchInfo*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_VIEW_FLAGS*, Win32cr::Foundation::HRESULT),
    get_default_column_width : Proc(IPropertyDescriptionSearchInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_display_type : Proc(IPropertyDescriptionSearchInfo*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_DISPLAYTYPE*, Win32cr::Foundation::HRESULT),
    get_column_state : Proc(IPropertyDescriptionSearchInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_grouping_range : Proc(IPropertyDescriptionSearchInfo*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_GROUPING_RANGE*, Win32cr::Foundation::HRESULT),
    get_relative_description_type : Proc(IPropertyDescriptionSearchInfo*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_RELATIVEDESCRIPTION_TYPE*, Win32cr::Foundation::HRESULT),
    get_relative_description : Proc(IPropertyDescriptionSearchInfo*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_sort_description : Proc(IPropertyDescriptionSearchInfo*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_SORTDESCRIPTION*, Win32cr::Foundation::HRESULT),
    get_sort_description_label : Proc(IPropertyDescriptionSearchInfo*, Win32cr::Foundation::BOOL, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_aggregation_type : Proc(IPropertyDescriptionSearchInfo*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_AGGREGATION_TYPE*, Win32cr::Foundation::HRESULT),
    get_condition_type : Proc(IPropertyDescriptionSearchInfo*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_CONDITION_TYPE*, Win32cr::System::Search::Common::CONDITION_OPERATION*, Win32cr::Foundation::HRESULT),
    get_enum_type_list : Proc(IPropertyDescriptionSearchInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    coerce_to_canonical_value : Proc(IPropertyDescriptionSearchInfo*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    format_for_display : Proc(IPropertyDescriptionSearchInfo*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_FORMAT_FLAGS, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    is_value_canonical : Proc(IPropertyDescriptionSearchInfo*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    get_search_info_flags : Proc(IPropertyDescriptionSearchInfo*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_SEARCHINFO_FLAGS*, Win32cr::Foundation::HRESULT),
    get_column_index_type : Proc(IPropertyDescriptionSearchInfo*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_COLUMNINDEX_TYPE*, Win32cr::Foundation::HRESULT),
    get_projection_string : Proc(IPropertyDescriptionSearchInfo*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_max_size : Proc(IPropertyDescriptionSearchInfo*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPropertyDescriptionSearchInfo, lpVtbl : IPropertyDescriptionSearchInfoVtbl* do
    GUID = LibC::GUID.new(0x78f91bd_u32, 0x29a2_u16, 0x440f_u16, StaticArray[0x92_u8, 0x4e_u8, 0x46_u8, 0xa2_u8, 0x91_u8, 0x52_u8, 0x45_u8, 0x20_u8])
    def query_interface(this : IPropertyDescriptionSearchInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPropertyDescriptionSearchInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPropertyDescriptionSearchInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_property_key(this : IPropertyDescriptionSearchInfo*, pkey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_key.call(this, pkey)
    end
    def get_canonical_name(this : IPropertyDescriptionSearchInfo*, ppszName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_canonical_name.call(this, ppszName)
    end
    def get_property_type(this : IPropertyDescriptionSearchInfo*, pvartype : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_type.call(this, pvartype)
    end
    def get_display_name(this : IPropertyDescriptionSearchInfo*, ppszName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_name.call(this, ppszName)
    end
    def get_edit_invitation(this : IPropertyDescriptionSearchInfo*, ppszInvite : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_edit_invitation.call(this, ppszInvite)
    end
    def get_type_flags(this : IPropertyDescriptionSearchInfo*, mask : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_TYPE_FLAGS, ppdtFlags : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_TYPE_FLAGS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_flags.call(this, mask, ppdtFlags)
    end
    def get_view_flags(this : IPropertyDescriptionSearchInfo*, ppdvFlags : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_VIEW_FLAGS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_view_flags.call(this, ppdvFlags)
    end
    def get_default_column_width(this : IPropertyDescriptionSearchInfo*, pcxChars : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_default_column_width.call(this, pcxChars)
    end
    def get_display_type(this : IPropertyDescriptionSearchInfo*, pdisplaytype : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_DISPLAYTYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_type.call(this, pdisplaytype)
    end
    def get_column_state(this : IPropertyDescriptionSearchInfo*, pcsFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_column_state.call(this, pcsFlags)
    end
    def get_grouping_range(this : IPropertyDescriptionSearchInfo*, pgr : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_GROUPING_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_grouping_range.call(this, pgr)
    end
    def get_relative_description_type(this : IPropertyDescriptionSearchInfo*, prdt : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_RELATIVEDESCRIPTION_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_relative_description_type.call(this, prdt)
    end
    def get_relative_description(this : IPropertyDescriptionSearchInfo*, propvar1 : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, propvar2 : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, ppszDesc1 : Win32cr::Foundation::PWSTR*, ppszDesc2 : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_relative_description.call(this, propvar1, propvar2, ppszDesc1, ppszDesc2)
    end
    def get_sort_description(this : IPropertyDescriptionSearchInfo*, psd : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_SORTDESCRIPTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sort_description.call(this, psd)
    end
    def get_sort_description_label(this : IPropertyDescriptionSearchInfo*, fDescending : Win32cr::Foundation::BOOL, ppszDescription : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sort_description_label.call(this, fDescending, ppszDescription)
    end
    def get_aggregation_type(this : IPropertyDescriptionSearchInfo*, paggtype : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_AGGREGATION_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_aggregation_type.call(this, paggtype)
    end
    def get_condition_type(this : IPropertyDescriptionSearchInfo*, pcontype : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_CONDITION_TYPE*, popDefault : Win32cr::System::Search::Common::CONDITION_OPERATION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_condition_type.call(this, pcontype, popDefault)
    end
    def get_enum_type_list(this : IPropertyDescriptionSearchInfo*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enum_type_list.call(this, riid, ppv)
    end
    def coerce_to_canonical_value(this : IPropertyDescriptionSearchInfo*, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.coerce_to_canonical_value.call(this, ppropvar)
    end
    def format_for_display(this : IPropertyDescriptionSearchInfo*, propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pdfFlags : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_FORMAT_FLAGS, ppszDisplay : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.format_for_display.call(this, propvar, pdfFlags, ppszDisplay)
    end
    def is_value_canonical(this : IPropertyDescriptionSearchInfo*, propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_value_canonical.call(this, propvar)
    end
    def get_search_info_flags(this : IPropertyDescriptionSearchInfo*, ppdsiFlags : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_SEARCHINFO_FLAGS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_search_info_flags.call(this, ppdsiFlags)
    end
    def get_column_index_type(this : IPropertyDescriptionSearchInfo*, ppdciType : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_COLUMNINDEX_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_column_index_type.call(this, ppdciType)
    end
    def get_projection_string(this : IPropertyDescriptionSearchInfo*, ppszProjection : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_projection_string.call(this, ppszProjection)
    end
    def get_max_size(this : IPropertyDescriptionSearchInfo*, pcbMaxSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_size.call(this, pcbMaxSize)
    end

  end

  @[Extern]
  record IPropertyDescriptionRelatedPropertyInfoVtbl,
    query_interface : Proc(IPropertyDescriptionRelatedPropertyInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPropertyDescriptionRelatedPropertyInfo*, UInt32),
    release : Proc(IPropertyDescriptionRelatedPropertyInfo*, UInt32),
    get_property_key : Proc(IPropertyDescriptionRelatedPropertyInfo*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::Foundation::HRESULT),
    get_canonical_name : Proc(IPropertyDescriptionRelatedPropertyInfo*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_property_type : Proc(IPropertyDescriptionRelatedPropertyInfo*, UInt16*, Win32cr::Foundation::HRESULT),
    get_display_name : Proc(IPropertyDescriptionRelatedPropertyInfo*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_edit_invitation : Proc(IPropertyDescriptionRelatedPropertyInfo*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_type_flags : Proc(IPropertyDescriptionRelatedPropertyInfo*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_TYPE_FLAGS, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_TYPE_FLAGS*, Win32cr::Foundation::HRESULT),
    get_view_flags : Proc(IPropertyDescriptionRelatedPropertyInfo*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_VIEW_FLAGS*, Win32cr::Foundation::HRESULT),
    get_default_column_width : Proc(IPropertyDescriptionRelatedPropertyInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_display_type : Proc(IPropertyDescriptionRelatedPropertyInfo*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_DISPLAYTYPE*, Win32cr::Foundation::HRESULT),
    get_column_state : Proc(IPropertyDescriptionRelatedPropertyInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_grouping_range : Proc(IPropertyDescriptionRelatedPropertyInfo*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_GROUPING_RANGE*, Win32cr::Foundation::HRESULT),
    get_relative_description_type : Proc(IPropertyDescriptionRelatedPropertyInfo*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_RELATIVEDESCRIPTION_TYPE*, Win32cr::Foundation::HRESULT),
    get_relative_description : Proc(IPropertyDescriptionRelatedPropertyInfo*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_sort_description : Proc(IPropertyDescriptionRelatedPropertyInfo*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_SORTDESCRIPTION*, Win32cr::Foundation::HRESULT),
    get_sort_description_label : Proc(IPropertyDescriptionRelatedPropertyInfo*, Win32cr::Foundation::BOOL, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_aggregation_type : Proc(IPropertyDescriptionRelatedPropertyInfo*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_AGGREGATION_TYPE*, Win32cr::Foundation::HRESULT),
    get_condition_type : Proc(IPropertyDescriptionRelatedPropertyInfo*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_CONDITION_TYPE*, Win32cr::System::Search::Common::CONDITION_OPERATION*, Win32cr::Foundation::HRESULT),
    get_enum_type_list : Proc(IPropertyDescriptionRelatedPropertyInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    coerce_to_canonical_value : Proc(IPropertyDescriptionRelatedPropertyInfo*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    format_for_display : Proc(IPropertyDescriptionRelatedPropertyInfo*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_FORMAT_FLAGS, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    is_value_canonical : Proc(IPropertyDescriptionRelatedPropertyInfo*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    get_related_property : Proc(IPropertyDescriptionRelatedPropertyInfo*, Win32cr::Foundation::PWSTR, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPropertyDescriptionRelatedPropertyInfo, lpVtbl : IPropertyDescriptionRelatedPropertyInfoVtbl* do
    GUID = LibC::GUID.new(0x507393f4_u32, 0x2a3d_u16, 0x4a60_u16, StaticArray[0xb5_u8, 0x9e_u8, 0xd9_u8, 0xc7_u8, 0x57_u8, 0x16_u8, 0xc2_u8, 0xdd_u8])
    def query_interface(this : IPropertyDescriptionRelatedPropertyInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPropertyDescriptionRelatedPropertyInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPropertyDescriptionRelatedPropertyInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_property_key(this : IPropertyDescriptionRelatedPropertyInfo*, pkey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_key.call(this, pkey)
    end
    def get_canonical_name(this : IPropertyDescriptionRelatedPropertyInfo*, ppszName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_canonical_name.call(this, ppszName)
    end
    def get_property_type(this : IPropertyDescriptionRelatedPropertyInfo*, pvartype : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_type.call(this, pvartype)
    end
    def get_display_name(this : IPropertyDescriptionRelatedPropertyInfo*, ppszName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_name.call(this, ppszName)
    end
    def get_edit_invitation(this : IPropertyDescriptionRelatedPropertyInfo*, ppszInvite : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_edit_invitation.call(this, ppszInvite)
    end
    def get_type_flags(this : IPropertyDescriptionRelatedPropertyInfo*, mask : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_TYPE_FLAGS, ppdtFlags : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_TYPE_FLAGS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_flags.call(this, mask, ppdtFlags)
    end
    def get_view_flags(this : IPropertyDescriptionRelatedPropertyInfo*, ppdvFlags : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_VIEW_FLAGS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_view_flags.call(this, ppdvFlags)
    end
    def get_default_column_width(this : IPropertyDescriptionRelatedPropertyInfo*, pcxChars : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_default_column_width.call(this, pcxChars)
    end
    def get_display_type(this : IPropertyDescriptionRelatedPropertyInfo*, pdisplaytype : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_DISPLAYTYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_type.call(this, pdisplaytype)
    end
    def get_column_state(this : IPropertyDescriptionRelatedPropertyInfo*, pcsFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_column_state.call(this, pcsFlags)
    end
    def get_grouping_range(this : IPropertyDescriptionRelatedPropertyInfo*, pgr : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_GROUPING_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_grouping_range.call(this, pgr)
    end
    def get_relative_description_type(this : IPropertyDescriptionRelatedPropertyInfo*, prdt : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_RELATIVEDESCRIPTION_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_relative_description_type.call(this, prdt)
    end
    def get_relative_description(this : IPropertyDescriptionRelatedPropertyInfo*, propvar1 : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, propvar2 : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, ppszDesc1 : Win32cr::Foundation::PWSTR*, ppszDesc2 : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_relative_description.call(this, propvar1, propvar2, ppszDesc1, ppszDesc2)
    end
    def get_sort_description(this : IPropertyDescriptionRelatedPropertyInfo*, psd : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_SORTDESCRIPTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sort_description.call(this, psd)
    end
    def get_sort_description_label(this : IPropertyDescriptionRelatedPropertyInfo*, fDescending : Win32cr::Foundation::BOOL, ppszDescription : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sort_description_label.call(this, fDescending, ppszDescription)
    end
    def get_aggregation_type(this : IPropertyDescriptionRelatedPropertyInfo*, paggtype : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_AGGREGATION_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_aggregation_type.call(this, paggtype)
    end
    def get_condition_type(this : IPropertyDescriptionRelatedPropertyInfo*, pcontype : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_CONDITION_TYPE*, popDefault : Win32cr::System::Search::Common::CONDITION_OPERATION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_condition_type.call(this, pcontype, popDefault)
    end
    def get_enum_type_list(this : IPropertyDescriptionRelatedPropertyInfo*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enum_type_list.call(this, riid, ppv)
    end
    def coerce_to_canonical_value(this : IPropertyDescriptionRelatedPropertyInfo*, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.coerce_to_canonical_value.call(this, ppropvar)
    end
    def format_for_display(this : IPropertyDescriptionRelatedPropertyInfo*, propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pdfFlags : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_FORMAT_FLAGS, ppszDisplay : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.format_for_display.call(this, propvar, pdfFlags, ppszDisplay)
    end
    def is_value_canonical(this : IPropertyDescriptionRelatedPropertyInfo*, propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_value_canonical.call(this, propvar)
    end
    def get_related_property(this : IPropertyDescriptionRelatedPropertyInfo*, pszRelationshipName : Win32cr::Foundation::PWSTR, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_related_property.call(this, pszRelationshipName, riid, ppv)
    end

  end

  @[Extern]
  record IPropertySystemVtbl,
    query_interface : Proc(IPropertySystem*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPropertySystem*, UInt32),
    release : Proc(IPropertySystem*, UInt32),
    get_property_description : Proc(IPropertySystem*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_property_description_by_name : Proc(IPropertySystem*, Win32cr::Foundation::PWSTR, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_property_description_list_from_string : Proc(IPropertySystem*, Win32cr::Foundation::PWSTR, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    enumerate_property_descriptions : Proc(IPropertySystem*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_ENUMFILTER, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    format_for_display : Proc(IPropertySystem*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_FORMAT_FLAGS, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    format_for_display_alloc : Proc(IPropertySystem*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::UI::Shell::PropertiesSystem::PROPDESC_FORMAT_FLAGS, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    register_property_schema : Proc(IPropertySystem*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    unregister_property_schema : Proc(IPropertySystem*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    refresh_property_schema : Proc(IPropertySystem*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPropertySystem, lpVtbl : IPropertySystemVtbl* do
    GUID = LibC::GUID.new(0xca724e8a_u32, 0xc3e6_u16, 0x442b_u16, StaticArray[0x88_u8, 0xa4_u8, 0x6f_u8, 0xb0_u8, 0xdb_u8, 0x80_u8, 0x35_u8, 0xa3_u8])
    def query_interface(this : IPropertySystem*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPropertySystem*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPropertySystem*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_property_description(this : IPropertySystem*, propkey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_description.call(this, propkey, riid, ppv)
    end
    def get_property_description_by_name(this : IPropertySystem*, pszCanonicalName : Win32cr::Foundation::PWSTR, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_description_by_name.call(this, pszCanonicalName, riid, ppv)
    end
    def get_property_description_list_from_string(this : IPropertySystem*, pszPropList : Win32cr::Foundation::PWSTR, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_description_list_from_string.call(this, pszPropList, riid, ppv)
    end
    def enumerate_property_descriptions(this : IPropertySystem*, filterOn : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_ENUMFILTER, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enumerate_property_descriptions.call(this, filterOn, riid, ppv)
    end
    def format_for_display(this : IPropertySystem*, key : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pdff : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_FORMAT_FLAGS, pszText : UInt16*, cchText : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.format_for_display.call(this, key, propvar, pdff, pszText, cchText)
    end
    def format_for_display_alloc(this : IPropertySystem*, key : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pdff : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_FORMAT_FLAGS, ppszDisplay : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.format_for_display_alloc.call(this, key, propvar, pdff, ppszDisplay)
    end
    def register_property_schema(this : IPropertySystem*, pszPath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_property_schema.call(this, pszPath)
    end
    def unregister_property_schema(this : IPropertySystem*, pszPath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unregister_property_schema.call(this, pszPath)
    end
    def refresh_property_schema(this : IPropertySystem*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh_property_schema.call(this)
    end

  end

  @[Extern]
  record IPropertyDescriptionListVtbl,
    query_interface : Proc(IPropertyDescriptionList*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPropertyDescriptionList*, UInt32),
    release : Proc(IPropertyDescriptionList*, UInt32),
    get_count : Proc(IPropertyDescriptionList*, UInt32*, Win32cr::Foundation::HRESULT),
    get_at : Proc(IPropertyDescriptionList*, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPropertyDescriptionList, lpVtbl : IPropertyDescriptionListVtbl* do
    GUID = LibC::GUID.new(0x1f9fc1d0_u32, 0xc39b_u16, 0x4b26_u16, StaticArray[0x81_u8, 0x7f_u8, 0x1_u8, 0x19_u8, 0x67_u8, 0xd3_u8, 0x44_u8, 0xe_u8])
    def query_interface(this : IPropertyDescriptionList*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPropertyDescriptionList*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPropertyDescriptionList*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_count(this : IPropertyDescriptionList*, pcElem : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, pcElem)
    end
    def get_at(this : IPropertyDescriptionList*, iElem : UInt32, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_at.call(this, iElem, riid, ppv)
    end

  end

  @[Extern]
  record IPropertyStoreFactoryVtbl,
    query_interface : Proc(IPropertyStoreFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPropertyStoreFactory*, UInt32),
    release : Proc(IPropertyStoreFactory*, UInt32),
    get_property_store : Proc(IPropertyStoreFactory*, Win32cr::UI::Shell::PropertiesSystem::GETPROPERTYSTOREFLAGS, Void*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_property_store_for_keys : Proc(IPropertyStoreFactory*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, UInt32, Win32cr::UI::Shell::PropertiesSystem::GETPROPERTYSTOREFLAGS, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPropertyStoreFactory, lpVtbl : IPropertyStoreFactoryVtbl* do
    GUID = LibC::GUID.new(0xbc110b6d_u32, 0x57e8_u16, 0x4148_u16, StaticArray[0xa9_u8, 0xc6_u8, 0x91_u8, 0x1_u8, 0x5a_u8, 0xb2_u8, 0xf3_u8, 0xa5_u8])
    def query_interface(this : IPropertyStoreFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPropertyStoreFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPropertyStoreFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_property_store(this : IPropertyStoreFactory*, flags : Win32cr::UI::Shell::PropertiesSystem::GETPROPERTYSTOREFLAGS, pUnkFactory : Void*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_store.call(this, flags, pUnkFactory, riid, ppv)
    end
    def get_property_store_for_keys(this : IPropertyStoreFactory*, rgKeys : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, cKeys : UInt32, flags : Win32cr::UI::Shell::PropertiesSystem::GETPROPERTYSTOREFLAGS, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_store_for_keys.call(this, rgKeys, cKeys, flags, riid, ppv)
    end

  end

  @[Extern]
  record IDelayedPropertyStoreFactoryVtbl,
    query_interface : Proc(IDelayedPropertyStoreFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDelayedPropertyStoreFactory*, UInt32),
    release : Proc(IDelayedPropertyStoreFactory*, UInt32),
    get_property_store : Proc(IDelayedPropertyStoreFactory*, Win32cr::UI::Shell::PropertiesSystem::GETPROPERTYSTOREFLAGS, Void*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_property_store_for_keys : Proc(IDelayedPropertyStoreFactory*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, UInt32, Win32cr::UI::Shell::PropertiesSystem::GETPROPERTYSTOREFLAGS, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_delayed_property_store : Proc(IDelayedPropertyStoreFactory*, Win32cr::UI::Shell::PropertiesSystem::GETPROPERTYSTOREFLAGS, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDelayedPropertyStoreFactory, lpVtbl : IDelayedPropertyStoreFactoryVtbl* do
    GUID = LibC::GUID.new(0x40d4577f_u32, 0xe237_u16, 0x4bdb_u16, StaticArray[0xbd_u8, 0x69_u8, 0x58_u8, 0xf0_u8, 0x89_u8, 0x43_u8, 0x1b_u8, 0x6a_u8])
    def query_interface(this : IDelayedPropertyStoreFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDelayedPropertyStoreFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDelayedPropertyStoreFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_property_store(this : IDelayedPropertyStoreFactory*, flags : Win32cr::UI::Shell::PropertiesSystem::GETPROPERTYSTOREFLAGS, pUnkFactory : Void*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_store.call(this, flags, pUnkFactory, riid, ppv)
    end
    def get_property_store_for_keys(this : IDelayedPropertyStoreFactory*, rgKeys : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, cKeys : UInt32, flags : Win32cr::UI::Shell::PropertiesSystem::GETPROPERTYSTOREFLAGS, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_store_for_keys.call(this, rgKeys, cKeys, flags, riid, ppv)
    end
    def get_delayed_property_store(this : IDelayedPropertyStoreFactory*, flags : Win32cr::UI::Shell::PropertiesSystem::GETPROPERTYSTOREFLAGS, dwStoreId : UInt32, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_delayed_property_store.call(this, flags, dwStoreId, riid, ppv)
    end

  end

  @[Extern]
  record IPersistSerializedPropStorageVtbl,
    query_interface : Proc(IPersistSerializedPropStorage*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPersistSerializedPropStorage*, UInt32),
    release : Proc(IPersistSerializedPropStorage*, UInt32),
    set_flags : Proc(IPersistSerializedPropStorage*, Int32, Win32cr::Foundation::HRESULT),
    set_property_storage : Proc(IPersistSerializedPropStorage*, Win32cr::UI::Shell::PropertiesSystem::SERIALIZEDPROPSTORAGE*, UInt32, Win32cr::Foundation::HRESULT),
    get_property_storage : Proc(IPersistSerializedPropStorage*, Win32cr::UI::Shell::PropertiesSystem::SERIALIZEDPROPSTORAGE**, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPersistSerializedPropStorage, lpVtbl : IPersistSerializedPropStorageVtbl* do
    GUID = LibC::GUID.new(0xe318ad57_u32, 0xaa0_u16, 0x450f_u16, StaticArray[0xac_u8, 0xa5_u8, 0x6f_u8, 0xab_u8, 0x71_u8, 0x3_u8, 0xd9_u8, 0x17_u8])
    def query_interface(this : IPersistSerializedPropStorage*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPersistSerializedPropStorage*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPersistSerializedPropStorage*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_flags(this : IPersistSerializedPropStorage*, flags : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_flags.call(this, flags)
    end
    def set_property_storage(this : IPersistSerializedPropStorage*, psps : Win32cr::UI::Shell::PropertiesSystem::SERIALIZEDPROPSTORAGE*, cb : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property_storage.call(this, psps, cb)
    end
    def get_property_storage(this : IPersistSerializedPropStorage*, ppsps : Win32cr::UI::Shell::PropertiesSystem::SERIALIZEDPROPSTORAGE**, pcb : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_storage.call(this, ppsps, pcb)
    end

  end

  @[Extern]
  record IPersistSerializedPropStorage2Vtbl,
    query_interface : Proc(IPersistSerializedPropStorage2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPersistSerializedPropStorage2*, UInt32),
    release : Proc(IPersistSerializedPropStorage2*, UInt32),
    set_flags : Proc(IPersistSerializedPropStorage2*, Int32, Win32cr::Foundation::HRESULT),
    set_property_storage : Proc(IPersistSerializedPropStorage2*, Win32cr::UI::Shell::PropertiesSystem::SERIALIZEDPROPSTORAGE*, UInt32, Win32cr::Foundation::HRESULT),
    get_property_storage : Proc(IPersistSerializedPropStorage2*, Win32cr::UI::Shell::PropertiesSystem::SERIALIZEDPROPSTORAGE**, UInt32*, Win32cr::Foundation::HRESULT),
    get_property_storage_size : Proc(IPersistSerializedPropStorage2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_property_storage_buffer : Proc(IPersistSerializedPropStorage2*, Win32cr::UI::Shell::PropertiesSystem::SERIALIZEDPROPSTORAGE*, UInt32, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPersistSerializedPropStorage2, lpVtbl : IPersistSerializedPropStorage2Vtbl* do
    GUID = LibC::GUID.new(0x77effa68_u32, 0x4f98_u16, 0x4366_u16, StaticArray[0xba_u8, 0x72_u8, 0x57_u8, 0x3b_u8, 0x3d_u8, 0x88_u8, 0x5_u8, 0x71_u8])
    def query_interface(this : IPersistSerializedPropStorage2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPersistSerializedPropStorage2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPersistSerializedPropStorage2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_flags(this : IPersistSerializedPropStorage2*, flags : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_flags.call(this, flags)
    end
    def set_property_storage(this : IPersistSerializedPropStorage2*, psps : Win32cr::UI::Shell::PropertiesSystem::SERIALIZEDPROPSTORAGE*, cb : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property_storage.call(this, psps, cb)
    end
    def get_property_storage(this : IPersistSerializedPropStorage2*, ppsps : Win32cr::UI::Shell::PropertiesSystem::SERIALIZEDPROPSTORAGE**, pcb : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_storage.call(this, ppsps, pcb)
    end
    def get_property_storage_size(this : IPersistSerializedPropStorage2*, pcb : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_storage_size.call(this, pcb)
    end
    def get_property_storage_buffer(this : IPersistSerializedPropStorage2*, psps : Win32cr::UI::Shell::PropertiesSystem::SERIALIZEDPROPSTORAGE*, cb : UInt32, pcbWritten : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_storage_buffer.call(this, psps, cb, pcbWritten)
    end

  end

  @[Extern]
  record IPropertySystemChangeNotifyVtbl,
    query_interface : Proc(IPropertySystemChangeNotify*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPropertySystemChangeNotify*, UInt32),
    release : Proc(IPropertySystemChangeNotify*, UInt32),
    schema_refreshed : Proc(IPropertySystemChangeNotify*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPropertySystemChangeNotify, lpVtbl : IPropertySystemChangeNotifyVtbl* do
    GUID = LibC::GUID.new(0xfa955fd9_u32, 0x38be_u16, 0x4879_u16, StaticArray[0xa6_u8, 0xce_u8, 0x82_u8, 0x4c_u8, 0xf5_u8, 0x2d_u8, 0x60_u8, 0x9f_u8])
    def query_interface(this : IPropertySystemChangeNotify*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPropertySystemChangeNotify*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPropertySystemChangeNotify*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def schema_refreshed(this : IPropertySystemChangeNotify*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.schema_refreshed.call(this)
    end

  end

  @[Extern]
  record ICreateObjectVtbl,
    query_interface : Proc(ICreateObject*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICreateObject*, UInt32),
    release : Proc(ICreateObject*, UInt32),
    create_object : Proc(ICreateObject*, LibC::GUID*, Void*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICreateObject, lpVtbl : ICreateObjectVtbl* do
    GUID = LibC::GUID.new(0x75121952_u32, 0xe0d0_u16, 0x43e5_u16, StaticArray[0x93_u8, 0x80_u8, 0x1d_u8, 0x80_u8, 0x48_u8, 0x3a_u8, 0xcf_u8, 0x72_u8])
    def query_interface(this : ICreateObject*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICreateObject*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICreateObject*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_object(this : ICreateObject*, clsid : LibC::GUID*, pUnkOuter : Void*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_object.call(this, clsid, pUnkOuter, riid, ppv)
    end

  end

  @[Extern]
  record IPropertyUIVtbl,
    query_interface : Proc(IPropertyUI*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPropertyUI*, UInt32),
    release : Proc(IPropertyUI*, UInt32),
    parse_property_name : Proc(IPropertyUI*, Win32cr::Foundation::PWSTR, LibC::GUID*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_cannonical_name : Proc(IPropertyUI*, LibC::GUID*, UInt32, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    get_display_name : Proc(IPropertyUI*, LibC::GUID*, UInt32, Win32cr::UI::Shell::PropertiesSystem::PROPERTYUI_NAME_FLAGS, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    get_property_description : Proc(IPropertyUI*, LibC::GUID*, UInt32, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    get_default_width : Proc(IPropertyUI*, LibC::GUID*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_flags : Proc(IPropertyUI*, LibC::GUID*, UInt32, Win32cr::UI::Shell::PropertiesSystem::PROPERTYUI_FLAGS*, Win32cr::Foundation::HRESULT),
    format_for_display : Proc(IPropertyUI*, LibC::GUID*, UInt32, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYUI_FORMAT_FLAGS, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    get_help_info : Proc(IPropertyUI*, LibC::GUID*, UInt32, UInt16*, UInt32, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPropertyUI, lpVtbl : IPropertyUIVtbl* do
    GUID = LibC::GUID.new(0x757a7d9f_u32, 0x919a_u16, 0x4118_u16, StaticArray[0x99_u8, 0xd7_u8, 0xdb_u8, 0xb2_u8, 0x8_u8, 0xc8_u8, 0xcc_u8, 0x66_u8])
    def query_interface(this : IPropertyUI*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPropertyUI*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPropertyUI*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def parse_property_name(this : IPropertyUI*, pszName : Win32cr::Foundation::PWSTR, pfmtid : LibC::GUID*, ppid : UInt32*, pchEaten : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.parse_property_name.call(this, pszName, pfmtid, ppid, pchEaten)
    end
    def get_cannonical_name(this : IPropertyUI*, fmtid : LibC::GUID*, pid : UInt32, pwszText : UInt16*, cchText : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cannonical_name.call(this, fmtid, pid, pwszText, cchText)
    end
    def get_display_name(this : IPropertyUI*, fmtid : LibC::GUID*, pid : UInt32, flags : Win32cr::UI::Shell::PropertiesSystem::PROPERTYUI_NAME_FLAGS, pwszText : UInt16*, cchText : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_name.call(this, fmtid, pid, flags, pwszText, cchText)
    end
    def get_property_description(this : IPropertyUI*, fmtid : LibC::GUID*, pid : UInt32, pwszText : UInt16*, cchText : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_description.call(this, fmtid, pid, pwszText, cchText)
    end
    def get_default_width(this : IPropertyUI*, fmtid : LibC::GUID*, pid : UInt32, pcxChars : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_default_width.call(this, fmtid, pid, pcxChars)
    end
    def get_flags(this : IPropertyUI*, fmtid : LibC::GUID*, pid : UInt32, pflags : Win32cr::UI::Shell::PropertiesSystem::PROPERTYUI_FLAGS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_flags.call(this, fmtid, pid, pflags)
    end
    def format_for_display(this : IPropertyUI*, fmtid : LibC::GUID*, pid : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, puiff : Win32cr::UI::Shell::PropertiesSystem::PROPERTYUI_FORMAT_FLAGS, pwszText : UInt16*, cchText : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.format_for_display.call(this, fmtid, pid, ppropvar, puiff, pwszText, cchText)
    end
    def get_help_info(this : IPropertyUI*, fmtid : LibC::GUID*, pid : UInt32, pwszHelpFile : UInt16*, cch : UInt32, puHelpID : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_help_info.call(this, fmtid, pid, pwszHelpFile, cch, puHelpID)
    end

  end

  @[Link("propsys")]
  @[Link("shell32")]
  lib C
    fun PropVariantToWinRTPropertyValue(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

    fun WinRTPropertyValueToPropVariant(punkPropertyValue : Void*, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    fun PSFormatForDisplay(propkey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pdfFlags : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_FORMAT_FLAGS, pwszText : UInt16*, cchText : UInt32) : Win32cr::Foundation::HRESULT

    fun PSFormatForDisplayAlloc(key : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pdff : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_FORMAT_FLAGS, ppszDisplay : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun PSFormatPropertyValue(pps : Void*, ppd : Void*, pdff : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_FORMAT_FLAGS, ppszDisplay : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun PSGetImageReferenceForValue(propkey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, ppszImageRes : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun PSStringFromPropertyKey(pkey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, psz : UInt16*, cch : UInt32) : Win32cr::Foundation::HRESULT

    fun PSPropertyKeyFromString(pszString : Win32cr::Foundation::PWSTR, pkey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*) : Win32cr::Foundation::HRESULT

    fun PSCreateMemoryPropertyStore(riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

    fun PSCreateDelayedMultiplexPropertyStore(flags : Win32cr::UI::Shell::PropertiesSystem::GETPROPERTYSTOREFLAGS, pdpsf : Void*, rgStoreIds : UInt32*, cStores : UInt32, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

    fun PSCreateMultiplexPropertyStore(prgpunkStores : Void**, cStores : UInt32, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

    fun PSCreatePropertyChangeArray(rgpropkey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, rgflags : Win32cr::UI::Shell::PropertiesSystem::PKA_FLAGS*, rgpropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, cChanges : UInt32, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

    fun PSCreateSimplePropertyChange(flags : Win32cr::UI::Shell::PropertiesSystem::PKA_FLAGS, key : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

    fun PSGetPropertyDescription(propkey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

    fun PSGetPropertyDescriptionByName(pszCanonicalName : Win32cr::Foundation::PWSTR, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

    fun PSLookupPropertyHandlerCLSID(pszFilePath : Win32cr::Foundation::PWSTR, pclsid : LibC::GUID*) : Win32cr::Foundation::HRESULT

    fun PSGetItemPropertyHandler(punkItem : Void*, fReadWrite : Win32cr::Foundation::BOOL, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

    fun PSGetItemPropertyHandlerWithCreateObject(punkItem : Void*, fReadWrite : Win32cr::Foundation::BOOL, punkCreateObject : Void*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

    fun PSGetPropertyValue(pps : Void*, ppd : Void*, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    fun PSSetPropertyValue(pps : Void*, ppd : Void*, propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    fun PSRegisterPropertySchema(pszPath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun PSUnregisterPropertySchema(pszPath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun PSRefreshPropertySchema : Win32cr::Foundation::HRESULT

    fun PSEnumeratePropertyDescriptions(filterOn : Win32cr::UI::Shell::PropertiesSystem::PROPDESC_ENUMFILTER, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

    fun PSGetPropertyKeyFromName(pszName : Win32cr::Foundation::PWSTR, ppropkey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*) : Win32cr::Foundation::HRESULT

    fun PSGetNameFromPropertyKey(propkey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, ppszCanonicalName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun PSCoerceToCanonicalValue(key : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    fun PSGetPropertyDescriptionListFromString(pszPropList : Win32cr::Foundation::PWSTR, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

    fun PSCreatePropertyStoreFromPropertySetStorage(ppss : Void*, grfMode : UInt32, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

    fun PSCreatePropertyStoreFromObject(punk : Void*, grfMode : UInt32, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

    fun PSCreateAdapterFromPropertyStore(pps : Void*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

    fun PSGetPropertySystem(riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

    fun PSGetPropertyFromPropertyStorage(psps : Win32cr::UI::Shell::PropertiesSystem::SERIALIZEDPROPSTORAGE*, cb : UInt32, rpkey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    fun PSGetNamedPropertyFromPropertyStorage(psps : Win32cr::UI::Shell::PropertiesSystem::SERIALIZEDPROPSTORAGE*, cb : UInt32, pszName : Win32cr::Foundation::PWSTR, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    fun PSPropertyBag_ReadType(propBag : Void*, propName : Win32cr::Foundation::PWSTR, var : Win32cr::System::Com::VARIANT*, type__ : UInt16) : Win32cr::Foundation::HRESULT

    fun PSPropertyBag_ReadStr(propBag : Void*, propName : Win32cr::Foundation::PWSTR, value : UInt16*, characterCount : Int32) : Win32cr::Foundation::HRESULT

    fun PSPropertyBag_ReadStrAlloc(propBag : Void*, propName : Win32cr::Foundation::PWSTR, value : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun PSPropertyBag_ReadBSTR(propBag : Void*, propName : Win32cr::Foundation::PWSTR, value : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT

    fun PSPropertyBag_WriteStr(propBag : Void*, propName : Win32cr::Foundation::PWSTR, value : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun PSPropertyBag_WriteBSTR(propBag : Void*, propName : Win32cr::Foundation::PWSTR, value : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT

    fun PSPropertyBag_ReadInt(propBag : Void*, propName : Win32cr::Foundation::PWSTR, value : Int32*) : Win32cr::Foundation::HRESULT

    fun PSPropertyBag_WriteInt(propBag : Void*, propName : Win32cr::Foundation::PWSTR, value : Int32) : Win32cr::Foundation::HRESULT

    fun PSPropertyBag_ReadSHORT(propBag : Void*, propName : Win32cr::Foundation::PWSTR, value : Int16*) : Win32cr::Foundation::HRESULT

    fun PSPropertyBag_WriteSHORT(propBag : Void*, propName : Win32cr::Foundation::PWSTR, value : Int16) : Win32cr::Foundation::HRESULT

    fun PSPropertyBag_ReadLONG(propBag : Void*, propName : Win32cr::Foundation::PWSTR, value : Int32*) : Win32cr::Foundation::HRESULT

    fun PSPropertyBag_WriteLONG(propBag : Void*, propName : Win32cr::Foundation::PWSTR, value : Int32) : Win32cr::Foundation::HRESULT

    fun PSPropertyBag_ReadDWORD(propBag : Void*, propName : Win32cr::Foundation::PWSTR, value : UInt32*) : Win32cr::Foundation::HRESULT

    fun PSPropertyBag_WriteDWORD(propBag : Void*, propName : Win32cr::Foundation::PWSTR, value : UInt32) : Win32cr::Foundation::HRESULT

    fun PSPropertyBag_ReadBOOL(propBag : Void*, propName : Win32cr::Foundation::PWSTR, value : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    fun PSPropertyBag_WriteBOOL(propBag : Void*, propName : Win32cr::Foundation::PWSTR, value : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT

    fun PSPropertyBag_ReadPOINTL(propBag : Void*, propName : Win32cr::Foundation::PWSTR, value : Win32cr::Foundation::POINTL*) : Win32cr::Foundation::HRESULT

    fun PSPropertyBag_WritePOINTL(propBag : Void*, propName : Win32cr::Foundation::PWSTR, value : Win32cr::Foundation::POINTL*) : Win32cr::Foundation::HRESULT

    fun PSPropertyBag_ReadPOINTS(propBag : Void*, propName : Win32cr::Foundation::PWSTR, value : Win32cr::Foundation::POINTS*) : Win32cr::Foundation::HRESULT

    fun PSPropertyBag_WritePOINTS(propBag : Void*, propName : Win32cr::Foundation::PWSTR, value : Win32cr::Foundation::POINTS*) : Win32cr::Foundation::HRESULT

    fun PSPropertyBag_ReadRECTL(propBag : Void*, propName : Win32cr::Foundation::PWSTR, value : Win32cr::Foundation::RECTL*) : Win32cr::Foundation::HRESULT

    fun PSPropertyBag_WriteRECTL(propBag : Void*, propName : Win32cr::Foundation::PWSTR, value : Win32cr::Foundation::RECTL*) : Win32cr::Foundation::HRESULT

    fun PSPropertyBag_ReadStream(propBag : Void*, propName : Win32cr::Foundation::PWSTR, value : Void**) : Win32cr::Foundation::HRESULT

    fun PSPropertyBag_WriteStream(propBag : Void*, propName : Win32cr::Foundation::PWSTR, value : Void*) : Win32cr::Foundation::HRESULT

    fun PSPropertyBag_Delete(propBag : Void*, propName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun PSPropertyBag_ReadULONGLONG(propBag : Void*, propName : Win32cr::Foundation::PWSTR, value : UInt64*) : Win32cr::Foundation::HRESULT

    fun PSPropertyBag_WriteULONGLONG(propBag : Void*, propName : Win32cr::Foundation::PWSTR, value : UInt64) : Win32cr::Foundation::HRESULT

    fun PSPropertyBag_ReadUnknown(propBag : Void*, propName : Win32cr::Foundation::PWSTR, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

    fun PSPropertyBag_WriteUnknown(propBag : Void*, propName : Win32cr::Foundation::PWSTR, punk : Void*) : Win32cr::Foundation::HRESULT

    fun PSPropertyBag_ReadGUID(propBag : Void*, propName : Win32cr::Foundation::PWSTR, value : LibC::GUID*) : Win32cr::Foundation::HRESULT

    fun PSPropertyBag_WriteGUID(propBag : Void*, propName : Win32cr::Foundation::PWSTR, value : LibC::GUID*) : Win32cr::Foundation::HRESULT

    fun PSPropertyBag_ReadPropertyKey(propBag : Void*, propName : Win32cr::Foundation::PWSTR, value : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*) : Win32cr::Foundation::HRESULT

    fun PSPropertyBag_WritePropertyKey(propBag : Void*, propName : Win32cr::Foundation::PWSTR, value : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*) : Win32cr::Foundation::HRESULT

    fun InitPropVariantFromResource(hinst : Win32cr::Foundation::HINSTANCE, id : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    fun InitPropVariantFromBuffer(pv : Void*, cb : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    fun InitPropVariantFromCLSID(clsid : LibC::GUID*, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    fun InitPropVariantFromGUIDAsString(guid : LibC::GUID*, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    fun InitPropVariantFromFileTime(pftIn : Win32cr::Foundation::FILETIME*, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    fun InitPropVariantFromPropVariantVectorElem(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, iElem : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    fun InitPropVariantVectorFromPropVariant(propvarSingle : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, ppropvarVector : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    fun InitPropVariantFromStrRet(pstrret : Win32cr::UI::Shell::Common::STRRET*, pidl : Win32cr::UI::Shell::Common::ITEMIDLIST*, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    fun InitPropVariantFromBooleanVector(prgf : Win32cr::Foundation::BOOL*, cElems : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    fun InitPropVariantFromInt16Vector(prgn : Int16*, cElems : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    fun InitPropVariantFromUInt16Vector(prgn : UInt16*, cElems : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    fun InitPropVariantFromInt32Vector(prgn : Int32*, cElems : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    fun InitPropVariantFromUInt32Vector(prgn : UInt32*, cElems : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    fun InitPropVariantFromInt64Vector(prgn : Int64*, cElems : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    fun InitPropVariantFromUInt64Vector(prgn : UInt64*, cElems : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    fun InitPropVariantFromDoubleVector(prgn : Float64*, cElems : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    fun InitPropVariantFromFileTimeVector(prgft : Win32cr::Foundation::FILETIME*, cElems : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    fun InitPropVariantFromStringVector(prgsz : Win32cr::Foundation::PWSTR*, cElems : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    fun InitPropVariantFromStringAsVector(psz : Win32cr::Foundation::PWSTR, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    fun PropVariantToBooleanWithDefault(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, fDefault : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun PropVariantToInt16WithDefault(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, iDefault : Int16) : Int16

    fun PropVariantToUInt16WithDefault(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, uiDefault : UInt16) : UInt16

    fun PropVariantToInt32WithDefault(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, lDefault : Int32) : Int32

    fun PropVariantToUInt32WithDefault(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, ulDefault : UInt32) : UInt32

    fun PropVariantToInt64WithDefault(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, llDefault : Int64) : Int64

    fun PropVariantToUInt64WithDefault(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, ullDefault : UInt64) : UInt64

    fun PropVariantToDoubleWithDefault(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, dblDefault : Float64) : Float64

    fun PropVariantToStringWithDefault(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pszDefault : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::PWSTR

    fun PropVariantToBoolean(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pfRet : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    fun PropVariantToInt16(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, piRet : Int16*) : Win32cr::Foundation::HRESULT

    fun PropVariantToUInt16(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, puiRet : UInt16*) : Win32cr::Foundation::HRESULT

    fun PropVariantToInt32(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, plRet : Int32*) : Win32cr::Foundation::HRESULT

    fun PropVariantToUInt32(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pulRet : UInt32*) : Win32cr::Foundation::HRESULT

    fun PropVariantToInt64(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pllRet : Int64*) : Win32cr::Foundation::HRESULT

    fun PropVariantToUInt64(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pullRet : UInt64*) : Win32cr::Foundation::HRESULT

    fun PropVariantToDouble(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pdblRet : Float64*) : Win32cr::Foundation::HRESULT

    fun PropVariantToBuffer(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pv : Void*, cb : UInt32) : Win32cr::Foundation::HRESULT

    fun PropVariantToString(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, psz : UInt16*, cch : UInt32) : Win32cr::Foundation::HRESULT

    fun PropVariantToGUID(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pguid : LibC::GUID*) : Win32cr::Foundation::HRESULT

    fun PropVariantToStringAlloc(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, ppszOut : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun PropVariantToBSTR(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pbstrOut : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT

    fun PropVariantToStrRet(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pstrret : Win32cr::UI::Shell::Common::STRRET*) : Win32cr::Foundation::HRESULT

    fun PropVariantToFileTime(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pstfOut : Win32cr::UI::Shell::PropertiesSystem::PSTIME_FLAGS, pftOut : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT

    fun PropVariantGetElementCount(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : UInt32

    fun PropVariantToBooleanVector(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, prgf : Win32cr::Foundation::BOOL*, crgf : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    fun PropVariantToInt16Vector(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, prgn : Int16*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    fun PropVariantToUInt16Vector(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, prgn : UInt16*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    fun PropVariantToInt32Vector(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, prgn : Int32*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    fun PropVariantToUInt32Vector(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, prgn : UInt32*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    fun PropVariantToInt64Vector(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, prgn : Int64*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    fun PropVariantToUInt64Vector(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, prgn : UInt64*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    fun PropVariantToDoubleVector(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, prgn : Float64*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    fun PropVariantToFileTimeVector(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, prgft : Win32cr::Foundation::FILETIME*, crgft : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    fun PropVariantToStringVector(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, prgsz : Win32cr::Foundation::PWSTR*, crgsz : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    fun PropVariantToBooleanVectorAlloc(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pprgf : Win32cr::Foundation::BOOL**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    fun PropVariantToInt16VectorAlloc(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pprgn : Int16**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    fun PropVariantToUInt16VectorAlloc(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pprgn : UInt16**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    fun PropVariantToInt32VectorAlloc(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pprgn : Int32**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    fun PropVariantToUInt32VectorAlloc(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pprgn : UInt32**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    fun PropVariantToInt64VectorAlloc(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pprgn : Int64**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    fun PropVariantToUInt64VectorAlloc(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pprgn : UInt64**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    fun PropVariantToDoubleVectorAlloc(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pprgn : Float64**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    fun PropVariantToFileTimeVectorAlloc(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pprgft : Win32cr::Foundation::FILETIME**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    fun PropVariantToStringVectorAlloc(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pprgsz : Win32cr::Foundation::PWSTR**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    fun PropVariantGetBooleanElem(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, iElem : UInt32, pfVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    fun PropVariantGetInt16Elem(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, iElem : UInt32, pnVal : Int16*) : Win32cr::Foundation::HRESULT

    fun PropVariantGetUInt16Elem(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, iElem : UInt32, pnVal : UInt16*) : Win32cr::Foundation::HRESULT

    fun PropVariantGetInt32Elem(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, iElem : UInt32, pnVal : Int32*) : Win32cr::Foundation::HRESULT

    fun PropVariantGetUInt32Elem(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, iElem : UInt32, pnVal : UInt32*) : Win32cr::Foundation::HRESULT

    fun PropVariantGetInt64Elem(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, iElem : UInt32, pnVal : Int64*) : Win32cr::Foundation::HRESULT

    fun PropVariantGetUInt64Elem(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, iElem : UInt32, pnVal : UInt64*) : Win32cr::Foundation::HRESULT

    fun PropVariantGetDoubleElem(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, iElem : UInt32, pnVal : Float64*) : Win32cr::Foundation::HRESULT

    fun PropVariantGetFileTimeElem(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, iElem : UInt32, pftVal : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT

    fun PropVariantGetStringElem(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, iElem : UInt32, ppszVal : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun ClearPropVariantArray(rgPropVar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, cVars : UInt32) : Void

    fun PropVariantCompareEx(propvar1 : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, propvar2 : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, unit : Win32cr::UI::Shell::PropertiesSystem::PROPVAR_COMPARE_UNIT, flags : Win32cr::UI::Shell::PropertiesSystem::PROPVAR_COMPARE_FLAGS) : Int32

    fun PropVariantChangeType(ppropvarDest : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, propvarSrc : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, flags : Win32cr::UI::Shell::PropertiesSystem::PROPVAR_CHANGE_FLAGS, vt : UInt16) : Win32cr::Foundation::HRESULT

    fun PropVariantToVariant(pPropVar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pVar : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT

    fun VariantToPropVariant(pVar : Win32cr::System::Com::VARIANT*, pPropVar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    fun InitVariantFromResource(hinst : Win32cr::Foundation::HINSTANCE, id : UInt32, pvar : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT

    fun InitVariantFromBuffer(pv : Void*, cb : UInt32, pvar : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT

    fun InitVariantFromGUIDAsString(guid : LibC::GUID*, pvar : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT

    fun InitVariantFromFileTime(pft : Win32cr::Foundation::FILETIME*, pvar : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT

    fun InitVariantFromFileTimeArray(prgft : Win32cr::Foundation::FILETIME*, cElems : UInt32, pvar : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT

    fun InitVariantFromStrRet(pstrret : Win32cr::UI::Shell::Common::STRRET*, pidl : Win32cr::UI::Shell::Common::ITEMIDLIST*, pvar : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT

    fun InitVariantFromVariantArrayElem(varIn : Win32cr::System::Com::VARIANT*, iElem : UInt32, pvar : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT

    fun InitVariantFromBooleanArray(prgf : Win32cr::Foundation::BOOL*, cElems : UInt32, pvar : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT

    fun InitVariantFromInt16Array(prgn : Int16*, cElems : UInt32, pvar : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT

    fun InitVariantFromUInt16Array(prgn : UInt16*, cElems : UInt32, pvar : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT

    fun InitVariantFromInt32Array(prgn : Int32*, cElems : UInt32, pvar : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT

    fun InitVariantFromUInt32Array(prgn : UInt32*, cElems : UInt32, pvar : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT

    fun InitVariantFromInt64Array(prgn : Int64*, cElems : UInt32, pvar : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT

    fun InitVariantFromUInt64Array(prgn : UInt64*, cElems : UInt32, pvar : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT

    fun InitVariantFromDoubleArray(prgn : Float64*, cElems : UInt32, pvar : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT

    fun InitVariantFromStringArray(prgsz : Win32cr::Foundation::PWSTR*, cElems : UInt32, pvar : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT

    fun VariantToBooleanWithDefault(varIn : Win32cr::System::Com::VARIANT*, fDefault : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun VariantToInt16WithDefault(varIn : Win32cr::System::Com::VARIANT*, iDefault : Int16) : Int16

    fun VariantToUInt16WithDefault(varIn : Win32cr::System::Com::VARIANT*, uiDefault : UInt16) : UInt16

    fun VariantToInt32WithDefault(varIn : Win32cr::System::Com::VARIANT*, lDefault : Int32) : Int32

    fun VariantToUInt32WithDefault(varIn : Win32cr::System::Com::VARIANT*, ulDefault : UInt32) : UInt32

    fun VariantToInt64WithDefault(varIn : Win32cr::System::Com::VARIANT*, llDefault : Int64) : Int64

    fun VariantToUInt64WithDefault(varIn : Win32cr::System::Com::VARIANT*, ullDefault : UInt64) : UInt64

    fun VariantToDoubleWithDefault(varIn : Win32cr::System::Com::VARIANT*, dblDefault : Float64) : Float64

    fun VariantToStringWithDefault(varIn : Win32cr::System::Com::VARIANT*, pszDefault : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::PWSTR

    fun VariantToBoolean(varIn : Win32cr::System::Com::VARIANT*, pfRet : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    fun VariantToInt16(varIn : Win32cr::System::Com::VARIANT*, piRet : Int16*) : Win32cr::Foundation::HRESULT

    fun VariantToUInt16(varIn : Win32cr::System::Com::VARIANT*, puiRet : UInt16*) : Win32cr::Foundation::HRESULT

    fun VariantToInt32(varIn : Win32cr::System::Com::VARIANT*, plRet : Int32*) : Win32cr::Foundation::HRESULT

    fun VariantToUInt32(varIn : Win32cr::System::Com::VARIANT*, pulRet : UInt32*) : Win32cr::Foundation::HRESULT

    fun VariantToInt64(varIn : Win32cr::System::Com::VARIANT*, pllRet : Int64*) : Win32cr::Foundation::HRESULT

    fun VariantToUInt64(varIn : Win32cr::System::Com::VARIANT*, pullRet : UInt64*) : Win32cr::Foundation::HRESULT

    fun VariantToDouble(varIn : Win32cr::System::Com::VARIANT*, pdblRet : Float64*) : Win32cr::Foundation::HRESULT

    fun VariantToBuffer(varIn : Win32cr::System::Com::VARIANT*, pv : Void*, cb : UInt32) : Win32cr::Foundation::HRESULT

    fun VariantToGUID(varIn : Win32cr::System::Com::VARIANT*, pguid : LibC::GUID*) : Win32cr::Foundation::HRESULT

    fun VariantToString(varIn : Win32cr::System::Com::VARIANT*, pszBuf : UInt16*, cchBuf : UInt32) : Win32cr::Foundation::HRESULT

    fun VariantToStringAlloc(varIn : Win32cr::System::Com::VARIANT*, ppszBuf : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun VariantToDosDateTime(varIn : Win32cr::System::Com::VARIANT*, pwDate : UInt16*, pwTime : UInt16*) : Win32cr::Foundation::HRESULT

    fun VariantToStrRet(varIn : Win32cr::System::Com::VARIANT*, pstrret : Win32cr::UI::Shell::Common::STRRET*) : Win32cr::Foundation::HRESULT

    fun VariantToFileTime(varIn : Win32cr::System::Com::VARIANT*, stfOut : Win32cr::UI::Shell::PropertiesSystem::PSTIME_FLAGS, pftOut : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT

    fun VariantGetElementCount(varIn : Win32cr::System::Com::VARIANT*) : UInt32

    fun VariantToBooleanArray(var : Win32cr::System::Com::VARIANT*, prgf : Win32cr::Foundation::BOOL*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    fun VariantToInt16Array(var : Win32cr::System::Com::VARIANT*, prgn : Int16*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    fun VariantToUInt16Array(var : Win32cr::System::Com::VARIANT*, prgn : UInt16*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    fun VariantToInt32Array(var : Win32cr::System::Com::VARIANT*, prgn : Int32*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    fun VariantToUInt32Array(var : Win32cr::System::Com::VARIANT*, prgn : UInt32*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    fun VariantToInt64Array(var : Win32cr::System::Com::VARIANT*, prgn : Int64*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    fun VariantToUInt64Array(var : Win32cr::System::Com::VARIANT*, prgn : UInt64*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    fun VariantToDoubleArray(var : Win32cr::System::Com::VARIANT*, prgn : Float64*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    fun VariantToStringArray(var : Win32cr::System::Com::VARIANT*, prgsz : Win32cr::Foundation::PWSTR*, crgsz : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    fun VariantToBooleanArrayAlloc(var : Win32cr::System::Com::VARIANT*, pprgf : Win32cr::Foundation::BOOL**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    fun VariantToInt16ArrayAlloc(var : Win32cr::System::Com::VARIANT*, pprgn : Int16**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    fun VariantToUInt16ArrayAlloc(var : Win32cr::System::Com::VARIANT*, pprgn : UInt16**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    fun VariantToInt32ArrayAlloc(var : Win32cr::System::Com::VARIANT*, pprgn : Int32**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    fun VariantToUInt32ArrayAlloc(var : Win32cr::System::Com::VARIANT*, pprgn : UInt32**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    fun VariantToInt64ArrayAlloc(var : Win32cr::System::Com::VARIANT*, pprgn : Int64**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    fun VariantToUInt64ArrayAlloc(var : Win32cr::System::Com::VARIANT*, pprgn : UInt64**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    fun VariantToDoubleArrayAlloc(var : Win32cr::System::Com::VARIANT*, pprgn : Float64**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    fun VariantToStringArrayAlloc(var : Win32cr::System::Com::VARIANT*, pprgsz : Win32cr::Foundation::PWSTR**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    fun VariantGetBooleanElem(var : Win32cr::System::Com::VARIANT*, iElem : UInt32, pfVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    fun VariantGetInt16Elem(var : Win32cr::System::Com::VARIANT*, iElem : UInt32, pnVal : Int16*) : Win32cr::Foundation::HRESULT

    fun VariantGetUInt16Elem(var : Win32cr::System::Com::VARIANT*, iElem : UInt32, pnVal : UInt16*) : Win32cr::Foundation::HRESULT

    fun VariantGetInt32Elem(var : Win32cr::System::Com::VARIANT*, iElem : UInt32, pnVal : Int32*) : Win32cr::Foundation::HRESULT

    fun VariantGetUInt32Elem(var : Win32cr::System::Com::VARIANT*, iElem : UInt32, pnVal : UInt32*) : Win32cr::Foundation::HRESULT

    fun VariantGetInt64Elem(var : Win32cr::System::Com::VARIANT*, iElem : UInt32, pnVal : Int64*) : Win32cr::Foundation::HRESULT

    fun VariantGetUInt64Elem(var : Win32cr::System::Com::VARIANT*, iElem : UInt32, pnVal : UInt64*) : Win32cr::Foundation::HRESULT

    fun VariantGetDoubleElem(var : Win32cr::System::Com::VARIANT*, iElem : UInt32, pnVal : Float64*) : Win32cr::Foundation::HRESULT

    fun VariantGetStringElem(var : Win32cr::System::Com::VARIANT*, iElem : UInt32, ppszVal : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun ClearVariantArray(pvars : Win32cr::System::Com::VARIANT*, cvars : UInt32) : Void

    fun VariantCompare(var1 : Win32cr::System::Com::VARIANT*, var2 : Win32cr::System::Com::VARIANT*) : Int32

    fun SHGetPropertyStoreFromIDList(pidl : Win32cr::UI::Shell::Common::ITEMIDLIST*, flags : Win32cr::UI::Shell::PropertiesSystem::GETPROPERTYSTOREFLAGS, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

    fun SHGetPropertyStoreFromParsingName(pszPath : Win32cr::Foundation::PWSTR, pbc : Void*, flags : Win32cr::UI::Shell::PropertiesSystem::GETPROPERTYSTOREFLAGS, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

    fun SHAddDefaultPropertiesByExt(pszExt : Win32cr::Foundation::PWSTR, pPropStore : Void*) : Win32cr::Foundation::HRESULT

    fun PifMgr_OpenProperties(pszApp : Win32cr::Foundation::PWSTR, pszPIF : Win32cr::Foundation::PWSTR, hInf : UInt32, flOpt : UInt32) : Win32cr::Foundation::HANDLE

    fun PifMgr_GetProperties(hProps : Win32cr::Foundation::HANDLE, pszGroup : Win32cr::Foundation::PSTR, lpProps : Void*, cbProps : Int32, flOpt : UInt32) : Int32

    fun PifMgr_SetProperties(hProps : Win32cr::Foundation::HANDLE, pszGroup : Win32cr::Foundation::PSTR, lpProps : Void*, cbProps : Int32, flOpt : UInt32) : Int32

    fun PifMgr_CloseProperties(hProps : Win32cr::Foundation::HANDLE, flOpt : UInt32) : Win32cr::Foundation::HANDLE

    fun SHPropStgCreate(psstg : Void*, fmtid : LibC::GUID*, pclsid : LibC::GUID*, grfFlags : UInt32, grfMode : UInt32, dwDisposition : UInt32, ppstg : Void**, puCodePage : UInt32*) : Win32cr::Foundation::HRESULT

    fun SHPropStgReadMultiple(pps : Void*, uCodePage : UInt32, cpspec : UInt32, rgpspec : Win32cr::System::Com::StructuredStorage::PROPSPEC*, rgvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    fun SHPropStgWriteMultiple(pps : Void*, puCodePage : UInt32*, cpspec : UInt32, rgpspec : Win32cr::System::Com::StructuredStorage::PROPSPEC*, rgvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, propidNameFirst : UInt32) : Win32cr::Foundation::HRESULT

    fun SHGetPropertyStoreForWindow(hwnd : Win32cr::Foundation::HWND, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

  end
end