require "./../foundation.cr"
require "./direct2_d/common.cr"
require "./../system/com.cr"
require "./../system/com/structured_storage.cr"
require "./gdi.cr"
require "./../ui/windows_and_messaging.cr"
require "./dxgi/common.cr"

module Win32cr::Graphics::Imaging
  alias PFNProgressNotification = Proc(Void*, UInt32, Win32cr::Graphics::Imaging::WICProgressOperation, Float64, Win32cr::Foundation::HRESULT)

  WINCODEC_SDK_VERSION1 = 566_u32
  WINCODEC_SDK_VERSION2 = 567_u32
  CLSID_WICImagingFactory = "cacaf262-9370-4615-a13b-9f5539da4c0a"
  CLSID_WICImagingFactory1 = "cacaf262-9370-4615-a13b-9f5539da4c0a"
  CLSID_WICImagingFactory2 = "317d06e8-5f24-433d-bdf7-79ce68d8abc2"
  WINCODEC_SDK_VERSION = 567_u32
  GUID_VendorMicrosoft = "f0e749ca-edef-4589-a73a-ee0e626a2a2b"
  GUID_VendorMicrosoftBuiltIn = "257a30fd-06b6-462b-aea4-63f70b86e533"
  CLSID_WICPngDecoder = "389ea17b-5078-4cde-b6ef-25c15175c751"
  CLSID_WICPngDecoder1 = "389ea17b-5078-4cde-b6ef-25c15175c751"
  CLSID_WICPngDecoder2 = "e018945b-aa86-4008-9bd4-6777a1e40c11"
  CLSID_WICBmpDecoder = "6b462062-7cbf-400d-9fdb-813dd10f2778"
  CLSID_WICIcoDecoder = "c61bfcdf-2e0f-4aad-a8d7-e06bafebcdfe"
  CLSID_WICJpegDecoder = "9456a480-e88b-43ea-9e73-0b2d9b71b1ca"
  CLSID_WICGifDecoder = "381dda3c-9ce9-4834-a23e-1f98f8fc52be"
  CLSID_WICTiffDecoder = "b54e85d9-fe23-499f-8b88-6acea713752b"
  CLSID_WICWmpDecoder = "a26cec36-234c-4950-ae16-e34aace71d0d"
  CLSID_WICDdsDecoder = "9053699f-a341-429d-9e90-ee437cf80c73"
  CLSID_WICBmpEncoder = "69be8bb4-d66d-47c8-865a-ed1589433782"
  CLSID_WICPngEncoder = "27949969-876a-41d7-9447-568f6a35a4dc"
  CLSID_WICJpegEncoder = "1a34f5c1-4a5a-46dc-b644-1f4567e7a676"
  CLSID_WICGifEncoder = "114f5598-0b22-40a0-86a1-c83ea495adbd"
  CLSID_WICTiffEncoder = "0131be10-2001-4c5f-a9b0-cc88fab64ce8"
  CLSID_WICWmpEncoder = "ac4ce3cb-e1c1-44cd-8215-5a1665509ec2"
  CLSID_WICDdsEncoder = "a61dde94-66ce-4ac1-881b-71680588895e"
  CLSID_WICAdngDecoder = "981d9411-909e-42a7-8f5d-a747ff052edb"
  CLSID_WICJpegQualcommPhoneEncoder = "68ed5c62-f534-4979-b2b3-686a12b2b34c"
  CLSID_WICHeifDecoder = "e9a4a80a-44fe-4de4-8971-7150b10a5199"
  CLSID_WICHeifEncoder = "0dbecec1-9eb3-4860-9c6f-ddbe86634575"
  CLSID_WICWebpDecoder = "7693e886-51c9-4070-8419-9f70738ec8fa"
  CLSID_WICRAWDecoder = "41945702-8302-44a6-9445-ac98e8afa086"
  GUID_ContainerFormatBmp = "0af1d87e-fcfe-4188-bdeb-a7906471cbe3"
  GUID_ContainerFormatPng = "1b7cfaf4-713f-473c-bbcd-6137425faeaf"
  GUID_ContainerFormatIco = "a3a860c4-338f-4c17-919a-fba4b5628f21"
  GUID_ContainerFormatJpeg = "19e4a5aa-5662-4fc5-a0c0-1758028e1057"
  GUID_ContainerFormatTiff = "163bcc30-e2e9-4f0b-961d-a3e9fdb788a3"
  GUID_ContainerFormatGif = "1f8a5601-7d4d-4cbd-9c82-1bc8d4eeb9a5"
  GUID_ContainerFormatWmp = "57a37caa-367a-4540-916b-f183c5093a4b"
  GUID_ContainerFormatDds = "9967cb95-2e85-4ac8-8ca2-83d7ccd425c9"
  GUID_ContainerFormatAdng = "f3ff6d0d-38c0-41c4-b1fe-1f3824f17b84"
  GUID_ContainerFormatHeif = "e1e62521-6787-405b-a339-500715b5763f"
  GUID_ContainerFormatWebp = "e094b0e2-67f2-45b3-b0ea-115337ca7cf3"
  GUID_ContainerFormatRaw = "fe99ce60-f19c-433c-a3ae-00acefa9ca21"
  CLSID_WICImagingCategories = "fae3d380-fea4-4623-8c75-c6b61110b681"
  CATID_WICBitmapDecoders = "7ed96837-96f0-4812-b211-f13c24117ed3"
  CATID_WICBitmapEncoders = "ac757296-3522-4e11-9862-c17be5a1767e"
  CATID_WICPixelFormats = "2b46e70f-cda7-473e-89f6-dc9630a2390b"
  CATID_WICFormatConverters = "7835eae8-bf14-49d1-93ce-533a407b2248"
  CATID_WICMetadataReader = "05af94d8-7174-4cd2-be4a-4124b80ee4b8"
  CATID_WICMetadataWriter = "abe3b9a4-257d-4b97-bd1a-294af496222e"
  CLSID_WICDefaultFormatConverter = "1a3f11dc-b514-4b17-8c5f-2154513852f1"
  CLSID_WICFormatConverterHighColor = "ac75d454-9f37-48f8-b972-4e19bc856011"
  CLSID_WICFormatConverterNChannel = "c17cabb2-d4a3-47d7-a557-339b2efbd4f1"
  CLSID_WICFormatConverterWMPhoto = "9cb5172b-d600-46ba-ab77-77bb7e3a00d9"
  CLSID_WICPlanarFormatConverter = "184132b8-32f8-4784-9131-dd7224b23438"
  WIC_JPEG_MAX_COMPONENT_COUNT = 4_u32
  WIC_JPEG_MAX_TABLE_INDEX = 3_u32
  WIC_JPEG_SAMPLE_FACTORS_ONE = 17_u32
  WIC_JPEG_SAMPLE_FACTORS_THREE_420 = 1118498_u32
  WIC_JPEG_SAMPLE_FACTORS_THREE_422 = 1118497_u32
  WIC_JPEG_SAMPLE_FACTORS_THREE_440 = 1118482_u32
  WIC_JPEG_SAMPLE_FACTORS_THREE_444 = 1118481_u32
  WIC_JPEG_QUANTIZATION_BASELINE_ONE = 0_u32
  WIC_JPEG_QUANTIZATION_BASELINE_THREE = 65792_u32
  WIC_JPEG_HUFFMAN_BASELINE_ONE = 0_u32
  WIC_JPEG_HUFFMAN_BASELINE_THREE = 1118464_u32
  GUID_WICPixelFormatDontCare = "6fddc324-4e03-4bfe-b185-3d77768dc900"
  GUID_WICPixelFormat1bppIndexed = "6fddc324-4e03-4bfe-b185-3d77768dc901"
  GUID_WICPixelFormat2bppIndexed = "6fddc324-4e03-4bfe-b185-3d77768dc902"
  GUID_WICPixelFormat4bppIndexed = "6fddc324-4e03-4bfe-b185-3d77768dc903"
  GUID_WICPixelFormat8bppIndexed = "6fddc324-4e03-4bfe-b185-3d77768dc904"
  GUID_WICPixelFormatBlackWhite = "6fddc324-4e03-4bfe-b185-3d77768dc905"
  GUID_WICPixelFormat2bppGray = "6fddc324-4e03-4bfe-b185-3d77768dc906"
  GUID_WICPixelFormat4bppGray = "6fddc324-4e03-4bfe-b185-3d77768dc907"
  GUID_WICPixelFormat8bppGray = "6fddc324-4e03-4bfe-b185-3d77768dc908"
  GUID_WICPixelFormat8bppAlpha = "e6cd0116-eeba-4161-aa85-27dd9fb3a895"
  GUID_WICPixelFormat16bppBGR555 = "6fddc324-4e03-4bfe-b185-3d77768dc909"
  GUID_WICPixelFormat16bppBGR565 = "6fddc324-4e03-4bfe-b185-3d77768dc90a"
  GUID_WICPixelFormat16bppBGRA5551 = "05ec7c2b-f1e6-4961-ad46-e1cc810a87d2"
  GUID_WICPixelFormat16bppGray = "6fddc324-4e03-4bfe-b185-3d77768dc90b"
  GUID_WICPixelFormat24bppBGR = "6fddc324-4e03-4bfe-b185-3d77768dc90c"
  GUID_WICPixelFormat24bppRGB = "6fddc324-4e03-4bfe-b185-3d77768dc90d"
  GUID_WICPixelFormat32bppBGR = "6fddc324-4e03-4bfe-b185-3d77768dc90e"
  GUID_WICPixelFormat32bppBGRA = "6fddc324-4e03-4bfe-b185-3d77768dc90f"
  GUID_WICPixelFormat32bppPBGRA = "6fddc324-4e03-4bfe-b185-3d77768dc910"
  GUID_WICPixelFormat32bppGrayFloat = "6fddc324-4e03-4bfe-b185-3d77768dc911"
  GUID_WICPixelFormat32bppRGB = "d98c6b95-3efe-47d6-bb25-eb1748ab0cf1"
  GUID_WICPixelFormat32bppRGBA = "f5c7ad2d-6a8d-43dd-a7a8-a29935261ae9"
  GUID_WICPixelFormat32bppPRGBA = "3cc4a650-a527-4d37-a916-3142c7ebedba"
  GUID_WICPixelFormat48bppRGB = "6fddc324-4e03-4bfe-b185-3d77768dc915"
  GUID_WICPixelFormat48bppBGR = "e605a384-b468-46ce-bb2e-36f180e64313"
  GUID_WICPixelFormat64bppRGB = "a1182111-186d-4d42-bc6a-9c8303a8dff9"
  GUID_WICPixelFormat64bppRGBA = "6fddc324-4e03-4bfe-b185-3d77768dc916"
  GUID_WICPixelFormat64bppBGRA = "1562ff7c-d352-46f9-979e-42976b792246"
  GUID_WICPixelFormat64bppPRGBA = "6fddc324-4e03-4bfe-b185-3d77768dc917"
  GUID_WICPixelFormat64bppPBGRA = "8c518e8e-a4ec-468b-ae70-c9a35a9c5530"
  GUID_WICPixelFormat16bppGrayFixedPoint = "6fddc324-4e03-4bfe-b185-3d77768dc913"
  GUID_WICPixelFormat32bppBGR101010 = "6fddc324-4e03-4bfe-b185-3d77768dc914"
  GUID_WICPixelFormat48bppRGBFixedPoint = "6fddc324-4e03-4bfe-b185-3d77768dc912"
  GUID_WICPixelFormat48bppBGRFixedPoint = "49ca140e-cab6-493b-9ddf-60187c37532a"
  GUID_WICPixelFormat96bppRGBFixedPoint = "6fddc324-4e03-4bfe-b185-3d77768dc918"
  GUID_WICPixelFormat96bppRGBFloat = "e3fed78f-e8db-4acf-84c1-e97f6136b327"
  GUID_WICPixelFormat128bppRGBAFloat = "6fddc324-4e03-4bfe-b185-3d77768dc919"
  GUID_WICPixelFormat128bppPRGBAFloat = "6fddc324-4e03-4bfe-b185-3d77768dc91a"
  GUID_WICPixelFormat128bppRGBFloat = "6fddc324-4e03-4bfe-b185-3d77768dc91b"
  GUID_WICPixelFormat32bppCMYK = "6fddc324-4e03-4bfe-b185-3d77768dc91c"
  GUID_WICPixelFormat64bppRGBAFixedPoint = "6fddc324-4e03-4bfe-b185-3d77768dc91d"
  GUID_WICPixelFormat64bppBGRAFixedPoint = "356de33c-54d2-4a23-bb04-9b7bf9b1d42d"
  GUID_WICPixelFormat64bppRGBFixedPoint = "6fddc324-4e03-4bfe-b185-3d77768dc940"
  GUID_WICPixelFormat128bppRGBAFixedPoint = "6fddc324-4e03-4bfe-b185-3d77768dc91e"
  GUID_WICPixelFormat128bppRGBFixedPoint = "6fddc324-4e03-4bfe-b185-3d77768dc941"
  GUID_WICPixelFormat64bppRGBAHalf = "6fddc324-4e03-4bfe-b185-3d77768dc93a"
  GUID_WICPixelFormat64bppPRGBAHalf = "58ad26c2-c623-4d9d-b320-387e49f8c442"
  GUID_WICPixelFormat64bppRGBHalf = "6fddc324-4e03-4bfe-b185-3d77768dc942"
  GUID_WICPixelFormat48bppRGBHalf = "6fddc324-4e03-4bfe-b185-3d77768dc93b"
  GUID_WICPixelFormat32bppRGBE = "6fddc324-4e03-4bfe-b185-3d77768dc93d"
  GUID_WICPixelFormat16bppGrayHalf = "6fddc324-4e03-4bfe-b185-3d77768dc93e"
  GUID_WICPixelFormat32bppGrayFixedPoint = "6fddc324-4e03-4bfe-b185-3d77768dc93f"
  GUID_WICPixelFormat32bppRGBA1010102 = "25238d72-fcf9-4522-b514-5578e5ad55e0"
  GUID_WICPixelFormat32bppRGBA1010102XR = "00de6b9a-c101-434b-b502-d0165ee1122c"
  GUID_WICPixelFormat32bppR10G10B10A2 = "604e1bb5-8a3c-4b65-b11c-bc0b8dd75b7f"
  GUID_WICPixelFormat32bppR10G10B10A2HDR10 = "9c215c5d-1acc-4f0e-a4bc-70fb3ae8fd28"
  GUID_WICPixelFormat64bppCMYK = "6fddc324-4e03-4bfe-b185-3d77768dc91f"
  GUID_WICPixelFormat24bpp3Channels = "6fddc324-4e03-4bfe-b185-3d77768dc920"
  GUID_WICPixelFormat32bpp4Channels = "6fddc324-4e03-4bfe-b185-3d77768dc921"
  GUID_WICPixelFormat40bpp5Channels = "6fddc324-4e03-4bfe-b185-3d77768dc922"
  GUID_WICPixelFormat48bpp6Channels = "6fddc324-4e03-4bfe-b185-3d77768dc923"
  GUID_WICPixelFormat56bpp7Channels = "6fddc324-4e03-4bfe-b185-3d77768dc924"
  GUID_WICPixelFormat64bpp8Channels = "6fddc324-4e03-4bfe-b185-3d77768dc925"
  GUID_WICPixelFormat48bpp3Channels = "6fddc324-4e03-4bfe-b185-3d77768dc926"
  GUID_WICPixelFormat64bpp4Channels = "6fddc324-4e03-4bfe-b185-3d77768dc927"
  GUID_WICPixelFormat80bpp5Channels = "6fddc324-4e03-4bfe-b185-3d77768dc928"
  GUID_WICPixelFormat96bpp6Channels = "6fddc324-4e03-4bfe-b185-3d77768dc929"
  GUID_WICPixelFormat112bpp7Channels = "6fddc324-4e03-4bfe-b185-3d77768dc92a"
  GUID_WICPixelFormat128bpp8Channels = "6fddc324-4e03-4bfe-b185-3d77768dc92b"
  GUID_WICPixelFormat40bppCMYKAlpha = "6fddc324-4e03-4bfe-b185-3d77768dc92c"
  GUID_WICPixelFormat80bppCMYKAlpha = "6fddc324-4e03-4bfe-b185-3d77768dc92d"
  GUID_WICPixelFormat32bpp3ChannelsAlpha = "6fddc324-4e03-4bfe-b185-3d77768dc92e"
  GUID_WICPixelFormat40bpp4ChannelsAlpha = "6fddc324-4e03-4bfe-b185-3d77768dc92f"
  GUID_WICPixelFormat48bpp5ChannelsAlpha = "6fddc324-4e03-4bfe-b185-3d77768dc930"
  GUID_WICPixelFormat56bpp6ChannelsAlpha = "6fddc324-4e03-4bfe-b185-3d77768dc931"
  GUID_WICPixelFormat64bpp7ChannelsAlpha = "6fddc324-4e03-4bfe-b185-3d77768dc932"
  GUID_WICPixelFormat72bpp8ChannelsAlpha = "6fddc324-4e03-4bfe-b185-3d77768dc933"
  GUID_WICPixelFormat64bpp3ChannelsAlpha = "6fddc324-4e03-4bfe-b185-3d77768dc934"
  GUID_WICPixelFormat80bpp4ChannelsAlpha = "6fddc324-4e03-4bfe-b185-3d77768dc935"
  GUID_WICPixelFormat96bpp5ChannelsAlpha = "6fddc324-4e03-4bfe-b185-3d77768dc936"
  GUID_WICPixelFormat112bpp6ChannelsAlpha = "6fddc324-4e03-4bfe-b185-3d77768dc937"
  GUID_WICPixelFormat128bpp7ChannelsAlpha = "6fddc324-4e03-4bfe-b185-3d77768dc938"
  GUID_WICPixelFormat144bpp8ChannelsAlpha = "6fddc324-4e03-4bfe-b185-3d77768dc939"
  GUID_WICPixelFormat8bppY = "91b4db54-2df9-42f0-b449-2909bb3df88e"
  GUID_WICPixelFormat8bppCb = "1339f224-6bfe-4c3e-9302-e4f3a6d0ca2a"
  GUID_WICPixelFormat8bppCr = "b8145053-2116-49f0-8835-ed844b205c51"
  GUID_WICPixelFormat16bppCbCr = "ff95ba6e-11e0-4263-bb45-01721f3460a4"
  GUID_WICPixelFormat16bppYQuantizedDctCoefficients = "a355f433-48e8-4a42-84d8-e2aa26ca80a4"
  GUID_WICPixelFormat16bppCbQuantizedDctCoefficients = "d2c4ff61-56a5-49c2-8b5c-4c1925964837"
  GUID_WICPixelFormat16bppCrQuantizedDctCoefficients = "2fe354f0-1680-42d8-9231-e73c0565bfc1"
  FACILITY_WINCODEC_ERR = 2200_u32
  WINCODEC_ERR_BASE = 8192_u32
  WINCODEC_ERR_GENERIC_ERROR = -2147467259_i32
  WINCODEC_ERR_INVALIDPARAMETER = -2147024809_i32
  WINCODEC_ERR_OUTOFMEMORY = -2147024882_i32
  WINCODEC_ERR_NOTIMPLEMENTED = -2147467263_i32
  WINCODEC_ERR_ABORTED = -2147467260_i32
  WINCODEC_ERR_ACCESSDENIED = -2147024891_i32
  WICRawChangeNotification_ExposureCompensation = 1_u32
  WICRawChangeNotification_NamedWhitePoint = 2_u32
  WICRawChangeNotification_KelvinWhitePoint = 4_u32
  WICRawChangeNotification_RGBWhitePoint = 8_u32
  WICRawChangeNotification_Contrast = 16_u32
  WICRawChangeNotification_Gamma = 32_u32
  WICRawChangeNotification_Sharpness = 64_u32
  WICRawChangeNotification_Saturation = 128_u32
  WICRawChangeNotification_Tint = 256_u32
  WICRawChangeNotification_NoiseReduction = 512_u32
  WICRawChangeNotification_DestinationColorContext = 1024_u32
  WICRawChangeNotification_ToneCurve = 2048_u32
  WICRawChangeNotification_Rotation = 4096_u32
  WICRawChangeNotification_RenderMode = 8192_u32
  GUID_MetadataFormatUnknown = "a45e592f-9078-4a7c-adb5-4edc4fd61b1f"
  GUID_MetadataFormatIfd = "537396c6-2d8a-4bb6-9bf8-2f0a8e2a3adf"
  GUID_MetadataFormatSubIfd = "58a2e128-2db9-4e57-bb14-5177891ed331"
  GUID_MetadataFormatExif = "1c3c4f9d-b84a-467d-9493-36cfbd59ea57"
  GUID_MetadataFormatGps = "7134ab8a-9351-44ad-af62-448db6b502ec"
  GUID_MetadataFormatInterop = "ed686f8e-681f-4c8b-bd41-a8addbf6b3fc"
  GUID_MetadataFormatApp0 = "79007028-268d-45d6-a3c2-354e6a504bc9"
  GUID_MetadataFormatApp1 = "8fd3dfc3-f951-492b-817f-69c2e6d9a5b0"
  GUID_MetadataFormatApp13 = "326556a2-f502-4354-9cc0-8e3f48eaf6b5"
  GUID_MetadataFormatIPTC = "4fab0914-e129-4087-a1d1-bc812d45a7b5"
  GUID_MetadataFormatIRB = "16100d66-8570-4bb9-b92d-fda4b23ece67"
  GUID_MetadataFormat8BIMIPTC = "0010568c-0852-4e6a-b191-5c33ac5b0430"
  GUID_MetadataFormat8BIMResolutionInfo = "739f305d-81db-43cb-ac5e-55013ef9f003"
  GUID_MetadataFormat8BIMIPTCDigest = "1ca32285-9ccd-4786-8bd8-79539db6a006"
  GUID_MetadataFormatXMP = "bb5acc38-f216-4cec-a6c5-5f6e739763a9"
  GUID_MetadataFormatThumbnail = "243dcee9-8703-40ee-8ef0-22a600b8058c"
  GUID_MetadataFormatChunktEXt = "568d8936-c0a9-4923-905d-df2b38238fbc"
  GUID_MetadataFormatXMPStruct = "22383cf1-ed17-4e2e-af17-d85b8f6b30d0"
  GUID_MetadataFormatXMPBag = "833cca5f-dcb7-4516-806f-6596ab26dce4"
  GUID_MetadataFormatXMPSeq = "63e8df02-eb6c-456c-a224-b25e794fd648"
  GUID_MetadataFormatXMPAlt = "7b08a675-91aa-481b-a798-4da94908613b"
  GUID_MetadataFormatLSD = "e256031e-6299-4929-b98d-5ac884afba92"
  GUID_MetadataFormatIMD = "bd2bb086-4d52-48dd-9677-db483e85ae8f"
  GUID_MetadataFormatGCE = "2a25cad8-deeb-4c69-a788-0ec2266dcafd"
  GUID_MetadataFormatAPE = "2e043dc2-c967-4e05-875e-618bf67e85c3"
  GUID_MetadataFormatJpegChrominance = "f73d0dcf-cec6-4f85-9b0e-1c3956b1bef7"
  GUID_MetadataFormatJpegLuminance = "86908007-edfc-4860-8d4b-4ee6e83e6058"
  GUID_MetadataFormatJpegComment = "220e5f33-afd3-474e-9d31-7d4fe730f557"
  GUID_MetadataFormatGifComment = "c4b6e0e0-cfb4-4ad3-ab33-9aad2355a34a"
  GUID_MetadataFormatChunkgAMA = "f00935a5-1d5d-4cd1-81b2-9324d7eca781"
  GUID_MetadataFormatChunkbKGD = "e14d3571-6b47-4dea-b60a-87ce0a78dfb7"
  GUID_MetadataFormatChunkiTXt = "c2bec729-0b68-4b77-aa0e-6295a6ac1814"
  GUID_MetadataFormatChunkcHRM = "9db3655b-2842-44b3-8067-12e9b375556a"
  GUID_MetadataFormatChunkhIST = "c59a82da-db74-48a4-bd6a-b69c4931ef95"
  GUID_MetadataFormatChunkiCCP = "eb4349ab-b685-450f-91b5-e802e892536c"
  GUID_MetadataFormatChunksRGB = "c115fd36-cc6f-4e3f-8363-524b87c6b0d9"
  GUID_MetadataFormatChunktIME = "6b00ae2d-e24b-460a-98b6-878bd03072fd"
  GUID_MetadataFormatDds = "4a064603-8c33-4e60-9c29-136231702d08"
  GUID_MetadataFormatHeif = "817ef3e1-1288-45f4-a852-260d9e7cce83"
  GUID_MetadataFormatHeifHDR = "568b8d8a-1e65-438c-8968-d60e1012beb9"
  GUID_MetadataFormatWebpANIM = "6dc4fda6-78e6-4102-ae35-bcfa1edcc78b"
  GUID_MetadataFormatWebpANMF = "43c105ee-b93b-4abb-b003-a08c0d870471"
  CLSID_WICUnknownMetadataReader = "699745c2-5066-4b82-a8e3-d40478dbec8c"
  CLSID_WICUnknownMetadataWriter = "a09cca86-27ba-4f39-9053-121fa4dc08fc"
  CLSID_WICApp0MetadataWriter = "f3c633a2-46c8-498e-8fbb-cc6f721bbcde"
  CLSID_WICApp0MetadataReader = "43324b33-a78f-480f-9111-9638aaccc832"
  CLSID_WICApp1MetadataWriter = "ee366069-1832-420f-b381-0479ad066f19"
  CLSID_WICApp1MetadataReader = "dde33513-774e-4bcd-ae79-02f4adfe62fc"
  CLSID_WICApp13MetadataWriter = "7b19a919-a9d6-49e5-bd45-02c34e4e4cd5"
  CLSID_WICApp13MetadataReader = "aa7e3c50-864c-4604-bc04-8b0b76e637f6"
  CLSID_WICIfdMetadataReader = "8f914656-9d0a-4eb2-9019-0bf96d8a9ee6"
  CLSID_WICIfdMetadataWriter = "b1ebfc28-c9bd-47a2-8d33-b948769777a7"
  CLSID_WICSubIfdMetadataReader = "50d42f09-ecd1-4b41-b65d-da1fdaa75663"
  CLSID_WICSubIfdMetadataWriter = "8ade5386-8e9b-4f4c-acf2-f0008706b238"
  CLSID_WICExifMetadataReader = "d9403860-297f-4a49-bf9b-77898150a442"
  CLSID_WICExifMetadataWriter = "c9a14cda-c339-460b-9078-d4debcfabe91"
  CLSID_WICGpsMetadataReader = "3697790b-223b-484e-9925-c4869218f17a"
  CLSID_WICGpsMetadataWriter = "cb8c13e4-62b5-4c96-a48b-6ba6ace39c76"
  CLSID_WICInteropMetadataReader = "b5c8b898-0074-459f-b700-860d4651ea14"
  CLSID_WICInteropMetadataWriter = "122ec645-cd7e-44d8-b186-2c8c20c3b50f"
  CLSID_WICThumbnailMetadataReader = "fb012959-f4f6-44d7-9d09-daa087a9db57"
  CLSID_WICThumbnailMetadataWriter = "d049b20c-5dd0-44fe-b0b3-8f92c8e6d080"
  CLSID_WICIPTCMetadataReader = "03012959-f4f6-44d7-9d09-daa087a9db57"
  CLSID_WICIPTCMetadataWriter = "1249b20c-5dd0-44fe-b0b3-8f92c8e6d080"
  CLSID_WICIRBMetadataReader = "d4dcd3d7-b4c2-47d9-a6bf-b89ba396a4a3"
  CLSID_WICIRBMetadataWriter = "5c5c1935-0235-4434-80bc-251bc1ec39c6"
  CLSID_WIC8BIMIPTCMetadataReader = "0010668c-0801-4da6-a4a4-826522b6d28f"
  CLSID_WIC8BIMIPTCMetadataWriter = "00108226-ee41-44a2-9e9c-4be4d5b1d2cd"
  CLSID_WIC8BIMResolutionInfoMetadataReader = "5805137a-e348-4f7c-b3cc-6db9965a0599"
  CLSID_WIC8BIMResolutionInfoMetadataWriter = "4ff2fe0e-e74a-4b71-98c4-ab7dc16707ba"
  CLSID_WIC8BIMIPTCDigestMetadataReader = "02805f1e-d5aa-415b-82c5-61c033a988a6"
  CLSID_WIC8BIMIPTCDigestMetadataWriter = "2db5e62b-0d67-495f-8f9d-c2f0188647ac"
  CLSID_WICPngTextMetadataReader = "4b59afcc-b8c3-408a-b670-89e5fab6fda7"
  CLSID_WICPngTextMetadataWriter = "b5ebafb9-253e-4a72-a744-0762d2685683"
  CLSID_WICXMPMetadataReader = "72b624df-ae11-4948-a65c-351eb0829419"
  CLSID_WICXMPMetadataWriter = "1765e14e-1bd4-462e-b6b1-590bf1262ac6"
  CLSID_WICXMPStructMetadataReader = "01b90d9a-8209-47f7-9c52-e1244bf50ced"
  CLSID_WICXMPStructMetadataWriter = "22c21f93-7ddb-411c-9b17-c5b7bd064abc"
  CLSID_WICXMPBagMetadataReader = "e7e79a30-4f2c-4fab-8d00-394f2d6bbebe"
  CLSID_WICXMPBagMetadataWriter = "ed822c8c-d6be-4301-a631-0e1416bad28f"
  CLSID_WICXMPSeqMetadataReader = "7f12e753-fc71-43d7-a51d-92f35977abb5"
  CLSID_WICXMPSeqMetadataWriter = "6d68d1de-d432-4b0f-923a-091183a9bda7"
  CLSID_WICXMPAltMetadataReader = "aa94dcc2-b8b0-4898-b835-000aabd74393"
  CLSID_WICXMPAltMetadataWriter = "076c2a6c-f78f-4c46-a723-3583e70876ea"
  CLSID_WICLSDMetadataReader = "41070793-59e4-479a-a1f7-954adc2ef5fc"
  CLSID_WICLSDMetadataWriter = "73c037e7-e5d9-4954-876a-6da81d6e5768"
  CLSID_WICGCEMetadataReader = "b92e345d-f52d-41f3-b562-081bc772e3b9"
  CLSID_WICGCEMetadataWriter = "af95dc76-16b2-47f4-b3ea-3c31796693e7"
  CLSID_WICIMDMetadataReader = "7447a267-0015-42c8-a8f1-fb3b94c68361"
  CLSID_WICIMDMetadataWriter = "8c89071f-452e-4e95-9682-9d1024627172"
  CLSID_WICAPEMetadataReader = "1767b93a-b021-44ea-920f-863c11f4f768"
  CLSID_WICAPEMetadataWriter = "bd6edfca-2890-482f-b233-8d7339a1cf8d"
  CLSID_WICJpegChrominanceMetadataReader = "50b1904b-f28f-4574-93f4-0bade82c69e9"
  CLSID_WICJpegChrominanceMetadataWriter = "3ff566f0-6e6b-49d4-96e6-b78886692c62"
  CLSID_WICJpegLuminanceMetadataReader = "356f2f88-05a6-4728-b9a4-1bfbce04d838"
  CLSID_WICJpegLuminanceMetadataWriter = "1d583abc-8a0e-4657-9982-a380ca58fb4b"
  CLSID_WICJpegCommentMetadataReader = "9f66347c-60c4-4c4d-ab58-d2358685f607"
  CLSID_WICJpegCommentMetadataWriter = "e573236f-55b1-4eda-81ea-9f65db0290d3"
  CLSID_WICGifCommentMetadataReader = "32557d3b-69dc-4f95-836e-f5972b2f6159"
  CLSID_WICGifCommentMetadataWriter = "a02797fc-c4ae-418c-af95-e637c7ead2a1"
  CLSID_WICPngGamaMetadataReader = "3692ca39-e082-4350-9e1f-3704cb083cd5"
  CLSID_WICPngGamaMetadataWriter = "ff036d13-5d4b-46dd-b10f-106693d9fe4f"
  CLSID_WICPngBkgdMetadataReader = "0ce7a4a6-03e8-4a60-9d15-282ef32ee7da"
  CLSID_WICPngBkgdMetadataWriter = "68e3f2fd-31ae-4441-bb6a-fd7047525f90"
  CLSID_WICPngItxtMetadataReader = "aabfb2fa-3e1e-4a8f-8977-5556fb94ea23"
  CLSID_WICPngItxtMetadataWriter = "31879719-e751-4df8-981d-68dff67704ed"
  CLSID_WICPngChrmMetadataReader = "f90b5f36-367b-402a-9dd1-bc0fd59d8f62"
  CLSID_WICPngChrmMetadataWriter = "e23ce3eb-5608-4e83-bcef-27b1987e51d7"
  CLSID_WICPngHistMetadataReader = "877a0bb7-a313-4491-87b5-2e6d0594f520"
  CLSID_WICPngHistMetadataWriter = "8a03e749-672e-446e-bf1f-2c11d233b6ff"
  CLSID_WICPngIccpMetadataReader = "f5d3e63b-cb0f-4628-a478-6d8244be36b1"
  CLSID_WICPngIccpMetadataWriter = "16671e5f-0ce6-4cc4-9768-e89fe5018ade"
  CLSID_WICPngSrgbMetadataReader = "fb40360c-547e-4956-a3b9-d4418859ba66"
  CLSID_WICPngSrgbMetadataWriter = "a6ee35c6-87ec-47df-9f22-1d5aad840c82"
  CLSID_WICPngTimeMetadataReader = "d94edf02-efe5-4f0d-85c8-f5a68b3000b1"
  CLSID_WICPngTimeMetadataWriter = "1ab78400-b5a3-4d91-8ace-33fcd1499be6"
  CLSID_WICDdsMetadataReader = "276c88ca-7533-4a86-b676-66b36080d484"
  CLSID_WICDdsMetadataWriter = "fd688bbd-31ed-4db7-a723-934927d38367"
  CLSID_WICHeifMetadataReader = "acddfc3f-85ec-41bc-bdef-1bc262e4db05"
  CLSID_WICHeifMetadataWriter = "3ae45e79-40bc-4401-ace5-dd3cb16e6afe"
  CLSID_WICHeifHDRMetadataReader = "2438de3d-94d9-4be8-84a8-4de95a575e75"
  CLSID_WICWebpAnimMetadataReader = "076f9911-a348-465c-a807-a252f3f2d3de"
  CLSID_WICWebpAnmfMetadataReader = "85a10b03-c9f6-439f-be5e-c0fbef67807c"

  enum WICColorContextType
    WICColorContextUninitialized = 0_i32
    WICColorContextProfile = 1_i32
    WICColorContextExifColorSpace = 2_i32
  end
  enum WICBitmapCreateCacheOption
    WICBitmapNoCache = 0_i32
    WICBitmapCacheOnDemand = 1_i32
    WICBitmapCacheOnLoad = 2_i32
    WICBITMAPCREATECACHEOPTION_FORCE_DWORD = 2147483647_i32
  end
  enum WICDecodeOptions
    WICDecodeMetadataCacheOnDemand = 0_i32
    WICDecodeMetadataCacheOnLoad = 1_i32
    WICMETADATACACHEOPTION_FORCE_DWORD = 2147483647_i32
  end
  enum WICBitmapEncoderCacheOption
    WICBitmapEncoderCacheInMemory = 0_i32
    WICBitmapEncoderCacheTempFile = 1_i32
    WICBitmapEncoderNoCache = 2_i32
    WICBITMAPENCODERCACHEOPTION_FORCE_DWORD = 2147483647_i32
  end
  enum WICComponentType
    WICDecoder = 1_i32
    WICEncoder = 2_i32
    WICPixelFormatConverter = 4_i32
    WICMetadataReader = 8_i32
    WICMetadataWriter = 16_i32
    WICPixelFormat = 32_i32
    WICAllComponents = 63_i32
    WICCOMPONENTTYPE_FORCE_DWORD = 2147483647_i32
  end
  enum WICComponentEnumerateOptions
    WICComponentEnumerateDefault = 0_i32
    WICComponentEnumerateRefresh = 1_i32
    WICComponentEnumerateDisabled = -2147483648_i32
    WICComponentEnumerateUnsigned = 1073741824_i32
    WICComponentEnumerateBuiltInOnly = 536870912_i32
    WICCOMPONENTENUMERATEOPTIONS_FORCE_DWORD = 2147483647_i32
  end
  enum WICBitmapInterpolationMode
    WICBitmapInterpolationModeNearestNeighbor = 0_i32
    WICBitmapInterpolationModeLinear = 1_i32
    WICBitmapInterpolationModeCubic = 2_i32
    WICBitmapInterpolationModeFant = 3_i32
    WICBitmapInterpolationModeHighQualityCubic = 4_i32
    WICBITMAPINTERPOLATIONMODE_FORCE_DWORD = 2147483647_i32
  end
  enum WICBitmapPaletteType
    WICBitmapPaletteTypeCustom = 0_i32
    WICBitmapPaletteTypeMedianCut = 1_i32
    WICBitmapPaletteTypeFixedBW = 2_i32
    WICBitmapPaletteTypeFixedHalftone8 = 3_i32
    WICBitmapPaletteTypeFixedHalftone27 = 4_i32
    WICBitmapPaletteTypeFixedHalftone64 = 5_i32
    WICBitmapPaletteTypeFixedHalftone125 = 6_i32
    WICBitmapPaletteTypeFixedHalftone216 = 7_i32
    WICBitmapPaletteTypeFixedWebPalette = 7_i32
    WICBitmapPaletteTypeFixedHalftone252 = 8_i32
    WICBitmapPaletteTypeFixedHalftone256 = 9_i32
    WICBitmapPaletteTypeFixedGray4 = 10_i32
    WICBitmapPaletteTypeFixedGray16 = 11_i32
    WICBitmapPaletteTypeFixedGray256 = 12_i32
    WICBITMAPPALETTETYPE_FORCE_DWORD = 2147483647_i32
  end
  enum WICBitmapDitherType
    WICBitmapDitherTypeNone = 0_i32
    WICBitmapDitherTypeSolid = 0_i32
    WICBitmapDitherTypeOrdered4x4 = 1_i32
    WICBitmapDitherTypeOrdered8x8 = 2_i32
    WICBitmapDitherTypeOrdered16x16 = 3_i32
    WICBitmapDitherTypeSpiral4x4 = 4_i32
    WICBitmapDitherTypeSpiral8x8 = 5_i32
    WICBitmapDitherTypeDualSpiral4x4 = 6_i32
    WICBitmapDitherTypeDualSpiral8x8 = 7_i32
    WICBitmapDitherTypeErrorDiffusion = 8_i32
    WICBITMAPDITHERTYPE_FORCE_DWORD = 2147483647_i32
  end
  enum WICBitmapAlphaChannelOption
    WICBitmapUseAlpha = 0_i32
    WICBitmapUsePremultipliedAlpha = 1_i32
    WICBitmapIgnoreAlpha = 2_i32
    WICBITMAPALPHACHANNELOPTIONS_FORCE_DWORD = 2147483647_i32
  end
  enum WICBitmapTransformOptions
    WICBitmapTransformRotate0 = 0_i32
    WICBitmapTransformRotate90 = 1_i32
    WICBitmapTransformRotate180 = 2_i32
    WICBitmapTransformRotate270 = 3_i32
    WICBitmapTransformFlipHorizontal = 8_i32
    WICBitmapTransformFlipVertical = 16_i32
    WICBITMAPTRANSFORMOPTIONS_FORCE_DWORD = 2147483647_i32
  end
  enum WICBitmapLockFlags
    WICBitmapLockRead = 1_i32
    WICBitmapLockWrite = 2_i32
    WICBITMAPLOCKFLAGS_FORCE_DWORD = 2147483647_i32
  end
  enum WICBitmapDecoderCapabilities
    WICBitmapDecoderCapabilitySameEncoder = 1_i32
    WICBitmapDecoderCapabilityCanDecodeAllImages = 2_i32
    WICBitmapDecoderCapabilityCanDecodeSomeImages = 4_i32
    WICBitmapDecoderCapabilityCanEnumerateMetadata = 8_i32
    WICBitmapDecoderCapabilityCanDecodeThumbnail = 16_i32
    WICBITMAPDECODERCAPABILITIES_FORCE_DWORD = 2147483647_i32
  end
  enum WICProgressOperation
    WICProgressOperationCopyPixels = 1_i32
    WICProgressOperationWritePixels = 2_i32
    WICProgressOperationAll = 65535_i32
    WICPROGRESSOPERATION_FORCE_DWORD = 2147483647_i32
  end
  enum WICProgressNotification
    WICProgressNotificationBegin = 65536_i32
    WICProgressNotificationEnd = 131072_i32
    WICProgressNotificationFrequent = 262144_i32
    WICProgressNotificationAll = -65536_i32
    WICPROGRESSNOTIFICATION_FORCE_DWORD = 2147483647_i32
  end
  enum WICComponentSigning
    WICComponentSigned = 1_i32
    WICComponentUnsigned = 2_i32
    WICComponentSafe = 4_i32
    WICComponentDisabled = -2147483648_i32
    WICCOMPONENTSIGNING_FORCE_DWORD = 2147483647_i32
  end
  enum WICGifLogicalScreenDescriptorProperties : UInt32
    WICGifLogicalScreenSignature = 1_u32
    WICGifLogicalScreenDescriptorWidth = 2_u32
    WICGifLogicalScreenDescriptorHeight = 3_u32
    WICGifLogicalScreenDescriptorGlobalColorTableFlag = 4_u32
    WICGifLogicalScreenDescriptorColorResolution = 5_u32
    WICGifLogicalScreenDescriptorSortFlag = 6_u32
    WICGifLogicalScreenDescriptorGlobalColorTableSize = 7_u32
    WICGifLogicalScreenDescriptorBackgroundColorIndex = 8_u32
    WICGifLogicalScreenDescriptorPixelAspectRatio = 9_u32
    WICGifLogicalScreenDescriptorProperties_FORCE_DWORD = 2147483647_u32
  end
  enum WICGifImageDescriptorProperties : UInt32
    WICGifImageDescriptorLeft = 1_u32
    WICGifImageDescriptorTop = 2_u32
    WICGifImageDescriptorWidth = 3_u32
    WICGifImageDescriptorHeight = 4_u32
    WICGifImageDescriptorLocalColorTableFlag = 5_u32
    WICGifImageDescriptorInterlaceFlag = 6_u32
    WICGifImageDescriptorSortFlag = 7_u32
    WICGifImageDescriptorLocalColorTableSize = 8_u32
    WICGifImageDescriptorProperties_FORCE_DWORD = 2147483647_u32
  end
  enum WICGifGraphicControlExtensionProperties : UInt32
    WICGifGraphicControlExtensionDisposal = 1_u32
    WICGifGraphicControlExtensionUserInputFlag = 2_u32
    WICGifGraphicControlExtensionTransparencyFlag = 3_u32
    WICGifGraphicControlExtensionDelay = 4_u32
    WICGifGraphicControlExtensionTransparentColorIndex = 5_u32
    WICGifGraphicControlExtensionProperties_FORCE_DWORD = 2147483647_u32
  end
  enum WICGifApplicationExtensionProperties : UInt32
    WICGifApplicationExtensionApplication = 1_u32
    WICGifApplicationExtensionData = 2_u32
    WICGifApplicationExtensionProperties_FORCE_DWORD = 2147483647_u32
  end
  enum WICGifCommentExtensionProperties : UInt32
    WICGifCommentExtensionText = 1_u32
    WICGifCommentExtensionProperties_FORCE_DWORD = 2147483647_u32
  end
  enum WICJpegCommentProperties : UInt32
    WICJpegCommentText = 1_u32
    WICJpegCommentProperties_FORCE_DWORD = 2147483647_u32
  end
  enum WICJpegLuminanceProperties : UInt32
    WICJpegLuminanceTable = 1_u32
    WICJpegLuminanceProperties_FORCE_DWORD = 2147483647_u32
  end
  enum WICJpegChrominanceProperties : UInt32
    WICJpegChrominanceTable = 1_u32
    WICJpegChrominanceProperties_FORCE_DWORD = 2147483647_u32
  end
  enum WIC8BIMIptcProperties : UInt32
    WIC8BIMIptcPString = 0_u32
    WIC8BIMIptcEmbeddedIPTC = 1_u32
    WIC8BIMIptcProperties_FORCE_DWORD = 2147483647_u32
  end
  enum WIC8BIMResolutionInfoProperties : UInt32
    WIC8BIMResolutionInfoPString = 1_u32
    WIC8BIMResolutionInfoHResolution = 2_u32
    WIC8BIMResolutionInfoHResolutionUnit = 3_u32
    WIC8BIMResolutionInfoWidthUnit = 4_u32
    WIC8BIMResolutionInfoVResolution = 5_u32
    WIC8BIMResolutionInfoVResolutionUnit = 6_u32
    WIC8BIMResolutionInfoHeightUnit = 7_u32
    WIC8BIMResolutionInfoProperties_FORCE_DWORD = 2147483647_u32
  end
  enum WIC8BIMIptcDigestProperties : UInt32
    WIC8BIMIptcDigestPString = 1_u32
    WIC8BIMIptcDigestIptcDigest = 2_u32
    WIC8BIMIptcDigestProperties_FORCE_DWORD = 2147483647_u32
  end
  enum WICPngGamaProperties : UInt32
    WICPngGamaGamma = 1_u32
    WICPngGamaProperties_FORCE_DWORD = 2147483647_u32
  end
  enum WICPngBkgdProperties : UInt32
    WICPngBkgdBackgroundColor = 1_u32
    WICPngBkgdProperties_FORCE_DWORD = 2147483647_u32
  end
  enum WICPngItxtProperties : UInt32
    WICPngItxtKeyword = 1_u32
    WICPngItxtCompressionFlag = 2_u32
    WICPngItxtLanguageTag = 3_u32
    WICPngItxtTranslatedKeyword = 4_u32
    WICPngItxtText = 5_u32
    WICPngItxtProperties_FORCE_DWORD = 2147483647_u32
  end
  enum WICPngChrmProperties : UInt32
    WICPngChrmWhitePointX = 1_u32
    WICPngChrmWhitePointY = 2_u32
    WICPngChrmRedX = 3_u32
    WICPngChrmRedY = 4_u32
    WICPngChrmGreenX = 5_u32
    WICPngChrmGreenY = 6_u32
    WICPngChrmBlueX = 7_u32
    WICPngChrmBlueY = 8_u32
    WICPngChrmProperties_FORCE_DWORD = 2147483647_u32
  end
  enum WICPngHistProperties : UInt32
    WICPngHistFrequencies = 1_u32
    WICPngHistProperties_FORCE_DWORD = 2147483647_u32
  end
  enum WICPngIccpProperties : UInt32
    WICPngIccpProfileName = 1_u32
    WICPngIccpProfileData = 2_u32
    WICPngIccpProperties_FORCE_DWORD = 2147483647_u32
  end
  enum WICPngSrgbProperties : UInt32
    WICPngSrgbRenderingIntent = 1_u32
    WICPngSrgbProperties_FORCE_DWORD = 2147483647_u32
  end
  enum WICPngTimeProperties : UInt32
    WICPngTimeYear = 1_u32
    WICPngTimeMonth = 2_u32
    WICPngTimeDay = 3_u32
    WICPngTimeHour = 4_u32
    WICPngTimeMinute = 5_u32
    WICPngTimeSecond = 6_u32
    WICPngTimeProperties_FORCE_DWORD = 2147483647_u32
  end
  enum WICHeifProperties : UInt32
    WICHeifOrientation = 1_u32
    WICHeifProperties_FORCE_DWORD = 2147483647_u32
  end
  enum WICHeifHdrProperties : UInt32
    WICHeifHdrMaximumLuminanceLevel = 1_u32
    WICHeifHdrMaximumFrameAverageLuminanceLevel = 2_u32
    WICHeifHdrMinimumMasteringDisplayLuminanceLevel = 3_u32
    WICHeifHdrMaximumMasteringDisplayLuminanceLevel = 4_u32
    WICHeifHdrCustomVideoPrimaries = 5_u32
    WICHeifHdrProperties_FORCE_DWORD = 2147483647_u32
  end
  enum WICWebpAnimProperties : UInt32
    WICWebpAnimLoopCount = 1_u32
    WICWebpAnimProperties_FORCE_DWORD = 2147483647_u32
  end
  enum WICWebpAnmfProperties : UInt32
    WICWebpAnmfFrameDuration = 1_u32
    WICWebpAnmfProperties_FORCE_DWORD = 2147483647_u32
  end
  enum WICSectionAccessLevel : UInt32
    WICSectionAccessLevelRead = 1_u32
    WICSectionAccessLevelReadWrite = 3_u32
    WICSectionAccessLevel_FORCE_DWORD = 2147483647_u32
  end
  enum WICPixelFormatNumericRepresentation : UInt32
    WICPixelFormatNumericRepresentationUnspecified = 0_u32
    WICPixelFormatNumericRepresentationIndexed = 1_u32
    WICPixelFormatNumericRepresentationUnsignedInteger = 2_u32
    WICPixelFormatNumericRepresentationSignedInteger = 3_u32
    WICPixelFormatNumericRepresentationFixed = 4_u32
    WICPixelFormatNumericRepresentationFloat = 5_u32
    WICPixelFormatNumericRepresentation_FORCE_DWORD = 2147483647_u32
  end
  enum WICPlanarOptions
    WICPlanarOptionsDefault = 0_i32
    WICPlanarOptionsPreserveSubsampling = 1_i32
    WICPLANAROPTIONS_FORCE_DWORD = 2147483647_i32
  end
  enum WICJpegIndexingOptions : UInt32
    WICJpegIndexingOptionsGenerateOnDemand = 0_u32
    WICJpegIndexingOptionsGenerateOnLoad = 1_u32
    WICJpegIndexingOptions_FORCE_DWORD = 2147483647_u32
  end
  enum WICJpegTransferMatrix : UInt32
    WICJpegTransferMatrixIdentity = 0_u32
    WICJpegTransferMatrixBT601 = 1_u32
    WICJpegTransferMatrix_FORCE_DWORD = 2147483647_u32
  end
  enum WICJpegScanType : UInt32
    WICJpegScanTypeInterleaved = 0_u32
    WICJpegScanTypePlanarComponents = 1_u32
    WICJpegScanTypeProgressive = 2_u32
    WICJpegScanType_FORCE_DWORD = 2147483647_u32
  end
  enum WICTiffCompressionOption
    WICTiffCompressionDontCare = 0_i32
    WICTiffCompressionNone = 1_i32
    WICTiffCompressionCCITT3 = 2_i32
    WICTiffCompressionCCITT4 = 3_i32
    WICTiffCompressionLZW = 4_i32
    WICTiffCompressionRLE = 5_i32
    WICTiffCompressionZIP = 6_i32
    WICTiffCompressionLZWHDifferencing = 7_i32
    WICTIFFCOMPRESSIONOPTION_FORCE_DWORD = 2147483647_i32
  end
  enum WICJpegYCrCbSubsamplingOption
    WICJpegYCrCbSubsamplingDefault = 0_i32
    WICJpegYCrCbSubsampling420 = 1_i32
    WICJpegYCrCbSubsampling422 = 2_i32
    WICJpegYCrCbSubsampling444 = 3_i32
    WICJpegYCrCbSubsampling440 = 4_i32
    WICJPEGYCRCBSUBSAMPLING_FORCE_DWORD = 2147483647_i32
  end
  enum WICPngFilterOption
    WICPngFilterUnspecified = 0_i32
    WICPngFilterNone = 1_i32
    WICPngFilterSub = 2_i32
    WICPngFilterUp = 3_i32
    WICPngFilterAverage = 4_i32
    WICPngFilterPaeth = 5_i32
    WICPngFilterAdaptive = 6_i32
    WICPNGFILTEROPTION_FORCE_DWORD = 2147483647_i32
  end
  enum WICNamedWhitePoint
    WICWhitePointDefault = 1_i32
    WICWhitePointDaylight = 2_i32
    WICWhitePointCloudy = 4_i32
    WICWhitePointShade = 8_i32
    WICWhitePointTungsten = 16_i32
    WICWhitePointFluorescent = 32_i32
    WICWhitePointFlash = 64_i32
    WICWhitePointUnderwater = 128_i32
    WICWhitePointCustom = 256_i32
    WICWhitePointAutoWhiteBalance = 512_i32
    WICWhitePointAsShot = 1_i32
    WICNAMEDWHITEPOINT_FORCE_DWORD = 2147483647_i32
  end
  enum WICRawCapabilities
    WICRawCapabilityNotSupported = 0_i32
    WICRawCapabilityGetSupported = 1_i32
    WICRawCapabilityFullySupported = 2_i32
    WICRAWCAPABILITIES_FORCE_DWORD = 2147483647_i32
  end
  enum WICRawRotationCapabilities
    WICRawRotationCapabilityNotSupported = 0_i32
    WICRawRotationCapabilityGetSupported = 1_i32
    WICRawRotationCapabilityNinetyDegreesSupported = 2_i32
    WICRawRotationCapabilityFullySupported = 3_i32
    WICRAWROTATIONCAPABILITIES_FORCE_DWORD = 2147483647_i32
  end
  enum WICRawParameterSet
    WICAsShotParameterSet = 1_i32
    WICUserAdjustedParameterSet = 2_i32
    WICAutoAdjustedParameterSet = 3_i32
    WICRAWPARAMETERSET_FORCE_DWORD = 2147483647_i32
  end
  enum WICRawRenderMode
    WICRawRenderModeDraft = 1_i32
    WICRawRenderModeNormal = 2_i32
    WICRawRenderModeBestQuality = 3_i32
    WICRAWRENDERMODE_FORCE_DWORD = 2147483647_i32
  end
  enum WICDdsDimension
    WICDdsTexture1D = 0_i32
    WICDdsTexture2D = 1_i32
    WICDdsTexture3D = 2_i32
    WICDdsTextureCube = 3_i32
    WICDDSTEXTURE_FORCE_DWORD = 2147483647_i32
  end
  enum WICDdsAlphaMode
    WICDdsAlphaModeUnknown = 0_i32
    WICDdsAlphaModeStraight = 1_i32
    WICDdsAlphaModePremultiplied = 2_i32
    WICDdsAlphaModeOpaque = 3_i32
    WICDdsAlphaModeCustom = 4_i32
    WICDDSALPHAMODE_FORCE_DWORD = 2147483647_i32
  end
  enum WICMetadataCreationOptions
    WICMetadataCreationDefault = 0_i32
    WICMetadataCreationAllowUnknown = 0_i32
    WICMetadataCreationFailUnknown = 65536_i32
    WICMetadataCreationMask = -65536_i32
  end
  enum WICPersistOptions
    WICPersistOptionDefault = 0_i32
    WICPersistOptionLittleEndian = 0_i32
    WICPersistOptionBigEndian = 1_i32
    WICPersistOptionStrictFormat = 2_i32
    WICPersistOptionNoCacheStream = 4_i32
    WICPersistOptionPreferUTF8 = 8_i32
    WICPersistOptionMask = 65535_i32
  end

  @[Extern]
  struct WICRect
    property x : Int32
    property y : Int32
    property width : Int32
    property height : Int32
    def initialize(@x : Int32, @y : Int32, @width : Int32, @height : Int32)
    end
  end

  @[Extern]
  struct WICBitmapPattern
    property position : Win32cr::Foundation::ULARGE_INTEGER
    property length : UInt32
    property pattern : UInt8*
    property mask : UInt8*
    property end_of_stream : Win32cr::Foundation::BOOL
    def initialize(@position : Win32cr::Foundation::ULARGE_INTEGER, @length : UInt32, @pattern : UInt8*, @mask : UInt8*, @end_of_stream : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct WICImageParameters
    property pixel_format : Win32cr::Graphics::Direct2D::Common::D2D1_PIXEL_FORMAT
    property dpi_x : Float32
    property dpi_y : Float32
    property top : Float32
    property left : Float32
    property pixel_width : UInt32
    property pixel_height : UInt32
    def initialize(@pixel_format : Win32cr::Graphics::Direct2D::Common::D2D1_PIXEL_FORMAT, @dpi_x : Float32, @dpi_y : Float32, @top : Float32, @left : Float32, @pixel_width : UInt32, @pixel_height : UInt32)
    end
  end

  @[Extern]
  struct WICBitmapPlaneDescription
    property format : LibC::GUID
    property width : UInt32
    property height : UInt32
    def initialize(@format : LibC::GUID, @width : UInt32, @height : UInt32)
    end
  end

  @[Extern]
  struct WICBitmapPlane
    property format : LibC::GUID
    property pbBuffer : UInt8*
    property cbStride : UInt32
    property cbBufferSize : UInt32
    def initialize(@format : LibC::GUID, @pbBuffer : UInt8*, @cbStride : UInt32, @cbBufferSize : UInt32)
    end
  end

  @[Extern]
  struct WICJpegFrameHeader
    property width : UInt32
    property height : UInt32
    property transfer_matrix : Win32cr::Graphics::Imaging::WICJpegTransferMatrix
    property scan_type : Win32cr::Graphics::Imaging::WICJpegScanType
    property cComponents : UInt32
    property component_identifiers : UInt32
    property sample_factors : UInt32
    property quantization_table_indices : UInt32
    def initialize(@width : UInt32, @height : UInt32, @transfer_matrix : Win32cr::Graphics::Imaging::WICJpegTransferMatrix, @scan_type : Win32cr::Graphics::Imaging::WICJpegScanType, @cComponents : UInt32, @component_identifiers : UInt32, @sample_factors : UInt32, @quantization_table_indices : UInt32)
    end
  end

  @[Extern]
  struct WICJpegScanHeader
    property cComponents : UInt32
    property restart_interval : UInt32
    property component_selectors : UInt32
    property huffman_table_indices : UInt32
    property start_spectral_selection : UInt8
    property end_spectral_selection : UInt8
    property successive_approximation_high : UInt8
    property successive_approximation_low : UInt8
    def initialize(@cComponents : UInt32, @restart_interval : UInt32, @component_selectors : UInt32, @huffman_table_indices : UInt32, @start_spectral_selection : UInt8, @end_spectral_selection : UInt8, @successive_approximation_high : UInt8, @successive_approximation_low : UInt8)
    end
  end

  @[Extern]
  struct WICRawCapabilitiesInfo
    property cbSize : UInt32
    property codec_major_version : UInt32
    property codec_minor_version : UInt32
    property exposure_compensation_support : Win32cr::Graphics::Imaging::WICRawCapabilities
    property contrast_support : Win32cr::Graphics::Imaging::WICRawCapabilities
    property rgb_white_point_support : Win32cr::Graphics::Imaging::WICRawCapabilities
    property named_white_point_support : Win32cr::Graphics::Imaging::WICRawCapabilities
    property named_white_point_support_mask : UInt32
    property kelvin_white_point_support : Win32cr::Graphics::Imaging::WICRawCapabilities
    property gamma_support : Win32cr::Graphics::Imaging::WICRawCapabilities
    property tint_support : Win32cr::Graphics::Imaging::WICRawCapabilities
    property saturation_support : Win32cr::Graphics::Imaging::WICRawCapabilities
    property sharpness_support : Win32cr::Graphics::Imaging::WICRawCapabilities
    property noise_reduction_support : Win32cr::Graphics::Imaging::WICRawCapabilities
    property destination_color_profile_support : Win32cr::Graphics::Imaging::WICRawCapabilities
    property tone_curve_support : Win32cr::Graphics::Imaging::WICRawCapabilities
    property rotation_support : Win32cr::Graphics::Imaging::WICRawRotationCapabilities
    property render_mode_support : Win32cr::Graphics::Imaging::WICRawCapabilities
    def initialize(@cbSize : UInt32, @codec_major_version : UInt32, @codec_minor_version : UInt32, @exposure_compensation_support : Win32cr::Graphics::Imaging::WICRawCapabilities, @contrast_support : Win32cr::Graphics::Imaging::WICRawCapabilities, @rgb_white_point_support : Win32cr::Graphics::Imaging::WICRawCapabilities, @named_white_point_support : Win32cr::Graphics::Imaging::WICRawCapabilities, @named_white_point_support_mask : UInt32, @kelvin_white_point_support : Win32cr::Graphics::Imaging::WICRawCapabilities, @gamma_support : Win32cr::Graphics::Imaging::WICRawCapabilities, @tint_support : Win32cr::Graphics::Imaging::WICRawCapabilities, @saturation_support : Win32cr::Graphics::Imaging::WICRawCapabilities, @sharpness_support : Win32cr::Graphics::Imaging::WICRawCapabilities, @noise_reduction_support : Win32cr::Graphics::Imaging::WICRawCapabilities, @destination_color_profile_support : Win32cr::Graphics::Imaging::WICRawCapabilities, @tone_curve_support : Win32cr::Graphics::Imaging::WICRawCapabilities, @rotation_support : Win32cr::Graphics::Imaging::WICRawRotationCapabilities, @render_mode_support : Win32cr::Graphics::Imaging::WICRawCapabilities)
    end
  end

  @[Extern]
  struct WICRawToneCurvePoint
    property input : Float64
    property output : Float64
    def initialize(@input : Float64, @output : Float64)
    end
  end

  @[Extern]
  struct WICRawToneCurve
    property cPoints : UInt32
    property aPoints : Win32cr::Graphics::Imaging::WICRawToneCurvePoint*
    def initialize(@cPoints : UInt32, @aPoints : Win32cr::Graphics::Imaging::WICRawToneCurvePoint*)
    end
  end

  @[Extern]
  struct WICDdsParameters
    property width : UInt32
    property height : UInt32
    property depth : UInt32
    property mip_levels : UInt32
    property array_size : UInt32
    property dxgi_format : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT
    property dimension : Win32cr::Graphics::Imaging::WICDdsDimension
    property alpha_mode : Win32cr::Graphics::Imaging::WICDdsAlphaMode
    def initialize(@width : UInt32, @height : UInt32, @depth : UInt32, @mip_levels : UInt32, @array_size : UInt32, @dxgi_format : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, @dimension : Win32cr::Graphics::Imaging::WICDdsDimension, @alpha_mode : Win32cr::Graphics::Imaging::WICDdsAlphaMode)
    end
  end

  @[Extern]
  struct WICDdsFormatInfo
    property dxgi_format : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT
    property bytes_per_block : UInt32
    property block_width : UInt32
    property block_height : UInt32
    def initialize(@dxgi_format : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, @bytes_per_block : UInt32, @block_width : UInt32, @block_height : UInt32)
    end
  end

  @[Extern]
  struct WICMetadataPattern
    property position : Win32cr::Foundation::ULARGE_INTEGER
    property length : UInt32
    property pattern : UInt8*
    property mask : UInt8*
    property data_offset : Win32cr::Foundation::ULARGE_INTEGER
    def initialize(@position : Win32cr::Foundation::ULARGE_INTEGER, @length : UInt32, @pattern : UInt8*, @mask : UInt8*, @data_offset : Win32cr::Foundation::ULARGE_INTEGER)
    end
  end

  @[Extern]
  struct WICMetadataHeader
    property position : Win32cr::Foundation::ULARGE_INTEGER
    property length : UInt32
    property header : UInt8*
    property data_offset : Win32cr::Foundation::ULARGE_INTEGER
    def initialize(@position : Win32cr::Foundation::ULARGE_INTEGER, @length : UInt32, @header : UInt8*, @data_offset : Win32cr::Foundation::ULARGE_INTEGER)
    end
  end

  @[Extern]
  record IWICPaletteVtbl,
    query_interface : Proc(IWICPalette*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICPalette*, UInt32),
    release : Proc(IWICPalette*, UInt32),
    initialize_predefined : Proc(IWICPalette*, Win32cr::Graphics::Imaging::WICBitmapPaletteType, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    initialize_custom : Proc(IWICPalette*, UInt32*, UInt32, Win32cr::Foundation::HRESULT),
    initialize_from_bitmap : Proc(IWICPalette*, Void*, UInt32, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    initialize_from_palette : Proc(IWICPalette*, Void*, Win32cr::Foundation::HRESULT),
    get_type : Proc(IWICPalette*, Win32cr::Graphics::Imaging::WICBitmapPaletteType*, Win32cr::Foundation::HRESULT),
    get_color_count : Proc(IWICPalette*, UInt32*, Win32cr::Foundation::HRESULT),
    get_colors : Proc(IWICPalette*, UInt32, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    is_black_white : Proc(IWICPalette*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    is_grayscale : Proc(IWICPalette*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    has_alpha : Proc(IWICPalette*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICPalette, lpVtbl : IWICPaletteVtbl* do
    GUID = LibC::GUID.new(0x40_u32, 0xa8f2_u16, 0x4877_u16, StaticArray[0xba_u8, 0xa_u8, 0xfd_u8, 0x2b_u8, 0x66_u8, 0x45_u8, 0xfb_u8, 0x94_u8])
    def query_interface(this : IWICPalette*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICPalette*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICPalette*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize_predefined(this : IWICPalette*, ePaletteType : Win32cr::Graphics::Imaging::WICBitmapPaletteType, fAddTransparentColor : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_predefined.call(this, ePaletteType, fAddTransparentColor)
    end
    def initialize_custom(this : IWICPalette*, pColors : UInt32*, cCount : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_custom.call(this, pColors, cCount)
    end
    def initialize_from_bitmap(this : IWICPalette*, pISurface : Void*, cCount : UInt32, fAddTransparentColor : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_from_bitmap.call(this, pISurface, cCount, fAddTransparentColor)
    end
    def initialize_from_palette(this : IWICPalette*, pIPalette : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_from_palette.call(this, pIPalette)
    end
    def get_type(this : IWICPalette*, pePaletteType : Win32cr::Graphics::Imaging::WICBitmapPaletteType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, pePaletteType)
    end
    def get_color_count(this : IWICPalette*, pcCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_color_count.call(this, pcCount)
    end
    def get_colors(this : IWICPalette*, cCount : UInt32, pColors : UInt32*, pcActualColors : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_colors.call(this, cCount, pColors, pcActualColors)
    end
    def is_black_white(this : IWICPalette*, pfIsBlackWhite : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_black_white.call(this, pfIsBlackWhite)
    end
    def is_grayscale(this : IWICPalette*, pfIsGrayscale : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_grayscale.call(this, pfIsGrayscale)
    end
    def has_alpha(this : IWICPalette*, pfHasAlpha : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.has_alpha.call(this, pfHasAlpha)
    end

  end

  @[Extern]
  record IWICBitmapSourceVtbl,
    query_interface : Proc(IWICBitmapSource*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICBitmapSource*, UInt32),
    release : Proc(IWICBitmapSource*, UInt32),
    get_size : Proc(IWICBitmapSource*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_pixel_format : Proc(IWICBitmapSource*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_resolution : Proc(IWICBitmapSource*, Float64*, Float64*, Win32cr::Foundation::HRESULT),
    copy_palette : Proc(IWICBitmapSource*, Void*, Win32cr::Foundation::HRESULT),
    copy_pixels : Proc(IWICBitmapSource*, Win32cr::Graphics::Imaging::WICRect*, UInt32, UInt32, UInt8*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICBitmapSource, lpVtbl : IWICBitmapSourceVtbl* do
    GUID = LibC::GUID.new(0x120_u32, 0xa8f2_u16, 0x4877_u16, StaticArray[0xba_u8, 0xa_u8, 0xfd_u8, 0x2b_u8, 0x66_u8, 0x45_u8, 0xfb_u8, 0x94_u8])
    def query_interface(this : IWICBitmapSource*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICBitmapSource*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICBitmapSource*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_size(this : IWICBitmapSource*, puiWidth : UInt32*, puiHeight : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_size.call(this, puiWidth, puiHeight)
    end
    def get_pixel_format(this : IWICBitmapSource*, pPixelFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pixel_format.call(this, pPixelFormat)
    end
    def get_resolution(this : IWICBitmapSource*, pDpiX : Float64*, pDpiY : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_resolution.call(this, pDpiX, pDpiY)
    end
    def copy_palette(this : IWICBitmapSource*, pIPalette : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_palette.call(this, pIPalette)
    end
    def copy_pixels(this : IWICBitmapSource*, prc : Win32cr::Graphics::Imaging::WICRect*, cbStride : UInt32, cbBufferSize : UInt32, pbBuffer : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_pixels.call(this, prc, cbStride, cbBufferSize, pbBuffer)
    end

  end

  @[Extern]
  record IWICFormatConverterVtbl,
    query_interface : Proc(IWICFormatConverter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICFormatConverter*, UInt32),
    release : Proc(IWICFormatConverter*, UInt32),
    get_size : Proc(IWICFormatConverter*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_pixel_format : Proc(IWICFormatConverter*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_resolution : Proc(IWICFormatConverter*, Float64*, Float64*, Win32cr::Foundation::HRESULT),
    copy_palette : Proc(IWICFormatConverter*, Void*, Win32cr::Foundation::HRESULT),
    copy_pixels : Proc(IWICFormatConverter*, Win32cr::Graphics::Imaging::WICRect*, UInt32, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    initialize__ : Proc(IWICFormatConverter*, Void*, LibC::GUID*, Win32cr::Graphics::Imaging::WICBitmapDitherType, Void*, Float64, Win32cr::Graphics::Imaging::WICBitmapPaletteType, Win32cr::Foundation::HRESULT),
    can_convert : Proc(IWICFormatConverter*, LibC::GUID*, LibC::GUID*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICFormatConverter, lpVtbl : IWICFormatConverterVtbl* do
    GUID = LibC::GUID.new(0x301_u32, 0xa8f2_u16, 0x4877_u16, StaticArray[0xba_u8, 0xa_u8, 0xfd_u8, 0x2b_u8, 0x66_u8, 0x45_u8, 0xfb_u8, 0x94_u8])
    def query_interface(this : IWICFormatConverter*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICFormatConverter*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICFormatConverter*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_size(this : IWICFormatConverter*, puiWidth : UInt32*, puiHeight : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_size.call(this, puiWidth, puiHeight)
    end
    def get_pixel_format(this : IWICFormatConverter*, pPixelFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pixel_format.call(this, pPixelFormat)
    end
    def get_resolution(this : IWICFormatConverter*, pDpiX : Float64*, pDpiY : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_resolution.call(this, pDpiX, pDpiY)
    end
    def copy_palette(this : IWICFormatConverter*, pIPalette : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_palette.call(this, pIPalette)
    end
    def copy_pixels(this : IWICFormatConverter*, prc : Win32cr::Graphics::Imaging::WICRect*, cbStride : UInt32, cbBufferSize : UInt32, pbBuffer : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_pixels.call(this, prc, cbStride, cbBufferSize, pbBuffer)
    end
    def initialize__(this : IWICFormatConverter*, pISource : Void*, dstFormat : LibC::GUID*, dither : Win32cr::Graphics::Imaging::WICBitmapDitherType, pIPalette : Void*, alphaThresholdPercent : Float64, paletteTranslate : Win32cr::Graphics::Imaging::WICBitmapPaletteType) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pISource, dstFormat, dither, pIPalette, alphaThresholdPercent, paletteTranslate)
    end
    def can_convert(this : IWICFormatConverter*, srcPixelFormat : LibC::GUID*, dstPixelFormat : LibC::GUID*, pfCanConvert : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.can_convert.call(this, srcPixelFormat, dstPixelFormat, pfCanConvert)
    end

  end

  @[Extern]
  record IWICPlanarFormatConverterVtbl,
    query_interface : Proc(IWICPlanarFormatConverter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICPlanarFormatConverter*, UInt32),
    release : Proc(IWICPlanarFormatConverter*, UInt32),
    get_size : Proc(IWICPlanarFormatConverter*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_pixel_format : Proc(IWICPlanarFormatConverter*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_resolution : Proc(IWICPlanarFormatConverter*, Float64*, Float64*, Win32cr::Foundation::HRESULT),
    copy_palette : Proc(IWICPlanarFormatConverter*, Void*, Win32cr::Foundation::HRESULT),
    copy_pixels : Proc(IWICPlanarFormatConverter*, Win32cr::Graphics::Imaging::WICRect*, UInt32, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    initialize__ : Proc(IWICPlanarFormatConverter*, Void**, UInt32, LibC::GUID*, Win32cr::Graphics::Imaging::WICBitmapDitherType, Void*, Float64, Win32cr::Graphics::Imaging::WICBitmapPaletteType, Win32cr::Foundation::HRESULT),
    can_convert : Proc(IWICPlanarFormatConverter*, LibC::GUID*, UInt32, LibC::GUID*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICPlanarFormatConverter, lpVtbl : IWICPlanarFormatConverterVtbl* do
    GUID = LibC::GUID.new(0xbebee9cb_u32, 0x83b0_u16, 0x4dcc_u16, StaticArray[0x81_u8, 0x32_u8, 0xb0_u8, 0xaa_u8, 0xa5_u8, 0x5e_u8, 0xac_u8, 0x96_u8])
    def query_interface(this : IWICPlanarFormatConverter*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICPlanarFormatConverter*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICPlanarFormatConverter*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_size(this : IWICPlanarFormatConverter*, puiWidth : UInt32*, puiHeight : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_size.call(this, puiWidth, puiHeight)
    end
    def get_pixel_format(this : IWICPlanarFormatConverter*, pPixelFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pixel_format.call(this, pPixelFormat)
    end
    def get_resolution(this : IWICPlanarFormatConverter*, pDpiX : Float64*, pDpiY : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_resolution.call(this, pDpiX, pDpiY)
    end
    def copy_palette(this : IWICPlanarFormatConverter*, pIPalette : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_palette.call(this, pIPalette)
    end
    def copy_pixels(this : IWICPlanarFormatConverter*, prc : Win32cr::Graphics::Imaging::WICRect*, cbStride : UInt32, cbBufferSize : UInt32, pbBuffer : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_pixels.call(this, prc, cbStride, cbBufferSize, pbBuffer)
    end
    def initialize__(this : IWICPlanarFormatConverter*, ppPlanes : Void**, cPlanes : UInt32, dstFormat : LibC::GUID*, dither : Win32cr::Graphics::Imaging::WICBitmapDitherType, pIPalette : Void*, alphaThresholdPercent : Float64, paletteTranslate : Win32cr::Graphics::Imaging::WICBitmapPaletteType) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, ppPlanes, cPlanes, dstFormat, dither, pIPalette, alphaThresholdPercent, paletteTranslate)
    end
    def can_convert(this : IWICPlanarFormatConverter*, pSrcPixelFormats : LibC::GUID*, cSrcPlanes : UInt32, dstPixelFormat : LibC::GUID*, pfCanConvert : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.can_convert.call(this, pSrcPixelFormats, cSrcPlanes, dstPixelFormat, pfCanConvert)
    end

  end

  @[Extern]
  record IWICBitmapScalerVtbl,
    query_interface : Proc(IWICBitmapScaler*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICBitmapScaler*, UInt32),
    release : Proc(IWICBitmapScaler*, UInt32),
    get_size : Proc(IWICBitmapScaler*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_pixel_format : Proc(IWICBitmapScaler*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_resolution : Proc(IWICBitmapScaler*, Float64*, Float64*, Win32cr::Foundation::HRESULT),
    copy_palette : Proc(IWICBitmapScaler*, Void*, Win32cr::Foundation::HRESULT),
    copy_pixels : Proc(IWICBitmapScaler*, Win32cr::Graphics::Imaging::WICRect*, UInt32, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    initialize__ : Proc(IWICBitmapScaler*, Void*, UInt32, UInt32, Win32cr::Graphics::Imaging::WICBitmapInterpolationMode, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICBitmapScaler, lpVtbl : IWICBitmapScalerVtbl* do
    GUID = LibC::GUID.new(0x302_u32, 0xa8f2_u16, 0x4877_u16, StaticArray[0xba_u8, 0xa_u8, 0xfd_u8, 0x2b_u8, 0x66_u8, 0x45_u8, 0xfb_u8, 0x94_u8])
    def query_interface(this : IWICBitmapScaler*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICBitmapScaler*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICBitmapScaler*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_size(this : IWICBitmapScaler*, puiWidth : UInt32*, puiHeight : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_size.call(this, puiWidth, puiHeight)
    end
    def get_pixel_format(this : IWICBitmapScaler*, pPixelFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pixel_format.call(this, pPixelFormat)
    end
    def get_resolution(this : IWICBitmapScaler*, pDpiX : Float64*, pDpiY : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_resolution.call(this, pDpiX, pDpiY)
    end
    def copy_palette(this : IWICBitmapScaler*, pIPalette : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_palette.call(this, pIPalette)
    end
    def copy_pixels(this : IWICBitmapScaler*, prc : Win32cr::Graphics::Imaging::WICRect*, cbStride : UInt32, cbBufferSize : UInt32, pbBuffer : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_pixels.call(this, prc, cbStride, cbBufferSize, pbBuffer)
    end
    def initialize__(this : IWICBitmapScaler*, pISource : Void*, uiWidth : UInt32, uiHeight : UInt32, mode : Win32cr::Graphics::Imaging::WICBitmapInterpolationMode) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pISource, uiWidth, uiHeight, mode)
    end

  end

  @[Extern]
  record IWICBitmapClipperVtbl,
    query_interface : Proc(IWICBitmapClipper*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICBitmapClipper*, UInt32),
    release : Proc(IWICBitmapClipper*, UInt32),
    get_size : Proc(IWICBitmapClipper*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_pixel_format : Proc(IWICBitmapClipper*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_resolution : Proc(IWICBitmapClipper*, Float64*, Float64*, Win32cr::Foundation::HRESULT),
    copy_palette : Proc(IWICBitmapClipper*, Void*, Win32cr::Foundation::HRESULT),
    copy_pixels : Proc(IWICBitmapClipper*, Win32cr::Graphics::Imaging::WICRect*, UInt32, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    initialize__ : Proc(IWICBitmapClipper*, Void*, Win32cr::Graphics::Imaging::WICRect*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICBitmapClipper, lpVtbl : IWICBitmapClipperVtbl* do
    GUID = LibC::GUID.new(0xe4fbcf03_u32, 0x223d_u16, 0x4e81_u16, StaticArray[0x93_u8, 0x33_u8, 0xd6_u8, 0x35_u8, 0x55_u8, 0x6d_u8, 0xd1_u8, 0xb5_u8])
    def query_interface(this : IWICBitmapClipper*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICBitmapClipper*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICBitmapClipper*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_size(this : IWICBitmapClipper*, puiWidth : UInt32*, puiHeight : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_size.call(this, puiWidth, puiHeight)
    end
    def get_pixel_format(this : IWICBitmapClipper*, pPixelFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pixel_format.call(this, pPixelFormat)
    end
    def get_resolution(this : IWICBitmapClipper*, pDpiX : Float64*, pDpiY : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_resolution.call(this, pDpiX, pDpiY)
    end
    def copy_palette(this : IWICBitmapClipper*, pIPalette : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_palette.call(this, pIPalette)
    end
    def copy_pixels(this : IWICBitmapClipper*, prc : Win32cr::Graphics::Imaging::WICRect*, cbStride : UInt32, cbBufferSize : UInt32, pbBuffer : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_pixels.call(this, prc, cbStride, cbBufferSize, pbBuffer)
    end
    def initialize__(this : IWICBitmapClipper*, pISource : Void*, prc : Win32cr::Graphics::Imaging::WICRect*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pISource, prc)
    end

  end

  @[Extern]
  record IWICBitmapFlipRotatorVtbl,
    query_interface : Proc(IWICBitmapFlipRotator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICBitmapFlipRotator*, UInt32),
    release : Proc(IWICBitmapFlipRotator*, UInt32),
    get_size : Proc(IWICBitmapFlipRotator*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_pixel_format : Proc(IWICBitmapFlipRotator*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_resolution : Proc(IWICBitmapFlipRotator*, Float64*, Float64*, Win32cr::Foundation::HRESULT),
    copy_palette : Proc(IWICBitmapFlipRotator*, Void*, Win32cr::Foundation::HRESULT),
    copy_pixels : Proc(IWICBitmapFlipRotator*, Win32cr::Graphics::Imaging::WICRect*, UInt32, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    initialize__ : Proc(IWICBitmapFlipRotator*, Void*, Win32cr::Graphics::Imaging::WICBitmapTransformOptions, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICBitmapFlipRotator, lpVtbl : IWICBitmapFlipRotatorVtbl* do
    GUID = LibC::GUID.new(0x5009834f_u32, 0x2d6a_u16, 0x41ce_u16, StaticArray[0x9e_u8, 0x1b_u8, 0x17_u8, 0xc5_u8, 0xaf_u8, 0xf7_u8, 0xa7_u8, 0x82_u8])
    def query_interface(this : IWICBitmapFlipRotator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICBitmapFlipRotator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICBitmapFlipRotator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_size(this : IWICBitmapFlipRotator*, puiWidth : UInt32*, puiHeight : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_size.call(this, puiWidth, puiHeight)
    end
    def get_pixel_format(this : IWICBitmapFlipRotator*, pPixelFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pixel_format.call(this, pPixelFormat)
    end
    def get_resolution(this : IWICBitmapFlipRotator*, pDpiX : Float64*, pDpiY : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_resolution.call(this, pDpiX, pDpiY)
    end
    def copy_palette(this : IWICBitmapFlipRotator*, pIPalette : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_palette.call(this, pIPalette)
    end
    def copy_pixels(this : IWICBitmapFlipRotator*, prc : Win32cr::Graphics::Imaging::WICRect*, cbStride : UInt32, cbBufferSize : UInt32, pbBuffer : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_pixels.call(this, prc, cbStride, cbBufferSize, pbBuffer)
    end
    def initialize__(this : IWICBitmapFlipRotator*, pISource : Void*, options : Win32cr::Graphics::Imaging::WICBitmapTransformOptions) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pISource, options)
    end

  end

  @[Extern]
  record IWICBitmapLockVtbl,
    query_interface : Proc(IWICBitmapLock*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICBitmapLock*, UInt32),
    release : Proc(IWICBitmapLock*, UInt32),
    get_size : Proc(IWICBitmapLock*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_stride : Proc(IWICBitmapLock*, UInt32*, Win32cr::Foundation::HRESULT),
    get_data_pointer : Proc(IWICBitmapLock*, UInt32*, UInt8**, Win32cr::Foundation::HRESULT),
    get_pixel_format : Proc(IWICBitmapLock*, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICBitmapLock, lpVtbl : IWICBitmapLockVtbl* do
    GUID = LibC::GUID.new(0x123_u32, 0xa8f2_u16, 0x4877_u16, StaticArray[0xba_u8, 0xa_u8, 0xfd_u8, 0x2b_u8, 0x66_u8, 0x45_u8, 0xfb_u8, 0x94_u8])
    def query_interface(this : IWICBitmapLock*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICBitmapLock*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICBitmapLock*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_size(this : IWICBitmapLock*, puiWidth : UInt32*, puiHeight : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_size.call(this, puiWidth, puiHeight)
    end
    def get_stride(this : IWICBitmapLock*, pcbStride : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stride.call(this, pcbStride)
    end
    def get_data_pointer(this : IWICBitmapLock*, pcbBufferSize : UInt32*, ppbData : UInt8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_data_pointer.call(this, pcbBufferSize, ppbData)
    end
    def get_pixel_format(this : IWICBitmapLock*, pPixelFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pixel_format.call(this, pPixelFormat)
    end

  end

  @[Extern]
  record IWICBitmapVtbl,
    query_interface : Proc(IWICBitmap*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICBitmap*, UInt32),
    release : Proc(IWICBitmap*, UInt32),
    get_size : Proc(IWICBitmap*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_pixel_format : Proc(IWICBitmap*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_resolution : Proc(IWICBitmap*, Float64*, Float64*, Win32cr::Foundation::HRESULT),
    copy_palette : Proc(IWICBitmap*, Void*, Win32cr::Foundation::HRESULT),
    copy_pixels : Proc(IWICBitmap*, Win32cr::Graphics::Imaging::WICRect*, UInt32, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    lock : Proc(IWICBitmap*, Win32cr::Graphics::Imaging::WICRect*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    set_palette : Proc(IWICBitmap*, Void*, Win32cr::Foundation::HRESULT),
    set_resolution : Proc(IWICBitmap*, Float64, Float64, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICBitmap, lpVtbl : IWICBitmapVtbl* do
    GUID = LibC::GUID.new(0x121_u32, 0xa8f2_u16, 0x4877_u16, StaticArray[0xba_u8, 0xa_u8, 0xfd_u8, 0x2b_u8, 0x66_u8, 0x45_u8, 0xfb_u8, 0x94_u8])
    def query_interface(this : IWICBitmap*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICBitmap*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICBitmap*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_size(this : IWICBitmap*, puiWidth : UInt32*, puiHeight : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_size.call(this, puiWidth, puiHeight)
    end
    def get_pixel_format(this : IWICBitmap*, pPixelFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pixel_format.call(this, pPixelFormat)
    end
    def get_resolution(this : IWICBitmap*, pDpiX : Float64*, pDpiY : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_resolution.call(this, pDpiX, pDpiY)
    end
    def copy_palette(this : IWICBitmap*, pIPalette : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_palette.call(this, pIPalette)
    end
    def copy_pixels(this : IWICBitmap*, prc : Win32cr::Graphics::Imaging::WICRect*, cbStride : UInt32, cbBufferSize : UInt32, pbBuffer : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_pixels.call(this, prc, cbStride, cbBufferSize, pbBuffer)
    end
    def lock(this : IWICBitmap*, prcLock : Win32cr::Graphics::Imaging::WICRect*, flags : UInt32, ppILock : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lock.call(this, prcLock, flags, ppILock)
    end
    def set_palette(this : IWICBitmap*, pIPalette : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_palette.call(this, pIPalette)
    end
    def set_resolution(this : IWICBitmap*, dpiX : Float64, dpiY : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_resolution.call(this, dpiX, dpiY)
    end

  end

  @[Extern]
  record IWICColorContextVtbl,
    query_interface : Proc(IWICColorContext*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICColorContext*, UInt32),
    release : Proc(IWICColorContext*, UInt32),
    initialize_from_filename : Proc(IWICColorContext*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    initialize_from_memory : Proc(IWICColorContext*, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    initialize_from_exif_color_space : Proc(IWICColorContext*, UInt32, Win32cr::Foundation::HRESULT),
    get_type : Proc(IWICColorContext*, Win32cr::Graphics::Imaging::WICColorContextType*, Win32cr::Foundation::HRESULT),
    get_profile_bytes : Proc(IWICColorContext*, UInt32, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    get_exif_color_space : Proc(IWICColorContext*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICColorContext, lpVtbl : IWICColorContextVtbl* do
    GUID = LibC::GUID.new(0x3c613a02_u32, 0x34b2_u16, 0x44ea_u16, StaticArray[0x9a_u8, 0x7c_u8, 0x45_u8, 0xae_u8, 0xa9_u8, 0xc6_u8, 0xfd_u8, 0x6d_u8])
    def query_interface(this : IWICColorContext*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICColorContext*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICColorContext*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize_from_filename(this : IWICColorContext*, wzFilename : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_from_filename.call(this, wzFilename)
    end
    def initialize_from_memory(this : IWICColorContext*, pbBuffer : UInt8*, cbBufferSize : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_from_memory.call(this, pbBuffer, cbBufferSize)
    end
    def initialize_from_exif_color_space(this : IWICColorContext*, value : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_from_exif_color_space.call(this, value)
    end
    def get_type(this : IWICColorContext*, pType : Win32cr::Graphics::Imaging::WICColorContextType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, pType)
    end
    def get_profile_bytes(this : IWICColorContext*, cbBuffer : UInt32, pbBuffer : UInt8*, pcbActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_profile_bytes.call(this, cbBuffer, pbBuffer, pcbActual)
    end
    def get_exif_color_space(this : IWICColorContext*, pValue : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_exif_color_space.call(this, pValue)
    end

  end

  @[Extern]
  record IWICColorTransformVtbl,
    query_interface : Proc(IWICColorTransform*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICColorTransform*, UInt32),
    release : Proc(IWICColorTransform*, UInt32),
    get_size : Proc(IWICColorTransform*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_pixel_format : Proc(IWICColorTransform*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_resolution : Proc(IWICColorTransform*, Float64*, Float64*, Win32cr::Foundation::HRESULT),
    copy_palette : Proc(IWICColorTransform*, Void*, Win32cr::Foundation::HRESULT),
    copy_pixels : Proc(IWICColorTransform*, Win32cr::Graphics::Imaging::WICRect*, UInt32, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    initialize__ : Proc(IWICColorTransform*, Void*, Void*, Void*, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICColorTransform, lpVtbl : IWICColorTransformVtbl* do
    GUID = LibC::GUID.new(0xb66f034f_u32, 0xd0e2_u16, 0x40ab_u16, StaticArray[0xb4_u8, 0x36_u8, 0x6d_u8, 0xe3_u8, 0x9e_u8, 0x32_u8, 0x1a_u8, 0x94_u8])
    def query_interface(this : IWICColorTransform*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICColorTransform*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICColorTransform*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_size(this : IWICColorTransform*, puiWidth : UInt32*, puiHeight : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_size.call(this, puiWidth, puiHeight)
    end
    def get_pixel_format(this : IWICColorTransform*, pPixelFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pixel_format.call(this, pPixelFormat)
    end
    def get_resolution(this : IWICColorTransform*, pDpiX : Float64*, pDpiY : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_resolution.call(this, pDpiX, pDpiY)
    end
    def copy_palette(this : IWICColorTransform*, pIPalette : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_palette.call(this, pIPalette)
    end
    def copy_pixels(this : IWICColorTransform*, prc : Win32cr::Graphics::Imaging::WICRect*, cbStride : UInt32, cbBufferSize : UInt32, pbBuffer : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_pixels.call(this, prc, cbStride, cbBufferSize, pbBuffer)
    end
    def initialize__(this : IWICColorTransform*, pIBitmapSource : Void*, pIContextSource : Void*, pIContextDest : Void*, pixelFmtDest : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pIBitmapSource, pIContextSource, pIContextDest, pixelFmtDest)
    end

  end

  @[Extern]
  record IWICFastMetadataEncoderVtbl,
    query_interface : Proc(IWICFastMetadataEncoder*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICFastMetadataEncoder*, UInt32),
    release : Proc(IWICFastMetadataEncoder*, UInt32),
    commit : Proc(IWICFastMetadataEncoder*, Win32cr::Foundation::HRESULT),
    get_metadata_query_writer : Proc(IWICFastMetadataEncoder*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICFastMetadataEncoder, lpVtbl : IWICFastMetadataEncoderVtbl* do
    GUID = LibC::GUID.new(0xb84e2c09_u32, 0x78c9_u16, 0x4ac4_u16, StaticArray[0x8b_u8, 0xd3_u8, 0x52_u8, 0x4a_u8, 0xe1_u8, 0x66_u8, 0x3a_u8, 0x2f_u8])
    def query_interface(this : IWICFastMetadataEncoder*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICFastMetadataEncoder*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICFastMetadataEncoder*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def commit(this : IWICFastMetadataEncoder*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end
    def get_metadata_query_writer(this : IWICFastMetadataEncoder*, ppIMetadataQueryWriter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_metadata_query_writer.call(this, ppIMetadataQueryWriter)
    end

  end

  @[Extern]
  record IWICStreamVtbl,
    query_interface : Proc(IWICStream*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICStream*, UInt32),
    release : Proc(IWICStream*, UInt32),
    read : Proc(IWICStream*, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    write : Proc(IWICStream*, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    seek : Proc(IWICStream*, Win32cr::Foundation::LARGE_INTEGER, Win32cr::System::Com::STREAM_SEEK, Win32cr::Foundation::ULARGE_INTEGER*, Win32cr::Foundation::HRESULT),
    set_size : Proc(IWICStream*, Win32cr::Foundation::ULARGE_INTEGER, Win32cr::Foundation::HRESULT),
    copy_to : Proc(IWICStream*, Void*, Win32cr::Foundation::ULARGE_INTEGER, Win32cr::Foundation::ULARGE_INTEGER*, Win32cr::Foundation::ULARGE_INTEGER*, Win32cr::Foundation::HRESULT),
    commit : Proc(IWICStream*, Win32cr::System::Com::STGC, Win32cr::Foundation::HRESULT),
    revert : Proc(IWICStream*, Win32cr::Foundation::HRESULT),
    lock_region : Proc(IWICStream*, Win32cr::Foundation::ULARGE_INTEGER, Win32cr::Foundation::ULARGE_INTEGER, UInt32, Win32cr::Foundation::HRESULT),
    unlock_region : Proc(IWICStream*, Win32cr::Foundation::ULARGE_INTEGER, Win32cr::Foundation::ULARGE_INTEGER, UInt32, Win32cr::Foundation::HRESULT),
    stat : Proc(IWICStream*, Win32cr::System::Com::STATSTG*, UInt32, Win32cr::Foundation::HRESULT),
    clone : Proc(IWICStream*, Void**, Win32cr::Foundation::HRESULT),
    initialize_from_i_stream : Proc(IWICStream*, Void*, Win32cr::Foundation::HRESULT),
    initialize_from_filename : Proc(IWICStream*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    initialize_from_memory : Proc(IWICStream*, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    initialize_from_i_stream_region : Proc(IWICStream*, Void*, Win32cr::Foundation::ULARGE_INTEGER, Win32cr::Foundation::ULARGE_INTEGER, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICStream, lpVtbl : IWICStreamVtbl* do
    GUID = LibC::GUID.new(0x135ff860_u32, 0x22b7_u16, 0x4ddf_u16, StaticArray[0xb0_u8, 0xf6_u8, 0x21_u8, 0x8f_u8, 0x4f_u8, 0x29_u8, 0x9a_u8, 0x43_u8])
    def query_interface(this : IWICStream*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICStream*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICStream*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def read(this : IWICStream*, pv : Void*, cb : UInt32, pcbRead : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read.call(this, pv, cb, pcbRead)
    end
    def write(this : IWICStream*, pv : Void*, cb : UInt32, pcbWritten : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write.call(this, pv, cb, pcbWritten)
    end
    def seek(this : IWICStream*, dlibMove : Win32cr::Foundation::LARGE_INTEGER, dwOrigin : Win32cr::System::Com::STREAM_SEEK, plibNewPosition : Win32cr::Foundation::ULARGE_INTEGER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.seek.call(this, dlibMove, dwOrigin, plibNewPosition)
    end
    def set_size(this : IWICStream*, libNewSize : Win32cr::Foundation::ULARGE_INTEGER) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_size.call(this, libNewSize)
    end
    def copy_to(this : IWICStream*, pstm : Void*, cb : Win32cr::Foundation::ULARGE_INTEGER, pcbRead : Win32cr::Foundation::ULARGE_INTEGER*, pcbWritten : Win32cr::Foundation::ULARGE_INTEGER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_to.call(this, pstm, cb, pcbRead, pcbWritten)
    end
    def commit(this : IWICStream*, grfCommitFlags : Win32cr::System::Com::STGC) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this, grfCommitFlags)
    end
    def revert(this : IWICStream*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.revert.call(this)
    end
    def lock_region(this : IWICStream*, libOffset : Win32cr::Foundation::ULARGE_INTEGER, cb : Win32cr::Foundation::ULARGE_INTEGER, dwLockType : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lock_region.call(this, libOffset, cb, dwLockType)
    end
    def unlock_region(this : IWICStream*, libOffset : Win32cr::Foundation::ULARGE_INTEGER, cb : Win32cr::Foundation::ULARGE_INTEGER, dwLockType : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unlock_region.call(this, libOffset, cb, dwLockType)
    end
    def stat(this : IWICStream*, pstatstg : Win32cr::System::Com::STATSTG*, grfStatFlag : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stat.call(this, pstatstg, grfStatFlag)
    end
    def clone(this : IWICStream*, ppstm : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppstm)
    end
    def initialize_from_i_stream(this : IWICStream*, pIStream : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_from_i_stream.call(this, pIStream)
    end
    def initialize_from_filename(this : IWICStream*, wzFileName : Win32cr::Foundation::PWSTR, dwDesiredAccess : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_from_filename.call(this, wzFileName, dwDesiredAccess)
    end
    def initialize_from_memory(this : IWICStream*, pbBuffer : UInt8*, cbBufferSize : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_from_memory.call(this, pbBuffer, cbBufferSize)
    end
    def initialize_from_i_stream_region(this : IWICStream*, pIStream : Void*, ulOffset : Win32cr::Foundation::ULARGE_INTEGER, ulMaxSize : Win32cr::Foundation::ULARGE_INTEGER) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_from_i_stream_region.call(this, pIStream, ulOffset, ulMaxSize)
    end

  end

  @[Extern]
  record IWICEnumMetadataItemVtbl,
    query_interface : Proc(IWICEnumMetadataItem*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICEnumMetadataItem*, UInt32),
    release : Proc(IWICEnumMetadataItem*, UInt32),
    next__ : Proc(IWICEnumMetadataItem*, UInt32, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IWICEnumMetadataItem*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IWICEnumMetadataItem*, Win32cr::Foundation::HRESULT),
    clone : Proc(IWICEnumMetadataItem*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICEnumMetadataItem, lpVtbl : IWICEnumMetadataItemVtbl* do
    GUID = LibC::GUID.new(0xdc2bb46d_u32, 0x3f07_u16, 0x481e_u16, StaticArray[0x86_u8, 0x25_u8, 0x22_u8, 0xc_u8, 0x4a_u8, 0xed_u8, 0xbb_u8, 0x33_u8])
    def query_interface(this : IWICEnumMetadataItem*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICEnumMetadataItem*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICEnumMetadataItem*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IWICEnumMetadataItem*, celt : UInt32, rgeltSchema : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, rgeltId : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, rgeltValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, rgeltSchema, rgeltId, rgeltValue, pceltFetched)
    end
    def skip(this : IWICEnumMetadataItem*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : IWICEnumMetadataItem*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IWICEnumMetadataItem*, ppIEnumMetadataItem : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppIEnumMetadataItem)
    end

  end

  @[Extern]
  record IWICMetadataQueryReaderVtbl,
    query_interface : Proc(IWICMetadataQueryReader*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICMetadataQueryReader*, UInt32),
    release : Proc(IWICMetadataQueryReader*, UInt32),
    get_container_format : Proc(IWICMetadataQueryReader*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_location : Proc(IWICMetadataQueryReader*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_metadata_by_name : Proc(IWICMetadataQueryReader*, Win32cr::Foundation::PWSTR, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    get_enumerator : Proc(IWICMetadataQueryReader*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICMetadataQueryReader, lpVtbl : IWICMetadataQueryReaderVtbl* do
    GUID = LibC::GUID.new(0x30989668_u32, 0xe1c9_u16, 0x4597_u16, StaticArray[0xb3_u8, 0x95_u8, 0x45_u8, 0x8e_u8, 0xed_u8, 0xb8_u8, 0x8_u8, 0xdf_u8])
    def query_interface(this : IWICMetadataQueryReader*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICMetadataQueryReader*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICMetadataQueryReader*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_container_format(this : IWICMetadataQueryReader*, pguidContainerFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_container_format.call(this, pguidContainerFormat)
    end
    def get_location(this : IWICMetadataQueryReader*, cchMaxLength : UInt32, wzNamespace : UInt16*, pcchActualLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_location.call(this, cchMaxLength, wzNamespace, pcchActualLength)
    end
    def get_metadata_by_name(this : IWICMetadataQueryReader*, wzName : Win32cr::Foundation::PWSTR, pvarValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_metadata_by_name.call(this, wzName, pvarValue)
    end
    def get_enumerator(this : IWICMetadataQueryReader*, ppIEnumString : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enumerator.call(this, ppIEnumString)
    end

  end

  @[Extern]
  record IWICMetadataQueryWriterVtbl,
    query_interface : Proc(IWICMetadataQueryWriter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICMetadataQueryWriter*, UInt32),
    release : Proc(IWICMetadataQueryWriter*, UInt32),
    get_container_format : Proc(IWICMetadataQueryWriter*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_location : Proc(IWICMetadataQueryWriter*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_metadata_by_name : Proc(IWICMetadataQueryWriter*, Win32cr::Foundation::PWSTR, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    get_enumerator : Proc(IWICMetadataQueryWriter*, Void**, Win32cr::Foundation::HRESULT),
    set_metadata_by_name : Proc(IWICMetadataQueryWriter*, Win32cr::Foundation::PWSTR, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    remove_metadata_by_name : Proc(IWICMetadataQueryWriter*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICMetadataQueryWriter, lpVtbl : IWICMetadataQueryWriterVtbl* do
    GUID = LibC::GUID.new(0xa721791a_u32, 0xdef_u16, 0x4d06_u16, StaticArray[0xbd_u8, 0x91_u8, 0x21_u8, 0x18_u8, 0xbf_u8, 0x1d_u8, 0xb1_u8, 0xb_u8])
    def query_interface(this : IWICMetadataQueryWriter*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICMetadataQueryWriter*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICMetadataQueryWriter*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_container_format(this : IWICMetadataQueryWriter*, pguidContainerFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_container_format.call(this, pguidContainerFormat)
    end
    def get_location(this : IWICMetadataQueryWriter*, cchMaxLength : UInt32, wzNamespace : UInt16*, pcchActualLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_location.call(this, cchMaxLength, wzNamespace, pcchActualLength)
    end
    def get_metadata_by_name(this : IWICMetadataQueryWriter*, wzName : Win32cr::Foundation::PWSTR, pvarValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_metadata_by_name.call(this, wzName, pvarValue)
    end
    def get_enumerator(this : IWICMetadataQueryWriter*, ppIEnumString : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enumerator.call(this, ppIEnumString)
    end
    def set_metadata_by_name(this : IWICMetadataQueryWriter*, wzName : Win32cr::Foundation::PWSTR, pvarValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_metadata_by_name.call(this, wzName, pvarValue)
    end
    def remove_metadata_by_name(this : IWICMetadataQueryWriter*, wzName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_metadata_by_name.call(this, wzName)
    end

  end

  @[Extern]
  record IWICBitmapEncoderVtbl,
    query_interface : Proc(IWICBitmapEncoder*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICBitmapEncoder*, UInt32),
    release : Proc(IWICBitmapEncoder*, UInt32),
    initialize__ : Proc(IWICBitmapEncoder*, Void*, Win32cr::Graphics::Imaging::WICBitmapEncoderCacheOption, Win32cr::Foundation::HRESULT),
    get_container_format : Proc(IWICBitmapEncoder*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_encoder_info : Proc(IWICBitmapEncoder*, Void**, Win32cr::Foundation::HRESULT),
    set_color_contexts : Proc(IWICBitmapEncoder*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    set_palette : Proc(IWICBitmapEncoder*, Void*, Win32cr::Foundation::HRESULT),
    set_thumbnail : Proc(IWICBitmapEncoder*, Void*, Win32cr::Foundation::HRESULT),
    set_preview : Proc(IWICBitmapEncoder*, Void*, Win32cr::Foundation::HRESULT),
    create_new_frame : Proc(IWICBitmapEncoder*, Void**, Void**, Win32cr::Foundation::HRESULT),
    commit : Proc(IWICBitmapEncoder*, Win32cr::Foundation::HRESULT),
    get_metadata_query_writer : Proc(IWICBitmapEncoder*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICBitmapEncoder, lpVtbl : IWICBitmapEncoderVtbl* do
    GUID = LibC::GUID.new(0x103_u32, 0xa8f2_u16, 0x4877_u16, StaticArray[0xba_u8, 0xa_u8, 0xfd_u8, 0x2b_u8, 0x66_u8, 0x45_u8, 0xfb_u8, 0x94_u8])
    def query_interface(this : IWICBitmapEncoder*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICBitmapEncoder*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICBitmapEncoder*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IWICBitmapEncoder*, pIStream : Void*, cacheOption : Win32cr::Graphics::Imaging::WICBitmapEncoderCacheOption) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pIStream, cacheOption)
    end
    def get_container_format(this : IWICBitmapEncoder*, pguidContainerFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_container_format.call(this, pguidContainerFormat)
    end
    def get_encoder_info(this : IWICBitmapEncoder*, ppIEncoderInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_encoder_info.call(this, ppIEncoderInfo)
    end
    def set_color_contexts(this : IWICBitmapEncoder*, cCount : UInt32, ppIColorContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_color_contexts.call(this, cCount, ppIColorContext)
    end
    def set_palette(this : IWICBitmapEncoder*, pIPalette : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_palette.call(this, pIPalette)
    end
    def set_thumbnail(this : IWICBitmapEncoder*, pIThumbnail : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_thumbnail.call(this, pIThumbnail)
    end
    def set_preview(this : IWICBitmapEncoder*, pIPreview : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_preview.call(this, pIPreview)
    end
    def create_new_frame(this : IWICBitmapEncoder*, ppIFrameEncode : Void**, ppIEncoderOptions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_new_frame.call(this, ppIFrameEncode, ppIEncoderOptions)
    end
    def commit(this : IWICBitmapEncoder*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end
    def get_metadata_query_writer(this : IWICBitmapEncoder*, ppIMetadataQueryWriter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_metadata_query_writer.call(this, ppIMetadataQueryWriter)
    end

  end

  @[Extern]
  record IWICBitmapFrameEncodeVtbl,
    query_interface : Proc(IWICBitmapFrameEncode*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICBitmapFrameEncode*, UInt32),
    release : Proc(IWICBitmapFrameEncode*, UInt32),
    initialize__ : Proc(IWICBitmapFrameEncode*, Void*, Win32cr::Foundation::HRESULT),
    set_size : Proc(IWICBitmapFrameEncode*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    set_resolution : Proc(IWICBitmapFrameEncode*, Float64, Float64, Win32cr::Foundation::HRESULT),
    set_pixel_format : Proc(IWICBitmapFrameEncode*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    set_color_contexts : Proc(IWICBitmapFrameEncode*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    set_palette : Proc(IWICBitmapFrameEncode*, Void*, Win32cr::Foundation::HRESULT),
    set_thumbnail : Proc(IWICBitmapFrameEncode*, Void*, Win32cr::Foundation::HRESULT),
    write_pixels : Proc(IWICBitmapFrameEncode*, UInt32, UInt32, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    write_source : Proc(IWICBitmapFrameEncode*, Void*, Win32cr::Graphics::Imaging::WICRect*, Win32cr::Foundation::HRESULT),
    commit : Proc(IWICBitmapFrameEncode*, Win32cr::Foundation::HRESULT),
    get_metadata_query_writer : Proc(IWICBitmapFrameEncode*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICBitmapFrameEncode, lpVtbl : IWICBitmapFrameEncodeVtbl* do
    GUID = LibC::GUID.new(0x105_u32, 0xa8f2_u16, 0x4877_u16, StaticArray[0xba_u8, 0xa_u8, 0xfd_u8, 0x2b_u8, 0x66_u8, 0x45_u8, 0xfb_u8, 0x94_u8])
    def query_interface(this : IWICBitmapFrameEncode*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICBitmapFrameEncode*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICBitmapFrameEncode*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IWICBitmapFrameEncode*, pIEncoderOptions : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pIEncoderOptions)
    end
    def set_size(this : IWICBitmapFrameEncode*, uiWidth : UInt32, uiHeight : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_size.call(this, uiWidth, uiHeight)
    end
    def set_resolution(this : IWICBitmapFrameEncode*, dpiX : Float64, dpiY : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_resolution.call(this, dpiX, dpiY)
    end
    def set_pixel_format(this : IWICBitmapFrameEncode*, pPixelFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_pixel_format.call(this, pPixelFormat)
    end
    def set_color_contexts(this : IWICBitmapFrameEncode*, cCount : UInt32, ppIColorContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_color_contexts.call(this, cCount, ppIColorContext)
    end
    def set_palette(this : IWICBitmapFrameEncode*, pIPalette : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_palette.call(this, pIPalette)
    end
    def set_thumbnail(this : IWICBitmapFrameEncode*, pIThumbnail : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_thumbnail.call(this, pIThumbnail)
    end
    def write_pixels(this : IWICBitmapFrameEncode*, lineCount : UInt32, cbStride : UInt32, cbBufferSize : UInt32, pbPixels : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_pixels.call(this, lineCount, cbStride, cbBufferSize, pbPixels)
    end
    def write_source(this : IWICBitmapFrameEncode*, pIBitmapSource : Void*, prc : Win32cr::Graphics::Imaging::WICRect*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_source.call(this, pIBitmapSource, prc)
    end
    def commit(this : IWICBitmapFrameEncode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end
    def get_metadata_query_writer(this : IWICBitmapFrameEncode*, ppIMetadataQueryWriter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_metadata_query_writer.call(this, ppIMetadataQueryWriter)
    end

  end

  @[Extern]
  record IWICPlanarBitmapFrameEncodeVtbl,
    query_interface : Proc(IWICPlanarBitmapFrameEncode*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICPlanarBitmapFrameEncode*, UInt32),
    release : Proc(IWICPlanarBitmapFrameEncode*, UInt32),
    write_pixels : Proc(IWICPlanarBitmapFrameEncode*, UInt32, Win32cr::Graphics::Imaging::WICBitmapPlane*, UInt32, Win32cr::Foundation::HRESULT),
    write_source : Proc(IWICPlanarBitmapFrameEncode*, Void**, UInt32, Win32cr::Graphics::Imaging::WICRect*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICPlanarBitmapFrameEncode, lpVtbl : IWICPlanarBitmapFrameEncodeVtbl* do
    GUID = LibC::GUID.new(0xf928b7b8_u32, 0x2221_u16, 0x40c1_u16, StaticArray[0xb7_u8, 0x2e_u8, 0x7e_u8, 0x82_u8, 0xf1_u8, 0x97_u8, 0x4d_u8, 0x1a_u8])
    def query_interface(this : IWICPlanarBitmapFrameEncode*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICPlanarBitmapFrameEncode*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICPlanarBitmapFrameEncode*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def write_pixels(this : IWICPlanarBitmapFrameEncode*, lineCount : UInt32, pPlanes : Win32cr::Graphics::Imaging::WICBitmapPlane*, cPlanes : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_pixels.call(this, lineCount, pPlanes, cPlanes)
    end
    def write_source(this : IWICPlanarBitmapFrameEncode*, ppPlanes : Void**, cPlanes : UInt32, prcSource : Win32cr::Graphics::Imaging::WICRect*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_source.call(this, ppPlanes, cPlanes, prcSource)
    end

  end

  @[Extern]
  record IWICBitmapDecoderVtbl,
    query_interface : Proc(IWICBitmapDecoder*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICBitmapDecoder*, UInt32),
    release : Proc(IWICBitmapDecoder*, UInt32),
    query_capability : Proc(IWICBitmapDecoder*, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    initialize__ : Proc(IWICBitmapDecoder*, Void*, Win32cr::Graphics::Imaging::WICDecodeOptions, Win32cr::Foundation::HRESULT),
    get_container_format : Proc(IWICBitmapDecoder*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_decoder_info : Proc(IWICBitmapDecoder*, Void**, Win32cr::Foundation::HRESULT),
    copy_palette : Proc(IWICBitmapDecoder*, Void*, Win32cr::Foundation::HRESULT),
    get_metadata_query_reader : Proc(IWICBitmapDecoder*, Void**, Win32cr::Foundation::HRESULT),
    get_preview : Proc(IWICBitmapDecoder*, Void**, Win32cr::Foundation::HRESULT),
    get_color_contexts : Proc(IWICBitmapDecoder*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    get_thumbnail : Proc(IWICBitmapDecoder*, Void**, Win32cr::Foundation::HRESULT),
    get_frame_count : Proc(IWICBitmapDecoder*, UInt32*, Win32cr::Foundation::HRESULT),
    get_frame : Proc(IWICBitmapDecoder*, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICBitmapDecoder, lpVtbl : IWICBitmapDecoderVtbl* do
    GUID = LibC::GUID.new(0x9edde9e7_u32, 0x8dee_u16, 0x47ea_u16, StaticArray[0x99_u8, 0xdf_u8, 0xe6_u8, 0xfa_u8, 0xf2_u8, 0xed_u8, 0x44_u8, 0xbf_u8])
    def query_interface(this : IWICBitmapDecoder*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICBitmapDecoder*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICBitmapDecoder*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def query_capability(this : IWICBitmapDecoder*, pIStream : Void*, pdwCapability : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_capability.call(this, pIStream, pdwCapability)
    end
    def initialize__(this : IWICBitmapDecoder*, pIStream : Void*, cacheOptions : Win32cr::Graphics::Imaging::WICDecodeOptions) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pIStream, cacheOptions)
    end
    def get_container_format(this : IWICBitmapDecoder*, pguidContainerFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_container_format.call(this, pguidContainerFormat)
    end
    def get_decoder_info(this : IWICBitmapDecoder*, ppIDecoderInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_decoder_info.call(this, ppIDecoderInfo)
    end
    def copy_palette(this : IWICBitmapDecoder*, pIPalette : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_palette.call(this, pIPalette)
    end
    def get_metadata_query_reader(this : IWICBitmapDecoder*, ppIMetadataQueryReader : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_metadata_query_reader.call(this, ppIMetadataQueryReader)
    end
    def get_preview(this : IWICBitmapDecoder*, ppIBitmapSource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_preview.call(this, ppIBitmapSource)
    end
    def get_color_contexts(this : IWICBitmapDecoder*, cCount : UInt32, ppIColorContexts : Void**, pcActualCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_color_contexts.call(this, cCount, ppIColorContexts, pcActualCount)
    end
    def get_thumbnail(this : IWICBitmapDecoder*, ppIThumbnail : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thumbnail.call(this, ppIThumbnail)
    end
    def get_frame_count(this : IWICBitmapDecoder*, pCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_frame_count.call(this, pCount)
    end
    def get_frame(this : IWICBitmapDecoder*, index : UInt32, ppIBitmapFrame : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_frame.call(this, index, ppIBitmapFrame)
    end

  end

  @[Extern]
  record IWICBitmapSourceTransformVtbl,
    query_interface : Proc(IWICBitmapSourceTransform*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICBitmapSourceTransform*, UInt32),
    release : Proc(IWICBitmapSourceTransform*, UInt32),
    copy_pixels : Proc(IWICBitmapSourceTransform*, Win32cr::Graphics::Imaging::WICRect*, UInt32, UInt32, LibC::GUID*, Win32cr::Graphics::Imaging::WICBitmapTransformOptions, UInt32, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    get_closest_size : Proc(IWICBitmapSourceTransform*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_closest_pixel_format : Proc(IWICBitmapSourceTransform*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    does_support_transform : Proc(IWICBitmapSourceTransform*, Win32cr::Graphics::Imaging::WICBitmapTransformOptions, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICBitmapSourceTransform, lpVtbl : IWICBitmapSourceTransformVtbl* do
    GUID = LibC::GUID.new(0x3b16811b_u32, 0x6a43_u16, 0x4ec9_u16, StaticArray[0xb7_u8, 0x13_u8, 0x3d_u8, 0x5a_u8, 0xc_u8, 0x13_u8, 0xb9_u8, 0x40_u8])
    def query_interface(this : IWICBitmapSourceTransform*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICBitmapSourceTransform*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICBitmapSourceTransform*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def copy_pixels(this : IWICBitmapSourceTransform*, prc : Win32cr::Graphics::Imaging::WICRect*, uiWidth : UInt32, uiHeight : UInt32, pguidDstFormat : LibC::GUID*, dstTransform : Win32cr::Graphics::Imaging::WICBitmapTransformOptions, nStride : UInt32, cbBufferSize : UInt32, pbBuffer : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_pixels.call(this, prc, uiWidth, uiHeight, pguidDstFormat, dstTransform, nStride, cbBufferSize, pbBuffer)
    end
    def get_closest_size(this : IWICBitmapSourceTransform*, puiWidth : UInt32*, puiHeight : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_closest_size.call(this, puiWidth, puiHeight)
    end
    def get_closest_pixel_format(this : IWICBitmapSourceTransform*, pguidDstFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_closest_pixel_format.call(this, pguidDstFormat)
    end
    def does_support_transform(this : IWICBitmapSourceTransform*, dstTransform : Win32cr::Graphics::Imaging::WICBitmapTransformOptions, pfIsSupported : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.does_support_transform.call(this, dstTransform, pfIsSupported)
    end

  end

  @[Extern]
  record IWICPlanarBitmapSourceTransformVtbl,
    query_interface : Proc(IWICPlanarBitmapSourceTransform*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICPlanarBitmapSourceTransform*, UInt32),
    release : Proc(IWICPlanarBitmapSourceTransform*, UInt32),
    does_support_transform : Proc(IWICPlanarBitmapSourceTransform*, UInt32*, UInt32*, Win32cr::Graphics::Imaging::WICBitmapTransformOptions, Win32cr::Graphics::Imaging::WICPlanarOptions, LibC::GUID*, Win32cr::Graphics::Imaging::WICBitmapPlaneDescription*, UInt32, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    copy_pixels : Proc(IWICPlanarBitmapSourceTransform*, Win32cr::Graphics::Imaging::WICRect*, UInt32, UInt32, Win32cr::Graphics::Imaging::WICBitmapTransformOptions, Win32cr::Graphics::Imaging::WICPlanarOptions, Win32cr::Graphics::Imaging::WICBitmapPlane*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICPlanarBitmapSourceTransform, lpVtbl : IWICPlanarBitmapSourceTransformVtbl* do
    GUID = LibC::GUID.new(0x3aff9cce_u32, 0xbe95_u16, 0x4303_u16, StaticArray[0xb9_u8, 0x27_u8, 0xe7_u8, 0xd1_u8, 0x6f_u8, 0xf4_u8, 0xa6_u8, 0x13_u8])
    def query_interface(this : IWICPlanarBitmapSourceTransform*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICPlanarBitmapSourceTransform*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICPlanarBitmapSourceTransform*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def does_support_transform(this : IWICPlanarBitmapSourceTransform*, puiWidth : UInt32*, puiHeight : UInt32*, dstTransform : Win32cr::Graphics::Imaging::WICBitmapTransformOptions, dstPlanarOptions : Win32cr::Graphics::Imaging::WICPlanarOptions, pguidDstFormats : LibC::GUID*, pPlaneDescriptions : Win32cr::Graphics::Imaging::WICBitmapPlaneDescription*, cPlanes : UInt32, pfIsSupported : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.does_support_transform.call(this, puiWidth, puiHeight, dstTransform, dstPlanarOptions, pguidDstFormats, pPlaneDescriptions, cPlanes, pfIsSupported)
    end
    def copy_pixels(this : IWICPlanarBitmapSourceTransform*, prcSource : Win32cr::Graphics::Imaging::WICRect*, uiWidth : UInt32, uiHeight : UInt32, dstTransform : Win32cr::Graphics::Imaging::WICBitmapTransformOptions, dstPlanarOptions : Win32cr::Graphics::Imaging::WICPlanarOptions, pDstPlanes : Win32cr::Graphics::Imaging::WICBitmapPlane*, cPlanes : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_pixels.call(this, prcSource, uiWidth, uiHeight, dstTransform, dstPlanarOptions, pDstPlanes, cPlanes)
    end

  end

  @[Extern]
  record IWICBitmapFrameDecodeVtbl,
    query_interface : Proc(IWICBitmapFrameDecode*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICBitmapFrameDecode*, UInt32),
    release : Proc(IWICBitmapFrameDecode*, UInt32),
    get_size : Proc(IWICBitmapFrameDecode*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_pixel_format : Proc(IWICBitmapFrameDecode*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_resolution : Proc(IWICBitmapFrameDecode*, Float64*, Float64*, Win32cr::Foundation::HRESULT),
    copy_palette : Proc(IWICBitmapFrameDecode*, Void*, Win32cr::Foundation::HRESULT),
    copy_pixels : Proc(IWICBitmapFrameDecode*, Win32cr::Graphics::Imaging::WICRect*, UInt32, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    get_metadata_query_reader : Proc(IWICBitmapFrameDecode*, Void**, Win32cr::Foundation::HRESULT),
    get_color_contexts : Proc(IWICBitmapFrameDecode*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    get_thumbnail : Proc(IWICBitmapFrameDecode*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICBitmapFrameDecode, lpVtbl : IWICBitmapFrameDecodeVtbl* do
    GUID = LibC::GUID.new(0x3b16811b_u32, 0x6a43_u16, 0x4ec9_u16, StaticArray[0xa8_u8, 0x13_u8, 0x3d_u8, 0x93_u8, 0xc_u8, 0x13_u8, 0xb9_u8, 0x40_u8])
    def query_interface(this : IWICBitmapFrameDecode*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICBitmapFrameDecode*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICBitmapFrameDecode*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_size(this : IWICBitmapFrameDecode*, puiWidth : UInt32*, puiHeight : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_size.call(this, puiWidth, puiHeight)
    end
    def get_pixel_format(this : IWICBitmapFrameDecode*, pPixelFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pixel_format.call(this, pPixelFormat)
    end
    def get_resolution(this : IWICBitmapFrameDecode*, pDpiX : Float64*, pDpiY : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_resolution.call(this, pDpiX, pDpiY)
    end
    def copy_palette(this : IWICBitmapFrameDecode*, pIPalette : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_palette.call(this, pIPalette)
    end
    def copy_pixels(this : IWICBitmapFrameDecode*, prc : Win32cr::Graphics::Imaging::WICRect*, cbStride : UInt32, cbBufferSize : UInt32, pbBuffer : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_pixels.call(this, prc, cbStride, cbBufferSize, pbBuffer)
    end
    def get_metadata_query_reader(this : IWICBitmapFrameDecode*, ppIMetadataQueryReader : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_metadata_query_reader.call(this, ppIMetadataQueryReader)
    end
    def get_color_contexts(this : IWICBitmapFrameDecode*, cCount : UInt32, ppIColorContexts : Void**, pcActualCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_color_contexts.call(this, cCount, ppIColorContexts, pcActualCount)
    end
    def get_thumbnail(this : IWICBitmapFrameDecode*, ppIThumbnail : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thumbnail.call(this, ppIThumbnail)
    end

  end

  @[Extern]
  record IWICProgressiveLevelControlVtbl,
    query_interface : Proc(IWICProgressiveLevelControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICProgressiveLevelControl*, UInt32),
    release : Proc(IWICProgressiveLevelControl*, UInt32),
    get_level_count : Proc(IWICProgressiveLevelControl*, UInt32*, Win32cr::Foundation::HRESULT),
    get_current_level : Proc(IWICProgressiveLevelControl*, UInt32*, Win32cr::Foundation::HRESULT),
    set_current_level : Proc(IWICProgressiveLevelControl*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICProgressiveLevelControl, lpVtbl : IWICProgressiveLevelControlVtbl* do
    GUID = LibC::GUID.new(0xdaac296f_u32, 0x7aa5_u16, 0x4dbf_u16, StaticArray[0x8d_u8, 0x15_u8, 0x22_u8, 0x5c_u8, 0x59_u8, 0x76_u8, 0xf8_u8, 0x91_u8])
    def query_interface(this : IWICProgressiveLevelControl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICProgressiveLevelControl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICProgressiveLevelControl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_level_count(this : IWICProgressiveLevelControl*, pcLevels : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_level_count.call(this, pcLevels)
    end
    def get_current_level(this : IWICProgressiveLevelControl*, pnLevel : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_level.call(this, pnLevel)
    end
    def set_current_level(this : IWICProgressiveLevelControl*, nLevel : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_current_level.call(this, nLevel)
    end

  end

  @[Extern]
  record IWICProgressCallbackVtbl,
    query_interface : Proc(IWICProgressCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICProgressCallback*, UInt32),
    release : Proc(IWICProgressCallback*, UInt32),
    notify : Proc(IWICProgressCallback*, UInt32, Win32cr::Graphics::Imaging::WICProgressOperation, Float64, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICProgressCallback, lpVtbl : IWICProgressCallbackVtbl* do
    GUID = LibC::GUID.new(0x4776f9cd_u32, 0x9517_u16, 0x45fa_u16, StaticArray[0xbf_u8, 0x24_u8, 0xe8_u8, 0x9c_u8, 0x5e_u8, 0xc5_u8, 0xc6_u8, 0xc_u8])
    def query_interface(this : IWICProgressCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICProgressCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICProgressCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def notify(this : IWICProgressCallback*, uFrameNum : UInt32, operation : Win32cr::Graphics::Imaging::WICProgressOperation, dblProgress : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify.call(this, uFrameNum, operation, dblProgress)
    end

  end

  @[Extern]
  record IWICBitmapCodecProgressNotificationVtbl,
    query_interface : Proc(IWICBitmapCodecProgressNotification*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICBitmapCodecProgressNotification*, UInt32),
    release : Proc(IWICBitmapCodecProgressNotification*, UInt32),
    register_progress_notification : Proc(IWICBitmapCodecProgressNotification*, Win32cr::Graphics::Imaging::PFNProgressNotification, Void*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICBitmapCodecProgressNotification, lpVtbl : IWICBitmapCodecProgressNotificationVtbl* do
    GUID = LibC::GUID.new(0x64c1024e_u32, 0xc3cf_u16, 0x4462_u16, StaticArray[0x80_u8, 0x78_u8, 0x88_u8, 0xc2_u8, 0xb1_u8, 0x1c_u8, 0x46_u8, 0xd9_u8])
    def query_interface(this : IWICBitmapCodecProgressNotification*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICBitmapCodecProgressNotification*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICBitmapCodecProgressNotification*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def register_progress_notification(this : IWICBitmapCodecProgressNotification*, pfnProgressNotification : Win32cr::Graphics::Imaging::PFNProgressNotification, pvData : Void*, dwProgressFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_progress_notification.call(this, pfnProgressNotification, pvData, dwProgressFlags)
    end

  end

  @[Extern]
  record IWICComponentInfoVtbl,
    query_interface : Proc(IWICComponentInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICComponentInfo*, UInt32),
    release : Proc(IWICComponentInfo*, UInt32),
    get_component_type : Proc(IWICComponentInfo*, Win32cr::Graphics::Imaging::WICComponentType*, Win32cr::Foundation::HRESULT),
    get_clsid : Proc(IWICComponentInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_signing_status : Proc(IWICComponentInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_author : Proc(IWICComponentInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_vendor_guid : Proc(IWICComponentInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_version : Proc(IWICComponentInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_spec_version : Proc(IWICComponentInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_friendly_name : Proc(IWICComponentInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICComponentInfo, lpVtbl : IWICComponentInfoVtbl* do
    GUID = LibC::GUID.new(0x23bc3f0a_u32, 0x698b_u16, 0x4357_u16, StaticArray[0x88_u8, 0x6b_u8, 0xf2_u8, 0x4d_u8, 0x50_u8, 0x67_u8, 0x13_u8, 0x34_u8])
    def query_interface(this : IWICComponentInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICComponentInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICComponentInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_component_type(this : IWICComponentInfo*, pType : Win32cr::Graphics::Imaging::WICComponentType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_component_type.call(this, pType)
    end
    def get_clsid(this : IWICComponentInfo*, pclsid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clsid.call(this, pclsid)
    end
    def get_signing_status(this : IWICComponentInfo*, pStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signing_status.call(this, pStatus)
    end
    def get_author(this : IWICComponentInfo*, cchAuthor : UInt32, wzAuthor : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_author.call(this, cchAuthor, wzAuthor, pcchActual)
    end
    def get_vendor_guid(this : IWICComponentInfo*, pguidVendor : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_vendor_guid.call(this, pguidVendor)
    end
    def get_version(this : IWICComponentInfo*, cchVersion : UInt32, wzVersion : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version.call(this, cchVersion, wzVersion, pcchActual)
    end
    def get_spec_version(this : IWICComponentInfo*, cchSpecVersion : UInt32, wzSpecVersion : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_spec_version.call(this, cchSpecVersion, wzSpecVersion, pcchActual)
    end
    def get_friendly_name(this : IWICComponentInfo*, cchFriendlyName : UInt32, wzFriendlyName : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_friendly_name.call(this, cchFriendlyName, wzFriendlyName, pcchActual)
    end

  end

  @[Extern]
  record IWICFormatConverterInfoVtbl,
    query_interface : Proc(IWICFormatConverterInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICFormatConverterInfo*, UInt32),
    release : Proc(IWICFormatConverterInfo*, UInt32),
    get_component_type : Proc(IWICFormatConverterInfo*, Win32cr::Graphics::Imaging::WICComponentType*, Win32cr::Foundation::HRESULT),
    get_clsid : Proc(IWICFormatConverterInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_signing_status : Proc(IWICFormatConverterInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_author : Proc(IWICFormatConverterInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_vendor_guid : Proc(IWICFormatConverterInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_version : Proc(IWICFormatConverterInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_spec_version : Proc(IWICFormatConverterInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_friendly_name : Proc(IWICFormatConverterInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_pixel_formats : Proc(IWICFormatConverterInfo*, UInt32, LibC::GUID*, UInt32*, Win32cr::Foundation::HRESULT),
    create_instance : Proc(IWICFormatConverterInfo*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICFormatConverterInfo, lpVtbl : IWICFormatConverterInfoVtbl* do
    GUID = LibC::GUID.new(0x9f34fb65_u32, 0x13f4_u16, 0x4f15_u16, StaticArray[0xbc_u8, 0x57_u8, 0x37_u8, 0x26_u8, 0xb5_u8, 0xe5_u8, 0x3d_u8, 0x9f_u8])
    def query_interface(this : IWICFormatConverterInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICFormatConverterInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICFormatConverterInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_component_type(this : IWICFormatConverterInfo*, pType : Win32cr::Graphics::Imaging::WICComponentType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_component_type.call(this, pType)
    end
    def get_clsid(this : IWICFormatConverterInfo*, pclsid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clsid.call(this, pclsid)
    end
    def get_signing_status(this : IWICFormatConverterInfo*, pStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signing_status.call(this, pStatus)
    end
    def get_author(this : IWICFormatConverterInfo*, cchAuthor : UInt32, wzAuthor : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_author.call(this, cchAuthor, wzAuthor, pcchActual)
    end
    def get_vendor_guid(this : IWICFormatConverterInfo*, pguidVendor : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_vendor_guid.call(this, pguidVendor)
    end
    def get_version(this : IWICFormatConverterInfo*, cchVersion : UInt32, wzVersion : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version.call(this, cchVersion, wzVersion, pcchActual)
    end
    def get_spec_version(this : IWICFormatConverterInfo*, cchSpecVersion : UInt32, wzSpecVersion : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_spec_version.call(this, cchSpecVersion, wzSpecVersion, pcchActual)
    end
    def get_friendly_name(this : IWICFormatConverterInfo*, cchFriendlyName : UInt32, wzFriendlyName : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_friendly_name.call(this, cchFriendlyName, wzFriendlyName, pcchActual)
    end
    def get_pixel_formats(this : IWICFormatConverterInfo*, cFormats : UInt32, pPixelFormatGUIDs : LibC::GUID*, pcActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pixel_formats.call(this, cFormats, pPixelFormatGUIDs, pcActual)
    end
    def create_instance(this : IWICFormatConverterInfo*, ppIConverter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_instance.call(this, ppIConverter)
    end

  end

  @[Extern]
  record IWICBitmapCodecInfoVtbl,
    query_interface : Proc(IWICBitmapCodecInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICBitmapCodecInfo*, UInt32),
    release : Proc(IWICBitmapCodecInfo*, UInt32),
    get_component_type : Proc(IWICBitmapCodecInfo*, Win32cr::Graphics::Imaging::WICComponentType*, Win32cr::Foundation::HRESULT),
    get_clsid : Proc(IWICBitmapCodecInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_signing_status : Proc(IWICBitmapCodecInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_author : Proc(IWICBitmapCodecInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_vendor_guid : Proc(IWICBitmapCodecInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_version : Proc(IWICBitmapCodecInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_spec_version : Proc(IWICBitmapCodecInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_friendly_name : Proc(IWICBitmapCodecInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_container_format : Proc(IWICBitmapCodecInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_pixel_formats : Proc(IWICBitmapCodecInfo*, UInt32, LibC::GUID*, UInt32*, Win32cr::Foundation::HRESULT),
    get_color_management_version : Proc(IWICBitmapCodecInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_device_manufacturer : Proc(IWICBitmapCodecInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_device_models : Proc(IWICBitmapCodecInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_mime_types : Proc(IWICBitmapCodecInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_file_extensions : Proc(IWICBitmapCodecInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    does_support_animation : Proc(IWICBitmapCodecInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    does_support_chromakey : Proc(IWICBitmapCodecInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    does_support_lossless : Proc(IWICBitmapCodecInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    does_support_multiframe : Proc(IWICBitmapCodecInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    matches_mime_type : Proc(IWICBitmapCodecInfo*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICBitmapCodecInfo, lpVtbl : IWICBitmapCodecInfoVtbl* do
    GUID = LibC::GUID.new(0xe87a44c4_u32, 0xb76e_u16, 0x4c47_u16, StaticArray[0x8b_u8, 0x9_u8, 0x29_u8, 0x8e_u8, 0xb1_u8, 0x2a_u8, 0x27_u8, 0x14_u8])
    def query_interface(this : IWICBitmapCodecInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICBitmapCodecInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICBitmapCodecInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_component_type(this : IWICBitmapCodecInfo*, pType : Win32cr::Graphics::Imaging::WICComponentType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_component_type.call(this, pType)
    end
    def get_clsid(this : IWICBitmapCodecInfo*, pclsid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clsid.call(this, pclsid)
    end
    def get_signing_status(this : IWICBitmapCodecInfo*, pStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signing_status.call(this, pStatus)
    end
    def get_author(this : IWICBitmapCodecInfo*, cchAuthor : UInt32, wzAuthor : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_author.call(this, cchAuthor, wzAuthor, pcchActual)
    end
    def get_vendor_guid(this : IWICBitmapCodecInfo*, pguidVendor : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_vendor_guid.call(this, pguidVendor)
    end
    def get_version(this : IWICBitmapCodecInfo*, cchVersion : UInt32, wzVersion : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version.call(this, cchVersion, wzVersion, pcchActual)
    end
    def get_spec_version(this : IWICBitmapCodecInfo*, cchSpecVersion : UInt32, wzSpecVersion : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_spec_version.call(this, cchSpecVersion, wzSpecVersion, pcchActual)
    end
    def get_friendly_name(this : IWICBitmapCodecInfo*, cchFriendlyName : UInt32, wzFriendlyName : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_friendly_name.call(this, cchFriendlyName, wzFriendlyName, pcchActual)
    end
    def get_container_format(this : IWICBitmapCodecInfo*, pguidContainerFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_container_format.call(this, pguidContainerFormat)
    end
    def get_pixel_formats(this : IWICBitmapCodecInfo*, cFormats : UInt32, pguidPixelFormats : LibC::GUID*, pcActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pixel_formats.call(this, cFormats, pguidPixelFormats, pcActual)
    end
    def get_color_management_version(this : IWICBitmapCodecInfo*, cchColorManagementVersion : UInt32, wzColorManagementVersion : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_color_management_version.call(this, cchColorManagementVersion, wzColorManagementVersion, pcchActual)
    end
    def get_device_manufacturer(this : IWICBitmapCodecInfo*, cchDeviceManufacturer : UInt32, wzDeviceManufacturer : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_manufacturer.call(this, cchDeviceManufacturer, wzDeviceManufacturer, pcchActual)
    end
    def get_device_models(this : IWICBitmapCodecInfo*, cchDeviceModels : UInt32, wzDeviceModels : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_models.call(this, cchDeviceModels, wzDeviceModels, pcchActual)
    end
    def get_mime_types(this : IWICBitmapCodecInfo*, cchMimeTypes : UInt32, wzMimeTypes : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_mime_types.call(this, cchMimeTypes, wzMimeTypes, pcchActual)
    end
    def get_file_extensions(this : IWICBitmapCodecInfo*, cchFileExtensions : UInt32, wzFileExtensions : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_extensions.call(this, cchFileExtensions, wzFileExtensions, pcchActual)
    end
    def does_support_animation(this : IWICBitmapCodecInfo*, pfSupportAnimation : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.does_support_animation.call(this, pfSupportAnimation)
    end
    def does_support_chromakey(this : IWICBitmapCodecInfo*, pfSupportChromakey : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.does_support_chromakey.call(this, pfSupportChromakey)
    end
    def does_support_lossless(this : IWICBitmapCodecInfo*, pfSupportLossless : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.does_support_lossless.call(this, pfSupportLossless)
    end
    def does_support_multiframe(this : IWICBitmapCodecInfo*, pfSupportMultiframe : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.does_support_multiframe.call(this, pfSupportMultiframe)
    end
    def matches_mime_type(this : IWICBitmapCodecInfo*, wzMimeType : Win32cr::Foundation::PWSTR, pfMatches : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.matches_mime_type.call(this, wzMimeType, pfMatches)
    end

  end

  @[Extern]
  record IWICBitmapEncoderInfoVtbl,
    query_interface : Proc(IWICBitmapEncoderInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICBitmapEncoderInfo*, UInt32),
    release : Proc(IWICBitmapEncoderInfo*, UInt32),
    get_component_type : Proc(IWICBitmapEncoderInfo*, Win32cr::Graphics::Imaging::WICComponentType*, Win32cr::Foundation::HRESULT),
    get_clsid : Proc(IWICBitmapEncoderInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_signing_status : Proc(IWICBitmapEncoderInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_author : Proc(IWICBitmapEncoderInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_vendor_guid : Proc(IWICBitmapEncoderInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_version : Proc(IWICBitmapEncoderInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_spec_version : Proc(IWICBitmapEncoderInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_friendly_name : Proc(IWICBitmapEncoderInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_container_format : Proc(IWICBitmapEncoderInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_pixel_formats : Proc(IWICBitmapEncoderInfo*, UInt32, LibC::GUID*, UInt32*, Win32cr::Foundation::HRESULT),
    get_color_management_version : Proc(IWICBitmapEncoderInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_device_manufacturer : Proc(IWICBitmapEncoderInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_device_models : Proc(IWICBitmapEncoderInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_mime_types : Proc(IWICBitmapEncoderInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_file_extensions : Proc(IWICBitmapEncoderInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    does_support_animation : Proc(IWICBitmapEncoderInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    does_support_chromakey : Proc(IWICBitmapEncoderInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    does_support_lossless : Proc(IWICBitmapEncoderInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    does_support_multiframe : Proc(IWICBitmapEncoderInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    matches_mime_type : Proc(IWICBitmapEncoderInfo*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    create_instance : Proc(IWICBitmapEncoderInfo*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICBitmapEncoderInfo, lpVtbl : IWICBitmapEncoderInfoVtbl* do
    GUID = LibC::GUID.new(0x94c9b4ee_u32, 0xa09f_u16, 0x4f92_u16, StaticArray[0x8a_u8, 0x1e_u8, 0x4a_u8, 0x9b_u8, 0xce_u8, 0x7e_u8, 0x76_u8, 0xfb_u8])
    def query_interface(this : IWICBitmapEncoderInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICBitmapEncoderInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICBitmapEncoderInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_component_type(this : IWICBitmapEncoderInfo*, pType : Win32cr::Graphics::Imaging::WICComponentType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_component_type.call(this, pType)
    end
    def get_clsid(this : IWICBitmapEncoderInfo*, pclsid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clsid.call(this, pclsid)
    end
    def get_signing_status(this : IWICBitmapEncoderInfo*, pStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signing_status.call(this, pStatus)
    end
    def get_author(this : IWICBitmapEncoderInfo*, cchAuthor : UInt32, wzAuthor : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_author.call(this, cchAuthor, wzAuthor, pcchActual)
    end
    def get_vendor_guid(this : IWICBitmapEncoderInfo*, pguidVendor : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_vendor_guid.call(this, pguidVendor)
    end
    def get_version(this : IWICBitmapEncoderInfo*, cchVersion : UInt32, wzVersion : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version.call(this, cchVersion, wzVersion, pcchActual)
    end
    def get_spec_version(this : IWICBitmapEncoderInfo*, cchSpecVersion : UInt32, wzSpecVersion : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_spec_version.call(this, cchSpecVersion, wzSpecVersion, pcchActual)
    end
    def get_friendly_name(this : IWICBitmapEncoderInfo*, cchFriendlyName : UInt32, wzFriendlyName : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_friendly_name.call(this, cchFriendlyName, wzFriendlyName, pcchActual)
    end
    def get_container_format(this : IWICBitmapEncoderInfo*, pguidContainerFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_container_format.call(this, pguidContainerFormat)
    end
    def get_pixel_formats(this : IWICBitmapEncoderInfo*, cFormats : UInt32, pguidPixelFormats : LibC::GUID*, pcActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pixel_formats.call(this, cFormats, pguidPixelFormats, pcActual)
    end
    def get_color_management_version(this : IWICBitmapEncoderInfo*, cchColorManagementVersion : UInt32, wzColorManagementVersion : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_color_management_version.call(this, cchColorManagementVersion, wzColorManagementVersion, pcchActual)
    end
    def get_device_manufacturer(this : IWICBitmapEncoderInfo*, cchDeviceManufacturer : UInt32, wzDeviceManufacturer : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_manufacturer.call(this, cchDeviceManufacturer, wzDeviceManufacturer, pcchActual)
    end
    def get_device_models(this : IWICBitmapEncoderInfo*, cchDeviceModels : UInt32, wzDeviceModels : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_models.call(this, cchDeviceModels, wzDeviceModels, pcchActual)
    end
    def get_mime_types(this : IWICBitmapEncoderInfo*, cchMimeTypes : UInt32, wzMimeTypes : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_mime_types.call(this, cchMimeTypes, wzMimeTypes, pcchActual)
    end
    def get_file_extensions(this : IWICBitmapEncoderInfo*, cchFileExtensions : UInt32, wzFileExtensions : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_extensions.call(this, cchFileExtensions, wzFileExtensions, pcchActual)
    end
    def does_support_animation(this : IWICBitmapEncoderInfo*, pfSupportAnimation : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.does_support_animation.call(this, pfSupportAnimation)
    end
    def does_support_chromakey(this : IWICBitmapEncoderInfo*, pfSupportChromakey : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.does_support_chromakey.call(this, pfSupportChromakey)
    end
    def does_support_lossless(this : IWICBitmapEncoderInfo*, pfSupportLossless : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.does_support_lossless.call(this, pfSupportLossless)
    end
    def does_support_multiframe(this : IWICBitmapEncoderInfo*, pfSupportMultiframe : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.does_support_multiframe.call(this, pfSupportMultiframe)
    end
    def matches_mime_type(this : IWICBitmapEncoderInfo*, wzMimeType : Win32cr::Foundation::PWSTR, pfMatches : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.matches_mime_type.call(this, wzMimeType, pfMatches)
    end
    def create_instance(this : IWICBitmapEncoderInfo*, ppIBitmapEncoder : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_instance.call(this, ppIBitmapEncoder)
    end

  end

  @[Extern]
  record IWICBitmapDecoderInfoVtbl,
    query_interface : Proc(IWICBitmapDecoderInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICBitmapDecoderInfo*, UInt32),
    release : Proc(IWICBitmapDecoderInfo*, UInt32),
    get_component_type : Proc(IWICBitmapDecoderInfo*, Win32cr::Graphics::Imaging::WICComponentType*, Win32cr::Foundation::HRESULT),
    get_clsid : Proc(IWICBitmapDecoderInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_signing_status : Proc(IWICBitmapDecoderInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_author : Proc(IWICBitmapDecoderInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_vendor_guid : Proc(IWICBitmapDecoderInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_version : Proc(IWICBitmapDecoderInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_spec_version : Proc(IWICBitmapDecoderInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_friendly_name : Proc(IWICBitmapDecoderInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_container_format : Proc(IWICBitmapDecoderInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_pixel_formats : Proc(IWICBitmapDecoderInfo*, UInt32, LibC::GUID*, UInt32*, Win32cr::Foundation::HRESULT),
    get_color_management_version : Proc(IWICBitmapDecoderInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_device_manufacturer : Proc(IWICBitmapDecoderInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_device_models : Proc(IWICBitmapDecoderInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_mime_types : Proc(IWICBitmapDecoderInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_file_extensions : Proc(IWICBitmapDecoderInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    does_support_animation : Proc(IWICBitmapDecoderInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    does_support_chromakey : Proc(IWICBitmapDecoderInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    does_support_lossless : Proc(IWICBitmapDecoderInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    does_support_multiframe : Proc(IWICBitmapDecoderInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    matches_mime_type : Proc(IWICBitmapDecoderInfo*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_patterns : Proc(IWICBitmapDecoderInfo*, UInt32, Win32cr::Graphics::Imaging::WICBitmapPattern*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    matches_pattern : Proc(IWICBitmapDecoderInfo*, Void*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    create_instance : Proc(IWICBitmapDecoderInfo*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICBitmapDecoderInfo, lpVtbl : IWICBitmapDecoderInfoVtbl* do
    GUID = LibC::GUID.new(0xd8cd007f_u32, 0xd08f_u16, 0x4191_u16, StaticArray[0x9b_u8, 0xfc_u8, 0x23_u8, 0x6e_u8, 0xa7_u8, 0xf0_u8, 0xe4_u8, 0xb5_u8])
    def query_interface(this : IWICBitmapDecoderInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICBitmapDecoderInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICBitmapDecoderInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_component_type(this : IWICBitmapDecoderInfo*, pType : Win32cr::Graphics::Imaging::WICComponentType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_component_type.call(this, pType)
    end
    def get_clsid(this : IWICBitmapDecoderInfo*, pclsid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clsid.call(this, pclsid)
    end
    def get_signing_status(this : IWICBitmapDecoderInfo*, pStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signing_status.call(this, pStatus)
    end
    def get_author(this : IWICBitmapDecoderInfo*, cchAuthor : UInt32, wzAuthor : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_author.call(this, cchAuthor, wzAuthor, pcchActual)
    end
    def get_vendor_guid(this : IWICBitmapDecoderInfo*, pguidVendor : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_vendor_guid.call(this, pguidVendor)
    end
    def get_version(this : IWICBitmapDecoderInfo*, cchVersion : UInt32, wzVersion : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version.call(this, cchVersion, wzVersion, pcchActual)
    end
    def get_spec_version(this : IWICBitmapDecoderInfo*, cchSpecVersion : UInt32, wzSpecVersion : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_spec_version.call(this, cchSpecVersion, wzSpecVersion, pcchActual)
    end
    def get_friendly_name(this : IWICBitmapDecoderInfo*, cchFriendlyName : UInt32, wzFriendlyName : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_friendly_name.call(this, cchFriendlyName, wzFriendlyName, pcchActual)
    end
    def get_container_format(this : IWICBitmapDecoderInfo*, pguidContainerFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_container_format.call(this, pguidContainerFormat)
    end
    def get_pixel_formats(this : IWICBitmapDecoderInfo*, cFormats : UInt32, pguidPixelFormats : LibC::GUID*, pcActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pixel_formats.call(this, cFormats, pguidPixelFormats, pcActual)
    end
    def get_color_management_version(this : IWICBitmapDecoderInfo*, cchColorManagementVersion : UInt32, wzColorManagementVersion : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_color_management_version.call(this, cchColorManagementVersion, wzColorManagementVersion, pcchActual)
    end
    def get_device_manufacturer(this : IWICBitmapDecoderInfo*, cchDeviceManufacturer : UInt32, wzDeviceManufacturer : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_manufacturer.call(this, cchDeviceManufacturer, wzDeviceManufacturer, pcchActual)
    end
    def get_device_models(this : IWICBitmapDecoderInfo*, cchDeviceModels : UInt32, wzDeviceModels : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_models.call(this, cchDeviceModels, wzDeviceModels, pcchActual)
    end
    def get_mime_types(this : IWICBitmapDecoderInfo*, cchMimeTypes : UInt32, wzMimeTypes : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_mime_types.call(this, cchMimeTypes, wzMimeTypes, pcchActual)
    end
    def get_file_extensions(this : IWICBitmapDecoderInfo*, cchFileExtensions : UInt32, wzFileExtensions : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_extensions.call(this, cchFileExtensions, wzFileExtensions, pcchActual)
    end
    def does_support_animation(this : IWICBitmapDecoderInfo*, pfSupportAnimation : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.does_support_animation.call(this, pfSupportAnimation)
    end
    def does_support_chromakey(this : IWICBitmapDecoderInfo*, pfSupportChromakey : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.does_support_chromakey.call(this, pfSupportChromakey)
    end
    def does_support_lossless(this : IWICBitmapDecoderInfo*, pfSupportLossless : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.does_support_lossless.call(this, pfSupportLossless)
    end
    def does_support_multiframe(this : IWICBitmapDecoderInfo*, pfSupportMultiframe : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.does_support_multiframe.call(this, pfSupportMultiframe)
    end
    def matches_mime_type(this : IWICBitmapDecoderInfo*, wzMimeType : Win32cr::Foundation::PWSTR, pfMatches : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.matches_mime_type.call(this, wzMimeType, pfMatches)
    end
    def get_patterns(this : IWICBitmapDecoderInfo*, cbSizePatterns : UInt32, pPatterns : Win32cr::Graphics::Imaging::WICBitmapPattern*, pcPatterns : UInt32*, pcbPatternsActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_patterns.call(this, cbSizePatterns, pPatterns, pcPatterns, pcbPatternsActual)
    end
    def matches_pattern(this : IWICBitmapDecoderInfo*, pIStream : Void*, pfMatches : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.matches_pattern.call(this, pIStream, pfMatches)
    end
    def create_instance(this : IWICBitmapDecoderInfo*, ppIBitmapDecoder : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_instance.call(this, ppIBitmapDecoder)
    end

  end

  @[Extern]
  record IWICPixelFormatInfoVtbl,
    query_interface : Proc(IWICPixelFormatInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICPixelFormatInfo*, UInt32),
    release : Proc(IWICPixelFormatInfo*, UInt32),
    get_component_type : Proc(IWICPixelFormatInfo*, Win32cr::Graphics::Imaging::WICComponentType*, Win32cr::Foundation::HRESULT),
    get_clsid : Proc(IWICPixelFormatInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_signing_status : Proc(IWICPixelFormatInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_author : Proc(IWICPixelFormatInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_vendor_guid : Proc(IWICPixelFormatInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_version : Proc(IWICPixelFormatInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_spec_version : Proc(IWICPixelFormatInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_friendly_name : Proc(IWICPixelFormatInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_format_guid : Proc(IWICPixelFormatInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_color_context : Proc(IWICPixelFormatInfo*, Void**, Win32cr::Foundation::HRESULT),
    get_bits_per_pixel : Proc(IWICPixelFormatInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_channel_count : Proc(IWICPixelFormatInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_channel_mask : Proc(IWICPixelFormatInfo*, UInt32, UInt32, UInt8*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICPixelFormatInfo, lpVtbl : IWICPixelFormatInfoVtbl* do
    GUID = LibC::GUID.new(0xe8eda601_u32, 0x3d48_u16, 0x431a_u16, StaticArray[0xab_u8, 0x44_u8, 0x69_u8, 0x5_u8, 0x9b_u8, 0xe8_u8, 0x8b_u8, 0xbe_u8])
    def query_interface(this : IWICPixelFormatInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICPixelFormatInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICPixelFormatInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_component_type(this : IWICPixelFormatInfo*, pType : Win32cr::Graphics::Imaging::WICComponentType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_component_type.call(this, pType)
    end
    def get_clsid(this : IWICPixelFormatInfo*, pclsid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clsid.call(this, pclsid)
    end
    def get_signing_status(this : IWICPixelFormatInfo*, pStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signing_status.call(this, pStatus)
    end
    def get_author(this : IWICPixelFormatInfo*, cchAuthor : UInt32, wzAuthor : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_author.call(this, cchAuthor, wzAuthor, pcchActual)
    end
    def get_vendor_guid(this : IWICPixelFormatInfo*, pguidVendor : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_vendor_guid.call(this, pguidVendor)
    end
    def get_version(this : IWICPixelFormatInfo*, cchVersion : UInt32, wzVersion : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version.call(this, cchVersion, wzVersion, pcchActual)
    end
    def get_spec_version(this : IWICPixelFormatInfo*, cchSpecVersion : UInt32, wzSpecVersion : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_spec_version.call(this, cchSpecVersion, wzSpecVersion, pcchActual)
    end
    def get_friendly_name(this : IWICPixelFormatInfo*, cchFriendlyName : UInt32, wzFriendlyName : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_friendly_name.call(this, cchFriendlyName, wzFriendlyName, pcchActual)
    end
    def get_format_guid(this : IWICPixelFormatInfo*, pFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_format_guid.call(this, pFormat)
    end
    def get_color_context(this : IWICPixelFormatInfo*, ppIColorContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_color_context.call(this, ppIColorContext)
    end
    def get_bits_per_pixel(this : IWICPixelFormatInfo*, puiBitsPerPixel : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_bits_per_pixel.call(this, puiBitsPerPixel)
    end
    def get_channel_count(this : IWICPixelFormatInfo*, puiChannelCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_channel_count.call(this, puiChannelCount)
    end
    def get_channel_mask(this : IWICPixelFormatInfo*, uiChannelIndex : UInt32, cbMaskBuffer : UInt32, pbMaskBuffer : UInt8*, pcbActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_channel_mask.call(this, uiChannelIndex, cbMaskBuffer, pbMaskBuffer, pcbActual)
    end

  end

  @[Extern]
  record IWICPixelFormatInfo2Vtbl,
    query_interface : Proc(IWICPixelFormatInfo2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICPixelFormatInfo2*, UInt32),
    release : Proc(IWICPixelFormatInfo2*, UInt32),
    get_component_type : Proc(IWICPixelFormatInfo2*, Win32cr::Graphics::Imaging::WICComponentType*, Win32cr::Foundation::HRESULT),
    get_clsid : Proc(IWICPixelFormatInfo2*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_signing_status : Proc(IWICPixelFormatInfo2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_author : Proc(IWICPixelFormatInfo2*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_vendor_guid : Proc(IWICPixelFormatInfo2*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_version : Proc(IWICPixelFormatInfo2*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_spec_version : Proc(IWICPixelFormatInfo2*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_friendly_name : Proc(IWICPixelFormatInfo2*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_format_guid : Proc(IWICPixelFormatInfo2*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_color_context : Proc(IWICPixelFormatInfo2*, Void**, Win32cr::Foundation::HRESULT),
    get_bits_per_pixel : Proc(IWICPixelFormatInfo2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_channel_count : Proc(IWICPixelFormatInfo2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_channel_mask : Proc(IWICPixelFormatInfo2*, UInt32, UInt32, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    supports_transparency : Proc(IWICPixelFormatInfo2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_numeric_representation : Proc(IWICPixelFormatInfo2*, Win32cr::Graphics::Imaging::WICPixelFormatNumericRepresentation*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICPixelFormatInfo2, lpVtbl : IWICPixelFormatInfo2Vtbl* do
    GUID = LibC::GUID.new(0xa9db33a2_u32, 0xaf5f_u16, 0x43c7_u16, StaticArray[0xb6_u8, 0x79_u8, 0x74_u8, 0xf5_u8, 0x98_u8, 0x4b_u8, 0x5a_u8, 0xa4_u8])
    def query_interface(this : IWICPixelFormatInfo2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICPixelFormatInfo2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICPixelFormatInfo2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_component_type(this : IWICPixelFormatInfo2*, pType : Win32cr::Graphics::Imaging::WICComponentType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_component_type.call(this, pType)
    end
    def get_clsid(this : IWICPixelFormatInfo2*, pclsid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clsid.call(this, pclsid)
    end
    def get_signing_status(this : IWICPixelFormatInfo2*, pStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signing_status.call(this, pStatus)
    end
    def get_author(this : IWICPixelFormatInfo2*, cchAuthor : UInt32, wzAuthor : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_author.call(this, cchAuthor, wzAuthor, pcchActual)
    end
    def get_vendor_guid(this : IWICPixelFormatInfo2*, pguidVendor : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_vendor_guid.call(this, pguidVendor)
    end
    def get_version(this : IWICPixelFormatInfo2*, cchVersion : UInt32, wzVersion : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version.call(this, cchVersion, wzVersion, pcchActual)
    end
    def get_spec_version(this : IWICPixelFormatInfo2*, cchSpecVersion : UInt32, wzSpecVersion : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_spec_version.call(this, cchSpecVersion, wzSpecVersion, pcchActual)
    end
    def get_friendly_name(this : IWICPixelFormatInfo2*, cchFriendlyName : UInt32, wzFriendlyName : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_friendly_name.call(this, cchFriendlyName, wzFriendlyName, pcchActual)
    end
    def get_format_guid(this : IWICPixelFormatInfo2*, pFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_format_guid.call(this, pFormat)
    end
    def get_color_context(this : IWICPixelFormatInfo2*, ppIColorContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_color_context.call(this, ppIColorContext)
    end
    def get_bits_per_pixel(this : IWICPixelFormatInfo2*, puiBitsPerPixel : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_bits_per_pixel.call(this, puiBitsPerPixel)
    end
    def get_channel_count(this : IWICPixelFormatInfo2*, puiChannelCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_channel_count.call(this, puiChannelCount)
    end
    def get_channel_mask(this : IWICPixelFormatInfo2*, uiChannelIndex : UInt32, cbMaskBuffer : UInt32, pbMaskBuffer : UInt8*, pcbActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_channel_mask.call(this, uiChannelIndex, cbMaskBuffer, pbMaskBuffer, pcbActual)
    end
    def supports_transparency(this : IWICPixelFormatInfo2*, pfSupportsTransparency : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.supports_transparency.call(this, pfSupportsTransparency)
    end
    def get_numeric_representation(this : IWICPixelFormatInfo2*, pNumericRepresentation : Win32cr::Graphics::Imaging::WICPixelFormatNumericRepresentation*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_numeric_representation.call(this, pNumericRepresentation)
    end

  end

  @[Extern]
  record IWICImagingFactoryVtbl,
    query_interface : Proc(IWICImagingFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICImagingFactory*, UInt32),
    release : Proc(IWICImagingFactory*, UInt32),
    create_decoder_from_filename : Proc(IWICImagingFactory*, Win32cr::Foundation::PWSTR, LibC::GUID*, UInt32, Win32cr::Graphics::Imaging::WICDecodeOptions, Void**, Win32cr::Foundation::HRESULT),
    create_decoder_from_stream : Proc(IWICImagingFactory*, Void*, LibC::GUID*, Win32cr::Graphics::Imaging::WICDecodeOptions, Void**, Win32cr::Foundation::HRESULT),
    create_decoder_from_file_handle : Proc(IWICImagingFactory*, LibC::UIntPtrT, LibC::GUID*, Win32cr::Graphics::Imaging::WICDecodeOptions, Void**, Win32cr::Foundation::HRESULT),
    create_component_info : Proc(IWICImagingFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    create_decoder : Proc(IWICImagingFactory*, LibC::GUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    create_encoder : Proc(IWICImagingFactory*, LibC::GUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    create_palette : Proc(IWICImagingFactory*, Void**, Win32cr::Foundation::HRESULT),
    create_format_converter : Proc(IWICImagingFactory*, Void**, Win32cr::Foundation::HRESULT),
    create_bitmap_scaler : Proc(IWICImagingFactory*, Void**, Win32cr::Foundation::HRESULT),
    create_bitmap_clipper : Proc(IWICImagingFactory*, Void**, Win32cr::Foundation::HRESULT),
    create_bitmap_flip_rotator : Proc(IWICImagingFactory*, Void**, Win32cr::Foundation::HRESULT),
    create_stream : Proc(IWICImagingFactory*, Void**, Win32cr::Foundation::HRESULT),
    create_color_context : Proc(IWICImagingFactory*, Void**, Win32cr::Foundation::HRESULT),
    create_color_transformer : Proc(IWICImagingFactory*, Void**, Win32cr::Foundation::HRESULT),
    create_bitmap : Proc(IWICImagingFactory*, UInt32, UInt32, LibC::GUID*, Win32cr::Graphics::Imaging::WICBitmapCreateCacheOption, Void**, Win32cr::Foundation::HRESULT),
    create_bitmap_from_source : Proc(IWICImagingFactory*, Void*, Win32cr::Graphics::Imaging::WICBitmapCreateCacheOption, Void**, Win32cr::Foundation::HRESULT),
    create_bitmap_from_source_rect : Proc(IWICImagingFactory*, Void*, UInt32, UInt32, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    create_bitmap_from_memory : Proc(IWICImagingFactory*, UInt32, UInt32, LibC::GUID*, UInt32, UInt32, UInt8*, Void**, Win32cr::Foundation::HRESULT),
    create_bitmap_from_hbitmap : Proc(IWICImagingFactory*, Win32cr::Graphics::Gdi::HBITMAP, Win32cr::Graphics::Gdi::HPALETTE, Win32cr::Graphics::Imaging::WICBitmapAlphaChannelOption, Void**, Win32cr::Foundation::HRESULT),
    create_bitmap_from_hicon : Proc(IWICImagingFactory*, Win32cr::UI::WindowsAndMessaging::HICON, Void**, Win32cr::Foundation::HRESULT),
    create_component_enumerator : Proc(IWICImagingFactory*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    create_fast_metadata_encoder_from_decoder : Proc(IWICImagingFactory*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_fast_metadata_encoder_from_frame_decode : Proc(IWICImagingFactory*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_query_writer : Proc(IWICImagingFactory*, LibC::GUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    create_query_writer_from_reader : Proc(IWICImagingFactory*, Void*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICImagingFactory, lpVtbl : IWICImagingFactoryVtbl* do
    GUID = LibC::GUID.new(0xec5ec8a9_u32, 0xc395_u16, 0x4314_u16, StaticArray[0x9c_u8, 0x77_u8, 0x54_u8, 0xd7_u8, 0xa9_u8, 0x35_u8, 0xff_u8, 0x70_u8])
    def query_interface(this : IWICImagingFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICImagingFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICImagingFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_decoder_from_filename(this : IWICImagingFactory*, wzFilename : Win32cr::Foundation::PWSTR, pguidVendor : LibC::GUID*, dwDesiredAccess : UInt32, metadataOptions : Win32cr::Graphics::Imaging::WICDecodeOptions, ppIDecoder : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_decoder_from_filename.call(this, wzFilename, pguidVendor, dwDesiredAccess, metadataOptions, ppIDecoder)
    end
    def create_decoder_from_stream(this : IWICImagingFactory*, pIStream : Void*, pguidVendor : LibC::GUID*, metadataOptions : Win32cr::Graphics::Imaging::WICDecodeOptions, ppIDecoder : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_decoder_from_stream.call(this, pIStream, pguidVendor, metadataOptions, ppIDecoder)
    end
    def create_decoder_from_file_handle(this : IWICImagingFactory*, hFile : LibC::UIntPtrT, pguidVendor : LibC::GUID*, metadataOptions : Win32cr::Graphics::Imaging::WICDecodeOptions, ppIDecoder : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_decoder_from_file_handle.call(this, hFile, pguidVendor, metadataOptions, ppIDecoder)
    end
    def create_component_info(this : IWICImagingFactory*, clsidComponent : LibC::GUID*, ppIInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_component_info.call(this, clsidComponent, ppIInfo)
    end
    def create_decoder(this : IWICImagingFactory*, guidContainerFormat : LibC::GUID*, pguidVendor : LibC::GUID*, ppIDecoder : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_decoder.call(this, guidContainerFormat, pguidVendor, ppIDecoder)
    end
    def create_encoder(this : IWICImagingFactory*, guidContainerFormat : LibC::GUID*, pguidVendor : LibC::GUID*, ppIEncoder : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_encoder.call(this, guidContainerFormat, pguidVendor, ppIEncoder)
    end
    def create_palette(this : IWICImagingFactory*, ppIPalette : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_palette.call(this, ppIPalette)
    end
    def create_format_converter(this : IWICImagingFactory*, ppIFormatConverter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_format_converter.call(this, ppIFormatConverter)
    end
    def create_bitmap_scaler(this : IWICImagingFactory*, ppIBitmapScaler : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_bitmap_scaler.call(this, ppIBitmapScaler)
    end
    def create_bitmap_clipper(this : IWICImagingFactory*, ppIBitmapClipper : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_bitmap_clipper.call(this, ppIBitmapClipper)
    end
    def create_bitmap_flip_rotator(this : IWICImagingFactory*, ppIBitmapFlipRotator : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_bitmap_flip_rotator.call(this, ppIBitmapFlipRotator)
    end
    def create_stream(this : IWICImagingFactory*, ppIWICStream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_stream.call(this, ppIWICStream)
    end
    def create_color_context(this : IWICImagingFactory*, ppIWICColorContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_color_context.call(this, ppIWICColorContext)
    end
    def create_color_transformer(this : IWICImagingFactory*, ppIWICColorTransform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_color_transformer.call(this, ppIWICColorTransform)
    end
    def create_bitmap(this : IWICImagingFactory*, uiWidth : UInt32, uiHeight : UInt32, pixelFormat : LibC::GUID*, option : Win32cr::Graphics::Imaging::WICBitmapCreateCacheOption, ppIBitmap : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_bitmap.call(this, uiWidth, uiHeight, pixelFormat, option, ppIBitmap)
    end
    def create_bitmap_from_source(this : IWICImagingFactory*, pIBitmapSource : Void*, option : Win32cr::Graphics::Imaging::WICBitmapCreateCacheOption, ppIBitmap : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_bitmap_from_source.call(this, pIBitmapSource, option, ppIBitmap)
    end
    def create_bitmap_from_source_rect(this : IWICImagingFactory*, pIBitmapSource : Void*, x : UInt32, y : UInt32, width : UInt32, height : UInt32, ppIBitmap : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_bitmap_from_source_rect.call(this, pIBitmapSource, x, y, width, height, ppIBitmap)
    end
    def create_bitmap_from_memory(this : IWICImagingFactory*, uiWidth : UInt32, uiHeight : UInt32, pixelFormat : LibC::GUID*, cbStride : UInt32, cbBufferSize : UInt32, pbBuffer : UInt8*, ppIBitmap : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_bitmap_from_memory.call(this, uiWidth, uiHeight, pixelFormat, cbStride, cbBufferSize, pbBuffer, ppIBitmap)
    end
    def create_bitmap_from_hbitmap(this : IWICImagingFactory*, hBitmap : Win32cr::Graphics::Gdi::HBITMAP, hPalette : Win32cr::Graphics::Gdi::HPALETTE, options : Win32cr::Graphics::Imaging::WICBitmapAlphaChannelOption, ppIBitmap : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_bitmap_from_hbitmap.call(this, hBitmap, hPalette, options, ppIBitmap)
    end
    def create_bitmap_from_hicon(this : IWICImagingFactory*, hIcon : Win32cr::UI::WindowsAndMessaging::HICON, ppIBitmap : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_bitmap_from_hicon.call(this, hIcon, ppIBitmap)
    end
    def create_component_enumerator(this : IWICImagingFactory*, componentTypes : UInt32, options : UInt32, ppIEnumUnknown : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_component_enumerator.call(this, componentTypes, options, ppIEnumUnknown)
    end
    def create_fast_metadata_encoder_from_decoder(this : IWICImagingFactory*, pIDecoder : Void*, ppIFastEncoder : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_fast_metadata_encoder_from_decoder.call(this, pIDecoder, ppIFastEncoder)
    end
    def create_fast_metadata_encoder_from_frame_decode(this : IWICImagingFactory*, pIFrameDecoder : Void*, ppIFastEncoder : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_fast_metadata_encoder_from_frame_decode.call(this, pIFrameDecoder, ppIFastEncoder)
    end
    def create_query_writer(this : IWICImagingFactory*, guidMetadataFormat : LibC::GUID*, pguidVendor : LibC::GUID*, ppIQueryWriter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_query_writer.call(this, guidMetadataFormat, pguidVendor, ppIQueryWriter)
    end
    def create_query_writer_from_reader(this : IWICImagingFactory*, pIQueryReader : Void*, pguidVendor : LibC::GUID*, ppIQueryWriter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_query_writer_from_reader.call(this, pIQueryReader, pguidVendor, ppIQueryWriter)
    end

  end

  @[Extern]
  record IWICDevelopRawNotificationCallbackVtbl,
    query_interface : Proc(IWICDevelopRawNotificationCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICDevelopRawNotificationCallback*, UInt32),
    release : Proc(IWICDevelopRawNotificationCallback*, UInt32),
    notify : Proc(IWICDevelopRawNotificationCallback*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICDevelopRawNotificationCallback, lpVtbl : IWICDevelopRawNotificationCallbackVtbl* do
    GUID = LibC::GUID.new(0x95c75a6e_u32, 0x3e8c_u16, 0x4ec2_u16, StaticArray[0x85_u8, 0xa8_u8, 0xae_u8, 0xbc_u8, 0xc5_u8, 0x51_u8, 0xe5_u8, 0x9b_u8])
    def query_interface(this : IWICDevelopRawNotificationCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICDevelopRawNotificationCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICDevelopRawNotificationCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def notify(this : IWICDevelopRawNotificationCallback*, notification_mask : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify.call(this, notification_mask)
    end

  end

  @[Extern]
  record IWICDevelopRawVtbl,
    query_interface : Proc(IWICDevelopRaw*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICDevelopRaw*, UInt32),
    release : Proc(IWICDevelopRaw*, UInt32),
    get_size : Proc(IWICDevelopRaw*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_pixel_format : Proc(IWICDevelopRaw*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_resolution : Proc(IWICDevelopRaw*, Float64*, Float64*, Win32cr::Foundation::HRESULT),
    copy_palette : Proc(IWICDevelopRaw*, Void*, Win32cr::Foundation::HRESULT),
    copy_pixels : Proc(IWICDevelopRaw*, Win32cr::Graphics::Imaging::WICRect*, UInt32, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    get_metadata_query_reader : Proc(IWICDevelopRaw*, Void**, Win32cr::Foundation::HRESULT),
    get_color_contexts : Proc(IWICDevelopRaw*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    get_thumbnail : Proc(IWICDevelopRaw*, Void**, Win32cr::Foundation::HRESULT),
    query_raw_capabilities_info : Proc(IWICDevelopRaw*, Win32cr::Graphics::Imaging::WICRawCapabilitiesInfo*, Win32cr::Foundation::HRESULT),
    load_parameter_set : Proc(IWICDevelopRaw*, Win32cr::Graphics::Imaging::WICRawParameterSet, Win32cr::Foundation::HRESULT),
    get_current_parameter_set : Proc(IWICDevelopRaw*, Void**, Win32cr::Foundation::HRESULT),
    set_exposure_compensation : Proc(IWICDevelopRaw*, Float64, Win32cr::Foundation::HRESULT),
    get_exposure_compensation : Proc(IWICDevelopRaw*, Float64*, Win32cr::Foundation::HRESULT),
    set_white_point_rgb : Proc(IWICDevelopRaw*, UInt32, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    get_white_point_rgb : Proc(IWICDevelopRaw*, UInt32*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    set_named_white_point : Proc(IWICDevelopRaw*, Win32cr::Graphics::Imaging::WICNamedWhitePoint, Win32cr::Foundation::HRESULT),
    get_named_white_point : Proc(IWICDevelopRaw*, Win32cr::Graphics::Imaging::WICNamedWhitePoint*, Win32cr::Foundation::HRESULT),
    set_white_point_kelvin : Proc(IWICDevelopRaw*, UInt32, Win32cr::Foundation::HRESULT),
    get_white_point_kelvin : Proc(IWICDevelopRaw*, UInt32*, Win32cr::Foundation::HRESULT),
    get_kelvin_range_info : Proc(IWICDevelopRaw*, UInt32*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    set_contrast : Proc(IWICDevelopRaw*, Float64, Win32cr::Foundation::HRESULT),
    get_contrast : Proc(IWICDevelopRaw*, Float64*, Win32cr::Foundation::HRESULT),
    set_gamma : Proc(IWICDevelopRaw*, Float64, Win32cr::Foundation::HRESULT),
    get_gamma : Proc(IWICDevelopRaw*, Float64*, Win32cr::Foundation::HRESULT),
    set_sharpness : Proc(IWICDevelopRaw*, Float64, Win32cr::Foundation::HRESULT),
    get_sharpness : Proc(IWICDevelopRaw*, Float64*, Win32cr::Foundation::HRESULT),
    set_saturation : Proc(IWICDevelopRaw*, Float64, Win32cr::Foundation::HRESULT),
    get_saturation : Proc(IWICDevelopRaw*, Float64*, Win32cr::Foundation::HRESULT),
    set_tint : Proc(IWICDevelopRaw*, Float64, Win32cr::Foundation::HRESULT),
    get_tint : Proc(IWICDevelopRaw*, Float64*, Win32cr::Foundation::HRESULT),
    set_noise_reduction : Proc(IWICDevelopRaw*, Float64, Win32cr::Foundation::HRESULT),
    get_noise_reduction : Proc(IWICDevelopRaw*, Float64*, Win32cr::Foundation::HRESULT),
    set_destination_color_context : Proc(IWICDevelopRaw*, Void*, Win32cr::Foundation::HRESULT),
    set_tone_curve : Proc(IWICDevelopRaw*, UInt32, Win32cr::Graphics::Imaging::WICRawToneCurve*, Win32cr::Foundation::HRESULT),
    get_tone_curve : Proc(IWICDevelopRaw*, UInt32, Win32cr::Graphics::Imaging::WICRawToneCurve*, UInt32*, Win32cr::Foundation::HRESULT),
    set_rotation : Proc(IWICDevelopRaw*, Float64, Win32cr::Foundation::HRESULT),
    get_rotation : Proc(IWICDevelopRaw*, Float64*, Win32cr::Foundation::HRESULT),
    set_render_mode : Proc(IWICDevelopRaw*, Win32cr::Graphics::Imaging::WICRawRenderMode, Win32cr::Foundation::HRESULT),
    get_render_mode : Proc(IWICDevelopRaw*, Win32cr::Graphics::Imaging::WICRawRenderMode*, Win32cr::Foundation::HRESULT),
    set_notification_callback : Proc(IWICDevelopRaw*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICDevelopRaw, lpVtbl : IWICDevelopRawVtbl* do
    GUID = LibC::GUID.new(0xfbec5e44_u32, 0xf7be_u16, 0x4b65_u16, StaticArray[0xb7_u8, 0xf8_u8, 0xc0_u8, 0xc8_u8, 0x1f_u8, 0xef_u8, 0x2_u8, 0x6d_u8])
    def query_interface(this : IWICDevelopRaw*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICDevelopRaw*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICDevelopRaw*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_size(this : IWICDevelopRaw*, puiWidth : UInt32*, puiHeight : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_size.call(this, puiWidth, puiHeight)
    end
    def get_pixel_format(this : IWICDevelopRaw*, pPixelFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pixel_format.call(this, pPixelFormat)
    end
    def get_resolution(this : IWICDevelopRaw*, pDpiX : Float64*, pDpiY : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_resolution.call(this, pDpiX, pDpiY)
    end
    def copy_palette(this : IWICDevelopRaw*, pIPalette : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_palette.call(this, pIPalette)
    end
    def copy_pixels(this : IWICDevelopRaw*, prc : Win32cr::Graphics::Imaging::WICRect*, cbStride : UInt32, cbBufferSize : UInt32, pbBuffer : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_pixels.call(this, prc, cbStride, cbBufferSize, pbBuffer)
    end
    def get_metadata_query_reader(this : IWICDevelopRaw*, ppIMetadataQueryReader : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_metadata_query_reader.call(this, ppIMetadataQueryReader)
    end
    def get_color_contexts(this : IWICDevelopRaw*, cCount : UInt32, ppIColorContexts : Void**, pcActualCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_color_contexts.call(this, cCount, ppIColorContexts, pcActualCount)
    end
    def get_thumbnail(this : IWICDevelopRaw*, ppIThumbnail : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thumbnail.call(this, ppIThumbnail)
    end
    def query_raw_capabilities_info(this : IWICDevelopRaw*, pInfo : Win32cr::Graphics::Imaging::WICRawCapabilitiesInfo*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_raw_capabilities_info.call(this, pInfo)
    end
    def load_parameter_set(this : IWICDevelopRaw*, parameter_set : Win32cr::Graphics::Imaging::WICRawParameterSet) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_parameter_set.call(this, parameter_set)
    end
    def get_current_parameter_set(this : IWICDevelopRaw*, ppCurrentParameterSet : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_parameter_set.call(this, ppCurrentParameterSet)
    end
    def set_exposure_compensation(this : IWICDevelopRaw*, ev : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_exposure_compensation.call(this, ev)
    end
    def get_exposure_compensation(this : IWICDevelopRaw*, pEV : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_exposure_compensation.call(this, pEV)
    end
    def set_white_point_rgb(this : IWICDevelopRaw*, red : UInt32, green : UInt32, blue : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_white_point_rgb.call(this, red, green, blue)
    end
    def get_white_point_rgb(this : IWICDevelopRaw*, pRed : UInt32*, pGreen : UInt32*, pBlue : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_white_point_rgb.call(this, pRed, pGreen, pBlue)
    end
    def set_named_white_point(this : IWICDevelopRaw*, white_point : Win32cr::Graphics::Imaging::WICNamedWhitePoint) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_named_white_point.call(this, white_point)
    end
    def get_named_white_point(this : IWICDevelopRaw*, pWhitePoint : Win32cr::Graphics::Imaging::WICNamedWhitePoint*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_named_white_point.call(this, pWhitePoint)
    end
    def set_white_point_kelvin(this : IWICDevelopRaw*, white_point_kelvin : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_white_point_kelvin.call(this, white_point_kelvin)
    end
    def get_white_point_kelvin(this : IWICDevelopRaw*, pWhitePointKelvin : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_white_point_kelvin.call(this, pWhitePointKelvin)
    end
    def get_kelvin_range_info(this : IWICDevelopRaw*, pMinKelvinTemp : UInt32*, pMaxKelvinTemp : UInt32*, pKelvinTempStepValue : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_kelvin_range_info.call(this, pMinKelvinTemp, pMaxKelvinTemp, pKelvinTempStepValue)
    end
    def set_contrast(this : IWICDevelopRaw*, contrast : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_contrast.call(this, contrast)
    end
    def get_contrast(this : IWICDevelopRaw*, pContrast : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_contrast.call(this, pContrast)
    end
    def set_gamma(this : IWICDevelopRaw*, gamma : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_gamma.call(this, gamma)
    end
    def get_gamma(this : IWICDevelopRaw*, pGamma : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_gamma.call(this, pGamma)
    end
    def set_sharpness(this : IWICDevelopRaw*, sharpness : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_sharpness.call(this, sharpness)
    end
    def get_sharpness(this : IWICDevelopRaw*, pSharpness : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sharpness.call(this, pSharpness)
    end
    def set_saturation(this : IWICDevelopRaw*, saturation : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_saturation.call(this, saturation)
    end
    def get_saturation(this : IWICDevelopRaw*, pSaturation : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_saturation.call(this, pSaturation)
    end
    def set_tint(this : IWICDevelopRaw*, tint : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_tint.call(this, tint)
    end
    def get_tint(this : IWICDevelopRaw*, pTint : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_tint.call(this, pTint)
    end
    def set_noise_reduction(this : IWICDevelopRaw*, noise_reduction : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_noise_reduction.call(this, noise_reduction)
    end
    def get_noise_reduction(this : IWICDevelopRaw*, pNoiseReduction : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_noise_reduction.call(this, pNoiseReduction)
    end
    def set_destination_color_context(this : IWICDevelopRaw*, pColorContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_destination_color_context.call(this, pColorContext)
    end
    def set_tone_curve(this : IWICDevelopRaw*, cbToneCurveSize : UInt32, pToneCurve : Win32cr::Graphics::Imaging::WICRawToneCurve*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_tone_curve.call(this, cbToneCurveSize, pToneCurve)
    end
    def get_tone_curve(this : IWICDevelopRaw*, cbToneCurveBufferSize : UInt32, pToneCurve : Win32cr::Graphics::Imaging::WICRawToneCurve*, pcbActualToneCurveBufferSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_tone_curve.call(this, cbToneCurveBufferSize, pToneCurve, pcbActualToneCurveBufferSize)
    end
    def set_rotation(this : IWICDevelopRaw*, rotation : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_rotation.call(this, rotation)
    end
    def get_rotation(this : IWICDevelopRaw*, pRotation : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rotation.call(this, pRotation)
    end
    def set_render_mode(this : IWICDevelopRaw*, render_mode : Win32cr::Graphics::Imaging::WICRawRenderMode) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_render_mode.call(this, render_mode)
    end
    def get_render_mode(this : IWICDevelopRaw*, pRenderMode : Win32cr::Graphics::Imaging::WICRawRenderMode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_render_mode.call(this, pRenderMode)
    end
    def set_notification_callback(this : IWICDevelopRaw*, pCallback : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notification_callback.call(this, pCallback)
    end

  end

  @[Extern]
  record IWICDdsDecoderVtbl,
    query_interface : Proc(IWICDdsDecoder*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICDdsDecoder*, UInt32),
    release : Proc(IWICDdsDecoder*, UInt32),
    get_parameters : Proc(IWICDdsDecoder*, Win32cr::Graphics::Imaging::WICDdsParameters*, Win32cr::Foundation::HRESULT),
    get_frame : Proc(IWICDdsDecoder*, UInt32, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICDdsDecoder, lpVtbl : IWICDdsDecoderVtbl* do
    GUID = LibC::GUID.new(0x409cd537_u32, 0x8532_u16, 0x40cb_u16, StaticArray[0x97_u8, 0x74_u8, 0xe2_u8, 0xfe_u8, 0xb2_u8, 0xdf_u8, 0x4e_u8, 0x9c_u8])
    def query_interface(this : IWICDdsDecoder*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICDdsDecoder*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICDdsDecoder*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_parameters(this : IWICDdsDecoder*, pParameters : Win32cr::Graphics::Imaging::WICDdsParameters*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parameters.call(this, pParameters)
    end
    def get_frame(this : IWICDdsDecoder*, arrayIndex : UInt32, mipLevel : UInt32, sliceIndex : UInt32, ppIBitmapFrame : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_frame.call(this, arrayIndex, mipLevel, sliceIndex, ppIBitmapFrame)
    end

  end

  @[Extern]
  record IWICDdsEncoderVtbl,
    query_interface : Proc(IWICDdsEncoder*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICDdsEncoder*, UInt32),
    release : Proc(IWICDdsEncoder*, UInt32),
    set_parameters : Proc(IWICDdsEncoder*, Win32cr::Graphics::Imaging::WICDdsParameters*, Win32cr::Foundation::HRESULT),
    get_parameters : Proc(IWICDdsEncoder*, Win32cr::Graphics::Imaging::WICDdsParameters*, Win32cr::Foundation::HRESULT),
    create_new_frame : Proc(IWICDdsEncoder*, Void**, UInt32*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICDdsEncoder, lpVtbl : IWICDdsEncoderVtbl* do
    GUID = LibC::GUID.new(0x5cacdb4c_u32, 0x407e_u16, 0x41b3_u16, StaticArray[0xb9_u8, 0x36_u8, 0xd0_u8, 0xf0_u8, 0x10_u8, 0xcd_u8, 0x67_u8, 0x32_u8])
    def query_interface(this : IWICDdsEncoder*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICDdsEncoder*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICDdsEncoder*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_parameters(this : IWICDdsEncoder*, pParameters : Win32cr::Graphics::Imaging::WICDdsParameters*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_parameters.call(this, pParameters)
    end
    def get_parameters(this : IWICDdsEncoder*, pParameters : Win32cr::Graphics::Imaging::WICDdsParameters*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parameters.call(this, pParameters)
    end
    def create_new_frame(this : IWICDdsEncoder*, ppIFrameEncode : Void**, pArrayIndex : UInt32*, pMipLevel : UInt32*, pSliceIndex : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_new_frame.call(this, ppIFrameEncode, pArrayIndex, pMipLevel, pSliceIndex)
    end

  end

  @[Extern]
  record IWICDdsFrameDecodeVtbl,
    query_interface : Proc(IWICDdsFrameDecode*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICDdsFrameDecode*, UInt32),
    release : Proc(IWICDdsFrameDecode*, UInt32),
    get_size_in_blocks : Proc(IWICDdsFrameDecode*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_format_info : Proc(IWICDdsFrameDecode*, Win32cr::Graphics::Imaging::WICDdsFormatInfo*, Win32cr::Foundation::HRESULT),
    copy_blocks : Proc(IWICDdsFrameDecode*, Win32cr::Graphics::Imaging::WICRect*, UInt32, UInt32, UInt8*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICDdsFrameDecode, lpVtbl : IWICDdsFrameDecodeVtbl* do
    GUID = LibC::GUID.new(0x3d4c0c61_u32, 0x18a4_u16, 0x41e4_u16, StaticArray[0xbd_u8, 0x80_u8, 0x48_u8, 0x1a_u8, 0x4f_u8, 0xc9_u8, 0xf4_u8, 0x64_u8])
    def query_interface(this : IWICDdsFrameDecode*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICDdsFrameDecode*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICDdsFrameDecode*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_size_in_blocks(this : IWICDdsFrameDecode*, pWidthInBlocks : UInt32*, pHeightInBlocks : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_size_in_blocks.call(this, pWidthInBlocks, pHeightInBlocks)
    end
    def get_format_info(this : IWICDdsFrameDecode*, pFormatInfo : Win32cr::Graphics::Imaging::WICDdsFormatInfo*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_format_info.call(this, pFormatInfo)
    end
    def copy_blocks(this : IWICDdsFrameDecode*, prcBoundsInBlocks : Win32cr::Graphics::Imaging::WICRect*, cbStride : UInt32, cbBufferSize : UInt32, pbBuffer : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_blocks.call(this, prcBoundsInBlocks, cbStride, cbBufferSize, pbBuffer)
    end

  end

  @[Extern]
  record IWICJpegFrameDecodeVtbl,
    query_interface : Proc(IWICJpegFrameDecode*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICJpegFrameDecode*, UInt32),
    release : Proc(IWICJpegFrameDecode*, UInt32),
    does_support_indexing : Proc(IWICJpegFrameDecode*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_indexing : Proc(IWICJpegFrameDecode*, Win32cr::Graphics::Imaging::WICJpegIndexingOptions, UInt32, Win32cr::Foundation::HRESULT),
    clear_indexing : Proc(IWICJpegFrameDecode*, Win32cr::Foundation::HRESULT),
    get_ac_huffman_table : Proc(IWICJpegFrameDecode*, UInt32, UInt32, Win32cr::Graphics::Dxgi::Common::DXGI_JPEG_AC_HUFFMAN_TABLE*, Win32cr::Foundation::HRESULT),
    get_dc_huffman_table : Proc(IWICJpegFrameDecode*, UInt32, UInt32, Win32cr::Graphics::Dxgi::Common::DXGI_JPEG_DC_HUFFMAN_TABLE*, Win32cr::Foundation::HRESULT),
    get_quantization_table : Proc(IWICJpegFrameDecode*, UInt32, UInt32, Win32cr::Graphics::Dxgi::Common::DXGI_JPEG_QUANTIZATION_TABLE*, Win32cr::Foundation::HRESULT),
    get_frame_header : Proc(IWICJpegFrameDecode*, Win32cr::Graphics::Imaging::WICJpegFrameHeader*, Win32cr::Foundation::HRESULT),
    get_scan_header : Proc(IWICJpegFrameDecode*, UInt32, Win32cr::Graphics::Imaging::WICJpegScanHeader*, Win32cr::Foundation::HRESULT),
    copy_scan : Proc(IWICJpegFrameDecode*, UInt32, UInt32, UInt32, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    copy_minimal_stream : Proc(IWICJpegFrameDecode*, UInt32, UInt32, UInt8*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICJpegFrameDecode, lpVtbl : IWICJpegFrameDecodeVtbl* do
    GUID = LibC::GUID.new(0x8939f66e_u32, 0xc46a_u16, 0x4c21_u16, StaticArray[0xa9_u8, 0xd1_u8, 0x98_u8, 0xb3_u8, 0x27_u8, 0xce_u8, 0x16_u8, 0x79_u8])
    def query_interface(this : IWICJpegFrameDecode*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICJpegFrameDecode*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICJpegFrameDecode*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def does_support_indexing(this : IWICJpegFrameDecode*, pfIndexingSupported : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.does_support_indexing.call(this, pfIndexingSupported)
    end
    def set_indexing(this : IWICJpegFrameDecode*, options : Win32cr::Graphics::Imaging::WICJpegIndexingOptions, horizontalIntervalSize : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_indexing.call(this, options, horizontalIntervalSize)
    end
    def clear_indexing(this : IWICJpegFrameDecode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear_indexing.call(this)
    end
    def get_ac_huffman_table(this : IWICJpegFrameDecode*, scanIndex : UInt32, tableIndex : UInt32, pAcHuffmanTable : Win32cr::Graphics::Dxgi::Common::DXGI_JPEG_AC_HUFFMAN_TABLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ac_huffman_table.call(this, scanIndex, tableIndex, pAcHuffmanTable)
    end
    def get_dc_huffman_table(this : IWICJpegFrameDecode*, scanIndex : UInt32, tableIndex : UInt32, pDcHuffmanTable : Win32cr::Graphics::Dxgi::Common::DXGI_JPEG_DC_HUFFMAN_TABLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dc_huffman_table.call(this, scanIndex, tableIndex, pDcHuffmanTable)
    end
    def get_quantization_table(this : IWICJpegFrameDecode*, scanIndex : UInt32, tableIndex : UInt32, pQuantizationTable : Win32cr::Graphics::Dxgi::Common::DXGI_JPEG_QUANTIZATION_TABLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_quantization_table.call(this, scanIndex, tableIndex, pQuantizationTable)
    end
    def get_frame_header(this : IWICJpegFrameDecode*, pFrameHeader : Win32cr::Graphics::Imaging::WICJpegFrameHeader*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_frame_header.call(this, pFrameHeader)
    end
    def get_scan_header(this : IWICJpegFrameDecode*, scanIndex : UInt32, pScanHeader : Win32cr::Graphics::Imaging::WICJpegScanHeader*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_scan_header.call(this, scanIndex, pScanHeader)
    end
    def copy_scan(this : IWICJpegFrameDecode*, scanIndex : UInt32, scanOffset : UInt32, cbScanData : UInt32, pbScanData : UInt8*, pcbScanDataActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_scan.call(this, scanIndex, scanOffset, cbScanData, pbScanData, pcbScanDataActual)
    end
    def copy_minimal_stream(this : IWICJpegFrameDecode*, streamOffset : UInt32, cbStreamData : UInt32, pbStreamData : UInt8*, pcbStreamDataActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_minimal_stream.call(this, streamOffset, cbStreamData, pbStreamData, pcbStreamDataActual)
    end

  end

  @[Extern]
  record IWICJpegFrameEncodeVtbl,
    query_interface : Proc(IWICJpegFrameEncode*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICJpegFrameEncode*, UInt32),
    release : Proc(IWICJpegFrameEncode*, UInt32),
    get_ac_huffman_table : Proc(IWICJpegFrameEncode*, UInt32, UInt32, Win32cr::Graphics::Dxgi::Common::DXGI_JPEG_AC_HUFFMAN_TABLE*, Win32cr::Foundation::HRESULT),
    get_dc_huffman_table : Proc(IWICJpegFrameEncode*, UInt32, UInt32, Win32cr::Graphics::Dxgi::Common::DXGI_JPEG_DC_HUFFMAN_TABLE*, Win32cr::Foundation::HRESULT),
    get_quantization_table : Proc(IWICJpegFrameEncode*, UInt32, UInt32, Win32cr::Graphics::Dxgi::Common::DXGI_JPEG_QUANTIZATION_TABLE*, Win32cr::Foundation::HRESULT),
    write_scan : Proc(IWICJpegFrameEncode*, UInt32, UInt8*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICJpegFrameEncode, lpVtbl : IWICJpegFrameEncodeVtbl* do
    GUID = LibC::GUID.new(0x2f0c601f_u32, 0xd2c6_u16, 0x468c_u16, StaticArray[0xab_u8, 0xfa_u8, 0x49_u8, 0x49_u8, 0x5d_u8, 0x98_u8, 0x3e_u8, 0xd1_u8])
    def query_interface(this : IWICJpegFrameEncode*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICJpegFrameEncode*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICJpegFrameEncode*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_ac_huffman_table(this : IWICJpegFrameEncode*, scanIndex : UInt32, tableIndex : UInt32, pAcHuffmanTable : Win32cr::Graphics::Dxgi::Common::DXGI_JPEG_AC_HUFFMAN_TABLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ac_huffman_table.call(this, scanIndex, tableIndex, pAcHuffmanTable)
    end
    def get_dc_huffman_table(this : IWICJpegFrameEncode*, scanIndex : UInt32, tableIndex : UInt32, pDcHuffmanTable : Win32cr::Graphics::Dxgi::Common::DXGI_JPEG_DC_HUFFMAN_TABLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dc_huffman_table.call(this, scanIndex, tableIndex, pDcHuffmanTable)
    end
    def get_quantization_table(this : IWICJpegFrameEncode*, scanIndex : UInt32, tableIndex : UInt32, pQuantizationTable : Win32cr::Graphics::Dxgi::Common::DXGI_JPEG_QUANTIZATION_TABLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_quantization_table.call(this, scanIndex, tableIndex, pQuantizationTable)
    end
    def write_scan(this : IWICJpegFrameEncode*, cbScanData : UInt32, pbScanData : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_scan.call(this, cbScanData, pbScanData)
    end

  end

  @[Extern]
  record IWICMetadataBlockReaderVtbl,
    query_interface : Proc(IWICMetadataBlockReader*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICMetadataBlockReader*, UInt32),
    release : Proc(IWICMetadataBlockReader*, UInt32),
    get_container_format : Proc(IWICMetadataBlockReader*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_count : Proc(IWICMetadataBlockReader*, UInt32*, Win32cr::Foundation::HRESULT),
    get_reader_by_index : Proc(IWICMetadataBlockReader*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_enumerator : Proc(IWICMetadataBlockReader*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICMetadataBlockReader, lpVtbl : IWICMetadataBlockReaderVtbl* do
    GUID = LibC::GUID.new(0xfeaa2a8d_u32, 0xb3f3_u16, 0x43e4_u16, StaticArray[0xb2_u8, 0x5c_u8, 0xd1_u8, 0xde_u8, 0x99_u8, 0xa_u8, 0x1a_u8, 0xe1_u8])
    def query_interface(this : IWICMetadataBlockReader*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICMetadataBlockReader*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICMetadataBlockReader*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_container_format(this : IWICMetadataBlockReader*, pguidContainerFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_container_format.call(this, pguidContainerFormat)
    end
    def get_count(this : IWICMetadataBlockReader*, pcCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, pcCount)
    end
    def get_reader_by_index(this : IWICMetadataBlockReader*, nIndex : UInt32, ppIMetadataReader : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_reader_by_index.call(this, nIndex, ppIMetadataReader)
    end
    def get_enumerator(this : IWICMetadataBlockReader*, ppIEnumMetadata : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enumerator.call(this, ppIEnumMetadata)
    end

  end

  @[Extern]
  record IWICMetadataBlockWriterVtbl,
    query_interface : Proc(IWICMetadataBlockWriter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICMetadataBlockWriter*, UInt32),
    release : Proc(IWICMetadataBlockWriter*, UInt32),
    get_container_format : Proc(IWICMetadataBlockWriter*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_count : Proc(IWICMetadataBlockWriter*, UInt32*, Win32cr::Foundation::HRESULT),
    get_reader_by_index : Proc(IWICMetadataBlockWriter*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_enumerator : Proc(IWICMetadataBlockWriter*, Void**, Win32cr::Foundation::HRESULT),
    initialize_from_block_reader : Proc(IWICMetadataBlockWriter*, Void*, Win32cr::Foundation::HRESULT),
    get_writer_by_index : Proc(IWICMetadataBlockWriter*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    add_writer : Proc(IWICMetadataBlockWriter*, Void*, Win32cr::Foundation::HRESULT),
    set_writer_by_index : Proc(IWICMetadataBlockWriter*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    remove_writer_by_index : Proc(IWICMetadataBlockWriter*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICMetadataBlockWriter, lpVtbl : IWICMetadataBlockWriterVtbl* do
    GUID = LibC::GUID.new(0x8fb9676_u32, 0xb444_u16, 0x41e8_u16, StaticArray[0x8d_u8, 0xbe_u8, 0x6a_u8, 0x53_u8, 0xa5_u8, 0x42_u8, 0xbf_u8, 0xf1_u8])
    def query_interface(this : IWICMetadataBlockWriter*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICMetadataBlockWriter*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICMetadataBlockWriter*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_container_format(this : IWICMetadataBlockWriter*, pguidContainerFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_container_format.call(this, pguidContainerFormat)
    end
    def get_count(this : IWICMetadataBlockWriter*, pcCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, pcCount)
    end
    def get_reader_by_index(this : IWICMetadataBlockWriter*, nIndex : UInt32, ppIMetadataReader : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_reader_by_index.call(this, nIndex, ppIMetadataReader)
    end
    def get_enumerator(this : IWICMetadataBlockWriter*, ppIEnumMetadata : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enumerator.call(this, ppIEnumMetadata)
    end
    def initialize_from_block_reader(this : IWICMetadataBlockWriter*, pIMDBlockReader : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_from_block_reader.call(this, pIMDBlockReader)
    end
    def get_writer_by_index(this : IWICMetadataBlockWriter*, nIndex : UInt32, ppIMetadataWriter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_writer_by_index.call(this, nIndex, ppIMetadataWriter)
    end
    def add_writer(this : IWICMetadataBlockWriter*, pIMetadataWriter : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_writer.call(this, pIMetadataWriter)
    end
    def set_writer_by_index(this : IWICMetadataBlockWriter*, nIndex : UInt32, pIMetadataWriter : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_writer_by_index.call(this, nIndex, pIMetadataWriter)
    end
    def remove_writer_by_index(this : IWICMetadataBlockWriter*, nIndex : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_writer_by_index.call(this, nIndex)
    end

  end

  @[Extern]
  record IWICMetadataReaderVtbl,
    query_interface : Proc(IWICMetadataReader*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICMetadataReader*, UInt32),
    release : Proc(IWICMetadataReader*, UInt32),
    get_metadata_format : Proc(IWICMetadataReader*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_metadata_handler_info : Proc(IWICMetadataReader*, Void**, Win32cr::Foundation::HRESULT),
    get_count : Proc(IWICMetadataReader*, UInt32*, Win32cr::Foundation::HRESULT),
    get_value_by_index : Proc(IWICMetadataReader*, UInt32, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    get_value : Proc(IWICMetadataReader*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    get_enumerator : Proc(IWICMetadataReader*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICMetadataReader, lpVtbl : IWICMetadataReaderVtbl* do
    GUID = LibC::GUID.new(0x9204fe99_u32, 0xd8fc_u16, 0x4fd5_u16, StaticArray[0xa0_u8, 0x1_u8, 0x95_u8, 0x36_u8, 0xb0_u8, 0x67_u8, 0xa8_u8, 0x99_u8])
    def query_interface(this : IWICMetadataReader*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICMetadataReader*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICMetadataReader*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_metadata_format(this : IWICMetadataReader*, pguidMetadataFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_metadata_format.call(this, pguidMetadataFormat)
    end
    def get_metadata_handler_info(this : IWICMetadataReader*, ppIHandler : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_metadata_handler_info.call(this, ppIHandler)
    end
    def get_count(this : IWICMetadataReader*, pcCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, pcCount)
    end
    def get_value_by_index(this : IWICMetadataReader*, nIndex : UInt32, pvarSchema : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pvarId : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pvarValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_value_by_index.call(this, nIndex, pvarSchema, pvarId, pvarValue)
    end
    def get_value(this : IWICMetadataReader*, pvarSchema : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pvarId : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pvarValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_value.call(this, pvarSchema, pvarId, pvarValue)
    end
    def get_enumerator(this : IWICMetadataReader*, ppIEnumMetadata : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enumerator.call(this, ppIEnumMetadata)
    end

  end

  @[Extern]
  record IWICMetadataWriterVtbl,
    query_interface : Proc(IWICMetadataWriter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICMetadataWriter*, UInt32),
    release : Proc(IWICMetadataWriter*, UInt32),
    get_metadata_format : Proc(IWICMetadataWriter*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_metadata_handler_info : Proc(IWICMetadataWriter*, Void**, Win32cr::Foundation::HRESULT),
    get_count : Proc(IWICMetadataWriter*, UInt32*, Win32cr::Foundation::HRESULT),
    get_value_by_index : Proc(IWICMetadataWriter*, UInt32, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    get_value : Proc(IWICMetadataWriter*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    get_enumerator : Proc(IWICMetadataWriter*, Void**, Win32cr::Foundation::HRESULT),
    set_value : Proc(IWICMetadataWriter*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    set_value_by_index : Proc(IWICMetadataWriter*, UInt32, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    remove_value : Proc(IWICMetadataWriter*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    remove_value_by_index : Proc(IWICMetadataWriter*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICMetadataWriter, lpVtbl : IWICMetadataWriterVtbl* do
    GUID = LibC::GUID.new(0xf7836e16_u32, 0x3be0_u16, 0x470b_u16, StaticArray[0x86_u8, 0xbb_u8, 0x16_u8, 0xd_u8, 0xa_u8, 0xec_u8, 0xd7_u8, 0xde_u8])
    def query_interface(this : IWICMetadataWriter*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICMetadataWriter*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICMetadataWriter*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_metadata_format(this : IWICMetadataWriter*, pguidMetadataFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_metadata_format.call(this, pguidMetadataFormat)
    end
    def get_metadata_handler_info(this : IWICMetadataWriter*, ppIHandler : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_metadata_handler_info.call(this, ppIHandler)
    end
    def get_count(this : IWICMetadataWriter*, pcCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, pcCount)
    end
    def get_value_by_index(this : IWICMetadataWriter*, nIndex : UInt32, pvarSchema : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pvarId : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pvarValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_value_by_index.call(this, nIndex, pvarSchema, pvarId, pvarValue)
    end
    def get_value(this : IWICMetadataWriter*, pvarSchema : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pvarId : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pvarValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_value.call(this, pvarSchema, pvarId, pvarValue)
    end
    def get_enumerator(this : IWICMetadataWriter*, ppIEnumMetadata : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enumerator.call(this, ppIEnumMetadata)
    end
    def set_value(this : IWICMetadataWriter*, pvarSchema : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pvarId : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pvarValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_value.call(this, pvarSchema, pvarId, pvarValue)
    end
    def set_value_by_index(this : IWICMetadataWriter*, nIndex : UInt32, pvarSchema : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pvarId : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pvarValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_value_by_index.call(this, nIndex, pvarSchema, pvarId, pvarValue)
    end
    def remove_value(this : IWICMetadataWriter*, pvarSchema : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pvarId : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_value.call(this, pvarSchema, pvarId)
    end
    def remove_value_by_index(this : IWICMetadataWriter*, nIndex : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_value_by_index.call(this, nIndex)
    end

  end

  @[Extern]
  record IWICStreamProviderVtbl,
    query_interface : Proc(IWICStreamProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICStreamProvider*, UInt32),
    release : Proc(IWICStreamProvider*, UInt32),
    get_stream : Proc(IWICStreamProvider*, Void**, Win32cr::Foundation::HRESULT),
    get_persist_options : Proc(IWICStreamProvider*, UInt32*, Win32cr::Foundation::HRESULT),
    get_preferred_vendor_guid : Proc(IWICStreamProvider*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    refresh_stream : Proc(IWICStreamProvider*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICStreamProvider, lpVtbl : IWICStreamProviderVtbl* do
    GUID = LibC::GUID.new(0x449494bc_u32, 0xb468_u16, 0x4927_u16, StaticArray[0x96_u8, 0xd7_u8, 0xba_u8, 0x90_u8, 0xd3_u8, 0x1a_u8, 0xb5_u8, 0x5_u8])
    def query_interface(this : IWICStreamProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICStreamProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICStreamProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_stream(this : IWICStreamProvider*, ppIStream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream.call(this, ppIStream)
    end
    def get_persist_options(this : IWICStreamProvider*, pdwPersistOptions : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_persist_options.call(this, pdwPersistOptions)
    end
    def get_preferred_vendor_guid(this : IWICStreamProvider*, pguidPreferredVendor : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_preferred_vendor_guid.call(this, pguidPreferredVendor)
    end
    def refresh_stream(this : IWICStreamProvider*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh_stream.call(this)
    end

  end

  @[Extern]
  record IWICPersistStreamVtbl,
    query_interface : Proc(IWICPersistStream*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICPersistStream*, UInt32),
    release : Proc(IWICPersistStream*, UInt32),
    get_class_id : Proc(IWICPersistStream*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    is_dirty : Proc(IWICPersistStream*, Win32cr::Foundation::HRESULT),
    load : Proc(IWICPersistStream*, Void*, Win32cr::Foundation::HRESULT),
    save : Proc(IWICPersistStream*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_size_max : Proc(IWICPersistStream*, Win32cr::Foundation::ULARGE_INTEGER*, Win32cr::Foundation::HRESULT),
    load_ex : Proc(IWICPersistStream*, Void*, LibC::GUID*, UInt32, Win32cr::Foundation::HRESULT),
    save_ex : Proc(IWICPersistStream*, Void*, UInt32, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICPersistStream, lpVtbl : IWICPersistStreamVtbl* do
    GUID = LibC::GUID.new(0x675040_u32, 0x6908_u16, 0x45f8_u16, StaticArray[0x86_u8, 0xa3_u8, 0x49_u8, 0xc7_u8, 0xdf_u8, 0xd6_u8, 0xd9_u8, 0xad_u8])
    def query_interface(this : IWICPersistStream*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICPersistStream*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICPersistStream*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_class_id(this : IWICPersistStream*, pClassID : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_id.call(this, pClassID)
    end
    def is_dirty(this : IWICPersistStream*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_dirty.call(this)
    end
    def load(this : IWICPersistStream*, pStm : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load.call(this, pStm)
    end
    def save(this : IWICPersistStream*, pStm : Void*, fClearDirty : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this, pStm, fClearDirty)
    end
    def get_size_max(this : IWICPersistStream*, pcbSize : Win32cr::Foundation::ULARGE_INTEGER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_size_max.call(this, pcbSize)
    end
    def load_ex(this : IWICPersistStream*, pIStream : Void*, pguidPreferredVendor : LibC::GUID*, dwPersistOptions : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_ex.call(this, pIStream, pguidPreferredVendor, dwPersistOptions)
    end
    def save_ex(this : IWICPersistStream*, pIStream : Void*, dwPersistOptions : UInt32, fClearDirty : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_ex.call(this, pIStream, dwPersistOptions, fClearDirty)
    end

  end

  @[Extern]
  record IWICMetadataHandlerInfoVtbl,
    query_interface : Proc(IWICMetadataHandlerInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICMetadataHandlerInfo*, UInt32),
    release : Proc(IWICMetadataHandlerInfo*, UInt32),
    get_component_type : Proc(IWICMetadataHandlerInfo*, Win32cr::Graphics::Imaging::WICComponentType*, Win32cr::Foundation::HRESULT),
    get_clsid : Proc(IWICMetadataHandlerInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_signing_status : Proc(IWICMetadataHandlerInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_author : Proc(IWICMetadataHandlerInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_vendor_guid : Proc(IWICMetadataHandlerInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_version : Proc(IWICMetadataHandlerInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_spec_version : Proc(IWICMetadataHandlerInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_friendly_name : Proc(IWICMetadataHandlerInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_metadata_format : Proc(IWICMetadataHandlerInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_container_formats : Proc(IWICMetadataHandlerInfo*, UInt32, LibC::GUID*, UInt32*, Win32cr::Foundation::HRESULT),
    get_device_manufacturer : Proc(IWICMetadataHandlerInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_device_models : Proc(IWICMetadataHandlerInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    does_require_full_stream : Proc(IWICMetadataHandlerInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    does_support_padding : Proc(IWICMetadataHandlerInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    does_require_fixed_size : Proc(IWICMetadataHandlerInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICMetadataHandlerInfo, lpVtbl : IWICMetadataHandlerInfoVtbl* do
    GUID = LibC::GUID.new(0xaba958bf_u32, 0xc672_u16, 0x44d1_u16, StaticArray[0x8d_u8, 0x61_u8, 0xce_u8, 0x6d_u8, 0xf2_u8, 0xe6_u8, 0x82_u8, 0xc2_u8])
    def query_interface(this : IWICMetadataHandlerInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICMetadataHandlerInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICMetadataHandlerInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_component_type(this : IWICMetadataHandlerInfo*, pType : Win32cr::Graphics::Imaging::WICComponentType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_component_type.call(this, pType)
    end
    def get_clsid(this : IWICMetadataHandlerInfo*, pclsid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clsid.call(this, pclsid)
    end
    def get_signing_status(this : IWICMetadataHandlerInfo*, pStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signing_status.call(this, pStatus)
    end
    def get_author(this : IWICMetadataHandlerInfo*, cchAuthor : UInt32, wzAuthor : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_author.call(this, cchAuthor, wzAuthor, pcchActual)
    end
    def get_vendor_guid(this : IWICMetadataHandlerInfo*, pguidVendor : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_vendor_guid.call(this, pguidVendor)
    end
    def get_version(this : IWICMetadataHandlerInfo*, cchVersion : UInt32, wzVersion : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version.call(this, cchVersion, wzVersion, pcchActual)
    end
    def get_spec_version(this : IWICMetadataHandlerInfo*, cchSpecVersion : UInt32, wzSpecVersion : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_spec_version.call(this, cchSpecVersion, wzSpecVersion, pcchActual)
    end
    def get_friendly_name(this : IWICMetadataHandlerInfo*, cchFriendlyName : UInt32, wzFriendlyName : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_friendly_name.call(this, cchFriendlyName, wzFriendlyName, pcchActual)
    end
    def get_metadata_format(this : IWICMetadataHandlerInfo*, pguidMetadataFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_metadata_format.call(this, pguidMetadataFormat)
    end
    def get_container_formats(this : IWICMetadataHandlerInfo*, cContainerFormats : UInt32, pguidContainerFormats : LibC::GUID*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_container_formats.call(this, cContainerFormats, pguidContainerFormats, pcchActual)
    end
    def get_device_manufacturer(this : IWICMetadataHandlerInfo*, cchDeviceManufacturer : UInt32, wzDeviceManufacturer : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_manufacturer.call(this, cchDeviceManufacturer, wzDeviceManufacturer, pcchActual)
    end
    def get_device_models(this : IWICMetadataHandlerInfo*, cchDeviceModels : UInt32, wzDeviceModels : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_models.call(this, cchDeviceModels, wzDeviceModels, pcchActual)
    end
    def does_require_full_stream(this : IWICMetadataHandlerInfo*, pfRequiresFullStream : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.does_require_full_stream.call(this, pfRequiresFullStream)
    end
    def does_support_padding(this : IWICMetadataHandlerInfo*, pfSupportsPadding : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.does_support_padding.call(this, pfSupportsPadding)
    end
    def does_require_fixed_size(this : IWICMetadataHandlerInfo*, pfFixedSize : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.does_require_fixed_size.call(this, pfFixedSize)
    end

  end

  @[Extern]
  record IWICMetadataReaderInfoVtbl,
    query_interface : Proc(IWICMetadataReaderInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICMetadataReaderInfo*, UInt32),
    release : Proc(IWICMetadataReaderInfo*, UInt32),
    get_component_type : Proc(IWICMetadataReaderInfo*, Win32cr::Graphics::Imaging::WICComponentType*, Win32cr::Foundation::HRESULT),
    get_clsid : Proc(IWICMetadataReaderInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_signing_status : Proc(IWICMetadataReaderInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_author : Proc(IWICMetadataReaderInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_vendor_guid : Proc(IWICMetadataReaderInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_version : Proc(IWICMetadataReaderInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_spec_version : Proc(IWICMetadataReaderInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_friendly_name : Proc(IWICMetadataReaderInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_metadata_format : Proc(IWICMetadataReaderInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_container_formats : Proc(IWICMetadataReaderInfo*, UInt32, LibC::GUID*, UInt32*, Win32cr::Foundation::HRESULT),
    get_device_manufacturer : Proc(IWICMetadataReaderInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_device_models : Proc(IWICMetadataReaderInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    does_require_full_stream : Proc(IWICMetadataReaderInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    does_support_padding : Proc(IWICMetadataReaderInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    does_require_fixed_size : Proc(IWICMetadataReaderInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_patterns : Proc(IWICMetadataReaderInfo*, LibC::GUID*, UInt32, Win32cr::Graphics::Imaging::WICMetadataPattern*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    matches_pattern : Proc(IWICMetadataReaderInfo*, LibC::GUID*, Void*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    create_instance : Proc(IWICMetadataReaderInfo*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICMetadataReaderInfo, lpVtbl : IWICMetadataReaderInfoVtbl* do
    GUID = LibC::GUID.new(0xeebf1f5b_u32, 0x7c1_u16, 0x4447_u16, StaticArray[0xa3_u8, 0xab_u8, 0x22_u8, 0xac_u8, 0xaf_u8, 0x78_u8, 0xa8_u8, 0x4_u8])
    def query_interface(this : IWICMetadataReaderInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICMetadataReaderInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICMetadataReaderInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_component_type(this : IWICMetadataReaderInfo*, pType : Win32cr::Graphics::Imaging::WICComponentType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_component_type.call(this, pType)
    end
    def get_clsid(this : IWICMetadataReaderInfo*, pclsid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clsid.call(this, pclsid)
    end
    def get_signing_status(this : IWICMetadataReaderInfo*, pStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signing_status.call(this, pStatus)
    end
    def get_author(this : IWICMetadataReaderInfo*, cchAuthor : UInt32, wzAuthor : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_author.call(this, cchAuthor, wzAuthor, pcchActual)
    end
    def get_vendor_guid(this : IWICMetadataReaderInfo*, pguidVendor : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_vendor_guid.call(this, pguidVendor)
    end
    def get_version(this : IWICMetadataReaderInfo*, cchVersion : UInt32, wzVersion : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version.call(this, cchVersion, wzVersion, pcchActual)
    end
    def get_spec_version(this : IWICMetadataReaderInfo*, cchSpecVersion : UInt32, wzSpecVersion : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_spec_version.call(this, cchSpecVersion, wzSpecVersion, pcchActual)
    end
    def get_friendly_name(this : IWICMetadataReaderInfo*, cchFriendlyName : UInt32, wzFriendlyName : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_friendly_name.call(this, cchFriendlyName, wzFriendlyName, pcchActual)
    end
    def get_metadata_format(this : IWICMetadataReaderInfo*, pguidMetadataFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_metadata_format.call(this, pguidMetadataFormat)
    end
    def get_container_formats(this : IWICMetadataReaderInfo*, cContainerFormats : UInt32, pguidContainerFormats : LibC::GUID*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_container_formats.call(this, cContainerFormats, pguidContainerFormats, pcchActual)
    end
    def get_device_manufacturer(this : IWICMetadataReaderInfo*, cchDeviceManufacturer : UInt32, wzDeviceManufacturer : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_manufacturer.call(this, cchDeviceManufacturer, wzDeviceManufacturer, pcchActual)
    end
    def get_device_models(this : IWICMetadataReaderInfo*, cchDeviceModels : UInt32, wzDeviceModels : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_models.call(this, cchDeviceModels, wzDeviceModels, pcchActual)
    end
    def does_require_full_stream(this : IWICMetadataReaderInfo*, pfRequiresFullStream : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.does_require_full_stream.call(this, pfRequiresFullStream)
    end
    def does_support_padding(this : IWICMetadataReaderInfo*, pfSupportsPadding : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.does_support_padding.call(this, pfSupportsPadding)
    end
    def does_require_fixed_size(this : IWICMetadataReaderInfo*, pfFixedSize : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.does_require_fixed_size.call(this, pfFixedSize)
    end
    def get_patterns(this : IWICMetadataReaderInfo*, guidContainerFormat : LibC::GUID*, cbSize : UInt32, pPattern : Win32cr::Graphics::Imaging::WICMetadataPattern*, pcCount : UInt32*, pcbActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_patterns.call(this, guidContainerFormat, cbSize, pPattern, pcCount, pcbActual)
    end
    def matches_pattern(this : IWICMetadataReaderInfo*, guidContainerFormat : LibC::GUID*, pIStream : Void*, pfMatches : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.matches_pattern.call(this, guidContainerFormat, pIStream, pfMatches)
    end
    def create_instance(this : IWICMetadataReaderInfo*, ppIReader : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_instance.call(this, ppIReader)
    end

  end

  @[Extern]
  record IWICMetadataWriterInfoVtbl,
    query_interface : Proc(IWICMetadataWriterInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICMetadataWriterInfo*, UInt32),
    release : Proc(IWICMetadataWriterInfo*, UInt32),
    get_component_type : Proc(IWICMetadataWriterInfo*, Win32cr::Graphics::Imaging::WICComponentType*, Win32cr::Foundation::HRESULT),
    get_clsid : Proc(IWICMetadataWriterInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_signing_status : Proc(IWICMetadataWriterInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_author : Proc(IWICMetadataWriterInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_vendor_guid : Proc(IWICMetadataWriterInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_version : Proc(IWICMetadataWriterInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_spec_version : Proc(IWICMetadataWriterInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_friendly_name : Proc(IWICMetadataWriterInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_metadata_format : Proc(IWICMetadataWriterInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_container_formats : Proc(IWICMetadataWriterInfo*, UInt32, LibC::GUID*, UInt32*, Win32cr::Foundation::HRESULT),
    get_device_manufacturer : Proc(IWICMetadataWriterInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_device_models : Proc(IWICMetadataWriterInfo*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    does_require_full_stream : Proc(IWICMetadataWriterInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    does_support_padding : Proc(IWICMetadataWriterInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    does_require_fixed_size : Proc(IWICMetadataWriterInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_header : Proc(IWICMetadataWriterInfo*, LibC::GUID*, UInt32, Win32cr::Graphics::Imaging::WICMetadataHeader*, UInt32*, Win32cr::Foundation::HRESULT),
    create_instance : Proc(IWICMetadataWriterInfo*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICMetadataWriterInfo, lpVtbl : IWICMetadataWriterInfoVtbl* do
    GUID = LibC::GUID.new(0xb22e3fba_u32, 0x3925_u16, 0x4323_u16, StaticArray[0xb5_u8, 0xc1_u8, 0x9e_u8, 0xbf_u8, 0xc4_u8, 0x30_u8, 0xf2_u8, 0x36_u8])
    def query_interface(this : IWICMetadataWriterInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICMetadataWriterInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICMetadataWriterInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_component_type(this : IWICMetadataWriterInfo*, pType : Win32cr::Graphics::Imaging::WICComponentType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_component_type.call(this, pType)
    end
    def get_clsid(this : IWICMetadataWriterInfo*, pclsid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clsid.call(this, pclsid)
    end
    def get_signing_status(this : IWICMetadataWriterInfo*, pStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signing_status.call(this, pStatus)
    end
    def get_author(this : IWICMetadataWriterInfo*, cchAuthor : UInt32, wzAuthor : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_author.call(this, cchAuthor, wzAuthor, pcchActual)
    end
    def get_vendor_guid(this : IWICMetadataWriterInfo*, pguidVendor : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_vendor_guid.call(this, pguidVendor)
    end
    def get_version(this : IWICMetadataWriterInfo*, cchVersion : UInt32, wzVersion : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version.call(this, cchVersion, wzVersion, pcchActual)
    end
    def get_spec_version(this : IWICMetadataWriterInfo*, cchSpecVersion : UInt32, wzSpecVersion : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_spec_version.call(this, cchSpecVersion, wzSpecVersion, pcchActual)
    end
    def get_friendly_name(this : IWICMetadataWriterInfo*, cchFriendlyName : UInt32, wzFriendlyName : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_friendly_name.call(this, cchFriendlyName, wzFriendlyName, pcchActual)
    end
    def get_metadata_format(this : IWICMetadataWriterInfo*, pguidMetadataFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_metadata_format.call(this, pguidMetadataFormat)
    end
    def get_container_formats(this : IWICMetadataWriterInfo*, cContainerFormats : UInt32, pguidContainerFormats : LibC::GUID*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_container_formats.call(this, cContainerFormats, pguidContainerFormats, pcchActual)
    end
    def get_device_manufacturer(this : IWICMetadataWriterInfo*, cchDeviceManufacturer : UInt32, wzDeviceManufacturer : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_manufacturer.call(this, cchDeviceManufacturer, wzDeviceManufacturer, pcchActual)
    end
    def get_device_models(this : IWICMetadataWriterInfo*, cchDeviceModels : UInt32, wzDeviceModels : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_models.call(this, cchDeviceModels, wzDeviceModels, pcchActual)
    end
    def does_require_full_stream(this : IWICMetadataWriterInfo*, pfRequiresFullStream : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.does_require_full_stream.call(this, pfRequiresFullStream)
    end
    def does_support_padding(this : IWICMetadataWriterInfo*, pfSupportsPadding : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.does_support_padding.call(this, pfSupportsPadding)
    end
    def does_require_fixed_size(this : IWICMetadataWriterInfo*, pfFixedSize : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.does_require_fixed_size.call(this, pfFixedSize)
    end
    def get_header(this : IWICMetadataWriterInfo*, guidContainerFormat : LibC::GUID*, cbSize : UInt32, pHeader : Win32cr::Graphics::Imaging::WICMetadataHeader*, pcbActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_header.call(this, guidContainerFormat, cbSize, pHeader, pcbActual)
    end
    def create_instance(this : IWICMetadataWriterInfo*, ppIWriter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_instance.call(this, ppIWriter)
    end

  end

  @[Extern]
  record IWICComponentFactoryVtbl,
    query_interface : Proc(IWICComponentFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICComponentFactory*, UInt32),
    release : Proc(IWICComponentFactory*, UInt32),
    create_decoder_from_filename : Proc(IWICComponentFactory*, Win32cr::Foundation::PWSTR, LibC::GUID*, UInt32, Win32cr::Graphics::Imaging::WICDecodeOptions, Void**, Win32cr::Foundation::HRESULT),
    create_decoder_from_stream : Proc(IWICComponentFactory*, Void*, LibC::GUID*, Win32cr::Graphics::Imaging::WICDecodeOptions, Void**, Win32cr::Foundation::HRESULT),
    create_decoder_from_file_handle : Proc(IWICComponentFactory*, LibC::UIntPtrT, LibC::GUID*, Win32cr::Graphics::Imaging::WICDecodeOptions, Void**, Win32cr::Foundation::HRESULT),
    create_component_info : Proc(IWICComponentFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    create_decoder : Proc(IWICComponentFactory*, LibC::GUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    create_encoder : Proc(IWICComponentFactory*, LibC::GUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    create_palette : Proc(IWICComponentFactory*, Void**, Win32cr::Foundation::HRESULT),
    create_format_converter : Proc(IWICComponentFactory*, Void**, Win32cr::Foundation::HRESULT),
    create_bitmap_scaler : Proc(IWICComponentFactory*, Void**, Win32cr::Foundation::HRESULT),
    create_bitmap_clipper : Proc(IWICComponentFactory*, Void**, Win32cr::Foundation::HRESULT),
    create_bitmap_flip_rotator : Proc(IWICComponentFactory*, Void**, Win32cr::Foundation::HRESULT),
    create_stream : Proc(IWICComponentFactory*, Void**, Win32cr::Foundation::HRESULT),
    create_color_context : Proc(IWICComponentFactory*, Void**, Win32cr::Foundation::HRESULT),
    create_color_transformer : Proc(IWICComponentFactory*, Void**, Win32cr::Foundation::HRESULT),
    create_bitmap : Proc(IWICComponentFactory*, UInt32, UInt32, LibC::GUID*, Win32cr::Graphics::Imaging::WICBitmapCreateCacheOption, Void**, Win32cr::Foundation::HRESULT),
    create_bitmap_from_source : Proc(IWICComponentFactory*, Void*, Win32cr::Graphics::Imaging::WICBitmapCreateCacheOption, Void**, Win32cr::Foundation::HRESULT),
    create_bitmap_from_source_rect : Proc(IWICComponentFactory*, Void*, UInt32, UInt32, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    create_bitmap_from_memory : Proc(IWICComponentFactory*, UInt32, UInt32, LibC::GUID*, UInt32, UInt32, UInt8*, Void**, Win32cr::Foundation::HRESULT),
    create_bitmap_from_hbitmap : Proc(IWICComponentFactory*, Win32cr::Graphics::Gdi::HBITMAP, Win32cr::Graphics::Gdi::HPALETTE, Win32cr::Graphics::Imaging::WICBitmapAlphaChannelOption, Void**, Win32cr::Foundation::HRESULT),
    create_bitmap_from_hicon : Proc(IWICComponentFactory*, Win32cr::UI::WindowsAndMessaging::HICON, Void**, Win32cr::Foundation::HRESULT),
    create_component_enumerator : Proc(IWICComponentFactory*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    create_fast_metadata_encoder_from_decoder : Proc(IWICComponentFactory*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_fast_metadata_encoder_from_frame_decode : Proc(IWICComponentFactory*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_query_writer : Proc(IWICComponentFactory*, LibC::GUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    create_query_writer_from_reader : Proc(IWICComponentFactory*, Void*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    create_metadata_reader : Proc(IWICComponentFactory*, LibC::GUID*, LibC::GUID*, UInt32, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_metadata_reader_from_container : Proc(IWICComponentFactory*, LibC::GUID*, LibC::GUID*, UInt32, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_metadata_writer : Proc(IWICComponentFactory*, LibC::GUID*, LibC::GUID*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    create_metadata_writer_from_reader : Proc(IWICComponentFactory*, Void*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    create_query_reader_from_block_reader : Proc(IWICComponentFactory*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_query_writer_from_block_writer : Proc(IWICComponentFactory*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_encoder_property_bag : Proc(IWICComponentFactory*, Win32cr::System::Com::StructuredStorage::PROPBAG2*, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICComponentFactory, lpVtbl : IWICComponentFactoryVtbl* do
    GUID = LibC::GUID.new(0x412d0c3a_u32, 0x9650_u16, 0x44fa_u16, StaticArray[0xaf_u8, 0x5b_u8, 0xdd_u8, 0x2a_u8, 0x6_u8, 0xc8_u8, 0xe8_u8, 0xfb_u8])
    def query_interface(this : IWICComponentFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICComponentFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICComponentFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_decoder_from_filename(this : IWICComponentFactory*, wzFilename : Win32cr::Foundation::PWSTR, pguidVendor : LibC::GUID*, dwDesiredAccess : UInt32, metadataOptions : Win32cr::Graphics::Imaging::WICDecodeOptions, ppIDecoder : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_decoder_from_filename.call(this, wzFilename, pguidVendor, dwDesiredAccess, metadataOptions, ppIDecoder)
    end
    def create_decoder_from_stream(this : IWICComponentFactory*, pIStream : Void*, pguidVendor : LibC::GUID*, metadataOptions : Win32cr::Graphics::Imaging::WICDecodeOptions, ppIDecoder : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_decoder_from_stream.call(this, pIStream, pguidVendor, metadataOptions, ppIDecoder)
    end
    def create_decoder_from_file_handle(this : IWICComponentFactory*, hFile : LibC::UIntPtrT, pguidVendor : LibC::GUID*, metadataOptions : Win32cr::Graphics::Imaging::WICDecodeOptions, ppIDecoder : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_decoder_from_file_handle.call(this, hFile, pguidVendor, metadataOptions, ppIDecoder)
    end
    def create_component_info(this : IWICComponentFactory*, clsidComponent : LibC::GUID*, ppIInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_component_info.call(this, clsidComponent, ppIInfo)
    end
    def create_decoder(this : IWICComponentFactory*, guidContainerFormat : LibC::GUID*, pguidVendor : LibC::GUID*, ppIDecoder : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_decoder.call(this, guidContainerFormat, pguidVendor, ppIDecoder)
    end
    def create_encoder(this : IWICComponentFactory*, guidContainerFormat : LibC::GUID*, pguidVendor : LibC::GUID*, ppIEncoder : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_encoder.call(this, guidContainerFormat, pguidVendor, ppIEncoder)
    end
    def create_palette(this : IWICComponentFactory*, ppIPalette : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_palette.call(this, ppIPalette)
    end
    def create_format_converter(this : IWICComponentFactory*, ppIFormatConverter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_format_converter.call(this, ppIFormatConverter)
    end
    def create_bitmap_scaler(this : IWICComponentFactory*, ppIBitmapScaler : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_bitmap_scaler.call(this, ppIBitmapScaler)
    end
    def create_bitmap_clipper(this : IWICComponentFactory*, ppIBitmapClipper : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_bitmap_clipper.call(this, ppIBitmapClipper)
    end
    def create_bitmap_flip_rotator(this : IWICComponentFactory*, ppIBitmapFlipRotator : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_bitmap_flip_rotator.call(this, ppIBitmapFlipRotator)
    end
    def create_stream(this : IWICComponentFactory*, ppIWICStream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_stream.call(this, ppIWICStream)
    end
    def create_color_context(this : IWICComponentFactory*, ppIWICColorContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_color_context.call(this, ppIWICColorContext)
    end
    def create_color_transformer(this : IWICComponentFactory*, ppIWICColorTransform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_color_transformer.call(this, ppIWICColorTransform)
    end
    def create_bitmap(this : IWICComponentFactory*, uiWidth : UInt32, uiHeight : UInt32, pixelFormat : LibC::GUID*, option : Win32cr::Graphics::Imaging::WICBitmapCreateCacheOption, ppIBitmap : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_bitmap.call(this, uiWidth, uiHeight, pixelFormat, option, ppIBitmap)
    end
    def create_bitmap_from_source(this : IWICComponentFactory*, pIBitmapSource : Void*, option : Win32cr::Graphics::Imaging::WICBitmapCreateCacheOption, ppIBitmap : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_bitmap_from_source.call(this, pIBitmapSource, option, ppIBitmap)
    end
    def create_bitmap_from_source_rect(this : IWICComponentFactory*, pIBitmapSource : Void*, x : UInt32, y : UInt32, width : UInt32, height : UInt32, ppIBitmap : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_bitmap_from_source_rect.call(this, pIBitmapSource, x, y, width, height, ppIBitmap)
    end
    def create_bitmap_from_memory(this : IWICComponentFactory*, uiWidth : UInt32, uiHeight : UInt32, pixelFormat : LibC::GUID*, cbStride : UInt32, cbBufferSize : UInt32, pbBuffer : UInt8*, ppIBitmap : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_bitmap_from_memory.call(this, uiWidth, uiHeight, pixelFormat, cbStride, cbBufferSize, pbBuffer, ppIBitmap)
    end
    def create_bitmap_from_hbitmap(this : IWICComponentFactory*, hBitmap : Win32cr::Graphics::Gdi::HBITMAP, hPalette : Win32cr::Graphics::Gdi::HPALETTE, options : Win32cr::Graphics::Imaging::WICBitmapAlphaChannelOption, ppIBitmap : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_bitmap_from_hbitmap.call(this, hBitmap, hPalette, options, ppIBitmap)
    end
    def create_bitmap_from_hicon(this : IWICComponentFactory*, hIcon : Win32cr::UI::WindowsAndMessaging::HICON, ppIBitmap : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_bitmap_from_hicon.call(this, hIcon, ppIBitmap)
    end
    def create_component_enumerator(this : IWICComponentFactory*, componentTypes : UInt32, options : UInt32, ppIEnumUnknown : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_component_enumerator.call(this, componentTypes, options, ppIEnumUnknown)
    end
    def create_fast_metadata_encoder_from_decoder(this : IWICComponentFactory*, pIDecoder : Void*, ppIFastEncoder : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_fast_metadata_encoder_from_decoder.call(this, pIDecoder, ppIFastEncoder)
    end
    def create_fast_metadata_encoder_from_frame_decode(this : IWICComponentFactory*, pIFrameDecoder : Void*, ppIFastEncoder : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_fast_metadata_encoder_from_frame_decode.call(this, pIFrameDecoder, ppIFastEncoder)
    end
    def create_query_writer(this : IWICComponentFactory*, guidMetadataFormat : LibC::GUID*, pguidVendor : LibC::GUID*, ppIQueryWriter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_query_writer.call(this, guidMetadataFormat, pguidVendor, ppIQueryWriter)
    end
    def create_query_writer_from_reader(this : IWICComponentFactory*, pIQueryReader : Void*, pguidVendor : LibC::GUID*, ppIQueryWriter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_query_writer_from_reader.call(this, pIQueryReader, pguidVendor, ppIQueryWriter)
    end
    def create_metadata_reader(this : IWICComponentFactory*, guidMetadataFormat : LibC::GUID*, pguidVendor : LibC::GUID*, dwOptions : UInt32, pIStream : Void*, ppIReader : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_metadata_reader.call(this, guidMetadataFormat, pguidVendor, dwOptions, pIStream, ppIReader)
    end
    def create_metadata_reader_from_container(this : IWICComponentFactory*, guidContainerFormat : LibC::GUID*, pguidVendor : LibC::GUID*, dwOptions : UInt32, pIStream : Void*, ppIReader : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_metadata_reader_from_container.call(this, guidContainerFormat, pguidVendor, dwOptions, pIStream, ppIReader)
    end
    def create_metadata_writer(this : IWICComponentFactory*, guidMetadataFormat : LibC::GUID*, pguidVendor : LibC::GUID*, dwMetadataOptions : UInt32, ppIWriter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_metadata_writer.call(this, guidMetadataFormat, pguidVendor, dwMetadataOptions, ppIWriter)
    end
    def create_metadata_writer_from_reader(this : IWICComponentFactory*, pIReader : Void*, pguidVendor : LibC::GUID*, ppIWriter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_metadata_writer_from_reader.call(this, pIReader, pguidVendor, ppIWriter)
    end
    def create_query_reader_from_block_reader(this : IWICComponentFactory*, pIBlockReader : Void*, ppIQueryReader : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_query_reader_from_block_reader.call(this, pIBlockReader, ppIQueryReader)
    end
    def create_query_writer_from_block_writer(this : IWICComponentFactory*, pIBlockWriter : Void*, ppIQueryWriter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_query_writer_from_block_writer.call(this, pIBlockWriter, ppIQueryWriter)
    end
    def create_encoder_property_bag(this : IWICComponentFactory*, ppropOptions : Win32cr::System::Com::StructuredStorage::PROPBAG2*, cCount : UInt32, ppIPropertyBag : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_encoder_property_bag.call(this, ppropOptions, cCount, ppIPropertyBag)
    end

  end

  @[Link("windowscodecs")]
  lib C
    fun WICConvertBitmapSource(dstFormat : LibC::GUID*, pISrc : Void*, ppIDst : Void**) : Win32cr::Foundation::HRESULT

    fun WICCreateBitmapFromSection(width : UInt32, height : UInt32, pixelFormat : LibC::GUID*, hSection : Win32cr::Foundation::HANDLE, stride : UInt32, offset : UInt32, ppIBitmap : Void**) : Win32cr::Foundation::HRESULT

    fun WICCreateBitmapFromSectionEx(width : UInt32, height : UInt32, pixelFormat : LibC::GUID*, hSection : Win32cr::Foundation::HANDLE, stride : UInt32, offset : UInt32, desiredAccessLevel : Win32cr::Graphics::Imaging::WICSectionAccessLevel, ppIBitmap : Void**) : Win32cr::Foundation::HRESULT

    fun WICMapGuidToShortName(guid : LibC::GUID*, cchName : UInt32, wzName : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT

    fun WICMapShortNameToGuid(wzName : Win32cr::Foundation::PWSTR, pguid : LibC::GUID*) : Win32cr::Foundation::HRESULT

    fun WICMapSchemaToName(guidMetadataFormat : LibC::GUID*, pwzSchema : Win32cr::Foundation::PWSTR, cchName : UInt32, wzName : UInt16*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT

    fun WICMatchMetadataContent(guidContainerFormat : LibC::GUID*, pguidVendor : LibC::GUID*, pIStream : Void*, pguidMetadataFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT

    fun WICSerializeMetadataContent(guidContainerFormat : LibC::GUID*, pIWriter : Void*, dwPersistOptions : UInt32, pIStream : Void*) : Win32cr::Foundation::HRESULT

    fun WICGetMetadataContentSize(guidContainerFormat : LibC::GUID*, pIWriter : Void*, pcbSize : Win32cr::Foundation::ULARGE_INTEGER*) : Win32cr::Foundation::HRESULT

  end
end