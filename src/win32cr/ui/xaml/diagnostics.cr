require "../../foundation.cr"
require "../../system/com.cr"
require "../../graphics/dxgi/common.cr"
require "../../system/winrt.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:windows.ui.xaml.dll")]
{% else %}
@[Link("windows.ui.xaml")]
{% end %}
lib LibWin32
  E_UNKNOWNTYPE = -2144665560_i32


  enum VisualMutationType : Int32
    Add = 0
    Remove = 1
  end

  enum BaseValueSource : Int32
    BaseValueSourceUnknown = 0
    BaseValueSourceDefault = 1
    BaseValueSourceBuiltInStyle = 2
    BaseValueSourceStyle = 3
    BaseValueSourceLocal = 4
    Inherited = 5
    DefaultStyleTrigger = 6
    TemplateTrigger = 7
    StyleTrigger = 8
    ImplicitStyleReference = 9
    ParentTemplate = 10
    ParentTemplateTrigger = 11
    Animation = 12
    Coercion = 13
    BaseValueSourceVisualState = 14
  end

  enum MetadataBit : Int32
    None = 0
    IsValueHandle = 1
    IsPropertyReadOnly = 2
    IsValueCollection = 4
    IsValueCollectionReadOnly = 8
    IsValueBindingExpression = 16
    IsValueNull = 32
    IsValueHandleAndEvaluatedValue = 64
  end

  enum RenderTargetBitmapOptions : Int32
    RenderTarget = 0
    RenderTargetAndChildren = 1
  end

  enum ResourceType : Int32
    ResourceTypeStatic = 0
    ResourceTypeTheme = 1
  end

  enum VisualElementState : Int32
    ErrorResolved = 0
    ErrorResourceNotFound = 1
    ErrorInvalidResource = 2
  end

  struct SourceInfo
    file_name : UInt8*
    line_number : UInt32
    column_number : UInt32
    char_position : UInt32
    hash : UInt8*
  end
  struct ParentChildRelation
    parent : UInt64
    child : UInt64
    child_index : UInt32
  end
  struct VisualElement
    handle : UInt64
    src_info : SourceInfo
    type : UInt8*
    name : UInt8*
    num_children : UInt32
  end
  struct PropertyChainSource
    handle : UInt64
    target_type : UInt8*
    name : UInt8*
    source : BaseValueSource
    src_info : SourceInfo
  end
  struct PropertyChainValue
    index : UInt32
    type : UInt8*
    declaring_type : UInt8*
    value_type : UInt8*
    item_type : UInt8*
    value : UInt8*
    overridden : LibC::BOOL
    metadata_bits : Int64
    property_name : UInt8*
    property_chain_index : UInt32
  end
  struct EnumType
    name : UInt8*
    value_ints : SAFEARRAY*
    value_strings : SAFEARRAY*
  end
  struct CollectionElementValue
    index : UInt32
    value_type : UInt8*
    value : UInt8*
    metadata_bits : Int64
  end
  struct BitmapDescription
    width : UInt32
    height : UInt32
    format : DXGI_FORMAT
    alpha_mode : DXGI_ALPHA_MODE
  end


  struct IVisualTreeServiceCallbackVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_visual_tree_change : UInt64
  end

  IVisualTreeServiceCallback_GUID = "aa7a8931-80e4-4fec-8f3b-553f87b4966e"
  IID_IVisualTreeServiceCallback = LibC::GUID.new(0xaa7a8931_u32, 0x80e4_u16, 0x4fec_u16, StaticArray[0x8f_u8, 0x3b_u8, 0x55_u8, 0x3f_u8, 0x87_u8, 0xb4_u8, 0x96_u8, 0x6e_u8])
  struct IVisualTreeServiceCallback
    lpVtbl : IVisualTreeServiceCallbackVTbl*
  end

  struct IVisualTreeServiceCallback2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_visual_tree_change : UInt64
    on_element_state_changed : UInt64
  end

  IVisualTreeServiceCallback2_GUID = "bad9eb88-ae77-4397-b948-5fa2db0a19ea"
  IID_IVisualTreeServiceCallback2 = LibC::GUID.new(0xbad9eb88_u32, 0xae77_u16, 0x4397_u16, StaticArray[0xb9_u8, 0x48_u8, 0x5f_u8, 0xa2_u8, 0xdb_u8, 0xa_u8, 0x19_u8, 0xea_u8])
  struct IVisualTreeServiceCallback2
    lpVtbl : IVisualTreeServiceCallback2VTbl*
  end

  struct IVisualTreeServiceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    advise_visual_tree_change : UInt64
    unadvise_visual_tree_change : UInt64
    get_enums : UInt64
    create_instance : UInt64
    get_property_values_chain : UInt64
    set_property : UInt64
    clear_property : UInt64
    get_collection_count : UInt64
    get_collection_elements : UInt64
    add_child : UInt64
    remove_child : UInt64
    clear_children : UInt64
  end

  IVisualTreeService_GUID = "a593b11a-d17f-48bb-8f66-83910731c8a5"
  IID_IVisualTreeService = LibC::GUID.new(0xa593b11a_u32, 0xd17f_u16, 0x48bb_u16, StaticArray[0x8f_u8, 0x66_u8, 0x83_u8, 0x91_u8, 0x7_u8, 0x31_u8, 0xc8_u8, 0xa5_u8])
  struct IVisualTreeService
    lpVtbl : IVisualTreeServiceVTbl*
  end

  struct IXamlDiagnosticsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_dispatcher : UInt64
    get_ui_layer : UInt64
    get_application : UInt64
    get_i_inspectable_from_handle : UInt64
    get_handle_from_i_inspectable : UInt64
    hit_test : UInt64
    register_instance : UInt64
    get_initialization_data : UInt64
  end

  IXamlDiagnostics_GUID = "18c9e2b6-3f43-4116-9f2b-ff935d7770d2"
  IID_IXamlDiagnostics = LibC::GUID.new(0x18c9e2b6_u32, 0x3f43_u16, 0x4116_u16, StaticArray[0x9f_u8, 0x2b_u8, 0xff_u8, 0x93_u8, 0x5d_u8, 0x77_u8, 0x70_u8, 0xd2_u8])
  struct IXamlDiagnostics
    lpVtbl : IXamlDiagnosticsVTbl*
  end

  struct IBitmapDataVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    copy_bytes_to : UInt64
    get_stride : UInt64
    get_bitmap_description : UInt64
    get_source_bitmap_description : UInt64
  end

  IBitmapData_GUID = "d1a34ef2-cad8-4635-a3d2-fcda8d3f3caf"
  IID_IBitmapData = LibC::GUID.new(0xd1a34ef2_u32, 0xcad8_u16, 0x4635_u16, StaticArray[0xa3_u8, 0xd2_u8, 0xfc_u8, 0xda_u8, 0x8d_u8, 0x3f_u8, 0x3c_u8, 0xaf_u8])
  struct IBitmapData
    lpVtbl : IBitmapDataVTbl*
  end

  struct IVisualTreeService2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    advise_visual_tree_change : UInt64
    unadvise_visual_tree_change : UInt64
    get_enums : UInt64
    create_instance : UInt64
    get_property_values_chain : UInt64
    set_property : UInt64
    clear_property : UInt64
    get_collection_count : UInt64
    get_collection_elements : UInt64
    add_child : UInt64
    remove_child : UInt64
    clear_children : UInt64
    get_property_index : UInt64
    get_property : UInt64
    replace_resource : UInt64
    render_target_bitmap : UInt64
  end

  IVisualTreeService2_GUID = "130f5136-ec43-4f61-89c7-9801a36d2e95"
  IID_IVisualTreeService2 = LibC::GUID.new(0x130f5136_u32, 0xec43_u16, 0x4f61_u16, StaticArray[0x89_u8, 0xc7_u8, 0x98_u8, 0x1_u8, 0xa3_u8, 0x6d_u8, 0x2e_u8, 0x95_u8])
  struct IVisualTreeService2
    lpVtbl : IVisualTreeService2VTbl*
  end

  struct IVisualTreeService3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    advise_visual_tree_change : UInt64
    unadvise_visual_tree_change : UInt64
    get_enums : UInt64
    create_instance : UInt64
    get_property_values_chain : UInt64
    set_property : UInt64
    clear_property : UInt64
    get_collection_count : UInt64
    get_collection_elements : UInt64
    add_child : UInt64
    remove_child : UInt64
    clear_children : UInt64
    get_property_index : UInt64
    get_property : UInt64
    replace_resource : UInt64
    render_target_bitmap : UInt64
    resolve_resource : UInt64
    get_dictionary_item : UInt64
    add_dictionary_item : UInt64
    remove_dictionary_item : UInt64
  end

  IVisualTreeService3_GUID = "0e79c6e0-85a0-4be8-b41a-655cf1fd19bd"
  IID_IVisualTreeService3 = LibC::GUID.new(0xe79c6e0_u32, 0x85a0_u16, 0x4be8_u16, StaticArray[0xb4_u8, 0x1a_u8, 0x65_u8, 0x5c_u8, 0xf1_u8, 0xfd_u8, 0x19_u8, 0xbd_u8])
  struct IVisualTreeService3
    lpVtbl : IVisualTreeService3VTbl*
  end


  # Params # endpointname : LibC::LPWSTR [In],pid : UInt32 [In],wszdllxamldiagnostics : LibC::LPWSTR [In],wsztapdllname : LibC::LPWSTR [In],tapclsid : Guid [In]
  fun InitializeXamlDiagnostic(endpointname : LibC::LPWSTR, pid : UInt32, wszdllxamldiagnostics : LibC::LPWSTR, wsztapdllname : LibC::LPWSTR, tapclsid : Guid) : HRESULT

  # Params # endpointname : LibC::LPWSTR [In],pid : UInt32 [In],wszdllxamldiagnostics : LibC::LPWSTR [In],wsztapdllname : LibC::LPWSTR [In],tapclsid : Guid [In],wszinitializationdata : LibC::LPWSTR [In]
  fun InitializeXamlDiagnosticsEx(endpointname : LibC::LPWSTR, pid : UInt32, wszdllxamldiagnostics : LibC::LPWSTR, wsztapdllname : LibC::LPWSTR, tapclsid : Guid, wszinitializationdata : LibC::LPWSTR) : HRESULT
end
struct LibWin32::IVisualTreeServiceCallback
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_visual_tree_change(relation : ParentChildRelation, element : VisualElement, mutationtype : VisualMutationType) : HRESULT
    @lpVtbl.value.on_visual_tree_change.unsafe_as(Proc(ParentChildRelation, VisualElement, VisualMutationType, HRESULT)).call(relation, element, mutationtype)
  end
end
struct LibWin32::IVisualTreeServiceCallback2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_visual_tree_change(relation : ParentChildRelation, element : VisualElement, mutationtype : VisualMutationType) : HRESULT
    @lpVtbl.value.on_visual_tree_change.unsafe_as(Proc(ParentChildRelation, VisualElement, VisualMutationType, HRESULT)).call(relation, element, mutationtype)
  end
  def on_element_state_changed(element : UInt64, elementstate : VisualElementState, context : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.on_element_state_changed.unsafe_as(Proc(UInt64, VisualElementState, LibC::LPWSTR, HRESULT)).call(element, elementstate, context)
  end
end
struct LibWin32::IVisualTreeService
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def advise_visual_tree_change(pcallback : IVisualTreeServiceCallback) : HRESULT
    @lpVtbl.value.advise_visual_tree_change.unsafe_as(Proc(IVisualTreeServiceCallback, HRESULT)).call(pcallback)
  end
  def unadvise_visual_tree_change(pcallback : IVisualTreeServiceCallback) : HRESULT
    @lpVtbl.value.unadvise_visual_tree_change.unsafe_as(Proc(IVisualTreeServiceCallback, HRESULT)).call(pcallback)
  end
  def get_enums(pcount : UInt32*, ppenums : EnumType**) : HRESULT
    @lpVtbl.value.get_enums.unsafe_as(Proc(UInt32*, EnumType**, HRESULT)).call(pcount, ppenums)
  end
  def create_instance(typename : UInt8*, value : UInt8*, pinstancehandle : UInt64*) : HRESULT
    @lpVtbl.value.create_instance.unsafe_as(Proc(UInt8*, UInt8*, UInt64*, HRESULT)).call(typename, value, pinstancehandle)
  end
  def get_property_values_chain(instancehandle : UInt64, psourcecount : UInt32*, pppropertysources : PropertyChainSource**, ppropertycount : UInt32*, pppropertyvalues : PropertyChainValue**) : HRESULT
    @lpVtbl.value.get_property_values_chain.unsafe_as(Proc(UInt64, UInt32*, PropertyChainSource**, UInt32*, PropertyChainValue**, HRESULT)).call(instancehandle, psourcecount, pppropertysources, ppropertycount, pppropertyvalues)
  end
  def set_property(instancehandle : UInt64, value : UInt64, propertyindex : UInt32) : HRESULT
    @lpVtbl.value.set_property.unsafe_as(Proc(UInt64, UInt64, UInt32, HRESULT)).call(instancehandle, value, propertyindex)
  end
  def clear_property(instancehandle : UInt64, propertyindex : UInt32) : HRESULT
    @lpVtbl.value.clear_property.unsafe_as(Proc(UInt64, UInt32, HRESULT)).call(instancehandle, propertyindex)
  end
  def get_collection_count(instancehandle : UInt64, pcollectionsize : UInt32*) : HRESULT
    @lpVtbl.value.get_collection_count.unsafe_as(Proc(UInt64, UInt32*, HRESULT)).call(instancehandle, pcollectionsize)
  end
  def get_collection_elements(instancehandle : UInt64, startindex : UInt32, pelementcount : UInt32*, ppelementvalues : CollectionElementValue**) : HRESULT
    @lpVtbl.value.get_collection_elements.unsafe_as(Proc(UInt64, UInt32, UInt32*, CollectionElementValue**, HRESULT)).call(instancehandle, startindex, pelementcount, ppelementvalues)
  end
  def add_child(parent : UInt64, child : UInt64, index : UInt32) : HRESULT
    @lpVtbl.value.add_child.unsafe_as(Proc(UInt64, UInt64, UInt32, HRESULT)).call(parent, child, index)
  end
  def remove_child(parent : UInt64, index : UInt32) : HRESULT
    @lpVtbl.value.remove_child.unsafe_as(Proc(UInt64, UInt32, HRESULT)).call(parent, index)
  end
  def clear_children(parent : UInt64) : HRESULT
    @lpVtbl.value.clear_children.unsafe_as(Proc(UInt64, HRESULT)).call(parent)
  end
end
struct LibWin32::IXamlDiagnostics
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_dispatcher(ppdispatcher : IInspectable*) : HRESULT
    @lpVtbl.value.get_dispatcher.unsafe_as(Proc(IInspectable*, HRESULT)).call(ppdispatcher)
  end
  def get_ui_layer(pplayer : IInspectable*) : HRESULT
    @lpVtbl.value.get_ui_layer.unsafe_as(Proc(IInspectable*, HRESULT)).call(pplayer)
  end
  def get_application(ppapplication : IInspectable*) : HRESULT
    @lpVtbl.value.get_application.unsafe_as(Proc(IInspectable*, HRESULT)).call(ppapplication)
  end
  def get_i_inspectable_from_handle(instancehandle : UInt64, ppinstance : IInspectable*) : HRESULT
    @lpVtbl.value.get_i_inspectable_from_handle.unsafe_as(Proc(UInt64, IInspectable*, HRESULT)).call(instancehandle, ppinstance)
  end
  def get_handle_from_i_inspectable(pinstance : IInspectable, phandle : UInt64*) : HRESULT
    @lpVtbl.value.get_handle_from_i_inspectable.unsafe_as(Proc(IInspectable, UInt64*, HRESULT)).call(pinstance, phandle)
  end
  def hit_test(rect : RECT, pcount : UInt32*, ppinstancehandles : UInt64**) : HRESULT
    @lpVtbl.value.hit_test.unsafe_as(Proc(RECT, UInt32*, UInt64**, HRESULT)).call(rect, pcount, ppinstancehandles)
  end
  def register_instance(pinstance : IInspectable, pinstancehandle : UInt64*) : HRESULT
    @lpVtbl.value.register_instance.unsafe_as(Proc(IInspectable, UInt64*, HRESULT)).call(pinstance, pinstancehandle)
  end
  def get_initialization_data(pinitializationdata : UInt8**) : HRESULT
    @lpVtbl.value.get_initialization_data.unsafe_as(Proc(UInt8**, HRESULT)).call(pinitializationdata)
  end
end
struct LibWin32::IBitmapData
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def copy_bytes_to(sourceoffsetinbytes : UInt32, maxbytestocopy : UInt32, pvbytes : UInt8*, numberofbytescopied : UInt32*) : HRESULT
    @lpVtbl.value.copy_bytes_to.unsafe_as(Proc(UInt32, UInt32, UInt8*, UInt32*, HRESULT)).call(sourceoffsetinbytes, maxbytestocopy, pvbytes, numberofbytescopied)
  end
  def get_stride(pstride : UInt32*) : HRESULT
    @lpVtbl.value.get_stride.unsafe_as(Proc(UInt32*, HRESULT)).call(pstride)
  end
  def get_bitmap_description(pbitmapdescription : BitmapDescription*) : HRESULT
    @lpVtbl.value.get_bitmap_description.unsafe_as(Proc(BitmapDescription*, HRESULT)).call(pbitmapdescription)
  end
  def get_source_bitmap_description(pbitmapdescription : BitmapDescription*) : HRESULT
    @lpVtbl.value.get_source_bitmap_description.unsafe_as(Proc(BitmapDescription*, HRESULT)).call(pbitmapdescription)
  end
end
struct LibWin32::IVisualTreeService2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def advise_visual_tree_change(pcallback : IVisualTreeServiceCallback) : HRESULT
    @lpVtbl.value.advise_visual_tree_change.unsafe_as(Proc(IVisualTreeServiceCallback, HRESULT)).call(pcallback)
  end
  def unadvise_visual_tree_change(pcallback : IVisualTreeServiceCallback) : HRESULT
    @lpVtbl.value.unadvise_visual_tree_change.unsafe_as(Proc(IVisualTreeServiceCallback, HRESULT)).call(pcallback)
  end
  def get_enums(pcount : UInt32*, ppenums : EnumType**) : HRESULT
    @lpVtbl.value.get_enums.unsafe_as(Proc(UInt32*, EnumType**, HRESULT)).call(pcount, ppenums)
  end
  def create_instance(typename : UInt8*, value : UInt8*, pinstancehandle : UInt64*) : HRESULT
    @lpVtbl.value.create_instance.unsafe_as(Proc(UInt8*, UInt8*, UInt64*, HRESULT)).call(typename, value, pinstancehandle)
  end
  def get_property_values_chain(instancehandle : UInt64, psourcecount : UInt32*, pppropertysources : PropertyChainSource**, ppropertycount : UInt32*, pppropertyvalues : PropertyChainValue**) : HRESULT
    @lpVtbl.value.get_property_values_chain.unsafe_as(Proc(UInt64, UInt32*, PropertyChainSource**, UInt32*, PropertyChainValue**, HRESULT)).call(instancehandle, psourcecount, pppropertysources, ppropertycount, pppropertyvalues)
  end
  def set_property(instancehandle : UInt64, value : UInt64, propertyindex : UInt32) : HRESULT
    @lpVtbl.value.set_property.unsafe_as(Proc(UInt64, UInt64, UInt32, HRESULT)).call(instancehandle, value, propertyindex)
  end
  def clear_property(instancehandle : UInt64, propertyindex : UInt32) : HRESULT
    @lpVtbl.value.clear_property.unsafe_as(Proc(UInt64, UInt32, HRESULT)).call(instancehandle, propertyindex)
  end
  def get_collection_count(instancehandle : UInt64, pcollectionsize : UInt32*) : HRESULT
    @lpVtbl.value.get_collection_count.unsafe_as(Proc(UInt64, UInt32*, HRESULT)).call(instancehandle, pcollectionsize)
  end
  def get_collection_elements(instancehandle : UInt64, startindex : UInt32, pelementcount : UInt32*, ppelementvalues : CollectionElementValue**) : HRESULT
    @lpVtbl.value.get_collection_elements.unsafe_as(Proc(UInt64, UInt32, UInt32*, CollectionElementValue**, HRESULT)).call(instancehandle, startindex, pelementcount, ppelementvalues)
  end
  def add_child(parent : UInt64, child : UInt64, index : UInt32) : HRESULT
    @lpVtbl.value.add_child.unsafe_as(Proc(UInt64, UInt64, UInt32, HRESULT)).call(parent, child, index)
  end
  def remove_child(parent : UInt64, index : UInt32) : HRESULT
    @lpVtbl.value.remove_child.unsafe_as(Proc(UInt64, UInt32, HRESULT)).call(parent, index)
  end
  def clear_children(parent : UInt64) : HRESULT
    @lpVtbl.value.clear_children.unsafe_as(Proc(UInt64, HRESULT)).call(parent)
  end
  def get_property_index(object : UInt64, propertyname : LibC::LPWSTR, ppropertyindex : UInt32*) : HRESULT
    @lpVtbl.value.get_property_index.unsafe_as(Proc(UInt64, LibC::LPWSTR, UInt32*, HRESULT)).call(object, propertyname, ppropertyindex)
  end
  def get_property(object : UInt64, propertyindex : UInt32, pvalue : UInt64*) : HRESULT
    @lpVtbl.value.get_property.unsafe_as(Proc(UInt64, UInt32, UInt64*, HRESULT)).call(object, propertyindex, pvalue)
  end
  def replace_resource(resourcedictionary : UInt64, key : UInt64, newvalue : UInt64) : HRESULT
    @lpVtbl.value.replace_resource.unsafe_as(Proc(UInt64, UInt64, UInt64, HRESULT)).call(resourcedictionary, key, newvalue)
  end
  def render_target_bitmap(handle : UInt64, options : RenderTargetBitmapOptions, maxpixelwidth : UInt32, maxpixelheight : UInt32, ppbitmapdata : IBitmapData*) : HRESULT
    @lpVtbl.value.render_target_bitmap.unsafe_as(Proc(UInt64, RenderTargetBitmapOptions, UInt32, UInt32, IBitmapData*, HRESULT)).call(handle, options, maxpixelwidth, maxpixelheight, ppbitmapdata)
  end
end
struct LibWin32::IVisualTreeService3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def advise_visual_tree_change(pcallback : IVisualTreeServiceCallback) : HRESULT
    @lpVtbl.value.advise_visual_tree_change.unsafe_as(Proc(IVisualTreeServiceCallback, HRESULT)).call(pcallback)
  end
  def unadvise_visual_tree_change(pcallback : IVisualTreeServiceCallback) : HRESULT
    @lpVtbl.value.unadvise_visual_tree_change.unsafe_as(Proc(IVisualTreeServiceCallback, HRESULT)).call(pcallback)
  end
  def get_enums(pcount : UInt32*, ppenums : EnumType**) : HRESULT
    @lpVtbl.value.get_enums.unsafe_as(Proc(UInt32*, EnumType**, HRESULT)).call(pcount, ppenums)
  end
  def create_instance(typename : UInt8*, value : UInt8*, pinstancehandle : UInt64*) : HRESULT
    @lpVtbl.value.create_instance.unsafe_as(Proc(UInt8*, UInt8*, UInt64*, HRESULT)).call(typename, value, pinstancehandle)
  end
  def get_property_values_chain(instancehandle : UInt64, psourcecount : UInt32*, pppropertysources : PropertyChainSource**, ppropertycount : UInt32*, pppropertyvalues : PropertyChainValue**) : HRESULT
    @lpVtbl.value.get_property_values_chain.unsafe_as(Proc(UInt64, UInt32*, PropertyChainSource**, UInt32*, PropertyChainValue**, HRESULT)).call(instancehandle, psourcecount, pppropertysources, ppropertycount, pppropertyvalues)
  end
  def set_property(instancehandle : UInt64, value : UInt64, propertyindex : UInt32) : HRESULT
    @lpVtbl.value.set_property.unsafe_as(Proc(UInt64, UInt64, UInt32, HRESULT)).call(instancehandle, value, propertyindex)
  end
  def clear_property(instancehandle : UInt64, propertyindex : UInt32) : HRESULT
    @lpVtbl.value.clear_property.unsafe_as(Proc(UInt64, UInt32, HRESULT)).call(instancehandle, propertyindex)
  end
  def get_collection_count(instancehandle : UInt64, pcollectionsize : UInt32*) : HRESULT
    @lpVtbl.value.get_collection_count.unsafe_as(Proc(UInt64, UInt32*, HRESULT)).call(instancehandle, pcollectionsize)
  end
  def get_collection_elements(instancehandle : UInt64, startindex : UInt32, pelementcount : UInt32*, ppelementvalues : CollectionElementValue**) : HRESULT
    @lpVtbl.value.get_collection_elements.unsafe_as(Proc(UInt64, UInt32, UInt32*, CollectionElementValue**, HRESULT)).call(instancehandle, startindex, pelementcount, ppelementvalues)
  end
  def add_child(parent : UInt64, child : UInt64, index : UInt32) : HRESULT
    @lpVtbl.value.add_child.unsafe_as(Proc(UInt64, UInt64, UInt32, HRESULT)).call(parent, child, index)
  end
  def remove_child(parent : UInt64, index : UInt32) : HRESULT
    @lpVtbl.value.remove_child.unsafe_as(Proc(UInt64, UInt32, HRESULT)).call(parent, index)
  end
  def clear_children(parent : UInt64) : HRESULT
    @lpVtbl.value.clear_children.unsafe_as(Proc(UInt64, HRESULT)).call(parent)
  end
  def get_property_index(object : UInt64, propertyname : LibC::LPWSTR, ppropertyindex : UInt32*) : HRESULT
    @lpVtbl.value.get_property_index.unsafe_as(Proc(UInt64, LibC::LPWSTR, UInt32*, HRESULT)).call(object, propertyname, ppropertyindex)
  end
  def get_property(object : UInt64, propertyindex : UInt32, pvalue : UInt64*) : HRESULT
    @lpVtbl.value.get_property.unsafe_as(Proc(UInt64, UInt32, UInt64*, HRESULT)).call(object, propertyindex, pvalue)
  end
  def replace_resource(resourcedictionary : UInt64, key : UInt64, newvalue : UInt64) : HRESULT
    @lpVtbl.value.replace_resource.unsafe_as(Proc(UInt64, UInt64, UInt64, HRESULT)).call(resourcedictionary, key, newvalue)
  end
  def render_target_bitmap(handle : UInt64, options : RenderTargetBitmapOptions, maxpixelwidth : UInt32, maxpixelheight : UInt32, ppbitmapdata : IBitmapData*) : HRESULT
    @lpVtbl.value.render_target_bitmap.unsafe_as(Proc(UInt64, RenderTargetBitmapOptions, UInt32, UInt32, IBitmapData*, HRESULT)).call(handle, options, maxpixelwidth, maxpixelheight, ppbitmapdata)
  end
  def resolve_resource(resourcecontext : UInt64, resourcename : LibC::LPWSTR, resourcetype : ResourceType, propertyindex : UInt32) : HRESULT
    @lpVtbl.value.resolve_resource.unsafe_as(Proc(UInt64, LibC::LPWSTR, ResourceType, UInt32, HRESULT)).call(resourcecontext, resourcename, resourcetype, propertyindex)
  end
  def get_dictionary_item(dictionaryhandle : UInt64, resourcename : LibC::LPWSTR, resourceisimplicitstyle : LibC::BOOL, resourcehandle : UInt64*) : HRESULT
    @lpVtbl.value.get_dictionary_item.unsafe_as(Proc(UInt64, LibC::LPWSTR, LibC::BOOL, UInt64*, HRESULT)).call(dictionaryhandle, resourcename, resourceisimplicitstyle, resourcehandle)
  end
  def add_dictionary_item(dictionaryhandle : UInt64, resourcekey : UInt64, resourcehandle : UInt64) : HRESULT
    @lpVtbl.value.add_dictionary_item.unsafe_as(Proc(UInt64, UInt64, UInt64, HRESULT)).call(dictionaryhandle, resourcekey, resourcehandle)
  end
  def remove_dictionary_item(dictionaryhandle : UInt64, resourcekey : UInt64) : HRESULT
    @lpVtbl.value.remove_dictionary_item.unsafe_as(Proc(UInt64, UInt64, HRESULT)).call(dictionaryhandle, resourcekey)
  end
end
