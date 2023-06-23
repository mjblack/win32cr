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
@[Link(ldflags: "/DELAYLOAD:winml.dll")]
@[Link(ldflags: "/DELAYLOAD:windows.ai.machinelearning.dll")]
{% else %}
@[Link("winml")]
@[Link("windows.ai.machinelearning")]
{% end %}
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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_description : UInt64
    enumerate_metadata : UInt64
    enumerate_model_inputs : UInt64
    enumerate_model_outputs : UInt64
  end

  IWinMLModel_GUID = "e2eeb6a9-f31f-4055-a521-e30b5b33664a"
  IID_IWinMLModel = LibC::GUID.new(0xe2eeb6a9_u32, 0xf31f_u16, 0x4055_u16, StaticArray[0xa5_u8, 0x21_u8, 0xe3_u8, 0xb_u8, 0x5b_u8, 0x33_u8, 0x66_u8, 0x4a_u8])
  struct IWinMLModel
    lpVtbl : IWinMLModelVTbl*
  end

  struct IWinMLEvaluationContextVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    bind_value : UInt64
    get_value_by_name : UInt64
    clear : UInt64
  end

  IWinMLEvaluationContext_GUID = "95848f9e-583d-4054-af12-916387cd8426"
  IID_IWinMLEvaluationContext = LibC::GUID.new(0x95848f9e_u32, 0x583d_u16, 0x4054_u16, StaticArray[0xaf_u8, 0x12_u8, 0x91_u8, 0x63_u8, 0x87_u8, 0xcd_u8, 0x84_u8, 0x26_u8])
  struct IWinMLEvaluationContext
    lpVtbl : IWinMLEvaluationContextVTbl*
  end

  struct IWinMLRuntimeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    load_model : UInt64
    create_evaluation_context : UInt64
    evaluate_model : UInt64
  end

  IWinMLRuntime_GUID = "a0425329-40ae-48d9-bce3-829ef7b8a41a"
  IID_IWinMLRuntime = LibC::GUID.new(0xa0425329_u32, 0x40ae_u16, 0x48d9_u16, StaticArray[0xbc_u8, 0xe3_u8, 0x82_u8, 0x9e_u8, 0xf7_u8, 0xb8_u8, 0xa4_u8, 0x1a_u8])
  struct IWinMLRuntime
    lpVtbl : IWinMLRuntimeVTbl*
  end

  struct IWinMLRuntimeFactoryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_runtime : UInt64
  end

  IWinMLRuntimeFactory_GUID = "a807b84d-4ae5-4bc0-a76a-941aa246bd41"
  IID_IWinMLRuntimeFactory = LibC::GUID.new(0xa807b84d_u32, 0x4ae5_u16, 0x4bc0_u16, StaticArray[0xa7_u8, 0x6a_u8, 0x94_u8, 0x1a_u8, 0xa2_u8, 0x46_u8, 0xbd_u8, 0x41_u8])
  struct IWinMLRuntimeFactory
    lpVtbl : IWinMLRuntimeFactoryVTbl*
  end

  struct IMLOperatorAttributesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_attribute_element_count : UInt64
    get_attribute : UInt64
    get_string_attribute_element_length : UInt64
    get_string_attribute_element : UInt64
  end

  IMLOperatorAttributes_GUID = "4b1b1759-ec40-466c-aab4-beb5347fd24c"
  IID_IMLOperatorAttributes = LibC::GUID.new(0x4b1b1759_u32, 0xec40_u16, 0x466c_u16, StaticArray[0xaa_u8, 0xb4_u8, 0xbe_u8, 0xb5_u8, 0x34_u8, 0x7f_u8, 0xd2_u8, 0x4c_u8])
  struct IMLOperatorAttributes
    lpVtbl : IMLOperatorAttributesVTbl*
  end

  struct IMLOperatorTensorShapeDescriptionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_input_tensor_dimension_count : UInt64
    get_input_tensor_shape : UInt64
    has_output_shape_description : UInt64
    get_output_tensor_dimension_count : UInt64
    get_output_tensor_shape : UInt64
  end

  IMLOperatorTensorShapeDescription_GUID = "f20e8cbe-3b28-4248-be95-f96fbc6e4643"
  IID_IMLOperatorTensorShapeDescription = LibC::GUID.new(0xf20e8cbe_u32, 0x3b28_u16, 0x4248_u16, StaticArray[0xbe_u8, 0x95_u8, 0xf9_u8, 0x6f_u8, 0xbc_u8, 0x6e_u8, 0x46_u8, 0x43_u8])
  struct IMLOperatorTensorShapeDescription
    lpVtbl : IMLOperatorTensorShapeDescriptionVTbl*
  end

  struct IMLOperatorKernelCreationContextVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_attribute_element_count : UInt64
    get_attribute : UInt64
    get_string_attribute_element_length : UInt64
    get_string_attribute_element : UInt64
    get_input_count : UInt64
    get_output_count : UInt64
    is_input_valid : UInt64
    is_output_valid : UInt64
    get_input_edge_description : UInt64
    get_output_edge_description : UInt64
    has_tensor_shape_description : UInt64
    get_tensor_shape_description : UInt64
    get_execution_interface : UInt64
  end

  IMLOperatorKernelCreationContext_GUID = "5459b53d-a0fc-4665-addd-70171ef7e631"
  IID_IMLOperatorKernelCreationContext = LibC::GUID.new(0x5459b53d_u32, 0xa0fc_u16, 0x4665_u16, StaticArray[0xad_u8, 0xdd_u8, 0x70_u8, 0x17_u8, 0x1e_u8, 0xf7_u8, 0xe6_u8, 0x31_u8])
  struct IMLOperatorKernelCreationContext
    lpVtbl : IMLOperatorKernelCreationContextVTbl*
  end

  struct IMLOperatorTensorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_dimension_count : UInt64
    get_shape : UInt64
    get_tensor_data_type : UInt64
    is_cpu_data : UInt64
    is_data_interface : UInt64
    get_data : UInt64
    get_data_interface : UInt64
  end

  IMLOperatorTensor_GUID = "7fe41f41-f430-440e-aece-54416dc8b9db"
  IID_IMLOperatorTensor = LibC::GUID.new(0x7fe41f41_u32, 0xf430_u16, 0x440e_u16, StaticArray[0xae_u8, 0xce_u8, 0x54_u8, 0x41_u8, 0x6d_u8, 0xc8_u8, 0xb9_u8, 0xdb_u8])
  struct IMLOperatorTensor
    lpVtbl : IMLOperatorTensorVTbl*
  end

  struct IMLOperatorKernelContextVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_input_tensor : UInt64
    get_output_tensor : UInt64
    get_output_tensor2 : UInt64
    allocate_temporary_data : UInt64
    get_execution_interface : UInt64
  end

  IMLOperatorKernelContext_GUID = "82536a28-f022-4769-9d3f-8b278f84c0c3"
  IID_IMLOperatorKernelContext = LibC::GUID.new(0x82536a28_u32, 0xf022_u16, 0x4769_u16, StaticArray[0x9d_u8, 0x3f_u8, 0x8b_u8, 0x27_u8, 0x8f_u8, 0x84_u8, 0xc0_u8, 0xc3_u8])
  struct IMLOperatorKernelContext
    lpVtbl : IMLOperatorKernelContextVTbl*
  end

  struct IMLOperatorKernelVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    compute : UInt64
  end

  IMLOperatorKernel_GUID = "11c4b4a0-b467-4eaa-a1a6-b961d8d0ed79"
  IID_IMLOperatorKernel = LibC::GUID.new(0x11c4b4a0_u32, 0xb467_u16, 0x4eaa_u16, StaticArray[0xa1_u8, 0xa6_u8, 0xb9_u8, 0x61_u8, 0xd8_u8, 0xd0_u8, 0xed_u8, 0x79_u8])
  struct IMLOperatorKernel
    lpVtbl : IMLOperatorKernelVTbl*
  end

  struct IMLOperatorShapeInferenceContextVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_attribute_element_count : UInt64
    get_attribute : UInt64
    get_string_attribute_element_length : UInt64
    get_string_attribute_element : UInt64
    get_input_count : UInt64
    get_output_count : UInt64
    is_input_valid : UInt64
    is_output_valid : UInt64
    get_input_edge_description : UInt64
    get_input_tensor_dimension_count : UInt64
    get_input_tensor_shape : UInt64
    set_output_tensor_shape : UInt64
  end

  IMLOperatorShapeInferenceContext_GUID = "105b6b29-5408-4a68-9959-09b5955a3492"
  IID_IMLOperatorShapeInferenceContext = LibC::GUID.new(0x105b6b29_u32, 0x5408_u16, 0x4a68_u16, StaticArray[0x99_u8, 0x59_u8, 0x9_u8, 0xb5_u8, 0x95_u8, 0x5a_u8, 0x34_u8, 0x92_u8])
  struct IMLOperatorShapeInferenceContext
    lpVtbl : IMLOperatorShapeInferenceContextVTbl*
  end

  struct IMLOperatorTypeInferenceContextVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_attribute_element_count : UInt64
    get_attribute : UInt64
    get_string_attribute_element_length : UInt64
    get_string_attribute_element : UInt64
    get_input_count : UInt64
    get_output_count : UInt64
    is_input_valid : UInt64
    is_output_valid : UInt64
    get_input_edge_description : UInt64
    set_output_edge_description : UInt64
  end

  IMLOperatorTypeInferenceContext_GUID = "ec893bb1-f938-427b-8488-c8dcf775f138"
  IID_IMLOperatorTypeInferenceContext = LibC::GUID.new(0xec893bb1_u32, 0xf938_u16, 0x427b_u16, StaticArray[0x84_u8, 0x88_u8, 0xc8_u8, 0xdc_u8, 0xf7_u8, 0x75_u8, 0xf1_u8, 0x38_u8])
  struct IMLOperatorTypeInferenceContext
    lpVtbl : IMLOperatorTypeInferenceContextVTbl*
  end

  struct IMLOperatorTypeInferrerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    infer_output_types : UInt64
  end

  IMLOperatorTypeInferrer_GUID = "781aeb48-9bcb-4797-bf77-8bf455217beb"
  IID_IMLOperatorTypeInferrer = LibC::GUID.new(0x781aeb48_u32, 0x9bcb_u16, 0x4797_u16, StaticArray[0xbf_u8, 0x77_u8, 0x8b_u8, 0xf4_u8, 0x55_u8, 0x21_u8, 0x7b_u8, 0xeb_u8])
  struct IMLOperatorTypeInferrer
    lpVtbl : IMLOperatorTypeInferrerVTbl*
  end

  struct IMLOperatorShapeInferrerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    infer_output_shapes : UInt64
  end

  IMLOperatorShapeInferrer_GUID = "540be5be-a6c9-40ee-83f6-d2b8b40a7798"
  IID_IMLOperatorShapeInferrer = LibC::GUID.new(0x540be5be_u32, 0xa6c9_u16, 0x40ee_u16, StaticArray[0x83_u8, 0xf6_u8, 0xd2_u8, 0xb8_u8, 0xb4_u8, 0xa_u8, 0x77_u8, 0x98_u8])
  struct IMLOperatorShapeInferrer
    lpVtbl : IMLOperatorShapeInferrerVTbl*
  end

  struct IMLOperatorKernelFactoryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_kernel : UInt64
  end

  IMLOperatorKernelFactory_GUID = "ef15ad6f-0dc9-4908-ab35-a575a30dfbf8"
  IID_IMLOperatorKernelFactory = LibC::GUID.new(0xef15ad6f_u32, 0xdc9_u16, 0x4908_u16, StaticArray[0xab_u8, 0x35_u8, 0xa5_u8, 0x75_u8, 0xa3_u8, 0xd_u8, 0xfb_u8, 0xf8_u8])
  struct IMLOperatorKernelFactory
    lpVtbl : IMLOperatorKernelFactoryVTbl*
  end

  struct IMLOperatorRegistryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    register_operator_set_schema : UInt64
    register_operator_kernel : UInt64
  end

  IMLOperatorRegistry_GUID = "2af9dd2d-b516-4672-9ab5-530c208493ad"
  IID_IMLOperatorRegistry = LibC::GUID.new(0x2af9dd2d_u32, 0xb516_u16, 0x4672_u16, StaticArray[0x9a_u8, 0xb5_u8, 0x53_u8, 0xc_u8, 0x20_u8, 0x84_u8, 0x93_u8, 0xad_u8])
  struct IMLOperatorRegistry
    lpVtbl : IMLOperatorRegistryVTbl*
  end


  # Params # runtime : IWinMLRuntime* [In]
  fun WinMLCreateRuntime(runtime : IWinMLRuntime*) : HRESULT

  # Params # registry : IMLOperatorRegistry* [In]
  fun MLCreateOperatorRegistry(registry : IMLOperatorRegistry*) : HRESULT
end
struct LibWin32::IWinMLModel
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_description(ppdescription : WINML_MODEL_DESC**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(WINML_MODEL_DESC**, HRESULT)).call(ppdescription)
  end
  def enumerate_metadata(index : UInt32, pkey : LibC::LPWSTR*, pvalue : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.enumerate_metadata.unsafe_as(Proc(UInt32, LibC::LPWSTR*, LibC::LPWSTR*, HRESULT)).call(index, pkey, pvalue)
  end
  def enumerate_model_inputs(index : UInt32, ppinputdescriptor : WINML_VARIABLE_DESC**) : HRESULT
    @lpVtbl.value.enumerate_model_inputs.unsafe_as(Proc(UInt32, WINML_VARIABLE_DESC**, HRESULT)).call(index, ppinputdescriptor)
  end
  def enumerate_model_outputs(index : UInt32, ppoutputdescriptor : WINML_VARIABLE_DESC**) : HRESULT
    @lpVtbl.value.enumerate_model_outputs.unsafe_as(Proc(UInt32, WINML_VARIABLE_DESC**, HRESULT)).call(index, ppoutputdescriptor)
  end
end
struct LibWin32::IWinMLEvaluationContext
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def bind_value(pdescriptor : WINML_BINDING_DESC*) : HRESULT
    @lpVtbl.value.bind_value.unsafe_as(Proc(WINML_BINDING_DESC*, HRESULT)).call(pdescriptor)
  end
  def get_value_by_name(name : LibC::LPWSTR, pdescriptor : WINML_BINDING_DESC**) : HRESULT
    @lpVtbl.value.get_value_by_name.unsafe_as(Proc(LibC::LPWSTR, WINML_BINDING_DESC**, HRESULT)).call(name, pdescriptor)
  end
  def clear : HRESULT
    @lpVtbl.value.clear.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IWinMLRuntime
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def load_model(path : LibC::LPWSTR, ppmodel : IWinMLModel*) : HRESULT
    @lpVtbl.value.load_model.unsafe_as(Proc(LibC::LPWSTR, IWinMLModel*, HRESULT)).call(path, ppmodel)
  end
  def create_evaluation_context(device : ID3D12Device, ppcontext : IWinMLEvaluationContext*) : HRESULT
    @lpVtbl.value.create_evaluation_context.unsafe_as(Proc(ID3D12Device, IWinMLEvaluationContext*, HRESULT)).call(device, ppcontext)
  end
  def evaluate_model(pcontext : IWinMLEvaluationContext) : HRESULT
    @lpVtbl.value.evaluate_model.unsafe_as(Proc(IWinMLEvaluationContext, HRESULT)).call(pcontext)
  end
end
struct LibWin32::IWinMLRuntimeFactory
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_runtime(runtimetype : WINML_RUNTIME_TYPE, ppruntime : IWinMLRuntime*) : HRESULT
    @lpVtbl.value.create_runtime.unsafe_as(Proc(WINML_RUNTIME_TYPE, IWinMLRuntime*, HRESULT)).call(runtimetype, ppruntime)
  end
end
struct LibWin32::IMLOperatorAttributes
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_attribute_element_count(name : PSTR, type : MLOperatorAttributeType, elementcount : UInt32*) : HRESULT
    @lpVtbl.value.get_attribute_element_count.unsafe_as(Proc(PSTR, MLOperatorAttributeType, UInt32*, HRESULT)).call(name, type, elementcount)
  end
  def get_attribute(name : PSTR, type : MLOperatorAttributeType, elementcount : UInt32, elementbytesize : LibC::UINT_PTR, value : Void*) : HRESULT
    @lpVtbl.value.get_attribute.unsafe_as(Proc(PSTR, MLOperatorAttributeType, UInt32, LibC::UINT_PTR, Void*, HRESULT)).call(name, type, elementcount, elementbytesize, value)
  end
  def get_string_attribute_element_length(name : PSTR, elementindex : UInt32, attributeelementbytesize : UInt32*) : HRESULT
    @lpVtbl.value.get_string_attribute_element_length.unsafe_as(Proc(PSTR, UInt32, UInt32*, HRESULT)).call(name, elementindex, attributeelementbytesize)
  end
  def get_string_attribute_element(name : PSTR, elementindex : UInt32, attributeelementbytesize : UInt32, attributeelement : UInt8*) : HRESULT
    @lpVtbl.value.get_string_attribute_element.unsafe_as(Proc(PSTR, UInt32, UInt32, UInt8*, HRESULT)).call(name, elementindex, attributeelementbytesize, attributeelement)
  end
end
struct LibWin32::IMLOperatorTensorShapeDescription
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_input_tensor_dimension_count(inputindex : UInt32, dimensioncount : UInt32*) : HRESULT
    @lpVtbl.value.get_input_tensor_dimension_count.unsafe_as(Proc(UInt32, UInt32*, HRESULT)).call(inputindex, dimensioncount)
  end
  def get_input_tensor_shape(inputindex : UInt32, dimensioncount : UInt32, dimensions : UInt32*) : HRESULT
    @lpVtbl.value.get_input_tensor_shape.unsafe_as(Proc(UInt32, UInt32, UInt32*, HRESULT)).call(inputindex, dimensioncount, dimensions)
  end
  def has_output_shape_description : Bool
    @lpVtbl.value.has_output_shape_description.unsafe_as(Proc(Bool)).call
  end
  def get_output_tensor_dimension_count(outputindex : UInt32, dimensioncount : UInt32*) : HRESULT
    @lpVtbl.value.get_output_tensor_dimension_count.unsafe_as(Proc(UInt32, UInt32*, HRESULT)).call(outputindex, dimensioncount)
  end
  def get_output_tensor_shape(outputindex : UInt32, dimensioncount : UInt32, dimensions : UInt32*) : HRESULT
    @lpVtbl.value.get_output_tensor_shape.unsafe_as(Proc(UInt32, UInt32, UInt32*, HRESULT)).call(outputindex, dimensioncount, dimensions)
  end
end
struct LibWin32::IMLOperatorKernelCreationContext
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_attribute_element_count(name : PSTR, type : MLOperatorAttributeType, elementcount : UInt32*) : HRESULT
    @lpVtbl.value.get_attribute_element_count.unsafe_as(Proc(PSTR, MLOperatorAttributeType, UInt32*, HRESULT)).call(name, type, elementcount)
  end
  def get_attribute(name : PSTR, type : MLOperatorAttributeType, elementcount : UInt32, elementbytesize : LibC::UINT_PTR, value : Void*) : HRESULT
    @lpVtbl.value.get_attribute.unsafe_as(Proc(PSTR, MLOperatorAttributeType, UInt32, LibC::UINT_PTR, Void*, HRESULT)).call(name, type, elementcount, elementbytesize, value)
  end
  def get_string_attribute_element_length(name : PSTR, elementindex : UInt32, attributeelementbytesize : UInt32*) : HRESULT
    @lpVtbl.value.get_string_attribute_element_length.unsafe_as(Proc(PSTR, UInt32, UInt32*, HRESULT)).call(name, elementindex, attributeelementbytesize)
  end
  def get_string_attribute_element(name : PSTR, elementindex : UInt32, attributeelementbytesize : UInt32, attributeelement : UInt8*) : HRESULT
    @lpVtbl.value.get_string_attribute_element.unsafe_as(Proc(PSTR, UInt32, UInt32, UInt8*, HRESULT)).call(name, elementindex, attributeelementbytesize, attributeelement)
  end
  def get_input_count : UInt32
    @lpVtbl.value.get_input_count.unsafe_as(Proc(UInt32)).call
  end
  def get_output_count : UInt32
    @lpVtbl.value.get_output_count.unsafe_as(Proc(UInt32)).call
  end
  def is_input_valid(inputindex : UInt32) : Bool
    @lpVtbl.value.is_input_valid.unsafe_as(Proc(UInt32, Bool)).call(inputindex)
  end
  def is_output_valid(outputindex : UInt32) : Bool
    @lpVtbl.value.is_output_valid.unsafe_as(Proc(UInt32, Bool)).call(outputindex)
  end
  def get_input_edge_description(inputindex : UInt32, edgedescription : MLOperatorEdgeDescription*) : HRESULT
    @lpVtbl.value.get_input_edge_description.unsafe_as(Proc(UInt32, MLOperatorEdgeDescription*, HRESULT)).call(inputindex, edgedescription)
  end
  def get_output_edge_description(outputindex : UInt32, edgedescription : MLOperatorEdgeDescription*) : HRESULT
    @lpVtbl.value.get_output_edge_description.unsafe_as(Proc(UInt32, MLOperatorEdgeDescription*, HRESULT)).call(outputindex, edgedescription)
  end
  def has_tensor_shape_description : Bool
    @lpVtbl.value.has_tensor_shape_description.unsafe_as(Proc(Bool)).call
  end
  def get_tensor_shape_description(shapedescription : IMLOperatorTensorShapeDescription*) : HRESULT
    @lpVtbl.value.get_tensor_shape_description.unsafe_as(Proc(IMLOperatorTensorShapeDescription*, HRESULT)).call(shapedescription)
  end
  def get_execution_interface(executionobject : IUnknown*) : Void
    @lpVtbl.value.get_execution_interface.unsafe_as(Proc(IUnknown*, Void)).call(executionobject)
  end
end
struct LibWin32::IMLOperatorTensor
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_dimension_count : UInt32
    @lpVtbl.value.get_dimension_count.unsafe_as(Proc(UInt32)).call
  end
  def get_shape(dimensioncount : UInt32, dimensions : UInt32*) : HRESULT
    @lpVtbl.value.get_shape.unsafe_as(Proc(UInt32, UInt32*, HRESULT)).call(dimensioncount, dimensions)
  end
  def get_tensor_data_type : MLOperatorTensorDataType
    @lpVtbl.value.get_tensor_data_type.unsafe_as(Proc(MLOperatorTensorDataType)).call
  end
  def is_cpu_data : Bool
    @lpVtbl.value.is_cpu_data.unsafe_as(Proc(Bool)).call
  end
  def is_data_interface : Bool
    @lpVtbl.value.is_data_interface.unsafe_as(Proc(Bool)).call
  end
  def get_data : Void*
    @lpVtbl.value.get_data.unsafe_as(Proc(Void**)).call
  end
  def get_data_interface(datainterface : IUnknown*) : Void
    @lpVtbl.value.get_data_interface.unsafe_as(Proc(IUnknown*, Void)).call(datainterface)
  end
end
struct LibWin32::IMLOperatorKernelContext
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_input_tensor(inputindex : UInt32, tensor : IMLOperatorTensor*) : HRESULT
    @lpVtbl.value.get_input_tensor.unsafe_as(Proc(UInt32, IMLOperatorTensor*, HRESULT)).call(inputindex, tensor)
  end
  def get_output_tensor(outputindex : UInt32, dimensioncount : UInt32, dimensionsizes : UInt32*, tensor : IMLOperatorTensor*) : HRESULT
    @lpVtbl.value.get_output_tensor.unsafe_as(Proc(UInt32, UInt32, UInt32*, IMLOperatorTensor*, HRESULT)).call(outputindex, dimensioncount, dimensionsizes, tensor)
  end
  def get_output_tensor2(outputindex : UInt32, tensor : IMLOperatorTensor*) : HRESULT
    @lpVtbl.value.get_output_tensor2.unsafe_as(Proc(UInt32, IMLOperatorTensor*, HRESULT)).call(outputindex, tensor)
  end
  def allocate_temporary_data(size : LibC::UINT_PTR, data : IUnknown*) : HRESULT
    @lpVtbl.value.allocate_temporary_data.unsafe_as(Proc(LibC::UINT_PTR, IUnknown*, HRESULT)).call(size, data)
  end
  def get_execution_interface(executionobject : IUnknown*) : Void
    @lpVtbl.value.get_execution_interface.unsafe_as(Proc(IUnknown*, Void)).call(executionobject)
  end
end
struct LibWin32::IMLOperatorKernel
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def compute(context : IMLOperatorKernelContext) : HRESULT
    @lpVtbl.value.compute.unsafe_as(Proc(IMLOperatorKernelContext, HRESULT)).call(context)
  end
end
struct LibWin32::IMLOperatorShapeInferenceContext
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_attribute_element_count(name : PSTR, type : MLOperatorAttributeType, elementcount : UInt32*) : HRESULT
    @lpVtbl.value.get_attribute_element_count.unsafe_as(Proc(PSTR, MLOperatorAttributeType, UInt32*, HRESULT)).call(name, type, elementcount)
  end
  def get_attribute(name : PSTR, type : MLOperatorAttributeType, elementcount : UInt32, elementbytesize : LibC::UINT_PTR, value : Void*) : HRESULT
    @lpVtbl.value.get_attribute.unsafe_as(Proc(PSTR, MLOperatorAttributeType, UInt32, LibC::UINT_PTR, Void*, HRESULT)).call(name, type, elementcount, elementbytesize, value)
  end
  def get_string_attribute_element_length(name : PSTR, elementindex : UInt32, attributeelementbytesize : UInt32*) : HRESULT
    @lpVtbl.value.get_string_attribute_element_length.unsafe_as(Proc(PSTR, UInt32, UInt32*, HRESULT)).call(name, elementindex, attributeelementbytesize)
  end
  def get_string_attribute_element(name : PSTR, elementindex : UInt32, attributeelementbytesize : UInt32, attributeelement : UInt8*) : HRESULT
    @lpVtbl.value.get_string_attribute_element.unsafe_as(Proc(PSTR, UInt32, UInt32, UInt8*, HRESULT)).call(name, elementindex, attributeelementbytesize, attributeelement)
  end
  def get_input_count : UInt32
    @lpVtbl.value.get_input_count.unsafe_as(Proc(UInt32)).call
  end
  def get_output_count : UInt32
    @lpVtbl.value.get_output_count.unsafe_as(Proc(UInt32)).call
  end
  def is_input_valid(inputindex : UInt32) : Bool
    @lpVtbl.value.is_input_valid.unsafe_as(Proc(UInt32, Bool)).call(inputindex)
  end
  def is_output_valid(outputindex : UInt32) : Bool
    @lpVtbl.value.is_output_valid.unsafe_as(Proc(UInt32, Bool)).call(outputindex)
  end
  def get_input_edge_description(inputindex : UInt32, edgedescription : MLOperatorEdgeDescription*) : HRESULT
    @lpVtbl.value.get_input_edge_description.unsafe_as(Proc(UInt32, MLOperatorEdgeDescription*, HRESULT)).call(inputindex, edgedescription)
  end
  def get_input_tensor_dimension_count(inputindex : UInt32, dimensioncount : UInt32*) : HRESULT
    @lpVtbl.value.get_input_tensor_dimension_count.unsafe_as(Proc(UInt32, UInt32*, HRESULT)).call(inputindex, dimensioncount)
  end
  def get_input_tensor_shape(inputindex : UInt32, dimensioncount : UInt32, dimensions : UInt32*) : HRESULT
    @lpVtbl.value.get_input_tensor_shape.unsafe_as(Proc(UInt32, UInt32, UInt32*, HRESULT)).call(inputindex, dimensioncount, dimensions)
  end
  def set_output_tensor_shape(outputindex : UInt32, dimensioncount : UInt32, dimensions : UInt32*) : HRESULT
    @lpVtbl.value.set_output_tensor_shape.unsafe_as(Proc(UInt32, UInt32, UInt32*, HRESULT)).call(outputindex, dimensioncount, dimensions)
  end
end
struct LibWin32::IMLOperatorTypeInferenceContext
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_attribute_element_count(name : PSTR, type : MLOperatorAttributeType, elementcount : UInt32*) : HRESULT
    @lpVtbl.value.get_attribute_element_count.unsafe_as(Proc(PSTR, MLOperatorAttributeType, UInt32*, HRESULT)).call(name, type, elementcount)
  end
  def get_attribute(name : PSTR, type : MLOperatorAttributeType, elementcount : UInt32, elementbytesize : LibC::UINT_PTR, value : Void*) : HRESULT
    @lpVtbl.value.get_attribute.unsafe_as(Proc(PSTR, MLOperatorAttributeType, UInt32, LibC::UINT_PTR, Void*, HRESULT)).call(name, type, elementcount, elementbytesize, value)
  end
  def get_string_attribute_element_length(name : PSTR, elementindex : UInt32, attributeelementbytesize : UInt32*) : HRESULT
    @lpVtbl.value.get_string_attribute_element_length.unsafe_as(Proc(PSTR, UInt32, UInt32*, HRESULT)).call(name, elementindex, attributeelementbytesize)
  end
  def get_string_attribute_element(name : PSTR, elementindex : UInt32, attributeelementbytesize : UInt32, attributeelement : UInt8*) : HRESULT
    @lpVtbl.value.get_string_attribute_element.unsafe_as(Proc(PSTR, UInt32, UInt32, UInt8*, HRESULT)).call(name, elementindex, attributeelementbytesize, attributeelement)
  end
  def get_input_count : UInt32
    @lpVtbl.value.get_input_count.unsafe_as(Proc(UInt32)).call
  end
  def get_output_count : UInt32
    @lpVtbl.value.get_output_count.unsafe_as(Proc(UInt32)).call
  end
  def is_input_valid(inputindex : UInt32) : Bool
    @lpVtbl.value.is_input_valid.unsafe_as(Proc(UInt32, Bool)).call(inputindex)
  end
  def is_output_valid(outputindex : UInt32) : Bool
    @lpVtbl.value.is_output_valid.unsafe_as(Proc(UInt32, Bool)).call(outputindex)
  end
  def get_input_edge_description(inputindex : UInt32, edgedescription : MLOperatorEdgeDescription*) : HRESULT
    @lpVtbl.value.get_input_edge_description.unsafe_as(Proc(UInt32, MLOperatorEdgeDescription*, HRESULT)).call(inputindex, edgedescription)
  end
  def set_output_edge_description(outputindex : UInt32, edgedescription : MLOperatorEdgeDescription*) : HRESULT
    @lpVtbl.value.set_output_edge_description.unsafe_as(Proc(UInt32, MLOperatorEdgeDescription*, HRESULT)).call(outputindex, edgedescription)
  end
end
struct LibWin32::IMLOperatorTypeInferrer
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def infer_output_types(context : IMLOperatorTypeInferenceContext) : HRESULT
    @lpVtbl.value.infer_output_types.unsafe_as(Proc(IMLOperatorTypeInferenceContext, HRESULT)).call(context)
  end
end
struct LibWin32::IMLOperatorShapeInferrer
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def infer_output_shapes(context : IMLOperatorShapeInferenceContext) : HRESULT
    @lpVtbl.value.infer_output_shapes.unsafe_as(Proc(IMLOperatorShapeInferenceContext, HRESULT)).call(context)
  end
end
struct LibWin32::IMLOperatorKernelFactory
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_kernel(context : IMLOperatorKernelCreationContext, kernel : IMLOperatorKernel*) : HRESULT
    @lpVtbl.value.create_kernel.unsafe_as(Proc(IMLOperatorKernelCreationContext, IMLOperatorKernel*, HRESULT)).call(context, kernel)
  end
end
struct LibWin32::IMLOperatorRegistry
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def register_operator_set_schema(operatorsetid : MLOperatorSetId*, baselineversion : Int32, schema : MLOperatorSchemaDescription**, schemacount : UInt32, typeinferrer : IMLOperatorTypeInferrer, shapeinferrer : IMLOperatorShapeInferrer) : HRESULT
    @lpVtbl.value.register_operator_set_schema.unsafe_as(Proc(MLOperatorSetId*, Int32, MLOperatorSchemaDescription**, UInt32, IMLOperatorTypeInferrer, IMLOperatorShapeInferrer, HRESULT)).call(operatorsetid, baselineversion, schema, schemacount, typeinferrer, shapeinferrer)
  end
  def register_operator_kernel(operatorkernel : MLOperatorKernelDescription*, operatorkernelfactory : IMLOperatorKernelFactory, shapeinferrer : IMLOperatorShapeInferrer) : HRESULT
    @lpVtbl.value.register_operator_kernel.unsafe_as(Proc(MLOperatorKernelDescription*, IMLOperatorKernelFactory, IMLOperatorShapeInferrer, HRESULT)).call(operatorkernel, operatorkernelfactory, shapeinferrer)
  end
end
