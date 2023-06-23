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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    extract_thumbnail : UInt64
    on_file_updated : UInt64
  end

  IThumbnailExtractor_GUID = "969dc708-5c76-11d1-8d86-0000f804b057"
  IID_IThumbnailExtractor = LibC::GUID.new(0x969dc708_u32, 0x5c76_u16, 0x11d1_u16, StaticArray[0x8d_u8, 0x86_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x4_u8, 0xb0_u8, 0x57_u8])
  struct IThumbnailExtractor
    lpVtbl : IThumbnailExtractorVTbl*
  end

  struct IDummyHICONIncluderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    dummy : UInt64
  end

  IDummyHICONIncluder_GUID = "947990de-cc28-11d2-a0f7-00805f858fb1"
  IID_IDummyHICONIncluder = LibC::GUID.new(0x947990de_u32, 0xcc28_u16, 0x11d2_u16, StaticArray[0xa0_u8, 0xf7_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0x85_u8, 0x8f_u8, 0xb1_u8])
  struct IDummyHICONIncluder
    lpVtbl : IDummyHICONIncluderVTbl*
  end

end
struct LibWin32::IThumbnailExtractor
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def extract_thumbnail(pstg : IStorage, ullength : UInt32, ulheight : UInt32, puloutputlength : UInt32*, puloutputheight : UInt32*, phoutputbitmap : HBITMAP*) : HRESULT
    @lpVtbl.value.extract_thumbnail.unsafe_as(Proc(IStorage, UInt32, UInt32, UInt32*, UInt32*, HBITMAP*, HRESULT)).call(pstg, ullength, ulheight, puloutputlength, puloutputheight, phoutputbitmap)
  end
  def on_file_updated(pstg : IStorage) : HRESULT
    @lpVtbl.value.on_file_updated.unsafe_as(Proc(IStorage, HRESULT)).call(pstg)
  end
end
struct LibWin32::IDummyHICONIncluder
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def dummy(h1 : LibC::HANDLE, h2 : HDC) : HRESULT
    @lpVtbl.value.dummy.unsafe_as(Proc(LibC::HANDLE, HDC, HRESULT)).call(h1, h2)
  end
end
