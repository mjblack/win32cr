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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_index : UInt64
    get_optimal_format : UInt64
    get_number_formats : UInt64
    get_format : UInt64
  end

  IMILBitmapEffectConnectorInfo_GUID = "f66d2e4b-b46b-42fc-859e-3da0ecdb3c43"
  IID_IMILBitmapEffectConnectorInfo = LibC::GUID.new(0xf66d2e4b_u32, 0xb46b_u16, 0x42fc_u16, StaticArray[0x85_u8, 0x9e_u8, 0x3d_u8, 0xa0_u8, 0xec_u8, 0xdb_u8, 0x3c_u8, 0x43_u8])
  struct IMILBitmapEffectConnectorInfo
    lpVtbl : IMILBitmapEffectConnectorInfoVTbl*
  end

  struct IMILBitmapEffectConnectionsInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_number_inputs : UInt64
    get_number_outputs : UInt64
    get_input_connector_info : UInt64
    get_output_connector_info : UInt64
  end

  IMILBitmapEffectConnectionsInfo_GUID = "476b538a-c765-4237-ba4a-d6a880ff0cfc"
  IID_IMILBitmapEffectConnectionsInfo = LibC::GUID.new(0x476b538a_u32, 0xc765_u16, 0x4237_u16, StaticArray[0xba_u8, 0x4a_u8, 0xd6_u8, 0xa8_u8, 0x80_u8, 0xff_u8, 0xc_u8, 0xfc_u8])
  struct IMILBitmapEffectConnectionsInfo
    lpVtbl : IMILBitmapEffectConnectionsInfoVTbl*
  end

  struct IMILBitmapEffectConnectionsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_input_connector : UInt64
    get_output_connector : UInt64
  end

  IMILBitmapEffectConnections_GUID = "c2b5d861-9b1a-4374-89b0-dec4874d6a81"
  IID_IMILBitmapEffectConnections = LibC::GUID.new(0xc2b5d861_u32, 0x9b1a_u16, 0x4374_u16, StaticArray[0x89_u8, 0xb0_u8, 0xde_u8, 0xc4_u8, 0x87_u8, 0x4d_u8, 0x6a_u8, 0x81_u8])
  struct IMILBitmapEffectConnections
    lpVtbl : IMILBitmapEffectConnectionsVTbl*
  end

  struct IMILBitmapEffectVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_output : UInt64
    get_parent_effect : UInt64
    set_input_source : UInt64
  end

  IMILBitmapEffect_GUID = "8a6ff321-c944-4a1b-9944-9954af301258"
  IID_IMILBitmapEffect = LibC::GUID.new(0x8a6ff321_u32, 0xc944_u16, 0x4a1b_u16, StaticArray[0x99_u8, 0x44_u8, 0x99_u8, 0x54_u8, 0xaf_u8, 0x30_u8, 0x12_u8, 0x58_u8])
  struct IMILBitmapEffect
    lpVtbl : IMILBitmapEffectVTbl*
  end

  struct IMILBitmapEffectImplVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    is_in_place_modification_allowed : UInt64
    set_parent_effect : UInt64
    get_input_source : UInt64
    get_input_source_bounds : UInt64
    get_input_bitmap_source : UInt64
    get_output_bitmap_source : UInt64
    initialize : UInt64
  end

  IMILBitmapEffectImpl_GUID = "cc2468f2-9936-47be-b4af-06b5df5dbcbb"
  IID_IMILBitmapEffectImpl = LibC::GUID.new(0xcc2468f2_u32, 0x9936_u16, 0x47be_u16, StaticArray[0xb4_u8, 0xaf_u8, 0x6_u8, 0xb5_u8, 0xdf_u8, 0x5d_u8, 0xbc_u8, 0xbb_u8])
  struct IMILBitmapEffectImpl
    lpVtbl : IMILBitmapEffectImplVTbl*
  end

  struct IMILBitmapEffectGroupVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_interior_input_connector : UInt64
    get_interior_output_connector : UInt64
    add : UInt64
  end

  IMILBitmapEffectGroup_GUID = "2f952360-698a-4ac6-81a1-bcfdf08eb8e8"
  IID_IMILBitmapEffectGroup = LibC::GUID.new(0x2f952360_u32, 0x698a_u16, 0x4ac6_u16, StaticArray[0x81_u8, 0xa1_u8, 0xbc_u8, 0xfd_u8, 0xf0_u8, 0x8e_u8, 0xb8_u8, 0xe8_u8])
  struct IMILBitmapEffectGroup
    lpVtbl : IMILBitmapEffectGroupVTbl*
  end

  struct IMILBitmapEffectGroupImplVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    preprocess : UInt64
    get_number_children : UInt64
    get_children : UInt64
  end

  IMILBitmapEffectGroupImpl_GUID = "78fed518-1cfc-4807-8b85-6b6e51398f62"
  IID_IMILBitmapEffectGroupImpl = LibC::GUID.new(0x78fed518_u32, 0x1cfc_u16, 0x4807_u16, StaticArray[0x8b_u8, 0x85_u8, 0x6b_u8, 0x6e_u8, 0x51_u8, 0x39_u8, 0x8f_u8, 0x62_u8])
  struct IMILBitmapEffectGroupImpl
    lpVtbl : IMILBitmapEffectGroupImplVTbl*
  end

  struct IMILBitmapEffectRenderContextVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_output_pixel_format : UInt64
    get_output_pixel_format : UInt64
    set_use_software_renderer : UInt64
    set_initial_transform : UInt64
    get_final_transform : UInt64
    set_output_dpi : UInt64
    get_output_dpi : UInt64
    set_region_of_interest : UInt64
  end

  IMILBitmapEffectRenderContext_GUID = "12a2ec7e-2d33-44b2-b334-1abb7846e390"
  IID_IMILBitmapEffectRenderContext = LibC::GUID.new(0x12a2ec7e_u32, 0x2d33_u16, 0x44b2_u16, StaticArray[0xb3_u8, 0x34_u8, 0x1a_u8, 0xbb_u8, 0x78_u8, 0x46_u8, 0xe3_u8, 0x90_u8])
  struct IMILBitmapEffectRenderContext
    lpVtbl : IMILBitmapEffectRenderContextVTbl*
  end

  struct IMILBitmapEffectRenderContextImplVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_use_software_renderer : UInt64
    get_transform : UInt64
    update_transform : UInt64
    get_output_bounds : UInt64
    update_output_bounds : UInt64
  end

  IMILBitmapEffectRenderContextImpl_GUID = "4d25accb-797d-4fd2-b128-dffeff84fcc3"
  IID_IMILBitmapEffectRenderContextImpl = LibC::GUID.new(0x4d25accb_u32, 0x797d_u16, 0x4fd2_u16, StaticArray[0xb1_u8, 0x28_u8, 0xdf_u8, 0xfe_u8, 0xff_u8, 0x84_u8, 0xfc_u8, 0xc3_u8])
  struct IMILBitmapEffectRenderContextImpl
    lpVtbl : IMILBitmapEffectRenderContextImplVTbl*
  end

  struct IMILBitmapEffectFactoryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_effect : UInt64
    create_context : UInt64
    create_effect_outer : UInt64
  end

  IMILBitmapEffectFactory_GUID = "33a9df34-a403-4ec7-b07e-bc0682370845"
  IID_IMILBitmapEffectFactory = LibC::GUID.new(0x33a9df34_u32, 0xa403_u16, 0x4ec7_u16, StaticArray[0xb0_u8, 0x7e_u8, 0xbc_u8, 0x6_u8, 0x82_u8, 0x37_u8, 0x8_u8, 0x45_u8])
  struct IMILBitmapEffectFactory
    lpVtbl : IMILBitmapEffectFactoryVTbl*
  end

  struct IMILBitmapEffectPrimitiveVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_output : UInt64
    transform_point : UInt64
    transform_rect : UInt64
    has_affine_transform : UInt64
    has_inverse_transform : UInt64
    get_affine_matrix : UInt64
  end

  IMILBitmapEffectPrimitive_GUID = "67e31025-3091-4dfc-98d6-dd494551461d"
  IID_IMILBitmapEffectPrimitive = LibC::GUID.new(0x67e31025_u32, 0x3091_u16, 0x4dfc_u16, StaticArray[0x98_u8, 0xd6_u8, 0xdd_u8, 0x49_u8, 0x45_u8, 0x51_u8, 0x46_u8, 0x1d_u8])
  struct IMILBitmapEffectPrimitive
    lpVtbl : IMILBitmapEffectPrimitiveVTbl*
  end

  struct IMILBitmapEffectPrimitiveImplVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    is_dirty : UInt64
    is_volatile : UInt64
  end

  IMILBitmapEffectPrimitiveImpl_GUID = "ce41e00b-efa6-44e7-b007-dd042e3ae126"
  IID_IMILBitmapEffectPrimitiveImpl = LibC::GUID.new(0xce41e00b_u32, 0xefa6_u16, 0x44e7_u16, StaticArray[0xb0_u8, 0x7_u8, 0xdd_u8, 0x4_u8, 0x2e_u8, 0x3a_u8, 0xe1_u8, 0x26_u8])
  struct IMILBitmapEffectPrimitiveImpl
    lpVtbl : IMILBitmapEffectPrimitiveImplVTbl*
  end

  struct IMILBitmapEffectsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    _new_enum : UInt64
    get_parent : UInt64
    item : UInt64
    get_count : UInt64
  end

  IMILBitmapEffects_GUID = "51ac3dce-67c5-448b-9180-ad3eabddd5dd"
  IID_IMILBitmapEffects = LibC::GUID.new(0x51ac3dce_u32, 0x67c5_u16, 0x448b_u16, StaticArray[0x91_u8, 0x80_u8, 0xad_u8, 0x3e_u8, 0xab_u8, 0xdd_u8, 0xd5_u8, 0xdd_u8])
  struct IMILBitmapEffects
    lpVtbl : IMILBitmapEffectsVTbl*
  end

  struct IMILBitmapEffectConnectorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_index : UInt64
    get_optimal_format : UInt64
    get_number_formats : UInt64
    get_format : UInt64
    is_connected : UInt64
    get_bitmap_effect : UInt64
  end

  IMILBitmapEffectConnector_GUID = "f59567b3-76c1-4d47-ba1e-79f955e350ef"
  IID_IMILBitmapEffectConnector = LibC::GUID.new(0xf59567b3_u32, 0x76c1_u16, 0x4d47_u16, StaticArray[0xba_u8, 0x1e_u8, 0x79_u8, 0xf9_u8, 0x55_u8, 0xe3_u8, 0x50_u8, 0xef_u8])
  struct IMILBitmapEffectConnector
    lpVtbl : IMILBitmapEffectConnectorVTbl*
  end

  struct IMILBitmapEffectInputConnectorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_index : UInt64
    get_optimal_format : UInt64
    get_number_formats : UInt64
    get_format : UInt64
    is_connected : UInt64
    get_bitmap_effect : UInt64
    connect_to : UInt64
    get_connection : UInt64
  end

  IMILBitmapEffectInputConnector_GUID = "a9b4ecaa-7a3c-45e7-8573-f4b81b60dd6c"
  IID_IMILBitmapEffectInputConnector = LibC::GUID.new(0xa9b4ecaa_u32, 0x7a3c_u16, 0x45e7_u16, StaticArray[0x85_u8, 0x73_u8, 0xf4_u8, 0xb8_u8, 0x1b_u8, 0x60_u8, 0xdd_u8, 0x6c_u8])
  struct IMILBitmapEffectInputConnector
    lpVtbl : IMILBitmapEffectInputConnectorVTbl*
  end

  struct IMILBitmapEffectOutputConnectorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_index : UInt64
    get_optimal_format : UInt64
    get_number_formats : UInt64
    get_format : UInt64
    is_connected : UInt64
    get_bitmap_effect : UInt64
    get_number_connections : UInt64
    get_connection : UInt64
  end

  IMILBitmapEffectOutputConnector_GUID = "92957aad-841b-4866-82ec-8752468b07fd"
  IID_IMILBitmapEffectOutputConnector = LibC::GUID.new(0x92957aad_u32, 0x841b_u16, 0x4866_u16, StaticArray[0x82_u8, 0xec_u8, 0x87_u8, 0x52_u8, 0x46_u8, 0x8b_u8, 0x7_u8, 0xfd_u8])
  struct IMILBitmapEffectOutputConnector
    lpVtbl : IMILBitmapEffectOutputConnectorVTbl*
  end

  struct IMILBitmapEffectOutputConnectorImplVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_back_link : UInt64
    remove_back_link : UInt64
  end

  IMILBitmapEffectOutputConnectorImpl_GUID = "21fae777-8b39-4bfa-9f2d-f3941ed36913"
  IID_IMILBitmapEffectOutputConnectorImpl = LibC::GUID.new(0x21fae777_u32, 0x8b39_u16, 0x4bfa_u16, StaticArray[0x9f_u8, 0x2d_u8, 0xf3_u8, 0x94_u8, 0x1e_u8, 0xd3_u8, 0x69_u8, 0x13_u8])
  struct IMILBitmapEffectOutputConnectorImpl
    lpVtbl : IMILBitmapEffectOutputConnectorImplVTbl*
  end

  struct IMILBitmapEffectInteriorInputConnectorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_input_connector : UInt64
  end

  IMILBitmapEffectInteriorInputConnector_GUID = "20287e9e-86a2-4e15-953d-eb1438a5b842"
  IID_IMILBitmapEffectInteriorInputConnector = LibC::GUID.new(0x20287e9e_u32, 0x86a2_u16, 0x4e15_u16, StaticArray[0x95_u8, 0x3d_u8, 0xeb_u8, 0x14_u8, 0x38_u8, 0xa5_u8, 0xb8_u8, 0x42_u8])
  struct IMILBitmapEffectInteriorInputConnector
    lpVtbl : IMILBitmapEffectInteriorInputConnectorVTbl*
  end

  struct IMILBitmapEffectInteriorOutputConnectorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_output_connector : UInt64
  end

  IMILBitmapEffectInteriorOutputConnector_GUID = "00bbb6dc-acc9-4bfc-b344-8bee383dfefa"
  IID_IMILBitmapEffectInteriorOutputConnector = LibC::GUID.new(0xbbb6dc_u32, 0xacc9_u16, 0x4bfc_u16, StaticArray[0xb3_u8, 0x44_u8, 0x8b_u8, 0xee_u8, 0x38_u8, 0x3d_u8, 0xfe_u8, 0xfa_u8])
  struct IMILBitmapEffectInteriorOutputConnector
    lpVtbl : IMILBitmapEffectInteriorOutputConnectorVTbl*
  end

  struct IMILBitmapEffectEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    property_change : UInt64
    dirty_region : UInt64
  end

  IMILBitmapEffectEvents_GUID = "2e880dd8-f8ce-457b-8199-d60bb3d7ef98"
  IID_IMILBitmapEffectEvents = LibC::GUID.new(0x2e880dd8_u32, 0xf8ce_u16, 0x457b_u16, StaticArray[0x81_u8, 0x99_u8, 0xd6_u8, 0xb_u8, 0xb3_u8, 0xd7_u8, 0xef_u8, 0x98_u8])
  struct IMILBitmapEffectEvents
    lpVtbl : IMILBitmapEffectEventsVTbl*
  end

end
struct LibWin32::IMILBitmapEffectConnectorInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_index(puiindex : UInt32*) : HRESULT
    @lpVtbl.value.get_index.unsafe_as(Proc(UInt32*, HRESULT)).call(puiindex)
  end
  def get_optimal_format(pformat : Guid*) : HRESULT
    @lpVtbl.value.get_optimal_format.unsafe_as(Proc(Guid*, HRESULT)).call(pformat)
  end
  def get_number_formats(pulnumberformats : UInt32*) : HRESULT
    @lpVtbl.value.get_number_formats.unsafe_as(Proc(UInt32*, HRESULT)).call(pulnumberformats)
  end
  def get_format(ulindex : UInt32, pformat : Guid*) : HRESULT
    @lpVtbl.value.get_format.unsafe_as(Proc(UInt32, Guid*, HRESULT)).call(ulindex, pformat)
  end
end
struct LibWin32::IMILBitmapEffectConnectionsInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_number_inputs(puinuminputs : UInt32*) : HRESULT
    @lpVtbl.value.get_number_inputs.unsafe_as(Proc(UInt32*, HRESULT)).call(puinuminputs)
  end
  def get_number_outputs(puinumoutputs : UInt32*) : HRESULT
    @lpVtbl.value.get_number_outputs.unsafe_as(Proc(UInt32*, HRESULT)).call(puinumoutputs)
  end
  def get_input_connector_info(uiindex : UInt32, ppconnectorinfo : IMILBitmapEffectConnectorInfo*) : HRESULT
    @lpVtbl.value.get_input_connector_info.unsafe_as(Proc(UInt32, IMILBitmapEffectConnectorInfo*, HRESULT)).call(uiindex, ppconnectorinfo)
  end
  def get_output_connector_info(uiindex : UInt32, ppconnectorinfo : IMILBitmapEffectConnectorInfo*) : HRESULT
    @lpVtbl.value.get_output_connector_info.unsafe_as(Proc(UInt32, IMILBitmapEffectConnectorInfo*, HRESULT)).call(uiindex, ppconnectorinfo)
  end
end
struct LibWin32::IMILBitmapEffectConnections
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_input_connector(uiindex : UInt32, ppconnector : IMILBitmapEffectInputConnector*) : HRESULT
    @lpVtbl.value.get_input_connector.unsafe_as(Proc(UInt32, IMILBitmapEffectInputConnector*, HRESULT)).call(uiindex, ppconnector)
  end
  def get_output_connector(uiindex : UInt32, ppconnector : IMILBitmapEffectOutputConnector*) : HRESULT
    @lpVtbl.value.get_output_connector.unsafe_as(Proc(UInt32, IMILBitmapEffectOutputConnector*, HRESULT)).call(uiindex, ppconnector)
  end
end
struct LibWin32::IMILBitmapEffect
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_output(uiindex : UInt32, pcontext : IMILBitmapEffectRenderContext, ppbitmapsource : IWICBitmapSource*) : HRESULT
    @lpVtbl.value.get_output.unsafe_as(Proc(UInt32, IMILBitmapEffectRenderContext, IWICBitmapSource*, HRESULT)).call(uiindex, pcontext, ppbitmapsource)
  end
  def get_parent_effect(ppparenteffect : IMILBitmapEffectGroup*) : HRESULT
    @lpVtbl.value.get_parent_effect.unsafe_as(Proc(IMILBitmapEffectGroup*, HRESULT)).call(ppparenteffect)
  end
  def set_input_source(uiindex : UInt32, pbitmapsource : IWICBitmapSource) : HRESULT
    @lpVtbl.value.set_input_source.unsafe_as(Proc(UInt32, IWICBitmapSource, HRESULT)).call(uiindex, pbitmapsource)
  end
end
struct LibWin32::IMILBitmapEffectImpl
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def is_in_place_modification_allowed(poutputconnector : IMILBitmapEffectOutputConnector, pfmodifyinplace : Int16*) : HRESULT
    @lpVtbl.value.is_in_place_modification_allowed.unsafe_as(Proc(IMILBitmapEffectOutputConnector, Int16*, HRESULT)).call(poutputconnector, pfmodifyinplace)
  end
  def set_parent_effect(pparenteffect : IMILBitmapEffectGroup) : HRESULT
    @lpVtbl.value.set_parent_effect.unsafe_as(Proc(IMILBitmapEffectGroup, HRESULT)).call(pparenteffect)
  end
  def get_input_source(uiindex : UInt32, ppbitmapsource : IWICBitmapSource*) : HRESULT
    @lpVtbl.value.get_input_source.unsafe_as(Proc(UInt32, IWICBitmapSource*, HRESULT)).call(uiindex, ppbitmapsource)
  end
  def get_input_source_bounds(uiindex : UInt32, prect : MilRectD*) : HRESULT
    @lpVtbl.value.get_input_source_bounds.unsafe_as(Proc(UInt32, MilRectD*, HRESULT)).call(uiindex, prect)
  end
  def get_input_bitmap_source(uiindex : UInt32, prendercontext : IMILBitmapEffectRenderContext, pfmodifyinplace : Int16*, ppbitmapsource : IWICBitmapSource*) : HRESULT
    @lpVtbl.value.get_input_bitmap_source.unsafe_as(Proc(UInt32, IMILBitmapEffectRenderContext, Int16*, IWICBitmapSource*, HRESULT)).call(uiindex, prendercontext, pfmodifyinplace, ppbitmapsource)
  end
  def get_output_bitmap_source(uiindex : UInt32, prendercontext : IMILBitmapEffectRenderContext, pfmodifyinplace : Int16*, ppbitmapsource : IWICBitmapSource*) : HRESULT
    @lpVtbl.value.get_output_bitmap_source.unsafe_as(Proc(UInt32, IMILBitmapEffectRenderContext, Int16*, IWICBitmapSource*, HRESULT)).call(uiindex, prendercontext, pfmodifyinplace, ppbitmapsource)
  end
  def initialize(pinner : IUnknown) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(IUnknown, HRESULT)).call(pinner)
  end
end
struct LibWin32::IMILBitmapEffectGroup
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_interior_input_connector(uiindex : UInt32, ppconnector : IMILBitmapEffectOutputConnector*) : HRESULT
    @lpVtbl.value.get_interior_input_connector.unsafe_as(Proc(UInt32, IMILBitmapEffectOutputConnector*, HRESULT)).call(uiindex, ppconnector)
  end
  def get_interior_output_connector(uiindex : UInt32, ppconnector : IMILBitmapEffectInputConnector*) : HRESULT
    @lpVtbl.value.get_interior_output_connector.unsafe_as(Proc(UInt32, IMILBitmapEffectInputConnector*, HRESULT)).call(uiindex, ppconnector)
  end
  def add(peffect : IMILBitmapEffect) : HRESULT
    @lpVtbl.value.add.unsafe_as(Proc(IMILBitmapEffect, HRESULT)).call(peffect)
  end
end
struct LibWin32::IMILBitmapEffectGroupImpl
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def preprocess(pcontext : IMILBitmapEffectRenderContext) : HRESULT
    @lpVtbl.value.preprocess.unsafe_as(Proc(IMILBitmapEffectRenderContext, HRESULT)).call(pcontext)
  end
  def get_number_children(puinumberchildren : UInt32*) : HRESULT
    @lpVtbl.value.get_number_children.unsafe_as(Proc(UInt32*, HRESULT)).call(puinumberchildren)
  end
  def get_children(pchildren : IMILBitmapEffects*) : HRESULT
    @lpVtbl.value.get_children.unsafe_as(Proc(IMILBitmapEffects*, HRESULT)).call(pchildren)
  end
end
struct LibWin32::IMILBitmapEffectRenderContext
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_output_pixel_format(format : Guid*) : HRESULT
    @lpVtbl.value.set_output_pixel_format.unsafe_as(Proc(Guid*, HRESULT)).call(format)
  end
  def get_output_pixel_format(pformat : Guid*) : HRESULT
    @lpVtbl.value.get_output_pixel_format.unsafe_as(Proc(Guid*, HRESULT)).call(pformat)
  end
  def set_use_software_renderer(fsoftware : Int16) : HRESULT
    @lpVtbl.value.set_use_software_renderer.unsafe_as(Proc(Int16, HRESULT)).call(fsoftware)
  end
  def set_initial_transform(pmatrix : MILMatrixF*) : HRESULT
    @lpVtbl.value.set_initial_transform.unsafe_as(Proc(MILMatrixF*, HRESULT)).call(pmatrix)
  end
  def get_final_transform(pmatrix : MILMatrixF*) : HRESULT
    @lpVtbl.value.get_final_transform.unsafe_as(Proc(MILMatrixF*, HRESULT)).call(pmatrix)
  end
  def set_output_dpi(dbldpix : Float64, dbldpiy : Float64) : HRESULT
    @lpVtbl.value.set_output_dpi.unsafe_as(Proc(Float64, Float64, HRESULT)).call(dbldpix, dbldpiy)
  end
  def get_output_dpi(pdbldpix : Float64*, pdbldpiy : Float64*) : HRESULT
    @lpVtbl.value.get_output_dpi.unsafe_as(Proc(Float64*, Float64*, HRESULT)).call(pdbldpix, pdbldpiy)
  end
  def set_region_of_interest(prect : MilRectD*) : HRESULT
    @lpVtbl.value.set_region_of_interest.unsafe_as(Proc(MilRectD*, HRESULT)).call(prect)
  end
end
struct LibWin32::IMILBitmapEffectRenderContextImpl
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_use_software_renderer(pfsoftware : Int16*) : HRESULT
    @lpVtbl.value.get_use_software_renderer.unsafe_as(Proc(Int16*, HRESULT)).call(pfsoftware)
  end
  def get_transform(pmatrix : MILMatrixF*) : HRESULT
    @lpVtbl.value.get_transform.unsafe_as(Proc(MILMatrixF*, HRESULT)).call(pmatrix)
  end
  def update_transform(pmatrix : MILMatrixF*) : HRESULT
    @lpVtbl.value.update_transform.unsafe_as(Proc(MILMatrixF*, HRESULT)).call(pmatrix)
  end
  def get_output_bounds(prect : MilRectD*) : HRESULT
    @lpVtbl.value.get_output_bounds.unsafe_as(Proc(MilRectD*, HRESULT)).call(prect)
  end
  def update_output_bounds(prect : MilRectD*) : HRESULT
    @lpVtbl.value.update_output_bounds.unsafe_as(Proc(MilRectD*, HRESULT)).call(prect)
  end
end
struct LibWin32::IMILBitmapEffectFactory
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_effect(pguideffect : Guid*, ppeffect : IMILBitmapEffect*) : HRESULT
    @lpVtbl.value.create_effect.unsafe_as(Proc(Guid*, IMILBitmapEffect*, HRESULT)).call(pguideffect, ppeffect)
  end
  def create_context(ppcontext : IMILBitmapEffectRenderContext*) : HRESULT
    @lpVtbl.value.create_context.unsafe_as(Proc(IMILBitmapEffectRenderContext*, HRESULT)).call(ppcontext)
  end
  def create_effect_outer(ppeffect : IMILBitmapEffect*) : HRESULT
    @lpVtbl.value.create_effect_outer.unsafe_as(Proc(IMILBitmapEffect*, HRESULT)).call(ppeffect)
  end
end
struct LibWin32::IMILBitmapEffectPrimitive
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_output(uiindex : UInt32, pcontext : IMILBitmapEffectRenderContext, pfmodifyinplace : Int16*, ppbitmapsource : IWICBitmapSource*) : HRESULT
    @lpVtbl.value.get_output.unsafe_as(Proc(UInt32, IMILBitmapEffectRenderContext, Int16*, IWICBitmapSource*, HRESULT)).call(uiindex, pcontext, pfmodifyinplace, ppbitmapsource)
  end
  def transform_point(uiindex : UInt32, p : MilPoint2D*, fforwardtransform : Int16, pcontext : IMILBitmapEffectRenderContext, pfpointtransformed : Int16*) : HRESULT
    @lpVtbl.value.transform_point.unsafe_as(Proc(UInt32, MilPoint2D*, Int16, IMILBitmapEffectRenderContext, Int16*, HRESULT)).call(uiindex, p, fforwardtransform, pcontext, pfpointtransformed)
  end
  def transform_rect(uiindex : UInt32, p : MilRectD*, fforwardtransform : Int16, pcontext : IMILBitmapEffectRenderContext) : HRESULT
    @lpVtbl.value.transform_rect.unsafe_as(Proc(UInt32, MilRectD*, Int16, IMILBitmapEffectRenderContext, HRESULT)).call(uiindex, p, fforwardtransform, pcontext)
  end
  def has_affine_transform(uiindex : UInt32, pfaffine : Int16*) : HRESULT
    @lpVtbl.value.has_affine_transform.unsafe_as(Proc(UInt32, Int16*, HRESULT)).call(uiindex, pfaffine)
  end
  def has_inverse_transform(uiindex : UInt32, pfhasinverse : Int16*) : HRESULT
    @lpVtbl.value.has_inverse_transform.unsafe_as(Proc(UInt32, Int16*, HRESULT)).call(uiindex, pfhasinverse)
  end
  def get_affine_matrix(uiindex : UInt32, pmatrix : MilMatrix3x2D*) : HRESULT
    @lpVtbl.value.get_affine_matrix.unsafe_as(Proc(UInt32, MilMatrix3x2D*, HRESULT)).call(uiindex, pmatrix)
  end
end
struct LibWin32::IMILBitmapEffectPrimitiveImpl
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def is_dirty(uioutputindex : UInt32, pfdirty : Int16*) : HRESULT
    @lpVtbl.value.is_dirty.unsafe_as(Proc(UInt32, Int16*, HRESULT)).call(uioutputindex, pfdirty)
  end
  def is_volatile(uioutputindex : UInt32, pfvolatile : Int16*) : HRESULT
    @lpVtbl.value.is_volatile.unsafe_as(Proc(UInt32, Int16*, HRESULT)).call(uioutputindex, pfvolatile)
  end
end
struct LibWin32::IMILBitmapEffects
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def _new_enum(ppiureturn : IUnknown*) : HRESULT
    @lpVtbl.value._new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppiureturn)
  end
  def get_parent(ppeffect : IMILBitmapEffectGroup*) : HRESULT
    @lpVtbl.value.get_parent.unsafe_as(Proc(IMILBitmapEffectGroup*, HRESULT)).call(ppeffect)
  end
  def item(uindex : UInt32, ppeffect : IMILBitmapEffect*) : HRESULT
    @lpVtbl.value.item.unsafe_as(Proc(UInt32, IMILBitmapEffect*, HRESULT)).call(uindex, ppeffect)
  end
  def get_count(puicount : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(puicount)
  end
end
struct LibWin32::IMILBitmapEffectConnector
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_index(puiindex : UInt32*) : HRESULT
    @lpVtbl.value.get_index.unsafe_as(Proc(UInt32*, HRESULT)).call(puiindex)
  end
  def get_optimal_format(pformat : Guid*) : HRESULT
    @lpVtbl.value.get_optimal_format.unsafe_as(Proc(Guid*, HRESULT)).call(pformat)
  end
  def get_number_formats(pulnumberformats : UInt32*) : HRESULT
    @lpVtbl.value.get_number_formats.unsafe_as(Proc(UInt32*, HRESULT)).call(pulnumberformats)
  end
  def get_format(ulindex : UInt32, pformat : Guid*) : HRESULT
    @lpVtbl.value.get_format.unsafe_as(Proc(UInt32, Guid*, HRESULT)).call(ulindex, pformat)
  end
  def is_connected(pfconnected : Int16*) : HRESULT
    @lpVtbl.value.is_connected.unsafe_as(Proc(Int16*, HRESULT)).call(pfconnected)
  end
  def get_bitmap_effect(ppeffect : IMILBitmapEffect*) : HRESULT
    @lpVtbl.value.get_bitmap_effect.unsafe_as(Proc(IMILBitmapEffect*, HRESULT)).call(ppeffect)
  end
end
struct LibWin32::IMILBitmapEffectInputConnector
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_index(puiindex : UInt32*) : HRESULT
    @lpVtbl.value.get_index.unsafe_as(Proc(UInt32*, HRESULT)).call(puiindex)
  end
  def get_optimal_format(pformat : Guid*) : HRESULT
    @lpVtbl.value.get_optimal_format.unsafe_as(Proc(Guid*, HRESULT)).call(pformat)
  end
  def get_number_formats(pulnumberformats : UInt32*) : HRESULT
    @lpVtbl.value.get_number_formats.unsafe_as(Proc(UInt32*, HRESULT)).call(pulnumberformats)
  end
  def get_format(ulindex : UInt32, pformat : Guid*) : HRESULT
    @lpVtbl.value.get_format.unsafe_as(Proc(UInt32, Guid*, HRESULT)).call(ulindex, pformat)
  end
  def is_connected(pfconnected : Int16*) : HRESULT
    @lpVtbl.value.is_connected.unsafe_as(Proc(Int16*, HRESULT)).call(pfconnected)
  end
  def get_bitmap_effect(ppeffect : IMILBitmapEffect*) : HRESULT
    @lpVtbl.value.get_bitmap_effect.unsafe_as(Proc(IMILBitmapEffect*, HRESULT)).call(ppeffect)
  end
  def connect_to(pconnector : IMILBitmapEffectOutputConnector) : HRESULT
    @lpVtbl.value.connect_to.unsafe_as(Proc(IMILBitmapEffectOutputConnector, HRESULT)).call(pconnector)
  end
  def get_connection(ppconnector : IMILBitmapEffectOutputConnector*) : HRESULT
    @lpVtbl.value.get_connection.unsafe_as(Proc(IMILBitmapEffectOutputConnector*, HRESULT)).call(ppconnector)
  end
end
struct LibWin32::IMILBitmapEffectOutputConnector
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_index(puiindex : UInt32*) : HRESULT
    @lpVtbl.value.get_index.unsafe_as(Proc(UInt32*, HRESULT)).call(puiindex)
  end
  def get_optimal_format(pformat : Guid*) : HRESULT
    @lpVtbl.value.get_optimal_format.unsafe_as(Proc(Guid*, HRESULT)).call(pformat)
  end
  def get_number_formats(pulnumberformats : UInt32*) : HRESULT
    @lpVtbl.value.get_number_formats.unsafe_as(Proc(UInt32*, HRESULT)).call(pulnumberformats)
  end
  def get_format(ulindex : UInt32, pformat : Guid*) : HRESULT
    @lpVtbl.value.get_format.unsafe_as(Proc(UInt32, Guid*, HRESULT)).call(ulindex, pformat)
  end
  def is_connected(pfconnected : Int16*) : HRESULT
    @lpVtbl.value.is_connected.unsafe_as(Proc(Int16*, HRESULT)).call(pfconnected)
  end
  def get_bitmap_effect(ppeffect : IMILBitmapEffect*) : HRESULT
    @lpVtbl.value.get_bitmap_effect.unsafe_as(Proc(IMILBitmapEffect*, HRESULT)).call(ppeffect)
  end
  def get_number_connections(puinumberconnections : UInt32*) : HRESULT
    @lpVtbl.value.get_number_connections.unsafe_as(Proc(UInt32*, HRESULT)).call(puinumberconnections)
  end
  def get_connection(uiindex : UInt32, ppconnection : IMILBitmapEffectInputConnector*) : HRESULT
    @lpVtbl.value.get_connection.unsafe_as(Proc(UInt32, IMILBitmapEffectInputConnector*, HRESULT)).call(uiindex, ppconnection)
  end
end
struct LibWin32::IMILBitmapEffectOutputConnectorImpl
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_back_link(pconnection : IMILBitmapEffectInputConnector) : HRESULT
    @lpVtbl.value.add_back_link.unsafe_as(Proc(IMILBitmapEffectInputConnector, HRESULT)).call(pconnection)
  end
  def remove_back_link(pconnection : IMILBitmapEffectInputConnector) : HRESULT
    @lpVtbl.value.remove_back_link.unsafe_as(Proc(IMILBitmapEffectInputConnector, HRESULT)).call(pconnection)
  end
end
struct LibWin32::IMILBitmapEffectInteriorInputConnector
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_input_connector(pinputconnector : IMILBitmapEffectInputConnector*) : HRESULT
    @lpVtbl.value.get_input_connector.unsafe_as(Proc(IMILBitmapEffectInputConnector*, HRESULT)).call(pinputconnector)
  end
end
struct LibWin32::IMILBitmapEffectInteriorOutputConnector
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_output_connector(poutputconnector : IMILBitmapEffectOutputConnector*) : HRESULT
    @lpVtbl.value.get_output_connector.unsafe_as(Proc(IMILBitmapEffectOutputConnector*, HRESULT)).call(poutputconnector)
  end
end
struct LibWin32::IMILBitmapEffectEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def property_change(peffect : IMILBitmapEffect, bstrpropertyname : UInt8*) : HRESULT
    @lpVtbl.value.property_change.unsafe_as(Proc(IMILBitmapEffect, UInt8*, HRESULT)).call(peffect, bstrpropertyname)
  end
  def dirty_region(peffect : IMILBitmapEffect, prect : MilRectD*) : HRESULT
    @lpVtbl.value.dirty_region.unsafe_as(Proc(IMILBitmapEffect, MilRectD*, HRESULT)).call(peffect, prect)
  end
end
