require "./../foundation.cr"

module Win32cr::Storage::Cabinets
  alias PFNFCIALLOC = Proc(UInt32, Void*)*

  alias PFNFCIFREE = Proc(Void*, Void)*

  alias PFNFCIOPEN = Proc(Win32cr::Foundation::PSTR, Int32, Int32, Int32*, Void*, LibC::IntPtrT)*

  alias PFNFCIREAD = Proc(LibC::IntPtrT, Void*, UInt32, Int32*, Void*, UInt32)*

  alias PFNFCIWRITE = Proc(LibC::IntPtrT, Void*, UInt32, Int32*, Void*, UInt32)*

  alias PFNFCICLOSE = Proc(LibC::IntPtrT, Int32*, Void*, Int32)*

  alias PFNFCISEEK = Proc(LibC::IntPtrT, Int32, Int32, Int32*, Void*, Int32)*

  alias PFNFCIDELETE = Proc(Win32cr::Foundation::PSTR, Int32*, Void*, Int32)*

  alias PFNFCIGETNEXTCABINET = Proc(Win32cr::Storage::Cabinets::CCAB*, UInt32, Void*, Win32cr::Foundation::BOOL)*

  alias PFNFCIFILEPLACED = Proc(Win32cr::Storage::Cabinets::CCAB*, Win32cr::Foundation::PSTR, Int32, Win32cr::Foundation::BOOL, Void*, Int32)*

  alias PFNFCIGETOPENINFO = Proc(Win32cr::Foundation::PSTR, UInt16*, UInt16*, UInt16*, Int32*, Void*, LibC::IntPtrT)*

  alias PFNFCISTATUS = Proc(UInt32, UInt32, UInt32, Void*, Int32)*

  alias PFNFCIGETTEMPFILE = Proc(Win32cr::Foundation::PSTR, Int32, Void*, Win32cr::Foundation::BOOL)*

  alias PFNALLOC = Proc(UInt32, Void*)*

  alias PFNFREE = Proc(Void*, Void)*

  alias PFNOPEN = Proc(Win32cr::Foundation::PSTR, Int32, Int32, LibC::IntPtrT)*

  alias PFNREAD = Proc(LibC::IntPtrT, Void*, UInt32, UInt32)*

  alias PFNWRITE = Proc(LibC::IntPtrT, Void*, UInt32, UInt32)*

  alias PFNCLOSE = Proc(LibC::IntPtrT, Int32)*

  alias PFNSEEK = Proc(LibC::IntPtrT, Int32, Int32, Int32)*

  alias PFNFDIDECRYPT = Proc(Win32cr::Storage::Cabinets::FDIDECRYPT*, Int32)*

  alias PFNFDINOTIFY = Proc(Win32cr::Storage::Cabinets::FDINOTIFICATIONTYPE, Win32cr::Storage::Cabinets::FDINOTIFICATION*, LibC::IntPtrT)*

  INCLUDED_FCI = 1_u32
  A_NAME_IS_UTF_ = 128_u32
  A_EXEC_ = 64_u32
  Statusfile = 0_u32
  Statusfolder = 1_u32
  Statuscabinet = 2_u32
  INCLUDED_TYPES_FCI_FDI = 1_u32
  CB_MAX_DISK = 2147483647_i32
  CB_MAX_FILENAME = 256_u32
  CB_MAX_CABINET_NAME = 256_u32
  CB_MAX_CAB_PATH = 256_u32
  CB_MAX_DISK_NAME = 256_u32
  Tcompmask_type = 15_u32
  Tcomptype_none = 0_u32
  Tcomptype_mszip = 1_u32
  Tcomptype_quantum = 2_u32
  Tcomptype_lzx = 3_u32
  Tcompbad = 15_u32
  Tcompmask_lzx_window = 7936_u32
  Tcomplzx_window_lo = 3840_u32
  Tcomplzx_window_hi = 5376_u32
  Tcompshift_lzx_window = 8_u32
  Tcompmask_quantum_level = 240_u32
  Tcompquantum_level_lo = 16_u32
  Tcompquantum_level_hi = 112_u32
  Tcompshift_quantum_level = 4_u32
  Tcompmask_quantum_mem = 7936_u32
  Tcompquantum_mem_lo = 2560_u32
  Tcompquantum_mem_hi = 5376_u32
  Tcompshift_quantum_mem = 8_u32
  Tcompmask_reserved = 57344_u32
  INCLUDED_FDI = 1_u32

  enum FDICREATE_CPU_TYPE
    Cpuunknown = -1_i32
    Cpu80286 = 0_i32
    Cpu80386 = 1_i32
  end
  enum FCIERROR
    FCIERR_NONE = 0_i32
    FCIERR_OPEN_SRC = 1_i32
    FCIERR_READ_SRC = 2_i32
    FCIERR_ALLOC_FAIL = 3_i32
    FCIERR_TEMP_FILE = 4_i32
    FCIERR_BAD_COMPR_TYPE = 5_i32
    FCIERR_CAB_FILE = 6_i32
    FCIERR_USER_ABORT = 7_i32
    FCIERR_MCI_FAIL = 8_i32
    FCIERR_CAB_FORMAT_LIMIT = 9_i32
  end
  enum FDIERROR
    FDIERROR_NONE = 0_i32
    FDIERROR_CABINET_NOT_FOUND = 1_i32
    FDIERROR_NOT_A_CABINET = 2_i32
    FDIERROR_UNKNOWN_CABINET_VERSION = 3_i32
    FDIERROR_CORRUPT_CABINET = 4_i32
    FDIERROR_ALLOC_FAIL = 5_i32
    FDIERROR_BAD_COMPR_TYPE = 6_i32
    FDIERROR_MDI_FAIL = 7_i32
    FDIERROR_TARGET_FILE = 8_i32
    FDIERROR_RESERVE_MISMATCH = 9_i32
    FDIERROR_WRONG_CABINET = 10_i32
    FDIERROR_USER_ABORT = 11_i32
    FDIERROR_EOF = 12_i32
  end
  enum FDIDECRYPTTYPE
    Fdidtnew_cabinet = 0_i32
    Fdidtnew_folder = 1_i32
    Fdidtdecrypt = 2_i32
  end
  enum FDINOTIFICATIONTYPE
    Fdintcabinet_info = 0_i32
    Fdintpartial_file = 1_i32
    Fdintcopy_file = 2_i32
    Fdintclose_file_info = 3_i32
    Fdintnext_cabinet = 4_i32
    Fdintenumerate = 5_i32
  end

  @[Extern]
  record ERF,
    erfOper : Int32,
    erfType : Int32,
    fError : Win32cr::Foundation::BOOL

  @[Extern]
  record CCAB,
    cb : UInt32,
    cbFolderThresh : UInt32,
    cbReserveCFHeader : UInt32,
    cbReserveCFFolder : UInt32,
    cbReserveCFData : UInt32,
    iCab : Int32,
    iDisk : Int32,
    fFailOnIncompressible : Int32,
    setID : UInt16,
    szDisk : Win32cr::Foundation::CHAR[256],
    szCab : Win32cr::Foundation::CHAR[256],
    szCabPath : Win32cr::Foundation::CHAR[256]

  @[Extern]
  record FDICABINETINFO,
    cbCabinet : Int32,
    cFolders : UInt16,
    cFiles : UInt16,
    setID : UInt16,
    iCabinet : UInt16,
    fReserve : Win32cr::Foundation::BOOL,
    hasprev : Win32cr::Foundation::BOOL,
    hasnext : Win32cr::Foundation::BOOL

  @[Extern]
  record FDIDECRYPT,
    fdidt : Win32cr::Storage::Cabinets::FDIDECRYPTTYPE,
    pvUser : Void*,
    anonymous : Anonymous_e__Union_ do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      cabinet : Cabinet_e__struct_,
      folder : Folder_e__struct_,
      decrypt : Decrypt_e__struct_ do

      # Nested Type Decrypt_e__struct_
      @[Extern]
      record Decrypt_e__struct_,
        pDataReserve : Void*,
        cbDataReserve : UInt16,
        pbData : Void*,
        cbData : UInt16,
        fSplit : Win32cr::Foundation::BOOL,
        cbPartial : UInt16


      # Nested Type Cabinet_e__struct_
      @[Extern]
      record Cabinet_e__struct_,
        pHeaderReserve : Void*,
        cbHeaderReserve : UInt16,
        setID : UInt16,
        iCabinet : Int32


      # Nested Type Folder_e__struct_
      @[Extern]
      record Folder_e__struct_,
        pFolderReserve : Void*,
        cbFolderReserve : UInt16,
        iFolder : UInt16

    end

  end

  @[Extern]
  record FDINOTIFICATION,
    cb : Int32,
    psz1 : Win32cr::Foundation::PSTR,
    psz2 : Win32cr::Foundation::PSTR,
    psz3 : Win32cr::Foundation::PSTR,
    pv : Void*,
    hf : LibC::IntPtrT,
    date : UInt16,
    time : UInt16,
    attribs : UInt16,
    setID : UInt16,
    iCabinet : UInt16,
    iFolder : UInt16,
    fdie : Win32cr::Storage::Cabinets::FDIERROR

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  record FDISPILLFILE,
    ach : Win32cr::Foundation::CHAR[2],
    cbFile : Int32
  {% end %}

  {% if flag?(:i386) %}
  @[Extern]
  record FDISPILLFILE,
    ach : Win32cr::Foundation::CHAR[2],
    cbFile : Int32
  {% end %}

  @[Link("cabinet")]
  lib C
    fun FCICreate(perf : Win32cr::Storage::Cabinets::ERF*, pfnfcifp : Win32cr::Storage::Cabinets::PFNFCIFILEPLACED, pfna : Win32cr::Storage::Cabinets::PFNFCIALLOC, pfnf : Win32cr::Storage::Cabinets::PFNFCIFREE, pfnopen : Win32cr::Storage::Cabinets::PFNFCIOPEN, pfnread : Win32cr::Storage::Cabinets::PFNFCIREAD, pfnwrite : Win32cr::Storage::Cabinets::PFNFCIWRITE, pfnclose : Win32cr::Storage::Cabinets::PFNFCICLOSE, pfnseek : Win32cr::Storage::Cabinets::PFNFCISEEK, pfndelete : Win32cr::Storage::Cabinets::PFNFCIDELETE, pfnfcigtf : Win32cr::Storage::Cabinets::PFNFCIGETTEMPFILE, pccab : Win32cr::Storage::Cabinets::CCAB*, pv : Void*) : Void*

    fun FCIAddFile(hfci : Void*, pszSourceFile : Win32cr::Foundation::PSTR, pszFileName : Win32cr::Foundation::PSTR, fExecute : Win32cr::Foundation::BOOL, pfnfcignc : Win32cr::Storage::Cabinets::PFNFCIGETNEXTCABINET, pfnfcis : Win32cr::Storage::Cabinets::PFNFCISTATUS, pfnfcigoi : Win32cr::Storage::Cabinets::PFNFCIGETOPENINFO, typeCompress : UInt16) : Win32cr::Foundation::BOOL

    fun FCIFlushCabinet(hfci : Void*, fGetNextCab : Win32cr::Foundation::BOOL, pfnfcignc : Win32cr::Storage::Cabinets::PFNFCIGETNEXTCABINET, pfnfcis : Win32cr::Storage::Cabinets::PFNFCISTATUS) : Win32cr::Foundation::BOOL

    fun FCIFlushFolder(hfci : Void*, pfnfcignc : Win32cr::Storage::Cabinets::PFNFCIGETNEXTCABINET, pfnfcis : Win32cr::Storage::Cabinets::PFNFCISTATUS) : Win32cr::Foundation::BOOL

    fun FCIDestroy(hfci : Void*) : Win32cr::Foundation::BOOL

    fun FDICreate(pfnalloc : Win32cr::Storage::Cabinets::PFNALLOC, pfnfree : Win32cr::Storage::Cabinets::PFNFREE, pfnopen : Win32cr::Storage::Cabinets::PFNOPEN, pfnread : Win32cr::Storage::Cabinets::PFNREAD, pfnwrite : Win32cr::Storage::Cabinets::PFNWRITE, pfnclose : Win32cr::Storage::Cabinets::PFNCLOSE, pfnseek : Win32cr::Storage::Cabinets::PFNSEEK, cpuType : Win32cr::Storage::Cabinets::FDICREATE_CPU_TYPE, perf : Win32cr::Storage::Cabinets::ERF*) : Void*

    fun FDIIsCabinet(hfdi : Void*, hf : LibC::IntPtrT, pfdici : Win32cr::Storage::Cabinets::FDICABINETINFO*) : Win32cr::Foundation::BOOL

    fun FDICopy(hfdi : Void*, pszCabinet : Win32cr::Foundation::PSTR, pszCabPath : Win32cr::Foundation::PSTR, flags : Int32, pfnfdin : Win32cr::Storage::Cabinets::PFNFDINOTIFY, pfnfdid : Win32cr::Storage::Cabinets::PFNFDIDECRYPT, pvUser : Void*) : Win32cr::Foundation::BOOL

    fun FDIDestroy(hfdi : Void*) : Win32cr::Foundation::BOOL

    fun FDITruncateCabinet(hfdi : Void*, pszCabinetName : Win32cr::Foundation::PSTR, iFolderToDelete : UInt16) : Win32cr::Foundation::BOOL

  end
end