require "../../../system/winrt.cr"
require "../../../foundation.cr"
require "../../../graphics/imaging.cr"
require "../../../media/mediafoundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32
  CLSID_SoftwareBitmapNativeFactory = "84e65691-8602-4a84-be46-708be9cd4b74"


  struct ISoftwareBitmapNativeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_iids : UInt64
    get_runtime_class_name : UInt64
    get_trust_level : UInt64
    get_data : UInt64
  end

  ISoftwareBitmapNative_GUID = "94bc8415-04ea-4b2e-af13-4de95aa898eb"
  IID_ISoftwareBitmapNative = LibC::GUID.new(0x94bc8415_u32, 0x4ea_u16, 0x4b2e_u16, StaticArray[0xaf_u8, 0x13_u8, 0x4d_u8, 0xe9_u8, 0x5a_u8, 0xa8_u8, 0x98_u8, 0xeb_u8])
  struct ISoftwareBitmapNative
    lpVtbl : ISoftwareBitmapNativeVTbl*
  end

  struct ISoftwareBitmapNativeFactoryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_iids : UInt64
    get_runtime_class_name : UInt64
    get_trust_level : UInt64
    create_from_wic_bitmap : UInt64
    create_from_mf2_d_buffer2 : UInt64
  end

  ISoftwareBitmapNativeFactory_GUID = "c3c181ec-2914-4791-af02-02d224a10b43"
  IID_ISoftwareBitmapNativeFactory = LibC::GUID.new(0xc3c181ec_u32, 0x2914_u16, 0x4791_u16, StaticArray[0xaf_u8, 0x2_u8, 0x2_u8, 0xd2_u8, 0x24_u8, 0xa1_u8, 0xb_u8, 0x43_u8])
  struct ISoftwareBitmapNativeFactory
    lpVtbl : ISoftwareBitmapNativeFactoryVTbl*
  end

end
struct LibWin32::ISoftwareBitmapNative
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
struct LibWin32::ISoftwareBitmapNativeFactory
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
  def create_from_wic_bitmap(data : IWICBitmap, forcereadonly : LibC::BOOL, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.create_from_wic_bitmap.unsafe_as(Proc(IWICBitmap, LibC::BOOL, Guid*, Void**, HRESULT)).call(data, forcereadonly, riid, ppv)
  end
  def create_from_mf2_d_buffer2(data : IMF2DBuffer2, subtype : Guid*, width : UInt32, height : UInt32, forcereadonly : LibC::BOOL, mindisplayaperture : MFVideoArea*, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.create_from_mf2_d_buffer2.unsafe_as(Proc(IMF2DBuffer2, Guid*, UInt32, UInt32, LibC::BOOL, MFVideoArea*, Guid*, Void**, HRESULT)).call(data, subtype, width, height, forcereadonly, mindisplayaperture, riid, ppv)
  end
end
