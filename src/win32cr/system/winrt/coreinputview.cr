require "../../system/winrt.cr"
require "../../foundation.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
lib LibWin32

  struct ICoreFrameworkInputViewInteropVTbl
    query_interface : Proc(ICoreFrameworkInputViewInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICoreFrameworkInputViewInterop*, UInt32)
    release : Proc(ICoreFrameworkInputViewInterop*, UInt32)
    get_iids : Proc(ICoreFrameworkInputViewInterop*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(ICoreFrameworkInputViewInterop*, HSTRING*, HRESULT)
    get_trust_level : Proc(ICoreFrameworkInputViewInterop*, TrustLevel*, HRESULT)
    get_for_window : Proc(ICoreFrameworkInputViewInterop*, LibC::HANDLE, Guid*, Void**, HRESULT)
  end

  struct ICoreFrameworkInputViewInterop
    lpVtbl : ICoreFrameworkInputViewInteropVTbl*
  end

end
