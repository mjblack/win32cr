require "../../../system/com.cr"
require "../../../foundation.cr"
require "../../../graphics/direct2d.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32

  enum GRAPHICS_EFFECT_PROPERTY_MAPPING : Int32
    GRAPHICS_EFFECT_PROPERTY_MAPPING_UNKNOWN = 0
    GRAPHICS_EFFECT_PROPERTY_MAPPING_DIRECT = 1
    GRAPHICS_EFFECT_PROPERTY_MAPPING_VECTORX = 2
    GRAPHICS_EFFECT_PROPERTY_MAPPING_VECTORY = 3
    GRAPHICS_EFFECT_PROPERTY_MAPPING_VECTORZ = 4
    GRAPHICS_EFFECT_PROPERTY_MAPPING_VECTORW = 5
    GRAPHICS_EFFECT_PROPERTY_MAPPING_RECT_TO_VECTOR4 = 6
    GRAPHICS_EFFECT_PROPERTY_MAPPING_RADIANS_TO_DEGREES = 7
    GRAPHICS_EFFECT_PROPERTY_MAPPING_COLORMATRIX_ALPHA_MODE = 8
    GRAPHICS_EFFECT_PROPERTY_MAPPING_COLOR_TO_VECTOR3 = 9
    GRAPHICS_EFFECT_PROPERTY_MAPPING_COLOR_TO_VECTOR4 = 10
  end


  struct IGraphicsEffectD2D1InteropVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_effect_id : UInt64
    get_named_property_mapping : UInt64
    get_property_count : UInt64
    get_property : UInt64
    get_source : UInt64
    get_source_count : UInt64
  end

  IGraphicsEffectD2D1Interop_GUID = "2fc57384-a068-44d7-a331-30982fcf7177"
  IID_IGraphicsEffectD2D1Interop = LibC::GUID.new(0x2fc57384_u32, 0xa068_u16, 0x44d7_u16, StaticArray[0xa3_u8, 0x31_u8, 0x30_u8, 0x98_u8, 0x2f_u8, 0xcf_u8, 0x71_u8, 0x77_u8])
  struct IGraphicsEffectD2D1Interop
    lpVtbl : IGraphicsEffectD2D1InteropVTbl*
  end

  struct IGeometrySource2DInteropVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_geometry : UInt64
    try_get_geometry_using_factory : UInt64
  end

  IGeometrySource2DInterop_GUID = "0657af73-53fd-47cf-84ff-c8492d2a80a3"
  IID_IGeometrySource2DInterop = LibC::GUID.new(0x657af73_u32, 0x53fd_u16, 0x47cf_u16, StaticArray[0x84_u8, 0xff_u8, 0xc8_u8, 0x49_u8, 0x2d_u8, 0x2a_u8, 0x80_u8, 0xa3_u8])
  struct IGeometrySource2DInterop
    lpVtbl : IGeometrySource2DInteropVTbl*
  end

end
struct LibWin32::IGraphicsEffectD2D1Interop
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_effect_id(id : Guid*) : HRESULT
    @lpVtbl.value.get_effect_id.unsafe_as(Proc(Guid*, HRESULT)).call(id)
  end
  def get_named_property_mapping(name : LibC::LPWSTR, index : UInt32*, mapping : GRAPHICS_EFFECT_PROPERTY_MAPPING*) : HRESULT
    @lpVtbl.value.get_named_property_mapping.unsafe_as(Proc(LibC::LPWSTR, UInt32*, GRAPHICS_EFFECT_PROPERTY_MAPPING*, HRESULT)).call(name, index, mapping)
  end
  def get_property_count(count : UInt32*) : HRESULT
    @lpVtbl.value.get_property_count.unsafe_as(Proc(UInt32*, HRESULT)).call(count)
  end
  def get_property(index : UInt32, value : IPropertyValue*) : HRESULT
    @lpVtbl.value.get_property.unsafe_as(Proc(UInt32, IPropertyValue*, HRESULT)).call(index, value)
  end
  def get_source(index : UInt32, source : IGraphicsEffectSource*) : HRESULT
    @lpVtbl.value.get_source.unsafe_as(Proc(UInt32, IGraphicsEffectSource*, HRESULT)).call(index, source)
  end
  def get_source_count(count : UInt32*) : HRESULT
    @lpVtbl.value.get_source_count.unsafe_as(Proc(UInt32*, HRESULT)).call(count)
  end
end
struct LibWin32::IGeometrySource2DInterop
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_geometry(value : ID2D1Geometry*) : HRESULT
    @lpVtbl.value.get_geometry.unsafe_as(Proc(ID2D1Geometry*, HRESULT)).call(value)
  end
  def try_get_geometry_using_factory(factory : ID2D1Factory, value : ID2D1Geometry*) : HRESULT
    @lpVtbl.value.try_get_geometry_using_factory.unsafe_as(Proc(ID2D1Factory, ID2D1Geometry*, HRESULT)).call(factory, value)
  end
end
