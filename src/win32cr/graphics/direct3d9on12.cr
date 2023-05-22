require "../foundation.cr"
require "../system/com.cr"
require "../graphics/direct3d9.cr"
require "../graphics/direct3d12.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:d3d9.dll")]
lib LibWin32
  MAX_D3D9ON12_QUEUES = 2_u32

  alias PFN_Direct3DCreate9On12Ex = Proc(UInt32, D3D9ON12_ARGS*, UInt32, IDirect3D9Ex*, HRESULT)
  alias PFN_Direct3DCreate9On12 = Proc(UInt32, D3D9ON12_ARGS*, UInt32, IDirect3D9)

  struct D3D9ON12_ARGS
    enable9_on12 : LibC::BOOL
    p_d3_d12_device : IUnknown
    pp_d3_d12_queues : IUnknown[2]*
    num_queues : UInt32
    node_mask : UInt32
  end


  struct IDirect3DDevice9On12VTbl
    query_interface : Proc(IDirect3DDevice9On12*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirect3DDevice9On12*, UInt32)
    release : Proc(IDirect3DDevice9On12*, UInt32)
    get_d3_d12_device : Proc(IDirect3DDevice9On12*, Guid*, Void**, HRESULT)
    unwrap_underlying_resource : Proc(IDirect3DDevice9On12*, IDirect3DResource9, ID3D12CommandQueue, Guid*, Void**, HRESULT)
    return_underlying_resource : Proc(IDirect3DDevice9On12*, IDirect3DResource9, UInt32, UInt64*, ID3D12Fence*, HRESULT)
  end

  struct IDirect3DDevice9On12
    lpVtbl : IDirect3DDevice9On12VTbl*
  end


  # Params # sdkversion : UInt32 [In],poverridelist : D3D9ON12_ARGS* [In],numoverrideentries : UInt32 [In],ppoutputinterface : IDirect3D9Ex* [In]
  fun Direct3DCreate9On12Ex(sdkversion : UInt32, poverridelist : D3D9ON12_ARGS*, numoverrideentries : UInt32, ppoutputinterface : IDirect3D9Ex*) : HRESULT

  # Params # sdkversion : UInt32 [In],poverridelist : D3D9ON12_ARGS* [In],numoverrideentries : UInt32 [In]
  fun Direct3DCreate9On12(sdkversion : UInt32, poverridelist : D3D9ON12_ARGS*, numoverrideentries : UInt32) : IDirect3D9
end
