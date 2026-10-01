require "./../foundation.cr"
require "./../system/com.cr"
require "./../devices/portable_devices.cr"

module Win32cr::Storage::EnhancedStorage
  extend self
  GUID_DEVINTERFACE_ENHANCED_STORAGE_SILO = LibC::GUID.new(0x3897f6a4_u32, 0xfd35_u16, 0x4bc8_u16, StaticArray[0xa0_u8, 0xb7_u8, 0x5d_u8, 0xbb_u8, 0xa3_u8, 0x6a_u8, 0xda_u8, 0xfa_u8])
  WPD_CATEGORY_ENHANCED_STORAGE = LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8])
  ENHANCED_STORAGE_COMMAND_SILO_IS_AUTHENTICATION_SILO = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 6_u32)
  ENHANCED_STORAGE_COMMAND_SILO_GET_AUTHENTICATION_STATE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 7_u32)
  ENHANCED_STORAGE_COMMAND_SILO_ENUMERATE_SILOS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 11_u32)
  ENHANCED_STORAGE_COMMAND_CERT_HOST_CERTIFICATE_AUTHENTICATION = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 101_u32)
  ENHANCED_STORAGE_COMMAND_CERT_DEVICE_CERTIFICATE_AUTHENTICATION = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 102_u32)
  ENHANCED_STORAGE_COMMAND_CERT_ADMIN_CERTIFICATE_AUTHENTICATION = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 103_u32)
  ENHANCED_STORAGE_COMMAND_CERT_INITIALIZE_TO_MANUFACTURER_STATE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 104_u32)
  ENHANCED_STORAGE_COMMAND_CERT_GET_CERTIFICATE_COUNT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 105_u32)
  ENHANCED_STORAGE_COMMAND_CERT_GET_CERTIFICATE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 106_u32)
  ENHANCED_STORAGE_COMMAND_CERT_SET_CERTIFICATE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 107_u32)
  ENHANCED_STORAGE_COMMAND_CERT_CREATE_CERTIFICATE_REQUEST = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 108_u32)
  ENHANCED_STORAGE_COMMAND_CERT_UNAUTHENTICATION = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 110_u32)
  ENHANCED_STORAGE_COMMAND_CERT_GET_SILO_CAPABILITY = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 111_u32)
  ENHANCED_STORAGE_COMMAND_CERT_GET_SILO_CAPABILITIES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 112_u32)
  ENHANCED_STORAGE_COMMAND_CERT_GET_ACT_FRIENDLY_NAME = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 113_u32)
  ENHANCED_STORAGE_COMMAND_CERT_GET_SILO_GUID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 114_u32)
  ENHANCED_STORAGE_COMMAND_PASSWORD_AUTHORIZE_ACT_ACCESS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 203_u32)
  ENHANCED_STORAGE_COMMAND_PASSWORD_UNAUTHORIZE_ACT_ACCESS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 204_u32)
  ENHANCED_STORAGE_COMMAND_PASSWORD_QUERY_INFORMATION = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 205_u32)
  ENHANCED_STORAGE_COMMAND_PASSWORD_CONFIG_ADMINISTRATOR = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 206_u32)
  ENHANCED_STORAGE_COMMAND_PASSWORD_CREATE_USER = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 207_u32)
  ENHANCED_STORAGE_COMMAND_PASSWORD_DELETE_USER = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 208_u32)
  ENHANCED_STORAGE_COMMAND_PASSWORD_CHANGE_PASSWORD = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 209_u32)
  ENHANCED_STORAGE_COMMAND_PASSWORD_INITIALIZE_USER_PASSWORD = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 210_u32)
  ENHANCED_STORAGE_COMMAND_PASSWORD_START_INITIALIZE_TO_MANUFACTURER_STATE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 211_u32)
  ENHANCED_STORAGE_PROPERTY_AUTHENTICATION_STATE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 1006_u32)
  ENHANCED_STORAGE_AUTHN_STATE_UNKNOWN = 0_u32
  ENHANCED_STORAGE_AUTHN_STATE_NO_AUTHENTICATION_REQUIRED = 1_u32
  ENHANCED_STORAGE_AUTHN_STATE_NOT_AUTHENTICATED = 2_u32
  ENHANCED_STORAGE_AUTHN_STATE_AUTHENTICATED = 3_u32
  ENHANCED_STORAGE_AUTHN_STATE_AUTHENTICATION_DENIED = 2147483649_u32
  ENHANCED_STORAGE_AUTHN_STATE_DEVICE_ERROR = 2147483650_u32
  ENHANCED_STORAGE_PROPERTY_IS_AUTHENTICATION_SILO = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 1009_u32)
  ENHANCED_STORAGE_PROPERTY_TEMPORARY_UNAUTHENTICATION = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 1010_u32)
  ENHANCED_STORAGE_PROPERTY_MAX_AUTH_FAILURES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 2001_u32)
  ENHANCED_STORAGE_PROPERTY_PASSWORD = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 2004_u32)
  ENHANCED_STORAGE_PROPERTY_OLD_PASSWORD = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 2005_u32)
  ENHANCED_STORAGE_PROPERTY_PASSWORD_INDICATOR = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 2006_u32)
  ENHANCED_STORAGE_PROPERTY_NEW_PASSWORD_INDICATOR = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 2007_u32)
  ENHANCED_STORAGE_PROPERTY_NEW_PASSWORD = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 2008_u32)
  ENHANCED_STORAGE_PROPERTY_USER_HINT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 2009_u32)
  ENHANCED_STORAGE_PROPERTY_USER_NAME = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 2010_u32)
  ENHANCED_STORAGE_PROPERTY_ADMIN_HINT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 2011_u32)
  ENHANCED_STORAGE_PROPERTY_SILO_NAME = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 2012_u32)
  ENHANCED_STORAGE_PROPERTY_SILO_FRIENDLYNAME_SPECIFIED = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 2013_u32)
  ENHANCED_STORAGE_PROPERTY_PASSWORD_SILO_INFO = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 2014_u32)
  ENHANCED_STORAGE_PROPERTY_SECURITY_IDENTIFIER = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 2015_u32)
  ENHANCED_STORAGE_PROPERTY_QUERY_SILO_TYPE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 2016_u32)
  ENHANCED_STORAGE_PROPERTY_QUERY_SILO_RESULTS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 2017_u32)
  ENHANCED_STORAGE_PROPERTY_MAX_CERTIFICATE_COUNT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 3001_u32)
  ENHANCED_STORAGE_PROPERTY_STORED_CERTIFICATE_COUNT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 3002_u32)
  ENHANCED_STORAGE_PROPERTY_CERTIFICATE_INDEX = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 3003_u32)
  ENHANCED_STORAGE_PROPERTY_CERTIFICATE_TYPE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 3004_u32)
  CERT_TYPE_EMPTY = 0_u32
  CERT_TYPE_ASCm = 1_u32
  CERT_TYPE_PCp = 2_u32
  CERT_TYPE_ASCh = 3_u32
  CERT_TYPE_HCh = 4_u32
  CERT_TYPE_SIGNER = 6_u32
  ENHANCED_STORAGE_PROPERTY_VALIDATION_POLICY = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 3005_u32)
  CERT_VALIDATION_POLICY_RESERVED = 0_u32
  CERT_VALIDATION_POLICY_NONE = 1_u32
  CERT_VALIDATION_POLICY_BASIC = 2_u32
  CERT_VALIDATION_POLICY_EXTENDED = 3_u32
  ENHANCED_STORAGE_PROPERTY_NEXT_CERTIFICATE_INDEX = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 3006_u32)
  ENHANCED_STORAGE_PROPERTY_NEXT_CERTIFICATE_OF_TYPE_INDEX = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 3007_u32)
  ENHANCED_STORAGE_PROPERTY_CERTIFICATE_LENGTH = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 3008_u32)
  ENHANCED_STORAGE_PROPERTY_CERTIFICATE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 3009_u32)
  ENHANCED_STORAGE_PROPERTY_CERTIFICATE_REQUEST = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 3010_u32)
  ENHANCED_STORAGE_PROPERTY_CERTIFICATE_CAPABILITY_TYPE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 3011_u32)
  ENHANCED_STORAGE_PROPERTY_CERTIFICATE_SILO_CAPABILITY = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 3012_u32)
  ENHANCED_STORAGE_PROPERTY_CERTIFICATE_SILO_CAPABILITIES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 3013_u32)
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
  ENHANCED_STORAGE_PROPERTY_CERTIFICATE_ACT_FRIENDLY_NAME = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 3014_u32)
  ENHANCED_STORAGE_PROPERTY_CERTIFICATE_SILO_GUID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 3015_u32)
  ENHANCED_STORAGE_PROPERTY_SIGNER_CERTIFICATE_INDEX = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 3016_u32)
  ENHANCED_STORAGE_CAPABILITY_HASH_ALGS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 4001_u32)
  ENHANCED_STORAGE_CAPABILITY_ASYMMETRIC_KEY_CRYPTOGRAPHY = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 4002_u32)
  ENHANCED_STORAGE_CAPABILITY_SIGNING_ALGS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 4003_u32)
  ENHANCED_STORAGE_CAPABILITY_RENDER_USER_DATA_UNUSABLE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 4004_u32)
  ENHANCED_STORAGE_CAPABILITY_CERTIFICATE_EXTENSION_PARSING = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91248166_u32, 0xb832_u16, 0x4ad4_u16, StaticArray[0xba_u8, 0xa4_u8, 0x7c_u8, 0xa0_u8, 0xb6_u8, 0xb2_u8, 0x79_u8, 0x8c_u8]), 4005_u32)
  PKEY_Address_Country = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc07b4199_u32, 0xe1df_u16, 0x4493_u16, StaticArray[0xb1_u8, 0xe1_u8, 0xde_u8, 0x59_u8, 0x46_u8, 0xfb_u8, 0x58_u8, 0xf8_u8]), 100_u32)
  PKEY_Address_CountryCode = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc07b4199_u32, 0xe1df_u16, 0x4493_u16, StaticArray[0xb1_u8, 0xe1_u8, 0xde_u8, 0x59_u8, 0x46_u8, 0xfb_u8, 0x58_u8, 0xf8_u8]), 101_u32)
  PKEY_Address_Region = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc07b4199_u32, 0xe1df_u16, 0x4493_u16, StaticArray[0xb1_u8, 0xe1_u8, 0xde_u8, 0x59_u8, 0x46_u8, 0xfb_u8, 0x58_u8, 0xf8_u8]), 102_u32)
  PKEY_Address_RegionCode = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc07b4199_u32, 0xe1df_u16, 0x4493_u16, StaticArray[0xb1_u8, 0xe1_u8, 0xde_u8, 0x59_u8, 0x46_u8, 0xfb_u8, 0x58_u8, 0xf8_u8]), 103_u32)
  PKEY_Address_Town = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc07b4199_u32, 0xe1df_u16, 0x4493_u16, StaticArray[0xb1_u8, 0xe1_u8, 0xde_u8, 0x59_u8, 0x46_u8, 0xfb_u8, 0x58_u8, 0xf8_u8]), 104_u32)
  PKEY_Audio_ChannelCount = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440490_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 7_u32)
  AUDIO_CHANNELCOUNT_MONO = 1_u32
  AUDIO_CHANNELCOUNT_STEREO = 2_u32
  PKEY_Audio_Compression = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440490_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 10_u32)
  PKEY_Audio_EncodingBitrate = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440490_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 4_u32)
  PKEY_Audio_Format = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440490_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 2_u32)
  PKEY_Audio_IsVariableBitRate = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe6822fee_u32, 0x8c17_u16, 0x4d62_u16, StaticArray[0x82_u8, 0x3c_u8, 0x8e_u8, 0x9c_u8, 0xfc_u8, 0xbd_u8, 0x1d_u8, 0x5c_u8]), 100_u32)
  PKEY_Audio_PeakValue = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2579e5d0_u32, 0x1116_u16, 0x4084_u16, StaticArray[0xbd_u8, 0x9a_u8, 0x9b_u8, 0x4f_u8, 0x7c_u8, 0xb4_u8, 0xdf_u8, 0x5e_u8]), 100_u32)
  PKEY_Audio_SampleRate = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440490_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 5_u32)
  PKEY_Audio_SampleSize = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440490_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 6_u32)
  PKEY_Audio_StreamName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440490_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 9_u32)
  PKEY_Audio_StreamNumber = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440490_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 8_u32)
  PKEY_Calendar_Duration = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x293ca35a_u32, 0x9aa_u16, 0x4dd2_u16, StaticArray[0xb1_u8, 0x80_u8, 0x1f_u8, 0xe2_u8, 0x45_u8, 0x72_u8, 0x8a_u8, 0x52_u8]), 100_u32)
  PKEY_Calendar_IsOnline = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xbfee9149_u32, 0xe3e2_u16, 0x49a7_u16, StaticArray[0xa8_u8, 0x62_u8, 0xc0_u8, 0x59_u8, 0x88_u8, 0x14_u8, 0x5c_u8, 0xec_u8]), 100_u32)
  PKEY_Calendar_IsRecurring = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x315b9c8d_u32, 0x80a9_u16, 0x4ef9_u16, StaticArray[0xae_u8, 0x16_u8, 0x8e_u8, 0x74_u8, 0x6d_u8, 0xa5_u8, 0x1d_u8, 0x70_u8]), 100_u32)
  PKEY_Calendar_Location = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf6272d18_u32, 0xcecc_u16, 0x40b1_u16, StaticArray[0xb2_u8, 0x6a_u8, 0x39_u8, 0x11_u8, 0x71_u8, 0x7a_u8, 0xa7_u8, 0xbd_u8]), 100_u32)
  PKEY_Calendar_OptionalAttendeeAddresses = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd55bae5a_u32, 0x3892_u16, 0x417a_u16, StaticArray[0xa6_u8, 0x49_u8, 0xc6_u8, 0xac_u8, 0x5a_u8, 0xaa_u8, 0xea_u8, 0xb3_u8]), 100_u32)
  PKEY_Calendar_OptionalAttendeeNames = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9429607_u32, 0x582d_u16, 0x437f_u16, StaticArray[0x84_u8, 0xc3_u8, 0xde_u8, 0x93_u8, 0xa2_u8, 0xb2_u8, 0x4c_u8, 0x3c_u8]), 100_u32)
  PKEY_Calendar_OrganizerAddress = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x744c8242_u32, 0x4df5_u16, 0x456c_u16, StaticArray[0xab_u8, 0x9e_u8, 0x1_u8, 0x4e_u8, 0xfb_u8, 0x90_u8, 0x21_u8, 0xe3_u8]), 100_u32)
  PKEY_Calendar_OrganizerName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xaaa660f9_u32, 0x9865_u16, 0x458e_u16, StaticArray[0xb4_u8, 0x84_u8, 0x1_u8, 0xbc_u8, 0x7f_u8, 0xe3_u8, 0x97_u8, 0x3e_u8]), 100_u32)
  PKEY_Calendar_ReminderTime = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x72fc5ba4_u32, 0x24f9_u16, 0x4011_u16, StaticArray[0x9f_u8, 0x3f_u8, 0xad_u8, 0xd2_u8, 0x7a_u8, 0xfa_u8, 0xd8_u8, 0x18_u8]), 100_u32)
  PKEY_Calendar_RequiredAttendeeAddresses = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xba7d6c3_u32, 0x568d_u16, 0x4159_u16, StaticArray[0xab_u8, 0x91_u8, 0x78_u8, 0x1a_u8, 0x91_u8, 0xfb_u8, 0x71_u8, 0xe5_u8]), 100_u32)
  PKEY_Calendar_RequiredAttendeeNames = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb33af30b_u32, 0xf552_u16, 0x4584_u16, StaticArray[0x93_u8, 0x6c_u8, 0xcb_u8, 0x93_u8, 0xe5_u8, 0xcd_u8, 0xa2_u8, 0x9f_u8]), 100_u32)
  PKEY_Calendar_Resources = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf58a38_u32, 0xc54b_u16, 0x4c40_u16, StaticArray[0x86_u8, 0x96_u8, 0x97_u8, 0x23_u8, 0x59_u8, 0x80_u8, 0xea_u8, 0xe1_u8]), 100_u32)
  PKEY_Calendar_ResponseStatus = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x188c1f91_u32, 0x3c40_u16, 0x4132_u16, StaticArray[0x9e_u8, 0xc5_u8, 0xd8_u8, 0xb0_u8, 0x3b_u8, 0x72_u8, 0xa8_u8, 0xa2_u8]), 100_u32)
  PKEY_Calendar_ShowTimeAs = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x5bf396d4_u32, 0x5eb2_u16, 0x466f_u16, StaticArray[0xbd_u8, 0xe9_u8, 0x2f_u8, 0xb3_u8, 0xf2_u8, 0x36_u8, 0x1d_u8, 0x6e_u8]), 100_u32)
  PKEY_Calendar_ShowTimeAsText = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x53da57cf_u32, 0x62c0_u16, 0x45c4_u16, StaticArray[0x81_u8, 0xde_u8, 0x76_u8, 0x10_u8, 0xbc_u8, 0xef_u8, 0xd7_u8, 0xf5_u8]), 100_u32)
  PKEY_Communication_AccountName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe3e0584c_u32, 0xb788_u16, 0x4a5a_u16, StaticArray[0xbb_u8, 0x20_u8, 0x7f_u8, 0x5a_u8, 0x44_u8, 0xc9_u8, 0xac_u8, 0xdd_u8]), 9_u32)
  PKEY_Communication_DateItemExpires = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x428040ac_u32, 0xa177_u16, 0x4c8a_u16, StaticArray[0x97_u8, 0x60_u8, 0xf6_u8, 0xf7_u8, 0x61_u8, 0x22_u8, 0x7f_u8, 0x9a_u8]), 100_u32)
  PKEY_Communication_Direction = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x8e531030_u32, 0xb960_u16, 0x4346_u16, StaticArray[0xae_u8, 0xd_u8, 0x66_u8, 0xbc_u8, 0x9a_u8, 0x86_u8, 0xfb_u8, 0x94_u8]), 100_u32)
  PKEY_Communication_FollowupIconIndex = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x83a6347e_u32, 0x6fe4_u16, 0x4f40_u16, StaticArray[0xba_u8, 0x9c_u8, 0xc4_u8, 0x86_u8, 0x52_u8, 0x40_u8, 0xd1_u8, 0xf4_u8]), 100_u32)
  PKEY_Communication_HeaderItem = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc9c34f84_u32, 0x2241_u16, 0x4401_u16, StaticArray[0xb6_u8, 0x7_u8, 0xbd_u8, 0x20_u8, 0xed_u8, 0x75_u8, 0xae_u8, 0x7f_u8]), 100_u32)
  PKEY_Communication_PolicyTag = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xec0b4191_u32, 0xab0b_u16, 0x4c66_u16, StaticArray[0x90_u8, 0xb6_u8, 0xc6_u8, 0x63_u8, 0x7c_u8, 0xde_u8, 0xbb_u8, 0xab_u8]), 100_u32)
  PKEY_Communication_SecurityFlags = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x8619a4b6_u32, 0x9f4d_u16, 0x4429_u16, StaticArray[0x8c_u8, 0xf_u8, 0xb9_u8, 0x96_u8, 0xca_u8, 0x59_u8, 0xe3_u8, 0x35_u8]), 100_u32)
  PKEY_Communication_Suffix = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x807b653a_u32, 0x9e91_u16, 0x43ef_u16, StaticArray[0x8f_u8, 0x97_u8, 0x11_u8, 0xce_u8, 0x4_u8, 0xee_u8, 0x20_u8, 0xc5_u8]), 100_u32)
  PKEY_Communication_TaskStatus = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xbe1a72c6_u32, 0x9a1d_u16, 0x46b7_u16, StaticArray[0xaf_u8, 0xe7_u8, 0xaf_u8, 0xaf_u8, 0x8c_u8, 0xef_u8, 0x49_u8, 0x99_u8]), 100_u32)
  PKEY_Communication_TaskStatusText = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa6744477_u32, 0xc237_u16, 0x475b_u16, StaticArray[0xa0_u8, 0x75_u8, 0x54_u8, 0xf3_u8, 0x44_u8, 0x98_u8, 0x29_u8, 0x2a_u8]), 100_u32)
  PKEY_Computer_DecoratedFreeSpace = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9b174b35_u32, 0x40ff_u16, 0x11d2_u16, StaticArray[0xa2_u8, 0x7e_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc3_u8, 0x8_u8, 0x71_u8]), 7_u32)
  PKEY_Contact_AccountPictureDynamicVideo = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb8bb018_u32, 0x2725_u16, 0x4b44_u16, StaticArray[0x92_u8, 0xba_u8, 0x79_u8, 0x33_u8, 0xae_u8, 0xb2_u8, 0xdd_u8, 0xe7_u8]), 2_u32)
  PKEY_Contact_AccountPictureLarge = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb8bb018_u32, 0x2725_u16, 0x4b44_u16, StaticArray[0x92_u8, 0xba_u8, 0x79_u8, 0x33_u8, 0xae_u8, 0xb2_u8, 0xdd_u8, 0xe7_u8]), 3_u32)
  PKEY_Contact_AccountPictureSmall = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb8bb018_u32, 0x2725_u16, 0x4b44_u16, StaticArray[0x92_u8, 0xba_u8, 0x79_u8, 0x33_u8, 0xae_u8, 0xb2_u8, 0xdd_u8, 0xe7_u8]), 4_u32)
  PKEY_Contact_Anniversary = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9ad5badb_u32, 0xcea7_u16, 0x4470_u16, StaticArray[0xa0_u8, 0x3d_u8, 0xb8_u8, 0x4e_u8, 0x51_u8, 0xb9_u8, 0x94_u8, 0x9e_u8]), 100_u32)
  PKEY_Contact_AssistantName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcd102c9c_u32, 0x5540_u16, 0x4a88_u16, StaticArray[0xa6_u8, 0xf6_u8, 0x64_u8, 0xe4_u8, 0x98_u8, 0x1c_u8, 0x8c_u8, 0xd1_u8]), 100_u32)
  PKEY_Contact_AssistantTelephone = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9a93244d_u32, 0xa7ad_u16, 0x4ff8_u16, StaticArray[0x9b_u8, 0x99_u8, 0x45_u8, 0xee_u8, 0x4c_u8, 0xc0_u8, 0x9a_u8, 0xf6_u8]), 100_u32)
  PKEY_Contact_Birthday = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x176dc63c_u32, 0x2688_u16, 0x4e89_u16, StaticArray[0x81_u8, 0x43_u8, 0xa3_u8, 0x47_u8, 0x80_u8, 0xf_u8, 0x25_u8, 0xe9_u8]), 47_u32)
  PKEY_Contact_BusinessAddress = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x730fb6dd_u32, 0xcf7c_u16, 0x426b_u16, StaticArray[0xa0_u8, 0x3f_u8, 0xbd_u8, 0x16_u8, 0x6c_u8, 0xc9_u8, 0xee_u8, 0x24_u8]), 100_u32)
  PKEY_Contact_BusinessAddress1Country = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 119_u32)
  PKEY_Contact_BusinessAddress1Locality = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 117_u32)
  PKEY_Contact_BusinessAddress1PostalCode = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 120_u32)
  PKEY_Contact_BusinessAddress1Region = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 118_u32)
  PKEY_Contact_BusinessAddress1Street = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 116_u32)
  PKEY_Contact_BusinessAddress2Country = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 124_u32)
  PKEY_Contact_BusinessAddress2Locality = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 122_u32)
  PKEY_Contact_BusinessAddress2PostalCode = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 125_u32)
  PKEY_Contact_BusinessAddress2Region = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 123_u32)
  PKEY_Contact_BusinessAddress2Street = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 121_u32)
  PKEY_Contact_BusinessAddress3Country = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 129_u32)
  PKEY_Contact_BusinessAddress3Locality = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 127_u32)
  PKEY_Contact_BusinessAddress3PostalCode = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 130_u32)
  PKEY_Contact_BusinessAddress3Region = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 128_u32)
  PKEY_Contact_BusinessAddress3Street = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 126_u32)
  PKEY_Contact_BusinessAddressCity = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x402b5934_u32, 0xec5a_u16, 0x48c3_u16, StaticArray[0x93_u8, 0xe6_u8, 0x85_u8, 0xe8_u8, 0x6a_u8, 0x2d_u8, 0x93_u8, 0x4e_u8]), 100_u32)
  PKEY_Contact_BusinessAddressCountry = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb0b87314_u32, 0xfcf6_u16, 0x4feb_u16, StaticArray[0x8d_u8, 0xff_u8, 0xa5_u8, 0xd_u8, 0xa6_u8, 0xaf_u8, 0x56_u8, 0x1c_u8]), 100_u32)
  PKEY_Contact_BusinessAddressPostalCode = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe1d4a09e_u32, 0xd758_u16, 0x4cd1_u16, StaticArray[0xb6_u8, 0xec_u8, 0x34_u8, 0xa8_u8, 0xb5_u8, 0xa7_u8, 0x3f_u8, 0x80_u8]), 100_u32)
  PKEY_Contact_BusinessAddressPostOfficeBox = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xbc4e71ce_u32, 0x17f9_u16, 0x48d5_u16, StaticArray[0xbe_u8, 0xe9_u8, 0x2_u8, 0x1d_u8, 0xf0_u8, 0xea_u8, 0x54_u8, 0x9_u8]), 100_u32)
  PKEY_Contact_BusinessAddressState = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x446f787f_u32, 0x10c4_u16, 0x41cb_u16, StaticArray[0xa6_u8, 0xc4_u8, 0x4d_u8, 0x3_u8, 0x43_u8, 0x55_u8, 0x15_u8, 0x97_u8]), 100_u32)
  PKEY_Contact_BusinessAddressStreet = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xddd1460f_u32, 0xc0bf_u16, 0x4553_u16, StaticArray[0x8c_u8, 0xe4_u8, 0x10_u8, 0x43_u8, 0x3c_u8, 0x90_u8, 0x8f_u8, 0xb0_u8]), 100_u32)
  PKEY_Contact_BusinessEmailAddresses = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf271c659_u32, 0x7e5e_u16, 0x471f_u16, StaticArray[0xba_u8, 0x25_u8, 0x7f_u8, 0x77_u8, 0xb2_u8, 0x86_u8, 0xf8_u8, 0x36_u8]), 100_u32)
  PKEY_Contact_BusinessFaxNumber = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x91eff6f3_u32, 0x2e27_u16, 0x42ca_u16, StaticArray[0x93_u8, 0x3e_u8, 0x7c_u8, 0x99_u8, 0x9f_u8, 0xbe_u8, 0x31_u8, 0xb_u8]), 100_u32)
  PKEY_Contact_BusinessHomePage = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x56310920_u32, 0x2491_u16, 0x4919_u16, StaticArray[0x99_u8, 0xce_u8, 0xea_u8, 0xdb_u8, 0x6_u8, 0xfa_u8, 0xfd_u8, 0xb2_u8]), 100_u32)
  PKEY_Contact_BusinessTelephone = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6a15e5a0_u32, 0xa1e_u16, 0x4cd7_u16, StaticArray[0xbb_u8, 0x8c_u8, 0xd2_u8, 0xf1_u8, 0xb0_u8, 0xc9_u8, 0x29_u8, 0xbc_u8]), 100_u32)
  PKEY_Contact_CallbackTelephone = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xbf53d1c3_u32, 0x49e0_u16, 0x4f7f_u16, StaticArray[0x85_u8, 0x67_u8, 0x5a_u8, 0x82_u8, 0x1d_u8, 0x8a_u8, 0xc5_u8, 0x42_u8]), 100_u32)
  PKEY_Contact_CarTelephone = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x8fdc6dea_u32, 0xb929_u16, 0x412b_u16, StaticArray[0xba_u8, 0x90_u8, 0x39_u8, 0x7a_u8, 0x25_u8, 0x74_u8, 0x65_u8, 0xfe_u8]), 100_u32)
  PKEY_Contact_Children = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd4729704_u32, 0x8ef1_u16, 0x43ef_u16, StaticArray[0x90_u8, 0x24_u8, 0x2b_u8, 0xd3_u8, 0x81_u8, 0x18_u8, 0x7f_u8, 0xd5_u8]), 100_u32)
  PKEY_Contact_CompanyMainTelephone = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x8589e481_u32, 0x6040_u16, 0x473d_u16, StaticArray[0xb1_u8, 0x71_u8, 0x7f_u8, 0xa8_u8, 0x9c_u8, 0x27_u8, 0x8_u8, 0xed_u8]), 100_u32)
  PKEY_Contact_ConnectedServiceDisplayName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x39b77f4f_u32, 0xa104_u16, 0x4863_u16, StaticArray[0xb3_u8, 0x95_u8, 0x2d_u8, 0xb2_u8, 0xad_u8, 0x8f_u8, 0x7b_u8, 0xc1_u8]), 100_u32)
  PKEY_Contact_ConnectedServiceIdentities = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x80f41eb8_u32, 0xafc4_u16, 0x4208_u16, StaticArray[0xaa_u8, 0x5f_u8, 0xcc_u8, 0xe2_u8, 0x1a_u8, 0x62_u8, 0x72_u8, 0x81_u8]), 100_u32)
  PKEY_Contact_ConnectedServiceName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb5c84c9e_u32, 0x5927_u16, 0x46b5_u16, StaticArray[0xa3_u8, 0xcc_u8, 0x93_u8, 0x3c_u8, 0x21_u8, 0xb7_u8, 0x84_u8, 0x69_u8]), 100_u32)
  PKEY_Contact_ConnectedServiceSupportedActions = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa19fb7a9_u32, 0x24b_u16, 0x4371_u16, StaticArray[0xa8_u8, 0xbf_u8, 0x4d_u8, 0x29_u8, 0xc3_u8, 0xe4_u8, 0xe9_u8, 0xc9_u8]), 100_u32)
  PKEY_Contact_DataSuppliers = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9660c283_u32, 0xfc3a_u16, 0x4a08_u16, StaticArray[0xa0_u8, 0x96_u8, 0xee_u8, 0xd3_u8, 0xaa_u8, 0xc4_u8, 0x6d_u8, 0xa2_u8]), 100_u32)
  PKEY_Contact_Department = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfc9f7306_u32, 0xff8f_u16, 0x4d49_u16, StaticArray[0x9f_u8, 0xb6_u8, 0x3f_u8, 0xfe_u8, 0x5c_u8, 0x9_u8, 0x51_u8, 0xec_u8]), 100_u32)
  PKEY_Contact_DisplayBusinessPhoneNumbers = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x364028da_u32, 0xd895_u16, 0x41fe_u16, StaticArray[0xa5_u8, 0x84_u8, 0x30_u8, 0x2b_u8, 0x1b_u8, 0xb7_u8, 0xa_u8, 0x76_u8]), 100_u32)
  PKEY_Contact_DisplayHomePhoneNumbers = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x5068bcdf_u32, 0xd697_u16, 0x4d85_u16, StaticArray[0x8c_u8, 0x53_u8, 0x1f_u8, 0x1c_u8, 0xda_u8, 0xb0_u8, 0x17_u8, 0x63_u8]), 100_u32)
  PKEY_Contact_DisplayMobilePhoneNumbers = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9cb0c358_u32, 0x9d7a_u16, 0x46b1_u16, StaticArray[0xb4_u8, 0x66_u8, 0xdc_u8, 0xc6_u8, 0xf1_u8, 0xa3_u8, 0xd9_u8, 0x3d_u8]), 100_u32)
  PKEY_Contact_DisplayOtherPhoneNumbers = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x3089873_u32, 0x8ee8_u16, 0x4191_u16, StaticArray[0xbd_u8, 0x60_u8, 0xd3_u8, 0x1f_u8, 0x72_u8, 0xb7_u8, 0x90_u8, 0xb_u8]), 100_u32)
  PKEY_Contact_EmailAddress = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf8fa7fa3_u32, 0xd12b_u16, 0x4785_u16, StaticArray[0x8a_u8, 0x4e_u8, 0x69_u8, 0x1a_u8, 0x94_u8, 0xf7_u8, 0xa3_u8, 0xe7_u8]), 100_u32)
  PKEY_Contact_EmailAddress2 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x38965063_u32, 0xedc8_u16, 0x4268_u16, StaticArray[0x84_u8, 0x91_u8, 0xb7_u8, 0x72_u8, 0x31_u8, 0x72_u8, 0xcf_u8, 0x29_u8]), 100_u32)
  PKEY_Contact_EmailAddress3 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x644d37b4_u32, 0xe1b3_u16, 0x4bad_u16, StaticArray[0xb0_u8, 0x99_u8, 0x7e_u8, 0x7c_u8, 0x4_u8, 0x96_u8, 0x6a_u8, 0xca_u8]), 100_u32)
  PKEY_Contact_EmailAddresses = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x84d8f337_u32, 0x981d_u16, 0x44b3_u16, StaticArray[0x96_u8, 0x15_u8, 0xc7_u8, 0x59_u8, 0x6d_u8, 0xba_u8, 0x17_u8, 0xe3_u8]), 100_u32)
  PKEY_Contact_EmailName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcc6f4f24_u32, 0x6083_u16, 0x4bd4_u16, StaticArray[0x87_u8, 0x54_u8, 0x67_u8, 0x4d_u8, 0xd_u8, 0xe8_u8, 0x7a_u8, 0xb8_u8]), 100_u32)
  PKEY_Contact_FileAsName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf1a24aa7_u32, 0x9ca7_u16, 0x40f6_u16, StaticArray[0x89_u8, 0xec_u8, 0x97_u8, 0xde_u8, 0xf9_u8, 0xff_u8, 0xe8_u8, 0xdb_u8]), 100_u32)
  PKEY_Contact_FirstName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x14977844_u32, 0x6b49_u16, 0x4aad_u16, StaticArray[0xa7_u8, 0x14_u8, 0xa4_u8, 0x51_u8, 0x3b_u8, 0xf6_u8, 0x4_u8, 0x60_u8]), 100_u32)
  PKEY_Contact_FullName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x635e9051_u32, 0x50a5_u16, 0x4ba2_u16, StaticArray[0xb9_u8, 0xdb_u8, 0x4e_u8, 0xd0_u8, 0x56_u8, 0xc7_u8, 0x72_u8, 0x96_u8]), 100_u32)
  PKEY_Contact_Gender = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x3c8cee58_u32, 0xd4f0_u16, 0x4cf9_u16, StaticArray[0xb7_u8, 0x56_u8, 0x4e_u8, 0x5d_u8, 0x24_u8, 0x44_u8, 0x7b_u8, 0xcd_u8]), 100_u32)
  PKEY_Contact_GenderValue = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x3c8cee58_u32, 0xd4f0_u16, 0x4cf9_u16, StaticArray[0xb7_u8, 0x56_u8, 0x4e_u8, 0x5d_u8, 0x24_u8, 0x44_u8, 0x7b_u8, 0xcd_u8]), 101_u32)
  PKEY_Contact_Hobbies = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x5dc2253f_u32, 0x5e11_u16, 0x4adf_u16, StaticArray[0x9c_u8, 0xfe_u8, 0x91_u8, 0xd_u8, 0xd0_u8, 0x1e_u8, 0x3e_u8, 0x70_u8]), 100_u32)
  PKEY_Contact_HomeAddress = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x98f98354_u32, 0x617a_u16, 0x46b8_u16, StaticArray[0x85_u8, 0x60_u8, 0x5b_u8, 0x1b_u8, 0x64_u8, 0xbf_u8, 0x1f_u8, 0x89_u8]), 100_u32)
  PKEY_Contact_HomeAddress1Country = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 104_u32)
  PKEY_Contact_HomeAddress1Locality = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 102_u32)
  PKEY_Contact_HomeAddress1PostalCode = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 105_u32)
  PKEY_Contact_HomeAddress1Region = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 103_u32)
  PKEY_Contact_HomeAddress1Street = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 101_u32)
  PKEY_Contact_HomeAddress2Country = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 109_u32)
  PKEY_Contact_HomeAddress2Locality = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 107_u32)
  PKEY_Contact_HomeAddress2PostalCode = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 110_u32)
  PKEY_Contact_HomeAddress2Region = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 108_u32)
  PKEY_Contact_HomeAddress2Street = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 106_u32)
  PKEY_Contact_HomeAddress3Country = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 114_u32)
  PKEY_Contact_HomeAddress3Locality = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 112_u32)
  PKEY_Contact_HomeAddress3PostalCode = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 115_u32)
  PKEY_Contact_HomeAddress3Region = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 113_u32)
  PKEY_Contact_HomeAddress3Street = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 111_u32)
  PKEY_Contact_HomeAddressCity = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x176dc63c_u32, 0x2688_u16, 0x4e89_u16, StaticArray[0x81_u8, 0x43_u8, 0xa3_u8, 0x47_u8, 0x80_u8, 0xf_u8, 0x25_u8, 0xe9_u8]), 65_u32)
  PKEY_Contact_HomeAddressCountry = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x8a65aa1_u32, 0xf4c9_u16, 0x43dd_u16, StaticArray[0x9d_u8, 0xdf_u8, 0xa3_u8, 0x3d_u8, 0x8e_u8, 0x7e_u8, 0xad_u8, 0x85_u8]), 100_u32)
  PKEY_Contact_HomeAddressPostalCode = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x8afcc170_u32, 0x8a46_u16, 0x4b53_u16, StaticArray[0x9e_u8, 0xee_u8, 0x90_u8, 0xba_u8, 0xe7_u8, 0x15_u8, 0x1e_u8, 0x62_u8]), 100_u32)
  PKEY_Contact_HomeAddressPostOfficeBox = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7b9f6399_u32, 0xa3f_u16, 0x4b12_u16, StaticArray[0x89_u8, 0xbd_u8, 0x4a_u8, 0xdc_u8, 0x51_u8, 0xc9_u8, 0x18_u8, 0xaf_u8]), 100_u32)
  PKEY_Contact_HomeAddressState = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc89a23d0_u32, 0x7d6d_u16, 0x4eb8_u16, StaticArray[0x87_u8, 0xd4_u8, 0x77_u8, 0x6a_u8, 0x82_u8, 0xd4_u8, 0x93_u8, 0xe5_u8]), 100_u32)
  PKEY_Contact_HomeAddressStreet = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xadef160_u32, 0xdb3f_u16, 0x4308_u16, StaticArray[0x9a_u8, 0x21_u8, 0x6_u8, 0x23_u8, 0x7b_u8, 0x16_u8, 0xfa_u8, 0x2a_u8]), 100_u32)
  PKEY_Contact_HomeEmailAddresses = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x56c90e9d_u32, 0x9d46_u16, 0x4963_u16, StaticArray[0x88_u8, 0x6f_u8, 0x2e_u8, 0x1c_u8, 0xd9_u8, 0xa6_u8, 0x94_u8, 0xef_u8]), 100_u32)
  PKEY_Contact_HomeFaxNumber = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x660e04d6_u32, 0x81ab_u16, 0x4977_u16, StaticArray[0xa0_u8, 0x9f_u8, 0x82_u8, 0x31_u8, 0x31_u8, 0x13_u8, 0xab_u8, 0x26_u8]), 100_u32)
  PKEY_Contact_HomeTelephone = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x176dc63c_u32, 0x2688_u16, 0x4e89_u16, StaticArray[0x81_u8, 0x43_u8, 0xa3_u8, 0x47_u8, 0x80_u8, 0xf_u8, 0x25_u8, 0xe9_u8]), 20_u32)
  PKEY_Contact_IMAddress = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd68dbd8a_u32, 0x3374_u16, 0x4b81_u16, StaticArray[0x99_u8, 0x72_u8, 0x3e_u8, 0xc3_u8, 0x6_u8, 0x82_u8, 0xdb_u8, 0x3d_u8]), 100_u32)
  PKEY_Contact_Initials = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf3d8f40d_u32, 0x50cb_u16, 0x44a2_u16, StaticArray[0x97_u8, 0x18_u8, 0x40_u8, 0xcb_u8, 0x91_u8, 0x19_u8, 0x49_u8, 0x5d_u8]), 100_u32)
  PKEY_Contact_JA_CompanyNamePhonetic = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x897b3694_u32, 0xfe9e_u16, 0x43e6_u16, StaticArray[0x80_u8, 0x66_u8, 0x26_u8, 0xf_u8, 0x59_u8, 0xc_u8, 0x1_u8, 0x0_u8]), 2_u32)
  PKEY_Contact_JA_FirstNamePhonetic = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x897b3694_u32, 0xfe9e_u16, 0x43e6_u16, StaticArray[0x80_u8, 0x66_u8, 0x26_u8, 0xf_u8, 0x59_u8, 0xc_u8, 0x1_u8, 0x0_u8]), 3_u32)
  PKEY_Contact_JA_LastNamePhonetic = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x897b3694_u32, 0xfe9e_u16, 0x43e6_u16, StaticArray[0x80_u8, 0x66_u8, 0x26_u8, 0xf_u8, 0x59_u8, 0xc_u8, 0x1_u8, 0x0_u8]), 4_u32)
  PKEY_Contact_JobInfo1CompanyAddress = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 120_u32)
  PKEY_Contact_JobInfo1CompanyName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 102_u32)
  PKEY_Contact_JobInfo1Department = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 106_u32)
  PKEY_Contact_JobInfo1Manager = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 105_u32)
  PKEY_Contact_JobInfo1OfficeLocation = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 104_u32)
  PKEY_Contact_JobInfo1Title = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 103_u32)
  PKEY_Contact_JobInfo1YomiCompanyName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 101_u32)
  PKEY_Contact_JobInfo2CompanyAddress = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 121_u32)
  PKEY_Contact_JobInfo2CompanyName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 108_u32)
  PKEY_Contact_JobInfo2Department = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 113_u32)
  PKEY_Contact_JobInfo2Manager = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 112_u32)
  PKEY_Contact_JobInfo2OfficeLocation = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 110_u32)
  PKEY_Contact_JobInfo2Title = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 109_u32)
  PKEY_Contact_JobInfo2YomiCompanyName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 107_u32)
  PKEY_Contact_JobInfo3CompanyAddress = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 123_u32)
  PKEY_Contact_JobInfo3CompanyName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 115_u32)
  PKEY_Contact_JobInfo3Department = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 119_u32)
  PKEY_Contact_JobInfo3Manager = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 118_u32)
  PKEY_Contact_JobInfo3OfficeLocation = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 117_u32)
  PKEY_Contact_JobInfo3Title = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 116_u32)
  PKEY_Contact_JobInfo3YomiCompanyName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 114_u32)
  PKEY_Contact_JobTitle = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x176dc63c_u32, 0x2688_u16, 0x4e89_u16, StaticArray[0x81_u8, 0x43_u8, 0xa3_u8, 0x47_u8, 0x80_u8, 0xf_u8, 0x25_u8, 0xe9_u8]), 6_u32)
  PKEY_Contact_Label = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x97b0ad89_u32, 0xdf49_u16, 0x49cc_u16, StaticArray[0x83_u8, 0x4e_u8, 0x66_u8, 0x9_u8, 0x74_u8, 0xfd_u8, 0x75_u8, 0x5b_u8]), 100_u32)
  PKEY_Contact_LastName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x8f367200_u32, 0xc270_u16, 0x457c_u16, StaticArray[0xb1_u8, 0xd4_u8, 0xe0_u8, 0x7c_u8, 0x5b_u8, 0xcd_u8, 0x90_u8, 0xc7_u8]), 100_u32)
  PKEY_Contact_MailingAddress = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc0ac206a_u32, 0x827e_u16, 0x4650_u16, StaticArray[0x95_u8, 0xae_u8, 0x77_u8, 0xe2_u8, 0xbb_u8, 0x74_u8, 0xfc_u8, 0xc9_u8]), 100_u32)
  PKEY_Contact_MiddleName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x176dc63c_u32, 0x2688_u16, 0x4e89_u16, StaticArray[0x81_u8, 0x43_u8, 0xa3_u8, 0x47_u8, 0x80_u8, 0xf_u8, 0x25_u8, 0xe9_u8]), 71_u32)
  PKEY_Contact_MobileTelephone = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x176dc63c_u32, 0x2688_u16, 0x4e89_u16, StaticArray[0x81_u8, 0x43_u8, 0xa3_u8, 0x47_u8, 0x80_u8, 0xf_u8, 0x25_u8, 0xe9_u8]), 35_u32)
  PKEY_Contact_NickName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x176dc63c_u32, 0x2688_u16, 0x4e89_u16, StaticArray[0x81_u8, 0x43_u8, 0xa3_u8, 0x47_u8, 0x80_u8, 0xf_u8, 0x25_u8, 0xe9_u8]), 74_u32)
  PKEY_Contact_OfficeLocation = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x176dc63c_u32, 0x2688_u16, 0x4e89_u16, StaticArray[0x81_u8, 0x43_u8, 0xa3_u8, 0x47_u8, 0x80_u8, 0xf_u8, 0x25_u8, 0xe9_u8]), 7_u32)
  PKEY_Contact_OtherAddress = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x508161fa_u32, 0x313b_u16, 0x43d5_u16, StaticArray[0x83_u8, 0xa1_u8, 0xc1_u8, 0xac_u8, 0xcf_u8, 0x68_u8, 0x62_u8, 0x2c_u8]), 100_u32)
  PKEY_Contact_OtherAddress1Country = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 134_u32)
  PKEY_Contact_OtherAddress1Locality = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 132_u32)
  PKEY_Contact_OtherAddress1PostalCode = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 135_u32)
  PKEY_Contact_OtherAddress1Region = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 133_u32)
  PKEY_Contact_OtherAddress1Street = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 131_u32)
  PKEY_Contact_OtherAddress2Country = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 139_u32)
  PKEY_Contact_OtherAddress2Locality = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 137_u32)
  PKEY_Contact_OtherAddress2PostalCode = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 140_u32)
  PKEY_Contact_OtherAddress2Region = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 138_u32)
  PKEY_Contact_OtherAddress2Street = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 136_u32)
  PKEY_Contact_OtherAddress3Country = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 144_u32)
  PKEY_Contact_OtherAddress3Locality = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 142_u32)
  PKEY_Contact_OtherAddress3PostalCode = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 145_u32)
  PKEY_Contact_OtherAddress3Region = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 143_u32)
  PKEY_Contact_OtherAddress3Street = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b6f596_u32, 0xd678_u16, 0x4bc1_u16, StaticArray[0xb0_u8, 0x5f_u8, 0x2_u8, 0x3_u8, 0xd2_u8, 0x7e_u8, 0x8a_u8, 0xa1_u8]), 141_u32)
  PKEY_Contact_OtherAddressCity = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6e682923_u32, 0x7f7b_u16, 0x4f0c_u16, StaticArray[0xa3_u8, 0x37_u8, 0xcf_u8, 0xca_u8, 0x29_u8, 0x66_u8, 0x87_u8, 0xbf_u8]), 100_u32)
  PKEY_Contact_OtherAddressCountry = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x8f167568_u32, 0xaae_u16, 0x4322_u16, StaticArray[0x8e_u8, 0xd9_u8, 0x60_u8, 0x55_u8, 0xb7_u8, 0xb0_u8, 0xe3_u8, 0x98_u8]), 100_u32)
  PKEY_Contact_OtherAddressPostalCode = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x95c656c1_u32, 0x2abf_u16, 0x4148_u16, StaticArray[0x9e_u8, 0xd3_u8, 0x9e_u8, 0xc6_u8, 0x2_u8, 0xe3_u8, 0xb7_u8, 0xcd_u8]), 100_u32)
  PKEY_Contact_OtherAddressPostOfficeBox = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x8b26ea41_u32, 0x58f_u16, 0x43f6_u16, StaticArray[0xae_u8, 0xcc_u8, 0x40_u8, 0x35_u8, 0x68_u8, 0x1c_u8, 0xe9_u8, 0x77_u8]), 100_u32)
  PKEY_Contact_OtherAddressState = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x71b377d6_u32, 0xe570_u16, 0x425f_u16, StaticArray[0xa1_u8, 0x70_u8, 0x80_u8, 0x9f_u8, 0xae_u8, 0x73_u8, 0xe5_u8, 0x4e_u8]), 100_u32)
  PKEY_Contact_OtherAddressStreet = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xff962609_u32, 0xb7d6_u16, 0x4999_u16, StaticArray[0x86_u8, 0x2d_u8, 0x95_u8, 0x18_u8, 0xd_u8, 0x52_u8, 0x9a_u8, 0xea_u8]), 100_u32)
  PKEY_Contact_OtherEmailAddresses = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x11d6336b_u32, 0x38c4_u16, 0x4ec9_u16, StaticArray[0x84_u8, 0xd6_u8, 0xeb_u8, 0x38_u8, 0xd0_u8, 0xb1_u8, 0x50_u8, 0xaf_u8]), 100_u32)
  PKEY_Contact_PagerTelephone = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd6304e01_u32, 0xf8f5_u16, 0x4f45_u16, StaticArray[0x8b_u8, 0x15_u8, 0xd0_u8, 0x24_u8, 0xa6_u8, 0x29_u8, 0x67_u8, 0x89_u8]), 100_u32)
  PKEY_Contact_PersonalTitle = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x176dc63c_u32, 0x2688_u16, 0x4e89_u16, StaticArray[0x81_u8, 0x43_u8, 0xa3_u8, 0x47_u8, 0x80_u8, 0xf_u8, 0x25_u8, 0xe9_u8]), 69_u32)
  PKEY_Contact_PhoneNumbersCanonical = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd042d2a1_u32, 0x927e_u16, 0x40b5_u16, StaticArray[0xa5_u8, 0x3_u8, 0x6e_u8, 0xdb_u8, 0xd4_u8, 0x2a_u8, 0x51_u8, 0x7e_u8]), 100_u32)
  PKEY_Contact_Prefix = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x176dc63c_u32, 0x2688_u16, 0x4e89_u16, StaticArray[0x81_u8, 0x43_u8, 0xa3_u8, 0x47_u8, 0x80_u8, 0xf_u8, 0x25_u8, 0xe9_u8]), 75_u32)
  PKEY_Contact_PrimaryAddressCity = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc8ea94f0_u32, 0xa9e3_u16, 0x4969_u16, StaticArray[0xa9_u8, 0x4b_u8, 0x9c_u8, 0x62_u8, 0xa9_u8, 0x53_u8, 0x24_u8, 0xe0_u8]), 100_u32)
  PKEY_Contact_PrimaryAddressCountry = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe53d799d_u32, 0xf3f_u16, 0x466e_u16, StaticArray[0xb2_u8, 0xff_u8, 0x74_u8, 0x63_u8, 0x4a_u8, 0x3c_u8, 0xb7_u8, 0xa4_u8]), 100_u32)
  PKEY_Contact_PrimaryAddressPostalCode = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x18bbd425_u32, 0xecfd_u16, 0x46ef_u16, StaticArray[0xb6_u8, 0x12_u8, 0x7b_u8, 0x4a_u8, 0x60_u8, 0x34_u8, 0xed_u8, 0xa0_u8]), 100_u32)
  PKEY_Contact_PrimaryAddressPostOfficeBox = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xde5ef3c7_u32, 0x46e1_u16, 0x484e_u16, StaticArray[0x99_u8, 0x99_u8, 0x62_u8, 0xc5_u8, 0x30_u8, 0x83_u8, 0x94_u8, 0xc1_u8]), 100_u32)
  PKEY_Contact_PrimaryAddressState = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf1176dfe_u32, 0x7138_u16, 0x4640_u16, StaticArray[0x8b_u8, 0x4c_u8, 0xae_u8, 0x37_u8, 0x5d_u8, 0xc7_u8, 0xa_u8, 0x6d_u8]), 100_u32)
  PKEY_Contact_PrimaryAddressStreet = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x63c25b20_u32, 0x96be_u16, 0x488f_u16, StaticArray[0x87_u8, 0x88_u8, 0xc0_u8, 0x9c_u8, 0x40_u8, 0x7a_u8, 0xd8_u8, 0x12_u8]), 100_u32)
  PKEY_Contact_PrimaryEmailAddress = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x176dc63c_u32, 0x2688_u16, 0x4e89_u16, StaticArray[0x81_u8, 0x43_u8, 0xa3_u8, 0x47_u8, 0x80_u8, 0xf_u8, 0x25_u8, 0xe9_u8]), 48_u32)
  PKEY_Contact_PrimaryTelephone = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x176dc63c_u32, 0x2688_u16, 0x4e89_u16, StaticArray[0x81_u8, 0x43_u8, 0xa3_u8, 0x47_u8, 0x80_u8, 0xf_u8, 0x25_u8, 0xe9_u8]), 25_u32)
  PKEY_Contact_Profession = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7268af55_u32, 0x1ce4_u16, 0x4f6e_u16, StaticArray[0xa4_u8, 0x1f_u8, 0xb6_u8, 0xe4_u8, 0xef_u8, 0x10_u8, 0xe4_u8, 0xa9_u8]), 100_u32)
  PKEY_Contact_SpouseName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9d2408b6_u32, 0x3167_u16, 0x422b_u16, StaticArray[0x82_u8, 0xb0_u8, 0xf5_u8, 0x83_u8, 0xb7_u8, 0xa7_u8, 0xcf_u8, 0xe3_u8]), 100_u32)
  PKEY_Contact_Suffix = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x176dc63c_u32, 0x2688_u16, 0x4e89_u16, StaticArray[0x81_u8, 0x43_u8, 0xa3_u8, 0x47_u8, 0x80_u8, 0xf_u8, 0x25_u8, 0xe9_u8]), 73_u32)
  PKEY_Contact_TelexNumber = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc554493c_u32, 0xc1f7_u16, 0x40c1_u16, StaticArray[0xa7_u8, 0x6c_u8, 0xef_u8, 0x8c_u8, 0x6_u8, 0x14_u8, 0x0_u8, 0x3e_u8]), 100_u32)
  PKEY_Contact_TTYTDDTelephone = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xaaf16bac_u32, 0x2b55_u16, 0x45e6_u16, StaticArray[0x9f_u8, 0x6d_u8, 0x41_u8, 0x5e_u8, 0xb9_u8, 0x49_u8, 0x10_u8, 0xdf_u8]), 100_u32)
  PKEY_Contact_WebPage = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe3e0584c_u32, 0xb788_u16, 0x4a5a_u16, StaticArray[0xbb_u8, 0x20_u8, 0x7f_u8, 0x5a_u8, 0x44_u8, 0xc9_u8, 0xac_u8, 0xdd_u8]), 18_u32)
  PKEY_Contact_Webpage2 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 124_u32)
  PKEY_Contact_Webpage3 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf63dd8_u32, 0x22bd_u16, 0x4a5d_u16, StaticArray[0xba_u8, 0x34_u8, 0x5c_u8, 0xb0_u8, 0xb9_u8, 0xbd_u8, 0xcb_u8, 0x3_u8]), 125_u32)
  PKEY_AcquisitionID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x65a98875_u32, 0x3c80_u16, 0x40ab_u16, StaticArray[0xab_u8, 0xbc_u8, 0xef_u8, 0xda_u8, 0xf7_u8, 0x7d_u8, 0xbe_u8, 0xe2_u8]), 100_u32)
  PKEY_ApplicationDefinedProperties = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcdbfc167_u32, 0x337e_u16, 0x41d8_u16, StaticArray[0xaf_u8, 0x7c_u8, 0x8c_u8, 0x9_u8, 0x20_u8, 0x54_u8, 0x29_u8, 0xc7_u8]), 100_u32)
  PKEY_ApplicationName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 18_u32)
  PKEY_AppZoneIdentifier = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x502cfeab_u32, 0x47eb_u16, 0x459c_u16, StaticArray[0xb9_u8, 0x60_u8, 0xe6_u8, 0xd8_u8, 0x72_u8, 0x8f_u8, 0x77_u8, 0x1_u8]), 102_u32)
  PKEY_Author = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 4_u32)
  PKEY_CachedFileUpdaterContentIdForConflictResolution = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfceff153_u32, 0xe839_u16, 0x4cf3_u16, StaticArray[0xa9_u8, 0xe7_u8, 0xea_u8, 0x22_u8, 0x83_u8, 0x20_u8, 0x94_u8, 0xb8_u8]), 114_u32)
  PKEY_CachedFileUpdaterContentIdForStream = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfceff153_u32, 0xe839_u16, 0x4cf3_u16, StaticArray[0xa9_u8, 0xe7_u8, 0xea_u8, 0x22_u8, 0x83_u8, 0x20_u8, 0x94_u8, 0xb8_u8]), 113_u32)
  PKEY_Capacity = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9b174b35_u32, 0x40ff_u16, 0x11d2_u16, StaticArray[0xa2_u8, 0x7e_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc3_u8, 0x8_u8, 0x71_u8]), 3_u32)
  PKEY_Category = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd5cdd502_u32, 0x2e9c_u16, 0x101b_u16, StaticArray[0x93_u8, 0x97_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2c_u8, 0xf9_u8, 0xae_u8]), 2_u32)
  PKEY_Comment = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 6_u32)
  PKEY_Company = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd5cdd502_u32, 0x2e9c_u16, 0x101b_u16, StaticArray[0x93_u8, 0x97_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2c_u8, 0xf9_u8, 0xae_u8]), 15_u32)
  PKEY_ComputerName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x28636aa6_u32, 0x953d_u16, 0x11d2_u16, StaticArray[0xb5_u8, 0xd6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x18_u8, 0xd0_u8]), 5_u32)
  PKEY_ContainedItems = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x28636aa6_u32, 0x953d_u16, 0x11d2_u16, StaticArray[0xb5_u8, 0xd6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x18_u8, 0xd0_u8]), 29_u32)
  PKEY_ContentId = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfceff153_u32, 0xe839_u16, 0x4cf3_u16, StaticArray[0xa9_u8, 0xe7_u8, 0xea_u8, 0x22_u8, 0x83_u8, 0x20_u8, 0x94_u8, 0xb8_u8]), 132_u32)
  PKEY_ContentStatus = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd5cdd502_u32, 0x2e9c_u16, 0x101b_u16, StaticArray[0x93_u8, 0x97_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2c_u8, 0xf9_u8, 0xae_u8]), 27_u32)
  PKEY_ContentType = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd5cdd502_u32, 0x2e9c_u16, 0x101b_u16, StaticArray[0x93_u8, 0x97_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2c_u8, 0xf9_u8, 0xae_u8]), 26_u32)
  PKEY_ContentUri = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfceff153_u32, 0xe839_u16, 0x4cf3_u16, StaticArray[0xa9_u8, 0xe7_u8, 0xea_u8, 0x22_u8, 0x83_u8, 0x20_u8, 0x94_u8, 0xb8_u8]), 131_u32)
  PKEY_Copyright = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 11_u32)
  PKEY_CreatorAppId = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc2ea046e_u32, 0x33c_u16, 0x4e91_u16, StaticArray[0xbd_u8, 0x5b_u8, 0xd4_u8, 0x94_u8, 0x2f_u8, 0x6b_u8, 0xbe_u8, 0x49_u8]), 2_u32)
  PKEY_CreatorOpenWithUIOptions = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc2ea046e_u32, 0x33c_u16, 0x4e91_u16, StaticArray[0xbd_u8, 0x5b_u8, 0xd4_u8, 0x94_u8, 0x2f_u8, 0x6b_u8, 0xbe_u8, 0x49_u8]), 3_u32)
  CREATOROPENWITHUIOPTION_HIDDEN = 0_u32
  CREATOROPENWITHUIOPTION_VISIBLE = 1_u32
  PKEY_DataObjectFormat = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1e81a3f8_u32, 0xa30f_u16, 0x4247_u16, StaticArray[0xb9_u8, 0xee_u8, 0x1d_u8, 0x3_u8, 0x68_u8, 0xa9_u8, 0x42_u8, 0x5c_u8]), 2_u32)
  PKEY_DateAccessed = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb725f130_u32, 0x47ef_u16, 0x101a_u16, StaticArray[0xa5_u8, 0xf1_u8, 0x2_u8, 0x60_u8, 0x8c_u8, 0x9e_u8, 0xeb_u8, 0xac_u8]), 16_u32)
  PKEY_DateAcquired = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2cbaa8f5_u32, 0xd81f_u16, 0x47ca_u16, StaticArray[0xb1_u8, 0x7a_u8, 0xf8_u8, 0xd8_u8, 0x22_u8, 0x30_u8, 0x1_u8, 0x31_u8]), 100_u32)
  PKEY_DateArchived = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x43f8d7b7_u32, 0xa444_u16, 0x4f87_u16, StaticArray[0x93_u8, 0x83_u8, 0x52_u8, 0x27_u8, 0x1c_u8, 0x9b_u8, 0x91_u8, 0x5c_u8]), 100_u32)
  PKEY_DateCompleted = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x72fab781_u32, 0xacda_u16, 0x43e5_u16, StaticArray[0xb1_u8, 0x55_u8, 0xb2_u8, 0x43_u8, 0x4f_u8, 0x85_u8, 0xe6_u8, 0x78_u8]), 100_u32)
  PKEY_DateCreated = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb725f130_u32, 0x47ef_u16, 0x101a_u16, StaticArray[0xa5_u8, 0xf1_u8, 0x2_u8, 0x60_u8, 0x8c_u8, 0x9e_u8, 0xeb_u8, 0xac_u8]), 15_u32)
  PKEY_DateImported = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 18258_u32)
  PKEY_DateModified = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb725f130_u32, 0x47ef_u16, 0x101a_u16, StaticArray[0xa5_u8, 0xf1_u8, 0x2_u8, 0x60_u8, 0x8c_u8, 0x9e_u8, 0xeb_u8, 0xac_u8]), 14_u32)
  PKEY_DefaultSaveLocationDisplay = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x5d76b67f_u32, 0x9b3d_u16, 0x44bb_u16, StaticArray[0xb6_u8, 0xae_u8, 0x25_u8, 0xda_u8, 0x4f_u8, 0x63_u8, 0x8a_u8, 0x67_u8]), 10_u32)
  ISDEFAULTSAVE_NONE = 0_u32
  ISDEFAULTSAVE_OWNER = 1_u32
  ISDEFAULTSAVE_NONOWNER = 2_u32
  ISDEFAULTSAVE_BOTH = 3_u32
  PKEY_DueDate = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x3f8472b5_u32, 0xe0af_u16, 0x4db2_u16, StaticArray[0x80_u8, 0x71_u8, 0xc5_u8, 0x3f_u8, 0xe7_u8, 0x6a_u8, 0xe7_u8, 0xce_u8]), 100_u32)
  PKEY_EndDate = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc75faa05_u32, 0x96fd_u16, 0x49e7_u16, StaticArray[0x9c_u8, 0xb4_u8, 0x9f_u8, 0x60_u8, 0x10_u8, 0x82_u8, 0xd5_u8, 0x53_u8]), 100_u32)
  PKEY_ExpandoProperties = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6fa20de6_u32, 0xd11c_u16, 0x4d9d_u16, StaticArray[0xa1_u8, 0x54_u8, 0x64_u8, 0x31_u8, 0x76_u8, 0x28_u8, 0xc1_u8, 0x2d_u8]), 100_u32)
  PKEY_FileAllocationSize = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb725f130_u32, 0x47ef_u16, 0x101a_u16, StaticArray[0xa5_u8, 0xf1_u8, 0x2_u8, 0x60_u8, 0x8c_u8, 0x9e_u8, 0xeb_u8, 0xac_u8]), 18_u32)
  PKEY_FileAttributes = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb725f130_u32, 0x47ef_u16, 0x101a_u16, StaticArray[0xa5_u8, 0xf1_u8, 0x2_u8, 0x60_u8, 0x8c_u8, 0x9e_u8, 0xeb_u8, 0xac_u8]), 13_u32)
  PKEY_FileCount = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x28636aa6_u32, 0x953d_u16, 0x11d2_u16, StaticArray[0xb5_u8, 0xd6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x18_u8, 0xd0_u8]), 12_u32)
  PKEY_FileDescription = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcef7d53_u32, 0xfa64_u16, 0x11d1_u16, StaticArray[0xa2_u8, 0x3_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x1f_u8, 0xed_u8, 0xee_u8]), 3_u32)
  PKEY_FileExtension = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe4f10a3c_u32, 0x49e6_u16, 0x405d_u16, StaticArray[0x82_u8, 0x88_u8, 0xa2_u8, 0x3b_u8, 0xd4_u8, 0xee_u8, 0xaa_u8, 0x6c_u8]), 100_u32)
  PKEY_FileFRN = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb725f130_u32, 0x47ef_u16, 0x101a_u16, StaticArray[0xa5_u8, 0xf1_u8, 0x2_u8, 0x60_u8, 0x8c_u8, 0x9e_u8, 0xeb_u8, 0xac_u8]), 21_u32)
  PKEY_FileName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x41cf5ae0_u32, 0xf75a_u16, 0x4806_u16, StaticArray[0xbd_u8, 0x87_u8, 0x59_u8, 0xc7_u8, 0xd9_u8, 0x24_u8, 0x8e_u8, 0xb9_u8]), 100_u32)
  PKEY_FileOfflineAvailabilityStatus = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfceff153_u32, 0xe839_u16, 0x4cf3_u16, StaticArray[0xa9_u8, 0xe7_u8, 0xea_u8, 0x22_u8, 0x83_u8, 0x20_u8, 0x94_u8, 0xb8_u8]), 100_u32)
  FILEOFFLINEAVAILABILITYSTATUS_NOTAVAILABLEOFFLINE = 0_u32
  FILEOFFLINEAVAILABILITYSTATUS_PARTIAL = 1_u32
  FILEOFFLINEAVAILABILITYSTATUS_COMPLETE = 2_u32
  FILEOFFLINEAVAILABILITYSTATUS_COMPLETE_PINNED = 3_u32
  FILEOFFLINEAVAILABILITYSTATUS_EXCLUDED = 4_u32
  FILEOFFLINEAVAILABILITYSTATUS_FOLDER_EMPTY = 5_u32
  PKEY_FileOwner = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9b174b34_u32, 0x40ff_u16, 0x11d2_u16, StaticArray[0xa2_u8, 0x7e_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc3_u8, 0x8_u8, 0x71_u8]), 4_u32)
  PKEY_FilePlaceholderStatus = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb2f9b9d6_u32, 0xfec4_u16, 0x4dd5_u16, StaticArray[0x94_u8, 0xd7_u8, 0x89_u8, 0x57_u8, 0x48_u8, 0x8c_u8, 0x80_u8, 0x7b_u8]), 2_u32)
  PKEY_FileVersion = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcef7d53_u32, 0xfa64_u16, 0x11d1_u16, StaticArray[0xa2_u8, 0x3_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x1f_u8, 0xed_u8, 0xee_u8]), 4_u32)
  PKEY_FindData = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x28636aa6_u32, 0x953d_u16, 0x11d2_u16, StaticArray[0xb5_u8, 0xd6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x18_u8, 0xd0_u8]), 0_u32)
  PKEY_FlagColor = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x67df94de_u32, 0xca7_u16, 0x4d6f_u16, StaticArray[0xb7_u8, 0x92_u8, 0x5_u8, 0x3a_u8, 0x3e_u8, 0x4f_u8, 0x3_u8, 0xcf_u8]), 100_u32)
  PKEY_FlagColorText = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x45eae747_u32, 0x8e2a_u16, 0x40ae_u16, StaticArray[0x8c_u8, 0xbf_u8, 0xca_u8, 0x52_u8, 0xab_u8, 0xa6_u8, 0x15_u8, 0x2a_u8]), 100_u32)
  PKEY_FlagStatus = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe3e0584c_u32, 0xb788_u16, 0x4a5a_u16, StaticArray[0xbb_u8, 0x20_u8, 0x7f_u8, 0x5a_u8, 0x44_u8, 0xc9_u8, 0xac_u8, 0xdd_u8]), 12_u32)
  FLAGSTATUS_NOTFLAGGED = 0_i32
  FLAGSTATUS_COMPLETED = 1_i32
  FLAGSTATUS_FOLLOWUP = 2_i32
  PKEY_FlagStatusText = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xdc54fd2e_u32, 0x189d_u16, 0x4871_u16, StaticArray[0xaa_u8, 0x1_u8, 0x8_u8, 0xc2_u8, 0xf5_u8, 0x7a_u8, 0x4a_u8, 0xbc_u8]), 100_u32)
  PKEY_FolderKind = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfceff153_u32, 0xe839_u16, 0x4cf3_u16, StaticArray[0xa9_u8, 0xe7_u8, 0xea_u8, 0x22_u8, 0x83_u8, 0x20_u8, 0x94_u8, 0xb8_u8]), 101_u32)
  PKEY_FolderNameDisplay = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb725f130_u32, 0x47ef_u16, 0x101a_u16, StaticArray[0xa5_u8, 0xf1_u8, 0x2_u8, 0x60_u8, 0x8c_u8, 0x9e_u8, 0xeb_u8, 0xac_u8]), 25_u32)
  PKEY_FreeSpace = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9b174b35_u32, 0x40ff_u16, 0x11d2_u16, StaticArray[0xa2_u8, 0x7e_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc3_u8, 0x8_u8, 0x71_u8]), 2_u32)
  PKEY_FullText = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1e3ee840_u32, 0xbc2b_u16, 0x476c_u16, StaticArray[0x82_u8, 0x37_u8, 0x2a_u8, 0xcd_u8, 0x1a_u8, 0x83_u8, 0x9b_u8, 0x22_u8]), 6_u32)
  PKEY_HighKeywords = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 24_u32)
  PKEY_Identity = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa26f4afc_u32, 0x7346_u16, 0x4299_u16, StaticArray[0xbe_u8, 0x47_u8, 0xeb_u8, 0x1a_u8, 0xe6_u8, 0x13_u8, 0x13_u8, 0x9f_u8]), 100_u32)
  PKEY_Identity_Blob = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x8c3b93a4_u32, 0xbaed_u16, 0x1a83_u16, StaticArray[0x9a_u8, 0x32_u8, 0x10_u8, 0x2e_u8, 0xe3_u8, 0x13_u8, 0xf6_u8, 0xeb_u8]), 100_u32)
  PKEY_Identity_DisplayName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7d683fc9_u32, 0xd155_u16, 0x45a8_u16, StaticArray[0xbb_u8, 0x1f_u8, 0x89_u8, 0xd1_u8, 0x9b_u8, 0xcb_u8, 0x79_u8, 0x2f_u8]), 100_u32)
  PKEY_Identity_InternetSid = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6d6d5d49_u32, 0x265d_u16, 0x4688_u16, StaticArray[0x9f_u8, 0x4e_u8, 0x1f_u8, 0xdd_u8, 0x33_u8, 0xe7_u8, 0xcc_u8, 0x83_u8]), 100_u32)
  PKEY_Identity_IsMeIdentity = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa4108708_u32, 0x9df_u16, 0x4377_u16, StaticArray[0x9d_u8, 0xfc_u8, 0x6d_u8, 0x99_u8, 0x98_u8, 0x6d_u8, 0x5a_u8, 0x67_u8]), 100_u32)
  PKEY_Identity_KeyProviderContext = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa26f4afc_u32, 0x7346_u16, 0x4299_u16, StaticArray[0xbe_u8, 0x47_u8, 0xeb_u8, 0x1a_u8, 0xe6_u8, 0x13_u8, 0x13_u8, 0x9f_u8]), 17_u32)
  PKEY_Identity_KeyProviderName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa26f4afc_u32, 0x7346_u16, 0x4299_u16, StaticArray[0xbe_u8, 0x47_u8, 0xeb_u8, 0x1a_u8, 0xe6_u8, 0x13_u8, 0x13_u8, 0x9f_u8]), 16_u32)
  PKEY_Identity_LogonStatusString = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf18dedf3_u32, 0x337f_u16, 0x42c0_u16, StaticArray[0x9e_u8, 0x3_u8, 0xce_u8, 0xe0_u8, 0x87_u8, 0x8_u8, 0xa8_u8, 0xc3_u8]), 100_u32)
  PKEY_Identity_PrimaryEmailAddress = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfcc16823_u32, 0xbaed_u16, 0x4f24_u16, StaticArray[0x9b_u8, 0x32_u8, 0xa0_u8, 0x98_u8, 0x21_u8, 0x17_u8, 0xf7_u8, 0xfa_u8]), 100_u32)
  PKEY_Identity_PrimarySid = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2b1b801e_u32, 0xc0c1_u16, 0x4987_u16, StaticArray[0x9e_u8, 0xc5_u8, 0x72_u8, 0xfa_u8, 0x89_u8, 0x81_u8, 0x47_u8, 0x87_u8]), 100_u32)
  PKEY_Identity_ProviderData = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa8a74b92_u32, 0x361b_u16, 0x4e9a_u16, StaticArray[0xb7_u8, 0x22_u8, 0x7c_u8, 0x4a_u8, 0x73_u8, 0x30_u8, 0xa3_u8, 0x12_u8]), 100_u32)
  PKEY_Identity_ProviderID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x74a7de49_u32, 0xfa11_u16, 0x4d3d_u16, StaticArray[0xa0_u8, 0x6_u8, 0xdb_u8, 0x7e_u8, 0x8_u8, 0x67_u8, 0x59_u8, 0x16_u8]), 100_u32)
  PKEY_Identity_QualifiedUserName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xda520e51_u32, 0xf4e9_u16, 0x4739_u16, StaticArray[0xac_u8, 0x82_u8, 0x2_u8, 0xe0_u8, 0xa9_u8, 0x5c_u8, 0x90_u8, 0x30_u8]), 100_u32)
  PKEY_Identity_UniqueID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe55fc3b0_u32, 0x2b60_u16, 0x4220_u16, StaticArray[0x91_u8, 0x8e_u8, 0xb2_u8, 0x1e_u8, 0x8b_u8, 0xf1_u8, 0x60_u8, 0x16_u8]), 100_u32)
  PKEY_Identity_UserName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc4322503_u32, 0x78ca_u16, 0x49c6_u16, StaticArray[0x9a_u8, 0xcc_u8, 0xa6_u8, 0x8e_u8, 0x2a_u8, 0xfd_u8, 0x7b_u8, 0x6b_u8]), 100_u32)
  PKEY_IdentityProvider_Name = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb96eff7b_u32, 0x35ca_u16, 0x4a35_u16, StaticArray[0x86_u8, 0x7_u8, 0x29_u8, 0xe3_u8, 0xa5_u8, 0x4c_u8, 0x46_u8, 0xea_u8]), 100_u32)
  PKEY_IdentityProvider_Picture = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2425166f_u32, 0x5642_u16, 0x4864_u16, StaticArray[0x99_u8, 0x2f_u8, 0x98_u8, 0xfd_u8, 0x98_u8, 0xf2_u8, 0x94_u8, 0xc3_u8]), 100_u32)
  PKEY_ImageParsingName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd7750ee0_u32, 0xc6a4_u16, 0x48ec_u16, StaticArray[0xb5_u8, 0x3e_u8, 0xb8_u8, 0x7b_u8, 0x52_u8, 0xe6_u8, 0xd0_u8, 0x73_u8]), 100_u32)
  PKEY_Importance = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe3e0584c_u32, 0xb788_u16, 0x4a5a_u16, StaticArray[0xbb_u8, 0x20_u8, 0x7f_u8, 0x5a_u8, 0x44_u8, 0xc9_u8, 0xac_u8, 0xdd_u8]), 11_u32)
  IMPORTANCE_LOW_MIN = 0_i32
  IMPORTANCE_LOW_SET = 1_i32
  IMPORTANCE_LOW_MAX = 1_i32
  IMPORTANCE_NORMAL_MIN = 2_i32
  IMPORTANCE_NORMAL_SET = 3_i32
  IMPORTANCE_NORMAL_MAX = 4_i32
  IMPORTANCE_HIGH_MIN = 5_i32
  IMPORTANCE_HIGH_SET = 5_i32
  IMPORTANCE_HIGH_MAX = 5_i32
  PKEY_ImportanceText = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa3b29791_u32, 0x7713_u16, 0x4e1d_u16, StaticArray[0xbb_u8, 0x40_u8, 0x17_u8, 0xdb_u8, 0x85_u8, 0xf0_u8, 0x18_u8, 0x31_u8]), 100_u32)
  PKEY_IsAttachment = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf23f425c_u32, 0x71a1_u16, 0x4fa8_u16, StaticArray[0x92_u8, 0x2f_u8, 0x67_u8, 0x8e_u8, 0xa4_u8, 0xa6_u8, 0x4_u8, 0x8_u8]), 100_u32)
  PKEY_IsDefaultNonOwnerSaveLocation = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x5d76b67f_u32, 0x9b3d_u16, 0x44bb_u16, StaticArray[0xb6_u8, 0xae_u8, 0x25_u8, 0xda_u8, 0x4f_u8, 0x63_u8, 0x8a_u8, 0x67_u8]), 5_u32)
  PKEY_IsDefaultSaveLocation = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x5d76b67f_u32, 0x9b3d_u16, 0x44bb_u16, StaticArray[0xb6_u8, 0xae_u8, 0x25_u8, 0xda_u8, 0x4f_u8, 0x63_u8, 0x8a_u8, 0x67_u8]), 3_u32)
  PKEY_IsDeleted = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x5cda5fc8_u32, 0x33ee_u16, 0x4ff3_u16, StaticArray[0x90_u8, 0x94_u8, 0xae_u8, 0x7b_u8, 0xd8_u8, 0x86_u8, 0x8c_u8, 0x4d_u8]), 100_u32)
  PKEY_IsEncrypted = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x90e5e14e_u32, 0x648b_u16, 0x4826_u16, StaticArray[0xb2_u8, 0xaa_u8, 0xac_u8, 0xaf_u8, 0x79_u8, 0xe_u8, 0x35_u8, 0x13_u8]), 10_u32)
  PKEY_IsFlagged = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x5da84765_u32, 0xe3ff_u16, 0x4278_u16, StaticArray[0x86_u8, 0xb0_u8, 0xa2_u8, 0x79_u8, 0x67_u8, 0xfb_u8, 0xdd_u8, 0x3_u8]), 100_u32)
  PKEY_IsFlaggedComplete = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa6f360d2_u32, 0x55f9_u16, 0x48de_u16, StaticArray[0xb9_u8, 0x9_u8, 0x62_u8, 0xe_u8, 0x9_u8, 0xa_u8, 0x64_u8, 0x7c_u8]), 100_u32)
  PKEY_IsIncomplete = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x346c8bd1_u32, 0x2e6a_u16, 0x4c45_u16, StaticArray[0x89_u8, 0xa4_u8, 0x61_u8, 0xb7_u8, 0x8e_u8, 0x8e_u8, 0x70_u8, 0xf_u8]), 100_u32)
  PKEY_IsLocationSupported = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x5d76b67f_u32, 0x9b3d_u16, 0x44bb_u16, StaticArray[0xb6_u8, 0xae_u8, 0x25_u8, 0xda_u8, 0x4f_u8, 0x63_u8, 0x8a_u8, 0x67_u8]), 8_u32)
  PKEY_IsPinnedToNameSpaceTree = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x5d76b67f_u32, 0x9b3d_u16, 0x44bb_u16, StaticArray[0xb6_u8, 0xae_u8, 0x25_u8, 0xda_u8, 0x4f_u8, 0x63_u8, 0x8a_u8, 0x67_u8]), 2_u32)
  PKEY_IsRead = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe3e0584c_u32, 0xb788_u16, 0x4a5a_u16, StaticArray[0xbb_u8, 0x20_u8, 0x7f_u8, 0x5a_u8, 0x44_u8, 0xc9_u8, 0xac_u8, 0xdd_u8]), 10_u32)
  PKEY_IsSearchOnlyItem = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x5d76b67f_u32, 0x9b3d_u16, 0x44bb_u16, StaticArray[0xb6_u8, 0xae_u8, 0x25_u8, 0xda_u8, 0x4f_u8, 0x63_u8, 0x8a_u8, 0x67_u8]), 4_u32)
  PKEY_IsSendToTarget = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x28636aa6_u32, 0x953d_u16, 0x11d2_u16, StaticArray[0xb5_u8, 0xd6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x18_u8, 0xd0_u8]), 33_u32)
  PKEY_IsShared = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef884c5b_u32, 0x2bfe_u16, 0x41bb_u16, StaticArray[0xaa_u8, 0xe5_u8, 0x76_u8, 0xee_u8, 0xdf_u8, 0x4f_u8, 0x99_u8, 0x2_u8]), 100_u32)
  PKEY_ItemAuthors = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd0a04f0a_u32, 0x462a_u16, 0x48a4_u16, StaticArray[0xbb_u8, 0x2f_u8, 0x37_u8, 0x6_u8, 0xe8_u8, 0x8d_u8, 0xbd_u8, 0x7d_u8]), 100_u32)
  PKEY_ItemClassType = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x48658ad_u32, 0x2db8_u16, 0x41a4_u16, StaticArray[0xbb_u8, 0xb6_u8, 0xac_u8, 0x1e_u8, 0xf1_u8, 0x20_u8, 0x7e_u8, 0xb1_u8]), 100_u32)
  PKEY_ItemDate = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf7db74b4_u32, 0x4287_u16, 0x4103_u16, StaticArray[0xaf_u8, 0xba_u8, 0xf1_u8, 0xb1_u8, 0x3d_u8, 0xcd_u8, 0x75_u8, 0xcf_u8]), 100_u32)
  PKEY_ItemFolderNameDisplay = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb725f130_u32, 0x47ef_u16, 0x101a_u16, StaticArray[0xa5_u8, 0xf1_u8, 0x2_u8, 0x60_u8, 0x8c_u8, 0x9e_u8, 0xeb_u8, 0xac_u8]), 2_u32)
  PKEY_ItemFolderPathDisplay = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe3e0584c_u32, 0xb788_u16, 0x4a5a_u16, StaticArray[0xbb_u8, 0x20_u8, 0x7f_u8, 0x5a_u8, 0x44_u8, 0xc9_u8, 0xac_u8, 0xdd_u8]), 6_u32)
  PKEY_ItemFolderPathDisplayNarrow = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xdabd30ed_u32, 0x43_u16, 0x4789_u16, StaticArray[0xa7_u8, 0xf8_u8, 0xd0_u8, 0x13_u8, 0xa4_u8, 0x73_u8, 0x66_u8, 0x22_u8]), 100_u32)
  PKEY_ItemName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6b8da074_u32, 0x3b5c_u16, 0x43bc_u16, StaticArray[0x88_u8, 0x6f_u8, 0xa_u8, 0x2c_u8, 0xdc_u8, 0xe0_u8, 0xb_u8, 0x6f_u8]), 100_u32)
  PKEY_ItemNameDisplay = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb725f130_u32, 0x47ef_u16, 0x101a_u16, StaticArray[0xa5_u8, 0xf1_u8, 0x2_u8, 0x60_u8, 0x8c_u8, 0x9e_u8, 0xeb_u8, 0xac_u8]), 10_u32)
  PKEY_ItemNameDisplayWithoutExtension = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb725f130_u32, 0x47ef_u16, 0x101a_u16, StaticArray[0xa5_u8, 0xf1_u8, 0x2_u8, 0x60_u8, 0x8c_u8, 0x9e_u8, 0xeb_u8, 0xac_u8]), 24_u32)
  PKEY_ItemNamePrefix = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd7313ff1_u32, 0xa77a_u16, 0x401c_u16, StaticArray[0x8c_u8, 0x99_u8, 0x3d_u8, 0xbd_u8, 0xd6_u8, 0x8a_u8, 0xdd_u8, 0x36_u8]), 100_u32)
  PKEY_ItemNameSortOverride = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb725f130_u32, 0x47ef_u16, 0x101a_u16, StaticArray[0xa5_u8, 0xf1_u8, 0x2_u8, 0x60_u8, 0x8c_u8, 0x9e_u8, 0xeb_u8, 0xac_u8]), 23_u32)
  PKEY_ItemParticipants = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd4d0aa16_u32, 0x9948_u16, 0x41a4_u16, StaticArray[0xaa_u8, 0x85_u8, 0xd9_u8, 0x7f_u8, 0xf9_u8, 0x64_u8, 0x69_u8, 0x93_u8]), 100_u32)
  PKEY_ItemPathDisplay = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe3e0584c_u32, 0xb788_u16, 0x4a5a_u16, StaticArray[0xbb_u8, 0x20_u8, 0x7f_u8, 0x5a_u8, 0x44_u8, 0xc9_u8, 0xac_u8, 0xdd_u8]), 7_u32)
  PKEY_ItemPathDisplayNarrow = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x28636aa6_u32, 0x953d_u16, 0x11d2_u16, StaticArray[0xb5_u8, 0xd6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x18_u8, 0xd0_u8]), 8_u32)
  PKEY_ItemSubType = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x28636aa6_u32, 0x953d_u16, 0x11d2_u16, StaticArray[0xb5_u8, 0xd6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x18_u8, 0xd0_u8]), 37_u32)
  PKEY_ItemType = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x28636aa6_u32, 0x953d_u16, 0x11d2_u16, StaticArray[0xb5_u8, 0xd6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x18_u8, 0xd0_u8]), 11_u32)
  PKEY_ItemTypeText = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb725f130_u32, 0x47ef_u16, 0x101a_u16, StaticArray[0xa5_u8, 0xf1_u8, 0x2_u8, 0x60_u8, 0x8c_u8, 0x9e_u8, 0xeb_u8, 0xac_u8]), 4_u32)
  PKEY_ItemUrl = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x49691c90_u32, 0x7e17_u16, 0x101a_u16, StaticArray[0xa9_u8, 0x1c_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2e_u8, 0xcd_u8, 0xa9_u8]), 9_u32)
  PKEY_Keywords = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 5_u32)
  PKEY_Kind = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1e3ee840_u32, 0xbc2b_u16, 0x476c_u16, StaticArray[0x82_u8, 0x37_u8, 0x2a_u8, 0xcd_u8, 0x1a_u8, 0x83_u8, 0x9b_u8, 0x22_u8]), 3_u32)
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
  PKEY_KindText = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf04bef95_u32, 0xc585_u16, 0x4197_u16, StaticArray[0xa2_u8, 0xb7_u8, 0xdf_u8, 0x46_u8, 0xfd_u8, 0xc9_u8, 0xee_u8, 0x6d_u8]), 100_u32)
  PKEY_Language = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd5cdd502_u32, 0x2e9c_u16, 0x101b_u16, StaticArray[0x93_u8, 0x97_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2c_u8, 0xf9_u8, 0xae_u8]), 28_u32)
  PKEY_LastSyncError = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfceff153_u32, 0xe839_u16, 0x4cf3_u16, StaticArray[0xa9_u8, 0xe7_u8, 0xea_u8, 0x22_u8, 0x83_u8, 0x20_u8, 0x94_u8, 0xb8_u8]), 107_u32)
  PKEY_LastSyncWarning = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfceff153_u32, 0xe839_u16, 0x4cf3_u16, StaticArray[0xa9_u8, 0xe7_u8, 0xea_u8, 0x22_u8, 0x83_u8, 0x20_u8, 0x94_u8, 0xb8_u8]), 128_u32)
  PKEY_LastWriterPackageFamilyName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x502cfeab_u32, 0x47eb_u16, 0x459c_u16, StaticArray[0xb9_u8, 0x60_u8, 0xe6_u8, 0xd8_u8, 0x72_u8, 0x8f_u8, 0x77_u8, 0x1_u8]), 101_u32)
  PKEY_LowKeywords = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 25_u32)
  PKEY_MediumKeywords = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 26_u32)
  PKEY_MileageInformation = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfdf84370_u32, 0x31a_u16, 0x4add_u16, StaticArray[0x9e_u8, 0x91_u8, 0xd_u8, 0x77_u8, 0x5f_u8, 0x1c_u8, 0x66_u8, 0x5_u8]), 100_u32)
  PKEY_MIMEType = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb63e350_u32, 0x9ccc_u16, 0x11d0_u16, StaticArray[0xbc_u8, 0xdb_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xcc_u8, 0xce_u8, 0x4_u8]), 5_u32)
  PKEY_Null = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8]), 0_u32)
  PKEY_OfflineAvailability = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa94688b6_u32, 0x7d9f_u16, 0x4570_u16, StaticArray[0xa6_u8, 0x48_u8, 0xe3_u8, 0xdf_u8, 0xc0_u8, 0xab_u8, 0x2b_u8, 0x3f_u8]), 100_u32)
  OFFLINEAVAILABILITY_NOT_AVAILABLE = 0_u32
  OFFLINEAVAILABILITY_AVAILABLE = 1_u32
  OFFLINEAVAILABILITY_ALWAYS_AVAILABLE = 2_u32
  PKEY_OfflineStatus = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6d24888f_u32, 0x4718_u16, 0x4bda_u16, StaticArray[0xaf_u8, 0xed_u8, 0xea_u8, 0xf_u8, 0xb4_u8, 0x38_u8, 0x6c_u8, 0xd8_u8]), 100_u32)
  OFFLINESTATUS_ONLINE = 0_u32
  OFFLINESTATUS_OFFLINE = 1_u32
  OFFLINESTATUS_OFFLINE_FORCED = 2_u32
  OFFLINESTATUS_OFFLINE_SLOW = 3_u32
  OFFLINESTATUS_OFFLINE_ERROR = 4_u32
  OFFLINESTATUS_OFFLINE_ITEM_VERSION_CONFLICT = 5_u32
  OFFLINESTATUS_OFFLINE_SUSPENDED = 6_u32
  PKEY_OriginalFileName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcef7d53_u32, 0xfa64_u16, 0x11d1_u16, StaticArray[0xa2_u8, 0x3_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x1f_u8, 0xed_u8, 0xee_u8]), 6_u32)
  PKEY_OwnerSID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x5d76b67f_u32, 0x9b3d_u16, 0x44bb_u16, StaticArray[0xb6_u8, 0xae_u8, 0x25_u8, 0xda_u8, 0x4f_u8, 0x63_u8, 0x8a_u8, 0x67_u8]), 6_u32)
  PKEY_ParentalRating = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 21_u32)
  PKEY_ParentalRatingReason = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x10984e0a_u32, 0xf9f2_u16, 0x4321_u16, StaticArray[0xb7_u8, 0xef_u8, 0xba_u8, 0xf1_u8, 0x95_u8, 0xaf_u8, 0x43_u8, 0x19_u8]), 100_u32)
  PKEY_ParentalRatingsOrganization = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7fe0840_u32, 0x1344_u16, 0x46f0_u16, StaticArray[0x8d_u8, 0x37_u8, 0x52_u8, 0xed_u8, 0x71_u8, 0x2a_u8, 0x4b_u8, 0xf9_u8]), 100_u32)
  PKEY_ParsingBindContext = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xdfb9a04d_u32, 0x362f_u16, 0x4ca3_u16, StaticArray[0xb3_u8, 0xb_u8, 0x2_u8, 0x54_u8, 0xb1_u8, 0x7b_u8, 0x5b_u8, 0x84_u8]), 100_u32)
  PKEY_ParsingName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x28636aa6_u32, 0x953d_u16, 0x11d2_u16, StaticArray[0xb5_u8, 0xd6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x18_u8, 0xd0_u8]), 24_u32)
  PKEY_ParsingPath = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x28636aa6_u32, 0x953d_u16, 0x11d2_u16, StaticArray[0xb5_u8, 0xd6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x18_u8, 0xd0_u8]), 30_u32)
  PKEY_PerceivedType = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x28636aa6_u32, 0x953d_u16, 0x11d2_u16, StaticArray[0xb5_u8, 0xd6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x18_u8, 0xd0_u8]), 9_u32)
  PKEY_PercentFull = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9b174b35_u32, 0x40ff_u16, 0x11d2_u16, StaticArray[0xa2_u8, 0x7e_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc3_u8, 0x8_u8, 0x71_u8]), 5_u32)
  PKEY_Priority = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9c1fcf74_u32, 0x2d97_u16, 0x41ba_u16, StaticArray[0xb4_u8, 0xae_u8, 0xcb_u8, 0x2e_u8, 0x36_u8, 0x61_u8, 0xa6_u8, 0xe4_u8]), 5_u32)
  PKEY_PriorityText = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd98be98b_u32, 0xb86b_u16, 0x4095_u16, StaticArray[0xbf_u8, 0x52_u8, 0x9d_u8, 0x23_u8, 0xb2_u8, 0xe0_u8, 0xa7_u8, 0x52_u8]), 100_u32)
  PKEY_Project = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x39a7f922_u32, 0x477c_u16, 0x48de_u16, StaticArray[0x8b_u8, 0xc8_u8, 0xb2_u8, 0x84_u8, 0x41_u8, 0xe3_u8, 0x42_u8, 0xe3_u8]), 100_u32)
  PKEY_ProviderItemID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf21d9941_u32, 0x81f0_u16, 0x471a_u16, StaticArray[0xad_u8, 0xee_u8, 0x4e_u8, 0x74_u8, 0xb4_u8, 0x92_u8, 0x17_u8, 0xed_u8]), 100_u32)
  PKEY_Rating = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 9_u32)
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
  PKEY_RatingText = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x90197ca7_u32, 0xfd8f_u16, 0x4e8c_u16, StaticArray[0x9d_u8, 0xa3_u8, 0xb5_u8, 0x7e_u8, 0x1e_u8, 0x60_u8, 0x92_u8, 0x95_u8]), 100_u32)
  PKEY_RemoteConflictingFile = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfceff153_u32, 0xe839_u16, 0x4cf3_u16, StaticArray[0xa9_u8, 0xe7_u8, 0xea_u8, 0x22_u8, 0x83_u8, 0x20_u8, 0x94_u8, 0xb8_u8]), 115_u32)
  PKEY_Security_AllowedEnterpriseDataProtectionIdentities = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x38d43380_u32, 0xd418_u16, 0x4830_u16, StaticArray[0x84_u8, 0xd5_u8, 0x46_u8, 0x93_u8, 0x5a_u8, 0x81_u8, 0xc5_u8, 0xc6_u8]), 32_u32)
  PKEY_Security_EncryptionOwners = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x5f5aff6a_u32, 0x37e5_u16, 0x4780_u16, StaticArray[0x97_u8, 0xea_u8, 0x80_u8, 0xc7_u8, 0x56_u8, 0x5c_u8, 0xf5_u8, 0x35_u8]), 34_u32)
  PKEY_Security_EncryptionOwnersDisplay = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xde621b8f_u32, 0xe125_u16, 0x43a3_u16, StaticArray[0xa3_u8, 0x2d_u8, 0x56_u8, 0x65_u8, 0x44_u8, 0x6d_u8, 0x63_u8, 0x2a_u8]), 25_u32)
  PKEY_Sensitivity = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf8d3f6ac_u32, 0x4874_u16, 0x42cb_u16, StaticArray[0xbe_u8, 0x59_u8, 0xab_u8, 0x45_u8, 0x4b_u8, 0x30_u8, 0x71_u8, 0x6a_u8]), 100_u32)
  PKEY_SensitivityText = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd0c7f054_u32, 0x3f72_u16, 0x4725_u16, StaticArray[0x85_u8, 0x27_u8, 0x12_u8, 0x9a_u8, 0x57_u8, 0x7c_u8, 0xb2_u8, 0x69_u8]), 100_u32)
  PKEY_SFGAOFlags = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x28636aa6_u32, 0x953d_u16, 0x11d2_u16, StaticArray[0xb5_u8, 0xd6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x18_u8, 0xd0_u8]), 25_u32)
  PKEY_SharedWith = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef884c5b_u32, 0x2bfe_u16, 0x41bb_u16, StaticArray[0xaa_u8, 0xe5_u8, 0x76_u8, 0xee_u8, 0xdf_u8, 0x4f_u8, 0x99_u8, 0x2_u8]), 200_u32)
  PKEY_ShareUserRating = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 12_u32)
  PKEY_SharingStatus = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef884c5b_u32, 0x2bfe_u16, 0x41bb_u16, StaticArray[0xaa_u8, 0xe5_u8, 0x76_u8, 0xee_u8, 0xdf_u8, 0x4f_u8, 0x99_u8, 0x2_u8]), 300_u32)
  SHARINGSTATUS_NOTSHARED = 0_u32
  SHARINGSTATUS_SHARED = 1_u32
  SHARINGSTATUS_PRIVATE = 2_u32
  PKEY_Shell_OmitFromView = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xde35258c_u32, 0xc695_u16, 0x4cbc_u16, StaticArray[0xb9_u8, 0x82_u8, 0x38_u8, 0xb0_u8, 0xad_u8, 0x24_u8, 0xce_u8, 0xd0_u8]), 2_u32)
  PKEY_SimpleRating = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa09f084e_u32, 0xad41_u16, 0x489f_u16, StaticArray[0x80_u8, 0x76_u8, 0xaa_u8, 0x5b_u8, 0xe3_u8, 0x8_u8, 0x2b_u8, 0xca_u8]), 100_u32)
  PKEY_Size = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb725f130_u32, 0x47ef_u16, 0x101a_u16, StaticArray[0xa5_u8, 0xf1_u8, 0x2_u8, 0x60_u8, 0x8c_u8, 0x9e_u8, 0xeb_u8, 0xac_u8]), 12_u32)
  PKEY_SoftwareUsed = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 305_u32)
  PKEY_SourceItem = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x668cdfa5_u32, 0x7a1b_u16, 0x4323_u16, StaticArray[0xae_u8, 0x4b_u8, 0xe5_u8, 0x27_u8, 0x39_u8, 0x3a_u8, 0x1d_u8, 0x81_u8]), 100_u32)
  PKEY_SourcePackageFamilyName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xffae9db7_u32, 0x1c8d_u16, 0x43ff_u16, StaticArray[0x81_u8, 0x8c_u8, 0x84_u8, 0x40_u8, 0x3a_u8, 0xa3_u8, 0x73_u8, 0x2d_u8]), 100_u32)
  PKEY_StartDate = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x48fd6ec8_u32, 0x8a12_u16, 0x4cdf_u16, StaticArray[0xa0_u8, 0x3e_u8, 0x4e_u8, 0xc5_u8, 0xa5_u8, 0x11_u8, 0xed_u8, 0xde_u8]), 100_u32)
  PKEY_Status = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x214a1_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8]), 9_u32)
  PKEY_StorageProviderCallerVersionInformation = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb2f9b9d6_u32, 0xfec4_u16, 0x4dd5_u16, StaticArray[0x94_u8, 0xd7_u8, 0x89_u8, 0x57_u8, 0x48_u8, 0x8c_u8, 0x80_u8, 0x7b_u8]), 7_u32)
  PKEY_StorageProviderCustomPrimaryIcon = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb2f9b9d6_u32, 0xfec4_u16, 0x4dd5_u16, StaticArray[0x94_u8, 0xd7_u8, 0x89_u8, 0x57_u8, 0x48_u8, 0x8c_u8, 0x80_u8, 0x7b_u8]), 12_u32)
  STORAGEPROVIDERCUSTOM_ICON_PHONE = 0_u32
  PKEY_StorageProviderError = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfceff153_u32, 0xe839_u16, 0x4cf3_u16, StaticArray[0xa9_u8, 0xe7_u8, 0xea_u8, 0x22_u8, 0x83_u8, 0x20_u8, 0x94_u8, 0xb8_u8]), 109_u32)
  PKEY_StorageProviderFileChecksum = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb2f9b9d6_u32, 0xfec4_u16, 0x4dd5_u16, StaticArray[0x94_u8, 0xd7_u8, 0x89_u8, 0x57_u8, 0x48_u8, 0x8c_u8, 0x80_u8, 0x7b_u8]), 5_u32)
  PKEY_StorageProviderFileCreatedBy = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb2f9b9d6_u32, 0xfec4_u16, 0x4dd5_u16, StaticArray[0x94_u8, 0xd7_u8, 0x89_u8, 0x57_u8, 0x48_u8, 0x8c_u8, 0x80_u8, 0x7b_u8]), 10_u32)
  PKEY_StorageProviderFileDateShared = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb2f9b9d6_u32, 0xfec4_u16, 0x4dd5_u16, StaticArray[0x94_u8, 0xd7_u8, 0x89_u8, 0x57_u8, 0x48_u8, 0x8c_u8, 0x80_u8, 0x7b_u8]), 14_u32)
  PKEY_StorageProviderFileFlags = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb2f9b9d6_u32, 0xfec4_u16, 0x4dd5_u16, StaticArray[0x94_u8, 0xd7_u8, 0x89_u8, 0x57_u8, 0x48_u8, 0x8c_u8, 0x80_u8, 0x7b_u8]), 8_u32)
  PKEY_StorageProviderFileHasConflict = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb2f9b9d6_u32, 0xfec4_u16, 0x4dd5_u16, StaticArray[0x94_u8, 0xd7_u8, 0x89_u8, 0x57_u8, 0x48_u8, 0x8c_u8, 0x80_u8, 0x7b_u8]), 9_u32)
  PKEY_StorageProviderFileIdentifier = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb2f9b9d6_u32, 0xfec4_u16, 0x4dd5_u16, StaticArray[0x94_u8, 0xd7_u8, 0x89_u8, 0x57_u8, 0x48_u8, 0x8c_u8, 0x80_u8, 0x7b_u8]), 3_u32)
  PKEY_StorageProviderFileModifiedBy = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb2f9b9d6_u32, 0xfec4_u16, 0x4dd5_u16, StaticArray[0x94_u8, 0xd7_u8, 0x89_u8, 0x57_u8, 0x48_u8, 0x8c_u8, 0x80_u8, 0x7b_u8]), 11_u32)
  PKEY_StorageProviderFileRemoteLocation = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb2f9b9d6_u32, 0xfec4_u16, 0x4dd5_u16, StaticArray[0x94_u8, 0xd7_u8, 0x89_u8, 0x57_u8, 0x48_u8, 0x8c_u8, 0x80_u8, 0x7b_u8]), 16_u32)
  PKEY_StorageProviderFileRemoteUri = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfceff153_u32, 0xe839_u16, 0x4cf3_u16, StaticArray[0xa9_u8, 0xe7_u8, 0xea_u8, 0x22_u8, 0x83_u8, 0x20_u8, 0x94_u8, 0xb8_u8]), 112_u32)
  PKEY_StorageProviderFileSharedBy = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb2f9b9d6_u32, 0xfec4_u16, 0x4dd5_u16, StaticArray[0x94_u8, 0xd7_u8, 0x89_u8, 0x57_u8, 0x48_u8, 0x8c_u8, 0x80_u8, 0x7b_u8]), 15_u32)
  PKEY_StorageProviderFileVersion = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb2f9b9d6_u32, 0xfec4_u16, 0x4dd5_u16, StaticArray[0x94_u8, 0xd7_u8, 0x89_u8, 0x57_u8, 0x48_u8, 0x8c_u8, 0x80_u8, 0x7b_u8]), 4_u32)
  PKEY_StorageProviderFileVersionWaterline = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb2f9b9d6_u32, 0xfec4_u16, 0x4dd5_u16, StaticArray[0x94_u8, 0xd7_u8, 0x89_u8, 0x57_u8, 0x48_u8, 0x8c_u8, 0x80_u8, 0x7b_u8]), 6_u32)
  PKEY_StorageProviderFullyQualifiedId = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfceff153_u32, 0xe839_u16, 0x4cf3_u16, StaticArray[0xa9_u8, 0xe7_u8, 0xea_u8, 0x22_u8, 0x83_u8, 0x20_u8, 0x94_u8, 0xb8_u8]), 119_u32)
  PKEY_StorageProviderId = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfceff153_u32, 0xe839_u16, 0x4cf3_u16, StaticArray[0xa9_u8, 0xe7_u8, 0xea_u8, 0x22_u8, 0x83_u8, 0x20_u8, 0x94_u8, 0xb8_u8]), 108_u32)
  PKEY_StorageProviderShareStatuses = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfceff153_u32, 0xe839_u16, 0x4cf3_u16, StaticArray[0xa9_u8, 0xe7_u8, 0xea_u8, 0x22_u8, 0x83_u8, 0x20_u8, 0x94_u8, 0xb8_u8]), 111_u32)
  STORAGE_PROVIDER_SHARE_STATUS_PRIVATE = "Private"
  STORAGE_PROVIDER_SHARE_STATUS_SHARED = "Shared"
  STORAGE_PROVIDER_SHARE_STATUS_PUBLIC = "Public"
  STORAGE_PROVIDER_SHARE_STATUS_GROUP = "Group"
  STORAGE_PROVIDER_SHARE_STATUS_OWNER = "Owner"
  PKEY_StorageProviderSharingStatus = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfceff153_u32, 0xe839_u16, 0x4cf3_u16, StaticArray[0xa9_u8, 0xe7_u8, 0xea_u8, 0x22_u8, 0x83_u8, 0x20_u8, 0x94_u8, 0xb8_u8]), 117_u32)
  STORAGE_PROVIDER_SHARINGSTATUS_NOTSHARED = 0_u32
  STORAGE_PROVIDER_SHARINGSTATUS_SHARED = 1_u32
  STORAGE_PROVIDER_SHARINGSTATUS_PRIVATE = 2_u32
  STORAGE_PROVIDER_SHARINGSTATUS_PUBLIC = 3_u32
  STORAGE_PROVIDER_SHARINGSTATUS_SHARED_OWNED = 4_u32
  STORAGE_PROVIDER_SHARINGSTATUS_SHARED_COOWNED = 5_u32
  STORAGE_PROVIDER_SHARINGSTATUS_PUBLIC_OWNED = 6_u32
  STORAGE_PROVIDER_SHARINGSTATUS_PUBLIC_COOWNED = 7_u32
  PKEY_StorageProviderStatus = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfceff153_u32, 0xe839_u16, 0x4cf3_u16, StaticArray[0xa9_u8, 0xe7_u8, 0xea_u8, 0x22_u8, 0x83_u8, 0x20_u8, 0x94_u8, 0xb8_u8]), 110_u32)
  PKEY_StorageProviderUserAccountKind = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb2f9b9d6_u32, 0xfec4_u16, 0x4dd5_u16, StaticArray[0x94_u8, 0xd7_u8, 0x89_u8, 0x57_u8, 0x48_u8, 0x8c_u8, 0x80_u8, 0x7b_u8]), 17_u32)
  STORAGEPROVIDERUSERACCOUNTKIND_UNKNOWN = 0_u32
  STORAGEPROVIDERUSERACCOUNTKIND_CONSUMER = 1_u32
  STORAGEPROVIDERUSERACCOUNTKIND_BUSINESS = 2_u32
  PKEY_StorageProviderUserId = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb2f9b9d6_u32, 0xfec4_u16, 0x4dd5_u16, StaticArray[0x94_u8, 0xd7_u8, 0x89_u8, 0x57_u8, 0x48_u8, 0x8c_u8, 0x80_u8, 0x7b_u8]), 13_u32)
  PKEY_Subject = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 3_u32)
  PKEY_SyncTransferStatus = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfceff153_u32, 0xe839_u16, 0x4cf3_u16, StaticArray[0xa9_u8, 0xe7_u8, 0xea_u8, 0x22_u8, 0x83_u8, 0x20_u8, 0x94_u8, 0xb8_u8]), 103_u32)
  PKEY_Thumbnail = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 17_u32)
  PKEY_ThumbnailCacheId = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x446d16b1_u32, 0x8dad_u16, 0x4870_u16, StaticArray[0xa7_u8, 0x48_u8, 0x40_u8, 0x2e_u8, 0xa4_u8, 0x3d_u8, 0x78_u8, 0x8c_u8]), 100_u32)
  PKEY_ThumbnailStream = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 27_u32)
  PKEY_Title = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 2_u32)
  PKEY_TitleSortOverride = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf0f7984d_u32, 0x222e_u16, 0x4ad2_u16, StaticArray[0x82_u8, 0xab_u8, 0x1d_u8, 0xd8_u8, 0xea_u8, 0x40_u8, 0xe5_u8, 0x7e_u8]), 300_u32)
  PKEY_TotalFileSize = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x28636aa6_u32, 0x953d_u16, 0x11d2_u16, StaticArray[0xb5_u8, 0xd6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x18_u8, 0xd0_u8]), 14_u32)
  PKEY_Trademarks = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcef7d53_u32, 0xfa64_u16, 0x11d1_u16, StaticArray[0xa2_u8, 0x3_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x1f_u8, 0xed_u8, 0xee_u8]), 9_u32)
  PKEY_TransferOrder = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfceff153_u32, 0xe839_u16, 0x4cf3_u16, StaticArray[0xa9_u8, 0xe7_u8, 0xea_u8, 0x22_u8, 0x83_u8, 0x20_u8, 0x94_u8, 0xb8_u8]), 106_u32)
  PKEY_TransferPosition = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfceff153_u32, 0xe839_u16, 0x4cf3_u16, StaticArray[0xa9_u8, 0xe7_u8, 0xea_u8, 0x22_u8, 0x83_u8, 0x20_u8, 0x94_u8, 0xb8_u8]), 104_u32)
  PKEY_TransferSize = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfceff153_u32, 0xe839_u16, 0x4cf3_u16, StaticArray[0xa9_u8, 0xe7_u8, 0xea_u8, 0x22_u8, 0x83_u8, 0x20_u8, 0x94_u8, 0xb8_u8]), 105_u32)
  PKEY_VolumeId = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x446d16b1_u32, 0x8dad_u16, 0x4870_u16, StaticArray[0xa7_u8, 0x48_u8, 0x40_u8, 0x2e_u8, 0xa4_u8, 0x3d_u8, 0x78_u8, 0x8c_u8]), 104_u32)
  PKEY_ZoneIdentifier = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x502cfeab_u32, 0x47eb_u16, 0x459c_u16, StaticArray[0xb9_u8, 0x60_u8, 0xe6_u8, 0xd8_u8, 0x72_u8, 0x8f_u8, 0x77_u8, 0x1_u8]), 100_u32)
  PKEY_Device_PrinterURL = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb48f35a_u32, 0xbe6e_u16, 0x4f17_u16, StaticArray[0xb1_u8, 0x8_u8, 0x3c_u8, 0x40_u8, 0x73_u8, 0xd1_u8, 0x66_u8, 0x9a_u8]), 15_u32)
  PKEY_DeviceInterface_Bluetooth_DeviceAddress = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2bd67d8b_u32, 0x8beb_u16, 0x48d5_u16, StaticArray[0x87_u8, 0xe0_u8, 0x6c_u8, 0xda_u8, 0x34_u8, 0x28_u8, 0x4_u8, 0xa_u8]), 1_u32)
  PKEY_DeviceInterface_Bluetooth_Flags = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2bd67d8b_u32, 0x8beb_u16, 0x48d5_u16, StaticArray[0x87_u8, 0xe0_u8, 0x6c_u8, 0xda_u8, 0x34_u8, 0x28_u8, 0x4_u8, 0xa_u8]), 3_u32)
  PKEY_DeviceInterface_Bluetooth_LastConnectedTime = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2bd67d8b_u32, 0x8beb_u16, 0x48d5_u16, StaticArray[0x87_u8, 0xe0_u8, 0x6c_u8, 0xda_u8, 0x34_u8, 0x28_u8, 0x4_u8, 0xa_u8]), 11_u32)
  PKEY_DeviceInterface_Bluetooth_Manufacturer = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2bd67d8b_u32, 0x8beb_u16, 0x48d5_u16, StaticArray[0x87_u8, 0xe0_u8, 0x6c_u8, 0xda_u8, 0x34_u8, 0x28_u8, 0x4_u8, 0xa_u8]), 4_u32)
  PKEY_DeviceInterface_Bluetooth_ModelNumber = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2bd67d8b_u32, 0x8beb_u16, 0x48d5_u16, StaticArray[0x87_u8, 0xe0_u8, 0x6c_u8, 0xda_u8, 0x34_u8, 0x28_u8, 0x4_u8, 0xa_u8]), 5_u32)
  PKEY_DeviceInterface_Bluetooth_ProductId = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2bd67d8b_u32, 0x8beb_u16, 0x48d5_u16, StaticArray[0x87_u8, 0xe0_u8, 0x6c_u8, 0xda_u8, 0x34_u8, 0x28_u8, 0x4_u8, 0xa_u8]), 8_u32)
  PKEY_DeviceInterface_Bluetooth_ProductVersion = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2bd67d8b_u32, 0x8beb_u16, 0x48d5_u16, StaticArray[0x87_u8, 0xe0_u8, 0x6c_u8, 0xda_u8, 0x34_u8, 0x28_u8, 0x4_u8, 0xa_u8]), 9_u32)
  PKEY_DeviceInterface_Bluetooth_ServiceGuid = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2bd67d8b_u32, 0x8beb_u16, 0x48d5_u16, StaticArray[0x87_u8, 0xe0_u8, 0x6c_u8, 0xda_u8, 0x34_u8, 0x28_u8, 0x4_u8, 0xa_u8]), 2_u32)
  PKEY_DeviceInterface_Bluetooth_VendorId = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2bd67d8b_u32, 0x8beb_u16, 0x48d5_u16, StaticArray[0x87_u8, 0xe0_u8, 0x6c_u8, 0xda_u8, 0x34_u8, 0x28_u8, 0x4_u8, 0xa_u8]), 7_u32)
  PKEY_DeviceInterface_Bluetooth_VendorIdSource = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2bd67d8b_u32, 0x8beb_u16, 0x48d5_u16, StaticArray[0x87_u8, 0xe0_u8, 0x6c_u8, 0xda_u8, 0x34_u8, 0x28_u8, 0x4_u8, 0xa_u8]), 6_u32)
  PKEY_DeviceInterface_Hid_IsReadOnly = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcbf38310_u32, 0x4a17_u16, 0x4310_u16, StaticArray[0xa1_u8, 0xeb_u8, 0x24_u8, 0x7f_u8, 0xb_u8, 0x67_u8, 0x59_u8, 0x3b_u8]), 4_u32)
  PKEY_DeviceInterface_Hid_ProductId = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcbf38310_u32, 0x4a17_u16, 0x4310_u16, StaticArray[0xa1_u8, 0xeb_u8, 0x24_u8, 0x7f_u8, 0xb_u8, 0x67_u8, 0x59_u8, 0x3b_u8]), 6_u32)
  PKEY_DeviceInterface_Hid_UsageId = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcbf38310_u32, 0x4a17_u16, 0x4310_u16, StaticArray[0xa1_u8, 0xeb_u8, 0x24_u8, 0x7f_u8, 0xb_u8, 0x67_u8, 0x59_u8, 0x3b_u8]), 3_u32)
  PKEY_DeviceInterface_Hid_UsagePage = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcbf38310_u32, 0x4a17_u16, 0x4310_u16, StaticArray[0xa1_u8, 0xeb_u8, 0x24_u8, 0x7f_u8, 0xb_u8, 0x67_u8, 0x59_u8, 0x3b_u8]), 2_u32)
  PKEY_DeviceInterface_Hid_VendorId = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcbf38310_u32, 0x4a17_u16, 0x4310_u16, StaticArray[0xa1_u8, 0xeb_u8, 0x24_u8, 0x7f_u8, 0xb_u8, 0x67_u8, 0x59_u8, 0x3b_u8]), 5_u32)
  PKEY_DeviceInterface_Hid_VersionNumber = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcbf38310_u32, 0x4a17_u16, 0x4310_u16, StaticArray[0xa1_u8, 0xeb_u8, 0x24_u8, 0x7f_u8, 0xb_u8, 0x67_u8, 0x59_u8, 0x3b_u8]), 7_u32)
  PKEY_DeviceInterface_PrinterDriverDirectory = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x847c66de_u32, 0xb8d6_u16, 0x4af9_u16, StaticArray[0xab_u8, 0xc3_u8, 0x6f_u8, 0x4f_u8, 0x92_u8, 0x6b_u8, 0xc0_u8, 0x39_u8]), 14_u32)
  PKEY_DeviceInterface_PrinterDriverName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xafc47170_u32, 0x14f5_u16, 0x498c_u16, StaticArray[0x8f_u8, 0x30_u8, 0xb0_u8, 0xd1_u8, 0x9b_u8, 0xe4_u8, 0x49_u8, 0xc6_u8]), 11_u32)
  PKEY_DeviceInterface_PrinterEnumerationFlag = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa00742a1_u32, 0xcd8c_u16, 0x4b37_u16, StaticArray[0x95_u8, 0xab_u8, 0x70_u8, 0x75_u8, 0x55_u8, 0x87_u8, 0x76_u8, 0x7a_u8]), 3_u32)
  PKEY_DeviceInterface_PrinterName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa7b84ef_u32, 0xc27_u16, 0x463f_u16, StaticArray[0x84_u8, 0xef_u8, 0x6_u8, 0xc5_u8, 0x7_u8, 0x0_u8, 0x1_u8, 0xbe_u8]), 10_u32)
  PKEY_DeviceInterface_PrinterPortName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xeec7b761_u32, 0x6f94_u16, 0x41b1_u16, StaticArray[0x94_u8, 0x9f_u8, 0xc7_u8, 0x29_u8, 0x72_u8, 0xd_u8, 0xd1_u8, 0x3c_u8]), 12_u32)
  PKEY_DeviceInterface_Proximity_SupportsNfc = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfb3842cd_u32, 0x9e2a_u16, 0x4f83_u16, StaticArray[0x8f_u8, 0xcc_u8, 0x4b_u8, 0x7_u8, 0x61_u8, 0x13_u8, 0x9a_u8, 0xe9_u8]), 2_u32)
  PKEY_DeviceInterface_Serial_PortName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4c6bf15c_u32, 0x4c03_u16, 0x4aac_u16, StaticArray[0x91_u8, 0xf5_u8, 0x64_u8, 0xc0_u8, 0xf8_u8, 0x52_u8, 0xbc_u8, 0xf4_u8]), 4_u32)
  PKEY_DeviceInterface_Serial_UsbProductId = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4c6bf15c_u32, 0x4c03_u16, 0x4aac_u16, StaticArray[0x91_u8, 0xf5_u8, 0x64_u8, 0xc0_u8, 0xf8_u8, 0x52_u8, 0xbc_u8, 0xf4_u8]), 3_u32)
  PKEY_DeviceInterface_Serial_UsbVendorId = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4c6bf15c_u32, 0x4c03_u16, 0x4aac_u16, StaticArray[0x91_u8, 0xf5_u8, 0x64_u8, 0xc0_u8, 0xf8_u8, 0x52_u8, 0xbc_u8, 0xf4_u8]), 2_u32)
  PKEY_DeviceInterface_WinUsb_DeviceInterfaceClasses = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x95e127b5_u32, 0x79cc_u16, 0x4e83_u16, StaticArray[0x9c_u8, 0x9e_u8, 0x84_u8, 0x22_u8, 0x18_u8, 0x7b_u8, 0x3e_u8, 0xe_u8]), 7_u32)
  PKEY_DeviceInterface_WinUsb_UsbClass = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x95e127b5_u32, 0x79cc_u16, 0x4e83_u16, StaticArray[0x9c_u8, 0x9e_u8, 0x84_u8, 0x22_u8, 0x18_u8, 0x7b_u8, 0x3e_u8, 0xe_u8]), 4_u32)
  PKEY_DeviceInterface_WinUsb_UsbProductId = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x95e127b5_u32, 0x79cc_u16, 0x4e83_u16, StaticArray[0x9c_u8, 0x9e_u8, 0x84_u8, 0x22_u8, 0x18_u8, 0x7b_u8, 0x3e_u8, 0xe_u8]), 3_u32)
  PKEY_DeviceInterface_WinUsb_UsbProtocol = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x95e127b5_u32, 0x79cc_u16, 0x4e83_u16, StaticArray[0x9c_u8, 0x9e_u8, 0x84_u8, 0x22_u8, 0x18_u8, 0x7b_u8, 0x3e_u8, 0xe_u8]), 6_u32)
  PKEY_DeviceInterface_WinUsb_UsbSubClass = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x95e127b5_u32, 0x79cc_u16, 0x4e83_u16, StaticArray[0x9c_u8, 0x9e_u8, 0x84_u8, 0x22_u8, 0x18_u8, 0x7b_u8, 0x3e_u8, 0xe_u8]), 5_u32)
  PKEY_DeviceInterface_WinUsb_UsbVendorId = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x95e127b5_u32, 0x79cc_u16, 0x4e83_u16, StaticArray[0x9c_u8, 0x9e_u8, 0x84_u8, 0x22_u8, 0x18_u8, 0x7b_u8, 0x3e_u8, 0xe_u8]), 2_u32)
  PKEY_Devices_Aep_AepId = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x3b2ce006_u32, 0x5e61_u16, 0x4fde_u16, StaticArray[0xba_u8, 0xb8_u8, 0x9b_u8, 0x8a_u8, 0xac_u8, 0x9b_u8, 0x26_u8, 0xdf_u8]), 8_u32)
  PKEY_Devices_Aep_Bluetooth_Cod_Major = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x5fbd34cd_u32, 0x561a_u16, 0x412e_u16, StaticArray[0xba_u8, 0x98_u8, 0x47_u8, 0x8a_u8, 0x6b_u8, 0xf_u8, 0xef_u8, 0x1d_u8]), 2_u32)
  PKEY_Devices_Aep_Bluetooth_Cod_Minor = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x5fbd34cd_u32, 0x561a_u16, 0x412e_u16, StaticArray[0xba_u8, 0x98_u8, 0x47_u8, 0x8a_u8, 0x6b_u8, 0xf_u8, 0xef_u8, 0x1d_u8]), 3_u32)
  PKEY_Devices_Aep_Bluetooth_Cod_Services_Audio = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x5fbd34cd_u32, 0x561a_u16, 0x412e_u16, StaticArray[0xba_u8, 0x98_u8, 0x47_u8, 0x8a_u8, 0x6b_u8, 0xf_u8, 0xef_u8, 0x1d_u8]), 10_u32)
  PKEY_Devices_Aep_Bluetooth_Cod_Services_Capturing = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x5fbd34cd_u32, 0x561a_u16, 0x412e_u16, StaticArray[0xba_u8, 0x98_u8, 0x47_u8, 0x8a_u8, 0x6b_u8, 0xf_u8, 0xef_u8, 0x1d_u8]), 8_u32)
  PKEY_Devices_Aep_Bluetooth_Cod_Services_Information = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x5fbd34cd_u32, 0x561a_u16, 0x412e_u16, StaticArray[0xba_u8, 0x98_u8, 0x47_u8, 0x8a_u8, 0x6b_u8, 0xf_u8, 0xef_u8, 0x1d_u8]), 12_u32)
  PKEY_Devices_Aep_Bluetooth_Cod_Services_LimitedDiscovery = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x5fbd34cd_u32, 0x561a_u16, 0x412e_u16, StaticArray[0xba_u8, 0x98_u8, 0x47_u8, 0x8a_u8, 0x6b_u8, 0xf_u8, 0xef_u8, 0x1d_u8]), 4_u32)
  PKEY_Devices_Aep_Bluetooth_Cod_Services_Networking = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x5fbd34cd_u32, 0x561a_u16, 0x412e_u16, StaticArray[0xba_u8, 0x98_u8, 0x47_u8, 0x8a_u8, 0x6b_u8, 0xf_u8, 0xef_u8, 0x1d_u8]), 6_u32)
  PKEY_Devices_Aep_Bluetooth_Cod_Services_ObjectXfer = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x5fbd34cd_u32, 0x561a_u16, 0x412e_u16, StaticArray[0xba_u8, 0x98_u8, 0x47_u8, 0x8a_u8, 0x6b_u8, 0xf_u8, 0xef_u8, 0x1d_u8]), 9_u32)
  PKEY_Devices_Aep_Bluetooth_Cod_Services_Positioning = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x5fbd34cd_u32, 0x561a_u16, 0x412e_u16, StaticArray[0xba_u8, 0x98_u8, 0x47_u8, 0x8a_u8, 0x6b_u8, 0xf_u8, 0xef_u8, 0x1d_u8]), 5_u32)
  PKEY_Devices_Aep_Bluetooth_Cod_Services_Rendering = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x5fbd34cd_u32, 0x561a_u16, 0x412e_u16, StaticArray[0xba_u8, 0x98_u8, 0x47_u8, 0x8a_u8, 0x6b_u8, 0xf_u8, 0xef_u8, 0x1d_u8]), 7_u32)
  PKEY_Devices_Aep_Bluetooth_Cod_Services_Telephony = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x5fbd34cd_u32, 0x561a_u16, 0x412e_u16, StaticArray[0xba_u8, 0x98_u8, 0x47_u8, 0x8a_u8, 0x6b_u8, 0xf_u8, 0xef_u8, 0x1d_u8]), 11_u32)
  PKEY_Devices_Aep_Bluetooth_LastSeenTime = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2bd67d8b_u32, 0x8beb_u16, 0x48d5_u16, StaticArray[0x87_u8, 0xe0_u8, 0x6c_u8, 0xda_u8, 0x34_u8, 0x28_u8, 0x4_u8, 0xa_u8]), 12_u32)
  PKEY_Devices_Aep_Bluetooth_Le_AddressType = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x995ef0b0_u32, 0x7eb3_u16, 0x4a8b_u16, StaticArray[0xb9_u8, 0xce_u8, 0x6_u8, 0x8b_u8, 0xb3_u8, 0xf4_u8, 0xaf_u8, 0x69_u8]), 4_u32)
  BLUETOOTH_ADDRESS_TYPE_PUBLIC = 0_u32
  BLUETOOTH_ADDRESS_TYPE_RANDOM = 1_u32
  PKEY_Devices_Aep_Bluetooth_Le_Appearance = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x995ef0b0_u32, 0x7eb3_u16, 0x4a8b_u16, StaticArray[0xb9_u8, 0xce_u8, 0x6_u8, 0x8b_u8, 0xb3_u8, 0xf4_u8, 0xaf_u8, 0x69_u8]), 1_u32)
  PKEY_Devices_Aep_Bluetooth_Le_Appearance_Category = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x995ef0b0_u32, 0x7eb3_u16, 0x4a8b_u16, StaticArray[0xb9_u8, 0xce_u8, 0x6_u8, 0x8b_u8, 0xb3_u8, 0xf4_u8, 0xaf_u8, 0x69_u8]), 5_u32)
  PKEY_Devices_Aep_Bluetooth_Le_Appearance_Subcategory = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x995ef0b0_u32, 0x7eb3_u16, 0x4a8b_u16, StaticArray[0xb9_u8, 0xce_u8, 0x6_u8, 0x8b_u8, 0xb3_u8, 0xf4_u8, 0xaf_u8, 0x69_u8]), 6_u32)
  PKEY_Devices_Aep_Bluetooth_Le_IsCallControlClient = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x995ef0b0_u32, 0x7eb3_u16, 0x4a8b_u16, StaticArray[0xb9_u8, 0xce_u8, 0x6_u8, 0x8b_u8, 0xb3_u8, 0xf4_u8, 0xaf_u8, 0x69_u8]), 12_u32)
  PKEY_Devices_Aep_Bluetooth_Le_IsConnectable = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x995ef0b0_u32, 0x7eb3_u16, 0x4a8b_u16, StaticArray[0xb9_u8, 0xce_u8, 0x6_u8, 0x8b_u8, 0xb3_u8, 0xf4_u8, 0xaf_u8, 0x69_u8]), 8_u32)
  PKEY_Devices_Aep_CanPair = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe7c3fb29_u32, 0xcaa7_u16, 0x4f47_u16, StaticArray[0x8c_u8, 0x8b_u8, 0xbe_u8, 0x59_u8, 0xb3_u8, 0x30_u8, 0xd4_u8, 0xc5_u8]), 3_u32)
  PKEY_Devices_Aep_Category = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa35996ab_u32, 0x11cf_u16, 0x4935_u16, StaticArray[0x8b_u8, 0x61_u8, 0xa6_u8, 0x76_u8, 0x10_u8, 0x81_u8, 0xec_u8, 0xdf_u8]), 17_u32)
  PKEY_Devices_Aep_ContainerId = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe7c3fb29_u32, 0xcaa7_u16, 0x4f47_u16, StaticArray[0x8c_u8, 0x8b_u8, 0xbe_u8, 0x59_u8, 0xb3_u8, 0x30_u8, 0xd4_u8, 0xc5_u8]), 2_u32)
  PKEY_Devices_Aep_DeviceAddress = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa35996ab_u32, 0x11cf_u16, 0x4935_u16, StaticArray[0x8b_u8, 0x61_u8, 0xa6_u8, 0x76_u8, 0x10_u8, 0x81_u8, 0xec_u8, 0xdf_u8]), 12_u32)
  PKEY_Devices_Aep_IsConnected = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa35996ab_u32, 0x11cf_u16, 0x4935_u16, StaticArray[0x8b_u8, 0x61_u8, 0xa6_u8, 0x76_u8, 0x10_u8, 0x81_u8, 0xec_u8, 0xdf_u8]), 7_u32)
  PKEY_Devices_Aep_IsPaired = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa35996ab_u32, 0x11cf_u16, 0x4935_u16, StaticArray[0x8b_u8, 0x61_u8, 0xa6_u8, 0x76_u8, 0x10_u8, 0x81_u8, 0xec_u8, 0xdf_u8]), 16_u32)
  PKEY_Devices_Aep_IsPresent = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa35996ab_u32, 0x11cf_u16, 0x4935_u16, StaticArray[0x8b_u8, 0x61_u8, 0xa6_u8, 0x76_u8, 0x10_u8, 0x81_u8, 0xec_u8, 0xdf_u8]), 9_u32)
  PKEY_Devices_Aep_Manufacturer = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa35996ab_u32, 0x11cf_u16, 0x4935_u16, StaticArray[0x8b_u8, 0x61_u8, 0xa6_u8, 0x76_u8, 0x10_u8, 0x81_u8, 0xec_u8, 0xdf_u8]), 5_u32)
  PKEY_Devices_Aep_ModelId = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa35996ab_u32, 0x11cf_u16, 0x4935_u16, StaticArray[0x8b_u8, 0x61_u8, 0xa6_u8, 0x76_u8, 0x10_u8, 0x81_u8, 0xec_u8, 0xdf_u8]), 4_u32)
  PKEY_Devices_Aep_ModelName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa35996ab_u32, 0x11cf_u16, 0x4935_u16, StaticArray[0x8b_u8, 0x61_u8, 0xa6_u8, 0x76_u8, 0x10_u8, 0x81_u8, 0xec_u8, 0xdf_u8]), 3_u32)
  PKEY_Devices_Aep_PointOfService_ConnectionTypes = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd4bf61b3_u32, 0x442e_u16, 0x4ada_u16, StaticArray[0x88_u8, 0x2d_u8, 0xfa_u8, 0x7b_u8, 0x70_u8, 0xc8_u8, 0x32_u8, 0xd9_u8]), 6_u32)
  PKEY_Devices_Aep_ProtocolId = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x3b2ce006_u32, 0x5e61_u16, 0x4fde_u16, StaticArray[0xba_u8, 0xb8_u8, 0x9b_u8, 0x8a_u8, 0xac_u8, 0x9b_u8, 0x26_u8, 0xdf_u8]), 5_u32)
  PKEY_Devices_Aep_SignalStrength = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa35996ab_u32, 0x11cf_u16, 0x4935_u16, StaticArray[0x8b_u8, 0x61_u8, 0xa6_u8, 0x76_u8, 0x10_u8, 0x81_u8, 0xec_u8, 0xdf_u8]), 6_u32)
  PKEY_Devices_AepContainer_CanPair = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xbba1ede_u32, 0x7566_u16, 0x4f47_u16, StaticArray[0x90_u8, 0xec_u8, 0x25_u8, 0xfc_u8, 0x56_u8, 0x7c_u8, 0xed_u8, 0x2a_u8]), 3_u32)
  PKEY_Devices_AepContainer_Categories = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xbba1ede_u32, 0x7566_u16, 0x4f47_u16, StaticArray[0x90_u8, 0xec_u8, 0x25_u8, 0xfc_u8, 0x56_u8, 0x7c_u8, 0xed_u8, 0x2a_u8]), 9_u32)
  PKEY_Devices_AepContainer_Children = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xbba1ede_u32, 0x7566_u16, 0x4f47_u16, StaticArray[0x90_u8, 0xec_u8, 0x25_u8, 0xfc_u8, 0x56_u8, 0x7c_u8, 0xed_u8, 0x2a_u8]), 2_u32)
  PKEY_Devices_AepContainer_ContainerId = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xbba1ede_u32, 0x7566_u16, 0x4f47_u16, StaticArray[0x90_u8, 0xec_u8, 0x25_u8, 0xfc_u8, 0x56_u8, 0x7c_u8, 0xed_u8, 0x2a_u8]), 12_u32)
  PKEY_Devices_AepContainer_DialProtocol_InstalledApplications = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6af55d45_u32, 0x38db_u16, 0x4495_u16, StaticArray[0xac_u8, 0xb0_u8, 0xd4_u8, 0x72_u8, 0x8a_u8, 0x3b_u8, 0x83_u8, 0x14_u8]), 6_u32)
  PKEY_Devices_AepContainer_IsPaired = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xbba1ede_u32, 0x7566_u16, 0x4f47_u16, StaticArray[0x90_u8, 0xec_u8, 0x25_u8, 0xfc_u8, 0x56_u8, 0x7c_u8, 0xed_u8, 0x2a_u8]), 4_u32)
  PKEY_Devices_AepContainer_IsPresent = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xbba1ede_u32, 0x7566_u16, 0x4f47_u16, StaticArray[0x90_u8, 0xec_u8, 0x25_u8, 0xfc_u8, 0x56_u8, 0x7c_u8, 0xed_u8, 0x2a_u8]), 11_u32)
  PKEY_Devices_AepContainer_Manufacturer = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xbba1ede_u32, 0x7566_u16, 0x4f47_u16, StaticArray[0x90_u8, 0xec_u8, 0x25_u8, 0xfc_u8, 0x56_u8, 0x7c_u8, 0xed_u8, 0x2a_u8]), 6_u32)
  PKEY_Devices_AepContainer_ModelIds = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xbba1ede_u32, 0x7566_u16, 0x4f47_u16, StaticArray[0x90_u8, 0xec_u8, 0x25_u8, 0xfc_u8, 0x56_u8, 0x7c_u8, 0xed_u8, 0x2a_u8]), 8_u32)
  PKEY_Devices_AepContainer_ModelName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xbba1ede_u32, 0x7566_u16, 0x4f47_u16, StaticArray[0x90_u8, 0xec_u8, 0x25_u8, 0xfc_u8, 0x56_u8, 0x7c_u8, 0xed_u8, 0x2a_u8]), 7_u32)
  PKEY_Devices_AepContainer_ProtocolIds = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xbba1ede_u32, 0x7566_u16, 0x4f47_u16, StaticArray[0x90_u8, 0xec_u8, 0x25_u8, 0xfc_u8, 0x56_u8, 0x7c_u8, 0xed_u8, 0x2a_u8]), 13_u32)
  PKEY_Devices_AepContainer_SupportedUriSchemes = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6af55d45_u32, 0x38db_u16, 0x4495_u16, StaticArray[0xac_u8, 0xb0_u8, 0xd4_u8, 0x72_u8, 0x8a_u8, 0x3b_u8, 0x83_u8, 0x14_u8]), 5_u32)
  PKEY_Devices_AepContainer_SupportsAudio = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6af55d45_u32, 0x38db_u16, 0x4495_u16, StaticArray[0xac_u8, 0xb0_u8, 0xd4_u8, 0x72_u8, 0x8a_u8, 0x3b_u8, 0x83_u8, 0x14_u8]), 2_u32)
  PKEY_Devices_AepContainer_SupportsCapturing = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6af55d45_u32, 0x38db_u16, 0x4495_u16, StaticArray[0xac_u8, 0xb0_u8, 0xd4_u8, 0x72_u8, 0x8a_u8, 0x3b_u8, 0x83_u8, 0x14_u8]), 11_u32)
  PKEY_Devices_AepContainer_SupportsImages = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6af55d45_u32, 0x38db_u16, 0x4495_u16, StaticArray[0xac_u8, 0xb0_u8, 0xd4_u8, 0x72_u8, 0x8a_u8, 0x3b_u8, 0x83_u8, 0x14_u8]), 4_u32)
  PKEY_Devices_AepContainer_SupportsInformation = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6af55d45_u32, 0x38db_u16, 0x4495_u16, StaticArray[0xac_u8, 0xb0_u8, 0xd4_u8, 0x72_u8, 0x8a_u8, 0x3b_u8, 0x83_u8, 0x14_u8]), 14_u32)
  PKEY_Devices_AepContainer_SupportsLimitedDiscovery = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6af55d45_u32, 0x38db_u16, 0x4495_u16, StaticArray[0xac_u8, 0xb0_u8, 0xd4_u8, 0x72_u8, 0x8a_u8, 0x3b_u8, 0x83_u8, 0x14_u8]), 7_u32)
  PKEY_Devices_AepContainer_SupportsNetworking = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6af55d45_u32, 0x38db_u16, 0x4495_u16, StaticArray[0xac_u8, 0xb0_u8, 0xd4_u8, 0x72_u8, 0x8a_u8, 0x3b_u8, 0x83_u8, 0x14_u8]), 9_u32)
  PKEY_Devices_AepContainer_SupportsObjectTransfer = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6af55d45_u32, 0x38db_u16, 0x4495_u16, StaticArray[0xac_u8, 0xb0_u8, 0xd4_u8, 0x72_u8, 0x8a_u8, 0x3b_u8, 0x83_u8, 0x14_u8]), 12_u32)
  PKEY_Devices_AepContainer_SupportsPositioning = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6af55d45_u32, 0x38db_u16, 0x4495_u16, StaticArray[0xac_u8, 0xb0_u8, 0xd4_u8, 0x72_u8, 0x8a_u8, 0x3b_u8, 0x83_u8, 0x14_u8]), 8_u32)
  PKEY_Devices_AepContainer_SupportsRendering = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6af55d45_u32, 0x38db_u16, 0x4495_u16, StaticArray[0xac_u8, 0xb0_u8, 0xd4_u8, 0x72_u8, 0x8a_u8, 0x3b_u8, 0x83_u8, 0x14_u8]), 10_u32)
  PKEY_Devices_AepContainer_SupportsTelephony = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6af55d45_u32, 0x38db_u16, 0x4495_u16, StaticArray[0xac_u8, 0xb0_u8, 0xd4_u8, 0x72_u8, 0x8a_u8, 0x3b_u8, 0x83_u8, 0x14_u8]), 13_u32)
  PKEY_Devices_AepContainer_SupportsVideo = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6af55d45_u32, 0x38db_u16, 0x4495_u16, StaticArray[0xac_u8, 0xb0_u8, 0xd4_u8, 0x72_u8, 0x8a_u8, 0x3b_u8, 0x83_u8, 0x14_u8]), 3_u32)
  PKEY_Devices_AepService_AepId = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc9c141a9_u32, 0x1b4c_u16, 0x4f17_u16, StaticArray[0xa9_u8, 0xd1_u8, 0xf2_u8, 0x98_u8, 0x53_u8, 0x8c_u8, 0xad_u8, 0xb8_u8]), 6_u32)
  PKEY_Devices_AepService_Bluetooth_CacheMode = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9744311e_u32, 0x7951_u16, 0x4b2e_u16, StaticArray[0xb6_u8, 0xf0_u8, 0xec_u8, 0xb2_u8, 0x93_u8, 0xca_u8, 0xc1_u8, 0x19_u8]), 5_u32)
  BLUETOOTH_CACHE_MODE_CACHED = 0_u32
  BLUETOOTH_CACHED_MODE_UNCACHED = 1_u32
  PKEY_Devices_AepService_Bluetooth_ServiceGuid = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa399aac7_u32, 0xc265_u16, 0x474e_u16, StaticArray[0xb0_u8, 0x73_u8, 0xff_u8, 0xce_u8, 0x57_u8, 0x72_u8, 0x17_u8, 0x16_u8]), 2_u32)
  PKEY_Devices_AepService_Bluetooth_TargetDevice = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9744311e_u32, 0x7951_u16, 0x4b2e_u16, StaticArray[0xb6_u8, 0xf0_u8, 0xec_u8, 0xb2_u8, 0x93_u8, 0xca_u8, 0xc1_u8, 0x19_u8]), 6_u32)
  PKEY_Devices_AepService_ContainerId = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x71724756_u32, 0x3e74_u16, 0x4432_u16, StaticArray[0x9b_u8, 0x59_u8, 0xe7_u8, 0xb2_u8, 0xf6_u8, 0x68_u8, 0xa5_u8, 0x93_u8]), 4_u32)
  PKEY_Devices_AepService_FriendlyName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x71724756_u32, 0x3e74_u16, 0x4432_u16, StaticArray[0x9b_u8, 0x59_u8, 0xe7_u8, 0xb2_u8, 0xf6_u8, 0x68_u8, 0xa5_u8, 0x93_u8]), 2_u32)
  PKEY_Devices_AepService_IoT_ServiceInterfaces = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x79d94e82_u32, 0x4d79_u16, 0x45aa_u16, StaticArray[0x82_u8, 0x1a_u8, 0x74_u8, 0x85_u8, 0x8b_u8, 0x4e_u8, 0x4c_u8, 0xa6_u8]), 2_u32)
  PKEY_Devices_AepService_ParentAepIsPaired = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc9c141a9_u32, 0x1b4c_u16, 0x4f17_u16, StaticArray[0xa9_u8, 0xd1_u8, 0xf2_u8, 0x98_u8, 0x53_u8, 0x8c_u8, 0xad_u8, 0xb8_u8]), 7_u32)
  PKEY_Devices_AepService_ProtocolId = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc9c141a9_u32, 0x1b4c_u16, 0x4f17_u16, StaticArray[0xa9_u8, 0xd1_u8, 0xf2_u8, 0x98_u8, 0x53_u8, 0x8c_u8, 0xad_u8, 0xb8_u8]), 5_u32)
  PKEY_Devices_AepService_ServiceClassId = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x71724756_u32, 0x3e74_u16, 0x4432_u16, StaticArray[0x9b_u8, 0x59_u8, 0xe7_u8, 0xb2_u8, 0xf6_u8, 0x68_u8, 0xa5_u8, 0x93_u8]), 3_u32)
  PKEY_Devices_AepService_ServiceId = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc9c141a9_u32, 0x1b4c_u16, 0x4f17_u16, StaticArray[0xa9_u8, 0xd1_u8, 0xf2_u8, 0x98_u8, 0x53_u8, 0x8c_u8, 0xad_u8, 0xb8_u8]), 2_u32)
  PKEY_Devices_AppPackageFamilyName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x51236583_u32, 0xc4a_u16, 0x4fe8_u16, StaticArray[0xb8_u8, 0x1f_u8, 0x16_u8, 0x6a_u8, 0xec_u8, 0x13_u8, 0xf5_u8, 0x10_u8]), 100_u32)
  PKEY_Devices_AudioDevice_Microphone_EqCoefficientsDb = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x8943b373_u32, 0x388c_u16, 0x4395_u16, StaticArray[0xb5_u8, 0x57_u8, 0xbc_u8, 0x6d_u8, 0xba_u8, 0xff_u8, 0xaf_u8, 0xdb_u8]), 7_u32)
  PKEY_Devices_AudioDevice_Microphone_IsFarField = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x8943b373_u32, 0x388c_u16, 0x4395_u16, StaticArray[0xb5_u8, 0x57_u8, 0xbc_u8, 0x6d_u8, 0xba_u8, 0xff_u8, 0xaf_u8, 0xdb_u8]), 6_u32)
  PKEY_Devices_AudioDevice_Microphone_SensitivityInDbfs = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x8943b373_u32, 0x388c_u16, 0x4395_u16, StaticArray[0xb5_u8, 0x57_u8, 0xbc_u8, 0x6d_u8, 0xba_u8, 0xff_u8, 0xaf_u8, 0xdb_u8]), 3_u32)
  PKEY_Devices_AudioDevice_Microphone_SensitivityInDbfs2 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x8943b373_u32, 0x388c_u16, 0x4395_u16, StaticArray[0xb5_u8, 0x57_u8, 0xbc_u8, 0x6d_u8, 0xba_u8, 0xff_u8, 0xaf_u8, 0xdb_u8]), 5_u32)
  PKEY_Devices_AudioDevice_Microphone_SignalToNoiseRatioInDb = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x8943b373_u32, 0x388c_u16, 0x4395_u16, StaticArray[0xb5_u8, 0x57_u8, 0xbc_u8, 0x6d_u8, 0xba_u8, 0xff_u8, 0xaf_u8, 0xdb_u8]), 4_u32)
  PKEY_Devices_AudioDevice_RawProcessingSupported = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x8943b373_u32, 0x388c_u16, 0x4395_u16, StaticArray[0xb5_u8, 0x57_u8, 0xbc_u8, 0x6d_u8, 0xba_u8, 0xff_u8, 0xaf_u8, 0xdb_u8]), 2_u32)
  PKEY_Devices_AudioDevice_SpeechProcessingSupported = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfb1de864_u32, 0xe06d_u16, 0x47f4_u16, StaticArray[0x82_u8, 0xa6_u8, 0x8a_u8, 0xa_u8, 0xef_u8, 0x44_u8, 0x49_u8, 0x3c_u8]), 2_u32)
  PKEY_Devices_BatteryLife = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x49cd1f76_u32, 0x5626_u16, 0x4b17_u16, StaticArray[0xa4_u8, 0xe8_u8, 0x18_u8, 0xb4_u8, 0xaa_u8, 0x1a_u8, 0x22_u8, 0x13_u8]), 10_u32)
  PKEY_Devices_BatteryPlusCharging = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x49cd1f76_u32, 0x5626_u16, 0x4b17_u16, StaticArray[0xa4_u8, 0xe8_u8, 0x18_u8, 0xb4_u8, 0xaa_u8, 0x1a_u8, 0x22_u8, 0x13_u8]), 22_u32)
  PKEY_Devices_BatteryPlusChargingText = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x49cd1f76_u32, 0x5626_u16, 0x4b17_u16, StaticArray[0xa4_u8, 0xe8_u8, 0x18_u8, 0xb4_u8, 0xaa_u8, 0x1a_u8, 0x22_u8, 0x13_u8]), 23_u32)
  PKEY_Devices_Category = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 91_u32)
  PKEY_Devices_CategoryGroup = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 94_u32)
  PKEY_Devices_CategoryIds = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 90_u32)
  PKEY_Devices_CategoryPlural = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 92_u32)
  PKEY_Devices_ChallengeAep = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x774315e_u32, 0xb714_u16, 0x48ec_u16, StaticArray[0x8d_u8, 0xe8_u8, 0x81_u8, 0x25_u8, 0xc0_u8, 0x77_u8, 0xac_u8, 0x11_u8]), 2_u32)
  PKEY_Devices_ChargingState = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x49cd1f76_u32, 0x5626_u16, 0x4b17_u16, StaticArray[0xa4_u8, 0xe8_u8, 0x18_u8, 0xb4_u8, 0xaa_u8, 0x1a_u8, 0x22_u8, 0x13_u8]), 11_u32)
  PKEY_Devices_Children = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4340a6c5_u32, 0x93fa_u16, 0x4706_u16, StaticArray[0x97_u8, 0x2c_u8, 0x7b_u8, 0x64_u8, 0x80_u8, 0x8_u8, 0xa5_u8, 0xa7_u8]), 9_u32)
  PKEY_Devices_ClassGuid = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 10_u32)
  PKEY_Devices_CompatibleIds = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 4_u32)
  PKEY_Devices_Connected = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 55_u32)
  PKEY_Devices_ContainerId = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x8c7ed206_u32, 0x3f8a_u16, 0x4827_u16, StaticArray[0xb3_u8, 0xab_u8, 0xae_u8, 0x9e_u8, 0x1f_u8, 0xae_u8, 0xfc_u8, 0x6c_u8]), 2_u32)
  PKEY_Devices_DefaultTooltip = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x880f70a2_u32, 0x6082_u16, 0x47ac_u16, StaticArray[0x8a_u8, 0xab_u8, 0xa7_u8, 0x39_u8, 0xd1_u8, 0xa3_u8, 0x0_u8, 0xc3_u8]), 153_u32)
  PKEY_Devices_DeviceCapabilities = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 17_u32)
  PKEY_Devices_DeviceCharacteristics = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 29_u32)
  PKEY_Devices_DeviceDescription1 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 81_u32)
  PKEY_Devices_DeviceDescription2 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 82_u32)
  PKEY_Devices_DeviceHasProblem = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x540b947e_u32, 0x8b40_u16, 0x45bc_u16, StaticArray[0xa8_u8, 0xa2_u8, 0x6a_u8, 0xb_u8, 0x89_u8, 0x4c_u8, 0xbd_u8, 0xa2_u8]), 6_u32)
  PKEY_Devices_DeviceInstanceId = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 256_u32)
  PKEY_Devices_DeviceManufacturer = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 13_u32)
  PKEY_Devices_DevObjectType = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x13673f42_u32, 0xa3d6_u16, 0x49f6_u16, StaticArray[0xb4_u8, 0xda_u8, 0xae_u8, 0x46_u8, 0xe0_u8, 0xc5_u8, 0x23_u8, 0x7c_u8]), 2_u32)
  PKEY_Devices_DialProtocol_InstalledApplications = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6845cc72_u32, 0x1b71_u16, 0x48c3_u16, StaticArray[0xaf_u8, 0x86_u8, 0xb0_u8, 0x91_u8, 0x71_u8, 0xa1_u8, 0x9b_u8, 0x14_u8]), 3_u32)
  PKEY_Devices_DiscoveryMethod = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 52_u32)
  PKEY_Devices_Dnssd_Domain = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xbf79c0ab_u32, 0xbb74_u16, 0x4cee_u16, StaticArray[0xb0_u8, 0x70_u8, 0x47_u8, 0xb_u8, 0x5a_u8, 0xe2_u8, 0x2_u8, 0xea_u8]), 3_u32)
  PKEY_Devices_Dnssd_FullName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xbf79c0ab_u32, 0xbb74_u16, 0x4cee_u16, StaticArray[0xb0_u8, 0x70_u8, 0x47_u8, 0xb_u8, 0x5a_u8, 0xe2_u8, 0x2_u8, 0xea_u8]), 5_u32)
  PKEY_Devices_Dnssd_HostName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xbf79c0ab_u32, 0xbb74_u16, 0x4cee_u16, StaticArray[0xb0_u8, 0x70_u8, 0x47_u8, 0xb_u8, 0x5a_u8, 0xe2_u8, 0x2_u8, 0xea_u8]), 7_u32)
  PKEY_Devices_Dnssd_InstanceName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xbf79c0ab_u32, 0xbb74_u16, 0x4cee_u16, StaticArray[0xb0_u8, 0x70_u8, 0x47_u8, 0xb_u8, 0x5a_u8, 0xe2_u8, 0x2_u8, 0xea_u8]), 4_u32)
  PKEY_Devices_Dnssd_NetworkAdapterId = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xbf79c0ab_u32, 0xbb74_u16, 0x4cee_u16, StaticArray[0xb0_u8, 0x70_u8, 0x47_u8, 0xb_u8, 0x5a_u8, 0xe2_u8, 0x2_u8, 0xea_u8]), 11_u32)
  PKEY_Devices_Dnssd_PortNumber = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xbf79c0ab_u32, 0xbb74_u16, 0x4cee_u16, StaticArray[0xb0_u8, 0x70_u8, 0x47_u8, 0xb_u8, 0x5a_u8, 0xe2_u8, 0x2_u8, 0xea_u8]), 12_u32)
  PKEY_Devices_Dnssd_Priority = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xbf79c0ab_u32, 0xbb74_u16, 0x4cee_u16, StaticArray[0xb0_u8, 0x70_u8, 0x47_u8, 0xb_u8, 0x5a_u8, 0xe2_u8, 0x2_u8, 0xea_u8]), 9_u32)
  PKEY_Devices_Dnssd_ServiceName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xbf79c0ab_u32, 0xbb74_u16, 0x4cee_u16, StaticArray[0xb0_u8, 0x70_u8, 0x47_u8, 0xb_u8, 0x5a_u8, 0xe2_u8, 0x2_u8, 0xea_u8]), 2_u32)
  PKEY_Devices_Dnssd_TextAttributes = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xbf79c0ab_u32, 0xbb74_u16, 0x4cee_u16, StaticArray[0xb0_u8, 0x70_u8, 0x47_u8, 0xb_u8, 0x5a_u8, 0xe2_u8, 0x2_u8, 0xea_u8]), 6_u32)
  PKEY_Devices_Dnssd_Ttl = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xbf79c0ab_u32, 0xbb74_u16, 0x4cee_u16, StaticArray[0xb0_u8, 0x70_u8, 0x47_u8, 0xb_u8, 0x5a_u8, 0xe2_u8, 0x2_u8, 0xea_u8]), 10_u32)
  PKEY_Devices_Dnssd_Weight = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xbf79c0ab_u32, 0xbb74_u16, 0x4cee_u16, StaticArray[0xb0_u8, 0x70_u8, 0x47_u8, 0xb_u8, 0x5a_u8, 0xe2_u8, 0x2_u8, 0xea_u8]), 8_u32)
  PKEY_Devices_FriendlyName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 12288_u32)
  PKEY_Devices_FunctionPaths = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd08dd4c0_u32, 0x3a9e_u16, 0x462e_u16, StaticArray[0x82_u8, 0x90_u8, 0x7b_u8, 0x63_u8, 0x6b_u8, 0x25_u8, 0x76_u8, 0xb9_u8]), 3_u32)
  PKEY_Devices_GlyphIcon = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x51236583_u32, 0xc4a_u16, 0x4fe8_u16, StaticArray[0xb8_u8, 0x1f_u8, 0x16_u8, 0x6a_u8, 0xec_u8, 0x13_u8, 0xf5_u8, 0x10_u8]), 123_u32)
  PKEY_Devices_HardwareIds = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 3_u32)
  PKEY_Devices_Icon = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 57_u32)
  PKEY_Devices_InLocalMachineContainer = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x8c7ed206_u32, 0x3f8a_u16, 0x4827_u16, StaticArray[0xb3_u8, 0xab_u8, 0xae_u8, 0x9e_u8, 0x1f_u8, 0xae_u8, 0xfc_u8, 0x6c_u8]), 4_u32)
  PKEY_Devices_InterfaceClassGuid = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x26e516e_u32, 0xb814_u16, 0x414b_u16, StaticArray[0x83_u8, 0xcd_u8, 0x85_u8, 0x6d_u8, 0x6f_u8, 0xef_u8, 0x48_u8, 0x22_u8]), 4_u32)
  PKEY_Devices_InterfaceEnabled = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x26e516e_u32, 0xb814_u16, 0x414b_u16, StaticArray[0x83_u8, 0xcd_u8, 0x85_u8, 0x6d_u8, 0x6f_u8, 0xef_u8, 0x48_u8, 0x22_u8]), 3_u32)
  PKEY_Devices_InterfacePaths = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd08dd4c0_u32, 0x3a9e_u16, 0x462e_u16, StaticArray[0x82_u8, 0x90_u8, 0x7b_u8, 0x63_u8, 0x6b_u8, 0x25_u8, 0x76_u8, 0xb9_u8]), 2_u32)
  PKEY_Devices_IpAddress = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 12297_u32)
  PKEY_Devices_IsDefault = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 86_u32)
  PKEY_Devices_IsNetworkConnected = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 85_u32)
  PKEY_Devices_IsShared = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 84_u32)
  PKEY_Devices_IsSoftwareInstalling = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x83da6326_u32, 0x97a6_u16, 0x4088_u16, StaticArray[0x94_u8, 0x53_u8, 0xa1_u8, 0x92_u8, 0x3f_u8, 0x57_u8, 0x3b_u8, 0x29_u8]), 9_u32)
  PKEY_Devices_LaunchDeviceStageFromExplorer = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 77_u32)
  PKEY_Devices_LocalMachine = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 70_u32)
  PKEY_Devices_LocationPaths = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 37_u32)
  PKEY_Devices_Manufacturer = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 8192_u32)
  PKEY_Devices_MetadataPath = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 71_u32)
  PKEY_Devices_MicrophoneArray_Geometry = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa1829ea2_u32, 0x27eb_u16, 0x459e_u16, StaticArray[0x93_u8, 0x5d_u8, 0xb2_u8, 0xfa_u8, 0xd7_u8, 0xb0_u8, 0x77_u8, 0x62_u8]), 2_u32)
  PKEY_Devices_MissedCalls = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x49cd1f76_u32, 0x5626_u16, 0x4b17_u16, StaticArray[0xa4_u8, 0xe8_u8, 0x18_u8, 0xb4_u8, 0xaa_u8, 0x1a_u8, 0x22_u8, 0x13_u8]), 5_u32)
  PKEY_Devices_ModelId = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x80d81ea6_u32, 0x7473_u16, 0x4b0c_u16, StaticArray[0x82_u8, 0x16_u8, 0xef_u8, 0xc1_u8, 0x1a_u8, 0x2c_u8, 0x4c_u8, 0x8b_u8]), 2_u32)
  PKEY_Devices_ModelName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 8194_u32)
  PKEY_Devices_ModelNumber = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 8195_u32)
  PKEY_Devices_NetworkedTooltip = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x880f70a2_u32, 0x6082_u16, 0x47ac_u16, StaticArray[0x8a_u8, 0xab_u8, 0xa7_u8, 0x39_u8, 0xd1_u8, 0xa3_u8, 0x0_u8, 0xc3_u8]), 152_u32)
  PKEY_Devices_NetworkName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x49cd1f76_u32, 0x5626_u16, 0x4b17_u16, StaticArray[0xa4_u8, 0xe8_u8, 0x18_u8, 0xb4_u8, 0xaa_u8, 0x1a_u8, 0x22_u8, 0x13_u8]), 7_u32)
  PKEY_Devices_NetworkType = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x49cd1f76_u32, 0x5626_u16, 0x4b17_u16, StaticArray[0xa4_u8, 0xe8_u8, 0x18_u8, 0xb4_u8, 0xaa_u8, 0x1a_u8, 0x22_u8, 0x13_u8]), 8_u32)
  PKEY_Devices_NewPictures = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x49cd1f76_u32, 0x5626_u16, 0x4b17_u16, StaticArray[0xa4_u8, 0xe8_u8, 0x18_u8, 0xb4_u8, 0xaa_u8, 0x1a_u8, 0x22_u8, 0x13_u8]), 4_u32)
  PKEY_Devices_Notification = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6704b0c_u32, 0xe830_u16, 0x4c81_u16, StaticArray[0x91_u8, 0x78_u8, 0x91_u8, 0xe4_u8, 0xe9_u8, 0x5a_u8, 0x80_u8, 0xa0_u8]), 3_u32)
  PKEY_Devices_Notifications_LowBattery = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc4c07f2b_u32, 0x8524_u16, 0x4e66_u16, StaticArray[0xae_u8, 0x3a_u8, 0xa6_u8, 0x23_u8, 0x5f_u8, 0x10_u8, 0x3b_u8, 0xeb_u8]), 2_u32)
  PKEY_Devices_Notifications_MissedCall = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6614ef48_u32, 0x4efe_u16, 0x4424_u16, StaticArray[0x9e_u8, 0xda_u8, 0xc7_u8, 0x9f_u8, 0x40_u8, 0x4e_u8, 0xdf_u8, 0x3e_u8]), 2_u32)
  PKEY_Devices_Notifications_NewMessage = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2be9260a_u32, 0x2012_u16, 0x4742_u16, StaticArray[0xa5_u8, 0x55_u8, 0xf4_u8, 0x1b_u8, 0x63_u8, 0x8b_u8, 0x7d_u8, 0xcb_u8]), 2_u32)
  PKEY_Devices_Notifications_NewVoicemail = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x59569556_u32, 0xa08_u16, 0x4212_u16, StaticArray[0x95_u8, 0xb9_u8, 0xfa_u8, 0xe2_u8, 0xad_u8, 0x64_u8, 0x13_u8, 0xdb_u8]), 2_u32)
  PKEY_Devices_Notifications_StorageFull = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa0e00ee1_u32, 0xf0c7_u16, 0x4d41_u16, StaticArray[0xb8_u8, 0xe7_u8, 0x26_u8, 0xa7_u8, 0xbd_u8, 0x8d_u8, 0x38_u8, 0xb0_u8]), 2_u32)
  PKEY_Devices_Notifications_StorageFullLinkText = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa0e00ee1_u32, 0xf0c7_u16, 0x4d41_u16, StaticArray[0xb8_u8, 0xe7_u8, 0x26_u8, 0xa7_u8, 0xbd_u8, 0x8d_u8, 0x38_u8, 0xb0_u8]), 3_u32)
  PKEY_Devices_NotificationStore = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6704b0c_u32, 0xe830_u16, 0x4c81_u16, StaticArray[0x91_u8, 0x78_u8, 0x91_u8, 0xe4_u8, 0xe9_u8, 0x5a_u8, 0x80_u8, 0xa0_u8]), 2_u32)
  PKEY_Devices_NotWorkingProperly = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 83_u32)
  PKEY_Devices_Paired = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 56_u32)
  PKEY_Devices_Panel_PanelGroup = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x8dbc9c86_u32, 0x97a9_u16, 0x4bff_u16, StaticArray[0x9b_u8, 0xc6_u8, 0xbf_u8, 0xe9_u8, 0x5d_u8, 0x3e_u8, 0x6d_u8, 0xad_u8]), 3_u32)
  PKEY_Devices_Panel_PanelId = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x8dbc9c86_u32, 0x97a9_u16, 0x4bff_u16, StaticArray[0x9b_u8, 0xc6_u8, 0xbf_u8, 0xe9_u8, 0x5d_u8, 0x3e_u8, 0x6d_u8, 0xad_u8]), 2_u32)
  PKEY_Devices_Parent = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4340a6c5_u32, 0x93fa_u16, 0x4706_u16, StaticArray[0x97_u8, 0x2c_u8, 0x7b_u8, 0x64_u8, 0x80_u8, 0x8_u8, 0xa5_u8, 0xa7_u8]), 8_u32)
  PKEY_Devices_PhoneLineTransportDevice_Connected = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xaecf2fe8_u32, 0x1d00_u16, 0x4fee_u16, StaticArray[0x8a_u8, 0x6d_u8, 0xa7_u8, 0xd_u8, 0x71_u8, 0x9b_u8, 0x77_u8, 0x2b_u8]), 2_u32)
  PKEY_Devices_PhysicalDeviceLocation = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x540b947e_u32, 0x8b40_u16, 0x45bc_u16, StaticArray[0xa8_u8, 0xa2_u8, 0x6a_u8, 0xb_u8, 0x89_u8, 0x4c_u8, 0xbd_u8, 0xa2_u8]), 9_u32)
  PKEY_Devices_PlaybackPositionPercent = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x3633de59_u32, 0x6825_u16, 0x4381_u16, StaticArray[0xa4_u8, 0x9b_u8, 0x9f_u8, 0x6b_u8, 0xa1_u8, 0x3a_u8, 0x14_u8, 0x71_u8]), 5_u32)
  PKEY_Devices_PlaybackState = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x3633de59_u32, 0x6825_u16, 0x4381_u16, StaticArray[0xa4_u8, 0x9b_u8, 0x9f_u8, 0x6b_u8, 0xa1_u8, 0x3a_u8, 0x14_u8, 0x71_u8]), 2_u32)
  PLAYBACKSTATE_UNKNOWN = 0_u32
  PLAYBACKSTATE_STOPPED = 1_u32
  PLAYBACKSTATE_PLAYING = 2_u32
  PLAYBACKSTATE_TRANSITIONING = 3_u32
  PLAYBACKSTATE_PAUSED = 4_u32
  PLAYBACKSTATE_RECORDINGPAUSED = 5_u32
  PLAYBACKSTATE_RECORDING = 6_u32
  PLAYBACKSTATE_NOMEDIA = 7_u32
  PKEY_Devices_PlaybackTitle = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x3633de59_u32, 0x6825_u16, 0x4381_u16, StaticArray[0xa4_u8, 0x9b_u8, 0x9f_u8, 0x6b_u8, 0xa1_u8, 0x3a_u8, 0x14_u8, 0x71_u8]), 3_u32)
  PKEY_Devices_Present = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x540b947e_u32, 0x8b40_u16, 0x45bc_u16, StaticArray[0xa8_u8, 0xa2_u8, 0x6a_u8, 0xb_u8, 0x89_u8, 0x4c_u8, 0xbd_u8, 0xa2_u8]), 5_u32)
  PKEY_Devices_PresentationUrl = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 8198_u32)
  PKEY_Devices_PrimaryCategory = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd08dd4c0_u32, 0x3a9e_u16, 0x462e_u16, StaticArray[0x82_u8, 0x90_u8, 0x7b_u8, 0x63_u8, 0x6b_u8, 0x25_u8, 0x76_u8, 0xb9_u8]), 10_u32)
  PKEY_Devices_RemainingDuration = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x3633de59_u32, 0x6825_u16, 0x4381_u16, StaticArray[0xa4_u8, 0x9b_u8, 0x9f_u8, 0x6b_u8, 0xa1_u8, 0x3a_u8, 0x14_u8, 0x71_u8]), 4_u32)
  PKEY_Devices_RestrictedInterface = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x26e516e_u32, 0xb814_u16, 0x414b_u16, StaticArray[0x83_u8, 0xcd_u8, 0x85_u8, 0x6d_u8, 0x6f_u8, 0xef_u8, 0x48_u8, 0x22_u8]), 6_u32)
  PKEY_Devices_Roaming = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x49cd1f76_u32, 0x5626_u16, 0x4b17_u16, StaticArray[0xa4_u8, 0xe8_u8, 0x18_u8, 0xb4_u8, 0xaa_u8, 0x1a_u8, 0x22_u8, 0x13_u8]), 9_u32)
  PKEY_Devices_SafeRemovalRequired = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xafd97640_u32, 0x86a3_u16, 0x4210_u16, StaticArray[0xb6_u8, 0x7c_u8, 0x28_u8, 0x9c_u8, 0x41_u8, 0xaa_u8, 0xbe_u8, 0x55_u8]), 2_u32)
  PKEY_Devices_SchematicName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x26e516e_u32, 0xb814_u16, 0x414b_u16, StaticArray[0x83_u8, 0xcd_u8, 0x85_u8, 0x6d_u8, 0x6f_u8, 0xef_u8, 0x48_u8, 0x22_u8]), 9_u32)
  PKEY_Devices_ServiceAddress = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 16384_u32)
  PKEY_Devices_ServiceId = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 16385_u32)
  PKEY_Devices_SharedTooltip = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x880f70a2_u32, 0x6082_u16, 0x47ac_u16, StaticArray[0x8a_u8, 0xab_u8, 0xa7_u8, 0x39_u8, 0xd1_u8, 0xa3_u8, 0x0_u8, 0xc3_u8]), 151_u32)
  PKEY_Devices_SignalStrength = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x49cd1f76_u32, 0x5626_u16, 0x4b17_u16, StaticArray[0xa4_u8, 0xe8_u8, 0x18_u8, 0xb4_u8, 0xaa_u8, 0x1a_u8, 0x22_u8, 0x13_u8]), 2_u32)
  PKEY_Devices_SmartCards_ReaderKind = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd6b5b883_u32, 0x18bd_u16, 0x4b4d_u16, StaticArray[0xb2_u8, 0xec_u8, 0x9e_u8, 0x38_u8, 0xaf_u8, 0xfe_u8, 0xda_u8, 0x82_u8]), 2_u32)
  PKEY_Devices_Status = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd08dd4c0_u32, 0x3a9e_u16, 0x462e_u16, StaticArray[0x82_u8, 0x90_u8, 0x7b_u8, 0x63_u8, 0x6b_u8, 0x25_u8, 0x76_u8, 0xb9_u8]), 259_u32)
  PKEY_Devices_Status1 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd08dd4c0_u32, 0x3a9e_u16, 0x462e_u16, StaticArray[0x82_u8, 0x90_u8, 0x7b_u8, 0x63_u8, 0x6b_u8, 0x25_u8, 0x76_u8, 0xb9_u8]), 257_u32)
  PKEY_Devices_Status2 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd08dd4c0_u32, 0x3a9e_u16, 0x462e_u16, StaticArray[0x82_u8, 0x90_u8, 0x7b_u8, 0x63_u8, 0x6b_u8, 0x25_u8, 0x76_u8, 0xb9_u8]), 258_u32)
  PKEY_Devices_StorageCapacity = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x49cd1f76_u32, 0x5626_u16, 0x4b17_u16, StaticArray[0xa4_u8, 0xe8_u8, 0x18_u8, 0xb4_u8, 0xaa_u8, 0x1a_u8, 0x22_u8, 0x13_u8]), 12_u32)
  PKEY_Devices_StorageFreeSpace = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x49cd1f76_u32, 0x5626_u16, 0x4b17_u16, StaticArray[0xa4_u8, 0xe8_u8, 0x18_u8, 0xb4_u8, 0xaa_u8, 0x1a_u8, 0x22_u8, 0x13_u8]), 13_u32)
  PKEY_Devices_StorageFreeSpacePercent = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x49cd1f76_u32, 0x5626_u16, 0x4b17_u16, StaticArray[0xa4_u8, 0xe8_u8, 0x18_u8, 0xb4_u8, 0xaa_u8, 0x1a_u8, 0x22_u8, 0x13_u8]), 14_u32)
  PKEY_Devices_TextMessages = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x49cd1f76_u32, 0x5626_u16, 0x4b17_u16, StaticArray[0xa4_u8, 0xe8_u8, 0x18_u8, 0xb4_u8, 0xaa_u8, 0x1a_u8, 0x22_u8, 0x13_u8]), 3_u32)
  PKEY_Devices_Voicemail = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x49cd1f76_u32, 0x5626_u16, 0x4b17_u16, StaticArray[0xa4_u8, 0xe8_u8, 0x18_u8, 0xb4_u8, 0xaa_u8, 0x1a_u8, 0x22_u8, 0x13_u8]), 6_u32)
  PKEY_Devices_WiaDeviceType = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6bdd1fc6_u32, 0x810f_u16, 0x11d0_u16, StaticArray[0xbe_u8, 0xc7_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0xe2_u8, 0x9_u8, 0x2f_u8]), 2_u32)
  PKEY_Devices_WiFi_InterfaceGuid = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xef1167eb_u32, 0xcbfc_u16, 0x4341_u16, StaticArray[0xa5_u8, 0x68_u8, 0xa7_u8, 0xc9_u8, 0x1a_u8, 0x68_u8, 0x98_u8, 0x2c_u8]), 2_u32)
  PKEY_Devices_WiFiDirect_DeviceAddress = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1506935d_u32, 0xe3e7_u16, 0x450f_u16, StaticArray[0x86_u8, 0x37_u8, 0x82_u8, 0x23_u8, 0x3e_u8, 0xbe_u8, 0x5f_u8, 0x6e_u8]), 13_u32)
  PKEY_Devices_WiFiDirect_GroupId = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1506935d_u32, 0xe3e7_u16, 0x450f_u16, StaticArray[0x86_u8, 0x37_u8, 0x82_u8, 0x23_u8, 0x3e_u8, 0xbe_u8, 0x5f_u8, 0x6e_u8]), 4_u32)
  PKEY_Devices_WiFiDirect_InformationElements = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1506935d_u32, 0xe3e7_u16, 0x450f_u16, StaticArray[0x86_u8, 0x37_u8, 0x82_u8, 0x23_u8, 0x3e_u8, 0xbe_u8, 0x5f_u8, 0x6e_u8]), 12_u32)
  PKEY_Devices_WiFiDirect_InterfaceAddress = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1506935d_u32, 0xe3e7_u16, 0x450f_u16, StaticArray[0x86_u8, 0x37_u8, 0x82_u8, 0x23_u8, 0x3e_u8, 0xbe_u8, 0x5f_u8, 0x6e_u8]), 2_u32)
  PKEY_Devices_WiFiDirect_InterfaceGuid = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1506935d_u32, 0xe3e7_u16, 0x450f_u16, StaticArray[0x86_u8, 0x37_u8, 0x82_u8, 0x23_u8, 0x3e_u8, 0xbe_u8, 0x5f_u8, 0x6e_u8]), 3_u32)
  PKEY_Devices_WiFiDirect_IsConnected = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1506935d_u32, 0xe3e7_u16, 0x450f_u16, StaticArray[0x86_u8, 0x37_u8, 0x82_u8, 0x23_u8, 0x3e_u8, 0xbe_u8, 0x5f_u8, 0x6e_u8]), 5_u32)
  PKEY_Devices_WiFiDirect_IsLegacyDevice = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1506935d_u32, 0xe3e7_u16, 0x450f_u16, StaticArray[0x86_u8, 0x37_u8, 0x82_u8, 0x23_u8, 0x3e_u8, 0xbe_u8, 0x5f_u8, 0x6e_u8]), 7_u32)
  PKEY_Devices_WiFiDirect_IsMiracastLcpSupported = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1506935d_u32, 0xe3e7_u16, 0x450f_u16, StaticArray[0x86_u8, 0x37_u8, 0x82_u8, 0x23_u8, 0x3e_u8, 0xbe_u8, 0x5f_u8, 0x6e_u8]), 9_u32)
  PKEY_Devices_WiFiDirect_IsVisible = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1506935d_u32, 0xe3e7_u16, 0x450f_u16, StaticArray[0x86_u8, 0x37_u8, 0x82_u8, 0x23_u8, 0x3e_u8, 0xbe_u8, 0x5f_u8, 0x6e_u8]), 6_u32)
  PKEY_Devices_WiFiDirect_MiracastVersion = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1506935d_u32, 0xe3e7_u16, 0x450f_u16, StaticArray[0x86_u8, 0x37_u8, 0x82_u8, 0x23_u8, 0x3e_u8, 0xbe_u8, 0x5f_u8, 0x6e_u8]), 8_u32)
  PKEY_Devices_WiFiDirect_Services = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1506935d_u32, 0xe3e7_u16, 0x450f_u16, StaticArray[0x86_u8, 0x37_u8, 0x82_u8, 0x23_u8, 0x3e_u8, 0xbe_u8, 0x5f_u8, 0x6e_u8]), 10_u32)
  PKEY_Devices_WiFiDirect_SupportedChannelList = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1506935d_u32, 0xe3e7_u16, 0x450f_u16, StaticArray[0x86_u8, 0x37_u8, 0x82_u8, 0x23_u8, 0x3e_u8, 0xbe_u8, 0x5f_u8, 0x6e_u8]), 11_u32)
  PKEY_Devices_WiFiDirectServices_AdvertisementId = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x31b37743_u32, 0x7c5e_u16, 0x4005_u16, StaticArray[0x93_u8, 0xe6_u8, 0xe9_u8, 0x53_u8, 0xf9_u8, 0x2b_u8, 0x82_u8, 0xe9_u8]), 5_u32)
  PKEY_Devices_WiFiDirectServices_RequestServiceInformation = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x31b37743_u32, 0x7c5e_u16, 0x4005_u16, StaticArray[0x93_u8, 0xe6_u8, 0xe9_u8, 0x53_u8, 0xf9_u8, 0x2b_u8, 0x82_u8, 0xe9_u8]), 7_u32)
  PKEY_Devices_WiFiDirectServices_ServiceAddress = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x31b37743_u32, 0x7c5e_u16, 0x4005_u16, StaticArray[0x93_u8, 0xe6_u8, 0xe9_u8, 0x53_u8, 0xf9_u8, 0x2b_u8, 0x82_u8, 0xe9_u8]), 2_u32)
  PKEY_Devices_WiFiDirectServices_ServiceConfigMethods = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x31b37743_u32, 0x7c5e_u16, 0x4005_u16, StaticArray[0x93_u8, 0xe6_u8, 0xe9_u8, 0x53_u8, 0xf9_u8, 0x2b_u8, 0x82_u8, 0xe9_u8]), 6_u32)
  PKEY_Devices_WiFiDirectServices_ServiceInformation = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x31b37743_u32, 0x7c5e_u16, 0x4005_u16, StaticArray[0x93_u8, 0xe6_u8, 0xe9_u8, 0x53_u8, 0xf9_u8, 0x2b_u8, 0x82_u8, 0xe9_u8]), 4_u32)
  PKEY_Devices_WiFiDirectServices_ServiceName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x31b37743_u32, 0x7c5e_u16, 0x4005_u16, StaticArray[0x93_u8, 0xe6_u8, 0xe9_u8, 0x53_u8, 0xf9_u8, 0x2b_u8, 0x82_u8, 0xe9_u8]), 3_u32)
  PKEY_Devices_WinPhone8CameraFlags = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb7b4d61c_u32, 0x5a64_u16, 0x4187_u16, StaticArray[0xa5_u8, 0x2e_u8, 0xb1_u8, 0x53_u8, 0x9f_u8, 0x35_u8, 0x90_u8, 0x99_u8]), 2_u32)
  PKEY_Devices_Wwan_InterfaceGuid = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xff1167eb_u32, 0xcbfc_u16, 0x4341_u16, StaticArray[0xa5_u8, 0x68_u8, 0xa7_u8, 0xc9_u8, 0x1a_u8, 0x68_u8, 0x98_u8, 0x2c_u8]), 2_u32)
  PKEY_Storage_Portable = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4d1ebee8_u32, 0x803_u16, 0x4774_u16, StaticArray[0x98_u8, 0x42_u8, 0xb7_u8, 0x7d_u8, 0xb5_u8, 0x2_u8, 0x65_u8, 0xe9_u8]), 2_u32)
  PKEY_Storage_RemovableMedia = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4d1ebee8_u32, 0x803_u16, 0x4774_u16, StaticArray[0x98_u8, 0x42_u8, 0xb7_u8, 0x7d_u8, 0xb5_u8, 0x2_u8, 0x65_u8, 0xe9_u8]), 3_u32)
  PKEY_Storage_SystemCritical = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4d1ebee8_u32, 0x803_u16, 0x4774_u16, StaticArray[0x98_u8, 0x42_u8, 0xb7_u8, 0x7d_u8, 0xb5_u8, 0x2_u8, 0x65_u8, 0xe9_u8]), 4_u32)
  PKEY_Document_ByteCount = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd5cdd502_u32, 0x2e9c_u16, 0x101b_u16, StaticArray[0x93_u8, 0x97_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2c_u8, 0xf9_u8, 0xae_u8]), 4_u32)
  PKEY_Document_CharacterCount = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 16_u32)
  PKEY_Document_ClientID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x276d7bb0_u32, 0x5b34_u16, 0x4fb0_u16, StaticArray[0xaa_u8, 0x4b_u8, 0x15_u8, 0x8e_u8, 0xd1_u8, 0x2a_u8, 0x18_u8, 0x9_u8]), 100_u32)
  PKEY_Document_Contributor = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf334115e_u32, 0xda1b_u16, 0x4509_u16, StaticArray[0x9b_u8, 0x3d_u8, 0x11_u8, 0x95_u8, 0x4_u8, 0xdc_u8, 0x7a_u8, 0xbb_u8]), 100_u32)
  PKEY_Document_DateCreated = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 12_u32)
  PKEY_Document_DatePrinted = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 11_u32)
  PKEY_Document_DateSaved = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 13_u32)
  PKEY_Document_Division = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1e005ee6_u32, 0xbf27_u16, 0x428b_u16, StaticArray[0xb0_u8, 0x1c_u8, 0x79_u8, 0x67_u8, 0x6a_u8, 0xcd_u8, 0x28_u8, 0x70_u8]), 100_u32)
  PKEY_Document_DocumentID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe08805c8_u32, 0xe395_u16, 0x40df_u16, StaticArray[0x80_u8, 0xd2_u8, 0x54_u8, 0xf0_u8, 0xd6_u8, 0xc4_u8, 0x31_u8, 0x54_u8]), 100_u32)
  PKEY_Document_HiddenSlideCount = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd5cdd502_u32, 0x2e9c_u16, 0x101b_u16, StaticArray[0x93_u8, 0x97_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2c_u8, 0xf9_u8, 0xae_u8]), 9_u32)
  PKEY_Document_LastAuthor = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 8_u32)
  PKEY_Document_LineCount = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd5cdd502_u32, 0x2e9c_u16, 0x101b_u16, StaticArray[0x93_u8, 0x97_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2c_u8, 0xf9_u8, 0xae_u8]), 5_u32)
  PKEY_Document_Manager = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd5cdd502_u32, 0x2e9c_u16, 0x101b_u16, StaticArray[0x93_u8, 0x97_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2c_u8, 0xf9_u8, 0xae_u8]), 14_u32)
  PKEY_Document_MultimediaClipCount = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd5cdd502_u32, 0x2e9c_u16, 0x101b_u16, StaticArray[0x93_u8, 0x97_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2c_u8, 0xf9_u8, 0xae_u8]), 10_u32)
  PKEY_Document_NoteCount = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd5cdd502_u32, 0x2e9c_u16, 0x101b_u16, StaticArray[0x93_u8, 0x97_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2c_u8, 0xf9_u8, 0xae_u8]), 8_u32)
  PKEY_Document_PageCount = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 14_u32)
  PKEY_Document_ParagraphCount = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd5cdd502_u32, 0x2e9c_u16, 0x101b_u16, StaticArray[0x93_u8, 0x97_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2c_u8, 0xf9_u8, 0xae_u8]), 6_u32)
  PKEY_Document_PresentationFormat = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd5cdd502_u32, 0x2e9c_u16, 0x101b_u16, StaticArray[0x93_u8, 0x97_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2c_u8, 0xf9_u8, 0xae_u8]), 3_u32)
  PKEY_Document_RevisionNumber = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 9_u32)
  PKEY_Document_Security = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 19_u32)
  PKEY_Document_SlideCount = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd5cdd502_u32, 0x2e9c_u16, 0x101b_u16, StaticArray[0x93_u8, 0x97_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2c_u8, 0xf9_u8, 0xae_u8]), 7_u32)
  PKEY_Document_Template = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 7_u32)
  PKEY_Document_TotalEditingTime = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 10_u32)
  PKEY_Document_Version = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd5cdd502_u32, 0x2e9c_u16, 0x101b_u16, StaticArray[0x93_u8, 0x97_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2c_u8, 0xf9_u8, 0xae_u8]), 29_u32)
  PKEY_Document_WordCount = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf29f85e0_u32, 0x4ff9_u16, 0x1068_u16, StaticArray[0xab_u8, 0x91_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x27_u8, 0xb3_u8, 0xd9_u8]), 15_u32)
  PKEY_DRM_DatePlayExpires = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xaeac19e4_u32, 0x89ae_u16, 0x4508_u16, StaticArray[0xb9_u8, 0xb7_u8, 0xbb_u8, 0x86_u8, 0x7a_u8, 0xbe_u8, 0xe2_u8, 0xed_u8]), 6_u32)
  PKEY_DRM_DatePlayStarts = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xaeac19e4_u32, 0x89ae_u16, 0x4508_u16, StaticArray[0xb9_u8, 0xb7_u8, 0xbb_u8, 0x86_u8, 0x7a_u8, 0xbe_u8, 0xe2_u8, 0xed_u8]), 5_u32)
  PKEY_DRM_Description = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xaeac19e4_u32, 0x89ae_u16, 0x4508_u16, StaticArray[0xb9_u8, 0xb7_u8, 0xbb_u8, 0x86_u8, 0x7a_u8, 0xbe_u8, 0xe2_u8, 0xed_u8]), 3_u32)
  PKEY_DRM_IsDisabled = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xaeac19e4_u32, 0x89ae_u16, 0x4508_u16, StaticArray[0xb9_u8, 0xb7_u8, 0xbb_u8, 0x86_u8, 0x7a_u8, 0xbe_u8, 0xe2_u8, 0xed_u8]), 7_u32)
  PKEY_DRM_IsProtected = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xaeac19e4_u32, 0x89ae_u16, 0x4508_u16, StaticArray[0xb9_u8, 0xb7_u8, 0xbb_u8, 0x86_u8, 0x7a_u8, 0xbe_u8, 0xe2_u8, 0xed_u8]), 2_u32)
  PKEY_DRM_PlayCount = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xaeac19e4_u32, 0x89ae_u16, 0x4508_u16, StaticArray[0xb9_u8, 0xb7_u8, 0xbb_u8, 0x86_u8, 0x7a_u8, 0xbe_u8, 0xe2_u8, 0xed_u8]), 4_u32)
  PKEY_GPS_Altitude = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x827edb4f_u32, 0x5b73_u16, 0x44a7_u16, StaticArray[0x89_u8, 0x1d_u8, 0xfd_u8, 0xff_u8, 0xab_u8, 0xea_u8, 0x35_u8, 0xca_u8]), 100_u32)
  PKEY_GPS_AltitudeDenominator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x78342dcb_u32, 0xe358_u16, 0x4145_u16, StaticArray[0xae_u8, 0x9a_u8, 0x6b_u8, 0xfe_u8, 0x4e_u8, 0xf_u8, 0x9f_u8, 0x51_u8]), 100_u32)
  PKEY_GPS_AltitudeNumerator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2dad1eb7_u32, 0x816d_u16, 0x40d3_u16, StaticArray[0x9e_u8, 0xc3_u8, 0xc9_u8, 0x77_u8, 0x3b_u8, 0xe2_u8, 0xaa_u8, 0xde_u8]), 100_u32)
  PKEY_GPS_AltitudeRef = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x46ac629d_u32, 0x75ea_u16, 0x4515_u16, StaticArray[0x86_u8, 0x7f_u8, 0x6d_u8, 0xc4_u8, 0x32_u8, 0x1c_u8, 0x58_u8, 0x44_u8]), 100_u32)
  PKEY_GPS_AreaInformation = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x972e333e_u32, 0xac7e_u16, 0x49f1_u16, StaticArray[0x8a_u8, 0xdf_u8, 0xa7_u8, 0xd_u8, 0x7_u8, 0xa9_u8, 0xbc_u8, 0xab_u8]), 100_u32)
  PKEY_GPS_Date = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x3602c812_u32, 0xf3b_u16, 0x45f0_u16, StaticArray[0x85_u8, 0xad_u8, 0x60_u8, 0x34_u8, 0x68_u8, 0xd6_u8, 0x94_u8, 0x23_u8]), 100_u32)
  PKEY_GPS_DestBearing = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc66d4b3c_u32, 0xe888_u16, 0x47cc_u16, StaticArray[0xb9_u8, 0x9f_u8, 0x9d_u8, 0xca_u8, 0x3e_u8, 0xe3_u8, 0x4d_u8, 0xea_u8]), 100_u32)
  PKEY_GPS_DestBearingDenominator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7abcf4f8_u32, 0x7c3f_u16, 0x4988_u16, StaticArray[0xac_u8, 0x91_u8, 0x8d_u8, 0x2c_u8, 0x2e_u8, 0x97_u8, 0xec_u8, 0xa5_u8]), 100_u32)
  PKEY_GPS_DestBearingNumerator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xba3b1da9_u32, 0x86ee_u16, 0x4b5d_u16, StaticArray[0xa2_u8, 0xa4_u8, 0xa2_u8, 0x71_u8, 0xa4_u8, 0x29_u8, 0xf0_u8, 0xcf_u8]), 100_u32)
  PKEY_GPS_DestBearingRef = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9ab84393_u32, 0x2a0f_u16, 0x4b75_u16, StaticArray[0xbb_u8, 0x22_u8, 0x72_u8, 0x79_u8, 0x78_u8, 0x69_u8, 0x77_u8, 0xcb_u8]), 100_u32)
  PKEY_GPS_DestDistance = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa93eae04_u32, 0x6804_u16, 0x4f24_u16, StaticArray[0xac_u8, 0x81_u8, 0x9_u8, 0xb2_u8, 0x66_u8, 0x45_u8, 0x21_u8, 0x18_u8]), 100_u32)
  PKEY_GPS_DestDistanceDenominator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9bc2c99b_u32, 0xac71_u16, 0x4127_u16, StaticArray[0x9d_u8, 0x1c_u8, 0x25_u8, 0x96_u8, 0xd0_u8, 0xd7_u8, 0xdc_u8, 0xb7_u8]), 100_u32)
  PKEY_GPS_DestDistanceNumerator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2bda47da_u32, 0x8c6_u16, 0x4fe1_u16, StaticArray[0x80_u8, 0xbc_u8, 0xa7_u8, 0x2f_u8, 0xc5_u8, 0x17_u8, 0xc5_u8, 0xd0_u8]), 100_u32)
  PKEY_GPS_DestDistanceRef = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xed4df2d3_u32, 0x8695_u16, 0x450b_u16, StaticArray[0x85_u8, 0x6f_u8, 0xf5_u8, 0xc1_u8, 0xc5_u8, 0x3a_u8, 0xcb_u8, 0x66_u8]), 100_u32)
  PKEY_GPS_DestLatitude = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9d1d7cc5_u32, 0x5c39_u16, 0x451c_u16, StaticArray[0x86_u8, 0xb3_u8, 0x92_u8, 0x8e_u8, 0x2d_u8, 0x18_u8, 0xcc_u8, 0x47_u8]), 100_u32)
  PKEY_GPS_DestLatitudeDenominator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x3a372292_u32, 0x7fca_u16, 0x49a7_u16, StaticArray[0x99_u8, 0xd5_u8, 0xe4_u8, 0x7b_u8, 0xb2_u8, 0xd4_u8, 0xe7_u8, 0xab_u8]), 100_u32)
  PKEY_GPS_DestLatitudeNumerator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xecf4b6f6_u32, 0xd5a6_u16, 0x433c_u16, StaticArray[0xbb_u8, 0x92_u8, 0x40_u8, 0x76_u8, 0x65_u8, 0xf_u8, 0xc8_u8, 0x90_u8]), 100_u32)
  PKEY_GPS_DestLatitudeRef = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcea820b9_u32, 0xce61_u16, 0x4885_u16, StaticArray[0xa1_u8, 0x28_u8, 0x0_u8, 0x5d_u8, 0x90_u8, 0x87_u8, 0xc1_u8, 0x92_u8]), 100_u32)
  PKEY_GPS_DestLongitude = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x47a96261_u32, 0xcb4c_u16, 0x4807_u16, StaticArray[0x8a_u8, 0xd3_u8, 0x40_u8, 0xb9_u8, 0xd9_u8, 0xdb_u8, 0xc6_u8, 0xbc_u8]), 100_u32)
  PKEY_GPS_DestLongitudeDenominator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x425d69e5_u32, 0x48ad_u16, 0x4900_u16, StaticArray[0x8d_u8, 0x80_u8, 0x6e_u8, 0xb6_u8, 0xb8_u8, 0xd0_u8, 0xac_u8, 0x86_u8]), 100_u32)
  PKEY_GPS_DestLongitudeNumerator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa3250282_u32, 0xfb6d_u16, 0x48d5_u16, StaticArray[0x9a_u8, 0x89_u8, 0xdb_u8, 0xca_u8, 0xce_u8, 0x75_u8, 0xcc_u8, 0xcf_u8]), 100_u32)
  PKEY_GPS_DestLongitudeRef = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x182c1ea6_u32, 0x7c1c_u16, 0x4083_u16, StaticArray[0xab_u8, 0x4b_u8, 0xac_u8, 0x6c_u8, 0x9f_u8, 0x4e_u8, 0xd1_u8, 0x28_u8]), 100_u32)
  PKEY_GPS_Differential = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xaaf4ee25_u32, 0xbd3b_u16, 0x4dd7_u16, StaticArray[0xbf_u8, 0xc4_u8, 0x47_u8, 0xf7_u8, 0x7b_u8, 0xb0_u8, 0xf_u8, 0x6d_u8]), 100_u32)
  PKEY_GPS_DOP = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcf8fb02_u32, 0x1837_u16, 0x42f1_u16, StaticArray[0xa6_u8, 0x97_u8, 0xa7_u8, 0x1_u8, 0x7a_u8, 0xa2_u8, 0x89_u8, 0xb9_u8]), 100_u32)
  PKEY_GPS_DOPDenominator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa0be94c5_u32, 0x50ba_u16, 0x487b_u16, StaticArray[0xbd_u8, 0x35_u8, 0x6_u8, 0x54_u8, 0xbe_u8, 0x88_u8, 0x81_u8, 0xed_u8]), 100_u32)
  PKEY_GPS_DOPNumerator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x47166b16_u32, 0x364f_u16, 0x4aa0_u16, StaticArray[0x9f_u8, 0x31_u8, 0xe2_u8, 0xab_u8, 0x3d_u8, 0xf4_u8, 0x49_u8, 0xc3_u8]), 100_u32)
  PKEY_GPS_ImgDirection = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x16473c91_u32, 0xd017_u16, 0x4ed9_u16, StaticArray[0xba_u8, 0x4d_u8, 0xb6_u8, 0xba_u8, 0xa5_u8, 0x5d_u8, 0xbc_u8, 0xf8_u8]), 100_u32)
  PKEY_GPS_ImgDirectionDenominator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x10b24595_u32, 0x41a2_u16, 0x4e20_u16, StaticArray[0x93_u8, 0xc2_u8, 0x57_u8, 0x61_u8, 0xc1_u8, 0x39_u8, 0x5f_u8, 0x32_u8]), 100_u32)
  PKEY_GPS_ImgDirectionNumerator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xdc5877c7_u32, 0x225f_u16, 0x45f7_u16, StaticArray[0xba_u8, 0xc7_u8, 0xe8_u8, 0x13_u8, 0x34_u8, 0xb6_u8, 0x13_u8, 0xa_u8]), 100_u32)
  PKEY_GPS_ImgDirectionRef = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa4aaa5b7_u32, 0x1ad0_u16, 0x445f_u16, StaticArray[0x81_u8, 0x1a_u8, 0xf_u8, 0x8f_u8, 0x6e_u8, 0x67_u8, 0xf6_u8, 0xb5_u8]), 100_u32)
  PKEY_GPS_Latitude = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x8727cfff_u32, 0x4868_u16, 0x4ec6_u16, StaticArray[0xad_u8, 0x5b_u8, 0x81_u8, 0xb9_u8, 0x85_u8, 0x21_u8, 0xd1_u8, 0xab_u8]), 100_u32)
  PKEY_GPS_LatitudeDecimal = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf55cde2_u32, 0x4f49_u16, 0x450d_u16, StaticArray[0x92_u8, 0xc1_u8, 0xdc_u8, 0xd1_u8, 0x63_u8, 0x1_u8, 0xb1_u8, 0xb7_u8]), 100_u32)
  PKEY_GPS_LatitudeDenominator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x16e634ee_u32, 0x2bff_u16, 0x497b_u16, StaticArray[0xbd_u8, 0x8a_u8, 0x43_u8, 0x41_u8, 0xad_u8, 0x39_u8, 0xee_u8, 0xb9_u8]), 100_u32)
  PKEY_GPS_LatitudeNumerator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7ddaaad1_u32, 0xccc8_u16, 0x41ae_u16, StaticArray[0xb7_u8, 0x50_u8, 0xb2_u8, 0xcb_u8, 0x80_u8, 0x31_u8, 0xae_u8, 0xa2_u8]), 100_u32)
  PKEY_GPS_LatitudeRef = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x29c0252_u32, 0x5b86_u16, 0x46c7_u16, StaticArray[0xac_u8, 0xa0_u8, 0x27_u8, 0x69_u8, 0xff_u8, 0xc8_u8, 0xe3_u8, 0xd4_u8]), 100_u32)
  PKEY_GPS_Longitude = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc4c4dbb2_u32, 0xb593_u16, 0x466b_u16, StaticArray[0xbb_u8, 0xda_u8, 0xd0_u8, 0x3d_u8, 0x27_u8, 0xd5_u8, 0xe4_u8, 0x3a_u8]), 100_u32)
  PKEY_GPS_LongitudeDecimal = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4679c1b5_u32, 0x844d_u16, 0x4590_u16, StaticArray[0xba_u8, 0xf5_u8, 0xf3_u8, 0x22_u8, 0x23_u8, 0x1f_u8, 0x1b_u8, 0x81_u8]), 100_u32)
  PKEY_GPS_LongitudeDenominator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xbe6e176c_u32, 0x4534_u16, 0x4d2c_u16, StaticArray[0xac_u8, 0xe5_u8, 0x31_u8, 0xde_u8, 0xda_u8, 0xc1_u8, 0x60_u8, 0x6b_u8]), 100_u32)
  PKEY_GPS_LongitudeNumerator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2b0f689_u32, 0xa914_u16, 0x4e45_u16, StaticArray[0x82_u8, 0x1d_u8, 0x1d_u8, 0xda_u8, 0x45_u8, 0x2e_u8, 0xd2_u8, 0xc4_u8]), 100_u32)
  PKEY_GPS_LongitudeRef = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x33dcf22b_u32, 0x28d5_u16, 0x464c_u16, StaticArray[0x80_u8, 0x35_u8, 0x1e_u8, 0xe9_u8, 0xef_u8, 0xd2_u8, 0x52_u8, 0x78_u8]), 100_u32)
  PKEY_GPS_MapDatum = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2ca2dae6_u32, 0xeddc_u16, 0x407d_u16, StaticArray[0xbe_u8, 0xf1_u8, 0x77_u8, 0x39_u8, 0x42_u8, 0xab_u8, 0xfa_u8, 0x95_u8]), 100_u32)
  PKEY_GPS_MeasureMode = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa015ed5d_u32, 0xaaea_u16, 0x4d58_u16, StaticArray[0x8a_u8, 0x86_u8, 0x3c_u8, 0x58_u8, 0x69_u8, 0x20_u8, 0xea_u8, 0xb_u8]), 100_u32)
  PKEY_GPS_ProcessingMethod = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x59d49e61_u32, 0x840f_u16, 0x4aa9_u16, StaticArray[0xa9_u8, 0x39_u8, 0xe2_u8, 0x9_u8, 0x9b_u8, 0x7f_u8, 0x63_u8, 0x99_u8]), 100_u32)
  PKEY_GPS_Satellites = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x467ee575_u32, 0x1f25_u16, 0x4557_u16, StaticArray[0xad_u8, 0x4e_u8, 0xb8_u8, 0xb5_u8, 0x8b_u8, 0xd_u8, 0x9c_u8, 0x15_u8]), 100_u32)
  PKEY_GPS_Speed = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xda5d0862_u32, 0x6e76_u16, 0x4e1b_u16, StaticArray[0xba_u8, 0xbd_u8, 0x70_u8, 0x2_u8, 0x1b_u8, 0xd2_u8, 0x54_u8, 0x94_u8]), 100_u32)
  PKEY_GPS_SpeedDenominator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7d122d5a_u32, 0xae5e_u16, 0x4335_u16, StaticArray[0x88_u8, 0x41_u8, 0xd7_u8, 0x1e_u8, 0x7c_u8, 0xe7_u8, 0x2f_u8, 0x53_u8]), 100_u32)
  PKEY_GPS_SpeedNumerator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xacc9ce3d_u32, 0xc213_u16, 0x4942_u16, StaticArray[0x8b_u8, 0x48_u8, 0x6d_u8, 0x8_u8, 0x20_u8, 0xf2_u8, 0x1c_u8, 0x6d_u8]), 100_u32)
  PKEY_GPS_SpeedRef = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xecf7f4c9_u32, 0x544f_u16, 0x4d6d_u16, StaticArray[0x9d_u8, 0x98_u8, 0x8a_u8, 0xd7_u8, 0x9a_u8, 0xda_u8, 0xf4_u8, 0x53_u8]), 100_u32)
  PKEY_GPS_Status = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x125491f4_u32, 0x818f_u16, 0x46b2_u16, StaticArray[0x91_u8, 0xb5_u8, 0xd5_u8, 0x37_u8, 0x75_u8, 0x36_u8, 0x17_u8, 0xb2_u8]), 100_u32)
  PKEY_GPS_Track = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x76c09943_u32, 0x7c33_u16, 0x49e3_u16, StaticArray[0x9e_u8, 0x7e_u8, 0xcd_u8, 0xba_u8, 0x87_u8, 0x2c_u8, 0xfa_u8, 0xda_u8]), 100_u32)
  PKEY_GPS_TrackDenominator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc8d1920c_u32, 0x1f6_u16, 0x40c0_u16, StaticArray[0xac_u8, 0x86_u8, 0x2f_u8, 0x3a_u8, 0x4a_u8, 0xd0_u8, 0x7_u8, 0x70_u8]), 100_u32)
  PKEY_GPS_TrackNumerator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x702926f4_u32, 0x44a6_u16, 0x43e1_u16, StaticArray[0xae_u8, 0x71_u8, 0x45_u8, 0x62_u8, 0x71_u8, 0x16_u8, 0x89_u8, 0x3b_u8]), 100_u32)
  PKEY_GPS_TrackRef = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x35dbe6fe_u32, 0x44c3_u16, 0x4400_u16, StaticArray[0xaa_u8, 0xae_u8, 0xd2_u8, 0xc7_u8, 0x99_u8, 0xc4_u8, 0x7_u8, 0xe8_u8]), 100_u32)
  PKEY_GPS_VersionID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x22704da4_u32, 0xc6b2_u16, 0x4a99_u16, StaticArray[0x8e_u8, 0x56_u8, 0xf1_u8, 0x6d_u8, 0xf8_u8, 0xc9_u8, 0x25_u8, 0x99_u8]), 100_u32)
  PKEY_History_VisitCount = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x5cbf2787_u32, 0x48cf_u16, 0x4208_u16, StaticArray[0xb9_u8, 0xe_u8, 0xee_u8, 0x5e_u8, 0x5d_u8, 0x42_u8, 0x2_u8, 0x94_u8]), 7_u32)
  PKEY_Image_BitDepth = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6444048f_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 7_u32)
  PKEY_Image_ColorSpace = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 40961_u32)
  PKEY_Image_CompressedBitsPerPixel = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x364b6fa9_u32, 0x37ab_u16, 0x482a_u16, StaticArray[0xbe_u8, 0x2b_u8, 0xae_u8, 0x2_u8, 0xf6_u8, 0xd_u8, 0x43_u8, 0x18_u8]), 100_u32)
  PKEY_Image_CompressedBitsPerPixelDenominator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1f8844e1_u32, 0x24ad_u16, 0x4508_u16, StaticArray[0x9d_u8, 0xfd_u8, 0x53_u8, 0x26_u8, 0xa4_u8, 0x15_u8, 0xce_u8, 0x2_u8]), 100_u32)
  PKEY_Image_CompressedBitsPerPixelNumerator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd21a7148_u32, 0xd32c_u16, 0x4624_u16, StaticArray[0x89_u8, 0x0_u8, 0x27_u8, 0x72_u8, 0x10_u8, 0xf7_u8, 0x9c_u8, 0xf_u8]), 100_u32)
  PKEY_Image_Compression = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 259_u32)
  PKEY_Image_CompressionText = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x3f08e66f_u32, 0x2f44_u16, 0x4bb9_u16, StaticArray[0xa6_u8, 0x82_u8, 0xac_u8, 0x35_u8, 0xd2_u8, 0x56_u8, 0x23_u8, 0x22_u8]), 100_u32)
  PKEY_Image_Dimensions = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6444048f_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 13_u32)
  PKEY_Image_HorizontalResolution = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6444048f_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 5_u32)
  PKEY_Image_HorizontalSize = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6444048f_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 3_u32)
  PKEY_Image_ImageID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x10dabe05_u32, 0x32aa_u16, 0x4c29_u16, StaticArray[0xbf_u8, 0x1a_u8, 0x63_u8, 0xe2_u8, 0xd2_u8, 0x20_u8, 0x58_u8, 0x7f_u8]), 100_u32)
  PKEY_Image_ResolutionUnit = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x19b51fa6_u32, 0x1f92_u16, 0x4a5c_u16, StaticArray[0xab_u8, 0x48_u8, 0x7d_u8, 0xf0_u8, 0xab_u8, 0xd6_u8, 0x74_u8, 0x44_u8]), 100_u32)
  PKEY_Image_VerticalResolution = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6444048f_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 6_u32)
  PKEY_Image_VerticalSize = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6444048f_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 4_u32)
  PKEY_Journal_Contacts = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xdea7c82c_u32, 0x1d89_u16, 0x4a66_u16, StaticArray[0x94_u8, 0x27_u8, 0xa4_u8, 0xe3_u8, 0xde_u8, 0xba_u8, 0xbc_u8, 0xb1_u8]), 100_u32)
  PKEY_Journal_EntryType = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x95beb1fc_u32, 0x326d_u16, 0x4644_u16, StaticArray[0xb3_u8, 0x96_u8, 0xcd_u8, 0x3e_u8, 0xd9_u8, 0xe_u8, 0x6d_u8, 0xdf_u8]), 100_u32)
  PKEY_LayoutPattern_ContentViewModeForBrowse = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc9944a21_u32, 0xa406_u16, 0x48fe_u16, StaticArray[0x82_u8, 0x25_u8, 0xae_u8, 0xc7_u8, 0xe2_u8, 0x4c_u8, 0x21_u8, 0x1b_u8]), 500_u32)
  LAYOUTPATTERN_CVMFB_ALPHA = "alpha"
  LAYOUTPATTERN_CVMFB_BETA = "beta"
  LAYOUTPATTERN_CVMFB_GAMMA = "gamma"
  LAYOUTPATTERN_CVMFB_DELTA = "delta"
  PKEY_LayoutPattern_ContentViewModeForSearch = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc9944a21_u32, 0xa406_u16, 0x48fe_u16, StaticArray[0x82_u8, 0x25_u8, 0xae_u8, 0xc7_u8, 0xe2_u8, 0x4c_u8, 0x21_u8, 0x1b_u8]), 501_u32)
  LAYOUTPATTERN_CVMFS_ALPHA = "alpha"
  LAYOUTPATTERN_CVMFS_BETA = "beta"
  LAYOUTPATTERN_CVMFS_GAMMA = "gamma"
  LAYOUTPATTERN_CVMFS_DELTA = "delta"
  PKEY_History_SelectionCount = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1ce0d6bc_u32, 0x536c_u16, 0x4600_u16, StaticArray[0xb0_u8, 0xdd_u8, 0x7e_u8, 0xc_u8, 0x66_u8, 0xb3_u8, 0x50_u8, 0xd5_u8]), 8_u32)
  PKEY_History_TargetUrlHostName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1ce0d6bc_u32, 0x536c_u16, 0x4600_u16, StaticArray[0xb0_u8, 0xdd_u8, 0x7e_u8, 0xc_u8, 0x66_u8, 0xb3_u8, 0x50_u8, 0xd5_u8]), 9_u32)
  PKEY_Link_Arguments = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x436f2667_u32, 0x14e2_u16, 0x4feb_u16, StaticArray[0xb3_u8, 0xa_u8, 0x14_u8, 0x6c_u8, 0x53_u8, 0xb5_u8, 0xb6_u8, 0x74_u8]), 100_u32)
  PKEY_Link_Comment = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb9b4b3fc_u32, 0x2b51_u16, 0x4a42_u16, StaticArray[0xb5_u8, 0xd8_u8, 0x32_u8, 0x41_u8, 0x46_u8, 0xaf_u8, 0xcf_u8, 0x25_u8]), 5_u32)
  PKEY_Link_DateVisited = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x5cbf2787_u32, 0x48cf_u16, 0x4208_u16, StaticArray[0xb9_u8, 0xe_u8, 0xee_u8, 0x5e_u8, 0x5d_u8, 0x42_u8, 0x2_u8, 0x94_u8]), 23_u32)
  PKEY_Link_Description = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x5cbf2787_u32, 0x48cf_u16, 0x4208_u16, StaticArray[0xb9_u8, 0xe_u8, 0xee_u8, 0x5e_u8, 0x5d_u8, 0x42_u8, 0x2_u8, 0x94_u8]), 21_u32)
  PKEY_Link_FeedItemLocalId = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x8a2f99f9_u32, 0x3c37_u16, 0x465d_u16, StaticArray[0xa8_u8, 0xd7_u8, 0x69_u8, 0x77_u8, 0x7a_u8, 0x24_u8, 0x6d_u8, 0xc_u8]), 2_u32)
  PKEY_Link_Status = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb9b4b3fc_u32, 0x2b51_u16, 0x4a42_u16, StaticArray[0xb5_u8, 0xd8_u8, 0x32_u8, 0x41_u8, 0x46_u8, 0xaf_u8, 0xcf_u8, 0x25_u8]), 3_u32)
  LINK_STATUS_RESOLVED = 1_i32
  LINK_STATUS_BROKEN = 2_i32
  PKEY_Link_TargetExtension = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7a7d76f4_u32, 0xb630_u16, 0x4bd7_u16, StaticArray[0x95_u8, 0xff_u8, 0x37_u8, 0xcc_u8, 0x51_u8, 0xa9_u8, 0x75_u8, 0xc9_u8]), 2_u32)
  PKEY_Link_TargetParsingPath = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb9b4b3fc_u32, 0x2b51_u16, 0x4a42_u16, StaticArray[0xb5_u8, 0xd8_u8, 0x32_u8, 0x41_u8, 0x46_u8, 0xaf_u8, 0xcf_u8, 0x25_u8]), 2_u32)
  PKEY_Link_TargetSFGAOFlags = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb9b4b3fc_u32, 0x2b51_u16, 0x4a42_u16, StaticArray[0xb5_u8, 0xd8_u8, 0x32_u8, 0x41_u8, 0x46_u8, 0xaf_u8, 0xcf_u8, 0x25_u8]), 8_u32)
  PKEY_Link_TargetUrlHostName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x8a2f99f9_u32, 0x3c37_u16, 0x465d_u16, StaticArray[0xa8_u8, 0xd7_u8, 0x69_u8, 0x77_u8, 0x7a_u8, 0x24_u8, 0x6d_u8, 0xc_u8]), 5_u32)
  PKEY_Link_TargetUrlPath = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x8a2f99f9_u32, 0x3c37_u16, 0x465d_u16, StaticArray[0xa8_u8, 0xd7_u8, 0x69_u8, 0x77_u8, 0x7a_u8, 0x24_u8, 0x6d_u8, 0xc_u8]), 6_u32)
  PKEY_Media_AuthorUrl = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 32_u32)
  PKEY_Media_AverageLevel = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9edd5b6_u32, 0xb301_u16, 0x43c5_u16, StaticArray[0x99_u8, 0x90_u8, 0xd0_u8, 0x3_u8, 0x2_u8, 0xef_u8, 0xfd_u8, 0x46_u8]), 100_u32)
  PKEY_Media_ClassPrimaryID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 13_u32)
  PKEY_Media_ClassSecondaryID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 14_u32)
  PKEY_Media_CollectionGroupID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 24_u32)
  PKEY_Media_CollectionID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 25_u32)
  PKEY_Media_ContentDistributor = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 18_u32)
  PKEY_Media_ContentID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 26_u32)
  PKEY_Media_CreatorApplication = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 27_u32)
  PKEY_Media_CreatorApplicationVersion = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 28_u32)
  PKEY_Media_DateEncoded = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2e4b640d_u32, 0x5019_u16, 0x46d8_u16, StaticArray[0x88_u8, 0x81_u8, 0x55_u8, 0x41_u8, 0x4c_u8, 0xc5_u8, 0xca_u8, 0xa0_u8]), 100_u32)
  PKEY_Media_DateReleased = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xde41cc29_u32, 0x6971_u16, 0x4290_u16, StaticArray[0xb4_u8, 0x72_u8, 0xf5_u8, 0x9f_u8, 0x2e_u8, 0x2f_u8, 0x31_u8, 0xe2_u8]), 100_u32)
  PKEY_Media_DlnaProfileID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcfa31b45_u32, 0x525d_u16, 0x4998_u16, StaticArray[0xbb_u8, 0x44_u8, 0x3f_u8, 0x7d_u8, 0x81_u8, 0x54_u8, 0x2f_u8, 0xa4_u8]), 100_u32)
  PKEY_Media_Duration = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440490_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 3_u32)
  PKEY_Media_DVDID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 15_u32)
  PKEY_Media_EncodedBy = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 36_u32)
  PKEY_Media_EncodingSettings = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 37_u32)
  PKEY_Media_EpisodeNumber = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 100_u32)
  PKEY_Media_FrameCount = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6444048f_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 12_u32)
  PKEY_Media_MCDI = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 16_u32)
  PKEY_Media_MetadataContentProvider = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 17_u32)
  PKEY_Media_Producer = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 22_u32)
  PKEY_Media_PromotionUrl = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 33_u32)
  PKEY_Media_ProtectionType = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 38_u32)
  PKEY_Media_ProviderRating = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 39_u32)
  PKEY_Media_ProviderStyle = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 40_u32)
  PKEY_Media_Publisher = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 30_u32)
  PKEY_Media_SeasonNumber = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 101_u32)
  PKEY_Media_SeriesName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 42_u32)
  PKEY_Media_SubscriptionContentId = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9aebae7a_u32, 0x9644_u16, 0x487d_u16, StaticArray[0xa9_u8, 0x2c_u8, 0x65_u8, 0x75_u8, 0x85_u8, 0xed_u8, 0x75_u8, 0x1a_u8]), 100_u32)
  PKEY_Media_SubTitle = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x56a3372e_u32, 0xce9c_u16, 0x11d2_u16, StaticArray[0x9f_u8, 0xe_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xc6_u8, 0x86_u8, 0xf6_u8]), 38_u32)
  PKEY_Media_ThumbnailLargePath = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 47_u32)
  PKEY_Media_ThumbnailLargeUri = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 48_u32)
  PKEY_Media_ThumbnailSmallPath = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 49_u32)
  PKEY_Media_ThumbnailSmallUri = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 50_u32)
  PKEY_Media_UniqueFileIdentifier = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 35_u32)
  PKEY_Media_UserNoAutoInfo = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 41_u32)
  PKEY_Media_UserWebUrl = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 34_u32)
  PKEY_Media_Writer = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 23_u32)
  PKEY_Media_Year = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x56a3372e_u32, 0xce9c_u16, 0x11d2_u16, StaticArray[0x9f_u8, 0xe_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xc6_u8, 0x86_u8, 0xf6_u8]), 5_u32)
  PKEY_Message_AttachmentContents = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x3143bf7c_u32, 0x80a8_u16, 0x4854_u16, StaticArray[0x88_u8, 0x80_u8, 0xe2_u8, 0xe4_u8, 0x1_u8, 0x89_u8, 0xbd_u8, 0xd0_u8]), 100_u32)
  PKEY_Message_AttachmentNames = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe3e0584c_u32, 0xb788_u16, 0x4a5a_u16, StaticArray[0xbb_u8, 0x20_u8, 0x7f_u8, 0x5a_u8, 0x44_u8, 0xc9_u8, 0xac_u8, 0xdd_u8]), 21_u32)
  PKEY_Message_BccAddress = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe3e0584c_u32, 0xb788_u16, 0x4a5a_u16, StaticArray[0xbb_u8, 0x20_u8, 0x7f_u8, 0x5a_u8, 0x44_u8, 0xc9_u8, 0xac_u8, 0xdd_u8]), 2_u32)
  PKEY_Message_BccName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe3e0584c_u32, 0xb788_u16, 0x4a5a_u16, StaticArray[0xbb_u8, 0x20_u8, 0x7f_u8, 0x5a_u8, 0x44_u8, 0xc9_u8, 0xac_u8, 0xdd_u8]), 3_u32)
  PKEY_Message_CcAddress = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe3e0584c_u32, 0xb788_u16, 0x4a5a_u16, StaticArray[0xbb_u8, 0x20_u8, 0x7f_u8, 0x5a_u8, 0x44_u8, 0xc9_u8, 0xac_u8, 0xdd_u8]), 4_u32)
  PKEY_Message_CcName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe3e0584c_u32, 0xb788_u16, 0x4a5a_u16, StaticArray[0xbb_u8, 0x20_u8, 0x7f_u8, 0x5a_u8, 0x44_u8, 0xc9_u8, 0xac_u8, 0xdd_u8]), 5_u32)
  PKEY_Message_ConversationID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xdc8f80bd_u32, 0xaf1e_u16, 0x4289_u16, StaticArray[0x85_u8, 0xb6_u8, 0x3d_u8, 0xfc_u8, 0x1b_u8, 0x49_u8, 0x39_u8, 0x92_u8]), 100_u32)
  PKEY_Message_ConversationIndex = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xdc8f80bd_u32, 0xaf1e_u16, 0x4289_u16, StaticArray[0x85_u8, 0xb6_u8, 0x3d_u8, 0xfc_u8, 0x1b_u8, 0x49_u8, 0x39_u8, 0x92_u8]), 101_u32)
  PKEY_Message_DateReceived = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe3e0584c_u32, 0xb788_u16, 0x4a5a_u16, StaticArray[0xbb_u8, 0x20_u8, 0x7f_u8, 0x5a_u8, 0x44_u8, 0xc9_u8, 0xac_u8, 0xdd_u8]), 20_u32)
  PKEY_Message_DateSent = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe3e0584c_u32, 0xb788_u16, 0x4a5a_u16, StaticArray[0xbb_u8, 0x20_u8, 0x7f_u8, 0x5a_u8, 0x44_u8, 0xc9_u8, 0xac_u8, 0xdd_u8]), 19_u32)
  PKEY_Message_Flags = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa82d9ee7_u32, 0xca67_u16, 0x4312_u16, StaticArray[0x96_u8, 0x5e_u8, 0x22_u8, 0x6b_u8, 0xce_u8, 0xa8_u8, 0x50_u8, 0x23_u8]), 100_u32)
  PKEY_Message_FromAddress = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe3e0584c_u32, 0xb788_u16, 0x4a5a_u16, StaticArray[0xbb_u8, 0x20_u8, 0x7f_u8, 0x5a_u8, 0x44_u8, 0xc9_u8, 0xac_u8, 0xdd_u8]), 13_u32)
  PKEY_Message_FromName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe3e0584c_u32, 0xb788_u16, 0x4a5a_u16, StaticArray[0xbb_u8, 0x20_u8, 0x7f_u8, 0x5a_u8, 0x44_u8, 0xc9_u8, 0xac_u8, 0xdd_u8]), 14_u32)
  PKEY_Message_HasAttachments = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9c1fcf74_u32, 0x2d97_u16, 0x41ba_u16, StaticArray[0xb4_u8, 0xae_u8, 0xcb_u8, 0x2e_u8, 0x36_u8, 0x61_u8, 0xa6_u8, 0xe4_u8]), 8_u32)
  PKEY_Message_IsFwdOrReply = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9a9bc088_u32, 0x4f6d_u16, 0x469e_u16, StaticArray[0x99_u8, 0x19_u8, 0xe7_u8, 0x5_u8, 0x41_u8, 0x20_u8, 0x40_u8, 0xf9_u8]), 100_u32)
  PKEY_Message_MessageClass = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcd9ed458_u32, 0x8ce_u16, 0x418f_u16, StaticArray[0xa7_u8, 0xe_u8, 0xf9_u8, 0x12_u8, 0xc7_u8, 0xbb_u8, 0x9c_u8, 0x5c_u8]), 103_u32)
  PKEY_Message_Participants = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1a9ba605_u32, 0x8e7c_u16, 0x4d11_u16, StaticArray[0xad_u8, 0x7d_u8, 0xa5_u8, 0xa_u8, 0xda_u8, 0x18_u8, 0xba_u8, 0x1b_u8]), 2_u32)
  PKEY_Message_ProofInProgress = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9098f33c_u32, 0x9a7d_u16, 0x48a8_u16, StaticArray[0x8d_u8, 0xe5_u8, 0x2e_u8, 0x12_u8, 0x27_u8, 0xa6_u8, 0x4e_u8, 0x91_u8]), 100_u32)
  PKEY_Message_SenderAddress = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xbe1c8e7_u32, 0x1981_u16, 0x4676_u16, StaticArray[0xae_u8, 0x14_u8, 0xfd_u8, 0xd7_u8, 0x8f_u8, 0x5_u8, 0xa6_u8, 0xe7_u8]), 100_u32)
  PKEY_Message_SenderName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xda41cfa_u32, 0xd224_u16, 0x4a18_u16, StaticArray[0xae_u8, 0x2f_u8, 0x59_u8, 0x61_u8, 0x58_u8, 0xdb_u8, 0x4b_u8, 0x3a_u8]), 100_u32)
  PKEY_Message_Store = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe3e0584c_u32, 0xb788_u16, 0x4a5a_u16, StaticArray[0xbb_u8, 0x20_u8, 0x7f_u8, 0x5a_u8, 0x44_u8, 0xc9_u8, 0xac_u8, 0xdd_u8]), 15_u32)
  PKEY_Message_ToAddress = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe3e0584c_u32, 0xb788_u16, 0x4a5a_u16, StaticArray[0xbb_u8, 0x20_u8, 0x7f_u8, 0x5a_u8, 0x44_u8, 0xc9_u8, 0xac_u8, 0xdd_u8]), 16_u32)
  PKEY_Message_ToDoFlags = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1f856a9f_u32, 0x6900_u16, 0x4aba_u16, StaticArray[0x95_u8, 0x5_u8, 0x2d_u8, 0x5f_u8, 0x1b_u8, 0x4d_u8, 0x66_u8, 0xcb_u8]), 100_u32)
  PKEY_Message_ToDoTitle = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xbccc8a3c_u32, 0x8cef_u16, 0x42e5_u16, StaticArray[0x9b_u8, 0x1c_u8, 0xc6_u8, 0x90_u8, 0x79_u8, 0x39_u8, 0x8b_u8, 0xc7_u8]), 100_u32)
  PKEY_Message_ToName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe3e0584c_u32, 0xb788_u16, 0x4a5a_u16, StaticArray[0xbb_u8, 0x20_u8, 0x7f_u8, 0x5a_u8, 0x44_u8, 0xc9_u8, 0xac_u8, 0xdd_u8]), 17_u32)
  PKEY_MsGraph_ActivityType = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4f85567e_u32, 0xfff0_u16, 0x4df5_u16, StaticArray[0xb1_u8, 0xd9_u8, 0x98_u8, 0xb3_u8, 0x14_u8, 0xff_u8, 0x7_u8, 0x29_u8]), 14_u32)
  PKEY_MsGraph_CompositeId = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4f85567e_u32, 0xfff0_u16, 0x4df5_u16, StaticArray[0xb1_u8, 0xd9_u8, 0x98_u8, 0xb3_u8, 0x14_u8, 0xff_u8, 0x7_u8, 0x29_u8]), 2_u32)
  PKEY_MsGraph_DateLastShared = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4f85567e_u32, 0xfff0_u16, 0x4df5_u16, StaticArray[0xb1_u8, 0xd9_u8, 0x98_u8, 0xb3_u8, 0x14_u8, 0xff_u8, 0x7_u8, 0x29_u8]), 9_u32)
  PKEY_MsGraph_DriveId = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4f85567e_u32, 0xfff0_u16, 0x4df5_u16, StaticArray[0xb1_u8, 0xd9_u8, 0x98_u8, 0xb3_u8, 0x14_u8, 0xff_u8, 0x7_u8, 0x29_u8]), 3_u32)
  PKEY_MsGraph_GraphFileType = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4f85567e_u32, 0xfff0_u16, 0x4df5_u16, StaticArray[0xb1_u8, 0xd9_u8, 0x98_u8, 0xb3_u8, 0x14_u8, 0xff_u8, 0x7_u8, 0x29_u8]), 16_u32)
  PKEY_MsGraph_IconUrl = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4f85567e_u32, 0xfff0_u16, 0x4df5_u16, StaticArray[0xb1_u8, 0xd9_u8, 0x98_u8, 0xb3_u8, 0x14_u8, 0xff_u8, 0x7_u8, 0x29_u8]), 15_u32)
  PKEY_MsGraph_ItemId = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4f85567e_u32, 0xfff0_u16, 0x4df5_u16, StaticArray[0xb1_u8, 0xd9_u8, 0x98_u8, 0xb3_u8, 0x14_u8, 0xff_u8, 0x7_u8, 0x29_u8]), 4_u32)
  PKEY_MsGraph_PrimaryActivityActorDisplayName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4f85567e_u32, 0xfff0_u16, 0x4df5_u16, StaticArray[0xb1_u8, 0xd9_u8, 0x98_u8, 0xb3_u8, 0x14_u8, 0xff_u8, 0x7_u8, 0x29_u8]), 13_u32)
  PKEY_MsGraph_PrimaryActivityActorUpn = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4f85567e_u32, 0xfff0_u16, 0x4df5_u16, StaticArray[0xb1_u8, 0xd9_u8, 0x98_u8, 0xb3_u8, 0x14_u8, 0xff_u8, 0x7_u8, 0x29_u8]), 12_u32)
  PKEY_MsGraph_RecommendationReason = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4f85567e_u32, 0xfff0_u16, 0x4df5_u16, StaticArray[0xb1_u8, 0xd9_u8, 0x98_u8, 0xb3_u8, 0x14_u8, 0xff_u8, 0x7_u8, 0x29_u8]), 8_u32)
  PKEY_MsGraph_RecommendationReferenceId = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4f85567e_u32, 0xfff0_u16, 0x4df5_u16, StaticArray[0xb1_u8, 0xd9_u8, 0x98_u8, 0xb3_u8, 0x14_u8, 0xff_u8, 0x7_u8, 0x29_u8]), 5_u32)
  PKEY_MsGraph_RecommendationResultSourceId = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4f85567e_u32, 0xfff0_u16, 0x4df5_u16, StaticArray[0xb1_u8, 0xd9_u8, 0x98_u8, 0xb3_u8, 0x14_u8, 0xff_u8, 0x7_u8, 0x29_u8]), 7_u32)
  PKEY_MsGraph_SharedByEmail = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4f85567e_u32, 0xfff0_u16, 0x4df5_u16, StaticArray[0xb1_u8, 0xd9_u8, 0x98_u8, 0xb3_u8, 0x14_u8, 0xff_u8, 0x7_u8, 0x29_u8]), 11_u32)
  PKEY_MsGraph_SharedByName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4f85567e_u32, 0xfff0_u16, 0x4df5_u16, StaticArray[0xb1_u8, 0xd9_u8, 0x98_u8, 0xb3_u8, 0x14_u8, 0xff_u8, 0x7_u8, 0x29_u8]), 10_u32)
  PKEY_MsGraph_WebAccountId = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4f85567e_u32, 0xfff0_u16, 0x4df5_u16, StaticArray[0xb1_u8, 0xd9_u8, 0x98_u8, 0xb3_u8, 0x14_u8, 0xff_u8, 0x7_u8, 0x29_u8]), 6_u32)
  PKEY_Music_AlbumArtist = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x56a3372e_u32, 0xce9c_u16, 0x11d2_u16, StaticArray[0x9f_u8, 0xe_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xc6_u8, 0x86_u8, 0xf6_u8]), 13_u32)
  PKEY_Music_AlbumArtistSortOverride = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf1fdb4af_u32, 0xf78c_u16, 0x466c_u16, StaticArray[0xbb_u8, 0x5_u8, 0x56_u8, 0xe9_u8, 0x2d_u8, 0xb0_u8, 0xb8_u8, 0xec_u8]), 103_u32)
  PKEY_Music_AlbumID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x56a3372e_u32, 0xce9c_u16, 0x11d2_u16, StaticArray[0x9f_u8, 0xe_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xc6_u8, 0x86_u8, 0xf6_u8]), 100_u32)
  PKEY_Music_AlbumTitle = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x56a3372e_u32, 0xce9c_u16, 0x11d2_u16, StaticArray[0x9f_u8, 0xe_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xc6_u8, 0x86_u8, 0xf6_u8]), 4_u32)
  PKEY_Music_AlbumTitleSortOverride = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x13eb7ffc_u32, 0xec89_u16, 0x4346_u16, StaticArray[0xb1_u8, 0x9d_u8, 0xcc_u8, 0xc6_u8, 0xf1_u8, 0x78_u8, 0x42_u8, 0x23_u8]), 101_u32)
  PKEY_Music_Artist = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x56a3372e_u32, 0xce9c_u16, 0x11d2_u16, StaticArray[0x9f_u8, 0xe_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xc6_u8, 0x86_u8, 0xf6_u8]), 2_u32)
  PKEY_Music_ArtistSortOverride = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xdeeb2db5_u32, 0x696_u16, 0x4ce0_u16, StaticArray[0x94_u8, 0xfe_u8, 0xa0_u8, 0x1f_u8, 0x77_u8, 0xa4_u8, 0x5f_u8, 0xb5_u8]), 102_u32)
  PKEY_Music_BeatsPerMinute = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x56a3372e_u32, 0xce9c_u16, 0x11d2_u16, StaticArray[0x9f_u8, 0xe_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xc6_u8, 0x86_u8, 0xf6_u8]), 35_u32)
  PKEY_Music_Composer = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 19_u32)
  PKEY_Music_ComposerSortOverride = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xbc20a3_u32, 0xbd48_u16, 0x4085_u16, StaticArray[0x87_u8, 0x2c_u8, 0xa8_u8, 0x8d_u8, 0x77_u8, 0xf5_u8, 0x9_u8, 0x7e_u8]), 105_u32)
  PKEY_Music_Conductor = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x56a3372e_u32, 0xce9c_u16, 0x11d2_u16, StaticArray[0x9f_u8, 0xe_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xc6_u8, 0x86_u8, 0xf6_u8]), 36_u32)
  PKEY_Music_ContentGroupDescription = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x56a3372e_u32, 0xce9c_u16, 0x11d2_u16, StaticArray[0x9f_u8, 0xe_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xc6_u8, 0x86_u8, 0xf6_u8]), 33_u32)
  PKEY_Music_DiscNumber = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6afe7437_u32, 0x9bcd_u16, 0x49c7_u16, StaticArray[0x80_u8, 0xfe_u8, 0x4a_u8, 0x5c_u8, 0x65_u8, 0xfa_u8, 0x58_u8, 0x74_u8]), 104_u32)
  PKEY_Music_DisplayArtist = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfd122953_u32, 0xfa93_u16, 0x4ef7_u16, StaticArray[0x92_u8, 0xc3_u8, 0x4_u8, 0xc9_u8, 0x46_u8, 0xb2_u8, 0xf7_u8, 0xc8_u8]), 100_u32)
  PKEY_Music_Genre = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x56a3372e_u32, 0xce9c_u16, 0x11d2_u16, StaticArray[0x9f_u8, 0xe_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xc6_u8, 0x86_u8, 0xf6_u8]), 11_u32)
  PKEY_Music_InitialKey = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x56a3372e_u32, 0xce9c_u16, 0x11d2_u16, StaticArray[0x9f_u8, 0xe_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xc6_u8, 0x86_u8, 0xf6_u8]), 34_u32)
  PKEY_Music_IsCompilation = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc449d5cb_u32, 0x9ea4_u16, 0x4809_u16, StaticArray[0x82_u8, 0xe8_u8, 0xaf_u8, 0x9d_u8, 0x59_u8, 0xde_u8, 0xd6_u8, 0xd1_u8]), 100_u32)
  PKEY_Music_Lyrics = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x56a3372e_u32, 0xce9c_u16, 0x11d2_u16, StaticArray[0x9f_u8, 0xe_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xc6_u8, 0x86_u8, 0xf6_u8]), 12_u32)
  PKEY_Music_Mood = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x56a3372e_u32, 0xce9c_u16, 0x11d2_u16, StaticArray[0x9f_u8, 0xe_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xc6_u8, 0x86_u8, 0xf6_u8]), 39_u32)
  PKEY_Music_PartOfSet = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x56a3372e_u32, 0xce9c_u16, 0x11d2_u16, StaticArray[0x9f_u8, 0xe_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xc6_u8, 0x86_u8, 0xf6_u8]), 37_u32)
  PKEY_Music_Period = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 31_u32)
  PKEY_Music_SynchronizedLyrics = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6b223b6a_u32, 0x162e_u16, 0x4aa9_u16, StaticArray[0xb3_u8, 0x9f_u8, 0x5_u8, 0xd6_u8, 0x78_u8, 0xfc_u8, 0x6d_u8, 0x77_u8]), 100_u32)
  PKEY_Music_TrackNumber = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x56a3372e_u32, 0xce9c_u16, 0x11d2_u16, StaticArray[0x9f_u8, 0xe_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xc6_u8, 0x86_u8, 0xf6_u8]), 7_u32)
  PKEY_Note_Color = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4776cafa_u32, 0xbce4_u16, 0x4cb1_u16, StaticArray[0xa2_u8, 0x3e_u8, 0x26_u8, 0x5e_u8, 0x76_u8, 0xd8_u8, 0xeb_u8, 0x11_u8]), 100_u32)
  PKEY_Note_ColorText = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x46b4e8de_u32, 0xcdb2_u16, 0x440d_u16, StaticArray[0x88_u8, 0x5c_u8, 0x16_u8, 0x58_u8, 0xeb_u8, 0x65_u8, 0xb9_u8, 0x14_u8]), 100_u32)
  PKEY_Photo_Aperture = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 37378_u32)
  PKEY_Photo_ApertureDenominator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe1a9a38b_u32, 0x6685_u16, 0x46bd_u16, StaticArray[0x87_u8, 0x5e_u8, 0x57_u8, 0xd_u8, 0xc7_u8, 0xad_u8, 0x73_u8, 0x20_u8]), 100_u32)
  PKEY_Photo_ApertureNumerator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x337ecec_u32, 0x39fb_u16, 0x4581_u16, StaticArray[0xa0_u8, 0xbd_u8, 0x4c_u8, 0x4c_u8, 0xc5_u8, 0x1e_u8, 0x99_u8, 0x14_u8]), 100_u32)
  PKEY_Photo_Brightness = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1a701bf6_u32, 0x478c_u16, 0x4361_u16, StaticArray[0x83_u8, 0xab_u8, 0x37_u8, 0x1_u8, 0xbb_u8, 0x5_u8, 0x3c_u8, 0x58_u8]), 100_u32)
  PKEY_Photo_BrightnessDenominator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6ebe6946_u32, 0x2321_u16, 0x440a_u16, StaticArray[0x90_u8, 0xf0_u8, 0xc0_u8, 0x43_u8, 0xef_u8, 0xd3_u8, 0x24_u8, 0x76_u8]), 100_u32)
  PKEY_Photo_BrightnessNumerator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9e7d118f_u32, 0xb314_u16, 0x45a0_u16, StaticArray[0x8c_u8, 0xfb_u8, 0xd6_u8, 0x54_u8, 0xb9_u8, 0x17_u8, 0xc9_u8, 0xe9_u8]), 100_u32)
  PKEY_Photo_CameraManufacturer = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 271_u32)
  PKEY_Photo_CameraModel = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 272_u32)
  PKEY_Photo_CameraSerialNumber = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 273_u32)
  PKEY_Photo_Contrast = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2a785ba9_u32, 0x8d23_u16, 0x4ded_u16, StaticArray[0x82_u8, 0xe6_u8, 0x60_u8, 0xa3_u8, 0x50_u8, 0xc8_u8, 0x6a_u8, 0x10_u8]), 100_u32)
  PHOTO_CONTRAST_NORMAL = 0_u32
  PHOTO_CONTRAST_SOFT = 1_u32
  PHOTO_CONTRAST_HARD = 2_u32
  PKEY_Photo_ContrastText = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x59dde9f2_u32, 0x5253_u16, 0x40ea_u16, StaticArray[0x9a_u8, 0x8b_u8, 0x47_u8, 0x9e_u8, 0x96_u8, 0xc6_u8, 0x24_u8, 0x9a_u8]), 100_u32)
  PKEY_Photo_DateTaken = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 36867_u32)
  PKEY_Photo_DigitalZoom = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf85bf840_u32, 0xa925_u16, 0x4bc2_u16, StaticArray[0xb0_u8, 0xc4_u8, 0x8e_u8, 0x36_u8, 0xb5_u8, 0x98_u8, 0x67_u8, 0x9e_u8]), 100_u32)
  PKEY_Photo_DigitalZoomDenominator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x745baf0e_u32, 0xe5c1_u16, 0x4cfb_u16, StaticArray[0x8a_u8, 0x1b_u8, 0xd0_u8, 0x31_u8, 0xa0_u8, 0xa5_u8, 0x23_u8, 0x93_u8]), 100_u32)
  PKEY_Photo_DigitalZoomNumerator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x16cbb924_u32, 0x6500_u16, 0x473b_u16, StaticArray[0xa5_u8, 0xbe_u8, 0xf1_u8, 0x59_u8, 0x9b_u8, 0xcb_u8, 0xe4_u8, 0x13_u8]), 100_u32)
  PKEY_Photo_Event = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 18248_u32)
  PKEY_Photo_EXIFVersion = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd35f743a_u32, 0xeb2e_u16, 0x47f2_u16, StaticArray[0xa2_u8, 0x86_u8, 0x84_u8, 0x41_u8, 0x32_u8, 0xcb_u8, 0x14_u8, 0x27_u8]), 100_u32)
  PKEY_Photo_ExposureBias = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 37380_u32)
  PKEY_Photo_ExposureBiasDenominator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xab205e50_u32, 0x4b7_u16, 0x461c_u16, StaticArray[0xa1_u8, 0x8c_u8, 0x2f_u8, 0x23_u8, 0x38_u8, 0x36_u8, 0xe6_u8, 0x27_u8]), 100_u32)
  PKEY_Photo_ExposureBiasNumerator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x738bf284_u32, 0x1d87_u16, 0x420b_u16, StaticArray[0x92_u8, 0xcf_u8, 0x58_u8, 0x34_u8, 0xbf_u8, 0x6e_u8, 0xf9_u8, 0xed_u8]), 100_u32)
  PKEY_Photo_ExposureIndex = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x967b5af8_u32, 0x995a_u16, 0x46ed_u16, StaticArray[0x9e_u8, 0x11_u8, 0x35_u8, 0xb3_u8, 0xc5_u8, 0xb9_u8, 0x78_u8, 0x2d_u8]), 100_u32)
  PKEY_Photo_ExposureIndexDenominator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x93112f89_u32, 0xc28b_u16, 0x492f_u16, StaticArray[0x8a_u8, 0x9d_u8, 0x4b_u8, 0xe2_u8, 0x6_u8, 0x2c_u8, 0xee_u8, 0x8a_u8]), 100_u32)
  PKEY_Photo_ExposureIndexNumerator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcdedcf30_u32, 0x8919_u16, 0x44df_u16, StaticArray[0x8f_u8, 0x4c_u8, 0x4e_u8, 0xb2_u8, 0xff_u8, 0xdb_u8, 0x8d_u8, 0x89_u8]), 100_u32)
  PKEY_Photo_ExposureProgram = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 34850_u32)
  PHOTO_EXPOSUREPROGRAM_UNKNOWN = 0_u32
  PHOTO_EXPOSUREPROGRAM_MANUAL = 1_u32
  PHOTO_EXPOSUREPROGRAM_NORMAL = 2_u32
  PHOTO_EXPOSUREPROGRAM_APERTURE = 3_u32
  PHOTO_EXPOSUREPROGRAM_SHUTTER = 4_u32
  PHOTO_EXPOSUREPROGRAM_CREATIVE = 5_u32
  PHOTO_EXPOSUREPROGRAM_ACTION = 6_u32
  PHOTO_EXPOSUREPROGRAM_PORTRAIT = 7_u32
  PHOTO_EXPOSUREPROGRAM_LANDSCAPE = 8_u32
  PKEY_Photo_ExposureProgramText = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfec690b7_u32, 0x5f30_u16, 0x4646_u16, StaticArray[0xae_u8, 0x47_u8, 0x4c_u8, 0xaa_u8, 0xfb_u8, 0xa8_u8, 0x84_u8, 0xa3_u8]), 100_u32)
  PKEY_Photo_ExposureTime = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 33434_u32)
  PKEY_Photo_ExposureTimeDenominator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x55e98597_u32, 0xad16_u16, 0x42e0_u16, StaticArray[0xb6_u8, 0x24_u8, 0x21_u8, 0x59_u8, 0x9a_u8, 0x19_u8, 0x98_u8, 0x38_u8]), 100_u32)
  PKEY_Photo_ExposureTimeNumerator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x257e44e2_u32, 0x9031_u16, 0x4323_u16, StaticArray[0xac_u8, 0x38_u8, 0x85_u8, 0xc5_u8, 0x52_u8, 0x87_u8, 0x1b_u8, 0x2e_u8]), 100_u32)
  PKEY_Photo_Flash = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 37385_u32)
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
  PKEY_Photo_FlashEnergy = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 41483_u32)
  PKEY_Photo_FlashEnergyDenominator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd7b61c70_u32, 0x6323_u16, 0x49cd_u16, StaticArray[0xa5_u8, 0xfc_u8, 0xc8_u8, 0x42_u8, 0x77_u8, 0x16_u8, 0x2c_u8, 0x97_u8]), 100_u32)
  PKEY_Photo_FlashEnergyNumerator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfcad3d3d_u32, 0x858_u16, 0x400f_u16, StaticArray[0xaa_u8, 0xa3_u8, 0x2f_u8, 0x66_u8, 0xcc_u8, 0xe2_u8, 0xa6_u8, 0xbc_u8]), 100_u32)
  PKEY_Photo_FlashManufacturer = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xaabaf6c9_u32, 0xe0c5_u16, 0x4719_u16, StaticArray[0x85_u8, 0x85_u8, 0x57_u8, 0xb1_u8, 0x3_u8, 0xe5_u8, 0x84_u8, 0xfe_u8]), 100_u32)
  PKEY_Photo_FlashModel = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfe83bb35_u32, 0x4d1a_u16, 0x42e2_u16, StaticArray[0x91_u8, 0x6b_u8, 0x6_u8, 0xf3_u8, 0xe1_u8, 0xaf_u8, 0x71_u8, 0x9e_u8]), 100_u32)
  PKEY_Photo_FlashText = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6b8b68f6_u32, 0x200b_u16, 0x47ea_u16, StaticArray[0x8d_u8, 0x25_u8, 0xd8_u8, 0x5_u8, 0xf_u8, 0x57_u8, 0x33_u8, 0x9f_u8]), 100_u32)
  PKEY_Photo_FNumber = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 33437_u32)
  PKEY_Photo_FNumberDenominator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe92a2496_u32, 0x223b_u16, 0x4463_u16, StaticArray[0xa4_u8, 0xe3_u8, 0x30_u8, 0xea_u8, 0xbb_u8, 0xa7_u8, 0x9d_u8, 0x80_u8]), 100_u32)
  PKEY_Photo_FNumberNumerator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1b97738a_u32, 0xfdfc_u16, 0x462f_u16, StaticArray[0x9d_u8, 0x93_u8, 0x19_u8, 0x57_u8, 0xe0_u8, 0x8b_u8, 0xe9_u8, 0xc_u8]), 100_u32)
  PKEY_Photo_FocalLength = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 37386_u32)
  PKEY_Photo_FocalLengthDenominator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x305bc615_u32, 0xdca1_u16, 0x44a5_u16, StaticArray[0x9f_u8, 0xd4_u8, 0x10_u8, 0xc0_u8, 0xba_u8, 0x79_u8, 0x41_u8, 0x2e_u8]), 100_u32)
  PKEY_Photo_FocalLengthInFilm = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa0e74609_u32, 0xb84d_u16, 0x4f49_u16, StaticArray[0xb8_u8, 0x60_u8, 0x46_u8, 0x2b_u8, 0xd9_u8, 0x97_u8, 0x1f_u8, 0x98_u8]), 100_u32)
  PKEY_Photo_FocalLengthNumerator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x776b6b3b_u32, 0x1e3d_u16, 0x4b0c_u16, StaticArray[0x9a_u8, 0xe_u8, 0x8f_u8, 0xba_u8, 0xf2_u8, 0xa8_u8, 0x49_u8, 0x2a_u8]), 100_u32)
  PKEY_Photo_FocalPlaneXResolution = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcfc08d97_u32, 0xc6f7_u16, 0x4484_u16, StaticArray[0x89_u8, 0xdd_u8, 0xeb_u8, 0xef_u8, 0x43_u8, 0x56_u8, 0xfe_u8, 0x76_u8]), 100_u32)
  PKEY_Photo_FocalPlaneXResolutionDenominator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x933f3f5_u32, 0x4786_u16, 0x4f46_u16, StaticArray[0xa8_u8, 0xe8_u8, 0xd6_u8, 0x4d_u8, 0xd3_u8, 0x7f_u8, 0xa5_u8, 0x21_u8]), 100_u32)
  PKEY_Photo_FocalPlaneXResolutionNumerator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xdccb10af_u32, 0xb4e2_u16, 0x4b88_u16, StaticArray[0x95_u8, 0xf9_u8, 0x3_u8, 0x1b_u8, 0x4d_u8, 0x5a_u8, 0xb4_u8, 0x90_u8]), 100_u32)
  PKEY_Photo_FocalPlaneYResolution = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4fffe4d0_u32, 0x914f_u16, 0x4ac4_u16, StaticArray[0x8d_u8, 0x6f_u8, 0xc9_u8, 0xc6_u8, 0x1d_u8, 0xe1_u8, 0x69_u8, 0xb1_u8]), 100_u32)
  PKEY_Photo_FocalPlaneYResolutionDenominator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1d6179a6_u32, 0xa876_u16, 0x4031_u16, StaticArray[0xb0_u8, 0x13_u8, 0x33_u8, 0x47_u8, 0xb2_u8, 0xb6_u8, 0x4d_u8, 0xc8_u8]), 100_u32)
  PKEY_Photo_FocalPlaneYResolutionNumerator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa2e541c5_u32, 0x4440_u16, 0x4ba8_u16, StaticArray[0x86_u8, 0x7e_u8, 0x75_u8, 0xcf_u8, 0xc0_u8, 0x68_u8, 0x28_u8, 0xcd_u8]), 100_u32)
  PKEY_Photo_GainControl = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfa304789_u32, 0xc7_u16, 0x4d80_u16, StaticArray[0x90_u8, 0x4a_u8, 0x1e_u8, 0x4d_u8, 0xcc_u8, 0x72_u8, 0x65_u8, 0xaa_u8]), 100_u32)
  PHOTO_GAINCONTROL_NONE = 0.0
  PHOTO_GAINCONTROL_LOWGAINUP = 1.0
  PHOTO_GAINCONTROL_HIGHGAINUP = 2.0
  PHOTO_GAINCONTROL_LOWGAINDOWN = 3.0
  PHOTO_GAINCONTROL_HIGHGAINDOWN = 4.0
  PKEY_Photo_GainControlDenominator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x42864dfd_u32, 0x9da4_u16, 0x4f77_u16, StaticArray[0xbd_u8, 0xed_u8, 0x4a_u8, 0xad_u8, 0x7b_u8, 0x25_u8, 0x67_u8, 0x35_u8]), 100_u32)
  PKEY_Photo_GainControlNumerator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x8e8ecf7c_u32, 0xb7b8_u16, 0x4eb8_u16, StaticArray[0xa6_u8, 0x3f_u8, 0xe_u8, 0xe7_u8, 0x15_u8, 0xc9_u8, 0x6f_u8, 0x9e_u8]), 100_u32)
  PKEY_Photo_GainControlText = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc06238b2_u32, 0xbf9_u16, 0x4279_u16, StaticArray[0xa7_u8, 0x23_u8, 0x25_u8, 0x85_u8, 0x67_u8, 0x15_u8, 0xcb_u8, 0x9d_u8]), 100_u32)
  PKEY_Photo_ISOSpeed = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 34855_u32)
  PKEY_Photo_LensManufacturer = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe6ddcaf7_u32, 0x29c5_u16, 0x4f0a_u16, StaticArray[0x9a_u8, 0x68_u8, 0xd1_u8, 0x94_u8, 0x12_u8, 0xec_u8, 0x70_u8, 0x90_u8]), 100_u32)
  PKEY_Photo_LensModel = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe1277516_u32, 0x2b5f_u16, 0x4869_u16, StaticArray[0x89_u8, 0xb1_u8, 0x2e_u8, 0x58_u8, 0x5b_u8, 0xd3_u8, 0x8b_u8, 0x7a_u8]), 100_u32)
  PKEY_Photo_LightSource = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 37384_u32)
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
  PKEY_Photo_MakerNote = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfa303353_u32, 0xb659_u16, 0x4052_u16, StaticArray[0x85_u8, 0xe9_u8, 0xbc_u8, 0xac_u8, 0x79_u8, 0x54_u8, 0x9b_u8, 0x84_u8]), 100_u32)
  PKEY_Photo_MakerNoteOffset = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x813f4124_u32, 0x34e6_u16, 0x4d17_u16, StaticArray[0xab_u8, 0x3e_u8, 0x6b_u8, 0x1f_u8, 0x3c_u8, 0x22_u8, 0x47_u8, 0xa1_u8]), 100_u32)
  PKEY_Photo_MaxAperture = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x8f6d7c2_u32, 0xe3f2_u16, 0x44fc_u16, StaticArray[0xaf_u8, 0x1e_u8, 0x5a_u8, 0xa5_u8, 0xc8_u8, 0x1a_u8, 0x2d_u8, 0x3e_u8]), 100_u32)
  PKEY_Photo_MaxApertureDenominator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc77724d4_u32, 0x601f_u16, 0x46c5_u16, StaticArray[0x9b_u8, 0x89_u8, 0xc5_u8, 0x3f_u8, 0x93_u8, 0xbc_u8, 0xeb_u8, 0x77_u8]), 100_u32)
  PKEY_Photo_MaxApertureNumerator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc107e191_u32, 0xa459_u16, 0x44c5_u16, StaticArray[0x9a_u8, 0xe6_u8, 0xb9_u8, 0x52_u8, 0xad_u8, 0x4b_u8, 0x90_u8, 0x6d_u8]), 100_u32)
  PKEY_Photo_MeteringMode = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 37383_u32)
  PKEY_Photo_MeteringModeText = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf628fd8c_u32, 0x7ba8_u16, 0x465a_u16, StaticArray[0xa6_u8, 0x5b_u8, 0xc5_u8, 0xaa_u8, 0x79_u8, 0x26_u8, 0x3a_u8, 0x9e_u8]), 100_u32)
  PKEY_Photo_Orientation = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 274_u32)
  PKEY_Photo_OrientationText = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa9ea193c_u32, 0xc511_u16, 0x498a_u16, StaticArray[0xa0_u8, 0x6b_u8, 0x58_u8, 0xe2_u8, 0x77_u8, 0x6d_u8, 0xcc_u8, 0x28_u8]), 100_u32)
  PKEY_Photo_PeopleNames = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe8309b6e_u32, 0x84c_u16, 0x49b4_u16, StaticArray[0xb1_u8, 0xfc_u8, 0x90_u8, 0xa8_u8, 0x3_u8, 0x31_u8, 0xb6_u8, 0x38_u8]), 100_u32)
  PKEY_Photo_PhotometricInterpretation = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x341796f1_u32, 0x1df9_u16, 0x4b1c_u16, StaticArray[0xa5_u8, 0x64_u8, 0x91_u8, 0xbd_u8, 0xef_u8, 0xa4_u8, 0x38_u8, 0x77_u8]), 100_u32)
  PKEY_Photo_PhotometricInterpretationText = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x821437d6_u32, 0x9eab_u16, 0x4765_u16, StaticArray[0xa5_u8, 0x89_u8, 0x3b_u8, 0x1c_u8, 0xbb_u8, 0xd2_u8, 0x2a_u8, 0x61_u8]), 100_u32)
  PKEY_Photo_ProgramMode = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6d217f6d_u32, 0x3f6a_u16, 0x4825_u16, StaticArray[0xb4_u8, 0x70_u8, 0x5f_u8, 0x3_u8, 0xca_u8, 0x2f_u8, 0xbe_u8, 0x9b_u8]), 100_u32)
  PHOTO_PROGRAMMODE_NOTDEFINED = 0_u32
  PHOTO_PROGRAMMODE_MANUAL = 1_u32
  PHOTO_PROGRAMMODE_NORMAL = 2_u32
  PHOTO_PROGRAMMODE_APERTURE = 3_u32
  PHOTO_PROGRAMMODE_SHUTTER = 4_u32
  PHOTO_PROGRAMMODE_CREATIVE = 5_u32
  PHOTO_PROGRAMMODE_ACTION = 6_u32
  PHOTO_PROGRAMMODE_PORTRAIT = 7_u32
  PHOTO_PROGRAMMODE_LANDSCAPE = 8_u32
  PKEY_Photo_ProgramModeText = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7fe3aa27_u32, 0x2648_u16, 0x42f3_u16, StaticArray[0x89_u8, 0xb0_u8, 0x45_u8, 0x4e_u8, 0x5c_u8, 0xb1_u8, 0x50_u8, 0xc3_u8]), 100_u32)
  PKEY_Photo_RelatedSoundFile = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x318a6b45_u32, 0x87f_u16, 0x4dc2_u16, StaticArray[0xb8_u8, 0xcc_u8, 0x5_u8, 0x35_u8, 0x95_u8, 0x51_u8, 0xfc_u8, 0x9e_u8]), 100_u32)
  PKEY_Photo_Saturation = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x49237325_u32, 0xa95a_u16, 0x4f67_u16, StaticArray[0xb2_u8, 0x11_u8, 0x81_u8, 0x6b_u8, 0x2d_u8, 0x45_u8, 0xd2_u8, 0xe0_u8]), 100_u32)
  PHOTO_SATURATION_NORMAL = 0_u32
  PHOTO_SATURATION_LOW = 1_u32
  PHOTO_SATURATION_HIGH = 2_u32
  PKEY_Photo_SaturationText = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x61478c08_u32, 0xb600_u16, 0x4a84_u16, StaticArray[0xbb_u8, 0xe4_u8, 0xe9_u8, 0x9c_u8, 0x45_u8, 0xf0_u8, 0xa0_u8, 0x72_u8]), 100_u32)
  PKEY_Photo_Sharpness = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xfc6976db_u32, 0x8349_u16, 0x4970_u16, StaticArray[0xae_u8, 0x97_u8, 0xb3_u8, 0xc5_u8, 0x31_u8, 0x6a_u8, 0x8_u8, 0xf0_u8]), 100_u32)
  PHOTO_SHARPNESS_NORMAL = 0_u32
  PHOTO_SHARPNESS_SOFT = 1_u32
  PHOTO_SHARPNESS_HARD = 2_u32
  PKEY_Photo_SharpnessText = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x51ec3f47_u32, 0xdd50_u16, 0x421d_u16, StaticArray[0x87_u8, 0x69_u8, 0x33_u8, 0x4f_u8, 0x50_u8, 0x42_u8, 0x4b_u8, 0x1e_u8]), 100_u32)
  PKEY_Photo_ShutterSpeed = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 37377_u32)
  PKEY_Photo_ShutterSpeedDenominator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe13d8975_u32, 0x81c7_u16, 0x4948_u16, StaticArray[0xae_u8, 0x3f_u8, 0x37_u8, 0xca_u8, 0xe1_u8, 0x1e_u8, 0x8f_u8, 0xf7_u8]), 100_u32)
  PKEY_Photo_ShutterSpeedNumerator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x16ea4042_u32, 0xd6f4_u16, 0x4bca_u16, StaticArray[0x83_u8, 0x49_u8, 0x7c_u8, 0x78_u8, 0xd3_u8, 0xf_u8, 0xb3_u8, 0x33_u8]), 100_u32)
  PKEY_Photo_SubjectDistance = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x14b81da1_u32, 0x135_u16, 0x4d31_u16, StaticArray[0x96_u8, 0xd9_u8, 0x6c_u8, 0xbf_u8, 0xc9_u8, 0x67_u8, 0x1a_u8, 0x99_u8]), 37382_u32)
  PKEY_Photo_SubjectDistanceDenominator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc840a88_u32, 0xb043_u16, 0x466d_u16, StaticArray[0x97_u8, 0x66_u8, 0xd4_u8, 0xb2_u8, 0x6d_u8, 0xa3_u8, 0xfa_u8, 0x77_u8]), 100_u32)
  PKEY_Photo_SubjectDistanceNumerator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x8af4961c_u32, 0xf526_u16, 0x43e5_u16, StaticArray[0xaa_u8, 0x81_u8, 0xdb_u8, 0x76_u8, 0x82_u8, 0x19_u8, 0x17_u8, 0x8d_u8]), 100_u32)
  PKEY_Photo_TagViewAggregate = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb812f15d_u32, 0xc2d8_u16, 0x4bbf_u16, StaticArray[0xba_u8, 0xcd_u8, 0x79_u8, 0x74_u8, 0x43_u8, 0x46_u8, 0x11_u8, 0x3f_u8]), 100_u32)
  PKEY_Photo_TranscodedForSync = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9a8ebb75_u32, 0x6458_u16, 0x4e82_u16, StaticArray[0xba_u8, 0xcb_u8, 0x35_u8, 0xc0_u8, 0x9_u8, 0x5b_u8, 0x3_u8, 0xbb_u8]), 100_u32)
  PKEY_Photo_WhiteBalance = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xee3d3d8a_u32, 0x5381_u16, 0x4cfa_u16, StaticArray[0xb1_u8, 0x3b_u8, 0xaa_u8, 0xf6_u8, 0x6b_u8, 0x5f_u8, 0x4e_u8, 0xc9_u8]), 100_u32)
  PHOTO_WHITEBALANCE_AUTO = 0_u32
  PHOTO_WHITEBALANCE_MANUAL = 1_u32
  PKEY_Photo_WhiteBalanceText = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6336b95e_u32, 0xc7a7_u16, 0x426d_u16, StaticArray[0x86_u8, 0xfd_u8, 0x7a_u8, 0xe3_u8, 0xd3_u8, 0x9c_u8, 0x84_u8, 0xb4_u8]), 100_u32)
  PKEY_PropGroup_Advanced = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x900a403b_u32, 0x97b_u16, 0x4b95_u16, StaticArray[0x8a_u8, 0xe2_u8, 0x7_u8, 0x1f_u8, 0xda_u8, 0xee_u8, 0xb1_u8, 0x18_u8]), 100_u32)
  PKEY_PropGroup_Audio = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2804d469_u32, 0x788f_u16, 0x48aa_u16, StaticArray[0x85_u8, 0x70_u8, 0x71_u8, 0xb9_u8, 0xc1_u8, 0x87_u8, 0xe1_u8, 0x38_u8]), 100_u32)
  PKEY_PropGroup_Calendar = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9973d2b5_u32, 0xbfd8_u16, 0x438a_u16, StaticArray[0xba_u8, 0x94_u8, 0x53_u8, 0x49_u8, 0xb2_u8, 0x93_u8, 0x18_u8, 0x1a_u8]), 100_u32)
  PKEY_PropGroup_Camera = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xde00de32_u32, 0x547e_u16, 0x4981_u16, StaticArray[0xad_u8, 0x4b_u8, 0x54_u8, 0x2f_u8, 0x2e_u8, 0x90_u8, 0x7_u8, 0xd8_u8]), 100_u32)
  PKEY_PropGroup_Contact = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xdf975fd3_u32, 0x250a_u16, 0x4004_u16, StaticArray[0x85_u8, 0x8f_u8, 0x34_u8, 0xe2_u8, 0x9a_u8, 0x3e_u8, 0x37_u8, 0xaa_u8]), 100_u32)
  PKEY_PropGroup_Content = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd0dab0ba_u32, 0x368a_u16, 0x4050_u16, StaticArray[0xa8_u8, 0x82_u8, 0x6c_u8, 0x1_u8, 0xf_u8, 0xd1_u8, 0x9a_u8, 0x4f_u8]), 100_u32)
  PKEY_PropGroup_Description = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x8969b275_u32, 0x9475_u16, 0x4e00_u16, StaticArray[0xa8_u8, 0x87_u8, 0xff_u8, 0x93_u8, 0xb8_u8, 0xb4_u8, 0x1e_u8, 0x44_u8]), 100_u32)
  PKEY_PropGroup_FileSystem = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe3a7d2c1_u32, 0x80fc_u16, 0x4b40_u16, StaticArray[0x8f_u8, 0x34_u8, 0x30_u8, 0xea_u8, 0x11_u8, 0x1b_u8, 0xdc_u8, 0x2e_u8]), 100_u32)
  PKEY_PropGroup_General = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcc301630_u32, 0xb192_u16, 0x4c22_u16, StaticArray[0xb3_u8, 0x72_u8, 0x9f_u8, 0x4c_u8, 0x6d_u8, 0x33_u8, 0x8e_u8, 0x7_u8]), 100_u32)
  PKEY_PropGroup_GPS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf3713ada_u32, 0x90e3_u16, 0x4e11_u16, StaticArray[0xaa_u8, 0xe5_u8, 0xfd_u8, 0xc1_u8, 0x76_u8, 0x85_u8, 0xb9_u8, 0xbe_u8]), 100_u32)
  PKEY_PropGroup_Image = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe3690a87_u32, 0xfa8_u16, 0x4a2a_u16, StaticArray[0x9a_u8, 0x9f_u8, 0xfc_u8, 0xe8_u8, 0x82_u8, 0x70_u8, 0x55_u8, 0xac_u8]), 100_u32)
  PKEY_PropGroup_Media = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x61872cf7_u32, 0x6b5e_u16, 0x4b4b_u16, StaticArray[0xac_u8, 0x2d_u8, 0x59_u8, 0xda_u8, 0x84_u8, 0x45_u8, 0x92_u8, 0x48_u8]), 100_u32)
  PKEY_PropGroup_MediaAdvanced = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x8859a284_u32, 0xde7e_u16, 0x4642_u16, StaticArray[0x99_u8, 0xba_u8, 0xd4_u8, 0x31_u8, 0xd0_u8, 0x44_u8, 0xb1_u8, 0xec_u8]), 100_u32)
  PKEY_PropGroup_Message = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7fd7259d_u32, 0x16b4_u16, 0x4135_u16, StaticArray[0x9f_u8, 0x97_u8, 0x7c_u8, 0x96_u8, 0xec_u8, 0xd2_u8, 0xfa_u8, 0x9e_u8]), 100_u32)
  PKEY_PropGroup_Music = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x68dd6094_u32, 0x7216_u16, 0x40f1_u16, StaticArray[0xa0_u8, 0x29_u8, 0x43_u8, 0xfe_u8, 0x71_u8, 0x27_u8, 0x4_u8, 0x3f_u8]), 100_u32)
  PKEY_PropGroup_Origin = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2598d2fb_u32, 0x5569_u16, 0x4367_u16, StaticArray[0x95_u8, 0xdf_u8, 0x5c_u8, 0xd3_u8, 0xa1_u8, 0x77_u8, 0xe1_u8, 0xa5_u8]), 100_u32)
  PKEY_PropGroup_PhotoAdvanced = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcb2bf5a_u32, 0x9ee7_u16, 0x4a86_u16, StaticArray[0x82_u8, 0x22_u8, 0xf0_u8, 0x1e_u8, 0x7_u8, 0xfd_u8, 0xad_u8, 0xaf_u8]), 100_u32)
  PKEY_PropGroup_RecordedTV = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe7b33238_u32, 0x6584_u16, 0x4170_u16, StaticArray[0xa5_u8, 0xc0_u8, 0xac_u8, 0x25_u8, 0xef_u8, 0xd9_u8, 0xda_u8, 0x56_u8]), 100_u32)
  PKEY_PropGroup_Video = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xbebe0920_u32, 0x7671_u16, 0x4c54_u16, StaticArray[0xa3_u8, 0xeb_u8, 0x49_u8, 0xfd_u8, 0xdf_u8, 0xc1_u8, 0x91_u8, 0xee_u8]), 100_u32)
  PKEY_InfoTipText = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc9944a21_u32, 0xa406_u16, 0x48fe_u16, StaticArray[0x82_u8, 0x25_u8, 0xae_u8, 0xc7_u8, 0xe2_u8, 0x4c_u8, 0x21_u8, 0x1b_u8]), 17_u32)
  PKEY_PropList_ConflictPrompt = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc9944a21_u32, 0xa406_u16, 0x48fe_u16, StaticArray[0x82_u8, 0x25_u8, 0xae_u8, 0xc7_u8, 0xe2_u8, 0x4c_u8, 0x21_u8, 0x1b_u8]), 11_u32)
  PKEY_PropList_ContentViewModeForBrowse = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc9944a21_u32, 0xa406_u16, 0x48fe_u16, StaticArray[0x82_u8, 0x25_u8, 0xae_u8, 0xc7_u8, 0xe2_u8, 0x4c_u8, 0x21_u8, 0x1b_u8]), 13_u32)
  PKEY_PropList_ContentViewModeForSearch = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc9944a21_u32, 0xa406_u16, 0x48fe_u16, StaticArray[0x82_u8, 0x25_u8, 0xae_u8, 0xc7_u8, 0xe2_u8, 0x4c_u8, 0x21_u8, 0x1b_u8]), 14_u32)
  PKEY_PropList_ExtendedTileInfo = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc9944a21_u32, 0xa406_u16, 0x48fe_u16, StaticArray[0x82_u8, 0x25_u8, 0xae_u8, 0xc7_u8, 0xe2_u8, 0x4c_u8, 0x21_u8, 0x1b_u8]), 9_u32)
  PKEY_PropList_FileOperationPrompt = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc9944a21_u32, 0xa406_u16, 0x48fe_u16, StaticArray[0x82_u8, 0x25_u8, 0xae_u8, 0xc7_u8, 0xe2_u8, 0x4c_u8, 0x21_u8, 0x1b_u8]), 10_u32)
  PKEY_PropList_FullDetails = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc9944a21_u32, 0xa406_u16, 0x48fe_u16, StaticArray[0x82_u8, 0x25_u8, 0xae_u8, 0xc7_u8, 0xe2_u8, 0x4c_u8, 0x21_u8, 0x1b_u8]), 2_u32)
  PKEY_PropList_InfoTip = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc9944a21_u32, 0xa406_u16, 0x48fe_u16, StaticArray[0x82_u8, 0x25_u8, 0xae_u8, 0xc7_u8, 0xe2_u8, 0x4c_u8, 0x21_u8, 0x1b_u8]), 4_u32)
  PKEY_PropList_NonPersonal = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x49d1091f_u32, 0x82e_u16, 0x493f_u16, StaticArray[0xb2_u8, 0x3f_u8, 0xd2_u8, 0x30_u8, 0x8a_u8, 0xa9_u8, 0x66_u8, 0x8c_u8]), 100_u32)
  PKEY_PropList_PreviewDetails = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc9944a21_u32, 0xa406_u16, 0x48fe_u16, StaticArray[0x82_u8, 0x25_u8, 0xae_u8, 0xc7_u8, 0xe2_u8, 0x4c_u8, 0x21_u8, 0x1b_u8]), 8_u32)
  PKEY_PropList_PreviewTitle = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc9944a21_u32, 0xa406_u16, 0x48fe_u16, StaticArray[0x82_u8, 0x25_u8, 0xae_u8, 0xc7_u8, 0xe2_u8, 0x4c_u8, 0x21_u8, 0x1b_u8]), 6_u32)
  PKEY_PropList_QuickTip = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc9944a21_u32, 0xa406_u16, 0x48fe_u16, StaticArray[0x82_u8, 0x25_u8, 0xae_u8, 0xc7_u8, 0xe2_u8, 0x4c_u8, 0x21_u8, 0x1b_u8]), 5_u32)
  PKEY_PropList_TileInfo = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc9944a21_u32, 0xa406_u16, 0x48fe_u16, StaticArray[0x82_u8, 0x25_u8, 0xae_u8, 0xc7_u8, 0xe2_u8, 0x4c_u8, 0x21_u8, 0x1b_u8]), 3_u32)
  PKEY_PropList_XPDetailsPanel = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xf2275480_u32, 0xf782_u16, 0x4291_u16, StaticArray[0xbd_u8, 0x94_u8, 0xf1_u8, 0x36_u8, 0x93_u8, 0x51_u8, 0x3a_u8, 0xec_u8]), 0_u32)
  PKEY_RecordedTV_ChannelNumber = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6d748de2_u32, 0x8d38_u16, 0x4cc3_u16, StaticArray[0xac_u8, 0x60_u8, 0xf0_u8, 0x9_u8, 0xb0_u8, 0x57_u8, 0xc5_u8, 0x57_u8]), 7_u32)
  PKEY_RecordedTV_Credits = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6d748de2_u32, 0x8d38_u16, 0x4cc3_u16, StaticArray[0xac_u8, 0x60_u8, 0xf0_u8, 0x9_u8, 0xb0_u8, 0x57_u8, 0xc5_u8, 0x57_u8]), 4_u32)
  PKEY_RecordedTV_DateContentExpires = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6d748de2_u32, 0x8d38_u16, 0x4cc3_u16, StaticArray[0xac_u8, 0x60_u8, 0xf0_u8, 0x9_u8, 0xb0_u8, 0x57_u8, 0xc5_u8, 0x57_u8]), 15_u32)
  PKEY_RecordedTV_EpisodeName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6d748de2_u32, 0x8d38_u16, 0x4cc3_u16, StaticArray[0xac_u8, 0x60_u8, 0xf0_u8, 0x9_u8, 0xb0_u8, 0x57_u8, 0xc5_u8, 0x57_u8]), 2_u32)
  PKEY_RecordedTV_IsATSCContent = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6d748de2_u32, 0x8d38_u16, 0x4cc3_u16, StaticArray[0xac_u8, 0x60_u8, 0xf0_u8, 0x9_u8, 0xb0_u8, 0x57_u8, 0xc5_u8, 0x57_u8]), 16_u32)
  PKEY_RecordedTV_IsClosedCaptioningAvailable = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6d748de2_u32, 0x8d38_u16, 0x4cc3_u16, StaticArray[0xac_u8, 0x60_u8, 0xf0_u8, 0x9_u8, 0xb0_u8, 0x57_u8, 0xc5_u8, 0x57_u8]), 12_u32)
  PKEY_RecordedTV_IsDTVContent = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6d748de2_u32, 0x8d38_u16, 0x4cc3_u16, StaticArray[0xac_u8, 0x60_u8, 0xf0_u8, 0x9_u8, 0xb0_u8, 0x57_u8, 0xc5_u8, 0x57_u8]), 17_u32)
  PKEY_RecordedTV_IsHDContent = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6d748de2_u32, 0x8d38_u16, 0x4cc3_u16, StaticArray[0xac_u8, 0x60_u8, 0xf0_u8, 0x9_u8, 0xb0_u8, 0x57_u8, 0xc5_u8, 0x57_u8]), 18_u32)
  PKEY_RecordedTV_IsRepeatBroadcast = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6d748de2_u32, 0x8d38_u16, 0x4cc3_u16, StaticArray[0xac_u8, 0x60_u8, 0xf0_u8, 0x9_u8, 0xb0_u8, 0x57_u8, 0xc5_u8, 0x57_u8]), 13_u32)
  PKEY_RecordedTV_IsSAP = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6d748de2_u32, 0x8d38_u16, 0x4cc3_u16, StaticArray[0xac_u8, 0x60_u8, 0xf0_u8, 0x9_u8, 0xb0_u8, 0x57_u8, 0xc5_u8, 0x57_u8]), 14_u32)
  PKEY_RecordedTV_NetworkAffiliation = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2c53c813_u32, 0xfb63_u16, 0x4e22_u16, StaticArray[0xa1_u8, 0xab_u8, 0xb_u8, 0x33_u8, 0x1c_u8, 0xa1_u8, 0xe2_u8, 0x73_u8]), 100_u32)
  PKEY_RecordedTV_OriginalBroadcastDate = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x4684fe97_u32, 0x8765_u16, 0x4842_u16, StaticArray[0x9c_u8, 0x13_u8, 0xf0_u8, 0x6_u8, 0x44_u8, 0x7b_u8, 0x17_u8, 0x8c_u8]), 100_u32)
  PKEY_RecordedTV_ProgramDescription = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6d748de2_u32, 0x8d38_u16, 0x4cc3_u16, StaticArray[0xac_u8, 0x60_u8, 0xf0_u8, 0x9_u8, 0xb0_u8, 0x57_u8, 0xc5_u8, 0x57_u8]), 3_u32)
  PKEY_RecordedTV_RecordingTime = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa5477f61_u32, 0x7a82_u16, 0x4eca_u16, StaticArray[0x9d_u8, 0xde_u8, 0x98_u8, 0xb6_u8, 0x9b_u8, 0x24_u8, 0x79_u8, 0xb3_u8]), 100_u32)
  PKEY_RecordedTV_StationCallSign = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x6d748de2_u32, 0x8d38_u16, 0x4cc3_u16, StaticArray[0xac_u8, 0x60_u8, 0xf0_u8, 0x9_u8, 0xb0_u8, 0x57_u8, 0xc5_u8, 0x57_u8]), 5_u32)
  PKEY_RecordedTV_StationName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1b5439e7_u32, 0xeba1_u16, 0x4af8_u16, StaticArray[0xbd_u8, 0xd7_u8, 0x7a_u8, 0xf1_u8, 0xd4_u8, 0x54_u8, 0x94_u8, 0x93_u8]), 100_u32)
  PKEY_LocationEmptyString = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x62d2d9ab_u32, 0x8b64_u16, 0x498d_u16, StaticArray[0xb8_u8, 0x65_u8, 0x40_u8, 0x2d_u8, 0x47_u8, 0x96_u8, 0xf8_u8, 0x65_u8]), 3_u32)
  PKEY_Search_AutoCategory = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb725f130_u32, 0x47ef_u16, 0x101a_u16, StaticArray[0xa5_u8, 0xf1_u8, 0x2_u8, 0x60_u8, 0x8c_u8, 0x9e_u8, 0xeb_u8, 0xac_u8]), 31_u32)
  PKEY_Search_AutoSummary = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x560c36c0_u32, 0x503a_u16, 0x11cf_u16, StaticArray[0xba_u8, 0xa1_u8, 0x0_u8, 0x0_u8, 0x4c_u8, 0x75_u8, 0x2a_u8, 0x9a_u8]), 2_u32)
  PKEY_Search_ContainerHash = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xbceee283_u32, 0x35df_u16, 0x4d53_u16, StaticArray[0x82_u8, 0x6a_u8, 0xf3_u8, 0x6a_u8, 0x3e_u8, 0xef_u8, 0xc6_u8, 0xbe_u8]), 100_u32)
  PKEY_Search_Contents = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb725f130_u32, 0x47ef_u16, 0x101a_u16, StaticArray[0xa5_u8, 0xf1_u8, 0x2_u8, 0x60_u8, 0x8c_u8, 0x9e_u8, 0xeb_u8, 0xac_u8]), 19_u32)
  PKEY_Search_EntryID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x49691c90_u32, 0x7e17_u16, 0x101a_u16, StaticArray[0xa9_u8, 0x1c_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2e_u8, 0xcd_u8, 0xa9_u8]), 5_u32)
  PKEY_Search_ExtendedProperties = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7b03b546_u32, 0xfa4f_u16, 0x4a52_u16, StaticArray[0xa2_u8, 0xfe_u8, 0x3_u8, 0xd5_u8, 0x31_u8, 0x1e_u8, 0x58_u8, 0x65_u8]), 100_u32)
  PKEY_Search_GatherTime = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb63e350_u32, 0x9ccc_u16, 0x11d0_u16, StaticArray[0xbc_u8, 0xdb_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xcc_u8, 0xce_u8, 0x4_u8]), 8_u32)
  PKEY_Search_HitCount = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x49691c90_u32, 0x7e17_u16, 0x101a_u16, StaticArray[0xa9_u8, 0x1c_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2e_u8, 0xcd_u8, 0xa9_u8]), 4_u32)
  PKEY_Search_IsClosedDirectory = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb63e343_u32, 0x9ccc_u16, 0x11d0_u16, StaticArray[0xbc_u8, 0xdb_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xcc_u8, 0xce_u8, 0x4_u8]), 23_u32)
  PKEY_Search_IsFullyContained = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb63e343_u32, 0x9ccc_u16, 0x11d0_u16, StaticArray[0xbc_u8, 0xdb_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xcc_u8, 0xce_u8, 0x4_u8]), 24_u32)
  PKEY_Search_MatchKind = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x49691c90_u32, 0x7e17_u16, 0x101a_u16, StaticArray[0xa9_u8, 0x1c_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2e_u8, 0xcd_u8, 0xa9_u8]), 29_u32)
  MATCH_KIND_LEXICAL = 1_i32
  MATCH_KIND_SEMANTIC = 2_i32
  PKEY_Search_MatchTags = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x49691c90_u32, 0x7e17_u16, 0x101a_u16, StaticArray[0xa9_u8, 0x1c_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2e_u8, 0xcd_u8, 0xa9_u8]), 30_u32)
  PKEY_Search_OcrContent = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb725f130_u32, 0x47ef_u16, 0x101a_u16, StaticArray[0xa5_u8, 0xf1_u8, 0x2_u8, 0x60_u8, 0x8c_u8, 0x9e_u8, 0xeb_u8, 0xac_u8]), 28_u32)
  PKEY_Search_QueryFocusedSummary = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x560c36c0_u32, 0x503a_u16, 0x11cf_u16, StaticArray[0xba_u8, 0xa1_u8, 0x0_u8, 0x0_u8, 0x4c_u8, 0x75_u8, 0x2a_u8, 0x9a_u8]), 3_u32)
  PKEY_Search_QueryFocusedSummaryWithFallback = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x560c36c0_u32, 0x503a_u16, 0x11cf_u16, StaticArray[0xba_u8, 0xa1_u8, 0x0_u8, 0x0_u8, 0x4c_u8, 0x75_u8, 0x2a_u8, 0x9a_u8]), 4_u32)
  PKEY_Search_QueryPropertyHits = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x49691c90_u32, 0x7e17_u16, 0x101a_u16, StaticArray[0xa9_u8, 0x1c_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2e_u8, 0xcd_u8, 0xa9_u8]), 21_u32)
  PKEY_Search_Rank = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x49691c90_u32, 0x7e17_u16, 0x101a_u16, StaticArray[0xa9_u8, 0x1c_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x2e_u8, 0xcd_u8, 0xa9_u8]), 3_u32)
  PKEY_Search_Store = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xa06992b3_u32, 0x8caf_u16, 0x4ed7_u16, StaticArray[0xa5_u8, 0x47_u8, 0xb2_u8, 0x59_u8, 0xe3_u8, 0x2a_u8, 0xc9_u8, 0xfc_u8]), 100_u32)
  PKEY_Search_UrlToIndex = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb63e343_u32, 0x9ccc_u16, 0x11d0_u16, StaticArray[0xbc_u8, 0xdb_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xcc_u8, 0xce_u8, 0x4_u8]), 2_u32)
  PKEY_Search_UrlToIndexWithModificationTime = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb63e343_u32, 0x9ccc_u16, 0x11d0_u16, StaticArray[0xbc_u8, 0xdb_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xcc_u8, 0xce_u8, 0x4_u8]), 12_u32)
  PKEY_Supplemental_Album = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc73b141_u32, 0x39d6_u16, 0x4653_u16, StaticArray[0xa6_u8, 0x83_u8, 0xca_u8, 0xb2_u8, 0x91_u8, 0xea_u8, 0xf9_u8, 0x5b_u8]), 6_u32)
  PKEY_Supplemental_AlbumID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc73b141_u32, 0x39d6_u16, 0x4653_u16, StaticArray[0xa6_u8, 0x83_u8, 0xca_u8, 0xb2_u8, 0x91_u8, 0xea_u8, 0xf9_u8, 0x5b_u8]), 2_u32)
  PKEY_Supplemental_Location = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc73b141_u32, 0x39d6_u16, 0x4653_u16, StaticArray[0xa6_u8, 0x83_u8, 0xca_u8, 0xb2_u8, 0x91_u8, 0xea_u8, 0xf9_u8, 0x5b_u8]), 5_u32)
  PKEY_Supplemental_Person = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc73b141_u32, 0x39d6_u16, 0x4653_u16, StaticArray[0xa6_u8, 0x83_u8, 0xca_u8, 0xb2_u8, 0x91_u8, 0xea_u8, 0xf9_u8, 0x5b_u8]), 7_u32)
  PKEY_Supplemental_ResourceId = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc73b141_u32, 0x39d6_u16, 0x4653_u16, StaticArray[0xa6_u8, 0x83_u8, 0xca_u8, 0xb2_u8, 0x91_u8, 0xea_u8, 0xf9_u8, 0x5b_u8]), 3_u32)
  PKEY_Supplemental_Tag = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xc73b141_u32, 0x39d6_u16, 0x4653_u16, StaticArray[0xa6_u8, 0x83_u8, 0xca_u8, 0xb2_u8, 0x91_u8, 0xea_u8, 0xf9_u8, 0x5b_u8]), 4_u32)
  PKEY_ActivityDate = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x30c8eef4_u32, 0xa832_u16, 0x41e2_u16, StaticArray[0xab_u8, 0x32_u8, 0xe3_u8, 0xc3_u8, 0xca_u8, 0x28_u8, 0xfd_u8, 0x29_u8]), 23_u32)
  PKEY_ActivityIcon = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x30c8eef4_u32, 0xa832_u16, 0x41e2_u16, StaticArray[0xab_u8, 0x32_u8, 0xe3_u8, 0xc3_u8, 0xca_u8, 0x28_u8, 0xfd_u8, 0x29_u8]), 24_u32)
  PKEY_ActivityInfo = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x30c8eef4_u32, 0xa832_u16, 0x41e2_u16, StaticArray[0xab_u8, 0x32_u8, 0xe3_u8, 0xc3_u8, 0xca_u8, 0x28_u8, 0xfd_u8, 0x29_u8]), 17_u32)
  PKEY_DescriptionID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x28636aa6_u32, 0x953d_u16, 0x11d2_u16, StaticArray[0xb5_u8, 0xd6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x18_u8, 0xd0_u8]), 2_u32)
  PKEY_Home_Grouping = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x30c8eef4_u32, 0xa832_u16, 0x41e2_u16, StaticArray[0xab_u8, 0x32_u8, 0xe3_u8, 0xc3_u8, 0xca_u8, 0x28_u8, 0xfd_u8, 0x29_u8]), 2_u32)
  HOMEGROUPING_UNSPECIFIED = 0_u32
  HOMEGROUPING_FREQUENT = 1_u32
  HOMEGROUPING_PINNED = 2_u32
  HOMEGROUPING_RECENT = 3_u32
  HOMEGROUPING_RECOMMENDATIONS = 4_u32
  HOMEGROUPING_SHARED = 5_u32
  PKEY_Home_IsPinned = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x30c8eef4_u32, 0xa832_u16, 0x41e2_u16, StaticArray[0xab_u8, 0x32_u8, 0xe3_u8, 0xc3_u8, 0xca_u8, 0x28_u8, 0xfd_u8, 0x29_u8]), 4_u32)
  PKEY_Home_ItemFolderPathDisplay = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x30c8eef4_u32, 0xa832_u16, 0x41e2_u16, StaticArray[0xab_u8, 0x32_u8, 0xe3_u8, 0xc3_u8, 0xca_u8, 0x28_u8, 0xfd_u8, 0x29_u8]), 6_u32)
  PKEY_Home_RecommendationActivityDate = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x30c8eef4_u32, 0xa832_u16, 0x41e2_u16, StaticArray[0xab_u8, 0x32_u8, 0xe3_u8, 0xc3_u8, 0xca_u8, 0x28_u8, 0xfd_u8, 0x29_u8]), 22_u32)
  PKEY_Home_RecommendationProviderSource = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x5ca9b1cb_u32, 0xc69f_u16, 0x404b_u16, StaticArray[0xab_u8, 0xc6_u8, 0xfd_u8, 0x33_u8, 0x67_u8, 0x93_u8, 0xa6_u8, 0xa7_u8]), 22_u32)
  PKEY_Home_RecommendationReasonIcon = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x30c8eef4_u32, 0xa832_u16, 0x41e2_u16, StaticArray[0xab_u8, 0x32_u8, 0xe3_u8, 0xc3_u8, 0xca_u8, 0x28_u8, 0xfd_u8, 0x29_u8]), 21_u32)
  PKEY_Home_Recommended = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x30c8eef4_u32, 0xa832_u16, 0x41e2_u16, StaticArray[0xab_u8, 0x32_u8, 0xe3_u8, 0xc3_u8, 0xca_u8, 0x28_u8, 0xfd_u8, 0x29_u8]), 20_u32)
  PKEY_InternalName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcef7d53_u32, 0xfa64_u16, 0x11d1_u16, StaticArray[0xa2_u8, 0x3_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x1f_u8, 0xed_u8, 0xee_u8]), 5_u32)
  PKEY_LibraryLocationsCount = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x908696c7_u32, 0x8f87_u16, 0x44f2_u16, StaticArray[0x80_u8, 0xed_u8, 0xa8_u8, 0xc1_u8, 0xc6_u8, 0x89_u8, 0x45_u8, 0x75_u8]), 2_u32)
  PKEY_Link_TargetSFGAOFlagsStrings = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd6942081_u32, 0xd53b_u16, 0x443d_u16, StaticArray[0xad_u8, 0x47_u8, 0x5e_u8, 0x5_u8, 0x9d_u8, 0x9c_u8, 0xd2_u8, 0x7a_u8]), 3_u32)
  PKEY_Link_TargetUrl = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x5cbf2787_u32, 0x48cf_u16, 0x4208_u16, StaticArray[0xb9_u8, 0xe_u8, 0xee_u8, 0x5e_u8, 0x5d_u8, 0x42_u8, 0x2_u8, 0x94_u8]), 2_u32)
  PKEY_NamespaceCLSID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x28636aa6_u32, 0x953d_u16, 0x11d2_u16, StaticArray[0xb5_u8, 0xd6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd9_u8, 0x18_u8, 0xd0_u8]), 6_u32)
  PKEY_Shell_CopilotKeyProviderFastPathMessage = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x38652bca_u32, 0x4329_u16, 0x4e74_u16, StaticArray[0x86_u8, 0xf9_u8, 0x39_u8, 0xcf_u8, 0x29_u8, 0x34_u8, 0x5e_u8, 0xea_u8]), 2_u32)
  PKEY_Shell_SFGAOFlagsStrings = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd6942081_u32, 0xd53b_u16, 0x443d_u16, StaticArray[0xad_u8, 0x47_u8, 0x5e_u8, 0x5_u8, 0x9d_u8, 0x9c_u8, 0xd2_u8, 0x7a_u8]), 2_u32)
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
  PKEY_StatusBarSelectedItemCount = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x26dc287c_u32, 0x6e3d_u16, 0x4bd3_u16, StaticArray[0xb2_u8, 0xb0_u8, 0x6a_u8, 0x26_u8, 0xba_u8, 0x2e_u8, 0x34_u8, 0x6d_u8]), 3_u32)
  PKEY_StatusBarViewItemCount = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x26dc287c_u32, 0x6e3d_u16, 0x4bd3_u16, StaticArray[0xb2_u8, 0xb0_u8, 0x6a_u8, 0x26_u8, 0xba_u8, 0x2e_u8, 0x34_u8, 0x6d_u8]), 2_u32)
  PKEY_StorageProviderState = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe77e90df_u32, 0x6271_u16, 0x4f5b_u16, StaticArray[0x83_u8, 0x4f_u8, 0x2d_u8, 0xd1_u8, 0xf2_u8, 0x45_u8, 0xdd_u8, 0xa4_u8]), 3_u32)
  STORAGEPROVIDERSTATE_NONE = 0_u32
  STORAGEPROVIDERSTATE_SPARSE = 1_u32
  STORAGEPROVIDERSTATE_IN_SYNC = 2_u32
  STORAGEPROVIDERSTATE_PINNED = 3_u32
  STORAGEPROVIDERSTATE_PENDING_UPLOAD = 4_u32
  STORAGEPROVIDERSTATE_PENDING_DOWNLOAD = 5_u32
  STORAGEPROVIDERSTATE_TRANSFERRING = 6_u32
  STORAGEPROVIDERSTATE_ERROR = 7_u32
  STORAGEPROVIDERSTATE_WARNING = 8_u32
  STORAGEPROVIDERSTATE_EXCLUDED = 9_u32
  STORAGEPROVIDERSTATE_PENDING_UNSPECIFIED = 10_u32
  PKEY_StorageProviderTransferProgress = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe77e90df_u32, 0x6271_u16, 0x4f5b_u16, StaticArray[0x83_u8, 0x4f_u8, 0x2d_u8, 0xd1_u8, 0xf2_u8, 0x45_u8, 0xdd_u8, 0xa4_u8]), 4_u32)
  PKEY_WebAccountID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x30c8eef4_u32, 0xa832_u16, 0x41e2_u16, StaticArray[0xab_u8, 0x32_u8, 0xe3_u8, 0xc3_u8, 0xca_u8, 0x28_u8, 0xfd_u8, 0x29_u8]), 7_u32)
  PKEY_AppUserModel_ExcludeFromShowInNewInstall = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9f4c2855_u32, 0x9f79_u16, 0x4b39_u16, StaticArray[0xa8_u8, 0xd0_u8, 0xe1_u8, 0xd4_u8, 0x2d_u8, 0xe1_u8, 0xd5_u8, 0xf3_u8]), 8_u32)
  PKEY_AppUserModel_ID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9f4c2855_u32, 0x9f79_u16, 0x4b39_u16, StaticArray[0xa8_u8, 0xd0_u8, 0xe1_u8, 0xd4_u8, 0x2d_u8, 0xe1_u8, 0xd5_u8, 0xf3_u8]), 5_u32)
  PKEY_AppUserModel_IsDestListSeparator = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9f4c2855_u32, 0x9f79_u16, 0x4b39_u16, StaticArray[0xa8_u8, 0xd0_u8, 0xe1_u8, 0xd4_u8, 0x2d_u8, 0xe1_u8, 0xd5_u8, 0xf3_u8]), 6_u32)
  PKEY_AppUserModel_IsDualMode = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9f4c2855_u32, 0x9f79_u16, 0x4b39_u16, StaticArray[0xa8_u8, 0xd0_u8, 0xe1_u8, 0xd4_u8, 0x2d_u8, 0xe1_u8, 0xd5_u8, 0xf3_u8]), 11_u32)
  PKEY_AppUserModel_PreventPinning = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9f4c2855_u32, 0x9f79_u16, 0x4b39_u16, StaticArray[0xa8_u8, 0xd0_u8, 0xe1_u8, 0xd4_u8, 0x2d_u8, 0xe1_u8, 0xd5_u8, 0xf3_u8]), 9_u32)
  PKEY_AppUserModel_RelaunchCommand = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9f4c2855_u32, 0x9f79_u16, 0x4b39_u16, StaticArray[0xa8_u8, 0xd0_u8, 0xe1_u8, 0xd4_u8, 0x2d_u8, 0xe1_u8, 0xd5_u8, 0xf3_u8]), 2_u32)
  PKEY_AppUserModel_RelaunchDisplayNameResource = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9f4c2855_u32, 0x9f79_u16, 0x4b39_u16, StaticArray[0xa8_u8, 0xd0_u8, 0xe1_u8, 0xd4_u8, 0x2d_u8, 0xe1_u8, 0xd5_u8, 0xf3_u8]), 4_u32)
  PKEY_AppUserModel_RelaunchIconResource = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9f4c2855_u32, 0x9f79_u16, 0x4b39_u16, StaticArray[0xa8_u8, 0xd0_u8, 0xe1_u8, 0xd4_u8, 0x2d_u8, 0xe1_u8, 0xd5_u8, 0xf3_u8]), 3_u32)
  PKEY_AppUserModel_SettingsCommand = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9f4c2855_u32, 0x9f79_u16, 0x4b39_u16, StaticArray[0xa8_u8, 0xd0_u8, 0xe1_u8, 0xd4_u8, 0x2d_u8, 0xe1_u8, 0xd5_u8, 0xf3_u8]), 38_u32)
  PKEY_AppUserModel_StartPinOption = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9f4c2855_u32, 0x9f79_u16, 0x4b39_u16, StaticArray[0xa8_u8, 0xd0_u8, 0xe1_u8, 0xd4_u8, 0x2d_u8, 0xe1_u8, 0xd5_u8, 0xf3_u8]), 12_u32)
  APPUSERMODEL_STARTPINOPTION_DEFAULT = 0_u32
  APPUSERMODEL_STARTPINOPTION_NOPINONINSTALL = 1_u32
  APPUSERMODEL_STARTPINOPTION_USERPINNED = 2_u32
  PKEY_AppUserModel_ToastActivatorCLSID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9f4c2855_u32, 0x9f79_u16, 0x4b39_u16, StaticArray[0xa8_u8, 0xd0_u8, 0xe1_u8, 0xd4_u8, 0x2d_u8, 0xe1_u8, 0xd5_u8, 0xf3_u8]), 26_u32)
  PKEY_AppUserModel_UninstallCommand = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9f4c2855_u32, 0x9f79_u16, 0x4b39_u16, StaticArray[0xa8_u8, 0xd0_u8, 0xe1_u8, 0xd4_u8, 0x2d_u8, 0xe1_u8, 0xd5_u8, 0xf3_u8]), 37_u32)
  PKEY_AppUserModel_VisualElementsManifestHintPath = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9f4c2855_u32, 0x9f79_u16, 0x4b39_u16, StaticArray[0xa8_u8, 0xd0_u8, 0xe1_u8, 0xd4_u8, 0x2d_u8, 0xe1_u8, 0xd5_u8, 0xf3_u8]), 31_u32)
  PKEY_EdgeGesture_DisableTouchWhenFullscreen = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x32ce38b2_u32, 0x2c9a_u16, 0x41b1_u16, StaticArray[0x9b_u8, 0xc5_u8, 0xb3_u8, 0x78_u8, 0x43_u8, 0x94_u8, 0xaa_u8, 0x44_u8]), 2_u32)
  PKEY_Software_DateLastUsed = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x841e4f90_u32, 0xff59_u16, 0x4d16_u16, StaticArray[0x89_u8, 0x47_u8, 0xe8_u8, 0x1b_u8, 0xbf_u8, 0xfa_u8, 0xb3_u8, 0x6d_u8]), 16_u32)
  PKEY_Software_ProductName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xcef7d53_u32, 0xfa64_u16, 0x11d1_u16, StaticArray[0xa2_u8, 0x3_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x1f_u8, 0xed_u8, 0xee_u8]), 7_u32)
  PKEY_Sync_Comments = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7bd5533e_u32, 0xaf15_u16, 0x44db_u16, StaticArray[0xb8_u8, 0xc8_u8, 0xbd_u8, 0x66_u8, 0x24_u8, 0xe1_u8, 0xd0_u8, 0x32_u8]), 13_u32)
  PKEY_Sync_ConflictDescription = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xce50c159_u32, 0x2fb8_u16, 0x41fd_u16, StaticArray[0xbe_u8, 0x68_u8, 0xd3_u8, 0xe0_u8, 0x42_u8, 0xe2_u8, 0x74_u8, 0xbc_u8]), 4_u32)
  PKEY_Sync_ConflictFirstLocation = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xce50c159_u32, 0x2fb8_u16, 0x41fd_u16, StaticArray[0xbe_u8, 0x68_u8, 0xd3_u8, 0xe0_u8, 0x42_u8, 0xe2_u8, 0x74_u8, 0xbc_u8]), 6_u32)
  PKEY_Sync_ConflictSecondLocation = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xce50c159_u32, 0x2fb8_u16, 0x41fd_u16, StaticArray[0xbe_u8, 0x68_u8, 0xd3_u8, 0xe0_u8, 0x42_u8, 0xe2_u8, 0x74_u8, 0xbc_u8]), 7_u32)
  PKEY_Sync_HandlerCollectionID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7bd5533e_u32, 0xaf15_u16, 0x44db_u16, StaticArray[0xb8_u8, 0xc8_u8, 0xbd_u8, 0x66_u8, 0x24_u8, 0xe1_u8, 0xd0_u8, 0x32_u8]), 2_u32)
  PKEY_Sync_HandlerID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7bd5533e_u32, 0xaf15_u16, 0x44db_u16, StaticArray[0xb8_u8, 0xc8_u8, 0xbd_u8, 0x66_u8, 0x24_u8, 0xe1_u8, 0xd0_u8, 0x32_u8]), 3_u32)
  PKEY_Sync_HandlerName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xce50c159_u32, 0x2fb8_u16, 0x41fd_u16, StaticArray[0xbe_u8, 0x68_u8, 0xd3_u8, 0xe0_u8, 0x42_u8, 0xe2_u8, 0x74_u8, 0xbc_u8]), 2_u32)
  PKEY_Sync_HandlerType = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7bd5533e_u32, 0xaf15_u16, 0x44db_u16, StaticArray[0xb8_u8, 0xc8_u8, 0xbd_u8, 0x66_u8, 0x24_u8, 0xe1_u8, 0xd0_u8, 0x32_u8]), 8_u32)
  SYNC_HANDLERTYPE_OTHER = 0_u32
  SYNC_HANDLERTYPE_PROGRAMS = 1_u32
  SYNC_HANDLERTYPE_DEVICES = 2_u32
  SYNC_HANDLERTYPE_FOLDERS = 3_u32
  SYNC_HANDLERTYPE_WEBSERVICES = 4_u32
  SYNC_HANDLERTYPE_COMPUTERS = 5_u32
  PKEY_Sync_HandlerTypeLabel = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7bd5533e_u32, 0xaf15_u16, 0x44db_u16, StaticArray[0xb8_u8, 0xc8_u8, 0xbd_u8, 0x66_u8, 0x24_u8, 0xe1_u8, 0xd0_u8, 0x32_u8]), 9_u32)
  PKEY_Sync_ItemID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7bd5533e_u32, 0xaf15_u16, 0x44db_u16, StaticArray[0xb8_u8, 0xc8_u8, 0xbd_u8, 0x66_u8, 0x24_u8, 0xe1_u8, 0xd0_u8, 0x32_u8]), 6_u32)
  PKEY_Sync_ItemName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xce50c159_u32, 0x2fb8_u16, 0x41fd_u16, StaticArray[0xbe_u8, 0x68_u8, 0xd3_u8, 0xe0_u8, 0x42_u8, 0xe2_u8, 0x74_u8, 0xbc_u8]), 3_u32)
  PKEY_Sync_ProgressPercentage = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7bd5533e_u32, 0xaf15_u16, 0x44db_u16, StaticArray[0xb8_u8, 0xc8_u8, 0xbd_u8, 0x66_u8, 0x24_u8, 0xe1_u8, 0xd0_u8, 0x32_u8]), 23_u32)
  PKEY_Sync_State = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7bd5533e_u32, 0xaf15_u16, 0x44db_u16, StaticArray[0xb8_u8, 0xc8_u8, 0xbd_u8, 0x66_u8, 0x24_u8, 0xe1_u8, 0xd0_u8, 0x32_u8]), 24_u32)
  SYNC_STATE_NOTSETUP = 0_u32
  SYNC_STATE_SYNCNOTRUN = 1_u32
  SYNC_STATE_IDLE = 2_u32
  SYNC_STATE_ERROR = 3_u32
  SYNC_STATE_PENDING = 4_u32
  SYNC_STATE_SYNCING = 5_u32
  PKEY_Sync_Status = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7bd5533e_u32, 0xaf15_u16, 0x44db_u16, StaticArray[0xb8_u8, 0xc8_u8, 0xbd_u8, 0x66_u8, 0x24_u8, 0xe1_u8, 0xd0_u8, 0x32_u8]), 10_u32)
  PKEY_Task_BillingInformation = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd37d52c6_u32, 0x261c_u16, 0x4303_u16, StaticArray[0x82_u8, 0xb3_u8, 0x8_u8, 0xb9_u8, 0x26_u8, 0xac_u8, 0x6f_u8, 0x12_u8]), 100_u32)
  PKEY_Task_CompletionStatus = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x84d8a0a_u32, 0xe6d5_u16, 0x40de_u16, StaticArray[0xbf_u8, 0x1f_u8, 0xc8_u8, 0x82_u8, 0xe_u8, 0x7c_u8, 0x87_u8, 0x7c_u8]), 100_u32)
  PKEY_Task_Owner = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x8c7cc5f_u32, 0x60f2_u16, 0x4494_u16, StaticArray[0xad_u8, 0x75_u8, 0x55_u8, 0xe3_u8, 0xe0_u8, 0xb5_u8, 0xad_u8, 0xd0_u8]), 100_u32)
  PKEY_Video_Compression = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440491_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 10_u32)
  PKEY_Video_Director = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440492_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 20_u32)
  PKEY_Video_EncodingBitrate = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440491_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 8_u32)
  PKEY_Video_FourCC = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440491_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 44_u32)
  PKEY_Video_FrameHeight = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440491_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 4_u32)
  PKEY_Video_FrameRate = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440491_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 6_u32)
  PKEY_Video_FrameWidth = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440491_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 3_u32)
  PKEY_Video_HorizontalAspectRatio = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440491_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 42_u32)
  PKEY_Video_IsSpherical = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440491_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 100_u32)
  PKEY_Video_IsStereo = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440491_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 98_u32)
  PKEY_Video_Orientation = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440491_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 99_u32)
  PKEY_Video_SampleSize = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440491_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 9_u32)
  PKEY_Video_StreamName = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440491_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 2_u32)
  PKEY_Video_StreamNumber = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440491_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 11_u32)
  PKEY_Video_TotalBitrate = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440491_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 43_u32)
  PKEY_Video_TranscodedForSync = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440491_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 46_u32)
  PKEY_Video_VerticalAspectRatio = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64440491_u32, 0x4c8b_u16, 0x11d1_u16, StaticArray[0x8b_u8, 0x70_u8, 0x8_u8, 0x0_u8, 0x36_u8, 0xb1_u8, 0x1a_u8, 0x3_u8]), 45_u32)
  PKEY_Volume_FileSystem = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9b174b35_u32, 0x40ff_u16, 0x11d2_u16, StaticArray[0xa2_u8, 0x7e_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc3_u8, 0x8_u8, 0x71_u8]), 4_u32)
  PKEY_Volume_IsMappedDrive = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x149c0b69_u32, 0x2c2d_u16, 0x48fc_u16, StaticArray[0x80_u8, 0x8f_u8, 0xd3_u8, 0x18_u8, 0xd7_u8, 0x8c_u8, 0x46_u8, 0x36_u8]), 2_u32)
  PKEY_Volume_IsRoot = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x9b174b35_u32, 0x40ff_u16, 0x11d2_u16, StaticArray[0xa2_u8, 0x7e_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc3_u8, 0x8_u8, 0x71_u8]), 10_u32)
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
  ES_E_INVALID_RESPONSE = 3221488128_u32
  ES_E_UNPROVISIONED_HARDWARE = 3221488132_u32
  ES_E_UNSUPPORTED_HARDWARE = 3221488133_u32
  ES_E_INCOMPLETE_COMMAND = 3221488134_u32
  ES_E_BAD_SEQUENCE = 3221488135_u32
  ES_E_NO_PROBE = 3221488136_u32
  ES_E_INVALID_SILO = 3221488137_u32
  ES_E_INVALID_CAPABILITY = 3221488138_u32
  ES_E_GROUP_POLICY_FORBIDDEN_USE = 3221488139_u32
  ES_E_GROUP_POLICY_FORBIDDEN_OPERATION = 3221488140_u32
  ES_E_INVALID_PARAM_COMBINATION = 3221488141_u32
  ES_E_INVALID_PARAM_LENGTH = 3221488142_u32
  ES_E_INCONSISTENT_PARAM_LENGTH = 3221488143_u32
  ES_E_NO_AUTHENTICATION_REQUIRED = 3221488640_u32
  ES_E_INVALID_FIELD_IDENTIFIER = 3221491968_u32
  ES_E_CHALLENGE_MISMATCH = 3221491969_u32
  ES_E_CHALLENGE_SIZE_MISMATCH = 3221491970_u32
  ES_E_FRIENDLY_NAME_TOO_LONG = 3221491971_u32
  ES_E_SILO_NAME_TOO_LONG = 3221491972_u32
  ES_E_PASSWORD_TOO_LONG = 3221491973_u32
  ES_E_PASSWORD_HINT_TOO_LONG = 3221491974_u32
  ES_E_OTHER_SECURITY_PROTOCOL_ACTIVE = 3221491975_u32
  ES_E_DEVICE_DIGEST_MISSING = 3221491976_u32
  ES_E_NOT_AUTHORIZED_UNEXPECTED = 3221491977_u32
  ES_E_AUTHORIZED_UNEXPECTED = 3221491978_u32
  ES_E_PROVISIONED_UNEXPECTED = 3221491979_u32
  ES_E_UNKNOWN_DIGEST_ALGORITHM = 3221491980_u32

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

  record IEnumEnhancedStorageACTVtable,
    query_interface : Proc(IEnumEnhancedStorageACT*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumEnhancedStorageACT*, UInt32),
    release : Proc(IEnumEnhancedStorageACT*, UInt32),
    get_ac_ts : Proc(IEnumEnhancedStorageACT*, Void***, UInt32*, Win32cr::Foundation::HRESULT),
    get_matching_act : Proc(IEnumEnhancedStorageACT*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnumEnhancedStorageACT, lpVtbl : IEnumEnhancedStorageACTVtable* do
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

  record IEnhancedStorageACTVtable,
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
  record IEnhancedStorageACT, lpVtbl : IEnhancedStorageACTVtable* do
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

  record IEnhancedStorageACT2Vtable,
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
  record IEnhancedStorageACT2, lpVtbl : IEnhancedStorageACT2Vtable* do
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

  record IEnhancedStorageACT3Vtable,
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
  record IEnhancedStorageACT3, lpVtbl : IEnhancedStorageACT3Vtable* do
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

  record IEnhancedStorageSiloVtable,
    query_interface : Proc(IEnhancedStorageSilo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnhancedStorageSilo*, UInt32),
    release : Proc(IEnhancedStorageSilo*, UInt32),
    get_info : Proc(IEnhancedStorageSilo*, Win32cr::Storage::EnhancedStorage::SILO_INFO*, Win32cr::Foundation::HRESULT),
    get_actions : Proc(IEnhancedStorageSilo*, Void***, UInt32*, Win32cr::Foundation::HRESULT),
    send_command : Proc(IEnhancedStorageSilo*, UInt8, UInt8*, UInt32, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    get_portable_device : Proc(IEnhancedStorageSilo*, Void**, Win32cr::Foundation::HRESULT),
    get_device_path : Proc(IEnhancedStorageSilo*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnhancedStorageSilo, lpVtbl : IEnhancedStorageSiloVtable* do
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

  record IEnhancedStorageSiloActionVtable,
    query_interface : Proc(IEnhancedStorageSiloAction*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnhancedStorageSiloAction*, UInt32),
    release : Proc(IEnhancedStorageSiloAction*, UInt32),
    get_name : Proc(IEnhancedStorageSiloAction*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_description : Proc(IEnhancedStorageSiloAction*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    invoke : Proc(IEnhancedStorageSiloAction*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IEnhancedStorageSiloAction, lpVtbl : IEnhancedStorageSiloActionVtable* do
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