require "../foundation.cr"
require "../system/com.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
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

  struct INotificationActivationCallback
    lpVtbl : INotificationActivationCallbackVTbl*
  end

end
