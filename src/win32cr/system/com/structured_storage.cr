require "./../com.cr"
require "./../../foundation.cr"
require "./../variant.cr"
require "./../../security.cr"

module Win32cr::System::Com::StructuredStorage
  extend self
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
  STGOPTIONS_VERSION = 1_u32
  CCH_MAX_PROPSTG_NAME = 31_u32

  enum PROPSPEC_KIND : UInt32
    PRSPEC_LPWSTR = 0_u32
    PRSPEC_PROPID = 1_u32
  end
  enum STGFMT : UInt32
    STGFMT_STORAGE = 0_u32
    STGFMT_NATIVE = 1_u32
    STGFMT_FILE = 3_u32
    STGFMT_ANY = 4_u32
    STGFMT_DOCFILE = 5_u32
    STGFMT_DOCUMENT = 0_u32
  end
  enum STGMOVE
    STGMOVE_MOVE = 0_i32
    STGMOVE_COPY = 1_i32
    STGMOVE_SHALLOWCOPY = 2_i32
  end
  enum PIDMSI_STATUS_VALUE
    PIDMSI_STATUS_NORMAL = 0_i32
    PIDMSI_STATUS_NEW = 1_i32
    PIDMSI_STATUS_PRELIM = 2_i32
    PIDMSI_STATUS_DRAFT = 3_i32
    PIDMSI_STATUS_INPROGRESS = 4_i32
    PIDMSI_STATUS_EDIT = 5_i32
    PIDMSI_STATUS_REVIEW = 6_i32
    PIDMSI_STATUS_PROOF = 7_i32
    PIDMSI_STATUS_FINAL = 8_i32
    PIDMSI_STATUS_OTHER = 32767_i32
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
  enum PROPVAR_COMPARE_FLAGS
    PVCF_DEFAULT = 0_i32
    PVCF_TREATEMPTYASGREATERTHAN = 1_i32
    PVCF_USESTRCMP = 2_i32
    PVCF_USESTRCMPC = 4_i32
    PVCF_USESTRCMPI = 8_i32
    PVCF_USESTRCMPIC = 16_i32
    PVCF_DIGITSASNUMBERS_CASESENSITIVE = 32_i32
  end
  @[Flags]
  enum PROPVAR_CHANGE_FLAGS
    PVCHF_DEFAULT = 0_i32
    PVCHF_NOVALUEPROP = 1_i32
    PVCHF_ALPHABOOL = 2_i32
    PVCHF_NOUSEROVERRIDE = 4_i32
    PVCHF_LOCALBOOL = 8_i32
    PVCHF_NOHEXSTRING = 16_i32
  end

  @[Extern]
  struct BSTRBLOB
    property cbSize : UInt32
    property pData : UInt8*
    def initialize(@cbSize : UInt32, @pData : UInt8*)
    end
  end

  @[Extern]
  struct CLIPDATA
    property cbSize : UInt32
    property ulClipFmt : Int32
    property pClipData : UInt8*
    def initialize(@cbSize : UInt32, @ulClipFmt : Int32, @pClipData : UInt8*)
    end
  end

  @[Extern]
  struct RemSNB
    property ulCntStr : UInt32
    property ulCntChar : UInt32
    property rgString : UInt16[1]
    def initialize(@ulCntStr : UInt32, @ulCntChar : UInt32, @rgString : UInt16[1])
    end
  end

  @[Extern]
  struct VERSIONEDSTREAM
    property guidVersion : LibC::GUID
    property pStream : Void*
    def initialize(@guidVersion : LibC::GUID, @pStream : Void*)
    end
  end

  @[Extern]
  struct CAC
    property cElems : UInt32
    property pElems : Win32cr::Foundation::PSTR
    def initialize(@cElems : UInt32, @pElems : Win32cr::Foundation::PSTR)
    end
  end

  @[Extern]
  struct CAUB
    property cElems : UInt32
    property pElems : UInt8*
    def initialize(@cElems : UInt32, @pElems : UInt8*)
    end
  end

  @[Extern]
  struct CAI
    property cElems : UInt32
    property pElems : Int16*
    def initialize(@cElems : UInt32, @pElems : Int16*)
    end
  end

  @[Extern]
  struct CAUI
    property cElems : UInt32
    property pElems : UInt16*
    def initialize(@cElems : UInt32, @pElems : UInt16*)
    end
  end

  @[Extern]
  struct CAL
    property cElems : UInt32
    property pElems : Int32*
    def initialize(@cElems : UInt32, @pElems : Int32*)
    end
  end

  @[Extern]
  struct CAUL
    property cElems : UInt32
    property pElems : UInt32*
    def initialize(@cElems : UInt32, @pElems : UInt32*)
    end
  end

  @[Extern]
  struct CAFLT
    property cElems : UInt32
    property pElems : Float32*
    def initialize(@cElems : UInt32, @pElems : Float32*)
    end
  end

  @[Extern]
  struct CADBL
    property cElems : UInt32
    property pElems : Float64*
    def initialize(@cElems : UInt32, @pElems : Float64*)
    end
  end

  @[Extern]
  struct CACY
    property cElems : UInt32
    property pElems : Win32cr::System::Com::CY*
    def initialize(@cElems : UInt32, @pElems : Win32cr::System::Com::CY*)
    end
  end

  @[Extern]
  struct CADATE
    property cElems : UInt32
    property pElems : Float64*
    def initialize(@cElems : UInt32, @pElems : Float64*)
    end
  end

  @[Extern]
  struct CABSTR
    property cElems : UInt32
    property pElems : Win32cr::Foundation::BSTR*
    def initialize(@cElems : UInt32, @pElems : Win32cr::Foundation::BSTR*)
    end
  end

  @[Extern]
  struct CABSTRBLOB
    property cElems : UInt32
    property pElems : Win32cr::System::Com::StructuredStorage::BSTRBLOB*
    def initialize(@cElems : UInt32, @pElems : Win32cr::System::Com::StructuredStorage::BSTRBLOB*)
    end
  end

  @[Extern]
  struct CABOOL
    property cElems : UInt32
    property pElems : Win32cr::Foundation::VARIANT_BOOL*
    def initialize(@cElems : UInt32, @pElems : Win32cr::Foundation::VARIANT_BOOL*)
    end
  end

  @[Extern]
  struct CASCODE
    property cElems : UInt32
    property pElems : Int32*
    def initialize(@cElems : UInt32, @pElems : Int32*)
    end
  end

  @[Extern]
  struct CAPROPVARIANT
    property cElems : UInt32
    property pElems : Win32cr::System::Com::StructuredStorage::PROPVARIANT*
    def initialize(@cElems : UInt32, @pElems : Win32cr::System::Com::StructuredStorage::PROPVARIANT*)
    end
  end

  @[Extern]
  struct CAH
    property cElems : UInt32
    property pElems : Int64*
    def initialize(@cElems : UInt32, @pElems : Int64*)
    end
  end

  @[Extern]
  struct CAUH
    property cElems : UInt32
    property pElems : UInt64*
    def initialize(@cElems : UInt32, @pElems : UInt64*)
    end
  end

  @[Extern]
  struct CALPSTR
    property cElems : UInt32
    property pElems : Win32cr::Foundation::PSTR*
    def initialize(@cElems : UInt32, @pElems : Win32cr::Foundation::PSTR*)
    end
  end

  @[Extern]
  struct CALPWSTR
    property cElems : UInt32
    property pElems : Win32cr::Foundation::PWSTR*
    def initialize(@cElems : UInt32, @pElems : Win32cr::Foundation::PWSTR*)
    end
  end

  @[Extern]
  struct CAFILETIME
    property cElems : UInt32
    property pElems : Win32cr::Foundation::FILETIME*
    def initialize(@cElems : UInt32, @pElems : Win32cr::Foundation::FILETIME*)
    end
  end

  @[Extern]
  struct CACLIPDATA
    property cElems : UInt32
    property pElems : Win32cr::System::Com::StructuredStorage::CLIPDATA*
    def initialize(@cElems : UInt32, @pElems : Win32cr::System::Com::StructuredStorage::CLIPDATA*)
    end
  end

  @[Extern]
  struct CACLSID
    property cElems : UInt32
    property pElems : LibC::GUID*
    def initialize(@cElems : UInt32, @pElems : LibC::GUID*)
    end
  end

  @[Extern]
  struct PROPVARIANT
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property anonymous : Anonymous_e__Struct_
    property decVal : Win32cr::Foundation::DECIMAL

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property vt : Win32cr::System::Variant::VARENUM
    property wReserved1 : UInt16
    property wReserved2 : UInt16
    property wReserved3 : UInt16
    property anonymous : Anonymous_e__Union_

        # Nested Type Anonymous_e__Union_
        @[Extern(union: true)]
        struct Anonymous_e__Union_
    property cVal : Win32cr::Foundation::CHAR
    property bVal : UInt8
    property iVal : Int16
    property uiVal : UInt16
    property lVal : Int32
    property ulVal : UInt32
    property intVal : Int32
    property uintVal : UInt32
    property hVal : Int64
    property uhVal : UInt64
    property fltVal : Float32
    property dblVal : Float64
    property boolVal : Win32cr::Foundation::VARIANT_BOOL
    property __obsolete__variant_bool : Win32cr::Foundation::VARIANT_BOOL
    property scode : Int32
    property cyVal : Win32cr::System::Com::CY
    property date : Float64
    property filetime : Win32cr::Foundation::FILETIME
    property puuid : LibC::GUID*
    property pclipdata : Win32cr::System::Com::StructuredStorage::CLIPDATA*
    property bstrVal : Win32cr::Foundation::BSTR
    property bstrblobVal : Win32cr::System::Com::StructuredStorage::BSTRBLOB
    property blob : Win32cr::System::Com::BLOB
    property pszVal : Win32cr::Foundation::PSTR
    property pwszVal : Win32cr::Foundation::PWSTR
    property punkVal : Void*
    property pdispVal : Void*
    property pStream : Void*
    property pStorage : Void*
    property pVersionedStream : Win32cr::System::Com::StructuredStorage::VERSIONEDSTREAM*
    property parray : Win32cr::System::Com::SAFEARRAY*
    property cac : Win32cr::System::Com::StructuredStorage::CAC
    property caub : Win32cr::System::Com::StructuredStorage::CAUB
    property cai : Win32cr::System::Com::StructuredStorage::CAI
    property caui : Win32cr::System::Com::StructuredStorage::CAUI
    property cal : Win32cr::System::Com::StructuredStorage::CAL
    property caul : Win32cr::System::Com::StructuredStorage::CAUL
    property cah : Win32cr::System::Com::StructuredStorage::CAH
    property cauh : Win32cr::System::Com::StructuredStorage::CAUH
    property caflt : Win32cr::System::Com::StructuredStorage::CAFLT
    property cadbl : Win32cr::System::Com::StructuredStorage::CADBL
    property cabool : Win32cr::System::Com::StructuredStorage::CABOOL
    property cascode : Win32cr::System::Com::StructuredStorage::CASCODE
    property cacy : Win32cr::System::Com::StructuredStorage::CACY
    property cadate : Win32cr::System::Com::StructuredStorage::CADATE
    property cafiletime : Win32cr::System::Com::StructuredStorage::CAFILETIME
    property cauuid : Win32cr::System::Com::StructuredStorage::CACLSID
    property caclipdata : Win32cr::System::Com::StructuredStorage::CACLIPDATA
    property cabstr : Win32cr::System::Com::StructuredStorage::CABSTR
    property cabstrblob : Win32cr::System::Com::StructuredStorage::CABSTRBLOB
    property calpstr : Win32cr::System::Com::StructuredStorage::CALPSTR
    property calpwstr : Win32cr::System::Com::StructuredStorage::CALPWSTR
    property capropvar : Win32cr::System::Com::StructuredStorage::CAPROPVARIANT
    property pcVal : Win32cr::Foundation::PSTR
    property pbVal : UInt8*
    property piVal : Int16*
    property puiVal : UInt16*
    property plVal : Int32*
    property pulVal : UInt32*
    property pintVal : Int32*
    property puintVal : UInt32*
    property pfltVal : Float32*
    property pdblVal : Float64*
    property pboolVal : Win32cr::Foundation::VARIANT_BOOL*
    property pdecVal : Win32cr::Foundation::DECIMAL*
    property pscode : Int32*
    property pcyVal : Win32cr::System::Com::CY*
    property pdate : Float64*
    property pbstrVal : Win32cr::Foundation::BSTR*
    property ppunkVal : Void**
    property ppdispVal : Void**
    property pparray : Win32cr::System::Com::SAFEARRAY**
    property pvarVal : Win32cr::System::Com::StructuredStorage::PROPVARIANT*
    def initialize(@cVal : Win32cr::Foundation::CHAR, @bVal : UInt8, @iVal : Int16, @uiVal : UInt16, @lVal : Int32, @ulVal : UInt32, @intVal : Int32, @uintVal : UInt32, @hVal : Int64, @uhVal : UInt64, @fltVal : Float32, @dblVal : Float64, @boolVal : Win32cr::Foundation::VARIANT_BOOL, @__obsolete__variant_bool : Win32cr::Foundation::VARIANT_BOOL, @scode : Int32, @cyVal : Win32cr::System::Com::CY, @date : Float64, @filetime : Win32cr::Foundation::FILETIME, @puuid : LibC::GUID*, @pclipdata : Win32cr::System::Com::StructuredStorage::CLIPDATA*, @bstrVal : Win32cr::Foundation::BSTR, @bstrblobVal : Win32cr::System::Com::StructuredStorage::BSTRBLOB, @blob : Win32cr::System::Com::BLOB, @pszVal : Win32cr::Foundation::PSTR, @pwszVal : Win32cr::Foundation::PWSTR, @punkVal : Void*, @pdispVal : Void*, @pStream : Void*, @pStorage : Void*, @pVersionedStream : Win32cr::System::Com::StructuredStorage::VERSIONEDSTREAM*, @parray : Win32cr::System::Com::SAFEARRAY*, @cac : Win32cr::System::Com::StructuredStorage::CAC, @caub : Win32cr::System::Com::StructuredStorage::CAUB, @cai : Win32cr::System::Com::StructuredStorage::CAI, @caui : Win32cr::System::Com::StructuredStorage::CAUI, @cal : Win32cr::System::Com::StructuredStorage::CAL, @caul : Win32cr::System::Com::StructuredStorage::CAUL, @cah : Win32cr::System::Com::StructuredStorage::CAH, @cauh : Win32cr::System::Com::StructuredStorage::CAUH, @caflt : Win32cr::System::Com::StructuredStorage::CAFLT, @cadbl : Win32cr::System::Com::StructuredStorage::CADBL, @cabool : Win32cr::System::Com::StructuredStorage::CABOOL, @cascode : Win32cr::System::Com::StructuredStorage::CASCODE, @cacy : Win32cr::System::Com::StructuredStorage::CACY, @cadate : Win32cr::System::Com::StructuredStorage::CADATE, @cafiletime : Win32cr::System::Com::StructuredStorage::CAFILETIME, @cauuid : Win32cr::System::Com::StructuredStorage::CACLSID, @caclipdata : Win32cr::System::Com::StructuredStorage::CACLIPDATA, @cabstr : Win32cr::System::Com::StructuredStorage::CABSTR, @cabstrblob : Win32cr::System::Com::StructuredStorage::CABSTRBLOB, @calpstr : Win32cr::System::Com::StructuredStorage::CALPSTR, @calpwstr : Win32cr::System::Com::StructuredStorage::CALPWSTR, @capropvar : Win32cr::System::Com::StructuredStorage::CAPROPVARIANT, @pcVal : Win32cr::Foundation::PSTR, @pbVal : UInt8*, @piVal : Int16*, @puiVal : UInt16*, @plVal : Int32*, @pulVal : UInt32*, @pintVal : Int32*, @puintVal : UInt32*, @pfltVal : Float32*, @pdblVal : Float64*, @pboolVal : Win32cr::Foundation::VARIANT_BOOL*, @pdecVal : Win32cr::Foundation::DECIMAL*, @pscode : Int32*, @pcyVal : Win32cr::System::Com::CY*, @pdate : Float64*, @pbstrVal : Win32cr::Foundation::BSTR*, @ppunkVal : Void**, @ppdispVal : Void**, @pparray : Win32cr::System::Com::SAFEARRAY**, @pvarVal : Win32cr::System::Com::StructuredStorage::PROPVARIANT*)
    end
        end

    def initialize(@vt : Win32cr::System::Variant::VARENUM, @wReserved1 : UInt16, @wReserved2 : UInt16, @wReserved3 : UInt16, @anonymous : Anonymous_e__Union_)
    end
      end

    def initialize(@anonymous : Anonymous_e__Struct_, @decVal : Win32cr::Foundation::DECIMAL)
    end
    end

    def initialize(@anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct PROPSPEC
    property ulKind : Win32cr::System::Com::StructuredStorage::PROPSPEC_KIND
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property propid : UInt32
    property lpwstr : Win32cr::Foundation::PWSTR
    def initialize(@propid : UInt32, @lpwstr : Win32cr::Foundation::PWSTR)
    end
    end

    def initialize(@ulKind : Win32cr::System::Com::StructuredStorage::PROPSPEC_KIND, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct STATPROPSTG
    property lpwstrName : Win32cr::Foundation::PWSTR
    property propid : UInt32
    property vt : Win32cr::System::Variant::VARENUM
    def initialize(@lpwstrName : Win32cr::Foundation::PWSTR, @propid : UInt32, @vt : Win32cr::System::Variant::VARENUM)
    end
  end

  @[Extern]
  struct STATPROPSETSTG
    property fmtid : LibC::GUID
    property clsid : LibC::GUID
    property grfFlags : UInt32
    property mtime : Win32cr::Foundation::FILETIME
    property ctime : Win32cr::Foundation::FILETIME
    property atime : Win32cr::Foundation::FILETIME
    property dwOSVersion : UInt32
    def initialize(@fmtid : LibC::GUID, @clsid : LibC::GUID, @grfFlags : UInt32, @mtime : Win32cr::Foundation::FILETIME, @ctime : Win32cr::Foundation::FILETIME, @atime : Win32cr::Foundation::FILETIME, @dwOSVersion : UInt32)
    end
  end

  @[Extern]
  struct STGOPTIONS
    property usVersion : UInt16
    property reserved : UInt16
    property ulSectorSize : UInt32
    property pwcsTemplateFile : Win32cr::Foundation::PWSTR
    def initialize(@usVersion : UInt16, @reserved : UInt16, @ulSectorSize : UInt32, @pwcsTemplateFile : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct SERIALIZEDPROPERTYVALUE
    property dwType : UInt32
    property rgb : UInt8[1]
    def initialize(@dwType : UInt32, @rgb : UInt8[1])
    end
  end

  @[Extern]
  struct OLESTREAMVTBL
    property get : LibC::IntPtrT
    property put : LibC::IntPtrT
    def initialize(@get : LibC::IntPtrT, @put : LibC::IntPtrT)
    end
  end

  @[Extern]
  struct OLESTREAM
    property lpstbl : Win32cr::System::Com::StructuredStorage::OLESTREAMVTBL*
    def initialize(@lpstbl : Win32cr::System::Com::StructuredStorage::OLESTREAMVTBL*)
    end
  end

  @[Extern]
  struct PROPBAG2
    property dwType : UInt32
    property vt : Win32cr::System::Variant::VARENUM
    property cfType : UInt16
    property dwHint : UInt32
    property pstrName : Win32cr::Foundation::PWSTR
    property clsid : LibC::GUID
    def initialize(@dwType : UInt32, @vt : Win32cr::System::Variant::VARENUM, @cfType : UInt16, @dwHint : UInt32, @pstrName : Win32cr::Foundation::PWSTR, @clsid : LibC::GUID)
    end
  end

  @[Extern]

  record IEnumSTATSTGVtable,
    query_interface : Proc(IEnumSTATSTG*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumSTATSTG*, UInt32),
    release : Proc(IEnumSTATSTG*, UInt32),
    next__ : Proc(IEnumSTATSTG*, UInt32, Win32cr::System::Com::STATSTG*, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumSTATSTG*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumSTATSTG*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumSTATSTG*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumSTATSTG, lpVtbl : IEnumSTATSTGVtable* do
    GUID = LibC::GUID.new(0xd_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IEnumSTATSTG*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumSTATSTG*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumSTATSTG*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumSTATSTG*, celt : UInt32, rgelt : Win32cr::System::Com::STATSTG*, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, rgelt, pceltFetched)
    end
    def skip(this : IEnumSTATSTG*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : IEnumSTATSTG*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumSTATSTG*, ppenum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppenum)
    end

  end

  @[Extern]

  record IStorageVtable,
    query_interface : Proc(IStorage*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IStorage*, UInt32),
    release : Proc(IStorage*, UInt32),
    create_stream : Proc(IStorage*, Win32cr::Foundation::PWSTR, Win32cr::System::Com::STGM, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    open_stream : Proc(IStorage*, Win32cr::Foundation::PWSTR, Void*, Win32cr::System::Com::STGM, UInt32, Void**, Win32cr::Foundation::HRESULT),
    create_storage : Proc(IStorage*, Win32cr::Foundation::PWSTR, Win32cr::System::Com::STGM, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    open_storage : Proc(IStorage*, Win32cr::Foundation::PWSTR, Void*, Win32cr::System::Com::STGM, UInt16**, UInt32, Void**, Win32cr::Foundation::HRESULT),
    copy_to : Proc(IStorage*, UInt32, LibC::GUID*, UInt16**, Void*, Win32cr::Foundation::HRESULT),
    move_element_to : Proc(IStorage*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::PWSTR, Win32cr::System::Com::StructuredStorage::STGMOVE, Win32cr::Foundation::HRESULT),
    commit : Proc(IStorage*, UInt32, Win32cr::Foundation::HRESULT),
    revert : Proc(IStorage*, Win32cr::Foundation::HRESULT),
    enum_elements : Proc(IStorage*, UInt32, Void*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    destroy_element : Proc(IStorage*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    rename_element : Proc(IStorage*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_element_times : Proc(IStorage*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::FILETIME*, Win32cr::Foundation::FILETIME*, Win32cr::Foundation::FILETIME*, Win32cr::Foundation::HRESULT),
    set_class : Proc(IStorage*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    set_state_bits : Proc(IStorage*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    stat : Proc(IStorage*, Win32cr::System::Com::STATSTG*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IStorage, lpVtbl : IStorageVtable* do
    GUID = LibC::GUID.new(0xb_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IStorage*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IStorage*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IStorage*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_stream(this : IStorage*, pwcsName : Win32cr::Foundation::PWSTR, grfMode : Win32cr::System::Com::STGM, reserved1 : UInt32, reserved2 : UInt32, ppstm : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_stream.call(this, pwcsName, grfMode, reserved1, reserved2, ppstm)
    end
    def open_stream(this : IStorage*, pwcsName : Win32cr::Foundation::PWSTR, reserved1 : Void*, grfMode : Win32cr::System::Com::STGM, reserved2 : UInt32, ppstm : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_stream.call(this, pwcsName, reserved1, grfMode, reserved2, ppstm)
    end
    def create_storage(this : IStorage*, pwcsName : Win32cr::Foundation::PWSTR, grfMode : Win32cr::System::Com::STGM, reserved1 : UInt32, reserved2 : UInt32, ppstg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_storage.call(this, pwcsName, grfMode, reserved1, reserved2, ppstg)
    end
    def open_storage(this : IStorage*, pwcsName : Win32cr::Foundation::PWSTR, pstgPriority : Void*, grfMode : Win32cr::System::Com::STGM, snbExclude : UInt16**, reserved : UInt32, ppstg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_storage.call(this, pwcsName, pstgPriority, grfMode, snbExclude, reserved, ppstg)
    end
    def copy_to(this : IStorage*, ciidExclude : UInt32, rgiidExclude : LibC::GUID*, snbExclude : UInt16**, pstgDest : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_to.call(this, ciidExclude, rgiidExclude, snbExclude, pstgDest)
    end
    def move_element_to(this : IStorage*, pwcsName : Win32cr::Foundation::PWSTR, pstgDest : Void*, pwcsNewName : Win32cr::Foundation::PWSTR, grfFlags : Win32cr::System::Com::StructuredStorage::STGMOVE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_element_to.call(this, pwcsName, pstgDest, pwcsNewName, grfFlags)
    end
    def commit(this : IStorage*, grfCommitFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this, grfCommitFlags)
    end
    def revert(this : IStorage*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.revert.call(this)
    end
    def enum_elements(this : IStorage*, reserved1 : UInt32, reserved2 : Void*, reserved3 : UInt32, ppenum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_elements.call(this, reserved1, reserved2, reserved3, ppenum)
    end
    def destroy_element(this : IStorage*, pwcsName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.destroy_element.call(this, pwcsName)
    end
    def rename_element(this : IStorage*, pwcsOldName : Win32cr::Foundation::PWSTR, pwcsNewName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.rename_element.call(this, pwcsOldName, pwcsNewName)
    end
    def set_element_times(this : IStorage*, pwcsName : Win32cr::Foundation::PWSTR, pctime : Win32cr::Foundation::FILETIME*, patime : Win32cr::Foundation::FILETIME*, pmtime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_element_times.call(this, pwcsName, pctime, patime, pmtime)
    end
    def set_class(this : IStorage*, clsid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_class.call(this, clsid)
    end
    def set_state_bits(this : IStorage*, grfStateBits : UInt32, grfMask : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_state_bits.call(this, grfStateBits, grfMask)
    end
    def stat(this : IStorage*, pstatstg : Win32cr::System::Com::STATSTG*, grfStatFlag : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stat.call(this, pstatstg, grfStatFlag)
    end

  end

  @[Extern]

  record IPersistStorageVtable,
    query_interface : Proc(IPersistStorage*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPersistStorage*, UInt32),
    release : Proc(IPersistStorage*, UInt32),
    get_class_id : Proc(IPersistStorage*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    is_dirty : Proc(IPersistStorage*, Win32cr::Foundation::HRESULT),
    init_new : Proc(IPersistStorage*, Void*, Win32cr::Foundation::HRESULT),
    load : Proc(IPersistStorage*, Void*, Win32cr::Foundation::HRESULT),
    save : Proc(IPersistStorage*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    save_completed : Proc(IPersistStorage*, Void*, Win32cr::Foundation::HRESULT),
    hands_off_storage : Proc(IPersistStorage*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPersistStorage, lpVtbl : IPersistStorageVtable* do
    GUID = LibC::GUID.new(0x10a_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IPersistStorage*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPersistStorage*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPersistStorage*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_class_id(this : IPersistStorage*, pClassID : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_id.call(this, pClassID)
    end
    def is_dirty(this : IPersistStorage*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_dirty.call(this)
    end
    def init_new(this : IPersistStorage*, pStg : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.init_new.call(this, pStg)
    end
    def load(this : IPersistStorage*, pStg : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load.call(this, pStg)
    end
    def save(this : IPersistStorage*, pStgSave : Void*, fSameAsLoad : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this, pStgSave, fSameAsLoad)
    end
    def save_completed(this : IPersistStorage*, pStgNew : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_completed.call(this, pStgNew)
    end
    def hands_off_storage(this : IPersistStorage*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.hands_off_storage.call(this)
    end

  end

  @[Extern]

  record ILockBytesVtable,
    query_interface : Proc(ILockBytes*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ILockBytes*, UInt32),
    release : Proc(ILockBytes*, UInt32),
    read_at : Proc(ILockBytes*, UInt64, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    write_at : Proc(ILockBytes*, UInt64, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    flush : Proc(ILockBytes*, Win32cr::Foundation::HRESULT),
    set_size : Proc(ILockBytes*, UInt64, Win32cr::Foundation::HRESULT),
    lock_region : Proc(ILockBytes*, UInt64, UInt64, UInt32, Win32cr::Foundation::HRESULT),
    unlock_region : Proc(ILockBytes*, UInt64, UInt64, UInt32, Win32cr::Foundation::HRESULT),
    stat : Proc(ILockBytes*, Win32cr::System::Com::STATSTG*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ILockBytes, lpVtbl : ILockBytesVtable* do
    GUID = LibC::GUID.new(0xa_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : ILockBytes*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ILockBytes*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ILockBytes*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def read_at(this : ILockBytes*, ulOffset : UInt64, pv : Void*, cb : UInt32, pcbRead : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read_at.call(this, ulOffset, pv, cb, pcbRead)
    end
    def write_at(this : ILockBytes*, ulOffset : UInt64, pv : Void*, cb : UInt32, pcbWritten : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_at.call(this, ulOffset, pv, cb, pcbWritten)
    end
    def flush(this : ILockBytes*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.flush.call(this)
    end
    def set_size(this : ILockBytes*, cb : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_size.call(this, cb)
    end
    def lock_region(this : ILockBytes*, libOffset : UInt64, cb : UInt64, dwLockType : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lock_region.call(this, libOffset, cb, dwLockType)
    end
    def unlock_region(this : ILockBytes*, libOffset : UInt64, cb : UInt64, dwLockType : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unlock_region.call(this, libOffset, cb, dwLockType)
    end
    def stat(this : ILockBytes*, pstatstg : Win32cr::System::Com::STATSTG*, grfStatFlag : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stat.call(this, pstatstg, grfStatFlag)
    end

  end

  @[Extern]

  record IRootStorageVtable,
    query_interface : Proc(IRootStorage*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRootStorage*, UInt32),
    release : Proc(IRootStorage*, UInt32),
    switch_to_file : Proc(IRootStorage*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRootStorage, lpVtbl : IRootStorageVtable* do
    GUID = LibC::GUID.new(0x12_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IRootStorage*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRootStorage*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRootStorage*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def switch_to_file(this : IRootStorage*, pszFile : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.switch_to_file.call(this, pszFile)
    end

  end

  @[Extern]

  record IFillLockBytesVtable,
    query_interface : Proc(IFillLockBytes*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFillLockBytes*, UInt32),
    release : Proc(IFillLockBytes*, UInt32),
    fill_append : Proc(IFillLockBytes*, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    fill_at : Proc(IFillLockBytes*, UInt64, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    set_fill_size : Proc(IFillLockBytes*, UInt64, Win32cr::Foundation::HRESULT),
    terminate : Proc(IFillLockBytes*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IFillLockBytes, lpVtbl : IFillLockBytesVtable* do
    GUID = LibC::GUID.new(0x99caf010_u32, 0x415e_u16, 0x11cf_u16, StaticArray[0x88_u8, 0x14_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xb5_u8, 0x69_u8, 0xf5_u8])
    def query_interface(this : IFillLockBytes*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFillLockBytes*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFillLockBytes*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def fill_append(this : IFillLockBytes*, pv : Void*, cb : UInt32, pcbWritten : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.fill_append.call(this, pv, cb, pcbWritten)
    end
    def fill_at(this : IFillLockBytes*, ulOffset : UInt64, pv : Void*, cb : UInt32, pcbWritten : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.fill_at.call(this, ulOffset, pv, cb, pcbWritten)
    end
    def set_fill_size(this : IFillLockBytes*, ulSize : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_fill_size.call(this, ulSize)
    end
    def terminate(this : IFillLockBytes*, bCanceled : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.terminate.call(this, bCanceled)
    end

  end

  @[Extern]

  record ILayoutStorageVtable,
    query_interface : Proc(ILayoutStorage*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ILayoutStorage*, UInt32),
    release : Proc(ILayoutStorage*, UInt32),
    layout_script : Proc(ILayoutStorage*, Win32cr::System::Com::StorageLayout*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    begin_monitor : Proc(ILayoutStorage*, Win32cr::Foundation::HRESULT),
    end_monitor : Proc(ILayoutStorage*, Win32cr::Foundation::HRESULT),
    re_layout_docfile : Proc(ILayoutStorage*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    re_layout_docfile_on_i_lock_bytes : Proc(ILayoutStorage*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ILayoutStorage, lpVtbl : ILayoutStorageVtable* do
    GUID = LibC::GUID.new(0xe6d4d90_u32, 0x6738_u16, 0x11cf_u16, StaticArray[0x96_u8, 0x8_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x68_u8, 0xd_u8, 0xb4_u8])
    def query_interface(this : ILayoutStorage*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ILayoutStorage*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ILayoutStorage*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def layout_script(this : ILayoutStorage*, pStorageLayout : Win32cr::System::Com::StorageLayout*, nEntries : UInt32, glfInterleavedFlag : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.layout_script.call(this, pStorageLayout, nEntries, glfInterleavedFlag)
    end
    def begin_monitor(this : ILayoutStorage*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_monitor.call(this)
    end
    def end_monitor(this : ILayoutStorage*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_monitor.call(this)
    end
    def re_layout_docfile(this : ILayoutStorage*, pwcsNewDfName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.re_layout_docfile.call(this, pwcsNewDfName)
    end
    def re_layout_docfile_on_i_lock_bytes(this : ILayoutStorage*, pILockBytes : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.re_layout_docfile_on_i_lock_bytes.call(this, pILockBytes)
    end

  end

  @[Extern]

  record IDirectWriterLockVtable,
    query_interface : Proc(IDirectWriterLock*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectWriterLock*, UInt32),
    release : Proc(IDirectWriterLock*, UInt32),
    wait_for_write_access : Proc(IDirectWriterLock*, UInt32, Win32cr::Foundation::HRESULT),
    release_write_access : Proc(IDirectWriterLock*, Win32cr::Foundation::HRESULT),
    have_write_access : Proc(IDirectWriterLock*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDirectWriterLock, lpVtbl : IDirectWriterLockVtable* do
    GUID = LibC::GUID.new(0xe6d4d92_u32, 0x6738_u16, 0x11cf_u16, StaticArray[0x96_u8, 0x8_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x68_u8, 0xd_u8, 0xb4_u8])
    def query_interface(this : IDirectWriterLock*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectWriterLock*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectWriterLock*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def wait_for_write_access(this : IDirectWriterLock*, dwTimeout : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wait_for_write_access.call(this, dwTimeout)
    end
    def release_write_access(this : IDirectWriterLock*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.release_write_access.call(this)
    end
    def have_write_access(this : IDirectWriterLock*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.have_write_access.call(this)
    end

  end

  @[Extern]

  record IPropertyStorageVtable,
    query_interface : Proc(IPropertyStorage*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPropertyStorage*, UInt32),
    release : Proc(IPropertyStorage*, UInt32),
    read_multiple : Proc(IPropertyStorage*, UInt32, Win32cr::System::Com::StructuredStorage::PROPSPEC*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    write_multiple : Proc(IPropertyStorage*, UInt32, Win32cr::System::Com::StructuredStorage::PROPSPEC*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, UInt32, Win32cr::Foundation::HRESULT),
    delete_multiple : Proc(IPropertyStorage*, UInt32, Win32cr::System::Com::StructuredStorage::PROPSPEC*, Win32cr::Foundation::HRESULT),
    read_property_names : Proc(IPropertyStorage*, UInt32, UInt32*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    write_property_names : Proc(IPropertyStorage*, UInt32, UInt32*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    delete_property_names : Proc(IPropertyStorage*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    commit : Proc(IPropertyStorage*, UInt32, Win32cr::Foundation::HRESULT),
    revert : Proc(IPropertyStorage*, Win32cr::Foundation::HRESULT),
    enum__ : Proc(IPropertyStorage*, Void**, Win32cr::Foundation::HRESULT),
    set_times : Proc(IPropertyStorage*, Win32cr::Foundation::FILETIME*, Win32cr::Foundation::FILETIME*, Win32cr::Foundation::FILETIME*, Win32cr::Foundation::HRESULT),
    set_class : Proc(IPropertyStorage*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    stat : Proc(IPropertyStorage*, Win32cr::System::Com::StructuredStorage::STATPROPSETSTG*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPropertyStorage, lpVtbl : IPropertyStorageVtable* do
    GUID = LibC::GUID.new(0x138_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IPropertyStorage*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPropertyStorage*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPropertyStorage*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def read_multiple(this : IPropertyStorage*, cpspec : UInt32, rgpspec : Win32cr::System::Com::StructuredStorage::PROPSPEC*, rgpropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read_multiple.call(this, cpspec, rgpspec, rgpropvar)
    end
    def write_multiple(this : IPropertyStorage*, cpspec : UInt32, rgpspec : Win32cr::System::Com::StructuredStorage::PROPSPEC*, rgpropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, propidNameFirst : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_multiple.call(this, cpspec, rgpspec, rgpropvar, propidNameFirst)
    end
    def delete_multiple(this : IPropertyStorage*, cpspec : UInt32, rgpspec : Win32cr::System::Com::StructuredStorage::PROPSPEC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_multiple.call(this, cpspec, rgpspec)
    end
    def read_property_names(this : IPropertyStorage*, cpropid : UInt32, rgpropid : UInt32*, rglpwstrName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read_property_names.call(this, cpropid, rgpropid, rglpwstrName)
    end
    def write_property_names(this : IPropertyStorage*, cpropid : UInt32, rgpropid : UInt32*, rglpwstrName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_property_names.call(this, cpropid, rgpropid, rglpwstrName)
    end
    def delete_property_names(this : IPropertyStorage*, cpropid : UInt32, rgpropid : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_property_names.call(this, cpropid, rgpropid)
    end
    def commit(this : IPropertyStorage*, grfCommitFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this, grfCommitFlags)
    end
    def revert(this : IPropertyStorage*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.revert.call(this)
    end
    def enum__(this : IPropertyStorage*, ppenum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum__.call(this, ppenum)
    end
    def set_times(this : IPropertyStorage*, pctime : Win32cr::Foundation::FILETIME*, patime : Win32cr::Foundation::FILETIME*, pmtime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_times.call(this, pctime, patime, pmtime)
    end
    def set_class(this : IPropertyStorage*, clsid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_class.call(this, clsid)
    end
    def stat(this : IPropertyStorage*, pstatpsstg : Win32cr::System::Com::StructuredStorage::STATPROPSETSTG*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stat.call(this, pstatpsstg)
    end

  end

  @[Extern]

  record IPropertySetStorageVtable,
    query_interface : Proc(IPropertySetStorage*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPropertySetStorage*, UInt32),
    release : Proc(IPropertySetStorage*, UInt32),
    create : Proc(IPropertySetStorage*, LibC::GUID*, LibC::GUID*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    open : Proc(IPropertySetStorage*, LibC::GUID*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    delete : Proc(IPropertySetStorage*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    enum__ : Proc(IPropertySetStorage*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPropertySetStorage, lpVtbl : IPropertySetStorageVtable* do
    GUID = LibC::GUID.new(0x13a_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IPropertySetStorage*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPropertySetStorage*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPropertySetStorage*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create(this : IPropertySetStorage*, rfmtid : LibC::GUID*, pclsid : LibC::GUID*, grfFlags : UInt32, grfMode : UInt32, ppprstg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create.call(this, rfmtid, pclsid, grfFlags, grfMode, ppprstg)
    end
    def open(this : IPropertySetStorage*, rfmtid : LibC::GUID*, grfMode : UInt32, ppprstg : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open.call(this, rfmtid, grfMode, ppprstg)
    end
    def delete(this : IPropertySetStorage*, rfmtid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this, rfmtid)
    end
    def enum__(this : IPropertySetStorage*, ppenum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum__.call(this, ppenum)
    end

  end

  @[Extern]

  record IEnumSTATPROPSTGVtable,
    query_interface : Proc(IEnumSTATPROPSTG*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumSTATPROPSTG*, UInt32),
    release : Proc(IEnumSTATPROPSTG*, UInt32),
    next__ : Proc(IEnumSTATPROPSTG*, UInt32, Win32cr::System::Com::StructuredStorage::STATPROPSTG*, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumSTATPROPSTG*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumSTATPROPSTG*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumSTATPROPSTG*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumSTATPROPSTG, lpVtbl : IEnumSTATPROPSTGVtable* do
    GUID = LibC::GUID.new(0x139_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IEnumSTATPROPSTG*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumSTATPROPSTG*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumSTATPROPSTG*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumSTATPROPSTG*, celt : UInt32, rgelt : Win32cr::System::Com::StructuredStorage::STATPROPSTG*, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, rgelt, pceltFetched)
    end
    def skip(this : IEnumSTATPROPSTG*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : IEnumSTATPROPSTG*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumSTATPROPSTG*, ppenum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppenum)
    end

  end

  @[Extern]

  record IEnumSTATPROPSETSTGVtable,
    query_interface : Proc(IEnumSTATPROPSETSTG*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumSTATPROPSETSTG*, UInt32),
    release : Proc(IEnumSTATPROPSETSTG*, UInt32),
    next__ : Proc(IEnumSTATPROPSETSTG*, UInt32, Win32cr::System::Com::StructuredStorage::STATPROPSETSTG*, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumSTATPROPSETSTG*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumSTATPROPSETSTG*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumSTATPROPSETSTG*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumSTATPROPSETSTG, lpVtbl : IEnumSTATPROPSETSTGVtable* do
    GUID = LibC::GUID.new(0x13b_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IEnumSTATPROPSETSTG*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumSTATPROPSETSTG*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumSTATPROPSETSTG*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumSTATPROPSETSTG*, celt : UInt32, rgelt : Win32cr::System::Com::StructuredStorage::STATPROPSETSTG*, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, rgelt, pceltFetched)
    end
    def skip(this : IEnumSTATPROPSETSTG*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : IEnumSTATPROPSETSTG*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumSTATPROPSETSTG*, ppenum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppenum)
    end

  end

  @[Extern]

  record IMemoryAllocatorVtable,
    allocate : Proc(IMemoryAllocator*, UInt32, Void*),
    free : Proc(IMemoryAllocator*, Void*, Void)


  @[Extern]
  record IMemoryAllocator, lpVtbl : IMemoryAllocatorVtable* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def allocate(this : IMemoryAllocator*, cbSize : UInt32) : Void*
      @lpVtbl.try &.value.allocate.call(this, cbSize)
    end
    def free(this : IMemoryAllocator*, pv : Void*) : Void
      @lpVtbl.try &.value.free.call(this, pv)
    end

  end

  @[Extern]

  record IPropertyBagVtable,
    query_interface : Proc(IPropertyBag*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPropertyBag*, UInt32),
    release : Proc(IPropertyBag*, UInt32),
    read : Proc(IPropertyBag*, Win32cr::Foundation::PWSTR, Win32cr::System::Variant::VARIANT*, Void*, Win32cr::Foundation::HRESULT),
    write : Proc(IPropertyBag*, Win32cr::Foundation::PWSTR, Win32cr::System::Variant::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPropertyBag, lpVtbl : IPropertyBagVtable* do
    GUID = LibC::GUID.new(0x55272a00_u32, 0x42cb_u16, 0x11ce_u16, StaticArray[0x81_u8, 0x35_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x4b_u8, 0xb8_u8, 0x51_u8])
    def query_interface(this : IPropertyBag*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPropertyBag*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPropertyBag*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def read(this : IPropertyBag*, pszPropName : Win32cr::Foundation::PWSTR, pVar : Win32cr::System::Variant::VARIANT*, pErrorLog : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read.call(this, pszPropName, pVar, pErrorLog)
    end
    def write(this : IPropertyBag*, pszPropName : Win32cr::Foundation::PWSTR, pVar : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write.call(this, pszPropName, pVar)
    end

  end

  @[Extern]

  record IPropertyBag2Vtable,
    query_interface : Proc(IPropertyBag2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPropertyBag2*, UInt32),
    release : Proc(IPropertyBag2*, UInt32),
    read : Proc(IPropertyBag2*, UInt32, Win32cr::System::Com::StructuredStorage::PROPBAG2*, Void*, Win32cr::System::Variant::VARIANT*, Win32cr::Foundation::HRESULT*, Win32cr::Foundation::HRESULT),
    write : Proc(IPropertyBag2*, UInt32, Win32cr::System::Com::StructuredStorage::PROPBAG2*, Win32cr::System::Variant::VARIANT*, Win32cr::Foundation::HRESULT),
    count_properties : Proc(IPropertyBag2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_property_info : Proc(IPropertyBag2*, UInt32, UInt32, Win32cr::System::Com::StructuredStorage::PROPBAG2*, UInt32*, Win32cr::Foundation::HRESULT),
    load_object : Proc(IPropertyBag2*, Win32cr::Foundation::PWSTR, UInt32, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPropertyBag2, lpVtbl : IPropertyBag2Vtable* do
    GUID = LibC::GUID.new(0x22f55882_u32, 0x280b_u16, 0x11d0_u16, StaticArray[0xa8_u8, 0xa9_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xc_u8, 0x20_u8, 0x4_u8])
    def query_interface(this : IPropertyBag2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPropertyBag2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPropertyBag2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def read(this : IPropertyBag2*, cProperties : UInt32, pPropBag : Win32cr::System::Com::StructuredStorage::PROPBAG2*, pErrLog : Void*, pvarValue : Win32cr::System::Variant::VARIANT*, phrError : Win32cr::Foundation::HRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read.call(this, cProperties, pPropBag, pErrLog, pvarValue, phrError)
    end
    def write(this : IPropertyBag2*, cProperties : UInt32, pPropBag : Win32cr::System::Com::StructuredStorage::PROPBAG2*, pvarValue : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write.call(this, cProperties, pPropBag, pvarValue)
    end
    def count_properties(this : IPropertyBag2*, pcProperties : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.count_properties.call(this, pcProperties)
    end
    def get_property_info(this : IPropertyBag2*, iProperty : UInt32, cProperties : UInt32, pPropBag : Win32cr::System::Com::StructuredStorage::PROPBAG2*, pcProperties : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_info.call(this, iProperty, cProperties, pPropBag, pcProperties)
    end
    def load_object(this : IPropertyBag2*, pstrName : Win32cr::Foundation::PWSTR, dwHint : UInt32, pUnkObject : Void*, pErrLog : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_object.call(this, pstrName, dwHint, pUnkObject, pErrLog)
    end

  end

  def coGetInstanceFromFile(pServerInfo : Win32cr::System::Com::COSERVERINFO*, pClsid : LibC::GUID*, punkOuter : Void*, dwClsCtx : Win32cr::System::Com::CLSCTX, grfMode : UInt32, pwszName : Win32cr::Foundation::PWSTR, dwCount : UInt32, pResults : Win32cr::System::Com::MULTI_QI*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.CoGetInstanceFromFile(pServerInfo, pClsid, punkOuter, dwClsCtx, grfMode, pwszName, dwCount, pResults)
    {% end %}
  end

  def coGetInstanceFromIStorage(pServerInfo : Win32cr::System::Com::COSERVERINFO*, pClsid : LibC::GUID*, punkOuter : Void*, dwClsCtx : Win32cr::System::Com::CLSCTX, pstg : Void*, dwCount : UInt32, pResults : Win32cr::System::Com::MULTI_QI*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.CoGetInstanceFromIStorage(pServerInfo, pClsid, punkOuter, dwClsCtx, pstg, dwCount, pResults)
    {% end %}
  end

  def stgOpenAsyncDocfileOnIFillLockBytes(pflb : Void*, grfMode : UInt32, asyncFlags : UInt32, ppstgOpen : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.StgOpenAsyncDocfileOnIFillLockBytes(pflb, grfMode, asyncFlags, ppstgOpen)
    {% end %}
  end

  def stgGetIFillLockBytesOnILockBytes(pilb : Void*, ppflb : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.StgGetIFillLockBytesOnILockBytes(pilb, ppflb)
    {% end %}
  end

  def stgGetIFillLockBytesOnFile(pwcsName : Win32cr::Foundation::PWSTR, ppflb : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.StgGetIFillLockBytesOnFile(pwcsName, ppflb)
    {% end %}
  end

  def stgOpenLayoutDocfile(pwcsDfName : Win32cr::Foundation::PWSTR, grfMode : UInt32, reserved : UInt32, ppstgOpen : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.StgOpenLayoutDocfile(pwcsDfName, grfMode, reserved, ppstgOpen)
    {% end %}
  end

  def createStreamOnHGlobal(hGlobal : Win32cr::Foundation::HGLOBAL, fDeleteOnRelease : Win32cr::Foundation::BOOL, ppstm : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.CreateStreamOnHGlobal(hGlobal, fDeleteOnRelease, ppstm)
    {% end %}
  end

  def getHGlobalFromStream(pstm : Void*, phglobal : Win32cr::Foundation::HGLOBAL*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.GetHGlobalFromStream(pstm, phglobal)
    {% end %}
  end

  def coGetInterfaceAndReleaseStream(pStm : Void*, iid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.CoGetInterfaceAndReleaseStream(pStm, iid, ppv)
    {% end %}
  end

  def propVariantCopy(pvarDest : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pvarSrc : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantCopy(pvarDest, pvarSrc)
    {% end %}
  end

  def propVariantClear(pvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantClear(pvar)
    {% end %}
  end

  def freePropVariantArray(cVariants : UInt32, rgvars : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.FreePropVariantArray(cVariants, rgvars)
    {% end %}
  end

  def stgCreateDocfile(pwcsName : Win32cr::Foundation::PWSTR, grfMode : Win32cr::System::Com::STGM, reserved : UInt32, ppstgOpen : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.StgCreateDocfile(pwcsName, grfMode, reserved, ppstgOpen)
    {% end %}
  end

  def stgCreateDocfileOnILockBytes(plkbyt : Void*, grfMode : Win32cr::System::Com::STGM, reserved : UInt32, ppstgOpen : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.StgCreateDocfileOnILockBytes(plkbyt, grfMode, reserved, ppstgOpen)
    {% end %}
  end

  def stgOpenStorage(pwcsName : Win32cr::Foundation::PWSTR, pstgPriority : Void*, grfMode : Win32cr::System::Com::STGM, snbExclude : UInt16**, reserved : UInt32, ppstgOpen : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.StgOpenStorage(pwcsName, pstgPriority, grfMode, snbExclude, reserved, ppstgOpen)
    {% end %}
  end

  def stgOpenStorageOnILockBytes(plkbyt : Void*, pstgPriority : Void*, grfMode : Win32cr::System::Com::STGM, snbExclude : UInt16**, reserved : UInt32, ppstgOpen : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.StgOpenStorageOnILockBytes(plkbyt, pstgPriority, grfMode, snbExclude, reserved, ppstgOpen)
    {% end %}
  end

  def stgIsStorageFile(pwcsName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.StgIsStorageFile(pwcsName)
    {% end %}
  end

  def stgIsStorageILockBytes(plkbyt : Void*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.StgIsStorageILockBytes(plkbyt)
    {% end %}
  end

  def stgSetTimes(lpszName : Win32cr::Foundation::PWSTR, pctime : Win32cr::Foundation::FILETIME*, patime : Win32cr::Foundation::FILETIME*, pmtime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.StgSetTimes(lpszName, pctime, patime, pmtime)
    {% end %}
  end

  def stgCreateStorageEx(pwcsName : Win32cr::Foundation::PWSTR, grfMode : Win32cr::System::Com::STGM, stgfmt : Win32cr::System::Com::StructuredStorage::STGFMT, grfAttrs : UInt32, pStgOptions : Win32cr::System::Com::StructuredStorage::STGOPTIONS*, pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, riid : LibC::GUID*, ppObjectOpen : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.StgCreateStorageEx(pwcsName, grfMode, stgfmt, grfAttrs, pStgOptions, pSecurityDescriptor, riid, ppObjectOpen)
    {% end %}
  end

  def stgOpenStorageEx(pwcsName : Win32cr::Foundation::PWSTR, grfMode : Win32cr::System::Com::STGM, stgfmt : Win32cr::System::Com::StructuredStorage::STGFMT, grfAttrs : UInt32, pStgOptions : Win32cr::System::Com::StructuredStorage::STGOPTIONS*, pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, riid : LibC::GUID*, ppObjectOpen : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.StgOpenStorageEx(pwcsName, grfMode, stgfmt, grfAttrs, pStgOptions, pSecurityDescriptor, riid, ppObjectOpen)
    {% end %}
  end

  def stgCreatePropStg(pUnk : Void*, fmtid : LibC::GUID*, pclsid : LibC::GUID*, grfFlags : UInt32, dwReserved : UInt32, ppPropStg : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.StgCreatePropStg(pUnk, fmtid, pclsid, grfFlags, dwReserved, ppPropStg)
    {% end %}
  end

  def stgOpenPropStg(pUnk : Void*, fmtid : LibC::GUID*, grfFlags : UInt32, dwReserved : UInt32, ppPropStg : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.StgOpenPropStg(pUnk, fmtid, grfFlags, dwReserved, ppPropStg)
    {% end %}
  end

  def stgCreatePropSetStg(pStorage : Void*, dwReserved : UInt32, ppPropSetStg : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.StgCreatePropSetStg(pStorage, dwReserved, ppPropSetStg)
    {% end %}
  end

  def fmtIdToPropStgName(pfmtid : LibC::GUID*, oszName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.FmtIdToPropStgName(pfmtid, oszName)
    {% end %}
  end

  def propStgNameToFmtId(oszName : Win32cr::Foundation::PWSTR, pfmtid : LibC::GUID*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropStgNameToFmtId(oszName, pfmtid)
    {% end %}
  end

  def readClassStg(pStg : Void*, pclsid : LibC::GUID*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.ReadClassStg(pStg, pclsid)
    {% end %}
  end

  def writeClassStg(pStg : Void*, rclsid : LibC::GUID*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WriteClassStg(pStg, rclsid)
    {% end %}
  end

  def readClassStm(pStm : Void*, pclsid : LibC::GUID*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.ReadClassStm(pStm, pclsid)
    {% end %}
  end

  def writeClassStm(pStm : Void*, rclsid : LibC::GUID*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WriteClassStm(pStm, rclsid)
    {% end %}
  end

  def getHGlobalFromILockBytes(plkbyt : Void*, phglobal : Win32cr::Foundation::HGLOBAL*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.GetHGlobalFromILockBytes(plkbyt, phglobal)
    {% end %}
  end

  def createILockBytesOnHGlobal(hGlobal : Win32cr::Foundation::HGLOBAL, fDeleteOnRelease : Win32cr::Foundation::BOOL, pplkbyt : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.CreateILockBytesOnHGlobal(hGlobal, fDeleteOnRelease, pplkbyt)
    {% end %}
  end

  def getConvertStg(pStg : Void*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.GetConvertStg(pStg)
    {% end %}
  end

  def stgConvertVariantToProperty(pvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, code_page : UInt16, pprop : Win32cr::System::Com::StructuredStorage::SERIALIZEDPROPERTYVALUE*, pcb : UInt32*, pid : UInt32, fReserved : Win32cr::Foundation::BOOLEAN, pcIndirect : UInt32*) : Win32cr::System::Com::StructuredStorage::SERIALIZEDPROPERTYVALUE*
    {% if !flag?(:docs) %}
    C.StgConvertVariantToProperty(pvar, code_page, pprop, pcb, pid, fReserved, pcIndirect)
    {% end %}
  end

  def stgConvertPropertyToVariant(pprop : Win32cr::System::Com::StructuredStorage::SERIALIZEDPROPERTYVALUE*, code_page : UInt16, pvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pma : Void*) : Win32cr::Foundation::BOOLEAN
    {% if !flag?(:docs) %}
    C.StgConvertPropertyToVariant(pprop, code_page, pvar, pma)
    {% end %}
  end

  def stgPropertyLengthAsVariant(pProp : Win32cr::System::Com::StructuredStorage::SERIALIZEDPROPERTYVALUE*, cbProp : UInt32, code_page : UInt16, bReserved : UInt8) : UInt32
    {% if !flag?(:docs) %}
    C.StgPropertyLengthAsVariant(pProp, cbProp, code_page, bReserved)
    {% end %}
  end

  def writeFmtUserTypeStg(pstg : Void*, cf : UInt16, lpszUserType : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WriteFmtUserTypeStg(pstg, cf, lpszUserType)
    {% end %}
  end

  def readFmtUserTypeStg(pstg : Void*, pcf : UInt16*, lplpszUserType : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.ReadFmtUserTypeStg(pstg, pcf, lplpszUserType)
    {% end %}
  end

  def oleConvertOLESTREAMToIStorage(lpolestream : Win32cr::System::Com::StructuredStorage::OLESTREAM*, pstg : Void*, ptd : Win32cr::System::Com::DVTARGETDEVICE*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.OleConvertOLESTREAMToIStorage(lpolestream, pstg, ptd)
    {% end %}
  end

  def oleConvertIStorageToOLESTREAM(pstg : Void*, lpolestream : Win32cr::System::Com::StructuredStorage::OLESTREAM*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.OleConvertIStorageToOLESTREAM(pstg, lpolestream)
    {% end %}
  end

  def setConvertStg(pStg : Void*, fConvert : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.SetConvertStg(pStg, fConvert)
    {% end %}
  end

  def oleConvertIStorageToOLESTREAMEx(pstg : Void*, cfFormat : UInt16, lWidth : Int32, lHeight : Int32, dwSize : UInt32, pmedium : Win32cr::System::Com::STGMEDIUM*, polestm : Win32cr::System::Com::StructuredStorage::OLESTREAM*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.OleConvertIStorageToOLESTREAMEx(pstg, cfFormat, lWidth, lHeight, dwSize, pmedium, polestm)
    {% end %}
  end

  def oleConvertOLESTREAMToIStorageEx(polestm : Win32cr::System::Com::StructuredStorage::OLESTREAM*, pstg : Void*, pcfFormat : UInt16*, plwWidth : Int32*, plHeight : Int32*, pdwSize : UInt32*, pmedium : Win32cr::System::Com::STGMEDIUM*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.OleConvertOLESTREAMToIStorageEx(polestm, pstg, pcfFormat, plwWidth, plHeight, pdwSize, pmedium)
    {% end %}
  end

  def propVariantToWinRTPropertyValue(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantToWinRTPropertyValue(propvar, riid, ppv)
    {% end %}
  end

  def winRTPropertyValueToPropVariant(punkPropertyValue : Void*, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WinRTPropertyValueToPropVariant(punkPropertyValue, ppropvar)
    {% end %}
  end

  def initPropVariantFromResource(hinst : Win32cr::Foundation::HINSTANCE, id : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.InitPropVariantFromResource(hinst, id, ppropvar)
    {% end %}
  end

  def initPropVariantFromBuffer(pv : Void*, cb : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.InitPropVariantFromBuffer(pv, cb, ppropvar)
    {% end %}
  end

  def initPropVariantFromCLSID(clsid : LibC::GUID*, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.InitPropVariantFromCLSID(clsid, ppropvar)
    {% end %}
  end

  def initPropVariantFromGUIDAsString(guid : LibC::GUID*, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.InitPropVariantFromGUIDAsString(guid, ppropvar)
    {% end %}
  end

  def initPropVariantFromFileTime(pftIn : Win32cr::Foundation::FILETIME*, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.InitPropVariantFromFileTime(pftIn, ppropvar)
    {% end %}
  end

  def initPropVariantFromPropVariantVectorElem(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, iElem : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.InitPropVariantFromPropVariantVectorElem(propvarIn, iElem, ppropvar)
    {% end %}
  end

  def initPropVariantVectorFromPropVariant(propvarSingle : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, ppropvarVector : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.InitPropVariantVectorFromPropVariant(propvarSingle, ppropvarVector)
    {% end %}
  end

  def initPropVariantFromBooleanVector(prgf : Win32cr::Foundation::BOOL*, cElems : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.InitPropVariantFromBooleanVector(prgf, cElems, ppropvar)
    {% end %}
  end

  def initPropVariantFromInt16Vector(prgn : Int16*, cElems : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.InitPropVariantFromInt16Vector(prgn, cElems, ppropvar)
    {% end %}
  end

  def initPropVariantFromUInt16Vector(prgn : UInt16*, cElems : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.InitPropVariantFromUInt16Vector(prgn, cElems, ppropvar)
    {% end %}
  end

  def initPropVariantFromInt32Vector(prgn : Int32*, cElems : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.InitPropVariantFromInt32Vector(prgn, cElems, ppropvar)
    {% end %}
  end

  def initPropVariantFromUInt32Vector(prgn : UInt32*, cElems : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.InitPropVariantFromUInt32Vector(prgn, cElems, ppropvar)
    {% end %}
  end

  def initPropVariantFromInt64Vector(prgn : Int64*, cElems : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.InitPropVariantFromInt64Vector(prgn, cElems, ppropvar)
    {% end %}
  end

  def initPropVariantFromUInt64Vector(prgn : UInt64*, cElems : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.InitPropVariantFromUInt64Vector(prgn, cElems, ppropvar)
    {% end %}
  end

  def initPropVariantFromDoubleVector(prgn : Float64*, cElems : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.InitPropVariantFromDoubleVector(prgn, cElems, ppropvar)
    {% end %}
  end

  def initPropVariantFromFileTimeVector(prgft : Win32cr::Foundation::FILETIME*, cElems : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.InitPropVariantFromFileTimeVector(prgft, cElems, ppropvar)
    {% end %}
  end

  def initPropVariantFromStringVector(prgsz : Win32cr::Foundation::PWSTR*, cElems : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.InitPropVariantFromStringVector(prgsz, cElems, ppropvar)
    {% end %}
  end

  def initPropVariantFromStringAsVector(psz : Win32cr::Foundation::PWSTR, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.InitPropVariantFromStringAsVector(psz, ppropvar)
    {% end %}
  end

  def propVariantToBooleanWithDefault(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, fDefault : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.PropVariantToBooleanWithDefault(propvarIn, fDefault)
    {% end %}
  end

  def propVariantToInt16WithDefault(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, iDefault : Int16) : Int16
    {% if !flag?(:docs) %}
    C.PropVariantToInt16WithDefault(propvarIn, iDefault)
    {% end %}
  end

  def propVariantToUInt16WithDefault(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, uiDefault : UInt16) : UInt16
    {% if !flag?(:docs) %}
    C.PropVariantToUInt16WithDefault(propvarIn, uiDefault)
    {% end %}
  end

  def propVariantToInt32WithDefault(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, lDefault : Int32) : Int32
    {% if !flag?(:docs) %}
    C.PropVariantToInt32WithDefault(propvarIn, lDefault)
    {% end %}
  end

  def propVariantToUInt32WithDefault(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, ulDefault : UInt32) : UInt32
    {% if !flag?(:docs) %}
    C.PropVariantToUInt32WithDefault(propvarIn, ulDefault)
    {% end %}
  end

  def propVariantToInt64WithDefault(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, llDefault : Int64) : Int64
    {% if !flag?(:docs) %}
    C.PropVariantToInt64WithDefault(propvarIn, llDefault)
    {% end %}
  end

  def propVariantToUInt64WithDefault(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, ullDefault : UInt64) : UInt64
    {% if !flag?(:docs) %}
    C.PropVariantToUInt64WithDefault(propvarIn, ullDefault)
    {% end %}
  end

  def propVariantToDoubleWithDefault(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, dblDefault : Float64) : Float64
    {% if !flag?(:docs) %}
    C.PropVariantToDoubleWithDefault(propvarIn, dblDefault)
    {% end %}
  end

  def propVariantToStringWithDefault(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pszDefault : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::PWSTR
    {% if !flag?(:docs) %}
    C.PropVariantToStringWithDefault(propvarIn, pszDefault)
    {% end %}
  end

  def propVariantToBoolean(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pfRet : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantToBoolean(propvarIn, pfRet)
    {% end %}
  end

  def propVariantToInt16(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, piRet : Int16*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantToInt16(propvarIn, piRet)
    {% end %}
  end

  def propVariantToUInt16(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, puiRet : UInt16*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantToUInt16(propvarIn, puiRet)
    {% end %}
  end

  def propVariantToInt32(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, plRet : Int32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantToInt32(propvarIn, plRet)
    {% end %}
  end

  def propVariantToUInt32(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pulRet : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantToUInt32(propvarIn, pulRet)
    {% end %}
  end

  def propVariantToInt64(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pllRet : Int64*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantToInt64(propvarIn, pllRet)
    {% end %}
  end

  def propVariantToUInt64(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pullRet : UInt64*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantToUInt64(propvarIn, pullRet)
    {% end %}
  end

  def propVariantToDouble(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pdblRet : Float64*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantToDouble(propvarIn, pdblRet)
    {% end %}
  end

  def propVariantToBuffer(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pv : Void*, cb : UInt32) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantToBuffer(propvar, pv, cb)
    {% end %}
  end

  def propVariantToString(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, psz : Win32cr::Foundation::PWSTR, cch : UInt32) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantToString(propvar, psz, cch)
    {% end %}
  end

  def propVariantToGUID(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pguid : LibC::GUID*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantToGUID(propvar, pguid)
    {% end %}
  end

  def propVariantToStringAlloc(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, ppszOut : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantToStringAlloc(propvar, ppszOut)
    {% end %}
  end

  def propVariantToBSTR(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pbstrOut : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantToBSTR(propvar, pbstrOut)
    {% end %}
  end

  def propVariantToFileTime(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pstfOut : Win32cr::System::Variant::PSTIME_FLAGS, pftOut : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantToFileTime(propvar, pstfOut, pftOut)
    {% end %}
  end

  def propVariantGetElementCount(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : UInt32
    {% if !flag?(:docs) %}
    C.PropVariantGetElementCount(propvar)
    {% end %}
  end

  def propVariantToBooleanVector(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, prgf : Win32cr::Foundation::BOOL*, crgf : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantToBooleanVector(propvar, prgf, crgf, pcElem)
    {% end %}
  end

  def propVariantToInt16Vector(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, prgn : Int16*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantToInt16Vector(propvar, prgn, crgn, pcElem)
    {% end %}
  end

  def propVariantToUInt16Vector(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, prgn : UInt16*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantToUInt16Vector(propvar, prgn, crgn, pcElem)
    {% end %}
  end

  def propVariantToInt32Vector(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, prgn : Int32*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantToInt32Vector(propvar, prgn, crgn, pcElem)
    {% end %}
  end

  def propVariantToUInt32Vector(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, prgn : UInt32*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantToUInt32Vector(propvar, prgn, crgn, pcElem)
    {% end %}
  end

  def propVariantToInt64Vector(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, prgn : Int64*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantToInt64Vector(propvar, prgn, crgn, pcElem)
    {% end %}
  end

  def propVariantToUInt64Vector(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, prgn : UInt64*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantToUInt64Vector(propvar, prgn, crgn, pcElem)
    {% end %}
  end

  def propVariantToDoubleVector(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, prgn : Float64*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantToDoubleVector(propvar, prgn, crgn, pcElem)
    {% end %}
  end

  def propVariantToFileTimeVector(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, prgft : Win32cr::Foundation::FILETIME*, crgft : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantToFileTimeVector(propvar, prgft, crgft, pcElem)
    {% end %}
  end

  def propVariantToStringVector(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, prgsz : Win32cr::Foundation::PWSTR*, crgsz : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantToStringVector(propvar, prgsz, crgsz, pcElem)
    {% end %}
  end

  def propVariantToBooleanVectorAlloc(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pprgf : Win32cr::Foundation::BOOL**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantToBooleanVectorAlloc(propvar, pprgf, pcElem)
    {% end %}
  end

  def propVariantToInt16VectorAlloc(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pprgn : Int16**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantToInt16VectorAlloc(propvar, pprgn, pcElem)
    {% end %}
  end

  def propVariantToUInt16VectorAlloc(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pprgn : UInt16**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantToUInt16VectorAlloc(propvar, pprgn, pcElem)
    {% end %}
  end

  def propVariantToInt32VectorAlloc(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pprgn : Int32**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantToInt32VectorAlloc(propvar, pprgn, pcElem)
    {% end %}
  end

  def propVariantToUInt32VectorAlloc(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pprgn : UInt32**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantToUInt32VectorAlloc(propvar, pprgn, pcElem)
    {% end %}
  end

  def propVariantToInt64VectorAlloc(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pprgn : Int64**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantToInt64VectorAlloc(propvar, pprgn, pcElem)
    {% end %}
  end

  def propVariantToUInt64VectorAlloc(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pprgn : UInt64**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantToUInt64VectorAlloc(propvar, pprgn, pcElem)
    {% end %}
  end

  def propVariantToDoubleVectorAlloc(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pprgn : Float64**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantToDoubleVectorAlloc(propvar, pprgn, pcElem)
    {% end %}
  end

  def propVariantToFileTimeVectorAlloc(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pprgft : Win32cr::Foundation::FILETIME**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantToFileTimeVectorAlloc(propvar, pprgft, pcElem)
    {% end %}
  end

  def propVariantToStringVectorAlloc(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pprgsz : Win32cr::Foundation::PWSTR**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantToStringVectorAlloc(propvar, pprgsz, pcElem)
    {% end %}
  end

  def propVariantGetBooleanElem(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, iElem : UInt32, pfVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantGetBooleanElem(propvar, iElem, pfVal)
    {% end %}
  end

  def propVariantGetInt16Elem(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, iElem : UInt32, pnVal : Int16*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantGetInt16Elem(propvar, iElem, pnVal)
    {% end %}
  end

  def propVariantGetUInt16Elem(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, iElem : UInt32, pnVal : UInt16*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantGetUInt16Elem(propvar, iElem, pnVal)
    {% end %}
  end

  def propVariantGetInt32Elem(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, iElem : UInt32, pnVal : Int32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantGetInt32Elem(propvar, iElem, pnVal)
    {% end %}
  end

  def propVariantGetUInt32Elem(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, iElem : UInt32, pnVal : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantGetUInt32Elem(propvar, iElem, pnVal)
    {% end %}
  end

  def propVariantGetInt64Elem(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, iElem : UInt32, pnVal : Int64*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantGetInt64Elem(propvar, iElem, pnVal)
    {% end %}
  end

  def propVariantGetUInt64Elem(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, iElem : UInt32, pnVal : UInt64*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantGetUInt64Elem(propvar, iElem, pnVal)
    {% end %}
  end

  def propVariantGetDoubleElem(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, iElem : UInt32, pnVal : Float64*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantGetDoubleElem(propvar, iElem, pnVal)
    {% end %}
  end

  def propVariantGetFileTimeElem(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, iElem : UInt32, pftVal : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantGetFileTimeElem(propvar, iElem, pftVal)
    {% end %}
  end

  def propVariantGetStringElem(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, iElem : UInt32, ppszVal : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantGetStringElem(propvar, iElem, ppszVal)
    {% end %}
  end

  def clearPropVariantArray(rgPropVar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, cVars : UInt32) : Void
    {% if !flag?(:docs) %}
    C.ClearPropVariantArray(rgPropVar, cVars)
    {% end %}
  end

  def propVariantCompareEx(propvar1 : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, propvar2 : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, unit : Win32cr::System::Com::StructuredStorage::PROPVAR_COMPARE_UNIT, flags : Win32cr::System::Com::StructuredStorage::PROPVAR_COMPARE_FLAGS) : Int32
    {% if !flag?(:docs) %}
    C.PropVariantCompareEx(propvar1, propvar2, unit, flags)
    {% end %}
  end

  def propVariantChangeType(ppropvarDest : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, propvarSrc : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, flags : Win32cr::System::Com::StructuredStorage::PROPVAR_CHANGE_FLAGS, vt : Win32cr::System::Variant::VARENUM) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantChangeType(ppropvarDest, propvarSrc, flags, vt)
    {% end %}
  end

  def propVariantToVariant(pPropVar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pVar : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PropVariantToVariant(pPropVar, pVar)
    {% end %}
  end

  def variantToPropVariant(pVar : Win32cr::System::Variant::VARIANT*, pPropVar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantToPropVariant(pVar, pPropVar)
    {% end %}
  end

  def stgSerializePropVariant(ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, ppProp : Win32cr::System::Com::StructuredStorage::SERIALIZEDPROPERTYVALUE**, pcb : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.StgSerializePropVariant(ppropvar, ppProp, pcb)
    {% end %}
  end

  def stgDeserializePropVariant(pprop : Win32cr::System::Com::StructuredStorage::SERIALIZEDPROPERTYVALUE*, cbMax : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.StgDeserializePropVariant(pprop, cbMax, ppropvar)
    {% end %}
  end

  @[Link("ole32")]
  @[Link("dflayout")]
  @[Link("propsys")]
  {% if !flag?(:docs) %}
  lib C
    # :nodoc:
    fun CoGetInstanceFromFile(pServerInfo : Win32cr::System::Com::COSERVERINFO*, pClsid : LibC::GUID*, punkOuter : Void*, dwClsCtx : Win32cr::System::Com::CLSCTX, grfMode : UInt32, pwszName : Win32cr::Foundation::PWSTR, dwCount : UInt32, pResults : Win32cr::System::Com::MULTI_QI*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun CoGetInstanceFromIStorage(pServerInfo : Win32cr::System::Com::COSERVERINFO*, pClsid : LibC::GUID*, punkOuter : Void*, dwClsCtx : Win32cr::System::Com::CLSCTX, pstg : Void*, dwCount : UInt32, pResults : Win32cr::System::Com::MULTI_QI*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun StgOpenAsyncDocfileOnIFillLockBytes(pflb : Void*, grfMode : UInt32, asyncFlags : UInt32, ppstgOpen : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun StgGetIFillLockBytesOnILockBytes(pilb : Void*, ppflb : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun StgGetIFillLockBytesOnFile(pwcsName : Win32cr::Foundation::PWSTR, ppflb : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun StgOpenLayoutDocfile(pwcsDfName : Win32cr::Foundation::PWSTR, grfMode : UInt32, reserved : UInt32, ppstgOpen : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun CreateStreamOnHGlobal(hGlobal : Win32cr::Foundation::HGLOBAL, fDeleteOnRelease : Win32cr::Foundation::BOOL, ppstm : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetHGlobalFromStream(pstm : Void*, phglobal : Win32cr::Foundation::HGLOBAL*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun CoGetInterfaceAndReleaseStream(pStm : Void*, iid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantCopy(pvarDest : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pvarSrc : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantClear(pvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun FreePropVariantArray(cVariants : UInt32, rgvars : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun StgCreateDocfile(pwcsName : Win32cr::Foundation::PWSTR, grfMode : Win32cr::System::Com::STGM, reserved : UInt32, ppstgOpen : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun StgCreateDocfileOnILockBytes(plkbyt : Void*, grfMode : Win32cr::System::Com::STGM, reserved : UInt32, ppstgOpen : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun StgOpenStorage(pwcsName : Win32cr::Foundation::PWSTR, pstgPriority : Void*, grfMode : Win32cr::System::Com::STGM, snbExclude : UInt16**, reserved : UInt32, ppstgOpen : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun StgOpenStorageOnILockBytes(plkbyt : Void*, pstgPriority : Void*, grfMode : Win32cr::System::Com::STGM, snbExclude : UInt16**, reserved : UInt32, ppstgOpen : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun StgIsStorageFile(pwcsName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun StgIsStorageILockBytes(plkbyt : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun StgSetTimes(lpszName : Win32cr::Foundation::PWSTR, pctime : Win32cr::Foundation::FILETIME*, patime : Win32cr::Foundation::FILETIME*, pmtime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun StgCreateStorageEx(pwcsName : Win32cr::Foundation::PWSTR, grfMode : Win32cr::System::Com::STGM, stgfmt : Win32cr::System::Com::StructuredStorage::STGFMT, grfAttrs : UInt32, pStgOptions : Win32cr::System::Com::StructuredStorage::STGOPTIONS*, pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, riid : LibC::GUID*, ppObjectOpen : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun StgOpenStorageEx(pwcsName : Win32cr::Foundation::PWSTR, grfMode : Win32cr::System::Com::STGM, stgfmt : Win32cr::System::Com::StructuredStorage::STGFMT, grfAttrs : UInt32, pStgOptions : Win32cr::System::Com::StructuredStorage::STGOPTIONS*, pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, riid : LibC::GUID*, ppObjectOpen : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun StgCreatePropStg(pUnk : Void*, fmtid : LibC::GUID*, pclsid : LibC::GUID*, grfFlags : UInt32, dwReserved : UInt32, ppPropStg : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun StgOpenPropStg(pUnk : Void*, fmtid : LibC::GUID*, grfFlags : UInt32, dwReserved : UInt32, ppPropStg : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun StgCreatePropSetStg(pStorage : Void*, dwReserved : UInt32, ppPropSetStg : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun FmtIdToPropStgName(pfmtid : LibC::GUID*, oszName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropStgNameToFmtId(oszName : Win32cr::Foundation::PWSTR, pfmtid : LibC::GUID*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ReadClassStg(pStg : Void*, pclsid : LibC::GUID*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WriteClassStg(pStg : Void*, rclsid : LibC::GUID*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ReadClassStm(pStm : Void*, pclsid : LibC::GUID*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WriteClassStm(pStm : Void*, rclsid : LibC::GUID*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetHGlobalFromILockBytes(plkbyt : Void*, phglobal : Win32cr::Foundation::HGLOBAL*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun CreateILockBytesOnHGlobal(hGlobal : Win32cr::Foundation::HGLOBAL, fDeleteOnRelease : Win32cr::Foundation::BOOL, pplkbyt : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetConvertStg(pStg : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun StgConvertVariantToProperty(pvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, code_page : UInt16, pprop : Win32cr::System::Com::StructuredStorage::SERIALIZEDPROPERTYVALUE*, pcb : UInt32*, pid : UInt32, fReserved : Win32cr::Foundation::BOOLEAN, pcIndirect : UInt32*) : Win32cr::System::Com::StructuredStorage::SERIALIZEDPROPERTYVALUE*

    # :nodoc:
    fun StgConvertPropertyToVariant(pprop : Win32cr::System::Com::StructuredStorage::SERIALIZEDPROPERTYVALUE*, code_page : UInt16, pvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pma : Void*) : Win32cr::Foundation::BOOLEAN

    # :nodoc:
    fun StgPropertyLengthAsVariant(pProp : Win32cr::System::Com::StructuredStorage::SERIALIZEDPROPERTYVALUE*, cbProp : UInt32, code_page : UInt16, bReserved : UInt8) : UInt32

    # :nodoc:
    fun WriteFmtUserTypeStg(pstg : Void*, cf : UInt16, lpszUserType : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ReadFmtUserTypeStg(pstg : Void*, pcf : UInt16*, lplpszUserType : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun OleConvertOLESTREAMToIStorage(lpolestream : Win32cr::System::Com::StructuredStorage::OLESTREAM*, pstg : Void*, ptd : Win32cr::System::Com::DVTARGETDEVICE*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun OleConvertIStorageToOLESTREAM(pstg : Void*, lpolestream : Win32cr::System::Com::StructuredStorage::OLESTREAM*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun SetConvertStg(pStg : Void*, fConvert : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun OleConvertIStorageToOLESTREAMEx(pstg : Void*, cfFormat : UInt16, lWidth : Int32, lHeight : Int32, dwSize : UInt32, pmedium : Win32cr::System::Com::STGMEDIUM*, polestm : Win32cr::System::Com::StructuredStorage::OLESTREAM*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun OleConvertOLESTREAMToIStorageEx(polestm : Win32cr::System::Com::StructuredStorage::OLESTREAM*, pstg : Void*, pcfFormat : UInt16*, plwWidth : Int32*, plHeight : Int32*, pdwSize : UInt32*, pmedium : Win32cr::System::Com::STGMEDIUM*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantToWinRTPropertyValue(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinRTPropertyValueToPropVariant(punkPropertyValue : Void*, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun InitPropVariantFromResource(hinst : Win32cr::Foundation::HINSTANCE, id : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun InitPropVariantFromBuffer(pv : Void*, cb : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun InitPropVariantFromCLSID(clsid : LibC::GUID*, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun InitPropVariantFromGUIDAsString(guid : LibC::GUID*, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun InitPropVariantFromFileTime(pftIn : Win32cr::Foundation::FILETIME*, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun InitPropVariantFromPropVariantVectorElem(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, iElem : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun InitPropVariantVectorFromPropVariant(propvarSingle : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, ppropvarVector : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun InitPropVariantFromBooleanVector(prgf : Win32cr::Foundation::BOOL*, cElems : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun InitPropVariantFromInt16Vector(prgn : Int16*, cElems : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun InitPropVariantFromUInt16Vector(prgn : UInt16*, cElems : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun InitPropVariantFromInt32Vector(prgn : Int32*, cElems : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun InitPropVariantFromUInt32Vector(prgn : UInt32*, cElems : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun InitPropVariantFromInt64Vector(prgn : Int64*, cElems : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun InitPropVariantFromUInt64Vector(prgn : UInt64*, cElems : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun InitPropVariantFromDoubleVector(prgn : Float64*, cElems : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun InitPropVariantFromFileTimeVector(prgft : Win32cr::Foundation::FILETIME*, cElems : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun InitPropVariantFromStringVector(prgsz : Win32cr::Foundation::PWSTR*, cElems : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun InitPropVariantFromStringAsVector(psz : Win32cr::Foundation::PWSTR, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantToBooleanWithDefault(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, fDefault : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun PropVariantToInt16WithDefault(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, iDefault : Int16) : Int16

    # :nodoc:
    fun PropVariantToUInt16WithDefault(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, uiDefault : UInt16) : UInt16

    # :nodoc:
    fun PropVariantToInt32WithDefault(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, lDefault : Int32) : Int32

    # :nodoc:
    fun PropVariantToUInt32WithDefault(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, ulDefault : UInt32) : UInt32

    # :nodoc:
    fun PropVariantToInt64WithDefault(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, llDefault : Int64) : Int64

    # :nodoc:
    fun PropVariantToUInt64WithDefault(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, ullDefault : UInt64) : UInt64

    # :nodoc:
    fun PropVariantToDoubleWithDefault(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, dblDefault : Float64) : Float64

    # :nodoc:
    fun PropVariantToStringWithDefault(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pszDefault : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::PWSTR

    # :nodoc:
    fun PropVariantToBoolean(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pfRet : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantToInt16(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, piRet : Int16*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantToUInt16(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, puiRet : UInt16*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantToInt32(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, plRet : Int32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantToUInt32(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pulRet : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantToInt64(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pllRet : Int64*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantToUInt64(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pullRet : UInt64*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantToDouble(propvarIn : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pdblRet : Float64*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantToBuffer(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pv : Void*, cb : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantToString(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, psz : Win32cr::Foundation::PWSTR, cch : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantToGUID(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pguid : LibC::GUID*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantToStringAlloc(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, ppszOut : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantToBSTR(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pbstrOut : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantToFileTime(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pstfOut : Win32cr::System::Variant::PSTIME_FLAGS, pftOut : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantGetElementCount(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : UInt32

    # :nodoc:
    fun PropVariantToBooleanVector(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, prgf : Win32cr::Foundation::BOOL*, crgf : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantToInt16Vector(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, prgn : Int16*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantToUInt16Vector(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, prgn : UInt16*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantToInt32Vector(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, prgn : Int32*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantToUInt32Vector(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, prgn : UInt32*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantToInt64Vector(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, prgn : Int64*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantToUInt64Vector(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, prgn : UInt64*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantToDoubleVector(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, prgn : Float64*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantToFileTimeVector(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, prgft : Win32cr::Foundation::FILETIME*, crgft : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantToStringVector(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, prgsz : Win32cr::Foundation::PWSTR*, crgsz : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantToBooleanVectorAlloc(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pprgf : Win32cr::Foundation::BOOL**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantToInt16VectorAlloc(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pprgn : Int16**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantToUInt16VectorAlloc(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pprgn : UInt16**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantToInt32VectorAlloc(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pprgn : Int32**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantToUInt32VectorAlloc(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pprgn : UInt32**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantToInt64VectorAlloc(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pprgn : Int64**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantToUInt64VectorAlloc(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pprgn : UInt64**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantToDoubleVectorAlloc(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pprgn : Float64**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantToFileTimeVectorAlloc(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pprgft : Win32cr::Foundation::FILETIME**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantToStringVectorAlloc(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pprgsz : Win32cr::Foundation::PWSTR**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantGetBooleanElem(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, iElem : UInt32, pfVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantGetInt16Elem(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, iElem : UInt32, pnVal : Int16*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantGetUInt16Elem(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, iElem : UInt32, pnVal : UInt16*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantGetInt32Elem(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, iElem : UInt32, pnVal : Int32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantGetUInt32Elem(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, iElem : UInt32, pnVal : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantGetInt64Elem(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, iElem : UInt32, pnVal : Int64*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantGetUInt64Elem(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, iElem : UInt32, pnVal : UInt64*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantGetDoubleElem(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, iElem : UInt32, pnVal : Float64*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantGetFileTimeElem(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, iElem : UInt32, pftVal : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantGetStringElem(propvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, iElem : UInt32, ppszVal : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ClearPropVariantArray(rgPropVar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, cVars : UInt32) : Void

    # :nodoc:
    fun PropVariantCompareEx(propvar1 : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, propvar2 : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, unit : Win32cr::System::Com::StructuredStorage::PROPVAR_COMPARE_UNIT, flags : Win32cr::System::Com::StructuredStorage::PROPVAR_COMPARE_FLAGS) : Int32

    # :nodoc:
    fun PropVariantChangeType(ppropvarDest : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, propvarSrc : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, flags : Win32cr::System::Com::StructuredStorage::PROPVAR_CHANGE_FLAGS, vt : Win32cr::System::Variant::VARENUM) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropVariantToVariant(pPropVar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pVar : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantToPropVariant(pVar : Win32cr::System::Variant::VARIANT*, pPropVar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun StgSerializePropVariant(ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, ppProp : Win32cr::System::Com::StructuredStorage::SERIALIZEDPROPERTYVALUE**, pcb : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun StgDeserializePropVariant(pprop : Win32cr::System::Com::StructuredStorage::SERIALIZEDPROPERTYVALUE*, cbMax : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

  end
  {% end %}
end