require "../../system/com.cr"
require "../../foundation.cr"
require "../../security.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:ole32.dll")]
@[Link(ldflags: "/DELAYLOAD:dflayout.dll")]
@[Link(ldflags: "/DELAYLOAD:propsys.dll")]
{% else %}
@[Link("ole32")]
@[Link("dflayout")]
@[Link("propsys")]
{% end %}
lib LibWin32
  PROPSETFLAG_DEFAULT = 0_u32
  PROPSETFLAG_NONSIMPLE = 1_u32
  PROPSETFLAG_ANSI = 2_u32
  PROPSETFLAG_UNBUFFERED = 4_u32
  PROPSETFLAG_CASE_SENSITIVE = 8_u32
  PROPSET_BEHAVIOR_CASE_SENSITIVE = 1_u32
  PID_DICTIONARY = 0_u32
  PID_CODEPAGE = 1_u32
  PID_FIRST_USABLE = 2_u32
  PID_FIRST_NAME_DEFAULT = 4095_u32
  PID_LOCALE = 2147483648_u32
  PID_MODIFY_TIME = 2147483649_u32
  PID_SECURITY = 2147483650_u32
  PID_BEHAVIOR = 2147483651_u32
  PID_ILLEGAL = 4294967295_u32
  PID_MIN_READONLY = 2147483648_u32
  PID_MAX_READONLY = 3221225471_u32
  PRSPEC_INVALID = 4294967295_u32
  PROPSETHDR_OSVERSION_UNKNOWN = 4294967295_u32
  PIDDI_THUMBNAIL = 2_i32
  PIDSI_TITLE = 2_i32
  PIDSI_SUBJECT = 3_i32
  PIDSI_AUTHOR = 4_i32
  PIDSI_KEYWORDS = 5_i32
  PIDSI_COMMENTS = 6_i32
  PIDSI_TEMPLATE = 7_i32
  PIDSI_LASTAUTHOR = 8_i32
  PIDSI_REVNUMBER = 9_i32
  PIDSI_EDITTIME = 10_i32
  PIDSI_LASTPRINTED = 11_i32
  PIDSI_CREATE_DTM = 12_i32
  PIDSI_LASTSAVE_DTM = 13_i32
  PIDSI_PAGECOUNT = 14_i32
  PIDSI_WORDCOUNT = 15_i32
  PIDSI_CHARCOUNT = 16_i32
  PIDSI_THUMBNAIL = 17_i32
  PIDSI_APPNAME = 18_i32
  PIDSI_DOC_SECURITY = 19_i32
  PIDDSI_CATEGORY = 2_u32
  PIDDSI_PRESFORMAT = 3_u32
  PIDDSI_BYTECOUNT = 4_u32
  PIDDSI_LINECOUNT = 5_u32
  PIDDSI_PARCOUNT = 6_u32
  PIDDSI_SLIDECOUNT = 7_u32
  PIDDSI_NOTECOUNT = 8_u32
  PIDDSI_HIDDENCOUNT = 9_u32
  PIDDSI_MMCLIPCOUNT = 10_u32
  PIDDSI_SCALE = 11_u32
  PIDDSI_HEADINGPAIR = 12_u32
  PIDDSI_DOCPARTS = 13_u32
  PIDDSI_MANAGER = 14_u32
  PIDDSI_COMPANY = 15_u32
  PIDDSI_LINKSDIRTY = 16_u32
  PIDMSI_EDITOR = 2_i32
  PIDMSI_SUPPLIER = 3_i32
  PIDMSI_SOURCE = 4_i32
  PIDMSI_SEQUENCE_NO = 5_i32
  PIDMSI_PROJECT = 6_i32
  PIDMSI_STATUS = 7_i32
  PIDMSI_OWNER = 8_i32
  PIDMSI_RATING = 9_i32
  PIDMSI_PRODUCTION = 10_i32
  PIDMSI_COPYRIGHT = 11_i32
  CWCSTORAGENAME = 32_u32
  STGM_DIRECT = 0_i32
  STGM_TRANSACTED = 65536_i32
  STGM_SIMPLE = 134217728_i32
  STGM_READ = 0_i32
  STGM_WRITE = 1_i32
  STGM_READWRITE = 2_i32
  STGM_SHARE_DENY_NONE = 64_i32
  STGM_SHARE_DENY_READ = 48_i32
  STGM_SHARE_DENY_WRITE = 32_i32
  STGM_SHARE_EXCLUSIVE = 16_i32
  STGM_PRIORITY = 262144_i32
  STGM_DELETEONRELEASE = 67108864_i32
  STGM_NOSCRATCH = 1048576_i32
  STGM_CREATE = 4096_i32
  STGM_CONVERT = 131072_i32
  STGM_FAILIFTHERE = 0_i32
  STGM_NOSNAPSHOT = 2097152_i32
  STGM_DIRECT_SWMR = 4194304_i32
  STGFMT_STORAGE = 0_u32
  STGFMT_NATIVE = 1_u32
  STGFMT_FILE = 3_u32
  STGFMT_ANY = 4_u32
  STGFMT_DOCFILE = 5_u32
  STGFMT_DOCUMENT = 0_u32
  STGOPTIONS_VERSION = 1_u32
  CCH_MAX_PROPSTG_NAME = 31_u32

  type PMemoryAllocator = Void


  enum PROPSPEC_KIND : UInt32
    PRSPEC_LPWSTR = 0
    PRSPEC_PROPID = 1
  end

  enum STGC : Int32
    STGC_DEFAULT = 0
    STGC_OVERWRITE = 1
    STGC_ONLYIFCURRENT = 2
    STGC_DANGEROUSLYCOMMITMERELYTODISKCACHE = 4
    STGC_CONSOLIDATE = 8
  end

  enum STGMOVE : Int32
    STGMOVE_MOVE = 0
    STGMOVE_COPY = 1
    STGMOVE_SHALLOWCOPY = 2
  end

  enum STATFLAG : Int32
    STATFLAG_DEFAULT = 0
    STATFLAG_NONAME = 1
    STATFLAG_NOOPEN = 2
  end

  enum LOCKTYPE : Int32
    LOCK_WRITE = 1
    LOCK_EXCLUSIVE = 2
    LOCK_ONLYONCE = 4
  end

  enum PIDMSI_STATUS_VALUE : Int32
    PIDMSI_STATUS_NORMAL = 0
    PIDMSI_STATUS_NEW = 1
    PIDMSI_STATUS_PRELIM = 2
    PIDMSI_STATUS_DRAFT = 3
    PIDMSI_STATUS_INPROGRESS = 4
    PIDMSI_STATUS_EDIT = 5
    PIDMSI_STATUS_REVIEW = 6
    PIDMSI_STATUS_PROOF = 7
    PIDMSI_STATUS_FINAL = 8
    PIDMSI_STATUS_OTHER = 32767
  end

  union PROPVARIANT_Anonymous_e__Union
    anonymous : PROPVARIANT_Anonymous_e__Union_Anonymous_e__Struct
    dec_val : DECIMAL
  end
  union PROPVARIANT_Anonymous_e__Union_Anonymous_e__Struct_Anonymous_e__Union
    c_val : CHAR
    b_val : UInt8
    i_val : Int16
    ui_val : UInt16
    l_val : Int32
    ul_val : UInt32
    int_val : Int32
    uint_val : UInt32
    h_val : LARGE_INTEGER
    uh_val : ULARGE_INTEGER
    flt_val : Float32
    dbl_val : Float64
    bool_val : Int16
    __obsolete__variant_bool : Int16
    scode : Int32
    cy_val : CY
    date : Float64
    filetime : FILETIME
    puuid : Guid*
    pclipdata : CLIPDATA*
    bstr_val : UInt8*
    bstrblob_val : BSTRBLOB
    blob : BLOB
    psz_val : PSTR
    pwsz_val : LibC::LPWSTR
    punk_val : IUnknown
    pdisp_val : IDispatch
    p_stream : IStream
    p_storage : IStorage
    p_versioned_stream : VERSIONEDSTREAM*
    parray : SAFEARRAY*
    cac : CAC
    caub : CAUB
    cai : CAI
    caui : CAUI
    cal : CAL
    caul : CAUL
    cah : CAH
    cauh : CAUH
    caflt : CAFLT
    cadbl : CADBL
    cabool : CABOOL
    cascode : CASCODE
    cacy : CACY
    cadate : CADATE
    cafiletime : CAFILETIME
    cauuid : CACLSID
    caclipdata : CACLIPDATA
    cabstr : CABSTR
    cabstrblob : CABSTRBLOB
    calpstr : CALPSTR
    calpwstr : CALPWSTR
    capropvar : CAPROPVARIANT
    pc_val : PSTR
    pb_val : UInt8*
    pi_val : Int16*
    pui_val : UInt16*
    pl_val : Int32*
    pul_val : UInt32*
    pint_val : Int32*
    puint_val : UInt32*
    pflt_val : Float32*
    pdbl_val : Float64*
    pbool_val : Int16*
    pdec_val : DECIMAL*
    pscode : Int32*
    pcy_val : CY*
    pdate : Float64*
    pbstr_val : UInt8**
    ppunk_val : IUnknown*
    ppdisp_val : IDispatch*
    pparray : SAFEARRAY**
    pvar_val : PROPVARIANT*
  end
  union PROPSPEC_Anonymous_e__Union
    propid : UInt32
    lpwstr : LibC::LPWSTR
  end

  struct BSTRBLOB
    cb_size : UInt32
    p_data : UInt8*
  end
  struct CLIPDATA
    cb_size : UInt32
    ul_clip_fmt : Int32
    p_clip_data : UInt8*
  end
  struct RemSNB
    ul_cnt_str : UInt32
    ul_cnt_char : UInt32
    rg_string : Char[0]*
  end
  struct VERSIONEDSTREAM
    guid_version : Guid
    p_stream : IStream
  end
  struct CAC
    c_elems : UInt32
    p_elems : PSTR
  end
  struct CAUB
    c_elems : UInt32
    p_elems : UInt8*
  end
  struct CAI
    c_elems : UInt32
    p_elems : Int16*
  end
  struct CAUI
    c_elems : UInt32
    p_elems : UInt16*
  end
  struct CAL
    c_elems : UInt32
    p_elems : Int32*
  end
  struct CAUL
    c_elems : UInt32
    p_elems : UInt32*
  end
  struct CAFLT
    c_elems : UInt32
    p_elems : Float32*
  end
  struct CADBL
    c_elems : UInt32
    p_elems : Float64*
  end
  struct CACY
    c_elems : UInt32
    p_elems : CY*
  end
  struct CADATE
    c_elems : UInt32
    p_elems : Float64*
  end
  struct CABSTR
    c_elems : UInt32
    p_elems : UInt8**
  end
  struct CABSTRBLOB
    c_elems : UInt32
    p_elems : BSTRBLOB*
  end
  struct CABOOL
    c_elems : UInt32
    p_elems : Int16*
  end
  struct CASCODE
    c_elems : UInt32
    p_elems : Int32*
  end
  struct CAPROPVARIANT
    c_elems : UInt32
    p_elems : PROPVARIANT*
  end
  struct CAH
    c_elems : UInt32
    p_elems : LARGE_INTEGER*
  end
  struct CAUH
    c_elems : UInt32
    p_elems : ULARGE_INTEGER*
  end
  struct CALPSTR
    c_elems : UInt32
    p_elems : PSTR*
  end
  struct CALPWSTR
    c_elems : UInt32
    p_elems : LibC::LPWSTR*
  end
  struct CAFILETIME
    c_elems : UInt32
    p_elems : FILETIME*
  end
  struct CACLIPDATA
    c_elems : UInt32
    p_elems : CLIPDATA*
  end
  struct CACLSID
    c_elems : UInt32
    p_elems : Guid*
  end
  struct PROPVARIANT
    anonymous : PROPVARIANT_Anonymous_e__Union
  end
  struct PROPVARIANT_Anonymous_e__Union_Anonymous_e__Struct
    vt : UInt16
    w_reserved1 : UInt16
    w_reserved2 : UInt16
    w_reserved3 : UInt16
    anonymous : PROPVARIANT_Anonymous_e__Union_Anonymous_e__Struct_Anonymous_e__Union
  end
  struct PROPSPEC
    ul_kind : PROPSPEC_KIND
    anonymous : PROPSPEC_Anonymous_e__Union
  end
  struct STATPROPSTG
    lpwstr_name : LibC::LPWSTR
    propid : UInt32
    vt : UInt16
  end
  struct STATPROPSETSTG
    fmtid : Guid
    clsid : Guid
    grf_flags : UInt32
    mtime : FILETIME
    ctime : FILETIME
    atime : FILETIME
    dw_os_version : UInt32
  end
  struct STGOPTIONS
    us_version : UInt16
    reserved : UInt16
    ul_sector_size : UInt32
    pwcs_template_file : LibC::LPWSTR
  end
  struct SERIALIZEDPROPERTYVALUE
    dw_type : UInt32
    rgb : UInt8[0]*
  end
  struct OLESTREAMVTBL
    get : LibC::IntPtrT
    put : LibC::IntPtrT
  end
  struct OLESTREAM
    lpstbl : OLESTREAMVTBL*
  end
  struct PROPBAG2
    dw_type : UInt32
    vt : UInt16
    cf_type : UInt16
    dw_hint : UInt32
    pstr_name : LibC::LPWSTR
    clsid : Guid
  end


  struct IEnumSTATSTGVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
  end

  IEnumSTATSTG_GUID = "0000000d-0000-0000-c000-000000000046"
  IID_IEnumSTATSTG = LibC::GUID.new(0xd_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IEnumSTATSTG
    lpVtbl : IEnumSTATSTGVTbl*
  end

  struct IStorageVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_stream : UInt64
    open_stream : UInt64
    create_storage : UInt64
    open_storage : UInt64
    copy_to : UInt64
    move_element_to : UInt64
    commit : UInt64
    revert : UInt64
    enum_elements : UInt64
    destroy_element : UInt64
    rename_element : UInt64
    set_element_times : UInt64
    set_class : UInt64
    set_state_bits : UInt64
    stat : UInt64
  end

  IStorage_GUID = "0000000b-0000-0000-c000-000000000046"
  IID_IStorage = LibC::GUID.new(0xb_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IStorage
    lpVtbl : IStorageVTbl*
  end

  struct IPersistStorageVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_class_id : UInt64
    is_dirty : UInt64
    init_new : UInt64
    load : UInt64
    save : UInt64
    save_completed : UInt64
    hands_off_storage : UInt64
  end

  IPersistStorage_GUID = "0000010a-0000-0000-c000-000000000046"
  IID_IPersistStorage = LibC::GUID.new(0x10a_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IPersistStorage
    lpVtbl : IPersistStorageVTbl*
  end

  struct ILockBytesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    read_at : UInt64
    write_at : UInt64
    flush : UInt64
    set_size : UInt64
    lock_region : UInt64
    unlock_region : UInt64
    stat : UInt64
  end

  ILockBytes_GUID = "0000000a-0000-0000-c000-000000000046"
  IID_ILockBytes = LibC::GUID.new(0xa_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct ILockBytes
    lpVtbl : ILockBytesVTbl*
  end

  struct IRootStorageVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    switch_to_file : UInt64
  end

  IRootStorage_GUID = "00000012-0000-0000-c000-000000000046"
  IID_IRootStorage = LibC::GUID.new(0x12_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IRootStorage
    lpVtbl : IRootStorageVTbl*
  end

  struct IFillLockBytesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    fill_append : UInt64
    fill_at : UInt64
    set_fill_size : UInt64
    terminate : UInt64
  end

  IFillLockBytes_GUID = "99caf010-415e-11cf-8814-00aa00b569f5"
  IID_IFillLockBytes = LibC::GUID.new(0x99caf010_u32, 0x415e_u16, 0x11cf_u16, StaticArray[0x88_u8, 0x14_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xb5_u8, 0x69_u8, 0xf5_u8])
  struct IFillLockBytes
    lpVtbl : IFillLockBytesVTbl*
  end

  struct ILayoutStorageVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    layout_script : UInt64
    begin_monitor : UInt64
    end_monitor : UInt64
    re_layout_docfile : UInt64
    re_layout_docfile_on_i_lock_bytes : UInt64
  end

  ILayoutStorage_GUID = "0e6d4d90-6738-11cf-9608-00aa00680db4"
  IID_ILayoutStorage = LibC::GUID.new(0xe6d4d90_u32, 0x6738_u16, 0x11cf_u16, StaticArray[0x96_u8, 0x8_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x68_u8, 0xd_u8, 0xb4_u8])
  struct ILayoutStorage
    lpVtbl : ILayoutStorageVTbl*
  end

  struct IDirectWriterLockVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    wait_for_write_access : UInt64
    release_write_access : UInt64
    have_write_access : UInt64
  end

  IDirectWriterLock_GUID = "0e6d4d92-6738-11cf-9608-00aa00680db4"
  IID_IDirectWriterLock = LibC::GUID.new(0xe6d4d92_u32, 0x6738_u16, 0x11cf_u16, StaticArray[0x96_u8, 0x8_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x68_u8, 0xd_u8, 0xb4_u8])
  struct IDirectWriterLock
    lpVtbl : IDirectWriterLockVTbl*
  end

  struct IPropertyStorageVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    read_multiple : UInt64
    write_multiple : UInt64
    delete_multiple : UInt64
    read_property_names : UInt64
    write_property_names : UInt64
    delete_property_names : UInt64
    commit : UInt64
    revert : UInt64
    enum : UInt64
    set_times : UInt64
    set_class : UInt64
    stat : UInt64
  end

  IPropertyStorage_GUID = "00000138-0000-0000-c000-000000000046"
  IID_IPropertyStorage = LibC::GUID.new(0x138_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IPropertyStorage
    lpVtbl : IPropertyStorageVTbl*
  end

  struct IPropertySetStorageVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create : UInt64
    open : UInt64
    delete : UInt64
    enum : UInt64
  end

  IPropertySetStorage_GUID = "0000013a-0000-0000-c000-000000000046"
  IID_IPropertySetStorage = LibC::GUID.new(0x13a_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IPropertySetStorage
    lpVtbl : IPropertySetStorageVTbl*
  end

  struct IEnumSTATPROPSTGVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
  end

  IEnumSTATPROPSTG_GUID = "00000139-0000-0000-c000-000000000046"
  IID_IEnumSTATPROPSTG = LibC::GUID.new(0x139_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IEnumSTATPROPSTG
    lpVtbl : IEnumSTATPROPSTGVTbl*
  end

  struct IEnumSTATPROPSETSTGVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
  end

  IEnumSTATPROPSETSTG_GUID = "0000013b-0000-0000-c000-000000000046"
  IID_IEnumSTATPROPSETSTG = LibC::GUID.new(0x13b_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IEnumSTATPROPSETSTG
    lpVtbl : IEnumSTATPROPSETSTGVTbl*
  end

  struct IPropertyBagVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    read : UInt64
    write : UInt64
  end

  IPropertyBag_GUID = "55272a00-42cb-11ce-8135-00aa004bb851"
  IID_IPropertyBag = LibC::GUID.new(0x55272a00_u32, 0x42cb_u16, 0x11ce_u16, StaticArray[0x81_u8, 0x35_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x4b_u8, 0xb8_u8, 0x51_u8])
  struct IPropertyBag
    lpVtbl : IPropertyBagVTbl*
  end

  struct IPropertyBag2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    read : UInt64
    write : UInt64
    count_properties : UInt64
    get_property_info : UInt64
    load_object : UInt64
  end

  IPropertyBag2_GUID = "22f55882-280b-11d0-a8a9-00a0c90c2004"
  IID_IPropertyBag2 = LibC::GUID.new(0x22f55882_u32, 0x280b_u16, 0x11d0_u16, StaticArray[0xa8_u8, 0xa9_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xc_u8, 0x20_u8, 0x4_u8])
  struct IPropertyBag2
    lpVtbl : IPropertyBag2VTbl*
  end


  # Params # pserverinfo : COSERVERINFO* [In],pclsid : Guid* [In],punkouter : IUnknown [In],dwclsctx : CLSCTX [In],grfmode : UInt32 [In],pwszname : LibC::LPWSTR [In],dwcount : UInt32 [In],presults : MULTI_QI* [In]
  fun CoGetInstanceFromFile(pserverinfo : COSERVERINFO*, pclsid : Guid*, punkouter : IUnknown, dwclsctx : CLSCTX, grfmode : UInt32, pwszname : LibC::LPWSTR, dwcount : UInt32, presults : MULTI_QI*) : HRESULT

  # Params # pserverinfo : COSERVERINFO* [In],pclsid : Guid* [In],punkouter : IUnknown [In],dwclsctx : CLSCTX [In],pstg : IStorage [In],dwcount : UInt32 [In],presults : MULTI_QI* [In]
  fun CoGetInstanceFromIStorage(pserverinfo : COSERVERINFO*, pclsid : Guid*, punkouter : IUnknown, dwclsctx : CLSCTX, pstg : IStorage, dwcount : UInt32, presults : MULTI_QI*) : HRESULT

  # Params # pflb : IFillLockBytes [In],grfmode : UInt32 [In],asyncflags : UInt32 [In],ppstgopen : IStorage* [In]
  fun StgOpenAsyncDocfileOnIFillLockBytes(pflb : IFillLockBytes, grfmode : UInt32, asyncflags : UInt32, ppstgopen : IStorage*) : HRESULT

  # Params # pilb : ILockBytes [In],ppflb : IFillLockBytes* [In]
  fun StgGetIFillLockBytesOnILockBytes(pilb : ILockBytes, ppflb : IFillLockBytes*) : HRESULT

  # Params # pwcsname : LibC::LPWSTR [In],ppflb : IFillLockBytes* [In]
  fun StgGetIFillLockBytesOnFile(pwcsname : LibC::LPWSTR, ppflb : IFillLockBytes*) : HRESULT

  # Params # pwcsdfname : LibC::LPWSTR [In],grfmode : UInt32 [In],reserved : UInt32 [In],ppstgopen : IStorage* [In]
  fun StgOpenLayoutDocfile(pwcsdfname : LibC::LPWSTR, grfmode : UInt32, reserved : UInt32, ppstgopen : IStorage*) : HRESULT

  # Params # hglobal : LibC::IntPtrT [In],fdeleteonrelease : LibC::BOOL [In],ppstm : IStream* [In]
  fun CreateStreamOnHGlobal(hglobal : LibC::IntPtrT, fdeleteonrelease : LibC::BOOL, ppstm : IStream*) : HRESULT

  # Params # pstm : IStream [In],phglobal : LibC::IntPtrT* [In]
  fun GetHGlobalFromStream(pstm : IStream, phglobal : LibC::IntPtrT*) : HRESULT

  # Params # pstm : IStream [In],iid : Guid* [In],ppv : Void** [In]
  fun CoGetInterfaceAndReleaseStream(pstm : IStream, iid : Guid*, ppv : Void**) : HRESULT

  # Params # pvardest : PROPVARIANT* [In],pvarsrc : PROPVARIANT* [In]
  fun PropVariantCopy(pvardest : PROPVARIANT*, pvarsrc : PROPVARIANT*) : HRESULT

  # Params # pvar : PROPVARIANT* [In]
  fun PropVariantClear(pvar : PROPVARIANT*) : HRESULT

  # Params # cvariants : UInt32 [In],rgvars : PROPVARIANT* [In]
  fun FreePropVariantArray(cvariants : UInt32, rgvars : PROPVARIANT*) : HRESULT

  # Params # pwcsname : LibC::LPWSTR [In],grfmode : UInt32 [In],reserved : UInt32 [In],ppstgopen : IStorage* [In]
  fun StgCreateDocfile(pwcsname : LibC::LPWSTR, grfmode : UInt32, reserved : UInt32, ppstgopen : IStorage*) : HRESULT

  # Params # plkbyt : ILockBytes [In],grfmode : UInt32 [In],reserved : UInt32 [In],ppstgopen : IStorage* [In]
  fun StgCreateDocfileOnILockBytes(plkbyt : ILockBytes, grfmode : UInt32, reserved : UInt32, ppstgopen : IStorage*) : HRESULT

  # Params # pwcsname : LibC::LPWSTR [In],pstgpriority : IStorage [In],grfmode : UInt32 [In],snbexclude : UInt16** [In],reserved : UInt32 [In],ppstgopen : IStorage* [In]
  fun StgOpenStorage(pwcsname : LibC::LPWSTR, pstgpriority : IStorage, grfmode : UInt32, snbexclude : UInt16**, reserved : UInt32, ppstgopen : IStorage*) : HRESULT

  # Params # plkbyt : ILockBytes [In],pstgpriority : IStorage [In],grfmode : UInt32 [In],snbexclude : UInt16** [In],reserved : UInt32 [In],ppstgopen : IStorage* [In]
  fun StgOpenStorageOnILockBytes(plkbyt : ILockBytes, pstgpriority : IStorage, grfmode : UInt32, snbexclude : UInt16**, reserved : UInt32, ppstgopen : IStorage*) : HRESULT

  # Params # pwcsname : LibC::LPWSTR [In]
  fun StgIsStorageFile(pwcsname : LibC::LPWSTR) : HRESULT

  # Params # plkbyt : ILockBytes [In]
  fun StgIsStorageILockBytes(plkbyt : ILockBytes) : HRESULT

  # Params # lpszname : LibC::LPWSTR [In],pctime : FILETIME* [In],patime : FILETIME* [In],pmtime : FILETIME* [In]
  fun StgSetTimes(lpszname : LibC::LPWSTR, pctime : FILETIME*, patime : FILETIME*, pmtime : FILETIME*) : HRESULT

  # Params # pwcsname : LibC::LPWSTR [In],grfmode : UInt32 [In],stgfmt : UInt32 [In],grfattrs : UInt32 [In],pstgoptions : STGOPTIONS* [In],psecuritydescriptor : SECURITY_DESCRIPTOR* [In],riid : Guid* [In],ppobjectopen : Void** [In]
  fun StgCreateStorageEx(pwcsname : LibC::LPWSTR, grfmode : UInt32, stgfmt : UInt32, grfattrs : UInt32, pstgoptions : STGOPTIONS*, psecuritydescriptor : SECURITY_DESCRIPTOR*, riid : Guid*, ppobjectopen : Void**) : HRESULT

  # Params # pwcsname : LibC::LPWSTR [In],grfmode : UInt32 [In],stgfmt : UInt32 [In],grfattrs : UInt32 [In],pstgoptions : STGOPTIONS* [In],psecuritydescriptor : SECURITY_DESCRIPTOR* [In],riid : Guid* [In],ppobjectopen : Void** [In]
  fun StgOpenStorageEx(pwcsname : LibC::LPWSTR, grfmode : UInt32, stgfmt : UInt32, grfattrs : UInt32, pstgoptions : STGOPTIONS*, psecuritydescriptor : SECURITY_DESCRIPTOR*, riid : Guid*, ppobjectopen : Void**) : HRESULT

  # Params # punk : IUnknown [In],fmtid : Guid* [In],pclsid : Guid* [In],grfflags : UInt32 [In],dwreserved : UInt32 [In],pppropstg : IPropertyStorage* [In]
  fun StgCreatePropStg(punk : IUnknown, fmtid : Guid*, pclsid : Guid*, grfflags : UInt32, dwreserved : UInt32, pppropstg : IPropertyStorage*) : HRESULT

  # Params # punk : IUnknown [In],fmtid : Guid* [In],grfflags : UInt32 [In],dwreserved : UInt32 [In],pppropstg : IPropertyStorage* [In]
  fun StgOpenPropStg(punk : IUnknown, fmtid : Guid*, grfflags : UInt32, dwreserved : UInt32, pppropstg : IPropertyStorage*) : HRESULT

  # Params # pstorage : IStorage [In],dwreserved : UInt32 [In],pppropsetstg : IPropertySetStorage* [In]
  fun StgCreatePropSetStg(pstorage : IStorage, dwreserved : UInt32, pppropsetstg : IPropertySetStorage*) : HRESULT

  # Params # pfmtid : Guid* [In],oszname : LibC::LPWSTR [In]
  fun FmtIdToPropStgName(pfmtid : Guid*, oszname : LibC::LPWSTR) : HRESULT

  # Params # oszname : LibC::LPWSTR [In],pfmtid : Guid* [In]
  fun PropStgNameToFmtId(oszname : LibC::LPWSTR, pfmtid : Guid*) : HRESULT

  # Params # pstg : IStorage [In],pclsid : Guid* [In]
  fun ReadClassStg(pstg : IStorage, pclsid : Guid*) : HRESULT

  # Params # pstg : IStorage [In],rclsid : Guid* [In]
  fun WriteClassStg(pstg : IStorage, rclsid : Guid*) : HRESULT

  # Params # pstm : IStream [In],pclsid : Guid* [In]
  fun ReadClassStm(pstm : IStream, pclsid : Guid*) : HRESULT

  # Params # pstm : IStream [In],rclsid : Guid* [In]
  fun WriteClassStm(pstm : IStream, rclsid : Guid*) : HRESULT

  # Params # plkbyt : ILockBytes [In],phglobal : LibC::IntPtrT* [In]
  fun GetHGlobalFromILockBytes(plkbyt : ILockBytes, phglobal : LibC::IntPtrT*) : HRESULT

  # Params # hglobal : LibC::IntPtrT [In],fdeleteonrelease : LibC::BOOL [In],pplkbyt : ILockBytes* [In]
  fun CreateILockBytesOnHGlobal(hglobal : LibC::IntPtrT, fdeleteonrelease : LibC::BOOL, pplkbyt : ILockBytes*) : HRESULT

  # Params # pstg : IStorage [In]
  fun GetConvertStg(pstg : IStorage) : HRESULT

  # Params # pvar : PROPVARIANT* [In],codepage : UInt16 [In],pprop : SERIALIZEDPROPERTYVALUE* [In],pcb : UInt32* [In],pid : UInt32 [In],freserved : BOOLEAN [In],pcindirect : UInt32* [In]
  fun StgConvertVariantToProperty(pvar : PROPVARIANT*, codepage : UInt16, pprop : SERIALIZEDPROPERTYVALUE*, pcb : UInt32*, pid : UInt32, freserved : BOOLEAN, pcindirect : UInt32*) : SERIALIZEDPROPERTYVALUE*

  # Params # pprop : SERIALIZEDPROPERTYVALUE* [In],codepage : UInt16 [In],pvar : PROPVARIANT* [In],pma : PMemoryAllocator* [In]
  fun StgConvertPropertyToVariant(pprop : SERIALIZEDPROPERTYVALUE*, codepage : UInt16, pvar : PROPVARIANT*, pma : PMemoryAllocator*) : BOOLEAN

  # Params # pprop : SERIALIZEDPROPERTYVALUE* [In],cbprop : UInt32 [In],codepage : UInt16 [In],breserved : UInt8 [In]
  fun StgPropertyLengthAsVariant(pprop : SERIALIZEDPROPERTYVALUE*, cbprop : UInt32, codepage : UInt16, breserved : UInt8) : UInt32

  # Params # pstg : IStorage [In],cf : UInt16 [In],lpszusertype : LibC::LPWSTR [In]
  fun WriteFmtUserTypeStg(pstg : IStorage, cf : UInt16, lpszusertype : LibC::LPWSTR) : HRESULT

  # Params # pstg : IStorage [In],pcf : UInt16* [In],lplpszusertype : LibC::LPWSTR* [In]
  fun ReadFmtUserTypeStg(pstg : IStorage, pcf : UInt16*, lplpszusertype : LibC::LPWSTR*) : HRESULT

  # Params # lpolestream : OLESTREAM* [In],pstg : IStorage [In],ptd : DVTARGETDEVICE* [In]
  fun OleConvertOLESTREAMToIStorage(lpolestream : OLESTREAM*, pstg : IStorage, ptd : DVTARGETDEVICE*) : HRESULT

  # Params # pstg : IStorage [In],lpolestream : OLESTREAM* [In]
  fun OleConvertIStorageToOLESTREAM(pstg : IStorage, lpolestream : OLESTREAM*) : HRESULT

  # Params # pstg : IStorage [In],fconvert : LibC::BOOL [In]
  fun SetConvertStg(pstg : IStorage, fconvert : LibC::BOOL) : HRESULT

  # Params # pstg : IStorage [In],cfformat : UInt16 [In],lwidth : Int32 [In],lheight : Int32 [In],dwsize : UInt32 [In],pmedium : STGMEDIUM* [In],polestm : OLESTREAM* [In]
  fun OleConvertIStorageToOLESTREAMEx(pstg : IStorage, cfformat : UInt16, lwidth : Int32, lheight : Int32, dwsize : UInt32, pmedium : STGMEDIUM*, polestm : OLESTREAM*) : HRESULT

  # Params # polestm : OLESTREAM* [In],pstg : IStorage [In],pcfformat : UInt16* [In],plwwidth : Int32* [In],plheight : Int32* [In],pdwsize : UInt32* [In],pmedium : STGMEDIUM* [In]
  fun OleConvertOLESTREAMToIStorageEx(polestm : OLESTREAM*, pstg : IStorage, pcfformat : UInt16*, plwwidth : Int32*, plheight : Int32*, pdwsize : UInt32*, pmedium : STGMEDIUM*) : HRESULT

  # Params # ppropvar : PROPVARIANT* [In],ppprop : SERIALIZEDPROPERTYVALUE** [In],pcb : UInt32* [In]
  fun StgSerializePropVariant(ppropvar : PROPVARIANT*, ppprop : SERIALIZEDPROPERTYVALUE**, pcb : UInt32*) : HRESULT

  # Params # pprop : SERIALIZEDPROPERTYVALUE* [In],cbmax : UInt32 [In],ppropvar : PROPVARIANT* [In]
  fun StgDeserializePropVariant(pprop : SERIALIZEDPROPERTYVALUE*, cbmax : UInt32, ppropvar : PROPVARIANT*) : HRESULT
end
struct LibWin32::IEnumSTATSTG
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(celt : UInt32, rgelt : STATSTG*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, STATSTG*, UInt32*, HRESULT)).call(celt, rgelt, pceltfetched)
  end
  def skip(celt : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(celt)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenum : IEnumSTATSTG*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumSTATSTG*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::IStorage
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_stream(pwcsname : LibC::LPWSTR, grfmode : UInt32, reserved1 : UInt32, reserved2 : UInt32, ppstm : IStream*) : HRESULT
    @lpVtbl.value.create_stream.unsafe_as(Proc(LibC::LPWSTR, UInt32, UInt32, UInt32, IStream*, HRESULT)).call(pwcsname, grfmode, reserved1, reserved2, ppstm)
  end
  def open_stream(pwcsname : LibC::LPWSTR, reserved1 : Void*, grfmode : UInt32, reserved2 : UInt32, ppstm : IStream*) : HRESULT
    @lpVtbl.value.open_stream.unsafe_as(Proc(LibC::LPWSTR, Void*, UInt32, UInt32, IStream*, HRESULT)).call(pwcsname, reserved1, grfmode, reserved2, ppstm)
  end
  def create_storage(pwcsname : LibC::LPWSTR, grfmode : UInt32, reserved1 : UInt32, reserved2 : UInt32, ppstg : IStorage*) : HRESULT
    @lpVtbl.value.create_storage.unsafe_as(Proc(LibC::LPWSTR, UInt32, UInt32, UInt32, IStorage*, HRESULT)).call(pwcsname, grfmode, reserved1, reserved2, ppstg)
  end
  def open_storage(pwcsname : LibC::LPWSTR, pstgpriority : IStorage, grfmode : UInt32, snbexclude : UInt16**, reserved : UInt32, ppstg : IStorage*) : HRESULT
    @lpVtbl.value.open_storage.unsafe_as(Proc(LibC::LPWSTR, IStorage, UInt32, UInt16**, UInt32, IStorage*, HRESULT)).call(pwcsname, pstgpriority, grfmode, snbexclude, reserved, ppstg)
  end
  def copy_to(ciidexclude : UInt32, rgiidexclude : Guid*, snbexclude : UInt16**, pstgdest : IStorage) : HRESULT
    @lpVtbl.value.copy_to.unsafe_as(Proc(UInt32, Guid*, UInt16**, IStorage, HRESULT)).call(ciidexclude, rgiidexclude, snbexclude, pstgdest)
  end
  def move_element_to(pwcsname : LibC::LPWSTR, pstgdest : IStorage, pwcsnewname : LibC::LPWSTR, grfflags : UInt32) : HRESULT
    @lpVtbl.value.move_element_to.unsafe_as(Proc(LibC::LPWSTR, IStorage, LibC::LPWSTR, UInt32, HRESULT)).call(pwcsname, pstgdest, pwcsnewname, grfflags)
  end
  def commit(grfcommitflags : UInt32) : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(UInt32, HRESULT)).call(grfcommitflags)
  end
  def revert : HRESULT
    @lpVtbl.value.revert.unsafe_as(Proc(HRESULT)).call
  end
  def enum_elements(reserved1 : UInt32, reserved2 : Void*, reserved3 : UInt32, ppenum : IEnumSTATSTG*) : HRESULT
    @lpVtbl.value.enum_elements.unsafe_as(Proc(UInt32, Void*, UInt32, IEnumSTATSTG*, HRESULT)).call(reserved1, reserved2, reserved3, ppenum)
  end
  def destroy_element(pwcsname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.destroy_element.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwcsname)
  end
  def rename_element(pwcsoldname : LibC::LPWSTR, pwcsnewname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.rename_element.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(pwcsoldname, pwcsnewname)
  end
  def set_element_times(pwcsname : LibC::LPWSTR, pctime : FILETIME*, patime : FILETIME*, pmtime : FILETIME*) : HRESULT
    @lpVtbl.value.set_element_times.unsafe_as(Proc(LibC::LPWSTR, FILETIME*, FILETIME*, FILETIME*, HRESULT)).call(pwcsname, pctime, patime, pmtime)
  end
  def set_class(clsid : Guid*) : HRESULT
    @lpVtbl.value.set_class.unsafe_as(Proc(Guid*, HRESULT)).call(clsid)
  end
  def set_state_bits(grfstatebits : UInt32, grfmask : UInt32) : HRESULT
    @lpVtbl.value.set_state_bits.unsafe_as(Proc(UInt32, UInt32, HRESULT)).call(grfstatebits, grfmask)
  end
  def stat(pstatstg : STATSTG*, grfstatflag : UInt32) : HRESULT
    @lpVtbl.value.stat.unsafe_as(Proc(STATSTG*, UInt32, HRESULT)).call(pstatstg, grfstatflag)
  end
end
struct LibWin32::IPersistStorage
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_class_id(pclassid : Guid*) : HRESULT
    @lpVtbl.value.get_class_id.unsafe_as(Proc(Guid*, HRESULT)).call(pclassid)
  end
  def is_dirty : HRESULT
    @lpVtbl.value.is_dirty.unsafe_as(Proc(HRESULT)).call
  end
  def init_new(pstg : IStorage) : HRESULT
    @lpVtbl.value.init_new.unsafe_as(Proc(IStorage, HRESULT)).call(pstg)
  end
  def load(pstg : IStorage) : HRESULT
    @lpVtbl.value.load.unsafe_as(Proc(IStorage, HRESULT)).call(pstg)
  end
  def save(pstgsave : IStorage, fsameasload : LibC::BOOL) : HRESULT
    @lpVtbl.value.save.unsafe_as(Proc(IStorage, LibC::BOOL, HRESULT)).call(pstgsave, fsameasload)
  end
  def save_completed(pstgnew : IStorage) : HRESULT
    @lpVtbl.value.save_completed.unsafe_as(Proc(IStorage, HRESULT)).call(pstgnew)
  end
  def hands_off_storage : HRESULT
    @lpVtbl.value.hands_off_storage.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ILockBytes
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def read_at(uloffset : ULARGE_INTEGER, pv : Void*, cb : UInt32, pcbread : UInt32*) : HRESULT
    @lpVtbl.value.read_at.unsafe_as(Proc(ULARGE_INTEGER, Void*, UInt32, UInt32*, HRESULT)).call(uloffset, pv, cb, pcbread)
  end
  def write_at(uloffset : ULARGE_INTEGER, pv : Void*, cb : UInt32, pcbwritten : UInt32*) : HRESULT
    @lpVtbl.value.write_at.unsafe_as(Proc(ULARGE_INTEGER, Void*, UInt32, UInt32*, HRESULT)).call(uloffset, pv, cb, pcbwritten)
  end
  def flush : HRESULT
    @lpVtbl.value.flush.unsafe_as(Proc(HRESULT)).call
  end
  def set_size(cb : ULARGE_INTEGER) : HRESULT
    @lpVtbl.value.set_size.unsafe_as(Proc(ULARGE_INTEGER, HRESULT)).call(cb)
  end
  def lock_region(liboffset : ULARGE_INTEGER, cb : ULARGE_INTEGER, dwlocktype : UInt32) : HRESULT
    @lpVtbl.value.lock_region.unsafe_as(Proc(ULARGE_INTEGER, ULARGE_INTEGER, UInt32, HRESULT)).call(liboffset, cb, dwlocktype)
  end
  def unlock_region(liboffset : ULARGE_INTEGER, cb : ULARGE_INTEGER, dwlocktype : UInt32) : HRESULT
    @lpVtbl.value.unlock_region.unsafe_as(Proc(ULARGE_INTEGER, ULARGE_INTEGER, UInt32, HRESULT)).call(liboffset, cb, dwlocktype)
  end
  def stat(pstatstg : STATSTG*, grfstatflag : UInt32) : HRESULT
    @lpVtbl.value.stat.unsafe_as(Proc(STATSTG*, UInt32, HRESULT)).call(pstatstg, grfstatflag)
  end
end
struct LibWin32::IRootStorage
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def switch_to_file(pszfile : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.switch_to_file.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pszfile)
  end
end
struct LibWin32::IFillLockBytes
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def fill_append(pv : Void*, cb : UInt32, pcbwritten : UInt32*) : HRESULT
    @lpVtbl.value.fill_append.unsafe_as(Proc(Void*, UInt32, UInt32*, HRESULT)).call(pv, cb, pcbwritten)
  end
  def fill_at(uloffset : ULARGE_INTEGER, pv : Void*, cb : UInt32, pcbwritten : UInt32*) : HRESULT
    @lpVtbl.value.fill_at.unsafe_as(Proc(ULARGE_INTEGER, Void*, UInt32, UInt32*, HRESULT)).call(uloffset, pv, cb, pcbwritten)
  end
  def set_fill_size(ulsize : ULARGE_INTEGER) : HRESULT
    @lpVtbl.value.set_fill_size.unsafe_as(Proc(ULARGE_INTEGER, HRESULT)).call(ulsize)
  end
  def terminate(bcanceled : LibC::BOOL) : HRESULT
    @lpVtbl.value.terminate.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(bcanceled)
  end
end
struct LibWin32::ILayoutStorage
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def layout_script(pstoragelayout : StorageLayout*, nentries : UInt32, glfinterleavedflag : UInt32) : HRESULT
    @lpVtbl.value.layout_script.unsafe_as(Proc(StorageLayout*, UInt32, UInt32, HRESULT)).call(pstoragelayout, nentries, glfinterleavedflag)
  end
  def begin_monitor : HRESULT
    @lpVtbl.value.begin_monitor.unsafe_as(Proc(HRESULT)).call
  end
  def end_monitor : HRESULT
    @lpVtbl.value.end_monitor.unsafe_as(Proc(HRESULT)).call
  end
  def re_layout_docfile(pwcsnewdfname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.re_layout_docfile.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwcsnewdfname)
  end
  def re_layout_docfile_on_i_lock_bytes(pilockbytes : ILockBytes) : HRESULT
    @lpVtbl.value.re_layout_docfile_on_i_lock_bytes.unsafe_as(Proc(ILockBytes, HRESULT)).call(pilockbytes)
  end
end
struct LibWin32::IDirectWriterLock
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def wait_for_write_access(dwtimeout : UInt32) : HRESULT
    @lpVtbl.value.wait_for_write_access.unsafe_as(Proc(UInt32, HRESULT)).call(dwtimeout)
  end
  def release_write_access : HRESULT
    @lpVtbl.value.release_write_access.unsafe_as(Proc(HRESULT)).call
  end
  def have_write_access : HRESULT
    @lpVtbl.value.have_write_access.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IPropertyStorage
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def read_multiple(cpspec : UInt32, rgpspec : PROPSPEC*, rgpropvar : PROPVARIANT*) : HRESULT
    @lpVtbl.value.read_multiple.unsafe_as(Proc(UInt32, PROPSPEC*, PROPVARIANT*, HRESULT)).call(cpspec, rgpspec, rgpropvar)
  end
  def write_multiple(cpspec : UInt32, rgpspec : PROPSPEC*, rgpropvar : PROPVARIANT*, propidnamefirst : UInt32) : HRESULT
    @lpVtbl.value.write_multiple.unsafe_as(Proc(UInt32, PROPSPEC*, PROPVARIANT*, UInt32, HRESULT)).call(cpspec, rgpspec, rgpropvar, propidnamefirst)
  end
  def delete_multiple(cpspec : UInt32, rgpspec : PROPSPEC*) : HRESULT
    @lpVtbl.value.delete_multiple.unsafe_as(Proc(UInt32, PROPSPEC*, HRESULT)).call(cpspec, rgpspec)
  end
  def read_property_names(cpropid : UInt32, rgpropid : UInt32*, rglpwstrname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.read_property_names.unsafe_as(Proc(UInt32, UInt32*, LibC::LPWSTR*, HRESULT)).call(cpropid, rgpropid, rglpwstrname)
  end
  def write_property_names(cpropid : UInt32, rgpropid : UInt32*, rglpwstrname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.write_property_names.unsafe_as(Proc(UInt32, UInt32*, LibC::LPWSTR*, HRESULT)).call(cpropid, rgpropid, rglpwstrname)
  end
  def delete_property_names(cpropid : UInt32, rgpropid : UInt32*) : HRESULT
    @lpVtbl.value.delete_property_names.unsafe_as(Proc(UInt32, UInt32*, HRESULT)).call(cpropid, rgpropid)
  end
  def commit(grfcommitflags : UInt32) : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(UInt32, HRESULT)).call(grfcommitflags)
  end
  def revert : HRESULT
    @lpVtbl.value.revert.unsafe_as(Proc(HRESULT)).call
  end
  def enum(ppenum : IEnumSTATPROPSTG*) : HRESULT
    @lpVtbl.value.enum.unsafe_as(Proc(IEnumSTATPROPSTG*, HRESULT)).call(ppenum)
  end
  def set_times(pctime : FILETIME*, patime : FILETIME*, pmtime : FILETIME*) : HRESULT
    @lpVtbl.value.set_times.unsafe_as(Proc(FILETIME*, FILETIME*, FILETIME*, HRESULT)).call(pctime, patime, pmtime)
  end
  def set_class(clsid : Guid*) : HRESULT
    @lpVtbl.value.set_class.unsafe_as(Proc(Guid*, HRESULT)).call(clsid)
  end
  def stat(pstatpsstg : STATPROPSETSTG*) : HRESULT
    @lpVtbl.value.stat.unsafe_as(Proc(STATPROPSETSTG*, HRESULT)).call(pstatpsstg)
  end
end
struct LibWin32::IPropertySetStorage
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create(rfmtid : Guid*, pclsid : Guid*, grfflags : UInt32, grfmode : UInt32, ppprstg : IPropertyStorage*) : HRESULT
    @lpVtbl.value.create.unsafe_as(Proc(Guid*, Guid*, UInt32, UInt32, IPropertyStorage*, HRESULT)).call(rfmtid, pclsid, grfflags, grfmode, ppprstg)
  end
  def open(rfmtid : Guid*, grfmode : UInt32, ppprstg : IPropertyStorage*) : HRESULT
    @lpVtbl.value.open.unsafe_as(Proc(Guid*, UInt32, IPropertyStorage*, HRESULT)).call(rfmtid, grfmode, ppprstg)
  end
  def delete(rfmtid : Guid*) : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(Guid*, HRESULT)).call(rfmtid)
  end
  def enum(ppenum : IEnumSTATPROPSETSTG*) : HRESULT
    @lpVtbl.value.enum.unsafe_as(Proc(IEnumSTATPROPSETSTG*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::IEnumSTATPROPSTG
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(celt : UInt32, rgelt : STATPROPSTG*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, STATPROPSTG*, UInt32*, HRESULT)).call(celt, rgelt, pceltfetched)
  end
  def skip(celt : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(celt)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenum : IEnumSTATPROPSTG*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumSTATPROPSTG*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::IEnumSTATPROPSETSTG
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(celt : UInt32, rgelt : STATPROPSETSTG*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, STATPROPSETSTG*, UInt32*, HRESULT)).call(celt, rgelt, pceltfetched)
  end
  def skip(celt : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(celt)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenum : IEnumSTATPROPSETSTG*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumSTATPROPSETSTG*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::IPropertyBag
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def read(pszpropname : LibC::LPWSTR, pvar : VARIANT*, perrorlog : IErrorLog) : HRESULT
    @lpVtbl.value.read.unsafe_as(Proc(LibC::LPWSTR, VARIANT*, IErrorLog, HRESULT)).call(pszpropname, pvar, perrorlog)
  end
  def write(pszpropname : LibC::LPWSTR, pvar : VARIANT*) : HRESULT
    @lpVtbl.value.write.unsafe_as(Proc(LibC::LPWSTR, VARIANT*, HRESULT)).call(pszpropname, pvar)
  end
end
struct LibWin32::IPropertyBag2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def read(cproperties : UInt32, ppropbag : PROPBAG2*, perrlog : IErrorLog, pvarvalue : VARIANT*, phrerror : HRESULT*) : HRESULT
    @lpVtbl.value.read.unsafe_as(Proc(UInt32, PROPBAG2*, IErrorLog, VARIANT*, HRESULT*, HRESULT)).call(cproperties, ppropbag, perrlog, pvarvalue, phrerror)
  end
  def write(cproperties : UInt32, ppropbag : PROPBAG2*, pvarvalue : VARIANT*) : HRESULT
    @lpVtbl.value.write.unsafe_as(Proc(UInt32, PROPBAG2*, VARIANT*, HRESULT)).call(cproperties, ppropbag, pvarvalue)
  end
  def count_properties(pcproperties : UInt32*) : HRESULT
    @lpVtbl.value.count_properties.unsafe_as(Proc(UInt32*, HRESULT)).call(pcproperties)
  end
  def get_property_info(iproperty : UInt32, cproperties : UInt32, ppropbag : PROPBAG2*, pcproperties : UInt32*) : HRESULT
    @lpVtbl.value.get_property_info.unsafe_as(Proc(UInt32, UInt32, PROPBAG2*, UInt32*, HRESULT)).call(iproperty, cproperties, ppropbag, pcproperties)
  end
  def load_object(pstrname : LibC::LPWSTR, dwhint : UInt32, punkobject : IUnknown, perrlog : IErrorLog) : HRESULT
    @lpVtbl.value.load_object.unsafe_as(Proc(LibC::LPWSTR, UInt32, IUnknown, IErrorLog, HRESULT)).call(pstrname, dwhint, punkobject, perrlog)
  end
end
