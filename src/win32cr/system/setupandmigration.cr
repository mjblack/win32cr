require "../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32
  alias OOBE_COMPLETED_CALLBACK = Proc(Void*, Void)


  # Params # isoobecomplete : LibC::BOOL* [In]
  fun OOBEComplete(isoobecomplete : LibC::BOOL*) : LibC::BOOL

  # Params # oobecompletedcallback : OOBE_COMPLETED_CALLBACK [In],callbackcontext : Void* [In],waithandle : Void** [In]
  fun RegisterWaitUntilOOBECompleted(oobecompletedcallback : OOBE_COMPLETED_CALLBACK, callbackcontext : Void*, waithandle : Void**) : LibC::BOOL

  # Params # waithandle : Void* [In]
  fun UnregisterWaitUntilOOBECompleted(waithandle : Void*) : LibC::BOOL
end