require "../foundation.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:cabinet.dll")]
lib LibWin32
  INCLUDED_FCI = 1_u32
  A_NAME_IS_UTF = 128_u32
  A_EXEC = 64_u32
  INCLUDED_TYPES_FCI_FDI = 1_u32
  CB_MAX_DISK = 2147483647_i32
  CB_MAX_FILENAME = 256_u32
  CB_MAX_CABINET_NAME = 256_u32
  CB_MAX_CAB_PATH = 256_u32
  CB_MAX_DISK_NAME = 256_u32
  INCLUDED_FDI = 1_u32

  alias PFNFCIALLOC = Proc(UInt32, Void*)
  alias PFNFCIFREE = Proc(Void*, Void)
  alias PFNFCIOPEN = Proc(PSTR, Int32, Int32, Int32*, Void*, LibC::IntPtrT)
  alias PFNFCIREAD = Proc(LibC::IntPtrT, Void*, UInt32, Int32*, Void*, UInt32)
  alias PFNFCIWRITE = Proc(LibC::IntPtrT, Void*, UInt32, Int32*, Void*, UInt32)
  alias PFNFCICLOSE = Proc(LibC::IntPtrT, Int32*, Void*, Int32)
  alias PFNFCISEEK = Proc(LibC::IntPtrT, Int32, Int32, Int32*, Void*, Int32)
  alias PFNFCIDELETE = Proc(PSTR, Int32*, Void*, Int32)
  alias PFNFCIGETNEXTCABINET = Proc(CCAB*, UInt32, Void*, LibC::BOOL)
  alias PFNFCIFILEPLACED = Proc(CCAB*, PSTR, Int32, LibC::BOOL, Void*, Int32)
  alias PFNFCIGETOPENINFO = Proc(PSTR, UInt16*, UInt16*, UInt16*, Int32*, Void*, LibC::IntPtrT)
  alias PFNFCISTATUS = Proc(UInt32, UInt32, UInt32, Void*, Int32)
  alias PFNFCIGETTEMPFILE = Proc(PSTR, Int32, Void*, LibC::BOOL)
  alias PFNALLOC = Proc(UInt32, Void*)
  alias PFNFREE = Proc(Void*, Void)
  alias PFNOPEN = Proc(PSTR, Int32, Int32, LibC::IntPtrT)
  alias PFNREAD = Proc(LibC::IntPtrT, Void*, UInt32, UInt32)
  alias PFNWRITE = Proc(LibC::IntPtrT, Void*, UInt32, UInt32)
  alias PFNCLOSE = Proc(LibC::IntPtrT, Int32)
  alias PFNSEEK = Proc(LibC::IntPtrT, Int32, Int32, Int32)
  alias PFNFDIDECRYPT = Proc(FDIDECRYPT*, Int32)
  alias PFNFDINOTIFY = Proc(FDINOTIFICATIONTYPE, FDINOTIFICATION*, LibC::IntPtrT)


  enum FDICREATE_CPU_TYPE : UInt32
    Cpu80286 = 0
    Cpu80386 = 1
  end

  enum FCIERROR : Int32
    FCIERR_NONE = 0
    FCIERR_OPEN_SRC = 1
    FCIERR_READ_SRC = 2
    FCIERR_ALLOC_FAIL = 3
    FCIERR_TEMP_FILE = 4
    FCIERR_BAD_COMPR_TYPE = 5
    FCIERR_CAB_FILE = 6
    FCIERR_USER_ABORT = 7
    FCIERR_MCI_FAIL = 8
    FCIERR_CAB_FORMAT_LIMIT = 9
  end

  enum FDIERROR : Int32
    FDIERROR_NONE = 0
    FDIERROR_CABINET_NOT_FOUND = 1
    FDIERROR_NOT_A_CABINET = 2
    FDIERROR_UNKNOWN_CABINET_VERSION = 3
    FDIERROR_CORRUPT_CABINET = 4
    FDIERROR_ALLOC_FAIL = 5
    FDIERROR_BAD_COMPR_TYPE = 6
    FDIERROR_MDI_FAIL = 7
    FDIERROR_TARGET_FILE = 8
    FDIERROR_RESERVE_MISMATCH = 9
    FDIERROR_WRONG_CABINET = 10
    FDIERROR_USER_ABORT = 11
    FDIERROR_EOF = 12
  end

  enum FDIDECRYPTTYPE : Int32
    Fdidtnew_cabinet = 0
    Fdidtnew_folder = 1
    Fdidtdecrypt = 2
  end

  enum FDINOTIFICATIONTYPE : Int32
    Fdintcabinet_info = 0
    Fdintpartial_file = 1
    Fdintcopy_file = 2
    Fdintclose_file_info = 3
    Fdintnext_cabinet = 4
    Fdintenumerate = 5
  end

  union FDIDECRYPT_Anonymous_e__Union
    cabinet : FDIDECRYPT_Anonymous_e__Union_cabinet_e__Struct
    folder : FDIDECRYPT_Anonymous_e__Union_folder_e__Struct
    decrypt : FDIDECRYPT_Anonymous_e__Union_decrypt_e__Struct
  end

  struct ERF
    erf_oper : Int32
    erf_type : Int32
    f_error : LibC::BOOL
  end
  struct CCAB
    cb : UInt32
    cb_folder_thresh : UInt32
    cb_reserve_cf_header : UInt32
    cb_reserve_cf_folder : UInt32
    cb_reserve_cf_data : UInt32
    i_cab : Int32
    i_disk : Int32
    f_fail_on_incompressible : Int32
    set_id : UInt16
    sz_disk : CHAR[256]*
    sz_cab : CHAR[256]*
    sz_cab_path : CHAR[256]*
  end
  struct FDICABINETINFO
    cb_cabinet : Int32
    c_folders : UInt16
    c_files : UInt16
    set_id : UInt16
    i_cabinet : UInt16
    f_reserve : LibC::BOOL
    hasprev : LibC::BOOL
    hasnext : LibC::BOOL
  end
  struct FDIDECRYPT
    fdidt : FDIDECRYPTTYPE
    pv_user : Void*
    anonymous : FDIDECRYPT_Anonymous_e__Union
  end
  struct FDIDECRYPT_Anonymous_e__Union_decrypt_e__Struct
    p_data_reserve : Void*
    cb_data_reserve : UInt16
    pb_data : Void*
    cb_data : UInt16
    f_split : LibC::BOOL
    cb_partial : UInt16
  end
  struct FDIDECRYPT_Anonymous_e__Union_cabinet_e__Struct
    p_header_reserve : Void*
    cb_header_reserve : UInt16
    set_id : UInt16
    i_cabinet : Int32
  end
  struct FDIDECRYPT_Anonymous_e__Union_folder_e__Struct
    p_folder_reserve : Void*
    cb_folder_reserve : UInt16
    i_folder : UInt16
  end
  struct FDINOTIFICATION
    cb : Int32
    psz1 : PSTR
    psz2 : PSTR
    psz3 : PSTR
    pv : Void*
    hf : LibC::IntPtrT
    date : UInt16
    time : UInt16
    attribs : UInt16
    set_id : UInt16
    i_cabinet : UInt16
    i_folder : UInt16
    fdie : FDIERROR
  end
  struct FDISPILLFILE
    ach : CHAR[2]*
    cb_file : Int32
  end


  # Params # perf : ERF* [In],pfnfcifp : PFNFCIFILEPLACED [In],pfna : PFNFCIALLOC [In],pfnf : PFNFCIFREE [In],pfnopen : PFNFCIOPEN [In],pfnread : PFNFCIREAD [In],pfnwrite : PFNFCIWRITE [In],pfnclose : PFNFCICLOSE [In],pfnseek : PFNFCISEEK [In],pfndelete : PFNFCIDELETE [In],pfnfcigtf : PFNFCIGETTEMPFILE [In],pccab : CCAB* [In],pv : Void* [In]
  fun FCICreate(perf : ERF*, pfnfcifp : PFNFCIFILEPLACED, pfna : PFNFCIALLOC, pfnf : PFNFCIFREE, pfnopen : PFNFCIOPEN, pfnread : PFNFCIREAD, pfnwrite : PFNFCIWRITE, pfnclose : PFNFCICLOSE, pfnseek : PFNFCISEEK, pfndelete : PFNFCIDELETE, pfnfcigtf : PFNFCIGETTEMPFILE, pccab : CCAB*, pv : Void*) : Void*

  # Params # hfci : Void* [In],pszsourcefile : PSTR [In],pszfilename : PSTR [In],fexecute : LibC::BOOL [In],pfnfcignc : PFNFCIGETNEXTCABINET [In],pfnfcis : PFNFCISTATUS [In],pfnfcigoi : PFNFCIGETOPENINFO [In],typecompress : UInt16 [In]
  fun FCIAddFile(hfci : Void*, pszsourcefile : PSTR, pszfilename : PSTR, fexecute : LibC::BOOL, pfnfcignc : PFNFCIGETNEXTCABINET, pfnfcis : PFNFCISTATUS, pfnfcigoi : PFNFCIGETOPENINFO, typecompress : UInt16) : LibC::BOOL

  # Params # hfci : Void* [In],fgetnextcab : LibC::BOOL [In],pfnfcignc : PFNFCIGETNEXTCABINET [In],pfnfcis : PFNFCISTATUS [In]
  fun FCIFlushCabinet(hfci : Void*, fgetnextcab : LibC::BOOL, pfnfcignc : PFNFCIGETNEXTCABINET, pfnfcis : PFNFCISTATUS) : LibC::BOOL

  # Params # hfci : Void* [In],pfnfcignc : PFNFCIGETNEXTCABINET [In],pfnfcis : PFNFCISTATUS [In]
  fun FCIFlushFolder(hfci : Void*, pfnfcignc : PFNFCIGETNEXTCABINET, pfnfcis : PFNFCISTATUS) : LibC::BOOL

  # Params # hfci : Void* [In]
  fun FCIDestroy(hfci : Void*) : LibC::BOOL

  # Params # pfnalloc : PFNALLOC [In],pfnfree : PFNFREE [In],pfnopen : PFNOPEN [In],pfnread : PFNREAD [In],pfnwrite : PFNWRITE [In],pfnclose : PFNCLOSE [In],pfnseek : PFNSEEK [In],cputype : FDICREATE_CPU_TYPE [In],perf : ERF* [In]
  fun FDICreate(pfnalloc : PFNALLOC, pfnfree : PFNFREE, pfnopen : PFNOPEN, pfnread : PFNREAD, pfnwrite : PFNWRITE, pfnclose : PFNCLOSE, pfnseek : PFNSEEK, cputype : FDICREATE_CPU_TYPE, perf : ERF*) : Void*

  # Params # hfdi : Void* [In],hf : LibC::IntPtrT [In],pfdici : FDICABINETINFO* [In]
  fun FDIIsCabinet(hfdi : Void*, hf : LibC::IntPtrT, pfdici : FDICABINETINFO*) : LibC::BOOL

  # Params # hfdi : Void* [In],pszcabinet : PSTR [In],pszcabpath : PSTR [In],flags : Int32 [In],pfnfdin : PFNFDINOTIFY [In],pfnfdid : PFNFDIDECRYPT [In],pvuser : Void* [In]
  fun FDICopy(hfdi : Void*, pszcabinet : PSTR, pszcabpath : PSTR, flags : Int32, pfnfdin : PFNFDINOTIFY, pfnfdid : PFNFDIDECRYPT, pvuser : Void*) : LibC::BOOL

  # Params # hfdi : Void* [In]
  fun FDIDestroy(hfdi : Void*) : LibC::BOOL

  # Params # hfdi : Void* [In],pszcabinetname : PSTR [In],ifoldertodelete : UInt16 [In]
  fun FDITruncateCabinet(hfdi : Void*, pszcabinetname : PSTR, ifoldertodelete : UInt16) : LibC::BOOL
end
