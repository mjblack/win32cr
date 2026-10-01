require "./../foundation.cr"
require "./direct2_d/common.cr"
require "./../system/com.cr"
require "./../system/com/structured_storage.cr"
require "./gdi.cr"
require "./../ui/windows_and_messaging.cr"
require "./dxgi/common.cr"

module Win32cr::Graphics::Imaging
  extend self
  alias PFNProgressNotification = Proc(Void*, UInt32, Win32cr::Graphics::Imaging::WICProgressOperation, Float64, Win32cr::Foundation::HRESULT)

  WINCODEC_SDK_VERSION1 = 566_u32
  WINCODEC_SDK_VERSION2 = 567_u32
  CLSID_WICImagingFactory = LibC::GUID.new(0xcacaf262_u32, 0x9370_u16, 0x4615_u16, StaticArray[0xa1_u8, 0x3b_u8, 0x9f_u8, 0x55_u8, 0x39_u8, 0xda_u8, 0x4c_u8, 0xa_u8])
  CLSID_WICImagingFactory1 = LibC::GUID.new(0xcacaf262_u32, 0x9370_u16, 0x4615_u16, StaticArray[0xa1_u8, 0x3b_u8, 0x9f_u8, 0x55_u8, 0x39_u8, 0xda_u8, 0x4c_u8, 0xa_u8])
  CLSID_WICImagingFactory2 = LibC::GUID.new(0x317d06e8_u32, 0x5f24_u16, 0x433d_u16, StaticArray[0xbd_u8, 0xf7_u8, 0x79_u8, 0xce_u8, 0x68_u8, 0xd8_u8, 0xab_u8, 0xc2_u8])
  WINCODEC_SDK_VERSION = 567_u32
  GUID_VendorMicrosoft = LibC::GUID.new(0xf0e749ca_u32, 0xedef_u16, 0x4589_u16, StaticArray[0xa7_u8, 0x3a_u8, 0xee_u8, 0xe_u8, 0x62_u8, 0x6a_u8, 0x2a_u8, 0x2b_u8])
  GUID_VendorMicrosoftBuiltIn = LibC::GUID.new(0x257a30fd_u32, 0x6b6_u16, 0x462b_u16, StaticArray[0xae_u8, 0xa4_u8, 0x63_u8, 0xf7_u8, 0xb_u8, 0x86_u8, 0xe5_u8, 0x33_u8])
  CLSID_WICPngDecoder = LibC::GUID.new(0x389ea17b_u32, 0x5078_u16, 0x4cde_u16, StaticArray[0xb6_u8, 0xef_u8, 0x25_u8, 0xc1_u8, 0x51_u8, 0x75_u8, 0xc7_u8, 0x51_u8])
  CLSID_WICPngDecoder1 = LibC::GUID.new(0x389ea17b_u32, 0x5078_u16, 0x4cde_u16, StaticArray[0xb6_u8, 0xef_u8, 0x25_u8, 0xc1_u8, 0x51_u8, 0x75_u8, 0xc7_u8, 0x51_u8])
  CLSID_WICPngDecoder2 = LibC::GUID.new(0xe018945b_u32, 0xaa86_u16, 0x4008_u16, StaticArray[0x9b_u8, 0xd4_u8, 0x67_u8, 0x77_u8, 0xa1_u8, 0xe4_u8, 0xc_u8, 0x11_u8])
  CLSID_WICBmpDecoder = LibC::GUID.new(0x6b462062_u32, 0x7cbf_u16, 0x400d_u16, StaticArray[0x9f_u8, 0xdb_u8, 0x81_u8, 0x3d_u8, 0xd1_u8, 0xf_u8, 0x27_u8, 0x78_u8])
  CLSID_WICIcoDecoder = LibC::GUID.new(0xc61bfcdf_u32, 0x2e0f_u16, 0x4aad_u16, StaticArray[0xa8_u8, 0xd7_u8, 0xe0_u8, 0x6b_u8, 0xaf_u8, 0xeb_u8, 0xcd_u8, 0xfe_u8])
  CLSID_WICJpegDecoder = LibC::GUID.new(0x9456a480_u32, 0xe88b_u16, 0x43ea_u16, StaticArray[0x9e_u8, 0x73_u8, 0xb_u8, 0x2d_u8, 0x9b_u8, 0x71_u8, 0xb1_u8, 0xca_u8])
  CLSID_WICGifDecoder = LibC::GUID.new(0x381dda3c_u32, 0x9ce9_u16, 0x4834_u16, StaticArray[0xa2_u8, 0x3e_u8, 0x1f_u8, 0x98_u8, 0xf8_u8, 0xfc_u8, 0x52_u8, 0xbe_u8])
  CLSID_WICTiffDecoder = LibC::GUID.new(0xb54e85d9_u32, 0xfe23_u16, 0x499f_u16, StaticArray[0x8b_u8, 0x88_u8, 0x6a_u8, 0xce_u8, 0xa7_u8, 0x13_u8, 0x75_u8, 0x2b_u8])
  CLSID_WICWmpDecoder = LibC::GUID.new(0xa26cec36_u32, 0x234c_u16, 0x4950_u16, StaticArray[0xae_u8, 0x16_u8, 0xe3_u8, 0x4a_u8, 0xac_u8, 0xe7_u8, 0x1d_u8, 0xd_u8])
  CLSID_WICDdsDecoder = LibC::GUID.new(0x9053699f_u32, 0xa341_u16, 0x429d_u16, StaticArray[0x9e_u8, 0x90_u8, 0xee_u8, 0x43_u8, 0x7c_u8, 0xf8_u8, 0xc_u8, 0x73_u8])
  CLSID_WICBmpEncoder = LibC::GUID.new(0x69be8bb4_u32, 0xd66d_u16, 0x47c8_u16, StaticArray[0x86_u8, 0x5a_u8, 0xed_u8, 0x15_u8, 0x89_u8, 0x43_u8, 0x37_u8, 0x82_u8])
  CLSID_WICPngEncoder = LibC::GUID.new(0x27949969_u32, 0x876a_u16, 0x41d7_u16, StaticArray[0x94_u8, 0x47_u8, 0x56_u8, 0x8f_u8, 0x6a_u8, 0x35_u8, 0xa4_u8, 0xdc_u8])
  CLSID_WICJpegEncoder = LibC::GUID.new(0x1a34f5c1_u32, 0x4a5a_u16, 0x46dc_u16, StaticArray[0xb6_u8, 0x44_u8, 0x1f_u8, 0x45_u8, 0x67_u8, 0xe7_u8, 0xa6_u8, 0x76_u8])
  CLSID_WICGifEncoder = LibC::GUID.new(0x114f5598_u32, 0xb22_u16, 0x40a0_u16, StaticArray[0x86_u8, 0xa1_u8, 0xc8_u8, 0x3e_u8, 0xa4_u8, 0x95_u8, 0xad_u8, 0xbd_u8])
  CLSID_WICTiffEncoder = LibC::GUID.new(0x131be10_u32, 0x2001_u16, 0x4c5f_u16, StaticArray[0xa9_u8, 0xb0_u8, 0xcc_u8, 0x88_u8, 0xfa_u8, 0xb6_u8, 0x4c_u8, 0xe8_u8])
  CLSID_WICWmpEncoder = LibC::GUID.new(0xac4ce3cb_u32, 0xe1c1_u16, 0x44cd_u16, StaticArray[0x82_u8, 0x15_u8, 0x5a_u8, 0x16_u8, 0x65_u8, 0x50_u8, 0x9e_u8, 0xc2_u8])
  CLSID_WICDdsEncoder = LibC::GUID.new(0xa61dde94_u32, 0x66ce_u16, 0x4ac1_u16, StaticArray[0x88_u8, 0x1b_u8, 0x71_u8, 0x68_u8, 0x5_u8, 0x88_u8, 0x89_u8, 0x5e_u8])
  CLSID_WICAdngDecoder = LibC::GUID.new(0x981d9411_u32, 0x909e_u16, 0x42a7_u16, StaticArray[0x8f_u8, 0x5d_u8, 0xa7_u8, 0x47_u8, 0xff_u8, 0x5_u8, 0x2e_u8, 0xdb_u8])
  CLSID_WICJpegQualcommPhoneEncoder = LibC::GUID.new(0x68ed5c62_u32, 0xf534_u16, 0x4979_u16, StaticArray[0xb2_u8, 0xb3_u8, 0x68_u8, 0x6a_u8, 0x12_u8, 0xb2_u8, 0xb3_u8, 0x4c_u8])
  CLSID_WICHeifDecoder = LibC::GUID.new(0xe9a4a80a_u32, 0x44fe_u16, 0x4de4_u16, StaticArray[0x89_u8, 0x71_u8, 0x71_u8, 0x50_u8, 0xb1_u8, 0xa_u8, 0x51_u8, 0x99_u8])
  CLSID_WICHeifEncoder = LibC::GUID.new(0xdbecec1_u32, 0x9eb3_u16, 0x4860_u16, StaticArray[0x9c_u8, 0x6f_u8, 0xdd_u8, 0xbe_u8, 0x86_u8, 0x63_u8, 0x45_u8, 0x75_u8])
  CLSID_WICWebpDecoder = LibC::GUID.new(0x7693e886_u32, 0x51c9_u16, 0x4070_u16, StaticArray[0x84_u8, 0x19_u8, 0x9f_u8, 0x70_u8, 0x73_u8, 0x8e_u8, 0xc8_u8, 0xfa_u8])
  CLSID_WICRAWDecoder = LibC::GUID.new(0x41945702_u32, 0x8302_u16, 0x44a6_u16, StaticArray[0x94_u8, 0x45_u8, 0xac_u8, 0x98_u8, 0xe8_u8, 0xaf_u8, 0xa0_u8, 0x86_u8])
  CLSID_WICJpegXLDecoder = LibC::GUID.new(0xfc6ceece_u32, 0xaef5_u16, 0x4a23_u16, StaticArray[0x96_u8, 0xec_u8, 0x59_u8, 0x84_u8, 0xff_u8, 0xb4_u8, 0x86_u8, 0xd9_u8])
  CLSID_WICJpegXLEncoder = LibC::GUID.new(0xe4ecd3b_u32, 0x1ba6_u16, 0x4636_u16, StaticArray[0x81_u8, 0x98_u8, 0x56_u8, 0xc7_u8, 0x30_u8, 0x40_u8, 0x96_u8, 0x4a_u8])
  GUID_ContainerFormatBmp = LibC::GUID.new(0xaf1d87e_u32, 0xfcfe_u16, 0x4188_u16, StaticArray[0xbd_u8, 0xeb_u8, 0xa7_u8, 0x90_u8, 0x64_u8, 0x71_u8, 0xcb_u8, 0xe3_u8])
  GUID_ContainerFormatPng = LibC::GUID.new(0x1b7cfaf4_u32, 0x713f_u16, 0x473c_u16, StaticArray[0xbb_u8, 0xcd_u8, 0x61_u8, 0x37_u8, 0x42_u8, 0x5f_u8, 0xae_u8, 0xaf_u8])
  GUID_ContainerFormatIco = LibC::GUID.new(0xa3a860c4_u32, 0x338f_u16, 0x4c17_u16, StaticArray[0x91_u8, 0x9a_u8, 0xfb_u8, 0xa4_u8, 0xb5_u8, 0x62_u8, 0x8f_u8, 0x21_u8])
  GUID_ContainerFormatJpeg = LibC::GUID.new(0x19e4a5aa_u32, 0x5662_u16, 0x4fc5_u16, StaticArray[0xa0_u8, 0xc0_u8, 0x17_u8, 0x58_u8, 0x2_u8, 0x8e_u8, 0x10_u8, 0x57_u8])
  GUID_ContainerFormatTiff = LibC::GUID.new(0x163bcc30_u32, 0xe2e9_u16, 0x4f0b_u16, StaticArray[0x96_u8, 0x1d_u8, 0xa3_u8, 0xe9_u8, 0xfd_u8, 0xb7_u8, 0x88_u8, 0xa3_u8])
  GUID_ContainerFormatGif = LibC::GUID.new(0x1f8a5601_u32, 0x7d4d_u16, 0x4cbd_u16, StaticArray[0x9c_u8, 0x82_u8, 0x1b_u8, 0xc8_u8, 0xd4_u8, 0xee_u8, 0xb9_u8, 0xa5_u8])
  GUID_ContainerFormatWmp = LibC::GUID.new(0x57a37caa_u32, 0x367a_u16, 0x4540_u16, StaticArray[0x91_u8, 0x6b_u8, 0xf1_u8, 0x83_u8, 0xc5_u8, 0x9_u8, 0x3a_u8, 0x4b_u8])
  GUID_ContainerFormatDds = LibC::GUID.new(0x9967cb95_u32, 0x2e85_u16, 0x4ac8_u16, StaticArray[0x8c_u8, 0xa2_u8, 0x83_u8, 0xd7_u8, 0xcc_u8, 0xd4_u8, 0x25_u8, 0xc9_u8])
  GUID_ContainerFormatAdng = LibC::GUID.new(0xf3ff6d0d_u32, 0x38c0_u16, 0x41c4_u16, StaticArray[0xb1_u8, 0xfe_u8, 0x1f_u8, 0x38_u8, 0x24_u8, 0xf1_u8, 0x7b_u8, 0x84_u8])
  GUID_ContainerFormatHeif = LibC::GUID.new(0xe1e62521_u32, 0x6787_u16, 0x405b_u16, StaticArray[0xa3_u8, 0x39_u8, 0x50_u8, 0x7_u8, 0x15_u8, 0xb5_u8, 0x76_u8, 0x3f_u8])
  GUID_ContainerFormatWebp = LibC::GUID.new(0xe094b0e2_u32, 0x67f2_u16, 0x45b3_u16, StaticArray[0xb0_u8, 0xea_u8, 0x11_u8, 0x53_u8, 0x37_u8, 0xca_u8, 0x7c_u8, 0xf3_u8])
  GUID_ContainerFormatRaw = LibC::GUID.new(0xfe99ce60_u32, 0xf19c_u16, 0x433c_u16, StaticArray[0xa3_u8, 0xae_u8, 0x0_u8, 0xac_u8, 0xef_u8, 0xa9_u8, 0xca_u8, 0x21_u8])
  GUID_ContainerFormatJpegXL = LibC::GUID.new(0xfec14e3f_u32, 0x427a_u16, 0x4736_u16, StaticArray[0xaa_u8, 0xe6_u8, 0x27_u8, 0xed_u8, 0x84_u8, 0xf6_u8, 0x93_u8, 0x22_u8])
  CLSID_WICImagingCategories = LibC::GUID.new(0xfae3d380_u32, 0xfea4_u16, 0x4623_u16, StaticArray[0x8c_u8, 0x75_u8, 0xc6_u8, 0xb6_u8, 0x11_u8, 0x10_u8, 0xb6_u8, 0x81_u8])
  CATID_WICBitmapDecoders = LibC::GUID.new(0x7ed96837_u32, 0x96f0_u16, 0x4812_u16, StaticArray[0xb2_u8, 0x11_u8, 0xf1_u8, 0x3c_u8, 0x24_u8, 0x11_u8, 0x7e_u8, 0xd3_u8])
  CATID_WICBitmapEncoders = LibC::GUID.new(0xac757296_u32, 0x3522_u16, 0x4e11_u16, StaticArray[0x98_u8, 0x62_u8, 0xc1_u8, 0x7b_u8, 0xe5_u8, 0xa1_u8, 0x76_u8, 0x7e_u8])
  CATID_WICPixelFormats = LibC::GUID.new(0x2b46e70f_u32, 0xcda7_u16, 0x473e_u16, StaticArray[0x89_u8, 0xf6_u8, 0xdc_u8, 0x96_u8, 0x30_u8, 0xa2_u8, 0x39_u8, 0xb_u8])
  CATID_WICFormatConverters = LibC::GUID.new(0x7835eae8_u32, 0xbf14_u16, 0x49d1_u16, StaticArray[0x93_u8, 0xce_u8, 0x53_u8, 0x3a_u8, 0x40_u8, 0x7b_u8, 0x22_u8, 0x48_u8])
  CATID_WICMetadataReader = LibC::GUID.new(0x5af94d8_u32, 0x7174_u16, 0x4cd2_u16, StaticArray[0xbe_u8, 0x4a_u8, 0x41_u8, 0x24_u8, 0xb8_u8, 0xe_u8, 0xe4_u8, 0xb8_u8])
  CATID_WICMetadataWriter = LibC::GUID.new(0xabe3b9a4_u32, 0x257d_u16, 0x4b97_u16, StaticArray[0xbd_u8, 0x1a_u8, 0x29_u8, 0x4a_u8, 0xf4_u8, 0x96_u8, 0x22_u8, 0x2e_u8])
  CLSID_WICDefaultFormatConverter = LibC::GUID.new(0x1a3f11dc_u32, 0xb514_u16, 0x4b17_u16, StaticArray[0x8c_u8, 0x5f_u8, 0x21_u8, 0x54_u8, 0x51_u8, 0x38_u8, 0x52_u8, 0xf1_u8])
  CLSID_WICFormatConverterHighColor = LibC::GUID.new(0xac75d454_u32, 0x9f37_u16, 0x48f8_u16, StaticArray[0xb9_u8, 0x72_u8, 0x4e_u8, 0x19_u8, 0xbc_u8, 0x85_u8, 0x60_u8, 0x11_u8])
  CLSID_WICFormatConverterNChannel = LibC::GUID.new(0xc17cabb2_u32, 0xd4a3_u16, 0x47d7_u16, StaticArray[0xa5_u8, 0x57_u8, 0x33_u8, 0x9b_u8, 0x2e_u8, 0xfb_u8, 0xd4_u8, 0xf1_u8])
  CLSID_WICFormatConverterWMPhoto = LibC::GUID.new(0x9cb5172b_u32, 0xd600_u16, 0x46ba_u16, StaticArray[0xab_u8, 0x77_u8, 0x77_u8, 0xbb_u8, 0x7e_u8, 0x3a_u8, 0x0_u8, 0xd9_u8])
  CLSID_WICPlanarFormatConverter = LibC::GUID.new(0x184132b8_u32, 0x32f8_u16, 0x4784_u16, StaticArray[0x91_u8, 0x31_u8, 0xdd_u8, 0x72_u8, 0x24_u8, 0xb2_u8, 0x34_u8, 0x38_u8])
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
  GUID_WICPixelFormatDontCare = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x0_u8])
  GUID_WICPixelFormat1bppIndexed = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x1_u8])
  GUID_WICPixelFormat2bppIndexed = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x2_u8])
  GUID_WICPixelFormat4bppIndexed = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x3_u8])
  GUID_WICPixelFormat8bppIndexed = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x4_u8])
  GUID_WICPixelFormatBlackWhite = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x5_u8])
  GUID_WICPixelFormat2bppGray = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x6_u8])
  GUID_WICPixelFormat4bppGray = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x7_u8])
  GUID_WICPixelFormat8bppGray = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x8_u8])
  GUID_WICPixelFormat8bppAlpha = LibC::GUID.new(0xe6cd0116_u32, 0xeeba_u16, 0x4161_u16, StaticArray[0xaa_u8, 0x85_u8, 0x27_u8, 0xdd_u8, 0x9f_u8, 0xb3_u8, 0xa8_u8, 0x95_u8])
  GUID_WICPixelFormat8bppDepth = LibC::GUID.new(0x4c9c9f45_u32, 0x1d89_u16, 0x4e31_u16, StaticArray[0x9b_u8, 0xc7_u8, 0x69_u8, 0x34_u8, 0x3a_u8, 0xd_u8, 0xca_u8, 0x69_u8])
  GUID_WICPixelFormat8bppGain = LibC::GUID.new(0xa884022a_u32, 0xaf13_u16, 0x4c16_u16, StaticArray[0xb7_u8, 0x46_u8, 0x61_u8, 0x9b_u8, 0xf6_u8, 0x18_u8, 0xb8_u8, 0x78_u8])
  GUID_WICPixelFormat24bppRGBGain = LibC::GUID.new(0xa5022b24_u32, 0x7109_u16, 0x443b_u16, StaticArray[0x99_u8, 0x48_u8, 0x25_u8, 0xb6_u8, 0xed_u8, 0x8f_u8, 0x39_u8, 0xfd_u8])
  GUID_WICPixelFormat32bppBGRGain = LibC::GUID.new(0x837d6738_u32, 0x208a_u16, 0x43e0_u16, StaticArray[0x89_u8, 0x95_u8, 0x79_u8, 0xab_u8, 0x74_u8, 0x40_u8, 0x74_u8, 0x2_u8])
  GUID_WICPixelFormat16bppBGR555 = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x9_u8])
  GUID_WICPixelFormat16bppBGR565 = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0xa_u8])
  GUID_WICPixelFormat16bppBGRA5551 = LibC::GUID.new(0x5ec7c2b_u32, 0xf1e6_u16, 0x4961_u16, StaticArray[0xad_u8, 0x46_u8, 0xe1_u8, 0xcc_u8, 0x81_u8, 0xa_u8, 0x87_u8, 0xd2_u8])
  GUID_WICPixelFormat16bppGray = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0xb_u8])
  GUID_WICPixelFormat24bppBGR = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0xc_u8])
  GUID_WICPixelFormat24bppRGB = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0xd_u8])
  GUID_WICPixelFormat32bppBGR = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0xe_u8])
  GUID_WICPixelFormat32bppBGRA = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0xf_u8])
  GUID_WICPixelFormat32bppPBGRA = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x10_u8])
  GUID_WICPixelFormat32bppGrayFloat = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x11_u8])
  GUID_WICPixelFormat32bppRGB = LibC::GUID.new(0xd98c6b95_u32, 0x3efe_u16, 0x47d6_u16, StaticArray[0xbb_u8, 0x25_u8, 0xeb_u8, 0x17_u8, 0x48_u8, 0xab_u8, 0xc_u8, 0xf1_u8])
  GUID_WICPixelFormat32bppRGBA = LibC::GUID.new(0xf5c7ad2d_u32, 0x6a8d_u16, 0x43dd_u16, StaticArray[0xa7_u8, 0xa8_u8, 0xa2_u8, 0x99_u8, 0x35_u8, 0x26_u8, 0x1a_u8, 0xe9_u8])
  GUID_WICPixelFormat32bppPRGBA = LibC::GUID.new(0x3cc4a650_u32, 0xa527_u16, 0x4d37_u16, StaticArray[0xa9_u8, 0x16_u8, 0x31_u8, 0x42_u8, 0xc7_u8, 0xeb_u8, 0xed_u8, 0xba_u8])
  GUID_WICPixelFormat48bppRGB = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x15_u8])
  GUID_WICPixelFormat48bppBGR = LibC::GUID.new(0xe605a384_u32, 0xb468_u16, 0x46ce_u16, StaticArray[0xbb_u8, 0x2e_u8, 0x36_u8, 0xf1_u8, 0x80_u8, 0xe6_u8, 0x43_u8, 0x13_u8])
  GUID_WICPixelFormat64bppRGB = LibC::GUID.new(0xa1182111_u32, 0x186d_u16, 0x4d42_u16, StaticArray[0xbc_u8, 0x6a_u8, 0x9c_u8, 0x83_u8, 0x3_u8, 0xa8_u8, 0xdf_u8, 0xf9_u8])
  GUID_WICPixelFormat64bppRGBA = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x16_u8])
  GUID_WICPixelFormat64bppBGRA = LibC::GUID.new(0x1562ff7c_u32, 0xd352_u16, 0x46f9_u16, StaticArray[0x97_u8, 0x9e_u8, 0x42_u8, 0x97_u8, 0x6b_u8, 0x79_u8, 0x22_u8, 0x46_u8])
  GUID_WICPixelFormat64bppPRGBA = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x17_u8])
  GUID_WICPixelFormat64bppPBGRA = LibC::GUID.new(0x8c518e8e_u32, 0xa4ec_u16, 0x468b_u16, StaticArray[0xae_u8, 0x70_u8, 0xc9_u8, 0xa3_u8, 0x5a_u8, 0x9c_u8, 0x55_u8, 0x30_u8])
  GUID_WICPixelFormat16bppGrayFixedPoint = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x13_u8])
  GUID_WICPixelFormat32bppBGR101010 = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x14_u8])
  GUID_WICPixelFormat48bppRGBFixedPoint = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x12_u8])
  GUID_WICPixelFormat48bppBGRFixedPoint = LibC::GUID.new(0x49ca140e_u32, 0xcab6_u16, 0x493b_u16, StaticArray[0x9d_u8, 0xdf_u8, 0x60_u8, 0x18_u8, 0x7c_u8, 0x37_u8, 0x53_u8, 0x2a_u8])
  GUID_WICPixelFormat96bppRGBFixedPoint = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x18_u8])
  GUID_WICPixelFormat96bppRGBFloat = LibC::GUID.new(0xe3fed78f_u32, 0xe8db_u16, 0x4acf_u16, StaticArray[0x84_u8, 0xc1_u8, 0xe9_u8, 0x7f_u8, 0x61_u8, 0x36_u8, 0xb3_u8, 0x27_u8])
  GUID_WICPixelFormat128bppRGBAFloat = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x19_u8])
  GUID_WICPixelFormat128bppPRGBAFloat = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x1a_u8])
  GUID_WICPixelFormat128bppRGBFloat = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x1b_u8])
  GUID_WICPixelFormat32bppCMYK = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x1c_u8])
  GUID_WICPixelFormat64bppRGBAFixedPoint = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x1d_u8])
  GUID_WICPixelFormat64bppBGRAFixedPoint = LibC::GUID.new(0x356de33c_u32, 0x54d2_u16, 0x4a23_u16, StaticArray[0xbb_u8, 0x4_u8, 0x9b_u8, 0x7b_u8, 0xf9_u8, 0xb1_u8, 0xd4_u8, 0x2d_u8])
  GUID_WICPixelFormat64bppRGBFixedPoint = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x40_u8])
  GUID_WICPixelFormat128bppRGBAFixedPoint = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x1e_u8])
  GUID_WICPixelFormat128bppRGBFixedPoint = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x41_u8])
  GUID_WICPixelFormat64bppRGBAHalf = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x3a_u8])
  GUID_WICPixelFormat64bppPRGBAHalf = LibC::GUID.new(0x58ad26c2_u32, 0xc623_u16, 0x4d9d_u16, StaticArray[0xb3_u8, 0x20_u8, 0x38_u8, 0x7e_u8, 0x49_u8, 0xf8_u8, 0xc4_u8, 0x42_u8])
  GUID_WICPixelFormat64bppRGBHalf = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x42_u8])
  GUID_WICPixelFormat48bppRGBHalf = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x3b_u8])
  GUID_WICPixelFormat32bppRGBE = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x3d_u8])
  GUID_WICPixelFormat16bppGrayHalf = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x3e_u8])
  GUID_WICPixelFormat32bppGrayFixedPoint = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x3f_u8])
  GUID_WICPixelFormat32bppRGBA1010102 = LibC::GUID.new(0x25238d72_u32, 0xfcf9_u16, 0x4522_u16, StaticArray[0xb5_u8, 0x14_u8, 0x55_u8, 0x78_u8, 0xe5_u8, 0xad_u8, 0x55_u8, 0xe0_u8])
  GUID_WICPixelFormat32bppRGBA1010102XR = LibC::GUID.new(0xde6b9a_u32, 0xc101_u16, 0x434b_u16, StaticArray[0xb5_u8, 0x2_u8, 0xd0_u8, 0x16_u8, 0x5e_u8, 0xe1_u8, 0x12_u8, 0x2c_u8])
  GUID_WICPixelFormat32bppR10G10B10A2 = LibC::GUID.new(0x604e1bb5_u32, 0x8a3c_u16, 0x4b65_u16, StaticArray[0xb1_u8, 0x1c_u8, 0xbc_u8, 0xb_u8, 0x8d_u8, 0xd7_u8, 0x5b_u8, 0x7f_u8])
  GUID_WICPixelFormat32bppR10G10B10A2HDR10 = LibC::GUID.new(0x9c215c5d_u32, 0x1acc_u16, 0x4f0e_u16, StaticArray[0xa4_u8, 0xbc_u8, 0x70_u8, 0xfb_u8, 0x3a_u8, 0xe8_u8, 0xfd_u8, 0x28_u8])
  GUID_WICPixelFormat64bppCMYK = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x1f_u8])
  GUID_WICPixelFormat24bpp3Channels = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x20_u8])
  GUID_WICPixelFormat32bpp4Channels = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x21_u8])
  GUID_WICPixelFormat40bpp5Channels = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x22_u8])
  GUID_WICPixelFormat48bpp6Channels = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x23_u8])
  GUID_WICPixelFormat56bpp7Channels = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x24_u8])
  GUID_WICPixelFormat64bpp8Channels = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x25_u8])
  GUID_WICPixelFormat48bpp3Channels = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x26_u8])
  GUID_WICPixelFormat64bpp4Channels = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x27_u8])
  GUID_WICPixelFormat80bpp5Channels = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x28_u8])
  GUID_WICPixelFormat96bpp6Channels = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x29_u8])
  GUID_WICPixelFormat112bpp7Channels = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x2a_u8])
  GUID_WICPixelFormat128bpp8Channels = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x2b_u8])
  GUID_WICPixelFormat40bppCMYKAlpha = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x2c_u8])
  GUID_WICPixelFormat80bppCMYKAlpha = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x2d_u8])
  GUID_WICPixelFormat32bpp3ChannelsAlpha = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x2e_u8])
  GUID_WICPixelFormat40bpp4ChannelsAlpha = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x2f_u8])
  GUID_WICPixelFormat48bpp5ChannelsAlpha = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x30_u8])
  GUID_WICPixelFormat56bpp6ChannelsAlpha = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x31_u8])
  GUID_WICPixelFormat64bpp7ChannelsAlpha = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x32_u8])
  GUID_WICPixelFormat72bpp8ChannelsAlpha = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x33_u8])
  GUID_WICPixelFormat64bpp3ChannelsAlpha = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x34_u8])
  GUID_WICPixelFormat80bpp4ChannelsAlpha = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x35_u8])
  GUID_WICPixelFormat96bpp5ChannelsAlpha = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x36_u8])
  GUID_WICPixelFormat112bpp6ChannelsAlpha = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x37_u8])
  GUID_WICPixelFormat128bpp7ChannelsAlpha = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x38_u8])
  GUID_WICPixelFormat144bpp8ChannelsAlpha = LibC::GUID.new(0x6fddc324_u32, 0x4e03_u16, 0x4bfe_u16, StaticArray[0xb1_u8, 0x85_u8, 0x3d_u8, 0x77_u8, 0x76_u8, 0x8d_u8, 0xc9_u8, 0x39_u8])
  GUID_WICPixelFormat8bppY = LibC::GUID.new(0x91b4db54_u32, 0x2df9_u16, 0x42f0_u16, StaticArray[0xb4_u8, 0x49_u8, 0x29_u8, 0x9_u8, 0xbb_u8, 0x3d_u8, 0xf8_u8, 0x8e_u8])
  GUID_WICPixelFormat8bppCb = LibC::GUID.new(0x1339f224_u32, 0x6bfe_u16, 0x4c3e_u16, StaticArray[0x93_u8, 0x2_u8, 0xe4_u8, 0xf3_u8, 0xa6_u8, 0xd0_u8, 0xca_u8, 0x2a_u8])
  GUID_WICPixelFormat8bppCr = LibC::GUID.new(0xb8145053_u32, 0x2116_u16, 0x49f0_u16, StaticArray[0x88_u8, 0x35_u8, 0xed_u8, 0x84_u8, 0x4b_u8, 0x20_u8, 0x5c_u8, 0x51_u8])
  GUID_WICPixelFormat16bppCbCr = LibC::GUID.new(0xff95ba6e_u32, 0x11e0_u16, 0x4263_u16, StaticArray[0xbb_u8, 0x45_u8, 0x1_u8, 0x72_u8, 0x1f_u8, 0x34_u8, 0x60_u8, 0xa4_u8])
  GUID_WICPixelFormat16bppYQuantizedDctCoefficients = LibC::GUID.new(0xa355f433_u32, 0x48e8_u16, 0x4a42_u16, StaticArray[0x84_u8, 0xd8_u8, 0xe2_u8, 0xaa_u8, 0x26_u8, 0xca_u8, 0x80_u8, 0xa4_u8])
  GUID_WICPixelFormat16bppCbQuantizedDctCoefficients = LibC::GUID.new(0xd2c4ff61_u32, 0x56a5_u16, 0x49c2_u16, StaticArray[0x8b_u8, 0x5c_u8, 0x4c_u8, 0x19_u8, 0x25_u8, 0x96_u8, 0x48_u8, 0x37_u8])
  GUID_WICPixelFormat16bppCrQuantizedDctCoefficients = LibC::GUID.new(0x2fe354f0_u32, 0x1680_u16, 0x42d8_u16, StaticArray[0x92_u8, 0x31_u8, 0xe7_u8, 0x3c_u8, 0x5_u8, 0x65_u8, 0xbf_u8, 0xc1_u8])
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
  GUID_MetadataFormatUnknown = LibC::GUID.new(0xa45e592f_u32, 0x9078_u16, 0x4a7c_u16, StaticArray[0xad_u8, 0xb5_u8, 0x4e_u8, 0xdc_u8, 0x4f_u8, 0xd6_u8, 0x1b_u8, 0x1f_u8])
  GUID_MetadataFormatIfd = LibC::GUID.new(0x537396c6_u32, 0x2d8a_u16, 0x4bb6_u16, StaticArray[0x9b_u8, 0xf8_u8, 0x2f_u8, 0xa_u8, 0x8e_u8, 0x2a_u8, 0x3a_u8, 0xdf_u8])
  GUID_MetadataFormatSubIfd = LibC::GUID.new(0x58a2e128_u32, 0x2db9_u16, 0x4e57_u16, StaticArray[0xbb_u8, 0x14_u8, 0x51_u8, 0x77_u8, 0x89_u8, 0x1e_u8, 0xd3_u8, 0x31_u8])
  GUID_MetadataFormatExif = LibC::GUID.new(0x1c3c4f9d_u32, 0xb84a_u16, 0x467d_u16, StaticArray[0x94_u8, 0x93_u8, 0x36_u8, 0xcf_u8, 0xbd_u8, 0x59_u8, 0xea_u8, 0x57_u8])
  GUID_MetadataFormatGps = LibC::GUID.new(0x7134ab8a_u32, 0x9351_u16, 0x44ad_u16, StaticArray[0xaf_u8, 0x62_u8, 0x44_u8, 0x8d_u8, 0xb6_u8, 0xb5_u8, 0x2_u8, 0xec_u8])
  GUID_MetadataFormatInterop = LibC::GUID.new(0xed686f8e_u32, 0x681f_u16, 0x4c8b_u16, StaticArray[0xbd_u8, 0x41_u8, 0xa8_u8, 0xad_u8, 0xdb_u8, 0xf6_u8, 0xb3_u8, 0xfc_u8])
  GUID_MetadataFormatApp0 = LibC::GUID.new(0x79007028_u32, 0x268d_u16, 0x45d6_u16, StaticArray[0xa3_u8, 0xc2_u8, 0x35_u8, 0x4e_u8, 0x6a_u8, 0x50_u8, 0x4b_u8, 0xc9_u8])
  GUID_MetadataFormatApp1 = LibC::GUID.new(0x8fd3dfc3_u32, 0xf951_u16, 0x492b_u16, StaticArray[0x81_u8, 0x7f_u8, 0x69_u8, 0xc2_u8, 0xe6_u8, 0xd9_u8, 0xa5_u8, 0xb0_u8])
  GUID_MetadataFormatApp13 = LibC::GUID.new(0x326556a2_u32, 0xf502_u16, 0x4354_u16, StaticArray[0x9c_u8, 0xc0_u8, 0x8e_u8, 0x3f_u8, 0x48_u8, 0xea_u8, 0xf6_u8, 0xb5_u8])
  GUID_MetadataFormatIPTC = LibC::GUID.new(0x4fab0914_u32, 0xe129_u16, 0x4087_u16, StaticArray[0xa1_u8, 0xd1_u8, 0xbc_u8, 0x81_u8, 0x2d_u8, 0x45_u8, 0xa7_u8, 0xb5_u8])
  GUID_MetadataFormatIRB = LibC::GUID.new(0x16100d66_u32, 0x8570_u16, 0x4bb9_u16, StaticArray[0xb9_u8, 0x2d_u8, 0xfd_u8, 0xa4_u8, 0xb2_u8, 0x3e_u8, 0xce_u8, 0x67_u8])
  GUID_MetadataFormat8BIMIPTC = LibC::GUID.new(0x10568c_u32, 0x852_u16, 0x4e6a_u16, StaticArray[0xb1_u8, 0x91_u8, 0x5c_u8, 0x33_u8, 0xac_u8, 0x5b_u8, 0x4_u8, 0x30_u8])
  GUID_MetadataFormat8BIMResolutionInfo = LibC::GUID.new(0x739f305d_u32, 0x81db_u16, 0x43cb_u16, StaticArray[0xac_u8, 0x5e_u8, 0x55_u8, 0x1_u8, 0x3e_u8, 0xf9_u8, 0xf0_u8, 0x3_u8])
  GUID_MetadataFormat8BIMIPTCDigest = LibC::GUID.new(0x1ca32285_u32, 0x9ccd_u16, 0x4786_u16, StaticArray[0x8b_u8, 0xd8_u8, 0x79_u8, 0x53_u8, 0x9d_u8, 0xb6_u8, 0xa0_u8, 0x6_u8])
  GUID_MetadataFormatXMP = LibC::GUID.new(0xbb5acc38_u32, 0xf216_u16, 0x4cec_u16, StaticArray[0xa6_u8, 0xc5_u8, 0x5f_u8, 0x6e_u8, 0x73_u8, 0x97_u8, 0x63_u8, 0xa9_u8])
  GUID_MetadataFormatThumbnail = LibC::GUID.new(0x243dcee9_u32, 0x8703_u16, 0x40ee_u16, StaticArray[0x8e_u8, 0xf0_u8, 0x22_u8, 0xa6_u8, 0x0_u8, 0xb8_u8, 0x5_u8, 0x8c_u8])
  GUID_MetadataFormatChunktEXt = LibC::GUID.new(0x568d8936_u32, 0xc0a9_u16, 0x4923_u16, StaticArray[0x90_u8, 0x5d_u8, 0xdf_u8, 0x2b_u8, 0x38_u8, 0x23_u8, 0x8f_u8, 0xbc_u8])
  GUID_MetadataFormatXMPStruct = LibC::GUID.new(0x22383cf1_u32, 0xed17_u16, 0x4e2e_u16, StaticArray[0xaf_u8, 0x17_u8, 0xd8_u8, 0x5b_u8, 0x8f_u8, 0x6b_u8, 0x30_u8, 0xd0_u8])
  GUID_MetadataFormatXMPBag = LibC::GUID.new(0x833cca5f_u32, 0xdcb7_u16, 0x4516_u16, StaticArray[0x80_u8, 0x6f_u8, 0x65_u8, 0x96_u8, 0xab_u8, 0x26_u8, 0xdc_u8, 0xe4_u8])
  GUID_MetadataFormatXMPSeq = LibC::GUID.new(0x63e8df02_u32, 0xeb6c_u16, 0x456c_u16, StaticArray[0xa2_u8, 0x24_u8, 0xb2_u8, 0x5e_u8, 0x79_u8, 0x4f_u8, 0xd6_u8, 0x48_u8])
  GUID_MetadataFormatXMPAlt = LibC::GUID.new(0x7b08a675_u32, 0x91aa_u16, 0x481b_u16, StaticArray[0xa7_u8, 0x98_u8, 0x4d_u8, 0xa9_u8, 0x49_u8, 0x8_u8, 0x61_u8, 0x3b_u8])
  GUID_MetadataFormatLSD = LibC::GUID.new(0xe256031e_u32, 0x6299_u16, 0x4929_u16, StaticArray[0xb9_u8, 0x8d_u8, 0x5a_u8, 0xc8_u8, 0x84_u8, 0xaf_u8, 0xba_u8, 0x92_u8])
  GUID_MetadataFormatIMD = LibC::GUID.new(0xbd2bb086_u32, 0x4d52_u16, 0x48dd_u16, StaticArray[0x96_u8, 0x77_u8, 0xdb_u8, 0x48_u8, 0x3e_u8, 0x85_u8, 0xae_u8, 0x8f_u8])
  GUID_MetadataFormatGCE = LibC::GUID.new(0x2a25cad8_u32, 0xdeeb_u16, 0x4c69_u16, StaticArray[0xa7_u8, 0x88_u8, 0xe_u8, 0xc2_u8, 0x26_u8, 0x6d_u8, 0xca_u8, 0xfd_u8])
  GUID_MetadataFormatAPE = LibC::GUID.new(0x2e043dc2_u32, 0xc967_u16, 0x4e05_u16, StaticArray[0x87_u8, 0x5e_u8, 0x61_u8, 0x8b_u8, 0xf6_u8, 0x7e_u8, 0x85_u8, 0xc3_u8])
  GUID_MetadataFormatJpegChrominance = LibC::GUID.new(0xf73d0dcf_u32, 0xcec6_u16, 0x4f85_u16, StaticArray[0x9b_u8, 0xe_u8, 0x1c_u8, 0x39_u8, 0x56_u8, 0xb1_u8, 0xbe_u8, 0xf7_u8])
  GUID_MetadataFormatJpegLuminance = LibC::GUID.new(0x86908007_u32, 0xedfc_u16, 0x4860_u16, StaticArray[0x8d_u8, 0x4b_u8, 0x4e_u8, 0xe6_u8, 0xe8_u8, 0x3e_u8, 0x60_u8, 0x58_u8])
  GUID_MetadataFormatJpegComment = LibC::GUID.new(0x220e5f33_u32, 0xafd3_u16, 0x474e_u16, StaticArray[0x9d_u8, 0x31_u8, 0x7d_u8, 0x4f_u8, 0xe7_u8, 0x30_u8, 0xf5_u8, 0x57_u8])
  GUID_MetadataFormatGifComment = LibC::GUID.new(0xc4b6e0e0_u32, 0xcfb4_u16, 0x4ad3_u16, StaticArray[0xab_u8, 0x33_u8, 0x9a_u8, 0xad_u8, 0x23_u8, 0x55_u8, 0xa3_u8, 0x4a_u8])
  GUID_MetadataFormatChunkgAMA = LibC::GUID.new(0xf00935a5_u32, 0x1d5d_u16, 0x4cd1_u16, StaticArray[0x81_u8, 0xb2_u8, 0x93_u8, 0x24_u8, 0xd7_u8, 0xec_u8, 0xa7_u8, 0x81_u8])
  GUID_MetadataFormatChunkbKGD = LibC::GUID.new(0xe14d3571_u32, 0x6b47_u16, 0x4dea_u16, StaticArray[0xb6_u8, 0xa_u8, 0x87_u8, 0xce_u8, 0xa_u8, 0x78_u8, 0xdf_u8, 0xb7_u8])
  GUID_MetadataFormatChunkiTXt = LibC::GUID.new(0xc2bec729_u32, 0xb68_u16, 0x4b77_u16, StaticArray[0xaa_u8, 0xe_u8, 0x62_u8, 0x95_u8, 0xa6_u8, 0xac_u8, 0x18_u8, 0x14_u8])
  GUID_MetadataFormatChunkcHRM = LibC::GUID.new(0x9db3655b_u32, 0x2842_u16, 0x44b3_u16, StaticArray[0x80_u8, 0x67_u8, 0x12_u8, 0xe9_u8, 0xb3_u8, 0x75_u8, 0x55_u8, 0x6a_u8])
  GUID_MetadataFormatChunkhIST = LibC::GUID.new(0xc59a82da_u32, 0xdb74_u16, 0x48a4_u16, StaticArray[0xbd_u8, 0x6a_u8, 0xb6_u8, 0x9c_u8, 0x49_u8, 0x31_u8, 0xef_u8, 0x95_u8])
  GUID_MetadataFormatChunkiCCP = LibC::GUID.new(0xeb4349ab_u32, 0xb685_u16, 0x450f_u16, StaticArray[0x91_u8, 0xb5_u8, 0xe8_u8, 0x2_u8, 0xe8_u8, 0x92_u8, 0x53_u8, 0x6c_u8])
  GUID_MetadataFormatChunksRGB = LibC::GUID.new(0xc115fd36_u32, 0xcc6f_u16, 0x4e3f_u16, StaticArray[0x83_u8, 0x63_u8, 0x52_u8, 0x4b_u8, 0x87_u8, 0xc6_u8, 0xb0_u8, 0xd9_u8])
  GUID_MetadataFormatChunktIME = LibC::GUID.new(0x6b00ae2d_u32, 0xe24b_u16, 0x460a_u16, StaticArray[0x98_u8, 0xb6_u8, 0x87_u8, 0x8b_u8, 0xd0_u8, 0x30_u8, 0x72_u8, 0xfd_u8])
  GUID_MetadataFormatDds = LibC::GUID.new(0x4a064603_u32, 0x8c33_u16, 0x4e60_u16, StaticArray[0x9c_u8, 0x29_u8, 0x13_u8, 0x62_u8, 0x31_u8, 0x70_u8, 0x2d_u8, 0x8_u8])
  GUID_MetadataFormatHeif = LibC::GUID.new(0x817ef3e1_u32, 0x1288_u16, 0x45f4_u16, StaticArray[0xa8_u8, 0x52_u8, 0x26_u8, 0xd_u8, 0x9e_u8, 0x7c_u8, 0xce_u8, 0x83_u8])
  GUID_MetadataFormatHeifHDR = LibC::GUID.new(0x568b8d8a_u32, 0x1e65_u16, 0x438c_u16, StaticArray[0x89_u8, 0x68_u8, 0xd6_u8, 0xe_u8, 0x10_u8, 0x12_u8, 0xbe_u8, 0xb9_u8])
  GUID_MetadataFormatWebpANIM = LibC::GUID.new(0x6dc4fda6_u32, 0x78e6_u16, 0x4102_u16, StaticArray[0xae_u8, 0x35_u8, 0xbc_u8, 0xfa_u8, 0x1e_u8, 0xdc_u8, 0xc7_u8, 0x8b_u8])
  GUID_MetadataFormatWebpANMF = LibC::GUID.new(0x43c105ee_u32, 0xb93b_u16, 0x4abb_u16, StaticArray[0xb0_u8, 0x3_u8, 0xa0_u8, 0x8c_u8, 0xd_u8, 0x87_u8, 0x4_u8, 0x71_u8])
  GUID_MetadataFormatJpegXLAnim = LibC::GUID.new(0x501c2e24_u32, 0x7a7d_u16, 0x42b2_u16, StaticArray[0x93_u8, 0xc7_u8, 0xb4_u8, 0xf4_u8, 0x5b_u8, 0xcc_u8, 0x92_u8, 0xf7_u8])
  GUID_MetadataFormatJpegXLAnimFrame = LibC::GUID.new(0x958ecc2c_u32, 0x36cb_u16, 0x4af9_u16, StaticArray[0x9e_u8, 0xa8_u8, 0xb_u8, 0x74_u8, 0xba_u8, 0xcc_u8, 0xfd_u8, 0x3e_u8])
  GUID_MetadataFormatGainMap = LibC::GUID.new(0x568d3138_u32, 0xc446_u16, 0x4ec2_u16, StaticArray[0xa7_u8, 0xa8_u8, 0x59_u8, 0xab_u8, 0xb1_u8, 0x6d_u8, 0x21_u8, 0xe3_u8])
  CLSID_WICUnknownMetadataReader = LibC::GUID.new(0x699745c2_u32, 0x5066_u16, 0x4b82_u16, StaticArray[0xa8_u8, 0xe3_u8, 0xd4_u8, 0x4_u8, 0x78_u8, 0xdb_u8, 0xec_u8, 0x8c_u8])
  CLSID_WICUnknownMetadataWriter = LibC::GUID.new(0xa09cca86_u32, 0x27ba_u16, 0x4f39_u16, StaticArray[0x90_u8, 0x53_u8, 0x12_u8, 0x1f_u8, 0xa4_u8, 0xdc_u8, 0x8_u8, 0xfc_u8])
  CLSID_WICApp0MetadataWriter = LibC::GUID.new(0xf3c633a2_u32, 0x46c8_u16, 0x498e_u16, StaticArray[0x8f_u8, 0xbb_u8, 0xcc_u8, 0x6f_u8, 0x72_u8, 0x1b_u8, 0xbc_u8, 0xde_u8])
  CLSID_WICApp0MetadataReader = LibC::GUID.new(0x43324b33_u32, 0xa78f_u16, 0x480f_u16, StaticArray[0x91_u8, 0x11_u8, 0x96_u8, 0x38_u8, 0xaa_u8, 0xcc_u8, 0xc8_u8, 0x32_u8])
  CLSID_WICApp1MetadataWriter = LibC::GUID.new(0xee366069_u32, 0x1832_u16, 0x420f_u16, StaticArray[0xb3_u8, 0x81_u8, 0x4_u8, 0x79_u8, 0xad_u8, 0x6_u8, 0x6f_u8, 0x19_u8])
  CLSID_WICApp1MetadataReader = LibC::GUID.new(0xdde33513_u32, 0x774e_u16, 0x4bcd_u16, StaticArray[0xae_u8, 0x79_u8, 0x2_u8, 0xf4_u8, 0xad_u8, 0xfe_u8, 0x62_u8, 0xfc_u8])
  CLSID_WICApp13MetadataWriter = LibC::GUID.new(0x7b19a919_u32, 0xa9d6_u16, 0x49e5_u16, StaticArray[0xbd_u8, 0x45_u8, 0x2_u8, 0xc3_u8, 0x4e_u8, 0x4e_u8, 0x4c_u8, 0xd5_u8])
  CLSID_WICApp13MetadataReader = LibC::GUID.new(0xaa7e3c50_u32, 0x864c_u16, 0x4604_u16, StaticArray[0xbc_u8, 0x4_u8, 0x8b_u8, 0xb_u8, 0x76_u8, 0xe6_u8, 0x37_u8, 0xf6_u8])
  CLSID_WICIfdMetadataReader = LibC::GUID.new(0x8f914656_u32, 0x9d0a_u16, 0x4eb2_u16, StaticArray[0x90_u8, 0x19_u8, 0xb_u8, 0xf9_u8, 0x6d_u8, 0x8a_u8, 0x9e_u8, 0xe6_u8])
  CLSID_WICIfdMetadataWriter = LibC::GUID.new(0xb1ebfc28_u32, 0xc9bd_u16, 0x47a2_u16, StaticArray[0x8d_u8, 0x33_u8, 0xb9_u8, 0x48_u8, 0x76_u8, 0x97_u8, 0x77_u8, 0xa7_u8])
  CLSID_WICSubIfdMetadataReader = LibC::GUID.new(0x50d42f09_u32, 0xecd1_u16, 0x4b41_u16, StaticArray[0xb6_u8, 0x5d_u8, 0xda_u8, 0x1f_u8, 0xda_u8, 0xa7_u8, 0x56_u8, 0x63_u8])
  CLSID_WICSubIfdMetadataWriter = LibC::GUID.new(0x8ade5386_u32, 0x8e9b_u16, 0x4f4c_u16, StaticArray[0xac_u8, 0xf2_u8, 0xf0_u8, 0x0_u8, 0x87_u8, 0x6_u8, 0xb2_u8, 0x38_u8])
  CLSID_WICExifMetadataReader = LibC::GUID.new(0xd9403860_u32, 0x297f_u16, 0x4a49_u16, StaticArray[0xbf_u8, 0x9b_u8, 0x77_u8, 0x89_u8, 0x81_u8, 0x50_u8, 0xa4_u8, 0x42_u8])
  CLSID_WICExifMetadataWriter = LibC::GUID.new(0xc9a14cda_u32, 0xc339_u16, 0x460b_u16, StaticArray[0x90_u8, 0x78_u8, 0xd4_u8, 0xde_u8, 0xbc_u8, 0xfa_u8, 0xbe_u8, 0x91_u8])
  CLSID_WICGpsMetadataReader = LibC::GUID.new(0x3697790b_u32, 0x223b_u16, 0x484e_u16, StaticArray[0x99_u8, 0x25_u8, 0xc4_u8, 0x86_u8, 0x92_u8, 0x18_u8, 0xf1_u8, 0x7a_u8])
  CLSID_WICGpsMetadataWriter = LibC::GUID.new(0xcb8c13e4_u32, 0x62b5_u16, 0x4c96_u16, StaticArray[0xa4_u8, 0x8b_u8, 0x6b_u8, 0xa6_u8, 0xac_u8, 0xe3_u8, 0x9c_u8, 0x76_u8])
  CLSID_WICInteropMetadataReader = LibC::GUID.new(0xb5c8b898_u32, 0x74_u16, 0x459f_u16, StaticArray[0xb7_u8, 0x0_u8, 0x86_u8, 0xd_u8, 0x46_u8, 0x51_u8, 0xea_u8, 0x14_u8])
  CLSID_WICInteropMetadataWriter = LibC::GUID.new(0x122ec645_u32, 0xcd7e_u16, 0x44d8_u16, StaticArray[0xb1_u8, 0x86_u8, 0x2c_u8, 0x8c_u8, 0x20_u8, 0xc3_u8, 0xb5_u8, 0xf_u8])
  CLSID_WICThumbnailMetadataReader = LibC::GUID.new(0xfb012959_u32, 0xf4f6_u16, 0x44d7_u16, StaticArray[0x9d_u8, 0x9_u8, 0xda_u8, 0xa0_u8, 0x87_u8, 0xa9_u8, 0xdb_u8, 0x57_u8])
  CLSID_WICThumbnailMetadataWriter = LibC::GUID.new(0xd049b20c_u32, 0x5dd0_u16, 0x44fe_u16, StaticArray[0xb0_u8, 0xb3_u8, 0x8f_u8, 0x92_u8, 0xc8_u8, 0xe6_u8, 0xd0_u8, 0x80_u8])
  CLSID_WICIPTCMetadataReader = LibC::GUID.new(0x3012959_u32, 0xf4f6_u16, 0x44d7_u16, StaticArray[0x9d_u8, 0x9_u8, 0xda_u8, 0xa0_u8, 0x87_u8, 0xa9_u8, 0xdb_u8, 0x57_u8])
  CLSID_WICIPTCMetadataWriter = LibC::GUID.new(0x1249b20c_u32, 0x5dd0_u16, 0x44fe_u16, StaticArray[0xb0_u8, 0xb3_u8, 0x8f_u8, 0x92_u8, 0xc8_u8, 0xe6_u8, 0xd0_u8, 0x80_u8])
  CLSID_WICIRBMetadataReader = LibC::GUID.new(0xd4dcd3d7_u32, 0xb4c2_u16, 0x47d9_u16, StaticArray[0xa6_u8, 0xbf_u8, 0xb8_u8, 0x9b_u8, 0xa3_u8, 0x96_u8, 0xa4_u8, 0xa3_u8])
  CLSID_WICIRBMetadataWriter = LibC::GUID.new(0x5c5c1935_u32, 0x235_u16, 0x4434_u16, StaticArray[0x80_u8, 0xbc_u8, 0x25_u8, 0x1b_u8, 0xc1_u8, 0xec_u8, 0x39_u8, 0xc6_u8])
  CLSID_WIC8BIMIPTCMetadataReader = LibC::GUID.new(0x10668c_u32, 0x801_u16, 0x4da6_u16, StaticArray[0xa4_u8, 0xa4_u8, 0x82_u8, 0x65_u8, 0x22_u8, 0xb6_u8, 0xd2_u8, 0x8f_u8])
  CLSID_WIC8BIMIPTCMetadataWriter = LibC::GUID.new(0x108226_u32, 0xee41_u16, 0x44a2_u16, StaticArray[0x9e_u8, 0x9c_u8, 0x4b_u8, 0xe4_u8, 0xd5_u8, 0xb1_u8, 0xd2_u8, 0xcd_u8])
  CLSID_WIC8BIMResolutionInfoMetadataReader = LibC::GUID.new(0x5805137a_u32, 0xe348_u16, 0x4f7c_u16, StaticArray[0xb3_u8, 0xcc_u8, 0x6d_u8, 0xb9_u8, 0x96_u8, 0x5a_u8, 0x5_u8, 0x99_u8])
  CLSID_WIC8BIMResolutionInfoMetadataWriter = LibC::GUID.new(0x4ff2fe0e_u32, 0xe74a_u16, 0x4b71_u16, StaticArray[0x98_u8, 0xc4_u8, 0xab_u8, 0x7d_u8, 0xc1_u8, 0x67_u8, 0x7_u8, 0xba_u8])
  CLSID_WIC8BIMIPTCDigestMetadataReader = LibC::GUID.new(0x2805f1e_u32, 0xd5aa_u16, 0x415b_u16, StaticArray[0x82_u8, 0xc5_u8, 0x61_u8, 0xc0_u8, 0x33_u8, 0xa9_u8, 0x88_u8, 0xa6_u8])
  CLSID_WIC8BIMIPTCDigestMetadataWriter = LibC::GUID.new(0x2db5e62b_u32, 0xd67_u16, 0x495f_u16, StaticArray[0x8f_u8, 0x9d_u8, 0xc2_u8, 0xf0_u8, 0x18_u8, 0x86_u8, 0x47_u8, 0xac_u8])
  CLSID_WICPngTextMetadataReader = LibC::GUID.new(0x4b59afcc_u32, 0xb8c3_u16, 0x408a_u16, StaticArray[0xb6_u8, 0x70_u8, 0x89_u8, 0xe5_u8, 0xfa_u8, 0xb6_u8, 0xfd_u8, 0xa7_u8])
  CLSID_WICPngTextMetadataWriter = LibC::GUID.new(0xb5ebafb9_u32, 0x253e_u16, 0x4a72_u16, StaticArray[0xa7_u8, 0x44_u8, 0x7_u8, 0x62_u8, 0xd2_u8, 0x68_u8, 0x56_u8, 0x83_u8])
  CLSID_WICXMPMetadataReader = LibC::GUID.new(0x72b624df_u32, 0xae11_u16, 0x4948_u16, StaticArray[0xa6_u8, 0x5c_u8, 0x35_u8, 0x1e_u8, 0xb0_u8, 0x82_u8, 0x94_u8, 0x19_u8])
  CLSID_WICXMPMetadataWriter = LibC::GUID.new(0x1765e14e_u32, 0x1bd4_u16, 0x462e_u16, StaticArray[0xb6_u8, 0xb1_u8, 0x59_u8, 0xb_u8, 0xf1_u8, 0x26_u8, 0x2a_u8, 0xc6_u8])
  CLSID_WICXMPStructMetadataReader = LibC::GUID.new(0x1b90d9a_u32, 0x8209_u16, 0x47f7_u16, StaticArray[0x9c_u8, 0x52_u8, 0xe1_u8, 0x24_u8, 0x4b_u8, 0xf5_u8, 0xc_u8, 0xed_u8])
  CLSID_WICXMPStructMetadataWriter = LibC::GUID.new(0x22c21f93_u32, 0x7ddb_u16, 0x411c_u16, StaticArray[0x9b_u8, 0x17_u8, 0xc5_u8, 0xb7_u8, 0xbd_u8, 0x6_u8, 0x4a_u8, 0xbc_u8])
  CLSID_WICXMPBagMetadataReader = LibC::GUID.new(0xe7e79a30_u32, 0x4f2c_u16, 0x4fab_u16, StaticArray[0x8d_u8, 0x0_u8, 0x39_u8, 0x4f_u8, 0x2d_u8, 0x6b_u8, 0xbe_u8, 0xbe_u8])
  CLSID_WICXMPBagMetadataWriter = LibC::GUID.new(0xed822c8c_u32, 0xd6be_u16, 0x4301_u16, StaticArray[0xa6_u8, 0x31_u8, 0xe_u8, 0x14_u8, 0x16_u8, 0xba_u8, 0xd2_u8, 0x8f_u8])
  CLSID_WICXMPSeqMetadataReader = LibC::GUID.new(0x7f12e753_u32, 0xfc71_u16, 0x43d7_u16, StaticArray[0xa5_u8, 0x1d_u8, 0x92_u8, 0xf3_u8, 0x59_u8, 0x77_u8, 0xab_u8, 0xb5_u8])
  CLSID_WICXMPSeqMetadataWriter = LibC::GUID.new(0x6d68d1de_u32, 0xd432_u16, 0x4b0f_u16, StaticArray[0x92_u8, 0x3a_u8, 0x9_u8, 0x11_u8, 0x83_u8, 0xa9_u8, 0xbd_u8, 0xa7_u8])
  CLSID_WICXMPAltMetadataReader = LibC::GUID.new(0xaa94dcc2_u32, 0xb8b0_u16, 0x4898_u16, StaticArray[0xb8_u8, 0x35_u8, 0x0_u8, 0xa_u8, 0xab_u8, 0xd7_u8, 0x43_u8, 0x93_u8])
  CLSID_WICXMPAltMetadataWriter = LibC::GUID.new(0x76c2a6c_u32, 0xf78f_u16, 0x4c46_u16, StaticArray[0xa7_u8, 0x23_u8, 0x35_u8, 0x83_u8, 0xe7_u8, 0x8_u8, 0x76_u8, 0xea_u8])
  CLSID_WICLSDMetadataReader = LibC::GUID.new(0x41070793_u32, 0x59e4_u16, 0x479a_u16, StaticArray[0xa1_u8, 0xf7_u8, 0x95_u8, 0x4a_u8, 0xdc_u8, 0x2e_u8, 0xf5_u8, 0xfc_u8])
  CLSID_WICLSDMetadataWriter = LibC::GUID.new(0x73c037e7_u32, 0xe5d9_u16, 0x4954_u16, StaticArray[0x87_u8, 0x6a_u8, 0x6d_u8, 0xa8_u8, 0x1d_u8, 0x6e_u8, 0x57_u8, 0x68_u8])
  CLSID_WICGCEMetadataReader = LibC::GUID.new(0xb92e345d_u32, 0xf52d_u16, 0x41f3_u16, StaticArray[0xb5_u8, 0x62_u8, 0x8_u8, 0x1b_u8, 0xc7_u8, 0x72_u8, 0xe3_u8, 0xb9_u8])
  CLSID_WICGCEMetadataWriter = LibC::GUID.new(0xaf95dc76_u32, 0x16b2_u16, 0x47f4_u16, StaticArray[0xb3_u8, 0xea_u8, 0x3c_u8, 0x31_u8, 0x79_u8, 0x66_u8, 0x93_u8, 0xe7_u8])
  CLSID_WICIMDMetadataReader = LibC::GUID.new(0x7447a267_u32, 0x15_u16, 0x42c8_u16, StaticArray[0xa8_u8, 0xf1_u8, 0xfb_u8, 0x3b_u8, 0x94_u8, 0xc6_u8, 0x83_u8, 0x61_u8])
  CLSID_WICIMDMetadataWriter = LibC::GUID.new(0x8c89071f_u32, 0x452e_u16, 0x4e95_u16, StaticArray[0x96_u8, 0x82_u8, 0x9d_u8, 0x10_u8, 0x24_u8, 0x62_u8, 0x71_u8, 0x72_u8])
  CLSID_WICAPEMetadataReader = LibC::GUID.new(0x1767b93a_u32, 0xb021_u16, 0x44ea_u16, StaticArray[0x92_u8, 0xf_u8, 0x86_u8, 0x3c_u8, 0x11_u8, 0xf4_u8, 0xf7_u8, 0x68_u8])
  CLSID_WICAPEMetadataWriter = LibC::GUID.new(0xbd6edfca_u32, 0x2890_u16, 0x482f_u16, StaticArray[0xb2_u8, 0x33_u8, 0x8d_u8, 0x73_u8, 0x39_u8, 0xa1_u8, 0xcf_u8, 0x8d_u8])
  CLSID_WICJpegChrominanceMetadataReader = LibC::GUID.new(0x50b1904b_u32, 0xf28f_u16, 0x4574_u16, StaticArray[0x93_u8, 0xf4_u8, 0xb_u8, 0xad_u8, 0xe8_u8, 0x2c_u8, 0x69_u8, 0xe9_u8])
  CLSID_WICJpegChrominanceMetadataWriter = LibC::GUID.new(0x3ff566f0_u32, 0x6e6b_u16, 0x49d4_u16, StaticArray[0x96_u8, 0xe6_u8, 0xb7_u8, 0x88_u8, 0x86_u8, 0x69_u8, 0x2c_u8, 0x62_u8])
  CLSID_WICJpegLuminanceMetadataReader = LibC::GUID.new(0x356f2f88_u32, 0x5a6_u16, 0x4728_u16, StaticArray[0xb9_u8, 0xa4_u8, 0x1b_u8, 0xfb_u8, 0xce_u8, 0x4_u8, 0xd8_u8, 0x38_u8])
  CLSID_WICJpegLuminanceMetadataWriter = LibC::GUID.new(0x1d583abc_u32, 0x8a0e_u16, 0x4657_u16, StaticArray[0x99_u8, 0x82_u8, 0xa3_u8, 0x80_u8, 0xca_u8, 0x58_u8, 0xfb_u8, 0x4b_u8])
  CLSID_WICJpegCommentMetadataReader = LibC::GUID.new(0x9f66347c_u32, 0x60c4_u16, 0x4c4d_u16, StaticArray[0xab_u8, 0x58_u8, 0xd2_u8, 0x35_u8, 0x86_u8, 0x85_u8, 0xf6_u8, 0x7_u8])
  CLSID_WICJpegCommentMetadataWriter = LibC::GUID.new(0xe573236f_u32, 0x55b1_u16, 0x4eda_u16, StaticArray[0x81_u8, 0xea_u8, 0x9f_u8, 0x65_u8, 0xdb_u8, 0x2_u8, 0x90_u8, 0xd3_u8])
  CLSID_WICGifCommentMetadataReader = LibC::GUID.new(0x32557d3b_u32, 0x69dc_u16, 0x4f95_u16, StaticArray[0x83_u8, 0x6e_u8, 0xf5_u8, 0x97_u8, 0x2b_u8, 0x2f_u8, 0x61_u8, 0x59_u8])
  CLSID_WICGifCommentMetadataWriter = LibC::GUID.new(0xa02797fc_u32, 0xc4ae_u16, 0x418c_u16, StaticArray[0xaf_u8, 0x95_u8, 0xe6_u8, 0x37_u8, 0xc7_u8, 0xea_u8, 0xd2_u8, 0xa1_u8])
  CLSID_WICPngGamaMetadataReader = LibC::GUID.new(0x3692ca39_u32, 0xe082_u16, 0x4350_u16, StaticArray[0x9e_u8, 0x1f_u8, 0x37_u8, 0x4_u8, 0xcb_u8, 0x8_u8, 0x3c_u8, 0xd5_u8])
  CLSID_WICPngGamaMetadataWriter = LibC::GUID.new(0xff036d13_u32, 0x5d4b_u16, 0x46dd_u16, StaticArray[0xb1_u8, 0xf_u8, 0x10_u8, 0x66_u8, 0x93_u8, 0xd9_u8, 0xfe_u8, 0x4f_u8])
  CLSID_WICPngBkgdMetadataReader = LibC::GUID.new(0xce7a4a6_u32, 0x3e8_u16, 0x4a60_u16, StaticArray[0x9d_u8, 0x15_u8, 0x28_u8, 0x2e_u8, 0xf3_u8, 0x2e_u8, 0xe7_u8, 0xda_u8])
  CLSID_WICPngBkgdMetadataWriter = LibC::GUID.new(0x68e3f2fd_u32, 0x31ae_u16, 0x4441_u16, StaticArray[0xbb_u8, 0x6a_u8, 0xfd_u8, 0x70_u8, 0x47_u8, 0x52_u8, 0x5f_u8, 0x90_u8])
  CLSID_WICPngItxtMetadataReader = LibC::GUID.new(0xaabfb2fa_u32, 0x3e1e_u16, 0x4a8f_u16, StaticArray[0x89_u8, 0x77_u8, 0x55_u8, 0x56_u8, 0xfb_u8, 0x94_u8, 0xea_u8, 0x23_u8])
  CLSID_WICPngItxtMetadataWriter = LibC::GUID.new(0x31879719_u32, 0xe751_u16, 0x4df8_u16, StaticArray[0x98_u8, 0x1d_u8, 0x68_u8, 0xdf_u8, 0xf6_u8, 0x77_u8, 0x4_u8, 0xed_u8])
  CLSID_WICPngChrmMetadataReader = LibC::GUID.new(0xf90b5f36_u32, 0x367b_u16, 0x402a_u16, StaticArray[0x9d_u8, 0xd1_u8, 0xbc_u8, 0xf_u8, 0xd5_u8, 0x9d_u8, 0x8f_u8, 0x62_u8])
  CLSID_WICPngChrmMetadataWriter = LibC::GUID.new(0xe23ce3eb_u32, 0x5608_u16, 0x4e83_u16, StaticArray[0xbc_u8, 0xef_u8, 0x27_u8, 0xb1_u8, 0x98_u8, 0x7e_u8, 0x51_u8, 0xd7_u8])
  CLSID_WICPngHistMetadataReader = LibC::GUID.new(0x877a0bb7_u32, 0xa313_u16, 0x4491_u16, StaticArray[0x87_u8, 0xb5_u8, 0x2e_u8, 0x6d_u8, 0x5_u8, 0x94_u8, 0xf5_u8, 0x20_u8])
  CLSID_WICPngHistMetadataWriter = LibC::GUID.new(0x8a03e749_u32, 0x672e_u16, 0x446e_u16, StaticArray[0xbf_u8, 0x1f_u8, 0x2c_u8, 0x11_u8, 0xd2_u8, 0x33_u8, 0xb6_u8, 0xff_u8])
  CLSID_WICPngIccpMetadataReader = LibC::GUID.new(0xf5d3e63b_u32, 0xcb0f_u16, 0x4628_u16, StaticArray[0xa4_u8, 0x78_u8, 0x6d_u8, 0x82_u8, 0x44_u8, 0xbe_u8, 0x36_u8, 0xb1_u8])
  CLSID_WICPngIccpMetadataWriter = LibC::GUID.new(0x16671e5f_u32, 0xce6_u16, 0x4cc4_u16, StaticArray[0x97_u8, 0x68_u8, 0xe8_u8, 0x9f_u8, 0xe5_u8, 0x1_u8, 0x8a_u8, 0xde_u8])
  CLSID_WICPngSrgbMetadataReader = LibC::GUID.new(0xfb40360c_u32, 0x547e_u16, 0x4956_u16, StaticArray[0xa3_u8, 0xb9_u8, 0xd4_u8, 0x41_u8, 0x88_u8, 0x59_u8, 0xba_u8, 0x66_u8])
  CLSID_WICPngSrgbMetadataWriter = LibC::GUID.new(0xa6ee35c6_u32, 0x87ec_u16, 0x47df_u16, StaticArray[0x9f_u8, 0x22_u8, 0x1d_u8, 0x5a_u8, 0xad_u8, 0x84_u8, 0xc_u8, 0x82_u8])
  CLSID_WICPngTimeMetadataReader = LibC::GUID.new(0xd94edf02_u32, 0xefe5_u16, 0x4f0d_u16, StaticArray[0x85_u8, 0xc8_u8, 0xf5_u8, 0xa6_u8, 0x8b_u8, 0x30_u8, 0x0_u8, 0xb1_u8])
  CLSID_WICPngTimeMetadataWriter = LibC::GUID.new(0x1ab78400_u32, 0xb5a3_u16, 0x4d91_u16, StaticArray[0x8a_u8, 0xce_u8, 0x33_u8, 0xfc_u8, 0xd1_u8, 0x49_u8, 0x9b_u8, 0xe6_u8])
  CLSID_WICDdsMetadataReader = LibC::GUID.new(0x276c88ca_u32, 0x7533_u16, 0x4a86_u16, StaticArray[0xb6_u8, 0x76_u8, 0x66_u8, 0xb3_u8, 0x60_u8, 0x80_u8, 0xd4_u8, 0x84_u8])
  CLSID_WICDdsMetadataWriter = LibC::GUID.new(0xfd688bbd_u32, 0x31ed_u16, 0x4db7_u16, StaticArray[0xa7_u8, 0x23_u8, 0x93_u8, 0x49_u8, 0x27_u8, 0xd3_u8, 0x83_u8, 0x67_u8])
  CLSID_WICHeifMetadataReader = LibC::GUID.new(0xacddfc3f_u32, 0x85ec_u16, 0x41bc_u16, StaticArray[0xbd_u8, 0xef_u8, 0x1b_u8, 0xc2_u8, 0x62_u8, 0xe4_u8, 0xdb_u8, 0x5_u8])
  CLSID_WICHeifMetadataWriter = LibC::GUID.new(0x3ae45e79_u32, 0x40bc_u16, 0x4401_u16, StaticArray[0xac_u8, 0xe5_u8, 0xdd_u8, 0x3c_u8, 0xb1_u8, 0x6e_u8, 0x6a_u8, 0xfe_u8])
  CLSID_WICHeifHDRMetadataReader = LibC::GUID.new(0x2438de3d_u32, 0x94d9_u16, 0x4be8_u16, StaticArray[0x84_u8, 0xa8_u8, 0x4d_u8, 0xe9_u8, 0x5a_u8, 0x57_u8, 0x5e_u8, 0x75_u8])
  CLSID_WICHeifHDRMetadataWriter = LibC::GUID.new(0xb83135a2_u32, 0x8e7e_u16, 0x485e_u16, StaticArray[0xa5_u8, 0x33_u8, 0xf9_u8, 0x36_u8, 0x21_u8, 0xdd_u8, 0x93_u8, 0xc8_u8])
  CLSID_WICWebpAnimMetadataReader = LibC::GUID.new(0x76f9911_u32, 0xa348_u16, 0x465c_u16, StaticArray[0xa8_u8, 0x7_u8, 0xa2_u8, 0x52_u8, 0xf3_u8, 0xf2_u8, 0xd3_u8, 0xde_u8])
  CLSID_WICWebpAnmfMetadataReader = LibC::GUID.new(0x85a10b03_u32, 0xc9f6_u16, 0x439f_u16, StaticArray[0xbe_u8, 0x5e_u8, 0xc0_u8, 0xfb_u8, 0xef_u8, 0x67_u8, 0x80_u8, 0x7c_u8])
  CLSID_WICJpegXLAnimMetadataReader = LibC::GUID.new(0xbf8b6eb0_u32, 0x37e2_u16, 0x4ed8_u16, StaticArray[0x82_u8, 0x89_u8, 0xbe_u8, 0x9a_u8, 0xe3_u8, 0x1d_u8, 0x9f_u8, 0x3_u8])
  CLSID_WICJpegXLAnimMetadataWriter = LibC::GUID.new(0x39d01345_u32, 0x432b_u16, 0x44e6_u16, StaticArray[0xaf_u8, 0xd6_u8, 0xf6_u8, 0x6_u8, 0xd2_u8, 0xa_u8, 0x55_u8, 0x71_u8])
  CLSID_WICJpegXLAnimFrameMetadataReader = LibC::GUID.new(0x9cdf50a8_u32, 0x8770_u16, 0x4fe6_u16, StaticArray[0xae_u8, 0xf2_u8, 0xd0_u8, 0x6e_u8, 0x2c_u8, 0x1_u8, 0x74_u8, 0x4f_u8])
  CLSID_WICJpegXLAnimFrameMetadataWriter = LibC::GUID.new(0xd1ce58a8_u32, 0x6e0_u16, 0x4b6f_u16, StaticArray[0x8f_u8, 0xc1_u8, 0x57_u8, 0x75_u8, 0x60_u8, 0xbd_u8, 0x5a_u8, 0xd9_u8])
  CLSID_WICGainMapMetadataReader = LibC::GUID.new(0x3ac32daf_u32, 0x27b9_u16, 0x4af5_u16, StaticArray[0xb0_u8, 0xab_u8, 0xd1_u8, 0x18_u8, 0x9d_u8, 0xcf_u8, 0x34_u8, 0xb3_u8])
  CLSID_WICGainMapMetadataWriter = LibC::GUID.new(0x6f845268_u32, 0xa92e_u16, 0x4a02_u16, StaticArray[0xb0_u8, 0x2_u8, 0xa6_u8, 0x7c_u8, 0x36_u8, 0x28_u8, 0x0_u8, 0xb2_u8])

  enum WICColorContextType
    WICColorContextUninitialized = 0_i32
    WICColorContextProfile = 1_i32
    WICColorContextExifColorSpace = 2_i32
  end
  enum WICBitmapCreateCacheOption
    WICBitmapNoCache = 0_i32
    WICBitmapCacheOnDemand = 1_i32
    WICBitmapCacheOnLoad = 2_i32
  end
  enum WICDecodeOptions
    WICDecodeMetadataCacheOnDemand = 0_i32
    WICDecodeMetadataCacheOnLoad = 1_i32
  end
  enum WICBitmapEncoderCacheOption
    WICBitmapEncoderCacheInMemory = 0_i32
    WICBitmapEncoderCacheTempFile = 1_i32
    WICBitmapEncoderNoCache = 2_i32
  end
  enum WICComponentType
    WICDecoder = 1_i32
    WICEncoder = 2_i32
    WICPixelFormatConverter = 4_i32
    WICMetadataReader = 8_i32
    WICMetadataWriter = 16_i32
    WICPixelFormat = 32_i32
    WICAllComponents = 63_i32
  end
  enum WICComponentEnumerateOptions
    WICComponentEnumerateDefault = 0_i32
    WICComponentEnumerateRefresh = 1_i32
    WICComponentEnumerateDisabled = -2147483648_i32
    WICComponentEnumerateUnsigned = 1073741824_i32
    WICComponentEnumerateBuiltInOnly = 536870912_i32
  end
  enum WICBitmapInterpolationMode
    WICBitmapInterpolationModeNearestNeighbor = 0_i32
    WICBitmapInterpolationModeLinear = 1_i32
    WICBitmapInterpolationModeCubic = 2_i32
    WICBitmapInterpolationModeFant = 3_i32
    WICBitmapInterpolationModeHighQualityCubic = 4_i32
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
  end
  enum WICBitmapAlphaChannelOption
    WICBitmapUseAlpha = 0_i32
    WICBitmapUsePremultipliedAlpha = 1_i32
    WICBitmapIgnoreAlpha = 2_i32
  end
  enum WICBitmapTransformOptions
    WICBitmapTransformRotate0 = 0_i32
    WICBitmapTransformRotate90 = 1_i32
    WICBitmapTransformRotate180 = 2_i32
    WICBitmapTransformRotate270 = 3_i32
    WICBitmapTransformFlipHorizontal = 8_i32
    WICBitmapTransformFlipVertical = 16_i32
  end
  enum WICBitmapLockFlags
    WICBitmapLockRead = 1_i32
    WICBitmapLockWrite = 2_i32
  end
  enum WICBitmapDecoderCapabilities
    WICBitmapDecoderCapabilitySameEncoder = 1_i32
    WICBitmapDecoderCapabilityCanDecodeAllImages = 2_i32
    WICBitmapDecoderCapabilityCanDecodeSomeImages = 4_i32
    WICBitmapDecoderCapabilityCanEnumerateMetadata = 8_i32
    WICBitmapDecoderCapabilityCanDecodeThumbnail = 16_i32
  end
  enum WICProgressOperation
    WICProgressOperationCopyPixels = 1_i32
    WICProgressOperationWritePixels = 2_i32
    WICProgressOperationAll = 65535_i32
  end
  enum WICProgressNotification
    WICProgressNotificationBegin = 65536_i32
    WICProgressNotificationEnd = 131072_i32
    WICProgressNotificationFrequent = 262144_i32
    WICProgressNotificationAll = -65536_i32
  end
  enum WICComponentSigning
    WICComponentSigned = 1_i32
    WICComponentUnsigned = 2_i32
    WICComponentSafe = 4_i32
    WICComponentDisabled = -2147483648_i32
  end
  enum WICBitmapToneMappingMode
    WICBitmapToneMappingMode_None = 0_i32
    WICBitmapToneMappingMode_Default = 1_i32
    WICBitmapToneMappingMode_D2D = 2_i32
    WICBitmapToneMappingMode_GainMap = 3_i32
  end
  enum WICBitmapChainType
    WICBitmapChainType_Alternate = 1_i32
    WICBitmapChainType_Layer = 2_i32
    WICBitmapChainType_Preview = 3_i32
    WICBitmapChainType_Thumbnail = 4_i32
    WICBitmapChainType_AlphaMap = 5_i32
    WICBitmapChainType_DepthMap = 6_i32
    WICBitmapChainType_GainMap = 7_i32
  end
  enum WICGifLogicalScreenDescriptorProperties
    WICGifLogicalScreenSignature = 1_i32
    WICGifLogicalScreenDescriptorWidth = 2_i32
    WICGifLogicalScreenDescriptorHeight = 3_i32
    WICGifLogicalScreenDescriptorGlobalColorTableFlag = 4_i32
    WICGifLogicalScreenDescriptorColorResolution = 5_i32
    WICGifLogicalScreenDescriptorSortFlag = 6_i32
    WICGifLogicalScreenDescriptorGlobalColorTableSize = 7_i32
    WICGifLogicalScreenDescriptorBackgroundColorIndex = 8_i32
    WICGifLogicalScreenDescriptorPixelAspectRatio = 9_i32
  end
  enum WICGifImageDescriptorProperties
    WICGifImageDescriptorLeft = 1_i32
    WICGifImageDescriptorTop = 2_i32
    WICGifImageDescriptorWidth = 3_i32
    WICGifImageDescriptorHeight = 4_i32
    WICGifImageDescriptorLocalColorTableFlag = 5_i32
    WICGifImageDescriptorInterlaceFlag = 6_i32
    WICGifImageDescriptorSortFlag = 7_i32
    WICGifImageDescriptorLocalColorTableSize = 8_i32
  end
  enum WICGifGraphicControlExtensionProperties
    WICGifGraphicControlExtensionDisposal = 1_i32
    WICGifGraphicControlExtensionUserInputFlag = 2_i32
    WICGifGraphicControlExtensionTransparencyFlag = 3_i32
    WICGifGraphicControlExtensionDelay = 4_i32
    WICGifGraphicControlExtensionTransparentColorIndex = 5_i32
  end
  enum WICGifApplicationExtensionProperties
    WICGifApplicationExtensionApplication = 1_i32
    WICGifApplicationExtensionData = 2_i32
  end
  enum WICGifCommentExtensionProperties
    WICGifCommentExtensionText = 1_i32
  end
  enum WICJpegCommentProperties
    WICJpegCommentText = 1_i32
  end
  enum WICJpegLuminanceProperties
    WICJpegLuminanceTable = 1_i32
  end
  enum WICJpegChrominanceProperties
    WICJpegChrominanceTable = 1_i32
  end
  enum WIC8BIMIptcProperties
    WIC8BIMIptcPString = 0_i32
    WIC8BIMIptcEmbeddedIPTC = 1_i32
  end
  enum WIC8BIMResolutionInfoProperties
    WIC8BIMResolutionInfoPString = 1_i32
    WIC8BIMResolutionInfoHResolution = 2_i32
    WIC8BIMResolutionInfoHResolutionUnit = 3_i32
    WIC8BIMResolutionInfoWidthUnit = 4_i32
    WIC8BIMResolutionInfoVResolution = 5_i32
    WIC8BIMResolutionInfoVResolutionUnit = 6_i32
    WIC8BIMResolutionInfoHeightUnit = 7_i32
  end
  enum WIC8BIMIptcDigestProperties
    WIC8BIMIptcDigestPString = 1_i32
    WIC8BIMIptcDigestIptcDigest = 2_i32
  end
  enum WICPngGamaProperties
    WICPngGamaGamma = 1_i32
  end
  enum WICPngBkgdProperties
    WICPngBkgdBackgroundColor = 1_i32
  end
  enum WICPngItxtProperties
    WICPngItxtKeyword = 1_i32
    WICPngItxtCompressionFlag = 2_i32
    WICPngItxtLanguageTag = 3_i32
    WICPngItxtTranslatedKeyword = 4_i32
    WICPngItxtText = 5_i32
  end
  enum WICPngChrmProperties
    WICPngChrmWhitePointX = 1_i32
    WICPngChrmWhitePointY = 2_i32
    WICPngChrmRedX = 3_i32
    WICPngChrmRedY = 4_i32
    WICPngChrmGreenX = 5_i32
    WICPngChrmGreenY = 6_i32
    WICPngChrmBlueX = 7_i32
    WICPngChrmBlueY = 8_i32
  end
  enum WICPngHistProperties
    WICPngHistFrequencies = 1_i32
  end
  enum WICPngIccpProperties
    WICPngIccpProfileName = 1_i32
    WICPngIccpProfileData = 2_i32
  end
  enum WICPngSrgbProperties
    WICPngSrgbRenderingIntent = 1_i32
  end
  enum WICPngTimeProperties
    WICPngTimeYear = 1_i32
    WICPngTimeMonth = 2_i32
    WICPngTimeDay = 3_i32
    WICPngTimeHour = 4_i32
    WICPngTimeMinute = 5_i32
    WICPngTimeSecond = 6_i32
  end
  enum WICHeifProperties
    WICHeifOrientation = 1_i32
    WICHeifLayeredImageCanvasColor = 2_i32
    WICHeifLayeredImageLayerPositions = 3_i32
  end
  enum WICHeifHdrProperties
    WICHeifHdrMaximumLuminanceLevel = 1_i32
    WICHeifHdrMaximumFrameAverageLuminanceLevel = 2_i32
    WICHeifHdrMinimumMasteringDisplayLuminanceLevel = 3_i32
    WICHeifHdrMaximumMasteringDisplayLuminanceLevel = 4_i32
    WICHeifHdrCustomVideoPrimaries = 5_i32
  end
  enum WICWebpAnimProperties
    WICWebpAnimLoopCount = 1_i32
  end
  enum WICWebpAnmfProperties
    WICWebpAnmfFrameDuration = 1_i32
  end
  enum WICJpegXLAnimProperties
    WICJpegXLAnimLoopCount = 1_i32
    WICJpegXLAnimFrameTicksPerSecondNumerator = 2_i32
    WICJpegXLAnimFrameTicksPerSecondDenominator = 3_i32
  end
  enum WICJpegXLAnimFrameProperties
    WICJpegXLAnimFrameDurationInTicks = 1_i32
    WICJpegXLAnimFrameName = 2_i32
  end
  enum WICGainMapProperties
    WICGainMapMetadata = 1_i32
  end
  enum WICSectionAccessLevel
    WICSectionAccessLevelRead = 1_i32
    WICSectionAccessLevelReadWrite = 3_i32
  end
  enum WICPixelFormatNumericRepresentation
    WICPixelFormatNumericRepresentationUnspecified = 0_i32
    WICPixelFormatNumericRepresentationIndexed = 1_i32
    WICPixelFormatNumericRepresentationUnsignedInteger = 2_i32
    WICPixelFormatNumericRepresentationSignedInteger = 3_i32
    WICPixelFormatNumericRepresentationFixed = 4_i32
    WICPixelFormatNumericRepresentationFloat = 5_i32
  end
  enum WICPlanarOptions
    WICPlanarOptionsDefault = 0_i32
    WICPlanarOptionsPreserveSubsampling = 1_i32
  end
  enum WICJpegIndexingOptions
    WICJpegIndexingOptionsGenerateOnDemand = 0_i32
    WICJpegIndexingOptionsGenerateOnLoad = 1_i32
  end
  enum WICJpegTransferMatrix
    WICJpegTransferMatrixIdentity = 0_i32
    WICJpegTransferMatrixBT601 = 1_i32
  end
  enum WICJpegScanType
    WICJpegScanTypeInterleaved = 0_i32
    WICJpegScanTypePlanarComponents = 1_i32
    WICJpegScanTypeProgressive = 2_i32
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
  end
  enum WICJpegYCrCbSubsamplingOption
    WICJpegYCrCbSubsamplingDefault = 0_i32
    WICJpegYCrCbSubsampling420 = 1_i32
    WICJpegYCrCbSubsampling422 = 2_i32
    WICJpegYCrCbSubsampling444 = 3_i32
    WICJpegYCrCbSubsampling440 = 4_i32
  end
  enum WICPngFilterOption
    WICPngFilterUnspecified = 0_i32
    WICPngFilterNone = 1_i32
    WICPngFilterSub = 2_i32
    WICPngFilterUp = 3_i32
    WICPngFilterAverage = 4_i32
    WICPngFilterPaeth = 5_i32
    WICPngFilterAdaptive = 6_i32
  end
  enum WICHeifCompressionOption
    WICHeifCompressionDontCare = 0_i32
    WICHeifCompressionNone = 1_i32
    WICHeifCompressionHEVC = 2_i32
    WICHeifCompressionAV1 = 3_i32
    WICHeifCompressionJpegXL = 4_i32
    WICHeifCompressionBrotli = 5_i32
    WICHeifCompressionDeflate = 6_i32
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
  end
  enum WICRawCapabilities
    WICRawCapabilityNotSupported = 0_i32
    WICRawCapabilityGetSupported = 1_i32
    WICRawCapabilityFullySupported = 2_i32
  end
  enum WICRawRotationCapabilities
    WICRawRotationCapabilityNotSupported = 0_i32
    WICRawRotationCapabilityGetSupported = 1_i32
    WICRawRotationCapabilityNinetyDegreesSupported = 2_i32
    WICRawRotationCapabilityFullySupported = 3_i32
  end
  enum WICRawParameterSet
    WICAsShotParameterSet = 1_i32
    WICUserAdjustedParameterSet = 2_i32
    WICAutoAdjustedParameterSet = 3_i32
  end
  enum WICRawRenderMode
    WICRawRenderModeDraft = 1_i32
    WICRawRenderModeNormal = 2_i32
    WICRawRenderModeBestQuality = 3_i32
  end
  enum WICDdsDimension
    WICDdsTexture1D = 0_i32
    WICDdsTexture2D = 1_i32
    WICDdsTexture3D = 2_i32
    WICDdsTextureCube = 3_i32
  end
  enum WICDdsAlphaMode
    WICDdsAlphaModeUnknown = 0_i32
    WICDdsAlphaModeStraight = 1_i32
    WICDdsAlphaModePremultiplied = 2_i32
    WICDdsAlphaModeOpaque = 3_i32
    WICDdsAlphaModeCustom = 4_i32
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
    property position : UInt64
    property length : UInt32
    property pattern : UInt8*
    property mask : UInt8*
    property end_of_stream : Win32cr::Foundation::BOOL
    def initialize(@position : UInt64, @length : UInt32, @pattern : UInt8*, @mask : UInt8*, @end_of_stream : Win32cr::Foundation::BOOL)
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
    property aPoints : Win32cr::Graphics::Imaging::WICRawToneCurvePoint[1]
    def initialize(@cPoints : UInt32, @aPoints : Win32cr::Graphics::Imaging::WICRawToneCurvePoint[1])
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
    property position : UInt64
    property length : UInt32
    property pattern : UInt8*
    property mask : UInt8*
    property data_offset : UInt64
    def initialize(@position : UInt64, @length : UInt32, @pattern : UInt8*, @mask : UInt8*, @data_offset : UInt64)
    end
  end

  @[Extern]
  struct WICMetadataHeader
    property position : UInt64
    property length : UInt32
    property header : UInt8*
    property data_offset : UInt64
    def initialize(@position : UInt64, @length : UInt32, @header : UInt8*, @data_offset : UInt64)
    end
  end

  @[Extern]

  record IWICPaletteVtable,
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
  record IWICPalette, lpVtbl : IWICPaletteVtable* do
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

  record IWICBitmapSourceVtable,
    query_interface : Proc(IWICBitmapSource*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICBitmapSource*, UInt32),
    release : Proc(IWICBitmapSource*, UInt32),
    get_size : Proc(IWICBitmapSource*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_pixel_format : Proc(IWICBitmapSource*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_resolution : Proc(IWICBitmapSource*, Float64*, Float64*, Win32cr::Foundation::HRESULT),
    copy_palette : Proc(IWICBitmapSource*, Void*, Win32cr::Foundation::HRESULT),
    copy_pixels : Proc(IWICBitmapSource*, Win32cr::Graphics::Imaging::WICRect*, UInt32, UInt32, UInt8*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICBitmapSource, lpVtbl : IWICBitmapSourceVtable* do
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

  record IWICFormatConverterVtable,
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
  record IWICFormatConverter, lpVtbl : IWICFormatConverterVtable* do
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

  record IWICPlanarFormatConverterVtable,
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
  record IWICPlanarFormatConverter, lpVtbl : IWICPlanarFormatConverterVtable* do
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

  record IWICBitmapScalerVtable,
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
  record IWICBitmapScaler, lpVtbl : IWICBitmapScalerVtable* do
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

  record IWICBitmapClipperVtable,
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
  record IWICBitmapClipper, lpVtbl : IWICBitmapClipperVtable* do
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

  record IWICBitmapFlipRotatorVtable,
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
  record IWICBitmapFlipRotator, lpVtbl : IWICBitmapFlipRotatorVtable* do
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

  record IWICBitmapToneMapperVtable,
    query_interface : Proc(IWICBitmapToneMapper*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICBitmapToneMapper*, UInt32),
    release : Proc(IWICBitmapToneMapper*, UInt32),
    get_size : Proc(IWICBitmapToneMapper*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_pixel_format : Proc(IWICBitmapToneMapper*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_resolution : Proc(IWICBitmapToneMapper*, Float64*, Float64*, Win32cr::Foundation::HRESULT),
    copy_palette : Proc(IWICBitmapToneMapper*, Void*, Win32cr::Foundation::HRESULT),
    copy_pixels : Proc(IWICBitmapToneMapper*, Win32cr::Graphics::Imaging::WICRect*, UInt32, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    initialize_for_hdr_target : Proc(IWICBitmapToneMapper*, Void*, LibC::GUID*, Float32, Float32, Win32cr::Graphics::Imaging::WICBitmapToneMappingMode, Win32cr::Foundation::HRESULT),
    initialize_for_sdr_target : Proc(IWICBitmapToneMapper*, Void*, LibC::GUID*, Win32cr::Graphics::Imaging::WICBitmapToneMappingMode, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICBitmapToneMapper, lpVtbl : IWICBitmapToneMapperVtable* do
    GUID = LibC::GUID.new(0x44728ded_u32, 0x1edf_u16, 0x4fe9_u16, StaticArray[0xb5_u8, 0xb_u8, 0xc8_u8, 0x9a_u8, 0x26_u8, 0x4c_u8, 0x94_u8, 0x39_u8])
    def query_interface(this : IWICBitmapToneMapper*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICBitmapToneMapper*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICBitmapToneMapper*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_size(this : IWICBitmapToneMapper*, puiWidth : UInt32*, puiHeight : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_size.call(this, puiWidth, puiHeight)
    end
    def get_pixel_format(this : IWICBitmapToneMapper*, pPixelFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pixel_format.call(this, pPixelFormat)
    end
    def get_resolution(this : IWICBitmapToneMapper*, pDpiX : Float64*, pDpiY : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_resolution.call(this, pDpiX, pDpiY)
    end
    def copy_palette(this : IWICBitmapToneMapper*, pIPalette : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_palette.call(this, pIPalette)
    end
    def copy_pixels(this : IWICBitmapToneMapper*, prc : Win32cr::Graphics::Imaging::WICRect*, cbStride : UInt32, cbBufferSize : UInt32, pbBuffer : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_pixels.call(this, prc, cbStride, cbBufferSize, pbBuffer)
    end
    def initialize_for_hdr_target(this : IWICBitmapToneMapper*, pISource : Void*, guidDstFormat : LibC::GUID*, fLuminanceInNits : Float32, fWhiteLevelInNits : Float32, mode : Win32cr::Graphics::Imaging::WICBitmapToneMappingMode) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_for_hdr_target.call(this, pISource, guidDstFormat, fLuminanceInNits, fWhiteLevelInNits, mode)
    end
    def initialize_for_sdr_target(this : IWICBitmapToneMapper*, pISource : Void*, guidDstFormat : LibC::GUID*, mode : Win32cr::Graphics::Imaging::WICBitmapToneMappingMode) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_for_sdr_target.call(this, pISource, guidDstFormat, mode)
    end

  end

  @[Extern]

  record IWICBitmapLockVtable,
    query_interface : Proc(IWICBitmapLock*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICBitmapLock*, UInt32),
    release : Proc(IWICBitmapLock*, UInt32),
    get_size : Proc(IWICBitmapLock*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_stride : Proc(IWICBitmapLock*, UInt32*, Win32cr::Foundation::HRESULT),
    get_data_pointer : Proc(IWICBitmapLock*, UInt32*, UInt8**, Win32cr::Foundation::HRESULT),
    get_pixel_format : Proc(IWICBitmapLock*, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICBitmapLock, lpVtbl : IWICBitmapLockVtable* do
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

  record IWICBitmapVtable,
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
  record IWICBitmap, lpVtbl : IWICBitmapVtable* do
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

  record IWICColorContextVtable,
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
  record IWICColorContext, lpVtbl : IWICColorContextVtable* do
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

  record IWICColorTransformVtable,
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
  record IWICColorTransform, lpVtbl : IWICColorTransformVtable* do
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

  record IWICFastMetadataEncoderVtable,
    query_interface : Proc(IWICFastMetadataEncoder*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICFastMetadataEncoder*, UInt32),
    release : Proc(IWICFastMetadataEncoder*, UInt32),
    commit : Proc(IWICFastMetadataEncoder*, Win32cr::Foundation::HRESULT),
    get_metadata_query_writer : Proc(IWICFastMetadataEncoder*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICFastMetadataEncoder, lpVtbl : IWICFastMetadataEncoderVtable* do
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

  record IWICStreamVtable,
    query_interface : Proc(IWICStream*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICStream*, UInt32),
    release : Proc(IWICStream*, UInt32),
    read : Proc(IWICStream*, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    write : Proc(IWICStream*, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    seek : Proc(IWICStream*, Int64, Win32cr::System::Com::STREAM_SEEK, UInt64*, Win32cr::Foundation::HRESULT),
    set_size : Proc(IWICStream*, UInt64, Win32cr::Foundation::HRESULT),
    copy_to : Proc(IWICStream*, Void*, UInt64, UInt64*, UInt64*, Win32cr::Foundation::HRESULT),
    commit : Proc(IWICStream*, Win32cr::System::Com::STGC, Win32cr::Foundation::HRESULT),
    revert : Proc(IWICStream*, Win32cr::Foundation::HRESULT),
    lock_region : Proc(IWICStream*, UInt64, UInt64, Win32cr::System::Com::LOCKTYPE, Win32cr::Foundation::HRESULT),
    unlock_region : Proc(IWICStream*, UInt64, UInt64, UInt32, Win32cr::Foundation::HRESULT),
    stat : Proc(IWICStream*, Win32cr::System::Com::STATSTG*, Win32cr::System::Com::STATFLAG, Win32cr::Foundation::HRESULT),
    clone : Proc(IWICStream*, Void**, Win32cr::Foundation::HRESULT),
    initialize_from_i_stream : Proc(IWICStream*, Void*, Win32cr::Foundation::HRESULT),
    initialize_from_filename : Proc(IWICStream*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    initialize_from_memory : Proc(IWICStream*, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    initialize_from_i_stream_region : Proc(IWICStream*, Void*, UInt64, UInt64, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICStream, lpVtbl : IWICStreamVtable* do
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
    def seek(this : IWICStream*, dlibMove : Int64, dwOrigin : Win32cr::System::Com::STREAM_SEEK, plibNewPosition : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.seek.call(this, dlibMove, dwOrigin, plibNewPosition)
    end
    def set_size(this : IWICStream*, libNewSize : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_size.call(this, libNewSize)
    end
    def copy_to(this : IWICStream*, pstm : Void*, cb : UInt64, pcbRead : UInt64*, pcbWritten : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_to.call(this, pstm, cb, pcbRead, pcbWritten)
    end
    def commit(this : IWICStream*, grfCommitFlags : Win32cr::System::Com::STGC) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this, grfCommitFlags)
    end
    def revert(this : IWICStream*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.revert.call(this)
    end
    def lock_region(this : IWICStream*, libOffset : UInt64, cb : UInt64, dwLockType : Win32cr::System::Com::LOCKTYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lock_region.call(this, libOffset, cb, dwLockType)
    end
    def unlock_region(this : IWICStream*, libOffset : UInt64, cb : UInt64, dwLockType : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unlock_region.call(this, libOffset, cb, dwLockType)
    end
    def stat(this : IWICStream*, pstatstg : Win32cr::System::Com::STATSTG*, grfStatFlag : Win32cr::System::Com::STATFLAG) : Win32cr::Foundation::HRESULT
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
    def initialize_from_i_stream_region(this : IWICStream*, pIStream : Void*, ulOffset : UInt64, ulMaxSize : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_from_i_stream_region.call(this, pIStream, ulOffset, ulMaxSize)
    end

  end

  @[Extern]

  record IWICEnumMetadataItemVtable,
    query_interface : Proc(IWICEnumMetadataItem*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICEnumMetadataItem*, UInt32),
    release : Proc(IWICEnumMetadataItem*, UInt32),
    next__ : Proc(IWICEnumMetadataItem*, UInt32, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IWICEnumMetadataItem*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IWICEnumMetadataItem*, Win32cr::Foundation::HRESULT),
    clone : Proc(IWICEnumMetadataItem*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICEnumMetadataItem, lpVtbl : IWICEnumMetadataItemVtable* do
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

  record IWICMetadataQueryReaderVtable,
    query_interface : Proc(IWICMetadataQueryReader*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICMetadataQueryReader*, UInt32),
    release : Proc(IWICMetadataQueryReader*, UInt32),
    get_container_format : Proc(IWICMetadataQueryReader*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_location : Proc(IWICMetadataQueryReader*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_metadata_by_name : Proc(IWICMetadataQueryReader*, Win32cr::Foundation::PWSTR, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    get_enumerator : Proc(IWICMetadataQueryReader*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICMetadataQueryReader, lpVtbl : IWICMetadataQueryReaderVtable* do
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
    def get_location(this : IWICMetadataQueryReader*, cchMaxLength : UInt32, wzNamespace : Win32cr::Foundation::PWSTR, pcchActualLength : UInt32*) : Win32cr::Foundation::HRESULT
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

  record IWICMetadataQueryWriterVtable,
    query_interface : Proc(IWICMetadataQueryWriter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICMetadataQueryWriter*, UInt32),
    release : Proc(IWICMetadataQueryWriter*, UInt32),
    get_container_format : Proc(IWICMetadataQueryWriter*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_location : Proc(IWICMetadataQueryWriter*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_metadata_by_name : Proc(IWICMetadataQueryWriter*, Win32cr::Foundation::PWSTR, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    get_enumerator : Proc(IWICMetadataQueryWriter*, Void**, Win32cr::Foundation::HRESULT),
    set_metadata_by_name : Proc(IWICMetadataQueryWriter*, Win32cr::Foundation::PWSTR, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    remove_metadata_by_name : Proc(IWICMetadataQueryWriter*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICMetadataQueryWriter, lpVtbl : IWICMetadataQueryWriterVtable* do
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
    def get_location(this : IWICMetadataQueryWriter*, cchMaxLength : UInt32, wzNamespace : Win32cr::Foundation::PWSTR, pcchActualLength : UInt32*) : Win32cr::Foundation::HRESULT
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

  record IWICBitmapEncoderVtable,
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
  record IWICBitmapEncoder, lpVtbl : IWICBitmapEncoderVtable* do
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

  record IWICBitmapFrameEncodeVtable,
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
  record IWICBitmapFrameEncode, lpVtbl : IWICBitmapFrameEncodeVtable* do
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

  record IWICPlanarBitmapFrameEncodeVtable,
    query_interface : Proc(IWICPlanarBitmapFrameEncode*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICPlanarBitmapFrameEncode*, UInt32),
    release : Proc(IWICPlanarBitmapFrameEncode*, UInt32),
    write_pixels : Proc(IWICPlanarBitmapFrameEncode*, UInt32, Win32cr::Graphics::Imaging::WICBitmapPlane*, UInt32, Win32cr::Foundation::HRESULT),
    write_source : Proc(IWICPlanarBitmapFrameEncode*, Void**, UInt32, Win32cr::Graphics::Imaging::WICRect*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICPlanarBitmapFrameEncode, lpVtbl : IWICPlanarBitmapFrameEncodeVtable* do
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

  record IWICBitmapDecoderVtable,
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
  record IWICBitmapDecoder, lpVtbl : IWICBitmapDecoderVtable* do
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

  record IWICBitmapSourceTransformVtable,
    query_interface : Proc(IWICBitmapSourceTransform*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICBitmapSourceTransform*, UInt32),
    release : Proc(IWICBitmapSourceTransform*, UInt32),
    copy_pixels : Proc(IWICBitmapSourceTransform*, Win32cr::Graphics::Imaging::WICRect*, UInt32, UInt32, LibC::GUID*, Win32cr::Graphics::Imaging::WICBitmapTransformOptions, UInt32, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    get_closest_size : Proc(IWICBitmapSourceTransform*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_closest_pixel_format : Proc(IWICBitmapSourceTransform*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    does_support_transform : Proc(IWICBitmapSourceTransform*, Win32cr::Graphics::Imaging::WICBitmapTransformOptions, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICBitmapSourceTransform, lpVtbl : IWICBitmapSourceTransformVtable* do
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

  record IWICBitmapSourceTransform2Vtable,
    query_interface : Proc(IWICBitmapSourceTransform2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICBitmapSourceTransform2*, UInt32),
    release : Proc(IWICBitmapSourceTransform2*, UInt32),
    copy_pixels : Proc(IWICBitmapSourceTransform2*, Win32cr::Graphics::Imaging::WICRect*, UInt32, UInt32, LibC::GUID*, Win32cr::Graphics::Imaging::WICBitmapTransformOptions, UInt32, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    get_closest_size : Proc(IWICBitmapSourceTransform2*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_closest_pixel_format : Proc(IWICBitmapSourceTransform2*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    does_support_transform : Proc(IWICBitmapSourceTransform2*, Win32cr::Graphics::Imaging::WICBitmapTransformOptions, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_color_contexts_for_pixel_format : Proc(IWICBitmapSourceTransform2*, LibC::GUID*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICBitmapSourceTransform2, lpVtbl : IWICBitmapSourceTransform2Vtable* do
    GUID = LibC::GUID.new(0xc3373fdf_u32, 0x6d39_u16, 0x4e5f_u16, StaticArray[0x8e_u8, 0x79_u8, 0xbf_u8, 0x40_u8, 0xc0_u8, 0xb7_u8, 0xed_u8, 0x77_u8])
    def query_interface(this : IWICBitmapSourceTransform2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICBitmapSourceTransform2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICBitmapSourceTransform2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def copy_pixels(this : IWICBitmapSourceTransform2*, prc : Win32cr::Graphics::Imaging::WICRect*, uiWidth : UInt32, uiHeight : UInt32, pguidDstFormat : LibC::GUID*, dstTransform : Win32cr::Graphics::Imaging::WICBitmapTransformOptions, nStride : UInt32, cbBufferSize : UInt32, pbBuffer : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_pixels.call(this, prc, uiWidth, uiHeight, pguidDstFormat, dstTransform, nStride, cbBufferSize, pbBuffer)
    end
    def get_closest_size(this : IWICBitmapSourceTransform2*, puiWidth : UInt32*, puiHeight : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_closest_size.call(this, puiWidth, puiHeight)
    end
    def get_closest_pixel_format(this : IWICBitmapSourceTransform2*, pguidDstFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_closest_pixel_format.call(this, pguidDstFormat)
    end
    def does_support_transform(this : IWICBitmapSourceTransform2*, dstTransform : Win32cr::Graphics::Imaging::WICBitmapTransformOptions, pfIsSupported : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.does_support_transform.call(this, dstTransform, pfIsSupported)
    end
    def get_color_contexts_for_pixel_format(this : IWICBitmapSourceTransform2*, pPixelFormat : LibC::GUID*, cCount : UInt32, ppIColorContexts : Void**, pcActualCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_color_contexts_for_pixel_format.call(this, pPixelFormat, cCount, ppIColorContexts, pcActualCount)
    end

  end

  @[Extern]

  record IWICPlanarBitmapSourceTransformVtable,
    query_interface : Proc(IWICPlanarBitmapSourceTransform*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICPlanarBitmapSourceTransform*, UInt32),
    release : Proc(IWICPlanarBitmapSourceTransform*, UInt32),
    does_support_transform : Proc(IWICPlanarBitmapSourceTransform*, UInt32*, UInt32*, Win32cr::Graphics::Imaging::WICBitmapTransformOptions, Win32cr::Graphics::Imaging::WICPlanarOptions, LibC::GUID*, Win32cr::Graphics::Imaging::WICBitmapPlaneDescription*, UInt32, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    copy_pixels : Proc(IWICPlanarBitmapSourceTransform*, Win32cr::Graphics::Imaging::WICRect*, UInt32, UInt32, Win32cr::Graphics::Imaging::WICBitmapTransformOptions, Win32cr::Graphics::Imaging::WICPlanarOptions, Win32cr::Graphics::Imaging::WICBitmapPlane*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICPlanarBitmapSourceTransform, lpVtbl : IWICPlanarBitmapSourceTransformVtable* do
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

  record IWICBitmapFrameDecodeVtable,
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
  record IWICBitmapFrameDecode, lpVtbl : IWICBitmapFrameDecodeVtable* do
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

  record IWICBitmapFrameChainReaderVtable,
    query_interface : Proc(IWICBitmapFrameChainReader*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICBitmapFrameChainReader*, UInt32),
    release : Proc(IWICBitmapFrameChainReader*, UInt32),
    get_chained_frame_count : Proc(IWICBitmapFrameChainReader*, Win32cr::Graphics::Imaging::WICBitmapChainType, UInt32*, Win32cr::Foundation::HRESULT),
    get_chained_frame : Proc(IWICBitmapFrameChainReader*, Win32cr::Graphics::Imaging::WICBitmapChainType, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICBitmapFrameChainReader, lpVtbl : IWICBitmapFrameChainReaderVtable* do
    GUID = LibC::GUID.new(0xc599495_u32, 0xa120_u16, 0x4222_u16, StaticArray[0x91_u8, 0x30_u8, 0xa8_u8, 0xc2_u8, 0x94_u8, 0x10_u8, 0xbd_u8, 0xb_u8])
    def query_interface(this : IWICBitmapFrameChainReader*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICBitmapFrameChainReader*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICBitmapFrameChainReader*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_chained_frame_count(this : IWICBitmapFrameChainReader*, chainType : Win32cr::Graphics::Imaging::WICBitmapChainType, pCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_chained_frame_count.call(this, chainType, pCount)
    end
    def get_chained_frame(this : IWICBitmapFrameChainReader*, chainType : Win32cr::Graphics::Imaging::WICBitmapChainType, index : UInt32, ppIBitmapFrame : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_chained_frame.call(this, chainType, index, ppIBitmapFrame)
    end

  end

  @[Extern]

  record IWICBitmapFrameChainWriterVtable,
    query_interface : Proc(IWICBitmapFrameChainWriter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICBitmapFrameChainWriter*, UInt32),
    release : Proc(IWICBitmapFrameChainWriter*, UInt32),
    append_frame_to_chain : Proc(IWICBitmapFrameChainWriter*, Win32cr::Graphics::Imaging::WICBitmapChainType, Void**, Void**, Win32cr::Foundation::HRESULT),
    does_support_chain_type : Proc(IWICBitmapFrameChainWriter*, Win32cr::Graphics::Imaging::WICBitmapChainType, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICBitmapFrameChainWriter, lpVtbl : IWICBitmapFrameChainWriterVtable* do
    GUID = LibC::GUID.new(0x40d9ea28_u32, 0x4768_u16, 0x47b3_u16, StaticArray[0x8c_u8, 0x12_u8, 0x55_u8, 0x8a_u8, 0x48_u8, 0xe9_u8, 0x8e_u8, 0x38_u8])
    def query_interface(this : IWICBitmapFrameChainWriter*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICBitmapFrameChainWriter*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICBitmapFrameChainWriter*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def append_frame_to_chain(this : IWICBitmapFrameChainWriter*, chainType : Win32cr::Graphics::Imaging::WICBitmapChainType, ppIFrameEncode : Void**, ppIEncoderOptions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.append_frame_to_chain.call(this, chainType, ppIFrameEncode, ppIEncoderOptions)
    end
    def does_support_chain_type(this : IWICBitmapFrameChainWriter*, chainType : Win32cr::Graphics::Imaging::WICBitmapChainType, pfIsSupported : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.does_support_chain_type.call(this, chainType, pfIsSupported)
    end

  end

  @[Extern]

  record IWICProgressiveLevelControlVtable,
    query_interface : Proc(IWICProgressiveLevelControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICProgressiveLevelControl*, UInt32),
    release : Proc(IWICProgressiveLevelControl*, UInt32),
    get_level_count : Proc(IWICProgressiveLevelControl*, UInt32*, Win32cr::Foundation::HRESULT),
    get_current_level : Proc(IWICProgressiveLevelControl*, UInt32*, Win32cr::Foundation::HRESULT),
    set_current_level : Proc(IWICProgressiveLevelControl*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICProgressiveLevelControl, lpVtbl : IWICProgressiveLevelControlVtable* do
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

  record IWICDisplayAdaptationControlVtable,
    query_interface : Proc(IWICDisplayAdaptationControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICDisplayAdaptationControl*, UInt32),
    release : Proc(IWICDisplayAdaptationControl*, UInt32),
    does_support_changing_max_luminance : Proc(IWICDisplayAdaptationControl*, LibC::GUID*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_display_max_luminance : Proc(IWICDisplayAdaptationControl*, Float32, Win32cr::Foundation::HRESULT),
    get_display_max_luminance : Proc(IWICDisplayAdaptationControl*, Float32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICDisplayAdaptationControl, lpVtbl : IWICDisplayAdaptationControlVtable* do
    GUID = LibC::GUID.new(0xde9d91d2_u32, 0x70b4_u16, 0x4f41_u16, StaticArray[0x83_u8, 0x6c_u8, 0x25_u8, 0xfc_u8, 0xd3_u8, 0x96_u8, 0x26_u8, 0xd3_u8])
    def query_interface(this : IWICDisplayAdaptationControl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICDisplayAdaptationControl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICDisplayAdaptationControl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def does_support_changing_max_luminance(this : IWICDisplayAdaptationControl*, pguidDstFormat : LibC::GUID*, pfIsSupported : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.does_support_changing_max_luminance.call(this, pguidDstFormat, pfIsSupported)
    end
    def set_display_max_luminance(this : IWICDisplayAdaptationControl*, fLuminanceInNits : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_display_max_luminance.call(this, fLuminanceInNits)
    end
    def get_display_max_luminance(this : IWICDisplayAdaptationControl*, pfLuminanceInNits : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_max_luminance.call(this, pfLuminanceInNits)
    end

  end

  @[Extern]

  record IWICDisplayAdaptationControl2Vtable,
    query_interface : Proc(IWICDisplayAdaptationControl2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICDisplayAdaptationControl2*, UInt32),
    release : Proc(IWICDisplayAdaptationControl2*, UInt32),
    does_support_changing_max_luminance : Proc(IWICDisplayAdaptationControl2*, LibC::GUID*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_display_max_luminance : Proc(IWICDisplayAdaptationControl2*, Float32, Win32cr::Foundation::HRESULT),
    get_display_max_luminance : Proc(IWICDisplayAdaptationControl2*, Float32*, Win32cr::Foundation::HRESULT),
    set_sdr_white_level : Proc(IWICDisplayAdaptationControl2*, Float32, Win32cr::Foundation::HRESULT),
    get_sdr_white_level : Proc(IWICDisplayAdaptationControl2*, Float32*, Win32cr::Foundation::HRESULT),
    set_tone_mapping_mode : Proc(IWICDisplayAdaptationControl2*, Win32cr::Graphics::Imaging::WICBitmapToneMappingMode, Win32cr::Foundation::HRESULT),
    get_tone_mapping_mode : Proc(IWICDisplayAdaptationControl2*, Win32cr::Graphics::Imaging::WICBitmapToneMappingMode*, Win32cr::Foundation::HRESULT),
    does_support_tone_mapping_mode : Proc(IWICDisplayAdaptationControl2*, Win32cr::Graphics::Imaging::WICBitmapToneMappingMode, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICDisplayAdaptationControl2, lpVtbl : IWICDisplayAdaptationControl2Vtable* do
    GUID = LibC::GUID.new(0xd7508d29_u32, 0x3ab7_u16, 0x447e_u16, StaticArray[0xa6_u8, 0x76_u8, 0x4d_u8, 0x80_u8, 0xd7_u8, 0xde_u8, 0x72_u8, 0x6b_u8])
    def query_interface(this : IWICDisplayAdaptationControl2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICDisplayAdaptationControl2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICDisplayAdaptationControl2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def does_support_changing_max_luminance(this : IWICDisplayAdaptationControl2*, pguidDstFormat : LibC::GUID*, pfIsSupported : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.does_support_changing_max_luminance.call(this, pguidDstFormat, pfIsSupported)
    end
    def set_display_max_luminance(this : IWICDisplayAdaptationControl2*, fLuminanceInNits : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_display_max_luminance.call(this, fLuminanceInNits)
    end
    def get_display_max_luminance(this : IWICDisplayAdaptationControl2*, pfLuminanceInNits : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_max_luminance.call(this, pfLuminanceInNits)
    end
    def set_sdr_white_level(this : IWICDisplayAdaptationControl2*, fWhiteLevelInNits : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_sdr_white_level.call(this, fWhiteLevelInNits)
    end
    def get_sdr_white_level(this : IWICDisplayAdaptationControl2*, pfWhiteLevelInNits : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sdr_white_level.call(this, pfWhiteLevelInNits)
    end
    def set_tone_mapping_mode(this : IWICDisplayAdaptationControl2*, mode : Win32cr::Graphics::Imaging::WICBitmapToneMappingMode) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_tone_mapping_mode.call(this, mode)
    end
    def get_tone_mapping_mode(this : IWICDisplayAdaptationControl2*, mode : Win32cr::Graphics::Imaging::WICBitmapToneMappingMode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_tone_mapping_mode.call(this, mode)
    end
    def does_support_tone_mapping_mode(this : IWICDisplayAdaptationControl2*, mode : Win32cr::Graphics::Imaging::WICBitmapToneMappingMode, pfIsSupported : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.does_support_tone_mapping_mode.call(this, mode, pfIsSupported)
    end

  end

  @[Extern]

  record IWICD3DTextureSourceVtable,
    query_interface : Proc(IWICD3DTextureSource*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICD3DTextureSource*, UInt32),
    release : Proc(IWICD3DTextureSource*, UInt32),
    get_texture : Proc(IWICD3DTextureSource*, Void*, Void*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_transformed_texture : Proc(IWICD3DTextureSource*, Win32cr::Graphics::Imaging::WICRect*, UInt32, UInt32, LibC::GUID*, Win32cr::Graphics::Imaging::WICBitmapTransformOptions, Void*, Void*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    does_support_d3_d_device_type : Proc(IWICD3DTextureSource*, LibC::GUID*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_d3_d_texture_options : Proc(IWICD3DTextureSource*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICD3DTextureSource, lpVtbl : IWICD3DTextureSourceVtable* do
    GUID = LibC::GUID.new(0xcaf65cc4_u32, 0x8ebe_u16, 0x4718_u16, StaticArray[0xa2_u8, 0x1f_u8, 0x8d_u8, 0xbf_u8, 0x40_u8, 0xbb_u8, 0x7e_u8, 0x25_u8])
    def query_interface(this : IWICD3DTextureSource*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICD3DTextureSource*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICD3DTextureSource*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_texture(this : IWICD3DTextureSource*, pD3DDevice : Void*, pID3DTextureOptions : Void*, riid : LibC::GUID*, ppTexture : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_texture.call(this, pD3DDevice, pID3DTextureOptions, riid, ppTexture)
    end
    def get_transformed_texture(this : IWICD3DTextureSource*, prc : Win32cr::Graphics::Imaging::WICRect*, uiWidth : UInt32, uiHeight : UInt32, pguidDstFormat : LibC::GUID*, dstTransform : Win32cr::Graphics::Imaging::WICBitmapTransformOptions, pD3DDevice : Void*, pID3DTextureOptions : Void*, riid : LibC::GUID*, ppTexture : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transformed_texture.call(this, prc, uiWidth, uiHeight, pguidDstFormat, dstTransform, pD3DDevice, pID3DTextureOptions, riid, ppTexture)
    end
    def does_support_d3_d_device_type(this : IWICD3DTextureSource*, riid : LibC::GUID*, pfIsSupported : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.does_support_d3_d_device_type.call(this, riid, pfIsSupported)
    end
    def get_d3_d_texture_options(this : IWICD3DTextureSource*, ppID3DTextureOptions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_d3_d_texture_options.call(this, ppID3DTextureOptions)
    end

  end

  @[Extern]

  record IWICProgressCallbackVtable,
    query_interface : Proc(IWICProgressCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICProgressCallback*, UInt32),
    release : Proc(IWICProgressCallback*, UInt32),
    notify : Proc(IWICProgressCallback*, UInt32, Win32cr::Graphics::Imaging::WICProgressOperation, Float64, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICProgressCallback, lpVtbl : IWICProgressCallbackVtable* do
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

  record IWICBitmapCodecProgressNotificationVtable,
    query_interface : Proc(IWICBitmapCodecProgressNotification*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICBitmapCodecProgressNotification*, UInt32),
    release : Proc(IWICBitmapCodecProgressNotification*, UInt32),
    register_progress_notification : Proc(IWICBitmapCodecProgressNotification*, Win32cr::Graphics::Imaging::PFNProgressNotification, Void*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICBitmapCodecProgressNotification, lpVtbl : IWICBitmapCodecProgressNotificationVtable* do
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

  record IWICComponentInfoVtable,
    query_interface : Proc(IWICComponentInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICComponentInfo*, UInt32),
    release : Proc(IWICComponentInfo*, UInt32),
    get_component_type : Proc(IWICComponentInfo*, Win32cr::Graphics::Imaging::WICComponentType*, Win32cr::Foundation::HRESULT),
    get_clsid : Proc(IWICComponentInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_signing_status : Proc(IWICComponentInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_author : Proc(IWICComponentInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_vendor_guid : Proc(IWICComponentInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_version : Proc(IWICComponentInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_spec_version : Proc(IWICComponentInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_friendly_name : Proc(IWICComponentInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICComponentInfo, lpVtbl : IWICComponentInfoVtable* do
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
    def get_author(this : IWICComponentInfo*, cchAuthor : UInt32, wzAuthor : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_author.call(this, cchAuthor, wzAuthor, pcchActual)
    end
    def get_vendor_guid(this : IWICComponentInfo*, pguidVendor : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_vendor_guid.call(this, pguidVendor)
    end
    def get_version(this : IWICComponentInfo*, cchVersion : UInt32, wzVersion : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version.call(this, cchVersion, wzVersion, pcchActual)
    end
    def get_spec_version(this : IWICComponentInfo*, cchSpecVersion : UInt32, wzSpecVersion : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_spec_version.call(this, cchSpecVersion, wzSpecVersion, pcchActual)
    end
    def get_friendly_name(this : IWICComponentInfo*, cchFriendlyName : UInt32, wzFriendlyName : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_friendly_name.call(this, cchFriendlyName, wzFriendlyName, pcchActual)
    end

  end

  @[Extern]

  record IWICFormatConverterInfoVtable,
    query_interface : Proc(IWICFormatConverterInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICFormatConverterInfo*, UInt32),
    release : Proc(IWICFormatConverterInfo*, UInt32),
    get_component_type : Proc(IWICFormatConverterInfo*, Win32cr::Graphics::Imaging::WICComponentType*, Win32cr::Foundation::HRESULT),
    get_clsid : Proc(IWICFormatConverterInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_signing_status : Proc(IWICFormatConverterInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_author : Proc(IWICFormatConverterInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_vendor_guid : Proc(IWICFormatConverterInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_version : Proc(IWICFormatConverterInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_spec_version : Proc(IWICFormatConverterInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_friendly_name : Proc(IWICFormatConverterInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_pixel_formats : Proc(IWICFormatConverterInfo*, UInt32, LibC::GUID*, UInt32*, Win32cr::Foundation::HRESULT),
    create_instance : Proc(IWICFormatConverterInfo*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICFormatConverterInfo, lpVtbl : IWICFormatConverterInfoVtable* do
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
    def get_author(this : IWICFormatConverterInfo*, cchAuthor : UInt32, wzAuthor : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_author.call(this, cchAuthor, wzAuthor, pcchActual)
    end
    def get_vendor_guid(this : IWICFormatConverterInfo*, pguidVendor : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_vendor_guid.call(this, pguidVendor)
    end
    def get_version(this : IWICFormatConverterInfo*, cchVersion : UInt32, wzVersion : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version.call(this, cchVersion, wzVersion, pcchActual)
    end
    def get_spec_version(this : IWICFormatConverterInfo*, cchSpecVersion : UInt32, wzSpecVersion : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_spec_version.call(this, cchSpecVersion, wzSpecVersion, pcchActual)
    end
    def get_friendly_name(this : IWICFormatConverterInfo*, cchFriendlyName : UInt32, wzFriendlyName : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
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

  record IWICBitmapCodecInfoVtable,
    query_interface : Proc(IWICBitmapCodecInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICBitmapCodecInfo*, UInt32),
    release : Proc(IWICBitmapCodecInfo*, UInt32),
    get_component_type : Proc(IWICBitmapCodecInfo*, Win32cr::Graphics::Imaging::WICComponentType*, Win32cr::Foundation::HRESULT),
    get_clsid : Proc(IWICBitmapCodecInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_signing_status : Proc(IWICBitmapCodecInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_author : Proc(IWICBitmapCodecInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_vendor_guid : Proc(IWICBitmapCodecInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_version : Proc(IWICBitmapCodecInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_spec_version : Proc(IWICBitmapCodecInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_friendly_name : Proc(IWICBitmapCodecInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_container_format : Proc(IWICBitmapCodecInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_pixel_formats : Proc(IWICBitmapCodecInfo*, UInt32, LibC::GUID*, UInt32*, Win32cr::Foundation::HRESULT),
    get_color_management_version : Proc(IWICBitmapCodecInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_device_manufacturer : Proc(IWICBitmapCodecInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_device_models : Proc(IWICBitmapCodecInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_mime_types : Proc(IWICBitmapCodecInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_file_extensions : Proc(IWICBitmapCodecInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    does_support_animation : Proc(IWICBitmapCodecInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    does_support_chromakey : Proc(IWICBitmapCodecInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    does_support_lossless : Proc(IWICBitmapCodecInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    does_support_multiframe : Proc(IWICBitmapCodecInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    matches_mime_type : Proc(IWICBitmapCodecInfo*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICBitmapCodecInfo, lpVtbl : IWICBitmapCodecInfoVtable* do
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
    def get_author(this : IWICBitmapCodecInfo*, cchAuthor : UInt32, wzAuthor : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_author.call(this, cchAuthor, wzAuthor, pcchActual)
    end
    def get_vendor_guid(this : IWICBitmapCodecInfo*, pguidVendor : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_vendor_guid.call(this, pguidVendor)
    end
    def get_version(this : IWICBitmapCodecInfo*, cchVersion : UInt32, wzVersion : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version.call(this, cchVersion, wzVersion, pcchActual)
    end
    def get_spec_version(this : IWICBitmapCodecInfo*, cchSpecVersion : UInt32, wzSpecVersion : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_spec_version.call(this, cchSpecVersion, wzSpecVersion, pcchActual)
    end
    def get_friendly_name(this : IWICBitmapCodecInfo*, cchFriendlyName : UInt32, wzFriendlyName : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_friendly_name.call(this, cchFriendlyName, wzFriendlyName, pcchActual)
    end
    def get_container_format(this : IWICBitmapCodecInfo*, pguidContainerFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_container_format.call(this, pguidContainerFormat)
    end
    def get_pixel_formats(this : IWICBitmapCodecInfo*, cFormats : UInt32, pguidPixelFormats : LibC::GUID*, pcActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pixel_formats.call(this, cFormats, pguidPixelFormats, pcActual)
    end
    def get_color_management_version(this : IWICBitmapCodecInfo*, cchColorManagementVersion : UInt32, wzColorManagementVersion : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_color_management_version.call(this, cchColorManagementVersion, wzColorManagementVersion, pcchActual)
    end
    def get_device_manufacturer(this : IWICBitmapCodecInfo*, cchDeviceManufacturer : UInt32, wzDeviceManufacturer : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_manufacturer.call(this, cchDeviceManufacturer, wzDeviceManufacturer, pcchActual)
    end
    def get_device_models(this : IWICBitmapCodecInfo*, cchDeviceModels : UInt32, wzDeviceModels : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_models.call(this, cchDeviceModels, wzDeviceModels, pcchActual)
    end
    def get_mime_types(this : IWICBitmapCodecInfo*, cchMimeTypes : UInt32, wzMimeTypes : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_mime_types.call(this, cchMimeTypes, wzMimeTypes, pcchActual)
    end
    def get_file_extensions(this : IWICBitmapCodecInfo*, cchFileExtensions : UInt32, wzFileExtensions : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
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

  record IWICBitmapEncoderInfoVtable,
    query_interface : Proc(IWICBitmapEncoderInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICBitmapEncoderInfo*, UInt32),
    release : Proc(IWICBitmapEncoderInfo*, UInt32),
    get_component_type : Proc(IWICBitmapEncoderInfo*, Win32cr::Graphics::Imaging::WICComponentType*, Win32cr::Foundation::HRESULT),
    get_clsid : Proc(IWICBitmapEncoderInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_signing_status : Proc(IWICBitmapEncoderInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_author : Proc(IWICBitmapEncoderInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_vendor_guid : Proc(IWICBitmapEncoderInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_version : Proc(IWICBitmapEncoderInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_spec_version : Proc(IWICBitmapEncoderInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_friendly_name : Proc(IWICBitmapEncoderInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_container_format : Proc(IWICBitmapEncoderInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_pixel_formats : Proc(IWICBitmapEncoderInfo*, UInt32, LibC::GUID*, UInt32*, Win32cr::Foundation::HRESULT),
    get_color_management_version : Proc(IWICBitmapEncoderInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_device_manufacturer : Proc(IWICBitmapEncoderInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_device_models : Proc(IWICBitmapEncoderInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_mime_types : Proc(IWICBitmapEncoderInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_file_extensions : Proc(IWICBitmapEncoderInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    does_support_animation : Proc(IWICBitmapEncoderInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    does_support_chromakey : Proc(IWICBitmapEncoderInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    does_support_lossless : Proc(IWICBitmapEncoderInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    does_support_multiframe : Proc(IWICBitmapEncoderInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    matches_mime_type : Proc(IWICBitmapEncoderInfo*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    create_instance : Proc(IWICBitmapEncoderInfo*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICBitmapEncoderInfo, lpVtbl : IWICBitmapEncoderInfoVtable* do
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
    def get_author(this : IWICBitmapEncoderInfo*, cchAuthor : UInt32, wzAuthor : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_author.call(this, cchAuthor, wzAuthor, pcchActual)
    end
    def get_vendor_guid(this : IWICBitmapEncoderInfo*, pguidVendor : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_vendor_guid.call(this, pguidVendor)
    end
    def get_version(this : IWICBitmapEncoderInfo*, cchVersion : UInt32, wzVersion : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version.call(this, cchVersion, wzVersion, pcchActual)
    end
    def get_spec_version(this : IWICBitmapEncoderInfo*, cchSpecVersion : UInt32, wzSpecVersion : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_spec_version.call(this, cchSpecVersion, wzSpecVersion, pcchActual)
    end
    def get_friendly_name(this : IWICBitmapEncoderInfo*, cchFriendlyName : UInt32, wzFriendlyName : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_friendly_name.call(this, cchFriendlyName, wzFriendlyName, pcchActual)
    end
    def get_container_format(this : IWICBitmapEncoderInfo*, pguidContainerFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_container_format.call(this, pguidContainerFormat)
    end
    def get_pixel_formats(this : IWICBitmapEncoderInfo*, cFormats : UInt32, pguidPixelFormats : LibC::GUID*, pcActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pixel_formats.call(this, cFormats, pguidPixelFormats, pcActual)
    end
    def get_color_management_version(this : IWICBitmapEncoderInfo*, cchColorManagementVersion : UInt32, wzColorManagementVersion : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_color_management_version.call(this, cchColorManagementVersion, wzColorManagementVersion, pcchActual)
    end
    def get_device_manufacturer(this : IWICBitmapEncoderInfo*, cchDeviceManufacturer : UInt32, wzDeviceManufacturer : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_manufacturer.call(this, cchDeviceManufacturer, wzDeviceManufacturer, pcchActual)
    end
    def get_device_models(this : IWICBitmapEncoderInfo*, cchDeviceModels : UInt32, wzDeviceModels : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_models.call(this, cchDeviceModels, wzDeviceModels, pcchActual)
    end
    def get_mime_types(this : IWICBitmapEncoderInfo*, cchMimeTypes : UInt32, wzMimeTypes : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_mime_types.call(this, cchMimeTypes, wzMimeTypes, pcchActual)
    end
    def get_file_extensions(this : IWICBitmapEncoderInfo*, cchFileExtensions : UInt32, wzFileExtensions : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
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

  record IWICBitmapDecoderInfoVtable,
    query_interface : Proc(IWICBitmapDecoderInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICBitmapDecoderInfo*, UInt32),
    release : Proc(IWICBitmapDecoderInfo*, UInt32),
    get_component_type : Proc(IWICBitmapDecoderInfo*, Win32cr::Graphics::Imaging::WICComponentType*, Win32cr::Foundation::HRESULT),
    get_clsid : Proc(IWICBitmapDecoderInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_signing_status : Proc(IWICBitmapDecoderInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_author : Proc(IWICBitmapDecoderInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_vendor_guid : Proc(IWICBitmapDecoderInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_version : Proc(IWICBitmapDecoderInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_spec_version : Proc(IWICBitmapDecoderInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_friendly_name : Proc(IWICBitmapDecoderInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_container_format : Proc(IWICBitmapDecoderInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_pixel_formats : Proc(IWICBitmapDecoderInfo*, UInt32, LibC::GUID*, UInt32*, Win32cr::Foundation::HRESULT),
    get_color_management_version : Proc(IWICBitmapDecoderInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_device_manufacturer : Proc(IWICBitmapDecoderInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_device_models : Proc(IWICBitmapDecoderInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_mime_types : Proc(IWICBitmapDecoderInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_file_extensions : Proc(IWICBitmapDecoderInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    does_support_animation : Proc(IWICBitmapDecoderInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    does_support_chromakey : Proc(IWICBitmapDecoderInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    does_support_lossless : Proc(IWICBitmapDecoderInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    does_support_multiframe : Proc(IWICBitmapDecoderInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    matches_mime_type : Proc(IWICBitmapDecoderInfo*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_patterns : Proc(IWICBitmapDecoderInfo*, UInt32, Win32cr::Graphics::Imaging::WICBitmapPattern*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    matches_pattern : Proc(IWICBitmapDecoderInfo*, Void*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    create_instance : Proc(IWICBitmapDecoderInfo*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICBitmapDecoderInfo, lpVtbl : IWICBitmapDecoderInfoVtable* do
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
    def get_author(this : IWICBitmapDecoderInfo*, cchAuthor : UInt32, wzAuthor : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_author.call(this, cchAuthor, wzAuthor, pcchActual)
    end
    def get_vendor_guid(this : IWICBitmapDecoderInfo*, pguidVendor : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_vendor_guid.call(this, pguidVendor)
    end
    def get_version(this : IWICBitmapDecoderInfo*, cchVersion : UInt32, wzVersion : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version.call(this, cchVersion, wzVersion, pcchActual)
    end
    def get_spec_version(this : IWICBitmapDecoderInfo*, cchSpecVersion : UInt32, wzSpecVersion : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_spec_version.call(this, cchSpecVersion, wzSpecVersion, pcchActual)
    end
    def get_friendly_name(this : IWICBitmapDecoderInfo*, cchFriendlyName : UInt32, wzFriendlyName : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_friendly_name.call(this, cchFriendlyName, wzFriendlyName, pcchActual)
    end
    def get_container_format(this : IWICBitmapDecoderInfo*, pguidContainerFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_container_format.call(this, pguidContainerFormat)
    end
    def get_pixel_formats(this : IWICBitmapDecoderInfo*, cFormats : UInt32, pguidPixelFormats : LibC::GUID*, pcActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pixel_formats.call(this, cFormats, pguidPixelFormats, pcActual)
    end
    def get_color_management_version(this : IWICBitmapDecoderInfo*, cchColorManagementVersion : UInt32, wzColorManagementVersion : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_color_management_version.call(this, cchColorManagementVersion, wzColorManagementVersion, pcchActual)
    end
    def get_device_manufacturer(this : IWICBitmapDecoderInfo*, cchDeviceManufacturer : UInt32, wzDeviceManufacturer : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_manufacturer.call(this, cchDeviceManufacturer, wzDeviceManufacturer, pcchActual)
    end
    def get_device_models(this : IWICBitmapDecoderInfo*, cchDeviceModels : UInt32, wzDeviceModels : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_models.call(this, cchDeviceModels, wzDeviceModels, pcchActual)
    end
    def get_mime_types(this : IWICBitmapDecoderInfo*, cchMimeTypes : UInt32, wzMimeTypes : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_mime_types.call(this, cchMimeTypes, wzMimeTypes, pcchActual)
    end
    def get_file_extensions(this : IWICBitmapDecoderInfo*, cchFileExtensions : UInt32, wzFileExtensions : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
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

  record IWICPixelFormatInfoVtable,
    query_interface : Proc(IWICPixelFormatInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICPixelFormatInfo*, UInt32),
    release : Proc(IWICPixelFormatInfo*, UInt32),
    get_component_type : Proc(IWICPixelFormatInfo*, Win32cr::Graphics::Imaging::WICComponentType*, Win32cr::Foundation::HRESULT),
    get_clsid : Proc(IWICPixelFormatInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_signing_status : Proc(IWICPixelFormatInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_author : Proc(IWICPixelFormatInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_vendor_guid : Proc(IWICPixelFormatInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_version : Proc(IWICPixelFormatInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_spec_version : Proc(IWICPixelFormatInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_friendly_name : Proc(IWICPixelFormatInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_format_guid : Proc(IWICPixelFormatInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_color_context : Proc(IWICPixelFormatInfo*, Void**, Win32cr::Foundation::HRESULT),
    get_bits_per_pixel : Proc(IWICPixelFormatInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_channel_count : Proc(IWICPixelFormatInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_channel_mask : Proc(IWICPixelFormatInfo*, UInt32, UInt32, UInt8*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICPixelFormatInfo, lpVtbl : IWICPixelFormatInfoVtable* do
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
    def get_author(this : IWICPixelFormatInfo*, cchAuthor : UInt32, wzAuthor : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_author.call(this, cchAuthor, wzAuthor, pcchActual)
    end
    def get_vendor_guid(this : IWICPixelFormatInfo*, pguidVendor : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_vendor_guid.call(this, pguidVendor)
    end
    def get_version(this : IWICPixelFormatInfo*, cchVersion : UInt32, wzVersion : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version.call(this, cchVersion, wzVersion, pcchActual)
    end
    def get_spec_version(this : IWICPixelFormatInfo*, cchSpecVersion : UInt32, wzSpecVersion : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_spec_version.call(this, cchSpecVersion, wzSpecVersion, pcchActual)
    end
    def get_friendly_name(this : IWICPixelFormatInfo*, cchFriendlyName : UInt32, wzFriendlyName : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
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

  record IWICPixelFormatInfo2Vtable,
    query_interface : Proc(IWICPixelFormatInfo2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICPixelFormatInfo2*, UInt32),
    release : Proc(IWICPixelFormatInfo2*, UInt32),
    get_component_type : Proc(IWICPixelFormatInfo2*, Win32cr::Graphics::Imaging::WICComponentType*, Win32cr::Foundation::HRESULT),
    get_clsid : Proc(IWICPixelFormatInfo2*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_signing_status : Proc(IWICPixelFormatInfo2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_author : Proc(IWICPixelFormatInfo2*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_vendor_guid : Proc(IWICPixelFormatInfo2*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_version : Proc(IWICPixelFormatInfo2*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_spec_version : Proc(IWICPixelFormatInfo2*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_friendly_name : Proc(IWICPixelFormatInfo2*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_format_guid : Proc(IWICPixelFormatInfo2*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_color_context : Proc(IWICPixelFormatInfo2*, Void**, Win32cr::Foundation::HRESULT),
    get_bits_per_pixel : Proc(IWICPixelFormatInfo2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_channel_count : Proc(IWICPixelFormatInfo2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_channel_mask : Proc(IWICPixelFormatInfo2*, UInt32, UInt32, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    supports_transparency : Proc(IWICPixelFormatInfo2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_numeric_representation : Proc(IWICPixelFormatInfo2*, Win32cr::Graphics::Imaging::WICPixelFormatNumericRepresentation*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICPixelFormatInfo2, lpVtbl : IWICPixelFormatInfo2Vtable* do
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
    def get_author(this : IWICPixelFormatInfo2*, cchAuthor : UInt32, wzAuthor : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_author.call(this, cchAuthor, wzAuthor, pcchActual)
    end
    def get_vendor_guid(this : IWICPixelFormatInfo2*, pguidVendor : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_vendor_guid.call(this, pguidVendor)
    end
    def get_version(this : IWICPixelFormatInfo2*, cchVersion : UInt32, wzVersion : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version.call(this, cchVersion, wzVersion, pcchActual)
    end
    def get_spec_version(this : IWICPixelFormatInfo2*, cchSpecVersion : UInt32, wzSpecVersion : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_spec_version.call(this, cchSpecVersion, wzSpecVersion, pcchActual)
    end
    def get_friendly_name(this : IWICPixelFormatInfo2*, cchFriendlyName : UInt32, wzFriendlyName : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
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

  record IWICImagingFactoryVtable,
    query_interface : Proc(IWICImagingFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICImagingFactory*, UInt32),
    release : Proc(IWICImagingFactory*, UInt32),
    create_decoder_from_filename : Proc(IWICImagingFactory*, Win32cr::Foundation::PWSTR, LibC::GUID*, Win32cr::Foundation::GENERIC_ACCESS_RIGHTS, Win32cr::Graphics::Imaging::WICDecodeOptions, Void**, Win32cr::Foundation::HRESULT),
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
  record IWICImagingFactory, lpVtbl : IWICImagingFactoryVtable* do
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
    def create_decoder_from_filename(this : IWICImagingFactory*, wzFilename : Win32cr::Foundation::PWSTR, pguidVendor : LibC::GUID*, dwDesiredAccess : Win32cr::Foundation::GENERIC_ACCESS_RIGHTS, metadataOptions : Win32cr::Graphics::Imaging::WICDecodeOptions, ppIDecoder : Void**) : Win32cr::Foundation::HRESULT
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

  record IWICDevelopRawNotificationCallbackVtable,
    query_interface : Proc(IWICDevelopRawNotificationCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICDevelopRawNotificationCallback*, UInt32),
    release : Proc(IWICDevelopRawNotificationCallback*, UInt32),
    notify : Proc(IWICDevelopRawNotificationCallback*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICDevelopRawNotificationCallback, lpVtbl : IWICDevelopRawNotificationCallbackVtable* do
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

  record IWICDevelopRawVtable,
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
  record IWICDevelopRaw, lpVtbl : IWICDevelopRawVtable* do
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

  record IWICDdsDecoderVtable,
    query_interface : Proc(IWICDdsDecoder*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICDdsDecoder*, UInt32),
    release : Proc(IWICDdsDecoder*, UInt32),
    get_parameters : Proc(IWICDdsDecoder*, Win32cr::Graphics::Imaging::WICDdsParameters*, Win32cr::Foundation::HRESULT),
    get_frame : Proc(IWICDdsDecoder*, UInt32, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICDdsDecoder, lpVtbl : IWICDdsDecoderVtable* do
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

  record IWICDdsEncoderVtable,
    query_interface : Proc(IWICDdsEncoder*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICDdsEncoder*, UInt32),
    release : Proc(IWICDdsEncoder*, UInt32),
    set_parameters : Proc(IWICDdsEncoder*, Win32cr::Graphics::Imaging::WICDdsParameters*, Win32cr::Foundation::HRESULT),
    get_parameters : Proc(IWICDdsEncoder*, Win32cr::Graphics::Imaging::WICDdsParameters*, Win32cr::Foundation::HRESULT),
    create_new_frame : Proc(IWICDdsEncoder*, Void**, UInt32*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICDdsEncoder, lpVtbl : IWICDdsEncoderVtable* do
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

  record IWICDdsFrameDecodeVtable,
    query_interface : Proc(IWICDdsFrameDecode*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICDdsFrameDecode*, UInt32),
    release : Proc(IWICDdsFrameDecode*, UInt32),
    get_size_in_blocks : Proc(IWICDdsFrameDecode*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_format_info : Proc(IWICDdsFrameDecode*, Win32cr::Graphics::Imaging::WICDdsFormatInfo*, Win32cr::Foundation::HRESULT),
    copy_blocks : Proc(IWICDdsFrameDecode*, Win32cr::Graphics::Imaging::WICRect*, UInt32, UInt32, UInt8*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICDdsFrameDecode, lpVtbl : IWICDdsFrameDecodeVtable* do
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

  record IWICJpegFrameDecodeVtable,
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
  record IWICJpegFrameDecode, lpVtbl : IWICJpegFrameDecodeVtable* do
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

  record IWICJpegFrameEncodeVtable,
    query_interface : Proc(IWICJpegFrameEncode*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICJpegFrameEncode*, UInt32),
    release : Proc(IWICJpegFrameEncode*, UInt32),
    get_ac_huffman_table : Proc(IWICJpegFrameEncode*, UInt32, UInt32, Win32cr::Graphics::Dxgi::Common::DXGI_JPEG_AC_HUFFMAN_TABLE*, Win32cr::Foundation::HRESULT),
    get_dc_huffman_table : Proc(IWICJpegFrameEncode*, UInt32, UInt32, Win32cr::Graphics::Dxgi::Common::DXGI_JPEG_DC_HUFFMAN_TABLE*, Win32cr::Foundation::HRESULT),
    get_quantization_table : Proc(IWICJpegFrameEncode*, UInt32, UInt32, Win32cr::Graphics::Dxgi::Common::DXGI_JPEG_QUANTIZATION_TABLE*, Win32cr::Foundation::HRESULT),
    write_scan : Proc(IWICJpegFrameEncode*, UInt32, UInt8*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICJpegFrameEncode, lpVtbl : IWICJpegFrameEncodeVtable* do
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

  record IWICMetadataBlockReaderVtable,
    query_interface : Proc(IWICMetadataBlockReader*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICMetadataBlockReader*, UInt32),
    release : Proc(IWICMetadataBlockReader*, UInt32),
    get_container_format : Proc(IWICMetadataBlockReader*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_count : Proc(IWICMetadataBlockReader*, UInt32*, Win32cr::Foundation::HRESULT),
    get_reader_by_index : Proc(IWICMetadataBlockReader*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_enumerator : Proc(IWICMetadataBlockReader*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICMetadataBlockReader, lpVtbl : IWICMetadataBlockReaderVtable* do
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

  record IWICMetadataBlockWriterVtable,
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
  record IWICMetadataBlockWriter, lpVtbl : IWICMetadataBlockWriterVtable* do
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

  record IWICMetadataReaderVtable,
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
  record IWICMetadataReader, lpVtbl : IWICMetadataReaderVtable* do
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

  record IWICMetadataWriterVtable,
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
  record IWICMetadataWriter, lpVtbl : IWICMetadataWriterVtable* do
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

  record IWICStreamProviderVtable,
    query_interface : Proc(IWICStreamProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICStreamProvider*, UInt32),
    release : Proc(IWICStreamProvider*, UInt32),
    get_stream : Proc(IWICStreamProvider*, Void**, Win32cr::Foundation::HRESULT),
    get_persist_options : Proc(IWICStreamProvider*, UInt32*, Win32cr::Foundation::HRESULT),
    get_preferred_vendor_guid : Proc(IWICStreamProvider*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    refresh_stream : Proc(IWICStreamProvider*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICStreamProvider, lpVtbl : IWICStreamProviderVtable* do
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

  record IWICPersistStreamVtable,
    query_interface : Proc(IWICPersistStream*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICPersistStream*, UInt32),
    release : Proc(IWICPersistStream*, UInt32),
    get_class_id : Proc(IWICPersistStream*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    is_dirty : Proc(IWICPersistStream*, Win32cr::Foundation::HRESULT),
    load : Proc(IWICPersistStream*, Void*, Win32cr::Foundation::HRESULT),
    save : Proc(IWICPersistStream*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_size_max : Proc(IWICPersistStream*, UInt64*, Win32cr::Foundation::HRESULT),
    load_ex : Proc(IWICPersistStream*, Void*, LibC::GUID*, UInt32, Win32cr::Foundation::HRESULT),
    save_ex : Proc(IWICPersistStream*, Void*, UInt32, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICPersistStream, lpVtbl : IWICPersistStreamVtable* do
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
    def get_size_max(this : IWICPersistStream*, pcbSize : UInt64*) : Win32cr::Foundation::HRESULT
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

  record IWICMetadataHandlerInfoVtable,
    query_interface : Proc(IWICMetadataHandlerInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICMetadataHandlerInfo*, UInt32),
    release : Proc(IWICMetadataHandlerInfo*, UInt32),
    get_component_type : Proc(IWICMetadataHandlerInfo*, Win32cr::Graphics::Imaging::WICComponentType*, Win32cr::Foundation::HRESULT),
    get_clsid : Proc(IWICMetadataHandlerInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_signing_status : Proc(IWICMetadataHandlerInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_author : Proc(IWICMetadataHandlerInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_vendor_guid : Proc(IWICMetadataHandlerInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_version : Proc(IWICMetadataHandlerInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_spec_version : Proc(IWICMetadataHandlerInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_friendly_name : Proc(IWICMetadataHandlerInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_metadata_format : Proc(IWICMetadataHandlerInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_container_formats : Proc(IWICMetadataHandlerInfo*, UInt32, LibC::GUID*, UInt32*, Win32cr::Foundation::HRESULT),
    get_device_manufacturer : Proc(IWICMetadataHandlerInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_device_models : Proc(IWICMetadataHandlerInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    does_require_full_stream : Proc(IWICMetadataHandlerInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    does_support_padding : Proc(IWICMetadataHandlerInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    does_require_fixed_size : Proc(IWICMetadataHandlerInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICMetadataHandlerInfo, lpVtbl : IWICMetadataHandlerInfoVtable* do
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
    def get_author(this : IWICMetadataHandlerInfo*, cchAuthor : UInt32, wzAuthor : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_author.call(this, cchAuthor, wzAuthor, pcchActual)
    end
    def get_vendor_guid(this : IWICMetadataHandlerInfo*, pguidVendor : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_vendor_guid.call(this, pguidVendor)
    end
    def get_version(this : IWICMetadataHandlerInfo*, cchVersion : UInt32, wzVersion : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version.call(this, cchVersion, wzVersion, pcchActual)
    end
    def get_spec_version(this : IWICMetadataHandlerInfo*, cchSpecVersion : UInt32, wzSpecVersion : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_spec_version.call(this, cchSpecVersion, wzSpecVersion, pcchActual)
    end
    def get_friendly_name(this : IWICMetadataHandlerInfo*, cchFriendlyName : UInt32, wzFriendlyName : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_friendly_name.call(this, cchFriendlyName, wzFriendlyName, pcchActual)
    end
    def get_metadata_format(this : IWICMetadataHandlerInfo*, pguidMetadataFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_metadata_format.call(this, pguidMetadataFormat)
    end
    def get_container_formats(this : IWICMetadataHandlerInfo*, cContainerFormats : UInt32, pguidContainerFormats : LibC::GUID*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_container_formats.call(this, cContainerFormats, pguidContainerFormats, pcchActual)
    end
    def get_device_manufacturer(this : IWICMetadataHandlerInfo*, cchDeviceManufacturer : UInt32, wzDeviceManufacturer : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_manufacturer.call(this, cchDeviceManufacturer, wzDeviceManufacturer, pcchActual)
    end
    def get_device_models(this : IWICMetadataHandlerInfo*, cchDeviceModels : UInt32, wzDeviceModels : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
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

  record IWICMetadataReaderInfoVtable,
    query_interface : Proc(IWICMetadataReaderInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICMetadataReaderInfo*, UInt32),
    release : Proc(IWICMetadataReaderInfo*, UInt32),
    get_component_type : Proc(IWICMetadataReaderInfo*, Win32cr::Graphics::Imaging::WICComponentType*, Win32cr::Foundation::HRESULT),
    get_clsid : Proc(IWICMetadataReaderInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_signing_status : Proc(IWICMetadataReaderInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_author : Proc(IWICMetadataReaderInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_vendor_guid : Proc(IWICMetadataReaderInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_version : Proc(IWICMetadataReaderInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_spec_version : Proc(IWICMetadataReaderInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_friendly_name : Proc(IWICMetadataReaderInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_metadata_format : Proc(IWICMetadataReaderInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_container_formats : Proc(IWICMetadataReaderInfo*, UInt32, LibC::GUID*, UInt32*, Win32cr::Foundation::HRESULT),
    get_device_manufacturer : Proc(IWICMetadataReaderInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_device_models : Proc(IWICMetadataReaderInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    does_require_full_stream : Proc(IWICMetadataReaderInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    does_support_padding : Proc(IWICMetadataReaderInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    does_require_fixed_size : Proc(IWICMetadataReaderInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_patterns : Proc(IWICMetadataReaderInfo*, LibC::GUID*, UInt32, Win32cr::Graphics::Imaging::WICMetadataPattern*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    matches_pattern : Proc(IWICMetadataReaderInfo*, LibC::GUID*, Void*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    create_instance : Proc(IWICMetadataReaderInfo*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICMetadataReaderInfo, lpVtbl : IWICMetadataReaderInfoVtable* do
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
    def get_author(this : IWICMetadataReaderInfo*, cchAuthor : UInt32, wzAuthor : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_author.call(this, cchAuthor, wzAuthor, pcchActual)
    end
    def get_vendor_guid(this : IWICMetadataReaderInfo*, pguidVendor : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_vendor_guid.call(this, pguidVendor)
    end
    def get_version(this : IWICMetadataReaderInfo*, cchVersion : UInt32, wzVersion : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version.call(this, cchVersion, wzVersion, pcchActual)
    end
    def get_spec_version(this : IWICMetadataReaderInfo*, cchSpecVersion : UInt32, wzSpecVersion : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_spec_version.call(this, cchSpecVersion, wzSpecVersion, pcchActual)
    end
    def get_friendly_name(this : IWICMetadataReaderInfo*, cchFriendlyName : UInt32, wzFriendlyName : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_friendly_name.call(this, cchFriendlyName, wzFriendlyName, pcchActual)
    end
    def get_metadata_format(this : IWICMetadataReaderInfo*, pguidMetadataFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_metadata_format.call(this, pguidMetadataFormat)
    end
    def get_container_formats(this : IWICMetadataReaderInfo*, cContainerFormats : UInt32, pguidContainerFormats : LibC::GUID*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_container_formats.call(this, cContainerFormats, pguidContainerFormats, pcchActual)
    end
    def get_device_manufacturer(this : IWICMetadataReaderInfo*, cchDeviceManufacturer : UInt32, wzDeviceManufacturer : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_manufacturer.call(this, cchDeviceManufacturer, wzDeviceManufacturer, pcchActual)
    end
    def get_device_models(this : IWICMetadataReaderInfo*, cchDeviceModels : UInt32, wzDeviceModels : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
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

  record IWICMetadataWriterInfoVtable,
    query_interface : Proc(IWICMetadataWriterInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICMetadataWriterInfo*, UInt32),
    release : Proc(IWICMetadataWriterInfo*, UInt32),
    get_component_type : Proc(IWICMetadataWriterInfo*, Win32cr::Graphics::Imaging::WICComponentType*, Win32cr::Foundation::HRESULT),
    get_clsid : Proc(IWICMetadataWriterInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_signing_status : Proc(IWICMetadataWriterInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_author : Proc(IWICMetadataWriterInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_vendor_guid : Proc(IWICMetadataWriterInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_version : Proc(IWICMetadataWriterInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_spec_version : Proc(IWICMetadataWriterInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_friendly_name : Proc(IWICMetadataWriterInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_metadata_format : Proc(IWICMetadataWriterInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_container_formats : Proc(IWICMetadataWriterInfo*, UInt32, LibC::GUID*, UInt32*, Win32cr::Foundation::HRESULT),
    get_device_manufacturer : Proc(IWICMetadataWriterInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_device_models : Proc(IWICMetadataWriterInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    does_require_full_stream : Proc(IWICMetadataWriterInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    does_support_padding : Proc(IWICMetadataWriterInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    does_require_fixed_size : Proc(IWICMetadataWriterInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_header : Proc(IWICMetadataWriterInfo*, LibC::GUID*, UInt32, Win32cr::Graphics::Imaging::WICMetadataHeader*, UInt32*, Win32cr::Foundation::HRESULT),
    create_instance : Proc(IWICMetadataWriterInfo*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICMetadataWriterInfo, lpVtbl : IWICMetadataWriterInfoVtable* do
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
    def get_author(this : IWICMetadataWriterInfo*, cchAuthor : UInt32, wzAuthor : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_author.call(this, cchAuthor, wzAuthor, pcchActual)
    end
    def get_vendor_guid(this : IWICMetadataWriterInfo*, pguidVendor : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_vendor_guid.call(this, pguidVendor)
    end
    def get_version(this : IWICMetadataWriterInfo*, cchVersion : UInt32, wzVersion : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version.call(this, cchVersion, wzVersion, pcchActual)
    end
    def get_spec_version(this : IWICMetadataWriterInfo*, cchSpecVersion : UInt32, wzSpecVersion : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_spec_version.call(this, cchSpecVersion, wzSpecVersion, pcchActual)
    end
    def get_friendly_name(this : IWICMetadataWriterInfo*, cchFriendlyName : UInt32, wzFriendlyName : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_friendly_name.call(this, cchFriendlyName, wzFriendlyName, pcchActual)
    end
    def get_metadata_format(this : IWICMetadataWriterInfo*, pguidMetadataFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_metadata_format.call(this, pguidMetadataFormat)
    end
    def get_container_formats(this : IWICMetadataWriterInfo*, cContainerFormats : UInt32, pguidContainerFormats : LibC::GUID*, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_container_formats.call(this, cContainerFormats, pguidContainerFormats, pcchActual)
    end
    def get_device_manufacturer(this : IWICMetadataWriterInfo*, cchDeviceManufacturer : UInt32, wzDeviceManufacturer : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_manufacturer.call(this, cchDeviceManufacturer, wzDeviceManufacturer, pcchActual)
    end
    def get_device_models(this : IWICMetadataWriterInfo*, cchDeviceModels : UInt32, wzDeviceModels : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
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

  record IWICComponentFactoryVtable,
    query_interface : Proc(IWICComponentFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICComponentFactory*, UInt32),
    release : Proc(IWICComponentFactory*, UInt32),
    create_decoder_from_filename : Proc(IWICComponentFactory*, Win32cr::Foundation::PWSTR, LibC::GUID*, Win32cr::Foundation::GENERIC_ACCESS_RIGHTS, Win32cr::Graphics::Imaging::WICDecodeOptions, Void**, Win32cr::Foundation::HRESULT),
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
  record IWICComponentFactory, lpVtbl : IWICComponentFactoryVtable* do
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
    def create_decoder_from_filename(this : IWICComponentFactory*, wzFilename : Win32cr::Foundation::PWSTR, pguidVendor : LibC::GUID*, dwDesiredAccess : Win32cr::Foundation::GENERIC_ACCESS_RIGHTS, metadataOptions : Win32cr::Graphics::Imaging::WICDecodeOptions, ppIDecoder : Void**) : Win32cr::Foundation::HRESULT
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

  def wICConvertBitmapSource(dstFormat : LibC::GUID*, pISrc : Void*, ppIDst : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WICConvertBitmapSource(dstFormat, pISrc, ppIDst)
    {% end %}
  end

  def wICCreateBitmapFromSection(width : UInt32, height : UInt32, pixelFormat : LibC::GUID*, hSection : Win32cr::Foundation::HANDLE, stride : UInt32, offset : UInt32, ppIBitmap : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WICCreateBitmapFromSection(width, height, pixelFormat, hSection, stride, offset, ppIBitmap)
    {% end %}
  end

  def wICCreateBitmapFromSectionEx(width : UInt32, height : UInt32, pixelFormat : LibC::GUID*, hSection : Win32cr::Foundation::HANDLE, stride : UInt32, offset : UInt32, desiredAccessLevel : Win32cr::Graphics::Imaging::WICSectionAccessLevel, ppIBitmap : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WICCreateBitmapFromSectionEx(width, height, pixelFormat, hSection, stride, offset, desiredAccessLevel, ppIBitmap)
    {% end %}
  end

  def wICMapGuidToShortName(guid : LibC::GUID*, cchName : UInt32, wzName : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WICMapGuidToShortName(guid, cchName, wzName, pcchActual)
    {% end %}
  end

  def wICMapShortNameToGuid(wzName : Win32cr::Foundation::PWSTR, pguid : LibC::GUID*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WICMapShortNameToGuid(wzName, pguid)
    {% end %}
  end

  def wICMapSchemaToName(guidMetadataFormat : LibC::GUID*, pwzSchema : Win32cr::Foundation::PWSTR, cchName : UInt32, wzName : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WICMapSchemaToName(guidMetadataFormat, pwzSchema, cchName, wzName, pcchActual)
    {% end %}
  end

  def wICMatchMetadataContent(guidContainerFormat : LibC::GUID*, pguidVendor : LibC::GUID*, pIStream : Void*, pguidMetadataFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WICMatchMetadataContent(guidContainerFormat, pguidVendor, pIStream, pguidMetadataFormat)
    {% end %}
  end

  def wICSerializeMetadataContent(guidContainerFormat : LibC::GUID*, pIWriter : Void*, dwPersistOptions : UInt32, pIStream : Void*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WICSerializeMetadataContent(guidContainerFormat, pIWriter, dwPersistOptions, pIStream)
    {% end %}
  end

  def wICGetMetadataContentSize(guidContainerFormat : LibC::GUID*, pIWriter : Void*, pcbSize : UInt64*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WICGetMetadataContentSize(guidContainerFormat, pIWriter, pcbSize)
    {% end %}
  end

  @[Link("windowscodecs")]
  {% if !flag?(:docs) %}
  lib C
    # :nodoc:
    fun WICConvertBitmapSource(dstFormat : LibC::GUID*, pISrc : Void*, ppIDst : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WICCreateBitmapFromSection(width : UInt32, height : UInt32, pixelFormat : LibC::GUID*, hSection : Win32cr::Foundation::HANDLE, stride : UInt32, offset : UInt32, ppIBitmap : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WICCreateBitmapFromSectionEx(width : UInt32, height : UInt32, pixelFormat : LibC::GUID*, hSection : Win32cr::Foundation::HANDLE, stride : UInt32, offset : UInt32, desiredAccessLevel : Win32cr::Graphics::Imaging::WICSectionAccessLevel, ppIBitmap : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WICMapGuidToShortName(guid : LibC::GUID*, cchName : UInt32, wzName : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WICMapShortNameToGuid(wzName : Win32cr::Foundation::PWSTR, pguid : LibC::GUID*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WICMapSchemaToName(guidMetadataFormat : LibC::GUID*, pwzSchema : Win32cr::Foundation::PWSTR, cchName : UInt32, wzName : Win32cr::Foundation::PWSTR, pcchActual : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WICMatchMetadataContent(guidContainerFormat : LibC::GUID*, pguidVendor : LibC::GUID*, pIStream : Void*, pguidMetadataFormat : LibC::GUID*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WICSerializeMetadataContent(guidContainerFormat : LibC::GUID*, pIWriter : Void*, dwPersistOptions : UInt32, pIStream : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WICGetMetadataContentSize(guidContainerFormat : LibC::GUID*, pIWriter : Void*, pcbSize : UInt64*) : Win32cr::Foundation::HRESULT

  end
  {% end %}
end