require "./../foundation.cr"
require "./gdi.cr"
require "./../ui/controls.cr"

module Win32cr::Graphics::Dwm
  extend self
  DWM_BB_ENABLE = 1_u32
  DWM_BB_BLURREGION = 2_u32
  DWM_BB_TRANSITIONONMAXIMIZED = 4_u32
  DWMWA_COLOR_DEFAULT = 4294967295_u32
  DWMWA_COLOR_NONE = 4294967294_u32
  DWM_CLOAKED_APP = 1_u32
  DWM_CLOAKED_SHELL = 2_u32
  DWM_CLOAKED_INHERITED = 4_u32
  DWM_TNP_RECTDESTINATION = 1_u32
  DWM_TNP_RECTSOURCE = 2_u32
  DWM_TNP_OPACITY = 4_u32
  DWM_TNP_VISIBLE = 8_u32
  DWM_TNP_SOURCECLIENTAREAONLY = 16_u32
  DWM_FRAME_DURATION_DEFAULT = -1_i32
  DWM_EC_DISABLECOMPOSITION = 0_u32
  DWM_EC_ENABLECOMPOSITION = 1_u32
  DWM_SIT_DISPLAYFRAME = 1_u32
  C_dwmmaxqueuedbuffers = 8_u32
  C_dwmmaxmonitors = 16_u32
  C_dwmmaxadapters = 16_u32

  enum DWMWINDOWATTRIBUTE
    DWMWA_NCRENDERING_ENABLED = 1_i32
    DWMWA_NCRENDERING_POLICY = 2_i32
    DWMWA_TRANSITIONS_FORCEDISABLED = 3_i32
    DWMWA_ALLOW_NCPAINT = 4_i32
    DWMWA_CAPTION_BUTTON_BOUNDS = 5_i32
    DWMWA_NONCLIENT_RTL_LAYOUT = 6_i32
    DWMWA_FORCE_ICONIC_REPRESENTATION = 7_i32
    DWMWA_FLIP3D_POLICY = 8_i32
    DWMWA_EXTENDED_FRAME_BOUNDS = 9_i32
    DWMWA_HAS_ICONIC_BITMAP = 10_i32
    DWMWA_DISALLOW_PEEK = 11_i32
    DWMWA_EXCLUDED_FROM_PEEK = 12_i32
    DWMWA_CLOAK = 13_i32
    DWMWA_CLOAKED = 14_i32
    DWMWA_FREEZE_REPRESENTATION = 15_i32
    DWMWA_PASSIVE_UPDATE_MODE = 16_i32
    DWMWA_USE_HOSTBACKDROPBRUSH = 17_i32
    DWMWA_USE_IMMERSIVE_DARK_MODE = 20_i32
    DWMWA_WINDOW_CORNER_PREFERENCE = 33_i32
    DWMWA_BORDER_COLOR = 34_i32
    DWMWA_CAPTION_COLOR = 35_i32
    DWMWA_TEXT_COLOR = 36_i32
    DWMWA_VISIBLE_FRAME_BORDER_THICKNESS = 37_i32
    DWMWA_LAST = 38_i32
  end
  enum DWM_WINDOW_CORNER_PREFERENCE
    DWMWCP_DEFAULT = 0_i32
    DWMWCP_DONOTROUND = 1_i32
    DWMWCP_ROUND = 2_i32
    DWMWCP_ROUNDSMALL = 3_i32
  end
  enum DWMNCRENDERINGPOLICY
    DWMNCRP_USEWINDOWSTYLE = 0_i32
    DWMNCRP_DISABLED = 1_i32
    DWMNCRP_ENABLED = 2_i32
    DWMNCRP_LAST = 3_i32
  end
  enum DWMFLIP3DWINDOWPOLICY
    DWMFLIP3D_DEFAULT = 0_i32
    DWMFLIP3D_EXCLUDEBELOW = 1_i32
    DWMFLIP3D_EXCLUDEABOVE = 2_i32
    DWMFLIP3D_LAST = 3_i32
  end
  enum DWM_SOURCE_FRAME_SAMPLING
    DWM_SOURCE_FRAME_SAMPLING_POINT = 0_i32
    DWM_SOURCE_FRAME_SAMPLING_COVERAGE = 1_i32
    DWM_SOURCE_FRAME_SAMPLING_LAST = 2_i32
  end
  enum DWMTRANSITION_OWNEDWINDOW_TARGET
    DWMTRANSITION_OWNEDWINDOW_NULL = -1_i32
    DWMTRANSITION_OWNEDWINDOW_REPOSITION = 0_i32
  end
  enum GESTURE_TYPE
    GT_PEN_TAP = 0_i32
    GT_PEN_DOUBLETAP = 1_i32
    GT_PEN_RIGHTTAP = 2_i32
    GT_PEN_PRESSANDHOLD = 3_i32
    GT_PEN_PRESSANDHOLDABORT = 4_i32
    GT_TOUCH_TAP = 5_i32
    GT_TOUCH_DOUBLETAP = 6_i32
    GT_TOUCH_RIGHTTAP = 7_i32
    GT_TOUCH_PRESSANDHOLD = 8_i32
    GT_TOUCH_PRESSANDHOLDABORT = 9_i32
    GT_TOUCH_PRESSANDTAP = 10_i32
  end
  @[Flags]
  enum DWM_SHOWCONTACT : UInt32
    DWMSC_DOWN = 1_u32
    DWMSC_UP = 2_u32
    DWMSC_DRAG = 4_u32
    DWMSC_HOLD = 8_u32
    DWMSC_PENBARREL = 16_u32
    DWMSC_NONE = 0_u32
    DWMSC_ALL = 4294967295_u32
  end
  @[Flags]
  enum DWM_TAB_WINDOW_REQUIREMENTS : UInt32
    DWMTWR_NONE = 0_u32
    DWMTWR_IMPLEMENTED_BY_SYSTEM = 1_u32
    DWMTWR_WINDOW_RELATIONSHIP = 2_u32
    DWMTWR_WINDOW_STYLES = 4_u32
    DWMTWR_WINDOW_REGION = 8_u32
    DWMTWR_WINDOW_DWM_ATTRIBUTES = 16_u32
    DWMTWR_WINDOW_MARGINS = 32_u32
    DWMTWR_TABBING_ENABLED = 64_u32
    DWMTWR_USER_POLICY = 128_u32
    DWMTWR_GROUP_POLICY = 256_u32
    DWMTWR_APP_COMPAT = 512_u32
  end

  @[Extern]
  struct DWM_BLURBEHIND
    property dwFlags : UInt32
    property fEnable : Win32cr::Foundation::BOOL
    property hRgnBlur : Win32cr::Graphics::Gdi::HRGN
    property fTransitionOnMaximized : Win32cr::Foundation::BOOL
    def initialize(@dwFlags : UInt32, @fEnable : Win32cr::Foundation::BOOL, @hRgnBlur : Win32cr::Graphics::Gdi::HRGN, @fTransitionOnMaximized : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct DWM_THUMBNAIL_PROPERTIES
    property dwFlags : UInt32
    property rcDestination : Win32cr::Foundation::RECT
    property rcSource : Win32cr::Foundation::RECT
    property opacity : UInt8
    property fVisible : Win32cr::Foundation::BOOL
    property fSourceClientAreaOnly : Win32cr::Foundation::BOOL
    def initialize(@dwFlags : UInt32, @rcDestination : Win32cr::Foundation::RECT, @rcSource : Win32cr::Foundation::RECT, @opacity : UInt8, @fVisible : Win32cr::Foundation::BOOL, @fSourceClientAreaOnly : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct UNSIGNED_RATIO
    property uiNumerator : UInt32
    property uiDenominator : UInt32
    def initialize(@uiNumerator : UInt32, @uiDenominator : UInt32)
    end
  end

  @[Extern]
  struct DWM_TIMING_INFO
    property cbSize : UInt32
    property rateRefresh : Win32cr::Graphics::Dwm::UNSIGNED_RATIO
    property qpcRefreshPeriod : UInt64
    property rateCompose : Win32cr::Graphics::Dwm::UNSIGNED_RATIO
    property qpcVBlank : UInt64
    property cRefresh : UInt64
    property cDXRefresh : UInt32
    property qpcCompose : UInt64
    property cFrame : UInt64
    property cDXPresent : UInt32
    property cRefreshFrame : UInt64
    property cFrameSubmitted : UInt64
    property cDXPresentSubmitted : UInt32
    property cFrameConfirmed : UInt64
    property cDXPresentConfirmed : UInt32
    property cRefreshConfirmed : UInt64
    property cDXRefreshConfirmed : UInt32
    property cFramesLate : UInt64
    property cFramesOutstanding : UInt32
    property cFrameDisplayed : UInt64
    property qpcFrameDisplayed : UInt64
    property cRefreshFrameDisplayed : UInt64
    property cFrameComplete : UInt64
    property qpcFrameComplete : UInt64
    property cFramePending : UInt64
    property qpcFramePending : UInt64
    property cFramesDisplayed : UInt64
    property cFramesComplete : UInt64
    property cFramesPending : UInt64
    property cFramesAvailable : UInt64
    property cFramesDropped : UInt64
    property cFramesMissed : UInt64
    property cRefreshNextDisplayed : UInt64
    property cRefreshNextPresented : UInt64
    property cRefreshesDisplayed : UInt64
    property cRefreshesPresented : UInt64
    property cRefreshStarted : UInt64
    property cPixelsReceived : UInt64
    property cPixelsDrawn : UInt64
    property cBuffersEmpty : UInt64
    def initialize(@cbSize : UInt32, @rateRefresh : Win32cr::Graphics::Dwm::UNSIGNED_RATIO, @qpcRefreshPeriod : UInt64, @rateCompose : Win32cr::Graphics::Dwm::UNSIGNED_RATIO, @qpcVBlank : UInt64, @cRefresh : UInt64, @cDXRefresh : UInt32, @qpcCompose : UInt64, @cFrame : UInt64, @cDXPresent : UInt32, @cRefreshFrame : UInt64, @cFrameSubmitted : UInt64, @cDXPresentSubmitted : UInt32, @cFrameConfirmed : UInt64, @cDXPresentConfirmed : UInt32, @cRefreshConfirmed : UInt64, @cDXRefreshConfirmed : UInt32, @cFramesLate : UInt64, @cFramesOutstanding : UInt32, @cFrameDisplayed : UInt64, @qpcFrameDisplayed : UInt64, @cRefreshFrameDisplayed : UInt64, @cFrameComplete : UInt64, @qpcFrameComplete : UInt64, @cFramePending : UInt64, @qpcFramePending : UInt64, @cFramesDisplayed : UInt64, @cFramesComplete : UInt64, @cFramesPending : UInt64, @cFramesAvailable : UInt64, @cFramesDropped : UInt64, @cFramesMissed : UInt64, @cRefreshNextDisplayed : UInt64, @cRefreshNextPresented : UInt64, @cRefreshesDisplayed : UInt64, @cRefreshesPresented : UInt64, @cRefreshStarted : UInt64, @cPixelsReceived : UInt64, @cPixelsDrawn : UInt64, @cBuffersEmpty : UInt64)
    end
  end

  @[Extern]
  struct DWM_PRESENT_PARAMETERS
    property cbSize : UInt32
    property fQueue : Win32cr::Foundation::BOOL
    property cRefreshStart : UInt64
    property cBuffer : UInt32
    property fUseSourceRate : Win32cr::Foundation::BOOL
    property rateSource : Win32cr::Graphics::Dwm::UNSIGNED_RATIO
    property cRefreshesPerFrame : UInt32
    property eSampling : Win32cr::Graphics::Dwm::DWM_SOURCE_FRAME_SAMPLING
    def initialize(@cbSize : UInt32, @fQueue : Win32cr::Foundation::BOOL, @cRefreshStart : UInt64, @cBuffer : UInt32, @fUseSourceRate : Win32cr::Foundation::BOOL, @rateSource : Win32cr::Graphics::Dwm::UNSIGNED_RATIO, @cRefreshesPerFrame : UInt32, @eSampling : Win32cr::Graphics::Dwm::DWM_SOURCE_FRAME_SAMPLING)
    end
  end

  @[Extern]
  struct MilMatrix3x2D
    property s_11 : Float64
    property s_12 : Float64
    property s_21 : Float64
    property s_22 : Float64
    property dx : Float64
    property dy : Float64
    def initialize(@s_11 : Float64, @s_12 : Float64, @s_21 : Float64, @s_22 : Float64, @dx : Float64, @dy : Float64)
    end
  end

  def dwmDefWindowProc(hWnd : Win32cr::Foundation::HWND, msg : UInt32, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM, plResult : Win32cr::Foundation::LRESULT*) : Win32cr::Foundation::BOOL
    C.DwmDefWindowProc(hWnd, msg, wParam, lParam, plResult)
  end

  def dwmEnableBlurBehindWindow(hWnd : Win32cr::Foundation::HWND, pBlurBehind : Win32cr::Graphics::Dwm::DWM_BLURBEHIND*) : Win32cr::Foundation::HRESULT
    C.DwmEnableBlurBehindWindow(hWnd, pBlurBehind)
  end

  def dwmEnableComposition(uCompositionAction : UInt32) : Win32cr::Foundation::HRESULT
    C.DwmEnableComposition(uCompositionAction)
  end

  def dwmEnableMMCSS(fEnableMMCSS : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
    C.DwmEnableMMCSS(fEnableMMCSS)
  end

  def dwmExtendFrameIntoClientArea(hWnd : Win32cr::Foundation::HWND, pMarInset : Win32cr::UI::Controls::MARGINS*) : Win32cr::Foundation::HRESULT
    C.DwmExtendFrameIntoClientArea(hWnd, pMarInset)
  end

  def dwmGetColorizationColor(pcrColorization : UInt32*, pfOpaqueBlend : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    C.DwmGetColorizationColor(pcrColorization, pfOpaqueBlend)
  end

  def dwmGetCompositionTimingInfo(hwnd : Win32cr::Foundation::HWND, pTimingInfo : Win32cr::Graphics::Dwm::DWM_TIMING_INFO*) : Win32cr::Foundation::HRESULT
    C.DwmGetCompositionTimingInfo(hwnd, pTimingInfo)
  end

  def dwmGetWindowAttribute(hwnd : Win32cr::Foundation::HWND, dwAttribute : Win32cr::Graphics::Dwm::DWMWINDOWATTRIBUTE, pvAttribute : Void*, cbAttribute : UInt32) : Win32cr::Foundation::HRESULT
    C.DwmGetWindowAttribute(hwnd, dwAttribute, pvAttribute, cbAttribute)
  end

  def dwmIsCompositionEnabled(pfEnabled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    C.DwmIsCompositionEnabled(pfEnabled)
  end

  def dwmModifyPreviousDxFrameDuration(hwnd : Win32cr::Foundation::HWND, cRefreshes : Int32, fRelative : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
    C.DwmModifyPreviousDxFrameDuration(hwnd, cRefreshes, fRelative)
  end

  def dwmQueryThumbnailSourceSize(hThumbnail : LibC::IntPtrT, pSize : Win32cr::Foundation::SIZE*) : Win32cr::Foundation::HRESULT
    C.DwmQueryThumbnailSourceSize(hThumbnail, pSize)
  end

  def dwmRegisterThumbnail(hwndDestination : Win32cr::Foundation::HWND, hwndSource : Win32cr::Foundation::HWND, phThumbnailId : LibC::IntPtrT*) : Win32cr::Foundation::HRESULT
    C.DwmRegisterThumbnail(hwndDestination, hwndSource, phThumbnailId)
  end

  def dwmSetDxFrameDuration(hwnd : Win32cr::Foundation::HWND, cRefreshes : Int32) : Win32cr::Foundation::HRESULT
    C.DwmSetDxFrameDuration(hwnd, cRefreshes)
  end

  def dwmSetPresentParameters(hwnd : Win32cr::Foundation::HWND, pPresentParams : Win32cr::Graphics::Dwm::DWM_PRESENT_PARAMETERS*) : Win32cr::Foundation::HRESULT
    C.DwmSetPresentParameters(hwnd, pPresentParams)
  end

  def dwmSetWindowAttribute(hwnd : Win32cr::Foundation::HWND, dwAttribute : Win32cr::Graphics::Dwm::DWMWINDOWATTRIBUTE, pvAttribute : Void*, cbAttribute : UInt32) : Win32cr::Foundation::HRESULT
    C.DwmSetWindowAttribute(hwnd, dwAttribute, pvAttribute, cbAttribute)
  end

  def dwmUnregisterThumbnail(hThumbnailId : LibC::IntPtrT) : Win32cr::Foundation::HRESULT
    C.DwmUnregisterThumbnail(hThumbnailId)
  end

  def dwmUpdateThumbnailProperties(hThumbnailId : LibC::IntPtrT, ptnProperties : Win32cr::Graphics::Dwm::DWM_THUMBNAIL_PROPERTIES*) : Win32cr::Foundation::HRESULT
    C.DwmUpdateThumbnailProperties(hThumbnailId, ptnProperties)
  end

  def dwmSetIconicThumbnail(hwnd : Win32cr::Foundation::HWND, hbmp : Win32cr::Graphics::Gdi::HBITMAP, dwSITFlags : UInt32) : Win32cr::Foundation::HRESULT
    C.DwmSetIconicThumbnail(hwnd, hbmp, dwSITFlags)
  end

  def dwmSetIconicLivePreviewBitmap(hwnd : Win32cr::Foundation::HWND, hbmp : Win32cr::Graphics::Gdi::HBITMAP, pptClient : Win32cr::Foundation::POINT*, dwSITFlags : UInt32) : Win32cr::Foundation::HRESULT
    C.DwmSetIconicLivePreviewBitmap(hwnd, hbmp, pptClient, dwSITFlags)
  end

  def dwmInvalidateIconicBitmaps(hwnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
    C.DwmInvalidateIconicBitmaps(hwnd)
  end

  def dwmAttachMilContent(hwnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
    C.DwmAttachMilContent(hwnd)
  end

  def dwmDetachMilContent(hwnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
    C.DwmDetachMilContent(hwnd)
  end

  def dwmFlush : Win32cr::Foundation::HRESULT
    C.DwmFlush
  end

  def dwmGetGraphicsStreamTransformHint(uIndex : UInt32, pTransform : Win32cr::Graphics::Dwm::MilMatrix3x2D*) : Win32cr::Foundation::HRESULT
    C.DwmGetGraphicsStreamTransformHint(uIndex, pTransform)
  end

  def dwmGetGraphicsStreamClient(uIndex : UInt32, pClientUuid : LibC::GUID*) : Win32cr::Foundation::HRESULT
    C.DwmGetGraphicsStreamClient(uIndex, pClientUuid)
  end

  def dwmGetTransportAttributes(pfIsRemoting : Win32cr::Foundation::BOOL*, pfIsConnected : Win32cr::Foundation::BOOL*, pDwGeneration : UInt32*) : Win32cr::Foundation::HRESULT
    C.DwmGetTransportAttributes(pfIsRemoting, pfIsConnected, pDwGeneration)
  end

  def dwmTransitionOwnedWindow(hwnd : Win32cr::Foundation::HWND, target : Win32cr::Graphics::Dwm::DWMTRANSITION_OWNEDWINDOW_TARGET) : Win32cr::Foundation::HRESULT
    C.DwmTransitionOwnedWindow(hwnd, target)
  end

  def dwmRenderGesture(gt : Win32cr::Graphics::Dwm::GESTURE_TYPE, cContacts : UInt32, pdwPointerID : UInt32*, pPoints : Win32cr::Foundation::POINT*) : Win32cr::Foundation::HRESULT
    C.DwmRenderGesture(gt, cContacts, pdwPointerID, pPoints)
  end

  def dwmTetherContact(dwPointerID : UInt32, fEnable : Win32cr::Foundation::BOOL, ptTether : Win32cr::Foundation::POINT) : Win32cr::Foundation::HRESULT
    C.DwmTetherContact(dwPointerID, fEnable, ptTether)
  end

  def dwmShowContact(dwPointerID : UInt32, eShowContact : Win32cr::Graphics::Dwm::DWM_SHOWCONTACT) : Win32cr::Foundation::HRESULT
    C.DwmShowContact(dwPointerID, eShowContact)
  end

  def dwmGetUnmetTabRequirements(appWindow : Win32cr::Foundation::HWND, value : Win32cr::Graphics::Dwm::DWM_TAB_WINDOW_REQUIREMENTS*) : Win32cr::Foundation::HRESULT
    C.DwmGetUnmetTabRequirements(appWindow, value)
  end

  @[Link("dwmapi")]
  lib C
    # :nodoc:
    fun DwmDefWindowProc(hWnd : Win32cr::Foundation::HWND, msg : UInt32, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM, plResult : Win32cr::Foundation::LRESULT*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DwmEnableBlurBehindWindow(hWnd : Win32cr::Foundation::HWND, pBlurBehind : Win32cr::Graphics::Dwm::DWM_BLURBEHIND*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DwmEnableComposition(uCompositionAction : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DwmEnableMMCSS(fEnableMMCSS : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DwmExtendFrameIntoClientArea(hWnd : Win32cr::Foundation::HWND, pMarInset : Win32cr::UI::Controls::MARGINS*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DwmGetColorizationColor(pcrColorization : UInt32*, pfOpaqueBlend : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DwmGetCompositionTimingInfo(hwnd : Win32cr::Foundation::HWND, pTimingInfo : Win32cr::Graphics::Dwm::DWM_TIMING_INFO*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DwmGetWindowAttribute(hwnd : Win32cr::Foundation::HWND, dwAttribute : Win32cr::Graphics::Dwm::DWMWINDOWATTRIBUTE, pvAttribute : Void*, cbAttribute : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DwmIsCompositionEnabled(pfEnabled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DwmModifyPreviousDxFrameDuration(hwnd : Win32cr::Foundation::HWND, cRefreshes : Int32, fRelative : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DwmQueryThumbnailSourceSize(hThumbnail : LibC::IntPtrT, pSize : Win32cr::Foundation::SIZE*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DwmRegisterThumbnail(hwndDestination : Win32cr::Foundation::HWND, hwndSource : Win32cr::Foundation::HWND, phThumbnailId : LibC::IntPtrT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DwmSetDxFrameDuration(hwnd : Win32cr::Foundation::HWND, cRefreshes : Int32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DwmSetPresentParameters(hwnd : Win32cr::Foundation::HWND, pPresentParams : Win32cr::Graphics::Dwm::DWM_PRESENT_PARAMETERS*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DwmSetWindowAttribute(hwnd : Win32cr::Foundation::HWND, dwAttribute : Win32cr::Graphics::Dwm::DWMWINDOWATTRIBUTE, pvAttribute : Void*, cbAttribute : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DwmUnregisterThumbnail(hThumbnailId : LibC::IntPtrT) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DwmUpdateThumbnailProperties(hThumbnailId : LibC::IntPtrT, ptnProperties : Win32cr::Graphics::Dwm::DWM_THUMBNAIL_PROPERTIES*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DwmSetIconicThumbnail(hwnd : Win32cr::Foundation::HWND, hbmp : Win32cr::Graphics::Gdi::HBITMAP, dwSITFlags : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DwmSetIconicLivePreviewBitmap(hwnd : Win32cr::Foundation::HWND, hbmp : Win32cr::Graphics::Gdi::HBITMAP, pptClient : Win32cr::Foundation::POINT*, dwSITFlags : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DwmInvalidateIconicBitmaps(hwnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DwmAttachMilContent(hwnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DwmDetachMilContent(hwnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DwmFlush : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DwmGetGraphicsStreamTransformHint(uIndex : UInt32, pTransform : Win32cr::Graphics::Dwm::MilMatrix3x2D*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DwmGetGraphicsStreamClient(uIndex : UInt32, pClientUuid : LibC::GUID*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DwmGetTransportAttributes(pfIsRemoting : Win32cr::Foundation::BOOL*, pfIsConnected : Win32cr::Foundation::BOOL*, pDwGeneration : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DwmTransitionOwnedWindow(hwnd : Win32cr::Foundation::HWND, target : Win32cr::Graphics::Dwm::DWMTRANSITION_OWNEDWINDOW_TARGET) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DwmRenderGesture(gt : Win32cr::Graphics::Dwm::GESTURE_TYPE, cContacts : UInt32, pdwPointerID : UInt32*, pPoints : Win32cr::Foundation::POINT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DwmTetherContact(dwPointerID : UInt32, fEnable : Win32cr::Foundation::BOOL, ptTether : Win32cr::Foundation::POINT) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DwmShowContact(dwPointerID : UInt32, eShowContact : Win32cr::Graphics::Dwm::DWM_SHOWCONTACT) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DwmGetUnmetTabRequirements(appWindow : Win32cr::Foundation::HWND, value : Win32cr::Graphics::Dwm::DWM_TAB_WINDOW_REQUIREMENTS*) : Win32cr::Foundation::HRESULT

  end
end