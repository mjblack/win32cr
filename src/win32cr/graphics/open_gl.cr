require "./gdi.cr"
require "./../foundation.cr"

module Win32cr::Graphics::OpenGL
  alias HGLRC = LibC::IntPtrT
  alias PFNGLARRAYELEMENTEXTPROC = Proc(Int32, Void)*

  alias PFNGLDRAWARRAYSEXTPROC = Proc(UInt32, Int32, Int32, Void)*

  alias PFNGLVERTEXPOINTEREXTPROC = Proc(Int32, UInt32, Int32, Int32, Void*, Void)*

  alias PFNGLNORMALPOINTEREXTPROC = Proc(UInt32, Int32, Int32, Void*, Void)*

  alias PFNGLCOLORPOINTEREXTPROC = Proc(Int32, UInt32, Int32, Int32, Void*, Void)*

  alias PFNGLINDEXPOINTEREXTPROC = Proc(UInt32, Int32, Int32, Void*, Void)*

  alias PFNGLTEXCOORDPOINTEREXTPROC = Proc(Int32, UInt32, Int32, Int32, Void*, Void)*

  alias PFNGLEDGEFLAGPOINTEREXTPROC = Proc(Int32, Int32, UInt8*, Void)*

  alias PFNGLGETPOINTERVEXTPROC = Proc(UInt32, Void**, Void)*

  alias PFNGLARRAYELEMENTARRAYEXTPROC = Proc(UInt32, Int32, Void*, Void)*

  alias PFNGLDRAWRANGEELEMENTSWINPROC = Proc(UInt32, UInt32, UInt32, Int32, UInt32, Void*, Void)*

  alias PFNGLADDSWAPHINTRECTWINPROC = Proc(Int32, Int32, Int32, Int32, Void)*

  alias PFNGLCOLORTABLEEXTPROC = Proc(UInt32, UInt32, Int32, UInt32, UInt32, Void*, Void)*

  alias PFNGLCOLORSUBTABLEEXTPROC = Proc(UInt32, Int32, Int32, UInt32, UInt32, Void*, Void)*

  alias PFNGLGETCOLORTABLEEXTPROC = Proc(UInt32, UInt32, UInt32, Void*, Void)*

  alias PFNGLGETCOLORTABLEPARAMETERIVEXTPROC = Proc(UInt32, UInt32, Int32*, Void)*

  alias PFNGLGETCOLORTABLEPARAMETERFVEXTPROC = Proc(UInt32, UInt32, Float32*, Void)*

  alias GLUquadricErrorProc = Proc(UInt32, Void)*

  alias GLUtessBeginProc = Proc(UInt32, Void)*

  alias GLUtessEdgeFlagProc = Proc(UInt8, Void)*

  alias GLUtessVertexProc = Proc(Void*, Void)*

  alias GLUtessEndProc = Proc(Void)*

  alias GLUtessErrorProc = Proc(UInt32, Void)*

  alias GLUtessCombineProc = Proc(Float64*, Void**, Float32*, Void**, Void)*

  alias GLUtessBeginDataProc = Proc(UInt32, Void*, Void)*

  alias GLUtessEdgeFlagDataProc = Proc(UInt8, Void*, Void)*

  alias GLUtessVertexDataProc = Proc(Void*, Void*, Void)*

  alias GLUtessEndDataProc = Proc(Void*, Void)*

  alias GLUtessErrorDataProc = Proc(UInt32, Void*, Void)*

  alias GLUtessCombineDataProc = Proc(Float64*, Void**, Float32*, Void**, Void*, Void)*

  alias GLUnurbsErrorProc = Proc(UInt32, Void)*

  GL_VERSION_1_1 = 1_u32
  GL_ACCUM = 256_u32
  GL_LOAD = 257_u32
  GL_RETURN = 258_u32
  GL_MULT = 259_u32
  GL_ADD = 260_u32
  GL_NEVER = 512_u32
  GL_LESS = 513_u32
  GL_EQUAL = 514_u32
  GL_LEQUAL = 515_u32
  GL_GREATER = 516_u32
  GL_NOTEQUAL = 517_u32
  GL_GEQUAL = 518_u32
  GL_ALWAYS = 519_u32
  GL_CURRENT_BIT = 1_u32
  GL_POINT_BIT = 2_u32
  GL_LINE_BIT = 4_u32
  GL_POLYGON_BIT = 8_u32
  GL_POLYGON_STIPPLE_BIT = 16_u32
  GL_PIXEL_MODE_BIT = 32_u32
  GL_LIGHTING_BIT = 64_u32
  GL_FOG_BIT = 128_u32
  GL_DEPTH_BUFFER_BIT = 256_u32
  GL_ACCUM_BUFFER_BIT = 512_u32
  GL_STENCIL_BUFFER_BIT = 1024_u32
  GL_VIEWPORT_BIT = 2048_u32
  GL_TRANSFORM_BIT = 4096_u32
  GL_ENABLE_BIT = 8192_u32
  GL_COLOR_BUFFER_BIT = 16384_u32
  GL_HINT_BIT = 32768_u32
  GL_EVAL_BIT = 65536_u32
  GL_LIST_BIT = 131072_u32
  GL_TEXTURE_BIT = 262144_u32
  GL_SCISSOR_BIT = 524288_u32
  GL_ALL_ATTRIB_BITS = 1048575_u32
  GL_POINTS = 0_u32
  GL_LINES = 1_u32
  GL_LINE_LOOP = 2_u32
  GL_LINE_STRIP = 3_u32
  GL_TRIANGLES = 4_u32
  GL_TRIANGLE_STRIP = 5_u32
  GL_TRIANGLE_FAN = 6_u32
  GL_QUADS = 7_u32
  GL_QUAD_STRIP = 8_u32
  GL_POLYGON = 9_u32
  GL_ZERO = 0_u32
  GL_ONE = 1_u32
  GL_SRC_COLOR = 768_u32
  GL_ONE_MINUS_SRC_COLOR = 769_u32
  GL_SRC_ALPHA = 770_u32
  GL_ONE_MINUS_SRC_ALPHA = 771_u32
  GL_DST_ALPHA = 772_u32
  GL_ONE_MINUS_DST_ALPHA = 773_u32
  GL_DST_COLOR = 774_u32
  GL_ONE_MINUS_DST_COLOR = 775_u32
  GL_SRC_ALPHA_SATURATE = 776_u32
  GL_TRUE = 1_u32
  GL_FALSE = 0_u32
  GL_CLIP_PLANE0 = 12288_u32
  GL_CLIP_PLANE1 = 12289_u32
  GL_CLIP_PLANE2 = 12290_u32
  GL_CLIP_PLANE3 = 12291_u32
  GL_CLIP_PLANE4 = 12292_u32
  GL_CLIP_PLANE5 = 12293_u32
  GL_BYTE = 5120_u32
  GL_UNSIGNED_BYTE = 5121_u32
  GL_SHORT = 5122_u32
  GL_UNSIGNED_SHORT = 5123_u32
  GL_INT = 5124_u32
  GL_UNSIGNED_INT = 5125_u32
  GL_FLOAT = 5126_u32
  GL_2_BYTES = 5127_u32
  GL_3_BYTES = 5128_u32
  GL_4_BYTES = 5129_u32
  GL_DOUBLE = 5130_u32
  GL_NONE = 0_u32
  GL_FRONT_LEFT = 1024_u32
  GL_FRONT_RIGHT = 1025_u32
  GL_BACK_LEFT = 1026_u32
  GL_BACK_RIGHT = 1027_u32
  GL_FRONT = 1028_u32
  GL_BACK = 1029_u32
  GL_LEFT = 1030_u32
  GL_RIGHT = 1031_u32
  GL_FRONT_AND_BACK = 1032_u32
  GL_AUX0 = 1033_u32
  GL_AUX1 = 1034_u32
  GL_AUX2 = 1035_u32
  GL_AUX3 = 1036_u32
  GL_NO_ERROR = 0_u32
  GL_INVALID_ENUM = 1280_u32
  GL_INVALID_VALUE = 1281_u32
  GL_INVALID_OPERATION = 1282_u32
  GL_STACK_OVERFLOW = 1283_u32
  GL_STACK_UNDERFLOW = 1284_u32
  GL_OUT_OF_MEMORY = 1285_u32
  GL_2D = 1536_u32
  GL_3D = 1537_u32
  GL_3D_COLOR = 1538_u32
  GL_3D_COLOR_TEXTURE = 1539_u32
  GL_4D_COLOR_TEXTURE = 1540_u32
  GL_PASS_THROUGH_TOKEN = 1792_u32
  GL_POINT_TOKEN = 1793_u32
  GL_LINE_TOKEN = 1794_u32
  GL_POLYGON_TOKEN = 1795_u32
  GL_BITMAP_TOKEN = 1796_u32
  GL_DRAW_PIXEL_TOKEN = 1797_u32
  GL_COPY_PIXEL_TOKEN = 1798_u32
  GL_LINE_RESET_TOKEN = 1799_u32
  GL_EXP = 2048_u32
  GL_EXP2 = 2049_u32
  GL_CW = 2304_u32
  GL_CCW = 2305_u32
  GL_COEFF = 2560_u32
  GL_ORDER = 2561_u32
  GL_DOMAIN = 2562_u32
  GL_CURRENT_COLOR = 2816_u32
  GL_CURRENT_INDEX = 2817_u32
  GL_CURRENT_NORMAL = 2818_u32
  GL_CURRENT_TEXTURE_COORDS = 2819_u32
  GL_CURRENT_RASTER_COLOR = 2820_u32
  GL_CURRENT_RASTER_INDEX = 2821_u32
  GL_CURRENT_RASTER_TEXTURE_COORDS = 2822_u32
  GL_CURRENT_RASTER_POSITION = 2823_u32
  GL_CURRENT_RASTER_POSITION_VALID = 2824_u32
  GL_CURRENT_RASTER_DISTANCE = 2825_u32
  GL_POINT_SMOOTH = 2832_u32
  GL_POINT_SIZE = 2833_u32
  GL_POINT_SIZE_RANGE = 2834_u32
  GL_POINT_SIZE_GRANULARITY = 2835_u32
  GL_LINE_SMOOTH = 2848_u32
  GL_LINE_WIDTH = 2849_u32
  GL_LINE_WIDTH_RANGE = 2850_u32
  GL_LINE_WIDTH_GRANULARITY = 2851_u32
  GL_LINE_STIPPLE = 2852_u32
  GL_LINE_STIPPLE_PATTERN = 2853_u32
  GL_LINE_STIPPLE_REPEAT = 2854_u32
  GL_LIST_MODE = 2864_u32
  GL_MAX_LIST_NESTING = 2865_u32
  GL_LIST_BASE = 2866_u32
  GL_LIST_INDEX = 2867_u32
  GL_POLYGON_MODE = 2880_u32
  GL_POLYGON_SMOOTH = 2881_u32
  GL_POLYGON_STIPPLE = 2882_u32
  GL_EDGE_FLAG = 2883_u32
  GL_CULL_FACE = 2884_u32
  GL_CULL_FACE_MODE = 2885_u32
  GL_FRONT_FACE = 2886_u32
  GL_LIGHTING = 2896_u32
  GL_LIGHT_MODEL_LOCAL_VIEWER = 2897_u32
  GL_LIGHT_MODEL_TWO_SIDE = 2898_u32
  GL_LIGHT_MODEL_AMBIENT = 2899_u32
  GL_SHADE_MODEL = 2900_u32
  GL_COLOR_MATERIAL_FACE = 2901_u32
  GL_COLOR_MATERIAL_PARAMETER = 2902_u32
  GL_COLOR_MATERIAL = 2903_u32
  GL_FOG = 2912_u32
  GL_FOG_INDEX = 2913_u32
  GL_FOG_DENSITY = 2914_u32
  GL_FOG_START = 2915_u32
  GL_FOG_END = 2916_u32
  GL_FOG_MODE = 2917_u32
  GL_FOG_COLOR = 2918_u32
  GL_DEPTH_RANGE = 2928_u32
  GL_DEPTH_TEST = 2929_u32
  GL_DEPTH_WRITEMASK = 2930_u32
  GL_DEPTH_CLEAR_VALUE = 2931_u32
  GL_DEPTH_FUNC = 2932_u32
  GL_ACCUM_CLEAR_VALUE = 2944_u32
  GL_STENCIL_TEST = 2960_u32
  GL_STENCIL_CLEAR_VALUE = 2961_u32
  GL_STENCIL_FUNC = 2962_u32
  GL_STENCIL_VALUE_MASK = 2963_u32
  GL_STENCIL_FAIL = 2964_u32
  GL_STENCIL_PASS_DEPTH_FAIL = 2965_u32
  GL_STENCIL_PASS_DEPTH_PASS = 2966_u32
  GL_STENCIL_REF = 2967_u32
  GL_STENCIL_WRITEMASK = 2968_u32
  GL_MATRIX_MODE = 2976_u32
  GL_NORMALIZE = 2977_u32
  GL_VIEWPORT = 2978_u32
  GL_MODELVIEW_STACK_DEPTH = 2979_u32
  GL_PROJECTION_STACK_DEPTH = 2980_u32
  GL_TEXTURE_STACK_DEPTH = 2981_u32
  GL_MODELVIEW_MATRIX = 2982_u32
  GL_PROJECTION_MATRIX = 2983_u32
  GL_TEXTURE_MATRIX = 2984_u32
  GL_ATTRIB_STACK_DEPTH = 2992_u32
  GL_CLIENT_ATTRIB_STACK_DEPTH = 2993_u32
  GL_ALPHA_TEST = 3008_u32
  GL_ALPHA_TEST_FUNC = 3009_u32
  GL_ALPHA_TEST_REF = 3010_u32
  GL_DITHER = 3024_u32
  GL_BLEND_DST = 3040_u32
  GL_BLEND_SRC = 3041_u32
  GL_BLEND = 3042_u32
  GL_LOGIC_OP_MODE = 3056_u32
  GL_INDEX_LOGIC_OP = 3057_u32
  GL_COLOR_LOGIC_OP = 3058_u32
  GL_AUX_BUFFERS = 3072_u32
  GL_DRAW_BUFFER = 3073_u32
  GL_READ_BUFFER = 3074_u32
  GL_SCISSOR_BOX = 3088_u32
  GL_SCISSOR_TEST = 3089_u32
  GL_INDEX_CLEAR_VALUE = 3104_u32
  GL_INDEX_WRITEMASK = 3105_u32
  GL_COLOR_CLEAR_VALUE = 3106_u32
  GL_COLOR_WRITEMASK = 3107_u32
  GL_INDEX_MODE = 3120_u32
  GL_RGBA_MODE = 3121_u32
  GL_DOUBLEBUFFER = 3122_u32
  GL_STEREO = 3123_u32
  GL_RENDER_MODE = 3136_u32
  GL_PERSPECTIVE_CORRECTION_HINT = 3152_u32
  GL_POINT_SMOOTH_HINT = 3153_u32
  GL_LINE_SMOOTH_HINT = 3154_u32
  GL_POLYGON_SMOOTH_HINT = 3155_u32
  GL_FOG_HINT = 3156_u32
  GL_TEXTURE_GEN_S = 3168_u32
  GL_TEXTURE_GEN_T = 3169_u32
  GL_TEXTURE_GEN_R = 3170_u32
  GL_TEXTURE_GEN_Q = 3171_u32
  GL_PIXEL_MAP_I_TO_I = 3184_u32
  GL_PIXEL_MAP_S_TO_S = 3185_u32
  GL_PIXEL_MAP_I_TO_R = 3186_u32
  GL_PIXEL_MAP_I_TO_G = 3187_u32
  GL_PIXEL_MAP_I_TO_B = 3188_u32
  GL_PIXEL_MAP_I_TO_A = 3189_u32
  GL_PIXEL_MAP_R_TO_R = 3190_u32
  GL_PIXEL_MAP_G_TO_G = 3191_u32
  GL_PIXEL_MAP_B_TO_B = 3192_u32
  GL_PIXEL_MAP_A_TO_A = 3193_u32
  GL_PIXEL_MAP_I_TO_I_SIZE = 3248_u32
  GL_PIXEL_MAP_S_TO_S_SIZE = 3249_u32
  GL_PIXEL_MAP_I_TO_R_SIZE = 3250_u32
  GL_PIXEL_MAP_I_TO_G_SIZE = 3251_u32
  GL_PIXEL_MAP_I_TO_B_SIZE = 3252_u32
  GL_PIXEL_MAP_I_TO_A_SIZE = 3253_u32
  GL_PIXEL_MAP_R_TO_R_SIZE = 3254_u32
  GL_PIXEL_MAP_G_TO_G_SIZE = 3255_u32
  GL_PIXEL_MAP_B_TO_B_SIZE = 3256_u32
  GL_PIXEL_MAP_A_TO_A_SIZE = 3257_u32
  GL_UNPACK_SWAP_BYTES = 3312_u32
  GL_UNPACK_LSB_FIRST = 3313_u32
  GL_UNPACK_ROW_LENGTH = 3314_u32
  GL_UNPACK_SKIP_ROWS = 3315_u32
  GL_UNPACK_SKIP_PIXELS = 3316_u32
  GL_UNPACK_ALIGNMENT = 3317_u32
  GL_PACK_SWAP_BYTES = 3328_u32
  GL_PACK_LSB_FIRST = 3329_u32
  GL_PACK_ROW_LENGTH = 3330_u32
  GL_PACK_SKIP_ROWS = 3331_u32
  GL_PACK_SKIP_PIXELS = 3332_u32
  GL_PACK_ALIGNMENT = 3333_u32
  GL_MAP_COLOR = 3344_u32
  GL_MAP_STENCIL = 3345_u32
  GL_INDEX_SHIFT = 3346_u32
  GL_INDEX_OFFSET = 3347_u32
  GL_RED_SCALE = 3348_u32
  GL_RED_BIAS = 3349_u32
  GL_ZOOM_X = 3350_u32
  GL_ZOOM_Y = 3351_u32
  GL_GREEN_SCALE = 3352_u32
  GL_GREEN_BIAS = 3353_u32
  GL_BLUE_SCALE = 3354_u32
  GL_BLUE_BIAS = 3355_u32
  GL_ALPHA_SCALE = 3356_u32
  GL_ALPHA_BIAS = 3357_u32
  GL_DEPTH_SCALE = 3358_u32
  GL_DEPTH_BIAS = 3359_u32
  GL_MAX_EVAL_ORDER = 3376_u32
  GL_MAX_LIGHTS = 3377_u32
  GL_MAX_CLIP_PLANES = 3378_u32
  GL_MAX_TEXTURE_SIZE = 3379_u32
  GL_MAX_PIXEL_MAP_TABLE = 3380_u32
  GL_MAX_ATTRIB_STACK_DEPTH = 3381_u32
  GL_MAX_MODELVIEW_STACK_DEPTH = 3382_u32
  GL_MAX_NAME_STACK_DEPTH = 3383_u32
  GL_MAX_PROJECTION_STACK_DEPTH = 3384_u32
  GL_MAX_TEXTURE_STACK_DEPTH = 3385_u32
  GL_MAX_VIEWPORT_DIMS = 3386_u32
  GL_MAX_CLIENT_ATTRIB_STACK_DEPTH = 3387_u32
  GL_SUBPIXEL_BITS = 3408_u32
  GL_INDEX_BITS = 3409_u32
  GL_RED_BITS = 3410_u32
  GL_GREEN_BITS = 3411_u32
  GL_BLUE_BITS = 3412_u32
  GL_ALPHA_BITS = 3413_u32
  GL_DEPTH_BITS = 3414_u32
  GL_STENCIL_BITS = 3415_u32
  GL_ACCUM_RED_BITS = 3416_u32
  GL_ACCUM_GREEN_BITS = 3417_u32
  GL_ACCUM_BLUE_BITS = 3418_u32
  GL_ACCUM_ALPHA_BITS = 3419_u32
  GL_NAME_STACK_DEPTH = 3440_u32
  GL_AUTO_NORMAL = 3456_u32
  GL_MAP1_COLOR_4 = 3472_u32
  GL_MAP1_INDEX = 3473_u32
  GL_MAP1_NORMAL = 3474_u32
  GL_MAP1_TEXTURE_COORD_1 = 3475_u32
  GL_MAP1_TEXTURE_COORD_2 = 3476_u32
  GL_MAP1_TEXTURE_COORD_3 = 3477_u32
  GL_MAP1_TEXTURE_COORD_4 = 3478_u32
  GL_MAP1_VERTEX_3 = 3479_u32
  GL_MAP1_VERTEX_4 = 3480_u32
  GL_MAP2_COLOR_4 = 3504_u32
  GL_MAP2_INDEX = 3505_u32
  GL_MAP2_NORMAL = 3506_u32
  GL_MAP2_TEXTURE_COORD_1 = 3507_u32
  GL_MAP2_TEXTURE_COORD_2 = 3508_u32
  GL_MAP2_TEXTURE_COORD_3 = 3509_u32
  GL_MAP2_TEXTURE_COORD_4 = 3510_u32
  GL_MAP2_VERTEX_3 = 3511_u32
  GL_MAP2_VERTEX_4 = 3512_u32
  GL_MAP1_GRID_DOMAIN = 3536_u32
  GL_MAP1_GRID_SEGMENTS = 3537_u32
  GL_MAP2_GRID_DOMAIN = 3538_u32
  GL_MAP2_GRID_SEGMENTS = 3539_u32
  GL_TEXTURE_1D = 3552_u32
  GL_TEXTURE_2D = 3553_u32
  GL_FEEDBACK_BUFFER_POINTER = 3568_u32
  GL_FEEDBACK_BUFFER_SIZE = 3569_u32
  GL_FEEDBACK_BUFFER_TYPE = 3570_u32
  GL_SELECTION_BUFFER_POINTER = 3571_u32
  GL_SELECTION_BUFFER_SIZE = 3572_u32
  GL_TEXTURE_WIDTH = 4096_u32
  GL_TEXTURE_HEIGHT = 4097_u32
  GL_TEXTURE_INTERNAL_FORMAT = 4099_u32
  GL_TEXTURE_BORDER_COLOR = 4100_u32
  GL_TEXTURE_BORDER = 4101_u32
  GL_DONT_CARE = 4352_u32
  GL_FASTEST = 4353_u32
  GL_NICEST = 4354_u32
  GL_LIGHT0 = 16384_u32
  GL_LIGHT1 = 16385_u32
  GL_LIGHT2 = 16386_u32
  GL_LIGHT3 = 16387_u32
  GL_LIGHT4 = 16388_u32
  GL_LIGHT5 = 16389_u32
  GL_LIGHT6 = 16390_u32
  GL_LIGHT7 = 16391_u32
  GL_AMBIENT = 4608_u32
  GL_DIFFUSE = 4609_u32
  GL_SPECULAR = 4610_u32
  GL_POSITION = 4611_u32
  GL_SPOT_DIRECTION = 4612_u32
  GL_SPOT_EXPONENT = 4613_u32
  GL_SPOT_CUTOFF = 4614_u32
  GL_CONSTANT_ATTENUATION = 4615_u32
  GL_LINEAR_ATTENUATION = 4616_u32
  GL_QUADRATIC_ATTENUATION = 4617_u32
  GL_COMPILE = 4864_u32
  GL_COMPILE_AND_EXECUTE = 4865_u32
  GL_CLEAR = 5376_u32
  GL_AND = 5377_u32
  GL_AND_REVERSE = 5378_u32
  GL_COPY = 5379_u32
  GL_AND_INVERTED = 5380_u32
  GL_NOOP = 5381_u32
  GL_XOR = 5382_u32
  GL_OR = 5383_u32
  GL_NOR = 5384_u32
  GL_EQUIV = 5385_u32
  GL_INVERT = 5386_u32
  GL_OR_REVERSE = 5387_u32
  GL_COPY_INVERTED = 5388_u32
  GL_OR_INVERTED = 5389_u32
  GL_NAND = 5390_u32
  GL_SET = 5391_u32
  GL_EMISSION = 5632_u32
  GL_SHININESS = 5633_u32
  GL_AMBIENT_AND_DIFFUSE = 5634_u32
  GL_COLOR_INDEXES = 5635_u32
  GL_MODELVIEW = 5888_u32
  GL_PROJECTION = 5889_u32
  GL_TEXTURE = 5890_u32
  GL_COLOR = 6144_u32
  GL_DEPTH = 6145_u32
  GL_STENCIL = 6146_u32
  GL_COLOR_INDEX = 6400_u32
  GL_STENCIL_INDEX = 6401_u32
  GL_DEPTH_COMPONENT = 6402_u32
  GL_RED = 6403_u32
  GL_GREEN = 6404_u32
  GL_BLUE = 6405_u32
  GL_ALPHA = 6406_u32
  GL_RGB = 6407_u32
  GL_RGBA = 6408_u32
  GL_LUMINANCE = 6409_u32
  GL_LUMINANCE_ALPHA = 6410_u32
  GL_BITMAP = 6656_u32
  GL_POINT = 6912_u32
  GL_LINE = 6913_u32
  GL_FILL = 6914_u32
  GL_RENDER = 7168_u32
  GL_FEEDBACK = 7169_u32
  GL_SELECT = 7170_u32
  GL_FLAT = 7424_u32
  GL_SMOOTH = 7425_u32
  GL_KEEP = 7680_u32
  GL_REPLACE = 7681_u32
  GL_INCR = 7682_u32
  GL_DECR = 7683_u32
  GL_VENDOR = 7936_u32
  GL_RENDERER = 7937_u32
  GL_VERSION = 7938_u32
  GL_EXTENSIONS = 7939_u32
  GL_S = 8192_u32
  GL_T = 8193_u32
  GL_R = 8194_u32
  GL_Q = 8195_u32
  GL_MODULATE = 8448_u32
  GL_DECAL = 8449_u32
  GL_TEXTURE_ENV_MODE = 8704_u32
  GL_TEXTURE_ENV_COLOR = 8705_u32
  GL_TEXTURE_ENV = 8960_u32
  GL_EYE_LINEAR = 9216_u32
  GL_OBJECT_LINEAR = 9217_u32
  GL_SPHERE_MAP = 9218_u32
  GL_TEXTURE_GEN_MODE = 9472_u32
  GL_OBJECT_PLANE = 9473_u32
  GL_EYE_PLANE = 9474_u32
  GL_NEAREST = 9728_u32
  GL_LINEAR = 9729_u32
  GL_NEAREST_MIPMAP_NEAREST = 9984_u32
  GL_LINEAR_MIPMAP_NEAREST = 9985_u32
  GL_NEAREST_MIPMAP_LINEAR = 9986_u32
  GL_LINEAR_MIPMAP_LINEAR = 9987_u32
  GL_TEXTURE_MAG_FILTER = 10240_u32
  GL_TEXTURE_MIN_FILTER = 10241_u32
  GL_TEXTURE_WRAP_S = 10242_u32
  GL_TEXTURE_WRAP_T = 10243_u32
  GL_CLAMP = 10496_u32
  GL_REPEAT = 10497_u32
  GL_CLIENT_PIXEL_STORE_BIT = 1_u32
  GL_CLIENT_VERTEX_ARRAY_BIT = 2_u32
  GL_CLIENT_ALL_ATTRIB_BITS = 4294967295_u32
  GL_POLYGON_OFFSET_FACTOR = 32824_u32
  GL_POLYGON_OFFSET_UNITS = 10752_u32
  GL_POLYGON_OFFSET_POINT = 10753_u32
  GL_POLYGON_OFFSET_LINE = 10754_u32
  GL_POLYGON_OFFSET_FILL = 32823_u32
  GL_ALPHA4 = 32827_u32
  GL_ALPHA8 = 32828_u32
  GL_ALPHA12 = 32829_u32
  GL_ALPHA16 = 32830_u32
  GL_LUMINANCE4 = 32831_u32
  GL_LUMINANCE8 = 32832_u32
  GL_LUMINANCE12 = 32833_u32
  GL_LUMINANCE16 = 32834_u32
  GL_LUMINANCE4_ALPHA4 = 32835_u32
  GL_LUMINANCE6_ALPHA2 = 32836_u32
  GL_LUMINANCE8_ALPHA8 = 32837_u32
  GL_LUMINANCE12_ALPHA4 = 32838_u32
  GL_LUMINANCE12_ALPHA12 = 32839_u32
  GL_LUMINANCE16_ALPHA16 = 32840_u32
  GL_INTENSITY = 32841_u32
  GL_INTENSITY4 = 32842_u32
  GL_INTENSITY8 = 32843_u32
  GL_INTENSITY12 = 32844_u32
  GL_INTENSITY16 = 32845_u32
  GL_R3_G3_B2 = 10768_u32
  GL_RGB4 = 32847_u32
  GL_RGB5 = 32848_u32
  GL_RGB8 = 32849_u32
  GL_RGB10 = 32850_u32
  GL_RGB12 = 32851_u32
  GL_RGB16 = 32852_u32
  GL_RGBA2 = 32853_u32
  GL_RGBA4 = 32854_u32
  GL_RGB5_A1 = 32855_u32
  GL_RGBA8 = 32856_u32
  GL_RGB10_A2 = 32857_u32
  GL_RGBA12 = 32858_u32
  GL_RGBA16 = 32859_u32
  GL_TEXTURE_RED_SIZE = 32860_u32
  GL_TEXTURE_GREEN_SIZE = 32861_u32
  GL_TEXTURE_BLUE_SIZE = 32862_u32
  GL_TEXTURE_ALPHA_SIZE = 32863_u32
  GL_TEXTURE_LUMINANCE_SIZE = 32864_u32
  GL_TEXTURE_INTENSITY_SIZE = 32865_u32
  GL_PROXY_TEXTURE_1D = 32867_u32
  GL_PROXY_TEXTURE_2D = 32868_u32
  GL_TEXTURE_PRIORITY = 32870_u32
  GL_TEXTURE_RESIDENT = 32871_u32
  GL_TEXTURE_BINDING_1D = 32872_u32
  GL_TEXTURE_BINDING_2D = 32873_u32
  GL_VERTEX_ARRAY = 32884_u32
  GL_NORMAL_ARRAY = 32885_u32
  GL_COLOR_ARRAY = 32886_u32
  GL_INDEX_ARRAY = 32887_u32
  GL_TEXTURE_COORD_ARRAY = 32888_u32
  GL_EDGE_FLAG_ARRAY = 32889_u32
  GL_VERTEX_ARRAY_SIZE = 32890_u32
  GL_VERTEX_ARRAY_TYPE = 32891_u32
  GL_VERTEX_ARRAY_STRIDE = 32892_u32
  GL_NORMAL_ARRAY_TYPE = 32894_u32
  GL_NORMAL_ARRAY_STRIDE = 32895_u32
  GL_COLOR_ARRAY_SIZE = 32897_u32
  GL_COLOR_ARRAY_TYPE = 32898_u32
  GL_COLOR_ARRAY_STRIDE = 32899_u32
  GL_INDEX_ARRAY_TYPE = 32901_u32
  GL_INDEX_ARRAY_STRIDE = 32902_u32
  GL_TEXTURE_COORD_ARRAY_SIZE = 32904_u32
  GL_TEXTURE_COORD_ARRAY_TYPE = 32905_u32
  GL_TEXTURE_COORD_ARRAY_STRIDE = 32906_u32
  GL_EDGE_FLAG_ARRAY_STRIDE = 32908_u32
  GL_VERTEX_ARRAY_POINTER = 32910_u32
  GL_NORMAL_ARRAY_POINTER = 32911_u32
  GL_COLOR_ARRAY_POINTER = 32912_u32
  GL_INDEX_ARRAY_POINTER = 32913_u32
  GL_TEXTURE_COORD_ARRAY_POINTER = 32914_u32
  GL_EDGE_FLAG_ARRAY_POINTER = 32915_u32
  GL_V2F = 10784_u32
  GL_V3F = 10785_u32
  GL_C4UB_V2F = 10786_u32
  GL_C4UB_V3F = 10787_u32
  GL_C3F_V3F = 10788_u32
  GL_N3F_V3F = 10789_u32
  GL_C4F_N3F_V3F = 10790_u32
  GL_T2F_V3F = 10791_u32
  GL_T4F_V4F = 10792_u32
  GL_T2F_C4UB_V3F = 10793_u32
  GL_T2F_C3F_V3F = 10794_u32
  GL_T2F_N3F_V3F = 10795_u32
  GL_T2F_C4F_N3F_V3F = 10796_u32
  GL_T4F_C4F_N3F_V4F = 10797_u32
  GL_EXT_vertex_array = 1_u32
  GL_EXT_bgra = 1_u32
  GL_EXT_paletted_texture = 1_u32
  GL_WIN_swap_hint = 1_u32
  GL_WIN_draw_range_elements = 1_u32
  GL_VERTEX_ARRAY_EXT = 32884_u32
  GL_NORMAL_ARRAY_EXT = 32885_u32
  GL_COLOR_ARRAY_EXT = 32886_u32
  GL_INDEX_ARRAY_EXT = 32887_u32
  GL_TEXTURE_COORD_ARRAY_EXT = 32888_u32
  GL_EDGE_FLAG_ARRAY_EXT = 32889_u32
  GL_VERTEX_ARRAY_SIZE_EXT = 32890_u32
  GL_VERTEX_ARRAY_TYPE_EXT = 32891_u32
  GL_VERTEX_ARRAY_STRIDE_EXT = 32892_u32
  GL_VERTEX_ARRAY_COUNT_EXT = 32893_u32
  GL_NORMAL_ARRAY_TYPE_EXT = 32894_u32
  GL_NORMAL_ARRAY_STRIDE_EXT = 32895_u32
  GL_NORMAL_ARRAY_COUNT_EXT = 32896_u32
  GL_COLOR_ARRAY_SIZE_EXT = 32897_u32
  GL_COLOR_ARRAY_TYPE_EXT = 32898_u32
  GL_COLOR_ARRAY_STRIDE_EXT = 32899_u32
  GL_COLOR_ARRAY_COUNT_EXT = 32900_u32
  GL_INDEX_ARRAY_TYPE_EXT = 32901_u32
  GL_INDEX_ARRAY_STRIDE_EXT = 32902_u32
  GL_INDEX_ARRAY_COUNT_EXT = 32903_u32
  GL_TEXTURE_COORD_ARRAY_SIZE_EXT = 32904_u32
  GL_TEXTURE_COORD_ARRAY_TYPE_EXT = 32905_u32
  GL_TEXTURE_COORD_ARRAY_STRIDE_EXT = 32906_u32
  GL_TEXTURE_COORD_ARRAY_COUNT_EXT = 32907_u32
  GL_EDGE_FLAG_ARRAY_STRIDE_EXT = 32908_u32
  GL_EDGE_FLAG_ARRAY_COUNT_EXT = 32909_u32
  GL_VERTEX_ARRAY_POINTER_EXT = 32910_u32
  GL_NORMAL_ARRAY_POINTER_EXT = 32911_u32
  GL_COLOR_ARRAY_POINTER_EXT = 32912_u32
  GL_INDEX_ARRAY_POINTER_EXT = 32913_u32
  GL_TEXTURE_COORD_ARRAY_POINTER_EXT = 32914_u32
  GL_EDGE_FLAG_ARRAY_POINTER_EXT = 32915_u32
  GL_DOUBLE_EXT = 5130_u32
  GL_BGR_EXT = 32992_u32
  GL_BGRA_EXT = 32993_u32
  GL_COLOR_TABLE_FORMAT_EXT = 32984_u32
  GL_COLOR_TABLE_WIDTH_EXT = 32985_u32
  GL_COLOR_TABLE_RED_SIZE_EXT = 32986_u32
  GL_COLOR_TABLE_GREEN_SIZE_EXT = 32987_u32
  GL_COLOR_TABLE_BLUE_SIZE_EXT = 32988_u32
  GL_COLOR_TABLE_ALPHA_SIZE_EXT = 32989_u32
  GL_COLOR_TABLE_LUMINANCE_SIZE_EXT = 32990_u32
  GL_COLOR_TABLE_INTENSITY_SIZE_EXT = 32991_u32
  GL_COLOR_INDEX1_EXT = 32994_u32
  GL_COLOR_INDEX2_EXT = 32995_u32
  GL_COLOR_INDEX4_EXT = 32996_u32
  GL_COLOR_INDEX8_EXT = 32997_u32
  GL_COLOR_INDEX12_EXT = 32998_u32
  GL_COLOR_INDEX16_EXT = 32999_u32
  GL_MAX_ELEMENTS_VERTICES_WIN = 33000_u32
  GL_MAX_ELEMENTS_INDICES_WIN = 33001_u32
  GL_PHONG_WIN = 33002_u32
  GL_PHONG_HINT_WIN = 33003_u32
  GL_FOG_SPECULAR_TEXTURE_WIN = 33004_u32
  GL_LOGIC_OP = 3057_u32
  GL_TEXTURE_COMPONENTS = 4099_u32
  GLU_VERSION_1_1 = 1_u32
  GLU_VERSION_1_2 = 1_u32
  GLU_INVALID_ENUM = 100900_u32
  GLU_INVALID_VALUE = 100901_u32
  GLU_OUT_OF_MEMORY = 100902_u32
  GLU_INCOMPATIBLE_GL_VERSION = 100903_u32
  GLU_VERSION = 100800_u32
  GLU_EXTENSIONS = 100801_u32
  GLU_TRUE = 1_u32
  GLU_FALSE = 0_u32
  GLU_SMOOTH = 100000_u32
  GLU_FLAT = 100001_u32
  GLU_NONE = 100002_u32
  GLU_POINT = 100010_u32
  GLU_LINE = 100011_u32
  GLU_FILL = 100012_u32
  GLU_SILHOUETTE = 100013_u32
  GLU_OUTSIDE = 100020_u32
  GLU_INSIDE = 100021_u32
  GLU_TESS_WINDING_RULE = 100140_u32
  GLU_TESS_BOUNDARY_ONLY = 100141_u32
  GLU_TESS_TOLERANCE = 100142_u32
  GLU_TESS_WINDING_ODD = 100130_u32
  GLU_TESS_WINDING_NONZERO = 100131_u32
  GLU_TESS_WINDING_POSITIVE = 100132_u32
  GLU_TESS_WINDING_NEGATIVE = 100133_u32
  GLU_TESS_WINDING_ABS_GEQ_TWO = 100134_u32
  GLU_TESS_BEGIN = 100100_u32
  GLU_TESS_VERTEX = 100101_u32
  GLU_TESS_END = 100102_u32
  GLU_TESS_ERROR = 100103_u32
  GLU_TESS_EDGE_FLAG = 100104_u32
  GLU_TESS_COMBINE = 100105_u32
  GLU_TESS_BEGIN_DATA = 100106_u32
  GLU_TESS_VERTEX_DATA = 100107_u32
  GLU_TESS_END_DATA = 100108_u32
  GLU_TESS_ERROR_DATA = 100109_u32
  GLU_TESS_EDGE_FLAG_DATA = 100110_u32
  GLU_TESS_COMBINE_DATA = 100111_u32
  GLU_TESS_ERROR1 = 100151_u32
  GLU_TESS_ERROR2 = 100152_u32
  GLU_TESS_ERROR3 = 100153_u32
  GLU_TESS_ERROR4 = 100154_u32
  GLU_TESS_ERROR5 = 100155_u32
  GLU_TESS_ERROR6 = 100156_u32
  GLU_TESS_ERROR7 = 100157_u32
  GLU_TESS_ERROR8 = 100158_u32
  GLU_TESS_MISSING_BEGIN_POLYGON = 100151_u32
  GLU_TESS_MISSING_BEGIN_CONTOUR = 100152_u32
  GLU_TESS_MISSING_END_POLYGON = 100153_u32
  GLU_TESS_MISSING_END_CONTOUR = 100154_u32
  GLU_TESS_COORD_TOO_LARGE = 100155_u32
  GLU_TESS_NEED_COMBINE_CALLBACK = 100156_u32
  GLU_AUTO_LOAD_MATRIX = 100200_u32
  GLU_CULLING = 100201_u32
  GLU_SAMPLING_TOLERANCE = 100203_u32
  GLU_DISPLAY_MODE = 100204_u32
  GLU_PARAMETRIC_TOLERANCE = 100202_u32
  GLU_SAMPLING_METHOD = 100205_u32
  GLU_U_STEP = 100206_u32
  GLU_V_STEP = 100207_u32
  GLU_PATH_LENGTH = 100215_u32
  GLU_PARAMETRIC_ERROR = 100216_u32
  GLU_DOMAIN_DISTANCE = 100217_u32
  GLU_MAP1_TRIM_2 = 100210_u32
  GLU_MAP1_TRIM_3 = 100211_u32
  GLU_OUTLINE_POLYGON = 100240_u32
  GLU_OUTLINE_PATCH = 100241_u32
  GLU_NURBS_ERROR1 = 100251_u32
  GLU_NURBS_ERROR2 = 100252_u32
  GLU_NURBS_ERROR3 = 100253_u32
  GLU_NURBS_ERROR4 = 100254_u32
  GLU_NURBS_ERROR5 = 100255_u32
  GLU_NURBS_ERROR6 = 100256_u32
  GLU_NURBS_ERROR7 = 100257_u32
  GLU_NURBS_ERROR8 = 100258_u32
  GLU_NURBS_ERROR9 = 100259_u32
  GLU_NURBS_ERROR10 = 100260_u32
  GLU_NURBS_ERROR11 = 100261_u32
  GLU_NURBS_ERROR12 = 100262_u32
  GLU_NURBS_ERROR13 = 100263_u32
  GLU_NURBS_ERROR14 = 100264_u32
  GLU_NURBS_ERROR15 = 100265_u32
  GLU_NURBS_ERROR16 = 100266_u32
  GLU_NURBS_ERROR17 = 100267_u32
  GLU_NURBS_ERROR18 = 100268_u32
  GLU_NURBS_ERROR19 = 100269_u32
  GLU_NURBS_ERROR20 = 100270_u32
  GLU_NURBS_ERROR21 = 100271_u32
  GLU_NURBS_ERROR22 = 100272_u32
  GLU_NURBS_ERROR23 = 100273_u32
  GLU_NURBS_ERROR24 = 100274_u32
  GLU_NURBS_ERROR25 = 100275_u32
  GLU_NURBS_ERROR26 = 100276_u32
  GLU_NURBS_ERROR27 = 100277_u32
  GLU_NURBS_ERROR28 = 100278_u32
  GLU_NURBS_ERROR29 = 100279_u32
  GLU_NURBS_ERROR30 = 100280_u32
  GLU_NURBS_ERROR31 = 100281_u32
  GLU_NURBS_ERROR32 = 100282_u32
  GLU_NURBS_ERROR33 = 100283_u32
  GLU_NURBS_ERROR34 = 100284_u32
  GLU_NURBS_ERROR35 = 100285_u32
  GLU_NURBS_ERROR36 = 100286_u32
  GLU_NURBS_ERROR37 = 100287_u32
  GLU_CW = 100120_u32
  GLU_CCW = 100121_u32
  GLU_INTERIOR = 100122_u32
  GLU_EXTERIOR = 100123_u32
  GLU_UNKNOWN = 100124_u32
  GLU_BEGIN = 100100_u32
  GLU_VERTEX = 100101_u32
  GLU_END = 100102_u32
  GLU_ERROR = 100103_u32
  GLU_EDGE_FLAG = 100104_u32

  enum PFD_PIXEL_TYPE : Int8
    PFD_TYPE_RGBA = 0_i8
    PFD_TYPE_COLORINDEX = 1_i8
  end
  enum PFD_LAYER_TYPE : Int8
    PFD_UNDERLAY_PLANE = -1_i8
    PFD_MAIN_PLANE = 0_i8
    PFD_OVERLAY_PLANE = 1_i8
  end
  @[Flags]
  enum PFD_FLAGS : UInt32
    PFD_DOUBLEBUFFER = 1_u32
    PFD_STEREO = 2_u32
    PFD_DRAW_TO_WINDOW = 4_u32
    PFD_DRAW_TO_BITMAP = 8_u32
    PFD_SUPPORT_GDI = 16_u32
    PFD_SUPPORT_OPENGL = 32_u32
    PFD_GENERIC_FORMAT = 64_u32
    PFD_NEED_PALETTE = 128_u32
    PFD_NEED_SYSTEM_PALETTE = 256_u32
    PFD_SWAP_EXCHANGE = 512_u32
    PFD_SWAP_COPY = 1024_u32
    PFD_SWAP_LAYER_BUFFERS = 2048_u32
    PFD_GENERIC_ACCELERATED = 4096_u32
    PFD_SUPPORT_DIRECTDRAW = 8192_u32
    PFD_DIRECT3D_ACCELERATED = 16384_u32
    PFD_SUPPORT_COMPOSITION = 32768_u32
    PFD_DEPTH_DONTCARE = 536870912_u32
    PFD_DOUBLEBUFFER_DONTCARE = 1073741824_u32
    PFD_STEREO_DONTCARE = 2147483648_u32
  end

  @[Extern]
  record PIXELFORMATDESCRIPTOR,
    nSize : UInt16,
    nVersion : UInt16,
    dwFlags : Win32cr::Graphics::OpenGL::PFD_FLAGS,
    iPixelType : Win32cr::Graphics::OpenGL::PFD_PIXEL_TYPE,
    cColorBits : UInt8,
    cRedBits : UInt8,
    cRedShift : UInt8,
    cGreenBits : UInt8,
    cGreenShift : UInt8,
    cBlueBits : UInt8,
    cBlueShift : UInt8,
    cAlphaBits : UInt8,
    cAlphaShift : UInt8,
    cAccumBits : UInt8,
    cAccumRedBits : UInt8,
    cAccumGreenBits : UInt8,
    cAccumBlueBits : UInt8,
    cAccumAlphaBits : UInt8,
    cDepthBits : UInt8,
    cStencilBits : UInt8,
    cAuxBuffers : UInt8,
    iLayerType : Win32cr::Graphics::OpenGL::PFD_LAYER_TYPE,
    bReserved : UInt8,
    dwLayerMask : UInt32,
    dwVisibleMask : UInt32,
    dwDamageMask : UInt32

  @[Extern]
  record EMRPIXELFORMAT,
    emr : Win32cr::Graphics::Gdi::EMR,
    pfd : Win32cr::Graphics::OpenGL::PIXELFORMATDESCRIPTOR

  @[Extern]
  record POINTFLOAT,
    x : Float32,
    y : Float32

  @[Extern]
  record GLYPHMETRICSFLOAT,
    gmfBlackBoxX : Float32,
    gmfBlackBoxY : Float32,
    gmfptGlyphOrigin : Win32cr::Graphics::OpenGL::POINTFLOAT,
    gmfCellIncX : Float32,
    gmfCellIncY : Float32

  @[Extern]
  record LAYERPLANEDESCRIPTOR,
    nSize : UInt16,
    nVersion : UInt16,
    dwFlags : UInt32,
    iPixelType : UInt8,
    cColorBits : UInt8,
    cRedBits : UInt8,
    cRedShift : UInt8,
    cGreenBits : UInt8,
    cGreenShift : UInt8,
    cBlueBits : UInt8,
    cBlueShift : UInt8,
    cAlphaBits : UInt8,
    cAlphaShift : UInt8,
    cAccumBits : UInt8,
    cAccumRedBits : UInt8,
    cAccumGreenBits : UInt8,
    cAccumBlueBits : UInt8,
    cAccumAlphaBits : UInt8,
    cDepthBits : UInt8,
    cStencilBits : UInt8,
    cAuxBuffers : UInt8,
    iLayerPlane : UInt8,
    bReserved : UInt8,
    crTransparent : UInt32

  @[Extern]
  record GLUnurbs
  @[Extern]
  record GLUquadric
  @[Extern]
  record GLUtesselator
  @[Link("gdi32")]
  @[Link("opengl32")]
  @[Link("glu32")]
  lib C
    fun ChoosePixelFormat(hdc : Win32cr::Graphics::Gdi::HDC, ppfd : Win32cr::Graphics::OpenGL::PIXELFORMATDESCRIPTOR*) : Int32

    fun DescribePixelFormat(hdc : Win32cr::Graphics::Gdi::HDC, iPixelFormat : Win32cr::Graphics::OpenGL::PFD_PIXEL_TYPE, nBytes : UInt32, ppfd : Win32cr::Graphics::OpenGL::PIXELFORMATDESCRIPTOR*) : Int32

    fun GetPixelFormat(hdc : Win32cr::Graphics::Gdi::HDC) : Int32

    fun SetPixelFormat(hdc : Win32cr::Graphics::Gdi::HDC, format : Int32, ppfd : Win32cr::Graphics::OpenGL::PIXELFORMATDESCRIPTOR*) : Win32cr::Foundation::BOOL

    fun GetEnhMetaFilePixelFormat(hemf : Win32cr::Graphics::Gdi::HENHMETAFILE, cbBuffer : UInt32, ppfd : Win32cr::Graphics::OpenGL::PIXELFORMATDESCRIPTOR*) : UInt32

    fun wglCopyContext(param0 : Win32cr::Graphics::OpenGL::HGLRC, param1 : Win32cr::Graphics::OpenGL::HGLRC, param2 : UInt32) : Win32cr::Foundation::BOOL

    fun wglCreateContext(param0 : Win32cr::Graphics::Gdi::HDC) : Win32cr::Graphics::OpenGL::HGLRC

    fun wglCreateLayerContext(param0 : Win32cr::Graphics::Gdi::HDC, param1 : Int32) : Win32cr::Graphics::OpenGL::HGLRC

    fun wglDeleteContext(param0 : Win32cr::Graphics::OpenGL::HGLRC) : Win32cr::Foundation::BOOL

    fun wglGetCurrentContext : Win32cr::Graphics::OpenGL::HGLRC

    fun wglGetCurrentDC : Win32cr::Graphics::Gdi::HDC

    fun wglGetProcAddress(param0 : Win32cr::Foundation::PSTR) : Win32cr::Foundation::PROC

    fun wglMakeCurrent(param0 : Win32cr::Graphics::Gdi::HDC, param1 : Win32cr::Graphics::OpenGL::HGLRC) : Win32cr::Foundation::BOOL

    fun wglShareLists(param0 : Win32cr::Graphics::OpenGL::HGLRC, param1 : Win32cr::Graphics::OpenGL::HGLRC) : Win32cr::Foundation::BOOL

    fun wglUseFontBitmapsA(param0 : Win32cr::Graphics::Gdi::HDC, param1 : UInt32, param2 : UInt32, param3 : UInt32) : Win32cr::Foundation::BOOL

    fun wglUseFontBitmapsW(param0 : Win32cr::Graphics::Gdi::HDC, param1 : UInt32, param2 : UInt32, param3 : UInt32) : Win32cr::Foundation::BOOL

    fun SwapBuffers(param0 : Win32cr::Graphics::Gdi::HDC) : Win32cr::Foundation::BOOL

    fun wglUseFontOutlinesA(param0 : Win32cr::Graphics::Gdi::HDC, param1 : UInt32, param2 : UInt32, param3 : UInt32, param4 : Float32, param5 : Float32, param6 : Int32, param7 : Win32cr::Graphics::OpenGL::GLYPHMETRICSFLOAT*) : Win32cr::Foundation::BOOL

    fun wglUseFontOutlinesW(param0 : Win32cr::Graphics::Gdi::HDC, param1 : UInt32, param2 : UInt32, param3 : UInt32, param4 : Float32, param5 : Float32, param6 : Int32, param7 : Win32cr::Graphics::OpenGL::GLYPHMETRICSFLOAT*) : Win32cr::Foundation::BOOL

    fun wglDescribeLayerPlane(param0 : Win32cr::Graphics::Gdi::HDC, param1 : Int32, param2 : Int32, param3 : UInt32, param4 : Win32cr::Graphics::OpenGL::LAYERPLANEDESCRIPTOR*) : Win32cr::Foundation::BOOL

    fun wglSetLayerPaletteEntries(param0 : Win32cr::Graphics::Gdi::HDC, param1 : Int32, param2 : Int32, param3 : Int32, param4 : UInt32*) : Int32

    fun wglGetLayerPaletteEntries(param0 : Win32cr::Graphics::Gdi::HDC, param1 : Int32, param2 : Int32, param3 : Int32, param4 : UInt32*) : Int32

    fun wglRealizeLayerPalette(param0 : Win32cr::Graphics::Gdi::HDC, param1 : Int32, param2 : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun wglSwapLayerBuffers(param0 : Win32cr::Graphics::Gdi::HDC, param1 : UInt32) : Win32cr::Foundation::BOOL

    fun glAccum(op : UInt32, value : Float32) : Void

    fun glAlphaFunc(func : UInt32, ref : Float32) : Void

    fun glAreTexturesResident(n : Int32, textures : UInt32*, residences : UInt8*) : UInt8

    fun glArrayElement(i : Int32) : Void

    fun glBegin(mode : UInt32) : Void

    fun glBindTexture(target : UInt32, texture : UInt32) : Void

    fun glBitmap(width : Int32, height : Int32, xorig : Float32, yorig : Float32, xmove : Float32, ymove : Float32, bitmap : UInt8*) : Void

    fun glBlendFunc(sfactor : UInt32, dfactor : UInt32) : Void

    fun glCallList(list : UInt32) : Void

    fun glCallLists(n : Int32, type__ : UInt32, lists : Void*) : Void

    fun glClear(mask : UInt32) : Void

    fun glClearAccum(red : Float32, green : Float32, blue : Float32, alpha : Float32) : Void

    fun glClearColor(red : Float32, green : Float32, blue : Float32, alpha : Float32) : Void

    fun glClearDepth(depth : Float64) : Void

    fun glClearIndex(c : Float32) : Void

    fun glClearStencil(s : Int32) : Void

    fun glClipPlane(plane : UInt32, equation : Float64*) : Void

    fun glColor3b(red : Int8, green : Int8, blue : Int8) : Void

    fun glColor3bv(v : Int8*) : Void

    fun glColor3d(red : Float64, green : Float64, blue : Float64) : Void

    fun glColor3dv(v : Float64*) : Void

    fun glColor3f(red : Float32, green : Float32, blue : Float32) : Void

    fun glColor3fv(v : Float32*) : Void

    fun glColor3i(red : Int32, green : Int32, blue : Int32) : Void

    fun glColor3iv(v : Int32*) : Void

    fun glColor3s(red : Int16, green : Int16, blue : Int16) : Void

    fun glColor3sv(v : Int16*) : Void

    fun glColor3ub(red : UInt8, green : UInt8, blue : UInt8) : Void

    fun glColor3ubv(v : UInt8*) : Void

    fun glColor3ui(red : UInt32, green : UInt32, blue : UInt32) : Void

    fun glColor3uiv(v : UInt32*) : Void

    fun glColor3us(red : UInt16, green : UInt16, blue : UInt16) : Void

    fun glColor3usv(v : UInt16*) : Void

    fun glColor4b(red : Int8, green : Int8, blue : Int8, alpha : Int8) : Void

    fun glColor4bv(v : Int8*) : Void

    fun glColor4d(red : Float64, green : Float64, blue : Float64, alpha : Float64) : Void

    fun glColor4dv(v : Float64*) : Void

    fun glColor4f(red : Float32, green : Float32, blue : Float32, alpha : Float32) : Void

    fun glColor4fv(v : Float32*) : Void

    fun glColor4i(red : Int32, green : Int32, blue : Int32, alpha : Int32) : Void

    fun glColor4iv(v : Int32*) : Void

    fun glColor4s(red : Int16, green : Int16, blue : Int16, alpha : Int16) : Void

    fun glColor4sv(v : Int16*) : Void

    fun glColor4ub(red : UInt8, green : UInt8, blue : UInt8, alpha : UInt8) : Void

    fun glColor4ubv(v : UInt8*) : Void

    fun glColor4ui(red : UInt32, green : UInt32, blue : UInt32, alpha : UInt32) : Void

    fun glColor4uiv(v : UInt32*) : Void

    fun glColor4us(red : UInt16, green : UInt16, blue : UInt16, alpha : UInt16) : Void

    fun glColor4usv(v : UInt16*) : Void

    fun glColorMask(red : UInt8, green : UInt8, blue : UInt8, alpha : UInt8) : Void

    fun glColorMaterial(face : UInt32, mode : UInt32) : Void

    fun glColorPointer(size : Int32, type__ : UInt32, stride : Int32, pointer : Void*) : Void

    fun glCopyPixels(x : Int32, y : Int32, width : Int32, height : Int32, type__ : UInt32) : Void

    fun glCopyTexImage1D(target : UInt32, level : Int32, internalFormat : UInt32, x : Int32, y : Int32, width : Int32, border : Int32) : Void

    fun glCopyTexImage2D(target : UInt32, level : Int32, internalFormat : UInt32, x : Int32, y : Int32, width : Int32, height : Int32, border : Int32) : Void

    fun glCopyTexSubImage1D(target : UInt32, level : Int32, xoffset : Int32, x : Int32, y : Int32, width : Int32) : Void

    fun glCopyTexSubImage2D(target : UInt32, level : Int32, xoffset : Int32, yoffset : Int32, x : Int32, y : Int32, width : Int32, height : Int32) : Void

    fun glCullFace(mode : UInt32) : Void

    fun glDeleteLists(list : UInt32, range : Int32) : Void

    fun glDeleteTextures(n : Int32, textures : UInt32*) : Void

    fun glDepthFunc(func : UInt32) : Void

    fun glDepthMask(flag : UInt8) : Void

    fun glDepthRange(zNear : Float64, zFar : Float64) : Void

    fun glDisable(cap : UInt32) : Void

    fun glDisableClientState(array : UInt32) : Void

    fun glDrawArrays(mode : UInt32, first : Int32, count : Int32) : Void

    fun glDrawBuffer(mode : UInt32) : Void

    fun glDrawElements(mode : UInt32, count : Int32, type__ : UInt32, indices : Void*) : Void

    fun glDrawPixels(width : Int32, height : Int32, format : UInt32, type__ : UInt32, pixels : Void*) : Void

    fun glEdgeFlag(flag : UInt8) : Void

    fun glEdgeFlagPointer(stride : Int32, pointer : Void*) : Void

    fun glEdgeFlagv(flag : UInt8*) : Void

    fun glEnable(cap : UInt32) : Void

    fun glEnableClientState(array : UInt32) : Void

    fun glEnd : Void

    fun glEndList : Void

    fun glEvalCoord1d(u : Float64) : Void

    fun glEvalCoord1dv(u : Float64*) : Void

    fun glEvalCoord1f(u : Float32) : Void

    fun glEvalCoord1fv(u : Float32*) : Void

    fun glEvalCoord2d(u : Float64, v : Float64) : Void

    fun glEvalCoord2dv(u : Float64*) : Void

    fun glEvalCoord2f(u : Float32, v : Float32) : Void

    fun glEvalCoord2fv(u : Float32*) : Void

    fun glEvalMesh1(mode : UInt32, i1 : Int32, i2 : Int32) : Void

    fun glEvalMesh2(mode : UInt32, i1 : Int32, i2 : Int32, j1 : Int32, j2 : Int32) : Void

    fun glEvalPoint1(i : Int32) : Void

    fun glEvalPoint2(i : Int32, j : Int32) : Void

    fun glFeedbackBuffer(size : Int32, type__ : UInt32, buffer : Float32*) : Void

    fun glFinish : Void

    fun glFlush : Void

    fun glFogf(pname : UInt32, param1 : Float32) : Void

    fun glFogfv(pname : UInt32, params : Float32*) : Void

    fun glFogi(pname : UInt32, param1 : Int32) : Void

    fun glFogiv(pname : UInt32, params : Int32*) : Void

    fun glFrontFace(mode : UInt32) : Void

    fun glFrustum(left : Float64, right : Float64, bottom : Float64, top : Float64, zNear : Float64, zFar : Float64) : Void

    fun glGenLists(range : Int32) : UInt32

    fun glGenTextures(n : Int32, textures : UInt32*) : Void

    fun glGetBooleanv(pname : UInt32, params : UInt8*) : Void

    fun glGetClipPlane(plane : UInt32, equation : Float64*) : Void

    fun glGetDoublev(pname : UInt32, params : Float64*) : Void

    fun glGetError : UInt32

    fun glGetFloatv(pname : UInt32, params : Float32*) : Void

    fun glGetIntegerv(pname : UInt32, params : Int32*) : Void

    fun glGetLightfv(light : UInt32, pname : UInt32, params : Float32*) : Void

    fun glGetLightiv(light : UInt32, pname : UInt32, params : Int32*) : Void

    fun glGetMapdv(target : UInt32, query : UInt32, v : Float64*) : Void

    fun glGetMapfv(target : UInt32, query : UInt32, v : Float32*) : Void

    fun glGetMapiv(target : UInt32, query : UInt32, v : Int32*) : Void

    fun glGetMaterialfv(face : UInt32, pname : UInt32, params : Float32*) : Void

    fun glGetMaterialiv(face : UInt32, pname : UInt32, params : Int32*) : Void

    fun glGetPixelMapfv(map : UInt32, values : Float32*) : Void

    fun glGetPixelMapuiv(map : UInt32, values : UInt32*) : Void

    fun glGetPixelMapusv(map : UInt32, values : UInt16*) : Void

    fun glGetPointerv(pname : UInt32, params : Void**) : Void

    fun glGetPolygonStipple(mask : UInt8*) : Void

    fun glGetString(name : UInt32) : UInt8*

    fun glGetTexEnvfv(target : UInt32, pname : UInt32, params : Float32*) : Void

    fun glGetTexEnviv(target : UInt32, pname : UInt32, params : Int32*) : Void

    fun glGetTexGendv(coord : UInt32, pname : UInt32, params : Float64*) : Void

    fun glGetTexGenfv(coord : UInt32, pname : UInt32, params : Float32*) : Void

    fun glGetTexGeniv(coord : UInt32, pname : UInt32, params : Int32*) : Void

    fun glGetTexImage(target : UInt32, level : Int32, format : UInt32, type__ : UInt32, pixels : Void*) : Void

    fun glGetTexLevelParameterfv(target : UInt32, level : Int32, pname : UInt32, params : Float32*) : Void

    fun glGetTexLevelParameteriv(target : UInt32, level : Int32, pname : UInt32, params : Int32*) : Void

    fun glGetTexParameterfv(target : UInt32, pname : UInt32, params : Float32*) : Void

    fun glGetTexParameteriv(target : UInt32, pname : UInt32, params : Int32*) : Void

    fun glHint(target : UInt32, mode : UInt32) : Void

    fun glIndexMask(mask : UInt32) : Void

    fun glIndexPointer(type__ : UInt32, stride : Int32, pointer : Void*) : Void

    fun glIndexd(c : Float64) : Void

    fun glIndexdv(c : Float64*) : Void

    fun glIndexf(c : Float32) : Void

    fun glIndexfv(c : Float32*) : Void

    fun glIndexi(c : Int32) : Void

    fun glIndexiv(c : Int32*) : Void

    fun glIndexs(c : Int16) : Void

    fun glIndexsv(c : Int16*) : Void

    fun glIndexub(c : UInt8) : Void

    fun glIndexubv(c : UInt8*) : Void

    fun glInitNames : Void

    fun glInterleavedArrays(format : UInt32, stride : Int32, pointer : Void*) : Void

    fun glIsEnabled(cap : UInt32) : UInt8

    fun glIsList(list : UInt32) : UInt8

    fun glIsTexture(texture : UInt32) : UInt8

    fun glLightModelf(pname : UInt32, param1 : Float32) : Void

    fun glLightModelfv(pname : UInt32, params : Float32*) : Void

    fun glLightModeli(pname : UInt32, param1 : Int32) : Void

    fun glLightModeliv(pname : UInt32, params : Int32*) : Void

    fun glLightf(light : UInt32, pname : UInt32, param2 : Float32) : Void

    fun glLightfv(light : UInt32, pname : UInt32, params : Float32*) : Void

    fun glLighti(light : UInt32, pname : UInt32, param2 : Int32) : Void

    fun glLightiv(light : UInt32, pname : UInt32, params : Int32*) : Void

    fun glLineStipple(factor : Int32, pattern : UInt16) : Void

    fun glLineWidth(width : Float32) : Void

    fun glListBase(base : UInt32) : Void

    fun glLoadIdentity : Void

    fun glLoadMatrixd(m : Float64*) : Void

    fun glLoadMatrixf(m : Float32*) : Void

    fun glLoadName(name : UInt32) : Void

    fun glLogicOp(opcode : UInt32) : Void

    fun glMap1d(target : UInt32, u1 : Float64, u2 : Float64, stride : Int32, order : Int32, points : Float64*) : Void

    fun glMap1f(target : UInt32, u1 : Float32, u2 : Float32, stride : Int32, order : Int32, points : Float32*) : Void

    fun glMap2d(target : UInt32, u1 : Float64, u2 : Float64, ustride : Int32, uorder : Int32, v1 : Float64, v2 : Float64, vstride : Int32, vorder : Int32, points : Float64*) : Void

    fun glMap2f(target : UInt32, u1 : Float32, u2 : Float32, ustride : Int32, uorder : Int32, v1 : Float32, v2 : Float32, vstride : Int32, vorder : Int32, points : Float32*) : Void

    fun glMapGrid1d(un : Int32, u1 : Float64, u2 : Float64) : Void

    fun glMapGrid1f(un : Int32, u1 : Float32, u2 : Float32) : Void

    fun glMapGrid2d(un : Int32, u1 : Float64, u2 : Float64, vn : Int32, v1 : Float64, v2 : Float64) : Void

    fun glMapGrid2f(un : Int32, u1 : Float32, u2 : Float32, vn : Int32, v1 : Float32, v2 : Float32) : Void

    fun glMaterialf(face : UInt32, pname : UInt32, param2 : Float32) : Void

    fun glMaterialfv(face : UInt32, pname : UInt32, params : Float32*) : Void

    fun glMateriali(face : UInt32, pname : UInt32, param2 : Int32) : Void

    fun glMaterialiv(face : UInt32, pname : UInt32, params : Int32*) : Void

    fun glMatrixMode(mode : UInt32) : Void

    fun glMultMatrixd(m : Float64*) : Void

    fun glMultMatrixf(m : Float32*) : Void

    fun glNewList(list : UInt32, mode : UInt32) : Void

    fun glNormal3b(nx : Int8, ny : Int8, nz : Int8) : Void

    fun glNormal3bv(v : Int8*) : Void

    fun glNormal3d(nx : Float64, ny : Float64, nz : Float64) : Void

    fun glNormal3dv(v : Float64*) : Void

    fun glNormal3f(nx : Float32, ny : Float32, nz : Float32) : Void

    fun glNormal3fv(v : Float32*) : Void

    fun glNormal3i(nx : Int32, ny : Int32, nz : Int32) : Void

    fun glNormal3iv(v : Int32*) : Void

    fun glNormal3s(nx : Int16, ny : Int16, nz : Int16) : Void

    fun glNormal3sv(v : Int16*) : Void

    fun glNormalPointer(type__ : UInt32, stride : Int32, pointer : Void*) : Void

    fun glOrtho(left : Float64, right : Float64, bottom : Float64, top : Float64, zNear : Float64, zFar : Float64) : Void

    fun glPassThrough(token : Float32) : Void

    fun glPixelMapfv(map : UInt32, mapsize : Int32, values : Float32*) : Void

    fun glPixelMapuiv(map : UInt32, mapsize : Int32, values : UInt32*) : Void

    fun glPixelMapusv(map : UInt32, mapsize : Int32, values : UInt16*) : Void

    fun glPixelStoref(pname : UInt32, param1 : Float32) : Void

    fun glPixelStorei(pname : UInt32, param1 : Int32) : Void

    fun glPixelTransferf(pname : UInt32, param1 : Float32) : Void

    fun glPixelTransferi(pname : UInt32, param1 : Int32) : Void

    fun glPixelZoom(xfactor : Float32, yfactor : Float32) : Void

    fun glPointSize(size : Float32) : Void

    fun glPolygonMode(face : UInt32, mode : UInt32) : Void

    fun glPolygonOffset(factor : Float32, units : Float32) : Void

    fun glPolygonStipple(mask : UInt8*) : Void

    fun glPopAttrib : Void

    fun glPopClientAttrib : Void

    fun glPopMatrix : Void

    fun glPopName : Void

    fun glPrioritizeTextures(n : Int32, textures : UInt32*, priorities : Float32*) : Void

    fun glPushAttrib(mask : UInt32) : Void

    fun glPushClientAttrib(mask : UInt32) : Void

    fun glPushMatrix : Void

    fun glPushName(name : UInt32) : Void

    fun glRasterPos2d(x : Float64, y : Float64) : Void

    fun glRasterPos2dv(v : Float64*) : Void

    fun glRasterPos2f(x : Float32, y : Float32) : Void

    fun glRasterPos2fv(v : Float32*) : Void

    fun glRasterPos2i(x : Int32, y : Int32) : Void

    fun glRasterPos2iv(v : Int32*) : Void

    fun glRasterPos2s(x : Int16, y : Int16) : Void

    fun glRasterPos2sv(v : Int16*) : Void

    fun glRasterPos3d(x : Float64, y : Float64, z : Float64) : Void

    fun glRasterPos3dv(v : Float64*) : Void

    fun glRasterPos3f(x : Float32, y : Float32, z : Float32) : Void

    fun glRasterPos3fv(v : Float32*) : Void

    fun glRasterPos3i(x : Int32, y : Int32, z : Int32) : Void

    fun glRasterPos3iv(v : Int32*) : Void

    fun glRasterPos3s(x : Int16, y : Int16, z : Int16) : Void

    fun glRasterPos3sv(v : Int16*) : Void

    fun glRasterPos4d(x : Float64, y : Float64, z : Float64, w : Float64) : Void

    fun glRasterPos4dv(v : Float64*) : Void

    fun glRasterPos4f(x : Float32, y : Float32, z : Float32, w : Float32) : Void

    fun glRasterPos4fv(v : Float32*) : Void

    fun glRasterPos4i(x : Int32, y : Int32, z : Int32, w : Int32) : Void

    fun glRasterPos4iv(v : Int32*) : Void

    fun glRasterPos4s(x : Int16, y : Int16, z : Int16, w : Int16) : Void

    fun glRasterPos4sv(v : Int16*) : Void

    fun glReadBuffer(mode : UInt32) : Void

    fun glReadPixels(x : Int32, y : Int32, width : Int32, height : Int32, format : UInt32, type__ : UInt32, pixels : Void*) : Void

    fun glRectd(x1 : Float64, y1 : Float64, x2 : Float64, y2 : Float64) : Void

    fun glRectdv(v1 : Float64*, v2 : Float64*) : Void

    fun glRectf(x1 : Float32, y1 : Float32, x2 : Float32, y2 : Float32) : Void

    fun glRectfv(v1 : Float32*, v2 : Float32*) : Void

    fun glRecti(x1 : Int32, y1 : Int32, x2 : Int32, y2 : Int32) : Void

    fun glRectiv(v1 : Int32*, v2 : Int32*) : Void

    fun glRects(x1 : Int16, y1 : Int16, x2 : Int16, y2 : Int16) : Void

    fun glRectsv(v1 : Int16*, v2 : Int16*) : Void

    fun glRenderMode(mode : UInt32) : Int32

    fun glRotated(angle : Float64, x : Float64, y : Float64, z : Float64) : Void

    fun glRotatef(angle : Float32, x : Float32, y : Float32, z : Float32) : Void

    fun glScaled(x : Float64, y : Float64, z : Float64) : Void

    fun glScalef(x : Float32, y : Float32, z : Float32) : Void

    fun glScissor(x : Int32, y : Int32, width : Int32, height : Int32) : Void

    fun glSelectBuffer(size : Int32, buffer : UInt32*) : Void

    fun glShadeModel(mode : UInt32) : Void

    fun glStencilFunc(func : UInt32, ref : Int32, mask : UInt32) : Void

    fun glStencilMask(mask : UInt32) : Void

    fun glStencilOp(fail : UInt32, zfail : UInt32, zpass : UInt32) : Void

    fun glTexCoord1d(s : Float64) : Void

    fun glTexCoord1dv(v : Float64*) : Void

    fun glTexCoord1f(s : Float32) : Void

    fun glTexCoord1fv(v : Float32*) : Void

    fun glTexCoord1i(s : Int32) : Void

    fun glTexCoord1iv(v : Int32*) : Void

    fun glTexCoord1s(s : Int16) : Void

    fun glTexCoord1sv(v : Int16*) : Void

    fun glTexCoord2d(s : Float64, t : Float64) : Void

    fun glTexCoord2dv(v : Float64*) : Void

    fun glTexCoord2f(s : Float32, t : Float32) : Void

    fun glTexCoord2fv(v : Float32*) : Void

    fun glTexCoord2i(s : Int32, t : Int32) : Void

    fun glTexCoord2iv(v : Int32*) : Void

    fun glTexCoord2s(s : Int16, t : Int16) : Void

    fun glTexCoord2sv(v : Int16*) : Void

    fun glTexCoord3d(s : Float64, t : Float64, r : Float64) : Void

    fun glTexCoord3dv(v : Float64*) : Void

    fun glTexCoord3f(s : Float32, t : Float32, r : Float32) : Void

    fun glTexCoord3fv(v : Float32*) : Void

    fun glTexCoord3i(s : Int32, t : Int32, r : Int32) : Void

    fun glTexCoord3iv(v : Int32*) : Void

    fun glTexCoord3s(s : Int16, t : Int16, r : Int16) : Void

    fun glTexCoord3sv(v : Int16*) : Void

    fun glTexCoord4d(s : Float64, t : Float64, r : Float64, q : Float64) : Void

    fun glTexCoord4dv(v : Float64*) : Void

    fun glTexCoord4f(s : Float32, t : Float32, r : Float32, q : Float32) : Void

    fun glTexCoord4fv(v : Float32*) : Void

    fun glTexCoord4i(s : Int32, t : Int32, r : Int32, q : Int32) : Void

    fun glTexCoord4iv(v : Int32*) : Void

    fun glTexCoord4s(s : Int16, t : Int16, r : Int16, q : Int16) : Void

    fun glTexCoord4sv(v : Int16*) : Void

    fun glTexCoordPointer(size : Int32, type__ : UInt32, stride : Int32, pointer : Void*) : Void

    fun glTexEnvf(target : UInt32, pname : UInt32, param2 : Float32) : Void

    fun glTexEnvfv(target : UInt32, pname : UInt32, params : Float32*) : Void

    fun glTexEnvi(target : UInt32, pname : UInt32, param2 : Int32) : Void

    fun glTexEnviv(target : UInt32, pname : UInt32, params : Int32*) : Void

    fun glTexGend(coord : UInt32, pname : UInt32, param2 : Float64) : Void

    fun glTexGendv(coord : UInt32, pname : UInt32, params : Float64*) : Void

    fun glTexGenf(coord : UInt32, pname : UInt32, param2 : Float32) : Void

    fun glTexGenfv(coord : UInt32, pname : UInt32, params : Float32*) : Void

    fun glTexGeni(coord : UInt32, pname : UInt32, param2 : Int32) : Void

    fun glTexGeniv(coord : UInt32, pname : UInt32, params : Int32*) : Void

    fun glTexImage1D(target : UInt32, level : Int32, internalformat : Int32, width : Int32, border : Int32, format : UInt32, type__ : UInt32, pixels : Void*) : Void

    fun glTexImage2D(target : UInt32, level : Int32, internalformat : Int32, width : Int32, height : Int32, border : Int32, format : UInt32, type__ : UInt32, pixels : Void*) : Void

    fun glTexParameterf(target : UInt32, pname : UInt32, param2 : Float32) : Void

    fun glTexParameterfv(target : UInt32, pname : UInt32, params : Float32*) : Void

    fun glTexParameteri(target : UInt32, pname : UInt32, param2 : Int32) : Void

    fun glTexParameteriv(target : UInt32, pname : UInt32, params : Int32*) : Void

    fun glTexSubImage1D(target : UInt32, level : Int32, xoffset : Int32, width : Int32, format : UInt32, type__ : UInt32, pixels : Void*) : Void

    fun glTexSubImage2D(target : UInt32, level : Int32, xoffset : Int32, yoffset : Int32, width : Int32, height : Int32, format : UInt32, type__ : UInt32, pixels : Void*) : Void

    fun glTranslated(x : Float64, y : Float64, z : Float64) : Void

    fun glTranslatef(x : Float32, y : Float32, z : Float32) : Void

    fun glVertex2d(x : Float64, y : Float64) : Void

    fun glVertex2dv(v : Float64*) : Void

    fun glVertex2f(x : Float32, y : Float32) : Void

    fun glVertex2fv(v : Float32*) : Void

    fun glVertex2i(x : Int32, y : Int32) : Void

    fun glVertex2iv(v : Int32*) : Void

    fun glVertex2s(x : Int16, y : Int16) : Void

    fun glVertex2sv(v : Int16*) : Void

    fun glVertex3d(x : Float64, y : Float64, z : Float64) : Void

    fun glVertex3dv(v : Float64*) : Void

    fun glVertex3f(x : Float32, y : Float32, z : Float32) : Void

    fun glVertex3fv(v : Float32*) : Void

    fun glVertex3i(x : Int32, y : Int32, z : Int32) : Void

    fun glVertex3iv(v : Int32*) : Void

    fun glVertex3s(x : Int16, y : Int16, z : Int16) : Void

    fun glVertex3sv(v : Int16*) : Void

    fun glVertex4d(x : Float64, y : Float64, z : Float64, w : Float64) : Void

    fun glVertex4dv(v : Float64*) : Void

    fun glVertex4f(x : Float32, y : Float32, z : Float32, w : Float32) : Void

    fun glVertex4fv(v : Float32*) : Void

    fun glVertex4i(x : Int32, y : Int32, z : Int32, w : Int32) : Void

    fun glVertex4iv(v : Int32*) : Void

    fun glVertex4s(x : Int16, y : Int16, z : Int16, w : Int16) : Void

    fun glVertex4sv(v : Int16*) : Void

    fun glVertexPointer(size : Int32, type__ : UInt32, stride : Int32, pointer : Void*) : Void

    fun glViewport(x : Int32, y : Int32, width : Int32, height : Int32) : Void

    fun gluErrorString(errCode : UInt32) : UInt8*

    fun gluErrorUnicodeStringEXT(errCode : UInt32) : Win32cr::Foundation::PWSTR

    fun gluGetString(name : UInt32) : UInt8*

    fun gluOrtho2D(left : Float64, right : Float64, bottom : Float64, top : Float64) : Void

    fun gluPerspective(fovy : Float64, aspect : Float64, zNear : Float64, zFar : Float64) : Void

    fun gluPickMatrix(x : Float64, y : Float64, width : Float64, height : Float64, viewport : Int32*) : Void

    fun gluLookAt(eyex : Float64, eyey : Float64, eyez : Float64, centerx : Float64, centery : Float64, centerz : Float64, upx : Float64, upy : Float64, upz : Float64) : Void

    fun gluProject(objx : Float64, objy : Float64, objz : Float64, modelMatrix : Float64*, projMatrix : Float64*, viewport : Int32*, winx : Float64*, winy : Float64*, winz : Float64*) : Int32

    fun gluUnProject(winx : Float64, winy : Float64, winz : Float64, modelMatrix : Float64*, projMatrix : Float64*, viewport : Int32*, objx : Float64*, objy : Float64*, objz : Float64*) : Int32

    fun gluScaleImage(format : UInt32, widthin : Int32, heightin : Int32, typein : UInt32, datain : Void*, widthout : Int32, heightout : Int32, typeout : UInt32, dataout : Void*) : Int32

    fun gluBuild1DMipmaps(target : UInt32, components : Int32, width : Int32, format : UInt32, type__ : UInt32, data : Void*) : Int32

    fun gluBuild2DMipmaps(target : UInt32, components : Int32, width : Int32, height : Int32, format : UInt32, type__ : UInt32, data : Void*) : Int32

    fun gluNewQuadric : Win32cr::Graphics::OpenGL::GLUquadric*

    fun gluDeleteQuadric(state : Win32cr::Graphics::OpenGL::GLUquadric*) : Void

    fun gluQuadricNormals(quadObject : Win32cr::Graphics::OpenGL::GLUquadric*, normals : UInt32) : Void

    fun gluQuadricTexture(quadObject : Win32cr::Graphics::OpenGL::GLUquadric*, textureCoords : UInt8) : Void

    fun gluQuadricOrientation(quadObject : Win32cr::Graphics::OpenGL::GLUquadric*, orientation : UInt32) : Void

    fun gluQuadricDrawStyle(quadObject : Win32cr::Graphics::OpenGL::GLUquadric*, drawStyle : UInt32) : Void

    fun gluCylinder(qobj : Win32cr::Graphics::OpenGL::GLUquadric*, baseRadius : Float64, topRadius : Float64, height : Float64, slices : Int32, stacks : Int32) : Void

    fun gluDisk(qobj : Win32cr::Graphics::OpenGL::GLUquadric*, innerRadius : Float64, outerRadius : Float64, slices : Int32, loops : Int32) : Void

    fun gluPartialDisk(qobj : Win32cr::Graphics::OpenGL::GLUquadric*, innerRadius : Float64, outerRadius : Float64, slices : Int32, loops : Int32, startAngle : Float64, sweepAngle : Float64) : Void

    fun gluSphere(qobj : Win32cr::Graphics::OpenGL::GLUquadric*, radius : Float64, slices : Int32, stacks : Int32) : Void

    fun gluQuadricCallback(qobj : Win32cr::Graphics::OpenGL::GLUquadric*, which : UInt32, fn : LibC::IntPtrT) : Void

    fun gluNewTess : Win32cr::Graphics::OpenGL::GLUtesselator*

    fun gluDeleteTess(tess : Win32cr::Graphics::OpenGL::GLUtesselator*) : Void

    fun gluTessBeginPolygon(tess : Win32cr::Graphics::OpenGL::GLUtesselator*, polygon_data : Void*) : Void

    fun gluTessBeginContour(tess : Win32cr::Graphics::OpenGL::GLUtesselator*) : Void

    fun gluTessVertex(tess : Win32cr::Graphics::OpenGL::GLUtesselator*, coords : Float64*, data : Void*) : Void

    fun gluTessEndContour(tess : Win32cr::Graphics::OpenGL::GLUtesselator*) : Void

    fun gluTessEndPolygon(tess : Win32cr::Graphics::OpenGL::GLUtesselator*) : Void

    fun gluTessProperty(tess : Win32cr::Graphics::OpenGL::GLUtesselator*, which : UInt32, value : Float64) : Void

    fun gluTessNormal(tess : Win32cr::Graphics::OpenGL::GLUtesselator*, x : Float64, y : Float64, z : Float64) : Void

    fun gluTessCallback(tess : Win32cr::Graphics::OpenGL::GLUtesselator*, which : UInt32, fn : LibC::IntPtrT) : Void

    fun gluGetTessProperty(tess : Win32cr::Graphics::OpenGL::GLUtesselator*, which : UInt32, value : Float64*) : Void

    fun gluNewNurbsRenderer : Win32cr::Graphics::OpenGL::GLUnurbs*

    fun gluDeleteNurbsRenderer(nobj : Win32cr::Graphics::OpenGL::GLUnurbs*) : Void

    fun gluBeginSurface(nobj : Win32cr::Graphics::OpenGL::GLUnurbs*) : Void

    fun gluBeginCurve(nobj : Win32cr::Graphics::OpenGL::GLUnurbs*) : Void

    fun gluEndCurve(nobj : Win32cr::Graphics::OpenGL::GLUnurbs*) : Void

    fun gluEndSurface(nobj : Win32cr::Graphics::OpenGL::GLUnurbs*) : Void

    fun gluBeginTrim(nobj : Win32cr::Graphics::OpenGL::GLUnurbs*) : Void

    fun gluEndTrim(nobj : Win32cr::Graphics::OpenGL::GLUnurbs*) : Void

    fun gluPwlCurve(nobj : Win32cr::Graphics::OpenGL::GLUnurbs*, count : Int32, array : Float32*, stride : Int32, type__ : UInt32) : Void

    fun gluNurbsCurve(nobj : Win32cr::Graphics::OpenGL::GLUnurbs*, nknots : Int32, knot : Float32*, stride : Int32, ctlarray : Float32*, order : Int32, type__ : UInt32) : Void

    fun gluNurbsSurface(nobj : Win32cr::Graphics::OpenGL::GLUnurbs*, sknot_count : Int32, sknot : Float32*, tknot_count : Int32, tknot : Float32*, s_stride : Int32, t_stride : Int32, ctlarray : Float32*, sorder : Int32, torder : Int32, type__ : UInt32) : Void

    fun gluLoadSamplingMatrices(nobj : Win32cr::Graphics::OpenGL::GLUnurbs*, modelMatrix : Float32*, projMatrix : Float32*, viewport : Int32*) : Void

    fun gluNurbsProperty(nobj : Win32cr::Graphics::OpenGL::GLUnurbs*, property : UInt32, value : Float32) : Void

    fun gluGetNurbsProperty(nobj : Win32cr::Graphics::OpenGL::GLUnurbs*, property : UInt32, value : Float32*) : Void

    fun gluNurbsCallback(nobj : Win32cr::Graphics::OpenGL::GLUnurbs*, which : UInt32, fn : LibC::IntPtrT) : Void

    fun gluBeginPolygon(tess : Win32cr::Graphics::OpenGL::GLUtesselator*) : Void

    fun gluNextContour(tess : Win32cr::Graphics::OpenGL::GLUtesselator*, type__ : UInt32) : Void

    fun gluEndPolygon(tess : Win32cr::Graphics::OpenGL::GLUtesselator*) : Void

  end
end