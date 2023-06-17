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
lib LibWin32

  struct IThumbnailExtractorVTbl
    query_interface : Proc(IThumbnailExtractor*, Guid*, Void**, HRESULT)
    add_ref : Proc(IThumbnailExtractor*, UInt32)
    release : Proc(IThumbnailExtractor*, UInt32)
    extract_thumbnail : Proc(IThumbnailExtractor*, IStorage, UInt32, UInt32, UInt32*, UInt32*, HBITMAP*, HRESULT)
    on_file_updated : Proc(IThumbnailExtractor*, IStorage, HRESULT)
  end

  IThumbnailExtractor_GUID = "969dc708-5c76-11d1-8d86-0000f804b057"
  IID_IThumbnailExtractor = LibC::GUID.new(0x969dc708_u32, 0x5c76_u16, 0x11d1_u16, StaticArray[0x8d_u8, 0x86_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x4_u8, 0xb0_u8, 0x57_u8])
  struct IThumbnailExtractor
    lpVtbl : IThumbnailExtractorVTbl*
  end

  struct IDummyHICONIncluderVTbl
    query_interface : Proc(IDummyHICONIncluder*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDummyHICONIncluder*, UInt32)
    release : Proc(IDummyHICONIncluder*, UInt32)
    dummy : Proc(IDummyHICONIncluder*, LibC::HANDLE, HDC, HRESULT)
  end

  IDummyHICONIncluder_GUID = "947990de-cc28-11d2-a0f7-00805f858fb1"
  IID_IDummyHICONIncluder = LibC::GUID.new(0x947990de_u32, 0xcc28_u16, 0x11d2_u16, StaticArray[0xa0_u8, 0xf7_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0x85_u8, 0x8f_u8, 0xb1_u8])
  struct IDummyHICONIncluder
    lpVtbl : IDummyHICONIncluderVTbl*
  end

end