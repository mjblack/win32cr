require "./../dxgi/common.cr"
require "./../../system/com.cr"
require "./../../foundation.cr"

module Win32cr::Graphics::Direct2D::Common

  enum D2D1_ALPHA_MODE : UInt32
    D2D1_ALPHA_MODE_UNKNOWN = 0_u32
    D2D1_ALPHA_MODE_PREMULTIPLIED = 1_u32
    D2D1_ALPHA_MODE_STRAIGHT = 2_u32
    D2D1_ALPHA_MODE_IGNORE = 3_u32
    D2D1_ALPHA_MODE_FORCE_DWORD = 4294967295_u32
  end
  enum D2D1_FIGURE_BEGIN : UInt32
    D2D1_FIGURE_BEGIN_FILLED = 0_u32
    D2D1_FIGURE_BEGIN_HOLLOW = 1_u32
    D2D1_FIGURE_BEGIN_FORCE_DWORD = 4294967295_u32
  end
  enum D2D1_FIGURE_END : UInt32
    D2D1_FIGURE_END_OPEN = 0_u32
    D2D1_FIGURE_END_CLOSED = 1_u32
    D2D1_FIGURE_END_FORCE_DWORD = 4294967295_u32
  end
  @[Flags]
  enum D2D1_PATH_SEGMENT : UInt32
    D2D1_PATH_SEGMENT_NONE = 0_u32
    D2D1_PATH_SEGMENT_FORCE_UNSTROKED = 1_u32
    D2D1_PATH_SEGMENT_FORCE_ROUND_LINE_JOIN = 2_u32
    D2D1_PATH_SEGMENT_FORCE_DWORD = 4294967295_u32
  end
  enum D2D1_FILL_MODE : UInt32
    D2D1_FILL_MODE_ALTERNATE = 0_u32
    D2D1_FILL_MODE_WINDING = 1_u32
    D2D1_FILL_MODE_FORCE_DWORD = 4294967295_u32
  end
  enum D2D1_BORDER_MODE : UInt32
    D2D1_BORDER_MODE_SOFT = 0_u32
    D2D1_BORDER_MODE_HARD = 1_u32
    D2D1_BORDER_MODE_FORCE_DWORD = 4294967295_u32
  end
  enum D2D1_BLEND_MODE : UInt32
    D2D1_BLEND_MODE_MULTIPLY = 0_u32
    D2D1_BLEND_MODE_SCREEN = 1_u32
    D2D1_BLEND_MODE_DARKEN = 2_u32
    D2D1_BLEND_MODE_LIGHTEN = 3_u32
    D2D1_BLEND_MODE_DISSOLVE = 4_u32
    D2D1_BLEND_MODE_COLOR_BURN = 5_u32
    D2D1_BLEND_MODE_LINEAR_BURN = 6_u32
    D2D1_BLEND_MODE_DARKER_COLOR = 7_u32
    D2D1_BLEND_MODE_LIGHTER_COLOR = 8_u32
    D2D1_BLEND_MODE_COLOR_DODGE = 9_u32
    D2D1_BLEND_MODE_LINEAR_DODGE = 10_u32
    D2D1_BLEND_MODE_OVERLAY = 11_u32
    D2D1_BLEND_MODE_SOFT_LIGHT = 12_u32
    D2D1_BLEND_MODE_HARD_LIGHT = 13_u32
    D2D1_BLEND_MODE_VIVID_LIGHT = 14_u32
    D2D1_BLEND_MODE_LINEAR_LIGHT = 15_u32
    D2D1_BLEND_MODE_PIN_LIGHT = 16_u32
    D2D1_BLEND_MODE_HARD_MIX = 17_u32
    D2D1_BLEND_MODE_DIFFERENCE = 18_u32
    D2D1_BLEND_MODE_EXCLUSION = 19_u32
    D2D1_BLEND_MODE_HUE = 20_u32
    D2D1_BLEND_MODE_SATURATION = 21_u32
    D2D1_BLEND_MODE_COLOR = 22_u32
    D2D1_BLEND_MODE_LUMINOSITY = 23_u32
    D2D1_BLEND_MODE_SUBTRACT = 24_u32
    D2D1_BLEND_MODE_DIVISION = 25_u32
    D2D1_BLEND_MODE_FORCE_DWORD = 4294967295_u32
  end
  enum D2D1_COLORMATRIX_ALPHA_MODE : UInt32
    D2D1_COLORMATRIX_ALPHA_MODE_PREMULTIPLIED = 1_u32
    D2D1_COLORMATRIX_ALPHA_MODE_STRAIGHT = 2_u32
    D2D1_COLORMATRIX_ALPHA_MODE_FORCE_DWORD = 4294967295_u32
  end
  enum D2D1_2DAFFINETRANSFORM_INTERPOLATION_MODE : UInt32
    D2D1_2DAFFINETRANSFORM_INTERPOLATION_MODE_NEAREST_NEIGHBOR = 0_u32
    D2D1_2DAFFINETRANSFORM_INTERPOLATION_MODE_LINEAR = 1_u32
    D2D1_2DAFFINETRANSFORM_INTERPOLATION_MODE_CUBIC = 2_u32
    D2D1_2DAFFINETRANSFORM_INTERPOLATION_MODE_MULTI_SAMPLE_LINEAR = 3_u32
    D2D1_2DAFFINETRANSFORM_INTERPOLATION_MODE_ANISOTROPIC = 4_u32
    D2D1_2DAFFINETRANSFORM_INTERPOLATION_MODE_HIGH_QUALITY_CUBIC = 5_u32
    D2D1_2DAFFINETRANSFORM_INTERPOLATION_MODE_FORCE_DWORD = 4294967295_u32
  end
  enum D2D1_TURBULENCE_NOISE : UInt32
    D2D1_TURBULENCE_NOISE_FRACTAL_SUM = 0_u32
    D2D1_TURBULENCE_NOISE_TURBULENCE = 1_u32
    D2D1_TURBULENCE_NOISE_FORCE_DWORD = 4294967295_u32
  end
  enum D2D1_COMPOSITE_MODE : UInt32
    D2D1_COMPOSITE_MODE_SOURCE_OVER = 0_u32
    D2D1_COMPOSITE_MODE_DESTINATION_OVER = 1_u32
    D2D1_COMPOSITE_MODE_SOURCE_IN = 2_u32
    D2D1_COMPOSITE_MODE_DESTINATION_IN = 3_u32
    D2D1_COMPOSITE_MODE_SOURCE_OUT = 4_u32
    D2D1_COMPOSITE_MODE_DESTINATION_OUT = 5_u32
    D2D1_COMPOSITE_MODE_SOURCE_ATOP = 6_u32
    D2D1_COMPOSITE_MODE_DESTINATION_ATOP = 7_u32
    D2D1_COMPOSITE_MODE_XOR = 8_u32
    D2D1_COMPOSITE_MODE_PLUS = 9_u32
    D2D1_COMPOSITE_MODE_SOURCE_COPY = 10_u32
    D2D1_COMPOSITE_MODE_BOUNDED_SOURCE_COPY = 11_u32
    D2D1_COMPOSITE_MODE_MASK_INVERT = 12_u32
    D2D1_COMPOSITE_MODE_FORCE_DWORD = 4294967295_u32
  end

  @[Extern]
  record D2D_COLOR_F,
    r : Float32,
    g : Float32,
    b : Float32,
    a : Float32

  @[Extern]
  record D2D1_COLOR_F,
    r : Float32,
    g : Float32,
    b : Float32,
    a : Float32

  @[Extern]
  record D2D1_PIXEL_FORMAT,
    format : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT,
    alphaMode : Win32cr::Graphics::Direct2D::Common::D2D1_ALPHA_MODE

  @[Extern]
  record D2D_POINT_2U,
    x : UInt32,
    y : UInt32

  @[Extern]
  record D2D_POINT_2F,
    x : Float32,
    y : Float32

  @[Extern]
  record D2D_VECTOR_2F,
    x : Float32,
    y : Float32

  @[Extern]
  record D2D_VECTOR_3F,
    x : Float32,
    y : Float32,
    z : Float32

  @[Extern]
  record D2D_VECTOR_4F,
    x : Float32,
    y : Float32,
    z : Float32,
    w : Float32

  @[Extern]
  record D2D_RECT_F,
    left : Float32,
    top : Float32,
    right : Float32,
    bottom : Float32

  @[Extern]
  record D2D_RECT_U,
    left : UInt32,
    top : UInt32,
    right : UInt32,
    bottom : UInt32

  @[Extern]
  record D2D_SIZE_F,
    width : Float32,
    height : Float32

  @[Extern]
  record D2D_SIZE_U,
    width : UInt32,
    height : UInt32

  @[Extern]
  record D2D_MATRIX_3X2_F,
    anonymous : Anonymous_e__Union do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      anonymous1 : Anonymous1_e__Struct,
      anonymous2 : Anonymous2_e__Struct,
      m : Float32[6] do

      # Nested Type Anonymous1_e__Struct
      @[Extern]
      record Anonymous1_e__Struct,
        m11 : Float32,
        m12 : Float32,
        m21 : Float32,
        m22 : Float32,
        dx : Float32,
        dy : Float32


      # Nested Type Anonymous2_e__Struct
      @[Extern]
      record Anonymous2_e__Struct,
        _11 : Float32,
        _12 : Float32,
        _21 : Float32,
        _22 : Float32,
        _31 : Float32,
        _32 : Float32

    end

  end

  @[Extern]
  record D2D_MATRIX_4X3_F,
    anonymous : Anonymous_e__Union do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      anonymous : Anonymous_e__Struct,
      m : Float32[12] do

      # Nested Type Anonymous_e__Struct
      @[Extern]
      record Anonymous_e__Struct,
        _11 : Float32,
        _12 : Float32,
        _13 : Float32,
        _21 : Float32,
        _22 : Float32,
        _23 : Float32,
        _31 : Float32,
        _32 : Float32,
        _33 : Float32,
        _41 : Float32,
        _42 : Float32,
        _43 : Float32

    end

  end

  @[Extern]
  record D2D_MATRIX_4X4_F,
    anonymous : Anonymous_e__Union do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      anonymous : Anonymous_e__Struct,
      m : Float32[16] do

      # Nested Type Anonymous_e__Struct
      @[Extern]
      record Anonymous_e__Struct,
        _11 : Float32,
        _12 : Float32,
        _13 : Float32,
        _14 : Float32,
        _21 : Float32,
        _22 : Float32,
        _23 : Float32,
        _24 : Float32,
        _31 : Float32,
        _32 : Float32,
        _33 : Float32,
        _34 : Float32,
        _41 : Float32,
        _42 : Float32,
        _43 : Float32,
        _44 : Float32

    end

  end

  @[Extern]
  record D2D_MATRIX_5X4_F,
    anonymous : Anonymous_e__Union do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      anonymous : Anonymous_e__Struct,
      m : Float32[20] do

      # Nested Type Anonymous_e__Struct
      @[Extern]
      record Anonymous_e__Struct,
        _11 : Float32,
        _12 : Float32,
        _13 : Float32,
        _14 : Float32,
        _21 : Float32,
        _22 : Float32,
        _23 : Float32,
        _24 : Float32,
        _31 : Float32,
        _32 : Float32,
        _33 : Float32,
        _34 : Float32,
        _41 : Float32,
        _42 : Float32,
        _43 : Float32,
        _44 : Float32,
        _51 : Float32,
        _52 : Float32,
        _53 : Float32,
        _54 : Float32

    end

  end

  @[Extern]
  record D2D1_BEZIER_SEGMENT,
    point1 : Win32cr::Graphics::Direct2D::Common::D2D_POINT_2F,
    point2 : Win32cr::Graphics::Direct2D::Common::D2D_POINT_2F,
    point3 : Win32cr::Graphics::Direct2D::Common::D2D_POINT_2F

  @[Extern]
  record ID2D1SimplifiedGeometrySinkVtbl,
    query_interface : Proc(ID2D1SimplifiedGeometrySink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ID2D1SimplifiedGeometrySink*, UInt32),
    release : Proc(ID2D1SimplifiedGeometrySink*, UInt32),
    set_fill_mode : Proc(ID2D1SimplifiedGeometrySink*, Win32cr::Graphics::Direct2D::Common::D2D1_FILL_MODE, Void),
    set_segment_flags : Proc(ID2D1SimplifiedGeometrySink*, Win32cr::Graphics::Direct2D::Common::D2D1_PATH_SEGMENT, Void),
    begin_figure : Proc(ID2D1SimplifiedGeometrySink*, Win32cr::Graphics::Direct2D::Common::D2D_POINT_2F, Win32cr::Graphics::Direct2D::Common::D2D1_FIGURE_BEGIN, Void),
    add_lines : Proc(ID2D1SimplifiedGeometrySink*, Win32cr::Graphics::Direct2D::Common::D2D_POINT_2F*, UInt32, Void),
    add_beziers : Proc(ID2D1SimplifiedGeometrySink*, Win32cr::Graphics::Direct2D::Common::D2D1_BEZIER_SEGMENT*, UInt32, Void),
    end_figure : Proc(ID2D1SimplifiedGeometrySink*, Win32cr::Graphics::Direct2D::Common::D2D1_FIGURE_END, Void),
    close : Proc(ID2D1SimplifiedGeometrySink*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("2cd9069e-12e2-11dc-9fed-001143a055f9")]
  record ID2D1SimplifiedGeometrySink, lpVtbl : ID2D1SimplifiedGeometrySinkVtbl* do
    GUID = LibC::GUID.new(0x2cd9069e_u32, 0x12e2_u16, 0x11dc_u16, StaticArray[0x9f_u8, 0xed_u8, 0x0_u8, 0x11_u8, 0x43_u8, 0xa0_u8, 0x55_u8, 0xf9_u8])
    def query_interface(this : ID2D1SimplifiedGeometrySink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ID2D1SimplifiedGeometrySink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ID2D1SimplifiedGeometrySink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_fill_mode(this : ID2D1SimplifiedGeometrySink*, fillMode : Win32cr::Graphics::Direct2D::Common::D2D1_FILL_MODE) : Void
      @lpVtbl.try &.value.set_fill_mode.call(this, fillMode)
    end
    def set_segment_flags(this : ID2D1SimplifiedGeometrySink*, vertexFlags : Win32cr::Graphics::Direct2D::Common::D2D1_PATH_SEGMENT) : Void
      @lpVtbl.try &.value.set_segment_flags.call(this, vertexFlags)
    end
    def begin_figure(this : ID2D1SimplifiedGeometrySink*, startPoint : Win32cr::Graphics::Direct2D::Common::D2D_POINT_2F, figureBegin : Win32cr::Graphics::Direct2D::Common::D2D1_FIGURE_BEGIN) : Void
      @lpVtbl.try &.value.begin_figure.call(this, startPoint, figureBegin)
    end
    def add_lines(this : ID2D1SimplifiedGeometrySink*, points : Win32cr::Graphics::Direct2D::Common::D2D_POINT_2F*, pointsCount : UInt32) : Void
      @lpVtbl.try &.value.add_lines.call(this, points, pointsCount)
    end
    def add_beziers(this : ID2D1SimplifiedGeometrySink*, beziers : Win32cr::Graphics::Direct2D::Common::D2D1_BEZIER_SEGMENT*, beziersCount : UInt32) : Void
      @lpVtbl.try &.value.add_beziers.call(this, beziers, beziersCount)
    end
    def end_figure(this : ID2D1SimplifiedGeometrySink*, figureEnd : Win32cr::Graphics::Direct2D::Common::D2D1_FIGURE_END) : Void
      @lpVtbl.try &.value.end_figure.call(this, figureEnd)
    end
    def close(this : ID2D1SimplifiedGeometrySink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end

  end

end