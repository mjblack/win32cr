require "./../foundation.cr"
require "./../graphics/gdi.cr"
require "./../system/com.cr"
require "./../graphics/open_gl.cr"
require "./../graphics/direct_draw.cr"
require "./../ui/color_system.cr"
require "./../system/console.cr"
require "./../graphics/direct3_d9.cr"

module Win32cr::Devices::Display
  alias HSEMAPHORE = LibC::IntPtrT
  alias HSURF = LibC::IntPtrT
  alias HFASTMUTEX = LibC::IntPtrT
  alias HDRVOBJ = LibC::IntPtrT
  alias HDEV = LibC::IntPtrT
  alias HBM = LibC::IntPtrT
  alias DHSURF = LibC::IntPtrT
  alias DHPDEV = LibC::IntPtrT
  alias PFN = Proc(LibC::IntPtrT)

  alias FREEOBJPROC = Proc(Win32cr::Devices::Display::DRIVEROBJ*, Win32cr::Foundation::BOOL)

  alias WNDOBJCHANGEPROC = Proc(Win32cr::Devices::Display::WNDOBJ*, UInt32, Void)

  alias SORTCOMP = Proc(Void*, Void*, Int32)

  alias PFN_DrvEnableDriver = Proc(UInt32, UInt32, Win32cr::Devices::Display::DRVENABLEDATA*, Win32cr::Foundation::BOOL)

  alias PFN_DrvEnablePDEV = Proc(Win32cr::Graphics::Gdi::DEVMODEW*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Devices::Display::HSURF*, UInt32, Win32cr::Devices::Display::GDIINFO*, UInt32, Win32cr::Devices::Display::DEVINFO*, Win32cr::Devices::Display::HDEV, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HANDLE, Win32cr::Devices::Display::DHPDEV)

  alias PFN_DrvCompletePDEV = Proc(Win32cr::Devices::Display::DHPDEV, Win32cr::Devices::Display::HDEV, Void)

  alias PFN_DrvResetDevice = Proc(Win32cr::Devices::Display::DHPDEV, Void*, UInt32)

  alias PFN_DrvDisablePDEV = Proc(Win32cr::Devices::Display::DHPDEV, Void)

  alias PFN_DrvSynchronize = Proc(Win32cr::Devices::Display::DHPDEV, Win32cr::Foundation::RECTL*, Void)

  alias PFN_DrvEnableSurface = Proc(Win32cr::Devices::Display::DHPDEV, Win32cr::Devices::Display::HSURF)

  alias PFN_DrvDisableDriver = Proc(Void)

  alias PFN_DrvDisableSurface = Proc(Win32cr::Devices::Display::DHPDEV, Void)

  alias PFN_DrvAssertMode = Proc(Win32cr::Devices::Display::DHPDEV, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL)

  alias PFN_DrvTextOut = Proc(Win32cr::Devices::Display::SURFOBJ*, Win32cr::Devices::Display::STROBJ*, Win32cr::Devices::Display::FONTOBJ*, Win32cr::Devices::Display::CLIPOBJ*, Win32cr::Foundation::RECTL*, Win32cr::Foundation::RECTL*, Win32cr::Devices::Display::BRUSHOBJ*, Win32cr::Devices::Display::BRUSHOBJ*, Win32cr::Foundation::POINTL*, UInt32, Win32cr::Foundation::BOOL)

  alias PFN_DrvStretchBlt = Proc(Win32cr::Devices::Display::SURFOBJ*, Win32cr::Devices::Display::SURFOBJ*, Win32cr::Devices::Display::SURFOBJ*, Win32cr::Devices::Display::CLIPOBJ*, Win32cr::Devices::Display::XLATEOBJ*, Win32cr::Graphics::Gdi::COLORADJUSTMENT*, Win32cr::Foundation::POINTL*, Win32cr::Foundation::RECTL*, Win32cr::Foundation::RECTL*, Win32cr::Foundation::POINTL*, UInt32, Win32cr::Foundation::BOOL)

  alias PFN_DrvStretchBltROP = Proc(Win32cr::Devices::Display::SURFOBJ*, Win32cr::Devices::Display::SURFOBJ*, Win32cr::Devices::Display::SURFOBJ*, Win32cr::Devices::Display::CLIPOBJ*, Win32cr::Devices::Display::XLATEOBJ*, Win32cr::Graphics::Gdi::COLORADJUSTMENT*, Win32cr::Foundation::POINTL*, Win32cr::Foundation::RECTL*, Win32cr::Foundation::RECTL*, Win32cr::Foundation::POINTL*, UInt32, Win32cr::Devices::Display::BRUSHOBJ*, UInt32, Win32cr::Foundation::BOOL)

  alias PFN_DrvTransparentBlt = Proc(Win32cr::Devices::Display::SURFOBJ*, Win32cr::Devices::Display::SURFOBJ*, Win32cr::Devices::Display::CLIPOBJ*, Win32cr::Devices::Display::XLATEOBJ*, Win32cr::Foundation::RECTL*, Win32cr::Foundation::RECTL*, UInt32, UInt32, Win32cr::Foundation::BOOL)

  alias PFN_DrvPlgBlt = Proc(Win32cr::Devices::Display::SURFOBJ*, Win32cr::Devices::Display::SURFOBJ*, Win32cr::Devices::Display::SURFOBJ*, Win32cr::Devices::Display::CLIPOBJ*, Win32cr::Devices::Display::XLATEOBJ*, Win32cr::Graphics::Gdi::COLORADJUSTMENT*, Win32cr::Foundation::POINTL*, Win32cr::Devices::Display::POINTFIX*, Win32cr::Foundation::RECTL*, Win32cr::Foundation::POINTL*, UInt32, Win32cr::Foundation::BOOL)

  alias PFN_DrvBitBlt = Proc(Win32cr::Devices::Display::SURFOBJ*, Win32cr::Devices::Display::SURFOBJ*, Win32cr::Devices::Display::SURFOBJ*, Win32cr::Devices::Display::CLIPOBJ*, Win32cr::Devices::Display::XLATEOBJ*, Win32cr::Foundation::RECTL*, Win32cr::Foundation::POINTL*, Win32cr::Foundation::POINTL*, Win32cr::Devices::Display::BRUSHOBJ*, Win32cr::Foundation::POINTL*, UInt32, Win32cr::Foundation::BOOL)

  alias PFN_DrvRealizeBrush = Proc(Win32cr::Devices::Display::BRUSHOBJ*, Win32cr::Devices::Display::SURFOBJ*, Win32cr::Devices::Display::SURFOBJ*, Win32cr::Devices::Display::SURFOBJ*, Win32cr::Devices::Display::XLATEOBJ*, UInt32, Win32cr::Foundation::BOOL)

  alias PFN_DrvCopyBits = Proc(Win32cr::Devices::Display::SURFOBJ*, Win32cr::Devices::Display::SURFOBJ*, Win32cr::Devices::Display::CLIPOBJ*, Win32cr::Devices::Display::XLATEOBJ*, Win32cr::Foundation::RECTL*, Win32cr::Foundation::POINTL*, Win32cr::Foundation::BOOL)

  alias PFN_DrvDitherColor = Proc(Win32cr::Devices::Display::DHPDEV, UInt32, UInt32, UInt32*, UInt32)

  alias PFN_DrvCreateDeviceBitmap = Proc(Win32cr::Devices::Display::DHPDEV, Win32cr::Foundation::SIZE, UInt32, Win32cr::Graphics::Gdi::HBITMAP)

  alias PFN_DrvDeleteDeviceBitmap = Proc(Win32cr::Devices::Display::DHSURF, Void)

  alias PFN_DrvSetPalette = Proc(Win32cr::Devices::Display::DHPDEV, Win32cr::Devices::Display::PALOBJ*, UInt32, UInt32, UInt32, Win32cr::Foundation::BOOL)

  alias PFN_DrvEscape = Proc(Win32cr::Devices::Display::SURFOBJ*, UInt32, UInt32, Void*, UInt32, Void*, UInt32)

  alias PFN_DrvDrawEscape = Proc(Win32cr::Devices::Display::SURFOBJ*, UInt32, Win32cr::Devices::Display::CLIPOBJ*, Win32cr::Foundation::RECTL*, UInt32, Void*, UInt32)

  alias PFN_DrvQueryFont = Proc(Win32cr::Devices::Display::DHPDEV, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, Win32cr::Devices::Display::IFIMETRICS*)

  alias PFN_DrvQueryFontTree = Proc(Win32cr::Devices::Display::DHPDEV, LibC::UIntPtrT, UInt32, UInt32, LibC::UIntPtrT*, Void*)

  alias PFN_DrvQueryFontData = Proc(Win32cr::Devices::Display::DHPDEV, Win32cr::Devices::Display::FONTOBJ*, UInt32, UInt32, Win32cr::Devices::Display::GLYPHDATA*, Void*, UInt32, Int32)

  alias PFN_DrvFree = Proc(Void*, LibC::UIntPtrT, Void)

  alias PFN_DrvDestroyFont = Proc(Win32cr::Devices::Display::FONTOBJ*, Void)

  alias PFN_DrvQueryFontCaps = Proc(UInt32, UInt32*, Int32)

  alias PFN_DrvLoadFontFile = Proc(UInt32, LibC::UIntPtrT*, Void**, UInt32*, Win32cr::Graphics::Gdi::DESIGNVECTOR*, UInt32, UInt32, LibC::UIntPtrT)

  alias PFN_DrvUnloadFontFile = Proc(LibC::UIntPtrT, Win32cr::Foundation::BOOL)

  alias PFN_DrvSetPointerShape = Proc(Win32cr::Devices::Display::SURFOBJ*, Win32cr::Devices::Display::SURFOBJ*, Win32cr::Devices::Display::SURFOBJ*, Win32cr::Devices::Display::XLATEOBJ*, Int32, Int32, Int32, Int32, Win32cr::Foundation::RECTL*, UInt32, UInt32)

  alias PFN_DrvMovePointer = Proc(Win32cr::Devices::Display::SURFOBJ*, Int32, Int32, Win32cr::Foundation::RECTL*, Void)

  alias PFN_DrvSendPage = Proc(Win32cr::Devices::Display::SURFOBJ*, Win32cr::Foundation::BOOL)

  alias PFN_DrvStartPage = Proc(Win32cr::Devices::Display::SURFOBJ*, Win32cr::Foundation::BOOL)

  alias PFN_DrvStartDoc = Proc(Win32cr::Devices::Display::SURFOBJ*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::BOOL)

  alias PFN_DrvEndDoc = Proc(Win32cr::Devices::Display::SURFOBJ*, UInt32, Win32cr::Foundation::BOOL)

  alias PFN_DrvQuerySpoolType = Proc(Win32cr::Devices::Display::DHPDEV, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL)

  alias PFN_DrvLineTo = Proc(Win32cr::Devices::Display::SURFOBJ*, Win32cr::Devices::Display::CLIPOBJ*, Win32cr::Devices::Display::BRUSHOBJ*, Int32, Int32, Int32, Int32, Win32cr::Foundation::RECTL*, UInt32, Win32cr::Foundation::BOOL)

  alias PFN_DrvStrokePath = Proc(Win32cr::Devices::Display::SURFOBJ*, Win32cr::Devices::Display::PATHOBJ*, Win32cr::Devices::Display::CLIPOBJ*, Win32cr::Devices::Display::XFORMOBJ*, Win32cr::Devices::Display::BRUSHOBJ*, Win32cr::Foundation::POINTL*, Win32cr::Devices::Display::LINEATTRS*, UInt32, Win32cr::Foundation::BOOL)

  alias PFN_DrvFillPath = Proc(Win32cr::Devices::Display::SURFOBJ*, Win32cr::Devices::Display::PATHOBJ*, Win32cr::Devices::Display::CLIPOBJ*, Win32cr::Devices::Display::BRUSHOBJ*, Win32cr::Foundation::POINTL*, UInt32, UInt32, Win32cr::Foundation::BOOL)

  alias PFN_DrvStrokeAndFillPath = Proc(Win32cr::Devices::Display::SURFOBJ*, Win32cr::Devices::Display::PATHOBJ*, Win32cr::Devices::Display::CLIPOBJ*, Win32cr::Devices::Display::XFORMOBJ*, Win32cr::Devices::Display::BRUSHOBJ*, Win32cr::Devices::Display::LINEATTRS*, Win32cr::Devices::Display::BRUSHOBJ*, Win32cr::Foundation::POINTL*, UInt32, UInt32, Win32cr::Foundation::BOOL)

  alias PFN_DrvPaint = Proc(Win32cr::Devices::Display::SURFOBJ*, Win32cr::Devices::Display::CLIPOBJ*, Win32cr::Devices::Display::BRUSHOBJ*, Win32cr::Foundation::POINTL*, UInt32, Win32cr::Foundation::BOOL)

  alias PFN_DrvGetGlyphMode = Proc(Win32cr::Devices::Display::DHPDEV, Win32cr::Devices::Display::FONTOBJ*, UInt32)

  alias PFN_DrvResetPDEV = Proc(Win32cr::Devices::Display::DHPDEV, Win32cr::Devices::Display::DHPDEV, Win32cr::Foundation::BOOL)

  alias PFN_DrvSaveScreenBits = Proc(Win32cr::Devices::Display::SURFOBJ*, UInt32, LibC::UIntPtrT, Win32cr::Foundation::RECTL*, LibC::UIntPtrT)

  alias PFN_DrvGetModes = Proc(Win32cr::Foundation::HANDLE, UInt32, Win32cr::Graphics::Gdi::DEVMODEW*, UInt32)

  alias PFN_DrvQueryTrueTypeTable = Proc(LibC::UIntPtrT, UInt32, UInt32, Int32, UInt32, UInt8*, UInt8**, UInt32*, Int32)

  alias PFN_DrvQueryTrueTypeSection = Proc(UInt32, UInt32, UInt32, Win32cr::Foundation::HANDLE*, Int32*, Int32)

  alias PFN_DrvQueryTrueTypeOutline = Proc(Win32cr::Devices::Display::DHPDEV, Win32cr::Devices::Display::FONTOBJ*, UInt32, Win32cr::Foundation::BOOL, Win32cr::Devices::Display::GLYPHDATA*, UInt32, Win32cr::Graphics::Gdi::TTPOLYGONHEADER*, Int32)

  alias PFN_DrvGetTrueTypeFile = Proc(LibC::UIntPtrT, UInt32*, Void*)

  alias PFN_DrvQueryFontFile = Proc(LibC::UIntPtrT, UInt32, UInt32, UInt32*, Int32)

  alias PFN_DrvQueryGlyphAttrs = Proc(Win32cr::Devices::Display::FONTOBJ*, UInt32, Win32cr::Devices::Display::FD_GLYPHATTR*)

  alias PFN_DrvQueryAdvanceWidths = Proc(Win32cr::Devices::Display::DHPDEV, Win32cr::Devices::Display::FONTOBJ*, UInt32, UInt32*, Void*, UInt32, Win32cr::Foundation::BOOL)

  alias PFN_DrvFontManagement = Proc(Win32cr::Devices::Display::SURFOBJ*, Win32cr::Devices::Display::FONTOBJ*, UInt32, UInt32, Void*, UInt32, Void*, UInt32)

  alias PFN_DrvSetPixelFormat = Proc(Win32cr::Devices::Display::SURFOBJ*, Int32, Win32cr::Foundation::HWND, Win32cr::Foundation::BOOL)

  alias PFN_DrvDescribePixelFormat = Proc(Win32cr::Devices::Display::DHPDEV, Int32, UInt32, Win32cr::Graphics::OpenGL::PIXELFORMATDESCRIPTOR*, Int32)

  alias PFN_DrvSwapBuffers = Proc(Win32cr::Devices::Display::SURFOBJ*, Win32cr::Devices::Display::WNDOBJ*, Win32cr::Foundation::BOOL)

  alias PFN_DrvStartBanding = Proc(Win32cr::Devices::Display::SURFOBJ*, Win32cr::Foundation::POINTL*, Win32cr::Foundation::BOOL)

  alias PFN_DrvNextBand = Proc(Win32cr::Devices::Display::SURFOBJ*, Win32cr::Foundation::POINTL*, Win32cr::Foundation::BOOL)

  alias PFN_DrvQueryPerBandInfo = Proc(Win32cr::Devices::Display::SURFOBJ*, Win32cr::Devices::Display::PERBANDINFO*, Win32cr::Foundation::BOOL)

  alias PFN_DrvEnableDirectDraw = Proc(Win32cr::Devices::Display::DHPDEV, Win32cr::Graphics::DirectDraw::DD_CALLBACKS*, Win32cr::Graphics::DirectDraw::DD_SURFACECALLBACKS*, Win32cr::Graphics::DirectDraw::DD_PALETTECALLBACKS*, Win32cr::Foundation::BOOL)

  alias PFN_DrvDisableDirectDraw = Proc(Win32cr::Devices::Display::DHPDEV, Void)

  alias PFN_DrvGetDirectDrawInfo = Proc(Win32cr::Devices::Display::DHPDEV, Win32cr::Graphics::DirectDraw::DD_HALINFO*, UInt32*, Win32cr::Graphics::DirectDraw::VIDEOMEMORY*, UInt32*, UInt32*, Win32cr::Foundation::BOOL)

  alias PFN_DrvIcmCreateColorTransform = Proc(Win32cr::Devices::Display::DHPDEV, Win32cr::UI::ColorSystem::LOGCOLORSPACEW*, Void*, UInt32, Void*, UInt32, Void*, UInt32, UInt32, Win32cr::Foundation::HANDLE)

  alias PFN_DrvIcmDeleteColorTransform = Proc(Win32cr::Devices::Display::DHPDEV, Win32cr::Foundation::HANDLE, Win32cr::Foundation::BOOL)

  alias PFN_DrvIcmCheckBitmapBits = Proc(Win32cr::Devices::Display::DHPDEV, Win32cr::Foundation::HANDLE, Win32cr::Devices::Display::SURFOBJ*, UInt8*, Win32cr::Foundation::BOOL)

  alias PFN_DrvIcmSetDeviceGammaRamp = Proc(Win32cr::Devices::Display::DHPDEV, UInt32, Void*, Win32cr::Foundation::BOOL)

  alias PFN_DrvAlphaBlend = Proc(Win32cr::Devices::Display::SURFOBJ*, Win32cr::Devices::Display::SURFOBJ*, Win32cr::Devices::Display::CLIPOBJ*, Win32cr::Devices::Display::XLATEOBJ*, Win32cr::Foundation::RECTL*, Win32cr::Foundation::RECTL*, Win32cr::Devices::Display::BLENDOBJ*, Win32cr::Foundation::BOOL)

  alias PFN_DrvGradientFill = Proc(Win32cr::Devices::Display::SURFOBJ*, Win32cr::Devices::Display::CLIPOBJ*, Win32cr::Devices::Display::XLATEOBJ*, Win32cr::Graphics::Gdi::TRIVERTEX*, UInt32, Void*, UInt32, Win32cr::Foundation::RECTL*, Win32cr::Foundation::POINTL*, UInt32, Win32cr::Foundation::BOOL)

  alias PFN_DrvQueryDeviceSupport = Proc(Win32cr::Devices::Display::SURFOBJ*, Win32cr::Devices::Display::XLATEOBJ*, Win32cr::Devices::Display::XFORMOBJ*, UInt32, UInt32, Void*, UInt32, Void*, Win32cr::Foundation::BOOL)

  alias PFN_DrvDeriveSurface = Proc(Win32cr::Graphics::DirectDraw::DD_DIRECTDRAW_GLOBAL*, Win32cr::Graphics::DirectDraw::DD_SURFACE_LOCAL*, Win32cr::Graphics::Gdi::HBITMAP)

  alias PFN_DrvSynchronizeSurface = Proc(Win32cr::Devices::Display::SURFOBJ*, Win32cr::Foundation::RECTL*, UInt32, Void)

  alias PFN_DrvNotify = Proc(Win32cr::Devices::Display::SURFOBJ*, UInt32, Void*, Void)

  alias PFN_DrvRenderHint = Proc(Win32cr::Devices::Display::DHPDEV, UInt32, LibC::UIntPtrT, Void*, Int32)

  alias PFN_EngCreateRectRgn = Proc(Int32, Int32, Int32, Int32, Win32cr::Foundation::HANDLE)

  alias PFN_EngDeleteRgn = Proc(Win32cr::Foundation::HANDLE, Void)

  alias PFN_EngCombineRgn = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::HANDLE, Win32cr::Foundation::HANDLE, Int32, Int32)

  alias PFN_EngCopyRgn = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::HANDLE, Int32)

  alias PFN_EngIntersectRgn = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::HANDLE, Win32cr::Foundation::HANDLE, Int32)

  alias PFN_EngSubtractRgn = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::HANDLE, Win32cr::Foundation::HANDLE, Int32)

  alias PFN_EngUnionRgn = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::HANDLE, Win32cr::Foundation::HANDLE, Int32)

  alias PFN_EngXorRgn = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::HANDLE, Win32cr::Foundation::HANDLE, Int32)

  alias PFN_DrvCreateDeviceBitmapEx = Proc(Win32cr::Devices::Display::DHPDEV, Win32cr::Foundation::SIZE, UInt32, UInt32, Win32cr::Devices::Display::DHSURF, UInt32, UInt32, Win32cr::Foundation::HANDLE*, Win32cr::Graphics::Gdi::HBITMAP)

  alias PFN_DrvDeleteDeviceBitmapEx = Proc(Win32cr::Devices::Display::DHSURF, Void)

  alias PFN_DrvAssociateSharedSurface = Proc(Win32cr::Devices::Display::SURFOBJ*, Win32cr::Foundation::HANDLE, Win32cr::Foundation::HANDLE, Win32cr::Foundation::SIZE, Win32cr::Foundation::BOOL)

  alias PFN_DrvSynchronizeRedirectionBitmaps = Proc(Win32cr::Devices::Display::DHPDEV, UInt64*, Win32cr::Foundation::NTSTATUS)

  alias PFN_DrvAccumulateD3DDirtyRect = Proc(Win32cr::Devices::Display::SURFOBJ*, Win32cr::Devices::Display::CDDDXGK_REDIRBITMAPPRESENTINFO*, Win32cr::Foundation::BOOL)

  alias PFN_DrvStartDxInterop = Proc(Win32cr::Devices::Display::SURFOBJ*, Win32cr::Foundation::BOOL, Void*, Win32cr::Foundation::BOOL)

  alias PFN_DrvEndDxInterop = Proc(Win32cr::Devices::Display::SURFOBJ*, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL*, Void*, Win32cr::Foundation::BOOL)

  alias PFN_DrvLockDisplayArea = Proc(Win32cr::Devices::Display::DHPDEV, Win32cr::Foundation::RECTL*, Void)

  alias PFN_DrvUnlockDisplayArea = Proc(Win32cr::Devices::Display::DHPDEV, Win32cr::Foundation::RECTL*, Void)

  alias PFN_DrvSurfaceComplete = Proc(Win32cr::Devices::Display::DHPDEV, Win32cr::Foundation::HANDLE, Win32cr::Foundation::BOOL)

  alias PVIDEO_WIN32K_CALLOUT = Proc(Void*, Void)

  GUID_DEVINTERFACE_DISPLAY_ADAPTER = "5b45201d-f2f2-4f3b-85bb-30ff1f953599"
  GUID_DEVINTERFACE_MONITOR = "e6f07b5f-ee97-4a90-b076-33f57bf4eaa7"
  GUID_DISPLAY_DEVICE_ARRIVAL = "1ca05180-a699-450a-9a0c-de4fbe3ddd89"
  GUID_DEVINTERFACE_VIDEO_OUTPUT_ARRIVAL = "1ad9e4f0-f88d-4360-bab9-4c2d55e564cd"
  DEVPKEY_IndirectDisplay = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc50a3f10_u32, 0xaa5c_u16, 0x4247_u16, StaticArray[0xb8_u8, 0x30_u8, 0xd6_u8, 0xa6_u8, 0xf8_u8, 0xea_u8, 0xa3_u8, 0x10_u8]), 1_u32)
  DEVPKEY_Device_TerminalLuid = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc50a3f10_u32, 0xaa5c_u16, 0x4247_u16, StaticArray[0xb8_u8, 0x30_u8, 0xd6_u8, 0xa6_u8, 0xf8_u8, 0xea_u8, 0xa3_u8, 0x10_u8]), 2_u32)
  DEVPKEY_Device_AdapterLuid = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc50a3f10_u32, 0xaa5c_u16, 0x4247_u16, StaticArray[0xb8_u8, 0x30_u8, 0xd6_u8, 0xa6_u8, 0xf8_u8, 0xea_u8, 0xa3_u8, 0x10_u8]), 3_u32)
  DEVPKEY_Device_ActivityId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc50a3f10_u32, 0xaa5c_u16, 0x4247_u16, StaticArray[0xb8_u8, 0x30_u8, 0xd6_u8, 0xa6_u8, 0xf8_u8, 0xea_u8, 0xa3_u8, 0x10_u8]), 4_u32)
  INDIRECT_DISPLAY_INFO_FLAGS_CREATED_IDDCX_ADAPTER = 1_u32
  VIDEO_DEVICE_NAME = "DISPLAY%d"
  WVIDEO_DEVICE_NAME = "DISPLAY%d"
  IOCTL_VIDEO_DISABLE_VDM = 2293764_u32
  IOCTL_VIDEO_REGISTER_VDM = 2293768_u32
  IOCTL_VIDEO_SET_OUTPUT_DEVICE_POWER_STATE = 2293772_u32
  IOCTL_VIDEO_GET_OUTPUT_DEVICE_POWER_STATE = 2293776_u32
  IOCTL_VIDEO_MONITOR_DEVICE = 2293780_u32
  IOCTL_VIDEO_ENUM_MONITOR_PDO = 2293784_u32
  IOCTL_VIDEO_INIT_WIN32K_CALLBACKS = 2293788_u32
  IOCTL_VIDEO_IS_VGA_DEVICE = 2293796_u32
  IOCTL_VIDEO_USE_DEVICE_IN_SESSION = 2293800_u32
  IOCTL_VIDEO_PREPARE_FOR_EARECOVERY = 2293804_u32
  IOCTL_VIDEO_ENABLE_VDM = 2293760_u32
  IOCTL_VIDEO_SAVE_HARDWARE_STATE = 2294272_u32
  IOCTL_VIDEO_RESTORE_HARDWARE_STATE = 2294276_u32
  IOCTL_VIDEO_HANDLE_VIDEOPARAMETERS = 2293792_u32
  IOCTL_VIDEO_QUERY_AVAIL_MODES = 2294784_u32
  IOCTL_VIDEO_QUERY_NUM_AVAIL_MODES = 2294788_u32
  IOCTL_VIDEO_QUERY_CURRENT_MODE = 2294792_u32
  IOCTL_VIDEO_SET_CURRENT_MODE = 2294796_u32
  IOCTL_VIDEO_RESET_DEVICE = 2294800_u32
  IOCTL_VIDEO_LOAD_AND_SET_FONT = 2294804_u32
  IOCTL_VIDEO_SET_PALETTE_REGISTERS = 2294808_u32
  IOCTL_VIDEO_SET_COLOR_REGISTERS = 2294812_u32
  IOCTL_VIDEO_ENABLE_CURSOR = 2294816_u32
  IOCTL_VIDEO_DISABLE_CURSOR = 2294820_u32
  IOCTL_VIDEO_SET_CURSOR_ATTR = 2294824_u32
  IOCTL_VIDEO_QUERY_CURSOR_ATTR = 2294828_u32
  IOCTL_VIDEO_SET_CURSOR_POSITION = 2294832_u32
  IOCTL_VIDEO_QUERY_CURSOR_POSITION = 2294836_u32
  IOCTL_VIDEO_ENABLE_POINTER = 2294840_u32
  IOCTL_VIDEO_DISABLE_POINTER = 2294844_u32
  IOCTL_VIDEO_SET_POINTER_ATTR = 2294848_u32
  IOCTL_VIDEO_QUERY_POINTER_ATTR = 2294852_u32
  IOCTL_VIDEO_SET_POINTER_POSITION = 2294856_u32
  IOCTL_VIDEO_QUERY_POINTER_POSITION = 2294860_u32
  IOCTL_VIDEO_QUERY_POINTER_CAPABILITIES = 2294864_u32
  IOCTL_VIDEO_GET_BANK_SELECT_CODE = 2294868_u32
  IOCTL_VIDEO_MAP_VIDEO_MEMORY = 2294872_u32
  IOCTL_VIDEO_UNMAP_VIDEO_MEMORY = 2294876_u32
  IOCTL_VIDEO_QUERY_PUBLIC_ACCESS_RANGES = 2294880_u32
  IOCTL_VIDEO_FREE_PUBLIC_ACCESS_RANGES = 2294884_u32
  IOCTL_VIDEO_QUERY_COLOR_CAPABILITIES = 2294888_u32
  IOCTL_VIDEO_SET_POWER_MANAGEMENT = 2294892_u32
  IOCTL_VIDEO_GET_POWER_MANAGEMENT = 2294896_u32
  IOCTL_VIDEO_SHARE_VIDEO_MEMORY = 2294900_u32
  IOCTL_VIDEO_UNSHARE_VIDEO_MEMORY = 2294904_u32
  IOCTL_VIDEO_SET_COLOR_LUT_DATA = 2294908_u32
  IOCTL_VIDEO_GET_CHILD_STATE = 2294912_u32
  IOCTL_VIDEO_VALIDATE_CHILD_STATE_CONFIGURATION = 2294916_u32
  IOCTL_VIDEO_SET_CHILD_STATE_CONFIGURATION = 2294920_u32
  IOCTL_VIDEO_SWITCH_DUALVIEW = 2294924_u32
  IOCTL_VIDEO_SET_BANK_POSITION = 2294928_u32
  IOCTL_VIDEO_QUERY_SUPPORTED_BRIGHTNESS = 2294932_u32
  IOCTL_VIDEO_QUERY_DISPLAY_BRIGHTNESS = 2294936_u32
  IOCTL_VIDEO_SET_DISPLAY_BRIGHTNESS = 2294940_u32
  IOCTL_FSVIDEO_COPY_FRAME_BUFFER = 3409920_u32
  IOCTL_FSVIDEO_WRITE_TO_FRAME_BUFFER = 3409924_u32
  IOCTL_FSVIDEO_REVERSE_MOUSE_POINTER = 3409928_u32
  IOCTL_FSVIDEO_SET_CURRENT_MODE = 3409932_u32
  IOCTL_FSVIDEO_SET_SCREEN_INFORMATION = 3409936_u32
  IOCTL_FSVIDEO_SET_CURSOR_POSITION = 3409940_u32
  IOCTL_PANEL_QUERY_BRIGHTNESS_CAPS = 2296832_u32
  IOCTL_PANEL_QUERY_BRIGHTNESS_RANGES = 2296836_u32
  IOCTL_PANEL_GET_BRIGHTNESS = 2296840_u32
  IOCTL_PANEL_SET_BRIGHTNESS = 2296844_u32
  IOCTL_PANEL_SET_BRIGHTNESS_STATE = 2296848_u32
  IOCTL_PANEL_SET_BACKLIGHT_OPTIMIZATION = 2296852_u32
  IOCTL_PANEL_GET_BACKLIGHT_REDUCTION = 2296856_u32
  IOCTL_COLORSPACE_TRANSFORM_QUERY_TARGET_CAPS = 2297856_u32
  IOCTL_COLORSPACE_TRANSFORM_SET = 2297860_u32
  IOCTL_SET_ACTIVE_COLOR_PROFILE_NAME = 2297864_u32
  IOCTL_MIPI_DSI_QUERY_CAPS = 2298880_u32
  IOCTL_MIPI_DSI_TRANSMISSION = 2298884_u32
  IOCTL_MIPI_DSI_RESET = 2298888_u32
  DXGK_WIN32K_PARAM_FLAG_UPDATEREGISTRY = 1_u32
  DXGK_WIN32K_PARAM_FLAG_MODESWITCH = 2_u32
  DXGK_WIN32K_PARAM_FLAG_DISABLEVIEW = 4_u32
  VIDEO_DUALVIEW_REMOVABLE = 1_u32
  VIDEO_DUALVIEW_PRIMARY = 2147483648_u32
  VIDEO_DUALVIEW_SECONDARY = 1073741824_u32
  VIDEO_DUALVIEW_WDDM_VGA = 536870912_u32
  VIDEO_STATE_NON_STANDARD_VGA = 1_u32
  VIDEO_STATE_UNEMULATED_VGA_STATE = 2_u32
  VIDEO_STATE_PACKED_CHAIN4_MODE = 4_u32
  VIDEO_MODE_NO_ZERO_MEMORY = 2147483648_u32
  VIDEO_MODE_MAP_MEM_LINEAR = 1073741824_u32
  VIDEO_MODE_COLOR = 1_u32
  VIDEO_MODE_GRAPHICS = 2_u32
  VIDEO_MODE_PALETTE_DRIVEN = 4_u32
  VIDEO_MODE_MANAGED_PALETTE = 8_u32
  VIDEO_MODE_INTERLACED = 16_u32
  VIDEO_MODE_NO_OFF_SCREEN = 32_u32
  VIDEO_MODE_NO_64_BIT_ACCESS = 64_u32
  VIDEO_MODE_BANKED = 128_u32
  VIDEO_MODE_LINEAR = 256_u32
  VIDEO_MODE_ASYNC_POINTER = 1_u32
  VIDEO_MODE_MONO_POINTER = 2_u32
  VIDEO_MODE_COLOR_POINTER = 4_u32
  VIDEO_MODE_ANIMATE_START = 8_u32
  VIDEO_MODE_ANIMATE_UPDATE = 16_u32
  PLANAR_HC = 1_u32
  VIDEO_DEVICE_COLOR = 1_u32
  VIDEO_OPTIONAL_GAMMET_TABLE = 2_u32
  VIDEO_COLOR_LUT_DATA_FORMAT_RGB256WORDS = 1_u32
  VIDEO_COLOR_LUT_DATA_FORMAT_PRIVATEFORMAT = 2147483648_u32
  DISPLAYPOLICY_AC = 1_u32
  DISPLAYPOLICY_DC = 2_u32
  CHAR_TYPE_SBCS = 0_u32
  CHAR_TYPE_LEADING = 2_u32
  CHAR_TYPE_TRAILING = 3_u32
  BITMAP_BITS_BYTE_ALIGN = 8_u32
  BITMAP_BITS_WORD_ALIGN = 16_u32
  BITMAP_ARRAY_BYTE = 3_u32
  BITMAP_PLANES = 1_u32
  BITMAP_BITS_PIXEL = 1_u32
  DD_FULLSCREEN_VIDEO_DEVICE_NAME = "\\Device\\FSVideo"
  VIDEO_REASON_NONE = 0_u32
  VIDEO_REASON_POLICY1 = 1_u32
  VIDEO_REASON_POLICY2 = 2_u32
  VIDEO_REASON_POLICY3 = 3_u32
  VIDEO_REASON_POLICY4 = 4_u32
  VIDEO_REASON_LOCK = 5_u32
  VIDEO_REASON_FAILED_ROTATION = 5_u32
  VIDEO_REASON_ALLOCATION = 6_u32
  VIDEO_REASON_SCRATCH = 8_u32
  VIDEO_REASON_CONFIGURATION = 9_u32
  VIDEO_MAX_REASON = 9_u32
  BRIGHTNESS_MAX_LEVEL_COUNT = 103_u32
  BRIGHTNESS_MAX_NIT_RANGE_COUNT = 16_u32
  DSI_PACKET_EMBEDDED_PAYLOAD_SIZE = 8_u32
  MAX_PACKET_COUNT = 128_u32
  DSI_INVALID_PACKET_INDEX = 255_u32
  DSI_SOT_ERROR = 1_u32
  DSI_SOT_SYNC_ERROR = 2_u32
  DSI_EOT_SYNC_ERROR = 4_u32
  DSI_ESCAPE_MODE_ENTRY_COMMAND_ERROR = 8_u32
  DSI_LOW_POWER_TRANSMIT_SYNC_ERROR = 16_u32
  DSI_PERIPHERAL_TIMEOUT_ERROR = 32_u32
  DSI_FALSE_CONTROL_ERROR = 64_u32
  DSI_CONTENTION_DETECTED = 128_u32
  DSI_CHECKSUM_ERROR_CORRECTED = 256_u32
  DSI_CHECKSUM_ERROR_NOT_CORRECTED = 512_u32
  DSI_LONG_PACKET_PAYLOAD_CHECKSUM_ERROR = 1024_u32
  DSI_DSI_DATA_TYPE_NOT_RECOGNIZED = 2048_u32
  DSI_DSI_VC_ID_INVALID = 4096_u32
  DSI_INVALID_TRANSMISSION_LENGTH = 8192_u32
  DSI_DSI_PROTOCOL_VIOLATION = 32768_u32
  HOST_DSI_DEVICE_NOT_READY = 1_u32
  HOST_DSI_INTERFACE_RESET = 2_u32
  HOST_DSI_DEVICE_RESET = 4_u32
  HOST_DSI_TRANSMISSION_CANCELLED = 16_u32
  HOST_DSI_TRANSMISSION_DROPPED = 32_u32
  HOST_DSI_TRANSMISSION_TIMEOUT = 64_u32
  HOST_DSI_INVALID_TRANSMISSION = 256_u32
  HOST_DSI_OS_REJECTED_PACKET = 512_u32
  HOST_DSI_DRIVER_REJECTED_PACKET = 1024_u32
  HOST_DSI_BAD_TRANSMISSION_MODE = 4096_u32
  GUID_MONITOR_OVERRIDE_PSEUDO_SPECIALIZED = "f196c02f-f86f-4f9a-aa15-e9cebdfe3b96"
  FD_ERROR = 4294967295_u32
  DDI_ERROR = 4294967295_u32
  FDM_TYPE_BM_SIDE_CONST = 1_u32
  FDM_TYPE_MAXEXT_EQUAL_BM_SIDE = 2_u32
  FDM_TYPE_CHAR_INC_EQUAL_BM_BASE = 4_u32
  FDM_TYPE_ZERO_BEARINGS = 8_u32
  FDM_TYPE_CONST_BEARINGS = 16_u32
  GS_UNICODE_HANDLES = 1_u32
  GS_8BIT_HANDLES = 2_u32
  GS_16BIT_HANDLES = 4_u32
  FM_VERSION_NUMBER = 0_u32
  FM_TYPE_LICENSED = 2_u32
  FM_READONLY_EMBED = 4_u32
  FM_EDITABLE_EMBED = 8_u32
  FM_NO_EMBEDDING = 2_u32
  FM_INFO_TECH_TRUETYPE = 1_u32
  FM_INFO_TECH_BITMAP = 2_u32
  FM_INFO_TECH_STROKE = 4_u32
  FM_INFO_TECH_OUTLINE_NOT_TRUETYPE = 8_u32
  FM_INFO_ARB_XFORMS = 16_u32
  FM_INFO_1BPP = 32_u32
  FM_INFO_4BPP = 64_u32
  FM_INFO_8BPP = 128_u32
  FM_INFO_16BPP = 256_u32
  FM_INFO_24BPP = 512_u32
  FM_INFO_32BPP = 1024_u32
  FM_INFO_INTEGER_WIDTH = 2048_u32
  FM_INFO_CONSTANT_WIDTH = 4096_u32
  FM_INFO_NOT_CONTIGUOUS = 8192_u32
  FM_INFO_TECH_MM = 16384_u32
  FM_INFO_RETURNS_OUTLINES = 32768_u32
  FM_INFO_RETURNS_STROKES = 65536_u32
  FM_INFO_RETURNS_BITMAPS = 131072_u32
  FM_INFO_DSIG = 262144_u32
  FM_INFO_RIGHT_HANDED = 524288_u32
  FM_INFO_INTEGRAL_SCALING = 1048576_u32
  FM_INFO_90DEGREE_ROTATIONS = 2097152_u32
  FM_INFO_OPTICALLY_FIXED_PITCH = 4194304_u32
  FM_INFO_DO_NOT_ENUMERATE = 8388608_u32
  FM_INFO_ISOTROPIC_SCALING_ONLY = 16777216_u32
  FM_INFO_ANISOTROPIC_SCALING_ONLY = 33554432_u32
  FM_INFO_TECH_CFF = 67108864_u32
  FM_INFO_FAMILY_EQUIV = 134217728_u32
  FM_INFO_DBCS_FIXED_PITCH = 268435456_u32
  FM_INFO_NONNEGATIVE_AC = 536870912_u32
  FM_INFO_IGNORE_TC_RA_ABLE = 1073741824_u32
  FM_INFO_TECH_TYPE1 = 2147483648_u32
  MAXCHARSETS = 16_u32
  FM_PANOSE_CULTURE_LATIN = 0_u32
  FM_SEL_ITALIC = 1_u32
  FM_SEL_UNDERSCORE = 2_u32
  FM_SEL_NEGATIVE = 4_u32
  FM_SEL_OUTLINED = 8_u32
  FM_SEL_STRIKEOUT = 16_u32
  FM_SEL_BOLD = 32_u32
  FM_SEL_REGULAR = 64_u32
  OPENGL_CMD = 4352_u32
  OPENGL_GETINFO = 4353_u32
  WNDOBJ_SETUP = 4354_u32
  DDI_DRIVER_VERSION_NT4 = 131072_u32
  DDI_DRIVER_VERSION_SP3 = 131075_u32
  DDI_DRIVER_VERSION_NT5 = 196608_u32
  DDI_DRIVER_VERSION_NT5_01 = 196864_u32
  DDI_DRIVER_VERSION_NT5_01_SP1 = 196865_u32
  GDI_DRIVER_VERSION = 16384_u32
  INDEX_DrvEnablePDEV = 0_i32
  INDEX_DrvCompletePDEV = 1_i32
  INDEX_DrvDisablePDEV = 2_i32
  INDEX_DrvEnableSurface = 3_i32
  INDEX_DrvDisableSurface = 4_i32
  INDEX_DrvAssertMode = 5_i32
  INDEX_DrvOffset = 6_i32
  INDEX_DrvResetPDEV = 7_i32
  INDEX_DrvDisableDriver = 8_i32
  INDEX_DrvCreateDeviceBitmap = 10_i32
  INDEX_DrvDeleteDeviceBitmap = 11_i32
  INDEX_DrvRealizeBrush = 12_i32
  INDEX_DrvDitherColor = 13_i32
  INDEX_DrvStrokePath = 14_i32
  INDEX_DrvFillPath = 15_i32
  INDEX_DrvStrokeAndFillPath = 16_i32
  INDEX_DrvPaint = 17_i32
  INDEX_DrvBitBlt = 18_i32
  INDEX_DrvCopyBits = 19_i32
  INDEX_DrvStretchBlt = 20_i32
  INDEX_DrvSetPalette = 22_i32
  INDEX_DrvTextOut = 23_i32
  INDEX_DrvEscape = 24_i32
  INDEX_DrvDrawEscape = 25_i32
  INDEX_DrvQueryFont = 26_i32
  INDEX_DrvQueryFontTree = 27_i32
  INDEX_DrvQueryFontData = 28_i32
  INDEX_DrvSetPointerShape = 29_i32
  INDEX_DrvMovePointer = 30_i32
  INDEX_DrvLineTo = 31_i32
  INDEX_DrvSendPage = 32_i32
  INDEX_DrvStartPage = 33_i32
  INDEX_DrvEndDoc = 34_i32
  INDEX_DrvStartDoc = 35_i32
  INDEX_DrvGetGlyphMode = 37_i32
  INDEX_DrvSynchronize = 38_i32
  INDEX_DrvSaveScreenBits = 40_i32
  INDEX_DrvGetModes = 41_i32
  INDEX_DrvFree = 42_i32
  INDEX_DrvDestroyFont = 43_i32
  INDEX_DrvQueryFontCaps = 44_i32
  INDEX_DrvLoadFontFile = 45_i32
  INDEX_DrvUnloadFontFile = 46_i32
  INDEX_DrvFontManagement = 47_i32
  INDEX_DrvQueryTrueTypeTable = 48_i32
  INDEX_DrvQueryTrueTypeOutline = 49_i32
  INDEX_DrvGetTrueTypeFile = 50_i32
  INDEX_DrvQueryFontFile = 51_i32
  INDEX_DrvMovePanning = 52_i32
  INDEX_DrvQueryAdvanceWidths = 53_i32
  INDEX_DrvSetPixelFormat = 54_i32
  INDEX_DrvDescribePixelFormat = 55_i32
  INDEX_DrvSwapBuffers = 56_i32
  INDEX_DrvStartBanding = 57_i32
  INDEX_DrvNextBand = 58_i32
  INDEX_DrvGetDirectDrawInfo = 59_i32
  INDEX_DrvEnableDirectDraw = 60_i32
  INDEX_DrvDisableDirectDraw = 61_i32
  INDEX_DrvQuerySpoolType = 62_i32
  INDEX_DrvIcmCreateColorTransform = 64_i32
  INDEX_DrvIcmDeleteColorTransform = 65_i32
  INDEX_DrvIcmCheckBitmapBits = 66_i32
  INDEX_DrvIcmSetDeviceGammaRamp = 67_i32
  INDEX_DrvGradientFill = 68_i32
  INDEX_DrvStretchBltROP = 69_i32
  INDEX_DrvPlgBlt = 70_i32
  INDEX_DrvAlphaBlend = 71_i32
  INDEX_DrvSynthesizeFont = 72_i32
  INDEX_DrvGetSynthesizedFontFiles = 73_i32
  INDEX_DrvTransparentBlt = 74_i32
  INDEX_DrvQueryPerBandInfo = 75_i32
  INDEX_DrvQueryDeviceSupport = 76_i32
  INDEX_DrvReserved1 = 77_i32
  INDEX_DrvReserved2 = 78_i32
  INDEX_DrvReserved3 = 79_i32
  INDEX_DrvReserved4 = 80_i32
  INDEX_DrvReserved5 = 81_i32
  INDEX_DrvReserved6 = 82_i32
  INDEX_DrvReserved7 = 83_i32
  INDEX_DrvReserved8 = 84_i32
  INDEX_DrvDeriveSurface = 85_i32
  INDEX_DrvQueryGlyphAttrs = 86_i32
  INDEX_DrvNotify = 87_i32
  INDEX_DrvSynchronizeSurface = 88_i32
  INDEX_DrvResetDevice = 89_i32
  INDEX_DrvReserved9 = 90_i32
  INDEX_DrvReserved10 = 91_i32
  INDEX_DrvReserved11 = 92_i32
  INDEX_DrvRenderHint = 93_i32
  INDEX_DrvCreateDeviceBitmapEx = 94_i32
  INDEX_DrvDeleteDeviceBitmapEx = 95_i32
  INDEX_DrvAssociateSharedSurface = 96_i32
  INDEX_DrvSynchronizeRedirectionBitmaps = 97_i32
  INDEX_DrvAccumulateD3DDirtyRect = 98_i32
  INDEX_DrvStartDxInterop = 99_i32
  INDEX_DrvEndDxInterop = 100_i32
  INDEX_DrvLockDisplayArea = 101_i32
  INDEX_DrvUnlockDisplayArea = 102_i32
  INDEX_DrvSurfaceComplete = 103_i32
  INDEX_LAST = 89_i32
  GCAPS_BEZIERS = 1_u32
  GCAPS_GEOMETRICWIDE = 2_u32
  GCAPS_ALTERNATEFILL = 4_u32
  GCAPS_WINDINGFILL = 8_u32
  GCAPS_HALFTONE = 16_u32
  GCAPS_COLOR_DITHER = 32_u32
  GCAPS_HORIZSTRIKE = 64_u32
  GCAPS_VERTSTRIKE = 128_u32
  GCAPS_OPAQUERECT = 256_u32
  GCAPS_VECTORFONT = 512_u32
  GCAPS_MONO_DITHER = 1024_u32
  GCAPS_ASYNCCHANGE = 2048_u32
  GCAPS_ASYNCMOVE = 4096_u32
  GCAPS_DONTJOURNAL = 8192_u32
  GCAPS_DIRECTDRAW = 16384_u32
  GCAPS_ARBRUSHOPAQUE = 32768_u32
  GCAPS_PANNING = 65536_u32
  GCAPS_HIGHRESTEXT = 262144_u32
  GCAPS_PALMANAGED = 524288_u32
  GCAPS_DITHERONREALIZE = 2097152_u32
  GCAPS_NO64BITMEMACCESS = 4194304_u32
  GCAPS_FORCEDITHER = 8388608_u32
  GCAPS_GRAY16 = 16777216_u32
  GCAPS_ICM = 33554432_u32
  GCAPS_CMYKCOLOR = 67108864_u32
  GCAPS_LAYERED = 134217728_u32
  GCAPS_ARBRUSHTEXT = 268435456_u32
  GCAPS_SCREENPRECISION = 536870912_u32
  GCAPS_FONT_RASTERIZER = 1073741824_u32
  GCAPS_NUP = 2147483648_u32
  GCAPS2_JPEGSRC = 1_u32
  GCAPS2_xxxx = 2_u32
  GCAPS2_PNGSRC = 8_u32
  GCAPS2_CHANGEGAMMARAMP = 16_u32
  GCAPS2_ALPHACURSOR = 32_u32
  GCAPS2_SYNCFLUSH = 64_u32
  GCAPS2_SYNCTIMER = 128_u32
  GCAPS2_ICD_MULTIMON = 256_u32
  GCAPS2_MOUSETRAILS = 512_u32
  GCAPS2_RESERVED1 = 1024_u32
  GCAPS2_REMOTEDRIVER = 1024_u32
  GCAPS2_EXCLUDELAYERED = 2048_u32
  GCAPS2_INCLUDEAPIBITMAPS = 4096_u32
  GCAPS2_SHOWHIDDENPOINTER = 8192_u32
  GCAPS2_CLEARTYPE = 16384_u32
  GCAPS2_ACC_DRIVER = 32768_u32
  GCAPS2_BITMAPEXREUSE = 65536_u32
  LA_GEOMETRIC = 1_u32
  LA_ALTERNATE = 2_u32
  LA_STARTGAP = 4_u32
  LA_STYLED = 8_u32
  JOIN_ROUND = 0_i32
  JOIN_BEVEL = 1_i32
  JOIN_MITER = 2_i32
  ENDCAP_ROUND = 0_i32
  ENDCAP_SQUARE = 1_i32
  ENDCAP_BUTT = 2_i32
  PRIMARY_ORDER_ABC = 0_u32
  PRIMARY_ORDER_ACB = 1_u32
  PRIMARY_ORDER_BAC = 2_u32
  PRIMARY_ORDER_BCA = 3_u32
  PRIMARY_ORDER_CBA = 4_u32
  PRIMARY_ORDER_CAB = 5_u32
  HT_PATSIZE_2x2 = 0_u32
  HT_PATSIZE_2x2_M = 1_u32
  HT_PATSIZE_4x4 = 2_u32
  HT_PATSIZE_4x4_M = 3_u32
  HT_PATSIZE_6x6 = 4_u32
  HT_PATSIZE_6x6_M = 5_u32
  HT_PATSIZE_8x8 = 6_u32
  HT_PATSIZE_8x8_M = 7_u32
  HT_PATSIZE_10x10 = 8_u32
  HT_PATSIZE_10x10_M = 9_u32
  HT_PATSIZE_12x12 = 10_u32
  HT_PATSIZE_12x12_M = 11_u32
  HT_PATSIZE_14x14 = 12_u32
  HT_PATSIZE_14x14_M = 13_u32
  HT_PATSIZE_16x16 = 14_u32
  HT_PATSIZE_16x16_M = 15_u32
  HT_PATSIZE_SUPERCELL = 16_u32
  HT_PATSIZE_SUPERCELL_M = 17_u32
  HT_PATSIZE_USER = 18_u32
  HT_PATSIZE_MAX_INDEX = 18_u32
  HT_PATSIZE_DEFAULT = 17_u32
  HT_USERPAT_CX_MIN = 4_u32
  HT_USERPAT_CX_MAX = 256_u32
  HT_USERPAT_CY_MIN = 4_u32
  HT_USERPAT_CY_MAX = 256_u32
  HT_FORMAT_1BPP = 0_u32
  HT_FORMAT_4BPP = 2_u32
  HT_FORMAT_4BPP_IRGB = 3_u32
  HT_FORMAT_8BPP = 4_u32
  HT_FORMAT_16BPP = 5_u32
  HT_FORMAT_24BPP = 6_u32
  HT_FORMAT_32BPP = 7_u32
  WINDDI_MAX_BROADCAST_CONTEXT = 64_u32
  HT_FLAG_SQUARE_DEVICE_PEL = 1_u32
  HT_FLAG_HAS_BLACK_DYE = 2_u32
  HT_FLAG_ADDITIVE_PRIMS = 4_u32
  HT_FLAG_USE_8BPP_BITMASK = 8_u32
  HT_FLAG_INK_HIGH_ABSORPTION = 16_u32
  HT_FLAG_INK_ABSORPTION_INDICES = 96_u32
  HT_FLAG_DO_DEVCLR_XFORM = 128_u32
  HT_FLAG_OUTPUT_CMY = 256_u32
  HT_FLAG_PRINT_DRAFT_MODE = 512_u32
  HT_FLAG_INVERT_8BPP_BITMASK_IDX = 1024_u32
  HT_FLAG_8BPP_CMY332_MASK = 4278190080_u32
  HT_FLAG_INK_ABSORPTION_IDX0 = 0_u32
  HT_FLAG_INK_ABSORPTION_IDX1 = 32_u32
  HT_FLAG_INK_ABSORPTION_IDX2 = 64_u32
  HT_FLAG_INK_ABSORPTION_IDX3 = 96_u32
  HT_FLAG_NORMAL_INK_ABSORPTION = 0_u32
  HT_FLAG_LOW_INK_ABSORPTION = 32_u32
  HT_FLAG_LOWER_INK_ABSORPTION = 64_u32
  HT_FLAG_LOWEST_INK_ABSORPTION = 96_u32
  PPC_DEFAULT = 0_u32
  PPC_UNDEFINED = 1_u32
  PPC_RGB_ORDER_VERTICAL_STRIPES = 2_u32
  PPC_BGR_ORDER_VERTICAL_STRIPES = 3_u32
  PPC_RGB_ORDER_HORIZONTAL_STRIPES = 4_u32
  PPC_BGR_ORDER_HORIZONTAL_STRIPES = 5_u32
  PPG_DEFAULT = 0_u32
  PPG_SRGB = 1_u32
  BR_DEVICE_ICM = 1_u32
  BR_HOST_ICM = 2_u32
  BR_CMYKCOLOR = 4_u32
  BR_ORIGCOLOR = 8_u32
  FO_SIM_BOLD = 8192_u32
  FO_SIM_ITALIC = 16384_u32
  FO_EM_HEIGHT = 32768_u32
  FO_GRAY16 = 65536_u32
  FO_NOGRAY16 = 131072_u32
  FO_NOHINTS = 262144_u32
  FO_NO_CHOICE = 524288_u32
  FO_CFF = 1048576_u32
  FO_POSTSCRIPT = 2097152_u32
  FO_MULTIPLEMASTER = 4194304_u32
  FO_VERT_FACE = 8388608_u32
  FO_DBCS_FONT = 16777216_u32
  FO_NOCLEARTYPE = 33554432_u32
  FO_CLEARTYPE_X = 268435456_u32
  FO_CLEARTYPE_Y = 536870912_u32
  FO_CLEARTYPENATURAL_X = 1073741824_u32
  DC_TRIVIAL = 0_u32
  DC_RECT = 1_u32
  DC_COMPLEX = 3_u32
  FC_RECT = 1_u32
  FC_RECT4 = 2_u32
  FC_COMPLEX = 3_u32
  TC_RECTANGLES = 0_u32
  TC_PATHOBJ = 2_u32
  OC_BANK_CLIP = 1_u32
  CT_RECTANGLES = 0_i32
  CD_RIGHTDOWN = 0_i32
  CD_LEFTDOWN = 1_i32
  CD_RIGHTUP = 2_i32
  CD_LEFTUP = 3_i32
  CD_ANY = 4_i32
  CD_LEFTWARDS = 1_i32
  CD_UPWARDS = 2_i32
  FO_HGLYPHS = 0_i32
  FO_GLYPHBITS = 1_i32
  FO_PATHOBJ = 2_i32
  FD_NEGATIVE_FONT = 1_i32
  FO_DEVICE_FONT = 1_i32
  FO_OUTLINE_CAPABLE = 2_i32
  SO_FLAG_DEFAULT_PLACEMENT = 1_u32
  SO_HORIZONTAL = 2_u32
  SO_VERTICAL = 4_u32
  SO_REVERSED = 8_u32
  SO_ZERO_BEARINGS = 16_u32
  SO_CHAR_INC_EQUAL_BM_BASE = 32_u32
  SO_MAXEXT_EQUAL_BM_SIDE = 64_u32
  SO_DO_NOT_SUBSTITUTE_DEVICE_FONT = 128_u32
  SO_GLYPHINDEX_TEXTOUT = 256_u32
  SO_ESC_NOT_ORIENT = 512_u32
  SO_DXDY = 1024_u32
  SO_CHARACTER_EXTRA = 2048_u32
  SO_BREAK_EXTRA = 4096_u32
  FO_ATTR_MODE_ROTATE = 1_u32
  PAL_INDEXED = 1_u32
  PAL_BITFIELDS = 2_u32
  PAL_RGB = 4_u32
  PAL_BGR = 8_u32
  PAL_CMYK = 16_u32
  PO_BEZIERS = 1_u32
  PO_ELLIPSE = 2_u32
  PO_ALL_INTEGERS = 4_u32
  PO_ENUM_AS_INTEGERS = 8_u32
  PO_WIDENED = 16_u32
  PD_BEGINSUBPATH = 1_u32
  PD_ENDSUBPATH = 2_u32
  PD_RESETSTYLE = 4_u32
  PD_CLOSEFIGURE = 8_u32
  PD_BEZIERS = 16_u32
  SGI_EXTRASPACE = 0_u32
  STYPE_BITMAP = 0_i32
  STYPE_DEVBITMAP = 3_i32
  BMF_1BPP = 1_i32
  BMF_4BPP = 2_i32
  BMF_8BPP = 3_i32
  BMF_16BPP = 4_i32
  BMF_24BPP = 5_i32
  BMF_32BPP = 6_i32
  BMF_4RLE = 7_i32
  BMF_8RLE = 8_i32
  BMF_JPEG = 9_i32
  BMF_PNG = 10_i32
  BMF_TOPDOWN = 1_u32
  BMF_NOZEROINIT = 2_u32
  BMF_DONTCACHE = 4_u32
  BMF_USERMEM = 8_u32
  BMF_KMSECTION = 16_u32
  BMF_NOTSYSMEM = 32_u32
  BMF_WINDOW_BLT = 64_u32
  BMF_UMPDMEM = 128_u32
  BMF_TEMP_ALPHA = 256_u32
  BMF_ACC_NOTIFY = 32768_u32
  BMF_RMT_ENTER = 16384_u32
  BMF_RESERVED = 15872_u32
  GX_IDENTITY = 0_i32
  GX_OFFSET = 1_i32
  GX_SCALE = 2_i32
  GX_GENERAL = 3_i32
  XF_LTOL = 0_i32
  XF_INV_LTOL = 1_i32
  XF_LTOFX = 2_i32
  XF_INV_FXTOL = 3_i32
  XO_TRIVIAL = 1_u32
  XO_TABLE = 2_u32
  XO_TO_MONO = 4_u32
  XO_FROM_CMYK = 8_u32
  XO_DEVICE_ICM = 16_u32
  XO_HOST_ICM = 32_u32
  XO_SRCPALETTE = 1_u32
  XO_DESTPALETTE = 2_u32
  XO_DESTDCPALETTE = 3_u32
  XO_SRCBITFIELDS = 4_u32
  XO_DESTBITFIELDS = 5_u32
  HOOK_BITBLT = 1_u32
  HOOK_STRETCHBLT = 2_u32
  HOOK_PLGBLT = 4_u32
  HOOK_TEXTOUT = 8_u32
  HOOK_PAINT = 16_u32
  HOOK_STROKEPATH = 32_u32
  HOOK_FILLPATH = 64_u32
  HOOK_STROKEANDFILLPATH = 128_u32
  HOOK_LINETO = 256_u32
  HOOK_COPYBITS = 1024_u32
  HOOK_MOVEPANNING = 2048_u32
  HOOK_SYNCHRONIZE = 4096_u32
  HOOK_STRETCHBLTROP = 8192_u32
  HOOK_SYNCHRONIZEACCESS = 16384_u32
  HOOK_TRANSPARENTBLT = 32768_u32
  HOOK_ALPHABLEND = 65536_u32
  HOOK_GRADIENTFILL = 131072_u32
  HOOK_FLAGS = 243199_u32
  MS_NOTSYSTEMMEMORY = 1_u32
  MS_SHAREDACCESS = 2_u32
  MS_CDDDEVICEBITMAP = 4_u32
  MS_REUSEDDEVICEBITMAP = 8_u32
  DRVQUERY_USERMODE = 1_u32
  HS_DDI_MAX = 6_u32
  DRD_SUCCESS = 0_u32
  DRD_ERROR = 1_u32
  SS_SAVE = 0_u32
  SS_RESTORE = 1_u32
  SS_FREE = 2_u32
  CDBEX_REDIRECTION = 1_u32
  CDBEX_DXINTEROP = 2_u32
  CDBEX_NTSHAREDSURFACEHANDLE = 4_u32
  CDBEX_CROSSADAPTER = 8_u32
  CDBEX_REUSE = 16_u32
  WINDDI_MAXSETPALETTECOLORS = 256_u32
  WINDDI_MAXSETPALETTECOLORINDEX = 255_u32
  DM_DEFAULT = 1_u32
  DM_MONOCHROME = 2_u32
  DCR_SOLID = 0_u32
  DCR_DRIVER = 1_u32
  DCR_HALFTONE = 2_u32
  RB_DITHERCOLOR = -2147483648_i32
  QFT_LIGATURES = 1_i32
  QFT_KERNPAIRS = 2_i32
  QFT_GLYPHSET = 3_i32
  QFD_GLYPHANDBITMAP = 1_i32
  QFD_GLYPHANDOUTLINE = 2_i32
  QFD_MAXEXTENTS = 3_i32
  QFD_TT_GLYPHANDBITMAP = 4_i32
  QFD_TT_GRAY1_BITMAP = 5_i32
  QFD_TT_GRAY2_BITMAP = 6_i32
  QFD_TT_GRAY4_BITMAP = 8_i32
  QFD_TT_GRAY8_BITMAP = 9_i32
  QFD_TT_MONO_BITMAP = 5_i32
  QC_OUTLINES = 1_u32
  QC_1BIT = 2_u32
  QC_4BIT = 4_u32
  FF_SIGNATURE_VERIFIED = 1_u32
  FF_IGNORED_SIGNATURE = 2_u32
  QAW_GETWIDTHS = 0_u32
  QAW_GETEASYWIDTHS = 1_u32
  TTO_METRICS_ONLY = 1_u32
  TTO_QUBICS = 2_u32
  TTO_UNHINTED = 4_u32
  QFF_DESCRIPTION = 1_i32
  QFF_NUMFACES = 2_i32
  FP_ALTERNATEMODE = 1_i32
  FP_WINDINGMODE = 2_i32
  SPS_ERROR = 0_u32
  SPS_DECLINE = 1_u32
  SPS_ACCEPT_NOEXCLUDE = 2_u32
  SPS_ACCEPT_EXCLUDE = 3_u32
  SPS_ACCEPT_SYNCHRONOUS = 4_u32
  SPS_CHANGE = 1_i32
  SPS_ASYNCCHANGE = 2_i32
  SPS_ANIMATESTART = 4_i32
  SPS_ANIMATEUPDATE = 8_i32
  SPS_ALPHA = 16_i32
  SPS_RESERVED = 32_i32
  SPS_RESERVED1 = 64_i32
  SPS_FLAGSMASK = 255_i32
  SPS_LENGTHMASK = 3840_i32
  SPS_FREQMASK = 1044480_i32
  ED_ABORTDOC = 1_u32
  IGRF_RGB_256BYTES = 0_u32
  IGRF_RGB_256WORDS = 1_u32
  QDS_CHECKJPEGFORMAT = 0_u32
  QDS_CHECKPNGFORMAT = 1_u32
  DSS_TIMER_EVENT = 1_u32
  DSS_FLUSH_EVENT = 2_u32
  DSS_RESERVED = 4_u32
  DSS_RESERVED1 = 8_u32
  DSS_RESERVED2 = 16_u32
  DN_ACCELERATION_LEVEL = 1_u32
  DN_DEVICE_ORIGIN = 2_u32
  DN_SLEEP_MODE = 3_u32
  DN_DRAWING_BEGIN = 4_u32
  DN_ASSOCIATE_WINDOW = 5_u32
  DN_COMPOSITION_CHANGED = 6_u32
  DN_DRAWING_BEGIN_APIBITMAP = 7_u32
  DN_SURFOBJ_DESTRUCTION = 8_u32
  WOC_RGN_CLIENT_DELTA = 1_u32
  WOC_RGN_CLIENT = 2_u32
  WOC_RGN_SURFACE_DELTA = 4_u32
  WOC_RGN_SURFACE = 8_u32
  WOC_CHANGED = 16_u32
  WOC_DELETE = 32_u32
  WOC_DRAWN = 64_u32
  WOC_SPRITE_OVERLAP = 128_u32
  WOC_SPRITE_NO_OVERLAP = 256_u32
  WOC_RGN_SPRITE = 512_u32
  WO_RGN_CLIENT_DELTA = 1_u32
  WO_RGN_CLIENT = 2_u32
  WO_RGN_SURFACE_DELTA = 4_u32
  WO_RGN_SURFACE = 8_u32
  WO_RGN_UPDATE_ALL = 16_u32
  WO_RGN_WINDOW = 32_u32
  WO_DRAW_NOTIFY = 64_u32
  WO_SPRITE_NOTIFY = 128_u32
  WO_RGN_DESKTOP_COORD = 256_u32
  WO_RGN_SPRITE = 512_u32
  EHN_RESTORED = 0_u32
  EHN_ERROR = 1_u32
  ECS_TEARDOWN = 1_u32
  ECS_REDRAW = 2_u32
  DEVHTADJF_COLOR_DEVICE = 1_u32
  DEVHTADJF_ADDITIVE_DEVICE = 2_u32
  FL_ZERO_MEMORY = 1_u32
  FL_NONPAGED_MEMORY = 2_u32
  FL_NON_SESSION = 4_u32
  QSA_MMX = 256_u32
  QSA_SSE = 8192_u32
  QSA_3DNOW = 16384_u32
  QSA_SSE1 = 8192_u32
  QSA_SSE2 = 65536_u32
  QSA_SSE3 = 524288_u32
  ENG_FNT_CACHE_READ_FAULT = 1_u32
  ENG_FNT_CACHE_WRITE_FAULT = 2_u32
  DRH_APIBITMAP = 1_u32
  MC_CAPS_NONE = 0_u32
  MC_CAPS_MONITOR_TECHNOLOGY_TYPE = 1_u32
  MC_CAPS_BRIGHTNESS = 2_u32
  MC_CAPS_CONTRAST = 4_u32
  MC_CAPS_COLOR_TEMPERATURE = 8_u32
  MC_CAPS_RED_GREEN_BLUE_GAIN = 16_u32
  MC_CAPS_RED_GREEN_BLUE_DRIVE = 32_u32
  MC_CAPS_DEGAUSS = 64_u32
  MC_CAPS_DISPLAY_AREA_POSITION = 128_u32
  MC_CAPS_DISPLAY_AREA_SIZE = 256_u32
  MC_CAPS_RESTORE_FACTORY_DEFAULTS = 1024_u32
  MC_CAPS_RESTORE_FACTORY_COLOR_DEFAULTS = 2048_u32
  MC_RESTORE_FACTORY_DEFAULTS_ENABLES_MONITOR_SETTINGS = 4096_u32
  MC_SUPPORTED_COLOR_TEMPERATURE_NONE = 0_u32
  MC_SUPPORTED_COLOR_TEMPERATURE_4000K = 1_u32
  MC_SUPPORTED_COLOR_TEMPERATURE_5000K = 2_u32
  MC_SUPPORTED_COLOR_TEMPERATURE_6500K = 4_u32
  MC_SUPPORTED_COLOR_TEMPERATURE_7500K = 8_u32
  MC_SUPPORTED_COLOR_TEMPERATURE_8200K = 16_u32
  MC_SUPPORTED_COLOR_TEMPERATURE_9300K = 32_u32
  MC_SUPPORTED_COLOR_TEMPERATURE_10000K = 64_u32
  MC_SUPPORTED_COLOR_TEMPERATURE_11500K = 128_u32
  PHYSICAL_MONITOR_DESCRIPTION_SIZE = 128_u32
  GETCONNECTEDIDS_TARGET = 0_u32
  GETCONNECTEDIDS_SOURCE = 1_u32
  S_INIT = 2_u32
  SETCONFIGURATION_STATUS_APPLIED = 0_u32
  SETCONFIGURATION_STATUS_ADDITIONAL = 1_u32
  SETCONFIGURATION_STATUS_OVERRIDDEN = 2_u32

  enum DISPLAYCONFIG_VIDEO_OUTPUT_TECHNOLOGY
    DISPLAYCONFIG_OUTPUT_TECHNOLOGY_OTHER = -1_i32
    DISPLAYCONFIG_OUTPUT_TECHNOLOGY_HD15 = 0_i32
    DISPLAYCONFIG_OUTPUT_TECHNOLOGY_SVIDEO = 1_i32
    DISPLAYCONFIG_OUTPUT_TECHNOLOGY_COMPOSITE_VIDEO = 2_i32
    DISPLAYCONFIG_OUTPUT_TECHNOLOGY_COMPONENT_VIDEO = 3_i32
    DISPLAYCONFIG_OUTPUT_TECHNOLOGY_DVI = 4_i32
    DISPLAYCONFIG_OUTPUT_TECHNOLOGY_HDMI = 5_i32
    DISPLAYCONFIG_OUTPUT_TECHNOLOGY_LVDS = 6_i32
    DISPLAYCONFIG_OUTPUT_TECHNOLOGY_D_JPN = 8_i32
    DISPLAYCONFIG_OUTPUT_TECHNOLOGY_SDI = 9_i32
    DISPLAYCONFIG_OUTPUT_TECHNOLOGY_DISPLAYPORT_EXTERNAL = 10_i32
    DISPLAYCONFIG_OUTPUT_TECHNOLOGY_DISPLAYPORT_EMBEDDED = 11_i32
    DISPLAYCONFIG_OUTPUT_TECHNOLOGY_UDI_EXTERNAL = 12_i32
    DISPLAYCONFIG_OUTPUT_TECHNOLOGY_UDI_EMBEDDED = 13_i32
    DISPLAYCONFIG_OUTPUT_TECHNOLOGY_SDTVDONGLE = 14_i32
    DISPLAYCONFIG_OUTPUT_TECHNOLOGY_MIRACAST = 15_i32
    DISPLAYCONFIG_OUTPUT_TECHNOLOGY_INDIRECT_WIRED = 16_i32
    DISPLAYCONFIG_OUTPUT_TECHNOLOGY_INDIRECT_VIRTUAL = 17_i32
    DISPLAYCONFIG_OUTPUT_TECHNOLOGY_DISPLAYPORT_USB_TUNNEL = 18_i32
    DISPLAYCONFIG_OUTPUT_TECHNOLOGY_INTERNAL = -2147483648_i32
    DISPLAYCONFIG_OUTPUT_TECHNOLOGY_FORCE_UINT32 = -1_i32
  end
  enum DISPLAYCONFIG_SCANLINE_ORDERING
    DISPLAYCONFIG_SCANLINE_ORDERING_UNSPECIFIED = 0_i32
    DISPLAYCONFIG_SCANLINE_ORDERING_PROGRESSIVE = 1_i32
    DISPLAYCONFIG_SCANLINE_ORDERING_INTERLACED = 2_i32
    DISPLAYCONFIG_SCANLINE_ORDERING_INTERLACED_UPPERFIELDFIRST = 2_i32
    DISPLAYCONFIG_SCANLINE_ORDERING_INTERLACED_LOWERFIELDFIRST = 3_i32
    DISPLAYCONFIG_SCANLINE_ORDERING_FORCE_UINT32 = -1_i32
  end
  enum DISPLAYCONFIG_SCALING
    DISPLAYCONFIG_SCALING_IDENTITY = 1_i32
    DISPLAYCONFIG_SCALING_CENTERED = 2_i32
    DISPLAYCONFIG_SCALING_STRETCHED = 3_i32
    DISPLAYCONFIG_SCALING_ASPECTRATIOCENTEREDMAX = 4_i32
    DISPLAYCONFIG_SCALING_CUSTOM = 5_i32
    DISPLAYCONFIG_SCALING_PREFERRED = 128_i32
    DISPLAYCONFIG_SCALING_FORCE_UINT32 = -1_i32
  end
  enum DISPLAYCONFIG_ROTATION
    DISPLAYCONFIG_ROTATION_IDENTITY = 1_i32
    DISPLAYCONFIG_ROTATION_ROTATE90 = 2_i32
    DISPLAYCONFIG_ROTATION_ROTATE180 = 3_i32
    DISPLAYCONFIG_ROTATION_ROTATE270 = 4_i32
    DISPLAYCONFIG_ROTATION_FORCE_UINT32 = -1_i32
  end
  enum DISPLAYCONFIG_MODE_INFO_TYPE
    DISPLAYCONFIG_MODE_INFO_TYPE_SOURCE = 1_i32
    DISPLAYCONFIG_MODE_INFO_TYPE_TARGET = 2_i32
    DISPLAYCONFIG_MODE_INFO_TYPE_DESKTOP_IMAGE = 3_i32
    DISPLAYCONFIG_MODE_INFO_TYPE_FORCE_UINT32 = -1_i32
  end
  enum DISPLAYCONFIG_PIXELFORMAT
    DISPLAYCONFIG_PIXELFORMAT_8BPP = 1_i32
    DISPLAYCONFIG_PIXELFORMAT_16BPP = 2_i32
    DISPLAYCONFIG_PIXELFORMAT_24BPP = 3_i32
    DISPLAYCONFIG_PIXELFORMAT_32BPP = 4_i32
    DISPLAYCONFIG_PIXELFORMAT_NONGDI = 5_i32
    DISPLAYCONFIG_PIXELFORMAT_FORCE_UINT32 = -1_i32
  end
  enum DISPLAYCONFIG_TOPOLOGY_ID
    DISPLAYCONFIG_TOPOLOGY_INTERNAL = 1_i32
    DISPLAYCONFIG_TOPOLOGY_CLONE = 2_i32
    DISPLAYCONFIG_TOPOLOGY_EXTEND = 4_i32
    DISPLAYCONFIG_TOPOLOGY_EXTERNAL = 8_i32
    DISPLAYCONFIG_TOPOLOGY_FORCE_UINT32 = -1_i32
  end
  enum DISPLAYCONFIG_DEVICE_INFO_TYPE
    DISPLAYCONFIG_DEVICE_INFO_GET_SOURCE_NAME = 1_i32
    DISPLAYCONFIG_DEVICE_INFO_GET_TARGET_NAME = 2_i32
    DISPLAYCONFIG_DEVICE_INFO_GET_TARGET_PREFERRED_MODE = 3_i32
    DISPLAYCONFIG_DEVICE_INFO_GET_ADAPTER_NAME = 4_i32
    DISPLAYCONFIG_DEVICE_INFO_SET_TARGET_PERSISTENCE = 5_i32
    DISPLAYCONFIG_DEVICE_INFO_GET_TARGET_BASE_TYPE = 6_i32
    DISPLAYCONFIG_DEVICE_INFO_GET_SUPPORT_VIRTUAL_RESOLUTION = 7_i32
    DISPLAYCONFIG_DEVICE_INFO_SET_SUPPORT_VIRTUAL_RESOLUTION = 8_i32
    DISPLAYCONFIG_DEVICE_INFO_GET_ADVANCED_COLOR_INFO = 9_i32
    DISPLAYCONFIG_DEVICE_INFO_SET_ADVANCED_COLOR_STATE = 10_i32
    DISPLAYCONFIG_DEVICE_INFO_GET_SDR_WHITE_LEVEL = 11_i32
    DISPLAYCONFIG_DEVICE_INFO_GET_MONITOR_SPECIALIZATION = 12_i32
    DISPLAYCONFIG_DEVICE_INFO_SET_MONITOR_SPECIALIZATION = 13_i32
    DISPLAYCONFIG_DEVICE_INFO_FORCE_UINT32 = -1_i32
  end
  enum MC_VCP_CODE_TYPE
    MC_MOMENTARY = 0_i32
    MC_SET_PARAMETER = 1_i32
  end
  enum MC_DISPLAY_TECHNOLOGY_TYPE
    MC_SHADOW_MASK_CATHODE_RAY_TUBE = 0_i32
    MC_APERTURE_GRILL_CATHODE_RAY_TUBE = 1_i32
    MC_THIN_FILM_TRANSISTOR = 2_i32
    MC_LIQUID_CRYSTAL_ON_SILICON = 3_i32
    MC_PLASMA = 4_i32
    MC_ORGANIC_LIGHT_EMITTING_DIODE = 5_i32
    MC_ELECTROLUMINESCENT = 6_i32
    MC_MICROELECTROMECHANICAL = 7_i32
    MC_FIELD_EMISSION_DEVICE = 8_i32
  end
  enum MC_DRIVE_TYPE
    MC_RED_DRIVE = 0_i32
    MC_GREEN_DRIVE = 1_i32
    MC_BLUE_DRIVE = 2_i32
  end
  enum MC_GAIN_TYPE
    MC_RED_GAIN = 0_i32
    MC_GREEN_GAIN = 1_i32
    MC_BLUE_GAIN = 2_i32
  end
  enum MC_POSITION_TYPE
    MC_HORIZONTAL_POSITION = 0_i32
    MC_VERTICAL_POSITION = 1_i32
  end
  enum MC_SIZE_TYPE
    MC_WIDTH = 0_i32
    MC_HEIGHT = 1_i32
  end
  enum MC_COLOR_TEMPERATURE
    MC_COLOR_TEMPERATURE_UNKNOWN = 0_i32
    MC_COLOR_TEMPERATURE_4000K = 1_i32
    MC_COLOR_TEMPERATURE_5000K = 2_i32
    MC_COLOR_TEMPERATURE_6500K = 3_i32
    MC_COLOR_TEMPERATURE_7500K = 4_i32
    MC_COLOR_TEMPERATURE_8200K = 5_i32
    MC_COLOR_TEMPERATURE_9300K = 6_i32
    MC_COLOR_TEMPERATURE_10000K = 7_i32
    MC_COLOR_TEMPERATURE_11500K = 8_i32
  end
  enum ENG_SYSTEM_ATTRIBUTE
    EngProcessorFeature = 1_i32
    EngNumberOfProcessors = 2_i32
    EngOptimumAvailableUserMemory = 3_i32
    EngOptimumAvailableSystemMemory = 4_i32
  end
  enum ENG_DEVICE_ATTRIBUTE
    QDA_RESERVED = 0_i32
    QDA_ACCELERATION_LEVEL = 1_i32
  end
  enum VIDEO_WIN32K_CALLBACKS_PARAMS_TYPE
    VideoPowerNotifyCallout = 1_i32
    VideoEnumChildPdoNotifyCallout = 3_i32
    VideoFindAdapterCallout = 4_i32
    VideoPnpNotifyCallout = 7_i32
    VideoDxgkDisplaySwitchCallout = 8_i32
    VideoDxgkFindAdapterTdrCallout = 10_i32
    VideoDxgkHardwareProtectionTeardown = 11_i32
    VideoRepaintDesktop = 12_i32
    VideoUpdateCursor = 13_i32
    VideoDisableMultiPlaneOverlay = 14_i32
    VideoDesktopDuplicationChange = 15_i32
    VideoBlackScreenDiagnostics = 16_i32
  end
  enum BlackScreenDiagnosticsCalloutParam
    BlackScreenDiagnosticsData = 1_i32
    BlackScreenDisplayRecovery = 2_i32
  end
  enum VIDEO_BANK_TYPE
    VideoNotBanked = 0_i32
    VideoBanked1RW = 1_i32
    VideoBanked1R1W = 2_i32
    VideoBanked2RW = 3_i32
    NumVideoBankTypes = 4_i32
  end
  enum VIDEO_POWER_STATE
    VideoPowerUnspecified = 0_i32
    VideoPowerOn = 1_i32
    VideoPowerStandBy = 2_i32
    VideoPowerSuspend = 3_i32
    VideoPowerOff = 4_i32
    VideoPowerHibernate = 5_i32
    VideoPowerShutdown = 6_i32
    VideoPowerMaximum = 7_i32
  end
  enum BRIGHTNESS_INTERFACE_VERSION
    BRIGHTNESS_INTERFACE_VERSION_1 = 1_i32
    BRIGHTNESS_INTERFACE_VERSION_2 = 2_i32
    BRIGHTNESS_INTERFACE_VERSION_3 = 3_i32
  end
  enum BACKLIGHT_OPTIMIZATION_LEVEL
    BacklightOptimizationDisable = 0_i32
    BacklightOptimizationDesktop = 1_i32
    BacklightOptimizationDynamic = 2_i32
    BacklightOptimizationDimmed = 3_i32
    BacklightOptimizationEDR = 4_i32
  end
  enum COLORSPACE_TRANSFORM_DATA_TYPE
    COLORSPACE_TRANSFORM_DATA_TYPE_FIXED_POINT = 0_i32
    COLORSPACE_TRANSFORM_DATA_TYPE_FLOAT = 1_i32
  end
  enum COLORSPACE_TRANSFORM_TARGET_CAPS_VERSION
    COLORSPACE_TRANSFORM_VERSION_DEFAULT = 0_i32
    COLORSPACE_TRANSFORM_VERSION_1 = 1_i32
    COLORSPACE_TRANSFORM_VERSION_NOT_SUPPORTED = 0_i32
  end
  enum COLORSPACE_TRANSFORM_TYPE
    COLORSPACE_TRANSFORM_TYPE_UNINITIALIZED = 0_i32
    COLORSPACE_TRANSFORM_TYPE_DEFAULT = 1_i32
    COLORSPACE_TRANSFORM_TYPE_RGB256x3x16 = 2_i32
    COLORSPACE_TRANSFORM_TYPE_DXGI_1 = 3_i32
    COLORSPACE_TRANSFORM_TYPE_MATRIX_3x4 = 4_i32
    COLORSPACE_TRANSFORM_TYPE_MATRIX_V2 = 5_i32
  end
  enum OUTPUT_WIRE_COLOR_SPACE_TYPE
    OUTPUT_WIRE_COLOR_SPACE_G22_P709 = 0_i32
    OUTPUT_WIRE_COLOR_SPACE_RESERVED = 4_i32
    OUTPUT_WIRE_COLOR_SPACE_G2084_P2020 = 12_i32
    OUTPUT_WIRE_COLOR_SPACE_G22_P709_WCG = 30_i32
    OUTPUT_WIRE_COLOR_SPACE_G22_P2020 = 31_i32
    OUTPUT_WIRE_COLOR_SPACE_G2084_P2020_HDR10PLUS = 32_i32
    OUTPUT_WIRE_COLOR_SPACE_G2084_P2020_DVLL = 33_i32
  end
  enum OUTPUT_COLOR_ENCODING
    OUTPUT_COLOR_ENCODING_RGB = 0_i32
    OUTPUT_COLOR_ENCODING_YCBCR444 = 1_i32
    OUTPUT_COLOR_ENCODING_YCBCR422 = 2_i32
    OUTPUT_COLOR_ENCODING_YCBCR420 = 3_i32
    OUTPUT_COLOR_ENCODING_INTENSITY = 4_i32
    OUTPUT_COLOR_ENCODING_FORCE_UINT32 = -1_i32
  end
  enum COLORSPACE_TRANSFORM_STAGE_CONTROL
    ColorSpaceTransformStageControl_No_Change = 0_i32
    ColorSpaceTransformStageControl_Enable = 1_i32
    ColorSpaceTransformStageControl_Bypass = 2_i32
  end
  enum DSI_CONTROL_TRANSMISSION_MODE
    DCT_DEFAULT = 0_i32
    DCT_FORCE_LOW_POWER = 1_i32
    DCT_FORCE_HIGH_PERFORMANCE = 2_i32
  end
  enum AR_STATE
    AR_ENABLED = 0_i32
    AR_DISABLED = 1_i32
    AR_SUPPRESSED = 2_i32
    AR_REMOTESESSION = 4_i32
    AR_MULTIMON = 8_i32
    AR_NOSENSOR = 16_i32
    AR_NOT_SUPPORTED = 32_i32
    AR_DOCKED = 64_i32
    AR_LAPTOP = 128_i32
  end
  enum ORIENTATION_PREFERENCE
    ORIENTATION_PREFERENCE_NONE = 0_i32
    ORIENTATION_PREFERENCE_LANDSCAPE = 1_i32
    ORIENTATION_PREFERENCE_PORTRAIT = 2_i32
    ORIENTATION_PREFERENCE_LANDSCAPE_FLIPPED = 4_i32
    ORIENTATION_PREFERENCE_PORTRAIT_FLIPPED = 8_i32
  end

  @[Extern]
  struct DISPLAYCONFIG_RATIONAL
    property numerator : UInt32
    property denominator : UInt32
    def initialize(@numerator : UInt32, @denominator : UInt32)
    end
  end

  @[Extern]
  struct DISPLAYCONFIG_2DREGION
    property cx : UInt32
    property cy : UInt32
    def initialize(@cx : UInt32, @cy : UInt32)
    end
  end

  @[Extern]
  struct DISPLAYCONFIG_VIDEO_SIGNAL_INFO
    property pixelRate : UInt64
    property hSyncFreq : Win32cr::Devices::Display::DISPLAYCONFIG_RATIONAL
    property vSyncFreq : Win32cr::Devices::Display::DISPLAYCONFIG_RATIONAL
    property activeSize : Win32cr::Devices::Display::DISPLAYCONFIG_2DREGION
    property totalSize : Win32cr::Devices::Display::DISPLAYCONFIG_2DREGION
    property anonymous : Anonymous_e__Union_
    property scanLineOrdering : Win32cr::Devices::Display::DISPLAYCONFIG_SCANLINE_ORDERING

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property additional_signal_info : AdditionalSignalInfo_e__Struct_
    property videoStandard : UInt32

      # Nested Type AdditionalSignalInfo_e__Struct_
      @[Extern]
      struct AdditionalSignalInfo_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
      end

    def initialize(@additional_signal_info : AdditionalSignalInfo_e__Struct_, @videoStandard : UInt32)
    end
    end

    def initialize(@pixelRate : UInt64, @hSyncFreq : Win32cr::Devices::Display::DISPLAYCONFIG_RATIONAL, @vSyncFreq : Win32cr::Devices::Display::DISPLAYCONFIG_RATIONAL, @activeSize : Win32cr::Devices::Display::DISPLAYCONFIG_2DREGION, @totalSize : Win32cr::Devices::Display::DISPLAYCONFIG_2DREGION, @anonymous : Anonymous_e__Union_, @scanLineOrdering : Win32cr::Devices::Display::DISPLAYCONFIG_SCANLINE_ORDERING)
    end
  end

  @[Extern]
  struct DISPLAYCONFIG_SOURCE_MODE
    property width : UInt32
    property height : UInt32
    property pixelFormat : Win32cr::Devices::Display::DISPLAYCONFIG_PIXELFORMAT
    property position : Win32cr::Foundation::POINTL
    def initialize(@width : UInt32, @height : UInt32, @pixelFormat : Win32cr::Devices::Display::DISPLAYCONFIG_PIXELFORMAT, @position : Win32cr::Foundation::POINTL)
    end
  end

  @[Extern]
  struct DISPLAYCONFIG_TARGET_MODE
    property targetVideoSignalInfo : Win32cr::Devices::Display::DISPLAYCONFIG_VIDEO_SIGNAL_INFO
    def initialize(@targetVideoSignalInfo : Win32cr::Devices::Display::DISPLAYCONFIG_VIDEO_SIGNAL_INFO)
    end
  end

  @[Extern]
  struct DISPLAYCONFIG_DESKTOP_IMAGE_INFO
    property path_source_size : Win32cr::Foundation::POINTL
    property desktop_image_region : Win32cr::Foundation::RECTL
    property desktop_image_clip : Win32cr::Foundation::RECTL
    def initialize(@path_source_size : Win32cr::Foundation::POINTL, @desktop_image_region : Win32cr::Foundation::RECTL, @desktop_image_clip : Win32cr::Foundation::RECTL)
    end
  end

  @[Extern]
  struct DISPLAYCONFIG_MODE_INFO
    property infoType : Win32cr::Devices::Display::DISPLAYCONFIG_MODE_INFO_TYPE
    property id : UInt32
    property adapterId : Win32cr::Foundation::LUID
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property targetMode : Win32cr::Devices::Display::DISPLAYCONFIG_TARGET_MODE
    property sourceMode : Win32cr::Devices::Display::DISPLAYCONFIG_SOURCE_MODE
    property desktopImageInfo : Win32cr::Devices::Display::DISPLAYCONFIG_DESKTOP_IMAGE_INFO
    def initialize(@targetMode : Win32cr::Devices::Display::DISPLAYCONFIG_TARGET_MODE, @sourceMode : Win32cr::Devices::Display::DISPLAYCONFIG_SOURCE_MODE, @desktopImageInfo : Win32cr::Devices::Display::DISPLAYCONFIG_DESKTOP_IMAGE_INFO)
    end
    end

    def initialize(@infoType : Win32cr::Devices::Display::DISPLAYCONFIG_MODE_INFO_TYPE, @id : UInt32, @adapterId : Win32cr::Foundation::LUID, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct DISPLAYCONFIG_PATH_SOURCE_INFO
    property adapterId : Win32cr::Foundation::LUID
    property id : UInt32
    property anonymous : Anonymous_e__Union_
    property statusFlags : UInt32

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property modeInfoIdx : UInt32
    property anonymous : Anonymous_e__Struct_

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
      end

    def initialize(@modeInfoIdx : UInt32, @anonymous : Anonymous_e__Struct_)
    end
    end

    def initialize(@adapterId : Win32cr::Foundation::LUID, @id : UInt32, @anonymous : Anonymous_e__Union_, @statusFlags : UInt32)
    end
  end

  @[Extern]
  struct DISPLAYCONFIG_PATH_TARGET_INFO
    property adapterId : Win32cr::Foundation::LUID
    property id : UInt32
    property anonymous : Anonymous_e__Union_
    property outputTechnology : Win32cr::Devices::Display::DISPLAYCONFIG_VIDEO_OUTPUT_TECHNOLOGY
    property rotation : Win32cr::Devices::Display::DISPLAYCONFIG_ROTATION
    property scaling : Win32cr::Devices::Display::DISPLAYCONFIG_SCALING
    property refreshRate : Win32cr::Devices::Display::DISPLAYCONFIG_RATIONAL
    property scanLineOrdering : Win32cr::Devices::Display::DISPLAYCONFIG_SCANLINE_ORDERING
    property targetAvailable : Win32cr::Foundation::BOOL
    property statusFlags : UInt32

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property modeInfoIdx : UInt32
    property anonymous : Anonymous_e__Struct_

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
      end

    def initialize(@modeInfoIdx : UInt32, @anonymous : Anonymous_e__Struct_)
    end
    end

    def initialize(@adapterId : Win32cr::Foundation::LUID, @id : UInt32, @anonymous : Anonymous_e__Union_, @outputTechnology : Win32cr::Devices::Display::DISPLAYCONFIG_VIDEO_OUTPUT_TECHNOLOGY, @rotation : Win32cr::Devices::Display::DISPLAYCONFIG_ROTATION, @scaling : Win32cr::Devices::Display::DISPLAYCONFIG_SCALING, @refreshRate : Win32cr::Devices::Display::DISPLAYCONFIG_RATIONAL, @scanLineOrdering : Win32cr::Devices::Display::DISPLAYCONFIG_SCANLINE_ORDERING, @targetAvailable : Win32cr::Foundation::BOOL, @statusFlags : UInt32)
    end
  end

  @[Extern]
  struct DISPLAYCONFIG_PATH_INFO
    property sourceInfo : Win32cr::Devices::Display::DISPLAYCONFIG_PATH_SOURCE_INFO
    property targetInfo : Win32cr::Devices::Display::DISPLAYCONFIG_PATH_TARGET_INFO
    property flags : UInt32
    def initialize(@sourceInfo : Win32cr::Devices::Display::DISPLAYCONFIG_PATH_SOURCE_INFO, @targetInfo : Win32cr::Devices::Display::DISPLAYCONFIG_PATH_TARGET_INFO, @flags : UInt32)
    end
  end

  @[Extern]
  struct DISPLAYCONFIG_DEVICE_INFO_HEADER
    property type__ : Win32cr::Devices::Display::DISPLAYCONFIG_DEVICE_INFO_TYPE
    property size : UInt32
    property adapterId : Win32cr::Foundation::LUID
    property id : UInt32
    def initialize(@type__ : Win32cr::Devices::Display::DISPLAYCONFIG_DEVICE_INFO_TYPE, @size : UInt32, @adapterId : Win32cr::Foundation::LUID, @id : UInt32)
    end
  end

  @[Extern]
  struct DISPLAYCONFIG_SOURCE_DEVICE_NAME
    property header : Win32cr::Devices::Display::DISPLAYCONFIG_DEVICE_INFO_HEADER
    property viewGdiDeviceName : UInt16[32]
    def initialize(@header : Win32cr::Devices::Display::DISPLAYCONFIG_DEVICE_INFO_HEADER, @viewGdiDeviceName : UInt16[32])
    end
  end

  @[Extern]
  struct DISPLAYCONFIG_TARGET_DEVICE_NAME_FLAGS
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property anonymous : Anonymous_e__Struct_
    property value : UInt32

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
      end

    def initialize(@anonymous : Anonymous_e__Struct_, @value : UInt32)
    end
    end

    def initialize(@anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct DISPLAYCONFIG_TARGET_DEVICE_NAME
    property header : Win32cr::Devices::Display::DISPLAYCONFIG_DEVICE_INFO_HEADER
    property flags : Win32cr::Devices::Display::DISPLAYCONFIG_TARGET_DEVICE_NAME_FLAGS
    property outputTechnology : Win32cr::Devices::Display::DISPLAYCONFIG_VIDEO_OUTPUT_TECHNOLOGY
    property edidManufactureId : UInt16
    property edidProductCodeId : UInt16
    property connectorInstance : UInt32
    property monitorFriendlyDeviceName : UInt16[64]
    property monitorDevicePath : UInt16[128]
    def initialize(@header : Win32cr::Devices::Display::DISPLAYCONFIG_DEVICE_INFO_HEADER, @flags : Win32cr::Devices::Display::DISPLAYCONFIG_TARGET_DEVICE_NAME_FLAGS, @outputTechnology : Win32cr::Devices::Display::DISPLAYCONFIG_VIDEO_OUTPUT_TECHNOLOGY, @edidManufactureId : UInt16, @edidProductCodeId : UInt16, @connectorInstance : UInt32, @monitorFriendlyDeviceName : UInt16[64], @monitorDevicePath : UInt16[128])
    end
  end

  @[Extern]
  struct DISPLAYCONFIG_TARGET_PREFERRED_MODE
    property header : Win32cr::Devices::Display::DISPLAYCONFIG_DEVICE_INFO_HEADER
    property width : UInt32
    property height : UInt32
    property targetMode : Win32cr::Devices::Display::DISPLAYCONFIG_TARGET_MODE
    def initialize(@header : Win32cr::Devices::Display::DISPLAYCONFIG_DEVICE_INFO_HEADER, @width : UInt32, @height : UInt32, @targetMode : Win32cr::Devices::Display::DISPLAYCONFIG_TARGET_MODE)
    end
  end

  @[Extern]
  struct DISPLAYCONFIG_ADAPTER_NAME
    property header : Win32cr::Devices::Display::DISPLAYCONFIG_DEVICE_INFO_HEADER
    property adapterDevicePath : UInt16[128]
    def initialize(@header : Win32cr::Devices::Display::DISPLAYCONFIG_DEVICE_INFO_HEADER, @adapterDevicePath : UInt16[128])
    end
  end

  @[Extern]
  struct DISPLAYCONFIG_TARGET_BASE_TYPE
    property header : Win32cr::Devices::Display::DISPLAYCONFIG_DEVICE_INFO_HEADER
    property baseOutputTechnology : Win32cr::Devices::Display::DISPLAYCONFIG_VIDEO_OUTPUT_TECHNOLOGY
    def initialize(@header : Win32cr::Devices::Display::DISPLAYCONFIG_DEVICE_INFO_HEADER, @baseOutputTechnology : Win32cr::Devices::Display::DISPLAYCONFIG_VIDEO_OUTPUT_TECHNOLOGY)
    end
  end

  @[Extern]
  struct DISPLAYCONFIG_SET_TARGET_PERSISTENCE
    property header : Win32cr::Devices::Display::DISPLAYCONFIG_DEVICE_INFO_HEADER
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property anonymous : Anonymous_e__Struct_
    property value : UInt32

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
      end

    def initialize(@anonymous : Anonymous_e__Struct_, @value : UInt32)
    end
    end

    def initialize(@header : Win32cr::Devices::Display::DISPLAYCONFIG_DEVICE_INFO_HEADER, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct DISPLAYCONFIG_SUPPORT_VIRTUAL_RESOLUTION
    property header : Win32cr::Devices::Display::DISPLAYCONFIG_DEVICE_INFO_HEADER
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property anonymous : Anonymous_e__Struct_
    property value : UInt32

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
      end

    def initialize(@anonymous : Anonymous_e__Struct_, @value : UInt32)
    end
    end

    def initialize(@header : Win32cr::Devices::Display::DISPLAYCONFIG_DEVICE_INFO_HEADER, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct DISPLAYCONFIG_GET_ADVANCED_COLOR_INFO
    property header : Win32cr::Devices::Display::DISPLAYCONFIG_DEVICE_INFO_HEADER
    property anonymous : Anonymous_e__Union_
    property colorEncoding : Win32cr::Graphics::Gdi::DISPLAYCONFIG_COLOR_ENCODING
    property bitsPerColorChannel : UInt32

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property anonymous : Anonymous_e__Struct_
    property value : UInt32

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
      end

    def initialize(@anonymous : Anonymous_e__Struct_, @value : UInt32)
    end
    end

    def initialize(@header : Win32cr::Devices::Display::DISPLAYCONFIG_DEVICE_INFO_HEADER, @anonymous : Anonymous_e__Union_, @colorEncoding : Win32cr::Graphics::Gdi::DISPLAYCONFIG_COLOR_ENCODING, @bitsPerColorChannel : UInt32)
    end
  end

  @[Extern]
  struct DISPLAYCONFIG_SET_ADVANCED_COLOR_STATE
    property header : Win32cr::Devices::Display::DISPLAYCONFIG_DEVICE_INFO_HEADER
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property anonymous : Anonymous_e__Struct_
    property value : UInt32

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
      end

    def initialize(@anonymous : Anonymous_e__Struct_, @value : UInt32)
    end
    end

    def initialize(@header : Win32cr::Devices::Display::DISPLAYCONFIG_DEVICE_INFO_HEADER, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct DISPLAYCONFIG_SDR_WHITE_LEVEL
    property header : Win32cr::Devices::Display::DISPLAYCONFIG_DEVICE_INFO_HEADER
    property sdr_white_level : UInt32
    def initialize(@header : Win32cr::Devices::Display::DISPLAYCONFIG_DEVICE_INFO_HEADER, @sdr_white_level : UInt32)
    end
  end

  @[Extern]
  struct DISPLAYCONFIG_GET_MONITOR_SPECIALIZATION
    property header : Win32cr::Devices::Display::DISPLAYCONFIG_DEVICE_INFO_HEADER
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property anonymous : Anonymous_e__Struct_
    property value : UInt32

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
      end

    def initialize(@anonymous : Anonymous_e__Struct_, @value : UInt32)
    end
    end

    def initialize(@header : Win32cr::Devices::Display::DISPLAYCONFIG_DEVICE_INFO_HEADER, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct DISPLAYCONFIG_SET_MONITOR_SPECIALIZATION
    property header : Win32cr::Devices::Display::DISPLAYCONFIG_DEVICE_INFO_HEADER
    property anonymous : Anonymous_e__Union_
    property specializationType : LibC::GUID
    property specializationSubType : LibC::GUID
    property specializationApplicationName : UInt16[128]

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property anonymous : Anonymous_e__Struct_
    property value : UInt32

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
      end

    def initialize(@anonymous : Anonymous_e__Struct_, @value : UInt32)
    end
    end

    def initialize(@header : Win32cr::Devices::Display::DISPLAYCONFIG_DEVICE_INFO_HEADER, @anonymous : Anonymous_e__Union_, @specializationType : LibC::GUID, @specializationSubType : LibC::GUID, @specializationApplicationName : UInt16[128])
    end
  end

  @[Extern]
  struct PHYSICAL_MONITOR
    property hPhysicalMonitor : Win32cr::Foundation::HANDLE
    property szPhysicalMonitorDescription : UInt16[128]
    def initialize(@hPhysicalMonitor : Win32cr::Foundation::HANDLE, @szPhysicalMonitorDescription : UInt16[128])
    end
  end

  @[Extern]
  struct MC_TIMING_REPORT
    property dwHorizontalFrequencyInHZ : UInt32
    property dwVerticalFrequencyInHZ : UInt32
    property bTimingStatusByte : UInt8
    def initialize(@dwHorizontalFrequencyInHZ : UInt32, @dwVerticalFrequencyInHZ : UInt32, @bTimingStatusByte : UInt8)
    end
  end

  @[Extern]
  struct Sources
    property sourceId : UInt32
    property numTargets : Int32
    property aTargets : UInt32*
    def initialize(@sourceId : UInt32, @numTargets : Int32, @aTargets : UInt32*)
    end
  end

  @[Extern]
  struct Adapter
    property adapter_name : UInt16[128]
    property numSources : Int32
    property sources : Win32cr::Devices::Display::Sources*
    def initialize(@adapter_name : UInt16[128], @numSources : Int32, @sources : Win32cr::Devices::Display::Sources*)
    end
  end

  @[Extern]
  struct Adapters
    property numAdapters : Int32
    property adapter : Win32cr::Devices::Display::Adapter*
    def initialize(@numAdapters : Int32, @adapter : Win32cr::Devices::Display::Adapter*)
    end
  end

  @[Extern]
  struct DisplayMode
    property device_name : UInt16[32]
    property devMode : Win32cr::Graphics::Gdi::DEVMODEW
    def initialize(@device_name : UInt16[32], @devMode : Win32cr::Graphics::Gdi::DEVMODEW)
    end
  end

  @[Extern]
  struct DisplayModes
    property numDisplayModes : Int32
    property displayMode : Win32cr::Devices::Display::DisplayMode*
    def initialize(@numDisplayModes : Int32, @displayMode : Win32cr::Devices::Display::DisplayMode*)
    end
  end

  @[Extern]
  struct VIDEOPARAMETERS
    property guid : LibC::GUID
    property dwOffset : UInt32
    property dwCommand : UInt32
    property dwFlags : UInt32
    property dwMode : UInt32
    property dwTVStandard : UInt32
    property dwAvailableModes : UInt32
    property dwAvailableTVStandard : UInt32
    property dwFlickerFilter : UInt32
    property dwOverScanX : UInt32
    property dwOverScanY : UInt32
    property dwMaxUnscaledX : UInt32
    property dwMaxUnscaledY : UInt32
    property dwPositionX : UInt32
    property dwPositionY : UInt32
    property dwBrightness : UInt32
    property dwContrast : UInt32
    property dwCPType : UInt32
    property dwCPCommand : UInt32
    property dwCPStandard : UInt32
    property dwCPKey : UInt32
    property bCP_APSTriggerBits : UInt32
    property bOEMCopyProtection : UInt8[256]
    def initialize(@guid : LibC::GUID, @dwOffset : UInt32, @dwCommand : UInt32, @dwFlags : UInt32, @dwMode : UInt32, @dwTVStandard : UInt32, @dwAvailableModes : UInt32, @dwAvailableTVStandard : UInt32, @dwFlickerFilter : UInt32, @dwOverScanX : UInt32, @dwOverScanY : UInt32, @dwMaxUnscaledX : UInt32, @dwMaxUnscaledY : UInt32, @dwPositionX : UInt32, @dwPositionY : UInt32, @dwBrightness : UInt32, @dwContrast : UInt32, @dwCPType : UInt32, @dwCPCommand : UInt32, @dwCPStandard : UInt32, @dwCPKey : UInt32, @bCP_APSTriggerBits : UInt32, @bOEMCopyProtection : UInt8[256])
    end
  end

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct POINTE
    property x : Float32
    property y : Float32
    def initialize(@x : Float32, @y : Float32)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern(union: true)]
  struct FLOAT_LONG
    property e : Float32
    property l : Int32
    def initialize(@e : Float32, @l : Int32)
    end
  end
  {% end %}

  @[Extern]
  struct POINTFIX
    property x : Int32
    property y : Int32
    def initialize(@x : Int32, @y : Int32)
    end
  end

  @[Extern]
  struct RECTFX
    property xLeft : Int32
    property yTop : Int32
    property xRight : Int32
    property yBottom : Int32
    def initialize(@xLeft : Int32, @yTop : Int32, @xRight : Int32, @yBottom : Int32)
    end
  end

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct FD_XFORM
    property eXX : Float32
    property eXY : Float32
    property eYX : Float32
    property eYY : Float32
    def initialize(@eXX : Float32, @eXY : Float32, @eYX : Float32, @eYY : Float32)
    end
  end
  {% end %}

  @[Extern]
  struct FD_DEVICEMETRICS
    property flRealizedType : UInt32
    property pteBase : Win32cr::Devices::Display::POINTE
    property pteSide : Win32cr::Devices::Display::POINTE
    property lD : Int32
    property fxMaxAscender : Int32
    property fxMaxDescender : Int32
    property ptlUnderline1 : Win32cr::Foundation::POINTL
    property ptlStrikeOut : Win32cr::Foundation::POINTL
    property ptlULThickness : Win32cr::Foundation::POINTL
    property ptlSOThickness : Win32cr::Foundation::POINTL
    property cxMax : UInt32
    property cyMax : UInt32
    property cjGlyphMax : UInt32
    property fdxQuantized : Win32cr::Devices::Display::FD_XFORM
    property lNonLinearExtLeading : Int32
    property lNonLinearIntLeading : Int32
    property lNonLinearMaxCharWidth : Int32
    property lNonLinearAvgCharWidth : Int32
    property lMinA : Int32
    property lMinC : Int32
    property lMinD : Int32
    property alReserved : Int32*
    def initialize(@flRealizedType : UInt32, @pteBase : Win32cr::Devices::Display::POINTE, @pteSide : Win32cr::Devices::Display::POINTE, @lD : Int32, @fxMaxAscender : Int32, @fxMaxDescender : Int32, @ptlUnderline1 : Win32cr::Foundation::POINTL, @ptlStrikeOut : Win32cr::Foundation::POINTL, @ptlULThickness : Win32cr::Foundation::POINTL, @ptlSOThickness : Win32cr::Foundation::POINTL, @cxMax : UInt32, @cyMax : UInt32, @cjGlyphMax : UInt32, @fdxQuantized : Win32cr::Devices::Display::FD_XFORM, @lNonLinearExtLeading : Int32, @lNonLinearIntLeading : Int32, @lNonLinearMaxCharWidth : Int32, @lNonLinearAvgCharWidth : Int32, @lMinA : Int32, @lMinC : Int32, @lMinD : Int32, @alReserved : Int32*)
    end
  end

  @[Extern]
  struct LIGATURE
    property culSize : UInt32
    property pwsz : Win32cr::Foundation::PWSTR
    property chglyph : UInt32
    property ahglyph : UInt32*
    def initialize(@culSize : UInt32, @pwsz : Win32cr::Foundation::PWSTR, @chglyph : UInt32, @ahglyph : UInt32*)
    end
  end

  @[Extern]
  struct FD_LIGATURE
    property culThis : UInt32
    property ulType : UInt32
    property cLigatures : UInt32
    property alig : Win32cr::Devices::Display::LIGATURE*
    def initialize(@culThis : UInt32, @ulType : UInt32, @cLigatures : UInt32, @alig : Win32cr::Devices::Display::LIGATURE*)
    end
  end

  @[Extern]
  struct POINTQF
    property x : Win32cr::Foundation::LARGE_INTEGER
    property y : Win32cr::Foundation::LARGE_INTEGER
    def initialize(@x : Win32cr::Foundation::LARGE_INTEGER, @y : Win32cr::Foundation::LARGE_INTEGER)
    end
  end

  @[Extern]
  struct WCRUN
    property wcLow : UInt16
    property cGlyphs : UInt16
    property phg : UInt32*
    def initialize(@wcLow : UInt16, @cGlyphs : UInt16, @phg : UInt32*)
    end
  end

  @[Extern]
  struct FD_GLYPHSET
    property cjThis : UInt32
    property flAccel : UInt32
    property cGlyphsSupported : UInt32
    property cRuns : UInt32
    property awcrun : Win32cr::Devices::Display::WCRUN*
    def initialize(@cjThis : UInt32, @flAccel : UInt32, @cGlyphsSupported : UInt32, @cRuns : UInt32, @awcrun : Win32cr::Devices::Display::WCRUN*)
    end
  end

  @[Extern]
  struct FD_GLYPHATTR
    property cjThis : UInt32
    property cGlyphs : UInt32
    property iMode : UInt32
    property aGlyphAttr : UInt8*
    def initialize(@cjThis : UInt32, @cGlyphs : UInt32, @iMode : UInt32, @aGlyphAttr : UInt8*)
    end
  end

  @[Extern]
  struct FD_KERNINGPAIR
    property wcFirst : UInt16
    property wcSecond : UInt16
    property fwdKern : Int16
    def initialize(@wcFirst : UInt16, @wcSecond : UInt16, @fwdKern : Int16)
    end
  end

  @[Extern]
  struct FONTDIFF
    property jReserved1 : UInt8
    property jReserved2 : UInt8
    property jReserved3 : UInt8
    property bWeight : UInt8
    property usWinWeight : UInt16
    property fsSelection : UInt16
    property fwdAveCharWidth : Int16
    property fwdMaxCharInc : Int16
    property ptlCaret : Win32cr::Foundation::POINTL
    def initialize(@jReserved1 : UInt8, @jReserved2 : UInt8, @jReserved3 : UInt8, @bWeight : UInt8, @usWinWeight : UInt16, @fsSelection : UInt16, @fwdAveCharWidth : Int16, @fwdMaxCharInc : Int16, @ptlCaret : Win32cr::Foundation::POINTL)
    end
  end

  @[Extern]
  struct FONTSIM
    property dpBold : Int32
    property dpItalic : Int32
    property dpBoldItalic : Int32
    def initialize(@dpBold : Int32, @dpItalic : Int32, @dpBoldItalic : Int32)
    end
  end

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct IFIMETRICS
    property cjThis : UInt32
    property cjIfiExtra : UInt32
    property dpwszFamilyName : Int32
    property dpwszStyleName : Int32
    property dpwszFaceName : Int32
    property dpwszUniqueName : Int32
    property dpFontSim : Int32
    property lEmbedId : Int32
    property lItalicAngle : Int32
    property lCharBias : Int32
    property dpCharSets : Int32
    property jWinCharSet : UInt8
    property jWinPitchAndFamily : UInt8
    property usWinWeight : UInt16
    property flInfo : UInt32
    property fsSelection : UInt16
    property fsType : UInt16
    property fwdUnitsPerEm : Int16
    property fwdLowestPPEm : Int16
    property fwdWinAscender : Int16
    property fwdWinDescender : Int16
    property fwdMacAscender : Int16
    property fwdMacDescender : Int16
    property fwdMacLineGap : Int16
    property fwdTypoAscender : Int16
    property fwdTypoDescender : Int16
    property fwdTypoLineGap : Int16
    property fwdAveCharWidth : Int16
    property fwdMaxCharInc : Int16
    property fwdCapHeight : Int16
    property fwdXHeight : Int16
    property fwdSubscriptXSize : Int16
    property fwdSubscriptYSize : Int16
    property fwdSubscriptXOffset : Int16
    property fwdSubscriptYOffset : Int16
    property fwdSuperscriptXSize : Int16
    property fwdSuperscriptYSize : Int16
    property fwdSuperscriptXOffset : Int16
    property fwdSuperscriptYOffset : Int16
    property fwdUnderscoreSize : Int16
    property fwdUnderscorePosition : Int16
    property fwdStrikeoutSize : Int16
    property fwdStrikeoutPosition : Int16
    property chFirstChar : UInt8
    property chLastChar : UInt8
    property chDefaultChar : UInt8
    property chBreakChar : UInt8
    property wcFirstChar : UInt16
    property wcLastChar : UInt16
    property wcDefaultChar : UInt16
    property wcBreakChar : UInt16
    property ptlBaseline : Win32cr::Foundation::POINTL
    property ptlAspect : Win32cr::Foundation::POINTL
    property ptlCaret : Win32cr::Foundation::POINTL
    property rclFontBox : Win32cr::Foundation::RECTL
    property achVendId : UInt8[4]
    property cKerningPairs : UInt32
    property ulPanoseCulture : UInt32
    property panose : Win32cr::Graphics::Gdi::PANOSE
    property align : Void*
    def initialize(@cjThis : UInt32, @cjIfiExtra : UInt32, @dpwszFamilyName : Int32, @dpwszStyleName : Int32, @dpwszFaceName : Int32, @dpwszUniqueName : Int32, @dpFontSim : Int32, @lEmbedId : Int32, @lItalicAngle : Int32, @lCharBias : Int32, @dpCharSets : Int32, @jWinCharSet : UInt8, @jWinPitchAndFamily : UInt8, @usWinWeight : UInt16, @flInfo : UInt32, @fsSelection : UInt16, @fsType : UInt16, @fwdUnitsPerEm : Int16, @fwdLowestPPEm : Int16, @fwdWinAscender : Int16, @fwdWinDescender : Int16, @fwdMacAscender : Int16, @fwdMacDescender : Int16, @fwdMacLineGap : Int16, @fwdTypoAscender : Int16, @fwdTypoDescender : Int16, @fwdTypoLineGap : Int16, @fwdAveCharWidth : Int16, @fwdMaxCharInc : Int16, @fwdCapHeight : Int16, @fwdXHeight : Int16, @fwdSubscriptXSize : Int16, @fwdSubscriptYSize : Int16, @fwdSubscriptXOffset : Int16, @fwdSubscriptYOffset : Int16, @fwdSuperscriptXSize : Int16, @fwdSuperscriptYSize : Int16, @fwdSuperscriptXOffset : Int16, @fwdSuperscriptYOffset : Int16, @fwdUnderscoreSize : Int16, @fwdUnderscorePosition : Int16, @fwdStrikeoutSize : Int16, @fwdStrikeoutPosition : Int16, @chFirstChar : UInt8, @chLastChar : UInt8, @chDefaultChar : UInt8, @chBreakChar : UInt8, @wcFirstChar : UInt16, @wcLastChar : UInt16, @wcDefaultChar : UInt16, @wcBreakChar : UInt16, @ptlBaseline : Win32cr::Foundation::POINTL, @ptlAspect : Win32cr::Foundation::POINTL, @ptlCaret : Win32cr::Foundation::POINTL, @rclFontBox : Win32cr::Foundation::RECTL, @achVendId : UInt8[4], @cKerningPairs : UInt32, @ulPanoseCulture : UInt32, @panose : Win32cr::Graphics::Gdi::PANOSE, @align : Void*)
    end
  end
  {% end %}

  @[Extern]
  struct IFIEXTRA
    property ulIdentifier : UInt32
    property dpFontSig : Int32
    property cig : UInt32
    property dpDesignVector : Int32
    property dpAxesInfoW : Int32
    property aulReserved : UInt32*
    def initialize(@ulIdentifier : UInt32, @dpFontSig : Int32, @cig : UInt32, @dpDesignVector : Int32, @dpAxesInfoW : Int32, @aulReserved : UInt32*)
    end
  end

  @[Extern]
  struct DRVFN
    property iFunc : UInt32
    property pfn : Win32cr::Devices::Display::PFN
    def initialize(@iFunc : UInt32, @pfn : Win32cr::Devices::Display::PFN)
    end
  end

  @[Extern]
  struct DRVENABLEDATA
    property iDriverVersion : UInt32
    property c : UInt32
    property pdrvfn : Win32cr::Devices::Display::DRVFN*
    def initialize(@iDriverVersion : UInt32, @c : UInt32, @pdrvfn : Win32cr::Devices::Display::DRVFN*)
    end
  end

  @[Extern]
  struct DEVINFO
    property flGraphicsCaps : UInt32
    property lfDefaultFont : Win32cr::Graphics::Gdi::LOGFONTW
    property lfAnsiVarFont : Win32cr::Graphics::Gdi::LOGFONTW
    property lfAnsiFixFont : Win32cr::Graphics::Gdi::LOGFONTW
    property cFonts : UInt32
    property iDitherFormat : UInt32
    property cxDither : UInt16
    property cyDither : UInt16
    property hpalDefault : Win32cr::Graphics::Gdi::HPALETTE
    property flGraphicsCaps2 : UInt32
    def initialize(@flGraphicsCaps : UInt32, @lfDefaultFont : Win32cr::Graphics::Gdi::LOGFONTW, @lfAnsiVarFont : Win32cr::Graphics::Gdi::LOGFONTW, @lfAnsiFixFont : Win32cr::Graphics::Gdi::LOGFONTW, @cFonts : UInt32, @iDitherFormat : UInt32, @cxDither : UInt16, @cyDither : UInt16, @hpalDefault : Win32cr::Graphics::Gdi::HPALETTE, @flGraphicsCaps2 : UInt32)
    end
  end

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct LINEATTRS
    property fl : UInt32
    property iJoin : UInt32
    property iEndCap : UInt32
    property elWidth : Win32cr::Devices::Display::FLOAT_LONG
    property eMiterLimit : Float32
    property cstyle : UInt32
    property pstyle : Win32cr::Devices::Display::FLOAT_LONG*
    property elStyleState : Win32cr::Devices::Display::FLOAT_LONG
    def initialize(@fl : UInt32, @iJoin : UInt32, @iEndCap : UInt32, @elWidth : Win32cr::Devices::Display::FLOAT_LONG, @eMiterLimit : Float32, @cstyle : UInt32, @pstyle : Win32cr::Devices::Display::FLOAT_LONG*, @elStyleState : Win32cr::Devices::Display::FLOAT_LONG)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct XFORML
    property eM11 : Float32
    property eM12 : Float32
    property eM21 : Float32
    property eM22 : Float32
    property eDx : Float32
    property eDy : Float32
    def initialize(@eM11 : Float32, @eM12 : Float32, @eM21 : Float32, @eM22 : Float32, @eDx : Float32, @eDy : Float32)
    end
  end
  {% end %}

  @[Extern]
  struct CIECHROMA
    property x : Int32
    property y : Int32
    property y_ : Int32
    def initialize(@x : Int32, @y : Int32, @y_ : Int32)
    end
  end

  @[Extern]
  struct COLORINFO
    property red : Win32cr::Devices::Display::CIECHROMA
    property green : Win32cr::Devices::Display::CIECHROMA
    property blue : Win32cr::Devices::Display::CIECHROMA
    property cyan : Win32cr::Devices::Display::CIECHROMA
    property magenta : Win32cr::Devices::Display::CIECHROMA
    property yellow : Win32cr::Devices::Display::CIECHROMA
    property alignment_white : Win32cr::Devices::Display::CIECHROMA
    property red_gamma : Int32
    property green_gamma : Int32
    property blue_gamma : Int32
    property magenta_in_cyan_dye : Int32
    property yellow_in_cyan_dye : Int32
    property cyan_in_magenta_dye : Int32
    property yellow_in_magenta_dye : Int32
    property cyan_in_yellow_dye : Int32
    property magenta_in_yellow_dye : Int32
    def initialize(@red : Win32cr::Devices::Display::CIECHROMA, @green : Win32cr::Devices::Display::CIECHROMA, @blue : Win32cr::Devices::Display::CIECHROMA, @cyan : Win32cr::Devices::Display::CIECHROMA, @magenta : Win32cr::Devices::Display::CIECHROMA, @yellow : Win32cr::Devices::Display::CIECHROMA, @alignment_white : Win32cr::Devices::Display::CIECHROMA, @red_gamma : Int32, @green_gamma : Int32, @blue_gamma : Int32, @magenta_in_cyan_dye : Int32, @yellow_in_cyan_dye : Int32, @cyan_in_magenta_dye : Int32, @yellow_in_magenta_dye : Int32, @cyan_in_yellow_dye : Int32, @magenta_in_yellow_dye : Int32)
    end
  end

  @[Extern]
  struct CDDDXGK_REDIRBITMAPPRESENTINFO
    property num_dirty_rects : UInt32
    property dirty_rect : Win32cr::Foundation::RECT*
    property num_contexts : UInt32
    property hContext : Win32cr::Foundation::HANDLE[65]
    property bDoNotSynchronizeWithDxContent : Win32cr::Foundation::BOOLEAN
    def initialize(@num_dirty_rects : UInt32, @dirty_rect : Win32cr::Foundation::RECT*, @num_contexts : UInt32, @hContext : Win32cr::Foundation::HANDLE[65], @bDoNotSynchronizeWithDxContent : Win32cr::Foundation::BOOLEAN)
    end
  end

  @[Extern]
  struct GDIINFO
    property ulVersion : UInt32
    property ulTechnology : UInt32
    property ulHorzSize : UInt32
    property ulVertSize : UInt32
    property ulHorzRes : UInt32
    property ulVertRes : UInt32
    property cBitsPixel : UInt32
    property cPlanes : UInt32
    property ulNumColors : UInt32
    property flRaster : UInt32
    property ulLogPixelsX : UInt32
    property ulLogPixelsY : UInt32
    property flTextCaps : UInt32
    property ulDACRed : UInt32
    property ulDACGreen : UInt32
    property ulDACBlue : UInt32
    property ulAspectX : UInt32
    property ulAspectY : UInt32
    property ulAspectXY : UInt32
    property xStyleStep : Int32
    property yStyleStep : Int32
    property denStyleStep : Int32
    property ptlPhysOffset : Win32cr::Foundation::POINTL
    property szlPhysSize : Win32cr::Foundation::SIZE
    property ulNumPalReg : UInt32
    property ciDevice : Win32cr::Devices::Display::COLORINFO
    property ulDevicePelsDPI : UInt32
    property ulPrimaryOrder : UInt32
    property ulHTPatternSize : UInt32
    property ulHTOutputFormat : UInt32
    property flHTFlags : UInt32
    property ulVRefresh : UInt32
    property ulBltAlignment : UInt32
    property ulPanningHorzRes : UInt32
    property ulPanningVertRes : UInt32
    property xPanningAlignment : UInt32
    property yPanningAlignment : UInt32
    property cxHTPat : UInt32
    property cyHTPat : UInt32
    property pHTPatA : UInt8*
    property pHTPatB : UInt8*
    property pHTPatC : UInt8*
    property flShadeBlend : UInt32
    property ulPhysicalPixelCharacteristics : UInt32
    property ulPhysicalPixelGamma : UInt32
    def initialize(@ulVersion : UInt32, @ulTechnology : UInt32, @ulHorzSize : UInt32, @ulVertSize : UInt32, @ulHorzRes : UInt32, @ulVertRes : UInt32, @cBitsPixel : UInt32, @cPlanes : UInt32, @ulNumColors : UInt32, @flRaster : UInt32, @ulLogPixelsX : UInt32, @ulLogPixelsY : UInt32, @flTextCaps : UInt32, @ulDACRed : UInt32, @ulDACGreen : UInt32, @ulDACBlue : UInt32, @ulAspectX : UInt32, @ulAspectY : UInt32, @ulAspectXY : UInt32, @xStyleStep : Int32, @yStyleStep : Int32, @denStyleStep : Int32, @ptlPhysOffset : Win32cr::Foundation::POINTL, @szlPhysSize : Win32cr::Foundation::SIZE, @ulNumPalReg : UInt32, @ciDevice : Win32cr::Devices::Display::COLORINFO, @ulDevicePelsDPI : UInt32, @ulPrimaryOrder : UInt32, @ulHTPatternSize : UInt32, @ulHTOutputFormat : UInt32, @flHTFlags : UInt32, @ulVRefresh : UInt32, @ulBltAlignment : UInt32, @ulPanningHorzRes : UInt32, @ulPanningVertRes : UInt32, @xPanningAlignment : UInt32, @yPanningAlignment : UInt32, @cxHTPat : UInt32, @cyHTPat : UInt32, @pHTPatA : UInt8*, @pHTPatB : UInt8*, @pHTPatC : UInt8*, @flShadeBlend : UInt32, @ulPhysicalPixelCharacteristics : UInt32, @ulPhysicalPixelGamma : UInt32)
    end
  end

  @[Extern]
  struct BRUSHOBJ
    property iSolidColor : UInt32
    property pvRbrush : Void*
    property flColorType : UInt32
    def initialize(@iSolidColor : UInt32, @pvRbrush : Void*, @flColorType : UInt32)
    end
  end

  @[Extern]
  struct CLIPOBJ
    property iUniq : UInt32
    property rclBounds : Win32cr::Foundation::RECTL
    property iDComplexity : UInt8
    property iFComplexity : UInt8
    property iMode : UInt8
    property fjOptions : UInt8
    def initialize(@iUniq : UInt32, @rclBounds : Win32cr::Foundation::RECTL, @iDComplexity : UInt8, @iFComplexity : UInt8, @iMode : UInt8, @fjOptions : UInt8)
    end
  end

  @[Extern]
  struct DRIVEROBJ
    property pvObj : Void*
    property pFreeProc : Win32cr::Devices::Display::FREEOBJPROC
    property hdev : Win32cr::Devices::Display::HDEV
    property dhpdev : Win32cr::Devices::Display::DHPDEV
    def initialize(@pvObj : Void*, @pFreeProc : Win32cr::Devices::Display::FREEOBJPROC, @hdev : Win32cr::Devices::Display::HDEV, @dhpdev : Win32cr::Devices::Display::DHPDEV)
    end
  end

  @[Extern]
  struct FONTOBJ
    property iUniq : UInt32
    property iFace : UInt32
    property cxMax : UInt32
    property flFontType : UInt32
    property iTTUniq : LibC::UIntPtrT
    property iFile : LibC::UIntPtrT
    property sizLogResPpi : Win32cr::Foundation::SIZE
    property ulStyleSize : UInt32
    property pvConsumer : Void*
    property pvProducer : Void*
    def initialize(@iUniq : UInt32, @iFace : UInt32, @cxMax : UInt32, @flFontType : UInt32, @iTTUniq : LibC::UIntPtrT, @iFile : LibC::UIntPtrT, @sizLogResPpi : Win32cr::Foundation::SIZE, @ulStyleSize : UInt32, @pvConsumer : Void*, @pvProducer : Void*)
    end
  end

  @[Extern]
  struct BLENDOBJ
    property blend_function : Win32cr::Graphics::Gdi::BLENDFUNCTION
    def initialize(@blend_function : Win32cr::Graphics::Gdi::BLENDFUNCTION)
    end
  end

  @[Extern]
  struct PALOBJ
    property ulReserved : UInt32
    def initialize(@ulReserved : UInt32)
    end
  end

  @[Extern]
  struct PATHOBJ
    property fl : UInt32
    property cCurves : UInt32
    def initialize(@fl : UInt32, @cCurves : UInt32)
    end
  end

  @[Extern]
  struct SURFOBJ
    property dhsurf : Win32cr::Devices::Display::DHSURF
    property hsurf : Win32cr::Devices::Display::HSURF
    property dhpdev : Win32cr::Devices::Display::DHPDEV
    property hdev : Win32cr::Devices::Display::HDEV
    property sizlBitmap : Win32cr::Foundation::SIZE
    property cjBits : UInt32
    property pvBits : Void*
    property pvScan0 : Void*
    property lDelta : Int32
    property iUniq : UInt32
    property iBitmapFormat : UInt32
    property iType : UInt16
    property fjBitmap : UInt16
    def initialize(@dhsurf : Win32cr::Devices::Display::DHSURF, @hsurf : Win32cr::Devices::Display::HSURF, @dhpdev : Win32cr::Devices::Display::DHPDEV, @hdev : Win32cr::Devices::Display::HDEV, @sizlBitmap : Win32cr::Foundation::SIZE, @cjBits : UInt32, @pvBits : Void*, @pvScan0 : Void*, @lDelta : Int32, @iUniq : UInt32, @iBitmapFormat : UInt32, @iType : UInt16, @fjBitmap : UInt16)
    end
  end

  @[Extern]
  struct WNDOBJ
    property coClient : Win32cr::Devices::Display::CLIPOBJ
    property pvConsumer : Void*
    property rclClient : Win32cr::Foundation::RECTL
    property psoOwner : Win32cr::Devices::Display::SURFOBJ*
    def initialize(@coClient : Win32cr::Devices::Display::CLIPOBJ, @pvConsumer : Void*, @rclClient : Win32cr::Foundation::RECTL, @psoOwner : Win32cr::Devices::Display::SURFOBJ*)
    end
  end

  @[Extern]
  struct XFORMOBJ
    property ulReserved : UInt32
    def initialize(@ulReserved : UInt32)
    end
  end

  @[Extern]
  struct XLATEOBJ
    property iUniq : UInt32
    property flXlate : UInt32
    property iSrcType : UInt16
    property iDstType : UInt16
    property cEntries : UInt32
    property pulXlate : UInt32*
    def initialize(@iUniq : UInt32, @flXlate : UInt32, @iSrcType : UInt16, @iDstType : UInt16, @cEntries : UInt32, @pulXlate : UInt32*)
    end
  end

  @[Extern]
  struct ENUMRECTS
    property c : UInt32
    property arcl : Win32cr::Foundation::RECTL*
    def initialize(@c : UInt32, @arcl : Win32cr::Foundation::RECTL*)
    end
  end

  @[Extern]
  struct GLYPHBITS
    property ptlOrigin : Win32cr::Foundation::POINTL
    property sizlBitmap : Win32cr::Foundation::SIZE
    property aj : UInt8*
    def initialize(@ptlOrigin : Win32cr::Foundation::POINTL, @sizlBitmap : Win32cr::Foundation::SIZE, @aj : UInt8*)
    end
  end

  @[Extern(union: true)]
  struct GLYPHDEF
    property pgb : Win32cr::Devices::Display::GLYPHBITS*
    property ppo : Win32cr::Devices::Display::PATHOBJ*
    def initialize(@pgb : Win32cr::Devices::Display::GLYPHBITS*, @ppo : Win32cr::Devices::Display::PATHOBJ*)
    end
  end

  @[Extern]
  struct GLYPHPOS
    property hg : UInt32
    property pgdf : Win32cr::Devices::Display::GLYPHDEF*
    property ptl : Win32cr::Foundation::POINTL
    def initialize(@hg : UInt32, @pgdf : Win32cr::Devices::Display::GLYPHDEF*, @ptl : Win32cr::Foundation::POINTL)
    end
  end

  @[Extern]
  struct GLYPHDATA
    property gdf : Win32cr::Devices::Display::GLYPHDEF
    property hg : UInt32
    property fxD : Int32
    property fxA : Int32
    property fxAB : Int32
    property fxInkTop : Int32
    property fxInkBottom : Int32
    property rclInk : Win32cr::Foundation::RECTL
    property ptqD : Win32cr::Devices::Display::POINTQF
    def initialize(@gdf : Win32cr::Devices::Display::GLYPHDEF, @hg : UInt32, @fxD : Int32, @fxA : Int32, @fxAB : Int32, @fxInkTop : Int32, @fxInkBottom : Int32, @rclInk : Win32cr::Foundation::RECTL, @ptqD : Win32cr::Devices::Display::POINTQF)
    end
  end

  @[Extern]
  struct STROBJ
    property cGlyphs : UInt32
    property flAccel : UInt32
    property ulCharInc : UInt32
    property rclBkGround : Win32cr::Foundation::RECTL
    property pgp : Win32cr::Devices::Display::GLYPHPOS*
    property pwszOrg : Win32cr::Foundation::PWSTR
    def initialize(@cGlyphs : UInt32, @flAccel : UInt32, @ulCharInc : UInt32, @rclBkGround : Win32cr::Foundation::RECTL, @pgp : Win32cr::Devices::Display::GLYPHPOS*, @pwszOrg : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct FONTINFO
    property cjThis : UInt32
    property flCaps : UInt32
    property cGlyphsSupported : UInt32
    property cjMaxGlyph1 : UInt32
    property cjMaxGlyph4 : UInt32
    property cjMaxGlyph8 : UInt32
    property cjMaxGlyph32 : UInt32
    def initialize(@cjThis : UInt32, @flCaps : UInt32, @cGlyphsSupported : UInt32, @cjMaxGlyph1 : UInt32, @cjMaxGlyph4 : UInt32, @cjMaxGlyph8 : UInt32, @cjMaxGlyph32 : UInt32)
    end
  end

  @[Extern]
  struct PATHDATA
    property flags : UInt32
    property count : UInt32
    property pptfx : Win32cr::Devices::Display::POINTFIX*
    def initialize(@flags : UInt32, @count : UInt32, @pptfx : Win32cr::Devices::Display::POINTFIX*)
    end
  end

  @[Extern]
  struct RUN
    property iStart : Int32
    property iStop : Int32
    def initialize(@iStart : Int32, @iStop : Int32)
    end
  end

  @[Extern]
  struct CLIPLINE
    property ptfxA : Win32cr::Devices::Display::POINTFIX
    property ptfxB : Win32cr::Devices::Display::POINTFIX
    property lStyleState : Int32
    property c : UInt32
    property arun : Win32cr::Devices::Display::RUN*
    def initialize(@ptfxA : Win32cr::Devices::Display::POINTFIX, @ptfxB : Win32cr::Devices::Display::POINTFIX, @lStyleState : Int32, @c : UInt32, @arun : Win32cr::Devices::Display::RUN*)
    end
  end

  @[Extern]
  struct PERBANDINFO
    property bRepeatThisBand : Win32cr::Foundation::BOOL
    property szlBand : Win32cr::Foundation::SIZE
    property ulHorzRes : UInt32
    property ulVertRes : UInt32
    def initialize(@bRepeatThisBand : Win32cr::Foundation::BOOL, @szlBand : Win32cr::Foundation::SIZE, @ulHorzRes : UInt32, @ulVertRes : UInt32)
    end
  end

  @[Extern]
  struct GAMMARAMP
    property red : UInt16[256]
    property green : UInt16[256]
    property blue : UInt16[256]
    def initialize(@red : UInt16[256], @green : UInt16[256], @blue : UInt16[256])
    end
  end

  @[Extern]
  struct DEVHTINFO
    property ht_flags : UInt32
    property ht_pattern_size : UInt32
    property dev_pels_dpi : UInt32
    property color_info : Win32cr::Devices::Display::COLORINFO
    def initialize(@ht_flags : UInt32, @ht_pattern_size : UInt32, @dev_pels_dpi : UInt32, @color_info : Win32cr::Devices::Display::COLORINFO)
    end
  end

  @[Extern]
  struct DEVHTADJDATA
    property device_flags : UInt32
    property device_xdpi : UInt32
    property device_ydpi : UInt32
    property pDefHTInfo : Win32cr::Devices::Display::DEVHTINFO*
    property pAdjHTInfo : Win32cr::Devices::Display::DEVHTINFO*
    def initialize(@device_flags : UInt32, @device_xdpi : UInt32, @device_ydpi : UInt32, @pDefHTInfo : Win32cr::Devices::Display::DEVHTINFO*, @pAdjHTInfo : Win32cr::Devices::Display::DEVHTINFO*)
    end
  end

  @[Extern]
  struct TYPE1_FONT
    property hPFM : Win32cr::Foundation::HANDLE
    property hPFB : Win32cr::Foundation::HANDLE
    property ulIdentifier : UInt32
    def initialize(@hPFM : Win32cr::Foundation::HANDLE, @hPFB : Win32cr::Foundation::HANDLE, @ulIdentifier : UInt32)
    end
  end

  @[Extern]
  struct ENGSAFESEMAPHORE
    property hsem : Win32cr::Devices::Display::HSEMAPHORE
    property lCount : Int32
    def initialize(@hsem : Win32cr::Devices::Display::HSEMAPHORE, @lCount : Int32)
    end
  end

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct FLOATOBJ_XFORM
    property eM11 : Float32
    property eM12 : Float32
    property eM21 : Float32
    property eM22 : Float32
    property eDx : Float32
    property eDy : Float32
    def initialize(@eM11 : Float32, @eM12 : Float32, @eM21 : Float32, @eM22 : Float32, @eDx : Float32, @eDy : Float32)
    end
  end
  {% end %}

  @[Extern]
  struct ENG_TIME_FIELDS
    property usYear : UInt16
    property usMonth : UInt16
    property usDay : UInt16
    property usHour : UInt16
    property usMinute : UInt16
    property usSecond : UInt16
    property usMilliseconds : UInt16
    property usWeekday : UInt16
    def initialize(@usYear : UInt16, @usMonth : UInt16, @usDay : UInt16, @usHour : UInt16, @usMinute : UInt16, @usSecond : UInt16, @usMilliseconds : UInt16, @usWeekday : UInt16)
    end
  end

  @[Extern]
  struct EMFINFO
    property nSize : UInt32
    property hdc : Win32cr::Graphics::Gdi::HDC
    property pvEMF : UInt8*
    property pvCurrentRecord : UInt8*
    def initialize(@nSize : UInt32, @hdc : Win32cr::Graphics::Gdi::HDC, @pvEMF : UInt8*, @pvCurrentRecord : UInt8*)
    end
  end

  @[Extern]
  struct DRH_APIBITMAPDATA
    property pso : Win32cr::Devices::Display::SURFOBJ*
    property b : Win32cr::Foundation::BOOL
    def initialize(@pso : Win32cr::Devices::Display::SURFOBJ*, @b : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct INDIRECT_DISPLAY_INFO
    property display_adapter_luid : Win32cr::Foundation::LUID
    property flags : UInt32
    property num_monitors : UInt32
    property display_adapter_target_base : UInt32
    def initialize(@display_adapter_luid : Win32cr::Foundation::LUID, @flags : UInt32, @num_monitors : UInt32, @display_adapter_target_base : UInt32)
    end
  end

  @[Extern]
  struct VIDEO_VDM
    property process_handle : Win32cr::Foundation::HANDLE
    def initialize(@process_handle : Win32cr::Foundation::HANDLE)
    end
  end

  @[Extern]
  struct VIDEO_REGISTER_VDM
    property minimum_state_size : UInt32
    def initialize(@minimum_state_size : UInt32)
    end
  end

  @[Extern]
  struct VIDEO_MONITOR_DESCRIPTOR
    property descriptor_size : UInt32
    property descriptor : UInt8*
    def initialize(@descriptor_size : UInt32, @descriptor : UInt8*)
    end
  end

  @[Extern]
  struct DXGK_WIN32K_PARAM_DATA
    property paths_array : Void*
    property modes_array : Void*
    property num_path_array_elements : UInt32
    property num_mode_array_elements : UInt32
    property sdc_flags : UInt32
    def initialize(@paths_array : Void*, @modes_array : Void*, @num_path_array_elements : UInt32, @num_mode_array_elements : UInt32, @sdc_flags : UInt32)
    end
  end

  @[Extern]
  struct VIDEO_WIN32K_CALLBACKS_PARAMS
    property callout_type : Win32cr::Devices::Display::VIDEO_WIN32K_CALLBACKS_PARAMS_TYPE
    property phys_disp : Void*
    property param : LibC::UIntPtrT
    property status : Int32
    property lock_user_session : Win32cr::Foundation::BOOLEAN
    property is_post_device : Win32cr::Foundation::BOOLEAN
    property surprise_removal : Win32cr::Foundation::BOOLEAN
    property wait_for_queue_ready : Win32cr::Foundation::BOOLEAN
    def initialize(@callout_type : Win32cr::Devices::Display::VIDEO_WIN32K_CALLBACKS_PARAMS_TYPE, @phys_disp : Void*, @param : LibC::UIntPtrT, @status : Int32, @lock_user_session : Win32cr::Foundation::BOOLEAN, @is_post_device : Win32cr::Foundation::BOOLEAN, @surprise_removal : Win32cr::Foundation::BOOLEAN, @wait_for_queue_ready : Win32cr::Foundation::BOOLEAN)
    end
  end

  @[Extern]
  struct VIDEO_WIN32K_CALLBACKS
    property phys_disp : Void*
    property callout : Win32cr::Devices::Display::PVIDEO_WIN32K_CALLOUT
    property bACPI : UInt32
    property pPhysDeviceObject : Win32cr::Foundation::HANDLE
    property dualview_flags : UInt32
    def initialize(@phys_disp : Void*, @callout : Win32cr::Devices::Display::PVIDEO_WIN32K_CALLOUT, @bACPI : UInt32, @pPhysDeviceObject : Win32cr::Foundation::HANDLE, @dualview_flags : UInt32)
    end
  end

  @[Extern]
  struct VIDEO_DEVICE_SESSION_STATUS
    property bEnable : UInt32
    property bSuccess : UInt32
    def initialize(@bEnable : UInt32, @bSuccess : UInt32)
    end
  end

  @[Extern]
  struct VIDEO_HARDWARE_STATE_HEADER
    property length : UInt32
    property port_value : UInt8[48]
    property attrib_index_data_state : UInt32
    property basic_sequencer_offset : UInt32
    property basic_crt_cont_offset : UInt32
    property basic_graph_cont_offset : UInt32
    property basic_attrib_cont_offset : UInt32
    property basic_dac_offset : UInt32
    property basic_latches_offset : UInt32
    property extended_sequencer_offset : UInt32
    property extended_crt_cont_offset : UInt32
    property extended_graph_cont_offset : UInt32
    property extended_attrib_cont_offset : UInt32
    property extended_dac_offset : UInt32
    property extended_validator_state_offset : UInt32
    property extended_misc_data_offset : UInt32
    property plane_length : UInt32
    property plane1_offset : UInt32
    property plane2_offset : UInt32
    property plane3_offset : UInt32
    property plane4_offset : UInt32
    property vga_state_flags : UInt32
    property dib_offset : UInt32
    property dib_bits_per_pixel : UInt32
    property dibx_resolution : UInt32
    property diby_resolution : UInt32
    property dib_xlat_offset : UInt32
    property dib_xlat_length : UInt32
    property vesa_info_offset : UInt32
    property frame_buffer_data : Void*
    def initialize(@length : UInt32, @port_value : UInt8[48], @attrib_index_data_state : UInt32, @basic_sequencer_offset : UInt32, @basic_crt_cont_offset : UInt32, @basic_graph_cont_offset : UInt32, @basic_attrib_cont_offset : UInt32, @basic_dac_offset : UInt32, @basic_latches_offset : UInt32, @extended_sequencer_offset : UInt32, @extended_crt_cont_offset : UInt32, @extended_graph_cont_offset : UInt32, @extended_attrib_cont_offset : UInt32, @extended_dac_offset : UInt32, @extended_validator_state_offset : UInt32, @extended_misc_data_offset : UInt32, @plane_length : UInt32, @plane1_offset : UInt32, @plane2_offset : UInt32, @plane3_offset : UInt32, @plane4_offset : UInt32, @vga_state_flags : UInt32, @dib_offset : UInt32, @dib_bits_per_pixel : UInt32, @dibx_resolution : UInt32, @diby_resolution : UInt32, @dib_xlat_offset : UInt32, @dib_xlat_length : UInt32, @vesa_info_offset : UInt32, @frame_buffer_data : Void*)
    end
  end

  @[Extern]
  struct VIDEO_HARDWARE_STATE
    property state_header : Win32cr::Devices::Display::VIDEO_HARDWARE_STATE_HEADER*
    property state_length : UInt32
    def initialize(@state_header : Win32cr::Devices::Display::VIDEO_HARDWARE_STATE_HEADER*, @state_length : UInt32)
    end
  end

  @[Extern]
  struct VIDEO_NUM_MODES
    property num_modes : UInt32
    property mode_information_length : UInt32
    def initialize(@num_modes : UInt32, @mode_information_length : UInt32)
    end
  end

  @[Extern]
  struct VIDEO_MODE
    property requested_mode : UInt32
    def initialize(@requested_mode : UInt32)
    end
  end

  @[Extern]
  struct VIDEO_MODE_INFORMATION
    property length : UInt32
    property mode_index : UInt32
    property vis_screen_width : UInt32
    property vis_screen_height : UInt32
    property screen_stride : UInt32
    property number_of_planes : UInt32
    property bits_per_plane : UInt32
    property frequency : UInt32
    property x_millimeter : UInt32
    property y_millimeter : UInt32
    property number_red_bits : UInt32
    property number_green_bits : UInt32
    property number_blue_bits : UInt32
    property red_mask : UInt32
    property green_mask : UInt32
    property blue_mask : UInt32
    property attribute_flags : UInt32
    property video_memory_bitmap_width : UInt32
    property video_memory_bitmap_height : UInt32
    property driver_specific_attribute_flags : UInt32
    def initialize(@length : UInt32, @mode_index : UInt32, @vis_screen_width : UInt32, @vis_screen_height : UInt32, @screen_stride : UInt32, @number_of_planes : UInt32, @bits_per_plane : UInt32, @frequency : UInt32, @x_millimeter : UInt32, @y_millimeter : UInt32, @number_red_bits : UInt32, @number_green_bits : UInt32, @number_blue_bits : UInt32, @red_mask : UInt32, @green_mask : UInt32, @blue_mask : UInt32, @attribute_flags : UInt32, @video_memory_bitmap_width : UInt32, @video_memory_bitmap_height : UInt32, @driver_specific_attribute_flags : UInt32)
    end
  end

  @[Extern]
  struct VIDEO_LOAD_FONT_INFORMATION
    property width_in_pixels : UInt16
    property height_in_pixels : UInt16
    property font_size : UInt32
    property font : UInt8*
    def initialize(@width_in_pixels : UInt16, @height_in_pixels : UInt16, @font_size : UInt32, @font : UInt8*)
    end
  end

  @[Extern]
  struct VIDEO_PALETTE_DATA
    property num_entries : UInt16
    property first_entry : UInt16
    property colors : UInt16*
    def initialize(@num_entries : UInt16, @first_entry : UInt16, @colors : UInt16*)
    end
  end

  @[Extern]
  struct VIDEO_CLUTDATA
    property red : UInt8
    property green : UInt8
    property blue : UInt8
    property unused : UInt8
    def initialize(@red : UInt8, @green : UInt8, @blue : UInt8, @unused : UInt8)
    end
  end

  @[Extern]
  struct VIDEO_CLUT
    property num_entries : UInt16
    property first_entry : UInt16
    property lookup_table : Anonymous_e__Union_*

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property rgb_array : Win32cr::Devices::Display::VIDEO_CLUTDATA
    property rgb_long : UInt32
    def initialize(@rgb_array : Win32cr::Devices::Display::VIDEO_CLUTDATA, @rgb_long : UInt32)
    end
    end

    def initialize(@num_entries : UInt16, @first_entry : UInt16, @lookup_table : Anonymous_e__Union_*)
    end
  end

  @[Extern]
  struct VIDEO_CURSOR_POSITION
    property column : Int16
    property row : Int16
    def initialize(@column : Int16, @row : Int16)
    end
  end

  @[Extern]
  struct VIDEO_CURSOR_ATTRIBUTES
    property width : UInt16
    property height : UInt16
    property column : Int16
    property row : Int16
    property rate : UInt8
    property enable : UInt8
    def initialize(@width : UInt16, @height : UInt16, @column : Int16, @row : Int16, @rate : UInt8, @enable : UInt8)
    end
  end

  @[Extern]
  struct VIDEO_POINTER_POSITION
    property column : Int16
    property row : Int16
    def initialize(@column : Int16, @row : Int16)
    end
  end

  @[Extern]
  struct VIDEO_POINTER_ATTRIBUTES
    property flags : UInt32
    property width : UInt32
    property height : UInt32
    property width_in_bytes : UInt32
    property enable : UInt32
    property column : Int16
    property row : Int16
    property pixels : UInt8*
    def initialize(@flags : UInt32, @width : UInt32, @height : UInt32, @width_in_bytes : UInt32, @enable : UInt32, @column : Int16, @row : Int16, @pixels : UInt8*)
    end
  end

  @[Extern]
  struct VIDEO_POINTER_CAPABILITIES
    property flags : UInt32
    property max_width : UInt32
    property max_height : UInt32
    property hw_ptr_bitmap_start : UInt32
    property hw_ptr_bitmap_end : UInt32
    def initialize(@flags : UInt32, @max_width : UInt32, @max_height : UInt32, @hw_ptr_bitmap_start : UInt32, @hw_ptr_bitmap_end : UInt32)
    end
  end

  @[Extern]
  struct VIDEO_BANK_SELECT
    property length : UInt32
    property size : UInt32
    property banking_flags : UInt32
    property banking_type : UInt32
    property planar_hc_banking_type : UInt32
    property bitmap_width_in_bytes : UInt32
    property bitmap_size : UInt32
    property granularity : UInt32
    property planar_hc_granularity : UInt32
    property code_offset : UInt32
    property planar_hc_bank_code_offset : UInt32
    property planar_hc_enable_code_offset : UInt32
    property planar_hc_disable_code_offset : UInt32
    def initialize(@length : UInt32, @size : UInt32, @banking_flags : UInt32, @banking_type : UInt32, @planar_hc_banking_type : UInt32, @bitmap_width_in_bytes : UInt32, @bitmap_size : UInt32, @granularity : UInt32, @planar_hc_granularity : UInt32, @code_offset : UInt32, @planar_hc_bank_code_offset : UInt32, @planar_hc_enable_code_offset : UInt32, @planar_hc_disable_code_offset : UInt32)
    end
  end

  @[Extern]
  struct VIDEO_MEMORY
    property requested_virtual_address : Void*
    def initialize(@requested_virtual_address : Void*)
    end
  end

  @[Extern]
  struct VIDEO_SHARE_MEMORY
    property process_handle : Win32cr::Foundation::HANDLE
    property view_offset : UInt32
    property view_size : UInt32
    property requested_virtual_address : Void*
    def initialize(@process_handle : Win32cr::Foundation::HANDLE, @view_offset : UInt32, @view_size : UInt32, @requested_virtual_address : Void*)
    end
  end

  @[Extern]
  struct VIDEO_SHARE_MEMORY_INFORMATION
    property shared_view_offset : UInt32
    property shared_view_size : UInt32
    property virtual_address : Void*
    def initialize(@shared_view_offset : UInt32, @shared_view_size : UInt32, @virtual_address : Void*)
    end
  end

  @[Extern]
  struct VIDEO_MEMORY_INFORMATION
    property video_ram_base : Void*
    property video_ram_length : UInt32
    property frame_buffer_base : Void*
    property frame_buffer_length : UInt32
    def initialize(@video_ram_base : Void*, @video_ram_length : UInt32, @frame_buffer_base : Void*, @frame_buffer_length : UInt32)
    end
  end

  @[Extern]
  struct VIDEO_PUBLIC_ACCESS_RANGES
    property in_io_space : UInt32
    property mapped_in_io_space : UInt32
    property virtual_address : Void*
    def initialize(@in_io_space : UInt32, @mapped_in_io_space : UInt32, @virtual_address : Void*)
    end
  end

  @[Extern]
  struct VIDEO_COLOR_CAPABILITIES
    property length : UInt32
    property attribute_flags : UInt32
    property red_phosphore_decay : Int32
    property green_phosphore_decay : Int32
    property blue_phosphore_decay : Int32
    property white_chromaticity_x : Int32
    property white_chromaticity_y : Int32
    property white_chromaticity_y_ : Int32
    property red_chromaticity_x : Int32
    property red_chromaticity_y : Int32
    property green_chromaticity_x : Int32
    property green_chromaticity_y : Int32
    property blue_chromaticity_x : Int32
    property blue_chromaticity_y : Int32
    property white_gamma : Int32
    property red_gamma : Int32
    property green_gamma : Int32
    property blue_gamma : Int32
    def initialize(@length : UInt32, @attribute_flags : UInt32, @red_phosphore_decay : Int32, @green_phosphore_decay : Int32, @blue_phosphore_decay : Int32, @white_chromaticity_x : Int32, @white_chromaticity_y : Int32, @white_chromaticity_y_ : Int32, @red_chromaticity_x : Int32, @red_chromaticity_y : Int32, @green_chromaticity_x : Int32, @green_chromaticity_y : Int32, @blue_chromaticity_x : Int32, @blue_chromaticity_y : Int32, @white_gamma : Int32, @red_gamma : Int32, @green_gamma : Int32, @blue_gamma : Int32)
    end
  end

  @[Extern]
  struct VIDEO_POWER_MANAGEMENT
    property length : UInt32
    property dpms_version : UInt32
    property power_state : UInt32
    def initialize(@length : UInt32, @dpms_version : UInt32, @power_state : UInt32)
    end
  end

  @[Extern]
  struct VIDEO_COLOR_LUT_DATA
    property length : UInt32
    property lut_data_format : UInt32
    property lut_data : UInt8*
    def initialize(@length : UInt32, @lut_data_format : UInt32, @lut_data : UInt8*)
    end
  end

  @[Extern]
  struct VIDEO_LUT_RGB256WORDS
    property red : UInt16[256]
    property green : UInt16[256]
    property blue : UInt16[256]
    def initialize(@red : UInt16[256], @green : UInt16[256], @blue : UInt16[256])
    end
  end

  @[Extern]
  struct BANK_POSITION
    property read_bank_position : UInt32
    property write_bank_position : UInt32
    def initialize(@read_bank_position : UInt32, @write_bank_position : UInt32)
    end
  end

  @[Extern]
  struct DISPLAY_BRIGHTNESS
    property ucDisplayPolicy : UInt8
    property ucACBrightness : UInt8
    property ucDCBrightness : UInt8
    def initialize(@ucDisplayPolicy : UInt8, @ucACBrightness : UInt8, @ucDCBrightness : UInt8)
    end
  end

  @[Extern]
  struct VIDEO_BRIGHTNESS_POLICY
    property default_to_bios_policy : Win32cr::Foundation::BOOLEAN
    property level_count : UInt8
    property level : Anonymous_e__Struct_*

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property battery_level : UInt8
    property brightness : UInt8
    def initialize(@battery_level : UInt8, @brightness : UInt8)
    end
    end

    def initialize(@default_to_bios_policy : Win32cr::Foundation::BOOLEAN, @level_count : UInt8, @level : Anonymous_e__Struct_*)
    end
  end

  @[Extern]
  struct FSCNTL_SCREEN_INFO
    property position : Win32cr::System::Console::COORD
    property screen_size : Win32cr::System::Console::COORD
    property nNumberOfChars : UInt32
    def initialize(@position : Win32cr::System::Console::COORD, @screen_size : Win32cr::System::Console::COORD, @nNumberOfChars : UInt32)
    end
  end

  @[Extern]
  struct FONT_IMAGE_INFO
    property font_size : Win32cr::System::Console::COORD
    property image_bits : UInt8*
    def initialize(@font_size : Win32cr::System::Console::COORD, @image_bits : UInt8*)
    end
  end

  @[Extern]
  struct CHAR_IMAGE_INFO
    property char_info : Win32cr::System::Console::CHAR_INFO
    property font_image_info : Win32cr::Devices::Display::FONT_IMAGE_INFO
    def initialize(@char_info : Win32cr::System::Console::CHAR_INFO, @font_image_info : Win32cr::Devices::Display::FONT_IMAGE_INFO)
    end
  end

  @[Extern]
  struct VGA_CHAR
    property char : Win32cr::Foundation::CHAR
    property attributes : Win32cr::Foundation::CHAR
    def initialize(@char : Win32cr::Foundation::CHAR, @attributes : Win32cr::Foundation::CHAR)
    end
  end

  @[Extern]
  struct FSVIDEO_COPY_FRAME_BUFFER
    property src_screen : Win32cr::Devices::Display::FSCNTL_SCREEN_INFO
    property dest_screen : Win32cr::Devices::Display::FSCNTL_SCREEN_INFO
    def initialize(@src_screen : Win32cr::Devices::Display::FSCNTL_SCREEN_INFO, @dest_screen : Win32cr::Devices::Display::FSCNTL_SCREEN_INFO)
    end
  end

  @[Extern]
  struct FSVIDEO_WRITE_TO_FRAME_BUFFER
    property src_buffer : Win32cr::Devices::Display::CHAR_IMAGE_INFO*
    property dest_screen : Win32cr::Devices::Display::FSCNTL_SCREEN_INFO
    def initialize(@src_buffer : Win32cr::Devices::Display::CHAR_IMAGE_INFO*, @dest_screen : Win32cr::Devices::Display::FSCNTL_SCREEN_INFO)
    end
  end

  @[Extern]
  struct FSVIDEO_REVERSE_MOUSE_POINTER
    property screen : Win32cr::Devices::Display::FSCNTL_SCREEN_INFO
    property dwType : UInt32
    def initialize(@screen : Win32cr::Devices::Display::FSCNTL_SCREEN_INFO, @dwType : UInt32)
    end
  end

  @[Extern]
  struct FSVIDEO_MODE_INFORMATION
    property video_mode : Win32cr::Devices::Display::VIDEO_MODE_INFORMATION
    property video_memory : Win32cr::Devices::Display::VIDEO_MEMORY_INFORMATION
    def initialize(@video_mode : Win32cr::Devices::Display::VIDEO_MODE_INFORMATION, @video_memory : Win32cr::Devices::Display::VIDEO_MEMORY_INFORMATION)
    end
  end

  @[Extern]
  struct FSVIDEO_SCREEN_INFORMATION
    property screen_size : Win32cr::System::Console::COORD
    property font_size : Win32cr::System::Console::COORD
    def initialize(@screen_size : Win32cr::System::Console::COORD, @font_size : Win32cr::System::Console::COORD)
    end
  end

  @[Extern]
  struct FSVIDEO_CURSOR_POSITION
    property coord : Win32cr::Devices::Display::VIDEO_CURSOR_POSITION
    property dwType : UInt32
    def initialize(@coord : Win32cr::Devices::Display::VIDEO_CURSOR_POSITION, @dwType : UInt32)
    end
  end

  @[Extern]
  struct ENG_EVENT
    property pKEvent : Void*
    property fFlags : UInt32
    def initialize(@pKEvent : Void*, @fFlags : UInt32)
    end
  end

  @[Extern]
  struct VIDEO_PERFORMANCE_COUNTER
    property nb_of_allocation_evicted : UInt64[10]
    property nb_of_allocation_marked : UInt64[10]
    property nb_of_allocation_restored : UInt64[10]
    property k_bytes_evicted : UInt64[10]
    property k_bytes_marked : UInt64[10]
    property k_bytes_restored : UInt64[10]
    property nb_process_commited : UInt64
    property nb_allocation_commited : UInt64
    property nb_allocation_marked : UInt64
    property k_bytes_allocated : UInt64
    property k_bytes_available : UInt64
    property k_bytes_cur_marked : UInt64
    property reference : UInt64
    property unreference : UInt64
    property true_reference : UInt64
    property nb_of_page_in : UInt64
    property k_bytes_page_in : UInt64
    property nb_of_page_out : UInt64
    property k_bytes_page_out : UInt64
    property nb_of_rotate_out : UInt64
    property k_bytes_rotate_out : UInt64
    def initialize(@nb_of_allocation_evicted : UInt64[10], @nb_of_allocation_marked : UInt64[10], @nb_of_allocation_restored : UInt64[10], @k_bytes_evicted : UInt64[10], @k_bytes_marked : UInt64[10], @k_bytes_restored : UInt64[10], @nb_process_commited : UInt64, @nb_allocation_commited : UInt64, @nb_allocation_marked : UInt64, @k_bytes_allocated : UInt64, @k_bytes_available : UInt64, @k_bytes_cur_marked : UInt64, @reference : UInt64, @unreference : UInt64, @true_reference : UInt64, @nb_of_page_in : UInt64, @k_bytes_page_in : UInt64, @nb_of_page_out : UInt64, @k_bytes_page_out : UInt64, @nb_of_rotate_out : UInt64, @k_bytes_rotate_out : UInt64)
    end
  end

  @[Extern]
  struct VIDEO_QUERY_PERFORMANCE_COUNTER
    property buffer_size : UInt32
    property buffer : Win32cr::Devices::Display::VIDEO_PERFORMANCE_COUNTER*
    def initialize(@buffer_size : UInt32, @buffer : Win32cr::Devices::Display::VIDEO_PERFORMANCE_COUNTER*)
    end
  end

  @[Extern]
  struct PANEL_QUERY_BRIGHTNESS_CAPS
    property version : Win32cr::Devices::Display::BRIGHTNESS_INTERFACE_VERSION
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property anonymous : Anonymous_e__Struct_
    property value : UInt32

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
      end

    def initialize(@anonymous : Anonymous_e__Struct_, @value : UInt32)
    end
    end

    def initialize(@version : Win32cr::Devices::Display::BRIGHTNESS_INTERFACE_VERSION, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct BRIGHTNESS_LEVEL
    property count : UInt8
    property level : UInt8[103]
    def initialize(@count : UInt8, @level : UInt8[103])
    end
  end

  @[Extern]
  struct BRIGHTNESS_NIT_RANGE
    property min_level_in_millinit : UInt32
    property max_level_in_millinit : UInt32
    property step_size_in_millinit : UInt32
    def initialize(@min_level_in_millinit : UInt32, @max_level_in_millinit : UInt32, @step_size_in_millinit : UInt32)
    end
  end

  @[Extern]
  struct BRIGHTNESS_NIT_RANGES
    property normal_range_count : UInt32
    property range_count : UInt32
    property preferred_maximum_brightness : UInt32
    property supported_ranges : Win32cr::Devices::Display::BRIGHTNESS_NIT_RANGE[16]
    def initialize(@normal_range_count : UInt32, @range_count : UInt32, @preferred_maximum_brightness : UInt32, @supported_ranges : Win32cr::Devices::Display::BRIGHTNESS_NIT_RANGE[16])
    end
  end

  @[Extern]
  struct PANEL_QUERY_BRIGHTNESS_RANGES
    property version : Win32cr::Devices::Display::BRIGHTNESS_INTERFACE_VERSION
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property brightness_level : Win32cr::Devices::Display::BRIGHTNESS_LEVEL
    property nit_ranges : Win32cr::Devices::Display::BRIGHTNESS_NIT_RANGES
    def initialize(@brightness_level : Win32cr::Devices::Display::BRIGHTNESS_LEVEL, @nit_ranges : Win32cr::Devices::Display::BRIGHTNESS_NIT_RANGES)
    end
    end

    def initialize(@version : Win32cr::Devices::Display::BRIGHTNESS_INTERFACE_VERSION, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct PANEL_GET_BRIGHTNESS
    property version : Win32cr::Devices::Display::BRIGHTNESS_INTERFACE_VERSION
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property level : UInt8
    property anonymous : Anonymous_e__Struct_

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property current_in_millinits : UInt32
    property target_in_millinits : UInt32
    def initialize(@current_in_millinits : UInt32, @target_in_millinits : UInt32)
    end
      end

    def initialize(@level : UInt8, @anonymous : Anonymous_e__Struct_)
    end
    end

    def initialize(@version : Win32cr::Devices::Display::BRIGHTNESS_INTERFACE_VERSION, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct CHROMATICITY_COORDINATE
    property x : Float32
    property y : Float32
    def initialize(@x : Float32, @y : Float32)
    end
  end

  @[Extern]
  struct PANEL_BRIGHTNESS_SENSOR_DATA
    property anonymous : Anonymous_e__Union_
    property als_reading : Float32
    property chromaticity_coordinate : Win32cr::Devices::Display::CHROMATICITY_COORDINATE
    property color_temperature : Float32

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property anonymous : Anonymous_e__Struct_
    property value : UInt32

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
      end

    def initialize(@anonymous : Anonymous_e__Struct_, @value : UInt32)
    end
    end

    def initialize(@anonymous : Anonymous_e__Union_, @als_reading : Float32, @chromaticity_coordinate : Win32cr::Devices::Display::CHROMATICITY_COORDINATE, @color_temperature : Float32)
    end
  end

  @[Extern]
  struct PANEL_SET_BRIGHTNESS
    property version : Win32cr::Devices::Display::BRIGHTNESS_INTERFACE_VERSION
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property level : UInt8
    property anonymous : Anonymous_e__Struct_

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property millinits : UInt32
    property transition_time_in_ms : UInt32
    property sensor_data : Win32cr::Devices::Display::PANEL_BRIGHTNESS_SENSOR_DATA
    def initialize(@millinits : UInt32, @transition_time_in_ms : UInt32, @sensor_data : Win32cr::Devices::Display::PANEL_BRIGHTNESS_SENSOR_DATA)
    end
      end

    def initialize(@level : UInt8, @anonymous : Anonymous_e__Struct_)
    end
    end

    def initialize(@version : Win32cr::Devices::Display::BRIGHTNESS_INTERFACE_VERSION, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct PANEL_SET_BRIGHTNESS_STATE
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property anonymous : Anonymous_e__Struct_
    property value : UInt32

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
      end

    def initialize(@anonymous : Anonymous_e__Struct_, @value : UInt32)
    end
    end

    def initialize(@anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct PANEL_SET_BACKLIGHT_OPTIMIZATION
    property level : Win32cr::Devices::Display::BACKLIGHT_OPTIMIZATION_LEVEL
    def initialize(@level : Win32cr::Devices::Display::BACKLIGHT_OPTIMIZATION_LEVEL)
    end
  end

  @[Extern]
  struct BACKLIGHT_REDUCTION_GAMMA_RAMP
    property r : UInt16[256]
    property g : UInt16[256]
    property b : UInt16[256]
    def initialize(@r : UInt16[256], @g : UInt16[256], @b : UInt16[256])
    end
  end

  @[Extern]
  struct PANEL_GET_BACKLIGHT_REDUCTION
    property backlight_usersetting : UInt16
    property backlight_effective : UInt16
    property gamma_ramp : Win32cr::Devices::Display::BACKLIGHT_REDUCTION_GAMMA_RAMP
    def initialize(@backlight_usersetting : UInt16, @backlight_effective : UInt16, @gamma_ramp : Win32cr::Devices::Display::BACKLIGHT_REDUCTION_GAMMA_RAMP)
    end
  end

  @[Extern]
  struct COLORSPACE_TRANSFORM_DATA_CAP
    property data_type : Win32cr::Devices::Display::COLORSPACE_TRANSFORM_DATA_TYPE
    property anonymous : Anonymous_e__Union_
    property numeric_range_min : Float32
    property numeric_range_max : Float32

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property anonymous1 : Anonymous1_e__Struct_
    property anonymous2 : Anonymous2_e__Struct_
    property value : UInt32

      # Nested Type Anonymous2_e__Struct_
      @[Extern]
      struct Anonymous2_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
      end


      # Nested Type Anonymous1_e__Struct_
      @[Extern]
      struct Anonymous1_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
      end

    def initialize(@anonymous1 : Anonymous1_e__Struct_, @anonymous2 : Anonymous2_e__Struct_, @value : UInt32)
    end
    end

    def initialize(@data_type : Win32cr::Devices::Display::COLORSPACE_TRANSFORM_DATA_TYPE, @anonymous : Anonymous_e__Union_, @numeric_range_min : Float32, @numeric_range_max : Float32)
    end
  end

  @[Extern]
  struct COLORSPACE_TRANSFORM_1DLUT_CAP
    property number_of_lut_entries : UInt32
    property data_cap : Win32cr::Devices::Display::COLORSPACE_TRANSFORM_DATA_CAP
    def initialize(@number_of_lut_entries : UInt32, @data_cap : Win32cr::Devices::Display::COLORSPACE_TRANSFORM_DATA_CAP)
    end
  end

  @[Extern]
  struct COLORSPACE_TRANSFORM_MATRIX_CAP
    property anonymous : Anonymous_e__Union_
    property data_cap : Win32cr::Devices::Display::COLORSPACE_TRANSFORM_DATA_CAP

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property anonymous : Anonymous_e__Struct_
    property value : UInt32

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
      end

    def initialize(@anonymous : Anonymous_e__Struct_, @value : UInt32)
    end
    end

    def initialize(@anonymous : Anonymous_e__Union_, @data_cap : Win32cr::Devices::Display::COLORSPACE_TRANSFORM_DATA_CAP)
    end
  end

  @[Extern]
  struct COLORSPACE_TRANSFORM_TARGET_CAPS
    property version : Win32cr::Devices::Display::COLORSPACE_TRANSFORM_TARGET_CAPS_VERSION
    property lookup_table1_d_degamma_cap : Win32cr::Devices::Display::COLORSPACE_TRANSFORM_1DLUT_CAP
    property color_matrix3x3_cap : Win32cr::Devices::Display::COLORSPACE_TRANSFORM_MATRIX_CAP
    property lookup_table1_d_regamma_cap : Win32cr::Devices::Display::COLORSPACE_TRANSFORM_1DLUT_CAP
    def initialize(@version : Win32cr::Devices::Display::COLORSPACE_TRANSFORM_TARGET_CAPS_VERSION, @lookup_table1_d_degamma_cap : Win32cr::Devices::Display::COLORSPACE_TRANSFORM_1DLUT_CAP, @color_matrix3x3_cap : Win32cr::Devices::Display::COLORSPACE_TRANSFORM_MATRIX_CAP, @lookup_table1_d_regamma_cap : Win32cr::Devices::Display::COLORSPACE_TRANSFORM_1DLUT_CAP)
    end
  end

  @[Extern]
  struct GAMMA_RAMP_RGB256x3x16
    property red : UInt16[256]
    property green : UInt16[256]
    property blue : UInt16[256]
    def initialize(@red : UInt16[256], @green : UInt16[256], @blue : UInt16[256])
    end
  end

  @[Extern]
  struct GAMMA_RAMP_RGB
    property red : Float32
    property green : Float32
    property blue : Float32
    def initialize(@red : Float32, @green : Float32, @blue : Float32)
    end
  end

  @[Extern]
  struct GAMMA_RAMP_DXGI_1
    property scale : Win32cr::Devices::Display::GAMMA_RAMP_RGB
    property offset : Win32cr::Devices::Display::GAMMA_RAMP_RGB
    property gamma_curve : Win32cr::Devices::Display::GAMMA_RAMP_RGB[1025]
    def initialize(@scale : Win32cr::Devices::Display::GAMMA_RAMP_RGB, @offset : Win32cr::Devices::Display::GAMMA_RAMP_RGB, @gamma_curve : Win32cr::Devices::Display::GAMMA_RAMP_RGB[1025])
    end
  end

  @[Extern]
  struct COLORSPACE_TRANSFORM_3x4
    property color_matrix3x4 : Float32[12]
    property scalar_multiplier : Float32
    property lookup_table1_d : Win32cr::Devices::Display::GAMMA_RAMP_RGB[4096]
    def initialize(@color_matrix3x4 : Float32[12], @scalar_multiplier : Float32, @lookup_table1_d : Win32cr::Devices::Display::GAMMA_RAMP_RGB[4096])
    end
  end

  @[Extern]
  struct OUTPUT_WIRE_FORMAT
    property color_encoding : Win32cr::Devices::Display::OUTPUT_COLOR_ENCODING
    property bits_per_pixel : UInt32
    def initialize(@color_encoding : Win32cr::Devices::Display::OUTPUT_COLOR_ENCODING, @bits_per_pixel : UInt32)
    end
  end

  @[Extern]
  struct COLORSPACE_TRANSFORM_MATRIX_V2
    property stage_control_lookup_table1_d_degamma : Win32cr::Devices::Display::COLORSPACE_TRANSFORM_STAGE_CONTROL
    property lookup_table1_d_degamma : Win32cr::Devices::Display::GAMMA_RAMP_RGB[4096]
    property stage_control_color_matrix3x3 : Win32cr::Devices::Display::COLORSPACE_TRANSFORM_STAGE_CONTROL
    property color_matrix3x3 : Float32[9]
    property stage_control_lookup_table1_d_regamma : Win32cr::Devices::Display::COLORSPACE_TRANSFORM_STAGE_CONTROL
    property lookup_table1_d_regamma : Win32cr::Devices::Display::GAMMA_RAMP_RGB[4096]
    def initialize(@stage_control_lookup_table1_d_degamma : Win32cr::Devices::Display::COLORSPACE_TRANSFORM_STAGE_CONTROL, @lookup_table1_d_degamma : Win32cr::Devices::Display::GAMMA_RAMP_RGB[4096], @stage_control_color_matrix3x3 : Win32cr::Devices::Display::COLORSPACE_TRANSFORM_STAGE_CONTROL, @color_matrix3x3 : Float32[9], @stage_control_lookup_table1_d_regamma : Win32cr::Devices::Display::COLORSPACE_TRANSFORM_STAGE_CONTROL, @lookup_table1_d_regamma : Win32cr::Devices::Display::GAMMA_RAMP_RGB[4096])
    end
  end

  @[Extern]
  struct COLORSPACE_TRANSFORM
    property type__ : Win32cr::Devices::Display::COLORSPACE_TRANSFORM_TYPE
    property data : Data_e__Union_

    # Nested Type Data_e__Union_
    @[Extern(union: true)]
    struct Data_e__Union_
    property rgb256x3x16 : Win32cr::Devices::Display::GAMMA_RAMP_RGB256x3x16
    property dxgi1 : Win32cr::Devices::Display::GAMMA_RAMP_DXGI_1
    property t3x4 : Win32cr::Devices::Display::COLORSPACE_TRANSFORM_3x4
    property matrix_v2 : Win32cr::Devices::Display::COLORSPACE_TRANSFORM_MATRIX_V2
    def initialize(@rgb256x3x16 : Win32cr::Devices::Display::GAMMA_RAMP_RGB256x3x16, @dxgi1 : Win32cr::Devices::Display::GAMMA_RAMP_DXGI_1, @t3x4 : Win32cr::Devices::Display::COLORSPACE_TRANSFORM_3x4, @matrix_v2 : Win32cr::Devices::Display::COLORSPACE_TRANSFORM_MATRIX_V2)
    end
    end

    def initialize(@type__ : Win32cr::Devices::Display::COLORSPACE_TRANSFORM_TYPE, @data : Data_e__Union_)
    end
  end

  @[Extern]
  struct COLORSPACE_TRANSFORM_SET_INPUT
    property output_wire_color_space_expected : Win32cr::Devices::Display::OUTPUT_WIRE_COLOR_SPACE_TYPE
    property output_wire_format_expected : Win32cr::Devices::Display::OUTPUT_WIRE_FORMAT
    property color_space_transform : Win32cr::Devices::Display::COLORSPACE_TRANSFORM
    def initialize(@output_wire_color_space_expected : Win32cr::Devices::Display::OUTPUT_WIRE_COLOR_SPACE_TYPE, @output_wire_format_expected : Win32cr::Devices::Display::OUTPUT_WIRE_FORMAT, @color_space_transform : Win32cr::Devices::Display::COLORSPACE_TRANSFORM)
    end
  end

  @[Extern]
  struct SET_ACTIVE_COLOR_PROFILE_NAME
    property color_profile_name : UInt16*
    def initialize(@color_profile_name : UInt16*)
    end
  end

  @[Extern]
  struct MIPI_DSI_CAPS
    property dsi_type_major : UInt8
    property dsi_type_minor : UInt8
    property spec_version_major : UInt8
    property spec_version_minor : UInt8
    property spec_version_patch : UInt8
    property target_maximum_return_packet_size : UInt16
    property result_code_flags : UInt8
    property result_code_status : UInt8
    property revision : UInt8
    property level : UInt8
    property device_class_hi : UInt8
    property device_class_lo : UInt8
    property manufacturer_hi : UInt8
    property manufacturer_lo : UInt8
    property product_hi : UInt8
    property product_lo : UInt8
    property length_hi : UInt8
    property length_lo : UInt8
    def initialize(@dsi_type_major : UInt8, @dsi_type_minor : UInt8, @spec_version_major : UInt8, @spec_version_minor : UInt8, @spec_version_patch : UInt8, @target_maximum_return_packet_size : UInt16, @result_code_flags : UInt8, @result_code_status : UInt8, @revision : UInt8, @level : UInt8, @device_class_hi : UInt8, @device_class_lo : UInt8, @manufacturer_hi : UInt8, @manufacturer_lo : UInt8, @product_hi : UInt8, @product_lo : UInt8, @length_hi : UInt8, @length_lo : UInt8)
    end
  end

  @[Extern]
  struct MIPI_DSI_PACKET
    property anonymous1 : Anonymous1_e__Union_
    property anonymous2 : Anonymous2_e__Union_
    property ecc_filler : UInt8
    property payload : UInt8[8]

    # Nested Type Anonymous2_e__Union_
    @[Extern(union: true)]
    struct Anonymous2_e__Union_
    property anonymous : Anonymous_e__Struct_
    property long_write_word_count : UInt16

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property data0 : UInt8
    property data1 : UInt8
    def initialize(@data0 : UInt8, @data1 : UInt8)
    end
      end

    def initialize(@anonymous : Anonymous_e__Struct_, @long_write_word_count : UInt16)
    end
    end


    # Nested Type Anonymous1_e__Union_
    @[Extern(union: true)]
    struct Anonymous1_e__Union_
    property data_id : UInt8
    property anonymous : Anonymous_e__Struct_

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property _bitfield : UInt8
    def initialize(@_bitfield : UInt8)
    end
      end

    def initialize(@data_id : UInt8, @anonymous : Anonymous_e__Struct_)
    end
    end

    def initialize(@anonymous1 : Anonymous1_e__Union_, @anonymous2 : Anonymous2_e__Union_, @ecc_filler : UInt8, @payload : UInt8[8])
    end
  end

  @[Extern]
  struct MIPI_DSI_TRANSMISSION
    property total_buffer_size : UInt32
    property packet_count : UInt8
    property failed_packet : UInt8
    property anonymous : Anonymous_e__Struct_
    property read_word_count : UInt16
    property final_command_extra_payload : UInt16
    property mipi_errors : UInt16
    property host_errors : UInt16
    property packets : Win32cr::Devices::Display::MIPI_DSI_PACKET*

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt16
    def initialize(@_bitfield : UInt16)
    end
    end

    def initialize(@total_buffer_size : UInt32, @packet_count : UInt8, @failed_packet : UInt8, @anonymous : Anonymous_e__Struct_, @read_word_count : UInt16, @final_command_extra_payload : UInt16, @mipi_errors : UInt16, @host_errors : UInt16, @packets : Win32cr::Devices::Display::MIPI_DSI_PACKET*)
    end
  end

  @[Extern]
  struct MIPI_DSI_RESET
    property flags : UInt32
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property anonymous : Anonymous_e__Struct_
    property results : UInt32

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
      end

    def initialize(@anonymous : Anonymous_e__Struct_, @results : UInt32)
    end
    end

    def initialize(@flags : UInt32, @anonymous : Anonymous_e__Union_)
    end
  end

  {% if flag?(:i386) %}
  @[Extern]
  struct POINTE
    property x : UInt32
    property y : UInt32
    def initialize(@x : UInt32, @y : UInt32)
    end
  end
  {% end %}

  {% if flag?(:i386) %}
  @[Extern(union: true)]
  struct FLOAT_LONG
    property e : UInt32
    property l : Int32
    def initialize(@e : UInt32, @l : Int32)
    end
  end
  {% end %}

  {% if flag?(:i386) %}
  @[Extern]
  struct FD_XFORM
    property eXX : UInt32
    property eXY : UInt32
    property eYX : UInt32
    property eYY : UInt32
    def initialize(@eXX : UInt32, @eXY : UInt32, @eYX : UInt32, @eYY : UInt32)
    end
  end
  {% end %}

  {% if flag?(:i386) %}
  @[Extern]
  struct IFIMETRICS
    property cjThis : UInt32
    property cjIfiExtra : UInt32
    property dpwszFamilyName : Int32
    property dpwszStyleName : Int32
    property dpwszFaceName : Int32
    property dpwszUniqueName : Int32
    property dpFontSim : Int32
    property lEmbedId : Int32
    property lItalicAngle : Int32
    property lCharBias : Int32
    property dpCharSets : Int32
    property jWinCharSet : UInt8
    property jWinPitchAndFamily : UInt8
    property usWinWeight : UInt16
    property flInfo : UInt32
    property fsSelection : UInt16
    property fsType : UInt16
    property fwdUnitsPerEm : Int16
    property fwdLowestPPEm : Int16
    property fwdWinAscender : Int16
    property fwdWinDescender : Int16
    property fwdMacAscender : Int16
    property fwdMacDescender : Int16
    property fwdMacLineGap : Int16
    property fwdTypoAscender : Int16
    property fwdTypoDescender : Int16
    property fwdTypoLineGap : Int16
    property fwdAveCharWidth : Int16
    property fwdMaxCharInc : Int16
    property fwdCapHeight : Int16
    property fwdXHeight : Int16
    property fwdSubscriptXSize : Int16
    property fwdSubscriptYSize : Int16
    property fwdSubscriptXOffset : Int16
    property fwdSubscriptYOffset : Int16
    property fwdSuperscriptXSize : Int16
    property fwdSuperscriptYSize : Int16
    property fwdSuperscriptXOffset : Int16
    property fwdSuperscriptYOffset : Int16
    property fwdUnderscoreSize : Int16
    property fwdUnderscorePosition : Int16
    property fwdStrikeoutSize : Int16
    property fwdStrikeoutPosition : Int16
    property chFirstChar : UInt8
    property chLastChar : UInt8
    property chDefaultChar : UInt8
    property chBreakChar : UInt8
    property wcFirstChar : UInt16
    property wcLastChar : UInt16
    property wcDefaultChar : UInt16
    property wcBreakChar : UInt16
    property ptlBaseline : Win32cr::Foundation::POINTL
    property ptlAspect : Win32cr::Foundation::POINTL
    property ptlCaret : Win32cr::Foundation::POINTL
    property rclFontBox : Win32cr::Foundation::RECTL
    property achVendId : UInt8[4]
    property cKerningPairs : UInt32
    property ulPanoseCulture : UInt32
    property panose : Win32cr::Graphics::Gdi::PANOSE
    def initialize(@cjThis : UInt32, @cjIfiExtra : UInt32, @dpwszFamilyName : Int32, @dpwszStyleName : Int32, @dpwszFaceName : Int32, @dpwszUniqueName : Int32, @dpFontSim : Int32, @lEmbedId : Int32, @lItalicAngle : Int32, @lCharBias : Int32, @dpCharSets : Int32, @jWinCharSet : UInt8, @jWinPitchAndFamily : UInt8, @usWinWeight : UInt16, @flInfo : UInt32, @fsSelection : UInt16, @fsType : UInt16, @fwdUnitsPerEm : Int16, @fwdLowestPPEm : Int16, @fwdWinAscender : Int16, @fwdWinDescender : Int16, @fwdMacAscender : Int16, @fwdMacDescender : Int16, @fwdMacLineGap : Int16, @fwdTypoAscender : Int16, @fwdTypoDescender : Int16, @fwdTypoLineGap : Int16, @fwdAveCharWidth : Int16, @fwdMaxCharInc : Int16, @fwdCapHeight : Int16, @fwdXHeight : Int16, @fwdSubscriptXSize : Int16, @fwdSubscriptYSize : Int16, @fwdSubscriptXOffset : Int16, @fwdSubscriptYOffset : Int16, @fwdSuperscriptXSize : Int16, @fwdSuperscriptYSize : Int16, @fwdSuperscriptXOffset : Int16, @fwdSuperscriptYOffset : Int16, @fwdUnderscoreSize : Int16, @fwdUnderscorePosition : Int16, @fwdStrikeoutSize : Int16, @fwdStrikeoutPosition : Int16, @chFirstChar : UInt8, @chLastChar : UInt8, @chDefaultChar : UInt8, @chBreakChar : UInt8, @wcFirstChar : UInt16, @wcLastChar : UInt16, @wcDefaultChar : UInt16, @wcBreakChar : UInt16, @ptlBaseline : Win32cr::Foundation::POINTL, @ptlAspect : Win32cr::Foundation::POINTL, @ptlCaret : Win32cr::Foundation::POINTL, @rclFontBox : Win32cr::Foundation::RECTL, @achVendId : UInt8[4], @cKerningPairs : UInt32, @ulPanoseCulture : UInt32, @panose : Win32cr::Graphics::Gdi::PANOSE)
    end
  end
  {% end %}

  {% if flag?(:i386) %}
  @[Extern]
  struct LINEATTRS
    property fl : UInt32
    property iJoin : UInt32
    property iEndCap : UInt32
    property elWidth : Win32cr::Devices::Display::FLOAT_LONG
    property eMiterLimit : UInt32
    property cstyle : UInt32
    property pstyle : Win32cr::Devices::Display::FLOAT_LONG*
    property elStyleState : Win32cr::Devices::Display::FLOAT_LONG
    def initialize(@fl : UInt32, @iJoin : UInt32, @iEndCap : UInt32, @elWidth : Win32cr::Devices::Display::FLOAT_LONG, @eMiterLimit : UInt32, @cstyle : UInt32, @pstyle : Win32cr::Devices::Display::FLOAT_LONG*, @elStyleState : Win32cr::Devices::Display::FLOAT_LONG)
    end
  end
  {% end %}

  {% if flag?(:i386) %}
  @[Extern]
  struct XFORML
    property eM11 : UInt32
    property eM12 : UInt32
    property eM21 : UInt32
    property eM22 : UInt32
    property eDx : UInt32
    property eDy : UInt32
    def initialize(@eM11 : UInt32, @eM12 : UInt32, @eM21 : UInt32, @eM22 : UInt32, @eDx : UInt32, @eDy : UInt32)
    end
  end
  {% end %}

  {% if flag?(:i386) %}
  @[Extern]
  struct FLOATOBJ
    property ul1 : UInt32
    property ul2 : UInt32
    def initialize(@ul1 : UInt32, @ul2 : UInt32)
    end
  end
  {% end %}

  {% if flag?(:i386) %}
  @[Extern]
  struct FLOATOBJ_XFORM
    property eM11 : Win32cr::Devices::Display::FLOATOBJ
    property eM12 : Win32cr::Devices::Display::FLOATOBJ
    property eM21 : Win32cr::Devices::Display::FLOATOBJ
    property eM22 : Win32cr::Devices::Display::FLOATOBJ
    property eDx : Win32cr::Devices::Display::FLOATOBJ
    property eDy : Win32cr::Devices::Display::FLOATOBJ
    def initialize(@eM11 : Win32cr::Devices::Display::FLOATOBJ, @eM12 : Win32cr::Devices::Display::FLOATOBJ, @eM21 : Win32cr::Devices::Display::FLOATOBJ, @eM22 : Win32cr::Devices::Display::FLOATOBJ, @eDx : Win32cr::Devices::Display::FLOATOBJ, @eDy : Win32cr::Devices::Display::FLOATOBJ)
    end
  end
  {% end %}

  @[Extern]
  record ICloneViewHelperVtbl,
    query_interface : Proc(ICloneViewHelper*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICloneViewHelper*, UInt32),
    release : Proc(ICloneViewHelper*, UInt32),
    get_connected_i_ds : Proc(ICloneViewHelper*, Win32cr::Foundation::PWSTR, UInt32*, UInt32*, UInt32, Win32cr::Foundation::HRESULT),
    get_active_topology : Proc(ICloneViewHelper*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    set_active_topology : Proc(ICloneViewHelper*, Win32cr::Foundation::PWSTR, UInt32, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    commit : Proc(ICloneViewHelper*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICloneViewHelper, lpVtbl : ICloneViewHelperVtbl* do
    GUID = LibC::GUID.new(0xf6a3d4c4_u32, 0x5632_u16, 0x4d83_u16, StaticArray[0xb0_u8, 0xa1_u8, 0xfb_u8, 0x88_u8, 0x71_u8, 0x2b_u8, 0x1e_u8, 0xb7_u8])
    def query_interface(this : ICloneViewHelper*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICloneViewHelper*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICloneViewHelper*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_connected_i_ds(this : ICloneViewHelper*, wszAdaptorName : Win32cr::Foundation::PWSTR, pulCount : UInt32*, pulID : UInt32*, ulFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_connected_i_ds.call(this, wszAdaptorName, pulCount, pulID, ulFlags)
    end
    def get_active_topology(this : ICloneViewHelper*, wszAdaptorName : Win32cr::Foundation::PWSTR, ulSourceID : UInt32, pulCount : UInt32*, pulTargetID : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_active_topology.call(this, wszAdaptorName, ulSourceID, pulCount, pulTargetID)
    end
    def set_active_topology(this : ICloneViewHelper*, wszAdaptorName : Win32cr::Foundation::PWSTR, ulSourceID : UInt32, ulCount : UInt32, pulTargetID : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_active_topology.call(this, wszAdaptorName, ulSourceID, ulCount, pulTargetID)
    end
    def commit(this : ICloneViewHelper*, fFinalCall : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this, fFinalCall)
    end

  end

  @[Extern]
  record IViewHelperVtbl,
    query_interface : Proc(IViewHelper*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IViewHelper*, UInt32),
    release : Proc(IViewHelper*, UInt32),
    get_connected_i_ds : Proc(IViewHelper*, Win32cr::Foundation::PWSTR, UInt32*, UInt32*, UInt32, Win32cr::Foundation::HRESULT),
    get_active_topology : Proc(IViewHelper*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    set_active_topology : Proc(IViewHelper*, Win32cr::Foundation::PWSTR, UInt32, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    commit : Proc(IViewHelper*, Win32cr::Foundation::HRESULT),
    set_configuration : Proc(IViewHelper*, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    get_proceed_on_new_configuration : Proc(IViewHelper*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IViewHelper, lpVtbl : IViewHelperVtbl* do
    GUID = LibC::GUID.new(0xe85ccef5_u32, 0xaaaa_u16, 0x47f0_u16, StaticArray[0xb5_u8, 0xe3_u8, 0x61_u8, 0xf7_u8, 0xae_u8, 0xcd_u8, 0xc4_u8, 0xc1_u8])
    def query_interface(this : IViewHelper*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IViewHelper*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IViewHelper*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_connected_i_ds(this : IViewHelper*, wszAdaptorName : Win32cr::Foundation::PWSTR, pulCount : UInt32*, pulID : UInt32*, ulFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_connected_i_ds.call(this, wszAdaptorName, pulCount, pulID, ulFlags)
    end
    def get_active_topology(this : IViewHelper*, wszAdaptorName : Win32cr::Foundation::PWSTR, ulSourceID : UInt32, pulCount : UInt32*, pulTargetID : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_active_topology.call(this, wszAdaptorName, ulSourceID, pulCount, pulTargetID)
    end
    def set_active_topology(this : IViewHelper*, wszAdaptorName : Win32cr::Foundation::PWSTR, ulSourceID : UInt32, ulCount : UInt32, pulTargetID : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_active_topology.call(this, wszAdaptorName, ulSourceID, ulCount, pulTargetID)
    end
    def commit(this : IViewHelper*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end
    def set_configuration(this : IViewHelper*, pIStream : Void*, pulStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_configuration.call(this, pIStream, pulStatus)
    end
    def get_proceed_on_new_configuration(this : IViewHelper*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_proceed_on_new_configuration.call(this)
    end

  end

  @[Link("dxva2")]
  @[Link("gdi32")]
  @[Link("user32")]
  lib C
    fun GetNumberOfPhysicalMonitorsFromHMONITOR(hMonitor : Win32cr::Graphics::Gdi::HMONITOR, pdwNumberOfPhysicalMonitors : UInt32*) : Int32

    fun GetNumberOfPhysicalMonitorsFromIDirect3DDevice9(pDirect3DDevice9 : Void*, pdwNumberOfPhysicalMonitors : UInt32*) : Win32cr::Foundation::HRESULT

    fun GetPhysicalMonitorsFromHMONITOR(hMonitor : Win32cr::Graphics::Gdi::HMONITOR, dwPhysicalMonitorArraySize : UInt32, pPhysicalMonitorArray : Win32cr::Devices::Display::PHYSICAL_MONITOR*) : Int32

    fun GetPhysicalMonitorsFromIDirect3DDevice9(pDirect3DDevice9 : Void*, dwPhysicalMonitorArraySize : UInt32, pPhysicalMonitorArray : Win32cr::Devices::Display::PHYSICAL_MONITOR*) : Win32cr::Foundation::HRESULT

    fun DestroyPhysicalMonitor(hMonitor : Win32cr::Foundation::HANDLE) : Int32

    fun DestroyPhysicalMonitors(dwPhysicalMonitorArraySize : UInt32, pPhysicalMonitorArray : Win32cr::Devices::Display::PHYSICAL_MONITOR*) : Int32

    fun GetVCPFeatureAndVCPFeatureReply(hMonitor : Win32cr::Foundation::HANDLE, bVCPCode : UInt8, pvct : Win32cr::Devices::Display::MC_VCP_CODE_TYPE*, pdwCurrentValue : UInt32*, pdwMaximumValue : UInt32*) : Int32

    fun SetVCPFeature(hMonitor : Win32cr::Foundation::HANDLE, bVCPCode : UInt8, dwNewValue : UInt32) : Int32

    fun SaveCurrentSettings(hMonitor : Win32cr::Foundation::HANDLE) : Int32

    fun GetCapabilitiesStringLength(hMonitor : Win32cr::Foundation::HANDLE, pdwCapabilitiesStringLengthInCharacters : UInt32*) : Int32

    fun CapabilitiesRequestAndCapabilitiesReply(hMonitor : Win32cr::Foundation::HANDLE, pszASCIICapabilitiesString : UInt8*, dwCapabilitiesStringLengthInCharacters : UInt32) : Int32

    fun GetTimingReport(hMonitor : Win32cr::Foundation::HANDLE, pmtrMonitorTimingReport : Win32cr::Devices::Display::MC_TIMING_REPORT*) : Int32

    fun GetMonitorCapabilities(hMonitor : Win32cr::Foundation::HANDLE, pdwMonitorCapabilities : UInt32*, pdwSupportedColorTemperatures : UInt32*) : Int32

    fun SaveCurrentMonitorSettings(hMonitor : Win32cr::Foundation::HANDLE) : Int32

    fun GetMonitorTechnologyType(hMonitor : Win32cr::Foundation::HANDLE, pdtyDisplayTechnologyType : Win32cr::Devices::Display::MC_DISPLAY_TECHNOLOGY_TYPE*) : Int32

    fun GetMonitorBrightness(hMonitor : Win32cr::Foundation::HANDLE, pdwMinimumBrightness : UInt32*, pdwCurrentBrightness : UInt32*, pdwMaximumBrightness : UInt32*) : Int32

    fun GetMonitorContrast(hMonitor : Win32cr::Foundation::HANDLE, pdwMinimumContrast : UInt32*, pdwCurrentContrast : UInt32*, pdwMaximumContrast : UInt32*) : Int32

    fun GetMonitorColorTemperature(hMonitor : Win32cr::Foundation::HANDLE, pctCurrentColorTemperature : Win32cr::Devices::Display::MC_COLOR_TEMPERATURE*) : Int32

    fun GetMonitorRedGreenOrBlueDrive(hMonitor : Win32cr::Foundation::HANDLE, dtDriveType : Win32cr::Devices::Display::MC_DRIVE_TYPE, pdwMinimumDrive : UInt32*, pdwCurrentDrive : UInt32*, pdwMaximumDrive : UInt32*) : Int32

    fun GetMonitorRedGreenOrBlueGain(hMonitor : Win32cr::Foundation::HANDLE, gtGainType : Win32cr::Devices::Display::MC_GAIN_TYPE, pdwMinimumGain : UInt32*, pdwCurrentGain : UInt32*, pdwMaximumGain : UInt32*) : Int32

    fun SetMonitorBrightness(hMonitor : Win32cr::Foundation::HANDLE, dwNewBrightness : UInt32) : Int32

    fun SetMonitorContrast(hMonitor : Win32cr::Foundation::HANDLE, dwNewContrast : UInt32) : Int32

    fun SetMonitorColorTemperature(hMonitor : Win32cr::Foundation::HANDLE, ctCurrentColorTemperature : Win32cr::Devices::Display::MC_COLOR_TEMPERATURE) : Int32

    fun SetMonitorRedGreenOrBlueDrive(hMonitor : Win32cr::Foundation::HANDLE, dtDriveType : Win32cr::Devices::Display::MC_DRIVE_TYPE, dwNewDrive : UInt32) : Int32

    fun SetMonitorRedGreenOrBlueGain(hMonitor : Win32cr::Foundation::HANDLE, gtGainType : Win32cr::Devices::Display::MC_GAIN_TYPE, dwNewGain : UInt32) : Int32

    fun DegaussMonitor(hMonitor : Win32cr::Foundation::HANDLE) : Int32

    fun GetMonitorDisplayAreaSize(hMonitor : Win32cr::Foundation::HANDLE, stSizeType : Win32cr::Devices::Display::MC_SIZE_TYPE, pdwMinimumWidthOrHeight : UInt32*, pdwCurrentWidthOrHeight : UInt32*, pdwMaximumWidthOrHeight : UInt32*) : Int32

    fun GetMonitorDisplayAreaPosition(hMonitor : Win32cr::Foundation::HANDLE, ptPositionType : Win32cr::Devices::Display::MC_POSITION_TYPE, pdwMinimumPosition : UInt32*, pdwCurrentPosition : UInt32*, pdwMaximumPosition : UInt32*) : Int32

    fun SetMonitorDisplayAreaSize(hMonitor : Win32cr::Foundation::HANDLE, stSizeType : Win32cr::Devices::Display::MC_SIZE_TYPE, dwNewDisplayAreaWidthOrHeight : UInt32) : Int32

    fun SetMonitorDisplayAreaPosition(hMonitor : Win32cr::Foundation::HANDLE, ptPositionType : Win32cr::Devices::Display::MC_POSITION_TYPE, dwNewPosition : UInt32) : Int32

    fun RestoreMonitorFactoryColorDefaults(hMonitor : Win32cr::Foundation::HANDLE) : Int32

    fun RestoreMonitorFactoryDefaults(hMonitor : Win32cr::Foundation::HANDLE) : Int32

    fun BRUSHOBJ_pvAllocRbrush(pbo : Win32cr::Devices::Display::BRUSHOBJ*, cj : UInt32) : Void*

    fun BRUSHOBJ_pvGetRbrush(pbo : Win32cr::Devices::Display::BRUSHOBJ*) : Void*

    fun BRUSHOBJ_ulGetBrushColor(pbo : Win32cr::Devices::Display::BRUSHOBJ*) : UInt32

    fun BRUSHOBJ_hGetColorTransform(pbo : Win32cr::Devices::Display::BRUSHOBJ*) : Win32cr::Foundation::HANDLE

    fun CLIPOBJ_cEnumStart(pco : Win32cr::Devices::Display::CLIPOBJ*, bAll : Win32cr::Foundation::BOOL, iType : UInt32, iDirection : UInt32, cLimit : UInt32) : UInt32

    fun CLIPOBJ_bEnum(pco : Win32cr::Devices::Display::CLIPOBJ*, cj : UInt32, pul : UInt32*) : Win32cr::Foundation::BOOL

    fun CLIPOBJ_ppoGetPath(pco : Win32cr::Devices::Display::CLIPOBJ*) : Win32cr::Devices::Display::PATHOBJ*

    fun FONTOBJ_cGetAllGlyphHandles(pfo : Win32cr::Devices::Display::FONTOBJ*, phg : UInt32*) : UInt32

    fun FONTOBJ_vGetInfo(pfo : Win32cr::Devices::Display::FONTOBJ*, cjSize : UInt32, pfi : Win32cr::Devices::Display::FONTINFO*) : Void

    fun FONTOBJ_cGetGlyphs(pfo : Win32cr::Devices::Display::FONTOBJ*, iMode : UInt32, cGlyph : UInt32, phg : UInt32*, ppvGlyph : Void**) : UInt32

    fun FONTOBJ_pxoGetXform(pfo : Win32cr::Devices::Display::FONTOBJ*) : Win32cr::Devices::Display::XFORMOBJ*

    fun FONTOBJ_pifi(pfo : Win32cr::Devices::Display::FONTOBJ*) : Win32cr::Devices::Display::IFIMETRICS*

    fun FONTOBJ_pfdg(pfo : Win32cr::Devices::Display::FONTOBJ*) : Win32cr::Devices::Display::FD_GLYPHSET*

    fun FONTOBJ_pvTrueTypeFontFile(pfo : Win32cr::Devices::Display::FONTOBJ*, pcjFile : UInt32*) : Void*

    fun FONTOBJ_pQueryGlyphAttrs(pfo : Win32cr::Devices::Display::FONTOBJ*, iMode : UInt32) : Win32cr::Devices::Display::FD_GLYPHATTR*

    fun PATHOBJ_vEnumStart(ppo : Win32cr::Devices::Display::PATHOBJ*) : Void

    fun PATHOBJ_bEnum(ppo : Win32cr::Devices::Display::PATHOBJ*, ppd : Win32cr::Devices::Display::PATHDATA*) : Win32cr::Foundation::BOOL

    fun PATHOBJ_vEnumStartClipLines(ppo : Win32cr::Devices::Display::PATHOBJ*, pco : Win32cr::Devices::Display::CLIPOBJ*, pso : Win32cr::Devices::Display::SURFOBJ*, pla : Win32cr::Devices::Display::LINEATTRS*) : Void

    fun PATHOBJ_bEnumClipLines(ppo : Win32cr::Devices::Display::PATHOBJ*, cb : UInt32, pcl : Win32cr::Devices::Display::CLIPLINE*) : Win32cr::Foundation::BOOL

    fun PATHOBJ_vGetBounds(ppo : Win32cr::Devices::Display::PATHOBJ*, prectfx : Win32cr::Devices::Display::RECTFX*) : Void

    fun STROBJ_vEnumStart(pstro : Win32cr::Devices::Display::STROBJ*) : Void

    fun STROBJ_bEnum(pstro : Win32cr::Devices::Display::STROBJ*, pc : UInt32*, ppgpos : Win32cr::Devices::Display::GLYPHPOS**) : Win32cr::Foundation::BOOL

    fun STROBJ_bEnumPositionsOnly(pstro : Win32cr::Devices::Display::STROBJ*, pc : UInt32*, ppgpos : Win32cr::Devices::Display::GLYPHPOS**) : Win32cr::Foundation::BOOL

    fun STROBJ_dwGetCodePage(pstro : Win32cr::Devices::Display::STROBJ*) : UInt32

    fun STROBJ_bGetAdvanceWidths(pso : Win32cr::Devices::Display::STROBJ*, iFirst : UInt32, c : UInt32, pptqD : Win32cr::Devices::Display::POINTQF*) : Win32cr::Foundation::BOOL

    fun XFORMOBJ_iGetXform(pxo : Win32cr::Devices::Display::XFORMOBJ*, pxform : Win32cr::Devices::Display::XFORML*) : UInt32

    fun XFORMOBJ_bApplyXform(pxo : Win32cr::Devices::Display::XFORMOBJ*, iMode : UInt32, cPoints : UInt32, pvIn : Void*, pvOut : Void*) : Win32cr::Foundation::BOOL

    fun XLATEOBJ_iXlate(pxlo : Win32cr::Devices::Display::XLATEOBJ*, iColor : UInt32) : UInt32

    fun XLATEOBJ_piVector(pxlo : Win32cr::Devices::Display::XLATEOBJ*) : UInt32*

    fun XLATEOBJ_cGetPalette(pxlo : Win32cr::Devices::Display::XLATEOBJ*, iPal : UInt32, cPal : UInt32, pPal : UInt32*) : UInt32

    fun XLATEOBJ_hGetColorTransform(pxlo : Win32cr::Devices::Display::XLATEOBJ*) : Win32cr::Foundation::HANDLE

    fun EngCreateBitmap(sizl : Win32cr::Foundation::SIZE, lWidth : Int32, iFormat : UInt32, fl : UInt32, pvBits : Void*) : Win32cr::Graphics::Gdi::HBITMAP

    fun EngCreateDeviceSurface(dhsurf : Win32cr::Devices::Display::DHSURF, sizl : Win32cr::Foundation::SIZE, iFormatCompat : UInt32) : Win32cr::Devices::Display::HSURF

    fun EngCreateDeviceBitmap(dhsurf : Win32cr::Devices::Display::DHSURF, sizl : Win32cr::Foundation::SIZE, iFormatCompat : UInt32) : Win32cr::Graphics::Gdi::HBITMAP

    fun EngDeleteSurface(hsurf : Win32cr::Devices::Display::HSURF) : Win32cr::Foundation::BOOL

    fun EngLockSurface(hsurf : Win32cr::Devices::Display::HSURF) : Win32cr::Devices::Display::SURFOBJ*

    fun EngUnlockSurface(pso : Win32cr::Devices::Display::SURFOBJ*) : Void

    fun EngEraseSurface(pso : Win32cr::Devices::Display::SURFOBJ*, prcl : Win32cr::Foundation::RECTL*, iColor : UInt32) : Win32cr::Foundation::BOOL

    fun EngAssociateSurface(hsurf : Win32cr::Devices::Display::HSURF, hdev : Win32cr::Devices::Display::HDEV, flHooks : UInt32) : Win32cr::Foundation::BOOL

    fun EngMarkBandingSurface(hsurf : Win32cr::Devices::Display::HSURF) : Win32cr::Foundation::BOOL

    fun EngCheckAbort(pso : Win32cr::Devices::Display::SURFOBJ*) : Win32cr::Foundation::BOOL

    fun EngDeletePath(ppo : Win32cr::Devices::Display::PATHOBJ*) : Void

    fun EngCreatePalette(iMode : UInt32, cColors : UInt32, pulColors : UInt32*, flRed : UInt32, flGreen : UInt32, flBlue : UInt32) : Win32cr::Graphics::Gdi::HPALETTE

    fun EngDeletePalette(hpal : Win32cr::Graphics::Gdi::HPALETTE) : Win32cr::Foundation::BOOL

    fun EngCreateClip : Win32cr::Devices::Display::CLIPOBJ*

    fun EngDeleteClip(pco : Win32cr::Devices::Display::CLIPOBJ*) : Void

    fun EngBitBlt(psoTrg : Win32cr::Devices::Display::SURFOBJ*, psoSrc : Win32cr::Devices::Display::SURFOBJ*, psoMask : Win32cr::Devices::Display::SURFOBJ*, pco : Win32cr::Devices::Display::CLIPOBJ*, pxlo : Win32cr::Devices::Display::XLATEOBJ*, prclTrg : Win32cr::Foundation::RECTL*, pptlSrc : Win32cr::Foundation::POINTL*, pptlMask : Win32cr::Foundation::POINTL*, pbo : Win32cr::Devices::Display::BRUSHOBJ*, pptlBrush : Win32cr::Foundation::POINTL*, rop4 : UInt32) : Win32cr::Foundation::BOOL

    fun EngLineTo(pso : Win32cr::Devices::Display::SURFOBJ*, pco : Win32cr::Devices::Display::CLIPOBJ*, pbo : Win32cr::Devices::Display::BRUSHOBJ*, x1 : Int32, y1 : Int32, x2 : Int32, y2 : Int32, prclBounds : Win32cr::Foundation::RECTL*, mix : UInt32) : Win32cr::Foundation::BOOL

    fun EngStretchBlt(psoDest : Win32cr::Devices::Display::SURFOBJ*, psoSrc : Win32cr::Devices::Display::SURFOBJ*, psoMask : Win32cr::Devices::Display::SURFOBJ*, pco : Win32cr::Devices::Display::CLIPOBJ*, pxlo : Win32cr::Devices::Display::XLATEOBJ*, pca : Win32cr::Graphics::Gdi::COLORADJUSTMENT*, pptlHTOrg : Win32cr::Foundation::POINTL*, prclDest : Win32cr::Foundation::RECTL*, prclSrc : Win32cr::Foundation::RECTL*, pptlMask : Win32cr::Foundation::POINTL*, iMode : UInt32) : Win32cr::Foundation::BOOL

    fun EngStretchBltROP(psoDest : Win32cr::Devices::Display::SURFOBJ*, psoSrc : Win32cr::Devices::Display::SURFOBJ*, psoMask : Win32cr::Devices::Display::SURFOBJ*, pco : Win32cr::Devices::Display::CLIPOBJ*, pxlo : Win32cr::Devices::Display::XLATEOBJ*, pca : Win32cr::Graphics::Gdi::COLORADJUSTMENT*, pptlHTOrg : Win32cr::Foundation::POINTL*, prclDest : Win32cr::Foundation::RECTL*, prclSrc : Win32cr::Foundation::RECTL*, pptlMask : Win32cr::Foundation::POINTL*, iMode : UInt32, pbo : Win32cr::Devices::Display::BRUSHOBJ*, rop4 : UInt32) : Win32cr::Foundation::BOOL

    fun EngAlphaBlend(psoDest : Win32cr::Devices::Display::SURFOBJ*, psoSrc : Win32cr::Devices::Display::SURFOBJ*, pco : Win32cr::Devices::Display::CLIPOBJ*, pxlo : Win32cr::Devices::Display::XLATEOBJ*, prclDest : Win32cr::Foundation::RECTL*, prclSrc : Win32cr::Foundation::RECTL*, pBlendObj : Win32cr::Devices::Display::BLENDOBJ*) : Win32cr::Foundation::BOOL

    fun EngGradientFill(psoDest : Win32cr::Devices::Display::SURFOBJ*, pco : Win32cr::Devices::Display::CLIPOBJ*, pxlo : Win32cr::Devices::Display::XLATEOBJ*, pVertex : Win32cr::Graphics::Gdi::TRIVERTEX*, nVertex : UInt32, pMesh : Void*, nMesh : UInt32, prclExtents : Win32cr::Foundation::RECTL*, pptlDitherOrg : Win32cr::Foundation::POINTL*, ulMode : UInt32) : Win32cr::Foundation::BOOL

    fun EngTransparentBlt(psoDst : Win32cr::Devices::Display::SURFOBJ*, psoSrc : Win32cr::Devices::Display::SURFOBJ*, pco : Win32cr::Devices::Display::CLIPOBJ*, pxlo : Win32cr::Devices::Display::XLATEOBJ*, prclDst : Win32cr::Foundation::RECTL*, prclSrc : Win32cr::Foundation::RECTL*, trans_color : UInt32, bCalledFromBitBlt : UInt32) : Win32cr::Foundation::BOOL

    fun EngTextOut(pso : Win32cr::Devices::Display::SURFOBJ*, pstro : Win32cr::Devices::Display::STROBJ*, pfo : Win32cr::Devices::Display::FONTOBJ*, pco : Win32cr::Devices::Display::CLIPOBJ*, prclExtra : Win32cr::Foundation::RECTL*, prclOpaque : Win32cr::Foundation::RECTL*, pboFore : Win32cr::Devices::Display::BRUSHOBJ*, pboOpaque : Win32cr::Devices::Display::BRUSHOBJ*, pptlOrg : Win32cr::Foundation::POINTL*, mix : UInt32) : Win32cr::Foundation::BOOL

    fun EngStrokePath(pso : Win32cr::Devices::Display::SURFOBJ*, ppo : Win32cr::Devices::Display::PATHOBJ*, pco : Win32cr::Devices::Display::CLIPOBJ*, pxo : Win32cr::Devices::Display::XFORMOBJ*, pbo : Win32cr::Devices::Display::BRUSHOBJ*, pptlBrushOrg : Win32cr::Foundation::POINTL*, plineattrs : Win32cr::Devices::Display::LINEATTRS*, mix : UInt32) : Win32cr::Foundation::BOOL

    fun EngFillPath(pso : Win32cr::Devices::Display::SURFOBJ*, ppo : Win32cr::Devices::Display::PATHOBJ*, pco : Win32cr::Devices::Display::CLIPOBJ*, pbo : Win32cr::Devices::Display::BRUSHOBJ*, pptlBrushOrg : Win32cr::Foundation::POINTL*, mix : UInt32, flOptions : UInt32) : Win32cr::Foundation::BOOL

    fun EngStrokeAndFillPath(pso : Win32cr::Devices::Display::SURFOBJ*, ppo : Win32cr::Devices::Display::PATHOBJ*, pco : Win32cr::Devices::Display::CLIPOBJ*, pxo : Win32cr::Devices::Display::XFORMOBJ*, pboStroke : Win32cr::Devices::Display::BRUSHOBJ*, plineattrs : Win32cr::Devices::Display::LINEATTRS*, pboFill : Win32cr::Devices::Display::BRUSHOBJ*, pptlBrushOrg : Win32cr::Foundation::POINTL*, mixFill : UInt32, flOptions : UInt32) : Win32cr::Foundation::BOOL

    fun EngPaint(pso : Win32cr::Devices::Display::SURFOBJ*, pco : Win32cr::Devices::Display::CLIPOBJ*, pbo : Win32cr::Devices::Display::BRUSHOBJ*, pptlBrushOrg : Win32cr::Foundation::POINTL*, mix : UInt32) : Win32cr::Foundation::BOOL

    fun EngCopyBits(psoDest : Win32cr::Devices::Display::SURFOBJ*, psoSrc : Win32cr::Devices::Display::SURFOBJ*, pco : Win32cr::Devices::Display::CLIPOBJ*, pxlo : Win32cr::Devices::Display::XLATEOBJ*, prclDest : Win32cr::Foundation::RECTL*, pptlSrc : Win32cr::Foundation::POINTL*) : Win32cr::Foundation::BOOL

    fun EngPlgBlt(psoTrg : Win32cr::Devices::Display::SURFOBJ*, psoSrc : Win32cr::Devices::Display::SURFOBJ*, psoMsk : Win32cr::Devices::Display::SURFOBJ*, pco : Win32cr::Devices::Display::CLIPOBJ*, pxlo : Win32cr::Devices::Display::XLATEOBJ*, pca : Win32cr::Graphics::Gdi::COLORADJUSTMENT*, pptlBrushOrg : Win32cr::Foundation::POINTL*, pptfx : Win32cr::Devices::Display::POINTFIX*, prcl : Win32cr::Foundation::RECTL*, pptl : Win32cr::Foundation::POINTL*, iMode : UInt32) : Win32cr::Foundation::BOOL

    fun HT_Get8BPPFormatPalette(pPaletteEntry : Win32cr::Graphics::Gdi::PALETTEENTRY*, red_gamma : UInt16, green_gamma : UInt16, blue_gamma : UInt16) : Int32

    fun HT_Get8BPPMaskPalette(pPaletteEntry : Win32cr::Graphics::Gdi::PALETTEENTRY*, use8_bpp_mask_pal : Win32cr::Foundation::BOOL, cmy_mask : UInt8, red_gamma : UInt16, green_gamma : UInt16, blue_gamma : UInt16) : Int32

    fun EngGetPrinterDataFileName(hdev : Win32cr::Devices::Display::HDEV) : Win32cr::Foundation::PWSTR

    fun EngGetDriverName(hdev : Win32cr::Devices::Display::HDEV) : Win32cr::Foundation::PWSTR

    fun EngLoadModule(pwsz : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HANDLE

    fun EngFindResource(h : Win32cr::Foundation::HANDLE, iName : Int32, iType : Int32, pulSize : UInt32*) : Void*

    fun EngFreeModule(h : Win32cr::Foundation::HANDLE) : Void

    fun EngCreateSemaphore : Win32cr::Devices::Display::HSEMAPHORE

    fun EngAcquireSemaphore(hsem : Win32cr::Devices::Display::HSEMAPHORE) : Void

    fun EngReleaseSemaphore(hsem : Win32cr::Devices::Display::HSEMAPHORE) : Void

    fun EngDeleteSemaphore(hsem : Win32cr::Devices::Display::HSEMAPHORE) : Void

    fun EngMultiByteToUnicodeN(unicode_string : Win32cr::Foundation::PWSTR, max_bytes_in_unicode_string : UInt32, bytes_in_unicode_string : UInt32*, multi_byte_string : Win32cr::Foundation::PSTR, bytes_in_multi_byte_string : UInt32) : Void

    fun EngUnicodeToMultiByteN(multi_byte_string : Win32cr::Foundation::PSTR, max_bytes_in_multi_byte_string : UInt32, bytes_in_multi_byte_string : UInt32*, unicode_string : Win32cr::Foundation::PWSTR, bytes_in_unicode_string : UInt32) : Void

    fun EngQueryLocalTime(param0 : Win32cr::Devices::Display::ENG_TIME_FIELDS*) : Void

    fun EngComputeGlyphSet(nCodePage : Int32, nFirstChar : Int32, cChars : Int32) : Win32cr::Devices::Display::FD_GLYPHSET*

    fun EngMultiByteToWideChar(code_page : UInt32, wide_char_string : Win32cr::Foundation::PWSTR, bytes_in_wide_char_string : Int32, multi_byte_string : Win32cr::Foundation::PSTR, bytes_in_multi_byte_string : Int32) : Int32

    fun EngWideCharToMultiByte(code_page : UInt32, wide_char_string : Win32cr::Foundation::PWSTR, bytes_in_wide_char_string : Int32, multi_byte_string : Win32cr::Foundation::PSTR, bytes_in_multi_byte_string : Int32) : Int32

    fun EngGetCurrentCodePage(oem_code_page : UInt16*, ansi_code_page : UInt16*) : Void

    fun EngQueryEMFInfo(hdev : Win32cr::Devices::Display::HDEV, pEMFInfo : Win32cr::Devices::Display::EMFINFO*) : Win32cr::Foundation::BOOL

    fun GetDisplayConfigBufferSizes(flags : UInt32, numPathArrayElements : UInt32*, numModeInfoArrayElements : UInt32*) : Int32

    fun SetDisplayConfig(numPathArrayElements : UInt32, pathArray : Win32cr::Devices::Display::DISPLAYCONFIG_PATH_INFO*, numModeInfoArrayElements : UInt32, modeInfoArray : Win32cr::Devices::Display::DISPLAYCONFIG_MODE_INFO*, flags : UInt32) : Int32

    fun QueryDisplayConfig(flags : UInt32, numPathArrayElements : UInt32*, pathArray : Win32cr::Devices::Display::DISPLAYCONFIG_PATH_INFO*, numModeInfoArrayElements : UInt32*, modeInfoArray : Win32cr::Devices::Display::DISPLAYCONFIG_MODE_INFO*, currentTopologyId : Win32cr::Devices::Display::DISPLAYCONFIG_TOPOLOGY_ID*) : Int32

    fun DisplayConfigGetDeviceInfo(requestPacket : Win32cr::Devices::Display::DISPLAYCONFIG_DEVICE_INFO_HEADER*) : Int32

    fun DisplayConfigSetDeviceInfo(setPacket : Win32cr::Devices::Display::DISPLAYCONFIG_DEVICE_INFO_HEADER*) : Int32

    fun GetAutoRotationState(pState : Win32cr::Devices::Display::AR_STATE*) : Win32cr::Foundation::BOOL

    fun GetDisplayAutoRotationPreferences(pOrientation : Win32cr::Devices::Display::ORIENTATION_PREFERENCE*) : Win32cr::Foundation::BOOL

    fun SetDisplayAutoRotationPreferences(orientation : Win32cr::Devices::Display::ORIENTATION_PREFERENCE) : Win32cr::Foundation::BOOL

  end
end