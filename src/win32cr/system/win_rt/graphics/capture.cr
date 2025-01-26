require "./../../com.cr"
require "./../../../foundation.cr"
require "./../../../graphics/gdi.cr"

module Win32cr::System::WinRT::Graphics::Capture


  @[Extern]
  record IGraphicsCaptureItemInteropVtbl,
    query_interface : Proc(IGraphicsCaptureItemInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGraphicsCaptureItemInterop*, UInt32),
    release : Proc(IGraphicsCaptureItemInterop*, UInt32),
    create_for_window : Proc(IGraphicsCaptureItemInterop*, Win32cr::Foundation::HWND, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    create_for_monitor : Proc(IGraphicsCaptureItemInterop*, Win32cr::Graphics::Gdi::HMONITOR, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGraphicsCaptureItemInterop, lpVtbl : IGraphicsCaptureItemInteropVtbl* do
    GUID = LibC::GUID.new(0x3628e81b_u32, 0x3cac_u16, 0x4c60_u16, StaticArray[0xb7_u8, 0xf4_u8, 0x23_u8, 0xce_u8, 0xe_u8, 0xc_u8, 0x33_u8, 0x56_u8])
    def query_interface(this : IGraphicsCaptureItemInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGraphicsCaptureItemInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGraphicsCaptureItemInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_for_window(this : IGraphicsCaptureItemInterop*, window : Win32cr::Foundation::HWND, riid : LibC::GUID*, result : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_for_window.call(this, window, riid, result)
    end
    def create_for_monitor(this : IGraphicsCaptureItemInterop*, monitor : Win32cr::Graphics::Gdi::HMONITOR, riid : LibC::GUID*, result : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_for_monitor.call(this, monitor, riid, result)
    end

  end

end