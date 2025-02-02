require "./gdi.cr"
require "./../foundation.cr"

module Win32cr::Graphics::OpenGL
  extend self
  alias HGLRC = LibC::IntPtrT
  alias PFNGLARRAYELEMENTEXTPROC = Proc(Int32, Void)

  alias PFNGLDRAWARRAYSEXTPROC = Proc(UInt32, Int32, Int32, Void)

  alias PFNGLVERTEXPOINTEREXTPROC = Proc(Int32, UInt32, Int32, Int32, Void*, Void)

  alias PFNGLNORMALPOINTEREXTPROC = Proc(UInt32, Int32, Int32, Void*, Void)

  alias PFNGLCOLORPOINTEREXTPROC = Proc(Int32, UInt32, Int32, Int32, Void*, Void)

  alias PFNGLINDEXPOINTEREXTPROC = Proc(UInt32, Int32, Int32, Void*, Void)

  alias PFNGLTEXCOORDPOINTEREXTPROC = Proc(Int32, UInt32, Int32, Int32, Void*, Void)

  alias PFNGLEDGEFLAGPOINTEREXTPROC = Proc(Int32, Int32, UInt8*, Void)

  alias PFNGLGETPOINTERVEXTPROC = Proc(UInt32, Void**, Void)

  alias PFNGLARRAYELEMENTARRAYEXTPROC = Proc(UInt32, Int32, Void*, Void)

  alias PFNGLDRAWRANGEELEMENTSWINPROC = Proc(UInt32, UInt32, UInt32, Int32, UInt32, Void*, Void)

  alias PFNGLADDSWAPHINTRECTWINPROC = Proc(Int32, Int32, Int32, Int32, Void)

  alias PFNGLCOLORTABLEEXTPROC = Proc(UInt32, UInt32, Int32, UInt32, UInt32, Void*, Void)

  alias PFNGLCOLORSUBTABLEEXTPROC = Proc(UInt32, Int32, Int32, UInt32, UInt32, Void*, Void)

  alias PFNGLGETCOLORTABLEEXTPROC = Proc(UInt32, UInt32, UInt32, Void*, Void)

  alias PFNGLGETCOLORTABLEPARAMETERIVEXTPROC = Proc(UInt32, UInt32, Int32*, Void)

  alias PFNGLGETCOLORTABLEPARAMETERFVEXTPROC = Proc(UInt32, UInt32, Float32*, Void)

  alias GLUquadricErrorProc = Proc(UInt32, Void)

  alias GLUtessBeginProc = Proc(UInt32, Void)

  alias GLUtessEdgeFlagProc = Proc(UInt8, Void)

  alias GLUtessVertexProc = Proc(Void*, Void)

  alias GLUtessEndProc = Proc(Void)

  alias GLUtessErrorProc = Proc(UInt32, Void)

  alias GLUtessCombineProc = Proc(Float64*, Void**, Float32*, Void**, Void)

  alias GLUtessBeginDataProc = Proc(UInt32, Void*, Void)

  alias GLUtessEdgeFlagDataProc = Proc(UInt8, Void*, Void)

  alias GLUtessVertexDataProc = Proc(Void*, Void*, Void)

  alias GLUtessEndDataProc = Proc(Void*, Void)

  alias GLUtessErrorDataProc = Proc(UInt32, Void*, Void)

  alias GLUtessCombineDataProc = Proc(Float64*, Void**, Float32*, Void**, Void*, Void)

  alias GLUnurbsErrorProc = Proc(UInt32, Void)

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
  struct PIXELFORMATDESCRIPTOR
    property nSize : UInt16
    property nVersion : UInt16
    property dwFlags : Win32cr::Graphics::OpenGL::PFD_FLAGS
    property iPixelType : Win32cr::Graphics::OpenGL::PFD_PIXEL_TYPE
    property cColorBits : UInt8
    property cRedBits : UInt8
    property cRedShift : UInt8
    property cGreenBits : UInt8
    property cGreenShift : UInt8
    property cBlueBits : UInt8
    property cBlueShift : UInt8
    property cAlphaBits : UInt8
    property cAlphaShift : UInt8
    property cAccumBits : UInt8
    property cAccumRedBits : UInt8
    property cAccumGreenBits : UInt8
    property cAccumBlueBits : UInt8
    property cAccumAlphaBits : UInt8
    property cDepthBits : UInt8
    property cStencilBits : UInt8
    property cAuxBuffers : UInt8
    property iLayerType : Win32cr::Graphics::OpenGL::PFD_LAYER_TYPE
    property bReserved : UInt8
    property dwLayerMask : UInt32
    property dwVisibleMask : UInt32
    property dwDamageMask : UInt32
    def initialize(@nSize : UInt16, @nVersion : UInt16, @dwFlags : Win32cr::Graphics::OpenGL::PFD_FLAGS, @iPixelType : Win32cr::Graphics::OpenGL::PFD_PIXEL_TYPE, @cColorBits : UInt8, @cRedBits : UInt8, @cRedShift : UInt8, @cGreenBits : UInt8, @cGreenShift : UInt8, @cBlueBits : UInt8, @cBlueShift : UInt8, @cAlphaBits : UInt8, @cAlphaShift : UInt8, @cAccumBits : UInt8, @cAccumRedBits : UInt8, @cAccumGreenBits : UInt8, @cAccumBlueBits : UInt8, @cAccumAlphaBits : UInt8, @cDepthBits : UInt8, @cStencilBits : UInt8, @cAuxBuffers : UInt8, @iLayerType : Win32cr::Graphics::OpenGL::PFD_LAYER_TYPE, @bReserved : UInt8, @dwLayerMask : UInt32, @dwVisibleMask : UInt32, @dwDamageMask : UInt32)
    end
  end

  @[Extern]
  struct EMRPIXELFORMAT
    property emr : Win32cr::Graphics::Gdi::EMR
    property pfd : Win32cr::Graphics::OpenGL::PIXELFORMATDESCRIPTOR
    def initialize(@emr : Win32cr::Graphics::Gdi::EMR, @pfd : Win32cr::Graphics::OpenGL::PIXELFORMATDESCRIPTOR)
    end
  end

  @[Extern]
  struct POINTFLOAT
    property x : Float32
    property y : Float32
    def initialize(@x : Float32, @y : Float32)
    end
  end

  @[Extern]
  struct GLYPHMETRICSFLOAT
    property gmfBlackBoxX : Float32
    property gmfBlackBoxY : Float32
    property gmfptGlyphOrigin : Win32cr::Graphics::OpenGL::POINTFLOAT
    property gmfCellIncX : Float32
    property gmfCellIncY : Float32
    def initialize(@gmfBlackBoxX : Float32, @gmfBlackBoxY : Float32, @gmfptGlyphOrigin : Win32cr::Graphics::OpenGL::POINTFLOAT, @gmfCellIncX : Float32, @gmfCellIncY : Float32)
    end
  end

  @[Extern]
  struct LAYERPLANEDESCRIPTOR
    property nSize : UInt16
    property nVersion : UInt16
    property dwFlags : UInt32
    property iPixelType : UInt8
    property cColorBits : UInt8
    property cRedBits : UInt8
    property cRedShift : UInt8
    property cGreenBits : UInt8
    property cGreenShift : UInt8
    property cBlueBits : UInt8
    property cBlueShift : UInt8
    property cAlphaBits : UInt8
    property cAlphaShift : UInt8
    property cAccumBits : UInt8
    property cAccumRedBits : UInt8
    property cAccumGreenBits : UInt8
    property cAccumBlueBits : UInt8
    property cAccumAlphaBits : UInt8
    property cDepthBits : UInt8
    property cStencilBits : UInt8
    property cAuxBuffers : UInt8
    property iLayerPlane : UInt8
    property bReserved : UInt8
    property crTransparent : UInt32
    def initialize(@nSize : UInt16, @nVersion : UInt16, @dwFlags : UInt32, @iPixelType : UInt8, @cColorBits : UInt8, @cRedBits : UInt8, @cRedShift : UInt8, @cGreenBits : UInt8, @cGreenShift : UInt8, @cBlueBits : UInt8, @cBlueShift : UInt8, @cAlphaBits : UInt8, @cAlphaShift : UInt8, @cAccumBits : UInt8, @cAccumRedBits : UInt8, @cAccumGreenBits : UInt8, @cAccumBlueBits : UInt8, @cAccumAlphaBits : UInt8, @cDepthBits : UInt8, @cStencilBits : UInt8, @cAuxBuffers : UInt8, @iLayerPlane : UInt8, @bReserved : UInt8, @crTransparent : UInt32)
    end
  end

  @[Extern]
  struct GLUnurbs
    def initialize()
    end
  end

  @[Extern]
  struct GLUquadric
    def initialize()
    end
  end

  @[Extern]
  struct GLUtesselator
    def initialize()
    end
  end

  def choosePixelFormat(hdc : Win32cr::Graphics::Gdi::HDC, ppfd : Win32cr::Graphics::OpenGL::PIXELFORMATDESCRIPTOR*) : Int32
    C.ChoosePixelFormat(hdc, ppfd)
  end

  def describePixelFormat(hdc : Win32cr::Graphics::Gdi::HDC, iPixelFormat : Win32cr::Graphics::OpenGL::PFD_PIXEL_TYPE, nBytes : UInt32, ppfd : Win32cr::Graphics::OpenGL::PIXELFORMATDESCRIPTOR*) : Int32
    C.DescribePixelFormat(hdc, iPixelFormat, nBytes, ppfd)
  end

  def getPixelFormat(hdc : Win32cr::Graphics::Gdi::HDC) : Int32
    C.GetPixelFormat(hdc)
  end

  def setPixelFormat(hdc : Win32cr::Graphics::Gdi::HDC, format : Int32, ppfd : Win32cr::Graphics::OpenGL::PIXELFORMATDESCRIPTOR*) : Win32cr::Foundation::BOOL
    C.SetPixelFormat(hdc, format, ppfd)
  end

  def getEnhMetaFilePixelFormat(hemf : Win32cr::Graphics::Gdi::HENHMETAFILE, cbBuffer : UInt32, ppfd : Win32cr::Graphics::OpenGL::PIXELFORMATDESCRIPTOR*) : UInt32
    C.GetEnhMetaFilePixelFormat(hemf, cbBuffer, ppfd)
  end

  def wglCopyContext(param0 : Win32cr::Graphics::OpenGL::HGLRC, param1 : Win32cr::Graphics::OpenGL::HGLRC, param2 : UInt32) : Win32cr::Foundation::BOOL
    C.wglCopyContext(param0, param1, param2)
  end

  def wglCreateContext(param0 : Win32cr::Graphics::Gdi::HDC) : Win32cr::Graphics::OpenGL::HGLRC
    C.wglCreateContext(param0)
  end

  def wglCreateLayerContext(param0 : Win32cr::Graphics::Gdi::HDC, param1 : Int32) : Win32cr::Graphics::OpenGL::HGLRC
    C.wglCreateLayerContext(param0, param1)
  end

  def wglDeleteContext(param0 : Win32cr::Graphics::OpenGL::HGLRC) : Win32cr::Foundation::BOOL
    C.wglDeleteContext(param0)
  end

  def wglGetCurrentContext : Win32cr::Graphics::OpenGL::HGLRC
    C.wglGetCurrentContext
  end

  def wglGetCurrentDC : Win32cr::Graphics::Gdi::HDC
    C.wglGetCurrentDC
  end

  def wglGetProcAddress(param0 : Win32cr::Foundation::PSTR) : Win32cr::Foundation::PROC
    C.wglGetProcAddress(param0)
  end

  def wglMakeCurrent(param0 : Win32cr::Graphics::Gdi::HDC, param1 : Win32cr::Graphics::OpenGL::HGLRC) : Win32cr::Foundation::BOOL
    C.wglMakeCurrent(param0, param1)
  end

  def wglShareLists(param0 : Win32cr::Graphics::OpenGL::HGLRC, param1 : Win32cr::Graphics::OpenGL::HGLRC) : Win32cr::Foundation::BOOL
    C.wglShareLists(param0, param1)
  end

  def wglUseFontBitmapsA(param0 : Win32cr::Graphics::Gdi::HDC, param1 : UInt32, param2 : UInt32, param3 : UInt32) : Win32cr::Foundation::BOOL
    C.wglUseFontBitmapsA(param0, param1, param2, param3)
  end

  def wglUseFontBitmapsW(param0 : Win32cr::Graphics::Gdi::HDC, param1 : UInt32, param2 : UInt32, param3 : UInt32) : Win32cr::Foundation::BOOL
    C.wglUseFontBitmapsW(param0, param1, param2, param3)
  end

  def swapBuffers(param0 : Win32cr::Graphics::Gdi::HDC) : Win32cr::Foundation::BOOL
    C.SwapBuffers(param0)
  end

  def wglUseFontOutlinesA(param0 : Win32cr::Graphics::Gdi::HDC, param1 : UInt32, param2 : UInt32, param3 : UInt32, param4 : Float32, param5 : Float32, param6 : Int32, param7 : Win32cr::Graphics::OpenGL::GLYPHMETRICSFLOAT*) : Win32cr::Foundation::BOOL
    C.wglUseFontOutlinesA(param0, param1, param2, param3, param4, param5, param6, param7)
  end

  def wglUseFontOutlinesW(param0 : Win32cr::Graphics::Gdi::HDC, param1 : UInt32, param2 : UInt32, param3 : UInt32, param4 : Float32, param5 : Float32, param6 : Int32, param7 : Win32cr::Graphics::OpenGL::GLYPHMETRICSFLOAT*) : Win32cr::Foundation::BOOL
    C.wglUseFontOutlinesW(param0, param1, param2, param3, param4, param5, param6, param7)
  end

  def wglDescribeLayerPlane(param0 : Win32cr::Graphics::Gdi::HDC, param1 : Int32, param2 : Int32, param3 : UInt32, param4 : Win32cr::Graphics::OpenGL::LAYERPLANEDESCRIPTOR*) : Win32cr::Foundation::BOOL
    C.wglDescribeLayerPlane(param0, param1, param2, param3, param4)
  end

  def wglSetLayerPaletteEntries(param0 : Win32cr::Graphics::Gdi::HDC, param1 : Int32, param2 : Int32, param3 : Int32, param4 : UInt32*) : Int32
    C.wglSetLayerPaletteEntries(param0, param1, param2, param3, param4)
  end

  def wglGetLayerPaletteEntries(param0 : Win32cr::Graphics::Gdi::HDC, param1 : Int32, param2 : Int32, param3 : Int32, param4 : UInt32*) : Int32
    C.wglGetLayerPaletteEntries(param0, param1, param2, param3, param4)
  end

  def wglRealizeLayerPalette(param0 : Win32cr::Graphics::Gdi::HDC, param1 : Int32, param2 : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    C.wglRealizeLayerPalette(param0, param1, param2)
  end

  def wglSwapLayerBuffers(param0 : Win32cr::Graphics::Gdi::HDC, param1 : UInt32) : Win32cr::Foundation::BOOL
    C.wglSwapLayerBuffers(param0, param1)
  end

  def glAccum(op : UInt32, value : Float32) : Void
    C.glAccum(op, value)
  end

  def glAlphaFunc(func : UInt32, ref : Float32) : Void
    C.glAlphaFunc(func, ref)
  end

  def glAreTexturesResident(n : Int32, textures : UInt32*, residences : UInt8*) : UInt8
    C.glAreTexturesResident(n, textures, residences)
  end

  def glArrayElement(i : Int32) : Void
    C.glArrayElement(i)
  end

  def glBegin(mode : UInt32) : Void
    C.glBegin(mode)
  end

  def glBindTexture(target : UInt32, texture : UInt32) : Void
    C.glBindTexture(target, texture)
  end

  def glBitmap(width : Int32, height : Int32, xorig : Float32, yorig : Float32, xmove : Float32, ymove : Float32, bitmap : UInt8*) : Void
    C.glBitmap(width, height, xorig, yorig, xmove, ymove, bitmap)
  end

  def glBlendFunc(sfactor : UInt32, dfactor : UInt32) : Void
    C.glBlendFunc(sfactor, dfactor)
  end

  def glCallList(list : UInt32) : Void
    C.glCallList(list)
  end

  def glCallLists(n : Int32, type__ : UInt32, lists : Void*) : Void
    C.glCallLists(n, type__, lists)
  end

  def glClear(mask : UInt32) : Void
    C.glClear(mask)
  end

  def glClearAccum(red : Float32, green : Float32, blue : Float32, alpha : Float32) : Void
    C.glClearAccum(red, green, blue, alpha)
  end

  def glClearColor(red : Float32, green : Float32, blue : Float32, alpha : Float32) : Void
    C.glClearColor(red, green, blue, alpha)
  end

  def glClearDepth(depth : Float64) : Void
    C.glClearDepth(depth)
  end

  def glClearIndex(c : Float32) : Void
    C.glClearIndex(c)
  end

  def glClearStencil(s : Int32) : Void
    C.glClearStencil(s)
  end

  def glClipPlane(plane : UInt32, equation : Float64*) : Void
    C.glClipPlane(plane, equation)
  end

  def glColor3b(red : Int8, green : Int8, blue : Int8) : Void
    C.glColor3b(red, green, blue)
  end

  def glColor3bv(v : Int8*) : Void
    C.glColor3bv(v)
  end

  def glColor3d(red : Float64, green : Float64, blue : Float64) : Void
    C.glColor3d(red, green, blue)
  end

  def glColor3dv(v : Float64*) : Void
    C.glColor3dv(v)
  end

  def glColor3f(red : Float32, green : Float32, blue : Float32) : Void
    C.glColor3f(red, green, blue)
  end

  def glColor3fv(v : Float32*) : Void
    C.glColor3fv(v)
  end

  def glColor3i(red : Int32, green : Int32, blue : Int32) : Void
    C.glColor3i(red, green, blue)
  end

  def glColor3iv(v : Int32*) : Void
    C.glColor3iv(v)
  end

  def glColor3s(red : Int16, green : Int16, blue : Int16) : Void
    C.glColor3s(red, green, blue)
  end

  def glColor3sv(v : Int16*) : Void
    C.glColor3sv(v)
  end

  def glColor3ub(red : UInt8, green : UInt8, blue : UInt8) : Void
    C.glColor3ub(red, green, blue)
  end

  def glColor3ubv(v : UInt8*) : Void
    C.glColor3ubv(v)
  end

  def glColor3ui(red : UInt32, green : UInt32, blue : UInt32) : Void
    C.glColor3ui(red, green, blue)
  end

  def glColor3uiv(v : UInt32*) : Void
    C.glColor3uiv(v)
  end

  def glColor3us(red : UInt16, green : UInt16, blue : UInt16) : Void
    C.glColor3us(red, green, blue)
  end

  def glColor3usv(v : UInt16*) : Void
    C.glColor3usv(v)
  end

  def glColor4b(red : Int8, green : Int8, blue : Int8, alpha : Int8) : Void
    C.glColor4b(red, green, blue, alpha)
  end

  def glColor4bv(v : Int8*) : Void
    C.glColor4bv(v)
  end

  def glColor4d(red : Float64, green : Float64, blue : Float64, alpha : Float64) : Void
    C.glColor4d(red, green, blue, alpha)
  end

  def glColor4dv(v : Float64*) : Void
    C.glColor4dv(v)
  end

  def glColor4f(red : Float32, green : Float32, blue : Float32, alpha : Float32) : Void
    C.glColor4f(red, green, blue, alpha)
  end

  def glColor4fv(v : Float32*) : Void
    C.glColor4fv(v)
  end

  def glColor4i(red : Int32, green : Int32, blue : Int32, alpha : Int32) : Void
    C.glColor4i(red, green, blue, alpha)
  end

  def glColor4iv(v : Int32*) : Void
    C.glColor4iv(v)
  end

  def glColor4s(red : Int16, green : Int16, blue : Int16, alpha : Int16) : Void
    C.glColor4s(red, green, blue, alpha)
  end

  def glColor4sv(v : Int16*) : Void
    C.glColor4sv(v)
  end

  def glColor4ub(red : UInt8, green : UInt8, blue : UInt8, alpha : UInt8) : Void
    C.glColor4ub(red, green, blue, alpha)
  end

  def glColor4ubv(v : UInt8*) : Void
    C.glColor4ubv(v)
  end

  def glColor4ui(red : UInt32, green : UInt32, blue : UInt32, alpha : UInt32) : Void
    C.glColor4ui(red, green, blue, alpha)
  end

  def glColor4uiv(v : UInt32*) : Void
    C.glColor4uiv(v)
  end

  def glColor4us(red : UInt16, green : UInt16, blue : UInt16, alpha : UInt16) : Void
    C.glColor4us(red, green, blue, alpha)
  end

  def glColor4usv(v : UInt16*) : Void
    C.glColor4usv(v)
  end

  def glColorMask(red : UInt8, green : UInt8, blue : UInt8, alpha : UInt8) : Void
    C.glColorMask(red, green, blue, alpha)
  end

  def glColorMaterial(face : UInt32, mode : UInt32) : Void
    C.glColorMaterial(face, mode)
  end

  def glColorPointer(size : Int32, type__ : UInt32, stride : Int32, pointer : Void*) : Void
    C.glColorPointer(size, type__, stride, pointer)
  end

  def glCopyPixels(x : Int32, y : Int32, width : Int32, height : Int32, type__ : UInt32) : Void
    C.glCopyPixels(x, y, width, height, type__)
  end

  def glCopyTexImage1D(target : UInt32, level : Int32, internalFormat : UInt32, x : Int32, y : Int32, width : Int32, border : Int32) : Void
    C.glCopyTexImage1D(target, level, internalFormat, x, y, width, border)
  end

  def glCopyTexImage2D(target : UInt32, level : Int32, internalFormat : UInt32, x : Int32, y : Int32, width : Int32, height : Int32, border : Int32) : Void
    C.glCopyTexImage2D(target, level, internalFormat, x, y, width, height, border)
  end

  def glCopyTexSubImage1D(target : UInt32, level : Int32, xoffset : Int32, x : Int32, y : Int32, width : Int32) : Void
    C.glCopyTexSubImage1D(target, level, xoffset, x, y, width)
  end

  def glCopyTexSubImage2D(target : UInt32, level : Int32, xoffset : Int32, yoffset : Int32, x : Int32, y : Int32, width : Int32, height : Int32) : Void
    C.glCopyTexSubImage2D(target, level, xoffset, yoffset, x, y, width, height)
  end

  def glCullFace(mode : UInt32) : Void
    C.glCullFace(mode)
  end

  def glDeleteLists(list : UInt32, range : Int32) : Void
    C.glDeleteLists(list, range)
  end

  def glDeleteTextures(n : Int32, textures : UInt32*) : Void
    C.glDeleteTextures(n, textures)
  end

  def glDepthFunc(func : UInt32) : Void
    C.glDepthFunc(func)
  end

  def glDepthMask(flag : UInt8) : Void
    C.glDepthMask(flag)
  end

  def glDepthRange(zNear : Float64, zFar : Float64) : Void
    C.glDepthRange(zNear, zFar)
  end

  def glDisable(cap : UInt32) : Void
    C.glDisable(cap)
  end

  def glDisableClientState(array : UInt32) : Void
    C.glDisableClientState(array)
  end

  def glDrawArrays(mode : UInt32, first : Int32, count : Int32) : Void
    C.glDrawArrays(mode, first, count)
  end

  def glDrawBuffer(mode : UInt32) : Void
    C.glDrawBuffer(mode)
  end

  def glDrawElements(mode : UInt32, count : Int32, type__ : UInt32, indices : Void*) : Void
    C.glDrawElements(mode, count, type__, indices)
  end

  def glDrawPixels(width : Int32, height : Int32, format : UInt32, type__ : UInt32, pixels : Void*) : Void
    C.glDrawPixels(width, height, format, type__, pixels)
  end

  def glEdgeFlag(flag : UInt8) : Void
    C.glEdgeFlag(flag)
  end

  def glEdgeFlagPointer(stride : Int32, pointer : Void*) : Void
    C.glEdgeFlagPointer(stride, pointer)
  end

  def glEdgeFlagv(flag : UInt8*) : Void
    C.glEdgeFlagv(flag)
  end

  def glEnable(cap : UInt32) : Void
    C.glEnable(cap)
  end

  def glEnableClientState(array : UInt32) : Void
    C.glEnableClientState(array)
  end

  def glEnd : Void
    C.glEnd
  end

  def glEndList : Void
    C.glEndList
  end

  def glEvalCoord1d(u : Float64) : Void
    C.glEvalCoord1d(u)
  end

  def glEvalCoord1dv(u : Float64*) : Void
    C.glEvalCoord1dv(u)
  end

  def glEvalCoord1f(u : Float32) : Void
    C.glEvalCoord1f(u)
  end

  def glEvalCoord1fv(u : Float32*) : Void
    C.glEvalCoord1fv(u)
  end

  def glEvalCoord2d(u : Float64, v : Float64) : Void
    C.glEvalCoord2d(u, v)
  end

  def glEvalCoord2dv(u : Float64*) : Void
    C.glEvalCoord2dv(u)
  end

  def glEvalCoord2f(u : Float32, v : Float32) : Void
    C.glEvalCoord2f(u, v)
  end

  def glEvalCoord2fv(u : Float32*) : Void
    C.glEvalCoord2fv(u)
  end

  def glEvalMesh1(mode : UInt32, i1 : Int32, i2 : Int32) : Void
    C.glEvalMesh1(mode, i1, i2)
  end

  def glEvalMesh2(mode : UInt32, i1 : Int32, i2 : Int32, j1 : Int32, j2 : Int32) : Void
    C.glEvalMesh2(mode, i1, i2, j1, j2)
  end

  def glEvalPoint1(i : Int32) : Void
    C.glEvalPoint1(i)
  end

  def glEvalPoint2(i : Int32, j : Int32) : Void
    C.glEvalPoint2(i, j)
  end

  def glFeedbackBuffer(size : Int32, type__ : UInt32, buffer : Float32*) : Void
    C.glFeedbackBuffer(size, type__, buffer)
  end

  def glFinish : Void
    C.glFinish
  end

  def glFlush : Void
    C.glFlush
  end

  def glFogf(pname : UInt32, param1 : Float32) : Void
    C.glFogf(pname, param1)
  end

  def glFogfv(pname : UInt32, params : Float32*) : Void
    C.glFogfv(pname, params)
  end

  def glFogi(pname : UInt32, param1 : Int32) : Void
    C.glFogi(pname, param1)
  end

  def glFogiv(pname : UInt32, params : Int32*) : Void
    C.glFogiv(pname, params)
  end

  def glFrontFace(mode : UInt32) : Void
    C.glFrontFace(mode)
  end

  def glFrustum(left : Float64, right : Float64, bottom : Float64, top : Float64, zNear : Float64, zFar : Float64) : Void
    C.glFrustum(left, right, bottom, top, zNear, zFar)
  end

  def glGenLists(range : Int32) : UInt32
    C.glGenLists(range)
  end

  def glGenTextures(n : Int32, textures : UInt32*) : Void
    C.glGenTextures(n, textures)
  end

  def glGetBooleanv(pname : UInt32, params : UInt8*) : Void
    C.glGetBooleanv(pname, params)
  end

  def glGetClipPlane(plane : UInt32, equation : Float64*) : Void
    C.glGetClipPlane(plane, equation)
  end

  def glGetDoublev(pname : UInt32, params : Float64*) : Void
    C.glGetDoublev(pname, params)
  end

  def glGetError : UInt32
    C.glGetError
  end

  def glGetFloatv(pname : UInt32, params : Float32*) : Void
    C.glGetFloatv(pname, params)
  end

  def glGetIntegerv(pname : UInt32, params : Int32*) : Void
    C.glGetIntegerv(pname, params)
  end

  def glGetLightfv(light : UInt32, pname : UInt32, params : Float32*) : Void
    C.glGetLightfv(light, pname, params)
  end

  def glGetLightiv(light : UInt32, pname : UInt32, params : Int32*) : Void
    C.glGetLightiv(light, pname, params)
  end

  def glGetMapdv(target : UInt32, query : UInt32, v : Float64*) : Void
    C.glGetMapdv(target, query, v)
  end

  def glGetMapfv(target : UInt32, query : UInt32, v : Float32*) : Void
    C.glGetMapfv(target, query, v)
  end

  def glGetMapiv(target : UInt32, query : UInt32, v : Int32*) : Void
    C.glGetMapiv(target, query, v)
  end

  def glGetMaterialfv(face : UInt32, pname : UInt32, params : Float32*) : Void
    C.glGetMaterialfv(face, pname, params)
  end

  def glGetMaterialiv(face : UInt32, pname : UInt32, params : Int32*) : Void
    C.glGetMaterialiv(face, pname, params)
  end

  def glGetPixelMapfv(map : UInt32, values : Float32*) : Void
    C.glGetPixelMapfv(map, values)
  end

  def glGetPixelMapuiv(map : UInt32, values : UInt32*) : Void
    C.glGetPixelMapuiv(map, values)
  end

  def glGetPixelMapusv(map : UInt32, values : UInt16*) : Void
    C.glGetPixelMapusv(map, values)
  end

  def glGetPointerv(pname : UInt32, params : Void**) : Void
    C.glGetPointerv(pname, params)
  end

  def glGetPolygonStipple(mask : UInt8*) : Void
    C.glGetPolygonStipple(mask)
  end

  def glGetString(name : UInt32) : UInt8*
    C.glGetString(name)
  end

  def glGetTexEnvfv(target : UInt32, pname : UInt32, params : Float32*) : Void
    C.glGetTexEnvfv(target, pname, params)
  end

  def glGetTexEnviv(target : UInt32, pname : UInt32, params : Int32*) : Void
    C.glGetTexEnviv(target, pname, params)
  end

  def glGetTexGendv(coord : UInt32, pname : UInt32, params : Float64*) : Void
    C.glGetTexGendv(coord, pname, params)
  end

  def glGetTexGenfv(coord : UInt32, pname : UInt32, params : Float32*) : Void
    C.glGetTexGenfv(coord, pname, params)
  end

  def glGetTexGeniv(coord : UInt32, pname : UInt32, params : Int32*) : Void
    C.glGetTexGeniv(coord, pname, params)
  end

  def glGetTexImage(target : UInt32, level : Int32, format : UInt32, type__ : UInt32, pixels : Void*) : Void
    C.glGetTexImage(target, level, format, type__, pixels)
  end

  def glGetTexLevelParameterfv(target : UInt32, level : Int32, pname : UInt32, params : Float32*) : Void
    C.glGetTexLevelParameterfv(target, level, pname, params)
  end

  def glGetTexLevelParameteriv(target : UInt32, level : Int32, pname : UInt32, params : Int32*) : Void
    C.glGetTexLevelParameteriv(target, level, pname, params)
  end

  def glGetTexParameterfv(target : UInt32, pname : UInt32, params : Float32*) : Void
    C.glGetTexParameterfv(target, pname, params)
  end

  def glGetTexParameteriv(target : UInt32, pname : UInt32, params : Int32*) : Void
    C.glGetTexParameteriv(target, pname, params)
  end

  def glHint(target : UInt32, mode : UInt32) : Void
    C.glHint(target, mode)
  end

  def glIndexMask(mask : UInt32) : Void
    C.glIndexMask(mask)
  end

  def glIndexPointer(type__ : UInt32, stride : Int32, pointer : Void*) : Void
    C.glIndexPointer(type__, stride, pointer)
  end

  def glIndexd(c : Float64) : Void
    C.glIndexd(c)
  end

  def glIndexdv(c : Float64*) : Void
    C.glIndexdv(c)
  end

  def glIndexf(c : Float32) : Void
    C.glIndexf(c)
  end

  def glIndexfv(c : Float32*) : Void
    C.glIndexfv(c)
  end

  def glIndexi(c : Int32) : Void
    C.glIndexi(c)
  end

  def glIndexiv(c : Int32*) : Void
    C.glIndexiv(c)
  end

  def glIndexs(c : Int16) : Void
    C.glIndexs(c)
  end

  def glIndexsv(c : Int16*) : Void
    C.glIndexsv(c)
  end

  def glIndexub(c : UInt8) : Void
    C.glIndexub(c)
  end

  def glIndexubv(c : UInt8*) : Void
    C.glIndexubv(c)
  end

  def glInitNames : Void
    C.glInitNames
  end

  def glInterleavedArrays(format : UInt32, stride : Int32, pointer : Void*) : Void
    C.glInterleavedArrays(format, stride, pointer)
  end

  def glIsEnabled(cap : UInt32) : UInt8
    C.glIsEnabled(cap)
  end

  def glIsList(list : UInt32) : UInt8
    C.glIsList(list)
  end

  def glIsTexture(texture : UInt32) : UInt8
    C.glIsTexture(texture)
  end

  def glLightModelf(pname : UInt32, param1 : Float32) : Void
    C.glLightModelf(pname, param1)
  end

  def glLightModelfv(pname : UInt32, params : Float32*) : Void
    C.glLightModelfv(pname, params)
  end

  def glLightModeli(pname : UInt32, param1 : Int32) : Void
    C.glLightModeli(pname, param1)
  end

  def glLightModeliv(pname : UInt32, params : Int32*) : Void
    C.glLightModeliv(pname, params)
  end

  def glLightf(light : UInt32, pname : UInt32, param2 : Float32) : Void
    C.glLightf(light, pname, param2)
  end

  def glLightfv(light : UInt32, pname : UInt32, params : Float32*) : Void
    C.glLightfv(light, pname, params)
  end

  def glLighti(light : UInt32, pname : UInt32, param2 : Int32) : Void
    C.glLighti(light, pname, param2)
  end

  def glLightiv(light : UInt32, pname : UInt32, params : Int32*) : Void
    C.glLightiv(light, pname, params)
  end

  def glLineStipple(factor : Int32, pattern : UInt16) : Void
    C.glLineStipple(factor, pattern)
  end

  def glLineWidth(width : Float32) : Void
    C.glLineWidth(width)
  end

  def glListBase(base : UInt32) : Void
    C.glListBase(base)
  end

  def glLoadIdentity : Void
    C.glLoadIdentity
  end

  def glLoadMatrixd(m : Float64*) : Void
    C.glLoadMatrixd(m)
  end

  def glLoadMatrixf(m : Float32*) : Void
    C.glLoadMatrixf(m)
  end

  def glLoadName(name : UInt32) : Void
    C.glLoadName(name)
  end

  def glLogicOp(opcode : UInt32) : Void
    C.glLogicOp(opcode)
  end

  def glMap1d(target : UInt32, u1 : Float64, u2 : Float64, stride : Int32, order : Int32, points : Float64*) : Void
    C.glMap1d(target, u1, u2, stride, order, points)
  end

  def glMap1f(target : UInt32, u1 : Float32, u2 : Float32, stride : Int32, order : Int32, points : Float32*) : Void
    C.glMap1f(target, u1, u2, stride, order, points)
  end

  def glMap2d(target : UInt32, u1 : Float64, u2 : Float64, ustride : Int32, uorder : Int32, v1 : Float64, v2 : Float64, vstride : Int32, vorder : Int32, points : Float64*) : Void
    C.glMap2d(target, u1, u2, ustride, uorder, v1, v2, vstride, vorder, points)
  end

  def glMap2f(target : UInt32, u1 : Float32, u2 : Float32, ustride : Int32, uorder : Int32, v1 : Float32, v2 : Float32, vstride : Int32, vorder : Int32, points : Float32*) : Void
    C.glMap2f(target, u1, u2, ustride, uorder, v1, v2, vstride, vorder, points)
  end

  def glMapGrid1d(un : Int32, u1 : Float64, u2 : Float64) : Void
    C.glMapGrid1d(un, u1, u2)
  end

  def glMapGrid1f(un : Int32, u1 : Float32, u2 : Float32) : Void
    C.glMapGrid1f(un, u1, u2)
  end

  def glMapGrid2d(un : Int32, u1 : Float64, u2 : Float64, vn : Int32, v1 : Float64, v2 : Float64) : Void
    C.glMapGrid2d(un, u1, u2, vn, v1, v2)
  end

  def glMapGrid2f(un : Int32, u1 : Float32, u2 : Float32, vn : Int32, v1 : Float32, v2 : Float32) : Void
    C.glMapGrid2f(un, u1, u2, vn, v1, v2)
  end

  def glMaterialf(face : UInt32, pname : UInt32, param2 : Float32) : Void
    C.glMaterialf(face, pname, param2)
  end

  def glMaterialfv(face : UInt32, pname : UInt32, params : Float32*) : Void
    C.glMaterialfv(face, pname, params)
  end

  def glMateriali(face : UInt32, pname : UInt32, param2 : Int32) : Void
    C.glMateriali(face, pname, param2)
  end

  def glMaterialiv(face : UInt32, pname : UInt32, params : Int32*) : Void
    C.glMaterialiv(face, pname, params)
  end

  def glMatrixMode(mode : UInt32) : Void
    C.glMatrixMode(mode)
  end

  def glMultMatrixd(m : Float64*) : Void
    C.glMultMatrixd(m)
  end

  def glMultMatrixf(m : Float32*) : Void
    C.glMultMatrixf(m)
  end

  def glNewList(list : UInt32, mode : UInt32) : Void
    C.glNewList(list, mode)
  end

  def glNormal3b(nx : Int8, ny : Int8, nz : Int8) : Void
    C.glNormal3b(nx, ny, nz)
  end

  def glNormal3bv(v : Int8*) : Void
    C.glNormal3bv(v)
  end

  def glNormal3d(nx : Float64, ny : Float64, nz : Float64) : Void
    C.glNormal3d(nx, ny, nz)
  end

  def glNormal3dv(v : Float64*) : Void
    C.glNormal3dv(v)
  end

  def glNormal3f(nx : Float32, ny : Float32, nz : Float32) : Void
    C.glNormal3f(nx, ny, nz)
  end

  def glNormal3fv(v : Float32*) : Void
    C.glNormal3fv(v)
  end

  def glNormal3i(nx : Int32, ny : Int32, nz : Int32) : Void
    C.glNormal3i(nx, ny, nz)
  end

  def glNormal3iv(v : Int32*) : Void
    C.glNormal3iv(v)
  end

  def glNormal3s(nx : Int16, ny : Int16, nz : Int16) : Void
    C.glNormal3s(nx, ny, nz)
  end

  def glNormal3sv(v : Int16*) : Void
    C.glNormal3sv(v)
  end

  def glNormalPointer(type__ : UInt32, stride : Int32, pointer : Void*) : Void
    C.glNormalPointer(type__, stride, pointer)
  end

  def glOrtho(left : Float64, right : Float64, bottom : Float64, top : Float64, zNear : Float64, zFar : Float64) : Void
    C.glOrtho(left, right, bottom, top, zNear, zFar)
  end

  def glPassThrough(token : Float32) : Void
    C.glPassThrough(token)
  end

  def glPixelMapfv(map : UInt32, mapsize : Int32, values : Float32*) : Void
    C.glPixelMapfv(map, mapsize, values)
  end

  def glPixelMapuiv(map : UInt32, mapsize : Int32, values : UInt32*) : Void
    C.glPixelMapuiv(map, mapsize, values)
  end

  def glPixelMapusv(map : UInt32, mapsize : Int32, values : UInt16*) : Void
    C.glPixelMapusv(map, mapsize, values)
  end

  def glPixelStoref(pname : UInt32, param1 : Float32) : Void
    C.glPixelStoref(pname, param1)
  end

  def glPixelStorei(pname : UInt32, param1 : Int32) : Void
    C.glPixelStorei(pname, param1)
  end

  def glPixelTransferf(pname : UInt32, param1 : Float32) : Void
    C.glPixelTransferf(pname, param1)
  end

  def glPixelTransferi(pname : UInt32, param1 : Int32) : Void
    C.glPixelTransferi(pname, param1)
  end

  def glPixelZoom(xfactor : Float32, yfactor : Float32) : Void
    C.glPixelZoom(xfactor, yfactor)
  end

  def glPointSize(size : Float32) : Void
    C.glPointSize(size)
  end

  def glPolygonMode(face : UInt32, mode : UInt32) : Void
    C.glPolygonMode(face, mode)
  end

  def glPolygonOffset(factor : Float32, units : Float32) : Void
    C.glPolygonOffset(factor, units)
  end

  def glPolygonStipple(mask : UInt8*) : Void
    C.glPolygonStipple(mask)
  end

  def glPopAttrib : Void
    C.glPopAttrib
  end

  def glPopClientAttrib : Void
    C.glPopClientAttrib
  end

  def glPopMatrix : Void
    C.glPopMatrix
  end

  def glPopName : Void
    C.glPopName
  end

  def glPrioritizeTextures(n : Int32, textures : UInt32*, priorities : Float32*) : Void
    C.glPrioritizeTextures(n, textures, priorities)
  end

  def glPushAttrib(mask : UInt32) : Void
    C.glPushAttrib(mask)
  end

  def glPushClientAttrib(mask : UInt32) : Void
    C.glPushClientAttrib(mask)
  end

  def glPushMatrix : Void
    C.glPushMatrix
  end

  def glPushName(name : UInt32) : Void
    C.glPushName(name)
  end

  def glRasterPos2d(x : Float64, y : Float64) : Void
    C.glRasterPos2d(x, y)
  end

  def glRasterPos2dv(v : Float64*) : Void
    C.glRasterPos2dv(v)
  end

  def glRasterPos2f(x : Float32, y : Float32) : Void
    C.glRasterPos2f(x, y)
  end

  def glRasterPos2fv(v : Float32*) : Void
    C.glRasterPos2fv(v)
  end

  def glRasterPos2i(x : Int32, y : Int32) : Void
    C.glRasterPos2i(x, y)
  end

  def glRasterPos2iv(v : Int32*) : Void
    C.glRasterPos2iv(v)
  end

  def glRasterPos2s(x : Int16, y : Int16) : Void
    C.glRasterPos2s(x, y)
  end

  def glRasterPos2sv(v : Int16*) : Void
    C.glRasterPos2sv(v)
  end

  def glRasterPos3d(x : Float64, y : Float64, z : Float64) : Void
    C.glRasterPos3d(x, y, z)
  end

  def glRasterPos3dv(v : Float64*) : Void
    C.glRasterPos3dv(v)
  end

  def glRasterPos3f(x : Float32, y : Float32, z : Float32) : Void
    C.glRasterPos3f(x, y, z)
  end

  def glRasterPos3fv(v : Float32*) : Void
    C.glRasterPos3fv(v)
  end

  def glRasterPos3i(x : Int32, y : Int32, z : Int32) : Void
    C.glRasterPos3i(x, y, z)
  end

  def glRasterPos3iv(v : Int32*) : Void
    C.glRasterPos3iv(v)
  end

  def glRasterPos3s(x : Int16, y : Int16, z : Int16) : Void
    C.glRasterPos3s(x, y, z)
  end

  def glRasterPos3sv(v : Int16*) : Void
    C.glRasterPos3sv(v)
  end

  def glRasterPos4d(x : Float64, y : Float64, z : Float64, w : Float64) : Void
    C.glRasterPos4d(x, y, z, w)
  end

  def glRasterPos4dv(v : Float64*) : Void
    C.glRasterPos4dv(v)
  end

  def glRasterPos4f(x : Float32, y : Float32, z : Float32, w : Float32) : Void
    C.glRasterPos4f(x, y, z, w)
  end

  def glRasterPos4fv(v : Float32*) : Void
    C.glRasterPos4fv(v)
  end

  def glRasterPos4i(x : Int32, y : Int32, z : Int32, w : Int32) : Void
    C.glRasterPos4i(x, y, z, w)
  end

  def glRasterPos4iv(v : Int32*) : Void
    C.glRasterPos4iv(v)
  end

  def glRasterPos4s(x : Int16, y : Int16, z : Int16, w : Int16) : Void
    C.glRasterPos4s(x, y, z, w)
  end

  def glRasterPos4sv(v : Int16*) : Void
    C.glRasterPos4sv(v)
  end

  def glReadBuffer(mode : UInt32) : Void
    C.glReadBuffer(mode)
  end

  def glReadPixels(x : Int32, y : Int32, width : Int32, height : Int32, format : UInt32, type__ : UInt32, pixels : Void*) : Void
    C.glReadPixels(x, y, width, height, format, type__, pixels)
  end

  def glRectd(x1 : Float64, y1 : Float64, x2 : Float64, y2 : Float64) : Void
    C.glRectd(x1, y1, x2, y2)
  end

  def glRectdv(v1 : Float64*, v2 : Float64*) : Void
    C.glRectdv(v1, v2)
  end

  def glRectf(x1 : Float32, y1 : Float32, x2 : Float32, y2 : Float32) : Void
    C.glRectf(x1, y1, x2, y2)
  end

  def glRectfv(v1 : Float32*, v2 : Float32*) : Void
    C.glRectfv(v1, v2)
  end

  def glRecti(x1 : Int32, y1 : Int32, x2 : Int32, y2 : Int32) : Void
    C.glRecti(x1, y1, x2, y2)
  end

  def glRectiv(v1 : Int32*, v2 : Int32*) : Void
    C.glRectiv(v1, v2)
  end

  def glRects(x1 : Int16, y1 : Int16, x2 : Int16, y2 : Int16) : Void
    C.glRects(x1, y1, x2, y2)
  end

  def glRectsv(v1 : Int16*, v2 : Int16*) : Void
    C.glRectsv(v1, v2)
  end

  def glRenderMode(mode : UInt32) : Int32
    C.glRenderMode(mode)
  end

  def glRotated(angle : Float64, x : Float64, y : Float64, z : Float64) : Void
    C.glRotated(angle, x, y, z)
  end

  def glRotatef(angle : Float32, x : Float32, y : Float32, z : Float32) : Void
    C.glRotatef(angle, x, y, z)
  end

  def glScaled(x : Float64, y : Float64, z : Float64) : Void
    C.glScaled(x, y, z)
  end

  def glScalef(x : Float32, y : Float32, z : Float32) : Void
    C.glScalef(x, y, z)
  end

  def glScissor(x : Int32, y : Int32, width : Int32, height : Int32) : Void
    C.glScissor(x, y, width, height)
  end

  def glSelectBuffer(size : Int32, buffer : UInt32*) : Void
    C.glSelectBuffer(size, buffer)
  end

  def glShadeModel(mode : UInt32) : Void
    C.glShadeModel(mode)
  end

  def glStencilFunc(func : UInt32, ref : Int32, mask : UInt32) : Void
    C.glStencilFunc(func, ref, mask)
  end

  def glStencilMask(mask : UInt32) : Void
    C.glStencilMask(mask)
  end

  def glStencilOp(fail : UInt32, zfail : UInt32, zpass : UInt32) : Void
    C.glStencilOp(fail, zfail, zpass)
  end

  def glTexCoord1d(s : Float64) : Void
    C.glTexCoord1d(s)
  end

  def glTexCoord1dv(v : Float64*) : Void
    C.glTexCoord1dv(v)
  end

  def glTexCoord1f(s : Float32) : Void
    C.glTexCoord1f(s)
  end

  def glTexCoord1fv(v : Float32*) : Void
    C.glTexCoord1fv(v)
  end

  def glTexCoord1i(s : Int32) : Void
    C.glTexCoord1i(s)
  end

  def glTexCoord1iv(v : Int32*) : Void
    C.glTexCoord1iv(v)
  end

  def glTexCoord1s(s : Int16) : Void
    C.glTexCoord1s(s)
  end

  def glTexCoord1sv(v : Int16*) : Void
    C.glTexCoord1sv(v)
  end

  def glTexCoord2d(s : Float64, t : Float64) : Void
    C.glTexCoord2d(s, t)
  end

  def glTexCoord2dv(v : Float64*) : Void
    C.glTexCoord2dv(v)
  end

  def glTexCoord2f(s : Float32, t : Float32) : Void
    C.glTexCoord2f(s, t)
  end

  def glTexCoord2fv(v : Float32*) : Void
    C.glTexCoord2fv(v)
  end

  def glTexCoord2i(s : Int32, t : Int32) : Void
    C.glTexCoord2i(s, t)
  end

  def glTexCoord2iv(v : Int32*) : Void
    C.glTexCoord2iv(v)
  end

  def glTexCoord2s(s : Int16, t : Int16) : Void
    C.glTexCoord2s(s, t)
  end

  def glTexCoord2sv(v : Int16*) : Void
    C.glTexCoord2sv(v)
  end

  def glTexCoord3d(s : Float64, t : Float64, r : Float64) : Void
    C.glTexCoord3d(s, t, r)
  end

  def glTexCoord3dv(v : Float64*) : Void
    C.glTexCoord3dv(v)
  end

  def glTexCoord3f(s : Float32, t : Float32, r : Float32) : Void
    C.glTexCoord3f(s, t, r)
  end

  def glTexCoord3fv(v : Float32*) : Void
    C.glTexCoord3fv(v)
  end

  def glTexCoord3i(s : Int32, t : Int32, r : Int32) : Void
    C.glTexCoord3i(s, t, r)
  end

  def glTexCoord3iv(v : Int32*) : Void
    C.glTexCoord3iv(v)
  end

  def glTexCoord3s(s : Int16, t : Int16, r : Int16) : Void
    C.glTexCoord3s(s, t, r)
  end

  def glTexCoord3sv(v : Int16*) : Void
    C.glTexCoord3sv(v)
  end

  def glTexCoord4d(s : Float64, t : Float64, r : Float64, q : Float64) : Void
    C.glTexCoord4d(s, t, r, q)
  end

  def glTexCoord4dv(v : Float64*) : Void
    C.glTexCoord4dv(v)
  end

  def glTexCoord4f(s : Float32, t : Float32, r : Float32, q : Float32) : Void
    C.glTexCoord4f(s, t, r, q)
  end

  def glTexCoord4fv(v : Float32*) : Void
    C.glTexCoord4fv(v)
  end

  def glTexCoord4i(s : Int32, t : Int32, r : Int32, q : Int32) : Void
    C.glTexCoord4i(s, t, r, q)
  end

  def glTexCoord4iv(v : Int32*) : Void
    C.glTexCoord4iv(v)
  end

  def glTexCoord4s(s : Int16, t : Int16, r : Int16, q : Int16) : Void
    C.glTexCoord4s(s, t, r, q)
  end

  def glTexCoord4sv(v : Int16*) : Void
    C.glTexCoord4sv(v)
  end

  def glTexCoordPointer(size : Int32, type__ : UInt32, stride : Int32, pointer : Void*) : Void
    C.glTexCoordPointer(size, type__, stride, pointer)
  end

  def glTexEnvf(target : UInt32, pname : UInt32, param2 : Float32) : Void
    C.glTexEnvf(target, pname, param2)
  end

  def glTexEnvfv(target : UInt32, pname : UInt32, params : Float32*) : Void
    C.glTexEnvfv(target, pname, params)
  end

  def glTexEnvi(target : UInt32, pname : UInt32, param2 : Int32) : Void
    C.glTexEnvi(target, pname, param2)
  end

  def glTexEnviv(target : UInt32, pname : UInt32, params : Int32*) : Void
    C.glTexEnviv(target, pname, params)
  end

  def glTexGend(coord : UInt32, pname : UInt32, param2 : Float64) : Void
    C.glTexGend(coord, pname, param2)
  end

  def glTexGendv(coord : UInt32, pname : UInt32, params : Float64*) : Void
    C.glTexGendv(coord, pname, params)
  end

  def glTexGenf(coord : UInt32, pname : UInt32, param2 : Float32) : Void
    C.glTexGenf(coord, pname, param2)
  end

  def glTexGenfv(coord : UInt32, pname : UInt32, params : Float32*) : Void
    C.glTexGenfv(coord, pname, params)
  end

  def glTexGeni(coord : UInt32, pname : UInt32, param2 : Int32) : Void
    C.glTexGeni(coord, pname, param2)
  end

  def glTexGeniv(coord : UInt32, pname : UInt32, params : Int32*) : Void
    C.glTexGeniv(coord, pname, params)
  end

  def glTexImage1D(target : UInt32, level : Int32, internalformat : Int32, width : Int32, border : Int32, format : UInt32, type__ : UInt32, pixels : Void*) : Void
    C.glTexImage1D(target, level, internalformat, width, border, format, type__, pixels)
  end

  def glTexImage2D(target : UInt32, level : Int32, internalformat : Int32, width : Int32, height : Int32, border : Int32, format : UInt32, type__ : UInt32, pixels : Void*) : Void
    C.glTexImage2D(target, level, internalformat, width, height, border, format, type__, pixels)
  end

  def glTexParameterf(target : UInt32, pname : UInt32, param2 : Float32) : Void
    C.glTexParameterf(target, pname, param2)
  end

  def glTexParameterfv(target : UInt32, pname : UInt32, params : Float32*) : Void
    C.glTexParameterfv(target, pname, params)
  end

  def glTexParameteri(target : UInt32, pname : UInt32, param2 : Int32) : Void
    C.glTexParameteri(target, pname, param2)
  end

  def glTexParameteriv(target : UInt32, pname : UInt32, params : Int32*) : Void
    C.glTexParameteriv(target, pname, params)
  end

  def glTexSubImage1D(target : UInt32, level : Int32, xoffset : Int32, width : Int32, format : UInt32, type__ : UInt32, pixels : Void*) : Void
    C.glTexSubImage1D(target, level, xoffset, width, format, type__, pixels)
  end

  def glTexSubImage2D(target : UInt32, level : Int32, xoffset : Int32, yoffset : Int32, width : Int32, height : Int32, format : UInt32, type__ : UInt32, pixels : Void*) : Void
    C.glTexSubImage2D(target, level, xoffset, yoffset, width, height, format, type__, pixels)
  end

  def glTranslated(x : Float64, y : Float64, z : Float64) : Void
    C.glTranslated(x, y, z)
  end

  def glTranslatef(x : Float32, y : Float32, z : Float32) : Void
    C.glTranslatef(x, y, z)
  end

  def glVertex2d(x : Float64, y : Float64) : Void
    C.glVertex2d(x, y)
  end

  def glVertex2dv(v : Float64*) : Void
    C.glVertex2dv(v)
  end

  def glVertex2f(x : Float32, y : Float32) : Void
    C.glVertex2f(x, y)
  end

  def glVertex2fv(v : Float32*) : Void
    C.glVertex2fv(v)
  end

  def glVertex2i(x : Int32, y : Int32) : Void
    C.glVertex2i(x, y)
  end

  def glVertex2iv(v : Int32*) : Void
    C.glVertex2iv(v)
  end

  def glVertex2s(x : Int16, y : Int16) : Void
    C.glVertex2s(x, y)
  end

  def glVertex2sv(v : Int16*) : Void
    C.glVertex2sv(v)
  end

  def glVertex3d(x : Float64, y : Float64, z : Float64) : Void
    C.glVertex3d(x, y, z)
  end

  def glVertex3dv(v : Float64*) : Void
    C.glVertex3dv(v)
  end

  def glVertex3f(x : Float32, y : Float32, z : Float32) : Void
    C.glVertex3f(x, y, z)
  end

  def glVertex3fv(v : Float32*) : Void
    C.glVertex3fv(v)
  end

  def glVertex3i(x : Int32, y : Int32, z : Int32) : Void
    C.glVertex3i(x, y, z)
  end

  def glVertex3iv(v : Int32*) : Void
    C.glVertex3iv(v)
  end

  def glVertex3s(x : Int16, y : Int16, z : Int16) : Void
    C.glVertex3s(x, y, z)
  end

  def glVertex3sv(v : Int16*) : Void
    C.glVertex3sv(v)
  end

  def glVertex4d(x : Float64, y : Float64, z : Float64, w : Float64) : Void
    C.glVertex4d(x, y, z, w)
  end

  def glVertex4dv(v : Float64*) : Void
    C.glVertex4dv(v)
  end

  def glVertex4f(x : Float32, y : Float32, z : Float32, w : Float32) : Void
    C.glVertex4f(x, y, z, w)
  end

  def glVertex4fv(v : Float32*) : Void
    C.glVertex4fv(v)
  end

  def glVertex4i(x : Int32, y : Int32, z : Int32, w : Int32) : Void
    C.glVertex4i(x, y, z, w)
  end

  def glVertex4iv(v : Int32*) : Void
    C.glVertex4iv(v)
  end

  def glVertex4s(x : Int16, y : Int16, z : Int16, w : Int16) : Void
    C.glVertex4s(x, y, z, w)
  end

  def glVertex4sv(v : Int16*) : Void
    C.glVertex4sv(v)
  end

  def glVertexPointer(size : Int32, type__ : UInt32, stride : Int32, pointer : Void*) : Void
    C.glVertexPointer(size, type__, stride, pointer)
  end

  def glViewport(x : Int32, y : Int32, width : Int32, height : Int32) : Void
    C.glViewport(x, y, width, height)
  end

  def gluErrorString(errCode : UInt32) : UInt8*
    C.gluErrorString(errCode)
  end

  def gluErrorUnicodeStringEXT(errCode : UInt32) : Win32cr::Foundation::PWSTR
    C.gluErrorUnicodeStringEXT(errCode)
  end

  def gluGetString(name : UInt32) : UInt8*
    C.gluGetString(name)
  end

  def gluOrtho2D(left : Float64, right : Float64, bottom : Float64, top : Float64) : Void
    C.gluOrtho2D(left, right, bottom, top)
  end

  def gluPerspective(fovy : Float64, aspect : Float64, zNear : Float64, zFar : Float64) : Void
    C.gluPerspective(fovy, aspect, zNear, zFar)
  end

  def gluPickMatrix(x : Float64, y : Float64, width : Float64, height : Float64, viewport : Int32*) : Void
    C.gluPickMatrix(x, y, width, height, viewport)
  end

  def gluLookAt(eyex : Float64, eyey : Float64, eyez : Float64, centerx : Float64, centery : Float64, centerz : Float64, upx : Float64, upy : Float64, upz : Float64) : Void
    C.gluLookAt(eyex, eyey, eyez, centerx, centery, centerz, upx, upy, upz)
  end

  def gluProject(objx : Float64, objy : Float64, objz : Float64, modelMatrix : Float64*, projMatrix : Float64*, viewport : Int32*, winx : Float64*, winy : Float64*, winz : Float64*) : Int32
    C.gluProject(objx, objy, objz, modelMatrix, projMatrix, viewport, winx, winy, winz)
  end

  def gluUnProject(winx : Float64, winy : Float64, winz : Float64, modelMatrix : Float64*, projMatrix : Float64*, viewport : Int32*, objx : Float64*, objy : Float64*, objz : Float64*) : Int32
    C.gluUnProject(winx, winy, winz, modelMatrix, projMatrix, viewport, objx, objy, objz)
  end

  def gluScaleImage(format : UInt32, widthin : Int32, heightin : Int32, typein : UInt32, datain : Void*, widthout : Int32, heightout : Int32, typeout : UInt32, dataout : Void*) : Int32
    C.gluScaleImage(format, widthin, heightin, typein, datain, widthout, heightout, typeout, dataout)
  end

  def gluBuild1DMipmaps(target : UInt32, components : Int32, width : Int32, format : UInt32, type__ : UInt32, data : Void*) : Int32
    C.gluBuild1DMipmaps(target, components, width, format, type__, data)
  end

  def gluBuild2DMipmaps(target : UInt32, components : Int32, width : Int32, height : Int32, format : UInt32, type__ : UInt32, data : Void*) : Int32
    C.gluBuild2DMipmaps(target, components, width, height, format, type__, data)
  end

  def gluNewQuadric : Win32cr::Graphics::OpenGL::GLUquadric*
    C.gluNewQuadric
  end

  def gluDeleteQuadric(state : Win32cr::Graphics::OpenGL::GLUquadric*) : Void
    C.gluDeleteQuadric(state)
  end

  def gluQuadricNormals(quadObject : Win32cr::Graphics::OpenGL::GLUquadric*, normals : UInt32) : Void
    C.gluQuadricNormals(quadObject, normals)
  end

  def gluQuadricTexture(quadObject : Win32cr::Graphics::OpenGL::GLUquadric*, textureCoords : UInt8) : Void
    C.gluQuadricTexture(quadObject, textureCoords)
  end

  def gluQuadricOrientation(quadObject : Win32cr::Graphics::OpenGL::GLUquadric*, orientation : UInt32) : Void
    C.gluQuadricOrientation(quadObject, orientation)
  end

  def gluQuadricDrawStyle(quadObject : Win32cr::Graphics::OpenGL::GLUquadric*, drawStyle : UInt32) : Void
    C.gluQuadricDrawStyle(quadObject, drawStyle)
  end

  def gluCylinder(qobj : Win32cr::Graphics::OpenGL::GLUquadric*, baseRadius : Float64, topRadius : Float64, height : Float64, slices : Int32, stacks : Int32) : Void
    C.gluCylinder(qobj, baseRadius, topRadius, height, slices, stacks)
  end

  def gluDisk(qobj : Win32cr::Graphics::OpenGL::GLUquadric*, innerRadius : Float64, outerRadius : Float64, slices : Int32, loops : Int32) : Void
    C.gluDisk(qobj, innerRadius, outerRadius, slices, loops)
  end

  def gluPartialDisk(qobj : Win32cr::Graphics::OpenGL::GLUquadric*, innerRadius : Float64, outerRadius : Float64, slices : Int32, loops : Int32, startAngle : Float64, sweepAngle : Float64) : Void
    C.gluPartialDisk(qobj, innerRadius, outerRadius, slices, loops, startAngle, sweepAngle)
  end

  def gluSphere(qobj : Win32cr::Graphics::OpenGL::GLUquadric*, radius : Float64, slices : Int32, stacks : Int32) : Void
    C.gluSphere(qobj, radius, slices, stacks)
  end

  def gluQuadricCallback(qobj : Win32cr::Graphics::OpenGL::GLUquadric*, which : UInt32, fn : LibC::IntPtrT) : Void
    C.gluQuadricCallback(qobj, which, fn)
  end

  def gluNewTess : Win32cr::Graphics::OpenGL::GLUtesselator*
    C.gluNewTess
  end

  def gluDeleteTess(tess : Win32cr::Graphics::OpenGL::GLUtesselator*) : Void
    C.gluDeleteTess(tess)
  end

  def gluTessBeginPolygon(tess : Win32cr::Graphics::OpenGL::GLUtesselator*, polygon_data : Void*) : Void
    C.gluTessBeginPolygon(tess, polygon_data)
  end

  def gluTessBeginContour(tess : Win32cr::Graphics::OpenGL::GLUtesselator*) : Void
    C.gluTessBeginContour(tess)
  end

  def gluTessVertex(tess : Win32cr::Graphics::OpenGL::GLUtesselator*, coords : Float64*, data : Void*) : Void
    C.gluTessVertex(tess, coords, data)
  end

  def gluTessEndContour(tess : Win32cr::Graphics::OpenGL::GLUtesselator*) : Void
    C.gluTessEndContour(tess)
  end

  def gluTessEndPolygon(tess : Win32cr::Graphics::OpenGL::GLUtesselator*) : Void
    C.gluTessEndPolygon(tess)
  end

  def gluTessProperty(tess : Win32cr::Graphics::OpenGL::GLUtesselator*, which : UInt32, value : Float64) : Void
    C.gluTessProperty(tess, which, value)
  end

  def gluTessNormal(tess : Win32cr::Graphics::OpenGL::GLUtesselator*, x : Float64, y : Float64, z : Float64) : Void
    C.gluTessNormal(tess, x, y, z)
  end

  def gluTessCallback(tess : Win32cr::Graphics::OpenGL::GLUtesselator*, which : UInt32, fn : LibC::IntPtrT) : Void
    C.gluTessCallback(tess, which, fn)
  end

  def gluGetTessProperty(tess : Win32cr::Graphics::OpenGL::GLUtesselator*, which : UInt32, value : Float64*) : Void
    C.gluGetTessProperty(tess, which, value)
  end

  def gluNewNurbsRenderer : Win32cr::Graphics::OpenGL::GLUnurbs*
    C.gluNewNurbsRenderer
  end

  def gluDeleteNurbsRenderer(nobj : Win32cr::Graphics::OpenGL::GLUnurbs*) : Void
    C.gluDeleteNurbsRenderer(nobj)
  end

  def gluBeginSurface(nobj : Win32cr::Graphics::OpenGL::GLUnurbs*) : Void
    C.gluBeginSurface(nobj)
  end

  def gluBeginCurve(nobj : Win32cr::Graphics::OpenGL::GLUnurbs*) : Void
    C.gluBeginCurve(nobj)
  end

  def gluEndCurve(nobj : Win32cr::Graphics::OpenGL::GLUnurbs*) : Void
    C.gluEndCurve(nobj)
  end

  def gluEndSurface(nobj : Win32cr::Graphics::OpenGL::GLUnurbs*) : Void
    C.gluEndSurface(nobj)
  end

  def gluBeginTrim(nobj : Win32cr::Graphics::OpenGL::GLUnurbs*) : Void
    C.gluBeginTrim(nobj)
  end

  def gluEndTrim(nobj : Win32cr::Graphics::OpenGL::GLUnurbs*) : Void
    C.gluEndTrim(nobj)
  end

  def gluPwlCurve(nobj : Win32cr::Graphics::OpenGL::GLUnurbs*, count : Int32, array : Float32*, stride : Int32, type__ : UInt32) : Void
    C.gluPwlCurve(nobj, count, array, stride, type__)
  end

  def gluNurbsCurve(nobj : Win32cr::Graphics::OpenGL::GLUnurbs*, nknots : Int32, knot : Float32*, stride : Int32, ctlarray : Float32*, order : Int32, type__ : UInt32) : Void
    C.gluNurbsCurve(nobj, nknots, knot, stride, ctlarray, order, type__)
  end

  def gluNurbsSurface(nobj : Win32cr::Graphics::OpenGL::GLUnurbs*, sknot_count : Int32, sknot : Float32*, tknot_count : Int32, tknot : Float32*, s_stride : Int32, t_stride : Int32, ctlarray : Float32*, sorder : Int32, torder : Int32, type__ : UInt32) : Void
    C.gluNurbsSurface(nobj, sknot_count, sknot, tknot_count, tknot, s_stride, t_stride, ctlarray, sorder, torder, type__)
  end

  def gluLoadSamplingMatrices(nobj : Win32cr::Graphics::OpenGL::GLUnurbs*, modelMatrix : Float32*, projMatrix : Float32*, viewport : Int32*) : Void
    C.gluLoadSamplingMatrices(nobj, modelMatrix, projMatrix, viewport)
  end

  def gluNurbsProperty(nobj : Win32cr::Graphics::OpenGL::GLUnurbs*, property : UInt32, value : Float32) : Void
    C.gluNurbsProperty(nobj, property, value)
  end

  def gluGetNurbsProperty(nobj : Win32cr::Graphics::OpenGL::GLUnurbs*, property : UInt32, value : Float32*) : Void
    C.gluGetNurbsProperty(nobj, property, value)
  end

  def gluNurbsCallback(nobj : Win32cr::Graphics::OpenGL::GLUnurbs*, which : UInt32, fn : LibC::IntPtrT) : Void
    C.gluNurbsCallback(nobj, which, fn)
  end

  def gluBeginPolygon(tess : Win32cr::Graphics::OpenGL::GLUtesselator*) : Void
    C.gluBeginPolygon(tess)
  end

  def gluNextContour(tess : Win32cr::Graphics::OpenGL::GLUtesselator*, type__ : UInt32) : Void
    C.gluNextContour(tess, type__)
  end

  def gluEndPolygon(tess : Win32cr::Graphics::OpenGL::GLUtesselator*) : Void
    C.gluEndPolygon(tess)
  end

  @[Link("gdi32")]
  @[Link("opengl32")]
  @[Link("glu32")]
  lib C
    # :nodoc:
    fun ChoosePixelFormat(hdc : Win32cr::Graphics::Gdi::HDC, ppfd : Win32cr::Graphics::OpenGL::PIXELFORMATDESCRIPTOR*) : Int32

    # :nodoc:
    fun DescribePixelFormat(hdc : Win32cr::Graphics::Gdi::HDC, iPixelFormat : Win32cr::Graphics::OpenGL::PFD_PIXEL_TYPE, nBytes : UInt32, ppfd : Win32cr::Graphics::OpenGL::PIXELFORMATDESCRIPTOR*) : Int32

    # :nodoc:
    fun GetPixelFormat(hdc : Win32cr::Graphics::Gdi::HDC) : Int32

    # :nodoc:
    fun SetPixelFormat(hdc : Win32cr::Graphics::Gdi::HDC, format : Int32, ppfd : Win32cr::Graphics::OpenGL::PIXELFORMATDESCRIPTOR*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetEnhMetaFilePixelFormat(hemf : Win32cr::Graphics::Gdi::HENHMETAFILE, cbBuffer : UInt32, ppfd : Win32cr::Graphics::OpenGL::PIXELFORMATDESCRIPTOR*) : UInt32

    # :nodoc:
    fun wglCopyContext(param0 : Win32cr::Graphics::OpenGL::HGLRC, param1 : Win32cr::Graphics::OpenGL::HGLRC, param2 : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun wglCreateContext(param0 : Win32cr::Graphics::Gdi::HDC) : Win32cr::Graphics::OpenGL::HGLRC

    # :nodoc:
    fun wglCreateLayerContext(param0 : Win32cr::Graphics::Gdi::HDC, param1 : Int32) : Win32cr::Graphics::OpenGL::HGLRC

    # :nodoc:
    fun wglDeleteContext(param0 : Win32cr::Graphics::OpenGL::HGLRC) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun wglGetCurrentContext : Win32cr::Graphics::OpenGL::HGLRC

    # :nodoc:
    fun wglGetCurrentDC : Win32cr::Graphics::Gdi::HDC

    # :nodoc:
    fun wglGetProcAddress(param0 : Win32cr::Foundation::PSTR) : Win32cr::Foundation::PROC

    # :nodoc:
    fun wglMakeCurrent(param0 : Win32cr::Graphics::Gdi::HDC, param1 : Win32cr::Graphics::OpenGL::HGLRC) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun wglShareLists(param0 : Win32cr::Graphics::OpenGL::HGLRC, param1 : Win32cr::Graphics::OpenGL::HGLRC) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun wglUseFontBitmapsA(param0 : Win32cr::Graphics::Gdi::HDC, param1 : UInt32, param2 : UInt32, param3 : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun wglUseFontBitmapsW(param0 : Win32cr::Graphics::Gdi::HDC, param1 : UInt32, param2 : UInt32, param3 : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SwapBuffers(param0 : Win32cr::Graphics::Gdi::HDC) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun wglUseFontOutlinesA(param0 : Win32cr::Graphics::Gdi::HDC, param1 : UInt32, param2 : UInt32, param3 : UInt32, param4 : Float32, param5 : Float32, param6 : Int32, param7 : Win32cr::Graphics::OpenGL::GLYPHMETRICSFLOAT*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun wglUseFontOutlinesW(param0 : Win32cr::Graphics::Gdi::HDC, param1 : UInt32, param2 : UInt32, param3 : UInt32, param4 : Float32, param5 : Float32, param6 : Int32, param7 : Win32cr::Graphics::OpenGL::GLYPHMETRICSFLOAT*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun wglDescribeLayerPlane(param0 : Win32cr::Graphics::Gdi::HDC, param1 : Int32, param2 : Int32, param3 : UInt32, param4 : Win32cr::Graphics::OpenGL::LAYERPLANEDESCRIPTOR*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun wglSetLayerPaletteEntries(param0 : Win32cr::Graphics::Gdi::HDC, param1 : Int32, param2 : Int32, param3 : Int32, param4 : UInt32*) : Int32

    # :nodoc:
    fun wglGetLayerPaletteEntries(param0 : Win32cr::Graphics::Gdi::HDC, param1 : Int32, param2 : Int32, param3 : Int32, param4 : UInt32*) : Int32

    # :nodoc:
    fun wglRealizeLayerPalette(param0 : Win32cr::Graphics::Gdi::HDC, param1 : Int32, param2 : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun wglSwapLayerBuffers(param0 : Win32cr::Graphics::Gdi::HDC, param1 : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun glAccum(op : UInt32, value : Float32) : Void

    # :nodoc:
    fun glAlphaFunc(func : UInt32, ref : Float32) : Void

    # :nodoc:
    fun glAreTexturesResident(n : Int32, textures : UInt32*, residences : UInt8*) : UInt8

    # :nodoc:
    fun glArrayElement(i : Int32) : Void

    # :nodoc:
    fun glBegin(mode : UInt32) : Void

    # :nodoc:
    fun glBindTexture(target : UInt32, texture : UInt32) : Void

    # :nodoc:
    fun glBitmap(width : Int32, height : Int32, xorig : Float32, yorig : Float32, xmove : Float32, ymove : Float32, bitmap : UInt8*) : Void

    # :nodoc:
    fun glBlendFunc(sfactor : UInt32, dfactor : UInt32) : Void

    # :nodoc:
    fun glCallList(list : UInt32) : Void

    # :nodoc:
    fun glCallLists(n : Int32, type__ : UInt32, lists : Void*) : Void

    # :nodoc:
    fun glClear(mask : UInt32) : Void

    # :nodoc:
    fun glClearAccum(red : Float32, green : Float32, blue : Float32, alpha : Float32) : Void

    # :nodoc:
    fun glClearColor(red : Float32, green : Float32, blue : Float32, alpha : Float32) : Void

    # :nodoc:
    fun glClearDepth(depth : Float64) : Void

    # :nodoc:
    fun glClearIndex(c : Float32) : Void

    # :nodoc:
    fun glClearStencil(s : Int32) : Void

    # :nodoc:
    fun glClipPlane(plane : UInt32, equation : Float64*) : Void

    # :nodoc:
    fun glColor3b(red : Int8, green : Int8, blue : Int8) : Void

    # :nodoc:
    fun glColor3bv(v : Int8*) : Void

    # :nodoc:
    fun glColor3d(red : Float64, green : Float64, blue : Float64) : Void

    # :nodoc:
    fun glColor3dv(v : Float64*) : Void

    # :nodoc:
    fun glColor3f(red : Float32, green : Float32, blue : Float32) : Void

    # :nodoc:
    fun glColor3fv(v : Float32*) : Void

    # :nodoc:
    fun glColor3i(red : Int32, green : Int32, blue : Int32) : Void

    # :nodoc:
    fun glColor3iv(v : Int32*) : Void

    # :nodoc:
    fun glColor3s(red : Int16, green : Int16, blue : Int16) : Void

    # :nodoc:
    fun glColor3sv(v : Int16*) : Void

    # :nodoc:
    fun glColor3ub(red : UInt8, green : UInt8, blue : UInt8) : Void

    # :nodoc:
    fun glColor3ubv(v : UInt8*) : Void

    # :nodoc:
    fun glColor3ui(red : UInt32, green : UInt32, blue : UInt32) : Void

    # :nodoc:
    fun glColor3uiv(v : UInt32*) : Void

    # :nodoc:
    fun glColor3us(red : UInt16, green : UInt16, blue : UInt16) : Void

    # :nodoc:
    fun glColor3usv(v : UInt16*) : Void

    # :nodoc:
    fun glColor4b(red : Int8, green : Int8, blue : Int8, alpha : Int8) : Void

    # :nodoc:
    fun glColor4bv(v : Int8*) : Void

    # :nodoc:
    fun glColor4d(red : Float64, green : Float64, blue : Float64, alpha : Float64) : Void

    # :nodoc:
    fun glColor4dv(v : Float64*) : Void

    # :nodoc:
    fun glColor4f(red : Float32, green : Float32, blue : Float32, alpha : Float32) : Void

    # :nodoc:
    fun glColor4fv(v : Float32*) : Void

    # :nodoc:
    fun glColor4i(red : Int32, green : Int32, blue : Int32, alpha : Int32) : Void

    # :nodoc:
    fun glColor4iv(v : Int32*) : Void

    # :nodoc:
    fun glColor4s(red : Int16, green : Int16, blue : Int16, alpha : Int16) : Void

    # :nodoc:
    fun glColor4sv(v : Int16*) : Void

    # :nodoc:
    fun glColor4ub(red : UInt8, green : UInt8, blue : UInt8, alpha : UInt8) : Void

    # :nodoc:
    fun glColor4ubv(v : UInt8*) : Void

    # :nodoc:
    fun glColor4ui(red : UInt32, green : UInt32, blue : UInt32, alpha : UInt32) : Void

    # :nodoc:
    fun glColor4uiv(v : UInt32*) : Void

    # :nodoc:
    fun glColor4us(red : UInt16, green : UInt16, blue : UInt16, alpha : UInt16) : Void

    # :nodoc:
    fun glColor4usv(v : UInt16*) : Void

    # :nodoc:
    fun glColorMask(red : UInt8, green : UInt8, blue : UInt8, alpha : UInt8) : Void

    # :nodoc:
    fun glColorMaterial(face : UInt32, mode : UInt32) : Void

    # :nodoc:
    fun glColorPointer(size : Int32, type__ : UInt32, stride : Int32, pointer : Void*) : Void

    # :nodoc:
    fun glCopyPixels(x : Int32, y : Int32, width : Int32, height : Int32, type__ : UInt32) : Void

    # :nodoc:
    fun glCopyTexImage1D(target : UInt32, level : Int32, internalFormat : UInt32, x : Int32, y : Int32, width : Int32, border : Int32) : Void

    # :nodoc:
    fun glCopyTexImage2D(target : UInt32, level : Int32, internalFormat : UInt32, x : Int32, y : Int32, width : Int32, height : Int32, border : Int32) : Void

    # :nodoc:
    fun glCopyTexSubImage1D(target : UInt32, level : Int32, xoffset : Int32, x : Int32, y : Int32, width : Int32) : Void

    # :nodoc:
    fun glCopyTexSubImage2D(target : UInt32, level : Int32, xoffset : Int32, yoffset : Int32, x : Int32, y : Int32, width : Int32, height : Int32) : Void

    # :nodoc:
    fun glCullFace(mode : UInt32) : Void

    # :nodoc:
    fun glDeleteLists(list : UInt32, range : Int32) : Void

    # :nodoc:
    fun glDeleteTextures(n : Int32, textures : UInt32*) : Void

    # :nodoc:
    fun glDepthFunc(func : UInt32) : Void

    # :nodoc:
    fun glDepthMask(flag : UInt8) : Void

    # :nodoc:
    fun glDepthRange(zNear : Float64, zFar : Float64) : Void

    # :nodoc:
    fun glDisable(cap : UInt32) : Void

    # :nodoc:
    fun glDisableClientState(array : UInt32) : Void

    # :nodoc:
    fun glDrawArrays(mode : UInt32, first : Int32, count : Int32) : Void

    # :nodoc:
    fun glDrawBuffer(mode : UInt32) : Void

    # :nodoc:
    fun glDrawElements(mode : UInt32, count : Int32, type__ : UInt32, indices : Void*) : Void

    # :nodoc:
    fun glDrawPixels(width : Int32, height : Int32, format : UInt32, type__ : UInt32, pixels : Void*) : Void

    # :nodoc:
    fun glEdgeFlag(flag : UInt8) : Void

    # :nodoc:
    fun glEdgeFlagPointer(stride : Int32, pointer : Void*) : Void

    # :nodoc:
    fun glEdgeFlagv(flag : UInt8*) : Void

    # :nodoc:
    fun glEnable(cap : UInt32) : Void

    # :nodoc:
    fun glEnableClientState(array : UInt32) : Void

    # :nodoc:
    fun glEnd : Void

    # :nodoc:
    fun glEndList : Void

    # :nodoc:
    fun glEvalCoord1d(u : Float64) : Void

    # :nodoc:
    fun glEvalCoord1dv(u : Float64*) : Void

    # :nodoc:
    fun glEvalCoord1f(u : Float32) : Void

    # :nodoc:
    fun glEvalCoord1fv(u : Float32*) : Void

    # :nodoc:
    fun glEvalCoord2d(u : Float64, v : Float64) : Void

    # :nodoc:
    fun glEvalCoord2dv(u : Float64*) : Void

    # :nodoc:
    fun glEvalCoord2f(u : Float32, v : Float32) : Void

    # :nodoc:
    fun glEvalCoord2fv(u : Float32*) : Void

    # :nodoc:
    fun glEvalMesh1(mode : UInt32, i1 : Int32, i2 : Int32) : Void

    # :nodoc:
    fun glEvalMesh2(mode : UInt32, i1 : Int32, i2 : Int32, j1 : Int32, j2 : Int32) : Void

    # :nodoc:
    fun glEvalPoint1(i : Int32) : Void

    # :nodoc:
    fun glEvalPoint2(i : Int32, j : Int32) : Void

    # :nodoc:
    fun glFeedbackBuffer(size : Int32, type__ : UInt32, buffer : Float32*) : Void

    # :nodoc:
    fun glFinish : Void

    # :nodoc:
    fun glFlush : Void

    # :nodoc:
    fun glFogf(pname : UInt32, param1 : Float32) : Void

    # :nodoc:
    fun glFogfv(pname : UInt32, params : Float32*) : Void

    # :nodoc:
    fun glFogi(pname : UInt32, param1 : Int32) : Void

    # :nodoc:
    fun glFogiv(pname : UInt32, params : Int32*) : Void

    # :nodoc:
    fun glFrontFace(mode : UInt32) : Void

    # :nodoc:
    fun glFrustum(left : Float64, right : Float64, bottom : Float64, top : Float64, zNear : Float64, zFar : Float64) : Void

    # :nodoc:
    fun glGenLists(range : Int32) : UInt32

    # :nodoc:
    fun glGenTextures(n : Int32, textures : UInt32*) : Void

    # :nodoc:
    fun glGetBooleanv(pname : UInt32, params : UInt8*) : Void

    # :nodoc:
    fun glGetClipPlane(plane : UInt32, equation : Float64*) : Void

    # :nodoc:
    fun glGetDoublev(pname : UInt32, params : Float64*) : Void

    # :nodoc:
    fun glGetError : UInt32

    # :nodoc:
    fun glGetFloatv(pname : UInt32, params : Float32*) : Void

    # :nodoc:
    fun glGetIntegerv(pname : UInt32, params : Int32*) : Void

    # :nodoc:
    fun glGetLightfv(light : UInt32, pname : UInt32, params : Float32*) : Void

    # :nodoc:
    fun glGetLightiv(light : UInt32, pname : UInt32, params : Int32*) : Void

    # :nodoc:
    fun glGetMapdv(target : UInt32, query : UInt32, v : Float64*) : Void

    # :nodoc:
    fun glGetMapfv(target : UInt32, query : UInt32, v : Float32*) : Void

    # :nodoc:
    fun glGetMapiv(target : UInt32, query : UInt32, v : Int32*) : Void

    # :nodoc:
    fun glGetMaterialfv(face : UInt32, pname : UInt32, params : Float32*) : Void

    # :nodoc:
    fun glGetMaterialiv(face : UInt32, pname : UInt32, params : Int32*) : Void

    # :nodoc:
    fun glGetPixelMapfv(map : UInt32, values : Float32*) : Void

    # :nodoc:
    fun glGetPixelMapuiv(map : UInt32, values : UInt32*) : Void

    # :nodoc:
    fun glGetPixelMapusv(map : UInt32, values : UInt16*) : Void

    # :nodoc:
    fun glGetPointerv(pname : UInt32, params : Void**) : Void

    # :nodoc:
    fun glGetPolygonStipple(mask : UInt8*) : Void

    # :nodoc:
    fun glGetString(name : UInt32) : UInt8*

    # :nodoc:
    fun glGetTexEnvfv(target : UInt32, pname : UInt32, params : Float32*) : Void

    # :nodoc:
    fun glGetTexEnviv(target : UInt32, pname : UInt32, params : Int32*) : Void

    # :nodoc:
    fun glGetTexGendv(coord : UInt32, pname : UInt32, params : Float64*) : Void

    # :nodoc:
    fun glGetTexGenfv(coord : UInt32, pname : UInt32, params : Float32*) : Void

    # :nodoc:
    fun glGetTexGeniv(coord : UInt32, pname : UInt32, params : Int32*) : Void

    # :nodoc:
    fun glGetTexImage(target : UInt32, level : Int32, format : UInt32, type__ : UInt32, pixels : Void*) : Void

    # :nodoc:
    fun glGetTexLevelParameterfv(target : UInt32, level : Int32, pname : UInt32, params : Float32*) : Void

    # :nodoc:
    fun glGetTexLevelParameteriv(target : UInt32, level : Int32, pname : UInt32, params : Int32*) : Void

    # :nodoc:
    fun glGetTexParameterfv(target : UInt32, pname : UInt32, params : Float32*) : Void

    # :nodoc:
    fun glGetTexParameteriv(target : UInt32, pname : UInt32, params : Int32*) : Void

    # :nodoc:
    fun glHint(target : UInt32, mode : UInt32) : Void

    # :nodoc:
    fun glIndexMask(mask : UInt32) : Void

    # :nodoc:
    fun glIndexPointer(type__ : UInt32, stride : Int32, pointer : Void*) : Void

    # :nodoc:
    fun glIndexd(c : Float64) : Void

    # :nodoc:
    fun glIndexdv(c : Float64*) : Void

    # :nodoc:
    fun glIndexf(c : Float32) : Void

    # :nodoc:
    fun glIndexfv(c : Float32*) : Void

    # :nodoc:
    fun glIndexi(c : Int32) : Void

    # :nodoc:
    fun glIndexiv(c : Int32*) : Void

    # :nodoc:
    fun glIndexs(c : Int16) : Void

    # :nodoc:
    fun glIndexsv(c : Int16*) : Void

    # :nodoc:
    fun glIndexub(c : UInt8) : Void

    # :nodoc:
    fun glIndexubv(c : UInt8*) : Void

    # :nodoc:
    fun glInitNames : Void

    # :nodoc:
    fun glInterleavedArrays(format : UInt32, stride : Int32, pointer : Void*) : Void

    # :nodoc:
    fun glIsEnabled(cap : UInt32) : UInt8

    # :nodoc:
    fun glIsList(list : UInt32) : UInt8

    # :nodoc:
    fun glIsTexture(texture : UInt32) : UInt8

    # :nodoc:
    fun glLightModelf(pname : UInt32, param1 : Float32) : Void

    # :nodoc:
    fun glLightModelfv(pname : UInt32, params : Float32*) : Void

    # :nodoc:
    fun glLightModeli(pname : UInt32, param1 : Int32) : Void

    # :nodoc:
    fun glLightModeliv(pname : UInt32, params : Int32*) : Void

    # :nodoc:
    fun glLightf(light : UInt32, pname : UInt32, param2 : Float32) : Void

    # :nodoc:
    fun glLightfv(light : UInt32, pname : UInt32, params : Float32*) : Void

    # :nodoc:
    fun glLighti(light : UInt32, pname : UInt32, param2 : Int32) : Void

    # :nodoc:
    fun glLightiv(light : UInt32, pname : UInt32, params : Int32*) : Void

    # :nodoc:
    fun glLineStipple(factor : Int32, pattern : UInt16) : Void

    # :nodoc:
    fun glLineWidth(width : Float32) : Void

    # :nodoc:
    fun glListBase(base : UInt32) : Void

    # :nodoc:
    fun glLoadIdentity : Void

    # :nodoc:
    fun glLoadMatrixd(m : Float64*) : Void

    # :nodoc:
    fun glLoadMatrixf(m : Float32*) : Void

    # :nodoc:
    fun glLoadName(name : UInt32) : Void

    # :nodoc:
    fun glLogicOp(opcode : UInt32) : Void

    # :nodoc:
    fun glMap1d(target : UInt32, u1 : Float64, u2 : Float64, stride : Int32, order : Int32, points : Float64*) : Void

    # :nodoc:
    fun glMap1f(target : UInt32, u1 : Float32, u2 : Float32, stride : Int32, order : Int32, points : Float32*) : Void

    # :nodoc:
    fun glMap2d(target : UInt32, u1 : Float64, u2 : Float64, ustride : Int32, uorder : Int32, v1 : Float64, v2 : Float64, vstride : Int32, vorder : Int32, points : Float64*) : Void

    # :nodoc:
    fun glMap2f(target : UInt32, u1 : Float32, u2 : Float32, ustride : Int32, uorder : Int32, v1 : Float32, v2 : Float32, vstride : Int32, vorder : Int32, points : Float32*) : Void

    # :nodoc:
    fun glMapGrid1d(un : Int32, u1 : Float64, u2 : Float64) : Void

    # :nodoc:
    fun glMapGrid1f(un : Int32, u1 : Float32, u2 : Float32) : Void

    # :nodoc:
    fun glMapGrid2d(un : Int32, u1 : Float64, u2 : Float64, vn : Int32, v1 : Float64, v2 : Float64) : Void

    # :nodoc:
    fun glMapGrid2f(un : Int32, u1 : Float32, u2 : Float32, vn : Int32, v1 : Float32, v2 : Float32) : Void

    # :nodoc:
    fun glMaterialf(face : UInt32, pname : UInt32, param2 : Float32) : Void

    # :nodoc:
    fun glMaterialfv(face : UInt32, pname : UInt32, params : Float32*) : Void

    # :nodoc:
    fun glMateriali(face : UInt32, pname : UInt32, param2 : Int32) : Void

    # :nodoc:
    fun glMaterialiv(face : UInt32, pname : UInt32, params : Int32*) : Void

    # :nodoc:
    fun glMatrixMode(mode : UInt32) : Void

    # :nodoc:
    fun glMultMatrixd(m : Float64*) : Void

    # :nodoc:
    fun glMultMatrixf(m : Float32*) : Void

    # :nodoc:
    fun glNewList(list : UInt32, mode : UInt32) : Void

    # :nodoc:
    fun glNormal3b(nx : Int8, ny : Int8, nz : Int8) : Void

    # :nodoc:
    fun glNormal3bv(v : Int8*) : Void

    # :nodoc:
    fun glNormal3d(nx : Float64, ny : Float64, nz : Float64) : Void

    # :nodoc:
    fun glNormal3dv(v : Float64*) : Void

    # :nodoc:
    fun glNormal3f(nx : Float32, ny : Float32, nz : Float32) : Void

    # :nodoc:
    fun glNormal3fv(v : Float32*) : Void

    # :nodoc:
    fun glNormal3i(nx : Int32, ny : Int32, nz : Int32) : Void

    # :nodoc:
    fun glNormal3iv(v : Int32*) : Void

    # :nodoc:
    fun glNormal3s(nx : Int16, ny : Int16, nz : Int16) : Void

    # :nodoc:
    fun glNormal3sv(v : Int16*) : Void

    # :nodoc:
    fun glNormalPointer(type__ : UInt32, stride : Int32, pointer : Void*) : Void

    # :nodoc:
    fun glOrtho(left : Float64, right : Float64, bottom : Float64, top : Float64, zNear : Float64, zFar : Float64) : Void

    # :nodoc:
    fun glPassThrough(token : Float32) : Void

    # :nodoc:
    fun glPixelMapfv(map : UInt32, mapsize : Int32, values : Float32*) : Void

    # :nodoc:
    fun glPixelMapuiv(map : UInt32, mapsize : Int32, values : UInt32*) : Void

    # :nodoc:
    fun glPixelMapusv(map : UInt32, mapsize : Int32, values : UInt16*) : Void

    # :nodoc:
    fun glPixelStoref(pname : UInt32, param1 : Float32) : Void

    # :nodoc:
    fun glPixelStorei(pname : UInt32, param1 : Int32) : Void

    # :nodoc:
    fun glPixelTransferf(pname : UInt32, param1 : Float32) : Void

    # :nodoc:
    fun glPixelTransferi(pname : UInt32, param1 : Int32) : Void

    # :nodoc:
    fun glPixelZoom(xfactor : Float32, yfactor : Float32) : Void

    # :nodoc:
    fun glPointSize(size : Float32) : Void

    # :nodoc:
    fun glPolygonMode(face : UInt32, mode : UInt32) : Void

    # :nodoc:
    fun glPolygonOffset(factor : Float32, units : Float32) : Void

    # :nodoc:
    fun glPolygonStipple(mask : UInt8*) : Void

    # :nodoc:
    fun glPopAttrib : Void

    # :nodoc:
    fun glPopClientAttrib : Void

    # :nodoc:
    fun glPopMatrix : Void

    # :nodoc:
    fun glPopName : Void

    # :nodoc:
    fun glPrioritizeTextures(n : Int32, textures : UInt32*, priorities : Float32*) : Void

    # :nodoc:
    fun glPushAttrib(mask : UInt32) : Void

    # :nodoc:
    fun glPushClientAttrib(mask : UInt32) : Void

    # :nodoc:
    fun glPushMatrix : Void

    # :nodoc:
    fun glPushName(name : UInt32) : Void

    # :nodoc:
    fun glRasterPos2d(x : Float64, y : Float64) : Void

    # :nodoc:
    fun glRasterPos2dv(v : Float64*) : Void

    # :nodoc:
    fun glRasterPos2f(x : Float32, y : Float32) : Void

    # :nodoc:
    fun glRasterPos2fv(v : Float32*) : Void

    # :nodoc:
    fun glRasterPos2i(x : Int32, y : Int32) : Void

    # :nodoc:
    fun glRasterPos2iv(v : Int32*) : Void

    # :nodoc:
    fun glRasterPos2s(x : Int16, y : Int16) : Void

    # :nodoc:
    fun glRasterPos2sv(v : Int16*) : Void

    # :nodoc:
    fun glRasterPos3d(x : Float64, y : Float64, z : Float64) : Void

    # :nodoc:
    fun glRasterPos3dv(v : Float64*) : Void

    # :nodoc:
    fun glRasterPos3f(x : Float32, y : Float32, z : Float32) : Void

    # :nodoc:
    fun glRasterPos3fv(v : Float32*) : Void

    # :nodoc:
    fun glRasterPos3i(x : Int32, y : Int32, z : Int32) : Void

    # :nodoc:
    fun glRasterPos3iv(v : Int32*) : Void

    # :nodoc:
    fun glRasterPos3s(x : Int16, y : Int16, z : Int16) : Void

    # :nodoc:
    fun glRasterPos3sv(v : Int16*) : Void

    # :nodoc:
    fun glRasterPos4d(x : Float64, y : Float64, z : Float64, w : Float64) : Void

    # :nodoc:
    fun glRasterPos4dv(v : Float64*) : Void

    # :nodoc:
    fun glRasterPos4f(x : Float32, y : Float32, z : Float32, w : Float32) : Void

    # :nodoc:
    fun glRasterPos4fv(v : Float32*) : Void

    # :nodoc:
    fun glRasterPos4i(x : Int32, y : Int32, z : Int32, w : Int32) : Void

    # :nodoc:
    fun glRasterPos4iv(v : Int32*) : Void

    # :nodoc:
    fun glRasterPos4s(x : Int16, y : Int16, z : Int16, w : Int16) : Void

    # :nodoc:
    fun glRasterPos4sv(v : Int16*) : Void

    # :nodoc:
    fun glReadBuffer(mode : UInt32) : Void

    # :nodoc:
    fun glReadPixels(x : Int32, y : Int32, width : Int32, height : Int32, format : UInt32, type__ : UInt32, pixels : Void*) : Void

    # :nodoc:
    fun glRectd(x1 : Float64, y1 : Float64, x2 : Float64, y2 : Float64) : Void

    # :nodoc:
    fun glRectdv(v1 : Float64*, v2 : Float64*) : Void

    # :nodoc:
    fun glRectf(x1 : Float32, y1 : Float32, x2 : Float32, y2 : Float32) : Void

    # :nodoc:
    fun glRectfv(v1 : Float32*, v2 : Float32*) : Void

    # :nodoc:
    fun glRecti(x1 : Int32, y1 : Int32, x2 : Int32, y2 : Int32) : Void

    # :nodoc:
    fun glRectiv(v1 : Int32*, v2 : Int32*) : Void

    # :nodoc:
    fun glRects(x1 : Int16, y1 : Int16, x2 : Int16, y2 : Int16) : Void

    # :nodoc:
    fun glRectsv(v1 : Int16*, v2 : Int16*) : Void

    # :nodoc:
    fun glRenderMode(mode : UInt32) : Int32

    # :nodoc:
    fun glRotated(angle : Float64, x : Float64, y : Float64, z : Float64) : Void

    # :nodoc:
    fun glRotatef(angle : Float32, x : Float32, y : Float32, z : Float32) : Void

    # :nodoc:
    fun glScaled(x : Float64, y : Float64, z : Float64) : Void

    # :nodoc:
    fun glScalef(x : Float32, y : Float32, z : Float32) : Void

    # :nodoc:
    fun glScissor(x : Int32, y : Int32, width : Int32, height : Int32) : Void

    # :nodoc:
    fun glSelectBuffer(size : Int32, buffer : UInt32*) : Void

    # :nodoc:
    fun glShadeModel(mode : UInt32) : Void

    # :nodoc:
    fun glStencilFunc(func : UInt32, ref : Int32, mask : UInt32) : Void

    # :nodoc:
    fun glStencilMask(mask : UInt32) : Void

    # :nodoc:
    fun glStencilOp(fail : UInt32, zfail : UInt32, zpass : UInt32) : Void

    # :nodoc:
    fun glTexCoord1d(s : Float64) : Void

    # :nodoc:
    fun glTexCoord1dv(v : Float64*) : Void

    # :nodoc:
    fun glTexCoord1f(s : Float32) : Void

    # :nodoc:
    fun glTexCoord1fv(v : Float32*) : Void

    # :nodoc:
    fun glTexCoord1i(s : Int32) : Void

    # :nodoc:
    fun glTexCoord1iv(v : Int32*) : Void

    # :nodoc:
    fun glTexCoord1s(s : Int16) : Void

    # :nodoc:
    fun glTexCoord1sv(v : Int16*) : Void

    # :nodoc:
    fun glTexCoord2d(s : Float64, t : Float64) : Void

    # :nodoc:
    fun glTexCoord2dv(v : Float64*) : Void

    # :nodoc:
    fun glTexCoord2f(s : Float32, t : Float32) : Void

    # :nodoc:
    fun glTexCoord2fv(v : Float32*) : Void

    # :nodoc:
    fun glTexCoord2i(s : Int32, t : Int32) : Void

    # :nodoc:
    fun glTexCoord2iv(v : Int32*) : Void

    # :nodoc:
    fun glTexCoord2s(s : Int16, t : Int16) : Void

    # :nodoc:
    fun glTexCoord2sv(v : Int16*) : Void

    # :nodoc:
    fun glTexCoord3d(s : Float64, t : Float64, r : Float64) : Void

    # :nodoc:
    fun glTexCoord3dv(v : Float64*) : Void

    # :nodoc:
    fun glTexCoord3f(s : Float32, t : Float32, r : Float32) : Void

    # :nodoc:
    fun glTexCoord3fv(v : Float32*) : Void

    # :nodoc:
    fun glTexCoord3i(s : Int32, t : Int32, r : Int32) : Void

    # :nodoc:
    fun glTexCoord3iv(v : Int32*) : Void

    # :nodoc:
    fun glTexCoord3s(s : Int16, t : Int16, r : Int16) : Void

    # :nodoc:
    fun glTexCoord3sv(v : Int16*) : Void

    # :nodoc:
    fun glTexCoord4d(s : Float64, t : Float64, r : Float64, q : Float64) : Void

    # :nodoc:
    fun glTexCoord4dv(v : Float64*) : Void

    # :nodoc:
    fun glTexCoord4f(s : Float32, t : Float32, r : Float32, q : Float32) : Void

    # :nodoc:
    fun glTexCoord4fv(v : Float32*) : Void

    # :nodoc:
    fun glTexCoord4i(s : Int32, t : Int32, r : Int32, q : Int32) : Void

    # :nodoc:
    fun glTexCoord4iv(v : Int32*) : Void

    # :nodoc:
    fun glTexCoord4s(s : Int16, t : Int16, r : Int16, q : Int16) : Void

    # :nodoc:
    fun glTexCoord4sv(v : Int16*) : Void

    # :nodoc:
    fun glTexCoordPointer(size : Int32, type__ : UInt32, stride : Int32, pointer : Void*) : Void

    # :nodoc:
    fun glTexEnvf(target : UInt32, pname : UInt32, param2 : Float32) : Void

    # :nodoc:
    fun glTexEnvfv(target : UInt32, pname : UInt32, params : Float32*) : Void

    # :nodoc:
    fun glTexEnvi(target : UInt32, pname : UInt32, param2 : Int32) : Void

    # :nodoc:
    fun glTexEnviv(target : UInt32, pname : UInt32, params : Int32*) : Void

    # :nodoc:
    fun glTexGend(coord : UInt32, pname : UInt32, param2 : Float64) : Void

    # :nodoc:
    fun glTexGendv(coord : UInt32, pname : UInt32, params : Float64*) : Void

    # :nodoc:
    fun glTexGenf(coord : UInt32, pname : UInt32, param2 : Float32) : Void

    # :nodoc:
    fun glTexGenfv(coord : UInt32, pname : UInt32, params : Float32*) : Void

    # :nodoc:
    fun glTexGeni(coord : UInt32, pname : UInt32, param2 : Int32) : Void

    # :nodoc:
    fun glTexGeniv(coord : UInt32, pname : UInt32, params : Int32*) : Void

    # :nodoc:
    fun glTexImage1D(target : UInt32, level : Int32, internalformat : Int32, width : Int32, border : Int32, format : UInt32, type__ : UInt32, pixels : Void*) : Void

    # :nodoc:
    fun glTexImage2D(target : UInt32, level : Int32, internalformat : Int32, width : Int32, height : Int32, border : Int32, format : UInt32, type__ : UInt32, pixels : Void*) : Void

    # :nodoc:
    fun glTexParameterf(target : UInt32, pname : UInt32, param2 : Float32) : Void

    # :nodoc:
    fun glTexParameterfv(target : UInt32, pname : UInt32, params : Float32*) : Void

    # :nodoc:
    fun glTexParameteri(target : UInt32, pname : UInt32, param2 : Int32) : Void

    # :nodoc:
    fun glTexParameteriv(target : UInt32, pname : UInt32, params : Int32*) : Void

    # :nodoc:
    fun glTexSubImage1D(target : UInt32, level : Int32, xoffset : Int32, width : Int32, format : UInt32, type__ : UInt32, pixels : Void*) : Void

    # :nodoc:
    fun glTexSubImage2D(target : UInt32, level : Int32, xoffset : Int32, yoffset : Int32, width : Int32, height : Int32, format : UInt32, type__ : UInt32, pixels : Void*) : Void

    # :nodoc:
    fun glTranslated(x : Float64, y : Float64, z : Float64) : Void

    # :nodoc:
    fun glTranslatef(x : Float32, y : Float32, z : Float32) : Void

    # :nodoc:
    fun glVertex2d(x : Float64, y : Float64) : Void

    # :nodoc:
    fun glVertex2dv(v : Float64*) : Void

    # :nodoc:
    fun glVertex2f(x : Float32, y : Float32) : Void

    # :nodoc:
    fun glVertex2fv(v : Float32*) : Void

    # :nodoc:
    fun glVertex2i(x : Int32, y : Int32) : Void

    # :nodoc:
    fun glVertex2iv(v : Int32*) : Void

    # :nodoc:
    fun glVertex2s(x : Int16, y : Int16) : Void

    # :nodoc:
    fun glVertex2sv(v : Int16*) : Void

    # :nodoc:
    fun glVertex3d(x : Float64, y : Float64, z : Float64) : Void

    # :nodoc:
    fun glVertex3dv(v : Float64*) : Void

    # :nodoc:
    fun glVertex3f(x : Float32, y : Float32, z : Float32) : Void

    # :nodoc:
    fun glVertex3fv(v : Float32*) : Void

    # :nodoc:
    fun glVertex3i(x : Int32, y : Int32, z : Int32) : Void

    # :nodoc:
    fun glVertex3iv(v : Int32*) : Void

    # :nodoc:
    fun glVertex3s(x : Int16, y : Int16, z : Int16) : Void

    # :nodoc:
    fun glVertex3sv(v : Int16*) : Void

    # :nodoc:
    fun glVertex4d(x : Float64, y : Float64, z : Float64, w : Float64) : Void

    # :nodoc:
    fun glVertex4dv(v : Float64*) : Void

    # :nodoc:
    fun glVertex4f(x : Float32, y : Float32, z : Float32, w : Float32) : Void

    # :nodoc:
    fun glVertex4fv(v : Float32*) : Void

    # :nodoc:
    fun glVertex4i(x : Int32, y : Int32, z : Int32, w : Int32) : Void

    # :nodoc:
    fun glVertex4iv(v : Int32*) : Void

    # :nodoc:
    fun glVertex4s(x : Int16, y : Int16, z : Int16, w : Int16) : Void

    # :nodoc:
    fun glVertex4sv(v : Int16*) : Void

    # :nodoc:
    fun glVertexPointer(size : Int32, type__ : UInt32, stride : Int32, pointer : Void*) : Void

    # :nodoc:
    fun glViewport(x : Int32, y : Int32, width : Int32, height : Int32) : Void

    # :nodoc:
    fun gluErrorString(errCode : UInt32) : UInt8*

    # :nodoc:
    fun gluErrorUnicodeStringEXT(errCode : UInt32) : Win32cr::Foundation::PWSTR

    # :nodoc:
    fun gluGetString(name : UInt32) : UInt8*

    # :nodoc:
    fun gluOrtho2D(left : Float64, right : Float64, bottom : Float64, top : Float64) : Void

    # :nodoc:
    fun gluPerspective(fovy : Float64, aspect : Float64, zNear : Float64, zFar : Float64) : Void

    # :nodoc:
    fun gluPickMatrix(x : Float64, y : Float64, width : Float64, height : Float64, viewport : Int32*) : Void

    # :nodoc:
    fun gluLookAt(eyex : Float64, eyey : Float64, eyez : Float64, centerx : Float64, centery : Float64, centerz : Float64, upx : Float64, upy : Float64, upz : Float64) : Void

    # :nodoc:
    fun gluProject(objx : Float64, objy : Float64, objz : Float64, modelMatrix : Float64*, projMatrix : Float64*, viewport : Int32*, winx : Float64*, winy : Float64*, winz : Float64*) : Int32

    # :nodoc:
    fun gluUnProject(winx : Float64, winy : Float64, winz : Float64, modelMatrix : Float64*, projMatrix : Float64*, viewport : Int32*, objx : Float64*, objy : Float64*, objz : Float64*) : Int32

    # :nodoc:
    fun gluScaleImage(format : UInt32, widthin : Int32, heightin : Int32, typein : UInt32, datain : Void*, widthout : Int32, heightout : Int32, typeout : UInt32, dataout : Void*) : Int32

    # :nodoc:
    fun gluBuild1DMipmaps(target : UInt32, components : Int32, width : Int32, format : UInt32, type__ : UInt32, data : Void*) : Int32

    # :nodoc:
    fun gluBuild2DMipmaps(target : UInt32, components : Int32, width : Int32, height : Int32, format : UInt32, type__ : UInt32, data : Void*) : Int32

    # :nodoc:
    fun gluNewQuadric : Win32cr::Graphics::OpenGL::GLUquadric*

    # :nodoc:
    fun gluDeleteQuadric(state : Win32cr::Graphics::OpenGL::GLUquadric*) : Void

    # :nodoc:
    fun gluQuadricNormals(quadObject : Win32cr::Graphics::OpenGL::GLUquadric*, normals : UInt32) : Void

    # :nodoc:
    fun gluQuadricTexture(quadObject : Win32cr::Graphics::OpenGL::GLUquadric*, textureCoords : UInt8) : Void

    # :nodoc:
    fun gluQuadricOrientation(quadObject : Win32cr::Graphics::OpenGL::GLUquadric*, orientation : UInt32) : Void

    # :nodoc:
    fun gluQuadricDrawStyle(quadObject : Win32cr::Graphics::OpenGL::GLUquadric*, drawStyle : UInt32) : Void

    # :nodoc:
    fun gluCylinder(qobj : Win32cr::Graphics::OpenGL::GLUquadric*, baseRadius : Float64, topRadius : Float64, height : Float64, slices : Int32, stacks : Int32) : Void

    # :nodoc:
    fun gluDisk(qobj : Win32cr::Graphics::OpenGL::GLUquadric*, innerRadius : Float64, outerRadius : Float64, slices : Int32, loops : Int32) : Void

    # :nodoc:
    fun gluPartialDisk(qobj : Win32cr::Graphics::OpenGL::GLUquadric*, innerRadius : Float64, outerRadius : Float64, slices : Int32, loops : Int32, startAngle : Float64, sweepAngle : Float64) : Void

    # :nodoc:
    fun gluSphere(qobj : Win32cr::Graphics::OpenGL::GLUquadric*, radius : Float64, slices : Int32, stacks : Int32) : Void

    # :nodoc:
    fun gluQuadricCallback(qobj : Win32cr::Graphics::OpenGL::GLUquadric*, which : UInt32, fn : LibC::IntPtrT) : Void

    # :nodoc:
    fun gluNewTess : Win32cr::Graphics::OpenGL::GLUtesselator*

    # :nodoc:
    fun gluDeleteTess(tess : Win32cr::Graphics::OpenGL::GLUtesselator*) : Void

    # :nodoc:
    fun gluTessBeginPolygon(tess : Win32cr::Graphics::OpenGL::GLUtesselator*, polygon_data : Void*) : Void

    # :nodoc:
    fun gluTessBeginContour(tess : Win32cr::Graphics::OpenGL::GLUtesselator*) : Void

    # :nodoc:
    fun gluTessVertex(tess : Win32cr::Graphics::OpenGL::GLUtesselator*, coords : Float64*, data : Void*) : Void

    # :nodoc:
    fun gluTessEndContour(tess : Win32cr::Graphics::OpenGL::GLUtesselator*) : Void

    # :nodoc:
    fun gluTessEndPolygon(tess : Win32cr::Graphics::OpenGL::GLUtesselator*) : Void

    # :nodoc:
    fun gluTessProperty(tess : Win32cr::Graphics::OpenGL::GLUtesselator*, which : UInt32, value : Float64) : Void

    # :nodoc:
    fun gluTessNormal(tess : Win32cr::Graphics::OpenGL::GLUtesselator*, x : Float64, y : Float64, z : Float64) : Void

    # :nodoc:
    fun gluTessCallback(tess : Win32cr::Graphics::OpenGL::GLUtesselator*, which : UInt32, fn : LibC::IntPtrT) : Void

    # :nodoc:
    fun gluGetTessProperty(tess : Win32cr::Graphics::OpenGL::GLUtesselator*, which : UInt32, value : Float64*) : Void

    # :nodoc:
    fun gluNewNurbsRenderer : Win32cr::Graphics::OpenGL::GLUnurbs*

    # :nodoc:
    fun gluDeleteNurbsRenderer(nobj : Win32cr::Graphics::OpenGL::GLUnurbs*) : Void

    # :nodoc:
    fun gluBeginSurface(nobj : Win32cr::Graphics::OpenGL::GLUnurbs*) : Void

    # :nodoc:
    fun gluBeginCurve(nobj : Win32cr::Graphics::OpenGL::GLUnurbs*) : Void

    # :nodoc:
    fun gluEndCurve(nobj : Win32cr::Graphics::OpenGL::GLUnurbs*) : Void

    # :nodoc:
    fun gluEndSurface(nobj : Win32cr::Graphics::OpenGL::GLUnurbs*) : Void

    # :nodoc:
    fun gluBeginTrim(nobj : Win32cr::Graphics::OpenGL::GLUnurbs*) : Void

    # :nodoc:
    fun gluEndTrim(nobj : Win32cr::Graphics::OpenGL::GLUnurbs*) : Void

    # :nodoc:
    fun gluPwlCurve(nobj : Win32cr::Graphics::OpenGL::GLUnurbs*, count : Int32, array : Float32*, stride : Int32, type__ : UInt32) : Void

    # :nodoc:
    fun gluNurbsCurve(nobj : Win32cr::Graphics::OpenGL::GLUnurbs*, nknots : Int32, knot : Float32*, stride : Int32, ctlarray : Float32*, order : Int32, type__ : UInt32) : Void

    # :nodoc:
    fun gluNurbsSurface(nobj : Win32cr::Graphics::OpenGL::GLUnurbs*, sknot_count : Int32, sknot : Float32*, tknot_count : Int32, tknot : Float32*, s_stride : Int32, t_stride : Int32, ctlarray : Float32*, sorder : Int32, torder : Int32, type__ : UInt32) : Void

    # :nodoc:
    fun gluLoadSamplingMatrices(nobj : Win32cr::Graphics::OpenGL::GLUnurbs*, modelMatrix : Float32*, projMatrix : Float32*, viewport : Int32*) : Void

    # :nodoc:
    fun gluNurbsProperty(nobj : Win32cr::Graphics::OpenGL::GLUnurbs*, property : UInt32, value : Float32) : Void

    # :nodoc:
    fun gluGetNurbsProperty(nobj : Win32cr::Graphics::OpenGL::GLUnurbs*, property : UInt32, value : Float32*) : Void

    # :nodoc:
    fun gluNurbsCallback(nobj : Win32cr::Graphics::OpenGL::GLUnurbs*, which : UInt32, fn : LibC::IntPtrT) : Void

    # :nodoc:
    fun gluBeginPolygon(tess : Win32cr::Graphics::OpenGL::GLUtesselator*) : Void

    # :nodoc:
    fun gluNextContour(tess : Win32cr::Graphics::OpenGL::GLUtesselator*, type__ : UInt32) : Void

    # :nodoc:
    fun gluEndPolygon(tess : Win32cr::Graphics::OpenGL::GLUtesselator*) : Void

  end
end