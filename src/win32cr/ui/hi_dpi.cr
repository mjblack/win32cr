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
    C.OpenThemeDataForDpi(hwnd, pszClassList, dpi)
  end

  def setDialogControlDpiChangeBehavior(hWnd : Win32cr::Foundation::HWND, mask : Win32cr::UI::HiDpi::DIALOG_CONTROL_DPI_CHANGE_BEHAVIORS, values : Win32cr::UI::HiDpi::DIALOG_CONTROL_DPI_CHANGE_BEHAVIORS) : Win32cr::Foundation::BOOL
    C.SetDialogControlDpiChangeBehavior(hWnd, mask, values)
  end

  def getDialogControlDpiChangeBehavior(hWnd : Win32cr::Foundation::HWND) : Win32cr::UI::HiDpi::DIALOG_CONTROL_DPI_CHANGE_BEHAVIORS
    C.GetDialogControlDpiChangeBehavior(hWnd)
  end

  def setDialogDpiChangeBehavior(hDlg : Win32cr::Foundation::HWND, mask : Win32cr::UI::HiDpi::DIALOG_DPI_CHANGE_BEHAVIORS, values : Win32cr::UI::HiDpi::DIALOG_DPI_CHANGE_BEHAVIORS) : Win32cr::Foundation::BOOL
    C.SetDialogDpiChangeBehavior(hDlg, mask, values)
  end

  def getDialogDpiChangeBehavior(hDlg : Win32cr::Foundation::HWND) : Win32cr::UI::HiDpi::DIALOG_DPI_CHANGE_BEHAVIORS
    C.GetDialogDpiChangeBehavior(hDlg)
  end

  def getSystemMetricsForDpi(nIndex : Int32, dpi : UInt32) : Int32
    C.GetSystemMetricsForDpi(nIndex, dpi)
  end

  def adjustWindowRectExForDpi(lpRect : Win32cr::Foundation::RECT*, dwStyle : Win32cr::UI::WindowsAndMessaging::WINDOW_STYLE, bMenu : Win32cr::Foundation::BOOL, dwExStyle : Win32cr::UI::WindowsAndMessaging::WINDOW_EX_STYLE, dpi : UInt32) : Win32cr::Foundation::BOOL
    C.AdjustWindowRectExForDpi(lpRect, dwStyle, bMenu, dwExStyle, dpi)
  end

  def logicalToPhysicalPointForPerMonitorDPI(hWnd : Win32cr::Foundation::HWND, lpPoint : Win32cr::Foundation::POINT*) : Win32cr::Foundation::BOOL
    C.LogicalToPhysicalPointForPerMonitorDPI(hWnd, lpPoint)
  end

  def physicalToLogicalPointForPerMonitorDPI(hWnd : Win32cr::Foundation::HWND, lpPoint : Win32cr::Foundation::POINT*) : Win32cr::Foundation::BOOL
    C.PhysicalToLogicalPointForPerMonitorDPI(hWnd, lpPoint)
  end

  def systemParametersInfoForDpi(uiAction : UInt32, uiParam : UInt32, pvParam : Void*, fWinIni : UInt32, dpi : UInt32) : Win32cr::Foundation::BOOL
    C.SystemParametersInfoForDpi(uiAction, uiParam, pvParam, fWinIni, dpi)
  end

  def setThreadDpiAwarenessContext(dpiContext : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT) : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT
    C.SetThreadDpiAwarenessContext(dpiContext)
  end

  def getThreadDpiAwarenessContext : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT
    C.GetThreadDpiAwarenessContext
  end

  def getWindowDpiAwarenessContext(hwnd : Win32cr::Foundation::HWND) : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT
    C.GetWindowDpiAwarenessContext(hwnd)
  end

  def getAwarenessFromDpiAwarenessContext(value : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT) : Win32cr::UI::HiDpi::DPI_AWARENESS
    C.GetAwarenessFromDpiAwarenessContext(value)
  end

  def getDpiFromDpiAwarenessContext(value : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT) : UInt32
    C.GetDpiFromDpiAwarenessContext(value)
  end

  def areDpiAwarenessContextsEqual(dpiContextA : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT, dpiContextB : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT) : Win32cr::Foundation::BOOL
    C.AreDpiAwarenessContextsEqual(dpiContextA, dpiContextB)
  end

  def isValidDpiAwarenessContext(value : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT) : Win32cr::Foundation::BOOL
    C.IsValidDpiAwarenessContext(value)
  end

  def getDpiForWindow(hwnd : Win32cr::Foundation::HWND) : UInt32
    C.GetDpiForWindow(hwnd)
  end

  def getDpiForSystem : UInt32
    C.GetDpiForSystem
  end

  def getSystemDpiForProcess(hProcess : Win32cr::Foundation::HANDLE) : UInt32
    C.GetSystemDpiForProcess(hProcess)
  end

  def enableNonClientDpiScaling(hwnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::BOOL
    C.EnableNonClientDpiScaling(hwnd)
  end

  def setProcessDpiAwarenessContext(value : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT) : Win32cr::Foundation::BOOL
    C.SetProcessDpiAwarenessContext(value)
  end

  def getDpiAwarenessContextForProcess(hProcess : Win32cr::Foundation::HANDLE) : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT
    C.GetDpiAwarenessContextForProcess(hProcess)
  end

  def setThreadDpiHostingBehavior(value : Win32cr::UI::HiDpi::DPI_HOSTING_BEHAVIOR) : Win32cr::UI::HiDpi::DPI_HOSTING_BEHAVIOR
    C.SetThreadDpiHostingBehavior(value)
  end

  def getThreadDpiHostingBehavior : Win32cr::UI::HiDpi::DPI_HOSTING_BEHAVIOR
    C.GetThreadDpiHostingBehavior
  end

  def getWindowDpiHostingBehavior(hwnd : Win32cr::Foundation::HWND) : Win32cr::UI::HiDpi::DPI_HOSTING_BEHAVIOR
    C.GetWindowDpiHostingBehavior(hwnd)
  end

  def setProcessDpiAwareness(value : Win32cr::UI::HiDpi::PROCESS_DPI_AWARENESS) : Win32cr::Foundation::HRESULT
    C.SetProcessDpiAwareness(value)
  end

  def getProcessDpiAwareness(hprocess : Win32cr::Foundation::HANDLE, value : Win32cr::UI::HiDpi::PROCESS_DPI_AWARENESS*) : Win32cr::Foundation::HRESULT
    C.GetProcessDpiAwareness(hprocess, value)
  end

  def getDpiForMonitor(hmonitor : Win32cr::Graphics::Gdi::HMONITOR, dpiType : Win32cr::UI::HiDpi::MONITOR_DPI_TYPE, dpiX : UInt32*, dpiY : UInt32*) : Win32cr::Foundation::HRESULT
    C.GetDpiForMonitor(hmonitor, dpiType, dpiX, dpiY)
  end

  @[Link("uxtheme")]
  @[Link("user32")]
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
end