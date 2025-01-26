require "./../win_rt.cr"
require "./../../foundation.cr"
require "./../../graphics/direct3_d12.cr"

module Win32cr::System::WinRT::Holographic


  @[Extern]
  record IHolographicCameraInteropVtbl,
    query_interface : Proc(IHolographicCameraInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IHolographicCameraInterop*, UInt32),
    release : Proc(IHolographicCameraInterop*, UInt32),
    get_iids : Proc(IHolographicCameraInterop*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_runtime_class_name : Proc(IHolographicCameraInterop*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    get_trust_level : Proc(IHolographicCameraInterop*, Win32cr::System::WinRT::TrustLevel*, Win32cr::Foundation::HRESULT),
    create_direct3_d12_back_buffer_resource : Proc(IHolographicCameraInterop*, Void*, Win32cr::Graphics::Direct3D12::D3D12_RESOURCE_DESC*, Void**, Win32cr::Foundation::HRESULT),
    create_direct3_d12_hardware_protected_back_buffer_resource : Proc(IHolographicCameraInterop*, Void*, Win32cr::Graphics::Direct3D12::D3D12_RESOURCE_DESC*, Void*, Void**, Win32cr::Foundation::HRESULT),
    acquire_direct3_d12_buffer_resource : Proc(IHolographicCameraInterop*, Void*, Void*, Win32cr::Foundation::HRESULT),
    acquire_direct3_d12_buffer_resource_with_timeout : Proc(IHolographicCameraInterop*, Void*, Void*, UInt64, Win32cr::Foundation::HRESULT),
    unacquire_direct3_d12_buffer_resource : Proc(IHolographicCameraInterop*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IHolographicCameraInterop, lpVtbl : IHolographicCameraInteropVtbl* do
    GUID = LibC::GUID.new(0x7cc1f9c5_u32, 0x6d02_u16, 0x41fa_u16, StaticArray[0x95_u8, 0x0_u8, 0xe1_u8, 0x80_u8, 0x9e_u8, 0xb4_u8, 0x8e_u8, 0xec_u8])
    def query_interface(this : IHolographicCameraInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IHolographicCameraInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IHolographicCameraInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_iids(this : IHolographicCameraInterop*, iidCount : UInt32*, iids : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iids.call(this, iidCount, iids)
    end
    def get_runtime_class_name(this : IHolographicCameraInterop*, className : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_class_name.call(this, className)
    end
    def get_trust_level(this : IHolographicCameraInterop*, trustLevel : Win32cr::System::WinRT::TrustLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trust_level.call(this, trustLevel)
    end
    def create_direct3_d12_back_buffer_resource(this : IHolographicCameraInterop*, pDevice : Void*, pTexture2DDesc : Win32cr::Graphics::Direct3D12::D3D12_RESOURCE_DESC*, ppCreatedTexture2DResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_direct3_d12_back_buffer_resource.call(this, pDevice, pTexture2DDesc, ppCreatedTexture2DResource)
    end
    def create_direct3_d12_hardware_protected_back_buffer_resource(this : IHolographicCameraInterop*, pDevice : Void*, pTexture2DDesc : Win32cr::Graphics::Direct3D12::D3D12_RESOURCE_DESC*, pProtectedResourceSession : Void*, ppCreatedTexture2DResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_direct3_d12_hardware_protected_back_buffer_resource.call(this, pDevice, pTexture2DDesc, pProtectedResourceSession, ppCreatedTexture2DResource)
    end
    def acquire_direct3_d12_buffer_resource(this : IHolographicCameraInterop*, pResourceToAcquire : Void*, pCommandQueue : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.acquire_direct3_d12_buffer_resource.call(this, pResourceToAcquire, pCommandQueue)
    end
    def acquire_direct3_d12_buffer_resource_with_timeout(this : IHolographicCameraInterop*, pResourceToAcquire : Void*, pCommandQueue : Void*, duration : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.acquire_direct3_d12_buffer_resource_with_timeout.call(this, pResourceToAcquire, pCommandQueue, duration)
    end
    def unacquire_direct3_d12_buffer_resource(this : IHolographicCameraInterop*, pResourceToUnacquire : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unacquire_direct3_d12_buffer_resource.call(this, pResourceToUnacquire)
    end

  end

  @[Extern]
  record IHolographicCameraRenderingParametersInteropVtbl,
    query_interface : Proc(IHolographicCameraRenderingParametersInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IHolographicCameraRenderingParametersInterop*, UInt32),
    release : Proc(IHolographicCameraRenderingParametersInterop*, UInt32),
    get_iids : Proc(IHolographicCameraRenderingParametersInterop*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_runtime_class_name : Proc(IHolographicCameraRenderingParametersInterop*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    get_trust_level : Proc(IHolographicCameraRenderingParametersInterop*, Win32cr::System::WinRT::TrustLevel*, Win32cr::Foundation::HRESULT),
    commit_direct3_d12_resource : Proc(IHolographicCameraRenderingParametersInterop*, Void*, Void*, UInt64, Win32cr::Foundation::HRESULT),
    commit_direct3_d12_resource_with_depth_data : Proc(IHolographicCameraRenderingParametersInterop*, Void*, Void*, UInt64, Void*, Void*, UInt64, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IHolographicCameraRenderingParametersInterop, lpVtbl : IHolographicCameraRenderingParametersInteropVtbl* do
    GUID = LibC::GUID.new(0xf75b68d6_u32, 0xd1fd_u16, 0x4707_u16, StaticArray[0xaa_u8, 0xfd_u8, 0xfa_u8, 0x6f_u8, 0x4c_u8, 0xe_u8, 0x3b_u8, 0xf4_u8])
    def query_interface(this : IHolographicCameraRenderingParametersInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IHolographicCameraRenderingParametersInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IHolographicCameraRenderingParametersInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_iids(this : IHolographicCameraRenderingParametersInterop*, iidCount : UInt32*, iids : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iids.call(this, iidCount, iids)
    end
    def get_runtime_class_name(this : IHolographicCameraRenderingParametersInterop*, className : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_class_name.call(this, className)
    end
    def get_trust_level(this : IHolographicCameraRenderingParametersInterop*, trustLevel : Win32cr::System::WinRT::TrustLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trust_level.call(this, trustLevel)
    end
    def commit_direct3_d12_resource(this : IHolographicCameraRenderingParametersInterop*, pColorResourceToCommit : Void*, pColorResourceFence : Void*, colorResourceFenceSignalValue : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit_direct3_d12_resource.call(this, pColorResourceToCommit, pColorResourceFence, colorResourceFenceSignalValue)
    end
    def commit_direct3_d12_resource_with_depth_data(this : IHolographicCameraRenderingParametersInterop*, pColorResourceToCommit : Void*, pColorResourceFence : Void*, colorResourceFenceSignalValue : UInt64, pDepthResourceToCommit : Void*, pDepthResourceFence : Void*, depthResourceFenceSignalValue : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit_direct3_d12_resource_with_depth_data.call(this, pColorResourceToCommit, pColorResourceFence, colorResourceFenceSignalValue, pDepthResourceToCommit, pDepthResourceFence, depthResourceFenceSignalValue)
    end

  end

  @[Extern]
  record IHolographicQuadLayerInteropVtbl,
    query_interface : Proc(IHolographicQuadLayerInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IHolographicQuadLayerInterop*, UInt32),
    release : Proc(IHolographicQuadLayerInterop*, UInt32),
    get_iids : Proc(IHolographicQuadLayerInterop*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_runtime_class_name : Proc(IHolographicQuadLayerInterop*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    get_trust_level : Proc(IHolographicQuadLayerInterop*, Win32cr::System::WinRT::TrustLevel*, Win32cr::Foundation::HRESULT),
    create_direct3_d12_content_buffer_resource : Proc(IHolographicQuadLayerInterop*, Void*, Win32cr::Graphics::Direct3D12::D3D12_RESOURCE_DESC*, Void**, Win32cr::Foundation::HRESULT),
    create_direct3_d12_hardware_protected_content_buffer_resource : Proc(IHolographicQuadLayerInterop*, Void*, Win32cr::Graphics::Direct3D12::D3D12_RESOURCE_DESC*, Void*, Void**, Win32cr::Foundation::HRESULT),
    acquire_direct3_d12_buffer_resource : Proc(IHolographicQuadLayerInterop*, Void*, Void*, Win32cr::Foundation::HRESULT),
    acquire_direct3_d12_buffer_resource_with_timeout : Proc(IHolographicQuadLayerInterop*, Void*, Void*, UInt64, Win32cr::Foundation::HRESULT),
    unacquire_direct3_d12_buffer_resource : Proc(IHolographicQuadLayerInterop*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IHolographicQuadLayerInterop, lpVtbl : IHolographicQuadLayerInteropVtbl* do
    GUID = LibC::GUID.new(0xcfa688f0_u32, 0x639e_u16, 0x4a47_u16, StaticArray[0x83_u8, 0xd7_u8, 0x6b_u8, 0x7f_u8, 0x5e_u8, 0xbf_u8, 0x7f_u8, 0xed_u8])
    def query_interface(this : IHolographicQuadLayerInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IHolographicQuadLayerInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IHolographicQuadLayerInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_iids(this : IHolographicQuadLayerInterop*, iidCount : UInt32*, iids : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iids.call(this, iidCount, iids)
    end
    def get_runtime_class_name(this : IHolographicQuadLayerInterop*, className : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_class_name.call(this, className)
    end
    def get_trust_level(this : IHolographicQuadLayerInterop*, trustLevel : Win32cr::System::WinRT::TrustLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trust_level.call(this, trustLevel)
    end
    def create_direct3_d12_content_buffer_resource(this : IHolographicQuadLayerInterop*, pDevice : Void*, pTexture2DDesc : Win32cr::Graphics::Direct3D12::D3D12_RESOURCE_DESC*, ppTexture2DResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_direct3_d12_content_buffer_resource.call(this, pDevice, pTexture2DDesc, ppTexture2DResource)
    end
    def create_direct3_d12_hardware_protected_content_buffer_resource(this : IHolographicQuadLayerInterop*, pDevice : Void*, pTexture2DDesc : Win32cr::Graphics::Direct3D12::D3D12_RESOURCE_DESC*, pProtectedResourceSession : Void*, ppCreatedTexture2DResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_direct3_d12_hardware_protected_content_buffer_resource.call(this, pDevice, pTexture2DDesc, pProtectedResourceSession, ppCreatedTexture2DResource)
    end
    def acquire_direct3_d12_buffer_resource(this : IHolographicQuadLayerInterop*, pResourceToAcquire : Void*, pCommandQueue : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.acquire_direct3_d12_buffer_resource.call(this, pResourceToAcquire, pCommandQueue)
    end
    def acquire_direct3_d12_buffer_resource_with_timeout(this : IHolographicQuadLayerInterop*, pResourceToAcquire : Void*, pCommandQueue : Void*, duration : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.acquire_direct3_d12_buffer_resource_with_timeout.call(this, pResourceToAcquire, pCommandQueue, duration)
    end
    def unacquire_direct3_d12_buffer_resource(this : IHolographicQuadLayerInterop*, pResourceToUnacquire : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unacquire_direct3_d12_buffer_resource.call(this, pResourceToUnacquire)
    end

  end

  @[Extern]
  record IHolographicQuadLayerUpdateParametersInteropVtbl,
    query_interface : Proc(IHolographicQuadLayerUpdateParametersInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IHolographicQuadLayerUpdateParametersInterop*, UInt32),
    release : Proc(IHolographicQuadLayerUpdateParametersInterop*, UInt32),
    get_iids : Proc(IHolographicQuadLayerUpdateParametersInterop*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_runtime_class_name : Proc(IHolographicQuadLayerUpdateParametersInterop*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    get_trust_level : Proc(IHolographicQuadLayerUpdateParametersInterop*, Win32cr::System::WinRT::TrustLevel*, Win32cr::Foundation::HRESULT),
    commit_direct3_d12_resource : Proc(IHolographicQuadLayerUpdateParametersInterop*, Void*, Void*, UInt64, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IHolographicQuadLayerUpdateParametersInterop, lpVtbl : IHolographicQuadLayerUpdateParametersInteropVtbl* do
    GUID = LibC::GUID.new(0xe5f549cd_u32, 0xc909_u16, 0x444f_u16, StaticArray[0x88_u8, 0x9_u8, 0x7c_u8, 0xc1_u8, 0x8a_u8, 0x9c_u8, 0x89_u8, 0x20_u8])
    def query_interface(this : IHolographicQuadLayerUpdateParametersInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IHolographicQuadLayerUpdateParametersInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IHolographicQuadLayerUpdateParametersInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_iids(this : IHolographicQuadLayerUpdateParametersInterop*, iidCount : UInt32*, iids : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iids.call(this, iidCount, iids)
    end
    def get_runtime_class_name(this : IHolographicQuadLayerUpdateParametersInterop*, className : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_class_name.call(this, className)
    end
    def get_trust_level(this : IHolographicQuadLayerUpdateParametersInterop*, trustLevel : Win32cr::System::WinRT::TrustLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trust_level.call(this, trustLevel)
    end
    def commit_direct3_d12_resource(this : IHolographicQuadLayerUpdateParametersInterop*, pColorResourceToCommit : Void*, pColorResourceFence : Void*, colorResourceFenceSignalValue : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit_direct3_d12_resource.call(this, pColorResourceToCommit, pColorResourceFence, colorResourceFenceSignalValue)
    end

  end

end