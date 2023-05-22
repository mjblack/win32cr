require "../../system/winrt.cr"
require "../../foundation.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
lib LibWin32

  struct IRadialControllerInteropVTbl
    query_interface : Proc(IRadialControllerInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRadialControllerInterop*, UInt32)
    release : Proc(IRadialControllerInterop*, UInt32)
    get_iids : Proc(IRadialControllerInterop*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(IRadialControllerInterop*, HSTRING*, HRESULT)
    get_trust_level : Proc(IRadialControllerInterop*, TrustLevel*, HRESULT)
    create_for_window : Proc(IRadialControllerInterop*, LibC::HANDLE, Guid*, Void**, HRESULT)
  end

  struct IRadialControllerInterop
    lpVtbl : IRadialControllerInteropVTbl*
  end

  struct IRadialControllerConfigurationInteropVTbl
    query_interface : Proc(IRadialControllerConfigurationInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRadialControllerConfigurationInterop*, UInt32)
    release : Proc(IRadialControllerConfigurationInterop*, UInt32)
    get_iids : Proc(IRadialControllerConfigurationInterop*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(IRadialControllerConfigurationInterop*, HSTRING*, HRESULT)
    get_trust_level : Proc(IRadialControllerConfigurationInterop*, TrustLevel*, HRESULT)
    get_for_window : Proc(IRadialControllerConfigurationInterop*, LibC::HANDLE, Guid*, Void**, HRESULT)
  end

  struct IRadialControllerConfigurationInterop
    lpVtbl : IRadialControllerConfigurationInteropVTbl*
  end

  struct IRadialControllerIndependentInputSourceInteropVTbl
    query_interface : Proc(IRadialControllerIndependentInputSourceInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRadialControllerIndependentInputSourceInterop*, UInt32)
    release : Proc(IRadialControllerIndependentInputSourceInterop*, UInt32)
    get_iids : Proc(IRadialControllerIndependentInputSourceInterop*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(IRadialControllerIndependentInputSourceInterop*, HSTRING*, HRESULT)
    get_trust_level : Proc(IRadialControllerIndependentInputSourceInterop*, TrustLevel*, HRESULT)
    create_for_window : Proc(IRadialControllerIndependentInputSourceInterop*, LibC::HANDLE, Guid*, Void**, HRESULT)
  end

  struct IRadialControllerIndependentInputSourceInterop
    lpVtbl : IRadialControllerIndependentInputSourceInteropVTbl*
  end

end
