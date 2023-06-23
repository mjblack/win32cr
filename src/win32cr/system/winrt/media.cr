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
lib LibWin32
  CLSID_AudioFrameNativeFactory = "16a0a3b9-9f65-4102-9367-2cda3a4f372a"
  CLSID_VideoFrameNativeFactory = "d194386a-04e3-4814-8100-b2b0ae6d78c7"


  struct IAudioFrameNativeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_iids : UInt64
    get_runtime_class_name : UInt64
    get_trust_level : UInt64
    get_data : UInt64
  end

  IAudioFrameNative_GUID = "20be1e2e-930f-4746-9335-3c332f255093"
  IID_IAudioFrameNative = LibC::GUID.new(0x20be1e2e_u32, 0x930f_u16, 0x4746_u16, StaticArray[0x93_u8, 0x35_u8, 0x3c_u8, 0x33_u8, 0x2f_u8, 0x25_u8, 0x50_u8, 0x93_u8])
  struct IAudioFrameNative
    lpVtbl : IAudioFrameNativeVTbl*
  end

  struct IVideoFrameNativeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_iids : UInt64
    get_runtime_class_name : UInt64
    get_trust_level : UInt64
    get_data : UInt64
    get_device : UInt64
  end

  IVideoFrameNative_GUID = "26ba702b-314a-4620-aaf6-7a51aa58fa18"
  IID_IVideoFrameNative = LibC::GUID.new(0x26ba702b_u32, 0x314a_u16, 0x4620_u16, StaticArray[0xaa_u8, 0xf6_u8, 0x7a_u8, 0x51_u8, 0xaa_u8, 0x58_u8, 0xfa_u8, 0x18_u8])
  struct IVideoFrameNative
    lpVtbl : IVideoFrameNativeVTbl*
  end

  struct IAudioFrameNativeFactoryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_iids : UInt64
    get_runtime_class_name : UInt64
    get_trust_level : UInt64
    create_from_mf_sample : UInt64
  end

  IAudioFrameNativeFactory_GUID = "7bd67cf8-bf7d-43e6-af8d-b170ee0c0110"
  IID_IAudioFrameNativeFactory = LibC::GUID.new(0x7bd67cf8_u32, 0xbf7d_u16, 0x43e6_u16, StaticArray[0xaf_u8, 0x8d_u8, 0xb1_u8, 0x70_u8, 0xee_u8, 0xc_u8, 0x1_u8, 0x10_u8])
  struct IAudioFrameNativeFactory
    lpVtbl : IAudioFrameNativeFactoryVTbl*
  end

  struct IVideoFrameNativeFactoryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_iids : UInt64
    get_runtime_class_name : UInt64
    get_trust_level : UInt64
    create_from_mf_sample : UInt64
  end

  IVideoFrameNativeFactory_GUID = "69e3693e-8e1e-4e63-ac4c-7fdc21d9731d"
  IID_IVideoFrameNativeFactory = LibC::GUID.new(0x69e3693e_u32, 0x8e1e_u16, 0x4e63_u16, StaticArray[0xac_u8, 0x4c_u8, 0x7f_u8, 0xdc_u8, 0x21_u8, 0xd9_u8, 0x73_u8, 0x1d_u8])
  struct IVideoFrameNativeFactory
    lpVtbl : IVideoFrameNativeFactoryVTbl*
  end

end
struct LibWin32::IAudioFrameNative
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
  def get_data(riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_data.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppv)
  end
end
struct LibWin32::IVideoFrameNative
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
  def get_data(riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_data.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppv)
  end
  def get_device(riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_device.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppv)
  end
end
struct LibWin32::IAudioFrameNativeFactory
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
  def create_from_mf_sample(data : IMFSample, forcereadonly : LibC::BOOL, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.create_from_mf_sample.unsafe_as(Proc(IMFSample, LibC::BOOL, Guid*, Void**, HRESULT)).call(data, forcereadonly, riid, ppv)
  end
end
struct LibWin32::IVideoFrameNativeFactory
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
  def create_from_mf_sample(data : IMFSample, subtype : Guid*, width : UInt32, height : UInt32, forcereadonly : LibC::BOOL, mindisplayaperture : MFVideoArea*, device : IMFDXGIDeviceManager, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.create_from_mf_sample.unsafe_as(Proc(IMFSample, Guid*, UInt32, UInt32, LibC::BOOL, MFVideoArea*, IMFDXGIDeviceManager, Guid*, Void**, HRESULT)).call(data, subtype, width, height, forcereadonly, mindisplayaperture, device, riid, ppv)
  end
end
