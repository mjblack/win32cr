require "./../../com.cr"
require "./../../../foundation.cr"
require "./../../../graphics/direct2_d.cr"

module Win32cr::System::WinRT::Graphics::Direct2D

  enum GRAPHICS_EFFECT_PROPERTY_MAPPING
    GRAPHICS_EFFECT_PROPERTY_MAPPING_UNKNOWN = 0_i32
    GRAPHICS_EFFECT_PROPERTY_MAPPING_DIRECT = 1_i32
    GRAPHICS_EFFECT_PROPERTY_MAPPING_VECTORX = 2_i32
    GRAPHICS_EFFECT_PROPERTY_MAPPING_VECTORY = 3_i32
    GRAPHICS_EFFECT_PROPERTY_MAPPING_VECTORZ = 4_i32
    GRAPHICS_EFFECT_PROPERTY_MAPPING_VECTORW = 5_i32
    GRAPHICS_EFFECT_PROPERTY_MAPPING_RECT_TO_VECTOR4 = 6_i32
    GRAPHICS_EFFECT_PROPERTY_MAPPING_RADIANS_TO_DEGREES = 7_i32
    GRAPHICS_EFFECT_PROPERTY_MAPPING_COLORMATRIX_ALPHA_MODE = 8_i32
    GRAPHICS_EFFECT_PROPERTY_MAPPING_COLOR_TO_VECTOR3 = 9_i32
    GRAPHICS_EFFECT_PROPERTY_MAPPING_COLOR_TO_VECTOR4 = 10_i32
  end

  @[Extern]
  record IGraphicsEffectD2D1InteropVtbl,
    query_interface : Proc(IGraphicsEffectD2D1Interop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGraphicsEffectD2D1Interop*, UInt32),
    release : Proc(IGraphicsEffectD2D1Interop*, UInt32),
    get_effect_id : Proc(IGraphicsEffectD2D1Interop*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_named_property_mapping : Proc(IGraphicsEffectD2D1Interop*, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::System::WinRT::Graphics::Direct2D::GRAPHICS_EFFECT_PROPERTY_MAPPING*, Win32cr::Foundation::HRESULT),
    get_property_count : Proc(IGraphicsEffectD2D1Interop*, UInt32*, Win32cr::Foundation::HRESULT),
    get_property : Proc(IGraphicsEffectD2D1Interop*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_source : Proc(IGraphicsEffectD2D1Interop*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_source_count : Proc(IGraphicsEffectD2D1Interop*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGraphicsEffectD2D1Interop, lpVtbl : IGraphicsEffectD2D1InteropVtbl* do
    GUID = LibC::GUID.new(0x2fc57384_u32, 0xa068_u16, 0x44d7_u16, StaticArray[0xa3_u8, 0x31_u8, 0x30_u8, 0x98_u8, 0x2f_u8, 0xcf_u8, 0x71_u8, 0x77_u8])
    def query_interface(this : IGraphicsEffectD2D1Interop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGraphicsEffectD2D1Interop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGraphicsEffectD2D1Interop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_effect_id(this : IGraphicsEffectD2D1Interop*, id : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_effect_id.call(this, id)
    end
    def get_named_property_mapping(this : IGraphicsEffectD2D1Interop*, name : Win32cr::Foundation::PWSTR, index : UInt32*, mapping : Win32cr::System::WinRT::Graphics::Direct2D::GRAPHICS_EFFECT_PROPERTY_MAPPING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_named_property_mapping.call(this, name, index, mapping)
    end
    def get_property_count(this : IGraphicsEffectD2D1Interop*, count : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_count.call(this, count)
    end
    def get_property(this : IGraphicsEffectD2D1Interop*, index : UInt32, value : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, index, value)
    end
    def get_source(this : IGraphicsEffectD2D1Interop*, index : UInt32, source : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_source.call(this, index, source)
    end
    def get_source_count(this : IGraphicsEffectD2D1Interop*, count : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_source_count.call(this, count)
    end

  end

  @[Extern]
  record IGeometrySource2DInteropVtbl,
    query_interface : Proc(IGeometrySource2DInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGeometrySource2DInterop*, UInt32),
    release : Proc(IGeometrySource2DInterop*, UInt32),
    get_geometry : Proc(IGeometrySource2DInterop*, Void**, Win32cr::Foundation::HRESULT),
    try_get_geometry_using_factory : Proc(IGeometrySource2DInterop*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGeometrySource2DInterop, lpVtbl : IGeometrySource2DInteropVtbl* do
    GUID = LibC::GUID.new(0x657af73_u32, 0x53fd_u16, 0x47cf_u16, StaticArray[0x84_u8, 0xff_u8, 0xc8_u8, 0x49_u8, 0x2d_u8, 0x2a_u8, 0x80_u8, 0xa3_u8])
    def query_interface(this : IGeometrySource2DInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGeometrySource2DInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGeometrySource2DInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_geometry(this : IGeometrySource2DInterop*, value : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_geometry.call(this, value)
    end
    def try_get_geometry_using_factory(this : IGeometrySource2DInterop*, factory : Void*, value : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.try_get_geometry_using_factory.call(this, factory, value)
    end

  end

end