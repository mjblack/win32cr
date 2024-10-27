require "./../foundation.cr"
require "./../graphics/gdi.cr"

module Win32cr::UI::Magnification
  alias MagImageScalingCallback = Proc(Win32cr::Foundation::HWND, Void*, Win32cr::UI::Magnification::MAGIMAGEHEADER, Void*, Win32cr::UI::Magnification::MAGIMAGEHEADER, Win32cr::Foundation::RECT, Win32cr::Foundation::RECT, Win32cr::Graphics::Gdi::HRGN, Win32cr::Foundation::BOOL)*

  WC_MAGNIFIERA = "Magnifier"
  WC_MAGNIFIERW = "Magnifier"
  WC_MAGNIFIER = "Magnifier"
  MS_SHOWMAGNIFIEDCURSOR = 1_i32
  MS_CLIPAROUNDCURSOR = 2_i32
  MS_INVERTCOLORS = 4_i32
  MW_FILTERMODE_EXCLUDE = 0_u32
  MW_FILTERMODE_INCLUDE = 1_u32


  @[Extern]
  record MAGTRANSFORM,
    v : Float32[9]

  @[Extern]
  record MAGIMAGEHEADER,
    width : UInt32,
    height : UInt32,
    format : LibC::GUID,
    stride : UInt32,
    offset : UInt32,
    cbSize : LibC::UIntPtrT

  @[Extern]
  record MAGCOLOREFFECT,
    transform : Float32[25]

  @[Link("magnification")]
  lib C
    fun MagInitialize : Win32cr::Foundation::BOOL

    fun MagUninitialize : Win32cr::Foundation::BOOL

    fun MagSetWindowSource(hwnd : Win32cr::Foundation::HWND, rect : Win32cr::Foundation::RECT) : Win32cr::Foundation::BOOL

    fun MagGetWindowSource(hwnd : Win32cr::Foundation::HWND, pRect : Win32cr::Foundation::RECT*) : Win32cr::Foundation::BOOL

    fun MagSetWindowTransform(hwnd : Win32cr::Foundation::HWND, pTransform : Win32cr::UI::Magnification::MAGTRANSFORM*) : Win32cr::Foundation::BOOL

    fun MagGetWindowTransform(hwnd : Win32cr::Foundation::HWND, pTransform : Win32cr::UI::Magnification::MAGTRANSFORM*) : Win32cr::Foundation::BOOL

    fun MagSetWindowFilterList(hwnd : Win32cr::Foundation::HWND, dwFilterMode : UInt32, count : Int32, pHWND : Win32cr::Foundation::HWND*) : Win32cr::Foundation::BOOL

    fun MagGetWindowFilterList(hwnd : Win32cr::Foundation::HWND, pdwFilterMode : UInt32*, count : Int32, pHWND : Win32cr::Foundation::HWND*) : Int32

    fun MagSetImageScalingCallback(hwnd : Win32cr::Foundation::HWND, callback : Win32cr::UI::Magnification::MagImageScalingCallback) : Win32cr::Foundation::BOOL

    fun MagGetImageScalingCallback(hwnd : Win32cr::Foundation::HWND) : Win32cr::UI::Magnification::MagImageScalingCallback

    fun MagSetColorEffect(hwnd : Win32cr::Foundation::HWND, pEffect : Win32cr::UI::Magnification::MAGCOLOREFFECT*) : Win32cr::Foundation::BOOL

    fun MagGetColorEffect(hwnd : Win32cr::Foundation::HWND, pEffect : Win32cr::UI::Magnification::MAGCOLOREFFECT*) : Win32cr::Foundation::BOOL

    fun MagSetFullscreenTransform(magLevel : Float32, xOffset : Int32, yOffset : Int32) : Win32cr::Foundation::BOOL

    fun MagGetFullscreenTransform(pMagLevel : Float32*, pxOffset : Int32*, pyOffset : Int32*) : Win32cr::Foundation::BOOL

    fun MagSetFullscreenColorEffect(pEffect : Win32cr::UI::Magnification::MAGCOLOREFFECT*) : Win32cr::Foundation::BOOL

    fun MagGetFullscreenColorEffect(pEffect : Win32cr::UI::Magnification::MAGCOLOREFFECT*) : Win32cr::Foundation::BOOL

    fun MagSetInputTransform(fEnabled : Win32cr::Foundation::BOOL, pRectSource : Win32cr::Foundation::RECT*, pRectDest : Win32cr::Foundation::RECT*) : Win32cr::Foundation::BOOL

    fun MagGetInputTransform(pfEnabled : Win32cr::Foundation::BOOL*, pRectSource : Win32cr::Foundation::RECT*, pRectDest : Win32cr::Foundation::RECT*) : Win32cr::Foundation::BOOL

    fun MagShowSystemCursor(fShowCursor : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

  end
end