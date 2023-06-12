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

  IGraphicsCaptureItemInterop_GUID = LibC::GUID.new("3628e81b-3cac-4c60-b7f4-23ce0e0c3356")
  CLSID_IGraphicsCaptureItemInterop = "3628e81b-3cac-4c60-b7f4-23ce0e0c3356"
  struct IGraphicsCaptureItemInterop
    lpVtbl : IGraphicsCaptureItemInteropVTbl*
  end

end
