require "../../foundation.cr"
require "../../graphics/direct3d12.cr"
require "../../system/com.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:winml.dll")]
@[Link(ldflags: "/DELAYLOAD:windows.ai.machinelearning.dll")]
lib LibWin32
  WINML_TENSOR_DIMENSION_COUNT_MAX = 4_u32


  enum WINML_TENSOR_DATA_TYPE : Int32
    WINML_TENSOR_UNDEFINED = 0
    WINML_TENSOR_FLOAT = 1
    WINML_TENSOR_UINT8 = 2
    WINML_TENSOR_INT8 = 3
    WINML_TENSOR_UINT16 = 4
    WINML_TENSOR_INT16 = 5
    WINML_TENSOR_INT32 = 6
    WINML_TENSOR_INT64 = 7
    WINML_TENSOR_STRING = 8
    WINML_TENSOR_BOOLEAN = 9
    WINML_TENSOR_FLOAT16 = 10
    WINML_TENSOR_DOUBLE = 11
    WINML_TENSOR_UINT32 = 12
    WINML_TENSOR_UINT64 = 13
    WINML_TENSOR_COMPLEX64 = 14
    WINML_TENSOR_COMPLEX128 = 15
  end

  enum WINML_FEATURE_TYPE : Int32
    WINML_FEATURE_UNDEFINED = 0
    WINML_FEATURE_TENSOR = 1
    WINML_FEATURE_SEQUENCE = 2
    WINML_FEATURE_MAP = 3
    WINML_FEATURE_IMAGE = 4
  end

  enum WINML_BINDING_TYPE : Int32
    WINML_BINDING_UNDEFINED = 0
    WINML_BINDING_TENSOR = 1
    WINML_BINDING_SEQUENCE = 2
    WINML_BINDING_MAP = 3
    WINML_BINDING_IMAGE = 4
    WINML_BINDING_RESOURCE = 5
  end

  enum WINML_RUNTIME_TYPE : Int32
    WINML_RUNTIME_CNTK = 0
  end

  enum MLOperatorAttributeType : UInt32
    Undefined = 0
    Float = 2
    Int = 3
    String = 4
    FloatArray = 7
    IntArray = 8
    StringArray = 9
  end

  enum MLOperatorTensorDataType : UInt32
    Undefined = 0
    Float = 1
    UInt8 = 2
    Int8 = 3
    UInt16 = 4
    Int16 = 5
    Int32 = 6
    Int64 = 7
    String = 8
    Bool = 9
    Float16 = 10
    Double = 11
    UInt32 = 12
    UInt64 = 13
    Complex64 = 14
    Complex128 = 15
  end

  enum MLOperatorEdgeType : UInt32
    Undefined = 0
    Tensor = 1
  end

  enum MLOperatorParameterOptions : UInt32
    Single = 0
    Optional = 1
    Variadic = 2
  end

  enum MLOperatorSchemaEdgeTypeFormat : Int32
    EdgeDescription = 0
    Label = 1
  end

  enum MLOperatorKernelOptions : UInt32
    None = 0
    AllowDynamicInputShapes = 1
  end

  enum MLOperatorExecutionType : UInt32
    Undefined = 0
    Cpu = 1
    D3D12 = 2
  end

union WINML_SEQUENCE_BINDING_DESC_Anonymous_e__Union
  p_strings : LibC::LPWSTR*
  p_ints : Int64*
  p_floats : Float32*
  p_doubles : Float64*
end
union WINML_MAP_BINDING_DESC_Anonymous2_e__Union
  p_string_fields : LibC::LPWSTR*
  p_int_fields : Int64*
  p_float_fields : Float32*
  p_double_fields : Float64*
end
union WINML_MAP_BINDING_DESC_Anonymous1_e__Union
  p_string_keys : LibC::LPWSTR*
  p_int_keys : Int64*
end
union WINML_BINDING_DESC_Anonymous_e__Union
  tensor : WINML_TENSOR_BINDING_DESC
  sequence : WINML_SEQUENCE_BINDING_DESC
  map : WINML_MAP_BINDING_DESC
  image : WINML_IMAGE_BINDING_DESC
  resource : WINML_RESOURCE_BINDING_DESC
end
union WINML_VARIABLE_DESC_Anonymous_e__Union
  tensor : WINML_TENSOR_VARIABLE_DESC
  sequence : WINML_SEQUENCE_VARIABLE_DESC
  map : WINML_MAP_VARIABLE_DESC
  image : WINML_IMAGE_VARIABLE_DESC
end
union MLOperatorEdgeDescription_Anonymous_e__Union
  reserved : UInt64
  tensor_data_type : MLOperatorTensorDataType
end
union MLOperatorSchemaEdgeDescription_Anonymous_e__Union
  reserved : Void*
  type_label : PSTR
  edge_description : MLOperatorEdgeDescription
end
union MLOperatorAttributeNameValue_Anonymous_e__Union
  reserved : Void*
  ints : Int64*
  strings : Int8**
  floats : Float32*
end

  struct WINML_TENSOR_BINDING_DESC
    data_type : WINML_TENSOR_DATA_TYPE
    num_dimensions : UInt32
    p_shape : Int64*
    data_size : UInt32
    p_data : Void*
  end
  struct WINML_SEQUENCE_BINDING_DESC
    element_count : UInt32
    element_type : WINML_TENSOR_DATA_TYPE
    anonymous : WINML_SEQUENCE_BINDING_DESC_Anonymous_e__Union
  end
  struct WINML_MAP_BINDING_DESC
    element_count : UInt32
    key_type : WINML_TENSOR_DATA_TYPE
    anonymous1 : WINML_MAP_BINDING_DESC_Anonymous1_e__Union
    fields : WINML_TENSOR_DATA_TYPE
    anonymous2 : WINML_MAP_BINDING_DESC_Anonymous2_e__Union
  end
  struct WINML_IMAGE_BINDING_DESC
    element_type : WINML_TENSOR_DATA_TYPE
    num_dimensions : UInt32
    p_shape : Int64*
    data_size : UInt32
    p_data : Void*
  end
  struct WINML_RESOURCE_BINDING_DESC
    element_type : WINML_TENSOR_DATA_TYPE
    num_dimensions : UInt32
    p_shape : Int64*
    p_resource : ID3D12Resource
  end
  struct WINML_BINDING_DESC
    name : LibC::LPWSTR
    bind_type : WINML_BINDING_TYPE
    anonymous : WINML_BINDING_DESC_Anonymous_e__Union
  end
  struct WINML_TENSOR_VARIABLE_DESC
    element_type : WINML_TENSOR_DATA_TYPE
    num_dimensions : UInt32
    p_shape : Int64*
  end
  struct WINML_SEQUENCE_VARIABLE_DESC
    element_type : WINML_TENSOR_DATA_TYPE
  end
  struct WINML_MAP_VARIABLE_DESC
    key_type : WINML_TENSOR_DATA_TYPE
    fields : WINML_TENSOR_DATA_TYPE
  end
  struct WINML_IMAGE_VARIABLE_DESC
    element_type : WINML_TENSOR_DATA_TYPE
    num_dimensions : UInt32
    p_shape : Int64*
  end
  struct WINML_VARIABLE_DESC
    name : LibC::LPWSTR
    description : LibC::LPWSTR
    feature_type : WINML_FEATURE_TYPE
    required : LibC::BOOL
    anonymous : WINML_VARIABLE_DESC_Anonymous_e__Union
  end
  struct WINML_MODEL_DESC
    author : LibC::LPWSTR
    name : LibC::LPWSTR
    domain : LibC::LPWSTR
    description : LibC::LPWSTR
    version : LibC::UINT_PTR
  end
  struct MLOperatorEdgeDescription
    edge_type : MLOperatorEdgeType
    anonymous : MLOperatorEdgeDescription_Anonymous_e__Union
  end
  struct MLOperatorSchemaEdgeDescription
    options : MLOperatorParameterOptions
    type_format : MLOperatorSchemaEdgeTypeFormat
    anonymous : MLOperatorSchemaEdgeDescription_Anonymous_e__Union
  end
  struct MLOperatorEdgeTypeConstraint
    type_label : PSTR
    allowed_types : MLOperatorEdgeDescription*
    allowed_type_count : UInt32
  end
  struct MLOperatorAttribute
    name : PSTR
    type : MLOperatorAttributeType
    required : Bool
  end
  struct MLOperatorAttributeNameValue
    name : PSTR
    type : MLOperatorAttributeType
    value_count : UInt32
    anonymous : MLOperatorAttributeNameValue_Anonymous_e__Union
  end
  struct MLOperatorSchemaDescription
    name : PSTR
    operator_set_version_at_last_change : Int32
    inputs : MLOperatorSchemaEdgeDescription*
    input_count : UInt32
    outputs : MLOperatorSchemaEdgeDescription*
    output_count : UInt32
    type_constraints : MLOperatorEdgeTypeConstraint*
    type_constraint_count : UInt32
    attributes : MLOperatorAttribute*
    attribute_count : UInt32
    default_attributes : MLOperatorAttributeNameValue*
    default_attribute_count : UInt32
  end
  struct MLOperatorSetId
    domain : PSTR
    version : Int32
  end
  struct MLOperatorKernelDescription
    domain : PSTR
    name : PSTR
    minimum_operator_set_version : Int32
    execution_type : MLOperatorExecutionType
    type_constraints : MLOperatorEdgeTypeConstraint*
    type_constraint_count : UInt32
    default_attributes : MLOperatorAttributeNameValue*
    default_attribute_count : UInt32
    options : MLOperatorKernelOptions
    execution_options : UInt32
  end


  struct IWinMLModelVTbl
    query_interface : Proc(IWinMLModel*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWinMLModel*, UInt32)
    release : Proc(IWinMLModel*, UInt32)
    get_description : Proc(IWinMLModel*, WINML_MODEL_DESC**, HRESULT)
    enumerate_metadata : Proc(IWinMLModel*, UInt32, LibC::LPWSTR*, LibC::LPWSTR*, HRESULT)
    enumerate_model_inputs : Proc(IWinMLModel*, UInt32, WINML_VARIABLE_DESC**, HRESULT)
    enumerate_model_outputs : Proc(IWinMLModel*, UInt32, WINML_VARIABLE_DESC**, HRESULT)
  end

  struct IWinMLModel
    lpVtbl : IWinMLModelVTbl*
  end

  struct IWinMLEvaluationContextVTbl
    query_interface : Proc(IWinMLEvaluationContext*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWinMLEvaluationContext*, UInt32)
    release : Proc(IWinMLEvaluationContext*, UInt32)
    bind_value : Proc(IWinMLEvaluationContext*, WINML_BINDING_DESC*, HRESULT)
    get_value_by_name : Proc(IWinMLEvaluationContext*, LibC::LPWSTR, WINML_BINDING_DESC**, HRESULT)
    clear : Proc(IWinMLEvaluationContext*, HRESULT)
  end

  struct IWinMLEvaluationContext
    lpVtbl : IWinMLEvaluationContextVTbl*
  end

  struct IWinMLRuntimeVTbl
    query_interface : Proc(IWinMLRuntime*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWinMLRuntime*, UInt32)
    release : Proc(IWinMLRuntime*, UInt32)
    load_model : Proc(IWinMLRuntime*, LibC::LPWSTR, IWinMLModel*, HRESULT)
    create_evaluation_context : Proc(IWinMLRuntime*, ID3D12Device, IWinMLEvaluationContext*, HRESULT)
    evaluate_model : Proc(IWinMLRuntime*, IWinMLEvaluationContext, HRESULT)
  end

  struct IWinMLRuntime
    lpVtbl : IWinMLRuntimeVTbl*
  end

  struct IWinMLRuntimeFactoryVTbl
    query_interface : Proc(IWinMLRuntimeFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWinMLRuntimeFactory*, UInt32)
    release : Proc(IWinMLRuntimeFactory*, UInt32)
    create_runtime : Proc(IWinMLRuntimeFactory*, WINML_RUNTIME_TYPE, IWinMLRuntime*, HRESULT)
  end

  struct IWinMLRuntimeFactory
    lpVtbl : IWinMLRuntimeFactoryVTbl*
  end

  struct IMLOperatorAttributesVTbl
    query_interface : Proc(IMLOperatorAttributes*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMLOperatorAttributes*, UInt32)
    release : Proc(IMLOperatorAttributes*, UInt32)
    get_attribute_element_count : Proc(IMLOperatorAttributes*, PSTR, MLOperatorAttributeType, UInt32*, HRESULT)
    get_attribute : Proc(IMLOperatorAttributes*, PSTR, MLOperatorAttributeType, UInt32, LibC::UINT_PTR, Void*, HRESULT)
    get_string_attribute_element_length : Proc(IMLOperatorAttributes*, PSTR, UInt32, UInt32*, HRESULT)
    get_string_attribute_element : Proc(IMLOperatorAttributes*, PSTR, UInt32, UInt32, UInt8*, HRESULT)
  end

  struct IMLOperatorAttributes
    lpVtbl : IMLOperatorAttributesVTbl*
  end

  struct IMLOperatorTensorShapeDescriptionVTbl
    query_interface : Proc(IMLOperatorTensorShapeDescription*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMLOperatorTensorShapeDescription*, UInt32)
    release : Proc(IMLOperatorTensorShapeDescription*, UInt32)
    get_input_tensor_dimension_count : Proc(IMLOperatorTensorShapeDescription*, UInt32, UInt32*, HRESULT)
    get_input_tensor_shape : Proc(IMLOperatorTensorShapeDescription*, UInt32, UInt32, UInt32*, HRESULT)
    has_output_shape_description : Proc(IMLOperatorTensorShapeDescription*, Bool)
    get_output_tensor_dimension_count : Proc(IMLOperatorTensorShapeDescription*, UInt32, UInt32*, HRESULT)
    get_output_tensor_shape : Proc(IMLOperatorTensorShapeDescription*, UInt32, UInt32, UInt32*, HRESULT)
  end

  struct IMLOperatorTensorShapeDescription
    lpVtbl : IMLOperatorTensorShapeDescriptionVTbl*
  end

  struct IMLOperatorKernelCreationContextVTbl
    query_interface : Proc(IMLOperatorKernelCreationContext*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMLOperatorKernelCreationContext*, UInt32)
    release : Proc(IMLOperatorKernelCreationContext*, UInt32)
    get_attribute_element_count : Proc(IMLOperatorKernelCreationContext*, PSTR, MLOperatorAttributeType, UInt32*, HRESULT)
    get_attribute : Proc(IMLOperatorKernelCreationContext*, PSTR, MLOperatorAttributeType, UInt32, LibC::UINT_PTR, Void*, HRESULT)
    get_string_attribute_element_length : Proc(IMLOperatorKernelCreationContext*, PSTR, UInt32, UInt32*, HRESULT)
    get_string_attribute_element : Proc(IMLOperatorKernelCreationContext*, PSTR, UInt32, UInt32, UInt8*, HRESULT)
    get_input_count : Proc(IMLOperatorKernelCreationContext*, UInt32)
    get_output_count : Proc(IMLOperatorKernelCreationContext*, UInt32)
    is_input_valid : Proc(IMLOperatorKernelCreationContext*, UInt32, Bool)
    is_output_valid : Proc(IMLOperatorKernelCreationContext*, UInt32, Bool)
    get_input_edge_description : Proc(IMLOperatorKernelCreationContext*, UInt32, MLOperatorEdgeDescription*, HRESULT)
    get_output_edge_description : Proc(IMLOperatorKernelCreationContext*, UInt32, MLOperatorEdgeDescription*, HRESULT)
    has_tensor_shape_description : Proc(IMLOperatorKernelCreationContext*, Bool)
    get_tensor_shape_description : Proc(IMLOperatorKernelCreationContext*, IMLOperatorTensorShapeDescription*, HRESULT)
    get_execution_interface : Proc(IMLOperatorKernelCreationContext*, IUnknown*, Void)
  end

  struct IMLOperatorKernelCreationContext
    lpVtbl : IMLOperatorKernelCreationContextVTbl*
  end

  struct IMLOperatorTensorVTbl
    query_interface : Proc(IMLOperatorTensor*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMLOperatorTensor*, UInt32)
    release : Proc(IMLOperatorTensor*, UInt32)
    get_dimension_count : Proc(IMLOperatorTensor*, UInt32)
    get_shape : Proc(IMLOperatorTensor*, UInt32, UInt32*, HRESULT)
    get_tensor_data_type : Proc(IMLOperatorTensor*, MLOperatorTensorDataType)
    is_cpu_data : Proc(IMLOperatorTensor*, Bool)
    is_data_interface : Proc(IMLOperatorTensor*, Bool)
    get_data : Proc(IMLOperatorTensor*, Void**)
    get_data_interface : Proc(IMLOperatorTensor*, IUnknown*, Void)
  end

  struct IMLOperatorTensor
    lpVtbl : IMLOperatorTensorVTbl*
  end

  struct IMLOperatorKernelContextVTbl
    query_interface : Proc(IMLOperatorKernelContext*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMLOperatorKernelContext*, UInt32)
    release : Proc(IMLOperatorKernelContext*, UInt32)
    get_input_tensor : Proc(IMLOperatorKernelContext*, UInt32, IMLOperatorTensor*, HRESULT)
    get_output_tensor : Proc(IMLOperatorKernelContext*, UInt32, UInt32, UInt32*, IMLOperatorTensor*, HRESULT)
    get_output_tensor2 : Proc(IMLOperatorKernelContext*, UInt32, IMLOperatorTensor*, HRESULT)
    allocate_temporary_data : Proc(IMLOperatorKernelContext*, LibC::UINT_PTR, IUnknown*, HRESULT)
    get_execution_interface : Proc(IMLOperatorKernelContext*, IUnknown*, Void)
  end

  struct IMLOperatorKernelContext
    lpVtbl : IMLOperatorKernelContextVTbl*
  end

  struct IMLOperatorKernelVTbl
    query_interface : Proc(IMLOperatorKernel*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMLOperatorKernel*, UInt32)
    release : Proc(IMLOperatorKernel*, UInt32)
    compute : Proc(IMLOperatorKernel*, IMLOperatorKernelContext, HRESULT)
  end

  struct IMLOperatorKernel
    lpVtbl : IMLOperatorKernelVTbl*
  end

  struct IMLOperatorShapeInferenceContextVTbl
    query_interface : Proc(IMLOperatorShapeInferenceContext*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMLOperatorShapeInferenceContext*, UInt32)
    release : Proc(IMLOperatorShapeInferenceContext*, UInt32)
    get_attribute_element_count : Proc(IMLOperatorShapeInferenceContext*, PSTR, MLOperatorAttributeType, UInt32*, HRESULT)
    get_attribute : Proc(IMLOperatorShapeInferenceContext*, PSTR, MLOperatorAttributeType, UInt32, LibC::UINT_PTR, Void*, HRESULT)
    get_string_attribute_element_length : Proc(IMLOperatorShapeInferenceContext*, PSTR, UInt32, UInt32*, HRESULT)
    get_string_attribute_element : Proc(IMLOperatorShapeInferenceContext*, PSTR, UInt32, UInt32, UInt8*, HRESULT)
    get_input_count : Proc(IMLOperatorShapeInferenceContext*, UInt32)
    get_output_count : Proc(IMLOperatorShapeInferenceContext*, UInt32)
    is_input_valid : Proc(IMLOperatorShapeInferenceContext*, UInt32, Bool)
    is_output_valid : Proc(IMLOperatorShapeInferenceContext*, UInt32, Bool)
    get_input_edge_description : Proc(IMLOperatorShapeInferenceContext*, UInt32, MLOperatorEdgeDescription*, HRESULT)
    get_input_tensor_dimension_count : Proc(IMLOperatorShapeInferenceContext*, UInt32, UInt32*, HRESULT)
    get_input_tensor_shape : Proc(IMLOperatorShapeInferenceContext*, UInt32, UInt32, UInt32*, HRESULT)
    set_output_tensor_shape : Proc(IMLOperatorShapeInferenceContext*, UInt32, UInt32, UInt32*, HRESULT)
  end

  struct IMLOperatorShapeInferenceContext
    lpVtbl : IMLOperatorShapeInferenceContextVTbl*
  end

  struct IMLOperatorTypeInferenceContextVTbl
    query_interface : Proc(IMLOperatorTypeInferenceContext*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMLOperatorTypeInferenceContext*, UInt32)
    release : Proc(IMLOperatorTypeInferenceContext*, UInt32)
    get_attribute_element_count : Proc(IMLOperatorTypeInferenceContext*, PSTR, MLOperatorAttributeType, UInt32*, HRESULT)
    get_attribute : Proc(IMLOperatorTypeInferenceContext*, PSTR, MLOperatorAttributeType, UInt32, LibC::UINT_PTR, Void*, HRESULT)
    get_string_attribute_element_length : Proc(IMLOperatorTypeInferenceContext*, PSTR, UInt32, UInt32*, HRESULT)
    get_string_attribute_element : Proc(IMLOperatorTypeInferenceContext*, PSTR, UInt32, UInt32, UInt8*, HRESULT)
    get_input_count : Proc(IMLOperatorTypeInferenceContext*, UInt32)
    get_output_count : Proc(IMLOperatorTypeInferenceContext*, UInt32)
    is_input_valid : Proc(IMLOperatorTypeInferenceContext*, UInt32, Bool)
    is_output_valid : Proc(IMLOperatorTypeInferenceContext*, UInt32, Bool)
    get_input_edge_description : Proc(IMLOperatorTypeInferenceContext*, UInt32, MLOperatorEdgeDescription*, HRESULT)
    set_output_edge_description : Proc(IMLOperatorTypeInferenceContext*, UInt32, MLOperatorEdgeDescription*, HRESULT)
  end

  struct IMLOperatorTypeInferenceContext
    lpVtbl : IMLOperatorTypeInferenceContextVTbl*
  end

  struct IMLOperatorTypeInferrerVTbl
    query_interface : Proc(IMLOperatorTypeInferrer*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMLOperatorTypeInferrer*, UInt32)
    release : Proc(IMLOperatorTypeInferrer*, UInt32)
    infer_output_types : Proc(IMLOperatorTypeInferrer*, IMLOperatorTypeInferenceContext, HRESULT)
  end

  struct IMLOperatorTypeInferrer
    lpVtbl : IMLOperatorTypeInferrerVTbl*
  end

  struct IMLOperatorShapeInferrerVTbl
    query_interface : Proc(IMLOperatorShapeInferrer*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMLOperatorShapeInferrer*, UInt32)
    release : Proc(IMLOperatorShapeInferrer*, UInt32)
    infer_output_shapes : Proc(IMLOperatorShapeInferrer*, IMLOperatorShapeInferenceContext, HRESULT)
  end

  struct IMLOperatorShapeInferrer
    lpVtbl : IMLOperatorShapeInferrerVTbl*
  end

  struct IMLOperatorKernelFactoryVTbl
    query_interface : Proc(IMLOperatorKernelFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMLOperatorKernelFactory*, UInt32)
    release : Proc(IMLOperatorKernelFactory*, UInt32)
    create_kernel : Proc(IMLOperatorKernelFactory*, IMLOperatorKernelCreationContext, IMLOperatorKernel*, HRESULT)
  end

  struct IMLOperatorKernelFactory
    lpVtbl : IMLOperatorKernelFactoryVTbl*
  end

  struct IMLOperatorRegistryVTbl
    query_interface : Proc(IMLOperatorRegistry*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMLOperatorRegistry*, UInt32)
    release : Proc(IMLOperatorRegistry*, UInt32)
    register_operator_set_schema : Proc(IMLOperatorRegistry*, MLOperatorSetId*, Int32, MLOperatorSchemaDescription**, UInt32, IMLOperatorTypeInferrer, IMLOperatorShapeInferrer, HRESULT)
    register_operator_kernel : Proc(IMLOperatorRegistry*, MLOperatorKernelDescription*, IMLOperatorKernelFactory, IMLOperatorShapeInferrer, HRESULT)
  end

  struct IMLOperatorRegistry
    lpVtbl : IMLOperatorRegistryVTbl*
  end


  # Params # runtime : IWinMLRuntime* [In]
  fun WinMLCreateRuntime(runtime : IWinMLRuntime*) : HRESULT

  # Params # registry : IMLOperatorRegistry* [In]
  fun MLCreateOperatorRegistry(registry : IMLOperatorRegistry*) : HRESULT
end
