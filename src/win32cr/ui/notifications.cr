require "../foundation.cr"
require "../system/com.cr"

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

  INotificationActivationCallback_GUID = LibC::GUID.new("53e31837-6600-4a81-9395-75cffe746f94")
  CLSID_INotificationActivationCallback = "53e31837-6600-4a81-9395-75cffe746f94"
  struct INotificationActivationCallback
    lpVtbl : INotificationActivationCallbackVTbl*
  end

end
