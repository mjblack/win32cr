require "./../foundation.cr"
require "./windows_and_messaging.cr"
require "./../graphics/gdi.cr"

module Win32cr::UI::HiDpi
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

  @[Link("uxtheme")]
  @[Link("user32")]
  @[Link("api-ms-win-shcore-scaling-l1-1-1")]
  lib C
    fun OpenThemeDataForDpi(hwnd : Win32cr::Foundation::HWND, pszClassList : Win32cr::Foundation::PWSTR, dpi : UInt32) : LibC::IntPtrT

    fun SetDialogControlDpiChangeBehavior(hWnd : Win32cr::Foundation::HWND, mask : Win32cr::UI::HiDpi::DIALOG_CONTROL_DPI_CHANGE_BEHAVIORS, values : Win32cr::UI::HiDpi::DIALOG_CONTROL_DPI_CHANGE_BEHAVIORS) : Win32cr::Foundation::BOOL

    fun GetDialogControlDpiChangeBehavior(hWnd : Win32cr::Foundation::HWND) : Win32cr::UI::HiDpi::DIALOG_CONTROL_DPI_CHANGE_BEHAVIORS

    fun SetDialogDpiChangeBehavior(hDlg : Win32cr::Foundation::HWND, mask : Win32cr::UI::HiDpi::DIALOG_DPI_CHANGE_BEHAVIORS, values : Win32cr::UI::HiDpi::DIALOG_DPI_CHANGE_BEHAVIORS) : Win32cr::Foundation::BOOL

    fun GetDialogDpiChangeBehavior(hDlg : Win32cr::Foundation::HWND) : Win32cr::UI::HiDpi::DIALOG_DPI_CHANGE_BEHAVIORS

    fun GetSystemMetricsForDpi(nIndex : Int32, dpi : UInt32) : Int32

    fun AdjustWindowRectExForDpi(lpRect : Win32cr::Foundation::RECT*, dwStyle : Win32cr::UI::WindowsAndMessaging::WINDOW_STYLE, bMenu : Win32cr::Foundation::BOOL, dwExStyle : Win32cr::UI::WindowsAndMessaging::WINDOW_EX_STYLE, dpi : UInt32) : Win32cr::Foundation::BOOL

    fun LogicalToPhysicalPointForPerMonitorDPI(hWnd : Win32cr::Foundation::HWND, lpPoint : Win32cr::Foundation::POINT*) : Win32cr::Foundation::BOOL

    fun PhysicalToLogicalPointForPerMonitorDPI(hWnd : Win32cr::Foundation::HWND, lpPoint : Win32cr::Foundation::POINT*) : Win32cr::Foundation::BOOL

    fun SystemParametersInfoForDpi(uiAction : UInt32, uiParam : UInt32, pvParam : Void*, fWinIni : UInt32, dpi : UInt32) : Win32cr::Foundation::BOOL

    fun SetThreadDpiAwarenessContext(dpiContext : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT) : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT

    fun GetThreadDpiAwarenessContext : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT

    fun GetWindowDpiAwarenessContext(hwnd : Win32cr::Foundation::HWND) : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT

    fun GetAwarenessFromDpiAwarenessContext(value : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT) : Win32cr::UI::HiDpi::DPI_AWARENESS

    fun GetDpiFromDpiAwarenessContext(value : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT) : UInt32

    fun AreDpiAwarenessContextsEqual(dpiContextA : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT, dpiContextB : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT) : Win32cr::Foundation::BOOL

    fun IsValidDpiAwarenessContext(value : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT) : Win32cr::Foundation::BOOL

    fun GetDpiForWindow(hwnd : Win32cr::Foundation::HWND) : UInt32

    fun GetDpiForSystem : UInt32

    fun GetSystemDpiForProcess(hProcess : Win32cr::Foundation::HANDLE) : UInt32

    fun EnableNonClientDpiScaling(hwnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::BOOL

    fun SetProcessDpiAwarenessContext(value : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT) : Win32cr::Foundation::BOOL

    fun GetDpiAwarenessContextForProcess(hProcess : Win32cr::Foundation::HANDLE) : Win32cr::UI::HiDpi::DPI_AWARENESS_CONTEXT

    fun SetThreadDpiHostingBehavior(value : Win32cr::UI::HiDpi::DPI_HOSTING_BEHAVIOR) : Win32cr::UI::HiDpi::DPI_HOSTING_BEHAVIOR

    fun GetThreadDpiHostingBehavior : Win32cr::UI::HiDpi::DPI_HOSTING_BEHAVIOR

    fun GetWindowDpiHostingBehavior(hwnd : Win32cr::Foundation::HWND) : Win32cr::UI::HiDpi::DPI_HOSTING_BEHAVIOR

    fun SetProcessDpiAwareness(value : Win32cr::UI::HiDpi::PROCESS_DPI_AWARENESS) : Win32cr::Foundation::HRESULT

    fun GetProcessDpiAwareness(hprocess : Win32cr::Foundation::HANDLE, value : Win32cr::UI::HiDpi::PROCESS_DPI_AWARENESS*) : Win32cr::Foundation::HRESULT

    fun GetDpiForMonitor(hmonitor : Win32cr::Graphics::Gdi::HMONITOR, dpiType : Win32cr::UI::HiDpi::MONITOR_DPI_TYPE, dpiX : UInt32*, dpiY : UInt32*) : Win32cr::Foundation::HRESULT

  end
end