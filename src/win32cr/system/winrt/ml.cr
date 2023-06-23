require "../../system/com.cr"
require "../../foundation.cr"
require "../../ai/machinelearning/winml.cr"
require "../../graphics/direct3d12.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32

  struct ILearningModelOperatorProviderNativeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_registry : UInt64
  end

  ILearningModelOperatorProviderNative_GUID = "1adaa23a-eb67-41f3-aad8-5d984e9bacd4"
  IID_ILearningModelOperatorProviderNative = LibC::GUID.new(0x1adaa23a_u32, 0xeb67_u16, 0x41f3_u16, StaticArray[0xaa_u8, 0xd8_u8, 0x5d_u8, 0x98_u8, 0x4e_u8, 0x9b_u8, 0xac_u8, 0xd4_u8])
  struct ILearningModelOperatorProviderNative
    lpVtbl : ILearningModelOperatorProviderNativeVTbl*
  end

  struct ITensorNativeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_buffer : UInt64
    get_d3_d12_resource : UInt64
  end

  ITensorNative_GUID = "52f547ef-5b03-49b5-82d6-565f1ee0dd49"
  IID_ITensorNative = LibC::GUID.new(0x52f547ef_u32, 0x5b03_u16, 0x49b5_u16, StaticArray[0x82_u8, 0xd6_u8, 0x56_u8, 0x5f_u8, 0x1e_u8, 0xe0_u8, 0xdd_u8, 0x49_u8])
  struct ITensorNative
    lpVtbl : ITensorNativeVTbl*
  end

  struct ITensorStaticsNativeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_from_d3_d12_resource : UInt64
  end

  ITensorStaticsNative_GUID = "39d055a4-66f6-4ebc-95d9-7a29ebe7690a"
  IID_ITensorStaticsNative = LibC::GUID.new(0x39d055a4_u32, 0x66f6_u16, 0x4ebc_u16, StaticArray[0x95_u8, 0xd9_u8, 0x7a_u8, 0x29_u8, 0xeb_u8, 0xe7_u8, 0x69_u8, 0xa_u8])
  struct ITensorStaticsNative
    lpVtbl : ITensorStaticsNativeVTbl*
  end

  struct ILearningModelDeviceFactoryNativeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_from_d3_d12_command_queue : UInt64
  end

  ILearningModelDeviceFactoryNative_GUID = "1e9b31a1-662e-4ae0-af67-f63bb337e634"
  IID_ILearningModelDeviceFactoryNative = LibC::GUID.new(0x1e9b31a1_u32, 0x662e_u16, 0x4ae0_u16, StaticArray[0xaf_u8, 0x67_u8, 0xf6_u8, 0x3b_u8, 0xb3_u8, 0x37_u8, 0xe6_u8, 0x34_u8])
  struct ILearningModelDeviceFactoryNative
    lpVtbl : ILearningModelDeviceFactoryNativeVTbl*
  end

  struct ILearningModelSessionOptionsNativeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_intra_op_num_threads_override : UInt64
  end

  ILearningModelSessionOptionsNative_GUID = "c71e953f-37b4-4564-8658-d8396866db0d"
  IID_ILearningModelSessionOptionsNative = LibC::GUID.new(0xc71e953f_u32, 0x37b4_u16, 0x4564_u16, StaticArray[0x86_u8, 0x58_u8, 0xd8_u8, 0x39_u8, 0x68_u8, 0x66_u8, 0xdb_u8, 0xd_u8])
  struct ILearningModelSessionOptionsNative
    lpVtbl : ILearningModelSessionOptionsNativeVTbl*
  end

end
struct LibWin32::ILearningModelOperatorProviderNative
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_registry(ppoperatorregistry : IMLOperatorRegistry*) : HRESULT
    @lpVtbl.value.get_registry.unsafe_as(Proc(IMLOperatorRegistry*, HRESULT)).call(ppoperatorregistry)
  end
end
struct LibWin32::ITensorNative
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_buffer(value : UInt8**, capacity : UInt32*) : HRESULT
    @lpVtbl.value.get_buffer.unsafe_as(Proc(UInt8**, UInt32*, HRESULT)).call(value, capacity)
  end
  def get_d3_d12_resource(result : ID3D12Resource*) : HRESULT
    @lpVtbl.value.get_d3_d12_resource.unsafe_as(Proc(ID3D12Resource*, HRESULT)).call(result)
  end
end
struct LibWin32::ITensorStaticsNative
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_from_d3_d12_resource(value : ID3D12Resource, shape : Int64*, shapecount : Int32, result : IUnknown*) : HRESULT
    @lpVtbl.value.create_from_d3_d12_resource.unsafe_as(Proc(ID3D12Resource, Int64*, Int32, IUnknown*, HRESULT)).call(value, shape, shapecount, result)
  end
end
struct LibWin32::ILearningModelDeviceFactoryNative
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_from_d3_d12_command_queue(value : ID3D12CommandQueue, result : IUnknown*) : HRESULT
    @lpVtbl.value.create_from_d3_d12_command_queue.unsafe_as(Proc(ID3D12CommandQueue, IUnknown*, HRESULT)).call(value, result)
  end
end
struct LibWin32::ILearningModelSessionOptionsNative
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_intra_op_num_threads_override(intraopnumthreads : UInt32) : HRESULT
    @lpVtbl.value.set_intra_op_num_threads_override.unsafe_as(Proc(UInt32, HRESULT)).call(intraopnumthreads)
  end
end
