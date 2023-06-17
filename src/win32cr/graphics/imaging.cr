require "../foundation.cr"
require "../graphics/direct2d/common.cr"
require "../system/com.cr"
require "../system/com/structuredstorage.cr"
require "../graphics/gdi.cr"
require "../ui/windowsandmessaging.cr"
require "../graphics/dxgi/common.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:windowscodecs.dll")]
{% else %}
@[Link("windowscodecs")]
{% end %}
lib LibWin32
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

  alias PFNProgressNotification = Proc(Void*, UInt32, WICProgressOperation, Float64, HRESULT)


  enum WICColorContextType : Int32
    WICColorContextUninitialized = 0
    WICColorContextProfile = 1
    WICColorContextExifColorSpace = 2
  end

  enum WICBitmapCreateCacheOption : Int32
    WICBitmapNoCache = 0
    WICBitmapCacheOnDemand = 1
    WICBitmapCacheOnLoad = 2
    WICBITMAPCREATECACHEOPTION_FORCE_DWORD = 2147483647
  end

  enum WICDecodeOptions : Int32
    WICDecodeMetadataCacheOnDemand = 0
    WICDecodeMetadataCacheOnLoad = 1
    WICMETADATACACHEOPTION_FORCE_DWORD = 2147483647
  end

  enum WICBitmapEncoderCacheOption : Int32
    WICBitmapEncoderCacheInMemory = 0
    WICBitmapEncoderCacheTempFile = 1
    WICBitmapEncoderNoCache = 2
    WICBITMAPENCODERCACHEOPTION_FORCE_DWORD = 2147483647
  end

  enum WICComponentType : Int32
    WICDecoder = 1
    WICEncoder = 2
    WICPixelFormatConverter = 4
    WICMetadataReader = 8
    WICMetadataWriter = 16
    WICPixelFormat = 32
    WICAllComponents = 63
    WICCOMPONENTTYPE_FORCE_DWORD = 2147483647
  end

  enum WICComponentEnumerateOptions : Int32
    WICComponentEnumerateDefault = 0
    WICComponentEnumerateRefresh = 1
    WICComponentEnumerateDisabled = -2147483648
    WICComponentEnumerateUnsigned = 1073741824
    WICComponentEnumerateBuiltInOnly = 536870912
    WICCOMPONENTENUMERATEOPTIONS_FORCE_DWORD = 2147483647
  end

  enum WICBitmapInterpolationMode : Int32
    WICBitmapInterpolationModeNearestNeighbor = 0
    WICBitmapInterpolationModeLinear = 1
    WICBitmapInterpolationModeCubic = 2
    WICBitmapInterpolationModeFant = 3
    WICBitmapInterpolationModeHighQualityCubic = 4
    WICBITMAPINTERPOLATIONMODE_FORCE_DWORD = 2147483647
  end

  enum WICBitmapPaletteType : Int32
    WICBitmapPaletteTypeCustom = 0
    WICBitmapPaletteTypeMedianCut = 1
    WICBitmapPaletteTypeFixedBW = 2
    WICBitmapPaletteTypeFixedHalftone8 = 3
    WICBitmapPaletteTypeFixedHalftone27 = 4
    WICBitmapPaletteTypeFixedHalftone64 = 5
    WICBitmapPaletteTypeFixedHalftone125 = 6
    WICBitmapPaletteTypeFixedHalftone216 = 7
    WICBitmapPaletteTypeFixedWebPalette = 7
    WICBitmapPaletteTypeFixedHalftone252 = 8
    WICBitmapPaletteTypeFixedHalftone256 = 9
    WICBitmapPaletteTypeFixedGray4 = 10
    WICBitmapPaletteTypeFixedGray16 = 11
    WICBitmapPaletteTypeFixedGray256 = 12
    WICBITMAPPALETTETYPE_FORCE_DWORD = 2147483647
  end

  enum WICBitmapDitherType : Int32
    WICBitmapDitherTypeNone = 0
    WICBitmapDitherTypeSolid = 0
    WICBitmapDitherTypeOrdered4x4 = 1
    WICBitmapDitherTypeOrdered8x8 = 2
    WICBitmapDitherTypeOrdered16x16 = 3
    WICBitmapDitherTypeSpiral4x4 = 4
    WICBitmapDitherTypeSpiral8x8 = 5
    WICBitmapDitherTypeDualSpiral4x4 = 6
    WICBitmapDitherTypeDualSpiral8x8 = 7
    WICBitmapDitherTypeErrorDiffusion = 8
    WICBITMAPDITHERTYPE_FORCE_DWORD = 2147483647
  end

  enum WICBitmapAlphaChannelOption : Int32
    WICBitmapUseAlpha = 0
    WICBitmapUsePremultipliedAlpha = 1
    WICBitmapIgnoreAlpha = 2
    WICBITMAPALPHACHANNELOPTIONS_FORCE_DWORD = 2147483647
  end

  enum WICBitmapTransformOptions : Int32
    WICBitmapTransformRotate0 = 0
    WICBitmapTransformRotate90 = 1
    WICBitmapTransformRotate180 = 2
    WICBitmapTransformRotate270 = 3
    WICBitmapTransformFlipHorizontal = 8
    WICBitmapTransformFlipVertical = 16
    WICBITMAPTRANSFORMOPTIONS_FORCE_DWORD = 2147483647
  end

  enum WICBitmapLockFlags : Int32
    WICBitmapLockRead = 1
    WICBitmapLockWrite = 2
    WICBITMAPLOCKFLAGS_FORCE_DWORD = 2147483647
  end

  enum WICBitmapDecoderCapabilities : Int32
    WICBitmapDecoderCapabilitySameEncoder = 1
    WICBitmapDecoderCapabilityCanDecodeAllImages = 2
    WICBitmapDecoderCapabilityCanDecodeSomeImages = 4
    WICBitmapDecoderCapabilityCanEnumerateMetadata = 8
    WICBitmapDecoderCapabilityCanDecodeThumbnail = 16
    WICBITMAPDECODERCAPABILITIES_FORCE_DWORD = 2147483647
  end

  enum WICProgressOperation : Int32
    WICProgressOperationCopyPixels = 1
    WICProgressOperationWritePixels = 2
    WICProgressOperationAll = 65535
    WICPROGRESSOPERATION_FORCE_DWORD = 2147483647
  end

  enum WICProgressNotification : Int32
    WICProgressNotificationBegin = 65536
    WICProgressNotificationEnd = 131072
    WICProgressNotificationFrequent = 262144
    WICProgressNotificationAll = -65536
    WICPROGRESSNOTIFICATION_FORCE_DWORD = 2147483647
  end

  enum WICComponentSigning : Int32
    WICComponentSigned = 1
    WICComponentUnsigned = 2
    WICComponentSafe = 4
    WICComponentDisabled = -2147483648
    WICCOMPONENTSIGNING_FORCE_DWORD = 2147483647
  end

  enum WICGifLogicalScreenDescriptorProperties : UInt32
    WICGifLogicalScreenSignature = 1
    WICGifLogicalScreenDescriptorWidth = 2
    WICGifLogicalScreenDescriptorHeight = 3
    WICGifLogicalScreenDescriptorGlobalColorTableFlag = 4
    WICGifLogicalScreenDescriptorColorResolution = 5
    WICGifLogicalScreenDescriptorSortFlag = 6
    WICGifLogicalScreenDescriptorGlobalColorTableSize = 7
    WICGifLogicalScreenDescriptorBackgroundColorIndex = 8
    WICGifLogicalScreenDescriptorPixelAspectRatio = 9
    WICGifLogicalScreenDescriptorProperties_FORCE_DWORD = 2147483647
  end

  enum WICGifImageDescriptorProperties : UInt32
    WICGifImageDescriptorLeft = 1
    WICGifImageDescriptorTop = 2
    WICGifImageDescriptorWidth = 3
    WICGifImageDescriptorHeight = 4
    WICGifImageDescriptorLocalColorTableFlag = 5
    WICGifImageDescriptorInterlaceFlag = 6
    WICGifImageDescriptorSortFlag = 7
    WICGifImageDescriptorLocalColorTableSize = 8
    WICGifImageDescriptorProperties_FORCE_DWORD = 2147483647
  end

  enum WICGifGraphicControlExtensionProperties : UInt32
    WICGifGraphicControlExtensionDisposal = 1
    WICGifGraphicControlExtensionUserInputFlag = 2
    WICGifGraphicControlExtensionTransparencyFlag = 3
    WICGifGraphicControlExtensionDelay = 4
    WICGifGraphicControlExtensionTransparentColorIndex = 5
    WICGifGraphicControlExtensionProperties_FORCE_DWORD = 2147483647
  end

  enum WICGifApplicationExtensionProperties : UInt32
    WICGifApplicationExtensionApplication = 1
    WICGifApplicationExtensionData = 2
    WICGifApplicationExtensionProperties_FORCE_DWORD = 2147483647
  end

  enum WICGifCommentExtensionProperties : UInt32
    WICGifCommentExtensionText = 1
    WICGifCommentExtensionProperties_FORCE_DWORD = 2147483647
  end

  enum WICJpegCommentProperties : UInt32
    WICJpegCommentText = 1
    WICJpegCommentProperties_FORCE_DWORD = 2147483647
  end

  enum WICJpegLuminanceProperties : UInt32
    WICJpegLuminanceTable = 1
    WICJpegLuminanceProperties_FORCE_DWORD = 2147483647
  end

  enum WICJpegChrominanceProperties : UInt32
    WICJpegChrominanceTable = 1
    WICJpegChrominanceProperties_FORCE_DWORD = 2147483647
  end

  enum WIC8BIMIptcProperties : UInt32
    WIC8BIMIptcPString = 0
    WIC8BIMIptcEmbeddedIPTC = 1
    WIC8BIMIptcProperties_FORCE_DWORD = 2147483647
  end

  enum WIC8BIMResolutionInfoProperties : UInt32
    WIC8BIMResolutionInfoPString = 1
    WIC8BIMResolutionInfoHResolution = 2
    WIC8BIMResolutionInfoHResolutionUnit = 3
    WIC8BIMResolutionInfoWidthUnit = 4
    WIC8BIMResolutionInfoVResolution = 5
    WIC8BIMResolutionInfoVResolutionUnit = 6
    WIC8BIMResolutionInfoHeightUnit = 7
    WIC8BIMResolutionInfoProperties_FORCE_DWORD = 2147483647
  end

  enum WIC8BIMIptcDigestProperties : UInt32
    WIC8BIMIptcDigestPString = 1
    WIC8BIMIptcDigestIptcDigest = 2
    WIC8BIMIptcDigestProperties_FORCE_DWORD = 2147483647
  end

  enum WICPngGamaProperties : UInt32
    WICPngGamaGamma = 1
    WICPngGamaProperties_FORCE_DWORD = 2147483647
  end

  enum WICPngBkgdProperties : UInt32
    WICPngBkgdBackgroundColor = 1
    WICPngBkgdProperties_FORCE_DWORD = 2147483647
  end

  enum WICPngItxtProperties : UInt32
    WICPngItxtKeyword = 1
    WICPngItxtCompressionFlag = 2
    WICPngItxtLanguageTag = 3
    WICPngItxtTranslatedKeyword = 4
    WICPngItxtText = 5
    WICPngItxtProperties_FORCE_DWORD = 2147483647
  end

  enum WICPngChrmProperties : UInt32
    WICPngChrmWhitePointX = 1
    WICPngChrmWhitePointY = 2
    WICPngChrmRedX = 3
    WICPngChrmRedY = 4
    WICPngChrmGreenX = 5
    WICPngChrmGreenY = 6
    WICPngChrmBlueX = 7
    WICPngChrmBlueY = 8
    WICPngChrmProperties_FORCE_DWORD = 2147483647
  end

  enum WICPngHistProperties : UInt32
    WICPngHistFrequencies = 1
    WICPngHistProperties_FORCE_DWORD = 2147483647
  end

  enum WICPngIccpProperties : UInt32
    WICPngIccpProfileName = 1
    WICPngIccpProfileData = 2
    WICPngIccpProperties_FORCE_DWORD = 2147483647
  end

  enum WICPngSrgbProperties : UInt32
    WICPngSrgbRenderingIntent = 1
    WICPngSrgbProperties_FORCE_DWORD = 2147483647
  end

  enum WICPngTimeProperties : UInt32
    WICPngTimeYear = 1
    WICPngTimeMonth = 2
    WICPngTimeDay = 3
    WICPngTimeHour = 4
    WICPngTimeMinute = 5
    WICPngTimeSecond = 6
    WICPngTimeProperties_FORCE_DWORD = 2147483647
  end

  enum WICHeifProperties : UInt32
    WICHeifOrientation = 1
    WICHeifProperties_FORCE_DWORD = 2147483647
  end

  enum WICHeifHdrProperties : UInt32
    WICHeifHdrMaximumLuminanceLevel = 1
    WICHeifHdrMaximumFrameAverageLuminanceLevel = 2
    WICHeifHdrMinimumMasteringDisplayLuminanceLevel = 3
    WICHeifHdrMaximumMasteringDisplayLuminanceLevel = 4
    WICHeifHdrCustomVideoPrimaries = 5
    WICHeifHdrProperties_FORCE_DWORD = 2147483647
  end

  enum WICWebpAnimProperties : UInt32
    WICWebpAnimLoopCount = 1
    WICWebpAnimProperties_FORCE_DWORD = 2147483647
  end

  enum WICWebpAnmfProperties : UInt32
    WICWebpAnmfFrameDuration = 1
    WICWebpAnmfProperties_FORCE_DWORD = 2147483647
  end

  enum WICSectionAccessLevel : UInt32
    WICSectionAccessLevelRead = 1
    WICSectionAccessLevelReadWrite = 3
    WICSectionAccessLevel_FORCE_DWORD = 2147483647
  end

  enum WICPixelFormatNumericRepresentation : UInt32
    WICPixelFormatNumericRepresentationUnspecified = 0
    WICPixelFormatNumericRepresentationIndexed = 1
    WICPixelFormatNumericRepresentationUnsignedInteger = 2
    WICPixelFormatNumericRepresentationSignedInteger = 3
    WICPixelFormatNumericRepresentationFixed = 4
    WICPixelFormatNumericRepresentationFloat = 5
    WICPixelFormatNumericRepresentation_FORCE_DWORD = 2147483647
  end

  enum WICPlanarOptions : Int32
    WICPlanarOptionsDefault = 0
    WICPlanarOptionsPreserveSubsampling = 1
    WICPLANAROPTIONS_FORCE_DWORD = 2147483647
  end

  enum WICJpegIndexingOptions : UInt32
    WICJpegIndexingOptionsGenerateOnDemand = 0
    WICJpegIndexingOptionsGenerateOnLoad = 1
    WICJpegIndexingOptions_FORCE_DWORD = 2147483647
  end

  enum WICJpegTransferMatrix : UInt32
    WICJpegTransferMatrixIdentity = 0
    WICJpegTransferMatrixBT601 = 1
    WICJpegTransferMatrix_FORCE_DWORD = 2147483647
  end

  enum WICJpegScanType : UInt32
    WICJpegScanTypeInterleaved = 0
    WICJpegScanTypePlanarComponents = 1
    WICJpegScanTypeProgressive = 2
    WICJpegScanType_FORCE_DWORD = 2147483647
  end

  enum WICTiffCompressionOption : Int32
    WICTiffCompressionDontCare = 0
    WICTiffCompressionNone = 1
    WICTiffCompressionCCITT3 = 2
    WICTiffCompressionCCITT4 = 3
    WICTiffCompressionLZW = 4
    WICTiffCompressionRLE = 5
    WICTiffCompressionZIP = 6
    WICTiffCompressionLZWHDifferencing = 7
    WICTIFFCOMPRESSIONOPTION_FORCE_DWORD = 2147483647
  end

  enum WICJpegYCrCbSubsamplingOption : Int32
    WICJpegYCrCbSubsamplingDefault = 0
    WICJpegYCrCbSubsampling420 = 1
    WICJpegYCrCbSubsampling422 = 2
    WICJpegYCrCbSubsampling444 = 3
    WICJpegYCrCbSubsampling440 = 4
    WICJPEGYCRCBSUBSAMPLING_FORCE_DWORD = 2147483647
  end

  enum WICPngFilterOption : Int32
    WICPngFilterUnspecified = 0
    WICPngFilterNone = 1
    WICPngFilterSub = 2
    WICPngFilterUp = 3
    WICPngFilterAverage = 4
    WICPngFilterPaeth = 5
    WICPngFilterAdaptive = 6
    WICPNGFILTEROPTION_FORCE_DWORD = 2147483647
  end

  enum WICNamedWhitePoint : Int32
    WICWhitePointDefault = 1
    WICWhitePointDaylight = 2
    WICWhitePointCloudy = 4
    WICWhitePointShade = 8
    WICWhitePointTungsten = 16
    WICWhitePointFluorescent = 32
    WICWhitePointFlash = 64
    WICWhitePointUnderwater = 128
    WICWhitePointCustom = 256
    WICWhitePointAutoWhiteBalance = 512
    WICWhitePointAsShot = 1
    WICNAMEDWHITEPOINT_FORCE_DWORD = 2147483647
  end

  enum WICRawCapabilities : Int32
    WICRawCapabilityNotSupported = 0
    WICRawCapabilityGetSupported = 1
    WICRawCapabilityFullySupported = 2
    WICRAWCAPABILITIES_FORCE_DWORD = 2147483647
  end

  enum WICRawRotationCapabilities : Int32
    WICRawRotationCapabilityNotSupported = 0
    WICRawRotationCapabilityGetSupported = 1
    WICRawRotationCapabilityNinetyDegreesSupported = 2
    WICRawRotationCapabilityFullySupported = 3
    WICRAWROTATIONCAPABILITIES_FORCE_DWORD = 2147483647
  end

  enum WICRawParameterSet : Int32
    WICAsShotParameterSet = 1
    WICUserAdjustedParameterSet = 2
    WICAutoAdjustedParameterSet = 3
    WICRAWPARAMETERSET_FORCE_DWORD = 2147483647
  end

  enum WICRawRenderMode : Int32
    WICRawRenderModeDraft = 1
    WICRawRenderModeNormal = 2
    WICRawRenderModeBestQuality = 3
    WICRAWRENDERMODE_FORCE_DWORD = 2147483647
  end

  enum WICDdsDimension : Int32
    WICDdsTexture1D = 0
    WICDdsTexture2D = 1
    WICDdsTexture3D = 2
    WICDdsTextureCube = 3
    WICDDSTEXTURE_FORCE_DWORD = 2147483647
  end

  enum WICDdsAlphaMode : Int32
    WICDdsAlphaModeUnknown = 0
    WICDdsAlphaModeStraight = 1
    WICDdsAlphaModePremultiplied = 2
    WICDdsAlphaModeOpaque = 3
    WICDdsAlphaModeCustom = 4
    WICDDSALPHAMODE_FORCE_DWORD = 2147483647
  end

  enum WICMetadataCreationOptions : Int32
    WICMetadataCreationDefault = 0
    WICMetadataCreationAllowUnknown = 0
    WICMetadataCreationFailUnknown = 65536
    WICMetadataCreationMask = -65536
  end

  enum WICPersistOptions : Int32
    WICPersistOptionDefault = 0
    WICPersistOptionLittleEndian = 0
    WICPersistOptionBigEndian = 1
    WICPersistOptionStrictFormat = 2
    WICPersistOptionNoCacheStream = 4
    WICPersistOptionPreferUTF8 = 8
    WICPersistOptionMask = 65535
  end

  struct WICRect
    x : Int32
    y : Int32
    width : Int32
    height : Int32
  end
  struct WICBitmapPattern
    position : ULARGE_INTEGER
    length : UInt32
    pattern : UInt8*
    mask : UInt8*
    end_of_stream : LibC::BOOL
  end
  struct WICImageParameters
    pixel_format : D2D1_PIXEL_FORMAT
    dpi_x : Float32
    dpi_y : Float32
    top : Float32
    left : Float32
    pixel_width : UInt32
    pixel_height : UInt32
  end
  struct WICBitmapPlaneDescription
    format : Guid
    width : UInt32
    height : UInt32
  end
  struct WICBitmapPlane
    format : Guid
    pb_buffer : UInt8*
    cb_stride : UInt32
    cb_buffer_size : UInt32
  end
  struct WICJpegFrameHeader
    width : UInt32
    height : UInt32
    transfer_matrix : WICJpegTransferMatrix
    scan_type : WICJpegScanType
    c_components : UInt32
    component_identifiers : UInt32
    sample_factors : UInt32
    quantization_table_indices : UInt32
  end
  struct WICJpegScanHeader
    c_components : UInt32
    restart_interval : UInt32
    component_selectors : UInt32
    huffman_table_indices : UInt32
    start_spectral_selection : UInt8
    end_spectral_selection : UInt8
    successive_approximation_high : UInt8
    successive_approximation_low : UInt8
  end
  struct WICRawCapabilitiesInfo
    cb_size : UInt32
    codec_major_version : UInt32
    codec_minor_version : UInt32
    exposure_compensation_support : WICRawCapabilities
    contrast_support : WICRawCapabilities
    rgb_white_point_support : WICRawCapabilities
    named_white_point_support : WICRawCapabilities
    named_white_point_support_mask : UInt32
    kelvin_white_point_support : WICRawCapabilities
    gamma_support : WICRawCapabilities
    tint_support : WICRawCapabilities
    saturation_support : WICRawCapabilities
    sharpness_support : WICRawCapabilities
    noise_reduction_support : WICRawCapabilities
    destination_color_profile_support : WICRawCapabilities
    tone_curve_support : WICRawCapabilities
    rotation_support : WICRawRotationCapabilities
    render_mode_support : WICRawCapabilities
  end
  struct WICRawToneCurvePoint
    input : Float64
    output : Float64
  end
  struct WICRawToneCurve
    c_points : UInt32
    a_points : WICRawToneCurvePoint[0]*
  end
  struct WICDdsParameters
    width : UInt32
    height : UInt32
    depth : UInt32
    mip_levels : UInt32
    array_size : UInt32
    dxgi_format : DXGI_FORMAT
    dimension : WICDdsDimension
    alpha_mode : WICDdsAlphaMode
  end
  struct WICDdsFormatInfo
    dxgi_format : DXGI_FORMAT
    bytes_per_block : UInt32
    block_width : UInt32
    block_height : UInt32
  end
  struct WICMetadataPattern
    position : ULARGE_INTEGER
    length : UInt32
    pattern : UInt8*
    mask : UInt8*
    data_offset : ULARGE_INTEGER
  end
  struct WICMetadataHeader
    position : ULARGE_INTEGER
    length : UInt32
    header : UInt8*
    data_offset : ULARGE_INTEGER
  end


  struct IWICPaletteVTbl
    query_interface : Proc(IWICPalette*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICPalette*, UInt32)
    release : Proc(IWICPalette*, UInt32)
    initialize_predefined : Proc(IWICPalette*, WICBitmapPaletteType, LibC::BOOL, HRESULT)
    initialize_custom : Proc(IWICPalette*, UInt32*, UInt32, HRESULT)
    initialize_from_bitmap : Proc(IWICPalette*, IWICBitmapSource, UInt32, LibC::BOOL, HRESULT)
    initialize_from_palette : Proc(IWICPalette*, IWICPalette, HRESULT)
    get_type : Proc(IWICPalette*, WICBitmapPaletteType*, HRESULT)
    get_color_count : Proc(IWICPalette*, UInt32*, HRESULT)
    get_colors : Proc(IWICPalette*, UInt32, UInt32*, UInt32*, HRESULT)
    is_black_white : Proc(IWICPalette*, LibC::BOOL*, HRESULT)
    is_grayscale : Proc(IWICPalette*, LibC::BOOL*, HRESULT)
    has_alpha : Proc(IWICPalette*, LibC::BOOL*, HRESULT)
  end

  IWICPalette_GUID = "00000040-a8f2-4877-ba0a-fd2b6645fb94"
  IID_IWICPalette = LibC::GUID.new(0x40_u32, 0xa8f2_u16, 0x4877_u16, StaticArray[0xba_u8, 0xa_u8, 0xfd_u8, 0x2b_u8, 0x66_u8, 0x45_u8, 0xfb_u8, 0x94_u8])
  struct IWICPalette
    lpVtbl : IWICPaletteVTbl*
  end

  struct IWICBitmapSourceVTbl
    query_interface : Proc(IWICBitmapSource*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICBitmapSource*, UInt32)
    release : Proc(IWICBitmapSource*, UInt32)
    get_size : Proc(IWICBitmapSource*, UInt32*, UInt32*, HRESULT)
    get_pixel_format : Proc(IWICBitmapSource*, Guid*, HRESULT)
    get_resolution : Proc(IWICBitmapSource*, Float64*, Float64*, HRESULT)
    copy_palette : Proc(IWICBitmapSource*, IWICPalette, HRESULT)
    copy_pixels : Proc(IWICBitmapSource*, WICRect*, UInt32, UInt32, UInt8*, HRESULT)
  end

  IWICBitmapSource_GUID = "00000120-a8f2-4877-ba0a-fd2b6645fb94"
  IID_IWICBitmapSource = LibC::GUID.new(0x120_u32, 0xa8f2_u16, 0x4877_u16, StaticArray[0xba_u8, 0xa_u8, 0xfd_u8, 0x2b_u8, 0x66_u8, 0x45_u8, 0xfb_u8, 0x94_u8])
  struct IWICBitmapSource
    lpVtbl : IWICBitmapSourceVTbl*
  end

  struct IWICFormatConverterVTbl
    query_interface : Proc(IWICFormatConverter*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICFormatConverter*, UInt32)
    release : Proc(IWICFormatConverter*, UInt32)
    get_size : Proc(IWICFormatConverter*, UInt32*, UInt32*, HRESULT)
    get_pixel_format : Proc(IWICFormatConverter*, Guid*, HRESULT)
    get_resolution : Proc(IWICFormatConverter*, Float64*, Float64*, HRESULT)
    copy_palette : Proc(IWICFormatConverter*, IWICPalette, HRESULT)
    copy_pixels : Proc(IWICFormatConverter*, WICRect*, UInt32, UInt32, UInt8*, HRESULT)
    initialize : Proc(IWICFormatConverter*, IWICBitmapSource, Guid*, WICBitmapDitherType, IWICPalette, Float64, WICBitmapPaletteType, HRESULT)
    can_convert : Proc(IWICFormatConverter*, Guid*, Guid*, LibC::BOOL*, HRESULT)
  end

  IWICFormatConverter_GUID = "00000301-a8f2-4877-ba0a-fd2b6645fb94"
  IID_IWICFormatConverter = LibC::GUID.new(0x301_u32, 0xa8f2_u16, 0x4877_u16, StaticArray[0xba_u8, 0xa_u8, 0xfd_u8, 0x2b_u8, 0x66_u8, 0x45_u8, 0xfb_u8, 0x94_u8])
  struct IWICFormatConverter
    lpVtbl : IWICFormatConverterVTbl*
  end

  struct IWICPlanarFormatConverterVTbl
    query_interface : Proc(IWICPlanarFormatConverter*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICPlanarFormatConverter*, UInt32)
    release : Proc(IWICPlanarFormatConverter*, UInt32)
    get_size : Proc(IWICPlanarFormatConverter*, UInt32*, UInt32*, HRESULT)
    get_pixel_format : Proc(IWICPlanarFormatConverter*, Guid*, HRESULT)
    get_resolution : Proc(IWICPlanarFormatConverter*, Float64*, Float64*, HRESULT)
    copy_palette : Proc(IWICPlanarFormatConverter*, IWICPalette, HRESULT)
    copy_pixels : Proc(IWICPlanarFormatConverter*, WICRect*, UInt32, UInt32, UInt8*, HRESULT)
    initialize : Proc(IWICPlanarFormatConverter*, IWICBitmapSource*, UInt32, Guid*, WICBitmapDitherType, IWICPalette, Float64, WICBitmapPaletteType, HRESULT)
    can_convert : Proc(IWICPlanarFormatConverter*, Guid*, UInt32, Guid*, LibC::BOOL*, HRESULT)
  end

  IWICPlanarFormatConverter_GUID = "bebee9cb-83b0-4dcc-8132-b0aaa55eac96"
  IID_IWICPlanarFormatConverter = LibC::GUID.new(0xbebee9cb_u32, 0x83b0_u16, 0x4dcc_u16, StaticArray[0x81_u8, 0x32_u8, 0xb0_u8, 0xaa_u8, 0xa5_u8, 0x5e_u8, 0xac_u8, 0x96_u8])
  struct IWICPlanarFormatConverter
    lpVtbl : IWICPlanarFormatConverterVTbl*
  end

  struct IWICBitmapScalerVTbl
    query_interface : Proc(IWICBitmapScaler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICBitmapScaler*, UInt32)
    release : Proc(IWICBitmapScaler*, UInt32)
    get_size : Proc(IWICBitmapScaler*, UInt32*, UInt32*, HRESULT)
    get_pixel_format : Proc(IWICBitmapScaler*, Guid*, HRESULT)
    get_resolution : Proc(IWICBitmapScaler*, Float64*, Float64*, HRESULT)
    copy_palette : Proc(IWICBitmapScaler*, IWICPalette, HRESULT)
    copy_pixels : Proc(IWICBitmapScaler*, WICRect*, UInt32, UInt32, UInt8*, HRESULT)
    initialize : Proc(IWICBitmapScaler*, IWICBitmapSource, UInt32, UInt32, WICBitmapInterpolationMode, HRESULT)
  end

  IWICBitmapScaler_GUID = "00000302-a8f2-4877-ba0a-fd2b6645fb94"
  IID_IWICBitmapScaler = LibC::GUID.new(0x302_u32, 0xa8f2_u16, 0x4877_u16, StaticArray[0xba_u8, 0xa_u8, 0xfd_u8, 0x2b_u8, 0x66_u8, 0x45_u8, 0xfb_u8, 0x94_u8])
  struct IWICBitmapScaler
    lpVtbl : IWICBitmapScalerVTbl*
  end

  struct IWICBitmapClipperVTbl
    query_interface : Proc(IWICBitmapClipper*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICBitmapClipper*, UInt32)
    release : Proc(IWICBitmapClipper*, UInt32)
    get_size : Proc(IWICBitmapClipper*, UInt32*, UInt32*, HRESULT)
    get_pixel_format : Proc(IWICBitmapClipper*, Guid*, HRESULT)
    get_resolution : Proc(IWICBitmapClipper*, Float64*, Float64*, HRESULT)
    copy_palette : Proc(IWICBitmapClipper*, IWICPalette, HRESULT)
    copy_pixels : Proc(IWICBitmapClipper*, WICRect*, UInt32, UInt32, UInt8*, HRESULT)
    initialize : Proc(IWICBitmapClipper*, IWICBitmapSource, WICRect*, HRESULT)
  end

  IWICBitmapClipper_GUID = "e4fbcf03-223d-4e81-9333-d635556dd1b5"
  IID_IWICBitmapClipper = LibC::GUID.new(0xe4fbcf03_u32, 0x223d_u16, 0x4e81_u16, StaticArray[0x93_u8, 0x33_u8, 0xd6_u8, 0x35_u8, 0x55_u8, 0x6d_u8, 0xd1_u8, 0xb5_u8])
  struct IWICBitmapClipper
    lpVtbl : IWICBitmapClipperVTbl*
  end

  struct IWICBitmapFlipRotatorVTbl
    query_interface : Proc(IWICBitmapFlipRotator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICBitmapFlipRotator*, UInt32)
    release : Proc(IWICBitmapFlipRotator*, UInt32)
    get_size : Proc(IWICBitmapFlipRotator*, UInt32*, UInt32*, HRESULT)
    get_pixel_format : Proc(IWICBitmapFlipRotator*, Guid*, HRESULT)
    get_resolution : Proc(IWICBitmapFlipRotator*, Float64*, Float64*, HRESULT)
    copy_palette : Proc(IWICBitmapFlipRotator*, IWICPalette, HRESULT)
    copy_pixels : Proc(IWICBitmapFlipRotator*, WICRect*, UInt32, UInt32, UInt8*, HRESULT)
    initialize : Proc(IWICBitmapFlipRotator*, IWICBitmapSource, WICBitmapTransformOptions, HRESULT)
  end

  IWICBitmapFlipRotator_GUID = "5009834f-2d6a-41ce-9e1b-17c5aff7a782"
  IID_IWICBitmapFlipRotator = LibC::GUID.new(0x5009834f_u32, 0x2d6a_u16, 0x41ce_u16, StaticArray[0x9e_u8, 0x1b_u8, 0x17_u8, 0xc5_u8, 0xaf_u8, 0xf7_u8, 0xa7_u8, 0x82_u8])
  struct IWICBitmapFlipRotator
    lpVtbl : IWICBitmapFlipRotatorVTbl*
  end

  struct IWICBitmapLockVTbl
    query_interface : Proc(IWICBitmapLock*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICBitmapLock*, UInt32)
    release : Proc(IWICBitmapLock*, UInt32)
    get_size : Proc(IWICBitmapLock*, UInt32*, UInt32*, HRESULT)
    get_stride : Proc(IWICBitmapLock*, UInt32*, HRESULT)
    get_data_pointer : Proc(IWICBitmapLock*, UInt32*, UInt8**, HRESULT)
    get_pixel_format : Proc(IWICBitmapLock*, Guid*, HRESULT)
  end

  IWICBitmapLock_GUID = "00000123-a8f2-4877-ba0a-fd2b6645fb94"
  IID_IWICBitmapLock = LibC::GUID.new(0x123_u32, 0xa8f2_u16, 0x4877_u16, StaticArray[0xba_u8, 0xa_u8, 0xfd_u8, 0x2b_u8, 0x66_u8, 0x45_u8, 0xfb_u8, 0x94_u8])
  struct IWICBitmapLock
    lpVtbl : IWICBitmapLockVTbl*
  end

  struct IWICBitmapVTbl
    query_interface : Proc(IWICBitmap*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICBitmap*, UInt32)
    release : Proc(IWICBitmap*, UInt32)
    get_size : Proc(IWICBitmap*, UInt32*, UInt32*, HRESULT)
    get_pixel_format : Proc(IWICBitmap*, Guid*, HRESULT)
    get_resolution : Proc(IWICBitmap*, Float64*, Float64*, HRESULT)
    copy_palette : Proc(IWICBitmap*, IWICPalette, HRESULT)
    copy_pixels : Proc(IWICBitmap*, WICRect*, UInt32, UInt32, UInt8*, HRESULT)
    lock : Proc(IWICBitmap*, WICRect*, UInt32, IWICBitmapLock*, HRESULT)
    set_palette : Proc(IWICBitmap*, IWICPalette, HRESULT)
    set_resolution : Proc(IWICBitmap*, Float64, Float64, HRESULT)
  end

  IWICBitmap_GUID = "00000121-a8f2-4877-ba0a-fd2b6645fb94"
  IID_IWICBitmap = LibC::GUID.new(0x121_u32, 0xa8f2_u16, 0x4877_u16, StaticArray[0xba_u8, 0xa_u8, 0xfd_u8, 0x2b_u8, 0x66_u8, 0x45_u8, 0xfb_u8, 0x94_u8])
  struct IWICBitmap
    lpVtbl : IWICBitmapVTbl*
  end

  struct IWICColorContextVTbl
    query_interface : Proc(IWICColorContext*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICColorContext*, UInt32)
    release : Proc(IWICColorContext*, UInt32)
    initialize_from_filename : Proc(IWICColorContext*, LibC::LPWSTR, HRESULT)
    initialize_from_memory : Proc(IWICColorContext*, UInt8*, UInt32, HRESULT)
    initialize_from_exif_color_space : Proc(IWICColorContext*, UInt32, HRESULT)
    get_type : Proc(IWICColorContext*, WICColorContextType*, HRESULT)
    get_profile_bytes : Proc(IWICColorContext*, UInt32, UInt8*, UInt32*, HRESULT)
    get_exif_color_space : Proc(IWICColorContext*, UInt32*, HRESULT)
  end

  IWICColorContext_GUID = "3c613a02-34b2-44ea-9a7c-45aea9c6fd6d"
  IID_IWICColorContext = LibC::GUID.new(0x3c613a02_u32, 0x34b2_u16, 0x44ea_u16, StaticArray[0x9a_u8, 0x7c_u8, 0x45_u8, 0xae_u8, 0xa9_u8, 0xc6_u8, 0xfd_u8, 0x6d_u8])
  struct IWICColorContext
    lpVtbl : IWICColorContextVTbl*
  end

  struct IWICColorTransformVTbl
    query_interface : Proc(IWICColorTransform*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICColorTransform*, UInt32)
    release : Proc(IWICColorTransform*, UInt32)
    get_size : Proc(IWICColorTransform*, UInt32*, UInt32*, HRESULT)
    get_pixel_format : Proc(IWICColorTransform*, Guid*, HRESULT)
    get_resolution : Proc(IWICColorTransform*, Float64*, Float64*, HRESULT)
    copy_palette : Proc(IWICColorTransform*, IWICPalette, HRESULT)
    copy_pixels : Proc(IWICColorTransform*, WICRect*, UInt32, UInt32, UInt8*, HRESULT)
    initialize : Proc(IWICColorTransform*, IWICBitmapSource, IWICColorContext, IWICColorContext, Guid*, HRESULT)
  end

  IWICColorTransform_GUID = "b66f034f-d0e2-40ab-b436-6de39e321a94"
  IID_IWICColorTransform = LibC::GUID.new(0xb66f034f_u32, 0xd0e2_u16, 0x40ab_u16, StaticArray[0xb4_u8, 0x36_u8, 0x6d_u8, 0xe3_u8, 0x9e_u8, 0x32_u8, 0x1a_u8, 0x94_u8])
  struct IWICColorTransform
    lpVtbl : IWICColorTransformVTbl*
  end

  struct IWICFastMetadataEncoderVTbl
    query_interface : Proc(IWICFastMetadataEncoder*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICFastMetadataEncoder*, UInt32)
    release : Proc(IWICFastMetadataEncoder*, UInt32)
    commit : Proc(IWICFastMetadataEncoder*, HRESULT)
    get_metadata_query_writer : Proc(IWICFastMetadataEncoder*, IWICMetadataQueryWriter*, HRESULT)
  end

  IWICFastMetadataEncoder_GUID = "b84e2c09-78c9-4ac4-8bd3-524ae1663a2f"
  IID_IWICFastMetadataEncoder = LibC::GUID.new(0xb84e2c09_u32, 0x78c9_u16, 0x4ac4_u16, StaticArray[0x8b_u8, 0xd3_u8, 0x52_u8, 0x4a_u8, 0xe1_u8, 0x66_u8, 0x3a_u8, 0x2f_u8])
  struct IWICFastMetadataEncoder
    lpVtbl : IWICFastMetadataEncoderVTbl*
  end

  struct IWICStreamVTbl
    query_interface : Proc(IWICStream*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICStream*, UInt32)
    release : Proc(IWICStream*, UInt32)
    read : Proc(IWICStream*, Void*, UInt32, UInt32*, HRESULT)
    write : Proc(IWICStream*, Void*, UInt32, UInt32*, HRESULT)
    seek : Proc(IWICStream*, LARGE_INTEGER, STREAM_SEEK, ULARGE_INTEGER*, HRESULT)
    set_size : Proc(IWICStream*, ULARGE_INTEGER, HRESULT)
    copy_to : Proc(IWICStream*, IStream, ULARGE_INTEGER, ULARGE_INTEGER*, ULARGE_INTEGER*, HRESULT)
    commit : Proc(IWICStream*, UInt32, HRESULT)
    revert : Proc(IWICStream*, HRESULT)
    lock_region : Proc(IWICStream*, ULARGE_INTEGER, ULARGE_INTEGER, UInt32, HRESULT)
    unlock_region : Proc(IWICStream*, ULARGE_INTEGER, ULARGE_INTEGER, UInt32, HRESULT)
    stat : Proc(IWICStream*, STATSTG*, UInt32, HRESULT)
    clone : Proc(IWICStream*, IStream*, HRESULT)
    initialize_from_i_stream : Proc(IWICStream*, IStream, HRESULT)
    initialize_from_filename : Proc(IWICStream*, LibC::LPWSTR, UInt32, HRESULT)
    initialize_from_memory : Proc(IWICStream*, UInt8*, UInt32, HRESULT)
    initialize_from_i_stream_region : Proc(IWICStream*, IStream, ULARGE_INTEGER, ULARGE_INTEGER, HRESULT)
  end

  IWICStream_GUID = "135ff860-22b7-4ddf-b0f6-218f4f299a43"
  IID_IWICStream = LibC::GUID.new(0x135ff860_u32, 0x22b7_u16, 0x4ddf_u16, StaticArray[0xb0_u8, 0xf6_u8, 0x21_u8, 0x8f_u8, 0x4f_u8, 0x29_u8, 0x9a_u8, 0x43_u8])
  struct IWICStream
    lpVtbl : IWICStreamVTbl*
  end

  struct IWICEnumMetadataItemVTbl
    query_interface : Proc(IWICEnumMetadataItem*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICEnumMetadataItem*, UInt32)
    release : Proc(IWICEnumMetadataItem*, UInt32)
    next : Proc(IWICEnumMetadataItem*, UInt32, PROPVARIANT*, PROPVARIANT*, PROPVARIANT*, UInt32*, HRESULT)
    skip : Proc(IWICEnumMetadataItem*, UInt32, HRESULT)
    reset : Proc(IWICEnumMetadataItem*, HRESULT)
    clone : Proc(IWICEnumMetadataItem*, IWICEnumMetadataItem*, HRESULT)
  end

  IWICEnumMetadataItem_GUID = "dc2bb46d-3f07-481e-8625-220c4aedbb33"
  IID_IWICEnumMetadataItem = LibC::GUID.new(0xdc2bb46d_u32, 0x3f07_u16, 0x481e_u16, StaticArray[0x86_u8, 0x25_u8, 0x22_u8, 0xc_u8, 0x4a_u8, 0xed_u8, 0xbb_u8, 0x33_u8])
  struct IWICEnumMetadataItem
    lpVtbl : IWICEnumMetadataItemVTbl*
  end

  struct IWICMetadataQueryReaderVTbl
    query_interface : Proc(IWICMetadataQueryReader*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICMetadataQueryReader*, UInt32)
    release : Proc(IWICMetadataQueryReader*, UInt32)
    get_container_format : Proc(IWICMetadataQueryReader*, Guid*, HRESULT)
    get_location : Proc(IWICMetadataQueryReader*, UInt32, Char*, UInt32*, HRESULT)
    get_metadata_by_name : Proc(IWICMetadataQueryReader*, LibC::LPWSTR, PROPVARIANT*, HRESULT)
    get_enumerator : Proc(IWICMetadataQueryReader*, IEnumString*, HRESULT)
  end

  IWICMetadataQueryReader_GUID = "30989668-e1c9-4597-b395-458eedb808df"
  IID_IWICMetadataQueryReader = LibC::GUID.new(0x30989668_u32, 0xe1c9_u16, 0x4597_u16, StaticArray[0xb3_u8, 0x95_u8, 0x45_u8, 0x8e_u8, 0xed_u8, 0xb8_u8, 0x8_u8, 0xdf_u8])
  struct IWICMetadataQueryReader
    lpVtbl : IWICMetadataQueryReaderVTbl*
  end

  struct IWICMetadataQueryWriterVTbl
    query_interface : Proc(IWICMetadataQueryWriter*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICMetadataQueryWriter*, UInt32)
    release : Proc(IWICMetadataQueryWriter*, UInt32)
    get_container_format : Proc(IWICMetadataQueryWriter*, Guid*, HRESULT)
    get_location : Proc(IWICMetadataQueryWriter*, UInt32, Char*, UInt32*, HRESULT)
    get_metadata_by_name : Proc(IWICMetadataQueryWriter*, LibC::LPWSTR, PROPVARIANT*, HRESULT)
    get_enumerator : Proc(IWICMetadataQueryWriter*, IEnumString*, HRESULT)
    set_metadata_by_name : Proc(IWICMetadataQueryWriter*, LibC::LPWSTR, PROPVARIANT*, HRESULT)
    remove_metadata_by_name : Proc(IWICMetadataQueryWriter*, LibC::LPWSTR, HRESULT)
  end

  IWICMetadataQueryWriter_GUID = "a721791a-0def-4d06-bd91-2118bf1db10b"
  IID_IWICMetadataQueryWriter = LibC::GUID.new(0xa721791a_u32, 0xdef_u16, 0x4d06_u16, StaticArray[0xbd_u8, 0x91_u8, 0x21_u8, 0x18_u8, 0xbf_u8, 0x1d_u8, 0xb1_u8, 0xb_u8])
  struct IWICMetadataQueryWriter
    lpVtbl : IWICMetadataQueryWriterVTbl*
  end

  struct IWICBitmapEncoderVTbl
    query_interface : Proc(IWICBitmapEncoder*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICBitmapEncoder*, UInt32)
    release : Proc(IWICBitmapEncoder*, UInt32)
    initialize : Proc(IWICBitmapEncoder*, IStream, WICBitmapEncoderCacheOption, HRESULT)
    get_container_format : Proc(IWICBitmapEncoder*, Guid*, HRESULT)
    get_encoder_info : Proc(IWICBitmapEncoder*, IWICBitmapEncoderInfo*, HRESULT)
    set_color_contexts : Proc(IWICBitmapEncoder*, UInt32, IWICColorContext*, HRESULT)
    set_palette : Proc(IWICBitmapEncoder*, IWICPalette, HRESULT)
    set_thumbnail : Proc(IWICBitmapEncoder*, IWICBitmapSource, HRESULT)
    set_preview : Proc(IWICBitmapEncoder*, IWICBitmapSource, HRESULT)
    create_new_frame : Proc(IWICBitmapEncoder*, IWICBitmapFrameEncode*, IPropertyBag2*, HRESULT)
    commit : Proc(IWICBitmapEncoder*, HRESULT)
    get_metadata_query_writer : Proc(IWICBitmapEncoder*, IWICMetadataQueryWriter*, HRESULT)
  end

  IWICBitmapEncoder_GUID = "00000103-a8f2-4877-ba0a-fd2b6645fb94"
  IID_IWICBitmapEncoder = LibC::GUID.new(0x103_u32, 0xa8f2_u16, 0x4877_u16, StaticArray[0xba_u8, 0xa_u8, 0xfd_u8, 0x2b_u8, 0x66_u8, 0x45_u8, 0xfb_u8, 0x94_u8])
  struct IWICBitmapEncoder
    lpVtbl : IWICBitmapEncoderVTbl*
  end

  struct IWICBitmapFrameEncodeVTbl
    query_interface : Proc(IWICBitmapFrameEncode*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICBitmapFrameEncode*, UInt32)
    release : Proc(IWICBitmapFrameEncode*, UInt32)
    initialize : Proc(IWICBitmapFrameEncode*, IPropertyBag2, HRESULT)
    set_size : Proc(IWICBitmapFrameEncode*, UInt32, UInt32, HRESULT)
    set_resolution : Proc(IWICBitmapFrameEncode*, Float64, Float64, HRESULT)
    set_pixel_format : Proc(IWICBitmapFrameEncode*, Guid*, HRESULT)
    set_color_contexts : Proc(IWICBitmapFrameEncode*, UInt32, IWICColorContext*, HRESULT)
    set_palette : Proc(IWICBitmapFrameEncode*, IWICPalette, HRESULT)
    set_thumbnail : Proc(IWICBitmapFrameEncode*, IWICBitmapSource, HRESULT)
    write_pixels : Proc(IWICBitmapFrameEncode*, UInt32, UInt32, UInt32, UInt8*, HRESULT)
    write_source : Proc(IWICBitmapFrameEncode*, IWICBitmapSource, WICRect*, HRESULT)
    commit : Proc(IWICBitmapFrameEncode*, HRESULT)
    get_metadata_query_writer : Proc(IWICBitmapFrameEncode*, IWICMetadataQueryWriter*, HRESULT)
  end

  IWICBitmapFrameEncode_GUID = "00000105-a8f2-4877-ba0a-fd2b6645fb94"
  IID_IWICBitmapFrameEncode = LibC::GUID.new(0x105_u32, 0xa8f2_u16, 0x4877_u16, StaticArray[0xba_u8, 0xa_u8, 0xfd_u8, 0x2b_u8, 0x66_u8, 0x45_u8, 0xfb_u8, 0x94_u8])
  struct IWICBitmapFrameEncode
    lpVtbl : IWICBitmapFrameEncodeVTbl*
  end

  struct IWICPlanarBitmapFrameEncodeVTbl
    query_interface : Proc(IWICPlanarBitmapFrameEncode*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICPlanarBitmapFrameEncode*, UInt32)
    release : Proc(IWICPlanarBitmapFrameEncode*, UInt32)
    write_pixels : Proc(IWICPlanarBitmapFrameEncode*, UInt32, WICBitmapPlane*, UInt32, HRESULT)
    write_source : Proc(IWICPlanarBitmapFrameEncode*, IWICBitmapSource*, UInt32, WICRect*, HRESULT)
  end

  IWICPlanarBitmapFrameEncode_GUID = "f928b7b8-2221-40c1-b72e-7e82f1974d1a"
  IID_IWICPlanarBitmapFrameEncode = LibC::GUID.new(0xf928b7b8_u32, 0x2221_u16, 0x40c1_u16, StaticArray[0xb7_u8, 0x2e_u8, 0x7e_u8, 0x82_u8, 0xf1_u8, 0x97_u8, 0x4d_u8, 0x1a_u8])
  struct IWICPlanarBitmapFrameEncode
    lpVtbl : IWICPlanarBitmapFrameEncodeVTbl*
  end

  struct IWICBitmapDecoderVTbl
    query_interface : Proc(IWICBitmapDecoder*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICBitmapDecoder*, UInt32)
    release : Proc(IWICBitmapDecoder*, UInt32)
    query_capability : Proc(IWICBitmapDecoder*, IStream, UInt32*, HRESULT)
    initialize : Proc(IWICBitmapDecoder*, IStream, WICDecodeOptions, HRESULT)
    get_container_format : Proc(IWICBitmapDecoder*, Guid*, HRESULT)
    get_decoder_info : Proc(IWICBitmapDecoder*, IWICBitmapDecoderInfo*, HRESULT)
    copy_palette : Proc(IWICBitmapDecoder*, IWICPalette, HRESULT)
    get_metadata_query_reader : Proc(IWICBitmapDecoder*, IWICMetadataQueryReader*, HRESULT)
    get_preview : Proc(IWICBitmapDecoder*, IWICBitmapSource*, HRESULT)
    get_color_contexts : Proc(IWICBitmapDecoder*, UInt32, IWICColorContext*, UInt32*, HRESULT)
    get_thumbnail : Proc(IWICBitmapDecoder*, IWICBitmapSource*, HRESULT)
    get_frame_count : Proc(IWICBitmapDecoder*, UInt32*, HRESULT)
    get_frame : Proc(IWICBitmapDecoder*, UInt32, IWICBitmapFrameDecode*, HRESULT)
  end

  IWICBitmapDecoder_GUID = "9edde9e7-8dee-47ea-99df-e6faf2ed44bf"
  IID_IWICBitmapDecoder = LibC::GUID.new(0x9edde9e7_u32, 0x8dee_u16, 0x47ea_u16, StaticArray[0x99_u8, 0xdf_u8, 0xe6_u8, 0xfa_u8, 0xf2_u8, 0xed_u8, 0x44_u8, 0xbf_u8])
  struct IWICBitmapDecoder
    lpVtbl : IWICBitmapDecoderVTbl*
  end

  struct IWICBitmapSourceTransformVTbl
    query_interface : Proc(IWICBitmapSourceTransform*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICBitmapSourceTransform*, UInt32)
    release : Proc(IWICBitmapSourceTransform*, UInt32)
    copy_pixels : Proc(IWICBitmapSourceTransform*, WICRect*, UInt32, UInt32, Guid*, WICBitmapTransformOptions, UInt32, UInt32, UInt8*, HRESULT)
    get_closest_size : Proc(IWICBitmapSourceTransform*, UInt32*, UInt32*, HRESULT)
    get_closest_pixel_format : Proc(IWICBitmapSourceTransform*, Guid*, HRESULT)
    does_support_transform : Proc(IWICBitmapSourceTransform*, WICBitmapTransformOptions, LibC::BOOL*, HRESULT)
  end

  IWICBitmapSourceTransform_GUID = "3b16811b-6a43-4ec9-b713-3d5a0c13b940"
  IID_IWICBitmapSourceTransform = LibC::GUID.new(0x3b16811b_u32, 0x6a43_u16, 0x4ec9_u16, StaticArray[0xb7_u8, 0x13_u8, 0x3d_u8, 0x5a_u8, 0xc_u8, 0x13_u8, 0xb9_u8, 0x40_u8])
  struct IWICBitmapSourceTransform
    lpVtbl : IWICBitmapSourceTransformVTbl*
  end

  struct IWICPlanarBitmapSourceTransformVTbl
    query_interface : Proc(IWICPlanarBitmapSourceTransform*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICPlanarBitmapSourceTransform*, UInt32)
    release : Proc(IWICPlanarBitmapSourceTransform*, UInt32)
    does_support_transform : Proc(IWICPlanarBitmapSourceTransform*, UInt32*, UInt32*, WICBitmapTransformOptions, WICPlanarOptions, Guid*, WICBitmapPlaneDescription*, UInt32, LibC::BOOL*, HRESULT)
    copy_pixels : Proc(IWICPlanarBitmapSourceTransform*, WICRect*, UInt32, UInt32, WICBitmapTransformOptions, WICPlanarOptions, WICBitmapPlane*, UInt32, HRESULT)
  end

  IWICPlanarBitmapSourceTransform_GUID = "3aff9cce-be95-4303-b927-e7d16ff4a613"
  IID_IWICPlanarBitmapSourceTransform = LibC::GUID.new(0x3aff9cce_u32, 0xbe95_u16, 0x4303_u16, StaticArray[0xb9_u8, 0x27_u8, 0xe7_u8, 0xd1_u8, 0x6f_u8, 0xf4_u8, 0xa6_u8, 0x13_u8])
  struct IWICPlanarBitmapSourceTransform
    lpVtbl : IWICPlanarBitmapSourceTransformVTbl*
  end

  struct IWICBitmapFrameDecodeVTbl
    query_interface : Proc(IWICBitmapFrameDecode*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICBitmapFrameDecode*, UInt32)
    release : Proc(IWICBitmapFrameDecode*, UInt32)
    get_size : Proc(IWICBitmapFrameDecode*, UInt32*, UInt32*, HRESULT)
    get_pixel_format : Proc(IWICBitmapFrameDecode*, Guid*, HRESULT)
    get_resolution : Proc(IWICBitmapFrameDecode*, Float64*, Float64*, HRESULT)
    copy_palette : Proc(IWICBitmapFrameDecode*, IWICPalette, HRESULT)
    copy_pixels : Proc(IWICBitmapFrameDecode*, WICRect*, UInt32, UInt32, UInt8*, HRESULT)
    get_metadata_query_reader : Proc(IWICBitmapFrameDecode*, IWICMetadataQueryReader*, HRESULT)
    get_color_contexts : Proc(IWICBitmapFrameDecode*, UInt32, IWICColorContext*, UInt32*, HRESULT)
    get_thumbnail : Proc(IWICBitmapFrameDecode*, IWICBitmapSource*, HRESULT)
  end

  IWICBitmapFrameDecode_GUID = "3b16811b-6a43-4ec9-a813-3d930c13b940"
  IID_IWICBitmapFrameDecode = LibC::GUID.new(0x3b16811b_u32, 0x6a43_u16, 0x4ec9_u16, StaticArray[0xa8_u8, 0x13_u8, 0x3d_u8, 0x93_u8, 0xc_u8, 0x13_u8, 0xb9_u8, 0x40_u8])
  struct IWICBitmapFrameDecode
    lpVtbl : IWICBitmapFrameDecodeVTbl*
  end

  struct IWICProgressiveLevelControlVTbl
    query_interface : Proc(IWICProgressiveLevelControl*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICProgressiveLevelControl*, UInt32)
    release : Proc(IWICProgressiveLevelControl*, UInt32)
    get_level_count : Proc(IWICProgressiveLevelControl*, UInt32*, HRESULT)
    get_current_level : Proc(IWICProgressiveLevelControl*, UInt32*, HRESULT)
    set_current_level : Proc(IWICProgressiveLevelControl*, UInt32, HRESULT)
  end

  IWICProgressiveLevelControl_GUID = "daac296f-7aa5-4dbf-8d15-225c5976f891"
  IID_IWICProgressiveLevelControl = LibC::GUID.new(0xdaac296f_u32, 0x7aa5_u16, 0x4dbf_u16, StaticArray[0x8d_u8, 0x15_u8, 0x22_u8, 0x5c_u8, 0x59_u8, 0x76_u8, 0xf8_u8, 0x91_u8])
  struct IWICProgressiveLevelControl
    lpVtbl : IWICProgressiveLevelControlVTbl*
  end

  struct IWICProgressCallbackVTbl
    query_interface : Proc(IWICProgressCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICProgressCallback*, UInt32)
    release : Proc(IWICProgressCallback*, UInt32)
    notify : Proc(IWICProgressCallback*, UInt32, WICProgressOperation, Float64, HRESULT)
  end

  IWICProgressCallback_GUID = "4776f9cd-9517-45fa-bf24-e89c5ec5c60c"
  IID_IWICProgressCallback = LibC::GUID.new(0x4776f9cd_u32, 0x9517_u16, 0x45fa_u16, StaticArray[0xbf_u8, 0x24_u8, 0xe8_u8, 0x9c_u8, 0x5e_u8, 0xc5_u8, 0xc6_u8, 0xc_u8])
  struct IWICProgressCallback
    lpVtbl : IWICProgressCallbackVTbl*
  end

  struct IWICBitmapCodecProgressNotificationVTbl
    query_interface : Proc(IWICBitmapCodecProgressNotification*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICBitmapCodecProgressNotification*, UInt32)
    release : Proc(IWICBitmapCodecProgressNotification*, UInt32)
    register_progress_notification : Proc(IWICBitmapCodecProgressNotification*, PFNProgressNotification, Void*, UInt32, HRESULT)
  end

  IWICBitmapCodecProgressNotification_GUID = "64c1024e-c3cf-4462-8078-88c2b11c46d9"
  IID_IWICBitmapCodecProgressNotification = LibC::GUID.new(0x64c1024e_u32, 0xc3cf_u16, 0x4462_u16, StaticArray[0x80_u8, 0x78_u8, 0x88_u8, 0xc2_u8, 0xb1_u8, 0x1c_u8, 0x46_u8, 0xd9_u8])
  struct IWICBitmapCodecProgressNotification
    lpVtbl : IWICBitmapCodecProgressNotificationVTbl*
  end

  struct IWICComponentInfoVTbl
    query_interface : Proc(IWICComponentInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICComponentInfo*, UInt32)
    release : Proc(IWICComponentInfo*, UInt32)
    get_component_type : Proc(IWICComponentInfo*, WICComponentType*, HRESULT)
    get_clsid : Proc(IWICComponentInfo*, Guid*, HRESULT)
    get_signing_status : Proc(IWICComponentInfo*, UInt32*, HRESULT)
    get_author : Proc(IWICComponentInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_vendor_guid : Proc(IWICComponentInfo*, Guid*, HRESULT)
    get_version : Proc(IWICComponentInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_spec_version : Proc(IWICComponentInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_friendly_name : Proc(IWICComponentInfo*, UInt32, Char*, UInt32*, HRESULT)
  end

  IWICComponentInfo_GUID = "23bc3f0a-698b-4357-886b-f24d50671334"
  IID_IWICComponentInfo = LibC::GUID.new(0x23bc3f0a_u32, 0x698b_u16, 0x4357_u16, StaticArray[0x88_u8, 0x6b_u8, 0xf2_u8, 0x4d_u8, 0x50_u8, 0x67_u8, 0x13_u8, 0x34_u8])
  struct IWICComponentInfo
    lpVtbl : IWICComponentInfoVTbl*
  end

  struct IWICFormatConverterInfoVTbl
    query_interface : Proc(IWICFormatConverterInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICFormatConverterInfo*, UInt32)
    release : Proc(IWICFormatConverterInfo*, UInt32)
    get_component_type : Proc(IWICFormatConverterInfo*, WICComponentType*, HRESULT)
    get_clsid : Proc(IWICFormatConverterInfo*, Guid*, HRESULT)
    get_signing_status : Proc(IWICFormatConverterInfo*, UInt32*, HRESULT)
    get_author : Proc(IWICFormatConverterInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_vendor_guid : Proc(IWICFormatConverterInfo*, Guid*, HRESULT)
    get_version : Proc(IWICFormatConverterInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_spec_version : Proc(IWICFormatConverterInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_friendly_name : Proc(IWICFormatConverterInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_pixel_formats : Proc(IWICFormatConverterInfo*, UInt32, Guid*, UInt32*, HRESULT)
    create_instance : Proc(IWICFormatConverterInfo*, IWICFormatConverter*, HRESULT)
  end

  IWICFormatConverterInfo_GUID = "9f34fb65-13f4-4f15-bc57-3726b5e53d9f"
  IID_IWICFormatConverterInfo = LibC::GUID.new(0x9f34fb65_u32, 0x13f4_u16, 0x4f15_u16, StaticArray[0xbc_u8, 0x57_u8, 0x37_u8, 0x26_u8, 0xb5_u8, 0xe5_u8, 0x3d_u8, 0x9f_u8])
  struct IWICFormatConverterInfo
    lpVtbl : IWICFormatConverterInfoVTbl*
  end

  struct IWICBitmapCodecInfoVTbl
    query_interface : Proc(IWICBitmapCodecInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICBitmapCodecInfo*, UInt32)
    release : Proc(IWICBitmapCodecInfo*, UInt32)
    get_component_type : Proc(IWICBitmapCodecInfo*, WICComponentType*, HRESULT)
    get_clsid : Proc(IWICBitmapCodecInfo*, Guid*, HRESULT)
    get_signing_status : Proc(IWICBitmapCodecInfo*, UInt32*, HRESULT)
    get_author : Proc(IWICBitmapCodecInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_vendor_guid : Proc(IWICBitmapCodecInfo*, Guid*, HRESULT)
    get_version : Proc(IWICBitmapCodecInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_spec_version : Proc(IWICBitmapCodecInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_friendly_name : Proc(IWICBitmapCodecInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_container_format : Proc(IWICBitmapCodecInfo*, Guid*, HRESULT)
    get_pixel_formats : Proc(IWICBitmapCodecInfo*, UInt32, Guid*, UInt32*, HRESULT)
    get_color_management_version : Proc(IWICBitmapCodecInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_device_manufacturer : Proc(IWICBitmapCodecInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_device_models : Proc(IWICBitmapCodecInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_mime_types : Proc(IWICBitmapCodecInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_file_extensions : Proc(IWICBitmapCodecInfo*, UInt32, Char*, UInt32*, HRESULT)
    does_support_animation : Proc(IWICBitmapCodecInfo*, LibC::BOOL*, HRESULT)
    does_support_chromakey : Proc(IWICBitmapCodecInfo*, LibC::BOOL*, HRESULT)
    does_support_lossless : Proc(IWICBitmapCodecInfo*, LibC::BOOL*, HRESULT)
    does_support_multiframe : Proc(IWICBitmapCodecInfo*, LibC::BOOL*, HRESULT)
    matches_mime_type : Proc(IWICBitmapCodecInfo*, LibC::LPWSTR, LibC::BOOL*, HRESULT)
  end

  IWICBitmapCodecInfo_GUID = "e87a44c4-b76e-4c47-8b09-298eb12a2714"
  IID_IWICBitmapCodecInfo = LibC::GUID.new(0xe87a44c4_u32, 0xb76e_u16, 0x4c47_u16, StaticArray[0x8b_u8, 0x9_u8, 0x29_u8, 0x8e_u8, 0xb1_u8, 0x2a_u8, 0x27_u8, 0x14_u8])
  struct IWICBitmapCodecInfo
    lpVtbl : IWICBitmapCodecInfoVTbl*
  end

  struct IWICBitmapEncoderInfoVTbl
    query_interface : Proc(IWICBitmapEncoderInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICBitmapEncoderInfo*, UInt32)
    release : Proc(IWICBitmapEncoderInfo*, UInt32)
    get_component_type : Proc(IWICBitmapEncoderInfo*, WICComponentType*, HRESULT)
    get_clsid : Proc(IWICBitmapEncoderInfo*, Guid*, HRESULT)
    get_signing_status : Proc(IWICBitmapEncoderInfo*, UInt32*, HRESULT)
    get_author : Proc(IWICBitmapEncoderInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_vendor_guid : Proc(IWICBitmapEncoderInfo*, Guid*, HRESULT)
    get_version : Proc(IWICBitmapEncoderInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_spec_version : Proc(IWICBitmapEncoderInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_friendly_name : Proc(IWICBitmapEncoderInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_container_format : Proc(IWICBitmapEncoderInfo*, Guid*, HRESULT)
    get_pixel_formats : Proc(IWICBitmapEncoderInfo*, UInt32, Guid*, UInt32*, HRESULT)
    get_color_management_version : Proc(IWICBitmapEncoderInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_device_manufacturer : Proc(IWICBitmapEncoderInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_device_models : Proc(IWICBitmapEncoderInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_mime_types : Proc(IWICBitmapEncoderInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_file_extensions : Proc(IWICBitmapEncoderInfo*, UInt32, Char*, UInt32*, HRESULT)
    does_support_animation : Proc(IWICBitmapEncoderInfo*, LibC::BOOL*, HRESULT)
    does_support_chromakey : Proc(IWICBitmapEncoderInfo*, LibC::BOOL*, HRESULT)
    does_support_lossless : Proc(IWICBitmapEncoderInfo*, LibC::BOOL*, HRESULT)
    does_support_multiframe : Proc(IWICBitmapEncoderInfo*, LibC::BOOL*, HRESULT)
    matches_mime_type : Proc(IWICBitmapEncoderInfo*, LibC::LPWSTR, LibC::BOOL*, HRESULT)
    create_instance : Proc(IWICBitmapEncoderInfo*, IWICBitmapEncoder*, HRESULT)
  end

  IWICBitmapEncoderInfo_GUID = "94c9b4ee-a09f-4f92-8a1e-4a9bce7e76fb"
  IID_IWICBitmapEncoderInfo = LibC::GUID.new(0x94c9b4ee_u32, 0xa09f_u16, 0x4f92_u16, StaticArray[0x8a_u8, 0x1e_u8, 0x4a_u8, 0x9b_u8, 0xce_u8, 0x7e_u8, 0x76_u8, 0xfb_u8])
  struct IWICBitmapEncoderInfo
    lpVtbl : IWICBitmapEncoderInfoVTbl*
  end

  struct IWICBitmapDecoderInfoVTbl
    query_interface : Proc(IWICBitmapDecoderInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICBitmapDecoderInfo*, UInt32)
    release : Proc(IWICBitmapDecoderInfo*, UInt32)
    get_component_type : Proc(IWICBitmapDecoderInfo*, WICComponentType*, HRESULT)
    get_clsid : Proc(IWICBitmapDecoderInfo*, Guid*, HRESULT)
    get_signing_status : Proc(IWICBitmapDecoderInfo*, UInt32*, HRESULT)
    get_author : Proc(IWICBitmapDecoderInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_vendor_guid : Proc(IWICBitmapDecoderInfo*, Guid*, HRESULT)
    get_version : Proc(IWICBitmapDecoderInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_spec_version : Proc(IWICBitmapDecoderInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_friendly_name : Proc(IWICBitmapDecoderInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_container_format : Proc(IWICBitmapDecoderInfo*, Guid*, HRESULT)
    get_pixel_formats : Proc(IWICBitmapDecoderInfo*, UInt32, Guid*, UInt32*, HRESULT)
    get_color_management_version : Proc(IWICBitmapDecoderInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_device_manufacturer : Proc(IWICBitmapDecoderInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_device_models : Proc(IWICBitmapDecoderInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_mime_types : Proc(IWICBitmapDecoderInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_file_extensions : Proc(IWICBitmapDecoderInfo*, UInt32, Char*, UInt32*, HRESULT)
    does_support_animation : Proc(IWICBitmapDecoderInfo*, LibC::BOOL*, HRESULT)
    does_support_chromakey : Proc(IWICBitmapDecoderInfo*, LibC::BOOL*, HRESULT)
    does_support_lossless : Proc(IWICBitmapDecoderInfo*, LibC::BOOL*, HRESULT)
    does_support_multiframe : Proc(IWICBitmapDecoderInfo*, LibC::BOOL*, HRESULT)
    matches_mime_type : Proc(IWICBitmapDecoderInfo*, LibC::LPWSTR, LibC::BOOL*, HRESULT)
    get_patterns : Proc(IWICBitmapDecoderInfo*, UInt32, WICBitmapPattern*, UInt32*, UInt32*, HRESULT)
    matches_pattern : Proc(IWICBitmapDecoderInfo*, IStream, LibC::BOOL*, HRESULT)
    create_instance : Proc(IWICBitmapDecoderInfo*, IWICBitmapDecoder*, HRESULT)
  end

  IWICBitmapDecoderInfo_GUID = "d8cd007f-d08f-4191-9bfc-236ea7f0e4b5"
  IID_IWICBitmapDecoderInfo = LibC::GUID.new(0xd8cd007f_u32, 0xd08f_u16, 0x4191_u16, StaticArray[0x9b_u8, 0xfc_u8, 0x23_u8, 0x6e_u8, 0xa7_u8, 0xf0_u8, 0xe4_u8, 0xb5_u8])
  struct IWICBitmapDecoderInfo
    lpVtbl : IWICBitmapDecoderInfoVTbl*
  end

  struct IWICPixelFormatInfoVTbl
    query_interface : Proc(IWICPixelFormatInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICPixelFormatInfo*, UInt32)
    release : Proc(IWICPixelFormatInfo*, UInt32)
    get_component_type : Proc(IWICPixelFormatInfo*, WICComponentType*, HRESULT)
    get_clsid : Proc(IWICPixelFormatInfo*, Guid*, HRESULT)
    get_signing_status : Proc(IWICPixelFormatInfo*, UInt32*, HRESULT)
    get_author : Proc(IWICPixelFormatInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_vendor_guid : Proc(IWICPixelFormatInfo*, Guid*, HRESULT)
    get_version : Proc(IWICPixelFormatInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_spec_version : Proc(IWICPixelFormatInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_friendly_name : Proc(IWICPixelFormatInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_format_guid : Proc(IWICPixelFormatInfo*, Guid*, HRESULT)
    get_color_context : Proc(IWICPixelFormatInfo*, IWICColorContext*, HRESULT)
    get_bits_per_pixel : Proc(IWICPixelFormatInfo*, UInt32*, HRESULT)
    get_channel_count : Proc(IWICPixelFormatInfo*, UInt32*, HRESULT)
    get_channel_mask : Proc(IWICPixelFormatInfo*, UInt32, UInt32, UInt8*, UInt32*, HRESULT)
  end

  IWICPixelFormatInfo_GUID = "e8eda601-3d48-431a-ab44-69059be88bbe"
  IID_IWICPixelFormatInfo = LibC::GUID.new(0xe8eda601_u32, 0x3d48_u16, 0x431a_u16, StaticArray[0xab_u8, 0x44_u8, 0x69_u8, 0x5_u8, 0x9b_u8, 0xe8_u8, 0x8b_u8, 0xbe_u8])
  struct IWICPixelFormatInfo
    lpVtbl : IWICPixelFormatInfoVTbl*
  end

  struct IWICPixelFormatInfo2VTbl
    query_interface : Proc(IWICPixelFormatInfo2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICPixelFormatInfo2*, UInt32)
    release : Proc(IWICPixelFormatInfo2*, UInt32)
    get_component_type : Proc(IWICPixelFormatInfo2*, WICComponentType*, HRESULT)
    get_clsid : Proc(IWICPixelFormatInfo2*, Guid*, HRESULT)
    get_signing_status : Proc(IWICPixelFormatInfo2*, UInt32*, HRESULT)
    get_author : Proc(IWICPixelFormatInfo2*, UInt32, Char*, UInt32*, HRESULT)
    get_vendor_guid : Proc(IWICPixelFormatInfo2*, Guid*, HRESULT)
    get_version : Proc(IWICPixelFormatInfo2*, UInt32, Char*, UInt32*, HRESULT)
    get_spec_version : Proc(IWICPixelFormatInfo2*, UInt32, Char*, UInt32*, HRESULT)
    get_friendly_name : Proc(IWICPixelFormatInfo2*, UInt32, Char*, UInt32*, HRESULT)
    get_format_guid : Proc(IWICPixelFormatInfo2*, Guid*, HRESULT)
    get_color_context : Proc(IWICPixelFormatInfo2*, IWICColorContext*, HRESULT)
    get_bits_per_pixel : Proc(IWICPixelFormatInfo2*, UInt32*, HRESULT)
    get_channel_count : Proc(IWICPixelFormatInfo2*, UInt32*, HRESULT)
    get_channel_mask : Proc(IWICPixelFormatInfo2*, UInt32, UInt32, UInt8*, UInt32*, HRESULT)
    supports_transparency : Proc(IWICPixelFormatInfo2*, LibC::BOOL*, HRESULT)
    get_numeric_representation : Proc(IWICPixelFormatInfo2*, WICPixelFormatNumericRepresentation*, HRESULT)
  end

  IWICPixelFormatInfo2_GUID = "a9db33a2-af5f-43c7-b679-74f5984b5aa4"
  IID_IWICPixelFormatInfo2 = LibC::GUID.new(0xa9db33a2_u32, 0xaf5f_u16, 0x43c7_u16, StaticArray[0xb6_u8, 0x79_u8, 0x74_u8, 0xf5_u8, 0x98_u8, 0x4b_u8, 0x5a_u8, 0xa4_u8])
  struct IWICPixelFormatInfo2
    lpVtbl : IWICPixelFormatInfo2VTbl*
  end

  struct IWICImagingFactoryVTbl
    query_interface : Proc(IWICImagingFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICImagingFactory*, UInt32)
    release : Proc(IWICImagingFactory*, UInt32)
    create_decoder_from_filename : Proc(IWICImagingFactory*, LibC::LPWSTR, Guid*, UInt32, WICDecodeOptions, IWICBitmapDecoder*, HRESULT)
    create_decoder_from_stream : Proc(IWICImagingFactory*, IStream, Guid*, WICDecodeOptions, IWICBitmapDecoder*, HRESULT)
    create_decoder_from_file_handle : Proc(IWICImagingFactory*, LibC::UINT_PTR, Guid*, WICDecodeOptions, IWICBitmapDecoder*, HRESULT)
    create_component_info : Proc(IWICImagingFactory*, Guid*, IWICComponentInfo*, HRESULT)
    create_decoder : Proc(IWICImagingFactory*, Guid*, Guid*, IWICBitmapDecoder*, HRESULT)
    create_encoder : Proc(IWICImagingFactory*, Guid*, Guid*, IWICBitmapEncoder*, HRESULT)
    create_palette : Proc(IWICImagingFactory*, IWICPalette*, HRESULT)
    create_format_converter : Proc(IWICImagingFactory*, IWICFormatConverter*, HRESULT)
    create_bitmap_scaler : Proc(IWICImagingFactory*, IWICBitmapScaler*, HRESULT)
    create_bitmap_clipper : Proc(IWICImagingFactory*, IWICBitmapClipper*, HRESULT)
    create_bitmap_flip_rotator : Proc(IWICImagingFactory*, IWICBitmapFlipRotator*, HRESULT)
    create_stream : Proc(IWICImagingFactory*, IWICStream*, HRESULT)
    create_color_context : Proc(IWICImagingFactory*, IWICColorContext*, HRESULT)
    create_color_transformer : Proc(IWICImagingFactory*, IWICColorTransform*, HRESULT)
    create_bitmap : Proc(IWICImagingFactory*, UInt32, UInt32, Guid*, WICBitmapCreateCacheOption, IWICBitmap*, HRESULT)
    create_bitmap_from_source : Proc(IWICImagingFactory*, IWICBitmapSource, WICBitmapCreateCacheOption, IWICBitmap*, HRESULT)
    create_bitmap_from_source_rect : Proc(IWICImagingFactory*, IWICBitmapSource, UInt32, UInt32, UInt32, UInt32, IWICBitmap*, HRESULT)
    create_bitmap_from_memory : Proc(IWICImagingFactory*, UInt32, UInt32, Guid*, UInt32, UInt32, UInt8*, IWICBitmap*, HRESULT)
    create_bitmap_from_hbitmap : Proc(IWICImagingFactory*, HBITMAP, HPALETTE, WICBitmapAlphaChannelOption, IWICBitmap*, HRESULT)
    create_bitmap_from_hicon : Proc(IWICImagingFactory*, LibC::HANDLE, IWICBitmap*, HRESULT)
    create_component_enumerator : Proc(IWICImagingFactory*, UInt32, UInt32, IEnumUnknown*, HRESULT)
    create_fast_metadata_encoder_from_decoder : Proc(IWICImagingFactory*, IWICBitmapDecoder, IWICFastMetadataEncoder*, HRESULT)
    create_fast_metadata_encoder_from_frame_decode : Proc(IWICImagingFactory*, IWICBitmapFrameDecode, IWICFastMetadataEncoder*, HRESULT)
    create_query_writer : Proc(IWICImagingFactory*, Guid*, Guid*, IWICMetadataQueryWriter*, HRESULT)
    create_query_writer_from_reader : Proc(IWICImagingFactory*, IWICMetadataQueryReader, Guid*, IWICMetadataQueryWriter*, HRESULT)
  end

  IWICImagingFactory_GUID = "ec5ec8a9-c395-4314-9c77-54d7a935ff70"
  IID_IWICImagingFactory = LibC::GUID.new(0xec5ec8a9_u32, 0xc395_u16, 0x4314_u16, StaticArray[0x9c_u8, 0x77_u8, 0x54_u8, 0xd7_u8, 0xa9_u8, 0x35_u8, 0xff_u8, 0x70_u8])
  struct IWICImagingFactory
    lpVtbl : IWICImagingFactoryVTbl*
  end

  struct IWICDevelopRawNotificationCallbackVTbl
    query_interface : Proc(IWICDevelopRawNotificationCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICDevelopRawNotificationCallback*, UInt32)
    release : Proc(IWICDevelopRawNotificationCallback*, UInt32)
    notify : Proc(IWICDevelopRawNotificationCallback*, UInt32, HRESULT)
  end

  IWICDevelopRawNotificationCallback_GUID = "95c75a6e-3e8c-4ec2-85a8-aebcc551e59b"
  IID_IWICDevelopRawNotificationCallback = LibC::GUID.new(0x95c75a6e_u32, 0x3e8c_u16, 0x4ec2_u16, StaticArray[0x85_u8, 0xa8_u8, 0xae_u8, 0xbc_u8, 0xc5_u8, 0x51_u8, 0xe5_u8, 0x9b_u8])
  struct IWICDevelopRawNotificationCallback
    lpVtbl : IWICDevelopRawNotificationCallbackVTbl*
  end

  struct IWICDevelopRawVTbl
    query_interface : Proc(IWICDevelopRaw*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICDevelopRaw*, UInt32)
    release : Proc(IWICDevelopRaw*, UInt32)
    get_size : Proc(IWICDevelopRaw*, UInt32*, UInt32*, HRESULT)
    get_pixel_format : Proc(IWICDevelopRaw*, Guid*, HRESULT)
    get_resolution : Proc(IWICDevelopRaw*, Float64*, Float64*, HRESULT)
    copy_palette : Proc(IWICDevelopRaw*, IWICPalette, HRESULT)
    copy_pixels : Proc(IWICDevelopRaw*, WICRect*, UInt32, UInt32, UInt8*, HRESULT)
    get_metadata_query_reader : Proc(IWICDevelopRaw*, IWICMetadataQueryReader*, HRESULT)
    get_color_contexts : Proc(IWICDevelopRaw*, UInt32, IWICColorContext*, UInt32*, HRESULT)
    get_thumbnail : Proc(IWICDevelopRaw*, IWICBitmapSource*, HRESULT)
    query_raw_capabilities_info : Proc(IWICDevelopRaw*, WICRawCapabilitiesInfo*, HRESULT)
    load_parameter_set : Proc(IWICDevelopRaw*, WICRawParameterSet, HRESULT)
    get_current_parameter_set : Proc(IWICDevelopRaw*, IPropertyBag2*, HRESULT)
    set_exposure_compensation : Proc(IWICDevelopRaw*, Float64, HRESULT)
    get_exposure_compensation : Proc(IWICDevelopRaw*, Float64*, HRESULT)
    set_white_point_rgb : Proc(IWICDevelopRaw*, UInt32, UInt32, UInt32, HRESULT)
    get_white_point_rgb : Proc(IWICDevelopRaw*, UInt32*, UInt32*, UInt32*, HRESULT)
    set_named_white_point : Proc(IWICDevelopRaw*, WICNamedWhitePoint, HRESULT)
    get_named_white_point : Proc(IWICDevelopRaw*, WICNamedWhitePoint*, HRESULT)
    set_white_point_kelvin : Proc(IWICDevelopRaw*, UInt32, HRESULT)
    get_white_point_kelvin : Proc(IWICDevelopRaw*, UInt32*, HRESULT)
    get_kelvin_range_info : Proc(IWICDevelopRaw*, UInt32*, UInt32*, UInt32*, HRESULT)
    set_contrast : Proc(IWICDevelopRaw*, Float64, HRESULT)
    get_contrast : Proc(IWICDevelopRaw*, Float64*, HRESULT)
    set_gamma : Proc(IWICDevelopRaw*, Float64, HRESULT)
    get_gamma : Proc(IWICDevelopRaw*, Float64*, HRESULT)
    set_sharpness : Proc(IWICDevelopRaw*, Float64, HRESULT)
    get_sharpness : Proc(IWICDevelopRaw*, Float64*, HRESULT)
    set_saturation : Proc(IWICDevelopRaw*, Float64, HRESULT)
    get_saturation : Proc(IWICDevelopRaw*, Float64*, HRESULT)
    set_tint : Proc(IWICDevelopRaw*, Float64, HRESULT)
    get_tint : Proc(IWICDevelopRaw*, Float64*, HRESULT)
    set_noise_reduction : Proc(IWICDevelopRaw*, Float64, HRESULT)
    get_noise_reduction : Proc(IWICDevelopRaw*, Float64*, HRESULT)
    set_destination_color_context : Proc(IWICDevelopRaw*, IWICColorContext, HRESULT)
    set_tone_curve : Proc(IWICDevelopRaw*, UInt32, WICRawToneCurve*, HRESULT)
    get_tone_curve : Proc(IWICDevelopRaw*, UInt32, WICRawToneCurve*, UInt32*, HRESULT)
    set_rotation : Proc(IWICDevelopRaw*, Float64, HRESULT)
    get_rotation : Proc(IWICDevelopRaw*, Float64*, HRESULT)
    set_render_mode : Proc(IWICDevelopRaw*, WICRawRenderMode, HRESULT)
    get_render_mode : Proc(IWICDevelopRaw*, WICRawRenderMode*, HRESULT)
    set_notification_callback : Proc(IWICDevelopRaw*, IWICDevelopRawNotificationCallback, HRESULT)
  end

  IWICDevelopRaw_GUID = "fbec5e44-f7be-4b65-b7f8-c0c81fef026d"
  IID_IWICDevelopRaw = LibC::GUID.new(0xfbec5e44_u32, 0xf7be_u16, 0x4b65_u16, StaticArray[0xb7_u8, 0xf8_u8, 0xc0_u8, 0xc8_u8, 0x1f_u8, 0xef_u8, 0x2_u8, 0x6d_u8])
  struct IWICDevelopRaw
    lpVtbl : IWICDevelopRawVTbl*
  end

  struct IWICDdsDecoderVTbl
    query_interface : Proc(IWICDdsDecoder*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICDdsDecoder*, UInt32)
    release : Proc(IWICDdsDecoder*, UInt32)
    get_parameters : Proc(IWICDdsDecoder*, WICDdsParameters*, HRESULT)
    get_frame : Proc(IWICDdsDecoder*, UInt32, UInt32, UInt32, IWICBitmapFrameDecode*, HRESULT)
  end

  IWICDdsDecoder_GUID = "409cd537-8532-40cb-9774-e2feb2df4e9c"
  IID_IWICDdsDecoder = LibC::GUID.new(0x409cd537_u32, 0x8532_u16, 0x40cb_u16, StaticArray[0x97_u8, 0x74_u8, 0xe2_u8, 0xfe_u8, 0xb2_u8, 0xdf_u8, 0x4e_u8, 0x9c_u8])
  struct IWICDdsDecoder
    lpVtbl : IWICDdsDecoderVTbl*
  end

  struct IWICDdsEncoderVTbl
    query_interface : Proc(IWICDdsEncoder*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICDdsEncoder*, UInt32)
    release : Proc(IWICDdsEncoder*, UInt32)
    set_parameters : Proc(IWICDdsEncoder*, WICDdsParameters*, HRESULT)
    get_parameters : Proc(IWICDdsEncoder*, WICDdsParameters*, HRESULT)
    create_new_frame : Proc(IWICDdsEncoder*, IWICBitmapFrameEncode*, UInt32*, UInt32*, UInt32*, HRESULT)
  end

  IWICDdsEncoder_GUID = "5cacdb4c-407e-41b3-b936-d0f010cd6732"
  IID_IWICDdsEncoder = LibC::GUID.new(0x5cacdb4c_u32, 0x407e_u16, 0x41b3_u16, StaticArray[0xb9_u8, 0x36_u8, 0xd0_u8, 0xf0_u8, 0x10_u8, 0xcd_u8, 0x67_u8, 0x32_u8])
  struct IWICDdsEncoder
    lpVtbl : IWICDdsEncoderVTbl*
  end

  struct IWICDdsFrameDecodeVTbl
    query_interface : Proc(IWICDdsFrameDecode*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICDdsFrameDecode*, UInt32)
    release : Proc(IWICDdsFrameDecode*, UInt32)
    get_size_in_blocks : Proc(IWICDdsFrameDecode*, UInt32*, UInt32*, HRESULT)
    get_format_info : Proc(IWICDdsFrameDecode*, WICDdsFormatInfo*, HRESULT)
    copy_blocks : Proc(IWICDdsFrameDecode*, WICRect*, UInt32, UInt32, UInt8*, HRESULT)
  end

  IWICDdsFrameDecode_GUID = "3d4c0c61-18a4-41e4-bd80-481a4fc9f464"
  IID_IWICDdsFrameDecode = LibC::GUID.new(0x3d4c0c61_u32, 0x18a4_u16, 0x41e4_u16, StaticArray[0xbd_u8, 0x80_u8, 0x48_u8, 0x1a_u8, 0x4f_u8, 0xc9_u8, 0xf4_u8, 0x64_u8])
  struct IWICDdsFrameDecode
    lpVtbl : IWICDdsFrameDecodeVTbl*
  end

  struct IWICJpegFrameDecodeVTbl
    query_interface : Proc(IWICJpegFrameDecode*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICJpegFrameDecode*, UInt32)
    release : Proc(IWICJpegFrameDecode*, UInt32)
    does_support_indexing : Proc(IWICJpegFrameDecode*, LibC::BOOL*, HRESULT)
    set_indexing : Proc(IWICJpegFrameDecode*, WICJpegIndexingOptions, UInt32, HRESULT)
    clear_indexing : Proc(IWICJpegFrameDecode*, HRESULT)
    get_ac_huffman_table : Proc(IWICJpegFrameDecode*, UInt32, UInt32, DXGI_JPEG_AC_HUFFMAN_TABLE*, HRESULT)
    get_dc_huffman_table : Proc(IWICJpegFrameDecode*, UInt32, UInt32, DXGI_JPEG_DC_HUFFMAN_TABLE*, HRESULT)
    get_quantization_table : Proc(IWICJpegFrameDecode*, UInt32, UInt32, DXGI_JPEG_QUANTIZATION_TABLE*, HRESULT)
    get_frame_header : Proc(IWICJpegFrameDecode*, WICJpegFrameHeader*, HRESULT)
    get_scan_header : Proc(IWICJpegFrameDecode*, UInt32, WICJpegScanHeader*, HRESULT)
    copy_scan : Proc(IWICJpegFrameDecode*, UInt32, UInt32, UInt32, UInt8*, UInt32*, HRESULT)
    copy_minimal_stream : Proc(IWICJpegFrameDecode*, UInt32, UInt32, UInt8*, UInt32*, HRESULT)
  end

  IWICJpegFrameDecode_GUID = "8939f66e-c46a-4c21-a9d1-98b327ce1679"
  IID_IWICJpegFrameDecode = LibC::GUID.new(0x8939f66e_u32, 0xc46a_u16, 0x4c21_u16, StaticArray[0xa9_u8, 0xd1_u8, 0x98_u8, 0xb3_u8, 0x27_u8, 0xce_u8, 0x16_u8, 0x79_u8])
  struct IWICJpegFrameDecode
    lpVtbl : IWICJpegFrameDecodeVTbl*
  end

  struct IWICJpegFrameEncodeVTbl
    query_interface : Proc(IWICJpegFrameEncode*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICJpegFrameEncode*, UInt32)
    release : Proc(IWICJpegFrameEncode*, UInt32)
    get_ac_huffman_table : Proc(IWICJpegFrameEncode*, UInt32, UInt32, DXGI_JPEG_AC_HUFFMAN_TABLE*, HRESULT)
    get_dc_huffman_table : Proc(IWICJpegFrameEncode*, UInt32, UInt32, DXGI_JPEG_DC_HUFFMAN_TABLE*, HRESULT)
    get_quantization_table : Proc(IWICJpegFrameEncode*, UInt32, UInt32, DXGI_JPEG_QUANTIZATION_TABLE*, HRESULT)
    write_scan : Proc(IWICJpegFrameEncode*, UInt32, UInt8*, HRESULT)
  end

  IWICJpegFrameEncode_GUID = "2f0c601f-d2c6-468c-abfa-49495d983ed1"
  IID_IWICJpegFrameEncode = LibC::GUID.new(0x2f0c601f_u32, 0xd2c6_u16, 0x468c_u16, StaticArray[0xab_u8, 0xfa_u8, 0x49_u8, 0x49_u8, 0x5d_u8, 0x98_u8, 0x3e_u8, 0xd1_u8])
  struct IWICJpegFrameEncode
    lpVtbl : IWICJpegFrameEncodeVTbl*
  end

  struct IWICMetadataBlockReaderVTbl
    query_interface : Proc(IWICMetadataBlockReader*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICMetadataBlockReader*, UInt32)
    release : Proc(IWICMetadataBlockReader*, UInt32)
    get_container_format : Proc(IWICMetadataBlockReader*, Guid*, HRESULT)
    get_count : Proc(IWICMetadataBlockReader*, UInt32*, HRESULT)
    get_reader_by_index : Proc(IWICMetadataBlockReader*, UInt32, IWICMetadataReader*, HRESULT)
    get_enumerator : Proc(IWICMetadataBlockReader*, IEnumUnknown*, HRESULT)
  end

  IWICMetadataBlockReader_GUID = "feaa2a8d-b3f3-43e4-b25c-d1de990a1ae1"
  IID_IWICMetadataBlockReader = LibC::GUID.new(0xfeaa2a8d_u32, 0xb3f3_u16, 0x43e4_u16, StaticArray[0xb2_u8, 0x5c_u8, 0xd1_u8, 0xde_u8, 0x99_u8, 0xa_u8, 0x1a_u8, 0xe1_u8])
  struct IWICMetadataBlockReader
    lpVtbl : IWICMetadataBlockReaderVTbl*
  end

  struct IWICMetadataBlockWriterVTbl
    query_interface : Proc(IWICMetadataBlockWriter*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICMetadataBlockWriter*, UInt32)
    release : Proc(IWICMetadataBlockWriter*, UInt32)
    get_container_format : Proc(IWICMetadataBlockWriter*, Guid*, HRESULT)
    get_count : Proc(IWICMetadataBlockWriter*, UInt32*, HRESULT)
    get_reader_by_index : Proc(IWICMetadataBlockWriter*, UInt32, IWICMetadataReader*, HRESULT)
    get_enumerator : Proc(IWICMetadataBlockWriter*, IEnumUnknown*, HRESULT)
    initialize_from_block_reader : Proc(IWICMetadataBlockWriter*, IWICMetadataBlockReader, HRESULT)
    get_writer_by_index : Proc(IWICMetadataBlockWriter*, UInt32, IWICMetadataWriter*, HRESULT)
    add_writer : Proc(IWICMetadataBlockWriter*, IWICMetadataWriter, HRESULT)
    set_writer_by_index : Proc(IWICMetadataBlockWriter*, UInt32, IWICMetadataWriter, HRESULT)
    remove_writer_by_index : Proc(IWICMetadataBlockWriter*, UInt32, HRESULT)
  end

  IWICMetadataBlockWriter_GUID = "08fb9676-b444-41e8-8dbe-6a53a542bff1"
  IID_IWICMetadataBlockWriter = LibC::GUID.new(0x8fb9676_u32, 0xb444_u16, 0x41e8_u16, StaticArray[0x8d_u8, 0xbe_u8, 0x6a_u8, 0x53_u8, 0xa5_u8, 0x42_u8, 0xbf_u8, 0xf1_u8])
  struct IWICMetadataBlockWriter
    lpVtbl : IWICMetadataBlockWriterVTbl*
  end

  struct IWICMetadataReaderVTbl
    query_interface : Proc(IWICMetadataReader*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICMetadataReader*, UInt32)
    release : Proc(IWICMetadataReader*, UInt32)
    get_metadata_format : Proc(IWICMetadataReader*, Guid*, HRESULT)
    get_metadata_handler_info : Proc(IWICMetadataReader*, IWICMetadataHandlerInfo*, HRESULT)
    get_count : Proc(IWICMetadataReader*, UInt32*, HRESULT)
    get_value_by_index : Proc(IWICMetadataReader*, UInt32, PROPVARIANT*, PROPVARIANT*, PROPVARIANT*, HRESULT)
    get_value : Proc(IWICMetadataReader*, PROPVARIANT*, PROPVARIANT*, PROPVARIANT*, HRESULT)
    get_enumerator : Proc(IWICMetadataReader*, IWICEnumMetadataItem*, HRESULT)
  end

  IWICMetadataReader_GUID = "9204fe99-d8fc-4fd5-a001-9536b067a899"
  IID_IWICMetadataReader = LibC::GUID.new(0x9204fe99_u32, 0xd8fc_u16, 0x4fd5_u16, StaticArray[0xa0_u8, 0x1_u8, 0x95_u8, 0x36_u8, 0xb0_u8, 0x67_u8, 0xa8_u8, 0x99_u8])
  struct IWICMetadataReader
    lpVtbl : IWICMetadataReaderVTbl*
  end

  struct IWICMetadataWriterVTbl
    query_interface : Proc(IWICMetadataWriter*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICMetadataWriter*, UInt32)
    release : Proc(IWICMetadataWriter*, UInt32)
    get_metadata_format : Proc(IWICMetadataWriter*, Guid*, HRESULT)
    get_metadata_handler_info : Proc(IWICMetadataWriter*, IWICMetadataHandlerInfo*, HRESULT)
    get_count : Proc(IWICMetadataWriter*, UInt32*, HRESULT)
    get_value_by_index : Proc(IWICMetadataWriter*, UInt32, PROPVARIANT*, PROPVARIANT*, PROPVARIANT*, HRESULT)
    get_value : Proc(IWICMetadataWriter*, PROPVARIANT*, PROPVARIANT*, PROPVARIANT*, HRESULT)
    get_enumerator : Proc(IWICMetadataWriter*, IWICEnumMetadataItem*, HRESULT)
    set_value : Proc(IWICMetadataWriter*, PROPVARIANT*, PROPVARIANT*, PROPVARIANT*, HRESULT)
    set_value_by_index : Proc(IWICMetadataWriter*, UInt32, PROPVARIANT*, PROPVARIANT*, PROPVARIANT*, HRESULT)
    remove_value : Proc(IWICMetadataWriter*, PROPVARIANT*, PROPVARIANT*, HRESULT)
    remove_value_by_index : Proc(IWICMetadataWriter*, UInt32, HRESULT)
  end

  IWICMetadataWriter_GUID = "f7836e16-3be0-470b-86bb-160d0aecd7de"
  IID_IWICMetadataWriter = LibC::GUID.new(0xf7836e16_u32, 0x3be0_u16, 0x470b_u16, StaticArray[0x86_u8, 0xbb_u8, 0x16_u8, 0xd_u8, 0xa_u8, 0xec_u8, 0xd7_u8, 0xde_u8])
  struct IWICMetadataWriter
    lpVtbl : IWICMetadataWriterVTbl*
  end

  struct IWICStreamProviderVTbl
    query_interface : Proc(IWICStreamProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICStreamProvider*, UInt32)
    release : Proc(IWICStreamProvider*, UInt32)
    get_stream : Proc(IWICStreamProvider*, IStream*, HRESULT)
    get_persist_options : Proc(IWICStreamProvider*, UInt32*, HRESULT)
    get_preferred_vendor_guid : Proc(IWICStreamProvider*, Guid*, HRESULT)
    refresh_stream : Proc(IWICStreamProvider*, HRESULT)
  end

  IWICStreamProvider_GUID = "449494bc-b468-4927-96d7-ba90d31ab505"
  IID_IWICStreamProvider = LibC::GUID.new(0x449494bc_u32, 0xb468_u16, 0x4927_u16, StaticArray[0x96_u8, 0xd7_u8, 0xba_u8, 0x90_u8, 0xd3_u8, 0x1a_u8, 0xb5_u8, 0x5_u8])
  struct IWICStreamProvider
    lpVtbl : IWICStreamProviderVTbl*
  end

  struct IWICPersistStreamVTbl
    query_interface : Proc(IWICPersistStream*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICPersistStream*, UInt32)
    release : Proc(IWICPersistStream*, UInt32)
    get_class_id : Proc(IWICPersistStream*, Guid*, HRESULT)
    is_dirty : Proc(IWICPersistStream*, HRESULT)
    load : Proc(IWICPersistStream*, IStream, HRESULT)
    save : Proc(IWICPersistStream*, IStream, LibC::BOOL, HRESULT)
    get_size_max : Proc(IWICPersistStream*, ULARGE_INTEGER*, HRESULT)
    load_ex : Proc(IWICPersistStream*, IStream, Guid*, UInt32, HRESULT)
    save_ex : Proc(IWICPersistStream*, IStream, UInt32, LibC::BOOL, HRESULT)
  end

  IWICPersistStream_GUID = "00675040-6908-45f8-86a3-49c7dfd6d9ad"
  IID_IWICPersistStream = LibC::GUID.new(0x675040_u32, 0x6908_u16, 0x45f8_u16, StaticArray[0x86_u8, 0xa3_u8, 0x49_u8, 0xc7_u8, 0xdf_u8, 0xd6_u8, 0xd9_u8, 0xad_u8])
  struct IWICPersistStream
    lpVtbl : IWICPersistStreamVTbl*
  end

  struct IWICMetadataHandlerInfoVTbl
    query_interface : Proc(IWICMetadataHandlerInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICMetadataHandlerInfo*, UInt32)
    release : Proc(IWICMetadataHandlerInfo*, UInt32)
    get_component_type : Proc(IWICMetadataHandlerInfo*, WICComponentType*, HRESULT)
    get_clsid : Proc(IWICMetadataHandlerInfo*, Guid*, HRESULT)
    get_signing_status : Proc(IWICMetadataHandlerInfo*, UInt32*, HRESULT)
    get_author : Proc(IWICMetadataHandlerInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_vendor_guid : Proc(IWICMetadataHandlerInfo*, Guid*, HRESULT)
    get_version : Proc(IWICMetadataHandlerInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_spec_version : Proc(IWICMetadataHandlerInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_friendly_name : Proc(IWICMetadataHandlerInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_metadata_format : Proc(IWICMetadataHandlerInfo*, Guid*, HRESULT)
    get_container_formats : Proc(IWICMetadataHandlerInfo*, UInt32, Guid*, UInt32*, HRESULT)
    get_device_manufacturer : Proc(IWICMetadataHandlerInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_device_models : Proc(IWICMetadataHandlerInfo*, UInt32, Char*, UInt32*, HRESULT)
    does_require_full_stream : Proc(IWICMetadataHandlerInfo*, LibC::BOOL*, HRESULT)
    does_support_padding : Proc(IWICMetadataHandlerInfo*, LibC::BOOL*, HRESULT)
    does_require_fixed_size : Proc(IWICMetadataHandlerInfo*, LibC::BOOL*, HRESULT)
  end

  IWICMetadataHandlerInfo_GUID = "aba958bf-c672-44d1-8d61-ce6df2e682c2"
  IID_IWICMetadataHandlerInfo = LibC::GUID.new(0xaba958bf_u32, 0xc672_u16, 0x44d1_u16, StaticArray[0x8d_u8, 0x61_u8, 0xce_u8, 0x6d_u8, 0xf2_u8, 0xe6_u8, 0x82_u8, 0xc2_u8])
  struct IWICMetadataHandlerInfo
    lpVtbl : IWICMetadataHandlerInfoVTbl*
  end

  struct IWICMetadataReaderInfoVTbl
    query_interface : Proc(IWICMetadataReaderInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICMetadataReaderInfo*, UInt32)
    release : Proc(IWICMetadataReaderInfo*, UInt32)
    get_component_type : Proc(IWICMetadataReaderInfo*, WICComponentType*, HRESULT)
    get_clsid : Proc(IWICMetadataReaderInfo*, Guid*, HRESULT)
    get_signing_status : Proc(IWICMetadataReaderInfo*, UInt32*, HRESULT)
    get_author : Proc(IWICMetadataReaderInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_vendor_guid : Proc(IWICMetadataReaderInfo*, Guid*, HRESULT)
    get_version : Proc(IWICMetadataReaderInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_spec_version : Proc(IWICMetadataReaderInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_friendly_name : Proc(IWICMetadataReaderInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_metadata_format : Proc(IWICMetadataReaderInfo*, Guid*, HRESULT)
    get_container_formats : Proc(IWICMetadataReaderInfo*, UInt32, Guid*, UInt32*, HRESULT)
    get_device_manufacturer : Proc(IWICMetadataReaderInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_device_models : Proc(IWICMetadataReaderInfo*, UInt32, Char*, UInt32*, HRESULT)
    does_require_full_stream : Proc(IWICMetadataReaderInfo*, LibC::BOOL*, HRESULT)
    does_support_padding : Proc(IWICMetadataReaderInfo*, LibC::BOOL*, HRESULT)
    does_require_fixed_size : Proc(IWICMetadataReaderInfo*, LibC::BOOL*, HRESULT)
    get_patterns : Proc(IWICMetadataReaderInfo*, Guid*, UInt32, WICMetadataPattern*, UInt32*, UInt32*, HRESULT)
    matches_pattern : Proc(IWICMetadataReaderInfo*, Guid*, IStream, LibC::BOOL*, HRESULT)
    create_instance : Proc(IWICMetadataReaderInfo*, IWICMetadataReader*, HRESULT)
  end

  IWICMetadataReaderInfo_GUID = "eebf1f5b-07c1-4447-a3ab-22acaf78a804"
  IID_IWICMetadataReaderInfo = LibC::GUID.new(0xeebf1f5b_u32, 0x7c1_u16, 0x4447_u16, StaticArray[0xa3_u8, 0xab_u8, 0x22_u8, 0xac_u8, 0xaf_u8, 0x78_u8, 0xa8_u8, 0x4_u8])
  struct IWICMetadataReaderInfo
    lpVtbl : IWICMetadataReaderInfoVTbl*
  end

  struct IWICMetadataWriterInfoVTbl
    query_interface : Proc(IWICMetadataWriterInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICMetadataWriterInfo*, UInt32)
    release : Proc(IWICMetadataWriterInfo*, UInt32)
    get_component_type : Proc(IWICMetadataWriterInfo*, WICComponentType*, HRESULT)
    get_clsid : Proc(IWICMetadataWriterInfo*, Guid*, HRESULT)
    get_signing_status : Proc(IWICMetadataWriterInfo*, UInt32*, HRESULT)
    get_author : Proc(IWICMetadataWriterInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_vendor_guid : Proc(IWICMetadataWriterInfo*, Guid*, HRESULT)
    get_version : Proc(IWICMetadataWriterInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_spec_version : Proc(IWICMetadataWriterInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_friendly_name : Proc(IWICMetadataWriterInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_metadata_format : Proc(IWICMetadataWriterInfo*, Guid*, HRESULT)
    get_container_formats : Proc(IWICMetadataWriterInfo*, UInt32, Guid*, UInt32*, HRESULT)
    get_device_manufacturer : Proc(IWICMetadataWriterInfo*, UInt32, Char*, UInt32*, HRESULT)
    get_device_models : Proc(IWICMetadataWriterInfo*, UInt32, Char*, UInt32*, HRESULT)
    does_require_full_stream : Proc(IWICMetadataWriterInfo*, LibC::BOOL*, HRESULT)
    does_support_padding : Proc(IWICMetadataWriterInfo*, LibC::BOOL*, HRESULT)
    does_require_fixed_size : Proc(IWICMetadataWriterInfo*, LibC::BOOL*, HRESULT)
    get_header : Proc(IWICMetadataWriterInfo*, Guid*, UInt32, WICMetadataHeader*, UInt32*, HRESULT)
    create_instance : Proc(IWICMetadataWriterInfo*, IWICMetadataWriter*, HRESULT)
  end

  IWICMetadataWriterInfo_GUID = "b22e3fba-3925-4323-b5c1-9ebfc430f236"
  IID_IWICMetadataWriterInfo = LibC::GUID.new(0xb22e3fba_u32, 0x3925_u16, 0x4323_u16, StaticArray[0xb5_u8, 0xc1_u8, 0x9e_u8, 0xbf_u8, 0xc4_u8, 0x30_u8, 0xf2_u8, 0x36_u8])
  struct IWICMetadataWriterInfo
    lpVtbl : IWICMetadataWriterInfoVTbl*
  end

  struct IWICComponentFactoryVTbl
    query_interface : Proc(IWICComponentFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICComponentFactory*, UInt32)
    release : Proc(IWICComponentFactory*, UInt32)
    create_decoder_from_filename : Proc(IWICComponentFactory*, LibC::LPWSTR, Guid*, UInt32, WICDecodeOptions, IWICBitmapDecoder*, HRESULT)
    create_decoder_from_stream : Proc(IWICComponentFactory*, IStream, Guid*, WICDecodeOptions, IWICBitmapDecoder*, HRESULT)
    create_decoder_from_file_handle : Proc(IWICComponentFactory*, LibC::UINT_PTR, Guid*, WICDecodeOptions, IWICBitmapDecoder*, HRESULT)
    create_component_info : Proc(IWICComponentFactory*, Guid*, IWICComponentInfo*, HRESULT)
    create_decoder : Proc(IWICComponentFactory*, Guid*, Guid*, IWICBitmapDecoder*, HRESULT)
    create_encoder : Proc(IWICComponentFactory*, Guid*, Guid*, IWICBitmapEncoder*, HRESULT)
    create_palette : Proc(IWICComponentFactory*, IWICPalette*, HRESULT)
    create_format_converter : Proc(IWICComponentFactory*, IWICFormatConverter*, HRESULT)
    create_bitmap_scaler : Proc(IWICComponentFactory*, IWICBitmapScaler*, HRESULT)
    create_bitmap_clipper : Proc(IWICComponentFactory*, IWICBitmapClipper*, HRESULT)
    create_bitmap_flip_rotator : Proc(IWICComponentFactory*, IWICBitmapFlipRotator*, HRESULT)
    create_stream : Proc(IWICComponentFactory*, IWICStream*, HRESULT)
    create_color_context : Proc(IWICComponentFactory*, IWICColorContext*, HRESULT)
    create_color_transformer : Proc(IWICComponentFactory*, IWICColorTransform*, HRESULT)
    create_bitmap : Proc(IWICComponentFactory*, UInt32, UInt32, Guid*, WICBitmapCreateCacheOption, IWICBitmap*, HRESULT)
    create_bitmap_from_source : Proc(IWICComponentFactory*, IWICBitmapSource, WICBitmapCreateCacheOption, IWICBitmap*, HRESULT)
    create_bitmap_from_source_rect : Proc(IWICComponentFactory*, IWICBitmapSource, UInt32, UInt32, UInt32, UInt32, IWICBitmap*, HRESULT)
    create_bitmap_from_memory : Proc(IWICComponentFactory*, UInt32, UInt32, Guid*, UInt32, UInt32, UInt8*, IWICBitmap*, HRESULT)
    create_bitmap_from_hbitmap : Proc(IWICComponentFactory*, HBITMAP, HPALETTE, WICBitmapAlphaChannelOption, IWICBitmap*, HRESULT)
    create_bitmap_from_hicon : Proc(IWICComponentFactory*, LibC::HANDLE, IWICBitmap*, HRESULT)
    create_component_enumerator : Proc(IWICComponentFactory*, UInt32, UInt32, IEnumUnknown*, HRESULT)
    create_fast_metadata_encoder_from_decoder : Proc(IWICComponentFactory*, IWICBitmapDecoder, IWICFastMetadataEncoder*, HRESULT)
    create_fast_metadata_encoder_from_frame_decode : Proc(IWICComponentFactory*, IWICBitmapFrameDecode, IWICFastMetadataEncoder*, HRESULT)
    create_query_writer : Proc(IWICComponentFactory*, Guid*, Guid*, IWICMetadataQueryWriter*, HRESULT)
    create_query_writer_from_reader : Proc(IWICComponentFactory*, IWICMetadataQueryReader, Guid*, IWICMetadataQueryWriter*, HRESULT)
    create_metadata_reader : Proc(IWICComponentFactory*, Guid*, Guid*, UInt32, IStream, IWICMetadataReader*, HRESULT)
    create_metadata_reader_from_container : Proc(IWICComponentFactory*, Guid*, Guid*, UInt32, IStream, IWICMetadataReader*, HRESULT)
    create_metadata_writer : Proc(IWICComponentFactory*, Guid*, Guid*, UInt32, IWICMetadataWriter*, HRESULT)
    create_metadata_writer_from_reader : Proc(IWICComponentFactory*, IWICMetadataReader, Guid*, IWICMetadataWriter*, HRESULT)
    create_query_reader_from_block_reader : Proc(IWICComponentFactory*, IWICMetadataBlockReader, IWICMetadataQueryReader*, HRESULT)
    create_query_writer_from_block_writer : Proc(IWICComponentFactory*, IWICMetadataBlockWriter, IWICMetadataQueryWriter*, HRESULT)
    create_encoder_property_bag : Proc(IWICComponentFactory*, PROPBAG2*, UInt32, IPropertyBag2*, HRESULT)
  end

  IWICComponentFactory_GUID = "412d0c3a-9650-44fa-af5b-dd2a06c8e8fb"
  IID_IWICComponentFactory = LibC::GUID.new(0x412d0c3a_u32, 0x9650_u16, 0x44fa_u16, StaticArray[0xaf_u8, 0x5b_u8, 0xdd_u8, 0x2a_u8, 0x6_u8, 0xc8_u8, 0xe8_u8, 0xfb_u8])
  struct IWICComponentFactory
    lpVtbl : IWICComponentFactoryVTbl*
  end


  # Params # dstformat : Guid* [In],pisrc : IWICBitmapSource [In],ppidst : IWICBitmapSource* [In]
  fun WICConvertBitmapSource(dstformat : Guid*, pisrc : IWICBitmapSource, ppidst : IWICBitmapSource*) : HRESULT

  # Params # width : UInt32 [In],height : UInt32 [In],pixelformat : Guid* [In],hsection : LibC::HANDLE [In],stride : UInt32 [In],offset : UInt32 [In],ppibitmap : IWICBitmap* [In]
  fun WICCreateBitmapFromSection(width : UInt32, height : UInt32, pixelformat : Guid*, hsection : LibC::HANDLE, stride : UInt32, offset : UInt32, ppibitmap : IWICBitmap*) : HRESULT

  # Params # width : UInt32 [In],height : UInt32 [In],pixelformat : Guid* [In],hsection : LibC::HANDLE [In],stride : UInt32 [In],offset : UInt32 [In],desiredaccesslevel : WICSectionAccessLevel [In],ppibitmap : IWICBitmap* [In]
  fun WICCreateBitmapFromSectionEx(width : UInt32, height : UInt32, pixelformat : Guid*, hsection : LibC::HANDLE, stride : UInt32, offset : UInt32, desiredaccesslevel : WICSectionAccessLevel, ppibitmap : IWICBitmap*) : HRESULT

  # Params # guid : Guid* [In],cchname : UInt32 [In],wzname : Char* [In],pcchactual : UInt32* [In]
  fun WICMapGuidToShortName(guid : Guid*, cchname : UInt32, wzname : Char*, pcchactual : UInt32*) : HRESULT

  # Params # wzname : LibC::LPWSTR [In],pguid : Guid* [In]
  fun WICMapShortNameToGuid(wzname : LibC::LPWSTR, pguid : Guid*) : HRESULT

  # Params # guidmetadataformat : Guid* [In],pwzschema : LibC::LPWSTR [In],cchname : UInt32 [In],wzname : Char* [In],pcchactual : UInt32* [In]
  fun WICMapSchemaToName(guidmetadataformat : Guid*, pwzschema : LibC::LPWSTR, cchname : UInt32, wzname : Char*, pcchactual : UInt32*) : HRESULT

  # Params # guidcontainerformat : Guid* [In],pguidvendor : Guid* [In],pistream : IStream [In],pguidmetadataformat : Guid* [In]
  fun WICMatchMetadataContent(guidcontainerformat : Guid*, pguidvendor : Guid*, pistream : IStream, pguidmetadataformat : Guid*) : HRESULT

  # Params # guidcontainerformat : Guid* [In],piwriter : IWICMetadataWriter [In],dwpersistoptions : UInt32 [In],pistream : IStream [In]
  fun WICSerializeMetadataContent(guidcontainerformat : Guid*, piwriter : IWICMetadataWriter, dwpersistoptions : UInt32, pistream : IStream) : HRESULT

  # Params # guidcontainerformat : Guid* [In],piwriter : IWICMetadataWriter [In],pcbsize : ULARGE_INTEGER* [In]
  fun WICGetMetadataContentSize(guidcontainerformat : Guid*, piwriter : IWICMetadataWriter, pcbsize : ULARGE_INTEGER*) : HRESULT
end