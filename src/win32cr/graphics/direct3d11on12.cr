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

  struct ID3D11On12Device2
    lpVtbl : ID3D11On12Device2VTbl*
  end


  # Params # pdevice : IUnknown [In],flags : UInt32 [In],pfeaturelevels : D3D_FEATURE_LEVEL* [In],featurelevels : UInt32 [In],ppcommandqueues : IUnknown* [In],numqueues : UInt32 [In],nodemask : UInt32 [In],ppdevice : ID3D11Device* [In],ppimmediatecontext : ID3D11DeviceContext* [In],pchosenfeaturelevel : D3D_FEATURE_LEVEL* [In]
  fun D3D11On12CreateDevice(pdevice : IUnknown, flags : UInt32, pfeaturelevels : D3D_FEATURE_LEVEL*, featurelevels : UInt32, ppcommandqueues : IUnknown*, numqueues : UInt32, nodemask : UInt32, ppdevice : ID3D11Device*, ppimmediatecontext : ID3D11DeviceContext*, pchosenfeaturelevel : D3D_FEATURE_LEVEL*) : HRESULT
end
