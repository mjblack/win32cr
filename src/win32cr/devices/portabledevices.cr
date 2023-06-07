require "../ui/shell/propertiessystem.cr"
require "../system/com.cr"
require "../foundation.cr"
require "../system/com/structuredstorage.cr"
require "../devices/properties.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:dmprocessxmlfiltered.dll")]
{% else %}
@[Link("dmprocessxmlfiltered")]
{% end %}
lib LibWin32
  DEVPKEY_MTPBTH_IsConnected = PROPERTYKEY.new(LibC::GUID.new(0xea1237fa_u32, 0x589d_u16, 0x4472_u16, StaticArray[0x84_u8, 0xe4_u8, 0xa_u8, 0xbe_u8, 0x36_u8, 0xfd_u8, 0x62_u8, 0xef_u8]), 2_u32)
  GUID_DEVINTERFACE_WPD = "6ac27878-a6fa-4155-ba85-f98f491d4f33"
  GUID_DEVINTERFACE_WPD_PRIVATE = "ba0c718f-4ded-49b7-bdd3-fabe28661211"
  GUID_DEVINTERFACE_WPD_SERVICE = "9ef44f80-3d64-4246-a6aa-206f328d1edc"
  WPD_CONTROL_FUNCTION_GENERIC_MESSAGE = 66_u32
  IOCTL_WPD_MESSAGE_READWRITE_ACCESS = 4243720_u32
  IOCTL_WPD_MESSAGE_READ_ACCESS = 4210952_u32
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
  WPD_EVENT_NOTIFICATION = "2ba2e40a-6b4c-4295-bb43-26322b99aeb2"
  WPD_EVENT_OBJECT_ADDED = "a726da95-e207-4b02-8d44-bef2e86cbffc"
  WPD_EVENT_OBJECT_REMOVED = "be82ab88-a52c-4823-96e5-d0272671fc38"
  WPD_EVENT_OBJECT_UPDATED = "1445a759-2e01-485d-9f27-ff07dae697ab"
  WPD_EVENT_DEVICE_RESET = "7755cf53-c1ed-44f3-b5a2-451e2c376b27"
  WPD_EVENT_DEVICE_CAPABILITIES_UPDATED = "36885aa1-cd54-4daa-b3d0-afb3e03f5999"
  WPD_EVENT_STORAGE_FORMAT = "3782616b-22bc-4474-a251-3070f8d38857"
  WPD_EVENT_OBJECT_TRANSFER_REQUESTED = "8d16a0a1-f2c6-41da-8f19-5e53721adbf2"
  WPD_EVENT_DEVICE_REMOVED = "e4cbca1b-6918-48b9-85ee-02be7c850af9"
  WPD_EVENT_SERVICE_METHOD_COMPLETE = "8a33f5f8-0acc-4d9b-9cc4-112d353b86ca"
  WPD_CONTENT_TYPE_FUNCTIONAL_OBJECT = "99ed0160-17ff-4c44-9d98-1d7a6f941921"
  WPD_CONTENT_TYPE_FOLDER = "27e2e392-a111-48e0-ab0c-e17705a05f85"
  WPD_CONTENT_TYPE_IMAGE = "ef2107d5-a52a-4243-a26b-62d4176d7603"
  WPD_CONTENT_TYPE_DOCUMENT = "680adf52-950a-4041-9b41-65e393648155"
  WPD_CONTENT_TYPE_CONTACT = "eaba8313-4525-4707-9f0e-87c6808e9435"
  WPD_CONTENT_TYPE_CONTACT_GROUP = "346b8932-4c36-40d8-9415-1828291f9de9"
  WPD_CONTENT_TYPE_AUDIO = "4ad2c85e-5e2d-45e5-8864-4f229e3c6cf0"
  WPD_CONTENT_TYPE_VIDEO = "9261b03c-3d78-4519-85e3-02c5e1f50bb9"
  WPD_CONTENT_TYPE_TELEVISION = "60a169cf-f2ae-4e21-9375-9677f11c1c6e"
  WPD_CONTENT_TYPE_PLAYLIST = "1a33f7e4-af13-48f5-994e-77369dfe04a3"
  WPD_CONTENT_TYPE_MIXED_CONTENT_ALBUM = "00f0c3ac-a593-49ac-9219-24abca5a2563"
  WPD_CONTENT_TYPE_AUDIO_ALBUM = "aa18737e-5009-48fa-ae21-85f24383b4e6"
  WPD_CONTENT_TYPE_IMAGE_ALBUM = "75793148-15f5-4a30-a813-54ed8a37e226"
  WPD_CONTENT_TYPE_VIDEO_ALBUM = "012b0db7-d4c1-45d6-b081-94b87779614f"
  WPD_CONTENT_TYPE_MEMO = "9cd20ecf-3b50-414f-a641-e473ffe45751"
  WPD_CONTENT_TYPE_EMAIL = "8038044a-7e51-4f8f-883d-1d0623d14533"
  WPD_CONTENT_TYPE_APPOINTMENT = "0fed060e-8793-4b1e-90c9-48ac389ac631"
  WPD_CONTENT_TYPE_TASK = "63252f2c-887f-4cb6-b1ac-d29855dcef6c"
  WPD_CONTENT_TYPE_PROGRAM = "d269f96a-247c-4bff-98fb-97f3c49220e6"
  WPD_CONTENT_TYPE_GENERIC_FILE = "0085e0a6-8d34-45d7-bc5c-447e59c73d48"
  WPD_CONTENT_TYPE_CALENDAR = "a1fd5967-6023-49a0-9df1-f8060be751b0"
  WPD_CONTENT_TYPE_GENERIC_MESSAGE = "e80eaaf8-b2db-4133-b67e-1bef4b4a6e5f"
  WPD_CONTENT_TYPE_NETWORK_ASSOCIATION = "031da7ee-18c8-4205-847e-89a11261d0f3"
  WPD_CONTENT_TYPE_CERTIFICATE = "dc3876e8-a948-4060-9050-cbd77e8a3d87"
  WPD_CONTENT_TYPE_WIRELESS_PROFILE = "0bac070a-9f5f-4da4-a8f6-3de44d68fd6c"
  WPD_CONTENT_TYPE_MEDIA_CAST = "5e88b3cc-3e65-4e62-bfff-229495253ab0"
  WPD_CONTENT_TYPE_SECTION = "821089f5-1d91-4dc9-be3c-bbb1b35b18ce"
  WPD_CONTENT_TYPE_UNSPECIFIED = "28d8d31e-249c-454e-aabc-34883168e634"
  WPD_CONTENT_TYPE_ALL = "80e170d2-1055-4a3e-b952-82cc4f8a8689"
  WPD_FUNCTIONAL_CATEGORY_DEVICE = "08ea466b-e3a4-4336-a1f3-a44d2b5c438c"
  WPD_FUNCTIONAL_CATEGORY_STORAGE = "23f05bbc-15de-4c2a-a55b-a9af5ce412ef"
  WPD_FUNCTIONAL_CATEGORY_STILL_IMAGE_CAPTURE = "613ca327-ab93-4900-b4fa-895bb5874b79"
  WPD_FUNCTIONAL_CATEGORY_AUDIO_CAPTURE = "3f2a1919-c7c2-4a00-855d-f57cf06debbb"
  WPD_FUNCTIONAL_CATEGORY_VIDEO_CAPTURE = "e23e5f6b-7243-43aa-8df1-0eb3d968a918"
  WPD_FUNCTIONAL_CATEGORY_SMS = "0044a0b1-c1e9-4afd-b358-a62c6117c9cf"
  WPD_FUNCTIONAL_CATEGORY_RENDERING_INFORMATION = "08600ba4-a7ba-4a01-ab0e-0065d0a356d3"
  WPD_FUNCTIONAL_CATEGORY_NETWORK_CONFIGURATION = "48f4db72-7c6a-4ab0-9e1a-470e3cdbf26a"
  WPD_FUNCTIONAL_CATEGORY_ALL = "2d8a6512-a74c-448e-ba8a-f4ac07c49399"
  WPD_OBJECT_FORMAT_ICON = "077232ed-102c-4638-9c22-83f142bfc822"
  WPD_OBJECT_FORMAT_M4A = "30aba7ac-6ffd-4c23-a359-3e9b52f3f1c8"
  WPD_OBJECT_FORMAT_NETWORK_ASSOCIATION = "b1020000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_X509V3CERTIFICATE = "b1030000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_MICROSOFT_WFC = "b1040000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_3GPA = "e5172730-f971-41ef-a10b-2271a0019d7a"
  WPD_OBJECT_FORMAT_3G2A = "1a11202d-8759-4e34-ba5e-b1211087eee4"
  WPD_OBJECT_FORMAT_ALL = "c1f62eb2-4bb3-479c-9cfa-05b5f3a57b22"
  WPD_CATEGORY_NULL = "00000000-0000-0000-0000-000000000000"
  WPD_PROPERTY_NULL = PROPERTYKEY.new(LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8]), 0_u32)
  WPD_OBJECT_PROPERTIES_V1 = "ef6b490d-5cd8-437a-affc-da8b60ee4a3c"
  WPD_OBJECT_CONTENT_TYPE = PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 7_u32)
  WPD_OBJECT_REFERENCES = PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 14_u32)
  WPD_OBJECT_CONTAINER_FUNCTIONAL_OBJECT_ID = PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 23_u32)
  WPD_OBJECT_GENERATE_THUMBNAIL_FROM_RESOURCE = PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 24_u32)
  WPD_OBJECT_HINT_LOCATION_DISPLAY_NAME = PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 25_u32)
  WPD_OBJECT_PROPERTIES_V2 = "0373cd3d-4a46-40d7-b4d8-73e8da74e775"
  WPD_OBJECT_SUPPORTED_UNITS = PROPERTYKEY.new(LibC::GUID.new(0x373cd3d_u32, 0x4a46_u16, 0x40d7_u16, StaticArray[0xb4_u8, 0xd8_u8, 0x73_u8, 0xe8_u8, 0xda_u8, 0x74_u8, 0xe7_u8, 0x75_u8]), 2_u32)
  WPD_FUNCTIONAL_OBJECT_PROPERTIES_V1 = "8f052d93-abca-4fc5-a5ac-b01df4dbe598"
  WPD_FUNCTIONAL_OBJECT_CATEGORY = PROPERTYKEY.new(LibC::GUID.new(0x8f052d93_u32, 0xabca_u16, 0x4fc5_u16, StaticArray[0xa5_u8, 0xac_u8, 0xb0_u8, 0x1d_u8, 0xf4_u8, 0xdb_u8, 0xe5_u8, 0x98_u8]), 2_u32)
  WPD_STORAGE_OBJECT_PROPERTIES_V1 = "01a3057a-74d6-4e80-bea7-dc4c212ce50a"
  WPD_STORAGE_TYPE = PROPERTYKEY.new(LibC::GUID.new(0x1a3057a_u32, 0x74d6_u16, 0x4e80_u16, StaticArray[0xbe_u8, 0xa7_u8, 0xdc_u8, 0x4c_u8, 0x21_u8, 0x2c_u8, 0xe5_u8, 0xa_u8]), 2_u32)
  WPD_STORAGE_FILE_SYSTEM_TYPE = PROPERTYKEY.new(LibC::GUID.new(0x1a3057a_u32, 0x74d6_u16, 0x4e80_u16, StaticArray[0xbe_u8, 0xa7_u8, 0xdc_u8, 0x4c_u8, 0x21_u8, 0x2c_u8, 0xe5_u8, 0xa_u8]), 3_u32)
  WPD_STORAGE_CAPACITY = PROPERTYKEY.new(LibC::GUID.new(0x1a3057a_u32, 0x74d6_u16, 0x4e80_u16, StaticArray[0xbe_u8, 0xa7_u8, 0xdc_u8, 0x4c_u8, 0x21_u8, 0x2c_u8, 0xe5_u8, 0xa_u8]), 4_u32)
  WPD_STORAGE_FREE_SPACE_IN_BYTES = PROPERTYKEY.new(LibC::GUID.new(0x1a3057a_u32, 0x74d6_u16, 0x4e80_u16, StaticArray[0xbe_u8, 0xa7_u8, 0xdc_u8, 0x4c_u8, 0x21_u8, 0x2c_u8, 0xe5_u8, 0xa_u8]), 5_u32)
  WPD_STORAGE_FREE_SPACE_IN_OBJECTS = PROPERTYKEY.new(LibC::GUID.new(0x1a3057a_u32, 0x74d6_u16, 0x4e80_u16, StaticArray[0xbe_u8, 0xa7_u8, 0xdc_u8, 0x4c_u8, 0x21_u8, 0x2c_u8, 0xe5_u8, 0xa_u8]), 6_u32)
  WPD_STORAGE_DESCRIPTION = PROPERTYKEY.new(LibC::GUID.new(0x1a3057a_u32, 0x74d6_u16, 0x4e80_u16, StaticArray[0xbe_u8, 0xa7_u8, 0xdc_u8, 0x4c_u8, 0x21_u8, 0x2c_u8, 0xe5_u8, 0xa_u8]), 7_u32)
  WPD_STORAGE_SERIAL_NUMBER = PROPERTYKEY.new(LibC::GUID.new(0x1a3057a_u32, 0x74d6_u16, 0x4e80_u16, StaticArray[0xbe_u8, 0xa7_u8, 0xdc_u8, 0x4c_u8, 0x21_u8, 0x2c_u8, 0xe5_u8, 0xa_u8]), 8_u32)
  WPD_STORAGE_MAX_OBJECT_SIZE = PROPERTYKEY.new(LibC::GUID.new(0x1a3057a_u32, 0x74d6_u16, 0x4e80_u16, StaticArray[0xbe_u8, 0xa7_u8, 0xdc_u8, 0x4c_u8, 0x21_u8, 0x2c_u8, 0xe5_u8, 0xa_u8]), 9_u32)
  WPD_STORAGE_CAPACITY_IN_OBJECTS = PROPERTYKEY.new(LibC::GUID.new(0x1a3057a_u32, 0x74d6_u16, 0x4e80_u16, StaticArray[0xbe_u8, 0xa7_u8, 0xdc_u8, 0x4c_u8, 0x21_u8, 0x2c_u8, 0xe5_u8, 0xa_u8]), 10_u32)
  WPD_STORAGE_ACCESS_CAPABILITY = PROPERTYKEY.new(LibC::GUID.new(0x1a3057a_u32, 0x74d6_u16, 0x4e80_u16, StaticArray[0xbe_u8, 0xa7_u8, 0xdc_u8, 0x4c_u8, 0x21_u8, 0x2c_u8, 0xe5_u8, 0xa_u8]), 11_u32)
  WPD_NETWORK_ASSOCIATION_PROPERTIES_V1 = "e4c93c1f-b203-43f1-a100-5a07d11b0274"
  WPD_NETWORK_ASSOCIATION_HOST_NETWORK_IDENTIFIERS = PROPERTYKEY.new(LibC::GUID.new(0xe4c93c1f_u32, 0xb203_u16, 0x43f1_u16, StaticArray[0xa1_u8, 0x0_u8, 0x5a_u8, 0x7_u8, 0xd1_u8, 0x1b_u8, 0x2_u8, 0x74_u8]), 2_u32)
  WPD_NETWORK_ASSOCIATION_X509V3SEQUENCE = PROPERTYKEY.new(LibC::GUID.new(0xe4c93c1f_u32, 0xb203_u16, 0x43f1_u16, StaticArray[0xa1_u8, 0x0_u8, 0x5a_u8, 0x7_u8, 0xd1_u8, 0x1b_u8, 0x2_u8, 0x74_u8]), 3_u32)
  WPD_STILL_IMAGE_CAPTURE_OBJECT_PROPERTIES_V1 = "58c571ec-1bcb-42a7-8ac5-bb291573a260"
  WPD_STILL_IMAGE_CAPTURE_RESOLUTION = PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 2_u32)
  WPD_STILL_IMAGE_CAPTURE_FORMAT = PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 3_u32)
  WPD_STILL_IMAGE_COMPRESSION_SETTING = PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 4_u32)
  WPD_STILL_IMAGE_WHITE_BALANCE = PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 5_u32)
  WPD_STILL_IMAGE_RGB_GAIN = PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 6_u32)
  WPD_STILL_IMAGE_FNUMBER = PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 7_u32)
  WPD_STILL_IMAGE_FOCAL_LENGTH = PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 8_u32)
  WPD_STILL_IMAGE_FOCUS_DISTANCE = PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 9_u32)
  WPD_STILL_IMAGE_FOCUS_MODE = PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 10_u32)
  WPD_STILL_IMAGE_EXPOSURE_METERING_MODE = PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 11_u32)
  WPD_STILL_IMAGE_FLASH_MODE = PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 12_u32)
  WPD_STILL_IMAGE_EXPOSURE_TIME = PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 13_u32)
  WPD_STILL_IMAGE_EXPOSURE_PROGRAM_MODE = PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 14_u32)
  WPD_STILL_IMAGE_EXPOSURE_INDEX = PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 15_u32)
  WPD_STILL_IMAGE_EXPOSURE_BIAS_COMPENSATION = PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 16_u32)
  WPD_STILL_IMAGE_CAPTURE_DELAY = PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 17_u32)
  WPD_STILL_IMAGE_CAPTURE_MODE = PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 18_u32)
  WPD_STILL_IMAGE_CONTRAST = PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 19_u32)
  WPD_STILL_IMAGE_SHARPNESS = PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 20_u32)
  WPD_STILL_IMAGE_DIGITAL_ZOOM = PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 21_u32)
  WPD_STILL_IMAGE_EFFECT_MODE = PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 22_u32)
  WPD_STILL_IMAGE_BURST_NUMBER = PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 23_u32)
  WPD_STILL_IMAGE_BURST_INTERVAL = PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 24_u32)
  WPD_STILL_IMAGE_TIMELAPSE_NUMBER = PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 25_u32)
  WPD_STILL_IMAGE_TIMELAPSE_INTERVAL = PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 26_u32)
  WPD_STILL_IMAGE_FOCUS_METERING_MODE = PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 27_u32)
  WPD_STILL_IMAGE_UPLOAD_URL = PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 28_u32)
  WPD_STILL_IMAGE_ARTIST = PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 29_u32)
  WPD_STILL_IMAGE_CAMERA_MODEL = PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 30_u32)
  WPD_STILL_IMAGE_CAMERA_MANUFACTURER = PROPERTYKEY.new(LibC::GUID.new(0x58c571ec_u32, 0x1bcb_u16, 0x42a7_u16, StaticArray[0x8a_u8, 0xc5_u8, 0xbb_u8, 0x29_u8, 0x15_u8, 0x73_u8, 0xa2_u8, 0x60_u8]), 31_u32)
  WPD_RENDERING_INFORMATION_OBJECT_PROPERTIES_V1 = "c53d039f-ee23-4a31-8590-7639879870b4"
  WPD_RENDERING_INFORMATION_PROFILES = PROPERTYKEY.new(LibC::GUID.new(0xc53d039f_u32, 0xee23_u16, 0x4a31_u16, StaticArray[0x85_u8, 0x90_u8, 0x76_u8, 0x39_u8, 0x87_u8, 0x98_u8, 0x70_u8, 0xb4_u8]), 2_u32)
  WPD_RENDERING_INFORMATION_PROFILE_ENTRY_TYPE = PROPERTYKEY.new(LibC::GUID.new(0xc53d039f_u32, 0xee23_u16, 0x4a31_u16, StaticArray[0x85_u8, 0x90_u8, 0x76_u8, 0x39_u8, 0x87_u8, 0x98_u8, 0x70_u8, 0xb4_u8]), 3_u32)
  WPD_RENDERING_INFORMATION_PROFILE_ENTRY_CREATABLE_RESOURCES = PROPERTYKEY.new(LibC::GUID.new(0xc53d039f_u32, 0xee23_u16, 0x4a31_u16, StaticArray[0x85_u8, 0x90_u8, 0x76_u8, 0x39_u8, 0x87_u8, 0x98_u8, 0x70_u8, 0xb4_u8]), 4_u32)
  WPD_CLIENT_INFORMATION_PROPERTIES_V1 = "204d9f0c-2292-4080-9f42-40664e70f859"
  WPD_CLIENT_NAME = PROPERTYKEY.new(LibC::GUID.new(0x204d9f0c_u32, 0x2292_u16, 0x4080_u16, StaticArray[0x9f_u8, 0x42_u8, 0x40_u8, 0x66_u8, 0x4e_u8, 0x70_u8, 0xf8_u8, 0x59_u8]), 2_u32)
  WPD_CLIENT_MAJOR_VERSION = PROPERTYKEY.new(LibC::GUID.new(0x204d9f0c_u32, 0x2292_u16, 0x4080_u16, StaticArray[0x9f_u8, 0x42_u8, 0x40_u8, 0x66_u8, 0x4e_u8, 0x70_u8, 0xf8_u8, 0x59_u8]), 3_u32)
  WPD_CLIENT_MINOR_VERSION = PROPERTYKEY.new(LibC::GUID.new(0x204d9f0c_u32, 0x2292_u16, 0x4080_u16, StaticArray[0x9f_u8, 0x42_u8, 0x40_u8, 0x66_u8, 0x4e_u8, 0x70_u8, 0xf8_u8, 0x59_u8]), 4_u32)
  WPD_CLIENT_REVISION = PROPERTYKEY.new(LibC::GUID.new(0x204d9f0c_u32, 0x2292_u16, 0x4080_u16, StaticArray[0x9f_u8, 0x42_u8, 0x40_u8, 0x66_u8, 0x4e_u8, 0x70_u8, 0xf8_u8, 0x59_u8]), 5_u32)
  WPD_CLIENT_WMDRM_APPLICATION_PRIVATE_KEY = PROPERTYKEY.new(LibC::GUID.new(0x204d9f0c_u32, 0x2292_u16, 0x4080_u16, StaticArray[0x9f_u8, 0x42_u8, 0x40_u8, 0x66_u8, 0x4e_u8, 0x70_u8, 0xf8_u8, 0x59_u8]), 6_u32)
  WPD_CLIENT_WMDRM_APPLICATION_CERTIFICATE = PROPERTYKEY.new(LibC::GUID.new(0x204d9f0c_u32, 0x2292_u16, 0x4080_u16, StaticArray[0x9f_u8, 0x42_u8, 0x40_u8, 0x66_u8, 0x4e_u8, 0x70_u8, 0xf8_u8, 0x59_u8]), 7_u32)
  WPD_CLIENT_SECURITY_QUALITY_OF_SERVICE = PROPERTYKEY.new(LibC::GUID.new(0x204d9f0c_u32, 0x2292_u16, 0x4080_u16, StaticArray[0x9f_u8, 0x42_u8, 0x40_u8, 0x66_u8, 0x4e_u8, 0x70_u8, 0xf8_u8, 0x59_u8]), 8_u32)
  WPD_CLIENT_DESIRED_ACCESS = PROPERTYKEY.new(LibC::GUID.new(0x204d9f0c_u32, 0x2292_u16, 0x4080_u16, StaticArray[0x9f_u8, 0x42_u8, 0x40_u8, 0x66_u8, 0x4e_u8, 0x70_u8, 0xf8_u8, 0x59_u8]), 9_u32)
  WPD_CLIENT_SHARE_MODE = PROPERTYKEY.new(LibC::GUID.new(0x204d9f0c_u32, 0x2292_u16, 0x4080_u16, StaticArray[0x9f_u8, 0x42_u8, 0x40_u8, 0x66_u8, 0x4e_u8, 0x70_u8, 0xf8_u8, 0x59_u8]), 10_u32)
  WPD_CLIENT_EVENT_COOKIE = PROPERTYKEY.new(LibC::GUID.new(0x204d9f0c_u32, 0x2292_u16, 0x4080_u16, StaticArray[0x9f_u8, 0x42_u8, 0x40_u8, 0x66_u8, 0x4e_u8, 0x70_u8, 0xf8_u8, 0x59_u8]), 11_u32)
  WPD_CLIENT_MINIMUM_RESULTS_BUFFER_SIZE = PROPERTYKEY.new(LibC::GUID.new(0x204d9f0c_u32, 0x2292_u16, 0x4080_u16, StaticArray[0x9f_u8, 0x42_u8, 0x40_u8, 0x66_u8, 0x4e_u8, 0x70_u8, 0xf8_u8, 0x59_u8]), 12_u32)
  WPD_CLIENT_MANUAL_CLOSE_ON_DISCONNECT = PROPERTYKEY.new(LibC::GUID.new(0x204d9f0c_u32, 0x2292_u16, 0x4080_u16, StaticArray[0x9f_u8, 0x42_u8, 0x40_u8, 0x66_u8, 0x4e_u8, 0x70_u8, 0xf8_u8, 0x59_u8]), 13_u32)
  WPD_PROPERTY_ATTRIBUTES_V1 = "ab7943d8-6332-445f-a00d-8d5ef1e96f37"
  WPD_PROPERTY_ATTRIBUTE_FORM = PROPERTYKEY.new(LibC::GUID.new(0xab7943d8_u32, 0x6332_u16, 0x445f_u16, StaticArray[0xa0_u8, 0xd_u8, 0x8d_u8, 0x5e_u8, 0xf1_u8, 0xe9_u8, 0x6f_u8, 0x37_u8]), 2_u32)
  WPD_PROPERTY_ATTRIBUTE_CAN_READ = PROPERTYKEY.new(LibC::GUID.new(0xab7943d8_u32, 0x6332_u16, 0x445f_u16, StaticArray[0xa0_u8, 0xd_u8, 0x8d_u8, 0x5e_u8, 0xf1_u8, 0xe9_u8, 0x6f_u8, 0x37_u8]), 3_u32)
  WPD_PROPERTY_ATTRIBUTE_CAN_WRITE = PROPERTYKEY.new(LibC::GUID.new(0xab7943d8_u32, 0x6332_u16, 0x445f_u16, StaticArray[0xa0_u8, 0xd_u8, 0x8d_u8, 0x5e_u8, 0xf1_u8, 0xe9_u8, 0x6f_u8, 0x37_u8]), 4_u32)
  WPD_PROPERTY_ATTRIBUTE_CAN_DELETE = PROPERTYKEY.new(LibC::GUID.new(0xab7943d8_u32, 0x6332_u16, 0x445f_u16, StaticArray[0xa0_u8, 0xd_u8, 0x8d_u8, 0x5e_u8, 0xf1_u8, 0xe9_u8, 0x6f_u8, 0x37_u8]), 5_u32)
  WPD_PROPERTY_ATTRIBUTE_DEFAULT_VALUE = PROPERTYKEY.new(LibC::GUID.new(0xab7943d8_u32, 0x6332_u16, 0x445f_u16, StaticArray[0xa0_u8, 0xd_u8, 0x8d_u8, 0x5e_u8, 0xf1_u8, 0xe9_u8, 0x6f_u8, 0x37_u8]), 6_u32)
  WPD_PROPERTY_ATTRIBUTE_FAST_PROPERTY = PROPERTYKEY.new(LibC::GUID.new(0xab7943d8_u32, 0x6332_u16, 0x445f_u16, StaticArray[0xa0_u8, 0xd_u8, 0x8d_u8, 0x5e_u8, 0xf1_u8, 0xe9_u8, 0x6f_u8, 0x37_u8]), 7_u32)
  WPD_PROPERTY_ATTRIBUTE_RANGE_MIN = PROPERTYKEY.new(LibC::GUID.new(0xab7943d8_u32, 0x6332_u16, 0x445f_u16, StaticArray[0xa0_u8, 0xd_u8, 0x8d_u8, 0x5e_u8, 0xf1_u8, 0xe9_u8, 0x6f_u8, 0x37_u8]), 8_u32)
  WPD_PROPERTY_ATTRIBUTE_RANGE_MAX = PROPERTYKEY.new(LibC::GUID.new(0xab7943d8_u32, 0x6332_u16, 0x445f_u16, StaticArray[0xa0_u8, 0xd_u8, 0x8d_u8, 0x5e_u8, 0xf1_u8, 0xe9_u8, 0x6f_u8, 0x37_u8]), 9_u32)
  WPD_PROPERTY_ATTRIBUTE_RANGE_STEP = PROPERTYKEY.new(LibC::GUID.new(0xab7943d8_u32, 0x6332_u16, 0x445f_u16, StaticArray[0xa0_u8, 0xd_u8, 0x8d_u8, 0x5e_u8, 0xf1_u8, 0xe9_u8, 0x6f_u8, 0x37_u8]), 10_u32)
  WPD_PROPERTY_ATTRIBUTE_ENUMERATION_ELEMENTS = PROPERTYKEY.new(LibC::GUID.new(0xab7943d8_u32, 0x6332_u16, 0x445f_u16, StaticArray[0xa0_u8, 0xd_u8, 0x8d_u8, 0x5e_u8, 0xf1_u8, 0xe9_u8, 0x6f_u8, 0x37_u8]), 11_u32)
  WPD_PROPERTY_ATTRIBUTE_REGULAR_EXPRESSION = PROPERTYKEY.new(LibC::GUID.new(0xab7943d8_u32, 0x6332_u16, 0x445f_u16, StaticArray[0xa0_u8, 0xd_u8, 0x8d_u8, 0x5e_u8, 0xf1_u8, 0xe9_u8, 0x6f_u8, 0x37_u8]), 12_u32)
  WPD_PROPERTY_ATTRIBUTE_MAX_SIZE = PROPERTYKEY.new(LibC::GUID.new(0xab7943d8_u32, 0x6332_u16, 0x445f_u16, StaticArray[0xa0_u8, 0xd_u8, 0x8d_u8, 0x5e_u8, 0xf1_u8, 0xe9_u8, 0x6f_u8, 0x37_u8]), 13_u32)
  WPD_PROPERTY_ATTRIBUTES_V2 = "5d9da160-74ae-43cc-85a9-fe555a80798e"
  WPD_PROPERTY_ATTRIBUTE_NAME = PROPERTYKEY.new(LibC::GUID.new(0x5d9da160_u32, 0x74ae_u16, 0x43cc_u16, StaticArray[0x85_u8, 0xa9_u8, 0xfe_u8, 0x55_u8, 0x5a_u8, 0x80_u8, 0x79_u8, 0x8e_u8]), 2_u32)
  WPD_PROPERTY_ATTRIBUTE_VARTYPE = PROPERTYKEY.new(LibC::GUID.new(0x5d9da160_u32, 0x74ae_u16, 0x43cc_u16, StaticArray[0x85_u8, 0xa9_u8, 0xfe_u8, 0x55_u8, 0x5a_u8, 0x80_u8, 0x79_u8, 0x8e_u8]), 3_u32)
  WPD_CLASS_EXTENSION_OPTIONS_V1 = "6309ffef-a87c-4ca7-8434-797576e40a96"
  WPD_CLASS_EXTENSION_OPTIONS_SUPPORTED_CONTENT_TYPES = PROPERTYKEY.new(LibC::GUID.new(0x6309ffef_u32, 0xa87c_u16, 0x4ca7_u16, StaticArray[0x84_u8, 0x34_u8, 0x79_u8, 0x75_u8, 0x76_u8, 0xe4_u8, 0xa_u8, 0x96_u8]), 2_u32)
  WPD_CLASS_EXTENSION_OPTIONS_DONT_REGISTER_WPD_DEVICE_INTERFACE = PROPERTYKEY.new(LibC::GUID.new(0x6309ffef_u32, 0xa87c_u16, 0x4ca7_u16, StaticArray[0x84_u8, 0x34_u8, 0x79_u8, 0x75_u8, 0x76_u8, 0xe4_u8, 0xa_u8, 0x96_u8]), 3_u32)
  WPD_CLASS_EXTENSION_OPTIONS_REGISTER_WPD_PRIVATE_DEVICE_INTERFACE = PROPERTYKEY.new(LibC::GUID.new(0x6309ffef_u32, 0xa87c_u16, 0x4ca7_u16, StaticArray[0x84_u8, 0x34_u8, 0x79_u8, 0x75_u8, 0x76_u8, 0xe4_u8, 0xa_u8, 0x96_u8]), 4_u32)
  WPD_CLASS_EXTENSION_OPTIONS_V2 = "3e3595da-4d71-49fe-a0b4-d4406c3ae93f"
  WPD_CLASS_EXTENSION_OPTIONS_MULTITRANSPORT_MODE = PROPERTYKEY.new(LibC::GUID.new(0x3e3595da_u32, 0x4d71_u16, 0x49fe_u16, StaticArray[0xa0_u8, 0xb4_u8, 0xd4_u8, 0x40_u8, 0x6c_u8, 0x3a_u8, 0xe9_u8, 0x3f_u8]), 2_u32)
  WPD_CLASS_EXTENSION_OPTIONS_DEVICE_IDENTIFICATION_VALUES = PROPERTYKEY.new(LibC::GUID.new(0x3e3595da_u32, 0x4d71_u16, 0x49fe_u16, StaticArray[0xa0_u8, 0xb4_u8, 0xd4_u8, 0x40_u8, 0x6c_u8, 0x3a_u8, 0xe9_u8, 0x3f_u8]), 3_u32)
  WPD_CLASS_EXTENSION_OPTIONS_TRANSPORT_BANDWIDTH = PROPERTYKEY.new(LibC::GUID.new(0x3e3595da_u32, 0x4d71_u16, 0x49fe_u16, StaticArray[0xa0_u8, 0xb4_u8, 0xd4_u8, 0x40_u8, 0x6c_u8, 0x3a_u8, 0xe9_u8, 0x3f_u8]), 4_u32)
  WPD_CLASS_EXTENSION_OPTIONS_V3 = "65c160f8-1367-4ce2-939d-8310839f0d30"
  WPD_CLASS_EXTENSION_OPTIONS_SILENCE_AUTOPLAY = PROPERTYKEY.new(LibC::GUID.new(0x65c160f8_u32, 0x1367_u16, 0x4ce2_u16, StaticArray[0x93_u8, 0x9d_u8, 0x83_u8, 0x10_u8, 0x83_u8, 0x9f_u8, 0xd_u8, 0x30_u8]), 2_u32)
  WPD_RESOURCE_ATTRIBUTES_V1 = "1eb6f604-9278-429f-93cc-5bb8c06656b6"
  WPD_RESOURCE_ATTRIBUTE_TOTAL_SIZE = PROPERTYKEY.new(LibC::GUID.new(0x1eb6f604_u32, 0x9278_u16, 0x429f_u16, StaticArray[0x93_u8, 0xcc_u8, 0x5b_u8, 0xb8_u8, 0xc0_u8, 0x66_u8, 0x56_u8, 0xb6_u8]), 2_u32)
  WPD_RESOURCE_ATTRIBUTE_CAN_READ = PROPERTYKEY.new(LibC::GUID.new(0x1eb6f604_u32, 0x9278_u16, 0x429f_u16, StaticArray[0x93_u8, 0xcc_u8, 0x5b_u8, 0xb8_u8, 0xc0_u8, 0x66_u8, 0x56_u8, 0xb6_u8]), 3_u32)
  WPD_RESOURCE_ATTRIBUTE_CAN_WRITE = PROPERTYKEY.new(LibC::GUID.new(0x1eb6f604_u32, 0x9278_u16, 0x429f_u16, StaticArray[0x93_u8, 0xcc_u8, 0x5b_u8, 0xb8_u8, 0xc0_u8, 0x66_u8, 0x56_u8, 0xb6_u8]), 4_u32)
  WPD_RESOURCE_ATTRIBUTE_CAN_DELETE = PROPERTYKEY.new(LibC::GUID.new(0x1eb6f604_u32, 0x9278_u16, 0x429f_u16, StaticArray[0x93_u8, 0xcc_u8, 0x5b_u8, 0xb8_u8, 0xc0_u8, 0x66_u8, 0x56_u8, 0xb6_u8]), 5_u32)
  WPD_RESOURCE_ATTRIBUTE_OPTIMAL_READ_BUFFER_SIZE = PROPERTYKEY.new(LibC::GUID.new(0x1eb6f604_u32, 0x9278_u16, 0x429f_u16, StaticArray[0x93_u8, 0xcc_u8, 0x5b_u8, 0xb8_u8, 0xc0_u8, 0x66_u8, 0x56_u8, 0xb6_u8]), 6_u32)
  WPD_RESOURCE_ATTRIBUTE_OPTIMAL_WRITE_BUFFER_SIZE = PROPERTYKEY.new(LibC::GUID.new(0x1eb6f604_u32, 0x9278_u16, 0x429f_u16, StaticArray[0x93_u8, 0xcc_u8, 0x5b_u8, 0xb8_u8, 0xc0_u8, 0x66_u8, 0x56_u8, 0xb6_u8]), 7_u32)
  WPD_RESOURCE_ATTRIBUTE_FORMAT = PROPERTYKEY.new(LibC::GUID.new(0x1eb6f604_u32, 0x9278_u16, 0x429f_u16, StaticArray[0x93_u8, 0xcc_u8, 0x5b_u8, 0xb8_u8, 0xc0_u8, 0x66_u8, 0x56_u8, 0xb6_u8]), 8_u32)
  WPD_RESOURCE_ATTRIBUTE_RESOURCE_KEY = PROPERTYKEY.new(LibC::GUID.new(0x1eb6f604_u32, 0x9278_u16, 0x429f_u16, StaticArray[0x93_u8, 0xcc_u8, 0x5b_u8, 0xb8_u8, 0xc0_u8, 0x66_u8, 0x56_u8, 0xb6_u8]), 9_u32)
  WPD_DEVICE_PROPERTIES_V1 = "26d4979a-e643-4626-9e2b-736dc0c92fdc"
  WPD_DEVICE_SYNC_PARTNER = PROPERTYKEY.new(LibC::GUID.new(0x26d4979a_u32, 0xe643_u16, 0x4626_u16, StaticArray[0x9e_u8, 0x2b_u8, 0x73_u8, 0x6d_u8, 0xc0_u8, 0xc9_u8, 0x2f_u8, 0xdc_u8]), 2_u32)
  WPD_DEVICE_FIRMWARE_VERSION = PROPERTYKEY.new(LibC::GUID.new(0x26d4979a_u32, 0xe643_u16, 0x4626_u16, StaticArray[0x9e_u8, 0x2b_u8, 0x73_u8, 0x6d_u8, 0xc0_u8, 0xc9_u8, 0x2f_u8, 0xdc_u8]), 3_u32)
  WPD_DEVICE_POWER_LEVEL = PROPERTYKEY.new(LibC::GUID.new(0x26d4979a_u32, 0xe643_u16, 0x4626_u16, StaticArray[0x9e_u8, 0x2b_u8, 0x73_u8, 0x6d_u8, 0xc0_u8, 0xc9_u8, 0x2f_u8, 0xdc_u8]), 4_u32)
  WPD_DEVICE_POWER_SOURCE = PROPERTYKEY.new(LibC::GUID.new(0x26d4979a_u32, 0xe643_u16, 0x4626_u16, StaticArray[0x9e_u8, 0x2b_u8, 0x73_u8, 0x6d_u8, 0xc0_u8, 0xc9_u8, 0x2f_u8, 0xdc_u8]), 5_u32)
  WPD_DEVICE_PROTOCOL = PROPERTYKEY.new(LibC::GUID.new(0x26d4979a_u32, 0xe643_u16, 0x4626_u16, StaticArray[0x9e_u8, 0x2b_u8, 0x73_u8, 0x6d_u8, 0xc0_u8, 0xc9_u8, 0x2f_u8, 0xdc_u8]), 6_u32)
  WPD_DEVICE_MANUFACTURER = PROPERTYKEY.new(LibC::GUID.new(0x26d4979a_u32, 0xe643_u16, 0x4626_u16, StaticArray[0x9e_u8, 0x2b_u8, 0x73_u8, 0x6d_u8, 0xc0_u8, 0xc9_u8, 0x2f_u8, 0xdc_u8]), 7_u32)
  WPD_DEVICE_MODEL = PROPERTYKEY.new(LibC::GUID.new(0x26d4979a_u32, 0xe643_u16, 0x4626_u16, StaticArray[0x9e_u8, 0x2b_u8, 0x73_u8, 0x6d_u8, 0xc0_u8, 0xc9_u8, 0x2f_u8, 0xdc_u8]), 8_u32)
  WPD_DEVICE_SERIAL_NUMBER = PROPERTYKEY.new(LibC::GUID.new(0x26d4979a_u32, 0xe643_u16, 0x4626_u16, StaticArray[0x9e_u8, 0x2b_u8, 0x73_u8, 0x6d_u8, 0xc0_u8, 0xc9_u8, 0x2f_u8, 0xdc_u8]), 9_u32)
  WPD_DEVICE_SUPPORTS_NON_CONSUMABLE = PROPERTYKEY.new(LibC::GUID.new(0x26d4979a_u32, 0xe643_u16, 0x4626_u16, StaticArray[0x9e_u8, 0x2b_u8, 0x73_u8, 0x6d_u8, 0xc0_u8, 0xc9_u8, 0x2f_u8, 0xdc_u8]), 10_u32)
  WPD_DEVICE_DATETIME = PROPERTYKEY.new(LibC::GUID.new(0x26d4979a_u32, 0xe643_u16, 0x4626_u16, StaticArray[0x9e_u8, 0x2b_u8, 0x73_u8, 0x6d_u8, 0xc0_u8, 0xc9_u8, 0x2f_u8, 0xdc_u8]), 11_u32)
  WPD_DEVICE_FRIENDLY_NAME = PROPERTYKEY.new(LibC::GUID.new(0x26d4979a_u32, 0xe643_u16, 0x4626_u16, StaticArray[0x9e_u8, 0x2b_u8, 0x73_u8, 0x6d_u8, 0xc0_u8, 0xc9_u8, 0x2f_u8, 0xdc_u8]), 12_u32)
  WPD_DEVICE_SUPPORTED_DRM_SCHEMES = PROPERTYKEY.new(LibC::GUID.new(0x26d4979a_u32, 0xe643_u16, 0x4626_u16, StaticArray[0x9e_u8, 0x2b_u8, 0x73_u8, 0x6d_u8, 0xc0_u8, 0xc9_u8, 0x2f_u8, 0xdc_u8]), 13_u32)
  WPD_DEVICE_SUPPORTED_FORMATS_ARE_ORDERED = PROPERTYKEY.new(LibC::GUID.new(0x26d4979a_u32, 0xe643_u16, 0x4626_u16, StaticArray[0x9e_u8, 0x2b_u8, 0x73_u8, 0x6d_u8, 0xc0_u8, 0xc9_u8, 0x2f_u8, 0xdc_u8]), 14_u32)
  WPD_DEVICE_TYPE = PROPERTYKEY.new(LibC::GUID.new(0x26d4979a_u32, 0xe643_u16, 0x4626_u16, StaticArray[0x9e_u8, 0x2b_u8, 0x73_u8, 0x6d_u8, 0xc0_u8, 0xc9_u8, 0x2f_u8, 0xdc_u8]), 15_u32)
  WPD_DEVICE_NETWORK_IDENTIFIER = PROPERTYKEY.new(LibC::GUID.new(0x26d4979a_u32, 0xe643_u16, 0x4626_u16, StaticArray[0x9e_u8, 0x2b_u8, 0x73_u8, 0x6d_u8, 0xc0_u8, 0xc9_u8, 0x2f_u8, 0xdc_u8]), 16_u32)
  WPD_DEVICE_PROPERTIES_V2 = "463dd662-7fc4-4291-911c-7f4c9cca9799"
  WPD_DEVICE_FUNCTIONAL_UNIQUE_ID = PROPERTYKEY.new(LibC::GUID.new(0x463dd662_u32, 0x7fc4_u16, 0x4291_u16, StaticArray[0x91_u8, 0x1c_u8, 0x7f_u8, 0x4c_u8, 0x9c_u8, 0xca_u8, 0x97_u8, 0x99_u8]), 2_u32)
  WPD_DEVICE_MODEL_UNIQUE_ID = PROPERTYKEY.new(LibC::GUID.new(0x463dd662_u32, 0x7fc4_u16, 0x4291_u16, StaticArray[0x91_u8, 0x1c_u8, 0x7f_u8, 0x4c_u8, 0x9c_u8, 0xca_u8, 0x97_u8, 0x99_u8]), 3_u32)
  WPD_DEVICE_TRANSPORT = PROPERTYKEY.new(LibC::GUID.new(0x463dd662_u32, 0x7fc4_u16, 0x4291_u16, StaticArray[0x91_u8, 0x1c_u8, 0x7f_u8, 0x4c_u8, 0x9c_u8, 0xca_u8, 0x97_u8, 0x99_u8]), 4_u32)
  WPD_DEVICE_USE_DEVICE_STAGE = PROPERTYKEY.new(LibC::GUID.new(0x463dd662_u32, 0x7fc4_u16, 0x4291_u16, StaticArray[0x91_u8, 0x1c_u8, 0x7f_u8, 0x4c_u8, 0x9c_u8, 0xca_u8, 0x97_u8, 0x99_u8]), 5_u32)
  WPD_DEVICE_PROPERTIES_V3 = "6c2b878c-c2ec-490d-b425-d7a75e23e5ed"
  WPD_DEVICE_EDP_IDENTITY = PROPERTYKEY.new(LibC::GUID.new(0x6c2b878c_u32, 0xc2ec_u16, 0x490d_u16, StaticArray[0xb4_u8, 0x25_u8, 0xd7_u8, 0xa7_u8, 0x5e_u8, 0x23_u8, 0xe5_u8, 0xed_u8]), 1_u32)
  WPD_SERVICE_PROPERTIES_V1 = "7510698a-cb54-481c-b8db-0d75c93f1c06"
  WPD_SERVICE_VERSION = PROPERTYKEY.new(LibC::GUID.new(0x7510698a_u32, 0xcb54_u16, 0x481c_u16, StaticArray[0xb8_u8, 0xdb_u8, 0xd_u8, 0x75_u8, 0xc9_u8, 0x3f_u8, 0x1c_u8, 0x6_u8]), 2_u32)
  WPD_EVENT_PROPERTIES_V1 = "15ab1953-f817-4fef-a921-5676e838f6e0"
  WPD_EVENT_PARAMETER_PNP_DEVICE_ID = PROPERTYKEY.new(LibC::GUID.new(0x15ab1953_u32, 0xf817_u16, 0x4fef_u16, StaticArray[0xa9_u8, 0x21_u8, 0x56_u8, 0x76_u8, 0xe8_u8, 0x38_u8, 0xf6_u8, 0xe0_u8]), 2_u32)
  WPD_EVENT_PARAMETER_EVENT_ID = PROPERTYKEY.new(LibC::GUID.new(0x15ab1953_u32, 0xf817_u16, 0x4fef_u16, StaticArray[0xa9_u8, 0x21_u8, 0x56_u8, 0x76_u8, 0xe8_u8, 0x38_u8, 0xf6_u8, 0xe0_u8]), 3_u32)
  WPD_EVENT_PARAMETER_OPERATION_STATE = PROPERTYKEY.new(LibC::GUID.new(0x15ab1953_u32, 0xf817_u16, 0x4fef_u16, StaticArray[0xa9_u8, 0x21_u8, 0x56_u8, 0x76_u8, 0xe8_u8, 0x38_u8, 0xf6_u8, 0xe0_u8]), 4_u32)
  WPD_EVENT_PARAMETER_OPERATION_PROGRESS = PROPERTYKEY.new(LibC::GUID.new(0x15ab1953_u32, 0xf817_u16, 0x4fef_u16, StaticArray[0xa9_u8, 0x21_u8, 0x56_u8, 0x76_u8, 0xe8_u8, 0x38_u8, 0xf6_u8, 0xe0_u8]), 5_u32)
  WPD_EVENT_PARAMETER_OBJECT_PARENT_PERSISTENT_UNIQUE_ID = PROPERTYKEY.new(LibC::GUID.new(0x15ab1953_u32, 0xf817_u16, 0x4fef_u16, StaticArray[0xa9_u8, 0x21_u8, 0x56_u8, 0x76_u8, 0xe8_u8, 0x38_u8, 0xf6_u8, 0xe0_u8]), 6_u32)
  WPD_EVENT_PARAMETER_OBJECT_CREATION_COOKIE = PROPERTYKEY.new(LibC::GUID.new(0x15ab1953_u32, 0xf817_u16, 0x4fef_u16, StaticArray[0xa9_u8, 0x21_u8, 0x56_u8, 0x76_u8, 0xe8_u8, 0x38_u8, 0xf6_u8, 0xe0_u8]), 7_u32)
  WPD_EVENT_PARAMETER_CHILD_HIERARCHY_CHANGED = PROPERTYKEY.new(LibC::GUID.new(0x15ab1953_u32, 0xf817_u16, 0x4fef_u16, StaticArray[0xa9_u8, 0x21_u8, 0x56_u8, 0x76_u8, 0xe8_u8, 0x38_u8, 0xf6_u8, 0xe0_u8]), 8_u32)
  WPD_EVENT_PROPERTIES_V2 = "52807b8a-4914-4323-9b9a-74f654b2b846"
  WPD_EVENT_PARAMETER_SERVICE_METHOD_CONTEXT = PROPERTYKEY.new(LibC::GUID.new(0x52807b8a_u32, 0x4914_u16, 0x4323_u16, StaticArray[0x9b_u8, 0x9a_u8, 0x74_u8, 0xf6_u8, 0x54_u8, 0xb2_u8, 0xb8_u8, 0x46_u8]), 2_u32)
  WPD_EVENT_OPTIONS_V1 = "b3d8dad7-a361-4b83-8a48-5b02ce10713b"
  WPD_EVENT_OPTION_IS_BROADCAST_EVENT = PROPERTYKEY.new(LibC::GUID.new(0xb3d8dad7_u32, 0xa361_u16, 0x4b83_u16, StaticArray[0x8a_u8, 0x48_u8, 0x5b_u8, 0x2_u8, 0xce_u8, 0x10_u8, 0x71_u8, 0x3b_u8]), 2_u32)
  WPD_EVENT_OPTION_IS_AUTOPLAY_EVENT = PROPERTYKEY.new(LibC::GUID.new(0xb3d8dad7_u32, 0xa361_u16, 0x4b83_u16, StaticArray[0x8a_u8, 0x48_u8, 0x5b_u8, 0x2_u8, 0xce_u8, 0x10_u8, 0x71_u8, 0x3b_u8]), 3_u32)
  WPD_EVENT_ATTRIBUTES_V1 = "10c96578-2e81-4111-adde-e08ca6138f6d"
  WPD_EVENT_ATTRIBUTE_NAME = PROPERTYKEY.new(LibC::GUID.new(0x10c96578_u32, 0x2e81_u16, 0x4111_u16, StaticArray[0xad_u8, 0xde_u8, 0xe0_u8, 0x8c_u8, 0xa6_u8, 0x13_u8, 0x8f_u8, 0x6d_u8]), 2_u32)
  WPD_EVENT_ATTRIBUTE_PARAMETERS = PROPERTYKEY.new(LibC::GUID.new(0x10c96578_u32, 0x2e81_u16, 0x4111_u16, StaticArray[0xad_u8, 0xde_u8, 0xe0_u8, 0x8c_u8, 0xa6_u8, 0x13_u8, 0x8f_u8, 0x6d_u8]), 3_u32)
  WPD_EVENT_ATTRIBUTE_OPTIONS = PROPERTYKEY.new(LibC::GUID.new(0x10c96578_u32, 0x2e81_u16, 0x4111_u16, StaticArray[0xad_u8, 0xde_u8, 0xe0_u8, 0x8c_u8, 0xa6_u8, 0x13_u8, 0x8f_u8, 0x6d_u8]), 4_u32)
  WPD_API_OPTIONS_V1 = "10e54a3e-052d-4777-a13c-de7614be2bc4"
  WPD_API_OPTION_USE_CLEAR_DATA_STREAM = PROPERTYKEY.new(LibC::GUID.new(0x10e54a3e_u32, 0x52d_u16, 0x4777_u16, StaticArray[0xa1_u8, 0x3c_u8, 0xde_u8, 0x76_u8, 0x14_u8, 0xbe_u8, 0x2b_u8, 0xc4_u8]), 2_u32)
  WPD_API_OPTION_IOCTL_ACCESS = PROPERTYKEY.new(LibC::GUID.new(0x10e54a3e_u32, 0x52d_u16, 0x4777_u16, StaticArray[0xa1_u8, 0x3c_u8, 0xde_u8, 0x76_u8, 0x14_u8, 0xbe_u8, 0x2b_u8, 0xc4_u8]), 3_u32)
  WPD_FORMAT_ATTRIBUTES_V1 = "a0a02000-bcaf-4be8-b3f5-233f231cf58f"
  WPD_FORMAT_ATTRIBUTE_NAME = PROPERTYKEY.new(LibC::GUID.new(0xa0a02000_u32, 0xbcaf_u16, 0x4be8_u16, StaticArray[0xb3_u8, 0xf5_u8, 0x23_u8, 0x3f_u8, 0x23_u8, 0x1c_u8, 0xf5_u8, 0x8f_u8]), 2_u32)
  WPD_FORMAT_ATTRIBUTE_MIMETYPE = PROPERTYKEY.new(LibC::GUID.new(0xa0a02000_u32, 0xbcaf_u16, 0x4be8_u16, StaticArray[0xb3_u8, 0xf5_u8, 0x23_u8, 0x3f_u8, 0x23_u8, 0x1c_u8, 0xf5_u8, 0x8f_u8]), 3_u32)
  WPD_METHOD_ATTRIBUTES_V1 = "f17a5071-f039-44af-8efe-432cf32e432a"
  WPD_METHOD_ATTRIBUTE_NAME = PROPERTYKEY.new(LibC::GUID.new(0xf17a5071_u32, 0xf039_u16, 0x44af_u16, StaticArray[0x8e_u8, 0xfe_u8, 0x43_u8, 0x2c_u8, 0xf3_u8, 0x2e_u8, 0x43_u8, 0x2a_u8]), 2_u32)
  WPD_METHOD_ATTRIBUTE_ASSOCIATED_FORMAT = PROPERTYKEY.new(LibC::GUID.new(0xf17a5071_u32, 0xf039_u16, 0x44af_u16, StaticArray[0x8e_u8, 0xfe_u8, 0x43_u8, 0x2c_u8, 0xf3_u8, 0x2e_u8, 0x43_u8, 0x2a_u8]), 3_u32)
  WPD_METHOD_ATTRIBUTE_ACCESS = PROPERTYKEY.new(LibC::GUID.new(0xf17a5071_u32, 0xf039_u16, 0x44af_u16, StaticArray[0x8e_u8, 0xfe_u8, 0x43_u8, 0x2c_u8, 0xf3_u8, 0x2e_u8, 0x43_u8, 0x2a_u8]), 4_u32)
  WPD_METHOD_ATTRIBUTE_PARAMETERS = PROPERTYKEY.new(LibC::GUID.new(0xf17a5071_u32, 0xf039_u16, 0x44af_u16, StaticArray[0x8e_u8, 0xfe_u8, 0x43_u8, 0x2c_u8, 0xf3_u8, 0x2e_u8, 0x43_u8, 0x2a_u8]), 5_u32)
  WPD_PARAMETER_ATTRIBUTES_V1 = "e6864dd7-f325-45ea-a1d5-97cf73b6ca58"
  WPD_PARAMETER_ATTRIBUTE_ORDER = PROPERTYKEY.new(LibC::GUID.new(0xe6864dd7_u32, 0xf325_u16, 0x45ea_u16, StaticArray[0xa1_u8, 0xd5_u8, 0x97_u8, 0xcf_u8, 0x73_u8, 0xb6_u8, 0xca_u8, 0x58_u8]), 2_u32)
  WPD_PARAMETER_ATTRIBUTE_USAGE = PROPERTYKEY.new(LibC::GUID.new(0xe6864dd7_u32, 0xf325_u16, 0x45ea_u16, StaticArray[0xa1_u8, 0xd5_u8, 0x97_u8, 0xcf_u8, 0x73_u8, 0xb6_u8, 0xca_u8, 0x58_u8]), 3_u32)
  WPD_PARAMETER_ATTRIBUTE_FORM = PROPERTYKEY.new(LibC::GUID.new(0xe6864dd7_u32, 0xf325_u16, 0x45ea_u16, StaticArray[0xa1_u8, 0xd5_u8, 0x97_u8, 0xcf_u8, 0x73_u8, 0xb6_u8, 0xca_u8, 0x58_u8]), 4_u32)
  WPD_PARAMETER_ATTRIBUTE_DEFAULT_VALUE = PROPERTYKEY.new(LibC::GUID.new(0xe6864dd7_u32, 0xf325_u16, 0x45ea_u16, StaticArray[0xa1_u8, 0xd5_u8, 0x97_u8, 0xcf_u8, 0x73_u8, 0xb6_u8, 0xca_u8, 0x58_u8]), 5_u32)
  WPD_PARAMETER_ATTRIBUTE_RANGE_MIN = PROPERTYKEY.new(LibC::GUID.new(0xe6864dd7_u32, 0xf325_u16, 0x45ea_u16, StaticArray[0xa1_u8, 0xd5_u8, 0x97_u8, 0xcf_u8, 0x73_u8, 0xb6_u8, 0xca_u8, 0x58_u8]), 6_u32)
  WPD_PARAMETER_ATTRIBUTE_RANGE_MAX = PROPERTYKEY.new(LibC::GUID.new(0xe6864dd7_u32, 0xf325_u16, 0x45ea_u16, StaticArray[0xa1_u8, 0xd5_u8, 0x97_u8, 0xcf_u8, 0x73_u8, 0xb6_u8, 0xca_u8, 0x58_u8]), 7_u32)
  WPD_PARAMETER_ATTRIBUTE_RANGE_STEP = PROPERTYKEY.new(LibC::GUID.new(0xe6864dd7_u32, 0xf325_u16, 0x45ea_u16, StaticArray[0xa1_u8, 0xd5_u8, 0x97_u8, 0xcf_u8, 0x73_u8, 0xb6_u8, 0xca_u8, 0x58_u8]), 8_u32)
  WPD_PARAMETER_ATTRIBUTE_ENUMERATION_ELEMENTS = PROPERTYKEY.new(LibC::GUID.new(0xe6864dd7_u32, 0xf325_u16, 0x45ea_u16, StaticArray[0xa1_u8, 0xd5_u8, 0x97_u8, 0xcf_u8, 0x73_u8, 0xb6_u8, 0xca_u8, 0x58_u8]), 9_u32)
  WPD_PARAMETER_ATTRIBUTE_REGULAR_EXPRESSION = PROPERTYKEY.new(LibC::GUID.new(0xe6864dd7_u32, 0xf325_u16, 0x45ea_u16, StaticArray[0xa1_u8, 0xd5_u8, 0x97_u8, 0xcf_u8, 0x73_u8, 0xb6_u8, 0xca_u8, 0x58_u8]), 10_u32)
  WPD_PARAMETER_ATTRIBUTE_MAX_SIZE = PROPERTYKEY.new(LibC::GUID.new(0xe6864dd7_u32, 0xf325_u16, 0x45ea_u16, StaticArray[0xa1_u8, 0xd5_u8, 0x97_u8, 0xcf_u8, 0x73_u8, 0xb6_u8, 0xca_u8, 0x58_u8]), 11_u32)
  WPD_PARAMETER_ATTRIBUTE_VARTYPE = PROPERTYKEY.new(LibC::GUID.new(0xe6864dd7_u32, 0xf325_u16, 0x45ea_u16, StaticArray[0xa1_u8, 0xd5_u8, 0x97_u8, 0xcf_u8, 0x73_u8, 0xb6_u8, 0xca_u8, 0x58_u8]), 12_u32)
  WPD_PARAMETER_ATTRIBUTE_NAME = PROPERTYKEY.new(LibC::GUID.new(0xe6864dd7_u32, 0xf325_u16, 0x45ea_u16, StaticArray[0xa1_u8, 0xd5_u8, 0x97_u8, 0xcf_u8, 0x73_u8, 0xb6_u8, 0xca_u8, 0x58_u8]), 13_u32)
  WPD_CATEGORY_COMMON = "f0422a9c-5dc8-4440-b5bd-5df28835658a"
  WPD_COMMAND_COMMON_RESET_DEVICE = PROPERTYKEY.new(LibC::GUID.new(0xf0422a9c_u32, 0x5dc8_u16, 0x4440_u16, StaticArray[0xb5_u8, 0xbd_u8, 0x5d_u8, 0xf2_u8, 0x88_u8, 0x35_u8, 0x65_u8, 0x8a_u8]), 2_u32)
  WPD_COMMAND_COMMON_GET_OBJECT_IDS_FROM_PERSISTENT_UNIQUE_IDS = PROPERTYKEY.new(LibC::GUID.new(0xf0422a9c_u32, 0x5dc8_u16, 0x4440_u16, StaticArray[0xb5_u8, 0xbd_u8, 0x5d_u8, 0xf2_u8, 0x88_u8, 0x35_u8, 0x65_u8, 0x8a_u8]), 3_u32)
  WPD_COMMAND_COMMON_SAVE_CLIENT_INFORMATION = PROPERTYKEY.new(LibC::GUID.new(0xf0422a9c_u32, 0x5dc8_u16, 0x4440_u16, StaticArray[0xb5_u8, 0xbd_u8, 0x5d_u8, 0xf2_u8, 0x88_u8, 0x35_u8, 0x65_u8, 0x8a_u8]), 4_u32)
  WPD_PROPERTY_COMMON_COMMAND_CATEGORY = PROPERTYKEY.new(LibC::GUID.new(0xf0422a9c_u32, 0x5dc8_u16, 0x4440_u16, StaticArray[0xb5_u8, 0xbd_u8, 0x5d_u8, 0xf2_u8, 0x88_u8, 0x35_u8, 0x65_u8, 0x8a_u8]), 1001_u32)
  WPD_PROPERTY_COMMON_COMMAND_ID = PROPERTYKEY.new(LibC::GUID.new(0xf0422a9c_u32, 0x5dc8_u16, 0x4440_u16, StaticArray[0xb5_u8, 0xbd_u8, 0x5d_u8, 0xf2_u8, 0x88_u8, 0x35_u8, 0x65_u8, 0x8a_u8]), 1002_u32)
  WPD_PROPERTY_COMMON_HRESULT = PROPERTYKEY.new(LibC::GUID.new(0xf0422a9c_u32, 0x5dc8_u16, 0x4440_u16, StaticArray[0xb5_u8, 0xbd_u8, 0x5d_u8, 0xf2_u8, 0x88_u8, 0x35_u8, 0x65_u8, 0x8a_u8]), 1003_u32)
  WPD_PROPERTY_COMMON_DRIVER_ERROR_CODE = PROPERTYKEY.new(LibC::GUID.new(0xf0422a9c_u32, 0x5dc8_u16, 0x4440_u16, StaticArray[0xb5_u8, 0xbd_u8, 0x5d_u8, 0xf2_u8, 0x88_u8, 0x35_u8, 0x65_u8, 0x8a_u8]), 1004_u32)
  WPD_PROPERTY_COMMON_COMMAND_TARGET = PROPERTYKEY.new(LibC::GUID.new(0xf0422a9c_u32, 0x5dc8_u16, 0x4440_u16, StaticArray[0xb5_u8, 0xbd_u8, 0x5d_u8, 0xf2_u8, 0x88_u8, 0x35_u8, 0x65_u8, 0x8a_u8]), 1006_u32)
  WPD_PROPERTY_COMMON_PERSISTENT_UNIQUE_IDS = PROPERTYKEY.new(LibC::GUID.new(0xf0422a9c_u32, 0x5dc8_u16, 0x4440_u16, StaticArray[0xb5_u8, 0xbd_u8, 0x5d_u8, 0xf2_u8, 0x88_u8, 0x35_u8, 0x65_u8, 0x8a_u8]), 1007_u32)
  WPD_PROPERTY_COMMON_OBJECT_IDS = PROPERTYKEY.new(LibC::GUID.new(0xf0422a9c_u32, 0x5dc8_u16, 0x4440_u16, StaticArray[0xb5_u8, 0xbd_u8, 0x5d_u8, 0xf2_u8, 0x88_u8, 0x35_u8, 0x65_u8, 0x8a_u8]), 1008_u32)
  WPD_PROPERTY_COMMON_CLIENT_INFORMATION = PROPERTYKEY.new(LibC::GUID.new(0xf0422a9c_u32, 0x5dc8_u16, 0x4440_u16, StaticArray[0xb5_u8, 0xbd_u8, 0x5d_u8, 0xf2_u8, 0x88_u8, 0x35_u8, 0x65_u8, 0x8a_u8]), 1009_u32)
  WPD_PROPERTY_COMMON_CLIENT_INFORMATION_CONTEXT = PROPERTYKEY.new(LibC::GUID.new(0xf0422a9c_u32, 0x5dc8_u16, 0x4440_u16, StaticArray[0xb5_u8, 0xbd_u8, 0x5d_u8, 0xf2_u8, 0x88_u8, 0x35_u8, 0x65_u8, 0x8a_u8]), 1010_u32)
  WPD_PROPERTY_COMMON_ACTIVITY_ID = PROPERTYKEY.new(LibC::GUID.new(0xf0422a9c_u32, 0x5dc8_u16, 0x4440_u16, StaticArray[0xb5_u8, 0xbd_u8, 0x5d_u8, 0xf2_u8, 0x88_u8, 0x35_u8, 0x65_u8, 0x8a_u8]), 1011_u32)
  WPD_OPTION_VALID_OBJECT_IDS = PROPERTYKEY.new(LibC::GUID.new(0xf0422a9c_u32, 0x5dc8_u16, 0x4440_u16, StaticArray[0xb5_u8, 0xbd_u8, 0x5d_u8, 0xf2_u8, 0x88_u8, 0x35_u8, 0x65_u8, 0x8a_u8]), 5001_u32)
  WPD_CATEGORY_OBJECT_ENUMERATION = "b7474e91-e7f8-4ad9-b400-ad1a4b58eeec"
  WPD_COMMAND_OBJECT_ENUMERATION_START_FIND = PROPERTYKEY.new(LibC::GUID.new(0xb7474e91_u32, 0xe7f8_u16, 0x4ad9_u16, StaticArray[0xb4_u8, 0x0_u8, 0xad_u8, 0x1a_u8, 0x4b_u8, 0x58_u8, 0xee_u8, 0xec_u8]), 2_u32)
  WPD_COMMAND_OBJECT_ENUMERATION_FIND_NEXT = PROPERTYKEY.new(LibC::GUID.new(0xb7474e91_u32, 0xe7f8_u16, 0x4ad9_u16, StaticArray[0xb4_u8, 0x0_u8, 0xad_u8, 0x1a_u8, 0x4b_u8, 0x58_u8, 0xee_u8, 0xec_u8]), 3_u32)
  WPD_COMMAND_OBJECT_ENUMERATION_END_FIND = PROPERTYKEY.new(LibC::GUID.new(0xb7474e91_u32, 0xe7f8_u16, 0x4ad9_u16, StaticArray[0xb4_u8, 0x0_u8, 0xad_u8, 0x1a_u8, 0x4b_u8, 0x58_u8, 0xee_u8, 0xec_u8]), 4_u32)
  WPD_PROPERTY_OBJECT_ENUMERATION_PARENT_ID = PROPERTYKEY.new(LibC::GUID.new(0xb7474e91_u32, 0xe7f8_u16, 0x4ad9_u16, StaticArray[0xb4_u8, 0x0_u8, 0xad_u8, 0x1a_u8, 0x4b_u8, 0x58_u8, 0xee_u8, 0xec_u8]), 1001_u32)
  WPD_PROPERTY_OBJECT_ENUMERATION_FILTER = PROPERTYKEY.new(LibC::GUID.new(0xb7474e91_u32, 0xe7f8_u16, 0x4ad9_u16, StaticArray[0xb4_u8, 0x0_u8, 0xad_u8, 0x1a_u8, 0x4b_u8, 0x58_u8, 0xee_u8, 0xec_u8]), 1002_u32)
  WPD_PROPERTY_OBJECT_ENUMERATION_OBJECT_IDS = PROPERTYKEY.new(LibC::GUID.new(0xb7474e91_u32, 0xe7f8_u16, 0x4ad9_u16, StaticArray[0xb4_u8, 0x0_u8, 0xad_u8, 0x1a_u8, 0x4b_u8, 0x58_u8, 0xee_u8, 0xec_u8]), 1003_u32)
  WPD_PROPERTY_OBJECT_ENUMERATION_CONTEXT = PROPERTYKEY.new(LibC::GUID.new(0xb7474e91_u32, 0xe7f8_u16, 0x4ad9_u16, StaticArray[0xb4_u8, 0x0_u8, 0xad_u8, 0x1a_u8, 0x4b_u8, 0x58_u8, 0xee_u8, 0xec_u8]), 1004_u32)
  WPD_PROPERTY_OBJECT_ENUMERATION_NUM_OBJECTS_REQUESTED = PROPERTYKEY.new(LibC::GUID.new(0xb7474e91_u32, 0xe7f8_u16, 0x4ad9_u16, StaticArray[0xb4_u8, 0x0_u8, 0xad_u8, 0x1a_u8, 0x4b_u8, 0x58_u8, 0xee_u8, 0xec_u8]), 1005_u32)
  WPD_CATEGORY_OBJECT_PROPERTIES = "9e5582e4-0814-44e6-981a-b2998d583804"
  WPD_COMMAND_OBJECT_PROPERTIES_GET_SUPPORTED = PROPERTYKEY.new(LibC::GUID.new(0x9e5582e4_u32, 0x814_u16, 0x44e6_u16, StaticArray[0x98_u8, 0x1a_u8, 0xb2_u8, 0x99_u8, 0x8d_u8, 0x58_u8, 0x38_u8, 0x4_u8]), 2_u32)
  WPD_COMMAND_OBJECT_PROPERTIES_GET_ATTRIBUTES = PROPERTYKEY.new(LibC::GUID.new(0x9e5582e4_u32, 0x814_u16, 0x44e6_u16, StaticArray[0x98_u8, 0x1a_u8, 0xb2_u8, 0x99_u8, 0x8d_u8, 0x58_u8, 0x38_u8, 0x4_u8]), 3_u32)
  WPD_COMMAND_OBJECT_PROPERTIES_GET = PROPERTYKEY.new(LibC::GUID.new(0x9e5582e4_u32, 0x814_u16, 0x44e6_u16, StaticArray[0x98_u8, 0x1a_u8, 0xb2_u8, 0x99_u8, 0x8d_u8, 0x58_u8, 0x38_u8, 0x4_u8]), 4_u32)
  WPD_COMMAND_OBJECT_PROPERTIES_SET = PROPERTYKEY.new(LibC::GUID.new(0x9e5582e4_u32, 0x814_u16, 0x44e6_u16, StaticArray[0x98_u8, 0x1a_u8, 0xb2_u8, 0x99_u8, 0x8d_u8, 0x58_u8, 0x38_u8, 0x4_u8]), 5_u32)
  WPD_COMMAND_OBJECT_PROPERTIES_GET_ALL = PROPERTYKEY.new(LibC::GUID.new(0x9e5582e4_u32, 0x814_u16, 0x44e6_u16, StaticArray[0x98_u8, 0x1a_u8, 0xb2_u8, 0x99_u8, 0x8d_u8, 0x58_u8, 0x38_u8, 0x4_u8]), 6_u32)
  WPD_COMMAND_OBJECT_PROPERTIES_DELETE = PROPERTYKEY.new(LibC::GUID.new(0x9e5582e4_u32, 0x814_u16, 0x44e6_u16, StaticArray[0x98_u8, 0x1a_u8, 0xb2_u8, 0x99_u8, 0x8d_u8, 0x58_u8, 0x38_u8, 0x4_u8]), 7_u32)
  WPD_PROPERTY_OBJECT_PROPERTIES_OBJECT_ID = PROPERTYKEY.new(LibC::GUID.new(0x9e5582e4_u32, 0x814_u16, 0x44e6_u16, StaticArray[0x98_u8, 0x1a_u8, 0xb2_u8, 0x99_u8, 0x8d_u8, 0x58_u8, 0x38_u8, 0x4_u8]), 1001_u32)
  WPD_PROPERTY_OBJECT_PROPERTIES_PROPERTY_KEYS = PROPERTYKEY.new(LibC::GUID.new(0x9e5582e4_u32, 0x814_u16, 0x44e6_u16, StaticArray[0x98_u8, 0x1a_u8, 0xb2_u8, 0x99_u8, 0x8d_u8, 0x58_u8, 0x38_u8, 0x4_u8]), 1002_u32)
  WPD_PROPERTY_OBJECT_PROPERTIES_PROPERTY_ATTRIBUTES = PROPERTYKEY.new(LibC::GUID.new(0x9e5582e4_u32, 0x814_u16, 0x44e6_u16, StaticArray[0x98_u8, 0x1a_u8, 0xb2_u8, 0x99_u8, 0x8d_u8, 0x58_u8, 0x38_u8, 0x4_u8]), 1003_u32)
  WPD_PROPERTY_OBJECT_PROPERTIES_PROPERTY_VALUES = PROPERTYKEY.new(LibC::GUID.new(0x9e5582e4_u32, 0x814_u16, 0x44e6_u16, StaticArray[0x98_u8, 0x1a_u8, 0xb2_u8, 0x99_u8, 0x8d_u8, 0x58_u8, 0x38_u8, 0x4_u8]), 1004_u32)
  WPD_PROPERTY_OBJECT_PROPERTIES_PROPERTY_WRITE_RESULTS = PROPERTYKEY.new(LibC::GUID.new(0x9e5582e4_u32, 0x814_u16, 0x44e6_u16, StaticArray[0x98_u8, 0x1a_u8, 0xb2_u8, 0x99_u8, 0x8d_u8, 0x58_u8, 0x38_u8, 0x4_u8]), 1005_u32)
  WPD_PROPERTY_OBJECT_PROPERTIES_PROPERTY_DELETE_RESULTS = PROPERTYKEY.new(LibC::GUID.new(0x9e5582e4_u32, 0x814_u16, 0x44e6_u16, StaticArray[0x98_u8, 0x1a_u8, 0xb2_u8, 0x99_u8, 0x8d_u8, 0x58_u8, 0x38_u8, 0x4_u8]), 1006_u32)
  WPD_CATEGORY_OBJECT_PROPERTIES_BULK = "11c824dd-04cd-4e4e-8c7b-f6efb794d84e"
  WPD_COMMAND_OBJECT_PROPERTIES_BULK_GET_VALUES_BY_OBJECT_LIST_START = PROPERTYKEY.new(LibC::GUID.new(0x11c824dd_u32, 0x4cd_u16, 0x4e4e_u16, StaticArray[0x8c_u8, 0x7b_u8, 0xf6_u8, 0xef_u8, 0xb7_u8, 0x94_u8, 0xd8_u8, 0x4e_u8]), 2_u32)
  WPD_COMMAND_OBJECT_PROPERTIES_BULK_GET_VALUES_BY_OBJECT_LIST_NEXT = PROPERTYKEY.new(LibC::GUID.new(0x11c824dd_u32, 0x4cd_u16, 0x4e4e_u16, StaticArray[0x8c_u8, 0x7b_u8, 0xf6_u8, 0xef_u8, 0xb7_u8, 0x94_u8, 0xd8_u8, 0x4e_u8]), 3_u32)
  WPD_COMMAND_OBJECT_PROPERTIES_BULK_GET_VALUES_BY_OBJECT_LIST_END = PROPERTYKEY.new(LibC::GUID.new(0x11c824dd_u32, 0x4cd_u16, 0x4e4e_u16, StaticArray[0x8c_u8, 0x7b_u8, 0xf6_u8, 0xef_u8, 0xb7_u8, 0x94_u8, 0xd8_u8, 0x4e_u8]), 4_u32)
  WPD_COMMAND_OBJECT_PROPERTIES_BULK_GET_VALUES_BY_OBJECT_FORMAT_START = PROPERTYKEY.new(LibC::GUID.new(0x11c824dd_u32, 0x4cd_u16, 0x4e4e_u16, StaticArray[0x8c_u8, 0x7b_u8, 0xf6_u8, 0xef_u8, 0xb7_u8, 0x94_u8, 0xd8_u8, 0x4e_u8]), 5_u32)
  WPD_COMMAND_OBJECT_PROPERTIES_BULK_GET_VALUES_BY_OBJECT_FORMAT_NEXT = PROPERTYKEY.new(LibC::GUID.new(0x11c824dd_u32, 0x4cd_u16, 0x4e4e_u16, StaticArray[0x8c_u8, 0x7b_u8, 0xf6_u8, 0xef_u8, 0xb7_u8, 0x94_u8, 0xd8_u8, 0x4e_u8]), 6_u32)
  WPD_COMMAND_OBJECT_PROPERTIES_BULK_GET_VALUES_BY_OBJECT_FORMAT_END = PROPERTYKEY.new(LibC::GUID.new(0x11c824dd_u32, 0x4cd_u16, 0x4e4e_u16, StaticArray[0x8c_u8, 0x7b_u8, 0xf6_u8, 0xef_u8, 0xb7_u8, 0x94_u8, 0xd8_u8, 0x4e_u8]), 7_u32)
  WPD_COMMAND_OBJECT_PROPERTIES_BULK_SET_VALUES_BY_OBJECT_LIST_START = PROPERTYKEY.new(LibC::GUID.new(0x11c824dd_u32, 0x4cd_u16, 0x4e4e_u16, StaticArray[0x8c_u8, 0x7b_u8, 0xf6_u8, 0xef_u8, 0xb7_u8, 0x94_u8, 0xd8_u8, 0x4e_u8]), 8_u32)
  WPD_COMMAND_OBJECT_PROPERTIES_BULK_SET_VALUES_BY_OBJECT_LIST_NEXT = PROPERTYKEY.new(LibC::GUID.new(0x11c824dd_u32, 0x4cd_u16, 0x4e4e_u16, StaticArray[0x8c_u8, 0x7b_u8, 0xf6_u8, 0xef_u8, 0xb7_u8, 0x94_u8, 0xd8_u8, 0x4e_u8]), 9_u32)
  WPD_COMMAND_OBJECT_PROPERTIES_BULK_SET_VALUES_BY_OBJECT_LIST_END = PROPERTYKEY.new(LibC::GUID.new(0x11c824dd_u32, 0x4cd_u16, 0x4e4e_u16, StaticArray[0x8c_u8, 0x7b_u8, 0xf6_u8, 0xef_u8, 0xb7_u8, 0x94_u8, 0xd8_u8, 0x4e_u8]), 10_u32)
  WPD_PROPERTY_OBJECT_PROPERTIES_BULK_OBJECT_IDS = PROPERTYKEY.new(LibC::GUID.new(0x11c824dd_u32, 0x4cd_u16, 0x4e4e_u16, StaticArray[0x8c_u8, 0x7b_u8, 0xf6_u8, 0xef_u8, 0xb7_u8, 0x94_u8, 0xd8_u8, 0x4e_u8]), 1001_u32)
  WPD_PROPERTY_OBJECT_PROPERTIES_BULK_CONTEXT = PROPERTYKEY.new(LibC::GUID.new(0x11c824dd_u32, 0x4cd_u16, 0x4e4e_u16, StaticArray[0x8c_u8, 0x7b_u8, 0xf6_u8, 0xef_u8, 0xb7_u8, 0x94_u8, 0xd8_u8, 0x4e_u8]), 1002_u32)
  WPD_PROPERTY_OBJECT_PROPERTIES_BULK_VALUES = PROPERTYKEY.new(LibC::GUID.new(0x11c824dd_u32, 0x4cd_u16, 0x4e4e_u16, StaticArray[0x8c_u8, 0x7b_u8, 0xf6_u8, 0xef_u8, 0xb7_u8, 0x94_u8, 0xd8_u8, 0x4e_u8]), 1003_u32)
  WPD_PROPERTY_OBJECT_PROPERTIES_BULK_PROPERTY_KEYS = PROPERTYKEY.new(LibC::GUID.new(0x11c824dd_u32, 0x4cd_u16, 0x4e4e_u16, StaticArray[0x8c_u8, 0x7b_u8, 0xf6_u8, 0xef_u8, 0xb7_u8, 0x94_u8, 0xd8_u8, 0x4e_u8]), 1004_u32)
  WPD_PROPERTY_OBJECT_PROPERTIES_BULK_DEPTH = PROPERTYKEY.new(LibC::GUID.new(0x11c824dd_u32, 0x4cd_u16, 0x4e4e_u16, StaticArray[0x8c_u8, 0x7b_u8, 0xf6_u8, 0xef_u8, 0xb7_u8, 0x94_u8, 0xd8_u8, 0x4e_u8]), 1005_u32)
  WPD_PROPERTY_OBJECT_PROPERTIES_BULK_PARENT_OBJECT_ID = PROPERTYKEY.new(LibC::GUID.new(0x11c824dd_u32, 0x4cd_u16, 0x4e4e_u16, StaticArray[0x8c_u8, 0x7b_u8, 0xf6_u8, 0xef_u8, 0xb7_u8, 0x94_u8, 0xd8_u8, 0x4e_u8]), 1006_u32)
  WPD_PROPERTY_OBJECT_PROPERTIES_BULK_OBJECT_FORMAT = PROPERTYKEY.new(LibC::GUID.new(0x11c824dd_u32, 0x4cd_u16, 0x4e4e_u16, StaticArray[0x8c_u8, 0x7b_u8, 0xf6_u8, 0xef_u8, 0xb7_u8, 0x94_u8, 0xd8_u8, 0x4e_u8]), 1007_u32)
  WPD_PROPERTY_OBJECT_PROPERTIES_BULK_WRITE_RESULTS = PROPERTYKEY.new(LibC::GUID.new(0x11c824dd_u32, 0x4cd_u16, 0x4e4e_u16, StaticArray[0x8c_u8, 0x7b_u8, 0xf6_u8, 0xef_u8, 0xb7_u8, 0x94_u8, 0xd8_u8, 0x4e_u8]), 1008_u32)
  WPD_CATEGORY_OBJECT_RESOURCES = "b3a2b22d-a595-4108-be0a-fc3c965f3d4a"
  WPD_COMMAND_OBJECT_RESOURCES_GET_SUPPORTED = PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 2_u32)
  WPD_COMMAND_OBJECT_RESOURCES_GET_ATTRIBUTES = PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 3_u32)
  WPD_COMMAND_OBJECT_RESOURCES_OPEN = PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 4_u32)
  WPD_COMMAND_OBJECT_RESOURCES_READ = PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 5_u32)
  WPD_COMMAND_OBJECT_RESOURCES_WRITE = PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 6_u32)
  WPD_COMMAND_OBJECT_RESOURCES_CLOSE = PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 7_u32)
  WPD_COMMAND_OBJECT_RESOURCES_DELETE = PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 8_u32)
  WPD_COMMAND_OBJECT_RESOURCES_CREATE_RESOURCE = PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 9_u32)
  WPD_COMMAND_OBJECT_RESOURCES_REVERT = PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 10_u32)
  WPD_COMMAND_OBJECT_RESOURCES_SEEK = PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 11_u32)
  WPD_COMMAND_OBJECT_RESOURCES_COMMIT = PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 12_u32)
  WPD_COMMAND_OBJECT_RESOURCES_SEEK_IN_UNITS = PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 13_u32)
  WPD_PROPERTY_OBJECT_RESOURCES_OBJECT_ID = PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 1001_u32)
  WPD_PROPERTY_OBJECT_RESOURCES_ACCESS_MODE = PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 1002_u32)
  WPD_PROPERTY_OBJECT_RESOURCES_RESOURCE_KEYS = PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 1003_u32)
  WPD_PROPERTY_OBJECT_RESOURCES_RESOURCE_ATTRIBUTES = PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 1004_u32)
  WPD_PROPERTY_OBJECT_RESOURCES_CONTEXT = PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 1005_u32)
  WPD_PROPERTY_OBJECT_RESOURCES_NUM_BYTES_TO_READ = PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 1006_u32)
  WPD_PROPERTY_OBJECT_RESOURCES_NUM_BYTES_READ = PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 1007_u32)
  WPD_PROPERTY_OBJECT_RESOURCES_NUM_BYTES_TO_WRITE = PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 1008_u32)
  WPD_PROPERTY_OBJECT_RESOURCES_NUM_BYTES_WRITTEN = PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 1009_u32)
  WPD_PROPERTY_OBJECT_RESOURCES_DATA = PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 1010_u32)
  WPD_PROPERTY_OBJECT_RESOURCES_OPTIMAL_TRANSFER_BUFFER_SIZE = PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 1011_u32)
  WPD_PROPERTY_OBJECT_RESOURCES_SEEK_OFFSET = PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 1012_u32)
  WPD_PROPERTY_OBJECT_RESOURCES_SEEK_ORIGIN_FLAG = PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 1013_u32)
  WPD_PROPERTY_OBJECT_RESOURCES_POSITION_FROM_START = PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 1014_u32)
  WPD_PROPERTY_OBJECT_RESOURCES_SUPPORTS_UNITS = PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 1015_u32)
  WPD_PROPERTY_OBJECT_RESOURCES_STREAM_UNITS = PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 1016_u32)
  WPD_OPTION_OBJECT_RESOURCES_SEEK_ON_READ_SUPPORTED = PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 5001_u32)
  WPD_OPTION_OBJECT_RESOURCES_SEEK_ON_WRITE_SUPPORTED = PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 5002_u32)
  WPD_OPTION_OBJECT_RESOURCES_NO_INPUT_BUFFER_ON_READ = PROPERTYKEY.new(LibC::GUID.new(0xb3a2b22d_u32, 0xa595_u16, 0x4108_u16, StaticArray[0xbe_u8, 0xa_u8, 0xfc_u8, 0x3c_u8, 0x96_u8, 0x5f_u8, 0x3d_u8, 0x4a_u8]), 5003_u32)
  WPD_CATEGORY_OBJECT_MANAGEMENT = "ef1e43dd-a9ed-4341-8bcc-186192aea089"
  WPD_COMMAND_OBJECT_MANAGEMENT_CREATE_OBJECT_WITH_PROPERTIES_ONLY = PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 2_u32)
  WPD_COMMAND_OBJECT_MANAGEMENT_CREATE_OBJECT_WITH_PROPERTIES_AND_DATA = PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 3_u32)
  WPD_COMMAND_OBJECT_MANAGEMENT_WRITE_OBJECT_DATA = PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 4_u32)
  WPD_COMMAND_OBJECT_MANAGEMENT_COMMIT_OBJECT = PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 5_u32)
  WPD_COMMAND_OBJECT_MANAGEMENT_REVERT_OBJECT = PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 6_u32)
  WPD_COMMAND_OBJECT_MANAGEMENT_DELETE_OBJECTS = PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 7_u32)
  WPD_COMMAND_OBJECT_MANAGEMENT_MOVE_OBJECTS = PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 8_u32)
  WPD_COMMAND_OBJECT_MANAGEMENT_COPY_OBJECTS = PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 9_u32)
  WPD_COMMAND_OBJECT_MANAGEMENT_UPDATE_OBJECT_WITH_PROPERTIES_AND_DATA = PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 10_u32)
  WPD_PROPERTY_OBJECT_MANAGEMENT_CREATION_PROPERTIES = PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 1001_u32)
  WPD_PROPERTY_OBJECT_MANAGEMENT_CONTEXT = PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 1002_u32)
  WPD_PROPERTY_OBJECT_MANAGEMENT_NUM_BYTES_TO_WRITE = PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 1003_u32)
  WPD_PROPERTY_OBJECT_MANAGEMENT_NUM_BYTES_WRITTEN = PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 1004_u32)
  WPD_PROPERTY_OBJECT_MANAGEMENT_DATA = PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 1005_u32)
  WPD_PROPERTY_OBJECT_MANAGEMENT_OBJECT_ID = PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 1006_u32)
  WPD_PROPERTY_OBJECT_MANAGEMENT_DELETE_OPTIONS = PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 1007_u32)
  WPD_PROPERTY_OBJECT_MANAGEMENT_OPTIMAL_TRANSFER_BUFFER_SIZE = PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 1008_u32)
  WPD_PROPERTY_OBJECT_MANAGEMENT_OBJECT_IDS = PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 1009_u32)
  WPD_PROPERTY_OBJECT_MANAGEMENT_DELETE_RESULTS = PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 1010_u32)
  WPD_PROPERTY_OBJECT_MANAGEMENT_DESTINATION_FOLDER_OBJECT_ID = PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 1011_u32)
  WPD_PROPERTY_OBJECT_MANAGEMENT_MOVE_RESULTS = PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 1012_u32)
  WPD_PROPERTY_OBJECT_MANAGEMENT_COPY_RESULTS = PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 1013_u32)
  WPD_PROPERTY_OBJECT_MANAGEMENT_UPDATE_PROPERTIES = PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 1014_u32)
  WPD_PROPERTY_OBJECT_MANAGEMENT_PROPERTY_KEYS = PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 1015_u32)
  WPD_PROPERTY_OBJECT_MANAGEMENT_OBJECT_FORMAT = PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 1016_u32)
  WPD_OPTION_OBJECT_MANAGEMENT_RECURSIVE_DELETE_SUPPORTED = PROPERTYKEY.new(LibC::GUID.new(0xef1e43dd_u32, 0xa9ed_u16, 0x4341_u16, StaticArray[0x8b_u8, 0xcc_u8, 0x18_u8, 0x61_u8, 0x92_u8, 0xae_u8, 0xa0_u8, 0x89_u8]), 5001_u32)
  WPD_CATEGORY_CAPABILITIES = "0cabec78-6b74-41c6-9216-2639d1fce356"
  WPD_COMMAND_CAPABILITIES_GET_SUPPORTED_COMMANDS = PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 2_u32)
  WPD_COMMAND_CAPABILITIES_GET_COMMAND_OPTIONS = PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 3_u32)
  WPD_COMMAND_CAPABILITIES_GET_SUPPORTED_FUNCTIONAL_CATEGORIES = PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 4_u32)
  WPD_COMMAND_CAPABILITIES_GET_FUNCTIONAL_OBJECTS = PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 5_u32)
  WPD_COMMAND_CAPABILITIES_GET_SUPPORTED_CONTENT_TYPES = PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 6_u32)
  WPD_COMMAND_CAPABILITIES_GET_SUPPORTED_FORMATS = PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 7_u32)
  WPD_COMMAND_CAPABILITIES_GET_SUPPORTED_FORMAT_PROPERTIES = PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 8_u32)
  WPD_COMMAND_CAPABILITIES_GET_FIXED_PROPERTY_ATTRIBUTES = PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 9_u32)
  WPD_COMMAND_CAPABILITIES_GET_SUPPORTED_EVENTS = PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 10_u32)
  WPD_COMMAND_CAPABILITIES_GET_EVENT_OPTIONS = PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 11_u32)
  WPD_PROPERTY_CAPABILITIES_SUPPORTED_COMMANDS = PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 1001_u32)
  WPD_PROPERTY_CAPABILITIES_COMMAND = PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 1002_u32)
  WPD_PROPERTY_CAPABILITIES_COMMAND_OPTIONS = PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 1003_u32)
  WPD_PROPERTY_CAPABILITIES_FUNCTIONAL_CATEGORIES = PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 1004_u32)
  WPD_PROPERTY_CAPABILITIES_FUNCTIONAL_CATEGORY = PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 1005_u32)
  WPD_PROPERTY_CAPABILITIES_FUNCTIONAL_OBJECTS = PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 1006_u32)
  WPD_PROPERTY_CAPABILITIES_CONTENT_TYPES = PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 1007_u32)
  WPD_PROPERTY_CAPABILITIES_CONTENT_TYPE = PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 1008_u32)
  WPD_PROPERTY_CAPABILITIES_FORMATS = PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 1009_u32)
  WPD_PROPERTY_CAPABILITIES_FORMAT = PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 1010_u32)
  WPD_PROPERTY_CAPABILITIES_PROPERTY_KEYS = PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 1011_u32)
  WPD_PROPERTY_CAPABILITIES_PROPERTY_ATTRIBUTES = PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 1012_u32)
  WPD_PROPERTY_CAPABILITIES_SUPPORTED_EVENTS = PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 1013_u32)
  WPD_PROPERTY_CAPABILITIES_EVENT = PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 1014_u32)
  WPD_PROPERTY_CAPABILITIES_EVENT_OPTIONS = PROPERTYKEY.new(LibC::GUID.new(0xcabec78_u32, 0x6b74_u16, 0x41c6_u16, StaticArray[0x92_u8, 0x16_u8, 0x26_u8, 0x39_u8, 0xd1_u8, 0xfc_u8, 0xe3_u8, 0x56_u8]), 1015_u32)
  WPD_CATEGORY_STORAGE = "d8f907a6-34cc-45fa-97fb-d007fa47ec94"
  WPD_COMMAND_STORAGE_FORMAT = PROPERTYKEY.new(LibC::GUID.new(0xd8f907a6_u32, 0x34cc_u16, 0x45fa_u16, StaticArray[0x97_u8, 0xfb_u8, 0xd0_u8, 0x7_u8, 0xfa_u8, 0x47_u8, 0xec_u8, 0x94_u8]), 2_u32)
  WPD_COMMAND_STORAGE_EJECT = PROPERTYKEY.new(LibC::GUID.new(0xd8f907a6_u32, 0x34cc_u16, 0x45fa_u16, StaticArray[0x97_u8, 0xfb_u8, 0xd0_u8, 0x7_u8, 0xfa_u8, 0x47_u8, 0xec_u8, 0x94_u8]), 4_u32)
  WPD_PROPERTY_STORAGE_OBJECT_ID = PROPERTYKEY.new(LibC::GUID.new(0xd8f907a6_u32, 0x34cc_u16, 0x45fa_u16, StaticArray[0x97_u8, 0xfb_u8, 0xd0_u8, 0x7_u8, 0xfa_u8, 0x47_u8, 0xec_u8, 0x94_u8]), 1001_u32)
  WPD_PROPERTY_STORAGE_DESTINATION_OBJECT_ID = PROPERTYKEY.new(LibC::GUID.new(0xd8f907a6_u32, 0x34cc_u16, 0x45fa_u16, StaticArray[0x97_u8, 0xfb_u8, 0xd0_u8, 0x7_u8, 0xfa_u8, 0x47_u8, 0xec_u8, 0x94_u8]), 1002_u32)
  WPD_CATEGORY_SMS = "afc25d66-fe0d-4114-9097-970c93e920d1"
  WPD_COMMAND_SMS_SEND = PROPERTYKEY.new(LibC::GUID.new(0xafc25d66_u32, 0xfe0d_u16, 0x4114_u16, StaticArray[0x90_u8, 0x97_u8, 0x97_u8, 0xc_u8, 0x93_u8, 0xe9_u8, 0x20_u8, 0xd1_u8]), 2_u32)
  WPD_PROPERTY_SMS_RECIPIENT = PROPERTYKEY.new(LibC::GUID.new(0xafc25d66_u32, 0xfe0d_u16, 0x4114_u16, StaticArray[0x90_u8, 0x97_u8, 0x97_u8, 0xc_u8, 0x93_u8, 0xe9_u8, 0x20_u8, 0xd1_u8]), 1001_u32)
  WPD_PROPERTY_SMS_MESSAGE_TYPE = PROPERTYKEY.new(LibC::GUID.new(0xafc25d66_u32, 0xfe0d_u16, 0x4114_u16, StaticArray[0x90_u8, 0x97_u8, 0x97_u8, 0xc_u8, 0x93_u8, 0xe9_u8, 0x20_u8, 0xd1_u8]), 1002_u32)
  WPD_PROPERTY_SMS_TEXT_MESSAGE = PROPERTYKEY.new(LibC::GUID.new(0xafc25d66_u32, 0xfe0d_u16, 0x4114_u16, StaticArray[0x90_u8, 0x97_u8, 0x97_u8, 0xc_u8, 0x93_u8, 0xe9_u8, 0x20_u8, 0xd1_u8]), 1003_u32)
  WPD_PROPERTY_SMS_BINARY_MESSAGE = PROPERTYKEY.new(LibC::GUID.new(0xafc25d66_u32, 0xfe0d_u16, 0x4114_u16, StaticArray[0x90_u8, 0x97_u8, 0x97_u8, 0xc_u8, 0x93_u8, 0xe9_u8, 0x20_u8, 0xd1_u8]), 1004_u32)
  WPD_OPTION_SMS_BINARY_MESSAGE_SUPPORTED = PROPERTYKEY.new(LibC::GUID.new(0xafc25d66_u32, 0xfe0d_u16, 0x4114_u16, StaticArray[0x90_u8, 0x97_u8, 0x97_u8, 0xc_u8, 0x93_u8, 0xe9_u8, 0x20_u8, 0xd1_u8]), 5001_u32)
  WPD_CATEGORY_STILL_IMAGE_CAPTURE = "4fcd6982-22a2-4b05-a48b-62d38bf27b32"
  WPD_COMMAND_STILL_IMAGE_CAPTURE_INITIATE = PROPERTYKEY.new(LibC::GUID.new(0x4fcd6982_u32, 0x22a2_u16, 0x4b05_u16, StaticArray[0xa4_u8, 0x8b_u8, 0x62_u8, 0xd3_u8, 0x8b_u8, 0xf2_u8, 0x7b_u8, 0x32_u8]), 2_u32)
  WPD_CATEGORY_MEDIA_CAPTURE = "59b433ba-fe44-4d8d-808c-6bcb9b0f15e8"
  WPD_COMMAND_MEDIA_CAPTURE_START = PROPERTYKEY.new(LibC::GUID.new(0x59b433ba_u32, 0xfe44_u16, 0x4d8d_u16, StaticArray[0x80_u8, 0x8c_u8, 0x6b_u8, 0xcb_u8, 0x9b_u8, 0xf_u8, 0x15_u8, 0xe8_u8]), 2_u32)
  WPD_COMMAND_MEDIA_CAPTURE_STOP = PROPERTYKEY.new(LibC::GUID.new(0x59b433ba_u32, 0xfe44_u16, 0x4d8d_u16, StaticArray[0x80_u8, 0x8c_u8, 0x6b_u8, 0xcb_u8, 0x9b_u8, 0xf_u8, 0x15_u8, 0xe8_u8]), 3_u32)
  WPD_COMMAND_MEDIA_CAPTURE_PAUSE = PROPERTYKEY.new(LibC::GUID.new(0x59b433ba_u32, 0xfe44_u16, 0x4d8d_u16, StaticArray[0x80_u8, 0x8c_u8, 0x6b_u8, 0xcb_u8, 0x9b_u8, 0xf_u8, 0x15_u8, 0xe8_u8]), 4_u32)
  WPD_CATEGORY_DEVICE_HINTS = "0d5fb92b-cb46-4c4f-8343-0bc3d3f17c84"
  WPD_COMMAND_DEVICE_HINTS_GET_CONTENT_LOCATION = PROPERTYKEY.new(LibC::GUID.new(0xd5fb92b_u32, 0xcb46_u16, 0x4c4f_u16, StaticArray[0x83_u8, 0x43_u8, 0xb_u8, 0xc3_u8, 0xd3_u8, 0xf1_u8, 0x7c_u8, 0x84_u8]), 2_u32)
  WPD_PROPERTY_DEVICE_HINTS_CONTENT_TYPE = PROPERTYKEY.new(LibC::GUID.new(0xd5fb92b_u32, 0xcb46_u16, 0x4c4f_u16, StaticArray[0x83_u8, 0x43_u8, 0xb_u8, 0xc3_u8, 0xd3_u8, 0xf1_u8, 0x7c_u8, 0x84_u8]), 1001_u32)
  WPD_PROPERTY_DEVICE_HINTS_CONTENT_LOCATIONS = PROPERTYKEY.new(LibC::GUID.new(0xd5fb92b_u32, 0xcb46_u16, 0x4c4f_u16, StaticArray[0x83_u8, 0x43_u8, 0xb_u8, 0xc3_u8, 0xd3_u8, 0xf1_u8, 0x7c_u8, 0x84_u8]), 1002_u32)
  WPD_CLASS_EXTENSION_V1 = "33fb0d11-64a3-4fac-b4c7-3dfeaa99b051"
  WPD_COMMAND_CLASS_EXTENSION_WRITE_DEVICE_INFORMATION = PROPERTYKEY.new(LibC::GUID.new(0x33fb0d11_u32, 0x64a3_u16, 0x4fac_u16, StaticArray[0xb4_u8, 0xc7_u8, 0x3d_u8, 0xfe_u8, 0xaa_u8, 0x99_u8, 0xb0_u8, 0x51_u8]), 2_u32)
  WPD_PROPERTY_CLASS_EXTENSION_DEVICE_INFORMATION_VALUES = PROPERTYKEY.new(LibC::GUID.new(0x33fb0d11_u32, 0x64a3_u16, 0x4fac_u16, StaticArray[0xb4_u8, 0xc7_u8, 0x3d_u8, 0xfe_u8, 0xaa_u8, 0x99_u8, 0xb0_u8, 0x51_u8]), 1001_u32)
  WPD_PROPERTY_CLASS_EXTENSION_DEVICE_INFORMATION_WRITE_RESULTS = PROPERTYKEY.new(LibC::GUID.new(0x33fb0d11_u32, 0x64a3_u16, 0x4fac_u16, StaticArray[0xb4_u8, 0xc7_u8, 0x3d_u8, 0xfe_u8, 0xaa_u8, 0x99_u8, 0xb0_u8, 0x51_u8]), 1002_u32)
  WPD_CLASS_EXTENSION_V2 = "7f0779b5-fa2b-4766-9cb2-f73ba30b6758"
  WPD_COMMAND_CLASS_EXTENSION_REGISTER_SERVICE_INTERFACES = PROPERTYKEY.new(LibC::GUID.new(0x7f0779b5_u32, 0xfa2b_u16, 0x4766_u16, StaticArray[0x9c_u8, 0xb2_u8, 0xf7_u8, 0x3b_u8, 0xa3_u8, 0xb_u8, 0x67_u8, 0x58_u8]), 2_u32)
  WPD_COMMAND_CLASS_EXTENSION_UNREGISTER_SERVICE_INTERFACES = PROPERTYKEY.new(LibC::GUID.new(0x7f0779b5_u32, 0xfa2b_u16, 0x4766_u16, StaticArray[0x9c_u8, 0xb2_u8, 0xf7_u8, 0x3b_u8, 0xa3_u8, 0xb_u8, 0x67_u8, 0x58_u8]), 3_u32)
  WPD_PROPERTY_CLASS_EXTENSION_SERVICE_OBJECT_ID = PROPERTYKEY.new(LibC::GUID.new(0x7f0779b5_u32, 0xfa2b_u16, 0x4766_u16, StaticArray[0x9c_u8, 0xb2_u8, 0xf7_u8, 0x3b_u8, 0xa3_u8, 0xb_u8, 0x67_u8, 0x58_u8]), 1001_u32)
  WPD_PROPERTY_CLASS_EXTENSION_SERVICE_INTERFACES = PROPERTYKEY.new(LibC::GUID.new(0x7f0779b5_u32, 0xfa2b_u16, 0x4766_u16, StaticArray[0x9c_u8, 0xb2_u8, 0xf7_u8, 0x3b_u8, 0xa3_u8, 0xb_u8, 0x67_u8, 0x58_u8]), 1002_u32)
  WPD_PROPERTY_CLASS_EXTENSION_SERVICE_REGISTRATION_RESULTS = PROPERTYKEY.new(LibC::GUID.new(0x7f0779b5_u32, 0xfa2b_u16, 0x4766_u16, StaticArray[0x9c_u8, 0xb2_u8, 0xf7_u8, 0x3b_u8, 0xa3_u8, 0xb_u8, 0x67_u8, 0x58_u8]), 1003_u32)
  WPD_CATEGORY_NETWORK_CONFIGURATION = "78f9c6fc-79b8-473c-9060-6bd23dd072c4"
  WPD_COMMAND_GENERATE_KEYPAIR = PROPERTYKEY.new(LibC::GUID.new(0x78f9c6fc_u32, 0x79b8_u16, 0x473c_u16, StaticArray[0x90_u8, 0x60_u8, 0x6b_u8, 0xd2_u8, 0x3d_u8, 0xd0_u8, 0x72_u8, 0xc4_u8]), 2_u32)
  WPD_COMMAND_COMMIT_KEYPAIR = PROPERTYKEY.new(LibC::GUID.new(0x78f9c6fc_u32, 0x79b8_u16, 0x473c_u16, StaticArray[0x90_u8, 0x60_u8, 0x6b_u8, 0xd2_u8, 0x3d_u8, 0xd0_u8, 0x72_u8, 0xc4_u8]), 3_u32)
  WPD_COMMAND_PROCESS_WIRELESS_PROFILE = PROPERTYKEY.new(LibC::GUID.new(0x78f9c6fc_u32, 0x79b8_u16, 0x473c_u16, StaticArray[0x90_u8, 0x60_u8, 0x6b_u8, 0xd2_u8, 0x3d_u8, 0xd0_u8, 0x72_u8, 0xc4_u8]), 4_u32)
  WPD_PROPERTY_PUBLIC_KEY = PROPERTYKEY.new(LibC::GUID.new(0x78f9c6fc_u32, 0x79b8_u16, 0x473c_u16, StaticArray[0x90_u8, 0x60_u8, 0x6b_u8, 0xd2_u8, 0x3d_u8, 0xd0_u8, 0x72_u8, 0xc4_u8]), 1001_u32)
  WPD_CATEGORY_SERVICE_COMMON = "322f071d-36ef-477f-b4b5-6f52d734baee"
  WPD_COMMAND_SERVICE_COMMON_GET_SERVICE_OBJECT_ID = PROPERTYKEY.new(LibC::GUID.new(0x322f071d_u32, 0x36ef_u16, 0x477f_u16, StaticArray[0xb4_u8, 0xb5_u8, 0x6f_u8, 0x52_u8, 0xd7_u8, 0x34_u8, 0xba_u8, 0xee_u8]), 2_u32)
  WPD_PROPERTY_SERVICE_OBJECT_ID = PROPERTYKEY.new(LibC::GUID.new(0x322f071d_u32, 0x36ef_u16, 0x477f_u16, StaticArray[0xb4_u8, 0xb5_u8, 0x6f_u8, 0x52_u8, 0xd7_u8, 0x34_u8, 0xba_u8, 0xee_u8]), 1001_u32)
  WPD_CATEGORY_SERVICE_CAPABILITIES = "24457e74-2e9f-44f9-8c57-1d1bcb170b89"
  WPD_COMMAND_SERVICE_CAPABILITIES_GET_SUPPORTED_METHODS = PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 2_u32)
  WPD_COMMAND_SERVICE_CAPABILITIES_GET_SUPPORTED_METHODS_BY_FORMAT = PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 3_u32)
  WPD_COMMAND_SERVICE_CAPABILITIES_GET_METHOD_ATTRIBUTES = PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 4_u32)
  WPD_COMMAND_SERVICE_CAPABILITIES_GET_METHOD_PARAMETER_ATTRIBUTES = PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 5_u32)
  WPD_COMMAND_SERVICE_CAPABILITIES_GET_SUPPORTED_FORMATS = PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 6_u32)
  WPD_COMMAND_SERVICE_CAPABILITIES_GET_FORMAT_ATTRIBUTES = PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 7_u32)
  WPD_COMMAND_SERVICE_CAPABILITIES_GET_SUPPORTED_FORMAT_PROPERTIES = PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 8_u32)
  WPD_COMMAND_SERVICE_CAPABILITIES_GET_FORMAT_PROPERTY_ATTRIBUTES = PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 9_u32)
  WPD_COMMAND_SERVICE_CAPABILITIES_GET_SUPPORTED_EVENTS = PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 10_u32)
  WPD_COMMAND_SERVICE_CAPABILITIES_GET_EVENT_ATTRIBUTES = PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 11_u32)
  WPD_COMMAND_SERVICE_CAPABILITIES_GET_EVENT_PARAMETER_ATTRIBUTES = PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 12_u32)
  WPD_COMMAND_SERVICE_CAPABILITIES_GET_INHERITED_SERVICES = PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 13_u32)
  WPD_COMMAND_SERVICE_CAPABILITIES_GET_FORMAT_RENDERING_PROFILES = PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 14_u32)
  WPD_COMMAND_SERVICE_CAPABILITIES_GET_SUPPORTED_COMMANDS = PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 15_u32)
  WPD_COMMAND_SERVICE_CAPABILITIES_GET_COMMAND_OPTIONS = PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 16_u32)
  WPD_PROPERTY_SERVICE_CAPABILITIES_SUPPORTED_METHODS = PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 1001_u32)
  WPD_PROPERTY_SERVICE_CAPABILITIES_FORMAT = PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 1002_u32)
  WPD_PROPERTY_SERVICE_CAPABILITIES_METHOD = PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 1003_u32)
  WPD_PROPERTY_SERVICE_CAPABILITIES_METHOD_ATTRIBUTES = PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 1004_u32)
  WPD_PROPERTY_SERVICE_CAPABILITIES_PARAMETER = PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 1005_u32)
  WPD_PROPERTY_SERVICE_CAPABILITIES_PARAMETER_ATTRIBUTES = PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 1006_u32)
  WPD_PROPERTY_SERVICE_CAPABILITIES_FORMATS = PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 1007_u32)
  WPD_PROPERTY_SERVICE_CAPABILITIES_FORMAT_ATTRIBUTES = PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 1008_u32)
  WPD_PROPERTY_SERVICE_CAPABILITIES_PROPERTY_KEYS = PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 1009_u32)
  WPD_PROPERTY_SERVICE_CAPABILITIES_PROPERTY_ATTRIBUTES = PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 1010_u32)
  WPD_PROPERTY_SERVICE_CAPABILITIES_SUPPORTED_EVENTS = PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 1011_u32)
  WPD_PROPERTY_SERVICE_CAPABILITIES_EVENT = PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 1012_u32)
  WPD_PROPERTY_SERVICE_CAPABILITIES_EVENT_ATTRIBUTES = PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 1013_u32)
  WPD_PROPERTY_SERVICE_CAPABILITIES_INHERITANCE_TYPE = PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 1014_u32)
  WPD_PROPERTY_SERVICE_CAPABILITIES_INHERITED_SERVICES = PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 1015_u32)
  WPD_PROPERTY_SERVICE_CAPABILITIES_RENDERING_PROFILES = PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 1016_u32)
  WPD_PROPERTY_SERVICE_CAPABILITIES_SUPPORTED_COMMANDS = PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 1017_u32)
  WPD_PROPERTY_SERVICE_CAPABILITIES_COMMAND = PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 1018_u32)
  WPD_PROPERTY_SERVICE_CAPABILITIES_COMMAND_OPTIONS = PROPERTYKEY.new(LibC::GUID.new(0x24457e74_u32, 0x2e9f_u16, 0x44f9_u16, StaticArray[0x8c_u8, 0x57_u8, 0x1d_u8, 0x1b_u8, 0xcb_u8, 0x17_u8, 0xb_u8, 0x89_u8]), 1019_u32)
  WPD_CATEGORY_SERVICE_METHODS = "2d521ca8-c1b0-4268-a342-cf19321569bc"
  WPD_COMMAND_SERVICE_METHODS_START_INVOKE = PROPERTYKEY.new(LibC::GUID.new(0x2d521ca8_u32, 0xc1b0_u16, 0x4268_u16, StaticArray[0xa3_u8, 0x42_u8, 0xcf_u8, 0x19_u8, 0x32_u8, 0x15_u8, 0x69_u8, 0xbc_u8]), 2_u32)
  WPD_COMMAND_SERVICE_METHODS_CANCEL_INVOKE = PROPERTYKEY.new(LibC::GUID.new(0x2d521ca8_u32, 0xc1b0_u16, 0x4268_u16, StaticArray[0xa3_u8, 0x42_u8, 0xcf_u8, 0x19_u8, 0x32_u8, 0x15_u8, 0x69_u8, 0xbc_u8]), 3_u32)
  WPD_COMMAND_SERVICE_METHODS_END_INVOKE = PROPERTYKEY.new(LibC::GUID.new(0x2d521ca8_u32, 0xc1b0_u16, 0x4268_u16, StaticArray[0xa3_u8, 0x42_u8, 0xcf_u8, 0x19_u8, 0x32_u8, 0x15_u8, 0x69_u8, 0xbc_u8]), 4_u32)
  WPD_PROPERTY_SERVICE_METHOD = PROPERTYKEY.new(LibC::GUID.new(0x2d521ca8_u32, 0xc1b0_u16, 0x4268_u16, StaticArray[0xa3_u8, 0x42_u8, 0xcf_u8, 0x19_u8, 0x32_u8, 0x15_u8, 0x69_u8, 0xbc_u8]), 1001_u32)
  WPD_PROPERTY_SERVICE_METHOD_PARAMETER_VALUES = PROPERTYKEY.new(LibC::GUID.new(0x2d521ca8_u32, 0xc1b0_u16, 0x4268_u16, StaticArray[0xa3_u8, 0x42_u8, 0xcf_u8, 0x19_u8, 0x32_u8, 0x15_u8, 0x69_u8, 0xbc_u8]), 1002_u32)
  WPD_PROPERTY_SERVICE_METHOD_RESULT_VALUES = PROPERTYKEY.new(LibC::GUID.new(0x2d521ca8_u32, 0xc1b0_u16, 0x4268_u16, StaticArray[0xa3_u8, 0x42_u8, 0xcf_u8, 0x19_u8, 0x32_u8, 0x15_u8, 0x69_u8, 0xbc_u8]), 1003_u32)
  WPD_PROPERTY_SERVICE_METHOD_CONTEXT = PROPERTYKEY.new(LibC::GUID.new(0x2d521ca8_u32, 0xc1b0_u16, 0x4268_u16, StaticArray[0xa3_u8, 0x42_u8, 0xcf_u8, 0x19_u8, 0x32_u8, 0x15_u8, 0x69_u8, 0xbc_u8]), 1004_u32)
  WPD_PROPERTY_SERVICE_METHOD_HRESULT = PROPERTYKEY.new(LibC::GUID.new(0x2d521ca8_u32, 0xc1b0_u16, 0x4268_u16, StaticArray[0xa3_u8, 0x42_u8, 0xcf_u8, 0x19_u8, 0x32_u8, 0x15_u8, 0x69_u8, 0xbc_u8]), 1005_u32)
  WPD_RESOURCE_DEFAULT = PROPERTYKEY.new(LibC::GUID.new(0xe81e79be_u32, 0x34f0_u16, 0x41bf_u16, StaticArray[0xb5_u8, 0x3f_u8, 0xf1_u8, 0xa0_u8, 0x6a_u8, 0xe8_u8, 0x78_u8, 0x42_u8]), 0_u32)
  WPD_RESOURCE_CONTACT_PHOTO = PROPERTYKEY.new(LibC::GUID.new(0x2c4d6803_u32, 0x80ea_u16, 0x4580_u16, StaticArray[0xaf_u8, 0x9a_u8, 0x5b_u8, 0xe1_u8, 0xa2_u8, 0x3e_u8, 0xdd_u8, 0xcb_u8]), 0_u32)
  WPD_RESOURCE_THUMBNAIL = PROPERTYKEY.new(LibC::GUID.new(0xc7c407ba_u32, 0x98fa_u16, 0x46b5_u16, StaticArray[0x99_u8, 0x60_u8, 0x23_u8, 0xfe_u8, 0xc1_u8, 0x24_u8, 0xcf_u8, 0xde_u8]), 0_u32)
  WPD_RESOURCE_ICON = PROPERTYKEY.new(LibC::GUID.new(0xf195fed8_u32, 0xaa28_u16, 0x4ee3_u16, StaticArray[0xb1_u8, 0x53_u8, 0xe1_u8, 0x82_u8, 0xdd_u8, 0x5e_u8, 0xdc_u8, 0x39_u8]), 0_u32)
  WPD_RESOURCE_AUDIO_CLIP = PROPERTYKEY.new(LibC::GUID.new(0x3bc13982_u32, 0x85b1_u16, 0x48e0_u16, StaticArray[0x95_u8, 0xa6_u8, 0x8d_u8, 0x3a_u8, 0xd0_u8, 0x6b_u8, 0xe1_u8, 0x17_u8]), 0_u32)
  WPD_RESOURCE_ALBUM_ART = PROPERTYKEY.new(LibC::GUID.new(0xf02aa354_u32, 0x2300_u16, 0x4e2d_u16, StaticArray[0xa1_u8, 0xb9_u8, 0x3b_u8, 0x67_u8, 0x30_u8, 0xf7_u8, 0xfa_u8, 0x21_u8]), 0_u32)
  WPD_RESOURCE_GENERIC = PROPERTYKEY.new(LibC::GUID.new(0xb9b9f515_u32, 0xba70_u16, 0x4647_u16, StaticArray[0x94_u8, 0xdc_u8, 0xfa_u8, 0x49_u8, 0x25_u8, 0xe9_u8, 0x5a_u8, 0x7_u8]), 0_u32)
  WPD_RESOURCE_VIDEO_CLIP = PROPERTYKEY.new(LibC::GUID.new(0xb566ee42_u32, 0x6368_u16, 0x4290_u16, StaticArray[0x86_u8, 0x62_u8, 0x70_u8, 0x18_u8, 0x2f_u8, 0xb7_u8, 0x9f_u8, 0x20_u8]), 0_u32)
  WPD_RESOURCE_BRANDING_ART = PROPERTYKEY.new(LibC::GUID.new(0xb633b1ae_u32, 0x6caf_u16, 0x4a87_u16, StaticArray[0x95_u8, 0x89_u8, 0x22_u8, 0xde_u8, 0xd6_u8, 0xdd_u8, 0x58_u8, 0x99_u8]), 0_u32)
  WPD_OBJECT_FORMAT_PROPERTIES_ONLY = "30010000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_UNSPECIFIED = "30000000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_SCRIPT = "30020000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_EXECUTABLE = "30030000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_TEXT = "30040000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_HTML = "30050000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_DPOF = "30060000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_AIFF = "30070000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_WAVE = "30080000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_MP3 = "30090000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_AVI = "300a0000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_MPEG = "300b0000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_ASF = "300c0000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_EXIF = "38010000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_TIFFEP = "38020000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_FLASHPIX = "38030000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_BMP = "38040000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_CIFF = "38050000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_GIF = "38070000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_JFIF = "38080000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_PCD = "38090000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_PICT = "380a0000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_PNG = "380b0000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_TIFF = "380d0000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_TIFFIT = "380e0000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_JP2 = "380f0000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_JPX = "38100000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_WBMP = "b8030000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_JPEGXR = "b8040000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_WINDOWSIMAGEFORMAT = "b8810000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_WMA = "b9010000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_WMV = "b9810000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_WPLPLAYLIST = "ba100000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_M3UPLAYLIST = "ba110000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_MPLPLAYLIST = "ba120000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_ASXPLAYLIST = "ba130000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_PLSPLAYLIST = "ba140000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_ABSTRACT_CONTACT_GROUP = "ba060000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_ABSTRACT_MEDIA_CAST = "ba0b0000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_VCALENDAR1 = "be020000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_ICALENDAR = "be030000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_ABSTRACT_CONTACT = "bb810000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_VCARD2 = "bb820000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_VCARD3 = "bb830000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_XML = "ba820000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_AAC = "b9030000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_AUDIBLE = "b9040000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_FLAC = "b9060000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_QCELP = "b9070000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_AMR = "b9080000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_OGG = "b9020000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_MP4 = "b9820000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_MP2 = "b9830000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_MICROSOFT_WORD = "ba830000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_MHT_COMPILED_HTML = "ba840000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_MICROSOFT_EXCEL = "ba850000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_MICROSOFT_POWERPOINT = "ba860000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_3GP = "b9840000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_3G2 = "b9850000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_AVCHD = "b9860000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_ATSCTS = "b9870000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_DVBTS = "b9880000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_FORMAT_MKV = "b9900000-ae6c-4804-98ba-c57b46965fe7"
  WPD_OBJECT_ID = PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 2_u32)
  WPD_OBJECT_PARENT_ID = PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 3_u32)
  WPD_OBJECT_NAME = PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 4_u32)
  WPD_OBJECT_PERSISTENT_UNIQUE_ID = PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 5_u32)
  WPD_OBJECT_FORMAT = PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 6_u32)
  WPD_OBJECT_ISHIDDEN = PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 9_u32)
  WPD_OBJECT_ISSYSTEM = PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 10_u32)
  WPD_OBJECT_SIZE = PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 11_u32)
  WPD_OBJECT_ORIGINAL_FILE_NAME = PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 12_u32)
  WPD_OBJECT_NON_CONSUMABLE = PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 13_u32)
  WPD_OBJECT_KEYWORDS = PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 15_u32)
  WPD_OBJECT_SYNC_ID = PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 16_u32)
  WPD_OBJECT_IS_DRM_PROTECTED = PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 17_u32)
  WPD_OBJECT_DATE_CREATED = PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 18_u32)
  WPD_OBJECT_DATE_MODIFIED = PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 19_u32)
  WPD_OBJECT_DATE_AUTHORED = PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 20_u32)
  WPD_OBJECT_BACK_REFERENCES = PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 21_u32)
  WPD_OBJECT_CAN_DELETE = PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 26_u32)
  WPD_OBJECT_LANGUAGE_LOCALE = PROPERTYKEY.new(LibC::GUID.new(0xef6b490d_u32, 0x5cd8_u16, 0x437a_u16, StaticArray[0xaf_u8, 0xfc_u8, 0xda_u8, 0x8b_u8, 0x60_u8, 0xee_u8, 0x4a_u8, 0x3c_u8]), 27_u32)
  WPD_FOLDER_OBJECT_PROPERTIES_V1 = "7e9a7abf-e568-4b34-aa2f-13bb12ab177d"
  WPD_FOLDER_CONTENT_TYPES_ALLOWED = PROPERTYKEY.new(LibC::GUID.new(0x7e9a7abf_u32, 0xe568_u16, 0x4b34_u16, StaticArray[0xaa_u8, 0x2f_u8, 0x13_u8, 0xbb_u8, 0x12_u8, 0xab_u8, 0x17_u8, 0x7d_u8]), 2_u32)
  WPD_IMAGE_OBJECT_PROPERTIES_V1 = "63d64908-9fa1-479f-85ba-9952216447db"
  WPD_IMAGE_BITDEPTH = PROPERTYKEY.new(LibC::GUID.new(0x63d64908_u32, 0x9fa1_u16, 0x479f_u16, StaticArray[0x85_u8, 0xba_u8, 0x99_u8, 0x52_u8, 0x21_u8, 0x64_u8, 0x47_u8, 0xdb_u8]), 3_u32)
  WPD_IMAGE_CROPPED_STATUS = PROPERTYKEY.new(LibC::GUID.new(0x63d64908_u32, 0x9fa1_u16, 0x479f_u16, StaticArray[0x85_u8, 0xba_u8, 0x99_u8, 0x52_u8, 0x21_u8, 0x64_u8, 0x47_u8, 0xdb_u8]), 4_u32)
  WPD_IMAGE_COLOR_CORRECTED_STATUS = PROPERTYKEY.new(LibC::GUID.new(0x63d64908_u32, 0x9fa1_u16, 0x479f_u16, StaticArray[0x85_u8, 0xba_u8, 0x99_u8, 0x52_u8, 0x21_u8, 0x64_u8, 0x47_u8, 0xdb_u8]), 5_u32)
  WPD_IMAGE_FNUMBER = PROPERTYKEY.new(LibC::GUID.new(0x63d64908_u32, 0x9fa1_u16, 0x479f_u16, StaticArray[0x85_u8, 0xba_u8, 0x99_u8, 0x52_u8, 0x21_u8, 0x64_u8, 0x47_u8, 0xdb_u8]), 6_u32)
  WPD_IMAGE_EXPOSURE_TIME = PROPERTYKEY.new(LibC::GUID.new(0x63d64908_u32, 0x9fa1_u16, 0x479f_u16, StaticArray[0x85_u8, 0xba_u8, 0x99_u8, 0x52_u8, 0x21_u8, 0x64_u8, 0x47_u8, 0xdb_u8]), 7_u32)
  WPD_IMAGE_EXPOSURE_INDEX = PROPERTYKEY.new(LibC::GUID.new(0x63d64908_u32, 0x9fa1_u16, 0x479f_u16, StaticArray[0x85_u8, 0xba_u8, 0x99_u8, 0x52_u8, 0x21_u8, 0x64_u8, 0x47_u8, 0xdb_u8]), 8_u32)
  WPD_IMAGE_HORIZONTAL_RESOLUTION = PROPERTYKEY.new(LibC::GUID.new(0x63d64908_u32, 0x9fa1_u16, 0x479f_u16, StaticArray[0x85_u8, 0xba_u8, 0x99_u8, 0x52_u8, 0x21_u8, 0x64_u8, 0x47_u8, 0xdb_u8]), 9_u32)
  WPD_IMAGE_VERTICAL_RESOLUTION = PROPERTYKEY.new(LibC::GUID.new(0x63d64908_u32, 0x9fa1_u16, 0x479f_u16, StaticArray[0x85_u8, 0xba_u8, 0x99_u8, 0x52_u8, 0x21_u8, 0x64_u8, 0x47_u8, 0xdb_u8]), 10_u32)
  WPD_DOCUMENT_OBJECT_PROPERTIES_V1 = "0b110203-eb95-4f02-93e0-97c631493ad5"
  WPD_MEDIA_PROPERTIES_V1 = "2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8"
  WPD_MEDIA_TOTAL_BITRATE = PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 2_u32)
  WPD_MEDIA_BITRATE_TYPE = PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 3_u32)
  WPD_MEDIA_COPYRIGHT = PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 4_u32)
  WPD_MEDIA_SUBSCRIPTION_CONTENT_ID = PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 5_u32)
  WPD_MEDIA_USE_COUNT = PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 6_u32)
  WPD_MEDIA_SKIP_COUNT = PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 7_u32)
  WPD_MEDIA_LAST_ACCESSED_TIME = PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 8_u32)
  WPD_MEDIA_PARENTAL_RATING = PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 9_u32)
  WPD_MEDIA_META_GENRE = PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 10_u32)
  WPD_MEDIA_COMPOSER = PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 11_u32)
  WPD_MEDIA_EFFECTIVE_RATING = PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 12_u32)
  WPD_MEDIA_SUB_TITLE = PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 13_u32)
  WPD_MEDIA_RELEASE_DATE = PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 14_u32)
  WPD_MEDIA_SAMPLE_RATE = PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 15_u32)
  WPD_MEDIA_STAR_RATING = PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 16_u32)
  WPD_MEDIA_USER_EFFECTIVE_RATING = PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 17_u32)
  WPD_MEDIA_TITLE = PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 18_u32)
  WPD_MEDIA_DURATION = PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 19_u32)
  WPD_MEDIA_BUY_NOW = PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 20_u32)
  WPD_MEDIA_ENCODING_PROFILE = PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 21_u32)
  WPD_MEDIA_WIDTH = PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 22_u32)
  WPD_MEDIA_HEIGHT = PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 23_u32)
  WPD_MEDIA_ARTIST = PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 24_u32)
  WPD_MEDIA_ALBUM_ARTIST = PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 25_u32)
  WPD_MEDIA_OWNER = PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 26_u32)
  WPD_MEDIA_MANAGING_EDITOR = PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 27_u32)
  WPD_MEDIA_WEBMASTER = PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 28_u32)
  WPD_MEDIA_SOURCE_URL = PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 29_u32)
  WPD_MEDIA_DESTINATION_URL = PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 30_u32)
  WPD_MEDIA_DESCRIPTION = PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 31_u32)
  WPD_MEDIA_GENRE = PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 32_u32)
  WPD_MEDIA_TIME_BOOKMARK = PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 33_u32)
  WPD_MEDIA_OBJECT_BOOKMARK = PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 34_u32)
  WPD_MEDIA_LAST_BUILD_DATE = PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 35_u32)
  WPD_MEDIA_BYTE_BOOKMARK = PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 36_u32)
  WPD_MEDIA_TIME_TO_LIVE = PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 37_u32)
  WPD_MEDIA_GUID = PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 38_u32)
  WPD_MEDIA_SUB_DESCRIPTION = PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 39_u32)
  WPD_MEDIA_AUDIO_ENCODING_PROFILE = PROPERTYKEY.new(LibC::GUID.new(0x2ed8ba05_u32, 0xad3_u16, 0x42dc_u16, StaticArray[0xb0_u8, 0xd0_u8, 0xbc_u8, 0x95_u8, 0xac_u8, 0x39_u8, 0x6a_u8, 0xc8_u8]), 49_u32)
  WPD_CONTACT_OBJECT_PROPERTIES_V1 = "fbd4fdab-987d-4777-b3f9-726185a9312b"
  WPD_CONTACT_DISPLAY_NAME = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 2_u32)
  WPD_CONTACT_FIRST_NAME = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 3_u32)
  WPD_CONTACT_MIDDLE_NAMES = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 4_u32)
  WPD_CONTACT_LAST_NAME = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 5_u32)
  WPD_CONTACT_PREFIX = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 6_u32)
  WPD_CONTACT_SUFFIX = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 7_u32)
  WPD_CONTACT_PHONETIC_FIRST_NAME = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 8_u32)
  WPD_CONTACT_PHONETIC_LAST_NAME = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 9_u32)
  WPD_CONTACT_PERSONAL_FULL_POSTAL_ADDRESS = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 10_u32)
  WPD_CONTACT_PERSONAL_POSTAL_ADDRESS_LINE1 = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 11_u32)
  WPD_CONTACT_PERSONAL_POSTAL_ADDRESS_LINE2 = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 12_u32)
  WPD_CONTACT_PERSONAL_POSTAL_ADDRESS_CITY = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 13_u32)
  WPD_CONTACT_PERSONAL_POSTAL_ADDRESS_REGION = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 14_u32)
  WPD_CONTACT_PERSONAL_POSTAL_ADDRESS_POSTAL_CODE = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 15_u32)
  WPD_CONTACT_PERSONAL_POSTAL_ADDRESS_COUNTRY = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 16_u32)
  WPD_CONTACT_BUSINESS_FULL_POSTAL_ADDRESS = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 17_u32)
  WPD_CONTACT_BUSINESS_POSTAL_ADDRESS_LINE1 = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 18_u32)
  WPD_CONTACT_BUSINESS_POSTAL_ADDRESS_LINE2 = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 19_u32)
  WPD_CONTACT_BUSINESS_POSTAL_ADDRESS_CITY = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 20_u32)
  WPD_CONTACT_BUSINESS_POSTAL_ADDRESS_REGION = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 21_u32)
  WPD_CONTACT_BUSINESS_POSTAL_ADDRESS_POSTAL_CODE = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 22_u32)
  WPD_CONTACT_BUSINESS_POSTAL_ADDRESS_COUNTRY = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 23_u32)
  WPD_CONTACT_OTHER_FULL_POSTAL_ADDRESS = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 24_u32)
  WPD_CONTACT_OTHER_POSTAL_ADDRESS_LINE1 = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 25_u32)
  WPD_CONTACT_OTHER_POSTAL_ADDRESS_LINE2 = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 26_u32)
  WPD_CONTACT_OTHER_POSTAL_ADDRESS_CITY = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 27_u32)
  WPD_CONTACT_OTHER_POSTAL_ADDRESS_REGION = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 28_u32)
  WPD_CONTACT_OTHER_POSTAL_ADDRESS_POSTAL_CODE = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 29_u32)
  WPD_CONTACT_OTHER_POSTAL_ADDRESS_POSTAL_COUNTRY = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 30_u32)
  WPD_CONTACT_PRIMARY_EMAIL_ADDRESS = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 31_u32)
  WPD_CONTACT_PERSONAL_EMAIL = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 32_u32)
  WPD_CONTACT_PERSONAL_EMAIL2 = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 33_u32)
  WPD_CONTACT_BUSINESS_EMAIL = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 34_u32)
  WPD_CONTACT_BUSINESS_EMAIL2 = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 35_u32)
  WPD_CONTACT_OTHER_EMAILS = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 36_u32)
  WPD_CONTACT_PRIMARY_PHONE = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 37_u32)
  WPD_CONTACT_PERSONAL_PHONE = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 38_u32)
  WPD_CONTACT_PERSONAL_PHONE2 = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 39_u32)
  WPD_CONTACT_BUSINESS_PHONE = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 40_u32)
  WPD_CONTACT_BUSINESS_PHONE2 = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 41_u32)
  WPD_CONTACT_MOBILE_PHONE = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 42_u32)
  WPD_CONTACT_MOBILE_PHONE2 = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 43_u32)
  WPD_CONTACT_PERSONAL_FAX = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 44_u32)
  WPD_CONTACT_BUSINESS_FAX = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 45_u32)
  WPD_CONTACT_PAGER = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 46_u32)
  WPD_CONTACT_OTHER_PHONES = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 47_u32)
  WPD_CONTACT_PRIMARY_WEB_ADDRESS = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 48_u32)
  WPD_CONTACT_PERSONAL_WEB_ADDRESS = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 49_u32)
  WPD_CONTACT_BUSINESS_WEB_ADDRESS = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 50_u32)
  WPD_CONTACT_INSTANT_MESSENGER = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 51_u32)
  WPD_CONTACT_INSTANT_MESSENGER2 = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 52_u32)
  WPD_CONTACT_INSTANT_MESSENGER3 = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 53_u32)
  WPD_CONTACT_COMPANY_NAME = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 54_u32)
  WPD_CONTACT_PHONETIC_COMPANY_NAME = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 55_u32)
  WPD_CONTACT_ROLE = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 56_u32)
  WPD_CONTACT_BIRTHDATE = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 57_u32)
  WPD_CONTACT_PRIMARY_FAX = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 58_u32)
  WPD_CONTACT_SPOUSE = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 59_u32)
  WPD_CONTACT_CHILDREN = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 60_u32)
  WPD_CONTACT_ASSISTANT = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 61_u32)
  WPD_CONTACT_ANNIVERSARY_DATE = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 62_u32)
  WPD_CONTACT_RINGTONE = PROPERTYKEY.new(LibC::GUID.new(0xfbd4fdab_u32, 0x987d_u16, 0x4777_u16, StaticArray[0xb3_u8, 0xf9_u8, 0x72_u8, 0x61_u8, 0x85_u8, 0xa9_u8, 0x31_u8, 0x2b_u8]), 63_u32)
  WPD_MUSIC_OBJECT_PROPERTIES_V1 = "b324f56a-dc5d-46e5-b6df-d2ea414888c6"
  WPD_MUSIC_ALBUM = PROPERTYKEY.new(LibC::GUID.new(0xb324f56a_u32, 0xdc5d_u16, 0x46e5_u16, StaticArray[0xb6_u8, 0xdf_u8, 0xd2_u8, 0xea_u8, 0x41_u8, 0x48_u8, 0x88_u8, 0xc6_u8]), 3_u32)
  WPD_MUSIC_TRACK = PROPERTYKEY.new(LibC::GUID.new(0xb324f56a_u32, 0xdc5d_u16, 0x46e5_u16, StaticArray[0xb6_u8, 0xdf_u8, 0xd2_u8, 0xea_u8, 0x41_u8, 0x48_u8, 0x88_u8, 0xc6_u8]), 4_u32)
  WPD_MUSIC_LYRICS = PROPERTYKEY.new(LibC::GUID.new(0xb324f56a_u32, 0xdc5d_u16, 0x46e5_u16, StaticArray[0xb6_u8, 0xdf_u8, 0xd2_u8, 0xea_u8, 0x41_u8, 0x48_u8, 0x88_u8, 0xc6_u8]), 6_u32)
  WPD_MUSIC_MOOD = PROPERTYKEY.new(LibC::GUID.new(0xb324f56a_u32, 0xdc5d_u16, 0x46e5_u16, StaticArray[0xb6_u8, 0xdf_u8, 0xd2_u8, 0xea_u8, 0x41_u8, 0x48_u8, 0x88_u8, 0xc6_u8]), 8_u32)
  WPD_AUDIO_BITRATE = PROPERTYKEY.new(LibC::GUID.new(0xb324f56a_u32, 0xdc5d_u16, 0x46e5_u16, StaticArray[0xb6_u8, 0xdf_u8, 0xd2_u8, 0xea_u8, 0x41_u8, 0x48_u8, 0x88_u8, 0xc6_u8]), 9_u32)
  WPD_AUDIO_CHANNEL_COUNT = PROPERTYKEY.new(LibC::GUID.new(0xb324f56a_u32, 0xdc5d_u16, 0x46e5_u16, StaticArray[0xb6_u8, 0xdf_u8, 0xd2_u8, 0xea_u8, 0x41_u8, 0x48_u8, 0x88_u8, 0xc6_u8]), 10_u32)
  WPD_AUDIO_FORMAT_CODE = PROPERTYKEY.new(LibC::GUID.new(0xb324f56a_u32, 0xdc5d_u16, 0x46e5_u16, StaticArray[0xb6_u8, 0xdf_u8, 0xd2_u8, 0xea_u8, 0x41_u8, 0x48_u8, 0x88_u8, 0xc6_u8]), 11_u32)
  WPD_AUDIO_BIT_DEPTH = PROPERTYKEY.new(LibC::GUID.new(0xb324f56a_u32, 0xdc5d_u16, 0x46e5_u16, StaticArray[0xb6_u8, 0xdf_u8, 0xd2_u8, 0xea_u8, 0x41_u8, 0x48_u8, 0x88_u8, 0xc6_u8]), 12_u32)
  WPD_AUDIO_BLOCK_ALIGNMENT = PROPERTYKEY.new(LibC::GUID.new(0xb324f56a_u32, 0xdc5d_u16, 0x46e5_u16, StaticArray[0xb6_u8, 0xdf_u8, 0xd2_u8, 0xea_u8, 0x41_u8, 0x48_u8, 0x88_u8, 0xc6_u8]), 13_u32)
  WPD_VIDEO_OBJECT_PROPERTIES_V1 = "346f2163-f998-4146-8b01-d19b4c00de9a"
  WPD_VIDEO_AUTHOR = PROPERTYKEY.new(LibC::GUID.new(0x346f2163_u32, 0xf998_u16, 0x4146_u16, StaticArray[0x8b_u8, 0x1_u8, 0xd1_u8, 0x9b_u8, 0x4c_u8, 0x0_u8, 0xde_u8, 0x9a_u8]), 2_u32)
  WPD_VIDEO_RECORDEDTV_STATION_NAME = PROPERTYKEY.new(LibC::GUID.new(0x346f2163_u32, 0xf998_u16, 0x4146_u16, StaticArray[0x8b_u8, 0x1_u8, 0xd1_u8, 0x9b_u8, 0x4c_u8, 0x0_u8, 0xde_u8, 0x9a_u8]), 4_u32)
  WPD_VIDEO_RECORDEDTV_CHANNEL_NUMBER = PROPERTYKEY.new(LibC::GUID.new(0x346f2163_u32, 0xf998_u16, 0x4146_u16, StaticArray[0x8b_u8, 0x1_u8, 0xd1_u8, 0x9b_u8, 0x4c_u8, 0x0_u8, 0xde_u8, 0x9a_u8]), 5_u32)
  WPD_VIDEO_RECORDEDTV_REPEAT = PROPERTYKEY.new(LibC::GUID.new(0x346f2163_u32, 0xf998_u16, 0x4146_u16, StaticArray[0x8b_u8, 0x1_u8, 0xd1_u8, 0x9b_u8, 0x4c_u8, 0x0_u8, 0xde_u8, 0x9a_u8]), 7_u32)
  WPD_VIDEO_BUFFER_SIZE = PROPERTYKEY.new(LibC::GUID.new(0x346f2163_u32, 0xf998_u16, 0x4146_u16, StaticArray[0x8b_u8, 0x1_u8, 0xd1_u8, 0x9b_u8, 0x4c_u8, 0x0_u8, 0xde_u8, 0x9a_u8]), 8_u32)
  WPD_VIDEO_CREDITS = PROPERTYKEY.new(LibC::GUID.new(0x346f2163_u32, 0xf998_u16, 0x4146_u16, StaticArray[0x8b_u8, 0x1_u8, 0xd1_u8, 0x9b_u8, 0x4c_u8, 0x0_u8, 0xde_u8, 0x9a_u8]), 9_u32)
  WPD_VIDEO_KEY_FRAME_DISTANCE = PROPERTYKEY.new(LibC::GUID.new(0x346f2163_u32, 0xf998_u16, 0x4146_u16, StaticArray[0x8b_u8, 0x1_u8, 0xd1_u8, 0x9b_u8, 0x4c_u8, 0x0_u8, 0xde_u8, 0x9a_u8]), 10_u32)
  WPD_VIDEO_QUALITY_SETTING = PROPERTYKEY.new(LibC::GUID.new(0x346f2163_u32, 0xf998_u16, 0x4146_u16, StaticArray[0x8b_u8, 0x1_u8, 0xd1_u8, 0x9b_u8, 0x4c_u8, 0x0_u8, 0xde_u8, 0x9a_u8]), 11_u32)
  WPD_VIDEO_SCAN_TYPE = PROPERTYKEY.new(LibC::GUID.new(0x346f2163_u32, 0xf998_u16, 0x4146_u16, StaticArray[0x8b_u8, 0x1_u8, 0xd1_u8, 0x9b_u8, 0x4c_u8, 0x0_u8, 0xde_u8, 0x9a_u8]), 12_u32)
  WPD_VIDEO_BITRATE = PROPERTYKEY.new(LibC::GUID.new(0x346f2163_u32, 0xf998_u16, 0x4146_u16, StaticArray[0x8b_u8, 0x1_u8, 0xd1_u8, 0x9b_u8, 0x4c_u8, 0x0_u8, 0xde_u8, 0x9a_u8]), 13_u32)
  WPD_VIDEO_FOURCC_CODE = PROPERTYKEY.new(LibC::GUID.new(0x346f2163_u32, 0xf998_u16, 0x4146_u16, StaticArray[0x8b_u8, 0x1_u8, 0xd1_u8, 0x9b_u8, 0x4c_u8, 0x0_u8, 0xde_u8, 0x9a_u8]), 14_u32)
  WPD_VIDEO_FRAMERATE = PROPERTYKEY.new(LibC::GUID.new(0x346f2163_u32, 0xf998_u16, 0x4146_u16, StaticArray[0x8b_u8, 0x1_u8, 0xd1_u8, 0x9b_u8, 0x4c_u8, 0x0_u8, 0xde_u8, 0x9a_u8]), 15_u32)
  WPD_COMMON_INFORMATION_OBJECT_PROPERTIES_V1 = "b28ae94b-05a4-4e8e-be01-72cc7e099d8f"
  WPD_COMMON_INFORMATION_SUBJECT = PROPERTYKEY.new(LibC::GUID.new(0xb28ae94b_u32, 0x5a4_u16, 0x4e8e_u16, StaticArray[0xbe_u8, 0x1_u8, 0x72_u8, 0xcc_u8, 0x7e_u8, 0x9_u8, 0x9d_u8, 0x8f_u8]), 2_u32)
  WPD_COMMON_INFORMATION_BODY_TEXT = PROPERTYKEY.new(LibC::GUID.new(0xb28ae94b_u32, 0x5a4_u16, 0x4e8e_u16, StaticArray[0xbe_u8, 0x1_u8, 0x72_u8, 0xcc_u8, 0x7e_u8, 0x9_u8, 0x9d_u8, 0x8f_u8]), 3_u32)
  WPD_COMMON_INFORMATION_PRIORITY = PROPERTYKEY.new(LibC::GUID.new(0xb28ae94b_u32, 0x5a4_u16, 0x4e8e_u16, StaticArray[0xbe_u8, 0x1_u8, 0x72_u8, 0xcc_u8, 0x7e_u8, 0x9_u8, 0x9d_u8, 0x8f_u8]), 4_u32)
  WPD_COMMON_INFORMATION_START_DATETIME = PROPERTYKEY.new(LibC::GUID.new(0xb28ae94b_u32, 0x5a4_u16, 0x4e8e_u16, StaticArray[0xbe_u8, 0x1_u8, 0x72_u8, 0xcc_u8, 0x7e_u8, 0x9_u8, 0x9d_u8, 0x8f_u8]), 5_u32)
  WPD_COMMON_INFORMATION_END_DATETIME = PROPERTYKEY.new(LibC::GUID.new(0xb28ae94b_u32, 0x5a4_u16, 0x4e8e_u16, StaticArray[0xbe_u8, 0x1_u8, 0x72_u8, 0xcc_u8, 0x7e_u8, 0x9_u8, 0x9d_u8, 0x8f_u8]), 6_u32)
  WPD_COMMON_INFORMATION_NOTES = PROPERTYKEY.new(LibC::GUID.new(0xb28ae94b_u32, 0x5a4_u16, 0x4e8e_u16, StaticArray[0xbe_u8, 0x1_u8, 0x72_u8, 0xcc_u8, 0x7e_u8, 0x9_u8, 0x9d_u8, 0x8f_u8]), 7_u32)
  WPD_MEMO_OBJECT_PROPERTIES_V1 = "5ffbfc7b-7483-41ad-afb9-da3f4e592b8d"
  WPD_EMAIL_OBJECT_PROPERTIES_V1 = "41f8f65a-5484-4782-b13d-4740dd7c37c5"
  WPD_EMAIL_TO_LINE = PROPERTYKEY.new(LibC::GUID.new(0x41f8f65a_u32, 0x5484_u16, 0x4782_u16, StaticArray[0xb1_u8, 0x3d_u8, 0x47_u8, 0x40_u8, 0xdd_u8, 0x7c_u8, 0x37_u8, 0xc5_u8]), 2_u32)
  WPD_EMAIL_CC_LINE = PROPERTYKEY.new(LibC::GUID.new(0x41f8f65a_u32, 0x5484_u16, 0x4782_u16, StaticArray[0xb1_u8, 0x3d_u8, 0x47_u8, 0x40_u8, 0xdd_u8, 0x7c_u8, 0x37_u8, 0xc5_u8]), 3_u32)
  WPD_EMAIL_BCC_LINE = PROPERTYKEY.new(LibC::GUID.new(0x41f8f65a_u32, 0x5484_u16, 0x4782_u16, StaticArray[0xb1_u8, 0x3d_u8, 0x47_u8, 0x40_u8, 0xdd_u8, 0x7c_u8, 0x37_u8, 0xc5_u8]), 4_u32)
  WPD_EMAIL_HAS_BEEN_READ = PROPERTYKEY.new(LibC::GUID.new(0x41f8f65a_u32, 0x5484_u16, 0x4782_u16, StaticArray[0xb1_u8, 0x3d_u8, 0x47_u8, 0x40_u8, 0xdd_u8, 0x7c_u8, 0x37_u8, 0xc5_u8]), 7_u32)
  WPD_EMAIL_RECEIVED_TIME = PROPERTYKEY.new(LibC::GUID.new(0x41f8f65a_u32, 0x5484_u16, 0x4782_u16, StaticArray[0xb1_u8, 0x3d_u8, 0x47_u8, 0x40_u8, 0xdd_u8, 0x7c_u8, 0x37_u8, 0xc5_u8]), 8_u32)
  WPD_EMAIL_HAS_ATTACHMENTS = PROPERTYKEY.new(LibC::GUID.new(0x41f8f65a_u32, 0x5484_u16, 0x4782_u16, StaticArray[0xb1_u8, 0x3d_u8, 0x47_u8, 0x40_u8, 0xdd_u8, 0x7c_u8, 0x37_u8, 0xc5_u8]), 9_u32)
  WPD_EMAIL_SENDER_ADDRESS = PROPERTYKEY.new(LibC::GUID.new(0x41f8f65a_u32, 0x5484_u16, 0x4782_u16, StaticArray[0xb1_u8, 0x3d_u8, 0x47_u8, 0x40_u8, 0xdd_u8, 0x7c_u8, 0x37_u8, 0xc5_u8]), 10_u32)
  WPD_APPOINTMENT_OBJECT_PROPERTIES_V1 = "f99efd03-431d-40d8-a1c9-4e220d9c88d3"
  WPD_APPOINTMENT_LOCATION = PROPERTYKEY.new(LibC::GUID.new(0xf99efd03_u32, 0x431d_u16, 0x40d8_u16, StaticArray[0xa1_u8, 0xc9_u8, 0x4e_u8, 0x22_u8, 0xd_u8, 0x9c_u8, 0x88_u8, 0xd3_u8]), 3_u32)
  WPD_APPOINTMENT_TYPE = PROPERTYKEY.new(LibC::GUID.new(0xf99efd03_u32, 0x431d_u16, 0x40d8_u16, StaticArray[0xa1_u8, 0xc9_u8, 0x4e_u8, 0x22_u8, 0xd_u8, 0x9c_u8, 0x88_u8, 0xd3_u8]), 7_u32)
  WPD_APPOINTMENT_REQUIRED_ATTENDEES = PROPERTYKEY.new(LibC::GUID.new(0xf99efd03_u32, 0x431d_u16, 0x40d8_u16, StaticArray[0xa1_u8, 0xc9_u8, 0x4e_u8, 0x22_u8, 0xd_u8, 0x9c_u8, 0x88_u8, 0xd3_u8]), 8_u32)
  WPD_APPOINTMENT_OPTIONAL_ATTENDEES = PROPERTYKEY.new(LibC::GUID.new(0xf99efd03_u32, 0x431d_u16, 0x40d8_u16, StaticArray[0xa1_u8, 0xc9_u8, 0x4e_u8, 0x22_u8, 0xd_u8, 0x9c_u8, 0x88_u8, 0xd3_u8]), 9_u32)
  WPD_APPOINTMENT_ACCEPTED_ATTENDEES = PROPERTYKEY.new(LibC::GUID.new(0xf99efd03_u32, 0x431d_u16, 0x40d8_u16, StaticArray[0xa1_u8, 0xc9_u8, 0x4e_u8, 0x22_u8, 0xd_u8, 0x9c_u8, 0x88_u8, 0xd3_u8]), 10_u32)
  WPD_APPOINTMENT_RESOURCES = PROPERTYKEY.new(LibC::GUID.new(0xf99efd03_u32, 0x431d_u16, 0x40d8_u16, StaticArray[0xa1_u8, 0xc9_u8, 0x4e_u8, 0x22_u8, 0xd_u8, 0x9c_u8, 0x88_u8, 0xd3_u8]), 11_u32)
  WPD_APPOINTMENT_TENTATIVE_ATTENDEES = PROPERTYKEY.new(LibC::GUID.new(0xf99efd03_u32, 0x431d_u16, 0x40d8_u16, StaticArray[0xa1_u8, 0xc9_u8, 0x4e_u8, 0x22_u8, 0xd_u8, 0x9c_u8, 0x88_u8, 0xd3_u8]), 12_u32)
  WPD_APPOINTMENT_DECLINED_ATTENDEES = PROPERTYKEY.new(LibC::GUID.new(0xf99efd03_u32, 0x431d_u16, 0x40d8_u16, StaticArray[0xa1_u8, 0xc9_u8, 0x4e_u8, 0x22_u8, 0xd_u8, 0x9c_u8, 0x88_u8, 0xd3_u8]), 13_u32)
  WPD_TASK_OBJECT_PROPERTIES_V1 = "e354e95e-d8a0-4637-a03a-0cb26838dbc7"
  WPD_TASK_STATUS = PROPERTYKEY.new(LibC::GUID.new(0xe354e95e_u32, 0xd8a0_u16, 0x4637_u16, StaticArray[0xa0_u8, 0x3a_u8, 0xc_u8, 0xb2_u8, 0x68_u8, 0x38_u8, 0xdb_u8, 0xc7_u8]), 6_u32)
  WPD_TASK_PERCENT_COMPLETE = PROPERTYKEY.new(LibC::GUID.new(0xe354e95e_u32, 0xd8a0_u16, 0x4637_u16, StaticArray[0xa0_u8, 0x3a_u8, 0xc_u8, 0xb2_u8, 0x68_u8, 0x38_u8, 0xdb_u8, 0xc7_u8]), 8_u32)
  WPD_TASK_REMINDER_DATE = PROPERTYKEY.new(LibC::GUID.new(0xe354e95e_u32, 0xd8a0_u16, 0x4637_u16, StaticArray[0xa0_u8, 0x3a_u8, 0xc_u8, 0xb2_u8, 0x68_u8, 0x38_u8, 0xdb_u8, 0xc7_u8]), 10_u32)
  WPD_TASK_OWNER = PROPERTYKEY.new(LibC::GUID.new(0xe354e95e_u32, 0xd8a0_u16, 0x4637_u16, StaticArray[0xa0_u8, 0x3a_u8, 0xc_u8, 0xb2_u8, 0x68_u8, 0x38_u8, 0xdb_u8, 0xc7_u8]), 11_u32)
  WPD_SMS_OBJECT_PROPERTIES_V1 = "7e1074cc-50ff-4dd1-a742-53be6f093a0d"
  WPD_SMS_PROVIDER = PROPERTYKEY.new(LibC::GUID.new(0x7e1074cc_u32, 0x50ff_u16, 0x4dd1_u16, StaticArray[0xa7_u8, 0x42_u8, 0x53_u8, 0xbe_u8, 0x6f_u8, 0x9_u8, 0x3a_u8, 0xd_u8]), 2_u32)
  WPD_SMS_TIMEOUT = PROPERTYKEY.new(LibC::GUID.new(0x7e1074cc_u32, 0x50ff_u16, 0x4dd1_u16, StaticArray[0xa7_u8, 0x42_u8, 0x53_u8, 0xbe_u8, 0x6f_u8, 0x9_u8, 0x3a_u8, 0xd_u8]), 3_u32)
  WPD_SMS_MAX_PAYLOAD = PROPERTYKEY.new(LibC::GUID.new(0x7e1074cc_u32, 0x50ff_u16, 0x4dd1_u16, StaticArray[0xa7_u8, 0x42_u8, 0x53_u8, 0xbe_u8, 0x6f_u8, 0x9_u8, 0x3a_u8, 0xd_u8]), 4_u32)
  WPD_SMS_ENCODING = PROPERTYKEY.new(LibC::GUID.new(0x7e1074cc_u32, 0x50ff_u16, 0x4dd1_u16, StaticArray[0xa7_u8, 0x42_u8, 0x53_u8, 0xbe_u8, 0x6f_u8, 0x9_u8, 0x3a_u8, 0xd_u8]), 5_u32)
  WPD_SECTION_OBJECT_PROPERTIES_V1 = "516afd2b-c64e-44f0-98dc-bee1c88f7d66"
  WPD_SECTION_DATA_OFFSET = PROPERTYKEY.new(LibC::GUID.new(0x516afd2b_u32, 0xc64e_u16, 0x44f0_u16, StaticArray[0x98_u8, 0xdc_u8, 0xbe_u8, 0xe1_u8, 0xc8_u8, 0x8f_u8, 0x7d_u8, 0x66_u8]), 2_u32)
  WPD_SECTION_DATA_LENGTH = PROPERTYKEY.new(LibC::GUID.new(0x516afd2b_u32, 0xc64e_u16, 0x44f0_u16, StaticArray[0x98_u8, 0xdc_u8, 0xbe_u8, 0xe1_u8, 0xc8_u8, 0x8f_u8, 0x7d_u8, 0x66_u8]), 3_u32)
  WPD_SECTION_DATA_UNITS = PROPERTYKEY.new(LibC::GUID.new(0x516afd2b_u32, 0xc64e_u16, 0x44f0_u16, StaticArray[0x98_u8, 0xdc_u8, 0xbe_u8, 0xe1_u8, 0xc8_u8, 0x8f_u8, 0x7d_u8, 0x66_u8]), 4_u32)
  WPD_SECTION_DATA_REFERENCED_OBJECT_RESOURCE = PROPERTYKEY.new(LibC::GUID.new(0x516afd2b_u32, 0xc64e_u16, 0x44f0_u16, StaticArray[0x98_u8, 0xdc_u8, 0xbe_u8, 0xe1_u8, 0xc8_u8, 0x8f_u8, 0x7d_u8, 0x66_u8]), 5_u32)
  DEVSVC_SERVICEINFO_VERSION = 100_u32
  DEVSVCTYPE_DEFAULT = 0_u32
  DEVSVCTYPE_ABSTRACT = 1_u32
  TYPE_CalendarSvc = 0_u32
  ENUM_CalendarObj_BusyStatusFree = 0_u32
  ENUM_CalendarObj_BusyStatusBusy = 1_u32
  ENUM_CalendarObj_BusyStatusOutOfOffice = 2_u32
  ENUM_CalendarObj_BusyStatusTentative = 3_u32
  TYPE_HintsSvc = 0_u32
  TYPE_MessageSvc = 0_u32
  ENUM_MessageObj_PriorityHighest = 2_u32
  ENUM_MessageObj_PriorityNormal = 1_u32
  ENUM_MessageObj_PriorityLowest = 0_u32
  ENUM_MessageObj_ReadFalse = 0_u32
  ENUM_MessageObj_ReadTrue = 255_u32
  ENUM_MessageObj_PatternTypeDaily = 1_u32
  ENUM_MessageObj_PatternTypeWeekly = 2_u32
  ENUM_MessageObj_PatternTypeMonthly = 3_u32
  ENUM_MessageObj_PatternTypeYearly = 4_u32
  FLAG_MessageObj_DayOfWeekNone = 0_u32
  FLAG_MessageObj_DayOfWeekSunday = 1_u32
  FLAG_MessageObj_DayOfWeekMonday = 2_u32
  FLAG_MessageObj_DayOfWeekTuesday = 4_u32
  FLAG_MessageObj_DayOfWeekWednesday = 8_u32
  FLAG_MessageObj_DayOfWeekThursday = 16_u32
  FLAG_MessageObj_DayOfWeekFriday = 32_u32
  FLAG_MessageObj_DayOfWeekSaturday = 64_u32
  RANGEMIN_MessageObj_PatternDayOfMonth = 1_u32
  RANGEMAX_MessageObj_PatternDayOfMonth = 31_u32
  RANGESTEP_MessageObj_PatternDayOfMonth = 1_u32
  RANGEMIN_MessageObj_PatternMonthOfYear = 1_u32
  RANGEMAX_MessageObj_PatternMonthOfYear = 12_u32
  RANGESTEP_MessageObj_PatternMonthOfYear = 1_u32
  ENUM_MessageObj_PatternInstanceNone = 0_u32
  ENUM_MessageObj_PatternInstanceFirst = 1_u32
  ENUM_MessageObj_PatternInstanceSecond = 2_u32
  ENUM_MessageObj_PatternInstanceThird = 3_u32
  ENUM_MessageObj_PatternInstanceFourth = 4_u32
  ENUM_MessageObj_PatternInstanceLast = 5_u32
  TYPE_DeviceMetadataSvc = 0_u32
  ENUM_DeviceMetadataObj_DefaultCABFalse = 0_u32
  ENUM_DeviceMetadataObj_DefaultCABTrue = 1_u32
  TYPE_NotesSvc = 0_u32
  TYPE_StatusSvc = 0_u32
  RANGEMIN_StatusSvc_SignalStrength = 0_u32
  RANGEMAX_StatusSvc_SignalStrength = 4_u32
  RANGESTEP_StatusSvc_SignalStrength = 1_u32
  RANGEMAX_StatusSvc_TextMessages = 255_u32
  RANGEMAX_StatusSvc_NewPictures = 65535_u32
  RANGEMAX_StatusSvc_MissedCalls = 255_u32
  RANGEMAX_StatusSvc_VoiceMail = 255_u32
  ENUM_StatusSvc_RoamingInactive = 0_u32
  ENUM_StatusSvc_RoamingActive = 1_u32
  ENUM_StatusSvc_RoamingUnknown = 2_u32
  RANGEMIN_StatusSvc_BatteryLife = 0_u32
  RANGEMAX_StatusSvc_BatteryLife = 100_u32
  RANGESTEP_StatusSvc_BatteryLife = 1_u32
  ENUM_StatusSvc_ChargingInactive = 0_u32
  ENUM_StatusSvc_ChargingActive = 1_u32
  ENUM_StatusSvc_ChargingUnknown = 2_u32
  SYNCSVC_FILTER_NONE = 0_u32
  SYNCSVC_FILTER_CONTACTS_WITH_PHONE = 1_u32
  SYNCSVC_FILTER_TASK_ACTIVE = 2_u32
  SYNCSVC_FILTER_CALENDAR_WINDOW_WITH_RECURRENCE = 3_u32
  ENUM_SyncSvc_SyncObjectReferencesDisabled = 0_u32
  ENUM_SyncSvc_SyncObjectReferencesEnabled = 255_u32
  TYPE_TasksSvc = 0_u32
  ENUM_TaskObj_CompleteFalse = 0_u32
  ENUM_TaskObj_CompleteTrue = 255_u32
  WPD_CATEGORY_MTP_EXT_VENDOR_OPERATIONS = "4d545058-1a2e-4106-a357-771e0819fc56"
  WPD_COMMAND_MTP_EXT_GET_SUPPORTED_VENDOR_OPCODES = PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 11_u32)
  WPD_COMMAND_MTP_EXT_EXECUTE_COMMAND_WITHOUT_DATA_PHASE = PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 12_u32)
  WPD_COMMAND_MTP_EXT_EXECUTE_COMMAND_WITH_DATA_TO_READ = PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 13_u32)
  WPD_COMMAND_MTP_EXT_EXECUTE_COMMAND_WITH_DATA_TO_WRITE = PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 14_u32)
  WPD_COMMAND_MTP_EXT_READ_DATA = PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 15_u32)
  WPD_COMMAND_MTP_EXT_WRITE_DATA = PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 16_u32)
  WPD_COMMAND_MTP_EXT_END_DATA_TRANSFER = PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 17_u32)
  WPD_COMMAND_MTP_EXT_GET_VENDOR_EXTENSION_DESCRIPTION = PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 18_u32)
  WPD_PROPERTY_MTP_EXT_OPERATION_CODE = PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 1001_u32)
  WPD_PROPERTY_MTP_EXT_OPERATION_PARAMS = PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 1002_u32)
  WPD_PROPERTY_MTP_EXT_RESPONSE_CODE = PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 1003_u32)
  WPD_PROPERTY_MTP_EXT_RESPONSE_PARAMS = PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 1004_u32)
  WPD_PROPERTY_MTP_EXT_VENDOR_OPERATION_CODES = PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 1005_u32)
  WPD_PROPERTY_MTP_EXT_TRANSFER_CONTEXT = PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 1006_u32)
  WPD_PROPERTY_MTP_EXT_TRANSFER_TOTAL_DATA_SIZE = PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 1007_u32)
  WPD_PROPERTY_MTP_EXT_TRANSFER_NUM_BYTES_TO_READ = PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 1008_u32)
  WPD_PROPERTY_MTP_EXT_TRANSFER_NUM_BYTES_READ = PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 1009_u32)
  WPD_PROPERTY_MTP_EXT_TRANSFER_NUM_BYTES_TO_WRITE = PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 1010_u32)
  WPD_PROPERTY_MTP_EXT_TRANSFER_NUM_BYTES_WRITTEN = PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 1011_u32)
  WPD_PROPERTY_MTP_EXT_TRANSFER_DATA = PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 1012_u32)
  WPD_PROPERTY_MTP_EXT_OPTIMAL_TRANSFER_BUFFER_SIZE = PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 1013_u32)
  WPD_PROPERTY_MTP_EXT_VENDOR_EXTENSION_DESCRIPTION = PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0x1a2e_u16, 0x4106_u16, StaticArray[0xa3_u8, 0x57_u8, 0x77_u8, 0x1e_u8, 0x8_u8, 0x19_u8, 0xfc_u8, 0x56_u8]), 1014_u32)
  WPD_PROPERTIES_MTP_VENDOR_EXTENDED_OBJECT_PROPS = "4d545058-4fce-4578-95c8-8698a9bc0f49"
  WPD_PROPERTIES_MTP_VENDOR_EXTENDED_DEVICE_PROPS = "4d545058-8900-40b3-8f1d-dc246e1e8370"
  WPD_EVENT_MTP_VENDOR_EXTENDED_EVENTS = "00000000-5738-4ff2-8445-be3126691059"
  WPD_PROPERTY_MTP_EXT_EVENT_PARAMS = PROPERTYKEY.new(LibC::GUID.new(0x4d545058_u32, 0xef88_u16, 0x4e4d_u16, StaticArray[0x95_u8, 0xc3_u8, 0x4f_u8, 0x32_u8, 0x7f_u8, 0x72_u8, 0x8a_u8, 0x96_u8]), 1011_u32)
  CLSID_WPD_NAMESPACE_EXTENSION = "35786d3c-b075-49b9-88dd-029876e11c01"
  WPDNSE_OBJECT_PROPERTIES_V1 = "34d71409-4b47-4d80-aaac-3a28a4a3b3e6"
  WPDNSE_OBJECT_HAS_CONTACT_PHOTO = PROPERTYKEY.new(LibC::GUID.new(0x34d71409_u32, 0x4b47_u16, 0x4d80_u16, StaticArray[0xaa_u8, 0xac_u8, 0x3a_u8, 0x28_u8, 0xa4_u8, 0xa3_u8, 0xb3_u8, 0xe6_u8]), 2_u32)
  WPDNSE_OBJECT_HAS_THUMBNAIL = PROPERTYKEY.new(LibC::GUID.new(0x34d71409_u32, 0x4b47_u16, 0x4d80_u16, StaticArray[0xaa_u8, 0xac_u8, 0x3a_u8, 0x28_u8, 0xa4_u8, 0xa3_u8, 0xb3_u8, 0xe6_u8]), 3_u32)
  WPDNSE_OBJECT_HAS_ICON = PROPERTYKEY.new(LibC::GUID.new(0x34d71409_u32, 0x4b47_u16, 0x4d80_u16, StaticArray[0xaa_u8, 0xac_u8, 0x3a_u8, 0x28_u8, 0xa4_u8, 0xa3_u8, 0xb3_u8, 0xe6_u8]), 4_u32)
  WPDNSE_OBJECT_HAS_AUDIO_CLIP = PROPERTYKEY.new(LibC::GUID.new(0x34d71409_u32, 0x4b47_u16, 0x4d80_u16, StaticArray[0xaa_u8, 0xac_u8, 0x3a_u8, 0x28_u8, 0xa4_u8, 0xa3_u8, 0xb3_u8, 0xe6_u8]), 5_u32)
  WPDNSE_OBJECT_HAS_ALBUM_ART = PROPERTYKEY.new(LibC::GUID.new(0x34d71409_u32, 0x4b47_u16, 0x4d80_u16, StaticArray[0xaa_u8, 0xac_u8, 0x3a_u8, 0x28_u8, 0xa4_u8, 0xa3_u8, 0xb3_u8, 0xe6_u8]), 6_u32)
  WPDNSE_OBJECT_OPTIMAL_READ_BLOCK_SIZE = PROPERTYKEY.new(LibC::GUID.new(0x34d71409_u32, 0x4b47_u16, 0x4d80_u16, StaticArray[0xaa_u8, 0xac_u8, 0x3a_u8, 0x28_u8, 0xa4_u8, 0xa3_u8, 0xb3_u8, 0xe6_u8]), 7_u32)
  WPDNSE_PROPSHEET_DEVICE_GENERAL = 1_u32
  WPDNSE_PROPSHEET_STORAGE_GENERAL = 2_u32
  WPDNSE_PROPSHEET_CONTENT_GENERAL = 4_u32
  WPDNSE_PROPSHEET_CONTENT_REFERENCES = 8_u32
  WPDNSE_PROPSHEET_CONTENT_RESOURCES = 16_u32
  WPDNSE_PROPSHEET_CONTENT_DETAILS = 32_u32
  TYPE_ContactsSvc = 0_u32
  TYPE_RingtonesSvc = 0_u32
  TYPE_AnchorSyncSvc = 1_u32
  ENUM_AnchorResults_AnchorStateNormal = 0_u32
  ENUM_AnchorResults_AnchorStateInvalid = 1_u32
  ENUM_AnchorResults_AnchorStateOld = 2_u32
  ENUM_AnchorResults_ItemStateInvalid = 0_u32
  ENUM_AnchorResults_ItemStateDeleted = 1_u32
  ENUM_AnchorResults_ItemStateCreated = 2_u32
  ENUM_AnchorResults_ItemStateUpdated = 3_u32
  ENUM_AnchorResults_ItemStateChanged = 4_u32
  TYPE_FullEnumSyncSvc = 1_u32
  WpdSerializer = LibC::GUID.new(0xb91a74b_u32, 0xad7c_u16, 0x4a9d_u16, StaticArray[0xb5_u8, 0x63_u8, 0x29_u8, 0xee_u8, 0xf9_u8, 0x16_u8, 0x71_u8, 0x72_u8])
  PortableDeviceValues = LibC::GUID.new(0xc15d503_u32, 0xd017_u16, 0x47ce_u16, StaticArray[0x90_u8, 0x16_u8, 0x7b_u8, 0x3f_u8, 0x97_u8, 0x87_u8, 0x21_u8, 0xcc_u8])
  PortableDeviceKeyCollection = LibC::GUID.new(0xde2d022d_u32, 0x2480_u16, 0x43be_u16, StaticArray[0x97_u8, 0xf0_u8, 0xd1_u8, 0xfa_u8, 0x2c_u8, 0xf9_u8, 0x8f_u8, 0x4f_u8])
  PortableDevicePropVariantCollection = LibC::GUID.new(0x8a99e2f_u32, 0x6d6d_u16, 0x4b80_u16, StaticArray[0xaf_u8, 0x5a_u8, 0xba_u8, 0xf2_u8, 0xbc_u8, 0xbe_u8, 0x4c_u8, 0xb9_u8])
  PortableDeviceValuesCollection = LibC::GUID.new(0x3882134d_u32, 0x14cf_u16, 0x4220_u16, StaticArray[0x9c_u8, 0xb4_u8, 0x43_u8, 0x5f_u8, 0x86_u8, 0xd8_u8, 0x3f_u8, 0x60_u8])
  PortableDevice = LibC::GUID.new(0x728a21c5_u32, 0x3d9e_u16, 0x48d7_u16, StaticArray[0x98_u8, 0x10_u8, 0x86_u8, 0x48_u8, 0x48_u8, 0xf0_u8, 0xf4_u8, 0x4_u8])
  PortableDeviceManager = LibC::GUID.new(0xaf10cec_u32, 0x2ecd_u16, 0x4b92_u16, StaticArray[0x95_u8, 0x81_u8, 0x34_u8, 0xf6_u8, 0xae_u8, 0x6_u8, 0x37_u8, 0xf3_u8])
  PortableDeviceService = LibC::GUID.new(0xef5db4c2_u32, 0x9312_u16, 0x422c_u16, StaticArray[0x91_u8, 0x52_u8, 0x41_u8, 0x1c_u8, 0xd9_u8, 0xc4_u8, 0xdd_u8, 0x84_u8])
  PortableDeviceDispatchFactory = LibC::GUID.new(0x43232233_u32, 0x8338_u16, 0x4658_u16, StaticArray[0xae_u8, 0x1_u8, 0xb_u8, 0x4a_u8, 0xe8_u8, 0x30_u8, 0xb6_u8, 0xb0_u8])
  PortableDeviceFTM = LibC::GUID.new(0xf7c0039a_u32, 0x4762_u16, 0x488a_u16, StaticArray[0xb4_u8, 0xb3_u8, 0x76_u8, 0xe_u8, 0xf9_u8, 0xa1_u8, 0xba_u8, 0x9b_u8])
  PortableDeviceServiceFTM = LibC::GUID.new(0x1649b154_u32, 0xc794_u16, 0x497a_u16, StaticArray[0x9b_u8, 0x3_u8, 0xf3_u8, 0xf0_u8, 0x12_u8, 0x13_u8, 0x2_u8, 0xf3_u8])
  PortableDeviceWebControl = LibC::GUID.new(0x186dd02c_u32, 0x2dec_u16, 0x41b5_u16, StaticArray[0xa7_u8, 0xd4_u8, 0xb5_u8, 0x90_u8, 0x56_u8, 0xfa_u8, 0xde_u8, 0x51_u8])
  EnumBthMtpConnectors = LibC::GUID.new(0xa1570149_u32, 0xe645_u16, 0x4f43_u16, StaticArray[0x8b_u8, 0xd_u8, 0x40_u8, 0x9b_u8, 0x6_u8, 0x1d_u8, 0xb2_u8, 0xfc_u8])


  enum DELETE_OBJECT_OPTIONS : Int32
    PORTABLE_DEVICE_DELETE_NO_RECURSION = 0
    PORTABLE_DEVICE_DELETE_WITH_RECURSION = 1
  end

  enum WPD_DEVICE_TYPES : Int32
    WPD_DEVICE_TYPE_GENERIC = 0
    WPD_DEVICE_TYPE_CAMERA = 1
    WPD_DEVICE_TYPE_MEDIA_PLAYER = 2
    WPD_DEVICE_TYPE_PHONE = 3
    WPD_DEVICE_TYPE_VIDEO = 4
    WPD_DEVICE_TYPE_PERSONAL_INFORMATION_MANAGER = 5
    WPD_DEVICE_TYPE_AUDIO_RECORDER = 6
  end

  enum WpdAttributeForm : Int32
    WPD_PROPERTY_ATTRIBUTE_FORM_UNSPECIFIED = 0
    WPD_PROPERTY_ATTRIBUTE_FORM_RANGE = 1
    WPD_PROPERTY_ATTRIBUTE_FORM_ENUMERATION = 2
    WPD_PROPERTY_ATTRIBUTE_FORM_REGULAR_EXPRESSION = 3
    WPD_PROPERTY_ATTRIBUTE_FORM_OBJECT_IDENTIFIER = 4
  end

  enum WpdParameterAttributeForm : Int32
    WPD_PARAMETER_ATTRIBUTE_FORM_UNSPECIFIED = 0
    WPD_PARAMETER_ATTRIBUTE_FORM_RANGE = 1
    WPD_PARAMETER_ATTRIBUTE_FORM_ENUMERATION = 2
    WPD_PARAMETER_ATTRIBUTE_FORM_REGULAR_EXPRESSION = 3
    WPD_PARAMETER_ATTRIBUTE_FORM_OBJECT_IDENTIFIER = 4
  end

  enum WPD_DEVICE_TRANSPORTS : Int32
    WPD_DEVICE_TRANSPORT_UNSPECIFIED = 0
    WPD_DEVICE_TRANSPORT_USB = 1
    WPD_DEVICE_TRANSPORT_IP = 2
    WPD_DEVICE_TRANSPORT_BLUETOOTH = 3
  end

  enum WPD_STORAGE_TYPE_VALUES : Int32
    WPD_STORAGE_TYPE_UNDEFINED = 0
    WPD_STORAGE_TYPE_FIXED_ROM = 1
    WPD_STORAGE_TYPE_REMOVABLE_ROM = 2
    WPD_STORAGE_TYPE_FIXED_RAM = 3
    WPD_STORAGE_TYPE_REMOVABLE_RAM = 4
  end

  enum WPD_STORAGE_ACCESS_CAPABILITY_VALUES : Int32
    WPD_STORAGE_ACCESS_CAPABILITY_READWRITE = 0
    WPD_STORAGE_ACCESS_CAPABILITY_READ_ONLY_WITHOUT_OBJECT_DELETION = 1
    WPD_STORAGE_ACCESS_CAPABILITY_READ_ONLY_WITH_OBJECT_DELETION = 2
  end

  enum WPD_SMS_ENCODING_TYPES : Int32
    SMS_ENCODING_7_BIT = 0
    SMS_ENCODING_8_BIT = 1
    SMS_ENCODING_UTF_16 = 2
  end

  enum SMS_MESSAGE_TYPES : Int32
    SMS_TEXT_MESSAGE = 0
    SMS_BINARY_MESSAGE = 1
  end

  enum WPD_POWER_SOURCES : Int32
    WPD_POWER_SOURCE_BATTERY = 0
    WPD_POWER_SOURCE_EXTERNAL = 1
  end

  enum WPD_WHITE_BALANCE_SETTINGS : Int32
    WPD_WHITE_BALANCE_UNDEFINED = 0
    WPD_WHITE_BALANCE_MANUAL = 1
    WPD_WHITE_BALANCE_AUTOMATIC = 2
    WPD_WHITE_BALANCE_ONE_PUSH_AUTOMATIC = 3
    WPD_WHITE_BALANCE_DAYLIGHT = 4
    WPD_WHITE_BALANCE_FLORESCENT = 5
    WPD_WHITE_BALANCE_TUNGSTEN = 6
    WPD_WHITE_BALANCE_FLASH = 7
  end

  enum WPD_FOCUS_MODES : Int32
    WPD_FOCUS_UNDEFINED = 0
    WPD_FOCUS_MANUAL = 1
    WPD_FOCUS_AUTOMATIC = 2
    WPD_FOCUS_AUTOMATIC_MACRO = 3
  end

  enum WPD_EXPOSURE_METERING_MODES : Int32
    WPD_EXPOSURE_METERING_MODE_UNDEFINED = 0
    WPD_EXPOSURE_METERING_MODE_AVERAGE = 1
    WPD_EXPOSURE_METERING_MODE_CENTER_WEIGHTED_AVERAGE = 2
    WPD_EXPOSURE_METERING_MODE_MULTI_SPOT = 3
    WPD_EXPOSURE_METERING_MODE_CENTER_SPOT = 4
  end

  enum WPD_FLASH_MODES : Int32
    WPD_FLASH_MODE_UNDEFINED = 0
    WPD_FLASH_MODE_AUTO = 1
    WPD_FLASH_MODE_OFF = 2
    WPD_FLASH_MODE_FILL = 3
    WPD_FLASH_MODE_RED_EYE_AUTO = 4
    WPD_FLASH_MODE_RED_EYE_FILL = 5
    WPD_FLASH_MODE_EXTERNAL_SYNC = 6
  end

  enum WPD_EXPOSURE_PROGRAM_MODES : Int32
    WPD_EXPOSURE_PROGRAM_MODE_UNDEFINED = 0
    WPD_EXPOSURE_PROGRAM_MODE_MANUAL = 1
    WPD_EXPOSURE_PROGRAM_MODE_AUTO = 2
    WPD_EXPOSURE_PROGRAM_MODE_APERTURE_PRIORITY = 3
    WPD_EXPOSURE_PROGRAM_MODE_SHUTTER_PRIORITY = 4
    WPD_EXPOSURE_PROGRAM_MODE_CREATIVE = 5
    WPD_EXPOSURE_PROGRAM_MODE_ACTION = 6
    WPD_EXPOSURE_PROGRAM_MODE_PORTRAIT = 7
  end

  enum WPD_CAPTURE_MODES : Int32
    WPD_CAPTURE_MODE_UNDEFINED = 0
    WPD_CAPTURE_MODE_NORMAL = 1
    WPD_CAPTURE_MODE_BURST = 2
    WPD_CAPTURE_MODE_TIMELAPSE = 3
  end

  enum WPD_EFFECT_MODES : Int32
    WPD_EFFECT_MODE_UNDEFINED = 0
    WPD_EFFECT_MODE_COLOR = 1
    WPD_EFFECT_MODE_BLACK_AND_WHITE = 2
    WPD_EFFECT_MODE_SEPIA = 3
  end

  enum WPD_FOCUS_METERING_MODES : Int32
    WPD_FOCUS_METERING_MODE_UNDEFINED = 0
    WPD_FOCUS_METERING_MODE_CENTER_SPOT = 1
    WPD_FOCUS_METERING_MODE_MULTI_SPOT = 2
  end

  enum WPD_BITRATE_TYPES : Int32
    WPD_BITRATE_TYPE_UNUSED = 0
    WPD_BITRATE_TYPE_DISCRETE = 1
    WPD_BITRATE_TYPE_VARIABLE = 2
    WPD_BITRATE_TYPE_FREE = 3
  end

  enum WPD_META_GENRES : Int32
    WPD_META_GENRE_UNUSED = 0
    WPD_META_GENRE_GENERIC_MUSIC_AUDIO_FILE = 1
    WPD_META_GENRE_GENERIC_NON_MUSIC_AUDIO_FILE = 17
    WPD_META_GENRE_SPOKEN_WORD_AUDIO_BOOK_FILES = 18
    WPD_META_GENRE_SPOKEN_WORD_FILES_NON_AUDIO_BOOK = 19
    WPD_META_GENRE_SPOKEN_WORD_NEWS = 20
    WPD_META_GENRE_SPOKEN_WORD_TALK_SHOWS = 21
    WPD_META_GENRE_GENERIC_VIDEO_FILE = 33
    WPD_META_GENRE_NEWS_VIDEO_FILE = 34
    WPD_META_GENRE_MUSIC_VIDEO_FILE = 35
    WPD_META_GENRE_HOME_VIDEO_FILE = 36
    WPD_META_GENRE_FEATURE_FILM_VIDEO_FILE = 37
    WPD_META_GENRE_TELEVISION_VIDEO_FILE = 38
    WPD_META_GENRE_TRAINING_EDUCATIONAL_VIDEO_FILE = 39
    WPD_META_GENRE_PHOTO_MONTAGE_VIDEO_FILE = 40
    WPD_META_GENRE_GENERIC_NON_AUDIO_NON_VIDEO = 48
    WPD_META_GENRE_AUDIO_PODCAST = 64
    WPD_META_GENRE_VIDEO_PODCAST = 65
    WPD_META_GENRE_MIXED_PODCAST = 66
  end

  enum WPD_CROPPED_STATUS_VALUES : Int32
    WPD_CROPPED_STATUS_NOT_CROPPED = 0
    WPD_CROPPED_STATUS_CROPPED = 1
    WPD_CROPPED_STATUS_SHOULD_NOT_BE_CROPPED = 2
  end

  enum WPD_COLOR_CORRECTED_STATUS_VALUES : Int32
    WPD_COLOR_CORRECTED_STATUS_NOT_CORRECTED = 0
    WPD_COLOR_CORRECTED_STATUS_CORRECTED = 1
    WPD_COLOR_CORRECTED_STATUS_SHOULD_NOT_BE_CORRECTED = 2
  end

  enum WPD_VIDEO_SCAN_TYPES : Int32
    WPD_VIDEO_SCAN_TYPE_UNUSED = 0
    WPD_VIDEO_SCAN_TYPE_PROGRESSIVE = 1
    WPD_VIDEO_SCAN_TYPE_FIELD_INTERLEAVED_UPPER_FIRST = 2
    WPD_VIDEO_SCAN_TYPE_FIELD_INTERLEAVED_LOWER_FIRST = 3
    WPD_VIDEO_SCAN_TYPE_FIELD_SINGLE_UPPER_FIRST = 4
    WPD_VIDEO_SCAN_TYPE_FIELD_SINGLE_LOWER_FIRST = 5
    WPD_VIDEO_SCAN_TYPE_MIXED_INTERLACE = 6
    WPD_VIDEO_SCAN_TYPE_MIXED_INTERLACE_AND_PROGRESSIVE = 7
  end

  enum WPD_OPERATION_STATES : Int32
    WPD_OPERATION_STATE_UNSPECIFIED = 0
    WPD_OPERATION_STATE_STARTED = 1
    WPD_OPERATION_STATE_RUNNING = 2
    WPD_OPERATION_STATE_PAUSED = 3
    WPD_OPERATION_STATE_CANCELLED = 4
    WPD_OPERATION_STATE_FINISHED = 5
    WPD_OPERATION_STATE_ABORTED = 6
  end

  enum WPD_SECTION_DATA_UNITS_VALUES : Int32
    WPD_SECTION_DATA_UNITS_BYTES = 0
    WPD_SECTION_DATA_UNITS_MILLISECONDS = 1
  end

  enum WPD_RENDERING_INFORMATION_PROFILE_ENTRY_TYPES : Int32
    WPD_RENDERING_INFORMATION_PROFILE_ENTRY_TYPE_OBJECT = 0
    WPD_RENDERING_INFORMATION_PROFILE_ENTRY_TYPE_RESOURCE = 1
  end

  enum WPD_COMMAND_ACCESS_TYPES : Int32
    WPD_COMMAND_ACCESS_READ = 1
    WPD_COMMAND_ACCESS_READWRITE = 3
    WPD_COMMAND_ACCESS_FROM_PROPERTY_WITH_STGM_ACCESS = 4
    WPD_COMMAND_ACCESS_FROM_PROPERTY_WITH_FILE_ACCESS = 8
    WPD_COMMAND_ACCESS_FROM_ATTRIBUTE_WITH_METHOD_ACCESS = 16
  end

  enum WPD_SERVICE_INHERITANCE_TYPES : Int32
    WPD_SERVICE_INHERITANCE_IMPLEMENTATION = 0
  end

  enum WPD_PARAMETER_USAGE_TYPES : Int32
    WPD_PARAMETER_USAGE_RETURN = 0
    WPD_PARAMETER_USAGE_IN = 1
    WPD_PARAMETER_USAGE_OUT = 2
    WPD_PARAMETER_USAGE_INOUT = 3
  end

  enum WPD_STREAM_UNITS : Int32
    WPD_STREAM_UNITS_BYTES = 0
    WPD_STREAM_UNITS_FRAMES = 1
    WPD_STREAM_UNITS_ROWS = 2
    WPD_STREAM_UNITS_MILLISECONDS = 4
    WPD_STREAM_UNITS_MICROSECONDS = 8
  end

  enum DEVICE_RADIO_STATE : Int32
    DRS_RADIO_ON = 0
    DRS_SW_RADIO_OFF = 1
    DRS_HW_RADIO_OFF = 2
    DRS_SW_HW_RADIO_OFF = 3
    DRS_HW_RADIO_ON_UNCONTROLLABLE = 4
    DRS_RADIO_INVALID = 5
    DRS_HW_RADIO_OFF_UNCONTROLLABLE = 6
    DRS_RADIO_MAX = 6
  end

  enum SYSTEM_RADIO_STATE : Int32
    SRS_RADIO_ENABLED = 0
    SRS_RADIO_DISABLED = 1
  end

  struct WPD_COMMAND_ACCESS_LOOKUP_ENTRY
    command : PROPERTYKEY
    access_type : UInt32
    access_property : PROPERTYKEY
  end


  struct IWpdSerializerVTbl
    query_interface : Proc(IWpdSerializer*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWpdSerializer*, UInt32)
    release : Proc(IWpdSerializer*, UInt32)
    get_i_portable_device_values_from_buffer : Proc(IWpdSerializer*, UInt8*, UInt32, IPortableDeviceValues*, HRESULT)
    write_i_portable_device_values_to_buffer : Proc(IWpdSerializer*, UInt32, IPortableDeviceValues, UInt8*, UInt32*, HRESULT)
    get_buffer_from_i_portable_device_values : Proc(IWpdSerializer*, IPortableDeviceValues, UInt8**, UInt32*, HRESULT)
    get_serialized_size : Proc(IWpdSerializer*, IPortableDeviceValues, UInt32*, HRESULT)
  end

  struct IWpdSerializer
    lpVtbl : IWpdSerializerVTbl*
  end

  struct IPortableDeviceValuesVTbl
    query_interface : Proc(IPortableDeviceValues*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPortableDeviceValues*, UInt32)
    release : Proc(IPortableDeviceValues*, UInt32)
    get_count : Proc(IPortableDeviceValues*, UInt32*, HRESULT)
    get_at : Proc(IPortableDeviceValues*, UInt32, PROPERTYKEY*, PROPVARIANT*, HRESULT)
    set_value : Proc(IPortableDeviceValues*, PROPERTYKEY*, PROPVARIANT*, HRESULT)
    get_value : Proc(IPortableDeviceValues*, PROPERTYKEY*, PROPVARIANT*, HRESULT)
    set_string_value : Proc(IPortableDeviceValues*, PROPERTYKEY*, LibC::LPWSTR, HRESULT)
    get_string_value : Proc(IPortableDeviceValues*, PROPERTYKEY*, LibC::LPWSTR*, HRESULT)
    set_unsigned_integer_value : Proc(IPortableDeviceValues*, PROPERTYKEY*, UInt32, HRESULT)
    get_unsigned_integer_value : Proc(IPortableDeviceValues*, PROPERTYKEY*, UInt32*, HRESULT)
    set_signed_integer_value : Proc(IPortableDeviceValues*, PROPERTYKEY*, Int32, HRESULT)
    get_signed_integer_value : Proc(IPortableDeviceValues*, PROPERTYKEY*, Int32*, HRESULT)
    set_unsigned_large_integer_value : Proc(IPortableDeviceValues*, PROPERTYKEY*, UInt64, HRESULT)
    get_unsigned_large_integer_value : Proc(IPortableDeviceValues*, PROPERTYKEY*, UInt64*, HRESULT)
    set_signed_large_integer_value : Proc(IPortableDeviceValues*, PROPERTYKEY*, Int64, HRESULT)
    get_signed_large_integer_value : Proc(IPortableDeviceValues*, PROPERTYKEY*, Int64*, HRESULT)
    set_float_value : Proc(IPortableDeviceValues*, PROPERTYKEY*, Float32, HRESULT)
    get_float_value : Proc(IPortableDeviceValues*, PROPERTYKEY*, Float32*, HRESULT)
    set_error_value : Proc(IPortableDeviceValues*, PROPERTYKEY*, HRESULT, HRESULT)
    get_error_value : Proc(IPortableDeviceValues*, PROPERTYKEY*, HRESULT*, HRESULT)
    set_key_value : Proc(IPortableDeviceValues*, PROPERTYKEY*, PROPERTYKEY*, HRESULT)
    get_key_value : Proc(IPortableDeviceValues*, PROPERTYKEY*, PROPERTYKEY*, HRESULT)
    set_bool_value : Proc(IPortableDeviceValues*, PROPERTYKEY*, LibC::BOOL, HRESULT)
    get_bool_value : Proc(IPortableDeviceValues*, PROPERTYKEY*, LibC::BOOL*, HRESULT)
    set_i_unknown_value : Proc(IPortableDeviceValues*, PROPERTYKEY*, IUnknown, HRESULT)
    get_i_unknown_value : Proc(IPortableDeviceValues*, PROPERTYKEY*, IUnknown*, HRESULT)
    set_guid_value : Proc(IPortableDeviceValues*, PROPERTYKEY*, Guid*, HRESULT)
    get_guid_value : Proc(IPortableDeviceValues*, PROPERTYKEY*, Guid*, HRESULT)
    set_buffer_value : Proc(IPortableDeviceValues*, PROPERTYKEY*, UInt8*, UInt32, HRESULT)
    get_buffer_value : Proc(IPortableDeviceValues*, PROPERTYKEY*, UInt8**, UInt32*, HRESULT)
    set_i_portable_device_values_value : Proc(IPortableDeviceValues*, PROPERTYKEY*, IPortableDeviceValues, HRESULT)
    get_i_portable_device_values_value : Proc(IPortableDeviceValues*, PROPERTYKEY*, IPortableDeviceValues*, HRESULT)
    set_i_portable_device_prop_variant_collection_value : Proc(IPortableDeviceValues*, PROPERTYKEY*, IPortableDevicePropVariantCollection, HRESULT)
    get_i_portable_device_prop_variant_collection_value : Proc(IPortableDeviceValues*, PROPERTYKEY*, IPortableDevicePropVariantCollection*, HRESULT)
    set_i_portable_device_key_collection_value : Proc(IPortableDeviceValues*, PROPERTYKEY*, IPortableDeviceKeyCollection, HRESULT)
    get_i_portable_device_key_collection_value : Proc(IPortableDeviceValues*, PROPERTYKEY*, IPortableDeviceKeyCollection*, HRESULT)
    set_i_portable_device_values_collection_value : Proc(IPortableDeviceValues*, PROPERTYKEY*, IPortableDeviceValuesCollection, HRESULT)
    get_i_portable_device_values_collection_value : Proc(IPortableDeviceValues*, PROPERTYKEY*, IPortableDeviceValuesCollection*, HRESULT)
    remove_value : Proc(IPortableDeviceValues*, PROPERTYKEY*, HRESULT)
    copy_values_from_property_store : Proc(IPortableDeviceValues*, IPropertyStore, HRESULT)
    copy_values_to_property_store : Proc(IPortableDeviceValues*, IPropertyStore, HRESULT)
    clear : Proc(IPortableDeviceValues*, HRESULT)
  end

  struct IPortableDeviceValues
    lpVtbl : IPortableDeviceValuesVTbl*
  end

  struct IPortableDeviceKeyCollectionVTbl
    query_interface : Proc(IPortableDeviceKeyCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPortableDeviceKeyCollection*, UInt32)
    release : Proc(IPortableDeviceKeyCollection*, UInt32)
    get_count : Proc(IPortableDeviceKeyCollection*, UInt32*, HRESULT)
    get_at : Proc(IPortableDeviceKeyCollection*, UInt32, PROPERTYKEY*, HRESULT)
    add : Proc(IPortableDeviceKeyCollection*, PROPERTYKEY*, HRESULT)
    clear : Proc(IPortableDeviceKeyCollection*, HRESULT)
    remove_at : Proc(IPortableDeviceKeyCollection*, UInt32, HRESULT)
  end

  struct IPortableDeviceKeyCollection
    lpVtbl : IPortableDeviceKeyCollectionVTbl*
  end

  struct IPortableDevicePropVariantCollectionVTbl
    query_interface : Proc(IPortableDevicePropVariantCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPortableDevicePropVariantCollection*, UInt32)
    release : Proc(IPortableDevicePropVariantCollection*, UInt32)
    get_count : Proc(IPortableDevicePropVariantCollection*, UInt32*, HRESULT)
    get_at : Proc(IPortableDevicePropVariantCollection*, UInt32, PROPVARIANT*, HRESULT)
    add : Proc(IPortableDevicePropVariantCollection*, PROPVARIANT*, HRESULT)
    get_type : Proc(IPortableDevicePropVariantCollection*, UInt16*, HRESULT)
    change_type : Proc(IPortableDevicePropVariantCollection*, UInt16, HRESULT)
    clear : Proc(IPortableDevicePropVariantCollection*, HRESULT)
    remove_at : Proc(IPortableDevicePropVariantCollection*, UInt32, HRESULT)
  end

  struct IPortableDevicePropVariantCollection
    lpVtbl : IPortableDevicePropVariantCollectionVTbl*
  end

  struct IPortableDeviceValuesCollectionVTbl
    query_interface : Proc(IPortableDeviceValuesCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPortableDeviceValuesCollection*, UInt32)
    release : Proc(IPortableDeviceValuesCollection*, UInt32)
    get_count : Proc(IPortableDeviceValuesCollection*, UInt32*, HRESULT)
    get_at : Proc(IPortableDeviceValuesCollection*, UInt32, IPortableDeviceValues*, HRESULT)
    add : Proc(IPortableDeviceValuesCollection*, IPortableDeviceValues, HRESULT)
    clear : Proc(IPortableDeviceValuesCollection*, HRESULT)
    remove_at : Proc(IPortableDeviceValuesCollection*, UInt32, HRESULT)
  end

  struct IPortableDeviceValuesCollection
    lpVtbl : IPortableDeviceValuesCollectionVTbl*
  end

  struct IPortableDeviceManagerVTbl
    query_interface : Proc(IPortableDeviceManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPortableDeviceManager*, UInt32)
    release : Proc(IPortableDeviceManager*, UInt32)
    get_devices : Proc(IPortableDeviceManager*, LibC::LPWSTR*, UInt32*, HRESULT)
    refresh_device_list : Proc(IPortableDeviceManager*, HRESULT)
    get_device_friendly_name : Proc(IPortableDeviceManager*, LibC::LPWSTR, LibC::LPWSTR, UInt32*, HRESULT)
    get_device_description : Proc(IPortableDeviceManager*, LibC::LPWSTR, LibC::LPWSTR, UInt32*, HRESULT)
    get_device_manufacturer : Proc(IPortableDeviceManager*, LibC::LPWSTR, LibC::LPWSTR, UInt32*, HRESULT)
    get_device_property : Proc(IPortableDeviceManager*, LibC::LPWSTR, LibC::LPWSTR, UInt8*, UInt32*, UInt32*, HRESULT)
    get_private_devices : Proc(IPortableDeviceManager*, LibC::LPWSTR*, UInt32*, HRESULT)
  end

  struct IPortableDeviceManager
    lpVtbl : IPortableDeviceManagerVTbl*
  end

  struct IPortableDeviceVTbl
    query_interface : Proc(IPortableDevice*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPortableDevice*, UInt32)
    release : Proc(IPortableDevice*, UInt32)
    open : Proc(IPortableDevice*, LibC::LPWSTR, IPortableDeviceValues, HRESULT)
    send_command : Proc(IPortableDevice*, UInt32, IPortableDeviceValues, IPortableDeviceValues*, HRESULT)
    content : Proc(IPortableDevice*, IPortableDeviceContent*, HRESULT)
    capabilities : Proc(IPortableDevice*, IPortableDeviceCapabilities*, HRESULT)
    cancel : Proc(IPortableDevice*, HRESULT)
    close : Proc(IPortableDevice*, HRESULT)
    advise : Proc(IPortableDevice*, UInt32, IPortableDeviceEventCallback, IPortableDeviceValues, LibC::LPWSTR*, HRESULT)
    unadvise : Proc(IPortableDevice*, LibC::LPWSTR, HRESULT)
    get_pn_p_device_id : Proc(IPortableDevice*, LibC::LPWSTR*, HRESULT)
  end

  struct IPortableDevice
    lpVtbl : IPortableDeviceVTbl*
  end

  struct IPortableDeviceContentVTbl
    query_interface : Proc(IPortableDeviceContent*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPortableDeviceContent*, UInt32)
    release : Proc(IPortableDeviceContent*, UInt32)
    enum_objects : Proc(IPortableDeviceContent*, UInt32, LibC::LPWSTR, IPortableDeviceValues, IEnumPortableDeviceObjectIDs*, HRESULT)
    properties : Proc(IPortableDeviceContent*, IPortableDeviceProperties*, HRESULT)
    transfer : Proc(IPortableDeviceContent*, IPortableDeviceResources*, HRESULT)
    create_object_with_properties_only : Proc(IPortableDeviceContent*, IPortableDeviceValues, LibC::LPWSTR*, HRESULT)
    create_object_with_properties_and_data : Proc(IPortableDeviceContent*, IPortableDeviceValues, IStream*, UInt32*, LibC::LPWSTR*, HRESULT)
    delete : Proc(IPortableDeviceContent*, UInt32, IPortableDevicePropVariantCollection, IPortableDevicePropVariantCollection*, HRESULT)
    get_object_i_ds_from_persistent_unique_i_ds : Proc(IPortableDeviceContent*, IPortableDevicePropVariantCollection, IPortableDevicePropVariantCollection*, HRESULT)
    cancel : Proc(IPortableDeviceContent*, HRESULT)
    move : Proc(IPortableDeviceContent*, IPortableDevicePropVariantCollection, LibC::LPWSTR, IPortableDevicePropVariantCollection*, HRESULT)
    copy : Proc(IPortableDeviceContent*, IPortableDevicePropVariantCollection, LibC::LPWSTR, IPortableDevicePropVariantCollection*, HRESULT)
  end

  struct IPortableDeviceContent
    lpVtbl : IPortableDeviceContentVTbl*
  end

  struct IPortableDeviceContent2VTbl
    query_interface : Proc(IPortableDeviceContent2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPortableDeviceContent2*, UInt32)
    release : Proc(IPortableDeviceContent2*, UInt32)
    enum_objects : Proc(IPortableDeviceContent2*, UInt32, LibC::LPWSTR, IPortableDeviceValues, IEnumPortableDeviceObjectIDs*, HRESULT)
    properties : Proc(IPortableDeviceContent2*, IPortableDeviceProperties*, HRESULT)
    transfer : Proc(IPortableDeviceContent2*, IPortableDeviceResources*, HRESULT)
    create_object_with_properties_only : Proc(IPortableDeviceContent2*, IPortableDeviceValues, LibC::LPWSTR*, HRESULT)
    create_object_with_properties_and_data : Proc(IPortableDeviceContent2*, IPortableDeviceValues, IStream*, UInt32*, LibC::LPWSTR*, HRESULT)
    delete : Proc(IPortableDeviceContent2*, UInt32, IPortableDevicePropVariantCollection, IPortableDevicePropVariantCollection*, HRESULT)
    get_object_i_ds_from_persistent_unique_i_ds : Proc(IPortableDeviceContent2*, IPortableDevicePropVariantCollection, IPortableDevicePropVariantCollection*, HRESULT)
    cancel : Proc(IPortableDeviceContent2*, HRESULT)
    move : Proc(IPortableDeviceContent2*, IPortableDevicePropVariantCollection, LibC::LPWSTR, IPortableDevicePropVariantCollection*, HRESULT)
    copy : Proc(IPortableDeviceContent2*, IPortableDevicePropVariantCollection, LibC::LPWSTR, IPortableDevicePropVariantCollection*, HRESULT)
    update_object_with_properties_and_data : Proc(IPortableDeviceContent2*, LibC::LPWSTR, IPortableDeviceValues, IStream*, UInt32*, HRESULT)
  end

  struct IPortableDeviceContent2
    lpVtbl : IPortableDeviceContent2VTbl*
  end

  struct IEnumPortableDeviceObjectIDsVTbl
    query_interface : Proc(IEnumPortableDeviceObjectIDs*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumPortableDeviceObjectIDs*, UInt32)
    release : Proc(IEnumPortableDeviceObjectIDs*, UInt32)
    next : Proc(IEnumPortableDeviceObjectIDs*, UInt32, LibC::LPWSTR*, UInt32*, HRESULT)
    skip : Proc(IEnumPortableDeviceObjectIDs*, UInt32, HRESULT)
    reset : Proc(IEnumPortableDeviceObjectIDs*, HRESULT)
    clone : Proc(IEnumPortableDeviceObjectIDs*, IEnumPortableDeviceObjectIDs*, HRESULT)
    cancel : Proc(IEnumPortableDeviceObjectIDs*, HRESULT)
  end

  struct IEnumPortableDeviceObjectIDs
    lpVtbl : IEnumPortableDeviceObjectIDsVTbl*
  end

  struct IPortableDevicePropertiesVTbl
    query_interface : Proc(IPortableDeviceProperties*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPortableDeviceProperties*, UInt32)
    release : Proc(IPortableDeviceProperties*, UInt32)
    get_supported_properties : Proc(IPortableDeviceProperties*, LibC::LPWSTR, IPortableDeviceKeyCollection*, HRESULT)
    get_property_attributes : Proc(IPortableDeviceProperties*, LibC::LPWSTR, PROPERTYKEY*, IPortableDeviceValues*, HRESULT)
    get_values : Proc(IPortableDeviceProperties*, LibC::LPWSTR, IPortableDeviceKeyCollection, IPortableDeviceValues*, HRESULT)
    set_values : Proc(IPortableDeviceProperties*, LibC::LPWSTR, IPortableDeviceValues, IPortableDeviceValues*, HRESULT)
    delete : Proc(IPortableDeviceProperties*, LibC::LPWSTR, IPortableDeviceKeyCollection, HRESULT)
    cancel : Proc(IPortableDeviceProperties*, HRESULT)
  end

  struct IPortableDeviceProperties
    lpVtbl : IPortableDevicePropertiesVTbl*
  end

  struct IPortableDeviceResourcesVTbl
    query_interface : Proc(IPortableDeviceResources*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPortableDeviceResources*, UInt32)
    release : Proc(IPortableDeviceResources*, UInt32)
    get_supported_resources : Proc(IPortableDeviceResources*, LibC::LPWSTR, IPortableDeviceKeyCollection*, HRESULT)
    get_resource_attributes : Proc(IPortableDeviceResources*, LibC::LPWSTR, PROPERTYKEY*, IPortableDeviceValues*, HRESULT)
    get_stream : Proc(IPortableDeviceResources*, LibC::LPWSTR, PROPERTYKEY*, UInt32, UInt32*, IStream*, HRESULT)
    delete : Proc(IPortableDeviceResources*, LibC::LPWSTR, IPortableDeviceKeyCollection, HRESULT)
    cancel : Proc(IPortableDeviceResources*, HRESULT)
    create_resource : Proc(IPortableDeviceResources*, IPortableDeviceValues, IStream*, UInt32*, LibC::LPWSTR*, HRESULT)
  end

  struct IPortableDeviceResources
    lpVtbl : IPortableDeviceResourcesVTbl*
  end

  struct IPortableDeviceCapabilitiesVTbl
    query_interface : Proc(IPortableDeviceCapabilities*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPortableDeviceCapabilities*, UInt32)
    release : Proc(IPortableDeviceCapabilities*, UInt32)
    get_supported_commands : Proc(IPortableDeviceCapabilities*, IPortableDeviceKeyCollection*, HRESULT)
    get_command_options : Proc(IPortableDeviceCapabilities*, PROPERTYKEY*, IPortableDeviceValues*, HRESULT)
    get_functional_categories : Proc(IPortableDeviceCapabilities*, IPortableDevicePropVariantCollection*, HRESULT)
    get_functional_objects : Proc(IPortableDeviceCapabilities*, Guid*, IPortableDevicePropVariantCollection*, HRESULT)
    get_supported_content_types : Proc(IPortableDeviceCapabilities*, Guid*, IPortableDevicePropVariantCollection*, HRESULT)
    get_supported_formats : Proc(IPortableDeviceCapabilities*, Guid*, IPortableDevicePropVariantCollection*, HRESULT)
    get_supported_format_properties : Proc(IPortableDeviceCapabilities*, Guid*, IPortableDeviceKeyCollection*, HRESULT)
    get_fixed_property_attributes : Proc(IPortableDeviceCapabilities*, Guid*, PROPERTYKEY*, IPortableDeviceValues*, HRESULT)
    cancel : Proc(IPortableDeviceCapabilities*, HRESULT)
    get_supported_events : Proc(IPortableDeviceCapabilities*, IPortableDevicePropVariantCollection*, HRESULT)
    get_event_options : Proc(IPortableDeviceCapabilities*, Guid*, IPortableDeviceValues*, HRESULT)
  end

  struct IPortableDeviceCapabilities
    lpVtbl : IPortableDeviceCapabilitiesVTbl*
  end

  struct IPortableDeviceEventCallbackVTbl
    query_interface : Proc(IPortableDeviceEventCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPortableDeviceEventCallback*, UInt32)
    release : Proc(IPortableDeviceEventCallback*, UInt32)
    on_event : Proc(IPortableDeviceEventCallback*, IPortableDeviceValues, HRESULT)
  end

  struct IPortableDeviceEventCallback
    lpVtbl : IPortableDeviceEventCallbackVTbl*
  end

  struct IPortableDeviceDataStreamVTbl
    query_interface : Proc(IPortableDeviceDataStream*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPortableDeviceDataStream*, UInt32)
    release : Proc(IPortableDeviceDataStream*, UInt32)
    read : Proc(IPortableDeviceDataStream*, Void*, UInt32, UInt32*, HRESULT)
    write : Proc(IPortableDeviceDataStream*, Void*, UInt32, UInt32*, HRESULT)
    seek : Proc(IPortableDeviceDataStream*, LARGE_INTEGER, STREAM_SEEK, ULARGE_INTEGER*, HRESULT)
    set_size : Proc(IPortableDeviceDataStream*, ULARGE_INTEGER, HRESULT)
    copy_to : Proc(IPortableDeviceDataStream*, IStream, ULARGE_INTEGER, ULARGE_INTEGER*, ULARGE_INTEGER*, HRESULT)
    commit : Proc(IPortableDeviceDataStream*, UInt32, HRESULT)
    revert : Proc(IPortableDeviceDataStream*, HRESULT)
    lock_region : Proc(IPortableDeviceDataStream*, ULARGE_INTEGER, ULARGE_INTEGER, UInt32, HRESULT)
    unlock_region : Proc(IPortableDeviceDataStream*, ULARGE_INTEGER, ULARGE_INTEGER, UInt32, HRESULT)
    stat : Proc(IPortableDeviceDataStream*, STATSTG*, UInt32, HRESULT)
    clone : Proc(IPortableDeviceDataStream*, IStream*, HRESULT)
    get_object_id : Proc(IPortableDeviceDataStream*, LibC::LPWSTR*, HRESULT)
    cancel : Proc(IPortableDeviceDataStream*, HRESULT)
  end

  struct IPortableDeviceDataStream
    lpVtbl : IPortableDeviceDataStreamVTbl*
  end

  struct IPortableDeviceUnitsStreamVTbl
    query_interface : Proc(IPortableDeviceUnitsStream*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPortableDeviceUnitsStream*, UInt32)
    release : Proc(IPortableDeviceUnitsStream*, UInt32)
    seek_in_units : Proc(IPortableDeviceUnitsStream*, LARGE_INTEGER, WPD_STREAM_UNITS, UInt32, ULARGE_INTEGER*, HRESULT)
    cancel : Proc(IPortableDeviceUnitsStream*, HRESULT)
  end

  struct IPortableDeviceUnitsStream
    lpVtbl : IPortableDeviceUnitsStreamVTbl*
  end

  struct IPortableDevicePropertiesBulkVTbl
    query_interface : Proc(IPortableDevicePropertiesBulk*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPortableDevicePropertiesBulk*, UInt32)
    release : Proc(IPortableDevicePropertiesBulk*, UInt32)
    queue_get_values_by_object_list : Proc(IPortableDevicePropertiesBulk*, IPortableDevicePropVariantCollection, IPortableDeviceKeyCollection, IPortableDevicePropertiesBulkCallback, Guid*, HRESULT)
    queue_get_values_by_object_format : Proc(IPortableDevicePropertiesBulk*, Guid*, LibC::LPWSTR, UInt32, IPortableDeviceKeyCollection, IPortableDevicePropertiesBulkCallback, Guid*, HRESULT)
    queue_set_values_by_object_list : Proc(IPortableDevicePropertiesBulk*, IPortableDeviceValuesCollection, IPortableDevicePropertiesBulkCallback, Guid*, HRESULT)
    start : Proc(IPortableDevicePropertiesBulk*, Guid*, HRESULT)
    cancel : Proc(IPortableDevicePropertiesBulk*, Guid*, HRESULT)
  end

  struct IPortableDevicePropertiesBulk
    lpVtbl : IPortableDevicePropertiesBulkVTbl*
  end

  struct IPortableDevicePropertiesBulkCallbackVTbl
    query_interface : Proc(IPortableDevicePropertiesBulkCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPortableDevicePropertiesBulkCallback*, UInt32)
    release : Proc(IPortableDevicePropertiesBulkCallback*, UInt32)
    on_start : Proc(IPortableDevicePropertiesBulkCallback*, Guid*, HRESULT)
    on_progress : Proc(IPortableDevicePropertiesBulkCallback*, Guid*, IPortableDeviceValuesCollection, HRESULT)
    on_end : Proc(IPortableDevicePropertiesBulkCallback*, Guid*, HRESULT, HRESULT)
  end

  struct IPortableDevicePropertiesBulkCallback
    lpVtbl : IPortableDevicePropertiesBulkCallbackVTbl*
  end

  struct IPortableDeviceServiceManagerVTbl
    query_interface : Proc(IPortableDeviceServiceManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPortableDeviceServiceManager*, UInt32)
    release : Proc(IPortableDeviceServiceManager*, UInt32)
    get_device_services : Proc(IPortableDeviceServiceManager*, LibC::LPWSTR, Guid*, LibC::LPWSTR*, UInt32*, HRESULT)
    get_device_for_service : Proc(IPortableDeviceServiceManager*, LibC::LPWSTR, LibC::LPWSTR*, HRESULT)
  end

  struct IPortableDeviceServiceManager
    lpVtbl : IPortableDeviceServiceManagerVTbl*
  end

  struct IPortableDeviceServiceVTbl
    query_interface : Proc(IPortableDeviceService*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPortableDeviceService*, UInt32)
    release : Proc(IPortableDeviceService*, UInt32)
    open : Proc(IPortableDeviceService*, LibC::LPWSTR, IPortableDeviceValues, HRESULT)
    capabilities : Proc(IPortableDeviceService*, IPortableDeviceServiceCapabilities*, HRESULT)
    content : Proc(IPortableDeviceService*, IPortableDeviceContent2*, HRESULT)
    methods : Proc(IPortableDeviceService*, IPortableDeviceServiceMethods*, HRESULT)
    cancel : Proc(IPortableDeviceService*, HRESULT)
    close : Proc(IPortableDeviceService*, HRESULT)
    get_service_object_id : Proc(IPortableDeviceService*, LibC::LPWSTR*, HRESULT)
    get_pn_p_service_id : Proc(IPortableDeviceService*, LibC::LPWSTR*, HRESULT)
    advise : Proc(IPortableDeviceService*, UInt32, IPortableDeviceEventCallback, IPortableDeviceValues, LibC::LPWSTR*, HRESULT)
    unadvise : Proc(IPortableDeviceService*, LibC::LPWSTR, HRESULT)
    send_command : Proc(IPortableDeviceService*, UInt32, IPortableDeviceValues, IPortableDeviceValues*, HRESULT)
  end

  struct IPortableDeviceService
    lpVtbl : IPortableDeviceServiceVTbl*
  end

  struct IPortableDeviceServiceCapabilitiesVTbl
    query_interface : Proc(IPortableDeviceServiceCapabilities*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPortableDeviceServiceCapabilities*, UInt32)
    release : Proc(IPortableDeviceServiceCapabilities*, UInt32)
    get_supported_methods : Proc(IPortableDeviceServiceCapabilities*, IPortableDevicePropVariantCollection*, HRESULT)
    get_supported_methods_by_format : Proc(IPortableDeviceServiceCapabilities*, Guid*, IPortableDevicePropVariantCollection*, HRESULT)
    get_method_attributes : Proc(IPortableDeviceServiceCapabilities*, Guid*, IPortableDeviceValues*, HRESULT)
    get_method_parameter_attributes : Proc(IPortableDeviceServiceCapabilities*, Guid*, PROPERTYKEY*, IPortableDeviceValues*, HRESULT)
    get_supported_formats : Proc(IPortableDeviceServiceCapabilities*, IPortableDevicePropVariantCollection*, HRESULT)
    get_format_attributes : Proc(IPortableDeviceServiceCapabilities*, Guid*, IPortableDeviceValues*, HRESULT)
    get_supported_format_properties : Proc(IPortableDeviceServiceCapabilities*, Guid*, IPortableDeviceKeyCollection*, HRESULT)
    get_format_property_attributes : Proc(IPortableDeviceServiceCapabilities*, Guid*, PROPERTYKEY*, IPortableDeviceValues*, HRESULT)
    get_supported_events : Proc(IPortableDeviceServiceCapabilities*, IPortableDevicePropVariantCollection*, HRESULT)
    get_event_attributes : Proc(IPortableDeviceServiceCapabilities*, Guid*, IPortableDeviceValues*, HRESULT)
    get_event_parameter_attributes : Proc(IPortableDeviceServiceCapabilities*, Guid*, PROPERTYKEY*, IPortableDeviceValues*, HRESULT)
    get_inherited_services : Proc(IPortableDeviceServiceCapabilities*, UInt32, IPortableDevicePropVariantCollection*, HRESULT)
    get_format_rendering_profiles : Proc(IPortableDeviceServiceCapabilities*, Guid*, IPortableDeviceValuesCollection*, HRESULT)
    get_supported_commands : Proc(IPortableDeviceServiceCapabilities*, IPortableDeviceKeyCollection*, HRESULT)
    get_command_options : Proc(IPortableDeviceServiceCapabilities*, PROPERTYKEY*, IPortableDeviceValues*, HRESULT)
    cancel : Proc(IPortableDeviceServiceCapabilities*, HRESULT)
  end

  struct IPortableDeviceServiceCapabilities
    lpVtbl : IPortableDeviceServiceCapabilitiesVTbl*
  end

  struct IPortableDeviceServiceMethodsVTbl
    query_interface : Proc(IPortableDeviceServiceMethods*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPortableDeviceServiceMethods*, UInt32)
    release : Proc(IPortableDeviceServiceMethods*, UInt32)
    invoke : Proc(IPortableDeviceServiceMethods*, Guid*, IPortableDeviceValues, IPortableDeviceValues*, HRESULT)
    invoke_async : Proc(IPortableDeviceServiceMethods*, Guid*, IPortableDeviceValues, IPortableDeviceServiceMethodCallback, HRESULT)
    cancel : Proc(IPortableDeviceServiceMethods*, IPortableDeviceServiceMethodCallback, HRESULT)
  end

  struct IPortableDeviceServiceMethods
    lpVtbl : IPortableDeviceServiceMethodsVTbl*
  end

  struct IPortableDeviceServiceMethodCallbackVTbl
    query_interface : Proc(IPortableDeviceServiceMethodCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPortableDeviceServiceMethodCallback*, UInt32)
    release : Proc(IPortableDeviceServiceMethodCallback*, UInt32)
    on_complete : Proc(IPortableDeviceServiceMethodCallback*, HRESULT, IPortableDeviceValues, HRESULT)
  end

  struct IPortableDeviceServiceMethodCallback
    lpVtbl : IPortableDeviceServiceMethodCallbackVTbl*
  end

  struct IPortableDeviceServiceActivationVTbl
    query_interface : Proc(IPortableDeviceServiceActivation*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPortableDeviceServiceActivation*, UInt32)
    release : Proc(IPortableDeviceServiceActivation*, UInt32)
    open_async : Proc(IPortableDeviceServiceActivation*, LibC::LPWSTR, IPortableDeviceValues, IPortableDeviceServiceOpenCallback, HRESULT)
    cancel_open_async : Proc(IPortableDeviceServiceActivation*, HRESULT)
  end

  struct IPortableDeviceServiceActivation
    lpVtbl : IPortableDeviceServiceActivationVTbl*
  end

  struct IPortableDeviceServiceOpenCallbackVTbl
    query_interface : Proc(IPortableDeviceServiceOpenCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPortableDeviceServiceOpenCallback*, UInt32)
    release : Proc(IPortableDeviceServiceOpenCallback*, UInt32)
    on_complete : Proc(IPortableDeviceServiceOpenCallback*, HRESULT, HRESULT)
  end

  struct IPortableDeviceServiceOpenCallback
    lpVtbl : IPortableDeviceServiceOpenCallbackVTbl*
  end

  struct IPortableDeviceDispatchFactoryVTbl
    query_interface : Proc(IPortableDeviceDispatchFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPortableDeviceDispatchFactory*, UInt32)
    release : Proc(IPortableDeviceDispatchFactory*, UInt32)
    get_device_dispatch : Proc(IPortableDeviceDispatchFactory*, LibC::LPWSTR, IDispatch*, HRESULT)
  end

  struct IPortableDeviceDispatchFactory
    lpVtbl : IPortableDeviceDispatchFactoryVTbl*
  end

  struct IPortableDeviceWebControlVTbl
    query_interface : Proc(IPortableDeviceWebControl*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPortableDeviceWebControl*, UInt32)
    release : Proc(IPortableDeviceWebControl*, UInt32)
    get_type_info_count : Proc(IPortableDeviceWebControl*, UInt32*, HRESULT)
    get_type_info : Proc(IPortableDeviceWebControl*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IPortableDeviceWebControl*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IPortableDeviceWebControl*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_device_from_id : Proc(IPortableDeviceWebControl*, UInt8*, IDispatch*, HRESULT)
    get_device_from_id_async : Proc(IPortableDeviceWebControl*, UInt8*, IDispatch, IDispatch, HRESULT)
  end

  struct IPortableDeviceWebControl
    lpVtbl : IPortableDeviceWebControlVTbl*
  end

  struct IEnumPortableDeviceConnectorsVTbl
    query_interface : Proc(IEnumPortableDeviceConnectors*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumPortableDeviceConnectors*, UInt32)
    release : Proc(IEnumPortableDeviceConnectors*, UInt32)
    next : Proc(IEnumPortableDeviceConnectors*, UInt32, IPortableDeviceConnector*, UInt32*, HRESULT)
    skip : Proc(IEnumPortableDeviceConnectors*, UInt32, HRESULT)
    reset : Proc(IEnumPortableDeviceConnectors*, HRESULT)
    clone : Proc(IEnumPortableDeviceConnectors*, IEnumPortableDeviceConnectors*, HRESULT)
  end

  struct IEnumPortableDeviceConnectors
    lpVtbl : IEnumPortableDeviceConnectorsVTbl*
  end

  struct IPortableDeviceConnectorVTbl
    query_interface : Proc(IPortableDeviceConnector*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPortableDeviceConnector*, UInt32)
    release : Proc(IPortableDeviceConnector*, UInt32)
    connect : Proc(IPortableDeviceConnector*, IConnectionRequestCallback, HRESULT)
    disconnect : Proc(IPortableDeviceConnector*, IConnectionRequestCallback, HRESULT)
    cancel : Proc(IPortableDeviceConnector*, IConnectionRequestCallback, HRESULT)
    get_property : Proc(IPortableDeviceConnector*, DEVPROPKEY*, UInt32*, UInt8**, UInt32*, HRESULT)
    set_property : Proc(IPortableDeviceConnector*, DEVPROPKEY*, UInt32, UInt8*, UInt32, HRESULT)
    get_pn_pid : Proc(IPortableDeviceConnector*, LibC::LPWSTR*, HRESULT)
  end

  struct IPortableDeviceConnector
    lpVtbl : IPortableDeviceConnectorVTbl*
  end

  struct IConnectionRequestCallbackVTbl
    query_interface : Proc(IConnectionRequestCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IConnectionRequestCallback*, UInt32)
    release : Proc(IConnectionRequestCallback*, UInt32)
    on_complete : Proc(IConnectionRequestCallback*, HRESULT, HRESULT)
  end

  struct IConnectionRequestCallback
    lpVtbl : IConnectionRequestCallbackVTbl*
  end

  struct IMediaRadioManagerVTbl
    query_interface : Proc(IMediaRadioManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMediaRadioManager*, UInt32)
    release : Proc(IMediaRadioManager*, UInt32)
    get_radio_instances : Proc(IMediaRadioManager*, IRadioInstanceCollection*, HRESULT)
    on_system_radio_state_change : Proc(IMediaRadioManager*, SYSTEM_RADIO_STATE, UInt32, HRESULT)
  end

  struct IMediaRadioManager
    lpVtbl : IMediaRadioManagerVTbl*
  end

  struct IRadioInstanceCollectionVTbl
    query_interface : Proc(IRadioInstanceCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRadioInstanceCollection*, UInt32)
    release : Proc(IRadioInstanceCollection*, UInt32)
    get_count : Proc(IRadioInstanceCollection*, UInt32*, HRESULT)
    get_at : Proc(IRadioInstanceCollection*, UInt32, IRadioInstance*, HRESULT)
  end

  struct IRadioInstanceCollection
    lpVtbl : IRadioInstanceCollectionVTbl*
  end

  struct IRadioInstanceVTbl
    query_interface : Proc(IRadioInstance*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRadioInstance*, UInt32)
    release : Proc(IRadioInstance*, UInt32)
    get_radio_manager_signature : Proc(IRadioInstance*, Guid*, HRESULT)
    get_instance_signature : Proc(IRadioInstance*, UInt8**, HRESULT)
    get_friendly_name : Proc(IRadioInstance*, UInt32, UInt8**, HRESULT)
    get_radio_state : Proc(IRadioInstance*, DEVICE_RADIO_STATE*, HRESULT)
    set_radio_state : Proc(IRadioInstance*, DEVICE_RADIO_STATE, UInt32, HRESULT)
    is_multi_comm : Proc(IRadioInstance*, LibC::BOOL)
    is_associating_device : Proc(IRadioInstance*, LibC::BOOL)
  end

  struct IRadioInstance
    lpVtbl : IRadioInstanceVTbl*
  end

  struct IMediaRadioManagerNotifySinkVTbl
    query_interface : Proc(IMediaRadioManagerNotifySink*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMediaRadioManagerNotifySink*, UInt32)
    release : Proc(IMediaRadioManagerNotifySink*, UInt32)
    on_instance_add : Proc(IMediaRadioManagerNotifySink*, IRadioInstance, HRESULT)
    on_instance_remove : Proc(IMediaRadioManagerNotifySink*, UInt8*, HRESULT)
    on_instance_radio_change : Proc(IMediaRadioManagerNotifySink*, UInt8*, DEVICE_RADIO_STATE, HRESULT)
  end

  struct IMediaRadioManagerNotifySink
    lpVtbl : IMediaRadioManagerNotifySinkVTbl*
  end


  # Params # pszxmlin : LibC::LPWSTR [In],rgszallowedcspnodes : LibC::LPWSTR* [In],dwnumallowedcspnodes : UInt32 [In],pbstrxmlout : UInt8** [In]
  fun DMProcessConfigXMLFiltered(pszxmlin : LibC::LPWSTR, rgszallowedcspnodes : LibC::LPWSTR*, dwnumallowedcspnodes : UInt32, pbstrxmlout : UInt8**) : HRESULT
end
