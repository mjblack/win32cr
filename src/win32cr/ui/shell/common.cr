require "./../../foundation.cr"
require "./../../system/com.cr"

module Win32cr::UI::Shell::Common
  PERCEIVEDFLAG_UNDEFINED = 0_u32
  PERCEIVEDFLAG_SOFTCODED = 1_u32
  PERCEIVEDFLAG_HARDCODED = 2_u32
  PERCEIVEDFLAG_NATIVESUPPORT = 4_u32
  PERCEIVEDFLAG_GDIPLUS = 16_u32
  PERCEIVEDFLAG_WMSDK = 32_u32
  PERCEIVEDFLAG_ZIPFOLDER = 64_u32

  enum STRRET_TYPE
    STRRET_WSTR = 0_i32
    STRRET_OFFSET = 1_i32
    STRRET_CSTR = 2_i32
  end
  enum PERCEIVED
    PERCEIVED_TYPE_FIRST = -3_i32
    PERCEIVED_TYPE_CUSTOM = -3_i32
    PERCEIVED_TYPE_UNSPECIFIED = -2_i32
    PERCEIVED_TYPE_FOLDER = -1_i32
    PERCEIVED_TYPE_UNKNOWN = 0_i32
    PERCEIVED_TYPE_TEXT = 1_i32
    PERCEIVED_TYPE_IMAGE = 2_i32
    PERCEIVED_TYPE_AUDIO = 3_i32
    PERCEIVED_TYPE_VIDEO = 4_i32
    PERCEIVED_TYPE_COMPRESSED = 5_i32
    PERCEIVED_TYPE_DOCUMENT = 6_i32
    PERCEIVED_TYPE_SYSTEM = 7_i32
    PERCEIVED_TYPE_APPLICATION = 8_i32
    PERCEIVED_TYPE_GAMEMEDIA = 9_i32
    PERCEIVED_TYPE_CONTACTS = 10_i32
    PERCEIVED_TYPE_LAST = 10_i32
  end
  enum SHCOLSTATE
    SHCOLSTATE_DEFAULT = 0_i32
    SHCOLSTATE_TYPE_STR = 1_i32
    SHCOLSTATE_TYPE_INT = 2_i32
    SHCOLSTATE_TYPE_DATE = 3_i32
    SHCOLSTATE_TYPEMASK = 15_i32
    SHCOLSTATE_ONBYDEFAULT = 16_i32
    SHCOLSTATE_SLOW = 32_i32
    SHCOLSTATE_EXTENDED = 64_i32
    SHCOLSTATE_SECONDARYUI = 128_i32
    SHCOLSTATE_HIDDEN = 256_i32
    SHCOLSTATE_PREFER_VARCMP = 512_i32
    SHCOLSTATE_PREFER_FMTCMP = 1024_i32
    SHCOLSTATE_NOSORTBYFOLDERNESS = 2048_i32
    SHCOLSTATE_VIEWONLY = 65536_i32
    SHCOLSTATE_BATCHREAD = 131072_i32
    SHCOLSTATE_NO_GROUPBY = 262144_i32
    SHCOLSTATE_FIXED_WIDTH = 4096_i32
    SHCOLSTATE_NODPISCALE = 8192_i32
    SHCOLSTATE_FIXED_RATIO = 16384_i32
    SHCOLSTATE_DISPLAYMASK = 61440_i32
  end
  enum DEVICE_SCALE_FACTOR
    DEVICE_SCALE_FACTOR_INVALID = 0_i32
    SCALE_100_PERCENT = 100_i32
    SCALE_120_PERCENT = 120_i32
    SCALE_125_PERCENT = 125_i32
    SCALE_140_PERCENT = 140_i32
    SCALE_150_PERCENT = 150_i32
    SCALE_160_PERCENT = 160_i32
    SCALE_175_PERCENT = 175_i32
    SCALE_180_PERCENT = 180_i32
    SCALE_200_PERCENT = 200_i32
    SCALE_225_PERCENT = 225_i32
    SCALE_250_PERCENT = 250_i32
    SCALE_300_PERCENT = 300_i32
    SCALE_350_PERCENT = 350_i32
    SCALE_400_PERCENT = 400_i32
    SCALE_450_PERCENT = 450_i32
    SCALE_500_PERCENT = 500_i32
  end

  @[Extern]
  struct SHITEMID
    property cb : UInt16
    property abID : UInt8*
    def initialize(@cb : UInt16, @abID : UInt8*)
    end
  end

  @[Extern]
  struct ITEMIDLIST
    property mkid : Win32cr::UI::Shell::Common::SHITEMID
    def initialize(@mkid : Win32cr::UI::Shell::Common::SHITEMID)
    end
  end

  @[Extern]
  struct STRRET
    property uType : UInt32
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property pOleStr : Win32cr::Foundation::PWSTR
    property uOffset : UInt32
    property cStr : UInt8[260]
    def initialize(@pOleStr : Win32cr::Foundation::PWSTR, @uOffset : UInt32, @cStr : UInt8[260])
    end
    end

    def initialize(@uType : UInt32, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct SHELLDETAILS
    property fmt : Int32
    property cxChar : Int32
    property str : Win32cr::UI::Shell::Common::STRRET
    def initialize(@fmt : Int32, @cxChar : Int32, @str : Win32cr::UI::Shell::Common::STRRET)
    end
  end

  @[Extern]
  struct COMDLG_FILTERSPEC
    property pszName : Win32cr::Foundation::PWSTR
    property pszSpec : Win32cr::Foundation::PWSTR
    def initialize(@pszName : Win32cr::Foundation::PWSTR, @pszSpec : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  record IObjectArrayVtbl,
    query_interface : Proc(IObjectArray*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IObjectArray*, UInt32),
    release : Proc(IObjectArray*, UInt32),
    get_count : Proc(IObjectArray*, UInt32*, Win32cr::Foundation::HRESULT),
    get_at : Proc(IObjectArray*, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IObjectArray, lpVtbl : IObjectArrayVtbl* do
    GUID = LibC::GUID.new(0x92ca9dcd_u32, 0x5622_u16, 0x4bba_u16, StaticArray[0xa8_u8, 0x5_u8, 0x5e_u8, 0x9f_u8, 0x54_u8, 0x1b_u8, 0xd8_u8, 0xc9_u8])
    def query_interface(this : IObjectArray*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IObjectArray*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IObjectArray*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_count(this : IObjectArray*, pcObjects : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, pcObjects)
    end
    def get_at(this : IObjectArray*, uiIndex : UInt32, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_at.call(this, uiIndex, riid, ppv)
    end

  end

  @[Extern]
  record IObjectCollectionVtbl,
    query_interface : Proc(IObjectCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IObjectCollection*, UInt32),
    release : Proc(IObjectCollection*, UInt32),
    get_count : Proc(IObjectCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_at : Proc(IObjectCollection*, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_object : Proc(IObjectCollection*, Void*, Win32cr::Foundation::HRESULT),
    add_from_array : Proc(IObjectCollection*, Void*, Win32cr::Foundation::HRESULT),
    remove_object_at : Proc(IObjectCollection*, UInt32, Win32cr::Foundation::HRESULT),
    clear : Proc(IObjectCollection*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IObjectCollection, lpVtbl : IObjectCollectionVtbl* do
    GUID = LibC::GUID.new(0x5632b1a4_u32, 0xe38a_u16, 0x400a_u16, StaticArray[0x92_u8, 0x8a_u8, 0xd4_u8, 0xcd_u8, 0x63_u8, 0x23_u8, 0x2_u8, 0x95_u8])
    def query_interface(this : IObjectCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IObjectCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IObjectCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_count(this : IObjectCollection*, pcObjects : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, pcObjects)
    end
    def get_at(this : IObjectCollection*, uiIndex : UInt32, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_at.call(this, uiIndex, riid, ppv)
    end
    def add_object(this : IObjectCollection*, punk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_object.call(this, punk)
    end
    def add_from_array(this : IObjectCollection*, poaSource : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_from_array.call(this, poaSource)
    end
    def remove_object_at(this : IObjectCollection*, uiIndex : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_object_at.call(this, uiIndex)
    end
    def clear(this : IObjectCollection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear.call(this)
    end

  end

end