require "./../../com.cr"
require "./../../../foundation.cr"
require "./../../../graphics/gdi.cr"

module Win32cr::System::WinRT::Graphics::Capture
  extend self


  @[Extern]

  record IGraphicsCaptureItemInteropVtable,
    query_interface : Proc(IGraphicsCaptureItemInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGraphicsCaptureItemInterop*, UInt32),
    release : Proc(IGraphicsCaptureItemInterop*, UInt32),
    create_for_window : Proc(IGraphicsCaptureItemInterop*, Win32cr::Foundation::HWND, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    create_for_monitor : Proc(IGraphicsCaptureItemInterop*, Win32cr::Graphics::Gdi::HMONITOR, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGraphicsCaptureItemInterop, lpVtbl : IGraphicsCaptureItemInteropVtable* do
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

  @[Extern]

  record IWindowGraphicsCaptureItemInteropVtable,
    query_interface : Proc(IWindowGraphicsCaptureItemInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWindowGraphicsCaptureItemInterop*, UInt32),
    release : Proc(IWindowGraphicsCaptureItemInterop*, UInt32),
    get_window : Proc(IWindowGraphicsCaptureItemInterop*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWindowGraphicsCaptureItemInterop, lpVtbl : IWindowGraphicsCaptureItemInteropVtable* do
    GUID = LibC::GUID.new(0x38e4c48b_u32, 0x94e6_u16, 0x4c44_u16, StaticArray[0x9c_u8, 0xfa_u8, 0x96_u8, 0x81_u8, 0x93_u8, 0x31_u8, 0x6c_u8, 0xc_u8])
    def query_interface(this : IWindowGraphicsCaptureItemInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWindowGraphicsCaptureItemInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWindowGraphicsCaptureItemInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_window(this : IWindowGraphicsCaptureItemInterop*, window : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_window.call(this, window)
    end

  end

  @[Extern]

  record IMonitorGraphicsCaptureItemInteropVtable,
    query_interface : Proc(IMonitorGraphicsCaptureItemInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMonitorGraphicsCaptureItemInterop*, UInt32),
    release : Proc(IMonitorGraphicsCaptureItemInterop*, UInt32),
    get_monitor : Proc(IMonitorGraphicsCaptureItemInterop*, Win32cr::Graphics::Gdi::HMONITOR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMonitorGraphicsCaptureItemInterop, lpVtbl : IMonitorGraphicsCaptureItemInteropVtable* do
    GUID = LibC::GUID.new(0x33274d14_u32, 0xa076_u16, 0x4048_u16, StaticArray[0x84_u8, 0x16_u8, 0x74_u8, 0x7e_u8, 0x9b_u8, 0x4_u8, 0xdb_u8, 0x7b_u8])
    def query_interface(this : IMonitorGraphicsCaptureItemInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMonitorGraphicsCaptureItemInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMonitorGraphicsCaptureItemInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_monitor(this : IMonitorGraphicsCaptureItemInterop*, monitor : Win32cr::Graphics::Gdi::HMONITOR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_monitor.call(this, monitor)
    end

  end

end