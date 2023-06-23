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
    query_interface : Proc(ISoftwareBitmapNative*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISoftwareBitmapNative*, UInt32)
    release : Proc(ISoftwareBitmapNative*, UInt32)
    get_iids : Proc(ISoftwareBitmapNative*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(ISoftwareBitmapNative*, HSTRING*, HRESULT)
    get_trust_level : Proc(ISoftwareBitmapNative*, TrustLevel*, HRESULT)
    get_data : Proc(ISoftwareBitmapNative*, Guid*, Void**, HRESULT)
  end

  ISoftwareBitmapNative_GUID = "94bc8415-04ea-4b2e-af13-4de95aa898eb"
  IID_ISoftwareBitmapNative = LibC::GUID.new(0x94bc8415_u32, 0x4ea_u16, 0x4b2e_u16, StaticArray[0xaf_u8, 0x13_u8, 0x4d_u8, 0xe9_u8, 0x5a_u8, 0xa8_u8, 0x98_u8, 0xeb_u8])
  struct ISoftwareBitmapNative
    lpVtbl : ISoftwareBitmapNativeVTbl*
  end

  struct ISoftwareBitmapNativeFactoryVTbl
    query_interface : Proc(ISoftwareBitmapNativeFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISoftwareBitmapNativeFactory*, UInt32)
    release : Proc(ISoftwareBitmapNativeFactory*, UInt32)
    get_iids : Proc(ISoftwareBitmapNativeFactory*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(ISoftwareBitmapNativeFactory*, HSTRING*, HRESULT)
    get_trust_level : Proc(ISoftwareBitmapNativeFactory*, TrustLevel*, HRESULT)
    create_from_wic_bitmap : Proc(ISoftwareBitmapNativeFactory*, IWICBitmap, LibC::BOOL, Guid*, Void**, HRESULT)
    create_from_mf2_d_buffer2 : Proc(ISoftwareBitmapNativeFactory*, IMF2DBuffer2, Guid*, UInt32, UInt32, LibC::BOOL, MFVideoArea*, Guid*, Void**, HRESULT)
  end

  ISoftwareBitmapNativeFactory_GUID = "c3c181ec-2914-4791-af02-02d224a10b43"
  IID_ISoftwareBitmapNativeFactory = LibC::GUID.new(0xc3c181ec_u32, 0x2914_u16, 0x4791_u16, StaticArray[0xaf_u8, 0x2_u8, 0x2_u8, 0xd2_u8, 0x24_u8, 0xa1_u8, 0xb_u8, 0x43_u8])
  struct ISoftwareBitmapNativeFactory
    lpVtbl : ISoftwareBitmapNativeFactoryVTbl*
  end

end
struct LibWin32::ISoftwareBitmapNative
  def query_interface(this : ISoftwareBitmapNative*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISoftwareBitmapNative*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISoftwareBitmapNative*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_iids(this : ISoftwareBitmapNative*, iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.call(this, iidcount, iids)
  end
  def get_runtime_class_name(this : ISoftwareBitmapNative*, classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.call(this, classname)
  end
  def get_trust_level(this : ISoftwareBitmapNative*, trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.call(this, trustlevel)
  end
  def get_data(this : ISoftwareBitmapNative*, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_data.call(this, riid, ppv)
  end
end
struct LibWin32::ISoftwareBitmapNativeFactory
  def query_interface(this : ISoftwareBitmapNativeFactory*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISoftwareBitmapNativeFactory*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISoftwareBitmapNativeFactory*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_iids(this : ISoftwareBitmapNativeFactory*, iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.call(this, iidcount, iids)
  end
  def get_runtime_class_name(this : ISoftwareBitmapNativeFactory*, classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.call(this, classname)
  end
  def get_trust_level(this : ISoftwareBitmapNativeFactory*, trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.call(this, trustlevel)
  end
  def create_from_wic_bitmap(this : ISoftwareBitmapNativeFactory*, data : IWICBitmap, forcereadonly : LibC::BOOL, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.create_from_wic_bitmap.call(this, data, forcereadonly, riid, ppv)
  end
  def create_from_mf2_d_buffer2(this : ISoftwareBitmapNativeFactory*, data : IMF2DBuffer2, subtype : Guid*, width : UInt32, height : UInt32, forcereadonly : LibC::BOOL, mindisplayaperture : MFVideoArea*, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.create_from_mf2_d_buffer2.call(this, data, subtype, width, height, forcereadonly, mindisplayaperture, riid, ppv)
  end
end
