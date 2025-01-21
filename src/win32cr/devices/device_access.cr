require "./../system/com.cr"
require "./../foundation.cr"

module Win32cr::Devices::DeviceAccess
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


  @[Extern]
  record IDeviceRequestCompletionCallbackVtbl,
    query_interface : Proc(IDeviceRequestCompletionCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDeviceRequestCompletionCallback*, UInt32),
    release : Proc(IDeviceRequestCompletionCallback*, UInt32),
    invoke : Proc(IDeviceRequestCompletionCallback*, Win32cr::Foundation::HRESULT, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("999bad24-9acd-45bb-8669-2a2fc0288b04")]
  record IDeviceRequestCompletionCallback, lpVtbl : IDeviceRequestCompletionCallbackVtbl* do
    GUID = LibC::GUID.new(0x999bad24_u32, 0x9acd_u16, 0x45bb_u16, StaticArray[0x86_u8, 0x69_u8, 0x2a_u8, 0x2f_u8, 0xc0_u8, 0x28_u8, 0x8b_u8, 0x4_u8])
    def query_interface(this : IDeviceRequestCompletionCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDeviceRequestCompletionCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDeviceRequestCompletionCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def invoke(this : IDeviceRequestCompletionCallback*, requestResult : Win32cr::Foundation::HRESULT, bytesReturned : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke.call(this, requestResult, bytesReturned)
    end

  end

  @[Extern]
  record IDeviceIoControlVtbl,
    query_interface : Proc(IDeviceIoControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDeviceIoControl*, UInt32),
    release : Proc(IDeviceIoControl*, UInt32),
    device_io_control_sync : Proc(IDeviceIoControl*, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    device_io_control_async : Proc(IDeviceIoControl*, UInt32, UInt8*, UInt32, UInt8*, UInt32, Void*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    cancel_operation : Proc(IDeviceIoControl*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("9eefe161-23ab-4f18-9b49-991b586ae970")]
  record IDeviceIoControl, lpVtbl : IDeviceIoControlVtbl* do
    GUID = LibC::GUID.new(0x9eefe161_u32, 0x23ab_u16, 0x4f18_u16, StaticArray[0x9b_u8, 0x49_u8, 0x99_u8, 0x1b_u8, 0x58_u8, 0x6a_u8, 0xe9_u8, 0x70_u8])
    def query_interface(this : IDeviceIoControl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDeviceIoControl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDeviceIoControl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def device_io_control_sync(this : IDeviceIoControl*, ioControlCode : UInt32, inputBuffer : UInt8*, inputBufferSize : UInt32, outputBuffer : UInt8*, outputBufferSize : UInt32, bytesReturned : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.device_io_control_sync.call(this, ioControlCode, inputBuffer, inputBufferSize, outputBuffer, outputBufferSize, bytesReturned)
    end
    def device_io_control_async(this : IDeviceIoControl*, ioControlCode : UInt32, inputBuffer : UInt8*, inputBufferSize : UInt32, outputBuffer : UInt8*, outputBufferSize : UInt32, requestCompletionCallback : Void*, cancelContext : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.device_io_control_async.call(this, ioControlCode, inputBuffer, inputBufferSize, outputBuffer, outputBufferSize, requestCompletionCallback, cancelContext)
    end
    def cancel_operation(this : IDeviceIoControl*, cancelContext : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel_operation.call(this, cancelContext)
    end

  end

  @[Extern]
  record ICreateDeviceAccessAsyncVtbl,
    query_interface : Proc(ICreateDeviceAccessAsync*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICreateDeviceAccessAsync*, UInt32),
    release : Proc(ICreateDeviceAccessAsync*, UInt32),
    cancel : Proc(ICreateDeviceAccessAsync*, Win32cr::Foundation::HRESULT),
    wait : Proc(ICreateDeviceAccessAsync*, UInt32, Win32cr::Foundation::HRESULT),
    close : Proc(ICreateDeviceAccessAsync*, Win32cr::Foundation::HRESULT),
    get_result : Proc(ICreateDeviceAccessAsync*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("3474628f-683d-42d2-abcb-db018c6503bc")]
  record ICreateDeviceAccessAsync, lpVtbl : ICreateDeviceAccessAsyncVtbl* do
    GUID = LibC::GUID.new(0x3474628f_u32, 0x683d_u16, 0x42d2_u16, StaticArray[0xab_u8, 0xcb_u8, 0xdb_u8, 0x1_u8, 0x8c_u8, 0x65_u8, 0x3_u8, 0xbc_u8])
    def query_interface(this : ICreateDeviceAccessAsync*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICreateDeviceAccessAsync*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICreateDeviceAccessAsync*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def cancel(this : ICreateDeviceAccessAsync*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel.call(this)
    end
    def wait(this : ICreateDeviceAccessAsync*, timeout : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wait.call(this, timeout)
    end
    def close(this : ICreateDeviceAccessAsync*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end
    def get_result(this : ICreateDeviceAccessAsync*, riid : LibC::GUID*, deviceAccess : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_result.call(this, riid, deviceAccess)
    end

  end

  @[Link("deviceaccess")]
  lib C
    fun CreateDeviceAccessInstance(deviceInterfacePath : Win32cr::Foundation::PWSTR, desiredAccess : UInt32, createAsync : Void**) : Win32cr::Foundation::HRESULT

  end
end