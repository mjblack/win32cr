require "./../foundation.cr"
require "./../system/com.cr"

module Win32cr::UI::Notifications


  @[Extern]
  record NOTIFICATION_USER_INPUT_DATA,
    key : Win32cr::Foundation::PWSTR,
    value : Win32cr::Foundation::PWSTR

  @[Extern]
  record INotificationActivationCallbackVtbl,
    query_interface : Proc(INotificationActivationCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INotificationActivationCallback*, UInt32),
    release : Proc(INotificationActivationCallback*, UInt32),
    activate : Proc(INotificationActivationCallback*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::UI::Notifications::NOTIFICATION_USER_INPUT_DATA*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("53e31837-6600-4a81-9395-75cffe746f94")]
  record INotificationActivationCallback, lpVtbl : INotificationActivationCallbackVtbl* do
    GUID = LibC::GUID.new(0x53e31837_u32, 0x6600_u16, 0x4a81_u16, StaticArray[0x93_u8, 0x95_u8, 0x75_u8, 0xcf_u8, 0xfe_u8, 0x74_u8, 0x6f_u8, 0x94_u8])
    def query_interface(this : INotificationActivationCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INotificationActivationCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INotificationActivationCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def activate(this : INotificationActivationCallback*, appUserModelId : Win32cr::Foundation::PWSTR, invokedArgs : Win32cr::Foundation::PWSTR, data : Win32cr::UI::Notifications::NOTIFICATION_USER_INPUT_DATA*, count : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.activate.call(this, appUserModelId, invokedArgs, data, count)
    end

  end

end