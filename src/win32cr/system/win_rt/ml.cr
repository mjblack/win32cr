require "./../com.cr"
require "./../../foundation.cr"
require "./../../ai/machine_learning/win_ml.cr"
require "./../../graphics/direct3_d12.cr"

module Win32cr::System::WinRT::ML


  @[Extern]
  record ILearningModelOperatorProviderNativeVtbl,
    query_interface : Proc(ILearningModelOperatorProviderNative*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ILearningModelOperatorProviderNative*, UInt32),
    release : Proc(ILearningModelOperatorProviderNative*, UInt32),
    get_registry : Proc(ILearningModelOperatorProviderNative*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ILearningModelOperatorProviderNative, lpVtbl : ILearningModelOperatorProviderNativeVtbl* do
    GUID = LibC::GUID.new(0x1adaa23a_u32, 0xeb67_u16, 0x41f3_u16, StaticArray[0xaa_u8, 0xd8_u8, 0x5d_u8, 0x98_u8, 0x4e_u8, 0x9b_u8, 0xac_u8, 0xd4_u8])
    def query_interface(this : ILearningModelOperatorProviderNative*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ILearningModelOperatorProviderNative*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ILearningModelOperatorProviderNative*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_registry(this : ILearningModelOperatorProviderNative*, ppOperatorRegistry : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_registry.call(this, ppOperatorRegistry)
    end

  end

  @[Extern]
  record ITensorNativeVtbl,
    query_interface : Proc(ITensorNative*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITensorNative*, UInt32),
    release : Proc(ITensorNative*, UInt32),
    get_buffer : Proc(ITensorNative*, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_d3_d12_resource : Proc(ITensorNative*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITensorNative, lpVtbl : ITensorNativeVtbl* do
    GUID = LibC::GUID.new(0x52f547ef_u32, 0x5b03_u16, 0x49b5_u16, StaticArray[0x82_u8, 0xd6_u8, 0x56_u8, 0x5f_u8, 0x1e_u8, 0xe0_u8, 0xdd_u8, 0x49_u8])
    def query_interface(this : ITensorNative*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITensorNative*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITensorNative*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_buffer(this : ITensorNative*, value : UInt8**, capacity : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_buffer.call(this, value, capacity)
    end
    def get_d3_d12_resource(this : ITensorNative*, result : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_d3_d12_resource.call(this, result)
    end

  end

  @[Extern]
  record ITensorStaticsNativeVtbl,
    query_interface : Proc(ITensorStaticsNative*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITensorStaticsNative*, UInt32),
    release : Proc(ITensorStaticsNative*, UInt32),
    create_from_d3_d12_resource : Proc(ITensorStaticsNative*, Void*, Int64*, Int32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITensorStaticsNative, lpVtbl : ITensorStaticsNativeVtbl* do
    GUID = LibC::GUID.new(0x39d055a4_u32, 0x66f6_u16, 0x4ebc_u16, StaticArray[0x95_u8, 0xd9_u8, 0x7a_u8, 0x29_u8, 0xeb_u8, 0xe7_u8, 0x69_u8, 0xa_u8])
    def query_interface(this : ITensorStaticsNative*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITensorStaticsNative*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITensorStaticsNative*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_from_d3_d12_resource(this : ITensorStaticsNative*, value : Void*, shape : Int64*, shapeCount : Int32, result : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_from_d3_d12_resource.call(this, value, shape, shapeCount, result)
    end

  end

  @[Extern]
  record ILearningModelDeviceFactoryNativeVtbl,
    query_interface : Proc(ILearningModelDeviceFactoryNative*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ILearningModelDeviceFactoryNative*, UInt32),
    release : Proc(ILearningModelDeviceFactoryNative*, UInt32),
    create_from_d3_d12_command_queue : Proc(ILearningModelDeviceFactoryNative*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ILearningModelDeviceFactoryNative, lpVtbl : ILearningModelDeviceFactoryNativeVtbl* do
    GUID = LibC::GUID.new(0x1e9b31a1_u32, 0x662e_u16, 0x4ae0_u16, StaticArray[0xaf_u8, 0x67_u8, 0xf6_u8, 0x3b_u8, 0xb3_u8, 0x37_u8, 0xe6_u8, 0x34_u8])
    def query_interface(this : ILearningModelDeviceFactoryNative*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ILearningModelDeviceFactoryNative*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ILearningModelDeviceFactoryNative*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_from_d3_d12_command_queue(this : ILearningModelDeviceFactoryNative*, value : Void*, result : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_from_d3_d12_command_queue.call(this, value, result)
    end

  end

  @[Extern]
  record ILearningModelSessionOptionsNativeVtbl,
    query_interface : Proc(ILearningModelSessionOptionsNative*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ILearningModelSessionOptionsNative*, UInt32),
    release : Proc(ILearningModelSessionOptionsNative*, UInt32),
    set_intra_op_num_threads_override : Proc(ILearningModelSessionOptionsNative*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ILearningModelSessionOptionsNative, lpVtbl : ILearningModelSessionOptionsNativeVtbl* do
    GUID = LibC::GUID.new(0xc71e953f_u32, 0x37b4_u16, 0x4564_u16, StaticArray[0x86_u8, 0x58_u8, 0xd8_u8, 0x39_u8, 0x68_u8, 0x66_u8, 0xdb_u8, 0xd_u8])
    def query_interface(this : ILearningModelSessionOptionsNative*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ILearningModelSessionOptionsNative*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ILearningModelSessionOptionsNative*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_intra_op_num_threads_override(this : ILearningModelSessionOptionsNative*, intraOpNumThreads : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_intra_op_num_threads_override.call(this, intraOpNumThreads)
    end

  end

end