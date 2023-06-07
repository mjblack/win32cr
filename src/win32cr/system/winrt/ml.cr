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
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
{% else %}
{% end %}
lib LibWin32

  struct ILearningModelOperatorProviderNativeVTbl
    query_interface : Proc(ILearningModelOperatorProviderNative*, Guid*, Void**, HRESULT)
    add_ref : Proc(ILearningModelOperatorProviderNative*, UInt32)
    release : Proc(ILearningModelOperatorProviderNative*, UInt32)
    get_registry : Proc(ILearningModelOperatorProviderNative*, IMLOperatorRegistry*, HRESULT)
  end

  struct ILearningModelOperatorProviderNative
    lpVtbl : ILearningModelOperatorProviderNativeVTbl*
  end

  struct ITensorNativeVTbl
    query_interface : Proc(ITensorNative*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITensorNative*, UInt32)
    release : Proc(ITensorNative*, UInt32)
    get_buffer : Proc(ITensorNative*, UInt8**, UInt32*, HRESULT)
    get_d3_d12_resource : Proc(ITensorNative*, ID3D12Resource*, HRESULT)
  end

  struct ITensorNative
    lpVtbl : ITensorNativeVTbl*
  end

  struct ITensorStaticsNativeVTbl
    query_interface : Proc(ITensorStaticsNative*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITensorStaticsNative*, UInt32)
    release : Proc(ITensorStaticsNative*, UInt32)
    create_from_d3_d12_resource : Proc(ITensorStaticsNative*, ID3D12Resource, Int64*, Int32, IUnknown*, HRESULT)
  end

  struct ITensorStaticsNative
    lpVtbl : ITensorStaticsNativeVTbl*
  end

  struct ILearningModelDeviceFactoryNativeVTbl
    query_interface : Proc(ILearningModelDeviceFactoryNative*, Guid*, Void**, HRESULT)
    add_ref : Proc(ILearningModelDeviceFactoryNative*, UInt32)
    release : Proc(ILearningModelDeviceFactoryNative*, UInt32)
    create_from_d3_d12_command_queue : Proc(ILearningModelDeviceFactoryNative*, ID3D12CommandQueue, IUnknown*, HRESULT)
  end

  struct ILearningModelDeviceFactoryNative
    lpVtbl : ILearningModelDeviceFactoryNativeVTbl*
  end

  struct ILearningModelSessionOptionsNativeVTbl
    query_interface : Proc(ILearningModelSessionOptionsNative*, Guid*, Void**, HRESULT)
    add_ref : Proc(ILearningModelSessionOptionsNative*, UInt32)
    release : Proc(ILearningModelSessionOptionsNative*, UInt32)
    set_intra_op_num_threads_override : Proc(ILearningModelSessionOptionsNative*, UInt32, HRESULT)
  end

  struct ILearningModelSessionOptionsNative
    lpVtbl : ILearningModelSessionOptionsNativeVTbl*
  end

end
