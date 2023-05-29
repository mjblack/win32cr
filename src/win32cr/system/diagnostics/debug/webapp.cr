require "../../../system/com.cr"
require "../../../foundation.cr"
require "../../../web/mshtml.cr"
require "../../../system/diagnostics/debug.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
lib LibWin32
  alias RegisterAuthoringClientFunctionType = Proc(IWebApplicationAuthoringMode, IWebApplicationHost, HRESULT)
  alias UnregisterAuthoringClientFunctionType = Proc(IWebApplicationHost, HRESULT)


  struct IWebApplicationScriptEventsVTbl
    query_interface : Proc(IWebApplicationScriptEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWebApplicationScriptEvents*, UInt32)
    release : Proc(IWebApplicationScriptEvents*, UInt32)
    before_script_execute : Proc(IWebApplicationScriptEvents*, IHTMLWindow2, HRESULT)
    script_error : Proc(IWebApplicationScriptEvents*, IHTMLWindow2, IActiveScriptError, LibC::LPWSTR, LibC::BOOL, HRESULT)
  end

  struct IWebApplicationScriptEvents
    lpVtbl : IWebApplicationScriptEventsVTbl*
  end

  struct IWebApplicationNavigationEventsVTbl
    query_interface : Proc(IWebApplicationNavigationEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWebApplicationNavigationEvents*, UInt32)
    release : Proc(IWebApplicationNavigationEvents*, UInt32)
    before_navigate : Proc(IWebApplicationNavigationEvents*, IHTMLWindow2, LibC::LPWSTR, UInt32, LibC::LPWSTR, HRESULT)
    navigate_complete : Proc(IWebApplicationNavigationEvents*, IHTMLWindow2, LibC::LPWSTR, HRESULT)
    navigate_error : Proc(IWebApplicationNavigationEvents*, IHTMLWindow2, LibC::LPWSTR, LibC::LPWSTR, UInt32, HRESULT)
    document_complete : Proc(IWebApplicationNavigationEvents*, IHTMLWindow2, LibC::LPWSTR, HRESULT)
    download_begin : Proc(IWebApplicationNavigationEvents*, HRESULT)
    download_complete : Proc(IWebApplicationNavigationEvents*, HRESULT)
  end

  struct IWebApplicationNavigationEvents
    lpVtbl : IWebApplicationNavigationEventsVTbl*
  end

  struct IWebApplicationUIEventsVTbl
    query_interface : Proc(IWebApplicationUIEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWebApplicationUIEvents*, UInt32)
    release : Proc(IWebApplicationUIEvents*, UInt32)
    security_problem : Proc(IWebApplicationUIEvents*, UInt32, HRESULT*, HRESULT)
  end

  struct IWebApplicationUIEvents
    lpVtbl : IWebApplicationUIEventsVTbl*
  end

  struct IWebApplicationUpdateEventsVTbl
    query_interface : Proc(IWebApplicationUpdateEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWebApplicationUpdateEvents*, UInt32)
    release : Proc(IWebApplicationUpdateEvents*, UInt32)
    on_paint : Proc(IWebApplicationUpdateEvents*, HRESULT)
    on_css_changed : Proc(IWebApplicationUpdateEvents*, HRESULT)
  end

  struct IWebApplicationUpdateEvents
    lpVtbl : IWebApplicationUpdateEventsVTbl*
  end

  struct IWebApplicationHostVTbl
    query_interface : Proc(IWebApplicationHost*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWebApplicationHost*, UInt32)
    release : Proc(IWebApplicationHost*, UInt32)
    get_hwnd : Proc(IWebApplicationHost*, HANDLE*, HRESULT)
    get_document : Proc(IWebApplicationHost*, IHTMLDocument2*, HRESULT)
    refresh : Proc(IWebApplicationHost*, HRESULT)
    advise : Proc(IWebApplicationHost*, Guid*, IUnknown, UInt32*, HRESULT)
    unadvise : Proc(IWebApplicationHost*, UInt32, HRESULT)
  end

  struct IWebApplicationHost
    lpVtbl : IWebApplicationHostVTbl*
  end

  struct IWebApplicationActivationVTbl
    query_interface : Proc(IWebApplicationActivation*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWebApplicationActivation*, UInt32)
    release : Proc(IWebApplicationActivation*, UInt32)
    cancel_pending_activation : Proc(IWebApplicationActivation*, HRESULT)
  end

  struct IWebApplicationActivation
    lpVtbl : IWebApplicationActivationVTbl*
  end

  struct IWebApplicationAuthoringModeVTbl
    query_interface : Proc(IWebApplicationAuthoringMode*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWebApplicationAuthoringMode*, UInt32)
    release : Proc(IWebApplicationAuthoringMode*, UInt32)
    query_service : Proc(IWebApplicationAuthoringMode*, Guid*, Guid*, Void**, HRESULT)
    get_authoring_client_binary : Proc(IWebApplicationAuthoringMode*, UInt8*, HRESULT)
  end

  struct IWebApplicationAuthoringMode
    lpVtbl : IWebApplicationAuthoringModeVTbl*
  end

end
