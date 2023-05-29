require "../../../system/com.cr"
require "../../../foundation.cr"
require "../../../graphics/direct2d.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
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
    query_interface : Proc(IGraphicsEffectD2D1Interop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGraphicsEffectD2D1Interop*, UInt32)
    release : Proc(IGraphicsEffectD2D1Interop*, UInt32)
    get_effect_id : Proc(IGraphicsEffectD2D1Interop*, Guid*, HRESULT)
    get_named_property_mapping : Proc(IGraphicsEffectD2D1Interop*, LibC::LPWSTR, UInt32*, GRAPHICS_EFFECT_PROPERTY_MAPPING*, HRESULT)
    get_property_count : Proc(IGraphicsEffectD2D1Interop*, UInt32*, HRESULT)
    get_property : Proc(IGraphicsEffectD2D1Interop*, UInt32, IPropertyValue*, HRESULT)
    get_source : Proc(IGraphicsEffectD2D1Interop*, UInt32, IGraphicsEffectSource*, HRESULT)
    get_source_count : Proc(IGraphicsEffectD2D1Interop*, UInt32*, HRESULT)
  end

  struct IGraphicsEffectD2D1Interop
    lpVtbl : IGraphicsEffectD2D1InteropVTbl*
  end

  struct IGeometrySource2DInteropVTbl
    query_interface : Proc(IGeometrySource2DInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGeometrySource2DInterop*, UInt32)
    release : Proc(IGeometrySource2DInterop*, UInt32)
    get_geometry : Proc(IGeometrySource2DInterop*, ID2D1Geometry*, HRESULT)
    try_get_geometry_using_factory : Proc(IGeometrySource2DInterop*, ID2D1Factory, ID2D1Geometry*, HRESULT)
  end

  struct IGeometrySource2DInterop
    lpVtbl : IGeometrySource2DInteropVTbl*
  end

end
