require "../system/com.cr"
require "../foundation.cr"
require "../graphics/imaging.cr"
require "../graphics/dwm.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
{% else %}
{% end %}
lib LibWin32
  MILBITMAPEFFECT_SDK_VERSION = 16777216_u32
  CLSID_MILBitmapEffectGroup = "ac9c1a9a-7e18-4f64-ac7e-47cf7f051e95"
  CLSID_MILBitmapEffectBlur = "a924df87-225d-4373-8f5b-b90ec85ae3de"
  CLSID_MILBitmapEffectDropShadow = "459a3fbe-d8ac-4692-874b-7a265715aa16"
  CLSID_MILBitmapEffectOuterGlow = "e2161bdd-7eb6-4725-9c0b-8a2a1b4f0667"
  CLSID_MILBitmapEffectBevel = "fd361dbe-6c9b-4de0-8290-f6400c2737ed"
  CLSID_MILBitmapEffectEmboss = "cd299846-824f-47ec-a007-12aa767f2816"

  struct MilRectD
    left : Float64
    top : Float64
    right : Float64
    bottom : Float64
  end
  struct MilPoint2D
    x : Float64
    y : Float64
  end
  struct MILMatrixF
    _11 : Float64
    _12 : Float64
    _13 : Float64
    _14 : Float64
    _21 : Float64
    _22 : Float64
    _23 : Float64
    _24 : Float64
    _31 : Float64
    _32 : Float64
    _33 : Float64
    _34 : Float64
    _41 : Float64
    _42 : Float64
    _43 : Float64
    _44 : Float64
  end


  struct IMILBitmapEffectConnectorInfoVTbl
    query_interface : Proc(IMILBitmapEffectConnectorInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMILBitmapEffectConnectorInfo*, UInt32)
    release : Proc(IMILBitmapEffectConnectorInfo*, UInt32)
    get_index : Proc(IMILBitmapEffectConnectorInfo*, UInt32*, HRESULT)
    get_optimal_format : Proc(IMILBitmapEffectConnectorInfo*, Guid*, HRESULT)
    get_number_formats : Proc(IMILBitmapEffectConnectorInfo*, UInt32*, HRESULT)
    get_format : Proc(IMILBitmapEffectConnectorInfo*, UInt32, Guid*, HRESULT)
  end

  IMILBitmapEffectConnectorInfo_GUID = LibC::GUID.new("f66d2e4b-b46b-42fc-859e-3da0ecdb3c43")
  CLSID_IMILBitmapEffectConnectorInfo = "f66d2e4b-b46b-42fc-859e-3da0ecdb3c43"
  struct IMILBitmapEffectConnectorInfo
    lpVtbl : IMILBitmapEffectConnectorInfoVTbl*
  end

  struct IMILBitmapEffectConnectionsInfoVTbl
    query_interface : Proc(IMILBitmapEffectConnectionsInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMILBitmapEffectConnectionsInfo*, UInt32)
    release : Proc(IMILBitmapEffectConnectionsInfo*, UInt32)
    get_number_inputs : Proc(IMILBitmapEffectConnectionsInfo*, UInt32*, HRESULT)
    get_number_outputs : Proc(IMILBitmapEffectConnectionsInfo*, UInt32*, HRESULT)
    get_input_connector_info : Proc(IMILBitmapEffectConnectionsInfo*, UInt32, IMILBitmapEffectConnectorInfo*, HRESULT)
    get_output_connector_info : Proc(IMILBitmapEffectConnectionsInfo*, UInt32, IMILBitmapEffectConnectorInfo*, HRESULT)
  end

  IMILBitmapEffectConnectionsInfo_GUID = LibC::GUID.new("476b538a-c765-4237-ba4a-d6a880ff0cfc")
  CLSID_IMILBitmapEffectConnectionsInfo = "476b538a-c765-4237-ba4a-d6a880ff0cfc"
  struct IMILBitmapEffectConnectionsInfo
    lpVtbl : IMILBitmapEffectConnectionsInfoVTbl*
  end

  struct IMILBitmapEffectConnectionsVTbl
    query_interface : Proc(IMILBitmapEffectConnections*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMILBitmapEffectConnections*, UInt32)
    release : Proc(IMILBitmapEffectConnections*, UInt32)
    get_input_connector : Proc(IMILBitmapEffectConnections*, UInt32, IMILBitmapEffectInputConnector*, HRESULT)
    get_output_connector : Proc(IMILBitmapEffectConnections*, UInt32, IMILBitmapEffectOutputConnector*, HRESULT)
  end

  IMILBitmapEffectConnections_GUID = LibC::GUID.new("c2b5d861-9b1a-4374-89b0-dec4874d6a81")
  CLSID_IMILBitmapEffectConnections = "c2b5d861-9b1a-4374-89b0-dec4874d6a81"
  struct IMILBitmapEffectConnections
    lpVtbl : IMILBitmapEffectConnectionsVTbl*
  end

  struct IMILBitmapEffectVTbl
    query_interface : Proc(IMILBitmapEffect*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMILBitmapEffect*, UInt32)
    release : Proc(IMILBitmapEffect*, UInt32)
    get_output : Proc(IMILBitmapEffect*, UInt32, IMILBitmapEffectRenderContext, IWICBitmapSource*, HRESULT)
    get_parent_effect : Proc(IMILBitmapEffect*, IMILBitmapEffectGroup*, HRESULT)
    set_input_source : Proc(IMILBitmapEffect*, UInt32, IWICBitmapSource, HRESULT)
  end

  IMILBitmapEffect_GUID = LibC::GUID.new("8a6ff321-c944-4a1b-9944-9954af301258")
  CLSID_IMILBitmapEffect = "8a6ff321-c944-4a1b-9944-9954af301258"
  struct IMILBitmapEffect
    lpVtbl : IMILBitmapEffectVTbl*
  end

  struct IMILBitmapEffectImplVTbl
    query_interface : Proc(IMILBitmapEffectImpl*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMILBitmapEffectImpl*, UInt32)
    release : Proc(IMILBitmapEffectImpl*, UInt32)
    is_in_place_modification_allowed : Proc(IMILBitmapEffectImpl*, IMILBitmapEffectOutputConnector, Int16*, HRESULT)
    set_parent_effect : Proc(IMILBitmapEffectImpl*, IMILBitmapEffectGroup, HRESULT)
    get_input_source : Proc(IMILBitmapEffectImpl*, UInt32, IWICBitmapSource*, HRESULT)
    get_input_source_bounds : Proc(IMILBitmapEffectImpl*, UInt32, MilRectD*, HRESULT)
    get_input_bitmap_source : Proc(IMILBitmapEffectImpl*, UInt32, IMILBitmapEffectRenderContext, Int16*, IWICBitmapSource*, HRESULT)
    get_output_bitmap_source : Proc(IMILBitmapEffectImpl*, UInt32, IMILBitmapEffectRenderContext, Int16*, IWICBitmapSource*, HRESULT)
    initialize : Proc(IMILBitmapEffectImpl*, IUnknown, HRESULT)
  end

  IMILBitmapEffectImpl_GUID = LibC::GUID.new("cc2468f2-9936-47be-b4af-06b5df5dbcbb")
  CLSID_IMILBitmapEffectImpl = "cc2468f2-9936-47be-b4af-06b5df5dbcbb"
  struct IMILBitmapEffectImpl
    lpVtbl : IMILBitmapEffectImplVTbl*
  end

  struct IMILBitmapEffectGroupVTbl
    query_interface : Proc(IMILBitmapEffectGroup*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMILBitmapEffectGroup*, UInt32)
    release : Proc(IMILBitmapEffectGroup*, UInt32)
    get_interior_input_connector : Proc(IMILBitmapEffectGroup*, UInt32, IMILBitmapEffectOutputConnector*, HRESULT)
    get_interior_output_connector : Proc(IMILBitmapEffectGroup*, UInt32, IMILBitmapEffectInputConnector*, HRESULT)
    add : Proc(IMILBitmapEffectGroup*, IMILBitmapEffect, HRESULT)
  end

  IMILBitmapEffectGroup_GUID = LibC::GUID.new("2f952360-698a-4ac6-81a1-bcfdf08eb8e8")
  CLSID_IMILBitmapEffectGroup = "2f952360-698a-4ac6-81a1-bcfdf08eb8e8"
  struct IMILBitmapEffectGroup
    lpVtbl : IMILBitmapEffectGroupVTbl*
  end

  struct IMILBitmapEffectGroupImplVTbl
    query_interface : Proc(IMILBitmapEffectGroupImpl*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMILBitmapEffectGroupImpl*, UInt32)
    release : Proc(IMILBitmapEffectGroupImpl*, UInt32)
    preprocess : Proc(IMILBitmapEffectGroupImpl*, IMILBitmapEffectRenderContext, HRESULT)
    get_number_children : Proc(IMILBitmapEffectGroupImpl*, UInt32*, HRESULT)
    get_children : Proc(IMILBitmapEffectGroupImpl*, IMILBitmapEffects*, HRESULT)
  end

  IMILBitmapEffectGroupImpl_GUID = LibC::GUID.new("78fed518-1cfc-4807-8b85-6b6e51398f62")
  CLSID_IMILBitmapEffectGroupImpl = "78fed518-1cfc-4807-8b85-6b6e51398f62"
  struct IMILBitmapEffectGroupImpl
    lpVtbl : IMILBitmapEffectGroupImplVTbl*
  end

  struct IMILBitmapEffectRenderContextVTbl
    query_interface : Proc(IMILBitmapEffectRenderContext*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMILBitmapEffectRenderContext*, UInt32)
    release : Proc(IMILBitmapEffectRenderContext*, UInt32)
    set_output_pixel_format : Proc(IMILBitmapEffectRenderContext*, Guid*, HRESULT)
    get_output_pixel_format : Proc(IMILBitmapEffectRenderContext*, Guid*, HRESULT)
    set_use_software_renderer : Proc(IMILBitmapEffectRenderContext*, Int16, HRESULT)
    set_initial_transform : Proc(IMILBitmapEffectRenderContext*, MILMatrixF*, HRESULT)
    get_final_transform : Proc(IMILBitmapEffectRenderContext*, MILMatrixF*, HRESULT)
    set_output_dpi : Proc(IMILBitmapEffectRenderContext*, Float64, Float64, HRESULT)
    get_output_dpi : Proc(IMILBitmapEffectRenderContext*, Float64*, Float64*, HRESULT)
    set_region_of_interest : Proc(IMILBitmapEffectRenderContext*, MilRectD*, HRESULT)
  end

  IMILBitmapEffectRenderContext_GUID = LibC::GUID.new("12a2ec7e-2d33-44b2-b334-1abb7846e390")
  CLSID_IMILBitmapEffectRenderContext = "12a2ec7e-2d33-44b2-b334-1abb7846e390"
  struct IMILBitmapEffectRenderContext
    lpVtbl : IMILBitmapEffectRenderContextVTbl*
  end

  struct IMILBitmapEffectRenderContextImplVTbl
    query_interface : Proc(IMILBitmapEffectRenderContextImpl*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMILBitmapEffectRenderContextImpl*, UInt32)
    release : Proc(IMILBitmapEffectRenderContextImpl*, UInt32)
    get_use_software_renderer : Proc(IMILBitmapEffectRenderContextImpl*, Int16*, HRESULT)
    get_transform : Proc(IMILBitmapEffectRenderContextImpl*, MILMatrixF*, HRESULT)
    update_transform : Proc(IMILBitmapEffectRenderContextImpl*, MILMatrixF*, HRESULT)
    get_output_bounds : Proc(IMILBitmapEffectRenderContextImpl*, MilRectD*, HRESULT)
    update_output_bounds : Proc(IMILBitmapEffectRenderContextImpl*, MilRectD*, HRESULT)
  end

  IMILBitmapEffectRenderContextImpl_GUID = LibC::GUID.new("4d25accb-797d-4fd2-b128-dffeff84fcc3")
  CLSID_IMILBitmapEffectRenderContextImpl = "4d25accb-797d-4fd2-b128-dffeff84fcc3"
  struct IMILBitmapEffectRenderContextImpl
    lpVtbl : IMILBitmapEffectRenderContextImplVTbl*
  end

  struct IMILBitmapEffectFactoryVTbl
    query_interface : Proc(IMILBitmapEffectFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMILBitmapEffectFactory*, UInt32)
    release : Proc(IMILBitmapEffectFactory*, UInt32)
    create_effect : Proc(IMILBitmapEffectFactory*, Guid*, IMILBitmapEffect*, HRESULT)
    create_context : Proc(IMILBitmapEffectFactory*, IMILBitmapEffectRenderContext*, HRESULT)
    create_effect_outer : Proc(IMILBitmapEffectFactory*, IMILBitmapEffect*, HRESULT)
  end

  IMILBitmapEffectFactory_GUID = LibC::GUID.new("33a9df34-a403-4ec7-b07e-bc0682370845")
  CLSID_IMILBitmapEffectFactory = "33a9df34-a403-4ec7-b07e-bc0682370845"
  struct IMILBitmapEffectFactory
    lpVtbl : IMILBitmapEffectFactoryVTbl*
  end

  struct IMILBitmapEffectPrimitiveVTbl
    query_interface : Proc(IMILBitmapEffectPrimitive*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMILBitmapEffectPrimitive*, UInt32)
    release : Proc(IMILBitmapEffectPrimitive*, UInt32)
    get_output : Proc(IMILBitmapEffectPrimitive*, UInt32, IMILBitmapEffectRenderContext, Int16*, IWICBitmapSource*, HRESULT)
    transform_point : Proc(IMILBitmapEffectPrimitive*, UInt32, MilPoint2D*, Int16, IMILBitmapEffectRenderContext, Int16*, HRESULT)
    transform_rect : Proc(IMILBitmapEffectPrimitive*, UInt32, MilRectD*, Int16, IMILBitmapEffectRenderContext, HRESULT)
    has_affine_transform : Proc(IMILBitmapEffectPrimitive*, UInt32, Int16*, HRESULT)
    has_inverse_transform : Proc(IMILBitmapEffectPrimitive*, UInt32, Int16*, HRESULT)
    get_affine_matrix : Proc(IMILBitmapEffectPrimitive*, UInt32, MilMatrix3x2D*, HRESULT)
  end

  IMILBitmapEffectPrimitive_GUID = LibC::GUID.new("67e31025-3091-4dfc-98d6-dd494551461d")
  CLSID_IMILBitmapEffectPrimitive = "67e31025-3091-4dfc-98d6-dd494551461d"
  struct IMILBitmapEffectPrimitive
    lpVtbl : IMILBitmapEffectPrimitiveVTbl*
  end

  struct IMILBitmapEffectPrimitiveImplVTbl
    query_interface : Proc(IMILBitmapEffectPrimitiveImpl*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMILBitmapEffectPrimitiveImpl*, UInt32)
    release : Proc(IMILBitmapEffectPrimitiveImpl*, UInt32)
    is_dirty : Proc(IMILBitmapEffectPrimitiveImpl*, UInt32, Int16*, HRESULT)
    is_volatile : Proc(IMILBitmapEffectPrimitiveImpl*, UInt32, Int16*, HRESULT)
  end

  IMILBitmapEffectPrimitiveImpl_GUID = LibC::GUID.new("ce41e00b-efa6-44e7-b007-dd042e3ae126")
  CLSID_IMILBitmapEffectPrimitiveImpl = "ce41e00b-efa6-44e7-b007-dd042e3ae126"
  struct IMILBitmapEffectPrimitiveImpl
    lpVtbl : IMILBitmapEffectPrimitiveImplVTbl*
  end

  struct IMILBitmapEffectsVTbl
    query_interface : Proc(IMILBitmapEffects*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMILBitmapEffects*, UInt32)
    release : Proc(IMILBitmapEffects*, UInt32)
    _new_enum : Proc(IMILBitmapEffects*, IUnknown*, HRESULT)
    get_parent : Proc(IMILBitmapEffects*, IMILBitmapEffectGroup*, HRESULT)
    item : Proc(IMILBitmapEffects*, UInt32, IMILBitmapEffect*, HRESULT)
    get_count : Proc(IMILBitmapEffects*, UInt32*, HRESULT)
  end

  IMILBitmapEffects_GUID = LibC::GUID.new("51ac3dce-67c5-448b-9180-ad3eabddd5dd")
  CLSID_IMILBitmapEffects = "51ac3dce-67c5-448b-9180-ad3eabddd5dd"
  struct IMILBitmapEffects
    lpVtbl : IMILBitmapEffectsVTbl*
  end

  struct IMILBitmapEffectConnectorVTbl
    query_interface : Proc(IMILBitmapEffectConnector*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMILBitmapEffectConnector*, UInt32)
    release : Proc(IMILBitmapEffectConnector*, UInt32)
    get_index : Proc(IMILBitmapEffectConnector*, UInt32*, HRESULT)
    get_optimal_format : Proc(IMILBitmapEffectConnector*, Guid*, HRESULT)
    get_number_formats : Proc(IMILBitmapEffectConnector*, UInt32*, HRESULT)
    get_format : Proc(IMILBitmapEffectConnector*, UInt32, Guid*, HRESULT)
    is_connected : Proc(IMILBitmapEffectConnector*, Int16*, HRESULT)
    get_bitmap_effect : Proc(IMILBitmapEffectConnector*, IMILBitmapEffect*, HRESULT)
  end

  IMILBitmapEffectConnector_GUID = LibC::GUID.new("f59567b3-76c1-4d47-ba1e-79f955e350ef")
  CLSID_IMILBitmapEffectConnector = "f59567b3-76c1-4d47-ba1e-79f955e350ef"
  struct IMILBitmapEffectConnector
    lpVtbl : IMILBitmapEffectConnectorVTbl*
  end

  struct IMILBitmapEffectInputConnectorVTbl
    query_interface : Proc(IMILBitmapEffectInputConnector*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMILBitmapEffectInputConnector*, UInt32)
    release : Proc(IMILBitmapEffectInputConnector*, UInt32)
    get_index : Proc(IMILBitmapEffectInputConnector*, UInt32*, HRESULT)
    get_optimal_format : Proc(IMILBitmapEffectInputConnector*, Guid*, HRESULT)
    get_number_formats : Proc(IMILBitmapEffectInputConnector*, UInt32*, HRESULT)
    get_format : Proc(IMILBitmapEffectInputConnector*, UInt32, Guid*, HRESULT)
    is_connected : Proc(IMILBitmapEffectInputConnector*, Int16*, HRESULT)
    get_bitmap_effect : Proc(IMILBitmapEffectInputConnector*, IMILBitmapEffect*, HRESULT)
    connect_to : Proc(IMILBitmapEffectInputConnector*, IMILBitmapEffectOutputConnector, HRESULT)
    get_connection : Proc(IMILBitmapEffectInputConnector*, IMILBitmapEffectOutputConnector*, HRESULT)
  end

  IMILBitmapEffectInputConnector_GUID = LibC::GUID.new("a9b4ecaa-7a3c-45e7-8573-f4b81b60dd6c")
  CLSID_IMILBitmapEffectInputConnector = "a9b4ecaa-7a3c-45e7-8573-f4b81b60dd6c"
  struct IMILBitmapEffectInputConnector
    lpVtbl : IMILBitmapEffectInputConnectorVTbl*
  end

  struct IMILBitmapEffectOutputConnectorVTbl
    query_interface : Proc(IMILBitmapEffectOutputConnector*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMILBitmapEffectOutputConnector*, UInt32)
    release : Proc(IMILBitmapEffectOutputConnector*, UInt32)
    get_index : Proc(IMILBitmapEffectOutputConnector*, UInt32*, HRESULT)
    get_optimal_format : Proc(IMILBitmapEffectOutputConnector*, Guid*, HRESULT)
    get_number_formats : Proc(IMILBitmapEffectOutputConnector*, UInt32*, HRESULT)
    get_format : Proc(IMILBitmapEffectOutputConnector*, UInt32, Guid*, HRESULT)
    is_connected : Proc(IMILBitmapEffectOutputConnector*, Int16*, HRESULT)
    get_bitmap_effect : Proc(IMILBitmapEffectOutputConnector*, IMILBitmapEffect*, HRESULT)
    get_number_connections : Proc(IMILBitmapEffectOutputConnector*, UInt32*, HRESULT)
    get_connection : Proc(IMILBitmapEffectOutputConnector*, UInt32, IMILBitmapEffectInputConnector*, HRESULT)
  end

  IMILBitmapEffectOutputConnector_GUID = LibC::GUID.new("92957aad-841b-4866-82ec-8752468b07fd")
  CLSID_IMILBitmapEffectOutputConnector = "92957aad-841b-4866-82ec-8752468b07fd"
  struct IMILBitmapEffectOutputConnector
    lpVtbl : IMILBitmapEffectOutputConnectorVTbl*
  end

  struct IMILBitmapEffectOutputConnectorImplVTbl
    query_interface : Proc(IMILBitmapEffectOutputConnectorImpl*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMILBitmapEffectOutputConnectorImpl*, UInt32)
    release : Proc(IMILBitmapEffectOutputConnectorImpl*, UInt32)
    add_back_link : Proc(IMILBitmapEffectOutputConnectorImpl*, IMILBitmapEffectInputConnector, HRESULT)
    remove_back_link : Proc(IMILBitmapEffectOutputConnectorImpl*, IMILBitmapEffectInputConnector, HRESULT)
  end

  IMILBitmapEffectOutputConnectorImpl_GUID = LibC::GUID.new("21fae777-8b39-4bfa-9f2d-f3941ed36913")
  CLSID_IMILBitmapEffectOutputConnectorImpl = "21fae777-8b39-4bfa-9f2d-f3941ed36913"
  struct IMILBitmapEffectOutputConnectorImpl
    lpVtbl : IMILBitmapEffectOutputConnectorImplVTbl*
  end

  struct IMILBitmapEffectInteriorInputConnectorVTbl
    query_interface : Proc(IMILBitmapEffectInteriorInputConnector*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMILBitmapEffectInteriorInputConnector*, UInt32)
    release : Proc(IMILBitmapEffectInteriorInputConnector*, UInt32)
    get_input_connector : Proc(IMILBitmapEffectInteriorInputConnector*, IMILBitmapEffectInputConnector*, HRESULT)
  end

  IMILBitmapEffectInteriorInputConnector_GUID = LibC::GUID.new("20287e9e-86a2-4e15-953d-eb1438a5b842")
  CLSID_IMILBitmapEffectInteriorInputConnector = "20287e9e-86a2-4e15-953d-eb1438a5b842"
  struct IMILBitmapEffectInteriorInputConnector
    lpVtbl : IMILBitmapEffectInteriorInputConnectorVTbl*
  end

  struct IMILBitmapEffectInteriorOutputConnectorVTbl
    query_interface : Proc(IMILBitmapEffectInteriorOutputConnector*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMILBitmapEffectInteriorOutputConnector*, UInt32)
    release : Proc(IMILBitmapEffectInteriorOutputConnector*, UInt32)
    get_output_connector : Proc(IMILBitmapEffectInteriorOutputConnector*, IMILBitmapEffectOutputConnector*, HRESULT)
  end

  IMILBitmapEffectInteriorOutputConnector_GUID = LibC::GUID.new("00bbb6dc-acc9-4bfc-b344-8bee383dfefa")
  CLSID_IMILBitmapEffectInteriorOutputConnector = "00bbb6dc-acc9-4bfc-b344-8bee383dfefa"
  struct IMILBitmapEffectInteriorOutputConnector
    lpVtbl : IMILBitmapEffectInteriorOutputConnectorVTbl*
  end

  struct IMILBitmapEffectEventsVTbl
    query_interface : Proc(IMILBitmapEffectEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMILBitmapEffectEvents*, UInt32)
    release : Proc(IMILBitmapEffectEvents*, UInt32)
    property_change : Proc(IMILBitmapEffectEvents*, IMILBitmapEffect, UInt8*, HRESULT)
    dirty_region : Proc(IMILBitmapEffectEvents*, IMILBitmapEffect, MilRectD*, HRESULT)
  end

  IMILBitmapEffectEvents_GUID = LibC::GUID.new("2e880dd8-f8ce-457b-8199-d60bb3d7ef98")
  CLSID_IMILBitmapEffectEvents = "2e880dd8-f8ce-457b-8199-d60bb3d7ef98"
  struct IMILBitmapEffectEvents
    lpVtbl : IMILBitmapEffectEventsVTbl*
  end

end
