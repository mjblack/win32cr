require "./../foundation.cr"
require "./../system/com.cr"
require "./direct3_d9.cr"
require "./direct3_d12.cr"

module Win32cr::Graphics::Direct3D9on12
  alias PFN_Direct3DCreate9On12Ex = Proc(UInt32, Win32cr::Graphics::Direct3D9on12::D3D9ON12_ARGS*, UInt32, Void**, Win32cr::Foundation::HRESULT)*

  alias PFN_Direct3DCreate9On12 = Proc(UInt32, Win32cr::Graphics::Direct3D9on12::D3D9ON12_ARGS*, UInt32, Void*)*

  MAX_D3D9ON12_QUEUES = 2_u32


  @[Extern]
  record D3D9ON12_ARGS,
    enable9_on12 : Win32cr::Foundation::BOOL,
    pD3D12Device : Void*,
    ppD3D12Queues : Void*[2],
    num_queues : UInt32,
    node_mask : UInt32

  @[Extern]
  record IDirect3DDevice9On12Vtbl,
    query_interface : Proc(IDirect3DDevice9On12*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirect3DDevice9On12*, UInt32),
    release : Proc(IDirect3DDevice9On12*, UInt32),
    get_d3_d12_device : Proc(IDirect3DDevice9On12*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    unwrap_underlying_resource : Proc(IDirect3DDevice9On12*, Void*, Void*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    return_underlying_resource : Proc(IDirect3DDevice9On12*, Void*, UInt32, UInt64*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("e7fda234-b589-4049-940d-8878977531c8")]
  record IDirect3DDevice9On12, lpVtbl : IDirect3DDevice9On12Vtbl* do
    GUID = LibC::GUID.new(0xe7fda234_u32, 0xb589_u16, 0x4049_u16, StaticArray[0x94_u8, 0xd_u8, 0x88_u8, 0x78_u8, 0x97_u8, 0x75_u8, 0x31_u8, 0xc8_u8])
    def query_interface(this : IDirect3DDevice9On12*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirect3DDevice9On12*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirect3DDevice9On12*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_d3_d12_device(this : IDirect3DDevice9On12*, riid : LibC::GUID*, ppvDevice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_d3_d12_device.call(this, riid, ppvDevice)
    end
    def unwrap_underlying_resource(this : IDirect3DDevice9On12*, pResource : Void*, pCommandQueue : Void*, riid : LibC::GUID*, ppvResource12 : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unwrap_underlying_resource.call(this, pResource, pCommandQueue, riid, ppvResource12)
    end
    def return_underlying_resource(this : IDirect3DDevice9On12*, pResource : Void*, num_sync : UInt32, pSignalValues : UInt64*, ppFences : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.return_underlying_resource.call(this, pResource, num_sync, pSignalValues, ppFences)
    end

  end

  @[Link("d3d9")]
  lib C
    fun Direct3DCreate9On12Ex(sdk_version : UInt32, pOverrideList : Win32cr::Graphics::Direct3D9on12::D3D9ON12_ARGS*, num_override_entries : UInt32, ppOutputInterface : Void**) : Win32cr::Foundation::HRESULT

    fun Direct3DCreate9On12(sdk_version : UInt32, pOverrideList : Win32cr::Graphics::Direct3D9on12::D3D9ON12_ARGS*, num_override_entries : UInt32) : Void*

  end
end