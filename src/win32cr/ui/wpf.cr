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

  IMILBitmapEffectConnectorInfo_GUID = "f66d2e4b-b46b-42fc-859e-3da0ecdb3c43"
  IID_IMILBitmapEffectConnectorInfo = LibC::GUID.new(0xf66d2e4b_u32, 0xb46b_u16, 0x42fc_u16, StaticArray[0x85_u8, 0x9e_u8, 0x3d_u8, 0xa0_u8, 0xec_u8, 0xdb_u8, 0x3c_u8, 0x43_u8])
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

  IMILBitmapEffectConnectionsInfo_GUID = "476b538a-c765-4237-ba4a-d6a880ff0cfc"
  IID_IMILBitmapEffectConnectionsInfo = LibC::GUID.new(0x476b538a_u32, 0xc765_u16, 0x4237_u16, StaticArray[0xba_u8, 0x4a_u8, 0xd6_u8, 0xa8_u8, 0x80_u8, 0xff_u8, 0xc_u8, 0xfc_u8])
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

  IMILBitmapEffectConnections_GUID = "c2b5d861-9b1a-4374-89b0-dec4874d6a81"
  IID_IMILBitmapEffectConnections = LibC::GUID.new(0xc2b5d861_u32, 0x9b1a_u16, 0x4374_u16, StaticArray[0x89_u8, 0xb0_u8, 0xde_u8, 0xc4_u8, 0x87_u8, 0x4d_u8, 0x6a_u8, 0x81_u8])
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

  IMILBitmapEffect_GUID = "8a6ff321-c944-4a1b-9944-9954af301258"
  IID_IMILBitmapEffect = LibC::GUID.new(0x8a6ff321_u32, 0xc944_u16, 0x4a1b_u16, StaticArray[0x99_u8, 0x44_u8, 0x99_u8, 0x54_u8, 0xaf_u8, 0x30_u8, 0x12_u8, 0x58_u8])
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

  IMILBitmapEffectImpl_GUID = "cc2468f2-9936-47be-b4af-06b5df5dbcbb"
  IID_IMILBitmapEffectImpl = LibC::GUID.new(0xcc2468f2_u32, 0x9936_u16, 0x47be_u16, StaticArray[0xb4_u8, 0xaf_u8, 0x6_u8, 0xb5_u8, 0xdf_u8, 0x5d_u8, 0xbc_u8, 0xbb_u8])
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

  IMILBitmapEffectGroup_GUID = "2f952360-698a-4ac6-81a1-bcfdf08eb8e8"
  IID_IMILBitmapEffectGroup = LibC::GUID.new(0x2f952360_u32, 0x698a_u16, 0x4ac6_u16, StaticArray[0x81_u8, 0xa1_u8, 0xbc_u8, 0xfd_u8, 0xf0_u8, 0x8e_u8, 0xb8_u8, 0xe8_u8])
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

  IMILBitmapEffectGroupImpl_GUID = "78fed518-1cfc-4807-8b85-6b6e51398f62"
  IID_IMILBitmapEffectGroupImpl = LibC::GUID.new(0x78fed518_u32, 0x1cfc_u16, 0x4807_u16, StaticArray[0x8b_u8, 0x85_u8, 0x6b_u8, 0x6e_u8, 0x51_u8, 0x39_u8, 0x8f_u8, 0x62_u8])
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

  IMILBitmapEffectRenderContext_GUID = "12a2ec7e-2d33-44b2-b334-1abb7846e390"
  IID_IMILBitmapEffectRenderContext = LibC::GUID.new(0x12a2ec7e_u32, 0x2d33_u16, 0x44b2_u16, StaticArray[0xb3_u8, 0x34_u8, 0x1a_u8, 0xbb_u8, 0x78_u8, 0x46_u8, 0xe3_u8, 0x90_u8])
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

  IMILBitmapEffectRenderContextImpl_GUID = "4d25accb-797d-4fd2-b128-dffeff84fcc3"
  IID_IMILBitmapEffectRenderContextImpl = LibC::GUID.new(0x4d25accb_u32, 0x797d_u16, 0x4fd2_u16, StaticArray[0xb1_u8, 0x28_u8, 0xdf_u8, 0xfe_u8, 0xff_u8, 0x84_u8, 0xfc_u8, 0xc3_u8])
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

  IMILBitmapEffectFactory_GUID = "33a9df34-a403-4ec7-b07e-bc0682370845"
  IID_IMILBitmapEffectFactory = LibC::GUID.new(0x33a9df34_u32, 0xa403_u16, 0x4ec7_u16, StaticArray[0xb0_u8, 0x7e_u8, 0xbc_u8, 0x6_u8, 0x82_u8, 0x37_u8, 0x8_u8, 0x45_u8])
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

  IMILBitmapEffectPrimitive_GUID = "67e31025-3091-4dfc-98d6-dd494551461d"
  IID_IMILBitmapEffectPrimitive = LibC::GUID.new(0x67e31025_u32, 0x3091_u16, 0x4dfc_u16, StaticArray[0x98_u8, 0xd6_u8, 0xdd_u8, 0x49_u8, 0x45_u8, 0x51_u8, 0x46_u8, 0x1d_u8])
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

  IMILBitmapEffectPrimitiveImpl_GUID = "ce41e00b-efa6-44e7-b007-dd042e3ae126"
  IID_IMILBitmapEffectPrimitiveImpl = LibC::GUID.new(0xce41e00b_u32, 0xefa6_u16, 0x44e7_u16, StaticArray[0xb0_u8, 0x7_u8, 0xdd_u8, 0x4_u8, 0x2e_u8, 0x3a_u8, 0xe1_u8, 0x26_u8])
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

  IMILBitmapEffects_GUID = "51ac3dce-67c5-448b-9180-ad3eabddd5dd"
  IID_IMILBitmapEffects = LibC::GUID.new(0x51ac3dce_u32, 0x67c5_u16, 0x448b_u16, StaticArray[0x91_u8, 0x80_u8, 0xad_u8, 0x3e_u8, 0xab_u8, 0xdd_u8, 0xd5_u8, 0xdd_u8])
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

  IMILBitmapEffectConnector_GUID = "f59567b3-76c1-4d47-ba1e-79f955e350ef"
  IID_IMILBitmapEffectConnector = LibC::GUID.new(0xf59567b3_u32, 0x76c1_u16, 0x4d47_u16, StaticArray[0xba_u8, 0x1e_u8, 0x79_u8, 0xf9_u8, 0x55_u8, 0xe3_u8, 0x50_u8, 0xef_u8])
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

  IMILBitmapEffectInputConnector_GUID = "a9b4ecaa-7a3c-45e7-8573-f4b81b60dd6c"
  IID_IMILBitmapEffectInputConnector = LibC::GUID.new(0xa9b4ecaa_u32, 0x7a3c_u16, 0x45e7_u16, StaticArray[0x85_u8, 0x73_u8, 0xf4_u8, 0xb8_u8, 0x1b_u8, 0x60_u8, 0xdd_u8, 0x6c_u8])
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

  IMILBitmapEffectOutputConnector_GUID = "92957aad-841b-4866-82ec-8752468b07fd"
  IID_IMILBitmapEffectOutputConnector = LibC::GUID.new(0x92957aad_u32, 0x841b_u16, 0x4866_u16, StaticArray[0x82_u8, 0xec_u8, 0x87_u8, 0x52_u8, 0x46_u8, 0x8b_u8, 0x7_u8, 0xfd_u8])
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

  IMILBitmapEffectOutputConnectorImpl_GUID = "21fae777-8b39-4bfa-9f2d-f3941ed36913"
  IID_IMILBitmapEffectOutputConnectorImpl = LibC::GUID.new(0x21fae777_u32, 0x8b39_u16, 0x4bfa_u16, StaticArray[0x9f_u8, 0x2d_u8, 0xf3_u8, 0x94_u8, 0x1e_u8, 0xd3_u8, 0x69_u8, 0x13_u8])
  struct IMILBitmapEffectOutputConnectorImpl
    lpVtbl : IMILBitmapEffectOutputConnectorImplVTbl*
  end

  struct IMILBitmapEffectInteriorInputConnectorVTbl
    query_interface : Proc(IMILBitmapEffectInteriorInputConnector*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMILBitmapEffectInteriorInputConnector*, UInt32)
    release : Proc(IMILBitmapEffectInteriorInputConnector*, UInt32)
    get_input_connector : Proc(IMILBitmapEffectInteriorInputConnector*, IMILBitmapEffectInputConnector*, HRESULT)
  end

  IMILBitmapEffectInteriorInputConnector_GUID = "20287e9e-86a2-4e15-953d-eb1438a5b842"
  IID_IMILBitmapEffectInteriorInputConnector = LibC::GUID.new(0x20287e9e_u32, 0x86a2_u16, 0x4e15_u16, StaticArray[0x95_u8, 0x3d_u8, 0xeb_u8, 0x14_u8, 0x38_u8, 0xa5_u8, 0xb8_u8, 0x42_u8])
  struct IMILBitmapEffectInteriorInputConnector
    lpVtbl : IMILBitmapEffectInteriorInputConnectorVTbl*
  end

  struct IMILBitmapEffectInteriorOutputConnectorVTbl
    query_interface : Proc(IMILBitmapEffectInteriorOutputConnector*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMILBitmapEffectInteriorOutputConnector*, UInt32)
    release : Proc(IMILBitmapEffectInteriorOutputConnector*, UInt32)
    get_output_connector : Proc(IMILBitmapEffectInteriorOutputConnector*, IMILBitmapEffectOutputConnector*, HRESULT)
  end

  IMILBitmapEffectInteriorOutputConnector_GUID = "00bbb6dc-acc9-4bfc-b344-8bee383dfefa"
  IID_IMILBitmapEffectInteriorOutputConnector = LibC::GUID.new(0xbbb6dc_u32, 0xacc9_u16, 0x4bfc_u16, StaticArray[0xb3_u8, 0x44_u8, 0x8b_u8, 0xee_u8, 0x38_u8, 0x3d_u8, 0xfe_u8, 0xfa_u8])
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

  IMILBitmapEffectEvents_GUID = "2e880dd8-f8ce-457b-8199-d60bb3d7ef98"
  IID_IMILBitmapEffectEvents = LibC::GUID.new(0x2e880dd8_u32, 0xf8ce_u16, 0x457b_u16, StaticArray[0x81_u8, 0x99_u8, 0xd6_u8, 0xb_u8, 0xb3_u8, 0xd7_u8, 0xef_u8, 0x98_u8])
  struct IMILBitmapEffectEvents
    lpVtbl : IMILBitmapEffectEventsVTbl*
  end

end