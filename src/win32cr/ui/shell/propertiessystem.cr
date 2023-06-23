require "../../system/com.cr"
require "../../foundation.cr"
require "../../system/com/structuredstorage.cr"
require "../../system/search/common.cr"
require "../../ui/shell/common.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:propsys.dll")]
@[Link(ldflags: "/DELAYLOAD:shell32.dll")]
{% else %}
@[Link("propsys")]
@[Link("shell32")]
{% end %}
lib LibWin32
  PKEY_PIDSTR_MAX = 10_u32
  CLSID_InMemoryPropertyStore = LibC::GUID.new(0x9a02e012_u32, 0x6303_u16, 0x4e1e_u16, StaticArray[0xb9_u8, 0xa1_u8, 0x63_u8, 0xf_u8, 0x80_u8, 0x25_u8, 0x92_u8, 0xc5_u8])
  CLSID_InMemoryPropertyStoreMarshalByValue = LibC::GUID.new(0xd4ca0e2d_u32, 0x6da7_u16, 0x4b75_u16, StaticArray[0xa9_u8, 0x7c_u8, 0x5f_u8, 0x30_u8, 0x6f_u8, 0xe_u8, 0xae_u8, 0xdc_u8])
  CLSID_PropertySystem = LibC::GUID.new(0xb8967f85_u32, 0x58ae_u16, 0x4f46_u16, StaticArray[0x9f_u8, 0xb2_u8, 0x5d_u8, 0x79_u8, 0x4_u8, 0x79_u8, 0x8f_u8, 0x4b_u8])

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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initialize : UInt64
  end

  IInitializeWithFile_GUID = "b7d14566-0509-4cce-a71f-0a554233bd9b"
  IID_IInitializeWithFile = LibC::GUID.new(0xb7d14566_u32, 0x509_u16, 0x4cce_u16, StaticArray[0xa7_u8, 0x1f_u8, 0xa_u8, 0x55_u8, 0x42_u8, 0x33_u8, 0xbd_u8, 0x9b_u8])
  struct IInitializeWithFile
    lpVtbl : IInitializeWithFileVTbl*
  end

  struct IInitializeWithStreamVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initialize : UInt64
  end

  IInitializeWithStream_GUID = "b824b49d-22ac-4161-ac8a-9916e8fa3f7f"
  IID_IInitializeWithStream = LibC::GUID.new(0xb824b49d_u32, 0x22ac_u16, 0x4161_u16, StaticArray[0xac_u8, 0x8a_u8, 0x99_u8, 0x16_u8, 0xe8_u8, 0xfa_u8, 0x3f_u8, 0x7f_u8])
  struct IInitializeWithStream
    lpVtbl : IInitializeWithStreamVTbl*
  end

  struct IPropertyStoreVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_count : UInt64
    get_at : UInt64
    get_value : UInt64
    set_value : UInt64
    commit : UInt64
  end

  IPropertyStore_GUID = "886d8eeb-8cf2-4446-8d02-cdba1dbdcf99"
  IID_IPropertyStore = LibC::GUID.new(0x886d8eeb_u32, 0x8cf2_u16, 0x4446_u16, StaticArray[0x8d_u8, 0x2_u8, 0xcd_u8, 0xba_u8, 0x1d_u8, 0xbd_u8, 0xcf_u8, 0x99_u8])
  struct IPropertyStore
    lpVtbl : IPropertyStoreVTbl*
  end

  struct INamedPropertyStoreVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_named_value : UInt64
    set_named_value : UInt64
    get_name_count : UInt64
    get_name_at : UInt64
  end

  INamedPropertyStore_GUID = "71604b0f-97b0-4764-8577-2f13e98a1422"
  IID_INamedPropertyStore = LibC::GUID.new(0x71604b0f_u32, 0x97b0_u16, 0x4764_u16, StaticArray[0x85_u8, 0x77_u8, 0x2f_u8, 0x13_u8, 0xe9_u8, 0x8a_u8, 0x14_u8, 0x22_u8])
  struct INamedPropertyStore
    lpVtbl : INamedPropertyStoreVTbl*
  end

  struct IObjectWithPropertyKeyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_property_key : UInt64
    get_property_key : UInt64
  end

  IObjectWithPropertyKey_GUID = "fc0ca0a7-c316-4fd2-9031-3e628e6d4f23"
  IID_IObjectWithPropertyKey = LibC::GUID.new(0xfc0ca0a7_u32, 0xc316_u16, 0x4fd2_u16, StaticArray[0x90_u8, 0x31_u8, 0x3e_u8, 0x62_u8, 0x8e_u8, 0x6d_u8, 0x4f_u8, 0x23_u8])
  struct IObjectWithPropertyKey
    lpVtbl : IObjectWithPropertyKeyVTbl*
  end

  struct IPropertyChangeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_property_key : UInt64
    get_property_key : UInt64
    apply_to_prop_variant : UInt64
  end

  IPropertyChange_GUID = "f917bc8a-1bba-4478-a245-1bde03eb9431"
  IID_IPropertyChange = LibC::GUID.new(0xf917bc8a_u32, 0x1bba_u16, 0x4478_u16, StaticArray[0xa2_u8, 0x45_u8, 0x1b_u8, 0xde_u8, 0x3_u8, 0xeb_u8, 0x94_u8, 0x31_u8])
  struct IPropertyChange
    lpVtbl : IPropertyChangeVTbl*
  end

  struct IPropertyChangeArrayVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_count : UInt64
    get_at : UInt64
    insert_at : UInt64
    append : UInt64
    append_or_replace : UInt64
    remove_at : UInt64
    is_key_in_array : UInt64
  end

  IPropertyChangeArray_GUID = "380f5cad-1b5e-42f2-805d-637fd392d31e"
  IID_IPropertyChangeArray = LibC::GUID.new(0x380f5cad_u32, 0x1b5e_u16, 0x42f2_u16, StaticArray[0x80_u8, 0x5d_u8, 0x63_u8, 0x7f_u8, 0xd3_u8, 0x92_u8, 0xd3_u8, 0x1e_u8])
  struct IPropertyChangeArray
    lpVtbl : IPropertyChangeArrayVTbl*
  end

  struct IPropertyStoreCapabilitiesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    is_property_writable : UInt64
  end

  IPropertyStoreCapabilities_GUID = "c8e2d566-186e-4d49-bf41-6909ead56acc"
  IID_IPropertyStoreCapabilities = LibC::GUID.new(0xc8e2d566_u32, 0x186e_u16, 0x4d49_u16, StaticArray[0xbf_u8, 0x41_u8, 0x69_u8, 0x9_u8, 0xea_u8, 0xd5_u8, 0x6a_u8, 0xcc_u8])
  struct IPropertyStoreCapabilities
    lpVtbl : IPropertyStoreCapabilitiesVTbl*
  end

  struct IPropertyStoreCacheVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_count : UInt64
    get_at : UInt64
    get_value : UInt64
    set_value : UInt64
    commit : UInt64
    get_state : UInt64
    get_value_and_state : UInt64
    set_state : UInt64
    set_value_and_state : UInt64
  end

  IPropertyStoreCache_GUID = "3017056d-9a91-4e90-937d-746c72abbf4f"
  IID_IPropertyStoreCache = LibC::GUID.new(0x3017056d_u32, 0x9a91_u16, 0x4e90_u16, StaticArray[0x93_u8, 0x7d_u8, 0x74_u8, 0x6c_u8, 0x72_u8, 0xab_u8, 0xbf_u8, 0x4f_u8])
  struct IPropertyStoreCache
    lpVtbl : IPropertyStoreCacheVTbl*
  end

  struct IPropertyEnumTypeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_enum_type : UInt64
    get_value : UInt64
    get_range_min_value : UInt64
    get_range_set_value : UInt64
    get_display_text : UInt64
  end

  IPropertyEnumType_GUID = "11e1fbf9-2d56-4a6b-8db3-7cd193a471f2"
  IID_IPropertyEnumType = LibC::GUID.new(0x11e1fbf9_u32, 0x2d56_u16, 0x4a6b_u16, StaticArray[0x8d_u8, 0xb3_u8, 0x7c_u8, 0xd1_u8, 0x93_u8, 0xa4_u8, 0x71_u8, 0xf2_u8])
  struct IPropertyEnumType
    lpVtbl : IPropertyEnumTypeVTbl*
  end

  struct IPropertyEnumType2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_enum_type : UInt64
    get_value : UInt64
    get_range_min_value : UInt64
    get_range_set_value : UInt64
    get_display_text : UInt64
    get_image_reference : UInt64
  end

  IPropertyEnumType2_GUID = "9b6e051c-5ddd-4321-9070-fe2acb55e794"
  IID_IPropertyEnumType2 = LibC::GUID.new(0x9b6e051c_u32, 0x5ddd_u16, 0x4321_u16, StaticArray[0x90_u8, 0x70_u8, 0xfe_u8, 0x2a_u8, 0xcb_u8, 0x55_u8, 0xe7_u8, 0x94_u8])
  struct IPropertyEnumType2
    lpVtbl : IPropertyEnumType2VTbl*
  end

  struct IPropertyEnumTypeListVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_count : UInt64
    get_at : UInt64
    get_condition_at : UInt64
    find_matching_index : UInt64
  end

  IPropertyEnumTypeList_GUID = "a99400f4-3d84-4557-94ba-1242fb2cc9a6"
  IID_IPropertyEnumTypeList = LibC::GUID.new(0xa99400f4_u32, 0x3d84_u16, 0x4557_u16, StaticArray[0x94_u8, 0xba_u8, 0x12_u8, 0x42_u8, 0xfb_u8, 0x2c_u8, 0xc9_u8, 0xa6_u8])
  struct IPropertyEnumTypeList
    lpVtbl : IPropertyEnumTypeListVTbl*
  end

  struct IPropertyDescriptionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_property_key : UInt64
    get_canonical_name : UInt64
    get_property_type : UInt64
    get_display_name : UInt64
    get_edit_invitation : UInt64
    get_type_flags : UInt64
    get_view_flags : UInt64
    get_default_column_width : UInt64
    get_display_type : UInt64
    get_column_state : UInt64
    get_grouping_range : UInt64
    get_relative_description_type : UInt64
    get_relative_description : UInt64
    get_sort_description : UInt64
    get_sort_description_label : UInt64
    get_aggregation_type : UInt64
    get_condition_type : UInt64
    get_enum_type_list : UInt64
    coerce_to_canonical_value : UInt64
    format_for_display : UInt64
    is_value_canonical : UInt64
  end

  IPropertyDescription_GUID = "6f79d558-3e96-4549-a1d1-7d75d2288814"
  IID_IPropertyDescription = LibC::GUID.new(0x6f79d558_u32, 0x3e96_u16, 0x4549_u16, StaticArray[0xa1_u8, 0xd1_u8, 0x7d_u8, 0x75_u8, 0xd2_u8, 0x28_u8, 0x88_u8, 0x14_u8])
  struct IPropertyDescription
    lpVtbl : IPropertyDescriptionVTbl*
  end

  struct IPropertyDescription2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_property_key : UInt64
    get_canonical_name : UInt64
    get_property_type : UInt64
    get_display_name : UInt64
    get_edit_invitation : UInt64
    get_type_flags : UInt64
    get_view_flags : UInt64
    get_default_column_width : UInt64
    get_display_type : UInt64
    get_column_state : UInt64
    get_grouping_range : UInt64
    get_relative_description_type : UInt64
    get_relative_description : UInt64
    get_sort_description : UInt64
    get_sort_description_label : UInt64
    get_aggregation_type : UInt64
    get_condition_type : UInt64
    get_enum_type_list : UInt64
    coerce_to_canonical_value : UInt64
    format_for_display : UInt64
    is_value_canonical : UInt64
    get_image_reference_for_value : UInt64
  end

  IPropertyDescription2_GUID = "57d2eded-5062-400e-b107-5dae79fe57a6"
  IID_IPropertyDescription2 = LibC::GUID.new(0x57d2eded_u32, 0x5062_u16, 0x400e_u16, StaticArray[0xb1_u8, 0x7_u8, 0x5d_u8, 0xae_u8, 0x79_u8, 0xfe_u8, 0x57_u8, 0xa6_u8])
  struct IPropertyDescription2
    lpVtbl : IPropertyDescription2VTbl*
  end

  struct IPropertyDescriptionAliasInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_property_key : UInt64
    get_canonical_name : UInt64
    get_property_type : UInt64
    get_display_name : UInt64
    get_edit_invitation : UInt64
    get_type_flags : UInt64
    get_view_flags : UInt64
    get_default_column_width : UInt64
    get_display_type : UInt64
    get_column_state : UInt64
    get_grouping_range : UInt64
    get_relative_description_type : UInt64
    get_relative_description : UInt64
    get_sort_description : UInt64
    get_sort_description_label : UInt64
    get_aggregation_type : UInt64
    get_condition_type : UInt64
    get_enum_type_list : UInt64
    coerce_to_canonical_value : UInt64
    format_for_display : UInt64
    is_value_canonical : UInt64
    get_sort_by_alias : UInt64
    get_additional_sort_by_aliases : UInt64
  end

  IPropertyDescriptionAliasInfo_GUID = "f67104fc-2af9-46fd-b32d-243c1404f3d1"
  IID_IPropertyDescriptionAliasInfo = LibC::GUID.new(0xf67104fc_u32, 0x2af9_u16, 0x46fd_u16, StaticArray[0xb3_u8, 0x2d_u8, 0x24_u8, 0x3c_u8, 0x14_u8, 0x4_u8, 0xf3_u8, 0xd1_u8])
  struct IPropertyDescriptionAliasInfo
    lpVtbl : IPropertyDescriptionAliasInfoVTbl*
  end

  struct IPropertyDescriptionSearchInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_property_key : UInt64
    get_canonical_name : UInt64
    get_property_type : UInt64
    get_display_name : UInt64
    get_edit_invitation : UInt64
    get_type_flags : UInt64
    get_view_flags : UInt64
    get_default_column_width : UInt64
    get_display_type : UInt64
    get_column_state : UInt64
    get_grouping_range : UInt64
    get_relative_description_type : UInt64
    get_relative_description : UInt64
    get_sort_description : UInt64
    get_sort_description_label : UInt64
    get_aggregation_type : UInt64
    get_condition_type : UInt64
    get_enum_type_list : UInt64
    coerce_to_canonical_value : UInt64
    format_for_display : UInt64
    is_value_canonical : UInt64
    get_search_info_flags : UInt64
    get_column_index_type : UInt64
    get_projection_string : UInt64
    get_max_size : UInt64
  end

  IPropertyDescriptionSearchInfo_GUID = "078f91bd-29a2-440f-924e-46a291524520"
  IID_IPropertyDescriptionSearchInfo = LibC::GUID.new(0x78f91bd_u32, 0x29a2_u16, 0x440f_u16, StaticArray[0x92_u8, 0x4e_u8, 0x46_u8, 0xa2_u8, 0x91_u8, 0x52_u8, 0x45_u8, 0x20_u8])
  struct IPropertyDescriptionSearchInfo
    lpVtbl : IPropertyDescriptionSearchInfoVTbl*
  end

  struct IPropertyDescriptionRelatedPropertyInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_property_key : UInt64
    get_canonical_name : UInt64
    get_property_type : UInt64
    get_display_name : UInt64
    get_edit_invitation : UInt64
    get_type_flags : UInt64
    get_view_flags : UInt64
    get_default_column_width : UInt64
    get_display_type : UInt64
    get_column_state : UInt64
    get_grouping_range : UInt64
    get_relative_description_type : UInt64
    get_relative_description : UInt64
    get_sort_description : UInt64
    get_sort_description_label : UInt64
    get_aggregation_type : UInt64
    get_condition_type : UInt64
    get_enum_type_list : UInt64
    coerce_to_canonical_value : UInt64
    format_for_display : UInt64
    is_value_canonical : UInt64
    get_related_property : UInt64
  end

  IPropertyDescriptionRelatedPropertyInfo_GUID = "507393f4-2a3d-4a60-b59e-d9c75716c2dd"
  IID_IPropertyDescriptionRelatedPropertyInfo = LibC::GUID.new(0x507393f4_u32, 0x2a3d_u16, 0x4a60_u16, StaticArray[0xb5_u8, 0x9e_u8, 0xd9_u8, 0xc7_u8, 0x57_u8, 0x16_u8, 0xc2_u8, 0xdd_u8])
  struct IPropertyDescriptionRelatedPropertyInfo
    lpVtbl : IPropertyDescriptionRelatedPropertyInfoVTbl*
  end

  struct IPropertySystemVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_property_description : UInt64
    get_property_description_by_name : UInt64
    get_property_description_list_from_string : UInt64
    enumerate_property_descriptions : UInt64
    format_for_display : UInt64
    format_for_display_alloc : UInt64
    register_property_schema : UInt64
    unregister_property_schema : UInt64
    refresh_property_schema : UInt64
  end

  IPropertySystem_GUID = "ca724e8a-c3e6-442b-88a4-6fb0db8035a3"
  IID_IPropertySystem = LibC::GUID.new(0xca724e8a_u32, 0xc3e6_u16, 0x442b_u16, StaticArray[0x88_u8, 0xa4_u8, 0x6f_u8, 0xb0_u8, 0xdb_u8, 0x80_u8, 0x35_u8, 0xa3_u8])
  struct IPropertySystem
    lpVtbl : IPropertySystemVTbl*
  end

  struct IPropertyDescriptionListVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_count : UInt64
    get_at : UInt64
  end

  IPropertyDescriptionList_GUID = "1f9fc1d0-c39b-4b26-817f-011967d3440e"
  IID_IPropertyDescriptionList = LibC::GUID.new(0x1f9fc1d0_u32, 0xc39b_u16, 0x4b26_u16, StaticArray[0x81_u8, 0x7f_u8, 0x1_u8, 0x19_u8, 0x67_u8, 0xd3_u8, 0x44_u8, 0xe_u8])
  struct IPropertyDescriptionList
    lpVtbl : IPropertyDescriptionListVTbl*
  end

  struct IPropertyStoreFactoryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_property_store : UInt64
    get_property_store_for_keys : UInt64
  end

  IPropertyStoreFactory_GUID = "bc110b6d-57e8-4148-a9c6-91015ab2f3a5"
  IID_IPropertyStoreFactory = LibC::GUID.new(0xbc110b6d_u32, 0x57e8_u16, 0x4148_u16, StaticArray[0xa9_u8, 0xc6_u8, 0x91_u8, 0x1_u8, 0x5a_u8, 0xb2_u8, 0xf3_u8, 0xa5_u8])
  struct IPropertyStoreFactory
    lpVtbl : IPropertyStoreFactoryVTbl*
  end

  struct IDelayedPropertyStoreFactoryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_property_store : UInt64
    get_property_store_for_keys : UInt64
    get_delayed_property_store : UInt64
  end

  IDelayedPropertyStoreFactory_GUID = "40d4577f-e237-4bdb-bd69-58f089431b6a"
  IID_IDelayedPropertyStoreFactory = LibC::GUID.new(0x40d4577f_u32, 0xe237_u16, 0x4bdb_u16, StaticArray[0xbd_u8, 0x69_u8, 0x58_u8, 0xf0_u8, 0x89_u8, 0x43_u8, 0x1b_u8, 0x6a_u8])
  struct IDelayedPropertyStoreFactory
    lpVtbl : IDelayedPropertyStoreFactoryVTbl*
  end

  struct IPersistSerializedPropStorageVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_flags : UInt64
    set_property_storage : UInt64
    get_property_storage : UInt64
  end

  IPersistSerializedPropStorage_GUID = "e318ad57-0aa0-450f-aca5-6fab7103d917"
  IID_IPersistSerializedPropStorage = LibC::GUID.new(0xe318ad57_u32, 0xaa0_u16, 0x450f_u16, StaticArray[0xac_u8, 0xa5_u8, 0x6f_u8, 0xab_u8, 0x71_u8, 0x3_u8, 0xd9_u8, 0x17_u8])
  struct IPersistSerializedPropStorage
    lpVtbl : IPersistSerializedPropStorageVTbl*
  end

  struct IPersistSerializedPropStorage2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_flags : UInt64
    set_property_storage : UInt64
    get_property_storage : UInt64
    get_property_storage_size : UInt64
    get_property_storage_buffer : UInt64
  end

  IPersistSerializedPropStorage2_GUID = "77effa68-4f98-4366-ba72-573b3d880571"
  IID_IPersistSerializedPropStorage2 = LibC::GUID.new(0x77effa68_u32, 0x4f98_u16, 0x4366_u16, StaticArray[0xba_u8, 0x72_u8, 0x57_u8, 0x3b_u8, 0x3d_u8, 0x88_u8, 0x5_u8, 0x71_u8])
  struct IPersistSerializedPropStorage2
    lpVtbl : IPersistSerializedPropStorage2VTbl*
  end

  struct IPropertySystemChangeNotifyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    schema_refreshed : UInt64
  end

  IPropertySystemChangeNotify_GUID = "fa955fd9-38be-4879-a6ce-824cf52d609f"
  IID_IPropertySystemChangeNotify = LibC::GUID.new(0xfa955fd9_u32, 0x38be_u16, 0x4879_u16, StaticArray[0xa6_u8, 0xce_u8, 0x82_u8, 0x4c_u8, 0xf5_u8, 0x2d_u8, 0x60_u8, 0x9f_u8])
  struct IPropertySystemChangeNotify
    lpVtbl : IPropertySystemChangeNotifyVTbl*
  end

  struct ICreateObjectVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_object : UInt64
  end

  ICreateObject_GUID = "75121952-e0d0-43e5-9380-1d80483acf72"
  IID_ICreateObject = LibC::GUID.new(0x75121952_u32, 0xe0d0_u16, 0x43e5_u16, StaticArray[0x93_u8, 0x80_u8, 0x1d_u8, 0x80_u8, 0x48_u8, 0x3a_u8, 0xcf_u8, 0x72_u8])
  struct ICreateObject
    lpVtbl : ICreateObjectVTbl*
  end

  struct IPropertyUIVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    parse_property_name : UInt64
    get_cannonical_name : UInt64
    get_display_name : UInt64
    get_property_description : UInt64
    get_default_width : UInt64
    get_flags : UInt64
    format_for_display : UInt64
    get_help_info : UInt64
  end

  IPropertyUI_GUID = "757a7d9f-919a-4118-99d7-dbb208c8cc66"
  IID_IPropertyUI = LibC::GUID.new(0x757a7d9f_u32, 0x919a_u16, 0x4118_u16, StaticArray[0x99_u8, 0xd7_u8, 0xdb_u8, 0xb2_u8, 0x8_u8, 0xc8_u8, 0xcc_u8, 0x66_u8])
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

  # Params # propbag : IPropertyBag [In],propname : LibC::LPWSTR [In],value : UInt8** [In]
  fun PSPropertyBag_ReadBSTR(propbag : IPropertyBag, propname : LibC::LPWSTR, value : UInt8**) : HRESULT

  # Params # propbag : IPropertyBag [In],propname : LibC::LPWSTR [In],value : LibC::LPWSTR [In]
  fun PSPropertyBag_WriteStr(propbag : IPropertyBag, propname : LibC::LPWSTR, value : LibC::LPWSTR) : HRESULT

  # Params # propbag : IPropertyBag [In],propname : LibC::LPWSTR [In],value : UInt8* [In]
  fun PSPropertyBag_WriteBSTR(propbag : IPropertyBag, propname : LibC::LPWSTR, value : UInt8*) : HRESULT

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

  # Params # propvar : PROPVARIANT* [In],pbstrout : UInt8** [In]
  fun PropVariantToBSTR(propvar : PROPVARIANT*, pbstrout : UInt8**) : HRESULT

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
  fun ClearPropVariantArray(rgpropvar : PROPVARIANT*, cvars : UInt32) : Void

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
  fun ClearVariantArray(pvars : VARIANT*, cvars : UInt32) : Void

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
struct LibWin32::IInitializeWithFile
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initialize(pszfilepath : LibC::LPWSTR, grfmode : UInt32) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(LibC::LPWSTR, UInt32, HRESULT)).call(pszfilepath, grfmode)
  end
end
struct LibWin32::IInitializeWithStream
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initialize(pstream : IStream, grfmode : UInt32) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(IStream, UInt32, HRESULT)).call(pstream, grfmode)
  end
end
struct LibWin32::IPropertyStore
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_count(cprops : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(cprops)
  end
  def get_at(iprop : UInt32, pkey : PROPERTYKEY*) : HRESULT
    @lpVtbl.value.get_at.unsafe_as(Proc(UInt32, PROPERTYKEY*, HRESULT)).call(iprop, pkey)
  end
  def get_value(key : PROPERTYKEY*, pv : PROPVARIANT*) : HRESULT
    @lpVtbl.value.get_value.unsafe_as(Proc(PROPERTYKEY*, PROPVARIANT*, HRESULT)).call(key, pv)
  end
  def set_value(key : PROPERTYKEY*, propvar : PROPVARIANT*) : HRESULT
    @lpVtbl.value.set_value.unsafe_as(Proc(PROPERTYKEY*, PROPVARIANT*, HRESULT)).call(key, propvar)
  end
  def commit : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::INamedPropertyStore
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_named_value(pszname : LibC::LPWSTR, ppropvar : PROPVARIANT*) : HRESULT
    @lpVtbl.value.get_named_value.unsafe_as(Proc(LibC::LPWSTR, PROPVARIANT*, HRESULT)).call(pszname, ppropvar)
  end
  def set_named_value(pszname : LibC::LPWSTR, propvar : PROPVARIANT*) : HRESULT
    @lpVtbl.value.set_named_value.unsafe_as(Proc(LibC::LPWSTR, PROPVARIANT*, HRESULT)).call(pszname, propvar)
  end
  def get_name_count(pdwcount : UInt32*) : HRESULT
    @lpVtbl.value.get_name_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwcount)
  end
  def get_name_at(iprop : UInt32, pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_name_at.unsafe_as(Proc(UInt32, UInt8**, HRESULT)).call(iprop, pbstrname)
  end
end
struct LibWin32::IObjectWithPropertyKey
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_property_key(key : PROPERTYKEY*) : HRESULT
    @lpVtbl.value.set_property_key.unsafe_as(Proc(PROPERTYKEY*, HRESULT)).call(key)
  end
  def get_property_key(pkey : PROPERTYKEY*) : HRESULT
    @lpVtbl.value.get_property_key.unsafe_as(Proc(PROPERTYKEY*, HRESULT)).call(pkey)
  end
end
struct LibWin32::IPropertyChange
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_property_key(key : PROPERTYKEY*) : HRESULT
    @lpVtbl.value.set_property_key.unsafe_as(Proc(PROPERTYKEY*, HRESULT)).call(key)
  end
  def get_property_key(pkey : PROPERTYKEY*) : HRESULT
    @lpVtbl.value.get_property_key.unsafe_as(Proc(PROPERTYKEY*, HRESULT)).call(pkey)
  end
  def apply_to_prop_variant(propvarin : PROPVARIANT*, ppropvarout : PROPVARIANT*) : HRESULT
    @lpVtbl.value.apply_to_prop_variant.unsafe_as(Proc(PROPVARIANT*, PROPVARIANT*, HRESULT)).call(propvarin, ppropvarout)
  end
end
struct LibWin32::IPropertyChangeArray
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_count(pcoperations : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcoperations)
  end
  def get_at(iindex : UInt32, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_at.unsafe_as(Proc(UInt32, Guid*, Void**, HRESULT)).call(iindex, riid, ppv)
  end
  def insert_at(iindex : UInt32, ppropchange : IPropertyChange) : HRESULT
    @lpVtbl.value.insert_at.unsafe_as(Proc(UInt32, IPropertyChange, HRESULT)).call(iindex, ppropchange)
  end
  def append(ppropchange : IPropertyChange) : HRESULT
    @lpVtbl.value.append.unsafe_as(Proc(IPropertyChange, HRESULT)).call(ppropchange)
  end
  def append_or_replace(ppropchange : IPropertyChange) : HRESULT
    @lpVtbl.value.append_or_replace.unsafe_as(Proc(IPropertyChange, HRESULT)).call(ppropchange)
  end
  def remove_at(iindex : UInt32) : HRESULT
    @lpVtbl.value.remove_at.unsafe_as(Proc(UInt32, HRESULT)).call(iindex)
  end
  def is_key_in_array(key : PROPERTYKEY*) : HRESULT
    @lpVtbl.value.is_key_in_array.unsafe_as(Proc(PROPERTYKEY*, HRESULT)).call(key)
  end
end
struct LibWin32::IPropertyStoreCapabilities
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def is_property_writable(key : PROPERTYKEY*) : HRESULT
    @lpVtbl.value.is_property_writable.unsafe_as(Proc(PROPERTYKEY*, HRESULT)).call(key)
  end
end
struct LibWin32::IPropertyStoreCache
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_count(cprops : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(cprops)
  end
  def get_at(iprop : UInt32, pkey : PROPERTYKEY*) : HRESULT
    @lpVtbl.value.get_at.unsafe_as(Proc(UInt32, PROPERTYKEY*, HRESULT)).call(iprop, pkey)
  end
  def get_value(key : PROPERTYKEY*, pv : PROPVARIANT*) : HRESULT
    @lpVtbl.value.get_value.unsafe_as(Proc(PROPERTYKEY*, PROPVARIANT*, HRESULT)).call(key, pv)
  end
  def set_value(key : PROPERTYKEY*, propvar : PROPVARIANT*) : HRESULT
    @lpVtbl.value.set_value.unsafe_as(Proc(PROPERTYKEY*, PROPVARIANT*, HRESULT)).call(key, propvar)
  end
  def commit : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(HRESULT)).call
  end
  def get_state(key : PROPERTYKEY*, pstate : PSC_STATE*) : HRESULT
    @lpVtbl.value.get_state.unsafe_as(Proc(PROPERTYKEY*, PSC_STATE*, HRESULT)).call(key, pstate)
  end
  def get_value_and_state(key : PROPERTYKEY*, ppropvar : PROPVARIANT*, pstate : PSC_STATE*) : HRESULT
    @lpVtbl.value.get_value_and_state.unsafe_as(Proc(PROPERTYKEY*, PROPVARIANT*, PSC_STATE*, HRESULT)).call(key, ppropvar, pstate)
  end
  def set_state(key : PROPERTYKEY*, state : PSC_STATE) : HRESULT
    @lpVtbl.value.set_state.unsafe_as(Proc(PROPERTYKEY*, PSC_STATE, HRESULT)).call(key, state)
  end
  def set_value_and_state(key : PROPERTYKEY*, ppropvar : PROPVARIANT*, state : PSC_STATE) : HRESULT
    @lpVtbl.value.set_value_and_state.unsafe_as(Proc(PROPERTYKEY*, PROPVARIANT*, PSC_STATE, HRESULT)).call(key, ppropvar, state)
  end
end
struct LibWin32::IPropertyEnumType
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_enum_type(penumtype : PROPENUMTYPE*) : HRESULT
    @lpVtbl.value.get_enum_type.unsafe_as(Proc(PROPENUMTYPE*, HRESULT)).call(penumtype)
  end
  def get_value(ppropvar : PROPVARIANT*) : HRESULT
    @lpVtbl.value.get_value.unsafe_as(Proc(PROPVARIANT*, HRESULT)).call(ppropvar)
  end
  def get_range_min_value(ppropvarmin : PROPVARIANT*) : HRESULT
    @lpVtbl.value.get_range_min_value.unsafe_as(Proc(PROPVARIANT*, HRESULT)).call(ppropvarmin)
  end
  def get_range_set_value(ppropvarset : PROPVARIANT*) : HRESULT
    @lpVtbl.value.get_range_set_value.unsafe_as(Proc(PROPVARIANT*, HRESULT)).call(ppropvarset)
  end
  def get_display_text(ppszdisplay : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_display_text.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszdisplay)
  end
end
struct LibWin32::IPropertyEnumType2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_enum_type(penumtype : PROPENUMTYPE*) : HRESULT
    @lpVtbl.value.get_enum_type.unsafe_as(Proc(PROPENUMTYPE*, HRESULT)).call(penumtype)
  end
  def get_value(ppropvar : PROPVARIANT*) : HRESULT
    @lpVtbl.value.get_value.unsafe_as(Proc(PROPVARIANT*, HRESULT)).call(ppropvar)
  end
  def get_range_min_value(ppropvarmin : PROPVARIANT*) : HRESULT
    @lpVtbl.value.get_range_min_value.unsafe_as(Proc(PROPVARIANT*, HRESULT)).call(ppropvarmin)
  end
  def get_range_set_value(ppropvarset : PROPVARIANT*) : HRESULT
    @lpVtbl.value.get_range_set_value.unsafe_as(Proc(PROPVARIANT*, HRESULT)).call(ppropvarset)
  end
  def get_display_text(ppszdisplay : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_display_text.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszdisplay)
  end
  def get_image_reference(ppszimageres : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_image_reference.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszimageres)
  end
end
struct LibWin32::IPropertyEnumTypeList
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_count(pctypes : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctypes)
  end
  def get_at(itype : UInt32, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_at.unsafe_as(Proc(UInt32, Guid*, Void**, HRESULT)).call(itype, riid, ppv)
  end
  def get_condition_at(nindex : UInt32, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_condition_at.unsafe_as(Proc(UInt32, Guid*, Void**, HRESULT)).call(nindex, riid, ppv)
  end
  def find_matching_index(propvarcmp : PROPVARIANT*, pnindex : UInt32*) : HRESULT
    @lpVtbl.value.find_matching_index.unsafe_as(Proc(PROPVARIANT*, UInt32*, HRESULT)).call(propvarcmp, pnindex)
  end
end
struct LibWin32::IPropertyDescription
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_property_key(pkey : PROPERTYKEY*) : HRESULT
    @lpVtbl.value.get_property_key.unsafe_as(Proc(PROPERTYKEY*, HRESULT)).call(pkey)
  end
  def get_canonical_name(ppszname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_canonical_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszname)
  end
  def get_property_type(pvartype : UInt16*) : HRESULT
    @lpVtbl.value.get_property_type.unsafe_as(Proc(UInt16*, HRESULT)).call(pvartype)
  end
  def get_display_name(ppszname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszname)
  end
  def get_edit_invitation(ppszinvite : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_edit_invitation.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszinvite)
  end
  def get_type_flags(mask : PROPDESC_TYPE_FLAGS, ppdtflags : PROPDESC_TYPE_FLAGS*) : HRESULT
    @lpVtbl.value.get_type_flags.unsafe_as(Proc(PROPDESC_TYPE_FLAGS, PROPDESC_TYPE_FLAGS*, HRESULT)).call(mask, ppdtflags)
  end
  def get_view_flags(ppdvflags : PROPDESC_VIEW_FLAGS*) : HRESULT
    @lpVtbl.value.get_view_flags.unsafe_as(Proc(PROPDESC_VIEW_FLAGS*, HRESULT)).call(ppdvflags)
  end
  def get_default_column_width(pcxchars : UInt32*) : HRESULT
    @lpVtbl.value.get_default_column_width.unsafe_as(Proc(UInt32*, HRESULT)).call(pcxchars)
  end
  def get_display_type(pdisplaytype : PROPDESC_DISPLAYTYPE*) : HRESULT
    @lpVtbl.value.get_display_type.unsafe_as(Proc(PROPDESC_DISPLAYTYPE*, HRESULT)).call(pdisplaytype)
  end
  def get_column_state(pcsflags : UInt32*) : HRESULT
    @lpVtbl.value.get_column_state.unsafe_as(Proc(UInt32*, HRESULT)).call(pcsflags)
  end
  def get_grouping_range(pgr : PROPDESC_GROUPING_RANGE*) : HRESULT
    @lpVtbl.value.get_grouping_range.unsafe_as(Proc(PROPDESC_GROUPING_RANGE*, HRESULT)).call(pgr)
  end
  def get_relative_description_type(prdt : PROPDESC_RELATIVEDESCRIPTION_TYPE*) : HRESULT
    @lpVtbl.value.get_relative_description_type.unsafe_as(Proc(PROPDESC_RELATIVEDESCRIPTION_TYPE*, HRESULT)).call(prdt)
  end
  def get_relative_description(propvar1 : PROPVARIANT*, propvar2 : PROPVARIANT*, ppszdesc1 : LibC::LPWSTR*, ppszdesc2 : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_relative_description.unsafe_as(Proc(PROPVARIANT*, PROPVARIANT*, LibC::LPWSTR*, LibC::LPWSTR*, HRESULT)).call(propvar1, propvar2, ppszdesc1, ppszdesc2)
  end
  def get_sort_description(psd : PROPDESC_SORTDESCRIPTION*) : HRESULT
    @lpVtbl.value.get_sort_description.unsafe_as(Proc(PROPDESC_SORTDESCRIPTION*, HRESULT)).call(psd)
  end
  def get_sort_description_label(fdescending : LibC::BOOL, ppszdescription : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_sort_description_label.unsafe_as(Proc(LibC::BOOL, LibC::LPWSTR*, HRESULT)).call(fdescending, ppszdescription)
  end
  def get_aggregation_type(paggtype : PROPDESC_AGGREGATION_TYPE*) : HRESULT
    @lpVtbl.value.get_aggregation_type.unsafe_as(Proc(PROPDESC_AGGREGATION_TYPE*, HRESULT)).call(paggtype)
  end
  def get_condition_type(pcontype : PROPDESC_CONDITION_TYPE*, popdefault : CONDITION_OPERATION*) : HRESULT
    @lpVtbl.value.get_condition_type.unsafe_as(Proc(PROPDESC_CONDITION_TYPE*, CONDITION_OPERATION*, HRESULT)).call(pcontype, popdefault)
  end
  def get_enum_type_list(riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_enum_type_list.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppv)
  end
  def coerce_to_canonical_value(ppropvar : PROPVARIANT*) : HRESULT
    @lpVtbl.value.coerce_to_canonical_value.unsafe_as(Proc(PROPVARIANT*, HRESULT)).call(ppropvar)
  end
  def format_for_display(propvar : PROPVARIANT*, pdfflags : PROPDESC_FORMAT_FLAGS, ppszdisplay : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.format_for_display.unsafe_as(Proc(PROPVARIANT*, PROPDESC_FORMAT_FLAGS, LibC::LPWSTR*, HRESULT)).call(propvar, pdfflags, ppszdisplay)
  end
  def is_value_canonical(propvar : PROPVARIANT*) : HRESULT
    @lpVtbl.value.is_value_canonical.unsafe_as(Proc(PROPVARIANT*, HRESULT)).call(propvar)
  end
end
struct LibWin32::IPropertyDescription2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_property_key(pkey : PROPERTYKEY*) : HRESULT
    @lpVtbl.value.get_property_key.unsafe_as(Proc(PROPERTYKEY*, HRESULT)).call(pkey)
  end
  def get_canonical_name(ppszname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_canonical_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszname)
  end
  def get_property_type(pvartype : UInt16*) : HRESULT
    @lpVtbl.value.get_property_type.unsafe_as(Proc(UInt16*, HRESULT)).call(pvartype)
  end
  def get_display_name(ppszname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszname)
  end
  def get_edit_invitation(ppszinvite : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_edit_invitation.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszinvite)
  end
  def get_type_flags(mask : PROPDESC_TYPE_FLAGS, ppdtflags : PROPDESC_TYPE_FLAGS*) : HRESULT
    @lpVtbl.value.get_type_flags.unsafe_as(Proc(PROPDESC_TYPE_FLAGS, PROPDESC_TYPE_FLAGS*, HRESULT)).call(mask, ppdtflags)
  end
  def get_view_flags(ppdvflags : PROPDESC_VIEW_FLAGS*) : HRESULT
    @lpVtbl.value.get_view_flags.unsafe_as(Proc(PROPDESC_VIEW_FLAGS*, HRESULT)).call(ppdvflags)
  end
  def get_default_column_width(pcxchars : UInt32*) : HRESULT
    @lpVtbl.value.get_default_column_width.unsafe_as(Proc(UInt32*, HRESULT)).call(pcxchars)
  end
  def get_display_type(pdisplaytype : PROPDESC_DISPLAYTYPE*) : HRESULT
    @lpVtbl.value.get_display_type.unsafe_as(Proc(PROPDESC_DISPLAYTYPE*, HRESULT)).call(pdisplaytype)
  end
  def get_column_state(pcsflags : UInt32*) : HRESULT
    @lpVtbl.value.get_column_state.unsafe_as(Proc(UInt32*, HRESULT)).call(pcsflags)
  end
  def get_grouping_range(pgr : PROPDESC_GROUPING_RANGE*) : HRESULT
    @lpVtbl.value.get_grouping_range.unsafe_as(Proc(PROPDESC_GROUPING_RANGE*, HRESULT)).call(pgr)
  end
  def get_relative_description_type(prdt : PROPDESC_RELATIVEDESCRIPTION_TYPE*) : HRESULT
    @lpVtbl.value.get_relative_description_type.unsafe_as(Proc(PROPDESC_RELATIVEDESCRIPTION_TYPE*, HRESULT)).call(prdt)
  end
  def get_relative_description(propvar1 : PROPVARIANT*, propvar2 : PROPVARIANT*, ppszdesc1 : LibC::LPWSTR*, ppszdesc2 : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_relative_description.unsafe_as(Proc(PROPVARIANT*, PROPVARIANT*, LibC::LPWSTR*, LibC::LPWSTR*, HRESULT)).call(propvar1, propvar2, ppszdesc1, ppszdesc2)
  end
  def get_sort_description(psd : PROPDESC_SORTDESCRIPTION*) : HRESULT
    @lpVtbl.value.get_sort_description.unsafe_as(Proc(PROPDESC_SORTDESCRIPTION*, HRESULT)).call(psd)
  end
  def get_sort_description_label(fdescending : LibC::BOOL, ppszdescription : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_sort_description_label.unsafe_as(Proc(LibC::BOOL, LibC::LPWSTR*, HRESULT)).call(fdescending, ppszdescription)
  end
  def get_aggregation_type(paggtype : PROPDESC_AGGREGATION_TYPE*) : HRESULT
    @lpVtbl.value.get_aggregation_type.unsafe_as(Proc(PROPDESC_AGGREGATION_TYPE*, HRESULT)).call(paggtype)
  end
  def get_condition_type(pcontype : PROPDESC_CONDITION_TYPE*, popdefault : CONDITION_OPERATION*) : HRESULT
    @lpVtbl.value.get_condition_type.unsafe_as(Proc(PROPDESC_CONDITION_TYPE*, CONDITION_OPERATION*, HRESULT)).call(pcontype, popdefault)
  end
  def get_enum_type_list(riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_enum_type_list.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppv)
  end
  def coerce_to_canonical_value(ppropvar : PROPVARIANT*) : HRESULT
    @lpVtbl.value.coerce_to_canonical_value.unsafe_as(Proc(PROPVARIANT*, HRESULT)).call(ppropvar)
  end
  def format_for_display(propvar : PROPVARIANT*, pdfflags : PROPDESC_FORMAT_FLAGS, ppszdisplay : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.format_for_display.unsafe_as(Proc(PROPVARIANT*, PROPDESC_FORMAT_FLAGS, LibC::LPWSTR*, HRESULT)).call(propvar, pdfflags, ppszdisplay)
  end
  def is_value_canonical(propvar : PROPVARIANT*) : HRESULT
    @lpVtbl.value.is_value_canonical.unsafe_as(Proc(PROPVARIANT*, HRESULT)).call(propvar)
  end
  def get_image_reference_for_value(propvar : PROPVARIANT*, ppszimageres : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_image_reference_for_value.unsafe_as(Proc(PROPVARIANT*, LibC::LPWSTR*, HRESULT)).call(propvar, ppszimageres)
  end
end
struct LibWin32::IPropertyDescriptionAliasInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_property_key(pkey : PROPERTYKEY*) : HRESULT
    @lpVtbl.value.get_property_key.unsafe_as(Proc(PROPERTYKEY*, HRESULT)).call(pkey)
  end
  def get_canonical_name(ppszname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_canonical_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszname)
  end
  def get_property_type(pvartype : UInt16*) : HRESULT
    @lpVtbl.value.get_property_type.unsafe_as(Proc(UInt16*, HRESULT)).call(pvartype)
  end
  def get_display_name(ppszname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszname)
  end
  def get_edit_invitation(ppszinvite : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_edit_invitation.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszinvite)
  end
  def get_type_flags(mask : PROPDESC_TYPE_FLAGS, ppdtflags : PROPDESC_TYPE_FLAGS*) : HRESULT
    @lpVtbl.value.get_type_flags.unsafe_as(Proc(PROPDESC_TYPE_FLAGS, PROPDESC_TYPE_FLAGS*, HRESULT)).call(mask, ppdtflags)
  end
  def get_view_flags(ppdvflags : PROPDESC_VIEW_FLAGS*) : HRESULT
    @lpVtbl.value.get_view_flags.unsafe_as(Proc(PROPDESC_VIEW_FLAGS*, HRESULT)).call(ppdvflags)
  end
  def get_default_column_width(pcxchars : UInt32*) : HRESULT
    @lpVtbl.value.get_default_column_width.unsafe_as(Proc(UInt32*, HRESULT)).call(pcxchars)
  end
  def get_display_type(pdisplaytype : PROPDESC_DISPLAYTYPE*) : HRESULT
    @lpVtbl.value.get_display_type.unsafe_as(Proc(PROPDESC_DISPLAYTYPE*, HRESULT)).call(pdisplaytype)
  end
  def get_column_state(pcsflags : UInt32*) : HRESULT
    @lpVtbl.value.get_column_state.unsafe_as(Proc(UInt32*, HRESULT)).call(pcsflags)
  end
  def get_grouping_range(pgr : PROPDESC_GROUPING_RANGE*) : HRESULT
    @lpVtbl.value.get_grouping_range.unsafe_as(Proc(PROPDESC_GROUPING_RANGE*, HRESULT)).call(pgr)
  end
  def get_relative_description_type(prdt : PROPDESC_RELATIVEDESCRIPTION_TYPE*) : HRESULT
    @lpVtbl.value.get_relative_description_type.unsafe_as(Proc(PROPDESC_RELATIVEDESCRIPTION_TYPE*, HRESULT)).call(prdt)
  end
  def get_relative_description(propvar1 : PROPVARIANT*, propvar2 : PROPVARIANT*, ppszdesc1 : LibC::LPWSTR*, ppszdesc2 : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_relative_description.unsafe_as(Proc(PROPVARIANT*, PROPVARIANT*, LibC::LPWSTR*, LibC::LPWSTR*, HRESULT)).call(propvar1, propvar2, ppszdesc1, ppszdesc2)
  end
  def get_sort_description(psd : PROPDESC_SORTDESCRIPTION*) : HRESULT
    @lpVtbl.value.get_sort_description.unsafe_as(Proc(PROPDESC_SORTDESCRIPTION*, HRESULT)).call(psd)
  end
  def get_sort_description_label(fdescending : LibC::BOOL, ppszdescription : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_sort_description_label.unsafe_as(Proc(LibC::BOOL, LibC::LPWSTR*, HRESULT)).call(fdescending, ppszdescription)
  end
  def get_aggregation_type(paggtype : PROPDESC_AGGREGATION_TYPE*) : HRESULT
    @lpVtbl.value.get_aggregation_type.unsafe_as(Proc(PROPDESC_AGGREGATION_TYPE*, HRESULT)).call(paggtype)
  end
  def get_condition_type(pcontype : PROPDESC_CONDITION_TYPE*, popdefault : CONDITION_OPERATION*) : HRESULT
    @lpVtbl.value.get_condition_type.unsafe_as(Proc(PROPDESC_CONDITION_TYPE*, CONDITION_OPERATION*, HRESULT)).call(pcontype, popdefault)
  end
  def get_enum_type_list(riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_enum_type_list.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppv)
  end
  def coerce_to_canonical_value(ppropvar : PROPVARIANT*) : HRESULT
    @lpVtbl.value.coerce_to_canonical_value.unsafe_as(Proc(PROPVARIANT*, HRESULT)).call(ppropvar)
  end
  def format_for_display(propvar : PROPVARIANT*, pdfflags : PROPDESC_FORMAT_FLAGS, ppszdisplay : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.format_for_display.unsafe_as(Proc(PROPVARIANT*, PROPDESC_FORMAT_FLAGS, LibC::LPWSTR*, HRESULT)).call(propvar, pdfflags, ppszdisplay)
  end
  def is_value_canonical(propvar : PROPVARIANT*) : HRESULT
    @lpVtbl.value.is_value_canonical.unsafe_as(Proc(PROPVARIANT*, HRESULT)).call(propvar)
  end
  def get_sort_by_alias(riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_sort_by_alias.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppv)
  end
  def get_additional_sort_by_aliases(riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_additional_sort_by_aliases.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppv)
  end
end
struct LibWin32::IPropertyDescriptionSearchInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_property_key(pkey : PROPERTYKEY*) : HRESULT
    @lpVtbl.value.get_property_key.unsafe_as(Proc(PROPERTYKEY*, HRESULT)).call(pkey)
  end
  def get_canonical_name(ppszname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_canonical_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszname)
  end
  def get_property_type(pvartype : UInt16*) : HRESULT
    @lpVtbl.value.get_property_type.unsafe_as(Proc(UInt16*, HRESULT)).call(pvartype)
  end
  def get_display_name(ppszname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszname)
  end
  def get_edit_invitation(ppszinvite : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_edit_invitation.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszinvite)
  end
  def get_type_flags(mask : PROPDESC_TYPE_FLAGS, ppdtflags : PROPDESC_TYPE_FLAGS*) : HRESULT
    @lpVtbl.value.get_type_flags.unsafe_as(Proc(PROPDESC_TYPE_FLAGS, PROPDESC_TYPE_FLAGS*, HRESULT)).call(mask, ppdtflags)
  end
  def get_view_flags(ppdvflags : PROPDESC_VIEW_FLAGS*) : HRESULT
    @lpVtbl.value.get_view_flags.unsafe_as(Proc(PROPDESC_VIEW_FLAGS*, HRESULT)).call(ppdvflags)
  end
  def get_default_column_width(pcxchars : UInt32*) : HRESULT
    @lpVtbl.value.get_default_column_width.unsafe_as(Proc(UInt32*, HRESULT)).call(pcxchars)
  end
  def get_display_type(pdisplaytype : PROPDESC_DISPLAYTYPE*) : HRESULT
    @lpVtbl.value.get_display_type.unsafe_as(Proc(PROPDESC_DISPLAYTYPE*, HRESULT)).call(pdisplaytype)
  end
  def get_column_state(pcsflags : UInt32*) : HRESULT
    @lpVtbl.value.get_column_state.unsafe_as(Proc(UInt32*, HRESULT)).call(pcsflags)
  end
  def get_grouping_range(pgr : PROPDESC_GROUPING_RANGE*) : HRESULT
    @lpVtbl.value.get_grouping_range.unsafe_as(Proc(PROPDESC_GROUPING_RANGE*, HRESULT)).call(pgr)
  end
  def get_relative_description_type(prdt : PROPDESC_RELATIVEDESCRIPTION_TYPE*) : HRESULT
    @lpVtbl.value.get_relative_description_type.unsafe_as(Proc(PROPDESC_RELATIVEDESCRIPTION_TYPE*, HRESULT)).call(prdt)
  end
  def get_relative_description(propvar1 : PROPVARIANT*, propvar2 : PROPVARIANT*, ppszdesc1 : LibC::LPWSTR*, ppszdesc2 : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_relative_description.unsafe_as(Proc(PROPVARIANT*, PROPVARIANT*, LibC::LPWSTR*, LibC::LPWSTR*, HRESULT)).call(propvar1, propvar2, ppszdesc1, ppszdesc2)
  end
  def get_sort_description(psd : PROPDESC_SORTDESCRIPTION*) : HRESULT
    @lpVtbl.value.get_sort_description.unsafe_as(Proc(PROPDESC_SORTDESCRIPTION*, HRESULT)).call(psd)
  end
  def get_sort_description_label(fdescending : LibC::BOOL, ppszdescription : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_sort_description_label.unsafe_as(Proc(LibC::BOOL, LibC::LPWSTR*, HRESULT)).call(fdescending, ppszdescription)
  end
  def get_aggregation_type(paggtype : PROPDESC_AGGREGATION_TYPE*) : HRESULT
    @lpVtbl.value.get_aggregation_type.unsafe_as(Proc(PROPDESC_AGGREGATION_TYPE*, HRESULT)).call(paggtype)
  end
  def get_condition_type(pcontype : PROPDESC_CONDITION_TYPE*, popdefault : CONDITION_OPERATION*) : HRESULT
    @lpVtbl.value.get_condition_type.unsafe_as(Proc(PROPDESC_CONDITION_TYPE*, CONDITION_OPERATION*, HRESULT)).call(pcontype, popdefault)
  end
  def get_enum_type_list(riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_enum_type_list.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppv)
  end
  def coerce_to_canonical_value(ppropvar : PROPVARIANT*) : HRESULT
    @lpVtbl.value.coerce_to_canonical_value.unsafe_as(Proc(PROPVARIANT*, HRESULT)).call(ppropvar)
  end
  def format_for_display(propvar : PROPVARIANT*, pdfflags : PROPDESC_FORMAT_FLAGS, ppszdisplay : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.format_for_display.unsafe_as(Proc(PROPVARIANT*, PROPDESC_FORMAT_FLAGS, LibC::LPWSTR*, HRESULT)).call(propvar, pdfflags, ppszdisplay)
  end
  def is_value_canonical(propvar : PROPVARIANT*) : HRESULT
    @lpVtbl.value.is_value_canonical.unsafe_as(Proc(PROPVARIANT*, HRESULT)).call(propvar)
  end
  def get_search_info_flags(ppdsiflags : PROPDESC_SEARCHINFO_FLAGS*) : HRESULT
    @lpVtbl.value.get_search_info_flags.unsafe_as(Proc(PROPDESC_SEARCHINFO_FLAGS*, HRESULT)).call(ppdsiflags)
  end
  def get_column_index_type(ppdcitype : PROPDESC_COLUMNINDEX_TYPE*) : HRESULT
    @lpVtbl.value.get_column_index_type.unsafe_as(Proc(PROPDESC_COLUMNINDEX_TYPE*, HRESULT)).call(ppdcitype)
  end
  def get_projection_string(ppszprojection : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_projection_string.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszprojection)
  end
  def get_max_size(pcbmaxsize : UInt32*) : HRESULT
    @lpVtbl.value.get_max_size.unsafe_as(Proc(UInt32*, HRESULT)).call(pcbmaxsize)
  end
end
struct LibWin32::IPropertyDescriptionRelatedPropertyInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_property_key(pkey : PROPERTYKEY*) : HRESULT
    @lpVtbl.value.get_property_key.unsafe_as(Proc(PROPERTYKEY*, HRESULT)).call(pkey)
  end
  def get_canonical_name(ppszname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_canonical_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszname)
  end
  def get_property_type(pvartype : UInt16*) : HRESULT
    @lpVtbl.value.get_property_type.unsafe_as(Proc(UInt16*, HRESULT)).call(pvartype)
  end
  def get_display_name(ppszname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszname)
  end
  def get_edit_invitation(ppszinvite : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_edit_invitation.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppszinvite)
  end
  def get_type_flags(mask : PROPDESC_TYPE_FLAGS, ppdtflags : PROPDESC_TYPE_FLAGS*) : HRESULT
    @lpVtbl.value.get_type_flags.unsafe_as(Proc(PROPDESC_TYPE_FLAGS, PROPDESC_TYPE_FLAGS*, HRESULT)).call(mask, ppdtflags)
  end
  def get_view_flags(ppdvflags : PROPDESC_VIEW_FLAGS*) : HRESULT
    @lpVtbl.value.get_view_flags.unsafe_as(Proc(PROPDESC_VIEW_FLAGS*, HRESULT)).call(ppdvflags)
  end
  def get_default_column_width(pcxchars : UInt32*) : HRESULT
    @lpVtbl.value.get_default_column_width.unsafe_as(Proc(UInt32*, HRESULT)).call(pcxchars)
  end
  def get_display_type(pdisplaytype : PROPDESC_DISPLAYTYPE*) : HRESULT
    @lpVtbl.value.get_display_type.unsafe_as(Proc(PROPDESC_DISPLAYTYPE*, HRESULT)).call(pdisplaytype)
  end
  def get_column_state(pcsflags : UInt32*) : HRESULT
    @lpVtbl.value.get_column_state.unsafe_as(Proc(UInt32*, HRESULT)).call(pcsflags)
  end
  def get_grouping_range(pgr : PROPDESC_GROUPING_RANGE*) : HRESULT
    @lpVtbl.value.get_grouping_range.unsafe_as(Proc(PROPDESC_GROUPING_RANGE*, HRESULT)).call(pgr)
  end
  def get_relative_description_type(prdt : PROPDESC_RELATIVEDESCRIPTION_TYPE*) : HRESULT
    @lpVtbl.value.get_relative_description_type.unsafe_as(Proc(PROPDESC_RELATIVEDESCRIPTION_TYPE*, HRESULT)).call(prdt)
  end
  def get_relative_description(propvar1 : PROPVARIANT*, propvar2 : PROPVARIANT*, ppszdesc1 : LibC::LPWSTR*, ppszdesc2 : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_relative_description.unsafe_as(Proc(PROPVARIANT*, PROPVARIANT*, LibC::LPWSTR*, LibC::LPWSTR*, HRESULT)).call(propvar1, propvar2, ppszdesc1, ppszdesc2)
  end
  def get_sort_description(psd : PROPDESC_SORTDESCRIPTION*) : HRESULT
    @lpVtbl.value.get_sort_description.unsafe_as(Proc(PROPDESC_SORTDESCRIPTION*, HRESULT)).call(psd)
  end
  def get_sort_description_label(fdescending : LibC::BOOL, ppszdescription : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_sort_description_label.unsafe_as(Proc(LibC::BOOL, LibC::LPWSTR*, HRESULT)).call(fdescending, ppszdescription)
  end
  def get_aggregation_type(paggtype : PROPDESC_AGGREGATION_TYPE*) : HRESULT
    @lpVtbl.value.get_aggregation_type.unsafe_as(Proc(PROPDESC_AGGREGATION_TYPE*, HRESULT)).call(paggtype)
  end
  def get_condition_type(pcontype : PROPDESC_CONDITION_TYPE*, popdefault : CONDITION_OPERATION*) : HRESULT
    @lpVtbl.value.get_condition_type.unsafe_as(Proc(PROPDESC_CONDITION_TYPE*, CONDITION_OPERATION*, HRESULT)).call(pcontype, popdefault)
  end
  def get_enum_type_list(riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_enum_type_list.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppv)
  end
  def coerce_to_canonical_value(ppropvar : PROPVARIANT*) : HRESULT
    @lpVtbl.value.coerce_to_canonical_value.unsafe_as(Proc(PROPVARIANT*, HRESULT)).call(ppropvar)
  end
  def format_for_display(propvar : PROPVARIANT*, pdfflags : PROPDESC_FORMAT_FLAGS, ppszdisplay : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.format_for_display.unsafe_as(Proc(PROPVARIANT*, PROPDESC_FORMAT_FLAGS, LibC::LPWSTR*, HRESULT)).call(propvar, pdfflags, ppszdisplay)
  end
  def is_value_canonical(propvar : PROPVARIANT*) : HRESULT
    @lpVtbl.value.is_value_canonical.unsafe_as(Proc(PROPVARIANT*, HRESULT)).call(propvar)
  end
  def get_related_property(pszrelationshipname : LibC::LPWSTR, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_related_property.unsafe_as(Proc(LibC::LPWSTR, Guid*, Void**, HRESULT)).call(pszrelationshipname, riid, ppv)
  end
end
struct LibWin32::IPropertySystem
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_property_description(propkey : PROPERTYKEY*, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_property_description.unsafe_as(Proc(PROPERTYKEY*, Guid*, Void**, HRESULT)).call(propkey, riid, ppv)
  end
  def get_property_description_by_name(pszcanonicalname : LibC::LPWSTR, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_property_description_by_name.unsafe_as(Proc(LibC::LPWSTR, Guid*, Void**, HRESULT)).call(pszcanonicalname, riid, ppv)
  end
  def get_property_description_list_from_string(pszproplist : LibC::LPWSTR, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_property_description_list_from_string.unsafe_as(Proc(LibC::LPWSTR, Guid*, Void**, HRESULT)).call(pszproplist, riid, ppv)
  end
  def enumerate_property_descriptions(filteron : PROPDESC_ENUMFILTER, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.enumerate_property_descriptions.unsafe_as(Proc(PROPDESC_ENUMFILTER, Guid*, Void**, HRESULT)).call(filteron, riid, ppv)
  end
  def format_for_display(key : PROPERTYKEY*, propvar : PROPVARIANT*, pdff : PROPDESC_FORMAT_FLAGS, psztext : Char*, cchtext : UInt32) : HRESULT
    @lpVtbl.value.format_for_display.unsafe_as(Proc(PROPERTYKEY*, PROPVARIANT*, PROPDESC_FORMAT_FLAGS, Char*, UInt32, HRESULT)).call(key, propvar, pdff, psztext, cchtext)
  end
  def format_for_display_alloc(key : PROPERTYKEY*, propvar : PROPVARIANT*, pdff : PROPDESC_FORMAT_FLAGS, ppszdisplay : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.format_for_display_alloc.unsafe_as(Proc(PROPERTYKEY*, PROPVARIANT*, PROPDESC_FORMAT_FLAGS, LibC::LPWSTR*, HRESULT)).call(key, propvar, pdff, ppszdisplay)
  end
  def register_property_schema(pszpath : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.register_property_schema.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pszpath)
  end
  def unregister_property_schema(pszpath : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.unregister_property_schema.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pszpath)
  end
  def refresh_property_schema : HRESULT
    @lpVtbl.value.refresh_property_schema.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IPropertyDescriptionList
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_count(pcelem : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcelem)
  end
  def get_at(ielem : UInt32, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_at.unsafe_as(Proc(UInt32, Guid*, Void**, HRESULT)).call(ielem, riid, ppv)
  end
end
struct LibWin32::IPropertyStoreFactory
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_property_store(flags : GETPROPERTYSTOREFLAGS, punkfactory : IUnknown, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_property_store.unsafe_as(Proc(GETPROPERTYSTOREFLAGS, IUnknown, Guid*, Void**, HRESULT)).call(flags, punkfactory, riid, ppv)
  end
  def get_property_store_for_keys(rgkeys : PROPERTYKEY*, ckeys : UInt32, flags : GETPROPERTYSTOREFLAGS, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_property_store_for_keys.unsafe_as(Proc(PROPERTYKEY*, UInt32, GETPROPERTYSTOREFLAGS, Guid*, Void**, HRESULT)).call(rgkeys, ckeys, flags, riid, ppv)
  end
end
struct LibWin32::IDelayedPropertyStoreFactory
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_property_store(flags : GETPROPERTYSTOREFLAGS, punkfactory : IUnknown, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_property_store.unsafe_as(Proc(GETPROPERTYSTOREFLAGS, IUnknown, Guid*, Void**, HRESULT)).call(flags, punkfactory, riid, ppv)
  end
  def get_property_store_for_keys(rgkeys : PROPERTYKEY*, ckeys : UInt32, flags : GETPROPERTYSTOREFLAGS, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_property_store_for_keys.unsafe_as(Proc(PROPERTYKEY*, UInt32, GETPROPERTYSTOREFLAGS, Guid*, Void**, HRESULT)).call(rgkeys, ckeys, flags, riid, ppv)
  end
  def get_delayed_property_store(flags : GETPROPERTYSTOREFLAGS, dwstoreid : UInt32, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_delayed_property_store.unsafe_as(Proc(GETPROPERTYSTOREFLAGS, UInt32, Guid*, Void**, HRESULT)).call(flags, dwstoreid, riid, ppv)
  end
end
struct LibWin32::IPersistSerializedPropStorage
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_flags(flags : Int32) : HRESULT
    @lpVtbl.value.set_flags.unsafe_as(Proc(Int32, HRESULT)).call(flags)
  end
  def set_property_storage(psps : SERIALIZEDPROPSTORAGE*, cb : UInt32) : HRESULT
    @lpVtbl.value.set_property_storage.unsafe_as(Proc(SERIALIZEDPROPSTORAGE*, UInt32, HRESULT)).call(psps, cb)
  end
  def get_property_storage(ppsps : SERIALIZEDPROPSTORAGE**, pcb : UInt32*) : HRESULT
    @lpVtbl.value.get_property_storage.unsafe_as(Proc(SERIALIZEDPROPSTORAGE**, UInt32*, HRESULT)).call(ppsps, pcb)
  end
end
struct LibWin32::IPersistSerializedPropStorage2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_flags(flags : Int32) : HRESULT
    @lpVtbl.value.set_flags.unsafe_as(Proc(Int32, HRESULT)).call(flags)
  end
  def set_property_storage(psps : SERIALIZEDPROPSTORAGE*, cb : UInt32) : HRESULT
    @lpVtbl.value.set_property_storage.unsafe_as(Proc(SERIALIZEDPROPSTORAGE*, UInt32, HRESULT)).call(psps, cb)
  end
  def get_property_storage(ppsps : SERIALIZEDPROPSTORAGE**, pcb : UInt32*) : HRESULT
    @lpVtbl.value.get_property_storage.unsafe_as(Proc(SERIALIZEDPROPSTORAGE**, UInt32*, HRESULT)).call(ppsps, pcb)
  end
  def get_property_storage_size(pcb : UInt32*) : HRESULT
    @lpVtbl.value.get_property_storage_size.unsafe_as(Proc(UInt32*, HRESULT)).call(pcb)
  end
  def get_property_storage_buffer(psps : SERIALIZEDPROPSTORAGE*, cb : UInt32, pcbwritten : UInt32*) : HRESULT
    @lpVtbl.value.get_property_storage_buffer.unsafe_as(Proc(SERIALIZEDPROPSTORAGE*, UInt32, UInt32*, HRESULT)).call(psps, cb, pcbwritten)
  end
end
struct LibWin32::IPropertySystemChangeNotify
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def schema_refreshed : HRESULT
    @lpVtbl.value.schema_refreshed.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ICreateObject
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_object(clsid : Guid*, punkouter : IUnknown, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.create_object.unsafe_as(Proc(Guid*, IUnknown, Guid*, Void**, HRESULT)).call(clsid, punkouter, riid, ppv)
  end
end
struct LibWin32::IPropertyUI
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def parse_property_name(pszname : LibC::LPWSTR, pfmtid : Guid*, ppid : UInt32*, pcheaten : UInt32*) : HRESULT
    @lpVtbl.value.parse_property_name.unsafe_as(Proc(LibC::LPWSTR, Guid*, UInt32*, UInt32*, HRESULT)).call(pszname, pfmtid, ppid, pcheaten)
  end
  def get_cannonical_name(fmtid : Guid*, pid : UInt32, pwsztext : Char*, cchtext : UInt32) : HRESULT
    @lpVtbl.value.get_cannonical_name.unsafe_as(Proc(Guid*, UInt32, Char*, UInt32, HRESULT)).call(fmtid, pid, pwsztext, cchtext)
  end
  def get_display_name(fmtid : Guid*, pid : UInt32, flags : PROPERTYUI_NAME_FLAGS, pwsztext : Char*, cchtext : UInt32) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(Guid*, UInt32, PROPERTYUI_NAME_FLAGS, Char*, UInt32, HRESULT)).call(fmtid, pid, flags, pwsztext, cchtext)
  end
  def get_property_description(fmtid : Guid*, pid : UInt32, pwsztext : Char*, cchtext : UInt32) : HRESULT
    @lpVtbl.value.get_property_description.unsafe_as(Proc(Guid*, UInt32, Char*, UInt32, HRESULT)).call(fmtid, pid, pwsztext, cchtext)
  end
  def get_default_width(fmtid : Guid*, pid : UInt32, pcxchars : UInt32*) : HRESULT
    @lpVtbl.value.get_default_width.unsafe_as(Proc(Guid*, UInt32, UInt32*, HRESULT)).call(fmtid, pid, pcxchars)
  end
  def get_flags(fmtid : Guid*, pid : UInt32, pflags : PROPERTYUI_FLAGS*) : HRESULT
    @lpVtbl.value.get_flags.unsafe_as(Proc(Guid*, UInt32, PROPERTYUI_FLAGS*, HRESULT)).call(fmtid, pid, pflags)
  end
  def format_for_display(fmtid : Guid*, pid : UInt32, ppropvar : PROPVARIANT*, puiff : PROPERTYUI_FORMAT_FLAGS, pwsztext : Char*, cchtext : UInt32) : HRESULT
    @lpVtbl.value.format_for_display.unsafe_as(Proc(Guid*, UInt32, PROPVARIANT*, PROPERTYUI_FORMAT_FLAGS, Char*, UInt32, HRESULT)).call(fmtid, pid, ppropvar, puiff, pwsztext, cchtext)
  end
  def get_help_info(fmtid : Guid*, pid : UInt32, pwszhelpfile : Char*, cch : UInt32, puhelpid : UInt32*) : HRESULT
    @lpVtbl.value.get_help_info.unsafe_as(Proc(Guid*, UInt32, Char*, UInt32, UInt32*, HRESULT)).call(fmtid, pid, pwszhelpfile, cch, puhelpid)
  end
end
struct LibWin32::PROPERTYKEY
  def initialize(@fmtid : Guid, @pid : UInt32)
  end
end
