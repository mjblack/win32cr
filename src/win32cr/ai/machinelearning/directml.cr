require "../../foundation.cr"
require "../../graphics/direct3d12.cr"
require "../../system/com.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:directml.dll")]
{% else %}
@[Link("directml")]
{% end %}
lib LibWin32
  DML_TARGET_VERSION = 16384_u32
  DML_TENSOR_DIMENSION_COUNT_MAX = 5_u32
  DML_TENSOR_DIMENSION_COUNT_MAX1 = 8_u32
  DML_TEMPORARY_BUFFER_ALIGNMENT = 256_u32
  DML_PERSISTENT_BUFFER_ALIGNMENT = 256_u32
  DML_MINIMUM_BUFFER_TENSOR_ALIGNMENT = 16_u32


  enum DML_TENSOR_DATA_TYPE : Int32
    DML_TENSOR_DATA_TYPE_UNKNOWN = 0
    DML_TENSOR_DATA_TYPE_FLOAT32 = 1
    DML_TENSOR_DATA_TYPE_FLOAT16 = 2
    DML_TENSOR_DATA_TYPE_UINT32 = 3
    DML_TENSOR_DATA_TYPE_UINT16 = 4
    DML_TENSOR_DATA_TYPE_UINT8 = 5
    DML_TENSOR_DATA_TYPE_INT32 = 6
    DML_TENSOR_DATA_TYPE_INT16 = 7
    DML_TENSOR_DATA_TYPE_INT8 = 8
    DML_TENSOR_DATA_TYPE_FLOAT64 = 9
    DML_TENSOR_DATA_TYPE_UINT64 = 10
    DML_TENSOR_DATA_TYPE_INT64 = 11
  end

  enum DML_TENSOR_TYPE : Int32
    DML_TENSOR_TYPE_INVALID = 0
    DML_TENSOR_TYPE_BUFFER = 1
  end

  enum DML_TENSOR_FLAGS : UInt32
    DML_TENSOR_FLAG_NONE = 0
    DML_TENSOR_FLAG_OWNED_BY_DML = 1
  end

  enum DML_OPERATOR_TYPE : Int32
    DML_OPERATOR_INVALID = 0
    DML_OPERATOR_ELEMENT_WISE_IDENTITY = 1
    DML_OPERATOR_ELEMENT_WISE_ABS = 2
    DML_OPERATOR_ELEMENT_WISE_ACOS = 3
    DML_OPERATOR_ELEMENT_WISE_ADD = 4
    DML_OPERATOR_ELEMENT_WISE_ASIN = 5
    DML_OPERATOR_ELEMENT_WISE_ATAN = 6
    DML_OPERATOR_ELEMENT_WISE_CEIL = 7
    DML_OPERATOR_ELEMENT_WISE_CLIP = 8
    DML_OPERATOR_ELEMENT_WISE_COS = 9
    DML_OPERATOR_ELEMENT_WISE_DIVIDE = 10
    DML_OPERATOR_ELEMENT_WISE_EXP = 11
    DML_OPERATOR_ELEMENT_WISE_FLOOR = 12
    DML_OPERATOR_ELEMENT_WISE_LOG = 13
    DML_OPERATOR_ELEMENT_WISE_LOGICAL_AND = 14
    DML_OPERATOR_ELEMENT_WISE_LOGICAL_EQUALS = 15
    DML_OPERATOR_ELEMENT_WISE_LOGICAL_GREATER_THAN = 16
    DML_OPERATOR_ELEMENT_WISE_LOGICAL_LESS_THAN = 17
    DML_OPERATOR_ELEMENT_WISE_LOGICAL_NOT = 18
    DML_OPERATOR_ELEMENT_WISE_LOGICAL_OR = 19
    DML_OPERATOR_ELEMENT_WISE_LOGICAL_XOR = 20
    DML_OPERATOR_ELEMENT_WISE_MAX = 21
    DML_OPERATOR_ELEMENT_WISE_MEAN = 22
    DML_OPERATOR_ELEMENT_WISE_MIN = 23
    DML_OPERATOR_ELEMENT_WISE_MULTIPLY = 24
    DML_OPERATOR_ELEMENT_WISE_POW = 25
    DML_OPERATOR_ELEMENT_WISE_CONSTANT_POW = 26
    DML_OPERATOR_ELEMENT_WISE_RECIP = 27
    DML_OPERATOR_ELEMENT_WISE_SIN = 28
    DML_OPERATOR_ELEMENT_WISE_SQRT = 29
    DML_OPERATOR_ELEMENT_WISE_SUBTRACT = 30
    DML_OPERATOR_ELEMENT_WISE_TAN = 31
    DML_OPERATOR_ELEMENT_WISE_THRESHOLD = 32
    DML_OPERATOR_ELEMENT_WISE_QUANTIZE_LINEAR = 33
    DML_OPERATOR_ELEMENT_WISE_DEQUANTIZE_LINEAR = 34
    DML_OPERATOR_ACTIVATION_ELU = 35
    DML_OPERATOR_ACTIVATION_HARDMAX = 36
    DML_OPERATOR_ACTIVATION_HARD_SIGMOID = 37
    DML_OPERATOR_ACTIVATION_IDENTITY = 38
    DML_OPERATOR_ACTIVATION_LEAKY_RELU = 39
    DML_OPERATOR_ACTIVATION_LINEAR = 40
    DML_OPERATOR_ACTIVATION_LOG_SOFTMAX = 41
    DML_OPERATOR_ACTIVATION_PARAMETERIZED_RELU = 42
    DML_OPERATOR_ACTIVATION_PARAMETRIC_SOFTPLUS = 43
    DML_OPERATOR_ACTIVATION_RELU = 44
    DML_OPERATOR_ACTIVATION_SCALED_ELU = 45
    DML_OPERATOR_ACTIVATION_SCALED_TANH = 46
    DML_OPERATOR_ACTIVATION_SIGMOID = 47
    DML_OPERATOR_ACTIVATION_SOFTMAX = 48
    DML_OPERATOR_ACTIVATION_SOFTPLUS = 49
    DML_OPERATOR_ACTIVATION_SOFTSIGN = 50
    DML_OPERATOR_ACTIVATION_TANH = 51
    DML_OPERATOR_ACTIVATION_THRESHOLDED_RELU = 52
    DML_OPERATOR_CONVOLUTION = 53
    DML_OPERATOR_GEMM = 54
    DML_OPERATOR_REDUCE = 55
    DML_OPERATOR_AVERAGE_POOLING = 56
    DML_OPERATOR_LP_POOLING = 57
    DML_OPERATOR_MAX_POOLING = 58
    DML_OPERATOR_ROI_POOLING = 59
    DML_OPERATOR_SLICE = 60
    DML_OPERATOR_CAST = 61
    DML_OPERATOR_SPLIT = 62
    DML_OPERATOR_JOIN = 63
    DML_OPERATOR_PADDING = 64
    DML_OPERATOR_VALUE_SCALE_2D = 65
    DML_OPERATOR_UPSAMPLE_2D = 66
    DML_OPERATOR_GATHER = 67
    DML_OPERATOR_SPACE_TO_DEPTH = 68
    DML_OPERATOR_DEPTH_TO_SPACE = 69
    DML_OPERATOR_TILE = 70
    DML_OPERATOR_TOP_K = 71
    DML_OPERATOR_BATCH_NORMALIZATION = 72
    DML_OPERATOR_MEAN_VARIANCE_NORMALIZATION = 73
    DML_OPERATOR_LOCAL_RESPONSE_NORMALIZATION = 74
    DML_OPERATOR_LP_NORMALIZATION = 75
    DML_OPERATOR_RNN = 76
    DML_OPERATOR_LSTM = 77
    DML_OPERATOR_GRU = 78
    DML_OPERATOR_ELEMENT_WISE_SIGN = 79
    DML_OPERATOR_ELEMENT_WISE_IS_NAN = 80
    DML_OPERATOR_ELEMENT_WISE_ERF = 81
    DML_OPERATOR_ELEMENT_WISE_SINH = 82
    DML_OPERATOR_ELEMENT_WISE_COSH = 83
    DML_OPERATOR_ELEMENT_WISE_TANH = 84
    DML_OPERATOR_ELEMENT_WISE_ASINH = 85
    DML_OPERATOR_ELEMENT_WISE_ACOSH = 86
    DML_OPERATOR_ELEMENT_WISE_ATANH = 87
    DML_OPERATOR_ELEMENT_WISE_IF = 88
    DML_OPERATOR_ELEMENT_WISE_ADD1 = 89
    DML_OPERATOR_ACTIVATION_SHRINK = 90
    DML_OPERATOR_MAX_POOLING1 = 91
    DML_OPERATOR_MAX_UNPOOLING = 92
    DML_OPERATOR_DIAGONAL_MATRIX = 93
    DML_OPERATOR_SCATTER_ELEMENTS = 94
    DML_OPERATOR_SCATTER = 94
    DML_OPERATOR_ONE_HOT = 95
    DML_OPERATOR_RESAMPLE = 96
    DML_OPERATOR_ELEMENT_WISE_BIT_SHIFT_LEFT = 97
    DML_OPERATOR_ELEMENT_WISE_BIT_SHIFT_RIGHT = 98
    DML_OPERATOR_ELEMENT_WISE_ROUND = 99
    DML_OPERATOR_ELEMENT_WISE_IS_INFINITY = 100
    DML_OPERATOR_ELEMENT_WISE_MODULUS_TRUNCATE = 101
    DML_OPERATOR_ELEMENT_WISE_MODULUS_FLOOR = 102
    DML_OPERATOR_FILL_VALUE_CONSTANT = 103
    DML_OPERATOR_FILL_VALUE_SEQUENCE = 104
    DML_OPERATOR_CUMULATIVE_SUMMATION = 105
    DML_OPERATOR_REVERSE_SUBSEQUENCES = 106
    DML_OPERATOR_GATHER_ELEMENTS = 107
    DML_OPERATOR_GATHER_ND = 108
    DML_OPERATOR_SCATTER_ND = 109
    DML_OPERATOR_MAX_POOLING2 = 110
    DML_OPERATOR_SLICE1 = 111
    DML_OPERATOR_TOP_K1 = 112
    DML_OPERATOR_DEPTH_TO_SPACE1 = 113
    DML_OPERATOR_SPACE_TO_DEPTH1 = 114
    DML_OPERATOR_MEAN_VARIANCE_NORMALIZATION1 = 115
    DML_OPERATOR_RESAMPLE1 = 116
    DML_OPERATOR_MATRIX_MULTIPLY_INTEGER = 117
    DML_OPERATOR_QUANTIZED_LINEAR_MATRIX_MULTIPLY = 118
    DML_OPERATOR_CONVOLUTION_INTEGER = 119
    DML_OPERATOR_QUANTIZED_LINEAR_CONVOLUTION = 120
    DML_OPERATOR_ELEMENT_WISE_BIT_AND = 121
    DML_OPERATOR_ELEMENT_WISE_BIT_OR = 122
    DML_OPERATOR_ELEMENT_WISE_BIT_XOR = 123
    DML_OPERATOR_ELEMENT_WISE_BIT_NOT = 124
    DML_OPERATOR_ELEMENT_WISE_BIT_COUNT = 125
    DML_OPERATOR_ELEMENT_WISE_LOGICAL_GREATER_THAN_OR_EQUAL = 126
    DML_OPERATOR_ELEMENT_WISE_LOGICAL_LESS_THAN_OR_EQUAL = 127
    DML_OPERATOR_ACTIVATION_CELU = 128
    DML_OPERATOR_ACTIVATION_RELU_GRAD = 129
    DML_OPERATOR_AVERAGE_POOLING_GRAD = 130
    DML_OPERATOR_MAX_POOLING_GRAD = 131
    DML_OPERATOR_RANDOM_GENERATOR = 132
    DML_OPERATOR_NONZERO_COORDINATES = 133
    DML_OPERATOR_RESAMPLE_GRAD = 134
    DML_OPERATOR_SLICE_GRAD = 135
    DML_OPERATOR_ADAM_OPTIMIZER = 136
    DML_OPERATOR_ARGMIN = 137
    DML_OPERATOR_ARGMAX = 138
    DML_OPERATOR_ROI_ALIGN = 139
    DML_OPERATOR_GATHER_ND1 = 140
    DML_OPERATOR_ELEMENT_WISE_ATAN_YX = 141
    DML_OPERATOR_ELEMENT_WISE_CLIP_GRAD = 142
    DML_OPERATOR_ELEMENT_WISE_DIFFERENCE_SQUARE = 143
    DML_OPERATOR_LOCAL_RESPONSE_NORMALIZATION_GRAD = 144
    DML_OPERATOR_CUMULATIVE_PRODUCT = 145
    DML_OPERATOR_BATCH_NORMALIZATION_GRAD = 146
    DML_OPERATOR_ELEMENT_WISE_QUANTIZED_LINEAR_ADD = 147
    DML_OPERATOR_DYNAMIC_QUANTIZE_LINEAR = 148
    DML_OPERATOR_ROI_ALIGN1 = 149
  end

  enum DML_REDUCE_FUNCTION : Int32
    DML_REDUCE_FUNCTION_ARGMAX = 0
    DML_REDUCE_FUNCTION_ARGMIN = 1
    DML_REDUCE_FUNCTION_AVERAGE = 2
    DML_REDUCE_FUNCTION_L1 = 3
    DML_REDUCE_FUNCTION_L2 = 4
    DML_REDUCE_FUNCTION_LOG_SUM = 5
    DML_REDUCE_FUNCTION_LOG_SUM_EXP = 6
    DML_REDUCE_FUNCTION_MAX = 7
    DML_REDUCE_FUNCTION_MIN = 8
    DML_REDUCE_FUNCTION_MULTIPLY = 9
    DML_REDUCE_FUNCTION_SUM = 10
    DML_REDUCE_FUNCTION_SUM_SQUARE = 11
  end

  enum DML_MATRIX_TRANSFORM : Int32
    DML_MATRIX_TRANSFORM_NONE = 0
    DML_MATRIX_TRANSFORM_TRANSPOSE = 1
  end

  enum DML_CONVOLUTION_MODE : Int32
    DML_CONVOLUTION_MODE_CONVOLUTION = 0
    DML_CONVOLUTION_MODE_CROSS_CORRELATION = 1
  end

  enum DML_CONVOLUTION_DIRECTION : Int32
    DML_CONVOLUTION_DIRECTION_FORWARD = 0
    DML_CONVOLUTION_DIRECTION_BACKWARD = 1
  end

  enum DML_PADDING_MODE : Int32
    DML_PADDING_MODE_CONSTANT = 0
    DML_PADDING_MODE_EDGE = 1
    DML_PADDING_MODE_REFLECTION = 2
    DML_PADDING_MODE_SYMMETRIC = 3
  end

  enum DML_INTERPOLATION_MODE : Int32
    DML_INTERPOLATION_MODE_NEAREST_NEIGHBOR = 0
    DML_INTERPOLATION_MODE_LINEAR = 1
  end

  enum DML_RECURRENT_NETWORK_DIRECTION : Int32
    DML_RECURRENT_NETWORK_DIRECTION_FORWARD = 0
    DML_RECURRENT_NETWORK_DIRECTION_BACKWARD = 1
    DML_RECURRENT_NETWORK_DIRECTION_BIDIRECTIONAL = 2
  end

  enum DML_ROUNDING_MODE : Int32
    DML_ROUNDING_MODE_HALVES_TO_NEAREST_EVEN = 0
    DML_ROUNDING_MODE_TOWARD_ZERO = 1
    DML_ROUNDING_MODE_TOWARD_INFINITY = 2
  end

  enum DML_IS_INFINITY_MODE : Int32
    DML_IS_INFINITY_MODE_EITHER = 0
    DML_IS_INFINITY_MODE_POSITIVE = 1
    DML_IS_INFINITY_MODE_NEGATIVE = 2
  end

  enum DML_AXIS_DIRECTION : Int32
    DML_AXIS_DIRECTION_INCREASING = 0
    DML_AXIS_DIRECTION_DECREASING = 1
  end

  enum DML_DEPTH_SPACE_ORDER : Int32
    DML_DEPTH_SPACE_ORDER_DEPTH_COLUMN_ROW = 0
    DML_DEPTH_SPACE_ORDER_COLUMN_ROW_DEPTH = 1
  end

  enum DML_RANDOM_GENERATOR_TYPE : Int32
    DML_RANDOM_GENERATOR_TYPE_PHILOX_4X32_10 = 0
  end

  enum DML_FEATURE_LEVEL : Int32
    DML_FEATURE_LEVEL_1_0 = 4096
    DML_FEATURE_LEVEL_2_0 = 8192
    DML_FEATURE_LEVEL_2_1 = 8448
    DML_FEATURE_LEVEL_3_0 = 12288
    DML_FEATURE_LEVEL_3_1 = 12544
    DML_FEATURE_LEVEL_4_0 = 16384
  end

  enum DML_FEATURE : Int32
    DML_FEATURE_TENSOR_DATA_TYPE_SUPPORT = 0
    DML_FEATURE_FEATURE_LEVELS = 1
  end

  enum DML_EXECUTION_FLAGS : UInt32
    DML_EXECUTION_FLAG_NONE = 0
    DML_EXECUTION_FLAG_ALLOW_HALF_PRECISION_COMPUTATION = 1
    DML_EXECUTION_FLAG_DISABLE_META_COMMANDS = 2
    DML_EXECUTION_FLAG_DESCRIPTORS_VOLATILE = 4
  end

  enum DML_CREATE_DEVICE_FLAGS : UInt32
    DML_CREATE_DEVICE_FLAG_NONE = 0
    DML_CREATE_DEVICE_FLAG_DEBUG = 1
  end

  enum DML_BINDING_TYPE : Int32
    DML_BINDING_TYPE_NONE = 0
    DML_BINDING_TYPE_BUFFER = 1
    DML_BINDING_TYPE_BUFFER_ARRAY = 2
  end

  enum DML_GRAPH_EDGE_TYPE : Int32
    DML_GRAPH_EDGE_TYPE_INVALID = 0
    DML_GRAPH_EDGE_TYPE_INPUT = 1
    DML_GRAPH_EDGE_TYPE_OUTPUT = 2
    DML_GRAPH_EDGE_TYPE_INTERMEDIATE = 3
  end

  enum DML_GRAPH_NODE_TYPE : Int32
    DML_GRAPH_NODE_TYPE_INVALID = 0
    DML_GRAPH_NODE_TYPE_OPERATOR = 1
  end

  union DML_SCALAR_UNION
    bytes : UInt8[8]*
    int8 : Int8
    u_int8 : UInt8
    int16 : Int16
    u_int16 : UInt16
    int32 : Int32
    u_int32 : UInt32
    int64 : Int64
    u_int64 : UInt64
    float32 : Float32
    float64 : Float64
  end

  struct DML_BUFFER_TENSOR_DESC
    data_type : DML_TENSOR_DATA_TYPE
    flags : DML_TENSOR_FLAGS
    dimension_count : UInt32
    sizes : UInt32*
    strides : UInt32*
    total_tensor_size_in_bytes : UInt64
    guaranteed_base_offset_alignment : UInt32
  end
  struct DML_TENSOR_DESC
    type : DML_TENSOR_TYPE
    desc : Void*
  end
  struct DML_SCALE_BIAS
    scale : Float32
    bias : Float32
  end
  struct DML_SIZE_2D
    width : UInt32
    height : UInt32
  end
  struct DML_OPERATOR_DESC
    type : DML_OPERATOR_TYPE
    desc : Void*
  end
  struct DML_ELEMENT_WISE_IDENTITY_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    scale_bias : DML_SCALE_BIAS*
  end
  struct DML_ELEMENT_WISE_ABS_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    scale_bias : DML_SCALE_BIAS*
  end
  struct DML_ELEMENT_WISE_ACOS_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    scale_bias : DML_SCALE_BIAS*
  end
  struct DML_ELEMENT_WISE_ADD_OPERATOR_DESC
    a_tensor : DML_TENSOR_DESC*
    b_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_ELEMENT_WISE_ADD1_OPERATOR_DESC
    a_tensor : DML_TENSOR_DESC*
    b_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    fused_activation : DML_OPERATOR_DESC*
  end
  struct DML_ELEMENT_WISE_ASIN_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    scale_bias : DML_SCALE_BIAS*
  end
  struct DML_ELEMENT_WISE_ATAN_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    scale_bias : DML_SCALE_BIAS*
  end
  struct DML_ELEMENT_WISE_CEIL_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    scale_bias : DML_SCALE_BIAS*
  end
  struct DML_ELEMENT_WISE_CLIP_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    scale_bias : DML_SCALE_BIAS*
    min : Float32
    max : Float32
  end
  struct DML_ELEMENT_WISE_COS_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    scale_bias : DML_SCALE_BIAS*
  end
  struct DML_ELEMENT_WISE_DIVIDE_OPERATOR_DESC
    a_tensor : DML_TENSOR_DESC*
    b_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_ELEMENT_WISE_EXP_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    scale_bias : DML_SCALE_BIAS*
  end
  struct DML_ELEMENT_WISE_FLOOR_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    scale_bias : DML_SCALE_BIAS*
  end
  struct DML_ELEMENT_WISE_LOG_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    scale_bias : DML_SCALE_BIAS*
  end
  struct DML_ELEMENT_WISE_LOGICAL_AND_OPERATOR_DESC
    a_tensor : DML_TENSOR_DESC*
    b_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_ELEMENT_WISE_LOGICAL_EQUALS_OPERATOR_DESC
    a_tensor : DML_TENSOR_DESC*
    b_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_ELEMENT_WISE_LOGICAL_GREATER_THAN_OPERATOR_DESC
    a_tensor : DML_TENSOR_DESC*
    b_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_ELEMENT_WISE_LOGICAL_LESS_THAN_OPERATOR_DESC
    a_tensor : DML_TENSOR_DESC*
    b_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_ELEMENT_WISE_LOGICAL_NOT_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_ELEMENT_WISE_LOGICAL_OR_OPERATOR_DESC
    a_tensor : DML_TENSOR_DESC*
    b_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_ELEMENT_WISE_LOGICAL_XOR_OPERATOR_DESC
    a_tensor : DML_TENSOR_DESC*
    b_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_ELEMENT_WISE_MAX_OPERATOR_DESC
    a_tensor : DML_TENSOR_DESC*
    b_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_ELEMENT_WISE_MEAN_OPERATOR_DESC
    a_tensor : DML_TENSOR_DESC*
    b_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_ELEMENT_WISE_MIN_OPERATOR_DESC
    a_tensor : DML_TENSOR_DESC*
    b_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_ELEMENT_WISE_MULTIPLY_OPERATOR_DESC
    a_tensor : DML_TENSOR_DESC*
    b_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_ELEMENT_WISE_POW_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    exponent_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    scale_bias : DML_SCALE_BIAS*
  end
  struct DML_ELEMENT_WISE_CONSTANT_POW_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    scale_bias : DML_SCALE_BIAS*
    exponent : Float32
  end
  struct DML_ELEMENT_WISE_RECIP_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    scale_bias : DML_SCALE_BIAS*
  end
  struct DML_ELEMENT_WISE_SIN_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    scale_bias : DML_SCALE_BIAS*
  end
  struct DML_ELEMENT_WISE_SQRT_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    scale_bias : DML_SCALE_BIAS*
  end
  struct DML_ELEMENT_WISE_SUBTRACT_OPERATOR_DESC
    a_tensor : DML_TENSOR_DESC*
    b_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_ELEMENT_WISE_TAN_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    scale_bias : DML_SCALE_BIAS*
  end
  struct DML_ELEMENT_WISE_THRESHOLD_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    scale_bias : DML_SCALE_BIAS*
    min : Float32
  end
  struct DML_ELEMENT_WISE_QUANTIZE_LINEAR_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    scale_tensor : DML_TENSOR_DESC*
    zero_point_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_ELEMENT_WISE_DEQUANTIZE_LINEAR_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    scale_tensor : DML_TENSOR_DESC*
    zero_point_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_ACTIVATION_ELU_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    alpha : Float32
  end
  struct DML_ACTIVATION_HARDMAX_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_ACTIVATION_HARD_SIGMOID_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    alpha : Float32
    beta : Float32
  end
  struct DML_ACTIVATION_IDENTITY_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_ACTIVATION_LEAKY_RELU_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    alpha : Float32
  end
  struct DML_ACTIVATION_LINEAR_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    alpha : Float32
    beta : Float32
  end
  struct DML_ACTIVATION_LOG_SOFTMAX_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_ACTIVATION_PARAMETERIZED_RELU_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    slope_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_ACTIVATION_PARAMETRIC_SOFTPLUS_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    alpha : Float32
    beta : Float32
  end
  struct DML_ACTIVATION_RELU_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_ACTIVATION_SCALED_ELU_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    alpha : Float32
    gamma : Float32
  end
  struct DML_ACTIVATION_SCALED_TANH_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    alpha : Float32
    beta : Float32
  end
  struct DML_ACTIVATION_SIGMOID_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_ACTIVATION_SOFTMAX_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_ACTIVATION_SOFTPLUS_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    steepness : Float32
  end
  struct DML_ACTIVATION_SOFTSIGN_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_ACTIVATION_TANH_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_ACTIVATION_THRESHOLDED_RELU_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    alpha : Float32
  end
  struct DML_CONVOLUTION_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    filter_tensor : DML_TENSOR_DESC*
    bias_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    mode : DML_CONVOLUTION_MODE
    direction : DML_CONVOLUTION_DIRECTION
    dimension_count : UInt32
    strides : UInt32*
    dilations : UInt32*
    start_padding : UInt32*
    end_padding : UInt32*
    output_padding : UInt32*
    group_count : UInt32
    fused_activation : DML_OPERATOR_DESC*
  end
  struct DML_GEMM_OPERATOR_DESC
    a_tensor : DML_TENSOR_DESC*
    b_tensor : DML_TENSOR_DESC*
    c_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    trans_a : DML_MATRIX_TRANSFORM
    trans_b : DML_MATRIX_TRANSFORM
    alpha : Float32
    beta : Float32
    fused_activation : DML_OPERATOR_DESC*
  end
  struct DML_REDUCE_OPERATOR_DESC
    function : DML_REDUCE_FUNCTION
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    axis_count : UInt32
    axes : UInt32*
  end
  struct DML_AVERAGE_POOLING_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    dimension_count : UInt32
    strides : UInt32*
    window_size : UInt32*
    start_padding : UInt32*
    end_padding : UInt32*
    include_padding : LibC::BOOL
  end
  struct DML_LP_POOLING_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    dimension_count : UInt32
    strides : UInt32*
    window_size : UInt32*
    start_padding : UInt32*
    end_padding : UInt32*
    p : UInt32
  end
  struct DML_MAX_POOLING_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    dimension_count : UInt32
    strides : UInt32*
    window_size : UInt32*
    start_padding : UInt32*
    end_padding : UInt32*
  end
  struct DML_ROI_POOLING_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    roi_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    spatial_scale : Float32
    pooled_size : DML_SIZE_2D
  end
  struct DML_SLICE_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    dimension_count : UInt32
    offsets : UInt32*
    sizes : UInt32*
    strides : UInt32*
  end
  struct DML_CAST_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_SPLIT_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_count : UInt32
    output_tensors : DML_TENSOR_DESC*
    axis : UInt32
  end
  struct DML_JOIN_OPERATOR_DESC
    input_count : UInt32
    input_tensors : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    axis : UInt32
  end
  struct DML_PADDING_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    padding_mode : DML_PADDING_MODE
    padding_value : Float32
    dimension_count : UInt32
    start_padding : UInt32*
    end_padding : UInt32*
  end
  struct DML_VALUE_SCALE_2D_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    scale : Float32
    channel_count : UInt32
    bias : Float32*
  end
  struct DML_UPSAMPLE_2D_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    scale_size : DML_SIZE_2D
    interpolation_mode : DML_INTERPOLATION_MODE
  end
  struct DML_GATHER_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    indices_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    axis : UInt32
    index_dimensions : UInt32
  end
  struct DML_SPACE_TO_DEPTH_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    block_size : UInt32
  end
  struct DML_DEPTH_TO_SPACE_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    block_size : UInt32
  end
  struct DML_TILE_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    repeats_count : UInt32
    repeats : UInt32*
  end
  struct DML_TOP_K_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_value_tensor : DML_TENSOR_DESC*
    output_index_tensor : DML_TENSOR_DESC*
    axis : UInt32
    k : UInt32
  end
  struct DML_BATCH_NORMALIZATION_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    mean_tensor : DML_TENSOR_DESC*
    variance_tensor : DML_TENSOR_DESC*
    scale_tensor : DML_TENSOR_DESC*
    bias_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    spatial : LibC::BOOL
    epsilon : Float32
    fused_activation : DML_OPERATOR_DESC*
  end
  struct DML_MEAN_VARIANCE_NORMALIZATION_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    scale_tensor : DML_TENSOR_DESC*
    bias_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    cross_channel : LibC::BOOL
    normalize_variance : LibC::BOOL
    epsilon : Float32
    fused_activation : DML_OPERATOR_DESC*
  end
  struct DML_LOCAL_RESPONSE_NORMALIZATION_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    cross_channel : LibC::BOOL
    local_size : UInt32
    alpha : Float32
    beta : Float32
    bias : Float32
  end
  struct DML_LP_NORMALIZATION_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    axis : UInt32
    epsilon : Float32
    p : UInt32
  end
  struct DML_RNN_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    weight_tensor : DML_TENSOR_DESC*
    recurrence_tensor : DML_TENSOR_DESC*
    bias_tensor : DML_TENSOR_DESC*
    hidden_init_tensor : DML_TENSOR_DESC*
    sequence_lengths_tensor : DML_TENSOR_DESC*
    output_sequence_tensor : DML_TENSOR_DESC*
    output_single_tensor : DML_TENSOR_DESC*
    activation_desc_count : UInt32
    activation_descs : DML_OPERATOR_DESC*
    direction : DML_RECURRENT_NETWORK_DIRECTION
  end
  struct DML_LSTM_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    weight_tensor : DML_TENSOR_DESC*
    recurrence_tensor : DML_TENSOR_DESC*
    bias_tensor : DML_TENSOR_DESC*
    hidden_init_tensor : DML_TENSOR_DESC*
    cell_mem_init_tensor : DML_TENSOR_DESC*
    sequence_lengths_tensor : DML_TENSOR_DESC*
    peephole_tensor : DML_TENSOR_DESC*
    output_sequence_tensor : DML_TENSOR_DESC*
    output_single_tensor : DML_TENSOR_DESC*
    output_cell_single_tensor : DML_TENSOR_DESC*
    activation_desc_count : UInt32
    activation_descs : DML_OPERATOR_DESC*
    direction : DML_RECURRENT_NETWORK_DIRECTION
    clip_threshold : Float32
    use_clip_threshold : LibC::BOOL
    couple_input_forget : LibC::BOOL
  end
  struct DML_GRU_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    weight_tensor : DML_TENSOR_DESC*
    recurrence_tensor : DML_TENSOR_DESC*
    bias_tensor : DML_TENSOR_DESC*
    hidden_init_tensor : DML_TENSOR_DESC*
    sequence_lengths_tensor : DML_TENSOR_DESC*
    output_sequence_tensor : DML_TENSOR_DESC*
    output_single_tensor : DML_TENSOR_DESC*
    activation_desc_count : UInt32
    activation_descs : DML_OPERATOR_DESC*
    direction : DML_RECURRENT_NETWORK_DIRECTION
    linear_before_reset : LibC::BOOL
  end
  struct DML_ELEMENT_WISE_SIGN_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_ELEMENT_WISE_IS_NAN_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_ELEMENT_WISE_ERF_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    scale_bias : DML_SCALE_BIAS*
  end
  struct DML_ELEMENT_WISE_SINH_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    scale_bias : DML_SCALE_BIAS*
  end
  struct DML_ELEMENT_WISE_COSH_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    scale_bias : DML_SCALE_BIAS*
  end
  struct DML_ELEMENT_WISE_TANH_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    scale_bias : DML_SCALE_BIAS*
  end
  struct DML_ELEMENT_WISE_ASINH_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    scale_bias : DML_SCALE_BIAS*
  end
  struct DML_ELEMENT_WISE_ACOSH_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    scale_bias : DML_SCALE_BIAS*
  end
  struct DML_ELEMENT_WISE_ATANH_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    scale_bias : DML_SCALE_BIAS*
  end
  struct DML_ELEMENT_WISE_IF_OPERATOR_DESC
    condition_tensor : DML_TENSOR_DESC*
    a_tensor : DML_TENSOR_DESC*
    b_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_ACTIVATION_SHRINK_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    bias : Float32
    threshold : Float32
  end
  struct DML_MAX_POOLING1_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    output_indices_tensor : DML_TENSOR_DESC*
    dimension_count : UInt32
    strides : UInt32*
    window_size : UInt32*
    start_padding : UInt32*
    end_padding : UInt32*
  end
  struct DML_MAX_UNPOOLING_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    indices_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_DIAGONAL_MATRIX_OPERATOR_DESC
    output_tensor : DML_TENSOR_DESC*
    offset : Int32
    value : Float32
  end
  struct DML_SCATTER_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    indices_tensor : DML_TENSOR_DESC*
    updates_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    axis : UInt32
  end
  struct DML_ONE_HOT_OPERATOR_DESC
    indices_tensor : DML_TENSOR_DESC*
    values_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    axis : UInt32
  end
  struct DML_RESAMPLE_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    interpolation_mode : DML_INTERPOLATION_MODE
    scale_count : UInt32
    scales : Float32*
  end
  struct DML_ELEMENT_WISE_BIT_SHIFT_LEFT_OPERATOR_DESC
    a_tensor : DML_TENSOR_DESC*
    b_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_ELEMENT_WISE_BIT_SHIFT_RIGHT_OPERATOR_DESC
    a_tensor : DML_TENSOR_DESC*
    b_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_ELEMENT_WISE_ROUND_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    rounding_mode : DML_ROUNDING_MODE
  end
  struct DML_ELEMENT_WISE_IS_INFINITY_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    infinity_mode : DML_IS_INFINITY_MODE
  end
  struct DML_ELEMENT_WISE_MODULUS_TRUNCATE_OPERATOR_DESC
    a_tensor : DML_TENSOR_DESC*
    b_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_ELEMENT_WISE_MODULUS_FLOOR_OPERATOR_DESC
    a_tensor : DML_TENSOR_DESC*
    b_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_FILL_VALUE_CONSTANT_OPERATOR_DESC
    output_tensor : DML_TENSOR_DESC*
    value_data_type : DML_TENSOR_DATA_TYPE
    value : DML_SCALAR_UNION
  end
  struct DML_FILL_VALUE_SEQUENCE_OPERATOR_DESC
    output_tensor : DML_TENSOR_DESC*
    value_data_type : DML_TENSOR_DATA_TYPE
    value_start : DML_SCALAR_UNION
    value_delta : DML_SCALAR_UNION
  end
  struct DML_CUMULATIVE_SUMMATION_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    axis : UInt32
    axis_direction : DML_AXIS_DIRECTION
    has_exclusive_sum : LibC::BOOL
  end
  struct DML_REVERSE_SUBSEQUENCES_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    sequence_lengths_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    axis : UInt32
  end
  struct DML_GATHER_ELEMENTS_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    indices_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    axis : UInt32
  end
  struct DML_GATHER_ND_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    indices_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    input_dimension_count : UInt32
    indices_dimension_count : UInt32
  end
  struct DML_SCATTER_ND_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    indices_tensor : DML_TENSOR_DESC*
    updates_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    input_dimension_count : UInt32
    indices_dimension_count : UInt32
  end
  struct DML_MAX_POOLING2_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    output_indices_tensor : DML_TENSOR_DESC*
    dimension_count : UInt32
    strides : UInt32*
    window_size : UInt32*
    start_padding : UInt32*
    end_padding : UInt32*
    dilations : UInt32*
  end
  struct DML_SLICE1_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    dimension_count : UInt32
    input_window_offsets : UInt32*
    input_window_sizes : UInt32*
    input_window_strides : Int32*
  end
  struct DML_TOP_K1_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_value_tensor : DML_TENSOR_DESC*
    output_index_tensor : DML_TENSOR_DESC*
    axis : UInt32
    k : UInt32
    axis_direction : DML_AXIS_DIRECTION
  end
  struct DML_DEPTH_TO_SPACE1_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    block_size : UInt32
    order : DML_DEPTH_SPACE_ORDER
  end
  struct DML_SPACE_TO_DEPTH1_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    block_size : UInt32
    order : DML_DEPTH_SPACE_ORDER
  end
  struct DML_MEAN_VARIANCE_NORMALIZATION1_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    scale_tensor : DML_TENSOR_DESC*
    bias_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    axis_count : UInt32
    axes : UInt32*
    normalize_variance : LibC::BOOL
    epsilon : Float32
    fused_activation : DML_OPERATOR_DESC*
  end
  struct DML_RESAMPLE1_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    interpolation_mode : DML_INTERPOLATION_MODE
    dimension_count : UInt32
    scales : Float32*
    input_pixel_offsets : Float32*
    output_pixel_offsets : Float32*
  end
  struct DML_MATRIX_MULTIPLY_INTEGER_OPERATOR_DESC
    a_tensor : DML_TENSOR_DESC*
    a_zero_point_tensor : DML_TENSOR_DESC*
    b_tensor : DML_TENSOR_DESC*
    b_zero_point_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_QUANTIZED_LINEAR_MATRIX_MULTIPLY_OPERATOR_DESC
    a_tensor : DML_TENSOR_DESC*
    a_scale_tensor : DML_TENSOR_DESC*
    a_zero_point_tensor : DML_TENSOR_DESC*
    b_tensor : DML_TENSOR_DESC*
    b_scale_tensor : DML_TENSOR_DESC*
    b_zero_point_tensor : DML_TENSOR_DESC*
    output_scale_tensor : DML_TENSOR_DESC*
    output_zero_point_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_CONVOLUTION_INTEGER_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    input_zero_point_tensor : DML_TENSOR_DESC*
    filter_tensor : DML_TENSOR_DESC*
    filter_zero_point_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    dimension_count : UInt32
    strides : UInt32*
    dilations : UInt32*
    start_padding : UInt32*
    end_padding : UInt32*
    group_count : UInt32
  end
  struct DML_QUANTIZED_LINEAR_CONVOLUTION_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    input_scale_tensor : DML_TENSOR_DESC*
    input_zero_point_tensor : DML_TENSOR_DESC*
    filter_tensor : DML_TENSOR_DESC*
    filter_scale_tensor : DML_TENSOR_DESC*
    filter_zero_point_tensor : DML_TENSOR_DESC*
    bias_tensor : DML_TENSOR_DESC*
    output_scale_tensor : DML_TENSOR_DESC*
    output_zero_point_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    dimension_count : UInt32
    strides : UInt32*
    dilations : UInt32*
    start_padding : UInt32*
    end_padding : UInt32*
    group_count : UInt32
  end
  struct DML_ELEMENT_WISE_BIT_AND_OPERATOR_DESC
    a_tensor : DML_TENSOR_DESC*
    b_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_ELEMENT_WISE_BIT_OR_OPERATOR_DESC
    a_tensor : DML_TENSOR_DESC*
    b_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_ELEMENT_WISE_BIT_XOR_OPERATOR_DESC
    a_tensor : DML_TENSOR_DESC*
    b_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_ELEMENT_WISE_BIT_NOT_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_ELEMENT_WISE_BIT_COUNT_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_ELEMENT_WISE_LOGICAL_GREATER_THAN_OR_EQUAL_OPERATOR_DESC
    a_tensor : DML_TENSOR_DESC*
    b_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_ELEMENT_WISE_LOGICAL_LESS_THAN_OR_EQUAL_OPERATOR_DESC
    a_tensor : DML_TENSOR_DESC*
    b_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_ACTIVATION_CELU_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    alpha : Float32
  end
  struct DML_ACTIVATION_RELU_GRAD_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    input_gradient_tensor : DML_TENSOR_DESC*
    output_gradient_tensor : DML_TENSOR_DESC*
  end
  struct DML_AVERAGE_POOLING_GRAD_OPERATOR_DESC
    input_gradient_tensor : DML_TENSOR_DESC*
    output_gradient_tensor : DML_TENSOR_DESC*
    dimension_count : UInt32
    strides : UInt32*
    window_size : UInt32*
    start_padding : UInt32*
    end_padding : UInt32*
    include_padding : LibC::BOOL
  end
  struct DML_MAX_POOLING_GRAD_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    input_gradient_tensor : DML_TENSOR_DESC*
    output_gradient_tensor : DML_TENSOR_DESC*
    dimension_count : UInt32
    strides : UInt32*
    window_size : UInt32*
    start_padding : UInt32*
    end_padding : UInt32*
    dilations : UInt32*
  end
  struct DML_RANDOM_GENERATOR_OPERATOR_DESC
    input_state_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    output_state_tensor : DML_TENSOR_DESC*
    type : DML_RANDOM_GENERATOR_TYPE
  end
  struct DML_NONZERO_COORDINATES_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_count_tensor : DML_TENSOR_DESC*
    output_coordinates_tensor : DML_TENSOR_DESC*
  end
  struct DML_RESAMPLE_GRAD_OPERATOR_DESC
    input_gradient_tensor : DML_TENSOR_DESC*
    output_gradient_tensor : DML_TENSOR_DESC*
    interpolation_mode : DML_INTERPOLATION_MODE
    dimension_count : UInt32
    scales : Float32*
    input_pixel_offsets : Float32*
    output_pixel_offsets : Float32*
  end
  struct DML_SLICE_GRAD_OPERATOR_DESC
    input_gradient_tensor : DML_TENSOR_DESC*
    output_gradient_tensor : DML_TENSOR_DESC*
    dimension_count : UInt32
    input_window_offsets : UInt32*
    input_window_sizes : UInt32*
    input_window_strides : Int32*
  end
  struct DML_ADAM_OPTIMIZER_OPERATOR_DESC
    input_parameters_tensor : DML_TENSOR_DESC*
    input_first_moment_tensor : DML_TENSOR_DESC*
    input_second_moment_tensor : DML_TENSOR_DESC*
    gradient_tensor : DML_TENSOR_DESC*
    training_step_tensor : DML_TENSOR_DESC*
    output_parameters_tensor : DML_TENSOR_DESC*
    output_first_moment_tensor : DML_TENSOR_DESC*
    output_second_moment_tensor : DML_TENSOR_DESC*
    learning_rate : Float32
    beta1 : Float32
    beta2 : Float32
    epsilon : Float32
  end
  struct DML_ARGMIN_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    axis_count : UInt32
    axes : UInt32*
    axis_direction : DML_AXIS_DIRECTION
  end
  struct DML_ARGMAX_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    axis_count : UInt32
    axes : UInt32*
    axis_direction : DML_AXIS_DIRECTION
  end
  struct DML_ROI_ALIGN_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    roi_tensor : DML_TENSOR_DESC*
    batch_indices_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    reduction_function : DML_REDUCE_FUNCTION
    interpolation_mode : DML_INTERPOLATION_MODE
    spatial_scale_x : Float32
    spatial_scale_y : Float32
    out_of_bounds_input_value : Float32
    minimum_samples_per_output : UInt32
    maximum_samples_per_output : UInt32
  end
  struct DML_GATHER_ND1_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    indices_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    input_dimension_count : UInt32
    indices_dimension_count : UInt32
    batch_dimension_count : UInt32
  end
  struct DML_ELEMENT_WISE_ATAN_YX_OPERATOR_DESC
    a_tensor : DML_TENSOR_DESC*
    b_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_ELEMENT_WISE_CLIP_GRAD_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    input_gradient_tensor : DML_TENSOR_DESC*
    output_gradient_tensor : DML_TENSOR_DESC*
    min : Float32
    max : Float32
  end
  struct DML_ELEMENT_WISE_DIFFERENCE_SQUARE_OPERATOR_DESC
    a_tensor : DML_TENSOR_DESC*
    b_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_LOCAL_RESPONSE_NORMALIZATION_GRAD_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    input_gradient_tensor : DML_TENSOR_DESC*
    output_gradient_tensor : DML_TENSOR_DESC*
    cross_channel : LibC::BOOL
    local_size : UInt32
    alpha : Float32
    beta : Float32
    bias : Float32
  end
  struct DML_CUMULATIVE_PRODUCT_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    axis : UInt32
    axis_direction : DML_AXIS_DIRECTION
    has_exclusive_product : LibC::BOOL
  end
  struct DML_BATCH_NORMALIZATION_GRAD_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    input_gradient_tensor : DML_TENSOR_DESC*
    mean_tensor : DML_TENSOR_DESC*
    variance_tensor : DML_TENSOR_DESC*
    scale_tensor : DML_TENSOR_DESC*
    output_gradient_tensor : DML_TENSOR_DESC*
    output_scale_gradient_tensor : DML_TENSOR_DESC*
    output_bias_gradient_tensor : DML_TENSOR_DESC*
    epsilon : Float32
  end
  struct DML_ELEMENT_WISE_QUANTIZED_LINEAR_ADD_OPERATOR_DESC
    a_tensor : DML_TENSOR_DESC*
    a_scale_tensor : DML_TENSOR_DESC*
    a_zero_point_tensor : DML_TENSOR_DESC*
    b_tensor : DML_TENSOR_DESC*
    b_scale_tensor : DML_TENSOR_DESC*
    b_zero_point_tensor : DML_TENSOR_DESC*
    output_scale_tensor : DML_TENSOR_DESC*
    output_zero_point_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
  end
  struct DML_DYNAMIC_QUANTIZE_LINEAR_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    output_scale_tensor : DML_TENSOR_DESC*
    output_zero_point_tensor : DML_TENSOR_DESC*
  end
  struct DML_ROI_ALIGN1_OPERATOR_DESC
    input_tensor : DML_TENSOR_DESC*
    roi_tensor : DML_TENSOR_DESC*
    batch_indices_tensor : DML_TENSOR_DESC*
    output_tensor : DML_TENSOR_DESC*
    reduction_function : DML_REDUCE_FUNCTION
    interpolation_mode : DML_INTERPOLATION_MODE
    spatial_scale_x : Float32
    spatial_scale_y : Float32
    input_pixel_offset : Float32
    output_pixel_offset : Float32
    out_of_bounds_input_value : Float32
    minimum_samples_per_output : UInt32
    maximum_samples_per_output : UInt32
    align_regions_to_corners : LibC::BOOL
  end
  struct DML_FEATURE_QUERY_TENSOR_DATA_TYPE_SUPPORT
    data_type : DML_TENSOR_DATA_TYPE
  end
  struct DML_FEATURE_DATA_TENSOR_DATA_TYPE_SUPPORT
    is_supported : LibC::BOOL
  end
  struct DML_FEATURE_QUERY_FEATURE_LEVELS
    requested_feature_level_count : UInt32
    requested_feature_levels : DML_FEATURE_LEVEL*
  end
  struct DML_FEATURE_DATA_FEATURE_LEVELS
    max_supported_feature_level : DML_FEATURE_LEVEL
  end
  struct DML_BINDING_TABLE_DESC
    dispatchable : IDMLDispatchable
    cpu_descriptor_handle : D3D12_CPU_DESCRIPTOR_HANDLE
    gpu_descriptor_handle : D3D12_GPU_DESCRIPTOR_HANDLE
    size_in_descriptors : UInt32
  end
  struct DML_BINDING_PROPERTIES
    required_descriptor_count : UInt32
    temporary_resource_size : UInt64
    persistent_resource_size : UInt64
  end
  struct DML_BINDING_DESC
    type : DML_BINDING_TYPE
    desc : Void*
  end
  struct DML_BUFFER_BINDING
    buffer : ID3D12Resource
    offset : UInt64
    size_in_bytes : UInt64
  end
  struct DML_BUFFER_ARRAY_BINDING
    binding_count : UInt32
    bindings : DML_BUFFER_BINDING*
  end
  struct DML_GRAPH_EDGE_DESC
    type : DML_GRAPH_EDGE_TYPE
    desc : Void*
  end
  struct DML_INPUT_GRAPH_EDGE_DESC
    graph_input_index : UInt32
    to_node_index : UInt32
    to_node_input_index : UInt32
    name : PSTR
  end
  struct DML_OUTPUT_GRAPH_EDGE_DESC
    from_node_index : UInt32
    from_node_output_index : UInt32
    graph_output_index : UInt32
    name : PSTR
  end
  struct DML_INTERMEDIATE_GRAPH_EDGE_DESC
    from_node_index : UInt32
    from_node_output_index : UInt32
    to_node_index : UInt32
    to_node_input_index : UInt32
    name : PSTR
  end
  struct DML_GRAPH_NODE_DESC
    type : DML_GRAPH_NODE_TYPE
    desc : Void*
  end
  struct DML_OPERATOR_GRAPH_NODE_DESC
    operator : IDMLOperator
    name : PSTR
  end
  struct DML_GRAPH_DESC
    input_count : UInt32
    output_count : UInt32
    node_count : UInt32
    nodes : DML_GRAPH_NODE_DESC*
    input_edge_count : UInt32
    input_edges : DML_GRAPH_EDGE_DESC*
    output_edge_count : UInt32
    output_edges : DML_GRAPH_EDGE_DESC*
    intermediate_edge_count : UInt32
    intermediate_edges : DML_GRAPH_EDGE_DESC*
  end


  struct IDMLObjectVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_private_data : UInt64
    set_private_data : UInt64
    set_private_data_interface : UInt64
    set_name : UInt64
  end

  IDMLObject_GUID = "c8263aac-9e0c-4a2d-9b8e-007521a3317c"
  IID_IDMLObject = LibC::GUID.new(0xc8263aac_u32, 0x9e0c_u16, 0x4a2d_u16, StaticArray[0x9b_u8, 0x8e_u8, 0x0_u8, 0x75_u8, 0x21_u8, 0xa3_u8, 0x31_u8, 0x7c_u8])
  struct IDMLObject
    lpVtbl : IDMLObjectVTbl*
  end

  struct IDMLDeviceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_private_data : UInt64
    set_private_data : UInt64
    set_private_data_interface : UInt64
    set_name : UInt64
    check_feature_support : UInt64
    create_operator : UInt64
    compile_operator : UInt64
    create_operator_initializer : UInt64
    create_command_recorder : UInt64
    create_binding_table : UInt64
    evict : UInt64
    make_resident : UInt64
    get_device_removed_reason : UInt64
    get_parent_device : UInt64
  end

  IDMLDevice_GUID = "6dbd6437-96fd-423f-a98c-ae5e7c2a573f"
  IID_IDMLDevice = LibC::GUID.new(0x6dbd6437_u32, 0x96fd_u16, 0x423f_u16, StaticArray[0xa9_u8, 0x8c_u8, 0xae_u8, 0x5e_u8, 0x7c_u8, 0x2a_u8, 0x57_u8, 0x3f_u8])
  struct IDMLDevice
    lpVtbl : IDMLDeviceVTbl*
  end

  struct IDMLDeviceChildVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_private_data : UInt64
    set_private_data : UInt64
    set_private_data_interface : UInt64
    set_name : UInt64
    get_device : UInt64
  end

  IDMLDeviceChild_GUID = "27e83142-8165-49e3-974e-2fd66e4cb69d"
  IID_IDMLDeviceChild = LibC::GUID.new(0x27e83142_u32, 0x8165_u16, 0x49e3_u16, StaticArray[0x97_u8, 0x4e_u8, 0x2f_u8, 0xd6_u8, 0x6e_u8, 0x4c_u8, 0xb6_u8, 0x9d_u8])
  struct IDMLDeviceChild
    lpVtbl : IDMLDeviceChildVTbl*
  end

  struct IDMLPageableVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_private_data : UInt64
    set_private_data : UInt64
    set_private_data_interface : UInt64
    set_name : UInt64
    get_device : UInt64
  end

  IDMLPageable_GUID = "b1ab0825-4542-4a4b-8617-6dde6e8f6201"
  IID_IDMLPageable = LibC::GUID.new(0xb1ab0825_u32, 0x4542_u16, 0x4a4b_u16, StaticArray[0x86_u8, 0x17_u8, 0x6d_u8, 0xde_u8, 0x6e_u8, 0x8f_u8, 0x62_u8, 0x1_u8])
  struct IDMLPageable
    lpVtbl : IDMLPageableVTbl*
  end

  struct IDMLOperatorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_private_data : UInt64
    set_private_data : UInt64
    set_private_data_interface : UInt64
    set_name : UInt64
    get_device : UInt64
  end

  IDMLOperator_GUID = "26caae7a-3081-4633-9581-226fbe57695d"
  IID_IDMLOperator = LibC::GUID.new(0x26caae7a_u32, 0x3081_u16, 0x4633_u16, StaticArray[0x95_u8, 0x81_u8, 0x22_u8, 0x6f_u8, 0xbe_u8, 0x57_u8, 0x69_u8, 0x5d_u8])
  struct IDMLOperator
    lpVtbl : IDMLOperatorVTbl*
  end

  struct IDMLDispatchableVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_private_data : UInt64
    set_private_data : UInt64
    set_private_data_interface : UInt64
    set_name : UInt64
    get_device : UInt64
    get_binding_properties : UInt64
  end

  IDMLDispatchable_GUID = "dcb821a8-1039-441e-9f1c-b1759c2f3cec"
  IID_IDMLDispatchable = LibC::GUID.new(0xdcb821a8_u32, 0x1039_u16, 0x441e_u16, StaticArray[0x9f_u8, 0x1c_u8, 0xb1_u8, 0x75_u8, 0x9c_u8, 0x2f_u8, 0x3c_u8, 0xec_u8])
  struct IDMLDispatchable
    lpVtbl : IDMLDispatchableVTbl*
  end

  struct IDMLCompiledOperatorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_private_data : UInt64
    set_private_data : UInt64
    set_private_data_interface : UInt64
    set_name : UInt64
    get_device : UInt64
    get_binding_properties : UInt64
  end

  IDMLCompiledOperator_GUID = "6b15e56a-bf5c-4902-92d8-da3a650afea4"
  IID_IDMLCompiledOperator = LibC::GUID.new(0x6b15e56a_u32, 0xbf5c_u16, 0x4902_u16, StaticArray[0x92_u8, 0xd8_u8, 0xda_u8, 0x3a_u8, 0x65_u8, 0xa_u8, 0xfe_u8, 0xa4_u8])
  struct IDMLCompiledOperator
    lpVtbl : IDMLCompiledOperatorVTbl*
  end

  struct IDMLOperatorInitializerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_private_data : UInt64
    set_private_data : UInt64
    set_private_data_interface : UInt64
    set_name : UInt64
    get_device : UInt64
    get_binding_properties : UInt64
    reset : UInt64
  end

  IDMLOperatorInitializer_GUID = "427c1113-435c-469c-8676-4d5dd072f813"
  IID_IDMLOperatorInitializer = LibC::GUID.new(0x427c1113_u32, 0x435c_u16, 0x469c_u16, StaticArray[0x86_u8, 0x76_u8, 0x4d_u8, 0x5d_u8, 0xd0_u8, 0x72_u8, 0xf8_u8, 0x13_u8])
  struct IDMLOperatorInitializer
    lpVtbl : IDMLOperatorInitializerVTbl*
  end

  struct IDMLBindingTableVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_private_data : UInt64
    set_private_data : UInt64
    set_private_data_interface : UInt64
    set_name : UInt64
    get_device : UInt64
    bind_inputs : UInt64
    bind_outputs : UInt64
    bind_temporary_resource : UInt64
    bind_persistent_resource : UInt64
    reset : UInt64
  end

  IDMLBindingTable_GUID = "29c687dc-de74-4e3b-ab00-1168f2fc3cfc"
  IID_IDMLBindingTable = LibC::GUID.new(0x29c687dc_u32, 0xde74_u16, 0x4e3b_u16, StaticArray[0xab_u8, 0x0_u8, 0x11_u8, 0x68_u8, 0xf2_u8, 0xfc_u8, 0x3c_u8, 0xfc_u8])
  struct IDMLBindingTable
    lpVtbl : IDMLBindingTableVTbl*
  end

  struct IDMLCommandRecorderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_private_data : UInt64
    set_private_data : UInt64
    set_private_data_interface : UInt64
    set_name : UInt64
    get_device : UInt64
    record_dispatch : UInt64
  end

  IDMLCommandRecorder_GUID = "e6857a76-2e3e-4fdd-bff4-5d2ba10fb453"
  IID_IDMLCommandRecorder = LibC::GUID.new(0xe6857a76_u32, 0x2e3e_u16, 0x4fdd_u16, StaticArray[0xbf_u8, 0xf4_u8, 0x5d_u8, 0x2b_u8, 0xa1_u8, 0xf_u8, 0xb4_u8, 0x53_u8])
  struct IDMLCommandRecorder
    lpVtbl : IDMLCommandRecorderVTbl*
  end

  struct IDMLDebugDeviceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_mute_debug_output : UInt64
  end

  IDMLDebugDevice_GUID = "7d6f3ac9-394a-4ac3-92a7-390cc57a8217"
  IID_IDMLDebugDevice = LibC::GUID.new(0x7d6f3ac9_u32, 0x394a_u16, 0x4ac3_u16, StaticArray[0x92_u8, 0xa7_u8, 0x39_u8, 0xc_u8, 0xc5_u8, 0x7a_u8, 0x82_u8, 0x17_u8])
  struct IDMLDebugDevice
    lpVtbl : IDMLDebugDeviceVTbl*
  end

  struct IDMLDevice1VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_private_data : UInt64
    set_private_data : UInt64
    set_private_data_interface : UInt64
    set_name : UInt64
    check_feature_support : UInt64
    create_operator : UInt64
    compile_operator : UInt64
    create_operator_initializer : UInt64
    create_command_recorder : UInt64
    create_binding_table : UInt64
    evict : UInt64
    make_resident : UInt64
    get_device_removed_reason : UInt64
    get_parent_device : UInt64
    compile_graph : UInt64
  end

  IDMLDevice1_GUID = "a0884f9a-d2be-4355-aa5d-5901281ad1d2"
  IID_IDMLDevice1 = LibC::GUID.new(0xa0884f9a_u32, 0xd2be_u16, 0x4355_u16, StaticArray[0xaa_u8, 0x5d_u8, 0x59_u8, 0x1_u8, 0x28_u8, 0x1a_u8, 0xd1_u8, 0xd2_u8])
  struct IDMLDevice1
    lpVtbl : IDMLDevice1VTbl*
  end


  # Params # d3d12device : ID3D12Device [In],flags : DML_CREATE_DEVICE_FLAGS [In],riid : Guid* [In],ppv : Void** [In]
  fun DMLCreateDevice(d3d12device : ID3D12Device, flags : DML_CREATE_DEVICE_FLAGS, riid : Guid*, ppv : Void**) : HRESULT

  # Params # d3d12device : ID3D12Device [In],flags : DML_CREATE_DEVICE_FLAGS [In],minimumfeaturelevel : DML_FEATURE_LEVEL [In],riid : Guid* [In],ppv : Void** [In]
  fun DMLCreateDevice1(d3d12device : ID3D12Device, flags : DML_CREATE_DEVICE_FLAGS, minimumfeaturelevel : DML_FEATURE_LEVEL, riid : Guid*, ppv : Void**) : HRESULT
end
struct LibWin32::IDMLObject
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_private_data(guid : Guid*, datasize : UInt32*, data : Void*) : HRESULT
    @lpVtbl.value.get_private_data.unsafe_as(Proc(Guid*, UInt32*, Void*, HRESULT)).call(guid, datasize, data)
  end
  def set_private_data(guid : Guid*, datasize : UInt32, data : Void*) : HRESULT
    @lpVtbl.value.set_private_data.unsafe_as(Proc(Guid*, UInt32, Void*, HRESULT)).call(guid, datasize, data)
  end
  def set_private_data_interface(guid : Guid*, data : IUnknown) : HRESULT
    @lpVtbl.value.set_private_data_interface.unsafe_as(Proc(Guid*, IUnknown, HRESULT)).call(guid, data)
  end
  def set_name(name : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(name)
  end
end
struct LibWin32::IDMLDevice
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_private_data(guid : Guid*, datasize : UInt32*, data : Void*) : HRESULT
    @lpVtbl.value.get_private_data.unsafe_as(Proc(Guid*, UInt32*, Void*, HRESULT)).call(guid, datasize, data)
  end
  def set_private_data(guid : Guid*, datasize : UInt32, data : Void*) : HRESULT
    @lpVtbl.value.set_private_data.unsafe_as(Proc(Guid*, UInt32, Void*, HRESULT)).call(guid, datasize, data)
  end
  def set_private_data_interface(guid : Guid*, data : IUnknown) : HRESULT
    @lpVtbl.value.set_private_data_interface.unsafe_as(Proc(Guid*, IUnknown, HRESULT)).call(guid, data)
  end
  def set_name(name : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(name)
  end
  def check_feature_support(feature : DML_FEATURE, featurequerydatasize : UInt32, featurequerydata : Void*, featuresupportdatasize : UInt32, featuresupportdata : Void*) : HRESULT
    @lpVtbl.value.check_feature_support.unsafe_as(Proc(DML_FEATURE, UInt32, Void*, UInt32, Void*, HRESULT)).call(feature, featurequerydatasize, featurequerydata, featuresupportdatasize, featuresupportdata)
  end
  def create_operator(desc : DML_OPERATOR_DESC*, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.create_operator.unsafe_as(Proc(DML_OPERATOR_DESC*, Guid*, Void**, HRESULT)).call(desc, riid, ppv)
  end
  def compile_operator(op : IDMLOperator, flags : DML_EXECUTION_FLAGS, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.compile_operator.unsafe_as(Proc(IDMLOperator, DML_EXECUTION_FLAGS, Guid*, Void**, HRESULT)).call(op, flags, riid, ppv)
  end
  def create_operator_initializer(operatorcount : UInt32, operators : IDMLCompiledOperator*, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.create_operator_initializer.unsafe_as(Proc(UInt32, IDMLCompiledOperator*, Guid*, Void**, HRESULT)).call(operatorcount, operators, riid, ppv)
  end
  def create_command_recorder(riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.create_command_recorder.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppv)
  end
  def create_binding_table(desc : DML_BINDING_TABLE_DESC*, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.create_binding_table.unsafe_as(Proc(DML_BINDING_TABLE_DESC*, Guid*, Void**, HRESULT)).call(desc, riid, ppv)
  end
  def evict(count : UInt32, ppobjects : IDMLPageable*) : HRESULT
    @lpVtbl.value.evict.unsafe_as(Proc(UInt32, IDMLPageable*, HRESULT)).call(count, ppobjects)
  end
  def make_resident(count : UInt32, ppobjects : IDMLPageable*) : HRESULT
    @lpVtbl.value.make_resident.unsafe_as(Proc(UInt32, IDMLPageable*, HRESULT)).call(count, ppobjects)
  end
  def get_device_removed_reason : HRESULT
    @lpVtbl.value.get_device_removed_reason.unsafe_as(Proc(HRESULT)).call
  end
  def get_parent_device(riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_parent_device.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppv)
  end
end
struct LibWin32::IDMLDeviceChild
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_private_data(guid : Guid*, datasize : UInt32*, data : Void*) : HRESULT
    @lpVtbl.value.get_private_data.unsafe_as(Proc(Guid*, UInt32*, Void*, HRESULT)).call(guid, datasize, data)
  end
  def set_private_data(guid : Guid*, datasize : UInt32, data : Void*) : HRESULT
    @lpVtbl.value.set_private_data.unsafe_as(Proc(Guid*, UInt32, Void*, HRESULT)).call(guid, datasize, data)
  end
  def set_private_data_interface(guid : Guid*, data : IUnknown) : HRESULT
    @lpVtbl.value.set_private_data_interface.unsafe_as(Proc(Guid*, IUnknown, HRESULT)).call(guid, data)
  end
  def set_name(name : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(name)
  end
  def get_device(riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_device.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppv)
  end
end
struct LibWin32::IDMLPageable
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_private_data(guid : Guid*, datasize : UInt32*, data : Void*) : HRESULT
    @lpVtbl.value.get_private_data.unsafe_as(Proc(Guid*, UInt32*, Void*, HRESULT)).call(guid, datasize, data)
  end
  def set_private_data(guid : Guid*, datasize : UInt32, data : Void*) : HRESULT
    @lpVtbl.value.set_private_data.unsafe_as(Proc(Guid*, UInt32, Void*, HRESULT)).call(guid, datasize, data)
  end
  def set_private_data_interface(guid : Guid*, data : IUnknown) : HRESULT
    @lpVtbl.value.set_private_data_interface.unsafe_as(Proc(Guid*, IUnknown, HRESULT)).call(guid, data)
  end
  def set_name(name : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(name)
  end
  def get_device(riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_device.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppv)
  end
end
struct LibWin32::IDMLOperator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_private_data(guid : Guid*, datasize : UInt32*, data : Void*) : HRESULT
    @lpVtbl.value.get_private_data.unsafe_as(Proc(Guid*, UInt32*, Void*, HRESULT)).call(guid, datasize, data)
  end
  def set_private_data(guid : Guid*, datasize : UInt32, data : Void*) : HRESULT
    @lpVtbl.value.set_private_data.unsafe_as(Proc(Guid*, UInt32, Void*, HRESULT)).call(guid, datasize, data)
  end
  def set_private_data_interface(guid : Guid*, data : IUnknown) : HRESULT
    @lpVtbl.value.set_private_data_interface.unsafe_as(Proc(Guid*, IUnknown, HRESULT)).call(guid, data)
  end
  def set_name(name : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(name)
  end
  def get_device(riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_device.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppv)
  end
end
struct LibWin32::IDMLDispatchable
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_private_data(guid : Guid*, datasize : UInt32*, data : Void*) : HRESULT
    @lpVtbl.value.get_private_data.unsafe_as(Proc(Guid*, UInt32*, Void*, HRESULT)).call(guid, datasize, data)
  end
  def set_private_data(guid : Guid*, datasize : UInt32, data : Void*) : HRESULT
    @lpVtbl.value.set_private_data.unsafe_as(Proc(Guid*, UInt32, Void*, HRESULT)).call(guid, datasize, data)
  end
  def set_private_data_interface(guid : Guid*, data : IUnknown) : HRESULT
    @lpVtbl.value.set_private_data_interface.unsafe_as(Proc(Guid*, IUnknown, HRESULT)).call(guid, data)
  end
  def set_name(name : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(name)
  end
  def get_device(riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_device.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppv)
  end
  def get_binding_properties : DML_BINDING_PROPERTIES
    @lpVtbl.value.get_binding_properties.unsafe_as(Proc(DML_BINDING_PROPERTIES)).call
  end
end
struct LibWin32::IDMLCompiledOperator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_private_data(guid : Guid*, datasize : UInt32*, data : Void*) : HRESULT
    @lpVtbl.value.get_private_data.unsafe_as(Proc(Guid*, UInt32*, Void*, HRESULT)).call(guid, datasize, data)
  end
  def set_private_data(guid : Guid*, datasize : UInt32, data : Void*) : HRESULT
    @lpVtbl.value.set_private_data.unsafe_as(Proc(Guid*, UInt32, Void*, HRESULT)).call(guid, datasize, data)
  end
  def set_private_data_interface(guid : Guid*, data : IUnknown) : HRESULT
    @lpVtbl.value.set_private_data_interface.unsafe_as(Proc(Guid*, IUnknown, HRESULT)).call(guid, data)
  end
  def set_name(name : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(name)
  end
  def get_device(riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_device.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppv)
  end
  def get_binding_properties : DML_BINDING_PROPERTIES
    @lpVtbl.value.get_binding_properties.unsafe_as(Proc(DML_BINDING_PROPERTIES)).call
  end
end
struct LibWin32::IDMLOperatorInitializer
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_private_data(guid : Guid*, datasize : UInt32*, data : Void*) : HRESULT
    @lpVtbl.value.get_private_data.unsafe_as(Proc(Guid*, UInt32*, Void*, HRESULT)).call(guid, datasize, data)
  end
  def set_private_data(guid : Guid*, datasize : UInt32, data : Void*) : HRESULT
    @lpVtbl.value.set_private_data.unsafe_as(Proc(Guid*, UInt32, Void*, HRESULT)).call(guid, datasize, data)
  end
  def set_private_data_interface(guid : Guid*, data : IUnknown) : HRESULT
    @lpVtbl.value.set_private_data_interface.unsafe_as(Proc(Guid*, IUnknown, HRESULT)).call(guid, data)
  end
  def set_name(name : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(name)
  end
  def get_device(riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_device.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppv)
  end
  def get_binding_properties : DML_BINDING_PROPERTIES
    @lpVtbl.value.get_binding_properties.unsafe_as(Proc(DML_BINDING_PROPERTIES)).call
  end
  def reset(operatorcount : UInt32, operators : IDMLCompiledOperator*) : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(UInt32, IDMLCompiledOperator*, HRESULT)).call(operatorcount, operators)
  end
end
struct LibWin32::IDMLBindingTable
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_private_data(guid : Guid*, datasize : UInt32*, data : Void*) : HRESULT
    @lpVtbl.value.get_private_data.unsafe_as(Proc(Guid*, UInt32*, Void*, HRESULT)).call(guid, datasize, data)
  end
  def set_private_data(guid : Guid*, datasize : UInt32, data : Void*) : HRESULT
    @lpVtbl.value.set_private_data.unsafe_as(Proc(Guid*, UInt32, Void*, HRESULT)).call(guid, datasize, data)
  end
  def set_private_data_interface(guid : Guid*, data : IUnknown) : HRESULT
    @lpVtbl.value.set_private_data_interface.unsafe_as(Proc(Guid*, IUnknown, HRESULT)).call(guid, data)
  end
  def set_name(name : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(name)
  end
  def get_device(riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_device.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppv)
  end
  def bind_inputs(bindingcount : UInt32, bindings : DML_BINDING_DESC*) : Void
    @lpVtbl.value.bind_inputs.unsafe_as(Proc(UInt32, DML_BINDING_DESC*, Void)).call(bindingcount, bindings)
  end
  def bind_outputs(bindingcount : UInt32, bindings : DML_BINDING_DESC*) : Void
    @lpVtbl.value.bind_outputs.unsafe_as(Proc(UInt32, DML_BINDING_DESC*, Void)).call(bindingcount, bindings)
  end
  def bind_temporary_resource(binding : DML_BINDING_DESC*) : Void
    @lpVtbl.value.bind_temporary_resource.unsafe_as(Proc(DML_BINDING_DESC*, Void)).call(binding)
  end
  def bind_persistent_resource(binding : DML_BINDING_DESC*) : Void
    @lpVtbl.value.bind_persistent_resource.unsafe_as(Proc(DML_BINDING_DESC*, Void)).call(binding)
  end
  def reset(desc : DML_BINDING_TABLE_DESC*) : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(DML_BINDING_TABLE_DESC*, HRESULT)).call(desc)
  end
end
struct LibWin32::IDMLCommandRecorder
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_private_data(guid : Guid*, datasize : UInt32*, data : Void*) : HRESULT
    @lpVtbl.value.get_private_data.unsafe_as(Proc(Guid*, UInt32*, Void*, HRESULT)).call(guid, datasize, data)
  end
  def set_private_data(guid : Guid*, datasize : UInt32, data : Void*) : HRESULT
    @lpVtbl.value.set_private_data.unsafe_as(Proc(Guid*, UInt32, Void*, HRESULT)).call(guid, datasize, data)
  end
  def set_private_data_interface(guid : Guid*, data : IUnknown) : HRESULT
    @lpVtbl.value.set_private_data_interface.unsafe_as(Proc(Guid*, IUnknown, HRESULT)).call(guid, data)
  end
  def set_name(name : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(name)
  end
  def get_device(riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_device.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppv)
  end
  def record_dispatch(commandlist : ID3D12CommandList, dispatchable : IDMLDispatchable, bindings : IDMLBindingTable) : Void
    @lpVtbl.value.record_dispatch.unsafe_as(Proc(ID3D12CommandList, IDMLDispatchable, IDMLBindingTable, Void)).call(commandlist, dispatchable, bindings)
  end
end
struct LibWin32::IDMLDebugDevice
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_mute_debug_output(mute : LibC::BOOL) : Void
    @lpVtbl.value.set_mute_debug_output.unsafe_as(Proc(LibC::BOOL, Void)).call(mute)
  end
end
struct LibWin32::IDMLDevice1
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_private_data(guid : Guid*, datasize : UInt32*, data : Void*) : HRESULT
    @lpVtbl.value.get_private_data.unsafe_as(Proc(Guid*, UInt32*, Void*, HRESULT)).call(guid, datasize, data)
  end
  def set_private_data(guid : Guid*, datasize : UInt32, data : Void*) : HRESULT
    @lpVtbl.value.set_private_data.unsafe_as(Proc(Guid*, UInt32, Void*, HRESULT)).call(guid, datasize, data)
  end
  def set_private_data_interface(guid : Guid*, data : IUnknown) : HRESULT
    @lpVtbl.value.set_private_data_interface.unsafe_as(Proc(Guid*, IUnknown, HRESULT)).call(guid, data)
  end
  def set_name(name : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(name)
  end
  def check_feature_support(feature : DML_FEATURE, featurequerydatasize : UInt32, featurequerydata : Void*, featuresupportdatasize : UInt32, featuresupportdata : Void*) : HRESULT
    @lpVtbl.value.check_feature_support.unsafe_as(Proc(DML_FEATURE, UInt32, Void*, UInt32, Void*, HRESULT)).call(feature, featurequerydatasize, featurequerydata, featuresupportdatasize, featuresupportdata)
  end
  def create_operator(desc : DML_OPERATOR_DESC*, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.create_operator.unsafe_as(Proc(DML_OPERATOR_DESC*, Guid*, Void**, HRESULT)).call(desc, riid, ppv)
  end
  def compile_operator(op : IDMLOperator, flags : DML_EXECUTION_FLAGS, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.compile_operator.unsafe_as(Proc(IDMLOperator, DML_EXECUTION_FLAGS, Guid*, Void**, HRESULT)).call(op, flags, riid, ppv)
  end
  def create_operator_initializer(operatorcount : UInt32, operators : IDMLCompiledOperator*, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.create_operator_initializer.unsafe_as(Proc(UInt32, IDMLCompiledOperator*, Guid*, Void**, HRESULT)).call(operatorcount, operators, riid, ppv)
  end
  def create_command_recorder(riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.create_command_recorder.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppv)
  end
  def create_binding_table(desc : DML_BINDING_TABLE_DESC*, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.create_binding_table.unsafe_as(Proc(DML_BINDING_TABLE_DESC*, Guid*, Void**, HRESULT)).call(desc, riid, ppv)
  end
  def evict(count : UInt32, ppobjects : IDMLPageable*) : HRESULT
    @lpVtbl.value.evict.unsafe_as(Proc(UInt32, IDMLPageable*, HRESULT)).call(count, ppobjects)
  end
  def make_resident(count : UInt32, ppobjects : IDMLPageable*) : HRESULT
    @lpVtbl.value.make_resident.unsafe_as(Proc(UInt32, IDMLPageable*, HRESULT)).call(count, ppobjects)
  end
  def get_device_removed_reason : HRESULT
    @lpVtbl.value.get_device_removed_reason.unsafe_as(Proc(HRESULT)).call
  end
  def get_parent_device(riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_parent_device.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppv)
  end
  def compile_graph(desc : DML_GRAPH_DESC*, flags : DML_EXECUTION_FLAGS, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.compile_graph.unsafe_as(Proc(DML_GRAPH_DESC*, DML_EXECUTION_FLAGS, Guid*, Void**, HRESULT)).call(desc, flags, riid, ppv)
  end
end
