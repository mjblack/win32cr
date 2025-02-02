require "./../win_rt.cr"
require "./../../foundation.cr"

module Win32cr::System::WinRT::CoreInputView
  extend self


  @[Extern]
  record ICoreFrameworkInputViewInteropVtbl,
    query_interface : Proc(ICoreFrameworkInputViewInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICoreFrameworkInputViewInterop*, UInt32),
    release : Proc(ICoreFrameworkInputViewInterop*, UInt32),
    get_iids : Proc(ICoreFrameworkInputViewInterop*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_runtime_class_name : Proc(ICoreFrameworkInputViewInterop*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    get_trust_level : Proc(ICoreFrameworkInputViewInterop*, Win32cr::System::WinRT::TrustLevel*, Win32cr::Foundation::HRESULT),
    get_for_window : Proc(ICoreFrameworkInputViewInterop*, Win32cr::Foundation::HWND, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICoreFrameworkInputViewInterop, lpVtbl : ICoreFrameworkInputViewInteropVtbl* do
    GUID = LibC::GUID.new(0xe3da342_u32, 0xb11c_u16, 0x484b_u16, StaticArray[0x9c_u8, 0x1c_u8, 0xbe_u8, 0xd_u8, 0x61_u8, 0xc2_u8, 0xf6_u8, 0xc5_u8])
    def query_interface(this : ICoreFrameworkInputViewInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICoreFrameworkInputViewInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICoreFrameworkInputViewInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_iids(this : ICoreFrameworkInputViewInterop*, iidCount : UInt32*, iids : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iids.call(this, iidCount, iids)
    end
    def get_runtime_class_name(this : ICoreFrameworkInputViewInterop*, className : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_class_name.call(this, className)
    end
    def get_trust_level(this : ICoreFrameworkInputViewInterop*, trustLevel : Win32cr::System::WinRT::TrustLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trust_level.call(this, trustLevel)
    end
    def get_for_window(this : ICoreFrameworkInputViewInterop*, appWindow : Win32cr::Foundation::HWND, riid : LibC::GUID*, coreFrameworkInputView : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_for_window.call(this, appWindow, riid, coreFrameworkInputView)
    end

  end

end