require "../../system/winrt.cr"
require "../../foundation.cr"
require "../../media/mediafoundation.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
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

  struct IVideoFrameNativeFactory
    lpVtbl : IVideoFrameNativeFactoryVTbl*
  end

end
