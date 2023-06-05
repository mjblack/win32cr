require "../../foundation.cr"
require "../../system/com.cr"
require "../../graphics/dxgi/common.cr"
require "../../system/winrt.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:windows.ui.xaml.dll")]
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

  struct IVisualTreeService3
    lpVtbl : IVisualTreeService3VTbl*
  end


  # Params # endpointname : LibC::LPWSTR [In],pid : UInt32 [In],wszdllxamldiagnostics : LibC::LPWSTR [In],wsztapdllname : LibC::LPWSTR [In],tapclsid : Guid [In]
  fun InitializeXamlDiagnostic(endpointname : LibC::LPWSTR, pid : UInt32, wszdllxamldiagnostics : LibC::LPWSTR, wsztapdllname : LibC::LPWSTR, tapclsid : Guid) : HRESULT

  # Params # endpointname : LibC::LPWSTR [In],pid : UInt32 [In],wszdllxamldiagnostics : LibC::LPWSTR [In],wsztapdllname : LibC::LPWSTR [In],tapclsid : Guid [In],wszinitializationdata : LibC::LPWSTR [In]
  fun InitializeXamlDiagnosticsEx(endpointname : LibC::LPWSTR, pid : UInt32, wszdllxamldiagnostics : LibC::LPWSTR, wsztapdllname : LibC::LPWSTR, tapclsid : Guid, wszinitializationdata : LibC::LPWSTR) : HRESULT
end
