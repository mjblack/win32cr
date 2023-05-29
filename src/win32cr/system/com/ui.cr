require "../../system/com.cr"
require "../../foundation.cr"
require "../../system/com/structuredstorage.cr"
require "../../graphics/gdi.cr"
require "../../ui/windowsandmessaging.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
lib LibWin32

  struct IThumbnailExtractorVTbl
    query_interface : Proc(IThumbnailExtractor*, Guid*, Void**, HRESULT)
    add_ref : Proc(IThumbnailExtractor*, UInt32)
    release : Proc(IThumbnailExtractor*, UInt32)
    extract_thumbnail : Proc(IThumbnailExtractor*, IStorage, UInt32, UInt32, UInt32*, UInt32*, HBITMAP*, HRESULT)
    on_file_updated : Proc(IThumbnailExtractor*, IStorage, HRESULT)
  end

  struct IThumbnailExtractor
    lpVtbl : IThumbnailExtractorVTbl*
  end

  struct IDummyHICONIncluderVTbl
    query_interface : Proc(IDummyHICONIncluder*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDummyHICONIncluder*, UInt32)
    release : Proc(IDummyHICONIncluder*, UInt32)
    dummy : Proc(IDummyHICONIncluder*, LibC::HANDLE, HDC, HRESULT)
  end

  struct IDummyHICONIncluder
    lpVtbl : IDummyHICONIncluderVTbl*
  end

end
