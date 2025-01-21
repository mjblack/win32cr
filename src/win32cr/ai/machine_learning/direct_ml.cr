require "./../../foundation.cr"
require "./../../graphics/direct3_d12.cr"
require "./../../system/com.cr"

module Win32cr::AI::MachineLearning::DirectML
  DML_TARGET_VERSION = 16384_u32
  DML_TENSOR_DIMENSION_COUNT_MAX = 5_u32
  DML_TENSOR_DIMENSION_COUNT_MAX1 = 8_u32
  DML_TEMPORARY_BUFFER_ALIGNMENT = 256_u32
  DML_PERSISTENT_BUFFER_ALIGNMENT = 256_u32
  DML_MINIMUM_BUFFER_TENSOR_ALIGNMENT = 16_u32

  enum DML_TENSOR_DATA_TYPE
    DML_TENSOR_DATA_TYPE_UNKNOWN = 0_i32
    DML_TENSOR_DATA_TYPE_FLOAT32 = 1_i32
    DML_TENSOR_DATA_TYPE_FLOAT16 = 2_i32
    DML_TENSOR_DATA_TYPE_UINT32 = 3_i32
    DML_TENSOR_DATA_TYPE_UINT16 = 4_i32
    DML_TENSOR_DATA_TYPE_UINT8 = 5_i32
    DML_TENSOR_DATA_TYPE_INT32 = 6_i32
    DML_TENSOR_DATA_TYPE_INT16 = 7_i32
    DML_TENSOR_DATA_TYPE_INT8 = 8_i32
    DML_TENSOR_DATA_TYPE_FLOAT64 = 9_i32
    DML_TENSOR_DATA_TYPE_UINT64 = 10_i32
    DML_TENSOR_DATA_TYPE_INT64 = 11_i32
  end
  enum DML_TENSOR_TYPE
    DML_TENSOR_TYPE_INVALID = 0_i32
    DML_TENSOR_TYPE_BUFFER = 1_i32
  end
  @[Flags]
  enum DML_TENSOR_FLAGS : UInt32
    DML_TENSOR_FLAG_NONE = 0_u32
    DML_TENSOR_FLAG_OWNED_BY_DML = 1_u32
  end
  enum DML_OPERATOR_TYPE
    DML_OPERATOR_INVALID = 0_i32
    DML_OPERATOR_ELEMENT_WISE_IDENTITY = 1_i32
    DML_OPERATOR_ELEMENT_WISE_ABS = 2_i32
    DML_OPERATOR_ELEMENT_WISE_ACOS = 3_i32
    DML_OPERATOR_ELEMENT_WISE_ADD = 4_i32
    DML_OPERATOR_ELEMENT_WISE_ASIN = 5_i32
    DML_OPERATOR_ELEMENT_WISE_ATAN = 6_i32
    DML_OPERATOR_ELEMENT_WISE_CEIL = 7_i32
    DML_OPERATOR_ELEMENT_WISE_CLIP = 8_i32
    DML_OPERATOR_ELEMENT_WISE_COS = 9_i32
    DML_OPERATOR_ELEMENT_WISE_DIVIDE = 10_i32
    DML_OPERATOR_ELEMENT_WISE_EXP = 11_i32
    DML_OPERATOR_ELEMENT_WISE_FLOOR = 12_i32
    DML_OPERATOR_ELEMENT_WISE_LOG = 13_i32
    DML_OPERATOR_ELEMENT_WISE_LOGICAL_AND = 14_i32
    DML_OPERATOR_ELEMENT_WISE_LOGICAL_EQUALS = 15_i32
    DML_OPERATOR_ELEMENT_WISE_LOGICAL_GREATER_THAN = 16_i32
    DML_OPERATOR_ELEMENT_WISE_LOGICAL_LESS_THAN = 17_i32
    DML_OPERATOR_ELEMENT_WISE_LOGICAL_NOT = 18_i32
    DML_OPERATOR_ELEMENT_WISE_LOGICAL_OR = 19_i32
    DML_OPERATOR_ELEMENT_WISE_LOGICAL_XOR = 20_i32
    DML_OPERATOR_ELEMENT_WISE_MAX = 21_i32
    DML_OPERATOR_ELEMENT_WISE_MEAN = 22_i32
    DML_OPERATOR_ELEMENT_WISE_MIN = 23_i32
    DML_OPERATOR_ELEMENT_WISE_MULTIPLY = 24_i32
    DML_OPERATOR_ELEMENT_WISE_POW = 25_i32
    DML_OPERATOR_ELEMENT_WISE_CONSTANT_POW = 26_i32
    DML_OPERATOR_ELEMENT_WISE_RECIP = 27_i32
    DML_OPERATOR_ELEMENT_WISE_SIN = 28_i32
    DML_OPERATOR_ELEMENT_WISE_SQRT = 29_i32
    DML_OPERATOR_ELEMENT_WISE_SUBTRACT = 30_i32
    DML_OPERATOR_ELEMENT_WISE_TAN = 31_i32
    DML_OPERATOR_ELEMENT_WISE_THRESHOLD = 32_i32
    DML_OPERATOR_ELEMENT_WISE_QUANTIZE_LINEAR = 33_i32
    DML_OPERATOR_ELEMENT_WISE_DEQUANTIZE_LINEAR = 34_i32
    DML_OPERATOR_ACTIVATION_ELU = 35_i32
    DML_OPERATOR_ACTIVATION_HARDMAX = 36_i32
    DML_OPERATOR_ACTIVATION_HARD_SIGMOID = 37_i32
    DML_OPERATOR_ACTIVATION_IDENTITY = 38_i32
    DML_OPERATOR_ACTIVATION_LEAKY_RELU = 39_i32
    DML_OPERATOR_ACTIVATION_LINEAR = 40_i32
    DML_OPERATOR_ACTIVATION_LOG_SOFTMAX = 41_i32
    DML_OPERATOR_ACTIVATION_PARAMETERIZED_RELU = 42_i32
    DML_OPERATOR_ACTIVATION_PARAMETRIC_SOFTPLUS = 43_i32
    DML_OPERATOR_ACTIVATION_RELU = 44_i32
    DML_OPERATOR_ACTIVATION_SCALED_ELU = 45_i32
    DML_OPERATOR_ACTIVATION_SCALED_TANH = 46_i32
    DML_OPERATOR_ACTIVATION_SIGMOID = 47_i32
    DML_OPERATOR_ACTIVATION_SOFTMAX = 48_i32
    DML_OPERATOR_ACTIVATION_SOFTPLUS = 49_i32
    DML_OPERATOR_ACTIVATION_SOFTSIGN = 50_i32
    DML_OPERATOR_ACTIVATION_TANH = 51_i32
    DML_OPERATOR_ACTIVATION_THRESHOLDED_RELU = 52_i32
    DML_OPERATOR_CONVOLUTION = 53_i32
    DML_OPERATOR_GEMM = 54_i32
    DML_OPERATOR_REDUCE = 55_i32
    DML_OPERATOR_AVERAGE_POOLING = 56_i32
    DML_OPERATOR_LP_POOLING = 57_i32
    DML_OPERATOR_MAX_POOLING = 58_i32
    DML_OPERATOR_ROI_POOLING = 59_i32
    DML_OPERATOR_SLICE = 60_i32
    DML_OPERATOR_CAST = 61_i32
    DML_OPERATOR_SPLIT = 62_i32
    DML_OPERATOR_JOIN = 63_i32
    DML_OPERATOR_PADDING = 64_i32
    DML_OPERATOR_VALUE_SCALE_2D = 65_i32
    DML_OPERATOR_UPSAMPLE_2D = 66_i32
    DML_OPERATOR_GATHER = 67_i32
    DML_OPERATOR_SPACE_TO_DEPTH = 68_i32
    DML_OPERATOR_DEPTH_TO_SPACE = 69_i32
    DML_OPERATOR_TILE = 70_i32
    DML_OPERATOR_TOP_K = 71_i32
    DML_OPERATOR_BATCH_NORMALIZATION = 72_i32
    DML_OPERATOR_MEAN_VARIANCE_NORMALIZATION = 73_i32
    DML_OPERATOR_LOCAL_RESPONSE_NORMALIZATION = 74_i32
    DML_OPERATOR_LP_NORMALIZATION = 75_i32
    DML_OPERATOR_RNN = 76_i32
    DML_OPERATOR_LSTM = 77_i32
    DML_OPERATOR_GRU = 78_i32
    DML_OPERATOR_ELEMENT_WISE_SIGN = 79_i32
    DML_OPERATOR_ELEMENT_WISE_IS_NAN = 80_i32
    DML_OPERATOR_ELEMENT_WISE_ERF = 81_i32
    DML_OPERATOR_ELEMENT_WISE_SINH = 82_i32
    DML_OPERATOR_ELEMENT_WISE_COSH = 83_i32
    DML_OPERATOR_ELEMENT_WISE_TANH = 84_i32
    DML_OPERATOR_ELEMENT_WISE_ASINH = 85_i32
    DML_OPERATOR_ELEMENT_WISE_ACOSH = 86_i32
    DML_OPERATOR_ELEMENT_WISE_ATANH = 87_i32
    DML_OPERATOR_ELEMENT_WISE_IF = 88_i32
    DML_OPERATOR_ELEMENT_WISE_ADD1 = 89_i32
    DML_OPERATOR_ACTIVATION_SHRINK = 90_i32
    DML_OPERATOR_MAX_POOLING1 = 91_i32
    DML_OPERATOR_MAX_UNPOOLING = 92_i32
    DML_OPERATOR_DIAGONAL_MATRIX = 93_i32
    DML_OPERATOR_SCATTER_ELEMENTS = 94_i32
    DML_OPERATOR_SCATTER = 94_i32
    DML_OPERATOR_ONE_HOT = 95_i32
    DML_OPERATOR_RESAMPLE = 96_i32
    DML_OPERATOR_ELEMENT_WISE_BIT_SHIFT_LEFT = 97_i32
    DML_OPERATOR_ELEMENT_WISE_BIT_SHIFT_RIGHT = 98_i32
    DML_OPERATOR_ELEMENT_WISE_ROUND = 99_i32
    DML_OPERATOR_ELEMENT_WISE_IS_INFINITY = 100_i32
    DML_OPERATOR_ELEMENT_WISE_MODULUS_TRUNCATE = 101_i32
    DML_OPERATOR_ELEMENT_WISE_MODULUS_FLOOR = 102_i32
    DML_OPERATOR_FILL_VALUE_CONSTANT = 103_i32
    DML_OPERATOR_FILL_VALUE_SEQUENCE = 104_i32
    DML_OPERATOR_CUMULATIVE_SUMMATION = 105_i32
    DML_OPERATOR_REVERSE_SUBSEQUENCES = 106_i32
    DML_OPERATOR_GATHER_ELEMENTS = 107_i32
    DML_OPERATOR_GATHER_ND = 108_i32
    DML_OPERATOR_SCATTER_ND = 109_i32
    DML_OPERATOR_MAX_POOLING2 = 110_i32
    DML_OPERATOR_SLICE1 = 111_i32
    DML_OPERATOR_TOP_K1 = 112_i32
    DML_OPERATOR_DEPTH_TO_SPACE1 = 113_i32
    DML_OPERATOR_SPACE_TO_DEPTH1 = 114_i32
    DML_OPERATOR_MEAN_VARIANCE_NORMALIZATION1 = 115_i32
    DML_OPERATOR_RESAMPLE1 = 116_i32
    DML_OPERATOR_MATRIX_MULTIPLY_INTEGER = 117_i32
    DML_OPERATOR_QUANTIZED_LINEAR_MATRIX_MULTIPLY = 118_i32
    DML_OPERATOR_CONVOLUTION_INTEGER = 119_i32
    DML_OPERATOR_QUANTIZED_LINEAR_CONVOLUTION = 120_i32
    DML_OPERATOR_ELEMENT_WISE_BIT_AND = 121_i32
    DML_OPERATOR_ELEMENT_WISE_BIT_OR = 122_i32
    DML_OPERATOR_ELEMENT_WISE_BIT_XOR = 123_i32
    DML_OPERATOR_ELEMENT_WISE_BIT_NOT = 124_i32
    DML_OPERATOR_ELEMENT_WISE_BIT_COUNT = 125_i32
    DML_OPERATOR_ELEMENT_WISE_LOGICAL_GREATER_THAN_OR_EQUAL = 126_i32
    DML_OPERATOR_ELEMENT_WISE_LOGICAL_LESS_THAN_OR_EQUAL = 127_i32
    DML_OPERATOR_ACTIVATION_CELU = 128_i32
    DML_OPERATOR_ACTIVATION_RELU_GRAD = 129_i32
    DML_OPERATOR_AVERAGE_POOLING_GRAD = 130_i32
    DML_OPERATOR_MAX_POOLING_GRAD = 131_i32
    DML_OPERATOR_RANDOM_GENERATOR = 132_i32
    DML_OPERATOR_NONZERO_COORDINATES = 133_i32
    DML_OPERATOR_RESAMPLE_GRAD = 134_i32
    DML_OPERATOR_SLICE_GRAD = 135_i32
    DML_OPERATOR_ADAM_OPTIMIZER = 136_i32
    DML_OPERATOR_ARGMIN = 137_i32
    DML_OPERATOR_ARGMAX = 138_i32
    DML_OPERATOR_ROI_ALIGN = 139_i32
    DML_OPERATOR_GATHER_ND1 = 140_i32
    DML_OPERATOR_ELEMENT_WISE_ATAN_YX = 141_i32
    DML_OPERATOR_ELEMENT_WISE_CLIP_GRAD = 142_i32
    DML_OPERATOR_ELEMENT_WISE_DIFFERENCE_SQUARE = 143_i32
    DML_OPERATOR_LOCAL_RESPONSE_NORMALIZATION_GRAD = 144_i32
    DML_OPERATOR_CUMULATIVE_PRODUCT = 145_i32
    DML_OPERATOR_BATCH_NORMALIZATION_GRAD = 146_i32
    DML_OPERATOR_ELEMENT_WISE_QUANTIZED_LINEAR_ADD = 147_i32
    DML_OPERATOR_DYNAMIC_QUANTIZE_LINEAR = 148_i32
    DML_OPERATOR_ROI_ALIGN1 = 149_i32
  end
  enum DML_REDUCE_FUNCTION
    DML_REDUCE_FUNCTION_ARGMAX = 0_i32
    DML_REDUCE_FUNCTION_ARGMIN = 1_i32
    DML_REDUCE_FUNCTION_AVERAGE = 2_i32
    DML_REDUCE_FUNCTION_L1 = 3_i32
    DML_REDUCE_FUNCTION_L2 = 4_i32
    DML_REDUCE_FUNCTION_LOG_SUM = 5_i32
    DML_REDUCE_FUNCTION_LOG_SUM_EXP = 6_i32
    DML_REDUCE_FUNCTION_MAX = 7_i32
    DML_REDUCE_FUNCTION_MIN = 8_i32
    DML_REDUCE_FUNCTION_MULTIPLY = 9_i32
    DML_REDUCE_FUNCTION_SUM = 10_i32
    DML_REDUCE_FUNCTION_SUM_SQUARE = 11_i32
  end
  enum DML_MATRIX_TRANSFORM
    DML_MATRIX_TRANSFORM_NONE = 0_i32
    DML_MATRIX_TRANSFORM_TRANSPOSE = 1_i32
  end
  enum DML_CONVOLUTION_MODE
    DML_CONVOLUTION_MODE_CONVOLUTION = 0_i32
    DML_CONVOLUTION_MODE_CROSS_CORRELATION = 1_i32
  end
  enum DML_CONVOLUTION_DIRECTION
    DML_CONVOLUTION_DIRECTION_FORWARD = 0_i32
    DML_CONVOLUTION_DIRECTION_BACKWARD = 1_i32
  end
  enum DML_PADDING_MODE
    DML_PADDING_MODE_CONSTANT = 0_i32
    DML_PADDING_MODE_EDGE = 1_i32
    DML_PADDING_MODE_REFLECTION = 2_i32
    DML_PADDING_MODE_SYMMETRIC = 3_i32
  end
  enum DML_INTERPOLATION_MODE
    DML_INTERPOLATION_MODE_NEAREST_NEIGHBOR = 0_i32
    DML_INTERPOLATION_MODE_LINEAR = 1_i32
  end
  enum DML_RECURRENT_NETWORK_DIRECTION
    DML_RECURRENT_NETWORK_DIRECTION_FORWARD = 0_i32
    DML_RECURRENT_NETWORK_DIRECTION_BACKWARD = 1_i32
    DML_RECURRENT_NETWORK_DIRECTION_BIDIRECTIONAL = 2_i32
  end
  enum DML_ROUNDING_MODE
    DML_ROUNDING_MODE_HALVES_TO_NEAREST_EVEN = 0_i32
    DML_ROUNDING_MODE_TOWARD_ZERO = 1_i32
    DML_ROUNDING_MODE_TOWARD_INFINITY = 2_i32
  end
  enum DML_IS_INFINITY_MODE
    DML_IS_INFINITY_MODE_EITHER = 0_i32
    DML_IS_INFINITY_MODE_POSITIVE = 1_i32
    DML_IS_INFINITY_MODE_NEGATIVE = 2_i32
  end
  enum DML_AXIS_DIRECTION
    DML_AXIS_DIRECTION_INCREASING = 0_i32
    DML_AXIS_DIRECTION_DECREASING = 1_i32
  end
  enum DML_DEPTH_SPACE_ORDER
    DML_DEPTH_SPACE_ORDER_DEPTH_COLUMN_ROW = 0_i32
    DML_DEPTH_SPACE_ORDER_COLUMN_ROW_DEPTH = 1_i32
  end
  enum DML_RANDOM_GENERATOR_TYPE
    DML_RANDOM_GENERATOR_TYPE_PHILOX_4X32_10 = 0_i32
  end
  enum DML_FEATURE_LEVEL
    DML_FEATURE_LEVEL_1_0 = 4096_i32
    DML_FEATURE_LEVEL_2_0 = 8192_i32
    DML_FEATURE_LEVEL_2_1 = 8448_i32
    DML_FEATURE_LEVEL_3_0 = 12288_i32
    DML_FEATURE_LEVEL_3_1 = 12544_i32
    DML_FEATURE_LEVEL_4_0 = 16384_i32
  end
  enum DML_FEATURE
    DML_FEATURE_TENSOR_DATA_TYPE_SUPPORT = 0_i32
    DML_FEATURE_FEATURE_LEVELS = 1_i32
  end
  @[Flags]
  enum DML_EXECUTION_FLAGS : UInt32
    DML_EXECUTION_FLAG_NONE = 0_u32
    DML_EXECUTION_FLAG_ALLOW_HALF_PRECISION_COMPUTATION = 1_u32
    DML_EXECUTION_FLAG_DISABLE_META_COMMANDS = 2_u32
    DML_EXECUTION_FLAG_DESCRIPTORS_VOLATILE = 4_u32
  end
  @[Flags]
  enum DML_CREATE_DEVICE_FLAGS : UInt32
    DML_CREATE_DEVICE_FLAG_NONE = 0_u32
    DML_CREATE_DEVICE_FLAG_DEBUG = 1_u32
  end
  enum DML_BINDING_TYPE
    DML_BINDING_TYPE_NONE = 0_i32
    DML_BINDING_TYPE_BUFFER = 1_i32
    DML_BINDING_TYPE_BUFFER_ARRAY = 2_i32
  end
  enum DML_GRAPH_EDGE_TYPE
    DML_GRAPH_EDGE_TYPE_INVALID = 0_i32
    DML_GRAPH_EDGE_TYPE_INPUT = 1_i32
    DML_GRAPH_EDGE_TYPE_OUTPUT = 2_i32
    DML_GRAPH_EDGE_TYPE_INTERMEDIATE = 3_i32
  end
  enum DML_GRAPH_NODE_TYPE
    DML_GRAPH_NODE_TYPE_INVALID = 0_i32
    DML_GRAPH_NODE_TYPE_OPERATOR = 1_i32
  end

  @[Extern]
  record DML_BUFFER_TENSOR_DESC,
    data_type : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DATA_TYPE,
    flags : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_FLAGS,
    dimension_count : UInt32,
    sizes : UInt32*,
    strides : UInt32*,
    total_tensor_size_in_bytes : UInt64,
    guaranteed_base_offset_alignment : UInt32

  @[Extern]
  record DML_TENSOR_DESC,
    type__ : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_TYPE,
    desc : Void*

  @[Extern]
  record DML_SCALE_BIAS,
    scale : Float32,
    bias : Float32

  @[Extern]
  record DML_SIZE_2D,
    width : UInt32,
    height : UInt32

  @[Extern(union: true)]
  record DML_SCALAR_UNION,
    bytes : UInt8[8],
    int8 : Int8,
    u_int8 : UInt8,
    int16 : Int16,
    u_int16 : UInt16,
    int32 : Int32,
    u_int32 : UInt32,
    int64 : Int64,
    u_int64 : UInt64,
    float32 : Float32,
    float64 : Float64

  @[Extern]
  record DML_OPERATOR_DESC,
    type__ : Win32cr::AI::MachineLearning::DirectML::DML_OPERATOR_TYPE,
    desc : Void*

  @[Extern]
  record DML_ELEMENT_WISE_IDENTITY_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    scale_bias : Win32cr::AI::MachineLearning::DirectML::DML_SCALE_BIAS*

  @[Extern]
  record DML_ELEMENT_WISE_ABS_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    scale_bias : Win32cr::AI::MachineLearning::DirectML::DML_SCALE_BIAS*

  @[Extern]
  record DML_ELEMENT_WISE_ACOS_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    scale_bias : Win32cr::AI::MachineLearning::DirectML::DML_SCALE_BIAS*

  @[Extern]
  record DML_ELEMENT_WISE_ADD_OPERATOR_DESC,
    a_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    b_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_ELEMENT_WISE_ADD1_OPERATOR_DESC,
    a_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    b_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    fused_activation : Win32cr::AI::MachineLearning::DirectML::DML_OPERATOR_DESC*

  @[Extern]
  record DML_ELEMENT_WISE_ASIN_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    scale_bias : Win32cr::AI::MachineLearning::DirectML::DML_SCALE_BIAS*

  @[Extern]
  record DML_ELEMENT_WISE_ATAN_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    scale_bias : Win32cr::AI::MachineLearning::DirectML::DML_SCALE_BIAS*

  @[Extern]
  record DML_ELEMENT_WISE_CEIL_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    scale_bias : Win32cr::AI::MachineLearning::DirectML::DML_SCALE_BIAS*

  @[Extern]
  record DML_ELEMENT_WISE_CLIP_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    scale_bias : Win32cr::AI::MachineLearning::DirectML::DML_SCALE_BIAS*,
    min : Float32,
    max : Float32

  @[Extern]
  record DML_ELEMENT_WISE_COS_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    scale_bias : Win32cr::AI::MachineLearning::DirectML::DML_SCALE_BIAS*

  @[Extern]
  record DML_ELEMENT_WISE_DIVIDE_OPERATOR_DESC,
    a_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    b_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_ELEMENT_WISE_EXP_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    scale_bias : Win32cr::AI::MachineLearning::DirectML::DML_SCALE_BIAS*

  @[Extern]
  record DML_ELEMENT_WISE_FLOOR_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    scale_bias : Win32cr::AI::MachineLearning::DirectML::DML_SCALE_BIAS*

  @[Extern]
  record DML_ELEMENT_WISE_LOG_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    scale_bias : Win32cr::AI::MachineLearning::DirectML::DML_SCALE_BIAS*

  @[Extern]
  record DML_ELEMENT_WISE_LOGICAL_AND_OPERATOR_DESC,
    a_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    b_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_ELEMENT_WISE_LOGICAL_EQUALS_OPERATOR_DESC,
    a_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    b_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_ELEMENT_WISE_LOGICAL_GREATER_THAN_OPERATOR_DESC,
    a_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    b_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_ELEMENT_WISE_LOGICAL_LESS_THAN_OPERATOR_DESC,
    a_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    b_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_ELEMENT_WISE_LOGICAL_NOT_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_ELEMENT_WISE_LOGICAL_OR_OPERATOR_DESC,
    a_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    b_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_ELEMENT_WISE_LOGICAL_XOR_OPERATOR_DESC,
    a_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    b_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_ELEMENT_WISE_MAX_OPERATOR_DESC,
    a_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    b_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_ELEMENT_WISE_MEAN_OPERATOR_DESC,
    a_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    b_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_ELEMENT_WISE_MIN_OPERATOR_DESC,
    a_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    b_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_ELEMENT_WISE_MULTIPLY_OPERATOR_DESC,
    a_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    b_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_ELEMENT_WISE_POW_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    exponent_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    scale_bias : Win32cr::AI::MachineLearning::DirectML::DML_SCALE_BIAS*

  @[Extern]
  record DML_ELEMENT_WISE_CONSTANT_POW_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    scale_bias : Win32cr::AI::MachineLearning::DirectML::DML_SCALE_BIAS*,
    exponent : Float32

  @[Extern]
  record DML_ELEMENT_WISE_RECIP_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    scale_bias : Win32cr::AI::MachineLearning::DirectML::DML_SCALE_BIAS*

  @[Extern]
  record DML_ELEMENT_WISE_SIN_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    scale_bias : Win32cr::AI::MachineLearning::DirectML::DML_SCALE_BIAS*

  @[Extern]
  record DML_ELEMENT_WISE_SQRT_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    scale_bias : Win32cr::AI::MachineLearning::DirectML::DML_SCALE_BIAS*

  @[Extern]
  record DML_ELEMENT_WISE_SUBTRACT_OPERATOR_DESC,
    a_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    b_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_ELEMENT_WISE_TAN_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    scale_bias : Win32cr::AI::MachineLearning::DirectML::DML_SCALE_BIAS*

  @[Extern]
  record DML_ELEMENT_WISE_THRESHOLD_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    scale_bias : Win32cr::AI::MachineLearning::DirectML::DML_SCALE_BIAS*,
    min : Float32

  @[Extern]
  record DML_ELEMENT_WISE_QUANTIZE_LINEAR_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    scale_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    zero_point_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_ELEMENT_WISE_DEQUANTIZE_LINEAR_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    scale_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    zero_point_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_ACTIVATION_ELU_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    alpha : Float32

  @[Extern]
  record DML_ACTIVATION_HARDMAX_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_ACTIVATION_HARD_SIGMOID_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    alpha : Float32,
    beta : Float32

  @[Extern]
  record DML_ACTIVATION_IDENTITY_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_ACTIVATION_LEAKY_RELU_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    alpha : Float32

  @[Extern]
  record DML_ACTIVATION_LINEAR_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    alpha : Float32,
    beta : Float32

  @[Extern]
  record DML_ACTIVATION_LOG_SOFTMAX_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_ACTIVATION_PARAMETERIZED_RELU_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    slope_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_ACTIVATION_PARAMETRIC_SOFTPLUS_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    alpha : Float32,
    beta : Float32

  @[Extern]
  record DML_ACTIVATION_RELU_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_ACTIVATION_SCALED_ELU_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    alpha : Float32,
    gamma : Float32

  @[Extern]
  record DML_ACTIVATION_SCALED_TANH_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    alpha : Float32,
    beta : Float32

  @[Extern]
  record DML_ACTIVATION_SIGMOID_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_ACTIVATION_SOFTMAX_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_ACTIVATION_SOFTPLUS_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    steepness : Float32

  @[Extern]
  record DML_ACTIVATION_SOFTSIGN_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_ACTIVATION_TANH_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_ACTIVATION_THRESHOLDED_RELU_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    alpha : Float32

  @[Extern]
  record DML_CONVOLUTION_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    filter_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    bias_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    mode : Win32cr::AI::MachineLearning::DirectML::DML_CONVOLUTION_MODE,
    direction : Win32cr::AI::MachineLearning::DirectML::DML_CONVOLUTION_DIRECTION,
    dimension_count : UInt32,
    strides : UInt32*,
    dilations : UInt32*,
    start_padding : UInt32*,
    end_padding : UInt32*,
    output_padding : UInt32*,
    group_count : UInt32,
    fused_activation : Win32cr::AI::MachineLearning::DirectML::DML_OPERATOR_DESC*

  @[Extern]
  record DML_GEMM_OPERATOR_DESC,
    a_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    b_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    c_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    trans_a : Win32cr::AI::MachineLearning::DirectML::DML_MATRIX_TRANSFORM,
    trans_b : Win32cr::AI::MachineLearning::DirectML::DML_MATRIX_TRANSFORM,
    alpha : Float32,
    beta : Float32,
    fused_activation : Win32cr::AI::MachineLearning::DirectML::DML_OPERATOR_DESC*

  @[Extern]
  record DML_REDUCE_OPERATOR_DESC,
    function : Win32cr::AI::MachineLearning::DirectML::DML_REDUCE_FUNCTION,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    axis_count : UInt32,
    axes : UInt32*

  @[Extern]
  record DML_AVERAGE_POOLING_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    dimension_count : UInt32,
    strides : UInt32*,
    window_size : UInt32*,
    start_padding : UInt32*,
    end_padding : UInt32*,
    include_padding : Win32cr::Foundation::BOOL

  @[Extern]
  record DML_LP_POOLING_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    dimension_count : UInt32,
    strides : UInt32*,
    window_size : UInt32*,
    start_padding : UInt32*,
    end_padding : UInt32*,
    p : UInt32

  @[Extern]
  record DML_MAX_POOLING_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    dimension_count : UInt32,
    strides : UInt32*,
    window_size : UInt32*,
    start_padding : UInt32*,
    end_padding : UInt32*

  @[Extern]
  record DML_ROI_POOLING_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    roi_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    spatial_scale : Float32,
    pooled_size : Win32cr::AI::MachineLearning::DirectML::DML_SIZE_2D

  @[Extern]
  record DML_SLICE_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    dimension_count : UInt32,
    offsets : UInt32*,
    sizes : UInt32*,
    strides : UInt32*

  @[Extern]
  record DML_CAST_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_SPLIT_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_count : UInt32,
    output_tensors : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    axis : UInt32

  @[Extern]
  record DML_JOIN_OPERATOR_DESC,
    input_count : UInt32,
    input_tensors : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    axis : UInt32

  @[Extern]
  record DML_PADDING_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    padding_mode : Win32cr::AI::MachineLearning::DirectML::DML_PADDING_MODE,
    padding_value : Float32,
    dimension_count : UInt32,
    start_padding : UInt32*,
    end_padding : UInt32*

  @[Extern]
  record DML_VALUE_SCALE_2D_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    scale : Float32,
    channel_count : UInt32,
    bias : Float32*

  @[Extern]
  record DML_UPSAMPLE_2D_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    scale_size : Win32cr::AI::MachineLearning::DirectML::DML_SIZE_2D,
    interpolation_mode : Win32cr::AI::MachineLearning::DirectML::DML_INTERPOLATION_MODE

  @[Extern]
  record DML_GATHER_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    indices_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    axis : UInt32,
    index_dimensions : UInt32

  @[Extern]
  record DML_SPACE_TO_DEPTH_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    block_size : UInt32

  @[Extern]
  record DML_DEPTH_TO_SPACE_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    block_size : UInt32

  @[Extern]
  record DML_TILE_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    repeats_count : UInt32,
    repeats : UInt32*

  @[Extern]
  record DML_TOP_K_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_value_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_index_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    axis : UInt32,
    k : UInt32

  @[Extern]
  record DML_BATCH_NORMALIZATION_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    mean_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    variance_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    scale_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    bias_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    spatial : Win32cr::Foundation::BOOL,
    epsilon : Float32,
    fused_activation : Win32cr::AI::MachineLearning::DirectML::DML_OPERATOR_DESC*

  @[Extern]
  record DML_MEAN_VARIANCE_NORMALIZATION_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    scale_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    bias_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    cross_channel : Win32cr::Foundation::BOOL,
    normalize_variance : Win32cr::Foundation::BOOL,
    epsilon : Float32,
    fused_activation : Win32cr::AI::MachineLearning::DirectML::DML_OPERATOR_DESC*

  @[Extern]
  record DML_LOCAL_RESPONSE_NORMALIZATION_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    cross_channel : Win32cr::Foundation::BOOL,
    local_size : UInt32,
    alpha : Float32,
    beta : Float32,
    bias : Float32

  @[Extern]
  record DML_LP_NORMALIZATION_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    axis : UInt32,
    epsilon : Float32,
    p : UInt32

  @[Extern]
  record DML_RNN_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    weight_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    recurrence_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    bias_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    hidden_init_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    sequence_lengths_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_sequence_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_single_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    activation_desc_count : UInt32,
    activation_descs : Win32cr::AI::MachineLearning::DirectML::DML_OPERATOR_DESC*,
    direction : Win32cr::AI::MachineLearning::DirectML::DML_RECURRENT_NETWORK_DIRECTION

  @[Extern]
  record DML_LSTM_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    weight_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    recurrence_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    bias_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    hidden_init_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    cell_mem_init_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    sequence_lengths_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    peephole_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_sequence_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_single_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_cell_single_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    activation_desc_count : UInt32,
    activation_descs : Win32cr::AI::MachineLearning::DirectML::DML_OPERATOR_DESC*,
    direction : Win32cr::AI::MachineLearning::DirectML::DML_RECURRENT_NETWORK_DIRECTION,
    clip_threshold : Float32,
    use_clip_threshold : Win32cr::Foundation::BOOL,
    couple_input_forget : Win32cr::Foundation::BOOL

  @[Extern]
  record DML_GRU_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    weight_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    recurrence_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    bias_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    hidden_init_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    sequence_lengths_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_sequence_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_single_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    activation_desc_count : UInt32,
    activation_descs : Win32cr::AI::MachineLearning::DirectML::DML_OPERATOR_DESC*,
    direction : Win32cr::AI::MachineLearning::DirectML::DML_RECURRENT_NETWORK_DIRECTION,
    linear_before_reset : Win32cr::Foundation::BOOL

  @[Extern]
  record DML_ELEMENT_WISE_SIGN_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_ELEMENT_WISE_IS_NAN_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_ELEMENT_WISE_ERF_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    scale_bias : Win32cr::AI::MachineLearning::DirectML::DML_SCALE_BIAS*

  @[Extern]
  record DML_ELEMENT_WISE_SINH_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    scale_bias : Win32cr::AI::MachineLearning::DirectML::DML_SCALE_BIAS*

  @[Extern]
  record DML_ELEMENT_WISE_COSH_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    scale_bias : Win32cr::AI::MachineLearning::DirectML::DML_SCALE_BIAS*

  @[Extern]
  record DML_ELEMENT_WISE_TANH_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    scale_bias : Win32cr::AI::MachineLearning::DirectML::DML_SCALE_BIAS*

  @[Extern]
  record DML_ELEMENT_WISE_ASINH_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    scale_bias : Win32cr::AI::MachineLearning::DirectML::DML_SCALE_BIAS*

  @[Extern]
  record DML_ELEMENT_WISE_ACOSH_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    scale_bias : Win32cr::AI::MachineLearning::DirectML::DML_SCALE_BIAS*

  @[Extern]
  record DML_ELEMENT_WISE_ATANH_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    scale_bias : Win32cr::AI::MachineLearning::DirectML::DML_SCALE_BIAS*

  @[Extern]
  record DML_ELEMENT_WISE_IF_OPERATOR_DESC,
    condition_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    a_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    b_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_ACTIVATION_SHRINK_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    bias : Float32,
    threshold : Float32

  @[Extern]
  record DML_MAX_POOLING1_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_indices_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    dimension_count : UInt32,
    strides : UInt32*,
    window_size : UInt32*,
    start_padding : UInt32*,
    end_padding : UInt32*

  @[Extern]
  record DML_MAX_UNPOOLING_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    indices_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_DIAGONAL_MATRIX_OPERATOR_DESC,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    offset : Int32,
    value : Float32

  @[Extern]
  record DML_SCATTER_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    indices_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    updates_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    axis : UInt32

  @[Extern]
  record DML_ONE_HOT_OPERATOR_DESC,
    indices_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    values_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    axis : UInt32

  @[Extern]
  record DML_RESAMPLE_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    interpolation_mode : Win32cr::AI::MachineLearning::DirectML::DML_INTERPOLATION_MODE,
    scale_count : UInt32,
    scales : Float32*

  @[Extern]
  record DML_ELEMENT_WISE_BIT_SHIFT_LEFT_OPERATOR_DESC,
    a_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    b_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_ELEMENT_WISE_BIT_SHIFT_RIGHT_OPERATOR_DESC,
    a_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    b_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_ELEMENT_WISE_ROUND_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    rounding_mode : Win32cr::AI::MachineLearning::DirectML::DML_ROUNDING_MODE

  @[Extern]
  record DML_ELEMENT_WISE_IS_INFINITY_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    infinity_mode : Win32cr::AI::MachineLearning::DirectML::DML_IS_INFINITY_MODE

  @[Extern]
  record DML_ELEMENT_WISE_MODULUS_TRUNCATE_OPERATOR_DESC,
    a_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    b_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_ELEMENT_WISE_MODULUS_FLOOR_OPERATOR_DESC,
    a_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    b_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_FILL_VALUE_CONSTANT_OPERATOR_DESC,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    value_data_type : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DATA_TYPE,
    value : Win32cr::AI::MachineLearning::DirectML::DML_SCALAR_UNION

  @[Extern]
  record DML_FILL_VALUE_SEQUENCE_OPERATOR_DESC,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    value_data_type : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DATA_TYPE,
    value_start : Win32cr::AI::MachineLearning::DirectML::DML_SCALAR_UNION,
    value_delta : Win32cr::AI::MachineLearning::DirectML::DML_SCALAR_UNION

  @[Extern]
  record DML_CUMULATIVE_SUMMATION_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    axis : UInt32,
    axis_direction : Win32cr::AI::MachineLearning::DirectML::DML_AXIS_DIRECTION,
    has_exclusive_sum : Win32cr::Foundation::BOOL

  @[Extern]
  record DML_REVERSE_SUBSEQUENCES_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    sequence_lengths_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    axis : UInt32

  @[Extern]
  record DML_GATHER_ELEMENTS_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    indices_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    axis : UInt32

  @[Extern]
  record DML_GATHER_ND_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    indices_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    input_dimension_count : UInt32,
    indices_dimension_count : UInt32

  @[Extern]
  record DML_SCATTER_ND_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    indices_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    updates_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    input_dimension_count : UInt32,
    indices_dimension_count : UInt32

  @[Extern]
  record DML_MAX_POOLING2_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_indices_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    dimension_count : UInt32,
    strides : UInt32*,
    window_size : UInt32*,
    start_padding : UInt32*,
    end_padding : UInt32*,
    dilations : UInt32*

  @[Extern]
  record DML_SLICE1_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    dimension_count : UInt32,
    input_window_offsets : UInt32*,
    input_window_sizes : UInt32*,
    input_window_strides : Int32*

  @[Extern]
  record DML_TOP_K1_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_value_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_index_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    axis : UInt32,
    k : UInt32,
    axis_direction : Win32cr::AI::MachineLearning::DirectML::DML_AXIS_DIRECTION

  @[Extern]
  record DML_DEPTH_TO_SPACE1_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    block_size : UInt32,
    order : Win32cr::AI::MachineLearning::DirectML::DML_DEPTH_SPACE_ORDER

  @[Extern]
  record DML_SPACE_TO_DEPTH1_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    block_size : UInt32,
    order : Win32cr::AI::MachineLearning::DirectML::DML_DEPTH_SPACE_ORDER

  @[Extern]
  record DML_MEAN_VARIANCE_NORMALIZATION1_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    scale_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    bias_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    axis_count : UInt32,
    axes : UInt32*,
    normalize_variance : Win32cr::Foundation::BOOL,
    epsilon : Float32,
    fused_activation : Win32cr::AI::MachineLearning::DirectML::DML_OPERATOR_DESC*

  @[Extern]
  record DML_RESAMPLE1_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    interpolation_mode : Win32cr::AI::MachineLearning::DirectML::DML_INTERPOLATION_MODE,
    dimension_count : UInt32,
    scales : Float32*,
    input_pixel_offsets : Float32*,
    output_pixel_offsets : Float32*

  @[Extern]
  record DML_MATRIX_MULTIPLY_INTEGER_OPERATOR_DESC,
    a_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    a_zero_point_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    b_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    b_zero_point_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_QUANTIZED_LINEAR_MATRIX_MULTIPLY_OPERATOR_DESC,
    a_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    a_scale_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    a_zero_point_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    b_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    b_scale_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    b_zero_point_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_scale_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_zero_point_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_CONVOLUTION_INTEGER_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    input_zero_point_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    filter_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    filter_zero_point_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    dimension_count : UInt32,
    strides : UInt32*,
    dilations : UInt32*,
    start_padding : UInt32*,
    end_padding : UInt32*,
    group_count : UInt32

  @[Extern]
  record DML_QUANTIZED_LINEAR_CONVOLUTION_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    input_scale_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    input_zero_point_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    filter_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    filter_scale_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    filter_zero_point_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    bias_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_scale_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_zero_point_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    dimension_count : UInt32,
    strides : UInt32*,
    dilations : UInt32*,
    start_padding : UInt32*,
    end_padding : UInt32*,
    group_count : UInt32

  @[Extern]
  record DML_ELEMENT_WISE_BIT_AND_OPERATOR_DESC,
    a_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    b_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_ELEMENT_WISE_BIT_OR_OPERATOR_DESC,
    a_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    b_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_ELEMENT_WISE_BIT_XOR_OPERATOR_DESC,
    a_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    b_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_ELEMENT_WISE_BIT_NOT_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_ELEMENT_WISE_BIT_COUNT_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_ELEMENT_WISE_LOGICAL_GREATER_THAN_OR_EQUAL_OPERATOR_DESC,
    a_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    b_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_ELEMENT_WISE_LOGICAL_LESS_THAN_OR_EQUAL_OPERATOR_DESC,
    a_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    b_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_ACTIVATION_CELU_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    alpha : Float32

  @[Extern]
  record DML_ACTIVATION_RELU_GRAD_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    input_gradient_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_gradient_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_AVERAGE_POOLING_GRAD_OPERATOR_DESC,
    input_gradient_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_gradient_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    dimension_count : UInt32,
    strides : UInt32*,
    window_size : UInt32*,
    start_padding : UInt32*,
    end_padding : UInt32*,
    include_padding : Win32cr::Foundation::BOOL

  @[Extern]
  record DML_MAX_POOLING_GRAD_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    input_gradient_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_gradient_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    dimension_count : UInt32,
    strides : UInt32*,
    window_size : UInt32*,
    start_padding : UInt32*,
    end_padding : UInt32*,
    dilations : UInt32*

  @[Extern]
  record DML_RANDOM_GENERATOR_OPERATOR_DESC,
    input_state_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_state_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    type__ : Win32cr::AI::MachineLearning::DirectML::DML_RANDOM_GENERATOR_TYPE

  @[Extern]
  record DML_NONZERO_COORDINATES_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_count_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_coordinates_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_RESAMPLE_GRAD_OPERATOR_DESC,
    input_gradient_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_gradient_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    interpolation_mode : Win32cr::AI::MachineLearning::DirectML::DML_INTERPOLATION_MODE,
    dimension_count : UInt32,
    scales : Float32*,
    input_pixel_offsets : Float32*,
    output_pixel_offsets : Float32*

  @[Extern]
  record DML_SLICE_GRAD_OPERATOR_DESC,
    input_gradient_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_gradient_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    dimension_count : UInt32,
    input_window_offsets : UInt32*,
    input_window_sizes : UInt32*,
    input_window_strides : Int32*

  @[Extern]
  record DML_ADAM_OPTIMIZER_OPERATOR_DESC,
    input_parameters_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    input_first_moment_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    input_second_moment_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    gradient_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    training_step_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_parameters_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_first_moment_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_second_moment_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    learning_rate : Float32,
    beta1 : Float32,
    beta2 : Float32,
    epsilon : Float32

  @[Extern]
  record DML_ARGMIN_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    axis_count : UInt32,
    axes : UInt32*,
    axis_direction : Win32cr::AI::MachineLearning::DirectML::DML_AXIS_DIRECTION

  @[Extern]
  record DML_ARGMAX_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    axis_count : UInt32,
    axes : UInt32*,
    axis_direction : Win32cr::AI::MachineLearning::DirectML::DML_AXIS_DIRECTION

  @[Extern]
  record DML_ROI_ALIGN_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    roi_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    batch_indices_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    reduction_function : Win32cr::AI::MachineLearning::DirectML::DML_REDUCE_FUNCTION,
    interpolation_mode : Win32cr::AI::MachineLearning::DirectML::DML_INTERPOLATION_MODE,
    spatial_scale_x : Float32,
    spatial_scale_y : Float32,
    out_of_bounds_input_value : Float32,
    minimum_samples_per_output : UInt32,
    maximum_samples_per_output : UInt32

  @[Extern]
  record DML_GATHER_ND1_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    indices_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    input_dimension_count : UInt32,
    indices_dimension_count : UInt32,
    batch_dimension_count : UInt32

  @[Extern]
  record DML_ELEMENT_WISE_ATAN_YX_OPERATOR_DESC,
    a_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    b_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_ELEMENT_WISE_CLIP_GRAD_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    input_gradient_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_gradient_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    min : Float32,
    max : Float32

  @[Extern]
  record DML_ELEMENT_WISE_DIFFERENCE_SQUARE_OPERATOR_DESC,
    a_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    b_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_LOCAL_RESPONSE_NORMALIZATION_GRAD_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    input_gradient_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_gradient_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    cross_channel : Win32cr::Foundation::BOOL,
    local_size : UInt32,
    alpha : Float32,
    beta : Float32,
    bias : Float32

  @[Extern]
  record DML_CUMULATIVE_PRODUCT_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    axis : UInt32,
    axis_direction : Win32cr::AI::MachineLearning::DirectML::DML_AXIS_DIRECTION,
    has_exclusive_product : Win32cr::Foundation::BOOL

  @[Extern]
  record DML_BATCH_NORMALIZATION_GRAD_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    input_gradient_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    mean_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    variance_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    scale_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_gradient_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_scale_gradient_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_bias_gradient_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    epsilon : Float32

  @[Extern]
  record DML_ELEMENT_WISE_QUANTIZED_LINEAR_ADD_OPERATOR_DESC,
    a_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    a_scale_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    a_zero_point_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    b_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    b_scale_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    b_zero_point_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_scale_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_zero_point_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_DYNAMIC_QUANTIZE_LINEAR_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_scale_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_zero_point_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*

  @[Extern]
  record DML_ROI_ALIGN1_OPERATOR_DESC,
    input_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    roi_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    batch_indices_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    output_tensor : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DESC*,
    reduction_function : Win32cr::AI::MachineLearning::DirectML::DML_REDUCE_FUNCTION,
    interpolation_mode : Win32cr::AI::MachineLearning::DirectML::DML_INTERPOLATION_MODE,
    spatial_scale_x : Float32,
    spatial_scale_y : Float32,
    input_pixel_offset : Float32,
    output_pixel_offset : Float32,
    out_of_bounds_input_value : Float32,
    minimum_samples_per_output : UInt32,
    maximum_samples_per_output : UInt32,
    align_regions_to_corners : Win32cr::Foundation::BOOL

  @[Extern]
  record DML_FEATURE_QUERY_TENSOR_DATA_TYPE_SUPPORT,
    data_type : Win32cr::AI::MachineLearning::DirectML::DML_TENSOR_DATA_TYPE

  @[Extern]
  record DML_FEATURE_DATA_TENSOR_DATA_TYPE_SUPPORT,
    is_supported : Win32cr::Foundation::BOOL

  @[Extern]
  record DML_FEATURE_QUERY_FEATURE_LEVELS,
    requested_feature_level_count : UInt32,
    requested_feature_levels : Win32cr::AI::MachineLearning::DirectML::DML_FEATURE_LEVEL*

  @[Extern]
  record DML_FEATURE_DATA_FEATURE_LEVELS,
    max_supported_feature_level : Win32cr::AI::MachineLearning::DirectML::DML_FEATURE_LEVEL

  @[Extern]
  record DML_BINDING_TABLE_DESC,
    dispatchable : Void*,
    cpu_descriptor_handle : Win32cr::Graphics::Direct3D12::D3D12_CPU_DESCRIPTOR_HANDLE,
    gpu_descriptor_handle : Win32cr::Graphics::Direct3D12::D3D12_GPU_DESCRIPTOR_HANDLE,
    size_in_descriptors : UInt32

  @[Extern]
  record DML_BINDING_PROPERTIES,
    required_descriptor_count : UInt32,
    temporary_resource_size : UInt64,
    persistent_resource_size : UInt64

  @[Extern]
  record DML_BINDING_DESC,
    type__ : Win32cr::AI::MachineLearning::DirectML::DML_BINDING_TYPE,
    desc : Void*

  @[Extern]
  record DML_BUFFER_BINDING,
    buffer : Void*,
    offset : UInt64,
    size_in_bytes : UInt64

  @[Extern]
  record DML_BUFFER_ARRAY_BINDING,
    binding_count : UInt32,
    bindings : Win32cr::AI::MachineLearning::DirectML::DML_BUFFER_BINDING*

  @[Extern]
  record DML_GRAPH_EDGE_DESC,
    type__ : Win32cr::AI::MachineLearning::DirectML::DML_GRAPH_EDGE_TYPE,
    desc : Void*

  @[Extern]
  record DML_INPUT_GRAPH_EDGE_DESC,
    graph_input_index : UInt32,
    to_node_index : UInt32,
    to_node_input_index : UInt32,
    name : Win32cr::Foundation::PSTR

  @[Extern]
  record DML_OUTPUT_GRAPH_EDGE_DESC,
    from_node_index : UInt32,
    from_node_output_index : UInt32,
    graph_output_index : UInt32,
    name : Win32cr::Foundation::PSTR

  @[Extern]
  record DML_INTERMEDIATE_GRAPH_EDGE_DESC,
    from_node_index : UInt32,
    from_node_output_index : UInt32,
    to_node_index : UInt32,
    to_node_input_index : UInt32,
    name : Win32cr::Foundation::PSTR

  @[Extern]
  record DML_GRAPH_NODE_DESC,
    type__ : Win32cr::AI::MachineLearning::DirectML::DML_GRAPH_NODE_TYPE,
    desc : Void*

  @[Extern]
  record DML_OPERATOR_GRAPH_NODE_DESC,
    operator : Void*,
    name : Win32cr::Foundation::PSTR

  @[Extern]
  record DML_GRAPH_DESC,
    input_count : UInt32,
    output_count : UInt32,
    node_count : UInt32,
    nodes : Win32cr::AI::MachineLearning::DirectML::DML_GRAPH_NODE_DESC*,
    input_edge_count : UInt32,
    input_edges : Win32cr::AI::MachineLearning::DirectML::DML_GRAPH_EDGE_DESC*,
    output_edge_count : UInt32,
    output_edges : Win32cr::AI::MachineLearning::DirectML::DML_GRAPH_EDGE_DESC*,
    intermediate_edge_count : UInt32,
    intermediate_edges : Win32cr::AI::MachineLearning::DirectML::DML_GRAPH_EDGE_DESC*

  @[Extern]
  record IDMLObjectVtbl,
    query_interface : Proc(IDMLObject*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDMLObject*, UInt32),
    release : Proc(IDMLObject*, UInt32),
    get_private_data : Proc(IDMLObject*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    set_private_data : Proc(IDMLObject*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDMLObject*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    set_name : Proc(IDMLObject*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c8263aac-9e0c-4a2d-9b8e-007521a3317c")]
  record IDMLObject, lpVtbl : IDMLObjectVtbl* do
    GUID = LibC::GUID.new(0xc8263aac_u32, 0x9e0c_u16, 0x4a2d_u16, StaticArray[0x9b_u8, 0x8e_u8, 0x0_u8, 0x75_u8, 0x21_u8, 0xa3_u8, 0x31_u8, 0x7c_u8])
    def query_interface(this : IDMLObject*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDMLObject*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDMLObject*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_private_data(this : IDMLObject*, guid : LibC::GUID*, dataSize : UInt32*, data : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, guid, dataSize, data)
    end
    def set_private_data(this : IDMLObject*, guid : LibC::GUID*, dataSize : UInt32, data : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, guid, dataSize, data)
    end
    def set_private_data_interface(this : IDMLObject*, guid : LibC::GUID*, data : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, guid, data)
    end
    def set_name(this : IDMLObject*, name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_name.call(this, name)
    end

  end

  @[Extern]
  record IDMLDeviceVtbl,
    query_interface : Proc(IDMLDevice*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDMLDevice*, UInt32),
    release : Proc(IDMLDevice*, UInt32),
    get_private_data : Proc(IDMLDevice*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    set_private_data : Proc(IDMLDevice*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDMLDevice*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    set_name : Proc(IDMLDevice*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    check_feature_support : Proc(IDMLDevice*, Win32cr::AI::MachineLearning::DirectML::DML_FEATURE, UInt32, Void*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    create_operator : Proc(IDMLDevice*, Win32cr::AI::MachineLearning::DirectML::DML_OPERATOR_DESC*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    compile_operator : Proc(IDMLDevice*, Void*, Win32cr::AI::MachineLearning::DirectML::DML_EXECUTION_FLAGS, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    create_operator_initializer : Proc(IDMLDevice*, UInt32, Void**, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    create_command_recorder : Proc(IDMLDevice*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    create_binding_table : Proc(IDMLDevice*, Win32cr::AI::MachineLearning::DirectML::DML_BINDING_TABLE_DESC*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    evict : Proc(IDMLDevice*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    make_resident : Proc(IDMLDevice*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_device_removed_reason : Proc(IDMLDevice*, Win32cr::Foundation::HRESULT),
    get_parent_device : Proc(IDMLDevice*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6dbd6437-96fd-423f-a98c-ae5e7c2a573f")]
  record IDMLDevice, lpVtbl : IDMLDeviceVtbl* do
    GUID = LibC::GUID.new(0x6dbd6437_u32, 0x96fd_u16, 0x423f_u16, StaticArray[0xa9_u8, 0x8c_u8, 0xae_u8, 0x5e_u8, 0x7c_u8, 0x2a_u8, 0x57_u8, 0x3f_u8])
    def query_interface(this : IDMLDevice*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDMLDevice*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDMLDevice*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_private_data(this : IDMLDevice*, guid : LibC::GUID*, dataSize : UInt32*, data : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, guid, dataSize, data)
    end
    def set_private_data(this : IDMLDevice*, guid : LibC::GUID*, dataSize : UInt32, data : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, guid, dataSize, data)
    end
    def set_private_data_interface(this : IDMLDevice*, guid : LibC::GUID*, data : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, guid, data)
    end
    def set_name(this : IDMLDevice*, name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_name.call(this, name)
    end
    def check_feature_support(this : IDMLDevice*, feature : Win32cr::AI::MachineLearning::DirectML::DML_FEATURE, featureQueryDataSize : UInt32, featureQueryData : Void*, featureSupportDataSize : UInt32, featureSupportData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.check_feature_support.call(this, feature, featureQueryDataSize, featureQueryData, featureSupportDataSize, featureSupportData)
    end
    def create_operator(this : IDMLDevice*, desc : Win32cr::AI::MachineLearning::DirectML::DML_OPERATOR_DESC*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_operator.call(this, desc, riid, ppv)
    end
    def compile_operator(this : IDMLDevice*, op : Void*, flags : Win32cr::AI::MachineLearning::DirectML::DML_EXECUTION_FLAGS, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compile_operator.call(this, op, flags, riid, ppv)
    end
    def create_operator_initializer(this : IDMLDevice*, operatorCount : UInt32, operators : Void**, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_operator_initializer.call(this, operatorCount, operators, riid, ppv)
    end
    def create_command_recorder(this : IDMLDevice*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_command_recorder.call(this, riid, ppv)
    end
    def create_binding_table(this : IDMLDevice*, desc : Win32cr::AI::MachineLearning::DirectML::DML_BINDING_TABLE_DESC*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_binding_table.call(this, desc, riid, ppv)
    end
    def evict(this : IDMLDevice*, count : UInt32, ppObjects : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.evict.call(this, count, ppObjects)
    end
    def make_resident(this : IDMLDevice*, count : UInt32, ppObjects : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.make_resident.call(this, count, ppObjects)
    end
    def get_device_removed_reason(this : IDMLDevice*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_removed_reason.call(this)
    end
    def get_parent_device(this : IDMLDevice*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent_device.call(this, riid, ppv)
    end

  end

  @[Extern]
  record IDMLDeviceChildVtbl,
    query_interface : Proc(IDMLDeviceChild*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDMLDeviceChild*, UInt32),
    release : Proc(IDMLDeviceChild*, UInt32),
    get_private_data : Proc(IDMLDeviceChild*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    set_private_data : Proc(IDMLDeviceChild*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDMLDeviceChild*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    set_name : Proc(IDMLDeviceChild*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_device : Proc(IDMLDeviceChild*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("27e83142-8165-49e3-974e-2fd66e4cb69d")]
  record IDMLDeviceChild, lpVtbl : IDMLDeviceChildVtbl* do
    GUID = LibC::GUID.new(0x27e83142_u32, 0x8165_u16, 0x49e3_u16, StaticArray[0x97_u8, 0x4e_u8, 0x2f_u8, 0xd6_u8, 0x6e_u8, 0x4c_u8, 0xb6_u8, 0x9d_u8])
    def query_interface(this : IDMLDeviceChild*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDMLDeviceChild*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDMLDeviceChild*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_private_data(this : IDMLDeviceChild*, guid : LibC::GUID*, dataSize : UInt32*, data : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, guid, dataSize, data)
    end
    def set_private_data(this : IDMLDeviceChild*, guid : LibC::GUID*, dataSize : UInt32, data : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, guid, dataSize, data)
    end
    def set_private_data_interface(this : IDMLDeviceChild*, guid : LibC::GUID*, data : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, guid, data)
    end
    def set_name(this : IDMLDeviceChild*, name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_name.call(this, name)
    end
    def get_device(this : IDMLDeviceChild*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device.call(this, riid, ppv)
    end

  end

  @[Extern]
  record IDMLPageableVtbl,
    query_interface : Proc(IDMLPageable*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDMLPageable*, UInt32),
    release : Proc(IDMLPageable*, UInt32),
    get_private_data : Proc(IDMLPageable*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    set_private_data : Proc(IDMLPageable*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDMLPageable*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    set_name : Proc(IDMLPageable*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_device : Proc(IDMLPageable*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("b1ab0825-4542-4a4b-8617-6dde6e8f6201")]
  record IDMLPageable, lpVtbl : IDMLPageableVtbl* do
    GUID = LibC::GUID.new(0xb1ab0825_u32, 0x4542_u16, 0x4a4b_u16, StaticArray[0x86_u8, 0x17_u8, 0x6d_u8, 0xde_u8, 0x6e_u8, 0x8f_u8, 0x62_u8, 0x1_u8])
    def query_interface(this : IDMLPageable*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDMLPageable*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDMLPageable*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_private_data(this : IDMLPageable*, guid : LibC::GUID*, dataSize : UInt32*, data : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, guid, dataSize, data)
    end
    def set_private_data(this : IDMLPageable*, guid : LibC::GUID*, dataSize : UInt32, data : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, guid, dataSize, data)
    end
    def set_private_data_interface(this : IDMLPageable*, guid : LibC::GUID*, data : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, guid, data)
    end
    def set_name(this : IDMLPageable*, name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_name.call(this, name)
    end
    def get_device(this : IDMLPageable*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device.call(this, riid, ppv)
    end

  end

  @[Extern]
  record IDMLOperatorVtbl,
    query_interface : Proc(IDMLOperator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDMLOperator*, UInt32),
    release : Proc(IDMLOperator*, UInt32),
    get_private_data : Proc(IDMLOperator*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    set_private_data : Proc(IDMLOperator*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDMLOperator*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    set_name : Proc(IDMLOperator*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_device : Proc(IDMLOperator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("26caae7a-3081-4633-9581-226fbe57695d")]
  record IDMLOperator, lpVtbl : IDMLOperatorVtbl* do
    GUID = LibC::GUID.new(0x26caae7a_u32, 0x3081_u16, 0x4633_u16, StaticArray[0x95_u8, 0x81_u8, 0x22_u8, 0x6f_u8, 0xbe_u8, 0x57_u8, 0x69_u8, 0x5d_u8])
    def query_interface(this : IDMLOperator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDMLOperator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDMLOperator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_private_data(this : IDMLOperator*, guid : LibC::GUID*, dataSize : UInt32*, data : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, guid, dataSize, data)
    end
    def set_private_data(this : IDMLOperator*, guid : LibC::GUID*, dataSize : UInt32, data : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, guid, dataSize, data)
    end
    def set_private_data_interface(this : IDMLOperator*, guid : LibC::GUID*, data : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, guid, data)
    end
    def set_name(this : IDMLOperator*, name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_name.call(this, name)
    end
    def get_device(this : IDMLOperator*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device.call(this, riid, ppv)
    end

  end

  @[Extern]
  record IDMLDispatchableVtbl,
    query_interface : Proc(IDMLDispatchable*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDMLDispatchable*, UInt32),
    release : Proc(IDMLDispatchable*, UInt32),
    get_private_data : Proc(IDMLDispatchable*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    set_private_data : Proc(IDMLDispatchable*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDMLDispatchable*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    set_name : Proc(IDMLDispatchable*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_device : Proc(IDMLDispatchable*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_binding_properties : Proc(IDMLDispatchable*, Win32cr::AI::MachineLearning::DirectML::DML_BINDING_PROPERTIES)


  @[Extern]
  #@[Com("dcb821a8-1039-441e-9f1c-b1759c2f3cec")]
  record IDMLDispatchable, lpVtbl : IDMLDispatchableVtbl* do
    GUID = LibC::GUID.new(0xdcb821a8_u32, 0x1039_u16, 0x441e_u16, StaticArray[0x9f_u8, 0x1c_u8, 0xb1_u8, 0x75_u8, 0x9c_u8, 0x2f_u8, 0x3c_u8, 0xec_u8])
    def query_interface(this : IDMLDispatchable*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDMLDispatchable*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDMLDispatchable*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_private_data(this : IDMLDispatchable*, guid : LibC::GUID*, dataSize : UInt32*, data : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, guid, dataSize, data)
    end
    def set_private_data(this : IDMLDispatchable*, guid : LibC::GUID*, dataSize : UInt32, data : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, guid, dataSize, data)
    end
    def set_private_data_interface(this : IDMLDispatchable*, guid : LibC::GUID*, data : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, guid, data)
    end
    def set_name(this : IDMLDispatchable*, name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_name.call(this, name)
    end
    def get_device(this : IDMLDispatchable*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device.call(this, riid, ppv)
    end
    def get_binding_properties(this : IDMLDispatchable*) : Win32cr::AI::MachineLearning::DirectML::DML_BINDING_PROPERTIES
      @lpVtbl.try &.value.get_binding_properties.call(this)
    end

  end

  @[Extern]
  record IDMLCompiledOperatorVtbl,
    query_interface : Proc(IDMLCompiledOperator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDMLCompiledOperator*, UInt32),
    release : Proc(IDMLCompiledOperator*, UInt32),
    get_private_data : Proc(IDMLCompiledOperator*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    set_private_data : Proc(IDMLCompiledOperator*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDMLCompiledOperator*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    set_name : Proc(IDMLCompiledOperator*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_device : Proc(IDMLCompiledOperator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_binding_properties : Proc(IDMLCompiledOperator*, Win32cr::AI::MachineLearning::DirectML::DML_BINDING_PROPERTIES)


  @[Extern]
  #@[Com("6b15e56a-bf5c-4902-92d8-da3a650afea4")]
  record IDMLCompiledOperator, lpVtbl : IDMLCompiledOperatorVtbl* do
    GUID = LibC::GUID.new(0x6b15e56a_u32, 0xbf5c_u16, 0x4902_u16, StaticArray[0x92_u8, 0xd8_u8, 0xda_u8, 0x3a_u8, 0x65_u8, 0xa_u8, 0xfe_u8, 0xa4_u8])
    def query_interface(this : IDMLCompiledOperator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDMLCompiledOperator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDMLCompiledOperator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_private_data(this : IDMLCompiledOperator*, guid : LibC::GUID*, dataSize : UInt32*, data : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, guid, dataSize, data)
    end
    def set_private_data(this : IDMLCompiledOperator*, guid : LibC::GUID*, dataSize : UInt32, data : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, guid, dataSize, data)
    end
    def set_private_data_interface(this : IDMLCompiledOperator*, guid : LibC::GUID*, data : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, guid, data)
    end
    def set_name(this : IDMLCompiledOperator*, name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_name.call(this, name)
    end
    def get_device(this : IDMLCompiledOperator*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device.call(this, riid, ppv)
    end
    def get_binding_properties(this : IDMLCompiledOperator*) : Win32cr::AI::MachineLearning::DirectML::DML_BINDING_PROPERTIES
      @lpVtbl.try &.value.get_binding_properties.call(this)
    end

  end

  @[Extern]
  record IDMLOperatorInitializerVtbl,
    query_interface : Proc(IDMLOperatorInitializer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDMLOperatorInitializer*, UInt32),
    release : Proc(IDMLOperatorInitializer*, UInt32),
    get_private_data : Proc(IDMLOperatorInitializer*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    set_private_data : Proc(IDMLOperatorInitializer*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDMLOperatorInitializer*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    set_name : Proc(IDMLOperatorInitializer*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_device : Proc(IDMLOperatorInitializer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_binding_properties : Proc(IDMLOperatorInitializer*, Win32cr::AI::MachineLearning::DirectML::DML_BINDING_PROPERTIES),
    reset : Proc(IDMLOperatorInitializer*, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("427c1113-435c-469c-8676-4d5dd072f813")]
  record IDMLOperatorInitializer, lpVtbl : IDMLOperatorInitializerVtbl* do
    GUID = LibC::GUID.new(0x427c1113_u32, 0x435c_u16, 0x469c_u16, StaticArray[0x86_u8, 0x76_u8, 0x4d_u8, 0x5d_u8, 0xd0_u8, 0x72_u8, 0xf8_u8, 0x13_u8])
    def query_interface(this : IDMLOperatorInitializer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDMLOperatorInitializer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDMLOperatorInitializer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_private_data(this : IDMLOperatorInitializer*, guid : LibC::GUID*, dataSize : UInt32*, data : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, guid, dataSize, data)
    end
    def set_private_data(this : IDMLOperatorInitializer*, guid : LibC::GUID*, dataSize : UInt32, data : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, guid, dataSize, data)
    end
    def set_private_data_interface(this : IDMLOperatorInitializer*, guid : LibC::GUID*, data : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, guid, data)
    end
    def set_name(this : IDMLOperatorInitializer*, name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_name.call(this, name)
    end
    def get_device(this : IDMLOperatorInitializer*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device.call(this, riid, ppv)
    end
    def get_binding_properties(this : IDMLOperatorInitializer*) : Win32cr::AI::MachineLearning::DirectML::DML_BINDING_PROPERTIES
      @lpVtbl.try &.value.get_binding_properties.call(this)
    end
    def reset(this : IDMLOperatorInitializer*, operatorCount : UInt32, operators : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this, operatorCount, operators)
    end

  end

  @[Extern]
  record IDMLBindingTableVtbl,
    query_interface : Proc(IDMLBindingTable*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDMLBindingTable*, UInt32),
    release : Proc(IDMLBindingTable*, UInt32),
    get_private_data : Proc(IDMLBindingTable*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    set_private_data : Proc(IDMLBindingTable*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDMLBindingTable*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    set_name : Proc(IDMLBindingTable*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_device : Proc(IDMLBindingTable*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    bind_inputs : Proc(IDMLBindingTable*, UInt32, Win32cr::AI::MachineLearning::DirectML::DML_BINDING_DESC*, Void),
    bind_outputs : Proc(IDMLBindingTable*, UInt32, Win32cr::AI::MachineLearning::DirectML::DML_BINDING_DESC*, Void),
    bind_temporary_resource : Proc(IDMLBindingTable*, Win32cr::AI::MachineLearning::DirectML::DML_BINDING_DESC*, Void),
    bind_persistent_resource : Proc(IDMLBindingTable*, Win32cr::AI::MachineLearning::DirectML::DML_BINDING_DESC*, Void),
    reset : Proc(IDMLBindingTable*, Win32cr::AI::MachineLearning::DirectML::DML_BINDING_TABLE_DESC*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("29c687dc-de74-4e3b-ab00-1168f2fc3cfc")]
  record IDMLBindingTable, lpVtbl : IDMLBindingTableVtbl* do
    GUID = LibC::GUID.new(0x29c687dc_u32, 0xde74_u16, 0x4e3b_u16, StaticArray[0xab_u8, 0x0_u8, 0x11_u8, 0x68_u8, 0xf2_u8, 0xfc_u8, 0x3c_u8, 0xfc_u8])
    def query_interface(this : IDMLBindingTable*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDMLBindingTable*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDMLBindingTable*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_private_data(this : IDMLBindingTable*, guid : LibC::GUID*, dataSize : UInt32*, data : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, guid, dataSize, data)
    end
    def set_private_data(this : IDMLBindingTable*, guid : LibC::GUID*, dataSize : UInt32, data : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, guid, dataSize, data)
    end
    def set_private_data_interface(this : IDMLBindingTable*, guid : LibC::GUID*, data : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, guid, data)
    end
    def set_name(this : IDMLBindingTable*, name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_name.call(this, name)
    end
    def get_device(this : IDMLBindingTable*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device.call(this, riid, ppv)
    end
    def bind_inputs(this : IDMLBindingTable*, bindingCount : UInt32, bindings : Win32cr::AI::MachineLearning::DirectML::DML_BINDING_DESC*) : Void
      @lpVtbl.try &.value.bind_inputs.call(this, bindingCount, bindings)
    end
    def bind_outputs(this : IDMLBindingTable*, bindingCount : UInt32, bindings : Win32cr::AI::MachineLearning::DirectML::DML_BINDING_DESC*) : Void
      @lpVtbl.try &.value.bind_outputs.call(this, bindingCount, bindings)
    end
    def bind_temporary_resource(this : IDMLBindingTable*, binding : Win32cr::AI::MachineLearning::DirectML::DML_BINDING_DESC*) : Void
      @lpVtbl.try &.value.bind_temporary_resource.call(this, binding)
    end
    def bind_persistent_resource(this : IDMLBindingTable*, binding : Win32cr::AI::MachineLearning::DirectML::DML_BINDING_DESC*) : Void
      @lpVtbl.try &.value.bind_persistent_resource.call(this, binding)
    end
    def reset(this : IDMLBindingTable*, desc : Win32cr::AI::MachineLearning::DirectML::DML_BINDING_TABLE_DESC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this, desc)
    end

  end

  @[Extern]
  record IDMLCommandRecorderVtbl,
    query_interface : Proc(IDMLCommandRecorder*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDMLCommandRecorder*, UInt32),
    release : Proc(IDMLCommandRecorder*, UInt32),
    get_private_data : Proc(IDMLCommandRecorder*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    set_private_data : Proc(IDMLCommandRecorder*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDMLCommandRecorder*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    set_name : Proc(IDMLCommandRecorder*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_device : Proc(IDMLCommandRecorder*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    record_dispatch : Proc(IDMLCommandRecorder*, Void*, Void*, Void*, Void)


  @[Extern]
  #@[Com("e6857a76-2e3e-4fdd-bff4-5d2ba10fb453")]
  record IDMLCommandRecorder, lpVtbl : IDMLCommandRecorderVtbl* do
    GUID = LibC::GUID.new(0xe6857a76_u32, 0x2e3e_u16, 0x4fdd_u16, StaticArray[0xbf_u8, 0xf4_u8, 0x5d_u8, 0x2b_u8, 0xa1_u8, 0xf_u8, 0xb4_u8, 0x53_u8])
    def query_interface(this : IDMLCommandRecorder*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDMLCommandRecorder*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDMLCommandRecorder*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_private_data(this : IDMLCommandRecorder*, guid : LibC::GUID*, dataSize : UInt32*, data : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, guid, dataSize, data)
    end
    def set_private_data(this : IDMLCommandRecorder*, guid : LibC::GUID*, dataSize : UInt32, data : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, guid, dataSize, data)
    end
    def set_private_data_interface(this : IDMLCommandRecorder*, guid : LibC::GUID*, data : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, guid, data)
    end
    def set_name(this : IDMLCommandRecorder*, name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_name.call(this, name)
    end
    def get_device(this : IDMLCommandRecorder*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device.call(this, riid, ppv)
    end
    def record_dispatch(this : IDMLCommandRecorder*, commandList : Void*, dispatchable : Void*, bindings : Void*) : Void
      @lpVtbl.try &.value.record_dispatch.call(this, commandList, dispatchable, bindings)
    end

  end

  @[Extern]
  record IDMLDebugDeviceVtbl,
    query_interface : Proc(IDMLDebugDevice*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDMLDebugDevice*, UInt32),
    release : Proc(IDMLDebugDevice*, UInt32),
    set_mute_debug_output : Proc(IDMLDebugDevice*, Win32cr::Foundation::BOOL, Void)


  @[Extern]
  #@[Com("7d6f3ac9-394a-4ac3-92a7-390cc57a8217")]
  record IDMLDebugDevice, lpVtbl : IDMLDebugDeviceVtbl* do
    GUID = LibC::GUID.new(0x7d6f3ac9_u32, 0x394a_u16, 0x4ac3_u16, StaticArray[0x92_u8, 0xa7_u8, 0x39_u8, 0xc_u8, 0xc5_u8, 0x7a_u8, 0x82_u8, 0x17_u8])
    def query_interface(this : IDMLDebugDevice*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDMLDebugDevice*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDMLDebugDevice*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_mute_debug_output(this : IDMLDebugDevice*, mute : Win32cr::Foundation::BOOL) : Void
      @lpVtbl.try &.value.set_mute_debug_output.call(this, mute)
    end

  end

  @[Extern]
  record IDMLDevice1Vtbl,
    query_interface : Proc(IDMLDevice1*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDMLDevice1*, UInt32),
    release : Proc(IDMLDevice1*, UInt32),
    get_private_data : Proc(IDMLDevice1*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    set_private_data : Proc(IDMLDevice1*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDMLDevice1*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    set_name : Proc(IDMLDevice1*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    check_feature_support : Proc(IDMLDevice1*, Win32cr::AI::MachineLearning::DirectML::DML_FEATURE, UInt32, Void*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    create_operator : Proc(IDMLDevice1*, Win32cr::AI::MachineLearning::DirectML::DML_OPERATOR_DESC*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    compile_operator : Proc(IDMLDevice1*, Void*, Win32cr::AI::MachineLearning::DirectML::DML_EXECUTION_FLAGS, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    create_operator_initializer : Proc(IDMLDevice1*, UInt32, Void**, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    create_command_recorder : Proc(IDMLDevice1*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    create_binding_table : Proc(IDMLDevice1*, Win32cr::AI::MachineLearning::DirectML::DML_BINDING_TABLE_DESC*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    evict : Proc(IDMLDevice1*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    make_resident : Proc(IDMLDevice1*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_device_removed_reason : Proc(IDMLDevice1*, Win32cr::Foundation::HRESULT),
    get_parent_device : Proc(IDMLDevice1*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    compile_graph : Proc(IDMLDevice1*, Win32cr::AI::MachineLearning::DirectML::DML_GRAPH_DESC*, Win32cr::AI::MachineLearning::DirectML::DML_EXECUTION_FLAGS, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a0884f9a-d2be-4355-aa5d-5901281ad1d2")]
  record IDMLDevice1, lpVtbl : IDMLDevice1Vtbl* do
    GUID = LibC::GUID.new(0xa0884f9a_u32, 0xd2be_u16, 0x4355_u16, StaticArray[0xaa_u8, 0x5d_u8, 0x59_u8, 0x1_u8, 0x28_u8, 0x1a_u8, 0xd1_u8, 0xd2_u8])
    def query_interface(this : IDMLDevice1*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDMLDevice1*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDMLDevice1*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_private_data(this : IDMLDevice1*, guid : LibC::GUID*, dataSize : UInt32*, data : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, guid, dataSize, data)
    end
    def set_private_data(this : IDMLDevice1*, guid : LibC::GUID*, dataSize : UInt32, data : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, guid, dataSize, data)
    end
    def set_private_data_interface(this : IDMLDevice1*, guid : LibC::GUID*, data : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, guid, data)
    end
    def set_name(this : IDMLDevice1*, name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_name.call(this, name)
    end
    def check_feature_support(this : IDMLDevice1*, feature : Win32cr::AI::MachineLearning::DirectML::DML_FEATURE, featureQueryDataSize : UInt32, featureQueryData : Void*, featureSupportDataSize : UInt32, featureSupportData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.check_feature_support.call(this, feature, featureQueryDataSize, featureQueryData, featureSupportDataSize, featureSupportData)
    end
    def create_operator(this : IDMLDevice1*, desc : Win32cr::AI::MachineLearning::DirectML::DML_OPERATOR_DESC*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_operator.call(this, desc, riid, ppv)
    end
    def compile_operator(this : IDMLDevice1*, op : Void*, flags : Win32cr::AI::MachineLearning::DirectML::DML_EXECUTION_FLAGS, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compile_operator.call(this, op, flags, riid, ppv)
    end
    def create_operator_initializer(this : IDMLDevice1*, operatorCount : UInt32, operators : Void**, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_operator_initializer.call(this, operatorCount, operators, riid, ppv)
    end
    def create_command_recorder(this : IDMLDevice1*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_command_recorder.call(this, riid, ppv)
    end
    def create_binding_table(this : IDMLDevice1*, desc : Win32cr::AI::MachineLearning::DirectML::DML_BINDING_TABLE_DESC*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_binding_table.call(this, desc, riid, ppv)
    end
    def evict(this : IDMLDevice1*, count : UInt32, ppObjects : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.evict.call(this, count, ppObjects)
    end
    def make_resident(this : IDMLDevice1*, count : UInt32, ppObjects : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.make_resident.call(this, count, ppObjects)
    end
    def get_device_removed_reason(this : IDMLDevice1*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_removed_reason.call(this)
    end
    def get_parent_device(this : IDMLDevice1*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent_device.call(this, riid, ppv)
    end
    def compile_graph(this : IDMLDevice1*, desc : Win32cr::AI::MachineLearning::DirectML::DML_GRAPH_DESC*, flags : Win32cr::AI::MachineLearning::DirectML::DML_EXECUTION_FLAGS, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compile_graph.call(this, desc, flags, riid, ppv)
    end

  end

  @[Link("directml")]
  lib C
    fun DMLCreateDevice(d3d12Device : Void*, flags : Win32cr::AI::MachineLearning::DirectML::DML_CREATE_DEVICE_FLAGS, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

    fun DMLCreateDevice1(d3d12Device : Void*, flags : Win32cr::AI::MachineLearning::DirectML::DML_CREATE_DEVICE_FLAGS, minimumFeatureLevel : Win32cr::AI::MachineLearning::DirectML::DML_FEATURE_LEVEL, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

  end
end