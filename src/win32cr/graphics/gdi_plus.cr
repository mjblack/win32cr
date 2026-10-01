require "./../foundation.cr"
require "./gdi.cr"
require "./../system/com.cr"
require "./direct_draw.cr"
require "./../ui/windows_and_messaging.cr"

module Win32cr::Graphics::GdiPlus
  extend self
  alias PathData = LibC::IntPtrT
  alias CGpEffect = LibC::IntPtrT
  alias Matrix = LibC::IntPtrT
  alias Font = LibC::IntPtrT
  alias FontCollection = LibC::IntPtrT
  alias InstalledFontCollection = LibC::IntPtrT
  alias PrivateFontCollection = LibC::IntPtrT
  alias Image = LibC::IntPtrT
  alias Bitmap = LibC::IntPtrT
  alias CustomLineCap = LibC::IntPtrT
  alias CachedBitmap = LibC::IntPtrT
  alias Metafile = LibC::IntPtrT
  alias FontFamily = LibC::IntPtrT
  alias Region = LibC::IntPtrT
  alias ImageAbort = Proc(Void*, Win32cr::Foundation::BOOL)

  alias DrawImageAbort = Proc(Win32cr::Foundation::BOOL)

  alias GetThumbnailImageAbort = Proc(Win32cr::Foundation::BOOL)

  alias EnumerateMetafileProc = Proc(Win32cr::Graphics::GdiPlus::EmfPlusRecordType, UInt32, UInt32, UInt8*, Void*, Win32cr::Foundation::BOOL)

  alias DebugEventProc = Proc(Win32cr::Graphics::GdiPlus::DebugEventLevel, Win32cr::Foundation::PSTR, Void)

  alias NotificationHookProc = Proc(LibC::UIntPtrT*, Win32cr::Graphics::GdiPlus::Status)

  alias NotificationUnhookProc = Proc(LibC::UIntPtrT, Void)

  GDIP_EMFPLUS_RECORD_BASE = 16384_u32
  GDIP_WMF_RECORD_BASE = 65536_u32
  ImageFormatUndefined = LibC::GUID.new(0xb96b3ca9_u32, 0x728_u16, 0x11d3_u16, StaticArray[0x9d_u8, 0x7b_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x1e_u8, 0xf3_u8, 0x2e_u8])
  ImageFormatMemoryBMP = LibC::GUID.new(0xb96b3caa_u32, 0x728_u16, 0x11d3_u16, StaticArray[0x9d_u8, 0x7b_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x1e_u8, 0xf3_u8, 0x2e_u8])
  ImageFormatBMP = LibC::GUID.new(0xb96b3cab_u32, 0x728_u16, 0x11d3_u16, StaticArray[0x9d_u8, 0x7b_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x1e_u8, 0xf3_u8, 0x2e_u8])
  ImageFormatEMF = LibC::GUID.new(0xb96b3cac_u32, 0x728_u16, 0x11d3_u16, StaticArray[0x9d_u8, 0x7b_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x1e_u8, 0xf3_u8, 0x2e_u8])
  ImageFormatWMF = LibC::GUID.new(0xb96b3cad_u32, 0x728_u16, 0x11d3_u16, StaticArray[0x9d_u8, 0x7b_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x1e_u8, 0xf3_u8, 0x2e_u8])
  ImageFormatJPEG = LibC::GUID.new(0xb96b3cae_u32, 0x728_u16, 0x11d3_u16, StaticArray[0x9d_u8, 0x7b_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x1e_u8, 0xf3_u8, 0x2e_u8])
  ImageFormatPNG = LibC::GUID.new(0xb96b3caf_u32, 0x728_u16, 0x11d3_u16, StaticArray[0x9d_u8, 0x7b_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x1e_u8, 0xf3_u8, 0x2e_u8])
  ImageFormatGIF = LibC::GUID.new(0xb96b3cb0_u32, 0x728_u16, 0x11d3_u16, StaticArray[0x9d_u8, 0x7b_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x1e_u8, 0xf3_u8, 0x2e_u8])
  ImageFormatTIFF = LibC::GUID.new(0xb96b3cb1_u32, 0x728_u16, 0x11d3_u16, StaticArray[0x9d_u8, 0x7b_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x1e_u8, 0xf3_u8, 0x2e_u8])
  ImageFormatEXIF = LibC::GUID.new(0xb96b3cb2_u32, 0x728_u16, 0x11d3_u16, StaticArray[0x9d_u8, 0x7b_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x1e_u8, 0xf3_u8, 0x2e_u8])
  ImageFormatIcon = LibC::GUID.new(0xb96b3cb5_u32, 0x728_u16, 0x11d3_u16, StaticArray[0x9d_u8, 0x7b_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x1e_u8, 0xf3_u8, 0x2e_u8])
  ImageFormatHEIF = LibC::GUID.new(0xb96b3cb6_u32, 0x728_u16, 0x11d3_u16, StaticArray[0x9d_u8, 0x7b_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x1e_u8, 0xf3_u8, 0x2e_u8])
  ImageFormatWEBP = LibC::GUID.new(0xb96b3cb7_u32, 0x728_u16, 0x11d3_u16, StaticArray[0x9d_u8, 0x7b_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x1e_u8, 0xf3_u8, 0x2e_u8])
  FrameDimensionTime = LibC::GUID.new(0x6aedbd6d_u32, 0x3fb5_u16, 0x418a_u16, StaticArray[0x83_u8, 0xa6_u8, 0x7f_u8, 0x45_u8, 0x22_u8, 0x9d_u8, 0xc8_u8, 0x72_u8])
  FrameDimensionResolution = LibC::GUID.new(0x84236f7b_u32, 0x3bd3_u16, 0x428f_u16, StaticArray[0x8d_u8, 0xab_u8, 0x4e_u8, 0xa1_u8, 0x43_u8, 0x9c_u8, 0xa3_u8, 0x15_u8])
  FrameDimensionPage = LibC::GUID.new(0x7462dc86_u32, 0x6180_u16, 0x4c7e_u16, StaticArray[0x8e_u8, 0x3f_u8, 0xee_u8, 0x73_u8, 0x33_u8, 0xa7_u8, 0xa4_u8, 0x83_u8])
  FormatIDImageInformation = LibC::GUID.new(0xe5836cbe_u32, 0x5eef_u16, 0x4f1d_u16, StaticArray[0xac_u8, 0xde_u8, 0xae_u8, 0x4c_u8, 0x43_u8, 0xb6_u8, 0x8_u8, 0xce_u8])
  FormatIDJpegAppHeaders = LibC::GUID.new(0x1c4afdcd_u32, 0x6177_u16, 0x43cf_u16, StaticArray[0xab_u8, 0xc7_u8, 0x5f_u8, 0x51_u8, 0xaf_u8, 0x39_u8, 0xee_u8, 0x85_u8])
  EncoderCompression = LibC::GUID.new(0xe09d739d_u32, 0xccd4_u16, 0x44ee_u16, StaticArray[0x8e_u8, 0xba_u8, 0x3f_u8, 0xbf_u8, 0x8b_u8, 0xe4_u8, 0xfc_u8, 0x58_u8])
  EncoderColorDepth = LibC::GUID.new(0x66087055_u32, 0xad66_u16, 0x4c7c_u16, StaticArray[0x9a_u8, 0x18_u8, 0x38_u8, 0xa2_u8, 0x31_u8, 0xb_u8, 0x83_u8, 0x37_u8])
  EncoderScanMethod = LibC::GUID.new(0x3a4e2661_u32, 0x3109_u16, 0x4e56_u16, StaticArray[0x85_u8, 0x36_u8, 0x42_u8, 0xc1_u8, 0x56_u8, 0xe7_u8, 0xdc_u8, 0xfa_u8])
  EncoderVersion = LibC::GUID.new(0x24d18c76_u32, 0x814a_u16, 0x41a4_u16, StaticArray[0xbf_u8, 0x53_u8, 0x1c_u8, 0x21_u8, 0x9c_u8, 0xcc_u8, 0xf7_u8, 0x97_u8])
  EncoderRenderMethod = LibC::GUID.new(0x6d42c53a_u32, 0x229a_u16, 0x4825_u16, StaticArray[0x8b_u8, 0xb7_u8, 0x5c_u8, 0x99_u8, 0xe2_u8, 0xb9_u8, 0xa8_u8, 0xb8_u8])
  EncoderQuality = LibC::GUID.new(0x1d5be4b5_u32, 0xfa4a_u16, 0x452d_u16, StaticArray[0x9c_u8, 0xdd_u8, 0x5d_u8, 0xb3_u8, 0x51_u8, 0x5_u8, 0xe7_u8, 0xeb_u8])
  EncoderTransformation = LibC::GUID.new(0x8d0eb2d1_u32, 0xa58e_u16, 0x4ea8_u16, StaticArray[0xaa_u8, 0x14_u8, 0x10_u8, 0x80_u8, 0x74_u8, 0xb7_u8, 0xb6_u8, 0xf9_u8])
  EncoderLuminanceTable = LibC::GUID.new(0xedb33bce_u32, 0x266_u16, 0x4a77_u16, StaticArray[0xb9_u8, 0x4_u8, 0x27_u8, 0x21_u8, 0x60_u8, 0x99_u8, 0xe7_u8, 0x17_u8])
  EncoderChrominanceTable = LibC::GUID.new(0xf2e455dc_u32, 0x9b3_u16, 0x4316_u16, StaticArray[0x82_u8, 0x60_u8, 0x67_u8, 0x6a_u8, 0xda_u8, 0x32_u8, 0x48_u8, 0x1c_u8])
  EncoderSaveFlag = LibC::GUID.new(0x292266fc_u32, 0xac40_u16, 0x47bf_u16, StaticArray[0x8c_u8, 0xfc_u8, 0xa8_u8, 0x5b_u8, 0x89_u8, 0xa6_u8, 0x55_u8, 0xde_u8])
  EncoderColorSpace = LibC::GUID.new(0xae7a62a0_u32, 0xee2c_u16, 0x49d8_u16, StaticArray[0x9d_u8, 0x7_u8, 0x1b_u8, 0xa8_u8, 0xa9_u8, 0x27_u8, 0x59_u8, 0x6e_u8])
  EncoderImageItems = LibC::GUID.new(0x63875e13_u32, 0x1f1d_u16, 0x45ab_u16, StaticArray[0x91_u8, 0x95_u8, 0xa2_u8, 0x9b_u8, 0x60_u8, 0x66_u8, 0xa6_u8, 0x50_u8])
  EncoderSaveAsCMYK = LibC::GUID.new(0xa219bbc9_u32, 0xa9d_u16, 0x4005_u16, StaticArray[0xa3_u8, 0xee_u8, 0x3a_u8, 0x42_u8, 0x1b_u8, 0x8b_u8, 0xb0_u8, 0x6c_u8])
  CodecIImageBytes = LibC::GUID.new(0x25d1823_u32, 0x6c7d_u16, 0x447b_u16, StaticArray[0xbb_u8, 0xdb_u8, 0xa3_u8, 0xcb_u8, 0xc3_u8, 0xdf_u8, 0xa2_u8, 0xfc_u8])
  PropertyTagTypeByte = 1_u32
  PropertyTagTypeASCII = 2_u32
  PropertyTagTypeShort = 3_u32
  PropertyTagTypeLong = 4_u32
  PropertyTagTypeRational = 5_u32
  PropertyTagTypeUndefined = 7_u32
  PropertyTagTypeSLONG = 9_u32
  PropertyTagTypeSRational = 10_u32
  PropertyTagExifIFD = 34665_u32
  PropertyTagGpsIFD = 34853_u32
  PropertyTagNewSubfileType = 254_u32
  PropertyTagSubfileType = 255_u32
  PropertyTagImageWidth = 256_u32
  PropertyTagImageHeight = 257_u32
  PropertyTagBitsPerSample = 258_u32
  PropertyTagCompression = 259_u32
  PropertyTagPhotometricInterp = 262_u32
  PropertyTagThreshHolding = 263_u32
  PropertyTagCellWidth = 264_u32
  PropertyTagCellHeight = 265_u32
  PropertyTagFillOrder = 266_u32
  PropertyTagDocumentName = 269_u32
  PropertyTagImageDescription = 270_u32
  PropertyTagEquipMake = 271_u32
  PropertyTagEquipModel = 272_u32
  PropertyTagStripOffsets = 273_u32
  PropertyTagOrientation = 274_u32
  PropertyTagSamplesPerPixel = 277_u32
  PropertyTagRowsPerStrip = 278_u32
  PropertyTagStripBytesCount = 279_u32
  PropertyTagMinSampleValue = 280_u32
  PropertyTagMaxSampleValue = 281_u32
  PropertyTagXResolution = 282_u32
  PropertyTagYResolution = 283_u32
  PropertyTagPlanarConfig = 284_u32
  PropertyTagPageName = 285_u32
  PropertyTagXPosition = 286_u32
  PropertyTagYPosition = 287_u32
  PropertyTagFreeOffset = 288_u32
  PropertyTagFreeByteCounts = 289_u32
  PropertyTagGrayResponseUnit = 290_u32
  PropertyTagGrayResponseCurve = 291_u32
  PropertyTagT4Option = 292_u32
  PropertyTagT6Option = 293_u32
  PropertyTagResolutionUnit = 296_u32
  PropertyTagPageNumber = 297_u32
  PropertyTagTransferFuncition = 301_u32
  PropertyTagSoftwareUsed = 305_u32
  PropertyTagDateTime = 306_u32
  PropertyTagArtist = 315_u32
  PropertyTagHostComputer = 316_u32
  PropertyTagPredictor = 317_u32
  PropertyTagWhitePoint = 318_u32
  PropertyTagPrimaryChromaticities = 319_u32
  PropertyTagColorMap = 320_u32
  PropertyTagHalftoneHints = 321_u32
  PropertyTagTileWidth = 322_u32
  PropertyTagTileLength = 323_u32
  PropertyTagTileOffset = 324_u32
  PropertyTagTileByteCounts = 325_u32
  PropertyTagInkSet = 332_u32
  PropertyTagInkNames = 333_u32
  PropertyTagNumberOfInks = 334_u32
  PropertyTagDotRange = 336_u32
  PropertyTagTargetPrinter = 337_u32
  PropertyTagExtraSamples = 338_u32
  PropertyTagSampleFormat = 339_u32
  PropertyTagSMinSampleValue = 340_u32
  PropertyTagSMaxSampleValue = 341_u32
  PropertyTagTransferRange = 342_u32
  PropertyTagJPEGProc = 512_u32
  PropertyTagJPEGInterFormat = 513_u32
  PropertyTagJPEGInterLength = 514_u32
  PropertyTagJPEGRestartInterval = 515_u32
  PropertyTagJPEGLosslessPredictors = 517_u32
  PropertyTagJPEGPointTransforms = 518_u32
  PropertyTagJPEGQTables = 519_u32
  PropertyTagJPEGDCTables = 520_u32
  PropertyTagJPEGACTables = 521_u32
  PropertyTagYCbCrCoefficients = 529_u32
  PropertyTagYCbCrSubsampling = 530_u32
  PropertyTagYCbCrPositioning = 531_u32
  PropertyTagREFBlackWhite = 532_u32
  PropertyTagICCProfile = 34675_u32
  PropertyTagGamma = 769_u32
  PropertyTagICCProfileDescriptor = 770_u32
  PropertyTagSRGBRenderingIntent = 771_u32
  PropertyTagImageTitle = 800_u32
  PropertyTagCopyright = 33432_u32
  PropertyTagResolutionXUnit = 20481_u32
  PropertyTagResolutionYUnit = 20482_u32
  PropertyTagResolutionXLengthUnit = 20483_u32
  PropertyTagResolutionYLengthUnit = 20484_u32
  PropertyTagPrintFlags = 20485_u32
  PropertyTagPrintFlagsVersion = 20486_u32
  PropertyTagPrintFlagsCrop = 20487_u32
  PropertyTagPrintFlagsBleedWidth = 20488_u32
  PropertyTagPrintFlagsBleedWidthScale = 20489_u32
  PropertyTagHalftoneLPI = 20490_u32
  PropertyTagHalftoneLPIUnit = 20491_u32
  PropertyTagHalftoneDegree = 20492_u32
  PropertyTagHalftoneShape = 20493_u32
  PropertyTagHalftoneMisc = 20494_u32
  PropertyTagHalftoneScreen = 20495_u32
  PropertyTagJPEGQuality = 20496_u32
  PropertyTagGridSize = 20497_u32
  PropertyTagThumbnailFormat = 20498_u32
  PropertyTagThumbnailWidth = 20499_u32
  PropertyTagThumbnailHeight = 20500_u32
  PropertyTagThumbnailColorDepth = 20501_u32
  PropertyTagThumbnailPlanes = 20502_u32
  PropertyTagThumbnailRawBytes = 20503_u32
  PropertyTagThumbnailSize = 20504_u32
  PropertyTagThumbnailCompressedSize = 20505_u32
  PropertyTagColorTransferFunction = 20506_u32
  PropertyTagThumbnailData = 20507_u32
  PropertyTagThumbnailImageWidth = 20512_u32
  PropertyTagThumbnailImageHeight = 20513_u32
  PropertyTagThumbnailBitsPerSample = 20514_u32
  PropertyTagThumbnailCompression = 20515_u32
  PropertyTagThumbnailPhotometricInterp = 20516_u32
  PropertyTagThumbnailImageDescription = 20517_u32
  PropertyTagThumbnailEquipMake = 20518_u32
  PropertyTagThumbnailEquipModel = 20519_u32
  PropertyTagThumbnailStripOffsets = 20520_u32
  PropertyTagThumbnailOrientation = 20521_u32
  PropertyTagThumbnailSamplesPerPixel = 20522_u32
  PropertyTagThumbnailRowsPerStrip = 20523_u32
  PropertyTagThumbnailStripBytesCount = 20524_u32
  PropertyTagThumbnailResolutionX = 20525_u32
  PropertyTagThumbnailResolutionY = 20526_u32
  PropertyTagThumbnailPlanarConfig = 20527_u32
  PropertyTagThumbnailResolutionUnit = 20528_u32
  PropertyTagThumbnailTransferFunction = 20529_u32
  PropertyTagThumbnailSoftwareUsed = 20530_u32
  PropertyTagThumbnailDateTime = 20531_u32
  PropertyTagThumbnailArtist = 20532_u32
  PropertyTagThumbnailWhitePoint = 20533_u32
  PropertyTagThumbnailPrimaryChromaticities = 20534_u32
  PropertyTagThumbnailYCbCrCoefficients = 20535_u32
  PropertyTagThumbnailYCbCrSubsampling = 20536_u32
  PropertyTagThumbnailYCbCrPositioning = 20537_u32
  PropertyTagThumbnailRefBlackWhite = 20538_u32
  PropertyTagThumbnailCopyRight = 20539_u32
  PropertyTagLuminanceTable = 20624_u32
  PropertyTagChrominanceTable = 20625_u32
  PropertyTagFrameDelay = 20736_u32
  PropertyTagLoopCount = 20737_u32
  PropertyTagGlobalPalette = 20738_u32
  PropertyTagIndexBackground = 20739_u32
  PropertyTagIndexTransparent = 20740_u32
  PropertyTagPixelUnit = 20752_u32
  PropertyTagPixelPerUnitX = 20753_u32
  PropertyTagPixelPerUnitY = 20754_u32
  PropertyTagPaletteHistogram = 20755_u32
  PropertyTagExifExposureTime = 33434_u32
  PropertyTagExifFNumber = 33437_u32
  PropertyTagExifExposureProg = 34850_u32
  PropertyTagExifSpectralSense = 34852_u32
  PropertyTagExifISOSpeed = 34855_u32
  PropertyTagExifOECF = 34856_u32
  PropertyTagExifVer = 36864_u32
  PropertyTagExifDTOrig = 36867_u32
  PropertyTagExifDTDigitized = 36868_u32
  PropertyTagExifCompConfig = 37121_u32
  PropertyTagExifCompBPP = 37122_u32
  PropertyTagExifShutterSpeed = 37377_u32
  PropertyTagExifAperture = 37378_u32
  PropertyTagExifBrightness = 37379_u32
  PropertyTagExifExposureBias = 37380_u32
  PropertyTagExifMaxAperture = 37381_u32
  PropertyTagExifSubjectDist = 37382_u32
  PropertyTagExifMeteringMode = 37383_u32
  PropertyTagExifLightSource = 37384_u32
  PropertyTagExifFlash = 37385_u32
  PropertyTagExifFocalLength = 37386_u32
  PropertyTagExifSubjectArea = 37396_u32
  PropertyTagExifMakerNote = 37500_u32
  PropertyTagExifUserComment = 37510_u32
  PropertyTagExifDTSubsec = 37520_u32
  PropertyTagExifDTOrigSS = 37521_u32
  PropertyTagExifDTDigSS = 37522_u32
  PropertyTagExifFPXVer = 40960_u32
  PropertyTagExifColorSpace = 40961_u32
  PropertyTagExifPixXDim = 40962_u32
  PropertyTagExifPixYDim = 40963_u32
  PropertyTagExifRelatedWav = 40964_u32
  PropertyTagExifInterop = 40965_u32
  PropertyTagExifFlashEnergy = 41483_u32
  PropertyTagExifSpatialFR = 41484_u32
  PropertyTagExifFocalXRes = 41486_u32
  PropertyTagExifFocalYRes = 41487_u32
  PropertyTagExifFocalResUnit = 41488_u32
  PropertyTagExifSubjectLoc = 41492_u32
  PropertyTagExifExposureIndex = 41493_u32
  PropertyTagExifSensingMethod = 41495_u32
  PropertyTagExifFileSource = 41728_u32
  PropertyTagExifSceneType = 41729_u32
  PropertyTagExifCfaPattern = 41730_u32
  PropertyTagExifCustomRendered = 41985_u32
  PropertyTagExifExposureMode = 41986_u32
  PropertyTagExifWhiteBalance = 41987_u32
  PropertyTagExifDigitalZoomRatio = 41988_u32
  PropertyTagExifFocalLengthIn35mmFilm = 41989_u32
  PropertyTagExifSceneCaptureType = 41990_u32
  PropertyTagExifGainControl = 41991_u32
  PropertyTagExifContrast = 41992_u32
  PropertyTagExifSaturation = 41993_u32
  PropertyTagExifSharpness = 41994_u32
  PropertyTagExifDeviceSettingDesc = 41995_u32
  PropertyTagExifSubjectDistanceRange = 41996_u32
  PropertyTagExifUniqueImageID = 42016_u32
  PropertyTagGpsVer = 0_u32
  PropertyTagGpsLatitudeRef = 1_u32
  PropertyTagGpsLatitude = 2_u32
  PropertyTagGpsLongitudeRef = 3_u32
  PropertyTagGpsLongitude = 4_u32
  PropertyTagGpsAltitudeRef = 5_u32
  PropertyTagGpsAltitude = 6_u32
  PropertyTagGpsGpsTime = 7_u32
  PropertyTagGpsGpsSatellites = 8_u32
  PropertyTagGpsGpsStatus = 9_u32
  PropertyTagGpsGpsMeasureMode = 10_u32
  PropertyTagGpsGpsDop = 11_u32
  PropertyTagGpsSpeedRef = 12_u32
  PropertyTagGpsSpeed = 13_u32
  PropertyTagGpsTrackRef = 14_u32
  PropertyTagGpsTrack = 15_u32
  PropertyTagGpsImgDirRef = 16_u32
  PropertyTagGpsImgDir = 17_u32
  PropertyTagGpsMapDatum = 18_u32
  PropertyTagGpsDestLatRef = 19_u32
  PropertyTagGpsDestLat = 20_u32
  PropertyTagGpsDestLongRef = 21_u32
  PropertyTagGpsDestLong = 22_u32
  PropertyTagGpsDestBearRef = 23_u32
  PropertyTagGpsDestBear = 24_u32
  PropertyTagGpsDestDistRef = 25_u32
  PropertyTagGpsDestDist = 26_u32
  PropertyTagGpsProcessingMethod = 27_u32
  PropertyTagGpsAreaInformation = 28_u32
  PropertyTagGpsDate = 29_u32
  PropertyTagGpsDifferential = 30_u32
  GDIP_EMFPLUSFLAGS_DISPLAY = 1_u32
  ALPHA_SHIFT = 24_u32
  RED_SHIFT = 16_u32
  GREEN_SHIFT = 8_u32
  BLUE_SHIFT = 0_u32
  PixelFormatIndexed = 65536_u32
  PixelFormatGDI = 131072_u32
  PixelFormatAlpha = 262144_u32
  PixelFormatPAlpha = 524288_u32
  PixelFormatExtended = 1048576_u32
  PixelFormatCanonical = 2097152_u32
  PixelFormatUndefined = 0_u32
  PixelFormatDontCare = 0_u32
  PixelFormatMax = 16_u32
  FlatnessDefault = 0.25
  BlurEffectGuid = LibC::GUID.new(0x633c80a4_u32, 0x1843_u16, 0x482b_u16, StaticArray[0x9e_u8, 0xf2_u8, 0xbe_u8, 0x28_u8, 0x34_u8, 0xc5_u8, 0xfd_u8, 0xd4_u8])
  SharpenEffectGuid = LibC::GUID.new(0x63cbf3ee_u32, 0xc526_u16, 0x402c_u16, StaticArray[0x8f_u8, 0x71_u8, 0x62_u8, 0xc5_u8, 0x40_u8, 0xbf_u8, 0x51_u8, 0x42_u8])
  ColorMatrixEffectGuid = LibC::GUID.new(0x718f2615_u32, 0x7933_u16, 0x40e3_u16, StaticArray[0xa5_u8, 0x11_u8, 0x5f_u8, 0x68_u8, 0xfe_u8, 0x14_u8, 0xdd_u8, 0x74_u8])
  ColorLUTEffectGuid = LibC::GUID.new(0xa7ce72a9_u32, 0xf7f_u16, 0x40d7_u16, StaticArray[0xb3_u8, 0xcc_u8, 0xd0_u8, 0xc0_u8, 0x2d_u8, 0x5c_u8, 0x32_u8, 0x12_u8])
  BrightnessContrastEffectGuid = LibC::GUID.new(0xd3a1dbe1_u32, 0x8ec4_u16, 0x4c17_u16, StaticArray[0x9f_u8, 0x4c_u8, 0xea_u8, 0x97_u8, 0xad_u8, 0x1c_u8, 0x34_u8, 0x3d_u8])
  HueSaturationLightnessEffectGuid = LibC::GUID.new(0x8b2dd6c3_u32, 0xeb07_u16, 0x4d87_u16, StaticArray[0xa5_u8, 0xf0_u8, 0x71_u8, 0x8_u8, 0xe2_u8, 0x6a_u8, 0x9c_u8, 0x5f_u8])
  LevelsEffectGuid = LibC::GUID.new(0x99c354ec_u32, 0x2a31_u16, 0x4f3a_u16, StaticArray[0x8c_u8, 0x34_u8, 0x17_u8, 0xa8_u8, 0x3_u8, 0xb3_u8, 0x3a_u8, 0x25_u8])
  TintEffectGuid = LibC::GUID.new(0x1077af00_u32, 0x2848_u16, 0x4441_u16, StaticArray[0x94_u8, 0x89_u8, 0x44_u8, 0xad_u8, 0x4c_u8, 0x2d_u8, 0x7a_u8, 0x2c_u8])
  ColorBalanceEffectGuid = LibC::GUID.new(0x537e597d_u32, 0x251e_u16, 0x48da_u16, StaticArray[0x96_u8, 0x64_u8, 0x29_u8, 0xca_u8, 0x49_u8, 0x6b_u8, 0x70_u8, 0xf8_u8])
  RedEyeCorrectionEffectGuid = LibC::GUID.new(0x74d29d05_u32, 0x69a4_u16, 0x4266_u16, StaticArray[0x95_u8, 0x49_u8, 0x3c_u8, 0xc5_u8, 0x28_u8, 0x36_u8, 0xb6_u8, 0x32_u8])
  ColorCurveEffectGuid = LibC::GUID.new(0xdd6a0022_u32, 0x58e4_u16, 0x4a67_u16, StaticArray[0x9d_u8, 0x9b_u8, 0xd4_u8, 0x8e_u8, 0xb8_u8, 0x81_u8, 0xa5_u8, 0x3d_u8])

  enum FillMode
    FillModeAlternate = 0_i32
    FillModeWinding = 1_i32
  end
  enum QualityMode
    QualityModeInvalid = -1_i32
    QualityModeDefault = 0_i32
    QualityModeLow = 1_i32
    QualityModeHigh = 2_i32
  end
  enum CompositingMode
    CompositingModeSourceOver = 0_i32
    CompositingModeSourceCopy = 1_i32
  end
  enum CompositingQuality
    CompositingQualityInvalid = -1_i32
    CompositingQualityDefault = 0_i32
    CompositingQualityHighSpeed = 1_i32
    CompositingQualityHighQuality = 2_i32
    CompositingQualityGammaCorrected = 3_i32
    CompositingQualityAssumeLinear = 4_i32
  end
  enum Unit
    UnitWorld = 0_i32
    UnitDisplay = 1_i32
    UnitPixel = 2_i32
    UnitPoint = 3_i32
    UnitInch = 4_i32
    UnitDocument = 5_i32
    UnitMillimeter = 6_i32
  end
  enum MetafileFrameUnit
    MetafileFrameUnitPixel = 2_i32
    MetafileFrameUnitPoint = 3_i32
    MetafileFrameUnitInch = 4_i32
    MetafileFrameUnitDocument = 5_i32
    MetafileFrameUnitMillimeter = 6_i32
    MetafileFrameUnitGdi = 7_i32
  end
  enum CoordinateSpace
    CoordinateSpaceWorld = 0_i32
    CoordinateSpacePage = 1_i32
    CoordinateSpaceDevice = 2_i32
  end
  enum WrapMode
    WrapModeTile = 0_i32
    WrapModeTileFlipX = 1_i32
    WrapModeTileFlipY = 2_i32
    WrapModeTileFlipXY = 3_i32
    WrapModeClamp = 4_i32
  end
  enum HatchStyle
    HatchStyleHorizontal = 0_i32
    HatchStyleVertical = 1_i32
    HatchStyleForwardDiagonal = 2_i32
    HatchStyleBackwardDiagonal = 3_i32
    HatchStyleCross = 4_i32
    HatchStyleDiagonalCross = 5_i32
    HatchStyle05Percent = 6_i32
    HatchStyle10Percent = 7_i32
    HatchStyle20Percent = 8_i32
    HatchStyle25Percent = 9_i32
    HatchStyle30Percent = 10_i32
    HatchStyle40Percent = 11_i32
    HatchStyle50Percent = 12_i32
    HatchStyle60Percent = 13_i32
    HatchStyle70Percent = 14_i32
    HatchStyle75Percent = 15_i32
    HatchStyle80Percent = 16_i32
    HatchStyle90Percent = 17_i32
    HatchStyleLightDownwardDiagonal = 18_i32
    HatchStyleLightUpwardDiagonal = 19_i32
    HatchStyleDarkDownwardDiagonal = 20_i32
    HatchStyleDarkUpwardDiagonal = 21_i32
    HatchStyleWideDownwardDiagonal = 22_i32
    HatchStyleWideUpwardDiagonal = 23_i32
    HatchStyleLightVertical = 24_i32
    HatchStyleLightHorizontal = 25_i32
    HatchStyleNarrowVertical = 26_i32
    HatchStyleNarrowHorizontal = 27_i32
    HatchStyleDarkVertical = 28_i32
    HatchStyleDarkHorizontal = 29_i32
    HatchStyleDashedDownwardDiagonal = 30_i32
    HatchStyleDashedUpwardDiagonal = 31_i32
    HatchStyleDashedHorizontal = 32_i32
    HatchStyleDashedVertical = 33_i32
    HatchStyleSmallConfetti = 34_i32
    HatchStyleLargeConfetti = 35_i32
    HatchStyleZigZag = 36_i32
    HatchStyleWave = 37_i32
    HatchStyleDiagonalBrick = 38_i32
    HatchStyleHorizontalBrick = 39_i32
    HatchStyleWeave = 40_i32
    HatchStylePlaid = 41_i32
    HatchStyleDivot = 42_i32
    HatchStyleDottedGrid = 43_i32
    HatchStyleDottedDiamond = 44_i32
    HatchStyleShingle = 45_i32
    HatchStyleTrellis = 46_i32
    HatchStyleSphere = 47_i32
    HatchStyleSmallGrid = 48_i32
    HatchStyleSmallCheckerBoard = 49_i32
    HatchStyleLargeCheckerBoard = 50_i32
    HatchStyleOutlinedDiamond = 51_i32
    HatchStyleSolidDiamond = 52_i32
    HatchStyleTotal = 53_i32
    HatchStyleLargeGrid = 4_i32
    HatchStyleMin = 0_i32
    HatchStyleMax = 52_i32
  end
  enum DashStyle
    DashStyleSolid = 0_i32
    DashStyleDash = 1_i32
    DashStyleDot = 2_i32
    DashStyleDashDot = 3_i32
    DashStyleDashDotDot = 4_i32
    DashStyleCustom = 5_i32
  end
  enum DashCap
    DashCapFlat = 0_i32
    DashCapRound = 2_i32
    DashCapTriangle = 3_i32
  end
  enum LineCap
    LineCapFlat = 0_i32
    LineCapSquare = 1_i32
    LineCapRound = 2_i32
    LineCapTriangle = 3_i32
    LineCapNoAnchor = 16_i32
    LineCapSquareAnchor = 17_i32
    LineCapRoundAnchor = 18_i32
    LineCapDiamondAnchor = 19_i32
    LineCapArrowAnchor = 20_i32
    LineCapCustom = 255_i32
    LineCapAnchorMask = 240_i32
  end
  enum CustomLineCapType
    CustomLineCapTypeDefault = 0_i32
    CustomLineCapTypeAdjustableArrow = 1_i32
  end
  enum LineJoin
    LineJoinMiter = 0_i32
    LineJoinBevel = 1_i32
    LineJoinRound = 2_i32
    LineJoinMiterClipped = 3_i32
  end
  enum PathPointType
    PathPointTypeStart = 0_i32
    PathPointTypeLine = 1_i32
    PathPointTypeBezier = 3_i32
    PathPointTypePathTypeMask = 7_i32
    PathPointTypeDashMode = 16_i32
    PathPointTypePathMarker = 32_i32
    PathPointTypeCloseSubpath = 128_i32
    PathPointTypeBezier3 = 3_i32
  end
  enum WarpMode
    WarpModePerspective = 0_i32
    WarpModeBilinear = 1_i32
  end
  enum LinearGradientMode
    LinearGradientModeHorizontal = 0_i32
    LinearGradientModeVertical = 1_i32
    LinearGradientModeForwardDiagonal = 2_i32
    LinearGradientModeBackwardDiagonal = 3_i32
  end
  enum CombineMode
    CombineModeReplace = 0_i32
    CombineModeIntersect = 1_i32
    CombineModeUnion = 2_i32
    CombineModeXor = 3_i32
    CombineModeExclude = 4_i32
    CombineModeComplement = 5_i32
  end
  enum ImageType
    ImageTypeUnknown = 0_i32
    ImageTypeBitmap = 1_i32
    ImageTypeMetafile = 2_i32
  end
  enum InterpolationMode
    InterpolationModeInvalid = -1_i32
    InterpolationModeDefault = 0_i32
    InterpolationModeLowQuality = 1_i32
    InterpolationModeHighQuality = 2_i32
    InterpolationModeBilinear = 3_i32
    InterpolationModeBicubic = 4_i32
    InterpolationModeNearestNeighbor = 5_i32
    InterpolationModeHighQualityBilinear = 6_i32
    InterpolationModeHighQualityBicubic = 7_i32
  end
  enum PenAlignment
    PenAlignmentCenter = 0_i32
    PenAlignmentInset = 1_i32
  end
  enum BrushType
    BrushTypeSolidColor = 0_i32
    BrushTypeHatchFill = 1_i32
    BrushTypeTextureFill = 2_i32
    BrushTypePathGradient = 3_i32
    BrushTypeLinearGradient = 4_i32
  end
  enum PenType
    PenTypeSolidColor = 0_i32
    PenTypeHatchFill = 1_i32
    PenTypeTextureFill = 2_i32
    PenTypePathGradient = 3_i32
    PenTypeLinearGradient = 4_i32
    PenTypeUnknown = -1_i32
  end
  enum MatrixOrder
    MatrixOrderPrepend = 0_i32
    MatrixOrderAppend = 1_i32
  end
  enum GenericFontFamily
    GenericFontFamilySerif = 0_i32
    GenericFontFamilySansSerif = 1_i32
    GenericFontFamilyMonospace = 2_i32
  end
  enum FontStyle
    FontStyleRegular = 0_i32
    FontStyleBold = 1_i32
    FontStyleItalic = 2_i32
    FontStyleBoldItalic = 3_i32
    FontStyleUnderline = 4_i32
    FontStyleStrikeout = 8_i32
  end
  enum SmoothingMode
    SmoothingModeInvalid = -1_i32
    SmoothingModeDefault = 0_i32
    SmoothingModeHighSpeed = 1_i32
    SmoothingModeHighQuality = 2_i32
    SmoothingModeNone = 3_i32
    SmoothingModeAntiAlias = 4_i32
    SmoothingModeAntiAlias8x4 = 4_i32
    SmoothingModeAntiAlias8x8 = 5_i32
  end
  enum PixelOffsetMode
    PixelOffsetModeInvalid = -1_i32
    PixelOffsetModeDefault = 0_i32
    PixelOffsetModeHighSpeed = 1_i32
    PixelOffsetModeHighQuality = 2_i32
    PixelOffsetModeNone = 3_i32
    PixelOffsetModeHalf = 4_i32
  end
  enum TextRenderingHint
    TextRenderingHintSystemDefault = 0_i32
    TextRenderingHintSingleBitPerPixelGridFit = 1_i32
    TextRenderingHintSingleBitPerPixel = 2_i32
    TextRenderingHintAntiAliasGridFit = 3_i32
    TextRenderingHintAntiAlias = 4_i32
    TextRenderingHintClearTypeGridFit = 5_i32
  end
  enum MetafileType
    MetafileTypeInvalid = 0_i32
    MetafileTypeWmf = 1_i32
    MetafileTypeWmfPlaceable = 2_i32
    MetafileTypeEmf = 3_i32
    MetafileTypeEmfPlusOnly = 4_i32
    MetafileTypeEmfPlusDual = 5_i32
  end
  enum EmfType
    EmfTypeEmfOnly = 3_i32
    EmfTypeEmfPlusOnly = 4_i32
    EmfTypeEmfPlusDual = 5_i32
  end
  enum ObjectType
    ObjectTypeInvalid = 0_i32
    ObjectTypeBrush = 1_i32
    ObjectTypePen = 2_i32
    ObjectTypePath = 3_i32
    ObjectTypeRegion = 4_i32
    ObjectTypeImage = 5_i32
    ObjectTypeFont = 6_i32
    ObjectTypeStringFormat = 7_i32
    ObjectTypeImageAttributes = 8_i32
    ObjectTypeCustomLineCap = 9_i32
    ObjectTypeGraphics = 10_i32
    ObjectTypeMax = 10_i32
    ObjectTypeMin = 1_i32
  end
  enum EmfPlusRecordType
    WmfRecordTypeSetBkColor = 66049_i32
    WmfRecordTypeSetBkMode = 65794_i32
    WmfRecordTypeSetMapMode = 65795_i32
    WmfRecordTypeSetROP2 = 65796_i32
    WmfRecordTypeSetRelAbs = 65797_i32
    WmfRecordTypeSetPolyFillMode = 65798_i32
    WmfRecordTypeSetStretchBltMode = 65799_i32
    WmfRecordTypeSetTextCharExtra = 65800_i32
    WmfRecordTypeSetTextColor = 66057_i32
    WmfRecordTypeSetTextJustification = 66058_i32
    WmfRecordTypeSetWindowOrg = 66059_i32
    WmfRecordTypeSetWindowExt = 66060_i32
    WmfRecordTypeSetViewportOrg = 66061_i32
    WmfRecordTypeSetViewportExt = 66062_i32
    WmfRecordTypeOffsetWindowOrg = 66063_i32
    WmfRecordTypeScaleWindowExt = 66576_i32
    WmfRecordTypeOffsetViewportOrg = 66065_i32
    WmfRecordTypeScaleViewportExt = 66578_i32
    WmfRecordTypeLineTo = 66067_i32
    WmfRecordTypeMoveTo = 66068_i32
    WmfRecordTypeExcludeClipRect = 66581_i32
    WmfRecordTypeIntersectClipRect = 66582_i32
    WmfRecordTypeArc = 67607_i32
    WmfRecordTypeEllipse = 66584_i32
    WmfRecordTypeFloodFill = 66585_i32
    WmfRecordTypePie = 67610_i32
    WmfRecordTypeRectangle = 66587_i32
    WmfRecordTypeRoundRect = 67100_i32
    WmfRecordTypePatBlt = 67101_i32
    WmfRecordTypeSaveDC = 65566_i32
    WmfRecordTypeSetPixel = 66591_i32
    WmfRecordTypeOffsetClipRgn = 66080_i32
    WmfRecordTypeTextOut = 66849_i32
    WmfRecordTypeBitBlt = 67874_i32
    WmfRecordTypeStretchBlt = 68387_i32
    WmfRecordTypePolygon = 66340_i32
    WmfRecordTypePolyline = 66341_i32
    WmfRecordTypeEscape = 67110_i32
    WmfRecordTypeRestoreDC = 65831_i32
    WmfRecordTypeFillRegion = 66088_i32
    WmfRecordTypeFrameRegion = 66601_i32
    WmfRecordTypeInvertRegion = 65834_i32
    WmfRecordTypePaintRegion = 65835_i32
    WmfRecordTypeSelectClipRegion = 65836_i32
    WmfRecordTypeSelectObject = 65837_i32
    WmfRecordTypeSetTextAlign = 65838_i32
    WmfRecordTypeDrawText = 67119_i32
    WmfRecordTypeChord = 67632_i32
    WmfRecordTypeSetMapperFlags = 66097_i32
    WmfRecordTypeExtTextOut = 68146_i32
    WmfRecordTypeSetDIBToDev = 68915_i32
    WmfRecordTypeSelectPalette = 66100_i32
    WmfRecordTypeRealizePalette = 65589_i32
    WmfRecordTypeAnimatePalette = 66614_i32
    WmfRecordTypeSetPalEntries = 65591_i32
    WmfRecordTypePolyPolygon = 66872_i32
    WmfRecordTypeResizePalette = 65849_i32
    WmfRecordTypeDIBBitBlt = 67904_i32
    WmfRecordTypeDIBStretchBlt = 68417_i32
    WmfRecordTypeDIBCreatePatternBrush = 65858_i32
    WmfRecordTypeStretchDIB = 69443_i32
    WmfRecordTypeExtFloodFill = 66888_i32
    WmfRecordTypeSetLayout = 65865_i32
    WmfRecordTypeResetDC = 65868_i32
    WmfRecordTypeStartDoc = 65869_i32
    WmfRecordTypeStartPage = 65615_i32
    WmfRecordTypeEndPage = 65616_i32
    WmfRecordTypeAbortDoc = 65618_i32
    WmfRecordTypeEndDoc = 65630_i32
    WmfRecordTypeDeleteObject = 66032_i32
    WmfRecordTypeCreatePalette = 65783_i32
    WmfRecordTypeCreateBrush = 65784_i32
    WmfRecordTypeCreatePatternBrush = 66041_i32
    WmfRecordTypeCreatePenIndirect = 66298_i32
    WmfRecordTypeCreateFontIndirect = 66299_i32
    WmfRecordTypeCreateBrushIndirect = 66300_i32
    WmfRecordTypeCreateBitmapIndirect = 66301_i32
    WmfRecordTypeCreateBitmap = 67326_i32
    WmfRecordTypeCreateRegion = 67327_i32
    EmfRecordTypeHeader = 1_i32
    EmfRecordTypePolyBezier = 2_i32
    EmfRecordTypePolygon = 3_i32
    EmfRecordTypePolyline = 4_i32
    EmfRecordTypePolyBezierTo = 5_i32
    EmfRecordTypePolyLineTo = 6_i32
    EmfRecordTypePolyPolyline = 7_i32
    EmfRecordTypePolyPolygon = 8_i32
    EmfRecordTypeSetWindowExtEx = 9_i32
    EmfRecordTypeSetWindowOrgEx = 10_i32
    EmfRecordTypeSetViewportExtEx = 11_i32
    EmfRecordTypeSetViewportOrgEx = 12_i32
    EmfRecordTypeSetBrushOrgEx = 13_i32
    EmfRecordTypeEOF = 14_i32
    EmfRecordTypeSetPixelV = 15_i32
    EmfRecordTypeSetMapperFlags = 16_i32
    EmfRecordTypeSetMapMode = 17_i32
    EmfRecordTypeSetBkMode = 18_i32
    EmfRecordTypeSetPolyFillMode = 19_i32
    EmfRecordTypeSetROP2 = 20_i32
    EmfRecordTypeSetStretchBltMode = 21_i32
    EmfRecordTypeSetTextAlign = 22_i32
    EmfRecordTypeSetColorAdjustment = 23_i32
    EmfRecordTypeSetTextColor = 24_i32
    EmfRecordTypeSetBkColor = 25_i32
    EmfRecordTypeOffsetClipRgn = 26_i32
    EmfRecordTypeMoveToEx = 27_i32
    EmfRecordTypeSetMetaRgn = 28_i32
    EmfRecordTypeExcludeClipRect = 29_i32
    EmfRecordTypeIntersectClipRect = 30_i32
    EmfRecordTypeScaleViewportExtEx = 31_i32
    EmfRecordTypeScaleWindowExtEx = 32_i32
    EmfRecordTypeSaveDC = 33_i32
    EmfRecordTypeRestoreDC = 34_i32
    EmfRecordTypeSetWorldTransform = 35_i32
    EmfRecordTypeModifyWorldTransform = 36_i32
    EmfRecordTypeSelectObject = 37_i32
    EmfRecordTypeCreatePen = 38_i32
    EmfRecordTypeCreateBrushIndirect = 39_i32
    EmfRecordTypeDeleteObject = 40_i32
    EmfRecordTypeAngleArc = 41_i32
    EmfRecordTypeEllipse = 42_i32
    EmfRecordTypeRectangle = 43_i32
    EmfRecordTypeRoundRect = 44_i32
    EmfRecordTypeArc = 45_i32
    EmfRecordTypeChord = 46_i32
    EmfRecordTypePie = 47_i32
    EmfRecordTypeSelectPalette = 48_i32
    EmfRecordTypeCreatePalette = 49_i32
    EmfRecordTypeSetPaletteEntries = 50_i32
    EmfRecordTypeResizePalette = 51_i32
    EmfRecordTypeRealizePalette = 52_i32
    EmfRecordTypeExtFloodFill = 53_i32
    EmfRecordTypeLineTo = 54_i32
    EmfRecordTypeArcTo = 55_i32
    EmfRecordTypePolyDraw = 56_i32
    EmfRecordTypeSetArcDirection = 57_i32
    EmfRecordTypeSetMiterLimit = 58_i32
    EmfRecordTypeBeginPath = 59_i32
    EmfRecordTypeEndPath = 60_i32
    EmfRecordTypeCloseFigure = 61_i32
    EmfRecordTypeFillPath = 62_i32
    EmfRecordTypeStrokeAndFillPath = 63_i32
    EmfRecordTypeStrokePath = 64_i32
    EmfRecordTypeFlattenPath = 65_i32
    EmfRecordTypeWidenPath = 66_i32
    EmfRecordTypeSelectClipPath = 67_i32
    EmfRecordTypeAbortPath = 68_i32
    EmfRecordTypeReserved_069 = 69_i32
    EmfRecordTypeGdiComment = 70_i32
    EmfRecordTypeFillRgn = 71_i32
    EmfRecordTypeFrameRgn = 72_i32
    EmfRecordTypeInvertRgn = 73_i32
    EmfRecordTypePaintRgn = 74_i32
    EmfRecordTypeExtSelectClipRgn = 75_i32
    EmfRecordTypeBitBlt = 76_i32
    EmfRecordTypeStretchBlt = 77_i32
    EmfRecordTypeMaskBlt = 78_i32
    EmfRecordTypePlgBlt = 79_i32
    EmfRecordTypeSetDIBitsToDevice = 80_i32
    EmfRecordTypeStretchDIBits = 81_i32
    EmfRecordTypeExtCreateFontIndirect = 82_i32
    EmfRecordTypeExtTextOutA = 83_i32
    EmfRecordTypeExtTextOutW = 84_i32
    EmfRecordTypePolyBezier16 = 85_i32
    EmfRecordTypePolygon16 = 86_i32
    EmfRecordTypePolyline16 = 87_i32
    EmfRecordTypePolyBezierTo16 = 88_i32
    EmfRecordTypePolylineTo16 = 89_i32
    EmfRecordTypePolyPolyline16 = 90_i32
    EmfRecordTypePolyPolygon16 = 91_i32
    EmfRecordTypePolyDraw16 = 92_i32
    EmfRecordTypeCreateMonoBrush = 93_i32
    EmfRecordTypeCreateDIBPatternBrushPt = 94_i32
    EmfRecordTypeExtCreatePen = 95_i32
    EmfRecordTypePolyTextOutA = 96_i32
    EmfRecordTypePolyTextOutW = 97_i32
    EmfRecordTypeSetICMMode = 98_i32
    EmfRecordTypeCreateColorSpace = 99_i32
    EmfRecordTypeSetColorSpace = 100_i32
    EmfRecordTypeDeleteColorSpace = 101_i32
    EmfRecordTypeGLSRecord = 102_i32
    EmfRecordTypeGLSBoundedRecord = 103_i32
    EmfRecordTypePixelFormat = 104_i32
    EmfRecordTypeDrawEscape = 105_i32
    EmfRecordTypeExtEscape = 106_i32
    EmfRecordTypeStartDoc = 107_i32
    EmfRecordTypeSmallTextOut = 108_i32
    EmfRecordTypeForceUFIMapping = 109_i32
    EmfRecordTypeNamedEscape = 110_i32
    EmfRecordTypeColorCorrectPalette = 111_i32
    EmfRecordTypeSetICMProfileA = 112_i32
    EmfRecordTypeSetICMProfileW = 113_i32
    EmfRecordTypeAlphaBlend = 114_i32
    EmfRecordTypeSetLayout = 115_i32
    EmfRecordTypeTransparentBlt = 116_i32
    EmfRecordTypeReserved_117 = 117_i32
    EmfRecordTypeGradientFill = 118_i32
    EmfRecordTypeSetLinkedUFIs = 119_i32
    EmfRecordTypeSetTextJustification = 120_i32
    EmfRecordTypeColorMatchToTargetW = 121_i32
    EmfRecordTypeCreateColorSpaceW = 122_i32
    EmfRecordTypeMax = 122_i32
    EmfRecordTypeMin = 1_i32
    EmfPlusRecordTypeInvalid = 16384_i32
    EmfPlusRecordTypeHeader = 16385_i32
    EmfPlusRecordTypeEndOfFile = 16386_i32
    EmfPlusRecordTypeComment = 16387_i32
    EmfPlusRecordTypeGetDC = 16388_i32
    EmfPlusRecordTypeMultiFormatStart = 16389_i32
    EmfPlusRecordTypeMultiFormatSection = 16390_i32
    EmfPlusRecordTypeMultiFormatEnd = 16391_i32
    EmfPlusRecordTypeObject = 16392_i32
    EmfPlusRecordTypeClear = 16393_i32
    EmfPlusRecordTypeFillRects = 16394_i32
    EmfPlusRecordTypeDrawRects = 16395_i32
    EmfPlusRecordTypeFillPolygon = 16396_i32
    EmfPlusRecordTypeDrawLines = 16397_i32
    EmfPlusRecordTypeFillEllipse = 16398_i32
    EmfPlusRecordTypeDrawEllipse = 16399_i32
    EmfPlusRecordTypeFillPie = 16400_i32
    EmfPlusRecordTypeDrawPie = 16401_i32
    EmfPlusRecordTypeDrawArc = 16402_i32
    EmfPlusRecordTypeFillRegion = 16403_i32
    EmfPlusRecordTypeFillPath = 16404_i32
    EmfPlusRecordTypeDrawPath = 16405_i32
    EmfPlusRecordTypeFillClosedCurve = 16406_i32
    EmfPlusRecordTypeDrawClosedCurve = 16407_i32
    EmfPlusRecordTypeDrawCurve = 16408_i32
    EmfPlusRecordTypeDrawBeziers = 16409_i32
    EmfPlusRecordTypeDrawImage = 16410_i32
    EmfPlusRecordTypeDrawImagePoints = 16411_i32
    EmfPlusRecordTypeDrawString = 16412_i32
    EmfPlusRecordTypeSetRenderingOrigin = 16413_i32
    EmfPlusRecordTypeSetAntiAliasMode = 16414_i32
    EmfPlusRecordTypeSetTextRenderingHint = 16415_i32
    EmfPlusRecordTypeSetTextContrast = 16416_i32
    EmfPlusRecordTypeSetInterpolationMode = 16417_i32
    EmfPlusRecordTypeSetPixelOffsetMode = 16418_i32
    EmfPlusRecordTypeSetCompositingMode = 16419_i32
    EmfPlusRecordTypeSetCompositingQuality = 16420_i32
    EmfPlusRecordTypeSave = 16421_i32
    EmfPlusRecordTypeRestore = 16422_i32
    EmfPlusRecordTypeBeginContainer = 16423_i32
    EmfPlusRecordTypeBeginContainerNoParams = 16424_i32
    EmfPlusRecordTypeEndContainer = 16425_i32
    EmfPlusRecordTypeSetWorldTransform = 16426_i32
    EmfPlusRecordTypeResetWorldTransform = 16427_i32
    EmfPlusRecordTypeMultiplyWorldTransform = 16428_i32
    EmfPlusRecordTypeTranslateWorldTransform = 16429_i32
    EmfPlusRecordTypeScaleWorldTransform = 16430_i32
    EmfPlusRecordTypeRotateWorldTransform = 16431_i32
    EmfPlusRecordTypeSetPageTransform = 16432_i32
    EmfPlusRecordTypeResetClip = 16433_i32
    EmfPlusRecordTypeSetClipRect = 16434_i32
    EmfPlusRecordTypeSetClipPath = 16435_i32
    EmfPlusRecordTypeSetClipRegion = 16436_i32
    EmfPlusRecordTypeOffsetClip = 16437_i32
    EmfPlusRecordTypeDrawDriverString = 16438_i32
    EmfPlusRecordTypeStrokeFillPath = 16439_i32
    EmfPlusRecordTypeSerializableObject = 16440_i32
    EmfPlusRecordTypeSetTSGraphics = 16441_i32
    EmfPlusRecordTypeSetTSClip = 16442_i32
    EmfPlusRecordTotal = 16443_i32
    EmfPlusRecordTypeMax = 16442_i32
    EmfPlusRecordTypeMin = 16385_i32
  end
  enum StringFormatFlags
    StringFormatFlagsDirectionRightToLeft = 1_i32
    StringFormatFlagsDirectionVertical = 2_i32
    StringFormatFlagsNoFitBlackBox = 4_i32
    StringFormatFlagsDisplayFormatControl = 32_i32
    StringFormatFlagsNoFontFallback = 1024_i32
    StringFormatFlagsMeasureTrailingSpaces = 2048_i32
    StringFormatFlagsNoWrap = 4096_i32
    StringFormatFlagsLineLimit = 8192_i32
    StringFormatFlagsNoClip = 16384_i32
    StringFormatFlagsBypassGDI = -2147483648_i32
  end
  enum StringTrimming
    StringTrimmingNone = 0_i32
    StringTrimmingCharacter = 1_i32
    StringTrimmingWord = 2_i32
    StringTrimmingEllipsisCharacter = 3_i32
    StringTrimmingEllipsisWord = 4_i32
    StringTrimmingEllipsisPath = 5_i32
  end
  enum StringDigitSubstitute
    StringDigitSubstituteUser = 0_i32
    StringDigitSubstituteNone = 1_i32
    StringDigitSubstituteNational = 2_i32
    StringDigitSubstituteTraditional = 3_i32
  end
  enum HotkeyPrefix
    HotkeyPrefixNone = 0_i32
    HotkeyPrefixShow = 1_i32
    HotkeyPrefixHide = 2_i32
  end
  enum StringAlignment
    StringAlignmentNear = 0_i32
    StringAlignmentCenter = 1_i32
    StringAlignmentFar = 2_i32
  end
  enum DriverStringOptions
    DriverStringOptionsCmapLookup = 1_i32
    DriverStringOptionsVertical = 2_i32
    DriverStringOptionsRealizedAdvance = 4_i32
    DriverStringOptionsLimitSubpixel = 8_i32
  end
  enum FlushIntention
    FlushIntentionFlush = 0_i32
    FlushIntentionSync = 1_i32
  end
  enum EncoderParameterValueType
    EncoderParameterValueTypeByte = 1_i32
    EncoderParameterValueTypeASCII = 2_i32
    EncoderParameterValueTypeShort = 3_i32
    EncoderParameterValueTypeLong = 4_i32
    EncoderParameterValueTypeRational = 5_i32
    EncoderParameterValueTypeLongRange = 6_i32
    EncoderParameterValueTypeUndefined = 7_i32
    EncoderParameterValueTypeRationalRange = 8_i32
    EncoderParameterValueTypePointer = 9_i32
  end
  enum EncoderValue
    EncoderValueColorTypeCMYK = 0_i32
    EncoderValueColorTypeYCCK = 1_i32
    EncoderValueCompressionLZW = 2_i32
    EncoderValueCompressionCCITT3 = 3_i32
    EncoderValueCompressionCCITT4 = 4_i32
    EncoderValueCompressionRle = 5_i32
    EncoderValueCompressionNone = 6_i32
    EncoderValueScanMethodInterlaced = 7_i32
    EncoderValueScanMethodNonInterlaced = 8_i32
    EncoderValueVersionGif87 = 9_i32
    EncoderValueVersionGif89 = 10_i32
    EncoderValueRenderProgressive = 11_i32
    EncoderValueRenderNonProgressive = 12_i32
    EncoderValueTransformRotate90 = 13_i32
    EncoderValueTransformRotate180 = 14_i32
    EncoderValueTransformRotate270 = 15_i32
    EncoderValueTransformFlipHorizontal = 16_i32
    EncoderValueTransformFlipVertical = 17_i32
    EncoderValueMultiFrame = 18_i32
    EncoderValueLastFrame = 19_i32
    EncoderValueFlush = 20_i32
    EncoderValueFrameDimensionTime = 21_i32
    EncoderValueFrameDimensionResolution = 22_i32
    EncoderValueFrameDimensionPage = 23_i32
    EncoderValueColorTypeGray = 24_i32
    EncoderValueColorTypeRGB = 25_i32
  end
  enum EmfToWmfBitsFlags
    EmfToWmfBitsFlagsDefault = 0_i32
    EmfToWmfBitsFlagsEmbedEmf = 1_i32
    EmfToWmfBitsFlagsIncludePlaceable = 2_i32
    EmfToWmfBitsFlagsNoXORClip = 4_i32
  end
  enum ConvertToEmfPlusFlags
    ConvertToEmfPlusFlagsDefault = 0_i32
    ConvertToEmfPlusFlagsRopUsed = 1_i32
    ConvertToEmfPlusFlagsText = 2_i32
    ConvertToEmfPlusFlagsInvalidRecord = 4_i32
  end
  enum GpTestControlEnum
    TestControlForceBilinear = 0_i32
    TestControlNoICM = 1_i32
    TestControlGetBuildNumber = 2_i32
  end
  enum Status
    Ok = 0_i32
    GenericError = 1_i32
    InvalidParameter = 2_i32
    OutOfMemory = 3_i32
    ObjectBusy = 4_i32
    InsufficientBuffer = 5_i32
    NotImplemented = 6_i32
    Win32Error = 7_i32
    WrongState = 8_i32
    Aborted = 9_i32
    FileNotFound = 10_i32
    ValueOverflow = 11_i32
    AccessDenied = 12_i32
    UnknownImageFormat = 13_i32
    FontFamilyNotFound = 14_i32
    FontStyleNotFound = 15_i32
    NotTrueTypeFont = 16_i32
    UnsupportedGdiplusVersion = 17_i32
    GdiplusNotInitialized = 18_i32
    PropertyNotFound = 19_i32
    PropertyNotSupported = 20_i32
    ProfileNotFound = 21_i32
  end
  enum DebugEventLevel
    DebugEventLevelFatal = 0_i32
    DebugEventLevelWarning = 1_i32
  end
  enum Version : UInt32
    V2 = 2_u32
    V3 = 3_u32
  end
  enum GdiplusStartupParams
    GdiplusStartupDefault = 0_i32
    GdiplusStartupNoSetRound = 1_i32
    GdiplusStartupSetPSValue = 2_i32
    GdiplusStartupReserved0 = 4_i32
    GdiplusStartupReserved1 = 8_i32
    GdiplusStartupReserved2 = 16_i32
    GdiplusStartupTransparencyMask = -16777216_i32
  end
  enum PaletteType
    PaletteTypeCustom = 0_i32
    PaletteTypeOptimal = 1_i32
    PaletteTypeFixedBW = 2_i32
    PaletteTypeFixedHalftone8 = 3_i32
    PaletteTypeFixedHalftone27 = 4_i32
    PaletteTypeFixedHalftone64 = 5_i32
    PaletteTypeFixedHalftone125 = 6_i32
    PaletteTypeFixedHalftone216 = 7_i32
    PaletteTypeFixedHalftone252 = 8_i32
    PaletteTypeFixedHalftone256 = 9_i32
  end
  enum DitherType
    DitherTypeNone = 0_i32
    DitherTypeSolid = 1_i32
    DitherTypeOrdered4x4 = 2_i32
    DitherTypeOrdered8x8 = 3_i32
    DitherTypeOrdered16x16 = 4_i32
    DitherTypeSpiral4x4 = 5_i32
    DitherTypeSpiral8x8 = 6_i32
    DitherTypeDualSpiral4x4 = 7_i32
    DitherTypeDualSpiral8x8 = 8_i32
    DitherTypeErrorDiffusion = 9_i32
    DitherTypeMax = 10_i32
  end
  enum PaletteFlags
    PaletteFlagsHasAlpha = 1_i32
    PaletteFlagsGrayScale = 2_i32
    PaletteFlagsHalftone = 4_i32
  end
  enum ColorMode
    ColorModeARGB32 = 0_i32
    ColorModeARGB64 = 1_i32
  end
  enum ColorChannelFlags
    ColorChannelFlagsC = 0_i32
    ColorChannelFlagsM = 1_i32
    ColorChannelFlagsY = 2_i32
    ColorChannelFlagsK = 3_i32
    ColorChannelFlagsLast = 4_i32
  end
  enum ImageCodecFlags
    ImageCodecFlagsEncoder = 1_i32
    ImageCodecFlagsDecoder = 2_i32
    ImageCodecFlagsSupportBitmap = 4_i32
    ImageCodecFlagsSupportVector = 8_i32
    ImageCodecFlagsSeekableEncode = 16_i32
    ImageCodecFlagsBlockingDecode = 32_i32
    ImageCodecFlagsBuiltin = 65536_i32
    ImageCodecFlagsSystem = 131072_i32
    ImageCodecFlagsUser = 262144_i32
  end
  enum ImageLockMode
    ImageLockModeRead = 1_i32
    ImageLockModeWrite = 2_i32
    ImageLockModeUserInputBuf = 4_i32
  end
  enum ImageFlags
    ImageFlagsNone = 0_i32
    ImageFlagsScalable = 1_i32
    ImageFlagsHasAlpha = 2_i32
    ImageFlagsHasTranslucent = 4_i32
    ImageFlagsPartiallyScalable = 8_i32
    ImageFlagsColorSpaceRGB = 16_i32
    ImageFlagsColorSpaceCMYK = 32_i32
    ImageFlagsColorSpaceGRAY = 64_i32
    ImageFlagsColorSpaceYCBCR = 128_i32
    ImageFlagsColorSpaceYCCK = 256_i32
    ImageFlagsHasRealDPI = 4096_i32
    ImageFlagsHasRealPixelSize = 8192_i32
    ImageFlagsReadOnly = 65536_i32
    ImageFlagsCaching = 131072_i32
  end
  enum RotateFlipType
    RotateNoneFlipNone = 0_i32
    Rotate90FlipNone = 1_i32
    Rotate180FlipNone = 2_i32
    Rotate270FlipNone = 3_i32
    RotateNoneFlipX = 4_i32
    Rotate90FlipX = 5_i32
    Rotate180FlipX = 6_i32
    Rotate270FlipX = 7_i32
    RotateNoneFlipY = 6_i32
    Rotate90FlipY = 7_i32
    Rotate180FlipY = 4_i32
    Rotate270FlipY = 5_i32
    RotateNoneFlipXY = 2_i32
    Rotate90FlipXY = 3_i32
    Rotate180FlipXY = 0_i32
    Rotate270FlipXY = 1_i32
  end
  enum ItemDataPosition
    ItemDataPositionAfterHeader = 0_i32
    ItemDataPositionAfterPalette = 1_i32
    ItemDataPositionAfterBits = 2_i32
  end
  enum HistogramFormat
    HistogramFormatARGB = 0_i32
    HistogramFormatPARGB = 1_i32
    HistogramFormatRGB = 2_i32
    HistogramFormatGray = 3_i32
    HistogramFormatB = 4_i32
    HistogramFormatG = 5_i32
    HistogramFormatR = 6_i32
    HistogramFormatA = 7_i32
  end
  enum ColorMatrixFlags
    ColorMatrixFlagsDefault = 0_i32
    ColorMatrixFlagsSkipGrays = 1_i32
    ColorMatrixFlagsAltGray = 2_i32
  end
  enum ColorAdjustType
    ColorAdjustTypeDefault = 0_i32
    ColorAdjustTypeBitmap = 1_i32
    ColorAdjustTypeBrush = 2_i32
    ColorAdjustTypePen = 3_i32
    ColorAdjustTypeText = 4_i32
    ColorAdjustTypeCount = 5_i32
    ColorAdjustTypeAny = 6_i32
  end
  enum CurveAdjustments
    AdjustExposure = 0_i32
    AdjustDensity = 1_i32
    AdjustContrast = 2_i32
    AdjustHighlight = 3_i32
    AdjustShadow = 4_i32
    AdjustMidtone = 5_i32
    AdjustWhiteSaturation = 6_i32
    AdjustBlackSaturation = 7_i32
  end
  enum CurveChannel
    CurveChannelAll = 0_i32
    CurveChannelRed = 1_i32
    CurveChannelGreen = 2_i32
    CurveChannelBlue = 3_i32
  end

  alias GpGraphics = Void

  alias GpBrush = Void

  alias GpTexture = Void

  alias GpSolidFill = Void

  alias GpLineGradient = Void

  alias GpPathGradient = Void

  alias GpHatch = Void

  alias GpPen = Void

  alias GpCustomLineCap = Void

  alias GpAdjustableArrowCap = Void

  alias GpImage = Void

  alias GpBitmap = Void

  alias GpMetafile = Void

  alias GpImageAttributes = Void

  alias GpPath = Void

  alias GpRegion = Void

  alias GpPathIterator = Void

  alias GpFontFamily = Void

  alias GpFont = Void

  alias GpStringFormat = Void

  alias GpFontCollection = Void

  alias GpInstalledFontCollection = Void

  alias GpPrivateFontCollection = Void

  alias GpCachedBitmap = Void

  @[Extern]
  struct SizeF
    property width : Float32
    property height : Float32
    def initialize(@width : Float32, @height : Float32)
    end
  end

  @[Extern]
  struct Size
    property width : Int32
    property height : Int32
    def initialize(@width : Int32, @height : Int32)
    end
  end

  @[Extern]
  struct PointF
    property x : Float32
    property y : Float32
    def initialize(@x : Float32, @y : Float32)
    end
  end

  @[Extern]
  struct Point
    property x : Int32
    property y : Int32
    def initialize(@x : Int32, @y : Int32)
    end
  end

  @[Extern]
  struct RectF
    property x : Float32
    property y : Float32
    property width : Float32
    property height : Float32
    def initialize(@x : Float32, @y : Float32, @width : Float32, @height : Float32)
    end
  end

  @[Extern]
  struct Rect
    property x : Int32
    property y : Int32
    property width : Int32
    property height : Int32
    def initialize(@x : Int32, @y : Int32, @width : Int32, @height : Int32)
    end
  end

  @[Extern]
  struct CharacterRange
    property first : Int32
    property length : Int32
    def initialize(@first : Int32, @length : Int32)
    end
  end

  @[Extern]
  struct GdiplusStartupInput
    property gdiplus_version : UInt32
    property debug_event_callback : LibC::IntPtrT
    property suppress_background_thread : Win32cr::Foundation::BOOL
    property suppress_external_codecs : Win32cr::Foundation::BOOL
    def initialize(@gdiplus_version : UInt32, @debug_event_callback : LibC::IntPtrT, @suppress_background_thread : Win32cr::Foundation::BOOL, @suppress_external_codecs : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct GdiplusStartupInputEx
    property base : Win32cr::Graphics::GdiPlus::GdiplusStartupInput
    property startup_parameters : Int32

    # Nested Type Version
    @[Extern]
    struct Version
    property value__ : UInt32
    property v2 : Win32cr::Graphics::GdiPlus::Version
    property v3 : Win32cr::Graphics::GdiPlus::Version
    def initialize(@value__ : UInt32, @v2 : Win32cr::Graphics::GdiPlus::Version, @v3 : Win32cr::Graphics::GdiPlus::Version)
    end
    end

    def initialize(@base : Win32cr::Graphics::GdiPlus::GdiplusStartupInput, @startup_parameters : Int32)
    end
  end

  @[Extern]
  struct GdiplusStartupOutput
    property notification_hook : LibC::IntPtrT
    property notification_unhook : LibC::IntPtrT
    def initialize(@notification_hook : LibC::IntPtrT, @notification_unhook : LibC::IntPtrT)
    end
  end

  @[Extern]
  struct ColorPalette
    property flags : UInt32
    property count : UInt32
    property entries : UInt32[1]
    def initialize(@flags : UInt32, @count : UInt32, @entries : UInt32[1])
    end
  end

  @[Extern]
  struct Color
    property argb : UInt32
    property alice_blue : Int32
    property antique_white : Int32
    property aqua : Int32
    property aquamarine : Int32
    property azure : Int32
    property beige : Int32
    property bisque : Int32
    property black : Int32
    property blanched_almond : Int32
    property blue : Int32
    property blue_violet : Int32
    property brown : Int32
    property burly_wood : Int32
    property cadet_blue : Int32
    property chartreuse : Int32
    property chocolate : Int32
    property coral : Int32
    property cornflower_blue : Int32
    property cornsilk : Int32
    property crimson : Int32
    property cyan : Int32
    property dark_blue : Int32
    property dark_cyan : Int32
    property dark_goldenrod : Int32
    property dark_gray : Int32
    property dark_green : Int32
    property dark_khaki : Int32
    property dark_magenta : Int32
    property dark_olive_green : Int32
    property dark_orange : Int32
    property dark_orchid : Int32
    property dark_red : Int32
    property dark_salmon : Int32
    property dark_sea_green : Int32
    property dark_slate_blue : Int32
    property dark_slate_gray : Int32
    property dark_turquoise : Int32
    property dark_violet : Int32
    property deep_pink : Int32
    property deep_sky_blue : Int32
    property dim_gray : Int32
    property dodger_blue : Int32
    property firebrick : Int32
    property floral_white : Int32
    property forest_green : Int32
    property fuchsia : Int32
    property gainsboro : Int32
    property ghost_white : Int32
    property gold : Int32
    property goldenrod : Int32
    property gray : Int32
    property green : Int32
    property green_yellow : Int32
    property honeydew : Int32
    property hot_pink : Int32
    property indian_red : Int32
    property indigo : Int32
    property ivory : Int32
    property khaki : Int32
    property lavender : Int32
    property lavender_blush : Int32
    property lawn_green : Int32
    property lemon_chiffon : Int32
    property light_blue : Int32
    property light_coral : Int32
    property light_cyan : Int32
    property light_goldenrod_yellow : Int32
    property light_gray : Int32
    property light_green : Int32
    property light_pink : Int32
    property light_salmon : Int32
    property light_sea_green : Int32
    property light_sky_blue : Int32
    property light_slate_gray : Int32
    property light_steel_blue : Int32
    property light_yellow : Int32
    property lime : Int32
    property lime_green : Int32
    property linen : Int32
    property magenta : Int32
    property maroon : Int32
    property medium_aquamarine : Int32
    property medium_blue : Int32
    property medium_orchid : Int32
    property medium_purple : Int32
    property medium_sea_green : Int32
    property medium_slate_blue : Int32
    property medium_spring_green : Int32
    property medium_turquoise : Int32
    property medium_violet_red : Int32
    property midnight_blue : Int32
    property mint_cream : Int32
    property misty_rose : Int32
    property moccasin : Int32
    property navajo_white : Int32
    property navy : Int32
    property old_lace : Int32
    property olive : Int32
    property olive_drab : Int32
    property orange : Int32
    property orange_red : Int32
    property orchid : Int32
    property pale_goldenrod : Int32
    property pale_green : Int32
    property pale_turquoise : Int32
    property pale_violet_red : Int32
    property papaya_whip : Int32
    property peach_puff : Int32
    property peru : Int32
    property pink : Int32
    property plum : Int32
    property powder_blue : Int32
    property purple : Int32
    property red : Int32
    property rosy_brown : Int32
    property royal_blue : Int32
    property saddle_brown : Int32
    property salmon : Int32
    property sandy_brown : Int32
    property sea_green : Int32
    property sea_shell : Int32
    property sienna : Int32
    property silver : Int32
    property sky_blue : Int32
    property slate_blue : Int32
    property slate_gray : Int32
    property snow : Int32
    property spring_green : Int32
    property steel_blue : Int32
    property tan : Int32
    property teal : Int32
    property thistle : Int32
    property tomato : Int32
    property transparent : Int32
    property turquoise : Int32
    property violet : Int32
    property wheat : Int32
    property white : Int32
    property white_smoke : Int32
    property yellow : Int32
    property yellow_green : Int32
    property alpha_shift : Int32
    property red_shift : Int32
    property green_shift : Int32
    property blue_shift : Int32
    property alpha_mask : Int32
    property red_mask : Int32
    property green_mask : Int32
    property blue_mask : Int32
    def initialize(@argb : UInt32, @alice_blue : Int32, @antique_white : Int32, @aqua : Int32, @aquamarine : Int32, @azure : Int32, @beige : Int32, @bisque : Int32, @black : Int32, @blanched_almond : Int32, @blue : Int32, @blue_violet : Int32, @brown : Int32, @burly_wood : Int32, @cadet_blue : Int32, @chartreuse : Int32, @chocolate : Int32, @coral : Int32, @cornflower_blue : Int32, @cornsilk : Int32, @crimson : Int32, @cyan : Int32, @dark_blue : Int32, @dark_cyan : Int32, @dark_goldenrod : Int32, @dark_gray : Int32, @dark_green : Int32, @dark_khaki : Int32, @dark_magenta : Int32, @dark_olive_green : Int32, @dark_orange : Int32, @dark_orchid : Int32, @dark_red : Int32, @dark_salmon : Int32, @dark_sea_green : Int32, @dark_slate_blue : Int32, @dark_slate_gray : Int32, @dark_turquoise : Int32, @dark_violet : Int32, @deep_pink : Int32, @deep_sky_blue : Int32, @dim_gray : Int32, @dodger_blue : Int32, @firebrick : Int32, @floral_white : Int32, @forest_green : Int32, @fuchsia : Int32, @gainsboro : Int32, @ghost_white : Int32, @gold : Int32, @goldenrod : Int32, @gray : Int32, @green : Int32, @green_yellow : Int32, @honeydew : Int32, @hot_pink : Int32, @indian_red : Int32, @indigo : Int32, @ivory : Int32, @khaki : Int32, @lavender : Int32, @lavender_blush : Int32, @lawn_green : Int32, @lemon_chiffon : Int32, @light_blue : Int32, @light_coral : Int32, @light_cyan : Int32, @light_goldenrod_yellow : Int32, @light_gray : Int32, @light_green : Int32, @light_pink : Int32, @light_salmon : Int32, @light_sea_green : Int32, @light_sky_blue : Int32, @light_slate_gray : Int32, @light_steel_blue : Int32, @light_yellow : Int32, @lime : Int32, @lime_green : Int32, @linen : Int32, @magenta : Int32, @maroon : Int32, @medium_aquamarine : Int32, @medium_blue : Int32, @medium_orchid : Int32, @medium_purple : Int32, @medium_sea_green : Int32, @medium_slate_blue : Int32, @medium_spring_green : Int32, @medium_turquoise : Int32, @medium_violet_red : Int32, @midnight_blue : Int32, @mint_cream : Int32, @misty_rose : Int32, @moccasin : Int32, @navajo_white : Int32, @navy : Int32, @old_lace : Int32, @olive : Int32, @olive_drab : Int32, @orange : Int32, @orange_red : Int32, @orchid : Int32, @pale_goldenrod : Int32, @pale_green : Int32, @pale_turquoise : Int32, @pale_violet_red : Int32, @papaya_whip : Int32, @peach_puff : Int32, @peru : Int32, @pink : Int32, @plum : Int32, @powder_blue : Int32, @purple : Int32, @red : Int32, @rosy_brown : Int32, @royal_blue : Int32, @saddle_brown : Int32, @salmon : Int32, @sandy_brown : Int32, @sea_green : Int32, @sea_shell : Int32, @sienna : Int32, @silver : Int32, @sky_blue : Int32, @slate_blue : Int32, @slate_gray : Int32, @snow : Int32, @spring_green : Int32, @steel_blue : Int32, @tan : Int32, @teal : Int32, @thistle : Int32, @tomato : Int32, @transparent : Int32, @turquoise : Int32, @violet : Int32, @wheat : Int32, @white : Int32, @white_smoke : Int32, @yellow : Int32, @yellow_green : Int32, @alpha_shift : Int32, @red_shift : Int32, @green_shift : Int32, @blue_shift : Int32, @alpha_mask : Int32, @red_mask : Int32, @green_mask : Int32, @blue_mask : Int32)
    end
  end

  @[Extern]
  struct ENHMETAHEADER3
    property iType : UInt32
    property nSize : UInt32
    property rclBounds : Win32cr::Foundation::RECTL
    property rclFrame : Win32cr::Foundation::RECTL
    property dSignature : UInt32
    property nVersion : UInt32
    property nBytes : UInt32
    property nRecords : UInt32
    property nHandles : UInt16
    property sReserved : UInt16
    property nDescription : UInt32
    property offDescription : UInt32
    property nPalEntries : UInt32
    property szlDevice : Win32cr::Foundation::SIZE
    property szlMillimeters : Win32cr::Foundation::SIZE
    def initialize(@iType : UInt32, @nSize : UInt32, @rclBounds : Win32cr::Foundation::RECTL, @rclFrame : Win32cr::Foundation::RECTL, @dSignature : UInt32, @nVersion : UInt32, @nBytes : UInt32, @nRecords : UInt32, @nHandles : UInt16, @sReserved : UInt16, @nDescription : UInt32, @offDescription : UInt32, @nPalEntries : UInt32, @szlDevice : Win32cr::Foundation::SIZE, @szlMillimeters : Win32cr::Foundation::SIZE)
    end
  end

  @[Extern]
  struct PWMFRect16
    property left : Int16
    property top : Int16
    property right : Int16
    property bottom : Int16
    def initialize(@left : Int16, @top : Int16, @right : Int16, @bottom : Int16)
    end
  end

  @[Extern]
  struct WmfPlaceableFileHeader
    property key : UInt32
    property hmf : Int16
    property bounding_box : Win32cr::Graphics::GdiPlus::PWMFRect16
    property inch : Int16
    property reserved : UInt32
    property checksum : Int16
    def initialize(@key : UInt32, @hmf : Int16, @bounding_box : Win32cr::Graphics::GdiPlus::PWMFRect16, @inch : Int16, @reserved : UInt32, @checksum : Int16)
    end
  end

  @[Extern]
  struct MetafileHeader
    property type__ : Win32cr::Graphics::GdiPlus::MetafileType
    property size : UInt32
    property version : UInt32
    property emf_plus_flags : UInt32
    property dpi_x : Float32
    property dpi_y : Float32
    property x : Int32
    property y : Int32
    property width : Int32
    property height : Int32
    property anonymous : Anonymous_e__Union_
    property emf_plus_header_size : Int32
    property logical_dpi_x : Int32
    property logical_dpi_y : Int32

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property wmf_header : Win32cr::Graphics::Gdi::METAHEADER
    property emf_header : Win32cr::Graphics::GdiPlus::ENHMETAHEADER3
    def initialize(@wmf_header : Win32cr::Graphics::Gdi::METAHEADER, @emf_header : Win32cr::Graphics::GdiPlus::ENHMETAHEADER3)
    end
    end

    def initialize(@type__ : Win32cr::Graphics::GdiPlus::MetafileType, @size : UInt32, @version : UInt32, @emf_plus_flags : UInt32, @dpi_x : Float32, @dpi_y : Float32, @x : Int32, @y : Int32, @width : Int32, @height : Int32, @anonymous : Anonymous_e__Union_, @emf_plus_header_size : Int32, @logical_dpi_x : Int32, @logical_dpi_y : Int32)
    end
  end

  @[Extern]
  struct ImageCodecInfo
    property clsid : LibC::GUID
    property format_id : LibC::GUID
    property codec_name : Win32cr::Foundation::PWSTR
    property dll_name : Win32cr::Foundation::PWSTR
    property format_description : Win32cr::Foundation::PWSTR
    property filename_extension : Win32cr::Foundation::PWSTR
    property mime_type : Win32cr::Foundation::PWSTR
    property flags : UInt32
    property version : UInt32
    property sig_count : UInt32
    property sig_size : UInt32
    property sig_pattern : UInt8*
    property sig_mask : UInt8*
    def initialize(@clsid : LibC::GUID, @format_id : LibC::GUID, @codec_name : Win32cr::Foundation::PWSTR, @dll_name : Win32cr::Foundation::PWSTR, @format_description : Win32cr::Foundation::PWSTR, @filename_extension : Win32cr::Foundation::PWSTR, @mime_type : Win32cr::Foundation::PWSTR, @flags : UInt32, @version : UInt32, @sig_count : UInt32, @sig_size : UInt32, @sig_pattern : UInt8*, @sig_mask : UInt8*)
    end
  end

  @[Extern]
  struct BitmapData
    property width : UInt32
    property height : UInt32
    property stride : Int32
    property pixel_format : Int32
    property scan0 : Void*
    property reserved : LibC::UIntPtrT
    def initialize(@width : UInt32, @height : UInt32, @stride : Int32, @pixel_format : Int32, @scan0 : Void*, @reserved : LibC::UIntPtrT)
    end
  end

  @[Extern]
  struct EncoderParameter
    property guid : LibC::GUID
    property number_of_values : UInt32
    property type__ : UInt32
    property value : Void*
    def initialize(@guid : LibC::GUID, @number_of_values : UInt32, @type__ : UInt32, @value : Void*)
    end
  end

  @[Extern]
  struct EncoderParameters
    property count : UInt32
    property parameter : Win32cr::Graphics::GdiPlus::EncoderParameter[1]
    def initialize(@count : UInt32, @parameter : Win32cr::Graphics::GdiPlus::EncoderParameter[1])
    end
  end

  @[Extern]
  struct ImageItemData
    property size : UInt32
    property position : UInt32
    property desc : Void*
    property desc_size : UInt32
    property data : Void*
    property data_size : UInt32
    property cookie : UInt32
    def initialize(@size : UInt32, @position : UInt32, @desc : Void*, @desc_size : UInt32, @data : Void*, @data_size : UInt32, @cookie : UInt32)
    end
  end

  @[Extern]
  struct PropertyItem
    property id : UInt32
    property length : UInt32
    property type__ : UInt16
    property value : Void*
    def initialize(@id : UInt32, @length : UInt32, @type__ : UInt16, @value : Void*)
    end
  end

  @[Extern]
  struct ColorMatrix
    property m : Float32[25]
    def initialize(@m : Float32[25])
    end
  end

  @[Extern]
  struct ColorMap
    property oldColor : Win32cr::Graphics::GdiPlus::Color
    property newColor : Win32cr::Graphics::GdiPlus::Color
    def initialize(@oldColor : Win32cr::Graphics::GdiPlus::Color, @newColor : Win32cr::Graphics::GdiPlus::Color)
    end
  end

  @[Extern]
  struct SharpenParams
    property radius : Float32
    property amount : Float32
    def initialize(@radius : Float32, @amount : Float32)
    end
  end

  @[Extern]
  struct BlurParams
    property radius : Float32
    property expandEdge : Win32cr::Foundation::BOOL
    def initialize(@radius : Float32, @expandEdge : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct BrightnessContrastParams
    property brightnessLevel : Int32
    property contrastLevel : Int32
    def initialize(@brightnessLevel : Int32, @contrastLevel : Int32)
    end
  end

  @[Extern]
  struct RedEyeCorrectionParams
    property numberOfAreas : UInt32
    property areas : Win32cr::Foundation::RECT*
    def initialize(@numberOfAreas : UInt32, @areas : Win32cr::Foundation::RECT*)
    end
  end

  @[Extern]
  struct HueSaturationLightnessParams
    property hueLevel : Int32
    property saturationLevel : Int32
    property lightnessLevel : Int32
    def initialize(@hueLevel : Int32, @saturationLevel : Int32, @lightnessLevel : Int32)
    end
  end

  @[Extern]
  struct TintParams
    property hue : Int32
    property amount : Int32
    def initialize(@hue : Int32, @amount : Int32)
    end
  end

  @[Extern]
  struct LevelsParams
    property highlight : Int32
    property midtone : Int32
    property shadow : Int32
    def initialize(@highlight : Int32, @midtone : Int32, @shadow : Int32)
    end
  end

  @[Extern]
  struct ColorBalanceParams
    property cyanRed : Int32
    property magentaGreen : Int32
    property yellowBlue : Int32
    def initialize(@cyanRed : Int32, @magentaGreen : Int32, @yellowBlue : Int32)
    end
  end

  @[Extern]
  struct ColorLUTParams
    property lutB : UInt8[256]
    property lutG : UInt8[256]
    property lutR : UInt8[256]
    property lutA : UInt8[256]
    def initialize(@lutB : UInt8[256], @lutG : UInt8[256], @lutR : UInt8[256], @lutA : UInt8[256])
    end
  end

  @[Extern]
  struct ColorCurveParams
    property adjustment : Win32cr::Graphics::GdiPlus::CurveAdjustments
    property channel : Win32cr::Graphics::GdiPlus::CurveChannel
    property adjustValue : Int32
    def initialize(@adjustment : Win32cr::Graphics::GdiPlus::CurveAdjustments, @channel : Win32cr::Graphics::GdiPlus::CurveChannel, @adjustValue : Int32)
    end
  end

  @[Extern]
  struct Effect
    property lpVtbl : Void**
    property nativeEffect : Win32cr::Graphics::GdiPlus::CGpEffect*
    property auxDataSize : Int32
    property auxData : Void*
    property useAuxData : Win32cr::Foundation::BOOL
    def initialize(@lpVtbl : Void**, @nativeEffect : Win32cr::Graphics::GdiPlus::CGpEffect*, @auxDataSize : Int32, @auxData : Void*, @useAuxData : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct Blur
    property base : Win32cr::Graphics::GdiPlus::Effect
    def initialize(@base : Win32cr::Graphics::GdiPlus::Effect)
    end
  end

  @[Extern]
  struct Sharpen
    property base : Win32cr::Graphics::GdiPlus::Effect
    def initialize(@base : Win32cr::Graphics::GdiPlus::Effect)
    end
  end

  @[Extern]
  struct RedEyeCorrection
    property base : Win32cr::Graphics::GdiPlus::Effect
    def initialize(@base : Win32cr::Graphics::GdiPlus::Effect)
    end
  end

  @[Extern]
  struct BrightnessContrast
    property base : Win32cr::Graphics::GdiPlus::Effect
    def initialize(@base : Win32cr::Graphics::GdiPlus::Effect)
    end
  end

  @[Extern]
  struct HueSaturationLightness
    property base : Win32cr::Graphics::GdiPlus::Effect
    def initialize(@base : Win32cr::Graphics::GdiPlus::Effect)
    end
  end

  @[Extern]
  struct Levels
    property base : Win32cr::Graphics::GdiPlus::Effect
    def initialize(@base : Win32cr::Graphics::GdiPlus::Effect)
    end
  end

  @[Extern]
  struct Tint
    property base : Win32cr::Graphics::GdiPlus::Effect
    def initialize(@base : Win32cr::Graphics::GdiPlus::Effect)
    end
  end

  @[Extern]
  struct ColorBalance
    property base : Win32cr::Graphics::GdiPlus::Effect
    def initialize(@base : Win32cr::Graphics::GdiPlus::Effect)
    end
  end

  @[Extern]
  struct ColorMatrixEffect
    property base : Win32cr::Graphics::GdiPlus::Effect
    def initialize(@base : Win32cr::Graphics::GdiPlus::Effect)
    end
  end

  @[Extern]
  struct ColorLUT
    property base : Win32cr::Graphics::GdiPlus::Effect
    def initialize(@base : Win32cr::Graphics::GdiPlus::Effect)
    end
  end

  @[Extern]
  struct ColorCurve
    property base : Win32cr::Graphics::GdiPlus::Effect
    def initialize(@base : Win32cr::Graphics::GdiPlus::Effect)
    end
  end

  @[Extern]

  record GdiplusAbortVtable,
    abort : Proc(GdiplusAbort*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record GdiplusAbort, lpVtbl : GdiplusAbortVtable* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def abort(this : GdiplusAbort*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.abort.call(this)
    end

  end

  @[Extern]

  record IImageBytesVtable,
    query_interface : Proc(IImageBytes*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IImageBytes*, UInt32),
    release : Proc(IImageBytes*, UInt32),
    count_bytes : Proc(IImageBytes*, UInt32*, Win32cr::Foundation::HRESULT),
    lock_bytes : Proc(IImageBytes*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    unlock_bytes : Proc(IImageBytes*, Void*, UInt32, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IImageBytes, lpVtbl : IImageBytesVtable* do
    GUID = LibC::GUID.new(0x25d1823_u32, 0x6c7d_u16, 0x447b_u16, StaticArray[0xbb_u8, 0xdb_u8, 0xa3_u8, 0xcb_u8, 0xc3_u8, 0xdf_u8, 0xa2_u8, 0xfc_u8])
    def query_interface(this : IImageBytes*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IImageBytes*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IImageBytes*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def count_bytes(this : IImageBytes*, pcb : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.count_bytes.call(this, pcb)
    end
    def lock_bytes(this : IImageBytes*, cb : UInt32, ulOffset : UInt32, ppvBytes : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lock_bytes.call(this, cb, ulOffset, ppvBytes)
    end
    def unlock_bytes(this : IImageBytes*, pvBytes : Void*, cb : UInt32, ulOffset : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unlock_bytes.call(this, pvBytes, cb, ulOffset)
    end

  end

  def gdipAlloc(size : LibC::UIntPtrT) : Void*
    {% if !flag?(:docs) %}
    C.GdipAlloc(size)
    {% end %}
  end

  def gdipFree(ptr : Void*) : Void
    {% if !flag?(:docs) %}
    C.GdipFree(ptr)
    {% end %}
  end

  def gdiplusStartup(token : LibC::UIntPtrT*, input : Win32cr::Graphics::GdiPlus::GdiplusStartupInput*, output : Win32cr::Graphics::GdiPlus::GdiplusStartupOutput*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdiplusStartup(token, input, output)
    {% end %}
  end

  def gdiplusShutdown(token : LibC::UIntPtrT) : Void
    {% if !flag?(:docs) %}
    C.GdiplusShutdown(token)
    {% end %}
  end

  def gdipCreateEffect(guid : LibC::GUID, effect : Win32cr::Graphics::GdiPlus::CGpEffect**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateEffect(guid, effect)
    {% end %}
  end

  def gdipDeleteEffect(effect : Win32cr::Graphics::GdiPlus::CGpEffect*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDeleteEffect(effect)
    {% end %}
  end

  def gdipGetEffectParameterSize(effect : Win32cr::Graphics::GdiPlus::CGpEffect*, size : UInt32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetEffectParameterSize(effect, size)
    {% end %}
  end

  def gdipSetEffectParameters(effect : Win32cr::Graphics::GdiPlus::CGpEffect*, params : Void*, size : UInt32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetEffectParameters(effect, params, size)
    {% end %}
  end

  def gdipGetEffectParameters(effect : Win32cr::Graphics::GdiPlus::CGpEffect*, size : UInt32*, params : Void*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetEffectParameters(effect, size, params)
    {% end %}
  end

  def gdipCreatePath(brushMode : Win32cr::Graphics::GdiPlus::FillMode, path : Win32cr::Graphics::GdiPlus::GpPath**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreatePath(brushMode, path)
    {% end %}
  end

  def gdipCreatePath2(param0 : Win32cr::Graphics::GdiPlus::PointF*, param1 : UInt8*, param2 : Int32, param3 : Win32cr::Graphics::GdiPlus::FillMode, path : Win32cr::Graphics::GdiPlus::GpPath**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreatePath2(param0, param1, param2, param3, path)
    {% end %}
  end

  def gdipCreatePath2I(param0 : Win32cr::Graphics::GdiPlus::Point*, param1 : UInt8*, param2 : Int32, param3 : Win32cr::Graphics::GdiPlus::FillMode, path : Win32cr::Graphics::GdiPlus::GpPath**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreatePath2I(param0, param1, param2, param3, path)
    {% end %}
  end

  def gdipClonePath(path : Win32cr::Graphics::GdiPlus::GpPath*, clonePath : Win32cr::Graphics::GdiPlus::GpPath**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipClonePath(path, clonePath)
    {% end %}
  end

  def gdipDeletePath(path : Win32cr::Graphics::GdiPlus::GpPath*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDeletePath(path)
    {% end %}
  end

  def gdipResetPath(path : Win32cr::Graphics::GdiPlus::GpPath*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipResetPath(path)
    {% end %}
  end

  def gdipGetPointCount(path : Win32cr::Graphics::GdiPlus::GpPath*, count : Int32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPointCount(path, count)
    {% end %}
  end

  def gdipGetPathTypes(path : Win32cr::Graphics::GdiPlus::GpPath*, types : UInt8*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPathTypes(path, types, count)
    {% end %}
  end

  def gdipGetPathPoints(param0 : Win32cr::Graphics::GdiPlus::GpPath*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPathPoints(param0, points, count)
    {% end %}
  end

  def gdipGetPathPointsI(param0 : Win32cr::Graphics::GdiPlus::GpPath*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPathPointsI(param0, points, count)
    {% end %}
  end

  def gdipGetPathFillMode(path : Win32cr::Graphics::GdiPlus::GpPath*, fillmode : Win32cr::Graphics::GdiPlus::FillMode*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPathFillMode(path, fillmode)
    {% end %}
  end

  def gdipSetPathFillMode(path : Win32cr::Graphics::GdiPlus::GpPath*, fillmode : Win32cr::Graphics::GdiPlus::FillMode) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetPathFillMode(path, fillmode)
    {% end %}
  end

  def gdipGetPathData(path : Win32cr::Graphics::GdiPlus::GpPath*, pathData : Win32cr::Graphics::GdiPlus::PathData*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPathData(path, pathData)
    {% end %}
  end

  def gdipStartPathFigure(path : Win32cr::Graphics::GdiPlus::GpPath*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipStartPathFigure(path)
    {% end %}
  end

  def gdipClosePathFigure(path : Win32cr::Graphics::GdiPlus::GpPath*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipClosePathFigure(path)
    {% end %}
  end

  def gdipClosePathFigures(path : Win32cr::Graphics::GdiPlus::GpPath*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipClosePathFigures(path)
    {% end %}
  end

  def gdipSetPathMarker(path : Win32cr::Graphics::GdiPlus::GpPath*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetPathMarker(path)
    {% end %}
  end

  def gdipClearPathMarkers(path : Win32cr::Graphics::GdiPlus::GpPath*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipClearPathMarkers(path)
    {% end %}
  end

  def gdipReversePath(path : Win32cr::Graphics::GdiPlus::GpPath*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipReversePath(path)
    {% end %}
  end

  def gdipGetPathLastPoint(path : Win32cr::Graphics::GdiPlus::GpPath*, lastPoint : Win32cr::Graphics::GdiPlus::PointF*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPathLastPoint(path, lastPoint)
    {% end %}
  end

  def gdipAddPathLine(path : Win32cr::Graphics::GdiPlus::GpPath*, x1 : Float32, y1 : Float32, x2 : Float32, y2 : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipAddPathLine(path, x1, y1, x2, y2)
    {% end %}
  end

  def gdipAddPathLine2(path : Win32cr::Graphics::GdiPlus::GpPath*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipAddPathLine2(path, points, count)
    {% end %}
  end

  def gdipAddPathArc(path : Win32cr::Graphics::GdiPlus::GpPath*, x : Float32, y : Float32, width : Float32, height : Float32, startAngle : Float32, sweepAngle : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipAddPathArc(path, x, y, width, height, startAngle, sweepAngle)
    {% end %}
  end

  def gdipAddPathBezier(path : Win32cr::Graphics::GdiPlus::GpPath*, x1 : Float32, y1 : Float32, x2 : Float32, y2 : Float32, x3 : Float32, y3 : Float32, x4 : Float32, y4 : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipAddPathBezier(path, x1, y1, x2, y2, x3, y3, x4, y4)
    {% end %}
  end

  def gdipAddPathBeziers(path : Win32cr::Graphics::GdiPlus::GpPath*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipAddPathBeziers(path, points, count)
    {% end %}
  end

  def gdipAddPathCurve(path : Win32cr::Graphics::GdiPlus::GpPath*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipAddPathCurve(path, points, count)
    {% end %}
  end

  def gdipAddPathCurve2(path : Win32cr::Graphics::GdiPlus::GpPath*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32, tension : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipAddPathCurve2(path, points, count, tension)
    {% end %}
  end

  def gdipAddPathCurve3(path : Win32cr::Graphics::GdiPlus::GpPath*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32, offset : Int32, numberOfSegments : Int32, tension : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipAddPathCurve3(path, points, count, offset, numberOfSegments, tension)
    {% end %}
  end

  def gdipAddPathClosedCurve(path : Win32cr::Graphics::GdiPlus::GpPath*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipAddPathClosedCurve(path, points, count)
    {% end %}
  end

  def gdipAddPathClosedCurve2(path : Win32cr::Graphics::GdiPlus::GpPath*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32, tension : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipAddPathClosedCurve2(path, points, count, tension)
    {% end %}
  end

  def gdipAddPathRectangle(path : Win32cr::Graphics::GdiPlus::GpPath*, x : Float32, y : Float32, width : Float32, height : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipAddPathRectangle(path, x, y, width, height)
    {% end %}
  end

  def gdipAddPathRectangles(path : Win32cr::Graphics::GdiPlus::GpPath*, rects : Win32cr::Graphics::GdiPlus::RectF*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipAddPathRectangles(path, rects, count)
    {% end %}
  end

  def gdipAddPathEllipse(path : Win32cr::Graphics::GdiPlus::GpPath*, x : Float32, y : Float32, width : Float32, height : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipAddPathEllipse(path, x, y, width, height)
    {% end %}
  end

  def gdipAddPathPie(path : Win32cr::Graphics::GdiPlus::GpPath*, x : Float32, y : Float32, width : Float32, height : Float32, startAngle : Float32, sweepAngle : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipAddPathPie(path, x, y, width, height, startAngle, sweepAngle)
    {% end %}
  end

  def gdipAddPathPolygon(path : Win32cr::Graphics::GdiPlus::GpPath*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipAddPathPolygon(path, points, count)
    {% end %}
  end

  def gdipAddPathPath(path : Win32cr::Graphics::GdiPlus::GpPath*, addingPath : Win32cr::Graphics::GdiPlus::GpPath*, connect : Win32cr::Foundation::BOOL) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipAddPathPath(path, addingPath, connect)
    {% end %}
  end

  def gdipAddPathString(path : Win32cr::Graphics::GdiPlus::GpPath*, string : Win32cr::Foundation::PWSTR, length : Int32, family : Win32cr::Graphics::GdiPlus::GpFontFamily*, style : Int32, emSize : Float32, layoutRect : Win32cr::Graphics::GdiPlus::RectF*, format : Win32cr::Graphics::GdiPlus::GpStringFormat*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipAddPathString(path, string, length, family, style, emSize, layoutRect, format)
    {% end %}
  end

  def gdipAddPathStringI(path : Win32cr::Graphics::GdiPlus::GpPath*, string : Win32cr::Foundation::PWSTR, length : Int32, family : Win32cr::Graphics::GdiPlus::GpFontFamily*, style : Int32, emSize : Float32, layoutRect : Win32cr::Graphics::GdiPlus::Rect*, format : Win32cr::Graphics::GdiPlus::GpStringFormat*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipAddPathStringI(path, string, length, family, style, emSize, layoutRect, format)
    {% end %}
  end

  def gdipAddPathLineI(path : Win32cr::Graphics::GdiPlus::GpPath*, x1 : Int32, y1 : Int32, x2 : Int32, y2 : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipAddPathLineI(path, x1, y1, x2, y2)
    {% end %}
  end

  def gdipAddPathLine2I(path : Win32cr::Graphics::GdiPlus::GpPath*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipAddPathLine2I(path, points, count)
    {% end %}
  end

  def gdipAddPathArcI(path : Win32cr::Graphics::GdiPlus::GpPath*, x : Int32, y : Int32, width : Int32, height : Int32, startAngle : Float32, sweepAngle : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipAddPathArcI(path, x, y, width, height, startAngle, sweepAngle)
    {% end %}
  end

  def gdipAddPathBezierI(path : Win32cr::Graphics::GdiPlus::GpPath*, x1 : Int32, y1 : Int32, x2 : Int32, y2 : Int32, x3 : Int32, y3 : Int32, x4 : Int32, y4 : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipAddPathBezierI(path, x1, y1, x2, y2, x3, y3, x4, y4)
    {% end %}
  end

  def gdipAddPathBeziersI(path : Win32cr::Graphics::GdiPlus::GpPath*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipAddPathBeziersI(path, points, count)
    {% end %}
  end

  def gdipAddPathCurveI(path : Win32cr::Graphics::GdiPlus::GpPath*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipAddPathCurveI(path, points, count)
    {% end %}
  end

  def gdipAddPathCurve2I(path : Win32cr::Graphics::GdiPlus::GpPath*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32, tension : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipAddPathCurve2I(path, points, count, tension)
    {% end %}
  end

  def gdipAddPathCurve3I(path : Win32cr::Graphics::GdiPlus::GpPath*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32, offset : Int32, numberOfSegments : Int32, tension : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipAddPathCurve3I(path, points, count, offset, numberOfSegments, tension)
    {% end %}
  end

  def gdipAddPathClosedCurveI(path : Win32cr::Graphics::GdiPlus::GpPath*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipAddPathClosedCurveI(path, points, count)
    {% end %}
  end

  def gdipAddPathClosedCurve2I(path : Win32cr::Graphics::GdiPlus::GpPath*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32, tension : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipAddPathClosedCurve2I(path, points, count, tension)
    {% end %}
  end

  def gdipAddPathRectangleI(path : Win32cr::Graphics::GdiPlus::GpPath*, x : Int32, y : Int32, width : Int32, height : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipAddPathRectangleI(path, x, y, width, height)
    {% end %}
  end

  def gdipAddPathRectanglesI(path : Win32cr::Graphics::GdiPlus::GpPath*, rects : Win32cr::Graphics::GdiPlus::Rect*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipAddPathRectanglesI(path, rects, count)
    {% end %}
  end

  def gdipAddPathEllipseI(path : Win32cr::Graphics::GdiPlus::GpPath*, x : Int32, y : Int32, width : Int32, height : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipAddPathEllipseI(path, x, y, width, height)
    {% end %}
  end

  def gdipAddPathPieI(path : Win32cr::Graphics::GdiPlus::GpPath*, x : Int32, y : Int32, width : Int32, height : Int32, startAngle : Float32, sweepAngle : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipAddPathPieI(path, x, y, width, height, startAngle, sweepAngle)
    {% end %}
  end

  def gdipAddPathPolygonI(path : Win32cr::Graphics::GdiPlus::GpPath*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipAddPathPolygonI(path, points, count)
    {% end %}
  end

  def gdipFlattenPath(path : Win32cr::Graphics::GdiPlus::GpPath*, matrix : Win32cr::Graphics::GdiPlus::Matrix*, flatness : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipFlattenPath(path, matrix, flatness)
    {% end %}
  end

  def gdipWindingModeOutline(path : Win32cr::Graphics::GdiPlus::GpPath*, matrix : Win32cr::Graphics::GdiPlus::Matrix*, flatness : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipWindingModeOutline(path, matrix, flatness)
    {% end %}
  end

  def gdipWidenPath(nativePath : Win32cr::Graphics::GdiPlus::GpPath*, pen : Win32cr::Graphics::GdiPlus::GpPen*, matrix : Win32cr::Graphics::GdiPlus::Matrix*, flatness : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipWidenPath(nativePath, pen, matrix, flatness)
    {% end %}
  end

  def gdipWarpPath(path : Win32cr::Graphics::GdiPlus::GpPath*, matrix : Win32cr::Graphics::GdiPlus::Matrix*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32, srcx : Float32, srcy : Float32, srcwidth : Float32, srcheight : Float32, warpMode : Win32cr::Graphics::GdiPlus::WarpMode, flatness : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipWarpPath(path, matrix, points, count, srcx, srcy, srcwidth, srcheight, warpMode, flatness)
    {% end %}
  end

  def gdipTransformPath(path : Win32cr::Graphics::GdiPlus::GpPath*, matrix : Win32cr::Graphics::GdiPlus::Matrix*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipTransformPath(path, matrix)
    {% end %}
  end

  def gdipGetPathWorldBounds(path : Win32cr::Graphics::GdiPlus::GpPath*, bounds : Win32cr::Graphics::GdiPlus::RectF*, matrix : Win32cr::Graphics::GdiPlus::Matrix*, pen : Win32cr::Graphics::GdiPlus::GpPen*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPathWorldBounds(path, bounds, matrix, pen)
    {% end %}
  end

  def gdipGetPathWorldBoundsI(path : Win32cr::Graphics::GdiPlus::GpPath*, bounds : Win32cr::Graphics::GdiPlus::Rect*, matrix : Win32cr::Graphics::GdiPlus::Matrix*, pen : Win32cr::Graphics::GdiPlus::GpPen*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPathWorldBoundsI(path, bounds, matrix, pen)
    {% end %}
  end

  def gdipIsVisiblePathPoint(path : Win32cr::Graphics::GdiPlus::GpPath*, x : Float32, y : Float32, graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, result : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipIsVisiblePathPoint(path, x, y, graphics, result)
    {% end %}
  end

  def gdipIsVisiblePathPointI(path : Win32cr::Graphics::GdiPlus::GpPath*, x : Int32, y : Int32, graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, result : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipIsVisiblePathPointI(path, x, y, graphics, result)
    {% end %}
  end

  def gdipIsOutlineVisiblePathPoint(path : Win32cr::Graphics::GdiPlus::GpPath*, x : Float32, y : Float32, pen : Win32cr::Graphics::GdiPlus::GpPen*, graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, result : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipIsOutlineVisiblePathPoint(path, x, y, pen, graphics, result)
    {% end %}
  end

  def gdipIsOutlineVisiblePathPointI(path : Win32cr::Graphics::GdiPlus::GpPath*, x : Int32, y : Int32, pen : Win32cr::Graphics::GdiPlus::GpPen*, graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, result : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipIsOutlineVisiblePathPointI(path, x, y, pen, graphics, result)
    {% end %}
  end

  def gdipCreatePathIter(iterator : Win32cr::Graphics::GdiPlus::GpPathIterator**, path : Win32cr::Graphics::GdiPlus::GpPath*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreatePathIter(iterator, path)
    {% end %}
  end

  def gdipDeletePathIter(iterator : Win32cr::Graphics::GdiPlus::GpPathIterator*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDeletePathIter(iterator)
    {% end %}
  end

  def gdipPathIterNextSubpath(iterator : Win32cr::Graphics::GdiPlus::GpPathIterator*, resultCount : Int32*, startIndex : Int32*, endIndex : Int32*, isClosed : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipPathIterNextSubpath(iterator, resultCount, startIndex, endIndex, isClosed)
    {% end %}
  end

  def gdipPathIterNextSubpathPath(iterator : Win32cr::Graphics::GdiPlus::GpPathIterator*, resultCount : Int32*, path : Win32cr::Graphics::GdiPlus::GpPath*, isClosed : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipPathIterNextSubpathPath(iterator, resultCount, path, isClosed)
    {% end %}
  end

  def gdipPathIterNextPathType(iterator : Win32cr::Graphics::GdiPlus::GpPathIterator*, resultCount : Int32*, pathType : UInt8*, startIndex : Int32*, endIndex : Int32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipPathIterNextPathType(iterator, resultCount, pathType, startIndex, endIndex)
    {% end %}
  end

  def gdipPathIterNextMarker(iterator : Win32cr::Graphics::GdiPlus::GpPathIterator*, resultCount : Int32*, startIndex : Int32*, endIndex : Int32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipPathIterNextMarker(iterator, resultCount, startIndex, endIndex)
    {% end %}
  end

  def gdipPathIterNextMarkerPath(iterator : Win32cr::Graphics::GdiPlus::GpPathIterator*, resultCount : Int32*, path : Win32cr::Graphics::GdiPlus::GpPath*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipPathIterNextMarkerPath(iterator, resultCount, path)
    {% end %}
  end

  def gdipPathIterGetCount(iterator : Win32cr::Graphics::GdiPlus::GpPathIterator*, count : Int32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipPathIterGetCount(iterator, count)
    {% end %}
  end

  def gdipPathIterGetSubpathCount(iterator : Win32cr::Graphics::GdiPlus::GpPathIterator*, count : Int32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipPathIterGetSubpathCount(iterator, count)
    {% end %}
  end

  def gdipPathIterIsValid(iterator : Win32cr::Graphics::GdiPlus::GpPathIterator*, valid : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipPathIterIsValid(iterator, valid)
    {% end %}
  end

  def gdipPathIterHasCurve(iterator : Win32cr::Graphics::GdiPlus::GpPathIterator*, hasCurve : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipPathIterHasCurve(iterator, hasCurve)
    {% end %}
  end

  def gdipPathIterRewind(iterator : Win32cr::Graphics::GdiPlus::GpPathIterator*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipPathIterRewind(iterator)
    {% end %}
  end

  def gdipPathIterEnumerate(iterator : Win32cr::Graphics::GdiPlus::GpPathIterator*, resultCount : Int32*, points : Win32cr::Graphics::GdiPlus::PointF*, types : UInt8*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipPathIterEnumerate(iterator, resultCount, points, types, count)
    {% end %}
  end

  def gdipPathIterCopyData(iterator : Win32cr::Graphics::GdiPlus::GpPathIterator*, resultCount : Int32*, points : Win32cr::Graphics::GdiPlus::PointF*, types : UInt8*, startIndex : Int32, endIndex : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipPathIterCopyData(iterator, resultCount, points, types, startIndex, endIndex)
    {% end %}
  end

  def gdipCreateMatrix(matrix : Win32cr::Graphics::GdiPlus::Matrix**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateMatrix(matrix)
    {% end %}
  end

  def gdipCreateMatrix2(m11 : Float32, m12 : Float32, m21 : Float32, m22 : Float32, dx : Float32, dy : Float32, matrix : Win32cr::Graphics::GdiPlus::Matrix**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateMatrix2(m11, m12, m21, m22, dx, dy, matrix)
    {% end %}
  end

  def gdipCreateMatrix3(rect : Win32cr::Graphics::GdiPlus::RectF*, dstplg : Win32cr::Graphics::GdiPlus::PointF*, matrix : Win32cr::Graphics::GdiPlus::Matrix**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateMatrix3(rect, dstplg, matrix)
    {% end %}
  end

  def gdipCreateMatrix3I(rect : Win32cr::Graphics::GdiPlus::Rect*, dstplg : Win32cr::Graphics::GdiPlus::Point*, matrix : Win32cr::Graphics::GdiPlus::Matrix**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateMatrix3I(rect, dstplg, matrix)
    {% end %}
  end

  def gdipCloneMatrix(matrix : Win32cr::Graphics::GdiPlus::Matrix*, cloneMatrix : Win32cr::Graphics::GdiPlus::Matrix**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCloneMatrix(matrix, cloneMatrix)
    {% end %}
  end

  def gdipDeleteMatrix(matrix : Win32cr::Graphics::GdiPlus::Matrix*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDeleteMatrix(matrix)
    {% end %}
  end

  def gdipSetMatrixElements(matrix : Win32cr::Graphics::GdiPlus::Matrix*, m11 : Float32, m12 : Float32, m21 : Float32, m22 : Float32, dx : Float32, dy : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetMatrixElements(matrix, m11, m12, m21, m22, dx, dy)
    {% end %}
  end

  def gdipMultiplyMatrix(matrix : Win32cr::Graphics::GdiPlus::Matrix*, matrix2 : Win32cr::Graphics::GdiPlus::Matrix*, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipMultiplyMatrix(matrix, matrix2, order)
    {% end %}
  end

  def gdipTranslateMatrix(matrix : Win32cr::Graphics::GdiPlus::Matrix*, offsetX : Float32, offsetY : Float32, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipTranslateMatrix(matrix, offsetX, offsetY, order)
    {% end %}
  end

  def gdipScaleMatrix(matrix : Win32cr::Graphics::GdiPlus::Matrix*, scaleX : Float32, scaleY : Float32, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipScaleMatrix(matrix, scaleX, scaleY, order)
    {% end %}
  end

  def gdipRotateMatrix(matrix : Win32cr::Graphics::GdiPlus::Matrix*, angle : Float32, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipRotateMatrix(matrix, angle, order)
    {% end %}
  end

  def gdipShearMatrix(matrix : Win32cr::Graphics::GdiPlus::Matrix*, shearX : Float32, shearY : Float32, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipShearMatrix(matrix, shearX, shearY, order)
    {% end %}
  end

  def gdipInvertMatrix(matrix : Win32cr::Graphics::GdiPlus::Matrix*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipInvertMatrix(matrix)
    {% end %}
  end

  def gdipTransformMatrixPoints(matrix : Win32cr::Graphics::GdiPlus::Matrix*, pts : Win32cr::Graphics::GdiPlus::PointF*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipTransformMatrixPoints(matrix, pts, count)
    {% end %}
  end

  def gdipTransformMatrixPointsI(matrix : Win32cr::Graphics::GdiPlus::Matrix*, pts : Win32cr::Graphics::GdiPlus::Point*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipTransformMatrixPointsI(matrix, pts, count)
    {% end %}
  end

  def gdipVectorTransformMatrixPoints(matrix : Win32cr::Graphics::GdiPlus::Matrix*, pts : Win32cr::Graphics::GdiPlus::PointF*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipVectorTransformMatrixPoints(matrix, pts, count)
    {% end %}
  end

  def gdipVectorTransformMatrixPointsI(matrix : Win32cr::Graphics::GdiPlus::Matrix*, pts : Win32cr::Graphics::GdiPlus::Point*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipVectorTransformMatrixPointsI(matrix, pts, count)
    {% end %}
  end

  def gdipGetMatrixElements(matrix : Win32cr::Graphics::GdiPlus::Matrix*, matrixOut : Float32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetMatrixElements(matrix, matrixOut)
    {% end %}
  end

  def gdipIsMatrixInvertible(matrix : Win32cr::Graphics::GdiPlus::Matrix*, result : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipIsMatrixInvertible(matrix, result)
    {% end %}
  end

  def gdipIsMatrixIdentity(matrix : Win32cr::Graphics::GdiPlus::Matrix*, result : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipIsMatrixIdentity(matrix, result)
    {% end %}
  end

  def gdipIsMatrixEqual(matrix : Win32cr::Graphics::GdiPlus::Matrix*, matrix2 : Win32cr::Graphics::GdiPlus::Matrix*, result : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipIsMatrixEqual(matrix, matrix2, result)
    {% end %}
  end

  def gdipCreateRegion(region : Win32cr::Graphics::GdiPlus::GpRegion**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateRegion(region)
    {% end %}
  end

  def gdipCreateRegionRect(rect : Win32cr::Graphics::GdiPlus::RectF*, region : Win32cr::Graphics::GdiPlus::GpRegion**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateRegionRect(rect, region)
    {% end %}
  end

  def gdipCreateRegionRectI(rect : Win32cr::Graphics::GdiPlus::Rect*, region : Win32cr::Graphics::GdiPlus::GpRegion**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateRegionRectI(rect, region)
    {% end %}
  end

  def gdipCreateRegionPath(path : Win32cr::Graphics::GdiPlus::GpPath*, region : Win32cr::Graphics::GdiPlus::GpRegion**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateRegionPath(path, region)
    {% end %}
  end

  def gdipCreateRegionRgnData(regionData : UInt8*, size : Int32, region : Win32cr::Graphics::GdiPlus::GpRegion**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateRegionRgnData(regionData, size, region)
    {% end %}
  end

  def gdipCreateRegionHrgn(hRgn : Win32cr::Graphics::Gdi::HRGN, region : Win32cr::Graphics::GdiPlus::GpRegion**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateRegionHrgn(hRgn, region)
    {% end %}
  end

  def gdipCloneRegion(region : Win32cr::Graphics::GdiPlus::GpRegion*, cloneRegion : Win32cr::Graphics::GdiPlus::GpRegion**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCloneRegion(region, cloneRegion)
    {% end %}
  end

  def gdipDeleteRegion(region : Win32cr::Graphics::GdiPlus::GpRegion*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDeleteRegion(region)
    {% end %}
  end

  def gdipSetInfinite(region : Win32cr::Graphics::GdiPlus::GpRegion*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetInfinite(region)
    {% end %}
  end

  def gdipSetEmpty(region : Win32cr::Graphics::GdiPlus::GpRegion*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetEmpty(region)
    {% end %}
  end

  def gdipCombineRegionRect(region : Win32cr::Graphics::GdiPlus::GpRegion*, rect : Win32cr::Graphics::GdiPlus::RectF*, combineMode : Win32cr::Graphics::GdiPlus::CombineMode) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCombineRegionRect(region, rect, combineMode)
    {% end %}
  end

  def gdipCombineRegionRectI(region : Win32cr::Graphics::GdiPlus::GpRegion*, rect : Win32cr::Graphics::GdiPlus::Rect*, combineMode : Win32cr::Graphics::GdiPlus::CombineMode) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCombineRegionRectI(region, rect, combineMode)
    {% end %}
  end

  def gdipCombineRegionPath(region : Win32cr::Graphics::GdiPlus::GpRegion*, path : Win32cr::Graphics::GdiPlus::GpPath*, combineMode : Win32cr::Graphics::GdiPlus::CombineMode) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCombineRegionPath(region, path, combineMode)
    {% end %}
  end

  def gdipCombineRegionRegion(region : Win32cr::Graphics::GdiPlus::GpRegion*, region2 : Win32cr::Graphics::GdiPlus::GpRegion*, combineMode : Win32cr::Graphics::GdiPlus::CombineMode) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCombineRegionRegion(region, region2, combineMode)
    {% end %}
  end

  def gdipTranslateRegion(region : Win32cr::Graphics::GdiPlus::GpRegion*, dx : Float32, dy : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipTranslateRegion(region, dx, dy)
    {% end %}
  end

  def gdipTranslateRegionI(region : Win32cr::Graphics::GdiPlus::GpRegion*, dx : Int32, dy : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipTranslateRegionI(region, dx, dy)
    {% end %}
  end

  def gdipTransformRegion(region : Win32cr::Graphics::GdiPlus::GpRegion*, matrix : Win32cr::Graphics::GdiPlus::Matrix*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipTransformRegion(region, matrix)
    {% end %}
  end

  def gdipGetRegionBounds(region : Win32cr::Graphics::GdiPlus::GpRegion*, graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, rect : Win32cr::Graphics::GdiPlus::RectF*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetRegionBounds(region, graphics, rect)
    {% end %}
  end

  def gdipGetRegionBoundsI(region : Win32cr::Graphics::GdiPlus::GpRegion*, graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, rect : Win32cr::Graphics::GdiPlus::Rect*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetRegionBoundsI(region, graphics, rect)
    {% end %}
  end

  def gdipGetRegionHRgn(region : Win32cr::Graphics::GdiPlus::GpRegion*, graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, hRgn : Win32cr::Graphics::Gdi::HRGN*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetRegionHRgn(region, graphics, hRgn)
    {% end %}
  end

  def gdipIsEmptyRegion(region : Win32cr::Graphics::GdiPlus::GpRegion*, graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, result : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipIsEmptyRegion(region, graphics, result)
    {% end %}
  end

  def gdipIsInfiniteRegion(region : Win32cr::Graphics::GdiPlus::GpRegion*, graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, result : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipIsInfiniteRegion(region, graphics, result)
    {% end %}
  end

  def gdipIsEqualRegion(region : Win32cr::Graphics::GdiPlus::GpRegion*, region2 : Win32cr::Graphics::GdiPlus::GpRegion*, graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, result : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipIsEqualRegion(region, region2, graphics, result)
    {% end %}
  end

  def gdipGetRegionDataSize(region : Win32cr::Graphics::GdiPlus::GpRegion*, bufferSize : UInt32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetRegionDataSize(region, bufferSize)
    {% end %}
  end

  def gdipGetRegionData(region : Win32cr::Graphics::GdiPlus::GpRegion*, buffer : UInt8*, bufferSize : UInt32, sizeFilled : UInt32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetRegionData(region, buffer, bufferSize, sizeFilled)
    {% end %}
  end

  def gdipIsVisibleRegionPoint(region : Win32cr::Graphics::GdiPlus::GpRegion*, x : Float32, y : Float32, graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, result : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipIsVisibleRegionPoint(region, x, y, graphics, result)
    {% end %}
  end

  def gdipIsVisibleRegionPointI(region : Win32cr::Graphics::GdiPlus::GpRegion*, x : Int32, y : Int32, graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, result : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipIsVisibleRegionPointI(region, x, y, graphics, result)
    {% end %}
  end

  def gdipIsVisibleRegionRect(region : Win32cr::Graphics::GdiPlus::GpRegion*, x : Float32, y : Float32, width : Float32, height : Float32, graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, result : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipIsVisibleRegionRect(region, x, y, width, height, graphics, result)
    {% end %}
  end

  def gdipIsVisibleRegionRectI(region : Win32cr::Graphics::GdiPlus::GpRegion*, x : Int32, y : Int32, width : Int32, height : Int32, graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, result : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipIsVisibleRegionRectI(region, x, y, width, height, graphics, result)
    {% end %}
  end

  def gdipGetRegionScansCount(region : Win32cr::Graphics::GdiPlus::GpRegion*, count : UInt32*, matrix : Win32cr::Graphics::GdiPlus::Matrix*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetRegionScansCount(region, count, matrix)
    {% end %}
  end

  def gdipGetRegionScans(region : Win32cr::Graphics::GdiPlus::GpRegion*, rects : Win32cr::Graphics::GdiPlus::RectF*, count : Int32*, matrix : Win32cr::Graphics::GdiPlus::Matrix*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetRegionScans(region, rects, count, matrix)
    {% end %}
  end

  def gdipGetRegionScansI(region : Win32cr::Graphics::GdiPlus::GpRegion*, rects : Win32cr::Graphics::GdiPlus::Rect*, count : Int32*, matrix : Win32cr::Graphics::GdiPlus::Matrix*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetRegionScansI(region, rects, count, matrix)
    {% end %}
  end

  def gdipCloneBrush(brush : Win32cr::Graphics::GdiPlus::GpBrush*, cloneBrush : Win32cr::Graphics::GdiPlus::GpBrush**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCloneBrush(brush, cloneBrush)
    {% end %}
  end

  def gdipDeleteBrush(brush : Win32cr::Graphics::GdiPlus::GpBrush*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDeleteBrush(brush)
    {% end %}
  end

  def gdipGetBrushType(brush : Win32cr::Graphics::GdiPlus::GpBrush*, type__ : Win32cr::Graphics::GdiPlus::BrushType*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetBrushType(brush, type__)
    {% end %}
  end

  def gdipCreateHatchBrush(hatchstyle : Win32cr::Graphics::GdiPlus::HatchStyle, forecol : UInt32, backcol : UInt32, brush : Win32cr::Graphics::GdiPlus::GpHatch**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateHatchBrush(hatchstyle, forecol, backcol, brush)
    {% end %}
  end

  def gdipGetHatchStyle(brush : Win32cr::Graphics::GdiPlus::GpHatch*, hatchstyle : Win32cr::Graphics::GdiPlus::HatchStyle*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetHatchStyle(brush, hatchstyle)
    {% end %}
  end

  def gdipGetHatchForegroundColor(brush : Win32cr::Graphics::GdiPlus::GpHatch*, forecol : UInt32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetHatchForegroundColor(brush, forecol)
    {% end %}
  end

  def gdipGetHatchBackgroundColor(brush : Win32cr::Graphics::GdiPlus::GpHatch*, backcol : UInt32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetHatchBackgroundColor(brush, backcol)
    {% end %}
  end

  def gdipCreateTexture(image : Win32cr::Graphics::GdiPlus::GpImage*, wrapmode : Win32cr::Graphics::GdiPlus::WrapMode, texture : Win32cr::Graphics::GdiPlus::GpTexture**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateTexture(image, wrapmode, texture)
    {% end %}
  end

  def gdipCreateTexture2(image : Win32cr::Graphics::GdiPlus::GpImage*, wrapmode : Win32cr::Graphics::GdiPlus::WrapMode, x : Float32, y : Float32, width : Float32, height : Float32, texture : Win32cr::Graphics::GdiPlus::GpTexture**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateTexture2(image, wrapmode, x, y, width, height, texture)
    {% end %}
  end

  def gdipCreateTextureIA(image : Win32cr::Graphics::GdiPlus::GpImage*, imageAttributes : Win32cr::Graphics::GdiPlus::GpImageAttributes*, x : Float32, y : Float32, width : Float32, height : Float32, texture : Win32cr::Graphics::GdiPlus::GpTexture**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateTextureIA(image, imageAttributes, x, y, width, height, texture)
    {% end %}
  end

  def gdipCreateTexture2I(image : Win32cr::Graphics::GdiPlus::GpImage*, wrapmode : Win32cr::Graphics::GdiPlus::WrapMode, x : Int32, y : Int32, width : Int32, height : Int32, texture : Win32cr::Graphics::GdiPlus::GpTexture**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateTexture2I(image, wrapmode, x, y, width, height, texture)
    {% end %}
  end

  def gdipCreateTextureIAI(image : Win32cr::Graphics::GdiPlus::GpImage*, imageAttributes : Win32cr::Graphics::GdiPlus::GpImageAttributes*, x : Int32, y : Int32, width : Int32, height : Int32, texture : Win32cr::Graphics::GdiPlus::GpTexture**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateTextureIAI(image, imageAttributes, x, y, width, height, texture)
    {% end %}
  end

  def gdipGetTextureTransform(brush : Win32cr::Graphics::GdiPlus::GpTexture*, matrix : Win32cr::Graphics::GdiPlus::Matrix*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetTextureTransform(brush, matrix)
    {% end %}
  end

  def gdipSetTextureTransform(brush : Win32cr::Graphics::GdiPlus::GpTexture*, matrix : Win32cr::Graphics::GdiPlus::Matrix*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetTextureTransform(brush, matrix)
    {% end %}
  end

  def gdipResetTextureTransform(brush : Win32cr::Graphics::GdiPlus::GpTexture*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipResetTextureTransform(brush)
    {% end %}
  end

  def gdipMultiplyTextureTransform(brush : Win32cr::Graphics::GdiPlus::GpTexture*, matrix : Win32cr::Graphics::GdiPlus::Matrix*, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipMultiplyTextureTransform(brush, matrix, order)
    {% end %}
  end

  def gdipTranslateTextureTransform(brush : Win32cr::Graphics::GdiPlus::GpTexture*, dx : Float32, dy : Float32, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipTranslateTextureTransform(brush, dx, dy, order)
    {% end %}
  end

  def gdipScaleTextureTransform(brush : Win32cr::Graphics::GdiPlus::GpTexture*, sx : Float32, sy : Float32, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipScaleTextureTransform(brush, sx, sy, order)
    {% end %}
  end

  def gdipRotateTextureTransform(brush : Win32cr::Graphics::GdiPlus::GpTexture*, angle : Float32, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipRotateTextureTransform(brush, angle, order)
    {% end %}
  end

  def gdipSetTextureWrapMode(brush : Win32cr::Graphics::GdiPlus::GpTexture*, wrapmode : Win32cr::Graphics::GdiPlus::WrapMode) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetTextureWrapMode(brush, wrapmode)
    {% end %}
  end

  def gdipGetTextureWrapMode(brush : Win32cr::Graphics::GdiPlus::GpTexture*, wrapmode : Win32cr::Graphics::GdiPlus::WrapMode*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetTextureWrapMode(brush, wrapmode)
    {% end %}
  end

  def gdipGetTextureImage(brush : Win32cr::Graphics::GdiPlus::GpTexture*, image : Win32cr::Graphics::GdiPlus::GpImage**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetTextureImage(brush, image)
    {% end %}
  end

  def gdipCreateSolidFill(color : UInt32, brush : Win32cr::Graphics::GdiPlus::GpSolidFill**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateSolidFill(color, brush)
    {% end %}
  end

  def gdipSetSolidFillColor(brush : Win32cr::Graphics::GdiPlus::GpSolidFill*, color : UInt32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetSolidFillColor(brush, color)
    {% end %}
  end

  def gdipGetSolidFillColor(brush : Win32cr::Graphics::GdiPlus::GpSolidFill*, color : UInt32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetSolidFillColor(brush, color)
    {% end %}
  end

  def gdipCreateLineBrush(point1 : Win32cr::Graphics::GdiPlus::PointF*, point2 : Win32cr::Graphics::GdiPlus::PointF*, color1 : UInt32, color2 : UInt32, wrapMode : Win32cr::Graphics::GdiPlus::WrapMode, lineGradient : Win32cr::Graphics::GdiPlus::GpLineGradient**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateLineBrush(point1, point2, color1, color2, wrapMode, lineGradient)
    {% end %}
  end

  def gdipCreateLineBrushI(point1 : Win32cr::Graphics::GdiPlus::Point*, point2 : Win32cr::Graphics::GdiPlus::Point*, color1 : UInt32, color2 : UInt32, wrapMode : Win32cr::Graphics::GdiPlus::WrapMode, lineGradient : Win32cr::Graphics::GdiPlus::GpLineGradient**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateLineBrushI(point1, point2, color1, color2, wrapMode, lineGradient)
    {% end %}
  end

  def gdipCreateLineBrushFromRect(rect : Win32cr::Graphics::GdiPlus::RectF*, color1 : UInt32, color2 : UInt32, mode : Win32cr::Graphics::GdiPlus::LinearGradientMode, wrapMode : Win32cr::Graphics::GdiPlus::WrapMode, lineGradient : Win32cr::Graphics::GdiPlus::GpLineGradient**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateLineBrushFromRect(rect, color1, color2, mode, wrapMode, lineGradient)
    {% end %}
  end

  def gdipCreateLineBrushFromRectI(rect : Win32cr::Graphics::GdiPlus::Rect*, color1 : UInt32, color2 : UInt32, mode : Win32cr::Graphics::GdiPlus::LinearGradientMode, wrapMode : Win32cr::Graphics::GdiPlus::WrapMode, lineGradient : Win32cr::Graphics::GdiPlus::GpLineGradient**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateLineBrushFromRectI(rect, color1, color2, mode, wrapMode, lineGradient)
    {% end %}
  end

  def gdipCreateLineBrushFromRectWithAngle(rect : Win32cr::Graphics::GdiPlus::RectF*, color1 : UInt32, color2 : UInt32, angle : Float32, isAngleScalable : Win32cr::Foundation::BOOL, wrapMode : Win32cr::Graphics::GdiPlus::WrapMode, lineGradient : Win32cr::Graphics::GdiPlus::GpLineGradient**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateLineBrushFromRectWithAngle(rect, color1, color2, angle, isAngleScalable, wrapMode, lineGradient)
    {% end %}
  end

  def gdipCreateLineBrushFromRectWithAngleI(rect : Win32cr::Graphics::GdiPlus::Rect*, color1 : UInt32, color2 : UInt32, angle : Float32, isAngleScalable : Win32cr::Foundation::BOOL, wrapMode : Win32cr::Graphics::GdiPlus::WrapMode, lineGradient : Win32cr::Graphics::GdiPlus::GpLineGradient**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateLineBrushFromRectWithAngleI(rect, color1, color2, angle, isAngleScalable, wrapMode, lineGradient)
    {% end %}
  end

  def gdipSetLineColors(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, color1 : UInt32, color2 : UInt32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetLineColors(brush, color1, color2)
    {% end %}
  end

  def gdipGetLineColors(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, colors : UInt32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetLineColors(brush, colors)
    {% end %}
  end

  def gdipGetLineRect(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, rect : Win32cr::Graphics::GdiPlus::RectF*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetLineRect(brush, rect)
    {% end %}
  end

  def gdipGetLineRectI(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, rect : Win32cr::Graphics::GdiPlus::Rect*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetLineRectI(brush, rect)
    {% end %}
  end

  def gdipSetLineGammaCorrection(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, useGammaCorrection : Win32cr::Foundation::BOOL) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetLineGammaCorrection(brush, useGammaCorrection)
    {% end %}
  end

  def gdipGetLineGammaCorrection(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, useGammaCorrection : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetLineGammaCorrection(brush, useGammaCorrection)
    {% end %}
  end

  def gdipGetLineBlendCount(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, count : Int32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetLineBlendCount(brush, count)
    {% end %}
  end

  def gdipGetLineBlend(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, blend : Float32*, positions : Float32*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetLineBlend(brush, blend, positions, count)
    {% end %}
  end

  def gdipSetLineBlend(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, blend : Float32*, positions : Float32*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetLineBlend(brush, blend, positions, count)
    {% end %}
  end

  def gdipGetLinePresetBlendCount(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, count : Int32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetLinePresetBlendCount(brush, count)
    {% end %}
  end

  def gdipGetLinePresetBlend(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, blend : UInt32*, positions : Float32*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetLinePresetBlend(brush, blend, positions, count)
    {% end %}
  end

  def gdipSetLinePresetBlend(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, blend : UInt32*, positions : Float32*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetLinePresetBlend(brush, blend, positions, count)
    {% end %}
  end

  def gdipSetLineSigmaBlend(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, focus : Float32, scale : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetLineSigmaBlend(brush, focus, scale)
    {% end %}
  end

  def gdipSetLineLinearBlend(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, focus : Float32, scale : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetLineLinearBlend(brush, focus, scale)
    {% end %}
  end

  def gdipSetLineWrapMode(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, wrapmode : Win32cr::Graphics::GdiPlus::WrapMode) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetLineWrapMode(brush, wrapmode)
    {% end %}
  end

  def gdipGetLineWrapMode(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, wrapmode : Win32cr::Graphics::GdiPlus::WrapMode*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetLineWrapMode(brush, wrapmode)
    {% end %}
  end

  def gdipGetLineTransform(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, matrix : Win32cr::Graphics::GdiPlus::Matrix*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetLineTransform(brush, matrix)
    {% end %}
  end

  def gdipSetLineTransform(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, matrix : Win32cr::Graphics::GdiPlus::Matrix*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetLineTransform(brush, matrix)
    {% end %}
  end

  def gdipResetLineTransform(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipResetLineTransform(brush)
    {% end %}
  end

  def gdipMultiplyLineTransform(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, matrix : Win32cr::Graphics::GdiPlus::Matrix*, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipMultiplyLineTransform(brush, matrix, order)
    {% end %}
  end

  def gdipTranslateLineTransform(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, dx : Float32, dy : Float32, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipTranslateLineTransform(brush, dx, dy, order)
    {% end %}
  end

  def gdipScaleLineTransform(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, sx : Float32, sy : Float32, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipScaleLineTransform(brush, sx, sy, order)
    {% end %}
  end

  def gdipRotateLineTransform(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, angle : Float32, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipRotateLineTransform(brush, angle, order)
    {% end %}
  end

  def gdipCreatePathGradient(points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32, wrapMode : Win32cr::Graphics::GdiPlus::WrapMode, polyGradient : Win32cr::Graphics::GdiPlus::GpPathGradient**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreatePathGradient(points, count, wrapMode, polyGradient)
    {% end %}
  end

  def gdipCreatePathGradientI(points : Win32cr::Graphics::GdiPlus::Point*, count : Int32, wrapMode : Win32cr::Graphics::GdiPlus::WrapMode, polyGradient : Win32cr::Graphics::GdiPlus::GpPathGradient**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreatePathGradientI(points, count, wrapMode, polyGradient)
    {% end %}
  end

  def gdipCreatePathGradientFromPath(path : Win32cr::Graphics::GdiPlus::GpPath*, polyGradient : Win32cr::Graphics::GdiPlus::GpPathGradient**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreatePathGradientFromPath(path, polyGradient)
    {% end %}
  end

  def gdipGetPathGradientCenterColor(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, colors : UInt32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPathGradientCenterColor(brush, colors)
    {% end %}
  end

  def gdipSetPathGradientCenterColor(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, colors : UInt32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetPathGradientCenterColor(brush, colors)
    {% end %}
  end

  def gdipGetPathGradientSurroundColorsWithCount(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, color : UInt32*, count : Int32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPathGradientSurroundColorsWithCount(brush, color, count)
    {% end %}
  end

  def gdipSetPathGradientSurroundColorsWithCount(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, color : UInt32*, count : Int32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetPathGradientSurroundColorsWithCount(brush, color, count)
    {% end %}
  end

  def gdipGetPathGradientPath(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, path : Win32cr::Graphics::GdiPlus::GpPath*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPathGradientPath(brush, path)
    {% end %}
  end

  def gdipSetPathGradientPath(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, path : Win32cr::Graphics::GdiPlus::GpPath*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetPathGradientPath(brush, path)
    {% end %}
  end

  def gdipGetPathGradientCenterPoint(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, points : Win32cr::Graphics::GdiPlus::PointF*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPathGradientCenterPoint(brush, points)
    {% end %}
  end

  def gdipGetPathGradientCenterPointI(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, points : Win32cr::Graphics::GdiPlus::Point*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPathGradientCenterPointI(brush, points)
    {% end %}
  end

  def gdipSetPathGradientCenterPoint(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, points : Win32cr::Graphics::GdiPlus::PointF*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetPathGradientCenterPoint(brush, points)
    {% end %}
  end

  def gdipSetPathGradientCenterPointI(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, points : Win32cr::Graphics::GdiPlus::Point*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetPathGradientCenterPointI(brush, points)
    {% end %}
  end

  def gdipGetPathGradientRect(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, rect : Win32cr::Graphics::GdiPlus::RectF*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPathGradientRect(brush, rect)
    {% end %}
  end

  def gdipGetPathGradientRectI(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, rect : Win32cr::Graphics::GdiPlus::Rect*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPathGradientRectI(brush, rect)
    {% end %}
  end

  def gdipGetPathGradientPointCount(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, count : Int32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPathGradientPointCount(brush, count)
    {% end %}
  end

  def gdipGetPathGradientSurroundColorCount(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, count : Int32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPathGradientSurroundColorCount(brush, count)
    {% end %}
  end

  def gdipSetPathGradientGammaCorrection(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, useGammaCorrection : Win32cr::Foundation::BOOL) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetPathGradientGammaCorrection(brush, useGammaCorrection)
    {% end %}
  end

  def gdipGetPathGradientGammaCorrection(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, useGammaCorrection : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPathGradientGammaCorrection(brush, useGammaCorrection)
    {% end %}
  end

  def gdipGetPathGradientBlendCount(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, count : Int32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPathGradientBlendCount(brush, count)
    {% end %}
  end

  def gdipGetPathGradientBlend(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, blend : Float32*, positions : Float32*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPathGradientBlend(brush, blend, positions, count)
    {% end %}
  end

  def gdipSetPathGradientBlend(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, blend : Float32*, positions : Float32*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetPathGradientBlend(brush, blend, positions, count)
    {% end %}
  end

  def gdipGetPathGradientPresetBlendCount(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, count : Int32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPathGradientPresetBlendCount(brush, count)
    {% end %}
  end

  def gdipGetPathGradientPresetBlend(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, blend : UInt32*, positions : Float32*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPathGradientPresetBlend(brush, blend, positions, count)
    {% end %}
  end

  def gdipSetPathGradientPresetBlend(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, blend : UInt32*, positions : Float32*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetPathGradientPresetBlend(brush, blend, positions, count)
    {% end %}
  end

  def gdipSetPathGradientSigmaBlend(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, focus : Float32, scale : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetPathGradientSigmaBlend(brush, focus, scale)
    {% end %}
  end

  def gdipSetPathGradientLinearBlend(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, focus : Float32, scale : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetPathGradientLinearBlend(brush, focus, scale)
    {% end %}
  end

  def gdipGetPathGradientWrapMode(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, wrapmode : Win32cr::Graphics::GdiPlus::WrapMode*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPathGradientWrapMode(brush, wrapmode)
    {% end %}
  end

  def gdipSetPathGradientWrapMode(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, wrapmode : Win32cr::Graphics::GdiPlus::WrapMode) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetPathGradientWrapMode(brush, wrapmode)
    {% end %}
  end

  def gdipGetPathGradientTransform(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, matrix : Win32cr::Graphics::GdiPlus::Matrix*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPathGradientTransform(brush, matrix)
    {% end %}
  end

  def gdipSetPathGradientTransform(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, matrix : Win32cr::Graphics::GdiPlus::Matrix*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetPathGradientTransform(brush, matrix)
    {% end %}
  end

  def gdipResetPathGradientTransform(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipResetPathGradientTransform(brush)
    {% end %}
  end

  def gdipMultiplyPathGradientTransform(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, matrix : Win32cr::Graphics::GdiPlus::Matrix*, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipMultiplyPathGradientTransform(brush, matrix, order)
    {% end %}
  end

  def gdipTranslatePathGradientTransform(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, dx : Float32, dy : Float32, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipTranslatePathGradientTransform(brush, dx, dy, order)
    {% end %}
  end

  def gdipScalePathGradientTransform(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, sx : Float32, sy : Float32, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipScalePathGradientTransform(brush, sx, sy, order)
    {% end %}
  end

  def gdipRotatePathGradientTransform(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, angle : Float32, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipRotatePathGradientTransform(brush, angle, order)
    {% end %}
  end

  def gdipGetPathGradientFocusScales(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, xScale : Float32*, yScale : Float32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPathGradientFocusScales(brush, xScale, yScale)
    {% end %}
  end

  def gdipSetPathGradientFocusScales(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, xScale : Float32, yScale : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetPathGradientFocusScales(brush, xScale, yScale)
    {% end %}
  end

  def gdipCreatePen1(color : UInt32, width : Float32, unit : Win32cr::Graphics::GdiPlus::Unit, pen : Win32cr::Graphics::GdiPlus::GpPen**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreatePen1(color, width, unit, pen)
    {% end %}
  end

  def gdipCreatePen2(brush : Win32cr::Graphics::GdiPlus::GpBrush*, width : Float32, unit : Win32cr::Graphics::GdiPlus::Unit, pen : Win32cr::Graphics::GdiPlus::GpPen**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreatePen2(brush, width, unit, pen)
    {% end %}
  end

  def gdipClonePen(pen : Win32cr::Graphics::GdiPlus::GpPen*, clonepen : Win32cr::Graphics::GdiPlus::GpPen**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipClonePen(pen, clonepen)
    {% end %}
  end

  def gdipDeletePen(pen : Win32cr::Graphics::GdiPlus::GpPen*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDeletePen(pen)
    {% end %}
  end

  def gdipSetPenWidth(pen : Win32cr::Graphics::GdiPlus::GpPen*, width : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetPenWidth(pen, width)
    {% end %}
  end

  def gdipGetPenWidth(pen : Win32cr::Graphics::GdiPlus::GpPen*, width : Float32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPenWidth(pen, width)
    {% end %}
  end

  def gdipSetPenUnit(pen : Win32cr::Graphics::GdiPlus::GpPen*, unit : Win32cr::Graphics::GdiPlus::Unit) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetPenUnit(pen, unit)
    {% end %}
  end

  def gdipGetPenUnit(pen : Win32cr::Graphics::GdiPlus::GpPen*, unit : Win32cr::Graphics::GdiPlus::Unit*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPenUnit(pen, unit)
    {% end %}
  end

  def gdipSetPenLineCap197819(pen : Win32cr::Graphics::GdiPlus::GpPen*, startCap : Win32cr::Graphics::GdiPlus::LineCap, endCap : Win32cr::Graphics::GdiPlus::LineCap, dashCap : Win32cr::Graphics::GdiPlus::DashCap) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetPenLineCap197819(pen, startCap, endCap, dashCap)
    {% end %}
  end

  def gdipSetPenStartCap(pen : Win32cr::Graphics::GdiPlus::GpPen*, startCap : Win32cr::Graphics::GdiPlus::LineCap) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetPenStartCap(pen, startCap)
    {% end %}
  end

  def gdipSetPenEndCap(pen : Win32cr::Graphics::GdiPlus::GpPen*, endCap : Win32cr::Graphics::GdiPlus::LineCap) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetPenEndCap(pen, endCap)
    {% end %}
  end

  def gdipSetPenDashCap197819(pen : Win32cr::Graphics::GdiPlus::GpPen*, dashCap : Win32cr::Graphics::GdiPlus::DashCap) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetPenDashCap197819(pen, dashCap)
    {% end %}
  end

  def gdipGetPenStartCap(pen : Win32cr::Graphics::GdiPlus::GpPen*, startCap : Win32cr::Graphics::GdiPlus::LineCap*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPenStartCap(pen, startCap)
    {% end %}
  end

  def gdipGetPenEndCap(pen : Win32cr::Graphics::GdiPlus::GpPen*, endCap : Win32cr::Graphics::GdiPlus::LineCap*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPenEndCap(pen, endCap)
    {% end %}
  end

  def gdipGetPenDashCap197819(pen : Win32cr::Graphics::GdiPlus::GpPen*, dashCap : Win32cr::Graphics::GdiPlus::DashCap*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPenDashCap197819(pen, dashCap)
    {% end %}
  end

  def gdipSetPenLineJoin(pen : Win32cr::Graphics::GdiPlus::GpPen*, lineJoin : Win32cr::Graphics::GdiPlus::LineJoin) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetPenLineJoin(pen, lineJoin)
    {% end %}
  end

  def gdipGetPenLineJoin(pen : Win32cr::Graphics::GdiPlus::GpPen*, lineJoin : Win32cr::Graphics::GdiPlus::LineJoin*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPenLineJoin(pen, lineJoin)
    {% end %}
  end

  def gdipSetPenCustomStartCap(pen : Win32cr::Graphics::GdiPlus::GpPen*, customCap : Win32cr::Graphics::GdiPlus::GpCustomLineCap*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetPenCustomStartCap(pen, customCap)
    {% end %}
  end

  def gdipGetPenCustomStartCap(pen : Win32cr::Graphics::GdiPlus::GpPen*, customCap : Win32cr::Graphics::GdiPlus::GpCustomLineCap**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPenCustomStartCap(pen, customCap)
    {% end %}
  end

  def gdipSetPenCustomEndCap(pen : Win32cr::Graphics::GdiPlus::GpPen*, customCap : Win32cr::Graphics::GdiPlus::GpCustomLineCap*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetPenCustomEndCap(pen, customCap)
    {% end %}
  end

  def gdipGetPenCustomEndCap(pen : Win32cr::Graphics::GdiPlus::GpPen*, customCap : Win32cr::Graphics::GdiPlus::GpCustomLineCap**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPenCustomEndCap(pen, customCap)
    {% end %}
  end

  def gdipSetPenMiterLimit(pen : Win32cr::Graphics::GdiPlus::GpPen*, miterLimit : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetPenMiterLimit(pen, miterLimit)
    {% end %}
  end

  def gdipGetPenMiterLimit(pen : Win32cr::Graphics::GdiPlus::GpPen*, miterLimit : Float32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPenMiterLimit(pen, miterLimit)
    {% end %}
  end

  def gdipSetPenMode(pen : Win32cr::Graphics::GdiPlus::GpPen*, penMode : Win32cr::Graphics::GdiPlus::PenAlignment) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetPenMode(pen, penMode)
    {% end %}
  end

  def gdipGetPenMode(pen : Win32cr::Graphics::GdiPlus::GpPen*, penMode : Win32cr::Graphics::GdiPlus::PenAlignment*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPenMode(pen, penMode)
    {% end %}
  end

  def gdipSetPenTransform(pen : Win32cr::Graphics::GdiPlus::GpPen*, matrix : Win32cr::Graphics::GdiPlus::Matrix*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetPenTransform(pen, matrix)
    {% end %}
  end

  def gdipGetPenTransform(pen : Win32cr::Graphics::GdiPlus::GpPen*, matrix : Win32cr::Graphics::GdiPlus::Matrix*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPenTransform(pen, matrix)
    {% end %}
  end

  def gdipResetPenTransform(pen : Win32cr::Graphics::GdiPlus::GpPen*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipResetPenTransform(pen)
    {% end %}
  end

  def gdipMultiplyPenTransform(pen : Win32cr::Graphics::GdiPlus::GpPen*, matrix : Win32cr::Graphics::GdiPlus::Matrix*, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipMultiplyPenTransform(pen, matrix, order)
    {% end %}
  end

  def gdipTranslatePenTransform(pen : Win32cr::Graphics::GdiPlus::GpPen*, dx : Float32, dy : Float32, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipTranslatePenTransform(pen, dx, dy, order)
    {% end %}
  end

  def gdipScalePenTransform(pen : Win32cr::Graphics::GdiPlus::GpPen*, sx : Float32, sy : Float32, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipScalePenTransform(pen, sx, sy, order)
    {% end %}
  end

  def gdipRotatePenTransform(pen : Win32cr::Graphics::GdiPlus::GpPen*, angle : Float32, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipRotatePenTransform(pen, angle, order)
    {% end %}
  end

  def gdipSetPenColor(pen : Win32cr::Graphics::GdiPlus::GpPen*, argb : UInt32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetPenColor(pen, argb)
    {% end %}
  end

  def gdipGetPenColor(pen : Win32cr::Graphics::GdiPlus::GpPen*, argb : UInt32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPenColor(pen, argb)
    {% end %}
  end

  def gdipSetPenBrushFill(pen : Win32cr::Graphics::GdiPlus::GpPen*, brush : Win32cr::Graphics::GdiPlus::GpBrush*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetPenBrushFill(pen, brush)
    {% end %}
  end

  def gdipGetPenBrushFill(pen : Win32cr::Graphics::GdiPlus::GpPen*, brush : Win32cr::Graphics::GdiPlus::GpBrush**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPenBrushFill(pen, brush)
    {% end %}
  end

  def gdipGetPenFillType(pen : Win32cr::Graphics::GdiPlus::GpPen*, type__ : Win32cr::Graphics::GdiPlus::PenType*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPenFillType(pen, type__)
    {% end %}
  end

  def gdipGetPenDashStyle(pen : Win32cr::Graphics::GdiPlus::GpPen*, dashstyle : Win32cr::Graphics::GdiPlus::DashStyle*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPenDashStyle(pen, dashstyle)
    {% end %}
  end

  def gdipSetPenDashStyle(pen : Win32cr::Graphics::GdiPlus::GpPen*, dashstyle : Win32cr::Graphics::GdiPlus::DashStyle) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetPenDashStyle(pen, dashstyle)
    {% end %}
  end

  def gdipGetPenDashOffset(pen : Win32cr::Graphics::GdiPlus::GpPen*, offset : Float32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPenDashOffset(pen, offset)
    {% end %}
  end

  def gdipSetPenDashOffset(pen : Win32cr::Graphics::GdiPlus::GpPen*, offset : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetPenDashOffset(pen, offset)
    {% end %}
  end

  def gdipGetPenDashCount(pen : Win32cr::Graphics::GdiPlus::GpPen*, count : Int32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPenDashCount(pen, count)
    {% end %}
  end

  def gdipSetPenDashArray(pen : Win32cr::Graphics::GdiPlus::GpPen*, dash : Float32*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetPenDashArray(pen, dash, count)
    {% end %}
  end

  def gdipGetPenDashArray(pen : Win32cr::Graphics::GdiPlus::GpPen*, dash : Float32*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPenDashArray(pen, dash, count)
    {% end %}
  end

  def gdipGetPenCompoundCount(pen : Win32cr::Graphics::GdiPlus::GpPen*, count : Int32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPenCompoundCount(pen, count)
    {% end %}
  end

  def gdipSetPenCompoundArray(pen : Win32cr::Graphics::GdiPlus::GpPen*, dash : Float32*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetPenCompoundArray(pen, dash, count)
    {% end %}
  end

  def gdipGetPenCompoundArray(pen : Win32cr::Graphics::GdiPlus::GpPen*, dash : Float32*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPenCompoundArray(pen, dash, count)
    {% end %}
  end

  def gdipCreateCustomLineCap(fillPath : Win32cr::Graphics::GdiPlus::GpPath*, strokePath : Win32cr::Graphics::GdiPlus::GpPath*, baseCap : Win32cr::Graphics::GdiPlus::LineCap, baseInset : Float32, customCap : Win32cr::Graphics::GdiPlus::GpCustomLineCap**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateCustomLineCap(fillPath, strokePath, baseCap, baseInset, customCap)
    {% end %}
  end

  def gdipDeleteCustomLineCap(customCap : Win32cr::Graphics::GdiPlus::GpCustomLineCap*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDeleteCustomLineCap(customCap)
    {% end %}
  end

  def gdipCloneCustomLineCap(customCap : Win32cr::Graphics::GdiPlus::GpCustomLineCap*, clonedCap : Win32cr::Graphics::GdiPlus::GpCustomLineCap**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCloneCustomLineCap(customCap, clonedCap)
    {% end %}
  end

  def gdipGetCustomLineCapType(customCap : Win32cr::Graphics::GdiPlus::GpCustomLineCap*, capType : Win32cr::Graphics::GdiPlus::CustomLineCapType*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetCustomLineCapType(customCap, capType)
    {% end %}
  end

  def gdipSetCustomLineCapStrokeCaps(customCap : Win32cr::Graphics::GdiPlus::GpCustomLineCap*, startCap : Win32cr::Graphics::GdiPlus::LineCap, endCap : Win32cr::Graphics::GdiPlus::LineCap) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetCustomLineCapStrokeCaps(customCap, startCap, endCap)
    {% end %}
  end

  def gdipGetCustomLineCapStrokeCaps(customCap : Win32cr::Graphics::GdiPlus::GpCustomLineCap*, startCap : Win32cr::Graphics::GdiPlus::LineCap*, endCap : Win32cr::Graphics::GdiPlus::LineCap*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetCustomLineCapStrokeCaps(customCap, startCap, endCap)
    {% end %}
  end

  def gdipSetCustomLineCapStrokeJoin(customCap : Win32cr::Graphics::GdiPlus::GpCustomLineCap*, lineJoin : Win32cr::Graphics::GdiPlus::LineJoin) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetCustomLineCapStrokeJoin(customCap, lineJoin)
    {% end %}
  end

  def gdipGetCustomLineCapStrokeJoin(customCap : Win32cr::Graphics::GdiPlus::GpCustomLineCap*, lineJoin : Win32cr::Graphics::GdiPlus::LineJoin*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetCustomLineCapStrokeJoin(customCap, lineJoin)
    {% end %}
  end

  def gdipSetCustomLineCapBaseCap(customCap : Win32cr::Graphics::GdiPlus::GpCustomLineCap*, baseCap : Win32cr::Graphics::GdiPlus::LineCap) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetCustomLineCapBaseCap(customCap, baseCap)
    {% end %}
  end

  def gdipGetCustomLineCapBaseCap(customCap : Win32cr::Graphics::GdiPlus::GpCustomLineCap*, baseCap : Win32cr::Graphics::GdiPlus::LineCap*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetCustomLineCapBaseCap(customCap, baseCap)
    {% end %}
  end

  def gdipSetCustomLineCapBaseInset(customCap : Win32cr::Graphics::GdiPlus::GpCustomLineCap*, inset : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetCustomLineCapBaseInset(customCap, inset)
    {% end %}
  end

  def gdipGetCustomLineCapBaseInset(customCap : Win32cr::Graphics::GdiPlus::GpCustomLineCap*, inset : Float32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetCustomLineCapBaseInset(customCap, inset)
    {% end %}
  end

  def gdipSetCustomLineCapWidthScale(customCap : Win32cr::Graphics::GdiPlus::GpCustomLineCap*, widthScale : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetCustomLineCapWidthScale(customCap, widthScale)
    {% end %}
  end

  def gdipGetCustomLineCapWidthScale(customCap : Win32cr::Graphics::GdiPlus::GpCustomLineCap*, widthScale : Float32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetCustomLineCapWidthScale(customCap, widthScale)
    {% end %}
  end

  def gdipCreateAdjustableArrowCap(height : Float32, width : Float32, isFilled : Win32cr::Foundation::BOOL, cap : Win32cr::Graphics::GdiPlus::GpAdjustableArrowCap**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateAdjustableArrowCap(height, width, isFilled, cap)
    {% end %}
  end

  def gdipSetAdjustableArrowCapHeight(cap : Win32cr::Graphics::GdiPlus::GpAdjustableArrowCap*, height : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetAdjustableArrowCapHeight(cap, height)
    {% end %}
  end

  def gdipGetAdjustableArrowCapHeight(cap : Win32cr::Graphics::GdiPlus::GpAdjustableArrowCap*, height : Float32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetAdjustableArrowCapHeight(cap, height)
    {% end %}
  end

  def gdipSetAdjustableArrowCapWidth(cap : Win32cr::Graphics::GdiPlus::GpAdjustableArrowCap*, width : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetAdjustableArrowCapWidth(cap, width)
    {% end %}
  end

  def gdipGetAdjustableArrowCapWidth(cap : Win32cr::Graphics::GdiPlus::GpAdjustableArrowCap*, width : Float32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetAdjustableArrowCapWidth(cap, width)
    {% end %}
  end

  def gdipSetAdjustableArrowCapMiddleInset(cap : Win32cr::Graphics::GdiPlus::GpAdjustableArrowCap*, middleInset : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetAdjustableArrowCapMiddleInset(cap, middleInset)
    {% end %}
  end

  def gdipGetAdjustableArrowCapMiddleInset(cap : Win32cr::Graphics::GdiPlus::GpAdjustableArrowCap*, middleInset : Float32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetAdjustableArrowCapMiddleInset(cap, middleInset)
    {% end %}
  end

  def gdipSetAdjustableArrowCapFillState(cap : Win32cr::Graphics::GdiPlus::GpAdjustableArrowCap*, fillState : Win32cr::Foundation::BOOL) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetAdjustableArrowCapFillState(cap, fillState)
    {% end %}
  end

  def gdipGetAdjustableArrowCapFillState(cap : Win32cr::Graphics::GdiPlus::GpAdjustableArrowCap*, fillState : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetAdjustableArrowCapFillState(cap, fillState)
    {% end %}
  end

  def gdipLoadImageFromStream(stream : Void*, image : Win32cr::Graphics::GdiPlus::GpImage**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipLoadImageFromStream(stream, image)
    {% end %}
  end

  def gdipLoadImageFromFile(filename : Win32cr::Foundation::PWSTR, image : Win32cr::Graphics::GdiPlus::GpImage**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipLoadImageFromFile(filename, image)
    {% end %}
  end

  def gdipLoadImageFromStreamICM(stream : Void*, image : Win32cr::Graphics::GdiPlus::GpImage**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipLoadImageFromStreamICM(stream, image)
    {% end %}
  end

  def gdipLoadImageFromFileICM(filename : Win32cr::Foundation::PWSTR, image : Win32cr::Graphics::GdiPlus::GpImage**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipLoadImageFromFileICM(filename, image)
    {% end %}
  end

  def gdipCloneImage(image : Win32cr::Graphics::GdiPlus::GpImage*, cloneImage : Win32cr::Graphics::GdiPlus::GpImage**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCloneImage(image, cloneImage)
    {% end %}
  end

  def gdipDisposeImage(image : Win32cr::Graphics::GdiPlus::GpImage*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDisposeImage(image)
    {% end %}
  end

  def gdipSaveImageToFile(image : Win32cr::Graphics::GdiPlus::GpImage*, filename : Win32cr::Foundation::PWSTR, clsidEncoder : LibC::GUID*, encoderParams : Win32cr::Graphics::GdiPlus::EncoderParameters*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSaveImageToFile(image, filename, clsidEncoder, encoderParams)
    {% end %}
  end

  def gdipSaveImageToStream(image : Win32cr::Graphics::GdiPlus::GpImage*, stream : Void*, clsidEncoder : LibC::GUID*, encoderParams : Win32cr::Graphics::GdiPlus::EncoderParameters*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSaveImageToStream(image, stream, clsidEncoder, encoderParams)
    {% end %}
  end

  def gdipSaveAdd(image : Win32cr::Graphics::GdiPlus::GpImage*, encoderParams : Win32cr::Graphics::GdiPlus::EncoderParameters*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSaveAdd(image, encoderParams)
    {% end %}
  end

  def gdipSaveAddImage(image : Win32cr::Graphics::GdiPlus::GpImage*, newImage : Win32cr::Graphics::GdiPlus::GpImage*, encoderParams : Win32cr::Graphics::GdiPlus::EncoderParameters*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSaveAddImage(image, newImage, encoderParams)
    {% end %}
  end

  def gdipGetImageGraphicsContext(image : Win32cr::Graphics::GdiPlus::GpImage*, graphics : Win32cr::Graphics::GdiPlus::GpGraphics**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetImageGraphicsContext(image, graphics)
    {% end %}
  end

  def gdipGetImageBounds(image : Win32cr::Graphics::GdiPlus::GpImage*, srcRect : Win32cr::Graphics::GdiPlus::RectF*, srcUnit : Win32cr::Graphics::GdiPlus::Unit*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetImageBounds(image, srcRect, srcUnit)
    {% end %}
  end

  def gdipGetImageDimension(image : Win32cr::Graphics::GdiPlus::GpImage*, width : Float32*, height : Float32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetImageDimension(image, width, height)
    {% end %}
  end

  def gdipGetImageType(image : Win32cr::Graphics::GdiPlus::GpImage*, type__ : Win32cr::Graphics::GdiPlus::ImageType*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetImageType(image, type__)
    {% end %}
  end

  def gdipGetImageWidth(image : Win32cr::Graphics::GdiPlus::GpImage*, width : UInt32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetImageWidth(image, width)
    {% end %}
  end

  def gdipGetImageHeight(image : Win32cr::Graphics::GdiPlus::GpImage*, height : UInt32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetImageHeight(image, height)
    {% end %}
  end

  def gdipGetImageHorizontalResolution(image : Win32cr::Graphics::GdiPlus::GpImage*, resolution : Float32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetImageHorizontalResolution(image, resolution)
    {% end %}
  end

  def gdipGetImageVerticalResolution(image : Win32cr::Graphics::GdiPlus::GpImage*, resolution : Float32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetImageVerticalResolution(image, resolution)
    {% end %}
  end

  def gdipGetImageFlags(image : Win32cr::Graphics::GdiPlus::GpImage*, flags : UInt32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetImageFlags(image, flags)
    {% end %}
  end

  def gdipGetImageRawFormat(image : Win32cr::Graphics::GdiPlus::GpImage*, format : LibC::GUID*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetImageRawFormat(image, format)
    {% end %}
  end

  def gdipGetImagePixelFormat(image : Win32cr::Graphics::GdiPlus::GpImage*, format : Int32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetImagePixelFormat(image, format)
    {% end %}
  end

  def gdipGetImageThumbnail(image : Win32cr::Graphics::GdiPlus::GpImage*, thumbWidth : UInt32, thumbHeight : UInt32, thumbImage : Win32cr::Graphics::GdiPlus::GpImage**, callback : LibC::IntPtrT, callbackData : Void*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetImageThumbnail(image, thumbWidth, thumbHeight, thumbImage, callback, callbackData)
    {% end %}
  end

  def gdipGetEncoderParameterListSize(image : Win32cr::Graphics::GdiPlus::GpImage*, clsidEncoder : LibC::GUID*, size : UInt32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetEncoderParameterListSize(image, clsidEncoder, size)
    {% end %}
  end

  def gdipGetEncoderParameterList(image : Win32cr::Graphics::GdiPlus::GpImage*, clsidEncoder : LibC::GUID*, size : UInt32, buffer : Win32cr::Graphics::GdiPlus::EncoderParameters*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetEncoderParameterList(image, clsidEncoder, size, buffer)
    {% end %}
  end

  def gdipImageGetFrameDimensionsCount(image : Win32cr::Graphics::GdiPlus::GpImage*, count : UInt32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipImageGetFrameDimensionsCount(image, count)
    {% end %}
  end

  def gdipImageGetFrameDimensionsList(image : Win32cr::Graphics::GdiPlus::GpImage*, dimensionIDs : LibC::GUID*, count : UInt32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipImageGetFrameDimensionsList(image, dimensionIDs, count)
    {% end %}
  end

  def gdipImageGetFrameCount(image : Win32cr::Graphics::GdiPlus::GpImage*, dimensionID : LibC::GUID*, count : UInt32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipImageGetFrameCount(image, dimensionID, count)
    {% end %}
  end

  def gdipImageSelectActiveFrame(image : Win32cr::Graphics::GdiPlus::GpImage*, dimensionID : LibC::GUID*, frameIndex : UInt32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipImageSelectActiveFrame(image, dimensionID, frameIndex)
    {% end %}
  end

  def gdipImageRotateFlip(image : Win32cr::Graphics::GdiPlus::GpImage*, rfType : Win32cr::Graphics::GdiPlus::RotateFlipType) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipImageRotateFlip(image, rfType)
    {% end %}
  end

  def gdipGetImagePalette(image : Win32cr::Graphics::GdiPlus::GpImage*, palette : Win32cr::Graphics::GdiPlus::ColorPalette*, size : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetImagePalette(image, palette, size)
    {% end %}
  end

  def gdipSetImagePalette(image : Win32cr::Graphics::GdiPlus::GpImage*, palette : Win32cr::Graphics::GdiPlus::ColorPalette*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetImagePalette(image, palette)
    {% end %}
  end

  def gdipGetImagePaletteSize(image : Win32cr::Graphics::GdiPlus::GpImage*, size : Int32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetImagePaletteSize(image, size)
    {% end %}
  end

  def gdipGetPropertyCount(image : Win32cr::Graphics::GdiPlus::GpImage*, numOfProperty : UInt32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPropertyCount(image, numOfProperty)
    {% end %}
  end

  def gdipGetPropertyIdList(image : Win32cr::Graphics::GdiPlus::GpImage*, numOfProperty : UInt32, list : UInt32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPropertyIdList(image, numOfProperty, list)
    {% end %}
  end

  def gdipGetPropertyItemSize(image : Win32cr::Graphics::GdiPlus::GpImage*, propId : UInt32, size : UInt32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPropertyItemSize(image, propId, size)
    {% end %}
  end

  def gdipGetPropertyItem(image : Win32cr::Graphics::GdiPlus::GpImage*, propId : UInt32, propSize : UInt32, buffer : Win32cr::Graphics::GdiPlus::PropertyItem*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPropertyItem(image, propId, propSize, buffer)
    {% end %}
  end

  def gdipGetPropertySize(image : Win32cr::Graphics::GdiPlus::GpImage*, totalBufferSize : UInt32*, numProperties : UInt32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPropertySize(image, totalBufferSize, numProperties)
    {% end %}
  end

  def gdipGetAllPropertyItems(image : Win32cr::Graphics::GdiPlus::GpImage*, totalBufferSize : UInt32, numProperties : UInt32, allItems : Win32cr::Graphics::GdiPlus::PropertyItem*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetAllPropertyItems(image, totalBufferSize, numProperties, allItems)
    {% end %}
  end

  def gdipRemovePropertyItem(image : Win32cr::Graphics::GdiPlus::GpImage*, propId : UInt32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipRemovePropertyItem(image, propId)
    {% end %}
  end

  def gdipSetPropertyItem(image : Win32cr::Graphics::GdiPlus::GpImage*, item : Win32cr::Graphics::GdiPlus::PropertyItem*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetPropertyItem(image, item)
    {% end %}
  end

  def gdipFindFirstImageItem(image : Win32cr::Graphics::GdiPlus::GpImage*, item : Win32cr::Graphics::GdiPlus::ImageItemData*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipFindFirstImageItem(image, item)
    {% end %}
  end

  def gdipFindNextImageItem(image : Win32cr::Graphics::GdiPlus::GpImage*, item : Win32cr::Graphics::GdiPlus::ImageItemData*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipFindNextImageItem(image, item)
    {% end %}
  end

  def gdipGetImageItemData(image : Win32cr::Graphics::GdiPlus::GpImage*, item : Win32cr::Graphics::GdiPlus::ImageItemData*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetImageItemData(image, item)
    {% end %}
  end

  def gdipImageForceValidation(image : Win32cr::Graphics::GdiPlus::GpImage*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipImageForceValidation(image)
    {% end %}
  end

  def gdipCreateBitmapFromStream(stream : Void*, bitmap : Win32cr::Graphics::GdiPlus::GpBitmap**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateBitmapFromStream(stream, bitmap)
    {% end %}
  end

  def gdipCreateBitmapFromFile(filename : Win32cr::Foundation::PWSTR, bitmap : Win32cr::Graphics::GdiPlus::GpBitmap**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateBitmapFromFile(filename, bitmap)
    {% end %}
  end

  def gdipCreateBitmapFromStreamICM(stream : Void*, bitmap : Win32cr::Graphics::GdiPlus::GpBitmap**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateBitmapFromStreamICM(stream, bitmap)
    {% end %}
  end

  def gdipCreateBitmapFromFileICM(filename : Win32cr::Foundation::PWSTR, bitmap : Win32cr::Graphics::GdiPlus::GpBitmap**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateBitmapFromFileICM(filename, bitmap)
    {% end %}
  end

  def gdipCreateBitmapFromScan0(width : Int32, height : Int32, stride : Int32, format : Int32, scan0 : UInt8*, bitmap : Win32cr::Graphics::GdiPlus::GpBitmap**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateBitmapFromScan0(width, height, stride, format, scan0, bitmap)
    {% end %}
  end

  def gdipCreateBitmapFromGraphics(width : Int32, height : Int32, target : Win32cr::Graphics::GdiPlus::GpGraphics*, bitmap : Win32cr::Graphics::GdiPlus::GpBitmap**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateBitmapFromGraphics(width, height, target, bitmap)
    {% end %}
  end

  def gdipCreateBitmapFromDirectDrawSurface(surface : Void*, bitmap : Win32cr::Graphics::GdiPlus::GpBitmap**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateBitmapFromDirectDrawSurface(surface, bitmap)
    {% end %}
  end

  def gdipCreateBitmapFromGdiDib(gdiBitmapInfo : Win32cr::Graphics::Gdi::BITMAPINFO*, gdiBitmapData : Void*, bitmap : Win32cr::Graphics::GdiPlus::GpBitmap**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateBitmapFromGdiDib(gdiBitmapInfo, gdiBitmapData, bitmap)
    {% end %}
  end

  def gdipCreateBitmapFromHBITMAP(hbm : Win32cr::Graphics::Gdi::HBITMAP, hpal : Win32cr::Graphics::Gdi::HPALETTE, bitmap : Win32cr::Graphics::GdiPlus::GpBitmap**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateBitmapFromHBITMAP(hbm, hpal, bitmap)
    {% end %}
  end

  def gdipCreateHBITMAPFromBitmap(bitmap : Win32cr::Graphics::GdiPlus::GpBitmap*, hbmReturn : Win32cr::Graphics::Gdi::HBITMAP*, background : UInt32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateHBITMAPFromBitmap(bitmap, hbmReturn, background)
    {% end %}
  end

  def gdipCreateBitmapFromHICON(hicon : Win32cr::UI::WindowsAndMessaging::HICON, bitmap : Win32cr::Graphics::GdiPlus::GpBitmap**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateBitmapFromHICON(hicon, bitmap)
    {% end %}
  end

  def gdipCreateHICONFromBitmap(bitmap : Win32cr::Graphics::GdiPlus::GpBitmap*, hbmReturn : Win32cr::UI::WindowsAndMessaging::HICON*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateHICONFromBitmap(bitmap, hbmReturn)
    {% end %}
  end

  def gdipCreateBitmapFromResource(hInstance : Win32cr::Foundation::HINSTANCE, lpBitmapName : Win32cr::Foundation::PWSTR, bitmap : Win32cr::Graphics::GdiPlus::GpBitmap**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateBitmapFromResource(hInstance, lpBitmapName, bitmap)
    {% end %}
  end

  def gdipCloneBitmapArea(x : Float32, y : Float32, width : Float32, height : Float32, format : Int32, srcBitmap : Win32cr::Graphics::GdiPlus::GpBitmap*, dstBitmap : Win32cr::Graphics::GdiPlus::GpBitmap**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCloneBitmapArea(x, y, width, height, format, srcBitmap, dstBitmap)
    {% end %}
  end

  def gdipCloneBitmapAreaI(x : Int32, y : Int32, width : Int32, height : Int32, format : Int32, srcBitmap : Win32cr::Graphics::GdiPlus::GpBitmap*, dstBitmap : Win32cr::Graphics::GdiPlus::GpBitmap**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCloneBitmapAreaI(x, y, width, height, format, srcBitmap, dstBitmap)
    {% end %}
  end

  def gdipBitmapLockBits(bitmap : Win32cr::Graphics::GdiPlus::GpBitmap*, rect : Win32cr::Graphics::GdiPlus::Rect*, flags : UInt32, format : Int32, lockedBitmapData : Win32cr::Graphics::GdiPlus::BitmapData*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipBitmapLockBits(bitmap, rect, flags, format, lockedBitmapData)
    {% end %}
  end

  def gdipBitmapUnlockBits(bitmap : Win32cr::Graphics::GdiPlus::GpBitmap*, lockedBitmapData : Win32cr::Graphics::GdiPlus::BitmapData*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipBitmapUnlockBits(bitmap, lockedBitmapData)
    {% end %}
  end

  def gdipBitmapGetPixel(bitmap : Win32cr::Graphics::GdiPlus::GpBitmap*, x : Int32, y : Int32, color : UInt32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipBitmapGetPixel(bitmap, x, y, color)
    {% end %}
  end

  def gdipBitmapSetPixel(bitmap : Win32cr::Graphics::GdiPlus::GpBitmap*, x : Int32, y : Int32, color : UInt32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipBitmapSetPixel(bitmap, x, y, color)
    {% end %}
  end

  def gdipImageSetAbort(pImage : Win32cr::Graphics::GdiPlus::GpImage*, pIAbort : Void*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipImageSetAbort(pImage, pIAbort)
    {% end %}
  end

  def gdipGraphicsSetAbort(pGraphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pIAbort : Void*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGraphicsSetAbort(pGraphics, pIAbort)
    {% end %}
  end

  def gdipBitmapConvertFormat(pInputBitmap : Win32cr::Graphics::GdiPlus::GpBitmap*, format : Int32, dithertype : Win32cr::Graphics::GdiPlus::DitherType, palettetype : Win32cr::Graphics::GdiPlus::PaletteType, palette : Win32cr::Graphics::GdiPlus::ColorPalette*, alphaThresholdPercent : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipBitmapConvertFormat(pInputBitmap, format, dithertype, palettetype, palette, alphaThresholdPercent)
    {% end %}
  end

  def gdipInitializePalette(palette : Win32cr::Graphics::GdiPlus::ColorPalette*, palettetype : Win32cr::Graphics::GdiPlus::PaletteType, optimalColors : Int32, useTransparentColor : Win32cr::Foundation::BOOL, bitmap : Win32cr::Graphics::GdiPlus::GpBitmap*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipInitializePalette(palette, palettetype, optimalColors, useTransparentColor, bitmap)
    {% end %}
  end

  def gdipBitmapApplyEffect(bitmap : Win32cr::Graphics::GdiPlus::GpBitmap*, effect : Win32cr::Graphics::GdiPlus::CGpEffect*, roi : Win32cr::Foundation::RECT*, useAuxData : Win32cr::Foundation::BOOL, auxData : Void**, auxDataSize : Int32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipBitmapApplyEffect(bitmap, effect, roi, useAuxData, auxData, auxDataSize)
    {% end %}
  end

  def gdipBitmapCreateApplyEffect(inputBitmaps : Win32cr::Graphics::GdiPlus::GpBitmap**, numInputs : Int32, effect : Win32cr::Graphics::GdiPlus::CGpEffect*, roi : Win32cr::Foundation::RECT*, outputRect : Win32cr::Foundation::RECT*, outputBitmap : Win32cr::Graphics::GdiPlus::GpBitmap**, useAuxData : Win32cr::Foundation::BOOL, auxData : Void**, auxDataSize : Int32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipBitmapCreateApplyEffect(inputBitmaps, numInputs, effect, roi, outputRect, outputBitmap, useAuxData, auxData, auxDataSize)
    {% end %}
  end

  def gdipBitmapGetHistogram(bitmap : Win32cr::Graphics::GdiPlus::GpBitmap*, format : Win32cr::Graphics::GdiPlus::HistogramFormat, number_of_entries : UInt32, channel0 : UInt32*, channel1 : UInt32*, channel2 : UInt32*, channel3 : UInt32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipBitmapGetHistogram(bitmap, format, number_of_entries, channel0, channel1, channel2, channel3)
    {% end %}
  end

  def gdipBitmapGetHistogramSize(format : Win32cr::Graphics::GdiPlus::HistogramFormat, number_of_entries : UInt32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipBitmapGetHistogramSize(format, number_of_entries)
    {% end %}
  end

  def gdipBitmapSetResolution(bitmap : Win32cr::Graphics::GdiPlus::GpBitmap*, xdpi : Float32, ydpi : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipBitmapSetResolution(bitmap, xdpi, ydpi)
    {% end %}
  end

  def gdipCreateImageAttributes(imageattr : Win32cr::Graphics::GdiPlus::GpImageAttributes**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateImageAttributes(imageattr)
    {% end %}
  end

  def gdipCloneImageAttributes(imageattr : Win32cr::Graphics::GdiPlus::GpImageAttributes*, cloneImageattr : Win32cr::Graphics::GdiPlus::GpImageAttributes**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCloneImageAttributes(imageattr, cloneImageattr)
    {% end %}
  end

  def gdipDisposeImageAttributes(imageattr : Win32cr::Graphics::GdiPlus::GpImageAttributes*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDisposeImageAttributes(imageattr)
    {% end %}
  end

  def gdipSetImageAttributesToIdentity(imageattr : Win32cr::Graphics::GdiPlus::GpImageAttributes*, type__ : Win32cr::Graphics::GdiPlus::ColorAdjustType) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetImageAttributesToIdentity(imageattr, type__)
    {% end %}
  end

  def gdipResetImageAttributes(imageattr : Win32cr::Graphics::GdiPlus::GpImageAttributes*, type__ : Win32cr::Graphics::GdiPlus::ColorAdjustType) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipResetImageAttributes(imageattr, type__)
    {% end %}
  end

  def gdipSetImageAttributesColorMatrix(imageattr : Win32cr::Graphics::GdiPlus::GpImageAttributes*, type__ : Win32cr::Graphics::GdiPlus::ColorAdjustType, enableFlag : Win32cr::Foundation::BOOL, colorMatrix : Win32cr::Graphics::GdiPlus::ColorMatrix*, grayMatrix : Win32cr::Graphics::GdiPlus::ColorMatrix*, flags : Win32cr::Graphics::GdiPlus::ColorMatrixFlags) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetImageAttributesColorMatrix(imageattr, type__, enableFlag, colorMatrix, grayMatrix, flags)
    {% end %}
  end

  def gdipSetImageAttributesThreshold(imageattr : Win32cr::Graphics::GdiPlus::GpImageAttributes*, type__ : Win32cr::Graphics::GdiPlus::ColorAdjustType, enableFlag : Win32cr::Foundation::BOOL, threshold : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetImageAttributesThreshold(imageattr, type__, enableFlag, threshold)
    {% end %}
  end

  def gdipSetImageAttributesGamma(imageattr : Win32cr::Graphics::GdiPlus::GpImageAttributes*, type__ : Win32cr::Graphics::GdiPlus::ColorAdjustType, enableFlag : Win32cr::Foundation::BOOL, gamma : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetImageAttributesGamma(imageattr, type__, enableFlag, gamma)
    {% end %}
  end

  def gdipSetImageAttributesNoOp(imageattr : Win32cr::Graphics::GdiPlus::GpImageAttributes*, type__ : Win32cr::Graphics::GdiPlus::ColorAdjustType, enableFlag : Win32cr::Foundation::BOOL) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetImageAttributesNoOp(imageattr, type__, enableFlag)
    {% end %}
  end

  def gdipSetImageAttributesColorKeys(imageattr : Win32cr::Graphics::GdiPlus::GpImageAttributes*, type__ : Win32cr::Graphics::GdiPlus::ColorAdjustType, enableFlag : Win32cr::Foundation::BOOL, colorLow : UInt32, colorHigh : UInt32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetImageAttributesColorKeys(imageattr, type__, enableFlag, colorLow, colorHigh)
    {% end %}
  end

  def gdipSetImageAttributesOutputChannel(imageattr : Win32cr::Graphics::GdiPlus::GpImageAttributes*, type__ : Win32cr::Graphics::GdiPlus::ColorAdjustType, enableFlag : Win32cr::Foundation::BOOL, channelFlags : Win32cr::Graphics::GdiPlus::ColorChannelFlags) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetImageAttributesOutputChannel(imageattr, type__, enableFlag, channelFlags)
    {% end %}
  end

  def gdipSetImageAttributesOutputChannelColorProfile(imageattr : Win32cr::Graphics::GdiPlus::GpImageAttributes*, type__ : Win32cr::Graphics::GdiPlus::ColorAdjustType, enableFlag : Win32cr::Foundation::BOOL, colorProfileFilename : Win32cr::Foundation::PWSTR) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetImageAttributesOutputChannelColorProfile(imageattr, type__, enableFlag, colorProfileFilename)
    {% end %}
  end

  def gdipSetImageAttributesRemapTable(imageattr : Win32cr::Graphics::GdiPlus::GpImageAttributes*, type__ : Win32cr::Graphics::GdiPlus::ColorAdjustType, enableFlag : Win32cr::Foundation::BOOL, mapSize : UInt32, map : Win32cr::Graphics::GdiPlus::ColorMap*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetImageAttributesRemapTable(imageattr, type__, enableFlag, mapSize, map)
    {% end %}
  end

  def gdipSetImageAttributesWrapMode(imageAttr : Win32cr::Graphics::GdiPlus::GpImageAttributes*, wrap : Win32cr::Graphics::GdiPlus::WrapMode, argb : UInt32, clamp : Win32cr::Foundation::BOOL) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetImageAttributesWrapMode(imageAttr, wrap, argb, clamp)
    {% end %}
  end

  def gdipGetImageAttributesAdjustedPalette(imageAttr : Win32cr::Graphics::GdiPlus::GpImageAttributes*, colorPalette : Win32cr::Graphics::GdiPlus::ColorPalette*, colorAdjustType : Win32cr::Graphics::GdiPlus::ColorAdjustType) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetImageAttributesAdjustedPalette(imageAttr, colorPalette, colorAdjustType)
    {% end %}
  end

  def gdipFlush(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, intention : Win32cr::Graphics::GdiPlus::FlushIntention) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipFlush(graphics, intention)
    {% end %}
  end

  def gdipCreateFromHDC(hdc : Win32cr::Graphics::Gdi::HDC, graphics : Win32cr::Graphics::GdiPlus::GpGraphics**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateFromHDC(hdc, graphics)
    {% end %}
  end

  def gdipCreateFromHDC2(hdc : Win32cr::Graphics::Gdi::HDC, hDevice : Win32cr::Foundation::HANDLE, graphics : Win32cr::Graphics::GdiPlus::GpGraphics**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateFromHDC2(hdc, hDevice, graphics)
    {% end %}
  end

  def gdipCreateFromHWND(hwnd : Win32cr::Foundation::HWND, graphics : Win32cr::Graphics::GdiPlus::GpGraphics**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateFromHWND(hwnd, graphics)
    {% end %}
  end

  def gdipCreateFromHWNDICM(hwnd : Win32cr::Foundation::HWND, graphics : Win32cr::Graphics::GdiPlus::GpGraphics**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateFromHWNDICM(hwnd, graphics)
    {% end %}
  end

  def gdipDeleteGraphics(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDeleteGraphics(graphics)
    {% end %}
  end

  def gdipGetDC(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, hdc : Win32cr::Graphics::Gdi::HDC*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetDC(graphics, hdc)
    {% end %}
  end

  def gdipReleaseDC(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, hdc : Win32cr::Graphics::Gdi::HDC) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipReleaseDC(graphics, hdc)
    {% end %}
  end

  def gdipSetCompositingMode(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, compositingMode : Win32cr::Graphics::GdiPlus::CompositingMode) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetCompositingMode(graphics, compositingMode)
    {% end %}
  end

  def gdipGetCompositingMode(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, compositingMode : Win32cr::Graphics::GdiPlus::CompositingMode*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetCompositingMode(graphics, compositingMode)
    {% end %}
  end

  def gdipSetRenderingOrigin(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, x : Int32, y : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetRenderingOrigin(graphics, x, y)
    {% end %}
  end

  def gdipGetRenderingOrigin(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, x : Int32*, y : Int32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetRenderingOrigin(graphics, x, y)
    {% end %}
  end

  def gdipSetCompositingQuality(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, compositingQuality : Win32cr::Graphics::GdiPlus::CompositingQuality) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetCompositingQuality(graphics, compositingQuality)
    {% end %}
  end

  def gdipGetCompositingQuality(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, compositingQuality : Win32cr::Graphics::GdiPlus::CompositingQuality*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetCompositingQuality(graphics, compositingQuality)
    {% end %}
  end

  def gdipSetSmoothingMode(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, smoothingMode : Win32cr::Graphics::GdiPlus::SmoothingMode) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetSmoothingMode(graphics, smoothingMode)
    {% end %}
  end

  def gdipGetSmoothingMode(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, smoothingMode : Win32cr::Graphics::GdiPlus::SmoothingMode*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetSmoothingMode(graphics, smoothingMode)
    {% end %}
  end

  def gdipSetPixelOffsetMode(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pixelOffsetMode : Win32cr::Graphics::GdiPlus::PixelOffsetMode) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetPixelOffsetMode(graphics, pixelOffsetMode)
    {% end %}
  end

  def gdipGetPixelOffsetMode(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pixelOffsetMode : Win32cr::Graphics::GdiPlus::PixelOffsetMode*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPixelOffsetMode(graphics, pixelOffsetMode)
    {% end %}
  end

  def gdipSetTextRenderingHint(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, mode : Win32cr::Graphics::GdiPlus::TextRenderingHint) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetTextRenderingHint(graphics, mode)
    {% end %}
  end

  def gdipGetTextRenderingHint(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, mode : Win32cr::Graphics::GdiPlus::TextRenderingHint*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetTextRenderingHint(graphics, mode)
    {% end %}
  end

  def gdipSetTextContrast(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, contrast : UInt32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetTextContrast(graphics, contrast)
    {% end %}
  end

  def gdipGetTextContrast(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, contrast : UInt32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetTextContrast(graphics, contrast)
    {% end %}
  end

  def gdipSetInterpolationMode(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, interpolationMode : Win32cr::Graphics::GdiPlus::InterpolationMode) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetInterpolationMode(graphics, interpolationMode)
    {% end %}
  end

  def gdipGetInterpolationMode(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, interpolationMode : Win32cr::Graphics::GdiPlus::InterpolationMode*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetInterpolationMode(graphics, interpolationMode)
    {% end %}
  end

  def gdipSetWorldTransform(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, matrix : Win32cr::Graphics::GdiPlus::Matrix*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetWorldTransform(graphics, matrix)
    {% end %}
  end

  def gdipResetWorldTransform(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipResetWorldTransform(graphics)
    {% end %}
  end

  def gdipMultiplyWorldTransform(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, matrix : Win32cr::Graphics::GdiPlus::Matrix*, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipMultiplyWorldTransform(graphics, matrix, order)
    {% end %}
  end

  def gdipTranslateWorldTransform(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, dx : Float32, dy : Float32, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipTranslateWorldTransform(graphics, dx, dy, order)
    {% end %}
  end

  def gdipScaleWorldTransform(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, sx : Float32, sy : Float32, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipScaleWorldTransform(graphics, sx, sy, order)
    {% end %}
  end

  def gdipRotateWorldTransform(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, angle : Float32, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipRotateWorldTransform(graphics, angle, order)
    {% end %}
  end

  def gdipGetWorldTransform(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, matrix : Win32cr::Graphics::GdiPlus::Matrix*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetWorldTransform(graphics, matrix)
    {% end %}
  end

  def gdipResetPageTransform(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipResetPageTransform(graphics)
    {% end %}
  end

  def gdipGetPageUnit(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, unit : Win32cr::Graphics::GdiPlus::Unit*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPageUnit(graphics, unit)
    {% end %}
  end

  def gdipGetPageScale(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, scale : Float32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetPageScale(graphics, scale)
    {% end %}
  end

  def gdipSetPageUnit(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, unit : Win32cr::Graphics::GdiPlus::Unit) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetPageUnit(graphics, unit)
    {% end %}
  end

  def gdipSetPageScale(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, scale : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetPageScale(graphics, scale)
    {% end %}
  end

  def gdipGetDpiX(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, dpi : Float32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetDpiX(graphics, dpi)
    {% end %}
  end

  def gdipGetDpiY(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, dpi : Float32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetDpiY(graphics, dpi)
    {% end %}
  end

  def gdipTransformPoints(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, destSpace : Win32cr::Graphics::GdiPlus::CoordinateSpace, srcSpace : Win32cr::Graphics::GdiPlus::CoordinateSpace, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipTransformPoints(graphics, destSpace, srcSpace, points, count)
    {% end %}
  end

  def gdipTransformPointsI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, destSpace : Win32cr::Graphics::GdiPlus::CoordinateSpace, srcSpace : Win32cr::Graphics::GdiPlus::CoordinateSpace, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipTransformPointsI(graphics, destSpace, srcSpace, points, count)
    {% end %}
  end

  def gdipGetNearestColor(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, argb : UInt32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetNearestColor(graphics, argb)
    {% end %}
  end

  def gdipCreateHalftonePalette : Win32cr::Graphics::Gdi::HPALETTE
    {% if !flag?(:docs) %}
    C.GdipCreateHalftonePalette
    {% end %}
  end

  def gdipDrawLine(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, x1 : Float32, y1 : Float32, x2 : Float32, y2 : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawLine(graphics, pen, x1, y1, x2, y2)
    {% end %}
  end

  def gdipDrawLineI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, x1 : Int32, y1 : Int32, x2 : Int32, y2 : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawLineI(graphics, pen, x1, y1, x2, y2)
    {% end %}
  end

  def gdipDrawLines(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawLines(graphics, pen, points, count)
    {% end %}
  end

  def gdipDrawLinesI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawLinesI(graphics, pen, points, count)
    {% end %}
  end

  def gdipDrawArc(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, x : Float32, y : Float32, width : Float32, height : Float32, startAngle : Float32, sweepAngle : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawArc(graphics, pen, x, y, width, height, startAngle, sweepAngle)
    {% end %}
  end

  def gdipDrawArcI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, x : Int32, y : Int32, width : Int32, height : Int32, startAngle : Float32, sweepAngle : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawArcI(graphics, pen, x, y, width, height, startAngle, sweepAngle)
    {% end %}
  end

  def gdipDrawBezier(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, x1 : Float32, y1 : Float32, x2 : Float32, y2 : Float32, x3 : Float32, y3 : Float32, x4 : Float32, y4 : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawBezier(graphics, pen, x1, y1, x2, y2, x3, y3, x4, y4)
    {% end %}
  end

  def gdipDrawBezierI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, x1 : Int32, y1 : Int32, x2 : Int32, y2 : Int32, x3 : Int32, y3 : Int32, x4 : Int32, y4 : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawBezierI(graphics, pen, x1, y1, x2, y2, x3, y3, x4, y4)
    {% end %}
  end

  def gdipDrawBeziers(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawBeziers(graphics, pen, points, count)
    {% end %}
  end

  def gdipDrawBeziersI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawBeziersI(graphics, pen, points, count)
    {% end %}
  end

  def gdipDrawRectangle(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, x : Float32, y : Float32, width : Float32, height : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawRectangle(graphics, pen, x, y, width, height)
    {% end %}
  end

  def gdipDrawRectangleI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, x : Int32, y : Int32, width : Int32, height : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawRectangleI(graphics, pen, x, y, width, height)
    {% end %}
  end

  def gdipDrawRectangles(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, rects : Win32cr::Graphics::GdiPlus::RectF*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawRectangles(graphics, pen, rects, count)
    {% end %}
  end

  def gdipDrawRectanglesI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, rects : Win32cr::Graphics::GdiPlus::Rect*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawRectanglesI(graphics, pen, rects, count)
    {% end %}
  end

  def gdipDrawEllipse(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, x : Float32, y : Float32, width : Float32, height : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawEllipse(graphics, pen, x, y, width, height)
    {% end %}
  end

  def gdipDrawEllipseI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, x : Int32, y : Int32, width : Int32, height : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawEllipseI(graphics, pen, x, y, width, height)
    {% end %}
  end

  def gdipDrawPie(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, x : Float32, y : Float32, width : Float32, height : Float32, startAngle : Float32, sweepAngle : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawPie(graphics, pen, x, y, width, height, startAngle, sweepAngle)
    {% end %}
  end

  def gdipDrawPieI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, x : Int32, y : Int32, width : Int32, height : Int32, startAngle : Float32, sweepAngle : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawPieI(graphics, pen, x, y, width, height, startAngle, sweepAngle)
    {% end %}
  end

  def gdipDrawPolygon(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawPolygon(graphics, pen, points, count)
    {% end %}
  end

  def gdipDrawPolygonI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawPolygonI(graphics, pen, points, count)
    {% end %}
  end

  def gdipDrawPath(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, path : Win32cr::Graphics::GdiPlus::GpPath*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawPath(graphics, pen, path)
    {% end %}
  end

  def gdipDrawCurve(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawCurve(graphics, pen, points, count)
    {% end %}
  end

  def gdipDrawCurveI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawCurveI(graphics, pen, points, count)
    {% end %}
  end

  def gdipDrawCurve2(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32, tension : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawCurve2(graphics, pen, points, count, tension)
    {% end %}
  end

  def gdipDrawCurve2I(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32, tension : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawCurve2I(graphics, pen, points, count, tension)
    {% end %}
  end

  def gdipDrawCurve3(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32, offset : Int32, numberOfSegments : Int32, tension : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawCurve3(graphics, pen, points, count, offset, numberOfSegments, tension)
    {% end %}
  end

  def gdipDrawCurve3I(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32, offset : Int32, numberOfSegments : Int32, tension : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawCurve3I(graphics, pen, points, count, offset, numberOfSegments, tension)
    {% end %}
  end

  def gdipDrawClosedCurve(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawClosedCurve(graphics, pen, points, count)
    {% end %}
  end

  def gdipDrawClosedCurveI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawClosedCurveI(graphics, pen, points, count)
    {% end %}
  end

  def gdipDrawClosedCurve2(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32, tension : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawClosedCurve2(graphics, pen, points, count, tension)
    {% end %}
  end

  def gdipDrawClosedCurve2I(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32, tension : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawClosedCurve2I(graphics, pen, points, count, tension)
    {% end %}
  end

  def gdipGraphicsClear(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, color : UInt32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGraphicsClear(graphics, color)
    {% end %}
  end

  def gdipFillRectangle(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, brush : Win32cr::Graphics::GdiPlus::GpBrush*, x : Float32, y : Float32, width : Float32, height : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipFillRectangle(graphics, brush, x, y, width, height)
    {% end %}
  end

  def gdipFillRectangleI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, brush : Win32cr::Graphics::GdiPlus::GpBrush*, x : Int32, y : Int32, width : Int32, height : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipFillRectangleI(graphics, brush, x, y, width, height)
    {% end %}
  end

  def gdipFillRectangles(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, brush : Win32cr::Graphics::GdiPlus::GpBrush*, rects : Win32cr::Graphics::GdiPlus::RectF*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipFillRectangles(graphics, brush, rects, count)
    {% end %}
  end

  def gdipFillRectanglesI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, brush : Win32cr::Graphics::GdiPlus::GpBrush*, rects : Win32cr::Graphics::GdiPlus::Rect*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipFillRectanglesI(graphics, brush, rects, count)
    {% end %}
  end

  def gdipFillPolygon(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, brush : Win32cr::Graphics::GdiPlus::GpBrush*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32, fillMode : Win32cr::Graphics::GdiPlus::FillMode) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipFillPolygon(graphics, brush, points, count, fillMode)
    {% end %}
  end

  def gdipFillPolygonI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, brush : Win32cr::Graphics::GdiPlus::GpBrush*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32, fillMode : Win32cr::Graphics::GdiPlus::FillMode) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipFillPolygonI(graphics, brush, points, count, fillMode)
    {% end %}
  end

  def gdipFillPolygon2(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, brush : Win32cr::Graphics::GdiPlus::GpBrush*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipFillPolygon2(graphics, brush, points, count)
    {% end %}
  end

  def gdipFillPolygon2I(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, brush : Win32cr::Graphics::GdiPlus::GpBrush*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipFillPolygon2I(graphics, brush, points, count)
    {% end %}
  end

  def gdipFillEllipse(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, brush : Win32cr::Graphics::GdiPlus::GpBrush*, x : Float32, y : Float32, width : Float32, height : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipFillEllipse(graphics, brush, x, y, width, height)
    {% end %}
  end

  def gdipFillEllipseI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, brush : Win32cr::Graphics::GdiPlus::GpBrush*, x : Int32, y : Int32, width : Int32, height : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipFillEllipseI(graphics, brush, x, y, width, height)
    {% end %}
  end

  def gdipFillPie(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, brush : Win32cr::Graphics::GdiPlus::GpBrush*, x : Float32, y : Float32, width : Float32, height : Float32, startAngle : Float32, sweepAngle : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipFillPie(graphics, brush, x, y, width, height, startAngle, sweepAngle)
    {% end %}
  end

  def gdipFillPieI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, brush : Win32cr::Graphics::GdiPlus::GpBrush*, x : Int32, y : Int32, width : Int32, height : Int32, startAngle : Float32, sweepAngle : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipFillPieI(graphics, brush, x, y, width, height, startAngle, sweepAngle)
    {% end %}
  end

  def gdipFillPath(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, brush : Win32cr::Graphics::GdiPlus::GpBrush*, path : Win32cr::Graphics::GdiPlus::GpPath*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipFillPath(graphics, brush, path)
    {% end %}
  end

  def gdipFillClosedCurve(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, brush : Win32cr::Graphics::GdiPlus::GpBrush*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipFillClosedCurve(graphics, brush, points, count)
    {% end %}
  end

  def gdipFillClosedCurveI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, brush : Win32cr::Graphics::GdiPlus::GpBrush*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipFillClosedCurveI(graphics, brush, points, count)
    {% end %}
  end

  def gdipFillClosedCurve2(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, brush : Win32cr::Graphics::GdiPlus::GpBrush*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32, tension : Float32, fillMode : Win32cr::Graphics::GdiPlus::FillMode) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipFillClosedCurve2(graphics, brush, points, count, tension, fillMode)
    {% end %}
  end

  def gdipFillClosedCurve2I(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, brush : Win32cr::Graphics::GdiPlus::GpBrush*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32, tension : Float32, fillMode : Win32cr::Graphics::GdiPlus::FillMode) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipFillClosedCurve2I(graphics, brush, points, count, tension, fillMode)
    {% end %}
  end

  def gdipFillRegion(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, brush : Win32cr::Graphics::GdiPlus::GpBrush*, region : Win32cr::Graphics::GdiPlus::GpRegion*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipFillRegion(graphics, brush, region)
    {% end %}
  end

  def gdipDrawImageFX(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, image : Win32cr::Graphics::GdiPlus::GpImage*, source : Win32cr::Graphics::GdiPlus::RectF*, xForm : Win32cr::Graphics::GdiPlus::Matrix*, effect : Win32cr::Graphics::GdiPlus::CGpEffect*, imageAttributes : Win32cr::Graphics::GdiPlus::GpImageAttributes*, srcUnit : Win32cr::Graphics::GdiPlus::Unit) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawImageFX(graphics, image, source, xForm, effect, imageAttributes, srcUnit)
    {% end %}
  end

  def gdipDrawImage(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, image : Win32cr::Graphics::GdiPlus::GpImage*, x : Float32, y : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawImage(graphics, image, x, y)
    {% end %}
  end

  def gdipDrawImageI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, image : Win32cr::Graphics::GdiPlus::GpImage*, x : Int32, y : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawImageI(graphics, image, x, y)
    {% end %}
  end

  def gdipDrawImageRect(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, image : Win32cr::Graphics::GdiPlus::GpImage*, x : Float32, y : Float32, width : Float32, height : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawImageRect(graphics, image, x, y, width, height)
    {% end %}
  end

  def gdipDrawImageRectI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, image : Win32cr::Graphics::GdiPlus::GpImage*, x : Int32, y : Int32, width : Int32, height : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawImageRectI(graphics, image, x, y, width, height)
    {% end %}
  end

  def gdipDrawImagePoints(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, image : Win32cr::Graphics::GdiPlus::GpImage*, dstpoints : Win32cr::Graphics::GdiPlus::PointF*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawImagePoints(graphics, image, dstpoints, count)
    {% end %}
  end

  def gdipDrawImagePointsI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, image : Win32cr::Graphics::GdiPlus::GpImage*, dstpoints : Win32cr::Graphics::GdiPlus::Point*, count : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawImagePointsI(graphics, image, dstpoints, count)
    {% end %}
  end

  def gdipDrawImagePointRect(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, image : Win32cr::Graphics::GdiPlus::GpImage*, x : Float32, y : Float32, srcx : Float32, srcy : Float32, srcwidth : Float32, srcheight : Float32, srcUnit : Win32cr::Graphics::GdiPlus::Unit) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawImagePointRect(graphics, image, x, y, srcx, srcy, srcwidth, srcheight, srcUnit)
    {% end %}
  end

  def gdipDrawImagePointRectI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, image : Win32cr::Graphics::GdiPlus::GpImage*, x : Int32, y : Int32, srcx : Int32, srcy : Int32, srcwidth : Int32, srcheight : Int32, srcUnit : Win32cr::Graphics::GdiPlus::Unit) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawImagePointRectI(graphics, image, x, y, srcx, srcy, srcwidth, srcheight, srcUnit)
    {% end %}
  end

  def gdipDrawImageRectRect(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, image : Win32cr::Graphics::GdiPlus::GpImage*, dstx : Float32, dsty : Float32, dstwidth : Float32, dstheight : Float32, srcx : Float32, srcy : Float32, srcwidth : Float32, srcheight : Float32, srcUnit : Win32cr::Graphics::GdiPlus::Unit, imageAttributes : Win32cr::Graphics::GdiPlus::GpImageAttributes*, callback : LibC::IntPtrT, callbackData : Void*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawImageRectRect(graphics, image, dstx, dsty, dstwidth, dstheight, srcx, srcy, srcwidth, srcheight, srcUnit, imageAttributes, callback, callbackData)
    {% end %}
  end

  def gdipDrawImageRectRectI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, image : Win32cr::Graphics::GdiPlus::GpImage*, dstx : Int32, dsty : Int32, dstwidth : Int32, dstheight : Int32, srcx : Int32, srcy : Int32, srcwidth : Int32, srcheight : Int32, srcUnit : Win32cr::Graphics::GdiPlus::Unit, imageAttributes : Win32cr::Graphics::GdiPlus::GpImageAttributes*, callback : LibC::IntPtrT, callbackData : Void*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawImageRectRectI(graphics, image, dstx, dsty, dstwidth, dstheight, srcx, srcy, srcwidth, srcheight, srcUnit, imageAttributes, callback, callbackData)
    {% end %}
  end

  def gdipDrawImagePointsRect(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, image : Win32cr::Graphics::GdiPlus::GpImage*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32, srcx : Float32, srcy : Float32, srcwidth : Float32, srcheight : Float32, srcUnit : Win32cr::Graphics::GdiPlus::Unit, imageAttributes : Win32cr::Graphics::GdiPlus::GpImageAttributes*, callback : LibC::IntPtrT, callbackData : Void*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawImagePointsRect(graphics, image, points, count, srcx, srcy, srcwidth, srcheight, srcUnit, imageAttributes, callback, callbackData)
    {% end %}
  end

  def gdipDrawImagePointsRectI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, image : Win32cr::Graphics::GdiPlus::GpImage*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32, srcx : Int32, srcy : Int32, srcwidth : Int32, srcheight : Int32, srcUnit : Win32cr::Graphics::GdiPlus::Unit, imageAttributes : Win32cr::Graphics::GdiPlus::GpImageAttributes*, callback : LibC::IntPtrT, callbackData : Void*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawImagePointsRectI(graphics, image, points, count, srcx, srcy, srcwidth, srcheight, srcUnit, imageAttributes, callback, callbackData)
    {% end %}
  end

  def gdipEnumerateMetafileDestPoint(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, metafile : Win32cr::Graphics::GdiPlus::GpMetafile*, destPoint : Win32cr::Graphics::GdiPlus::PointF*, callback : LibC::IntPtrT, callbackData : Void*, imageAttributes : Win32cr::Graphics::GdiPlus::GpImageAttributes*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipEnumerateMetafileDestPoint(graphics, metafile, destPoint, callback, callbackData, imageAttributes)
    {% end %}
  end

  def gdipEnumerateMetafileDestPointI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, metafile : Win32cr::Graphics::GdiPlus::GpMetafile*, destPoint : Win32cr::Graphics::GdiPlus::Point*, callback : LibC::IntPtrT, callbackData : Void*, imageAttributes : Win32cr::Graphics::GdiPlus::GpImageAttributes*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipEnumerateMetafileDestPointI(graphics, metafile, destPoint, callback, callbackData, imageAttributes)
    {% end %}
  end

  def gdipEnumerateMetafileDestRect(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, metafile : Win32cr::Graphics::GdiPlus::GpMetafile*, destRect : Win32cr::Graphics::GdiPlus::RectF*, callback : LibC::IntPtrT, callbackData : Void*, imageAttributes : Win32cr::Graphics::GdiPlus::GpImageAttributes*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipEnumerateMetafileDestRect(graphics, metafile, destRect, callback, callbackData, imageAttributes)
    {% end %}
  end

  def gdipEnumerateMetafileDestRectI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, metafile : Win32cr::Graphics::GdiPlus::GpMetafile*, destRect : Win32cr::Graphics::GdiPlus::Rect*, callback : LibC::IntPtrT, callbackData : Void*, imageAttributes : Win32cr::Graphics::GdiPlus::GpImageAttributes*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipEnumerateMetafileDestRectI(graphics, metafile, destRect, callback, callbackData, imageAttributes)
    {% end %}
  end

  def gdipEnumerateMetafileDestPoints(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, metafile : Win32cr::Graphics::GdiPlus::GpMetafile*, destPoints : Win32cr::Graphics::GdiPlus::PointF*, count : Int32, callback : LibC::IntPtrT, callbackData : Void*, imageAttributes : Win32cr::Graphics::GdiPlus::GpImageAttributes*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipEnumerateMetafileDestPoints(graphics, metafile, destPoints, count, callback, callbackData, imageAttributes)
    {% end %}
  end

  def gdipEnumerateMetafileDestPointsI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, metafile : Win32cr::Graphics::GdiPlus::GpMetafile*, destPoints : Win32cr::Graphics::GdiPlus::Point*, count : Int32, callback : LibC::IntPtrT, callbackData : Void*, imageAttributes : Win32cr::Graphics::GdiPlus::GpImageAttributes*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipEnumerateMetafileDestPointsI(graphics, metafile, destPoints, count, callback, callbackData, imageAttributes)
    {% end %}
  end

  def gdipEnumerateMetafileSrcRectDestPoint(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, metafile : Win32cr::Graphics::GdiPlus::GpMetafile*, destPoint : Win32cr::Graphics::GdiPlus::PointF*, srcRect : Win32cr::Graphics::GdiPlus::RectF*, srcUnit : Win32cr::Graphics::GdiPlus::Unit, callback : LibC::IntPtrT, callbackData : Void*, imageAttributes : Win32cr::Graphics::GdiPlus::GpImageAttributes*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipEnumerateMetafileSrcRectDestPoint(graphics, metafile, destPoint, srcRect, srcUnit, callback, callbackData, imageAttributes)
    {% end %}
  end

  def gdipEnumerateMetafileSrcRectDestPointI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, metafile : Win32cr::Graphics::GdiPlus::GpMetafile*, destPoint : Win32cr::Graphics::GdiPlus::Point*, srcRect : Win32cr::Graphics::GdiPlus::Rect*, srcUnit : Win32cr::Graphics::GdiPlus::Unit, callback : LibC::IntPtrT, callbackData : Void*, imageAttributes : Win32cr::Graphics::GdiPlus::GpImageAttributes*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipEnumerateMetafileSrcRectDestPointI(graphics, metafile, destPoint, srcRect, srcUnit, callback, callbackData, imageAttributes)
    {% end %}
  end

  def gdipEnumerateMetafileSrcRectDestRect(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, metafile : Win32cr::Graphics::GdiPlus::GpMetafile*, destRect : Win32cr::Graphics::GdiPlus::RectF*, srcRect : Win32cr::Graphics::GdiPlus::RectF*, srcUnit : Win32cr::Graphics::GdiPlus::Unit, callback : LibC::IntPtrT, callbackData : Void*, imageAttributes : Win32cr::Graphics::GdiPlus::GpImageAttributes*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipEnumerateMetafileSrcRectDestRect(graphics, metafile, destRect, srcRect, srcUnit, callback, callbackData, imageAttributes)
    {% end %}
  end

  def gdipEnumerateMetafileSrcRectDestRectI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, metafile : Win32cr::Graphics::GdiPlus::GpMetafile*, destRect : Win32cr::Graphics::GdiPlus::Rect*, srcRect : Win32cr::Graphics::GdiPlus::Rect*, srcUnit : Win32cr::Graphics::GdiPlus::Unit, callback : LibC::IntPtrT, callbackData : Void*, imageAttributes : Win32cr::Graphics::GdiPlus::GpImageAttributes*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipEnumerateMetafileSrcRectDestRectI(graphics, metafile, destRect, srcRect, srcUnit, callback, callbackData, imageAttributes)
    {% end %}
  end

  def gdipEnumerateMetafileSrcRectDestPoints(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, metafile : Win32cr::Graphics::GdiPlus::GpMetafile*, destPoints : Win32cr::Graphics::GdiPlus::PointF*, count : Int32, srcRect : Win32cr::Graphics::GdiPlus::RectF*, srcUnit : Win32cr::Graphics::GdiPlus::Unit, callback : LibC::IntPtrT, callbackData : Void*, imageAttributes : Win32cr::Graphics::GdiPlus::GpImageAttributes*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipEnumerateMetafileSrcRectDestPoints(graphics, metafile, destPoints, count, srcRect, srcUnit, callback, callbackData, imageAttributes)
    {% end %}
  end

  def gdipEnumerateMetafileSrcRectDestPointsI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, metafile : Win32cr::Graphics::GdiPlus::GpMetafile*, destPoints : Win32cr::Graphics::GdiPlus::Point*, count : Int32, srcRect : Win32cr::Graphics::GdiPlus::Rect*, srcUnit : Win32cr::Graphics::GdiPlus::Unit, callback : LibC::IntPtrT, callbackData : Void*, imageAttributes : Win32cr::Graphics::GdiPlus::GpImageAttributes*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipEnumerateMetafileSrcRectDestPointsI(graphics, metafile, destPoints, count, srcRect, srcUnit, callback, callbackData, imageAttributes)
    {% end %}
  end

  def gdipPlayMetafileRecord(metafile : Win32cr::Graphics::GdiPlus::GpMetafile*, recordType : Win32cr::Graphics::GdiPlus::EmfPlusRecordType, flags : UInt32, dataSize : UInt32, data : UInt8*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipPlayMetafileRecord(metafile, recordType, flags, dataSize, data)
    {% end %}
  end

  def gdipSetClipGraphics(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, srcgraphics : Win32cr::Graphics::GdiPlus::GpGraphics*, combineMode : Win32cr::Graphics::GdiPlus::CombineMode) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetClipGraphics(graphics, srcgraphics, combineMode)
    {% end %}
  end

  def gdipSetClipRect(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, x : Float32, y : Float32, width : Float32, height : Float32, combineMode : Win32cr::Graphics::GdiPlus::CombineMode) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetClipRect(graphics, x, y, width, height, combineMode)
    {% end %}
  end

  def gdipSetClipRectI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, x : Int32, y : Int32, width : Int32, height : Int32, combineMode : Win32cr::Graphics::GdiPlus::CombineMode) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetClipRectI(graphics, x, y, width, height, combineMode)
    {% end %}
  end

  def gdipSetClipPath(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, path : Win32cr::Graphics::GdiPlus::GpPath*, combineMode : Win32cr::Graphics::GdiPlus::CombineMode) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetClipPath(graphics, path, combineMode)
    {% end %}
  end

  def gdipSetClipRegion(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, region : Win32cr::Graphics::GdiPlus::GpRegion*, combineMode : Win32cr::Graphics::GdiPlus::CombineMode) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetClipRegion(graphics, region, combineMode)
    {% end %}
  end

  def gdipSetClipHrgn(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, hRgn : Win32cr::Graphics::Gdi::HRGN, combineMode : Win32cr::Graphics::GdiPlus::CombineMode) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetClipHrgn(graphics, hRgn, combineMode)
    {% end %}
  end

  def gdipResetClip(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipResetClip(graphics)
    {% end %}
  end

  def gdipTranslateClip(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, dx : Float32, dy : Float32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipTranslateClip(graphics, dx, dy)
    {% end %}
  end

  def gdipTranslateClipI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, dx : Int32, dy : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipTranslateClipI(graphics, dx, dy)
    {% end %}
  end

  def gdipGetClip(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, region : Win32cr::Graphics::GdiPlus::GpRegion*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetClip(graphics, region)
    {% end %}
  end

  def gdipGetClipBounds(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, rect : Win32cr::Graphics::GdiPlus::RectF*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetClipBounds(graphics, rect)
    {% end %}
  end

  def gdipGetClipBoundsI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, rect : Win32cr::Graphics::GdiPlus::Rect*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetClipBoundsI(graphics, rect)
    {% end %}
  end

  def gdipIsClipEmpty(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, result : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipIsClipEmpty(graphics, result)
    {% end %}
  end

  def gdipGetVisibleClipBounds(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, rect : Win32cr::Graphics::GdiPlus::RectF*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetVisibleClipBounds(graphics, rect)
    {% end %}
  end

  def gdipGetVisibleClipBoundsI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, rect : Win32cr::Graphics::GdiPlus::Rect*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetVisibleClipBoundsI(graphics, rect)
    {% end %}
  end

  def gdipIsVisibleClipEmpty(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, result : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipIsVisibleClipEmpty(graphics, result)
    {% end %}
  end

  def gdipIsVisiblePoint(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, x : Float32, y : Float32, result : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipIsVisiblePoint(graphics, x, y, result)
    {% end %}
  end

  def gdipIsVisiblePointI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, x : Int32, y : Int32, result : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipIsVisiblePointI(graphics, x, y, result)
    {% end %}
  end

  def gdipIsVisibleRect(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, x : Float32, y : Float32, width : Float32, height : Float32, result : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipIsVisibleRect(graphics, x, y, width, height, result)
    {% end %}
  end

  def gdipIsVisibleRectI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, x : Int32, y : Int32, width : Int32, height : Int32, result : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipIsVisibleRectI(graphics, x, y, width, height, result)
    {% end %}
  end

  def gdipSaveGraphics(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, state : UInt32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSaveGraphics(graphics, state)
    {% end %}
  end

  def gdipRestoreGraphics(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, state : UInt32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipRestoreGraphics(graphics, state)
    {% end %}
  end

  def gdipBeginContainer(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, dstrect : Win32cr::Graphics::GdiPlus::RectF*, srcrect : Win32cr::Graphics::GdiPlus::RectF*, unit : Win32cr::Graphics::GdiPlus::Unit, state : UInt32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipBeginContainer(graphics, dstrect, srcrect, unit, state)
    {% end %}
  end

  def gdipBeginContainerI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, dstrect : Win32cr::Graphics::GdiPlus::Rect*, srcrect : Win32cr::Graphics::GdiPlus::Rect*, unit : Win32cr::Graphics::GdiPlus::Unit, state : UInt32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipBeginContainerI(graphics, dstrect, srcrect, unit, state)
    {% end %}
  end

  def gdipBeginContainer2(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, state : UInt32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipBeginContainer2(graphics, state)
    {% end %}
  end

  def gdipEndContainer(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, state : UInt32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipEndContainer(graphics, state)
    {% end %}
  end

  def gdipGetMetafileHeaderFromWmf(hWmf : Win32cr::Graphics::Gdi::HMETAFILE, wmfPlaceableFileHeader : Win32cr::Graphics::GdiPlus::WmfPlaceableFileHeader*, header : Win32cr::Graphics::GdiPlus::MetafileHeader*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetMetafileHeaderFromWmf(hWmf, wmfPlaceableFileHeader, header)
    {% end %}
  end

  def gdipGetMetafileHeaderFromEmf(hEmf : Win32cr::Graphics::Gdi::HENHMETAFILE, header : Win32cr::Graphics::GdiPlus::MetafileHeader*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetMetafileHeaderFromEmf(hEmf, header)
    {% end %}
  end

  def gdipGetMetafileHeaderFromFile(filename : Win32cr::Foundation::PWSTR, header : Win32cr::Graphics::GdiPlus::MetafileHeader*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetMetafileHeaderFromFile(filename, header)
    {% end %}
  end

  def gdipGetMetafileHeaderFromStream(stream : Void*, header : Win32cr::Graphics::GdiPlus::MetafileHeader*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetMetafileHeaderFromStream(stream, header)
    {% end %}
  end

  def gdipGetMetafileHeaderFromMetafile(metafile : Win32cr::Graphics::GdiPlus::GpMetafile*, header : Win32cr::Graphics::GdiPlus::MetafileHeader*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetMetafileHeaderFromMetafile(metafile, header)
    {% end %}
  end

  def gdipGetHemfFromMetafile(metafile : Win32cr::Graphics::GdiPlus::GpMetafile*, hEmf : Win32cr::Graphics::Gdi::HENHMETAFILE*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetHemfFromMetafile(metafile, hEmf)
    {% end %}
  end

  def gdipCreateStreamOnFile(filename : Win32cr::Foundation::PWSTR, access : UInt32, stream : Void**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateStreamOnFile(filename, access, stream)
    {% end %}
  end

  def gdipCreateMetafileFromWmf(hWmf : Win32cr::Graphics::Gdi::HMETAFILE, deleteWmf : Win32cr::Foundation::BOOL, wmfPlaceableFileHeader : Win32cr::Graphics::GdiPlus::WmfPlaceableFileHeader*, metafile : Win32cr::Graphics::GdiPlus::GpMetafile**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateMetafileFromWmf(hWmf, deleteWmf, wmfPlaceableFileHeader, metafile)
    {% end %}
  end

  def gdipCreateMetafileFromEmf(hEmf : Win32cr::Graphics::Gdi::HENHMETAFILE, deleteEmf : Win32cr::Foundation::BOOL, metafile : Win32cr::Graphics::GdiPlus::GpMetafile**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateMetafileFromEmf(hEmf, deleteEmf, metafile)
    {% end %}
  end

  def gdipCreateMetafileFromFile(file : Win32cr::Foundation::PWSTR, metafile : Win32cr::Graphics::GdiPlus::GpMetafile**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateMetafileFromFile(file, metafile)
    {% end %}
  end

  def gdipCreateMetafileFromWmfFile(file : Win32cr::Foundation::PWSTR, wmfPlaceableFileHeader : Win32cr::Graphics::GdiPlus::WmfPlaceableFileHeader*, metafile : Win32cr::Graphics::GdiPlus::GpMetafile**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateMetafileFromWmfFile(file, wmfPlaceableFileHeader, metafile)
    {% end %}
  end

  def gdipCreateMetafileFromStream(stream : Void*, metafile : Win32cr::Graphics::GdiPlus::GpMetafile**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateMetafileFromStream(stream, metafile)
    {% end %}
  end

  def gdipRecordMetafile(referenceHdc : Win32cr::Graphics::Gdi::HDC, type__ : Win32cr::Graphics::GdiPlus::EmfType, frameRect : Win32cr::Graphics::GdiPlus::RectF*, frameUnit : Win32cr::Graphics::GdiPlus::MetafileFrameUnit, description : Win32cr::Foundation::PWSTR, metafile : Win32cr::Graphics::GdiPlus::GpMetafile**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipRecordMetafile(referenceHdc, type__, frameRect, frameUnit, description, metafile)
    {% end %}
  end

  def gdipRecordMetafileI(referenceHdc : Win32cr::Graphics::Gdi::HDC, type__ : Win32cr::Graphics::GdiPlus::EmfType, frameRect : Win32cr::Graphics::GdiPlus::Rect*, frameUnit : Win32cr::Graphics::GdiPlus::MetafileFrameUnit, description : Win32cr::Foundation::PWSTR, metafile : Win32cr::Graphics::GdiPlus::GpMetafile**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipRecordMetafileI(referenceHdc, type__, frameRect, frameUnit, description, metafile)
    {% end %}
  end

  def gdipRecordMetafileFileName(fileName : Win32cr::Foundation::PWSTR, referenceHdc : Win32cr::Graphics::Gdi::HDC, type__ : Win32cr::Graphics::GdiPlus::EmfType, frameRect : Win32cr::Graphics::GdiPlus::RectF*, frameUnit : Win32cr::Graphics::GdiPlus::MetafileFrameUnit, description : Win32cr::Foundation::PWSTR, metafile : Win32cr::Graphics::GdiPlus::GpMetafile**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipRecordMetafileFileName(fileName, referenceHdc, type__, frameRect, frameUnit, description, metafile)
    {% end %}
  end

  def gdipRecordMetafileFileNameI(fileName : Win32cr::Foundation::PWSTR, referenceHdc : Win32cr::Graphics::Gdi::HDC, type__ : Win32cr::Graphics::GdiPlus::EmfType, frameRect : Win32cr::Graphics::GdiPlus::Rect*, frameUnit : Win32cr::Graphics::GdiPlus::MetafileFrameUnit, description : Win32cr::Foundation::PWSTR, metafile : Win32cr::Graphics::GdiPlus::GpMetafile**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipRecordMetafileFileNameI(fileName, referenceHdc, type__, frameRect, frameUnit, description, metafile)
    {% end %}
  end

  def gdipRecordMetafileStream(stream : Void*, referenceHdc : Win32cr::Graphics::Gdi::HDC, type__ : Win32cr::Graphics::GdiPlus::EmfType, frameRect : Win32cr::Graphics::GdiPlus::RectF*, frameUnit : Win32cr::Graphics::GdiPlus::MetafileFrameUnit, description : Win32cr::Foundation::PWSTR, metafile : Win32cr::Graphics::GdiPlus::GpMetafile**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipRecordMetafileStream(stream, referenceHdc, type__, frameRect, frameUnit, description, metafile)
    {% end %}
  end

  def gdipRecordMetafileStreamI(stream : Void*, referenceHdc : Win32cr::Graphics::Gdi::HDC, type__ : Win32cr::Graphics::GdiPlus::EmfType, frameRect : Win32cr::Graphics::GdiPlus::Rect*, frameUnit : Win32cr::Graphics::GdiPlus::MetafileFrameUnit, description : Win32cr::Foundation::PWSTR, metafile : Win32cr::Graphics::GdiPlus::GpMetafile**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipRecordMetafileStreamI(stream, referenceHdc, type__, frameRect, frameUnit, description, metafile)
    {% end %}
  end

  def gdipSetMetafileDownLevelRasterizationLimit(metafile : Win32cr::Graphics::GdiPlus::GpMetafile*, metafileRasterizationLimitDpi : UInt32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetMetafileDownLevelRasterizationLimit(metafile, metafileRasterizationLimitDpi)
    {% end %}
  end

  def gdipGetMetafileDownLevelRasterizationLimit(metafile : Win32cr::Graphics::GdiPlus::GpMetafile*, metafileRasterizationLimitDpi : UInt32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetMetafileDownLevelRasterizationLimit(metafile, metafileRasterizationLimitDpi)
    {% end %}
  end

  def gdipGetImageDecodersSize(numDecoders : UInt32*, size : UInt32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetImageDecodersSize(numDecoders, size)
    {% end %}
  end

  def gdipGetImageDecoders(numDecoders : UInt32, size : UInt32, decoders : Win32cr::Graphics::GdiPlus::ImageCodecInfo*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetImageDecoders(numDecoders, size, decoders)
    {% end %}
  end

  def gdipGetImageEncodersSize(numEncoders : UInt32*, size : UInt32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetImageEncodersSize(numEncoders, size)
    {% end %}
  end

  def gdipGetImageEncoders(numEncoders : UInt32, size : UInt32, encoders : Win32cr::Graphics::GdiPlus::ImageCodecInfo*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetImageEncoders(numEncoders, size, encoders)
    {% end %}
  end

  def gdipComment(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, sizeData : UInt32, data : UInt8*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipComment(graphics, sizeData, data)
    {% end %}
  end

  def gdipCreateFontFamilyFromName(name : Win32cr::Foundation::PWSTR, fontCollection : Win32cr::Graphics::GdiPlus::GpFontCollection*, fontFamily : Win32cr::Graphics::GdiPlus::GpFontFamily**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateFontFamilyFromName(name, fontCollection, fontFamily)
    {% end %}
  end

  def gdipDeleteFontFamily(fontFamily : Win32cr::Graphics::GdiPlus::GpFontFamily*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDeleteFontFamily(fontFamily)
    {% end %}
  end

  def gdipCloneFontFamily(fontFamily : Win32cr::Graphics::GdiPlus::GpFontFamily*, clonedFontFamily : Win32cr::Graphics::GdiPlus::GpFontFamily**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCloneFontFamily(fontFamily, clonedFontFamily)
    {% end %}
  end

  def gdipGetGenericFontFamilySansSerif(nativeFamily : Win32cr::Graphics::GdiPlus::GpFontFamily**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetGenericFontFamilySansSerif(nativeFamily)
    {% end %}
  end

  def gdipGetGenericFontFamilySerif(nativeFamily : Win32cr::Graphics::GdiPlus::GpFontFamily**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetGenericFontFamilySerif(nativeFamily)
    {% end %}
  end

  def gdipGetGenericFontFamilyMonospace(nativeFamily : Win32cr::Graphics::GdiPlus::GpFontFamily**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetGenericFontFamilyMonospace(nativeFamily)
    {% end %}
  end

  def gdipGetFamilyName(family : Win32cr::Graphics::GdiPlus::GpFontFamily*, name : Win32cr::Foundation::PWSTR, language : UInt16) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetFamilyName(family, name, language)
    {% end %}
  end

  def gdipIsStyleAvailable(family : Win32cr::Graphics::GdiPlus::GpFontFamily*, style : Int32, is_style_available : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipIsStyleAvailable(family, style, is_style_available)
    {% end %}
  end

  def gdipGetEmHeight(family : Win32cr::Graphics::GdiPlus::GpFontFamily*, style : Int32, em_height : UInt16*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetEmHeight(family, style, em_height)
    {% end %}
  end

  def gdipGetCellAscent(family : Win32cr::Graphics::GdiPlus::GpFontFamily*, style : Int32, cell_ascent : UInt16*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetCellAscent(family, style, cell_ascent)
    {% end %}
  end

  def gdipGetCellDescent(family : Win32cr::Graphics::GdiPlus::GpFontFamily*, style : Int32, cell_descent : UInt16*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetCellDescent(family, style, cell_descent)
    {% end %}
  end

  def gdipGetLineSpacing(family : Win32cr::Graphics::GdiPlus::GpFontFamily*, style : Int32, line_spacing : UInt16*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetLineSpacing(family, style, line_spacing)
    {% end %}
  end

  def gdipCreateFontFromDC(hdc : Win32cr::Graphics::Gdi::HDC, font : Win32cr::Graphics::GdiPlus::GpFont**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateFontFromDC(hdc, font)
    {% end %}
  end

  def gdipCreateFontFromLogfontA(hdc : Win32cr::Graphics::Gdi::HDC, logfont : Win32cr::Graphics::Gdi::LOGFONTA*, font : Win32cr::Graphics::GdiPlus::GpFont**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateFontFromLogfontA(hdc, logfont, font)
    {% end %}
  end

  def gdipCreateFontFromLogfontW(hdc : Win32cr::Graphics::Gdi::HDC, logfont : Win32cr::Graphics::Gdi::LOGFONTW*, font : Win32cr::Graphics::GdiPlus::GpFont**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateFontFromLogfontW(hdc, logfont, font)
    {% end %}
  end

  def gdipCreateFont(fontFamily : Win32cr::Graphics::GdiPlus::GpFontFamily*, emSize : Float32, style : Int32, unit : Win32cr::Graphics::GdiPlus::Unit, font : Win32cr::Graphics::GdiPlus::GpFont**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateFont(fontFamily, emSize, style, unit, font)
    {% end %}
  end

  def gdipCloneFont(font : Win32cr::Graphics::GdiPlus::GpFont*, cloneFont : Win32cr::Graphics::GdiPlus::GpFont**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCloneFont(font, cloneFont)
    {% end %}
  end

  def gdipDeleteFont(font : Win32cr::Graphics::GdiPlus::GpFont*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDeleteFont(font)
    {% end %}
  end

  def gdipGetFamily(font : Win32cr::Graphics::GdiPlus::GpFont*, family : Win32cr::Graphics::GdiPlus::GpFontFamily**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetFamily(font, family)
    {% end %}
  end

  def gdipGetFontStyle(font : Win32cr::Graphics::GdiPlus::GpFont*, style : Int32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetFontStyle(font, style)
    {% end %}
  end

  def gdipGetFontSize(font : Win32cr::Graphics::GdiPlus::GpFont*, size : Float32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetFontSize(font, size)
    {% end %}
  end

  def gdipGetFontUnit(font : Win32cr::Graphics::GdiPlus::GpFont*, unit : Win32cr::Graphics::GdiPlus::Unit*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetFontUnit(font, unit)
    {% end %}
  end

  def gdipGetFontHeight(font : Win32cr::Graphics::GdiPlus::GpFont*, graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, height : Float32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetFontHeight(font, graphics, height)
    {% end %}
  end

  def gdipGetFontHeightGivenDPI(font : Win32cr::Graphics::GdiPlus::GpFont*, dpi : Float32, height : Float32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetFontHeightGivenDPI(font, dpi, height)
    {% end %}
  end

  def gdipGetLogFontA(font : Win32cr::Graphics::GdiPlus::GpFont*, graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, logfontA : Win32cr::Graphics::Gdi::LOGFONTA*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetLogFontA(font, graphics, logfontA)
    {% end %}
  end

  def gdipGetLogFontW(font : Win32cr::Graphics::GdiPlus::GpFont*, graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, logfontW : Win32cr::Graphics::Gdi::LOGFONTW*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetLogFontW(font, graphics, logfontW)
    {% end %}
  end

  def gdipNewInstalledFontCollection(fontCollection : Win32cr::Graphics::GdiPlus::GpFontCollection**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipNewInstalledFontCollection(fontCollection)
    {% end %}
  end

  def gdipNewPrivateFontCollection(fontCollection : Win32cr::Graphics::GdiPlus::GpFontCollection**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipNewPrivateFontCollection(fontCollection)
    {% end %}
  end

  def gdipDeletePrivateFontCollection(fontCollection : Win32cr::Graphics::GdiPlus::GpFontCollection**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDeletePrivateFontCollection(fontCollection)
    {% end %}
  end

  def gdipGetFontCollectionFamilyCount(fontCollection : Win32cr::Graphics::GdiPlus::GpFontCollection*, numFound : Int32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetFontCollectionFamilyCount(fontCollection, numFound)
    {% end %}
  end

  def gdipGetFontCollectionFamilyList(fontCollection : Win32cr::Graphics::GdiPlus::GpFontCollection*, numSought : Int32, gpfamilies : Win32cr::Graphics::GdiPlus::GpFontFamily**, numFound : Int32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetFontCollectionFamilyList(fontCollection, numSought, gpfamilies, numFound)
    {% end %}
  end

  def gdipPrivateAddFontFile(fontCollection : Win32cr::Graphics::GdiPlus::GpFontCollection*, filename : Win32cr::Foundation::PWSTR) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipPrivateAddFontFile(fontCollection, filename)
    {% end %}
  end

  def gdipPrivateAddMemoryFont(fontCollection : Win32cr::Graphics::GdiPlus::GpFontCollection*, memory : Void*, length : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipPrivateAddMemoryFont(fontCollection, memory, length)
    {% end %}
  end

  def gdipDrawString(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, string : Win32cr::Foundation::PWSTR, length : Int32, font : Win32cr::Graphics::GdiPlus::GpFont*, layoutRect : Win32cr::Graphics::GdiPlus::RectF*, stringFormat : Win32cr::Graphics::GdiPlus::GpStringFormat*, brush : Win32cr::Graphics::GdiPlus::GpBrush*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawString(graphics, string, length, font, layoutRect, stringFormat, brush)
    {% end %}
  end

  def gdipMeasureString(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, string : Win32cr::Foundation::PWSTR, length : Int32, font : Win32cr::Graphics::GdiPlus::GpFont*, layoutRect : Win32cr::Graphics::GdiPlus::RectF*, stringFormat : Win32cr::Graphics::GdiPlus::GpStringFormat*, boundingBox : Win32cr::Graphics::GdiPlus::RectF*, codepointsFitted : Int32*, linesFilled : Int32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipMeasureString(graphics, string, length, font, layoutRect, stringFormat, boundingBox, codepointsFitted, linesFilled)
    {% end %}
  end

  def gdipMeasureCharacterRanges(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, string : Win32cr::Foundation::PWSTR, length : Int32, font : Win32cr::Graphics::GdiPlus::GpFont*, layoutRect : Win32cr::Graphics::GdiPlus::RectF*, stringFormat : Win32cr::Graphics::GdiPlus::GpStringFormat*, regionCount : Int32, regions : Win32cr::Graphics::GdiPlus::GpRegion**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipMeasureCharacterRanges(graphics, string, length, font, layoutRect, stringFormat, regionCount, regions)
    {% end %}
  end

  def gdipDrawDriverString(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, text : UInt16*, length : Int32, font : Win32cr::Graphics::GdiPlus::GpFont*, brush : Win32cr::Graphics::GdiPlus::GpBrush*, positions : Win32cr::Graphics::GdiPlus::PointF*, flags : Int32, matrix : Win32cr::Graphics::GdiPlus::Matrix*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawDriverString(graphics, text, length, font, brush, positions, flags, matrix)
    {% end %}
  end

  def gdipMeasureDriverString(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, text : UInt16*, length : Int32, font : Win32cr::Graphics::GdiPlus::GpFont*, positions : Win32cr::Graphics::GdiPlus::PointF*, flags : Int32, matrix : Win32cr::Graphics::GdiPlus::Matrix*, boundingBox : Win32cr::Graphics::GdiPlus::RectF*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipMeasureDriverString(graphics, text, length, font, positions, flags, matrix, boundingBox)
    {% end %}
  end

  def gdipCreateStringFormat(formatAttributes : Int32, language : UInt16, format : Win32cr::Graphics::GdiPlus::GpStringFormat**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateStringFormat(formatAttributes, language, format)
    {% end %}
  end

  def gdipStringFormatGetGenericDefault(format : Win32cr::Graphics::GdiPlus::GpStringFormat**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipStringFormatGetGenericDefault(format)
    {% end %}
  end

  def gdipStringFormatGetGenericTypographic(format : Win32cr::Graphics::GdiPlus::GpStringFormat**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipStringFormatGetGenericTypographic(format)
    {% end %}
  end

  def gdipDeleteStringFormat(format : Win32cr::Graphics::GdiPlus::GpStringFormat*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDeleteStringFormat(format)
    {% end %}
  end

  def gdipCloneStringFormat(format : Win32cr::Graphics::GdiPlus::GpStringFormat*, newFormat : Win32cr::Graphics::GdiPlus::GpStringFormat**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCloneStringFormat(format, newFormat)
    {% end %}
  end

  def gdipSetStringFormatFlags(format : Win32cr::Graphics::GdiPlus::GpStringFormat*, flags : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetStringFormatFlags(format, flags)
    {% end %}
  end

  def gdipGetStringFormatFlags(format : Win32cr::Graphics::GdiPlus::GpStringFormat*, flags : Int32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetStringFormatFlags(format, flags)
    {% end %}
  end

  def gdipSetStringFormatAlign(format : Win32cr::Graphics::GdiPlus::GpStringFormat*, align : Win32cr::Graphics::GdiPlus::StringAlignment) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetStringFormatAlign(format, align)
    {% end %}
  end

  def gdipGetStringFormatAlign(format : Win32cr::Graphics::GdiPlus::GpStringFormat*, align : Win32cr::Graphics::GdiPlus::StringAlignment*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetStringFormatAlign(format, align)
    {% end %}
  end

  def gdipSetStringFormatLineAlign(format : Win32cr::Graphics::GdiPlus::GpStringFormat*, align : Win32cr::Graphics::GdiPlus::StringAlignment) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetStringFormatLineAlign(format, align)
    {% end %}
  end

  def gdipGetStringFormatLineAlign(format : Win32cr::Graphics::GdiPlus::GpStringFormat*, align : Win32cr::Graphics::GdiPlus::StringAlignment*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetStringFormatLineAlign(format, align)
    {% end %}
  end

  def gdipSetStringFormatTrimming(format : Win32cr::Graphics::GdiPlus::GpStringFormat*, trimming : Win32cr::Graphics::GdiPlus::StringTrimming) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetStringFormatTrimming(format, trimming)
    {% end %}
  end

  def gdipGetStringFormatTrimming(format : Win32cr::Graphics::GdiPlus::GpStringFormat*, trimming : Win32cr::Graphics::GdiPlus::StringTrimming*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetStringFormatTrimming(format, trimming)
    {% end %}
  end

  def gdipSetStringFormatHotkeyPrefix(format : Win32cr::Graphics::GdiPlus::GpStringFormat*, hotkeyPrefix : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetStringFormatHotkeyPrefix(format, hotkeyPrefix)
    {% end %}
  end

  def gdipGetStringFormatHotkeyPrefix(format : Win32cr::Graphics::GdiPlus::GpStringFormat*, hotkeyPrefix : Int32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetStringFormatHotkeyPrefix(format, hotkeyPrefix)
    {% end %}
  end

  def gdipSetStringFormatTabStops(format : Win32cr::Graphics::GdiPlus::GpStringFormat*, firstTabOffset : Float32, count : Int32, tabStops : Float32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetStringFormatTabStops(format, firstTabOffset, count, tabStops)
    {% end %}
  end

  def gdipGetStringFormatTabStops(format : Win32cr::Graphics::GdiPlus::GpStringFormat*, count : Int32, firstTabOffset : Float32*, tabStops : Float32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetStringFormatTabStops(format, count, firstTabOffset, tabStops)
    {% end %}
  end

  def gdipGetStringFormatTabStopCount(format : Win32cr::Graphics::GdiPlus::GpStringFormat*, count : Int32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetStringFormatTabStopCount(format, count)
    {% end %}
  end

  def gdipSetStringFormatDigitSubstitution(format : Win32cr::Graphics::GdiPlus::GpStringFormat*, language : UInt16, substitute : Win32cr::Graphics::GdiPlus::StringDigitSubstitute) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetStringFormatDigitSubstitution(format, language, substitute)
    {% end %}
  end

  def gdipGetStringFormatDigitSubstitution(format : Win32cr::Graphics::GdiPlus::GpStringFormat*, language : UInt16*, substitute : Win32cr::Graphics::GdiPlus::StringDigitSubstitute*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetStringFormatDigitSubstitution(format, language, substitute)
    {% end %}
  end

  def gdipGetStringFormatMeasurableCharacterRangeCount(format : Win32cr::Graphics::GdiPlus::GpStringFormat*, count : Int32*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipGetStringFormatMeasurableCharacterRangeCount(format, count)
    {% end %}
  end

  def gdipSetStringFormatMeasurableCharacterRanges(format : Win32cr::Graphics::GdiPlus::GpStringFormat*, rangeCount : Int32, ranges : Win32cr::Graphics::GdiPlus::CharacterRange*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetStringFormatMeasurableCharacterRanges(format, rangeCount, ranges)
    {% end %}
  end

  def gdipCreateCachedBitmap(bitmap : Win32cr::Graphics::GdiPlus::GpBitmap*, graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, cachedBitmap : Win32cr::Graphics::GdiPlus::GpCachedBitmap**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipCreateCachedBitmap(bitmap, graphics, cachedBitmap)
    {% end %}
  end

  def gdipDeleteCachedBitmap(cachedBitmap : Win32cr::Graphics::GdiPlus::GpCachedBitmap*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDeleteCachedBitmap(cachedBitmap)
    {% end %}
  end

  def gdipDrawCachedBitmap(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, cachedBitmap : Win32cr::Graphics::GdiPlus::GpCachedBitmap*, x : Int32, y : Int32) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipDrawCachedBitmap(graphics, cachedBitmap, x, y)
    {% end %}
  end

  def gdipEmfToWmfBits(hemf : Win32cr::Graphics::Gdi::HENHMETAFILE, cbData16 : UInt32, pData16 : UInt8*, iMapMode : Int32, eFlags : Int32) : UInt32
    {% if !flag?(:docs) %}
    C.GdipEmfToWmfBits(hemf, cbData16, pData16, iMapMode, eFlags)
    {% end %}
  end

  def gdipSetImageAttributesCachedBackground(imageattr : Win32cr::Graphics::GdiPlus::GpImageAttributes*, enableFlag : Win32cr::Foundation::BOOL) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipSetImageAttributesCachedBackground(imageattr, enableFlag)
    {% end %}
  end

  def gdipTestControl(control : Win32cr::Graphics::GdiPlus::GpTestControlEnum, param1 : Void*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipTestControl(control, param1)
    {% end %}
  end

  def gdiplusNotificationHook(token : LibC::UIntPtrT*) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdiplusNotificationHook(token)
    {% end %}
  end

  def gdiplusNotificationUnhook(token : LibC::UIntPtrT) : Void
    {% if !flag?(:docs) %}
    C.GdiplusNotificationUnhook(token)
    {% end %}
  end

  def gdipConvertToEmfPlus(refGraphics : Win32cr::Graphics::GdiPlus::GpGraphics*, metafile : Win32cr::Graphics::GdiPlus::GpMetafile*, conversionFailureFlag : Int32*, emfType : Win32cr::Graphics::GdiPlus::EmfType, description : Win32cr::Foundation::PWSTR, out_metafile : Win32cr::Graphics::GdiPlus::GpMetafile**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipConvertToEmfPlus(refGraphics, metafile, conversionFailureFlag, emfType, description, out_metafile)
    {% end %}
  end

  def gdipConvertToEmfPlusToFile(refGraphics : Win32cr::Graphics::GdiPlus::GpGraphics*, metafile : Win32cr::Graphics::GdiPlus::GpMetafile*, conversionFailureFlag : Int32*, filename : Win32cr::Foundation::PWSTR, emfType : Win32cr::Graphics::GdiPlus::EmfType, description : Win32cr::Foundation::PWSTR, out_metafile : Win32cr::Graphics::GdiPlus::GpMetafile**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipConvertToEmfPlusToFile(refGraphics, metafile, conversionFailureFlag, filename, emfType, description, out_metafile)
    {% end %}
  end

  def gdipConvertToEmfPlusToStream(refGraphics : Win32cr::Graphics::GdiPlus::GpGraphics*, metafile : Win32cr::Graphics::GdiPlus::GpMetafile*, conversionFailureFlag : Int32*, stream : Void*, emfType : Win32cr::Graphics::GdiPlus::EmfType, description : Win32cr::Foundation::PWSTR, out_metafile : Win32cr::Graphics::GdiPlus::GpMetafile**) : Win32cr::Graphics::GdiPlus::Status
    {% if !flag?(:docs) %}
    C.GdipConvertToEmfPlusToStream(refGraphics, metafile, conversionFailureFlag, stream, emfType, description, out_metafile)
    {% end %}
  end

  @[Link("gdiplus")]
  {% if !flag?(:docs) %}
  lib C
    # :nodoc:
    fun GdipAlloc(size : LibC::UIntPtrT) : Void*

    # :nodoc:
    fun GdipFree(ptr : Void*) : Void

    # :nodoc:
    fun GdiplusStartup(token : LibC::UIntPtrT*, input : Win32cr::Graphics::GdiPlus::GdiplusStartupInput*, output : Win32cr::Graphics::GdiPlus::GdiplusStartupOutput*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdiplusShutdown(token : LibC::UIntPtrT) : Void

    # :nodoc:
    fun GdipCreateEffect(guid : LibC::GUID, effect : Win32cr::Graphics::GdiPlus::CGpEffect**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDeleteEffect(effect : Win32cr::Graphics::GdiPlus::CGpEffect*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetEffectParameterSize(effect : Win32cr::Graphics::GdiPlus::CGpEffect*, size : UInt32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetEffectParameters(effect : Win32cr::Graphics::GdiPlus::CGpEffect*, params : Void*, size : UInt32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetEffectParameters(effect : Win32cr::Graphics::GdiPlus::CGpEffect*, size : UInt32*, params : Void*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreatePath(brushMode : Win32cr::Graphics::GdiPlus::FillMode, path : Win32cr::Graphics::GdiPlus::GpPath**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreatePath2(param0 : Win32cr::Graphics::GdiPlus::PointF*, param1 : UInt8*, param2 : Int32, param3 : Win32cr::Graphics::GdiPlus::FillMode, path : Win32cr::Graphics::GdiPlus::GpPath**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreatePath2I(param0 : Win32cr::Graphics::GdiPlus::Point*, param1 : UInt8*, param2 : Int32, param3 : Win32cr::Graphics::GdiPlus::FillMode, path : Win32cr::Graphics::GdiPlus::GpPath**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipClonePath(path : Win32cr::Graphics::GdiPlus::GpPath*, clonePath : Win32cr::Graphics::GdiPlus::GpPath**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDeletePath(path : Win32cr::Graphics::GdiPlus::GpPath*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipResetPath(path : Win32cr::Graphics::GdiPlus::GpPath*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPointCount(path : Win32cr::Graphics::GdiPlus::GpPath*, count : Int32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPathTypes(path : Win32cr::Graphics::GdiPlus::GpPath*, types : UInt8*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPathPoints(param0 : Win32cr::Graphics::GdiPlus::GpPath*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPathPointsI(param0 : Win32cr::Graphics::GdiPlus::GpPath*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPathFillMode(path : Win32cr::Graphics::GdiPlus::GpPath*, fillmode : Win32cr::Graphics::GdiPlus::FillMode*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetPathFillMode(path : Win32cr::Graphics::GdiPlus::GpPath*, fillmode : Win32cr::Graphics::GdiPlus::FillMode) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPathData(path : Win32cr::Graphics::GdiPlus::GpPath*, pathData : Win32cr::Graphics::GdiPlus::PathData*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipStartPathFigure(path : Win32cr::Graphics::GdiPlus::GpPath*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipClosePathFigure(path : Win32cr::Graphics::GdiPlus::GpPath*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipClosePathFigures(path : Win32cr::Graphics::GdiPlus::GpPath*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetPathMarker(path : Win32cr::Graphics::GdiPlus::GpPath*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipClearPathMarkers(path : Win32cr::Graphics::GdiPlus::GpPath*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipReversePath(path : Win32cr::Graphics::GdiPlus::GpPath*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPathLastPoint(path : Win32cr::Graphics::GdiPlus::GpPath*, lastPoint : Win32cr::Graphics::GdiPlus::PointF*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipAddPathLine(path : Win32cr::Graphics::GdiPlus::GpPath*, x1 : Float32, y1 : Float32, x2 : Float32, y2 : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipAddPathLine2(path : Win32cr::Graphics::GdiPlus::GpPath*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipAddPathArc(path : Win32cr::Graphics::GdiPlus::GpPath*, x : Float32, y : Float32, width : Float32, height : Float32, startAngle : Float32, sweepAngle : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipAddPathBezier(path : Win32cr::Graphics::GdiPlus::GpPath*, x1 : Float32, y1 : Float32, x2 : Float32, y2 : Float32, x3 : Float32, y3 : Float32, x4 : Float32, y4 : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipAddPathBeziers(path : Win32cr::Graphics::GdiPlus::GpPath*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipAddPathCurve(path : Win32cr::Graphics::GdiPlus::GpPath*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipAddPathCurve2(path : Win32cr::Graphics::GdiPlus::GpPath*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32, tension : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipAddPathCurve3(path : Win32cr::Graphics::GdiPlus::GpPath*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32, offset : Int32, numberOfSegments : Int32, tension : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipAddPathClosedCurve(path : Win32cr::Graphics::GdiPlus::GpPath*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipAddPathClosedCurve2(path : Win32cr::Graphics::GdiPlus::GpPath*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32, tension : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipAddPathRectangle(path : Win32cr::Graphics::GdiPlus::GpPath*, x : Float32, y : Float32, width : Float32, height : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipAddPathRectangles(path : Win32cr::Graphics::GdiPlus::GpPath*, rects : Win32cr::Graphics::GdiPlus::RectF*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipAddPathEllipse(path : Win32cr::Graphics::GdiPlus::GpPath*, x : Float32, y : Float32, width : Float32, height : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipAddPathPie(path : Win32cr::Graphics::GdiPlus::GpPath*, x : Float32, y : Float32, width : Float32, height : Float32, startAngle : Float32, sweepAngle : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipAddPathPolygon(path : Win32cr::Graphics::GdiPlus::GpPath*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipAddPathPath(path : Win32cr::Graphics::GdiPlus::GpPath*, addingPath : Win32cr::Graphics::GdiPlus::GpPath*, connect : Win32cr::Foundation::BOOL) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipAddPathString(path : Win32cr::Graphics::GdiPlus::GpPath*, string : Win32cr::Foundation::PWSTR, length : Int32, family : Win32cr::Graphics::GdiPlus::GpFontFamily*, style : Int32, emSize : Float32, layoutRect : Win32cr::Graphics::GdiPlus::RectF*, format : Win32cr::Graphics::GdiPlus::GpStringFormat*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipAddPathStringI(path : Win32cr::Graphics::GdiPlus::GpPath*, string : Win32cr::Foundation::PWSTR, length : Int32, family : Win32cr::Graphics::GdiPlus::GpFontFamily*, style : Int32, emSize : Float32, layoutRect : Win32cr::Graphics::GdiPlus::Rect*, format : Win32cr::Graphics::GdiPlus::GpStringFormat*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipAddPathLineI(path : Win32cr::Graphics::GdiPlus::GpPath*, x1 : Int32, y1 : Int32, x2 : Int32, y2 : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipAddPathLine2I(path : Win32cr::Graphics::GdiPlus::GpPath*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipAddPathArcI(path : Win32cr::Graphics::GdiPlus::GpPath*, x : Int32, y : Int32, width : Int32, height : Int32, startAngle : Float32, sweepAngle : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipAddPathBezierI(path : Win32cr::Graphics::GdiPlus::GpPath*, x1 : Int32, y1 : Int32, x2 : Int32, y2 : Int32, x3 : Int32, y3 : Int32, x4 : Int32, y4 : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipAddPathBeziersI(path : Win32cr::Graphics::GdiPlus::GpPath*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipAddPathCurveI(path : Win32cr::Graphics::GdiPlus::GpPath*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipAddPathCurve2I(path : Win32cr::Graphics::GdiPlus::GpPath*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32, tension : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipAddPathCurve3I(path : Win32cr::Graphics::GdiPlus::GpPath*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32, offset : Int32, numberOfSegments : Int32, tension : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipAddPathClosedCurveI(path : Win32cr::Graphics::GdiPlus::GpPath*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipAddPathClosedCurve2I(path : Win32cr::Graphics::GdiPlus::GpPath*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32, tension : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipAddPathRectangleI(path : Win32cr::Graphics::GdiPlus::GpPath*, x : Int32, y : Int32, width : Int32, height : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipAddPathRectanglesI(path : Win32cr::Graphics::GdiPlus::GpPath*, rects : Win32cr::Graphics::GdiPlus::Rect*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipAddPathEllipseI(path : Win32cr::Graphics::GdiPlus::GpPath*, x : Int32, y : Int32, width : Int32, height : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipAddPathPieI(path : Win32cr::Graphics::GdiPlus::GpPath*, x : Int32, y : Int32, width : Int32, height : Int32, startAngle : Float32, sweepAngle : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipAddPathPolygonI(path : Win32cr::Graphics::GdiPlus::GpPath*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipFlattenPath(path : Win32cr::Graphics::GdiPlus::GpPath*, matrix : Win32cr::Graphics::GdiPlus::Matrix*, flatness : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipWindingModeOutline(path : Win32cr::Graphics::GdiPlus::GpPath*, matrix : Win32cr::Graphics::GdiPlus::Matrix*, flatness : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipWidenPath(nativePath : Win32cr::Graphics::GdiPlus::GpPath*, pen : Win32cr::Graphics::GdiPlus::GpPen*, matrix : Win32cr::Graphics::GdiPlus::Matrix*, flatness : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipWarpPath(path : Win32cr::Graphics::GdiPlus::GpPath*, matrix : Win32cr::Graphics::GdiPlus::Matrix*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32, srcx : Float32, srcy : Float32, srcwidth : Float32, srcheight : Float32, warpMode : Win32cr::Graphics::GdiPlus::WarpMode, flatness : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipTransformPath(path : Win32cr::Graphics::GdiPlus::GpPath*, matrix : Win32cr::Graphics::GdiPlus::Matrix*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPathWorldBounds(path : Win32cr::Graphics::GdiPlus::GpPath*, bounds : Win32cr::Graphics::GdiPlus::RectF*, matrix : Win32cr::Graphics::GdiPlus::Matrix*, pen : Win32cr::Graphics::GdiPlus::GpPen*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPathWorldBoundsI(path : Win32cr::Graphics::GdiPlus::GpPath*, bounds : Win32cr::Graphics::GdiPlus::Rect*, matrix : Win32cr::Graphics::GdiPlus::Matrix*, pen : Win32cr::Graphics::GdiPlus::GpPen*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipIsVisiblePathPoint(path : Win32cr::Graphics::GdiPlus::GpPath*, x : Float32, y : Float32, graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, result : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipIsVisiblePathPointI(path : Win32cr::Graphics::GdiPlus::GpPath*, x : Int32, y : Int32, graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, result : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipIsOutlineVisiblePathPoint(path : Win32cr::Graphics::GdiPlus::GpPath*, x : Float32, y : Float32, pen : Win32cr::Graphics::GdiPlus::GpPen*, graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, result : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipIsOutlineVisiblePathPointI(path : Win32cr::Graphics::GdiPlus::GpPath*, x : Int32, y : Int32, pen : Win32cr::Graphics::GdiPlus::GpPen*, graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, result : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreatePathIter(iterator : Win32cr::Graphics::GdiPlus::GpPathIterator**, path : Win32cr::Graphics::GdiPlus::GpPath*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDeletePathIter(iterator : Win32cr::Graphics::GdiPlus::GpPathIterator*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipPathIterNextSubpath(iterator : Win32cr::Graphics::GdiPlus::GpPathIterator*, resultCount : Int32*, startIndex : Int32*, endIndex : Int32*, isClosed : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipPathIterNextSubpathPath(iterator : Win32cr::Graphics::GdiPlus::GpPathIterator*, resultCount : Int32*, path : Win32cr::Graphics::GdiPlus::GpPath*, isClosed : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipPathIterNextPathType(iterator : Win32cr::Graphics::GdiPlus::GpPathIterator*, resultCount : Int32*, pathType : UInt8*, startIndex : Int32*, endIndex : Int32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipPathIterNextMarker(iterator : Win32cr::Graphics::GdiPlus::GpPathIterator*, resultCount : Int32*, startIndex : Int32*, endIndex : Int32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipPathIterNextMarkerPath(iterator : Win32cr::Graphics::GdiPlus::GpPathIterator*, resultCount : Int32*, path : Win32cr::Graphics::GdiPlus::GpPath*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipPathIterGetCount(iterator : Win32cr::Graphics::GdiPlus::GpPathIterator*, count : Int32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipPathIterGetSubpathCount(iterator : Win32cr::Graphics::GdiPlus::GpPathIterator*, count : Int32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipPathIterIsValid(iterator : Win32cr::Graphics::GdiPlus::GpPathIterator*, valid : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipPathIterHasCurve(iterator : Win32cr::Graphics::GdiPlus::GpPathIterator*, hasCurve : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipPathIterRewind(iterator : Win32cr::Graphics::GdiPlus::GpPathIterator*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipPathIterEnumerate(iterator : Win32cr::Graphics::GdiPlus::GpPathIterator*, resultCount : Int32*, points : Win32cr::Graphics::GdiPlus::PointF*, types : UInt8*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipPathIterCopyData(iterator : Win32cr::Graphics::GdiPlus::GpPathIterator*, resultCount : Int32*, points : Win32cr::Graphics::GdiPlus::PointF*, types : UInt8*, startIndex : Int32, endIndex : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateMatrix(matrix : Win32cr::Graphics::GdiPlus::Matrix**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateMatrix2(m11 : Float32, m12 : Float32, m21 : Float32, m22 : Float32, dx : Float32, dy : Float32, matrix : Win32cr::Graphics::GdiPlus::Matrix**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateMatrix3(rect : Win32cr::Graphics::GdiPlus::RectF*, dstplg : Win32cr::Graphics::GdiPlus::PointF*, matrix : Win32cr::Graphics::GdiPlus::Matrix**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateMatrix3I(rect : Win32cr::Graphics::GdiPlus::Rect*, dstplg : Win32cr::Graphics::GdiPlus::Point*, matrix : Win32cr::Graphics::GdiPlus::Matrix**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCloneMatrix(matrix : Win32cr::Graphics::GdiPlus::Matrix*, cloneMatrix : Win32cr::Graphics::GdiPlus::Matrix**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDeleteMatrix(matrix : Win32cr::Graphics::GdiPlus::Matrix*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetMatrixElements(matrix : Win32cr::Graphics::GdiPlus::Matrix*, m11 : Float32, m12 : Float32, m21 : Float32, m22 : Float32, dx : Float32, dy : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipMultiplyMatrix(matrix : Win32cr::Graphics::GdiPlus::Matrix*, matrix2 : Win32cr::Graphics::GdiPlus::Matrix*, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipTranslateMatrix(matrix : Win32cr::Graphics::GdiPlus::Matrix*, offsetX : Float32, offsetY : Float32, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipScaleMatrix(matrix : Win32cr::Graphics::GdiPlus::Matrix*, scaleX : Float32, scaleY : Float32, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipRotateMatrix(matrix : Win32cr::Graphics::GdiPlus::Matrix*, angle : Float32, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipShearMatrix(matrix : Win32cr::Graphics::GdiPlus::Matrix*, shearX : Float32, shearY : Float32, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipInvertMatrix(matrix : Win32cr::Graphics::GdiPlus::Matrix*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipTransformMatrixPoints(matrix : Win32cr::Graphics::GdiPlus::Matrix*, pts : Win32cr::Graphics::GdiPlus::PointF*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipTransformMatrixPointsI(matrix : Win32cr::Graphics::GdiPlus::Matrix*, pts : Win32cr::Graphics::GdiPlus::Point*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipVectorTransformMatrixPoints(matrix : Win32cr::Graphics::GdiPlus::Matrix*, pts : Win32cr::Graphics::GdiPlus::PointF*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipVectorTransformMatrixPointsI(matrix : Win32cr::Graphics::GdiPlus::Matrix*, pts : Win32cr::Graphics::GdiPlus::Point*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetMatrixElements(matrix : Win32cr::Graphics::GdiPlus::Matrix*, matrixOut : Float32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipIsMatrixInvertible(matrix : Win32cr::Graphics::GdiPlus::Matrix*, result : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipIsMatrixIdentity(matrix : Win32cr::Graphics::GdiPlus::Matrix*, result : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipIsMatrixEqual(matrix : Win32cr::Graphics::GdiPlus::Matrix*, matrix2 : Win32cr::Graphics::GdiPlus::Matrix*, result : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateRegion(region : Win32cr::Graphics::GdiPlus::GpRegion**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateRegionRect(rect : Win32cr::Graphics::GdiPlus::RectF*, region : Win32cr::Graphics::GdiPlus::GpRegion**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateRegionRectI(rect : Win32cr::Graphics::GdiPlus::Rect*, region : Win32cr::Graphics::GdiPlus::GpRegion**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateRegionPath(path : Win32cr::Graphics::GdiPlus::GpPath*, region : Win32cr::Graphics::GdiPlus::GpRegion**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateRegionRgnData(regionData : UInt8*, size : Int32, region : Win32cr::Graphics::GdiPlus::GpRegion**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateRegionHrgn(hRgn : Win32cr::Graphics::Gdi::HRGN, region : Win32cr::Graphics::GdiPlus::GpRegion**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCloneRegion(region : Win32cr::Graphics::GdiPlus::GpRegion*, cloneRegion : Win32cr::Graphics::GdiPlus::GpRegion**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDeleteRegion(region : Win32cr::Graphics::GdiPlus::GpRegion*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetInfinite(region : Win32cr::Graphics::GdiPlus::GpRegion*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetEmpty(region : Win32cr::Graphics::GdiPlus::GpRegion*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCombineRegionRect(region : Win32cr::Graphics::GdiPlus::GpRegion*, rect : Win32cr::Graphics::GdiPlus::RectF*, combineMode : Win32cr::Graphics::GdiPlus::CombineMode) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCombineRegionRectI(region : Win32cr::Graphics::GdiPlus::GpRegion*, rect : Win32cr::Graphics::GdiPlus::Rect*, combineMode : Win32cr::Graphics::GdiPlus::CombineMode) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCombineRegionPath(region : Win32cr::Graphics::GdiPlus::GpRegion*, path : Win32cr::Graphics::GdiPlus::GpPath*, combineMode : Win32cr::Graphics::GdiPlus::CombineMode) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCombineRegionRegion(region : Win32cr::Graphics::GdiPlus::GpRegion*, region2 : Win32cr::Graphics::GdiPlus::GpRegion*, combineMode : Win32cr::Graphics::GdiPlus::CombineMode) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipTranslateRegion(region : Win32cr::Graphics::GdiPlus::GpRegion*, dx : Float32, dy : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipTranslateRegionI(region : Win32cr::Graphics::GdiPlus::GpRegion*, dx : Int32, dy : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipTransformRegion(region : Win32cr::Graphics::GdiPlus::GpRegion*, matrix : Win32cr::Graphics::GdiPlus::Matrix*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetRegionBounds(region : Win32cr::Graphics::GdiPlus::GpRegion*, graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, rect : Win32cr::Graphics::GdiPlus::RectF*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetRegionBoundsI(region : Win32cr::Graphics::GdiPlus::GpRegion*, graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, rect : Win32cr::Graphics::GdiPlus::Rect*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetRegionHRgn(region : Win32cr::Graphics::GdiPlus::GpRegion*, graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, hRgn : Win32cr::Graphics::Gdi::HRGN*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipIsEmptyRegion(region : Win32cr::Graphics::GdiPlus::GpRegion*, graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, result : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipIsInfiniteRegion(region : Win32cr::Graphics::GdiPlus::GpRegion*, graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, result : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipIsEqualRegion(region : Win32cr::Graphics::GdiPlus::GpRegion*, region2 : Win32cr::Graphics::GdiPlus::GpRegion*, graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, result : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetRegionDataSize(region : Win32cr::Graphics::GdiPlus::GpRegion*, bufferSize : UInt32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetRegionData(region : Win32cr::Graphics::GdiPlus::GpRegion*, buffer : UInt8*, bufferSize : UInt32, sizeFilled : UInt32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipIsVisibleRegionPoint(region : Win32cr::Graphics::GdiPlus::GpRegion*, x : Float32, y : Float32, graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, result : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipIsVisibleRegionPointI(region : Win32cr::Graphics::GdiPlus::GpRegion*, x : Int32, y : Int32, graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, result : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipIsVisibleRegionRect(region : Win32cr::Graphics::GdiPlus::GpRegion*, x : Float32, y : Float32, width : Float32, height : Float32, graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, result : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipIsVisibleRegionRectI(region : Win32cr::Graphics::GdiPlus::GpRegion*, x : Int32, y : Int32, width : Int32, height : Int32, graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, result : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetRegionScansCount(region : Win32cr::Graphics::GdiPlus::GpRegion*, count : UInt32*, matrix : Win32cr::Graphics::GdiPlus::Matrix*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetRegionScans(region : Win32cr::Graphics::GdiPlus::GpRegion*, rects : Win32cr::Graphics::GdiPlus::RectF*, count : Int32*, matrix : Win32cr::Graphics::GdiPlus::Matrix*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetRegionScansI(region : Win32cr::Graphics::GdiPlus::GpRegion*, rects : Win32cr::Graphics::GdiPlus::Rect*, count : Int32*, matrix : Win32cr::Graphics::GdiPlus::Matrix*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCloneBrush(brush : Win32cr::Graphics::GdiPlus::GpBrush*, cloneBrush : Win32cr::Graphics::GdiPlus::GpBrush**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDeleteBrush(brush : Win32cr::Graphics::GdiPlus::GpBrush*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetBrushType(brush : Win32cr::Graphics::GdiPlus::GpBrush*, type__ : Win32cr::Graphics::GdiPlus::BrushType*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateHatchBrush(hatchstyle : Win32cr::Graphics::GdiPlus::HatchStyle, forecol : UInt32, backcol : UInt32, brush : Win32cr::Graphics::GdiPlus::GpHatch**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetHatchStyle(brush : Win32cr::Graphics::GdiPlus::GpHatch*, hatchstyle : Win32cr::Graphics::GdiPlus::HatchStyle*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetHatchForegroundColor(brush : Win32cr::Graphics::GdiPlus::GpHatch*, forecol : UInt32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetHatchBackgroundColor(brush : Win32cr::Graphics::GdiPlus::GpHatch*, backcol : UInt32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateTexture(image : Win32cr::Graphics::GdiPlus::GpImage*, wrapmode : Win32cr::Graphics::GdiPlus::WrapMode, texture : Win32cr::Graphics::GdiPlus::GpTexture**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateTexture2(image : Win32cr::Graphics::GdiPlus::GpImage*, wrapmode : Win32cr::Graphics::GdiPlus::WrapMode, x : Float32, y : Float32, width : Float32, height : Float32, texture : Win32cr::Graphics::GdiPlus::GpTexture**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateTextureIA(image : Win32cr::Graphics::GdiPlus::GpImage*, imageAttributes : Win32cr::Graphics::GdiPlus::GpImageAttributes*, x : Float32, y : Float32, width : Float32, height : Float32, texture : Win32cr::Graphics::GdiPlus::GpTexture**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateTexture2I(image : Win32cr::Graphics::GdiPlus::GpImage*, wrapmode : Win32cr::Graphics::GdiPlus::WrapMode, x : Int32, y : Int32, width : Int32, height : Int32, texture : Win32cr::Graphics::GdiPlus::GpTexture**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateTextureIAI(image : Win32cr::Graphics::GdiPlus::GpImage*, imageAttributes : Win32cr::Graphics::GdiPlus::GpImageAttributes*, x : Int32, y : Int32, width : Int32, height : Int32, texture : Win32cr::Graphics::GdiPlus::GpTexture**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetTextureTransform(brush : Win32cr::Graphics::GdiPlus::GpTexture*, matrix : Win32cr::Graphics::GdiPlus::Matrix*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetTextureTransform(brush : Win32cr::Graphics::GdiPlus::GpTexture*, matrix : Win32cr::Graphics::GdiPlus::Matrix*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipResetTextureTransform(brush : Win32cr::Graphics::GdiPlus::GpTexture*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipMultiplyTextureTransform(brush : Win32cr::Graphics::GdiPlus::GpTexture*, matrix : Win32cr::Graphics::GdiPlus::Matrix*, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipTranslateTextureTransform(brush : Win32cr::Graphics::GdiPlus::GpTexture*, dx : Float32, dy : Float32, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipScaleTextureTransform(brush : Win32cr::Graphics::GdiPlus::GpTexture*, sx : Float32, sy : Float32, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipRotateTextureTransform(brush : Win32cr::Graphics::GdiPlus::GpTexture*, angle : Float32, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetTextureWrapMode(brush : Win32cr::Graphics::GdiPlus::GpTexture*, wrapmode : Win32cr::Graphics::GdiPlus::WrapMode) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetTextureWrapMode(brush : Win32cr::Graphics::GdiPlus::GpTexture*, wrapmode : Win32cr::Graphics::GdiPlus::WrapMode*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetTextureImage(brush : Win32cr::Graphics::GdiPlus::GpTexture*, image : Win32cr::Graphics::GdiPlus::GpImage**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateSolidFill(color : UInt32, brush : Win32cr::Graphics::GdiPlus::GpSolidFill**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetSolidFillColor(brush : Win32cr::Graphics::GdiPlus::GpSolidFill*, color : UInt32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetSolidFillColor(brush : Win32cr::Graphics::GdiPlus::GpSolidFill*, color : UInt32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateLineBrush(point1 : Win32cr::Graphics::GdiPlus::PointF*, point2 : Win32cr::Graphics::GdiPlus::PointF*, color1 : UInt32, color2 : UInt32, wrapMode : Win32cr::Graphics::GdiPlus::WrapMode, lineGradient : Win32cr::Graphics::GdiPlus::GpLineGradient**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateLineBrushI(point1 : Win32cr::Graphics::GdiPlus::Point*, point2 : Win32cr::Graphics::GdiPlus::Point*, color1 : UInt32, color2 : UInt32, wrapMode : Win32cr::Graphics::GdiPlus::WrapMode, lineGradient : Win32cr::Graphics::GdiPlus::GpLineGradient**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateLineBrushFromRect(rect : Win32cr::Graphics::GdiPlus::RectF*, color1 : UInt32, color2 : UInt32, mode : Win32cr::Graphics::GdiPlus::LinearGradientMode, wrapMode : Win32cr::Graphics::GdiPlus::WrapMode, lineGradient : Win32cr::Graphics::GdiPlus::GpLineGradient**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateLineBrushFromRectI(rect : Win32cr::Graphics::GdiPlus::Rect*, color1 : UInt32, color2 : UInt32, mode : Win32cr::Graphics::GdiPlus::LinearGradientMode, wrapMode : Win32cr::Graphics::GdiPlus::WrapMode, lineGradient : Win32cr::Graphics::GdiPlus::GpLineGradient**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateLineBrushFromRectWithAngle(rect : Win32cr::Graphics::GdiPlus::RectF*, color1 : UInt32, color2 : UInt32, angle : Float32, isAngleScalable : Win32cr::Foundation::BOOL, wrapMode : Win32cr::Graphics::GdiPlus::WrapMode, lineGradient : Win32cr::Graphics::GdiPlus::GpLineGradient**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateLineBrushFromRectWithAngleI(rect : Win32cr::Graphics::GdiPlus::Rect*, color1 : UInt32, color2 : UInt32, angle : Float32, isAngleScalable : Win32cr::Foundation::BOOL, wrapMode : Win32cr::Graphics::GdiPlus::WrapMode, lineGradient : Win32cr::Graphics::GdiPlus::GpLineGradient**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetLineColors(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, color1 : UInt32, color2 : UInt32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetLineColors(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, colors : UInt32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetLineRect(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, rect : Win32cr::Graphics::GdiPlus::RectF*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetLineRectI(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, rect : Win32cr::Graphics::GdiPlus::Rect*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetLineGammaCorrection(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, useGammaCorrection : Win32cr::Foundation::BOOL) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetLineGammaCorrection(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, useGammaCorrection : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetLineBlendCount(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, count : Int32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetLineBlend(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, blend : Float32*, positions : Float32*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetLineBlend(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, blend : Float32*, positions : Float32*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetLinePresetBlendCount(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, count : Int32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetLinePresetBlend(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, blend : UInt32*, positions : Float32*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetLinePresetBlend(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, blend : UInt32*, positions : Float32*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetLineSigmaBlend(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, focus : Float32, scale : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetLineLinearBlend(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, focus : Float32, scale : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetLineWrapMode(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, wrapmode : Win32cr::Graphics::GdiPlus::WrapMode) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetLineWrapMode(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, wrapmode : Win32cr::Graphics::GdiPlus::WrapMode*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetLineTransform(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, matrix : Win32cr::Graphics::GdiPlus::Matrix*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetLineTransform(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, matrix : Win32cr::Graphics::GdiPlus::Matrix*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipResetLineTransform(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipMultiplyLineTransform(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, matrix : Win32cr::Graphics::GdiPlus::Matrix*, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipTranslateLineTransform(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, dx : Float32, dy : Float32, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipScaleLineTransform(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, sx : Float32, sy : Float32, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipRotateLineTransform(brush : Win32cr::Graphics::GdiPlus::GpLineGradient*, angle : Float32, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreatePathGradient(points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32, wrapMode : Win32cr::Graphics::GdiPlus::WrapMode, polyGradient : Win32cr::Graphics::GdiPlus::GpPathGradient**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreatePathGradientI(points : Win32cr::Graphics::GdiPlus::Point*, count : Int32, wrapMode : Win32cr::Graphics::GdiPlus::WrapMode, polyGradient : Win32cr::Graphics::GdiPlus::GpPathGradient**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreatePathGradientFromPath(path : Win32cr::Graphics::GdiPlus::GpPath*, polyGradient : Win32cr::Graphics::GdiPlus::GpPathGradient**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPathGradientCenterColor(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, colors : UInt32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetPathGradientCenterColor(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, colors : UInt32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPathGradientSurroundColorsWithCount(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, color : UInt32*, count : Int32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetPathGradientSurroundColorsWithCount(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, color : UInt32*, count : Int32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPathGradientPath(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, path : Win32cr::Graphics::GdiPlus::GpPath*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetPathGradientPath(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, path : Win32cr::Graphics::GdiPlus::GpPath*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPathGradientCenterPoint(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, points : Win32cr::Graphics::GdiPlus::PointF*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPathGradientCenterPointI(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, points : Win32cr::Graphics::GdiPlus::Point*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetPathGradientCenterPoint(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, points : Win32cr::Graphics::GdiPlus::PointF*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetPathGradientCenterPointI(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, points : Win32cr::Graphics::GdiPlus::Point*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPathGradientRect(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, rect : Win32cr::Graphics::GdiPlus::RectF*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPathGradientRectI(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, rect : Win32cr::Graphics::GdiPlus::Rect*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPathGradientPointCount(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, count : Int32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPathGradientSurroundColorCount(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, count : Int32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetPathGradientGammaCorrection(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, useGammaCorrection : Win32cr::Foundation::BOOL) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPathGradientGammaCorrection(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, useGammaCorrection : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPathGradientBlendCount(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, count : Int32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPathGradientBlend(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, blend : Float32*, positions : Float32*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetPathGradientBlend(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, blend : Float32*, positions : Float32*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPathGradientPresetBlendCount(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, count : Int32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPathGradientPresetBlend(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, blend : UInt32*, positions : Float32*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetPathGradientPresetBlend(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, blend : UInt32*, positions : Float32*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetPathGradientSigmaBlend(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, focus : Float32, scale : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetPathGradientLinearBlend(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, focus : Float32, scale : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPathGradientWrapMode(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, wrapmode : Win32cr::Graphics::GdiPlus::WrapMode*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetPathGradientWrapMode(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, wrapmode : Win32cr::Graphics::GdiPlus::WrapMode) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPathGradientTransform(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, matrix : Win32cr::Graphics::GdiPlus::Matrix*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetPathGradientTransform(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, matrix : Win32cr::Graphics::GdiPlus::Matrix*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipResetPathGradientTransform(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipMultiplyPathGradientTransform(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, matrix : Win32cr::Graphics::GdiPlus::Matrix*, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipTranslatePathGradientTransform(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, dx : Float32, dy : Float32, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipScalePathGradientTransform(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, sx : Float32, sy : Float32, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipRotatePathGradientTransform(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, angle : Float32, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPathGradientFocusScales(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, xScale : Float32*, yScale : Float32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetPathGradientFocusScales(brush : Win32cr::Graphics::GdiPlus::GpPathGradient*, xScale : Float32, yScale : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreatePen1(color : UInt32, width : Float32, unit : Win32cr::Graphics::GdiPlus::Unit, pen : Win32cr::Graphics::GdiPlus::GpPen**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreatePen2(brush : Win32cr::Graphics::GdiPlus::GpBrush*, width : Float32, unit : Win32cr::Graphics::GdiPlus::Unit, pen : Win32cr::Graphics::GdiPlus::GpPen**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipClonePen(pen : Win32cr::Graphics::GdiPlus::GpPen*, clonepen : Win32cr::Graphics::GdiPlus::GpPen**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDeletePen(pen : Win32cr::Graphics::GdiPlus::GpPen*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetPenWidth(pen : Win32cr::Graphics::GdiPlus::GpPen*, width : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPenWidth(pen : Win32cr::Graphics::GdiPlus::GpPen*, width : Float32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetPenUnit(pen : Win32cr::Graphics::GdiPlus::GpPen*, unit : Win32cr::Graphics::GdiPlus::Unit) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPenUnit(pen : Win32cr::Graphics::GdiPlus::GpPen*, unit : Win32cr::Graphics::GdiPlus::Unit*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetPenLineCap197819(pen : Win32cr::Graphics::GdiPlus::GpPen*, startCap : Win32cr::Graphics::GdiPlus::LineCap, endCap : Win32cr::Graphics::GdiPlus::LineCap, dashCap : Win32cr::Graphics::GdiPlus::DashCap) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetPenStartCap(pen : Win32cr::Graphics::GdiPlus::GpPen*, startCap : Win32cr::Graphics::GdiPlus::LineCap) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetPenEndCap(pen : Win32cr::Graphics::GdiPlus::GpPen*, endCap : Win32cr::Graphics::GdiPlus::LineCap) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetPenDashCap197819(pen : Win32cr::Graphics::GdiPlus::GpPen*, dashCap : Win32cr::Graphics::GdiPlus::DashCap) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPenStartCap(pen : Win32cr::Graphics::GdiPlus::GpPen*, startCap : Win32cr::Graphics::GdiPlus::LineCap*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPenEndCap(pen : Win32cr::Graphics::GdiPlus::GpPen*, endCap : Win32cr::Graphics::GdiPlus::LineCap*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPenDashCap197819(pen : Win32cr::Graphics::GdiPlus::GpPen*, dashCap : Win32cr::Graphics::GdiPlus::DashCap*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetPenLineJoin(pen : Win32cr::Graphics::GdiPlus::GpPen*, lineJoin : Win32cr::Graphics::GdiPlus::LineJoin) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPenLineJoin(pen : Win32cr::Graphics::GdiPlus::GpPen*, lineJoin : Win32cr::Graphics::GdiPlus::LineJoin*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetPenCustomStartCap(pen : Win32cr::Graphics::GdiPlus::GpPen*, customCap : Win32cr::Graphics::GdiPlus::GpCustomLineCap*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPenCustomStartCap(pen : Win32cr::Graphics::GdiPlus::GpPen*, customCap : Win32cr::Graphics::GdiPlus::GpCustomLineCap**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetPenCustomEndCap(pen : Win32cr::Graphics::GdiPlus::GpPen*, customCap : Win32cr::Graphics::GdiPlus::GpCustomLineCap*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPenCustomEndCap(pen : Win32cr::Graphics::GdiPlus::GpPen*, customCap : Win32cr::Graphics::GdiPlus::GpCustomLineCap**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetPenMiterLimit(pen : Win32cr::Graphics::GdiPlus::GpPen*, miterLimit : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPenMiterLimit(pen : Win32cr::Graphics::GdiPlus::GpPen*, miterLimit : Float32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetPenMode(pen : Win32cr::Graphics::GdiPlus::GpPen*, penMode : Win32cr::Graphics::GdiPlus::PenAlignment) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPenMode(pen : Win32cr::Graphics::GdiPlus::GpPen*, penMode : Win32cr::Graphics::GdiPlus::PenAlignment*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetPenTransform(pen : Win32cr::Graphics::GdiPlus::GpPen*, matrix : Win32cr::Graphics::GdiPlus::Matrix*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPenTransform(pen : Win32cr::Graphics::GdiPlus::GpPen*, matrix : Win32cr::Graphics::GdiPlus::Matrix*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipResetPenTransform(pen : Win32cr::Graphics::GdiPlus::GpPen*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipMultiplyPenTransform(pen : Win32cr::Graphics::GdiPlus::GpPen*, matrix : Win32cr::Graphics::GdiPlus::Matrix*, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipTranslatePenTransform(pen : Win32cr::Graphics::GdiPlus::GpPen*, dx : Float32, dy : Float32, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipScalePenTransform(pen : Win32cr::Graphics::GdiPlus::GpPen*, sx : Float32, sy : Float32, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipRotatePenTransform(pen : Win32cr::Graphics::GdiPlus::GpPen*, angle : Float32, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetPenColor(pen : Win32cr::Graphics::GdiPlus::GpPen*, argb : UInt32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPenColor(pen : Win32cr::Graphics::GdiPlus::GpPen*, argb : UInt32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetPenBrushFill(pen : Win32cr::Graphics::GdiPlus::GpPen*, brush : Win32cr::Graphics::GdiPlus::GpBrush*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPenBrushFill(pen : Win32cr::Graphics::GdiPlus::GpPen*, brush : Win32cr::Graphics::GdiPlus::GpBrush**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPenFillType(pen : Win32cr::Graphics::GdiPlus::GpPen*, type__ : Win32cr::Graphics::GdiPlus::PenType*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPenDashStyle(pen : Win32cr::Graphics::GdiPlus::GpPen*, dashstyle : Win32cr::Graphics::GdiPlus::DashStyle*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetPenDashStyle(pen : Win32cr::Graphics::GdiPlus::GpPen*, dashstyle : Win32cr::Graphics::GdiPlus::DashStyle) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPenDashOffset(pen : Win32cr::Graphics::GdiPlus::GpPen*, offset : Float32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetPenDashOffset(pen : Win32cr::Graphics::GdiPlus::GpPen*, offset : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPenDashCount(pen : Win32cr::Graphics::GdiPlus::GpPen*, count : Int32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetPenDashArray(pen : Win32cr::Graphics::GdiPlus::GpPen*, dash : Float32*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPenDashArray(pen : Win32cr::Graphics::GdiPlus::GpPen*, dash : Float32*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPenCompoundCount(pen : Win32cr::Graphics::GdiPlus::GpPen*, count : Int32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetPenCompoundArray(pen : Win32cr::Graphics::GdiPlus::GpPen*, dash : Float32*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPenCompoundArray(pen : Win32cr::Graphics::GdiPlus::GpPen*, dash : Float32*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateCustomLineCap(fillPath : Win32cr::Graphics::GdiPlus::GpPath*, strokePath : Win32cr::Graphics::GdiPlus::GpPath*, baseCap : Win32cr::Graphics::GdiPlus::LineCap, baseInset : Float32, customCap : Win32cr::Graphics::GdiPlus::GpCustomLineCap**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDeleteCustomLineCap(customCap : Win32cr::Graphics::GdiPlus::GpCustomLineCap*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCloneCustomLineCap(customCap : Win32cr::Graphics::GdiPlus::GpCustomLineCap*, clonedCap : Win32cr::Graphics::GdiPlus::GpCustomLineCap**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetCustomLineCapType(customCap : Win32cr::Graphics::GdiPlus::GpCustomLineCap*, capType : Win32cr::Graphics::GdiPlus::CustomLineCapType*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetCustomLineCapStrokeCaps(customCap : Win32cr::Graphics::GdiPlus::GpCustomLineCap*, startCap : Win32cr::Graphics::GdiPlus::LineCap, endCap : Win32cr::Graphics::GdiPlus::LineCap) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetCustomLineCapStrokeCaps(customCap : Win32cr::Graphics::GdiPlus::GpCustomLineCap*, startCap : Win32cr::Graphics::GdiPlus::LineCap*, endCap : Win32cr::Graphics::GdiPlus::LineCap*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetCustomLineCapStrokeJoin(customCap : Win32cr::Graphics::GdiPlus::GpCustomLineCap*, lineJoin : Win32cr::Graphics::GdiPlus::LineJoin) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetCustomLineCapStrokeJoin(customCap : Win32cr::Graphics::GdiPlus::GpCustomLineCap*, lineJoin : Win32cr::Graphics::GdiPlus::LineJoin*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetCustomLineCapBaseCap(customCap : Win32cr::Graphics::GdiPlus::GpCustomLineCap*, baseCap : Win32cr::Graphics::GdiPlus::LineCap) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetCustomLineCapBaseCap(customCap : Win32cr::Graphics::GdiPlus::GpCustomLineCap*, baseCap : Win32cr::Graphics::GdiPlus::LineCap*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetCustomLineCapBaseInset(customCap : Win32cr::Graphics::GdiPlus::GpCustomLineCap*, inset : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetCustomLineCapBaseInset(customCap : Win32cr::Graphics::GdiPlus::GpCustomLineCap*, inset : Float32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetCustomLineCapWidthScale(customCap : Win32cr::Graphics::GdiPlus::GpCustomLineCap*, widthScale : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetCustomLineCapWidthScale(customCap : Win32cr::Graphics::GdiPlus::GpCustomLineCap*, widthScale : Float32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateAdjustableArrowCap(height : Float32, width : Float32, isFilled : Win32cr::Foundation::BOOL, cap : Win32cr::Graphics::GdiPlus::GpAdjustableArrowCap**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetAdjustableArrowCapHeight(cap : Win32cr::Graphics::GdiPlus::GpAdjustableArrowCap*, height : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetAdjustableArrowCapHeight(cap : Win32cr::Graphics::GdiPlus::GpAdjustableArrowCap*, height : Float32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetAdjustableArrowCapWidth(cap : Win32cr::Graphics::GdiPlus::GpAdjustableArrowCap*, width : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetAdjustableArrowCapWidth(cap : Win32cr::Graphics::GdiPlus::GpAdjustableArrowCap*, width : Float32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetAdjustableArrowCapMiddleInset(cap : Win32cr::Graphics::GdiPlus::GpAdjustableArrowCap*, middleInset : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetAdjustableArrowCapMiddleInset(cap : Win32cr::Graphics::GdiPlus::GpAdjustableArrowCap*, middleInset : Float32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetAdjustableArrowCapFillState(cap : Win32cr::Graphics::GdiPlus::GpAdjustableArrowCap*, fillState : Win32cr::Foundation::BOOL) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetAdjustableArrowCapFillState(cap : Win32cr::Graphics::GdiPlus::GpAdjustableArrowCap*, fillState : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipLoadImageFromStream(stream : Void*, image : Win32cr::Graphics::GdiPlus::GpImage**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipLoadImageFromFile(filename : Win32cr::Foundation::PWSTR, image : Win32cr::Graphics::GdiPlus::GpImage**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipLoadImageFromStreamICM(stream : Void*, image : Win32cr::Graphics::GdiPlus::GpImage**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipLoadImageFromFileICM(filename : Win32cr::Foundation::PWSTR, image : Win32cr::Graphics::GdiPlus::GpImage**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCloneImage(image : Win32cr::Graphics::GdiPlus::GpImage*, cloneImage : Win32cr::Graphics::GdiPlus::GpImage**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDisposeImage(image : Win32cr::Graphics::GdiPlus::GpImage*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSaveImageToFile(image : Win32cr::Graphics::GdiPlus::GpImage*, filename : Win32cr::Foundation::PWSTR, clsidEncoder : LibC::GUID*, encoderParams : Win32cr::Graphics::GdiPlus::EncoderParameters*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSaveImageToStream(image : Win32cr::Graphics::GdiPlus::GpImage*, stream : Void*, clsidEncoder : LibC::GUID*, encoderParams : Win32cr::Graphics::GdiPlus::EncoderParameters*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSaveAdd(image : Win32cr::Graphics::GdiPlus::GpImage*, encoderParams : Win32cr::Graphics::GdiPlus::EncoderParameters*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSaveAddImage(image : Win32cr::Graphics::GdiPlus::GpImage*, newImage : Win32cr::Graphics::GdiPlus::GpImage*, encoderParams : Win32cr::Graphics::GdiPlus::EncoderParameters*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetImageGraphicsContext(image : Win32cr::Graphics::GdiPlus::GpImage*, graphics : Win32cr::Graphics::GdiPlus::GpGraphics**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetImageBounds(image : Win32cr::Graphics::GdiPlus::GpImage*, srcRect : Win32cr::Graphics::GdiPlus::RectF*, srcUnit : Win32cr::Graphics::GdiPlus::Unit*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetImageDimension(image : Win32cr::Graphics::GdiPlus::GpImage*, width : Float32*, height : Float32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetImageType(image : Win32cr::Graphics::GdiPlus::GpImage*, type__ : Win32cr::Graphics::GdiPlus::ImageType*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetImageWidth(image : Win32cr::Graphics::GdiPlus::GpImage*, width : UInt32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetImageHeight(image : Win32cr::Graphics::GdiPlus::GpImage*, height : UInt32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetImageHorizontalResolution(image : Win32cr::Graphics::GdiPlus::GpImage*, resolution : Float32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetImageVerticalResolution(image : Win32cr::Graphics::GdiPlus::GpImage*, resolution : Float32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetImageFlags(image : Win32cr::Graphics::GdiPlus::GpImage*, flags : UInt32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetImageRawFormat(image : Win32cr::Graphics::GdiPlus::GpImage*, format : LibC::GUID*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetImagePixelFormat(image : Win32cr::Graphics::GdiPlus::GpImage*, format : Int32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetImageThumbnail(image : Win32cr::Graphics::GdiPlus::GpImage*, thumbWidth : UInt32, thumbHeight : UInt32, thumbImage : Win32cr::Graphics::GdiPlus::GpImage**, callback : LibC::IntPtrT, callbackData : Void*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetEncoderParameterListSize(image : Win32cr::Graphics::GdiPlus::GpImage*, clsidEncoder : LibC::GUID*, size : UInt32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetEncoderParameterList(image : Win32cr::Graphics::GdiPlus::GpImage*, clsidEncoder : LibC::GUID*, size : UInt32, buffer : Win32cr::Graphics::GdiPlus::EncoderParameters*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipImageGetFrameDimensionsCount(image : Win32cr::Graphics::GdiPlus::GpImage*, count : UInt32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipImageGetFrameDimensionsList(image : Win32cr::Graphics::GdiPlus::GpImage*, dimensionIDs : LibC::GUID*, count : UInt32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipImageGetFrameCount(image : Win32cr::Graphics::GdiPlus::GpImage*, dimensionID : LibC::GUID*, count : UInt32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipImageSelectActiveFrame(image : Win32cr::Graphics::GdiPlus::GpImage*, dimensionID : LibC::GUID*, frameIndex : UInt32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipImageRotateFlip(image : Win32cr::Graphics::GdiPlus::GpImage*, rfType : Win32cr::Graphics::GdiPlus::RotateFlipType) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetImagePalette(image : Win32cr::Graphics::GdiPlus::GpImage*, palette : Win32cr::Graphics::GdiPlus::ColorPalette*, size : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetImagePalette(image : Win32cr::Graphics::GdiPlus::GpImage*, palette : Win32cr::Graphics::GdiPlus::ColorPalette*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetImagePaletteSize(image : Win32cr::Graphics::GdiPlus::GpImage*, size : Int32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPropertyCount(image : Win32cr::Graphics::GdiPlus::GpImage*, numOfProperty : UInt32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPropertyIdList(image : Win32cr::Graphics::GdiPlus::GpImage*, numOfProperty : UInt32, list : UInt32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPropertyItemSize(image : Win32cr::Graphics::GdiPlus::GpImage*, propId : UInt32, size : UInt32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPropertyItem(image : Win32cr::Graphics::GdiPlus::GpImage*, propId : UInt32, propSize : UInt32, buffer : Win32cr::Graphics::GdiPlus::PropertyItem*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPropertySize(image : Win32cr::Graphics::GdiPlus::GpImage*, totalBufferSize : UInt32*, numProperties : UInt32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetAllPropertyItems(image : Win32cr::Graphics::GdiPlus::GpImage*, totalBufferSize : UInt32, numProperties : UInt32, allItems : Win32cr::Graphics::GdiPlus::PropertyItem*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipRemovePropertyItem(image : Win32cr::Graphics::GdiPlus::GpImage*, propId : UInt32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetPropertyItem(image : Win32cr::Graphics::GdiPlus::GpImage*, item : Win32cr::Graphics::GdiPlus::PropertyItem*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipFindFirstImageItem(image : Win32cr::Graphics::GdiPlus::GpImage*, item : Win32cr::Graphics::GdiPlus::ImageItemData*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipFindNextImageItem(image : Win32cr::Graphics::GdiPlus::GpImage*, item : Win32cr::Graphics::GdiPlus::ImageItemData*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetImageItemData(image : Win32cr::Graphics::GdiPlus::GpImage*, item : Win32cr::Graphics::GdiPlus::ImageItemData*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipImageForceValidation(image : Win32cr::Graphics::GdiPlus::GpImage*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateBitmapFromStream(stream : Void*, bitmap : Win32cr::Graphics::GdiPlus::GpBitmap**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateBitmapFromFile(filename : Win32cr::Foundation::PWSTR, bitmap : Win32cr::Graphics::GdiPlus::GpBitmap**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateBitmapFromStreamICM(stream : Void*, bitmap : Win32cr::Graphics::GdiPlus::GpBitmap**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateBitmapFromFileICM(filename : Win32cr::Foundation::PWSTR, bitmap : Win32cr::Graphics::GdiPlus::GpBitmap**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateBitmapFromScan0(width : Int32, height : Int32, stride : Int32, format : Int32, scan0 : UInt8*, bitmap : Win32cr::Graphics::GdiPlus::GpBitmap**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateBitmapFromGraphics(width : Int32, height : Int32, target : Win32cr::Graphics::GdiPlus::GpGraphics*, bitmap : Win32cr::Graphics::GdiPlus::GpBitmap**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateBitmapFromDirectDrawSurface(surface : Void*, bitmap : Win32cr::Graphics::GdiPlus::GpBitmap**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateBitmapFromGdiDib(gdiBitmapInfo : Win32cr::Graphics::Gdi::BITMAPINFO*, gdiBitmapData : Void*, bitmap : Win32cr::Graphics::GdiPlus::GpBitmap**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateBitmapFromHBITMAP(hbm : Win32cr::Graphics::Gdi::HBITMAP, hpal : Win32cr::Graphics::Gdi::HPALETTE, bitmap : Win32cr::Graphics::GdiPlus::GpBitmap**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateHBITMAPFromBitmap(bitmap : Win32cr::Graphics::GdiPlus::GpBitmap*, hbmReturn : Win32cr::Graphics::Gdi::HBITMAP*, background : UInt32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateBitmapFromHICON(hicon : Win32cr::UI::WindowsAndMessaging::HICON, bitmap : Win32cr::Graphics::GdiPlus::GpBitmap**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateHICONFromBitmap(bitmap : Win32cr::Graphics::GdiPlus::GpBitmap*, hbmReturn : Win32cr::UI::WindowsAndMessaging::HICON*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateBitmapFromResource(hInstance : Win32cr::Foundation::HINSTANCE, lpBitmapName : Win32cr::Foundation::PWSTR, bitmap : Win32cr::Graphics::GdiPlus::GpBitmap**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCloneBitmapArea(x : Float32, y : Float32, width : Float32, height : Float32, format : Int32, srcBitmap : Win32cr::Graphics::GdiPlus::GpBitmap*, dstBitmap : Win32cr::Graphics::GdiPlus::GpBitmap**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCloneBitmapAreaI(x : Int32, y : Int32, width : Int32, height : Int32, format : Int32, srcBitmap : Win32cr::Graphics::GdiPlus::GpBitmap*, dstBitmap : Win32cr::Graphics::GdiPlus::GpBitmap**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipBitmapLockBits(bitmap : Win32cr::Graphics::GdiPlus::GpBitmap*, rect : Win32cr::Graphics::GdiPlus::Rect*, flags : UInt32, format : Int32, lockedBitmapData : Win32cr::Graphics::GdiPlus::BitmapData*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipBitmapUnlockBits(bitmap : Win32cr::Graphics::GdiPlus::GpBitmap*, lockedBitmapData : Win32cr::Graphics::GdiPlus::BitmapData*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipBitmapGetPixel(bitmap : Win32cr::Graphics::GdiPlus::GpBitmap*, x : Int32, y : Int32, color : UInt32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipBitmapSetPixel(bitmap : Win32cr::Graphics::GdiPlus::GpBitmap*, x : Int32, y : Int32, color : UInt32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipImageSetAbort(pImage : Win32cr::Graphics::GdiPlus::GpImage*, pIAbort : Void*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGraphicsSetAbort(pGraphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pIAbort : Void*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipBitmapConvertFormat(pInputBitmap : Win32cr::Graphics::GdiPlus::GpBitmap*, format : Int32, dithertype : Win32cr::Graphics::GdiPlus::DitherType, palettetype : Win32cr::Graphics::GdiPlus::PaletteType, palette : Win32cr::Graphics::GdiPlus::ColorPalette*, alphaThresholdPercent : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipInitializePalette(palette : Win32cr::Graphics::GdiPlus::ColorPalette*, palettetype : Win32cr::Graphics::GdiPlus::PaletteType, optimalColors : Int32, useTransparentColor : Win32cr::Foundation::BOOL, bitmap : Win32cr::Graphics::GdiPlus::GpBitmap*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipBitmapApplyEffect(bitmap : Win32cr::Graphics::GdiPlus::GpBitmap*, effect : Win32cr::Graphics::GdiPlus::CGpEffect*, roi : Win32cr::Foundation::RECT*, useAuxData : Win32cr::Foundation::BOOL, auxData : Void**, auxDataSize : Int32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipBitmapCreateApplyEffect(inputBitmaps : Win32cr::Graphics::GdiPlus::GpBitmap**, numInputs : Int32, effect : Win32cr::Graphics::GdiPlus::CGpEffect*, roi : Win32cr::Foundation::RECT*, outputRect : Win32cr::Foundation::RECT*, outputBitmap : Win32cr::Graphics::GdiPlus::GpBitmap**, useAuxData : Win32cr::Foundation::BOOL, auxData : Void**, auxDataSize : Int32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipBitmapGetHistogram(bitmap : Win32cr::Graphics::GdiPlus::GpBitmap*, format : Win32cr::Graphics::GdiPlus::HistogramFormat, number_of_entries : UInt32, channel0 : UInt32*, channel1 : UInt32*, channel2 : UInt32*, channel3 : UInt32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipBitmapGetHistogramSize(format : Win32cr::Graphics::GdiPlus::HistogramFormat, number_of_entries : UInt32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipBitmapSetResolution(bitmap : Win32cr::Graphics::GdiPlus::GpBitmap*, xdpi : Float32, ydpi : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateImageAttributes(imageattr : Win32cr::Graphics::GdiPlus::GpImageAttributes**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCloneImageAttributes(imageattr : Win32cr::Graphics::GdiPlus::GpImageAttributes*, cloneImageattr : Win32cr::Graphics::GdiPlus::GpImageAttributes**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDisposeImageAttributes(imageattr : Win32cr::Graphics::GdiPlus::GpImageAttributes*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetImageAttributesToIdentity(imageattr : Win32cr::Graphics::GdiPlus::GpImageAttributes*, type__ : Win32cr::Graphics::GdiPlus::ColorAdjustType) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipResetImageAttributes(imageattr : Win32cr::Graphics::GdiPlus::GpImageAttributes*, type__ : Win32cr::Graphics::GdiPlus::ColorAdjustType) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetImageAttributesColorMatrix(imageattr : Win32cr::Graphics::GdiPlus::GpImageAttributes*, type__ : Win32cr::Graphics::GdiPlus::ColorAdjustType, enableFlag : Win32cr::Foundation::BOOL, colorMatrix : Win32cr::Graphics::GdiPlus::ColorMatrix*, grayMatrix : Win32cr::Graphics::GdiPlus::ColorMatrix*, flags : Win32cr::Graphics::GdiPlus::ColorMatrixFlags) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetImageAttributesThreshold(imageattr : Win32cr::Graphics::GdiPlus::GpImageAttributes*, type__ : Win32cr::Graphics::GdiPlus::ColorAdjustType, enableFlag : Win32cr::Foundation::BOOL, threshold : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetImageAttributesGamma(imageattr : Win32cr::Graphics::GdiPlus::GpImageAttributes*, type__ : Win32cr::Graphics::GdiPlus::ColorAdjustType, enableFlag : Win32cr::Foundation::BOOL, gamma : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetImageAttributesNoOp(imageattr : Win32cr::Graphics::GdiPlus::GpImageAttributes*, type__ : Win32cr::Graphics::GdiPlus::ColorAdjustType, enableFlag : Win32cr::Foundation::BOOL) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetImageAttributesColorKeys(imageattr : Win32cr::Graphics::GdiPlus::GpImageAttributes*, type__ : Win32cr::Graphics::GdiPlus::ColorAdjustType, enableFlag : Win32cr::Foundation::BOOL, colorLow : UInt32, colorHigh : UInt32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetImageAttributesOutputChannel(imageattr : Win32cr::Graphics::GdiPlus::GpImageAttributes*, type__ : Win32cr::Graphics::GdiPlus::ColorAdjustType, enableFlag : Win32cr::Foundation::BOOL, channelFlags : Win32cr::Graphics::GdiPlus::ColorChannelFlags) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetImageAttributesOutputChannelColorProfile(imageattr : Win32cr::Graphics::GdiPlus::GpImageAttributes*, type__ : Win32cr::Graphics::GdiPlus::ColorAdjustType, enableFlag : Win32cr::Foundation::BOOL, colorProfileFilename : Win32cr::Foundation::PWSTR) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetImageAttributesRemapTable(imageattr : Win32cr::Graphics::GdiPlus::GpImageAttributes*, type__ : Win32cr::Graphics::GdiPlus::ColorAdjustType, enableFlag : Win32cr::Foundation::BOOL, mapSize : UInt32, map : Win32cr::Graphics::GdiPlus::ColorMap*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetImageAttributesWrapMode(imageAttr : Win32cr::Graphics::GdiPlus::GpImageAttributes*, wrap : Win32cr::Graphics::GdiPlus::WrapMode, argb : UInt32, clamp : Win32cr::Foundation::BOOL) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetImageAttributesAdjustedPalette(imageAttr : Win32cr::Graphics::GdiPlus::GpImageAttributes*, colorPalette : Win32cr::Graphics::GdiPlus::ColorPalette*, colorAdjustType : Win32cr::Graphics::GdiPlus::ColorAdjustType) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipFlush(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, intention : Win32cr::Graphics::GdiPlus::FlushIntention) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateFromHDC(hdc : Win32cr::Graphics::Gdi::HDC, graphics : Win32cr::Graphics::GdiPlus::GpGraphics**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateFromHDC2(hdc : Win32cr::Graphics::Gdi::HDC, hDevice : Win32cr::Foundation::HANDLE, graphics : Win32cr::Graphics::GdiPlus::GpGraphics**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateFromHWND(hwnd : Win32cr::Foundation::HWND, graphics : Win32cr::Graphics::GdiPlus::GpGraphics**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateFromHWNDICM(hwnd : Win32cr::Foundation::HWND, graphics : Win32cr::Graphics::GdiPlus::GpGraphics**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDeleteGraphics(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetDC(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, hdc : Win32cr::Graphics::Gdi::HDC*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipReleaseDC(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, hdc : Win32cr::Graphics::Gdi::HDC) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetCompositingMode(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, compositingMode : Win32cr::Graphics::GdiPlus::CompositingMode) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetCompositingMode(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, compositingMode : Win32cr::Graphics::GdiPlus::CompositingMode*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetRenderingOrigin(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, x : Int32, y : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetRenderingOrigin(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, x : Int32*, y : Int32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetCompositingQuality(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, compositingQuality : Win32cr::Graphics::GdiPlus::CompositingQuality) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetCompositingQuality(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, compositingQuality : Win32cr::Graphics::GdiPlus::CompositingQuality*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetSmoothingMode(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, smoothingMode : Win32cr::Graphics::GdiPlus::SmoothingMode) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetSmoothingMode(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, smoothingMode : Win32cr::Graphics::GdiPlus::SmoothingMode*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetPixelOffsetMode(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pixelOffsetMode : Win32cr::Graphics::GdiPlus::PixelOffsetMode) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPixelOffsetMode(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pixelOffsetMode : Win32cr::Graphics::GdiPlus::PixelOffsetMode*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetTextRenderingHint(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, mode : Win32cr::Graphics::GdiPlus::TextRenderingHint) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetTextRenderingHint(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, mode : Win32cr::Graphics::GdiPlus::TextRenderingHint*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetTextContrast(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, contrast : UInt32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetTextContrast(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, contrast : UInt32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetInterpolationMode(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, interpolationMode : Win32cr::Graphics::GdiPlus::InterpolationMode) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetInterpolationMode(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, interpolationMode : Win32cr::Graphics::GdiPlus::InterpolationMode*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetWorldTransform(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, matrix : Win32cr::Graphics::GdiPlus::Matrix*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipResetWorldTransform(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipMultiplyWorldTransform(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, matrix : Win32cr::Graphics::GdiPlus::Matrix*, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipTranslateWorldTransform(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, dx : Float32, dy : Float32, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipScaleWorldTransform(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, sx : Float32, sy : Float32, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipRotateWorldTransform(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, angle : Float32, order : Win32cr::Graphics::GdiPlus::MatrixOrder) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetWorldTransform(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, matrix : Win32cr::Graphics::GdiPlus::Matrix*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipResetPageTransform(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPageUnit(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, unit : Win32cr::Graphics::GdiPlus::Unit*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetPageScale(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, scale : Float32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetPageUnit(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, unit : Win32cr::Graphics::GdiPlus::Unit) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetPageScale(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, scale : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetDpiX(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, dpi : Float32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetDpiY(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, dpi : Float32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipTransformPoints(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, destSpace : Win32cr::Graphics::GdiPlus::CoordinateSpace, srcSpace : Win32cr::Graphics::GdiPlus::CoordinateSpace, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipTransformPointsI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, destSpace : Win32cr::Graphics::GdiPlus::CoordinateSpace, srcSpace : Win32cr::Graphics::GdiPlus::CoordinateSpace, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetNearestColor(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, argb : UInt32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateHalftonePalette : Win32cr::Graphics::Gdi::HPALETTE

    # :nodoc:
    fun GdipDrawLine(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, x1 : Float32, y1 : Float32, x2 : Float32, y2 : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawLineI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, x1 : Int32, y1 : Int32, x2 : Int32, y2 : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawLines(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawLinesI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawArc(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, x : Float32, y : Float32, width : Float32, height : Float32, startAngle : Float32, sweepAngle : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawArcI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, x : Int32, y : Int32, width : Int32, height : Int32, startAngle : Float32, sweepAngle : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawBezier(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, x1 : Float32, y1 : Float32, x2 : Float32, y2 : Float32, x3 : Float32, y3 : Float32, x4 : Float32, y4 : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawBezierI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, x1 : Int32, y1 : Int32, x2 : Int32, y2 : Int32, x3 : Int32, y3 : Int32, x4 : Int32, y4 : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawBeziers(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawBeziersI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawRectangle(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, x : Float32, y : Float32, width : Float32, height : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawRectangleI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, x : Int32, y : Int32, width : Int32, height : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawRectangles(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, rects : Win32cr::Graphics::GdiPlus::RectF*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawRectanglesI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, rects : Win32cr::Graphics::GdiPlus::Rect*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawEllipse(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, x : Float32, y : Float32, width : Float32, height : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawEllipseI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, x : Int32, y : Int32, width : Int32, height : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawPie(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, x : Float32, y : Float32, width : Float32, height : Float32, startAngle : Float32, sweepAngle : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawPieI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, x : Int32, y : Int32, width : Int32, height : Int32, startAngle : Float32, sweepAngle : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawPolygon(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawPolygonI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawPath(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, path : Win32cr::Graphics::GdiPlus::GpPath*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawCurve(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawCurveI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawCurve2(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32, tension : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawCurve2I(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32, tension : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawCurve3(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32, offset : Int32, numberOfSegments : Int32, tension : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawCurve3I(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32, offset : Int32, numberOfSegments : Int32, tension : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawClosedCurve(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawClosedCurveI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawClosedCurve2(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32, tension : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawClosedCurve2I(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, pen : Win32cr::Graphics::GdiPlus::GpPen*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32, tension : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGraphicsClear(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, color : UInt32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipFillRectangle(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, brush : Win32cr::Graphics::GdiPlus::GpBrush*, x : Float32, y : Float32, width : Float32, height : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipFillRectangleI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, brush : Win32cr::Graphics::GdiPlus::GpBrush*, x : Int32, y : Int32, width : Int32, height : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipFillRectangles(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, brush : Win32cr::Graphics::GdiPlus::GpBrush*, rects : Win32cr::Graphics::GdiPlus::RectF*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipFillRectanglesI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, brush : Win32cr::Graphics::GdiPlus::GpBrush*, rects : Win32cr::Graphics::GdiPlus::Rect*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipFillPolygon(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, brush : Win32cr::Graphics::GdiPlus::GpBrush*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32, fillMode : Win32cr::Graphics::GdiPlus::FillMode) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipFillPolygonI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, brush : Win32cr::Graphics::GdiPlus::GpBrush*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32, fillMode : Win32cr::Graphics::GdiPlus::FillMode) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipFillPolygon2(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, brush : Win32cr::Graphics::GdiPlus::GpBrush*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipFillPolygon2I(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, brush : Win32cr::Graphics::GdiPlus::GpBrush*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipFillEllipse(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, brush : Win32cr::Graphics::GdiPlus::GpBrush*, x : Float32, y : Float32, width : Float32, height : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipFillEllipseI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, brush : Win32cr::Graphics::GdiPlus::GpBrush*, x : Int32, y : Int32, width : Int32, height : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipFillPie(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, brush : Win32cr::Graphics::GdiPlus::GpBrush*, x : Float32, y : Float32, width : Float32, height : Float32, startAngle : Float32, sweepAngle : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipFillPieI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, brush : Win32cr::Graphics::GdiPlus::GpBrush*, x : Int32, y : Int32, width : Int32, height : Int32, startAngle : Float32, sweepAngle : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipFillPath(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, brush : Win32cr::Graphics::GdiPlus::GpBrush*, path : Win32cr::Graphics::GdiPlus::GpPath*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipFillClosedCurve(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, brush : Win32cr::Graphics::GdiPlus::GpBrush*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipFillClosedCurveI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, brush : Win32cr::Graphics::GdiPlus::GpBrush*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipFillClosedCurve2(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, brush : Win32cr::Graphics::GdiPlus::GpBrush*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32, tension : Float32, fillMode : Win32cr::Graphics::GdiPlus::FillMode) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipFillClosedCurve2I(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, brush : Win32cr::Graphics::GdiPlus::GpBrush*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32, tension : Float32, fillMode : Win32cr::Graphics::GdiPlus::FillMode) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipFillRegion(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, brush : Win32cr::Graphics::GdiPlus::GpBrush*, region : Win32cr::Graphics::GdiPlus::GpRegion*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawImageFX(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, image : Win32cr::Graphics::GdiPlus::GpImage*, source : Win32cr::Graphics::GdiPlus::RectF*, xForm : Win32cr::Graphics::GdiPlus::Matrix*, effect : Win32cr::Graphics::GdiPlus::CGpEffect*, imageAttributes : Win32cr::Graphics::GdiPlus::GpImageAttributes*, srcUnit : Win32cr::Graphics::GdiPlus::Unit) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawImage(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, image : Win32cr::Graphics::GdiPlus::GpImage*, x : Float32, y : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawImageI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, image : Win32cr::Graphics::GdiPlus::GpImage*, x : Int32, y : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawImageRect(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, image : Win32cr::Graphics::GdiPlus::GpImage*, x : Float32, y : Float32, width : Float32, height : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawImageRectI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, image : Win32cr::Graphics::GdiPlus::GpImage*, x : Int32, y : Int32, width : Int32, height : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawImagePoints(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, image : Win32cr::Graphics::GdiPlus::GpImage*, dstpoints : Win32cr::Graphics::GdiPlus::PointF*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawImagePointsI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, image : Win32cr::Graphics::GdiPlus::GpImage*, dstpoints : Win32cr::Graphics::GdiPlus::Point*, count : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawImagePointRect(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, image : Win32cr::Graphics::GdiPlus::GpImage*, x : Float32, y : Float32, srcx : Float32, srcy : Float32, srcwidth : Float32, srcheight : Float32, srcUnit : Win32cr::Graphics::GdiPlus::Unit) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawImagePointRectI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, image : Win32cr::Graphics::GdiPlus::GpImage*, x : Int32, y : Int32, srcx : Int32, srcy : Int32, srcwidth : Int32, srcheight : Int32, srcUnit : Win32cr::Graphics::GdiPlus::Unit) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawImageRectRect(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, image : Win32cr::Graphics::GdiPlus::GpImage*, dstx : Float32, dsty : Float32, dstwidth : Float32, dstheight : Float32, srcx : Float32, srcy : Float32, srcwidth : Float32, srcheight : Float32, srcUnit : Win32cr::Graphics::GdiPlus::Unit, imageAttributes : Win32cr::Graphics::GdiPlus::GpImageAttributes*, callback : LibC::IntPtrT, callbackData : Void*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawImageRectRectI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, image : Win32cr::Graphics::GdiPlus::GpImage*, dstx : Int32, dsty : Int32, dstwidth : Int32, dstheight : Int32, srcx : Int32, srcy : Int32, srcwidth : Int32, srcheight : Int32, srcUnit : Win32cr::Graphics::GdiPlus::Unit, imageAttributes : Win32cr::Graphics::GdiPlus::GpImageAttributes*, callback : LibC::IntPtrT, callbackData : Void*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawImagePointsRect(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, image : Win32cr::Graphics::GdiPlus::GpImage*, points : Win32cr::Graphics::GdiPlus::PointF*, count : Int32, srcx : Float32, srcy : Float32, srcwidth : Float32, srcheight : Float32, srcUnit : Win32cr::Graphics::GdiPlus::Unit, imageAttributes : Win32cr::Graphics::GdiPlus::GpImageAttributes*, callback : LibC::IntPtrT, callbackData : Void*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawImagePointsRectI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, image : Win32cr::Graphics::GdiPlus::GpImage*, points : Win32cr::Graphics::GdiPlus::Point*, count : Int32, srcx : Int32, srcy : Int32, srcwidth : Int32, srcheight : Int32, srcUnit : Win32cr::Graphics::GdiPlus::Unit, imageAttributes : Win32cr::Graphics::GdiPlus::GpImageAttributes*, callback : LibC::IntPtrT, callbackData : Void*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipEnumerateMetafileDestPoint(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, metafile : Win32cr::Graphics::GdiPlus::GpMetafile*, destPoint : Win32cr::Graphics::GdiPlus::PointF*, callback : LibC::IntPtrT, callbackData : Void*, imageAttributes : Win32cr::Graphics::GdiPlus::GpImageAttributes*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipEnumerateMetafileDestPointI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, metafile : Win32cr::Graphics::GdiPlus::GpMetafile*, destPoint : Win32cr::Graphics::GdiPlus::Point*, callback : LibC::IntPtrT, callbackData : Void*, imageAttributes : Win32cr::Graphics::GdiPlus::GpImageAttributes*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipEnumerateMetafileDestRect(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, metafile : Win32cr::Graphics::GdiPlus::GpMetafile*, destRect : Win32cr::Graphics::GdiPlus::RectF*, callback : LibC::IntPtrT, callbackData : Void*, imageAttributes : Win32cr::Graphics::GdiPlus::GpImageAttributes*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipEnumerateMetafileDestRectI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, metafile : Win32cr::Graphics::GdiPlus::GpMetafile*, destRect : Win32cr::Graphics::GdiPlus::Rect*, callback : LibC::IntPtrT, callbackData : Void*, imageAttributes : Win32cr::Graphics::GdiPlus::GpImageAttributes*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipEnumerateMetafileDestPoints(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, metafile : Win32cr::Graphics::GdiPlus::GpMetafile*, destPoints : Win32cr::Graphics::GdiPlus::PointF*, count : Int32, callback : LibC::IntPtrT, callbackData : Void*, imageAttributes : Win32cr::Graphics::GdiPlus::GpImageAttributes*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipEnumerateMetafileDestPointsI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, metafile : Win32cr::Graphics::GdiPlus::GpMetafile*, destPoints : Win32cr::Graphics::GdiPlus::Point*, count : Int32, callback : LibC::IntPtrT, callbackData : Void*, imageAttributes : Win32cr::Graphics::GdiPlus::GpImageAttributes*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipEnumerateMetafileSrcRectDestPoint(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, metafile : Win32cr::Graphics::GdiPlus::GpMetafile*, destPoint : Win32cr::Graphics::GdiPlus::PointF*, srcRect : Win32cr::Graphics::GdiPlus::RectF*, srcUnit : Win32cr::Graphics::GdiPlus::Unit, callback : LibC::IntPtrT, callbackData : Void*, imageAttributes : Win32cr::Graphics::GdiPlus::GpImageAttributes*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipEnumerateMetafileSrcRectDestPointI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, metafile : Win32cr::Graphics::GdiPlus::GpMetafile*, destPoint : Win32cr::Graphics::GdiPlus::Point*, srcRect : Win32cr::Graphics::GdiPlus::Rect*, srcUnit : Win32cr::Graphics::GdiPlus::Unit, callback : LibC::IntPtrT, callbackData : Void*, imageAttributes : Win32cr::Graphics::GdiPlus::GpImageAttributes*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipEnumerateMetafileSrcRectDestRect(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, metafile : Win32cr::Graphics::GdiPlus::GpMetafile*, destRect : Win32cr::Graphics::GdiPlus::RectF*, srcRect : Win32cr::Graphics::GdiPlus::RectF*, srcUnit : Win32cr::Graphics::GdiPlus::Unit, callback : LibC::IntPtrT, callbackData : Void*, imageAttributes : Win32cr::Graphics::GdiPlus::GpImageAttributes*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipEnumerateMetafileSrcRectDestRectI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, metafile : Win32cr::Graphics::GdiPlus::GpMetafile*, destRect : Win32cr::Graphics::GdiPlus::Rect*, srcRect : Win32cr::Graphics::GdiPlus::Rect*, srcUnit : Win32cr::Graphics::GdiPlus::Unit, callback : LibC::IntPtrT, callbackData : Void*, imageAttributes : Win32cr::Graphics::GdiPlus::GpImageAttributes*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipEnumerateMetafileSrcRectDestPoints(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, metafile : Win32cr::Graphics::GdiPlus::GpMetafile*, destPoints : Win32cr::Graphics::GdiPlus::PointF*, count : Int32, srcRect : Win32cr::Graphics::GdiPlus::RectF*, srcUnit : Win32cr::Graphics::GdiPlus::Unit, callback : LibC::IntPtrT, callbackData : Void*, imageAttributes : Win32cr::Graphics::GdiPlus::GpImageAttributes*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipEnumerateMetafileSrcRectDestPointsI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, metafile : Win32cr::Graphics::GdiPlus::GpMetafile*, destPoints : Win32cr::Graphics::GdiPlus::Point*, count : Int32, srcRect : Win32cr::Graphics::GdiPlus::Rect*, srcUnit : Win32cr::Graphics::GdiPlus::Unit, callback : LibC::IntPtrT, callbackData : Void*, imageAttributes : Win32cr::Graphics::GdiPlus::GpImageAttributes*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipPlayMetafileRecord(metafile : Win32cr::Graphics::GdiPlus::GpMetafile*, recordType : Win32cr::Graphics::GdiPlus::EmfPlusRecordType, flags : UInt32, dataSize : UInt32, data : UInt8*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetClipGraphics(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, srcgraphics : Win32cr::Graphics::GdiPlus::GpGraphics*, combineMode : Win32cr::Graphics::GdiPlus::CombineMode) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetClipRect(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, x : Float32, y : Float32, width : Float32, height : Float32, combineMode : Win32cr::Graphics::GdiPlus::CombineMode) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetClipRectI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, x : Int32, y : Int32, width : Int32, height : Int32, combineMode : Win32cr::Graphics::GdiPlus::CombineMode) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetClipPath(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, path : Win32cr::Graphics::GdiPlus::GpPath*, combineMode : Win32cr::Graphics::GdiPlus::CombineMode) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetClipRegion(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, region : Win32cr::Graphics::GdiPlus::GpRegion*, combineMode : Win32cr::Graphics::GdiPlus::CombineMode) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetClipHrgn(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, hRgn : Win32cr::Graphics::Gdi::HRGN, combineMode : Win32cr::Graphics::GdiPlus::CombineMode) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipResetClip(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipTranslateClip(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, dx : Float32, dy : Float32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipTranslateClipI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, dx : Int32, dy : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetClip(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, region : Win32cr::Graphics::GdiPlus::GpRegion*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetClipBounds(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, rect : Win32cr::Graphics::GdiPlus::RectF*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetClipBoundsI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, rect : Win32cr::Graphics::GdiPlus::Rect*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipIsClipEmpty(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, result : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetVisibleClipBounds(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, rect : Win32cr::Graphics::GdiPlus::RectF*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetVisibleClipBoundsI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, rect : Win32cr::Graphics::GdiPlus::Rect*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipIsVisibleClipEmpty(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, result : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipIsVisiblePoint(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, x : Float32, y : Float32, result : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipIsVisiblePointI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, x : Int32, y : Int32, result : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipIsVisibleRect(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, x : Float32, y : Float32, width : Float32, height : Float32, result : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipIsVisibleRectI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, x : Int32, y : Int32, width : Int32, height : Int32, result : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSaveGraphics(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, state : UInt32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipRestoreGraphics(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, state : UInt32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipBeginContainer(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, dstrect : Win32cr::Graphics::GdiPlus::RectF*, srcrect : Win32cr::Graphics::GdiPlus::RectF*, unit : Win32cr::Graphics::GdiPlus::Unit, state : UInt32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipBeginContainerI(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, dstrect : Win32cr::Graphics::GdiPlus::Rect*, srcrect : Win32cr::Graphics::GdiPlus::Rect*, unit : Win32cr::Graphics::GdiPlus::Unit, state : UInt32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipBeginContainer2(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, state : UInt32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipEndContainer(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, state : UInt32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetMetafileHeaderFromWmf(hWmf : Win32cr::Graphics::Gdi::HMETAFILE, wmfPlaceableFileHeader : Win32cr::Graphics::GdiPlus::WmfPlaceableFileHeader*, header : Win32cr::Graphics::GdiPlus::MetafileHeader*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetMetafileHeaderFromEmf(hEmf : Win32cr::Graphics::Gdi::HENHMETAFILE, header : Win32cr::Graphics::GdiPlus::MetafileHeader*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetMetafileHeaderFromFile(filename : Win32cr::Foundation::PWSTR, header : Win32cr::Graphics::GdiPlus::MetafileHeader*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetMetafileHeaderFromStream(stream : Void*, header : Win32cr::Graphics::GdiPlus::MetafileHeader*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetMetafileHeaderFromMetafile(metafile : Win32cr::Graphics::GdiPlus::GpMetafile*, header : Win32cr::Graphics::GdiPlus::MetafileHeader*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetHemfFromMetafile(metafile : Win32cr::Graphics::GdiPlus::GpMetafile*, hEmf : Win32cr::Graphics::Gdi::HENHMETAFILE*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateStreamOnFile(filename : Win32cr::Foundation::PWSTR, access : UInt32, stream : Void**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateMetafileFromWmf(hWmf : Win32cr::Graphics::Gdi::HMETAFILE, deleteWmf : Win32cr::Foundation::BOOL, wmfPlaceableFileHeader : Win32cr::Graphics::GdiPlus::WmfPlaceableFileHeader*, metafile : Win32cr::Graphics::GdiPlus::GpMetafile**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateMetafileFromEmf(hEmf : Win32cr::Graphics::Gdi::HENHMETAFILE, deleteEmf : Win32cr::Foundation::BOOL, metafile : Win32cr::Graphics::GdiPlus::GpMetafile**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateMetafileFromFile(file : Win32cr::Foundation::PWSTR, metafile : Win32cr::Graphics::GdiPlus::GpMetafile**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateMetafileFromWmfFile(file : Win32cr::Foundation::PWSTR, wmfPlaceableFileHeader : Win32cr::Graphics::GdiPlus::WmfPlaceableFileHeader*, metafile : Win32cr::Graphics::GdiPlus::GpMetafile**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateMetafileFromStream(stream : Void*, metafile : Win32cr::Graphics::GdiPlus::GpMetafile**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipRecordMetafile(referenceHdc : Win32cr::Graphics::Gdi::HDC, type__ : Win32cr::Graphics::GdiPlus::EmfType, frameRect : Win32cr::Graphics::GdiPlus::RectF*, frameUnit : Win32cr::Graphics::GdiPlus::MetafileFrameUnit, description : Win32cr::Foundation::PWSTR, metafile : Win32cr::Graphics::GdiPlus::GpMetafile**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipRecordMetafileI(referenceHdc : Win32cr::Graphics::Gdi::HDC, type__ : Win32cr::Graphics::GdiPlus::EmfType, frameRect : Win32cr::Graphics::GdiPlus::Rect*, frameUnit : Win32cr::Graphics::GdiPlus::MetafileFrameUnit, description : Win32cr::Foundation::PWSTR, metafile : Win32cr::Graphics::GdiPlus::GpMetafile**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipRecordMetafileFileName(fileName : Win32cr::Foundation::PWSTR, referenceHdc : Win32cr::Graphics::Gdi::HDC, type__ : Win32cr::Graphics::GdiPlus::EmfType, frameRect : Win32cr::Graphics::GdiPlus::RectF*, frameUnit : Win32cr::Graphics::GdiPlus::MetafileFrameUnit, description : Win32cr::Foundation::PWSTR, metafile : Win32cr::Graphics::GdiPlus::GpMetafile**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipRecordMetafileFileNameI(fileName : Win32cr::Foundation::PWSTR, referenceHdc : Win32cr::Graphics::Gdi::HDC, type__ : Win32cr::Graphics::GdiPlus::EmfType, frameRect : Win32cr::Graphics::GdiPlus::Rect*, frameUnit : Win32cr::Graphics::GdiPlus::MetafileFrameUnit, description : Win32cr::Foundation::PWSTR, metafile : Win32cr::Graphics::GdiPlus::GpMetafile**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipRecordMetafileStream(stream : Void*, referenceHdc : Win32cr::Graphics::Gdi::HDC, type__ : Win32cr::Graphics::GdiPlus::EmfType, frameRect : Win32cr::Graphics::GdiPlus::RectF*, frameUnit : Win32cr::Graphics::GdiPlus::MetafileFrameUnit, description : Win32cr::Foundation::PWSTR, metafile : Win32cr::Graphics::GdiPlus::GpMetafile**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipRecordMetafileStreamI(stream : Void*, referenceHdc : Win32cr::Graphics::Gdi::HDC, type__ : Win32cr::Graphics::GdiPlus::EmfType, frameRect : Win32cr::Graphics::GdiPlus::Rect*, frameUnit : Win32cr::Graphics::GdiPlus::MetafileFrameUnit, description : Win32cr::Foundation::PWSTR, metafile : Win32cr::Graphics::GdiPlus::GpMetafile**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetMetafileDownLevelRasterizationLimit(metafile : Win32cr::Graphics::GdiPlus::GpMetafile*, metafileRasterizationLimitDpi : UInt32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetMetafileDownLevelRasterizationLimit(metafile : Win32cr::Graphics::GdiPlus::GpMetafile*, metafileRasterizationLimitDpi : UInt32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetImageDecodersSize(numDecoders : UInt32*, size : UInt32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetImageDecoders(numDecoders : UInt32, size : UInt32, decoders : Win32cr::Graphics::GdiPlus::ImageCodecInfo*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetImageEncodersSize(numEncoders : UInt32*, size : UInt32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetImageEncoders(numEncoders : UInt32, size : UInt32, encoders : Win32cr::Graphics::GdiPlus::ImageCodecInfo*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipComment(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, sizeData : UInt32, data : UInt8*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateFontFamilyFromName(name : Win32cr::Foundation::PWSTR, fontCollection : Win32cr::Graphics::GdiPlus::GpFontCollection*, fontFamily : Win32cr::Graphics::GdiPlus::GpFontFamily**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDeleteFontFamily(fontFamily : Win32cr::Graphics::GdiPlus::GpFontFamily*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCloneFontFamily(fontFamily : Win32cr::Graphics::GdiPlus::GpFontFamily*, clonedFontFamily : Win32cr::Graphics::GdiPlus::GpFontFamily**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetGenericFontFamilySansSerif(nativeFamily : Win32cr::Graphics::GdiPlus::GpFontFamily**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetGenericFontFamilySerif(nativeFamily : Win32cr::Graphics::GdiPlus::GpFontFamily**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetGenericFontFamilyMonospace(nativeFamily : Win32cr::Graphics::GdiPlus::GpFontFamily**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetFamilyName(family : Win32cr::Graphics::GdiPlus::GpFontFamily*, name : Win32cr::Foundation::PWSTR, language : UInt16) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipIsStyleAvailable(family : Win32cr::Graphics::GdiPlus::GpFontFamily*, style : Int32, is_style_available : Win32cr::Foundation::BOOL*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetEmHeight(family : Win32cr::Graphics::GdiPlus::GpFontFamily*, style : Int32, em_height : UInt16*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetCellAscent(family : Win32cr::Graphics::GdiPlus::GpFontFamily*, style : Int32, cell_ascent : UInt16*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetCellDescent(family : Win32cr::Graphics::GdiPlus::GpFontFamily*, style : Int32, cell_descent : UInt16*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetLineSpacing(family : Win32cr::Graphics::GdiPlus::GpFontFamily*, style : Int32, line_spacing : UInt16*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateFontFromDC(hdc : Win32cr::Graphics::Gdi::HDC, font : Win32cr::Graphics::GdiPlus::GpFont**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateFontFromLogfontA(hdc : Win32cr::Graphics::Gdi::HDC, logfont : Win32cr::Graphics::Gdi::LOGFONTA*, font : Win32cr::Graphics::GdiPlus::GpFont**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateFontFromLogfontW(hdc : Win32cr::Graphics::Gdi::HDC, logfont : Win32cr::Graphics::Gdi::LOGFONTW*, font : Win32cr::Graphics::GdiPlus::GpFont**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateFont(fontFamily : Win32cr::Graphics::GdiPlus::GpFontFamily*, emSize : Float32, style : Int32, unit : Win32cr::Graphics::GdiPlus::Unit, font : Win32cr::Graphics::GdiPlus::GpFont**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCloneFont(font : Win32cr::Graphics::GdiPlus::GpFont*, cloneFont : Win32cr::Graphics::GdiPlus::GpFont**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDeleteFont(font : Win32cr::Graphics::GdiPlus::GpFont*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetFamily(font : Win32cr::Graphics::GdiPlus::GpFont*, family : Win32cr::Graphics::GdiPlus::GpFontFamily**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetFontStyle(font : Win32cr::Graphics::GdiPlus::GpFont*, style : Int32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetFontSize(font : Win32cr::Graphics::GdiPlus::GpFont*, size : Float32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetFontUnit(font : Win32cr::Graphics::GdiPlus::GpFont*, unit : Win32cr::Graphics::GdiPlus::Unit*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetFontHeight(font : Win32cr::Graphics::GdiPlus::GpFont*, graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, height : Float32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetFontHeightGivenDPI(font : Win32cr::Graphics::GdiPlus::GpFont*, dpi : Float32, height : Float32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetLogFontA(font : Win32cr::Graphics::GdiPlus::GpFont*, graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, logfontA : Win32cr::Graphics::Gdi::LOGFONTA*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetLogFontW(font : Win32cr::Graphics::GdiPlus::GpFont*, graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, logfontW : Win32cr::Graphics::Gdi::LOGFONTW*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipNewInstalledFontCollection(fontCollection : Win32cr::Graphics::GdiPlus::GpFontCollection**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipNewPrivateFontCollection(fontCollection : Win32cr::Graphics::GdiPlus::GpFontCollection**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDeletePrivateFontCollection(fontCollection : Win32cr::Graphics::GdiPlus::GpFontCollection**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetFontCollectionFamilyCount(fontCollection : Win32cr::Graphics::GdiPlus::GpFontCollection*, numFound : Int32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetFontCollectionFamilyList(fontCollection : Win32cr::Graphics::GdiPlus::GpFontCollection*, numSought : Int32, gpfamilies : Win32cr::Graphics::GdiPlus::GpFontFamily**, numFound : Int32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipPrivateAddFontFile(fontCollection : Win32cr::Graphics::GdiPlus::GpFontCollection*, filename : Win32cr::Foundation::PWSTR) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipPrivateAddMemoryFont(fontCollection : Win32cr::Graphics::GdiPlus::GpFontCollection*, memory : Void*, length : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawString(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, string : Win32cr::Foundation::PWSTR, length : Int32, font : Win32cr::Graphics::GdiPlus::GpFont*, layoutRect : Win32cr::Graphics::GdiPlus::RectF*, stringFormat : Win32cr::Graphics::GdiPlus::GpStringFormat*, brush : Win32cr::Graphics::GdiPlus::GpBrush*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipMeasureString(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, string : Win32cr::Foundation::PWSTR, length : Int32, font : Win32cr::Graphics::GdiPlus::GpFont*, layoutRect : Win32cr::Graphics::GdiPlus::RectF*, stringFormat : Win32cr::Graphics::GdiPlus::GpStringFormat*, boundingBox : Win32cr::Graphics::GdiPlus::RectF*, codepointsFitted : Int32*, linesFilled : Int32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipMeasureCharacterRanges(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, string : Win32cr::Foundation::PWSTR, length : Int32, font : Win32cr::Graphics::GdiPlus::GpFont*, layoutRect : Win32cr::Graphics::GdiPlus::RectF*, stringFormat : Win32cr::Graphics::GdiPlus::GpStringFormat*, regionCount : Int32, regions : Win32cr::Graphics::GdiPlus::GpRegion**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawDriverString(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, text : UInt16*, length : Int32, font : Win32cr::Graphics::GdiPlus::GpFont*, brush : Win32cr::Graphics::GdiPlus::GpBrush*, positions : Win32cr::Graphics::GdiPlus::PointF*, flags : Int32, matrix : Win32cr::Graphics::GdiPlus::Matrix*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipMeasureDriverString(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, text : UInt16*, length : Int32, font : Win32cr::Graphics::GdiPlus::GpFont*, positions : Win32cr::Graphics::GdiPlus::PointF*, flags : Int32, matrix : Win32cr::Graphics::GdiPlus::Matrix*, boundingBox : Win32cr::Graphics::GdiPlus::RectF*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateStringFormat(formatAttributes : Int32, language : UInt16, format : Win32cr::Graphics::GdiPlus::GpStringFormat**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipStringFormatGetGenericDefault(format : Win32cr::Graphics::GdiPlus::GpStringFormat**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipStringFormatGetGenericTypographic(format : Win32cr::Graphics::GdiPlus::GpStringFormat**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDeleteStringFormat(format : Win32cr::Graphics::GdiPlus::GpStringFormat*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCloneStringFormat(format : Win32cr::Graphics::GdiPlus::GpStringFormat*, newFormat : Win32cr::Graphics::GdiPlus::GpStringFormat**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetStringFormatFlags(format : Win32cr::Graphics::GdiPlus::GpStringFormat*, flags : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetStringFormatFlags(format : Win32cr::Graphics::GdiPlus::GpStringFormat*, flags : Int32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetStringFormatAlign(format : Win32cr::Graphics::GdiPlus::GpStringFormat*, align : Win32cr::Graphics::GdiPlus::StringAlignment) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetStringFormatAlign(format : Win32cr::Graphics::GdiPlus::GpStringFormat*, align : Win32cr::Graphics::GdiPlus::StringAlignment*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetStringFormatLineAlign(format : Win32cr::Graphics::GdiPlus::GpStringFormat*, align : Win32cr::Graphics::GdiPlus::StringAlignment) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetStringFormatLineAlign(format : Win32cr::Graphics::GdiPlus::GpStringFormat*, align : Win32cr::Graphics::GdiPlus::StringAlignment*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetStringFormatTrimming(format : Win32cr::Graphics::GdiPlus::GpStringFormat*, trimming : Win32cr::Graphics::GdiPlus::StringTrimming) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetStringFormatTrimming(format : Win32cr::Graphics::GdiPlus::GpStringFormat*, trimming : Win32cr::Graphics::GdiPlus::StringTrimming*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetStringFormatHotkeyPrefix(format : Win32cr::Graphics::GdiPlus::GpStringFormat*, hotkeyPrefix : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetStringFormatHotkeyPrefix(format : Win32cr::Graphics::GdiPlus::GpStringFormat*, hotkeyPrefix : Int32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetStringFormatTabStops(format : Win32cr::Graphics::GdiPlus::GpStringFormat*, firstTabOffset : Float32, count : Int32, tabStops : Float32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetStringFormatTabStops(format : Win32cr::Graphics::GdiPlus::GpStringFormat*, count : Int32, firstTabOffset : Float32*, tabStops : Float32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetStringFormatTabStopCount(format : Win32cr::Graphics::GdiPlus::GpStringFormat*, count : Int32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetStringFormatDigitSubstitution(format : Win32cr::Graphics::GdiPlus::GpStringFormat*, language : UInt16, substitute : Win32cr::Graphics::GdiPlus::StringDigitSubstitute) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetStringFormatDigitSubstitution(format : Win32cr::Graphics::GdiPlus::GpStringFormat*, language : UInt16*, substitute : Win32cr::Graphics::GdiPlus::StringDigitSubstitute*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipGetStringFormatMeasurableCharacterRangeCount(format : Win32cr::Graphics::GdiPlus::GpStringFormat*, count : Int32*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipSetStringFormatMeasurableCharacterRanges(format : Win32cr::Graphics::GdiPlus::GpStringFormat*, rangeCount : Int32, ranges : Win32cr::Graphics::GdiPlus::CharacterRange*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipCreateCachedBitmap(bitmap : Win32cr::Graphics::GdiPlus::GpBitmap*, graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, cachedBitmap : Win32cr::Graphics::GdiPlus::GpCachedBitmap**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDeleteCachedBitmap(cachedBitmap : Win32cr::Graphics::GdiPlus::GpCachedBitmap*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipDrawCachedBitmap(graphics : Win32cr::Graphics::GdiPlus::GpGraphics*, cachedBitmap : Win32cr::Graphics::GdiPlus::GpCachedBitmap*, x : Int32, y : Int32) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipEmfToWmfBits(hemf : Win32cr::Graphics::Gdi::HENHMETAFILE, cbData16 : UInt32, pData16 : UInt8*, iMapMode : Int32, eFlags : Int32) : UInt32

    # :nodoc:
    fun GdipSetImageAttributesCachedBackground(imageattr : Win32cr::Graphics::GdiPlus::GpImageAttributes*, enableFlag : Win32cr::Foundation::BOOL) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipTestControl(control : Win32cr::Graphics::GdiPlus::GpTestControlEnum, param1 : Void*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdiplusNotificationHook(token : LibC::UIntPtrT*) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdiplusNotificationUnhook(token : LibC::UIntPtrT) : Void

    # :nodoc:
    fun GdipConvertToEmfPlus(refGraphics : Win32cr::Graphics::GdiPlus::GpGraphics*, metafile : Win32cr::Graphics::GdiPlus::GpMetafile*, conversionFailureFlag : Int32*, emfType : Win32cr::Graphics::GdiPlus::EmfType, description : Win32cr::Foundation::PWSTR, out_metafile : Win32cr::Graphics::GdiPlus::GpMetafile**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipConvertToEmfPlusToFile(refGraphics : Win32cr::Graphics::GdiPlus::GpGraphics*, metafile : Win32cr::Graphics::GdiPlus::GpMetafile*, conversionFailureFlag : Int32*, filename : Win32cr::Foundation::PWSTR, emfType : Win32cr::Graphics::GdiPlus::EmfType, description : Win32cr::Foundation::PWSTR, out_metafile : Win32cr::Graphics::GdiPlus::GpMetafile**) : Win32cr::Graphics::GdiPlus::Status

    # :nodoc:
    fun GdipConvertToEmfPlusToStream(refGraphics : Win32cr::Graphics::GdiPlus::GpGraphics*, metafile : Win32cr::Graphics::GdiPlus::GpMetafile*, conversionFailureFlag : Int32*, stream : Void*, emfType : Win32cr::Graphics::GdiPlus::EmfType, description : Win32cr::Foundation::PWSTR, out_metafile : Win32cr::Graphics::GdiPlus::GpMetafile**) : Win32cr::Graphics::GdiPlus::Status

  end
  {% end %}
end