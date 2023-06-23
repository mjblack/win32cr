require "../foundation.cr"
require "../system/com.cr"
require "../graphics/direct3d.cr"
require "../graphics/direct3d11.cr"
require "../graphics/direct3d12.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:d3d11.dll")]
{% else %}
@[Link("d3d11")]
{% end %}
lib LibWin32
  alias PFN_D3D11ON12_CREATE_DEVICE = Proc(IUnknown, UInt32, D3D_FEATURE_LEVEL*, UInt32, IUnknown*, UInt32, UInt32, ID3D11Device*, ID3D11DeviceContext*, D3D_FEATURE_LEVEL*, HRESULT)

  struct D3D11_RESOURCE_FLAGS
    bind_flags : UInt32
    misc_flags : UInt32
    cpu_access_flags : UInt32
    structure_byte_stride : UInt32
  end


  struct ID3D11On12DeviceVTbl
    query_interface : Proc(ID3D11On12Device*, Guid*, Void**, HRESULT)
    add_ref : Proc(ID3D11On12Device*, UInt32)
    release : Proc(ID3D11On12Device*, UInt32)
    create_wrapped_resource : Proc(ID3D11On12Device*, IUnknown, D3D11_RESOURCE_FLAGS*, D3D12_RESOURCE_STATES, D3D12_RESOURCE_STATES, Guid*, Void**, HRESULT)
    release_wrapped_resources : Proc(ID3D11On12Device*, ID3D11Resource*, UInt32, Void)
    acquire_wrapped_resources : Proc(ID3D11On12Device*, ID3D11Resource*, UInt32, Void)
  end

  ID3D11On12Device_GUID = "85611e73-70a9-490e-9614-a9e302777904"
  IID_ID3D11On12Device = LibC::GUID.new(0x85611e73_u32, 0x70a9_u16, 0x490e_u16, StaticArray[0x96_u8, 0x14_u8, 0xa9_u8, 0xe3_u8, 0x2_u8, 0x77_u8, 0x79_u8, 0x4_u8])
  struct ID3D11On12Device
    lpVtbl : ID3D11On12DeviceVTbl*
  end

  struct ID3D11On12Device1VTbl
    query_interface : Proc(ID3D11On12Device1*, Guid*, Void**, HRESULT)
    add_ref : Proc(ID3D11On12Device1*, UInt32)
    release : Proc(ID3D11On12Device1*, UInt32)
    create_wrapped_resource : Proc(ID3D11On12Device1*, IUnknown, D3D11_RESOURCE_FLAGS*, D3D12_RESOURCE_STATES, D3D12_RESOURCE_STATES, Guid*, Void**, HRESULT)
    release_wrapped_resources : Proc(ID3D11On12Device1*, ID3D11Resource*, UInt32, Void)
    acquire_wrapped_resources : Proc(ID3D11On12Device1*, ID3D11Resource*, UInt32, Void)
    get_d3_d12_device : Proc(ID3D11On12Device1*, Guid*, Void**, HRESULT)
  end

  ID3D11On12Device1_GUID = "bdb64df4-ea2f-4c70-b861-aaab1258bb5d"
  IID_ID3D11On12Device1 = LibC::GUID.new(0xbdb64df4_u32, 0xea2f_u16, 0x4c70_u16, StaticArray[0xb8_u8, 0x61_u8, 0xaa_u8, 0xab_u8, 0x12_u8, 0x58_u8, 0xbb_u8, 0x5d_u8])
  struct ID3D11On12Device1
    lpVtbl : ID3D11On12Device1VTbl*
  end

  struct ID3D11On12Device2VTbl
    query_interface : Proc(ID3D11On12Device2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ID3D11On12Device2*, UInt32)
    release : Proc(ID3D11On12Device2*, UInt32)
    create_wrapped_resource : Proc(ID3D11On12Device2*, IUnknown, D3D11_RESOURCE_FLAGS*, D3D12_RESOURCE_STATES, D3D12_RESOURCE_STATES, Guid*, Void**, HRESULT)
    release_wrapped_resources : Proc(ID3D11On12Device2*, ID3D11Resource*, UInt32, Void)
    acquire_wrapped_resources : Proc(ID3D11On12Device2*, ID3D11Resource*, UInt32, Void)
    get_d3_d12_device : Proc(ID3D11On12Device2*, Guid*, Void**, HRESULT)
    unwrap_underlying_resource : Proc(ID3D11On12Device2*, ID3D11Resource, ID3D12CommandQueue, Guid*, Void**, HRESULT)
    return_underlying_resource : Proc(ID3D11On12Device2*, ID3D11Resource, UInt32, UInt64*, ID3D12Fence*, HRESULT)
  end

  ID3D11On12Device2_GUID = "dc90f331-4740-43fa-866e-67f12cb58223"
  IID_ID3D11On12Device2 = LibC::GUID.new(0xdc90f331_u32, 0x4740_u16, 0x43fa_u16, StaticArray[0x86_u8, 0x6e_u8, 0x67_u8, 0xf1_u8, 0x2c_u8, 0xb5_u8, 0x82_u8, 0x23_u8])
  struct ID3D11On12Device2
    lpVtbl : ID3D11On12Device2VTbl*
  end


  # Params # pdevice : IUnknown [In],flags : UInt32 [In],pfeaturelevels : D3D_FEATURE_LEVEL* [In],featurelevels : UInt32 [In],ppcommandqueues : IUnknown* [In],numqueues : UInt32 [In],nodemask : UInt32 [In],ppdevice : ID3D11Device* [In],ppimmediatecontext : ID3D11DeviceContext* [In],pchosenfeaturelevel : D3D_FEATURE_LEVEL* [In]
  fun D3D11On12CreateDevice(pdevice : IUnknown, flags : UInt32, pfeaturelevels : D3D_FEATURE_LEVEL*, featurelevels : UInt32, ppcommandqueues : IUnknown*, numqueues : UInt32, nodemask : UInt32, ppdevice : ID3D11Device*, ppimmediatecontext : ID3D11DeviceContext*, pchosenfeaturelevel : D3D_FEATURE_LEVEL*) : HRESULT
end
struct LibWin32::ID3D11On12Device
  def query_interface(this : ID3D11On12Device*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ID3D11On12Device*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ID3D11On12Device*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_wrapped_resource(this : ID3D11On12Device*, presource12 : IUnknown, pflags11 : D3D11_RESOURCE_FLAGS*, instate : D3D12_RESOURCE_STATES, outstate : D3D12_RESOURCE_STATES, riid : Guid*, ppresource11 : Void**) : HRESULT
    @lpVtbl.value.create_wrapped_resource.call(this, presource12, pflags11, instate, outstate, riid, ppresource11)
  end
  def release_wrapped_resources(this : ID3D11On12Device*, ppresources : ID3D11Resource*, numresources : UInt32) : Void
    @lpVtbl.value.release_wrapped_resources.call(this, ppresources, numresources)
  end
  def acquire_wrapped_resources(this : ID3D11On12Device*, ppresources : ID3D11Resource*, numresources : UInt32) : Void
    @lpVtbl.value.acquire_wrapped_resources.call(this, ppresources, numresources)
  end
end
struct LibWin32::ID3D11On12Device1
  def query_interface(this : ID3D11On12Device1*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ID3D11On12Device1*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ID3D11On12Device1*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_wrapped_resource(this : ID3D11On12Device1*, presource12 : IUnknown, pflags11 : D3D11_RESOURCE_FLAGS*, instate : D3D12_RESOURCE_STATES, outstate : D3D12_RESOURCE_STATES, riid : Guid*, ppresource11 : Void**) : HRESULT
    @lpVtbl.value.create_wrapped_resource.call(this, presource12, pflags11, instate, outstate, riid, ppresource11)
  end
  def release_wrapped_resources(this : ID3D11On12Device1*, ppresources : ID3D11Resource*, numresources : UInt32) : Void
    @lpVtbl.value.release_wrapped_resources.call(this, ppresources, numresources)
  end
  def acquire_wrapped_resources(this : ID3D11On12Device1*, ppresources : ID3D11Resource*, numresources : UInt32) : Void
    @lpVtbl.value.acquire_wrapped_resources.call(this, ppresources, numresources)
  end
  def get_d3_d12_device(this : ID3D11On12Device1*, riid : Guid*, ppvdevice : Void**) : HRESULT
    @lpVtbl.value.get_d3_d12_device.call(this, riid, ppvdevice)
  end
end
struct LibWin32::ID3D11On12Device2
  def query_interface(this : ID3D11On12Device2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ID3D11On12Device2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ID3D11On12Device2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_wrapped_resource(this : ID3D11On12Device2*, presource12 : IUnknown, pflags11 : D3D11_RESOURCE_FLAGS*, instate : D3D12_RESOURCE_STATES, outstate : D3D12_RESOURCE_STATES, riid : Guid*, ppresource11 : Void**) : HRESULT
    @lpVtbl.value.create_wrapped_resource.call(this, presource12, pflags11, instate, outstate, riid, ppresource11)
  end
  def release_wrapped_resources(this : ID3D11On12Device2*, ppresources : ID3D11Resource*, numresources : UInt32) : Void
    @lpVtbl.value.release_wrapped_resources.call(this, ppresources, numresources)
  end
  def acquire_wrapped_resources(this : ID3D11On12Device2*, ppresources : ID3D11Resource*, numresources : UInt32) : Void
    @lpVtbl.value.acquire_wrapped_resources.call(this, ppresources, numresources)
  end
  def get_d3_d12_device(this : ID3D11On12Device2*, riid : Guid*, ppvdevice : Void**) : HRESULT
    @lpVtbl.value.get_d3_d12_device.call(this, riid, ppvdevice)
  end
  def unwrap_underlying_resource(this : ID3D11On12Device2*, presource11 : ID3D11Resource, pcommandqueue : ID3D12CommandQueue, riid : Guid*, ppvresource12 : Void**) : HRESULT
    @lpVtbl.value.unwrap_underlying_resource.call(this, presource11, pcommandqueue, riid, ppvresource12)
  end
  def return_underlying_resource(this : ID3D11On12Device2*, presource11 : ID3D11Resource, numsync : UInt32, psignalvalues : UInt64*, ppfences : ID3D12Fence*) : HRESULT
    @lpVtbl.value.return_underlying_resource.call(this, presource11, numsync, psignalvalues, ppfences)
  end
end
