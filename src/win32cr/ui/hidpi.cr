require "../foundation.cr"
require "../graphics/gdi.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:uxtheme.dll")]
@[Link(ldflags: "/DELAYLOAD:user32.dll")]
@[Link(ldflags: "/DELAYLOAD:shcore.dll")]
{% else %}
@[Link("uxtheme")]
@[Link("user32")]
@[Link("shcore")]
{% end %}
lib LibWin32
  alias DPI_AWARENESS_CONTEXT = LibC::IntPtrT

  DPI_AWARENESS_CONTEXT_UNAWARE = -1_i32
  DPI_AWARENESS_CONTEXT_SYSTEM_AWARE = -2_i32
  DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE = -3_i32
  DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE_V2 = -4_i32
  DPI_AWARENESS_CONTEXT_UNAWARE_GDISCALED = -5_i32


  enum DPI_AWARENESS : Int32
    DPI_AWARENESS_INVALID = -1
    DPI_AWARENESS_UNAWARE = 0
    DPI_AWARENESS_SYSTEM_AWARE = 1
    DPI_AWARENESS_PER_MONITOR_AWARE = 2
  end

  enum DPI_HOSTING_BEHAVIOR : Int32
    DPI_HOSTING_BEHAVIOR_INVALID = -1
    DPI_HOSTING_BEHAVIOR_DEFAULT = 0
    DPI_HOSTING_BEHAVIOR_MIXED = 1
  end

  enum DIALOG_CONTROL_DPI_CHANGE_BEHAVIORS : UInt32
    DCDC_DEFAULT = 0
    DCDC_DISABLE_FONT_UPDATE = 1
    DCDC_DISABLE_RELAYOUT = 2
  end

  enum DIALOG_DPI_CHANGE_BEHAVIORS : UInt32
    DDC_DEFAULT = 0
    DDC_DISABLE_ALL = 1
    DDC_DISABLE_RESIZE = 2
    DDC_DISABLE_CONTROL_RELAYOUT = 4
  end

  enum PROCESS_DPI_AWARENESS : Int32
    PROCESS_DPI_UNAWARE = 0
    PROCESS_SYSTEM_DPI_AWARE = 1
    PROCESS_PER_MONITOR_DPI_AWARE = 2
  end

  enum MONITOR_DPI_TYPE : Int32
    MDT_EFFECTIVE_DPI = 0
    MDT_ANGULAR_DPI = 1
    MDT_RAW_DPI = 2
    MDT_DEFAULT = 0
  end


  # Params # hwnd : LibC::HANDLE [In],pszclasslist : LibC::LPWSTR [In],dpi : UInt32 [In]
  fun OpenThemeDataForDpi(hwnd : LibC::HANDLE, pszclasslist : LibC::LPWSTR, dpi : UInt32) : LibC::IntPtrT

  # Params # hwnd : LibC::HANDLE [In],mask : DIALOG_CONTROL_DPI_CHANGE_BEHAVIORS [In],values : DIALOG_CONTROL_DPI_CHANGE_BEHAVIORS [In]
  fun SetDialogControlDpiChangeBehavior(hwnd : LibC::HANDLE, mask : DIALOG_CONTROL_DPI_CHANGE_BEHAVIORS, values : DIALOG_CONTROL_DPI_CHANGE_BEHAVIORS) : LibC::BOOL

  # Params # hwnd : LibC::HANDLE [In]
  fun GetDialogControlDpiChangeBehavior(hwnd : LibC::HANDLE) : DIALOG_CONTROL_DPI_CHANGE_BEHAVIORS

  # Params # hdlg : LibC::HANDLE [In],mask : DIALOG_DPI_CHANGE_BEHAVIORS [In],values : DIALOG_DPI_CHANGE_BEHAVIORS [In]
  fun SetDialogDpiChangeBehavior(hdlg : LibC::HANDLE, mask : DIALOG_DPI_CHANGE_BEHAVIORS, values : DIALOG_DPI_CHANGE_BEHAVIORS) : LibC::BOOL

  # Params # hdlg : LibC::HANDLE [In]
  fun GetDialogDpiChangeBehavior(hdlg : LibC::HANDLE) : DIALOG_DPI_CHANGE_BEHAVIORS

  # Params # nindex : Int32 [In],dpi : UInt32 [In]
  fun GetSystemMetricsForDpi(nindex : Int32, dpi : UInt32) : Int32

  # Params # lprect : RECT* [In],dwstyle : UInt32 [In],bmenu : LibC::BOOL [In],dwexstyle : UInt32 [In],dpi : UInt32 [In]
  fun AdjustWindowRectExForDpi(lprect : RECT*, dwstyle : UInt32, bmenu : LibC::BOOL, dwexstyle : UInt32, dpi : UInt32) : LibC::BOOL

  # Params # hwnd : LibC::HANDLE [In],lppoint : POINT* [In]
  fun LogicalToPhysicalPointForPerMonitorDPI(hwnd : LibC::HANDLE, lppoint : POINT*) : LibC::BOOL

  # Params # hwnd : LibC::HANDLE [In],lppoint : POINT* [In]
  fun PhysicalToLogicalPointForPerMonitorDPI(hwnd : LibC::HANDLE, lppoint : POINT*) : LibC::BOOL

  # Params # uiaction : UInt32 [In],uiparam : UInt32 [In],pvparam : Void* [In],fwinini : UInt32 [In],dpi : UInt32 [In]
  fun SystemParametersInfoForDpi(uiaction : UInt32, uiparam : UInt32, pvparam : Void*, fwinini : UInt32, dpi : UInt32) : LibC::BOOL

  # Params # dpicontext : DPI_AWARENESS_CONTEXT [In]
  fun SetThreadDpiAwarenessContext(dpicontext : DPI_AWARENESS_CONTEXT) : DPI_AWARENESS_CONTEXT

  # Params # 
  fun GetThreadDpiAwarenessContext : DPI_AWARENESS_CONTEXT

  # Params # hwnd : LibC::HANDLE [In]
  fun GetWindowDpiAwarenessContext(hwnd : LibC::HANDLE) : DPI_AWARENESS_CONTEXT

  # Params # value : DPI_AWARENESS_CONTEXT [In]
  fun GetAwarenessFromDpiAwarenessContext(value : DPI_AWARENESS_CONTEXT) : DPI_AWARENESS

  # Params # value : DPI_AWARENESS_CONTEXT [In]
  fun GetDpiFromDpiAwarenessContext(value : DPI_AWARENESS_CONTEXT) : UInt32

  # Params # dpicontexta : DPI_AWARENESS_CONTEXT [In],dpicontextb : DPI_AWARENESS_CONTEXT [In]
  fun AreDpiAwarenessContextsEqual(dpicontexta : DPI_AWARENESS_CONTEXT, dpicontextb : DPI_AWARENESS_CONTEXT) : LibC::BOOL

  # Params # value : DPI_AWARENESS_CONTEXT [In]
  fun IsValidDpiAwarenessContext(value : DPI_AWARENESS_CONTEXT) : LibC::BOOL

  # Params # hwnd : LibC::HANDLE [In]
  fun GetDpiForWindow(hwnd : LibC::HANDLE) : UInt32

  # Params # 
  fun GetDpiForSystem : UInt32

  # Params # hprocess : LibC::HANDLE [In]
  fun GetSystemDpiForProcess(hprocess : LibC::HANDLE) : UInt32

  # Params # hwnd : LibC::HANDLE [In]
  fun EnableNonClientDpiScaling(hwnd : LibC::HANDLE) : LibC::BOOL

  # Params # value : DPI_AWARENESS_CONTEXT [In]
  fun SetProcessDpiAwarenessContext(value : DPI_AWARENESS_CONTEXT) : LibC::BOOL

  # Params # hprocess : LibC::HANDLE [In]
  fun GetDpiAwarenessContextForProcess(hprocess : LibC::HANDLE) : DPI_AWARENESS_CONTEXT

  # Params # value : DPI_HOSTING_BEHAVIOR [In]
  fun SetThreadDpiHostingBehavior(value : DPI_HOSTING_BEHAVIOR) : DPI_HOSTING_BEHAVIOR

  # Params # 
  fun GetThreadDpiHostingBehavior : DPI_HOSTING_BEHAVIOR

  # Params # hwnd : LibC::HANDLE [In]
  fun GetWindowDpiHostingBehavior(hwnd : LibC::HANDLE) : DPI_HOSTING_BEHAVIOR

  # Params # value : PROCESS_DPI_AWARENESS [In]
  fun SetProcessDpiAwareness(value : PROCESS_DPI_AWARENESS) : HRESULT

  # Params # hprocess : LibC::HANDLE [In],value : PROCESS_DPI_AWARENESS* [In]
  fun GetProcessDpiAwareness(hprocess : LibC::HANDLE, value : PROCESS_DPI_AWARENESS*) : HRESULT

  # Params # hmonitor : HMONITOR [In],dpitype : MONITOR_DPI_TYPE [In],dpix : UInt32* [In],dpiy : UInt32* [In]
  fun GetDpiForMonitor(hmonitor : HMONITOR, dpitype : MONITOR_DPI_TYPE, dpix : UInt32*, dpiy : UInt32*) : HRESULT
end
