require "../../system/com.cr"
require "../../foundation.cr"
require "../../system/com/structuredstorage.cr"
require "../../graphics/gdi.cr"
require "../../ui/windowsandmessaging.cr"

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

  struct IThumbnailExtractorVTbl
    query_interface : Proc(IThumbnailExtractor*, Guid*, Void**, HRESULT)
    add_ref : Proc(IThumbnailExtractor*, UInt32)
    release : Proc(IThumbnailExtractor*, UInt32)
    extract_thumbnail : Proc(IThumbnailExtractor*, IStorage, UInt32, UInt32, UInt32*, UInt32*, HBITMAP*, HRESULT)
    on_file_updated : Proc(IThumbnailExtractor*, IStorage, HRESULT)
  end

  IThumbnailExtractor_GUID = LibC::GUID.new("969dc708-5c76-11d1-8d86-0000f804b057")
  CLSID_IThumbnailExtractor = "969dc708-5c76-11d1-8d86-0000f804b057"
  struct IThumbnailExtractor
    lpVtbl : IThumbnailExtractorVTbl*
  end

  struct IDummyHICONIncluderVTbl
    query_interface : Proc(IDummyHICONIncluder*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDummyHICONIncluder*, UInt32)
    release : Proc(IDummyHICONIncluder*, UInt32)
    dummy : Proc(IDummyHICONIncluder*, LibC::HANDLE, HDC, HRESULT)
  end

  IDummyHICONIncluder_GUID = LibC::GUID.new("947990de-cc28-11d2-a0f7-00805f858fb1")
  CLSID_IDummyHICONIncluder = "947990de-cc28-11d2-a0f7-00805f858fb1"
  struct IDummyHICONIncluder
    lpVtbl : IDummyHICONIncluderVTbl*
  end

end
