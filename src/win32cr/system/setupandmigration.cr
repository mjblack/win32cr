require "../foundation.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
lib LibWin32
  alias OOBE_COMPLETED_CALLBACK = Proc(Void*, Void)


  # Params # isoobecomplete : LibC::BOOL* [In]
  fun OOBEComplete(isoobecomplete : LibC::BOOL*) : LibC::BOOL

  # Params # oobecompletedcallback : OOBE_COMPLETED_CALLBACK [In],callbackcontext : Void* [In],waithandle : Void** [In]
  fun RegisterWaitUntilOOBECompleted(oobecompletedcallback : OOBE_COMPLETED_CALLBACK, callbackcontext : Void*, waithandle : Void**) : LibC::BOOL

  # Params # waithandle : Void* [In]
  fun UnregisterWaitUntilOOBECompleted(waithandle : Void*) : LibC::BOOL
end
