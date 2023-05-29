require "../../../system/com.cr"
require "../../../foundation.cr"
require "../../../graphics/gdi.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
lib LibWin32

  struct IGraphicsCaptureItemInteropVTbl
    query_interface : Proc(IGraphicsCaptureItemInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGraphicsCaptureItemInterop*, UInt32)
    release : Proc(IGraphicsCaptureItemInterop*, UInt32)
    create_for_window : Proc(IGraphicsCaptureItemInterop*, LibC::HANDLE, Guid*, Void**, HRESULT)
    create_for_monitor : Proc(IGraphicsCaptureItemInterop*, HMONITOR, Guid*, Void**, HRESULT)
  end

  struct IGraphicsCaptureItemInterop
    lpVtbl : IGraphicsCaptureItemInteropVTbl*
  end

end
