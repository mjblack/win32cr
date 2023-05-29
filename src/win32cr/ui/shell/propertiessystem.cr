require "../../system/com.cr"
require "../../foundation.cr"
require "../../system/com/structuredstorage.cr"
require "../../system/search/common.cr"
require "../../ui/shell/common.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:propsys.dll")]
@[Link(ldflags: "/DELAYLOAD:shell32.dll")]
lib LibWin32
  PKEY_PIDSTR_MAX = 10_u32
  InMemoryPropertyStore = LibC::GUID.new(0x9a02e012_u32, 0x6303_u16, 0x4e1e_u16, StaticArray[0xb9_u8, 0xa1_u8, 0x63_u8, 0xf_u8, 0x80_u8, 0x25_u8, 0x92_u8, 0xc5_u8])
  InMemoryPropertyStoreMarshalByValue = LibC::GUID.new(0xd4ca0e2d_u32, 0x6da7_u16, 0x4b75_u16, StaticArray[0xa9_u8, 0x7c_u8, 0x5f_u8, 0x30_u8, 0x6f_u8, 0xe_u8, 0xae_u8, 0xdc_u8])
  PropertySystem = LibC::GUID.new(0xb8967f85_u32, 0x58ae_u16, 0x4f46_u16, StaticArray[0x9f_u8, 0xb2_u8, 0x5d_u8, 0x79_u8, 0x4_u8, 0x79_u8, 0x8f_u8, 0x4b_u8])

  type SERIALIZEDPROPSTORAGE = Void


  enum GETPROPERTYSTOREFLAGS : Int32
    GPS_DEFAULT = 0
    GPS_HANDLERPROPERTIESONLY = 1
    GPS_READWRITE = 2
    GPS_TEMPORARY = 4
    GPS_FASTPROPERTIESONLY = 8
    GPS_OPENSLOWITEM = 16
    GPS_DELAYCREATION = 32
    GPS_BESTEFFORT = 64
    GPS_NO_OPLOCK = 128
    GPS_PREFERQUERYPROPERTIES = 256
    GPS_EXTRINSICPROPERTIES = 512
    GPS_EXTRINSICPROPERTIESONLY = 1024
    GPS_VOLATILEPROPERTIES = 2048
    GPS_VOLATILEPROPERTIESONLY = 4096
    GPS_MASK_VALID = 8191
  end

  enum PKA_FLAGS : Int32
    PKA_SET = 0
    PKA_APPEND = 1
    PKA_DELETE = 2
  end

  enum PSC_STATE : Int32
    PSC_NORMAL = 0
    PSC_NOTINSOURCE = 1
    PSC_DIRTY = 2
    PSC_READONLY = 3
  end

  enum PROPENUMTYPE : Int32
    PET_DISCRETEVALUE = 0
    PET_RANGEDVALUE = 1
    PET_DEFAULTVALUE = 2
    PET_ENDRANGE = 3
  end

  enum PROPDESC_TYPE_FLAGS : Int32
    PDTF_DEFAULT = 0
    PDTF_MULTIPLEVALUES = 1
    PDTF_ISINNATE = 2
    PDTF_ISGROUP = 4
    PDTF_CANGROUPBY = 8
    PDTF_CANSTACKBY = 16
    PDTF_ISTREEPROPERTY = 32
    PDTF_INCLUDEINFULLTEXTQUERY = 64
    PDTF_ISVIEWABLE = 128
    PDTF_ISQUERYABLE = 256
    PDTF_CANBEPURGED = 512
    PDTF_SEARCHRAWVALUE = 1024
    PDTF_DONTCOERCEEMPTYSTRINGS = 2048
    PDTF_ALWAYSINSUPPLEMENTALSTORE = 4096
    PDTF_ISSYSTEMPROPERTY = -2147483648
    PDTF_MASK_ALL = -2147475457
  end

  enum PROPDESC_VIEW_FLAGS : Int32
    PDVF_DEFAULT = 0
    PDVF_CENTERALIGN = 1
    PDVF_RIGHTALIGN = 2
    PDVF_BEGINNEWGROUP = 4
    PDVF_FILLAREA = 8
    PDVF_SORTDESCENDING = 16
    PDVF_SHOWONLYIFPRESENT = 32
    PDVF_SHOWBYDEFAULT = 64
    PDVF_SHOWINPRIMARYLIST = 128
    PDVF_SHOWINSECONDARYLIST = 256
    PDVF_HIDELABEL = 512
    PDVF_HIDDEN = 2048
    PDVF_CANWRAP = 4096
    PDVF_MASK_ALL = 7167
  end

  enum PROPDESC_DISPLAYTYPE : Int32
    PDDT_STRING = 0
    PDDT_NUMBER = 1
    PDDT_BOOLEAN = 2
    PDDT_DATETIME = 3
    PDDT_ENUMERATED = 4
  end

  enum PROPDESC_GROUPING_RANGE : Int32
    PDGR_DISCRETE = 0
    PDGR_ALPHANUMERIC = 1
    PDGR_SIZE = 2
    PDGR_DYNAMIC = 3
    PDGR_DATE = 4
    PDGR_PERCENT = 5
    PDGR_ENUMERATED = 6
  end

  enum PROPDESC_FORMAT_FLAGS : Int32
    PDFF_DEFAULT = 0
    PDFF_PREFIXNAME = 1
    PDFF_FILENAME = 2
    PDFF_ALWAYSKB = 4
    PDFF_RESERVED_RIGHTTOLEFT = 8
    PDFF_SHORTTIME = 16
    PDFF_LONGTIME = 32
    PDFF_HIDETIME = 64
    PDFF_SHORTDATE = 128
    PDFF_LONGDATE = 256
    PDFF_HIDEDATE = 512
    PDFF_RELATIVEDATE = 1024
    PDFF_USEEDITINVITATION = 2048
    PDFF_READONLY = 4096
    PDFF_NOAUTOREADINGORDER = 8192
  end

  enum PROPDESC_SORTDESCRIPTION : Int32
    PDSD_GENERAL = 0
    PDSD_A_Z = 1
    PDSD_LOWEST_HIGHEST = 2
    PDSD_SMALLEST_BIGGEST = 3
    PDSD_OLDEST_NEWEST = 4
  end

  enum PROPDESC_RELATIVEDESCRIPTION_TYPE : Int32
    PDRDT_GENERAL = 0
    PDRDT_DATE = 1
    PDRDT_SIZE = 2
    PDRDT_COUNT = 3
    PDRDT_REVISION = 4
    PDRDT_LENGTH = 5
    PDRDT_DURATION = 6
    PDRDT_SPEED = 7
    PDRDT_RATE = 8
    PDRDT_RATING = 9
    PDRDT_PRIORITY = 10
  end

  enum PROPDESC_AGGREGATION_TYPE : Int32
    PDAT_DEFAULT = 0
    PDAT_FIRST = 1
    PDAT_SUM = 2
    PDAT_AVERAGE = 3
    PDAT_DATERANGE = 4
    PDAT_UNION = 5
    PDAT_MAX = 6
    PDAT_MIN = 7
  end

  enum PROPDESC_CONDITION_TYPE : Int32
    PDCOT_NONE = 0
    PDCOT_STRING = 1
    PDCOT_SIZE = 2
    PDCOT_DATETIME = 3
    PDCOT_BOOLEAN = 4
    PDCOT_NUMBER = 5
  end

  enum PROPDESC_SEARCHINFO_FLAGS : Int32
    PDSIF_DEFAULT = 0
    PDSIF_ININVERTEDINDEX = 1
    PDSIF_ISCOLUMN = 2
    PDSIF_ISCOLUMNSPARSE = 4
    PDSIF_ALWAYSINCLUDE = 8
    PDSIF_USEFORTYPEAHEAD = 16
  end

  enum PROPDESC_COLUMNINDEX_TYPE : Int32
    PDCIT_NONE = 0
    PDCIT_ONDISK = 1
    PDCIT_INMEMORY = 2
    PDCIT_ONDEMAND = 3
    PDCIT_ONDISKALL = 4
    PDCIT_ONDISKVECTOR = 5
  end

  enum PROPDESC_ENUMFILTER : Int32
    PDEF_ALL = 0
    PDEF_SYSTEM = 1
    PDEF_NONSYSTEM = 2
    PDEF_VIEWABLE = 3
    PDEF_QUERYABLE = 4
    PDEF_INFULLTEXTQUERY = 5
    PDEF_COLUMN = 6
  end

  enum PERSIST_SPROPSTORE_FLAGS : Int32
    FPSPS_DEFAULT = 0
    FPSPS_READONLY = 1
    FPSPS_TREAT_NEW_VALUES_AS_DIRTY = 2
  end

  enum PSTIME_FLAGS : Int32
    PSTF_UTC = 0
    PSTF_LOCAL = 1
  end

  enum PROPVAR_COMPARE_UNIT : Int32
    PVCU_DEFAULT = 0
    PVCU_SECOND = 1
    PVCU_MINUTE = 2
    PVCU_HOUR = 3
    PVCU_DAY = 4
    PVCU_MONTH = 5
    PVCU_YEAR = 6
  end

  enum PROPVAR_COMPARE_FLAGS : Int32
    PVCF_DEFAULT = 0
    PVCF_TREATEMPTYASGREATERTHAN = 1
    PVCF_USESTRCMP = 2
    PVCF_USESTRCMPC = 4
    PVCF_USESTRCMPI = 8
    PVCF_USESTRCMPIC = 16
    PVCF_DIGITSASNUMBERS_CASESENSITIVE = 32
  end

  enum PROPVAR_CHANGE_FLAGS : Int32
    PVCHF_DEFAULT = 0
    PVCHF_NOVALUEPROP = 1
    PVCHF_ALPHABOOL = 2
    PVCHF_NOUSEROVERRIDE = 4
    PVCHF_LOCALBOOL = 8
    PVCHF_NOHEXSTRING = 16
  end

  enum DRAWPROGRESSFLAGS : Int32
    DPF_NONE = 0
    DPF_MARQUEE = 1
    DPF_MARQUEE_COMPLETE = 2
    DPF_ERROR = 4
    DPF_WARNING = 8
    DPF_STOPPED = 16
  end

  enum SYNC_TRANSFER_STATUS : Int32
    STS_NONE = 0
    STS_NEEDSUPLOAD = 1
    STS_NEEDSDOWNLOAD = 2
    STS_TRANSFERRING = 4
    STS_PAUSED = 8
    STS_HASERROR = 16
    STS_FETCHING_METADATA = 32
    STS_USER_REQUESTED_REFRESH = 64
    STS_HASWARNING = 128
    STS_EXCLUDED = 256
    STS_INCOMPLETE = 512
    STS_PLACEHOLDER_IFEMPTY = 1024
  end

  enum PLACEHOLDER_STATES : Int32
    PS_NONE = 0
    PS_MARKED_FOR_OFFLINE_AVAILABILITY = 1
    PS_FULL_PRIMARY_STREAM_AVAILABLE = 2
    PS_CREATE_FILE_ACCESSIBLE = 4
    PS_CLOUDFILE_PLACEHOLDER = 8
    PS_DEFAULT = 7
    PS_ALL = 15
  end

  enum PROPERTYUI_NAME_FLAGS : Int32
    PUIFNF_DEFAULT = 0
    PUIFNF_MNEMONIC = 1
  end

  enum PROPERTYUI_FLAGS : Int32
    PUIF_DEFAULT = 0
    PUIF_RIGHTALIGN = 1
    PUIF_NOLABELININFOTIP = 2
  end

  enum PROPERTYUI_FORMAT_FLAGS : Int32
    PUIFFDF_DEFAULT = 0
    PUIFFDF_RIGHTTOLEFT = 1
    PUIFFDF_SHORTFORMAT = 2
    PUIFFDF_NOTIME = 4
    PUIFFDF_FRIENDLYDATE = 8
  end

  enum PDOPSTATUS : Int32
    PDOPS_RUNNING = 1
    PDOPS_PAUSED = 2
    PDOPS_CANCELLED = 3
    PDOPS_STOPPED = 4
    PDOPS_ERRORS = 5
  end

  enum SYNC_ENGINE_STATE_FLAGS : Int32
    SESF_NONE = 0
    SESF_SERVICE_QUOTA_NEARING_LIMIT = 1
    SESF_SERVICE_QUOTA_EXCEEDED_LIMIT = 2
    SESF_AUTHENTICATION_ERROR = 4
    SESF_PAUSED_DUE_TO_METERED_NETWORK = 8
    SESF_PAUSED_DUE_TO_DISK_SPACE_FULL = 16
    SESF_PAUSED_DUE_TO_CLIENT_POLICY = 32
    SESF_PAUSED_DUE_TO_SERVICE_POLICY = 64
    SESF_SERVICE_UNAVAILABLE = 128
    SESF_PAUSED_DUE_TO_USER_REQUEST = 256
    SESF_ALL_FLAGS = 511
  end

  struct PROPERTYKEY
    fmtid : Guid
    pid : UInt32
  end
  struct PROPPRG
    fl_prg : UInt16
    fl_prg_init : UInt16
    ach_title : CHAR[30]*
    ach_cmd_line : CHAR[128]*
    ach_work_dir : CHAR[64]*
    w_hot_key : UInt16
    ach_icon_file : CHAR[80]*
    w_icon_index : UInt16
    dw_enh_mode_flags : UInt32
    dw_real_mode_flags : UInt32
    ach_other_file : CHAR[80]*
    ach_pif_file : CHAR[260]*
  end


  struct IInitializeWithFileVTbl
    query_interface : Proc(IInitializeWithFile*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInitializeWithFile*, UInt32)
    release : Proc(IInitializeWithFile*, UInt32)
    initialize : Proc(IInitializeWithFile*, LibC::LPWSTR, UInt32, HRESULT)
  end

  struct IInitializeWithFile
    lpVtbl : IInitializeWithFileVTbl*
  end

  struct IInitializeWithStreamVTbl
    query_interface : Proc(IInitializeWithStream*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInitializeWithStream*, UInt32)
    release : Proc(IInitializeWithStream*, UInt32)
    initialize : Proc(IInitializeWithStream*, IStream, UInt32, HRESULT)
  end

  struct IInitializeWithStream
    lpVtbl : IInitializeWithStreamVTbl*
  end

  struct IPropertyStoreVTbl
    query_interface : Proc(IPropertyStore*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPropertyStore*, UInt32)
    release : Proc(IPropertyStore*, UInt32)
    get_count : Proc(IPropertyStore*, UInt32*, HRESULT)
    get_at : Proc(IPropertyStore*, UInt32, PROPERTYKEY*, HRESULT)
    get_value : Proc(IPropertyStore*, PROPERTYKEY*, PROPVARIANT*, HRESULT)
    set_value : Proc(IPropertyStore*, PROPERTYKEY*, PROPVARIANT*, HRESULT)
    commit : Proc(IPropertyStore*, HRESULT)
  end

  struct IPropertyStore
    lpVtbl : IPropertyStoreVTbl*
  end

  struct INamedPropertyStoreVTbl
    query_interface : Proc(INamedPropertyStore*, Guid*, Void**, HRESULT)
    add_ref : Proc(INamedPropertyStore*, UInt32)
    release : Proc(INamedPropertyStore*, UInt32)
    get_named_value : Proc(INamedPropertyStore*, LibC::LPWSTR, PROPVARIANT*, HRESULT)
    set_named_value : Proc(INamedPropertyStore*, LibC::LPWSTR, PROPVARIANT*, HRESULT)
    get_name_count : Proc(INamedPropertyStore*, UInt32*, HRESULT)
    get_name_at : Proc(INamedPropertyStore*, UInt32, UInt8*, HRESULT)
  end

  struct INamedPropertyStore
    lpVtbl : INamedPropertyStoreVTbl*
  end

  struct IObjectWithPropertyKeyVTbl
    query_interface : Proc(IObjectWithPropertyKey*, Guid*, Void**, HRESULT)
    add_ref : Proc(IObjectWithPropertyKey*, UInt32)
    release : Proc(IObjectWithPropertyKey*, UInt32)
    set_property_key : Proc(IObjectWithPropertyKey*, PROPERTYKEY*, HRESULT)
    get_property_key : Proc(IObjectWithPropertyKey*, PROPERTYKEY*, HRESULT)
  end

  struct IObjectWithPropertyKey
    lpVtbl : IObjectWithPropertyKeyVTbl*
  end

  struct IPropertyChangeVTbl
    query_interface : Proc(IPropertyChange*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPropertyChange*, UInt32)
    release : Proc(IPropertyChange*, UInt32)
    set_property_key : Proc(IPropertyChange*, PROPERTYKEY*, HRESULT)
    get_property_key : Proc(IPropertyChange*, PROPERTYKEY*, HRESULT)
    apply_to_prop_variant : Proc(IPropertyChange*, PROPVARIANT*, PROPVARIANT*, HRESULT)
  end

  struct IPropertyChange
    lpVtbl : IPropertyChangeVTbl*
  end

  struct IPropertyChangeArrayVTbl
    query_interface : Proc(IPropertyChangeArray*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPropertyChangeArray*, UInt32)
    release : Proc(IPropertyChangeArray*, UInt32)
    get_count : Proc(IPropertyChangeArray*, UInt32*, HRESULT)
    get_at : Proc(IPropertyChangeArray*, UInt32, Guid*, Void**, HRESULT)
    insert_at : Proc(IPropertyChangeArray*, UInt32, IPropertyChange, HRESULT)
    append : Proc(IPropertyChangeArray*, IPropertyChange, HRESULT)
    append_or_replace : Proc(IPropertyChangeArray*, IPropertyChange, HRESULT)
    remove_at : Proc(IPropertyChangeArray*, UInt32, HRESULT)
    is_key_in_array : Proc(IPropertyChangeArray*, PROPERTYKEY*, HRESULT)
  end

  struct IPropertyChangeArray
    lpVtbl : IPropertyChangeArrayVTbl*
  end

  struct IPropertyStoreCapabilitiesVTbl
    query_interface : Proc(IPropertyStoreCapabilities*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPropertyStoreCapabilities*, UInt32)
    release : Proc(IPropertyStoreCapabilities*, UInt32)
    is_property_writable : Proc(IPropertyStoreCapabilities*, PROPERTYKEY*, HRESULT)
  end

  struct IPropertyStoreCapabilities
    lpVtbl : IPropertyStoreCapabilitiesVTbl*
  end

  struct IPropertyStoreCacheVTbl
    query_interface : Proc(IPropertyStoreCache*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPropertyStoreCache*, UInt32)
    release : Proc(IPropertyStoreCache*, UInt32)
    get_count : Proc(IPropertyStoreCache*, UInt32*, HRESULT)
    get_at : Proc(IPropertyStoreCache*, UInt32, PROPERTYKEY*, HRESULT)
    get_value : Proc(IPropertyStoreCache*, PROPERTYKEY*, PROPVARIANT*, HRESULT)
    set_value : Proc(IPropertyStoreCache*, PROPERTYKEY*, PROPVARIANT*, HRESULT)
    commit : Proc(IPropertyStoreCache*, HRESULT)
    get_state : Proc(IPropertyStoreCache*, PROPERTYKEY*, PSC_STATE*, HRESULT)
    get_value_and_state : Proc(IPropertyStoreCache*, PROPERTYKEY*, PROPVARIANT*, PSC_STATE*, HRESULT)
    set_state : Proc(IPropertyStoreCache*, PROPERTYKEY*, PSC_STATE, HRESULT)
    set_value_and_state : Proc(IPropertyStoreCache*, PROPERTYKEY*, PROPVARIANT*, PSC_STATE, HRESULT)
  end

  struct IPropertyStoreCache
    lpVtbl : IPropertyStoreCacheVTbl*
  end

  struct IPropertyEnumTypeVTbl
    query_interface : Proc(IPropertyEnumType*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPropertyEnumType*, UInt32)
    release : Proc(IPropertyEnumType*, UInt32)
    get_enum_type : Proc(IPropertyEnumType*, PROPENUMTYPE*, HRESULT)
    get_value : Proc(IPropertyEnumType*, PROPVARIANT*, HRESULT)
    get_range_min_value : Proc(IPropertyEnumType*, PROPVARIANT*, HRESULT)
    get_range_set_value : Proc(IPropertyEnumType*, PROPVARIANT*, HRESULT)
    get_display_text : Proc(IPropertyEnumType*, LibC::LPWSTR*, HRESULT)
  end

  struct IPropertyEnumType
    lpVtbl : IPropertyEnumTypeVTbl*
  end

  struct IPropertyEnumType2VTbl
    query_interface : Proc(IPropertyEnumType2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPropertyEnumType2*, UInt32)
    release : Proc(IPropertyEnumType2*, UInt32)
    get_enum_type : Proc(IPropertyEnumType2*, PROPENUMTYPE*, HRESULT)
    get_value : Proc(IPropertyEnumType2*, PROPVARIANT*, HRESULT)
    get_range_min_value : Proc(IPropertyEnumType2*, PROPVARIANT*, HRESULT)
    get_range_set_value : Proc(IPropertyEnumType2*, PROPVARIANT*, HRESULT)
    get_display_text : Proc(IPropertyEnumType2*, LibC::LPWSTR*, HRESULT)
    get_image_reference : Proc(IPropertyEnumType2*, LibC::LPWSTR*, HRESULT)
  end

  struct IPropertyEnumType2
    lpVtbl : IPropertyEnumType2VTbl*
  end

  struct IPropertyEnumTypeListVTbl
    query_interface : Proc(IPropertyEnumTypeList*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPropertyEnumTypeList*, UInt32)
    release : Proc(IPropertyEnumTypeList*, UInt32)
    get_count : Proc(IPropertyEnumTypeList*, UInt32*, HRESULT)
    get_at : Proc(IPropertyEnumTypeList*, UInt32, Guid*, Void**, HRESULT)
    get_condition_at : Proc(IPropertyEnumTypeList*, UInt32, Guid*, Void**, HRESULT)
    find_matching_index : Proc(IPropertyEnumTypeList*, PROPVARIANT*, UInt32*, HRESULT)
  end

  struct IPropertyEnumTypeList
    lpVtbl : IPropertyEnumTypeListVTbl*
  end

  struct IPropertyDescriptionVTbl
    query_interface : Proc(IPropertyDescription*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPropertyDescription*, UInt32)
    release : Proc(IPropertyDescription*, UInt32)
    get_property_key : Proc(IPropertyDescription*, PROPERTYKEY*, HRESULT)
    get_canonical_name : Proc(IPropertyDescription*, LibC::LPWSTR*, HRESULT)
    get_property_type : Proc(IPropertyDescription*, UInt16*, HRESULT)
    get_display_name : Proc(IPropertyDescription*, LibC::LPWSTR*, HRESULT)
    get_edit_invitation : Proc(IPropertyDescription*, LibC::LPWSTR*, HRESULT)
    get_type_flags : Proc(IPropertyDescription*, PROPDESC_TYPE_FLAGS, PROPDESC_TYPE_FLAGS*, HRESULT)
    get_view_flags : Proc(IPropertyDescription*, PROPDESC_VIEW_FLAGS*, HRESULT)
    get_default_column_width : Proc(IPropertyDescription*, UInt32*, HRESULT)
    get_display_type : Proc(IPropertyDescription*, PROPDESC_DISPLAYTYPE*, HRESULT)
    get_column_state : Proc(IPropertyDescription*, UInt32*, HRESULT)
    get_grouping_range : Proc(IPropertyDescription*, PROPDESC_GROUPING_RANGE*, HRESULT)
    get_relative_description_type : Proc(IPropertyDescription*, PROPDESC_RELATIVEDESCRIPTION_TYPE*, HRESULT)
    get_relative_description : Proc(IPropertyDescription*, PROPVARIANT*, PROPVARIANT*, LibC::LPWSTR*, LibC::LPWSTR*, HRESULT)
    get_sort_description : Proc(IPropertyDescription*, PROPDESC_SORTDESCRIPTION*, HRESULT)
    get_sort_description_label : Proc(IPropertyDescription*, LibC::BOOL, LibC::LPWSTR*, HRESULT)
    get_aggregation_type : Proc(IPropertyDescription*, PROPDESC_AGGREGATION_TYPE*, HRESULT)
    get_condition_type : Proc(IPropertyDescription*, PROPDESC_CONDITION_TYPE*, CONDITION_OPERATION*, HRESULT)
    get_enum_type_list : Proc(IPropertyDescription*, Guid*, Void**, HRESULT)
    coerce_to_canonical_value : Proc(IPropertyDescription*, PROPVARIANT*, HRESULT)
    format_for_display : Proc(IPropertyDescription*, PROPVARIANT*, PROPDESC_FORMAT_FLAGS, LibC::LPWSTR*, HRESULT)
    is_value_canonical : Proc(IPropertyDescription*, PROPVARIANT*, HRESULT)
  end

  struct IPropertyDescription
    lpVtbl : IPropertyDescriptionVTbl*
  end

  struct IPropertyDescription2VTbl
    query_interface : Proc(IPropertyDescription2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPropertyDescription2*, UInt32)
    release : Proc(IPropertyDescription2*, UInt32)
    get_property_key : Proc(IPropertyDescription2*, PROPERTYKEY*, HRESULT)
    get_canonical_name : Proc(IPropertyDescription2*, LibC::LPWSTR*, HRESULT)
    get_property_type : Proc(IPropertyDescription2*, UInt16*, HRESULT)
    get_display_name : Proc(IPropertyDescription2*, LibC::LPWSTR*, HRESULT)
    get_edit_invitation : Proc(IPropertyDescription2*, LibC::LPWSTR*, HRESULT)
    get_type_flags : Proc(IPropertyDescription2*, PROPDESC_TYPE_FLAGS, PROPDESC_TYPE_FLAGS*, HRESULT)
    get_view_flags : Proc(IPropertyDescription2*, PROPDESC_VIEW_FLAGS*, HRESULT)
    get_default_column_width : Proc(IPropertyDescription2*, UInt32*, HRESULT)
    get_display_type : Proc(IPropertyDescription2*, PROPDESC_DISPLAYTYPE*, HRESULT)
    get_column_state : Proc(IPropertyDescription2*, UInt32*, HRESULT)
    get_grouping_range : Proc(IPropertyDescription2*, PROPDESC_GROUPING_RANGE*, HRESULT)
    get_relative_description_type : Proc(IPropertyDescription2*, PROPDESC_RELATIVEDESCRIPTION_TYPE*, HRESULT)
    get_relative_description : Proc(IPropertyDescription2*, PROPVARIANT*, PROPVARIANT*, LibC::LPWSTR*, LibC::LPWSTR*, HRESULT)
    get_sort_description : Proc(IPropertyDescription2*, PROPDESC_SORTDESCRIPTION*, HRESULT)
    get_sort_description_label : Proc(IPropertyDescription2*, LibC::BOOL, LibC::LPWSTR*, HRESULT)
    get_aggregation_type : Proc(IPropertyDescription2*, PROPDESC_AGGREGATION_TYPE*, HRESULT)
    get_condition_type : Proc(IPropertyDescription2*, PROPDESC_CONDITION_TYPE*, CONDITION_OPERATION*, HRESULT)
    get_enum_type_list : Proc(IPropertyDescription2*, Guid*, Void**, HRESULT)
    coerce_to_canonical_value : Proc(IPropertyDescription2*, PROPVARIANT*, HRESULT)
    format_for_display : Proc(IPropertyDescription2*, PROPVARIANT*, PROPDESC_FORMAT_FLAGS, LibC::LPWSTR*, HRESULT)
    is_value_canonical : Proc(IPropertyDescription2*, PROPVARIANT*, HRESULT)
    get_image_reference_for_value : Proc(IPropertyDescription2*, PROPVARIANT*, LibC::LPWSTR*, HRESULT)
  end

  struct IPropertyDescription2
    lpVtbl : IPropertyDescription2VTbl*
  end

  struct IPropertyDescriptionAliasInfoVTbl
    query_interface : Proc(IPropertyDescriptionAliasInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPropertyDescriptionAliasInfo*, UInt32)
    release : Proc(IPropertyDescriptionAliasInfo*, UInt32)
    get_property_key : Proc(IPropertyDescriptionAliasInfo*, PROPERTYKEY*, HRESULT)
    get_canonical_name : Proc(IPropertyDescriptionAliasInfo*, LibC::LPWSTR*, HRESULT)
    get_property_type : Proc(IPropertyDescriptionAliasInfo*, UInt16*, HRESULT)
    get_display_name : Proc(IPropertyDescriptionAliasInfo*, LibC::LPWSTR*, HRESULT)
    get_edit_invitation : Proc(IPropertyDescriptionAliasInfo*, LibC::LPWSTR*, HRESULT)
    get_type_flags : Proc(IPropertyDescriptionAliasInfo*, PROPDESC_TYPE_FLAGS, PROPDESC_TYPE_FLAGS*, HRESULT)
    get_view_flags : Proc(IPropertyDescriptionAliasInfo*, PROPDESC_VIEW_FLAGS*, HRESULT)
    get_default_column_width : Proc(IPropertyDescriptionAliasInfo*, UInt32*, HRESULT)
    get_display_type : Proc(IPropertyDescriptionAliasInfo*, PROPDESC_DISPLAYTYPE*, HRESULT)
    get_column_state : Proc(IPropertyDescriptionAliasInfo*, UInt32*, HRESULT)
    get_grouping_range : Proc(IPropertyDescriptionAliasInfo*, PROPDESC_GROUPING_RANGE*, HRESULT)
    get_relative_description_type : Proc(IPropertyDescriptionAliasInfo*, PROPDESC_RELATIVEDESCRIPTION_TYPE*, HRESULT)
    get_relative_description : Proc(IPropertyDescriptionAliasInfo*, PROPVARIANT*, PROPVARIANT*, LibC::LPWSTR*, LibC::LPWSTR*, HRESULT)
    get_sort_description : Proc(IPropertyDescriptionAliasInfo*, PROPDESC_SORTDESCRIPTION*, HRESULT)
    get_sort_description_label : Proc(IPropertyDescriptionAliasInfo*, LibC::BOOL, LibC::LPWSTR*, HRESULT)
    get_aggregation_type : Proc(IPropertyDescriptionAliasInfo*, PROPDESC_AGGREGATION_TYPE*, HRESULT)
    get_condition_type : Proc(IPropertyDescriptionAliasInfo*, PROPDESC_CONDITION_TYPE*, CONDITION_OPERATION*, HRESULT)
    get_enum_type_list : Proc(IPropertyDescriptionAliasInfo*, Guid*, Void**, HRESULT)
    coerce_to_canonical_value : Proc(IPropertyDescriptionAliasInfo*, PROPVARIANT*, HRESULT)
    format_for_display : Proc(IPropertyDescriptionAliasInfo*, PROPVARIANT*, PROPDESC_FORMAT_FLAGS, LibC::LPWSTR*, HRESULT)
    is_value_canonical : Proc(IPropertyDescriptionAliasInfo*, PROPVARIANT*, HRESULT)
    get_sort_by_alias : Proc(IPropertyDescriptionAliasInfo*, Guid*, Void**, HRESULT)
    get_additional_sort_by_aliases : Proc(IPropertyDescriptionAliasInfo*, Guid*, Void**, HRESULT)
  end

  struct IPropertyDescriptionAliasInfo
    lpVtbl : IPropertyDescriptionAliasInfoVTbl*
  end

  struct IPropertyDescriptionSearchInfoVTbl
    query_interface : Proc(IPropertyDescriptionSearchInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPropertyDescriptionSearchInfo*, UInt32)
    release : Proc(IPropertyDescriptionSearchInfo*, UInt32)
    get_property_key : Proc(IPropertyDescriptionSearchInfo*, PROPERTYKEY*, HRESULT)
    get_canonical_name : Proc(IPropertyDescriptionSearchInfo*, LibC::LPWSTR*, HRESULT)
    get_property_type : Proc(IPropertyDescriptionSearchInfo*, UInt16*, HRESULT)
    get_display_name : Proc(IPropertyDescriptionSearchInfo*, LibC::LPWSTR*, HRESULT)
    get_edit_invitation : Proc(IPropertyDescriptionSearchInfo*, LibC::LPWSTR*, HRESULT)
    get_type_flags : Proc(IPropertyDescriptionSearchInfo*, PROPDESC_TYPE_FLAGS, PROPDESC_TYPE_FLAGS*, HRESULT)
    get_view_flags : Proc(IPropertyDescriptionSearchInfo*, PROPDESC_VIEW_FLAGS*, HRESULT)
    get_default_column_width : Proc(IPropertyDescriptionSearchInfo*, UInt32*, HRESULT)
    get_display_type : Proc(IPropertyDescriptionSearchInfo*, PROPDESC_DISPLAYTYPE*, HRESULT)
    get_column_state : Proc(IPropertyDescriptionSearchInfo*, UInt32*, HRESULT)
    get_grouping_range : Proc(IPropertyDescriptionSearchInfo*, PROPDESC_GROUPING_RANGE*, HRESULT)
    get_relative_description_type : Proc(IPropertyDescriptionSearchInfo*, PROPDESC_RELATIVEDESCRIPTION_TYPE*, HRESULT)
    get_relative_description : Proc(IPropertyDescriptionSearchInfo*, PROPVARIANT*, PROPVARIANT*, LibC::LPWSTR*, LibC::LPWSTR*, HRESULT)
    get_sort_description : Proc(IPropertyDescriptionSearchInfo*, PROPDESC_SORTDESCRIPTION*, HRESULT)
    get_sort_description_label : Proc(IPropertyDescriptionSearchInfo*, LibC::BOOL, LibC::LPWSTR*, HRESULT)
    get_aggregation_type : Proc(IPropertyDescriptionSearchInfo*, PROPDESC_AGGREGATION_TYPE*, HRESULT)
    get_condition_type : Proc(IPropertyDescriptionSearchInfo*, PROPDESC_CONDITION_TYPE*, CONDITION_OPERATION*, HRESULT)
    get_enum_type_list : Proc(IPropertyDescriptionSearchInfo*, Guid*, Void**, HRESULT)
    coerce_to_canonical_value : Proc(IPropertyDescriptionSearchInfo*, PROPVARIANT*, HRESULT)
    format_for_display : Proc(IPropertyDescriptionSearchInfo*, PROPVARIANT*, PROPDESC_FORMAT_FLAGS, LibC::LPWSTR*, HRESULT)
    is_value_canonical : Proc(IPropertyDescriptionSearchInfo*, PROPVARIANT*, HRESULT)
    get_search_info_flags : Proc(IPropertyDescriptionSearchInfo*, PROPDESC_SEARCHINFO_FLAGS*, HRESULT)
    get_column_index_type : Proc(IPropertyDescriptionSearchInfo*, PROPDESC_COLUMNINDEX_TYPE*, HRESULT)
    get_projection_string : Proc(IPropertyDescriptionSearchInfo*, LibC::LPWSTR*, HRESULT)
    get_max_size : Proc(IPropertyDescriptionSearchInfo*, UInt32*, HRESULT)
  end

  struct IPropertyDescriptionSearchInfo
    lpVtbl : IPropertyDescriptionSearchInfoVTbl*
  end

  struct IPropertyDescriptionRelatedPropertyInfoVTbl
    query_interface : Proc(IPropertyDescriptionRelatedPropertyInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPropertyDescriptionRelatedPropertyInfo*, UInt32)
    release : Proc(IPropertyDescriptionRelatedPropertyInfo*, UInt32)
    get_property_key : Proc(IPropertyDescriptionRelatedPropertyInfo*, PROPERTYKEY*, HRESULT)
    get_canonical_name : Proc(IPropertyDescriptionRelatedPropertyInfo*, LibC::LPWSTR*, HRESULT)
    get_property_type : Proc(IPropertyDescriptionRelatedPropertyInfo*, UInt16*, HRESULT)
    get_display_name : Proc(IPropertyDescriptionRelatedPropertyInfo*, LibC::LPWSTR*, HRESULT)
    get_edit_invitation : Proc(IPropertyDescriptionRelatedPropertyInfo*, LibC::LPWSTR*, HRESULT)
    get_type_flags : Proc(IPropertyDescriptionRelatedPropertyInfo*, PROPDESC_TYPE_FLAGS, PROPDESC_TYPE_FLAGS*, HRESULT)
    get_view_flags : Proc(IPropertyDescriptionRelatedPropertyInfo*, PROPDESC_VIEW_FLAGS*, HRESULT)
    get_default_column_width : Proc(IPropertyDescriptionRelatedPropertyInfo*, UInt32*, HRESULT)
    get_display_type : Proc(IPropertyDescriptionRelatedPropertyInfo*, PROPDESC_DISPLAYTYPE*, HRESULT)
    get_column_state : Proc(IPropertyDescriptionRelatedPropertyInfo*, UInt32*, HRESULT)
    get_grouping_range : Proc(IPropertyDescriptionRelatedPropertyInfo*, PROPDESC_GROUPING_RANGE*, HRESULT)
    get_relative_description_type : Proc(IPropertyDescriptionRelatedPropertyInfo*, PROPDESC_RELATIVEDESCRIPTION_TYPE*, HRESULT)
    get_relative_description : Proc(IPropertyDescriptionRelatedPropertyInfo*, PROPVARIANT*, PROPVARIANT*, LibC::LPWSTR*, LibC::LPWSTR*, HRESULT)
    get_sort_description : Proc(IPropertyDescriptionRelatedPropertyInfo*, PROPDESC_SORTDESCRIPTION*, HRESULT)
    get_sort_description_label : Proc(IPropertyDescriptionRelatedPropertyInfo*, LibC::BOOL, LibC::LPWSTR*, HRESULT)
    get_aggregation_type : Proc(IPropertyDescriptionRelatedPropertyInfo*, PROPDESC_AGGREGATION_TYPE*, HRESULT)
    get_condition_type : Proc(IPropertyDescriptionRelatedPropertyInfo*, PROPDESC_CONDITION_TYPE*, CONDITION_OPERATION*, HRESULT)
    get_enum_type_list : Proc(IPropertyDescriptionRelatedPropertyInfo*, Guid*, Void**, HRESULT)
    coerce_to_canonical_value : Proc(IPropertyDescriptionRelatedPropertyInfo*, PROPVARIANT*, HRESULT)
    format_for_display : Proc(IPropertyDescriptionRelatedPropertyInfo*, PROPVARIANT*, PROPDESC_FORMAT_FLAGS, LibC::LPWSTR*, HRESULT)
    is_value_canonical : Proc(IPropertyDescriptionRelatedPropertyInfo*, PROPVARIANT*, HRESULT)
    get_related_property : Proc(IPropertyDescriptionRelatedPropertyInfo*, LibC::LPWSTR, Guid*, Void**, HRESULT)
  end

  struct IPropertyDescriptionRelatedPropertyInfo
    lpVtbl : IPropertyDescriptionRelatedPropertyInfoVTbl*
  end

  struct IPropertySystemVTbl
    query_interface : Proc(IPropertySystem*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPropertySystem*, UInt32)
    release : Proc(IPropertySystem*, UInt32)
    get_property_description : Proc(IPropertySystem*, PROPERTYKEY*, Guid*, Void**, HRESULT)
    get_property_description_by_name : Proc(IPropertySystem*, LibC::LPWSTR, Guid*, Void**, HRESULT)
    get_property_description_list_from_string : Proc(IPropertySystem*, LibC::LPWSTR, Guid*, Void**, HRESULT)
    enumerate_property_descriptions : Proc(IPropertySystem*, PROPDESC_ENUMFILTER, Guid*, Void**, HRESULT)
    format_for_display : Proc(IPropertySystem*, PROPERTYKEY*, PROPVARIANT*, PROPDESC_FORMAT_FLAGS, Char*, UInt32, HRESULT)
    format_for_display_alloc : Proc(IPropertySystem*, PROPERTYKEY*, PROPVARIANT*, PROPDESC_FORMAT_FLAGS, LibC::LPWSTR*, HRESULT)
    register_property_schema : Proc(IPropertySystem*, LibC::LPWSTR, HRESULT)
    unregister_property_schema : Proc(IPropertySystem*, LibC::LPWSTR, HRESULT)
    refresh_property_schema : Proc(IPropertySystem*, HRESULT)
  end

  struct IPropertySystem
    lpVtbl : IPropertySystemVTbl*
  end

  struct IPropertyDescriptionListVTbl
    query_interface : Proc(IPropertyDescriptionList*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPropertyDescriptionList*, UInt32)
    release : Proc(IPropertyDescriptionList*, UInt32)
    get_count : Proc(IPropertyDescriptionList*, UInt32*, HRESULT)
    get_at : Proc(IPropertyDescriptionList*, UInt32, Guid*, Void**, HRESULT)
  end

  struct IPropertyDescriptionList
    lpVtbl : IPropertyDescriptionListVTbl*
  end

  struct IPropertyStoreFactoryVTbl
    query_interface : Proc(IPropertyStoreFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPropertyStoreFactory*, UInt32)
    release : Proc(IPropertyStoreFactory*, UInt32)
    get_property_store : Proc(IPropertyStoreFactory*, GETPROPERTYSTOREFLAGS, IUnknown, Guid*, Void**, HRESULT)
    get_property_store_for_keys : Proc(IPropertyStoreFactory*, PROPERTYKEY*, UInt32, GETPROPERTYSTOREFLAGS, Guid*, Void**, HRESULT)
  end

  struct IPropertyStoreFactory
    lpVtbl : IPropertyStoreFactoryVTbl*
  end

  struct IDelayedPropertyStoreFactoryVTbl
    query_interface : Proc(IDelayedPropertyStoreFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDelayedPropertyStoreFactory*, UInt32)
    release : Proc(IDelayedPropertyStoreFactory*, UInt32)
    get_property_store : Proc(IDelayedPropertyStoreFactory*, GETPROPERTYSTOREFLAGS, IUnknown, Guid*, Void**, HRESULT)
    get_property_store_for_keys : Proc(IDelayedPropertyStoreFactory*, PROPERTYKEY*, UInt32, GETPROPERTYSTOREFLAGS, Guid*, Void**, HRESULT)
    get_delayed_property_store : Proc(IDelayedPropertyStoreFactory*, GETPROPERTYSTOREFLAGS, UInt32, Guid*, Void**, HRESULT)
  end

  struct IDelayedPropertyStoreFactory
    lpVtbl : IDelayedPropertyStoreFactoryVTbl*
  end

  struct IPersistSerializedPropStorageVTbl
    query_interface : Proc(IPersistSerializedPropStorage*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPersistSerializedPropStorage*, UInt32)
    release : Proc(IPersistSerializedPropStorage*, UInt32)
    set_flags : Proc(IPersistSerializedPropStorage*, Int32, HRESULT)
    set_property_storage : Proc(IPersistSerializedPropStorage*, SERIALIZEDPROPSTORAGE*, UInt32, HRESULT)
    get_property_storage : Proc(IPersistSerializedPropStorage*, SERIALIZEDPROPSTORAGE**, UInt32*, HRESULT)
  end

  struct IPersistSerializedPropStorage
    lpVtbl : IPersistSerializedPropStorageVTbl*
  end

  struct IPersistSerializedPropStorage2VTbl
    query_interface : Proc(IPersistSerializedPropStorage2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPersistSerializedPropStorage2*, UInt32)
    release : Proc(IPersistSerializedPropStorage2*, UInt32)
    set_flags : Proc(IPersistSerializedPropStorage2*, Int32, HRESULT)
    set_property_storage : Proc(IPersistSerializedPropStorage2*, SERIALIZEDPROPSTORAGE*, UInt32, HRESULT)
    get_property_storage : Proc(IPersistSerializedPropStorage2*, SERIALIZEDPROPSTORAGE**, UInt32*, HRESULT)
    get_property_storage_size : Proc(IPersistSerializedPropStorage2*, UInt32*, HRESULT)
    get_property_storage_buffer : Proc(IPersistSerializedPropStorage2*, SERIALIZEDPROPSTORAGE*, UInt32, UInt32*, HRESULT)
  end

  struct IPersistSerializedPropStorage2
    lpVtbl : IPersistSerializedPropStorage2VTbl*
  end

  struct IPropertySystemChangeNotifyVTbl
    query_interface : Proc(IPropertySystemChangeNotify*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPropertySystemChangeNotify*, UInt32)
    release : Proc(IPropertySystemChangeNotify*, UInt32)
    schema_refreshed : Proc(IPropertySystemChangeNotify*, HRESULT)
  end

  struct IPropertySystemChangeNotify
    lpVtbl : IPropertySystemChangeNotifyVTbl*
  end

  struct ICreateObjectVTbl
    query_interface : Proc(ICreateObject*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICreateObject*, UInt32)
    release : Proc(ICreateObject*, UInt32)
    create_object : Proc(ICreateObject*, Guid*, IUnknown, Guid*, Void**, HRESULT)
  end

  struct ICreateObject
    lpVtbl : ICreateObjectVTbl*
  end

  struct IPropertyUIVTbl
    query_interface : Proc(IPropertyUI*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPropertyUI*, UInt32)
    release : Proc(IPropertyUI*, UInt32)
    parse_property_name : Proc(IPropertyUI*, LibC::LPWSTR, Guid*, UInt32*, UInt32*, HRESULT)
    get_cannonical_name : Proc(IPropertyUI*, Guid*, UInt32, Char*, UInt32, HRESULT)
    get_display_name : Proc(IPropertyUI*, Guid*, UInt32, PROPERTYUI_NAME_FLAGS, Char*, UInt32, HRESULT)
    get_property_description : Proc(IPropertyUI*, Guid*, UInt32, Char*, UInt32, HRESULT)
    get_default_width : Proc(IPropertyUI*, Guid*, UInt32, UInt32*, HRESULT)
    get_flags : Proc(IPropertyUI*, Guid*, UInt32, PROPERTYUI_FLAGS*, HRESULT)
    format_for_display : Proc(IPropertyUI*, Guid*, UInt32, PROPVARIANT*, PROPERTYUI_FORMAT_FLAGS, Char*, UInt32, HRESULT)
    get_help_info : Proc(IPropertyUI*, Guid*, UInt32, Char*, UInt32, UInt32*, HRESULT)
  end

  struct IPropertyUI
    lpVtbl : IPropertyUIVTbl*
  end


  # Params # propvar : PROPVARIANT* [In],riid : Guid* [In],ppv : Void** [In]
  fun PropVariantToWinRTPropertyValue(propvar : PROPVARIANT*, riid : Guid*, ppv : Void**) : HRESULT

  # Params # punkpropertyvalue : IUnknown [In],ppropvar : PROPVARIANT* [In]
  fun WinRTPropertyValueToPropVariant(punkpropertyvalue : IUnknown, ppropvar : PROPVARIANT*) : HRESULT

  # Params # propkey : PROPERTYKEY* [In],propvar : PROPVARIANT* [In],pdfflags : PROPDESC_FORMAT_FLAGS [In],pwsztext : Char* [In],cchtext : UInt32 [In]
  fun PSFormatForDisplay(propkey : PROPERTYKEY*, propvar : PROPVARIANT*, pdfflags : PROPDESC_FORMAT_FLAGS, pwsztext : Char*, cchtext : UInt32) : HRESULT

  # Params # key : PROPERTYKEY* [In],propvar : PROPVARIANT* [In],pdff : PROPDESC_FORMAT_FLAGS [In],ppszdisplay : LibC::LPWSTR* [In]
  fun PSFormatForDisplayAlloc(key : PROPERTYKEY*, propvar : PROPVARIANT*, pdff : PROPDESC_FORMAT_FLAGS, ppszdisplay : LibC::LPWSTR*) : HRESULT

  # Params # pps : IPropertyStore [In],ppd : IPropertyDescription [In],pdff : PROPDESC_FORMAT_FLAGS [In],ppszdisplay : LibC::LPWSTR* [In]
  fun PSFormatPropertyValue(pps : IPropertyStore, ppd : IPropertyDescription, pdff : PROPDESC_FORMAT_FLAGS, ppszdisplay : LibC::LPWSTR*) : HRESULT

  # Params # propkey : PROPERTYKEY* [In],propvar : PROPVARIANT* [In],ppszimageres : LibC::LPWSTR* [In]
  fun PSGetImageReferenceForValue(propkey : PROPERTYKEY*, propvar : PROPVARIANT*, ppszimageres : LibC::LPWSTR*) : HRESULT

  # Params # pkey : PROPERTYKEY* [In],psz : Char* [In],cch : UInt32 [In]
  fun PSStringFromPropertyKey(pkey : PROPERTYKEY*, psz : Char*, cch : UInt32) : HRESULT

  # Params # pszstring : LibC::LPWSTR [In],pkey : PROPERTYKEY* [In]
  fun PSPropertyKeyFromString(pszstring : LibC::LPWSTR, pkey : PROPERTYKEY*) : HRESULT

  # Params # riid : Guid* [In],ppv : Void** [In]
  fun PSCreateMemoryPropertyStore(riid : Guid*, ppv : Void**) : HRESULT

  # Params # flags : GETPROPERTYSTOREFLAGS [In],pdpsf : IDelayedPropertyStoreFactory [In],rgstoreids : UInt32* [In],cstores : UInt32 [In],riid : Guid* [In],ppv : Void** [In]
  fun PSCreateDelayedMultiplexPropertyStore(flags : GETPROPERTYSTOREFLAGS, pdpsf : IDelayedPropertyStoreFactory, rgstoreids : UInt32*, cstores : UInt32, riid : Guid*, ppv : Void**) : HRESULT

  # Params # prgpunkstores : IUnknown* [In],cstores : UInt32 [In],riid : Guid* [In],ppv : Void** [In]
  fun PSCreateMultiplexPropertyStore(prgpunkstores : IUnknown*, cstores : UInt32, riid : Guid*, ppv : Void**) : HRESULT

  # Params # rgpropkey : PROPERTYKEY* [In],rgflags : PKA_FLAGS* [In],rgpropvar : PROPVARIANT* [In],cchanges : UInt32 [In],riid : Guid* [In],ppv : Void** [In]
  fun PSCreatePropertyChangeArray(rgpropkey : PROPERTYKEY*, rgflags : PKA_FLAGS*, rgpropvar : PROPVARIANT*, cchanges : UInt32, riid : Guid*, ppv : Void**) : HRESULT

  # Params # flags : PKA_FLAGS [In],key : PROPERTYKEY* [In],propvar : PROPVARIANT* [In],riid : Guid* [In],ppv : Void** [In]
  fun PSCreateSimplePropertyChange(flags : PKA_FLAGS, key : PROPERTYKEY*, propvar : PROPVARIANT*, riid : Guid*, ppv : Void**) : HRESULT

  # Params # propkey : PROPERTYKEY* [In],riid : Guid* [In],ppv : Void** [In]
  fun PSGetPropertyDescription(propkey : PROPERTYKEY*, riid : Guid*, ppv : Void**) : HRESULT

  # Params # pszcanonicalname : LibC::LPWSTR [In],riid : Guid* [In],ppv : Void** [In]
  fun PSGetPropertyDescriptionByName(pszcanonicalname : LibC::LPWSTR, riid : Guid*, ppv : Void**) : HRESULT

  # Params # pszfilepath : LibC::LPWSTR [In],pclsid : Guid* [In]
  fun PSLookupPropertyHandlerCLSID(pszfilepath : LibC::LPWSTR, pclsid : Guid*) : HRESULT

  # Params # punkitem : IUnknown [In],freadwrite : LibC::BOOL [In],riid : Guid* [In],ppv : Void** [In]
  fun PSGetItemPropertyHandler(punkitem : IUnknown, freadwrite : LibC::BOOL, riid : Guid*, ppv : Void**) : HRESULT

  # Params # punkitem : IUnknown [In],freadwrite : LibC::BOOL [In],punkcreateobject : IUnknown [In],riid : Guid* [In],ppv : Void** [In]
  fun PSGetItemPropertyHandlerWithCreateObject(punkitem : IUnknown, freadwrite : LibC::BOOL, punkcreateobject : IUnknown, riid : Guid*, ppv : Void**) : HRESULT

  # Params # pps : IPropertyStore [In],ppd : IPropertyDescription [In],ppropvar : PROPVARIANT* [In]
  fun PSGetPropertyValue(pps : IPropertyStore, ppd : IPropertyDescription, ppropvar : PROPVARIANT*) : HRESULT

  # Params # pps : IPropertyStore [In],ppd : IPropertyDescription [In],propvar : PROPVARIANT* [In]
  fun PSSetPropertyValue(pps : IPropertyStore, ppd : IPropertyDescription, propvar : PROPVARIANT*) : HRESULT

  # Params # pszpath : LibC::LPWSTR [In]
  fun PSRegisterPropertySchema(pszpath : LibC::LPWSTR) : HRESULT

  # Params # pszpath : LibC::LPWSTR [In]
  fun PSUnregisterPropertySchema(pszpath : LibC::LPWSTR) : HRESULT

  # Params # 
  fun PSRefreshPropertySchema : HRESULT

  # Params # filteron : PROPDESC_ENUMFILTER [In],riid : Guid* [In],ppv : Void** [In]
  fun PSEnumeratePropertyDescriptions(filteron : PROPDESC_ENUMFILTER, riid : Guid*, ppv : Void**) : HRESULT

  # Params # pszname : LibC::LPWSTR [In],ppropkey : PROPERTYKEY* [In]
  fun PSGetPropertyKeyFromName(pszname : LibC::LPWSTR, ppropkey : PROPERTYKEY*) : HRESULT

  # Params # propkey : PROPERTYKEY* [In],ppszcanonicalname : LibC::LPWSTR* [In]
  fun PSGetNameFromPropertyKey(propkey : PROPERTYKEY*, ppszcanonicalname : LibC::LPWSTR*) : HRESULT

  # Params # key : PROPERTYKEY* [In],ppropvar : PROPVARIANT* [In]
  fun PSCoerceToCanonicalValue(key : PROPERTYKEY*, ppropvar : PROPVARIANT*) : HRESULT

  # Params # pszproplist : LibC::LPWSTR [In],riid : Guid* [In],ppv : Void** [In]
  fun PSGetPropertyDescriptionListFromString(pszproplist : LibC::LPWSTR, riid : Guid*, ppv : Void**) : HRESULT

  # Params # ppss : IPropertySetStorage [In],grfmode : UInt32 [In],riid : Guid* [In],ppv : Void** [In]
  fun PSCreatePropertyStoreFromPropertySetStorage(ppss : IPropertySetStorage, grfmode : UInt32, riid : Guid*, ppv : Void**) : HRESULT

  # Params # punk : IUnknown [In],grfmode : UInt32 [In],riid : Guid* [In],ppv : Void** [In]
  fun PSCreatePropertyStoreFromObject(punk : IUnknown, grfmode : UInt32, riid : Guid*, ppv : Void**) : HRESULT

  # Params # pps : IPropertyStore [In],riid : Guid* [In],ppv : Void** [In]
  fun PSCreateAdapterFromPropertyStore(pps : IPropertyStore, riid : Guid*, ppv : Void**) : HRESULT

  # Params # riid : Guid* [In],ppv : Void** [In]
  fun PSGetPropertySystem(riid : Guid*, ppv : Void**) : HRESULT

  # Params # psps : SERIALIZEDPROPSTORAGE* [In],cb : UInt32 [In],rpkey : PROPERTYKEY* [In],ppropvar : PROPVARIANT* [In]
  fun PSGetPropertyFromPropertyStorage(psps : SERIALIZEDPROPSTORAGE*, cb : UInt32, rpkey : PROPERTYKEY*, ppropvar : PROPVARIANT*) : HRESULT

  # Params # psps : SERIALIZEDPROPSTORAGE* [In],cb : UInt32 [In],pszname : LibC::LPWSTR [In],ppropvar : PROPVARIANT* [In]
  fun PSGetNamedPropertyFromPropertyStorage(psps : SERIALIZEDPROPSTORAGE*, cb : UInt32, pszname : LibC::LPWSTR, ppropvar : PROPVARIANT*) : HRESULT

  # Params # propbag : IPropertyBag [In],propname : LibC::LPWSTR [In],var : VARIANT* [In],type : UInt16 [In]
  fun PSPropertyBag_ReadType(propbag : IPropertyBag, propname : LibC::LPWSTR, var : VARIANT*, type : UInt16) : HRESULT

  # Params # propbag : IPropertyBag [In],propname : LibC::LPWSTR [In],value : Char* [In],charactercount : Int32 [In]
  fun PSPropertyBag_ReadStr(propbag : IPropertyBag, propname : LibC::LPWSTR, value : Char*, charactercount : Int32) : HRESULT

  # Params # propbag : IPropertyBag [In],propname : LibC::LPWSTR [In],value : LibC::LPWSTR* [In]
  fun PSPropertyBag_ReadStrAlloc(propbag : IPropertyBag, propname : LibC::LPWSTR, value : LibC::LPWSTR*) : HRESULT

  # Params # propbag : IPropertyBag [In],propname : LibC::LPWSTR [In],value : UInt8* [In]
  fun PSPropertyBag_ReadBSTR(propbag : IPropertyBag, propname : LibC::LPWSTR, value : UInt8*) : HRESULT

  # Params # propbag : IPropertyBag [In],propname : LibC::LPWSTR [In],value : LibC::LPWSTR [In]
  fun PSPropertyBag_WriteStr(propbag : IPropertyBag, propname : LibC::LPWSTR, value : LibC::LPWSTR) : HRESULT

  # Params # propbag : IPropertyBag [In],propname : LibC::LPWSTR [In],value : UInt8 [In]
  fun PSPropertyBag_WriteBSTR(propbag : IPropertyBag, propname : LibC::LPWSTR, value : UInt8) : HRESULT

  # Params # propbag : IPropertyBag [In],propname : LibC::LPWSTR [In],value : Int32* [In]
  fun PSPropertyBag_ReadInt(propbag : IPropertyBag, propname : LibC::LPWSTR, value : Int32*) : HRESULT

  # Params # propbag : IPropertyBag [In],propname : LibC::LPWSTR [In],value : Int32 [In]
  fun PSPropertyBag_WriteInt(propbag : IPropertyBag, propname : LibC::LPWSTR, value : Int32) : HRESULT

  # Params # propbag : IPropertyBag [In],propname : LibC::LPWSTR [In],value : Int16* [In]
  fun PSPropertyBag_ReadSHORT(propbag : IPropertyBag, propname : LibC::LPWSTR, value : Int16*) : HRESULT

  # Params # propbag : IPropertyBag [In],propname : LibC::LPWSTR [In],value : Int16 [In]
  fun PSPropertyBag_WriteSHORT(propbag : IPropertyBag, propname : LibC::LPWSTR, value : Int16) : HRESULT

  # Params # propbag : IPropertyBag [In],propname : LibC::LPWSTR [In],value : Int32* [In]
  fun PSPropertyBag_ReadLONG(propbag : IPropertyBag, propname : LibC::LPWSTR, value : Int32*) : HRESULT

  # Params # propbag : IPropertyBag [In],propname : LibC::LPWSTR [In],value : Int32 [In]
  fun PSPropertyBag_WriteLONG(propbag : IPropertyBag, propname : LibC::LPWSTR, value : Int32) : HRESULT

  # Params # propbag : IPropertyBag [In],propname : LibC::LPWSTR [In],value : UInt32* [In]
  fun PSPropertyBag_ReadDWORD(propbag : IPropertyBag, propname : LibC::LPWSTR, value : UInt32*) : HRESULT

  # Params # propbag : IPropertyBag [In],propname : LibC::LPWSTR [In],value : UInt32 [In]
  fun PSPropertyBag_WriteDWORD(propbag : IPropertyBag, propname : LibC::LPWSTR, value : UInt32) : HRESULT

  # Params # propbag : IPropertyBag [In],propname : LibC::LPWSTR [In],value : LibC::BOOL* [In]
  fun PSPropertyBag_ReadBOOL(propbag : IPropertyBag, propname : LibC::LPWSTR, value : LibC::BOOL*) : HRESULT

  # Params # propbag : IPropertyBag [In],propname : LibC::LPWSTR [In],value : LibC::BOOL [In]
  fun PSPropertyBag_WriteBOOL(propbag : IPropertyBag, propname : LibC::LPWSTR, value : LibC::BOOL) : HRESULT

  # Params # propbag : IPropertyBag [In],propname : LibC::LPWSTR [In],value : POINTL* [In]
  fun PSPropertyBag_ReadPOINTL(propbag : IPropertyBag, propname : LibC::LPWSTR, value : POINTL*) : HRESULT

  # Params # propbag : IPropertyBag [In],propname : LibC::LPWSTR [In],value : POINTL* [In]
  fun PSPropertyBag_WritePOINTL(propbag : IPropertyBag, propname : LibC::LPWSTR, value : POINTL*) : HRESULT

  # Params # propbag : IPropertyBag [In],propname : LibC::LPWSTR [In],value : POINTS* [In]
  fun PSPropertyBag_ReadPOINTS(propbag : IPropertyBag, propname : LibC::LPWSTR, value : POINTS*) : HRESULT

  # Params # propbag : IPropertyBag [In],propname : LibC::LPWSTR [In],value : POINTS* [In]
  fun PSPropertyBag_WritePOINTS(propbag : IPropertyBag, propname : LibC::LPWSTR, value : POINTS*) : HRESULT

  # Params # propbag : IPropertyBag [In],propname : LibC::LPWSTR [In],value : RECTL* [In]
  fun PSPropertyBag_ReadRECTL(propbag : IPropertyBag, propname : LibC::LPWSTR, value : RECTL*) : HRESULT

  # Params # propbag : IPropertyBag [In],propname : LibC::LPWSTR [In],value : RECTL* [In]
  fun PSPropertyBag_WriteRECTL(propbag : IPropertyBag, propname : LibC::LPWSTR, value : RECTL*) : HRESULT

  # Params # propbag : IPropertyBag [In],propname : LibC::LPWSTR [In],value : IStream* [In]
  fun PSPropertyBag_ReadStream(propbag : IPropertyBag, propname : LibC::LPWSTR, value : IStream*) : HRESULT

  # Params # propbag : IPropertyBag [In],propname : LibC::LPWSTR [In],value : IStream [In]
  fun PSPropertyBag_WriteStream(propbag : IPropertyBag, propname : LibC::LPWSTR, value : IStream) : HRESULT

  # Params # propbag : IPropertyBag [In],propname : LibC::LPWSTR [In]
  fun PSPropertyBag_Delete(propbag : IPropertyBag, propname : LibC::LPWSTR) : HRESULT

  # Params # propbag : IPropertyBag [In],propname : LibC::LPWSTR [In],value : UInt64* [In]
  fun PSPropertyBag_ReadULONGLONG(propbag : IPropertyBag, propname : LibC::LPWSTR, value : UInt64*) : HRESULT

  # Params # propbag : IPropertyBag [In],propname : LibC::LPWSTR [In],value : UInt64 [In]
  fun PSPropertyBag_WriteULONGLONG(propbag : IPropertyBag, propname : LibC::LPWSTR, value : UInt64) : HRESULT

  # Params # propbag : IPropertyBag [In],propname : LibC::LPWSTR [In],riid : Guid* [In],ppv : Void** [In]
  fun PSPropertyBag_ReadUnknown(propbag : IPropertyBag, propname : LibC::LPWSTR, riid : Guid*, ppv : Void**) : HRESULT

  # Params # propbag : IPropertyBag [In],propname : LibC::LPWSTR [In],punk : IUnknown [In]
  fun PSPropertyBag_WriteUnknown(propbag : IPropertyBag, propname : LibC::LPWSTR, punk : IUnknown) : HRESULT

  # Params # propbag : IPropertyBag [In],propname : LibC::LPWSTR [In],value : Guid* [In]
  fun PSPropertyBag_ReadGUID(propbag : IPropertyBag, propname : LibC::LPWSTR, value : Guid*) : HRESULT

  # Params # propbag : IPropertyBag [In],propname : LibC::LPWSTR [In],value : Guid* [In]
  fun PSPropertyBag_WriteGUID(propbag : IPropertyBag, propname : LibC::LPWSTR, value : Guid*) : HRESULT

  # Params # propbag : IPropertyBag [In],propname : LibC::LPWSTR [In],value : PROPERTYKEY* [In]
  fun PSPropertyBag_ReadPropertyKey(propbag : IPropertyBag, propname : LibC::LPWSTR, value : PROPERTYKEY*) : HRESULT

  # Params # propbag : IPropertyBag [In],propname : LibC::LPWSTR [In],value : PROPERTYKEY* [In]
  fun PSPropertyBag_WritePropertyKey(propbag : IPropertyBag, propname : LibC::LPWSTR, value : PROPERTYKEY*) : HRESULT

  # Params # hinst : HINSTANCE [In],id : UInt32 [In],ppropvar : PROPVARIANT* [In]
  fun InitPropVariantFromResource(hinst : HINSTANCE, id : UInt32, ppropvar : PROPVARIANT*) : HRESULT

  # Params # pv : Void* [In],cb : UInt32 [In],ppropvar : PROPVARIANT* [In]
  fun InitPropVariantFromBuffer(pv : Void*, cb : UInt32, ppropvar : PROPVARIANT*) : HRESULT

  # Params # clsid : Guid* [In],ppropvar : PROPVARIANT* [In]
  fun InitPropVariantFromCLSID(clsid : Guid*, ppropvar : PROPVARIANT*) : HRESULT

  # Params # guid : Guid* [In],ppropvar : PROPVARIANT* [In]
  fun InitPropVariantFromGUIDAsString(guid : Guid*, ppropvar : PROPVARIANT*) : HRESULT

  # Params # pftin : FILETIME* [In],ppropvar : PROPVARIANT* [In]
  fun InitPropVariantFromFileTime(pftin : FILETIME*, ppropvar : PROPVARIANT*) : HRESULT

  # Params # propvarin : PROPVARIANT* [In],ielem : UInt32 [In],ppropvar : PROPVARIANT* [In]
  fun InitPropVariantFromPropVariantVectorElem(propvarin : PROPVARIANT*, ielem : UInt32, ppropvar : PROPVARIANT*) : HRESULT

  # Params # propvarsingle : PROPVARIANT* [In],ppropvarvector : PROPVARIANT* [In]
  fun InitPropVariantVectorFromPropVariant(propvarsingle : PROPVARIANT*, ppropvarvector : PROPVARIANT*) : HRESULT

  # Params # pstrret : STRRET* [In],pidl : ITEMIDLIST* [In],ppropvar : PROPVARIANT* [In]
  fun InitPropVariantFromStrRet(pstrret : STRRET*, pidl : ITEMIDLIST*, ppropvar : PROPVARIANT*) : HRESULT

  # Params # prgf : LibC::BOOL* [In],celems : UInt32 [In],ppropvar : PROPVARIANT* [In]
  fun InitPropVariantFromBooleanVector(prgf : LibC::BOOL*, celems : UInt32, ppropvar : PROPVARIANT*) : HRESULT

  # Params # prgn : Int16* [In],celems : UInt32 [In],ppropvar : PROPVARIANT* [In]
  fun InitPropVariantFromInt16Vector(prgn : Int16*, celems : UInt32, ppropvar : PROPVARIANT*) : HRESULT

  # Params # prgn : UInt16* [In],celems : UInt32 [In],ppropvar : PROPVARIANT* [In]
  fun InitPropVariantFromUInt16Vector(prgn : UInt16*, celems : UInt32, ppropvar : PROPVARIANT*) : HRESULT

  # Params # prgn : Int32* [In],celems : UInt32 [In],ppropvar : PROPVARIANT* [In]
  fun InitPropVariantFromInt32Vector(prgn : Int32*, celems : UInt32, ppropvar : PROPVARIANT*) : HRESULT

  # Params # prgn : UInt32* [In],celems : UInt32 [In],ppropvar : PROPVARIANT* [In]
  fun InitPropVariantFromUInt32Vector(prgn : UInt32*, celems : UInt32, ppropvar : PROPVARIANT*) : HRESULT

  # Params # prgn : Int64* [In],celems : UInt32 [In],ppropvar : PROPVARIANT* [In]
  fun InitPropVariantFromInt64Vector(prgn : Int64*, celems : UInt32, ppropvar : PROPVARIANT*) : HRESULT

  # Params # prgn : UInt64* [In],celems : UInt32 [In],ppropvar : PROPVARIANT* [In]
  fun InitPropVariantFromUInt64Vector(prgn : UInt64*, celems : UInt32, ppropvar : PROPVARIANT*) : HRESULT

  # Params # prgn : Float64* [In],celems : UInt32 [In],ppropvar : PROPVARIANT* [In]
  fun InitPropVariantFromDoubleVector(prgn : Float64*, celems : UInt32, ppropvar : PROPVARIANT*) : HRESULT

  # Params # prgft : FILETIME* [In],celems : UInt32 [In],ppropvar : PROPVARIANT* [In]
  fun InitPropVariantFromFileTimeVector(prgft : FILETIME*, celems : UInt32, ppropvar : PROPVARIANT*) : HRESULT

  # Params # prgsz : LibC::LPWSTR* [In],celems : UInt32 [In],ppropvar : PROPVARIANT* [In]
  fun InitPropVariantFromStringVector(prgsz : LibC::LPWSTR*, celems : UInt32, ppropvar : PROPVARIANT*) : HRESULT

  # Params # psz : LibC::LPWSTR [In],ppropvar : PROPVARIANT* [In]
  fun InitPropVariantFromStringAsVector(psz : LibC::LPWSTR, ppropvar : PROPVARIANT*) : HRESULT

  # Params # propvarin : PROPVARIANT* [In],fdefault : LibC::BOOL [In]
  fun PropVariantToBooleanWithDefault(propvarin : PROPVARIANT*, fdefault : LibC::BOOL) : LibC::BOOL

  # Params # propvarin : PROPVARIANT* [In],idefault : Int16 [In]
  fun PropVariantToInt16WithDefault(propvarin : PROPVARIANT*, idefault : Int16) : Int16

  # Params # propvarin : PROPVARIANT* [In],uidefault : UInt16 [In]
  fun PropVariantToUInt16WithDefault(propvarin : PROPVARIANT*, uidefault : UInt16) : UInt16

  # Params # propvarin : PROPVARIANT* [In],ldefault : Int32 [In]
  fun PropVariantToInt32WithDefault(propvarin : PROPVARIANT*, ldefault : Int32) : Int32

  # Params # propvarin : PROPVARIANT* [In],uldefault : UInt32 [In]
  fun PropVariantToUInt32WithDefault(propvarin : PROPVARIANT*, uldefault : UInt32) : UInt32

  # Params # propvarin : PROPVARIANT* [In],lldefault : Int64 [In]
  fun PropVariantToInt64WithDefault(propvarin : PROPVARIANT*, lldefault : Int64) : Int64

  # Params # propvarin : PROPVARIANT* [In],ulldefault : UInt64 [In]
  fun PropVariantToUInt64WithDefault(propvarin : PROPVARIANT*, ulldefault : UInt64) : UInt64

  # Params # propvarin : PROPVARIANT* [In],dbldefault : Float64 [In]
  fun PropVariantToDoubleWithDefault(propvarin : PROPVARIANT*, dbldefault : Float64) : Float64

  # Params # propvarin : PROPVARIANT* [In],pszdefault : LibC::LPWSTR [In]
  fun PropVariantToStringWithDefault(propvarin : PROPVARIANT*, pszdefault : LibC::LPWSTR) : LibC::LPWSTR

  # Params # propvarin : PROPVARIANT* [In],pfret : LibC::BOOL* [In]
  fun PropVariantToBoolean(propvarin : PROPVARIANT*, pfret : LibC::BOOL*) : HRESULT

  # Params # propvarin : PROPVARIANT* [In],piret : Int16* [In]
  fun PropVariantToInt16(propvarin : PROPVARIANT*, piret : Int16*) : HRESULT

  # Params # propvarin : PROPVARIANT* [In],puiret : UInt16* [In]
  fun PropVariantToUInt16(propvarin : PROPVARIANT*, puiret : UInt16*) : HRESULT

  # Params # propvarin : PROPVARIANT* [In],plret : Int32* [In]
  fun PropVariantToInt32(propvarin : PROPVARIANT*, plret : Int32*) : HRESULT

  # Params # propvarin : PROPVARIANT* [In],pulret : UInt32* [In]
  fun PropVariantToUInt32(propvarin : PROPVARIANT*, pulret : UInt32*) : HRESULT

  # Params # propvarin : PROPVARIANT* [In],pllret : Int64* [In]
  fun PropVariantToInt64(propvarin : PROPVARIANT*, pllret : Int64*) : HRESULT

  # Params # propvarin : PROPVARIANT* [In],pullret : UInt64* [In]
  fun PropVariantToUInt64(propvarin : PROPVARIANT*, pullret : UInt64*) : HRESULT

  # Params # propvarin : PROPVARIANT* [In],pdblret : Float64* [In]
  fun PropVariantToDouble(propvarin : PROPVARIANT*, pdblret : Float64*) : HRESULT

  # Params # propvar : PROPVARIANT* [In],pv : Void* [In],cb : UInt32 [In]
  fun PropVariantToBuffer(propvar : PROPVARIANT*, pv : Void*, cb : UInt32) : HRESULT

  # Params # propvar : PROPVARIANT* [In],psz : Char* [In],cch : UInt32 [In]
  fun PropVariantToString(propvar : PROPVARIANT*, psz : Char*, cch : UInt32) : HRESULT

  # Params # propvar : PROPVARIANT* [In],pguid : Guid* [In]
  fun PropVariantToGUID(propvar : PROPVARIANT*, pguid : Guid*) : HRESULT

  # Params # propvar : PROPVARIANT* [In],ppszout : LibC::LPWSTR* [In]
  fun PropVariantToStringAlloc(propvar : PROPVARIANT*, ppszout : LibC::LPWSTR*) : HRESULT

  # Params # propvar : PROPVARIANT* [In],pbstrout : UInt8* [In]
  fun PropVariantToBSTR(propvar : PROPVARIANT*, pbstrout : UInt8*) : HRESULT

  # Params # propvar : PROPVARIANT* [In],pstrret : STRRET* [In]
  fun PropVariantToStrRet(propvar : PROPVARIANT*, pstrret : STRRET*) : HRESULT

  # Params # propvar : PROPVARIANT* [In],pstfout : PSTIME_FLAGS [In],pftout : FILETIME* [In]
  fun PropVariantToFileTime(propvar : PROPVARIANT*, pstfout : PSTIME_FLAGS, pftout : FILETIME*) : HRESULT

  # Params # propvar : PROPVARIANT* [In]
  fun PropVariantGetElementCount(propvar : PROPVARIANT*) : UInt32

  # Params # propvar : PROPVARIANT* [In],prgf : LibC::BOOL* [In],crgf : UInt32 [In],pcelem : UInt32* [In]
  fun PropVariantToBooleanVector(propvar : PROPVARIANT*, prgf : LibC::BOOL*, crgf : UInt32, pcelem : UInt32*) : HRESULT

  # Params # propvar : PROPVARIANT* [In],prgn : Int16* [In],crgn : UInt32 [In],pcelem : UInt32* [In]
  fun PropVariantToInt16Vector(propvar : PROPVARIANT*, prgn : Int16*, crgn : UInt32, pcelem : UInt32*) : HRESULT

  # Params # propvar : PROPVARIANT* [In],prgn : UInt16* [In],crgn : UInt32 [In],pcelem : UInt32* [In]
  fun PropVariantToUInt16Vector(propvar : PROPVARIANT*, prgn : UInt16*, crgn : UInt32, pcelem : UInt32*) : HRESULT

  # Params # propvar : PROPVARIANT* [In],prgn : Int32* [In],crgn : UInt32 [In],pcelem : UInt32* [In]
  fun PropVariantToInt32Vector(propvar : PROPVARIANT*, prgn : Int32*, crgn : UInt32, pcelem : UInt32*) : HRESULT

  # Params # propvar : PROPVARIANT* [In],prgn : UInt32* [In],crgn : UInt32 [In],pcelem : UInt32* [In]
  fun PropVariantToUInt32Vector(propvar : PROPVARIANT*, prgn : UInt32*, crgn : UInt32, pcelem : UInt32*) : HRESULT

  # Params # propvar : PROPVARIANT* [In],prgn : Int64* [In],crgn : UInt32 [In],pcelem : UInt32* [In]
  fun PropVariantToInt64Vector(propvar : PROPVARIANT*, prgn : Int64*, crgn : UInt32, pcelem : UInt32*) : HRESULT

  # Params # propvar : PROPVARIANT* [In],prgn : UInt64* [In],crgn : UInt32 [In],pcelem : UInt32* [In]
  fun PropVariantToUInt64Vector(propvar : PROPVARIANT*, prgn : UInt64*, crgn : UInt32, pcelem : UInt32*) : HRESULT

  # Params # propvar : PROPVARIANT* [In],prgn : Float64* [In],crgn : UInt32 [In],pcelem : UInt32* [In]
  fun PropVariantToDoubleVector(propvar : PROPVARIANT*, prgn : Float64*, crgn : UInt32, pcelem : UInt32*) : HRESULT

  # Params # propvar : PROPVARIANT* [In],prgft : FILETIME* [In],crgft : UInt32 [In],pcelem : UInt32* [In]
  fun PropVariantToFileTimeVector(propvar : PROPVARIANT*, prgft : FILETIME*, crgft : UInt32, pcelem : UInt32*) : HRESULT

  # Params # propvar : PROPVARIANT* [In],prgsz : LibC::LPWSTR* [In],crgsz : UInt32 [In],pcelem : UInt32* [In]
  fun PropVariantToStringVector(propvar : PROPVARIANT*, prgsz : LibC::LPWSTR*, crgsz : UInt32, pcelem : UInt32*) : HRESULT

  # Params # propvar : PROPVARIANT* [In],pprgf : LibC::BOOL** [In],pcelem : UInt32* [In]
  fun PropVariantToBooleanVectorAlloc(propvar : PROPVARIANT*, pprgf : LibC::BOOL**, pcelem : UInt32*) : HRESULT

  # Params # propvar : PROPVARIANT* [In],pprgn : Int16** [In],pcelem : UInt32* [In]
  fun PropVariantToInt16VectorAlloc(propvar : PROPVARIANT*, pprgn : Int16**, pcelem : UInt32*) : HRESULT

  # Params # propvar : PROPVARIANT* [In],pprgn : UInt16** [In],pcelem : UInt32* [In]
  fun PropVariantToUInt16VectorAlloc(propvar : PROPVARIANT*, pprgn : UInt16**, pcelem : UInt32*) : HRESULT

  # Params # propvar : PROPVARIANT* [In],pprgn : Int32** [In],pcelem : UInt32* [In]
  fun PropVariantToInt32VectorAlloc(propvar : PROPVARIANT*, pprgn : Int32**, pcelem : UInt32*) : HRESULT

  # Params # propvar : PROPVARIANT* [In],pprgn : UInt32** [In],pcelem : UInt32* [In]
  fun PropVariantToUInt32VectorAlloc(propvar : PROPVARIANT*, pprgn : UInt32**, pcelem : UInt32*) : HRESULT

  # Params # propvar : PROPVARIANT* [In],pprgn : Int64** [In],pcelem : UInt32* [In]
  fun PropVariantToInt64VectorAlloc(propvar : PROPVARIANT*, pprgn : Int64**, pcelem : UInt32*) : HRESULT

  # Params # propvar : PROPVARIANT* [In],pprgn : UInt64** [In],pcelem : UInt32* [In]
  fun PropVariantToUInt64VectorAlloc(propvar : PROPVARIANT*, pprgn : UInt64**, pcelem : UInt32*) : HRESULT

  # Params # propvar : PROPVARIANT* [In],pprgn : Float64** [In],pcelem : UInt32* [In]
  fun PropVariantToDoubleVectorAlloc(propvar : PROPVARIANT*, pprgn : Float64**, pcelem : UInt32*) : HRESULT

  # Params # propvar : PROPVARIANT* [In],pprgft : FILETIME** [In],pcelem : UInt32* [In]
  fun PropVariantToFileTimeVectorAlloc(propvar : PROPVARIANT*, pprgft : FILETIME**, pcelem : UInt32*) : HRESULT

  # Params # propvar : PROPVARIANT* [In],pprgsz : LibC::LPWSTR** [In],pcelem : UInt32* [In]
  fun PropVariantToStringVectorAlloc(propvar : PROPVARIANT*, pprgsz : LibC::LPWSTR**, pcelem : UInt32*) : HRESULT

  # Params # propvar : PROPVARIANT* [In],ielem : UInt32 [In],pfval : LibC::BOOL* [In]
  fun PropVariantGetBooleanElem(propvar : PROPVARIANT*, ielem : UInt32, pfval : LibC::BOOL*) : HRESULT

  # Params # propvar : PROPVARIANT* [In],ielem : UInt32 [In],pnval : Int16* [In]
  fun PropVariantGetInt16Elem(propvar : PROPVARIANT*, ielem : UInt32, pnval : Int16*) : HRESULT

  # Params # propvar : PROPVARIANT* [In],ielem : UInt32 [In],pnval : UInt16* [In]
  fun PropVariantGetUInt16Elem(propvar : PROPVARIANT*, ielem : UInt32, pnval : UInt16*) : HRESULT

  # Params # propvar : PROPVARIANT* [In],ielem : UInt32 [In],pnval : Int32* [In]
  fun PropVariantGetInt32Elem(propvar : PROPVARIANT*, ielem : UInt32, pnval : Int32*) : HRESULT

  # Params # propvar : PROPVARIANT* [In],ielem : UInt32 [In],pnval : UInt32* [In]
  fun PropVariantGetUInt32Elem(propvar : PROPVARIANT*, ielem : UInt32, pnval : UInt32*) : HRESULT

  # Params # propvar : PROPVARIANT* [In],ielem : UInt32 [In],pnval : Int64* [In]
  fun PropVariantGetInt64Elem(propvar : PROPVARIANT*, ielem : UInt32, pnval : Int64*) : HRESULT

  # Params # propvar : PROPVARIANT* [In],ielem : UInt32 [In],pnval : UInt64* [In]
  fun PropVariantGetUInt64Elem(propvar : PROPVARIANT*, ielem : UInt32, pnval : UInt64*) : HRESULT

  # Params # propvar : PROPVARIANT* [In],ielem : UInt32 [In],pnval : Float64* [In]
  fun PropVariantGetDoubleElem(propvar : PROPVARIANT*, ielem : UInt32, pnval : Float64*) : HRESULT

  # Params # propvar : PROPVARIANT* [In],ielem : UInt32 [In],pftval : FILETIME* [In]
  fun PropVariantGetFileTimeElem(propvar : PROPVARIANT*, ielem : UInt32, pftval : FILETIME*) : HRESULT

  # Params # propvar : PROPVARIANT* [In],ielem : UInt32 [In],ppszval : LibC::LPWSTR* [In]
  fun PropVariantGetStringElem(propvar : PROPVARIANT*, ielem : UInt32, ppszval : LibC::LPWSTR*) : HRESULT

  # Params # rgpropvar : PROPVARIANT* [In],cvars : UInt32 [In]
  fun ClearPropVariantArray(rgpropvar : PROPVARIANT*, cvars : UInt32)

  # Params # propvar1 : PROPVARIANT* [In],propvar2 : PROPVARIANT* [In],unit : PROPVAR_COMPARE_UNIT [In],flags : PROPVAR_COMPARE_FLAGS [In]
  fun PropVariantCompareEx(propvar1 : PROPVARIANT*, propvar2 : PROPVARIANT*, unit : PROPVAR_COMPARE_UNIT, flags : PROPVAR_COMPARE_FLAGS) : Int32

  # Params # ppropvardest : PROPVARIANT* [In],propvarsrc : PROPVARIANT* [In],flags : PROPVAR_CHANGE_FLAGS [In],vt : UInt16 [In]
  fun PropVariantChangeType(ppropvardest : PROPVARIANT*, propvarsrc : PROPVARIANT*, flags : PROPVAR_CHANGE_FLAGS, vt : UInt16) : HRESULT

  # Params # ppropvar : PROPVARIANT* [In],pvar : VARIANT* [In]
  fun PropVariantToVariant(ppropvar : PROPVARIANT*, pvar : VARIANT*) : HRESULT

  # Params # pvar : VARIANT* [In],ppropvar : PROPVARIANT* [In]
  fun VariantToPropVariant(pvar : VARIANT*, ppropvar : PROPVARIANT*) : HRESULT

  # Params # hinst : HINSTANCE [In],id : UInt32 [In],pvar : VARIANT* [In]
  fun InitVariantFromResource(hinst : HINSTANCE, id : UInt32, pvar : VARIANT*) : HRESULT

  # Params # pv : Void* [In],cb : UInt32 [In],pvar : VARIANT* [In]
  fun InitVariantFromBuffer(pv : Void*, cb : UInt32, pvar : VARIANT*) : HRESULT

  # Params # guid : Guid* [In],pvar : VARIANT* [In]
  fun InitVariantFromGUIDAsString(guid : Guid*, pvar : VARIANT*) : HRESULT

  # Params # pft : FILETIME* [In],pvar : VARIANT* [In]
  fun InitVariantFromFileTime(pft : FILETIME*, pvar : VARIANT*) : HRESULT

  # Params # prgft : FILETIME* [In],celems : UInt32 [In],pvar : VARIANT* [In]
  fun InitVariantFromFileTimeArray(prgft : FILETIME*, celems : UInt32, pvar : VARIANT*) : HRESULT

  # Params # pstrret : STRRET* [In],pidl : ITEMIDLIST* [In],pvar : VARIANT* [In]
  fun InitVariantFromStrRet(pstrret : STRRET*, pidl : ITEMIDLIST*, pvar : VARIANT*) : HRESULT

  # Params # varin : VARIANT* [In],ielem : UInt32 [In],pvar : VARIANT* [In]
  fun InitVariantFromVariantArrayElem(varin : VARIANT*, ielem : UInt32, pvar : VARIANT*) : HRESULT

  # Params # prgf : LibC::BOOL* [In],celems : UInt32 [In],pvar : VARIANT* [In]
  fun InitVariantFromBooleanArray(prgf : LibC::BOOL*, celems : UInt32, pvar : VARIANT*) : HRESULT

  # Params # prgn : Int16* [In],celems : UInt32 [In],pvar : VARIANT* [In]
  fun InitVariantFromInt16Array(prgn : Int16*, celems : UInt32, pvar : VARIANT*) : HRESULT

  # Params # prgn : UInt16* [In],celems : UInt32 [In],pvar : VARIANT* [In]
  fun InitVariantFromUInt16Array(prgn : UInt16*, celems : UInt32, pvar : VARIANT*) : HRESULT

  # Params # prgn : Int32* [In],celems : UInt32 [In],pvar : VARIANT* [In]
  fun InitVariantFromInt32Array(prgn : Int32*, celems : UInt32, pvar : VARIANT*) : HRESULT

  # Params # prgn : UInt32* [In],celems : UInt32 [In],pvar : VARIANT* [In]
  fun InitVariantFromUInt32Array(prgn : UInt32*, celems : UInt32, pvar : VARIANT*) : HRESULT

  # Params # prgn : Int64* [In],celems : UInt32 [In],pvar : VARIANT* [In]
  fun InitVariantFromInt64Array(prgn : Int64*, celems : UInt32, pvar : VARIANT*) : HRESULT

  # Params # prgn : UInt64* [In],celems : UInt32 [In],pvar : VARIANT* [In]
  fun InitVariantFromUInt64Array(prgn : UInt64*, celems : UInt32, pvar : VARIANT*) : HRESULT

  # Params # prgn : Float64* [In],celems : UInt32 [In],pvar : VARIANT* [In]
  fun InitVariantFromDoubleArray(prgn : Float64*, celems : UInt32, pvar : VARIANT*) : HRESULT

  # Params # prgsz : LibC::LPWSTR* [In],celems : UInt32 [In],pvar : VARIANT* [In]
  fun InitVariantFromStringArray(prgsz : LibC::LPWSTR*, celems : UInt32, pvar : VARIANT*) : HRESULT

  # Params # varin : VARIANT* [In],fdefault : LibC::BOOL [In]
  fun VariantToBooleanWithDefault(varin : VARIANT*, fdefault : LibC::BOOL) : LibC::BOOL

  # Params # varin : VARIANT* [In],idefault : Int16 [In]
  fun VariantToInt16WithDefault(varin : VARIANT*, idefault : Int16) : Int16

  # Params # varin : VARIANT* [In],uidefault : UInt16 [In]
  fun VariantToUInt16WithDefault(varin : VARIANT*, uidefault : UInt16) : UInt16

  # Params # varin : VARIANT* [In],ldefault : Int32 [In]
  fun VariantToInt32WithDefault(varin : VARIANT*, ldefault : Int32) : Int32

  # Params # varin : VARIANT* [In],uldefault : UInt32 [In]
  fun VariantToUInt32WithDefault(varin : VARIANT*, uldefault : UInt32) : UInt32

  # Params # varin : VARIANT* [In],lldefault : Int64 [In]
  fun VariantToInt64WithDefault(varin : VARIANT*, lldefault : Int64) : Int64

  # Params # varin : VARIANT* [In],ulldefault : UInt64 [In]
  fun VariantToUInt64WithDefault(varin : VARIANT*, ulldefault : UInt64) : UInt64

  # Params # varin : VARIANT* [In],dbldefault : Float64 [In]
  fun VariantToDoubleWithDefault(varin : VARIANT*, dbldefault : Float64) : Float64

  # Params # varin : VARIANT* [In],pszdefault : LibC::LPWSTR [In]
  fun VariantToStringWithDefault(varin : VARIANT*, pszdefault : LibC::LPWSTR) : LibC::LPWSTR

  # Params # varin : VARIANT* [In],pfret : LibC::BOOL* [In]
  fun VariantToBoolean(varin : VARIANT*, pfret : LibC::BOOL*) : HRESULT

  # Params # varin : VARIANT* [In],piret : Int16* [In]
  fun VariantToInt16(varin : VARIANT*, piret : Int16*) : HRESULT

  # Params # varin : VARIANT* [In],puiret : UInt16* [In]
  fun VariantToUInt16(varin : VARIANT*, puiret : UInt16*) : HRESULT

  # Params # varin : VARIANT* [In],plret : Int32* [In]
  fun VariantToInt32(varin : VARIANT*, plret : Int32*) : HRESULT

  # Params # varin : VARIANT* [In],pulret : UInt32* [In]
  fun VariantToUInt32(varin : VARIANT*, pulret : UInt32*) : HRESULT

  # Params # varin : VARIANT* [In],pllret : Int64* [In]
  fun VariantToInt64(varin : VARIANT*, pllret : Int64*) : HRESULT

  # Params # varin : VARIANT* [In],pullret : UInt64* [In]
  fun VariantToUInt64(varin : VARIANT*, pullret : UInt64*) : HRESULT

  # Params # varin : VARIANT* [In],pdblret : Float64* [In]
  fun VariantToDouble(varin : VARIANT*, pdblret : Float64*) : HRESULT

  # Params # varin : VARIANT* [In],pv : Void* [In],cb : UInt32 [In]
  fun VariantToBuffer(varin : VARIANT*, pv : Void*, cb : UInt32) : HRESULT

  # Params # varin : VARIANT* [In],pguid : Guid* [In]
  fun VariantToGUID(varin : VARIANT*, pguid : Guid*) : HRESULT

  # Params # varin : VARIANT* [In],pszbuf : Char* [In],cchbuf : UInt32 [In]
  fun VariantToString(varin : VARIANT*, pszbuf : Char*, cchbuf : UInt32) : HRESULT

  # Params # varin : VARIANT* [In],ppszbuf : LibC::LPWSTR* [In]
  fun VariantToStringAlloc(varin : VARIANT*, ppszbuf : LibC::LPWSTR*) : HRESULT

  # Params # varin : VARIANT* [In],pwdate : UInt16* [In],pwtime : UInt16* [In]
  fun VariantToDosDateTime(varin : VARIANT*, pwdate : UInt16*, pwtime : UInt16*) : HRESULT

  # Params # varin : VARIANT* [In],pstrret : STRRET* [In]
  fun VariantToStrRet(varin : VARIANT*, pstrret : STRRET*) : HRESULT

  # Params # varin : VARIANT* [In],stfout : PSTIME_FLAGS [In],pftout : FILETIME* [In]
  fun VariantToFileTime(varin : VARIANT*, stfout : PSTIME_FLAGS, pftout : FILETIME*) : HRESULT

  # Params # varin : VARIANT* [In]
  fun VariantGetElementCount(varin : VARIANT*) : UInt32

  # Params # var : VARIANT* [In],prgf : LibC::BOOL* [In],crgn : UInt32 [In],pcelem : UInt32* [In]
  fun VariantToBooleanArray(var : VARIANT*, prgf : LibC::BOOL*, crgn : UInt32, pcelem : UInt32*) : HRESULT

  # Params # var : VARIANT* [In],prgn : Int16* [In],crgn : UInt32 [In],pcelem : UInt32* [In]
  fun VariantToInt16Array(var : VARIANT*, prgn : Int16*, crgn : UInt32, pcelem : UInt32*) : HRESULT

  # Params # var : VARIANT* [In],prgn : UInt16* [In],crgn : UInt32 [In],pcelem : UInt32* [In]
  fun VariantToUInt16Array(var : VARIANT*, prgn : UInt16*, crgn : UInt32, pcelem : UInt32*) : HRESULT

  # Params # var : VARIANT* [In],prgn : Int32* [In],crgn : UInt32 [In],pcelem : UInt32* [In]
  fun VariantToInt32Array(var : VARIANT*, prgn : Int32*, crgn : UInt32, pcelem : UInt32*) : HRESULT

  # Params # var : VARIANT* [In],prgn : UInt32* [In],crgn : UInt32 [In],pcelem : UInt32* [In]
  fun VariantToUInt32Array(var : VARIANT*, prgn : UInt32*, crgn : UInt32, pcelem : UInt32*) : HRESULT

  # Params # var : VARIANT* [In],prgn : Int64* [In],crgn : UInt32 [In],pcelem : UInt32* [In]
  fun VariantToInt64Array(var : VARIANT*, prgn : Int64*, crgn : UInt32, pcelem : UInt32*) : HRESULT

  # Params # var : VARIANT* [In],prgn : UInt64* [In],crgn : UInt32 [In],pcelem : UInt32* [In]
  fun VariantToUInt64Array(var : VARIANT*, prgn : UInt64*, crgn : UInt32, pcelem : UInt32*) : HRESULT

  # Params # var : VARIANT* [In],prgn : Float64* [In],crgn : UInt32 [In],pcelem : UInt32* [In]
  fun VariantToDoubleArray(var : VARIANT*, prgn : Float64*, crgn : UInt32, pcelem : UInt32*) : HRESULT

  # Params # var : VARIANT* [In],prgsz : LibC::LPWSTR* [In],crgsz : UInt32 [In],pcelem : UInt32* [In]
  fun VariantToStringArray(var : VARIANT*, prgsz : LibC::LPWSTR*, crgsz : UInt32, pcelem : UInt32*) : HRESULT

  # Params # var : VARIANT* [In],pprgf : LibC::BOOL** [In],pcelem : UInt32* [In]
  fun VariantToBooleanArrayAlloc(var : VARIANT*, pprgf : LibC::BOOL**, pcelem : UInt32*) : HRESULT

  # Params # var : VARIANT* [In],pprgn : Int16** [In],pcelem : UInt32* [In]
  fun VariantToInt16ArrayAlloc(var : VARIANT*, pprgn : Int16**, pcelem : UInt32*) : HRESULT

  # Params # var : VARIANT* [In],pprgn : UInt16** [In],pcelem : UInt32* [In]
  fun VariantToUInt16ArrayAlloc(var : VARIANT*, pprgn : UInt16**, pcelem : UInt32*) : HRESULT

  # Params # var : VARIANT* [In],pprgn : Int32** [In],pcelem : UInt32* [In]
  fun VariantToInt32ArrayAlloc(var : VARIANT*, pprgn : Int32**, pcelem : UInt32*) : HRESULT

  # Params # var : VARIANT* [In],pprgn : UInt32** [In],pcelem : UInt32* [In]
  fun VariantToUInt32ArrayAlloc(var : VARIANT*, pprgn : UInt32**, pcelem : UInt32*) : HRESULT

  # Params # var : VARIANT* [In],pprgn : Int64** [In],pcelem : UInt32* [In]
  fun VariantToInt64ArrayAlloc(var : VARIANT*, pprgn : Int64**, pcelem : UInt32*) : HRESULT

  # Params # var : VARIANT* [In],pprgn : UInt64** [In],pcelem : UInt32* [In]
  fun VariantToUInt64ArrayAlloc(var : VARIANT*, pprgn : UInt64**, pcelem : UInt32*) : HRESULT

  # Params # var : VARIANT* [In],pprgn : Float64** [In],pcelem : UInt32* [In]
  fun VariantToDoubleArrayAlloc(var : VARIANT*, pprgn : Float64**, pcelem : UInt32*) : HRESULT

  # Params # var : VARIANT* [In],pprgsz : LibC::LPWSTR** [In],pcelem : UInt32* [In]
  fun VariantToStringArrayAlloc(var : VARIANT*, pprgsz : LibC::LPWSTR**, pcelem : UInt32*) : HRESULT

  # Params # var : VARIANT* [In],ielem : UInt32 [In],pfval : LibC::BOOL* [In]
  fun VariantGetBooleanElem(var : VARIANT*, ielem : UInt32, pfval : LibC::BOOL*) : HRESULT

  # Params # var : VARIANT* [In],ielem : UInt32 [In],pnval : Int16* [In]
  fun VariantGetInt16Elem(var : VARIANT*, ielem : UInt32, pnval : Int16*) : HRESULT

  # Params # var : VARIANT* [In],ielem : UInt32 [In],pnval : UInt16* [In]
  fun VariantGetUInt16Elem(var : VARIANT*, ielem : UInt32, pnval : UInt16*) : HRESULT

  # Params # var : VARIANT* [In],ielem : UInt32 [In],pnval : Int32* [In]
  fun VariantGetInt32Elem(var : VARIANT*, ielem : UInt32, pnval : Int32*) : HRESULT

  # Params # var : VARIANT* [In],ielem : UInt32 [In],pnval : UInt32* [In]
  fun VariantGetUInt32Elem(var : VARIANT*, ielem : UInt32, pnval : UInt32*) : HRESULT

  # Params # var : VARIANT* [In],ielem : UInt32 [In],pnval : Int64* [In]
  fun VariantGetInt64Elem(var : VARIANT*, ielem : UInt32, pnval : Int64*) : HRESULT

  # Params # var : VARIANT* [In],ielem : UInt32 [In],pnval : UInt64* [In]
  fun VariantGetUInt64Elem(var : VARIANT*, ielem : UInt32, pnval : UInt64*) : HRESULT

  # Params # var : VARIANT* [In],ielem : UInt32 [In],pnval : Float64* [In]
  fun VariantGetDoubleElem(var : VARIANT*, ielem : UInt32, pnval : Float64*) : HRESULT

  # Params # var : VARIANT* [In],ielem : UInt32 [In],ppszval : LibC::LPWSTR* [In]
  fun VariantGetStringElem(var : VARIANT*, ielem : UInt32, ppszval : LibC::LPWSTR*) : HRESULT

  # Params # pvars : VARIANT* [In],cvars : UInt32 [In]
  fun ClearVariantArray(pvars : VARIANT*, cvars : UInt32)

  # Params # var1 : VARIANT* [In],var2 : VARIANT* [In]
  fun VariantCompare(var1 : VARIANT*, var2 : VARIANT*) : Int32

  # Params # pidl : ITEMIDLIST* [In],flags : GETPROPERTYSTOREFLAGS [In],riid : Guid* [In],ppv : Void** [In]
  fun SHGetPropertyStoreFromIDList(pidl : ITEMIDLIST*, flags : GETPROPERTYSTOREFLAGS, riid : Guid*, ppv : Void**) : HRESULT

  # Params # pszpath : LibC::LPWSTR [In],pbc : IBindCtx [In],flags : GETPROPERTYSTOREFLAGS [In],riid : Guid* [In],ppv : Void** [In]
  fun SHGetPropertyStoreFromParsingName(pszpath : LibC::LPWSTR, pbc : IBindCtx, flags : GETPROPERTYSTOREFLAGS, riid : Guid*, ppv : Void**) : HRESULT

  # Params # pszext : LibC::LPWSTR [In],ppropstore : IPropertyStore [In]
  fun SHAddDefaultPropertiesByExt(pszext : LibC::LPWSTR, ppropstore : IPropertyStore) : HRESULT

  # Params # pszapp : LibC::LPWSTR [In],pszpif : LibC::LPWSTR [In],hinf : UInt32 [In],flopt : UInt32 [In]
  fun PifMgr_OpenProperties(pszapp : LibC::LPWSTR, pszpif : LibC::LPWSTR, hinf : UInt32, flopt : UInt32) : LibC::HANDLE

  # Params # hprops : LibC::HANDLE [In],pszgroup : PSTR [In],lpprops : Void* [In],cbprops : Int32 [In],flopt : UInt32 [In]
  fun PifMgr_GetProperties(hprops : LibC::HANDLE, pszgroup : PSTR, lpprops : Void*, cbprops : Int32, flopt : UInt32) : Int32

  # Params # hprops : LibC::HANDLE [In],pszgroup : PSTR [In],lpprops : Void* [In],cbprops : Int32 [In],flopt : UInt32 [In]
  fun PifMgr_SetProperties(hprops : LibC::HANDLE, pszgroup : PSTR, lpprops : Void*, cbprops : Int32, flopt : UInt32) : Int32

  # Params # hprops : LibC::HANDLE [In],flopt : UInt32 [In]
  fun PifMgr_CloseProperties(hprops : LibC::HANDLE, flopt : UInt32) : LibC::HANDLE

  # Params # psstg : IPropertySetStorage [In],fmtid : Guid* [In],pclsid : Guid* [In],grfflags : UInt32 [In],grfmode : UInt32 [In],dwdisposition : UInt32 [In],ppstg : IPropertyStorage* [In],pucodepage : UInt32* [In]
  fun SHPropStgCreate(psstg : IPropertySetStorage, fmtid : Guid*, pclsid : Guid*, grfflags : UInt32, grfmode : UInt32, dwdisposition : UInt32, ppstg : IPropertyStorage*, pucodepage : UInt32*) : HRESULT

  # Params # pps : IPropertyStorage [In],ucodepage : UInt32 [In],cpspec : UInt32 [In],rgpspec : PROPSPEC* [In],rgvar : PROPVARIANT* [In]
  fun SHPropStgReadMultiple(pps : IPropertyStorage, ucodepage : UInt32, cpspec : UInt32, rgpspec : PROPSPEC*, rgvar : PROPVARIANT*) : HRESULT

  # Params # pps : IPropertyStorage [In],pucodepage : UInt32* [In],cpspec : UInt32 [In],rgpspec : PROPSPEC* [In],rgvar : PROPVARIANT* [In],propidnamefirst : UInt32 [In]
  fun SHPropStgWriteMultiple(pps : IPropertyStorage, pucodepage : UInt32*, cpspec : UInt32, rgpspec : PROPSPEC*, rgvar : PROPVARIANT*, propidnamefirst : UInt32) : HRESULT

  # Params # hwnd : LibC::HANDLE [In],riid : Guid* [In],ppv : Void** [In]
  fun SHGetPropertyStoreForWindow(hwnd : LibC::HANDLE, riid : Guid*, ppv : Void**) : HRESULT
end
struct LibWin32::PROPERTYKEY
  def initialize(@fmtid : Guid, @pid : UInt32)
  end
end
