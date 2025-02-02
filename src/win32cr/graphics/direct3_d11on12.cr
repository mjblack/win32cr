require "./../system/com.cr"
require "./direct3_d.cr"
require "./direct3_d11.cr"
require "./../foundation.cr"
require "./direct3_d12.cr"

module Win32cr::Graphics::Direct3D11on12
  extend self
  alias PFN_D3D11ON12_CREATE_DEVICE = Proc(Void*, UInt32, Win32cr::Graphics::Direct3D::D3D_FEATURE_LEVEL*, UInt32, Void**, UInt32, UInt32, Void**, Void**, Win32cr::Graphics::Direct3D::D3D_FEATURE_LEVEL*, Win32cr::Foundation::HRESULT)



  @[Extern]
  struct D3D11_RESOURCE_FLAGS
    property bind_flags : UInt32
    property misc_flags : UInt32
    property cpu_access_flags : UInt32
    property structure_byte_stride : UInt32
    def initialize(@bind_flags : UInt32, @misc_flags : UInt32, @cpu_access_flags : UInt32, @structure_byte_stride : UInt32)
    end
  end

  @[Extern]
  record ID3D11On12DeviceVtbl,
    query_interface : Proc(ID3D11On12Device*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ID3D11On12Device*, UInt32),
    release : Proc(ID3D11On12Device*, UInt32),
    create_wrapped_resource : Proc(ID3D11On12Device*, Void*, Win32cr::Graphics::Direct3D11on12::D3D11_RESOURCE_FLAGS*, Win32cr::Graphics::Direct3D12::D3D12_RESOURCE_STATES, Win32cr::Graphics::Direct3D12::D3D12_RESOURCE_STATES, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    release_wrapped_resources : Proc(ID3D11On12Device*, Void**, UInt32, Void),
    acquire_wrapped_resources : Proc(ID3D11On12Device*, Void**, UInt32, Void)


  @[Extern]
  record ID3D11On12Device, lpVtbl : ID3D11On12DeviceVtbl* do
    GUID = LibC::GUID.new(0x85611e73_u32, 0x70a9_u16, 0x490e_u16, StaticArray[0x96_u8, 0x14_u8, 0xa9_u8, 0xe3_u8, 0x2_u8, 0x77_u8, 0x79_u8, 0x4_u8])
    def query_interface(this : ID3D11On12Device*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ID3D11On12Device*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ID3D11On12Device*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_wrapped_resource(this : ID3D11On12Device*, pResource12 : Void*, pFlags11 : Win32cr::Graphics::Direct3D11on12::D3D11_RESOURCE_FLAGS*, in_state : Win32cr::Graphics::Direct3D12::D3D12_RESOURCE_STATES, out_state : Win32cr::Graphics::Direct3D12::D3D12_RESOURCE_STATES, riid : LibC::GUID*, ppResource11 : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_wrapped_resource.call(this, pResource12, pFlags11, in_state, out_state, riid, ppResource11)
    end
    def release_wrapped_resources(this : ID3D11On12Device*, ppResources : Void**, num_resources : UInt32) : Void
      @lpVtbl.try &.value.release_wrapped_resources.call(this, ppResources, num_resources)
    end
    def acquire_wrapped_resources(this : ID3D11On12Device*, ppResources : Void**, num_resources : UInt32) : Void
      @lpVtbl.try &.value.acquire_wrapped_resources.call(this, ppResources, num_resources)
    end

  end

  @[Extern]
  record ID3D11On12Device1Vtbl,
    query_interface : Proc(ID3D11On12Device1*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ID3D11On12Device1*, UInt32),
    release : Proc(ID3D11On12Device1*, UInt32),
    create_wrapped_resource : Proc(ID3D11On12Device1*, Void*, Win32cr::Graphics::Direct3D11on12::D3D11_RESOURCE_FLAGS*, Win32cr::Graphics::Direct3D12::D3D12_RESOURCE_STATES, Win32cr::Graphics::Direct3D12::D3D12_RESOURCE_STATES, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    release_wrapped_resources : Proc(ID3D11On12Device1*, Void**, UInt32, Void),
    acquire_wrapped_resources : Proc(ID3D11On12Device1*, Void**, UInt32, Void),
    get_d3_d12_device : Proc(ID3D11On12Device1*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ID3D11On12Device1, lpVtbl : ID3D11On12Device1Vtbl* do
    GUID = LibC::GUID.new(0xbdb64df4_u32, 0xea2f_u16, 0x4c70_u16, StaticArray[0xb8_u8, 0x61_u8, 0xaa_u8, 0xab_u8, 0x12_u8, 0x58_u8, 0xbb_u8, 0x5d_u8])
    def query_interface(this : ID3D11On12Device1*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ID3D11On12Device1*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ID3D11On12Device1*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_wrapped_resource(this : ID3D11On12Device1*, pResource12 : Void*, pFlags11 : Win32cr::Graphics::Direct3D11on12::D3D11_RESOURCE_FLAGS*, in_state : Win32cr::Graphics::Direct3D12::D3D12_RESOURCE_STATES, out_state : Win32cr::Graphics::Direct3D12::D3D12_RESOURCE_STATES, riid : LibC::GUID*, ppResource11 : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_wrapped_resource.call(this, pResource12, pFlags11, in_state, out_state, riid, ppResource11)
    end
    def release_wrapped_resources(this : ID3D11On12Device1*, ppResources : Void**, num_resources : UInt32) : Void
      @lpVtbl.try &.value.release_wrapped_resources.call(this, ppResources, num_resources)
    end
    def acquire_wrapped_resources(this : ID3D11On12Device1*, ppResources : Void**, num_resources : UInt32) : Void
      @lpVtbl.try &.value.acquire_wrapped_resources.call(this, ppResources, num_resources)
    end
    def get_d3_d12_device(this : ID3D11On12Device1*, riid : LibC::GUID*, ppvDevice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_d3_d12_device.call(this, riid, ppvDevice)
    end

  end

  @[Extern]
  record ID3D11On12Device2Vtbl,
    query_interface : Proc(ID3D11On12Device2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ID3D11On12Device2*, UInt32),
    release : Proc(ID3D11On12Device2*, UInt32),
    create_wrapped_resource : Proc(ID3D11On12Device2*, Void*, Win32cr::Graphics::Direct3D11on12::D3D11_RESOURCE_FLAGS*, Win32cr::Graphics::Direct3D12::D3D12_RESOURCE_STATES, Win32cr::Graphics::Direct3D12::D3D12_RESOURCE_STATES, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    release_wrapped_resources : Proc(ID3D11On12Device2*, Void**, UInt32, Void),
    acquire_wrapped_resources : Proc(ID3D11On12Device2*, Void**, UInt32, Void),
    get_d3_d12_device : Proc(ID3D11On12Device2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    unwrap_underlying_resource : Proc(ID3D11On12Device2*, Void*, Void*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    return_underlying_resource : Proc(ID3D11On12Device2*, Void*, UInt32, UInt64*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ID3D11On12Device2, lpVtbl : ID3D11On12Device2Vtbl* do
    GUID = LibC::GUID.new(0xdc90f331_u32, 0x4740_u16, 0x43fa_u16, StaticArray[0x86_u8, 0x6e_u8, 0x67_u8, 0xf1_u8, 0x2c_u8, 0xb5_u8, 0x82_u8, 0x23_u8])
    def query_interface(this : ID3D11On12Device2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ID3D11On12Device2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ID3D11On12Device2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_wrapped_resource(this : ID3D11On12Device2*, pResource12 : Void*, pFlags11 : Win32cr::Graphics::Direct3D11on12::D3D11_RESOURCE_FLAGS*, in_state : Win32cr::Graphics::Direct3D12::D3D12_RESOURCE_STATES, out_state : Win32cr::Graphics::Direct3D12::D3D12_RESOURCE_STATES, riid : LibC::GUID*, ppResource11 : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_wrapped_resource.call(this, pResource12, pFlags11, in_state, out_state, riid, ppResource11)
    end
    def release_wrapped_resources(this : ID3D11On12Device2*, ppResources : Void**, num_resources : UInt32) : Void
      @lpVtbl.try &.value.release_wrapped_resources.call(this, ppResources, num_resources)
    end
    def acquire_wrapped_resources(this : ID3D11On12Device2*, ppResources : Void**, num_resources : UInt32) : Void
      @lpVtbl.try &.value.acquire_wrapped_resources.call(this, ppResources, num_resources)
    end
    def get_d3_d12_device(this : ID3D11On12Device2*, riid : LibC::GUID*, ppvDevice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_d3_d12_device.call(this, riid, ppvDevice)
    end
    def unwrap_underlying_resource(this : ID3D11On12Device2*, pResource11 : Void*, pCommandQueue : Void*, riid : LibC::GUID*, ppvResource12 : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unwrap_underlying_resource.call(this, pResource11, pCommandQueue, riid, ppvResource12)
    end
    def return_underlying_resource(this : ID3D11On12Device2*, pResource11 : Void*, num_sync : UInt32, pSignalValues : UInt64*, ppFences : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.return_underlying_resource.call(this, pResource11, num_sync, pSignalValues, ppFences)
    end

  end

  def d3D11On12CreateDevice(pDevice : Void*, flags : UInt32, pFeatureLevels : Win32cr::Graphics::Direct3D::D3D_FEATURE_LEVEL*, feature_levels : UInt32, ppCommandQueues : Void**, num_queues : UInt32, node_mask : UInt32, ppDevice : Void**, ppImmediateContext : Void**, pChosenFeatureLevel : Win32cr::Graphics::Direct3D::D3D_FEATURE_LEVEL*) : Win32cr::Foundation::HRESULT
    C.D3D11On12CreateDevice(pDevice, flags, pFeatureLevels, feature_levels, ppCommandQueues, num_queues, node_mask, ppDevice, ppImmediateContext, pChosenFeatureLevel)
  end

  @[Link("d3d11")]
  lib C
    # :nodoc:
    fun D3D11On12CreateDevice(pDevice : Void*, flags : UInt32, pFeatureLevels : Win32cr::Graphics::Direct3D::D3D_FEATURE_LEVEL*, feature_levels : UInt32, ppCommandQueues : Void**, num_queues : UInt32, node_mask : UInt32, ppDevice : Void**, ppImmediateContext : Void**, pChosenFeatureLevel : Win32cr::Graphics::Direct3D::D3D_FEATURE_LEVEL*) : Win32cr::Foundation::HRESULT

  end
end