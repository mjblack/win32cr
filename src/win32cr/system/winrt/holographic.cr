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

  IHolographicCameraInterop_GUID = "7cc1f9c5-6d02-41fa-9500-e1809eb48eec"
  IID_IHolographicCameraInterop = LibC::GUID.new(0x7cc1f9c5_u32, 0x6d02_u16, 0x41fa_u16, StaticArray[0x95_u8, 0x0_u8, 0xe1_u8, 0x80_u8, 0x9e_u8, 0xb4_u8, 0x8e_u8, 0xec_u8])
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

  IHolographicCameraRenderingParametersInterop_GUID = "f75b68d6-d1fd-4707-aafd-fa6f4c0e3bf4"
  IID_IHolographicCameraRenderingParametersInterop = LibC::GUID.new(0xf75b68d6_u32, 0xd1fd_u16, 0x4707_u16, StaticArray[0xaa_u8, 0xfd_u8, 0xfa_u8, 0x6f_u8, 0x4c_u8, 0xe_u8, 0x3b_u8, 0xf4_u8])
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

  IHolographicQuadLayerInterop_GUID = "cfa688f0-639e-4a47-83d7-6b7f5ebf7fed"
  IID_IHolographicQuadLayerInterop = LibC::GUID.new(0xcfa688f0_u32, 0x639e_u16, 0x4a47_u16, StaticArray[0x83_u8, 0xd7_u8, 0x6b_u8, 0x7f_u8, 0x5e_u8, 0xbf_u8, 0x7f_u8, 0xed_u8])
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

  IHolographicQuadLayerUpdateParametersInterop_GUID = "e5f549cd-c909-444f-8809-7cc18a9c8920"
  IID_IHolographicQuadLayerUpdateParametersInterop = LibC::GUID.new(0xe5f549cd_u32, 0xc909_u16, 0x444f_u16, StaticArray[0x88_u8, 0x9_u8, 0x7c_u8, 0xc1_u8, 0x8a_u8, 0x9c_u8, 0x89_u8, 0x20_u8])
  struct IHolographicQuadLayerUpdateParametersInterop
    lpVtbl : IHolographicQuadLayerUpdateParametersInteropVTbl*
  end

end
struct LibWin32::IHolographicCameraInterop
  def query_interface(this : IHolographicCameraInterop*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IHolographicCameraInterop*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IHolographicCameraInterop*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_iids(this : IHolographicCameraInterop*, iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.call(this, iidcount, iids)
  end
  def get_runtime_class_name(this : IHolographicCameraInterop*, classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.call(this, classname)
  end
  def get_trust_level(this : IHolographicCameraInterop*, trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.call(this, trustlevel)
  end
  def create_direct3_d12_back_buffer_resource(this : IHolographicCameraInterop*, pdevice : ID3D12Device, ptexture2ddesc : D3D12_RESOURCE_DESC*, ppcreatedtexture2dresource : ID3D12Resource*) : HRESULT
    @lpVtbl.value.create_direct3_d12_back_buffer_resource.call(this, pdevice, ptexture2ddesc, ppcreatedtexture2dresource)
  end
  def create_direct3_d12_hardware_protected_back_buffer_resource(this : IHolographicCameraInterop*, pdevice : ID3D12Device, ptexture2ddesc : D3D12_RESOURCE_DESC*, pprotectedresourcesession : ID3D12ProtectedResourceSession, ppcreatedtexture2dresource : ID3D12Resource*) : HRESULT
    @lpVtbl.value.create_direct3_d12_hardware_protected_back_buffer_resource.call(this, pdevice, ptexture2ddesc, pprotectedresourcesession, ppcreatedtexture2dresource)
  end
  def acquire_direct3_d12_buffer_resource(this : IHolographicCameraInterop*, presourcetoacquire : ID3D12Resource, pcommandqueue : ID3D12CommandQueue) : HRESULT
    @lpVtbl.value.acquire_direct3_d12_buffer_resource.call(this, presourcetoacquire, pcommandqueue)
  end
  def acquire_direct3_d12_buffer_resource_with_timeout(this : IHolographicCameraInterop*, presourcetoacquire : ID3D12Resource, pcommandqueue : ID3D12CommandQueue, duration : UInt64) : HRESULT
    @lpVtbl.value.acquire_direct3_d12_buffer_resource_with_timeout.call(this, presourcetoacquire, pcommandqueue, duration)
  end
  def unacquire_direct3_d12_buffer_resource(this : IHolographicCameraInterop*, presourcetounacquire : ID3D12Resource) : HRESULT
    @lpVtbl.value.unacquire_direct3_d12_buffer_resource.call(this, presourcetounacquire)
  end
end
struct LibWin32::IHolographicCameraRenderingParametersInterop
  def query_interface(this : IHolographicCameraRenderingParametersInterop*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IHolographicCameraRenderingParametersInterop*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IHolographicCameraRenderingParametersInterop*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_iids(this : IHolographicCameraRenderingParametersInterop*, iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.call(this, iidcount, iids)
  end
  def get_runtime_class_name(this : IHolographicCameraRenderingParametersInterop*, classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.call(this, classname)
  end
  def get_trust_level(this : IHolographicCameraRenderingParametersInterop*, trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.call(this, trustlevel)
  end
  def commit_direct3_d12_resource(this : IHolographicCameraRenderingParametersInterop*, pcolorresourcetocommit : ID3D12Resource, pcolorresourcefence : ID3D12Fence, colorresourcefencesignalvalue : UInt64) : HRESULT
    @lpVtbl.value.commit_direct3_d12_resource.call(this, pcolorresourcetocommit, pcolorresourcefence, colorresourcefencesignalvalue)
  end
  def commit_direct3_d12_resource_with_depth_data(this : IHolographicCameraRenderingParametersInterop*, pcolorresourcetocommit : ID3D12Resource, pcolorresourcefence : ID3D12Fence, colorresourcefencesignalvalue : UInt64, pdepthresourcetocommit : ID3D12Resource, pdepthresourcefence : ID3D12Fence, depthresourcefencesignalvalue : UInt64) : HRESULT
    @lpVtbl.value.commit_direct3_d12_resource_with_depth_data.call(this, pcolorresourcetocommit, pcolorresourcefence, colorresourcefencesignalvalue, pdepthresourcetocommit, pdepthresourcefence, depthresourcefencesignalvalue)
  end
end
struct LibWin32::IHolographicQuadLayerInterop
  def query_interface(this : IHolographicQuadLayerInterop*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IHolographicQuadLayerInterop*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IHolographicQuadLayerInterop*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_iids(this : IHolographicQuadLayerInterop*, iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.call(this, iidcount, iids)
  end
  def get_runtime_class_name(this : IHolographicQuadLayerInterop*, classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.call(this, classname)
  end
  def get_trust_level(this : IHolographicQuadLayerInterop*, trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.call(this, trustlevel)
  end
  def create_direct3_d12_content_buffer_resource(this : IHolographicQuadLayerInterop*, pdevice : ID3D12Device, ptexture2ddesc : D3D12_RESOURCE_DESC*, pptexture2dresource : ID3D12Resource*) : HRESULT
    @lpVtbl.value.create_direct3_d12_content_buffer_resource.call(this, pdevice, ptexture2ddesc, pptexture2dresource)
  end
  def create_direct3_d12_hardware_protected_content_buffer_resource(this : IHolographicQuadLayerInterop*, pdevice : ID3D12Device, ptexture2ddesc : D3D12_RESOURCE_DESC*, pprotectedresourcesession : ID3D12ProtectedResourceSession, ppcreatedtexture2dresource : ID3D12Resource*) : HRESULT
    @lpVtbl.value.create_direct3_d12_hardware_protected_content_buffer_resource.call(this, pdevice, ptexture2ddesc, pprotectedresourcesession, ppcreatedtexture2dresource)
  end
  def acquire_direct3_d12_buffer_resource(this : IHolographicQuadLayerInterop*, presourcetoacquire : ID3D12Resource, pcommandqueue : ID3D12CommandQueue) : HRESULT
    @lpVtbl.value.acquire_direct3_d12_buffer_resource.call(this, presourcetoacquire, pcommandqueue)
  end
  def acquire_direct3_d12_buffer_resource_with_timeout(this : IHolographicQuadLayerInterop*, presourcetoacquire : ID3D12Resource, pcommandqueue : ID3D12CommandQueue, duration : UInt64) : HRESULT
    @lpVtbl.value.acquire_direct3_d12_buffer_resource_with_timeout.call(this, presourcetoacquire, pcommandqueue, duration)
  end
  def unacquire_direct3_d12_buffer_resource(this : IHolographicQuadLayerInterop*, presourcetounacquire : ID3D12Resource) : HRESULT
    @lpVtbl.value.unacquire_direct3_d12_buffer_resource.call(this, presourcetounacquire)
  end
end
struct LibWin32::IHolographicQuadLayerUpdateParametersInterop
  def query_interface(this : IHolographicQuadLayerUpdateParametersInterop*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IHolographicQuadLayerUpdateParametersInterop*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IHolographicQuadLayerUpdateParametersInterop*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_iids(this : IHolographicQuadLayerUpdateParametersInterop*, iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.call(this, iidcount, iids)
  end
  def get_runtime_class_name(this : IHolographicQuadLayerUpdateParametersInterop*, classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.call(this, classname)
  end
  def get_trust_level(this : IHolographicQuadLayerUpdateParametersInterop*, trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.call(this, trustlevel)
  end
  def commit_direct3_d12_resource(this : IHolographicQuadLayerUpdateParametersInterop*, pcolorresourcetocommit : ID3D12Resource, pcolorresourcefence : ID3D12Fence, colorresourcefencesignalvalue : UInt64) : HRESULT
    @lpVtbl.value.commit_direct3_d12_resource.call(this, pcolorresourcetocommit, pcolorresourcefence, colorresourcefencesignalvalue)
  end
end
