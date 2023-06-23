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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_iids : UInt64
    get_runtime_class_name : UInt64
    get_trust_level : UInt64
    create_direct3_d12_back_buffer_resource : UInt64
    create_direct3_d12_hardware_protected_back_buffer_resource : UInt64
    acquire_direct3_d12_buffer_resource : UInt64
    acquire_direct3_d12_buffer_resource_with_timeout : UInt64
    unacquire_direct3_d12_buffer_resource : UInt64
  end

  IHolographicCameraInterop_GUID = "7cc1f9c5-6d02-41fa-9500-e1809eb48eec"
  IID_IHolographicCameraInterop = LibC::GUID.new(0x7cc1f9c5_u32, 0x6d02_u16, 0x41fa_u16, StaticArray[0x95_u8, 0x0_u8, 0xe1_u8, 0x80_u8, 0x9e_u8, 0xb4_u8, 0x8e_u8, 0xec_u8])
  struct IHolographicCameraInterop
    lpVtbl : IHolographicCameraInteropVTbl*
  end

  struct IHolographicCameraRenderingParametersInteropVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_iids : UInt64
    get_runtime_class_name : UInt64
    get_trust_level : UInt64
    commit_direct3_d12_resource : UInt64
    commit_direct3_d12_resource_with_depth_data : UInt64
  end

  IHolographicCameraRenderingParametersInterop_GUID = "f75b68d6-d1fd-4707-aafd-fa6f4c0e3bf4"
  IID_IHolographicCameraRenderingParametersInterop = LibC::GUID.new(0xf75b68d6_u32, 0xd1fd_u16, 0x4707_u16, StaticArray[0xaa_u8, 0xfd_u8, 0xfa_u8, 0x6f_u8, 0x4c_u8, 0xe_u8, 0x3b_u8, 0xf4_u8])
  struct IHolographicCameraRenderingParametersInterop
    lpVtbl : IHolographicCameraRenderingParametersInteropVTbl*
  end

  struct IHolographicQuadLayerInteropVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_iids : UInt64
    get_runtime_class_name : UInt64
    get_trust_level : UInt64
    create_direct3_d12_content_buffer_resource : UInt64
    create_direct3_d12_hardware_protected_content_buffer_resource : UInt64
    acquire_direct3_d12_buffer_resource : UInt64
    acquire_direct3_d12_buffer_resource_with_timeout : UInt64
    unacquire_direct3_d12_buffer_resource : UInt64
  end

  IHolographicQuadLayerInterop_GUID = "cfa688f0-639e-4a47-83d7-6b7f5ebf7fed"
  IID_IHolographicQuadLayerInterop = LibC::GUID.new(0xcfa688f0_u32, 0x639e_u16, 0x4a47_u16, StaticArray[0x83_u8, 0xd7_u8, 0x6b_u8, 0x7f_u8, 0x5e_u8, 0xbf_u8, 0x7f_u8, 0xed_u8])
  struct IHolographicQuadLayerInterop
    lpVtbl : IHolographicQuadLayerInteropVTbl*
  end

  struct IHolographicQuadLayerUpdateParametersInteropVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_iids : UInt64
    get_runtime_class_name : UInt64
    get_trust_level : UInt64
    commit_direct3_d12_resource : UInt64
  end

  IHolographicQuadLayerUpdateParametersInterop_GUID = "e5f549cd-c909-444f-8809-7cc18a9c8920"
  IID_IHolographicQuadLayerUpdateParametersInterop = LibC::GUID.new(0xe5f549cd_u32, 0xc909_u16, 0x444f_u16, StaticArray[0x88_u8, 0x9_u8, 0x7c_u8, 0xc1_u8, 0x8a_u8, 0x9c_u8, 0x89_u8, 0x20_u8])
  struct IHolographicQuadLayerUpdateParametersInterop
    lpVtbl : IHolographicQuadLayerUpdateParametersInteropVTbl*
  end

end
struct LibWin32::IHolographicCameraInterop
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_iids(iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.unsafe_as(Proc(UInt32*, Guid**, HRESULT)).call(iidcount, iids)
  end
  def get_runtime_class_name(classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.unsafe_as(Proc(HSTRING*, HRESULT)).call(classname)
  end
  def get_trust_level(trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.unsafe_as(Proc(TrustLevel*, HRESULT)).call(trustlevel)
  end
  def create_direct3_d12_back_buffer_resource(pdevice : ID3D12Device, ptexture2ddesc : D3D12_RESOURCE_DESC*, ppcreatedtexture2dresource : ID3D12Resource*) : HRESULT
    @lpVtbl.value.create_direct3_d12_back_buffer_resource.unsafe_as(Proc(ID3D12Device, D3D12_RESOURCE_DESC*, ID3D12Resource*, HRESULT)).call(pdevice, ptexture2ddesc, ppcreatedtexture2dresource)
  end
  def create_direct3_d12_hardware_protected_back_buffer_resource(pdevice : ID3D12Device, ptexture2ddesc : D3D12_RESOURCE_DESC*, pprotectedresourcesession : ID3D12ProtectedResourceSession, ppcreatedtexture2dresource : ID3D12Resource*) : HRESULT
    @lpVtbl.value.create_direct3_d12_hardware_protected_back_buffer_resource.unsafe_as(Proc(ID3D12Device, D3D12_RESOURCE_DESC*, ID3D12ProtectedResourceSession, ID3D12Resource*, HRESULT)).call(pdevice, ptexture2ddesc, pprotectedresourcesession, ppcreatedtexture2dresource)
  end
  def acquire_direct3_d12_buffer_resource(presourcetoacquire : ID3D12Resource, pcommandqueue : ID3D12CommandQueue) : HRESULT
    @lpVtbl.value.acquire_direct3_d12_buffer_resource.unsafe_as(Proc(ID3D12Resource, ID3D12CommandQueue, HRESULT)).call(presourcetoacquire, pcommandqueue)
  end
  def acquire_direct3_d12_buffer_resource_with_timeout(presourcetoacquire : ID3D12Resource, pcommandqueue : ID3D12CommandQueue, duration : UInt64) : HRESULT
    @lpVtbl.value.acquire_direct3_d12_buffer_resource_with_timeout.unsafe_as(Proc(ID3D12Resource, ID3D12CommandQueue, UInt64, HRESULT)).call(presourcetoacquire, pcommandqueue, duration)
  end
  def unacquire_direct3_d12_buffer_resource(presourcetounacquire : ID3D12Resource) : HRESULT
    @lpVtbl.value.unacquire_direct3_d12_buffer_resource.unsafe_as(Proc(ID3D12Resource, HRESULT)).call(presourcetounacquire)
  end
end
struct LibWin32::IHolographicCameraRenderingParametersInterop
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_iids(iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.unsafe_as(Proc(UInt32*, Guid**, HRESULT)).call(iidcount, iids)
  end
  def get_runtime_class_name(classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.unsafe_as(Proc(HSTRING*, HRESULT)).call(classname)
  end
  def get_trust_level(trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.unsafe_as(Proc(TrustLevel*, HRESULT)).call(trustlevel)
  end
  def commit_direct3_d12_resource(pcolorresourcetocommit : ID3D12Resource, pcolorresourcefence : ID3D12Fence, colorresourcefencesignalvalue : UInt64) : HRESULT
    @lpVtbl.value.commit_direct3_d12_resource.unsafe_as(Proc(ID3D12Resource, ID3D12Fence, UInt64, HRESULT)).call(pcolorresourcetocommit, pcolorresourcefence, colorresourcefencesignalvalue)
  end
  def commit_direct3_d12_resource_with_depth_data(pcolorresourcetocommit : ID3D12Resource, pcolorresourcefence : ID3D12Fence, colorresourcefencesignalvalue : UInt64, pdepthresourcetocommit : ID3D12Resource, pdepthresourcefence : ID3D12Fence, depthresourcefencesignalvalue : UInt64) : HRESULT
    @lpVtbl.value.commit_direct3_d12_resource_with_depth_data.unsafe_as(Proc(ID3D12Resource, ID3D12Fence, UInt64, ID3D12Resource, ID3D12Fence, UInt64, HRESULT)).call(pcolorresourcetocommit, pcolorresourcefence, colorresourcefencesignalvalue, pdepthresourcetocommit, pdepthresourcefence, depthresourcefencesignalvalue)
  end
end
struct LibWin32::IHolographicQuadLayerInterop
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_iids(iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.unsafe_as(Proc(UInt32*, Guid**, HRESULT)).call(iidcount, iids)
  end
  def get_runtime_class_name(classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.unsafe_as(Proc(HSTRING*, HRESULT)).call(classname)
  end
  def get_trust_level(trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.unsafe_as(Proc(TrustLevel*, HRESULT)).call(trustlevel)
  end
  def create_direct3_d12_content_buffer_resource(pdevice : ID3D12Device, ptexture2ddesc : D3D12_RESOURCE_DESC*, pptexture2dresource : ID3D12Resource*) : HRESULT
    @lpVtbl.value.create_direct3_d12_content_buffer_resource.unsafe_as(Proc(ID3D12Device, D3D12_RESOURCE_DESC*, ID3D12Resource*, HRESULT)).call(pdevice, ptexture2ddesc, pptexture2dresource)
  end
  def create_direct3_d12_hardware_protected_content_buffer_resource(pdevice : ID3D12Device, ptexture2ddesc : D3D12_RESOURCE_DESC*, pprotectedresourcesession : ID3D12ProtectedResourceSession, ppcreatedtexture2dresource : ID3D12Resource*) : HRESULT
    @lpVtbl.value.create_direct3_d12_hardware_protected_content_buffer_resource.unsafe_as(Proc(ID3D12Device, D3D12_RESOURCE_DESC*, ID3D12ProtectedResourceSession, ID3D12Resource*, HRESULT)).call(pdevice, ptexture2ddesc, pprotectedresourcesession, ppcreatedtexture2dresource)
  end
  def acquire_direct3_d12_buffer_resource(presourcetoacquire : ID3D12Resource, pcommandqueue : ID3D12CommandQueue) : HRESULT
    @lpVtbl.value.acquire_direct3_d12_buffer_resource.unsafe_as(Proc(ID3D12Resource, ID3D12CommandQueue, HRESULT)).call(presourcetoacquire, pcommandqueue)
  end
  def acquire_direct3_d12_buffer_resource_with_timeout(presourcetoacquire : ID3D12Resource, pcommandqueue : ID3D12CommandQueue, duration : UInt64) : HRESULT
    @lpVtbl.value.acquire_direct3_d12_buffer_resource_with_timeout.unsafe_as(Proc(ID3D12Resource, ID3D12CommandQueue, UInt64, HRESULT)).call(presourcetoacquire, pcommandqueue, duration)
  end
  def unacquire_direct3_d12_buffer_resource(presourcetounacquire : ID3D12Resource) : HRESULT
    @lpVtbl.value.unacquire_direct3_d12_buffer_resource.unsafe_as(Proc(ID3D12Resource, HRESULT)).call(presourcetounacquire)
  end
end
struct LibWin32::IHolographicQuadLayerUpdateParametersInterop
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_iids(iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.unsafe_as(Proc(UInt32*, Guid**, HRESULT)).call(iidcount, iids)
  end
  def get_runtime_class_name(classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.unsafe_as(Proc(HSTRING*, HRESULT)).call(classname)
  end
  def get_trust_level(trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.unsafe_as(Proc(TrustLevel*, HRESULT)).call(trustlevel)
  end
  def commit_direct3_d12_resource(pcolorresourcetocommit : ID3D12Resource, pcolorresourcefence : ID3D12Fence, colorresourcefencesignalvalue : UInt64) : HRESULT
    @lpVtbl.value.commit_direct3_d12_resource.unsafe_as(Proc(ID3D12Resource, ID3D12Fence, UInt64, HRESULT)).call(pcolorresourcetocommit, pcolorresourcefence, colorresourcefencesignalvalue)
  end
end
