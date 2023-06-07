require "../../system/winrt.cr"
require "../../foundation.cr"
require "../../graphics/direct3d12.cr"

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

  struct IHolographicCameraInteropVTbl
    query_interface : Proc(IHolographicCameraInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IHolographicCameraInterop*, UInt32)
    release : Proc(IHolographicCameraInterop*, UInt32)
    get_iids : Proc(IHolographicCameraInterop*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(IHolographicCameraInterop*, HSTRING*, HRESULT)
    get_trust_level : Proc(IHolographicCameraInterop*, TrustLevel*, HRESULT)
    create_direct3_d12_back_buffer_resource : Proc(IHolographicCameraInterop*, ID3D12Device, D3D12_RESOURCE_DESC*, ID3D12Resource*, HRESULT)
    create_direct3_d12_hardware_protected_back_buffer_resource : Proc(IHolographicCameraInterop*, ID3D12Device, D3D12_RESOURCE_DESC*, ID3D12ProtectedResourceSession, ID3D12Resource*, HRESULT)
    acquire_direct3_d12_buffer_resource : Proc(IHolographicCameraInterop*, ID3D12Resource, ID3D12CommandQueue, HRESULT)
    acquire_direct3_d12_buffer_resource_with_timeout : Proc(IHolographicCameraInterop*, ID3D12Resource, ID3D12CommandQueue, UInt64, HRESULT)
    unacquire_direct3_d12_buffer_resource : Proc(IHolographicCameraInterop*, ID3D12Resource, HRESULT)
  end

  struct IHolographicCameraInterop
    lpVtbl : IHolographicCameraInteropVTbl*
  end

  struct IHolographicCameraRenderingParametersInteropVTbl
    query_interface : Proc(IHolographicCameraRenderingParametersInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IHolographicCameraRenderingParametersInterop*, UInt32)
    release : Proc(IHolographicCameraRenderingParametersInterop*, UInt32)
    get_iids : Proc(IHolographicCameraRenderingParametersInterop*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(IHolographicCameraRenderingParametersInterop*, HSTRING*, HRESULT)
    get_trust_level : Proc(IHolographicCameraRenderingParametersInterop*, TrustLevel*, HRESULT)
    commit_direct3_d12_resource : Proc(IHolographicCameraRenderingParametersInterop*, ID3D12Resource, ID3D12Fence, UInt64, HRESULT)
    commit_direct3_d12_resource_with_depth_data : Proc(IHolographicCameraRenderingParametersInterop*, ID3D12Resource, ID3D12Fence, UInt64, ID3D12Resource, ID3D12Fence, UInt64, HRESULT)
  end

  struct IHolographicCameraRenderingParametersInterop
    lpVtbl : IHolographicCameraRenderingParametersInteropVTbl*
  end

  struct IHolographicQuadLayerInteropVTbl
    query_interface : Proc(IHolographicQuadLayerInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IHolographicQuadLayerInterop*, UInt32)
    release : Proc(IHolographicQuadLayerInterop*, UInt32)
    get_iids : Proc(IHolographicQuadLayerInterop*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(IHolographicQuadLayerInterop*, HSTRING*, HRESULT)
    get_trust_level : Proc(IHolographicQuadLayerInterop*, TrustLevel*, HRESULT)
    create_direct3_d12_content_buffer_resource : Proc(IHolographicQuadLayerInterop*, ID3D12Device, D3D12_RESOURCE_DESC*, ID3D12Resource*, HRESULT)
    create_direct3_d12_hardware_protected_content_buffer_resource : Proc(IHolographicQuadLayerInterop*, ID3D12Device, D3D12_RESOURCE_DESC*, ID3D12ProtectedResourceSession, ID3D12Resource*, HRESULT)
    acquire_direct3_d12_buffer_resource : Proc(IHolographicQuadLayerInterop*, ID3D12Resource, ID3D12CommandQueue, HRESULT)
    acquire_direct3_d12_buffer_resource_with_timeout : Proc(IHolographicQuadLayerInterop*, ID3D12Resource, ID3D12CommandQueue, UInt64, HRESULT)
    unacquire_direct3_d12_buffer_resource : Proc(IHolographicQuadLayerInterop*, ID3D12Resource, HRESULT)
  end

  struct IHolographicQuadLayerInterop
    lpVtbl : IHolographicQuadLayerInteropVTbl*
  end

  struct IHolographicQuadLayerUpdateParametersInteropVTbl
    query_interface : Proc(IHolographicQuadLayerUpdateParametersInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IHolographicQuadLayerUpdateParametersInterop*, UInt32)
    release : Proc(IHolographicQuadLayerUpdateParametersInterop*, UInt32)
    get_iids : Proc(IHolographicQuadLayerUpdateParametersInterop*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(IHolographicQuadLayerUpdateParametersInterop*, HSTRING*, HRESULT)
    get_trust_level : Proc(IHolographicQuadLayerUpdateParametersInterop*, TrustLevel*, HRESULT)
    commit_direct3_d12_resource : Proc(IHolographicQuadLayerUpdateParametersInterop*, ID3D12Resource, ID3D12Fence, UInt64, HRESULT)
  end

  struct IHolographicQuadLayerUpdateParametersInterop
    lpVtbl : IHolographicQuadLayerUpdateParametersInteropVTbl*
  end

end
