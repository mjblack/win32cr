require "../../../system/com.cr"
require "../../../foundation.cr"
require "../../../web/mshtml.cr"
require "../../../system/diagnostics/debug.cr"

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
  alias RegisterAuthoringClientFunctionType = Proc(IWebApplicationAuthoringMode, IWebApplicationHost, HRESULT)
  alias UnregisterAuthoringClientFunctionType = Proc(IWebApplicationHost, HRESULT)


  struct IWebApplicationScriptEventsVTbl
    query_interface : Proc(IWebApplicationScriptEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWebApplicationScriptEvents*, UInt32)
    release : Proc(IWebApplicationScriptEvents*, UInt32)
    before_script_execute : Proc(IWebApplicationScriptEvents*, IHTMLWindow2, HRESULT)
    script_error : Proc(IWebApplicationScriptEvents*, IHTMLWindow2, IActiveScriptError, LibC::LPWSTR, LibC::BOOL, HRESULT)
  end

  IWebApplicationScriptEvents_GUID = LibC::GUID.new("7c3f6998-1567-4bba-b52b-48d32141d613")
  CLSID_IWebApplicationScriptEvents = "7c3f6998-1567-4bba-b52b-48d32141d613"
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

  IWebApplicationNavigationEvents_GUID = LibC::GUID.new("c22615d2-d318-4da2-8422-1fcaf77b10e4")
  CLSID_IWebApplicationNavigationEvents = "c22615d2-d318-4da2-8422-1fcaf77b10e4"
  struct IWebApplicationNavigationEvents
    lpVtbl : IWebApplicationNavigationEventsVTbl*
  end

  struct IWebApplicationUIEventsVTbl
    query_interface : Proc(IWebApplicationUIEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWebApplicationUIEvents*, UInt32)
    release : Proc(IWebApplicationUIEvents*, UInt32)
    security_problem : Proc(IWebApplicationUIEvents*, UInt32, HRESULT*, HRESULT)
  end

  IWebApplicationUIEvents_GUID = LibC::GUID.new("5b2b3f99-328c-41d5-a6f7-7483ed8e71dd")
  CLSID_IWebApplicationUIEvents = "5b2b3f99-328c-41d5-a6f7-7483ed8e71dd"
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

  IWebApplicationUpdateEvents_GUID = LibC::GUID.new("3e59e6b7-c652-4daf-ad5e-16feb350cde3")
  CLSID_IWebApplicationUpdateEvents = "3e59e6b7-c652-4daf-ad5e-16feb350cde3"
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

  IWebApplicationHost_GUID = LibC::GUID.new("cecbd2c3-a3a5-4749-9681-20e9161c6794")
  CLSID_IWebApplicationHost = "cecbd2c3-a3a5-4749-9681-20e9161c6794"
  struct IWebApplicationHost
    lpVtbl : IWebApplicationHostVTbl*
  end

  struct IWebApplicationActivationVTbl
    query_interface : Proc(IWebApplicationActivation*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWebApplicationActivation*, UInt32)
    release : Proc(IWebApplicationActivation*, UInt32)
    cancel_pending_activation : Proc(IWebApplicationActivation*, HRESULT)
  end

  IWebApplicationActivation_GUID = LibC::GUID.new("bcdcd0de-330e-481b-b843-4898a6a8ebac")
  CLSID_IWebApplicationActivation = "bcdcd0de-330e-481b-b843-4898a6a8ebac"
  struct IWebApplicationActivation
    lpVtbl : IWebApplicationActivationVTbl*
  end

  struct IWebApplicationAuthoringModeVTbl
    query_interface : Proc(IWebApplicationAuthoringMode*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWebApplicationAuthoringMode*, UInt32)
    release : Proc(IWebApplicationAuthoringMode*, UInt32)
    query_service : Proc(IWebApplicationAuthoringMode*, Guid*, Guid*, Void**, HRESULT)
    get_authoring_client_binary : Proc(IWebApplicationAuthoringMode*, UInt8**, HRESULT)
  end

  IWebApplicationAuthoringMode_GUID = LibC::GUID.new("720aea93-1964-4db0-b005-29eb9e2b18a9")
  CLSID_IWebApplicationAuthoringMode = "720aea93-1964-4db0-b005-29eb9e2b18a9"
  struct IWebApplicationAuthoringMode
    lpVtbl : IWebApplicationAuthoringModeVTbl*
  end

end
