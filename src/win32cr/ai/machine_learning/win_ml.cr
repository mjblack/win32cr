require "./../../foundation.cr"
require "./../../graphics/direct3_d12.cr"
require "./../../system/com.cr"

module Win32cr::AI::MachineLearning::WinML
  WINML_TENSOR_DIMENSION_COUNT_MAX = 4_u32

  enum WINML_TENSOR_DATA_TYPE
    WINML_TENSOR_UNDEFINED = 0_i32
    WINML_TENSOR_FLOAT = 1_i32
    WINML_TENSOR_UINT8 = 2_i32
    WINML_TENSOR_INT8 = 3_i32
    WINML_TENSOR_UINT16 = 4_i32
    WINML_TENSOR_INT16 = 5_i32
    WINML_TENSOR_INT32 = 6_i32
    WINML_TENSOR_INT64 = 7_i32
    WINML_TENSOR_STRING = 8_i32
    WINML_TENSOR_BOOLEAN = 9_i32
    WINML_TENSOR_FLOAT16 = 10_i32
    WINML_TENSOR_DOUBLE = 11_i32
    WINML_TENSOR_UINT32 = 12_i32
    WINML_TENSOR_UINT64 = 13_i32
    WINML_TENSOR_COMPLEX64 = 14_i32
    WINML_TENSOR_COMPLEX128 = 15_i32
  end
  enum WINML_FEATURE_TYPE
    WINML_FEATURE_UNDEFINED = 0_i32
    WINML_FEATURE_TENSOR = 1_i32
    WINML_FEATURE_SEQUENCE = 2_i32
    WINML_FEATURE_MAP = 3_i32
    WINML_FEATURE_IMAGE = 4_i32
  end
  enum WINML_BINDING_TYPE
    WINML_BINDING_UNDEFINED = 0_i32
    WINML_BINDING_TENSOR = 1_i32
    WINML_BINDING_SEQUENCE = 2_i32
    WINML_BINDING_MAP = 3_i32
    WINML_BINDING_IMAGE = 4_i32
    WINML_BINDING_RESOURCE = 5_i32
  end
  enum WINML_RUNTIME_TYPE
    WINML_RUNTIME_CNTK = 0_i32
  end
  enum MLOperatorAttributeType : UInt32
    Undefined = 0_u32
    Float = 2_u32
    Int = 3_u32
    String = 4_u32
    FloatArray = 7_u32
    IntArray = 8_u32
    StringArray = 9_u32
  end
  enum MLOperatorTensorDataType : UInt32
    Undefined = 0_u32
    Float = 1_u32
    UInt8 = 2_u32
    Int8 = 3_u32
    UInt16 = 4_u32
    Int16 = 5_u32
    Int32 = 6_u32
    Int64 = 7_u32
    String = 8_u32
    Bool = 9_u32
    Float16 = 10_u32
    Double = 11_u32
    UInt32 = 12_u32
    UInt64 = 13_u32
    Complex64 = 14_u32
    Complex128 = 15_u32
  end
  enum MLOperatorEdgeType : UInt32
    Undefined = 0_u32
    Tensor = 1_u32
  end
  @[Flags]
  enum MLOperatorParameterOptions : UInt32
    Single = 0_u32
    Optional = 1_u32
    Variadic = 2_u32
  end
  enum MLOperatorSchemaEdgeTypeFormat
    EdgeDescription = 0_i32
    Label = 1_i32
  end
  @[Flags]
  enum MLOperatorKernelOptions : UInt32
    None = 0_u32
    AllowDynamicInputShapes = 1_u32
  end
  enum MLOperatorExecutionType : UInt32
    Undefined = 0_u32
    Cpu = 1_u32
    D3D12 = 2_u32
  end

  @[Extern]
  record WINML_TENSOR_BINDING_DESC,
    data_type : Win32cr::AI::MachineLearning::WinML::WINML_TENSOR_DATA_TYPE,
    num_dimensions : UInt32,
    pShape : Int64*,
    data_size : UInt32,
    pData : Void*

  @[Extern]
  record WINML_SEQUENCE_BINDING_DESC,
    element_count : UInt32,
    element_type : Win32cr::AI::MachineLearning::WinML::WINML_TENSOR_DATA_TYPE,
    anonymous : Anonymous_e__Union_ do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      pStrings : Win32cr::Foundation::PWSTR*,
      pInts : Int64*,
      pFloats : Float32*,
      pDoubles : Float64*

  end

  @[Extern]
  record WINML_MAP_BINDING_DESC,
    element_count : UInt32,
    key_type : Win32cr::AI::MachineLearning::WinML::WINML_TENSOR_DATA_TYPE,
    anonymous1 : Anonymous1_e__Union_,
    fields : Win32cr::AI::MachineLearning::WinML::WINML_TENSOR_DATA_TYPE,
    anonymous2 : Anonymous2_e__Union_ do

    # Nested Type Anonymous2_e__Union_
    @[Extern(union: true)]
    record Anonymous2_e__Union_,
      pStringFields : Win32cr::Foundation::PWSTR*,
      pIntFields : Int64*,
      pFloatFields : Float32*,
      pDoubleFields : Float64*


    # Nested Type Anonymous1_e__Union_
    @[Extern(union: true)]
    record Anonymous1_e__Union_,
      pStringKeys : Win32cr::Foundation::PWSTR*,
      pIntKeys : Int64*

  end

  @[Extern]
  record WINML_IMAGE_BINDING_DESC,
    element_type : Win32cr::AI::MachineLearning::WinML::WINML_TENSOR_DATA_TYPE,
    num_dimensions : UInt32,
    pShape : Int64*,
    data_size : UInt32,
    pData : Void*

  @[Extern]
  record WINML_RESOURCE_BINDING_DESC,
    element_type : Win32cr::AI::MachineLearning::WinML::WINML_TENSOR_DATA_TYPE,
    num_dimensions : UInt32,
    pShape : Int64*,
    pResource : Void*

  @[Extern]
  record WINML_BINDING_DESC,
    name : Win32cr::Foundation::PWSTR,
    bind_type : Win32cr::AI::MachineLearning::WinML::WINML_BINDING_TYPE,
    anonymous : Anonymous_e__Union_ do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      tensor : Win32cr::AI::MachineLearning::WinML::WINML_TENSOR_BINDING_DESC,
      sequence : Win32cr::AI::MachineLearning::WinML::WINML_SEQUENCE_BINDING_DESC,
      map : Win32cr::AI::MachineLearning::WinML::WINML_MAP_BINDING_DESC,
      image : Win32cr::AI::MachineLearning::WinML::WINML_IMAGE_BINDING_DESC,
      resource : Win32cr::AI::MachineLearning::WinML::WINML_RESOURCE_BINDING_DESC

  end

  @[Extern]
  record WINML_TENSOR_VARIABLE_DESC,
    element_type : Win32cr::AI::MachineLearning::WinML::WINML_TENSOR_DATA_TYPE,
    num_dimensions : UInt32,
    pShape : Int64*

  @[Extern]
  record WINML_SEQUENCE_VARIABLE_DESC,
    element_type : Win32cr::AI::MachineLearning::WinML::WINML_TENSOR_DATA_TYPE

  @[Extern]
  record WINML_MAP_VARIABLE_DESC,
    key_type : Win32cr::AI::MachineLearning::WinML::WINML_TENSOR_DATA_TYPE,
    fields : Win32cr::AI::MachineLearning::WinML::WINML_TENSOR_DATA_TYPE

  @[Extern]
  record WINML_IMAGE_VARIABLE_DESC,
    element_type : Win32cr::AI::MachineLearning::WinML::WINML_TENSOR_DATA_TYPE,
    num_dimensions : UInt32,
    pShape : Int64*

  @[Extern]
  record WINML_VARIABLE_DESC,
    name : Win32cr::Foundation::PWSTR,
    description : Win32cr::Foundation::PWSTR,
    feature_type : Win32cr::AI::MachineLearning::WinML::WINML_FEATURE_TYPE,
    required : Win32cr::Foundation::BOOL,
    anonymous : Anonymous_e__Union_ do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      tensor : Win32cr::AI::MachineLearning::WinML::WINML_TENSOR_VARIABLE_DESC,
      sequence : Win32cr::AI::MachineLearning::WinML::WINML_SEQUENCE_VARIABLE_DESC,
      map : Win32cr::AI::MachineLearning::WinML::WINML_MAP_VARIABLE_DESC,
      image : Win32cr::AI::MachineLearning::WinML::WINML_IMAGE_VARIABLE_DESC

  end

  @[Extern]
  record WINML_MODEL_DESC,
    author : Win32cr::Foundation::PWSTR,
    name : Win32cr::Foundation::PWSTR,
    domain : Win32cr::Foundation::PWSTR,
    description : Win32cr::Foundation::PWSTR,
    version : LibC::UIntPtrT

  @[Extern]
  record MLOperatorEdgeDescription,
    edgeType : Win32cr::AI::MachineLearning::WinML::MLOperatorEdgeType,
    anonymous : Anonymous_e__Union_ do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      reserved : UInt64,
      tensorDataType : Win32cr::AI::MachineLearning::WinML::MLOperatorTensorDataType

  end

  @[Extern]
  record MLOperatorSchemaEdgeDescription,
    options : Win32cr::AI::MachineLearning::WinML::MLOperatorParameterOptions,
    typeFormat : Win32cr::AI::MachineLearning::WinML::MLOperatorSchemaEdgeTypeFormat,
    anonymous : Anonymous_e__Union_ do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      reserved : Void*,
      typeLabel : Win32cr::Foundation::PSTR,
      edgeDescription : Win32cr::AI::MachineLearning::WinML::MLOperatorEdgeDescription

  end

  @[Extern]
  record MLOperatorEdgeTypeConstraint,
    typeLabel : Win32cr::Foundation::PSTR,
    allowedTypes : Win32cr::AI::MachineLearning::WinML::MLOperatorEdgeDescription*,
    allowedTypeCount : UInt32

  @[Extern]
  record MLOperatorAttribute,
    name : Win32cr::Foundation::PSTR,
    type__ : Win32cr::AI::MachineLearning::WinML::MLOperatorAttributeType,
    required : Bool

  @[Extern]
  record MLOperatorAttributeNameValue,
    name : Win32cr::Foundation::PSTR,
    type__ : Win32cr::AI::MachineLearning::WinML::MLOperatorAttributeType,
    valueCount : UInt32,
    anonymous : Anonymous_e__Union_ do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      reserved : Void*,
      ints : Int64*,
      strings : Int8**,
      floats : Float32*

  end

  @[Extern]
  record MLOperatorSchemaDescription,
    name : Win32cr::Foundation::PSTR,
    operatorSetVersionAtLastChange : Int32,
    inputs : Win32cr::AI::MachineLearning::WinML::MLOperatorSchemaEdgeDescription*,
    inputCount : UInt32,
    outputs : Win32cr::AI::MachineLearning::WinML::MLOperatorSchemaEdgeDescription*,
    outputCount : UInt32,
    typeConstraints : Win32cr::AI::MachineLearning::WinML::MLOperatorEdgeTypeConstraint*,
    typeConstraintCount : UInt32,
    attributes : Win32cr::AI::MachineLearning::WinML::MLOperatorAttribute*,
    attributeCount : UInt32,
    defaultAttributes : Win32cr::AI::MachineLearning::WinML::MLOperatorAttributeNameValue*,
    defaultAttributeCount : UInt32

  @[Extern]
  record MLOperatorSetId,
    domain : Win32cr::Foundation::PSTR,
    version : Int32

  @[Extern]
  record MLOperatorKernelDescription,
    domain : Win32cr::Foundation::PSTR,
    name : Win32cr::Foundation::PSTR,
    minimumOperatorSetVersion : Int32,
    executionType : Win32cr::AI::MachineLearning::WinML::MLOperatorExecutionType,
    typeConstraints : Win32cr::AI::MachineLearning::WinML::MLOperatorEdgeTypeConstraint*,
    typeConstraintCount : UInt32,
    defaultAttributes : Win32cr::AI::MachineLearning::WinML::MLOperatorAttributeNameValue*,
    defaultAttributeCount : UInt32,
    options : Win32cr::AI::MachineLearning::WinML::MLOperatorKernelOptions,
    executionOptions : UInt32

  @[Extern]
  record IWinMLModelVtbl,
    query_interface : Proc(IWinMLModel*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWinMLModel*, UInt32),
    release : Proc(IWinMLModel*, UInt32),
    get_description : Proc(IWinMLModel*, Win32cr::AI::MachineLearning::WinML::WINML_MODEL_DESC**, Win32cr::Foundation::HRESULT),
    enumerate_metadata : Proc(IWinMLModel*, UInt32, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    enumerate_model_inputs : Proc(IWinMLModel*, UInt32, Win32cr::AI::MachineLearning::WinML::WINML_VARIABLE_DESC**, Win32cr::Foundation::HRESULT),
    enumerate_model_outputs : Proc(IWinMLModel*, UInt32, Win32cr::AI::MachineLearning::WinML::WINML_VARIABLE_DESC**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("e2eeb6a9-f31f-4055-a521-e30b5b33664a")]
  record IWinMLModel, lpVtbl : IWinMLModelVtbl* do
    GUID = LibC::GUID.new(0xe2eeb6a9_u32, 0xf31f_u16, 0x4055_u16, StaticArray[0xa5_u8, 0x21_u8, 0xe3_u8, 0xb_u8, 0x5b_u8, 0x33_u8, 0x66_u8, 0x4a_u8])
    def query_interface(this : IWinMLModel*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWinMLModel*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWinMLModel*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_description(this : IWinMLModel*, ppDescription : Win32cr::AI::MachineLearning::WinML::WINML_MODEL_DESC**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_description.call(this, ppDescription)
    end
    def enumerate_metadata(this : IWinMLModel*, index : UInt32, pKey : Win32cr::Foundation::PWSTR*, pValue : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enumerate_metadata.call(this, index, pKey, pValue)
    end
    def enumerate_model_inputs(this : IWinMLModel*, index : UInt32, ppInputDescriptor : Win32cr::AI::MachineLearning::WinML::WINML_VARIABLE_DESC**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enumerate_model_inputs.call(this, index, ppInputDescriptor)
    end
    def enumerate_model_outputs(this : IWinMLModel*, index : UInt32, ppOutputDescriptor : Win32cr::AI::MachineLearning::WinML::WINML_VARIABLE_DESC**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enumerate_model_outputs.call(this, index, ppOutputDescriptor)
    end

  end

  @[Extern]
  record IWinMLEvaluationContextVtbl,
    query_interface : Proc(IWinMLEvaluationContext*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWinMLEvaluationContext*, UInt32),
    release : Proc(IWinMLEvaluationContext*, UInt32),
    bind_value : Proc(IWinMLEvaluationContext*, Win32cr::AI::MachineLearning::WinML::WINML_BINDING_DESC*, Win32cr::Foundation::HRESULT),
    get_value_by_name : Proc(IWinMLEvaluationContext*, Win32cr::Foundation::PWSTR, Win32cr::AI::MachineLearning::WinML::WINML_BINDING_DESC**, Win32cr::Foundation::HRESULT),
    clear : Proc(IWinMLEvaluationContext*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("95848f9e-583d-4054-af12-916387cd8426")]
  record IWinMLEvaluationContext, lpVtbl : IWinMLEvaluationContextVtbl* do
    GUID = LibC::GUID.new(0x95848f9e_u32, 0x583d_u16, 0x4054_u16, StaticArray[0xaf_u8, 0x12_u8, 0x91_u8, 0x63_u8, 0x87_u8, 0xcd_u8, 0x84_u8, 0x26_u8])
    def query_interface(this : IWinMLEvaluationContext*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWinMLEvaluationContext*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWinMLEvaluationContext*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def bind_value(this : IWinMLEvaluationContext*, pDescriptor : Win32cr::AI::MachineLearning::WinML::WINML_BINDING_DESC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.bind_value.call(this, pDescriptor)
    end
    def get_value_by_name(this : IWinMLEvaluationContext*, name : Win32cr::Foundation::PWSTR, pDescriptor : Win32cr::AI::MachineLearning::WinML::WINML_BINDING_DESC**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_value_by_name.call(this, name, pDescriptor)
    end
    def clear(this : IWinMLEvaluationContext*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear.call(this)
    end

  end

  @[Extern]
  record IWinMLRuntimeVtbl,
    query_interface : Proc(IWinMLRuntime*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWinMLRuntime*, UInt32),
    release : Proc(IWinMLRuntime*, UInt32),
    load_model : Proc(IWinMLRuntime*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    create_evaluation_context : Proc(IWinMLRuntime*, Void*, Void**, Win32cr::Foundation::HRESULT),
    evaluate_model : Proc(IWinMLRuntime*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a0425329-40ae-48d9-bce3-829ef7b8a41a")]
  record IWinMLRuntime, lpVtbl : IWinMLRuntimeVtbl* do
    GUID = LibC::GUID.new(0xa0425329_u32, 0x40ae_u16, 0x48d9_u16, StaticArray[0xbc_u8, 0xe3_u8, 0x82_u8, 0x9e_u8, 0xf7_u8, 0xb8_u8, 0xa4_u8, 0x1a_u8])
    def query_interface(this : IWinMLRuntime*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWinMLRuntime*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWinMLRuntime*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def load_model(this : IWinMLRuntime*, path : Win32cr::Foundation::PWSTR, ppModel : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_model.call(this, path, ppModel)
    end
    def create_evaluation_context(this : IWinMLRuntime*, device : Void*, ppContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_evaluation_context.call(this, device, ppContext)
    end
    def evaluate_model(this : IWinMLRuntime*, pContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.evaluate_model.call(this, pContext)
    end

  end

  @[Extern]
  record IWinMLRuntimeFactoryVtbl,
    query_interface : Proc(IWinMLRuntimeFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWinMLRuntimeFactory*, UInt32),
    release : Proc(IWinMLRuntimeFactory*, UInt32),
    create_runtime : Proc(IWinMLRuntimeFactory*, Win32cr::AI::MachineLearning::WinML::WINML_RUNTIME_TYPE, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a807b84d-4ae5-4bc0-a76a-941aa246bd41")]
  record IWinMLRuntimeFactory, lpVtbl : IWinMLRuntimeFactoryVtbl* do
    GUID = LibC::GUID.new(0xa807b84d_u32, 0x4ae5_u16, 0x4bc0_u16, StaticArray[0xa7_u8, 0x6a_u8, 0x94_u8, 0x1a_u8, 0xa2_u8, 0x46_u8, 0xbd_u8, 0x41_u8])
    def query_interface(this : IWinMLRuntimeFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWinMLRuntimeFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWinMLRuntimeFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_runtime(this : IWinMLRuntimeFactory*, runtime_type : Win32cr::AI::MachineLearning::WinML::WINML_RUNTIME_TYPE, ppRuntime : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_runtime.call(this, runtime_type, ppRuntime)
    end

  end

  @[Extern]
  record IMLOperatorAttributesVtbl,
    query_interface : Proc(IMLOperatorAttributes*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMLOperatorAttributes*, UInt32),
    release : Proc(IMLOperatorAttributes*, UInt32),
    get_attribute_element_count : Proc(IMLOperatorAttributes*, Win32cr::Foundation::PSTR, Win32cr::AI::MachineLearning::WinML::MLOperatorAttributeType, UInt32*, Win32cr::Foundation::HRESULT),
    get_attribute : Proc(IMLOperatorAttributes*, Win32cr::Foundation::PSTR, Win32cr::AI::MachineLearning::WinML::MLOperatorAttributeType, UInt32, LibC::UIntPtrT, Void*, Win32cr::Foundation::HRESULT),
    get_string_attribute_element_length : Proc(IMLOperatorAttributes*, Win32cr::Foundation::PSTR, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_string_attribute_element : Proc(IMLOperatorAttributes*, Win32cr::Foundation::PSTR, UInt32, UInt32, UInt8*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4b1b1759-ec40-466c-aab4-beb5347fd24c")]
  record IMLOperatorAttributes, lpVtbl : IMLOperatorAttributesVtbl* do
    GUID = LibC::GUID.new(0x4b1b1759_u32, 0xec40_u16, 0x466c_u16, StaticArray[0xaa_u8, 0xb4_u8, 0xbe_u8, 0xb5_u8, 0x34_u8, 0x7f_u8, 0xd2_u8, 0x4c_u8])
    def query_interface(this : IMLOperatorAttributes*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMLOperatorAttributes*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMLOperatorAttributes*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_attribute_element_count(this : IMLOperatorAttributes*, name : Win32cr::Foundation::PSTR, type__ : Win32cr::AI::MachineLearning::WinML::MLOperatorAttributeType, elementCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attribute_element_count.call(this, name, type__, elementCount)
    end
    def get_attribute(this : IMLOperatorAttributes*, name : Win32cr::Foundation::PSTR, type__ : Win32cr::AI::MachineLearning::WinML::MLOperatorAttributeType, elementCount : UInt32, elementByteSize : LibC::UIntPtrT, value : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attribute.call(this, name, type__, elementCount, elementByteSize, value)
    end
    def get_string_attribute_element_length(this : IMLOperatorAttributes*, name : Win32cr::Foundation::PSTR, elementIndex : UInt32, attributeElementByteSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_attribute_element_length.call(this, name, elementIndex, attributeElementByteSize)
    end
    def get_string_attribute_element(this : IMLOperatorAttributes*, name : Win32cr::Foundation::PSTR, elementIndex : UInt32, attributeElementByteSize : UInt32, attributeElement : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_attribute_element.call(this, name, elementIndex, attributeElementByteSize, attributeElement)
    end

  end

  @[Extern]
  record IMLOperatorTensorShapeDescriptionVtbl,
    query_interface : Proc(IMLOperatorTensorShapeDescription*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMLOperatorTensorShapeDescription*, UInt32),
    release : Proc(IMLOperatorTensorShapeDescription*, UInt32),
    get_input_tensor_dimension_count : Proc(IMLOperatorTensorShapeDescription*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_input_tensor_shape : Proc(IMLOperatorTensorShapeDescription*, UInt32, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    has_output_shape_description : Proc(IMLOperatorTensorShapeDescription*, Bool),
    get_output_tensor_dimension_count : Proc(IMLOperatorTensorShapeDescription*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_output_tensor_shape : Proc(IMLOperatorTensorShapeDescription*, UInt32, UInt32, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f20e8cbe-3b28-4248-be95-f96fbc6e4643")]
  record IMLOperatorTensorShapeDescription, lpVtbl : IMLOperatorTensorShapeDescriptionVtbl* do
    GUID = LibC::GUID.new(0xf20e8cbe_u32, 0x3b28_u16, 0x4248_u16, StaticArray[0xbe_u8, 0x95_u8, 0xf9_u8, 0x6f_u8, 0xbc_u8, 0x6e_u8, 0x46_u8, 0x43_u8])
    def query_interface(this : IMLOperatorTensorShapeDescription*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMLOperatorTensorShapeDescription*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMLOperatorTensorShapeDescription*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_input_tensor_dimension_count(this : IMLOperatorTensorShapeDescription*, inputIndex : UInt32, dimensionCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_input_tensor_dimension_count.call(this, inputIndex, dimensionCount)
    end
    def get_input_tensor_shape(this : IMLOperatorTensorShapeDescription*, inputIndex : UInt32, dimensionCount : UInt32, dimensions : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_input_tensor_shape.call(this, inputIndex, dimensionCount, dimensions)
    end
    def has_output_shape_description(this : IMLOperatorTensorShapeDescription*) : Bool
      @lpVtbl.try &.value.has_output_shape_description.call(this)
    end
    def get_output_tensor_dimension_count(this : IMLOperatorTensorShapeDescription*, outputIndex : UInt32, dimensionCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output_tensor_dimension_count.call(this, outputIndex, dimensionCount)
    end
    def get_output_tensor_shape(this : IMLOperatorTensorShapeDescription*, outputIndex : UInt32, dimensionCount : UInt32, dimensions : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output_tensor_shape.call(this, outputIndex, dimensionCount, dimensions)
    end

  end

  @[Extern]
  record IMLOperatorKernelCreationContextVtbl,
    query_interface : Proc(IMLOperatorKernelCreationContext*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMLOperatorKernelCreationContext*, UInt32),
    release : Proc(IMLOperatorKernelCreationContext*, UInt32),
    get_attribute_element_count : Proc(IMLOperatorKernelCreationContext*, Win32cr::Foundation::PSTR, Win32cr::AI::MachineLearning::WinML::MLOperatorAttributeType, UInt32*, Win32cr::Foundation::HRESULT),
    get_attribute : Proc(IMLOperatorKernelCreationContext*, Win32cr::Foundation::PSTR, Win32cr::AI::MachineLearning::WinML::MLOperatorAttributeType, UInt32, LibC::UIntPtrT, Void*, Win32cr::Foundation::HRESULT),
    get_string_attribute_element_length : Proc(IMLOperatorKernelCreationContext*, Win32cr::Foundation::PSTR, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_string_attribute_element : Proc(IMLOperatorKernelCreationContext*, Win32cr::Foundation::PSTR, UInt32, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    get_input_count : Proc(IMLOperatorKernelCreationContext*, UInt32),
    get_output_count : Proc(IMLOperatorKernelCreationContext*, UInt32),
    is_input_valid : Proc(IMLOperatorKernelCreationContext*, UInt32, Bool),
    is_output_valid : Proc(IMLOperatorKernelCreationContext*, UInt32, Bool),
    get_input_edge_description : Proc(IMLOperatorKernelCreationContext*, UInt32, Win32cr::AI::MachineLearning::WinML::MLOperatorEdgeDescription*, Win32cr::Foundation::HRESULT),
    get_output_edge_description : Proc(IMLOperatorKernelCreationContext*, UInt32, Win32cr::AI::MachineLearning::WinML::MLOperatorEdgeDescription*, Win32cr::Foundation::HRESULT),
    has_tensor_shape_description : Proc(IMLOperatorKernelCreationContext*, Bool),
    get_tensor_shape_description : Proc(IMLOperatorKernelCreationContext*, Void**, Win32cr::Foundation::HRESULT),
    get_execution_interface : Proc(IMLOperatorKernelCreationContext*, Void**, Void)


  @[Extern]
  #@[Com("5459b53d-a0fc-4665-addd-70171ef7e631")]
  record IMLOperatorKernelCreationContext, lpVtbl : IMLOperatorKernelCreationContextVtbl* do
    GUID = LibC::GUID.new(0x5459b53d_u32, 0xa0fc_u16, 0x4665_u16, StaticArray[0xad_u8, 0xdd_u8, 0x70_u8, 0x17_u8, 0x1e_u8, 0xf7_u8, 0xe6_u8, 0x31_u8])
    def query_interface(this : IMLOperatorKernelCreationContext*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMLOperatorKernelCreationContext*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMLOperatorKernelCreationContext*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_attribute_element_count(this : IMLOperatorKernelCreationContext*, name : Win32cr::Foundation::PSTR, type__ : Win32cr::AI::MachineLearning::WinML::MLOperatorAttributeType, elementCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attribute_element_count.call(this, name, type__, elementCount)
    end
    def get_attribute(this : IMLOperatorKernelCreationContext*, name : Win32cr::Foundation::PSTR, type__ : Win32cr::AI::MachineLearning::WinML::MLOperatorAttributeType, elementCount : UInt32, elementByteSize : LibC::UIntPtrT, value : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attribute.call(this, name, type__, elementCount, elementByteSize, value)
    end
    def get_string_attribute_element_length(this : IMLOperatorKernelCreationContext*, name : Win32cr::Foundation::PSTR, elementIndex : UInt32, attributeElementByteSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_attribute_element_length.call(this, name, elementIndex, attributeElementByteSize)
    end
    def get_string_attribute_element(this : IMLOperatorKernelCreationContext*, name : Win32cr::Foundation::PSTR, elementIndex : UInt32, attributeElementByteSize : UInt32, attributeElement : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_attribute_element.call(this, name, elementIndex, attributeElementByteSize, attributeElement)
    end
    def get_input_count(this : IMLOperatorKernelCreationContext*) : UInt32
      @lpVtbl.try &.value.get_input_count.call(this)
    end
    def get_output_count(this : IMLOperatorKernelCreationContext*) : UInt32
      @lpVtbl.try &.value.get_output_count.call(this)
    end
    def is_input_valid(this : IMLOperatorKernelCreationContext*, inputIndex : UInt32) : Bool
      @lpVtbl.try &.value.is_input_valid.call(this, inputIndex)
    end
    def is_output_valid(this : IMLOperatorKernelCreationContext*, outputIndex : UInt32) : Bool
      @lpVtbl.try &.value.is_output_valid.call(this, outputIndex)
    end
    def get_input_edge_description(this : IMLOperatorKernelCreationContext*, inputIndex : UInt32, edgeDescription : Win32cr::AI::MachineLearning::WinML::MLOperatorEdgeDescription*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_input_edge_description.call(this, inputIndex, edgeDescription)
    end
    def get_output_edge_description(this : IMLOperatorKernelCreationContext*, outputIndex : UInt32, edgeDescription : Win32cr::AI::MachineLearning::WinML::MLOperatorEdgeDescription*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output_edge_description.call(this, outputIndex, edgeDescription)
    end
    def has_tensor_shape_description(this : IMLOperatorKernelCreationContext*) : Bool
      @lpVtbl.try &.value.has_tensor_shape_description.call(this)
    end
    def get_tensor_shape_description(this : IMLOperatorKernelCreationContext*, shapeDescription : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_tensor_shape_description.call(this, shapeDescription)
    end
    def get_execution_interface(this : IMLOperatorKernelCreationContext*, executionObject : Void**) : Void
      @lpVtbl.try &.value.get_execution_interface.call(this, executionObject)
    end

  end

  @[Extern]
  record IMLOperatorTensorVtbl,
    query_interface : Proc(IMLOperatorTensor*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMLOperatorTensor*, UInt32),
    release : Proc(IMLOperatorTensor*, UInt32),
    get_dimension_count : Proc(IMLOperatorTensor*, UInt32),
    get_shape : Proc(IMLOperatorTensor*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_tensor_data_type : Proc(IMLOperatorTensor*, Win32cr::AI::MachineLearning::WinML::MLOperatorTensorDataType),
    is_cpu_data : Proc(IMLOperatorTensor*, Bool),
    is_data_interface : Proc(IMLOperatorTensor*, Bool),
    get_data : Proc(IMLOperatorTensor*, Void*),
    get_data_interface : Proc(IMLOperatorTensor*, Void**, Void)


  @[Extern]
  #@[Com("7fe41f41-f430-440e-aece-54416dc8b9db")]
  record IMLOperatorTensor, lpVtbl : IMLOperatorTensorVtbl* do
    GUID = LibC::GUID.new(0x7fe41f41_u32, 0xf430_u16, 0x440e_u16, StaticArray[0xae_u8, 0xce_u8, 0x54_u8, 0x41_u8, 0x6d_u8, 0xc8_u8, 0xb9_u8, 0xdb_u8])
    def query_interface(this : IMLOperatorTensor*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMLOperatorTensor*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMLOperatorTensor*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_dimension_count(this : IMLOperatorTensor*) : UInt32
      @lpVtbl.try &.value.get_dimension_count.call(this)
    end
    def get_shape(this : IMLOperatorTensor*, dimensionCount : UInt32, dimensions : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_shape.call(this, dimensionCount, dimensions)
    end
    def get_tensor_data_type(this : IMLOperatorTensor*) : Win32cr::AI::MachineLearning::WinML::MLOperatorTensorDataType
      @lpVtbl.try &.value.get_tensor_data_type.call(this)
    end
    def is_cpu_data(this : IMLOperatorTensor*) : Bool
      @lpVtbl.try &.value.is_cpu_data.call(this)
    end
    def is_data_interface(this : IMLOperatorTensor*) : Bool
      @lpVtbl.try &.value.is_data_interface.call(this)
    end
    def get_data(this : IMLOperatorTensor*) : Void*
      @lpVtbl.try &.value.get_data.call(this)
    end
    def get_data_interface(this : IMLOperatorTensor*, dataInterface : Void**) : Void
      @lpVtbl.try &.value.get_data_interface.call(this, dataInterface)
    end

  end

  @[Extern]
  record IMLOperatorKernelContextVtbl,
    query_interface : Proc(IMLOperatorKernelContext*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMLOperatorKernelContext*, UInt32),
    release : Proc(IMLOperatorKernelContext*, UInt32),
    get_input_tensor : Proc(IMLOperatorKernelContext*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_output_tensor_1 : Proc(IMLOperatorKernelContext*, UInt32, UInt32, UInt32*, Void**, Win32cr::Foundation::HRESULT),
    get_output_tensor_2 : Proc(IMLOperatorKernelContext*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    allocate_temporary_data : Proc(IMLOperatorKernelContext*, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_execution_interface : Proc(IMLOperatorKernelContext*, Void**, Void)


  @[Extern]
  #@[Com("82536a28-f022-4769-9d3f-8b278f84c0c3")]
  record IMLOperatorKernelContext, lpVtbl : IMLOperatorKernelContextVtbl* do
    GUID = LibC::GUID.new(0x82536a28_u32, 0xf022_u16, 0x4769_u16, StaticArray[0x9d_u8, 0x3f_u8, 0x8b_u8, 0x27_u8, 0x8f_u8, 0x84_u8, 0xc0_u8, 0xc3_u8])
    def query_interface(this : IMLOperatorKernelContext*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMLOperatorKernelContext*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMLOperatorKernelContext*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_input_tensor(this : IMLOperatorKernelContext*, inputIndex : UInt32, tensor : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_input_tensor.call(this, inputIndex, tensor)
    end
    def get_output_tensor_1(this : IMLOperatorKernelContext*, outputIndex : UInt32, dimensionCount : UInt32, dimensionSizes : UInt32*, tensor : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output_tensor_1.call(this, outputIndex, dimensionCount, dimensionSizes, tensor)
    end
    def get_output_tensor_2(this : IMLOperatorKernelContext*, outputIndex : UInt32, tensor : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output_tensor_2.call(this, outputIndex, tensor)
    end
    def allocate_temporary_data(this : IMLOperatorKernelContext*, size : LibC::UIntPtrT, data : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.allocate_temporary_data.call(this, size, data)
    end
    def get_execution_interface(this : IMLOperatorKernelContext*, executionObject : Void**) : Void
      @lpVtbl.try &.value.get_execution_interface.call(this, executionObject)
    end

  end

  @[Extern]
  record IMLOperatorKernelVtbl,
    query_interface : Proc(IMLOperatorKernel*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMLOperatorKernel*, UInt32),
    release : Proc(IMLOperatorKernel*, UInt32),
    compute : Proc(IMLOperatorKernel*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("11c4b4a0-b467-4eaa-a1a6-b961d8d0ed79")]
  record IMLOperatorKernel, lpVtbl : IMLOperatorKernelVtbl* do
    GUID = LibC::GUID.new(0x11c4b4a0_u32, 0xb467_u16, 0x4eaa_u16, StaticArray[0xa1_u8, 0xa6_u8, 0xb9_u8, 0x61_u8, 0xd8_u8, 0xd0_u8, 0xed_u8, 0x79_u8])
    def query_interface(this : IMLOperatorKernel*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMLOperatorKernel*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMLOperatorKernel*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def compute(this : IMLOperatorKernel*, context : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compute.call(this, context)
    end

  end

  @[Extern]
  record IMLOperatorShapeInferenceContextVtbl,
    query_interface : Proc(IMLOperatorShapeInferenceContext*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMLOperatorShapeInferenceContext*, UInt32),
    release : Proc(IMLOperatorShapeInferenceContext*, UInt32),
    get_attribute_element_count : Proc(IMLOperatorShapeInferenceContext*, Win32cr::Foundation::PSTR, Win32cr::AI::MachineLearning::WinML::MLOperatorAttributeType, UInt32*, Win32cr::Foundation::HRESULT),
    get_attribute : Proc(IMLOperatorShapeInferenceContext*, Win32cr::Foundation::PSTR, Win32cr::AI::MachineLearning::WinML::MLOperatorAttributeType, UInt32, LibC::UIntPtrT, Void*, Win32cr::Foundation::HRESULT),
    get_string_attribute_element_length : Proc(IMLOperatorShapeInferenceContext*, Win32cr::Foundation::PSTR, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_string_attribute_element : Proc(IMLOperatorShapeInferenceContext*, Win32cr::Foundation::PSTR, UInt32, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    get_input_count : Proc(IMLOperatorShapeInferenceContext*, UInt32),
    get_output_count : Proc(IMLOperatorShapeInferenceContext*, UInt32),
    is_input_valid : Proc(IMLOperatorShapeInferenceContext*, UInt32, Bool),
    is_output_valid : Proc(IMLOperatorShapeInferenceContext*, UInt32, Bool),
    get_input_edge_description : Proc(IMLOperatorShapeInferenceContext*, UInt32, Win32cr::AI::MachineLearning::WinML::MLOperatorEdgeDescription*, Win32cr::Foundation::HRESULT),
    get_input_tensor_dimension_count : Proc(IMLOperatorShapeInferenceContext*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_input_tensor_shape : Proc(IMLOperatorShapeInferenceContext*, UInt32, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    set_output_tensor_shape : Proc(IMLOperatorShapeInferenceContext*, UInt32, UInt32, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("105b6b29-5408-4a68-9959-09b5955a3492")]
  record IMLOperatorShapeInferenceContext, lpVtbl : IMLOperatorShapeInferenceContextVtbl* do
    GUID = LibC::GUID.new(0x105b6b29_u32, 0x5408_u16, 0x4a68_u16, StaticArray[0x99_u8, 0x59_u8, 0x9_u8, 0xb5_u8, 0x95_u8, 0x5a_u8, 0x34_u8, 0x92_u8])
    def query_interface(this : IMLOperatorShapeInferenceContext*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMLOperatorShapeInferenceContext*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMLOperatorShapeInferenceContext*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_attribute_element_count(this : IMLOperatorShapeInferenceContext*, name : Win32cr::Foundation::PSTR, type__ : Win32cr::AI::MachineLearning::WinML::MLOperatorAttributeType, elementCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attribute_element_count.call(this, name, type__, elementCount)
    end
    def get_attribute(this : IMLOperatorShapeInferenceContext*, name : Win32cr::Foundation::PSTR, type__ : Win32cr::AI::MachineLearning::WinML::MLOperatorAttributeType, elementCount : UInt32, elementByteSize : LibC::UIntPtrT, value : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attribute.call(this, name, type__, elementCount, elementByteSize, value)
    end
    def get_string_attribute_element_length(this : IMLOperatorShapeInferenceContext*, name : Win32cr::Foundation::PSTR, elementIndex : UInt32, attributeElementByteSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_attribute_element_length.call(this, name, elementIndex, attributeElementByteSize)
    end
    def get_string_attribute_element(this : IMLOperatorShapeInferenceContext*, name : Win32cr::Foundation::PSTR, elementIndex : UInt32, attributeElementByteSize : UInt32, attributeElement : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_attribute_element.call(this, name, elementIndex, attributeElementByteSize, attributeElement)
    end
    def get_input_count(this : IMLOperatorShapeInferenceContext*) : UInt32
      @lpVtbl.try &.value.get_input_count.call(this)
    end
    def get_output_count(this : IMLOperatorShapeInferenceContext*) : UInt32
      @lpVtbl.try &.value.get_output_count.call(this)
    end
    def is_input_valid(this : IMLOperatorShapeInferenceContext*, inputIndex : UInt32) : Bool
      @lpVtbl.try &.value.is_input_valid.call(this, inputIndex)
    end
    def is_output_valid(this : IMLOperatorShapeInferenceContext*, outputIndex : UInt32) : Bool
      @lpVtbl.try &.value.is_output_valid.call(this, outputIndex)
    end
    def get_input_edge_description(this : IMLOperatorShapeInferenceContext*, inputIndex : UInt32, edgeDescription : Win32cr::AI::MachineLearning::WinML::MLOperatorEdgeDescription*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_input_edge_description.call(this, inputIndex, edgeDescription)
    end
    def get_input_tensor_dimension_count(this : IMLOperatorShapeInferenceContext*, inputIndex : UInt32, dimensionCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_input_tensor_dimension_count.call(this, inputIndex, dimensionCount)
    end
    def get_input_tensor_shape(this : IMLOperatorShapeInferenceContext*, inputIndex : UInt32, dimensionCount : UInt32, dimensions : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_input_tensor_shape.call(this, inputIndex, dimensionCount, dimensions)
    end
    def set_output_tensor_shape(this : IMLOperatorShapeInferenceContext*, outputIndex : UInt32, dimensionCount : UInt32, dimensions : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_output_tensor_shape.call(this, outputIndex, dimensionCount, dimensions)
    end

  end

  @[Extern]
  record IMLOperatorTypeInferenceContextVtbl,
    query_interface : Proc(IMLOperatorTypeInferenceContext*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMLOperatorTypeInferenceContext*, UInt32),
    release : Proc(IMLOperatorTypeInferenceContext*, UInt32),
    get_attribute_element_count : Proc(IMLOperatorTypeInferenceContext*, Win32cr::Foundation::PSTR, Win32cr::AI::MachineLearning::WinML::MLOperatorAttributeType, UInt32*, Win32cr::Foundation::HRESULT),
    get_attribute : Proc(IMLOperatorTypeInferenceContext*, Win32cr::Foundation::PSTR, Win32cr::AI::MachineLearning::WinML::MLOperatorAttributeType, UInt32, LibC::UIntPtrT, Void*, Win32cr::Foundation::HRESULT),
    get_string_attribute_element_length : Proc(IMLOperatorTypeInferenceContext*, Win32cr::Foundation::PSTR, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_string_attribute_element : Proc(IMLOperatorTypeInferenceContext*, Win32cr::Foundation::PSTR, UInt32, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    get_input_count : Proc(IMLOperatorTypeInferenceContext*, UInt32),
    get_output_count : Proc(IMLOperatorTypeInferenceContext*, UInt32),
    is_input_valid : Proc(IMLOperatorTypeInferenceContext*, UInt32, Bool),
    is_output_valid : Proc(IMLOperatorTypeInferenceContext*, UInt32, Bool),
    get_input_edge_description : Proc(IMLOperatorTypeInferenceContext*, UInt32, Win32cr::AI::MachineLearning::WinML::MLOperatorEdgeDescription*, Win32cr::Foundation::HRESULT),
    set_output_edge_description : Proc(IMLOperatorTypeInferenceContext*, UInt32, Win32cr::AI::MachineLearning::WinML::MLOperatorEdgeDescription*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("ec893bb1-f938-427b-8488-c8dcf775f138")]
  record IMLOperatorTypeInferenceContext, lpVtbl : IMLOperatorTypeInferenceContextVtbl* do
    GUID = LibC::GUID.new(0xec893bb1_u32, 0xf938_u16, 0x427b_u16, StaticArray[0x84_u8, 0x88_u8, 0xc8_u8, 0xdc_u8, 0xf7_u8, 0x75_u8, 0xf1_u8, 0x38_u8])
    def query_interface(this : IMLOperatorTypeInferenceContext*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMLOperatorTypeInferenceContext*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMLOperatorTypeInferenceContext*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_attribute_element_count(this : IMLOperatorTypeInferenceContext*, name : Win32cr::Foundation::PSTR, type__ : Win32cr::AI::MachineLearning::WinML::MLOperatorAttributeType, elementCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attribute_element_count.call(this, name, type__, elementCount)
    end
    def get_attribute(this : IMLOperatorTypeInferenceContext*, name : Win32cr::Foundation::PSTR, type__ : Win32cr::AI::MachineLearning::WinML::MLOperatorAttributeType, elementCount : UInt32, elementByteSize : LibC::UIntPtrT, value : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attribute.call(this, name, type__, elementCount, elementByteSize, value)
    end
    def get_string_attribute_element_length(this : IMLOperatorTypeInferenceContext*, name : Win32cr::Foundation::PSTR, elementIndex : UInt32, attributeElementByteSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_attribute_element_length.call(this, name, elementIndex, attributeElementByteSize)
    end
    def get_string_attribute_element(this : IMLOperatorTypeInferenceContext*, name : Win32cr::Foundation::PSTR, elementIndex : UInt32, attributeElementByteSize : UInt32, attributeElement : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_attribute_element.call(this, name, elementIndex, attributeElementByteSize, attributeElement)
    end
    def get_input_count(this : IMLOperatorTypeInferenceContext*) : UInt32
      @lpVtbl.try &.value.get_input_count.call(this)
    end
    def get_output_count(this : IMLOperatorTypeInferenceContext*) : UInt32
      @lpVtbl.try &.value.get_output_count.call(this)
    end
    def is_input_valid(this : IMLOperatorTypeInferenceContext*, inputIndex : UInt32) : Bool
      @lpVtbl.try &.value.is_input_valid.call(this, inputIndex)
    end
    def is_output_valid(this : IMLOperatorTypeInferenceContext*, outputIndex : UInt32) : Bool
      @lpVtbl.try &.value.is_output_valid.call(this, outputIndex)
    end
    def get_input_edge_description(this : IMLOperatorTypeInferenceContext*, inputIndex : UInt32, edgeDescription : Win32cr::AI::MachineLearning::WinML::MLOperatorEdgeDescription*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_input_edge_description.call(this, inputIndex, edgeDescription)
    end
    def set_output_edge_description(this : IMLOperatorTypeInferenceContext*, outputIndex : UInt32, edgeDescription : Win32cr::AI::MachineLearning::WinML::MLOperatorEdgeDescription*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_output_edge_description.call(this, outputIndex, edgeDescription)
    end

  end

  @[Extern]
  record IMLOperatorTypeInferrerVtbl,
    query_interface : Proc(IMLOperatorTypeInferrer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMLOperatorTypeInferrer*, UInt32),
    release : Proc(IMLOperatorTypeInferrer*, UInt32),
    infer_output_types : Proc(IMLOperatorTypeInferrer*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("781aeb48-9bcb-4797-bf77-8bf455217beb")]
  record IMLOperatorTypeInferrer, lpVtbl : IMLOperatorTypeInferrerVtbl* do
    GUID = LibC::GUID.new(0x781aeb48_u32, 0x9bcb_u16, 0x4797_u16, StaticArray[0xbf_u8, 0x77_u8, 0x8b_u8, 0xf4_u8, 0x55_u8, 0x21_u8, 0x7b_u8, 0xeb_u8])
    def query_interface(this : IMLOperatorTypeInferrer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMLOperatorTypeInferrer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMLOperatorTypeInferrer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def infer_output_types(this : IMLOperatorTypeInferrer*, context : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.infer_output_types.call(this, context)
    end

  end

  @[Extern]
  record IMLOperatorShapeInferrerVtbl,
    query_interface : Proc(IMLOperatorShapeInferrer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMLOperatorShapeInferrer*, UInt32),
    release : Proc(IMLOperatorShapeInferrer*, UInt32),
    infer_output_shapes : Proc(IMLOperatorShapeInferrer*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("540be5be-a6c9-40ee-83f6-d2b8b40a7798")]
  record IMLOperatorShapeInferrer, lpVtbl : IMLOperatorShapeInferrerVtbl* do
    GUID = LibC::GUID.new(0x540be5be_u32, 0xa6c9_u16, 0x40ee_u16, StaticArray[0x83_u8, 0xf6_u8, 0xd2_u8, 0xb8_u8, 0xb4_u8, 0xa_u8, 0x77_u8, 0x98_u8])
    def query_interface(this : IMLOperatorShapeInferrer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMLOperatorShapeInferrer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMLOperatorShapeInferrer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def infer_output_shapes(this : IMLOperatorShapeInferrer*, context : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.infer_output_shapes.call(this, context)
    end

  end

  @[Extern]
  record IMLOperatorKernelFactoryVtbl,
    query_interface : Proc(IMLOperatorKernelFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMLOperatorKernelFactory*, UInt32),
    release : Proc(IMLOperatorKernelFactory*, UInt32),
    create_kernel : Proc(IMLOperatorKernelFactory*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("ef15ad6f-0dc9-4908-ab35-a575a30dfbf8")]
  record IMLOperatorKernelFactory, lpVtbl : IMLOperatorKernelFactoryVtbl* do
    GUID = LibC::GUID.new(0xef15ad6f_u32, 0xdc9_u16, 0x4908_u16, StaticArray[0xab_u8, 0x35_u8, 0xa5_u8, 0x75_u8, 0xa3_u8, 0xd_u8, 0xfb_u8, 0xf8_u8])
    def query_interface(this : IMLOperatorKernelFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMLOperatorKernelFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMLOperatorKernelFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_kernel(this : IMLOperatorKernelFactory*, context : Void*, kernel : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_kernel.call(this, context, kernel)
    end

  end

  @[Extern]
  record IMLOperatorRegistryVtbl,
    query_interface : Proc(IMLOperatorRegistry*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMLOperatorRegistry*, UInt32),
    release : Proc(IMLOperatorRegistry*, UInt32),
    register_operator_set_schema : Proc(IMLOperatorRegistry*, Win32cr::AI::MachineLearning::WinML::MLOperatorSetId*, Int32, Win32cr::AI::MachineLearning::WinML::MLOperatorSchemaDescription**, UInt32, Void*, Void*, Win32cr::Foundation::HRESULT),
    register_operator_kernel : Proc(IMLOperatorRegistry*, Win32cr::AI::MachineLearning::WinML::MLOperatorKernelDescription*, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("2af9dd2d-b516-4672-9ab5-530c208493ad")]
  record IMLOperatorRegistry, lpVtbl : IMLOperatorRegistryVtbl* do
    GUID = LibC::GUID.new(0x2af9dd2d_u32, 0xb516_u16, 0x4672_u16, StaticArray[0x9a_u8, 0xb5_u8, 0x53_u8, 0xc_u8, 0x20_u8, 0x84_u8, 0x93_u8, 0xad_u8])
    def query_interface(this : IMLOperatorRegistry*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMLOperatorRegistry*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMLOperatorRegistry*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def register_operator_set_schema(this : IMLOperatorRegistry*, operatorSetId : Win32cr::AI::MachineLearning::WinML::MLOperatorSetId*, baselineVersion : Int32, schema : Win32cr::AI::MachineLearning::WinML::MLOperatorSchemaDescription**, schemaCount : UInt32, typeInferrer : Void*, shapeInferrer : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_operator_set_schema.call(this, operatorSetId, baselineVersion, schema, schemaCount, typeInferrer, shapeInferrer)
    end
    def register_operator_kernel(this : IMLOperatorRegistry*, operatorKernel : Win32cr::AI::MachineLearning::WinML::MLOperatorKernelDescription*, operatorKernelFactory : Void*, shapeInferrer : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_operator_kernel.call(this, operatorKernel, operatorKernelFactory, shapeInferrer)
    end

  end

  @[Link("winml")]
  @[Link("windows.ai.machinelearning")]
  lib C
    fun WinMLCreateRuntime(runtime : Void**) : Win32cr::Foundation::HRESULT

    fun MLCreateOperatorRegistry(registry : Void**) : Win32cr::Foundation::HRESULT

  end
end