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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    render_page_to_surface : UInt64
    render_page_to_device_context : UInt64
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
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def render_page_to_surface(pdfpage : IUnknown, psurface : IDXGISurface, offset : POINT, prenderparams : PDF_RENDER_PARAMS*) : HRESULT
    @lpVtbl.value.render_page_to_surface.unsafe_as(Proc(IUnknown, IDXGISurface, POINT, PDF_RENDER_PARAMS*, HRESULT)).call(pdfpage, psurface, offset, prenderparams)
  end
  def render_page_to_device_context(pdfpage : IUnknown, pd2ddevicecontext : ID2D1DeviceContext, prenderparams : PDF_RENDER_PARAMS*) : HRESULT
    @lpVtbl.value.render_page_to_device_context.unsafe_as(Proc(IUnknown, ID2D1DeviceContext, PDF_RENDER_PARAMS*, HRESULT)).call(pdfpage, pd2ddevicecontext, prenderparams)
  end
end
