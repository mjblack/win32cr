require "./../../system/win_rt.cr"
require "./../../foundation.cr"

module Win32cr::UI::Input::Radial


  @[Extern]
  record IRadialControllerInteropVtbl,
    query_interface : Proc(IRadialControllerInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRadialControllerInterop*, UInt32),
    release : Proc(IRadialControllerInterop*, UInt32),
    get_iids : Proc(IRadialControllerInterop*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_runtime_class_name : Proc(IRadialControllerInterop*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    get_trust_level : Proc(IRadialControllerInterop*, Win32cr::System::WinRT::TrustLevel*, Win32cr::Foundation::HRESULT),
    create_for_window : Proc(IRadialControllerInterop*, Win32cr::Foundation::HWND, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("1b0535c9-57ad-45c1-9d79-ad5c34360513")]
  record IRadialControllerInterop, lpVtbl : IRadialControllerInteropVtbl* do
    GUID = LibC::GUID.new(0x1b0535c9_u32, 0x57ad_u16, 0x45c1_u16, StaticArray[0x9d_u8, 0x79_u8, 0xad_u8, 0x5c_u8, 0x34_u8, 0x36_u8, 0x5_u8, 0x13_u8])
    def query_interface(this : IRadialControllerInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRadialControllerInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRadialControllerInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_iids(this : IRadialControllerInterop*, iidCount : UInt32*, iids : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iids.call(this, iidCount, iids)
    end
    def get_runtime_class_name(this : IRadialControllerInterop*, className : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_class_name.call(this, className)
    end
    def get_trust_level(this : IRadialControllerInterop*, trustLevel : Win32cr::System::WinRT::TrustLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trust_level.call(this, trustLevel)
    end
    def create_for_window(this : IRadialControllerInterop*, hwnd : Win32cr::Foundation::HWND, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_for_window.call(this, hwnd, riid, ppv)
    end

  end

  @[Extern]
  record IRadialControllerConfigurationInteropVtbl,
    query_interface : Proc(IRadialControllerConfigurationInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRadialControllerConfigurationInterop*, UInt32),
    release : Proc(IRadialControllerConfigurationInterop*, UInt32),
    get_iids : Proc(IRadialControllerConfigurationInterop*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_runtime_class_name : Proc(IRadialControllerConfigurationInterop*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    get_trust_level : Proc(IRadialControllerConfigurationInterop*, Win32cr::System::WinRT::TrustLevel*, Win32cr::Foundation::HRESULT),
    get_for_window : Proc(IRadialControllerConfigurationInterop*, Win32cr::Foundation::HWND, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("787cdaac-3186-476d-87e4-b9374a7b9970")]
  record IRadialControllerConfigurationInterop, lpVtbl : IRadialControllerConfigurationInteropVtbl* do
    GUID = LibC::GUID.new(0x787cdaac_u32, 0x3186_u16, 0x476d_u16, StaticArray[0x87_u8, 0xe4_u8, 0xb9_u8, 0x37_u8, 0x4a_u8, 0x7b_u8, 0x99_u8, 0x70_u8])
    def query_interface(this : IRadialControllerConfigurationInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRadialControllerConfigurationInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRadialControllerConfigurationInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_iids(this : IRadialControllerConfigurationInterop*, iidCount : UInt32*, iids : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iids.call(this, iidCount, iids)
    end
    def get_runtime_class_name(this : IRadialControllerConfigurationInterop*, className : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_class_name.call(this, className)
    end
    def get_trust_level(this : IRadialControllerConfigurationInterop*, trustLevel : Win32cr::System::WinRT::TrustLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trust_level.call(this, trustLevel)
    end
    def get_for_window(this : IRadialControllerConfigurationInterop*, hwnd : Win32cr::Foundation::HWND, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_for_window.call(this, hwnd, riid, ppv)
    end

  end

  @[Extern]
  record IRadialControllerIndependentInputSourceInteropVtbl,
    query_interface : Proc(IRadialControllerIndependentInputSourceInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRadialControllerIndependentInputSourceInterop*, UInt32),
    release : Proc(IRadialControllerIndependentInputSourceInterop*, UInt32),
    get_iids : Proc(IRadialControllerIndependentInputSourceInterop*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_runtime_class_name : Proc(IRadialControllerIndependentInputSourceInterop*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    get_trust_level : Proc(IRadialControllerIndependentInputSourceInterop*, Win32cr::System::WinRT::TrustLevel*, Win32cr::Foundation::HRESULT),
    create_for_window : Proc(IRadialControllerIndependentInputSourceInterop*, Win32cr::Foundation::HWND, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("3d577eff-4cee-11e6-b535-001bdc06ab3b")]
  record IRadialControllerIndependentInputSourceInterop, lpVtbl : IRadialControllerIndependentInputSourceInteropVtbl* do
    GUID = LibC::GUID.new(0x3d577eff_u32, 0x4cee_u16, 0x11e6_u16, StaticArray[0xb5_u8, 0x35_u8, 0x0_u8, 0x1b_u8, 0xdc_u8, 0x6_u8, 0xab_u8, 0x3b_u8])
    def query_interface(this : IRadialControllerIndependentInputSourceInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRadialControllerIndependentInputSourceInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRadialControllerIndependentInputSourceInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_iids(this : IRadialControllerIndependentInputSourceInterop*, iidCount : UInt32*, iids : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iids.call(this, iidCount, iids)
    end
    def get_runtime_class_name(this : IRadialControllerIndependentInputSourceInterop*, className : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_class_name.call(this, className)
    end
    def get_trust_level(this : IRadialControllerIndependentInputSourceInterop*, trustLevel : Win32cr::System::WinRT::TrustLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trust_level.call(this, trustLevel)
    end
    def create_for_window(this : IRadialControllerIndependentInputSourceInterop*, hwnd : Win32cr::Foundation::HWND, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_for_window.call(this, hwnd, riid, ppv)
    end

  end

end