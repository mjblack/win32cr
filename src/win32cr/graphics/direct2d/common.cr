require "../../graphics/dxgi/common.cr"
require "../../system/com.cr"
require "../../foundation.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
lib LibWin32

  enum D2D1_ALPHA_MODE : UInt32
    D2D1_ALPHA_MODE_UNKNOWN = 0
    D2D1_ALPHA_MODE_PREMULTIPLIED = 1
    D2D1_ALPHA_MODE_STRAIGHT = 2
    D2D1_ALPHA_MODE_IGNORE = 3
    D2D1_ALPHA_MODE_FORCE_DWORD = 4294967295
  end

  enum D2D1_FIGURE_BEGIN : UInt32
    D2D1_FIGURE_BEGIN_FILLED = 0
    D2D1_FIGURE_BEGIN_HOLLOW = 1
    D2D1_FIGURE_BEGIN_FORCE_DWORD = 4294967295
  end

  enum D2D1_FIGURE_END : UInt32
    D2D1_FIGURE_END_OPEN = 0
    D2D1_FIGURE_END_CLOSED = 1
    D2D1_FIGURE_END_FORCE_DWORD = 4294967295
  end

  enum D2D1_PATH_SEGMENT : UInt32
    D2D1_PATH_SEGMENT_NONE = 0
    D2D1_PATH_SEGMENT_FORCE_UNSTROKED = 1
    D2D1_PATH_SEGMENT_FORCE_ROUND_LINE_JOIN = 2
    D2D1_PATH_SEGMENT_FORCE_DWORD = 4294967295
  end

  enum D2D1_FILL_MODE : UInt32
    D2D1_FILL_MODE_ALTERNATE = 0
    D2D1_FILL_MODE_WINDING = 1
    D2D1_FILL_MODE_FORCE_DWORD = 4294967295
  end

  enum D2D1_BORDER_MODE : UInt32
    D2D1_BORDER_MODE_SOFT = 0
    D2D1_BORDER_MODE_HARD = 1
    D2D1_BORDER_MODE_FORCE_DWORD = 4294967295
  end

  enum D2D1_BLEND_MODE : UInt32
    D2D1_BLEND_MODE_MULTIPLY = 0
    D2D1_BLEND_MODE_SCREEN = 1
    D2D1_BLEND_MODE_DARKEN = 2
    D2D1_BLEND_MODE_LIGHTEN = 3
    D2D1_BLEND_MODE_DISSOLVE = 4
    D2D1_BLEND_MODE_COLOR_BURN = 5
    D2D1_BLEND_MODE_LINEAR_BURN = 6
    D2D1_BLEND_MODE_DARKER_COLOR = 7
    D2D1_BLEND_MODE_LIGHTER_COLOR = 8
    D2D1_BLEND_MODE_COLOR_DODGE = 9
    D2D1_BLEND_MODE_LINEAR_DODGE = 10
    D2D1_BLEND_MODE_OVERLAY = 11
    D2D1_BLEND_MODE_SOFT_LIGHT = 12
    D2D1_BLEND_MODE_HARD_LIGHT = 13
    D2D1_BLEND_MODE_VIVID_LIGHT = 14
    D2D1_BLEND_MODE_LINEAR_LIGHT = 15
    D2D1_BLEND_MODE_PIN_LIGHT = 16
    D2D1_BLEND_MODE_HARD_MIX = 17
    D2D1_BLEND_MODE_DIFFERENCE = 18
    D2D1_BLEND_MODE_EXCLUSION = 19
    D2D1_BLEND_MODE_HUE = 20
    D2D1_BLEND_MODE_SATURATION = 21
    D2D1_BLEND_MODE_COLOR = 22
    D2D1_BLEND_MODE_LUMINOSITY = 23
    D2D1_BLEND_MODE_SUBTRACT = 24
    D2D1_BLEND_MODE_DIVISION = 25
    D2D1_BLEND_MODE_FORCE_DWORD = 4294967295
  end

  enum D2D1_COLORMATRIX_ALPHA_MODE : UInt32
    D2D1_COLORMATRIX_ALPHA_MODE_PREMULTIPLIED = 1
    D2D1_COLORMATRIX_ALPHA_MODE_STRAIGHT = 2
    D2D1_COLORMATRIX_ALPHA_MODE_FORCE_DWORD = 4294967295
  end

  enum D2D1_TURBULENCE_NOISE : UInt32
    D2D1_TURBULENCE_NOISE_FRACTAL_SUM = 0
    D2D1_TURBULENCE_NOISE_TURBULENCE = 1
    D2D1_TURBULENCE_NOISE_FORCE_DWORD = 4294967295
  end

  enum D2D1_COMPOSITE_MODE : UInt32
    D2D1_COMPOSITE_MODE_SOURCE_OVER = 0
    D2D1_COMPOSITE_MODE_DESTINATION_OVER = 1
    D2D1_COMPOSITE_MODE_SOURCE_IN = 2
    D2D1_COMPOSITE_MODE_DESTINATION_IN = 3
    D2D1_COMPOSITE_MODE_SOURCE_OUT = 4
    D2D1_COMPOSITE_MODE_DESTINATION_OUT = 5
    D2D1_COMPOSITE_MODE_SOURCE_ATOP = 6
    D2D1_COMPOSITE_MODE_DESTINATION_ATOP = 7
    D2D1_COMPOSITE_MODE_XOR = 8
    D2D1_COMPOSITE_MODE_PLUS = 9
    D2D1_COMPOSITE_MODE_SOURCE_COPY = 10
    D2D1_COMPOSITE_MODE_BOUNDED_SOURCE_COPY = 11
    D2D1_COMPOSITE_MODE_MASK_INVERT = 12
    D2D1_COMPOSITE_MODE_FORCE_DWORD = 4294967295
  end

  union D2D_MATRIX_3X2_F_Anonymous_e__Union
    anonymous1 : D2D_MATRIX_3X2_F_Anonymous_e__Union_Anonymous1_e__Struct
    anonymous2 : D2D_MATRIX_3X2_F_Anonymous_e__Union_Anonymous2_e__Struct
    m : Float32[6]*
  end
  union D2D_MATRIX_4X3_F_Anonymous_e__Union
    anonymous : D2D_MATRIX_4X3_F_Anonymous_e__Union_Anonymous_e__Struct
    m : Float32[12]*
  end
  union D2D_MATRIX_4X4_F_Anonymous_e__Union
    anonymous : D2D_MATRIX_4X4_F_Anonymous_e__Union_Anonymous_e__Struct
    m : Float32[16]*
  end
  union D2D_MATRIX_5X4_F_Anonymous_e__Union
    anonymous : D2D_MATRIX_5X4_F_Anonymous_e__Union_Anonymous_e__Struct
    m : Float32[20]*
  end

  struct D2D_COLOR_F
    r : Float32
    g : Float32
    b : Float32
    a : Float32
  end
  struct D2D1_COLOR_F
    r : Float32
    g : Float32
    b : Float32
    a : Float32
  end
  struct D2D1_PIXEL_FORMAT
    format : DXGI_FORMAT
    alpha_mode : D2D1_ALPHA_MODE
  end
  struct D2D_POINT_2U
    x : UInt32
    y : UInt32
  end
  struct D2D_POINT_2F
    x : Float32
    y : Float32
  end
  struct D2D_VECTOR_2F
    x : Float32
    y : Float32
  end
  struct D2D_VECTOR_3F
    x : Float32
    y : Float32
    z : Float32
  end
  struct D2D_VECTOR_4F
    x : Float32
    y : Float32
    z : Float32
    w : Float32
  end
  struct D2D_RECT_F
    left : Float32
    top : Float32
    right : Float32
    bottom : Float32
  end
  struct D2D_RECT_U
    left : UInt32
    top : UInt32
    right : UInt32
    bottom : UInt32
  end
  struct D2D_SIZE_F
    width : Float32
    height : Float32
  end
  struct D2D_SIZE_U
    width : UInt32
    height : UInt32
  end
  struct D2D_MATRIX_3X2_F
    anonymous : D2D_MATRIX_3X2_F_Anonymous_e__Union
  end
  struct D2D_MATRIX_3X2_F_Anonymous_e__Union_Anonymous1_e__Struct
    m11 : Float32
    m12 : Float32
    m21 : Float32
    m22 : Float32
    dx : Float32
    dy : Float32
  end
  struct D2D_MATRIX_3X2_F_Anonymous_e__Union_Anonymous2_e__Struct
    _11 : Float32
    _12 : Float32
    _21 : Float32
    _22 : Float32
    _31 : Float32
    _32 : Float32
  end
  struct D2D_MATRIX_4X3_F
    anonymous : D2D_MATRIX_4X3_F_Anonymous_e__Union
  end
  struct D2D_MATRIX_4X3_F_Anonymous_e__Union_Anonymous_e__Struct
    _11 : Float32
    _12 : Float32
    _13 : Float32
    _21 : Float32
    _22 : Float32
    _23 : Float32
    _31 : Float32
    _32 : Float32
    _33 : Float32
    _41 : Float32
    _42 : Float32
    _43 : Float32
  end
  struct D2D_MATRIX_4X4_F
    anonymous : D2D_MATRIX_4X4_F_Anonymous_e__Union
  end
  struct D2D_MATRIX_4X4_F_Anonymous_e__Union_Anonymous_e__Struct
    _11 : Float32
    _12 : Float32
    _13 : Float32
    _14 : Float32
    _21 : Float32
    _22 : Float32
    _23 : Float32
    _24 : Float32
    _31 : Float32
    _32 : Float32
    _33 : Float32
    _34 : Float32
    _41 : Float32
    _42 : Float32
    _43 : Float32
    _44 : Float32
  end
  struct D2D_MATRIX_5X4_F
    anonymous : D2D_MATRIX_5X4_F_Anonymous_e__Union
  end
  struct D2D_MATRIX_5X4_F_Anonymous_e__Union_Anonymous_e__Struct
    _11 : Float32
    _12 : Float32
    _13 : Float32
    _14 : Float32
    _21 : Float32
    _22 : Float32
    _23 : Float32
    _24 : Float32
    _31 : Float32
    _32 : Float32
    _33 : Float32
    _34 : Float32
    _41 : Float32
    _42 : Float32
    _43 : Float32
    _44 : Float32
    _51 : Float32
    _52 : Float32
    _53 : Float32
    _54 : Float32
  end
  struct D2D1_BEZIER_SEGMENT
    point1 : D2D_POINT_2F
    point2 : D2D_POINT_2F
    point3 : D2D_POINT_2F
  end


  struct ID2D1SimplifiedGeometrySinkVTbl
    query_interface : Proc(ID2D1SimplifiedGeometrySink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ID2D1SimplifiedGeometrySink*, UInt32)
    release : Proc(ID2D1SimplifiedGeometrySink*, UInt32)
    set_fill_mode : Proc(ID2D1SimplifiedGeometrySink*, D2D1_FILL_MODE, Void)
    set_segment_flags : Proc(ID2D1SimplifiedGeometrySink*, D2D1_PATH_SEGMENT, Void)
    begin_figure : Proc(ID2D1SimplifiedGeometrySink*, D2D_POINT_2F, D2D1_FIGURE_BEGIN, Void)
    add_lines : Proc(ID2D1SimplifiedGeometrySink*, D2D_POINT_2F*, UInt32, Void)
    add_beziers : Proc(ID2D1SimplifiedGeometrySink*, D2D1_BEZIER_SEGMENT*, UInt32, Void)
    end_figure : Proc(ID2D1SimplifiedGeometrySink*, D2D1_FIGURE_END, Void)
    close : Proc(ID2D1SimplifiedGeometrySink*, HRESULT)
  end

  struct ID2D1SimplifiedGeometrySink
    lpVtbl : ID2D1SimplifiedGeometrySinkVTbl*
  end

end
