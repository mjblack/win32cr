require "./../foundation.cr"
require "./../system/com.cr"
require "./../devices/portable_devices.cr"

module Win32cr::Storage::EnhancedStorage
  GUID_DEVINTERFACE_ENHANCED_STORAGE_SILO = "3897f6a4-fd35-4bc8-a0b7-5dbba36adafa"
  WPD_CATEGORY_ENHANCED_STORAGE = "91248166-b832-4ad4-baa4-7ca0b6b2798c"
  ENHANCED_STORAGE_COMMAND_SILO_IS_AUTHENTICATION_SILO = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 6_u32)
  ENHANCED_STORAGE_COMMAND_SILO_GET_AUTHENTICATION_STATE = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 7_u32)
  ENHANCED_STORAGE_COMMAND_SILO_ENUMERATE_SILOS = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 11_u32)
  ENHANCED_STORAGE_COMMAND_CERT_HOST_CERTIFICATE_AUTHENTICATION = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 101_u32)
  ENHANCED_STORAGE_COMMAND_CERT_DEVICE_CERTIFICATE_AUTHENTICATION = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 102_u32)
  ENHANCED_STORAGE_COMMAND_CERT_ADMIN_CERTIFICATE_AUTHENTICATION = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 103_u32)
  ENHANCED_STORAGE_COMMAND_CERT_INITIALIZE_TO_MANUFACTURER_STATE = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 104_u32)
  ENHANCED_STORAGE_COMMAND_CERT_GET_CERTIFICATE_COUNT = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 105_u32)
  ENHANCED_STORAGE_COMMAND_CERT_GET_CERTIFICATE = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 106_u32)
  ENHANCED_STORAGE_COMMAND_CERT_SET_CERTIFICATE = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 107_u32)
  ENHANCED_STORAGE_COMMAND_CERT_CREATE_CERTIFICATE_REQUEST = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 108_u32)
  ENHANCED_STORAGE_COMMAND_CERT_UNAUTHENTICATION = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 110_u32)
  ENHANCED_STORAGE_COMMAND_CERT_GET_SILO_CAPABILITY = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 111_u32)
  ENHANCED_STORAGE_COMMAND_CERT_GET_SILO_CAPABILITIES = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 112_u32)
  ENHANCED_STORAGE_COMMAND_CERT_GET_ACT_FRIENDLY_NAME = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 113_u32)
  ENHANCED_STORAGE_COMMAND_CERT_GET_SILO_GUID = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 114_u32)
  ENHANCED_STORAGE_COMMAND_PASSWORD_AUTHORIZE_ACT_ACCESS = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 203_u32)
  ENHANCED_STORAGE_COMMAND_PASSWORD_UNAUTHORIZE_ACT_ACCESS = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 204_u32)
  ENHANCED_STORAGE_COMMAND_PASSWORD_QUERY_INFORMATION = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 205_u32)
  ENHANCED_STORAGE_COMMAND_PASSWORD_CONFIG_ADMINISTRATOR = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 206_u32)
  ENHANCED_STORAGE_COMMAND_PASSWORD_CREATE_USER = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 207_u32)
  ENHANCED_STORAGE_COMMAND_PASSWORD_DELETE_USER = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 208_u32)
  ENHANCED_STORAGE_COMMAND_PASSWORD_CHANGE_PASSWORD = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 209_u32)
  ENHANCED_STORAGE_COMMAND_PASSWORD_INITIALIZE_USER_PASSWORD = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 210_u32)
  ENHANCED_STORAGE_COMMAND_PASSWORD_START_INITIALIZE_TO_MANUFACTURER_STATE = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 211_u32)
  ENHANCED_STORAGE_PROPERTY_AUTHENTICATION_STATE = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 1006_u32)
  ENHANCED_STORAGE_AUTHN_STATE_UNKNOWN = 0_u32
  ENHANCED_STORAGE_AUTHN_STATE_NO_AUTHENTICATION_REQUIRED = 1_u32
  ENHANCED_STORAGE_AUTHN_STATE_NOT_AUTHENTICATED = 2_u32
  ENHANCED_STORAGE_AUTHN_STATE_AUTHENTICATED = 3_u32
  ENHANCED_STORAGE_AUTHN_STATE_AUTHENTICATION_DENIED = 2147483649_u32
  ENHANCED_STORAGE_AUTHN_STATE_DEVICE_ERROR = 2147483650_u32
  ENHANCED_STORAGE_PROPERTY_IS_AUTHENTICATION_SILO = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 1009_u32)
  ENHANCED_STORAGE_PROPERTY_TEMPORARY_UNAUTHENTICATION = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 1010_u32)
  ENHANCED_STORAGE_PROPERTY_MAX_AUTH_FAILURES = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 2001_u32)
  ENHANCED_STORAGE_PROPERTY_PASSWORD = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 2004_u32)
  ENHANCED_STORAGE_PROPERTY_OLD_PASSWORD = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 2005_u32)
  ENHANCED_STORAGE_PROPERTY_PASSWORD_INDICATOR = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 2006_u32)
  ENHANCED_STORAGE_PROPERTY_NEW_PASSWORD_INDICATOR = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 2007_u32)
  ENHANCED_STORAGE_PROPERTY_NEW_PASSWORD = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 2008_u32)
  ENHANCED_STORAGE_PROPERTY_USER_HINT = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 2009_u32)
  ENHANCED_STORAGE_PROPERTY_USER_NAME = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 2010_u32)
  ENHANCED_STORAGE_PROPERTY_ADMIN_HINT = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 2011_u32)
  ENHANCED_STORAGE_PROPERTY_SILO_NAME = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 2012_u32)
  ENHANCED_STORAGE_PROPERTY_SILO_FRIENDLYNAME_SPECIFIED = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 2013_u32)
  ENHANCED_STORAGE_PROPERTY_PASSWORD_SILO_INFO = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 2014_u32)
  ENHANCED_STORAGE_PROPERTY_SECURITY_IDENTIFIER = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 2015_u32)
  ENHANCED_STORAGE_PROPERTY_QUERY_SILO_TYPE = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 2016_u32)
  ENHANCED_STORAGE_PROPERTY_QUERY_SILO_RESULTS = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 2017_u32)
  ENHANCED_STORAGE_PROPERTY_MAX_CERTIFICATE_COUNT = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 3001_u32)
  ENHANCED_STORAGE_PROPERTY_STORED_CERTIFICATE_COUNT = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 3002_u32)
  ENHANCED_STORAGE_PROPERTY_CERTIFICATE_INDEX = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 3003_u32)
  ENHANCED_STORAGE_PROPERTY_CERTIFICATE_TYPE = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 3004_u32)
  CERT_TYPE_EMPTY = 0_u32
  CERT_TYPE_ASCm = 1_u32
  CERT_TYPE_PCp = 2_u32
  CERT_TYPE_ASCh = 3_u32
  CERT_TYPE_HCh = 4_u32
  CERT_TYPE_SIGNER = 6_u32
  ENHANCED_STORAGE_PROPERTY_VALIDATION_POLICY = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 3005_u32)
  CERT_VALIDATION_POLICY_RESERVED = 0_u32
  CERT_VALIDATION_POLICY_NONE = 1_u32
  CERT_VALIDATION_POLICY_BASIC = 2_u32
  CERT_VALIDATION_POLICY_EXTENDED = 3_u32
  ENHANCED_STORAGE_PROPERTY_NEXT_CERTIFICATE_INDEX = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 3006_u32)
  ENHANCED_STORAGE_PROPERTY_NEXT_CERTIFICATE_OF_TYPE_INDEX = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 3007_u32)
  ENHANCED_STORAGE_PROPERTY_CERTIFICATE_LENGTH = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 3008_u32)
  ENHANCED_STORAGE_PROPERTY_CERTIFICATE = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 3009_u32)
  ENHANCED_STORAGE_PROPERTY_CERTIFICATE_REQUEST = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 3010_u32)
  ENHANCED_STORAGE_PROPERTY_CERTIFICATE_CAPABILITY_TYPE = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 3011_u32)
  ENHANCED_STORAGE_PROPERTY_CERTIFICATE_SILO_CAPABILITY = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 3012_u32)
  ENHANCED_STORAGE_PROPERTY_CERTIFICATE_SILO_CAPABILITIES = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 3013_u32)
  CERT_CAPABILITY_HASH_ALG = 1_u32
  CERT_CAPABILITY_ASYMMETRIC_KEY_CRYPTOGRAPHY = 2_u32
  CERT_CAPABILITY_SIGNATURE_ALG = 3_u32
  CERT_CAPABILITY_CERTIFICATE_SUPPORT = 4_u32
  CERT_CAPABILITY_OPTIONAL_FEATURES = 5_u32
  CERT_MAX_CAPABILITY = 255_u32
  CERT_RSA_1024_OID = "1.2.840.113549.1.1.1,1024"
  CERT_RSA_2048_OID = "1.2.840.113549.1.1.1,2048"
  CERT_RSA_3072_OID = "1.2.840.113549.1.1.1,3072"
  CERT_RSASSA_PSS_SHA1_OID = "1.2.840.113549.1.1.10,1.3.14.3.2.26"
  CERT_RSASSA_PSS_SHA256_OID = "1.2.840.113549.1.1.10,2.16.840.1.101.3.4.2.1"
  CERT_RSASSA_PSS_SHA384_OID = "1.2.840.113549.1.1.10,2.16.840.1.101.3.4.2.2"
  CERT_RSASSA_PSS_SHA512_OID = "1.2.840.113549.1.1.10,2.16.840.1.101.3.4.2.3"
  ENHANCED_STORAGE_PROPERTY_CERTIFICATE_ACT_FRIENDLY_NAME = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 3014_u32)
  ENHANCED_STORAGE_PROPERTY_CERTIFICATE_SILO_GUID = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 3015_u32)
  ENHANCED_STORAGE_PROPERTY_SIGNER_CERTIFICATE_INDEX = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 3016_u32)
  ENHANCED_STORAGE_CAPABILITY_HASH_ALGS = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 4001_u32)
  ENHANCED_STORAGE_CAPABILITY_ASYMMETRIC_KEY_CRYPTOGRAPHY = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 4002_u32)
  ENHANCED_STORAGE_CAPABILITY_SIGNING_ALGS = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 4003_u32)
  ENHANCED_STORAGE_CAPABILITY_RENDER_USER_DATA_UNUSABLE = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 4004_u32)
  ENHANCED_STORAGE_CAPABILITY_CERTIFICATE_EXTENSION_PARSING = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 4005_u32)
  PKEY_Address_Country = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc07b4199_u32, 0xe1df_u16, 0x4493_u16, StaticArray[0xb1_u8, 0xe1_u8, 0xde_u8, 0x59_u8, 0x46_u8, 0xfb_u8, 0x58_u8, 0xf8_u8]), 100_u32)
  PKEY_Address_CountryCode = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc07b4199_u32, 0xe1df_u16, 0x4493_u16, StaticArray[0xb1_u8, 0xe1_u8, 0xde_u8, 0x59_u8, 0x46_u8, 0xfb_u8, 0x58_u8, 0xf8_u8]), 101_u32)
  PKEY_Address_Region = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc07b4199_u32, 0xe1df_u16, 0x4493_u16, StaticArray[0xb1_u8, 0xe1_u8, 0xde_u8, 0x59_u8, 0x46_u8, 0xfb_u8, 0x58_u8, 0xf8_u8]), 102_u32)
  PKEY_Address_RegionCode = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc07b4199_u32, 0xe1df_u16, 0x4493_u16, StaticArray[0xb1_u8, 0xe1_u8, 0xde_u8, 0x59_u8, 0x46_u8, 0xfb_u8, 0x58_u8, 0xf8_u8]), 103_u32)
  PKEY_Address_Town = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc07b4199_u32, 0xe1df_u16, 0x4493_u16, StaticArray[0xb1_u8, 0xe1_u8, 0xde_u8, 0x59_u8, 0x46_u8, 0xfb_u8, 0x58_u8, 0xf8_u8]), 104_u32)
  PKEY_Audio_ChannelCount = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440490_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 7_u32)
  AUDIO_CHANNELCOUNT_MONO = 1_u32
  AUDIO_CHANNELCOUNT_STEREO = 2_u32
  PKEY_Audio_Compression = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440490_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 10_u32)
  PKEY_Audio_EncodingBitrate = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440490_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 4_u32)
  PKEY_Audio_Format = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440490_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 2_u32)
  PKEY_Audio_IsVariableBitRate = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xe6822fee_u32, 0x8c17_u16, 0x4d62_u16, StaticArray[0x82_u8, 0x3c_u8, 0x8e_u8, 0x9c_u8, 0xfc_u8, 0xbd_u8, 0x1d_u8, 0x5c_u8]), 100_u32)
  PKEY_Audio_PeakValue = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x2579e5d0_u32, 0x1116_u16, 0x4084_u16, StaticArray[0xbd_u8, 0x9a_u8, 0x9b_u8, 0x4f_u8, 0x7c_u8, 0xb4_u8, 0xdf_u8, 0x5e_u8]), 100_u32)
  PKEY_Audio_SampleRate = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440490_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 5_u32)
  PKEY_Audio_SampleSize = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440490_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 6_u32)
  PKEY_Audio_StreamName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440490_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 9_u32)
  PKEY_Audio_StreamNumber = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440490_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 8_u32)
  PKEY_Calendar_Duration = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x293ca35a_u32, 0x9aa_u16, 0x4dd2_u16, StaticArray[0xb1_u8, 0x80_u8, 0x1f_u8, 0xe2_u8, 0x45_u8, 0x72_u8, 0x8a_u8, 0x52_u8]), 100_u32)
  PKEY_Calendar_IsOnline = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xbfee9149_u32, 0xe3e2_u16, 0x49a7_u16, StaticArray[0xa8_u8, 0x62_u8, 0xc0_u8, 0x59_u8, 0x88_u8, 0x14_u8, 0x5c_u8, 0xec_u8]), 100_u32)
  PKEY_Calendar_IsRecurring = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x315b9c8d_u32, 0x80a9_u16, 0x4ef9_u16, StaticArray[0xae_u8, 0x16_u8, 0x8e_u8, 0x74_u8, 0x6d_u8, 0xa5_u8, 0x1d_u8, 0x70_u8]), 100_u32)
  PKEY_Calendar_Location = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf6272d18_u32, 0xcecc_u16, 0x40b1_u16, StaticArray[0xb2_u8, 0x6a_u8, 0x39_u8, 0x11_u8, 0x71_u8, 0x7a_u8, 0xa7_u8, 0xbd_u8]), 100_u32)
  PKEY_Calendar_OptionalAttendeeAddresses = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd55bae5a_u32, 0x3892_u16, 0x417a_u16, StaticArray[0xa6_u8, 0x49_u8, 0xc6_u8, 0xac_u8, 0x5a_u8, 0xaa_u8, 0xea_u8, 0xb3_u8]), 100_u32)
  PKEY_Calendar_OptionalAttendeeNames = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x9429607_u32, 0x582d_u16, 0x437f_u16, StaticArray[0x84_u8, 0xc3_u8, 0xde_u8, 0x93_u8, 0xa2_u8, 0xb2_u8, 0x4c_u8, 0x3c_u8]), 100_u32)
  PKEY_Calendar_OrganizerAddress = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x744c8242_u32, 0x4df5_u16, 0x456c_u16, StaticArray[0xab_u8, 0x9e_u8, 0x1_u8, 0x4e_u8, 0xfb_u8, 0x90_u8, 0x21_u8, 0xe3_u8]), 100_u32)
  PKEY_Calendar_OrganizerName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xaaa660f9_u32, 0x9865_u16, 0x458e_u16, StaticArray[0xb4_u8, 0x84_u8, 0x1_u8, 0xbc_u8, 0x7f_u8, 0xe3_u8, 0x97_u8, 0x3e_u8]), 100_u32)
  PKEY_Calendar_ReminderTime = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x72fc5ba4_u32, 0x24f9_u16, 0x4011_u16, StaticArray[0x9f_u8, 0x3f_u8, 0xad_u8, 0xd2_u8, 0x7a_u8, 0xfa_u8, 0xd8_u8, 0x18_u8]), 100_u32)
  PKEY_Calendar_RequiredAttendeeAddresses = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xba7d6c3_u32, 0x568d_u16, 0x4159_u16, StaticArray[0xab_u8, 0x91_u8, 0x78_u8, 0x1a_u8, 0x91_u8, 0xfb_u8, 0x71_u8, 0xe5_u8]), 100_u32)
  PKEY_Calendar_RequiredAttendeeNames = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb33af30b_u32, 0xf552_u16, 0x4584_u16, StaticArray[0x93_u8, 0x6c_u8, 0xcb_u8, 0x93_u8, 0xe5_u8, 0xcd_u8, 0xa2_u8, 0x9f_u8]), 100_u32)
  PKEY_Calendar_Resources = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf58a38_u32, 0xc54b_u16, 0x4c40_u16, StaticArray[0x86_u8, 0x96_u8, 0x97_u8, 0x23_u8, 0x59_u8, 0x80_u8, 0xea_u8, 0xe1_u8]), 100_u32)
  PKEY_Calendar_ResponseStatus = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x188c1f91_u32, 0x3c40_u16, 0x4132_u16, StaticArray[0x9e_u8, 0xc5_u8, 0xd8_u8, 0xb0_u8, 0x3b_u8, 0x72_u8, 0xa8_u8, 0xa2_u8]), 100_u32)
  PKEY_Calendar_ShowTimeAs = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x5bf396d4_u32, 0x5eb2_u16, 0x466f_u16, StaticArray[0xbd_u8, 0xe9_u8, 0x2f_u8, 0xb3_u8, 0xf2_u8, 0x36_u8, 0x1d_u8, 0x6e_u8]), 100_u32)
  PKEY_Calendar_ShowTimeAsText = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x53da57cf_u32, 0x62c0_u16, 0x45c4_u16, StaticArray[0x81_u8, 0xde_u8, 0x76_u8, 0x10_u8, 0xbc_u8, 0xef_u8, 0xd7_u8, 0xf5_u8]), 100_u32)
  PKEY_Communication_AccountName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xe3e0584c_u32, 0xb788_u16, 0x4a5a_u16, StaticArray[0xbb_u8, 0x20_u8, 0x7f_u8, 0x5a_u8, 0x44_u8, 0xc9_u8, 0xac_u8, 0xdd_u8]), 9_u32)
  PKEY_Communication_DateItemExpires = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x428040ac_u32, 0xa177_u16, 0x4c8a_u16, StaticArray[0x97_u8, 0x60_u8, 0xf6_u8, 0xf7_u8, 0x61_u8, 0x22_u8, 0x7f_u8, 0x9a_u8]), 100_u32)
  PKEY_Communication_Direction = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8e531030_u32, 0xb960_u16, 0x4346_u16, StaticArray[0xae_u8, 0xd_u8, 0x66_u8, 0xbc_u8, 0x9a_u8, 0x86_u8, 0xfb_u8, 0x94_u8]), 100_u32)
  PKEY_Communication_FollowupIconIndex = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x83a6347e_u32, 0x6fe4_u16, 0x4f40_u16, StaticArray[0xba_u8, 0x9c_u8, 0xc4_u8, 0x86_u8, 0x52_u8, 0x40_u8, 0xd1_u8, 0xf4_u8]), 100_u32)
  PKEY_Communication_HeaderItem = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc9c34f84_u32, 0x2241_u16, 0x4401_u16, StaticArray[0xb6_u8, 0x7_u8, 0xbd_u8, 0x20_u8, 0xed_u8, 0x75_u8, 0xae_u8, 0x7f_u8]), 100_u32)
  PKEY_Communication_PolicyTag = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xec0b4191_u32, 0xab0b_u16, 0x4c66_u16, StaticArray[0x90_u8, 0xb6_u8, 0xc6_u8, 0x63_u8, 0x7c_u8, 0xde_u8, 0xbb_u8, 0xab_u8]), 100_u32)
  PKEY_Communication_SecurityFlags = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8619a4b6_u32, 0x9f4d_u16, 0x4429_u16, StaticArray[0x8c_u8, 0xf_u8, 0xb9_u8, 0x96_u8, 0xca_u8, 0x59_u8, 0xe3_u8, 0x35_u8]), 100_u32)
  PKEY_Communication_Suffix = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x807b653a_u32, 0x9e91_u16, 0x43ef_u16, StaticArray[0x8f_u8, 0x97_u8, 0x11_u8, 0xce_u8, 0x4_u8, 0xee_u8, 0x20_u8, 0xc5_u8]), 100_u32)
  PKEY_Communication_TaskStatus = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xbe1a72c6_u32, 0x9a1d_u16, 0x46b7_u16, StaticArray[0xaf_u8, 0xe7_u8, 0xaf_u8, 0xaf_u8, 0x8c_u8, 0xef_u8, 0x49_u8, 0x99_u8]), 100_u32)
  PKEY_Communication_TaskStatusText = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa6744477_u32, 0xc237_u16, 0x475b_u16, StaticArray[0xa0_u8, 0x75_u8, 0x54_u8, 0xf3_u8, 0x44_u8, 0x98_u8, 0x29_u8, 0x2a_u8]), 100_u32)
  PKEY_Computer_DecoratedFreeSpace = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x9b174b35_u32, 0x40ff_u16, 0x11d2_u16, StaticArray[0xa2_u8, 0x7e_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc3_u8, 0x8_u8, 0x71_u8]), 7_u32)
  PKEY_Contact_AccountPictureDynamicVideo = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb8bb018_u32, 0x2725_u16, 0x4b44_u16, StaticArray[0x92_u8, 0xba_u8, 0x79_u8, 0x33_u8, 0xae_u8, 0xb2_u8, 0xdd_u8, 0xe7_u8]), 2_u32)
  PKEY_Contact_AccountPictureLarge = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb8bb018_u32, 0x2725_u16, 0x4b44_u16, StaticArray[0x92_u8, 0xba_u8, 0x79_u8, 0x33_u8, 0xae_u8, 0xb2_u8, 0xdd_u8, 0xe7_u8]), 3_u32)
  PKEY_Contact_AccountPictureSmall = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb8bb018_u32, 0x2725_u16, 0x4b44_u16, StaticArray[0x92_u8, 0xba_u8, 0x79_u8, 0x33_u8, 0xae_u8, 0xb2_u8, 0xdd_u8, 0xe7_u8]), 4_u32)
  PKEY_Contact_Anniversary = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x9ad5badb_u32, 0xcea7_u16, 0x4470_u16, StaticArray[0xa0_u8, 0x3d_u8, 0xb8_u8, 0x4e_u8, 0x51_u8, 0xb9_u8, 0x94_u8, 0x9e_u8]), 100_u32)
  PKEY_Contact_AssistantName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xcd102c9c_u32, 0x5540_u16, 0x4a88_u16, StaticArray[0xa6_u8, 0xf6_u8, 0x64_u8, 0xe4_u8, 0x98_u8, 0x1c_u8, 0x8c_u8, 0xd1_u8]), 100_u32)
  PKEY_Contact_AssistantTelephone = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x9a93244d_u32, 0xa7ad_u16, 0x4ff8_u16, StaticArray[0x9b_u8, 0x99_u8, 0x45_u8, 0xee_u8, 0x4c_u8, 0xc0_u8, 0x9a_u8, 0xf6_u8]), 100_u32)
  PKEY_Contact_Birthday = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x176dc63c_u32, 0x2688_u16, 0x4e89_u16, StaticArray[0x81_u8, 0x43_u8, 0xa3_u8, 0x47_u8, 0x80_u8, 0xf_u8, 0x25_u8, 0xe9_u8]), 47_u32)
  PKEY_Contact_BusinessAddress = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x730fb6dd_u32, 0xcf7c_u16, 0x426b_u16, StaticArray[0xa0_u8, 0x3f_u8, 0xbd_u8, 0x16_u8, 0x6c_u8, 0xc9_u8, 0xee_u8, 0x24_u8]), 100_u32)
  PKEY_Contact_BusinessAddress1Country = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 119_u32)
  PKEY_Contact_BusinessAddress1Locality = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 117_u32)
  PKEY_Contact_BusinessAddress1PostalCode = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 120_u32)
  PKEY_Contact_BusinessAddress1Region = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 118_u32)
  PKEY_Contact_BusinessAddress1Street = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 116_u32)
  PKEY_Contact_BusinessAddress2Country = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 124_u32)
  PKEY_Contact_BusinessAddress2Locality = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 122_u32)
  PKEY_Contact_BusinessAddress2PostalCode = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 125_u32)
  PKEY_Contact_BusinessAddress2Region = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 123_u32)
  PKEY_Contact_BusinessAddress2Street = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 121_u32)
  PKEY_Contact_BusinessAddress3Country = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 129_u32)
  PKEY_Contact_BusinessAddress3Locality = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 127_u32)
  PKEY_Contact_BusinessAddress3PostalCode = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 130_u32)
  PKEY_Contact_BusinessAddress3Region = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 128_u32)
  PKEY_Contact_BusinessAddress3Street = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 126_u32)
  PKEY_Contact_BusinessAddressCity = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x402b5934_u32, 0xec5a_u16, 0x48c3_u16, StaticArray[0x93_u8, 0xe6_u8, 0x85_u8, 0xe8_u8, 0x6a_u8, 0x2d_u8, 0x93_u8, 0x4e_u8]), 100_u32)
  PKEY_Contact_BusinessAddressCountry = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb0b87314_u32, 0xfcf6_u16, 0x4feb_u16, StaticArray[0x8d_u8, 0xff_u8, 0xa5_u8, 0xd_u8, 0xa6_u8, 0xaf_u8, 0x56_u8, 0x1c_u8]), 100_u32)
  PKEY_Contact_BusinessAddressPostalCode = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xe1d4a09e_u32, 0xd758_u16, 0x4cd1_u16, StaticArray[0xb6_u8, 0xec_u8, 0x34_u8, 0xa8_u8, 0xb5_u8, 0xa7_u8, 0x3f_u8, 0x80_u8]), 100_u32)
  PKEY_Contact_BusinessAddressPostOfficeBox = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xbc4e71ce_u32, 0x17f9_u16, 0x48d5_u16, StaticArray[0xbe_u8, 0xe9_u8, 0x2_u8, 0x1d_u8, 0xf0_u8, 0xea_u8, 0x54_u8, 0x9_u8]), 100_u32)
  PKEY_Contact_BusinessAddressState = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x446f787f_u32, 0x10c4_u16, 0x41cb_u16, StaticArray[0xa6_u8, 0xc4_u8, 0x4d_u8, 0x3_u8, 0x43_u8, 0x55_u8, 0x15_u8, 0x97_u8]), 100_u32)
  PKEY_Contact_BusinessAddressStreet = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xddd1460f_u32, 0xc0bf_u16, 0x4553_u16, StaticArray[0x8c_u8, 0xe4_u8, 0x10_u8, 0x43_u8, 0x3c_u8, 0x90_u8, 0x8f_u8, 0xb0_u8]), 100_u32)
  PKEY_Contact_BusinessEmailAddresses = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf271c659_u32, 0x7e5e_u16, 0x471f_u16, StaticArray[0xba_u8, 0x25_u8, 0x7f_u8, 0x77_u8, 0xb2_u8, 0x86_u8, 0xf8_u8, 0x36_u8]), 100_u32)
  PKEY_Contact_BusinessFaxNumber = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x91eff6f3_u32, 0x2e27_u16, 0x42ca_u16, StaticArray[0x93_u8, 0x3e_u8, 0x7c_u8, 0x99_u8, 0x9f_u8, 0xbe_u8, 0x31_u8, 0xb_u8]), 100_u32)
  PKEY_Contact_BusinessHomePage = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x56310920_u32, 0x2491_u16, 0x4919_u16, StaticArray[0x99_u8, 0xce_u8, 0xea_u8, 0xdb_u8, 0x6_u8, 0xfa_u8, 0xfd_u8, 0xb2_u8]), 100_u32)
  PKEY_Contact_BusinessTelephone = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6a15e5a0_u32, 0xa1e_u16, 0x4cd7_u16, StaticArray[0xbb_u8, 0x8c_u8, 0xd2_u8, 0xf1_u8, 0xb0_u8, 0xc9_u8, 0x29_u8, 0xbc_u8]), 100_u32)
  PKEY_Contact_CallbackTelephone = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xbf53d1c3_u32, 0x49e0_u16, 0x4f7f_u16, StaticArray[0x85_u8, 0x67_u8, 0x5a_u8, 0x82_u8, 0x1d_u8, 0x8a_u8, 0xc5_u8, 0x42_u8]), 100_u32)
  PKEY_Contact_CarTelephone = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8fdc6dea_u32, 0xb929_u16, 0x412b_u16, StaticArray[0xba_u8, 0x90_u8, 0x39_u8, 0x7a_u8, 0x25_u8, 0x74_u8, 0x65_u8, 0xfe_u8]), 100_u32)
  PKEY_Contact_Children = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd4729704_u32, 0x8ef1_u16, 0x43ef_u16, StaticArray[0x90_u8, 0x24_u8, 0x2b_u8, 0xd3_u8, 0x81_u8, 0x18_u8, 0x7f_u8, 0xd5_u8]), 100_u32)
  PKEY_Contact_CompanyMainTelephone = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8589e481_u32, 0x6040_u16, 0x473d_u16, StaticArray[0xb1_u8, 0x71_u8, 0x7f_u8, 0xa8_u8, 0x9c_u8, 0x27_u8, 0x8_u8, 0xed_u8]), 100_u32)
  PKEY_Contact_ConnectedServiceDisplayName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x39b77f4f_u32, 0xa104_u16, 0x4863_u16, StaticArray[0xb3_u8, 0x95_u8, 0x2d_u8, 0xb2_u8, 0xad_u8, 0x8f_u8, 0x7b_u8, 0xc1_u8]), 100_u32)
  PKEY_Contact_ConnectedServiceIdentities = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x80f41eb8_u32, 0xafc4_u16, 0x4208_u16, StaticArray[0xaa_u8, 0x5f_u8, 0xcc_u8, 0xe2_u8, 0x1a_u8, 0x62_u8, 0x72_u8, 0x81_u8]), 100_u32)
  PKEY_Contact_ConnectedServiceName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb5c84c9e_u32, 0x5927_u16, 0x46b5_u16, StaticArray[0xa3_u8, 0xcc_u8, 0x93_u8, 0x3c_u8, 0x21_u8, 0xb7_u8, 0x84_u8, 0x69_u8]), 100_u32)
  PKEY_Contact_ConnectedServiceSupportedActions = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa19fb7a9_u32, 0x24b_u16, 0x4371_u16, StaticArray[0xa8_u8, 0xbf_u8, 0x4d_u8, 0x29_u8, 0xc3_u8, 0xe4_u8, 0xe9_u8, 0xc9_u8]), 100_u32)
  PKEY_Contact_DataSuppliers = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x9660c283_u32, 0xfc3a_u16, 0x4a08_u16, StaticArray[0xa0_u8, 0x96_u8, 0xee_u8, 0xd3_u8, 0xaa_u8, 0xc4_u8, 0x6d_u8, 0xa2_u8]), 100_u32)
  PKEY_Contact_Department = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xfc9f7306_u32, 0xff8f_u16, 0x4d49_u16, StaticArray[0x9f_u8, 0xb6_u8, 0x3f_u8, 0xfe_u8, 0x5c_u8, 0x9_u8, 0x51_u8, 0xec_u8]), 100_u32)
  PKEY_Contact_DisplayBusinessPhoneNumbers = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x364028da_u32, 0xd895_u16, 0x41fe_u16, StaticArray[0xa5_u8, 0x84_u8, 0x30_u8, 0x2b_u8, 0x1b_u8, 0xb7_u8, 0xa_u8, 0x76_u8]), 100_u32)
  PKEY_Contact_DisplayHomePhoneNumbers = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x5068bcdf_u32, 0xd697_u16, 0x4d85_u16, StaticArray[0x8c_u8, 0x53_u8, 0x1f_u8, 0x1c_u8, 0xda_u8, 0xb0_u8, 0x17_u8, 0x63_u8]), 100_u32)
  PKEY_Contact_DisplayMobilePhoneNumbers = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x9cb0c358_u32, 0x9d7a_u16, 0x46b1_u16, StaticArray[0xb4_u8, 0x66_u8, 0xdc_u8, 0xc6_u8, 0xf1_u8, 0xa3_u8, 0xd9_u8, 0x3d_u8]), 100_u32)
  PKEY_Contact_DisplayOtherPhoneNumbers = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x3089873_u32, 0x8ee8_u16, 0x4191_u16, StaticArray[0xbd_u8, 0x60_u8, 0xd3_u8, 0x1f_u8, 0x72_u8, 0xb7_u8, 0x90_u8, 0xb_u8]), 100_u32)
  PKEY_Contact_EmailAddress = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf8fa7fa3_u32, 0xd12b_u16, 0x4785_u16, StaticArray[0x8a_u8, 0x4e_u8, 0x69_u8, 0x1a_u8, 0x94_u8, 0xf7_u8, 0xa3_u8, 0xe7_u8]), 100_u32)
  PKEY_Contact_EmailAddress2 = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x38965063_u32, 0xedc8_u16, 0x4268_u16, StaticArray[0x84_u8, 0x91_u8, 0xb7_u8, 0x72_u8, 0x31_u8, 0x72_u8, 0xcf_u8, 0x29_u8]), 100_u32)
  PKEY_Contact_EmailAddress3 = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x644d37b4_u32, 0xe1b3_u16, 0x4bad_u16, StaticArray[0xb0_u8, 0x99_u8, 0x7e_u8, 0x7c_u8, 0x4_u8, 0x96_u8, 0x6a_u8, 0xca_u8]), 100_u32)
  PKEY_Contact_EmailAddresses = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x84d8f337_u32, 0x981d_u16, 0x44b3_u16, StaticArray[0x96_u8, 0x15_u8, 0xc7_u8, 0x59_u8, 0x6d_u8, 0xba_u8, 0x17_u8, 0xe3_u8]), 100_u32)
  PKEY_Contact_EmailName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xcc6f4f24_u32, 0x6083_u16, 0x4bd4_u16, StaticArray[0x87_u8, 0x54_u8, 0x67_u8, 0x4d_u8, 0xd_u8, 0xe8_u8, 0x7a_u8, 0xb8_u8]), 100_u32)
  PKEY_Contact_FileAsName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf1a24aa7_u32, 0x9ca7_u16, 0x40f6_u16, StaticArray[0x89_u8, 0xec_u8, 0x97_u8, 0xde_u8, 0xf9_u8, 0xff_u8, 0xe8_u8, 0xdb_u8]), 100_u32)
  PKEY_Contact_FirstName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x14977844_u32, 0x6b49_u16, 0x4aad_u16, StaticArray[0xa7_u8, 0x14_u8, 0xa4_u8, 0x51_u8, 0x3b_u8, 0xf6_u8, 0x4_u8, 0x60_u8]), 100_u32)
  PKEY_Contact_FullName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x635e9051_u32, 0x50a5_u16, 0x4ba2_u16, StaticArray[0xb9_u8, 0xdb_u8, 0x4e_u8, 0xd0_u8, 0x56_u8, 0xc7_u8, 0x72_u8, 0x96_u8]), 100_u32)
  PKEY_Contact_Gender = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x3c8cee58_u32, 0xd4f0_u16, 0x4cf9_u16, StaticArray[0xb7_u8, 0x56_u8, 0x4e_u8, 0x5d_u8, 0x24_u8, 0x44_u8, 0x7b_u8, 0xcd_u8]), 100_u32)
  PKEY_Contact_GenderValue = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x3c8cee58_u32, 0xd4f0_u16, 0x4cf9_u16, StaticArray[0xb7_u8, 0x56_u8, 0x4e_u8, 0x5d_u8, 0x24_u8, 0x44_u8, 0x7b_u8, 0xcd_u8]), 101_u32)
  PKEY_Contact_Hobbies = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x5dc2253f_u32, 0x5e11_u16, 0x4adf_u16, StaticArray[0x9c_u8, 0xfe_u8, 0x91_u8, 0xd_u8, 0xd0_u8, 0x1e_u8, 0x3e_u8, 0x70_u8]), 100_u32)
  PKEY_Contact_HomeAddress = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x98f98354_u32, 0x617a_u16, 0x46b8_u16, StaticArray[0x85_u8, 0x60_u8, 0x5b_u8, 0x1b_u8, 0x64_u8, 0xbf_u8, 0x1f_u8, 0x89_u8]), 100_u32)
  PKEY_Contact_HomeAddress1Country = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 104_u32)
  PKEY_Contact_HomeAddress1Locality = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 102_u32)
  PKEY_Contact_HomeAddress1PostalCode = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 105_u32)
  PKEY_Contact_HomeAddress1Region = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 103_u32)
  PKEY_Contact_HomeAddress1Street = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 101_u32)
  PKEY_Contact_HomeAddress2Country = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 109_u32)
  PKEY_Contact_HomeAddress2Locality = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 107_u32)
  PKEY_Contact_HomeAddress2PostalCode = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 110_u32)
  PKEY_Contact_HomeAddress2Region = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 108_u32)
  PKEY_Contact_HomeAddress2Street = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 106_u32)
  PKEY_Contact_HomeAddress3Country = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 114_u32)
  PKEY_Contact_HomeAddress3Locality = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 112_u32)
  PKEY_Contact_HomeAddress3PostalCode = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 115_u32)
  PKEY_Contact_HomeAddress3Region = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 113_u32)
  PKEY_Contact_HomeAddress3Street = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 111_u32)
  PKEY_Contact_HomeAddressCity = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x176dc63c_u32, 0x2688_u16, 0x4e89_u16, StaticArray[0x81_u8, 0x43_u8, 0xa3_u8, 0x47_u8, 0x80_u8, 0xf_u8, 0x25_u8, 0xe9_u8]), 65_u32)
  PKEY_Contact_HomeAddressCountry = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8a65aa1_u32, 0xf4c9_u16, 0x43dd_u16, StaticArray[0x9d_u8, 0xdf_u8, 0xa3_u8, 0x3d_u8, 0x8e_u8, 0x7e_u8, 0xad_u8, 0x85_u8]), 100_u32)
  PKEY_Contact_HomeAddressPostalCode = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8afcc170_u32, 0x8a46_u16, 0x4b53_u16, StaticArray[0x9e_u8, 0xee_u8, 0x90_u8, 0xba_u8, 0xe7_u8, 0x15_u8, 0x1e_u8, 0x62_u8]), 100_u32)
  PKEY_Contact_HomeAddressPostOfficeBox = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x7b9f6399_u32, 0xa3f_u16, 0x4b12_u16, StaticArray[0x89_u8, 0xbd_u8, 0x4a_u8, 0xdc_u8, 0x51_u8, 0xc9_u8, 0x18_u8, 0xaf_u8]), 100_u32)
  PKEY_Contact_HomeAddressState = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc89a23d0_u32, 0x7d6d_u16, 0x4eb8_u16, StaticArray[0x87_u8, 0xd4_u8, 0x77_u8, 0x6a_u8, 0x82_u8, 0xd4_u8, 0x93_u8, 0xe5_u8]), 100_u32)
  PKEY_Contact_HomeAddressStreet = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xadef160_u32, 0xdb3f_u16, 0x4308_u16, StaticArray[0x9a_u8, 0x21_u8, 0x6_u8, 0x23_u8, 0x7b_u8, 0x16_u8, 0xfa_u8, 0x2a_u8]), 100_u32)
  PKEY_Contact_HomeEmailAddresses = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x56c90e9d_u32, 0x9d46_u16, 0x4963_u16, StaticArray[0x88_u8, 0x6f_u8, 0x2e_u8, 0x1c_u8, 0xd9_u8, 0xa6_u8, 0x94_u8, 0xef_u8]), 100_u32)
  PKEY_Contact_HomeFaxNumber = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x660e04d6_u32, 0x81ab_u16, 0x4977_u16, StaticArray[0xa0_u8, 0x9f_u8, 0x82_u8, 0x31_u8, 0x31_u8, 0x13_u8, 0xab_u8, 0x26_u8]), 100_u32)
  PKEY_Contact_HomeTelephone = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x176dc63c_u32, 0x2688_u16, 0x4e89_u16, StaticArray[0x81_u8, 0x43_u8, 0xa3_u8, 0x47_u8, 0x80_u8, 0xf_u8, 0x25_u8, 0xe9_u8]), 20_u32)
  PKEY_Contact_IMAddress = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd68dbd8a_u32, 0x3374_u16, 0x4b81_u16, StaticArray[0x99_u8, 0x72_u8, 0x3e_u8, 0xc3_u8, 0x6_u8, 0x82_u8, 0xdb_u8, 0x3d_u8]), 100_u32)
  PKEY_Contact_Initials = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf3d8f40d_u32, 0x50cb_u16, 0x44a2_u16, StaticArray[0x97_u8, 0x18_u8, 0x40_u8, 0xcb_u8, 0x91_u8, 0x19_u8, 0x49_u8, 0x5d_u8]), 100_u32)
  PKEY_Contact_JA_CompanyNamePhonetic = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x897b3694_u32, 0xfe9e_u16, 0x43e6_u16, StaticArray[0x80_u8, 0x66_u8, 0x26_u8, 0xf_u8, 0x59_u8, 0xc_u8, 0x1_u8, 0x0_u8]), 2_u32)
  PKEY_Contact_JA_FirstNamePhonetic = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x897b3694_u32, 0xfe9e_u16, 0x43e6_u16, StaticArray[0x80_u8, 0x66_u8, 0x26_u8, 0xf_u8, 0x59_u8, 0xc_u8, 0x1_u8, 0x0_u8]), 3_u32)
  PKEY_Contact_JA_LastNamePhonetic = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x897b3694_u32, 0xfe9e_u16, 0x43e6_u16, StaticArray[0x80_u8, 0x66_u8, 0x26_u8, 0xf_u8, 0x59_u8, 0xc_u8, 0x1_u8, 0x0_u8]), 4_u32)
  PKEY_Contact_JobInfo1CompanyAddress = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 120_u32)
  PKEY_Contact_JobInfo1CompanyName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 102_u32)
  PKEY_Contact_JobInfo1Department = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 106_u32)
  PKEY_Contact_JobInfo1Manager = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 105_u32)
  PKEY_Contact_JobInfo1OfficeLocation = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 104_u32)
  PKEY_Contact_JobInfo1Title = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 103_u32)
  PKEY_Contact_JobInfo1YomiCompanyName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 101_u32)
  PKEY_Contact_JobInfo2CompanyAddress = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 121_u32)
  PKEY_Contact_JobInfo2CompanyName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 108_u32)
  PKEY_Contact_JobInfo2Department = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 113_u32)
  PKEY_Contact_JobInfo2Manager = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 112_u32)
  PKEY_Contact_JobInfo2OfficeLocation = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 110_u32)
  PKEY_Contact_JobInfo2Title = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 109_u32)
  PKEY_Contact_JobInfo2YomiCompanyName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 107_u32)
  PKEY_Contact_JobInfo3CompanyAddress = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 123_u32)
  PKEY_Contact_JobInfo3CompanyName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 115_u32)
  PKEY_Contact_JobInfo3Department = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 119_u32)
  PKEY_Contact_JobInfo3Manager = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 118_u32)
  PKEY_Contact_JobInfo3OfficeLocation = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 117_u32)
  PKEY_Contact_JobInfo3Title = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 116_u32)
  PKEY_Contact_JobInfo3YomiCompanyName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 114_u32)
  PKEY_Contact_JobTitle = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x176dc63c_u32, 0x2688_u16, 0x4e89_u16, StaticArray[0x81_u8, 0x43_u8, 0xa3_u8, 0x47_u8, 0x80_u8, 0xf_u8, 0x25_u8, 0xe9_u8]), 6_u32)
  PKEY_Contact_Label = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x97b0ad89_u32, 0xdf49_u16, 0x49cc_u16, StaticArray[0x83_u8, 0x4e_u8, 0x66_u8, 0x9_u8, 0x74_u8, 0xfd_u8, 0x75_u8, 0x5b_u8]), 100_u32)
  PKEY_Contact_LastName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8f367200_u32, 0xc270_u16, 0x457c_u16, StaticArray[0xb1_u8, 0xd4_u8, 0xe0_u8, 0x7c_u8, 0x5b_u8, 0xcd_u8, 0x90_u8, 0xc7_u8]), 100_u32)
  PKEY_Contact_MailingAddress = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc0ac206a_u32, 0x827e_u16, 0x4650_u16, StaticArray[0x95_u8, 0xae_u8, 0x77_u8, 0xe2_u8, 0xbb_u8, 0x74_u8, 0xfc_u8, 0xc9_u8]), 100_u32)
  PKEY_Contact_MiddleName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x176dc63c_u32, 0x2688_u16, 0x4e89_u16, StaticArray[0x81_u8, 0x43_u8, 0xa3_u8, 0x47_u8, 0x80_u8, 0xf_u8, 0x25_u8, 0xe9_u8]), 71_u32)
  PKEY_Contact_MobileTelephone = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x176dc63c_u32, 0x2688_u16, 0x4e89_u16, StaticArray[0x81_u8, 0x43_u8, 0xa3_u8, 0x47_u8, 0x80_u8, 0xf_u8, 0x25_u8, 0xe9_u8]), 35_u32)
  PKEY_Contact_NickName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x176dc63c_u32, 0x2688_u16, 0x4e89_u16, StaticArray[0x81_u8, 0x43_u8, 0xa3_u8, 0x47_u8, 0x80_u8, 0xf_u8, 0x25_u8, 0xe9_u8]), 74_u32)
  PKEY_Contact_OfficeLocation = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x176dc63c_u32, 0x2688_u16, 0x4e89_u16, StaticArray[0x81_u8, 0x43_u8, 0xa3_u8, 0x47_u8, 0x80_u8, 0xf_u8, 0x25_u8, 0xe9_u8]), 7_u32)
  PKEY_Contact_OtherAddress = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x508161fa_u32, 0x313b_u16, 0x43d5_u16, StaticArray[0x83_u8, 0xa1_u8, 0xc1_u8, 0xac_u8, 0xcf_u8, 0x68_u8, 0x62_u8, 0x2c_u8]), 100_u32)
  PKEY_Contact_OtherAddress1Country = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 134_u32)
  PKEY_Contact_OtherAddress1Locality = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 132_u32)
  PKEY_Contact_OtherAddress1PostalCode = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 135_u32)
  PKEY_Contact_OtherAddress1Region = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 133_u32)
  PKEY_Contact_OtherAddress1Street = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 131_u32)
  PKEY_Contact_OtherAddress2Country = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 139_u32)
  PKEY_Contact_OtherAddress2Locality = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 137_u32)
  PKEY_Contact_OtherAddress2PostalCode = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 140_u32)
  PKEY_Contact_OtherAddress2Region = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 138_u32)
  PKEY_Contact_OtherAddress2Street = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 136_u32)
  PKEY_Contact_OtherAddress3Country = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 144_u32)
  PKEY_Contact_OtherAddress3Locality = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 142_u32)
  PKEY_Contact_OtherAddress3PostalCode = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 145_u32)
  PKEY_Contact_OtherAddress3Region = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 143_u32)
  PKEY_Contact_OtherAddress3Street = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 141_u32)
  PKEY_Contact_OtherAddressCity = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6e682923_u32, 0x7f7b_u16, 0x4f0c_u16, StaticArray[0xa3_u8, 0x37_u8, 0xcf_u8, 0xca_u8, 0x29_u8, 0x66_u8, 0x87_u8, 0xbf_u8]), 100_u32)
  PKEY_Contact_OtherAddressCountry = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8f167568_u32, 0xaae_u16, 0x4322_u16, StaticArray[0x8e_u8, 0xd9_u8, 0x60_u8, 0x55_u8, 0xb7_u8, 0xb0_u8, 0xe3_u8, 0x98_u8]), 100_u32)
  PKEY_Contact_OtherAddressPostalCode = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x95c656c1_u32, 0x2abf_u16, 0x4148_u16, StaticArray[0x9e_u8, 0xd3_u8, 0x9e_u8, 0xc6_u8, 0x2_u8, 0xe3_u8, 0xb7_u8, 0xcd_u8]), 100_u32)
  PKEY_Contact_OtherAddressPostOfficeBox = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8b26ea41_u32, 0x58f_u16, 0x43f6_u16, StaticArray[0xae_u8, 0xcc_u8, 0x40_u8, 0x35_u8, 0x68_u8, 0x1c_u8, 0xe9_u8, 0x77_u8]), 100_u32)
  PKEY_Contact_OtherAddressState = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x71b377d6_u32, 0xe570_u16, 0x425f_u16, StaticArray[0xa1_u8, 0x70_u8, 0x80_u8, 0x9f_u8, 0xae_u8, 0x73_u8, 0xe5_u8, 0x4e_u8]), 100_u32)
  PKEY_Contact_OtherAddressStreet = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xff962609_u32, 0xb7d6_u16, 0x4999_u16, StaticArray[0x86_u8, 0x2d_u8, 0x95_u8, 0x18_u8, 0xd_u8, 0x52_u8, 0x9a_u8, 0xea_u8]), 100_u32)
  PKEY_Contact_OtherEmailAddresses = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x11d6336b_u32, 0x38c4_u16, 0x4ec9_u16, StaticArray[0x84_u8, 0xd6_u8, 0xeb_u8, 0x38_u8, 0xd0_u8, 0xb1_u8, 0x50_u8, 0xaf_u8]), 100_u32)
  PKEY_Contact_PagerTelephone = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd6304e01_u32, 0xf8f5_u16, 0x4f45_u16, StaticArray[0x8b_u8, 0x15_u8, 0xd0_u8, 0x24_u8, 0xa6_u8, 0x29_u8, 0x67_u8, 0x89_u8]), 100_u32)
  PKEY_Contact_PersonalTitle = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x176dc63c_u32, 0x2688_u16, 0x4e89_u16, StaticArray[0x81_u8, 0x43_u8, 0xa3_u8, 0x47_u8, 0x80_u8, 0xf_u8, 0x25_u8, 0xe9_u8]), 69_u32)
  PKEY_Contact_PhoneNumbersCanonical = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd042d2a1_u32, 0x927e_u16, 0x40b5_u16, StaticArray[0xa5_u8, 0x3_u8, 0x6e_u8, 0xdb_u8, 0xd4_u8, 0x2a_u8, 0x51_u8, 0x7e_u8]), 100_u32)
  PKEY_Contact_Prefix = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x176dc63c_u32, 0x2688_u16, 0x4e89_u16, StaticArray[0x81_u8, 0x43_u8, 0xa3_u8, 0x47_u8, 0x80_u8, 0xf_u8, 0x25_u8, 0xe9_u8]), 75_u32)
  PKEY_Contact_PrimaryAddressCity = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc8ea94f0_u32, 0xa9e3_u16, 0x4969_u16, StaticArray[0xa9_u8, 0x4b_u8, 0x9c_u8, 0x62_u8, 0xa9_u8, 0x53_u8, 0x24_u8, 0xe0_u8]), 100_u32)
  PKEY_Contact_PrimaryAddressCountry = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xe53d799d_u32, 0xf3f_u16, 0x466e_u16, StaticArray[0xb2_u8, 0xff_u8, 0x74_u8, 0x63_u8, 0x4a_u8, 0x3c_u8, 0xb7_u8, 0xa4_u8]), 100_u32)
  PKEY_Contact_PrimaryAddressPostalCode = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x18bbd425_u32, 0xecfd_u16, 0x46ef_u16, StaticArray[0xb6_u8, 0x12_u8, 0x7b_u8, 0x4a_u8, 0x60_u8, 0x34_u8, 0xed_u8, 0xa0_u8]), 100_u32)
  PKEY_Contact_PrimaryAddressPostOfficeBox = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xde5ef3c7_u32, 0x46e1_u16, 0x484e_u16, StaticArray[0x99_u8, 0x99_u8, 0x62_u8, 0xc5_u8, 0x30_u8, 0x83_u8, 0x94_u8, 0xc1_u8]), 100_u32)
  PKEY_Contact_PrimaryAddressState = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf1176dfe_u32, 0x7138_u16, 0x4640_u16, StaticArray[0x8b_u8, 0x4c_u8, 0xae_u8, 0x37_u8, 0x5d_u8, 0xc7_u8, 0xa_u8, 0x6d_u8]), 100_u32)
  PKEY_Contact_PrimaryAddressStreet = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x63c25b20_u32, 0x96be_u16, 0x488f_u16, StaticArray[0x87_u8, 0x88_u8, 0xc0_u8, 0x9c_u8, 0x40_u8, 0x7a_u8, 0xd8_u8, 0x12_u8]), 100_u32)
  PKEY_Contact_PrimaryEmailAddress = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x176dc63c_u32, 0x2688_u16, 0x4e89_u16, StaticArray[0x81_u8, 0x43_u8, 0xa3_u8, 0x47_u8, 0x80_u8, 0xf_u8, 0x25_u8, 0xe9_u8]), 48_u32)
  PKEY_Contact_PrimaryTelephone = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x176dc63c_u32, 0x2688_u16, 0x4e89_u16, StaticArray[0x81_u8, 0x43_u8, 0xa3_u8, 0x47_u8, 0x80_u8, 0xf_u8, 0x25_u8, 0xe9_u8]), 25_u32)
  PKEY_Contact_Profession = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x7268af55_u32, 0x1ce4_u16, 0x4f6e_u16, StaticArray[0xa4_u8, 0x1f_u8, 0xb6_u8, 0xe4_u8, 0xef_u8, 0x10_u8, 0xe4_u8, 0xa9_u8]), 100_u32)
  PKEY_Contact_SpouseName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x9d2408b6_u32, 0x3167_u16, 0x422b_u16, StaticArray[0x82_u8, 0xb0_u8, 0xf5_u8, 0x83_u8, 0xb7_u8, 0xa7_u8, 0xcf_u8, 0xe3_u8]), 100_u32)
  PKEY_Contact_Suffix = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x176dc63c_u32, 0x2688_u16, 0x4e89_u16, StaticArray[0x81_u8, 0x43_u8, 0xa3_u8, 0x47_u8, 0x80_u8, 0xf_u8, 0x25_u8, 0xe9_u8]), 73_u32)
  PKEY_Contact_TelexNumber = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc554493c_u32, 0xc1f7_u16, 0x40c1_u16, StaticArray[0xa7_u8, 0x6c_u8, 0xef_u8, 0x8c_u8, 0x6_u8, 0x14_u8, 0x0_u8, 0x3e_u8]), 100_u32)
  PKEY_Contact_TTYTDDTelephone = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xaaf16bac_u32, 0x2b55_u16, 0x45e6_u16, StaticArray[0x9f_u8, 0x6d_u8, 0x41_u8, 0x5e_u8, 0xb9_u8, 0x49_u8, 0x10_u8, 0xdf_u8]), 100_u32)
  PKEY_Contact_WebPage = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xe3e0584c_u32, 0xb788_u16, 0x4a5a_u16, StaticArray[0xbb_u8, 0x20_u8, 0x7f_u8, 0x5a_u8, 0x44_u8, 0xc9_u8, 0xac_u8, 0xdd_u8]), 18_u32)
  PKEY_Contact_Webpage2 = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 124_u32)
  PKEY_Contact_Webpage3 = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 125_u32)
  PKEY_AcquisitionID = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x65a98875_u32, 0x3c80_u16, 0x40ab_u16, StaticArray[0xab_u8, 0xbc_u8, 0xef_u8, 0xda_u8, 0xf7_u8, 0x7d_u8, 0xbe_u8, 0xe2_u8]), 100_u32)
  PKEY_ApplicationDefinedProperties = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xcdbfc167_u32, 0x337e_u16, 0x41d8_u16, StaticArray[0xaf_u8, 0x7c_u8, 0x8c_u8, 0x9_u8, 0x20_u8, 0x54_u8, 0x29_u8, 0xc7_u8]), 100_u32)
  PKEY_ApplicationName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 18_u32)
  PKEY_AppZoneIdentifier = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x502cfeab_u32, 0x47eb_u16, 0x459c_u16, StaticArray[0xb9_u8, 0x60_u8, 0xe6_u8, 0xd8_u8, 0x72_u8, 0x8f_u8, 0x77_u8, 0x1_u8]), 102_u32)
  PKEY_Author = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 4_u32)
  PKEY_CachedFileUpdaterContentIdForConflictResolution = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xfceff153_u32, 0xe839_u16, 0x4cf3_u16, StaticArray[0xa9_u8, 0xe7_u8, 0xea_u8, 0x22_u8, 0x83_u8, 0x20_u8, 0x94_u8, 0xb8_u8]), 114_u32)
  PKEY_CachedFileUpdaterContentIdForStream = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xfceff153_u32, 0xe839_u16, 0x4cf3_u16, StaticArray[0xa9_u8, 0xe7_u8, 0xea_u8, 0x22_u8, 0x83_u8, 0x20_u8, 0x94_u8, 0xb8_u8]), 113_u32)
  PKEY_Capacity = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x9b174b35_u32, 0x40ff_u16, 0x11d2_u16, StaticArray[0xa2_u8, 0x7e_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc3_u8, 0x8_u8, 0x71_u8]), 3_u32)
  PKEY_Category = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd5cdd502_u32, 0x2e9c_u16, 0x101b_u16, StaticArray[0x93_u8, 0x97_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2c_u8, 0xf9_u8, 0xae_u8]), 2_u32)
  PKEY_Comment = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 6_u32)
  PKEY_Company = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd5cdd502_u32, 0x2e9c_u16, 0x101b_u16, StaticArray[0x93_u8, 0x97_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2c_u8, 0xf9_u8, 0xae_u8]), 15_u32)
  PKEY_ComputerName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x28636aa6_u32, 0x953d_u16, 0x11d2_u16, StaticArray[0xb5_u8, 0xd6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x18_u8, 0xd0_u8]), 5_u32)
  PKEY_ContainedItems = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x28636aa6_u32, 0x953d_u16, 0x11d2_u16, StaticArray[0xb5_u8, 0xd6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x18_u8, 0xd0_u8]), 29_u32)
  PKEY_ContentId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xfceff153_u32, 0xe839_u16, 0x4cf3_u16, StaticArray[0xa9_u8, 0xe7_u8, 0xea_u8, 0x22_u8, 0x83_u8, 0x20_u8, 0x94_u8, 0xb8_u8]), 132_u32)
  PKEY_ContentStatus = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd5cdd502_u32, 0x2e9c_u16, 0x101b_u16, StaticArray[0x93_u8, 0x97_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2c_u8, 0xf9_u8, 0xae_u8]), 27_u32)
  PKEY_ContentType = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd5cdd502_u32, 0x2e9c_u16, 0x101b_u16, StaticArray[0x93_u8, 0x97_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2c_u8, 0xf9_u8, 0xae_u8]), 26_u32)
  PKEY_ContentUri = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xfceff153_u32, 0xe839_u16, 0x4cf3_u16, StaticArray[0xa9_u8, 0xe7_u8, 0xea_u8, 0x22_u8, 0x83_u8, 0x20_u8, 0x94_u8, 0xb8_u8]), 131_u32)
  PKEY_Copyright = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 11_u32)
  PKEY_CreatorAppId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc2ea046e_u32, 0x33c_u16, 0x4e91_u16, StaticArray[0xbd_u8, 0x5b_u8, 0xd4_u8, 0x94_u8, 0x2f_u8, 0x6b_u8, 0xbe_u8, 0x49_u8]), 2_u32)
  PKEY_CreatorOpenWithUIOptions = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc2ea046e_u32, 0x33c_u16, 0x4e91_u16, StaticArray[0xbd_u8, 0x5b_u8, 0xd4_u8, 0x94_u8, 0x2f_u8, 0x6b_u8, 0xbe_u8, 0x49_u8]), 3_u32)
  CREATOROPENWITHUIOPTION_HIDDEN = 0_u32
  CREATOROPENWITHUIOPTION_VISIBLE = 1_u32
  PKEY_DataObjectFormat = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1e81a3f8_u32, 0xa30f_u16, 0x4247_u16, StaticArray[0xb9_u8, 0xee_u8, 0x1d_u8, 0x3_u8, 0x68_u8, 0xa9_u8, 0x42_u8, 0x5c_u8]), 2_u32)
  PKEY_DateAccessed = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb725f130_u32, 0x47ef_u16, 0x101a_u16, StaticArray[0xa5_u8, 0xf1_u8, 0x2_u8, 0x60_u8, 0x8c_u8, 0x9e_u8, 0xeb_u8, 0xac_u8]), 16_u32)
  PKEY_DateAcquired = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x2cbaa8f5_u32, 0xd81f_u16, 0x47ca_u16, StaticArray[0xb1_u8, 0x7a_u8, 0xf8_u8, 0xd8_u8, 0x22_u8, 0x30_u8, 0x1_u8, 0x31_u8]), 100_u32)
  PKEY_DateArchived = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x43f8d7b7_u32, 0xa444_u16, 0x4f87_u16, StaticArray[0x93_u8, 0x83_u8, 0x52_u8, 0x27_u8, 0x1c_u8, 0x9b_u8, 0x91_u8, 0x5c_u8]), 100_u32)
  PKEY_DateCompleted = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x72fab781_u32, 0xacda_u16, 0x43e5_u16, StaticArray[0xb1_u8, 0x55_u8, 0xb2_u8, 0x43_u8, 0x4f_u8, 0x85_u8, 0xe6_u8, 0x78_u8]), 100_u32)
  PKEY_DateCreated = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb725f130_u32, 0x47ef_u16, 0x101a_u16, StaticArray[0xa5_u8, 0xf1_u8, 0x2_u8, 0x60_u8, 0x8c_u8, 0x9e_u8, 0xeb_u8, 0xac_u8]), 15_u32)
  PKEY_DateImported = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 18258_u32)
  PKEY_DateModified = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb725f130_u32, 0x47ef_u16, 0x101a_u16, StaticArray[0xa5_u8, 0xf1_u8, 0x2_u8, 0x60_u8, 0x8c_u8, 0x9e_u8, 0xeb_u8, 0xac_u8]), 14_u32)
  PKEY_DefaultSaveLocationDisplay = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x5d76b67f_u32, 0x9b3d_u16, 0x44bb_u16, StaticArray[0xb6_u8, 0xae_u8, 0x25_u8, 0xda_u8, 0x4f_u8, 0x63_u8, 0x8a_u8, 0x67_u8]), 10_u32)
  ISDEFAULTSAVE_NONE = 0_u32
  ISDEFAULTSAVE_OWNER = 1_u32
  ISDEFAULTSAVE_NONOWNER = 2_u32
  ISDEFAULTSAVE_BOTH = 3_u32
  PKEY_DueDate = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x3f8472b5_u32, 0xe0af_u16, 0x4db2_u16, StaticArray[0x80_u8, 0x71_u8, 0xc5_u8, 0x3f_u8, 0xe7_u8, 0x6a_u8, 0xe7_u8, 0xce_u8]), 100_u32)
  PKEY_EndDate = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc75faa05_u32, 0x96fd_u16, 0x49e7_u16, StaticArray[0x9c_u8, 0xb4_u8, 0x9f_u8, 0x60_u8, 0x10_u8, 0x82_u8, 0xd5_u8, 0x53_u8]), 100_u32)
  PKEY_ExpandoProperties = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6fa20de6_u32, 0xd11c_u16, 0x4d9d_u16, StaticArray[0xa1_u8, 0x54_u8, 0x64_u8, 0x31_u8, 0x76_u8, 0x28_u8, 0xc1_u8, 0x2d_u8]), 100_u32)
  PKEY_FileAllocationSize = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb725f130_u32, 0x47ef_u16, 0x101a_u16, StaticArray[0xa5_u8, 0xf1_u8, 0x2_u8, 0x60_u8, 0x8c_u8, 0x9e_u8, 0xeb_u8, 0xac_u8]), 18_u32)
  PKEY_FileAttributes = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb725f130_u32, 0x47ef_u16, 0x101a_u16, StaticArray[0xa5_u8, 0xf1_u8, 0x2_u8, 0x60_u8, 0x8c_u8, 0x9e_u8, 0xeb_u8, 0xac_u8]), 13_u32)
  PKEY_FileCount = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x28636aa6_u32, 0x953d_u16, 0x11d2_u16, StaticArray[0xb5_u8, 0xd6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x18_u8, 0xd0_u8]), 12_u32)
  PKEY_FileDescription = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xcef7d53_u32, 0xfa64_u16, 0x11d1_u16, StaticArray[0xa2_u8, 0x3_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x1f_u8, 0xed_u8, 0xee_u8]), 3_u32)
  PKEY_FileExtension = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xe4f10a3c_u32, 0x49e6_u16, 0x405d_u16, StaticArray[0x82_u8, 0x88_u8, 0xa2_u8, 0x3b_u8, 0xd4_u8, 0xee_u8, 0xaa_u8, 0x6c_u8]), 100_u32)
  PKEY_FileFRN = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb725f130_u32, 0x47ef_u16, 0x101a_u16, StaticArray[0xa5_u8, 0xf1_u8, 0x2_u8, 0x60_u8, 0x8c_u8, 0x9e_u8, 0xeb_u8, 0xac_u8]), 21_u32)
  PKEY_FileName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x41cf5ae0_u32, 0xf75a_u16, 0x4806_u16, StaticArray[0xbd_u8, 0x87_u8, 0x59_u8, 0xc7_u8, 0xd9_u8, 0x24_u8, 0x8e_u8, 0xb9_u8]), 100_u32)
  PKEY_FileOfflineAvailabilityStatus = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xfceff153_u32, 0xe839_u16, 0x4cf3_u16, StaticArray[0xa9_u8, 0xe7_u8, 0xea_u8, 0x22_u8, 0x83_u8, 0x20_u8, 0x94_u8, 0xb8_u8]), 100_u32)
  FILEOFFLINEAVAILABILITYSTATUS_NOTAVAILABLEOFFLINE = 0_u32
  FILEOFFLINEAVAILABILITYSTATUS_PARTIAL = 1_u32
  FILEOFFLINEAVAILABILITYSTATUS_COMPLETE = 2_u32
  FILEOFFLINEAVAILABILITYSTATUS_COMPLETE_PINNED = 3_u32
  FILEOFFLINEAVAILABILITYSTATUS_EXCLUDED = 4_u32
  FILEOFFLINEAVAILABILITYSTATUS_FOLDER_EMPTY = 5_u32
  PKEY_FileOwner = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x9b174b34_u32, 0x40ff_u16, 0x11d2_u16, StaticArray[0xa2_u8, 0x7e_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc3_u8, 0x8_u8, 0x71_u8]), 4_u32)
  PKEY_FilePlaceholderStatus = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb2f9b9d6_u32, 0xfec4_u16, 0x4dd5_u16, StaticArray[0x94_u8, 0xd7_u8, 0x89_u8, 0x57_u8, 0x48_u8, 0x8c_u8, 0x80_u8, 0x7b_u8]), 2_u32)
  PKEY_FileVersion = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xcef7d53_u32, 0xfa64_u16, 0x11d1_u16, StaticArray[0xa2_u8, 0x3_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x1f_u8, 0xed_u8, 0xee_u8]), 4_u32)
  PKEY_FindData = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x28636aa6_u32, 0x953d_u16, 0x11d2_u16, StaticArray[0xb5_u8, 0xd6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x18_u8, 0xd0_u8]), 0_u32)
  PKEY_FlagColor = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x67df94de_u32, 0xca7_u16, 0x4d6f_u16, StaticArray[0xb7_u8, 0x92_u8, 0x5_u8, 0x3a_u8, 0x3e_u8, 0x4f_u8, 0x3_u8, 0xcf_u8]), 100_u32)
  PKEY_FlagColorText = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x45eae747_u32, 0x8e2a_u16, 0x40ae_u16, StaticArray[0x8c_u8, 0xbf_u8, 0xca_u8, 0x52_u8, 0xab_u8, 0xa6_u8, 0x15_u8, 0x2a_u8]), 100_u32)
  PKEY_FlagStatus = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xe3e0584c_u32, 0xb788_u16, 0x4a5a_u16, StaticArray[0xbb_u8, 0x20_u8, 0x7f_u8, 0x5a_u8, 0x44_u8, 0xc9_u8, 0xac_u8, 0xdd_u8]), 12_u32)
  FLAGSTATUS_NOTFLAGGED = 0_i32
  FLAGSTATUS_COMPLETED = 1_i32
  FLAGSTATUS_FOLLOWUP = 2_i32
  PKEY_FlagStatusText = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xdc54fd2e_u32, 0x189d_u16, 0x4871_u16, StaticArray[0xaa_u8, 0x1_u8, 0x8_u8, 0xc2_u8, 0xf5_u8, 0x7a_u8, 0x4a_u8, 0xbc_u8]), 100_u32)
  PKEY_FolderKind = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xfceff153_u32, 0xe839_u16, 0x4cf3_u16, StaticArray[0xa9_u8, 0xe7_u8, 0xea_u8, 0x22_u8, 0x83_u8, 0x20_u8, 0x94_u8, 0xb8_u8]), 101_u32)
  PKEY_FolderNameDisplay = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb725f130_u32, 0x47ef_u16, 0x101a_u16, StaticArray[0xa5_u8, 0xf1_u8, 0x2_u8, 0x60_u8, 0x8c_u8, 0x9e_u8, 0xeb_u8, 0xac_u8]), 25_u32)
  PKEY_FreeSpace = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x9b174b35_u32, 0x40ff_u16, 0x11d2_u16, StaticArray[0xa2_u8, 0x7e_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc3_u8, 0x8_u8, 0x71_u8]), 2_u32)
  PKEY_FullText = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1e3ee840_u32, 0xbc2b_u16, 0x476c_u16, StaticArray[0x82_u8, 0x37_u8, 0x2a_u8, 0xcd_u8, 0x1a_u8, 0x83_u8, 0x9b_u8, 0x22_u8]), 6_u32)
  PKEY_HighKeywords = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 24_u32)
  PKEY_Identity = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa26f4afc_u32, 0x7346_u16, 0x4299_u16, StaticArray[0xbe_u8, 0x47_u8, 0xeb_u8, 0x1a_u8, 0xe6_u8, 0x13_u8, 0x13_u8, 0x9f_u8]), 100_u32)
  PKEY_Identity_Blob = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8c3b93a4_u32, 0xbaed_u16, 0x1a83_u16, StaticArray[0x9a_u8, 0x32_u8, 0x10_u8, 0x2e_u8, 0xe3_u8, 0x13_u8, 0xf6_u8, 0xeb_u8]), 100_u32)
  PKEY_Identity_DisplayName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x7d683fc9_u32, 0xd155_u16, 0x45a8_u16, StaticArray[0xbb_u8, 0x1f_u8, 0x89_u8, 0xd1_u8, 0x9b_u8, 0xcb_u8, 0x79_u8, 0x2f_u8]), 100_u32)
  PKEY_Identity_InternetSid = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6d6d5d49_u32, 0x265d_u16, 0x4688_u16, StaticArray[0x9f_u8, 0x4e_u8, 0x1f_u8, 0xdd_u8, 0x33_u8, 0xe7_u8, 0xcc_u8, 0x83_u8]), 100_u32)
  PKEY_Identity_IsMeIdentity = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa4108708_u32, 0x9df_u16, 0x4377_u16, StaticArray[0x9d_u8, 0xfc_u8, 0x6d_u8, 0x99_u8, 0x98_u8, 0x6d_u8, 0x5a_u8, 0x67_u8]), 100_u32)
  PKEY_Identity_KeyProviderContext = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa26f4afc_u32, 0x7346_u16, 0x4299_u16, StaticArray[0xbe_u8, 0x47_u8, 0xeb_u8, 0x1a_u8, 0xe6_u8, 0x13_u8, 0x13_u8, 0x9f_u8]), 17_u32)
  PKEY_Identity_KeyProviderName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa26f4afc_u32, 0x7346_u16, 0x4299_u16, StaticArray[0xbe_u8, 0x47_u8, 0xeb_u8, 0x1a_u8, 0xe6_u8, 0x13_u8, 0x13_u8, 0x9f_u8]), 16_u32)
  PKEY_Identity_LogonStatusString = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf18dedf3_u32, 0x337f_u16, 0x42c0_u16, StaticArray[0x9e_u8, 0x3_u8, 0xce_u8, 0xe0_u8, 0x87_u8, 0x8_u8, 0xa8_u8, 0xc3_u8]), 100_u32)
  PKEY_Identity_PrimaryEmailAddress = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xfcc16823_u32, 0xbaed_u16, 0x4f24_u16, StaticArray[0x9b_u8, 0x32_u8, 0xa0_u8, 0x98_u8, 0x21_u8, 0x17_u8, 0xf7_u8, 0xfa_u8]), 100_u32)
  PKEY_Identity_PrimarySid = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x2b1b801e_u32, 0xc0c1_u16, 0x4987_u16, StaticArray[0x9e_u8, 0xc5_u8, 0x72_u8, 0xfa_u8, 0x89_u8, 0x81_u8, 0x47_u8, 0x87_u8]), 100_u32)
  PKEY_Identity_ProviderData = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa8a74b92_u32, 0x361b_u16, 0x4e9a_u16, StaticArray[0xb7_u8, 0x22_u8, 0x7c_u8, 0x4a_u8, 0x73_u8, 0x30_u8, 0xa3_u8, 0x12_u8]), 100_u32)
  PKEY_Identity_ProviderID = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x74a7de49_u32, 0xfa11_u16, 0x4d3d_u16, StaticArray[0xa0_u8, 0x6_u8, 0xdb_u8, 0x7e_u8, 0x8_u8, 0x67_u8, 0x59_u8, 0x16_u8]), 100_u32)
  PKEY_Identity_QualifiedUserName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xda520e51_u32, 0xf4e9_u16, 0x4739_u16, StaticArray[0xac_u8, 0x82_u8, 0x2_u8, 0xe0_u8, 0xa9_u8, 0x5c_u8, 0x90_u8, 0x30_u8]), 100_u32)
  PKEY_Identity_UniqueID = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xe55fc3b0_u32, 0x2b60_u16, 0x4220_u16, StaticArray[0x91_u8, 0x8e_u8, 0xb2_u8, 0x1e_u8, 0x8b_u8, 0xf1_u8, 0x60_u8, 0x16_u8]), 100_u32)
  PKEY_Identity_UserName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc4322503_u32, 0x78ca_u16, 0x49c6_u16, StaticArray[0x9a_u8, 0xcc_u8, 0xa6_u8, 0x8e_u8, 0x2a_u8, 0xfd_u8, 0x7b_u8, 0x6b_u8]), 100_u32)
  PKEY_IdentityProvider_Name = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb96eff7b_u32, 0x35ca_u16, 0x4a35_u16, StaticArray[0x86_u8, 0x7_u8, 0x29_u8, 0xe3_u8, 0xa5_u8, 0x4c_u8, 0x46_u8, 0xea_u8]), 100_u32)
  PKEY_IdentityProvider_Picture = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x2425166f_u32, 0x5642_u16, 0x4864_u16, StaticArray[0x99_u8, 0x2f_u8, 0x98_u8, 0xfd_u8, 0x98_u8, 0xf2_u8, 0x94_u8, 0xc3_u8]), 100_u32)
  PKEY_ImageParsingName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd7750ee0_u32, 0xc6a4_u16, 0x48ec_u16, StaticArray[0xb5_u8, 0x3e_u8, 0xb8_u8, 0x7b_u8, 0x52_u8, 0xe6_u8, 0xd0_u8, 0x73_u8]), 100_u32)
  PKEY_Importance = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xe3e0584c_u32, 0xb788_u16, 0x4a5a_u16, StaticArray[0xbb_u8, 0x20_u8, 0x7f_u8, 0x5a_u8, 0x44_u8, 0xc9_u8, 0xac_u8, 0xdd_u8]), 11_u32)
  IMPORTANCE_LOW_MIN = 0_i32
  IMPORTANCE_LOW_SET = 1_i32
  IMPORTANCE_LOW_MAX = 1_i32
  IMPORTANCE_NORMAL_MIN = 2_i32
  IMPORTANCE_NORMAL_SET = 3_i32
  IMPORTANCE_NORMAL_MAX = 4_i32
  IMPORTANCE_HIGH_MIN = 5_i32
  IMPORTANCE_HIGH_SET = 5_i32
  IMPORTANCE_HIGH_MAX = 5_i32
  PKEY_ImportanceText = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa3b29791_u32, 0x7713_u16, 0x4e1d_u16, StaticArray[0xbb_u8, 0x40_u8, 0x17_u8, 0xdb_u8, 0x85_u8, 0xf0_u8, 0x18_u8, 0x31_u8]), 100_u32)
  PKEY_IsAttachment = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf23f425c_u32, 0x71a1_u16, 0x4fa8_u16, StaticArray[0x92_u8, 0x2f_u8, 0x67_u8, 0x8e_u8, 0xa4_u8, 0xa6_u8, 0x4_u8, 0x8_u8]), 100_u32)
  PKEY_IsDefaultNonOwnerSaveLocation = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x5d76b67f_u32, 0x9b3d_u16, 0x44bb_u16, StaticArray[0xb6_u8, 0xae_u8, 0x25_u8, 0xda_u8, 0x4f_u8, 0x63_u8, 0x8a_u8, 0x67_u8]), 5_u32)
  PKEY_IsDefaultSaveLocation = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x5d76b67f_u32, 0x9b3d_u16, 0x44bb_u16, StaticArray[0xb6_u8, 0xae_u8, 0x25_u8, 0xda_u8, 0x4f_u8, 0x63_u8, 0x8a_u8, 0x67_u8]), 3_u32)
  PKEY_IsDeleted = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x5cda5fc8_u32, 0x33ee_u16, 0x4ff3_u16, StaticArray[0x90_u8, 0x94_u8, 0xae_u8, 0x7b_u8, 0xd8_u8, 0x86_u8, 0x8c_u8, 0x4d_u8]), 100_u32)
  PKEY_IsEncrypted = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x90e5e14e_u32, 0x648b_u16, 0x4826_u16, StaticArray[0xb2_u8, 0xaa_u8, 0xac_u8, 0xaf_u8, 0x79_u8, 0xe_u8, 0x35_u8, 0x13_u8]), 10_u32)
  PKEY_IsFlagged = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x5da84765_u32, 0xe3ff_u16, 0x4278_u16, StaticArray[0x86_u8, 0xb0_u8, 0xa2_u8, 0x79_u8, 0x67_u8, 0xfb_u8, 0xdd_u8, 0x3_u8]), 100_u32)
  PKEY_IsFlaggedComplete = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa6f360d2_u32, 0x55f9_u16, 0x48de_u16, StaticArray[0xb9_u8, 0x9_u8, 0x62_u8, 0xe_u8, 0x9_u8, 0xa_u8, 0x64_u8, 0x7c_u8]), 100_u32)
  PKEY_IsIncomplete = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x346c8bd1_u32, 0x2e6a_u16, 0x4c45_u16, StaticArray[0x89_u8, 0xa4_u8, 0x61_u8, 0xb7_u8, 0x8e_u8, 0x8e_u8, 0x70_u8, 0xf_u8]), 100_u32)
  PKEY_IsLocationSupported = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x5d76b67f_u32, 0x9b3d_u16, 0x44bb_u16, StaticArray[0xb6_u8, 0xae_u8, 0x25_u8, 0xda_u8, 0x4f_u8, 0x63_u8, 0x8a_u8, 0x67_u8]), 8_u32)
  PKEY_IsPinnedToNameSpaceTree = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x5d76b67f_u32, 0x9b3d_u16, 0x44bb_u16, StaticArray[0xb6_u8, 0xae_u8, 0x25_u8, 0xda_u8, 0x4f_u8, 0x63_u8, 0x8a_u8, 0x67_u8]), 2_u32)
  PKEY_IsRead = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xe3e0584c_u32, 0xb788_u16, 0x4a5a_u16, StaticArray[0xbb_u8, 0x20_u8, 0x7f_u8, 0x5a_u8, 0x44_u8, 0xc9_u8, 0xac_u8, 0xdd_u8]), 10_u32)
  PKEY_IsSearchOnlyItem = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x5d76b67f_u32, 0x9b3d_u16, 0x44bb_u16, StaticArray[0xb6_u8, 0xae_u8, 0x25_u8, 0xda_u8, 0x4f_u8, 0x63_u8, 0x8a_u8, 0x67_u8]), 4_u32)
  PKEY_IsSendToTarget = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x28636aa6_u32, 0x953d_u16, 0x11d2_u16, StaticArray[0xb5_u8, 0xd6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x18_u8, 0xd0_u8]), 33_u32)
  PKEY_IsShared = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xef884c5b_u32, 0x2bfe_u16, 0x41bb_u16, StaticArray[0xaa_u8, 0xe5_u8, 0x76_u8, 0xee_u8, 0xdf_u8, 0x4f_u8, 0x99_u8, 0x2_u8]), 100_u32)
  PKEY_ItemAuthors = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd0a04f0a_u32, 0x462a_u16, 0x48a4_u16, StaticArray[0xbb_u8, 0x2f_u8, 0x37_u8, 0x6_u8, 0xe8_u8, 0x8d_u8, 0xbd_u8, 0x7d_u8]), 100_u32)
  PKEY_ItemClassType = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x48658ad_u32, 0x2db8_u16, 0x41a4_u16, StaticArray[0xbb_u8, 0xb6_u8, 0xac_u8, 0x1e_u8, 0xf1_u8, 0x20_u8, 0x7e_u8, 0xb1_u8]), 100_u32)
  PKEY_ItemDate = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf7db74b4_u32, 0x4287_u16, 0x4103_u16, StaticArray[0xaf_u8, 0xba_u8, 0xf1_u8, 0xb1_u8, 0x3d_u8, 0xcd_u8, 0x75_u8, 0xcf_u8]), 100_u32)
  PKEY_ItemFolderNameDisplay = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb725f130_u32, 0x47ef_u16, 0x101a_u16, StaticArray[0xa5_u8, 0xf1_u8, 0x2_u8, 0x60_u8, 0x8c_u8, 0x9e_u8, 0xeb_u8, 0xac_u8]), 2_u32)
  PKEY_ItemFolderPathDisplay = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xe3e0584c_u32, 0xb788_u16, 0x4a5a_u16, StaticArray[0xbb_u8, 0x20_u8, 0x7f_u8, 0x5a_u8, 0x44_u8, 0xc9_u8, 0xac_u8, 0xdd_u8]), 6_u32)
  PKEY_ItemFolderPathDisplayNarrow = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xdabd30ed_u32, 0x43_u16, 0x4789_u16, StaticArray[0xa7_u8, 0xf8_u8, 0xd0_u8, 0x13_u8, 0xa4_u8, 0x73_u8, 0x66_u8, 0x22_u8]), 100_u32)
  PKEY_ItemName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6b8da074_u32, 0x3b5c_u16, 0x43bc_u16, StaticArray[0x88_u8, 0x6f_u8, 0xa_u8, 0x2c_u8, 0xdc_u8, 0xe0_u8, 0xb_u8, 0x6f_u8]), 100_u32)
  PKEY_ItemNameDisplay = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb725f130_u32, 0x47ef_u16, 0x101a_u16, StaticArray[0xa5_u8, 0xf1_u8, 0x2_u8, 0x60_u8, 0x8c_u8, 0x9e_u8, 0xeb_u8, 0xac_u8]), 10_u32)
  PKEY_ItemNameDisplayWithoutExtension = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb725f130_u32, 0x47ef_u16, 0x101a_u16, StaticArray[0xa5_u8, 0xf1_u8, 0x2_u8, 0x60_u8, 0x8c_u8, 0x9e_u8, 0xeb_u8, 0xac_u8]), 24_u32)
  PKEY_ItemNamePrefix = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd7313ff1_u32, 0xa77a_u16, 0x401c_u16, StaticArray[0x8c_u8, 0x99_u8, 0x3d_u8, 0xbd_u8, 0xd6_u8, 0x8a_u8, 0xdd_u8, 0x36_u8]), 100_u32)
  PKEY_ItemNameSortOverride = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb725f130_u32, 0x47ef_u16, 0x101a_u16, StaticArray[0xa5_u8, 0xf1_u8, 0x2_u8, 0x60_u8, 0x8c_u8, 0x9e_u8, 0xeb_u8, 0xac_u8]), 23_u32)
  PKEY_ItemParticipants = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd4d0aa16_u32, 0x9948_u16, 0x41a4_u16, StaticArray[0xaa_u8, 0x85_u8, 0xd9_u8, 0x7f_u8, 0xf9_u8, 0x64_u8, 0x69_u8, 0x93_u8]), 100_u32)
  PKEY_ItemPathDisplay = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xe3e0584c_u32, 0xb788_u16, 0x4a5a_u16, StaticArray[0xbb_u8, 0x20_u8, 0x7f_u8, 0x5a_u8, 0x44_u8, 0xc9_u8, 0xac_u8, 0xdd_u8]), 7_u32)
  PKEY_ItemPathDisplayNarrow = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x28636aa6_u32, 0x953d_u16, 0x11d2_u16, StaticArray[0xb5_u8, 0xd6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x18_u8, 0xd0_u8]), 8_u32)
  PKEY_ItemSubType = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x28636aa6_u32, 0x953d_u16, 0x11d2_u16, StaticArray[0xb5_u8, 0xd6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x18_u8, 0xd0_u8]), 37_u32)
  PKEY_ItemType = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x28636aa6_u32, 0x953d_u16, 0x11d2_u16, StaticArray[0xb5_u8, 0xd6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x18_u8, 0xd0_u8]), 11_u32)
  PKEY_ItemTypeText = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb725f130_u32, 0x47ef_u16, 0x101a_u16, StaticArray[0xa5_u8, 0xf1_u8, 0x2_u8, 0x60_u8, 0x8c_u8, 0x9e_u8, 0xeb_u8, 0xac_u8]), 4_u32)
  PKEY_ItemUrl = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x49691c90_u32, 0x7e17_u16, 0x101a_u16, StaticArray[0xa9_u8, 0x1c_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2e_u8, 0xcd_u8, 0xa9_u8]), 9_u32)
  PKEY_Keywords = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 5_u32)
  PKEY_Kind = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1e3ee840_u32, 0xbc2b_u16, 0x476c_u16, StaticArray[0x82_u8, 0x37_u8, 0x2a_u8, 0xcd_u8, 0x1a_u8, 0x83_u8, 0x9b_u8, 0x22_u8]), 3_u32)
  KIND_CALENDAR = "calendar"
  KIND_COMMUNICATION = "communication"
  KIND_CONTACT = "contact"
  KIND_DOCUMENT = "document"
  KIND_EMAIL = "email"
  KIND_FEED = "feed"
  KIND_FOLDER = "folder"
  KIND_GAME = "game"
  KIND_INSTANTMESSAGE = "instantmessage"
  KIND_JOURNAL = "journal"
  KIND_LINK = "link"
  KIND_MOVIE = "movie"
  KIND_MUSIC = "music"
  KIND_NOTE = "note"
  KIND_PICTURE = "picture"
  KIND_PLAYLIST = "playlist"
  KIND_PROGRAM = "program"
  KIND_RECORDEDTV = "recordedtv"
  KIND_SEARCHFOLDER = "searchfolder"
  KIND_TASK = "task"
  KIND_VIDEO = "video"
  KIND_WEBHISTORY = "webhistory"
  KIND_UNKNOWN = "unknown"
  PKEY_KindText = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf04bef95_u32, 0xc585_u16, 0x4197_u16, StaticArray[0xa2_u8, 0xb7_u8, 0xdf_u8, 0x46_u8, 0xfd_u8, 0xc9_u8, 0xee_u8, 0x6d_u8]), 100_u32)
  PKEY_Language = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd5cdd502_u32, 0x2e9c_u16, 0x101b_u16, StaticArray[0x93_u8, 0x97_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2c_u8, 0xf9_u8, 0xae_u8]), 28_u32)
  PKEY_LastSyncError = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xfceff153_u32, 0xe839_u16, 0x4cf3_u16, StaticArray[0xa9_u8, 0xe7_u8, 0xea_u8, 0x22_u8, 0x83_u8, 0x20_u8, 0x94_u8, 0xb8_u8]), 107_u32)
  PKEY_LastSyncWarning = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xfceff153_u32, 0xe839_u16, 0x4cf3_u16, StaticArray[0xa9_u8, 0xe7_u8, 0xea_u8, 0x22_u8, 0x83_u8, 0x20_u8, 0x94_u8, 0xb8_u8]), 128_u32)
  PKEY_LastWriterPackageFamilyName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x502cfeab_u32, 0x47eb_u16, 0x459c_u16, StaticArray[0xb9_u8, 0x60_u8, 0xe6_u8, 0xd8_u8, 0x72_u8, 0x8f_u8, 0x77_u8, 0x1_u8]), 101_u32)
  PKEY_LowKeywords = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 25_u32)
  PKEY_MediumKeywords = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 26_u32)
  PKEY_MileageInformation = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xfdf84370_u32, 0x31a_u16, 0x4add_u16, StaticArray[0x9e_u8, 0x91_u8, 0xd_u8, 0x77_u8, 0x5f_u8, 0x1c_u8, 0x66_u8, 0x5_u8]), 100_u32)
  PKEY_MIMEType = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb63e350_u32, 0x9ccc_u16, 0x11d0_u16, StaticArray[0xbc_u8, 0xdb_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xcc_u8, 0xce_u8, 0x4_u8]), 5_u32)
  PKEY_Null = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8]), 0_u32)
  PKEY_OfflineAvailability = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa94688b6_u32, 0x7d9f_u16, 0x4570_u16, StaticArray[0xa6_u8, 0x48_u8, 0xe3_u8, 0xdf_u8, 0xc0_u8, 0xab_u8, 0x2b_u8, 0x3f_u8]), 100_u32)
  OFFLINEAVAILABILITY_NOT_AVAILABLE = 0_u32
  OFFLINEAVAILABILITY_AVAILABLE = 1_u32
  OFFLINEAVAILABILITY_ALWAYS_AVAILABLE = 2_u32
  PKEY_OfflineStatus = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6d24888f_u32, 0x4718_u16, 0x4bda_u16, StaticArray[0xaf_u8, 0xed_u8, 0xea_u8, 0xf_u8, 0xb4_u8, 0x38_u8, 0x6c_u8, 0xd8_u8]), 100_u32)
  OFFLINESTATUS_ONLINE = 0_u32
  OFFLINESTATUS_OFFLINE = 1_u32
  OFFLINESTATUS_OFFLINE_FORCED = 2_u32
  OFFLINESTATUS_OFFLINE_SLOW = 3_u32
  OFFLINESTATUS_OFFLINE_ERROR = 4_u32
  OFFLINESTATUS_OFFLINE_ITEM_VERSION_CONFLICT = 5_u32
  OFFLINESTATUS_OFFLINE_SUSPENDED = 6_u32
  PKEY_OriginalFileName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xcef7d53_u32, 0xfa64_u16, 0x11d1_u16, StaticArray[0xa2_u8, 0x3_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x1f_u8, 0xed_u8, 0xee_u8]), 6_u32)
  PKEY_OwnerSID = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x5d76b67f_u32, 0x9b3d_u16, 0x44bb_u16, StaticArray[0xb6_u8, 0xae_u8, 0x25_u8, 0xda_u8, 0x4f_u8, 0x63_u8, 0x8a_u8, 0x67_u8]), 6_u32)
  PKEY_ParentalRating = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 21_u32)
  PKEY_ParentalRatingReason = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x10984e0a_u32, 0xf9f2_u16, 0x4321_u16, StaticArray[0xb7_u8, 0xef_u8, 0xba_u8, 0xf1_u8, 0x95_u8, 0xaf_u8, 0x43_u8, 0x19_u8]), 100_u32)
  PKEY_ParentalRatingsOrganization = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7fe0840_u32, 0x1344_u16, 0x46f0_u16, StaticArray[0x8d_u8, 0x37_u8, 0x52_u8, 0xed_u8, 0x71_u8, 0x2a_u8, 0x4b_u8, 0xf9_u8]), 100_u32)
  PKEY_ParsingBindContext = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xdfb9a04d_u32, 0x362f_u16, 0x4ca3_u16, StaticArray[0xb3_u8, 0xb_u8, 0x2_u8, 0x54_u8, 0xb1_u8, 0x7b_u8, 0x5b_u8, 0x84_u8]), 100_u32)
  PKEY_ParsingName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x28636aa6_u32, 0x953d_u16, 0x11d2_u16, StaticArray[0xb5_u8, 0xd6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x18_u8, 0xd0_u8]), 24_u32)
  PKEY_ParsingPath = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x28636aa6_u32, 0x953d_u16, 0x11d2_u16, StaticArray[0xb5_u8, 0xd6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x18_u8, 0xd0_u8]), 30_u32)
  PKEY_PerceivedType = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x28636aa6_u32, 0x953d_u16, 0x11d2_u16, StaticArray[0xb5_u8, 0xd6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x18_u8, 0xd0_u8]), 9_u32)
  PKEY_PercentFull = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x9b174b35_u32, 0x40ff_u16, 0x11d2_u16, StaticArray[0xa2_u8, 0x7e_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc3_u8, 0x8_u8, 0x71_u8]), 5_u32)
  PKEY_Priority = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x9c1fcf74_u32, 0x2d97_u16, 0x41ba_u16, StaticArray[0xb4_u8, 0xae_u8, 0xcb_u8, 0x2e_u8, 0x36_u8, 0x61_u8, 0xa6_u8, 0xe4_u8]), 5_u32)
  PKEY_PriorityText = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd98be98b_u32, 0xb86b_u16, 0x4095_u16, StaticArray[0xbf_u8, 0x52_u8, 0x9d_u8, 0x23_u8, 0xb2_u8, 0xe0_u8, 0xa7_u8, 0x52_u8]), 100_u32)
  PKEY_Project = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x39a7f922_u32, 0x477c_u16, 0x48de_u16, StaticArray[0x8b_u8, 0xc8_u8, 0xb2_u8, 0x84_u8, 0x41_u8, 0xe3_u8, 0x42_u8, 0xe3_u8]), 100_u32)
  PKEY_ProviderItemID = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf21d9941_u32, 0x81f0_u16, 0x471a_u16, StaticArray[0xad_u8, 0xee_u8, 0x4e_u8, 0x74_u8, 0xb4_u8, 0x92_u8, 0x17_u8, 0xed_u8]), 100_u32)
  PKEY_Rating = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 9_u32)
  RATING_ONE_STAR_MIN = 1_u32
  RATING_ONE_STAR_SET = 1_u32
  RATING_ONE_STAR_MAX = 12_u32
  RATING_TWO_STARS_MIN = 13_u32
  RATING_TWO_STARS_SET = 25_u32
  RATING_TWO_STARS_MAX = 37_u32
  RATING_THREE_STARS_MIN = 38_u32
  RATING_THREE_STARS_SET = 50_u32
  RATING_THREE_STARS_MAX = 62_u32
  RATING_FOUR_STARS_MIN = 63_u32
  RATING_FOUR_STARS_SET = 75_u32
  RATING_FOUR_STARS_MAX = 87_u32
  RATING_FIVE_STARS_MIN = 88_u32
  RATING_FIVE_STARS_SET = 99_u32
  RATING_FIVE_STARS_MAX = 99_u32
  PKEY_RatingText = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x90197ca7_u32, 0xfd8f_u16, 0x4e8c_u16, StaticArray[0x9d_u8, 0xa3_u8, 0xb5_u8, 0x7e_u8, 0x1e_u8, 0x60_u8, 0x92_u8, 0x95_u8]), 100_u32)
  PKEY_RemoteConflictingFile = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xfceff153_u32, 0xe839_u16, 0x4cf3_u16, StaticArray[0xa9_u8, 0xe7_u8, 0xea_u8, 0x22_u8, 0x83_u8, 0x20_u8, 0x94_u8, 0xb8_u8]), 115_u32)
  PKEY_Security_AllowedEnterpriseDataProtectionIdentities = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x38d43380_u32, 0xd418_u16, 0x4830_u16, StaticArray[0x84_u8, 0xd5_u8, 0x46_u8, 0x93_u8, 0x5a_u8, 0x81_u8, 0xc5_u8, 0xc6_u8]), 32_u32)
  PKEY_Security_EncryptionOwners = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x5f5aff6a_u32, 0x37e5_u16, 0x4780_u16, StaticArray[0x97_u8, 0xea_u8, 0x80_u8, 0xc7_u8, 0x56_u8, 0x5c_u8, 0xf5_u8, 0x35_u8]), 34_u32)
  PKEY_Security_EncryptionOwnersDisplay = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xde621b8f_u32, 0xe125_u16, 0x43a3_u16, StaticArray[0xa3_u8, 0x2d_u8, 0x56_u8, 0x65_u8, 0x44_u8, 0x6d_u8, 0x63_u8, 0x2a_u8]), 25_u32)
  PKEY_Sensitivity = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf8d3f6ac_u32, 0x4874_u16, 0x42cb_u16, StaticArray[0xbe_u8, 0x59_u8, 0xab_u8, 0x45_u8, 0x4b_u8, 0x30_u8, 0x71_u8, 0x6a_u8]), 100_u32)
  PKEY_SensitivityText = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd0c7f054_u32, 0x3f72_u16, 0x4725_u16, StaticArray[0x85_u8, 0x27_u8, 0x12_u8, 0x9a_u8, 0x57_u8, 0x7c_u8, 0xb2_u8, 0x69_u8]), 100_u32)
  PKEY_SFGAOFlags = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x28636aa6_u32, 0x953d_u16, 0x11d2_u16, StaticArray[0xb5_u8, 0xd6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x18_u8, 0xd0_u8]), 25_u32)
  PKEY_SharedWith = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xef884c5b_u32, 0x2bfe_u16, 0x41bb_u16, StaticArray[0xaa_u8, 0xe5_u8, 0x76_u8, 0xee_u8, 0xdf_u8, 0x4f_u8, 0x99_u8, 0x2_u8]), 200_u32)
  PKEY_ShareUserRating = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 12_u32)
  PKEY_SharingStatus = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xef884c5b_u32, 0x2bfe_u16, 0x41bb_u16, StaticArray[0xaa_u8, 0xe5_u8, 0x76_u8, 0xee_u8, 0xdf_u8, 0x4f_u8, 0x99_u8, 0x2_u8]), 300_u32)
  SHARINGSTATUS_NOTSHARED = 0_u32
  SHARINGSTATUS_SHARED = 1_u32
  SHARINGSTATUS_PRIVATE = 2_u32
  PKEY_Shell_OmitFromView = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xde35258c_u32, 0xc695_u16, 0x4cbc_u16, StaticArray[0xb9_u8, 0x82_u8, 0x38_u8, 0xb0_u8, 0xad_u8, 0x24_u8, 0xce_u8, 0xd0_u8]), 2_u32)
  PKEY_SimpleRating = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa09f084e_u32, 0xad41_u16, 0x489f_u16, StaticArray[0x80_u8, 0x76_u8, 0xaa_u8, 0x5b_u8, 0xe3_u8, 0x8_u8, 0x2b_u8, 0xca_u8]), 100_u32)
  PKEY_Size = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb725f130_u32, 0x47ef_u16, 0x101a_u16, StaticArray[0xa5_u8, 0xf1_u8, 0x2_u8, 0x60_u8, 0x8c_u8, 0x9e_u8, 0xeb_u8, 0xac_u8]), 12_u32)
  PKEY_SoftwareUsed = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 305_u32)
  PKEY_SourceItem = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x668cdfa5_u32, 0x7a1b_u16, 0x4323_u16, StaticArray[0xae_u8, 0x4b_u8, 0xe5_u8, 0x27_u8, 0x39_u8, 0x3a_u8, 0x1d_u8, 0x81_u8]), 100_u32)
  PKEY_SourcePackageFamilyName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xffae9db7_u32, 0x1c8d_u16, 0x43ff_u16, StaticArray[0x81_u8, 0x8c_u8, 0x84_u8, 0x40_u8, 0x3a_u8, 0xa3_u8, 0x73_u8, 0x2d_u8]), 100_u32)
  PKEY_StartDate = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x48fd6ec8_u32, 0x8a12_u16, 0x4cdf_u16, StaticArray[0xa0_u8, 0x3e_u8, 0x4e_u8, 0xc5_u8, 0xa5_u8, 0x11_u8, 0xed_u8, 0xde_u8]), 100_u32)
  PKEY_Status = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x214a1_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8]), 9_u32)
  PKEY_StorageProviderCallerVersionInformation = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb2f9b9d6_u32, 0xfec4_u16, 0x4dd5_u16, StaticArray[0x94_u8, 0xd7_u8, 0x89_u8, 0x57_u8, 0x48_u8, 0x8c_u8, 0x80_u8, 0x7b_u8]), 7_u32)
  PKEY_StorageProviderError = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xfceff153_u32, 0xe839_u16, 0x4cf3_u16, StaticArray[0xa9_u8, 0xe7_u8, 0xea_u8, 0x22_u8, 0x83_u8, 0x20_u8, 0x94_u8, 0xb8_u8]), 109_u32)
  PKEY_StorageProviderFileChecksum = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb2f9b9d6_u32, 0xfec4_u16, 0x4dd5_u16, StaticArray[0x94_u8, 0xd7_u8, 0x89_u8, 0x57_u8, 0x48_u8, 0x8c_u8, 0x80_u8, 0x7b_u8]), 5_u32)
  PKEY_StorageProviderFileFlags = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb2f9b9d6_u32, 0xfec4_u16, 0x4dd5_u16, StaticArray[0x94_u8, 0xd7_u8, 0x89_u8, 0x57_u8, 0x48_u8, 0x8c_u8, 0x80_u8, 0x7b_u8]), 8_u32)
  PKEY_StorageProviderFileHasConflict = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb2f9b9d6_u32, 0xfec4_u16, 0x4dd5_u16, StaticArray[0x94_u8, 0xd7_u8, 0x89_u8, 0x57_u8, 0x48_u8, 0x8c_u8, 0x80_u8, 0x7b_u8]), 9_u32)
  PKEY_StorageProviderFileIdentifier = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb2f9b9d6_u32, 0xfec4_u16, 0x4dd5_u16, StaticArray[0x94_u8, 0xd7_u8, 0x89_u8, 0x57_u8, 0x48_u8, 0x8c_u8, 0x80_u8, 0x7b_u8]), 3_u32)
  PKEY_StorageProviderFileRemoteUri = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xfceff153_u32, 0xe839_u16, 0x4cf3_u16, StaticArray[0xa9_u8, 0xe7_u8, 0xea_u8, 0x22_u8, 0x83_u8, 0x20_u8, 0x94_u8, 0xb8_u8]), 112_u32)
  PKEY_StorageProviderFileVersion = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb2f9b9d6_u32, 0xfec4_u16, 0x4dd5_u16, StaticArray[0x94_u8, 0xd7_u8, 0x89_u8, 0x57_u8, 0x48_u8, 0x8c_u8, 0x80_u8, 0x7b_u8]), 4_u32)
  PKEY_StorageProviderFileVersionWaterline = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb2f9b9d6_u32, 0xfec4_u16, 0x4dd5_u16, StaticArray[0x94_u8, 0xd7_u8, 0x89_u8, 0x57_u8, 0x48_u8, 0x8c_u8, 0x80_u8, 0x7b_u8]), 6_u32)
  PKEY_StorageProviderId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xfceff153_u32, 0xe839_u16, 0x4cf3_u16, StaticArray[0xa9_u8, 0xe7_u8, 0xea_u8, 0x22_u8, 0x83_u8, 0x20_u8, 0x94_u8, 0xb8_u8]), 108_u32)
  PKEY_StorageProviderShareStatuses = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xfceff153_u32, 0xe839_u16, 0x4cf3_u16, StaticArray[0xa9_u8, 0xe7_u8, 0xea_u8, 0x22_u8, 0x83_u8, 0x20_u8, 0x94_u8, 0xb8_u8]), 111_u32)
  STORAGE_PROVIDER_SHARE_STATUS_PRIVATE = "Private"
  STORAGE_PROVIDER_SHARE_STATUS_SHARED = "Shared"
  STORAGE_PROVIDER_SHARE_STATUS_PUBLIC = "Public"
  STORAGE_PROVIDER_SHARE_STATUS_GROUP = "Group"
  STORAGE_PROVIDER_SHARE_STATUS_OWNER = "Owner"
  PKEY_StorageProviderSharingStatus = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xfceff153_u32, 0xe839_u16, 0x4cf3_u16, StaticArray[0xa9_u8, 0xe7_u8, 0xea_u8, 0x22_u8, 0x83_u8, 0x20_u8, 0x94_u8, 0xb8_u8]), 117_u32)
  STORAGE_PROVIDER_SHARINGSTATUS_NOTSHARED = 0_u32
  STORAGE_PROVIDER_SHARINGSTATUS_SHARED = 1_u32
  STORAGE_PROVIDER_SHARINGSTATUS_PRIVATE = 2_u32
  STORAGE_PROVIDER_SHARINGSTATUS_PUBLIC = 3_u32
  STORAGE_PROVIDER_SHARINGSTATUS_SHARED_OWNED = 4_u32
  STORAGE_PROVIDER_SHARINGSTATUS_SHARED_COOWNED = 5_u32
  STORAGE_PROVIDER_SHARINGSTATUS_PUBLIC_OWNED = 6_u32
  STORAGE_PROVIDER_SHARINGSTATUS_PUBLIC_COOWNED = 7_u32
  PKEY_StorageProviderStatus = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xfceff153_u32, 0xe839_u16, 0x4cf3_u16, StaticArray[0xa9_u8, 0xe7_u8, 0xea_u8, 0x22_u8, 0x83_u8, 0x20_u8, 0x94_u8, 0xb8_u8]), 110_u32)
  PKEY_Subject = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 3_u32)
  PKEY_SyncTransferStatus = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xfceff153_u32, 0xe839_u16, 0x4cf3_u16, StaticArray[0xa9_u8, 0xe7_u8, 0xea_u8, 0x22_u8, 0x83_u8, 0x20_u8, 0x94_u8, 0xb8_u8]), 103_u32)
  PKEY_Thumbnail = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 17_u32)
  PKEY_ThumbnailCacheId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x446d16b1_u32, 0x8dad_u16, 0x4870_u16, StaticArray[0xa7_u8, 0x48_u8, 0x40_u8, 0x2e_u8, 0xa4_u8, 0x3d_u8, 0x78_u8, 0x8c_u8]), 100_u32)
  PKEY_ThumbnailStream = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 27_u32)
  PKEY_Title = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 2_u32)
  PKEY_TitleSortOverride = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf0f7984d_u32, 0x222e_u16, 0x4ad2_u16, StaticArray[0x82_u8, 0xab_u8, 0x1d_u8, 0xd8_u8, 0xea_u8, 0x40_u8, 0xe5_u8, 0x7e_u8]), 300_u32)
  PKEY_TotalFileSize = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x28636aa6_u32, 0x953d_u16, 0x11d2_u16, StaticArray[0xb5_u8, 0xd6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x18_u8, 0xd0_u8]), 14_u32)
  PKEY_Trademarks = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xcef7d53_u32, 0xfa64_u16, 0x11d1_u16, StaticArray[0xa2_u8, 0x3_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x1f_u8, 0xed_u8, 0xee_u8]), 9_u32)
  PKEY_TransferOrder = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xfceff153_u32, 0xe839_u16, 0x4cf3_u16, StaticArray[0xa9_u8, 0xe7_u8, 0xea_u8, 0x22_u8, 0x83_u8, 0x20_u8, 0x94_u8, 0xb8_u8]), 106_u32)
  PKEY_TransferPosition = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xfceff153_u32, 0xe839_u16, 0x4cf3_u16, StaticArray[0xa9_u8, 0xe7_u8, 0xea_u8, 0x22_u8, 0x83_u8, 0x20_u8, 0x94_u8, 0xb8_u8]), 104_u32)
  PKEY_TransferSize = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xfceff153_u32, 0xe839_u16, 0x4cf3_u16, StaticArray[0xa9_u8, 0xe7_u8, 0xea_u8, 0x22_u8, 0x83_u8, 0x20_u8, 0x94_u8, 0xb8_u8]), 105_u32)
  PKEY_VolumeId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x446d16b1_u32, 0x8dad_u16, 0x4870_u16, StaticArray[0xa7_u8, 0x48_u8, 0x40_u8, 0x2e_u8, 0xa4_u8, 0x3d_u8, 0x78_u8, 0x8c_u8]), 104_u32)
  PKEY_ZoneIdentifier = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x502cfeab_u32, 0x47eb_u16, 0x459c_u16, StaticArray[0xb9_u8, 0x60_u8, 0xe6_u8, 0xd8_u8, 0x72_u8, 0x8f_u8, 0x77_u8, 0x1_u8]), 100_u32)
  PKEY_Device_PrinterURL = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb48f35a_u32, 0xbe6e_u16, 0x4f17_u16, StaticArray[0xb1_u8, 0x8_u8, 0x3c_u8, 0x40_u8, 0x73_u8, 0xd1_u8, 0x66_u8, 0x9a_u8]), 15_u32)
  PKEY_DeviceInterface_Bluetooth_DeviceAddress = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x2bd67d8b_u32, 0x8beb_u16, 0x48d5_u16, StaticArray[0x87_u8, 0xe0_u8, 0x6c_u8, 0xda_u8, 0x34_u8, 0x28_u8, 0x4_u8, 0xa_u8]), 1_u32)
  PKEY_DeviceInterface_Bluetooth_Flags = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x2bd67d8b_u32, 0x8beb_u16, 0x48d5_u16, StaticArray[0x87_u8, 0xe0_u8, 0x6c_u8, 0xda_u8, 0x34_u8, 0x28_u8, 0x4_u8, 0xa_u8]), 3_u32)
  PKEY_DeviceInterface_Bluetooth_LastConnectedTime = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x2bd67d8b_u32, 0x8beb_u16, 0x48d5_u16, StaticArray[0x87_u8, 0xe0_u8, 0x6c_u8, 0xda_u8, 0x34_u8, 0x28_u8, 0x4_u8, 0xa_u8]), 11_u32)
  PKEY_DeviceInterface_Bluetooth_Manufacturer = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x2bd67d8b_u32, 0x8beb_u16, 0x48d5_u16, StaticArray[0x87_u8, 0xe0_u8, 0x6c_u8, 0xda_u8, 0x34_u8, 0x28_u8, 0x4_u8, 0xa_u8]), 4_u32)
  PKEY_DeviceInterface_Bluetooth_ModelNumber = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x2bd67d8b_u32, 0x8beb_u16, 0x48d5_u16, StaticArray[0x87_u8, 0xe0_u8, 0x6c_u8, 0xda_u8, 0x34_u8, 0x28_u8, 0x4_u8, 0xa_u8]), 5_u32)
  PKEY_DeviceInterface_Bluetooth_ProductId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x2bd67d8b_u32, 0x8beb_u16, 0x48d5_u16, StaticArray[0x87_u8, 0xe0_u8, 0x6c_u8, 0xda_u8, 0x34_u8, 0x28_u8, 0x4_u8, 0xa_u8]), 8_u32)
  PKEY_DeviceInterface_Bluetooth_ProductVersion = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x2bd67d8b_u32, 0x8beb_u16, 0x48d5_u16, StaticArray[0x87_u8, 0xe0_u8, 0x6c_u8, 0xda_u8, 0x34_u8, 0x28_u8, 0x4_u8, 0xa_u8]), 9_u32)
  PKEY_DeviceInterface_Bluetooth_ServiceGuid = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x2bd67d8b_u32, 0x8beb_u16, 0x48d5_u16, StaticArray[0x87_u8, 0xe0_u8, 0x6c_u8, 0xda_u8, 0x34_u8, 0x28_u8, 0x4_u8, 0xa_u8]), 2_u32)
  PKEY_DeviceInterface_Bluetooth_VendorId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x2bd67d8b_u32, 0x8beb_u16, 0x48d5_u16, StaticArray[0x87_u8, 0xe0_u8, 0x6c_u8, 0xda_u8, 0x34_u8, 0x28_u8, 0x4_u8, 0xa_u8]), 7_u32)
  PKEY_DeviceInterface_Bluetooth_VendorIdSource = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x2bd67d8b_u32, 0x8beb_u16, 0x48d5_u16, StaticArray[0x87_u8, 0xe0_u8, 0x6c_u8, 0xda_u8, 0x34_u8, 0x28_u8, 0x4_u8, 0xa_u8]), 6_u32)
  PKEY_DeviceInterface_Hid_IsReadOnly = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xcbf38310_u32, 0x4a17_u16, 0x4310_u16, StaticArray[0xa1_u8, 0xeb_u8, 0x24_u8, 0x7f_u8, 0xb_u8, 0x67_u8, 0x59_u8, 0x3b_u8]), 4_u32)
  PKEY_DeviceInterface_Hid_ProductId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xcbf38310_u32, 0x4a17_u16, 0x4310_u16, StaticArray[0xa1_u8, 0xeb_u8, 0x24_u8, 0x7f_u8, 0xb_u8, 0x67_u8, 0x59_u8, 0x3b_u8]), 6_u32)
  PKEY_DeviceInterface_Hid_UsageId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xcbf38310_u32, 0x4a17_u16, 0x4310_u16, StaticArray[0xa1_u8, 0xeb_u8, 0x24_u8, 0x7f_u8, 0xb_u8, 0x67_u8, 0x59_u8, 0x3b_u8]), 3_u32)
  PKEY_DeviceInterface_Hid_UsagePage = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xcbf38310_u32, 0x4a17_u16, 0x4310_u16, StaticArray[0xa1_u8, 0xeb_u8, 0x24_u8, 0x7f_u8, 0xb_u8, 0x67_u8, 0x59_u8, 0x3b_u8]), 2_u32)
  PKEY_DeviceInterface_Hid_VendorId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xcbf38310_u32, 0x4a17_u16, 0x4310_u16, StaticArray[0xa1_u8, 0xeb_u8, 0x24_u8, 0x7f_u8, 0xb_u8, 0x67_u8, 0x59_u8, 0x3b_u8]), 5_u32)
  PKEY_DeviceInterface_Hid_VersionNumber = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xcbf38310_u32, 0x4a17_u16, 0x4310_u16, StaticArray[0xa1_u8, 0xeb_u8, 0x24_u8, 0x7f_u8, 0xb_u8, 0x67_u8, 0x59_u8, 0x3b_u8]), 7_u32)
  PKEY_DeviceInterface_PrinterDriverDirectory = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x847c66de_u32, 0xb8d6_u16, 0x4af9_u16, StaticArray[0xab_u8, 0xc3_u8, 0x6f_u8, 0x4f_u8, 0x92_u8, 0x6b_u8, 0xc0_u8, 0x39_u8]), 14_u32)
  PKEY_DeviceInterface_PrinterDriverName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xafc47170_u32, 0x14f5_u16, 0x498c_u16, StaticArray[0x8f_u8, 0x30_u8, 0xb0_u8, 0xd1_u8, 0x9b_u8, 0xe4_u8, 0x49_u8, 0xc6_u8]), 11_u32)
  PKEY_DeviceInterface_PrinterEnumerationFlag = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa00742a1_u32, 0xcd8c_u16, 0x4b37_u16, StaticArray[0x95_u8, 0xab_u8, 0x70_u8, 0x75_u8, 0x55_u8, 0x87_u8, 0x76_u8, 0x7a_u8]), 3_u32)
  PKEY_DeviceInterface_PrinterName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa7b84ef_u32, 0xc27_u16, 0x463f_u16, StaticArray[0x84_u8, 0xef_u8, 0x6_u8, 0xc5_u8, 0x7_u8, 0x0_u8, 0x1_u8, 0xbe_u8]), 10_u32)
  PKEY_DeviceInterface_PrinterPortName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xeec7b761_u32, 0x6f94_u16, 0x41b1_u16, StaticArray[0x94_u8, 0x9f_u8, 0xc7_u8, 0x29_u8, 0x72_u8, 0xd_u8, 0xd1_u8, 0x3c_u8]), 12_u32)
  PKEY_DeviceInterface_Proximity_SupportsNfc = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xfb3842cd_u32, 0x9e2a_u16, 0x4f83_u16, StaticArray[0x8f_u8, 0xcc_u8, 0x4b_u8, 0x7_u8, 0x61_u8, 0x13_u8, 0x9a_u8, 0xe9_u8]), 2_u32)
  PKEY_DeviceInterface_Serial_PortName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4c6bf15c_u32, 0x4c03_u16, 0x4aac_u16, StaticArray[0x91_u8, 0xf5_u8, 0x64_u8, 0xc0_u8, 0xf8_u8, 0x52_u8, 0xbc_u8, 0xf4_u8]), 4_u32)
  PKEY_DeviceInterface_Serial_UsbProductId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4c6bf15c_u32, 0x4c03_u16, 0x4aac_u16, StaticArray[0x91_u8, 0xf5_u8, 0x64_u8, 0xc0_u8, 0xf8_u8, 0x52_u8, 0xbc_u8, 0xf4_u8]), 3_u32)
  PKEY_DeviceInterface_Serial_UsbVendorId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4c6bf15c_u32, 0x4c03_u16, 0x4aac_u16, StaticArray[0x91_u8, 0xf5_u8, 0x64_u8, 0xc0_u8, 0xf8_u8, 0x52_u8, 0xbc_u8, 0xf4_u8]), 2_u32)
  PKEY_DeviceInterface_WinUsb_DeviceInterfaceClasses = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x95e127b5_u32, 0x79cc_u16, 0x4e83_u16, StaticArray[0x9c_u8, 0x9e_u8, 0x84_u8, 0x22_u8, 0x18_u8, 0x7b_u8, 0x3e_u8, 0xe_u8]), 7_u32)
  PKEY_DeviceInterface_WinUsb_UsbClass = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x95e127b5_u32, 0x79cc_u16, 0x4e83_u16, StaticArray[0x9c_u8, 0x9e_u8, 0x84_u8, 0x22_u8, 0x18_u8, 0x7b_u8, 0x3e_u8, 0xe_u8]), 4_u32)
  PKEY_DeviceInterface_WinUsb_UsbProductId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x95e127b5_u32, 0x79cc_u16, 0x4e83_u16, StaticArray[0x9c_u8, 0x9e_u8, 0x84_u8, 0x22_u8, 0x18_u8, 0x7b_u8, 0x3e_u8, 0xe_u8]), 3_u32)
  PKEY_DeviceInterface_WinUsb_UsbProtocol = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x95e127b5_u32, 0x79cc_u16, 0x4e83_u16, StaticArray[0x9c_u8, 0x9e_u8, 0x84_u8, 0x22_u8, 0x18_u8, 0x7b_u8, 0x3e_u8, 0xe_u8]), 6_u32)
  PKEY_DeviceInterface_WinUsb_UsbSubClass = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x95e127b5_u32, 0x79cc_u16, 0x4e83_u16, StaticArray[0x9c_u8, 0x9e_u8, 0x84_u8, 0x22_u8, 0x18_u8, 0x7b_u8, 0x3e_u8, 0xe_u8]), 5_u32)
  PKEY_DeviceInterface_WinUsb_UsbVendorId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x95e127b5_u32, 0x79cc_u16, 0x4e83_u16, StaticArray[0x9c_u8, 0x9e_u8, 0x84_u8, 0x22_u8, 0x18_u8, 0x7b_u8, 0x3e_u8, 0xe_u8]), 2_u32)
  PKEY_Devices_Aep_AepId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x3b2ce006_u32, 0x5e61_u16, 0x4fde_u16, StaticArray[0xba_u8, 0xb8_u8, 0x9b_u8, 0x8a_u8, 0xac_u8, 0x9b_u8, 0x26_u8, 0xdf_u8]), 8_u32)
  PKEY_Devices_Aep_Bluetooth_Cod_Major = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x5fbd34cd_u32, 0x561a_u16, 0x412e_u16, StaticArray[0xba_u8, 0x98_u8, 0x47_u8, 0x8a_u8, 0x6b_u8, 0xf_u8, 0xef_u8, 0x1d_u8]), 2_u32)
  PKEY_Devices_Aep_Bluetooth_Cod_Minor = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x5fbd34cd_u32, 0x561a_u16, 0x412e_u16, StaticArray[0xba_u8, 0x98_u8, 0x47_u8, 0x8a_u8, 0x6b_u8, 0xf_u8, 0xef_u8, 0x1d_u8]), 3_u32)
  PKEY_Devices_Aep_Bluetooth_Cod_Services_Audio = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x5fbd34cd_u32, 0x561a_u16, 0x412e_u16, StaticArray[0xba_u8, 0x98_u8, 0x47_u8, 0x8a_u8, 0x6b_u8, 0xf_u8, 0xef_u8, 0x1d_u8]), 10_u32)
  PKEY_Devices_Aep_Bluetooth_Cod_Services_Capturing = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x5fbd34cd_u32, 0x561a_u16, 0x412e_u16, StaticArray[0xba_u8, 0x98_u8, 0x47_u8, 0x8a_u8, 0x6b_u8, 0xf_u8, 0xef_u8, 0x1d_u8]), 8_u32)
  PKEY_Devices_Aep_Bluetooth_Cod_Services_Information = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x5fbd34cd_u32, 0x561a_u16, 0x412e_u16, StaticArray[0xba_u8, 0x98_u8, 0x47_u8, 0x8a_u8, 0x6b_u8, 0xf_u8, 0xef_u8, 0x1d_u8]), 12_u32)
  PKEY_Devices_Aep_Bluetooth_Cod_Services_LimitedDiscovery = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x5fbd34cd_u32, 0x561a_u16, 0x412e_u16, StaticArray[0xba_u8, 0x98_u8, 0x47_u8, 0x8a_u8, 0x6b_u8, 0xf_u8, 0xef_u8, 0x1d_u8]), 4_u32)
  PKEY_Devices_Aep_Bluetooth_Cod_Services_Networking = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x5fbd34cd_u32, 0x561a_u16, 0x412e_u16, StaticArray[0xba_u8, 0x98_u8, 0x47_u8, 0x8a_u8, 0x6b_u8, 0xf_u8, 0xef_u8, 0x1d_u8]), 6_u32)
  PKEY_Devices_Aep_Bluetooth_Cod_Services_ObjectXfer = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x5fbd34cd_u32, 0x561a_u16, 0x412e_u16, StaticArray[0xba_u8, 0x98_u8, 0x47_u8, 0x8a_u8, 0x6b_u8, 0xf_u8, 0xef_u8, 0x1d_u8]), 9_u32)
  PKEY_Devices_Aep_Bluetooth_Cod_Services_Positioning = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x5fbd34cd_u32, 0x561a_u16, 0x412e_u16, StaticArray[0xba_u8, 0x98_u8, 0x47_u8, 0x8a_u8, 0x6b_u8, 0xf_u8, 0xef_u8, 0x1d_u8]), 5_u32)
  PKEY_Devices_Aep_Bluetooth_Cod_Services_Rendering = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x5fbd34cd_u32, 0x561a_u16, 0x412e_u16, StaticArray[0xba_u8, 0x98_u8, 0x47_u8, 0x8a_u8, 0x6b_u8, 0xf_u8, 0xef_u8, 0x1d_u8]), 7_u32)
  PKEY_Devices_Aep_Bluetooth_Cod_Services_Telephony = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x5fbd34cd_u32, 0x561a_u16, 0x412e_u16, StaticArray[0xba_u8, 0x98_u8, 0x47_u8, 0x8a_u8, 0x6b_u8, 0xf_u8, 0xef_u8, 0x1d_u8]), 11_u32)
  PKEY_Devices_Aep_Bluetooth_LastSeenTime = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x2bd67d8b_u32, 0x8beb_u16, 0x48d5_u16, StaticArray[0x87_u8, 0xe0_u8, 0x6c_u8, 0xda_u8, 0x34_u8, 0x28_u8, 0x4_u8, 0xa_u8]), 12_u32)
  PKEY_Devices_Aep_Bluetooth_Le_AddressType = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x995ef0b0_u32, 0x7eb3_u16, 0x4a8b_u16, StaticArray[0xb9_u8, 0xce_u8, 0x6_u8, 0x8b_u8, 0xb3_u8, 0xf4_u8, 0xaf_u8, 0x69_u8]), 4_u32)
  BLUETOOTH_ADDRESS_TYPE_PUBLIC = 0_u32
  BLUETOOTH_ADDRESS_TYPE_RANDOM = 1_u32
  PKEY_Devices_Aep_Bluetooth_Le_Appearance = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x995ef0b0_u32, 0x7eb3_u16, 0x4a8b_u16, StaticArray[0xb9_u8, 0xce_u8, 0x6_u8, 0x8b_u8, 0xb3_u8, 0xf4_u8, 0xaf_u8, 0x69_u8]), 1_u32)
  PKEY_Devices_Aep_Bluetooth_Le_Appearance_Category = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x995ef0b0_u32, 0x7eb3_u16, 0x4a8b_u16, StaticArray[0xb9_u8, 0xce_u8, 0x6_u8, 0x8b_u8, 0xb3_u8, 0xf4_u8, 0xaf_u8, 0x69_u8]), 5_u32)
  PKEY_Devices_Aep_Bluetooth_Le_Appearance_Subcategory = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x995ef0b0_u32, 0x7eb3_u16, 0x4a8b_u16, StaticArray[0xb9_u8, 0xce_u8, 0x6_u8, 0x8b_u8, 0xb3_u8, 0xf4_u8, 0xaf_u8, 0x69_u8]), 6_u32)
  PKEY_Devices_Aep_Bluetooth_Le_IsConnectable = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x995ef0b0_u32, 0x7eb3_u16, 0x4a8b_u16, StaticArray[0xb9_u8, 0xce_u8, 0x6_u8, 0x8b_u8, 0xb3_u8, 0xf4_u8, 0xaf_u8, 0x69_u8]), 8_u32)
  PKEY_Devices_Aep_CanPair = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xe7c3fb29_u32, 0xcaa7_u16, 0x4f47_u16, StaticArray[0x8c_u8, 0x8b_u8, 0xbe_u8, 0x59_u8, 0xb3_u8, 0x30_u8, 0xd4_u8, 0xc5_u8]), 3_u32)
  PKEY_Devices_Aep_Category = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa35996ab_u32, 0x11cf_u16, 0x4935_u16, StaticArray[0x8b_u8, 0x61_u8, 0xa6_u8, 0x76_u8, 0x10_u8, 0x81_u8, 0xec_u8, 0xdf_u8]), 17_u32)
  PKEY_Devices_Aep_ContainerId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xe7c3fb29_u32, 0xcaa7_u16, 0x4f47_u16, StaticArray[0x8c_u8, 0x8b_u8, 0xbe_u8, 0x59_u8, 0xb3_u8, 0x30_u8, 0xd4_u8, 0xc5_u8]), 2_u32)
  PKEY_Devices_Aep_DeviceAddress = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa35996ab_u32, 0x11cf_u16, 0x4935_u16, StaticArray[0x8b_u8, 0x61_u8, 0xa6_u8, 0x76_u8, 0x10_u8, 0x81_u8, 0xec_u8, 0xdf_u8]), 12_u32)
  PKEY_Devices_Aep_IsConnected = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa35996ab_u32, 0x11cf_u16, 0x4935_u16, StaticArray[0x8b_u8, 0x61_u8, 0xa6_u8, 0x76_u8, 0x10_u8, 0x81_u8, 0xec_u8, 0xdf_u8]), 7_u32)
  PKEY_Devices_Aep_IsPaired = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa35996ab_u32, 0x11cf_u16, 0x4935_u16, StaticArray[0x8b_u8, 0x61_u8, 0xa6_u8, 0x76_u8, 0x10_u8, 0x81_u8, 0xec_u8, 0xdf_u8]), 16_u32)
  PKEY_Devices_Aep_IsPresent = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa35996ab_u32, 0x11cf_u16, 0x4935_u16, StaticArray[0x8b_u8, 0x61_u8, 0xa6_u8, 0x76_u8, 0x10_u8, 0x81_u8, 0xec_u8, 0xdf_u8]), 9_u32)
  PKEY_Devices_Aep_Manufacturer = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa35996ab_u32, 0x11cf_u16, 0x4935_u16, StaticArray[0x8b_u8, 0x61_u8, 0xa6_u8, 0x76_u8, 0x10_u8, 0x81_u8, 0xec_u8, 0xdf_u8]), 5_u32)
  PKEY_Devices_Aep_ModelId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa35996ab_u32, 0x11cf_u16, 0x4935_u16, StaticArray[0x8b_u8, 0x61_u8, 0xa6_u8, 0x76_u8, 0x10_u8, 0x81_u8, 0xec_u8, 0xdf_u8]), 4_u32)
  PKEY_Devices_Aep_ModelName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa35996ab_u32, 0x11cf_u16, 0x4935_u16, StaticArray[0x8b_u8, 0x61_u8, 0xa6_u8, 0x76_u8, 0x10_u8, 0x81_u8, 0xec_u8, 0xdf_u8]), 3_u32)
  PKEY_Devices_Aep_PointOfService_ConnectionTypes = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd4bf61b3_u32, 0x442e_u16, 0x4ada_u16, StaticArray[0x88_u8, 0x2d_u8, 0xfa_u8, 0x7b_u8, 0x70_u8, 0xc8_u8, 0x32_u8, 0xd9_u8]), 6_u32)
  PKEY_Devices_Aep_ProtocolId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x3b2ce006_u32, 0x5e61_u16, 0x4fde_u16, StaticArray[0xba_u8, 0xb8_u8, 0x9b_u8, 0x8a_u8, 0xac_u8, 0x9b_u8, 0x26_u8, 0xdf_u8]), 5_u32)
  PKEY_Devices_Aep_SignalStrength = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa35996ab_u32, 0x11cf_u16, 0x4935_u16, StaticArray[0x8b_u8, 0x61_u8, 0xa6_u8, 0x76_u8, 0x10_u8, 0x81_u8, 0xec_u8, 0xdf_u8]), 6_u32)
  PKEY_Devices_AepContainer_CanPair = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xbba1ede_u32, 0x7566_u16, 0x4f47_u16, StaticArray[0x90_u8, 0xec_u8, 0x25_u8, 0xfc_u8, 0x56_u8, 0x7c_u8, 0xed_u8, 0x2a_u8]), 3_u32)
  PKEY_Devices_AepContainer_Categories = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xbba1ede_u32, 0x7566_u16, 0x4f47_u16, StaticArray[0x90_u8, 0xec_u8, 0x25_u8, 0xfc_u8, 0x56_u8, 0x7c_u8, 0xed_u8, 0x2a_u8]), 9_u32)
  PKEY_Devices_AepContainer_Children = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xbba1ede_u32, 0x7566_u16, 0x4f47_u16, StaticArray[0x90_u8, 0xec_u8, 0x25_u8, 0xfc_u8, 0x56_u8, 0x7c_u8, 0xed_u8, 0x2a_u8]), 2_u32)
  PKEY_Devices_AepContainer_ContainerId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xbba1ede_u32, 0x7566_u16, 0x4f47_u16, StaticArray[0x90_u8, 0xec_u8, 0x25_u8, 0xfc_u8, 0x56_u8, 0x7c_u8, 0xed_u8, 0x2a_u8]), 12_u32)
  PKEY_Devices_AepContainer_DialProtocol_InstalledApplications = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6af55d45_u32, 0x38db_u16, 0x4495_u16, StaticArray[0xac_u8, 0xb0_u8, 0xd4_u8, 0x72_u8, 0x8a_u8, 0x3b_u8, 0x83_u8, 0x14_u8]), 6_u32)
  PKEY_Devices_AepContainer_IsPaired = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xbba1ede_u32, 0x7566_u16, 0x4f47_u16, StaticArray[0x90_u8, 0xec_u8, 0x25_u8, 0xfc_u8, 0x56_u8, 0x7c_u8, 0xed_u8, 0x2a_u8]), 4_u32)
  PKEY_Devices_AepContainer_IsPresent = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xbba1ede_u32, 0x7566_u16, 0x4f47_u16, StaticArray[0x90_u8, 0xec_u8, 0x25_u8, 0xfc_u8, 0x56_u8, 0x7c_u8, 0xed_u8, 0x2a_u8]), 11_u32)
  PKEY_Devices_AepContainer_Manufacturer = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xbba1ede_u32, 0x7566_u16, 0x4f47_u16, StaticArray[0x90_u8, 0xec_u8, 0x25_u8, 0xfc_u8, 0x56_u8, 0x7c_u8, 0xed_u8, 0x2a_u8]), 6_u32)
  PKEY_Devices_AepContainer_ModelIds = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xbba1ede_u32, 0x7566_u16, 0x4f47_u16, StaticArray[0x90_u8, 0xec_u8, 0x25_u8, 0xfc_u8, 0x56_u8, 0x7c_u8, 0xed_u8, 0x2a_u8]), 8_u32)
  PKEY_Devices_AepContainer_ModelName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xbba1ede_u32, 0x7566_u16, 0x4f47_u16, StaticArray[0x90_u8, 0xec_u8, 0x25_u8, 0xfc_u8, 0x56_u8, 0x7c_u8, 0xed_u8, 0x2a_u8]), 7_u32)
  PKEY_Devices_AepContainer_ProtocolIds = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xbba1ede_u32, 0x7566_u16, 0x4f47_u16, StaticArray[0x90_u8, 0xec_u8, 0x25_u8, 0xfc_u8, 0x56_u8, 0x7c_u8, 0xed_u8, 0x2a_u8]), 13_u32)
  PKEY_Devices_AepContainer_SupportedUriSchemes = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6af55d45_u32, 0x38db_u16, 0x4495_u16, StaticArray[0xac_u8, 0xb0_u8, 0xd4_u8, 0x72_u8, 0x8a_u8, 0x3b_u8, 0x83_u8, 0x14_u8]), 5_u32)
  PKEY_Devices_AepContainer_SupportsAudio = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6af55d45_u32, 0x38db_u16, 0x4495_u16, StaticArray[0xac_u8, 0xb0_u8, 0xd4_u8, 0x72_u8, 0x8a_u8, 0x3b_u8, 0x83_u8, 0x14_u8]), 2_u32)
  PKEY_Devices_AepContainer_SupportsCapturing = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6af55d45_u32, 0x38db_u16, 0x4495_u16, StaticArray[0xac_u8, 0xb0_u8, 0xd4_u8, 0x72_u8, 0x8a_u8, 0x3b_u8, 0x83_u8, 0x14_u8]), 11_u32)
  PKEY_Devices_AepContainer_SupportsImages = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6af55d45_u32, 0x38db_u16, 0x4495_u16, StaticArray[0xac_u8, 0xb0_u8, 0xd4_u8, 0x72_u8, 0x8a_u8, 0x3b_u8, 0x83_u8, 0x14_u8]), 4_u32)
  PKEY_Devices_AepContainer_SupportsInformation = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6af55d45_u32, 0x38db_u16, 0x4495_u16, StaticArray[0xac_u8, 0xb0_u8, 0xd4_u8, 0x72_u8, 0x8a_u8, 0x3b_u8, 0x83_u8, 0x14_u8]), 14_u32)
  PKEY_Devices_AepContainer_SupportsLimitedDiscovery = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6af55d45_u32, 0x38db_u16, 0x4495_u16, StaticArray[0xac_u8, 0xb0_u8, 0xd4_u8, 0x72_u8, 0x8a_u8, 0x3b_u8, 0x83_u8, 0x14_u8]), 7_u32)
  PKEY_Devices_AepContainer_SupportsNetworking = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6af55d45_u32, 0x38db_u16, 0x4495_u16, StaticArray[0xac_u8, 0xb0_u8, 0xd4_u8, 0x72_u8, 0x8a_u8, 0x3b_u8, 0x83_u8, 0x14_u8]), 9_u32)
  PKEY_Devices_AepContainer_SupportsObjectTransfer = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6af55d45_u32, 0x38db_u16, 0x4495_u16, StaticArray[0xac_u8, 0xb0_u8, 0xd4_u8, 0x72_u8, 0x8a_u8, 0x3b_u8, 0x83_u8, 0x14_u8]), 12_u32)
  PKEY_Devices_AepContainer_SupportsPositioning = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6af55d45_u32, 0x38db_u16, 0x4495_u16, StaticArray[0xac_u8, 0xb0_u8, 0xd4_u8, 0x72_u8, 0x8a_u8, 0x3b_u8, 0x83_u8, 0x14_u8]), 8_u32)
  PKEY_Devices_AepContainer_SupportsRendering = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6af55d45_u32, 0x38db_u16, 0x4495_u16, StaticArray[0xac_u8, 0xb0_u8, 0xd4_u8, 0x72_u8, 0x8a_u8, 0x3b_u8, 0x83_u8, 0x14_u8]), 10_u32)
  PKEY_Devices_AepContainer_SupportsTelephony = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6af55d45_u32, 0x38db_u16, 0x4495_u16, StaticArray[0xac_u8, 0xb0_u8, 0xd4_u8, 0x72_u8, 0x8a_u8, 0x3b_u8, 0x83_u8, 0x14_u8]), 13_u32)
  PKEY_Devices_AepContainer_SupportsVideo = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6af55d45_u32, 0x38db_u16, 0x4495_u16, StaticArray[0xac_u8, 0xb0_u8, 0xd4_u8, 0x72_u8, 0x8a_u8, 0x3b_u8, 0x83_u8, 0x14_u8]), 3_u32)
  PKEY_Devices_AepService_AepId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc9c141a9_u32, 0x1b4c_u16, 0x4f17_u16, StaticArray[0xa9_u8, 0xd1_u8, 0xf2_u8, 0x98_u8, 0x53_u8, 0x8c_u8, 0xad_u8, 0xb8_u8]), 6_u32)
  PKEY_Devices_AepService_Bluetooth_CacheMode = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x9744311e_u32, 0x7951_u16, 0x4b2e_u16, StaticArray[0xb6_u8, 0xf0_u8, 0xec_u8, 0xb2_u8, 0x93_u8, 0xca_u8, 0xc1_u8, 0x19_u8]), 5_u32)
  BLUETOOTH_CACHE_MODE_CACHED = 0_u32
  BLUETOOTH_CACHED_MODE_UNCACHED = 1_u32
  PKEY_Devices_AepService_Bluetooth_ServiceGuid = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa399aac7_u32, 0xc265_u16, 0x474e_u16, StaticArray[0xb0_u8, 0x73_u8, 0xff_u8, 0xce_u8, 0x57_u8, 0x72_u8, 0x17_u8, 0x16_u8]), 2_u32)
  PKEY_Devices_AepService_Bluetooth_TargetDevice = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x9744311e_u32, 0x7951_u16, 0x4b2e_u16, StaticArray[0xb6_u8, 0xf0_u8, 0xec_u8, 0xb2_u8, 0x93_u8, 0xca_u8, 0xc1_u8, 0x19_u8]), 6_u32)
  PKEY_Devices_AepService_ContainerId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x71724756_u32, 0x3e74_u16, 0x4432_u16, StaticArray[0x9b_u8, 0x59_u8, 0xe7_u8, 0xb2_u8, 0xf6_u8, 0x68_u8, 0xa5_u8, 0x93_u8]), 4_u32)
  PKEY_Devices_AepService_FriendlyName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x71724756_u32, 0x3e74_u16, 0x4432_u16, StaticArray[0x9b_u8, 0x59_u8, 0xe7_u8, 0xb2_u8, 0xf6_u8, 0x68_u8, 0xa5_u8, 0x93_u8]), 2_u32)
  PKEY_Devices_AepService_IoT_ServiceInterfaces = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x79d94e82_u32, 0x4d79_u16, 0x45aa_u16, StaticArray[0x82_u8, 0x1a_u8, 0x74_u8, 0x85_u8, 0x8b_u8, 0x4e_u8, 0x4c_u8, 0xa6_u8]), 2_u32)
  PKEY_Devices_AepService_ParentAepIsPaired = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc9c141a9_u32, 0x1b4c_u16, 0x4f17_u16, StaticArray[0xa9_u8, 0xd1_u8, 0xf2_u8, 0x98_u8, 0x53_u8, 0x8c_u8, 0xad_u8, 0xb8_u8]), 7_u32)
  PKEY_Devices_AepService_ProtocolId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc9c141a9_u32, 0x1b4c_u16, 0x4f17_u16, StaticArray[0xa9_u8, 0xd1_u8, 0xf2_u8, 0x98_u8, 0x53_u8, 0x8c_u8, 0xad_u8, 0xb8_u8]), 5_u32)
  PKEY_Devices_AepService_ServiceClassId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x71724756_u32, 0x3e74_u16, 0x4432_u16, StaticArray[0x9b_u8, 0x59_u8, 0xe7_u8, 0xb2_u8, 0xf6_u8, 0x68_u8, 0xa5_u8, 0x93_u8]), 3_u32)
  PKEY_Devices_AepService_ServiceId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc9c141a9_u32, 0x1b4c_u16, 0x4f17_u16, StaticArray[0xa9_u8, 0xd1_u8, 0xf2_u8, 0x98_u8, 0x53_u8, 0x8c_u8, 0xad_u8, 0xb8_u8]), 2_u32)
  PKEY_Devices_AppPackageFamilyName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x51236583_u32, 0xc4a_u16, 0x4fe8_u16, StaticArray[0xb8_u8, 0x1f_u8, 0x16_u8, 0x6a_u8, 0xec_u8, 0x13_u8, 0xf5_u8, 0x10_u8]), 100_u32)
  PKEY_Devices_AudioDevice_Microphone_IsFarField = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8943b373_u32, 0x388c_u16, 0x4395_u16, StaticArray[0xb5_u8, 0x57_u8, 0xbc_u8, 0x6d_u8, 0xba_u8, 0xff_u8, 0xaf_u8, 0xdb_u8]), 6_u32)
  PKEY_Devices_AudioDevice_Microphone_SensitivityInDbfs = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8943b373_u32, 0x388c_u16, 0x4395_u16, StaticArray[0xb5_u8, 0x57_u8, 0xbc_u8, 0x6d_u8, 0xba_u8, 0xff_u8, 0xaf_u8, 0xdb_u8]), 3_u32)
  PKEY_Devices_AudioDevice_Microphone_SensitivityInDbfs2 = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8943b373_u32, 0x388c_u16, 0x4395_u16, StaticArray[0xb5_u8, 0x57_u8, 0xbc_u8, 0x6d_u8, 0xba_u8, 0xff_u8, 0xaf_u8, 0xdb_u8]), 5_u32)
  PKEY_Devices_AudioDevice_Microphone_SignalToNoiseRatioInDb = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8943b373_u32, 0x388c_u16, 0x4395_u16, StaticArray[0xb5_u8, 0x57_u8, 0xbc_u8, 0x6d_u8, 0xba_u8, 0xff_u8, 0xaf_u8, 0xdb_u8]), 4_u32)
  PKEY_Devices_AudioDevice_RawProcessingSupported = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8943b373_u32, 0x388c_u16, 0x4395_u16, StaticArray[0xb5_u8, 0x57_u8, 0xbc_u8, 0x6d_u8, 0xba_u8, 0xff_u8, 0xaf_u8, 0xdb_u8]), 2_u32)
  PKEY_Devices_AudioDevice_SpeechProcessingSupported = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xfb1de864_u32, 0xe06d_u16, 0x47f4_u16, StaticArray[0x82_u8, 0xa6_u8, 0x8a_u8, 0xa_u8, 0xef_u8, 0x44_u8, 0x49_u8, 0x3c_u8]), 2_u32)
  PKEY_Devices_BatteryLife = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x49cd1f76_u32, 0x5626_u16, 0x4b17_u16, StaticArray[0xa4_u8, 0xe8_u8, 0x18_u8, 0xb4_u8, 0xaa_u8, 0x1a_u8, 0x22_u8, 0x13_u8]), 10_u32)
  PKEY_Devices_BatteryPlusCharging = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x49cd1f76_u32, 0x5626_u16, 0x4b17_u16, StaticArray[0xa4_u8, 0xe8_u8, 0x18_u8, 0xb4_u8, 0xaa_u8, 0x1a_u8, 0x22_u8, 0x13_u8]), 22_u32)
  PKEY_Devices_BatteryPlusChargingText = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x49cd1f76_u32, 0x5626_u16, 0x4b17_u16, StaticArray[0xa4_u8, 0xe8_u8, 0x18_u8, 0xb4_u8, 0xaa_u8, 0x1a_u8, 0x22_u8, 0x13_u8]), 23_u32)
  PKEY_Devices_Category = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 91_u32)
  PKEY_Devices_CategoryGroup = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 94_u32)
  PKEY_Devices_CategoryIds = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 90_u32)
  PKEY_Devices_CategoryPlural = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 92_u32)
  PKEY_Devices_ChallengeAep = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x774315e_u32, 0xb714_u16, 0x48ec_u16, StaticArray[0x8d_u8, 0xe8_u8, 0x81_u8, 0x25_u8, 0xc0_u8, 0x77_u8, 0xac_u8, 0x11_u8]), 2_u32)
  PKEY_Devices_ChargingState = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x49cd1f76_u32, 0x5626_u16, 0x4b17_u16, StaticArray[0xa4_u8, 0xe8_u8, 0x18_u8, 0xb4_u8, 0xaa_u8, 0x1a_u8, 0x22_u8, 0x13_u8]), 11_u32)
  PKEY_Devices_Children = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4340a6c5_u32, 0x93fa_u16, 0x4706_u16, StaticArray[0x97_u8, 0x2c_u8, 0x7b_u8, 0x64_u8, 0x80_u8, 0x8_u8, 0xa5_u8, 0xa7_u8]), 9_u32)
  PKEY_Devices_ClassGuid = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 10_u32)
  PKEY_Devices_CompatibleIds = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 4_u32)
  PKEY_Devices_Connected = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 55_u32)
  PKEY_Devices_ContainerId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8c7ed206_u32, 0x3f8a_u16, 0x4827_u16, StaticArray[0xb3_u8, 0xab_u8, 0xae_u8, 0x9e_u8, 0x1f_u8, 0xae_u8, 0xfc_u8, 0x6c_u8]), 2_u32)
  PKEY_Devices_DefaultTooltip = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x880f70a2_u32, 0x6082_u16, 0x47ac_u16, StaticArray[0x8a_u8, 0xab_u8, 0xa7_u8, 0x39_u8, 0xd1_u8, 0xa3_u8, 0x0_u8, 0xc3_u8]), 153_u32)
  PKEY_Devices_DeviceCapabilities = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 17_u32)
  PKEY_Devices_DeviceCharacteristics = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 29_u32)
  PKEY_Devices_DeviceDescription1 = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 81_u32)
  PKEY_Devices_DeviceDescription2 = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 82_u32)
  PKEY_Devices_DeviceHasProblem = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x540b947e_u32, 0x8b40_u16, 0x45bc_u16, StaticArray[0xa8_u8, 0xa2_u8, 0x6a_u8, 0xb_u8, 0x89_u8, 0x4c_u8, 0xbd_u8, 0xa2_u8]), 6_u32)
  PKEY_Devices_DeviceInstanceId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 256_u32)
  PKEY_Devices_DeviceManufacturer = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 13_u32)
  PKEY_Devices_DevObjectType = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x13673f42_u32, 0xa3d6_u16, 0x49f6_u16, StaticArray[0xb4_u8, 0xda_u8, 0xae_u8, 0x46_u8, 0xe0_u8, 0xc5_u8, 0x23_u8, 0x7c_u8]), 2_u32)
  PKEY_Devices_DialProtocol_InstalledApplications = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6845cc72_u32, 0x1b71_u16, 0x48c3_u16, StaticArray[0xaf_u8, 0x86_u8, 0xb0_u8, 0x91_u8, 0x71_u8, 0xa1_u8, 0x9b_u8, 0x14_u8]), 3_u32)
  PKEY_Devices_DiscoveryMethod = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 52_u32)
  PKEY_Devices_Dnssd_Domain = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xbf79c0ab_u32, 0xbb74_u16, 0x4cee_u16, StaticArray[0xb0_u8, 0x70_u8, 0x47_u8, 0xb_u8, 0x5a_u8, 0xe2_u8, 0x2_u8, 0xea_u8]), 3_u32)
  PKEY_Devices_Dnssd_FullName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xbf79c0ab_u32, 0xbb74_u16, 0x4cee_u16, StaticArray[0xb0_u8, 0x70_u8, 0x47_u8, 0xb_u8, 0x5a_u8, 0xe2_u8, 0x2_u8, 0xea_u8]), 5_u32)
  PKEY_Devices_Dnssd_HostName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xbf79c0ab_u32, 0xbb74_u16, 0x4cee_u16, StaticArray[0xb0_u8, 0x70_u8, 0x47_u8, 0xb_u8, 0x5a_u8, 0xe2_u8, 0x2_u8, 0xea_u8]), 7_u32)
  PKEY_Devices_Dnssd_InstanceName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xbf79c0ab_u32, 0xbb74_u16, 0x4cee_u16, StaticArray[0xb0_u8, 0x70_u8, 0x47_u8, 0xb_u8, 0x5a_u8, 0xe2_u8, 0x2_u8, 0xea_u8]), 4_u32)
  PKEY_Devices_Dnssd_NetworkAdapterId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xbf79c0ab_u32, 0xbb74_u16, 0x4cee_u16, StaticArray[0xb0_u8, 0x70_u8, 0x47_u8, 0xb_u8, 0x5a_u8, 0xe2_u8, 0x2_u8, 0xea_u8]), 11_u32)
  PKEY_Devices_Dnssd_PortNumber = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xbf79c0ab_u32, 0xbb74_u16, 0x4cee_u16, StaticArray[0xb0_u8, 0x70_u8, 0x47_u8, 0xb_u8, 0x5a_u8, 0xe2_u8, 0x2_u8, 0xea_u8]), 12_u32)
  PKEY_Devices_Dnssd_Priority = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xbf79c0ab_u32, 0xbb74_u16, 0x4cee_u16, StaticArray[0xb0_u8, 0x70_u8, 0x47_u8, 0xb_u8, 0x5a_u8, 0xe2_u8, 0x2_u8, 0xea_u8]), 9_u32)
  PKEY_Devices_Dnssd_ServiceName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xbf79c0ab_u32, 0xbb74_u16, 0x4cee_u16, StaticArray[0xb0_u8, 0x70_u8, 0x47_u8, 0xb_u8, 0x5a_u8, 0xe2_u8, 0x2_u8, 0xea_u8]), 2_u32)
  PKEY_Devices_Dnssd_TextAttributes = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xbf79c0ab_u32, 0xbb74_u16, 0x4cee_u16, StaticArray[0xb0_u8, 0x70_u8, 0x47_u8, 0xb_u8, 0x5a_u8, 0xe2_u8, 0x2_u8, 0xea_u8]), 6_u32)
  PKEY_Devices_Dnssd_Ttl = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xbf79c0ab_u32, 0xbb74_u16, 0x4cee_u16, StaticArray[0xb0_u8, 0x70_u8, 0x47_u8, 0xb_u8, 0x5a_u8, 0xe2_u8, 0x2_u8, 0xea_u8]), 10_u32)
  PKEY_Devices_Dnssd_Weight = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xbf79c0ab_u32, 0xbb74_u16, 0x4cee_u16, StaticArray[0xb0_u8, 0x70_u8, 0x47_u8, 0xb_u8, 0x5a_u8, 0xe2_u8, 0x2_u8, 0xea_u8]), 8_u32)
  PKEY_Devices_FriendlyName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 12288_u32)
  PKEY_Devices_FunctionPaths = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd08dd4c0_u32, 0x3a9e_u16, 0x462e_u16, StaticArray[0x82_u8, 0x90_u8, 0x7b_u8, 0x63_u8, 0x6b_u8, 0x25_u8, 0x76_u8, 0xb9_u8]), 3_u32)
  PKEY_Devices_GlyphIcon = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x51236583_u32, 0xc4a_u16, 0x4fe8_u16, StaticArray[0xb8_u8, 0x1f_u8, 0x16_u8, 0x6a_u8, 0xec_u8, 0x13_u8, 0xf5_u8, 0x10_u8]), 123_u32)
  PKEY_Devices_HardwareIds = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 3_u32)
  PKEY_Devices_Icon = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 57_u32)
  PKEY_Devices_InLocalMachineContainer = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8c7ed206_u32, 0x3f8a_u16, 0x4827_u16, StaticArray[0xb3_u8, 0xab_u8, 0xae_u8, 0x9e_u8, 0x1f_u8, 0xae_u8, 0xfc_u8, 0x6c_u8]), 4_u32)
  PKEY_Devices_InterfaceClassGuid = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x26e516e_u32, 0xb814_u16, 0x414b_u16, StaticArray[0x83_u8, 0xcd_u8, 0x85_u8, 0x6d_u8, 0x6f_u8, 0xef_u8, 0x48_u8, 0x22_u8]), 4_u32)
  PKEY_Devices_InterfaceEnabled = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x26e516e_u32, 0xb814_u16, 0x414b_u16, StaticArray[0x83_u8, 0xcd_u8, 0x85_u8, 0x6d_u8, 0x6f_u8, 0xef_u8, 0x48_u8, 0x22_u8]), 3_u32)
  PKEY_Devices_InterfacePaths = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd08dd4c0_u32, 0x3a9e_u16, 0x462e_u16, StaticArray[0x82_u8, 0x90_u8, 0x7b_u8, 0x63_u8, 0x6b_u8, 0x25_u8, 0x76_u8, 0xb9_u8]), 2_u32)
  PKEY_Devices_IpAddress = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 12297_u32)
  PKEY_Devices_IsDefault = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 86_u32)
  PKEY_Devices_IsNetworkConnected = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 85_u32)
  PKEY_Devices_IsShared = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 84_u32)
  PKEY_Devices_IsSoftwareInstalling = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x83da6326_u32, 0x97a6_u16, 0x4088_u16, StaticArray[0x94_u8, 0x53_u8, 0xa1_u8, 0x92_u8, 0x3f_u8, 0x57_u8, 0x3b_u8, 0x29_u8]), 9_u32)
  PKEY_Devices_LaunchDeviceStageFromExplorer = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 77_u32)
  PKEY_Devices_LocalMachine = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 70_u32)
  PKEY_Devices_LocationPaths = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 37_u32)
  PKEY_Devices_Manufacturer = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 8192_u32)
  PKEY_Devices_MetadataPath = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 71_u32)
  PKEY_Devices_MicrophoneArray_Geometry = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa1829ea2_u32, 0x27eb_u16, 0x459e_u16, StaticArray[0x93_u8, 0x5d_u8, 0xb2_u8, 0xfa_u8, 0xd7_u8, 0xb0_u8, 0x77_u8, 0x62_u8]), 2_u32)
  PKEY_Devices_MissedCalls = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x49cd1f76_u32, 0x5626_u16, 0x4b17_u16, StaticArray[0xa4_u8, 0xe8_u8, 0x18_u8, 0xb4_u8, 0xaa_u8, 0x1a_u8, 0x22_u8, 0x13_u8]), 5_u32)
  PKEY_Devices_ModelId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x80d81ea6_u32, 0x7473_u16, 0x4b0c_u16, StaticArray[0x82_u8, 0x16_u8, 0xef_u8, 0xc1_u8, 0x1a_u8, 0x2c_u8, 0x4c_u8, 0x8b_u8]), 2_u32)
  PKEY_Devices_ModelName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 8194_u32)
  PKEY_Devices_ModelNumber = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 8195_u32)
  PKEY_Devices_NetworkedTooltip = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x880f70a2_u32, 0x6082_u16, 0x47ac_u16, StaticArray[0x8a_u8, 0xab_u8, 0xa7_u8, 0x39_u8, 0xd1_u8, 0xa3_u8, 0x0_u8, 0xc3_u8]), 152_u32)
  PKEY_Devices_NetworkName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x49cd1f76_u32, 0x5626_u16, 0x4b17_u16, StaticArray[0xa4_u8, 0xe8_u8, 0x18_u8, 0xb4_u8, 0xaa_u8, 0x1a_u8, 0x22_u8, 0x13_u8]), 7_u32)
  PKEY_Devices_NetworkType = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x49cd1f76_u32, 0x5626_u16, 0x4b17_u16, StaticArray[0xa4_u8, 0xe8_u8, 0x18_u8, 0xb4_u8, 0xaa_u8, 0x1a_u8, 0x22_u8, 0x13_u8]), 8_u32)
  PKEY_Devices_NewPictures = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x49cd1f76_u32, 0x5626_u16, 0x4b17_u16, StaticArray[0xa4_u8, 0xe8_u8, 0x18_u8, 0xb4_u8, 0xaa_u8, 0x1a_u8, 0x22_u8, 0x13_u8]), 4_u32)
  PKEY_Devices_Notification = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6704b0c_u32, 0xe830_u16, 0x4c81_u16, StaticArray[0x91_u8, 0x78_u8, 0x91_u8, 0xe4_u8, 0xe9_u8, 0x5a_u8, 0x80_u8, 0xa0_u8]), 3_u32)
  PKEY_Devices_Notifications_LowBattery = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc4c07f2b_u32, 0x8524_u16, 0x4e66_u16, StaticArray[0xae_u8, 0x3a_u8, 0xa6_u8, 0x23_u8, 0x5f_u8, 0x10_u8, 0x3b_u8, 0xeb_u8]), 2_u32)
  PKEY_Devices_Notifications_MissedCall = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6614ef48_u32, 0x4efe_u16, 0x4424_u16, StaticArray[0x9e_u8, 0xda_u8, 0xc7_u8, 0x9f_u8, 0x40_u8, 0x4e_u8, 0xdf_u8, 0x3e_u8]), 2_u32)
  PKEY_Devices_Notifications_NewMessage = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x2be9260a_u32, 0x2012_u16, 0x4742_u16, StaticArray[0xa5_u8, 0x55_u8, 0xf4_u8, 0x1b_u8, 0x63_u8, 0x8b_u8, 0x7d_u8, 0xcb_u8]), 2_u32)
  PKEY_Devices_Notifications_NewVoicemail = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x59569556_u32, 0xa08_u16, 0x4212_u16, StaticArray[0x95_u8, 0xb9_u8, 0xfa_u8, 0xe2_u8, 0xad_u8, 0x64_u8, 0x13_u8, 0xdb_u8]), 2_u32)
  PKEY_Devices_Notifications_StorageFull = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa0e00ee1_u32, 0xf0c7_u16, 0x4d41_u16, StaticArray[0xb8_u8, 0xe7_u8, 0x26_u8, 0xa7_u8, 0xbd_u8, 0x8d_u8, 0x38_u8, 0xb0_u8]), 2_u32)
  PKEY_Devices_Notifications_StorageFullLinkText = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa0e00ee1_u32, 0xf0c7_u16, 0x4d41_u16, StaticArray[0xb8_u8, 0xe7_u8, 0x26_u8, 0xa7_u8, 0xbd_u8, 0x8d_u8, 0x38_u8, 0xb0_u8]), 3_u32)
  PKEY_Devices_NotificationStore = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6704b0c_u32, 0xe830_u16, 0x4c81_u16, StaticArray[0x91_u8, 0x78_u8, 0x91_u8, 0xe4_u8, 0xe9_u8, 0x5a_u8, 0x80_u8, 0xa0_u8]), 2_u32)
  PKEY_Devices_NotWorkingProperly = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 83_u32)
  PKEY_Devices_Paired = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 56_u32)
  PKEY_Devices_Panel_PanelGroup = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8dbc9c86_u32, 0x97a9_u16, 0x4bff_u16, StaticArray[0x9b_u8, 0xc6_u8, 0xbf_u8, 0xe9_u8, 0x5d_u8, 0x3e_u8, 0x6d_u8, 0xad_u8]), 3_u32)
  PKEY_Devices_Panel_PanelId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8dbc9c86_u32, 0x97a9_u16, 0x4bff_u16, StaticArray[0x9b_u8, 0xc6_u8, 0xbf_u8, 0xe9_u8, 0x5d_u8, 0x3e_u8, 0x6d_u8, 0xad_u8]), 2_u32)
  PKEY_Devices_Parent = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4340a6c5_u32, 0x93fa_u16, 0x4706_u16, StaticArray[0x97_u8, 0x2c_u8, 0x7b_u8, 0x64_u8, 0x80_u8, 0x8_u8, 0xa5_u8, 0xa7_u8]), 8_u32)
  PKEY_Devices_PhoneLineTransportDevice_Connected = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xaecf2fe8_u32, 0x1d00_u16, 0x4fee_u16, StaticArray[0x8a_u8, 0x6d_u8, 0xa7_u8, 0xd_u8, 0x71_u8, 0x9b_u8, 0x77_u8, 0x2b_u8]), 2_u32)
  PKEY_Devices_PhysicalDeviceLocation = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x540b947e_u32, 0x8b40_u16, 0x45bc_u16, StaticArray[0xa8_u8, 0xa2_u8, 0x6a_u8, 0xb_u8, 0x89_u8, 0x4c_u8, 0xbd_u8, 0xa2_u8]), 9_u32)
  PKEY_Devices_PlaybackPositionPercent = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x3633de59_u32, 0x6825_u16, 0x4381_u16, StaticArray[0xa4_u8, 0x9b_u8, 0x9f_u8, 0x6b_u8, 0xa1_u8, 0x3a_u8, 0x14_u8, 0x71_u8]), 5_u32)
  PKEY_Devices_PlaybackState = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x3633de59_u32, 0x6825_u16, 0x4381_u16, StaticArray[0xa4_u8, 0x9b_u8, 0x9f_u8, 0x6b_u8, 0xa1_u8, 0x3a_u8, 0x14_u8, 0x71_u8]), 2_u32)
  PLAYBACKSTATE_UNKNOWN = 0_u32
  PLAYBACKSTATE_STOPPED = 1_u32
  PLAYBACKSTATE_PLAYING = 2_u32
  PLAYBACKSTATE_TRANSITIONING = 3_u32
  PLAYBACKSTATE_PAUSED = 4_u32
  PLAYBACKSTATE_RECORDINGPAUSED = 5_u32
  PLAYBACKSTATE_RECORDING = 6_u32
  PLAYBACKSTATE_NOMEDIA = 7_u32
  PKEY_Devices_PlaybackTitle = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x3633de59_u32, 0x6825_u16, 0x4381_u16, StaticArray[0xa4_u8, 0x9b_u8, 0x9f_u8, 0x6b_u8, 0xa1_u8, 0x3a_u8, 0x14_u8, 0x71_u8]), 3_u32)
  PKEY_Devices_Present = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x540b947e_u32, 0x8b40_u16, 0x45bc_u16, StaticArray[0xa8_u8, 0xa2_u8, 0x6a_u8, 0xb_u8, 0x89_u8, 0x4c_u8, 0xbd_u8, 0xa2_u8]), 5_u32)
  PKEY_Devices_PresentationUrl = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 8198_u32)
  PKEY_Devices_PrimaryCategory = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd08dd4c0_u32, 0x3a9e_u16, 0x462e_u16, StaticArray[0x82_u8, 0x90_u8, 0x7b_u8, 0x63_u8, 0x6b_u8, 0x25_u8, 0x76_u8, 0xb9_u8]), 10_u32)
  PKEY_Devices_RemainingDuration = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x3633de59_u32, 0x6825_u16, 0x4381_u16, StaticArray[0xa4_u8, 0x9b_u8, 0x9f_u8, 0x6b_u8, 0xa1_u8, 0x3a_u8, 0x14_u8, 0x71_u8]), 4_u32)
  PKEY_Devices_RestrictedInterface = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x26e516e_u32, 0xb814_u16, 0x414b_u16, StaticArray[0x83_u8, 0xcd_u8, 0x85_u8, 0x6d_u8, 0x6f_u8, 0xef_u8, 0x48_u8, 0x22_u8]), 6_u32)
  PKEY_Devices_Roaming = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x49cd1f76_u32, 0x5626_u16, 0x4b17_u16, StaticArray[0xa4_u8, 0xe8_u8, 0x18_u8, 0xb4_u8, 0xaa_u8, 0x1a_u8, 0x22_u8, 0x13_u8]), 9_u32)
  PKEY_Devices_SafeRemovalRequired = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xafd97640_u32, 0x86a3_u16, 0x4210_u16, StaticArray[0xb6_u8, 0x7c_u8, 0x28_u8, 0x9c_u8, 0x41_u8, 0xaa_u8, 0xbe_u8, 0x55_u8]), 2_u32)
  PKEY_Devices_SchematicName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x26e516e_u32, 0xb814_u16, 0x414b_u16, StaticArray[0x83_u8, 0xcd_u8, 0x85_u8, 0x6d_u8, 0x6f_u8, 0xef_u8, 0x48_u8, 0x22_u8]), 9_u32)
  PKEY_Devices_ServiceAddress = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 16384_u32)
  PKEY_Devices_ServiceId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 16385_u32)
  PKEY_Devices_SharedTooltip = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x880f70a2_u32, 0x6082_u16, 0x47ac_u16, StaticArray[0x8a_u8, 0xab_u8, 0xa7_u8, 0x39_u8, 0xd1_u8, 0xa3_u8, 0x0_u8, 0xc3_u8]), 151_u32)
  PKEY_Devices_SignalStrength = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x49cd1f76_u32, 0x5626_u16, 0x4b17_u16, StaticArray[0xa4_u8, 0xe8_u8, 0x18_u8, 0xb4_u8, 0xaa_u8, 0x1a_u8, 0x22_u8, 0x13_u8]), 2_u32)
  PKEY_Devices_SmartCards_ReaderKind = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd6b5b883_u32, 0x18bd_u16, 0x4b4d_u16, StaticArray[0xb2_u8, 0xec_u8, 0x9e_u8, 0x38_u8, 0xaf_u8, 0xfe_u8, 0xda_u8, 0x82_u8]), 2_u32)
  PKEY_Devices_Status = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd08dd4c0_u32, 0x3a9e_u16, 0x462e_u16, StaticArray[0x82_u8, 0x90_u8, 0x7b_u8, 0x63_u8, 0x6b_u8, 0x25_u8, 0x76_u8, 0xb9_u8]), 259_u32)
  PKEY_Devices_Status1 = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd08dd4c0_u32, 0x3a9e_u16, 0x462e_u16, StaticArray[0x82_u8, 0x90_u8, 0x7b_u8, 0x63_u8, 0x6b_u8, 0x25_u8, 0x76_u8, 0xb9_u8]), 257_u32)
  PKEY_Devices_Status2 = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd08dd4c0_u32, 0x3a9e_u16, 0x462e_u16, StaticArray[0x82_u8, 0x90_u8, 0x7b_u8, 0x63_u8, 0x6b_u8, 0x25_u8, 0x76_u8, 0xb9_u8]), 258_u32)
  PKEY_Devices_StorageCapacity = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x49cd1f76_u32, 0x5626_u16, 0x4b17_u16, StaticArray[0xa4_u8, 0xe8_u8, 0x18_u8, 0xb4_u8, 0xaa_u8, 0x1a_u8, 0x22_u8, 0x13_u8]), 12_u32)
  PKEY_Devices_StorageFreeSpace = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x49cd1f76_u32, 0x5626_u16, 0x4b17_u16, StaticArray[0xa4_u8, 0xe8_u8, 0x18_u8, 0xb4_u8, 0xaa_u8, 0x1a_u8, 0x22_u8, 0x13_u8]), 13_u32)
  PKEY_Devices_StorageFreeSpacePercent = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x49cd1f76_u32, 0x5626_u16, 0x4b17_u16, StaticArray[0xa4_u8, 0xe8_u8, 0x18_u8, 0xb4_u8, 0xaa_u8, 0x1a_u8, 0x22_u8, 0x13_u8]), 14_u32)
  PKEY_Devices_TextMessages = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x49cd1f76_u32, 0x5626_u16, 0x4b17_u16, StaticArray[0xa4_u8, 0xe8_u8, 0x18_u8, 0xb4_u8, 0xaa_u8, 0x1a_u8, 0x22_u8, 0x13_u8]), 3_u32)
  PKEY_Devices_Voicemail = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x49cd1f76_u32, 0x5626_u16, 0x4b17_u16, StaticArray[0xa4_u8, 0xe8_u8, 0x18_u8, 0xb4_u8, 0xaa_u8, 0x1a_u8, 0x22_u8, 0x13_u8]), 6_u32)
  PKEY_Devices_WiaDeviceType = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6bdd1fc6_u32, 0x810f_u16, 0x11d0_u16, StaticArray[0xbe_u8, 0xc7_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0xe2_u8, 0x9_u8, 0x2f_u8]), 2_u32)
  PKEY_Devices_WiFi_InterfaceGuid = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xef1167eb_u32, 0xcbfc_u16, 0x4341_u16, StaticArray[0xa5_u8, 0x68_u8, 0xa7_u8, 0xc9_u8, 0x1a_u8, 0x68_u8, 0x98_u8, 0x2c_u8]), 2_u32)
  PKEY_Devices_WiFiDirect_DeviceAddress = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1506935d_u32, 0xe3e7_u16, 0x450f_u16, StaticArray[0x86_u8, 0x37_u8, 0x82_u8, 0x23_u8, 0x3e_u8, 0xbe_u8, 0x5f_u8, 0x6e_u8]), 13_u32)
  PKEY_Devices_WiFiDirect_GroupId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1506935d_u32, 0xe3e7_u16, 0x450f_u16, StaticArray[0x86_u8, 0x37_u8, 0x82_u8, 0x23_u8, 0x3e_u8, 0xbe_u8, 0x5f_u8, 0x6e_u8]), 4_u32)
  PKEY_Devices_WiFiDirect_InformationElements = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1506935d_u32, 0xe3e7_u16, 0x450f_u16, StaticArray[0x86_u8, 0x37_u8, 0x82_u8, 0x23_u8, 0x3e_u8, 0xbe_u8, 0x5f_u8, 0x6e_u8]), 12_u32)
  PKEY_Devices_WiFiDirect_InterfaceAddress = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1506935d_u32, 0xe3e7_u16, 0x450f_u16, StaticArray[0x86_u8, 0x37_u8, 0x82_u8, 0x23_u8, 0x3e_u8, 0xbe_u8, 0x5f_u8, 0x6e_u8]), 2_u32)
  PKEY_Devices_WiFiDirect_InterfaceGuid = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1506935d_u32, 0xe3e7_u16, 0x450f_u16, StaticArray[0x86_u8, 0x37_u8, 0x82_u8, 0x23_u8, 0x3e_u8, 0xbe_u8, 0x5f_u8, 0x6e_u8]), 3_u32)
  PKEY_Devices_WiFiDirect_IsConnected = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1506935d_u32, 0xe3e7_u16, 0x450f_u16, StaticArray[0x86_u8, 0x37_u8, 0x82_u8, 0x23_u8, 0x3e_u8, 0xbe_u8, 0x5f_u8, 0x6e_u8]), 5_u32)
  PKEY_Devices_WiFiDirect_IsLegacyDevice = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1506935d_u32, 0xe3e7_u16, 0x450f_u16, StaticArray[0x86_u8, 0x37_u8, 0x82_u8, 0x23_u8, 0x3e_u8, 0xbe_u8, 0x5f_u8, 0x6e_u8]), 7_u32)
  PKEY_Devices_WiFiDirect_IsMiracastLcpSupported = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1506935d_u32, 0xe3e7_u16, 0x450f_u16, StaticArray[0x86_u8, 0x37_u8, 0x82_u8, 0x23_u8, 0x3e_u8, 0xbe_u8, 0x5f_u8, 0x6e_u8]), 9_u32)
  PKEY_Devices_WiFiDirect_IsVisible = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1506935d_u32, 0xe3e7_u16, 0x450f_u16, StaticArray[0x86_u8, 0x37_u8, 0x82_u8, 0x23_u8, 0x3e_u8, 0xbe_u8, 0x5f_u8, 0x6e_u8]), 6_u32)
  PKEY_Devices_WiFiDirect_MiracastVersion = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1506935d_u32, 0xe3e7_u16, 0x450f_u16, StaticArray[0x86_u8, 0x37_u8, 0x82_u8, 0x23_u8, 0x3e_u8, 0xbe_u8, 0x5f_u8, 0x6e_u8]), 8_u32)
  PKEY_Devices_WiFiDirect_Services = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1506935d_u32, 0xe3e7_u16, 0x450f_u16, StaticArray[0x86_u8, 0x37_u8, 0x82_u8, 0x23_u8, 0x3e_u8, 0xbe_u8, 0x5f_u8, 0x6e_u8]), 10_u32)
  PKEY_Devices_WiFiDirect_SupportedChannelList = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1506935d_u32, 0xe3e7_u16, 0x450f_u16, StaticArray[0x86_u8, 0x37_u8, 0x82_u8, 0x23_u8, 0x3e_u8, 0xbe_u8, 0x5f_u8, 0x6e_u8]), 11_u32)
  PKEY_Devices_WiFiDirectServices_AdvertisementId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x31b37743_u32, 0x7c5e_u16, 0x4005_u16, StaticArray[0x93_u8, 0xe6_u8, 0xe9_u8, 0x53_u8, 0xf9_u8, 0x2b_u8, 0x82_u8, 0xe9_u8]), 5_u32)
  PKEY_Devices_WiFiDirectServices_RequestServiceInformation = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x31b37743_u32, 0x7c5e_u16, 0x4005_u16, StaticArray[0x93_u8, 0xe6_u8, 0xe9_u8, 0x53_u8, 0xf9_u8, 0x2b_u8, 0x82_u8, 0xe9_u8]), 7_u32)
  PKEY_Devices_WiFiDirectServices_ServiceAddress = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x31b37743_u32, 0x7c5e_u16, 0x4005_u16, StaticArray[0x93_u8, 0xe6_u8, 0xe9_u8, 0x53_u8, 0xf9_u8, 0x2b_u8, 0x82_u8, 0xe9_u8]), 2_u32)
  PKEY_Devices_WiFiDirectServices_ServiceConfigMethods = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x31b37743_u32, 0x7c5e_u16, 0x4005_u16, StaticArray[0x93_u8, 0xe6_u8, 0xe9_u8, 0x53_u8, 0xf9_u8, 0x2b_u8, 0x82_u8, 0xe9_u8]), 6_u32)
  PKEY_Devices_WiFiDirectServices_ServiceInformation = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x31b37743_u32, 0x7c5e_u16, 0x4005_u16, StaticArray[0x93_u8, 0xe6_u8, 0xe9_u8, 0x53_u8, 0xf9_u8, 0x2b_u8, 0x82_u8, 0xe9_u8]), 4_u32)
  PKEY_Devices_WiFiDirectServices_ServiceName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x31b37743_u32, 0x7c5e_u16, 0x4005_u16, StaticArray[0x93_u8, 0xe6_u8, 0xe9_u8, 0x53_u8, 0xf9_u8, 0x2b_u8, 0x82_u8, 0xe9_u8]), 3_u32)
  PKEY_Devices_WinPhone8CameraFlags = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb7b4d61c_u32, 0x5a64_u16, 0x4187_u16, StaticArray[0xa5_u8, 0x2e_u8, 0xb1_u8, 0x53_u8, 0x9f_u8, 0x35_u8, 0x90_u8, 0x99_u8]), 2_u32)
  PKEY_Devices_Wwan_InterfaceGuid = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xff1167eb_u32, 0xcbfc_u16, 0x4341_u16, StaticArray[0xa5_u8, 0x68_u8, 0xa7_u8, 0xc9_u8, 0x1a_u8, 0x68_u8, 0x98_u8, 0x2c_u8]), 2_u32)
  PKEY_Storage_Portable = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4d1ebee8_u32, 0x803_u16, 0x4774_u16, StaticArray[0x98_u8, 0x42_u8, 0xb7_u8, 0x7d_u8, 0xb5_u8, 0x2_u8, 0x65_u8, 0xe9_u8]), 2_u32)
  PKEY_Storage_RemovableMedia = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4d1ebee8_u32, 0x803_u16, 0x4774_u16, StaticArray[0x98_u8, 0x42_u8, 0xb7_u8, 0x7d_u8, 0xb5_u8, 0x2_u8, 0x65_u8, 0xe9_u8]), 3_u32)
  PKEY_Storage_SystemCritical = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4d1ebee8_u32, 0x803_u16, 0x4774_u16, StaticArray[0x98_u8, 0x42_u8, 0xb7_u8, 0x7d_u8, 0xb5_u8, 0x2_u8, 0x65_u8, 0xe9_u8]), 4_u32)
  PKEY_Document_ByteCount = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd5cdd502_u32, 0x2e9c_u16, 0x101b_u16, StaticArray[0x93_u8, 0x97_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2c_u8, 0xf9_u8, 0xae_u8]), 4_u32)
  PKEY_Document_CharacterCount = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 16_u32)
  PKEY_Document_ClientID = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x276d7bb0_u32, 0x5b34_u16, 0x4fb0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x15_u8, 0x8e_u8, 0xd1_u8, 0x2a_u8, 0x18_u8, 0x9_u8]), 100_u32)
  PKEY_Document_Contributor = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf334115e_u32, 0xda1b_u16, 0x4509_u16, StaticArray[0x9b_u8, 0x3d_u8, 0x11_u8, 0x95_u8, 0x4_u8, 0xdc_u8, 0x7a_u8, 0xbb_u8]), 100_u32)
  PKEY_Document_DateCreated = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 12_u32)
  PKEY_Document_DatePrinted = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 11_u32)
  PKEY_Document_DateSaved = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 13_u32)
  PKEY_Document_Division = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1e005ee6_u32, 0xbf27_u16, 0x428b_u16, StaticArray[0xb0_u8, 0x1c_u8, 0x79_u8, 0x67_u8, 0x6a_u8, 0xcd_u8, 0x28_u8, 0x70_u8]), 100_u32)
  PKEY_Document_DocumentID = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xe08805c8_u32, 0xe395_u16, 0x40df_u16, StaticArray[0x80_u8, 0xd2_u8, 0x54_u8, 0xf0_u8, 0xd6_u8, 0xc4_u8, 0x31_u8, 0x54_u8]), 100_u32)
  PKEY_Document_HiddenSlideCount = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd5cdd502_u32, 0x2e9c_u16, 0x101b_u16, StaticArray[0x93_u8, 0x97_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2c_u8, 0xf9_u8, 0xae_u8]), 9_u32)
  PKEY_Document_LastAuthor = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 8_u32)
  PKEY_Document_LineCount = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd5cdd502_u32, 0x2e9c_u16, 0x101b_u16, StaticArray[0x93_u8, 0x97_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2c_u8, 0xf9_u8, 0xae_u8]), 5_u32)
  PKEY_Document_Manager = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd5cdd502_u32, 0x2e9c_u16, 0x101b_u16, StaticArray[0x93_u8, 0x97_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2c_u8, 0xf9_u8, 0xae_u8]), 14_u32)
  PKEY_Document_MultimediaClipCount = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd5cdd502_u32, 0x2e9c_u16, 0x101b_u16, StaticArray[0x93_u8, 0x97_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2c_u8, 0xf9_u8, 0xae_u8]), 10_u32)
  PKEY_Document_NoteCount = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd5cdd502_u32, 0x2e9c_u16, 0x101b_u16, StaticArray[0x93_u8, 0x97_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2c_u8, 0xf9_u8, 0xae_u8]), 8_u32)
  PKEY_Document_PageCount = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 14_u32)
  PKEY_Document_ParagraphCount = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd5cdd502_u32, 0x2e9c_u16, 0x101b_u16, StaticArray[0x93_u8, 0x97_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2c_u8, 0xf9_u8, 0xae_u8]), 6_u32)
  PKEY_Document_PresentationFormat = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd5cdd502_u32, 0x2e9c_u16, 0x101b_u16, StaticArray[0x93_u8, 0x97_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2c_u8, 0xf9_u8, 0xae_u8]), 3_u32)
  PKEY_Document_RevisionNumber = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 9_u32)
  PKEY_Document_Security = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 19_u32)
  PKEY_Document_SlideCount = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd5cdd502_u32, 0x2e9c_u16, 0x101b_u16, StaticArray[0x93_u8, 0x97_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2c_u8, 0xf9_u8, 0xae_u8]), 7_u32)
  PKEY_Document_Template = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 7_u32)
  PKEY_Document_TotalEditingTime = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 10_u32)
  PKEY_Document_Version = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd5cdd502_u32, 0x2e9c_u16, 0x101b_u16, StaticArray[0x93_u8, 0x97_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2c_u8, 0xf9_u8, 0xae_u8]), 29_u32)
  PKEY_Document_WordCount = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 15_u32)
  PKEY_DRM_DatePlayExpires = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xaeac19e4_u32, 0x89ae_u16, 0x4508_u16, StaticArray[0xb9_u8, 0xb7_u8, 0xbb_u8, 0x86_u8, 0x7a_u8, 0xbe_u8, 0xe2_u8, 0xed_u8]), 6_u32)
  PKEY_DRM_DatePlayStarts = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xaeac19e4_u32, 0x89ae_u16, 0x4508_u16, StaticArray[0xb9_u8, 0xb7_u8, 0xbb_u8, 0x86_u8, 0x7a_u8, 0xbe_u8, 0xe2_u8, 0xed_u8]), 5_u32)
  PKEY_DRM_Description = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xaeac19e4_u32, 0x89ae_u16, 0x4508_u16, StaticArray[0xb9_u8, 0xb7_u8, 0xbb_u8, 0x86_u8, 0x7a_u8, 0xbe_u8, 0xe2_u8, 0xed_u8]), 3_u32)
  PKEY_DRM_IsDisabled = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xaeac19e4_u32, 0x89ae_u16, 0x4508_u16, StaticArray[0xb9_u8, 0xb7_u8, 0xbb_u8, 0x86_u8, 0x7a_u8, 0xbe_u8, 0xe2_u8, 0xed_u8]), 7_u32)
  PKEY_DRM_IsProtected = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xaeac19e4_u32, 0x89ae_u16, 0x4508_u16, StaticArray[0xb9_u8, 0xb7_u8, 0xbb_u8, 0x86_u8, 0x7a_u8, 0xbe_u8, 0xe2_u8, 0xed_u8]), 2_u32)
  PKEY_DRM_PlayCount = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xaeac19e4_u32, 0x89ae_u16, 0x4508_u16, StaticArray[0xb9_u8, 0xb7_u8, 0xbb_u8, 0x86_u8, 0x7a_u8, 0xbe_u8, 0xe2_u8, 0xed_u8]), 4_u32)
  PKEY_GPS_Altitude = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x827edb4f_u32, 0x5b73_u16, 0x44a7_u16, StaticArray[0x89_u8, 0x1d_u8, 0xfd_u8, 0xff_u8, 0xab_u8, 0xea_u8, 0x35_u8, 0xca_u8]), 100_u32)
  PKEY_GPS_AltitudeDenominator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78342dcb_u32, 0xe358_u16, 0x4145_u16, StaticArray[0xae_u8, 0x9a_u8, 0x6b_u8, 0xfe_u8, 0x4e_u8, 0xf_u8, 0x9f_u8, 0x51_u8]), 100_u32)
  PKEY_GPS_AltitudeNumerator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x2dad1eb7_u32, 0x816d_u16, 0x40d3_u16, StaticArray[0x9e_u8, 0xc3_u8, 0xc9_u8, 0x77_u8, 0x3b_u8, 0xe2_u8, 0xaa_u8, 0xde_u8]), 100_u32)
  PKEY_GPS_AltitudeRef = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x46ac629d_u32, 0x75ea_u16, 0x4515_u16, StaticArray[0x86_u8, 0x7f_u8, 0x6d_u8, 0xc4_u8, 0x32_u8, 0x1c_u8, 0x58_u8, 0x44_u8]), 100_u32)
  PKEY_GPS_AreaInformation = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x972e333e_u32, 0xac7e_u16, 0x49f1_u16, StaticArray[0x8a_u8, 0xdf_u8, 0xa7_u8, 0xd_u8, 0x7_u8, 0xa9_u8, 0xbc_u8, 0xab_u8]), 100_u32)
  PKEY_GPS_Date = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x3602c812_u32, 0xf3b_u16, 0x45f0_u16, StaticArray[0x85_u8, 0xad_u8, 0x60_u8, 0x34_u8, 0x68_u8, 0xd6_u8, 0x94_u8, 0x23_u8]), 100_u32)
  PKEY_GPS_DestBearing = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc66d4b3c_u32, 0xe888_u16, 0x47cc_u16, StaticArray[0xb9_u8, 0x9f_u8, 0x9d_u8, 0xca_u8, 0x3e_u8, 0xe3_u8, 0x4d_u8, 0xea_u8]), 100_u32)
  PKEY_GPS_DestBearingDenominator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x7abcf4f8_u32, 0x7c3f_u16, 0x4988_u16, StaticArray[0xac_u8, 0x91_u8, 0x8d_u8, 0x2c_u8, 0x2e_u8, 0x97_u8, 0xec_u8, 0xa5_u8]), 100_u32)
  PKEY_GPS_DestBearingNumerator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xba3b1da9_u32, 0x86ee_u16, 0x4b5d_u16, StaticArray[0xa2_u8, 0xa4_u8, 0xa2_u8, 0x71_u8, 0xa4_u8, 0x29_u8, 0xf0_u8, 0xcf_u8]), 100_u32)
  PKEY_GPS_DestBearingRef = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x9ab84393_u32, 0x2a0f_u16, 0x4b75_u16, StaticArray[0xbb_u8, 0x22_u8, 0x72_u8, 0x79_u8, 0x78_u8, 0x69_u8, 0x77_u8, 0xcb_u8]), 100_u32)
  PKEY_GPS_DestDistance = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa93eae04_u32, 0x6804_u16, 0x4f24_u16, StaticArray[0xac_u8, 0x81_u8, 0x9_u8, 0xb2_u8, 0x66_u8, 0x45_u8, 0x21_u8, 0x18_u8]), 100_u32)
  PKEY_GPS_DestDistanceDenominator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x9bc2c99b_u32, 0xac71_u16, 0x4127_u16, StaticArray[0x9d_u8, 0x1c_u8, 0x25_u8, 0x96_u8, 0xd0_u8, 0xd7_u8, 0xdc_u8, 0xb7_u8]), 100_u32)
  PKEY_GPS_DestDistanceNumerator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x2bda47da_u32, 0x8c6_u16, 0x4fe1_u16, StaticArray[0x80_u8, 0xbc_u8, 0xa7_u8, 0x2f_u8, 0xc5_u8, 0x17_u8, 0xc5_u8, 0xd0_u8]), 100_u32)
  PKEY_GPS_DestDistanceRef = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xed4df2d3_u32, 0x8695_u16, 0x450b_u16, StaticArray[0x85_u8, 0x6f_u8, 0xf5_u8, 0xc1_u8, 0xc5_u8, 0x3a_u8, 0xcb_u8, 0x66_u8]), 100_u32)
  PKEY_GPS_DestLatitude = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x9d1d7cc5_u32, 0x5c39_u16, 0x451c_u16, StaticArray[0x86_u8, 0xb3_u8, 0x92_u8, 0x8e_u8, 0x2d_u8, 0x18_u8, 0xcc_u8, 0x47_u8]), 100_u32)
  PKEY_GPS_DestLatitudeDenominator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x3a372292_u32, 0x7fca_u16, 0x49a7_u16, StaticArray[0x99_u8, 0xd5_u8, 0xe4_u8, 0x7b_u8, 0xb2_u8, 0xd4_u8, 0xe7_u8, 0xab_u8]), 100_u32)
  PKEY_GPS_DestLatitudeNumerator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xecf4b6f6_u32, 0xd5a6_u16, 0x433c_u16, StaticArray[0xbb_u8, 0x92_u8, 0x40_u8, 0x76_u8, 0x65_u8, 0xf_u8, 0xc8_u8, 0x90_u8]), 100_u32)
  PKEY_GPS_DestLatitudeRef = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xcea820b9_u32, 0xce61_u16, 0x4885_u16, StaticArray[0xa1_u8, 0x28_u8, 0x0_u8, 0x5d_u8, 0x90_u8, 0x87_u8, 0xc1_u8, 0x92_u8]), 100_u32)
  PKEY_GPS_DestLongitude = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x47a96261_u32, 0xcb4c_u16, 0x4807_u16, StaticArray[0x8a_u8, 0xd3_u8, 0x40_u8, 0xb9_u8, 0xd9_u8, 0xdb_u8, 0xc6_u8, 0xbc_u8]), 100_u32)
  PKEY_GPS_DestLongitudeDenominator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x425d69e5_u32, 0x48ad_u16, 0x4900_u16, StaticArray[0x8d_u8, 0x80_u8, 0x6e_u8, 0xb6_u8, 0xb8_u8, 0xd0_u8, 0xac_u8, 0x86_u8]), 100_u32)
  PKEY_GPS_DestLongitudeNumerator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa3250282_u32, 0xfb6d_u16, 0x48d5_u16, StaticArray[0x9a_u8, 0x89_u8, 0xdb_u8, 0xca_u8, 0xce_u8, 0x75_u8, 0xcc_u8, 0xcf_u8]), 100_u32)
  PKEY_GPS_DestLongitudeRef = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x182c1ea6_u32, 0x7c1c_u16, 0x4083_u16, StaticArray[0xab_u8, 0x4b_u8, 0xac_u8, 0x6c_u8, 0x9f_u8, 0x4e_u8, 0xd1_u8, 0x28_u8]), 100_u32)
  PKEY_GPS_Differential = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xaaf4ee25_u32, 0xbd3b_u16, 0x4dd7_u16, StaticArray[0xbf_u8, 0xc4_u8, 0x47_u8, 0xf7_u8, 0x7b_u8, 0xb0_u8, 0xf_u8, 0x6d_u8]), 100_u32)
  PKEY_GPS_DOP = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xcf8fb02_u32, 0x1837_u16, 0x42f1_u16, StaticArray[0xa6_u8, 0x97_u8, 0xa7_u8, 0x1_u8, 0x7a_u8, 0xa2_u8, 0x89_u8, 0xb9_u8]), 100_u32)
  PKEY_GPS_DOPDenominator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa0be94c5_u32, 0x50ba_u16, 0x487b_u16, StaticArray[0xbd_u8, 0x35_u8, 0x6_u8, 0x54_u8, 0xbe_u8, 0x88_u8, 0x81_u8, 0xed_u8]), 100_u32)
  PKEY_GPS_DOPNumerator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x47166b16_u32, 0x364f_u16, 0x4aa0_u16, StaticArray[0x9f_u8, 0x31_u8, 0xe2_u8, 0xab_u8, 0x3d_u8, 0xf4_u8, 0x49_u8, 0xc3_u8]), 100_u32)
  PKEY_GPS_ImgDirection = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x16473c91_u32, 0xd017_u16, 0x4ed9_u16, StaticArray[0xba_u8, 0x4d_u8, 0xb6_u8, 0xba_u8, 0xa5_u8, 0x5d_u8, 0xbc_u8, 0xf8_u8]), 100_u32)
  PKEY_GPS_ImgDirectionDenominator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x10b24595_u32, 0x41a2_u16, 0x4e20_u16, StaticArray[0x93_u8, 0xc2_u8, 0x57_u8, 0x61_u8, 0xc1_u8, 0x39_u8, 0x5f_u8, 0x32_u8]), 100_u32)
  PKEY_GPS_ImgDirectionNumerator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xdc5877c7_u32, 0x225f_u16, 0x45f7_u16, StaticArray[0xba_u8, 0xc7_u8, 0xe8_u8, 0x13_u8, 0x34_u8, 0xb6_u8, 0x13_u8, 0xa_u8]), 100_u32)
  PKEY_GPS_ImgDirectionRef = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa4aaa5b7_u32, 0x1ad0_u16, 0x445f_u16, StaticArray[0x81_u8, 0x1a_u8, 0xf_u8, 0x8f_u8, 0x6e_u8, 0x67_u8, 0xf6_u8, 0xb5_u8]), 100_u32)
  PKEY_GPS_Latitude = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8727cfff_u32, 0x4868_u16, 0x4ec6_u16, StaticArray[0xad_u8, 0x5b_u8, 0x81_u8, 0xb9_u8, 0x85_u8, 0x21_u8, 0xd1_u8, 0xab_u8]), 100_u32)
  PKEY_GPS_LatitudeDecimal = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf55cde2_u32, 0x4f49_u16, 0x450d_u16, StaticArray[0x92_u8, 0xc1_u8, 0xdc_u8, 0xd1_u8, 0x63_u8, 0x1_u8, 0xb1_u8, 0xb7_u8]), 100_u32)
  PKEY_GPS_LatitudeDenominator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x16e634ee_u32, 0x2bff_u16, 0x497b_u16, StaticArray[0xbd_u8, 0x8a_u8, 0x43_u8, 0x41_u8, 0xad_u8, 0x39_u8, 0xee_u8, 0xb9_u8]), 100_u32)
  PKEY_GPS_LatitudeNumerator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x7ddaaad1_u32, 0xccc8_u16, 0x41ae_u16, StaticArray[0xb7_u8, 0x50_u8, 0xb2_u8, 0xcb_u8, 0x80_u8, 0x31_u8, 0xae_u8, 0xa2_u8]), 100_u32)
  PKEY_GPS_LatitudeRef = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x29c0252_u32, 0x5b86_u16, 0x46c7_u16, StaticArray[0xac_u8, 0xa0_u8, 0x27_u8, 0x69_u8, 0xff_u8, 0xc8_u8, 0xe3_u8, 0xd4_u8]), 100_u32)
  PKEY_GPS_Longitude = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc4c4dbb2_u32, 0xb593_u16, 0x466b_u16, StaticArray[0xbb_u8, 0xda_u8, 0xd0_u8, 0x3d_u8, 0x27_u8, 0xd5_u8, 0xe4_u8, 0x3a_u8]), 100_u32)
  PKEY_GPS_LongitudeDecimal = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4679c1b5_u32, 0x844d_u16, 0x4590_u16, StaticArray[0xba_u8, 0xf5_u8, 0xf3_u8, 0x22_u8, 0x23_u8, 0x1f_u8, 0x1b_u8, 0x81_u8]), 100_u32)
  PKEY_GPS_LongitudeDenominator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xbe6e176c_u32, 0x4534_u16, 0x4d2c_u16, StaticArray[0xac_u8, 0xe5_u8, 0x31_u8, 0xde_u8, 0xda_u8, 0xc1_u8, 0x60_u8, 0x6b_u8]), 100_u32)
  PKEY_GPS_LongitudeNumerator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x2b0f689_u32, 0xa914_u16, 0x4e45_u16, StaticArray[0x82_u8, 0x1d_u8, 0x1d_u8, 0xda_u8, 0x45_u8, 0x2e_u8, 0xd2_u8, 0xc4_u8]), 100_u32)
  PKEY_GPS_LongitudeRef = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x33dcf22b_u32, 0x28d5_u16, 0x464c_u16, StaticArray[0x80_u8, 0x35_u8, 0x1e_u8, 0xe9_u8, 0xef_u8, 0xd2_u8, 0x52_u8, 0x78_u8]), 100_u32)
  PKEY_GPS_MapDatum = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x2ca2dae6_u32, 0xeddc_u16, 0x407d_u16, StaticArray[0xbe_u8, 0xf1_u8, 0x77_u8, 0x39_u8, 0x42_u8, 0xab_u8, 0xfa_u8, 0x95_u8]), 100_u32)
  PKEY_GPS_MeasureMode = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa015ed5d_u32, 0xaaea_u16, 0x4d58_u16, StaticArray[0x8a_u8, 0x86_u8, 0x3c_u8, 0x58_u8, 0x69_u8, 0x20_u8, 0xea_u8, 0xb_u8]), 100_u32)
  PKEY_GPS_ProcessingMethod = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x59d49e61_u32, 0x840f_u16, 0x4aa9_u16, StaticArray[0xa9_u8, 0x39_u8, 0xe2_u8, 0x9_u8, 0x9b_u8, 0x7f_u8, 0x63_u8, 0x99_u8]), 100_u32)
  PKEY_GPS_Satellites = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x467ee575_u32, 0x1f25_u16, 0x4557_u16, StaticArray[0xad_u8, 0x4e_u8, 0xb8_u8, 0xb5_u8, 0x8b_u8, 0xd_u8, 0x9c_u8, 0x15_u8]), 100_u32)
  PKEY_GPS_Speed = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xda5d0862_u32, 0x6e76_u16, 0x4e1b_u16, StaticArray[0xba_u8, 0xbd_u8, 0x70_u8, 0x2_u8, 0x1b_u8, 0xd2_u8, 0x54_u8, 0x94_u8]), 100_u32)
  PKEY_GPS_SpeedDenominator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x7d122d5a_u32, 0xae5e_u16, 0x4335_u16, StaticArray[0x88_u8, 0x41_u8, 0xd7_u8, 0x1e_u8, 0x7c_u8, 0xe7_u8, 0x2f_u8, 0x53_u8]), 100_u32)
  PKEY_GPS_SpeedNumerator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xacc9ce3d_u32, 0xc213_u16, 0x4942_u16, StaticArray[0x8b_u8, 0x48_u8, 0x6d_u8, 0x8_u8, 0x20_u8, 0xf2_u8, 0x1c_u8, 0x6d_u8]), 100_u32)
  PKEY_GPS_SpeedRef = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xecf7f4c9_u32, 0x544f_u16, 0x4d6d_u16, StaticArray[0x9d_u8, 0x98_u8, 0x8a_u8, 0xd7_u8, 0x9a_u8, 0xda_u8, 0xf4_u8, 0x53_u8]), 100_u32)
  PKEY_GPS_Status = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x125491f4_u32, 0x818f_u16, 0x46b2_u16, StaticArray[0x91_u8, 0xb5_u8, 0xd5_u8, 0x37_u8, 0x75_u8, 0x36_u8, 0x17_u8, 0xb2_u8]), 100_u32)
  PKEY_GPS_Track = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x76c09943_u32, 0x7c33_u16, 0x49e3_u16, StaticArray[0x9e_u8, 0x7e_u8, 0xcd_u8, 0xba_u8, 0x87_u8, 0x2c_u8, 0xfa_u8, 0xda_u8]), 100_u32)
  PKEY_GPS_TrackDenominator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc8d1920c_u32, 0x1f6_u16, 0x40c0_u16, StaticArray[0xac_u8, 0x86_u8, 0x2f_u8, 0x3a_u8, 0x4a_u8, 0xd0_u8, 0x7_u8, 0x70_u8]), 100_u32)
  PKEY_GPS_TrackNumerator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x702926f4_u32, 0x44a6_u16, 0x43e1_u16, StaticArray[0xae_u8, 0x71_u8, 0x45_u8, 0x62_u8, 0x71_u8, 0x16_u8, 0x89_u8, 0x3b_u8]), 100_u32)
  PKEY_GPS_TrackRef = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x35dbe6fe_u32, 0x44c3_u16, 0x4400_u16, StaticArray[0xaa_u8, 0xae_u8, 0xd2_u8, 0xc7_u8, 0x99_u8, 0xc4_u8, 0x7_u8, 0xe8_u8]), 100_u32)
  PKEY_GPS_VersionID = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x22704da4_u32, 0xc6b2_u16, 0x4a99_u16, StaticArray[0x8e_u8, 0x56_u8, 0xf1_u8, 0x6d_u8, 0xf8_u8, 0xc9_u8, 0x25_u8, 0x99_u8]), 100_u32)
  PKEY_History_VisitCount = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x5cbf2787_u32, 0x48cf_u16, 0x4208_u16, StaticArray[0xb9_u8, 0xe_u8, 0xee_u8, 0x5e_u8, 0x5d_u8, 0x42_u8, 0x2_u8, 0x94_u8]), 7_u32)
  PKEY_Image_BitDepth = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6444048f_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 7_u32)
  PKEY_Image_ColorSpace = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 40961_u32)
  PKEY_Image_CompressedBitsPerPixel = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x364b6fa9_u32, 0x37ab_u16, 0x482a_u16, StaticArray[0xbe_u8, 0x2b_u8, 0xae_u8, 0x2_u8, 0xf6_u8, 0xd_u8, 0x43_u8, 0x18_u8]), 100_u32)
  PKEY_Image_CompressedBitsPerPixelDenominator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1f8844e1_u32, 0x24ad_u16, 0x4508_u16, StaticArray[0x9d_u8, 0xfd_u8, 0x53_u8, 0x26_u8, 0xa4_u8, 0x15_u8, 0xce_u8, 0x2_u8]), 100_u32)
  PKEY_Image_CompressedBitsPerPixelNumerator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd21a7148_u32, 0xd32c_u16, 0x4624_u16, StaticArray[0x89_u8, 0x0_u8, 0x27_u8, 0x72_u8, 0x10_u8, 0xf7_u8, 0x9c_u8, 0xf_u8]), 100_u32)
  PKEY_Image_Compression = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 259_u32)
  PKEY_Image_CompressionText = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x3f08e66f_u32, 0x2f44_u16, 0x4bb9_u16, StaticArray[0xa6_u8, 0x82_u8, 0xac_u8, 0x35_u8, 0xd2_u8, 0x56_u8, 0x23_u8, 0x22_u8]), 100_u32)
  PKEY_Image_Dimensions = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6444048f_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 13_u32)
  PKEY_Image_HorizontalResolution = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6444048f_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 5_u32)
  PKEY_Image_HorizontalSize = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6444048f_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 3_u32)
  PKEY_Image_ImageID = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x10dabe05_u32, 0x32aa_u16, 0x4c29_u16, StaticArray[0xbf_u8, 0x1a_u8, 0x63_u8, 0xe2_u8, 0xd2_u8, 0x20_u8, 0x58_u8, 0x7f_u8]), 100_u32)
  PKEY_Image_ResolutionUnit = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x19b51fa6_u32, 0x1f92_u16, 0x4a5c_u16, StaticArray[0xab_u8, 0x48_u8, 0x7d_u8, 0xf0_u8, 0xab_u8, 0xd6_u8, 0x74_u8, 0x44_u8]), 100_u32)
  PKEY_Image_VerticalResolution = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6444048f_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 6_u32)
  PKEY_Image_VerticalSize = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6444048f_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 4_u32)
  PKEY_Journal_Contacts = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xdea7c82c_u32, 0x1d89_u16, 0x4a66_u16, StaticArray[0x94_u8, 0x27_u8, 0xa4_u8, 0xe3_u8, 0xde_u8, 0xba_u8, 0xbc_u8, 0xb1_u8]), 100_u32)
  PKEY_Journal_EntryType = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x95beb1fc_u32, 0x326d_u16, 0x4644_u16, StaticArray[0xb3_u8, 0x96_u8, 0xcd_u8, 0x3e_u8, 0xd9_u8, 0xe_u8, 0x6d_u8, 0xdf_u8]), 100_u32)
  PKEY_LayoutPattern_ContentViewModeForBrowse = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc9944a21_u32, 0xa406_u16, 0x48fe_u16, StaticArray[0x82_u8, 0x25_u8, 0xae_u8, 0xc7_u8, 0xe2_u8, 0x4c_u8, 0x21_u8, 0x1b_u8]), 500_u32)
  LAYOUTPATTERN_CVMFB_ALPHA = "alpha"
  LAYOUTPATTERN_CVMFB_BETA = "beta"
  LAYOUTPATTERN_CVMFB_GAMMA = "gamma"
  LAYOUTPATTERN_CVMFB_DELTA = "delta"
  PKEY_LayoutPattern_ContentViewModeForSearch = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc9944a21_u32, 0xa406_u16, 0x48fe_u16, StaticArray[0x82_u8, 0x25_u8, 0xae_u8, 0xc7_u8, 0xe2_u8, 0x4c_u8, 0x21_u8, 0x1b_u8]), 501_u32)
  LAYOUTPATTERN_CVMFS_ALPHA = "alpha"
  LAYOUTPATTERN_CVMFS_BETA = "beta"
  LAYOUTPATTERN_CVMFS_GAMMA = "gamma"
  LAYOUTPATTERN_CVMFS_DELTA = "delta"
  PKEY_History_SelectionCount = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1ce0d6bc_u32, 0x536c_u16, 0x4600_u16, StaticArray[0xb0_u8, 0xdd_u8, 0x7e_u8, 0xc_u8, 0x66_u8, 0xb3_u8, 0x50_u8, 0xd5_u8]), 8_u32)
  PKEY_History_TargetUrlHostName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1ce0d6bc_u32, 0x536c_u16, 0x4600_u16, StaticArray[0xb0_u8, 0xdd_u8, 0x7e_u8, 0xc_u8, 0x66_u8, 0xb3_u8, 0x50_u8, 0xd5_u8]), 9_u32)
  PKEY_Link_Arguments = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x436f2667_u32, 0x14e2_u16, 0x4feb_u16, StaticArray[0xb3_u8, 0xa_u8, 0x14_u8, 0x6c_u8, 0x53_u8, 0xb5_u8, 0xb6_u8, 0x74_u8]), 100_u32)
  PKEY_Link_Comment = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb9b4b3fc_u32, 0x2b51_u16, 0x4a42_u16, StaticArray[0xb5_u8, 0xd8_u8, 0x32_u8, 0x41_u8, 0x46_u8, 0xaf_u8, 0xcf_u8, 0x25_u8]), 5_u32)
  PKEY_Link_DateVisited = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x5cbf2787_u32, 0x48cf_u16, 0x4208_u16, StaticArray[0xb9_u8, 0xe_u8, 0xee_u8, 0x5e_u8, 0x5d_u8, 0x42_u8, 0x2_u8, 0x94_u8]), 23_u32)
  PKEY_Link_Description = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x5cbf2787_u32, 0x48cf_u16, 0x4208_u16, StaticArray[0xb9_u8, 0xe_u8, 0xee_u8, 0x5e_u8, 0x5d_u8, 0x42_u8, 0x2_u8, 0x94_u8]), 21_u32)
  PKEY_Link_FeedItemLocalId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8a2f99f9_u32, 0x3c37_u16, 0x465d_u16, StaticArray[0xa8_u8, 0xd7_u8, 0x69_u8, 0x77_u8, 0x7a_u8, 0x24_u8, 0x6d_u8, 0xc_u8]), 2_u32)
  PKEY_Link_Status = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb9b4b3fc_u32, 0x2b51_u16, 0x4a42_u16, StaticArray[0xb5_u8, 0xd8_u8, 0x32_u8, 0x41_u8, 0x46_u8, 0xaf_u8, 0xcf_u8, 0x25_u8]), 3_u32)
  LINK_STATUS_RESOLVED = 1_i32
  LINK_STATUS_BROKEN = 2_i32
  PKEY_Link_TargetExtension = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x7a7d76f4_u32, 0xb630_u16, 0x4bd7_u16, StaticArray[0x95_u8, 0xff_u8, 0x37_u8, 0xcc_u8, 0x51_u8, 0xa9_u8, 0x75_u8, 0xc9_u8]), 2_u32)
  PKEY_Link_TargetParsingPath = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb9b4b3fc_u32, 0x2b51_u16, 0x4a42_u16, StaticArray[0xb5_u8, 0xd8_u8, 0x32_u8, 0x41_u8, 0x46_u8, 0xaf_u8, 0xcf_u8, 0x25_u8]), 2_u32)
  PKEY_Link_TargetSFGAOFlags = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb9b4b3fc_u32, 0x2b51_u16, 0x4a42_u16, StaticArray[0xb5_u8, 0xd8_u8, 0x32_u8, 0x41_u8, 0x46_u8, 0xaf_u8, 0xcf_u8, 0x25_u8]), 8_u32)
  PKEY_Link_TargetUrlHostName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8a2f99f9_u32, 0x3c37_u16, 0x465d_u16, StaticArray[0xa8_u8, 0xd7_u8, 0x69_u8, 0x77_u8, 0x7a_u8, 0x24_u8, 0x6d_u8, 0xc_u8]), 5_u32)
  PKEY_Link_TargetUrlPath = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8a2f99f9_u32, 0x3c37_u16, 0x465d_u16, StaticArray[0xa8_u8, 0xd7_u8, 0x69_u8, 0x77_u8, 0x7a_u8, 0x24_u8, 0x6d_u8, 0xc_u8]), 6_u32)
  PKEY_Media_AuthorUrl = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 32_u32)
  PKEY_Media_AverageLevel = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x9edd5b6_u32, 0xb301_u16, 0x43c5_u16, StaticArray[0x99_u8, 0x90_u8, 0xd0_u8, 0x3_u8, 0x2_u8, 0xef_u8, 0xfd_u8, 0x46_u8]), 100_u32)
  PKEY_Media_ClassPrimaryID = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 13_u32)
  PKEY_Media_ClassSecondaryID = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 14_u32)
  PKEY_Media_CollectionGroupID = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 24_u32)
  PKEY_Media_CollectionID = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 25_u32)
  PKEY_Media_ContentDistributor = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 18_u32)
  PKEY_Media_ContentID = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 26_u32)
  PKEY_Media_CreatorApplication = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 27_u32)
  PKEY_Media_CreatorApplicationVersion = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 28_u32)
  PKEY_Media_DateEncoded = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x2e4b640d_u32, 0x5019_u16, 0x46d8_u16, StaticArray[0x88_u8, 0x81_u8, 0x55_u8, 0x41_u8, 0x4c_u8, 0xc5_u8, 0xca_u8, 0xa0_u8]), 100_u32)
  PKEY_Media_DateReleased = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xde41cc29_u32, 0x6971_u16, 0x4290_u16, StaticArray[0xb4_u8, 0x72_u8, 0xf5_u8, 0x9f_u8, 0x2e_u8, 0x2f_u8, 0x31_u8, 0xe2_u8]), 100_u32)
  PKEY_Media_DlnaProfileID = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xcfa31b45_u32, 0x525d_u16, 0x4998_u16, StaticArray[0xbb_u8, 0x44_u8, 0x3f_u8, 0x7d_u8, 0x81_u8, 0x54_u8, 0x2f_u8, 0xa4_u8]), 100_u32)
  PKEY_Media_Duration = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440490_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 3_u32)
  PKEY_Media_DVDID = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 15_u32)
  PKEY_Media_EncodedBy = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 36_u32)
  PKEY_Media_EncodingSettings = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 37_u32)
  PKEY_Media_EpisodeNumber = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 100_u32)
  PKEY_Media_FrameCount = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6444048f_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 12_u32)
  PKEY_Media_MCDI = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 16_u32)
  PKEY_Media_MetadataContentProvider = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 17_u32)
  PKEY_Media_Producer = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 22_u32)
  PKEY_Media_PromotionUrl = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 33_u32)
  PKEY_Media_ProtectionType = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 38_u32)
  PKEY_Media_ProviderRating = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 39_u32)
  PKEY_Media_ProviderStyle = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 40_u32)
  PKEY_Media_Publisher = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 30_u32)
  PKEY_Media_SeasonNumber = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 101_u32)
  PKEY_Media_SeriesName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 42_u32)
  PKEY_Media_SubscriptionContentId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x9aebae7a_u32, 0x9644_u16, 0x487d_u16, StaticArray[0xa9_u8, 0x2c_u8, 0x65_u8, 0x75_u8, 0x85_u8, 0xed_u8, 0x75_u8, 0x1a_u8]), 100_u32)
  PKEY_Media_SubTitle = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x56a3372e_u32, 0xce9c_u16, 0x11d2_u16, StaticArray[0x9f_u8, 0xe_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xc6_u8, 0x86_u8, 0xf6_u8]), 38_u32)
  PKEY_Media_ThumbnailLargePath = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 47_u32)
  PKEY_Media_ThumbnailLargeUri = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 48_u32)
  PKEY_Media_ThumbnailSmallPath = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 49_u32)
  PKEY_Media_ThumbnailSmallUri = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 50_u32)
  PKEY_Media_UniqueFileIdentifier = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 35_u32)
  PKEY_Media_UserNoAutoInfo = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 41_u32)
  PKEY_Media_UserWebUrl = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 34_u32)
  PKEY_Media_Writer = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 23_u32)
  PKEY_Media_Year = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x56a3372e_u32, 0xce9c_u16, 0x11d2_u16, StaticArray[0x9f_u8, 0xe_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xc6_u8, 0x86_u8, 0xf6_u8]), 5_u32)
  PKEY_Message_AttachmentContents = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x3143bf7c_u32, 0x80a8_u16, 0x4854_u16, StaticArray[0x88_u8, 0x80_u8, 0xe2_u8, 0xe4_u8, 0x1_u8, 0x89_u8, 0xbd_u8, 0xd0_u8]), 100_u32)
  PKEY_Message_AttachmentNames = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xe3e0584c_u32, 0xb788_u16, 0x4a5a_u16, StaticArray[0xbb_u8, 0x20_u8, 0x7f_u8, 0x5a_u8, 0x44_u8, 0xc9_u8, 0xac_u8, 0xdd_u8]), 21_u32)
  PKEY_Message_BccAddress = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xe3e0584c_u32, 0xb788_u16, 0x4a5a_u16, StaticArray[0xbb_u8, 0x20_u8, 0x7f_u8, 0x5a_u8, 0x44_u8, 0xc9_u8, 0xac_u8, 0xdd_u8]), 2_u32)
  PKEY_Message_BccName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xe3e0584c_u32, 0xb788_u16, 0x4a5a_u16, StaticArray[0xbb_u8, 0x20_u8, 0x7f_u8, 0x5a_u8, 0x44_u8, 0xc9_u8, 0xac_u8, 0xdd_u8]), 3_u32)
  PKEY_Message_CcAddress = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xe3e0584c_u32, 0xb788_u16, 0x4a5a_u16, StaticArray[0xbb_u8, 0x20_u8, 0x7f_u8, 0x5a_u8, 0x44_u8, 0xc9_u8, 0xac_u8, 0xdd_u8]), 4_u32)
  PKEY_Message_CcName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xe3e0584c_u32, 0xb788_u16, 0x4a5a_u16, StaticArray[0xbb_u8, 0x20_u8, 0x7f_u8, 0x5a_u8, 0x44_u8, 0xc9_u8, 0xac_u8, 0xdd_u8]), 5_u32)
  PKEY_Message_ConversationID = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xdc8f80bd_u32, 0xaf1e_u16, 0x4289_u16, StaticArray[0x85_u8, 0xb6_u8, 0x3d_u8, 0xfc_u8, 0x1b_u8, 0x49_u8, 0x39_u8, 0x92_u8]), 100_u32)
  PKEY_Message_ConversationIndex = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xdc8f80bd_u32, 0xaf1e_u16, 0x4289_u16, StaticArray[0x85_u8, 0xb6_u8, 0x3d_u8, 0xfc_u8, 0x1b_u8, 0x49_u8, 0x39_u8, 0x92_u8]), 101_u32)
  PKEY_Message_DateReceived = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xe3e0584c_u32, 0xb788_u16, 0x4a5a_u16, StaticArray[0xbb_u8, 0x20_u8, 0x7f_u8, 0x5a_u8, 0x44_u8, 0xc9_u8, 0xac_u8, 0xdd_u8]), 20_u32)
  PKEY_Message_DateSent = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xe3e0584c_u32, 0xb788_u16, 0x4a5a_u16, StaticArray[0xbb_u8, 0x20_u8, 0x7f_u8, 0x5a_u8, 0x44_u8, 0xc9_u8, 0xac_u8, 0xdd_u8]), 19_u32)
  PKEY_Message_Flags = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa82d9ee7_u32, 0xca67_u16, 0x4312_u16, StaticArray[0x96_u8, 0x5e_u8, 0x22_u8, 0x6b_u8, 0xce_u8, 0xa8_u8, 0x50_u8, 0x23_u8]), 100_u32)
  PKEY_Message_FromAddress = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xe3e0584c_u32, 0xb788_u16, 0x4a5a_u16, StaticArray[0xbb_u8, 0x20_u8, 0x7f_u8, 0x5a_u8, 0x44_u8, 0xc9_u8, 0xac_u8, 0xdd_u8]), 13_u32)
  PKEY_Message_FromName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xe3e0584c_u32, 0xb788_u16, 0x4a5a_u16, StaticArray[0xbb_u8, 0x20_u8, 0x7f_u8, 0x5a_u8, 0x44_u8, 0xc9_u8, 0xac_u8, 0xdd_u8]), 14_u32)
  PKEY_Message_HasAttachments = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x9c1fcf74_u32, 0x2d97_u16, 0x41ba_u16, StaticArray[0xb4_u8, 0xae_u8, 0xcb_u8, 0x2e_u8, 0x36_u8, 0x61_u8, 0xa6_u8, 0xe4_u8]), 8_u32)
  PKEY_Message_IsFwdOrReply = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x9a9bc088_u32, 0x4f6d_u16, 0x469e_u16, StaticArray[0x99_u8, 0x19_u8, 0xe7_u8, 0x5_u8, 0x41_u8, 0x20_u8, 0x40_u8, 0xf9_u8]), 100_u32)
  PKEY_Message_MessageClass = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xcd9ed458_u32, 0x8ce_u16, 0x418f_u16, StaticArray[0xa7_u8, 0xe_u8, 0xf9_u8, 0x12_u8, 0xc7_u8, 0xbb_u8, 0x9c_u8, 0x5c_u8]), 103_u32)
  PKEY_Message_Participants = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1a9ba605_u32, 0x8e7c_u16, 0x4d11_u16, StaticArray[0xad_u8, 0x7d_u8, 0xa5_u8, 0xa_u8, 0xda_u8, 0x18_u8, 0xba_u8, 0x1b_u8]), 2_u32)
  PKEY_Message_ProofInProgress = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x9098f33c_u32, 0x9a7d_u16, 0x48a8_u16, StaticArray[0x8d_u8, 0xe5_u8, 0x2e_u8, 0x12_u8, 0x27_u8, 0xa6_u8, 0x4e_u8, 0x91_u8]), 100_u32)
  PKEY_Message_SenderAddress = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xbe1c8e7_u32, 0x1981_u16, 0x4676_u16, StaticArray[0xae_u8, 0x14_u8, 0xfd_u8, 0xd7_u8, 0x8f_u8, 0x5_u8, 0xa6_u8, 0xe7_u8]), 100_u32)
  PKEY_Message_SenderName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xda41cfa_u32, 0xd224_u16, 0x4a18_u16, StaticArray[0xae_u8, 0x2f_u8, 0x59_u8, 0x61_u8, 0x58_u8, 0xdb_u8, 0x4b_u8, 0x3a_u8]), 100_u32)
  PKEY_Message_Store = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xe3e0584c_u32, 0xb788_u16, 0x4a5a_u16, StaticArray[0xbb_u8, 0x20_u8, 0x7f_u8, 0x5a_u8, 0x44_u8, 0xc9_u8, 0xac_u8, 0xdd_u8]), 15_u32)
  PKEY_Message_ToAddress = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xe3e0584c_u32, 0xb788_u16, 0x4a5a_u16, StaticArray[0xbb_u8, 0x20_u8, 0x7f_u8, 0x5a_u8, 0x44_u8, 0xc9_u8, 0xac_u8, 0xdd_u8]), 16_u32)
  PKEY_Message_ToDoFlags = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1f856a9f_u32, 0x6900_u16, 0x4aba_u16, StaticArray[0x95_u8, 0x5_u8, 0x2d_u8, 0x5f_u8, 0x1b_u8, 0x4d_u8, 0x66_u8, 0xcb_u8]), 100_u32)
  PKEY_Message_ToDoTitle = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xbccc8a3c_u32, 0x8cef_u16, 0x42e5_u16, StaticArray[0x9b_u8, 0x1c_u8, 0xc6_u8, 0x90_u8, 0x79_u8, 0x39_u8, 0x8b_u8, 0xc7_u8]), 100_u32)
  PKEY_Message_ToName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xe3e0584c_u32, 0xb788_u16, 0x4a5a_u16, StaticArray[0xbb_u8, 0x20_u8, 0x7f_u8, 0x5a_u8, 0x44_u8, 0xc9_u8, 0xac_u8, 0xdd_u8]), 17_u32)
  PKEY_Music_AlbumArtist = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x56a3372e_u32, 0xce9c_u16, 0x11d2_u16, StaticArray[0x9f_u8, 0xe_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xc6_u8, 0x86_u8, 0xf6_u8]), 13_u32)
  PKEY_Music_AlbumArtistSortOverride = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf1fdb4af_u32, 0xf78c_u16, 0x466c_u16, StaticArray[0xbb_u8, 0x5_u8, 0x56_u8, 0xe9_u8, 0x2d_u8, 0xb0_u8, 0xb8_u8, 0xec_u8]), 103_u32)
  PKEY_Music_AlbumID = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x56a3372e_u32, 0xce9c_u16, 0x11d2_u16, StaticArray[0x9f_u8, 0xe_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xc6_u8, 0x86_u8, 0xf6_u8]), 100_u32)
  PKEY_Music_AlbumTitle = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x56a3372e_u32, 0xce9c_u16, 0x11d2_u16, StaticArray[0x9f_u8, 0xe_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xc6_u8, 0x86_u8, 0xf6_u8]), 4_u32)
  PKEY_Music_AlbumTitleSortOverride = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x13eb7ffc_u32, 0xec89_u16, 0x4346_u16, StaticArray[0xb1_u8, 0x9d_u8, 0xcc_u8, 0xc6_u8, 0xf1_u8, 0x78_u8, 0x42_u8, 0x23_u8]), 101_u32)
  PKEY_Music_Artist = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x56a3372e_u32, 0xce9c_u16, 0x11d2_u16, StaticArray[0x9f_u8, 0xe_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xc6_u8, 0x86_u8, 0xf6_u8]), 2_u32)
  PKEY_Music_ArtistSortOverride = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xdeeb2db5_u32, 0x696_u16, 0x4ce0_u16, StaticArray[0x94_u8, 0xfe_u8, 0xa0_u8, 0x1f_u8, 0x77_u8, 0xa4_u8, 0x5f_u8, 0xb5_u8]), 102_u32)
  PKEY_Music_BeatsPerMinute = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x56a3372e_u32, 0xce9c_u16, 0x11d2_u16, StaticArray[0x9f_u8, 0xe_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xc6_u8, 0x86_u8, 0xf6_u8]), 35_u32)
  PKEY_Music_Composer = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 19_u32)
  PKEY_Music_ComposerSortOverride = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xbc20a3_u32, 0xbd48_u16, 0x4085_u16, StaticArray[0x87_u8, 0x2c_u8, 0xa8_u8, 0x8d_u8, 0x77_u8, 0xf5_u8, 0x9_u8, 0x7e_u8]), 105_u32)
  PKEY_Music_Conductor = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x56a3372e_u32, 0xce9c_u16, 0x11d2_u16, StaticArray[0x9f_u8, 0xe_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xc6_u8, 0x86_u8, 0xf6_u8]), 36_u32)
  PKEY_Music_ContentGroupDescription = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x56a3372e_u32, 0xce9c_u16, 0x11d2_u16, StaticArray[0x9f_u8, 0xe_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xc6_u8, 0x86_u8, 0xf6_u8]), 33_u32)
  PKEY_Music_DiscNumber = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6afe7437_u32, 0x9bcd_u16, 0x49c7_u16, StaticArray[0x80_u8, 0xfe_u8, 0x4a_u8, 0x5c_u8, 0x65_u8, 0xfa_u8, 0x58_u8, 0x74_u8]), 104_u32)
  PKEY_Music_DisplayArtist = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xfd122953_u32, 0xfa93_u16, 0x4ef7_u16, StaticArray[0x92_u8, 0xc3_u8, 0x4_u8, 0xc9_u8, 0x46_u8, 0xb2_u8, 0xf7_u8, 0xc8_u8]), 100_u32)
  PKEY_Music_Genre = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x56a3372e_u32, 0xce9c_u16, 0x11d2_u16, StaticArray[0x9f_u8, 0xe_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xc6_u8, 0x86_u8, 0xf6_u8]), 11_u32)
  PKEY_Music_InitialKey = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x56a3372e_u32, 0xce9c_u16, 0x11d2_u16, StaticArray[0x9f_u8, 0xe_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xc6_u8, 0x86_u8, 0xf6_u8]), 34_u32)
  PKEY_Music_IsCompilation = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc449d5cb_u32, 0x9ea4_u16, 0x4809_u16, StaticArray[0x82_u8, 0xe8_u8, 0xaf_u8, 0x9d_u8, 0x59_u8, 0xde_u8, 0xd6_u8, 0xd1_u8]), 100_u32)
  PKEY_Music_Lyrics = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x56a3372e_u32, 0xce9c_u16, 0x11d2_u16, StaticArray[0x9f_u8, 0xe_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xc6_u8, 0x86_u8, 0xf6_u8]), 12_u32)
  PKEY_Music_Mood = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x56a3372e_u32, 0xce9c_u16, 0x11d2_u16, StaticArray[0x9f_u8, 0xe_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xc6_u8, 0x86_u8, 0xf6_u8]), 39_u32)
  PKEY_Music_PartOfSet = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x56a3372e_u32, 0xce9c_u16, 0x11d2_u16, StaticArray[0x9f_u8, 0xe_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xc6_u8, 0x86_u8, 0xf6_u8]), 37_u32)
  PKEY_Music_Period = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 31_u32)
  PKEY_Music_SynchronizedLyrics = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6b223b6a_u32, 0x162e_u16, 0x4aa9_u16, StaticArray[0xb3_u8, 0x9f_u8, 0x5_u8, 0xd6_u8, 0x78_u8, 0xfc_u8, 0x6d_u8, 0x77_u8]), 100_u32)
  PKEY_Music_TrackNumber = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x56a3372e_u32, 0xce9c_u16, 0x11d2_u16, StaticArray[0x9f_u8, 0xe_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xc6_u8, 0x86_u8, 0xf6_u8]), 7_u32)
  PKEY_Note_Color = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4776cafa_u32, 0xbce4_u16, 0x4cb1_u16, StaticArray[0xa2_u8, 0x3e_u8, 0x26_u8, 0x5e_u8, 0x76_u8, 0xd8_u8, 0xeb_u8, 0x11_u8]), 100_u32)
  PKEY_Note_ColorText = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x46b4e8de_u32, 0xcdb2_u16, 0x440d_u16, StaticArray[0x88_u8, 0x5c_u8, 0x16_u8, 0x58_u8, 0xeb_u8, 0x65_u8, 0xb9_u8, 0x14_u8]), 100_u32)
  PKEY_Photo_Aperture = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 37378_u32)
  PKEY_Photo_ApertureDenominator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xe1a9a38b_u32, 0x6685_u16, 0x46bd_u16, StaticArray[0x87_u8, 0x5e_u8, 0x57_u8, 0xd_u8, 0xc7_u8, 0xad_u8, 0x73_u8, 0x20_u8]), 100_u32)
  PKEY_Photo_ApertureNumerator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x337ecec_u32, 0x39fb_u16, 0x4581_u16, StaticArray[0xa0_u8, 0xbd_u8, 0x4c_u8, 0x4c_u8, 0xc5_u8, 0x1e_u8, 0x99_u8, 0x14_u8]), 100_u32)
  PKEY_Photo_Brightness = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1a701bf6_u32, 0x478c_u16, 0x4361_u16, StaticArray[0x83_u8, 0xab_u8, 0x37_u8, 0x1_u8, 0xbb_u8, 0x5_u8, 0x3c_u8, 0x58_u8]), 100_u32)
  PKEY_Photo_BrightnessDenominator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6ebe6946_u32, 0x2321_u16, 0x440a_u16, StaticArray[0x90_u8, 0xf0_u8, 0xc0_u8, 0x43_u8, 0xef_u8, 0xd3_u8, 0x24_u8, 0x76_u8]), 100_u32)
  PKEY_Photo_BrightnessNumerator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x9e7d118f_u32, 0xb314_u16, 0x45a0_u16, StaticArray[0x8c_u8, 0xfb_u8, 0xd6_u8, 0x54_u8, 0xb9_u8, 0x17_u8, 0xc9_u8, 0xe9_u8]), 100_u32)
  PKEY_Photo_CameraManufacturer = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 271_u32)
  PKEY_Photo_CameraModel = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 272_u32)
  PKEY_Photo_CameraSerialNumber = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 273_u32)
  PKEY_Photo_Contrast = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x2a785ba9_u32, 0x8d23_u16, 0x4ded_u16, StaticArray[0x82_u8, 0xe6_u8, 0x60_u8, 0xa3_u8, 0x50_u8, 0xc8_u8, 0x6a_u8, 0x10_u8]), 100_u32)
  PHOTO_CONTRAST_NORMAL = 0_u32
  PHOTO_CONTRAST_SOFT = 1_u32
  PHOTO_CONTRAST_HARD = 2_u32
  PKEY_Photo_ContrastText = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x59dde9f2_u32, 0x5253_u16, 0x40ea_u16, StaticArray[0x9a_u8, 0x8b_u8, 0x47_u8, 0x9e_u8, 0x96_u8, 0xc6_u8, 0x24_u8, 0x9a_u8]), 100_u32)
  PKEY_Photo_DateTaken = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 36867_u32)
  PKEY_Photo_DigitalZoom = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf85bf840_u32, 0xa925_u16, 0x4bc2_u16, StaticArray[0xb0_u8, 0xc4_u8, 0x8e_u8, 0x36_u8, 0xb5_u8, 0x98_u8, 0x67_u8, 0x9e_u8]), 100_u32)
  PKEY_Photo_DigitalZoomDenominator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x745baf0e_u32, 0xe5c1_u16, 0x4cfb_u16, StaticArray[0x8a_u8, 0x1b_u8, 0xd0_u8, 0x31_u8, 0xa0_u8, 0xa5_u8, 0x23_u8, 0x93_u8]), 100_u32)
  PKEY_Photo_DigitalZoomNumerator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x16cbb924_u32, 0x6500_u16, 0x473b_u16, StaticArray[0xa5_u8, 0xbe_u8, 0xf1_u8, 0x59_u8, 0x9b_u8, 0xcb_u8, 0xe4_u8, 0x13_u8]), 100_u32)
  PKEY_Photo_Event = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 18248_u32)
  PKEY_Photo_EXIFVersion = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd35f743a_u32, 0xeb2e_u16, 0x47f2_u16, StaticArray[0xa2_u8, 0x86_u8, 0x84_u8, 0x41_u8, 0x32_u8, 0xcb_u8, 0x14_u8, 0x27_u8]), 100_u32)
  PKEY_Photo_ExposureBias = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 37380_u32)
  PKEY_Photo_ExposureBiasDenominator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xab205e50_u32, 0x4b7_u16, 0x461c_u16, StaticArray[0xa1_u8, 0x8c_u8, 0x2f_u8, 0x23_u8, 0x38_u8, 0x36_u8, 0xe6_u8, 0x27_u8]), 100_u32)
  PKEY_Photo_ExposureBiasNumerator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x738bf284_u32, 0x1d87_u16, 0x420b_u16, StaticArray[0x92_u8, 0xcf_u8, 0x58_u8, 0x34_u8, 0xbf_u8, 0x6e_u8, 0xf9_u8, 0xed_u8]), 100_u32)
  PKEY_Photo_ExposureIndex = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x967b5af8_u32, 0x995a_u16, 0x46ed_u16, StaticArray[0x9e_u8, 0x11_u8, 0x35_u8, 0xb3_u8, 0xc5_u8, 0xb9_u8, 0x78_u8, 0x2d_u8]), 100_u32)
  PKEY_Photo_ExposureIndexDenominator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x93112f89_u32, 0xc28b_u16, 0x492f_u16, StaticArray[0x8a_u8, 0x9d_u8, 0x4b_u8, 0xe2_u8, 0x6_u8, 0x2c_u8, 0xee_u8, 0x8a_u8]), 100_u32)
  PKEY_Photo_ExposureIndexNumerator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xcdedcf30_u32, 0x8919_u16, 0x44df_u16, StaticArray[0x8f_u8, 0x4c_u8, 0x4e_u8, 0xb2_u8, 0xff_u8, 0xdb_u8, 0x8d_u8, 0x89_u8]), 100_u32)
  PKEY_Photo_ExposureProgram = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 34850_u32)
  PHOTO_EXPOSUREPROGRAM_UNKNOWN = 0_u32
  PHOTO_EXPOSUREPROGRAM_MANUAL = 1_u32
  PHOTO_EXPOSUREPROGRAM_NORMAL = 2_u32
  PHOTO_EXPOSUREPROGRAM_APERTURE = 3_u32
  PHOTO_EXPOSUREPROGRAM_SHUTTER = 4_u32
  PHOTO_EXPOSUREPROGRAM_CREATIVE = 5_u32
  PHOTO_EXPOSUREPROGRAM_ACTION = 6_u32
  PHOTO_EXPOSUREPROGRAM_PORTRAIT = 7_u32
  PHOTO_EXPOSUREPROGRAM_LANDSCAPE = 8_u32
  PKEY_Photo_ExposureProgramText = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xfec690b7_u32, 0x5f30_u16, 0x4646_u16, StaticArray[0xae_u8, 0x47_u8, 0x4c_u8, 0xaa_u8, 0xfb_u8, 0xa8_u8, 0x84_u8, 0xa3_u8]), 100_u32)
  PKEY_Photo_ExposureTime = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 33434_u32)
  PKEY_Photo_ExposureTimeDenominator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x55e98597_u32, 0xad16_u16, 0x42e0_u16, StaticArray[0xb6_u8, 0x24_u8, 0x21_u8, 0x59_u8, 0x9a_u8, 0x19_u8, 0x98_u8, 0x38_u8]), 100_u32)
  PKEY_Photo_ExposureTimeNumerator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x257e44e2_u32, 0x9031_u16, 0x4323_u16, StaticArray[0xac_u8, 0x38_u8, 0x85_u8, 0xc5_u8, 0x52_u8, 0x87_u8, 0x1b_u8, 0x2e_u8]), 100_u32)
  PKEY_Photo_Flash = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 37385_u32)
  PHOTO_FLASH_NONE = 0_u32
  PHOTO_FLASH_FLASH = 1_u32
  PHOTO_FLASH_WITHOUTSTROBE = 5_u32
  PHOTO_FLASH_WITHSTROBE = 7_u32
  PHOTO_FLASH_FLASH_COMPULSORY = 9_u32
  PHOTO_FLASH_FLASH_COMPULSORY_NORETURNLIGHT = 13_u32
  PHOTO_FLASH_FLASH_COMPULSORY_RETURNLIGHT = 15_u32
  PHOTO_FLASH_NONE_COMPULSORY = 16_u32
  PHOTO_FLASH_NONE_AUTO = 24_u32
  PHOTO_FLASH_FLASH_AUTO = 25_u32
  PHOTO_FLASH_FLASH_AUTO_NORETURNLIGHT = 29_u32
  PHOTO_FLASH_FLASH_AUTO_RETURNLIGHT = 31_u32
  PHOTO_FLASH_NOFUNCTION = 32_u32
  PHOTO_FLASH_FLASH_REDEYE = 65_u32
  PHOTO_FLASH_FLASH_REDEYE_NORETURNLIGHT = 69_u32
  PHOTO_FLASH_FLASH_REDEYE_RETURNLIGHT = 71_u32
  PHOTO_FLASH_FLASH_COMPULSORY_REDEYE = 73_u32
  PHOTO_FLASH_FLASH_COMPULSORY_REDEYE_NORETURNLIGHT = 77_u32
  PHOTO_FLASH_FLASH_COMPULSORY_REDEYE_RETURNLIGHT = 79_u32
  PHOTO_FLASH_FLASH_AUTO_REDEYE = 89_u32
  PHOTO_FLASH_FLASH_AUTO_REDEYE_NORETURNLIGHT = 93_u32
  PHOTO_FLASH_FLASH_AUTO_REDEYE_RETURNLIGHT = 95_u32
  PKEY_Photo_FlashEnergy = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 41483_u32)
  PKEY_Photo_FlashEnergyDenominator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd7b61c70_u32, 0x6323_u16, 0x49cd_u16, StaticArray[0xa5_u8, 0xfc_u8, 0xc8_u8, 0x42_u8, 0x77_u8, 0x16_u8, 0x2c_u8, 0x97_u8]), 100_u32)
  PKEY_Photo_FlashEnergyNumerator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xfcad3d3d_u32, 0x858_u16, 0x400f_u16, StaticArray[0xaa_u8, 0xa3_u8, 0x2f_u8, 0x66_u8, 0xcc_u8, 0xe2_u8, 0xa6_u8, 0xbc_u8]), 100_u32)
  PKEY_Photo_FlashManufacturer = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xaabaf6c9_u32, 0xe0c5_u16, 0x4719_u16, StaticArray[0x85_u8, 0x85_u8, 0x57_u8, 0xb1_u8, 0x3_u8, 0xe5_u8, 0x84_u8, 0xfe_u8]), 100_u32)
  PKEY_Photo_FlashModel = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xfe83bb35_u32, 0x4d1a_u16, 0x42e2_u16, StaticArray[0x91_u8, 0x6b_u8, 0x6_u8, 0xf3_u8, 0xe1_u8, 0xaf_u8, 0x71_u8, 0x9e_u8]), 100_u32)
  PKEY_Photo_FlashText = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6b8b68f6_u32, 0x200b_u16, 0x47ea_u16, StaticArray[0x8d_u8, 0x25_u8, 0xd8_u8, 0x5_u8, 0xf_u8, 0x57_u8, 0x33_u8, 0x9f_u8]), 100_u32)
  PKEY_Photo_FNumber = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 33437_u32)
  PKEY_Photo_FNumberDenominator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xe92a2496_u32, 0x223b_u16, 0x4463_u16, StaticArray[0xa4_u8, 0xe3_u8, 0x30_u8, 0xea_u8, 0xbb_u8, 0xa7_u8, 0x9d_u8, 0x80_u8]), 100_u32)
  PKEY_Photo_FNumberNumerator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1b97738a_u32, 0xfdfc_u16, 0x462f_u16, StaticArray[0x9d_u8, 0x93_u8, 0x19_u8, 0x57_u8, 0xe0_u8, 0x8b_u8, 0xe9_u8, 0xc_u8]), 100_u32)
  PKEY_Photo_FocalLength = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 37386_u32)
  PKEY_Photo_FocalLengthDenominator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x305bc615_u32, 0xdca1_u16, 0x44a5_u16, StaticArray[0x9f_u8, 0xd4_u8, 0x10_u8, 0xc0_u8, 0xba_u8, 0x79_u8, 0x41_u8, 0x2e_u8]), 100_u32)
  PKEY_Photo_FocalLengthInFilm = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa0e74609_u32, 0xb84d_u16, 0x4f49_u16, StaticArray[0xb8_u8, 0x60_u8, 0x46_u8, 0x2b_u8, 0xd9_u8, 0x97_u8, 0x1f_u8, 0x98_u8]), 100_u32)
  PKEY_Photo_FocalLengthNumerator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x776b6b3b_u32, 0x1e3d_u16, 0x4b0c_u16, StaticArray[0x9a_u8, 0xe_u8, 0x8f_u8, 0xba_u8, 0xf2_u8, 0xa8_u8, 0x49_u8, 0x2a_u8]), 100_u32)
  PKEY_Photo_FocalPlaneXResolution = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xcfc08d97_u32, 0xc6f7_u16, 0x4484_u16, StaticArray[0x89_u8, 0xdd_u8, 0xeb_u8, 0xef_u8, 0x43_u8, 0x56_u8, 0xfe_u8, 0x76_u8]), 100_u32)
  PKEY_Photo_FocalPlaneXResolutionDenominator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x933f3f5_u32, 0x4786_u16, 0x4f46_u16, StaticArray[0xa8_u8, 0xe8_u8, 0xd6_u8, 0x4d_u8, 0xd3_u8, 0x7f_u8, 0xa5_u8, 0x21_u8]), 100_u32)
  PKEY_Photo_FocalPlaneXResolutionNumerator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xdccb10af_u32, 0xb4e2_u16, 0x4b88_u16, StaticArray[0x95_u8, 0xf9_u8, 0x3_u8, 0x1b_u8, 0x4d_u8, 0x5a_u8, 0xb4_u8, 0x90_u8]), 100_u32)
  PKEY_Photo_FocalPlaneYResolution = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4fffe4d0_u32, 0x914f_u16, 0x4ac4_u16, StaticArray[0x8d_u8, 0x6f_u8, 0xc9_u8, 0xc6_u8, 0x1d_u8, 0xe1_u8, 0x69_u8, 0xb1_u8]), 100_u32)
  PKEY_Photo_FocalPlaneYResolutionDenominator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1d6179a6_u32, 0xa876_u16, 0x4031_u16, StaticArray[0xb0_u8, 0x13_u8, 0x33_u8, 0x47_u8, 0xb2_u8, 0xb6_u8, 0x4d_u8, 0xc8_u8]), 100_u32)
  PKEY_Photo_FocalPlaneYResolutionNumerator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa2e541c5_u32, 0x4440_u16, 0x4ba8_u16, StaticArray[0x86_u8, 0x7e_u8, 0x75_u8, 0xcf_u8, 0xc0_u8, 0x68_u8, 0x28_u8, 0xcd_u8]), 100_u32)
  PKEY_Photo_GainControl = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xfa304789_u32, 0xc7_u16, 0x4d80_u16, StaticArray[0x90_u8, 0x4a_u8, 0x1e_u8, 0x4d_u8, 0xcc_u8, 0x72_u8, 0x65_u8, 0xaa_u8]), 100_u32)
  PHOTO_GAINCONTROL_NONE = 0
  PHOTO_GAINCONTROL_LOWGAINUP = 1
  PHOTO_GAINCONTROL_HIGHGAINUP = 2
  PHOTO_GAINCONTROL_LOWGAINDOWN = 3
  PHOTO_GAINCONTROL_HIGHGAINDOWN = 4
  PKEY_Photo_GainControlDenominator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x42864dfd_u32, 0x9da4_u16, 0x4f77_u16, StaticArray[0xbd_u8, 0xed_u8, 0x4a_u8, 0xad_u8, 0x7b_u8, 0x25_u8, 0x67_u8, 0x35_u8]), 100_u32)
  PKEY_Photo_GainControlNumerator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8e8ecf7c_u32, 0xb7b8_u16, 0x4eb8_u16, StaticArray[0xa6_u8, 0x3f_u8, 0xe_u8, 0xe7_u8, 0x15_u8, 0xc9_u8, 0x6f_u8, 0x9e_u8]), 100_u32)
  PKEY_Photo_GainControlText = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc06238b2_u32, 0xbf9_u16, 0x4279_u16, StaticArray[0xa7_u8, 0x23_u8, 0x25_u8, 0x85_u8, 0x67_u8, 0x15_u8, 0xcb_u8, 0x9d_u8]), 100_u32)
  PKEY_Photo_ISOSpeed = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 34855_u32)
  PKEY_Photo_LensManufacturer = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xe6ddcaf7_u32, 0x29c5_u16, 0x4f0a_u16, StaticArray[0x9a_u8, 0x68_u8, 0xd1_u8, 0x94_u8, 0x12_u8, 0xec_u8, 0x70_u8, 0x90_u8]), 100_u32)
  PKEY_Photo_LensModel = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xe1277516_u32, 0x2b5f_u16, 0x4869_u16, StaticArray[0x89_u8, 0xb1_u8, 0x2e_u8, 0x58_u8, 0x5b_u8, 0xd3_u8, 0x8b_u8, 0x7a_u8]), 100_u32)
  PKEY_Photo_LightSource = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 37384_u32)
  PHOTO_LIGHTSOURCE_UNKNOWN = 0_u32
  PHOTO_LIGHTSOURCE_DAYLIGHT = 1_u32
  PHOTO_LIGHTSOURCE_FLUORESCENT = 2_u32
  PHOTO_LIGHTSOURCE_TUNGSTEN = 3_u32
  PHOTO_LIGHTSOURCE_STANDARD_A = 17_u32
  PHOTO_LIGHTSOURCE_STANDARD_B = 18_u32
  PHOTO_LIGHTSOURCE_STANDARD_C = 19_u32
  PHOTO_LIGHTSOURCE_D55 = 20_u32
  PHOTO_LIGHTSOURCE_D65 = 21_u32
  PHOTO_LIGHTSOURCE_D75 = 22_u32
  PKEY_Photo_MakerNote = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xfa303353_u32, 0xb659_u16, 0x4052_u16, StaticArray[0x85_u8, 0xe9_u8, 0xbc_u8, 0xac_u8, 0x79_u8, 0x54_u8, 0x9b_u8, 0x84_u8]), 100_u32)
  PKEY_Photo_MakerNoteOffset = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x813f4124_u32, 0x34e6_u16, 0x4d17_u16, StaticArray[0xab_u8, 0x3e_u8, 0x6b_u8, 0x1f_u8, 0x3c_u8, 0x22_u8, 0x47_u8, 0xa1_u8]), 100_u32)
  PKEY_Photo_MaxAperture = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8f6d7c2_u32, 0xe3f2_u16, 0x44fc_u16, StaticArray[0xaf_u8, 0x1e_u8, 0x5a_u8, 0xa5_u8, 0xc8_u8, 0x1a_u8, 0x2d_u8, 0x3e_u8]), 100_u32)
  PKEY_Photo_MaxApertureDenominator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc77724d4_u32, 0x601f_u16, 0x46c5_u16, StaticArray[0x9b_u8, 0x89_u8, 0xc5_u8, 0x3f_u8, 0x93_u8, 0xbc_u8, 0xeb_u8, 0x77_u8]), 100_u32)
  PKEY_Photo_MaxApertureNumerator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc107e191_u32, 0xa459_u16, 0x44c5_u16, StaticArray[0x9a_u8, 0xe6_u8, 0xb9_u8, 0x52_u8, 0xad_u8, 0x4b_u8, 0x90_u8, 0x6d_u8]), 100_u32)
  PKEY_Photo_MeteringMode = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 37383_u32)
  PKEY_Photo_MeteringModeText = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf628fd8c_u32, 0x7ba8_u16, 0x465a_u16, StaticArray[0xa6_u8, 0x5b_u8, 0xc5_u8, 0xaa_u8, 0x79_u8, 0x26_u8, 0x3a_u8, 0x9e_u8]), 100_u32)
  PKEY_Photo_Orientation = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 274_u32)
  PKEY_Photo_OrientationText = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa9ea193c_u32, 0xc511_u16, 0x498a_u16, StaticArray[0xa0_u8, 0x6b_u8, 0x58_u8, 0xe2_u8, 0x77_u8, 0x6d_u8, 0xcc_u8, 0x28_u8]), 100_u32)
  PKEY_Photo_PeopleNames = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xe8309b6e_u32, 0x84c_u16, 0x49b4_u16, StaticArray[0xb1_u8, 0xfc_u8, 0x90_u8, 0xa8_u8, 0x3_u8, 0x31_u8, 0xb6_u8, 0x38_u8]), 100_u32)
  PKEY_Photo_PhotometricInterpretation = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x341796f1_u32, 0x1df9_u16, 0x4b1c_u16, StaticArray[0xa5_u8, 0x64_u8, 0x91_u8, 0xbd_u8, 0xef_u8, 0xa4_u8, 0x38_u8, 0x77_u8]), 100_u32)
  PKEY_Photo_PhotometricInterpretationText = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x821437d6_u32, 0x9eab_u16, 0x4765_u16, StaticArray[0xa5_u8, 0x89_u8, 0x3b_u8, 0x1c_u8, 0xbb_u8, 0xd2_u8, 0x2a_u8, 0x61_u8]), 100_u32)
  PKEY_Photo_ProgramMode = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6d217f6d_u32, 0x3f6a_u16, 0x4825_u16, StaticArray[0xb4_u8, 0x70_u8, 0x5f_u8, 0x3_u8, 0xca_u8, 0x2f_u8, 0xbe_u8, 0x9b_u8]), 100_u32)
  PHOTO_PROGRAMMODE_NOTDEFINED = 0_u32
  PHOTO_PROGRAMMODE_MANUAL = 1_u32
  PHOTO_PROGRAMMODE_NORMAL = 2_u32
  PHOTO_PROGRAMMODE_APERTURE = 3_u32
  PHOTO_PROGRAMMODE_SHUTTER = 4_u32
  PHOTO_PROGRAMMODE_CREATIVE = 5_u32
  PHOTO_PROGRAMMODE_ACTION = 6_u32
  PHOTO_PROGRAMMODE_PORTRAIT = 7_u32
  PHOTO_PROGRAMMODE_LANDSCAPE = 8_u32
  PKEY_Photo_ProgramModeText = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x7fe3aa27_u32, 0x2648_u16, 0x42f3_u16, StaticArray[0x89_u8, 0xb0_u8, 0x45_u8, 0x4e_u8, 0x5c_u8, 0xb1_u8, 0x50_u8, 0xc3_u8]), 100_u32)
  PKEY_Photo_RelatedSoundFile = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x318a6b45_u32, 0x87f_u16, 0x4dc2_u16, StaticArray[0xb8_u8, 0xcc_u8, 0x5_u8, 0x35_u8, 0x95_u8, 0x51_u8, 0xfc_u8, 0x9e_u8]), 100_u32)
  PKEY_Photo_Saturation = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x49237325_u32, 0xa95a_u16, 0x4f67_u16, StaticArray[0xb2_u8, 0x11_u8, 0x81_u8, 0x6b_u8, 0x2d_u8, 0x45_u8, 0xd2_u8, 0xe0_u8]), 100_u32)
  PHOTO_SATURATION_NORMAL = 0_u32
  PHOTO_SATURATION_LOW = 1_u32
  PHOTO_SATURATION_HIGH = 2_u32
  PKEY_Photo_SaturationText = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x61478c08_u32, 0xb600_u16, 0x4a84_u16, StaticArray[0xbb_u8, 0xe4_u8, 0xe9_u8, 0x9c_u8, 0x45_u8, 0xf0_u8, 0xa0_u8, 0x72_u8]), 100_u32)
  PKEY_Photo_Sharpness = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xfc6976db_u32, 0x8349_u16, 0x4970_u16, StaticArray[0xae_u8, 0x97_u8, 0xb3_u8, 0xc5_u8, 0x31_u8, 0x6a_u8, 0x8_u8, 0xf0_u8]), 100_u32)
  PHOTO_SHARPNESS_NORMAL = 0_u32
  PHOTO_SHARPNESS_SOFT = 1_u32
  PHOTO_SHARPNESS_HARD = 2_u32
  PKEY_Photo_SharpnessText = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x51ec3f47_u32, 0xdd50_u16, 0x421d_u16, StaticArray[0x87_u8, 0x69_u8, 0x33_u8, 0x4f_u8, 0x50_u8, 0x42_u8, 0x4b_u8, 0x1e_u8]), 100_u32)
  PKEY_Photo_ShutterSpeed = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 37377_u32)
  PKEY_Photo_ShutterSpeedDenominator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xe13d8975_u32, 0x81c7_u16, 0x4948_u16, StaticArray[0xae_u8, 0x3f_u8, 0x37_u8, 0xca_u8, 0xe1_u8, 0x1e_u8, 0x8f_u8, 0xf7_u8]), 100_u32)
  PKEY_Photo_ShutterSpeedNumerator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x16ea4042_u32, 0xd6f4_u16, 0x4bca_u16, StaticArray[0x83_u8, 0x49_u8, 0x7c_u8, 0x78_u8, 0xd3_u8, 0xf_u8, 0xb3_u8, 0x33_u8]), 100_u32)
  PKEY_Photo_SubjectDistance = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 37382_u32)
  PKEY_Photo_SubjectDistanceDenominator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc840a88_u32, 0xb043_u16, 0x466d_u16, StaticArray[0x97_u8, 0x66_u8, 0xd4_u8, 0xb2_u8, 0x6d_u8, 0xa3_u8, 0xfa_u8, 0x77_u8]), 100_u32)
  PKEY_Photo_SubjectDistanceNumerator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8af4961c_u32, 0xf526_u16, 0x43e5_u16, StaticArray[0xaa_u8, 0x81_u8, 0xdb_u8, 0x76_u8, 0x82_u8, 0x19_u8, 0x17_u8, 0x8d_u8]), 100_u32)
  PKEY_Photo_TagViewAggregate = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb812f15d_u32, 0xc2d8_u16, 0x4bbf_u16, StaticArray[0xba_u8, 0xcd_u8, 0x79_u8, 0x74_u8, 0x43_u8, 0x46_u8, 0x11_u8, 0x3f_u8]), 100_u32)
  PKEY_Photo_TranscodedForSync = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x9a8ebb75_u32, 0x6458_u16, 0x4e82_u16, StaticArray[0xba_u8, 0xcb_u8, 0x35_u8, 0xc0_u8, 0x9_u8, 0x5b_u8, 0x3_u8, 0xbb_u8]), 100_u32)
  PKEY_Photo_WhiteBalance = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xee3d3d8a_u32, 0x5381_u16, 0x4cfa_u16, StaticArray[0xb1_u8, 0x3b_u8, 0xaa_u8, 0xf6_u8, 0x6b_u8, 0x5f_u8, 0x4e_u8, 0xc9_u8]), 100_u32)
  PHOTO_WHITEBALANCE_AUTO = 0_u32
  PHOTO_WHITEBALANCE_MANUAL = 1_u32
  PKEY_Photo_WhiteBalanceText = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6336b95e_u32, 0xc7a7_u16, 0x426d_u16, StaticArray[0x86_u8, 0xfd_u8, 0x7a_u8, 0xe3_u8, 0xd3_u8, 0x9c_u8, 0x84_u8, 0xb4_u8]), 100_u32)
  PKEY_PropGroup_Advanced = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x900a403b_u32, 0x97b_u16, 0x4b95_u16, StaticArray[0x8a_u8, 0xe2_u8, 0x7_u8, 0x1f_u8, 0xda_u8, 0xee_u8, 0xb1_u8, 0x18_u8]), 100_u32)
  PKEY_PropGroup_Audio = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x2804d469_u32, 0x788f_u16, 0x48aa_u16, StaticArray[0x85_u8, 0x70_u8, 0x71_u8, 0xb9_u8, 0xc1_u8, 0x87_u8, 0xe1_u8, 0x38_u8]), 100_u32)
  PKEY_PropGroup_Calendar = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x9973d2b5_u32, 0xbfd8_u16, 0x438a_u16, StaticArray[0xba_u8, 0x94_u8, 0x53_u8, 0x49_u8, 0xb2_u8, 0x93_u8, 0x18_u8, 0x1a_u8]), 100_u32)
  PKEY_PropGroup_Camera = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xde00de32_u32, 0x547e_u16, 0x4981_u16, StaticArray[0xad_u8, 0x4b_u8, 0x54_u8, 0x2f_u8, 0x2e_u8, 0x90_u8, 0x7_u8, 0xd8_u8]), 100_u32)
  PKEY_PropGroup_Contact = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xdf975fd3_u32, 0x250a_u16, 0x4004_u16, StaticArray[0x85_u8, 0x8f_u8, 0x34_u8, 0xe2_u8, 0x9a_u8, 0x3e_u8, 0x37_u8, 0xaa_u8]), 100_u32)
  PKEY_PropGroup_Content = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd0dab0ba_u32, 0x368a_u16, 0x4050_u16, StaticArray[0xa8_u8, 0x82_u8, 0x6c_u8, 0x1_u8, 0xf_u8, 0xd1_u8, 0x9a_u8, 0x4f_u8]), 100_u32)
  PKEY_PropGroup_Description = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8969b275_u32, 0x9475_u16, 0x4e00_u16, StaticArray[0xa8_u8, 0x87_u8, 0xff_u8, 0x93_u8, 0xb8_u8, 0xb4_u8, 0x1e_u8, 0x44_u8]), 100_u32)
  PKEY_PropGroup_FileSystem = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xe3a7d2c1_u32, 0x80fc_u16, 0x4b40_u16, StaticArray[0x8f_u8, 0x34_u8, 0x30_u8, 0xea_u8, 0x11_u8, 0x1b_u8, 0xdc_u8, 0x2e_u8]), 100_u32)
  PKEY_PropGroup_General = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xcc301630_u32, 0xb192_u16, 0x4c22_u16, StaticArray[0xb3_u8, 0x72_u8, 0x9f_u8, 0x4c_u8, 0x6d_u8, 0x33_u8, 0x8e_u8, 0x7_u8]), 100_u32)
  PKEY_PropGroup_GPS = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf3713ada_u32, 0x90e3_u16, 0x4e11_u16, StaticArray[0xaa_u8, 0xe5_u8, 0xfd_u8, 0xc1_u8, 0x76_u8, 0x85_u8, 0xb9_u8, 0xbe_u8]), 100_u32)
  PKEY_PropGroup_Image = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xe3690a87_u32, 0xfa8_u16, 0x4a2a_u16, StaticArray[0x9a_u8, 0x9f_u8, 0xfc_u8, 0xe8_u8, 0x82_u8, 0x70_u8, 0x55_u8, 0xac_u8]), 100_u32)
  PKEY_PropGroup_Media = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x61872cf7_u32, 0x6b5e_u16, 0x4b4b_u16, StaticArray[0xac_u8, 0x2d_u8, 0x59_u8, 0xda_u8, 0x84_u8, 0x45_u8, 0x92_u8, 0x48_u8]), 100_u32)
  PKEY_PropGroup_MediaAdvanced = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8859a284_u32, 0xde7e_u16, 0x4642_u16, StaticArray[0x99_u8, 0xba_u8, 0xd4_u8, 0x31_u8, 0xd0_u8, 0x44_u8, 0xb1_u8, 0xec_u8]), 100_u32)
  PKEY_PropGroup_Message = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x7fd7259d_u32, 0x16b4_u16, 0x4135_u16, StaticArray[0x9f_u8, 0x97_u8, 0x7c_u8, 0x96_u8, 0xec_u8, 0xd2_u8, 0xfa_u8, 0x9e_u8]), 100_u32)
  PKEY_PropGroup_Music = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x68dd6094_u32, 0x7216_u16, 0x40f1_u16, StaticArray[0xa0_u8, 0x29_u8, 0x43_u8, 0xfe_u8, 0x71_u8, 0x27_u8, 0x4_u8, 0x3f_u8]), 100_u32)
  PKEY_PropGroup_Origin = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x2598d2fb_u32, 0x5569_u16, 0x4367_u16, StaticArray[0x95_u8, 0xdf_u8, 0x5c_u8, 0xd3_u8, 0xa1_u8, 0x77_u8, 0xe1_u8, 0xa5_u8]), 100_u32)
  PKEY_PropGroup_PhotoAdvanced = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xcb2bf5a_u32, 0x9ee7_u16, 0x4a86_u16, StaticArray[0x82_u8, 0x22_u8, 0xf0_u8, 0x1e_u8, 0x7_u8, 0xfd_u8, 0xad_u8, 0xaf_u8]), 100_u32)
  PKEY_PropGroup_RecordedTV = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xe7b33238_u32, 0x6584_u16, 0x4170_u16, StaticArray[0xa5_u8, 0xc0_u8, 0xac_u8, 0x25_u8, 0xef_u8, 0xd9_u8, 0xda_u8, 0x56_u8]), 100_u32)
  PKEY_PropGroup_Video = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xbebe0920_u32, 0x7671_u16, 0x4c54_u16, StaticArray[0xa3_u8, 0xeb_u8, 0x49_u8, 0xfd_u8, 0xdf_u8, 0xc1_u8, 0x91_u8, 0xee_u8]), 100_u32)
  PKEY_InfoTipText = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc9944a21_u32, 0xa406_u16, 0x48fe_u16, StaticArray[0x82_u8, 0x25_u8, 0xae_u8, 0xc7_u8, 0xe2_u8, 0x4c_u8, 0x21_u8, 0x1b_u8]), 17_u32)
  PKEY_PropList_ConflictPrompt = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc9944a21_u32, 0xa406_u16, 0x48fe_u16, StaticArray[0x82_u8, 0x25_u8, 0xae_u8, 0xc7_u8, 0xe2_u8, 0x4c_u8, 0x21_u8, 0x1b_u8]), 11_u32)
  PKEY_PropList_ContentViewModeForBrowse = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc9944a21_u32, 0xa406_u16, 0x48fe_u16, StaticArray[0x82_u8, 0x25_u8, 0xae_u8, 0xc7_u8, 0xe2_u8, 0x4c_u8, 0x21_u8, 0x1b_u8]), 13_u32)
  PKEY_PropList_ContentViewModeForSearch = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc9944a21_u32, 0xa406_u16, 0x48fe_u16, StaticArray[0x82_u8, 0x25_u8, 0xae_u8, 0xc7_u8, 0xe2_u8, 0x4c_u8, 0x21_u8, 0x1b_u8]), 14_u32)
  PKEY_PropList_ExtendedTileInfo = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc9944a21_u32, 0xa406_u16, 0x48fe_u16, StaticArray[0x82_u8, 0x25_u8, 0xae_u8, 0xc7_u8, 0xe2_u8, 0x4c_u8, 0x21_u8, 0x1b_u8]), 9_u32)
  PKEY_PropList_FileOperationPrompt = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc9944a21_u32, 0xa406_u16, 0x48fe_u16, StaticArray[0x82_u8, 0x25_u8, 0xae_u8, 0xc7_u8, 0xe2_u8, 0x4c_u8, 0x21_u8, 0x1b_u8]), 10_u32)
  PKEY_PropList_FullDetails = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc9944a21_u32, 0xa406_u16, 0x48fe_u16, StaticArray[0x82_u8, 0x25_u8, 0xae_u8, 0xc7_u8, 0xe2_u8, 0x4c_u8, 0x21_u8, 0x1b_u8]), 2_u32)
  PKEY_PropList_InfoTip = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc9944a21_u32, 0xa406_u16, 0x48fe_u16, StaticArray[0x82_u8, 0x25_u8, 0xae_u8, 0xc7_u8, 0xe2_u8, 0x4c_u8, 0x21_u8, 0x1b_u8]), 4_u32)
  PKEY_PropList_NonPersonal = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x49d1091f_u32, 0x82e_u16, 0x493f_u16, StaticArray[0xb2_u8, 0x3f_u8, 0xd2_u8, 0x30_u8, 0x8a_u8, 0xa9_u8, 0x66_u8, 0x8c_u8]), 100_u32)
  PKEY_PropList_PreviewDetails = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc9944a21_u32, 0xa406_u16, 0x48fe_u16, StaticArray[0x82_u8, 0x25_u8, 0xae_u8, 0xc7_u8, 0xe2_u8, 0x4c_u8, 0x21_u8, 0x1b_u8]), 8_u32)
  PKEY_PropList_PreviewTitle = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc9944a21_u32, 0xa406_u16, 0x48fe_u16, StaticArray[0x82_u8, 0x25_u8, 0xae_u8, 0xc7_u8, 0xe2_u8, 0x4c_u8, 0x21_u8, 0x1b_u8]), 6_u32)
  PKEY_PropList_QuickTip = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc9944a21_u32, 0xa406_u16, 0x48fe_u16, StaticArray[0x82_u8, 0x25_u8, 0xae_u8, 0xc7_u8, 0xe2_u8, 0x4c_u8, 0x21_u8, 0x1b_u8]), 5_u32)
  PKEY_PropList_TileInfo = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc9944a21_u32, 0xa406_u16, 0x48fe_u16, StaticArray[0x82_u8, 0x25_u8, 0xae_u8, 0xc7_u8, 0xe2_u8, 0x4c_u8, 0x21_u8, 0x1b_u8]), 3_u32)
  PKEY_PropList_XPDetailsPanel = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xf2275480_u32, 0xf782_u16, 0x4291_u16, StaticArray[0xbd_u8, 0x94_u8, 0xf1_u8, 0x36_u8, 0x93_u8, 0x51_u8, 0x3a_u8, 0xec_u8]), 0_u32)
  PKEY_RecordedTV_ChannelNumber = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6d748de2_u32, 0x8d38_u16, 0x4cc3_u16, StaticArray[0xac_u8, 0x60_u8, 0xf0_u8, 0x9_u8, 0xb0_u8, 0x57_u8, 0xc5_u8, 0x57_u8]), 7_u32)
  PKEY_RecordedTV_Credits = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6d748de2_u32, 0x8d38_u16, 0x4cc3_u16, StaticArray[0xac_u8, 0x60_u8, 0xf0_u8, 0x9_u8, 0xb0_u8, 0x57_u8, 0xc5_u8, 0x57_u8]), 4_u32)
  PKEY_RecordedTV_DateContentExpires = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6d748de2_u32, 0x8d38_u16, 0x4cc3_u16, StaticArray[0xac_u8, 0x60_u8, 0xf0_u8, 0x9_u8, 0xb0_u8, 0x57_u8, 0xc5_u8, 0x57_u8]), 15_u32)
  PKEY_RecordedTV_EpisodeName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6d748de2_u32, 0x8d38_u16, 0x4cc3_u16, StaticArray[0xac_u8, 0x60_u8, 0xf0_u8, 0x9_u8, 0xb0_u8, 0x57_u8, 0xc5_u8, 0x57_u8]), 2_u32)
  PKEY_RecordedTV_IsATSCContent = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6d748de2_u32, 0x8d38_u16, 0x4cc3_u16, StaticArray[0xac_u8, 0x60_u8, 0xf0_u8, 0x9_u8, 0xb0_u8, 0x57_u8, 0xc5_u8, 0x57_u8]), 16_u32)
  PKEY_RecordedTV_IsClosedCaptioningAvailable = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6d748de2_u32, 0x8d38_u16, 0x4cc3_u16, StaticArray[0xac_u8, 0x60_u8, 0xf0_u8, 0x9_u8, 0xb0_u8, 0x57_u8, 0xc5_u8, 0x57_u8]), 12_u32)
  PKEY_RecordedTV_IsDTVContent = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6d748de2_u32, 0x8d38_u16, 0x4cc3_u16, StaticArray[0xac_u8, 0x60_u8, 0xf0_u8, 0x9_u8, 0xb0_u8, 0x57_u8, 0xc5_u8, 0x57_u8]), 17_u32)
  PKEY_RecordedTV_IsHDContent = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6d748de2_u32, 0x8d38_u16, 0x4cc3_u16, StaticArray[0xac_u8, 0x60_u8, 0xf0_u8, 0x9_u8, 0xb0_u8, 0x57_u8, 0xc5_u8, 0x57_u8]), 18_u32)
  PKEY_RecordedTV_IsRepeatBroadcast = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6d748de2_u32, 0x8d38_u16, 0x4cc3_u16, StaticArray[0xac_u8, 0x60_u8, 0xf0_u8, 0x9_u8, 0xb0_u8, 0x57_u8, 0xc5_u8, 0x57_u8]), 13_u32)
  PKEY_RecordedTV_IsSAP = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6d748de2_u32, 0x8d38_u16, 0x4cc3_u16, StaticArray[0xac_u8, 0x60_u8, 0xf0_u8, 0x9_u8, 0xb0_u8, 0x57_u8, 0xc5_u8, 0x57_u8]), 14_u32)
  PKEY_RecordedTV_NetworkAffiliation = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x2c53c813_u32, 0xfb63_u16, 0x4e22_u16, StaticArray[0xa1_u8, 0xab_u8, 0xb_u8, 0x33_u8, 0x1c_u8, 0xa1_u8, 0xe2_u8, 0x73_u8]), 100_u32)
  PKEY_RecordedTV_OriginalBroadcastDate = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4684fe97_u32, 0x8765_u16, 0x4842_u16, StaticArray[0x9c_u8, 0x13_u8, 0xf0_u8, 0x6_u8, 0x44_u8, 0x7b_u8, 0x17_u8, 0x8c_u8]), 100_u32)
  PKEY_RecordedTV_ProgramDescription = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6d748de2_u32, 0x8d38_u16, 0x4cc3_u16, StaticArray[0xac_u8, 0x60_u8, 0xf0_u8, 0x9_u8, 0xb0_u8, 0x57_u8, 0xc5_u8, 0x57_u8]), 3_u32)
  PKEY_RecordedTV_RecordingTime = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa5477f61_u32, 0x7a82_u16, 0x4eca_u16, StaticArray[0x9d_u8, 0xde_u8, 0x98_u8, 0xb6_u8, 0x9b_u8, 0x24_u8, 0x79_u8, 0xb3_u8]), 100_u32)
  PKEY_RecordedTV_StationCallSign = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6d748de2_u32, 0x8d38_u16, 0x4cc3_u16, StaticArray[0xac_u8, 0x60_u8, 0xf0_u8, 0x9_u8, 0xb0_u8, 0x57_u8, 0xc5_u8, 0x57_u8]), 5_u32)
  PKEY_RecordedTV_StationName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1b5439e7_u32, 0xeba1_u16, 0x4af8_u16, StaticArray[0xbd_u8, 0xd7_u8, 0x7a_u8, 0xf1_u8, 0xd4_u8, 0x54_u8, 0x94_u8, 0x93_u8]), 100_u32)
  PKEY_Search_AutoSummary = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x560c36c0_u32, 0x503a_u16, 0x11cf_u16, StaticArray[0xba_u8, 0xa1_u8, 0x0_u8, 0x0_u8, 0x4c_u8, 0x75_u8, 0x2a_u8, 0x9a_u8]), 2_u32)
  PKEY_Search_ContainerHash = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xbceee283_u32, 0x35df_u16, 0x4d53_u16, StaticArray[0x82_u8, 0x6a_u8, 0xf3_u8, 0x6a_u8, 0x3e_u8, 0xef_u8, 0xc6_u8, 0xbe_u8]), 100_u32)
  PKEY_Search_Contents = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb725f130_u32, 0x47ef_u16, 0x101a_u16, StaticArray[0xa5_u8, 0xf1_u8, 0x2_u8, 0x60_u8, 0x8c_u8, 0x9e_u8, 0xeb_u8, 0xac_u8]), 19_u32)
  PKEY_Search_EntryID = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x49691c90_u32, 0x7e17_u16, 0x101a_u16, StaticArray[0xa9_u8, 0x1c_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2e_u8, 0xcd_u8, 0xa9_u8]), 5_u32)
  PKEY_Search_ExtendedProperties = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x7b03b546_u32, 0xfa4f_u16, 0x4a52_u16, StaticArray[0xa2_u8, 0xfe_u8, 0x3_u8, 0xd5_u8, 0x31_u8, 0x1e_u8, 0x58_u8, 0x65_u8]), 100_u32)
  PKEY_Search_GatherTime = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb63e350_u32, 0x9ccc_u16, 0x11d0_u16, StaticArray[0xbc_u8, 0xdb_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xcc_u8, 0xce_u8, 0x4_u8]), 8_u32)
  PKEY_Search_HitCount = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x49691c90_u32, 0x7e17_u16, 0x101a_u16, StaticArray[0xa9_u8, 0x1c_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2e_u8, 0xcd_u8, 0xa9_u8]), 4_u32)
  PKEY_Search_IsClosedDirectory = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb63e343_u32, 0x9ccc_u16, 0x11d0_u16, StaticArray[0xbc_u8, 0xdb_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xcc_u8, 0xce_u8, 0x4_u8]), 23_u32)
  PKEY_Search_IsFullyContained = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb63e343_u32, 0x9ccc_u16, 0x11d0_u16, StaticArray[0xbc_u8, 0xdb_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xcc_u8, 0xce_u8, 0x4_u8]), 24_u32)
  PKEY_Search_QueryFocusedSummary = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x560c36c0_u32, 0x503a_u16, 0x11cf_u16, StaticArray[0xba_u8, 0xa1_u8, 0x0_u8, 0x0_u8, 0x4c_u8, 0x75_u8, 0x2a_u8, 0x9a_u8]), 3_u32)
  PKEY_Search_QueryFocusedSummaryWithFallback = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x560c36c0_u32, 0x503a_u16, 0x11cf_u16, StaticArray[0xba_u8, 0xa1_u8, 0x0_u8, 0x0_u8, 0x4c_u8, 0x75_u8, 0x2a_u8, 0x9a_u8]), 4_u32)
  PKEY_Search_QueryPropertyHits = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x49691c90_u32, 0x7e17_u16, 0x101a_u16, StaticArray[0xa9_u8, 0x1c_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2e_u8, 0xcd_u8, 0xa9_u8]), 21_u32)
  PKEY_Search_Rank = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x49691c90_u32, 0x7e17_u16, 0x101a_u16, StaticArray[0xa9_u8, 0x1c_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2e_u8, 0xcd_u8, 0xa9_u8]), 3_u32)
  PKEY_Search_Store = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa06992b3_u32, 0x8caf_u16, 0x4ed7_u16, StaticArray[0xa5_u8, 0x47_u8, 0xb2_u8, 0x59_u8, 0xe3_u8, 0x2a_u8, 0xc9_u8, 0xfc_u8]), 100_u32)
  PKEY_Search_UrlToIndex = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb63e343_u32, 0x9ccc_u16, 0x11d0_u16, StaticArray[0xbc_u8, 0xdb_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xcc_u8, 0xce_u8, 0x4_u8]), 2_u32)
  PKEY_Search_UrlToIndexWithModificationTime = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb63e343_u32, 0x9ccc_u16, 0x11d0_u16, StaticArray[0xbc_u8, 0xdb_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xcc_u8, 0xce_u8, 0x4_u8]), 12_u32)
  PKEY_Supplemental_Album = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc73b141_u32, 0x39d6_u16, 0x4653_u16, StaticArray[0xa6_u8, 0x83_u8, 0xca_u8, 0xb2_u8, 0x91_u8, 0xea_u8, 0xf9_u8, 0x5b_u8]), 6_u32)
  PKEY_Supplemental_AlbumID = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc73b141_u32, 0x39d6_u16, 0x4653_u16, StaticArray[0xa6_u8, 0x83_u8, 0xca_u8, 0xb2_u8, 0x91_u8, 0xea_u8, 0xf9_u8, 0x5b_u8]), 2_u32)
  PKEY_Supplemental_Location = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc73b141_u32, 0x39d6_u16, 0x4653_u16, StaticArray[0xa6_u8, 0x83_u8, 0xca_u8, 0xb2_u8, 0x91_u8, 0xea_u8, 0xf9_u8, 0x5b_u8]), 5_u32)
  PKEY_Supplemental_Person = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc73b141_u32, 0x39d6_u16, 0x4653_u16, StaticArray[0xa6_u8, 0x83_u8, 0xca_u8, 0xb2_u8, 0x91_u8, 0xea_u8, 0xf9_u8, 0x5b_u8]), 7_u32)
  PKEY_Supplemental_ResourceId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc73b141_u32, 0x39d6_u16, 0x4653_u16, StaticArray[0xa6_u8, 0x83_u8, 0xca_u8, 0xb2_u8, 0x91_u8, 0xea_u8, 0xf9_u8, 0x5b_u8]), 3_u32)
  PKEY_Supplemental_Tag = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xc73b141_u32, 0x39d6_u16, 0x4653_u16, StaticArray[0xa6_u8, 0x83_u8, 0xca_u8, 0xb2_u8, 0x91_u8, 0xea_u8, 0xf9_u8, 0x5b_u8]), 4_u32)
  PKEY_DescriptionID = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x28636aa6_u32, 0x953d_u16, 0x11d2_u16, StaticArray[0xb5_u8, 0xd6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x18_u8, 0xd0_u8]), 2_u32)
  PKEY_InternalName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xcef7d53_u32, 0xfa64_u16, 0x11d1_u16, StaticArray[0xa2_u8, 0x3_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x1f_u8, 0xed_u8, 0xee_u8]), 5_u32)
  PKEY_LibraryLocationsCount = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x908696c7_u32, 0x8f87_u16, 0x44f2_u16, StaticArray[0x80_u8, 0xed_u8, 0xa8_u8, 0xc1_u8, 0xc6_u8, 0x89_u8, 0x45_u8, 0x75_u8]), 2_u32)
  PKEY_Link_TargetSFGAOFlagsStrings = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd6942081_u32, 0xd53b_u16, 0x443d_u16, StaticArray[0xad_u8, 0x47_u8, 0x5e_u8, 0x5_u8, 0x9d_u8, 0x9c_u8, 0xd2_u8, 0x7a_u8]), 3_u32)
  PKEY_Link_TargetUrl = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x5cbf2787_u32, 0x48cf_u16, 0x4208_u16, StaticArray[0xb9_u8, 0xe_u8, 0xee_u8, 0x5e_u8, 0x5d_u8, 0x42_u8, 0x2_u8, 0x94_u8]), 2_u32)
  PKEY_NamespaceCLSID = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x28636aa6_u32, 0x953d_u16, 0x11d2_u16, StaticArray[0xb5_u8, 0xd6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x18_u8, 0xd0_u8]), 6_u32)
  PKEY_Shell_SFGAOFlagsStrings = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd6942081_u32, 0xd53b_u16, 0x443d_u16, StaticArray[0xad_u8, 0x47_u8, 0x5e_u8, 0x5_u8, 0x9d_u8, 0x9c_u8, 0xd2_u8, 0x7a_u8]), 2_u32)
  SFGAOSTR_FILESYS = "filesys"
  SFGAOSTR_FILEANC = "fileanc"
  SFGAOSTR_STORAGEANC = "storageanc"
  SFGAOSTR_STREAM = "stream"
  SFGAOSTR_LINK = "link"
  SFGAOSTR_HIDDEN = "hidden"
  SFGAOSTR_SUPERHIDDEN = "superhidden"
  SFGAOSTR_FOLDER = "folder"
  SFGAOSTR_NONENUM = "nonenum"
  SFGAOSTR_BROWSABLE = "browsable"
  SFGAOSTR_SYSTEM = "system"
  SFGAOSTR_PLACEHOLDER = "placeholder"
  PKEY_StatusBarSelectedItemCount = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x26dc287c_u32, 0x6e3d_u16, 0x4bd3_u16, StaticArray[0xb2_u8, 0xb0_u8, 0x6a_u8, 0x26_u8, 0xba_u8, 0x2e_u8, 0x34_u8, 0x6d_u8]), 3_u32)
  PKEY_StatusBarViewItemCount = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x26dc287c_u32, 0x6e3d_u16, 0x4bd3_u16, StaticArray[0xb2_u8, 0xb0_u8, 0x6a_u8, 0x26_u8, 0xba_u8, 0x2e_u8, 0x34_u8, 0x6d_u8]), 2_u32)
  PKEY_AppUserModel_ExcludeFromShowInNewInstall = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x9f4c2855_u32, 0x9f79_u16, 0x4b39_u16, StaticArray[0xa8_u8, 0xd0_u8, 0xe1_u8, 0xd4_u8, 0x2d_u8, 0xe1_u8, 0xd5_u8, 0xf3_u8]), 8_u32)
  PKEY_AppUserModel_ID = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x9f4c2855_u32, 0x9f79_u16, 0x4b39_u16, StaticArray[0xa8_u8, 0xd0_u8, 0xe1_u8, 0xd4_u8, 0x2d_u8, 0xe1_u8, 0xd5_u8, 0xf3_u8]), 5_u32)
  PKEY_AppUserModel_IsDestListSeparator = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x9f4c2855_u32, 0x9f79_u16, 0x4b39_u16, StaticArray[0xa8_u8, 0xd0_u8, 0xe1_u8, 0xd4_u8, 0x2d_u8, 0xe1_u8, 0xd5_u8, 0xf3_u8]), 6_u32)
  PKEY_AppUserModel_IsDualMode = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x9f4c2855_u32, 0x9f79_u16, 0x4b39_u16, StaticArray[0xa8_u8, 0xd0_u8, 0xe1_u8, 0xd4_u8, 0x2d_u8, 0xe1_u8, 0xd5_u8, 0xf3_u8]), 11_u32)
  PKEY_AppUserModel_PreventPinning = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x9f4c2855_u32, 0x9f79_u16, 0x4b39_u16, StaticArray[0xa8_u8, 0xd0_u8, 0xe1_u8, 0xd4_u8, 0x2d_u8, 0xe1_u8, 0xd5_u8, 0xf3_u8]), 9_u32)
  PKEY_AppUserModel_RelaunchCommand = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x9f4c2855_u32, 0x9f79_u16, 0x4b39_u16, StaticArray[0xa8_u8, 0xd0_u8, 0xe1_u8, 0xd4_u8, 0x2d_u8, 0xe1_u8, 0xd5_u8, 0xf3_u8]), 2_u32)
  PKEY_AppUserModel_RelaunchDisplayNameResource = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x9f4c2855_u32, 0x9f79_u16, 0x4b39_u16, StaticArray[0xa8_u8, 0xd0_u8, 0xe1_u8, 0xd4_u8, 0x2d_u8, 0xe1_u8, 0xd5_u8, 0xf3_u8]), 4_u32)
  PKEY_AppUserModel_RelaunchIconResource = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x9f4c2855_u32, 0x9f79_u16, 0x4b39_u16, StaticArray[0xa8_u8, 0xd0_u8, 0xe1_u8, 0xd4_u8, 0x2d_u8, 0xe1_u8, 0xd5_u8, 0xf3_u8]), 3_u32)
  PKEY_AppUserModel_SettingsCommand = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x9f4c2855_u32, 0x9f79_u16, 0x4b39_u16, StaticArray[0xa8_u8, 0xd0_u8, 0xe1_u8, 0xd4_u8, 0x2d_u8, 0xe1_u8, 0xd5_u8, 0xf3_u8]), 38_u32)
  PKEY_AppUserModel_StartPinOption = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x9f4c2855_u32, 0x9f79_u16, 0x4b39_u16, StaticArray[0xa8_u8, 0xd0_u8, 0xe1_u8, 0xd4_u8, 0x2d_u8, 0xe1_u8, 0xd5_u8, 0xf3_u8]), 12_u32)
  APPUSERMODEL_STARTPINOPTION_DEFAULT = 0_u32
  APPUSERMODEL_STARTPINOPTION_NOPINONINSTALL = 1_u32
  APPUSERMODEL_STARTPINOPTION_USERPINNED = 2_u32
  PKEY_AppUserModel_ToastActivatorCLSID = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x9f4c2855_u32, 0x9f79_u16, 0x4b39_u16, StaticArray[0xa8_u8, 0xd0_u8, 0xe1_u8, 0xd4_u8, 0x2d_u8, 0xe1_u8, 0xd5_u8, 0xf3_u8]), 26_u32)
  PKEY_AppUserModel_UninstallCommand = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x9f4c2855_u32, 0x9f79_u16, 0x4b39_u16, StaticArray[0xa8_u8, 0xd0_u8, 0xe1_u8, 0xd4_u8, 0x2d_u8, 0xe1_u8, 0xd5_u8, 0xf3_u8]), 37_u32)
  PKEY_AppUserModel_VisualElementsManifestHintPath = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x9f4c2855_u32, 0x9f79_u16, 0x4b39_u16, StaticArray[0xa8_u8, 0xd0_u8, 0xe1_u8, 0xd4_u8, 0x2d_u8, 0xe1_u8, 0xd5_u8, 0xf3_u8]), 31_u32)
  PKEY_EdgeGesture_DisableTouchWhenFullscreen = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x32ce38b2_u32, 0x2c9a_u16, 0x41b1_u16, StaticArray[0x9b_u8, 0xc5_u8, 0xb3_u8, 0x78_u8, 0x43_u8, 0x94_u8, 0xaa_u8, 0x44_u8]), 2_u32)
  PKEY_Software_DateLastUsed = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x841e4f90_u32, 0xff59_u16, 0x4d16_u16, StaticArray[0x89_u8, 0x47_u8, 0xe8_u8, 0x1b_u8, 0xbf_u8, 0xfa_u8, 0xb3_u8, 0x6d_u8]), 16_u32)
  PKEY_Software_ProductName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xcef7d53_u32, 0xfa64_u16, 0x11d1_u16, StaticArray[0xa2_u8, 0x3_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x1f_u8, 0xed_u8, 0xee_u8]), 7_u32)
  PKEY_Sync_Comments = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x7bd5533e_u32, 0xaf15_u16, 0x44db_u16, StaticArray[0xb8_u8, 0xc8_u8, 0xbd_u8, 0x66_u8, 0x24_u8, 0xe1_u8, 0xd0_u8, 0x32_u8]), 13_u32)
  PKEY_Sync_ConflictDescription = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xce50c159_u32, 0x2fb8_u16, 0x41fd_u16, StaticArray[0xbe_u8, 0x68_u8, 0xd3_u8, 0xe0_u8, 0x42_u8, 0xe2_u8, 0x74_u8, 0xbc_u8]), 4_u32)
  PKEY_Sync_ConflictFirstLocation = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xce50c159_u32, 0x2fb8_u16, 0x41fd_u16, StaticArray[0xbe_u8, 0x68_u8, 0xd3_u8, 0xe0_u8, 0x42_u8, 0xe2_u8, 0x74_u8, 0xbc_u8]), 6_u32)
  PKEY_Sync_ConflictSecondLocation = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xce50c159_u32, 0x2fb8_u16, 0x41fd_u16, StaticArray[0xbe_u8, 0x68_u8, 0xd3_u8, 0xe0_u8, 0x42_u8, 0xe2_u8, 0x74_u8, 0xbc_u8]), 7_u32)
  PKEY_Sync_HandlerCollectionID = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x7bd5533e_u32, 0xaf15_u16, 0x44db_u16, StaticArray[0xb8_u8, 0xc8_u8, 0xbd_u8, 0x66_u8, 0x24_u8, 0xe1_u8, 0xd0_u8, 0x32_u8]), 2_u32)
  PKEY_Sync_HandlerID = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x7bd5533e_u32, 0xaf15_u16, 0x44db_u16, StaticArray[0xb8_u8, 0xc8_u8, 0xbd_u8, 0x66_u8, 0x24_u8, 0xe1_u8, 0xd0_u8, 0x32_u8]), 3_u32)
  PKEY_Sync_HandlerName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xce50c159_u32, 0x2fb8_u16, 0x41fd_u16, StaticArray[0xbe_u8, 0x68_u8, 0xd3_u8, 0xe0_u8, 0x42_u8, 0xe2_u8, 0x74_u8, 0xbc_u8]), 2_u32)
  PKEY_Sync_HandlerType = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x7bd5533e_u32, 0xaf15_u16, 0x44db_u16, StaticArray[0xb8_u8, 0xc8_u8, 0xbd_u8, 0x66_u8, 0x24_u8, 0xe1_u8, 0xd0_u8, 0x32_u8]), 8_u32)
  SYNC_HANDLERTYPE_OTHER = 0_u32
  SYNC_HANDLERTYPE_PROGRAMS = 1_u32
  SYNC_HANDLERTYPE_DEVICES = 2_u32
  SYNC_HANDLERTYPE_FOLDERS = 3_u32
  SYNC_HANDLERTYPE_WEBSERVICES = 4_u32
  SYNC_HANDLERTYPE_COMPUTERS = 5_u32
  PKEY_Sync_HandlerTypeLabel = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x7bd5533e_u32, 0xaf15_u16, 0x44db_u16, StaticArray[0xb8_u8, 0xc8_u8, 0xbd_u8, 0x66_u8, 0x24_u8, 0xe1_u8, 0xd0_u8, 0x32_u8]), 9_u32)
  PKEY_Sync_ItemID = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x7bd5533e_u32, 0xaf15_u16, 0x44db_u16, StaticArray[0xb8_u8, 0xc8_u8, 0xbd_u8, 0x66_u8, 0x24_u8, 0xe1_u8, 0xd0_u8, 0x32_u8]), 6_u32)
  PKEY_Sync_ItemName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xce50c159_u32, 0x2fb8_u16, 0x41fd_u16, StaticArray[0xbe_u8, 0x68_u8, 0xd3_u8, 0xe0_u8, 0x42_u8, 0xe2_u8, 0x74_u8, 0xbc_u8]), 3_u32)
  PKEY_Sync_ProgressPercentage = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x7bd5533e_u32, 0xaf15_u16, 0x44db_u16, StaticArray[0xb8_u8, 0xc8_u8, 0xbd_u8, 0x66_u8, 0x24_u8, 0xe1_u8, 0xd0_u8, 0x32_u8]), 23_u32)
  PKEY_Sync_State = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x7bd5533e_u32, 0xaf15_u16, 0x44db_u16, StaticArray[0xb8_u8, 0xc8_u8, 0xbd_u8, 0x66_u8, 0x24_u8, 0xe1_u8, 0xd0_u8, 0x32_u8]), 24_u32)
  SYNC_STATE_NOTSETUP = 0_u32
  SYNC_STATE_SYNCNOTRUN = 1_u32
  SYNC_STATE_IDLE = 2_u32
  SYNC_STATE_ERROR = 3_u32
  SYNC_STATE_PENDING = 4_u32
  SYNC_STATE_SYNCING = 5_u32
  PKEY_Sync_Status = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x7bd5533e_u32, 0xaf15_u16, 0x44db_u16, StaticArray[0xb8_u8, 0xc8_u8, 0xbd_u8, 0x66_u8, 0x24_u8, 0xe1_u8, 0xd0_u8, 0x32_u8]), 10_u32)
  PKEY_Task_BillingInformation = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd37d52c6_u32, 0x261c_u16, 0x4303_u16, StaticArray[0x82_u8, 0xb3_u8, 0x8_u8, 0xb9_u8, 0x26_u8, 0xac_u8, 0x6f_u8, 0x12_u8]), 100_u32)
  PKEY_Task_CompletionStatus = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x84d8a0a_u32, 0xe6d5_u16, 0x40de_u16, StaticArray[0xbf_u8, 0x1f_u8, 0xc8_u8, 0x82_u8, 0xe_u8, 0x7c_u8, 0x87_u8, 0x7c_u8]), 100_u32)
  PKEY_Task_Owner = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8c7cc5f_u32, 0x60f2_u16, 0x4494_u16, StaticArray[0xad_u8, 0x75_u8, 0x55_u8, 0xe3_u8, 0xe0_u8, 0xb5_u8, 0xad_u8, 0xd0_u8]), 100_u32)
  PKEY_Video_Compression = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440491_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 10_u32)
  PKEY_Video_Director = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 20_u32)
  PKEY_Video_EncodingBitrate = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440491_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 8_u32)
  PKEY_Video_FourCC = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440491_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 44_u32)
  PKEY_Video_FrameHeight = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440491_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 4_u32)
  PKEY_Video_FrameRate = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440491_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 6_u32)
  PKEY_Video_FrameWidth = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440491_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 3_u32)
  PKEY_Video_HorizontalAspectRatio = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440491_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 42_u32)
  PKEY_Video_IsSpherical = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440491_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 100_u32)
  PKEY_Video_IsStereo = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440491_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 98_u32)
  PKEY_Video_Orientation = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440491_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 99_u32)
  PKEY_Video_SampleSize = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440491_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 9_u32)
  PKEY_Video_StreamName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440491_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 2_u32)
  PKEY_Video_StreamNumber = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440491_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 11_u32)
  PKEY_Video_TotalBitrate = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440491_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 43_u32)
  PKEY_Video_TranscodedForSync = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440491_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 46_u32)
  PKEY_Video_VerticalAspectRatio = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64440491_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 45_u32)
  PKEY_Volume_FileSystem = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x9b174b35_u32, 0x40ff_u16, 0x11d2_u16, StaticArray[0xa2_u8, 0x7e_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc3_u8, 0x8_u8, 0x71_u8]), 4_u32)
  PKEY_Volume_IsMappedDrive = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x149c0b69_u32, 0x2c2d_u16, 0x48fc_u16, StaticArray[0x80_u8, 0x8f_u8, 0xd3_u8, 0x18_u8, 0xd7_u8, 0x8c_u8, 0x46_u8, 0x36_u8]), 2_u32)
  PKEY_Volume_IsRoot = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x9b174b35_u32, 0x40ff_u16, 0x11d2_u16, StaticArray[0xa2_u8, 0x7e_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc3_u8, 0x8_u8, 0x71_u8]), 10_u32)
  ACT_AUTHORIZE_ON_RESUME = 1_u32
  ACT_AUTHORIZE_ON_SESSION_UNLOCK = 2_u32
  ACT_UNAUTHORIZE_ON_SUSPEND = 1_u32
  ACT_UNAUTHORIZE_ON_SESSION_LOCK = 2_u32
  ES_RESERVED_COM_ERROR_START = 0_u32
  ES_RESERVED_COM_ERROR_END = 511_u32
  ES_GENERAL_ERROR_START = 512_u32
  ES_GENERAL_ERROR_END = 1023_u32
  ES_AUTHN_ERROR_START = 1024_u32
  ES_AUTHN_ERROR_END = 1279_u32
  ES_RESERVED_SILO_ERROR_START = 1280_u32
  ES_RESERVED_SILO_ERROR_END = 4095_u32
  ES_PW_SILO_ERROR_START = 4352_u32
  ES_PW_SILO_ERROR_END = 4607_u32
  ES_RESERVED_SILO_SPECIFIC_ERROR_START = 4608_u32
  ES_RESERVED_SILO_SPECIFIC_ERROR_END = 49151_u32
  ES_VENDOR_ERROR_START = 49152_u32
  ES_VENDOR_ERROR_END = 65535_u32
  FACILITY_ENHANCED_STORAGE = 4_u32

  CLSID_EnumEnhancedStorageACT = LibC::GUID.new(0xfe841493_u32, 0x835c_u16, 0x4fa3_u16, StaticArray[0xb6_u8, 0xcc_u8, 0xb4_u8, 0xb2_u8, 0xd4_u8, 0x71_u8, 0x98_u8, 0x48_u8])

  CLSID_EnhancedStorageACT = LibC::GUID.new(0xaf076a15_u32, 0x2ece_u16, 0x4ad4_u16, StaticArray[0xbb_u8, 0x21_u8, 0x29_u8, 0xf0_u8, 0x40_u8, 0xe1_u8, 0x76_u8, 0xd8_u8])

  CLSID_EnhancedStorageSilo = LibC::GUID.new(0xcb25220c_u32, 0x76c7_u16, 0x4fee_u16, StaticArray[0x84_u8, 0x2b_u8, 0xf3_u8, 0x38_u8, 0x3c_u8, 0xd0_u8, 0x22_u8, 0xbc_u8])

  CLSID_EnhancedStorageSiloAction = LibC::GUID.new(0x886d29dd_u32, 0xb506_u16, 0x466b_u16, StaticArray[0x9f_u8, 0xbf_u8, 0xb4_u8, 0x4f_u8, 0xf3_u8, 0x83_u8, 0xfb_u8, 0x3f_u8])

  enum ACT_AUTHORIZATION_STATE_VALUE
    ACT_UNAUTHORIZED = 0_i32
    ACT_AUTHORIZED = 1_i32
  end

  @[Extern]
  struct ENHANCED_STORAGE_PASSWORD_SILO_INFORMATION
    property current_admin_failures : UInt8
    property current_user_failures : UInt8
    property total_user_authentication_count : UInt32
    property total_admin_authentication_count : UInt32
    property fips_compliant : Win32cr::Foundation::BOOL
    property security_id_available : Win32cr::Foundation::BOOL
    property initialize_in_progress : Win32cr::Foundation::BOOL
    property itms_armed : Win32cr::Foundation::BOOL
    property itms_armable : Win32cr::Foundation::BOOL
    property user_created : Win32cr::Foundation::BOOL
    property reset_on_por_default : Win32cr::Foundation::BOOL
    property reset_on_por_current : Win32cr::Foundation::BOOL
    property max_admin_failures : UInt8
    property max_user_failures : UInt8
    property time_to_complete_initialization : UInt32
    property time_remaining_to_complete_initialization : UInt32
    property min_time_to_authenticate : UInt32
    property max_admin_password_size : UInt8
    property min_admin_password_size : UInt8
    property max_admin_hint_size : UInt8
    property max_user_password_size : UInt8
    property min_user_password_size : UInt8
    property max_user_hint_size : UInt8
    property max_user_name_size : UInt8
    property max_silo_name_size : UInt8
    property max_challenge_size : UInt16
    def initialize(@current_admin_failures : UInt8, @current_user_failures : UInt8, @total_user_authentication_count : UInt32, @total_admin_authentication_count : UInt32, @fips_compliant : Win32cr::Foundation::BOOL, @security_id_available : Win32cr::Foundation::BOOL, @initialize_in_progress : Win32cr::Foundation::BOOL, @itms_armed : Win32cr::Foundation::BOOL, @itms_armable : Win32cr::Foundation::BOOL, @user_created : Win32cr::Foundation::BOOL, @reset_on_por_default : Win32cr::Foundation::BOOL, @reset_on_por_current : Win32cr::Foundation::BOOL, @max_admin_failures : UInt8, @max_user_failures : UInt8, @time_to_complete_initialization : UInt32, @time_remaining_to_complete_initialization : UInt32, @min_time_to_authenticate : UInt32, @max_admin_password_size : UInt8, @min_admin_password_size : UInt8, @max_admin_hint_size : UInt8, @max_user_password_size : UInt8, @min_user_password_size : UInt8, @max_user_hint_size : UInt8, @max_user_name_size : UInt8, @max_silo_name_size : UInt8, @max_challenge_size : UInt16)
    end
  end

  @[Extern]
  struct ACT_AUTHORIZATION_STATE
    property ulState : UInt32
    def initialize(@ulState : UInt32)
    end
  end

  @[Extern]
  struct SILO_INFO
    property ulSTID : UInt32
    property specification_major : UInt8
    property specification_minor : UInt8
    property implementation_major : UInt8
    property implementation_minor : UInt8
    property type__ : UInt8
    property capabilities : UInt8
    def initialize(@ulSTID : UInt32, @specification_major : UInt8, @specification_minor : UInt8, @implementation_major : UInt8, @implementation_minor : UInt8, @type__ : UInt8, @capabilities : UInt8)
    end
  end

  @[Extern]
  record IEnumEnhancedStorageACTVtbl,
    query_interface : Proc(IEnumEnhancedStorageACT*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumEnhancedStorageACT*, UInt32),
    release : Proc(IEnumEnhancedStorageACT*, UInt32),
    get_ac_ts : Proc(IEnumEnhancedStorageACT*, Void***, UInt32*, Win32cr::Foundation::HRESULT),
    get_matching_act : Proc(IEnumEnhancedStorageACT*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumEnhancedStorageACT, lpVtbl : IEnumEnhancedStorageACTVtbl* do
    GUID = LibC::GUID.new(0x9b224bd_u32, 0x1335_u16, 0x4631_u16, StaticArray[0xa7_u8, 0xff_u8, 0xcf_u8, 0xd3_u8, 0xa9_u8, 0x26_u8, 0x46_u8, 0xd7_u8])
    def query_interface(this : IEnumEnhancedStorageACT*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumEnhancedStorageACT*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumEnhancedStorageACT*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_ac_ts(this : IEnumEnhancedStorageACT*, pppIEnhancedStorageACTs : Void***, pcEnhancedStorageACTs : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ac_ts.call(this, pppIEnhancedStorageACTs, pcEnhancedStorageACTs)
    end
    def get_matching_act(this : IEnumEnhancedStorageACT*, szVolume : Win32cr::Foundation::PWSTR, ppIEnhancedStorageACT : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_matching_act.call(this, szVolume, ppIEnhancedStorageACT)
    end

  end

  @[Extern]
  record IEnhancedStorageACTVtbl,
    query_interface : Proc(IEnhancedStorageACT*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnhancedStorageACT*, UInt32),
    release : Proc(IEnhancedStorageACT*, UInt32),
    authorize : Proc(IEnhancedStorageACT*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    unauthorize : Proc(IEnhancedStorageACT*, Win32cr::Foundation::HRESULT),
    get_authorization_state : Proc(IEnhancedStorageACT*, Win32cr::Storage::EnhancedStorage::ACT_AUTHORIZATION_STATE*, Win32cr::Foundation::HRESULT),
    get_matching_volume : Proc(IEnhancedStorageACT*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_unique_identity : Proc(IEnhancedStorageACT*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_silos : Proc(IEnhancedStorageACT*, Void***, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnhancedStorageACT, lpVtbl : IEnhancedStorageACTVtbl* do
    GUID = LibC::GUID.new(0x6e7781f4_u32, 0xe0f2_u16, 0x4239_u16, StaticArray[0xb9_u8, 0x76_u8, 0xa0_u8, 0x1a_u8, 0xba_u8, 0xb5_u8, 0x29_u8, 0x30_u8])
    def query_interface(this : IEnhancedStorageACT*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnhancedStorageACT*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnhancedStorageACT*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def authorize(this : IEnhancedStorageACT*, hwndParent : UInt32, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.authorize.call(this, hwndParent, dwFlags)
    end
    def unauthorize(this : IEnhancedStorageACT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unauthorize.call(this)
    end
    def get_authorization_state(this : IEnhancedStorageACT*, pState : Win32cr::Storage::EnhancedStorage::ACT_AUTHORIZATION_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_authorization_state.call(this, pState)
    end
    def get_matching_volume(this : IEnhancedStorageACT*, ppwszVolume : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_matching_volume.call(this, ppwszVolume)
    end
    def get_unique_identity(this : IEnhancedStorageACT*, ppwszIdentity : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_unique_identity.call(this, ppwszIdentity)
    end
    def get_silos(this : IEnhancedStorageACT*, pppIEnhancedStorageSilos : Void***, pcEnhancedStorageSilos : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_silos.call(this, pppIEnhancedStorageSilos, pcEnhancedStorageSilos)
    end

  end

  @[Extern]
  record IEnhancedStorageACT2Vtbl,
    query_interface : Proc(IEnhancedStorageACT2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnhancedStorageACT2*, UInt32),
    release : Proc(IEnhancedStorageACT2*, UInt32),
    authorize : Proc(IEnhancedStorageACT2*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    unauthorize : Proc(IEnhancedStorageACT2*, Win32cr::Foundation::HRESULT),
    get_authorization_state : Proc(IEnhancedStorageACT2*, Win32cr::Storage::EnhancedStorage::ACT_AUTHORIZATION_STATE*, Win32cr::Foundation::HRESULT),
    get_matching_volume : Proc(IEnhancedStorageACT2*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_unique_identity : Proc(IEnhancedStorageACT2*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_silos : Proc(IEnhancedStorageACT2*, Void***, UInt32*, Win32cr::Foundation::HRESULT),
    get_device_name : Proc(IEnhancedStorageACT2*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    is_device_removable : Proc(IEnhancedStorageACT2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnhancedStorageACT2, lpVtbl : IEnhancedStorageACT2Vtbl* do
    GUID = LibC::GUID.new(0x4da57d2e_u32, 0x8eb3_u16, 0x41f6_u16, StaticArray[0xa0_u8, 0x7e_u8, 0x98_u8, 0xb5_u8, 0x2b_u8, 0x88_u8, 0x24_u8, 0x2b_u8])
    def query_interface(this : IEnhancedStorageACT2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnhancedStorageACT2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnhancedStorageACT2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def authorize(this : IEnhancedStorageACT2*, hwndParent : UInt32, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.authorize.call(this, hwndParent, dwFlags)
    end
    def unauthorize(this : IEnhancedStorageACT2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unauthorize.call(this)
    end
    def get_authorization_state(this : IEnhancedStorageACT2*, pState : Win32cr::Storage::EnhancedStorage::ACT_AUTHORIZATION_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_authorization_state.call(this, pState)
    end
    def get_matching_volume(this : IEnhancedStorageACT2*, ppwszVolume : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_matching_volume.call(this, ppwszVolume)
    end
    def get_unique_identity(this : IEnhancedStorageACT2*, ppwszIdentity : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_unique_identity.call(this, ppwszIdentity)
    end
    def get_silos(this : IEnhancedStorageACT2*, pppIEnhancedStorageSilos : Void***, pcEnhancedStorageSilos : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_silos.call(this, pppIEnhancedStorageSilos, pcEnhancedStorageSilos)
    end
    def get_device_name(this : IEnhancedStorageACT2*, ppwszDeviceName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_name.call(this, ppwszDeviceName)
    end
    def is_device_removable(this : IEnhancedStorageACT2*, pIsDeviceRemovable : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_device_removable.call(this, pIsDeviceRemovable)
    end

  end

  @[Extern]
  record IEnhancedStorageACT3Vtbl,
    query_interface : Proc(IEnhancedStorageACT3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnhancedStorageACT3*, UInt32),
    release : Proc(IEnhancedStorageACT3*, UInt32),
    authorize : Proc(IEnhancedStorageACT3*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    unauthorize : Proc(IEnhancedStorageACT3*, Win32cr::Foundation::HRESULT),
    get_authorization_state : Proc(IEnhancedStorageACT3*, Win32cr::Storage::EnhancedStorage::ACT_AUTHORIZATION_STATE*, Win32cr::Foundation::HRESULT),
    get_matching_volume : Proc(IEnhancedStorageACT3*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_unique_identity : Proc(IEnhancedStorageACT3*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_silos : Proc(IEnhancedStorageACT3*, Void***, UInt32*, Win32cr::Foundation::HRESULT),
    get_device_name : Proc(IEnhancedStorageACT3*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    is_device_removable : Proc(IEnhancedStorageACT3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    unauthorize_ex : Proc(IEnhancedStorageACT3*, UInt32, Win32cr::Foundation::HRESULT),
    is_queue_frozen : Proc(IEnhancedStorageACT3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_shell_ext_support : Proc(IEnhancedStorageACT3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnhancedStorageACT3, lpVtbl : IEnhancedStorageACT3Vtbl* do
    GUID = LibC::GUID.new(0x22150a1_u32, 0x113d_u16, 0x11df_u16, StaticArray[0xbb_u8, 0x61_u8, 0x0_u8, 0x1a_u8, 0xa0_u8, 0x1b_u8, 0xbc_u8, 0x58_u8])
    def query_interface(this : IEnhancedStorageACT3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnhancedStorageACT3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnhancedStorageACT3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def authorize(this : IEnhancedStorageACT3*, hwndParent : UInt32, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.authorize.call(this, hwndParent, dwFlags)
    end
    def unauthorize(this : IEnhancedStorageACT3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unauthorize.call(this)
    end
    def get_authorization_state(this : IEnhancedStorageACT3*, pState : Win32cr::Storage::EnhancedStorage::ACT_AUTHORIZATION_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_authorization_state.call(this, pState)
    end
    def get_matching_volume(this : IEnhancedStorageACT3*, ppwszVolume : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_matching_volume.call(this, ppwszVolume)
    end
    def get_unique_identity(this : IEnhancedStorageACT3*, ppwszIdentity : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_unique_identity.call(this, ppwszIdentity)
    end
    def get_silos(this : IEnhancedStorageACT3*, pppIEnhancedStorageSilos : Void***, pcEnhancedStorageSilos : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_silos.call(this, pppIEnhancedStorageSilos, pcEnhancedStorageSilos)
    end
    def get_device_name(this : IEnhancedStorageACT3*, ppwszDeviceName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_name.call(this, ppwszDeviceName)
    end
    def is_device_removable(this : IEnhancedStorageACT3*, pIsDeviceRemovable : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_device_removable.call(this, pIsDeviceRemovable)
    end
    def unauthorize_ex(this : IEnhancedStorageACT3*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unauthorize_ex.call(this, dwFlags)
    end
    def is_queue_frozen(this : IEnhancedStorageACT3*, pIsQueueFrozen : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_queue_frozen.call(this, pIsQueueFrozen)
    end
    def get_shell_ext_support(this : IEnhancedStorageACT3*, pShellExtSupport : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_shell_ext_support.call(this, pShellExtSupport)
    end

  end

  @[Extern]
  record IEnhancedStorageSiloVtbl,
    query_interface : Proc(IEnhancedStorageSilo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnhancedStorageSilo*, UInt32),
    release : Proc(IEnhancedStorageSilo*, UInt32),
    get_info : Proc(IEnhancedStorageSilo*, Win32cr::Storage::EnhancedStorage::SILO_INFO*, Win32cr::Foundation::HRESULT),
    get_actions : Proc(IEnhancedStorageSilo*, Void***, UInt32*, Win32cr::Foundation::HRESULT),
    send_command : Proc(IEnhancedStorageSilo*, UInt8, UInt8*, UInt32, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    get_portable_device : Proc(IEnhancedStorageSilo*, Void**, Win32cr::Foundation::HRESULT),
    get_device_path : Proc(IEnhancedStorageSilo*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnhancedStorageSilo, lpVtbl : IEnhancedStorageSiloVtbl* do
    GUID = LibC::GUID.new(0x5aef78c6_u32, 0x2242_u16, 0x4703_u16, StaticArray[0xbf_u8, 0x49_u8, 0x44_u8, 0xb2_u8, 0x93_u8, 0x57_u8, 0xa3_u8, 0x59_u8])
    def query_interface(this : IEnhancedStorageSilo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnhancedStorageSilo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnhancedStorageSilo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_info(this : IEnhancedStorageSilo*, pSiloInfo : Win32cr::Storage::EnhancedStorage::SILO_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_info.call(this, pSiloInfo)
    end
    def get_actions(this : IEnhancedStorageSilo*, pppIEnhancedStorageSiloActions : Void***, pcEnhancedStorageSiloActions : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_actions.call(this, pppIEnhancedStorageSiloActions, pcEnhancedStorageSiloActions)
    end
    def send_command(this : IEnhancedStorageSilo*, command : UInt8, pbCommandBuffer : UInt8*, cbCommandBuffer : UInt32, pbResponseBuffer : UInt8*, pcbResponseBuffer : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_command.call(this, command, pbCommandBuffer, cbCommandBuffer, pbResponseBuffer, pcbResponseBuffer)
    end
    def get_portable_device(this : IEnhancedStorageSilo*, ppIPortableDevice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_portable_device.call(this, ppIPortableDevice)
    end
    def get_device_path(this : IEnhancedStorageSilo*, ppwszSiloDevicePath : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_path.call(this, ppwszSiloDevicePath)
    end

  end

  @[Extern]
  record IEnhancedStorageSiloActionVtbl,
    query_interface : Proc(IEnhancedStorageSiloAction*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnhancedStorageSiloAction*, UInt32),
    release : Proc(IEnhancedStorageSiloAction*, UInt32),
    get_name : Proc(IEnhancedStorageSiloAction*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_description : Proc(IEnhancedStorageSiloAction*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    invoke : Proc(IEnhancedStorageSiloAction*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnhancedStorageSiloAction, lpVtbl : IEnhancedStorageSiloActionVtbl* do
    GUID = LibC::GUID.new(0xb6f7f311_u32, 0x206f_u16, 0x4ff8_u16, StaticArray[0x9c_u8, 0x4b_u8, 0x27_u8, 0xef_u8, 0xee_u8, 0x77_u8, 0xa8_u8, 0x6f_u8])
    def query_interface(this : IEnhancedStorageSiloAction*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnhancedStorageSiloAction*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnhancedStorageSiloAction*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_name(this : IEnhancedStorageSiloAction*, ppwszActionName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, ppwszActionName)
    end
    def get_description(this : IEnhancedStorageSiloAction*, ppwszActionDescription : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_description.call(this, ppwszActionDescription)
    end
    def invoke(this : IEnhancedStorageSiloAction*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke.call(this)
    end

  end

end