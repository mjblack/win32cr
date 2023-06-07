require "../../foundation.cr"
require "../../graphics/dxgi.cr"
require "../../graphics/direct2d/common.cr"
require "../../system/com.cr"
require "../../graphics/direct2d.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:windows.data.pdf.dll")]
{% else %}
@[Link("windows.data.pdf")]
{% end %}
lib LibWin32
  alias PFN_PDF_CREATE_RENDERER = Proc(IDXGIDevice, IPdfRendererNative*, HRESULT)

  struct PDF_RENDER_PARAMS
    source_rect : D2D_RECT_F
    destination_width : UInt32
    destination_height : UInt32
    background_color : D2D_COLOR_F
    ignore_high_contrast : BOOLEAN
  end


  struct IPdfRendererNativeVTbl
    query_interface : Proc(IPdfRendererNative*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPdfRendererNative*, UInt32)
    release : Proc(IPdfRendererNative*, UInt32)
    render_page_to_surface : Proc(IPdfRendererNative*, IUnknown, IDXGISurface, POINT, PDF_RENDER_PARAMS*, HRESULT)
    render_page_to_device_context : Proc(IPdfRendererNative*, IUnknown, ID2D1DeviceContext, PDF_RENDER_PARAMS*, HRESULT)
  end

  struct IPdfRendererNative
    lpVtbl : IPdfRendererNativeVTbl*
  end


  # Params # pdevice : IDXGIDevice [In],pprenderer : IPdfRendererNative* [In]
  fun PdfCreateRenderer(pdevice : IDXGIDevice, pprenderer : IPdfRendererNative*) : HRESULT
end
