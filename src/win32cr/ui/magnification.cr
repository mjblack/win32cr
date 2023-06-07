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
@[Link(ldflags: "/DELAYLOAD:magnification.dll")]
{% else %}
@[Link("magnification")]
{% end %}
lib LibWin32
  MS_SHOWMAGNIFIEDCURSOR = 1_i32
  MS_CLIPAROUNDCURSOR = 2_i32
  MS_INVERTCOLORS = 4_i32
  MW_FILTERMODE_EXCLUDE = 0_u32
  MW_FILTERMODE_INCLUDE = 1_u32

  alias MagImageScalingCallback = Proc(LibC::HANDLE, Void*, MAGIMAGEHEADER, Void*, MAGIMAGEHEADER, RECT, RECT, HRGN, LibC::BOOL)

  struct MAGTRANSFORM
    v : Float32[9]*
  end
  struct MAGIMAGEHEADER
    width : UInt32
    height : UInt32
    format : Guid
    stride : UInt32
    offset : UInt32
    cb_size : LibC::UINT_PTR
  end
  struct MAGCOLOREFFECT
    transform : Float32[25]*
  end


  # Params # 
  fun MagInitialize : LibC::BOOL

  # Params # 
  fun MagUninitialize : LibC::BOOL

  # Params # hwnd : LibC::HANDLE [In],rect : RECT [In]
  fun MagSetWindowSource(hwnd : LibC::HANDLE, rect : RECT) : LibC::BOOL

  # Params # hwnd : LibC::HANDLE [In],prect : RECT* [In]
  fun MagGetWindowSource(hwnd : LibC::HANDLE, prect : RECT*) : LibC::BOOL

  # Params # hwnd : LibC::HANDLE [In],ptransform : MAGTRANSFORM* [In]
  fun MagSetWindowTransform(hwnd : LibC::HANDLE, ptransform : MAGTRANSFORM*) : LibC::BOOL

  # Params # hwnd : LibC::HANDLE [In],ptransform : MAGTRANSFORM* [In]
  fun MagGetWindowTransform(hwnd : LibC::HANDLE, ptransform : MAGTRANSFORM*) : LibC::BOOL

  # Params # hwnd : LibC::HANDLE [In],dwfiltermode : UInt32 [In],count : Int32 [In],phwnd : HANDLE* [In]
  fun MagSetWindowFilterList(hwnd : LibC::HANDLE, dwfiltermode : UInt32, count : Int32, phwnd : HANDLE*) : LibC::BOOL

  # Params # hwnd : LibC::HANDLE [In],pdwfiltermode : UInt32* [In],count : Int32 [In],phwnd : HANDLE* [In]
  fun MagGetWindowFilterList(hwnd : LibC::HANDLE, pdwfiltermode : UInt32*, count : Int32, phwnd : HANDLE*) : Int32

  # Params # hwnd : LibC::HANDLE [In],callback : MagImageScalingCallback [In]
  fun MagSetImageScalingCallback(hwnd : LibC::HANDLE, callback : MagImageScalingCallback) : LibC::BOOL

  # Params # hwnd : LibC::HANDLE [In]
  fun MagGetImageScalingCallback(hwnd : LibC::HANDLE) : MagImageScalingCallback

  # Params # hwnd : LibC::HANDLE [In],peffect : MAGCOLOREFFECT* [In]
  fun MagSetColorEffect(hwnd : LibC::HANDLE, peffect : MAGCOLOREFFECT*) : LibC::BOOL

  # Params # hwnd : LibC::HANDLE [In],peffect : MAGCOLOREFFECT* [In]
  fun MagGetColorEffect(hwnd : LibC::HANDLE, peffect : MAGCOLOREFFECT*) : LibC::BOOL

  # Params # maglevel : Float32 [In],xoffset : Int32 [In],yoffset : Int32 [In]
  fun MagSetFullscreenTransform(maglevel : Float32, xoffset : Int32, yoffset : Int32) : LibC::BOOL

  # Params # pmaglevel : Float32* [In],pxoffset : Int32* [In],pyoffset : Int32* [In]
  fun MagGetFullscreenTransform(pmaglevel : Float32*, pxoffset : Int32*, pyoffset : Int32*) : LibC::BOOL

  # Params # peffect : MAGCOLOREFFECT* [In]
  fun MagSetFullscreenColorEffect(peffect : MAGCOLOREFFECT*) : LibC::BOOL

  # Params # peffect : MAGCOLOREFFECT* [In]
  fun MagGetFullscreenColorEffect(peffect : MAGCOLOREFFECT*) : LibC::BOOL

  # Params # fenabled : LibC::BOOL [In],prectsource : RECT* [In],prectdest : RECT* [In]
  fun MagSetInputTransform(fenabled : LibC::BOOL, prectsource : RECT*, prectdest : RECT*) : LibC::BOOL

  # Params # pfenabled : LibC::BOOL* [In],prectsource : RECT* [In],prectdest : RECT* [In]
  fun MagGetInputTransform(pfenabled : LibC::BOOL*, prectsource : RECT*, prectdest : RECT*) : LibC::BOOL

  # Params # fshowcursor : LibC::BOOL [In]
  fun MagShowSystemCursor(fshowcursor : LibC::BOOL) : LibC::BOOL
end
