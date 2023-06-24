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
struct LibWin32::IMILBitmapEffectConnectorInfo
  def query_interface(this : IMILBitmapEffectConnectorInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMILBitmapEffectConnectorInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMILBitmapEffectConnectorInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_index(this : IMILBitmapEffectConnectorInfo*, puiindex : UInt32*) : HRESULT
    @lpVtbl.value.get_index.call(this, puiindex)
  end
  def get_optimal_format(this : IMILBitmapEffectConnectorInfo*, pformat : Guid*) : HRESULT
    @lpVtbl.value.get_optimal_format.call(this, pformat)
  end
  def get_number_formats(this : IMILBitmapEffectConnectorInfo*, pulnumberformats : UInt32*) : HRESULT
    @lpVtbl.value.get_number_formats.call(this, pulnumberformats)
  end
  def get_format(this : IMILBitmapEffectConnectorInfo*, ulindex : UInt32, pformat : Guid*) : HRESULT
    @lpVtbl.value.get_format.call(this, ulindex, pformat)
  end
end
struct LibWin32::IMILBitmapEffectConnectionsInfo
  def query_interface(this : IMILBitmapEffectConnectionsInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMILBitmapEffectConnectionsInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMILBitmapEffectConnectionsInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_number_inputs(this : IMILBitmapEffectConnectionsInfo*, puinuminputs : UInt32*) : HRESULT
    @lpVtbl.value.get_number_inputs.call(this, puinuminputs)
  end
  def get_number_outputs(this : IMILBitmapEffectConnectionsInfo*, puinumoutputs : UInt32*) : HRESULT
    @lpVtbl.value.get_number_outputs.call(this, puinumoutputs)
  end
  def get_input_connector_info(this : IMILBitmapEffectConnectionsInfo*, uiindex : UInt32, ppconnectorinfo : IMILBitmapEffectConnectorInfo*) : HRESULT
    @lpVtbl.value.get_input_connector_info.call(this, uiindex, ppconnectorinfo)
  end
  def get_output_connector_info(this : IMILBitmapEffectConnectionsInfo*, uiindex : UInt32, ppconnectorinfo : IMILBitmapEffectConnectorInfo*) : HRESULT
    @lpVtbl.value.get_output_connector_info.call(this, uiindex, ppconnectorinfo)
  end
end
struct LibWin32::IMILBitmapEffectConnections
  def query_interface(this : IMILBitmapEffectConnections*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMILBitmapEffectConnections*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMILBitmapEffectConnections*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_input_connector(this : IMILBitmapEffectConnections*, uiindex : UInt32, ppconnector : IMILBitmapEffectInputConnector*) : HRESULT
    @lpVtbl.value.get_input_connector.call(this, uiindex, ppconnector)
  end
  def get_output_connector(this : IMILBitmapEffectConnections*, uiindex : UInt32, ppconnector : IMILBitmapEffectOutputConnector*) : HRESULT
    @lpVtbl.value.get_output_connector.call(this, uiindex, ppconnector)
  end
end
struct LibWin32::IMILBitmapEffect
  def query_interface(this : IMILBitmapEffect*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMILBitmapEffect*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMILBitmapEffect*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_output(this : IMILBitmapEffect*, uiindex : UInt32, pcontext : IMILBitmapEffectRenderContext, ppbitmapsource : IWICBitmapSource*) : HRESULT
    @lpVtbl.value.get_output.call(this, uiindex, pcontext, ppbitmapsource)
  end
  def get_parent_effect(this : IMILBitmapEffect*, ppparenteffect : IMILBitmapEffectGroup*) : HRESULT
    @lpVtbl.value.get_parent_effect.call(this, ppparenteffect)
  end
  def set_input_source(this : IMILBitmapEffect*, uiindex : UInt32, pbitmapsource : IWICBitmapSource) : HRESULT
    @lpVtbl.value.set_input_source.call(this, uiindex, pbitmapsource)
  end
end
struct LibWin32::IMILBitmapEffectImpl
  def query_interface(this : IMILBitmapEffectImpl*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMILBitmapEffectImpl*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMILBitmapEffectImpl*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def is_in_place_modification_allowed(this : IMILBitmapEffectImpl*, poutputconnector : IMILBitmapEffectOutputConnector, pfmodifyinplace : Int16*) : HRESULT
    @lpVtbl.value.is_in_place_modification_allowed.call(this, poutputconnector, pfmodifyinplace)
  end
  def set_parent_effect(this : IMILBitmapEffectImpl*, pparenteffect : IMILBitmapEffectGroup) : HRESULT
    @lpVtbl.value.set_parent_effect.call(this, pparenteffect)
  end
  def get_input_source(this : IMILBitmapEffectImpl*, uiindex : UInt32, ppbitmapsource : IWICBitmapSource*) : HRESULT
    @lpVtbl.value.get_input_source.call(this, uiindex, ppbitmapsource)
  end
  def get_input_source_bounds(this : IMILBitmapEffectImpl*, uiindex : UInt32, prect : MilRectD*) : HRESULT
    @lpVtbl.value.get_input_source_bounds.call(this, uiindex, prect)
  end
  def get_input_bitmap_source(this : IMILBitmapEffectImpl*, uiindex : UInt32, prendercontext : IMILBitmapEffectRenderContext, pfmodifyinplace : Int16*, ppbitmapsource : IWICBitmapSource*) : HRESULT
    @lpVtbl.value.get_input_bitmap_source.call(this, uiindex, prendercontext, pfmodifyinplace, ppbitmapsource)
  end
  def get_output_bitmap_source(this : IMILBitmapEffectImpl*, uiindex : UInt32, prendercontext : IMILBitmapEffectRenderContext, pfmodifyinplace : Int16*, ppbitmapsource : IWICBitmapSource*) : HRESULT
    @lpVtbl.value.get_output_bitmap_source.call(this, uiindex, prendercontext, pfmodifyinplace, ppbitmapsource)
  end
  def initialize(this : IMILBitmapEffectImpl*, pinner : IUnknown) : HRESULT
    @lpVtbl.value.initialize.call(this, pinner)
  end
end
struct LibWin32::IMILBitmapEffectGroup
  def query_interface(this : IMILBitmapEffectGroup*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMILBitmapEffectGroup*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMILBitmapEffectGroup*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_interior_input_connector(this : IMILBitmapEffectGroup*, uiindex : UInt32, ppconnector : IMILBitmapEffectOutputConnector*) : HRESULT
    @lpVtbl.value.get_interior_input_connector.call(this, uiindex, ppconnector)
  end
  def get_interior_output_connector(this : IMILBitmapEffectGroup*, uiindex : UInt32, ppconnector : IMILBitmapEffectInputConnector*) : HRESULT
    @lpVtbl.value.get_interior_output_connector.call(this, uiindex, ppconnector)
  end
  def add(this : IMILBitmapEffectGroup*, peffect : IMILBitmapEffect) : HRESULT
    @lpVtbl.value.add.call(this, peffect)
  end
end
struct LibWin32::IMILBitmapEffectGroupImpl
  def query_interface(this : IMILBitmapEffectGroupImpl*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMILBitmapEffectGroupImpl*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMILBitmapEffectGroupImpl*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def preprocess(this : IMILBitmapEffectGroupImpl*, pcontext : IMILBitmapEffectRenderContext) : HRESULT
    @lpVtbl.value.preprocess.call(this, pcontext)
  end
  def get_number_children(this : IMILBitmapEffectGroupImpl*, puinumberchildren : UInt32*) : HRESULT
    @lpVtbl.value.get_number_children.call(this, puinumberchildren)
  end
  def get_children(this : IMILBitmapEffectGroupImpl*, pchildren : IMILBitmapEffects*) : HRESULT
    @lpVtbl.value.get_children.call(this, pchildren)
  end
end
struct LibWin32::IMILBitmapEffectRenderContext
  def query_interface(this : IMILBitmapEffectRenderContext*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMILBitmapEffectRenderContext*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMILBitmapEffectRenderContext*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_output_pixel_format(this : IMILBitmapEffectRenderContext*, format : Guid*) : HRESULT
    @lpVtbl.value.set_output_pixel_format.call(this, format)
  end
  def get_output_pixel_format(this : IMILBitmapEffectRenderContext*, pformat : Guid*) : HRESULT
    @lpVtbl.value.get_output_pixel_format.call(this, pformat)
  end
  def set_use_software_renderer(this : IMILBitmapEffectRenderContext*, fsoftware : Int16) : HRESULT
    @lpVtbl.value.set_use_software_renderer.call(this, fsoftware)
  end
  def set_initial_transform(this : IMILBitmapEffectRenderContext*, pmatrix : MILMatrixF*) : HRESULT
    @lpVtbl.value.set_initial_transform.call(this, pmatrix)
  end
  def get_final_transform(this : IMILBitmapEffectRenderContext*, pmatrix : MILMatrixF*) : HRESULT
    @lpVtbl.value.get_final_transform.call(this, pmatrix)
  end
  def set_output_dpi(this : IMILBitmapEffectRenderContext*, dbldpix : Float64, dbldpiy : Float64) : HRESULT
    @lpVtbl.value.set_output_dpi.call(this, dbldpix, dbldpiy)
  end
  def get_output_dpi(this : IMILBitmapEffectRenderContext*, pdbldpix : Float64*, pdbldpiy : Float64*) : HRESULT
    @lpVtbl.value.get_output_dpi.call(this, pdbldpix, pdbldpiy)
  end
  def set_region_of_interest(this : IMILBitmapEffectRenderContext*, prect : MilRectD*) : HRESULT
    @lpVtbl.value.set_region_of_interest.call(this, prect)
  end
end
struct LibWin32::IMILBitmapEffectRenderContextImpl
  def query_interface(this : IMILBitmapEffectRenderContextImpl*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMILBitmapEffectRenderContextImpl*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMILBitmapEffectRenderContextImpl*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_use_software_renderer(this : IMILBitmapEffectRenderContextImpl*, pfsoftware : Int16*) : HRESULT
    @lpVtbl.value.get_use_software_renderer.call(this, pfsoftware)
  end
  def get_transform(this : IMILBitmapEffectRenderContextImpl*, pmatrix : MILMatrixF*) : HRESULT
    @lpVtbl.value.get_transform.call(this, pmatrix)
  end
  def update_transform(this : IMILBitmapEffectRenderContextImpl*, pmatrix : MILMatrixF*) : HRESULT
    @lpVtbl.value.update_transform.call(this, pmatrix)
  end
  def get_output_bounds(this : IMILBitmapEffectRenderContextImpl*, prect : MilRectD*) : HRESULT
    @lpVtbl.value.get_output_bounds.call(this, prect)
  end
  def update_output_bounds(this : IMILBitmapEffectRenderContextImpl*, prect : MilRectD*) : HRESULT
    @lpVtbl.value.update_output_bounds.call(this, prect)
  end
end
struct LibWin32::IMILBitmapEffectFactory
  def query_interface(this : IMILBitmapEffectFactory*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMILBitmapEffectFactory*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMILBitmapEffectFactory*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_effect(this : IMILBitmapEffectFactory*, pguideffect : Guid*, ppeffect : IMILBitmapEffect*) : HRESULT
    @lpVtbl.value.create_effect.call(this, pguideffect, ppeffect)
  end
  def create_context(this : IMILBitmapEffectFactory*, ppcontext : IMILBitmapEffectRenderContext*) : HRESULT
    @lpVtbl.value.create_context.call(this, ppcontext)
  end
  def create_effect_outer(this : IMILBitmapEffectFactory*, ppeffect : IMILBitmapEffect*) : HRESULT
    @lpVtbl.value.create_effect_outer.call(this, ppeffect)
  end
end
struct LibWin32::IMILBitmapEffectPrimitive
  def query_interface(this : IMILBitmapEffectPrimitive*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMILBitmapEffectPrimitive*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMILBitmapEffectPrimitive*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_output(this : IMILBitmapEffectPrimitive*, uiindex : UInt32, pcontext : IMILBitmapEffectRenderContext, pfmodifyinplace : Int16*, ppbitmapsource : IWICBitmapSource*) : HRESULT
    @lpVtbl.value.get_output.call(this, uiindex, pcontext, pfmodifyinplace, ppbitmapsource)
  end
  def transform_point(this : IMILBitmapEffectPrimitive*, uiindex : UInt32, p : MilPoint2D*, fforwardtransform : Int16, pcontext : IMILBitmapEffectRenderContext, pfpointtransformed : Int16*) : HRESULT
    @lpVtbl.value.transform_point.call(this, uiindex, p, fforwardtransform, pcontext, pfpointtransformed)
  end
  def transform_rect(this : IMILBitmapEffectPrimitive*, uiindex : UInt32, p : MilRectD*, fforwardtransform : Int16, pcontext : IMILBitmapEffectRenderContext) : HRESULT
    @lpVtbl.value.transform_rect.call(this, uiindex, p, fforwardtransform, pcontext)
  end
  def has_affine_transform(this : IMILBitmapEffectPrimitive*, uiindex : UInt32, pfaffine : Int16*) : HRESULT
    @lpVtbl.value.has_affine_transform.call(this, uiindex, pfaffine)
  end
  def has_inverse_transform(this : IMILBitmapEffectPrimitive*, uiindex : UInt32, pfhasinverse : Int16*) : HRESULT
    @lpVtbl.value.has_inverse_transform.call(this, uiindex, pfhasinverse)
  end
  def get_affine_matrix(this : IMILBitmapEffectPrimitive*, uiindex : UInt32, pmatrix : MilMatrix3x2D*) : HRESULT
    @lpVtbl.value.get_affine_matrix.call(this, uiindex, pmatrix)
  end
end
struct LibWin32::IMILBitmapEffectPrimitiveImpl
  def query_interface(this : IMILBitmapEffectPrimitiveImpl*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMILBitmapEffectPrimitiveImpl*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMILBitmapEffectPrimitiveImpl*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def is_dirty(this : IMILBitmapEffectPrimitiveImpl*, uioutputindex : UInt32, pfdirty : Int16*) : HRESULT
    @lpVtbl.value.is_dirty.call(this, uioutputindex, pfdirty)
  end
  def is_volatile(this : IMILBitmapEffectPrimitiveImpl*, uioutputindex : UInt32, pfvolatile : Int16*) : HRESULT
    @lpVtbl.value.is_volatile.call(this, uioutputindex, pfvolatile)
  end
end
struct LibWin32::IMILBitmapEffects
  def query_interface(this : IMILBitmapEffects*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMILBitmapEffects*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMILBitmapEffects*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def _new_enum(this : IMILBitmapEffects*, ppiureturn : IUnknown*) : HRESULT
    @lpVtbl.value._new_enum.call(this, ppiureturn)
  end
  def get_parent(this : IMILBitmapEffects*, ppeffect : IMILBitmapEffectGroup*) : HRESULT
    @lpVtbl.value.get_parent.call(this, ppeffect)
  end
  def item(this : IMILBitmapEffects*, uindex : UInt32, ppeffect : IMILBitmapEffect*) : HRESULT
    @lpVtbl.value.item.call(this, uindex, ppeffect)
  end
  def get_count(this : IMILBitmapEffects*, puicount : UInt32*) : HRESULT
    @lpVtbl.value.get_count.call(this, puicount)
  end
end
struct LibWin32::IMILBitmapEffectConnector
  def query_interface(this : IMILBitmapEffectConnector*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMILBitmapEffectConnector*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMILBitmapEffectConnector*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_index(this : IMILBitmapEffectConnector*, puiindex : UInt32*) : HRESULT
    @lpVtbl.value.get_index.call(this, puiindex)
  end
  def get_optimal_format(this : IMILBitmapEffectConnector*, pformat : Guid*) : HRESULT
    @lpVtbl.value.get_optimal_format.call(this, pformat)
  end
  def get_number_formats(this : IMILBitmapEffectConnector*, pulnumberformats : UInt32*) : HRESULT
    @lpVtbl.value.get_number_formats.call(this, pulnumberformats)
  end
  def get_format(this : IMILBitmapEffectConnector*, ulindex : UInt32, pformat : Guid*) : HRESULT
    @lpVtbl.value.get_format.call(this, ulindex, pformat)
  end
  def is_connected(this : IMILBitmapEffectConnector*, pfconnected : Int16*) : HRESULT
    @lpVtbl.value.is_connected.call(this, pfconnected)
  end
  def get_bitmap_effect(this : IMILBitmapEffectConnector*, ppeffect : IMILBitmapEffect*) : HRESULT
    @lpVtbl.value.get_bitmap_effect.call(this, ppeffect)
  end
end
struct LibWin32::IMILBitmapEffectInputConnector
  def query_interface(this : IMILBitmapEffectInputConnector*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMILBitmapEffectInputConnector*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMILBitmapEffectInputConnector*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_index(this : IMILBitmapEffectInputConnector*, puiindex : UInt32*) : HRESULT
    @lpVtbl.value.get_index.call(this, puiindex)
  end
  def get_optimal_format(this : IMILBitmapEffectInputConnector*, pformat : Guid*) : HRESULT
    @lpVtbl.value.get_optimal_format.call(this, pformat)
  end
  def get_number_formats(this : IMILBitmapEffectInputConnector*, pulnumberformats : UInt32*) : HRESULT
    @lpVtbl.value.get_number_formats.call(this, pulnumberformats)
  end
  def get_format(this : IMILBitmapEffectInputConnector*, ulindex : UInt32, pformat : Guid*) : HRESULT
    @lpVtbl.value.get_format.call(this, ulindex, pformat)
  end
  def is_connected(this : IMILBitmapEffectInputConnector*, pfconnected : Int16*) : HRESULT
    @lpVtbl.value.is_connected.call(this, pfconnected)
  end
  def get_bitmap_effect(this : IMILBitmapEffectInputConnector*, ppeffect : IMILBitmapEffect*) : HRESULT
    @lpVtbl.value.get_bitmap_effect.call(this, ppeffect)
  end
  def connect_to(this : IMILBitmapEffectInputConnector*, pconnector : IMILBitmapEffectOutputConnector) : HRESULT
    @lpVtbl.value.connect_to.call(this, pconnector)
  end
  def get_connection(this : IMILBitmapEffectInputConnector*, ppconnector : IMILBitmapEffectOutputConnector*) : HRESULT
    @lpVtbl.value.get_connection.call(this, ppconnector)
  end
end
struct LibWin32::IMILBitmapEffectOutputConnector
  def query_interface(this : IMILBitmapEffectOutputConnector*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMILBitmapEffectOutputConnector*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMILBitmapEffectOutputConnector*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_index(this : IMILBitmapEffectOutputConnector*, puiindex : UInt32*) : HRESULT
    @lpVtbl.value.get_index.call(this, puiindex)
  end
  def get_optimal_format(this : IMILBitmapEffectOutputConnector*, pformat : Guid*) : HRESULT
    @lpVtbl.value.get_optimal_format.call(this, pformat)
  end
  def get_number_formats(this : IMILBitmapEffectOutputConnector*, pulnumberformats : UInt32*) : HRESULT
    @lpVtbl.value.get_number_formats.call(this, pulnumberformats)
  end
  def get_format(this : IMILBitmapEffectOutputConnector*, ulindex : UInt32, pformat : Guid*) : HRESULT
    @lpVtbl.value.get_format.call(this, ulindex, pformat)
  end
  def is_connected(this : IMILBitmapEffectOutputConnector*, pfconnected : Int16*) : HRESULT
    @lpVtbl.value.is_connected.call(this, pfconnected)
  end
  def get_bitmap_effect(this : IMILBitmapEffectOutputConnector*, ppeffect : IMILBitmapEffect*) : HRESULT
    @lpVtbl.value.get_bitmap_effect.call(this, ppeffect)
  end
  def get_number_connections(this : IMILBitmapEffectOutputConnector*, puinumberconnections : UInt32*) : HRESULT
    @lpVtbl.value.get_number_connections.call(this, puinumberconnections)
  end
  def get_connection(this : IMILBitmapEffectOutputConnector*, uiindex : UInt32, ppconnection : IMILBitmapEffectInputConnector*) : HRESULT
    @lpVtbl.value.get_connection.call(this, uiindex, ppconnection)
  end
end
struct LibWin32::IMILBitmapEffectOutputConnectorImpl
  def query_interface(this : IMILBitmapEffectOutputConnectorImpl*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMILBitmapEffectOutputConnectorImpl*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMILBitmapEffectOutputConnectorImpl*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def add_back_link(this : IMILBitmapEffectOutputConnectorImpl*, pconnection : IMILBitmapEffectInputConnector) : HRESULT
    @lpVtbl.value.add_back_link.call(this, pconnection)
  end
  def remove_back_link(this : IMILBitmapEffectOutputConnectorImpl*, pconnection : IMILBitmapEffectInputConnector) : HRESULT
    @lpVtbl.value.remove_back_link.call(this, pconnection)
  end
end
struct LibWin32::IMILBitmapEffectInteriorInputConnector
  def query_interface(this : IMILBitmapEffectInteriorInputConnector*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMILBitmapEffectInteriorInputConnector*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMILBitmapEffectInteriorInputConnector*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_input_connector(this : IMILBitmapEffectInteriorInputConnector*, pinputconnector : IMILBitmapEffectInputConnector*) : HRESULT
    @lpVtbl.value.get_input_connector.call(this, pinputconnector)
  end
end
struct LibWin32::IMILBitmapEffectInteriorOutputConnector
  def query_interface(this : IMILBitmapEffectInteriorOutputConnector*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMILBitmapEffectInteriorOutputConnector*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMILBitmapEffectInteriorOutputConnector*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_output_connector(this : IMILBitmapEffectInteriorOutputConnector*, poutputconnector : IMILBitmapEffectOutputConnector*) : HRESULT
    @lpVtbl.value.get_output_connector.call(this, poutputconnector)
  end
end
struct LibWin32::IMILBitmapEffectEvents
  def query_interface(this : IMILBitmapEffectEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMILBitmapEffectEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMILBitmapEffectEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def property_change(this : IMILBitmapEffectEvents*, peffect : IMILBitmapEffect, bstrpropertyname : UInt8*) : HRESULT
    @lpVtbl.value.property_change.call(this, peffect, bstrpropertyname)
  end
  def dirty_region(this : IMILBitmapEffectEvents*, peffect : IMILBitmapEffect, prect : MilRectD*) : HRESULT
    @lpVtbl.value.dirty_region.call(this, peffect, prect)
  end
end
