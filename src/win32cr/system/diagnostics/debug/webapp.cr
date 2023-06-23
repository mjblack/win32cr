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

  IWebApplicationScriptEvents_GUID = "7c3f6998-1567-4bba-b52b-48d32141d613"
  IID_IWebApplicationScriptEvents = LibC::GUID.new(0x7c3f6998_u32, 0x1567_u16, 0x4bba_u16, StaticArray[0xb5_u8, 0x2b_u8, 0x48_u8, 0xd3_u8, 0x21_u8, 0x41_u8, 0xd6_u8, 0x13_u8])
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

  IWebApplicationNavigationEvents_GUID = "c22615d2-d318-4da2-8422-1fcaf77b10e4"
  IID_IWebApplicationNavigationEvents = LibC::GUID.new(0xc22615d2_u32, 0xd318_u16, 0x4da2_u16, StaticArray[0x84_u8, 0x22_u8, 0x1f_u8, 0xca_u8, 0xf7_u8, 0x7b_u8, 0x10_u8, 0xe4_u8])
  struct IWebApplicationNavigationEvents
    lpVtbl : IWebApplicationNavigationEventsVTbl*
  end

  struct IWebApplicationUIEventsVTbl
    query_interface : Proc(IWebApplicationUIEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWebApplicationUIEvents*, UInt32)
    release : Proc(IWebApplicationUIEvents*, UInt32)
    security_problem : Proc(IWebApplicationUIEvents*, UInt32, HRESULT*, HRESULT)
  end

  IWebApplicationUIEvents_GUID = "5b2b3f99-328c-41d5-a6f7-7483ed8e71dd"
  IID_IWebApplicationUIEvents = LibC::GUID.new(0x5b2b3f99_u32, 0x328c_u16, 0x41d5_u16, StaticArray[0xa6_u8, 0xf7_u8, 0x74_u8, 0x83_u8, 0xed_u8, 0x8e_u8, 0x71_u8, 0xdd_u8])
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

  IWebApplicationUpdateEvents_GUID = "3e59e6b7-c652-4daf-ad5e-16feb350cde3"
  IID_IWebApplicationUpdateEvents = LibC::GUID.new(0x3e59e6b7_u32, 0xc652_u16, 0x4daf_u16, StaticArray[0xad_u8, 0x5e_u8, 0x16_u8, 0xfe_u8, 0xb3_u8, 0x50_u8, 0xcd_u8, 0xe3_u8])
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

  IWebApplicationHost_GUID = "cecbd2c3-a3a5-4749-9681-20e9161c6794"
  IID_IWebApplicationHost = LibC::GUID.new(0xcecbd2c3_u32, 0xa3a5_u16, 0x4749_u16, StaticArray[0x96_u8, 0x81_u8, 0x20_u8, 0xe9_u8, 0x16_u8, 0x1c_u8, 0x67_u8, 0x94_u8])
  struct IWebApplicationHost
    lpVtbl : IWebApplicationHostVTbl*
  end

  struct IWebApplicationActivationVTbl
    query_interface : Proc(IWebApplicationActivation*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWebApplicationActivation*, UInt32)
    release : Proc(IWebApplicationActivation*, UInt32)
    cancel_pending_activation : Proc(IWebApplicationActivation*, HRESULT)
  end

  IWebApplicationActivation_GUID = "bcdcd0de-330e-481b-b843-4898a6a8ebac"
  IID_IWebApplicationActivation = LibC::GUID.new(0xbcdcd0de_u32, 0x330e_u16, 0x481b_u16, StaticArray[0xb8_u8, 0x43_u8, 0x48_u8, 0x98_u8, 0xa6_u8, 0xa8_u8, 0xeb_u8, 0xac_u8])
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

  IWebApplicationAuthoringMode_GUID = "720aea93-1964-4db0-b005-29eb9e2b18a9"
  IID_IWebApplicationAuthoringMode = LibC::GUID.new(0x720aea93_u32, 0x1964_u16, 0x4db0_u16, StaticArray[0xb0_u8, 0x5_u8, 0x29_u8, 0xeb_u8, 0x9e_u8, 0x2b_u8, 0x18_u8, 0xa9_u8])
  struct IWebApplicationAuthoringMode
    lpVtbl : IWebApplicationAuthoringModeVTbl*
  end

end
struct LibWin32::IWebApplicationScriptEvents
  def query_interface(this : IWebApplicationScriptEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWebApplicationScriptEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWebApplicationScriptEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def before_script_execute(this : IWebApplicationScriptEvents*, htmlwindow : IHTMLWindow2) : HRESULT
    @lpVtbl.value.before_script_execute.call(this, htmlwindow)
  end
  def script_error(this : IWebApplicationScriptEvents*, htmlwindow : IHTMLWindow2, scripterror : IActiveScriptError, url : LibC::LPWSTR, errorhandled : LibC::BOOL) : HRESULT
    @lpVtbl.value.script_error.call(this, htmlwindow, scripterror, url, errorhandled)
  end
end
struct LibWin32::IWebApplicationNavigationEvents
  def query_interface(this : IWebApplicationNavigationEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWebApplicationNavigationEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWebApplicationNavigationEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def before_navigate(this : IWebApplicationNavigationEvents*, htmlwindow : IHTMLWindow2, url : LibC::LPWSTR, navigationflags : UInt32, targetframename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.before_navigate.call(this, htmlwindow, url, navigationflags, targetframename)
  end
  def navigate_complete(this : IWebApplicationNavigationEvents*, htmlwindow : IHTMLWindow2, url : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.navigate_complete.call(this, htmlwindow, url)
  end
  def navigate_error(this : IWebApplicationNavigationEvents*, htmlwindow : IHTMLWindow2, url : LibC::LPWSTR, targetframename : LibC::LPWSTR, statuscode : UInt32) : HRESULT
    @lpVtbl.value.navigate_error.call(this, htmlwindow, url, targetframename, statuscode)
  end
  def document_complete(this : IWebApplicationNavigationEvents*, htmlwindow : IHTMLWindow2, url : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.document_complete.call(this, htmlwindow, url)
  end
  def download_begin(this : IWebApplicationNavigationEvents*) : HRESULT
    @lpVtbl.value.download_begin.call(this)
  end
  def download_complete(this : IWebApplicationNavigationEvents*) : HRESULT
    @lpVtbl.value.download_complete.call(this)
  end
end
struct LibWin32::IWebApplicationUIEvents
  def query_interface(this : IWebApplicationUIEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWebApplicationUIEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWebApplicationUIEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def security_problem(this : IWebApplicationUIEvents*, securityproblem : UInt32, result : HRESULT*) : HRESULT
    @lpVtbl.value.security_problem.call(this, securityproblem, result)
  end
end
struct LibWin32::IWebApplicationUpdateEvents
  def query_interface(this : IWebApplicationUpdateEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWebApplicationUpdateEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWebApplicationUpdateEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_paint(this : IWebApplicationUpdateEvents*) : HRESULT
    @lpVtbl.value.on_paint.call(this)
  end
  def on_css_changed(this : IWebApplicationUpdateEvents*) : HRESULT
    @lpVtbl.value.on_css_changed.call(this)
  end
end
struct LibWin32::IWebApplicationHost
  def query_interface(this : IWebApplicationHost*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWebApplicationHost*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWebApplicationHost*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_hwnd(this : IWebApplicationHost*, hwnd : HANDLE*) : HRESULT
    @lpVtbl.value.get_hwnd.call(this, hwnd)
  end
  def get_document(this : IWebApplicationHost*, htmldocument : IHTMLDocument2*) : HRESULT
    @lpVtbl.value.get_document.call(this, htmldocument)
  end
  def refresh(this : IWebApplicationHost*) : HRESULT
    @lpVtbl.value.refresh.call(this)
  end
  def advise(this : IWebApplicationHost*, interfaceid : Guid*, callback : IUnknown, cookie : UInt32*) : HRESULT
    @lpVtbl.value.advise.call(this, interfaceid, callback, cookie)
  end
  def unadvise(this : IWebApplicationHost*, cookie : UInt32) : HRESULT
    @lpVtbl.value.unadvise.call(this, cookie)
  end
end
struct LibWin32::IWebApplicationActivation
  def query_interface(this : IWebApplicationActivation*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWebApplicationActivation*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWebApplicationActivation*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def cancel_pending_activation(this : IWebApplicationActivation*) : HRESULT
    @lpVtbl.value.cancel_pending_activation.call(this)
  end
end
struct LibWin32::IWebApplicationAuthoringMode
  def query_interface(this : IWebApplicationAuthoringMode*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWebApplicationAuthoringMode*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWebApplicationAuthoringMode*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def query_service(this : IWebApplicationAuthoringMode*, guidservice : Guid*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_service.call(this, guidservice, riid, ppvobject)
  end
  def get_authoring_client_binary(this : IWebApplicationAuthoringMode*, designmodedllpath : UInt8**) : HRESULT
    @lpVtbl.value.get_authoring_client_binary.call(this, designmodedllpath)
  end
end
