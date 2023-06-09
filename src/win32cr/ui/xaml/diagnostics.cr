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
    query_interface : Proc(IVisualTreeServiceCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVisualTreeServiceCallback*, UInt32)
    release : Proc(IVisualTreeServiceCallback*, UInt32)
    on_visual_tree_change : Proc(IVisualTreeServiceCallback*, ParentChildRelation, VisualElement, VisualMutationType, HRESULT)
  end

  IVisualTreeServiceCallback_GUID = "aa7a8931-80e4-4fec-8f3b-553f87b4966e"
  IID_IVisualTreeServiceCallback = LibC::GUID.new(0xaa7a8931_u32, 0x80e4_u16, 0x4fec_u16, StaticArray[0x8f_u8, 0x3b_u8, 0x55_u8, 0x3f_u8, 0x87_u8, 0xb4_u8, 0x96_u8, 0x6e_u8])
  struct IVisualTreeServiceCallback
    lpVtbl : IVisualTreeServiceCallbackVTbl*
  end

  struct IVisualTreeServiceCallback2VTbl
    query_interface : Proc(IVisualTreeServiceCallback2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVisualTreeServiceCallback2*, UInt32)
    release : Proc(IVisualTreeServiceCallback2*, UInt32)
    on_visual_tree_change : Proc(IVisualTreeServiceCallback2*, ParentChildRelation, VisualElement, VisualMutationType, HRESULT)
    on_element_state_changed : Proc(IVisualTreeServiceCallback2*, UInt64, VisualElementState, LibC::LPWSTR, HRESULT)
  end

  IVisualTreeServiceCallback2_GUID = "bad9eb88-ae77-4397-b948-5fa2db0a19ea"
  IID_IVisualTreeServiceCallback2 = LibC::GUID.new(0xbad9eb88_u32, 0xae77_u16, 0x4397_u16, StaticArray[0xb9_u8, 0x48_u8, 0x5f_u8, 0xa2_u8, 0xdb_u8, 0xa_u8, 0x19_u8, 0xea_u8])
  struct IVisualTreeServiceCallback2
    lpVtbl : IVisualTreeServiceCallback2VTbl*
  end

  struct IVisualTreeServiceVTbl
    query_interface : Proc(IVisualTreeService*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVisualTreeService*, UInt32)
    release : Proc(IVisualTreeService*, UInt32)
    advise_visual_tree_change : Proc(IVisualTreeService*, IVisualTreeServiceCallback, HRESULT)
    unadvise_visual_tree_change : Proc(IVisualTreeService*, IVisualTreeServiceCallback, HRESULT)
    get_enums : Proc(IVisualTreeService*, UInt32*, EnumType**, HRESULT)
    create_instance : Proc(IVisualTreeService*, UInt8*, UInt8*, UInt64*, HRESULT)
    get_property_values_chain : Proc(IVisualTreeService*, UInt64, UInt32*, PropertyChainSource**, UInt32*, PropertyChainValue**, HRESULT)
    set_property : Proc(IVisualTreeService*, UInt64, UInt64, UInt32, HRESULT)
    clear_property : Proc(IVisualTreeService*, UInt64, UInt32, HRESULT)
    get_collection_count : Proc(IVisualTreeService*, UInt64, UInt32*, HRESULT)
    get_collection_elements : Proc(IVisualTreeService*, UInt64, UInt32, UInt32*, CollectionElementValue**, HRESULT)
    add_child : Proc(IVisualTreeService*, UInt64, UInt64, UInt32, HRESULT)
    remove_child : Proc(IVisualTreeService*, UInt64, UInt32, HRESULT)
    clear_children : Proc(IVisualTreeService*, UInt64, HRESULT)
  end

  IVisualTreeService_GUID = "a593b11a-d17f-48bb-8f66-83910731c8a5"
  IID_IVisualTreeService = LibC::GUID.new(0xa593b11a_u32, 0xd17f_u16, 0x48bb_u16, StaticArray[0x8f_u8, 0x66_u8, 0x83_u8, 0x91_u8, 0x7_u8, 0x31_u8, 0xc8_u8, 0xa5_u8])
  struct IVisualTreeService
    lpVtbl : IVisualTreeServiceVTbl*
  end

  struct IXamlDiagnosticsVTbl
    query_interface : Proc(IXamlDiagnostics*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXamlDiagnostics*, UInt32)
    release : Proc(IXamlDiagnostics*, UInt32)
    get_dispatcher : Proc(IXamlDiagnostics*, IInspectable*, HRESULT)
    get_ui_layer : Proc(IXamlDiagnostics*, IInspectable*, HRESULT)
    get_application : Proc(IXamlDiagnostics*, IInspectable*, HRESULT)
    get_i_inspectable_from_handle : Proc(IXamlDiagnostics*, UInt64, IInspectable*, HRESULT)
    get_handle_from_i_inspectable : Proc(IXamlDiagnostics*, IInspectable, UInt64*, HRESULT)
    hit_test : Proc(IXamlDiagnostics*, RECT, UInt32*, UInt64**, HRESULT)
    register_instance : Proc(IXamlDiagnostics*, IInspectable, UInt64*, HRESULT)
    get_initialization_data : Proc(IXamlDiagnostics*, UInt8**, HRESULT)
  end

  IXamlDiagnostics_GUID = "18c9e2b6-3f43-4116-9f2b-ff935d7770d2"
  IID_IXamlDiagnostics = LibC::GUID.new(0x18c9e2b6_u32, 0x3f43_u16, 0x4116_u16, StaticArray[0x9f_u8, 0x2b_u8, 0xff_u8, 0x93_u8, 0x5d_u8, 0x77_u8, 0x70_u8, 0xd2_u8])
  struct IXamlDiagnostics
    lpVtbl : IXamlDiagnosticsVTbl*
  end

  struct IBitmapDataVTbl
    query_interface : Proc(IBitmapData*, Guid*, Void**, HRESULT)
    add_ref : Proc(IBitmapData*, UInt32)
    release : Proc(IBitmapData*, UInt32)
    copy_bytes_to : Proc(IBitmapData*, UInt32, UInt32, UInt8*, UInt32*, HRESULT)
    get_stride : Proc(IBitmapData*, UInt32*, HRESULT)
    get_bitmap_description : Proc(IBitmapData*, BitmapDescription*, HRESULT)
    get_source_bitmap_description : Proc(IBitmapData*, BitmapDescription*, HRESULT)
  end

  IBitmapData_GUID = "d1a34ef2-cad8-4635-a3d2-fcda8d3f3caf"
  IID_IBitmapData = LibC::GUID.new(0xd1a34ef2_u32, 0xcad8_u16, 0x4635_u16, StaticArray[0xa3_u8, 0xd2_u8, 0xfc_u8, 0xda_u8, 0x8d_u8, 0x3f_u8, 0x3c_u8, 0xaf_u8])
  struct IBitmapData
    lpVtbl : IBitmapDataVTbl*
  end

  struct IVisualTreeService2VTbl
    query_interface : Proc(IVisualTreeService2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVisualTreeService2*, UInt32)
    release : Proc(IVisualTreeService2*, UInt32)
    advise_visual_tree_change : Proc(IVisualTreeService2*, IVisualTreeServiceCallback, HRESULT)
    unadvise_visual_tree_change : Proc(IVisualTreeService2*, IVisualTreeServiceCallback, HRESULT)
    get_enums : Proc(IVisualTreeService2*, UInt32*, EnumType**, HRESULT)
    create_instance : Proc(IVisualTreeService2*, UInt8*, UInt8*, UInt64*, HRESULT)
    get_property_values_chain : Proc(IVisualTreeService2*, UInt64, UInt32*, PropertyChainSource**, UInt32*, PropertyChainValue**, HRESULT)
    set_property : Proc(IVisualTreeService2*, UInt64, UInt64, UInt32, HRESULT)
    clear_property : Proc(IVisualTreeService2*, UInt64, UInt32, HRESULT)
    get_collection_count : Proc(IVisualTreeService2*, UInt64, UInt32*, HRESULT)
    get_collection_elements : Proc(IVisualTreeService2*, UInt64, UInt32, UInt32*, CollectionElementValue**, HRESULT)
    add_child : Proc(IVisualTreeService2*, UInt64, UInt64, UInt32, HRESULT)
    remove_child : Proc(IVisualTreeService2*, UInt64, UInt32, HRESULT)
    clear_children : Proc(IVisualTreeService2*, UInt64, HRESULT)
    get_property_index : Proc(IVisualTreeService2*, UInt64, LibC::LPWSTR, UInt32*, HRESULT)
    get_property : Proc(IVisualTreeService2*, UInt64, UInt32, UInt64*, HRESULT)
    replace_resource : Proc(IVisualTreeService2*, UInt64, UInt64, UInt64, HRESULT)
    render_target_bitmap : Proc(IVisualTreeService2*, UInt64, RenderTargetBitmapOptions, UInt32, UInt32, IBitmapData*, HRESULT)
  end

  IVisualTreeService2_GUID = "130f5136-ec43-4f61-89c7-9801a36d2e95"
  IID_IVisualTreeService2 = LibC::GUID.new(0x130f5136_u32, 0xec43_u16, 0x4f61_u16, StaticArray[0x89_u8, 0xc7_u8, 0x98_u8, 0x1_u8, 0xa3_u8, 0x6d_u8, 0x2e_u8, 0x95_u8])
  struct IVisualTreeService2
    lpVtbl : IVisualTreeService2VTbl*
  end

  struct IVisualTreeService3VTbl
    query_interface : Proc(IVisualTreeService3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVisualTreeService3*, UInt32)
    release : Proc(IVisualTreeService3*, UInt32)
    advise_visual_tree_change : Proc(IVisualTreeService3*, IVisualTreeServiceCallback, HRESULT)
    unadvise_visual_tree_change : Proc(IVisualTreeService3*, IVisualTreeServiceCallback, HRESULT)
    get_enums : Proc(IVisualTreeService3*, UInt32*, EnumType**, HRESULT)
    create_instance : Proc(IVisualTreeService3*, UInt8*, UInt8*, UInt64*, HRESULT)
    get_property_values_chain : Proc(IVisualTreeService3*, UInt64, UInt32*, PropertyChainSource**, UInt32*, PropertyChainValue**, HRESULT)
    set_property : Proc(IVisualTreeService3*, UInt64, UInt64, UInt32, HRESULT)
    clear_property : Proc(IVisualTreeService3*, UInt64, UInt32, HRESULT)
    get_collection_count : Proc(IVisualTreeService3*, UInt64, UInt32*, HRESULT)
    get_collection_elements : Proc(IVisualTreeService3*, UInt64, UInt32, UInt32*, CollectionElementValue**, HRESULT)
    add_child : Proc(IVisualTreeService3*, UInt64, UInt64, UInt32, HRESULT)
    remove_child : Proc(IVisualTreeService3*, UInt64, UInt32, HRESULT)
    clear_children : Proc(IVisualTreeService3*, UInt64, HRESULT)
    get_property_index : Proc(IVisualTreeService3*, UInt64, LibC::LPWSTR, UInt32*, HRESULT)
    get_property : Proc(IVisualTreeService3*, UInt64, UInt32, UInt64*, HRESULT)
    replace_resource : Proc(IVisualTreeService3*, UInt64, UInt64, UInt64, HRESULT)
    render_target_bitmap : Proc(IVisualTreeService3*, UInt64, RenderTargetBitmapOptions, UInt32, UInt32, IBitmapData*, HRESULT)
    resolve_resource : Proc(IVisualTreeService3*, UInt64, LibC::LPWSTR, ResourceType, UInt32, HRESULT)
    get_dictionary_item : Proc(IVisualTreeService3*, UInt64, LibC::LPWSTR, LibC::BOOL, UInt64*, HRESULT)
    add_dictionary_item : Proc(IVisualTreeService3*, UInt64, UInt64, UInt64, HRESULT)
    remove_dictionary_item : Proc(IVisualTreeService3*, UInt64, UInt64, HRESULT)
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
  def query_interface(this : IVisualTreeServiceCallback*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IVisualTreeServiceCallback*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IVisualTreeServiceCallback*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_visual_tree_change(this : IVisualTreeServiceCallback*, relation : ParentChildRelation, element : VisualElement, mutationtype : VisualMutationType) : HRESULT
    @lpVtbl.value.on_visual_tree_change.call(this, relation, element, mutationtype)
  end
end
struct LibWin32::IVisualTreeServiceCallback2
  def query_interface(this : IVisualTreeServiceCallback2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IVisualTreeServiceCallback2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IVisualTreeServiceCallback2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_visual_tree_change(this : IVisualTreeServiceCallback2*, relation : ParentChildRelation, element : VisualElement, mutationtype : VisualMutationType) : HRESULT
    @lpVtbl.value.on_visual_tree_change.call(this, relation, element, mutationtype)
  end
  def on_element_state_changed(this : IVisualTreeServiceCallback2*, element : UInt64, elementstate : VisualElementState, context : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.on_element_state_changed.call(this, element, elementstate, context)
  end
end
struct LibWin32::IVisualTreeService
  def query_interface(this : IVisualTreeService*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IVisualTreeService*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IVisualTreeService*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def advise_visual_tree_change(this : IVisualTreeService*, pcallback : IVisualTreeServiceCallback) : HRESULT
    @lpVtbl.value.advise_visual_tree_change.call(this, pcallback)
  end
  def unadvise_visual_tree_change(this : IVisualTreeService*, pcallback : IVisualTreeServiceCallback) : HRESULT
    @lpVtbl.value.unadvise_visual_tree_change.call(this, pcallback)
  end
  def get_enums(this : IVisualTreeService*, pcount : UInt32*, ppenums : EnumType**) : HRESULT
    @lpVtbl.value.get_enums.call(this, pcount, ppenums)
  end
  def create_instance(this : IVisualTreeService*, typename : UInt8*, value : UInt8*, pinstancehandle : UInt64*) : HRESULT
    @lpVtbl.value.create_instance.call(this, typename, value, pinstancehandle)
  end
  def get_property_values_chain(this : IVisualTreeService*, instancehandle : UInt64, psourcecount : UInt32*, pppropertysources : PropertyChainSource**, ppropertycount : UInt32*, pppropertyvalues : PropertyChainValue**) : HRESULT
    @lpVtbl.value.get_property_values_chain.call(this, instancehandle, psourcecount, pppropertysources, ppropertycount, pppropertyvalues)
  end
  def set_property(this : IVisualTreeService*, instancehandle : UInt64, value : UInt64, propertyindex : UInt32) : HRESULT
    @lpVtbl.value.set_property.call(this, instancehandle, value, propertyindex)
  end
  def clear_property(this : IVisualTreeService*, instancehandle : UInt64, propertyindex : UInt32) : HRESULT
    @lpVtbl.value.clear_property.call(this, instancehandle, propertyindex)
  end
  def get_collection_count(this : IVisualTreeService*, instancehandle : UInt64, pcollectionsize : UInt32*) : HRESULT
    @lpVtbl.value.get_collection_count.call(this, instancehandle, pcollectionsize)
  end
  def get_collection_elements(this : IVisualTreeService*, instancehandle : UInt64, startindex : UInt32, pelementcount : UInt32*, ppelementvalues : CollectionElementValue**) : HRESULT
    @lpVtbl.value.get_collection_elements.call(this, instancehandle, startindex, pelementcount, ppelementvalues)
  end
  def add_child(this : IVisualTreeService*, parent : UInt64, child : UInt64, index : UInt32) : HRESULT
    @lpVtbl.value.add_child.call(this, parent, child, index)
  end
  def remove_child(this : IVisualTreeService*, parent : UInt64, index : UInt32) : HRESULT
    @lpVtbl.value.remove_child.call(this, parent, index)
  end
  def clear_children(this : IVisualTreeService*, parent : UInt64) : HRESULT
    @lpVtbl.value.clear_children.call(this, parent)
  end
end
struct LibWin32::IXamlDiagnostics
  def query_interface(this : IXamlDiagnostics*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IXamlDiagnostics*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IXamlDiagnostics*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_dispatcher(this : IXamlDiagnostics*, ppdispatcher : IInspectable*) : HRESULT
    @lpVtbl.value.get_dispatcher.call(this, ppdispatcher)
  end
  def get_ui_layer(this : IXamlDiagnostics*, pplayer : IInspectable*) : HRESULT
    @lpVtbl.value.get_ui_layer.call(this, pplayer)
  end
  def get_application(this : IXamlDiagnostics*, ppapplication : IInspectable*) : HRESULT
    @lpVtbl.value.get_application.call(this, ppapplication)
  end
  def get_i_inspectable_from_handle(this : IXamlDiagnostics*, instancehandle : UInt64, ppinstance : IInspectable*) : HRESULT
    @lpVtbl.value.get_i_inspectable_from_handle.call(this, instancehandle, ppinstance)
  end
  def get_handle_from_i_inspectable(this : IXamlDiagnostics*, pinstance : IInspectable, phandle : UInt64*) : HRESULT
    @lpVtbl.value.get_handle_from_i_inspectable.call(this, pinstance, phandle)
  end
  def hit_test(this : IXamlDiagnostics*, rect : RECT, pcount : UInt32*, ppinstancehandles : UInt64**) : HRESULT
    @lpVtbl.value.hit_test.call(this, rect, pcount, ppinstancehandles)
  end
  def register_instance(this : IXamlDiagnostics*, pinstance : IInspectable, pinstancehandle : UInt64*) : HRESULT
    @lpVtbl.value.register_instance.call(this, pinstance, pinstancehandle)
  end
  def get_initialization_data(this : IXamlDiagnostics*, pinitializationdata : UInt8**) : HRESULT
    @lpVtbl.value.get_initialization_data.call(this, pinitializationdata)
  end
end
struct LibWin32::IBitmapData
  def query_interface(this : IBitmapData*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IBitmapData*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IBitmapData*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def copy_bytes_to(this : IBitmapData*, sourceoffsetinbytes : UInt32, maxbytestocopy : UInt32, pvbytes : UInt8*, numberofbytescopied : UInt32*) : HRESULT
    @lpVtbl.value.copy_bytes_to.call(this, sourceoffsetinbytes, maxbytestocopy, pvbytes, numberofbytescopied)
  end
  def get_stride(this : IBitmapData*, pstride : UInt32*) : HRESULT
    @lpVtbl.value.get_stride.call(this, pstride)
  end
  def get_bitmap_description(this : IBitmapData*, pbitmapdescription : BitmapDescription*) : HRESULT
    @lpVtbl.value.get_bitmap_description.call(this, pbitmapdescription)
  end
  def get_source_bitmap_description(this : IBitmapData*, pbitmapdescription : BitmapDescription*) : HRESULT
    @lpVtbl.value.get_source_bitmap_description.call(this, pbitmapdescription)
  end
end
struct LibWin32::IVisualTreeService2
  def query_interface(this : IVisualTreeService2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IVisualTreeService2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IVisualTreeService2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def advise_visual_tree_change(this : IVisualTreeService2*, pcallback : IVisualTreeServiceCallback) : HRESULT
    @lpVtbl.value.advise_visual_tree_change.call(this, pcallback)
  end
  def unadvise_visual_tree_change(this : IVisualTreeService2*, pcallback : IVisualTreeServiceCallback) : HRESULT
    @lpVtbl.value.unadvise_visual_tree_change.call(this, pcallback)
  end
  def get_enums(this : IVisualTreeService2*, pcount : UInt32*, ppenums : EnumType**) : HRESULT
    @lpVtbl.value.get_enums.call(this, pcount, ppenums)
  end
  def create_instance(this : IVisualTreeService2*, typename : UInt8*, value : UInt8*, pinstancehandle : UInt64*) : HRESULT
    @lpVtbl.value.create_instance.call(this, typename, value, pinstancehandle)
  end
  def get_property_values_chain(this : IVisualTreeService2*, instancehandle : UInt64, psourcecount : UInt32*, pppropertysources : PropertyChainSource**, ppropertycount : UInt32*, pppropertyvalues : PropertyChainValue**) : HRESULT
    @lpVtbl.value.get_property_values_chain.call(this, instancehandle, psourcecount, pppropertysources, ppropertycount, pppropertyvalues)
  end
  def set_property(this : IVisualTreeService2*, instancehandle : UInt64, value : UInt64, propertyindex : UInt32) : HRESULT
    @lpVtbl.value.set_property.call(this, instancehandle, value, propertyindex)
  end
  def clear_property(this : IVisualTreeService2*, instancehandle : UInt64, propertyindex : UInt32) : HRESULT
    @lpVtbl.value.clear_property.call(this, instancehandle, propertyindex)
  end
  def get_collection_count(this : IVisualTreeService2*, instancehandle : UInt64, pcollectionsize : UInt32*) : HRESULT
    @lpVtbl.value.get_collection_count.call(this, instancehandle, pcollectionsize)
  end
  def get_collection_elements(this : IVisualTreeService2*, instancehandle : UInt64, startindex : UInt32, pelementcount : UInt32*, ppelementvalues : CollectionElementValue**) : HRESULT
    @lpVtbl.value.get_collection_elements.call(this, instancehandle, startindex, pelementcount, ppelementvalues)
  end
  def add_child(this : IVisualTreeService2*, parent : UInt64, child : UInt64, index : UInt32) : HRESULT
    @lpVtbl.value.add_child.call(this, parent, child, index)
  end
  def remove_child(this : IVisualTreeService2*, parent : UInt64, index : UInt32) : HRESULT
    @lpVtbl.value.remove_child.call(this, parent, index)
  end
  def clear_children(this : IVisualTreeService2*, parent : UInt64) : HRESULT
    @lpVtbl.value.clear_children.call(this, parent)
  end
  def get_property_index(this : IVisualTreeService2*, object : UInt64, propertyname : LibC::LPWSTR, ppropertyindex : UInt32*) : HRESULT
    @lpVtbl.value.get_property_index.call(this, object, propertyname, ppropertyindex)
  end
  def get_property(this : IVisualTreeService2*, object : UInt64, propertyindex : UInt32, pvalue : UInt64*) : HRESULT
    @lpVtbl.value.get_property.call(this, object, propertyindex, pvalue)
  end
  def replace_resource(this : IVisualTreeService2*, resourcedictionary : UInt64, key : UInt64, newvalue : UInt64) : HRESULT
    @lpVtbl.value.replace_resource.call(this, resourcedictionary, key, newvalue)
  end
  def render_target_bitmap(this : IVisualTreeService2*, handle : UInt64, options : RenderTargetBitmapOptions, maxpixelwidth : UInt32, maxpixelheight : UInt32, ppbitmapdata : IBitmapData*) : HRESULT
    @lpVtbl.value.render_target_bitmap.call(this, handle, options, maxpixelwidth, maxpixelheight, ppbitmapdata)
  end
end
struct LibWin32::IVisualTreeService3
  def query_interface(this : IVisualTreeService3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IVisualTreeService3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IVisualTreeService3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def advise_visual_tree_change(this : IVisualTreeService3*, pcallback : IVisualTreeServiceCallback) : HRESULT
    @lpVtbl.value.advise_visual_tree_change.call(this, pcallback)
  end
  def unadvise_visual_tree_change(this : IVisualTreeService3*, pcallback : IVisualTreeServiceCallback) : HRESULT
    @lpVtbl.value.unadvise_visual_tree_change.call(this, pcallback)
  end
  def get_enums(this : IVisualTreeService3*, pcount : UInt32*, ppenums : EnumType**) : HRESULT
    @lpVtbl.value.get_enums.call(this, pcount, ppenums)
  end
  def create_instance(this : IVisualTreeService3*, typename : UInt8*, value : UInt8*, pinstancehandle : UInt64*) : HRESULT
    @lpVtbl.value.create_instance.call(this, typename, value, pinstancehandle)
  end
  def get_property_values_chain(this : IVisualTreeService3*, instancehandle : UInt64, psourcecount : UInt32*, pppropertysources : PropertyChainSource**, ppropertycount : UInt32*, pppropertyvalues : PropertyChainValue**) : HRESULT
    @lpVtbl.value.get_property_values_chain.call(this, instancehandle, psourcecount, pppropertysources, ppropertycount, pppropertyvalues)
  end
  def set_property(this : IVisualTreeService3*, instancehandle : UInt64, value : UInt64, propertyindex : UInt32) : HRESULT
    @lpVtbl.value.set_property.call(this, instancehandle, value, propertyindex)
  end
  def clear_property(this : IVisualTreeService3*, instancehandle : UInt64, propertyindex : UInt32) : HRESULT
    @lpVtbl.value.clear_property.call(this, instancehandle, propertyindex)
  end
  def get_collection_count(this : IVisualTreeService3*, instancehandle : UInt64, pcollectionsize : UInt32*) : HRESULT
    @lpVtbl.value.get_collection_count.call(this, instancehandle, pcollectionsize)
  end
  def get_collection_elements(this : IVisualTreeService3*, instancehandle : UInt64, startindex : UInt32, pelementcount : UInt32*, ppelementvalues : CollectionElementValue**) : HRESULT
    @lpVtbl.value.get_collection_elements.call(this, instancehandle, startindex, pelementcount, ppelementvalues)
  end
  def add_child(this : IVisualTreeService3*, parent : UInt64, child : UInt64, index : UInt32) : HRESULT
    @lpVtbl.value.add_child.call(this, parent, child, index)
  end
  def remove_child(this : IVisualTreeService3*, parent : UInt64, index : UInt32) : HRESULT
    @lpVtbl.value.remove_child.call(this, parent, index)
  end
  def clear_children(this : IVisualTreeService3*, parent : UInt64) : HRESULT
    @lpVtbl.value.clear_children.call(this, parent)
  end
  def get_property_index(this : IVisualTreeService3*, object : UInt64, propertyname : LibC::LPWSTR, ppropertyindex : UInt32*) : HRESULT
    @lpVtbl.value.get_property_index.call(this, object, propertyname, ppropertyindex)
  end
  def get_property(this : IVisualTreeService3*, object : UInt64, propertyindex : UInt32, pvalue : UInt64*) : HRESULT
    @lpVtbl.value.get_property.call(this, object, propertyindex, pvalue)
  end
  def replace_resource(this : IVisualTreeService3*, resourcedictionary : UInt64, key : UInt64, newvalue : UInt64) : HRESULT
    @lpVtbl.value.replace_resource.call(this, resourcedictionary, key, newvalue)
  end
  def render_target_bitmap(this : IVisualTreeService3*, handle : UInt64, options : RenderTargetBitmapOptions, maxpixelwidth : UInt32, maxpixelheight : UInt32, ppbitmapdata : IBitmapData*) : HRESULT
    @lpVtbl.value.render_target_bitmap.call(this, handle, options, maxpixelwidth, maxpixelheight, ppbitmapdata)
  end
  def resolve_resource(this : IVisualTreeService3*, resourcecontext : UInt64, resourcename : LibC::LPWSTR, resourcetype : ResourceType, propertyindex : UInt32) : HRESULT
    @lpVtbl.value.resolve_resource.call(this, resourcecontext, resourcename, resourcetype, propertyindex)
  end
  def get_dictionary_item(this : IVisualTreeService3*, dictionaryhandle : UInt64, resourcename : LibC::LPWSTR, resourceisimplicitstyle : LibC::BOOL, resourcehandle : UInt64*) : HRESULT
    @lpVtbl.value.get_dictionary_item.call(this, dictionaryhandle, resourcename, resourceisimplicitstyle, resourcehandle)
  end
  def add_dictionary_item(this : IVisualTreeService3*, dictionaryhandle : UInt64, resourcekey : UInt64, resourcehandle : UInt64) : HRESULT
    @lpVtbl.value.add_dictionary_item.call(this, dictionaryhandle, resourcekey, resourcehandle)
  end
  def remove_dictionary_item(this : IVisualTreeService3*, dictionaryhandle : UInt64, resourcekey : UInt64) : HRESULT
    @lpVtbl.value.remove_dictionary_item.call(this, dictionaryhandle, resourcekey)
  end
end
