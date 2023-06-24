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

  IPdfRendererNative_GUID = "7d9dcd91-d277-4947-8527-07a0daeda94a"
  IID_IPdfRendererNative = LibC::GUID.new(0x7d9dcd91_u32, 0xd277_u16, 0x4947_u16, StaticArray[0x85_u8, 0x27_u8, 0x7_u8, 0xa0_u8, 0xda_u8, 0xed_u8, 0xa9_u8, 0x4a_u8])
  struct IPdfRendererNative
    lpVtbl : IPdfRendererNativeVTbl*
  end


  # Params # pdevice : IDXGIDevice [In],pprenderer : IPdfRendererNative* [In]
  fun PdfCreateRenderer(pdevice : IDXGIDevice, pprenderer : IPdfRendererNative*) : HRESULT
end
struct LibWin32::IPdfRendererNative
  def query_interface(this : IPdfRendererNative*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IPdfRendererNative*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IPdfRendererNative*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def render_page_to_surface(this : IPdfRendererNative*, pdfpage : IUnknown, psurface : IDXGISurface, offset : POINT, prenderparams : PDF_RENDER_PARAMS*) : HRESULT
    @lpVtbl.value.render_page_to_surface.call(this, pdfpage, psurface, offset, prenderparams)
  end
  def render_page_to_device_context(this : IPdfRendererNative*, pdfpage : IUnknown, pd2ddevicecontext : ID2D1DeviceContext, prenderparams : PDF_RENDER_PARAMS*) : HRESULT
    @lpVtbl.value.render_page_to_device_context.call(this, pdfpage, pd2ddevicecontext, prenderparams)
  end
end
