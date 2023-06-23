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
lib LibWin32

  struct IGraphicsCaptureItemInteropVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_for_window : UInt64
    create_for_monitor : UInt64
  end

  IGraphicsCaptureItemInterop_GUID = "3628e81b-3cac-4c60-b7f4-23ce0e0c3356"
  IID_IGraphicsCaptureItemInterop = LibC::GUID.new(0x3628e81b_u32, 0x3cac_u16, 0x4c60_u16, StaticArray[0xb7_u8, 0xf4_u8, 0x23_u8, 0xce_u8, 0xe_u8, 0xc_u8, 0x33_u8, 0x56_u8])
  struct IGraphicsCaptureItemInterop
    lpVtbl : IGraphicsCaptureItemInteropVTbl*
  end

end
struct LibWin32::IGraphicsCaptureItemInterop
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_for_window(window : LibC::HANDLE, riid : Guid*, result : Void**) : HRESULT
    @lpVtbl.value.create_for_window.unsafe_as(Proc(LibC::HANDLE, Guid*, Void**, HRESULT)).call(window, riid, result)
  end
  def create_for_monitor(monitor : HMONITOR, riid : Guid*, result : Void**) : HRESULT
    @lpVtbl.value.create_for_monitor.unsafe_as(Proc(HMONITOR, Guid*, Void**, HRESULT)).call(monitor, riid, result)
  end
end
