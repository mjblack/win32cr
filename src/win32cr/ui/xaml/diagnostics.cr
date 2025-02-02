require "./../../foundation.cr"
require "./../../system/com.cr"
require "./../../graphics/dxgi/common.cr"
require "./../../system/win_rt.cr"

module Win32cr::UI::Xaml::Diagnostics
  extend self
  E_UNKNOWNTYPE = -2144665560_i32

  enum VisualMutationType
    Add = 0_i32
    Remove = 1_i32
  end
  enum BaseValueSource
    BaseValueSourceUnknown = 0_i32
    BaseValueSourceDefault = 1_i32
    BaseValueSourceBuiltInStyle = 2_i32
    BaseValueSourceStyle = 3_i32
    BaseValueSourceLocal = 4_i32
    Inherited = 5_i32
    DefaultStyleTrigger = 6_i32
    TemplateTrigger = 7_i32
    StyleTrigger = 8_i32
    ImplicitStyleReference = 9_i32
    ParentTemplate = 10_i32
    ParentTemplateTrigger = 11_i32
    Animation = 12_i32
    Coercion = 13_i32
    BaseValueSourceVisualState = 14_i32
  end
  enum MetadataBit
    None = 0_i32
    IsValueHandle = 1_i32
    IsPropertyReadOnly = 2_i32
    IsValueCollection = 4_i32
    IsValueCollectionReadOnly = 8_i32
    IsValueBindingExpression = 16_i32
    IsValueNull = 32_i32
    IsValueHandleAndEvaluatedValue = 64_i32
  end
  enum RenderTargetBitmapOptions
    RenderTarget = 0_i32
    RenderTargetAndChildren = 1_i32
  end
  enum ResourceType
    ResourceTypeStatic = 0_i32
    ResourceTypeTheme = 1_i32
  end
  enum VisualElementState
    ErrorResolved = 0_i32
    ErrorResourceNotFound = 1_i32
    ErrorInvalidResource = 2_i32
  end

  @[Extern]
  struct SourceInfo
    property file_name : Win32cr::Foundation::BSTR
    property line_number : UInt32
    property column_number : UInt32
    property char_position : UInt32
    property hash : Win32cr::Foundation::BSTR
    def initialize(@file_name : Win32cr::Foundation::BSTR, @line_number : UInt32, @column_number : UInt32, @char_position : UInt32, @hash : Win32cr::Foundation::BSTR)
    end
  end

  @[Extern]
  struct ParentChildRelation
    property parent : UInt64
    property child : UInt64
    property child_index : UInt32
    def initialize(@parent : UInt64, @child : UInt64, @child_index : UInt32)
    end
  end

  @[Extern]
  struct VisualElement
    property handle : UInt64
    property src_info : Win32cr::UI::Xaml::Diagnostics::SourceInfo
    property type__ : Win32cr::Foundation::BSTR
    property name : Win32cr::Foundation::BSTR
    property num_children : UInt32
    def initialize(@handle : UInt64, @src_info : Win32cr::UI::Xaml::Diagnostics::SourceInfo, @type__ : Win32cr::Foundation::BSTR, @name : Win32cr::Foundation::BSTR, @num_children : UInt32)
    end
  end

  @[Extern]
  struct PropertyChainSource
    property handle : UInt64
    property target_type : Win32cr::Foundation::BSTR
    property name : Win32cr::Foundation::BSTR
    property source : Win32cr::UI::Xaml::Diagnostics::BaseValueSource
    property src_info : Win32cr::UI::Xaml::Diagnostics::SourceInfo
    def initialize(@handle : UInt64, @target_type : Win32cr::Foundation::BSTR, @name : Win32cr::Foundation::BSTR, @source : Win32cr::UI::Xaml::Diagnostics::BaseValueSource, @src_info : Win32cr::UI::Xaml::Diagnostics::SourceInfo)
    end
  end

  @[Extern]
  struct PropertyChainValue
    property index : UInt32
    property type__ : Win32cr::Foundation::BSTR
    property declaring_type : Win32cr::Foundation::BSTR
    property value_type : Win32cr::Foundation::BSTR
    property item_type : Win32cr::Foundation::BSTR
    property value : Win32cr::Foundation::BSTR
    property overridden : Win32cr::Foundation::BOOL
    property metadata_bits : Int64
    property property_name : Win32cr::Foundation::BSTR
    property property_chain_index : UInt32
    def initialize(@index : UInt32, @type__ : Win32cr::Foundation::BSTR, @declaring_type : Win32cr::Foundation::BSTR, @value_type : Win32cr::Foundation::BSTR, @item_type : Win32cr::Foundation::BSTR, @value : Win32cr::Foundation::BSTR, @overridden : Win32cr::Foundation::BOOL, @metadata_bits : Int64, @property_name : Win32cr::Foundation::BSTR, @property_chain_index : UInt32)
    end
  end

  @[Extern]
  struct EnumType
    property name : Win32cr::Foundation::BSTR
    property value_ints : Win32cr::System::Com::SAFEARRAY*
    property value_strings : Win32cr::System::Com::SAFEARRAY*
    def initialize(@name : Win32cr::Foundation::BSTR, @value_ints : Win32cr::System::Com::SAFEARRAY*, @value_strings : Win32cr::System::Com::SAFEARRAY*)
    end
  end

  @[Extern]
  struct CollectionElementValue
    property index : UInt32
    property value_type : Win32cr::Foundation::BSTR
    property value : Win32cr::Foundation::BSTR
    property metadata_bits : Int64
    def initialize(@index : UInt32, @value_type : Win32cr::Foundation::BSTR, @value : Win32cr::Foundation::BSTR, @metadata_bits : Int64)
    end
  end

  @[Extern]
  struct BitmapDescription
    property width : UInt32
    property height : UInt32
    property format : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT
    property alpha_mode : Win32cr::Graphics::Dxgi::Common::DXGI_ALPHA_MODE
    def initialize(@width : UInt32, @height : UInt32, @format : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, @alpha_mode : Win32cr::Graphics::Dxgi::Common::DXGI_ALPHA_MODE)
    end
  end

  @[Extern]
  record IVisualTreeServiceCallbackVtbl,
    query_interface : Proc(IVisualTreeServiceCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IVisualTreeServiceCallback*, UInt32),
    release : Proc(IVisualTreeServiceCallback*, UInt32),
    on_visual_tree_change : Proc(IVisualTreeServiceCallback*, Win32cr::UI::Xaml::Diagnostics::ParentChildRelation, Win32cr::UI::Xaml::Diagnostics::VisualElement, Win32cr::UI::Xaml::Diagnostics::VisualMutationType, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IVisualTreeServiceCallback, lpVtbl : IVisualTreeServiceCallbackVtbl* do
    GUID = LibC::GUID.new(0xaa7a8931_u32, 0x80e4_u16, 0x4fec_u16, StaticArray[0x8f_u8, 0x3b_u8, 0x55_u8, 0x3f_u8, 0x87_u8, 0xb4_u8, 0x96_u8, 0x6e_u8])
    def query_interface(this : IVisualTreeServiceCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IVisualTreeServiceCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IVisualTreeServiceCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_visual_tree_change(this : IVisualTreeServiceCallback*, relation : Win32cr::UI::Xaml::Diagnostics::ParentChildRelation, element : Win32cr::UI::Xaml::Diagnostics::VisualElement, mutationType : Win32cr::UI::Xaml::Diagnostics::VisualMutationType) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_visual_tree_change.call(this, relation, element, mutationType)
    end

  end

  @[Extern]
  record IVisualTreeServiceCallback2Vtbl,
    query_interface : Proc(IVisualTreeServiceCallback2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IVisualTreeServiceCallback2*, UInt32),
    release : Proc(IVisualTreeServiceCallback2*, UInt32),
    on_visual_tree_change : Proc(IVisualTreeServiceCallback2*, Win32cr::UI::Xaml::Diagnostics::ParentChildRelation, Win32cr::UI::Xaml::Diagnostics::VisualElement, Win32cr::UI::Xaml::Diagnostics::VisualMutationType, Win32cr::Foundation::HRESULT),
    on_element_state_changed : Proc(IVisualTreeServiceCallback2*, UInt64, Win32cr::UI::Xaml::Diagnostics::VisualElementState, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IVisualTreeServiceCallback2, lpVtbl : IVisualTreeServiceCallback2Vtbl* do
    GUID = LibC::GUID.new(0xbad9eb88_u32, 0xae77_u16, 0x4397_u16, StaticArray[0xb9_u8, 0x48_u8, 0x5f_u8, 0xa2_u8, 0xdb_u8, 0xa_u8, 0x19_u8, 0xea_u8])
    def query_interface(this : IVisualTreeServiceCallback2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IVisualTreeServiceCallback2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IVisualTreeServiceCallback2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_visual_tree_change(this : IVisualTreeServiceCallback2*, relation : Win32cr::UI::Xaml::Diagnostics::ParentChildRelation, element : Win32cr::UI::Xaml::Diagnostics::VisualElement, mutationType : Win32cr::UI::Xaml::Diagnostics::VisualMutationType) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_visual_tree_change.call(this, relation, element, mutationType)
    end
    def on_element_state_changed(this : IVisualTreeServiceCallback2*, element : UInt64, elementState : Win32cr::UI::Xaml::Diagnostics::VisualElementState, context : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_element_state_changed.call(this, element, elementState, context)
    end

  end

  @[Extern]
  record IVisualTreeServiceVtbl,
    query_interface : Proc(IVisualTreeService*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IVisualTreeService*, UInt32),
    release : Proc(IVisualTreeService*, UInt32),
    advise_visual_tree_change : Proc(IVisualTreeService*, Void*, Win32cr::Foundation::HRESULT),
    unadvise_visual_tree_change : Proc(IVisualTreeService*, Void*, Win32cr::Foundation::HRESULT),
    get_enums : Proc(IVisualTreeService*, UInt32*, Win32cr::UI::Xaml::Diagnostics::EnumType**, Win32cr::Foundation::HRESULT),
    create_instance : Proc(IVisualTreeService*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, UInt64*, Win32cr::Foundation::HRESULT),
    get_property_values_chain : Proc(IVisualTreeService*, UInt64, UInt32*, Win32cr::UI::Xaml::Diagnostics::PropertyChainSource**, UInt32*, Win32cr::UI::Xaml::Diagnostics::PropertyChainValue**, Win32cr::Foundation::HRESULT),
    set_property : Proc(IVisualTreeService*, UInt64, UInt64, UInt32, Win32cr::Foundation::HRESULT),
    clear_property : Proc(IVisualTreeService*, UInt64, UInt32, Win32cr::Foundation::HRESULT),
    get_collection_count : Proc(IVisualTreeService*, UInt64, UInt32*, Win32cr::Foundation::HRESULT),
    get_collection_elements : Proc(IVisualTreeService*, UInt64, UInt32, UInt32*, Win32cr::UI::Xaml::Diagnostics::CollectionElementValue**, Win32cr::Foundation::HRESULT),
    add_child : Proc(IVisualTreeService*, UInt64, UInt64, UInt32, Win32cr::Foundation::HRESULT),
    remove_child : Proc(IVisualTreeService*, UInt64, UInt32, Win32cr::Foundation::HRESULT),
    clear_children : Proc(IVisualTreeService*, UInt64, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IVisualTreeService, lpVtbl : IVisualTreeServiceVtbl* do
    GUID = LibC::GUID.new(0xa593b11a_u32, 0xd17f_u16, 0x48bb_u16, StaticArray[0x8f_u8, 0x66_u8, 0x83_u8, 0x91_u8, 0x7_u8, 0x31_u8, 0xc8_u8, 0xa5_u8])
    def query_interface(this : IVisualTreeService*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IVisualTreeService*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IVisualTreeService*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def advise_visual_tree_change(this : IVisualTreeService*, pCallback : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.advise_visual_tree_change.call(this, pCallback)
    end
    def unadvise_visual_tree_change(this : IVisualTreeService*, pCallback : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unadvise_visual_tree_change.call(this, pCallback)
    end
    def get_enums(this : IVisualTreeService*, pCount : UInt32*, ppEnums : Win32cr::UI::Xaml::Diagnostics::EnumType**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enums.call(this, pCount, ppEnums)
    end
    def create_instance(this : IVisualTreeService*, typeName : Win32cr::Foundation::BSTR, value : Win32cr::Foundation::BSTR, pInstanceHandle : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_instance.call(this, typeName, value, pInstanceHandle)
    end
    def get_property_values_chain(this : IVisualTreeService*, instanceHandle : UInt64, pSourceCount : UInt32*, ppPropertySources : Win32cr::UI::Xaml::Diagnostics::PropertyChainSource**, pPropertyCount : UInt32*, ppPropertyValues : Win32cr::UI::Xaml::Diagnostics::PropertyChainValue**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_values_chain.call(this, instanceHandle, pSourceCount, ppPropertySources, pPropertyCount, ppPropertyValues)
    end
    def set_property(this : IVisualTreeService*, instanceHandle : UInt64, value : UInt64, propertyIndex : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, instanceHandle, value, propertyIndex)
    end
    def clear_property(this : IVisualTreeService*, instanceHandle : UInt64, propertyIndex : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear_property.call(this, instanceHandle, propertyIndex)
    end
    def get_collection_count(this : IVisualTreeService*, instanceHandle : UInt64, pCollectionSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_collection_count.call(this, instanceHandle, pCollectionSize)
    end
    def get_collection_elements(this : IVisualTreeService*, instanceHandle : UInt64, startIndex : UInt32, pElementCount : UInt32*, ppElementValues : Win32cr::UI::Xaml::Diagnostics::CollectionElementValue**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_collection_elements.call(this, instanceHandle, startIndex, pElementCount, ppElementValues)
    end
    def add_child(this : IVisualTreeService*, parent : UInt64, child : UInt64, index : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_child.call(this, parent, child, index)
    end
    def remove_child(this : IVisualTreeService*, parent : UInt64, index : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_child.call(this, parent, index)
    end
    def clear_children(this : IVisualTreeService*, parent : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear_children.call(this, parent)
    end

  end

  @[Extern]
  record IXamlDiagnosticsVtbl,
    query_interface : Proc(IXamlDiagnostics*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXamlDiagnostics*, UInt32),
    release : Proc(IXamlDiagnostics*, UInt32),
    get_dispatcher : Proc(IXamlDiagnostics*, Void**, Win32cr::Foundation::HRESULT),
    get_ui_layer : Proc(IXamlDiagnostics*, Void**, Win32cr::Foundation::HRESULT),
    get_application : Proc(IXamlDiagnostics*, Void**, Win32cr::Foundation::HRESULT),
    get_i_inspectable_from_handle : Proc(IXamlDiagnostics*, UInt64, Void**, Win32cr::Foundation::HRESULT),
    get_handle_from_i_inspectable : Proc(IXamlDiagnostics*, Void*, UInt64*, Win32cr::Foundation::HRESULT),
    hit_test : Proc(IXamlDiagnostics*, Win32cr::Foundation::RECT, UInt32*, UInt64**, Win32cr::Foundation::HRESULT),
    register_instance : Proc(IXamlDiagnostics*, Void*, UInt64*, Win32cr::Foundation::HRESULT),
    get_initialization_data : Proc(IXamlDiagnostics*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXamlDiagnostics, lpVtbl : IXamlDiagnosticsVtbl* do
    GUID = LibC::GUID.new(0x18c9e2b6_u32, 0x3f43_u16, 0x4116_u16, StaticArray[0x9f_u8, 0x2b_u8, 0xff_u8, 0x93_u8, 0x5d_u8, 0x77_u8, 0x70_u8, 0xd2_u8])
    def query_interface(this : IXamlDiagnostics*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXamlDiagnostics*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXamlDiagnostics*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_dispatcher(this : IXamlDiagnostics*, ppDispatcher : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dispatcher.call(this, ppDispatcher)
    end
    def get_ui_layer(this : IXamlDiagnostics*, ppLayer : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ui_layer.call(this, ppLayer)
    end
    def get_application(this : IXamlDiagnostics*, ppApplication : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_application.call(this, ppApplication)
    end
    def get_i_inspectable_from_handle(this : IXamlDiagnostics*, instanceHandle : UInt64, ppInstance : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_inspectable_from_handle.call(this, instanceHandle, ppInstance)
    end
    def get_handle_from_i_inspectable(this : IXamlDiagnostics*, pInstance : Void*, pHandle : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_handle_from_i_inspectable.call(this, pInstance, pHandle)
    end
    def hit_test(this : IXamlDiagnostics*, rect : Win32cr::Foundation::RECT, pCount : UInt32*, ppInstanceHandles : UInt64**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.hit_test.call(this, rect, pCount, ppInstanceHandles)
    end
    def register_instance(this : IXamlDiagnostics*, pInstance : Void*, pInstanceHandle : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_instance.call(this, pInstance, pInstanceHandle)
    end
    def get_initialization_data(this : IXamlDiagnostics*, pInitializationData : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_initialization_data.call(this, pInitializationData)
    end

  end

  @[Extern]
  record IBitmapDataVtbl,
    query_interface : Proc(IBitmapData*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IBitmapData*, UInt32),
    release : Proc(IBitmapData*, UInt32),
    copy_bytes_to : Proc(IBitmapData*, UInt32, UInt32, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    get_stride : Proc(IBitmapData*, UInt32*, Win32cr::Foundation::HRESULT),
    get_bitmap_description : Proc(IBitmapData*, Win32cr::UI::Xaml::Diagnostics::BitmapDescription*, Win32cr::Foundation::HRESULT),
    get_source_bitmap_description : Proc(IBitmapData*, Win32cr::UI::Xaml::Diagnostics::BitmapDescription*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IBitmapData, lpVtbl : IBitmapDataVtbl* do
    GUID = LibC::GUID.new(0xd1a34ef2_u32, 0xcad8_u16, 0x4635_u16, StaticArray[0xa3_u8, 0xd2_u8, 0xfc_u8, 0xda_u8, 0x8d_u8, 0x3f_u8, 0x3c_u8, 0xaf_u8])
    def query_interface(this : IBitmapData*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IBitmapData*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IBitmapData*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def copy_bytes_to(this : IBitmapData*, sourceOffsetInBytes : UInt32, maxBytesToCopy : UInt32, pvBytes : UInt8*, numberOfBytesCopied : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_bytes_to.call(this, sourceOffsetInBytes, maxBytesToCopy, pvBytes, numberOfBytesCopied)
    end
    def get_stride(this : IBitmapData*, pStride : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stride.call(this, pStride)
    end
    def get_bitmap_description(this : IBitmapData*, pBitmapDescription : Win32cr::UI::Xaml::Diagnostics::BitmapDescription*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_bitmap_description.call(this, pBitmapDescription)
    end
    def get_source_bitmap_description(this : IBitmapData*, pBitmapDescription : Win32cr::UI::Xaml::Diagnostics::BitmapDescription*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_source_bitmap_description.call(this, pBitmapDescription)
    end

  end

  @[Extern]
  record IVisualTreeService2Vtbl,
    query_interface : Proc(IVisualTreeService2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IVisualTreeService2*, UInt32),
    release : Proc(IVisualTreeService2*, UInt32),
    advise_visual_tree_change : Proc(IVisualTreeService2*, Void*, Win32cr::Foundation::HRESULT),
    unadvise_visual_tree_change : Proc(IVisualTreeService2*, Void*, Win32cr::Foundation::HRESULT),
    get_enums : Proc(IVisualTreeService2*, UInt32*, Win32cr::UI::Xaml::Diagnostics::EnumType**, Win32cr::Foundation::HRESULT),
    create_instance : Proc(IVisualTreeService2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, UInt64*, Win32cr::Foundation::HRESULT),
    get_property_values_chain : Proc(IVisualTreeService2*, UInt64, UInt32*, Win32cr::UI::Xaml::Diagnostics::PropertyChainSource**, UInt32*, Win32cr::UI::Xaml::Diagnostics::PropertyChainValue**, Win32cr::Foundation::HRESULT),
    set_property : Proc(IVisualTreeService2*, UInt64, UInt64, UInt32, Win32cr::Foundation::HRESULT),
    clear_property : Proc(IVisualTreeService2*, UInt64, UInt32, Win32cr::Foundation::HRESULT),
    get_collection_count : Proc(IVisualTreeService2*, UInt64, UInt32*, Win32cr::Foundation::HRESULT),
    get_collection_elements : Proc(IVisualTreeService2*, UInt64, UInt32, UInt32*, Win32cr::UI::Xaml::Diagnostics::CollectionElementValue**, Win32cr::Foundation::HRESULT),
    add_child : Proc(IVisualTreeService2*, UInt64, UInt64, UInt32, Win32cr::Foundation::HRESULT),
    remove_child : Proc(IVisualTreeService2*, UInt64, UInt32, Win32cr::Foundation::HRESULT),
    clear_children : Proc(IVisualTreeService2*, UInt64, Win32cr::Foundation::HRESULT),
    get_property_index : Proc(IVisualTreeService2*, UInt64, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_property : Proc(IVisualTreeService2*, UInt64, UInt32, UInt64*, Win32cr::Foundation::HRESULT),
    replace_resource : Proc(IVisualTreeService2*, UInt64, UInt64, UInt64, Win32cr::Foundation::HRESULT),
    render_target_bitmap : Proc(IVisualTreeService2*, UInt64, Win32cr::UI::Xaml::Diagnostics::RenderTargetBitmapOptions, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IVisualTreeService2, lpVtbl : IVisualTreeService2Vtbl* do
    GUID = LibC::GUID.new(0x130f5136_u32, 0xec43_u16, 0x4f61_u16, StaticArray[0x89_u8, 0xc7_u8, 0x98_u8, 0x1_u8, 0xa3_u8, 0x6d_u8, 0x2e_u8, 0x95_u8])
    def query_interface(this : IVisualTreeService2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IVisualTreeService2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IVisualTreeService2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def advise_visual_tree_change(this : IVisualTreeService2*, pCallback : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.advise_visual_tree_change.call(this, pCallback)
    end
    def unadvise_visual_tree_change(this : IVisualTreeService2*, pCallback : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unadvise_visual_tree_change.call(this, pCallback)
    end
    def get_enums(this : IVisualTreeService2*, pCount : UInt32*, ppEnums : Win32cr::UI::Xaml::Diagnostics::EnumType**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enums.call(this, pCount, ppEnums)
    end
    def create_instance(this : IVisualTreeService2*, typeName : Win32cr::Foundation::BSTR, value : Win32cr::Foundation::BSTR, pInstanceHandle : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_instance.call(this, typeName, value, pInstanceHandle)
    end
    def get_property_values_chain(this : IVisualTreeService2*, instanceHandle : UInt64, pSourceCount : UInt32*, ppPropertySources : Win32cr::UI::Xaml::Diagnostics::PropertyChainSource**, pPropertyCount : UInt32*, ppPropertyValues : Win32cr::UI::Xaml::Diagnostics::PropertyChainValue**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_values_chain.call(this, instanceHandle, pSourceCount, ppPropertySources, pPropertyCount, ppPropertyValues)
    end
    def set_property(this : IVisualTreeService2*, instanceHandle : UInt64, value : UInt64, propertyIndex : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, instanceHandle, value, propertyIndex)
    end
    def clear_property(this : IVisualTreeService2*, instanceHandle : UInt64, propertyIndex : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear_property.call(this, instanceHandle, propertyIndex)
    end
    def get_collection_count(this : IVisualTreeService2*, instanceHandle : UInt64, pCollectionSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_collection_count.call(this, instanceHandle, pCollectionSize)
    end
    def get_collection_elements(this : IVisualTreeService2*, instanceHandle : UInt64, startIndex : UInt32, pElementCount : UInt32*, ppElementValues : Win32cr::UI::Xaml::Diagnostics::CollectionElementValue**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_collection_elements.call(this, instanceHandle, startIndex, pElementCount, ppElementValues)
    end
    def add_child(this : IVisualTreeService2*, parent : UInt64, child : UInt64, index : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_child.call(this, parent, child, index)
    end
    def remove_child(this : IVisualTreeService2*, parent : UInt64, index : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_child.call(this, parent, index)
    end
    def clear_children(this : IVisualTreeService2*, parent : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear_children.call(this, parent)
    end
    def get_property_index(this : IVisualTreeService2*, object : UInt64, propertyName : Win32cr::Foundation::PWSTR, pPropertyIndex : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_index.call(this, object, propertyName, pPropertyIndex)
    end
    def get_property(this : IVisualTreeService2*, object : UInt64, propertyIndex : UInt32, pValue : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, object, propertyIndex, pValue)
    end
    def replace_resource(this : IVisualTreeService2*, resourceDictionary : UInt64, key : UInt64, newValue : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.replace_resource.call(this, resourceDictionary, key, newValue)
    end
    def render_target_bitmap(this : IVisualTreeService2*, handle : UInt64, options : Win32cr::UI::Xaml::Diagnostics::RenderTargetBitmapOptions, maxPixelWidth : UInt32, maxPixelHeight : UInt32, ppBitmapData : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.render_target_bitmap.call(this, handle, options, maxPixelWidth, maxPixelHeight, ppBitmapData)
    end

  end

  @[Extern]
  record IVisualTreeService3Vtbl,
    query_interface : Proc(IVisualTreeService3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IVisualTreeService3*, UInt32),
    release : Proc(IVisualTreeService3*, UInt32),
    advise_visual_tree_change : Proc(IVisualTreeService3*, Void*, Win32cr::Foundation::HRESULT),
    unadvise_visual_tree_change : Proc(IVisualTreeService3*, Void*, Win32cr::Foundation::HRESULT),
    get_enums : Proc(IVisualTreeService3*, UInt32*, Win32cr::UI::Xaml::Diagnostics::EnumType**, Win32cr::Foundation::HRESULT),
    create_instance : Proc(IVisualTreeService3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, UInt64*, Win32cr::Foundation::HRESULT),
    get_property_values_chain : Proc(IVisualTreeService3*, UInt64, UInt32*, Win32cr::UI::Xaml::Diagnostics::PropertyChainSource**, UInt32*, Win32cr::UI::Xaml::Diagnostics::PropertyChainValue**, Win32cr::Foundation::HRESULT),
    set_property : Proc(IVisualTreeService3*, UInt64, UInt64, UInt32, Win32cr::Foundation::HRESULT),
    clear_property : Proc(IVisualTreeService3*, UInt64, UInt32, Win32cr::Foundation::HRESULT),
    get_collection_count : Proc(IVisualTreeService3*, UInt64, UInt32*, Win32cr::Foundation::HRESULT),
    get_collection_elements : Proc(IVisualTreeService3*, UInt64, UInt32, UInt32*, Win32cr::UI::Xaml::Diagnostics::CollectionElementValue**, Win32cr::Foundation::HRESULT),
    add_child : Proc(IVisualTreeService3*, UInt64, UInt64, UInt32, Win32cr::Foundation::HRESULT),
    remove_child : Proc(IVisualTreeService3*, UInt64, UInt32, Win32cr::Foundation::HRESULT),
    clear_children : Proc(IVisualTreeService3*, UInt64, Win32cr::Foundation::HRESULT),
    get_property_index : Proc(IVisualTreeService3*, UInt64, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_property : Proc(IVisualTreeService3*, UInt64, UInt32, UInt64*, Win32cr::Foundation::HRESULT),
    replace_resource : Proc(IVisualTreeService3*, UInt64, UInt64, UInt64, Win32cr::Foundation::HRESULT),
    render_target_bitmap : Proc(IVisualTreeService3*, UInt64, Win32cr::UI::Xaml::Diagnostics::RenderTargetBitmapOptions, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    resolve_resource : Proc(IVisualTreeService3*, UInt64, Win32cr::Foundation::PWSTR, Win32cr::UI::Xaml::Diagnostics::ResourceType, UInt32, Win32cr::Foundation::HRESULT),
    get_dictionary_item : Proc(IVisualTreeService3*, UInt64, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, UInt64*, Win32cr::Foundation::HRESULT),
    add_dictionary_item : Proc(IVisualTreeService3*, UInt64, UInt64, UInt64, Win32cr::Foundation::HRESULT),
    remove_dictionary_item : Proc(IVisualTreeService3*, UInt64, UInt64, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IVisualTreeService3, lpVtbl : IVisualTreeService3Vtbl* do
    GUID = LibC::GUID.new(0xe79c6e0_u32, 0x85a0_u16, 0x4be8_u16, StaticArray[0xb4_u8, 0x1a_u8, 0x65_u8, 0x5c_u8, 0xf1_u8, 0xfd_u8, 0x19_u8, 0xbd_u8])
    def query_interface(this : IVisualTreeService3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IVisualTreeService3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IVisualTreeService3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def advise_visual_tree_change(this : IVisualTreeService3*, pCallback : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.advise_visual_tree_change.call(this, pCallback)
    end
    def unadvise_visual_tree_change(this : IVisualTreeService3*, pCallback : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unadvise_visual_tree_change.call(this, pCallback)
    end
    def get_enums(this : IVisualTreeService3*, pCount : UInt32*, ppEnums : Win32cr::UI::Xaml::Diagnostics::EnumType**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enums.call(this, pCount, ppEnums)
    end
    def create_instance(this : IVisualTreeService3*, typeName : Win32cr::Foundation::BSTR, value : Win32cr::Foundation::BSTR, pInstanceHandle : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_instance.call(this, typeName, value, pInstanceHandle)
    end
    def get_property_values_chain(this : IVisualTreeService3*, instanceHandle : UInt64, pSourceCount : UInt32*, ppPropertySources : Win32cr::UI::Xaml::Diagnostics::PropertyChainSource**, pPropertyCount : UInt32*, ppPropertyValues : Win32cr::UI::Xaml::Diagnostics::PropertyChainValue**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_values_chain.call(this, instanceHandle, pSourceCount, ppPropertySources, pPropertyCount, ppPropertyValues)
    end
    def set_property(this : IVisualTreeService3*, instanceHandle : UInt64, value : UInt64, propertyIndex : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, instanceHandle, value, propertyIndex)
    end
    def clear_property(this : IVisualTreeService3*, instanceHandle : UInt64, propertyIndex : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear_property.call(this, instanceHandle, propertyIndex)
    end
    def get_collection_count(this : IVisualTreeService3*, instanceHandle : UInt64, pCollectionSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_collection_count.call(this, instanceHandle, pCollectionSize)
    end
    def get_collection_elements(this : IVisualTreeService3*, instanceHandle : UInt64, startIndex : UInt32, pElementCount : UInt32*, ppElementValues : Win32cr::UI::Xaml::Diagnostics::CollectionElementValue**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_collection_elements.call(this, instanceHandle, startIndex, pElementCount, ppElementValues)
    end
    def add_child(this : IVisualTreeService3*, parent : UInt64, child : UInt64, index : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_child.call(this, parent, child, index)
    end
    def remove_child(this : IVisualTreeService3*, parent : UInt64, index : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_child.call(this, parent, index)
    end
    def clear_children(this : IVisualTreeService3*, parent : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear_children.call(this, parent)
    end
    def get_property_index(this : IVisualTreeService3*, object : UInt64, propertyName : Win32cr::Foundation::PWSTR, pPropertyIndex : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_index.call(this, object, propertyName, pPropertyIndex)
    end
    def get_property(this : IVisualTreeService3*, object : UInt64, propertyIndex : UInt32, pValue : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, object, propertyIndex, pValue)
    end
    def replace_resource(this : IVisualTreeService3*, resourceDictionary : UInt64, key : UInt64, newValue : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.replace_resource.call(this, resourceDictionary, key, newValue)
    end
    def render_target_bitmap(this : IVisualTreeService3*, handle : UInt64, options : Win32cr::UI::Xaml::Diagnostics::RenderTargetBitmapOptions, maxPixelWidth : UInt32, maxPixelHeight : UInt32, ppBitmapData : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.render_target_bitmap.call(this, handle, options, maxPixelWidth, maxPixelHeight, ppBitmapData)
    end
    def resolve_resource(this : IVisualTreeService3*, resourceContext : UInt64, resourceName : Win32cr::Foundation::PWSTR, resourceType : Win32cr::UI::Xaml::Diagnostics::ResourceType, propertyIndex : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resolve_resource.call(this, resourceContext, resourceName, resourceType, propertyIndex)
    end
    def get_dictionary_item(this : IVisualTreeService3*, dictionaryHandle : UInt64, resourceName : Win32cr::Foundation::PWSTR, resourceIsImplicitStyle : Win32cr::Foundation::BOOL, resourceHandle : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dictionary_item.call(this, dictionaryHandle, resourceName, resourceIsImplicitStyle, resourceHandle)
    end
    def add_dictionary_item(this : IVisualTreeService3*, dictionaryHandle : UInt64, resourceKey : UInt64, resourceHandle : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_dictionary_item.call(this, dictionaryHandle, resourceKey, resourceHandle)
    end
    def remove_dictionary_item(this : IVisualTreeService3*, dictionaryHandle : UInt64, resourceKey : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_dictionary_item.call(this, dictionaryHandle, resourceKey)
    end

  end

  def initializeXamlDiagnostic(endPointName : Win32cr::Foundation::PWSTR, pid : UInt32, wszDllXamlDiagnostics : Win32cr::Foundation::PWSTR, wszTAPDllName : Win32cr::Foundation::PWSTR, tapClsid : LibC::GUID) : Win32cr::Foundation::HRESULT
    C.InitializeXamlDiagnostic(endPointName, pid, wszDllXamlDiagnostics, wszTAPDllName, tapClsid)
  end

  def initializeXamlDiagnosticsEx(endPointName : Win32cr::Foundation::PWSTR, pid : UInt32, wszDllXamlDiagnostics : Win32cr::Foundation::PWSTR, wszTAPDllName : Win32cr::Foundation::PWSTR, tapClsid : LibC::GUID, wszInitializationData : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.InitializeXamlDiagnosticsEx(endPointName, pid, wszDllXamlDiagnostics, wszTAPDllName, tapClsid, wszInitializationData)
  end

  @[Link("windows.ui.xaml")]
  lib C
    # :nodoc:
    fun InitializeXamlDiagnostic(endPointName : Win32cr::Foundation::PWSTR, pid : UInt32, wszDllXamlDiagnostics : Win32cr::Foundation::PWSTR, wszTAPDllName : Win32cr::Foundation::PWSTR, tapClsid : LibC::GUID) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun InitializeXamlDiagnosticsEx(endPointName : Win32cr::Foundation::PWSTR, pid : UInt32, wszDllXamlDiagnostics : Win32cr::Foundation::PWSTR, wszTAPDllName : Win32cr::Foundation::PWSTR, tapClsid : LibC::GUID, wszInitializationData : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

  end
end