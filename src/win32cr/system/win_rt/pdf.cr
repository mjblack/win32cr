require "./../../graphics/dxgi.cr"
require "./../../foundation.cr"
require "./../../graphics/direct2_d/common.cr"
require "./../com.cr"
require "./../../graphics/direct2_d.cr"

module Win32cr::System::WinRT::Pdf
  alias PFN_PDF_CREATE_RENDERER = Proc(Void*, Void**, Win32cr::Foundation::HRESULT)



  @[Extern]
  struct PDF_RENDER_PARAMS
    property source_rect : Win32cr::Graphics::Direct2D::Common::D2D_RECT_F
    property destination_width : UInt32
    property destination_height : UInt32
    property background_color : Win32cr::Graphics::Direct2D::Common::D2D_COLOR_F
    property ignore_high_contrast : Win32cr::Foundation::BOOLEAN
    def initialize(@source_rect : Win32cr::Graphics::Direct2D::Common::D2D_RECT_F, @destination_width : UInt32, @destination_height : UInt32, @background_color : Win32cr::Graphics::Direct2D::Common::D2D_COLOR_F, @ignore_high_contrast : Win32cr::Foundation::BOOLEAN)
    end
  end

  @[Extern]
  record IPdfRendererNativeVtbl,
    query_interface : Proc(IPdfRendererNative*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPdfRendererNative*, UInt32),
    release : Proc(IPdfRendererNative*, UInt32),
    render_page_to_surface : Proc(IPdfRendererNative*, Void*, Void*, Win32cr::Foundation::POINT, Win32cr::System::WinRT::Pdf::PDF_RENDER_PARAMS*, Win32cr::Foundation::HRESULT),
    render_page_to_device_context : Proc(IPdfRendererNative*, Void*, Void*, Win32cr::System::WinRT::Pdf::PDF_RENDER_PARAMS*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPdfRendererNative, lpVtbl : IPdfRendererNativeVtbl* do
    GUID = LibC::GUID.new(0x7d9dcd91_u32, 0xd277_u16, 0x4947_u16, StaticArray[0x85_u8, 0x27_u8, 0x7_u8, 0xa0_u8, 0xda_u8, 0xed_u8, 0xa9_u8, 0x4a_u8])
    def query_interface(this : IPdfRendererNative*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPdfRendererNative*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPdfRendererNative*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def render_page_to_surface(this : IPdfRendererNative*, pdfPage : Void*, pSurface : Void*, offset : Win32cr::Foundation::POINT, pRenderParams : Win32cr::System::WinRT::Pdf::PDF_RENDER_PARAMS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.render_page_to_surface.call(this, pdfPage, pSurface, offset, pRenderParams)
    end
    def render_page_to_device_context(this : IPdfRendererNative*, pdfPage : Void*, pD2DDeviceContext : Void*, pRenderParams : Win32cr::System::WinRT::Pdf::PDF_RENDER_PARAMS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.render_page_to_device_context.call(this, pdfPage, pD2DDeviceContext, pRenderParams)
    end

  end

  @[Link("windows.data.pdf")]
  lib C
    fun PdfCreateRenderer(pDevice : Void*, ppRenderer : Void**) : Win32cr::Foundation::HRESULT

  end
end