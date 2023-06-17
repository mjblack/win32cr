require "../../system/winrt.cr"
require "../../foundation.cr"
require "../../media/mediafoundation.cr"

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
  CLSID_AudioFrameNativeFactory = "16a0a3b9-9f65-4102-9367-2cda3a4f372a"
  CLSID_VideoFrameNativeFactory = "d194386a-04e3-4814-8100-b2b0ae6d78c7"


  struct IAudioFrameNativeVTbl
    query_interface : Proc(IAudioFrameNative*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAudioFrameNative*, UInt32)
    release : Proc(IAudioFrameNative*, UInt32)
    get_iids : Proc(IAudioFrameNative*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(IAudioFrameNative*, HSTRING*, HRESULT)
    get_trust_level : Proc(IAudioFrameNative*, TrustLevel*, HRESULT)
    get_data : Proc(IAudioFrameNative*, Guid*, Void**, HRESULT)
  end

  IAudioFrameNative_GUID = "20be1e2e-930f-4746-9335-3c332f255093"
  IID_IAudioFrameNative = LibC::GUID.new(0x20be1e2e_u32, 0x930f_u16, 0x4746_u16, StaticArray[0x93_u8, 0x35_u8, 0x3c_u8, 0x33_u8, 0x2f_u8, 0x25_u8, 0x50_u8, 0x93_u8])
  struct IAudioFrameNative
    lpVtbl : IAudioFrameNativeVTbl*
  end

  struct IVideoFrameNativeVTbl
    query_interface : Proc(IVideoFrameNative*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVideoFrameNative*, UInt32)
    release : Proc(IVideoFrameNative*, UInt32)
    get_iids : Proc(IVideoFrameNative*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(IVideoFrameNative*, HSTRING*, HRESULT)
    get_trust_level : Proc(IVideoFrameNative*, TrustLevel*, HRESULT)
    get_data : Proc(IVideoFrameNative*, Guid*, Void**, HRESULT)
    get_device : Proc(IVideoFrameNative*, Guid*, Void**, HRESULT)
  end

  IVideoFrameNative_GUID = "26ba702b-314a-4620-aaf6-7a51aa58fa18"
  IID_IVideoFrameNative = LibC::GUID.new(0x26ba702b_u32, 0x314a_u16, 0x4620_u16, StaticArray[0xaa_u8, 0xf6_u8, 0x7a_u8, 0x51_u8, 0xaa_u8, 0x58_u8, 0xfa_u8, 0x18_u8])
  struct IVideoFrameNative
    lpVtbl : IVideoFrameNativeVTbl*
  end

  struct IAudioFrameNativeFactoryVTbl
    query_interface : Proc(IAudioFrameNativeFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAudioFrameNativeFactory*, UInt32)
    release : Proc(IAudioFrameNativeFactory*, UInt32)
    get_iids : Proc(IAudioFrameNativeFactory*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(IAudioFrameNativeFactory*, HSTRING*, HRESULT)
    get_trust_level : Proc(IAudioFrameNativeFactory*, TrustLevel*, HRESULT)
    create_from_mf_sample : Proc(IAudioFrameNativeFactory*, IMFSample, LibC::BOOL, Guid*, Void**, HRESULT)
  end

  IAudioFrameNativeFactory_GUID = "7bd67cf8-bf7d-43e6-af8d-b170ee0c0110"
  IID_IAudioFrameNativeFactory = LibC::GUID.new(0x7bd67cf8_u32, 0xbf7d_u16, 0x43e6_u16, StaticArray[0xaf_u8, 0x8d_u8, 0xb1_u8, 0x70_u8, 0xee_u8, 0xc_u8, 0x1_u8, 0x10_u8])
  struct IAudioFrameNativeFactory
    lpVtbl : IAudioFrameNativeFactoryVTbl*
  end

  struct IVideoFrameNativeFactoryVTbl
    query_interface : Proc(IVideoFrameNativeFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVideoFrameNativeFactory*, UInt32)
    release : Proc(IVideoFrameNativeFactory*, UInt32)
    get_iids : Proc(IVideoFrameNativeFactory*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(IVideoFrameNativeFactory*, HSTRING*, HRESULT)
    get_trust_level : Proc(IVideoFrameNativeFactory*, TrustLevel*, HRESULT)
    create_from_mf_sample : Proc(IVideoFrameNativeFactory*, IMFSample, Guid*, UInt32, UInt32, LibC::BOOL, MFVideoArea*, IMFDXGIDeviceManager, Guid*, Void**, HRESULT)
  end

  IVideoFrameNativeFactory_GUID = "69e3693e-8e1e-4e63-ac4c-7fdc21d9731d"
  IID_IVideoFrameNativeFactory = LibC::GUID.new(0x69e3693e_u32, 0x8e1e_u16, 0x4e63_u16, StaticArray[0xac_u8, 0x4c_u8, 0x7f_u8, 0xdc_u8, 0x21_u8, 0xd9_u8, 0x73_u8, 0x1d_u8])
  struct IVideoFrameNativeFactory
    lpVtbl : IVideoFrameNativeFactoryVTbl*
  end

end
