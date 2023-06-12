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
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
{% else %}
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

  ISoftwareBitmapNative_GUID = LibC::GUID.new("94bc8415-04ea-4b2e-af13-4de95aa898eb")
  CLSID_ISoftwareBitmapNative = "94bc8415-04ea-4b2e-af13-4de95aa898eb"
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

  ISoftwareBitmapNativeFactory_GUID = LibC::GUID.new("c3c181ec-2914-4791-af02-02d224a10b43")
  CLSID_ISoftwareBitmapNativeFactory = "c3c181ec-2914-4791-af02-02d224a10b43"
  struct ISoftwareBitmapNativeFactory
    lpVtbl : ISoftwareBitmapNativeFactoryVTbl*
  end

end
