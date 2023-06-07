require "../../../system/com.cr"
require "../../../foundation.cr"
require "../../../graphics/gdi.cr"

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
