require "./../win_rt.cr"
require "./../../foundation.cr"
require "./../../media/media_foundation.cr"

module Win32cr::System::WinRT::Media
  CLSID_AudioFrameNativeFactory = "16a0a3b9-9f65-4102-9367-2cda3a4f372a"
  CLSID_VideoFrameNativeFactory = "d194386a-04e3-4814-8100-b2b0ae6d78c7"


  @[Extern]
  record IAudioFrameNativeVtbl,
    query_interface : Proc(IAudioFrameNative*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAudioFrameNative*, UInt32),
    release : Proc(IAudioFrameNative*, UInt32),
    get_iids : Proc(IAudioFrameNative*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_runtime_class_name : Proc(IAudioFrameNative*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    get_trust_level : Proc(IAudioFrameNative*, Win32cr::System::WinRT::TrustLevel*, Win32cr::Foundation::HRESULT),
    get_data : Proc(IAudioFrameNative*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("20be1e2e-930f-4746-9335-3c332f255093")]
  record IAudioFrameNative, lpVtbl : IAudioFrameNativeVtbl* do
    GUID = LibC::GUID.new(0x20be1e2e_u32, 0x930f_u16, 0x4746_u16, StaticArray[0x93_u8, 0x35_u8, 0x3c_u8, 0x33_u8, 0x2f_u8, 0x25_u8, 0x50_u8, 0x93_u8])
    def query_interface(this : IAudioFrameNative*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAudioFrameNative*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAudioFrameNative*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_iids(this : IAudioFrameNative*, iidCount : UInt32*, iids : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iids.call(this, iidCount, iids)
    end
    def get_runtime_class_name(this : IAudioFrameNative*, className : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_class_name.call(this, className)
    end
    def get_trust_level(this : IAudioFrameNative*, trustLevel : Win32cr::System::WinRT::TrustLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trust_level.call(this, trustLevel)
    end
    def get_data(this : IAudioFrameNative*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_data.call(this, riid, ppv)
    end

  end

  @[Extern]
  record IVideoFrameNativeVtbl,
    query_interface : Proc(IVideoFrameNative*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IVideoFrameNative*, UInt32),
    release : Proc(IVideoFrameNative*, UInt32),
    get_iids : Proc(IVideoFrameNative*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_runtime_class_name : Proc(IVideoFrameNative*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    get_trust_level : Proc(IVideoFrameNative*, Win32cr::System::WinRT::TrustLevel*, Win32cr::Foundation::HRESULT),
    get_data : Proc(IVideoFrameNative*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_device : Proc(IVideoFrameNative*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("26ba702b-314a-4620-aaf6-7a51aa58fa18")]
  record IVideoFrameNative, lpVtbl : IVideoFrameNativeVtbl* do
    GUID = LibC::GUID.new(0x26ba702b_u32, 0x314a_u16, 0x4620_u16, StaticArray[0xaa_u8, 0xf6_u8, 0x7a_u8, 0x51_u8, 0xaa_u8, 0x58_u8, 0xfa_u8, 0x18_u8])
    def query_interface(this : IVideoFrameNative*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IVideoFrameNative*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IVideoFrameNative*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_iids(this : IVideoFrameNative*, iidCount : UInt32*, iids : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iids.call(this, iidCount, iids)
    end
    def get_runtime_class_name(this : IVideoFrameNative*, className : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_class_name.call(this, className)
    end
    def get_trust_level(this : IVideoFrameNative*, trustLevel : Win32cr::System::WinRT::TrustLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trust_level.call(this, trustLevel)
    end
    def get_data(this : IVideoFrameNative*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_data.call(this, riid, ppv)
    end
    def get_device(this : IVideoFrameNative*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device.call(this, riid, ppv)
    end

  end

  @[Extern]
  record IAudioFrameNativeFactoryVtbl,
    query_interface : Proc(IAudioFrameNativeFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAudioFrameNativeFactory*, UInt32),
    release : Proc(IAudioFrameNativeFactory*, UInt32),
    get_iids : Proc(IAudioFrameNativeFactory*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_runtime_class_name : Proc(IAudioFrameNativeFactory*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    get_trust_level : Proc(IAudioFrameNativeFactory*, Win32cr::System::WinRT::TrustLevel*, Win32cr::Foundation::HRESULT),
    create_from_mf_sample : Proc(IAudioFrameNativeFactory*, Void*, Win32cr::Foundation::BOOL, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("7bd67cf8-bf7d-43e6-af8d-b170ee0c0110")]
  record IAudioFrameNativeFactory, lpVtbl : IAudioFrameNativeFactoryVtbl* do
    GUID = LibC::GUID.new(0x7bd67cf8_u32, 0xbf7d_u16, 0x43e6_u16, StaticArray[0xaf_u8, 0x8d_u8, 0xb1_u8, 0x70_u8, 0xee_u8, 0xc_u8, 0x1_u8, 0x10_u8])
    def query_interface(this : IAudioFrameNativeFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAudioFrameNativeFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAudioFrameNativeFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_iids(this : IAudioFrameNativeFactory*, iidCount : UInt32*, iids : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iids.call(this, iidCount, iids)
    end
    def get_runtime_class_name(this : IAudioFrameNativeFactory*, className : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_class_name.call(this, className)
    end
    def get_trust_level(this : IAudioFrameNativeFactory*, trustLevel : Win32cr::System::WinRT::TrustLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trust_level.call(this, trustLevel)
    end
    def create_from_mf_sample(this : IAudioFrameNativeFactory*, data : Void*, forceReadOnly : Win32cr::Foundation::BOOL, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_from_mf_sample.call(this, data, forceReadOnly, riid, ppv)
    end

  end

  @[Extern]
  record IVideoFrameNativeFactoryVtbl,
    query_interface : Proc(IVideoFrameNativeFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IVideoFrameNativeFactory*, UInt32),
    release : Proc(IVideoFrameNativeFactory*, UInt32),
    get_iids : Proc(IVideoFrameNativeFactory*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_runtime_class_name : Proc(IVideoFrameNativeFactory*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    get_trust_level : Proc(IVideoFrameNativeFactory*, Win32cr::System::WinRT::TrustLevel*, Win32cr::Foundation::HRESULT),
    create_from_mf_sample : Proc(IVideoFrameNativeFactory*, Void*, LibC::GUID*, UInt32, UInt32, Win32cr::Foundation::BOOL, Win32cr::Media::MediaFoundation::MFVideoArea*, Void*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("69e3693e-8e1e-4e63-ac4c-7fdc21d9731d")]
  record IVideoFrameNativeFactory, lpVtbl : IVideoFrameNativeFactoryVtbl* do
    GUID = LibC::GUID.new(0x69e3693e_u32, 0x8e1e_u16, 0x4e63_u16, StaticArray[0xac_u8, 0x4c_u8, 0x7f_u8, 0xdc_u8, 0x21_u8, 0xd9_u8, 0x73_u8, 0x1d_u8])
    def query_interface(this : IVideoFrameNativeFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IVideoFrameNativeFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IVideoFrameNativeFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_iids(this : IVideoFrameNativeFactory*, iidCount : UInt32*, iids : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iids.call(this, iidCount, iids)
    end
    def get_runtime_class_name(this : IVideoFrameNativeFactory*, className : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_class_name.call(this, className)
    end
    def get_trust_level(this : IVideoFrameNativeFactory*, trustLevel : Win32cr::System::WinRT::TrustLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trust_level.call(this, trustLevel)
    end
    def create_from_mf_sample(this : IVideoFrameNativeFactory*, data : Void*, subtype : LibC::GUID*, width : UInt32, height : UInt32, forceReadOnly : Win32cr::Foundation::BOOL, minDisplayAperture : Win32cr::Media::MediaFoundation::MFVideoArea*, device : Void*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_from_mf_sample.call(this, data, subtype, width, height, forceReadOnly, minDisplayAperture, device, riid, ppv)
    end

  end

end