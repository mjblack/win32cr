require "../../foundation.cr"
require "../../system/com.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32
  PERCEIVEDFLAG_UNDEFINED = 0_u32
  PERCEIVEDFLAG_SOFTCODED = 1_u32
  PERCEIVEDFLAG_HARDCODED = 2_u32
  PERCEIVEDFLAG_NATIVESUPPORT = 4_u32
  PERCEIVEDFLAG_GDIPLUS = 16_u32
  PERCEIVEDFLAG_WMSDK = 32_u32
  PERCEIVEDFLAG_ZIPFOLDER = 64_u32


  enum STRRET_TYPE : Int32
    STRRET_WSTR = 0
    STRRET_OFFSET = 1
    STRRET_CSTR = 2
  end

  enum PERCEIVED : Int32
    PERCEIVED_TYPE_FIRST = -3
    PERCEIVED_TYPE_CUSTOM = -3
    PERCEIVED_TYPE_UNSPECIFIED = -2
    PERCEIVED_TYPE_FOLDER = -1
    PERCEIVED_TYPE_UNKNOWN = 0
    PERCEIVED_TYPE_TEXT = 1
    PERCEIVED_TYPE_IMAGE = 2
    PERCEIVED_TYPE_AUDIO = 3
    PERCEIVED_TYPE_VIDEO = 4
    PERCEIVED_TYPE_COMPRESSED = 5
    PERCEIVED_TYPE_DOCUMENT = 6
    PERCEIVED_TYPE_SYSTEM = 7
    PERCEIVED_TYPE_APPLICATION = 8
    PERCEIVED_TYPE_GAMEMEDIA = 9
    PERCEIVED_TYPE_CONTACTS = 10
    PERCEIVED_TYPE_LAST = 10
  end

  enum SHCOLSTATE : Int32
    SHCOLSTATE_DEFAULT = 0
    SHCOLSTATE_TYPE_STR = 1
    SHCOLSTATE_TYPE_INT = 2
    SHCOLSTATE_TYPE_DATE = 3
    SHCOLSTATE_TYPEMASK = 15
    SHCOLSTATE_ONBYDEFAULT = 16
    SHCOLSTATE_SLOW = 32
    SHCOLSTATE_EXTENDED = 64
    SHCOLSTATE_SECONDARYUI = 128
    SHCOLSTATE_HIDDEN = 256
    SHCOLSTATE_PREFER_VARCMP = 512
    SHCOLSTATE_PREFER_FMTCMP = 1024
    SHCOLSTATE_NOSORTBYFOLDERNESS = 2048
    SHCOLSTATE_VIEWONLY = 65536
    SHCOLSTATE_BATCHREAD = 131072
    SHCOLSTATE_NO_GROUPBY = 262144
    SHCOLSTATE_FIXED_WIDTH = 4096
    SHCOLSTATE_NODPISCALE = 8192
    SHCOLSTATE_FIXED_RATIO = 16384
    SHCOLSTATE_DISPLAYMASK = 61440
  end

  enum DEVICE_SCALE_FACTOR : Int32
    DEVICE_SCALE_FACTOR_INVALID = 0
    SCALE_100_PERCENT = 100
    SCALE_120_PERCENT = 120
    SCALE_125_PERCENT = 125
    SCALE_140_PERCENT = 140
    SCALE_150_PERCENT = 150
    SCALE_160_PERCENT = 160
    SCALE_175_PERCENT = 175
    SCALE_180_PERCENT = 180
    SCALE_200_PERCENT = 200
    SCALE_225_PERCENT = 225
    SCALE_250_PERCENT = 250
    SCALE_300_PERCENT = 300
    SCALE_350_PERCENT = 350
    SCALE_400_PERCENT = 400
    SCALE_450_PERCENT = 450
    SCALE_500_PERCENT = 500
  end

  union STRRET_Anonymous_e__Union
    p_ole_str : LibC::LPWSTR
    u_offset : UInt32
    c_str : UInt8[260]*
  end

  struct SHITEMID
    cb : UInt16
    ab_id : UInt8[0]*
  end
  struct ITEMIDLIST
    mkid : SHITEMID
  end
  struct STRRET
    u_type : UInt32
    anonymous : STRRET_Anonymous_e__Union
  end
  struct SHELLDETAILS
    fmt : Int32
    cx_char : Int32
    str : STRRET
  end
  struct COMDLG_FILTERSPEC
    psz_name : LibC::LPWSTR
    psz_spec : LibC::LPWSTR
  end


  struct IObjectArrayVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_count : UInt64
    get_at : UInt64
  end

  IObjectArray_GUID = "92ca9dcd-5622-4bba-a805-5e9f541bd8c9"
  IID_IObjectArray = LibC::GUID.new(0x92ca9dcd_u32, 0x5622_u16, 0x4bba_u16, StaticArray[0xa8_u8, 0x5_u8, 0x5e_u8, 0x9f_u8, 0x54_u8, 0x1b_u8, 0xd8_u8, 0xc9_u8])
  struct IObjectArray
    lpVtbl : IObjectArrayVTbl*
  end

  struct IObjectCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_count : UInt64
    get_at : UInt64
    add_object : UInt64
    add_from_array : UInt64
    remove_object_at : UInt64
    clear : UInt64
  end

  IObjectCollection_GUID = "5632b1a4-e38a-400a-928a-d4cd63230295"
  IID_IObjectCollection = LibC::GUID.new(0x5632b1a4_u32, 0xe38a_u16, 0x400a_u16, StaticArray[0x92_u8, 0x8a_u8, 0xd4_u8, 0xcd_u8, 0x63_u8, 0x23_u8, 0x2_u8, 0x95_u8])
  struct IObjectCollection
    lpVtbl : IObjectCollectionVTbl*
  end

end
struct LibWin32::IObjectArray
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_count(pcobjects : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcobjects)
  end
  def get_at(uiindex : UInt32, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_at.unsafe_as(Proc(UInt32, Guid*, Void**, HRESULT)).call(uiindex, riid, ppv)
  end
end
struct LibWin32::IObjectCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_count(pcobjects : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcobjects)
  end
  def get_at(uiindex : UInt32, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_at.unsafe_as(Proc(UInt32, Guid*, Void**, HRESULT)).call(uiindex, riid, ppv)
  end
  def add_object(punk : IUnknown) : HRESULT
    @lpVtbl.value.add_object.unsafe_as(Proc(IUnknown, HRESULT)).call(punk)
  end
  def add_from_array(poasource : IObjectArray) : HRESULT
    @lpVtbl.value.add_from_array.unsafe_as(Proc(IObjectArray, HRESULT)).call(poasource)
  end
  def remove_object_at(uiindex : UInt32) : HRESULT
    @lpVtbl.value.remove_object_at.unsafe_as(Proc(UInt32, HRESULT)).call(uiindex)
  end
  def clear : HRESULT
    @lpVtbl.value.clear.unsafe_as(Proc(HRESULT)).call
  end
end
