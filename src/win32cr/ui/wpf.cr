require "./../system/com.cr"
require "./../foundation.cr"
require "./../graphics/imaging.cr"
require "./../graphics/dwm.cr"

module Win32cr::UI::Wpf
  MILBITMAPEFFECT_SDK_VERSION = 16777216_u32
  CLSID_MILBitmapEffectGroup = "ac9c1a9a-7e18-4f64-ac7e-47cf7f051e95"
  CLSID_MILBitmapEffectBlur = "a924df87-225d-4373-8f5b-b90ec85ae3de"
  CLSID_MILBitmapEffectDropShadow = "459a3fbe-d8ac-4692-874b-7a265715aa16"
  CLSID_MILBitmapEffectOuterGlow = "e2161bdd-7eb6-4725-9c0b-8a2a1b4f0667"
  CLSID_MILBitmapEffectBevel = "fd361dbe-6c9b-4de0-8290-f6400c2737ed"
  CLSID_MILBitmapEffectEmboss = "cd299846-824f-47ec-a007-12aa767f2816"


  @[Extern]
  struct MilRectD
    property left : Float64
    property top : Float64
    property right : Float64
    property bottom : Float64
    def initialize(@left : Float64, @top : Float64, @right : Float64, @bottom : Float64)
    end
  end

  @[Extern]
  struct MilPoint2D
    property x : Float64
    property y : Float64
    def initialize(@x : Float64, @y : Float64)
    end
  end

  @[Extern]
  struct MILMatrixF
    property _11 : Float64
    property _12 : Float64
    property _13 : Float64
    property _14 : Float64
    property _21 : Float64
    property _22 : Float64
    property _23 : Float64
    property _24 : Float64
    property _31 : Float64
    property _32 : Float64
    property _33 : Float64
    property _34 : Float64
    property _41 : Float64
    property _42 : Float64
    property _43 : Float64
    property _44 : Float64
    def initialize(@_11 : Float64, @_12 : Float64, @_13 : Float64, @_14 : Float64, @_21 : Float64, @_22 : Float64, @_23 : Float64, @_24 : Float64, @_31 : Float64, @_32 : Float64, @_33 : Float64, @_34 : Float64, @_41 : Float64, @_42 : Float64, @_43 : Float64, @_44 : Float64)
    end
  end

  @[Extern]
  record IMILBitmapEffectConnectorInfoVtbl,
    query_interface : Proc(IMILBitmapEffectConnectorInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMILBitmapEffectConnectorInfo*, UInt32),
    release : Proc(IMILBitmapEffectConnectorInfo*, UInt32),
    get_index : Proc(IMILBitmapEffectConnectorInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_optimal_format : Proc(IMILBitmapEffectConnectorInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_number_formats : Proc(IMILBitmapEffectConnectorInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_format : Proc(IMILBitmapEffectConnectorInfo*, UInt32, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMILBitmapEffectConnectorInfo, lpVtbl : IMILBitmapEffectConnectorInfoVtbl* do
    GUID = LibC::GUID.new(0xf66d2e4b_u32, 0xb46b_u16, 0x42fc_u16, StaticArray[0x85_u8, 0x9e_u8, 0x3d_u8, 0xa0_u8, 0xec_u8, 0xdb_u8, 0x3c_u8, 0x43_u8])
    def query_interface(this : IMILBitmapEffectConnectorInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMILBitmapEffectConnectorInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMILBitmapEffectConnectorInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_index(this : IMILBitmapEffectConnectorInfo*, puiIndex : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_index.call(this, puiIndex)
    end
    def get_optimal_format(this : IMILBitmapEffectConnectorInfo*, pFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_optimal_format.call(this, pFormat)
    end
    def get_number_formats(this : IMILBitmapEffectConnectorInfo*, pulNumberFormats : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_number_formats.call(this, pulNumberFormats)
    end
    def get_format(this : IMILBitmapEffectConnectorInfo*, ulIndex : UInt32, pFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_format.call(this, ulIndex, pFormat)
    end

  end

  @[Extern]
  record IMILBitmapEffectConnectionsInfoVtbl,
    query_interface : Proc(IMILBitmapEffectConnectionsInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMILBitmapEffectConnectionsInfo*, UInt32),
    release : Proc(IMILBitmapEffectConnectionsInfo*, UInt32),
    get_number_inputs : Proc(IMILBitmapEffectConnectionsInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_number_outputs : Proc(IMILBitmapEffectConnectionsInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_input_connector_info : Proc(IMILBitmapEffectConnectionsInfo*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_output_connector_info : Proc(IMILBitmapEffectConnectionsInfo*, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMILBitmapEffectConnectionsInfo, lpVtbl : IMILBitmapEffectConnectionsInfoVtbl* do
    GUID = LibC::GUID.new(0x476b538a_u32, 0xc765_u16, 0x4237_u16, StaticArray[0xba_u8, 0x4a_u8, 0xd6_u8, 0xa8_u8, 0x80_u8, 0xff_u8, 0xc_u8, 0xfc_u8])
    def query_interface(this : IMILBitmapEffectConnectionsInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMILBitmapEffectConnectionsInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMILBitmapEffectConnectionsInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_number_inputs(this : IMILBitmapEffectConnectionsInfo*, puiNumInputs : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_number_inputs.call(this, puiNumInputs)
    end
    def get_number_outputs(this : IMILBitmapEffectConnectionsInfo*, puiNumOutputs : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_number_outputs.call(this, puiNumOutputs)
    end
    def get_input_connector_info(this : IMILBitmapEffectConnectionsInfo*, uiIndex : UInt32, ppConnectorInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_input_connector_info.call(this, uiIndex, ppConnectorInfo)
    end
    def get_output_connector_info(this : IMILBitmapEffectConnectionsInfo*, uiIndex : UInt32, ppConnectorInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output_connector_info.call(this, uiIndex, ppConnectorInfo)
    end

  end

  @[Extern]
  record IMILBitmapEffectConnectionsVtbl,
    query_interface : Proc(IMILBitmapEffectConnections*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMILBitmapEffectConnections*, UInt32),
    release : Proc(IMILBitmapEffectConnections*, UInt32),
    get_input_connector : Proc(IMILBitmapEffectConnections*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_output_connector : Proc(IMILBitmapEffectConnections*, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMILBitmapEffectConnections, lpVtbl : IMILBitmapEffectConnectionsVtbl* do
    GUID = LibC::GUID.new(0xc2b5d861_u32, 0x9b1a_u16, 0x4374_u16, StaticArray[0x89_u8, 0xb0_u8, 0xde_u8, 0xc4_u8, 0x87_u8, 0x4d_u8, 0x6a_u8, 0x81_u8])
    def query_interface(this : IMILBitmapEffectConnections*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMILBitmapEffectConnections*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMILBitmapEffectConnections*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_input_connector(this : IMILBitmapEffectConnections*, uiIndex : UInt32, ppConnector : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_input_connector.call(this, uiIndex, ppConnector)
    end
    def get_output_connector(this : IMILBitmapEffectConnections*, uiIndex : UInt32, ppConnector : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output_connector.call(this, uiIndex, ppConnector)
    end

  end

  @[Extern]
  record IMILBitmapEffectVtbl,
    query_interface : Proc(IMILBitmapEffect*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMILBitmapEffect*, UInt32),
    release : Proc(IMILBitmapEffect*, UInt32),
    get_output : Proc(IMILBitmapEffect*, UInt32, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_parent_effect : Proc(IMILBitmapEffect*, Void**, Win32cr::Foundation::HRESULT),
    set_input_source : Proc(IMILBitmapEffect*, UInt32, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMILBitmapEffect, lpVtbl : IMILBitmapEffectVtbl* do
    GUID = LibC::GUID.new(0x8a6ff321_u32, 0xc944_u16, 0x4a1b_u16, StaticArray[0x99_u8, 0x44_u8, 0x99_u8, 0x54_u8, 0xaf_u8, 0x30_u8, 0x12_u8, 0x58_u8])
    def query_interface(this : IMILBitmapEffect*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMILBitmapEffect*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMILBitmapEffect*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_output(this : IMILBitmapEffect*, uiIndex : UInt32, pContext : Void*, ppBitmapSource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output.call(this, uiIndex, pContext, ppBitmapSource)
    end
    def get_parent_effect(this : IMILBitmapEffect*, ppParentEffect : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent_effect.call(this, ppParentEffect)
    end
    def set_input_source(this : IMILBitmapEffect*, uiIndex : UInt32, pBitmapSource : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_input_source.call(this, uiIndex, pBitmapSource)
    end

  end

  @[Extern]
  record IMILBitmapEffectImplVtbl,
    query_interface : Proc(IMILBitmapEffectImpl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMILBitmapEffectImpl*, UInt32),
    release : Proc(IMILBitmapEffectImpl*, UInt32),
    is_in_place_modification_allowed : Proc(IMILBitmapEffectImpl*, Void*, Int16*, Win32cr::Foundation::HRESULT),
    set_parent_effect : Proc(IMILBitmapEffectImpl*, Void*, Win32cr::Foundation::HRESULT),
    get_input_source : Proc(IMILBitmapEffectImpl*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_input_source_bounds : Proc(IMILBitmapEffectImpl*, UInt32, Win32cr::UI::Wpf::MilRectD*, Win32cr::Foundation::HRESULT),
    get_input_bitmap_source : Proc(IMILBitmapEffectImpl*, UInt32, Void*, Int16*, Void**, Win32cr::Foundation::HRESULT),
    get_output_bitmap_source : Proc(IMILBitmapEffectImpl*, UInt32, Void*, Int16*, Void**, Win32cr::Foundation::HRESULT),
    initialize__ : Proc(IMILBitmapEffectImpl*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMILBitmapEffectImpl, lpVtbl : IMILBitmapEffectImplVtbl* do
    GUID = LibC::GUID.new(0xcc2468f2_u32, 0x9936_u16, 0x47be_u16, StaticArray[0xb4_u8, 0xaf_u8, 0x6_u8, 0xb5_u8, 0xdf_u8, 0x5d_u8, 0xbc_u8, 0xbb_u8])
    def query_interface(this : IMILBitmapEffectImpl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMILBitmapEffectImpl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMILBitmapEffectImpl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def is_in_place_modification_allowed(this : IMILBitmapEffectImpl*, pOutputConnector : Void*, pfModifyInPlace : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_in_place_modification_allowed.call(this, pOutputConnector, pfModifyInPlace)
    end
    def set_parent_effect(this : IMILBitmapEffectImpl*, pParentEffect : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_parent_effect.call(this, pParentEffect)
    end
    def get_input_source(this : IMILBitmapEffectImpl*, uiIndex : UInt32, ppBitmapSource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_input_source.call(this, uiIndex, ppBitmapSource)
    end
    def get_input_source_bounds(this : IMILBitmapEffectImpl*, uiIndex : UInt32, pRect : Win32cr::UI::Wpf::MilRectD*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_input_source_bounds.call(this, uiIndex, pRect)
    end
    def get_input_bitmap_source(this : IMILBitmapEffectImpl*, uiIndex : UInt32, pRenderContext : Void*, pfModifyInPlace : Int16*, ppBitmapSource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_input_bitmap_source.call(this, uiIndex, pRenderContext, pfModifyInPlace, ppBitmapSource)
    end
    def get_output_bitmap_source(this : IMILBitmapEffectImpl*, uiIndex : UInt32, pRenderContext : Void*, pfModifyInPlace : Int16*, ppBitmapSource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output_bitmap_source.call(this, uiIndex, pRenderContext, pfModifyInPlace, ppBitmapSource)
    end
    def initialize__(this : IMILBitmapEffectImpl*, pInner : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pInner)
    end

  end

  @[Extern]
  record IMILBitmapEffectGroupVtbl,
    query_interface : Proc(IMILBitmapEffectGroup*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMILBitmapEffectGroup*, UInt32),
    release : Proc(IMILBitmapEffectGroup*, UInt32),
    get_interior_input_connector : Proc(IMILBitmapEffectGroup*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_interior_output_connector : Proc(IMILBitmapEffectGroup*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    add : Proc(IMILBitmapEffectGroup*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMILBitmapEffectGroup, lpVtbl : IMILBitmapEffectGroupVtbl* do
    GUID = LibC::GUID.new(0x2f952360_u32, 0x698a_u16, 0x4ac6_u16, StaticArray[0x81_u8, 0xa1_u8, 0xbc_u8, 0xfd_u8, 0xf0_u8, 0x8e_u8, 0xb8_u8, 0xe8_u8])
    def query_interface(this : IMILBitmapEffectGroup*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMILBitmapEffectGroup*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMILBitmapEffectGroup*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_interior_input_connector(this : IMILBitmapEffectGroup*, uiIndex : UInt32, ppConnector : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_interior_input_connector.call(this, uiIndex, ppConnector)
    end
    def get_interior_output_connector(this : IMILBitmapEffectGroup*, uiIndex : UInt32, ppConnector : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_interior_output_connector.call(this, uiIndex, ppConnector)
    end
    def add(this : IMILBitmapEffectGroup*, pEffect : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, pEffect)
    end

  end

  @[Extern]
  record IMILBitmapEffectGroupImplVtbl,
    query_interface : Proc(IMILBitmapEffectGroupImpl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMILBitmapEffectGroupImpl*, UInt32),
    release : Proc(IMILBitmapEffectGroupImpl*, UInt32),
    preprocess : Proc(IMILBitmapEffectGroupImpl*, Void*, Win32cr::Foundation::HRESULT),
    get_number_children : Proc(IMILBitmapEffectGroupImpl*, UInt32*, Win32cr::Foundation::HRESULT),
    get_children : Proc(IMILBitmapEffectGroupImpl*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMILBitmapEffectGroupImpl, lpVtbl : IMILBitmapEffectGroupImplVtbl* do
    GUID = LibC::GUID.new(0x78fed518_u32, 0x1cfc_u16, 0x4807_u16, StaticArray[0x8b_u8, 0x85_u8, 0x6b_u8, 0x6e_u8, 0x51_u8, 0x39_u8, 0x8f_u8, 0x62_u8])
    def query_interface(this : IMILBitmapEffectGroupImpl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMILBitmapEffectGroupImpl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMILBitmapEffectGroupImpl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def preprocess(this : IMILBitmapEffectGroupImpl*, pContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.preprocess.call(this, pContext)
    end
    def get_number_children(this : IMILBitmapEffectGroupImpl*, puiNumberChildren : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_number_children.call(this, puiNumberChildren)
    end
    def get_children(this : IMILBitmapEffectGroupImpl*, pChildren : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_children.call(this, pChildren)
    end

  end

  @[Extern]
  record IMILBitmapEffectRenderContextVtbl,
    query_interface : Proc(IMILBitmapEffectRenderContext*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMILBitmapEffectRenderContext*, UInt32),
    release : Proc(IMILBitmapEffectRenderContext*, UInt32),
    set_output_pixel_format : Proc(IMILBitmapEffectRenderContext*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_output_pixel_format : Proc(IMILBitmapEffectRenderContext*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    set_use_software_renderer : Proc(IMILBitmapEffectRenderContext*, Int16, Win32cr::Foundation::HRESULT),
    set_initial_transform : Proc(IMILBitmapEffectRenderContext*, Win32cr::UI::Wpf::MILMatrixF*, Win32cr::Foundation::HRESULT),
    get_final_transform : Proc(IMILBitmapEffectRenderContext*, Win32cr::UI::Wpf::MILMatrixF*, Win32cr::Foundation::HRESULT),
    set_output_dpi : Proc(IMILBitmapEffectRenderContext*, Float64, Float64, Win32cr::Foundation::HRESULT),
    get_output_dpi : Proc(IMILBitmapEffectRenderContext*, Float64*, Float64*, Win32cr::Foundation::HRESULT),
    set_region_of_interest : Proc(IMILBitmapEffectRenderContext*, Win32cr::UI::Wpf::MilRectD*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMILBitmapEffectRenderContext, lpVtbl : IMILBitmapEffectRenderContextVtbl* do
    GUID = LibC::GUID.new(0x12a2ec7e_u32, 0x2d33_u16, 0x44b2_u16, StaticArray[0xb3_u8, 0x34_u8, 0x1a_u8, 0xbb_u8, 0x78_u8, 0x46_u8, 0xe3_u8, 0x90_u8])
    def query_interface(this : IMILBitmapEffectRenderContext*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMILBitmapEffectRenderContext*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMILBitmapEffectRenderContext*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_output_pixel_format(this : IMILBitmapEffectRenderContext*, format : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_output_pixel_format.call(this, format)
    end
    def get_output_pixel_format(this : IMILBitmapEffectRenderContext*, pFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output_pixel_format.call(this, pFormat)
    end
    def set_use_software_renderer(this : IMILBitmapEffectRenderContext*, fSoftware : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_use_software_renderer.call(this, fSoftware)
    end
    def set_initial_transform(this : IMILBitmapEffectRenderContext*, pMatrix : Win32cr::UI::Wpf::MILMatrixF*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_initial_transform.call(this, pMatrix)
    end
    def get_final_transform(this : IMILBitmapEffectRenderContext*, pMatrix : Win32cr::UI::Wpf::MILMatrixF*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_final_transform.call(this, pMatrix)
    end
    def set_output_dpi(this : IMILBitmapEffectRenderContext*, dblDpiX : Float64, dblDpiY : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_output_dpi.call(this, dblDpiX, dblDpiY)
    end
    def get_output_dpi(this : IMILBitmapEffectRenderContext*, pdblDpiX : Float64*, pdblDpiY : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output_dpi.call(this, pdblDpiX, pdblDpiY)
    end
    def set_region_of_interest(this : IMILBitmapEffectRenderContext*, pRect : Win32cr::UI::Wpf::MilRectD*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_region_of_interest.call(this, pRect)
    end

  end

  @[Extern]
  record IMILBitmapEffectRenderContextImplVtbl,
    query_interface : Proc(IMILBitmapEffectRenderContextImpl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMILBitmapEffectRenderContextImpl*, UInt32),
    release : Proc(IMILBitmapEffectRenderContextImpl*, UInt32),
    get_use_software_renderer : Proc(IMILBitmapEffectRenderContextImpl*, Int16*, Win32cr::Foundation::HRESULT),
    get_transform : Proc(IMILBitmapEffectRenderContextImpl*, Win32cr::UI::Wpf::MILMatrixF*, Win32cr::Foundation::HRESULT),
    update_transform : Proc(IMILBitmapEffectRenderContextImpl*, Win32cr::UI::Wpf::MILMatrixF*, Win32cr::Foundation::HRESULT),
    get_output_bounds : Proc(IMILBitmapEffectRenderContextImpl*, Win32cr::UI::Wpf::MilRectD*, Win32cr::Foundation::HRESULT),
    update_output_bounds : Proc(IMILBitmapEffectRenderContextImpl*, Win32cr::UI::Wpf::MilRectD*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMILBitmapEffectRenderContextImpl, lpVtbl : IMILBitmapEffectRenderContextImplVtbl* do
    GUID = LibC::GUID.new(0x4d25accb_u32, 0x797d_u16, 0x4fd2_u16, StaticArray[0xb1_u8, 0x28_u8, 0xdf_u8, 0xfe_u8, 0xff_u8, 0x84_u8, 0xfc_u8, 0xc3_u8])
    def query_interface(this : IMILBitmapEffectRenderContextImpl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMILBitmapEffectRenderContextImpl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMILBitmapEffectRenderContextImpl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_use_software_renderer(this : IMILBitmapEffectRenderContextImpl*, pfSoftware : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_use_software_renderer.call(this, pfSoftware)
    end
    def get_transform(this : IMILBitmapEffectRenderContextImpl*, pMatrix : Win32cr::UI::Wpf::MILMatrixF*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transform.call(this, pMatrix)
    end
    def update_transform(this : IMILBitmapEffectRenderContextImpl*, pMatrix : Win32cr::UI::Wpf::MILMatrixF*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update_transform.call(this, pMatrix)
    end
    def get_output_bounds(this : IMILBitmapEffectRenderContextImpl*, pRect : Win32cr::UI::Wpf::MilRectD*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output_bounds.call(this, pRect)
    end
    def update_output_bounds(this : IMILBitmapEffectRenderContextImpl*, pRect : Win32cr::UI::Wpf::MilRectD*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update_output_bounds.call(this, pRect)
    end

  end

  @[Extern]
  record IMILBitmapEffectFactoryVtbl,
    query_interface : Proc(IMILBitmapEffectFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMILBitmapEffectFactory*, UInt32),
    release : Proc(IMILBitmapEffectFactory*, UInt32),
    create_effect : Proc(IMILBitmapEffectFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    create_context : Proc(IMILBitmapEffectFactory*, Void**, Win32cr::Foundation::HRESULT),
    create_effect_outer : Proc(IMILBitmapEffectFactory*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMILBitmapEffectFactory, lpVtbl : IMILBitmapEffectFactoryVtbl* do
    GUID = LibC::GUID.new(0x33a9df34_u32, 0xa403_u16, 0x4ec7_u16, StaticArray[0xb0_u8, 0x7e_u8, 0xbc_u8, 0x6_u8, 0x82_u8, 0x37_u8, 0x8_u8, 0x45_u8])
    def query_interface(this : IMILBitmapEffectFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMILBitmapEffectFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMILBitmapEffectFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_effect(this : IMILBitmapEffectFactory*, pguidEffect : LibC::GUID*, ppEffect : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_effect.call(this, pguidEffect, ppEffect)
    end
    def create_context(this : IMILBitmapEffectFactory*, ppContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_context.call(this, ppContext)
    end
    def create_effect_outer(this : IMILBitmapEffectFactory*, ppEffect : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_effect_outer.call(this, ppEffect)
    end

  end

  @[Extern]
  record IMILBitmapEffectPrimitiveVtbl,
    query_interface : Proc(IMILBitmapEffectPrimitive*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMILBitmapEffectPrimitive*, UInt32),
    release : Proc(IMILBitmapEffectPrimitive*, UInt32),
    get_output : Proc(IMILBitmapEffectPrimitive*, UInt32, Void*, Int16*, Void**, Win32cr::Foundation::HRESULT),
    transform_point : Proc(IMILBitmapEffectPrimitive*, UInt32, Win32cr::UI::Wpf::MilPoint2D*, Int16, Void*, Int16*, Win32cr::Foundation::HRESULT),
    transform_rect : Proc(IMILBitmapEffectPrimitive*, UInt32, Win32cr::UI::Wpf::MilRectD*, Int16, Void*, Win32cr::Foundation::HRESULT),
    has_affine_transform : Proc(IMILBitmapEffectPrimitive*, UInt32, Int16*, Win32cr::Foundation::HRESULT),
    has_inverse_transform : Proc(IMILBitmapEffectPrimitive*, UInt32, Int16*, Win32cr::Foundation::HRESULT),
    get_affine_matrix : Proc(IMILBitmapEffectPrimitive*, UInt32, Win32cr::Graphics::Dwm::MilMatrix3x2D*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMILBitmapEffectPrimitive, lpVtbl : IMILBitmapEffectPrimitiveVtbl* do
    GUID = LibC::GUID.new(0x67e31025_u32, 0x3091_u16, 0x4dfc_u16, StaticArray[0x98_u8, 0xd6_u8, 0xdd_u8, 0x49_u8, 0x45_u8, 0x51_u8, 0x46_u8, 0x1d_u8])
    def query_interface(this : IMILBitmapEffectPrimitive*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMILBitmapEffectPrimitive*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMILBitmapEffectPrimitive*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_output(this : IMILBitmapEffectPrimitive*, uiIndex : UInt32, pContext : Void*, pfModifyInPlace : Int16*, ppBitmapSource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output.call(this, uiIndex, pContext, pfModifyInPlace, ppBitmapSource)
    end
    def transform_point(this : IMILBitmapEffectPrimitive*, uiIndex : UInt32, p : Win32cr::UI::Wpf::MilPoint2D*, fForwardTransform : Int16, pContext : Void*, pfPointTransformed : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.transform_point.call(this, uiIndex, p, fForwardTransform, pContext, pfPointTransformed)
    end
    def transform_rect(this : IMILBitmapEffectPrimitive*, uiIndex : UInt32, p : Win32cr::UI::Wpf::MilRectD*, fForwardTransform : Int16, pContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.transform_rect.call(this, uiIndex, p, fForwardTransform, pContext)
    end
    def has_affine_transform(this : IMILBitmapEffectPrimitive*, uiIndex : UInt32, pfAffine : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.has_affine_transform.call(this, uiIndex, pfAffine)
    end
    def has_inverse_transform(this : IMILBitmapEffectPrimitive*, uiIndex : UInt32, pfHasInverse : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.has_inverse_transform.call(this, uiIndex, pfHasInverse)
    end
    def get_affine_matrix(this : IMILBitmapEffectPrimitive*, uiIndex : UInt32, pMatrix : Win32cr::Graphics::Dwm::MilMatrix3x2D*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_affine_matrix.call(this, uiIndex, pMatrix)
    end

  end

  @[Extern]
  record IMILBitmapEffectPrimitiveImplVtbl,
    query_interface : Proc(IMILBitmapEffectPrimitiveImpl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMILBitmapEffectPrimitiveImpl*, UInt32),
    release : Proc(IMILBitmapEffectPrimitiveImpl*, UInt32),
    is_dirty : Proc(IMILBitmapEffectPrimitiveImpl*, UInt32, Int16*, Win32cr::Foundation::HRESULT),
    is_volatile : Proc(IMILBitmapEffectPrimitiveImpl*, UInt32, Int16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMILBitmapEffectPrimitiveImpl, lpVtbl : IMILBitmapEffectPrimitiveImplVtbl* do
    GUID = LibC::GUID.new(0xce41e00b_u32, 0xefa6_u16, 0x44e7_u16, StaticArray[0xb0_u8, 0x7_u8, 0xdd_u8, 0x4_u8, 0x2e_u8, 0x3a_u8, 0xe1_u8, 0x26_u8])
    def query_interface(this : IMILBitmapEffectPrimitiveImpl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMILBitmapEffectPrimitiveImpl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMILBitmapEffectPrimitiveImpl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def is_dirty(this : IMILBitmapEffectPrimitiveImpl*, uiOutputIndex : UInt32, pfDirty : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_dirty.call(this, uiOutputIndex, pfDirty)
    end
    def is_volatile(this : IMILBitmapEffectPrimitiveImpl*, uiOutputIndex : UInt32, pfVolatile : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_volatile.call(this, uiOutputIndex, pfVolatile)
    end

  end

  @[Extern]
  record IMILBitmapEffectsVtbl,
    query_interface : Proc(IMILBitmapEffects*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMILBitmapEffects*, UInt32),
    release : Proc(IMILBitmapEffects*, UInt32),
    _new_enum : Proc(IMILBitmapEffects*, Void**, Win32cr::Foundation::HRESULT),
    get_Parent : Proc(IMILBitmapEffects*, Void**, Win32cr::Foundation::HRESULT),
    item : Proc(IMILBitmapEffects*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IMILBitmapEffects*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMILBitmapEffects, lpVtbl : IMILBitmapEffectsVtbl* do
    GUID = LibC::GUID.new(0x51ac3dce_u32, 0x67c5_u16, 0x448b_u16, StaticArray[0x91_u8, 0x80_u8, 0xad_u8, 0x3e_u8, 0xab_u8, 0xdd_u8, 0xd5_u8, 0xdd_u8])
    def query_interface(this : IMILBitmapEffects*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMILBitmapEffects*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMILBitmapEffects*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def _new_enum(this : IMILBitmapEffects*, ppiuReturn : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value._new_enum.call(this, ppiuReturn)
    end
    def get_Parent(this : IMILBitmapEffects*, ppEffect : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Parent.call(this, ppEffect)
    end
    def item(this : IMILBitmapEffects*, uindex : UInt32, ppEffect : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, uindex, ppEffect)
    end
    def get_Count(this : IMILBitmapEffects*, puiCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, puiCount)
    end

  end

  @[Extern]
  record IMILBitmapEffectConnectorVtbl,
    query_interface : Proc(IMILBitmapEffectConnector*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMILBitmapEffectConnector*, UInt32),
    release : Proc(IMILBitmapEffectConnector*, UInt32),
    get_index : Proc(IMILBitmapEffectConnector*, UInt32*, Win32cr::Foundation::HRESULT),
    get_optimal_format : Proc(IMILBitmapEffectConnector*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_number_formats : Proc(IMILBitmapEffectConnector*, UInt32*, Win32cr::Foundation::HRESULT),
    get_format : Proc(IMILBitmapEffectConnector*, UInt32, LibC::GUID*, Win32cr::Foundation::HRESULT),
    is_connected : Proc(IMILBitmapEffectConnector*, Int16*, Win32cr::Foundation::HRESULT),
    get_bitmap_effect : Proc(IMILBitmapEffectConnector*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMILBitmapEffectConnector, lpVtbl : IMILBitmapEffectConnectorVtbl* do
    GUID = LibC::GUID.new(0xf59567b3_u32, 0x76c1_u16, 0x4d47_u16, StaticArray[0xba_u8, 0x1e_u8, 0x79_u8, 0xf9_u8, 0x55_u8, 0xe3_u8, 0x50_u8, 0xef_u8])
    def query_interface(this : IMILBitmapEffectConnector*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMILBitmapEffectConnector*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMILBitmapEffectConnector*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_index(this : IMILBitmapEffectConnector*, puiIndex : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_index.call(this, puiIndex)
    end
    def get_optimal_format(this : IMILBitmapEffectConnector*, pFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_optimal_format.call(this, pFormat)
    end
    def get_number_formats(this : IMILBitmapEffectConnector*, pulNumberFormats : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_number_formats.call(this, pulNumberFormats)
    end
    def get_format(this : IMILBitmapEffectConnector*, ulIndex : UInt32, pFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_format.call(this, ulIndex, pFormat)
    end
    def is_connected(this : IMILBitmapEffectConnector*, pfConnected : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_connected.call(this, pfConnected)
    end
    def get_bitmap_effect(this : IMILBitmapEffectConnector*, ppEffect : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_bitmap_effect.call(this, ppEffect)
    end

  end

  @[Extern]
  record IMILBitmapEffectInputConnectorVtbl,
    query_interface : Proc(IMILBitmapEffectInputConnector*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMILBitmapEffectInputConnector*, UInt32),
    release : Proc(IMILBitmapEffectInputConnector*, UInt32),
    get_index : Proc(IMILBitmapEffectInputConnector*, UInt32*, Win32cr::Foundation::HRESULT),
    get_optimal_format : Proc(IMILBitmapEffectInputConnector*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_number_formats : Proc(IMILBitmapEffectInputConnector*, UInt32*, Win32cr::Foundation::HRESULT),
    get_format : Proc(IMILBitmapEffectInputConnector*, UInt32, LibC::GUID*, Win32cr::Foundation::HRESULT),
    is_connected : Proc(IMILBitmapEffectInputConnector*, Int16*, Win32cr::Foundation::HRESULT),
    get_bitmap_effect : Proc(IMILBitmapEffectInputConnector*, Void**, Win32cr::Foundation::HRESULT),
    connect_to : Proc(IMILBitmapEffectInputConnector*, Void*, Win32cr::Foundation::HRESULT),
    get_connection : Proc(IMILBitmapEffectInputConnector*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMILBitmapEffectInputConnector, lpVtbl : IMILBitmapEffectInputConnectorVtbl* do
    GUID = LibC::GUID.new(0xa9b4ecaa_u32, 0x7a3c_u16, 0x45e7_u16, StaticArray[0x85_u8, 0x73_u8, 0xf4_u8, 0xb8_u8, 0x1b_u8, 0x60_u8, 0xdd_u8, 0x6c_u8])
    def query_interface(this : IMILBitmapEffectInputConnector*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMILBitmapEffectInputConnector*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMILBitmapEffectInputConnector*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_index(this : IMILBitmapEffectInputConnector*, puiIndex : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_index.call(this, puiIndex)
    end
    def get_optimal_format(this : IMILBitmapEffectInputConnector*, pFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_optimal_format.call(this, pFormat)
    end
    def get_number_formats(this : IMILBitmapEffectInputConnector*, pulNumberFormats : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_number_formats.call(this, pulNumberFormats)
    end
    def get_format(this : IMILBitmapEffectInputConnector*, ulIndex : UInt32, pFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_format.call(this, ulIndex, pFormat)
    end
    def is_connected(this : IMILBitmapEffectInputConnector*, pfConnected : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_connected.call(this, pfConnected)
    end
    def get_bitmap_effect(this : IMILBitmapEffectInputConnector*, ppEffect : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_bitmap_effect.call(this, ppEffect)
    end
    def connect_to(this : IMILBitmapEffectInputConnector*, pConnector : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.connect_to.call(this, pConnector)
    end
    def get_connection(this : IMILBitmapEffectInputConnector*, ppConnector : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_connection.call(this, ppConnector)
    end

  end

  @[Extern]
  record IMILBitmapEffectOutputConnectorVtbl,
    query_interface : Proc(IMILBitmapEffectOutputConnector*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMILBitmapEffectOutputConnector*, UInt32),
    release : Proc(IMILBitmapEffectOutputConnector*, UInt32),
    get_index : Proc(IMILBitmapEffectOutputConnector*, UInt32*, Win32cr::Foundation::HRESULT),
    get_optimal_format : Proc(IMILBitmapEffectOutputConnector*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_number_formats : Proc(IMILBitmapEffectOutputConnector*, UInt32*, Win32cr::Foundation::HRESULT),
    get_format : Proc(IMILBitmapEffectOutputConnector*, UInt32, LibC::GUID*, Win32cr::Foundation::HRESULT),
    is_connected : Proc(IMILBitmapEffectOutputConnector*, Int16*, Win32cr::Foundation::HRESULT),
    get_bitmap_effect : Proc(IMILBitmapEffectOutputConnector*, Void**, Win32cr::Foundation::HRESULT),
    get_number_connections : Proc(IMILBitmapEffectOutputConnector*, UInt32*, Win32cr::Foundation::HRESULT),
    get_connection : Proc(IMILBitmapEffectOutputConnector*, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMILBitmapEffectOutputConnector, lpVtbl : IMILBitmapEffectOutputConnectorVtbl* do
    GUID = LibC::GUID.new(0x92957aad_u32, 0x841b_u16, 0x4866_u16, StaticArray[0x82_u8, 0xec_u8, 0x87_u8, 0x52_u8, 0x46_u8, 0x8b_u8, 0x7_u8, 0xfd_u8])
    def query_interface(this : IMILBitmapEffectOutputConnector*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMILBitmapEffectOutputConnector*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMILBitmapEffectOutputConnector*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_index(this : IMILBitmapEffectOutputConnector*, puiIndex : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_index.call(this, puiIndex)
    end
    def get_optimal_format(this : IMILBitmapEffectOutputConnector*, pFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_optimal_format.call(this, pFormat)
    end
    def get_number_formats(this : IMILBitmapEffectOutputConnector*, pulNumberFormats : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_number_formats.call(this, pulNumberFormats)
    end
    def get_format(this : IMILBitmapEffectOutputConnector*, ulIndex : UInt32, pFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_format.call(this, ulIndex, pFormat)
    end
    def is_connected(this : IMILBitmapEffectOutputConnector*, pfConnected : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_connected.call(this, pfConnected)
    end
    def get_bitmap_effect(this : IMILBitmapEffectOutputConnector*, ppEffect : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_bitmap_effect.call(this, ppEffect)
    end
    def get_number_connections(this : IMILBitmapEffectOutputConnector*, puiNumberConnections : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_number_connections.call(this, puiNumberConnections)
    end
    def get_connection(this : IMILBitmapEffectOutputConnector*, uiIndex : UInt32, ppConnection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_connection.call(this, uiIndex, ppConnection)
    end

  end

  @[Extern]
  record IMILBitmapEffectOutputConnectorImplVtbl,
    query_interface : Proc(IMILBitmapEffectOutputConnectorImpl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMILBitmapEffectOutputConnectorImpl*, UInt32),
    release : Proc(IMILBitmapEffectOutputConnectorImpl*, UInt32),
    add_back_link : Proc(IMILBitmapEffectOutputConnectorImpl*, Void*, Win32cr::Foundation::HRESULT),
    remove_back_link : Proc(IMILBitmapEffectOutputConnectorImpl*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMILBitmapEffectOutputConnectorImpl, lpVtbl : IMILBitmapEffectOutputConnectorImplVtbl* do
    GUID = LibC::GUID.new(0x21fae777_u32, 0x8b39_u16, 0x4bfa_u16, StaticArray[0x9f_u8, 0x2d_u8, 0xf3_u8, 0x94_u8, 0x1e_u8, 0xd3_u8, 0x69_u8, 0x13_u8])
    def query_interface(this : IMILBitmapEffectOutputConnectorImpl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMILBitmapEffectOutputConnectorImpl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMILBitmapEffectOutputConnectorImpl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_back_link(this : IMILBitmapEffectOutputConnectorImpl*, pConnection : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_back_link.call(this, pConnection)
    end
    def remove_back_link(this : IMILBitmapEffectOutputConnectorImpl*, pConnection : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_back_link.call(this, pConnection)
    end

  end

  @[Extern]
  record IMILBitmapEffectInteriorInputConnectorVtbl,
    query_interface : Proc(IMILBitmapEffectInteriorInputConnector*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMILBitmapEffectInteriorInputConnector*, UInt32),
    release : Proc(IMILBitmapEffectInteriorInputConnector*, UInt32),
    get_input_connector : Proc(IMILBitmapEffectInteriorInputConnector*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMILBitmapEffectInteriorInputConnector, lpVtbl : IMILBitmapEffectInteriorInputConnectorVtbl* do
    GUID = LibC::GUID.new(0x20287e9e_u32, 0x86a2_u16, 0x4e15_u16, StaticArray[0x95_u8, 0x3d_u8, 0xeb_u8, 0x14_u8, 0x38_u8, 0xa5_u8, 0xb8_u8, 0x42_u8])
    def query_interface(this : IMILBitmapEffectInteriorInputConnector*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMILBitmapEffectInteriorInputConnector*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMILBitmapEffectInteriorInputConnector*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_input_connector(this : IMILBitmapEffectInteriorInputConnector*, pInputConnector : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_input_connector.call(this, pInputConnector)
    end

  end

  @[Extern]
  record IMILBitmapEffectInteriorOutputConnectorVtbl,
    query_interface : Proc(IMILBitmapEffectInteriorOutputConnector*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMILBitmapEffectInteriorOutputConnector*, UInt32),
    release : Proc(IMILBitmapEffectInteriorOutputConnector*, UInt32),
    get_output_connector : Proc(IMILBitmapEffectInteriorOutputConnector*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMILBitmapEffectInteriorOutputConnector, lpVtbl : IMILBitmapEffectInteriorOutputConnectorVtbl* do
    GUID = LibC::GUID.new(0xbbb6dc_u32, 0xacc9_u16, 0x4bfc_u16, StaticArray[0xb3_u8, 0x44_u8, 0x8b_u8, 0xee_u8, 0x38_u8, 0x3d_u8, 0xfe_u8, 0xfa_u8])
    def query_interface(this : IMILBitmapEffectInteriorOutputConnector*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMILBitmapEffectInteriorOutputConnector*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMILBitmapEffectInteriorOutputConnector*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_output_connector(this : IMILBitmapEffectInteriorOutputConnector*, pOutputConnector : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output_connector.call(this, pOutputConnector)
    end

  end

  @[Extern]
  record IMILBitmapEffectEventsVtbl,
    query_interface : Proc(IMILBitmapEffectEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMILBitmapEffectEvents*, UInt32),
    release : Proc(IMILBitmapEffectEvents*, UInt32),
    property_change : Proc(IMILBitmapEffectEvents*, Void*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    dirty_region : Proc(IMILBitmapEffectEvents*, Void*, Win32cr::UI::Wpf::MilRectD*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMILBitmapEffectEvents, lpVtbl : IMILBitmapEffectEventsVtbl* do
    GUID = LibC::GUID.new(0x2e880dd8_u32, 0xf8ce_u16, 0x457b_u16, StaticArray[0x81_u8, 0x99_u8, 0xd6_u8, 0xb_u8, 0xb3_u8, 0xd7_u8, 0xef_u8, 0x98_u8])
    def query_interface(this : IMILBitmapEffectEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMILBitmapEffectEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMILBitmapEffectEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def property_change(this : IMILBitmapEffectEvents*, pEffect : Void*, bstrPropertyName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.property_change.call(this, pEffect, bstrPropertyName)
    end
    def dirty_region(this : IMILBitmapEffectEvents*, pEffect : Void*, pRect : Win32cr::UI::Wpf::MilRectD*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.dirty_region.call(this, pEffect, pRect)
    end

  end

end