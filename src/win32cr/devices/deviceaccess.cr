require "../system/com.cr"
require "../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:deviceaccess.dll")]
{% else %}
@[Link("deviceaccess")]
{% end %}
lib LibWin32
  ED_BASE = 4096_i32
  DEV_PORT_SIM = 1_u32
  DEV_PORT_COM1 = 2_u32
  DEV_PORT_COM2 = 3_u32
  DEV_PORT_COM3 = 4_u32
  DEV_PORT_COM4 = 5_u32
  DEV_PORT_DIAQ = 6_u32
  DEV_PORT_ARTI = 7_u32
  DEV_PORT_1394 = 8_u32
  DEV_PORT_USB = 9_u32
  DEV_PORT_MIN = 1_u32
  DEV_PORT_MAX = 9_u32
  ED_TOP = 1_u32
  ED_MIDDLE = 2_u32
  ED_BOTTOM = 4_u32
  ED_LEFT = 256_u32
  ED_CENTER = 512_u32
  ED_RIGHT = 1024_u32
  ED_AUDIO_ALL = 268435456_u32
  ED_AUDIO_1 = 1_i32
  ED_AUDIO_2 = 2_i32
  ED_AUDIO_3 = 4_i32
  ED_AUDIO_4 = 8_i32
  ED_AUDIO_5 = 16_i32
  ED_AUDIO_6 = 32_i32
  ED_AUDIO_7 = 64_i32
  ED_AUDIO_8 = 128_i32
  ED_AUDIO_9 = 256_i32
  ED_AUDIO_10 = 512_i32
  ED_AUDIO_11 = 1024_i32
  ED_AUDIO_12 = 2048_i32
  ED_AUDIO_13 = 4096_i32
  ED_AUDIO_14 = 8192_i32
  ED_AUDIO_15 = 16384_i32
  ED_AUDIO_16 = 32768_i32
  ED_AUDIO_17 = 65536_i32
  ED_AUDIO_18 = 131072_i32
  ED_AUDIO_19 = 262144_i32
  ED_AUDIO_20 = 524288_i32
  ED_AUDIO_21 = 1048576_i32
  ED_AUDIO_22 = 2097152_i32
  ED_AUDIO_23 = 4194304_i32
  ED_AUDIO_24 = 8388608_i32
  ED_VIDEO = 33554432_i32
  CLSID_DeviceIoControl = "12d3e372-874b-457d-9fdf-73977778686c"


  struct IDeviceRequestCompletionCallbackVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    invoke : UInt64
  end

  IDeviceRequestCompletionCallback_GUID = "999bad24-9acd-45bb-8669-2a2fc0288b04"
  IID_IDeviceRequestCompletionCallback = LibC::GUID.new(0x999bad24_u32, 0x9acd_u16, 0x45bb_u16, StaticArray[0x86_u8, 0x69_u8, 0x2a_u8, 0x2f_u8, 0xc0_u8, 0x28_u8, 0x8b_u8, 0x4_u8])
  struct IDeviceRequestCompletionCallback
    lpVtbl : IDeviceRequestCompletionCallbackVTbl*
  end

  struct IDeviceIoControlVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    device_io_control_sync : UInt64
    device_io_control_async : UInt64
    cancel_operation : UInt64
  end

  IDeviceIoControl_GUID = "9eefe161-23ab-4f18-9b49-991b586ae970"
  IID_IDeviceIoControl = LibC::GUID.new(0x9eefe161_u32, 0x23ab_u16, 0x4f18_u16, StaticArray[0x9b_u8, 0x49_u8, 0x99_u8, 0x1b_u8, 0x58_u8, 0x6a_u8, 0xe9_u8, 0x70_u8])
  struct IDeviceIoControl
    lpVtbl : IDeviceIoControlVTbl*
  end

  struct ICreateDeviceAccessAsyncVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    cancel : UInt64
    wait : UInt64
    close : UInt64
    get_result : UInt64
  end

  ICreateDeviceAccessAsync_GUID = "3474628f-683d-42d2-abcb-db018c6503bc"
  IID_ICreateDeviceAccessAsync = LibC::GUID.new(0x3474628f_u32, 0x683d_u16, 0x42d2_u16, StaticArray[0xab_u8, 0xcb_u8, 0xdb_u8, 0x1_u8, 0x8c_u8, 0x65_u8, 0x3_u8, 0xbc_u8])
  struct ICreateDeviceAccessAsync
    lpVtbl : ICreateDeviceAccessAsyncVTbl*
  end


  # Params # deviceinterfacepath : LibC::LPWSTR [In],desiredaccess : UInt32 [In],createasync : ICreateDeviceAccessAsync* [In]
  fun CreateDeviceAccessInstance(deviceinterfacepath : LibC::LPWSTR, desiredaccess : UInt32, createasync : ICreateDeviceAccessAsync*) : HRESULT
end
struct LibWin32::IDeviceRequestCompletionCallback
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def invoke(requestresult : HRESULT, bytesreturned : UInt32) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(HRESULT, UInt32, HRESULT)).call(requestresult, bytesreturned)
  end
end
struct LibWin32::IDeviceIoControl
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def device_io_control_sync(iocontrolcode : UInt32, inputbuffer : UInt8*, inputbuffersize : UInt32, outputbuffer : UInt8*, outputbuffersize : UInt32, bytesreturned : UInt32*) : HRESULT
    @lpVtbl.value.device_io_control_sync.unsafe_as(Proc(UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt32*, HRESULT)).call(iocontrolcode, inputbuffer, inputbuffersize, outputbuffer, outputbuffersize, bytesreturned)
  end
  def device_io_control_async(iocontrolcode : UInt32, inputbuffer : UInt8*, inputbuffersize : UInt32, outputbuffer : UInt8*, outputbuffersize : UInt32, requestcompletioncallback : IDeviceRequestCompletionCallback, cancelcontext : LibC::UINT_PTR*) : HRESULT
    @lpVtbl.value.device_io_control_async.unsafe_as(Proc(UInt32, UInt8*, UInt32, UInt8*, UInt32, IDeviceRequestCompletionCallback, LibC::UINT_PTR*, HRESULT)).call(iocontrolcode, inputbuffer, inputbuffersize, outputbuffer, outputbuffersize, requestcompletioncallback, cancelcontext)
  end
  def cancel_operation(cancelcontext : LibC::UINT_PTR) : HRESULT
    @lpVtbl.value.cancel_operation.unsafe_as(Proc(LibC::UINT_PTR, HRESULT)).call(cancelcontext)
  end
end
struct LibWin32::ICreateDeviceAccessAsync
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def cancel : HRESULT
    @lpVtbl.value.cancel.unsafe_as(Proc(HRESULT)).call
  end
  def wait(timeout : UInt32) : HRESULT
    @lpVtbl.value.wait.unsafe_as(Proc(UInt32, HRESULT)).call(timeout)
  end
  def close : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(HRESULT)).call
  end
  def get_result(riid : Guid*, deviceaccess : Void**) : HRESULT
    @lpVtbl.value.get_result.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, deviceaccess)
  end
end
