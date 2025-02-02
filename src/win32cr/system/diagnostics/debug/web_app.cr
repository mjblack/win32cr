require "./../../com.cr"
require "./../../../foundation.cr"
require "./../../../web/ms_html.cr"
require "./../debug.cr"

module Win32cr::System::Diagnostics::Debug::WebApp
  extend self
  alias RegisterAuthoringClientFunctionType = Proc(Void*, Void*, Win32cr::Foundation::HRESULT)

  alias UnregisterAuthoringClientFunctionType = Proc(Void*, Win32cr::Foundation::HRESULT)



  @[Extern]
  record IWebApplicationScriptEventsVtbl,
    query_interface : Proc(IWebApplicationScriptEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWebApplicationScriptEvents*, UInt32),
    release : Proc(IWebApplicationScriptEvents*, UInt32),
    before_script_execute : Proc(IWebApplicationScriptEvents*, Void*, Win32cr::Foundation::HRESULT),
    script_error : Proc(IWebApplicationScriptEvents*, Void*, Void*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWebApplicationScriptEvents, lpVtbl : IWebApplicationScriptEventsVtbl* do
    GUID = LibC::GUID.new(0x7c3f6998_u32, 0x1567_u16, 0x4bba_u16, StaticArray[0xb5_u8, 0x2b_u8, 0x48_u8, 0xd3_u8, 0x21_u8, 0x41_u8, 0xd6_u8, 0x13_u8])
    def query_interface(this : IWebApplicationScriptEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWebApplicationScriptEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWebApplicationScriptEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def before_script_execute(this : IWebApplicationScriptEvents*, htmlWindow : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.before_script_execute.call(this, htmlWindow)
    end
    def script_error(this : IWebApplicationScriptEvents*, htmlWindow : Void*, scriptError : Void*, url : Win32cr::Foundation::PWSTR, errorHandled : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.script_error.call(this, htmlWindow, scriptError, url, errorHandled)
    end

  end

  @[Extern]
  record IWebApplicationNavigationEventsVtbl,
    query_interface : Proc(IWebApplicationNavigationEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWebApplicationNavigationEvents*, UInt32),
    release : Proc(IWebApplicationNavigationEvents*, UInt32),
    before_navigate : Proc(IWebApplicationNavigationEvents*, Void*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    navigate_complete : Proc(IWebApplicationNavigationEvents*, Void*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    navigate_error : Proc(IWebApplicationNavigationEvents*, Void*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    document_complete : Proc(IWebApplicationNavigationEvents*, Void*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    download_begin : Proc(IWebApplicationNavigationEvents*, Win32cr::Foundation::HRESULT),
    download_complete : Proc(IWebApplicationNavigationEvents*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWebApplicationNavigationEvents, lpVtbl : IWebApplicationNavigationEventsVtbl* do
    GUID = LibC::GUID.new(0xc22615d2_u32, 0xd318_u16, 0x4da2_u16, StaticArray[0x84_u8, 0x22_u8, 0x1f_u8, 0xca_u8, 0xf7_u8, 0x7b_u8, 0x10_u8, 0xe4_u8])
    def query_interface(this : IWebApplicationNavigationEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWebApplicationNavigationEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWebApplicationNavigationEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def before_navigate(this : IWebApplicationNavigationEvents*, htmlWindow : Void*, url : Win32cr::Foundation::PWSTR, navigationFlags : UInt32, targetFrameName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.before_navigate.call(this, htmlWindow, url, navigationFlags, targetFrameName)
    end
    def navigate_complete(this : IWebApplicationNavigationEvents*, htmlWindow : Void*, url : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.navigate_complete.call(this, htmlWindow, url)
    end
    def navigate_error(this : IWebApplicationNavigationEvents*, htmlWindow : Void*, url : Win32cr::Foundation::PWSTR, targetFrameName : Win32cr::Foundation::PWSTR, statusCode : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.navigate_error.call(this, htmlWindow, url, targetFrameName, statusCode)
    end
    def document_complete(this : IWebApplicationNavigationEvents*, htmlWindow : Void*, url : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.document_complete.call(this, htmlWindow, url)
    end
    def download_begin(this : IWebApplicationNavigationEvents*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.download_begin.call(this)
    end
    def download_complete(this : IWebApplicationNavigationEvents*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.download_complete.call(this)
    end

  end

  @[Extern]
  record IWebApplicationUIEventsVtbl,
    query_interface : Proc(IWebApplicationUIEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWebApplicationUIEvents*, UInt32),
    release : Proc(IWebApplicationUIEvents*, UInt32),
    security_problem : Proc(IWebApplicationUIEvents*, UInt32, Win32cr::Foundation::HRESULT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWebApplicationUIEvents, lpVtbl : IWebApplicationUIEventsVtbl* do
    GUID = LibC::GUID.new(0x5b2b3f99_u32, 0x328c_u16, 0x41d5_u16, StaticArray[0xa6_u8, 0xf7_u8, 0x74_u8, 0x83_u8, 0xed_u8, 0x8e_u8, 0x71_u8, 0xdd_u8])
    def query_interface(this : IWebApplicationUIEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWebApplicationUIEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWebApplicationUIEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def security_problem(this : IWebApplicationUIEvents*, securityProblem : UInt32, result : Win32cr::Foundation::HRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.security_problem.call(this, securityProblem, result)
    end

  end

  @[Extern]
  record IWebApplicationUpdateEventsVtbl,
    query_interface : Proc(IWebApplicationUpdateEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWebApplicationUpdateEvents*, UInt32),
    release : Proc(IWebApplicationUpdateEvents*, UInt32),
    on_paint : Proc(IWebApplicationUpdateEvents*, Win32cr::Foundation::HRESULT),
    on_css_changed : Proc(IWebApplicationUpdateEvents*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWebApplicationUpdateEvents, lpVtbl : IWebApplicationUpdateEventsVtbl* do
    GUID = LibC::GUID.new(0x3e59e6b7_u32, 0xc652_u16, 0x4daf_u16, StaticArray[0xad_u8, 0x5e_u8, 0x16_u8, 0xfe_u8, 0xb3_u8, 0x50_u8, 0xcd_u8, 0xe3_u8])
    def query_interface(this : IWebApplicationUpdateEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWebApplicationUpdateEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWebApplicationUpdateEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_paint(this : IWebApplicationUpdateEvents*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_paint.call(this)
    end
    def on_css_changed(this : IWebApplicationUpdateEvents*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_css_changed.call(this)
    end

  end

  @[Extern]
  record IWebApplicationHostVtbl,
    query_interface : Proc(IWebApplicationHost*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWebApplicationHost*, UInt32),
    release : Proc(IWebApplicationHost*, UInt32),
    get_HWND : Proc(IWebApplicationHost*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    get_Document : Proc(IWebApplicationHost*, Void**, Win32cr::Foundation::HRESULT),
    refresh : Proc(IWebApplicationHost*, Win32cr::Foundation::HRESULT),
    advise : Proc(IWebApplicationHost*, LibC::GUID*, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    unadvise : Proc(IWebApplicationHost*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWebApplicationHost, lpVtbl : IWebApplicationHostVtbl* do
    GUID = LibC::GUID.new(0xcecbd2c3_u32, 0xa3a5_u16, 0x4749_u16, StaticArray[0x96_u8, 0x81_u8, 0x20_u8, 0xe9_u8, 0x16_u8, 0x1c_u8, 0x67_u8, 0x94_u8])
    def query_interface(this : IWebApplicationHost*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWebApplicationHost*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWebApplicationHost*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_HWND(this : IWebApplicationHost*, hwnd : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HWND.call(this, hwnd)
    end
    def get_Document(this : IWebApplicationHost*, htmlDocument : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Document.call(this, htmlDocument)
    end
    def refresh(this : IWebApplicationHost*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def advise(this : IWebApplicationHost*, interfaceId : LibC::GUID*, callback : Void*, cookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.advise.call(this, interfaceId, callback, cookie)
    end
    def unadvise(this : IWebApplicationHost*, cookie : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unadvise.call(this, cookie)
    end

  end

  @[Extern]
  record IWebApplicationActivationVtbl,
    query_interface : Proc(IWebApplicationActivation*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWebApplicationActivation*, UInt32),
    release : Proc(IWebApplicationActivation*, UInt32),
    cancel_pending_activation : Proc(IWebApplicationActivation*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWebApplicationActivation, lpVtbl : IWebApplicationActivationVtbl* do
    GUID = LibC::GUID.new(0xbcdcd0de_u32, 0x330e_u16, 0x481b_u16, StaticArray[0xb8_u8, 0x43_u8, 0x48_u8, 0x98_u8, 0xa6_u8, 0xa8_u8, 0xeb_u8, 0xac_u8])
    def query_interface(this : IWebApplicationActivation*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWebApplicationActivation*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWebApplicationActivation*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def cancel_pending_activation(this : IWebApplicationActivation*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel_pending_activation.call(this)
    end

  end

  @[Extern]
  record IWebApplicationAuthoringModeVtbl,
    query_interface : Proc(IWebApplicationAuthoringMode*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWebApplicationAuthoringMode*, UInt32),
    release : Proc(IWebApplicationAuthoringMode*, UInt32),
    query_service : Proc(IWebApplicationAuthoringMode*, LibC::GUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_AuthoringClientBinary : Proc(IWebApplicationAuthoringMode*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWebApplicationAuthoringMode, lpVtbl : IWebApplicationAuthoringModeVtbl* do
    GUID = LibC::GUID.new(0x720aea93_u32, 0x1964_u16, 0x4db0_u16, StaticArray[0xb0_u8, 0x5_u8, 0x29_u8, 0xeb_u8, 0x9e_u8, 0x2b_u8, 0x18_u8, 0xa9_u8])
    def query_interface(this : IWebApplicationAuthoringMode*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWebApplicationAuthoringMode*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWebApplicationAuthoringMode*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def query_service(this : IWebApplicationAuthoringMode*, guidService : LibC::GUID*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_service.call(this, guidService, riid, ppvObject)
    end
    def get_AuthoringClientBinary(this : IWebApplicationAuthoringMode*, designModeDllPath : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AuthoringClientBinary.call(this, designModeDllPath)
    end

  end

end