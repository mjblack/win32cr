require "../foundation.cr"
require "../graphics/gdi.cr"
require "../ui/controls.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:dwmapi.dll")]
lib LibWin32
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


  enum DWMWINDOWATTRIBUTE : Int32
    DWMWA_NCRENDERING_ENABLED = 1
    DWMWA_NCRENDERING_POLICY = 2
    DWMWA_TRANSITIONS_FORCEDISABLED = 3
    DWMWA_ALLOW_NCPAINT = 4
    DWMWA_CAPTION_BUTTON_BOUNDS = 5
    DWMWA_NONCLIENT_RTL_LAYOUT = 6
    DWMWA_FORCE_ICONIC_REPRESENTATION = 7
    DWMWA_FLIP3D_POLICY = 8
    DWMWA_EXTENDED_FRAME_BOUNDS = 9
    DWMWA_HAS_ICONIC_BITMAP = 10
    DWMWA_DISALLOW_PEEK = 11
    DWMWA_EXCLUDED_FROM_PEEK = 12
    DWMWA_CLOAK = 13
    DWMWA_CLOAKED = 14
    DWMWA_FREEZE_REPRESENTATION = 15
    DWMWA_PASSIVE_UPDATE_MODE = 16
    DWMWA_USE_HOSTBACKDROPBRUSH = 17
    DWMWA_USE_IMMERSIVE_DARK_MODE = 20
    DWMWA_WINDOW_CORNER_PREFERENCE = 33
    DWMWA_BORDER_COLOR = 34
    DWMWA_CAPTION_COLOR = 35
    DWMWA_TEXT_COLOR = 36
    DWMWA_VISIBLE_FRAME_BORDER_THICKNESS = 37
    DWMWA_LAST = 38
  end

  enum DWM_WINDOW_CORNER_PREFERENCE : Int32
    DWMWCP_DEFAULT = 0
    DWMWCP_DONOTROUND = 1
    DWMWCP_ROUND = 2
    DWMWCP_ROUNDSMALL = 3
  end

  enum DWMNCRENDERINGPOLICY : Int32
    DWMNCRP_USEWINDOWSTYLE = 0
    DWMNCRP_DISABLED = 1
    DWMNCRP_ENABLED = 2
    DWMNCRP_LAST = 3
  end

  enum DWMFLIP3DWINDOWPOLICY : Int32
    DWMFLIP3D_DEFAULT = 0
    DWMFLIP3D_EXCLUDEBELOW = 1
    DWMFLIP3D_EXCLUDEABOVE = 2
    DWMFLIP3D_LAST = 3
  end

  enum DWM_SOURCE_FRAME_SAMPLING : Int32
    DWM_SOURCE_FRAME_SAMPLING_POINT = 0
    DWM_SOURCE_FRAME_SAMPLING_COVERAGE = 1
    DWM_SOURCE_FRAME_SAMPLING_LAST = 2
  end

  enum DWMTRANSITION_OWNEDWINDOW_TARGET : Int32
    DWMTRANSITION_OWNEDWINDOW_NULL = -1
    DWMTRANSITION_OWNEDWINDOW_REPOSITION = 0
  end

  enum GESTURE_TYPE : Int32
    GT_PEN_TAP = 0
    GT_PEN_DOUBLETAP = 1
    GT_PEN_RIGHTTAP = 2
    GT_PEN_PRESSANDHOLD = 3
    GT_PEN_PRESSANDHOLDABORT = 4
    GT_TOUCH_TAP = 5
    GT_TOUCH_DOUBLETAP = 6
    GT_TOUCH_RIGHTTAP = 7
    GT_TOUCH_PRESSANDHOLD = 8
    GT_TOUCH_PRESSANDHOLDABORT = 9
    GT_TOUCH_PRESSANDTAP = 10
  end

  enum DWM_SHOWCONTACT : UInt32
    DWMSC_DOWN = 1
    DWMSC_UP = 2
    DWMSC_DRAG = 4
    DWMSC_HOLD = 8
    DWMSC_PENBARREL = 16
    DWMSC_NONE = 0
    DWMSC_ALL = 4294967295
  end

  enum DWM_TAB_WINDOW_REQUIREMENTS : UInt32
    DWMTWR_NONE = 0
    DWMTWR_IMPLEMENTED_BY_SYSTEM = 1
    DWMTWR_WINDOW_RELATIONSHIP = 2
    DWMTWR_WINDOW_STYLES = 4
    DWMTWR_WINDOW_REGION = 8
    DWMTWR_WINDOW_DWM_ATTRIBUTES = 16
    DWMTWR_WINDOW_MARGINS = 32
    DWMTWR_TABBING_ENABLED = 64
    DWMTWR_USER_POLICY = 128
    DWMTWR_GROUP_POLICY = 256
    DWMTWR_APP_COMPAT = 512
  end

  struct DWM_BLURBEHIND
    dw_flags : UInt32
    f_enable : LibC::BOOL
    h_rgn_blur : HRGN
    f_transition_on_maximized : LibC::BOOL
  end
  struct DWM_THUMBNAIL_PROPERTIES
    dw_flags : UInt32
    rc_destination : RECT
    rc_source : RECT
    opacity : UInt8
    f_visible : LibC::BOOL
    f_source_client_area_only : LibC::BOOL
  end
  struct UNSIGNED_RATIO
    ui_numerator : UInt32
    ui_denominator : UInt32
  end
  struct DWM_TIMING_INFO
    cb_size : UInt32
    rate_refresh : UNSIGNED_RATIO
    qpc_refresh_period : UInt64
    rate_compose : UNSIGNED_RATIO
    qpc_v_blank : UInt64
    c_refresh : UInt64
    c_dx_refresh : UInt32
    qpc_compose : UInt64
    c_frame : UInt64
    c_dx_present : UInt32
    c_refresh_frame : UInt64
    c_frame_submitted : UInt64
    c_dx_present_submitted : UInt32
    c_frame_confirmed : UInt64
    c_dx_present_confirmed : UInt32
    c_refresh_confirmed : UInt64
    c_dx_refresh_confirmed : UInt32
    c_frames_late : UInt64
    c_frames_outstanding : UInt32
    c_frame_displayed : UInt64
    qpc_frame_displayed : UInt64
    c_refresh_frame_displayed : UInt64
    c_frame_complete : UInt64
    qpc_frame_complete : UInt64
    c_frame_pending : UInt64
    qpc_frame_pending : UInt64
    c_frames_displayed : UInt64
    c_frames_complete : UInt64
    c_frames_pending : UInt64
    c_frames_available : UInt64
    c_frames_dropped : UInt64
    c_frames_missed : UInt64
    c_refresh_next_displayed : UInt64
    c_refresh_next_presented : UInt64
    c_refreshes_displayed : UInt64
    c_refreshes_presented : UInt64
    c_refresh_started : UInt64
    c_pixels_received : UInt64
    c_pixels_drawn : UInt64
    c_buffers_empty : UInt64
  end
  struct DWM_PRESENT_PARAMETERS
    cb_size : UInt32
    f_queue : LibC::BOOL
    c_refresh_start : UInt64
    c_buffer : UInt32
    f_use_source_rate : LibC::BOOL
    rate_source : UNSIGNED_RATIO
    c_refreshes_per_frame : UInt32
    e_sampling : DWM_SOURCE_FRAME_SAMPLING
  end
  struct MilMatrix3x2D
    s_11 : Float64
    s_12 : Float64
    s_21 : Float64
    s_22 : Float64
    dx : Float64
    dy : Float64
  end


  # Params # hwnd : LibC::HANDLE [In],msg : UInt32 [In],wparam : LibC::UINT_PTR [In],lparam : LPARAM [In],plresult : LRESULT* [In]
  fun DwmDefWindowProc(hwnd : LibC::HANDLE, msg : UInt32, wparam : LibC::UINT_PTR, lparam : LPARAM, plresult : LRESULT*) : LibC::BOOL

  # Params # hwnd : LibC::HANDLE [In],pblurbehind : DWM_BLURBEHIND* [In]
  fun DwmEnableBlurBehindWindow(hwnd : LibC::HANDLE, pblurbehind : DWM_BLURBEHIND*) : HRESULT

  # Params # ucompositionaction : UInt32 [In]
  fun DwmEnableComposition(ucompositionaction : UInt32) : HRESULT

  # Params # fenablemmcss : LibC::BOOL [In]
  fun DwmEnableMMCSS(fenablemmcss : LibC::BOOL) : HRESULT

  # Params # hwnd : LibC::HANDLE [In],pmarinset : MARGINS* [In]
  fun DwmExtendFrameIntoClientArea(hwnd : LibC::HANDLE, pmarinset : MARGINS*) : HRESULT

  # Params # pcrcolorization : UInt32* [In],pfopaqueblend : LibC::BOOL* [In]
  fun DwmGetColorizationColor(pcrcolorization : UInt32*, pfopaqueblend : LibC::BOOL*) : HRESULT

  # Params # hwnd : LibC::HANDLE [In],ptiminginfo : DWM_TIMING_INFO* [In]
  fun DwmGetCompositionTimingInfo(hwnd : LibC::HANDLE, ptiminginfo : DWM_TIMING_INFO*) : HRESULT

  # Params # hwnd : LibC::HANDLE [In],dwattribute : DWMWINDOWATTRIBUTE [In],pvattribute : Void* [In],cbattribute : UInt32 [In]
  fun DwmGetWindowAttribute(hwnd : LibC::HANDLE, dwattribute : DWMWINDOWATTRIBUTE, pvattribute : Void*, cbattribute : UInt32) : HRESULT

  # Params # pfenabled : LibC::BOOL* [In]
  fun DwmIsCompositionEnabled(pfenabled : LibC::BOOL*) : HRESULT

  # Params # hwnd : LibC::HANDLE [In],crefreshes : Int32 [In],frelative : LibC::BOOL [In]
  fun DwmModifyPreviousDxFrameDuration(hwnd : LibC::HANDLE, crefreshes : Int32, frelative : LibC::BOOL) : HRESULT

  # Params # hthumbnail : LibC::IntPtrT [In],psize : SIZE* [In]
  fun DwmQueryThumbnailSourceSize(hthumbnail : LibC::IntPtrT, psize : SIZE*) : HRESULT

  # Params # hwnddestination : LibC::HANDLE [In],hwndsource : LibC::HANDLE [In],phthumbnailid : LibC::IntPtrT* [In]
  fun DwmRegisterThumbnail(hwnddestination : LibC::HANDLE, hwndsource : LibC::HANDLE, phthumbnailid : LibC::IntPtrT*) : HRESULT

  # Params # hwnd : LibC::HANDLE [In],crefreshes : Int32 [In]
  fun DwmSetDxFrameDuration(hwnd : LibC::HANDLE, crefreshes : Int32) : HRESULT

  # Params # hwnd : LibC::HANDLE [In],ppresentparams : DWM_PRESENT_PARAMETERS* [In]
  fun DwmSetPresentParameters(hwnd : LibC::HANDLE, ppresentparams : DWM_PRESENT_PARAMETERS*) : HRESULT

  # Params # hwnd : LibC::HANDLE [In],dwattribute : DWMWINDOWATTRIBUTE [In],pvattribute : Void* [In],cbattribute : UInt32 [In]
  fun DwmSetWindowAttribute(hwnd : LibC::HANDLE, dwattribute : DWMWINDOWATTRIBUTE, pvattribute : Void*, cbattribute : UInt32) : HRESULT

  # Params # hthumbnailid : LibC::IntPtrT [In]
  fun DwmUnregisterThumbnail(hthumbnailid : LibC::IntPtrT) : HRESULT

  # Params # hthumbnailid : LibC::IntPtrT [In],ptnproperties : DWM_THUMBNAIL_PROPERTIES* [In]
  fun DwmUpdateThumbnailProperties(hthumbnailid : LibC::IntPtrT, ptnproperties : DWM_THUMBNAIL_PROPERTIES*) : HRESULT

  # Params # hwnd : LibC::HANDLE [In],hbmp : HBITMAP [In],dwsitflags : UInt32 [In]
  fun DwmSetIconicThumbnail(hwnd : LibC::HANDLE, hbmp : HBITMAP, dwsitflags : UInt32) : HRESULT

  # Params # hwnd : LibC::HANDLE [In],hbmp : HBITMAP [In],pptclient : POINT* [In],dwsitflags : UInt32 [In]
  fun DwmSetIconicLivePreviewBitmap(hwnd : LibC::HANDLE, hbmp : HBITMAP, pptclient : POINT*, dwsitflags : UInt32) : HRESULT

  # Params # hwnd : LibC::HANDLE [In]
  fun DwmInvalidateIconicBitmaps(hwnd : LibC::HANDLE) : HRESULT

  # Params # hwnd : LibC::HANDLE [In]
  fun DwmAttachMilContent(hwnd : LibC::HANDLE) : HRESULT

  # Params # hwnd : LibC::HANDLE [In]
  fun DwmDetachMilContent(hwnd : LibC::HANDLE) : HRESULT

  # Params # 
  fun DwmFlush : HRESULT

  # Params # uindex : UInt32 [In],ptransform : MilMatrix3x2D* [In]
  fun DwmGetGraphicsStreamTransformHint(uindex : UInt32, ptransform : MilMatrix3x2D*) : HRESULT

  # Params # uindex : UInt32 [In],pclientuuid : Guid* [In]
  fun DwmGetGraphicsStreamClient(uindex : UInt32, pclientuuid : Guid*) : HRESULT

  # Params # pfisremoting : LibC::BOOL* [In],pfisconnected : LibC::BOOL* [In],pdwgeneration : UInt32* [In]
  fun DwmGetTransportAttributes(pfisremoting : LibC::BOOL*, pfisconnected : LibC::BOOL*, pdwgeneration : UInt32*) : HRESULT

  # Params # hwnd : LibC::HANDLE [In],target : DWMTRANSITION_OWNEDWINDOW_TARGET [In]
  fun DwmTransitionOwnedWindow(hwnd : LibC::HANDLE, target : DWMTRANSITION_OWNEDWINDOW_TARGET) : HRESULT

  # Params # gt : GESTURE_TYPE [In],ccontacts : UInt32 [In],pdwpointerid : UInt32* [In],ppoints : POINT* [In]
  fun DwmRenderGesture(gt : GESTURE_TYPE, ccontacts : UInt32, pdwpointerid : UInt32*, ppoints : POINT*) : HRESULT

  # Params # dwpointerid : UInt32 [In],fenable : LibC::BOOL [In],pttether : POINT [In]
  fun DwmTetherContact(dwpointerid : UInt32, fenable : LibC::BOOL, pttether : POINT) : HRESULT

  # Params # dwpointerid : UInt32 [In],eshowcontact : DWM_SHOWCONTACT [In]
  fun DwmShowContact(dwpointerid : UInt32, eshowcontact : DWM_SHOWCONTACT) : HRESULT

  # Params # appwindow : LibC::HANDLE [In],value : DWM_TAB_WINDOW_REQUIREMENTS* [In]
  fun DwmGetUnmetTabRequirements(appwindow : LibC::HANDLE, value : DWM_TAB_WINDOW_REQUIREMENTS*) : HRESULT
end
