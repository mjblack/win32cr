require "./../foundation.cr"
require "./com.cr"
require "./ole.cr"

module Win32cr::System::Variant
  extend self

  @[Flags]
  enum VAR_CHANGE_FLAGS : UInt16
    VARIANT_NOVALUEPROP = 1_u16
    VARIANT_ALPHABOOL = 2_u16
    VARIANT_NOUSEROVERRIDE = 4_u16
    VARIANT_CALENDAR_HIJRI = 8_u16
    VARIANT_LOCALBOOL = 16_u16
    VARIANT_CALENDAR_THAI = 32_u16
    VARIANT_CALENDAR_GREGORIAN = 64_u16
    VARIANT_USE_NLS = 128_u16
  end
  @[Flags]
  enum VARENUM : UInt16
    VT_EMPTY = 0_u16
    VT_NULL = 1_u16
    VT_I2 = 2_u16
    VT_I4 = 3_u16
    VT_R4 = 4_u16
    VT_R8 = 5_u16
    VT_CY = 6_u16
    VT_DATE = 7_u16
    VT_BSTR = 8_u16
    VT_DISPATCH = 9_u16
    VT_ERROR = 10_u16
    VT_BOOL = 11_u16
    VT_VARIANT = 12_u16
    VT_UNKNOWN = 13_u16
    VT_DECIMAL = 14_u16
    VT_I1 = 16_u16
    VT_UI1 = 17_u16
    VT_UI2 = 18_u16
    VT_UI4 = 19_u16
    VT_I8 = 20_u16
    VT_UI8 = 21_u16
    VT_INT = 22_u16
    VT_UINT = 23_u16
    VT_VOID = 24_u16
    VT_HRESULT = 25_u16
    VT_PTR = 26_u16
    VT_SAFEARRAY = 27_u16
    VT_CARRAY = 28_u16
    VT_USERDEFINED = 29_u16
    VT_LPSTR = 30_u16
    VT_LPWSTR = 31_u16
    VT_RECORD = 36_u16
    VT_INT_PTR = 37_u16
    VT_UINT_PTR = 38_u16
    VT_FILETIME = 64_u16
    VT_BLOB = 65_u16
    VT_STREAM = 66_u16
    VT_STORAGE = 67_u16
    VT_STREAMED_OBJECT = 68_u16
    VT_STORED_OBJECT = 69_u16
    VT_BLOB_OBJECT = 70_u16
    VT_CF = 71_u16
    VT_CLSID = 72_u16
    VT_VERSIONED_STREAM = 73_u16
    VT_BSTR_BLOB = 4095_u16
    VT_VECTOR = 4096_u16
    VT_ARRAY = 8192_u16
    VT_BYREF = 16384_u16
    VT_RESERVED = 32768_u16
    VT_ILLEGAL = 65535_u16
    VT_ILLEGALMASKED = 4095_u16
    VT_TYPEMASK = 4095_u16
  end
  @[Flags]
  enum PSTIME_FLAGS
    PSTF_UTC = 0_i32
    PSTF_LOCAL = 1_i32
  end
  @[Flags]
  enum DRAWPROGRESSFLAGS
    DPF_NONE = 0_i32
    DPF_MARQUEE = 1_i32
    DPF_MARQUEE_COMPLETE = 2_i32
    DPF_ERROR = 4_i32
    DPF_WARNING = 8_i32
    DPF_STOPPED = 16_i32
  end

  @[Extern]
  struct VARIANT
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
    property llVal : Int64
    property lVal : Int32
    property bVal : UInt8
    property iVal : Int16
    property fltVal : Float32
    property dblVal : Float64
    property boolVal : Win32cr::Foundation::VARIANT_BOOL
    property __obsolete__variant_bool : Win32cr::Foundation::VARIANT_BOOL
    property scode : Int32
    property cyVal : Win32cr::System::Com::CY
    property date : Float64
    property bstrVal : Win32cr::Foundation::BSTR
    property punkVal : Void*
    property pdispVal : Void*
    property parray : Win32cr::System::Com::SAFEARRAY*
    property pbVal : UInt8*
    property piVal : Int16*
    property plVal : Int32*
    property pllVal : Int64*
    property pfltVal : Float32*
    property pdblVal : Float64*
    property pboolVal : Win32cr::Foundation::VARIANT_BOOL*
    property __obsolete__variant_pbool : Win32cr::Foundation::VARIANT_BOOL*
    property pscode : Int32*
    property pcyVal : Win32cr::System::Com::CY*
    property pdate : Float64*
    property pbstrVal : Win32cr::Foundation::BSTR*
    property ppunkVal : Void**
    property ppdispVal : Void**
    property pparray : Win32cr::System::Com::SAFEARRAY**
    property pvarVal : Win32cr::System::Variant::VARIANT*
    property byref : Void*
    property cVal : Win32cr::Foundation::CHAR
    property uiVal : UInt16
    property ulVal : UInt32
    property ullVal : UInt64
    property intVal : Int32
    property uintVal : UInt32
    property pdecVal : Win32cr::Foundation::DECIMAL*
    property pcVal : Win32cr::Foundation::PSTR
    property puiVal : UInt16*
    property pulVal : UInt32*
    property pullVal : UInt64*
    property pintVal : Int32*
    property puintVal : UInt32*
    property anonymous : Anonymous_e__Struct_

          # Nested Type Anonymous_e__Struct_
          @[Extern]
          struct Anonymous_e__Struct_
    property pvRecord : Void*
    property pRecInfo : Void*
    def initialize(@pvRecord : Void*, @pRecInfo : Void*)
    end
          end

    def initialize(@llVal : Int64, @lVal : Int32, @bVal : UInt8, @iVal : Int16, @fltVal : Float32, @dblVal : Float64, @boolVal : Win32cr::Foundation::VARIANT_BOOL, @__obsolete__variant_bool : Win32cr::Foundation::VARIANT_BOOL, @scode : Int32, @cyVal : Win32cr::System::Com::CY, @date : Float64, @bstrVal : Win32cr::Foundation::BSTR, @punkVal : Void*, @pdispVal : Void*, @parray : Win32cr::System::Com::SAFEARRAY*, @pbVal : UInt8*, @piVal : Int16*, @plVal : Int32*, @pllVal : Int64*, @pfltVal : Float32*, @pdblVal : Float64*, @pboolVal : Win32cr::Foundation::VARIANT_BOOL*, @__obsolete__variant_pbool : Win32cr::Foundation::VARIANT_BOOL*, @pscode : Int32*, @pcyVal : Win32cr::System::Com::CY*, @pdate : Float64*, @pbstrVal : Win32cr::Foundation::BSTR*, @ppunkVal : Void**, @ppdispVal : Void**, @pparray : Win32cr::System::Com::SAFEARRAY**, @pvarVal : Win32cr::System::Variant::VARIANT*, @byref : Void*, @cVal : Win32cr::Foundation::CHAR, @uiVal : UInt16, @ulVal : UInt32, @ullVal : UInt64, @intVal : Int32, @uintVal : UInt32, @pdecVal : Win32cr::Foundation::DECIMAL*, @pcVal : Win32cr::Foundation::PSTR, @puiVal : UInt16*, @pulVal : UInt32*, @pullVal : UInt64*, @pintVal : Int32*, @puintVal : UInt32*, @anonymous : Anonymous_e__Struct_)
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

  def vARIANTUserSize(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::System::Variant::VARIANT*) : UInt32
    {% if !flag?(:docs) %}
    C.VARIANT_UserSize(param0, param1, param2)
    {% end %}
  end

  def vARIANTUserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Variant::VARIANT*) : UInt8*
    {% if !flag?(:docs) %}
    C.VARIANT_UserMarshal(param0, param1, param2)
    {% end %}
  end

  def vARIANTUserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Variant::VARIANT*) : UInt8*
    {% if !flag?(:docs) %}
    C.VARIANT_UserUnmarshal(param0, param1, param2)
    {% end %}
  end

  def vARIANTUserFree(param0 : UInt32*, param1 : Win32cr::System::Variant::VARIANT*) : Void
    {% if !flag?(:docs) %}
    C.VARIANT_UserFree(param0, param1)
    {% end %}
  end

  def vARIANTUserSize64(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::System::Variant::VARIANT*) : UInt32
    {% if !flag?(:docs) %}
    C.VARIANT_UserSize64(param0, param1, param2)
    {% end %}
  end

  def vARIANTUserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Variant::VARIANT*) : UInt8*
    {% if !flag?(:docs) %}
    C.VARIANT_UserMarshal64(param0, param1, param2)
    {% end %}
  end

  def vARIANTUserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Variant::VARIANT*) : UInt8*
    {% if !flag?(:docs) %}
    C.VARIANT_UserUnmarshal64(param0, param1, param2)
    {% end %}
  end

  def vARIANTUserFree64(param0 : UInt32*, param1 : Win32cr::System::Variant::VARIANT*) : Void
    {% if !flag?(:docs) %}
    C.VARIANT_UserFree64(param0, param1)
    {% end %}
  end

  def dosDateTimeToVariantTime(wDosDate : UInt16, wDosTime : UInt16, pvtime : Float64*) : Int32
    {% if !flag?(:docs) %}
    C.DosDateTimeToVariantTime(wDosDate, wDosTime, pvtime)
    {% end %}
  end

  def variantTimeToDosDateTime(vtime : Float64, pwDosDate : UInt16*, pwDosTime : UInt16*) : Int32
    {% if !flag?(:docs) %}
    C.VariantTimeToDosDateTime(vtime, pwDosDate, pwDosTime)
    {% end %}
  end

  def systemTimeToVariantTime(lpSystemTime : Win32cr::Foundation::SYSTEMTIME*, pvtime : Float64*) : Int32
    {% if !flag?(:docs) %}
    C.SystemTimeToVariantTime(lpSystemTime, pvtime)
    {% end %}
  end

  def variantTimeToSystemTime(vtime : Float64, lpSystemTime : Win32cr::Foundation::SYSTEMTIME*) : Int32
    {% if !flag?(:docs) %}
    C.VariantTimeToSystemTime(vtime, lpSystemTime)
    {% end %}
  end

  def variantInit(pvarg : Win32cr::System::Variant::VARIANT*) : Void
    {% if !flag?(:docs) %}
    C.VariantInit(pvarg)
    {% end %}
  end

  def variantClear(pvarg : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantClear(pvarg)
    {% end %}
  end

  def variantCopy(pvargDest : Win32cr::System::Variant::VARIANT*, pvargSrc : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantCopy(pvargDest, pvargSrc)
    {% end %}
  end

  def variantCopyInd(pvarDest : Win32cr::System::Variant::VARIANT*, pvargSrc : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantCopyInd(pvarDest, pvargSrc)
    {% end %}
  end

  def variantChangeType(pvargDest : Win32cr::System::Variant::VARIANT*, pvarSrc : Win32cr::System::Variant::VARIANT*, wFlags : Win32cr::System::Variant::VAR_CHANGE_FLAGS, vt : Win32cr::System::Variant::VARENUM) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantChangeType(pvargDest, pvarSrc, wFlags, vt)
    {% end %}
  end

  def variantChangeTypeEx(pvargDest : Win32cr::System::Variant::VARIANT*, pvarSrc : Win32cr::System::Variant::VARIANT*, lcid : UInt32, wFlags : Win32cr::System::Variant::VAR_CHANGE_FLAGS, vt : Win32cr::System::Variant::VARENUM) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantChangeTypeEx(pvargDest, pvarSrc, lcid, wFlags, vt)
    {% end %}
  end

  def initVariantFromResource(hinst : Win32cr::Foundation::HINSTANCE, id : UInt32, pvar : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.InitVariantFromResource(hinst, id, pvar)
    {% end %}
  end

  def initVariantFromBuffer(pv : Void*, cb : UInt32, pvar : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.InitVariantFromBuffer(pv, cb, pvar)
    {% end %}
  end

  def initVariantFromGUIDAsString(guid : LibC::GUID*, pvar : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.InitVariantFromGUIDAsString(guid, pvar)
    {% end %}
  end

  def initVariantFromFileTime(pft : Win32cr::Foundation::FILETIME*, pvar : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.InitVariantFromFileTime(pft, pvar)
    {% end %}
  end

  def initVariantFromFileTimeArray(prgft : Win32cr::Foundation::FILETIME*, cElems : UInt32, pvar : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.InitVariantFromFileTimeArray(prgft, cElems, pvar)
    {% end %}
  end

  def initVariantFromVariantArrayElem(varIn : Win32cr::System::Variant::VARIANT*, iElem : UInt32, pvar : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.InitVariantFromVariantArrayElem(varIn, iElem, pvar)
    {% end %}
  end

  def initVariantFromBooleanArray(prgf : Win32cr::Foundation::BOOL*, cElems : UInt32, pvar : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.InitVariantFromBooleanArray(prgf, cElems, pvar)
    {% end %}
  end

  def initVariantFromInt16Array(prgn : Int16*, cElems : UInt32, pvar : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.InitVariantFromInt16Array(prgn, cElems, pvar)
    {% end %}
  end

  def initVariantFromUInt16Array(prgn : UInt16*, cElems : UInt32, pvar : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.InitVariantFromUInt16Array(prgn, cElems, pvar)
    {% end %}
  end

  def initVariantFromInt32Array(prgn : Int32*, cElems : UInt32, pvar : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.InitVariantFromInt32Array(prgn, cElems, pvar)
    {% end %}
  end

  def initVariantFromUInt32Array(prgn : UInt32*, cElems : UInt32, pvar : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.InitVariantFromUInt32Array(prgn, cElems, pvar)
    {% end %}
  end

  def initVariantFromInt64Array(prgn : Int64*, cElems : UInt32, pvar : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.InitVariantFromInt64Array(prgn, cElems, pvar)
    {% end %}
  end

  def initVariantFromUInt64Array(prgn : UInt64*, cElems : UInt32, pvar : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.InitVariantFromUInt64Array(prgn, cElems, pvar)
    {% end %}
  end

  def initVariantFromDoubleArray(prgn : Float64*, cElems : UInt32, pvar : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.InitVariantFromDoubleArray(prgn, cElems, pvar)
    {% end %}
  end

  def initVariantFromStringArray(prgsz : Win32cr::Foundation::PWSTR*, cElems : UInt32, pvar : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.InitVariantFromStringArray(prgsz, cElems, pvar)
    {% end %}
  end

  def variantToBooleanWithDefault(varIn : Win32cr::System::Variant::VARIANT*, fDefault : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.VariantToBooleanWithDefault(varIn, fDefault)
    {% end %}
  end

  def variantToInt16WithDefault(varIn : Win32cr::System::Variant::VARIANT*, iDefault : Int16) : Int16
    {% if !flag?(:docs) %}
    C.VariantToInt16WithDefault(varIn, iDefault)
    {% end %}
  end

  def variantToUInt16WithDefault(varIn : Win32cr::System::Variant::VARIANT*, uiDefault : UInt16) : UInt16
    {% if !flag?(:docs) %}
    C.VariantToUInt16WithDefault(varIn, uiDefault)
    {% end %}
  end

  def variantToInt32WithDefault(varIn : Win32cr::System::Variant::VARIANT*, lDefault : Int32) : Int32
    {% if !flag?(:docs) %}
    C.VariantToInt32WithDefault(varIn, lDefault)
    {% end %}
  end

  def variantToUInt32WithDefault(varIn : Win32cr::System::Variant::VARIANT*, ulDefault : UInt32) : UInt32
    {% if !flag?(:docs) %}
    C.VariantToUInt32WithDefault(varIn, ulDefault)
    {% end %}
  end

  def variantToInt64WithDefault(varIn : Win32cr::System::Variant::VARIANT*, llDefault : Int64) : Int64
    {% if !flag?(:docs) %}
    C.VariantToInt64WithDefault(varIn, llDefault)
    {% end %}
  end

  def variantToUInt64WithDefault(varIn : Win32cr::System::Variant::VARIANT*, ullDefault : UInt64) : UInt64
    {% if !flag?(:docs) %}
    C.VariantToUInt64WithDefault(varIn, ullDefault)
    {% end %}
  end

  def variantToDoubleWithDefault(varIn : Win32cr::System::Variant::VARIANT*, dblDefault : Float64) : Float64
    {% if !flag?(:docs) %}
    C.VariantToDoubleWithDefault(varIn, dblDefault)
    {% end %}
  end

  def variantToStringWithDefault(varIn : Win32cr::System::Variant::VARIANT*, pszDefault : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::PWSTR
    {% if !flag?(:docs) %}
    C.VariantToStringWithDefault(varIn, pszDefault)
    {% end %}
  end

  def variantToBoolean(varIn : Win32cr::System::Variant::VARIANT*, pfRet : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantToBoolean(varIn, pfRet)
    {% end %}
  end

  def variantToInt16(varIn : Win32cr::System::Variant::VARIANT*, piRet : Int16*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantToInt16(varIn, piRet)
    {% end %}
  end

  def variantToUInt16(varIn : Win32cr::System::Variant::VARIANT*, puiRet : UInt16*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantToUInt16(varIn, puiRet)
    {% end %}
  end

  def variantToInt32(varIn : Win32cr::System::Variant::VARIANT*, plRet : Int32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantToInt32(varIn, plRet)
    {% end %}
  end

  def variantToUInt32(varIn : Win32cr::System::Variant::VARIANT*, pulRet : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantToUInt32(varIn, pulRet)
    {% end %}
  end

  def variantToInt64(varIn : Win32cr::System::Variant::VARIANT*, pllRet : Int64*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantToInt64(varIn, pllRet)
    {% end %}
  end

  def variantToUInt64(varIn : Win32cr::System::Variant::VARIANT*, pullRet : UInt64*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantToUInt64(varIn, pullRet)
    {% end %}
  end

  def variantToDouble(varIn : Win32cr::System::Variant::VARIANT*, pdblRet : Float64*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantToDouble(varIn, pdblRet)
    {% end %}
  end

  def variantToBuffer(varIn : Win32cr::System::Variant::VARIANT*, pv : Void*, cb : UInt32) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantToBuffer(varIn, pv, cb)
    {% end %}
  end

  def variantToGUID(varIn : Win32cr::System::Variant::VARIANT*, pguid : LibC::GUID*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantToGUID(varIn, pguid)
    {% end %}
  end

  def variantToString(varIn : Win32cr::System::Variant::VARIANT*, pszBuf : Win32cr::Foundation::PWSTR, cchBuf : UInt32) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantToString(varIn, pszBuf, cchBuf)
    {% end %}
  end

  def variantToStringAlloc(varIn : Win32cr::System::Variant::VARIANT*, ppszBuf : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantToStringAlloc(varIn, ppszBuf)
    {% end %}
  end

  def variantToDosDateTime(varIn : Win32cr::System::Variant::VARIANT*, pwDate : UInt16*, pwTime : UInt16*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantToDosDateTime(varIn, pwDate, pwTime)
    {% end %}
  end

  def variantToFileTime(varIn : Win32cr::System::Variant::VARIANT*, stfOut : Win32cr::System::Variant::PSTIME_FLAGS, pftOut : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantToFileTime(varIn, stfOut, pftOut)
    {% end %}
  end

  def variantGetElementCount(varIn : Win32cr::System::Variant::VARIANT*) : UInt32
    {% if !flag?(:docs) %}
    C.VariantGetElementCount(varIn)
    {% end %}
  end

  def variantToBooleanArray(var : Win32cr::System::Variant::VARIANT*, prgf : Win32cr::Foundation::BOOL*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantToBooleanArray(var, prgf, crgn, pcElem)
    {% end %}
  end

  def variantToInt16Array(var : Win32cr::System::Variant::VARIANT*, prgn : Int16*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantToInt16Array(var, prgn, crgn, pcElem)
    {% end %}
  end

  def variantToUInt16Array(var : Win32cr::System::Variant::VARIANT*, prgn : UInt16*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantToUInt16Array(var, prgn, crgn, pcElem)
    {% end %}
  end

  def variantToInt32Array(var : Win32cr::System::Variant::VARIANT*, prgn : Int32*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantToInt32Array(var, prgn, crgn, pcElem)
    {% end %}
  end

  def variantToUInt32Array(var : Win32cr::System::Variant::VARIANT*, prgn : UInt32*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantToUInt32Array(var, prgn, crgn, pcElem)
    {% end %}
  end

  def variantToInt64Array(var : Win32cr::System::Variant::VARIANT*, prgn : Int64*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantToInt64Array(var, prgn, crgn, pcElem)
    {% end %}
  end

  def variantToUInt64Array(var : Win32cr::System::Variant::VARIANT*, prgn : UInt64*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantToUInt64Array(var, prgn, crgn, pcElem)
    {% end %}
  end

  def variantToDoubleArray(var : Win32cr::System::Variant::VARIANT*, prgn : Float64*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantToDoubleArray(var, prgn, crgn, pcElem)
    {% end %}
  end

  def variantToStringArray(var : Win32cr::System::Variant::VARIANT*, prgsz : Win32cr::Foundation::PWSTR*, crgsz : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantToStringArray(var, prgsz, crgsz, pcElem)
    {% end %}
  end

  def variantToBooleanArrayAlloc(var : Win32cr::System::Variant::VARIANT*, pprgf : Win32cr::Foundation::BOOL**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantToBooleanArrayAlloc(var, pprgf, pcElem)
    {% end %}
  end

  def variantToInt16ArrayAlloc(var : Win32cr::System::Variant::VARIANT*, pprgn : Int16**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantToInt16ArrayAlloc(var, pprgn, pcElem)
    {% end %}
  end

  def variantToUInt16ArrayAlloc(var : Win32cr::System::Variant::VARIANT*, pprgn : UInt16**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantToUInt16ArrayAlloc(var, pprgn, pcElem)
    {% end %}
  end

  def variantToInt32ArrayAlloc(var : Win32cr::System::Variant::VARIANT*, pprgn : Int32**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantToInt32ArrayAlloc(var, pprgn, pcElem)
    {% end %}
  end

  def variantToUInt32ArrayAlloc(var : Win32cr::System::Variant::VARIANT*, pprgn : UInt32**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantToUInt32ArrayAlloc(var, pprgn, pcElem)
    {% end %}
  end

  def variantToInt64ArrayAlloc(var : Win32cr::System::Variant::VARIANT*, pprgn : Int64**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantToInt64ArrayAlloc(var, pprgn, pcElem)
    {% end %}
  end

  def variantToUInt64ArrayAlloc(var : Win32cr::System::Variant::VARIANT*, pprgn : UInt64**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantToUInt64ArrayAlloc(var, pprgn, pcElem)
    {% end %}
  end

  def variantToDoubleArrayAlloc(var : Win32cr::System::Variant::VARIANT*, pprgn : Float64**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantToDoubleArrayAlloc(var, pprgn, pcElem)
    {% end %}
  end

  def variantToStringArrayAlloc(var : Win32cr::System::Variant::VARIANT*, pprgsz : Win32cr::Foundation::PWSTR**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantToStringArrayAlloc(var, pprgsz, pcElem)
    {% end %}
  end

  def variantGetBooleanElem(var : Win32cr::System::Variant::VARIANT*, iElem : UInt32, pfVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantGetBooleanElem(var, iElem, pfVal)
    {% end %}
  end

  def variantGetInt16Elem(var : Win32cr::System::Variant::VARIANT*, iElem : UInt32, pnVal : Int16*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantGetInt16Elem(var, iElem, pnVal)
    {% end %}
  end

  def variantGetUInt16Elem(var : Win32cr::System::Variant::VARIANT*, iElem : UInt32, pnVal : UInt16*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantGetUInt16Elem(var, iElem, pnVal)
    {% end %}
  end

  def variantGetInt32Elem(var : Win32cr::System::Variant::VARIANT*, iElem : UInt32, pnVal : Int32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantGetInt32Elem(var, iElem, pnVal)
    {% end %}
  end

  def variantGetUInt32Elem(var : Win32cr::System::Variant::VARIANT*, iElem : UInt32, pnVal : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantGetUInt32Elem(var, iElem, pnVal)
    {% end %}
  end

  def variantGetInt64Elem(var : Win32cr::System::Variant::VARIANT*, iElem : UInt32, pnVal : Int64*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantGetInt64Elem(var, iElem, pnVal)
    {% end %}
  end

  def variantGetUInt64Elem(var : Win32cr::System::Variant::VARIANT*, iElem : UInt32, pnVal : UInt64*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantGetUInt64Elem(var, iElem, pnVal)
    {% end %}
  end

  def variantGetDoubleElem(var : Win32cr::System::Variant::VARIANT*, iElem : UInt32, pnVal : Float64*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantGetDoubleElem(var, iElem, pnVal)
    {% end %}
  end

  def variantGetStringElem(var : Win32cr::System::Variant::VARIANT*, iElem : UInt32, ppszVal : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.VariantGetStringElem(var, iElem, ppszVal)
    {% end %}
  end

  def clearVariantArray(pvars : Win32cr::System::Variant::VARIANT*, cvars : UInt32) : Void
    {% if !flag?(:docs) %}
    C.ClearVariantArray(pvars, cvars)
    {% end %}
  end

  def variantCompare(var1 : Win32cr::System::Variant::VARIANT*, var2 : Win32cr::System::Variant::VARIANT*) : Int32
    {% if !flag?(:docs) %}
    C.VariantCompare(var1, var2)
    {% end %}
  end

  @[Link("oleaut32")]
  @[Link("propsys")]
  {% if !flag?(:docs) %}
  lib C
    # :nodoc:
    fun VARIANT_UserSize(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::System::Variant::VARIANT*) : UInt32

    # :nodoc:
    fun VARIANT_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Variant::VARIANT*) : UInt8*

    # :nodoc:
    fun VARIANT_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Variant::VARIANT*) : UInt8*

    # :nodoc:
    fun VARIANT_UserFree(param0 : UInt32*, param1 : Win32cr::System::Variant::VARIANT*) : Void

    # :nodoc:
    fun VARIANT_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::System::Variant::VARIANT*) : UInt32

    # :nodoc:
    fun VARIANT_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Variant::VARIANT*) : UInt8*

    # :nodoc:
    fun VARIANT_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Variant::VARIANT*) : UInt8*

    # :nodoc:
    fun VARIANT_UserFree64(param0 : UInt32*, param1 : Win32cr::System::Variant::VARIANT*) : Void

    # :nodoc:
    fun DosDateTimeToVariantTime(wDosDate : UInt16, wDosTime : UInt16, pvtime : Float64*) : Int32

    # :nodoc:
    fun VariantTimeToDosDateTime(vtime : Float64, pwDosDate : UInt16*, pwDosTime : UInt16*) : Int32

    # :nodoc:
    fun SystemTimeToVariantTime(lpSystemTime : Win32cr::Foundation::SYSTEMTIME*, pvtime : Float64*) : Int32

    # :nodoc:
    fun VariantTimeToSystemTime(vtime : Float64, lpSystemTime : Win32cr::Foundation::SYSTEMTIME*) : Int32

    # :nodoc:
    fun VariantInit(pvarg : Win32cr::System::Variant::VARIANT*) : Void

    # :nodoc:
    fun VariantClear(pvarg : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantCopy(pvargDest : Win32cr::System::Variant::VARIANT*, pvargSrc : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantCopyInd(pvarDest : Win32cr::System::Variant::VARIANT*, pvargSrc : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantChangeType(pvargDest : Win32cr::System::Variant::VARIANT*, pvarSrc : Win32cr::System::Variant::VARIANT*, wFlags : Win32cr::System::Variant::VAR_CHANGE_FLAGS, vt : Win32cr::System::Variant::VARENUM) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantChangeTypeEx(pvargDest : Win32cr::System::Variant::VARIANT*, pvarSrc : Win32cr::System::Variant::VARIANT*, lcid : UInt32, wFlags : Win32cr::System::Variant::VAR_CHANGE_FLAGS, vt : Win32cr::System::Variant::VARENUM) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun InitVariantFromResource(hinst : Win32cr::Foundation::HINSTANCE, id : UInt32, pvar : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun InitVariantFromBuffer(pv : Void*, cb : UInt32, pvar : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun InitVariantFromGUIDAsString(guid : LibC::GUID*, pvar : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun InitVariantFromFileTime(pft : Win32cr::Foundation::FILETIME*, pvar : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun InitVariantFromFileTimeArray(prgft : Win32cr::Foundation::FILETIME*, cElems : UInt32, pvar : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun InitVariantFromVariantArrayElem(varIn : Win32cr::System::Variant::VARIANT*, iElem : UInt32, pvar : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun InitVariantFromBooleanArray(prgf : Win32cr::Foundation::BOOL*, cElems : UInt32, pvar : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun InitVariantFromInt16Array(prgn : Int16*, cElems : UInt32, pvar : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun InitVariantFromUInt16Array(prgn : UInt16*, cElems : UInt32, pvar : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun InitVariantFromInt32Array(prgn : Int32*, cElems : UInt32, pvar : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun InitVariantFromUInt32Array(prgn : UInt32*, cElems : UInt32, pvar : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun InitVariantFromInt64Array(prgn : Int64*, cElems : UInt32, pvar : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun InitVariantFromUInt64Array(prgn : UInt64*, cElems : UInt32, pvar : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun InitVariantFromDoubleArray(prgn : Float64*, cElems : UInt32, pvar : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun InitVariantFromStringArray(prgsz : Win32cr::Foundation::PWSTR*, cElems : UInt32, pvar : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantToBooleanWithDefault(varIn : Win32cr::System::Variant::VARIANT*, fDefault : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun VariantToInt16WithDefault(varIn : Win32cr::System::Variant::VARIANT*, iDefault : Int16) : Int16

    # :nodoc:
    fun VariantToUInt16WithDefault(varIn : Win32cr::System::Variant::VARIANT*, uiDefault : UInt16) : UInt16

    # :nodoc:
    fun VariantToInt32WithDefault(varIn : Win32cr::System::Variant::VARIANT*, lDefault : Int32) : Int32

    # :nodoc:
    fun VariantToUInt32WithDefault(varIn : Win32cr::System::Variant::VARIANT*, ulDefault : UInt32) : UInt32

    # :nodoc:
    fun VariantToInt64WithDefault(varIn : Win32cr::System::Variant::VARIANT*, llDefault : Int64) : Int64

    # :nodoc:
    fun VariantToUInt64WithDefault(varIn : Win32cr::System::Variant::VARIANT*, ullDefault : UInt64) : UInt64

    # :nodoc:
    fun VariantToDoubleWithDefault(varIn : Win32cr::System::Variant::VARIANT*, dblDefault : Float64) : Float64

    # :nodoc:
    fun VariantToStringWithDefault(varIn : Win32cr::System::Variant::VARIANT*, pszDefault : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::PWSTR

    # :nodoc:
    fun VariantToBoolean(varIn : Win32cr::System::Variant::VARIANT*, pfRet : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantToInt16(varIn : Win32cr::System::Variant::VARIANT*, piRet : Int16*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantToUInt16(varIn : Win32cr::System::Variant::VARIANT*, puiRet : UInt16*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantToInt32(varIn : Win32cr::System::Variant::VARIANT*, plRet : Int32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantToUInt32(varIn : Win32cr::System::Variant::VARIANT*, pulRet : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantToInt64(varIn : Win32cr::System::Variant::VARIANT*, pllRet : Int64*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantToUInt64(varIn : Win32cr::System::Variant::VARIANT*, pullRet : UInt64*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantToDouble(varIn : Win32cr::System::Variant::VARIANT*, pdblRet : Float64*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantToBuffer(varIn : Win32cr::System::Variant::VARIANT*, pv : Void*, cb : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantToGUID(varIn : Win32cr::System::Variant::VARIANT*, pguid : LibC::GUID*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantToString(varIn : Win32cr::System::Variant::VARIANT*, pszBuf : Win32cr::Foundation::PWSTR, cchBuf : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantToStringAlloc(varIn : Win32cr::System::Variant::VARIANT*, ppszBuf : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantToDosDateTime(varIn : Win32cr::System::Variant::VARIANT*, pwDate : UInt16*, pwTime : UInt16*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantToFileTime(varIn : Win32cr::System::Variant::VARIANT*, stfOut : Win32cr::System::Variant::PSTIME_FLAGS, pftOut : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantGetElementCount(varIn : Win32cr::System::Variant::VARIANT*) : UInt32

    # :nodoc:
    fun VariantToBooleanArray(var : Win32cr::System::Variant::VARIANT*, prgf : Win32cr::Foundation::BOOL*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantToInt16Array(var : Win32cr::System::Variant::VARIANT*, prgn : Int16*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantToUInt16Array(var : Win32cr::System::Variant::VARIANT*, prgn : UInt16*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantToInt32Array(var : Win32cr::System::Variant::VARIANT*, prgn : Int32*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantToUInt32Array(var : Win32cr::System::Variant::VARIANT*, prgn : UInt32*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantToInt64Array(var : Win32cr::System::Variant::VARIANT*, prgn : Int64*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantToUInt64Array(var : Win32cr::System::Variant::VARIANT*, prgn : UInt64*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantToDoubleArray(var : Win32cr::System::Variant::VARIANT*, prgn : Float64*, crgn : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantToStringArray(var : Win32cr::System::Variant::VARIANT*, prgsz : Win32cr::Foundation::PWSTR*, crgsz : UInt32, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantToBooleanArrayAlloc(var : Win32cr::System::Variant::VARIANT*, pprgf : Win32cr::Foundation::BOOL**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantToInt16ArrayAlloc(var : Win32cr::System::Variant::VARIANT*, pprgn : Int16**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantToUInt16ArrayAlloc(var : Win32cr::System::Variant::VARIANT*, pprgn : UInt16**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantToInt32ArrayAlloc(var : Win32cr::System::Variant::VARIANT*, pprgn : Int32**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantToUInt32ArrayAlloc(var : Win32cr::System::Variant::VARIANT*, pprgn : UInt32**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantToInt64ArrayAlloc(var : Win32cr::System::Variant::VARIANT*, pprgn : Int64**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantToUInt64ArrayAlloc(var : Win32cr::System::Variant::VARIANT*, pprgn : UInt64**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantToDoubleArrayAlloc(var : Win32cr::System::Variant::VARIANT*, pprgn : Float64**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantToStringArrayAlloc(var : Win32cr::System::Variant::VARIANT*, pprgsz : Win32cr::Foundation::PWSTR**, pcElem : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantGetBooleanElem(var : Win32cr::System::Variant::VARIANT*, iElem : UInt32, pfVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantGetInt16Elem(var : Win32cr::System::Variant::VARIANT*, iElem : UInt32, pnVal : Int16*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantGetUInt16Elem(var : Win32cr::System::Variant::VARIANT*, iElem : UInt32, pnVal : UInt16*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantGetInt32Elem(var : Win32cr::System::Variant::VARIANT*, iElem : UInt32, pnVal : Int32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantGetUInt32Elem(var : Win32cr::System::Variant::VARIANT*, iElem : UInt32, pnVal : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantGetInt64Elem(var : Win32cr::System::Variant::VARIANT*, iElem : UInt32, pnVal : Int64*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantGetUInt64Elem(var : Win32cr::System::Variant::VARIANT*, iElem : UInt32, pnVal : UInt64*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantGetDoubleElem(var : Win32cr::System::Variant::VARIANT*, iElem : UInt32, pnVal : Float64*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun VariantGetStringElem(var : Win32cr::System::Variant::VARIANT*, iElem : UInt32, ppszVal : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ClearVariantArray(pvars : Win32cr::System::Variant::VARIANT*, cvars : UInt32) : Void

    # :nodoc:
    fun VariantCompare(var1 : Win32cr::System::Variant::VARIANT*, var2 : Win32cr::System::Variant::VARIANT*) : Int32

  end
  {% end %}
end