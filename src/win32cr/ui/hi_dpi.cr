require "./../foundation.cr"
require "./windows_and_messaging.cr"
require "./../graphics/gdi.cr"

module Win32cr::UI::HiDpi
  extend self
  alias DPI_AWARENESS_CONTEXT = LibC::IntPtrT
  DPI_AWARENESS_CONTEXT_UNAWARE = -1_i32
  DPI_AWARENESS_CONTEXT_SYSTEM_AWARE = -2_i32
  DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE = -3_i32
  DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE_V2 = -4_i32
  DPI_AWARENESS_CONTEXT_UNAWARE_GDISCALED = -5_i32

  enum DPI_AWARENESS
    DPI_AWARENESS_INVALID = -1_i32
    DPI_AWARENESS_UNAWARE = 0_i32
    DPI_AWARENESS_SYSTEM_AWARE = 1_i32
    DPI_AWARENESS_PER_MONITOR_AWARE = 2_i32
  end
  enum DPI_HOSTING_BEHAVIOR
    DPI_HOSTING_BEHAVIOR_INVALID = -1_i32
    DPI_HOSTING_BEHAVIOR_DEFAULT = 0_i32
    DPI_HOSTING_BEHAVIOR_MIXED = 1_i32
  end
  @[Flags]
  enum DIALOG_CONTROL_DPI_CHANGE_BEHAVIORS : UInt32
    DCDC_DEFAULT = 0_u32
    DCDC_DISABLE_FONT_UPDATE = 1_u32
    DCDC_DISABLE_RELAYOUT = 2_u32
  end
  @[Flags]
  enum DIALOG_DPI_CHANGE_BEHAVIORS : UInt32
    DDC_DEFAULT = 0_u32
    DDC_DISABLE_ALL = 1_u32
    DDC_DISABLE_RESIZE = 2_u32
    DDC_DISABLE_CONTROL_RELAYOUT = 4_u32
  end
  enum PROCESS_DPI_AWARENESS
    PROCESS_DPI_UNAWARE = 0_i32
    PROCESS_SYSTEM_DPI_AWARE = 1_i32
    PROCESS_PER_MONITOR_DPI_AWARE = 2_i32
  end
  enum MONITOR_DPI_TYPE
    MDT_EFFECTIVE_DPI = 0_i32
    MDT_ANGULAR_DPI = 1_i32
    MDT_RAW_DPI = 2_i32
    MDT_DEFAULT = 0_i32
  end

  def openThemeDataForDpi(hwnd : Win32cr::Foundation::HWND, pszClassList : Win32cr::Foundation::PWSTR, dpi : UInt32) : LibC::IntPtrT
    {% if !flag?(:docs) %}
    C.OpenThemeDataForDpi(hwnd, pszClassList, dpi)
    {% end %}
  end

  def setDialogControlDpiChangeBehavior(hWnd : Win32cr::Foundation::HWND, mask : Win32cr::UI::HiDpi::DIALOG_CONTROL_DPI_CHANGE_BEHAVIORS, values : Win32cr::UI::HiDpi::DIALOG_CONTROL_DPI_CHANGE_BEHAVIORS) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SetDialogControlDpiChangeBehavior(hWnd, mask, values)
    {% end %}
  end

  def getDialogControlDpiChangeBehavior(hWnd : Win32cr::Foundation::HWND) : Win32cr::UI::HiDpi::DIALOG_CONTROL_DPI_CHANGE_BEHAVIORS
    {% if !flag?(:docs) %}
    C.GetDialogControlDpiChangeBehavior(hWnd)
    {% end %}
  end

  def setDialogDpiChangeBehavior(hDlg : Win32cr::Foundation::HWND, mask : Win32cr::UI::HiDpi::DIALOG_DPI_CHANGE_BEHAVIORS, values : Win32cr::UI::HiDpi::DIALOG_DPI_CHANGE_BEHAVIORS) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SetDialogDpiChangeBehavior(hDlg, mask, values)
    {% end %}
  end

  def getDialogDpiChangeBehavior(hDlg : Win32cr::Foundation::HWND) : Win32cr::UI::HiDpi::DIALOG_DPI_CHANGE_BEHAVIORS
    {% if !flag?(:docs) %}
    C.GetDialogDpiChangeBehavior(hDlg)
    {% end %}
  end

  def getSystemMetricsForDpi(nIndex : Int32, dpi : UInt32) : Int32
    {% if !flag?(:docs) %}
    C.GetSystemMetricsForDpi(nIndex, dpi)
    {% end %}
  end

  def adjustWindowRectExForDpi(lpRect : Win32cr::Foundation::RECT*, dwStyle : Win32cr::UI::WindowsAndMessaging::WINDOW_STYLE, bMenu : Win32cr::Foundation::BOOL, dwExStyle : Win32cr::UI::WindowsAndMessaging::WINDOW_EX_STYLE, dpi : UInt32) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.AdjustWindowRectExForDpi(lpRect, dwStyle, bMenu, dwExStyle, dpi)
    {% end %}
  end

  def logicalToPhysicalPointForPerMonitorDPI(hWnd : Win32cr::Foundation::HWND, lpPoint : Win32cr::Foundation::POINT*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.LogicalToPhysicalPointForPerMonitorDPI(hWnd, lpPoint)
    {% end %}
  end

  def physicalToLogicalPointForPerMonitorDPI(hWnd : Win32cr::Foundation::HWND, lpPoint : Win32cr::Foundation::POINT*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.PhysicalToLogicalPointForPerMonitorDPI(hWnd, lpPoint)
    {% end %}
  end

  def systemParametersInfoForDpi(uiAction : UInt32, uiParam : UInt32, pvParam : Void*, fWinIni : UInt32, dpi : UInt32) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SystemParametersInfoForDpi(uiAction, uiParam, pvParam, fWinIni, dpi)
    {% end %}
  end

  def setThreadDpiAwarenessContext(dpiContext : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT) : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT
    {% if !flag?(:docs) %}
    C.SetThreadDpiAwarenessContext(dpiContext)
    {% end %}
  end

  def getThreadDpiAwarenessContext : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT
    {% if !flag?(:docs) %}
    C.GetThreadDpiAwarenessContext
    {% end %}
  end

  def getWindowDpiAwarenessContext(hwnd : Win32cr::Foundation::HWND) : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT
    {% if !flag?(:docs) %}
    C.GetWindowDpiAwarenessContext(hwnd)
    {% end %}
  end

  def getAwarenessFromDpiAwarenessContext(value : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT) : Win32cr::UI::HiDpi::DPI_AWARENESS
    {% if !flag?(:docs) %}
    C.GetAwarenessFromDpiAwarenessContext(value)
    {% end %}
  end

  def getDpiFromDpiAwarenessContext(value : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT) : UInt32
    {% if !flag?(:docs) %}
    C.GetDpiFromDpiAwarenessContext(value)
    {% end %}
  end

  def areDpiAwarenessContextsEqual(dpiContextA : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT, dpiContextB : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.AreDpiAwarenessContextsEqual(dpiContextA, dpiContextB)
    {% end %}
  end

  def isValidDpiAwarenessContext(value : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.IsValidDpiAwarenessContext(value)
    {% end %}
  end

  def getDpiForWindow(hwnd : Win32cr::Foundation::HWND) : UInt32
    {% if !flag?(:docs) %}
    C.GetDpiForWindow(hwnd)
    {% end %}
  end

  def getDpiForSystem : UInt32
    {% if !flag?(:docs) %}
    C.GetDpiForSystem
    {% end %}
  end

  def getSystemDpiForProcess(hProcess : Win32cr::Foundation::HANDLE) : UInt32
    {% if !flag?(:docs) %}
    C.GetSystemDpiForProcess(hProcess)
    {% end %}
  end

  def enableNonClientDpiScaling(hwnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.EnableNonClientDpiScaling(hwnd)
    {% end %}
  end

  def setProcessDpiAwarenessContext(value : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SetProcessDpiAwarenessContext(value)
    {% end %}
  end

  def getDpiAwarenessContextForProcess(hProcess : Win32cr::Foundation::HANDLE) : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT
    {% if !flag?(:docs) %}
    C.GetDpiAwarenessContextForProcess(hProcess)
    {% end %}
  end

  def setThreadDpiHostingBehavior(value : Win32cr::UI::HiDpi::DPI_HOSTING_BEHAVIOR) : Win32cr::UI::HiDpi::DPI_HOSTING_BEHAVIOR
    {% if !flag?(:docs) %}
    C.SetThreadDpiHostingBehavior(value)
    {% end %}
  end

  def getThreadDpiHostingBehavior : Win32cr::UI::HiDpi::DPI_HOSTING_BEHAVIOR
    {% if !flag?(:docs) %}
    C.GetThreadDpiHostingBehavior
    {% end %}
  end

  def getWindowDpiHostingBehavior(hwnd : Win32cr::Foundation::HWND) : Win32cr::UI::HiDpi::DPI_HOSTING_BEHAVIOR
    {% if !flag?(:docs) %}
    C.GetWindowDpiHostingBehavior(hwnd)
    {% end %}
  end

  def setProcessDpiAwareness(value : Win32cr::UI::HiDpi::PROCESS_DPI_AWARENESS) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.SetProcessDpiAwareness(value)
    {% end %}
  end

  def getProcessDpiAwareness(hprocess : Win32cr::Foundation::HANDLE, value : Win32cr::UI::HiDpi::PROCESS_DPI_AWARENESS*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.GetProcessDpiAwareness(hprocess, value)
    {% end %}
  end

  def getDpiForMonitor(hmonitor : Win32cr::Graphics::Gdi::HMONITOR, dpiType : Win32cr::UI::HiDpi::MONITOR_DPI_TYPE, dpiX : UInt32*, dpiY : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.GetDpiForMonitor(hmonitor, dpiType, dpiX, dpiY)
    {% end %}
  end

  @[Link("uxtheme.dll")]
  @[Link("user32.dll")]
  @[Link("api-ms-win-shcore-scaling-l1-1-1.dll")]
  {% if !flag?(:docs) %}
  lib C
    # :nodoc:
    fun OpenThemeDataForDpi(hwnd : Win32cr::Foundation::HWND, pszClassList : Win32cr::Foundation::PWSTR, dpi : UInt32) : LibC::IntPtrT

    # :nodoc:
    fun SetDialogControlDpiChangeBehavior(hWnd : Win32cr::Foundation::HWND, mask : Win32cr::UI::HiDpi::DIALOG_CONTROL_DPI_CHANGE_BEHAVIORS, values : Win32cr::UI::HiDpi::DIALOG_CONTROL_DPI_CHANGE_BEHAVIORS) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetDialogControlDpiChangeBehavior(hWnd : Win32cr::Foundation::HWND) : Win32cr::UI::HiDpi::DIALOG_CONTROL_DPI_CHANGE_BEHAVIORS

    # :nodoc:
    fun SetDialogDpiChangeBehavior(hDlg : Win32cr::Foundation::HWND, mask : Win32cr::UI::HiDpi::DIALOG_DPI_CHANGE_BEHAVIORS, values : Win32cr::UI::HiDpi::DIALOG_DPI_CHANGE_BEHAVIORS) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetDialogDpiChangeBehavior(hDlg : Win32cr::Foundation::HWND) : Win32cr::UI::HiDpi::DIALOG_DPI_CHANGE_BEHAVIORS

    # :nodoc:
    fun GetSystemMetricsForDpi(nIndex : Int32, dpi : UInt32) : Int32

    # :nodoc:
    fun AdjustWindowRectExForDpi(lpRect : Win32cr::Foundation::RECT*, dwStyle : Win32cr::UI::WindowsAndMessaging::WINDOW_STYLE, bMenu : Win32cr::Foundation::BOOL, dwExStyle : Win32cr::UI::WindowsAndMessaging::WINDOW_EX_STYLE, dpi : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun LogicalToPhysicalPointForPerMonitorDPI(hWnd : Win32cr::Foundation::HWND, lpPoint : Win32cr::Foundation::POINT*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun PhysicalToLogicalPointForPerMonitorDPI(hWnd : Win32cr::Foundation::HWND, lpPoint : Win32cr::Foundation::POINT*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SystemParametersInfoForDpi(uiAction : UInt32, uiParam : UInt32, pvParam : Void*, fWinIni : UInt32, dpi : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetThreadDpiAwarenessContext(dpiContext : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT) : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT

    # :nodoc:
    fun GetThreadDpiAwarenessContext : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT

    # :nodoc:
    fun GetWindowDpiAwarenessContext(hwnd : Win32cr::Foundation::HWND) : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT

    # :nodoc:
    fun GetAwarenessFromDpiAwarenessContext(value : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT) : Win32cr::UI::HiDpi::DPI_AWARENESS

    # :nodoc:
    fun GetDpiFromDpiAwarenessContext(value : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT) : UInt32

    # :nodoc:
    fun AreDpiAwarenessContextsEqual(dpiContextA : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT, dpiContextB : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun IsValidDpiAwarenessContext(value : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetDpiForWindow(hwnd : Win32cr::Foundation::HWND) : UInt32

    # :nodoc:
    fun GetDpiForSystem : UInt32

    # :nodoc:
    fun GetSystemDpiForProcess(hProcess : Win32cr::Foundation::HANDLE) : UInt32

    # :nodoc:
    fun EnableNonClientDpiScaling(hwnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetProcessDpiAwarenessContext(value : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetDpiAwarenessContextForProcess(hProcess : Win32cr::Foundation::HANDLE) : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT

    # :nodoc:
    fun SetThreadDpiHostingBehavior(value : Win32cr::UI::HiDpi::DPI_HOSTING_BEHAVIOR) : Win32cr::UI::HiDpi::DPI_HOSTING_BEHAVIOR

    # :nodoc:
    fun GetThreadDpiHostingBehavior : Win32cr::UI::HiDpi::DPI_HOSTING_BEHAVIOR

    # :nodoc:
    fun GetWindowDpiHostingBehavior(hwnd : Win32cr::Foundation::HWND) : Win32cr::UI::HiDpi::DPI_HOSTING_BEHAVIOR

    # :nodoc:
    fun SetProcessDpiAwareness(value : Win32cr::UI::HiDpi::PROCESS_DPI_AWARENESS) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetProcessDpiAwareness(hprocess : Win32cr::Foundation::HANDLE, value : Win32cr::UI::HiDpi::PROCESS_DPI_AWARENESS*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetDpiForMonitor(hmonitor : Win32cr::Graphics::Gdi::HMONITOR, dpiType : Win32cr::UI::HiDpi::MONITOR_DPI_TYPE, dpiX : UInt32*, dpiY : UInt32*) : Win32cr::Foundation::HRESULT

  end
  {% end %}
end