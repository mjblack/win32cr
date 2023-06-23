require "../foundation.cr"
require "../system/com.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32
  struct NOTIFICATION_USER_INPUT_DATA
    key : LibC::LPWSTR
    value : LibC::LPWSTR
  end


  struct INotificationActivationCallbackVTbl
    query_interface : Proc(INotificationActivationCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(INotificationActivationCallback*, UInt32)
    release : Proc(INotificationActivationCallback*, UInt32)
    activate : Proc(INotificationActivationCallback*, LibC::LPWSTR, LibC::LPWSTR, NOTIFICATION_USER_INPUT_DATA*, UInt32, HRESULT)
  end

  INotificationActivationCallback_GUID = "53e31837-6600-4a81-9395-75cffe746f94"
  IID_INotificationActivationCallback = LibC::GUID.new(0x53e31837_u32, 0x6600_u16, 0x4a81_u16, StaticArray[0x93_u8, 0x95_u8, 0x75_u8, 0xcf_u8, 0xfe_u8, 0x74_u8, 0x6f_u8, 0x94_u8])
  struct INotificationActivationCallback
    lpVtbl : INotificationActivationCallbackVTbl*
  end

end
struct LibWin32::INotificationActivationCallback
  def query_interface(this : INotificationActivationCallback*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INotificationActivationCallback*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INotificationActivationCallback*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def activate(this : INotificationActivationCallback*, appusermodelid : LibC::LPWSTR, invokedargs : LibC::LPWSTR, data : NOTIFICATION_USER_INPUT_DATA*, count : UInt32) : HRESULT
    @lpVtbl.value.activate.call(this, appusermodelid, invokedargs, data, count)
  end
end
