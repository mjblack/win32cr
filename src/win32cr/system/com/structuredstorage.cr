require "../../system/com.cr"
require "../../foundation.cr"
require "../../security.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:ole32.dll")]
@[Link(ldflags: "/DELAYLOAD:dflayout.dll")]
@[Link(ldflags: "/DELAYLOAD:propsys.dll")]
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
    query_interface : Proc(IEnumSTATSTG*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumSTATSTG*, UInt32)
    release : Proc(IEnumSTATSTG*, UInt32)
    next : Proc(IEnumSTATSTG*, UInt32, STATSTG*, UInt32*, HRESULT)
    skip : Proc(IEnumSTATSTG*, UInt32, HRESULT)
    reset : Proc(IEnumSTATSTG*, HRESULT)
    clone : Proc(IEnumSTATSTG*, IEnumSTATSTG*, HRESULT)
  end

  struct IEnumSTATSTG
    lpVtbl : IEnumSTATSTGVTbl*
  end

  struct IStorageVTbl
    query_interface : Proc(IStorage*, Guid*, Void**, HRESULT)
    add_ref : Proc(IStorage*, UInt32)
    release : Proc(IStorage*, UInt32)
    create_stream : Proc(IStorage*, LibC::LPWSTR, UInt32, UInt32, UInt32, IStream*, HRESULT)
    open_stream : Proc(IStorage*, LibC::LPWSTR, Void*, UInt32, UInt32, IStream*, HRESULT)
    create_storage : Proc(IStorage*, LibC::LPWSTR, UInt32, UInt32, UInt32, IStorage*, HRESULT)
    open_storage : Proc(IStorage*, LibC::LPWSTR, IStorage, UInt32, UInt16**, UInt32, IStorage*, HRESULT)
    copy_to : Proc(IStorage*, UInt32, Guid*, UInt16**, IStorage, HRESULT)
    move_element_to : Proc(IStorage*, LibC::LPWSTR, IStorage, LibC::LPWSTR, UInt32, HRESULT)
    commit : Proc(IStorage*, UInt32, HRESULT)
    revert : Proc(IStorage*, HRESULT)
    enum_elements : Proc(IStorage*, UInt32, Void*, UInt32, IEnumSTATSTG*, HRESULT)
    destroy_element : Proc(IStorage*, LibC::LPWSTR, HRESULT)
    rename_element : Proc(IStorage*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    set_element_times : Proc(IStorage*, LibC::LPWSTR, FILETIME*, FILETIME*, FILETIME*, HRESULT)
    set_class : Proc(IStorage*, Guid*, HRESULT)
    set_state_bits : Proc(IStorage*, UInt32, UInt32, HRESULT)
    stat : Proc(IStorage*, STATSTG*, UInt32, HRESULT)
  end

  struct IStorage
    lpVtbl : IStorageVTbl*
  end

  struct IPersistStorageVTbl
    query_interface : Proc(IPersistStorage*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPersistStorage*, UInt32)
    release : Proc(IPersistStorage*, UInt32)
    get_class_id : Proc(IPersistStorage*, Guid*, HRESULT)
    is_dirty : Proc(IPersistStorage*, HRESULT)
    init_new : Proc(IPersistStorage*, IStorage, HRESULT)
    load : Proc(IPersistStorage*, IStorage, HRESULT)
    save : Proc(IPersistStorage*, IStorage, LibC::BOOL, HRESULT)
    save_completed : Proc(IPersistStorage*, IStorage, HRESULT)
    hands_off_storage : Proc(IPersistStorage*, HRESULT)
  end

  struct IPersistStorage
    lpVtbl : IPersistStorageVTbl*
  end

  struct ILockBytesVTbl
    query_interface : Proc(ILockBytes*, Guid*, Void**, HRESULT)
    add_ref : Proc(ILockBytes*, UInt32)
    release : Proc(ILockBytes*, UInt32)
    read_at : Proc(ILockBytes*, ULARGE_INTEGER, Void*, UInt32, UInt32*, HRESULT)
    write_at : Proc(ILockBytes*, ULARGE_INTEGER, Void*, UInt32, UInt32*, HRESULT)
    flush : Proc(ILockBytes*, HRESULT)
    set_size : Proc(ILockBytes*, ULARGE_INTEGER, HRESULT)
    lock_region : Proc(ILockBytes*, ULARGE_INTEGER, ULARGE_INTEGER, UInt32, HRESULT)
    unlock_region : Proc(ILockBytes*, ULARGE_INTEGER, ULARGE_INTEGER, UInt32, HRESULT)
    stat : Proc(ILockBytes*, STATSTG*, UInt32, HRESULT)
  end

  struct ILockBytes
    lpVtbl : ILockBytesVTbl*
  end

  struct IRootStorageVTbl
    query_interface : Proc(IRootStorage*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRootStorage*, UInt32)
    release : Proc(IRootStorage*, UInt32)
    switch_to_file : Proc(IRootStorage*, LibC::LPWSTR, HRESULT)
  end

  struct IRootStorage
    lpVtbl : IRootStorageVTbl*
  end

  struct IFillLockBytesVTbl
    query_interface : Proc(IFillLockBytes*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFillLockBytes*, UInt32)
    release : Proc(IFillLockBytes*, UInt32)
    fill_append : Proc(IFillLockBytes*, Void*, UInt32, UInt32*, HRESULT)
    fill_at : Proc(IFillLockBytes*, ULARGE_INTEGER, Void*, UInt32, UInt32*, HRESULT)
    set_fill_size : Proc(IFillLockBytes*, ULARGE_INTEGER, HRESULT)
    terminate : Proc(IFillLockBytes*, LibC::BOOL, HRESULT)
  end

  struct IFillLockBytes
    lpVtbl : IFillLockBytesVTbl*
  end

  struct ILayoutStorageVTbl
    query_interface : Proc(ILayoutStorage*, Guid*, Void**, HRESULT)
    add_ref : Proc(ILayoutStorage*, UInt32)
    release : Proc(ILayoutStorage*, UInt32)
    layout_script : Proc(ILayoutStorage*, StorageLayout*, UInt32, UInt32, HRESULT)
    begin_monitor : Proc(ILayoutStorage*, HRESULT)
    end_monitor : Proc(ILayoutStorage*, HRESULT)
    re_layout_docfile : Proc(ILayoutStorage*, LibC::LPWSTR, HRESULT)
    re_layout_docfile_on_i_lock_bytes : Proc(ILayoutStorage*, ILockBytes, HRESULT)
  end

  struct ILayoutStorage
    lpVtbl : ILayoutStorageVTbl*
  end

  struct IDirectWriterLockVTbl
    query_interface : Proc(IDirectWriterLock*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectWriterLock*, UInt32)
    release : Proc(IDirectWriterLock*, UInt32)
    wait_for_write_access : Proc(IDirectWriterLock*, UInt32, HRESULT)
    release_write_access : Proc(IDirectWriterLock*, HRESULT)
    have_write_access : Proc(IDirectWriterLock*, HRESULT)
  end

  struct IDirectWriterLock
    lpVtbl : IDirectWriterLockVTbl*
  end

  struct IPropertyStorageVTbl
    query_interface : Proc(IPropertyStorage*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPropertyStorage*, UInt32)
    release : Proc(IPropertyStorage*, UInt32)
    read_multiple : Proc(IPropertyStorage*, UInt32, PROPSPEC*, PROPVARIANT*, HRESULT)
    write_multiple : Proc(IPropertyStorage*, UInt32, PROPSPEC*, PROPVARIANT*, UInt32, HRESULT)
    delete_multiple : Proc(IPropertyStorage*, UInt32, PROPSPEC*, HRESULT)
    read_property_names : Proc(IPropertyStorage*, UInt32, UInt32*, LibC::LPWSTR*, HRESULT)
    write_property_names : Proc(IPropertyStorage*, UInt32, UInt32*, LibC::LPWSTR*, HRESULT)
    delete_property_names : Proc(IPropertyStorage*, UInt32, UInt32*, HRESULT)
    commit : Proc(IPropertyStorage*, UInt32, HRESULT)
    revert : Proc(IPropertyStorage*, HRESULT)
    enum : Proc(IPropertyStorage*, IEnumSTATPROPSTG*, HRESULT)
    set_times : Proc(IPropertyStorage*, FILETIME*, FILETIME*, FILETIME*, HRESULT)
    set_class : Proc(IPropertyStorage*, Guid*, HRESULT)
    stat : Proc(IPropertyStorage*, STATPROPSETSTG*, HRESULT)
  end

  struct IPropertyStorage
    lpVtbl : IPropertyStorageVTbl*
  end

  struct IPropertySetStorageVTbl
    query_interface : Proc(IPropertySetStorage*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPropertySetStorage*, UInt32)
    release : Proc(IPropertySetStorage*, UInt32)
    create : Proc(IPropertySetStorage*, Guid*, Guid*, UInt32, UInt32, IPropertyStorage*, HRESULT)
    open : Proc(IPropertySetStorage*, Guid*, UInt32, IPropertyStorage*, HRESULT)
    delete : Proc(IPropertySetStorage*, Guid*, HRESULT)
    enum : Proc(IPropertySetStorage*, IEnumSTATPROPSETSTG*, HRESULT)
  end

  struct IPropertySetStorage
    lpVtbl : IPropertySetStorageVTbl*
  end

  struct IEnumSTATPROPSTGVTbl
    query_interface : Proc(IEnumSTATPROPSTG*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumSTATPROPSTG*, UInt32)
    release : Proc(IEnumSTATPROPSTG*, UInt32)
    next : Proc(IEnumSTATPROPSTG*, UInt32, STATPROPSTG*, UInt32*, HRESULT)
    skip : Proc(IEnumSTATPROPSTG*, UInt32, HRESULT)
    reset : Proc(IEnumSTATPROPSTG*, HRESULT)
    clone : Proc(IEnumSTATPROPSTG*, IEnumSTATPROPSTG*, HRESULT)
  end

  struct IEnumSTATPROPSTG
    lpVtbl : IEnumSTATPROPSTGVTbl*
  end

  struct IEnumSTATPROPSETSTGVTbl
    query_interface : Proc(IEnumSTATPROPSETSTG*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumSTATPROPSETSTG*, UInt32)
    release : Proc(IEnumSTATPROPSETSTG*, UInt32)
    next : Proc(IEnumSTATPROPSETSTG*, UInt32, STATPROPSETSTG*, UInt32*, HRESULT)
    skip : Proc(IEnumSTATPROPSETSTG*, UInt32, HRESULT)
    reset : Proc(IEnumSTATPROPSETSTG*, HRESULT)
    clone : Proc(IEnumSTATPROPSETSTG*, IEnumSTATPROPSETSTG*, HRESULT)
  end

  struct IEnumSTATPROPSETSTG
    lpVtbl : IEnumSTATPROPSETSTGVTbl*
  end

  struct IPropertyBagVTbl
    query_interface : Proc(IPropertyBag*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPropertyBag*, UInt32)
    release : Proc(IPropertyBag*, UInt32)
    read : Proc(IPropertyBag*, LibC::LPWSTR, VARIANT*, IErrorLog, HRESULT)
    write : Proc(IPropertyBag*, LibC::LPWSTR, VARIANT*, HRESULT)
  end

  struct IPropertyBag
    lpVtbl : IPropertyBagVTbl*
  end

  struct IPropertyBag2VTbl
    query_interface : Proc(IPropertyBag2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPropertyBag2*, UInt32)
    release : Proc(IPropertyBag2*, UInt32)
    read : Proc(IPropertyBag2*, UInt32, PROPBAG2*, IErrorLog, VARIANT*, HRESULT*, HRESULT)
    write : Proc(IPropertyBag2*, UInt32, PROPBAG2*, VARIANT*, HRESULT)
    count_properties : Proc(IPropertyBag2*, UInt32*, HRESULT)
    get_property_info : Proc(IPropertyBag2*, UInt32, UInt32, PROPBAG2*, UInt32*, HRESULT)
    load_object : Proc(IPropertyBag2*, LibC::LPWSTR, UInt32, IUnknown, IErrorLog, HRESULT)
  end

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
