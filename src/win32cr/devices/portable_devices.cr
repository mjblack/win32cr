require "./../foundation.cr"
require "./../system/com.cr"
require "./../system/com/structured_storage.cr"
require "./../ui/shell/properties_system.cr"
require "./properties.cr"

module Win32cr::Devices::PortableDevices
  extend self
  DEVPKEY_MTPBTH_IsConnected = Win32cr::Foundation::DEVPROPKEY.new(LibC::GUID.new(0xea1237fa_u32, 0x589d_u16, 0x4472_u16, StaticArray[0x84_u8, 0xe4_u8, 0xa_u8, 0xbe_u8, 0x36_u8, 0xfd_u8, 0x62_u8, 0xef_u8]), 2_u32)
  GUID_DEVINTERFACE_WPD = LibC::GUID.new(0x6ac27878_u32, 0xa6fa_u16, 0x4155_u16, StaticArray[0xba_u8, 0x85_u8, 0xf9_u8, 0x8f_u8, 0x49_u8, 0x1d_u8, 0x4f_u8, 0x33_u8])
  GUID_DEVINTERFACE_WPD_PRIVATE = LibC::GUID.new(0xba0c718f_u32, 0x4ded_u16, 0x49b7_u16, StaticArray[0xbd_u8, 0xd3_u8, 0xfa_u8, 0xbe_u8, 0x28_u8, 0x66_u8, 0x12_u8, 0x11_u8])
  GUID_DEVINTERFACE_WPD_SERVICE = LibC::GUID.new(0x9ef44f80_u32, 0x3d64_u16, 0x4246_u16, StaticArray[0xa6_u8, 0xaa_u8, 0x20_u8, 0x6f_u8, 0x32_u8, 0x8d_u8, 0x1e_u8, 0xdc_u8])
  WPD_CONTROL_FUNCTION_GENERIC_MESSAGE = 66_u32
  IOCTL_WPD_MESSAGE_READWRITE_ACCESS = 4243720_u32
  IOCTL_WPD_MESSAGE_READ_ACCESS = 4210952_u32
  WPD_DEVICE_OBJECT_ID = "DEVICE"
  PORTABLE_DEVICE_TYPE = "PortableDeviceType"
  PORTABLE_DEVICE_ICON = "Icons"
  PORTABLE_DEVICE_NAMESPACE_TIMEOUT = "PortableDeviceNameSpaceTimeout"
  PORTABLE_DEVICE_NAMESPACE_EXCLUDE_FROM_SHELL = "PortableDeviceNameSpaceExcludeFromShell"
  PORTABLE_DEVICE_NAMESPACE_THUMBNAIL_CONTENT_TYPES = "PortableDeviceNameSpaceThumbnailContentTypes"
  PORTABLE_DEVICE_IS_MASS_STORAGE = "PortableDeviceIsMassStorage"
  PORTABLE_DEVICE_DRM_SCHEME_WMDRM10_PD = "WMDRM10-PD"
  PORTABLE_DEVICE_DRM_SCHEME_PDDRM = "PDDRM"
  FACILITY_WPD = 42_u32
  E_WPD_DEVICE_ALREADY_OPENED = -2144731135_i32
  E_WPD_DEVICE_NOT_OPEN = -2144731134_i32
  E_WPD_OBJECT_ALREADY_ATTACHED_TO_DEVICE = -2144731133_i32
  E_WPD_OBJECT_NOT_ATTACHED_TO_DEVICE = -2144731132_i32
  E_WPD_OBJECT_NOT_COMMITED = -2144731131_i32
  E_WPD_DEVICE_IS_HUNG = -2144731130_i32
  E_WPD_SMS_INVALID_RECIPIENT = -2144731036_i32
  E_WPD_SMS_INVALID_MESSAGE_BODY = -2144731035_i32
  E_WPD_SMS_SERVICE_UNAVAILABLE = -2144731034_i32
  E_WPD_SERVICE_ALREADY_OPENED = -2144730936_i32
  E_WPD_SERVICE_NOT_OPEN = -2144730935_i32
  E_WPD_OBJECT_ALREADY_ATTACHED_TO_SERVICE = -2144730934_i32
  E_WPD_OBJECT_NOT_ATTACHED_TO_SERVICE = -2144730933_i32
  E_WPD_SERVICE_BAD_PARAMETER_ORDER = -2144730932_i32
  WPD_EVENT_NOTIFICATION = LibC::GUID.new(0x2ba2e40a_u32, 0x6b4c_u16, 0x4295_u16, StaticArray[0xbb_u8, 0x43_u8, 0x26_u8, 0x32_u8, 0x2b_u8, 0x99_u8, 0xae_u8, 0xb2_u8])
  WPD_EVENT_OBJECT_ADDED = LibC::GUID.new(0xa726da95_u32, 0xe207_u16, 0x4b02_u16, StaticArray[0x8d_u8, 0x44_u8, 0xbe_u8, 0xf2_u8, 0xe8_u8, 0x6c_u8, 0xbf_u8, 0xfc_u8])
  WPD_EVENT_OBJECT_REMOVED = LibC::GUID.new(0xbe82ab88_u32, 0xa52c_u16, 0x4823_u16, StaticArray[0x96_u8, 0xe5_u8, 0xd0_u8, 0x27_u8, 0x26_u8, 0x71_u8, 0xfc_u8, 0x38_u8])
  WPD_EVENT_OBJECT_UPDATED = LibC::GUID.new(0x1445a759_u32, 0x2e01_u16, 0x485d_u16, StaticArray[0x9f_u8, 0x27_u8, 0xff_u8, 0x7_u8, 0xda_u8, 0xe6_u8, 0x97_u8, 0xab_u8])
  WPD_EVENT_DEVICE_RESET = LibC::GUID.new(0x7755cf53_u32, 0xc1ed_u16, 0x44f3_u16, StaticArray[0xb5_u8, 0xa2_u8, 0x45_u8, 0x1e_u8, 0x2c_u8, 0x37_u8, 0x6b_u8, 0x27_u8])
  WPD_EVENT_DEVICE_CAPABILITIES_UPDATED = LibC::GUID.new(0x36885aa1_u32, 0xcd54_u16, 0x4daa_u16, StaticArray[0xb3_u8, 0xd0_u8, 0xaf_u8, 0xb3_u8, 0xe0_u8, 0x3f_u8, 0x59_u8, 0x99_u8])
  WPD_EVENT_STORAGE_FORMAT = LibC::GUID.new(0x3782616b_u32, 0x22bc_u16, 0x4474_u16, StaticArray[0xa2_u8, 0x51_u8, 0x30_u8, 0x70_u8, 0xf8_u8, 0xd3_u8, 0x88_u8, 0x57_u8])
  WPD_EVENT_OBJECT_TRANSFER_REQUESTED = LibC::GUID.new(0x8d16a0a1_u32, 0xf2c6_u16, 0x41da_u16, StaticArray[0x8f_u8, 0x19_u8, 0x5e_u8, 0x53_u8, 0x72_u8, 0x1a_u8, 0xdb_u8, 0xf2_u8])
  WPD_EVENT_DEVICE_REMOVED = LibC::GUID.new(0xe4cbca1b_u32, 0x6918_u16, 0x48b9_u16, StaticArray[0x85_u8, 0xee_u8, 0x2_u8, 0xbe_u8, 0x7c_u8, 0x85_u8, 0xa_u8, 0xf9_u8])
  WPD_EVENT_SERVICE_METHOD_COMPLETE = LibC::GUID.new(0x8a33f5f8_u32, 0xacc_u16, 0x4d9b_u16, StaticArray[0x9c_u8, 0xc4_u8, 0x11_u8, 0x2d_u8, 0x35_u8, 0x3b_u8, 0x86_u8, 0xca_u8])
  WPD_CONTENT_TYPE_FUNCTIONAL_OBJECT = LibC::GUID.new(0x99ed0160_u32, 0x17ff_u16, 0x4c44_u16, StaticArray[0x9d_u8, 0x98_u8, 0x1d_u8, 0x7a_u8, 0x6f_u8, 0x94_u8, 0x19_u8, 0x21_u8])
  WPD_CONTENT_TYPE_FOLDER = LibC::GUID.new(0x27e2e392_u32, 0xa111_u16, 0x48e0_u16, StaticArray[0xab_u8, 0xc_u8, 0xe1_u8, 0x77_u8, 0x5_u8, 0xa0_u8, 0x5f_u8, 0x85_u8])
  WPD_CONTENT_TYPE_IMAGE = LibC::GUID.new(0xef2107d5_u32, 0xa52a_u16, 0x4243_u16, StaticArray[0xa2_u8, 0x6b_u8, 0x62_u8, 0xd4_u8, 0x17_u8, 0x6d_u8, 0x76_u8, 0x3_u8])
  WPD_CONTENT_TYPE_DOCUMENT = LibC::GUID.new(0x680adf52_u32, 0x950a_u16, 0x4041_u16, StaticArray[0x9b_u8, 0x41_u8, 0x65_u8, 0xe3_u8, 0x93_u8, 0x64_u8, 0x81_u8, 0x55_u8])
  WPD_CONTENT_TYPE_CONTACT = LibC::GUID.new(0xeaba8313_u32, 0x4525_u16, 0x4707_u16, StaticArray[0x9f_u8, 0xe_u8, 0x87_u8, 0xc6_u8, 0x80_u8, 0x8e_u8, 0x94_u8, 0x35_u8])
  WPD_CONTENT_TYPE_CONTACT_GROUP = LibC::GUID.new(0x346b8932_u32, 0x4c36_u16, 0x40d8_u16, StaticArray[0x94_u8, 0x15_u8, 0x18_u8, 0x28_u8, 0x29_u8, 0x1f_u8, 0x9d_u8, 0xe9_u8])
  WPD_CONTENT_TYPE_AUDIO = LibC::GUID.new(0x4ad2c85e_u32, 0x5e2d_u16, 0x45e5_u16, StaticArray[0x88_u8, 0x64_u8, 0x4f_u8, 0x22_u8, 0x9e_u8, 0x3c_u8, 0x6c_u8, 0xf0_u8])
  WPD_CONTENT_TYPE_VIDEO = LibC::GUID.new(0x9261b03c_u32, 0x3d78_u16, 0x4519_u16, StaticArray[0x85_u8, 0xe3_u8, 0x2_u8, 0xc5_u8, 0xe1_u8, 0xf5_u8, 0xb_u8, 0xb9_u8])
  WPD_CONTENT_TYPE_TELEVISION = LibC::GUID.new(0x60a169cf_u32, 0xf2ae_u16, 0x4e21_u16, StaticArray[0x93_u8, 0x75_u8, 0x96_u8, 0x77_u8, 0xf1_u8, 0x1c_u8, 0x1c_u8, 0x6e_u8])
  WPD_CONTENT_TYPE_PLAYLIST = LibC::GUID.new(0x1a33f7e4_u32, 0xaf13_u16, 0x48f5_u16, StaticArray[0x99_u8, 0x4e_u8, 0x77_u8, 0x36_u8, 0x9d_u8, 0xfe_u8, 0x4_u8, 0xa3_u8])
  WPD_CONTENT_TYPE_MIXED_CONTENT_ALBUM = LibC::GUID.new(0xf0c3ac_u32, 0xa593_u16, 0x49ac_u16, StaticArray[0x92_u8, 0x19_u8, 0x24_u8, 0xab_u8, 0xca_u8, 0x5a_u8, 0x25_u8, 0x63_u8])
  WPD_CONTENT_TYPE_AUDIO_ALBUM = LibC::GUID.new(0xaa18737e_u32, 0x5009_u16, 0x48fa_u16, StaticArray[0xae_u8, 0x21_u8, 0x85_u8, 0xf2_u8, 0x43_u8, 0x83_u8, 0xb4_u8, 0xe6_u8])
  WPD_CONTENT_TYPE_IMAGE_ALBUM = LibC::GUID.new(0x75793148_u32, 0x15f5_u16, 0x4a30_u16, StaticArray[0xa8_u8, 0x13_u8, 0x54_u8, 0xed_u8, 0x8a_u8, 0x37_u8, 0xe2_u8, 0x26_u8])
  WPD_CONTENT_TYPE_VIDEO_ALBUM = LibC::GUID.new(0x12b0db7_u32, 0xd4c1_u16, 0x45d6_u16, StaticArray[0xb0_u8, 0x81_u8, 0x94_u8, 0xb8_u8, 0x77_u8, 0x79_u8, 0x61_u8, 0x4f_u8])
  WPD_CONTENT_TYPE_MEMO = LibC::GUID.new(0x9cd20ecf_u32, 0x3b50_u16, 0x414f_u16, StaticArray[0xa6_u8, 0x41_u8, 0xe4_u8, 0x73_u8, 0xff_u8, 0xe4_u8, 0x57_u8, 0x51_u8])
  WPD_CONTENT_TYPE_EMAIL = LibC::GUID.new(0x8038044a_u32, 0x7e51_u16, 0x4f8f_u16, StaticArray[0x88_u8, 0x3d_u8, 0x1d_u8, 0x6_u8, 0x23_u8, 0xd1_u8, 0x45_u8, 0x33_u8])
  WPD_CONTENT_TYPE_APPOINTMENT = LibC::GUID.new(0xfed060e_u32, 0x8793_u16, 0x4b1e_u16, StaticArray[0x90_u8, 0xc9_u8, 0x48_u8, 0xac_u8, 0x38_u8, 0x9a_u8, 0xc6_u8, 0x31_u8])
  WPD_CONTENT_TYPE_TASK = LibC::GUID.new(0x63252f2c_u32, 0x887f_u16, 0x4cb6_u16, StaticArray[0xb1_u8, 0xac_u8, 0xd2_u8, 0x98_u8, 0x55_u8, 0xdc_u8, 0xef_u8, 0x6c_u8])
  WPD_CONTENT_TYPE_PROGRAM = LibC::GUID.new(0xd269f96a_u32, 0x247c_u16, 0x4bff_u16, StaticArray[0x98_u8, 0xfb_u8, 0x97_u8, 0xf3_u8, 0xc4_u8, 0x92_u8, 0x20_u8, 0xe6_u8])
  WPD_CONTENT_TYPE_GENERIC_FILE = LibC::GUID.new(0x85e0a6_u32, 0x8d34_u16, 0x45d7_u16, StaticArray[0xbc_u8, 0x5c_u8, 0x44_u8, 0x7e_u8, 0x59_u8, 0xc7_u8, 0x3d_u8, 0x48_u8])
  WPD_CONTENT_TYPE_CALENDAR = LibC::GUID.new(0xa1fd5967_u32, 0x6023_u16, 0x49a0_u16, StaticArray[0x9d_u8, 0xf1_u8, 0xf8_u8, 0x6_u8, 0xb_u8, 0xe7_u8, 0x51_u8, 0xb0_u8])
  WPD_CONTENT_TYPE_GENERIC_MESSAGE = LibC::GUID.new(0xe80eaaf8_u32, 0xb2db_u16, 0x4133_u16, StaticArray[0xb6_u8, 0x7e_u8, 0x1b_u8, 0xef_u8, 0x4b_u8, 0x4a_u8, 0x6e_u8, 0x5f_u8])
  WPD_CONTENT_TYPE_NETWORK_ASSOCIATION = LibC::GUID.new(0x31da7ee_u32, 0x18c8_u16, 0x4205_u16, StaticArray[0x84_u8, 0x7e_u8, 0x89_u8, 0xa1_u8, 0x12_u8, 0x61_u8, 0xd0_u8, 0xf3_u8])
  WPD_CONTENT_TYPE_CERTIFICATE = LibC::GUID.new(0xdc3876e8_u32, 0xa948_u16, 0x4060_u16, StaticArray[0x90_u8, 0x50_u8, 0xcb_u8, 0xd7_u8, 0x7e_u8, 0x8a_u8, 0x3d_u8, 0x87_u8])
  WPD_CONTENT_TYPE_WIRELESS_PROFILE = LibC::GUID.new(0xbac070a_u32, 0x9f5f_u16, 0x4da4_u16, StaticArray[0xa8_u8, 0xf6_u8, 0x3d_u8, 0xe4_u8, 0x4d_u8, 0x68_u8, 0xfd_u8, 0x6c_u8])
  WPD_CONTENT_TYPE_MEDIA_CAST = LibC::GUID.new(0x5e88b3cc_u32, 0x3e65_u16, 0x4e62_u16, StaticArray[0xbf_u8, 0xff_u8, 0x22_u8, 0x94_u8, 0x95_u8, 0x25_u8, 0x3a_u8, 0xb0_u8])
  WPD_CONTENT_TYPE_SECTION = LibC::GUID.new(0x821089f5_u32, 0x1d91_u16, 0x4dc9_u16, StaticArray[0xbe_u8, 0x3c_u8, 0xbb_u8, 0xb1_u8, 0xb3_u8, 0x5b_u8, 0x18_u8, 0xce_u8])
  WPD_CONTENT_TYPE_UNSPECIFIED = LibC::GUID.new(0x28d8d31e_u32, 0x249c_u16, 0x454e_u16, StaticArray[0xaa_u8, 0xbc_u8, 0x34_u8, 0x88_u8, 0x31_u8, 0x68_u8, 0xe6_u8, 0x34_u8])
  WPD_CONTENT_TYPE_ALL = LibC::GUID.new(0x80e170d2_u32, 0x1055_u16, 0x4a3e_u16, StaticArray[0xb9_u8, 0x52_u8, 0x82_u8, 0xcc_u8, 0x4f_u8, 0x8a_u8, 0x86_u8, 0x89_u8])
  WPD_FUNCTIONAL_CATEGORY_DEVICE = LibC::GUID.new(0x8ea466b_u32, 0xe3a4_u16, 0x4336_u16, StaticArray[0xa1_u8, 0xf3_u8, 0xa4_u8, 0x4d_u8, 0x2b_u8, 0x5c_u8, 0x43_u8, 0x8c_u8])
  WPD_FUNCTIONAL_CATEGORY_STORAGE = LibC::GUID.new(0x23f05bbc_u32, 0x15de_u16, 0x4c2a_u16, StaticArray[0xa5_u8, 0x5b_u8, 0xa9_u8, 0xaf_u8, 0x5c_u8, 0xe4_u8, 0x12_u8, 0xef_u8])
  WPD_FUNCTIONAL_CATEGORY_STILL_IMAGE_CAPTURE = LibC::GUID.new(0x613ca327_u32, 0xab93_u16, 0x4900_u16, StaticArray[0xb4_u8, 0xfa_u8, 0x89_u8, 0x5b_u8, 0xb5_u8, 0x87_u8, 0x4b_u8, 0x79_u8])
  WPD_FUNCTIONAL_CATEGORY_AUDIO_CAPTURE = LibC::GUID.new(0x3f2a1919_u32, 0xc7c2_u16, 0x4a00_u16, StaticArray[0x85_u8, 0x5d_u8, 0xf5_u8, 0x7c_u8, 0xf0_u8, 0x6d_u8, 0xeb_u8, 0xbb_u8])
  WPD_FUNCTIONAL_CATEGORY_VIDEO_CAPTURE = LibC::GUID.new(0xe23e5f6b_u32, 0x7243_u16, 0x43aa_u16, StaticArray[0x8d_u8, 0xf1_u8, 0xe_u8, 0xb3_u8, 0xd9_u8, 0x68_u8, 0xa9_u8, 0x18_u8])
  WPD_FUNCTIONAL_CATEGORY_SMS = LibC::GUID.new(0x44a0b1_u32, 0xc1e9_u16, 0x4afd_u16, StaticArray[0xb3_u8, 0x58_u8, 0xa6_u8, 0x2c_u8, 0x61_u8, 0x17_u8, 0xc9_u8, 0xcf_u8])
  WPD_FUNCTIONAL_CATEGORY_RENDERING_INFORMATION = LibC::GUID.new(0x8600ba4_u32, 0xa7ba_u16, 0x4a01_u16, StaticArray[0xab_u8, 0xe_u8, 0x0_u8, 0x65_u8, 0xd0_u8, 0xa3_u8, 0x56_u8, 0xd3_u8])
  WPD_FUNCTIONAL_CATEGORY_NETWORK_CONFIGURATION = LibC::GUID.new(0x48f4db72_u32, 0x7c6a_u16, 0x4ab0_u16, StaticArray[0x9e_u8, 0x1a_u8, 0x47_u8, 0xe_u8, 0x3c_u8, 0xdb_u8, 0xf2_u8, 0x6a_u8])
  WPD_FUNCTIONAL_CATEGORY_ALL = LibC::GUID.new(0x2d8a6512_u32, 0xa74c_u16, 0x448e_u16, StaticArray[0xba_u8, 0x8a_u8, 0xf4_u8, 0xac_u8, 0x7_u8, 0xc4_u8, 0x93_u8, 0x99_u8])
  WPD_OBJECT_FORMAT_ICON = LibC::GUID.new(0x77232ed_u32, 0x102c_u16, 0x4638_u16, StaticArray[0x9c_u8, 0x22_u8, 0x83_u8, 0xf1_u8, 0x42_u8, 0xbf_u8, 0xc8_u8, 0x22_u8])
  WPD_OBJECT_FORMAT_M4A = LibC::GUID.new(0x30aba7ac_u32, 0x6ffd_u16, 0x4c23_u16, StaticArray[0xa3_u8, 0x59_u8, 0x3e_u8, 0x9b_u8, 0x52_u8, 0xf3_u8, 0xf1_u8, 0xc8_u8])
  WPD_OBJECT_FORMAT_NETWORK_ASSOCIATION = LibC::GUID.new(0xb1020000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_X509V3CERTIFICATE = LibC::GUID.new(0xb1030000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_MICROSOFT_WFC = LibC::GUID.new(0xb1040000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_3GPA = LibC::GUID.new(0xe5172730_u32, 0xf971_u16, 0x41ef_u16, StaticArray[0xa1_u8, 0xb_u8, 0x22_u8, 0x71_u8, 0xa0_u8, 0x1_u8, 0x9d_u8, 0x7a_u8])
  WPD_OBJECT_FORMAT_3G2A = LibC::GUID.new(0x1a11202d_u32, 0x8759_u16, 0x4e34_u16, StaticArray[0xba_u8, 0x5e_u8, 0xb1_u8, 0x21_u8, 0x10_u8, 0x87_u8, 0xee_u8, 0xe4_u8])
  WPD_OBJECT_FORMAT_ALL = LibC::GUID.new(0xc1f62eb2_u32, 0x4bb3_u16, 0x479c_u16, StaticArray[0x9c_u8, 0xfa_u8, 0x5_u8, 0xb5_u8, 0xf3_u8, 0xa5_u8, 0x7b_u8, 0x22_u8])
  WPD_CATEGORY_NULL = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
  WPD_PROPERTY_NULL = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8]), 0_u32)
  WPD_OBJECT_PROPERTIES_V1 = LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8])
  WPD_OBJECT_CONTENT_TYPE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 7_u32)
  WPD_OBJECT_REFERENCES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 14_u32)
  WPD_OBJECT_CONTAINER_FUNCTIONAL_OBJECT_ID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 23_u32)
  WPD_OBJECT_GENERATE_THUMBNAIL_FROM_RESOURCE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 24_u32)
  WPD_OBJECT_HINT_LOCATION_DISPLAY_NAME = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 25_u32)
  WPD_OBJECT_PROPERTIES_V2 = LibC::GUID.new(0x373cd3d_u32, 0x4a46_u16, 0x40d7_u16, StaticArray[0xb4_u8, 0xd8_u8, 0x73_u8, 0xe8_u8, 0xda_u8, 0x74_u8, 0xe7_u8, 0x75_u8])
  WPD_OBJECT_SUPPORTED_UNITS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x373cd3d_u32, 0x4a46_u16, 0x40d7_u16, StaticArray[0xb4_u8, 0xd8_u8, 0x73_u8, 0xe8_u8, 0xda_u8, 0x74_u8, 0xe7_u8, 0x75_u8]), 2_u32)
  WPD_FUNCTIONAL_OBJECT_PROPERTIES_V1 = LibC::GUID.new(0x8f052d93_u32, 0xabca_u16, 0x4fc5_u16, StaticArray[0xa5_u8, 0xac_u8, 0xb0_u8, 0x1d_u8, 0xf4_u8, 0xdb_u8, 0xe5_u8, 0x98_u8])
  WPD_FUNCTIONAL_OBJECT_CATEGORY = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x8f052d93_u32, 0xabca_u16, 0x4fc5_u16, StaticArray[0xa5_u8, 0xac_u8, 0xb0_u8, 0x1d_u8, 0xf4_u8, 0xdb_u8, 0xe5_u8, 0x98_u8]), 2_u32)
  WPD_STORAGE_OBJECT_PROPERTIES_V1 = LibC::GUID.new(0x1a3057a_u32, 0x74d6_u16, 0x4e80_u16, StaticArray[0xbe_u8, 0xa7_u8, 0xdc_u8, 0x4c_u8, 0x21_u8, 0x2c_u8, 0xe5_u8, 0xa_u8])
  WPD_STORAGE_TYPE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1a3057a_u32, 0x74d6_u16, 0x4e80_u16, StaticArray[0xbe_u8, 0xa7_u8, 0xdc_u8, 0x4c_u8, 0x21_u8, 0x2c_u8, 0xe5_u8, 0xa_u8]), 2_u32)
  WPD_STORAGE_FILE_SYSTEM_TYPE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1a3057a_u32, 0x74d6_u16, 0x4e80_u16, StaticArray[0xbe_u8, 0xa7_u8, 0xdc_u8, 0x4c_u8, 0x21_u8, 0x2c_u8, 0xe5_u8, 0xa_u8]), 3_u32)
  WPD_STORAGE_CAPACITY = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1a3057a_u32, 0x74d6_u16, 0x4e80_u16, StaticArray[0xbe_u8, 0xa7_u8, 0xdc_u8, 0x4c_u8, 0x21_u8, 0x2c_u8, 0xe5_u8, 0xa_u8]), 4_u32)
  WPD_STORAGE_FREE_SPACE_IN_BYTES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1a3057a_u32, 0x74d6_u16, 0x4e80_u16, StaticArray[0xbe_u8, 0xa7_u8, 0xdc_u8, 0x4c_u8, 0x21_u8, 0x2c_u8, 0xe5_u8, 0xa_u8]), 5_u32)
  WPD_STORAGE_FREE_SPACE_IN_OBJECTS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1a3057a_u32, 0x74d6_u16, 0x4e80_u16, StaticArray[0xbe_u8, 0xa7_u8, 0xdc_u8, 0x4c_u8, 0x21_u8, 0x2c_u8, 0xe5_u8, 0xa_u8]), 6_u32)
  WPD_STORAGE_DESCRIPTION = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1a3057a_u32, 0x74d6_u16, 0x4e80_u16, StaticArray[0xbe_u8, 0xa7_u8, 0xdc_u8, 0x4c_u8, 0x21_u8, 0x2c_u8, 0xe5_u8, 0xa_u8]), 7_u32)
  WPD_STORAGE_SERIAL_NUMBER = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1a3057a_u32, 0x74d6_u16, 0x4e80_u16, StaticArray[0xbe_u8, 0xa7_u8, 0xdc_u8, 0x4c_u8, 0x21_u8, 0x2c_u8, 0xe5_u8, 0xa_u8]), 8_u32)
  WPD_STORAGE_MAX_OBJECT_SIZE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1a3057a_u32, 0x74d6_u16, 0x4e80_u16, StaticArray[0xbe_u8, 0xa7_u8, 0xdc_u8, 0x4c_u8, 0x21_u8, 0x2c_u8, 0xe5_u8, 0xa_u8]), 9_u32)
  WPD_STORAGE_CAPACITY_IN_OBJECTS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1a3057a_u32, 0x74d6_u16, 0x4e80_u16, StaticArray[0xbe_u8, 0xa7_u8, 0xdc_u8, 0x4c_u8, 0x21_u8, 0x2c_u8, 0xe5_u8, 0xa_u8]), 10_u32)
  WPD_STORAGE_ACCESS_CAPABILITY = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1a3057a_u32, 0x74d6_u16, 0x4e80_u16, StaticArray[0xbe_u8, 0xa7_u8, 0xdc_u8, 0x4c_u8, 0x21_u8, 0x2c_u8, 0xe5_u8, 0xa_u8]), 11_u32)
  WPD_NETWORK_ASSOCIATION_PROPERTIES_V1 = LibC::GUID.new(0xe4c93c1f_u32, 0xb203_u16, 0x43f1_u16, StaticArray[0xa1_u8, 0x0_u8, 0x5a_u8, 0x7_u8, 0xd1_u8, 0x1b_u8, 0x2_u8, 0x74_u8])
  WPD_NETWORK_ASSOCIATION_HOST_NETWORK_IDENTIFIERS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe4c93c1f_u32, 0xb203_u16, 0x43f1_u16, StaticArray[0xa1_u8, 0x0_u8, 0x5a_u8, 0x7_u8, 0xd1_u8, 0x1b_u8, 0x2_u8, 0x74_u8]), 2_u32)
  WPD_NETWORK_ASSOCIATION_X509V3SEQUENCE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe4c93c1f_u32, 0xb203_u16, 0x43f1_u16, StaticArray[0xa1_u8, 0x0_u8, 0x5a_u8, 0x7_u8, 0xd1_u8, 0x1b_u8, 0x2_u8, 0x74_u8]), 3_u32)
  WPD_STILL_IMAGE_CAPTURE_OBJECT_PROPERTIES_V1 = LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8])
  WPD_STILL_IMAGE_CAPTURE_RESOLUTION = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 2_u32)
  WPD_STILL_IMAGE_CAPTURE_FORMAT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 3_u32)
  WPD_STILL_IMAGE_COMPRESSION_SETTING = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 4_u32)
  WPD_STILL_IMAGE_WHITE_BALANCE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 5_u32)
  WPD_STILL_IMAGE_RGB_GAIN = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 6_u32)
  WPD_STILL_IMAGE_FNUMBER = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 7_u32)
  WPD_STILL_IMAGE_FOCAL_LENGTH = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 8_u32)
  WPD_STILL_IMAGE_FOCUS_DISTANCE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 9_u32)
  WPD_STILL_IMAGE_FOCUS_MODE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 10_u32)
  WPD_STILL_IMAGE_EXPOSURE_METERING_MODE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 11_u32)
  WPD_STILL_IMAGE_FLASH_MODE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 12_u32)
  WPD_STILL_IMAGE_EXPOSURE_TIME = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 13_u32)
  WPD_STILL_IMAGE_EXPOSURE_PROGRAM_MODE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 14_u32)
  WPD_STILL_IMAGE_EXPOSURE_INDEX = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 15_u32)
  WPD_STILL_IMAGE_EXPOSURE_BIAS_COMPENSATION = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 16_u32)
  WPD_STILL_IMAGE_CAPTURE_DELAY = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 17_u32)
  WPD_STILL_IMAGE_CAPTURE_MODE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 18_u32)
  WPD_STILL_IMAGE_CONTRAST = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 19_u32)
  WPD_STILL_IMAGE_SHARPNESS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 20_u32)
  WPD_STILL_IMAGE_DIGITAL_ZOOM = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 21_u32)
  WPD_STILL_IMAGE_EFFECT_MODE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 22_u32)
  WPD_STILL_IMAGE_BURST_NUMBER = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 23_u32)
  WPD_STILL_IMAGE_BURST_INTERVAL = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 24_u32)
  WPD_STILL_IMAGE_TIMELAPSE_NUMBER = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 25_u32)
  WPD_STILL_IMAGE_TIMELAPSE_INTERVAL = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 26_u32)
  WPD_STILL_IMAGE_FOCUS_METERING_MODE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 27_u32)
  WPD_STILL_IMAGE_UPLOAD_URL = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 28_u32)
  WPD_STILL_IMAGE_ARTIST = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 29_u32)
  WPD_STILL_IMAGE_CAMERA_MODEL = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 30_u32)
  WPD_STILL_IMAGE_CAMERA_MANUFACTURER = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 31_u32)
  WPD_RENDERING_INFORMATION_OBJECT_PROPERTIES_V1 = LibC::GUID.new(0xc53d039f_u32, 0xee23_u16, 0x4a31_u16, StaticArray[0x85_u8, 0x90_u8, 0x76_u8, 0x39_u8, 0x87_u8, 0x98_u8, 0x70_u8, 0xb4_u8])
  WPD_RENDERING_INFORMATION_PROFILES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc53d039f_u32, 0xee23_u16, 0x4a31_u16, StaticArray[0x85_u8, 0x90_u8, 0x76_u8, 0x39_u8, 0x87_u8, 0x98_u8, 0x70_u8, 0xb4_u8]), 2_u32)
  WPD_RENDERING_INFORMATION_PROFILE_ENTRY_TYPE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc53d039f_u32, 0xee23_u16, 0x4a31_u16, StaticArray[0x85_u8, 0x90_u8, 0x76_u8, 0x39_u8, 0x87_u8, 0x98_u8, 0x70_u8, 0xb4_u8]), 3_u32)
  WPD_RENDERING_INFORMATION_PROFILE_ENTRY_CREATABLE_RESOURCES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc53d039f_u32, 0xee23_u16, 0x4a31_u16, StaticArray[0x85_u8, 0x90_u8, 0x76_u8, 0x39_u8, 0x87_u8, 0x98_u8, 0x70_u8, 0xb4_u8]), 4_u32)
  WPD_CLIENT_INFORMATION_PROPERTIES_V1 = LibC::GUID.new(0x204d9f0c_u32, 0x2292_u16, 0x4080_u16, StaticArray[0x9f_u8, 0x42_u8, 0x40_u8, 0x66_u8, 0x4e_u8, 0x70_u8, 0xf8_u8, 0x59_u8])
  WPD_CLIENT_NAME = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x204d9f0c_u32, 0x2292_u16, 0x4080_u16, StaticArray[0x9f_u8, 0x42_u8, 0x40_u8, 0x66_u8, 0x4e_u8, 0x70_u8, 0xf8_u8, 0x59_u8]), 2_u32)
  WPD_CLIENT_MAJOR_VERSION = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x204d9f0c_u32, 0x2292_u16, 0x4080_u16, StaticArray[0x9f_u8, 0x42_u8, 0x40_u8, 0x66_u8, 0x4e_u8, 0x70_u8, 0xf8_u8, 0x59_u8]), 3_u32)
  WPD_CLIENT_MINOR_VERSION = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x204d9f0c_u32, 0x2292_u16, 0x4080_u16, StaticArray[0x9f_u8, 0x42_u8, 0x40_u8, 0x66_u8, 0x4e_u8, 0x70_u8, 0xf8_u8, 0x59_u8]), 4_u32)
  WPD_CLIENT_REVISION = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x204d9f0c_u32, 0x2292_u16, 0x4080_u16, StaticArray[0x9f_u8, 0x42_u8, 0x40_u8, 0x66_u8, 0x4e_u8, 0x70_u8, 0xf8_u8, 0x59_u8]), 5_u32)
  WPD_CLIENT_WMDRM_APPLICATION_PRIVATE_KEY = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x204d9f0c_u32, 0x2292_u16, 0x4080_u16, StaticArray[0x9f_u8, 0x42_u8, 0x40_u8, 0x66_u8, 0x4e_u8, 0x70_u8, 0xf8_u8, 0x59_u8]), 6_u32)
  WPD_CLIENT_WMDRM_APPLICATION_CERTIFICATE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x204d9f0c_u32, 0x2292_u16, 0x4080_u16, StaticArray[0x9f_u8, 0x42_u8, 0x40_u8, 0x66_u8, 0x4e_u8, 0x70_u8, 0xf8_u8, 0x59_u8]), 7_u32)
  WPD_CLIENT_SECURITY_QUALITY_OF_SERVICE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x204d9f0c_u32, 0x2292_u16, 0x4080_u16, StaticArray[0x9f_u8, 0x42_u8, 0x40_u8, 0x66_u8, 0x4e_u8, 0x70_u8, 0xf8_u8, 0x59_u8]), 8_u32)
  WPD_CLIENT_DESIRED_ACCESS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x204d9f0c_u32, 0x2292_u16, 0x4080_u16, StaticArray[0x9f_u8, 0x42_u8, 0x40_u8, 0x66_u8, 0x4e_u8, 0x70_u8, 0xf8_u8, 0x59_u8]), 9_u32)
  WPD_CLIENT_SHARE_MODE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x204d9f0c_u32, 0x2292_u16, 0x4080_u16, StaticArray[0x9f_u8, 0x42_u8, 0x40_u8, 0x66_u8, 0x4e_u8, 0x70_u8, 0xf8_u8, 0x59_u8]), 10_u32)
  WPD_CLIENT_EVENT_COOKIE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x204d9f0c_u32, 0x2292_u16, 0x4080_u16, StaticArray[0x9f_u8, 0x42_u8, 0x40_u8, 0x66_u8, 0x4e_u8, 0x70_u8, 0xf8_u8, 0x59_u8]), 11_u32)
  WPD_CLIENT_MINIMUM_RESULTS_BUFFER_SIZE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x204d9f0c_u32, 0x2292_u16, 0x4080_u16, StaticArray[0x9f_u8, 0x42_u8, 0x40_u8, 0x66_u8, 0x4e_u8, 0x70_u8, 0xf8_u8, 0x59_u8]), 12_u32)
  WPD_CLIENT_MANUAL_CLOSE_ON_DISCONNECT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x204d9f0c_u32, 0x2292_u16, 0x4080_u16, StaticArray[0x9f_u8, 0x42_u8, 0x40_u8, 0x66_u8, 0x4e_u8, 0x70_u8, 0xf8_u8, 0x59_u8]), 13_u32)
  WPD_PROPERTY_ATTRIBUTES_V1 = LibC::GUID.new(0xab7943d8_u32, 0x6332_u16, 0x445f_u16, StaticArray[0xa0_u8, 0xd_u8, 0x8d_u8, 0x5e_u8, 0xf1_u8, 0xe9_u8, 0x6f_u8, 0x37_u8])
  WPD_PROPERTY_ATTRIBUTE_FORM = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xab7943d8_u32, 0x6332_u16, 0x445f_u16, StaticArray[0xa0_u8, 0xd_u8, 0x8d_u8, 0x5e_u8, 0xf1_u8, 0xe9_u8, 0x6f_u8, 0x37_u8]), 2_u32)
  WPD_PROPERTY_ATTRIBUTE_CAN_READ = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xab7943d8_u32, 0x6332_u16, 0x445f_u16, StaticArray[0xa0_u8, 0xd_u8, 0x8d_u8, 0x5e_u8, 0xf1_u8, 0xe9_u8, 0x6f_u8, 0x37_u8]), 3_u32)
  WPD_PROPERTY_ATTRIBUTE_CAN_WRITE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xab7943d8_u32, 0x6332_u16, 0x445f_u16, StaticArray[0xa0_u8, 0xd_u8, 0x8d_u8, 0x5e_u8, 0xf1_u8, 0xe9_u8, 0x6f_u8, 0x37_u8]), 4_u32)
  WPD_PROPERTY_ATTRIBUTE_CAN_DELETE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xab7943d8_u32, 0x6332_u16, 0x445f_u16, StaticArray[0xa0_u8, 0xd_u8, 0x8d_u8, 0x5e_u8, 0xf1_u8, 0xe9_u8, 0x6f_u8, 0x37_u8]), 5_u32)
  WPD_PROPERTY_ATTRIBUTE_DEFAULT_VALUE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xab7943d8_u32, 0x6332_u16, 0x445f_u16, StaticArray[0xa0_u8, 0xd_u8, 0x8d_u8, 0x5e_u8, 0xf1_u8, 0xe9_u8, 0x6f_u8, 0x37_u8]), 6_u32)
  WPD_PROPERTY_ATTRIBUTE_FAST_PROPERTY = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xab7943d8_u32, 0x6332_u16, 0x445f_u16, StaticArray[0xa0_u8, 0xd_u8, 0x8d_u8, 0x5e_u8, 0xf1_u8, 0xe9_u8, 0x6f_u8, 0x37_u8]), 7_u32)
  WPD_PROPERTY_ATTRIBUTE_RANGE_MIN = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xab7943d8_u32, 0x6332_u16, 0x445f_u16, StaticArray[0xa0_u8, 0xd_u8, 0x8d_u8, 0x5e_u8, 0xf1_u8, 0xe9_u8, 0x6f_u8, 0x37_u8]), 8_u32)
  WPD_PROPERTY_ATTRIBUTE_RANGE_MAX = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xab7943d8_u32, 0x6332_u16, 0x445f_u16, StaticArray[0xa0_u8, 0xd_u8, 0x8d_u8, 0x5e_u8, 0xf1_u8, 0xe9_u8, 0x6f_u8, 0x37_u8]), 9_u32)
  WPD_PROPERTY_ATTRIBUTE_RANGE_STEP = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xab7943d8_u32, 0x6332_u16, 0x445f_u16, StaticArray[0xa0_u8, 0xd_u8, 0x8d_u8, 0x5e_u8, 0xf1_u8, 0xe9_u8, 0x6f_u8, 0x37_u8]), 10_u32)
  WPD_PROPERTY_ATTRIBUTE_ENUMERATION_ELEMENTS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xab7943d8_u32, 0x6332_u16, 0x445f_u16, StaticArray[0xa0_u8, 0xd_u8, 0x8d_u8, 0x5e_u8, 0xf1_u8, 0xe9_u8, 0x6f_u8, 0x37_u8]), 11_u32)
  WPD_PROPERTY_ATTRIBUTE_REGULAR_EXPRESSION = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xab7943d8_u32, 0x6332_u16, 0x445f_u16, StaticArray[0xa0_u8, 0xd_u8, 0x8d_u8, 0x5e_u8, 0xf1_u8, 0xe9_u8, 0x6f_u8, 0x37_u8]), 12_u32)
  WPD_PROPERTY_ATTRIBUTE_MAX_SIZE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xab7943d8_u32, 0x6332_u16, 0x445f_u16, StaticArray[0xa0_u8, 0xd_u8, 0x8d_u8, 0x5e_u8, 0xf1_u8, 0xe9_u8, 0x6f_u8, 0x37_u8]), 13_u32)
  WPD_PROPERTY_ATTRIBUTES_V2 = LibC::GUID.new(0x5d9da160_u32, 0x74ae_u16, 0x43cc_u16, StaticArray[0x85_u8, 0xa9_u8, 0xfe_u8, 0x55_u8, 0x5a_u8, 0x80_u8, 0x79_u8, 0x8e_u8])
  WPD_PROPERTY_ATTRIBUTE_NAME = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x5d9da160_u32, 0x74ae_u16, 0x43cc_u16, StaticArray[0x85_u8, 0xa9_u8, 0xfe_u8, 0x55_u8, 0x5a_u8, 0x80_u8, 0x79_u8, 0x8e_u8]), 2_u32)
  WPD_PROPERTY_ATTRIBUTE_VARTYPE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x5d9da160_u32, 0x74ae_u16, 0x43cc_u16, StaticArray[0x85_u8, 0xa9_u8, 0xfe_u8, 0x55_u8, 0x5a_u8, 0x80_u8, 0x79_u8, 0x8e_u8]), 3_u32)
  WPD_CLASS_EXTENSION_OPTIONS_V1 = LibC::GUID.new(0x6309ffef_u32, 0xa87c_u16, 0x4ca7_u16, StaticArray[0x84_u8, 0x34_u8, 0x79_u8, 0x75_u8, 0x76_u8, 0xe4_u8, 0xa_u8, 0x96_u8])
  WPD_CLASS_EXTENSION_OPTIONS_SUPPORTED_CONTENT_TYPES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6309ffef_u32, 0xa87c_u16, 0x4ca7_u16, StaticArray[0x84_u8, 0x34_u8, 0x79_u8, 0x75_u8, 0x76_u8, 0xe4_u8, 0xa_u8, 0x96_u8]), 2_u32)
  WPD_CLASS_EXTENSION_OPTIONS_DONT_REGISTER_WPD_DEVICE_INTERFACE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6309ffef_u32, 0xa87c_u16, 0x4ca7_u16, StaticArray[0x84_u8, 0x34_u8, 0x79_u8, 0x75_u8, 0x76_u8, 0xe4_u8, 0xa_u8, 0x96_u8]), 3_u32)
  WPD_CLASS_EXTENSION_OPTIONS_REGISTER_WPD_PRIVATE_DEVICE_INTERFACE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6309ffef_u32, 0xa87c_u16, 0x4ca7_u16, StaticArray[0x84_u8, 0x34_u8, 0x79_u8, 0x75_u8, 0x76_u8, 0xe4_u8, 0xa_u8, 0x96_u8]), 4_u32)
  WPD_CLASS_EXTENSION_OPTIONS_V2 = LibC::GUID.new(0x3e3595da_u32, 0x4d71_u16, 0x49fe_u16, StaticArray[0xa0_u8, 0xb4_u8, 0xd4_u8, 0x40_u8, 0x6c_u8, 0x3a_u8, 0xe9_u8, 0x3f_u8])
  WPD_CLASS_EXTENSION_OPTIONS_MULTITRANSPORT_MODE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x3e3595da_u32, 0x4d71_u16, 0x49fe_u16, StaticArray[0xa0_u8, 0xb4_u8, 0xd4_u8, 0x40_u8, 0x6c_u8, 0x3a_u8, 0xe9_u8, 0x3f_u8]), 2_u32)
  WPD_CLASS_EXTENSION_OPTIONS_DEVICE_IDENTIFICATION_VALUES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x3e3595da_u32, 0x4d71_u16, 0x49fe_u16, StaticArray[0xa0_u8, 0xb4_u8, 0xd4_u8, 0x40_u8, 0x6c_u8, 0x3a_u8, 0xe9_u8, 0x3f_u8]), 3_u32)
  WPD_CLASS_EXTENSION_OPTIONS_TRANSPORT_BANDWIDTH = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x3e3595da_u32, 0x4d71_u16, 0x49fe_u16, StaticArray[0xa0_u8, 0xb4_u8, 0xd4_u8, 0x40_u8, 0x6c_u8, 0x3a_u8, 0xe9_u8, 0x3f_u8]), 4_u32)
  WPD_CLASS_EXTENSION_OPTIONS_V3 = LibC::GUID.new(0x65c160f8_u32, 0x1367_u16, 0x4ce2_u16, StaticArray[0x93_u8, 0x9d_u8, 0x83_u8, 0x10_u8, 0x83_u8, 0x9f_u8, 0xd_u8, 0x30_u8])
  WPD_CLASS_EXTENSION_OPTIONS_SILENCE_AUTOPLAY = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x65c160f8_u32, 0x1367_u16, 0x4ce2_u16, StaticArray[0x93_u8, 0x9d_u8, 0x83_u8, 0x10_u8, 0x83_u8, 0x9f_u8, 0xd_u8, 0x30_u8]), 2_u32)
  WPD_RESOURCE_ATTRIBUTES_V1 = LibC::GUID.new(0x1eb6f604_u32, 0x9278_u16, 0x429f_u16, StaticArray[0x93_u8, 0xcc_u8, 0x5b_u8, 0xb8_u8, 0xc0_u8, 0x66_u8, 0x56_u8, 0xb6_u8])
  WPD_RESOURCE_ATTRIBUTE_TOTAL_SIZE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1eb6f604_u32, 0x9278_u16, 0x429f_u16, StaticArray[0x93_u8, 0xcc_u8, 0x5b_u8, 0xb8_u8, 0xc0_u8, 0x66_u8, 0x56_u8, 0xb6_u8]), 2_u32)
  WPD_RESOURCE_ATTRIBUTE_CAN_READ = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1eb6f604_u32, 0x9278_u16, 0x429f_u16, StaticArray[0x93_u8, 0xcc_u8, 0x5b_u8, 0xb8_u8, 0xc0_u8, 0x66_u8, 0x56_u8, 0xb6_u8]), 3_u32)
  WPD_RESOURCE_ATTRIBUTE_CAN_WRITE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1eb6f604_u32, 0x9278_u16, 0x429f_u16, StaticArray[0x93_u8, 0xcc_u8, 0x5b_u8, 0xb8_u8, 0xc0_u8, 0x66_u8, 0x56_u8, 0xb6_u8]), 4_u32)
  WPD_RESOURCE_ATTRIBUTE_CAN_DELETE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1eb6f604_u32, 0x9278_u16, 0x429f_u16, StaticArray[0x93_u8, 0xcc_u8, 0x5b_u8, 0xb8_u8, 0xc0_u8, 0x66_u8, 0x56_u8, 0xb6_u8]), 5_u32)
  WPD_RESOURCE_ATTRIBUTE_OPTIMAL_READ_BUFFER_SIZE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1eb6f604_u32, 0x9278_u16, 0x429f_u16, StaticArray[0x93_u8, 0xcc_u8, 0x5b_u8, 0xb8_u8, 0xc0_u8, 0x66_u8, 0x56_u8, 0xb6_u8]), 6_u32)
  WPD_RESOURCE_ATTRIBUTE_OPTIMAL_WRITE_BUFFER_SIZE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1eb6f604_u32, 0x9278_u16, 0x429f_u16, StaticArray[0x93_u8, 0xcc_u8, 0x5b_u8, 0xb8_u8, 0xc0_u8, 0x66_u8, 0x56_u8, 0xb6_u8]), 7_u32)
  WPD_RESOURCE_ATTRIBUTE_FORMAT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1eb6f604_u32, 0x9278_u16, 0x429f_u16, StaticArray[0x93_u8, 0xcc_u8, 0x5b_u8, 0xb8_u8, 0xc0_u8, 0x66_u8, 0x56_u8, 0xb6_u8]), 8_u32)
  WPD_RESOURCE_ATTRIBUTE_RESOURCE_KEY = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1eb6f604_u32, 0x9278_u16, 0x429f_u16, StaticArray[0x93_u8, 0xcc_u8, 0x5b_u8, 0xb8_u8, 0xc0_u8, 0x66_u8, 0x56_u8, 0xb6_u8]), 9_u32)
  WPD_DEVICE_PROPERTIES_V1 = LibC::GUID.new(0x26d4979a_u32, 0xe643_u16, 0x4626_u16, StaticArray[0x9e_u8, 0x2b_u8, 0x73_u8, 0x6d_u8, 0xc0_u8, 0xc9_u8, 0x2f_u8, 0xdc_u8])
  WPD_DEVICE_SYNC_PARTNER = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x26d4979a_u32, 0xe643_u16, 0x4626_u16, StaticArray[0x9e_u8, 0x2b_u8, 0x73_u8, 0x6d_u8, 0xc0_u8, 0xc9_u8, 0x2f_u8, 0xdc_u8]), 2_u32)
  WPD_DEVICE_FIRMWARE_VERSION = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x26d4979a_u32, 0xe643_u16, 0x4626_u16, StaticArray[0x9e_u8, 0x2b_u8, 0x73_u8, 0x6d_u8, 0xc0_u8, 0xc9_u8, 0x2f_u8, 0xdc_u8]), 3_u32)
  WPD_DEVICE_POWER_LEVEL = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x26d4979a_u32, 0xe643_u16, 0x4626_u16, StaticArray[0x9e_u8, 0x2b_u8, 0x73_u8, 0x6d_u8, 0xc0_u8, 0xc9_u8, 0x2f_u8, 0xdc_u8]), 4_u32)
  WPD_DEVICE_POWER_SOURCE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x26d4979a_u32, 0xe643_u16, 0x4626_u16, StaticArray[0x9e_u8, 0x2b_u8, 0x73_u8, 0x6d_u8, 0xc0_u8, 0xc9_u8, 0x2f_u8, 0xdc_u8]), 5_u32)
  WPD_DEVICE_PROTOCOL = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x26d4979a_u32, 0xe643_u16, 0x4626_u16, StaticArray[0x9e_u8, 0x2b_u8, 0x73_u8, 0x6d_u8, 0xc0_u8, 0xc9_u8, 0x2f_u8, 0xdc_u8]), 6_u32)
  WPD_DEVICE_MANUFACTURER = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x26d4979a_u32, 0xe643_u16, 0x4626_u16, StaticArray[0x9e_u8, 0x2b_u8, 0x73_u8, 0x6d_u8, 0xc0_u8, 0xc9_u8, 0x2f_u8, 0xdc_u8]), 7_u32)
  WPD_DEVICE_MODEL = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x26d4979a_u32, 0xe643_u16, 0x4626_u16, StaticArray[0x9e_u8, 0x2b_u8, 0x73_u8, 0x6d_u8, 0xc0_u8, 0xc9_u8, 0x2f_u8, 0xdc_u8]), 8_u32)
  WPD_DEVICE_SERIAL_NUMBER = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x26d4979a_u32, 0xe643_u16, 0x4626_u16, StaticArray[0x9e_u8, 0x2b_u8, 0x73_u8, 0x6d_u8, 0xc0_u8, 0xc9_u8, 0x2f_u8, 0xdc_u8]), 9_u32)
  WPD_DEVICE_SUPPORTS_NON_CONSUMABLE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x26d4979a_u32, 0xe643_u16, 0x4626_u16, StaticArray[0x9e_u8, 0x2b_u8, 0x73_u8, 0x6d_u8, 0xc0_u8, 0xc9_u8, 0x2f_u8, 0xdc_u8]), 10_u32)
  WPD_DEVICE_DATETIME = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x26d4979a_u32, 0xe643_u16, 0x4626_u16, StaticArray[0x9e_u8, 0x2b_u8, 0x73_u8, 0x6d_u8, 0xc0_u8, 0xc9_u8, 0x2f_u8, 0xdc_u8]), 11_u32)
  WPD_DEVICE_FRIENDLY_NAME = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x26d4979a_u32, 0xe643_u16, 0x4626_u16, StaticArray[0x9e_u8, 0x2b_u8, 0x73_u8, 0x6d_u8, 0xc0_u8, 0xc9_u8, 0x2f_u8, 0xdc_u8]), 12_u32)
  WPD_DEVICE_SUPPORTED_DRM_SCHEMES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x26d4979a_u32, 0xe643_u16, 0x4626_u16, StaticArray[0x9e_u8, 0x2b_u8, 0x73_u8, 0x6d_u8, 0xc0_u8, 0xc9_u8, 0x2f_u8, 0xdc_u8]), 13_u32)
  WPD_DEVICE_SUPPORTED_FORMATS_ARE_ORDERED = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x26d4979a_u32, 0xe643_u16, 0x4626_u16, StaticArray[0x9e_u8, 0x2b_u8, 0x73_u8, 0x6d_u8, 0xc0_u8, 0xc9_u8, 0x2f_u8, 0xdc_u8]), 14_u32)
  WPD_DEVICE_TYPE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x26d4979a_u32, 0xe643_u16, 0x4626_u16, StaticArray[0x9e_u8, 0x2b_u8, 0x73_u8, 0x6d_u8, 0xc0_u8, 0xc9_u8, 0x2f_u8, 0xdc_u8]), 15_u32)
  WPD_DEVICE_NETWORK_IDENTIFIER = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x26d4979a_u32, 0xe643_u16, 0x4626_u16, StaticArray[0x9e_u8, 0x2b_u8, 0x73_u8, 0x6d_u8, 0xc0_u8, 0xc9_u8, 0x2f_u8, 0xdc_u8]), 16_u32)
  WPD_DEVICE_PROPERTIES_V2 = LibC::GUID.new(0x463dd662_u32, 0x7fc4_u16, 0x4291_u16, StaticArray[0x91_u8, 0x1c_u8, 0x7f_u8, 0x4c_u8, 0x9c_u8, 0xca_u8, 0x97_u8, 0x99_u8])
  WPD_DEVICE_FUNCTIONAL_UNIQUE_ID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x463dd662_u32, 0x7fc4_u16, 0x4291_u16, StaticArray[0x91_u8, 0x1c_u8, 0x7f_u8, 0x4c_u8, 0x9c_u8, 0xca_u8, 0x97_u8, 0x99_u8]), 2_u32)
  WPD_DEVICE_MODEL_UNIQUE_ID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x463dd662_u32, 0x7fc4_u16, 0x4291_u16, StaticArray[0x91_u8, 0x1c_u8, 0x7f_u8, 0x4c_u8, 0x9c_u8, 0xca_u8, 0x97_u8, 0x99_u8]), 3_u32)
  WPD_DEVICE_TRANSPORT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x463dd662_u32, 0x7fc4_u16, 0x4291_u16, StaticArray[0x91_u8, 0x1c_u8, 0x7f_u8, 0x4c_u8, 0x9c_u8, 0xca_u8, 0x97_u8, 0x99_u8]), 4_u32)
  WPD_DEVICE_USE_DEVICE_STAGE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x463dd662_u32, 0x7fc4_u16, 0x4291_u16, StaticArray[0x91_u8, 0x1c_u8, 0x7f_u8, 0x4c_u8, 0x9c_u8, 0xca_u8, 0x97_u8, 0x99_u8]), 5_u32)
  WPD_DEVICE_PROPERTIES_V3 = LibC::GUID.new(0x6c2b878c_u32, 0xc2ec_u16, 0x490d_u16, StaticArray[0xb4_u8, 0x25_u8, 0xd7_u8, 0xa7_u8, 0x5e_u8, 0x23_u8, 0xe5_u8, 0xed_u8])
  WPD_DEVICE_EDP_IDENTITY = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6c2b878c_u32, 0xc2ec_u16, 0x490d_u16, StaticArray[0xb4_u8, 0x25_u8, 0xd7_u8, 0xa7_u8, 0x5e_u8, 0x23_u8, 0xe5_u8, 0xed_u8]), 1_u32)
  WPD_SERVICE_PROPERTIES_V1 = LibC::GUID.new(0x7510698a_u32, 0xcb54_u16, 0x481c_u16, StaticArray[0xb8_u8, 0xdb_u8, 0xd_u8, 0x75_u8, 0xc9_u8, 0x3f_u8, 0x1c_u8, 0x6_u8])
  WPD_SERVICE_VERSION = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7510698a_u32, 0xcb54_u16, 0x481c_u16, StaticArray[0xb8_u8, 0xdb_u8, 0xd_u8, 0x75_u8, 0xc9_u8, 0x3f_u8, 0x1c_u8, 0x6_u8]), 2_u32)
  WPD_EVENT_PROPERTIES_V1 = LibC::GUID.new(0x15ab1953_u32, 0xf817_u16, 0x4fef_u16, StaticArray[0xa9_u8, 0x21_u8, 0x56_u8, 0x76_u8, 0xe8_u8, 0x38_u8, 0xf6_u8, 0xe0_u8])
  WPD_EVENT_PARAMETER_PNP_DEVICE_ID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x15ab1953_u32, 0xf817_u16, 0x4fef_u16, StaticArray[0xa9_u8, 0x21_u8, 0x56_u8, 0x76_u8, 0xe8_u8, 0x38_u8, 0xf6_u8, 0xe0_u8]), 2_u32)
  WPD_EVENT_PARAMETER_EVENT_ID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x15ab1953_u32, 0xf817_u16, 0x4fef_u16, StaticArray[0xa9_u8, 0x21_u8, 0x56_u8, 0x76_u8, 0xe8_u8, 0x38_u8, 0xf6_u8, 0xe0_u8]), 3_u32)
  WPD_EVENT_PARAMETER_OPERATION_STATE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x15ab1953_u32, 0xf817_u16, 0x4fef_u16, StaticArray[0xa9_u8, 0x21_u8, 0x56_u8, 0x76_u8, 0xe8_u8, 0x38_u8, 0xf6_u8, 0xe0_u8]), 4_u32)
  WPD_EVENT_PARAMETER_OPERATION_PROGRESS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x15ab1953_u32, 0xf817_u16, 0x4fef_u16, StaticArray[0xa9_u8, 0x21_u8, 0x56_u8, 0x76_u8, 0xe8_u8, 0x38_u8, 0xf6_u8, 0xe0_u8]), 5_u32)
  WPD_EVENT_PARAMETER_OBJECT_PARENT_PERSISTENT_UNIQUE_ID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x15ab1953_u32, 0xf817_u16, 0x4fef_u16, StaticArray[0xa9_u8, 0x21_u8, 0x56_u8, 0x76_u8, 0xe8_u8, 0x38_u8, 0xf6_u8, 0xe0_u8]), 6_u32)
  WPD_EVENT_PARAMETER_OBJECT_CREATION_COOKIE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x15ab1953_u32, 0xf817_u16, 0x4fef_u16, StaticArray[0xa9_u8, 0x21_u8, 0x56_u8, 0x76_u8, 0xe8_u8, 0x38_u8, 0xf6_u8, 0xe0_u8]), 7_u32)
  WPD_EVENT_PARAMETER_CHILD_HIERARCHY_CHANGED = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x15ab1953_u32, 0xf817_u16, 0x4fef_u16, StaticArray[0xa9_u8, 0x21_u8, 0x56_u8, 0x76_u8, 0xe8_u8, 0x38_u8, 0xf6_u8, 0xe0_u8]), 8_u32)
  WPD_EVENT_PROPERTIES_V2 = LibC::GUID.new(0x52807b8a_u32, 0x4914_u16, 0x4323_u16, StaticArray[0x9b_u8, 0x9a_u8, 0x74_u8, 0xf6_u8, 0x54_u8, 0xb2_u8, 0xb8_u8, 0x46_u8])
  WPD_EVENT_PARAMETER_SERVICE_METHOD_CONTEXT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x52807b8a_u32, 0x4914_u16, 0x4323_u16, StaticArray[0x9b_u8, 0x9a_u8, 0x74_u8, 0xf6_u8, 0x54_u8, 0xb2_u8, 0xb8_u8, 0x46_u8]), 2_u32)
  WPD_EVENT_OPTIONS_V1 = LibC::GUID.new(0xb3d8dad7_u32, 0xa361_u16, 0x4b83_u16, StaticArray[0x8a_u8, 0x48_u8, 0x5b_u8, 0x2_u8, 0xce_u8, 0x10_u8, 0x71_u8, 0x3b_u8])
  WPD_EVENT_OPTION_IS_BROADCAST_EVENT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb3d8dad7_u32, 0xa361_u16, 0x4b83_u16, StaticArray[0x8a_u8, 0x48_u8, 0x5b_u8, 0x2_u8, 0xce_u8, 0x10_u8, 0x71_u8, 0x3b_u8]), 2_u32)
  WPD_EVENT_OPTION_IS_AUTOPLAY_EVENT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb3d8dad7_u32, 0xa361_u16, 0x4b83_u16, StaticArray[0x8a_u8, 0x48_u8, 0x5b_u8, 0x2_u8, 0xce_u8, 0x10_u8, 0x71_u8, 0x3b_u8]), 3_u32)
  WPD_EVENT_ATTRIBUTES_V1 = LibC::GUID.new(0x10c96578_u32, 0x2e81_u16, 0x4111_u16, StaticArray[0xad_u8, 0xde_u8, 0xe0_u8, 0x8c_u8, 0xa6_u8, 0x13_u8, 0x8f_u8, 0x6d_u8])
  WPD_EVENT_ATTRIBUTE_NAME = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x10c96578_u32, 0x2e81_u16, 0x4111_u16, StaticArray[0xad_u8, 0xde_u8, 0xe0_u8, 0x8c_u8, 0xa6_u8, 0x13_u8, 0x8f_u8, 0x6d_u8]), 2_u32)
  WPD_EVENT_ATTRIBUTE_PARAMETERS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x10c96578_u32, 0x2e81_u16, 0x4111_u16, StaticArray[0xad_u8, 0xde_u8, 0xe0_u8, 0x8c_u8, 0xa6_u8, 0x13_u8, 0x8f_u8, 0x6d_u8]), 3_u32)
  WPD_EVENT_ATTRIBUTE_OPTIONS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x10c96578_u32, 0x2e81_u16, 0x4111_u16, StaticArray[0xad_u8, 0xde_u8, 0xe0_u8, 0x8c_u8, 0xa6_u8, 0x13_u8, 0x8f_u8, 0x6d_u8]), 4_u32)
  WPD_API_OPTIONS_V1 = LibC::GUID.new(0x10e54a3e_u32, 0x52d_u16, 0x4777_u16, StaticArray[0xa1_u8, 0x3c_u8, 0xde_u8, 0x76_u8, 0x14_u8, 0xbe_u8, 0x2b_u8, 0xc4_u8])
  WPD_API_OPTION_USE_CLEAR_DATA_STREAM = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x10e54a3e_u32, 0x52d_u16, 0x4777_u16, StaticArray[0xa1_u8, 0x3c_u8, 0xde_u8, 0x76_u8, 0x14_u8, 0xbe_u8, 0x2b_u8, 0xc4_u8]), 2_u32)
  WPD_API_OPTION_IOCTL_ACCESS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x10e54a3e_u32, 0x52d_u16, 0x4777_u16, StaticArray[0xa1_u8, 0x3c_u8, 0xde_u8, 0x76_u8, 0x14_u8, 0xbe_u8, 0x2b_u8, 0xc4_u8]), 3_u32)
  WPD_FORMAT_ATTRIBUTES_V1 = LibC::GUID.new(0xa0a02000_u32, 0xbcaf_u16, 0x4be8_u16, StaticArray[0xb3_u8, 0xf5_u8, 0x23_u8, 0x3f_u8, 0x23_u8, 0x1c_u8, 0xf5_u8, 0x8f_u8])
  WPD_FORMAT_ATTRIBUTE_NAME = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa0a02000_u32, 0xbcaf_u16, 0x4be8_u16, StaticArray[0xb3_u8, 0xf5_u8, 0x23_u8, 0x3f_u8, 0x23_u8, 0x1c_u8, 0xf5_u8, 0x8f_u8]), 2_u32)
  WPD_FORMAT_ATTRIBUTE_MIMETYPE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa0a02000_u32, 0xbcaf_u16, 0x4be8_u16, StaticArray[0xb3_u8, 0xf5_u8, 0x23_u8, 0x3f_u8, 0x23_u8, 0x1c_u8, 0xf5_u8, 0x8f_u8]), 3_u32)
  WPD_METHOD_ATTRIBUTES_V1 = LibC::GUID.new(0xf17a5071_u32, 0xf039_u16, 0x44af_u16, StaticArray[0x8e_u8, 0xfe_u8, 0x43_u8, 0x2c_u8, 0xf3_u8, 0x2e_u8, 0x43_u8, 0x2a_u8])
  WPD_METHOD_ATTRIBUTE_NAME = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf17a5071_u32, 0xf039_u16, 0x44af_u16, StaticArray[0x8e_u8, 0xfe_u8, 0x43_u8, 0x2c_u8, 0xf3_u8, 0x2e_u8, 0x43_u8, 0x2a_u8]), 2_u32)
  WPD_METHOD_ATTRIBUTE_ASSOCIATED_FORMAT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf17a5071_u32, 0xf039_u16, 0x44af_u16, StaticArray[0x8e_u8, 0xfe_u8, 0x43_u8, 0x2c_u8, 0xf3_u8, 0x2e_u8, 0x43_u8, 0x2a_u8]), 3_u32)
  WPD_METHOD_ATTRIBUTE_ACCESS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf17a5071_u32, 0xf039_u16, 0x44af_u16, StaticArray[0x8e_u8, 0xfe_u8, 0x43_u8, 0x2c_u8, 0xf3_u8, 0x2e_u8, 0x43_u8, 0x2a_u8]), 4_u32)
  WPD_METHOD_ATTRIBUTE_PARAMETERS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf17a5071_u32, 0xf039_u16, 0x44af_u16, StaticArray[0x8e_u8, 0xfe_u8, 0x43_u8, 0x2c_u8, 0xf3_u8, 0x2e_u8, 0x43_u8, 0x2a_u8]), 5_u32)
  WPD_PARAMETER_ATTRIBUTES_V1 = LibC::GUID.new(0xe6864dd7_u32, 0xf325_u16, 0x45ea_u16, StaticArray[0xa1_u8, 0xd5_u8, 0x97_u8, 0xcf_u8, 0x73_u8, 0xb6_u8, 0xca_u8, 0x58_u8])
  WPD_PARAMETER_ATTRIBUTE_ORDER = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe6864dd7_u32, 0xf325_u16, 0x45ea_u16, StaticArray[0xa1_u8, 0xd5_u8, 0x97_u8, 0xcf_u8, 0x73_u8, 0xb6_u8, 0xca_u8, 0x58_u8]), 2_u32)
  WPD_PARAMETER_ATTRIBUTE_USAGE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe6864dd7_u32, 0xf325_u16, 0x45ea_u16, StaticArray[0xa1_u8, 0xd5_u8, 0x97_u8, 0xcf_u8, 0x73_u8, 0xb6_u8, 0xca_u8, 0x58_u8]), 3_u32)
  WPD_PARAMETER_ATTRIBUTE_FORM = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe6864dd7_u32, 0xf325_u16, 0x45ea_u16, StaticArray[0xa1_u8, 0xd5_u8, 0x97_u8, 0xcf_u8, 0x73_u8, 0xb6_u8, 0xca_u8, 0x58_u8]), 4_u32)
  WPD_PARAMETER_ATTRIBUTE_DEFAULT_VALUE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe6864dd7_u32, 0xf325_u16, 0x45ea_u16, StaticArray[0xa1_u8, 0xd5_u8, 0x97_u8, 0xcf_u8, 0x73_u8, 0xb6_u8, 0xca_u8, 0x58_u8]), 5_u32)
  WPD_PARAMETER_ATTRIBUTE_RANGE_MIN = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe6864dd7_u32, 0xf325_u16, 0x45ea_u16, StaticArray[0xa1_u8, 0xd5_u8, 0x97_u8, 0xcf_u8, 0x73_u8, 0xb6_u8, 0xca_u8, 0x58_u8]), 6_u32)
  WPD_PARAMETER_ATTRIBUTE_RANGE_MAX = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe6864dd7_u32, 0xf325_u16, 0x45ea_u16, StaticArray[0xa1_u8, 0xd5_u8, 0x97_u8, 0xcf_u8, 0x73_u8, 0xb6_u8, 0xca_u8, 0x58_u8]), 7_u32)
  WPD_PARAMETER_ATTRIBUTE_RANGE_STEP = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe6864dd7_u32, 0xf325_u16, 0x45ea_u16, StaticArray[0xa1_u8, 0xd5_u8, 0x97_u8, 0xcf_u8, 0x73_u8, 0xb6_u8, 0xca_u8, 0x58_u8]), 8_u32)
  WPD_PARAMETER_ATTRIBUTE_ENUMERATION_ELEMENTS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe6864dd7_u32, 0xf325_u16, 0x45ea_u16, StaticArray[0xa1_u8, 0xd5_u8, 0x97_u8, 0xcf_u8, 0x73_u8, 0xb6_u8, 0xca_u8, 0x58_u8]), 9_u32)
  WPD_PARAMETER_ATTRIBUTE_REGULAR_EXPRESSION = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe6864dd7_u32, 0xf325_u16, 0x45ea_u16, StaticArray[0xa1_u8, 0xd5_u8, 0x97_u8, 0xcf_u8, 0x73_u8, 0xb6_u8, 0xca_u8, 0x58_u8]), 10_u32)
  WPD_PARAMETER_ATTRIBUTE_MAX_SIZE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe6864dd7_u32, 0xf325_u16, 0x45ea_u16, StaticArray[0xa1_u8, 0xd5_u8, 0x97_u8, 0xcf_u8, 0x73_u8, 0xb6_u8, 0xca_u8, 0x58_u8]), 11_u32)
  WPD_PARAMETER_ATTRIBUTE_VARTYPE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe6864dd7_u32, 0xf325_u16, 0x45ea_u16, StaticArray[0xa1_u8, 0xd5_u8, 0x97_u8, 0xcf_u8, 0x73_u8, 0xb6_u8, 0xca_u8, 0x58_u8]), 12_u32)
  WPD_PARAMETER_ATTRIBUTE_NAME = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe6864dd7_u32, 0xf325_u16, 0x45ea_u16, StaticArray[0xa1_u8, 0xd5_u8, 0x97_u8, 0xcf_u8, 0x73_u8, 0xb6_u8, 0xca_u8, 0x58_u8]), 13_u32)
  WPD_CATEGORY_COMMON = LibC::GUID.new(0xf0422a9c_u32, 0x5dc8_u16, 0x4440_u16, StaticArray[0xb5_u8, 0xbd_u8, 0x5d_u8, 0xf2_u8, 0x88_u8, 0x35_u8, 0x65_u8, 0x8a_u8])
  WPD_COMMAND_COMMON_RESET_DEVICE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf0422a9c_u32, 0x5dc8_u16, 0x4440_u16, StaticArray[0xb5_u8, 0xbd_u8, 0x5d_u8, 0xf2_u8, 0x88_u8, 0x35_u8, 0x65_u8, 0x8a_u8]), 2_u32)
  WPD_COMMAND_COMMON_GET_OBJECT_IDS_FROM_PERSISTENT_UNIQUE_IDS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf0422a9c_u32, 0x5dc8_u16, 0x4440_u16, StaticArray[0xb5_u8, 0xbd_u8, 0x5d_u8, 0xf2_u8, 0x88_u8, 0x35_u8, 0x65_u8, 0x8a_u8]), 3_u32)
  WPD_COMMAND_COMMON_SAVE_CLIENT_INFORMATION = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf0422a9c_u32, 0x5dc8_u16, 0x4440_u16, StaticArray[0xb5_u8, 0xbd_u8, 0x5d_u8, 0xf2_u8, 0x88_u8, 0x35_u8, 0x65_u8, 0x8a_u8]), 4_u32)
  WPD_PROPERTY_COMMON_COMMAND_CATEGORY = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf0422a9c_u32, 0x5dc8_u16, 0x4440_u16, StaticArray[0xb5_u8, 0xbd_u8, 0x5d_u8, 0xf2_u8, 0x88_u8, 0x35_u8, 0x65_u8, 0x8a_u8]), 1001_u32)
  WPD_PROPERTY_COMMON_COMMAND_ID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf0422a9c_u32, 0x5dc8_u16, 0x4440_u16, StaticArray[0xb5_u8, 0xbd_u8, 0x5d_u8, 0xf2_u8, 0x88_u8, 0x35_u8, 0x65_u8, 0x8a_u8]), 1002_u32)
  WPD_PROPERTY_COMMON_HRESULT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf0422a9c_u32, 0x5dc8_u16, 0x4440_u16, StaticArray[0xb5_u8, 0xbd_u8, 0x5d_u8, 0xf2_u8, 0x88_u8, 0x35_u8, 0x65_u8, 0x8a_u8]), 1003_u32)
  WPD_PROPERTY_COMMON_DRIVER_ERROR_CODE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf0422a9c_u32, 0x5dc8_u16, 0x4440_u16, StaticArray[0xb5_u8, 0xbd_u8, 0x5d_u8, 0xf2_u8, 0x88_u8, 0x35_u8, 0x65_u8, 0x8a_u8]), 1004_u32)
  WPD_PROPERTY_COMMON_COMMAND_TARGET = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf0422a9c_u32, 0x5dc8_u16, 0x4440_u16, StaticArray[0xb5_u8, 0xbd_u8, 0x5d_u8, 0xf2_u8, 0x88_u8, 0x35_u8, 0x65_u8, 0x8a_u8]), 1006_u32)
  WPD_PROPERTY_COMMON_PERSISTENT_UNIQUE_IDS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf0422a9c_u32, 0x5dc8_u16, 0x4440_u16, StaticArray[0xb5_u8, 0xbd_u8, 0x5d_u8, 0xf2_u8, 0x88_u8, 0x35_u8, 0x65_u8, 0x8a_u8]), 1007_u32)
  WPD_PROPERTY_COMMON_OBJECT_IDS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf0422a9c_u32, 0x5dc8_u16, 0x4440_u16, StaticArray[0xb5_u8, 0xbd_u8, 0x5d_u8, 0xf2_u8, 0x88_u8, 0x35_u8, 0x65_u8, 0x8a_u8]), 1008_u32)
  WPD_PROPERTY_COMMON_CLIENT_INFORMATION = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf0422a9c_u32, 0x5dc8_u16, 0x4440_u16, StaticArray[0xb5_u8, 0xbd_u8, 0x5d_u8, 0xf2_u8, 0x88_u8, 0x35_u8, 0x65_u8, 0x8a_u8]), 1009_u32)
  WPD_PROPERTY_COMMON_CLIENT_INFORMATION_CONTEXT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf0422a9c_u32, 0x5dc8_u16, 0x4440_u16, StaticArray[0xb5_u8, 0xbd_u8, 0x5d_u8, 0xf2_u8, 0x88_u8, 0x35_u8, 0x65_u8, 0x8a_u8]), 1010_u32)
  WPD_PROPERTY_COMMON_ACTIVITY_ID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf0422a9c_u32, 0x5dc8_u16, 0x4440_u16, StaticArray[0xb5_u8, 0xbd_u8, 0x5d_u8, 0xf2_u8, 0x88_u8, 0x35_u8, 0x65_u8, 0x8a_u8]), 1011_u32)
  WPD_OPTION_VALID_OBJECT_IDS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf0422a9c_u32, 0x5dc8_u16, 0x4440_u16, StaticArray[0xb5_u8, 0xbd_u8, 0x5d_u8, 0xf2_u8, 0x88_u8, 0x35_u8, 0x65_u8, 0x8a_u8]), 5001_u32)
  WPD_CATEGORY_OBJECT_ENUMERATION = LibC::GUID.new(0xb7474e91_u32, 0xe7f8_u16, 0x4ad9_u16, StaticArray[0xb4_u8, 0x0_u8, 0xad_u8, 0x1a_u8, 0x4b_u8, 0x58_u8, 0xee_u8, 0xec_u8])
  WPD_COMMAND_OBJECT_ENUMERATION_START_FIND = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb7474e91_u32, 0xe7f8_u16, 0x4ad9_u16, StaticArray[0xb4_u8, 0x0_u8, 0xad_u8, 0x1a_u8, 0x4b_u8, 0x58_u8, 0xee_u8, 0xec_u8]), 2_u32)
  WPD_COMMAND_OBJECT_ENUMERATION_FIND_NEXT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb7474e91_u32, 0xe7f8_u16, 0x4ad9_u16, StaticArray[0xb4_u8, 0x0_u8, 0xad_u8, 0x1a_u8, 0x4b_u8, 0x58_u8, 0xee_u8, 0xec_u8]), 3_u32)
  WPD_COMMAND_OBJECT_ENUMERATION_END_FIND = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb7474e91_u32, 0xe7f8_u16, 0x4ad9_u16, StaticArray[0xb4_u8, 0x0_u8, 0xad_u8, 0x1a_u8, 0x4b_u8, 0x58_u8, 0xee_u8, 0xec_u8]), 4_u32)
  WPD_PROPERTY_OBJECT_ENUMERATION_PARENT_ID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb7474e91_u32, 0xe7f8_u16, 0x4ad9_u16, StaticArray[0xb4_u8, 0x0_u8, 0xad_u8, 0x1a_u8, 0x4b_u8, 0x58_u8, 0xee_u8, 0xec_u8]), 1001_u32)
  WPD_PROPERTY_OBJECT_ENUMERATION_FILTER = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb7474e91_u32, 0xe7f8_u16, 0x4ad9_u16, StaticArray[0xb4_u8, 0x0_u8, 0xad_u8, 0x1a_u8, 0x4b_u8, 0x58_u8, 0xee_u8, 0xec_u8]), 1002_u32)
  WPD_PROPERTY_OBJECT_ENUMERATION_OBJECT_IDS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb7474e91_u32, 0xe7f8_u16, 0x4ad9_u16, StaticArray[0xb4_u8, 0x0_u8, 0xad_u8, 0x1a_u8, 0x4b_u8, 0x58_u8, 0xee_u8, 0xec_u8]), 1003_u32)
  WPD_PROPERTY_OBJECT_ENUMERATION_CONTEXT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb7474e91_u32, 0xe7f8_u16, 0x4ad9_u16, StaticArray[0xb4_u8, 0x0_u8, 0xad_u8, 0x1a_u8, 0x4b_u8, 0x58_u8, 0xee_u8, 0xec_u8]), 1004_u32)
  WPD_PROPERTY_OBJECT_ENUMERATION_NUM_OBJECTS_REQUESTED = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb7474e91_u32, 0xe7f8_u16, 0x4ad9_u16, StaticArray[0xb4_u8, 0x0_u8, 0xad_u8, 0x1a_u8, 0x4b_u8, 0x58_u8, 0xee_u8, 0xec_u8]), 1005_u32)
  WPD_CATEGORY_OBJECT_PROPERTIES = LibC::GUID.new(0x9e5582e4_u32, 0x814_u16, 0x44e6_u16, StaticArray[0x98_u8, 0x1a_u8, 0xb2_u8, 0x99_u8, 0x8d_u8, 0x58_u8, 0x38_u8, 0x4_u8])
  WPD_COMMAND_OBJECT_PROPERTIES_GET_SUPPORTED = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9e5582e4_u32, 0x814_u16, 0x44e6_u16, StaticArray[0x98_u8, 0x1a_u8, 0xb2_u8, 0x99_u8, 0x8d_u8, 0x58_u8, 0x38_u8, 0x4_u8]), 2_u32)
  WPD_COMMAND_OBJECT_PROPERTIES_GET_ATTRIBUTES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9e5582e4_u32, 0x814_u16, 0x44e6_u16, StaticArray[0x98_u8, 0x1a_u8, 0xb2_u8, 0x99_u8, 0x8d_u8, 0x58_u8, 0x38_u8, 0x4_u8]), 3_u32)
  WPD_COMMAND_OBJECT_PROPERTIES_GET = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9e5582e4_u32, 0x814_u16, 0x44e6_u16, StaticArray[0x98_u8, 0x1a_u8, 0xb2_u8, 0x99_u8, 0x8d_u8, 0x58_u8, 0x38_u8, 0x4_u8]), 4_u32)
  WPD_COMMAND_OBJECT_PROPERTIES_SET = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9e5582e4_u32, 0x814_u16, 0x44e6_u16, StaticArray[0x98_u8, 0x1a_u8, 0xb2_u8, 0x99_u8, 0x8d_u8, 0x58_u8, 0x38_u8, 0x4_u8]), 5_u32)
  WPD_COMMAND_OBJECT_PROPERTIES_GET_ALL = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9e5582e4_u32, 0x814_u16, 0x44e6_u16, StaticArray[0x98_u8, 0x1a_u8, 0xb2_u8, 0x99_u8, 0x8d_u8, 0x58_u8, 0x38_u8, 0x4_u8]), 6_u32)
  WPD_COMMAND_OBJECT_PROPERTIES_DELETE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9e5582e4_u32, 0x814_u16, 0x44e6_u16, StaticArray[0x98_u8, 0x1a_u8, 0xb2_u8, 0x99_u8, 0x8d_u8, 0x58_u8, 0x38_u8, 0x4_u8]), 7_u32)
  WPD_PROPERTY_OBJECT_PROPERTIES_OBJECT_ID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9e5582e4_u32, 0x814_u16, 0x44e6_u16, StaticArray[0x98_u8, 0x1a_u8, 0xb2_u8, 0x99_u8, 0x8d_u8, 0x58_u8, 0x38_u8, 0x4_u8]), 1001_u32)
  WPD_PROPERTY_OBJECT_PROPERTIES_PROPERTY_KEYS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9e5582e4_u32, 0x814_u16, 0x44e6_u16, StaticArray[0x98_u8, 0x1a_u8, 0xb2_u8, 0x99_u8, 0x8d_u8, 0x58_u8, 0x38_u8, 0x4_u8]), 1002_u32)
  WPD_PROPERTY_OBJECT_PROPERTIES_PROPERTY_ATTRIBUTES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9e5582e4_u32, 0x814_u16, 0x44e6_u16, StaticArray[0x98_u8, 0x1a_u8, 0xb2_u8, 0x99_u8, 0x8d_u8, 0x58_u8, 0x38_u8, 0x4_u8]), 1003_u32)
  WPD_PROPERTY_OBJECT_PROPERTIES_PROPERTY_VALUES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9e5582e4_u32, 0x814_u16, 0x44e6_u16, StaticArray[0x98_u8, 0x1a_u8, 0xb2_u8, 0x99_u8, 0x8d_u8, 0x58_u8, 0x38_u8, 0x4_u8]), 1004_u32)
  WPD_PROPERTY_OBJECT_PROPERTIES_PROPERTY_WRITE_RESULTS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9e5582e4_u32, 0x814_u16, 0x44e6_u16, StaticArray[0x98_u8, 0x1a_u8, 0xb2_u8, 0x99_u8, 0x8d_u8, 0x58_u8, 0x38_u8, 0x4_u8]), 1005_u32)
  WPD_PROPERTY_OBJECT_PROPERTIES_PROPERTY_DELETE_RESULTS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9e5582e4_u32, 0x814_u16, 0x44e6_u16, StaticArray[0x98_u8, 0x1a_u8, 0xb2_u8, 0x99_u8, 0x8d_u8, 0x58_u8, 0x38_u8, 0x4_u8]), 1006_u32)
  WPD_CATEGORY_OBJECT_PROPERTIES_BULK = LibC::GUID.new(0x11c824dd_u32, 0x4cd_u16, 0x4e4e_u16, StaticArray[0x8c_u8, 0x7b_u8, 0xf6_u8, 0xef_u8, 0xb7_u8, 0x94_u8, 0xd8_u8, 0x4e_u8])
  WPD_COMMAND_OBJECT_PROPERTIES_BULK_GET_VALUES_BY_OBJECT_LIST_START = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x11c824dd_u32, 0x4cd_u16, 0x4e4e_u16, StaticArray[0x8c_u8, 0x7b_u8, 0xf6_u8, 0xef_u8, 0xb7_u8, 0x94_u8, 0xd8_u8, 0x4e_u8]), 2_u32)
  WPD_COMMAND_OBJECT_PROPERTIES_BULK_GET_VALUES_BY_OBJECT_LIST_NEXT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x11c824dd_u32, 0x4cd_u16, 0x4e4e_u16, StaticArray[0x8c_u8, 0x7b_u8, 0xf6_u8, 0xef_u8, 0xb7_u8, 0x94_u8, 0xd8_u8, 0x4e_u8]), 3_u32)
  WPD_COMMAND_OBJECT_PROPERTIES_BULK_GET_VALUES_BY_OBJECT_LIST_END = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x11c824dd_u32, 0x4cd_u16, 0x4e4e_u16, StaticArray[0x8c_u8, 0x7b_u8, 0xf6_u8, 0xef_u8, 0xb7_u8, 0x94_u8, 0xd8_u8, 0x4e_u8]), 4_u32)
  WPD_COMMAND_OBJECT_PROPERTIES_BULK_GET_VALUES_BY_OBJECT_FORMAT_START = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x11c824dd_u32, 0x4cd_u16, 0x4e4e_u16, StaticArray[0x8c_u8, 0x7b_u8, 0xf6_u8, 0xef_u8, 0xb7_u8, 0x94_u8, 0xd8_u8, 0x4e_u8]), 5_u32)
  WPD_COMMAND_OBJECT_PROPERTIES_BULK_GET_VALUES_BY_OBJECT_FORMAT_NEXT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x11c824dd_u32, 0x4cd_u16, 0x4e4e_u16, StaticArray[0x8c_u8, 0x7b_u8, 0xf6_u8, 0xef_u8, 0xb7_u8, 0x94_u8, 0xd8_u8, 0x4e_u8]), 6_u32)
  WPD_COMMAND_OBJECT_PROPERTIES_BULK_GET_VALUES_BY_OBJECT_FORMAT_END = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x11c824dd_u32, 0x4cd_u16, 0x4e4e_u16, StaticArray[0x8c_u8, 0x7b_u8, 0xf6_u8, 0xef_u8, 0xb7_u8, 0x94_u8, 0xd8_u8, 0x4e_u8]), 7_u32)
  WPD_COMMAND_OBJECT_PROPERTIES_BULK_SET_VALUES_BY_OBJECT_LIST_START = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x11c824dd_u32, 0x4cd_u16, 0x4e4e_u16, StaticArray[0x8c_u8, 0x7b_u8, 0xf6_u8, 0xef_u8, 0xb7_u8, 0x94_u8, 0xd8_u8, 0x4e_u8]), 8_u32)
  WPD_COMMAND_OBJECT_PROPERTIES_BULK_SET_VALUES_BY_OBJECT_LIST_NEXT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x11c824dd_u32, 0x4cd_u16, 0x4e4e_u16, StaticArray[0x8c_u8, 0x7b_u8, 0xf6_u8, 0xef_u8, 0xb7_u8, 0x94_u8, 0xd8_u8, 0x4e_u8]), 9_u32)
  WPD_COMMAND_OBJECT_PROPERTIES_BULK_SET_VALUES_BY_OBJECT_LIST_END = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x11c824dd_u32, 0x4cd_u16, 0x4e4e_u16, StaticArray[0x8c_u8, 0x7b_u8, 0xf6_u8, 0xef_u8, 0xb7_u8, 0x94_u8, 0xd8_u8, 0x4e_u8]), 10_u32)
  WPD_PROPERTY_OBJECT_PROPERTIES_BULK_OBJECT_IDS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x11c824dd_u32, 0x4cd_u16, 0x4e4e_u16, StaticArray[0x8c_u8, 0x7b_u8, 0xf6_u8, 0xef_u8, 0xb7_u8, 0x94_u8, 0xd8_u8, 0x4e_u8]), 1001_u32)
  WPD_PROPERTY_OBJECT_PROPERTIES_BULK_CONTEXT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x11c824dd_u32, 0x4cd_u16, 0x4e4e_u16, StaticArray[0x8c_u8, 0x7b_u8, 0xf6_u8, 0xef_u8, 0xb7_u8, 0x94_u8, 0xd8_u8, 0x4e_u8]), 1002_u32)
  WPD_PROPERTY_OBJECT_PROPERTIES_BULK_VALUES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x11c824dd_u32, 0x4cd_u16, 0x4e4e_u16, StaticArray[0x8c_u8, 0x7b_u8, 0xf6_u8, 0xef_u8, 0xb7_u8, 0x94_u8, 0xd8_u8, 0x4e_u8]), 1003_u32)
  WPD_PROPERTY_OBJECT_PROPERTIES_BULK_PROPERTY_KEYS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x11c824dd_u32, 0x4cd_u16, 0x4e4e_u16, StaticArray[0x8c_u8, 0x7b_u8, 0xf6_u8, 0xef_u8, 0xb7_u8, 0x94_u8, 0xd8_u8, 0x4e_u8]), 1004_u32)
  WPD_PROPERTY_OBJECT_PROPERTIES_BULK_DEPTH = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x11c824dd_u32, 0x4cd_u16, 0x4e4e_u16, StaticArray[0x8c_u8, 0x7b_u8, 0xf6_u8, 0xef_u8, 0xb7_u8, 0x94_u8, 0xd8_u8, 0x4e_u8]), 1005_u32)
  WPD_PROPERTY_OBJECT_PROPERTIES_BULK_PARENT_OBJECT_ID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x11c824dd_u32, 0x4cd_u16, 0x4e4e_u16, StaticArray[0x8c_u8, 0x7b_u8, 0xf6_u8, 0xef_u8, 0xb7_u8, 0x94_u8, 0xd8_u8, 0x4e_u8]), 1006_u32)
  WPD_PROPERTY_OBJECT_PROPERTIES_BULK_OBJECT_FORMAT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x11c824dd_u32, 0x4cd_u16, 0x4e4e_u16, StaticArray[0x8c_u8, 0x7b_u8, 0xf6_u8, 0xef_u8, 0xb7_u8, 0x94_u8, 0xd8_u8, 0x4e_u8]), 1007_u32)
  WPD_PROPERTY_OBJECT_PROPERTIES_BULK_WRITE_RESULTS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x11c824dd_u32, 0x4cd_u16, 0x4e4e_u16, StaticArray[0x8c_u8, 0x7b_u8, 0xf6_u8, 0xef_u8, 0xb7_u8, 0x94_u8, 0xd8_u8, 0x4e_u8]), 1008_u32)
  WPD_CATEGORY_OBJECT_RESOURCES = LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8])
  WPD_COMMAND_OBJECT_RESOURCES_GET_SUPPORTED = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 2_u32)
  WPD_COMMAND_OBJECT_RESOURCES_GET_ATTRIBUTES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 3_u32)
  WPD_COMMAND_OBJECT_RESOURCES_OPEN = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 4_u32)
  WPD_COMMAND_OBJECT_RESOURCES_READ = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 5_u32)
  WPD_COMMAND_OBJECT_RESOURCES_WRITE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 6_u32)
  WPD_COMMAND_OBJECT_RESOURCES_CLOSE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 7_u32)
  WPD_COMMAND_OBJECT_RESOURCES_DELETE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 8_u32)
  WPD_COMMAND_OBJECT_RESOURCES_CREATE_RESOURCE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 9_u32)
  WPD_COMMAND_OBJECT_RESOURCES_REVERT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 10_u32)
  WPD_COMMAND_OBJECT_RESOURCES_SEEK = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 11_u32)
  WPD_COMMAND_OBJECT_RESOURCES_COMMIT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 12_u32)
  WPD_COMMAND_OBJECT_RESOURCES_SEEK_IN_UNITS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 13_u32)
  WPD_PROPERTY_OBJECT_RESOURCES_OBJECT_ID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 1001_u32)
  WPD_PROPERTY_OBJECT_RESOURCES_ACCESS_MODE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 1002_u32)
  WPD_PROPERTY_OBJECT_RESOURCES_RESOURCE_KEYS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 1003_u32)
  WPD_PROPERTY_OBJECT_RESOURCES_RESOURCE_ATTRIBUTES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 1004_u32)
  WPD_PROPERTY_OBJECT_RESOURCES_CONTEXT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 1005_u32)
  WPD_PROPERTY_OBJECT_RESOURCES_NUM_BYTES_TO_READ = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 1006_u32)
  WPD_PROPERTY_OBJECT_RESOURCES_NUM_BYTES_READ = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 1007_u32)
  WPD_PROPERTY_OBJECT_RESOURCES_NUM_BYTES_TO_WRITE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 1008_u32)
  WPD_PROPERTY_OBJECT_RESOURCES_NUM_BYTES_WRITTEN = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 1009_u32)
  WPD_PROPERTY_OBJECT_RESOURCES_DATA = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 1010_u32)
  WPD_PROPERTY_OBJECT_RESOURCES_OPTIMAL_TRANSFER_BUFFER_SIZE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 1011_u32)
  WPD_PROPERTY_OBJECT_RESOURCES_SEEK_OFFSET = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 1012_u32)
  WPD_PROPERTY_OBJECT_RESOURCES_SEEK_ORIGIN_FLAG = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 1013_u32)
  WPD_PROPERTY_OBJECT_RESOURCES_POSITION_FROM_START = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 1014_u32)
  WPD_PROPERTY_OBJECT_RESOURCES_SUPPORTS_UNITS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 1015_u32)
  WPD_PROPERTY_OBJECT_RESOURCES_STREAM_UNITS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 1016_u32)
  WPD_OPTION_OBJECT_RESOURCES_SEEK_ON_READ_SUPPORTED = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 5001_u32)
  WPD_OPTION_OBJECT_RESOURCES_SEEK_ON_WRITE_SUPPORTED = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 5002_u32)
  WPD_OPTION_OBJECT_RESOURCES_NO_INPUT_BUFFER_ON_READ = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 5003_u32)
  WPD_CATEGORY_OBJECT_MANAGEMENT = LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8])
  WPD_COMMAND_OBJECT_MANAGEMENT_CREATE_OBJECT_WITH_PROPERTIES_ONLY = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 2_u32)
  WPD_COMMAND_OBJECT_MANAGEMENT_CREATE_OBJECT_WITH_PROPERTIES_AND_DATA = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 3_u32)
  WPD_COMMAND_OBJECT_MANAGEMENT_WRITE_OBJECT_DATA = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 4_u32)
  WPD_COMMAND_OBJECT_MANAGEMENT_COMMIT_OBJECT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 5_u32)
  WPD_COMMAND_OBJECT_MANAGEMENT_REVERT_OBJECT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 6_u32)
  WPD_COMMAND_OBJECT_MANAGEMENT_DELETE_OBJECTS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 7_u32)
  WPD_COMMAND_OBJECT_MANAGEMENT_MOVE_OBJECTS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 8_u32)
  WPD_COMMAND_OBJECT_MANAGEMENT_COPY_OBJECTS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 9_u32)
  WPD_COMMAND_OBJECT_MANAGEMENT_UPDATE_OBJECT_WITH_PROPERTIES_AND_DATA = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 10_u32)
  WPD_PROPERTY_OBJECT_MANAGEMENT_CREATION_PROPERTIES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 1001_u32)
  WPD_PROPERTY_OBJECT_MANAGEMENT_CONTEXT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 1002_u32)
  WPD_PROPERTY_OBJECT_MANAGEMENT_NUM_BYTES_TO_WRITE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 1003_u32)
  WPD_PROPERTY_OBJECT_MANAGEMENT_NUM_BYTES_WRITTEN = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 1004_u32)
  WPD_PROPERTY_OBJECT_MANAGEMENT_DATA = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 1005_u32)
  WPD_PROPERTY_OBJECT_MANAGEMENT_OBJECT_ID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 1006_u32)
  WPD_PROPERTY_OBJECT_MANAGEMENT_DELETE_OPTIONS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 1007_u32)
  WPD_PROPERTY_OBJECT_MANAGEMENT_OPTIMAL_TRANSFER_BUFFER_SIZE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 1008_u32)
  WPD_PROPERTY_OBJECT_MANAGEMENT_OBJECT_IDS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 1009_u32)
  WPD_PROPERTY_OBJECT_MANAGEMENT_DELETE_RESULTS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 1010_u32)
  WPD_PROPERTY_OBJECT_MANAGEMENT_DESTINATION_FOLDER_OBJECT_ID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 1011_u32)
  WPD_PROPERTY_OBJECT_MANAGEMENT_MOVE_RESULTS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 1012_u32)
  WPD_PROPERTY_OBJECT_MANAGEMENT_COPY_RESULTS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 1013_u32)
  WPD_PROPERTY_OBJECT_MANAGEMENT_UPDATE_PROPERTIES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 1014_u32)
  WPD_PROPERTY_OBJECT_MANAGEMENT_PROPERTY_KEYS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 1015_u32)
  WPD_PROPERTY_OBJECT_MANAGEMENT_OBJECT_FORMAT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 1016_u32)
  WPD_OPTION_OBJECT_MANAGEMENT_RECURSIVE_DELETE_SUPPORTED = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 5001_u32)
  WPD_CATEGORY_CAPABILITIES = LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8])
  WPD_COMMAND_CAPABILITIES_GET_SUPPORTED_COMMANDS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 2_u32)
  WPD_COMMAND_CAPABILITIES_GET_COMMAND_OPTIONS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 3_u32)
  WPD_COMMAND_CAPABILITIES_GET_SUPPORTED_FUNCTIONAL_CATEGORIES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 4_u32)
  WPD_COMMAND_CAPABILITIES_GET_FUNCTIONAL_OBJECTS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 5_u32)
  WPD_COMMAND_CAPABILITIES_GET_SUPPORTED_CONTENT_TYPES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 6_u32)
  WPD_COMMAND_CAPABILITIES_GET_SUPPORTED_FORMATS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 7_u32)
  WPD_COMMAND_CAPABILITIES_GET_SUPPORTED_FORMAT_PROPERTIES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 8_u32)
  WPD_COMMAND_CAPABILITIES_GET_FIXED_PROPERTY_ATTRIBUTES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 9_u32)
  WPD_COMMAND_CAPABILITIES_GET_SUPPORTED_EVENTS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 10_u32)
  WPD_COMMAND_CAPABILITIES_GET_EVENT_OPTIONS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 11_u32)
  WPD_PROPERTY_CAPABILITIES_SUPPORTED_COMMANDS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 1001_u32)
  WPD_PROPERTY_CAPABILITIES_COMMAND = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 1002_u32)
  WPD_PROPERTY_CAPABILITIES_COMMAND_OPTIONS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 1003_u32)
  WPD_PROPERTY_CAPABILITIES_FUNCTIONAL_CATEGORIES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 1004_u32)
  WPD_PROPERTY_CAPABILITIES_FUNCTIONAL_CATEGORY = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 1005_u32)
  WPD_PROPERTY_CAPABILITIES_FUNCTIONAL_OBJECTS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 1006_u32)
  WPD_PROPERTY_CAPABILITIES_CONTENT_TYPES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 1007_u32)
  WPD_PROPERTY_CAPABILITIES_CONTENT_TYPE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 1008_u32)
  WPD_PROPERTY_CAPABILITIES_FORMATS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 1009_u32)
  WPD_PROPERTY_CAPABILITIES_FORMAT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 1010_u32)
  WPD_PROPERTY_CAPABILITIES_PROPERTY_KEYS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 1011_u32)
  WPD_PROPERTY_CAPABILITIES_PROPERTY_ATTRIBUTES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 1012_u32)
  WPD_PROPERTY_CAPABILITIES_SUPPORTED_EVENTS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 1013_u32)
  WPD_PROPERTY_CAPABILITIES_EVENT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 1014_u32)
  WPD_PROPERTY_CAPABILITIES_EVENT_OPTIONS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 1015_u32)
  WPD_CATEGORY_STORAGE = LibC::GUID.new(0xd8f907a6_u32, 0x34cc_u16, 0x45fa_u16, StaticArray[0x97_u8, 0xfb_u8, 0xd0_u8, 0x7_u8, 0xfa_u8, 0x47_u8, 0xec_u8, 0x94_u8])
  WPD_COMMAND_STORAGE_FORMAT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd8f907a6_u32, 0x34cc_u16, 0x45fa_u16, StaticArray[0x97_u8, 0xfb_u8, 0xd0_u8, 0x7_u8, 0xfa_u8, 0x47_u8, 0xec_u8, 0x94_u8]), 2_u32)
  WPD_COMMAND_STORAGE_EJECT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd8f907a6_u32, 0x34cc_u16, 0x45fa_u16, StaticArray[0x97_u8, 0xfb_u8, 0xd0_u8, 0x7_u8, 0xfa_u8, 0x47_u8, 0xec_u8, 0x94_u8]), 4_u32)
  WPD_PROPERTY_STORAGE_OBJECT_ID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd8f907a6_u32, 0x34cc_u16, 0x45fa_u16, StaticArray[0x97_u8, 0xfb_u8, 0xd0_u8, 0x7_u8, 0xfa_u8, 0x47_u8, 0xec_u8, 0x94_u8]), 1001_u32)
  WPD_PROPERTY_STORAGE_DESTINATION_OBJECT_ID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd8f907a6_u32, 0x34cc_u16, 0x45fa_u16, StaticArray[0x97_u8, 0xfb_u8, 0xd0_u8, 0x7_u8, 0xfa_u8, 0x47_u8, 0xec_u8, 0x94_u8]), 1002_u32)
  WPD_CATEGORY_SMS = LibC::GUID.new(0xafc25d66_u32, 0xfe0d_u16, 0x4114_u16, StaticArray[0x90_u8, 0x97_u8, 0x97_u8, 0xc_u8, 0x93_u8, 0xe9_u8, 0x20_u8, 0xd1_u8])
  WPD_COMMAND_SMS_SEND = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xafc25d66_u32, 0xfe0d_u16, 0x4114_u16, StaticArray[0x90_u8, 0x97_u8, 0x97_u8, 0xc_u8, 0x93_u8, 0xe9_u8, 0x20_u8, 0xd1_u8]), 2_u32)
  WPD_PROPERTY_SMS_RECIPIENT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xafc25d66_u32, 0xfe0d_u16, 0x4114_u16, StaticArray[0x90_u8, 0x97_u8, 0x97_u8, 0xc_u8, 0x93_u8, 0xe9_u8, 0x20_u8, 0xd1_u8]), 1001_u32)
  WPD_PROPERTY_SMS_MESSAGE_TYPE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xafc25d66_u32, 0xfe0d_u16, 0x4114_u16, StaticArray[0x90_u8, 0x97_u8, 0x97_u8, 0xc_u8, 0x93_u8, 0xe9_u8, 0x20_u8, 0xd1_u8]), 1002_u32)
  WPD_PROPERTY_SMS_TEXT_MESSAGE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xafc25d66_u32, 0xfe0d_u16, 0x4114_u16, StaticArray[0x90_u8, 0x97_u8, 0x97_u8, 0xc_u8, 0x93_u8, 0xe9_u8, 0x20_u8, 0xd1_u8]), 1003_u32)
  WPD_PROPERTY_SMS_BINARY_MESSAGE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xafc25d66_u32, 0xfe0d_u16, 0x4114_u16, StaticArray[0x90_u8, 0x97_u8, 0x97_u8, 0xc_u8, 0x93_u8, 0xe9_u8, 0x20_u8, 0xd1_u8]), 1004_u32)
  WPD_OPTION_SMS_BINARY_MESSAGE_SUPPORTED = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xafc25d66_u32, 0xfe0d_u16, 0x4114_u16, StaticArray[0x90_u8, 0x97_u8, 0x97_u8, 0xc_u8, 0x93_u8, 0xe9_u8, 0x20_u8, 0xd1_u8]), 5001_u32)
  WPD_CATEGORY_STILL_IMAGE_CAPTURE = LibC::GUID.new(0x4fcd6982_u32, 0x22a2_u16, 0x4b05_u16, StaticArray[0xa4_u8, 0x8b_u8, 0x62_u8, 0xd3_u8, 0x8b_u8, 0xf2_u8, 0x7b_u8, 0x32_u8])
  WPD_COMMAND_STILL_IMAGE_CAPTURE_INITIATE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4fcd6982_u32, 0x22a2_u16, 0x4b05_u16, StaticArray[0xa4_u8, 0x8b_u8, 0x62_u8, 0xd3_u8, 0x8b_u8, 0xf2_u8, 0x7b_u8, 0x32_u8]), 2_u32)
  WPD_CATEGORY_MEDIA_CAPTURE = LibC::GUID.new(0x59b433ba_u32, 0xfe44_u16, 0x4d8d_u16, StaticArray[0x80_u8, 0x8c_u8, 0x6b_u8, 0xcb_u8, 0x9b_u8, 0xf_u8, 0x15_u8, 0xe8_u8])
  WPD_COMMAND_MEDIA_CAPTURE_START = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x59b433ba_u32, 0xfe44_u16, 0x4d8d_u16, StaticArray[0x80_u8, 0x8c_u8, 0x6b_u8, 0xcb_u8, 0x9b_u8, 0xf_u8, 0x15_u8, 0xe8_u8]), 2_u32)
  WPD_COMMAND_MEDIA_CAPTURE_STOP = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x59b433ba_u32, 0xfe44_u16, 0x4d8d_u16, StaticArray[0x80_u8, 0x8c_u8, 0x6b_u8, 0xcb_u8, 0x9b_u8, 0xf_u8, 0x15_u8, 0xe8_u8]), 3_u32)
  WPD_COMMAND_MEDIA_CAPTURE_PAUSE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x59b433ba_u32, 0xfe44_u16, 0x4d8d_u16, StaticArray[0x80_u8, 0x8c_u8, 0x6b_u8, 0xcb_u8, 0x9b_u8, 0xf_u8, 0x15_u8, 0xe8_u8]), 4_u32)
  WPD_CATEGORY_DEVICE_HINTS = LibC::GUID.new(0xd5fb92b_u32, 0xcb46_u16, 0x4c4f_u16, StaticArray[0x83_u8, 0x43_u8, 0xb_u8, 0xc3_u8, 0xd3_u8, 0xf1_u8, 0x7c_u8, 0x84_u8])
  WPD_COMMAND_DEVICE_HINTS_GET_CONTENT_LOCATION = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd5fb92b_u32, 0xcb46_u16, 0x4c4f_u16, StaticArray[0x83_u8, 0x43_u8, 0xb_u8, 0xc3_u8, 0xd3_u8, 0xf1_u8, 0x7c_u8, 0x84_u8]), 2_u32)
  WPD_PROPERTY_DEVICE_HINTS_CONTENT_TYPE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd5fb92b_u32, 0xcb46_u16, 0x4c4f_u16, StaticArray[0x83_u8, 0x43_u8, 0xb_u8, 0xc3_u8, 0xd3_u8, 0xf1_u8, 0x7c_u8, 0x84_u8]), 1001_u32)
  WPD_PROPERTY_DEVICE_HINTS_CONTENT_LOCATIONS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd5fb92b_u32, 0xcb46_u16, 0x4c4f_u16, StaticArray[0x83_u8, 0x43_u8, 0xb_u8, 0xc3_u8, 0xd3_u8, 0xf1_u8, 0x7c_u8, 0x84_u8]), 1002_u32)
  WPD_CLASS_EXTENSION_V1 = LibC::GUID.new(0x33fb0d11_u32, 0x64a3_u16, 0x4fac_u16, StaticArray[0xb4_u8, 0xc7_u8, 0x3d_u8, 0xfe_u8, 0xaa_u8, 0x99_u8, 0xb0_u8, 0x51_u8])
  WPD_COMMAND_CLASS_EXTENSION_WRITE_DEVICE_INFORMATION = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x33fb0d11_u32, 0x64a3_u16, 0x4fac_u16, StaticArray[0xb4_u8, 0xc7_u8, 0x3d_u8, 0xfe_u8, 0xaa_u8, 0x99_u8, 0xb0_u8, 0x51_u8]), 2_u32)
  WPD_PROPERTY_CLASS_EXTENSION_DEVICE_INFORMATION_VALUES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x33fb0d11_u32, 0x64a3_u16, 0x4fac_u16, StaticArray[0xb4_u8, 0xc7_u8, 0x3d_u8, 0xfe_u8, 0xaa_u8, 0x99_u8, 0xb0_u8, 0x51_u8]), 1001_u32)
  WPD_PROPERTY_CLASS_EXTENSION_DEVICE_INFORMATION_WRITE_RESULTS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x33fb0d11_u32, 0x64a3_u16, 0x4fac_u16, StaticArray[0xb4_u8, 0xc7_u8, 0x3d_u8, 0xfe_u8, 0xaa_u8, 0x99_u8, 0xb0_u8, 0x51_u8]), 1002_u32)
  WPD_CLASS_EXTENSION_V2 = LibC::GUID.new(0x7f0779b5_u32, 0xfa2b_u16, 0x4766_u16, StaticArray[0x9c_u8, 0xb2_u8, 0xf7_u8, 0x3b_u8, 0xa3_u8, 0xb_u8, 0x67_u8, 0x58_u8])
  WPD_COMMAND_CLASS_EXTENSION_REGISTER_SERVICE_INTERFACES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7f0779b5_u32, 0xfa2b_u16, 0x4766_u16, StaticArray[0x9c_u8, 0xb2_u8, 0xf7_u8, 0x3b_u8, 0xa3_u8, 0xb_u8, 0x67_u8, 0x58_u8]), 2_u32)
  WPD_COMMAND_CLASS_EXTENSION_UNREGISTER_SERVICE_INTERFACES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7f0779b5_u32, 0xfa2b_u16, 0x4766_u16, StaticArray[0x9c_u8, 0xb2_u8, 0xf7_u8, 0x3b_u8, 0xa3_u8, 0xb_u8, 0x67_u8, 0x58_u8]), 3_u32)
  WPD_PROPERTY_CLASS_EXTENSION_SERVICE_OBJECT_ID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7f0779b5_u32, 0xfa2b_u16, 0x4766_u16, StaticArray[0x9c_u8, 0xb2_u8, 0xf7_u8, 0x3b_u8, 0xa3_u8, 0xb_u8, 0x67_u8, 0x58_u8]), 1001_u32)
  WPD_PROPERTY_CLASS_EXTENSION_SERVICE_INTERFACES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7f0779b5_u32, 0xfa2b_u16, 0x4766_u16, StaticArray[0x9c_u8, 0xb2_u8, 0xf7_u8, 0x3b_u8, 0xa3_u8, 0xb_u8, 0x67_u8, 0x58_u8]), 1002_u32)
  WPD_PROPERTY_CLASS_EXTENSION_SERVICE_REGISTRATION_RESULTS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7f0779b5_u32, 0xfa2b_u16, 0x4766_u16, StaticArray[0x9c_u8, 0xb2_u8, 0xf7_u8, 0x3b_u8, 0xa3_u8, 0xb_u8, 0x67_u8, 0x58_u8]), 1003_u32)
  WPD_CATEGORY_NETWORK_CONFIGURATION = LibC::GUID.new(0x78f9c6fc_u32, 0x79b8_u16, 0x473c_u16, StaticArray[0x90_u8, 0x60_u8, 0x6b_u8, 0xd2_u8, 0x3d_u8, 0xd0_u8, 0x72_u8, 0xc4_u8])
  WPD_COMMAND_GENERATE_KEYPAIR = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x78f9c6fc_u32, 0x79b8_u16, 0x473c_u16, StaticArray[0x90_u8, 0x60_u8, 0x6b_u8, 0xd2_u8, 0x3d_u8, 0xd0_u8, 0x72_u8, 0xc4_u8]), 2_u32)
  WPD_COMMAND_COMMIT_KEYPAIR = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x78f9c6fc_u32, 0x79b8_u16, 0x473c_u16, StaticArray[0x90_u8, 0x60_u8, 0x6b_u8, 0xd2_u8, 0x3d_u8, 0xd0_u8, 0x72_u8, 0xc4_u8]), 3_u32)
  WPD_COMMAND_PROCESS_WIRELESS_PROFILE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x78f9c6fc_u32, 0x79b8_u16, 0x473c_u16, StaticArray[0x90_u8, 0x60_u8, 0x6b_u8, 0xd2_u8, 0x3d_u8, 0xd0_u8, 0x72_u8, 0xc4_u8]), 4_u32)
  WPD_PROPERTY_PUBLIC_KEY = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x78f9c6fc_u32, 0x79b8_u16, 0x473c_u16, StaticArray[0x90_u8, 0x60_u8, 0x6b_u8, 0xd2_u8, 0x3d_u8, 0xd0_u8, 0x72_u8, 0xc4_u8]), 1001_u32)
  WPD_CATEGORY_SERVICE_COMMON = LibC::GUID.new(0x322f071d_u32, 0x36ef_u16, 0x477f_u16, StaticArray[0xb4_u8, 0xb5_u8, 0x6f_u8, 0x52_u8, 0xd7_u8, 0x34_u8, 0xba_u8, 0xee_u8])
  WPD_COMMAND_SERVICE_COMMON_GET_SERVICE_OBJECT_ID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x322f071d_u32, 0x36ef_u16, 0x477f_u16, StaticArray[0xb4_u8, 0xb5_u8, 0x6f_u8, 0x52_u8, 0xd7_u8, 0x34_u8, 0xba_u8, 0xee_u8]), 2_u32)
  WPD_PROPERTY_SERVICE_OBJECT_ID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x322f071d_u32, 0x36ef_u16, 0x477f_u16, StaticArray[0xb4_u8, 0xb5_u8, 0x6f_u8, 0x52_u8, 0xd7_u8, 0x34_u8, 0xba_u8, 0xee_u8]), 1001_u32)
  WPD_CATEGORY_SERVICE_CAPABILITIES = LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8])
  WPD_COMMAND_SERVICE_CAPABILITIES_GET_SUPPORTED_METHODS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 2_u32)
  WPD_COMMAND_SERVICE_CAPABILITIES_GET_SUPPORTED_METHODS_BY_FORMAT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 3_u32)
  WPD_COMMAND_SERVICE_CAPABILITIES_GET_METHOD_ATTRIBUTES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 4_u32)
  WPD_COMMAND_SERVICE_CAPABILITIES_GET_METHOD_PARAMETER_ATTRIBUTES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 5_u32)
  WPD_COMMAND_SERVICE_CAPABILITIES_GET_SUPPORTED_FORMATS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 6_u32)
  WPD_COMMAND_SERVICE_CAPABILITIES_GET_FORMAT_ATTRIBUTES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 7_u32)
  WPD_COMMAND_SERVICE_CAPABILITIES_GET_SUPPORTED_FORMAT_PROPERTIES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 8_u32)
  WPD_COMMAND_SERVICE_CAPABILITIES_GET_FORMAT_PROPERTY_ATTRIBUTES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 9_u32)
  WPD_COMMAND_SERVICE_CAPABILITIES_GET_SUPPORTED_EVENTS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 10_u32)
  WPD_COMMAND_SERVICE_CAPABILITIES_GET_EVENT_ATTRIBUTES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 11_u32)
  WPD_COMMAND_SERVICE_CAPABILITIES_GET_EVENT_PARAMETER_ATTRIBUTES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 12_u32)
  WPD_COMMAND_SERVICE_CAPABILITIES_GET_INHERITED_SERVICES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 13_u32)
  WPD_COMMAND_SERVICE_CAPABILITIES_GET_FORMAT_RENDERING_PROFILES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 14_u32)
  WPD_COMMAND_SERVICE_CAPABILITIES_GET_SUPPORTED_COMMANDS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 15_u32)
  WPD_COMMAND_SERVICE_CAPABILITIES_GET_COMMAND_OPTIONS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 16_u32)
  WPD_PROPERTY_SERVICE_CAPABILITIES_SUPPORTED_METHODS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 1001_u32)
  WPD_PROPERTY_SERVICE_CAPABILITIES_FORMAT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 1002_u32)
  WPD_PROPERTY_SERVICE_CAPABILITIES_METHOD = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 1003_u32)
  WPD_PROPERTY_SERVICE_CAPABILITIES_METHOD_ATTRIBUTES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 1004_u32)
  WPD_PROPERTY_SERVICE_CAPABILITIES_PARAMETER = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 1005_u32)
  WPD_PROPERTY_SERVICE_CAPABILITIES_PARAMETER_ATTRIBUTES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 1006_u32)
  WPD_PROPERTY_SERVICE_CAPABILITIES_FORMATS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 1007_u32)
  WPD_PROPERTY_SERVICE_CAPABILITIES_FORMAT_ATTRIBUTES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 1008_u32)
  WPD_PROPERTY_SERVICE_CAPABILITIES_PROPERTY_KEYS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 1009_u32)
  WPD_PROPERTY_SERVICE_CAPABILITIES_PROPERTY_ATTRIBUTES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 1010_u32)
  WPD_PROPERTY_SERVICE_CAPABILITIES_SUPPORTED_EVENTS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 1011_u32)
  WPD_PROPERTY_SERVICE_CAPABILITIES_EVENT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 1012_u32)
  WPD_PROPERTY_SERVICE_CAPABILITIES_EVENT_ATTRIBUTES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 1013_u32)
  WPD_PROPERTY_SERVICE_CAPABILITIES_INHERITANCE_TYPE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 1014_u32)
  WPD_PROPERTY_SERVICE_CAPABILITIES_INHERITED_SERVICES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 1015_u32)
  WPD_PROPERTY_SERVICE_CAPABILITIES_RENDERING_PROFILES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 1016_u32)
  WPD_PROPERTY_SERVICE_CAPABILITIES_SUPPORTED_COMMANDS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 1017_u32)
  WPD_PROPERTY_SERVICE_CAPABILITIES_COMMAND = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 1018_u32)
  WPD_PROPERTY_SERVICE_CAPABILITIES_COMMAND_OPTIONS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 1019_u32)
  WPD_CATEGORY_SERVICE_METHODS = LibC::GUID.new(0x2d521ca8_u32, 0xc1b0_u16, 0x4268_u16, StaticArray[0xa3_u8, 0x42_u8, 0xcf_u8, 0x19_u8, 0x32_u8, 0x15_u8, 0x69_u8, 0xbc_u8])
  WPD_COMMAND_SERVICE_METHODS_START_INVOKE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2d521ca8_u32, 0xc1b0_u16, 0x4268_u16, StaticArray[0xa3_u8, 0x42_u8, 0xcf_u8, 0x19_u8, 0x32_u8, 0x15_u8, 0x69_u8, 0xbc_u8]), 2_u32)
  WPD_COMMAND_SERVICE_METHODS_CANCEL_INVOKE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2d521ca8_u32, 0xc1b0_u16, 0x4268_u16, StaticArray[0xa3_u8, 0x42_u8, 0xcf_u8, 0x19_u8, 0x32_u8, 0x15_u8, 0x69_u8, 0xbc_u8]), 3_u32)
  WPD_COMMAND_SERVICE_METHODS_END_INVOKE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2d521ca8_u32, 0xc1b0_u16, 0x4268_u16, StaticArray[0xa3_u8, 0x42_u8, 0xcf_u8, 0x19_u8, 0x32_u8, 0x15_u8, 0x69_u8, 0xbc_u8]), 4_u32)
  WPD_PROPERTY_SERVICE_METHOD = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2d521ca8_u32, 0xc1b0_u16, 0x4268_u16, StaticArray[0xa3_u8, 0x42_u8, 0xcf_u8, 0x19_u8, 0x32_u8, 0x15_u8, 0x69_u8, 0xbc_u8]), 1001_u32)
  WPD_PROPERTY_SERVICE_METHOD_PARAMETER_VALUES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2d521ca8_u32, 0xc1b0_u16, 0x4268_u16, StaticArray[0xa3_u8, 0x42_u8, 0xcf_u8, 0x19_u8, 0x32_u8, 0x15_u8, 0x69_u8, 0xbc_u8]), 1002_u32)
  WPD_PROPERTY_SERVICE_METHOD_RESULT_VALUES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2d521ca8_u32, 0xc1b0_u16, 0x4268_u16, StaticArray[0xa3_u8, 0x42_u8, 0xcf_u8, 0x19_u8, 0x32_u8, 0x15_u8, 0x69_u8, 0xbc_u8]), 1003_u32)
  WPD_PROPERTY_SERVICE_METHOD_CONTEXT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2d521ca8_u32, 0xc1b0_u16, 0x4268_u16, StaticArray[0xa3_u8, 0x42_u8, 0xcf_u8, 0x19_u8, 0x32_u8, 0x15_u8, 0x69_u8, 0xbc_u8]), 1004_u32)
  WPD_PROPERTY_SERVICE_METHOD_HRESULT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2d521ca8_u32, 0xc1b0_u16, 0x4268_u16, StaticArray[0xa3_u8, 0x42_u8, 0xcf_u8, 0x19_u8, 0x32_u8, 0x15_u8, 0x69_u8, 0xbc_u8]), 1005_u32)
  WPD_RESOURCE_DEFAULT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe81e79be_u32, 0x34f0_u16, 0x41bf_u16, StaticArray[0xb5_u8, 0x3f_u8, 0xf1_u8, 0xa0_u8, 0x6a_u8, 0xe8_u8, 0x78_u8, 0x42_u8]), 0_u32)
  WPD_RESOURCE_CONTACT_PHOTO = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2c4d6803_u32, 0x80ea_u16, 0x4580_u16, StaticArray[0xaf_u8, 0x9a_u8, 0x5b_u8, 0xe1_u8, 0xa2_u8, 0x3e_u8, 0xdd_u8, 0xcb_u8]), 0_u32)
  WPD_RESOURCE_THUMBNAIL = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc7c407ba_u32, 0x98fa_u16, 0x46b5_u16, StaticArray[0x99_u8, 0x60_u8, 0x23_u8, 0xfe_u8, 0xc1_u8, 0x24_u8, 0xcf_u8, 0xde_u8]), 0_u32)
  WPD_RESOURCE_ICON = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf195fed8_u32, 0xaa28_u16, 0x4ee3_u16, StaticArray[0xb1_u8, 0x53_u8, 0xe1_u8, 0x82_u8, 0xdd_u8, 0x5e_u8, 0xdc_u8, 0x39_u8]), 0_u32)
  WPD_RESOURCE_AUDIO_CLIP = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x3bc13982_u32, 0x85b1_u16, 0x48e0_u16, StaticArray[0x95_u8, 0xa6_u8, 0x8d_u8, 0x3a_u8, 0xd0_u8, 0x6b_u8, 0xe1_u8, 0x17_u8]), 0_u32)
  WPD_RESOURCE_ALBUM_ART = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf02aa354_u32, 0x2300_u16, 0x4e2d_u16, StaticArray[0xa1_u8, 0xb9_u8, 0x3b_u8, 0x67_u8, 0x30_u8, 0xf7_u8, 0xfa_u8, 0x21_u8]), 0_u32)
  WPD_RESOURCE_GENERIC = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb9b9f515_u32, 0xba70_u16, 0x4647_u16, StaticArray[0x94_u8, 0xdc_u8, 0xfa_u8, 0x49_u8, 0x25_u8, 0xe9_u8, 0x5a_u8, 0x7_u8]), 0_u32)
  WPD_RESOURCE_VIDEO_CLIP = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb566ee42_u32, 0x6368_u16, 0x4290_u16, StaticArray[0x86_u8, 0x62_u8, 0x70_u8, 0x18_u8, 0x2f_u8, 0xb7_u8, 0x9f_u8, 0x20_u8]), 0_u32)
  WPD_RESOURCE_BRANDING_ART = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb633b1ae_u32, 0x6caf_u16, 0x4a87_u16, StaticArray[0x95_u8, 0x89_u8, 0x22_u8, 0xde_u8, 0xd6_u8, 0xdd_u8, 0x58_u8, 0x99_u8]), 0_u32)
  WPD_OBJECT_FORMAT_PROPERTIES_ONLY = LibC::GUID.new(0x30010000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_UNSPECIFIED = LibC::GUID.new(0x30000000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_SCRIPT = LibC::GUID.new(0x30020000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_EXECUTABLE = LibC::GUID.new(0x30030000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_TEXT = LibC::GUID.new(0x30040000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_HTML = LibC::GUID.new(0x30050000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_DPOF = LibC::GUID.new(0x30060000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_AIFF = LibC::GUID.new(0x30070000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_WAVE = LibC::GUID.new(0x30080000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_MP3 = LibC::GUID.new(0x30090000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_AVI = LibC::GUID.new(0x300a0000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_MPEG = LibC::GUID.new(0x300b0000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_ASF = LibC::GUID.new(0x300c0000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_EXIF = LibC::GUID.new(0x38010000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_TIFFEP = LibC::GUID.new(0x38020000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_FLASHPIX = LibC::GUID.new(0x38030000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_BMP = LibC::GUID.new(0x38040000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_CIFF = LibC::GUID.new(0x38050000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_GIF = LibC::GUID.new(0x38070000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_JFIF = LibC::GUID.new(0x38080000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_PCD = LibC::GUID.new(0x38090000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_PICT = LibC::GUID.new(0x380a0000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_PNG = LibC::GUID.new(0x380b0000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_TIFF = LibC::GUID.new(0x380d0000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_TIFFIT = LibC::GUID.new(0x380e0000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_JP2 = LibC::GUID.new(0x380f0000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_JPX = LibC::GUID.new(0x38100000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_WBMP = LibC::GUID.new(0xb8030000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_JPEGXR = LibC::GUID.new(0xb8040000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_WINDOWSIMAGEFORMAT = LibC::GUID.new(0xb8810000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_WMA = LibC::GUID.new(0xb9010000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_WMV = LibC::GUID.new(0xb9810000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_WPLPLAYLIST = LibC::GUID.new(0xba100000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_M3UPLAYLIST = LibC::GUID.new(0xba110000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_MPLPLAYLIST = LibC::GUID.new(0xba120000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_ASXPLAYLIST = LibC::GUID.new(0xba130000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_PLSPLAYLIST = LibC::GUID.new(0xba140000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_ABSTRACT_CONTACT_GROUP = LibC::GUID.new(0xba060000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_ABSTRACT_MEDIA_CAST = LibC::GUID.new(0xba0b0000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_VCALENDAR1 = LibC::GUID.new(0xbe020000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_ICALENDAR = LibC::GUID.new(0xbe030000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_ABSTRACT_CONTACT = LibC::GUID.new(0xbb810000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_VCARD2 = LibC::GUID.new(0xbb820000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_VCARD3 = LibC::GUID.new(0xbb830000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_XML = LibC::GUID.new(0xba820000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_AAC = LibC::GUID.new(0xb9030000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_AUDIBLE = LibC::GUID.new(0xb9040000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_FLAC = LibC::GUID.new(0xb9060000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_QCELP = LibC::GUID.new(0xb9070000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_AMR = LibC::GUID.new(0xb9080000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_OGG = LibC::GUID.new(0xb9020000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_MP4 = LibC::GUID.new(0xb9820000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_MP2 = LibC::GUID.new(0xb9830000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_MICROSOFT_WORD = LibC::GUID.new(0xba830000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_MHT_COMPILED_HTML = LibC::GUID.new(0xba840000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_MICROSOFT_EXCEL = LibC::GUID.new(0xba850000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_MICROSOFT_POWERPOINT = LibC::GUID.new(0xba860000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_3GP = LibC::GUID.new(0xb9840000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_3G2 = LibC::GUID.new(0xb9850000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_AVCHD = LibC::GUID.new(0xb9860000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_ATSCTS = LibC::GUID.new(0xb9870000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_DVBTS = LibC::GUID.new(0xb9880000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_FORMAT_MKV = LibC::GUID.new(0xb9900000_u32, 0xae6c_u16, 0x4804_u16, StaticArray[0x98_u8, 0xba_u8, 0xc5_u8, 0x7b_u8, 0x46_u8, 0x96_u8, 0x5f_u8, 0xe7_u8])
  WPD_OBJECT_ID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 2_u32)
  WPD_OBJECT_PARENT_ID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 3_u32)
  WPD_OBJECT_NAME = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 4_u32)
  WPD_OBJECT_PERSISTENT_UNIQUE_ID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 5_u32)
  WPD_OBJECT_FORMAT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 6_u32)
  WPD_OBJECT_ISHIDDEN = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 9_u32)
  WPD_OBJECT_ISSYSTEM = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 10_u32)
  WPD_OBJECT_SIZE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 11_u32)
  WPD_OBJECT_ORIGINAL_FILE_NAME = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 12_u32)
  WPD_OBJECT_NON_CONSUMABLE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 13_u32)
  WPD_OBJECT_KEYWORDS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 15_u32)
  WPD_OBJECT_SYNC_ID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 16_u32)
  WPD_OBJECT_IS_DRM_PROTECTED = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 17_u32)
  WPD_OBJECT_DATE_CREATED = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 18_u32)
  WPD_OBJECT_DATE_MODIFIED = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 19_u32)
  WPD_OBJECT_DATE_AUTHORED = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 20_u32)
  WPD_OBJECT_BACK_REFERENCES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 21_u32)
  WPD_OBJECT_CAN_DELETE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 26_u32)
  WPD_OBJECT_LANGUAGE_LOCALE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 27_u32)
  WPD_FOLDER_OBJECT_PROPERTIES_V1 = LibC::GUID.new(0x7e9a7abf_u32, 0xe568_u16, 0x4b34_u16, StaticArray[0xaa_u8, 0x2f_u8, 0x13_u8, 0xbb_u8, 0x12_u8, 0xab_u8, 0x17_u8, 0x7d_u8])
  WPD_FOLDER_CONTENT_TYPES_ALLOWED = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7e9a7abf_u32, 0xe568_u16, 0x4b34_u16, StaticArray[0xaa_u8, 0x2f_u8, 0x13_u8, 0xbb_u8, 0x12_u8, 0xab_u8, 0x17_u8, 0x7d_u8]), 2_u32)
  WPD_IMAGE_OBJECT_PROPERTIES_V1 = LibC::GUID.new(0x63d64908_u32, 0x9fa1_u16, 0x479f_u16, StaticArray[0x85_u8, 0xba_u8, 0x99_u8, 0x52_u8, 0x21_u8, 0x64_u8, 0x47_u8, 0xdb_u8])
  WPD_IMAGE_BITDEPTH = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x63d64908_u32, 0x9fa1_u16, 0x479f_u16, StaticArray[0x85_u8, 0xba_u8, 0x99_u8, 0x52_u8, 0x21_u8, 0x64_u8, 0x47_u8, 0xdb_u8]), 3_u32)
  WPD_IMAGE_CROPPED_STATUS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x63d64908_u32, 0x9fa1_u16, 0x479f_u16, StaticArray[0x85_u8, 0xba_u8, 0x99_u8, 0x52_u8, 0x21_u8, 0x64_u8, 0x47_u8, 0xdb_u8]), 4_u32)
  WPD_IMAGE_COLOR_CORRECTED_STATUS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x63d64908_u32, 0x9fa1_u16, 0x479f_u16, StaticArray[0x85_u8, 0xba_u8, 0x99_u8, 0x52_u8, 0x21_u8, 0x64_u8, 0x47_u8, 0xdb_u8]), 5_u32)
  WPD_IMAGE_FNUMBER = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x63d64908_u32, 0x9fa1_u16, 0x479f_u16, StaticArray[0x85_u8, 0xba_u8, 0x99_u8, 0x52_u8, 0x21_u8, 0x64_u8, 0x47_u8, 0xdb_u8]), 6_u32)
  WPD_IMAGE_EXPOSURE_TIME = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x63d64908_u32, 0x9fa1_u16, 0x479f_u16, StaticArray[0x85_u8, 0xba_u8, 0x99_u8, 0x52_u8, 0x21_u8, 0x64_u8, 0x47_u8, 0xdb_u8]), 7_u32)
  WPD_IMAGE_EXPOSURE_INDEX = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x63d64908_u32, 0x9fa1_u16, 0x479f_u16, StaticArray[0x85_u8, 0xba_u8, 0x99_u8, 0x52_u8, 0x21_u8, 0x64_u8, 0x47_u8, 0xdb_u8]), 8_u32)
  WPD_IMAGE_HORIZONTAL_RESOLUTION = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x63d64908_u32, 0x9fa1_u16, 0x479f_u16, StaticArray[0x85_u8, 0xba_u8, 0x99_u8, 0x52_u8, 0x21_u8, 0x64_u8, 0x47_u8, 0xdb_u8]), 9_u32)
  WPD_IMAGE_VERTICAL_RESOLUTION = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x63d64908_u32, 0x9fa1_u16, 0x479f_u16, StaticArray[0x85_u8, 0xba_u8, 0x99_u8, 0x52_u8, 0x21_u8, 0x64_u8, 0x47_u8, 0xdb_u8]), 10_u32)
  WPD_DOCUMENT_OBJECT_PROPERTIES_V1 = LibC::GUID.new(0xb110203_u32, 0xeb95_u16, 0x4f02_u16, StaticArray[0x93_u8, 0xe0_u8, 0x97_u8, 0xc6_u8, 0x31_u8, 0x49_u8, 0x3a_u8, 0xd5_u8])
  WPD_MEDIA_PROPERTIES_V1 = LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8])
  WPD_MEDIA_TOTAL_BITRATE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 2_u32)
  WPD_MEDIA_BITRATE_TYPE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 3_u32)
  WPD_MEDIA_COPYRIGHT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 4_u32)
  WPD_MEDIA_SUBSCRIPTION_CONTENT_ID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 5_u32)
  WPD_MEDIA_USE_COUNT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 6_u32)
  WPD_MEDIA_SKIP_COUNT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 7_u32)
  WPD_MEDIA_LAST_ACCESSED_TIME = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 8_u32)
  WPD_MEDIA_PARENTAL_RATING = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 9_u32)
  WPD_MEDIA_META_GENRE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 10_u32)
  WPD_MEDIA_COMPOSER = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 11_u32)
  WPD_MEDIA_EFFECTIVE_RATING = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 12_u32)
  WPD_MEDIA_SUB_TITLE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 13_u32)
  WPD_MEDIA_RELEASE_DATE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 14_u32)
  WPD_MEDIA_SAMPLE_RATE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 15_u32)
  WPD_MEDIA_STAR_RATING = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 16_u32)
  WPD_MEDIA_USER_EFFECTIVE_RATING = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 17_u32)
  WPD_MEDIA_TITLE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 18_u32)
  WPD_MEDIA_DURATION = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 19_u32)
  WPD_MEDIA_BUY_NOW = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 20_u32)
  WPD_MEDIA_ENCODING_PROFILE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 21_u32)
  WPD_MEDIA_WIDTH = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 22_u32)
  WPD_MEDIA_HEIGHT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 23_u32)
  WPD_MEDIA_ARTIST = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 24_u32)
  WPD_MEDIA_ALBUM_ARTIST = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 25_u32)
  WPD_MEDIA_OWNER = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 26_u32)
  WPD_MEDIA_MANAGING_EDITOR = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 27_u32)
  WPD_MEDIA_WEBMASTER = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 28_u32)
  WPD_MEDIA_SOURCE_URL = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 29_u32)
  WPD_MEDIA_DESTINATION_URL = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 30_u32)
  WPD_MEDIA_DESCRIPTION = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 31_u32)
  WPD_MEDIA_GENRE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 32_u32)
  WPD_MEDIA_TIME_BOOKMARK = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 33_u32)
  WPD_MEDIA_OBJECT_BOOKMARK = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 34_u32)
  WPD_MEDIA_LAST_BUILD_DATE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 35_u32)
  WPD_MEDIA_BYTE_BOOKMARK = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 36_u32)
  WPD_MEDIA_TIME_TO_LIVE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 37_u32)
  WPD_MEDIA_GUID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 38_u32)
  WPD_MEDIA_SUB_DESCRIPTION = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 39_u32)
  WPD_MEDIA_AUDIO_ENCODING_PROFILE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 49_u32)
  WPD_CONTACT_OBJECT_PROPERTIES_V1 = LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8])
  WPD_CONTACT_DISPLAY_NAME = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 2_u32)
  WPD_CONTACT_FIRST_NAME = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 3_u32)
  WPD_CONTACT_MIDDLE_NAMES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 4_u32)
  WPD_CONTACT_LAST_NAME = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 5_u32)
  WPD_CONTACT_PREFIX = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 6_u32)
  WPD_CONTACT_SUFFIX = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 7_u32)
  WPD_CONTACT_PHONETIC_FIRST_NAME = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 8_u32)
  WPD_CONTACT_PHONETIC_LAST_NAME = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 9_u32)
  WPD_CONTACT_PERSONAL_FULL_POSTAL_ADDRESS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 10_u32)
  WPD_CONTACT_PERSONAL_POSTAL_ADDRESS_LINE1 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 11_u32)
  WPD_CONTACT_PERSONAL_POSTAL_ADDRESS_LINE2 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 12_u32)
  WPD_CONTACT_PERSONAL_POSTAL_ADDRESS_CITY = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 13_u32)
  WPD_CONTACT_PERSONAL_POSTAL_ADDRESS_REGION = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 14_u32)
  WPD_CONTACT_PERSONAL_POSTAL_ADDRESS_POSTAL_CODE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 15_u32)
  WPD_CONTACT_PERSONAL_POSTAL_ADDRESS_COUNTRY = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 16_u32)
  WPD_CONTACT_BUSINESS_FULL_POSTAL_ADDRESS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 17_u32)
  WPD_CONTACT_BUSINESS_POSTAL_ADDRESS_LINE1 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 18_u32)
  WPD_CONTACT_BUSINESS_POSTAL_ADDRESS_LINE2 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 19_u32)
  WPD_CONTACT_BUSINESS_POSTAL_ADDRESS_CITY = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 20_u32)
  WPD_CONTACT_BUSINESS_POSTAL_ADDRESS_REGION = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 21_u32)
  WPD_CONTACT_BUSINESS_POSTAL_ADDRESS_POSTAL_CODE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 22_u32)
  WPD_CONTACT_BUSINESS_POSTAL_ADDRESS_COUNTRY = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 23_u32)
  WPD_CONTACT_OTHER_FULL_POSTAL_ADDRESS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 24_u32)
  WPD_CONTACT_OTHER_POSTAL_ADDRESS_LINE1 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 25_u32)
  WPD_CONTACT_OTHER_POSTAL_ADDRESS_LINE2 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 26_u32)
  WPD_CONTACT_OTHER_POSTAL_ADDRESS_CITY = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 27_u32)
  WPD_CONTACT_OTHER_POSTAL_ADDRESS_REGION = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 28_u32)
  WPD_CONTACT_OTHER_POSTAL_ADDRESS_POSTAL_CODE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 29_u32)
  WPD_CONTACT_OTHER_POSTAL_ADDRESS_POSTAL_COUNTRY = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 30_u32)
  WPD_CONTACT_PRIMARY_EMAIL_ADDRESS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 31_u32)
  WPD_CONTACT_PERSONAL_EMAIL = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 32_u32)
  WPD_CONTACT_PERSONAL_EMAIL2 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 33_u32)
  WPD_CONTACT_BUSINESS_EMAIL = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 34_u32)
  WPD_CONTACT_BUSINESS_EMAIL2 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 35_u32)
  WPD_CONTACT_OTHER_EMAILS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 36_u32)
  WPD_CONTACT_PRIMARY_PHONE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 37_u32)
  WPD_CONTACT_PERSONAL_PHONE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 38_u32)
  WPD_CONTACT_PERSONAL_PHONE2 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 39_u32)
  WPD_CONTACT_BUSINESS_PHONE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 40_u32)
  WPD_CONTACT_BUSINESS_PHONE2 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 41_u32)
  WPD_CONTACT_MOBILE_PHONE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 42_u32)
  WPD_CONTACT_MOBILE_PHONE2 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 43_u32)
  WPD_CONTACT_PERSONAL_FAX = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 44_u32)
  WPD_CONTACT_BUSINESS_FAX = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 45_u32)
  WPD_CONTACT_PAGER = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 46_u32)
  WPD_CONTACT_OTHER_PHONES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 47_u32)
  WPD_CONTACT_PRIMARY_WEB_ADDRESS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 48_u32)
  WPD_CONTACT_PERSONAL_WEB_ADDRESS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 49_u32)
  WPD_CONTACT_BUSINESS_WEB_ADDRESS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 50_u32)
  WPD_CONTACT_INSTANT_MESSENGER = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 51_u32)
  WPD_CONTACT_INSTANT_MESSENGER2 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 52_u32)
  WPD_CONTACT_INSTANT_MESSENGER3 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 53_u32)
  WPD_CONTACT_COMPANY_NAME = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 54_u32)
  WPD_CONTACT_PHONETIC_COMPANY_NAME = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 55_u32)
  WPD_CONTACT_ROLE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 56_u32)
  WPD_CONTACT_BIRTHDATE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 57_u32)
  WPD_CONTACT_PRIMARY_FAX = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 58_u32)
  WPD_CONTACT_SPOUSE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 59_u32)
  WPD_CONTACT_CHILDREN = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 60_u32)
  WPD_CONTACT_ASSISTANT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 61_u32)
  WPD_CONTACT_ANNIVERSARY_DATE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 62_u32)
  WPD_CONTACT_RINGTONE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 63_u32)
  WPD_MUSIC_OBJECT_PROPERTIES_V1 = LibC::GUID.new(0xb324f56a_u32, 0xdc5d_u16, 0x46e5_u16, StaticArray[0xb6_u8, 0xdf_u8, 0xd2_u8, 0xea_u8, 0x41_u8, 0x48_u8, 0x88_u8, 0xc6_u8])
  WPD_MUSIC_ALBUM = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb324f56a_u32, 0xdc5d_u16, 0x46e5_u16, StaticArray[0xb6_u8, 0xdf_u8, 0xd2_u8, 0xea_u8, 0x41_u8, 0x48_u8, 0x88_u8, 0xc6_u8]), 3_u32)
  WPD_MUSIC_TRACK = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb324f56a_u32, 0xdc5d_u16, 0x46e5_u16, StaticArray[0xb6_u8, 0xdf_u8, 0xd2_u8, 0xea_u8, 0x41_u8, 0x48_u8, 0x88_u8, 0xc6_u8]), 4_u32)
  WPD_MUSIC_LYRICS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb324f56a_u32, 0xdc5d_u16, 0x46e5_u16, StaticArray[0xb6_u8, 0xdf_u8, 0xd2_u8, 0xea_u8, 0x41_u8, 0x48_u8, 0x88_u8, 0xc6_u8]), 6_u32)
  WPD_MUSIC_MOOD = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb324f56a_u32, 0xdc5d_u16, 0x46e5_u16, StaticArray[0xb6_u8, 0xdf_u8, 0xd2_u8, 0xea_u8, 0x41_u8, 0x48_u8, 0x88_u8, 0xc6_u8]), 8_u32)
  WPD_AUDIO_BITRATE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb324f56a_u32, 0xdc5d_u16, 0x46e5_u16, StaticArray[0xb6_u8, 0xdf_u8, 0xd2_u8, 0xea_u8, 0x41_u8, 0x48_u8, 0x88_u8, 0xc6_u8]), 9_u32)
  WPD_AUDIO_CHANNEL_COUNT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb324f56a_u32, 0xdc5d_u16, 0x46e5_u16, StaticArray[0xb6_u8, 0xdf_u8, 0xd2_u8, 0xea_u8, 0x41_u8, 0x48_u8, 0x88_u8, 0xc6_u8]), 10_u32)
  WPD_AUDIO_FORMAT_CODE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb324f56a_u32, 0xdc5d_u16, 0x46e5_u16, StaticArray[0xb6_u8, 0xdf_u8, 0xd2_u8, 0xea_u8, 0x41_u8, 0x48_u8, 0x88_u8, 0xc6_u8]), 11_u32)
  WPD_AUDIO_BIT_DEPTH = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb324f56a_u32, 0xdc5d_u16, 0x46e5_u16, StaticArray[0xb6_u8, 0xdf_u8, 0xd2_u8, 0xea_u8, 0x41_u8, 0x48_u8, 0x88_u8, 0xc6_u8]), 12_u32)
  WPD_AUDIO_BLOCK_ALIGNMENT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb324f56a_u32, 0xdc5d_u16, 0x46e5_u16, StaticArray[0xb6_u8, 0xdf_u8, 0xd2_u8, 0xea_u8, 0x41_u8, 0x48_u8, 0x88_u8, 0xc6_u8]), 13_u32)
  WPD_VIDEO_OBJECT_PROPERTIES_V1 = LibC::GUID.new(0x346f2163_u32, 0xf998_u16, 0x4146_u16, StaticArray[0x8b_u8, 0x1_u8, 0xd1_u8, 0x9b_u8, 0x4c_u8, 0x0_u8, 0xde_u8, 0x9a_u8])
  WPD_VIDEO_AUTHOR = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x346f2163_u32, 0xf998_u16, 0x4146_u16, StaticArray[0x8b_u8, 0x1_u8, 0xd1_u8, 0x9b_u8, 0x4c_u8, 0x0_u8, 0xde_u8, 0x9a_u8]), 2_u32)
  WPD_VIDEO_RECORDEDTV_STATION_NAME = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x346f2163_u32, 0xf998_u16, 0x4146_u16, StaticArray[0x8b_u8, 0x1_u8, 0xd1_u8, 0x9b_u8, 0x4c_u8, 0x0_u8, 0xde_u8, 0x9a_u8]), 4_u32)
  WPD_VIDEO_RECORDEDTV_CHANNEL_NUMBER = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x346f2163_u32, 0xf998_u16, 0x4146_u16, StaticArray[0x8b_u8, 0x1_u8, 0xd1_u8, 0x9b_u8, 0x4c_u8, 0x0_u8, 0xde_u8, 0x9a_u8]), 5_u32)
  WPD_VIDEO_RECORDEDTV_REPEAT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x346f2163_u32, 0xf998_u16, 0x4146_u16, StaticArray[0x8b_u8, 0x1_u8, 0xd1_u8, 0x9b_u8, 0x4c_u8, 0x0_u8, 0xde_u8, 0x9a_u8]), 7_u32)
  WPD_VIDEO_BUFFER_SIZE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x346f2163_u32, 0xf998_u16, 0x4146_u16, StaticArray[0x8b_u8, 0x1_u8, 0xd1_u8, 0x9b_u8, 0x4c_u8, 0x0_u8, 0xde_u8, 0x9a_u8]), 8_u32)
  WPD_VIDEO_CREDITS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x346f2163_u32, 0xf998_u16, 0x4146_u16, StaticArray[0x8b_u8, 0x1_u8, 0xd1_u8, 0x9b_u8, 0x4c_u8, 0x0_u8, 0xde_u8, 0x9a_u8]), 9_u32)
  WPD_VIDEO_KEY_FRAME_DISTANCE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x346f2163_u32, 0xf998_u16, 0x4146_u16, StaticArray[0x8b_u8, 0x1_u8, 0xd1_u8, 0x9b_u8, 0x4c_u8, 0x0_u8, 0xde_u8, 0x9a_u8]), 10_u32)
  WPD_VIDEO_QUALITY_SETTING = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x346f2163_u32, 0xf998_u16, 0x4146_u16, StaticArray[0x8b_u8, 0x1_u8, 0xd1_u8, 0x9b_u8, 0x4c_u8, 0x0_u8, 0xde_u8, 0x9a_u8]), 11_u32)
  WPD_VIDEO_SCAN_TYPE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x346f2163_u32, 0xf998_u16, 0x4146_u16, StaticArray[0x8b_u8, 0x1_u8, 0xd1_u8, 0x9b_u8, 0x4c_u8, 0x0_u8, 0xde_u8, 0x9a_u8]), 12_u32)
  WPD_VIDEO_BITRATE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x346f2163_u32, 0xf998_u16, 0x4146_u16, StaticArray[0x8b_u8, 0x1_u8, 0xd1_u8, 0x9b_u8, 0x4c_u8, 0x0_u8, 0xde_u8, 0x9a_u8]), 13_u32)
  WPD_VIDEO_FOURCC_CODE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x346f2163_u32, 0xf998_u16, 0x4146_u16, StaticArray[0x8b_u8, 0x1_u8, 0xd1_u8, 0x9b_u8, 0x4c_u8, 0x0_u8, 0xde_u8, 0x9a_u8]), 14_u32)
  WPD_VIDEO_FRAMERATE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x346f2163_u32, 0xf998_u16, 0x4146_u16, StaticArray[0x8b_u8, 0x1_u8, 0xd1_u8, 0x9b_u8, 0x4c_u8, 0x0_u8, 0xde_u8, 0x9a_u8]), 15_u32)
  WPD_COMMON_INFORMATION_OBJECT_PROPERTIES_V1 = LibC::GUID.new(0xb28ae94b_u32, 0x5a4_u16, 0x4e8e_u16, StaticArray[0xbe_u8, 0x1_u8, 0x72_u8, 0xcc_u8, 0x7e_u8, 0x9_u8, 0x9d_u8, 0x8f_u8])
  WPD_COMMON_INFORMATION_SUBJECT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb28ae94b_u32, 0x5a4_u16, 0x4e8e_u16, StaticArray[0xbe_u8, 0x1_u8, 0x72_u8, 0xcc_u8, 0x7e_u8, 0x9_u8, 0x9d_u8, 0x8f_u8]), 2_u32)
  WPD_COMMON_INFORMATION_BODY_TEXT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb28ae94b_u32, 0x5a4_u16, 0x4e8e_u16, StaticArray[0xbe_u8, 0x1_u8, 0x72_u8, 0xcc_u8, 0x7e_u8, 0x9_u8, 0x9d_u8, 0x8f_u8]), 3_u32)
  WPD_COMMON_INFORMATION_PRIORITY = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb28ae94b_u32, 0x5a4_u16, 0x4e8e_u16, StaticArray[0xbe_u8, 0x1_u8, 0x72_u8, 0xcc_u8, 0x7e_u8, 0x9_u8, 0x9d_u8, 0x8f_u8]), 4_u32)
  WPD_COMMON_INFORMATION_START_DATETIME = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb28ae94b_u32, 0x5a4_u16, 0x4e8e_u16, StaticArray[0xbe_u8, 0x1_u8, 0x72_u8, 0xcc_u8, 0x7e_u8, 0x9_u8, 0x9d_u8, 0x8f_u8]), 5_u32)
  WPD_COMMON_INFORMATION_END_DATETIME = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb28ae94b_u32, 0x5a4_u16, 0x4e8e_u16, StaticArray[0xbe_u8, 0x1_u8, 0x72_u8, 0xcc_u8, 0x7e_u8, 0x9_u8, 0x9d_u8, 0x8f_u8]), 6_u32)
  WPD_COMMON_INFORMATION_NOTES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb28ae94b_u32, 0x5a4_u16, 0x4e8e_u16, StaticArray[0xbe_u8, 0x1_u8, 0x72_u8, 0xcc_u8, 0x7e_u8, 0x9_u8, 0x9d_u8, 0x8f_u8]), 7_u32)
  WPD_MEMO_OBJECT_PROPERTIES_V1 = LibC::GUID.new(0x5ffbfc7b_u32, 0x7483_u16, 0x41ad_u16, StaticArray[0xaf_u8, 0xb9_u8, 0xda_u8, 0x3f_u8, 0x4e_u8, 0x59_u8, 0x2b_u8, 0x8d_u8])
  WPD_EMAIL_OBJECT_PROPERTIES_V1 = LibC::GUID.new(0x41f8f65a_u32, 0x5484_u16, 0x4782_u16, StaticArray[0xb1_u8, 0x3d_u8, 0x47_u8, 0x40_u8, 0xdd_u8, 0x7c_u8, 0x37_u8, 0xc5_u8])
  WPD_EMAIL_TO_LINE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x41f8f65a_u32, 0x5484_u16, 0x4782_u16, StaticArray[0xb1_u8, 0x3d_u8, 0x47_u8, 0x40_u8, 0xdd_u8, 0x7c_u8, 0x37_u8, 0xc5_u8]), 2_u32)
  WPD_EMAIL_CC_LINE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x41f8f65a_u32, 0x5484_u16, 0x4782_u16, StaticArray[0xb1_u8, 0x3d_u8, 0x47_u8, 0x40_u8, 0xdd_u8, 0x7c_u8, 0x37_u8, 0xc5_u8]), 3_u32)
  WPD_EMAIL_BCC_LINE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x41f8f65a_u32, 0x5484_u16, 0x4782_u16, StaticArray[0xb1_u8, 0x3d_u8, 0x47_u8, 0x40_u8, 0xdd_u8, 0x7c_u8, 0x37_u8, 0xc5_u8]), 4_u32)
  WPD_EMAIL_HAS_BEEN_READ = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x41f8f65a_u32, 0x5484_u16, 0x4782_u16, StaticArray[0xb1_u8, 0x3d_u8, 0x47_u8, 0x40_u8, 0xdd_u8, 0x7c_u8, 0x37_u8, 0xc5_u8]), 7_u32)
  WPD_EMAIL_RECEIVED_TIME = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x41f8f65a_u32, 0x5484_u16, 0x4782_u16, StaticArray[0xb1_u8, 0x3d_u8, 0x47_u8, 0x40_u8, 0xdd_u8, 0x7c_u8, 0x37_u8, 0xc5_u8]), 8_u32)
  WPD_EMAIL_HAS_ATTACHMENTS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x41f8f65a_u32, 0x5484_u16, 0x4782_u16, StaticArray[0xb1_u8, 0x3d_u8, 0x47_u8, 0x40_u8, 0xdd_u8, 0x7c_u8, 0x37_u8, 0xc5_u8]), 9_u32)
  WPD_EMAIL_SENDER_ADDRESS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x41f8f65a_u32, 0x5484_u16, 0x4782_u16, StaticArray[0xb1_u8, 0x3d_u8, 0x47_u8, 0x40_u8, 0xdd_u8, 0x7c_u8, 0x37_u8, 0xc5_u8]), 10_u32)
  WPD_APPOINTMENT_OBJECT_PROPERTIES_V1 = LibC::GUID.new(0xf99efd03_u32, 0x431d_u16, 0x40d8_u16, StaticArray[0xa1_u8, 0xc9_u8, 0x4e_u8, 0x22_u8, 0xd_u8, 0x9c_u8, 0x88_u8, 0xd3_u8])
  WPD_APPOINTMENT_LOCATION = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf99efd03_u32, 0x431d_u16, 0x40d8_u16, StaticArray[0xa1_u8, 0xc9_u8, 0x4e_u8, 0x22_u8, 0xd_u8, 0x9c_u8, 0x88_u8, 0xd3_u8]), 3_u32)
  WPD_APPOINTMENT_TYPE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf99efd03_u32, 0x431d_u16, 0x40d8_u16, StaticArray[0xa1_u8, 0xc9_u8, 0x4e_u8, 0x22_u8, 0xd_u8, 0x9c_u8, 0x88_u8, 0xd3_u8]), 7_u32)
  WPD_APPOINTMENT_REQUIRED_ATTENDEES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf99efd03_u32, 0x431d_u16, 0x40d8_u16, StaticArray[0xa1_u8, 0xc9_u8, 0x4e_u8, 0x22_u8, 0xd_u8, 0x9c_u8, 0x88_u8, 0xd3_u8]), 8_u32)
  WPD_APPOINTMENT_OPTIONAL_ATTENDEES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf99efd03_u32, 0x431d_u16, 0x40d8_u16, StaticArray[0xa1_u8, 0xc9_u8, 0x4e_u8, 0x22_u8, 0xd_u8, 0x9c_u8, 0x88_u8, 0xd3_u8]), 9_u32)
  WPD_APPOINTMENT_ACCEPTED_ATTENDEES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf99efd03_u32, 0x431d_u16, 0x40d8_u16, StaticArray[0xa1_u8, 0xc9_u8, 0x4e_u8, 0x22_u8, 0xd_u8, 0x9c_u8, 0x88_u8, 0xd3_u8]), 10_u32)
  WPD_APPOINTMENT_RESOURCES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf99efd03_u32, 0x431d_u16, 0x40d8_u16, StaticArray[0xa1_u8, 0xc9_u8, 0x4e_u8, 0x22_u8, 0xd_u8, 0x9c_u8, 0x88_u8, 0xd3_u8]), 11_u32)
  WPD_APPOINTMENT_TENTATIVE_ATTENDEES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf99efd03_u32, 0x431d_u16, 0x40d8_u16, StaticArray[0xa1_u8, 0xc9_u8, 0x4e_u8, 0x22_u8, 0xd_u8, 0x9c_u8, 0x88_u8, 0xd3_u8]), 12_u32)
  WPD_APPOINTMENT_DECLINED_ATTENDEES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf99efd03_u32, 0x431d_u16, 0x40d8_u16, StaticArray[0xa1_u8, 0xc9_u8, 0x4e_u8, 0x22_u8, 0xd_u8, 0x9c_u8, 0x88_u8, 0xd3_u8]), 13_u32)
  WPD_TASK_OBJECT_PROPERTIES_V1 = LibC::GUID.new(0xe354e95e_u32, 0xd8a0_u16, 0x4637_u16, StaticArray[0xa0_u8, 0x3a_u8, 0xc_u8, 0xb2_u8, 0x68_u8, 0x38_u8, 0xdb_u8, 0xc7_u8])
  WPD_TASK_STATUS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe354e95e_u32, 0xd8a0_u16, 0x4637_u16, StaticArray[0xa0_u8, 0x3a_u8, 0xc_u8, 0xb2_u8, 0x68_u8, 0x38_u8, 0xdb_u8, 0xc7_u8]), 6_u32)
  WPD_TASK_PERCENT_COMPLETE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe354e95e_u32, 0xd8a0_u16, 0x4637_u16, StaticArray[0xa0_u8, 0x3a_u8, 0xc_u8, 0xb2_u8, 0x68_u8, 0x38_u8, 0xdb_u8, 0xc7_u8]), 8_u32)
  WPD_TASK_REMINDER_DATE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe354e95e_u32, 0xd8a0_u16, 0x4637_u16, StaticArray[0xa0_u8, 0x3a_u8, 0xc_u8, 0xb2_u8, 0x68_u8, 0x38_u8, 0xdb_u8, 0xc7_u8]), 10_u32)
  WPD_TASK_OWNER = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe354e95e_u32, 0xd8a0_u16, 0x4637_u16, StaticArray[0xa0_u8, 0x3a_u8, 0xc_u8, 0xb2_u8, 0x68_u8, 0x38_u8, 0xdb_u8, 0xc7_u8]), 11_u32)
  WPD_SMS_OBJECT_PROPERTIES_V1 = LibC::GUID.new(0x7e1074cc_u32, 0x50ff_u16, 0x4dd1_u16, StaticArray[0xa7_u8, 0x42_u8, 0x53_u8, 0xbe_u8, 0x6f_u8, 0x9_u8, 0x3a_u8, 0xd_u8])
  WPD_SMS_PROVIDER = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7e1074cc_u32, 0x50ff_u16, 0x4dd1_u16, StaticArray[0xa7_u8, 0x42_u8, 0x53_u8, 0xbe_u8, 0x6f_u8, 0x9_u8, 0x3a_u8, 0xd_u8]), 2_u32)
  WPD_SMS_TIMEOUT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7e1074cc_u32, 0x50ff_u16, 0x4dd1_u16, StaticArray[0xa7_u8, 0x42_u8, 0x53_u8, 0xbe_u8, 0x6f_u8, 0x9_u8, 0x3a_u8, 0xd_u8]), 3_u32)
  WPD_SMS_MAX_PAYLOAD = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7e1074cc_u32, 0x50ff_u16, 0x4dd1_u16, StaticArray[0xa7_u8, 0x42_u8, 0x53_u8, 0xbe_u8, 0x6f_u8, 0x9_u8, 0x3a_u8, 0xd_u8]), 4_u32)
  WPD_SMS_ENCODING = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7e1074cc_u32, 0x50ff_u16, 0x4dd1_u16, StaticArray[0xa7_u8, 0x42_u8, 0x53_u8, 0xbe_u8, 0x6f_u8, 0x9_u8, 0x3a_u8, 0xd_u8]), 5_u32)
  WPD_SECTION_OBJECT_PROPERTIES_V1 = LibC::GUID.new(0x516afd2b_u32, 0xc64e_u16, 0x44f0_u16, StaticArray[0x98_u8, 0xdc_u8, 0xbe_u8, 0xe1_u8, 0xc8_u8, 0x8f_u8, 0x7d_u8, 0x66_u8])
  WPD_SECTION_DATA_OFFSET = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x516afd2b_u32, 0xc64e_u16, 0x44f0_u16, StaticArray[0x98_u8, 0xdc_u8, 0xbe_u8, 0xe1_u8, 0xc8_u8, 0x8f_u8, 0x7d_u8, 0x66_u8]), 2_u32)
  WPD_SECTION_DATA_LENGTH = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x516afd2b_u32, 0xc64e_u16, 0x44f0_u16, StaticArray[0x98_u8, 0xdc_u8, 0xbe_u8, 0xe1_u8, 0xc8_u8, 0x8f_u8, 0x7d_u8, 0x66_u8]), 3_u32)
  WPD_SECTION_DATA_UNITS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x516afd2b_u32, 0xc64e_u16, 0x44f0_u16, StaticArray[0x98_u8, 0xdc_u8, 0xbe_u8, 0xe1_u8, 0xc8_u8, 0x8f_u8, 0x7d_u8, 0x66_u8]), 4_u32)
  WPD_SECTION_DATA_REFERENCED_OBJECT_RESOURCE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x516afd2b_u32, 0xc64e_u16, 0x44f0_u16, StaticArray[0x98_u8, 0xdc_u8, 0xbe_u8, 0xe1_u8, 0xc8_u8, 0x8f_u8, 0x7d_u8, 0x66_u8]), 5_u32)
  NAME_Undefined = "Undefined"
  NAME_Association = "Association"
  NAME_DeviceScript = "DeviceScript"
  NAME_DeviceExecutable = "DeviceExecutable"
  NAME_TextDocument = "TextDocument"
  NAME_HTMLDocument = "HTMLDocument"
  NAME_DPOFDocument = "DPOFDocument"
  NAME_AIFFFile = "AIFFFile"
  NAME_WAVFile = "WAVFile"
  NAME_MP3File = "MP3File"
  NAME_AVIFile = "AVIFile"
  NAME_MPEGFile = "MPEGFile"
  NAME_ASFFile = "ASFFile"
  NAME_UnknownImage = "UnknownImage"
  NAME_EXIFImage = "EXIFImage"
  NAME_TIFFEPImage = "TIFFEPImage"
  NAME_FlashPixImage = "FlashPixImage"
  NAME_BMPImage = "BMPImage"
  NAME_CIFFImage = "CIFFImage"
  NAME_GIFImage = "GIFImage"
  NAME_JFIFImage = "JFIFImage"
  NAME_PCDImage = "PCDImage"
  NAME_PICTImage = "PICTImage"
  NAME_PNGImage = "PNGImage"
  NAME_TIFFImage = "TIFFImage"
  NAME_TIFFITImage = "TIFFITImage"
  NAME_JP2Image = "JP2Image"
  NAME_JPXImage = "JPXImage"
  NAME_FirmwareFile = "FirmwareFile"
  NAME_WBMPImage = "WBMPImage"
  NAME_JPEGXRImage = "JPEGXRImage"
  NAME_HDPhotoImage = "HDPhotoImage"
  NAME_UndefinedAudio = "UndefinedAudio"
  NAME_WMAFile = "WMAFile"
  NAME_OGGFile = "OGGFile"
  NAME_AACFile = "AACFile"
  NAME_AudibleFile = "AudibleFile"
  NAME_FLACFile = "FLACFile"
  NAME_QCELPFile = "QCELPFile"
  NAME_AMRFile = "AMRFile"
  NAME_UndefinedVideo = "UndefinedVideo"
  NAME_WMVFile = "WMVFile"
  NAME_MPEG4File = "MPEG4File"
  NAME_MPEG2File = "MPEG2File"
  NAME_3GPPFile = "3GPPFile"
  NAME_3GPP2File = "3GPP2File"
  NAME_AVCHDFile = "AVCHDFile"
  NAME_ATSCTSFile = "ATSCTSFile"
  NAME_DVBTSFile = "DVBTSFile"
  NAME_UndefinedCollection = "UndefinedCollection"
  NAME_AbstractMultimediaAlbum = "AbstractMultimediaAlbum"
  NAME_AbstractImageAlbum = "AbstractImageAlbum"
  NAME_AbstractAudioAlbum = "AbstractAudioAlbum"
  NAME_AbstractVideoAlbum = "AbstractVideoAlbum"
  NAME_AbstractAudioVideoAlbum = "AbstractAudioVideoAlbum"
  NAME_AbstractChapteredProduction = "AbstractChapteredProduction"
  NAME_AbstractAudioPlaylist = "AbstractAudioPlaylist"
  NAME_AbstractVideoPlaylist = "AbstractVideoPlaylist"
  NAME_AbstractMediacast = "AbstractMediacast"
  NAME_WPLPlaylist = "WPLPlaylist"
  NAME_M3UPlaylist = "M3UPlaylist"
  NAME_MPLPlaylist = "MPLPlaylist"
  NAME_ASXPlaylist = "ASXPlaylist"
  NAME_PSLPlaylist = "PSLPlaylist"
  NAME_UndefinedDocument = "UndefinedDocument"
  NAME_AbstractDocument = "AbstractDocument"
  NAME_XMLDocument = "XMLDocument"
  NAME_WordDocument = "WordDocument"
  NAME_MHTDocument = "MHTDocument"
  NAME_ExcelDocument = "ExcelDocument"
  NAME_PowerPointDocument = "PowerPointDocument"
  NAME_GenericObj_ObjectID = "ObjectID"
  NAME_GenericObj_ReferenceParentID = "ReferenceParentID"
  NAME_GenericObj_StorageID = "StorageID"
  NAME_GenericObj_ObjectFormat = "ObjectFormat"
  NAME_GenericObj_ProtectionStatus = "ProtectionStatus"
  NAME_GenericObj_ObjectSize = "ObjectSize"
  NAME_GenericObj_AssociationType = "AssociationType"
  NAME_GenericObj_AssociationDesc = "AssociationDesc"
  NAME_GenericObj_ObjectFileName = "ObjectFileName"
  NAME_GenericObj_DateCreated = "DateCreated"
  NAME_GenericObj_DateModified = "DateModified"
  NAME_GenericObj_Keywords = "Keywords"
  NAME_GenericObj_ParentID = "ParentID"
  NAME_GenericObj_AllowedFolderContents = "AllowedFolderContents"
  NAME_GenericObj_Hidden = "Hidden"
  NAME_GenericObj_SystemObject = "SystemObject"
  NAME_GenericObj_PersistentUID = "PersistentUID"
  NAME_GenericObj_SyncID = "SyncID"
  NAME_GenericObj_PropertyBag = "PropertyBag"
  NAME_GenericObj_Name = "Name"
  NAME_MediaObj_Artist = "Artist"
  NAME_GenericObj_DateAuthored = "DateAuthored"
  NAME_GenericObj_Description = "Description"
  NAME_GenericObj_LanguageLocale = "LanguageLocale"
  NAME_GenericObj_Copyright = "Copyright"
  NAME_VideoObj_Source = "Source"
  NAME_MediaObj_GeographicOrigin = "GeographicOrigin"
  NAME_GenericObj_DateAdded = "DateAdded"
  NAME_GenericObj_NonConsumable = "NonConsumable"
  NAME_GenericObj_Corrupt = "Corrupt"
  NAME_MediaObj_Width = "Width"
  NAME_MediaObj_Height = "Height"
  NAME_MediaObj_Duration = "Duration"
  NAME_MediaObj_UserRating = "UserRating"
  NAME_MediaObj_Track = "Track"
  NAME_MediaObj_Genre = "Genre"
  NAME_MediaObj_Credits = "Credits"
  NAME_AudioObj_Lyrics = "Lyrics"
  NAME_MediaObj_SubscriptionContentID = "SubscriptionContentID"
  NAME_MediaObj_Producer = "Producer"
  NAME_MediaObj_UseCount = "UseCount"
  NAME_MediaObj_SkipCount = "SkipCount"
  NAME_GenericObj_DateAccessed = "DateAccessed"
  NAME_MediaObj_ParentalRating = "ParentalRating"
  NAME_MediaObj_MediaType = "MediaType"
  NAME_MediaObj_Composer = "Composer"
  NAME_MediaObj_EffectiveRating = "EffectiveRating"
  NAME_MediaObj_Subtitle = "Subtitle"
  NAME_MediaObj_DateOriginalRelease = "DateOriginalRelease"
  NAME_MediaObj_AlbumName = "AlbumName"
  NAME_MediaObj_AlbumArtist = "AlbumArtist"
  NAME_MediaObj_Mood = "Mood"
  NAME_GenericObj_DRMStatus = "DRMStatus"
  NAME_GenericObj_SubDescription = "SubDescription"
  NAME_ImageObj_IsCropped = "IsCropped"
  NAME_ImageObj_IsColorCorrected = "IsColorCorrected"
  NAME_ImageObj_ImageBitDepth = "ImageBitDepth"
  NAME_ImageObj_Aperature = "Aperature"
  NAME_ImageObj_Exposure = "Exposure"
  NAME_ImageObj_ISOSpeed = "ISOSpeed"
  NAME_MediaObj_Owner = "Owner"
  NAME_MediaObj_Editor = "Editor"
  NAME_MediaObj_WebMaster = "WebMaster"
  NAME_MediaObj_URLSource = "URLSource"
  NAME_MediaObj_URLLink = "URLLink"
  NAME_MediaObj_BookmarkTime = "BookmarkTime"
  NAME_MediaObj_BookmarkObject = "BookmarkObject"
  NAME_MediaObj_BookmarkByte = "BookmarkByte"
  NAME_GenericObj_DateRevised = "DateRevised"
  NAME_GenericObj_TimeToLive = "TimeToLive"
  NAME_MediaObj_MediaUID = "MediaUID"
  NAME_MediaObj_TotalBitRate = "TotalBitRate"
  NAME_MediaObj_BitRateType = "BitRateType"
  NAME_MediaObj_SampleRate = "SampleRate"
  NAME_AudioObj_Channels = "Channels"
  NAME_AudioObj_AudioBitDepth = "AudioBitDepth"
  NAME_AudioObj_AudioBlockAlignment = "AudioBlockAlignment"
  NAME_VideoObj_ScanType = "ScanType"
  NAME_AudioObj_AudioFormatCode = "AudioFormatCode"
  NAME_AudioObj_AudioBitRate = "AudioBitRate"
  NAME_VideoObj_VideoFormatCode = "VideoFormatCode"
  NAME_VideoObj_VideoBitRate = "VideoBitRate"
  NAME_VideoObj_VideoFrameRate = "VideoFrameRate"
  NAME_VideoObj_KeyFrameDistance = "KeyFrameDistance"
  NAME_MediaObj_BufferSize = "BufferSize"
  NAME_MediaObj_EncodingQuality = "EncodingQuality"
  NAME_MediaObj_EncodingProfile = "EncodingProfile"
  NAME_MediaObj_AudioEncodingProfile = "AudioEncodingProfile"
  DEVSVC_SERVICEINFO_VERSION = 100_u32
  DEVSVCTYPE_DEFAULT = 0_u32
  DEVSVCTYPE_ABSTRACT = 1_u32
  NAME_Services_ServiceDisplayName = "ServiceDisplayName"
  NAME_Services_ServiceIcon = "ServiceIcon"
  NAME_Services_ServiceLocale = "ServiceLocale"
  NAME_CalendarSvc = "Calendar"
  TYPE_CalendarSvc = 0_u32
  NAME_CalendarSvc_SyncWindowStart = "SyncWindowStart"
  NAME_CalendarSvc_SyncWindowEnd = "SyncWindowEnd"
  NAME_AbstractActivity = "AbstractActivity"
  NAME_AbstractActivityOccurrence = "AbstractActivityOccurrence"
  NAME_VCalendar1Activity = "VCalendar1"
  NAME_ICalendarActivity = "ICalendar"
  NAME_CalendarObj_Location = "Location"
  NAME_CalendarObj_Accepted = "Accepted"
  NAME_CalendarObj_Tentative = "Tentative"
  NAME_CalendarObj_Declined = "Declined"
  NAME_CalendarObj_TimeZone = "TimeZone"
  NAME_CalendarObj_ReminderOffset = "ReminderOffset"
  NAME_CalendarObj_BusyStatus = "BusyStatus"
  ENUM_CalendarObj_BusyStatusFree = 0_u32
  ENUM_CalendarObj_BusyStatusBusy = 1_u32
  ENUM_CalendarObj_BusyStatusOutOfOffice = 2_u32
  ENUM_CalendarObj_BusyStatusTentative = 3_u32
  NAME_CalendarObj_PatternStartTime = "PatternStartTime"
  NAME_CalendarObj_PatternDuration = "PatternDuration"
  NAME_CalendarObj_BeginDateTime = "BeginDateTime"
  NAME_CalendarObj_EndDateTime = "EndDateTime"
  NAME_HintsSvc = "Hints"
  TYPE_HintsSvc = 0_u32
  NAME_MessageSvc = "Message"
  TYPE_MessageSvc = 0_u32
  NAME_AbstractMessage = "AbstractMessage"
  NAME_AbstractMessageFolder = "AbstractMessageFolder"
  NAME_MessageObj_Subject = "Subject"
  NAME_MessageObj_Body = "Body"
  NAME_MessageObj_Priority = "Priority"
  ENUM_MessageObj_PriorityHighest = 2_u32
  ENUM_MessageObj_PriorityNormal = 1_u32
  ENUM_MessageObj_PriorityLowest = 0_u32
  NAME_MessageObj_Category = "Category"
  NAME_MessageObj_Sender = "Sender"
  NAME_MessageObj_To = "To"
  NAME_MessageObj_CC = "CC"
  NAME_MessageObj_BCC = "BCC"
  NAME_MessageObj_Read = "Read"
  ENUM_MessageObj_ReadFalse = 0_u32
  ENUM_MessageObj_ReadTrue = 255_u32
  NAME_MessageObj_ReceivedTime = "ReceivedTime"
  NAME_MessageObj_PatternOriginalDateTime = "PatternOriginalDateTime"
  NAME_MessageObj_PatternType = "PatternType"
  ENUM_MessageObj_PatternTypeDaily = 1_u32
  ENUM_MessageObj_PatternTypeWeekly = 2_u32
  ENUM_MessageObj_PatternTypeMonthly = 3_u32
  ENUM_MessageObj_PatternTypeYearly = 4_u32
  NAME_MessageObj_PatternValidStartDate = "PatternValidStartDate"
  NAME_MessageObj_PatternValidEndDate = "PatternValidEndDate"
  NAME_MessageObj_PatternPeriod = "PatternPeriod"
  NAME_MessageObj_PatternDayOfWeek = "PatternDayOfWeek"
  FLAG_MessageObj_DayOfWeekNone = 0_u32
  FLAG_MessageObj_DayOfWeekSunday = 1_u32
  FLAG_MessageObj_DayOfWeekMonday = 2_u32
  FLAG_MessageObj_DayOfWeekTuesday = 4_u32
  FLAG_MessageObj_DayOfWeekWednesday = 8_u32
  FLAG_MessageObj_DayOfWeekThursday = 16_u32
  FLAG_MessageObj_DayOfWeekFriday = 32_u32
  FLAG_MessageObj_DayOfWeekSaturday = 64_u32
  NAME_MessageObj_PatternDayOfMonth = "PatternDayOfMonth"
  RANGEMIN_MessageObj_PatternDayOfMonth = 1_u32
  RANGEMAX_MessageObj_PatternDayOfMonth = 31_u32
  RANGESTEP_MessageObj_PatternDayOfMonth = 1_u32
  NAME_MessageObj_PatternMonthOfYear = "PatternMonthOfYear"
  RANGEMIN_MessageObj_PatternMonthOfYear = 1_u32
  RANGEMAX_MessageObj_PatternMonthOfYear = 12_u32
  RANGESTEP_MessageObj_PatternMonthOfYear = 1_u32
  NAME_MessageObj_PatternInstance = "PatternInstance"
  ENUM_MessageObj_PatternInstanceNone = 0_u32
  ENUM_MessageObj_PatternInstanceFirst = 1_u32
  ENUM_MessageObj_PatternInstanceSecond = 2_u32
  ENUM_MessageObj_PatternInstanceThird = 3_u32
  ENUM_MessageObj_PatternInstanceFourth = 4_u32
  ENUM_MessageObj_PatternInstanceLast = 5_u32
  NAME_MessageObj_PatternDeleteDates = "PatternDeleteDates"
  NAME_DeviceMetadataSvc = "Metadata"
  TYPE_DeviceMetadataSvc = 0_u32
  NAME_DeviceMetadataCAB = "DeviceMetadataCAB"
  NAME_DeviceMetadataObj_ContentID = "ContentID"
  NAME_DeviceMetadataObj_DefaultCAB = "DefaultCAB"
  ENUM_DeviceMetadataObj_DefaultCABFalse = 0_u32
  ENUM_DeviceMetadataObj_DefaultCABTrue = 1_u32
  NAME_NotesSvc = "Notes"
  TYPE_NotesSvc = 0_u32
  NAME_AbstractNote = "AbstractNote"
  NAME_StatusSvc = "Status"
  TYPE_StatusSvc = 0_u32
  NAME_StatusSvc_SignalStrength = "SignalStrength"
  RANGEMIN_StatusSvc_SignalStrength = 0_u32
  RANGEMAX_StatusSvc_SignalStrength = 4_u32
  RANGESTEP_StatusSvc_SignalStrength = 1_u32
  NAME_StatusSvc_TextMessages = "TextMessages"
  RANGEMAX_StatusSvc_TextMessages = 255_u32
  NAME_StatusSvc_NewPictures = "NewPictures"
  RANGEMAX_StatusSvc_NewPictures = 65535_u32
  NAME_StatusSvc_MissedCalls = "MissedCalls"
  RANGEMAX_StatusSvc_MissedCalls = 255_u32
  NAME_StatusSvc_VoiceMail = "VoiceMail"
  RANGEMAX_StatusSvc_VoiceMail = 255_u32
  NAME_StatusSvc_NetworkName = "NetworkName"
  NAME_StatusSvc_NetworkType = "NetworkType"
  NAME_StatusSvc_Roaming = "Roaming"
  ENUM_StatusSvc_RoamingInactive = 0_u32
  ENUM_StatusSvc_RoamingActive = 1_u32
  ENUM_StatusSvc_RoamingUnknown = 2_u32
  NAME_StatusSvc_BatteryLife = "BatteryLife"
  RANGEMIN_StatusSvc_BatteryLife = 0_u32
  RANGEMAX_StatusSvc_BatteryLife = 100_u32
  RANGESTEP_StatusSvc_BatteryLife = 1_u32
  NAME_StatusSvc_ChargingState = "ChargingState"
  ENUM_StatusSvc_ChargingInactive = 0_u32
  ENUM_StatusSvc_ChargingActive = 1_u32
  ENUM_StatusSvc_ChargingUnknown = 2_u32
  NAME_StatusSvc_StorageCapacity = "StorageCapacity"
  NAME_StatusSvc_StorageFreeSpace = "StorageFreeSpace"
  NAME_SyncSvc_SyncFormat = "SyncFormat"
  NAME_SyncSvc_LocalOnlyDelete = "LocalOnlyDelete"
  NAME_SyncSvc_FilterType = "FilterType"
  SYNCSVC_FILTER_NONE = 0_u32
  SYNCSVC_FILTER_CONTACTS_WITH_PHONE = 1_u32
  SYNCSVC_FILTER_TASK_ACTIVE = 2_u32
  SYNCSVC_FILTER_CALENDAR_WINDOW_WITH_RECURRENCE = 3_u32
  NAME_SyncSvc_SyncObjectReferences = "SyncObjectReferences"
  ENUM_SyncSvc_SyncObjectReferencesDisabled = 0_u32
  ENUM_SyncSvc_SyncObjectReferencesEnabled = 255_u32
  NAME_SyncObj_LastAuthorProxyID = "LastAuthorProxyID"
  NAME_SyncSvc_BeginSync = "BeginSync"
  NAME_SyncSvc_EndSync = "EndSync"
  NAME_TasksSvc = "Tasks"
  TYPE_TasksSvc = 0_u32
  NAME_TasksSvc_SyncActiveOnly = "FilterType"
  NAME_AbstractTask = "AbstractTask"
  NAME_TaskObj_ReminderDateTime = "ReminderDateTime"
  NAME_TaskObj_Complete = "Complete"
  ENUM_TaskObj_CompleteFalse = 0_u32
  ENUM_TaskObj_CompleteTrue = 255_u32
  NAME_TaskObj_BeginDate = "BeginDate"
  NAME_TaskObj_EndDate = "EndDate"
  WPD_CATEGORY_MTP_EXT_VENDOR_OPERATIONS = LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8])
  WPD_COMMAND_MTP_EXT_GET_SUPPORTED_VENDOR_OPCODES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 11_u32)
  WPD_COMMAND_MTP_EXT_EXECUTE_COMMAND_WITHOUT_DATA_PHASE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 12_u32)
  WPD_COMMAND_MTP_EXT_EXECUTE_COMMAND_WITH_DATA_TO_READ = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 13_u32)
  WPD_COMMAND_MTP_EXT_EXECUTE_COMMAND_WITH_DATA_TO_WRITE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 14_u32)
  WPD_COMMAND_MTP_EXT_READ_DATA = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 15_u32)
  WPD_COMMAND_MTP_EXT_WRITE_DATA = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 16_u32)
  WPD_COMMAND_MTP_EXT_END_DATA_TRANSFER = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 17_u32)
  WPD_COMMAND_MTP_EXT_GET_VENDOR_EXTENSION_DESCRIPTION = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 18_u32)
  WPD_PROPERTY_MTP_EXT_OPERATION_CODE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 1001_u32)
  WPD_PROPERTY_MTP_EXT_OPERATION_PARAMS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 1002_u32)
  WPD_PROPERTY_MTP_EXT_RESPONSE_CODE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 1003_u32)
  WPD_PROPERTY_MTP_EXT_RESPONSE_PARAMS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 1004_u32)
  WPD_PROPERTY_MTP_EXT_VENDOR_OPERATION_CODES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 1005_u32)
  WPD_PROPERTY_MTP_EXT_TRANSFER_CONTEXT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 1006_u32)
  WPD_PROPERTY_MTP_EXT_TRANSFER_TOTAL_DATA_SIZE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 1007_u32)
  WPD_PROPERTY_MTP_EXT_TRANSFER_NUM_BYTES_TO_READ = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 1008_u32)
  WPD_PROPERTY_MTP_EXT_TRANSFER_NUM_BYTES_READ = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 1009_u32)
  WPD_PROPERTY_MTP_EXT_TRANSFER_NUM_BYTES_TO_WRITE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 1010_u32)
  WPD_PROPERTY_MTP_EXT_TRANSFER_NUM_BYTES_WRITTEN = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 1011_u32)
  WPD_PROPERTY_MTP_EXT_TRANSFER_DATA = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 1012_u32)
  WPD_PROPERTY_MTP_EXT_OPTIMAL_TRANSFER_BUFFER_SIZE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 1013_u32)
  WPD_PROPERTY_MTP_EXT_VENDOR_EXTENSION_DESCRIPTION = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 1014_u32)
  WPD_PROPERTIES_MTP_VENDOR_EXTENDED_OBJECT_PROPS = LibC::GUID.new(0x4d545058_u32, 0x4fce_u16, 0x4578_u16, StaticArray[0x95_u8, 0xc8_u8, 0x86_u8, 0x98_u8, 0xa9_u8, 0xbc_u8, 0xf_u8, 0x49_u8])
  WPD_PROPERTIES_MTP_VENDOR_EXTENDED_DEVICE_PROPS = LibC::GUID.new(0x4d545058_u32, 0x8900_u16, 0x40b3_u16, StaticArray[0x8f_u8, 0x1d_u8, 0xdc_u8, 0x24_u8, 0x6e_u8, 0x1e_u8, 0x83_u8, 0x70_u8])
  WPD_EVENT_MTP_VENDOR_EXTENDED_EVENTS = LibC::GUID.new(0x0_u32, 0x5738_u16, 0x4ff2_u16, StaticArray[0x84_u8, 0x45_u8, 0xbe_u8, 0x31_u8, 0x26_u8, 0x69_u8, 0x10_u8, 0x59_u8])
  WPD_PROPERTY_MTP_EXT_EVENT_PARAMS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0xef88_u16, 0x4e4d_u16, StaticArray[0x95_u8, 0xc3_u8, 0x4f_u8, 0x32_u8, 0x7f_u8, 0x72_u8, 0x8a_u8, 0x96_u8]), 1011_u32)
  CLSID_WPD_NAMESPACE_EXTENSION = LibC::GUID.new(0x35786d3c_u32, 0xb075_u16, 0x49b9_u16, StaticArray[0x88_u8, 0xdd_u8, 0x2_u8, 0x98_u8, 0x76_u8, 0xe1_u8, 0x1c_u8, 0x1_u8])
  WPDNSE_OBJECT_PROPERTIES_V1 = LibC::GUID.new(0x34d71409_u32, 0x4b47_u16, 0x4d80_u16, StaticArray[0xaa_u8, 0xac_u8, 0x3a_u8, 0x28_u8, 0xa4_u8, 0xa3_u8, 0xb3_u8, 0xe6_u8])
  WPDNSE_OBJECT_HAS_CONTACT_PHOTO = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x34d71409_u32, 0x4b47_u16, 0x4d80_u16, StaticArray[0xaa_u8, 0xac_u8, 0x3a_u8, 0x28_u8, 0xa4_u8, 0xa3_u8, 0xb3_u8, 0xe6_u8]), 2_u32)
  WPDNSE_OBJECT_HAS_THUMBNAIL = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x34d71409_u32, 0x4b47_u16, 0x4d80_u16, StaticArray[0xaa_u8, 0xac_u8, 0x3a_u8, 0x28_u8, 0xa4_u8, 0xa3_u8, 0xb3_u8, 0xe6_u8]), 3_u32)
  WPDNSE_OBJECT_HAS_ICON = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x34d71409_u32, 0x4b47_u16, 0x4d80_u16, StaticArray[0xaa_u8, 0xac_u8, 0x3a_u8, 0x28_u8, 0xa4_u8, 0xa3_u8, 0xb3_u8, 0xe6_u8]), 4_u32)
  WPDNSE_OBJECT_HAS_AUDIO_CLIP = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x34d71409_u32, 0x4b47_u16, 0x4d80_u16, StaticArray[0xaa_u8, 0xac_u8, 0x3a_u8, 0x28_u8, 0xa4_u8, 0xa3_u8, 0xb3_u8, 0xe6_u8]), 5_u32)
  WPDNSE_OBJECT_HAS_ALBUM_ART = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x34d71409_u32, 0x4b47_u16, 0x4d80_u16, StaticArray[0xaa_u8, 0xac_u8, 0x3a_u8, 0x28_u8, 0xa4_u8, 0xa3_u8, 0xb3_u8, 0xe6_u8]), 6_u32)
  WPDNSE_OBJECT_OPTIMAL_READ_BLOCK_SIZE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x34d71409_u32, 0x4b47_u16, 0x4d80_u16, StaticArray[0xaa_u8, 0xac_u8, 0x3a_u8, 0x28_u8, 0xa4_u8, 0xa3_u8, 0xb3_u8, 0xe6_u8]), 7_u32)
  WPDNSE_PROPSHEET_DEVICE_GENERAL = 1_u32
  WPDNSE_PROPSHEET_STORAGE_GENERAL = 2_u32
  WPDNSE_PROPSHEET_CONTENT_GENERAL = 4_u32
  WPDNSE_PROPSHEET_CONTENT_REFERENCES = 8_u32
  WPDNSE_PROPSHEET_CONTENT_RESOURCES = 16_u32
  WPDNSE_PROPSHEET_CONTENT_DETAILS = 32_u32
  STR_WPDNSE_FAST_ENUM = "WPDNSE Fast Enum"
  STR_WPDNSE_SIMPLE_ITEM = "WPDNSE SimpleItem"
  NAME_ContactsSvc = "Contacts"
  TYPE_ContactsSvc = 0_u32
  NAME_ContactSvc_SyncWithPhoneOnly = "FilterType"
  NAME_AbstractContact = "AbstractContact"
  NAME_VCard2Contact = "VCard2Contact"
  NAME_VCard3Contact = "VCard3Contact"
  NAME_AbstractContactGroup = "AbstractContactGroup"
  NAME_ContactObj_GivenName = "GivenName"
  NAME_ContactObj_MiddleNames = "MiddleNames"
  NAME_ContactObj_FamilyName = "FamilyName"
  NAME_ContactObj_Title = "Title"
  NAME_ContactObj_Suffix = "Suffix"
  NAME_ContactObj_PhoneticGivenName = "PhoneticGivenName"
  NAME_ContactObj_PhoneticFamilyName = "PhoneticFamilyName"
  NAME_ContactObj_PersonalAddressFull = "PersonalAddressFull"
  NAME_ContactObj_PersonalAddressStreet = "PersonalAddressStreet"
  NAME_ContactObj_PersonalAddressLine2 = "PersonalAddressLine2"
  NAME_ContactObj_PersonalAddressCity = "PersonalAddressCity"
  NAME_ContactObj_PersonalAddressRegion = "PersonalAddressRegion"
  NAME_ContactObj_PersonalAddressPostalCode = "PersonalAddressPostalCode"
  NAME_ContactObj_PersonalAddressCountry = "PersonalAddressCountry"
  NAME_ContactObj_BusinessAddressFull = "BusinessAddressFull"
  NAME_ContactObj_BusinessAddressStreet = "BusinessAddressStreet"
  NAME_ContactObj_BusinessAddressLine2 = "BusinessAddressLine2"
  NAME_ContactObj_BusinessAddressCity = "BusinessAddressCity"
  NAME_ContactObj_BusinessAddressRegion = "BusinessAddressRegion"
  NAME_ContactObj_BusinessAddressPostalCode = "BusinessAddressPostalCode"
  NAME_ContactObj_BusinessAddressCountry = "BusinessAddressCountry"
  NAME_ContactObj_OtherAddressFull = "OtherAddressFull"
  NAME_ContactObj_OtherAddressStreet = "OtherAddressStreet"
  NAME_ContactObj_OtherAddressLine2 = "OtherAddressLine2"
  NAME_ContactObj_OtherAddressCity = "OtherAddressCity"
  NAME_ContactObj_OtherAddressRegion = "OtherAddressRegion"
  NAME_ContactObj_OtherAddressPostalCode = "OtherAddressPostalCode"
  NAME_ContactObj_OtherAddressCountry = "OtherAddressCountry"
  NAME_ContactObj_Email = "Email"
  NAME_ContactObj_PersonalEmail = "PersonalEmail"
  NAME_ContactObj_PersonalEmail2 = "PersonalEmail2"
  NAME_ContactObj_BusinessEmail = "BusinessEmail"
  NAME_ContactObj_BusinessEmail2 = "BusinessEmail2"
  NAME_ContactObj_OtherEmail = "OtherEmail"
  NAME_ContactObj_Phone = "Phone"
  NAME_ContactObj_PersonalPhone = "PersonalPhone"
  NAME_ContactObj_PersonalPhone2 = "PersonalPhone2"
  NAME_ContactObj_BusinessPhone = "BusinessPhone"
  NAME_ContactObj_BusinessPhone2 = "BusinessPhone2"
  NAME_ContactObj_MobilePhone = "MobilePhone"
  NAME_ContactObj_MobilePhone2 = "MobilePhone2"
  NAME_ContactObj_PersonalFax = "PersonalFax"
  NAME_ContactObj_BusinessFax = "BusinessFax"
  NAME_ContactObj_Pager = "Pager"
  NAME_ContactObj_OtherPhone = "OtherPhone"
  NAME_ContactObj_WebAddress = "WebAddress"
  NAME_ContactObj_PersonalWebAddress = "PersonalWebAddress"
  NAME_ContactObj_BusinessWebAddress = "BusinessWebAddress"
  NAME_ContactObj_IMAddress = "IMAddress"
  NAME_ContactObj_IMAddress2 = "IMAddress2"
  NAME_ContactObj_IMAddress3 = "IMAddress3"
  NAME_ContactObj_Organization = "Organization"
  NAME_ContactObj_PhoneticOrganization = "PhoneticOrganization"
  NAME_ContactObj_Role = "Role"
  NAME_ContactObj_Fax = "Fax"
  NAME_ContactObj_Spouse = "Spouse"
  NAME_ContactObj_Children = "Children"
  NAME_ContactObj_Assistant = "Assistant"
  NAME_ContactObj_Ringtone = "Ringtone"
  NAME_ContactObj_Birthdate = "Birthdate"
  NAME_ContactObj_AnniversaryDate = "AnniversaryDate"
  NAME_RingtonesSvc = "Ringtones"
  TYPE_RingtonesSvc = 0_u32
  NAME_RingtonesSvc_DefaultRingtone = "DefaultRingtone"
  NAME_AnchorSyncSvc = "AnchorSync"
  TYPE_AnchorSyncSvc = 1_u32
  NAME_AnchorSyncSvc_VersionProps = "AnchorVersionProps"
  NAME_AnchorSyncSvc_ReplicaID = "AnchorReplicaID"
  NAME_AnchorSyncSvc_KnowledgeObjectID = "AnchorKnowledgeObjectID"
  NAME_AnchorSyncSvc_LastSyncProxyID = "AnchorLastSyncProxyID"
  NAME_AnchorSyncSvc_CurrentAnchor = "AnchorCurrentAnchor"
  NAME_AnchorSyncSvc_ProviderVersion = "AnchorProviderVersion"
  NAME_AnchorSyncSvc_SyncFormat = "SyncFormat"
  NAME_AnchorSyncSvc_LocalOnlyDelete = "LocalOnlyDelete"
  NAME_AnchorSyncSvc_FilterType = "FilterType"
  NAME_AnchorSyncKnowledge = "AnchorSyncKnowledge"
  NAME_AnchorResults = "AnchorResults"
  NAME_AnchorResults_AnchorState = "AnchorState"
  ENUM_AnchorResults_AnchorStateNormal = 0_u32
  ENUM_AnchorResults_AnchorStateInvalid = 1_u32
  ENUM_AnchorResults_AnchorStateOld = 2_u32
  NAME_AnchorResults_Anchor = "Anchor"
  NAME_AnchorResults_ResultObjectID = "ResultObjectID"
  NAME_AnchorSyncSvc_GetChangesSinceAnchor = "GetChangesSinceAnchor"
  NAME_AnchorSyncSvc_BeginSync = "BeginSync"
  NAME_AnchorSyncSvc_EndSync = "EndSync"
  ENUM_AnchorResults_ItemStateInvalid = 0_u32
  ENUM_AnchorResults_ItemStateDeleted = 1_u32
  ENUM_AnchorResults_ItemStateCreated = 2_u32
  ENUM_AnchorResults_ItemStateUpdated = 3_u32
  ENUM_AnchorResults_ItemStateChanged = 4_u32
  NAME_FullEnumSyncSvc = "FullEnumSync"
  TYPE_FullEnumSyncSvc = 1_u32
  NAME_FullEnumSyncSvc_VersionProps = "FullEnumVersionProps"
  NAME_FullEnumSyncSvc_ReplicaID = "FullEnumReplicaID"
  NAME_FullEnumSyncSvc_KnowledgeObjectID = "FullEnumKnowledgeObjectID"
  NAME_FullEnumSyncSvc_LastSyncProxyID = "FullEnumLastSyncProxyID"
  NAME_FullEnumSyncSvc_ProviderVersion = "FullEnumProviderVersion"
  NAME_FullEnumSyncSvc_SyncFormat = "SyncFormat"
  NAME_FullEnumSyncSvc_LocalOnlyDelete = "LocalOnlyDelete"
  NAME_FullEnumSyncSvc_FilterType = "FilterType"
  NAME_FullEnumSyncKnowledge = "FullEnumSyncKnowledge"
  NAME_FullEnumSyncSvc_BeginSync = "BeginSync"
  NAME_FullEnumSyncSvc_EndSync = "EndSync"

  CLSID_WpdSerializer = LibC::GUID.new(0xb91a74b_u32, 0xad7c_u16, 0x4a9d_u16, StaticArray[0xb5_u8, 0x63_u8, 0x29_u8, 0xee_u8, 0xf9_u8, 0x16_u8, 0x71_u8, 0x72_u8])

  CLSID_PortableDeviceValues = LibC::GUID.new(0xc15d503_u32, 0xd017_u16, 0x47ce_u16, StaticArray[0x90_u8, 0x16_u8, 0x7b_u8, 0x3f_u8, 0x97_u8, 0x87_u8, 0x21_u8, 0xcc_u8])

  CLSID_PortableDeviceKeyCollection = LibC::GUID.new(0xde2d022d_u32, 0x2480_u16, 0x43be_u16, StaticArray[0x97_u8, 0xf0_u8, 0xd1_u8, 0xfa_u8, 0x2c_u8, 0xf9_u8, 0x8f_u8, 0x4f_u8])

  CLSID_PortableDevicePropVariantCollection = LibC::GUID.new(0x8a99e2f_u32, 0x6d6d_u16, 0x4b80_u16, StaticArray[0xaf_u8, 0x5a_u8, 0xba_u8, 0xf2_u8, 0xbc_u8, 0xbe_u8, 0x4c_u8, 0xb9_u8])

  CLSID_PortableDeviceValuesCollection = LibC::GUID.new(0x3882134d_u32, 0x14cf_u16, 0x4220_u16, StaticArray[0x9c_u8, 0xb4_u8, 0x43_u8, 0x5f_u8, 0x86_u8, 0xd8_u8, 0x3f_u8, 0x60_u8])

  CLSID_PortableDevice = LibC::GUID.new(0x728a21c5_u32, 0x3d9e_u16, 0x48d7_u16, StaticArray[0x98_u8, 0x10_u8, 0x86_u8, 0x48_u8, 0x48_u8, 0xf0_u8, 0xf4_u8, 0x4_u8])

  CLSID_PortableDeviceManager = LibC::GUID.new(0xaf10cec_u32, 0x2ecd_u16, 0x4b92_u16, StaticArray[0x95_u8, 0x81_u8, 0x34_u8, 0xf6_u8, 0xae_u8, 0x6_u8, 0x37_u8, 0xf3_u8])

  CLSID_PortableDeviceService = LibC::GUID.new(0xef5db4c2_u32, 0x9312_u16, 0x422c_u16, StaticArray[0x91_u8, 0x52_u8, 0x41_u8, 0x1c_u8, 0xd9_u8, 0xc4_u8, 0xdd_u8, 0x84_u8])

  CLSID_PortableDeviceDispatchFactory = LibC::GUID.new(0x43232233_u32, 0x8338_u16, 0x4658_u16, StaticArray[0xae_u8, 0x1_u8, 0xb_u8, 0x4a_u8, 0xe8_u8, 0x30_u8, 0xb6_u8, 0xb0_u8])

  CLSID_PortableDeviceFTM = LibC::GUID.new(0xf7c0039a_u32, 0x4762_u16, 0x488a_u16, StaticArray[0xb4_u8, 0xb3_u8, 0x76_u8, 0xe_u8, 0xf9_u8, 0xa1_u8, 0xba_u8, 0x9b_u8])

  CLSID_PortableDeviceServiceFTM = LibC::GUID.new(0x1649b154_u32, 0xc794_u16, 0x497a_u16, StaticArray[0x9b_u8, 0x3_u8, 0xf3_u8, 0xf0_u8, 0x12_u8, 0x13_u8, 0x2_u8, 0xf3_u8])

  CLSID_PortableDeviceWebControl = LibC::GUID.new(0x186dd02c_u32, 0x2dec_u16, 0x41b5_u16, StaticArray[0xa7_u8, 0xd4_u8, 0xb5_u8, 0x90_u8, 0x56_u8, 0xfa_u8, 0xde_u8, 0x51_u8])

  CLSID_EnumBthMtpConnectors = LibC::GUID.new(0xa1570149_u32, 0xe645_u16, 0x4f43_u16, StaticArray[0x8b_u8, 0xd_u8, 0x40_u8, 0x9b_u8, 0x6_u8, 0x1d_u8, 0xb2_u8, 0xfc_u8])

  enum DELETE_OBJECT_OPTIONS
    PORTABLE_DEVICE_DELETE_NO_RECURSION = 0_i32
    PORTABLE_DEVICE_DELETE_WITH_RECURSION = 1_i32
  end
  enum WPD_DEVICE_TYPES
    WPD_DEVICE_TYPE_GENERIC = 0_i32
    WPD_DEVICE_TYPE_CAMERA = 1_i32
    WPD_DEVICE_TYPE_MEDIA_PLAYER = 2_i32
    WPD_DEVICE_TYPE_PHONE = 3_i32
    WPD_DEVICE_TYPE_VIDEO = 4_i32
    WPD_DEVICE_TYPE_PERSONAL_INFORMATION_MANAGER = 5_i32
    WPD_DEVICE_TYPE_AUDIO_RECORDER = 6_i32
  end
  enum WpdAttributeForm
    WPD_PROPERTY_ATTRIBUTE_FORM_UNSPECIFIED = 0_i32
    WPD_PROPERTY_ATTRIBUTE_FORM_RANGE = 1_i32
    WPD_PROPERTY_ATTRIBUTE_FORM_ENUMERATION = 2_i32
    WPD_PROPERTY_ATTRIBUTE_FORM_REGULAR_EXPRESSION = 3_i32
    WPD_PROPERTY_ATTRIBUTE_FORM_OBJECT_IDENTIFIER = 4_i32
  end
  enum WpdParameterAttributeForm
    WPD_PARAMETER_ATTRIBUTE_FORM_UNSPECIFIED = 0_i32
    WPD_PARAMETER_ATTRIBUTE_FORM_RANGE = 1_i32
    WPD_PARAMETER_ATTRIBUTE_FORM_ENUMERATION = 2_i32
    WPD_PARAMETER_ATTRIBUTE_FORM_REGULAR_EXPRESSION = 3_i32
    WPD_PARAMETER_ATTRIBUTE_FORM_OBJECT_IDENTIFIER = 4_i32
  end
  enum WPD_DEVICE_TRANSPORTS
    WPD_DEVICE_TRANSPORT_UNSPECIFIED = 0_i32
    WPD_DEVICE_TRANSPORT_USB = 1_i32
    WPD_DEVICE_TRANSPORT_IP = 2_i32
    WPD_DEVICE_TRANSPORT_BLUETOOTH = 3_i32
  end
  enum WPD_STORAGE_TYPE_VALUES
    WPD_STORAGE_TYPE_UNDEFINED = 0_i32
    WPD_STORAGE_TYPE_FIXED_ROM = 1_i32
    WPD_STORAGE_TYPE_REMOVABLE_ROM = 2_i32
    WPD_STORAGE_TYPE_FIXED_RAM = 3_i32
    WPD_STORAGE_TYPE_REMOVABLE_RAM = 4_i32
  end
  enum WPD_STORAGE_ACCESS_CAPABILITY_VALUES
    WPD_STORAGE_ACCESS_CAPABILITY_READWRITE = 0_i32
    WPD_STORAGE_ACCESS_CAPABILITY_READ_ONLY_WITHOUT_OBJECT_DELETION = 1_i32
    WPD_STORAGE_ACCESS_CAPABILITY_READ_ONLY_WITH_OBJECT_DELETION = 2_i32
  end
  enum WPD_SMS_ENCODING_TYPES
    SMS_ENCODING_7_BIT = 0_i32
    SMS_ENCODING_8_BIT = 1_i32
    SMS_ENCODING_UTF_16 = 2_i32
  end
  enum SMS_MESSAGE_TYPES
    SMS_TEXT_MESSAGE = 0_i32
    SMS_BINARY_MESSAGE = 1_i32
  end
  enum WPD_POWER_SOURCES
    WPD_POWER_SOURCE_BATTERY = 0_i32
    WPD_POWER_SOURCE_EXTERNAL = 1_i32
  end
  enum WPD_WHITE_BALANCE_SETTINGS
    WPD_WHITE_BALANCE_UNDEFINED = 0_i32
    WPD_WHITE_BALANCE_MANUAL = 1_i32
    WPD_WHITE_BALANCE_AUTOMATIC = 2_i32
    WPD_WHITE_BALANCE_ONE_PUSH_AUTOMATIC = 3_i32
    WPD_WHITE_BALANCE_DAYLIGHT = 4_i32
    WPD_WHITE_BALANCE_FLORESCENT = 5_i32
    WPD_WHITE_BALANCE_TUNGSTEN = 6_i32
    WPD_WHITE_BALANCE_FLASH = 7_i32
  end
  enum WPD_FOCUS_MODES
    WPD_FOCUS_UNDEFINED = 0_i32
    WPD_FOCUS_MANUAL = 1_i32
    WPD_FOCUS_AUTOMATIC = 2_i32
    WPD_FOCUS_AUTOMATIC_MACRO = 3_i32
  end
  enum WPD_EXPOSURE_METERING_MODES
    WPD_EXPOSURE_METERING_MODE_UNDEFINED = 0_i32
    WPD_EXPOSURE_METERING_MODE_AVERAGE = 1_i32
    WPD_EXPOSURE_METERING_MODE_CENTER_WEIGHTED_AVERAGE = 2_i32
    WPD_EXPOSURE_METERING_MODE_MULTI_SPOT = 3_i32
    WPD_EXPOSURE_METERING_MODE_CENTER_SPOT = 4_i32
  end
  enum WPD_FLASH_MODES
    WPD_FLASH_MODE_UNDEFINED = 0_i32
    WPD_FLASH_MODE_AUTO = 1_i32
    WPD_FLASH_MODE_OFF = 2_i32
    WPD_FLASH_MODE_FILL = 3_i32
    WPD_FLASH_MODE_RED_EYE_AUTO = 4_i32
    WPD_FLASH_MODE_RED_EYE_FILL = 5_i32
    WPD_FLASH_MODE_EXTERNAL_SYNC = 6_i32
  end
  enum WPD_EXPOSURE_PROGRAM_MODES
    WPD_EXPOSURE_PROGRAM_MODE_UNDEFINED = 0_i32
    WPD_EXPOSURE_PROGRAM_MODE_MANUAL = 1_i32
    WPD_EXPOSURE_PROGRAM_MODE_AUTO = 2_i32
    WPD_EXPOSURE_PROGRAM_MODE_APERTURE_PRIORITY = 3_i32
    WPD_EXPOSURE_PROGRAM_MODE_SHUTTER_PRIORITY = 4_i32
    WPD_EXPOSURE_PROGRAM_MODE_CREATIVE = 5_i32
    WPD_EXPOSURE_PROGRAM_MODE_ACTION = 6_i32
    WPD_EXPOSURE_PROGRAM_MODE_PORTRAIT = 7_i32
  end
  enum WPD_CAPTURE_MODES
    WPD_CAPTURE_MODE_UNDEFINED = 0_i32
    WPD_CAPTURE_MODE_NORMAL = 1_i32
    WPD_CAPTURE_MODE_BURST = 2_i32
    WPD_CAPTURE_MODE_TIMELAPSE = 3_i32
  end
  enum WPD_EFFECT_MODES
    WPD_EFFECT_MODE_UNDEFINED = 0_i32
    WPD_EFFECT_MODE_COLOR = 1_i32
    WPD_EFFECT_MODE_BLACK_AND_WHITE = 2_i32
    WPD_EFFECT_MODE_SEPIA = 3_i32
  end
  enum WPD_FOCUS_METERING_MODES
    WPD_FOCUS_METERING_MODE_UNDEFINED = 0_i32
    WPD_FOCUS_METERING_MODE_CENTER_SPOT = 1_i32
    WPD_FOCUS_METERING_MODE_MULTI_SPOT = 2_i32
  end
  enum WPD_BITRATE_TYPES
    WPD_BITRATE_TYPE_UNUSED = 0_i32
    WPD_BITRATE_TYPE_DISCRETE = 1_i32
    WPD_BITRATE_TYPE_VARIABLE = 2_i32
    WPD_BITRATE_TYPE_FREE = 3_i32
  end
  enum WPD_META_GENRES
    WPD_META_GENRE_UNUSED = 0_i32
    WPD_META_GENRE_GENERIC_MUSIC_AUDIO_FILE = 1_i32
    WPD_META_GENRE_GENERIC_NON_MUSIC_AUDIO_FILE = 17_i32
    WPD_META_GENRE_SPOKEN_WORD_AUDIO_BOOK_FILES = 18_i32
    WPD_META_GENRE_SPOKEN_WORD_FILES_NON_AUDIO_BOOK = 19_i32
    WPD_META_GENRE_SPOKEN_WORD_NEWS = 20_i32
    WPD_META_GENRE_SPOKEN_WORD_TALK_SHOWS = 21_i32
    WPD_META_GENRE_GENERIC_VIDEO_FILE = 33_i32
    WPD_META_GENRE_NEWS_VIDEO_FILE = 34_i32
    WPD_META_GENRE_MUSIC_VIDEO_FILE = 35_i32
    WPD_META_GENRE_HOME_VIDEO_FILE = 36_i32
    WPD_META_GENRE_FEATURE_FILM_VIDEO_FILE = 37_i32
    WPD_META_GENRE_TELEVISION_VIDEO_FILE = 38_i32
    WPD_META_GENRE_TRAINING_EDUCATIONAL_VIDEO_FILE = 39_i32
    WPD_META_GENRE_PHOTO_MONTAGE_VIDEO_FILE = 40_i32
    WPD_META_GENRE_GENERIC_NON_AUDIO_NON_VIDEO = 48_i32
    WPD_META_GENRE_AUDIO_PODCAST = 64_i32
    WPD_META_GENRE_VIDEO_PODCAST = 65_i32
    WPD_META_GENRE_MIXED_PODCAST = 66_i32
  end
  enum WPD_CROPPED_STATUS_VALUES
    WPD_CROPPED_STATUS_NOT_CROPPED = 0_i32
    WPD_CROPPED_STATUS_CROPPED = 1_i32
    WPD_CROPPED_STATUS_SHOULD_NOT_BE_CROPPED = 2_i32
  end
  enum WPD_COLOR_CORRECTED_STATUS_VALUES
    WPD_COLOR_CORRECTED_STATUS_NOT_CORRECTED = 0_i32
    WPD_COLOR_CORRECTED_STATUS_CORRECTED = 1_i32
    WPD_COLOR_CORRECTED_STATUS_SHOULD_NOT_BE_CORRECTED = 2_i32
  end
  enum WPD_VIDEO_SCAN_TYPES
    WPD_VIDEO_SCAN_TYPE_UNUSED = 0_i32
    WPD_VIDEO_SCAN_TYPE_PROGRESSIVE = 1_i32
    WPD_VIDEO_SCAN_TYPE_FIELD_INTERLEAVED_UPPER_FIRST = 2_i32
    WPD_VIDEO_SCAN_TYPE_FIELD_INTERLEAVED_LOWER_FIRST = 3_i32
    WPD_VIDEO_SCAN_TYPE_FIELD_SINGLE_UPPER_FIRST = 4_i32
    WPD_VIDEO_SCAN_TYPE_FIELD_SINGLE_LOWER_FIRST = 5_i32
    WPD_VIDEO_SCAN_TYPE_MIXED_INTERLACE = 6_i32
    WPD_VIDEO_SCAN_TYPE_MIXED_INTERLACE_AND_PROGRESSIVE = 7_i32
  end
  enum WPD_OPERATION_STATES
    WPD_OPERATION_STATE_UNSPECIFIED = 0_i32
    WPD_OPERATION_STATE_STARTED = 1_i32
    WPD_OPERATION_STATE_RUNNING = 2_i32
    WPD_OPERATION_STATE_PAUSED = 3_i32
    WPD_OPERATION_STATE_CANCELLED = 4_i32
    WPD_OPERATION_STATE_FINISHED = 5_i32
    WPD_OPERATION_STATE_ABORTED = 6_i32
  end
  enum WPD_SECTION_DATA_UNITS_VALUES
    WPD_SECTION_DATA_UNITS_BYTES = 0_i32
    WPD_SECTION_DATA_UNITS_MILLISECONDS = 1_i32
  end
  enum WPD_RENDERING_INFORMATION_PROFILE_ENTRY_TYPES
    WPD_RENDERING_INFORMATION_PROFILE_ENTRY_TYPE_OBJECT = 0_i32
    WPD_RENDERING_INFORMATION_PROFILE_ENTRY_TYPE_RESOURCE = 1_i32
  end
  enum WPD_COMMAND_ACCESS_TYPES
    WPD_COMMAND_ACCESS_READ = 1_i32
    WPD_COMMAND_ACCESS_READWRITE = 3_i32
    WPD_COMMAND_ACCESS_FROM_PROPERTY_WITH_STGM_ACCESS = 4_i32
    WPD_COMMAND_ACCESS_FROM_PROPERTY_WITH_FILE_ACCESS = 8_i32
    WPD_COMMAND_ACCESS_FROM_ATTRIBUTE_WITH_METHOD_ACCESS = 16_i32
  end
  enum WPD_SERVICE_INHERITANCE_TYPES
    WPD_SERVICE_INHERITANCE_IMPLEMENTATION = 0_i32
  end
  enum WPD_PARAMETER_USAGE_TYPES
    WPD_PARAMETER_USAGE_RETURN = 0_i32
    WPD_PARAMETER_USAGE_IN = 1_i32
    WPD_PARAMETER_USAGE_OUT = 2_i32
    WPD_PARAMETER_USAGE_INOUT = 3_i32
  end
  enum WPD_STREAM_UNITS
    WPD_STREAM_UNITS_BYTES = 0_i32
    WPD_STREAM_UNITS_FRAMES = 1_i32
    WPD_STREAM_UNITS_ROWS = 2_i32
    WPD_STREAM_UNITS_MILLISECONDS = 4_i32
    WPD_STREAM_UNITS_MICROSECONDS = 8_i32
  end
  enum DEVICE_RADIO_STATE
    DRS_RADIO_ON = 0_i32
    DRS_SW_RADIO_OFF = 1_i32
    DRS_HW_RADIO_OFF = 2_i32
    DRS_SW_HW_RADIO_OFF = 3_i32
    DRS_HW_RADIO_ON_UNCONTROLLABLE = 4_i32
    DRS_RADIO_INVALID = 5_i32
    DRS_HW_RADIO_OFF_UNCONTROLLABLE = 6_i32
    DRS_RADIO_MAX = 6_i32
  end
  enum SYSTEM_RADIO_STATE
    SRS_RADIO_ENABLED = 0_i32
    SRS_RADIO_DISABLED = 1_i32
  end

  @[Extern]
  struct WPD_COMMAND_ACCESS_LOOKUP_ENTRY
    property command : Win32cr::Foundation::PROPERTYKEY
    property access_type : UInt32
    property access_property : Win32cr::Foundation::PROPERTYKEY
    def initialize(@command : Win32cr::Foundation::PROPERTYKEY, @access_type : UInt32, @access_property : Win32cr::Foundation::PROPERTYKEY)
    end
  end

  @[Extern]

  record IWpdSerializerVtable,
    query_interface : Proc(IWpdSerializer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWpdSerializer*, UInt32),
    release : Proc(IWpdSerializer*, UInt32),
    get_i_portable_device_values_from_buffer : Proc(IWpdSerializer*, UInt8*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    write_i_portable_device_values_to_buffer : Proc(IWpdSerializer*, UInt32, Void*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    get_buffer_from_i_portable_device_values : Proc(IWpdSerializer*, Void*, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_serialized_size : Proc(IWpdSerializer*, Void*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWpdSerializer, lpVtbl : IWpdSerializerVtable* do
    GUID = LibC::GUID.new(0xb32f4002_u32, 0xbb27_u16, 0x45ff_u16, StaticArray[0xaf_u8, 0x4f_u8, 0x6_u8, 0x63_u8, 0x1c_u8, 0x1e_u8, 0x8d_u8, 0xad_u8])
    def query_interface(this : IWpdSerializer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWpdSerializer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWpdSerializer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_i_portable_device_values_from_buffer(this : IWpdSerializer*, pBuffer : UInt8*, dwInputBufferLength : UInt32, ppParams : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_portable_device_values_from_buffer.call(this, pBuffer, dwInputBufferLength, ppParams)
    end
    def write_i_portable_device_values_to_buffer(this : IWpdSerializer*, dwOutputBufferLength : UInt32, pResults : Void*, pBuffer : UInt8*, pdwBytesWritten : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_i_portable_device_values_to_buffer.call(this, dwOutputBufferLength, pResults, pBuffer, pdwBytesWritten)
    end
    def get_buffer_from_i_portable_device_values(this : IWpdSerializer*, pSource : Void*, ppBuffer : UInt8**, pdwBufferSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_buffer_from_i_portable_device_values.call(this, pSource, ppBuffer, pdwBufferSize)
    end
    def get_serialized_size(this : IWpdSerializer*, pSource : Void*, pdwSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_serialized_size.call(this, pSource, pdwSize)
    end

  end

  @[Extern]

  record IPortableDeviceValuesVtable,
    query_interface : Proc(IPortableDeviceValues*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPortableDeviceValues*, UInt32),
    release : Proc(IPortableDeviceValues*, UInt32),
    get_count : Proc(IPortableDeviceValues*, UInt32*, Win32cr::Foundation::HRESULT),
    get_at : Proc(IPortableDeviceValues*, UInt32, Win32cr::Foundation::PROPERTYKEY*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    set_value : Proc(IPortableDeviceValues*, Win32cr::Foundation::PROPERTYKEY*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    get_value : Proc(IPortableDeviceValues*, Win32cr::Foundation::PROPERTYKEY*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    set_string_value : Proc(IPortableDeviceValues*, Win32cr::Foundation::PROPERTYKEY*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_string_value : Proc(IPortableDeviceValues*, Win32cr::Foundation::PROPERTYKEY*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_unsigned_integer_value : Proc(IPortableDeviceValues*, Win32cr::Foundation::PROPERTYKEY*, UInt32, Win32cr::Foundation::HRESULT),
    get_unsigned_integer_value : Proc(IPortableDeviceValues*, Win32cr::Foundation::PROPERTYKEY*, UInt32*, Win32cr::Foundation::HRESULT),
    set_signed_integer_value : Proc(IPortableDeviceValues*, Win32cr::Foundation::PROPERTYKEY*, Int32, Win32cr::Foundation::HRESULT),
    get_signed_integer_value : Proc(IPortableDeviceValues*, Win32cr::Foundation::PROPERTYKEY*, Int32*, Win32cr::Foundation::HRESULT),
    set_unsigned_large_integer_value : Proc(IPortableDeviceValues*, Win32cr::Foundation::PROPERTYKEY*, UInt64, Win32cr::Foundation::HRESULT),
    get_unsigned_large_integer_value : Proc(IPortableDeviceValues*, Win32cr::Foundation::PROPERTYKEY*, UInt64*, Win32cr::Foundation::HRESULT),
    set_signed_large_integer_value : Proc(IPortableDeviceValues*, Win32cr::Foundation::PROPERTYKEY*, Int64, Win32cr::Foundation::HRESULT),
    get_signed_large_integer_value : Proc(IPortableDeviceValues*, Win32cr::Foundation::PROPERTYKEY*, Int64*, Win32cr::Foundation::HRESULT),
    set_float_value : Proc(IPortableDeviceValues*, Win32cr::Foundation::PROPERTYKEY*, Float32, Win32cr::Foundation::HRESULT),
    get_float_value : Proc(IPortableDeviceValues*, Win32cr::Foundation::PROPERTYKEY*, Float32*, Win32cr::Foundation::HRESULT),
    set_error_value : Proc(IPortableDeviceValues*, Win32cr::Foundation::PROPERTYKEY*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    get_error_value : Proc(IPortableDeviceValues*, Win32cr::Foundation::PROPERTYKEY*, Win32cr::Foundation::HRESULT*, Win32cr::Foundation::HRESULT),
    set_key_value : Proc(IPortableDeviceValues*, Win32cr::Foundation::PROPERTYKEY*, Win32cr::Foundation::PROPERTYKEY*, Win32cr::Foundation::HRESULT),
    get_key_value : Proc(IPortableDeviceValues*, Win32cr::Foundation::PROPERTYKEY*, Win32cr::Foundation::PROPERTYKEY*, Win32cr::Foundation::HRESULT),
    set_bool_value : Proc(IPortableDeviceValues*, Win32cr::Foundation::PROPERTYKEY*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_bool_value : Proc(IPortableDeviceValues*, Win32cr::Foundation::PROPERTYKEY*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_i_unknown_value : Proc(IPortableDeviceValues*, Win32cr::Foundation::PROPERTYKEY*, Void*, Win32cr::Foundation::HRESULT),
    get_i_unknown_value : Proc(IPortableDeviceValues*, Win32cr::Foundation::PROPERTYKEY*, Void**, Win32cr::Foundation::HRESULT),
    set_guid_value : Proc(IPortableDeviceValues*, Win32cr::Foundation::PROPERTYKEY*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_guid_value : Proc(IPortableDeviceValues*, Win32cr::Foundation::PROPERTYKEY*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    set_buffer_value : Proc(IPortableDeviceValues*, Win32cr::Foundation::PROPERTYKEY*, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    get_buffer_value : Proc(IPortableDeviceValues*, Win32cr::Foundation::PROPERTYKEY*, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    set_i_portable_device_values_value : Proc(IPortableDeviceValues*, Win32cr::Foundation::PROPERTYKEY*, Void*, Win32cr::Foundation::HRESULT),
    get_i_portable_device_values_value : Proc(IPortableDeviceValues*, Win32cr::Foundation::PROPERTYKEY*, Void**, Win32cr::Foundation::HRESULT),
    set_i_portable_device_prop_variant_collection_value : Proc(IPortableDeviceValues*, Win32cr::Foundation::PROPERTYKEY*, Void*, Win32cr::Foundation::HRESULT),
    get_i_portable_device_prop_variant_collection_value : Proc(IPortableDeviceValues*, Win32cr::Foundation::PROPERTYKEY*, Void**, Win32cr::Foundation::HRESULT),
    set_i_portable_device_key_collection_value : Proc(IPortableDeviceValues*, Win32cr::Foundation::PROPERTYKEY*, Void*, Win32cr::Foundation::HRESULT),
    get_i_portable_device_key_collection_value : Proc(IPortableDeviceValues*, Win32cr::Foundation::PROPERTYKEY*, Void**, Win32cr::Foundation::HRESULT),
    set_i_portable_device_values_collection_value : Proc(IPortableDeviceValues*, Win32cr::Foundation::PROPERTYKEY*, Void*, Win32cr::Foundation::HRESULT),
    get_i_portable_device_values_collection_value : Proc(IPortableDeviceValues*, Win32cr::Foundation::PROPERTYKEY*, Void**, Win32cr::Foundation::HRESULT),
    remove_value : Proc(IPortableDeviceValues*, Win32cr::Foundation::PROPERTYKEY*, Win32cr::Foundation::HRESULT),
    copy_values_from_property_store : Proc(IPortableDeviceValues*, Void*, Win32cr::Foundation::HRESULT),
    copy_values_to_property_store : Proc(IPortableDeviceValues*, Void*, Win32cr::Foundation::HRESULT),
    clear : Proc(IPortableDeviceValues*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPortableDeviceValues, lpVtbl : IPortableDeviceValuesVtable* do
    GUID = LibC::GUID.new(0x6848f6f2_u32, 0x3155_u16, 0x4f86_u16, StaticArray[0xb6_u8, 0xf5_u8, 0x26_u8, 0x3e_u8, 0xee_u8, 0xab_u8, 0x31_u8, 0x43_u8])
    def query_interface(this : IPortableDeviceValues*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPortableDeviceValues*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPortableDeviceValues*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_count(this : IPortableDeviceValues*, pcelt : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, pcelt)
    end
    def get_at(this : IPortableDeviceValues*, index : UInt32, pKey : Win32cr::Foundation::PROPERTYKEY*, pValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_at.call(this, index, pKey, pValue)
    end
    def set_value(this : IPortableDeviceValues*, key : Win32cr::Foundation::PROPERTYKEY*, pValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_value.call(this, key, pValue)
    end
    def get_value(this : IPortableDeviceValues*, key : Win32cr::Foundation::PROPERTYKEY*, pValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_value.call(this, key, pValue)
    end
    def set_string_value(this : IPortableDeviceValues*, key : Win32cr::Foundation::PROPERTYKEY*, value : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_string_value.call(this, key, value)
    end
    def get_string_value(this : IPortableDeviceValues*, key : Win32cr::Foundation::PROPERTYKEY*, pValue : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_value.call(this, key, pValue)
    end
    def set_unsigned_integer_value(this : IPortableDeviceValues*, key : Win32cr::Foundation::PROPERTYKEY*, value : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_unsigned_integer_value.call(this, key, value)
    end
    def get_unsigned_integer_value(this : IPortableDeviceValues*, key : Win32cr::Foundation::PROPERTYKEY*, pValue : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_unsigned_integer_value.call(this, key, pValue)
    end
    def set_signed_integer_value(this : IPortableDeviceValues*, key : Win32cr::Foundation::PROPERTYKEY*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_signed_integer_value.call(this, key, value)
    end
    def get_signed_integer_value(this : IPortableDeviceValues*, key : Win32cr::Foundation::PROPERTYKEY*, pValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signed_integer_value.call(this, key, pValue)
    end
    def set_unsigned_large_integer_value(this : IPortableDeviceValues*, key : Win32cr::Foundation::PROPERTYKEY*, value : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_unsigned_large_integer_value.call(this, key, value)
    end
    def get_unsigned_large_integer_value(this : IPortableDeviceValues*, key : Win32cr::Foundation::PROPERTYKEY*, pValue : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_unsigned_large_integer_value.call(this, key, pValue)
    end
    def set_signed_large_integer_value(this : IPortableDeviceValues*, key : Win32cr::Foundation::PROPERTYKEY*, value : Int64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_signed_large_integer_value.call(this, key, value)
    end
    def get_signed_large_integer_value(this : IPortableDeviceValues*, key : Win32cr::Foundation::PROPERTYKEY*, pValue : Int64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signed_large_integer_value.call(this, key, pValue)
    end
    def set_float_value(this : IPortableDeviceValues*, key : Win32cr::Foundation::PROPERTYKEY*, value : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_float_value.call(this, key, value)
    end
    def get_float_value(this : IPortableDeviceValues*, key : Win32cr::Foundation::PROPERTYKEY*, pValue : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_float_value.call(this, key, pValue)
    end
    def set_error_value(this : IPortableDeviceValues*, key : Win32cr::Foundation::PROPERTYKEY*, value : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_error_value.call(this, key, value)
    end
    def get_error_value(this : IPortableDeviceValues*, key : Win32cr::Foundation::PROPERTYKEY*, pValue : Win32cr::Foundation::HRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_error_value.call(this, key, pValue)
    end
    def set_key_value(this : IPortableDeviceValues*, key : Win32cr::Foundation::PROPERTYKEY*, value : Win32cr::Foundation::PROPERTYKEY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_key_value.call(this, key, value)
    end
    def get_key_value(this : IPortableDeviceValues*, key : Win32cr::Foundation::PROPERTYKEY*, pValue : Win32cr::Foundation::PROPERTYKEY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_key_value.call(this, key, pValue)
    end
    def set_bool_value(this : IPortableDeviceValues*, key : Win32cr::Foundation::PROPERTYKEY*, value : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_bool_value.call(this, key, value)
    end
    def get_bool_value(this : IPortableDeviceValues*, key : Win32cr::Foundation::PROPERTYKEY*, pValue : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_bool_value.call(this, key, pValue)
    end
    def set_i_unknown_value(this : IPortableDeviceValues*, key : Win32cr::Foundation::PROPERTYKEY*, pValue : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_i_unknown_value.call(this, key, pValue)
    end
    def get_i_unknown_value(this : IPortableDeviceValues*, key : Win32cr::Foundation::PROPERTYKEY*, ppValue : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_unknown_value.call(this, key, ppValue)
    end
    def set_guid_value(this : IPortableDeviceValues*, key : Win32cr::Foundation::PROPERTYKEY*, value : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_guid_value.call(this, key, value)
    end
    def get_guid_value(this : IPortableDeviceValues*, key : Win32cr::Foundation::PROPERTYKEY*, pValue : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_guid_value.call(this, key, pValue)
    end
    def set_buffer_value(this : IPortableDeviceValues*, key : Win32cr::Foundation::PROPERTYKEY*, pValue : UInt8*, cbValue : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_buffer_value.call(this, key, pValue, cbValue)
    end
    def get_buffer_value(this : IPortableDeviceValues*, key : Win32cr::Foundation::PROPERTYKEY*, ppValue : UInt8**, pcbValue : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_buffer_value.call(this, key, ppValue, pcbValue)
    end
    def set_i_portable_device_values_value(this : IPortableDeviceValues*, key : Win32cr::Foundation::PROPERTYKEY*, pValue : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_i_portable_device_values_value.call(this, key, pValue)
    end
    def get_i_portable_device_values_value(this : IPortableDeviceValues*, key : Win32cr::Foundation::PROPERTYKEY*, ppValue : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_portable_device_values_value.call(this, key, ppValue)
    end
    def set_i_portable_device_prop_variant_collection_value(this : IPortableDeviceValues*, key : Win32cr::Foundation::PROPERTYKEY*, pValue : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_i_portable_device_prop_variant_collection_value.call(this, key, pValue)
    end
    def get_i_portable_device_prop_variant_collection_value(this : IPortableDeviceValues*, key : Win32cr::Foundation::PROPERTYKEY*, ppValue : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_portable_device_prop_variant_collection_value.call(this, key, ppValue)
    end
    def set_i_portable_device_key_collection_value(this : IPortableDeviceValues*, key : Win32cr::Foundation::PROPERTYKEY*, pValue : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_i_portable_device_key_collection_value.call(this, key, pValue)
    end
    def get_i_portable_device_key_collection_value(this : IPortableDeviceValues*, key : Win32cr::Foundation::PROPERTYKEY*, ppValue : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_portable_device_key_collection_value.call(this, key, ppValue)
    end
    def set_i_portable_device_values_collection_value(this : IPortableDeviceValues*, key : Win32cr::Foundation::PROPERTYKEY*, pValue : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_i_portable_device_values_collection_value.call(this, key, pValue)
    end
    def get_i_portable_device_values_collection_value(this : IPortableDeviceValues*, key : Win32cr::Foundation::PROPERTYKEY*, ppValue : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_portable_device_values_collection_value.call(this, key, ppValue)
    end
    def remove_value(this : IPortableDeviceValues*, key : Win32cr::Foundation::PROPERTYKEY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_value.call(this, key)
    end
    def copy_values_from_property_store(this : IPortableDeviceValues*, pStore : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_values_from_property_store.call(this, pStore)
    end
    def copy_values_to_property_store(this : IPortableDeviceValues*, pStore : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_values_to_property_store.call(this, pStore)
    end
    def clear(this : IPortableDeviceValues*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear.call(this)
    end

  end

  @[Extern]

  record IPortableDeviceKeyCollectionVtable,
    query_interface : Proc(IPortableDeviceKeyCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPortableDeviceKeyCollection*, UInt32),
    release : Proc(IPortableDeviceKeyCollection*, UInt32),
    get_count : Proc(IPortableDeviceKeyCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_at : Proc(IPortableDeviceKeyCollection*, UInt32, Win32cr::Foundation::PROPERTYKEY*, Win32cr::Foundation::HRESULT),
    add : Proc(IPortableDeviceKeyCollection*, Win32cr::Foundation::PROPERTYKEY*, Win32cr::Foundation::HRESULT),
    clear : Proc(IPortableDeviceKeyCollection*, Win32cr::Foundation::HRESULT),
    remove_at : Proc(IPortableDeviceKeyCollection*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPortableDeviceKeyCollection, lpVtbl : IPortableDeviceKeyCollectionVtable* do
    GUID = LibC::GUID.new(0xdada2357_u32, 0xe0ad_u16, 0x492e_u16, StaticArray[0x98_u8, 0xdb_u8, 0xdd_u8, 0x61_u8, 0xc5_u8, 0x3b_u8, 0xa3_u8, 0x53_u8])
    def query_interface(this : IPortableDeviceKeyCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPortableDeviceKeyCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPortableDeviceKeyCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_count(this : IPortableDeviceKeyCollection*, pcElems : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, pcElems)
    end
    def get_at(this : IPortableDeviceKeyCollection*, dwIndex : UInt32, pKey : Win32cr::Foundation::PROPERTYKEY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_at.call(this, dwIndex, pKey)
    end
    def add(this : IPortableDeviceKeyCollection*, key : Win32cr::Foundation::PROPERTYKEY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, key)
    end
    def clear(this : IPortableDeviceKeyCollection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear.call(this)
    end
    def remove_at(this : IPortableDeviceKeyCollection*, dwIndex : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_at.call(this, dwIndex)
    end

  end

  @[Extern]

  record IPortableDevicePropVariantCollectionVtable,
    query_interface : Proc(IPortableDevicePropVariantCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPortableDevicePropVariantCollection*, UInt32),
    release : Proc(IPortableDevicePropVariantCollection*, UInt32),
    get_count : Proc(IPortableDevicePropVariantCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_at : Proc(IPortableDevicePropVariantCollection*, UInt32, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    add : Proc(IPortableDevicePropVariantCollection*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    get_type : Proc(IPortableDevicePropVariantCollection*, UInt16*, Win32cr::Foundation::HRESULT),
    change_type : Proc(IPortableDevicePropVariantCollection*, UInt16, Win32cr::Foundation::HRESULT),
    clear : Proc(IPortableDevicePropVariantCollection*, Win32cr::Foundation::HRESULT),
    remove_at : Proc(IPortableDevicePropVariantCollection*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPortableDevicePropVariantCollection, lpVtbl : IPortableDevicePropVariantCollectionVtable* do
    GUID = LibC::GUID.new(0x89b2e422_u32, 0x4f1b_u16, 0x4316_u16, StaticArray[0xbc_u8, 0xef_u8, 0xa4_u8, 0x4a_u8, 0xfe_u8, 0xa8_u8, 0x3e_u8, 0xb3_u8])
    def query_interface(this : IPortableDevicePropVariantCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPortableDevicePropVariantCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPortableDevicePropVariantCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_count(this : IPortableDevicePropVariantCollection*, pcElems : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, pcElems)
    end
    def get_at(this : IPortableDevicePropVariantCollection*, dwIndex : UInt32, pValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_at.call(this, dwIndex, pValue)
    end
    def add(this : IPortableDevicePropVariantCollection*, pValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, pValue)
    end
    def get_type(this : IPortableDevicePropVariantCollection*, pvt : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, pvt)
    end
    def change_type(this : IPortableDevicePropVariantCollection*, vt : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.change_type.call(this, vt)
    end
    def clear(this : IPortableDevicePropVariantCollection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear.call(this)
    end
    def remove_at(this : IPortableDevicePropVariantCollection*, dwIndex : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_at.call(this, dwIndex)
    end

  end

  @[Extern]

  record IPortableDeviceValuesCollectionVtable,
    query_interface : Proc(IPortableDeviceValuesCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPortableDeviceValuesCollection*, UInt32),
    release : Proc(IPortableDeviceValuesCollection*, UInt32),
    get_count : Proc(IPortableDeviceValuesCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_at : Proc(IPortableDeviceValuesCollection*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    add : Proc(IPortableDeviceValuesCollection*, Void*, Win32cr::Foundation::HRESULT),
    clear : Proc(IPortableDeviceValuesCollection*, Win32cr::Foundation::HRESULT),
    remove_at : Proc(IPortableDeviceValuesCollection*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPortableDeviceValuesCollection, lpVtbl : IPortableDeviceValuesCollectionVtable* do
    GUID = LibC::GUID.new(0x6e3f2d79_u32, 0x4e07_u16, 0x48c4_u16, StaticArray[0x82_u8, 0x8_u8, 0xd8_u8, 0xc2_u8, 0xe5_u8, 0xaf_u8, 0x4a_u8, 0x99_u8])
    def query_interface(this : IPortableDeviceValuesCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPortableDeviceValuesCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPortableDeviceValuesCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_count(this : IPortableDeviceValuesCollection*, pcElems : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, pcElems)
    end
    def get_at(this : IPortableDeviceValuesCollection*, dwIndex : UInt32, ppValues : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_at.call(this, dwIndex, ppValues)
    end
    def add(this : IPortableDeviceValuesCollection*, pValues : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, pValues)
    end
    def clear(this : IPortableDeviceValuesCollection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear.call(this)
    end
    def remove_at(this : IPortableDeviceValuesCollection*, dwIndex : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_at.call(this, dwIndex)
    end

  end

  @[Extern]

  record IPortableDeviceManagerVtable,
    query_interface : Proc(IPortableDeviceManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPortableDeviceManager*, UInt32),
    release : Proc(IPortableDeviceManager*, UInt32),
    get_devices : Proc(IPortableDeviceManager*, Win32cr::Foundation::PWSTR*, UInt32*, Win32cr::Foundation::HRESULT),
    refresh_device_list : Proc(IPortableDeviceManager*, Win32cr::Foundation::HRESULT),
    get_device_friendly_name : Proc(IPortableDeviceManager*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_device_description : Proc(IPortableDeviceManager*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_device_manufacturer : Proc(IPortableDeviceManager*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_device_property : Proc(IPortableDeviceManager*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt8*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_private_devices : Proc(IPortableDeviceManager*, Win32cr::Foundation::PWSTR*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPortableDeviceManager, lpVtbl : IPortableDeviceManagerVtable* do
    GUID = LibC::GUID.new(0xa1567595_u32, 0x4c2f_u16, 0x4574_u16, StaticArray[0xa6_u8, 0xfa_u8, 0xec_u8, 0xef_u8, 0x91_u8, 0x7b_u8, 0x9a_u8, 0x40_u8])
    def query_interface(this : IPortableDeviceManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPortableDeviceManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPortableDeviceManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_devices(this : IPortableDeviceManager*, pPnPDeviceIDs : Win32cr::Foundation::PWSTR*, pcPnPDeviceIDs : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_devices.call(this, pPnPDeviceIDs, pcPnPDeviceIDs)
    end
    def refresh_device_list(this : IPortableDeviceManager*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh_device_list.call(this)
    end
    def get_device_friendly_name(this : IPortableDeviceManager*, pszPnPDeviceID : Win32cr::Foundation::PWSTR, pDeviceFriendlyName : Win32cr::Foundation::PWSTR, pcchDeviceFriendlyName : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_friendly_name.call(this, pszPnPDeviceID, pDeviceFriendlyName, pcchDeviceFriendlyName)
    end
    def get_device_description(this : IPortableDeviceManager*, pszPnPDeviceID : Win32cr::Foundation::PWSTR, pDeviceDescription : Win32cr::Foundation::PWSTR, pcchDeviceDescription : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_description.call(this, pszPnPDeviceID, pDeviceDescription, pcchDeviceDescription)
    end
    def get_device_manufacturer(this : IPortableDeviceManager*, pszPnPDeviceID : Win32cr::Foundation::PWSTR, pDeviceManufacturer : Win32cr::Foundation::PWSTR, pcchDeviceManufacturer : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_manufacturer.call(this, pszPnPDeviceID, pDeviceManufacturer, pcchDeviceManufacturer)
    end
    def get_device_property(this : IPortableDeviceManager*, pszPnPDeviceID : Win32cr::Foundation::PWSTR, pszDevicePropertyName : Win32cr::Foundation::PWSTR, pData : UInt8*, pcbData : UInt32*, pdwType : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_property.call(this, pszPnPDeviceID, pszDevicePropertyName, pData, pcbData, pdwType)
    end
    def get_private_devices(this : IPortableDeviceManager*, pPnPDeviceIDs : Win32cr::Foundation::PWSTR*, pcPnPDeviceIDs : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_devices.call(this, pPnPDeviceIDs, pcPnPDeviceIDs)
    end

  end

  @[Extern]

  record IPortableDeviceVtable,
    query_interface : Proc(IPortableDevice*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPortableDevice*, UInt32),
    release : Proc(IPortableDevice*, UInt32),
    open : Proc(IPortableDevice*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::HRESULT),
    send_command : Proc(IPortableDevice*, UInt32, Void*, Void**, Win32cr::Foundation::HRESULT),
    content : Proc(IPortableDevice*, Void**, Win32cr::Foundation::HRESULT),
    capabilities : Proc(IPortableDevice*, Void**, Win32cr::Foundation::HRESULT),
    cancel : Proc(IPortableDevice*, Win32cr::Foundation::HRESULT),
    close : Proc(IPortableDevice*, Win32cr::Foundation::HRESULT),
    advise : Proc(IPortableDevice*, UInt32, Void*, Void*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    unadvise : Proc(IPortableDevice*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_pn_p_device_id : Proc(IPortableDevice*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPortableDevice, lpVtbl : IPortableDeviceVtable* do
    GUID = LibC::GUID.new(0x625e2df8_u32, 0x6392_u16, 0x4cf0_u16, StaticArray[0x9a_u8, 0xd1_u8, 0x3c_u8, 0xfa_u8, 0x5f_u8, 0x17_u8, 0x77_u8, 0x5c_u8])
    def query_interface(this : IPortableDevice*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPortableDevice*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPortableDevice*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def open(this : IPortableDevice*, pszPnPDeviceID : Win32cr::Foundation::PWSTR, pClientInfo : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open.call(this, pszPnPDeviceID, pClientInfo)
    end
    def send_command(this : IPortableDevice*, dwFlags : UInt32, pParameters : Void*, ppResults : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_command.call(this, dwFlags, pParameters, ppResults)
    end
    def content(this : IPortableDevice*, ppContent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.content.call(this, ppContent)
    end
    def capabilities(this : IPortableDevice*, ppCapabilities : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.capabilities.call(this, ppCapabilities)
    end
    def cancel(this : IPortableDevice*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel.call(this)
    end
    def close(this : IPortableDevice*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end
    def advise(this : IPortableDevice*, dwFlags : UInt32, pCallback : Void*, pParameters : Void*, ppszCookie : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.advise.call(this, dwFlags, pCallback, pParameters, ppszCookie)
    end
    def unadvise(this : IPortableDevice*, pszCookie : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unadvise.call(this, pszCookie)
    end
    def get_pn_p_device_id(this : IPortableDevice*, ppszPnPDeviceID : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pn_p_device_id.call(this, ppszPnPDeviceID)
    end

  end

  @[Extern]

  record IPortableDeviceContentVtable,
    query_interface : Proc(IPortableDeviceContent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPortableDeviceContent*, UInt32),
    release : Proc(IPortableDeviceContent*, UInt32),
    enum_objects : Proc(IPortableDeviceContent*, UInt32, Win32cr::Foundation::PWSTR, Void*, Void**, Win32cr::Foundation::HRESULT),
    properties : Proc(IPortableDeviceContent*, Void**, Win32cr::Foundation::HRESULT),
    transfer : Proc(IPortableDeviceContent*, Void**, Win32cr::Foundation::HRESULT),
    create_object_with_properties_only : Proc(IPortableDeviceContent*, Void*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    create_object_with_properties_and_data : Proc(IPortableDeviceContent*, Void*, Void**, UInt32*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    delete : Proc(IPortableDeviceContent*, UInt32, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_object_i_ds_from_persistent_unique_i_ds : Proc(IPortableDeviceContent*, Void*, Void**, Win32cr::Foundation::HRESULT),
    cancel : Proc(IPortableDeviceContent*, Win32cr::Foundation::HRESULT),
    move : Proc(IPortableDeviceContent*, Void*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    copy : Proc(IPortableDeviceContent*, Void*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPortableDeviceContent, lpVtbl : IPortableDeviceContentVtable* do
    GUID = LibC::GUID.new(0x6a96ed84_u32, 0x7c73_u16, 0x4480_u16, StaticArray[0x99_u8, 0x38_u8, 0xbf_u8, 0x5a_u8, 0xf4_u8, 0x77_u8, 0xd4_u8, 0x26_u8])
    def query_interface(this : IPortableDeviceContent*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPortableDeviceContent*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPortableDeviceContent*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def enum_objects(this : IPortableDeviceContent*, dwFlags : UInt32, pszParentObjectID : Win32cr::Foundation::PWSTR, pFilter : Void*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_objects.call(this, dwFlags, pszParentObjectID, pFilter, ppEnum)
    end
    def properties(this : IPortableDeviceContent*, ppProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.properties.call(this, ppProperties)
    end
    def transfer(this : IPortableDeviceContent*, ppResources : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.transfer.call(this, ppResources)
    end
    def create_object_with_properties_only(this : IPortableDeviceContent*, pValues : Void*, ppszObjectID : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_object_with_properties_only.call(this, pValues, ppszObjectID)
    end
    def create_object_with_properties_and_data(this : IPortableDeviceContent*, pValues : Void*, ppData : Void**, pdwOptimalWriteBufferSize : UInt32*, ppszCookie : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_object_with_properties_and_data.call(this, pValues, ppData, pdwOptimalWriteBufferSize, ppszCookie)
    end
    def delete(this : IPortableDeviceContent*, dwOptions : UInt32, pObjectIDs : Void*, ppResults : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this, dwOptions, pObjectIDs, ppResults)
    end
    def get_object_i_ds_from_persistent_unique_i_ds(this : IPortableDeviceContent*, pPersistentUniqueIDs : Void*, ppObjectIDs : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_i_ds_from_persistent_unique_i_ds.call(this, pPersistentUniqueIDs, ppObjectIDs)
    end
    def cancel(this : IPortableDeviceContent*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel.call(this)
    end
    def move(this : IPortableDeviceContent*, pObjectIDs : Void*, pszDestinationFolderObjectID : Win32cr::Foundation::PWSTR, ppResults : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move.call(this, pObjectIDs, pszDestinationFolderObjectID, ppResults)
    end
    def copy(this : IPortableDeviceContent*, pObjectIDs : Void*, pszDestinationFolderObjectID : Win32cr::Foundation::PWSTR, ppResults : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy.call(this, pObjectIDs, pszDestinationFolderObjectID, ppResults)
    end

  end

  @[Extern]

  record IPortableDeviceContent2Vtable,
    query_interface : Proc(IPortableDeviceContent2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPortableDeviceContent2*, UInt32),
    release : Proc(IPortableDeviceContent2*, UInt32),
    enum_objects : Proc(IPortableDeviceContent2*, UInt32, Win32cr::Foundation::PWSTR, Void*, Void**, Win32cr::Foundation::HRESULT),
    properties : Proc(IPortableDeviceContent2*, Void**, Win32cr::Foundation::HRESULT),
    transfer : Proc(IPortableDeviceContent2*, Void**, Win32cr::Foundation::HRESULT),
    create_object_with_properties_only : Proc(IPortableDeviceContent2*, Void*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    create_object_with_properties_and_data : Proc(IPortableDeviceContent2*, Void*, Void**, UInt32*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    delete : Proc(IPortableDeviceContent2*, UInt32, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_object_i_ds_from_persistent_unique_i_ds : Proc(IPortableDeviceContent2*, Void*, Void**, Win32cr::Foundation::HRESULT),
    cancel : Proc(IPortableDeviceContent2*, Win32cr::Foundation::HRESULT),
    move : Proc(IPortableDeviceContent2*, Void*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    copy : Proc(IPortableDeviceContent2*, Void*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    update_object_with_properties_and_data : Proc(IPortableDeviceContent2*, Win32cr::Foundation::PWSTR, Void*, Void**, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPortableDeviceContent2, lpVtbl : IPortableDeviceContent2Vtable* do
    GUID = LibC::GUID.new(0x9b4add96_u32, 0xf6bf_u16, 0x4034_u16, StaticArray[0x87_u8, 0x8_u8, 0xec_u8, 0xa7_u8, 0x2b_u8, 0xf1_u8, 0x5_u8, 0x54_u8])
    def query_interface(this : IPortableDeviceContent2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPortableDeviceContent2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPortableDeviceContent2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def enum_objects(this : IPortableDeviceContent2*, dwFlags : UInt32, pszParentObjectID : Win32cr::Foundation::PWSTR, pFilter : Void*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_objects.call(this, dwFlags, pszParentObjectID, pFilter, ppEnum)
    end
    def properties(this : IPortableDeviceContent2*, ppProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.properties.call(this, ppProperties)
    end
    def transfer(this : IPortableDeviceContent2*, ppResources : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.transfer.call(this, ppResources)
    end
    def create_object_with_properties_only(this : IPortableDeviceContent2*, pValues : Void*, ppszObjectID : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_object_with_properties_only.call(this, pValues, ppszObjectID)
    end
    def create_object_with_properties_and_data(this : IPortableDeviceContent2*, pValues : Void*, ppData : Void**, pdwOptimalWriteBufferSize : UInt32*, ppszCookie : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_object_with_properties_and_data.call(this, pValues, ppData, pdwOptimalWriteBufferSize, ppszCookie)
    end
    def delete(this : IPortableDeviceContent2*, dwOptions : UInt32, pObjectIDs : Void*, ppResults : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this, dwOptions, pObjectIDs, ppResults)
    end
    def get_object_i_ds_from_persistent_unique_i_ds(this : IPortableDeviceContent2*, pPersistentUniqueIDs : Void*, ppObjectIDs : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_i_ds_from_persistent_unique_i_ds.call(this, pPersistentUniqueIDs, ppObjectIDs)
    end
    def cancel(this : IPortableDeviceContent2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel.call(this)
    end
    def move(this : IPortableDeviceContent2*, pObjectIDs : Void*, pszDestinationFolderObjectID : Win32cr::Foundation::PWSTR, ppResults : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move.call(this, pObjectIDs, pszDestinationFolderObjectID, ppResults)
    end
    def copy(this : IPortableDeviceContent2*, pObjectIDs : Void*, pszDestinationFolderObjectID : Win32cr::Foundation::PWSTR, ppResults : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy.call(this, pObjectIDs, pszDestinationFolderObjectID, ppResults)
    end
    def update_object_with_properties_and_data(this : IPortableDeviceContent2*, pszObjectID : Win32cr::Foundation::PWSTR, pProperties : Void*, ppData : Void**, pdwOptimalWriteBufferSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update_object_with_properties_and_data.call(this, pszObjectID, pProperties, ppData, pdwOptimalWriteBufferSize)
    end

  end

  @[Extern]

  record IEnumPortableDeviceObjectIDsVtable,
    query_interface : Proc(IEnumPortableDeviceObjectIDs*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumPortableDeviceObjectIDs*, UInt32),
    release : Proc(IEnumPortableDeviceObjectIDs*, UInt32),
    next__ : Proc(IEnumPortableDeviceObjectIDs*, UInt32, Win32cr::Foundation::PWSTR*, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumPortableDeviceObjectIDs*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumPortableDeviceObjectIDs*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumPortableDeviceObjectIDs*, Void**, Win32cr::Foundation::HRESULT),
    cancel : Proc(IEnumPortableDeviceObjectIDs*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumPortableDeviceObjectIDs, lpVtbl : IEnumPortableDeviceObjectIDsVtable* do
    GUID = LibC::GUID.new(0x10ece955_u32, 0xcf41_u16, 0x4728_u16, StaticArray[0xbf_u8, 0xa0_u8, 0x41_u8, 0xee_u8, 0xdf_u8, 0x1b_u8, 0xbf_u8, 0x19_u8])
    def query_interface(this : IEnumPortableDeviceObjectIDs*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumPortableDeviceObjectIDs*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumPortableDeviceObjectIDs*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumPortableDeviceObjectIDs*, cObjects : UInt32, pObjIDs : Win32cr::Foundation::PWSTR*, pcFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, cObjects, pObjIDs, pcFetched)
    end
    def skip(this : IEnumPortableDeviceObjectIDs*, cObjects : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, cObjects)
    end
    def reset(this : IEnumPortableDeviceObjectIDs*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumPortableDeviceObjectIDs*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end
    def cancel(this : IEnumPortableDeviceObjectIDs*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel.call(this)
    end

  end

  @[Extern]

  record IPortableDevicePropertiesVtable,
    query_interface : Proc(IPortableDeviceProperties*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPortableDeviceProperties*, UInt32),
    release : Proc(IPortableDeviceProperties*, UInt32),
    get_supported_properties : Proc(IPortableDeviceProperties*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    get_property_attributes : Proc(IPortableDeviceProperties*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PROPERTYKEY*, Void**, Win32cr::Foundation::HRESULT),
    get_values : Proc(IPortableDeviceProperties*, Win32cr::Foundation::PWSTR, Void*, Void**, Win32cr::Foundation::HRESULT),
    set_values : Proc(IPortableDeviceProperties*, Win32cr::Foundation::PWSTR, Void*, Void**, Win32cr::Foundation::HRESULT),
    delete : Proc(IPortableDeviceProperties*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::HRESULT),
    cancel : Proc(IPortableDeviceProperties*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPortableDeviceProperties, lpVtbl : IPortableDevicePropertiesVtable* do
    GUID = LibC::GUID.new(0x7f6d695c_u32, 0x3df_u16, 0x4439_u16, StaticArray[0xa8_u8, 0x9_u8, 0x59_u8, 0x26_u8, 0x6b_u8, 0xee_u8, 0xe3_u8, 0xa6_u8])
    def query_interface(this : IPortableDeviceProperties*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPortableDeviceProperties*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPortableDeviceProperties*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_supported_properties(this : IPortableDeviceProperties*, pszObjectID : Win32cr::Foundation::PWSTR, ppKeys : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_supported_properties.call(this, pszObjectID, ppKeys)
    end
    def get_property_attributes(this : IPortableDeviceProperties*, pszObjectID : Win32cr::Foundation::PWSTR, key : Win32cr::Foundation::PROPERTYKEY*, ppAttributes : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_attributes.call(this, pszObjectID, key, ppAttributes)
    end
    def get_values(this : IPortableDeviceProperties*, pszObjectID : Win32cr::Foundation::PWSTR, pKeys : Void*, ppValues : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_values.call(this, pszObjectID, pKeys, ppValues)
    end
    def set_values(this : IPortableDeviceProperties*, pszObjectID : Win32cr::Foundation::PWSTR, pValues : Void*, ppResults : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_values.call(this, pszObjectID, pValues, ppResults)
    end
    def delete(this : IPortableDeviceProperties*, pszObjectID : Win32cr::Foundation::PWSTR, pKeys : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this, pszObjectID, pKeys)
    end
    def cancel(this : IPortableDeviceProperties*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel.call(this)
    end

  end

  @[Extern]

  record IPortableDeviceResourcesVtable,
    query_interface : Proc(IPortableDeviceResources*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPortableDeviceResources*, UInt32),
    release : Proc(IPortableDeviceResources*, UInt32),
    get_supported_resources : Proc(IPortableDeviceResources*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    get_resource_attributes : Proc(IPortableDeviceResources*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PROPERTYKEY*, Void**, Win32cr::Foundation::HRESULT),
    get_stream : Proc(IPortableDeviceResources*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PROPERTYKEY*, UInt32, UInt32*, Void**, Win32cr::Foundation::HRESULT),
    delete : Proc(IPortableDeviceResources*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::HRESULT),
    cancel : Proc(IPortableDeviceResources*, Win32cr::Foundation::HRESULT),
    create_resource : Proc(IPortableDeviceResources*, Void*, Void**, UInt32*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPortableDeviceResources, lpVtbl : IPortableDeviceResourcesVtable* do
    GUID = LibC::GUID.new(0xfd8878ac_u32, 0xd841_u16, 0x4d17_u16, StaticArray[0x89_u8, 0x1c_u8, 0xe6_u8, 0x82_u8, 0x9c_u8, 0xdb_u8, 0x69_u8, 0x34_u8])
    def query_interface(this : IPortableDeviceResources*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPortableDeviceResources*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPortableDeviceResources*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_supported_resources(this : IPortableDeviceResources*, pszObjectID : Win32cr::Foundation::PWSTR, ppKeys : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_supported_resources.call(this, pszObjectID, ppKeys)
    end
    def get_resource_attributes(this : IPortableDeviceResources*, pszObjectID : Win32cr::Foundation::PWSTR, key : Win32cr::Foundation::PROPERTYKEY*, ppResourceAttributes : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_resource_attributes.call(this, pszObjectID, key, ppResourceAttributes)
    end
    def get_stream(this : IPortableDeviceResources*, pszObjectID : Win32cr::Foundation::PWSTR, key : Win32cr::Foundation::PROPERTYKEY*, dwMode : UInt32, pdwOptimalBufferSize : UInt32*, ppStream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream.call(this, pszObjectID, key, dwMode, pdwOptimalBufferSize, ppStream)
    end
    def delete(this : IPortableDeviceResources*, pszObjectID : Win32cr::Foundation::PWSTR, pKeys : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this, pszObjectID, pKeys)
    end
    def cancel(this : IPortableDeviceResources*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel.call(this)
    end
    def create_resource(this : IPortableDeviceResources*, pResourceAttributes : Void*, ppData : Void**, pdwOptimalWriteBufferSize : UInt32*, ppszCookie : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_resource.call(this, pResourceAttributes, ppData, pdwOptimalWriteBufferSize, ppszCookie)
    end

  end

  @[Extern]

  record IPortableDeviceCapabilitiesVtable,
    query_interface : Proc(IPortableDeviceCapabilities*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPortableDeviceCapabilities*, UInt32),
    release : Proc(IPortableDeviceCapabilities*, UInt32),
    get_supported_commands : Proc(IPortableDeviceCapabilities*, Void**, Win32cr::Foundation::HRESULT),
    get_command_options : Proc(IPortableDeviceCapabilities*, Win32cr::Foundation::PROPERTYKEY*, Void**, Win32cr::Foundation::HRESULT),
    get_functional_categories : Proc(IPortableDeviceCapabilities*, Void**, Win32cr::Foundation::HRESULT),
    get_functional_objects : Proc(IPortableDeviceCapabilities*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_supported_content_types : Proc(IPortableDeviceCapabilities*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_supported_formats : Proc(IPortableDeviceCapabilities*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_supported_format_properties : Proc(IPortableDeviceCapabilities*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_fixed_property_attributes : Proc(IPortableDeviceCapabilities*, LibC::GUID*, Win32cr::Foundation::PROPERTYKEY*, Void**, Win32cr::Foundation::HRESULT),
    cancel : Proc(IPortableDeviceCapabilities*, Win32cr::Foundation::HRESULT),
    get_supported_events : Proc(IPortableDeviceCapabilities*, Void**, Win32cr::Foundation::HRESULT),
    get_event_options : Proc(IPortableDeviceCapabilities*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPortableDeviceCapabilities, lpVtbl : IPortableDeviceCapabilitiesVtable* do
    GUID = LibC::GUID.new(0x2c8c6dbf_u32, 0xe3dc_u16, 0x4061_u16, StaticArray[0xbe_u8, 0xcc_u8, 0x85_u8, 0x42_u8, 0xe8_u8, 0x10_u8, 0xd1_u8, 0x26_u8])
    def query_interface(this : IPortableDeviceCapabilities*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPortableDeviceCapabilities*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPortableDeviceCapabilities*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_supported_commands(this : IPortableDeviceCapabilities*, ppCommands : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_supported_commands.call(this, ppCommands)
    end
    def get_command_options(this : IPortableDeviceCapabilities*, command : Win32cr::Foundation::PROPERTYKEY*, ppOptions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_command_options.call(this, command, ppOptions)
    end
    def get_functional_categories(this : IPortableDeviceCapabilities*, ppCategories : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_functional_categories.call(this, ppCategories)
    end
    def get_functional_objects(this : IPortableDeviceCapabilities*, category : LibC::GUID*, ppObjectIDs : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_functional_objects.call(this, category, ppObjectIDs)
    end
    def get_supported_content_types(this : IPortableDeviceCapabilities*, category : LibC::GUID*, ppContentTypes : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_supported_content_types.call(this, category, ppContentTypes)
    end
    def get_supported_formats(this : IPortableDeviceCapabilities*, content_type : LibC::GUID*, ppFormats : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_supported_formats.call(this, content_type, ppFormats)
    end
    def get_supported_format_properties(this : IPortableDeviceCapabilities*, format : LibC::GUID*, ppKeys : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_supported_format_properties.call(this, format, ppKeys)
    end
    def get_fixed_property_attributes(this : IPortableDeviceCapabilities*, format : LibC::GUID*, key : Win32cr::Foundation::PROPERTYKEY*, ppAttributes : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_fixed_property_attributes.call(this, format, key, ppAttributes)
    end
    def cancel(this : IPortableDeviceCapabilities*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel.call(this)
    end
    def get_supported_events(this : IPortableDeviceCapabilities*, ppEvents : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_supported_events.call(this, ppEvents)
    end
    def get_event_options(this : IPortableDeviceCapabilities*, event : LibC::GUID*, ppOptions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_options.call(this, event, ppOptions)
    end

  end

  @[Extern]

  record IPortableDeviceEventCallbackVtable,
    query_interface : Proc(IPortableDeviceEventCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPortableDeviceEventCallback*, UInt32),
    release : Proc(IPortableDeviceEventCallback*, UInt32),
    on_event : Proc(IPortableDeviceEventCallback*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPortableDeviceEventCallback, lpVtbl : IPortableDeviceEventCallbackVtable* do
    GUID = LibC::GUID.new(0xa8792a31_u32, 0xf385_u16, 0x493c_u16, StaticArray[0xa8_u8, 0x93_u8, 0x40_u8, 0xf6_u8, 0x4e_u8, 0xb4_u8, 0x5f_u8, 0x6e_u8])
    def query_interface(this : IPortableDeviceEventCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPortableDeviceEventCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPortableDeviceEventCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_event(this : IPortableDeviceEventCallback*, pEventParameters : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_event.call(this, pEventParameters)
    end

  end

  @[Extern]

  record IPortableDeviceDataStreamVtable,
    query_interface : Proc(IPortableDeviceDataStream*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPortableDeviceDataStream*, UInt32),
    release : Proc(IPortableDeviceDataStream*, UInt32),
    read : Proc(IPortableDeviceDataStream*, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    write : Proc(IPortableDeviceDataStream*, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    seek : Proc(IPortableDeviceDataStream*, Int64, Win32cr::System::Com::STREAM_SEEK, UInt64*, Win32cr::Foundation::HRESULT),
    set_size : Proc(IPortableDeviceDataStream*, UInt64, Win32cr::Foundation::HRESULT),
    copy_to : Proc(IPortableDeviceDataStream*, Void*, UInt64, UInt64*, UInt64*, Win32cr::Foundation::HRESULT),
    commit : Proc(IPortableDeviceDataStream*, Win32cr::System::Com::STGC, Win32cr::Foundation::HRESULT),
    revert : Proc(IPortableDeviceDataStream*, Win32cr::Foundation::HRESULT),
    lock_region : Proc(IPortableDeviceDataStream*, UInt64, UInt64, Win32cr::System::Com::LOCKTYPE, Win32cr::Foundation::HRESULT),
    unlock_region : Proc(IPortableDeviceDataStream*, UInt64, UInt64, UInt32, Win32cr::Foundation::HRESULT),
    stat : Proc(IPortableDeviceDataStream*, Win32cr::System::Com::STATSTG*, Win32cr::System::Com::STATFLAG, Win32cr::Foundation::HRESULT),
    clone : Proc(IPortableDeviceDataStream*, Void**, Win32cr::Foundation::HRESULT),
    get_object_id : Proc(IPortableDeviceDataStream*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    cancel : Proc(IPortableDeviceDataStream*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPortableDeviceDataStream, lpVtbl : IPortableDeviceDataStreamVtable* do
    GUID = LibC::GUID.new(0x88e04db3_u32, 0x1012_u16, 0x4d64_u16, StaticArray[0x99_u8, 0x96_u8, 0xf7_u8, 0x3_u8, 0xa9_u8, 0x50_u8, 0xd3_u8, 0xf4_u8])
    def query_interface(this : IPortableDeviceDataStream*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPortableDeviceDataStream*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPortableDeviceDataStream*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def read(this : IPortableDeviceDataStream*, pv : Void*, cb : UInt32, pcbRead : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read.call(this, pv, cb, pcbRead)
    end
    def write(this : IPortableDeviceDataStream*, pv : Void*, cb : UInt32, pcbWritten : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write.call(this, pv, cb, pcbWritten)
    end
    def seek(this : IPortableDeviceDataStream*, dlibMove : Int64, dwOrigin : Win32cr::System::Com::STREAM_SEEK, plibNewPosition : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.seek.call(this, dlibMove, dwOrigin, plibNewPosition)
    end
    def set_size(this : IPortableDeviceDataStream*, libNewSize : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_size.call(this, libNewSize)
    end
    def copy_to(this : IPortableDeviceDataStream*, pstm : Void*, cb : UInt64, pcbRead : UInt64*, pcbWritten : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_to.call(this, pstm, cb, pcbRead, pcbWritten)
    end
    def commit(this : IPortableDeviceDataStream*, grfCommitFlags : Win32cr::System::Com::STGC) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this, grfCommitFlags)
    end
    def revert(this : IPortableDeviceDataStream*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.revert.call(this)
    end
    def lock_region(this : IPortableDeviceDataStream*, libOffset : UInt64, cb : UInt64, dwLockType : Win32cr::System::Com::LOCKTYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lock_region.call(this, libOffset, cb, dwLockType)
    end
    def unlock_region(this : IPortableDeviceDataStream*, libOffset : UInt64, cb : UInt64, dwLockType : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unlock_region.call(this, libOffset, cb, dwLockType)
    end
    def stat(this : IPortableDeviceDataStream*, pstatstg : Win32cr::System::Com::STATSTG*, grfStatFlag : Win32cr::System::Com::STATFLAG) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stat.call(this, pstatstg, grfStatFlag)
    end
    def clone(this : IPortableDeviceDataStream*, ppstm : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppstm)
    end
    def get_object_id(this : IPortableDeviceDataStream*, ppszObjectID : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_id.call(this, ppszObjectID)
    end
    def cancel(this : IPortableDeviceDataStream*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel.call(this)
    end

  end

  @[Extern]

  record IPortableDeviceUnitsStreamVtable,
    query_interface : Proc(IPortableDeviceUnitsStream*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPortableDeviceUnitsStream*, UInt32),
    release : Proc(IPortableDeviceUnitsStream*, UInt32),
    seek_in_units : Proc(IPortableDeviceUnitsStream*, Int64, Win32cr::Devices::PortableDevices::WPD_STREAM_UNITS, UInt32, UInt64*, Win32cr::Foundation::HRESULT),
    cancel : Proc(IPortableDeviceUnitsStream*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPortableDeviceUnitsStream, lpVtbl : IPortableDeviceUnitsStreamVtable* do
    GUID = LibC::GUID.new(0x5e98025f_u32, 0xbfc4_u16, 0x47a2_u16, StaticArray[0x9a_u8, 0x5f_u8, 0xbc_u8, 0x90_u8, 0xa_u8, 0x50_u8, 0x7c_u8, 0x67_u8])
    def query_interface(this : IPortableDeviceUnitsStream*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPortableDeviceUnitsStream*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPortableDeviceUnitsStream*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def seek_in_units(this : IPortableDeviceUnitsStream*, dlibMove : Int64, units : Win32cr::Devices::PortableDevices::WPD_STREAM_UNITS, dwOrigin : UInt32, plibNewPosition : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.seek_in_units.call(this, dlibMove, units, dwOrigin, plibNewPosition)
    end
    def cancel(this : IPortableDeviceUnitsStream*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel.call(this)
    end

  end

  @[Extern]

  record IPortableDevicePropertiesBulkVtable,
    query_interface : Proc(IPortableDevicePropertiesBulk*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPortableDevicePropertiesBulk*, UInt32),
    release : Proc(IPortableDevicePropertiesBulk*, UInt32),
    queue_get_values_by_object_list : Proc(IPortableDevicePropertiesBulk*, Void*, Void*, Void*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    queue_get_values_by_object_format : Proc(IPortableDevicePropertiesBulk*, LibC::GUID*, Win32cr::Foundation::PWSTR, UInt32, Void*, Void*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    queue_set_values_by_object_list : Proc(IPortableDevicePropertiesBulk*, Void*, Void*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    start : Proc(IPortableDevicePropertiesBulk*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    cancel : Proc(IPortableDevicePropertiesBulk*, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPortableDevicePropertiesBulk, lpVtbl : IPortableDevicePropertiesBulkVtable* do
    GUID = LibC::GUID.new(0x482b05c0_u32, 0x4056_u16, 0x44ed_u16, StaticArray[0x9e_u8, 0xf_u8, 0x5e_u8, 0x23_u8, 0xb0_u8, 0x9_u8, 0xda_u8, 0x93_u8])
    def query_interface(this : IPortableDevicePropertiesBulk*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPortableDevicePropertiesBulk*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPortableDevicePropertiesBulk*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def queue_get_values_by_object_list(this : IPortableDevicePropertiesBulk*, pObjectIDs : Void*, pKeys : Void*, pCallback : Void*, pContext : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.queue_get_values_by_object_list.call(this, pObjectIDs, pKeys, pCallback, pContext)
    end
    def queue_get_values_by_object_format(this : IPortableDevicePropertiesBulk*, pguidObjectFormat : LibC::GUID*, pszParentObjectID : Win32cr::Foundation::PWSTR, dwDepth : UInt32, pKeys : Void*, pCallback : Void*, pContext : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.queue_get_values_by_object_format.call(this, pguidObjectFormat, pszParentObjectID, dwDepth, pKeys, pCallback, pContext)
    end
    def queue_set_values_by_object_list(this : IPortableDevicePropertiesBulk*, pObjectValues : Void*, pCallback : Void*, pContext : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.queue_set_values_by_object_list.call(this, pObjectValues, pCallback, pContext)
    end
    def start(this : IPortableDevicePropertiesBulk*, pContext : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start.call(this, pContext)
    end
    def cancel(this : IPortableDevicePropertiesBulk*, pContext : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel.call(this, pContext)
    end

  end

  @[Extern]

  record IPortableDevicePropertiesBulkCallbackVtable,
    query_interface : Proc(IPortableDevicePropertiesBulkCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPortableDevicePropertiesBulkCallback*, UInt32),
    release : Proc(IPortableDevicePropertiesBulkCallback*, UInt32),
    on_start : Proc(IPortableDevicePropertiesBulkCallback*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    on_progress : Proc(IPortableDevicePropertiesBulkCallback*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    on_end : Proc(IPortableDevicePropertiesBulkCallback*, LibC::GUID*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPortableDevicePropertiesBulkCallback, lpVtbl : IPortableDevicePropertiesBulkCallbackVtable* do
    GUID = LibC::GUID.new(0x9deacb80_u32, 0x11e8_u16, 0x40e3_u16, StaticArray[0xa9_u8, 0xf3_u8, 0xf5_u8, 0x57_u8, 0x98_u8, 0x6a_u8, 0x78_u8, 0x45_u8])
    def query_interface(this : IPortableDevicePropertiesBulkCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPortableDevicePropertiesBulkCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPortableDevicePropertiesBulkCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_start(this : IPortableDevicePropertiesBulkCallback*, pContext : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_start.call(this, pContext)
    end
    def on_progress(this : IPortableDevicePropertiesBulkCallback*, pContext : LibC::GUID*, pResults : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_progress.call(this, pContext, pResults)
    end
    def on_end(this : IPortableDevicePropertiesBulkCallback*, pContext : LibC::GUID*, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_end.call(this, pContext, hrStatus)
    end

  end

  @[Extern]

  record IPortableDeviceServiceManagerVtable,
    query_interface : Proc(IPortableDeviceServiceManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPortableDeviceServiceManager*, UInt32),
    release : Proc(IPortableDeviceServiceManager*, UInt32),
    get_device_services : Proc(IPortableDeviceServiceManager*, Win32cr::Foundation::PWSTR, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32*, Win32cr::Foundation::HRESULT),
    get_device_for_service : Proc(IPortableDeviceServiceManager*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPortableDeviceServiceManager, lpVtbl : IPortableDeviceServiceManagerVtable* do
    GUID = LibC::GUID.new(0xa8abc4e9_u32, 0xa84a_u16, 0x47a9_u16, StaticArray[0x80_u8, 0xb3_u8, 0xc5_u8, 0xd9_u8, 0xb1_u8, 0x72_u8, 0xa9_u8, 0x61_u8])
    def query_interface(this : IPortableDeviceServiceManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPortableDeviceServiceManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPortableDeviceServiceManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_device_services(this : IPortableDeviceServiceManager*, pszPnPDeviceID : Win32cr::Foundation::PWSTR, guidServiceCategory : LibC::GUID*, pServices : Win32cr::Foundation::PWSTR*, pcServices : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_services.call(this, pszPnPDeviceID, guidServiceCategory, pServices, pcServices)
    end
    def get_device_for_service(this : IPortableDeviceServiceManager*, pszPnPServiceID : Win32cr::Foundation::PWSTR, ppszPnPDeviceID : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_for_service.call(this, pszPnPServiceID, ppszPnPDeviceID)
    end

  end

  @[Extern]

  record IPortableDeviceServiceVtable,
    query_interface : Proc(IPortableDeviceService*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPortableDeviceService*, UInt32),
    release : Proc(IPortableDeviceService*, UInt32),
    open : Proc(IPortableDeviceService*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::HRESULT),
    capabilities : Proc(IPortableDeviceService*, Void**, Win32cr::Foundation::HRESULT),
    content : Proc(IPortableDeviceService*, Void**, Win32cr::Foundation::HRESULT),
    methods : Proc(IPortableDeviceService*, Void**, Win32cr::Foundation::HRESULT),
    cancel : Proc(IPortableDeviceService*, Win32cr::Foundation::HRESULT),
    close : Proc(IPortableDeviceService*, Win32cr::Foundation::HRESULT),
    get_service_object_id : Proc(IPortableDeviceService*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_pn_p_service_id : Proc(IPortableDeviceService*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    advise : Proc(IPortableDeviceService*, UInt32, Void*, Void*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    unadvise : Proc(IPortableDeviceService*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    send_command : Proc(IPortableDeviceService*, UInt32, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPortableDeviceService, lpVtbl : IPortableDeviceServiceVtable* do
    GUID = LibC::GUID.new(0xd3bd3a44_u32, 0xd7b5_u16, 0x40a9_u16, StaticArray[0x98_u8, 0xb7_u8, 0x2f_u8, 0xa4_u8, 0xd0_u8, 0x1d_u8, 0xec_u8, 0x8_u8])
    def query_interface(this : IPortableDeviceService*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPortableDeviceService*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPortableDeviceService*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def open(this : IPortableDeviceService*, pszPnPServiceID : Win32cr::Foundation::PWSTR, pClientInfo : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open.call(this, pszPnPServiceID, pClientInfo)
    end
    def capabilities(this : IPortableDeviceService*, ppCapabilities : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.capabilities.call(this, ppCapabilities)
    end
    def content(this : IPortableDeviceService*, ppContent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.content.call(this, ppContent)
    end
    def methods(this : IPortableDeviceService*, ppMethods : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.methods.call(this, ppMethods)
    end
    def cancel(this : IPortableDeviceService*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel.call(this)
    end
    def close(this : IPortableDeviceService*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end
    def get_service_object_id(this : IPortableDeviceService*, ppszServiceObjectID : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_service_object_id.call(this, ppszServiceObjectID)
    end
    def get_pn_p_service_id(this : IPortableDeviceService*, ppszPnPServiceID : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pn_p_service_id.call(this, ppszPnPServiceID)
    end
    def advise(this : IPortableDeviceService*, dwFlags : UInt32, pCallback : Void*, pParameters : Void*, ppszCookie : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.advise.call(this, dwFlags, pCallback, pParameters, ppszCookie)
    end
    def unadvise(this : IPortableDeviceService*, pszCookie : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unadvise.call(this, pszCookie)
    end
    def send_command(this : IPortableDeviceService*, dwFlags : UInt32, pParameters : Void*, ppResults : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_command.call(this, dwFlags, pParameters, ppResults)
    end

  end

  @[Extern]

  record IPortableDeviceServiceCapabilitiesVtable,
    query_interface : Proc(IPortableDeviceServiceCapabilities*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPortableDeviceServiceCapabilities*, UInt32),
    release : Proc(IPortableDeviceServiceCapabilities*, UInt32),
    get_supported_methods : Proc(IPortableDeviceServiceCapabilities*, Void**, Win32cr::Foundation::HRESULT),
    get_supported_methods_by_format : Proc(IPortableDeviceServiceCapabilities*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_method_attributes : Proc(IPortableDeviceServiceCapabilities*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_method_parameter_attributes : Proc(IPortableDeviceServiceCapabilities*, LibC::GUID*, Win32cr::Foundation::PROPERTYKEY*, Void**, Win32cr::Foundation::HRESULT),
    get_supported_formats : Proc(IPortableDeviceServiceCapabilities*, Void**, Win32cr::Foundation::HRESULT),
    get_format_attributes : Proc(IPortableDeviceServiceCapabilities*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_supported_format_properties : Proc(IPortableDeviceServiceCapabilities*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_format_property_attributes : Proc(IPortableDeviceServiceCapabilities*, LibC::GUID*, Win32cr::Foundation::PROPERTYKEY*, Void**, Win32cr::Foundation::HRESULT),
    get_supported_events : Proc(IPortableDeviceServiceCapabilities*, Void**, Win32cr::Foundation::HRESULT),
    get_event_attributes : Proc(IPortableDeviceServiceCapabilities*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_event_parameter_attributes : Proc(IPortableDeviceServiceCapabilities*, LibC::GUID*, Win32cr::Foundation::PROPERTYKEY*, Void**, Win32cr::Foundation::HRESULT),
    get_inherited_services : Proc(IPortableDeviceServiceCapabilities*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_format_rendering_profiles : Proc(IPortableDeviceServiceCapabilities*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_supported_commands : Proc(IPortableDeviceServiceCapabilities*, Void**, Win32cr::Foundation::HRESULT),
    get_command_options : Proc(IPortableDeviceServiceCapabilities*, Win32cr::Foundation::PROPERTYKEY*, Void**, Win32cr::Foundation::HRESULT),
    cancel : Proc(IPortableDeviceServiceCapabilities*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPortableDeviceServiceCapabilities, lpVtbl : IPortableDeviceServiceCapabilitiesVtable* do
    GUID = LibC::GUID.new(0x24dbd89d_u32, 0x413e_u16, 0x43e0_u16, StaticArray[0xbd_u8, 0x5b_u8, 0x19_u8, 0x7f_u8, 0x3c_u8, 0x56_u8, 0xc8_u8, 0x86_u8])
    def query_interface(this : IPortableDeviceServiceCapabilities*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPortableDeviceServiceCapabilities*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPortableDeviceServiceCapabilities*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_supported_methods(this : IPortableDeviceServiceCapabilities*, ppMethods : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_supported_methods.call(this, ppMethods)
    end
    def get_supported_methods_by_format(this : IPortableDeviceServiceCapabilities*, format : LibC::GUID*, ppMethods : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_supported_methods_by_format.call(this, format, ppMethods)
    end
    def get_method_attributes(this : IPortableDeviceServiceCapabilities*, method : LibC::GUID*, ppAttributes : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_method_attributes.call(this, method, ppAttributes)
    end
    def get_method_parameter_attributes(this : IPortableDeviceServiceCapabilities*, method : LibC::GUID*, parameter : Win32cr::Foundation::PROPERTYKEY*, ppAttributes : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_method_parameter_attributes.call(this, method, parameter, ppAttributes)
    end
    def get_supported_formats(this : IPortableDeviceServiceCapabilities*, ppFormats : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_supported_formats.call(this, ppFormats)
    end
    def get_format_attributes(this : IPortableDeviceServiceCapabilities*, format : LibC::GUID*, ppAttributes : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_format_attributes.call(this, format, ppAttributes)
    end
    def get_supported_format_properties(this : IPortableDeviceServiceCapabilities*, format : LibC::GUID*, ppKeys : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_supported_format_properties.call(this, format, ppKeys)
    end
    def get_format_property_attributes(this : IPortableDeviceServiceCapabilities*, format : LibC::GUID*, property : Win32cr::Foundation::PROPERTYKEY*, ppAttributes : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_format_property_attributes.call(this, format, property, ppAttributes)
    end
    def get_supported_events(this : IPortableDeviceServiceCapabilities*, ppEvents : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_supported_events.call(this, ppEvents)
    end
    def get_event_attributes(this : IPortableDeviceServiceCapabilities*, event : LibC::GUID*, ppAttributes : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_attributes.call(this, event, ppAttributes)
    end
    def get_event_parameter_attributes(this : IPortableDeviceServiceCapabilities*, event : LibC::GUID*, parameter : Win32cr::Foundation::PROPERTYKEY*, ppAttributes : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_parameter_attributes.call(this, event, parameter, ppAttributes)
    end
    def get_inherited_services(this : IPortableDeviceServiceCapabilities*, dwInheritanceType : UInt32, ppServices : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_inherited_services.call(this, dwInheritanceType, ppServices)
    end
    def get_format_rendering_profiles(this : IPortableDeviceServiceCapabilities*, format : LibC::GUID*, ppRenderingProfiles : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_format_rendering_profiles.call(this, format, ppRenderingProfiles)
    end
    def get_supported_commands(this : IPortableDeviceServiceCapabilities*, ppCommands : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_supported_commands.call(this, ppCommands)
    end
    def get_command_options(this : IPortableDeviceServiceCapabilities*, command : Win32cr::Foundation::PROPERTYKEY*, ppOptions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_command_options.call(this, command, ppOptions)
    end
    def cancel(this : IPortableDeviceServiceCapabilities*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel.call(this)
    end

  end

  @[Extern]

  record IPortableDeviceServiceMethodsVtable,
    query_interface : Proc(IPortableDeviceServiceMethods*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPortableDeviceServiceMethods*, UInt32),
    release : Proc(IPortableDeviceServiceMethods*, UInt32),
    invoke : Proc(IPortableDeviceServiceMethods*, LibC::GUID*, Void*, Void**, Win32cr::Foundation::HRESULT),
    invoke_async : Proc(IPortableDeviceServiceMethods*, LibC::GUID*, Void*, Void*, Win32cr::Foundation::HRESULT),
    cancel : Proc(IPortableDeviceServiceMethods*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPortableDeviceServiceMethods, lpVtbl : IPortableDeviceServiceMethodsVtable* do
    GUID = LibC::GUID.new(0xe20333c9_u32, 0xfd34_u16, 0x412d_u16, StaticArray[0xa3_u8, 0x81_u8, 0xcc_u8, 0x6f_u8, 0x2d_u8, 0x82_u8, 0xd_u8, 0xf7_u8])
    def query_interface(this : IPortableDeviceServiceMethods*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPortableDeviceServiceMethods*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPortableDeviceServiceMethods*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def invoke(this : IPortableDeviceServiceMethods*, method : LibC::GUID*, pParameters : Void*, ppResults : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke.call(this, method, pParameters, ppResults)
    end
    def invoke_async(this : IPortableDeviceServiceMethods*, method : LibC::GUID*, pParameters : Void*, pCallback : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_async.call(this, method, pParameters, pCallback)
    end
    def cancel(this : IPortableDeviceServiceMethods*, pCallback : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel.call(this, pCallback)
    end

  end

  @[Extern]

  record IPortableDeviceServiceMethodCallbackVtable,
    query_interface : Proc(IPortableDeviceServiceMethodCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPortableDeviceServiceMethodCallback*, UInt32),
    release : Proc(IPortableDeviceServiceMethodCallback*, UInt32),
    on_complete : Proc(IPortableDeviceServiceMethodCallback*, Win32cr::Foundation::HRESULT, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPortableDeviceServiceMethodCallback, lpVtbl : IPortableDeviceServiceMethodCallbackVtable* do
    GUID = LibC::GUID.new(0xc424233c_u32, 0xafce_u16, 0x4828_u16, StaticArray[0xa7_u8, 0x56_u8, 0x7e_u8, 0xd7_u8, 0xa2_u8, 0x35_u8, 0x0_u8, 0x83_u8])
    def query_interface(this : IPortableDeviceServiceMethodCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPortableDeviceServiceMethodCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPortableDeviceServiceMethodCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_complete(this : IPortableDeviceServiceMethodCallback*, hrStatus : Win32cr::Foundation::HRESULT, pResults : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_complete.call(this, hrStatus, pResults)
    end

  end

  @[Extern]

  record IPortableDeviceServiceActivationVtable,
    query_interface : Proc(IPortableDeviceServiceActivation*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPortableDeviceServiceActivation*, UInt32),
    release : Proc(IPortableDeviceServiceActivation*, UInt32),
    open_async : Proc(IPortableDeviceServiceActivation*, Win32cr::Foundation::PWSTR, Void*, Void*, Win32cr::Foundation::HRESULT),
    cancel_open_async : Proc(IPortableDeviceServiceActivation*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPortableDeviceServiceActivation, lpVtbl : IPortableDeviceServiceActivationVtable* do
    GUID = LibC::GUID.new(0xe56b0534_u32, 0xd9b9_u16, 0x425c_u16, StaticArray[0x9b_u8, 0x99_u8, 0x75_u8, 0xf9_u8, 0x7c_u8, 0xb3_u8, 0xd7_u8, 0xc8_u8])
    def query_interface(this : IPortableDeviceServiceActivation*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPortableDeviceServiceActivation*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPortableDeviceServiceActivation*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def open_async(this : IPortableDeviceServiceActivation*, pszPnPServiceID : Win32cr::Foundation::PWSTR, pClientInfo : Void*, pCallback : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_async.call(this, pszPnPServiceID, pClientInfo, pCallback)
    end
    def cancel_open_async(this : IPortableDeviceServiceActivation*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel_open_async.call(this)
    end

  end

  @[Extern]

  record IPortableDeviceServiceOpenCallbackVtable,
    query_interface : Proc(IPortableDeviceServiceOpenCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPortableDeviceServiceOpenCallback*, UInt32),
    release : Proc(IPortableDeviceServiceOpenCallback*, UInt32),
    on_complete : Proc(IPortableDeviceServiceOpenCallback*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPortableDeviceServiceOpenCallback, lpVtbl : IPortableDeviceServiceOpenCallbackVtable* do
    GUID = LibC::GUID.new(0xbced49c8_u32, 0x8efe_u16, 0x41ed_u16, StaticArray[0x96_u8, 0xb_u8, 0x61_u8, 0x31_u8, 0x3a_u8, 0xbd_u8, 0x47_u8, 0xa9_u8])
    def query_interface(this : IPortableDeviceServiceOpenCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPortableDeviceServiceOpenCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPortableDeviceServiceOpenCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_complete(this : IPortableDeviceServiceOpenCallback*, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_complete.call(this, hrStatus)
    end

  end

  @[Extern]

  record IPortableDeviceDispatchFactoryVtable,
    query_interface : Proc(IPortableDeviceDispatchFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPortableDeviceDispatchFactory*, UInt32),
    release : Proc(IPortableDeviceDispatchFactory*, UInt32),
    get_device_dispatch : Proc(IPortableDeviceDispatchFactory*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPortableDeviceDispatchFactory, lpVtbl : IPortableDeviceDispatchFactoryVtable* do
    GUID = LibC::GUID.new(0x5e1eafc3_u32, 0xe3d7_u16, 0x4132_u16, StaticArray[0x96_u8, 0xfa_u8, 0x75_u8, 0x9c_u8, 0xf_u8, 0x9d_u8, 0x1e_u8, 0xf_u8])
    def query_interface(this : IPortableDeviceDispatchFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPortableDeviceDispatchFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPortableDeviceDispatchFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_device_dispatch(this : IPortableDeviceDispatchFactory*, pszPnPDeviceID : Win32cr::Foundation::PWSTR, ppDeviceDispatch : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_dispatch.call(this, pszPnPDeviceID, ppDeviceDispatch)
    end

  end

  @[Extern]

  record IPortableDeviceWebControlVtable,
    query_interface : Proc(IPortableDeviceWebControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPortableDeviceWebControl*, UInt32),
    release : Proc(IPortableDeviceWebControl*, UInt32),
    get_type_info_count : Proc(IPortableDeviceWebControl*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IPortableDeviceWebControl*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IPortableDeviceWebControl*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke : Proc(IPortableDeviceWebControl*, Int32, LibC::GUID*, UInt32, Win32cr::System::Com::DISPATCH_FLAGS, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Variant::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_device_from_id : Proc(IPortableDeviceWebControl*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_device_from_id_async : Proc(IPortableDeviceWebControl*, Win32cr::Foundation::BSTR, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPortableDeviceWebControl, lpVtbl : IPortableDeviceWebControlVtable* do
    GUID = LibC::GUID.new(0x94fc7953_u32, 0x5ca1_u16, 0x483a_u16, StaticArray[0x8a_u8, 0xee_u8, 0xdf_u8, 0x52_u8, 0xe7_u8, 0x74_u8, 0x7d_u8, 0x0_u8])
    def query_interface(this : IPortableDeviceWebControl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPortableDeviceWebControl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPortableDeviceWebControl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IPortableDeviceWebControl*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IPortableDeviceWebControl*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IPortableDeviceWebControl*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke(this : IPortableDeviceWebControl*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : Win32cr::System::Com::DISPATCH_FLAGS, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Variant::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_device_from_id(this : IPortableDeviceWebControl*, deviceId : Win32cr::Foundation::BSTR, ppDevice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_from_id.call(this, deviceId, ppDevice)
    end
    def get_device_from_id_async(this : IPortableDeviceWebControl*, deviceId : Win32cr::Foundation::BSTR, pCompletionHandler : Void*, pErrorHandler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_from_id_async.call(this, deviceId, pCompletionHandler, pErrorHandler)
    end

  end

  @[Extern]

  record IEnumPortableDeviceConnectorsVtable,
    query_interface : Proc(IEnumPortableDeviceConnectors*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumPortableDeviceConnectors*, UInt32),
    release : Proc(IEnumPortableDeviceConnectors*, UInt32),
    next__ : Proc(IEnumPortableDeviceConnectors*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumPortableDeviceConnectors*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumPortableDeviceConnectors*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumPortableDeviceConnectors*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumPortableDeviceConnectors, lpVtbl : IEnumPortableDeviceConnectorsVtable* do
    GUID = LibC::GUID.new(0xbfdef549_u32, 0x9247_u16, 0x454f_u16, StaticArray[0xbd_u8, 0x82_u8, 0x6_u8, 0xfe_u8, 0x80_u8, 0x85_u8, 0x3f_u8, 0xaa_u8])
    def query_interface(this : IEnumPortableDeviceConnectors*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumPortableDeviceConnectors*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumPortableDeviceConnectors*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumPortableDeviceConnectors*, cRequested : UInt32, pConnectors : Void**, pcFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, cRequested, pConnectors, pcFetched)
    end
    def skip(this : IEnumPortableDeviceConnectors*, cConnectors : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, cConnectors)
    end
    def reset(this : IEnumPortableDeviceConnectors*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumPortableDeviceConnectors*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end

  end

  @[Extern]

  record IPortableDeviceConnectorVtable,
    query_interface : Proc(IPortableDeviceConnector*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPortableDeviceConnector*, UInt32),
    release : Proc(IPortableDeviceConnector*, UInt32),
    connect : Proc(IPortableDeviceConnector*, Void*, Win32cr::Foundation::HRESULT),
    disconnect : Proc(IPortableDeviceConnector*, Void*, Win32cr::Foundation::HRESULT),
    cancel : Proc(IPortableDeviceConnector*, Void*, Win32cr::Foundation::HRESULT),
    get_property : Proc(IPortableDeviceConnector*, Win32cr::Foundation::DEVPROPKEY*, Win32cr::Devices::Properties::DEVPROPTYPE*, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    set_property : Proc(IPortableDeviceConnector*, Win32cr::Foundation::DEVPROPKEY*, Win32cr::Devices::Properties::DEVPROPTYPE, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    get_pn_pid : Proc(IPortableDeviceConnector*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPortableDeviceConnector, lpVtbl : IPortableDeviceConnectorVtable* do
    GUID = LibC::GUID.new(0x625e2df8_u32, 0x6392_u16, 0x4cf0_u16, StaticArray[0x9a_u8, 0xd1_u8, 0x3c_u8, 0xfa_u8, 0x5f_u8, 0x17_u8, 0x77_u8, 0x5c_u8])
    def query_interface(this : IPortableDeviceConnector*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPortableDeviceConnector*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPortableDeviceConnector*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def connect(this : IPortableDeviceConnector*, pCallback : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.connect.call(this, pCallback)
    end
    def disconnect(this : IPortableDeviceConnector*, pCallback : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disconnect.call(this, pCallback)
    end
    def cancel(this : IPortableDeviceConnector*, pCallback : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel.call(this, pCallback)
    end
    def get_property(this : IPortableDeviceConnector*, pPropertyKey : Win32cr::Foundation::DEVPROPKEY*, pPropertyType : Win32cr::Devices::Properties::DEVPROPTYPE*, ppData : UInt8**, pcbData : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, pPropertyKey, pPropertyType, ppData, pcbData)
    end
    def set_property(this : IPortableDeviceConnector*, pPropertyKey : Win32cr::Foundation::DEVPROPKEY*, property_type : Win32cr::Devices::Properties::DEVPROPTYPE, pData : UInt8*, cbData : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, pPropertyKey, property_type, pData, cbData)
    end
    def get_pn_pid(this : IPortableDeviceConnector*, ppwszPnPID : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pn_pid.call(this, ppwszPnPID)
    end

  end

  @[Extern]

  record IConnectionRequestCallbackVtable,
    query_interface : Proc(IConnectionRequestCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IConnectionRequestCallback*, UInt32),
    release : Proc(IConnectionRequestCallback*, UInt32),
    on_complete : Proc(IConnectionRequestCallback*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IConnectionRequestCallback, lpVtbl : IConnectionRequestCallbackVtable* do
    GUID = LibC::GUID.new(0x272c9ae0_u32, 0x7161_u16, 0x4ae0_u16, StaticArray[0x91_u8, 0xbd_u8, 0x9f_u8, 0x44_u8, 0x8e_u8, 0xe9_u8, 0xc4_u8, 0x27_u8])
    def query_interface(this : IConnectionRequestCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IConnectionRequestCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IConnectionRequestCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_complete(this : IConnectionRequestCallback*, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_complete.call(this, hrStatus)
    end

  end

  @[Extern]

  record IMediaRadioManagerVtable,
    query_interface : Proc(IMediaRadioManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMediaRadioManager*, UInt32),
    release : Proc(IMediaRadioManager*, UInt32),
    get_radio_instances : Proc(IMediaRadioManager*, Void**, Win32cr::Foundation::HRESULT),
    on_system_radio_state_change : Proc(IMediaRadioManager*, Win32cr::Devices::PortableDevices::SYSTEM_RADIO_STATE, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMediaRadioManager, lpVtbl : IMediaRadioManagerVtable* do
    GUID = LibC::GUID.new(0x6cfdcab5_u32, 0xfc47_u16, 0x42a5_u16, StaticArray[0x92_u8, 0x41_u8, 0x7_u8, 0x4b_u8, 0x58_u8, 0x83_u8, 0xe_u8, 0x73_u8])
    def query_interface(this : IMediaRadioManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMediaRadioManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMediaRadioManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_radio_instances(this : IMediaRadioManager*, ppCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_radio_instances.call(this, ppCollection)
    end
    def on_system_radio_state_change(this : IMediaRadioManager*, sysRadioState : Win32cr::Devices::PortableDevices::SYSTEM_RADIO_STATE, uTimeoutSec : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_system_radio_state_change.call(this, sysRadioState, uTimeoutSec)
    end

  end

  @[Extern]

  record IRadioInstanceCollectionVtable,
    query_interface : Proc(IRadioInstanceCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRadioInstanceCollection*, UInt32),
    release : Proc(IRadioInstanceCollection*, UInt32),
    get_count : Proc(IRadioInstanceCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_at : Proc(IRadioInstanceCollection*, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRadioInstanceCollection, lpVtbl : IRadioInstanceCollectionVtable* do
    GUID = LibC::GUID.new(0xe5791fae_u32, 0x5665_u16, 0x4e0c_u16, StaticArray[0x95_u8, 0xbe_u8, 0x5f_u8, 0xde_u8, 0x31_u8, 0x64_u8, 0x41_u8, 0x85_u8])
    def query_interface(this : IRadioInstanceCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRadioInstanceCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRadioInstanceCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_count(this : IRadioInstanceCollection*, pcInstance : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, pcInstance)
    end
    def get_at(this : IRadioInstanceCollection*, uIndex : UInt32, ppRadioInstance : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_at.call(this, uIndex, ppRadioInstance)
    end

  end

  @[Extern]

  record IRadioInstanceVtable,
    query_interface : Proc(IRadioInstance*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRadioInstance*, UInt32),
    release : Proc(IRadioInstance*, UInt32),
    get_radio_manager_signature : Proc(IRadioInstance*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_instance_signature : Proc(IRadioInstance*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_friendly_name : Proc(IRadioInstance*, UInt32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_radio_state : Proc(IRadioInstance*, Win32cr::Devices::PortableDevices::DEVICE_RADIO_STATE*, Win32cr::Foundation::HRESULT),
    set_radio_state : Proc(IRadioInstance*, Win32cr::Devices::PortableDevices::DEVICE_RADIO_STATE, UInt32, Win32cr::Foundation::HRESULT),
    is_multi_comm : Proc(IRadioInstance*, Win32cr::Foundation::BOOL),
    is_associating_device : Proc(IRadioInstance*, Win32cr::Foundation::BOOL)


  @[Extern]
  record IRadioInstance, lpVtbl : IRadioInstanceVtable* do
    GUID = LibC::GUID.new(0x70aa1c9e_u32, 0xf2b4_u16, 0x4c61_u16, StaticArray[0x86_u8, 0xd3_u8, 0x6b_u8, 0x9f_u8, 0xb7_u8, 0x5f_u8, 0xd1_u8, 0xa2_u8])
    def query_interface(this : IRadioInstance*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRadioInstance*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRadioInstance*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_radio_manager_signature(this : IRadioInstance*, pguidSignature : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_radio_manager_signature.call(this, pguidSignature)
    end
    def get_instance_signature(this : IRadioInstance*, pbstrId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_instance_signature.call(this, pbstrId)
    end
    def get_friendly_name(this : IRadioInstance*, lcid : UInt32, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_friendly_name.call(this, lcid, pbstrName)
    end
    def get_radio_state(this : IRadioInstance*, pRadioState : Win32cr::Devices::PortableDevices::DEVICE_RADIO_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_radio_state.call(this, pRadioState)
    end
    def set_radio_state(this : IRadioInstance*, radioState : Win32cr::Devices::PortableDevices::DEVICE_RADIO_STATE, uTimeoutSec : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_radio_state.call(this, radioState, uTimeoutSec)
    end
    def is_multi_comm(this : IRadioInstance*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.is_multi_comm.call(this)
    end
    def is_associating_device(this : IRadioInstance*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.is_associating_device.call(this)
    end

  end

  @[Extern]

  record IMediaRadioManagerNotifySinkVtable,
    query_interface : Proc(IMediaRadioManagerNotifySink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMediaRadioManagerNotifySink*, UInt32),
    release : Proc(IMediaRadioManagerNotifySink*, UInt32),
    on_instance_add : Proc(IMediaRadioManagerNotifySink*, Void*, Win32cr::Foundation::HRESULT),
    on_instance_remove : Proc(IMediaRadioManagerNotifySink*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    on_instance_radio_change : Proc(IMediaRadioManagerNotifySink*, Win32cr::Foundation::BSTR, Win32cr::Devices::PortableDevices::DEVICE_RADIO_STATE, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMediaRadioManagerNotifySink, lpVtbl : IMediaRadioManagerNotifySinkVtable* do
    GUID = LibC::GUID.new(0x89d81f5f_u32, 0xc147_u16, 0x49ed_u16, StaticArray[0xa1_u8, 0x1c_u8, 0x77_u8, 0xb2_u8, 0xc_u8, 0x31_u8, 0xe7_u8, 0xc9_u8])
    def query_interface(this : IMediaRadioManagerNotifySink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMediaRadioManagerNotifySink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMediaRadioManagerNotifySink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_instance_add(this : IMediaRadioManagerNotifySink*, pRadioInstance : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_instance_add.call(this, pRadioInstance)
    end
    def on_instance_remove(this : IMediaRadioManagerNotifySink*, bstrRadioInstanceId : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_instance_remove.call(this, bstrRadioInstanceId)
    end
    def on_instance_radio_change(this : IMediaRadioManagerNotifySink*, bstrRadioInstanceId : Win32cr::Foundation::BSTR, radioState : Win32cr::Devices::PortableDevices::DEVICE_RADIO_STATE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_instance_radio_change.call(this, bstrRadioInstanceId, radioState)
    end

  end

  def dMProcessConfigXMLFiltered(pszXmlIn : Win32cr::Foundation::PWSTR, rgszAllowedCspNodes : Win32cr::Foundation::PWSTR*, dwNumAllowedCspNodes : UInt32, pbstrXmlOut : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.DMProcessConfigXMLFiltered(pszXmlIn, rgszAllowedCspNodes, dwNumAllowedCspNodes, pbstrXmlOut)
    {% end %}
  end

  @[Link("dmprocessxmlfiltered")]
  {% if !flag?(:docs) %}
  lib C
    # :nodoc:
    fun DMProcessConfigXMLFiltered(pszXmlIn : Win32cr::Foundation::PWSTR, rgszAllowedCspNodes : Win32cr::Foundation::PWSTR*, dwNumAllowedCspNodes : UInt32, pbstrXmlOut : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT

  end
  {% end %}
end