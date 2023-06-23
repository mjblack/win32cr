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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    before_script_execute : UInt64
    script_error : UInt64
  end

  IWebApplicationScriptEvents_GUID = "7c3f6998-1567-4bba-b52b-48d32141d613"
  IID_IWebApplicationScriptEvents = LibC::GUID.new(0x7c3f6998_u32, 0x1567_u16, 0x4bba_u16, StaticArray[0xb5_u8, 0x2b_u8, 0x48_u8, 0xd3_u8, 0x21_u8, 0x41_u8, 0xd6_u8, 0x13_u8])
  struct IWebApplicationScriptEvents
    lpVtbl : IWebApplicationScriptEventsVTbl*
  end

  struct IWebApplicationNavigationEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    before_navigate : UInt64
    navigate_complete : UInt64
    navigate_error : UInt64
    document_complete : UInt64
    download_begin : UInt64
    download_complete : UInt64
  end

  IWebApplicationNavigationEvents_GUID = "c22615d2-d318-4da2-8422-1fcaf77b10e4"
  IID_IWebApplicationNavigationEvents = LibC::GUID.new(0xc22615d2_u32, 0xd318_u16, 0x4da2_u16, StaticArray[0x84_u8, 0x22_u8, 0x1f_u8, 0xca_u8, 0xf7_u8, 0x7b_u8, 0x10_u8, 0xe4_u8])
  struct IWebApplicationNavigationEvents
    lpVtbl : IWebApplicationNavigationEventsVTbl*
  end

  struct IWebApplicationUIEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    security_problem : UInt64
  end

  IWebApplicationUIEvents_GUID = "5b2b3f99-328c-41d5-a6f7-7483ed8e71dd"
  IID_IWebApplicationUIEvents = LibC::GUID.new(0x5b2b3f99_u32, 0x328c_u16, 0x41d5_u16, StaticArray[0xa6_u8, 0xf7_u8, 0x74_u8, 0x83_u8, 0xed_u8, 0x8e_u8, 0x71_u8, 0xdd_u8])
  struct IWebApplicationUIEvents
    lpVtbl : IWebApplicationUIEventsVTbl*
  end

  struct IWebApplicationUpdateEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_paint : UInt64
    on_css_changed : UInt64
  end

  IWebApplicationUpdateEvents_GUID = "3e59e6b7-c652-4daf-ad5e-16feb350cde3"
  IID_IWebApplicationUpdateEvents = LibC::GUID.new(0x3e59e6b7_u32, 0xc652_u16, 0x4daf_u16, StaticArray[0xad_u8, 0x5e_u8, 0x16_u8, 0xfe_u8, 0xb3_u8, 0x50_u8, 0xcd_u8, 0xe3_u8])
  struct IWebApplicationUpdateEvents
    lpVtbl : IWebApplicationUpdateEventsVTbl*
  end

  struct IWebApplicationHostVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_hwnd : UInt64
    get_document : UInt64
    refresh : UInt64
    advise : UInt64
    unadvise : UInt64
  end

  IWebApplicationHost_GUID = "cecbd2c3-a3a5-4749-9681-20e9161c6794"
  IID_IWebApplicationHost = LibC::GUID.new(0xcecbd2c3_u32, 0xa3a5_u16, 0x4749_u16, StaticArray[0x96_u8, 0x81_u8, 0x20_u8, 0xe9_u8, 0x16_u8, 0x1c_u8, 0x67_u8, 0x94_u8])
  struct IWebApplicationHost
    lpVtbl : IWebApplicationHostVTbl*
  end

  struct IWebApplicationActivationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    cancel_pending_activation : UInt64
  end

  IWebApplicationActivation_GUID = "bcdcd0de-330e-481b-b843-4898a6a8ebac"
  IID_IWebApplicationActivation = LibC::GUID.new(0xbcdcd0de_u32, 0x330e_u16, 0x481b_u16, StaticArray[0xb8_u8, 0x43_u8, 0x48_u8, 0x98_u8, 0xa6_u8, 0xa8_u8, 0xeb_u8, 0xac_u8])
  struct IWebApplicationActivation
    lpVtbl : IWebApplicationActivationVTbl*
  end

  struct IWebApplicationAuthoringModeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    query_service : UInt64
    get_authoring_client_binary : UInt64
  end

  IWebApplicationAuthoringMode_GUID = "720aea93-1964-4db0-b005-29eb9e2b18a9"
  IID_IWebApplicationAuthoringMode = LibC::GUID.new(0x720aea93_u32, 0x1964_u16, 0x4db0_u16, StaticArray[0xb0_u8, 0x5_u8, 0x29_u8, 0xeb_u8, 0x9e_u8, 0x2b_u8, 0x18_u8, 0xa9_u8])
  struct IWebApplicationAuthoringMode
    lpVtbl : IWebApplicationAuthoringModeVTbl*
  end

end
struct LibWin32::IWebApplicationScriptEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def before_script_execute(htmlwindow : IHTMLWindow2) : HRESULT
    @lpVtbl.value.before_script_execute.unsafe_as(Proc(IHTMLWindow2, HRESULT)).call(htmlwindow)
  end
  def script_error(htmlwindow : IHTMLWindow2, scripterror : IActiveScriptError, url : LibC::LPWSTR, errorhandled : LibC::BOOL) : HRESULT
    @lpVtbl.value.script_error.unsafe_as(Proc(IHTMLWindow2, IActiveScriptError, LibC::LPWSTR, LibC::BOOL, HRESULT)).call(htmlwindow, scripterror, url, errorhandled)
  end
end
struct LibWin32::IWebApplicationNavigationEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def before_navigate(htmlwindow : IHTMLWindow2, url : LibC::LPWSTR, navigationflags : UInt32, targetframename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.before_navigate.unsafe_as(Proc(IHTMLWindow2, LibC::LPWSTR, UInt32, LibC::LPWSTR, HRESULT)).call(htmlwindow, url, navigationflags, targetframename)
  end
  def navigate_complete(htmlwindow : IHTMLWindow2, url : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.navigate_complete.unsafe_as(Proc(IHTMLWindow2, LibC::LPWSTR, HRESULT)).call(htmlwindow, url)
  end
  def navigate_error(htmlwindow : IHTMLWindow2, url : LibC::LPWSTR, targetframename : LibC::LPWSTR, statuscode : UInt32) : HRESULT
    @lpVtbl.value.navigate_error.unsafe_as(Proc(IHTMLWindow2, LibC::LPWSTR, LibC::LPWSTR, UInt32, HRESULT)).call(htmlwindow, url, targetframename, statuscode)
  end
  def document_complete(htmlwindow : IHTMLWindow2, url : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.document_complete.unsafe_as(Proc(IHTMLWindow2, LibC::LPWSTR, HRESULT)).call(htmlwindow, url)
  end
  def download_begin : HRESULT
    @lpVtbl.value.download_begin.unsafe_as(Proc(HRESULT)).call
  end
  def download_complete : HRESULT
    @lpVtbl.value.download_complete.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IWebApplicationUIEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def security_problem(securityproblem : UInt32, result : HRESULT*) : HRESULT
    @lpVtbl.value.security_problem.unsafe_as(Proc(UInt32, HRESULT*, HRESULT)).call(securityproblem, result)
  end
end
struct LibWin32::IWebApplicationUpdateEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_paint : HRESULT
    @lpVtbl.value.on_paint.unsafe_as(Proc(HRESULT)).call
  end
  def on_css_changed : HRESULT
    @lpVtbl.value.on_css_changed.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IWebApplicationHost
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_hwnd(hwnd : HANDLE*) : HRESULT
    @lpVtbl.value.get_hwnd.unsafe_as(Proc(HANDLE*, HRESULT)).call(hwnd)
  end
  def get_document(htmldocument : IHTMLDocument2*) : HRESULT
    @lpVtbl.value.get_document.unsafe_as(Proc(IHTMLDocument2*, HRESULT)).call(htmldocument)
  end
  def refresh : HRESULT
    @lpVtbl.value.refresh.unsafe_as(Proc(HRESULT)).call
  end
  def advise(interfaceid : Guid*, callback : IUnknown, cookie : UInt32*) : HRESULT
    @lpVtbl.value.advise.unsafe_as(Proc(Guid*, IUnknown, UInt32*, HRESULT)).call(interfaceid, callback, cookie)
  end
  def unadvise(cookie : UInt32) : HRESULT
    @lpVtbl.value.unadvise.unsafe_as(Proc(UInt32, HRESULT)).call(cookie)
  end
end
struct LibWin32::IWebApplicationActivation
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def cancel_pending_activation : HRESULT
    @lpVtbl.value.cancel_pending_activation.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IWebApplicationAuthoringMode
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def query_service(guidservice : Guid*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_service.unsafe_as(Proc(Guid*, Guid*, Void**, HRESULT)).call(guidservice, riid, ppvobject)
  end
  def get_authoring_client_binary(designmodedllpath : UInt8**) : HRESULT
    @lpVtbl.value.get_authoring_client_binary.unsafe_as(Proc(UInt8**, HRESULT)).call(designmodedllpath)
  end
end
