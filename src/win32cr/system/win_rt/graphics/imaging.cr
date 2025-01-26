require "./../../win_rt.cr"
require "./../../../foundation.cr"
require "./../../../graphics/imaging.cr"
require "./../../../media/media_foundation.cr"

module Win32cr::System::WinRT::Graphics::Imaging
  CLSID_SoftwareBitmapNativeFactory = "84e65691-8602-4a84-be46-708be9cd4b74"


  @[Extern]
  record ISoftwareBitmapNativeVtbl,
    query_interface : Proc(ISoftwareBitmapNative*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISoftwareBitmapNative*, UInt32),
    release : Proc(ISoftwareBitmapNative*, UInt32),
    get_iids : Proc(ISoftwareBitmapNative*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_runtime_class_name : Proc(ISoftwareBitmapNative*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    get_trust_level : Proc(ISoftwareBitmapNative*, Win32cr::System::WinRT::TrustLevel*, Win32cr::Foundation::HRESULT),
    get_data : Proc(ISoftwareBitmapNative*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISoftwareBitmapNative, lpVtbl : ISoftwareBitmapNativeVtbl* do
    GUID = LibC::GUID.new(0x94bc8415_u32, 0x4ea_u16, 0x4b2e_u16, StaticArray[0xaf_u8, 0x13_u8, 0x4d_u8, 0xe9_u8, 0x5a_u8, 0xa8_u8, 0x98_u8, 0xeb_u8])
    def query_interface(this : ISoftwareBitmapNative*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISoftwareBitmapNative*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISoftwareBitmapNative*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_iids(this : ISoftwareBitmapNative*, iidCount : UInt32*, iids : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iids.call(this, iidCount, iids)
    end
    def get_runtime_class_name(this : ISoftwareBitmapNative*, className : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_class_name.call(this, className)
    end
    def get_trust_level(this : ISoftwareBitmapNative*, trustLevel : Win32cr::System::WinRT::TrustLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trust_level.call(this, trustLevel)
    end
    def get_data(this : ISoftwareBitmapNative*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_data.call(this, riid, ppv)
    end

  end

  @[Extern]
  record ISoftwareBitmapNativeFactoryVtbl,
    query_interface : Proc(ISoftwareBitmapNativeFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISoftwareBitmapNativeFactory*, UInt32),
    release : Proc(ISoftwareBitmapNativeFactory*, UInt32),
    get_iids : Proc(ISoftwareBitmapNativeFactory*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_runtime_class_name : Proc(ISoftwareBitmapNativeFactory*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    get_trust_level : Proc(ISoftwareBitmapNativeFactory*, Win32cr::System::WinRT::TrustLevel*, Win32cr::Foundation::HRESULT),
    create_from_wic_bitmap : Proc(ISoftwareBitmapNativeFactory*, Void*, Win32cr::Foundation::BOOL, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    create_from_mf2_d_buffer2 : Proc(ISoftwareBitmapNativeFactory*, Void*, LibC::GUID*, UInt32, UInt32, Win32cr::Foundation::BOOL, Win32cr::Media::MediaFoundation::MFVideoArea*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISoftwareBitmapNativeFactory, lpVtbl : ISoftwareBitmapNativeFactoryVtbl* do
    GUID = LibC::GUID.new(0xc3c181ec_u32, 0x2914_u16, 0x4791_u16, StaticArray[0xaf_u8, 0x2_u8, 0x2_u8, 0xd2_u8, 0x24_u8, 0xa1_u8, 0xb_u8, 0x43_u8])
    def query_interface(this : ISoftwareBitmapNativeFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISoftwareBitmapNativeFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISoftwareBitmapNativeFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_iids(this : ISoftwareBitmapNativeFactory*, iidCount : UInt32*, iids : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iids.call(this, iidCount, iids)
    end
    def get_runtime_class_name(this : ISoftwareBitmapNativeFactory*, className : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_class_name.call(this, className)
    end
    def get_trust_level(this : ISoftwareBitmapNativeFactory*, trustLevel : Win32cr::System::WinRT::TrustLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trust_level.call(this, trustLevel)
    end
    def create_from_wic_bitmap(this : ISoftwareBitmapNativeFactory*, data : Void*, forceReadOnly : Win32cr::Foundation::BOOL, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_from_wic_bitmap.call(this, data, forceReadOnly, riid, ppv)
    end
    def create_from_mf2_d_buffer2(this : ISoftwareBitmapNativeFactory*, data : Void*, subtype : LibC::GUID*, width : UInt32, height : UInt32, forceReadOnly : Win32cr::Foundation::BOOL, minDisplayAperture : Win32cr::Media::MediaFoundation::MFVideoArea*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_from_mf2_d_buffer2.call(this, data, subtype, width, height, forceReadOnly, minDisplayAperture, riid, ppv)
    end

  end

end