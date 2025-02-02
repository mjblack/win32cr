require "./../foundation.cr"
require "./../graphics/gdi.cr"

module Win32cr::UI::Magnification
  extend self
  alias MagImageScalingCallback = Proc(Win32cr::Foundation::HWND, Void*, Win32cr::UI::Magnification::MAGIMAGEHEADER, Void*, Win32cr::UI::Magnification::MAGIMAGEHEADER, Win32cr::Foundation::RECT, Win32cr::Foundation::RECT, Win32cr::Graphics::Gdi::HRGN, Win32cr::Foundation::BOOL)

  WC_MAGNIFIERA = "Magnifier"
  WC_MAGNIFIERW = "Magnifier"
  WC_MAGNIFIER = "Magnifier"
  MS_SHOWMAGNIFIEDCURSOR = 1_i32
  MS_CLIPAROUNDCURSOR = 2_i32
  MS_INVERTCOLORS = 4_i32
  MW_FILTERMODE_EXCLUDE = 0_u32
  MW_FILTERMODE_INCLUDE = 1_u32


  @[Extern]
  struct MAGTRANSFORM
    property v : Float32[9]
    def initialize(@v : Float32[9])
    end
  end

  @[Extern]
  struct MAGIMAGEHEADER
    property width : UInt32
    property height : UInt32
    property format : LibC::GUID
    property stride : UInt32
    property offset : UInt32
    property cbSize : LibC::UIntPtrT
    def initialize(@width : UInt32, @height : UInt32, @format : LibC::GUID, @stride : UInt32, @offset : UInt32, @cbSize : LibC::UIntPtrT)
    end
  end

  @[Extern]
  struct MAGCOLOREFFECT
    property transform : Float32[25]
    def initialize(@transform : Float32[25])
    end
  end

  def magInitialize : Win32cr::Foundation::BOOL
    C.MagInitialize
  end

  def magUninitialize : Win32cr::Foundation::BOOL
    C.MagUninitialize
  end

  def magSetWindowSource(hwnd : Win32cr::Foundation::HWND, rect : Win32cr::Foundation::RECT) : Win32cr::Foundation::BOOL
    C.MagSetWindowSource(hwnd, rect)
  end

  def magGetWindowSource(hwnd : Win32cr::Foundation::HWND, pRect : Win32cr::Foundation::RECT*) : Win32cr::Foundation::BOOL
    C.MagGetWindowSource(hwnd, pRect)
  end

  def magSetWindowTransform(hwnd : Win32cr::Foundation::HWND, pTransform : Win32cr::UI::Magnification::MAGTRANSFORM*) : Win32cr::Foundation::BOOL
    C.MagSetWindowTransform(hwnd, pTransform)
  end

  def magGetWindowTransform(hwnd : Win32cr::Foundation::HWND, pTransform : Win32cr::UI::Magnification::MAGTRANSFORM*) : Win32cr::Foundation::BOOL
    C.MagGetWindowTransform(hwnd, pTransform)
  end

  def magSetWindowFilterList(hwnd : Win32cr::Foundation::HWND, dwFilterMode : UInt32, count : Int32, pHWND : Win32cr::Foundation::HWND*) : Win32cr::Foundation::BOOL
    C.MagSetWindowFilterList(hwnd, dwFilterMode, count, pHWND)
  end

  def magGetWindowFilterList(hwnd : Win32cr::Foundation::HWND, pdwFilterMode : UInt32*, count : Int32, pHWND : Win32cr::Foundation::HWND*) : Int32
    C.MagGetWindowFilterList(hwnd, pdwFilterMode, count, pHWND)
  end

  def magSetImageScalingCallback(hwnd : Win32cr::Foundation::HWND, callback : Win32cr::UI::Magnification::MagImageScalingCallback) : Win32cr::Foundation::BOOL
    C.MagSetImageScalingCallback(hwnd, callback)
  end

  def magGetImageScalingCallback(hwnd : Win32cr::Foundation::HWND) : Win32cr::UI::Magnification::MagImageScalingCallback
    C.MagGetImageScalingCallback(hwnd)
  end

  def magSetColorEffect(hwnd : Win32cr::Foundation::HWND, pEffect : Win32cr::UI::Magnification::MAGCOLOREFFECT*) : Win32cr::Foundation::BOOL
    C.MagSetColorEffect(hwnd, pEffect)
  end

  def magGetColorEffect(hwnd : Win32cr::Foundation::HWND, pEffect : Win32cr::UI::Magnification::MAGCOLOREFFECT*) : Win32cr::Foundation::BOOL
    C.MagGetColorEffect(hwnd, pEffect)
  end

  def magSetFullscreenTransform(magLevel : Float32, xOffset : Int32, yOffset : Int32) : Win32cr::Foundation::BOOL
    C.MagSetFullscreenTransform(magLevel, xOffset, yOffset)
  end

  def magGetFullscreenTransform(pMagLevel : Float32*, pxOffset : Int32*, pyOffset : Int32*) : Win32cr::Foundation::BOOL
    C.MagGetFullscreenTransform(pMagLevel, pxOffset, pyOffset)
  end

  def magSetFullscreenColorEffect(pEffect : Win32cr::UI::Magnification::MAGCOLOREFFECT*) : Win32cr::Foundation::BOOL
    C.MagSetFullscreenColorEffect(pEffect)
  end

  def magGetFullscreenColorEffect(pEffect : Win32cr::UI::Magnification::MAGCOLOREFFECT*) : Win32cr::Foundation::BOOL
    C.MagGetFullscreenColorEffect(pEffect)
  end

  def magSetInputTransform(fEnabled : Win32cr::Foundation::BOOL, pRectSource : Win32cr::Foundation::RECT*, pRectDest : Win32cr::Foundation::RECT*) : Win32cr::Foundation::BOOL
    C.MagSetInputTransform(fEnabled, pRectSource, pRectDest)
  end

  def magGetInputTransform(pfEnabled : Win32cr::Foundation::BOOL*, pRectSource : Win32cr::Foundation::RECT*, pRectDest : Win32cr::Foundation::RECT*) : Win32cr::Foundation::BOOL
    C.MagGetInputTransform(pfEnabled, pRectSource, pRectDest)
  end

  def magShowSystemCursor(fShowCursor : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    C.MagShowSystemCursor(fShowCursor)
  end

  @[Link("magnification")]
  lib C
    # :nodoc:
    fun MagInitialize : Win32cr::Foundation::BOOL

    # :nodoc:
    fun MagUninitialize : Win32cr::Foundation::BOOL

    # :nodoc:
    fun MagSetWindowSource(hwnd : Win32cr::Foundation::HWND, rect : Win32cr::Foundation::RECT) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun MagGetWindowSource(hwnd : Win32cr::Foundation::HWND, pRect : Win32cr::Foundation::RECT*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun MagSetWindowTransform(hwnd : Win32cr::Foundation::HWND, pTransform : Win32cr::UI::Magnification::MAGTRANSFORM*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun MagGetWindowTransform(hwnd : Win32cr::Foundation::HWND, pTransform : Win32cr::UI::Magnification::MAGTRANSFORM*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun MagSetWindowFilterList(hwnd : Win32cr::Foundation::HWND, dwFilterMode : UInt32, count : Int32, pHWND : Win32cr::Foundation::HWND*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun MagGetWindowFilterList(hwnd : Win32cr::Foundation::HWND, pdwFilterMode : UInt32*, count : Int32, pHWND : Win32cr::Foundation::HWND*) : Int32

    # :nodoc:
    fun MagSetImageScalingCallback(hwnd : Win32cr::Foundation::HWND, callback : Win32cr::UI::Magnification::MagImageScalingCallback) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun MagGetImageScalingCallback(hwnd : Win32cr::Foundation::HWND) : Win32cr::UI::Magnification::MagImageScalingCallback

    # :nodoc:
    fun MagSetColorEffect(hwnd : Win32cr::Foundation::HWND, pEffect : Win32cr::UI::Magnification::MAGCOLOREFFECT*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun MagGetColorEffect(hwnd : Win32cr::Foundation::HWND, pEffect : Win32cr::UI::Magnification::MAGCOLOREFFECT*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun MagSetFullscreenTransform(magLevel : Float32, xOffset : Int32, yOffset : Int32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun MagGetFullscreenTransform(pMagLevel : Float32*, pxOffset : Int32*, pyOffset : Int32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun MagSetFullscreenColorEffect(pEffect : Win32cr::UI::Magnification::MAGCOLOREFFECT*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun MagGetFullscreenColorEffect(pEffect : Win32cr::UI::Magnification::MAGCOLOREFFECT*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun MagSetInputTransform(fEnabled : Win32cr::Foundation::BOOL, pRectSource : Win32cr::Foundation::RECT*, pRectDest : Win32cr::Foundation::RECT*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun MagGetInputTransform(pfEnabled : Win32cr::Foundation::BOOL*, pRectSource : Win32cr::Foundation::RECT*, pRectDest : Win32cr::Foundation::RECT*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun MagShowSystemCursor(fShowCursor : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

  end
end