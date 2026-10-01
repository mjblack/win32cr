require "./../foundation.cr"
require "./../system/com.cr"
require "./../system/com/structured_storage.cr"
require "./portable_devices.cr"
require "./properties.cr"

module Win32cr::Devices::Sensors
  extend self
  GUID_DEVINTERFACE_SENSOR = LibC::GUID.new(0xba1bb692_u32, 0x9b7a_u16, 0x4833_u16, StaticArray[0x9a_u8, 0x1e_u8, 0x52_u8, 0x5e_u8, 0xd1_u8, 0x34_u8, 0xe7_u8, 0xe2_u8])
  SENSOR_EVENT_STATE_CHANGED = LibC::GUID.new(0xbfd96016_u32, 0x6bd7_u16, 0x4560_u16, StaticArray[0xad_u8, 0x34_u8, 0xf2_u8, 0xf6_u8, 0x60_u8, 0x7e_u8, 0x8f_u8, 0x81_u8])
  SENSOR_EVENT_DATA_UPDATED = LibC::GUID.new(0x2ed0f2a4_u32, 0x87_u16, 0x41d3_u16, StaticArray[0x87_u8, 0xdb_u8, 0x67_u8, 0x73_u8, 0x37_u8, 0xb_u8, 0x3c_u8, 0x88_u8])
  SENSOR_EVENT_PROPERTY_CHANGED = LibC::GUID.new(0x2358f099_u32, 0x84c9_u16, 0x4d3d_u16, StaticArray[0x90_u8, 0xdf_u8, 0xc2_u8, 0x42_u8, 0x1e_u8, 0x2b_u8, 0x20_u8, 0x45_u8])
  SENSOR_EVENT_ACCELEROMETER_SHAKE = LibC::GUID.new(0x825f5a94_u32, 0xf48_u16, 0x4396_u16, StaticArray[0x9c_u8, 0xa0_u8, 0x6e_u8, 0xcb_u8, 0x5c_u8, 0x99_u8, 0xd9_u8, 0x15_u8])
  SENSOR_EVENT_PARAMETER_COMMON_GUID = LibC::GUID.new(0x64346e30_u32, 0x8728_u16, 0x4b34_u16, StaticArray[0xbd_u8, 0xf6_u8, 0x4f_u8, 0x52_u8, 0x44_u8, 0x2c_u8, 0x5c_u8, 0x28_u8])
  SENSOR_EVENT_PARAMETER_EVENT_ID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64346e30_u32, 0x8728_u16, 0x4b34_u16, StaticArray[0xbd_u8, 0xf6_u8, 0x4f_u8, 0x52_u8, 0x44_u8, 0x2c_u8, 0x5c_u8, 0x28_u8]), 2_u32)
  SENSOR_EVENT_PARAMETER_STATE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x64346e30_u32, 0x8728_u16, 0x4b34_u16, StaticArray[0xbd_u8, 0xf6_u8, 0x4f_u8, 0x52_u8, 0x44_u8, 0x2c_u8, 0x5c_u8, 0x28_u8]), 3_u32)
  SENSOR_ERROR_PARAMETER_COMMON_GUID = LibC::GUID.new(0x77112bcd_u32, 0xfce1_u16, 0x4f43_u16, StaticArray[0xb8_u8, 0xb8_u8, 0xa8_u8, 0x82_u8, 0x56_u8, 0xad_u8, 0xb4_u8, 0xb3_u8])
  SENSOR_PROPERTY_COMMON_GUID = LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8])
  SENSOR_PROPERTY_TYPE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 2_u32)
  SENSOR_PROPERTY_STATE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 3_u32)
  SENSOR_PROPERTY_PERSISTENT_UNIQUE_ID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 5_u32)
  SENSOR_PROPERTY_MANUFACTURER = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 6_u32)
  SENSOR_PROPERTY_MODEL = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 7_u32)
  SENSOR_PROPERTY_SERIAL_NUMBER = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 8_u32)
  SENSOR_PROPERTY_FRIENDLY_NAME = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 9_u32)
  SENSOR_PROPERTY_DESCRIPTION = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 10_u32)
  SENSOR_PROPERTY_CONNECTION_TYPE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 11_u32)
  SENSOR_PROPERTY_MIN_REPORT_INTERVAL = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 12_u32)
  SENSOR_PROPERTY_CURRENT_REPORT_INTERVAL = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 13_u32)
  SENSOR_PROPERTY_CHANGE_SENSITIVITY = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 14_u32)
  SENSOR_PROPERTY_DEVICE_PATH = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 15_u32)
  SENSOR_PROPERTY_LIGHT_RESPONSE_CURVE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 16_u32)
  SENSOR_PROPERTY_ACCURACY = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 17_u32)
  SENSOR_PROPERTY_RESOLUTION = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 18_u32)
  SENSOR_PROPERTY_LOCATION_DESIRED_ACCURACY = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 19_u32)
  SENSOR_PROPERTY_RANGE_MINIMUM = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 20_u32)
  SENSOR_PROPERTY_RANGE_MAXIMUM = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 21_u32)
  SENSOR_PROPERTY_HID_USAGE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 22_u32)
  SENSOR_PROPERTY_RADIO_STATE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 23_u32)
  SENSOR_PROPERTY_RADIO_STATE_PREVIOUS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 24_u32)
  SENSOR_CATEGORY_ALL = LibC::GUID.new(0xc317c286_u32, 0xc468_u16, 0x4288_u16, StaticArray[0x99_u8, 0x75_u8, 0xd4_u8, 0xc4_u8, 0x58_u8, 0x7c_u8, 0x44_u8, 0x2c_u8])
  SENSOR_CATEGORY_LOCATION = LibC::GUID.new(0xbfa794e4_u32, 0xf964_u16, 0x4fdb_u16, StaticArray[0x90_u8, 0xf6_u8, 0x51_u8, 0x5_u8, 0x6b_u8, 0xfe_u8, 0x4b_u8, 0x44_u8])
  SENSOR_CATEGORY_ENVIRONMENTAL = LibC::GUID.new(0x323439aa_u32, 0x7f66_u16, 0x492b_u16, StaticArray[0xba_u8, 0xc_u8, 0x73_u8, 0xe9_u8, 0xaa_u8, 0xa_u8, 0x65_u8, 0xd5_u8])
  SENSOR_CATEGORY_MOTION = LibC::GUID.new(0xcd09daf1_u32, 0x3b2e_u16, 0x4c3d_u16, StaticArray[0xb5_u8, 0x98_u8, 0xb5_u8, 0xe5_u8, 0xff_u8, 0x93_u8, 0xfd_u8, 0x46_u8])
  SENSOR_CATEGORY_ORIENTATION = LibC::GUID.new(0x9e6c04b6_u32, 0x96fe_u16, 0x4954_u16, StaticArray[0xb7_u8, 0x26_u8, 0x68_u8, 0x68_u8, 0x2a_u8, 0x47_u8, 0x3f_u8, 0x69_u8])
  SENSOR_CATEGORY_MECHANICAL = LibC::GUID.new(0x8d131d68_u32, 0x8ef7_u16, 0x4656_u16, StaticArray[0x80_u8, 0xb5_u8, 0xcc_u8, 0xcb_u8, 0xd9_u8, 0x37_u8, 0x91_u8, 0xc5_u8])
  SENSOR_CATEGORY_ELECTRICAL = LibC::GUID.new(0xfb73fcd8_u32, 0xfc4a_u16, 0x483c_u16, StaticArray[0xac_u8, 0x58_u8, 0x27_u8, 0xb6_u8, 0x91_u8, 0xc6_u8, 0xbe_u8, 0xff_u8])
  SENSOR_CATEGORY_BIOMETRIC = LibC::GUID.new(0xca19690f_u32, 0xa2c7_u16, 0x477d_u16, StaticArray[0xa9_u8, 0x9e_u8, 0x99_u8, 0xec_u8, 0x6e_u8, 0x2b_u8, 0x56_u8, 0x48_u8])
  SENSOR_CATEGORY_LIGHT = LibC::GUID.new(0x17a665c0_u32, 0x9063_u16, 0x4216_u16, StaticArray[0xb2_u8, 0x2_u8, 0x5c_u8, 0x7a_u8, 0x25_u8, 0x5e_u8, 0x18_u8, 0xce_u8])
  SENSOR_CATEGORY_SCANNER = LibC::GUID.new(0xb000e77e_u32, 0xf5b5_u16, 0x420f_u16, StaticArray[0x81_u8, 0x5d_u8, 0x2_u8, 0x70_u8, 0xa7_u8, 0x26_u8, 0xf2_u8, 0x70_u8])
  SENSOR_CATEGORY_OTHER = LibC::GUID.new(0x2c90e7a9_u32, 0xf4c9_u16, 0x4fa2_u16, StaticArray[0xaf_u8, 0x37_u8, 0x56_u8, 0xd4_u8, 0x71_u8, 0xfe_u8, 0x5a_u8, 0x3d_u8])
  SENSOR_CATEGORY_UNSUPPORTED = LibC::GUID.new(0x2beae7fa_u32, 0x19b0_u16, 0x48c5_u16, StaticArray[0xa1_u8, 0xf6_u8, 0xb5_u8, 0x48_u8, 0xd_u8, 0xc2_u8, 0x6_u8, 0xb0_u8])
  SENSOR_TYPE_LOCATION_GPS = LibC::GUID.new(0xed4ca589_u32, 0x327a_u16, 0x4ff9_u16, StaticArray[0xa5_u8, 0x60_u8, 0x91_u8, 0xda_u8, 0x4b_u8, 0x48_u8, 0x27_u8, 0x5e_u8])
  SENSOR_TYPE_LOCATION_STATIC = LibC::GUID.new(0x95f8184_u32, 0xfa9_u16, 0x4445_u16, StaticArray[0x8e_u8, 0x6e_u8, 0xb7_u8, 0xf_u8, 0x32_u8, 0xb_u8, 0x6b_u8, 0x4c_u8])
  SENSOR_TYPE_LOCATION_LOOKUP = LibC::GUID.new(0x3b2eae4a_u32, 0x72ce_u16, 0x436d_u16, StaticArray[0x96_u8, 0xd2_u8, 0x3c_u8, 0x5b_u8, 0x85_u8, 0x70_u8, 0xe9_u8, 0x87_u8])
  SENSOR_TYPE_LOCATION_TRIANGULATION = LibC::GUID.new(0x691c341a_u32, 0x5406_u16, 0x4fe1_u16, StaticArray[0x94_u8, 0x2f_u8, 0x22_u8, 0x46_u8, 0xcb_u8, 0xeb_u8, 0x39_u8, 0xe0_u8])
  SENSOR_TYPE_LOCATION_OTHER = LibC::GUID.new(0x9b2d0566_u32, 0x368_u16, 0x4f71_u16, StaticArray[0xb8_u8, 0x8d_u8, 0x53_u8, 0x3f_u8, 0x13_u8, 0x20_u8, 0x31_u8, 0xde_u8])
  SENSOR_TYPE_LOCATION_BROADCAST = LibC::GUID.new(0xd26988cf_u32, 0x5162_u16, 0x4039_u16, StaticArray[0xbb_u8, 0x17_u8, 0x4c_u8, 0x58_u8, 0xb6_u8, 0x98_u8, 0xe4_u8, 0x4a_u8])
  SENSOR_TYPE_LOCATION_DEAD_RECKONING = LibC::GUID.new(0x1a37d538_u32, 0xf28b_u16, 0x42da_u16, StaticArray[0x9f_u8, 0xce_u8, 0xa9_u8, 0xd0_u8, 0xa2_u8, 0xa6_u8, 0xd8_u8, 0x29_u8])
  SENSOR_TYPE_ENVIRONMENTAL_TEMPERATURE = LibC::GUID.new(0x4fd0ec4_u32, 0xd5da_u16, 0x45fa_u16, StaticArray[0x95_u8, 0xa9_u8, 0x5d_u8, 0xb3_u8, 0x8e_u8, 0xe1_u8, 0x93_u8, 0x6_u8])
  SENSOR_TYPE_ENVIRONMENTAL_ATMOSPHERIC_PRESSURE = LibC::GUID.new(0xe903829_u32, 0xff8a_u16, 0x4a93_u16, StaticArray[0x97_u8, 0xdf_u8, 0x3d_u8, 0xcb_u8, 0xde_u8, 0x40_u8, 0x22_u8, 0x88_u8])
  SENSOR_TYPE_ENVIRONMENTAL_HUMIDITY = LibC::GUID.new(0x5c72bf67_u32, 0xbd7e_u16, 0x4257_u16, StaticArray[0x99_u8, 0xb_u8, 0x98_u8, 0xa3_u8, 0xba_u8, 0x3b_u8, 0x40_u8, 0xa_u8])
  SENSOR_TYPE_ENVIRONMENTAL_WIND_SPEED = LibC::GUID.new(0xdd50607b_u32, 0xa45f_u16, 0x42cd_u16, StaticArray[0x8e_u8, 0xfd_u8, 0xec_u8, 0x61_u8, 0x76_u8, 0x1c_u8, 0x42_u8, 0x26_u8])
  SENSOR_TYPE_ENVIRONMENTAL_WIND_DIRECTION = LibC::GUID.new(0x9ef57a35_u32, 0x9306_u16, 0x434d_u16, StaticArray[0xaf_u8, 0x9_u8, 0x37_u8, 0xfa_u8, 0x5a_u8, 0x9c_u8, 0x0_u8, 0xbd_u8])
  SENSOR_TYPE_ACCELEROMETER_1D = LibC::GUID.new(0xc04d2387_u32, 0x7340_u16, 0x4cc2_u16, StaticArray[0x99_u8, 0x1e_u8, 0x3b_u8, 0x18_u8, 0xcb_u8, 0x8e_u8, 0xf2_u8, 0xf4_u8])
  SENSOR_TYPE_ACCELEROMETER_2D = LibC::GUID.new(0xb2c517a8_u32, 0xf6b5_u16, 0x4ba6_u16, StaticArray[0xa4_u8, 0x23_u8, 0x5d_u8, 0xf5_u8, 0x60_u8, 0xb4_u8, 0xcc_u8, 0x7_u8])
  SENSOR_TYPE_ACCELEROMETER_3D = LibC::GUID.new(0xc2fb0f5f_u32, 0xe2d2_u16, 0x4c78_u16, StaticArray[0xbc_u8, 0xd0_u8, 0x35_u8, 0x2a_u8, 0x95_u8, 0x82_u8, 0x81_u8, 0x9d_u8])
  SENSOR_TYPE_MOTION_DETECTOR = LibC::GUID.new(0x5c7c1a12_u32, 0x30a5_u16, 0x43b9_u16, StaticArray[0xa4_u8, 0xb2_u8, 0xcf_u8, 0x9_u8, 0xec_u8, 0x5b_u8, 0x7b_u8, 0xe8_u8])
  SENSOR_TYPE_GYROMETER_1D = LibC::GUID.new(0xfa088734_u32, 0xf552_u16, 0x4584_u16, StaticArray[0x83_u8, 0x24_u8, 0xed_u8, 0xfa_u8, 0xf6_u8, 0x49_u8, 0x65_u8, 0x2c_u8])
  SENSOR_TYPE_GYROMETER_2D = LibC::GUID.new(0x31ef4f83_u32, 0x919b_u16, 0x48bf_u16, StaticArray[0x8d_u8, 0xe0_u8, 0x5d_u8, 0x7a_u8, 0x9d_u8, 0x24_u8, 0x5_u8, 0x56_u8])
  SENSOR_TYPE_GYROMETER_3D = LibC::GUID.new(0x9485f5a_u32, 0x759e_u16, 0x42c2_u16, StaticArray[0xbd_u8, 0x4b_u8, 0xa3_u8, 0x49_u8, 0xb7_u8, 0x5c_u8, 0x86_u8, 0x43_u8])
  SENSOR_TYPE_SPEEDOMETER = LibC::GUID.new(0x6bd73c1f_u32, 0xbb4_u16, 0x4310_u16, StaticArray[0x81_u8, 0xb2_u8, 0xdf_u8, 0xc1_u8, 0x8a_u8, 0x52_u8, 0xbf_u8, 0x94_u8])
  SENSOR_TYPE_COMPASS_1D = LibC::GUID.new(0xa415f6c5_u32, 0xcb50_u16, 0x49d0_u16, StaticArray[0x8e_u8, 0x62_u8, 0xa8_u8, 0x27_u8, 0xb_u8, 0xd7_u8, 0xa2_u8, 0x6c_u8])
  SENSOR_TYPE_COMPASS_2D = LibC::GUID.new(0x15655cc0_u32, 0x997a_u16, 0x4d30_u16, StaticArray[0x84_u8, 0xdb_u8, 0x57_u8, 0xca_u8, 0xba_u8, 0x36_u8, 0x48_u8, 0xbb_u8])
  SENSOR_TYPE_COMPASS_3D = LibC::GUID.new(0x76b5ce0d_u32, 0x17dd_u16, 0x414d_u16, StaticArray[0x93_u8, 0xa1_u8, 0xe1_u8, 0x27_u8, 0xf4_u8, 0xb_u8, 0xdf_u8, 0x6e_u8])
  SENSOR_TYPE_INCLINOMETER_1D = LibC::GUID.new(0xb96f98c5_u32, 0x7a75_u16, 0x4ba7_u16, StaticArray[0x94_u8, 0xe9_u8, 0xac_u8, 0x86_u8, 0x8c_u8, 0x96_u8, 0x6d_u8, 0xd8_u8])
  SENSOR_TYPE_INCLINOMETER_2D = LibC::GUID.new(0xab140f6d_u32, 0x83eb_u16, 0x4264_u16, StaticArray[0xb7_u8, 0xb_u8, 0xb1_u8, 0x6a_u8, 0x5b_u8, 0x25_u8, 0x6a_u8, 0x1_u8])
  SENSOR_TYPE_INCLINOMETER_3D = LibC::GUID.new(0xb84919fb_u32, 0xea85_u16, 0x4976_u16, StaticArray[0x84_u8, 0x44_u8, 0x6f_u8, 0x6f_u8, 0x5c_u8, 0x6d_u8, 0x31_u8, 0xdb_u8])
  SENSOR_TYPE_DISTANCE_1D = LibC::GUID.new(0x5f14ab2f_u32, 0x1407_u16, 0x4306_u16, StaticArray[0xa9_u8, 0x3f_u8, 0xb1_u8, 0xdb_u8, 0xab_u8, 0xe4_u8, 0xf9_u8, 0xc0_u8])
  SENSOR_TYPE_DISTANCE_2D = LibC::GUID.new(0x5cf9a46c_u32, 0xa9a2_u16, 0x4e55_u16, StaticArray[0xb6_u8, 0xa1_u8, 0xa0_u8, 0x4a_u8, 0xaf_u8, 0xa9_u8, 0x5a_u8, 0x92_u8])
  SENSOR_TYPE_DISTANCE_3D = LibC::GUID.new(0xa20cae31_u32, 0xe25_u16, 0x4772_u16, StaticArray[0x9f_u8, 0xe5_u8, 0x96_u8, 0x60_u8, 0x8a_u8, 0x13_u8, 0x54_u8, 0xb2_u8])
  SENSOR_TYPE_AGGREGATED_QUADRANT_ORIENTATION = LibC::GUID.new(0x9f81f1af_u32, 0xc4ab_u16, 0x4307_u16, StaticArray[0x99_u8, 0x4_u8, 0xc8_u8, 0x28_u8, 0xbf_u8, 0xb9_u8, 0x8_u8, 0x29_u8])
  SENSOR_TYPE_AGGREGATED_DEVICE_ORIENTATION = LibC::GUID.new(0xcdb5d8f7_u32, 0x3cfd_u16, 0x41c8_u16, StaticArray[0x85_u8, 0x42_u8, 0xcc_u8, 0xe6_u8, 0x22_u8, 0xcf_u8, 0x5d_u8, 0x6e_u8])
  SENSOR_TYPE_AGGREGATED_SIMPLE_DEVICE_ORIENTATION = LibC::GUID.new(0x86a19291_u32, 0x482_u16, 0x402c_u16, StaticArray[0xbf_u8, 0x4c_u8, 0xad_u8, 0xda_u8, 0xc5_u8, 0x2b_u8, 0x1c_u8, 0x39_u8])
  SENSOR_TYPE_VOLTAGE = LibC::GUID.new(0xc5484637_u32, 0x4fb7_u16, 0x4953_u16, StaticArray[0x98_u8, 0xb8_u8, 0xa5_u8, 0x6d_u8, 0x8a_u8, 0xa1_u8, 0xfb_u8, 0x1e_u8])
  SENSOR_TYPE_CURRENT = LibC::GUID.new(0x5adc9fce_u32, 0x15a0_u16, 0x4bbe_u16, StaticArray[0xa1_u8, 0xad_u8, 0x2d_u8, 0x38_u8, 0xa9_u8, 0xae_u8, 0x83_u8, 0x1c_u8])
  SENSOR_TYPE_CAPACITANCE = LibC::GUID.new(0xca2ffb1c_u32, 0x2317_u16, 0x49c0_u16, StaticArray[0xa0_u8, 0xb4_u8, 0xb6_u8, 0x3c_u8, 0xe6_u8, 0x34_u8, 0x61_u8, 0xa0_u8])
  SENSOR_TYPE_RESISTANCE = LibC::GUID.new(0x9993d2c8_u32, 0xc157_u16, 0x4a52_u16, StaticArray[0xa7_u8, 0xb5_u8, 0x19_u8, 0x5c_u8, 0x76_u8, 0x3_u8, 0x72_u8, 0x31_u8])
  SENSOR_TYPE_INDUCTANCE = LibC::GUID.new(0xdc1d933f_u32, 0xc435_u16, 0x4c7d_u16, StaticArray[0xa2_u8, 0xfe_u8, 0x60_u8, 0x71_u8, 0x92_u8, 0xa5_u8, 0x24_u8, 0xd3_u8])
  SENSOR_TYPE_ELECTRICAL_POWER = LibC::GUID.new(0x212f10f5_u32, 0x14ab_u16, 0x4376_u16, StaticArray[0x9a_u8, 0x43_u8, 0xa7_u8, 0x79_u8, 0x40_u8, 0x98_u8, 0xc2_u8, 0xfe_u8])
  SENSOR_TYPE_POTENTIOMETER = LibC::GUID.new(0x2b3681a9_u32, 0xcadc_u16, 0x45aa_u16, StaticArray[0xa6_u8, 0xff_u8, 0x54_u8, 0x95_u8, 0x7c_u8, 0x8b_u8, 0xb4_u8, 0x40_u8])
  SENSOR_TYPE_FREQUENCY = LibC::GUID.new(0x8cd2cbb6_u32, 0x73e6_u16, 0x4640_u16, StaticArray[0xa7_u8, 0x9_u8, 0x72_u8, 0xae_u8, 0x8f_u8, 0xb6_u8, 0xd_u8, 0x7f_u8])
  SENSOR_TYPE_BOOLEAN_SWITCH = LibC::GUID.new(0x9c7e371f_u32, 0x1041_u16, 0x460b_u16, StaticArray[0x8d_u8, 0x5c_u8, 0x71_u8, 0xe4_u8, 0x75_u8, 0x2e_u8, 0x35_u8, 0xc_u8])
  SENSOR_TYPE_MULTIVALUE_SWITCH = LibC::GUID.new(0xb3ee4d76_u32, 0x37a4_u16, 0x4402_u16, StaticArray[0xb2_u8, 0x5e_u8, 0x99_u8, 0xc6_u8, 0xa_u8, 0x77_u8, 0x5f_u8, 0xa1_u8])
  SENSOR_TYPE_FORCE = LibC::GUID.new(0xc2ab2b02_u32, 0x1a1c_u16, 0x4778_u16, StaticArray[0xa8_u8, 0x1b_u8, 0x95_u8, 0x4a_u8, 0x17_u8, 0x88_u8, 0xcc_u8, 0x75_u8])
  SENSOR_TYPE_SCALE = LibC::GUID.new(0xc06dd92c_u32, 0x7feb_u16, 0x438e_u16, StaticArray[0x9b_u8, 0xf6_u8, 0x82_u8, 0x20_u8, 0x7f_u8, 0xff_u8, 0x5b_u8, 0xb8_u8])
  SENSOR_TYPE_PRESSURE = LibC::GUID.new(0x26d31f34_u32, 0x6352_u16, 0x41cf_u16, StaticArray[0xb7_u8, 0x93_u8, 0xea_u8, 0x7_u8, 0x13_u8, 0xd5_u8, 0x3d_u8, 0x77_u8])
  SENSOR_TYPE_STRAIN = LibC::GUID.new(0xc6d1ec0e_u32, 0x6803_u16, 0x4361_u16, StaticArray[0xad_u8, 0x3d_u8, 0x85_u8, 0xbc_u8, 0xc5_u8, 0x8c_u8, 0x6d_u8, 0x29_u8])
  SENSOR_TYPE_BOOLEAN_SWITCH_ARRAY = LibC::GUID.new(0x545c8ba5_u32, 0xb143_u16, 0x4545_u16, StaticArray[0x86_u8, 0x8f_u8, 0xca_u8, 0x7f_u8, 0xd9_u8, 0x86_u8, 0xb4_u8, 0xf6_u8])
  SENSOR_TYPE_HUMAN_PRESENCE = LibC::GUID.new(0xc138c12b_u32, 0xad52_u16, 0x451c_u16, StaticArray[0x93_u8, 0x75_u8, 0x87_u8, 0xf5_u8, 0x18_u8, 0xff_u8, 0x10_u8, 0xc6_u8])
  SENSOR_TYPE_HUMAN_PROXIMITY = LibC::GUID.new(0x5220dae9_u32, 0x3179_u16, 0x4430_u16, StaticArray[0x9f_u8, 0x90_u8, 0x6_u8, 0x26_u8, 0x6d_u8, 0x2a_u8, 0x34_u8, 0xde_u8])
  SENSOR_TYPE_TOUCH = LibC::GUID.new(0x17db3018_u32, 0x6c4_u16, 0x4f7d_u16, StaticArray[0x81_u8, 0xaf_u8, 0x92_u8, 0x74_u8, 0xb7_u8, 0x59_u8, 0x9c_u8, 0x27_u8])
  SENSOR_TYPE_AMBIENT_LIGHT = LibC::GUID.new(0x97f115c8_u32, 0x599a_u16, 0x4153_u16, StaticArray[0x88_u8, 0x94_u8, 0xd2_u8, 0xd1_u8, 0x28_u8, 0x99_u8, 0x91_u8, 0x8a_u8])
  SENSOR_TYPE_RFID_SCANNER = LibC::GUID.new(0x44328ef5_u32, 0x2dd_u16, 0x4e8d_u16, StaticArray[0xad_u8, 0x5d_u8, 0x92_u8, 0x49_u8, 0x83_u8, 0x2b_u8, 0x2e_u8, 0xca_u8])
  SENSOR_TYPE_BARCODE_SCANNER = LibC::GUID.new(0x990b3d8f_u32, 0x85bb_u16, 0x45ff_u16, StaticArray[0x91_u8, 0x4d_u8, 0x99_u8, 0x8c_u8, 0x4_u8, 0xf3_u8, 0x72_u8, 0xdf_u8])
  SENSOR_TYPE_CUSTOM = LibC::GUID.new(0xe83af229_u32, 0x8640_u16, 0x4d18_u16, StaticArray[0xa2_u8, 0x13_u8, 0xe2_u8, 0x26_u8, 0x75_u8, 0xeb_u8, 0xb2_u8, 0xc3_u8])
  SENSOR_TYPE_UNKNOWN = LibC::GUID.new(0x10ba83e3_u32, 0xef4f_u16, 0x41ed_u16, StaticArray[0x98_u8, 0x85_u8, 0xa8_u8, 0x7d_u8, 0x64_u8, 0x35_u8, 0xa8_u8, 0xe1_u8])
  SENSOR_DATA_TYPE_COMMON_GUID = LibC::GUID.new(0xdb5e0cf2_u32, 0xcf1f_u16, 0x4c18_u16, StaticArray[0xb4_u8, 0x6c_u8, 0xd8_u8, 0x60_u8, 0x11_u8, 0xd6_u8, 0x21_u8, 0x50_u8])
  SENSOR_DATA_TYPE_TIMESTAMP = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xdb5e0cf2_u32, 0xcf1f_u16, 0x4c18_u16, StaticArray[0xb4_u8, 0x6c_u8, 0xd8_u8, 0x60_u8, 0x11_u8, 0xd6_u8, 0x21_u8, 0x50_u8]), 2_u32)
  SENSOR_DATA_TYPE_LOCATION_GUID = LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8])
  SENSOR_DATA_TYPE_LATITUDE_DEGREES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 2_u32)
  SENSOR_DATA_TYPE_LONGITUDE_DEGREES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 3_u32)
  SENSOR_DATA_TYPE_ALTITUDE_SEALEVEL_METERS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 4_u32)
  SENSOR_DATA_TYPE_ALTITUDE_ELLIPSOID_METERS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 5_u32)
  SENSOR_DATA_TYPE_SPEED_KNOTS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 6_u32)
  SENSOR_DATA_TYPE_TRUE_HEADING_DEGREES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 7_u32)
  SENSOR_DATA_TYPE_MAGNETIC_HEADING_DEGREES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 8_u32)
  SENSOR_DATA_TYPE_MAGNETIC_VARIATION = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 9_u32)
  SENSOR_DATA_TYPE_FIX_QUALITY = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 10_u32)
  SENSOR_DATA_TYPE_FIX_TYPE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 11_u32)
  SENSOR_DATA_TYPE_POSITION_DILUTION_OF_PRECISION = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 12_u32)
  SENSOR_DATA_TYPE_HORIZONAL_DILUTION_OF_PRECISION = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 13_u32)
  SENSOR_DATA_TYPE_VERTICAL_DILUTION_OF_PRECISION = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 14_u32)
  SENSOR_DATA_TYPE_SATELLITES_USED_COUNT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 15_u32)
  SENSOR_DATA_TYPE_SATELLITES_USED_PRNS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 16_u32)
  SENSOR_DATA_TYPE_SATELLITES_IN_VIEW = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 17_u32)
  SENSOR_DATA_TYPE_SATELLITES_IN_VIEW_PRNS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 18_u32)
  SENSOR_DATA_TYPE_SATELLITES_IN_VIEW_ELEVATION = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 19_u32)
  SENSOR_DATA_TYPE_SATELLITES_IN_VIEW_AZIMUTH = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 20_u32)
  SENSOR_DATA_TYPE_SATELLITES_IN_VIEW_STN_RATIO = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 21_u32)
  SENSOR_DATA_TYPE_ERROR_RADIUS_METERS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 22_u32)
  SENSOR_DATA_TYPE_ADDRESS1 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 23_u32)
  SENSOR_DATA_TYPE_ADDRESS2 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 24_u32)
  SENSOR_DATA_TYPE_CITY = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 25_u32)
  SENSOR_DATA_TYPE_STATE_PROVINCE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 26_u32)
  SENSOR_DATA_TYPE_POSTALCODE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 27_u32)
  SENSOR_DATA_TYPE_COUNTRY_REGION = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 28_u32)
  SENSOR_DATA_TYPE_ALTITUDE_ELLIPSOID_ERROR_METERS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 29_u32)
  SENSOR_DATA_TYPE_ALTITUDE_SEALEVEL_ERROR_METERS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 30_u32)
  SENSOR_DATA_TYPE_GPS_SELECTION_MODE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 31_u32)
  SENSOR_DATA_TYPE_GPS_OPERATION_MODE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 32_u32)
  SENSOR_DATA_TYPE_GPS_STATUS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 33_u32)
  SENSOR_DATA_TYPE_GEOIDAL_SEPARATION = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 34_u32)
  SENSOR_DATA_TYPE_DGPS_DATA_AGE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 35_u32)
  SENSOR_DATA_TYPE_ALTITUDE_ANTENNA_SEALEVEL_METERS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 36_u32)
  SENSOR_DATA_TYPE_DIFFERENTIAL_REFERENCE_STATION_ID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 37_u32)
  SENSOR_DATA_TYPE_NMEA_SENTENCE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 38_u32)
  SENSOR_DATA_TYPE_SATELLITES_IN_VIEW_ID = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 39_u32)
  SENSOR_DATA_TYPE_LOCATION_SOURCE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 40_u32)
  SENSOR_DATA_TYPE_SATELLITES_USED_PRNS_AND_CONSTELLATIONS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 41_u32)
  SENSOR_DATA_TYPE_ENVIRONMENTAL_GUID = LibC::GUID.new(0x8b0aa2f1_u32, 0x2d57_u16, 0x42ee_u16, StaticArray[0x8c_u8, 0xc0_u8, 0x4d_u8, 0x27_u8, 0x62_u8, 0x2b_u8, 0x46_u8, 0xc4_u8])
  SENSOR_DATA_TYPE_TEMPERATURE_CELSIUS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x8b0aa2f1_u32, 0x2d57_u16, 0x42ee_u16, StaticArray[0x8c_u8, 0xc0_u8, 0x4d_u8, 0x27_u8, 0x62_u8, 0x2b_u8, 0x46_u8, 0xc4_u8]), 2_u32)
  SENSOR_DATA_TYPE_RELATIVE_HUMIDITY_PERCENT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x8b0aa2f1_u32, 0x2d57_u16, 0x42ee_u16, StaticArray[0x8c_u8, 0xc0_u8, 0x4d_u8, 0x27_u8, 0x62_u8, 0x2b_u8, 0x46_u8, 0xc4_u8]), 3_u32)
  SENSOR_DATA_TYPE_ATMOSPHERIC_PRESSURE_BAR = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x8b0aa2f1_u32, 0x2d57_u16, 0x42ee_u16, StaticArray[0x8c_u8, 0xc0_u8, 0x4d_u8, 0x27_u8, 0x62_u8, 0x2b_u8, 0x46_u8, 0xc4_u8]), 4_u32)
  SENSOR_DATA_TYPE_WIND_DIRECTION_DEGREES_ANTICLOCKWISE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x8b0aa2f1_u32, 0x2d57_u16, 0x42ee_u16, StaticArray[0x8c_u8, 0xc0_u8, 0x4d_u8, 0x27_u8, 0x62_u8, 0x2b_u8, 0x46_u8, 0xc4_u8]), 5_u32)
  SENSOR_DATA_TYPE_WIND_SPEED_METERS_PER_SECOND = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x8b0aa2f1_u32, 0x2d57_u16, 0x42ee_u16, StaticArray[0x8c_u8, 0xc0_u8, 0x4d_u8, 0x27_u8, 0x62_u8, 0x2b_u8, 0x46_u8, 0xc4_u8]), 6_u32)
  SENSOR_DATA_TYPE_MOTION_GUID = LibC::GUID.new(0x3f8a69a2_u32, 0x7c5_u16, 0x4e48_u16, StaticArray[0xa9_u8, 0x65_u8, 0xcd_u8, 0x79_u8, 0x7a_u8, 0xab_u8, 0x56_u8, 0xd5_u8])
  SENSOR_DATA_TYPE_ACCELERATION_X_G = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x3f8a69a2_u32, 0x7c5_u16, 0x4e48_u16, StaticArray[0xa9_u8, 0x65_u8, 0xcd_u8, 0x79_u8, 0x7a_u8, 0xab_u8, 0x56_u8, 0xd5_u8]), 2_u32)
  SENSOR_DATA_TYPE_ACCELERATION_Y_G = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x3f8a69a2_u32, 0x7c5_u16, 0x4e48_u16, StaticArray[0xa9_u8, 0x65_u8, 0xcd_u8, 0x79_u8, 0x7a_u8, 0xab_u8, 0x56_u8, 0xd5_u8]), 3_u32)
  SENSOR_DATA_TYPE_ACCELERATION_Z_G = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x3f8a69a2_u32, 0x7c5_u16, 0x4e48_u16, StaticArray[0xa9_u8, 0x65_u8, 0xcd_u8, 0x79_u8, 0x7a_u8, 0xab_u8, 0x56_u8, 0xd5_u8]), 4_u32)
  SENSOR_DATA_TYPE_ANGULAR_ACCELERATION_X_DEGREES_PER_SECOND_SQUARED = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x3f8a69a2_u32, 0x7c5_u16, 0x4e48_u16, StaticArray[0xa9_u8, 0x65_u8, 0xcd_u8, 0x79_u8, 0x7a_u8, 0xab_u8, 0x56_u8, 0xd5_u8]), 5_u32)
  SENSOR_DATA_TYPE_ANGULAR_ACCELERATION_Y_DEGREES_PER_SECOND_SQUARED = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x3f8a69a2_u32, 0x7c5_u16, 0x4e48_u16, StaticArray[0xa9_u8, 0x65_u8, 0xcd_u8, 0x79_u8, 0x7a_u8, 0xab_u8, 0x56_u8, 0xd5_u8]), 6_u32)
  SENSOR_DATA_TYPE_ANGULAR_ACCELERATION_Z_DEGREES_PER_SECOND_SQUARED = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x3f8a69a2_u32, 0x7c5_u16, 0x4e48_u16, StaticArray[0xa9_u8, 0x65_u8, 0xcd_u8, 0x79_u8, 0x7a_u8, 0xab_u8, 0x56_u8, 0xd5_u8]), 7_u32)
  SENSOR_DATA_TYPE_SPEED_METERS_PER_SECOND = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x3f8a69a2_u32, 0x7c5_u16, 0x4e48_u16, StaticArray[0xa9_u8, 0x65_u8, 0xcd_u8, 0x79_u8, 0x7a_u8, 0xab_u8, 0x56_u8, 0xd5_u8]), 8_u32)
  SENSOR_DATA_TYPE_MOTION_STATE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x3f8a69a2_u32, 0x7c5_u16, 0x4e48_u16, StaticArray[0xa9_u8, 0x65_u8, 0xcd_u8, 0x79_u8, 0x7a_u8, 0xab_u8, 0x56_u8, 0xd5_u8]), 9_u32)
  SENSOR_DATA_TYPE_ANGULAR_VELOCITY_X_DEGREES_PER_SECOND = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x3f8a69a2_u32, 0x7c5_u16, 0x4e48_u16, StaticArray[0xa9_u8, 0x65_u8, 0xcd_u8, 0x79_u8, 0x7a_u8, 0xab_u8, 0x56_u8, 0xd5_u8]), 10_u32)
  SENSOR_DATA_TYPE_ANGULAR_VELOCITY_Y_DEGREES_PER_SECOND = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x3f8a69a2_u32, 0x7c5_u16, 0x4e48_u16, StaticArray[0xa9_u8, 0x65_u8, 0xcd_u8, 0x79_u8, 0x7a_u8, 0xab_u8, 0x56_u8, 0xd5_u8]), 11_u32)
  SENSOR_DATA_TYPE_ANGULAR_VELOCITY_Z_DEGREES_PER_SECOND = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x3f8a69a2_u32, 0x7c5_u16, 0x4e48_u16, StaticArray[0xa9_u8, 0x65_u8, 0xcd_u8, 0x79_u8, 0x7a_u8, 0xab_u8, 0x56_u8, 0xd5_u8]), 12_u32)
  SENSOR_DATA_TYPE_ORIENTATION_GUID = LibC::GUID.new(0x1637d8a2_u32, 0x4248_u16, 0x4275_u16, StaticArray[0x86_u8, 0x5d_u8, 0x55_u8, 0x8d_u8, 0xe8_u8, 0x4a_u8, 0xed_u8, 0xfd_u8])
  SENSOR_DATA_TYPE_TILT_X_DEGREES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1637d8a2_u32, 0x4248_u16, 0x4275_u16, StaticArray[0x86_u8, 0x5d_u8, 0x55_u8, 0x8d_u8, 0xe8_u8, 0x4a_u8, 0xed_u8, 0xfd_u8]), 2_u32)
  SENSOR_DATA_TYPE_TILT_Y_DEGREES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1637d8a2_u32, 0x4248_u16, 0x4275_u16, StaticArray[0x86_u8, 0x5d_u8, 0x55_u8, 0x8d_u8, 0xe8_u8, 0x4a_u8, 0xed_u8, 0xfd_u8]), 3_u32)
  SENSOR_DATA_TYPE_TILT_Z_DEGREES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1637d8a2_u32, 0x4248_u16, 0x4275_u16, StaticArray[0x86_u8, 0x5d_u8, 0x55_u8, 0x8d_u8, 0xe8_u8, 0x4a_u8, 0xed_u8, 0xfd_u8]), 4_u32)
  SENSOR_DATA_TYPE_MAGNETIC_HEADING_X_DEGREES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1637d8a2_u32, 0x4248_u16, 0x4275_u16, StaticArray[0x86_u8, 0x5d_u8, 0x55_u8, 0x8d_u8, 0xe8_u8, 0x4a_u8, 0xed_u8, 0xfd_u8]), 5_u32)
  SENSOR_DATA_TYPE_MAGNETIC_HEADING_Y_DEGREES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1637d8a2_u32, 0x4248_u16, 0x4275_u16, StaticArray[0x86_u8, 0x5d_u8, 0x55_u8, 0x8d_u8, 0xe8_u8, 0x4a_u8, 0xed_u8, 0xfd_u8]), 6_u32)
  SENSOR_DATA_TYPE_MAGNETIC_HEADING_Z_DEGREES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1637d8a2_u32, 0x4248_u16, 0x4275_u16, StaticArray[0x86_u8, 0x5d_u8, 0x55_u8, 0x8d_u8, 0xe8_u8, 0x4a_u8, 0xed_u8, 0xfd_u8]), 7_u32)
  SENSOR_DATA_TYPE_DISTANCE_X_METERS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1637d8a2_u32, 0x4248_u16, 0x4275_u16, StaticArray[0x86_u8, 0x5d_u8, 0x55_u8, 0x8d_u8, 0xe8_u8, 0x4a_u8, 0xed_u8, 0xfd_u8]), 8_u32)
  SENSOR_DATA_TYPE_DISTANCE_Y_METERS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1637d8a2_u32, 0x4248_u16, 0x4275_u16, StaticArray[0x86_u8, 0x5d_u8, 0x55_u8, 0x8d_u8, 0xe8_u8, 0x4a_u8, 0xed_u8, 0xfd_u8]), 9_u32)
  SENSOR_DATA_TYPE_DISTANCE_Z_METERS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1637d8a2_u32, 0x4248_u16, 0x4275_u16, StaticArray[0x86_u8, 0x5d_u8, 0x55_u8, 0x8d_u8, 0xe8_u8, 0x4a_u8, 0xed_u8, 0xfd_u8]), 10_u32)
  SENSOR_DATA_TYPE_MAGNETIC_HEADING_COMPENSATED_MAGNETIC_NORTH_DEGREES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1637d8a2_u32, 0x4248_u16, 0x4275_u16, StaticArray[0x86_u8, 0x5d_u8, 0x55_u8, 0x8d_u8, 0xe8_u8, 0x4a_u8, 0xed_u8, 0xfd_u8]), 11_u32)
  SENSOR_DATA_TYPE_MAGNETIC_HEADING_COMPENSATED_TRUE_NORTH_DEGREES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1637d8a2_u32, 0x4248_u16, 0x4275_u16, StaticArray[0x86_u8, 0x5d_u8, 0x55_u8, 0x8d_u8, 0xe8_u8, 0x4a_u8, 0xed_u8, 0xfd_u8]), 12_u32)
  SENSOR_DATA_TYPE_MAGNETIC_HEADING_MAGNETIC_NORTH_DEGREES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1637d8a2_u32, 0x4248_u16, 0x4275_u16, StaticArray[0x86_u8, 0x5d_u8, 0x55_u8, 0x8d_u8, 0xe8_u8, 0x4a_u8, 0xed_u8, 0xfd_u8]), 13_u32)
  SENSOR_DATA_TYPE_MAGNETIC_HEADING_TRUE_NORTH_DEGREES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1637d8a2_u32, 0x4248_u16, 0x4275_u16, StaticArray[0x86_u8, 0x5d_u8, 0x55_u8, 0x8d_u8, 0xe8_u8, 0x4a_u8, 0xed_u8, 0xfd_u8]), 14_u32)
  SENSOR_DATA_TYPE_QUADRANT_ANGLE_DEGREES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1637d8a2_u32, 0x4248_u16, 0x4275_u16, StaticArray[0x86_u8, 0x5d_u8, 0x55_u8, 0x8d_u8, 0xe8_u8, 0x4a_u8, 0xed_u8, 0xfd_u8]), 15_u32)
  SENSOR_DATA_TYPE_ROTATION_MATRIX = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1637d8a2_u32, 0x4248_u16, 0x4275_u16, StaticArray[0x86_u8, 0x5d_u8, 0x55_u8, 0x8d_u8, 0xe8_u8, 0x4a_u8, 0xed_u8, 0xfd_u8]), 16_u32)
  SENSOR_DATA_TYPE_QUATERNION = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1637d8a2_u32, 0x4248_u16, 0x4275_u16, StaticArray[0x86_u8, 0x5d_u8, 0x55_u8, 0x8d_u8, 0xe8_u8, 0x4a_u8, 0xed_u8, 0xfd_u8]), 17_u32)
  SENSOR_DATA_TYPE_SIMPLE_DEVICE_ORIENTATION = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1637d8a2_u32, 0x4248_u16, 0x4275_u16, StaticArray[0x86_u8, 0x5d_u8, 0x55_u8, 0x8d_u8, 0xe8_u8, 0x4a_u8, 0xed_u8, 0xfd_u8]), 18_u32)
  SENSOR_DATA_TYPE_MAGNETIC_FIELD_STRENGTH_X_MILLIGAUSS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1637d8a2_u32, 0x4248_u16, 0x4275_u16, StaticArray[0x86_u8, 0x5d_u8, 0x55_u8, 0x8d_u8, 0xe8_u8, 0x4a_u8, 0xed_u8, 0xfd_u8]), 19_u32)
  SENSOR_DATA_TYPE_MAGNETIC_FIELD_STRENGTH_Y_MILLIGAUSS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1637d8a2_u32, 0x4248_u16, 0x4275_u16, StaticArray[0x86_u8, 0x5d_u8, 0x55_u8, 0x8d_u8, 0xe8_u8, 0x4a_u8, 0xed_u8, 0xfd_u8]), 20_u32)
  SENSOR_DATA_TYPE_MAGNETIC_FIELD_STRENGTH_Z_MILLIGAUSS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1637d8a2_u32, 0x4248_u16, 0x4275_u16, StaticArray[0x86_u8, 0x5d_u8, 0x55_u8, 0x8d_u8, 0xe8_u8, 0x4a_u8, 0xed_u8, 0xfd_u8]), 21_u32)
  SENSOR_DATA_TYPE_MAGNETOMETER_ACCURACY = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x1637d8a2_u32, 0x4248_u16, 0x4275_u16, StaticArray[0x86_u8, 0x5d_u8, 0x55_u8, 0x8d_u8, 0xe8_u8, 0x4a_u8, 0xed_u8, 0xfd_u8]), 22_u32)
  SENSOR_DATA_TYPE_GUID_MECHANICAL_GUID = LibC::GUID.new(0x38564a7c_u32, 0xf2f2_u16, 0x49bb_u16, StaticArray[0x9b_u8, 0x2b_u8, 0xba_u8, 0x60_u8, 0xf6_u8, 0x6a_u8, 0x58_u8, 0xdf_u8])
  SENSOR_DATA_TYPE_BOOLEAN_SWITCH_STATE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x38564a7c_u32, 0xf2f2_u16, 0x49bb_u16, StaticArray[0x9b_u8, 0x2b_u8, 0xba_u8, 0x60_u8, 0xf6_u8, 0x6a_u8, 0x58_u8, 0xdf_u8]), 2_u32)
  SENSOR_DATA_TYPE_MULTIVALUE_SWITCH_STATE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x38564a7c_u32, 0xf2f2_u16, 0x49bb_u16, StaticArray[0x9b_u8, 0x2b_u8, 0xba_u8, 0x60_u8, 0xf6_u8, 0x6a_u8, 0x58_u8, 0xdf_u8]), 3_u32)
  SENSOR_DATA_TYPE_FORCE_NEWTONS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x38564a7c_u32, 0xf2f2_u16, 0x49bb_u16, StaticArray[0x9b_u8, 0x2b_u8, 0xba_u8, 0x60_u8, 0xf6_u8, 0x6a_u8, 0x58_u8, 0xdf_u8]), 4_u32)
  SENSOR_DATA_TYPE_ABSOLUTE_PRESSURE_PASCAL = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x38564a7c_u32, 0xf2f2_u16, 0x49bb_u16, StaticArray[0x9b_u8, 0x2b_u8, 0xba_u8, 0x60_u8, 0xf6_u8, 0x6a_u8, 0x58_u8, 0xdf_u8]), 5_u32)
  SENSOR_DATA_TYPE_GAUGE_PRESSURE_PASCAL = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x38564a7c_u32, 0xf2f2_u16, 0x49bb_u16, StaticArray[0x9b_u8, 0x2b_u8, 0xba_u8, 0x60_u8, 0xf6_u8, 0x6a_u8, 0x58_u8, 0xdf_u8]), 6_u32)
  SENSOR_DATA_TYPE_STRAIN = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x38564a7c_u32, 0xf2f2_u16, 0x49bb_u16, StaticArray[0x9b_u8, 0x2b_u8, 0xba_u8, 0x60_u8, 0xf6_u8, 0x6a_u8, 0x58_u8, 0xdf_u8]), 7_u32)
  SENSOR_DATA_TYPE_WEIGHT_KILOGRAMS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x38564a7c_u32, 0xf2f2_u16, 0x49bb_u16, StaticArray[0x9b_u8, 0x2b_u8, 0xba_u8, 0x60_u8, 0xf6_u8, 0x6a_u8, 0x58_u8, 0xdf_u8]), 8_u32)
  SENSOR_DATA_TYPE_BOOLEAN_SWITCH_ARRAY_STATES = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x38564a7c_u32, 0xf2f2_u16, 0x49bb_u16, StaticArray[0x9b_u8, 0x2b_u8, 0xba_u8, 0x60_u8, 0xf6_u8, 0x6a_u8, 0x58_u8, 0xdf_u8]), 10_u32)
  SENSOR_DATA_TYPE_BIOMETRIC_GUID = LibC::GUID.new(0x2299288a_u32, 0x6d9e_u16, 0x4b0b_u16, StaticArray[0xb7_u8, 0xec_u8, 0x35_u8, 0x28_u8, 0xf8_u8, 0x9e_u8, 0x40_u8, 0xaf_u8])
  SENSOR_DATA_TYPE_HUMAN_PRESENCE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2299288a_u32, 0x6d9e_u16, 0x4b0b_u16, StaticArray[0xb7_u8, 0xec_u8, 0x35_u8, 0x28_u8, 0xf8_u8, 0x9e_u8, 0x40_u8, 0xaf_u8]), 2_u32)
  SENSOR_DATA_TYPE_HUMAN_PROXIMITY_METERS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2299288a_u32, 0x6d9e_u16, 0x4b0b_u16, StaticArray[0xb7_u8, 0xec_u8, 0x35_u8, 0x28_u8, 0xf8_u8, 0x9e_u8, 0x40_u8, 0xaf_u8]), 3_u32)
  SENSOR_DATA_TYPE_TOUCH_STATE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0x2299288a_u32, 0x6d9e_u16, 0x4b0b_u16, StaticArray[0xb7_u8, 0xec_u8, 0x35_u8, 0x28_u8, 0xf8_u8, 0x9e_u8, 0x40_u8, 0xaf_u8]), 4_u32)
  SENSOR_DATA_TYPE_LIGHT_GUID = LibC::GUID.new(0xe4c77ce2_u32, 0xdcb7_u16, 0x46e9_u16, StaticArray[0x84_u8, 0x39_u8, 0x4f_u8, 0xec_u8, 0x54_u8, 0x88_u8, 0x33_u8, 0xa6_u8])
  SENSOR_DATA_TYPE_LIGHT_LEVEL_LUX = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe4c77ce2_u32, 0xdcb7_u16, 0x46e9_u16, StaticArray[0x84_u8, 0x39_u8, 0x4f_u8, 0xec_u8, 0x54_u8, 0x88_u8, 0x33_u8, 0xa6_u8]), 2_u32)
  SENSOR_DATA_TYPE_LIGHT_TEMPERATURE_KELVIN = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe4c77ce2_u32, 0xdcb7_u16, 0x46e9_u16, StaticArray[0x84_u8, 0x39_u8, 0x4f_u8, 0xec_u8, 0x54_u8, 0x88_u8, 0x33_u8, 0xa6_u8]), 3_u32)
  SENSOR_DATA_TYPE_LIGHT_CHROMACITY = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe4c77ce2_u32, 0xdcb7_u16, 0x46e9_u16, StaticArray[0x84_u8, 0x39_u8, 0x4f_u8, 0xec_u8, 0x54_u8, 0x88_u8, 0x33_u8, 0xa6_u8]), 4_u32)
  SENSOR_DATA_TYPE_SCANNER_GUID = LibC::GUID.new(0xd7a59a3c_u32, 0x3421_u16, 0x44ab_u16, StaticArray[0x8d_u8, 0x3a_u8, 0x9d_u8, 0xe8_u8, 0xab_u8, 0x6c_u8, 0x4c_u8, 0xae_u8])
  SENSOR_DATA_TYPE_RFID_TAG_40_BIT = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xd7a59a3c_u32, 0x3421_u16, 0x44ab_u16, StaticArray[0x8d_u8, 0x3a_u8, 0x9d_u8, 0xe8_u8, 0xab_u8, 0x6c_u8, 0x4c_u8, 0xae_u8]), 2_u32)
  SENSOR_DATA_TYPE_ELECTRICAL_GUID = LibC::GUID.new(0xbbb246d1_u32, 0xe242_u16, 0x4780_u16, StaticArray[0xa2_u8, 0xd3_u8, 0xcd_u8, 0xed_u8, 0x84_u8, 0xf3_u8, 0x58_u8, 0x42_u8])
  SENSOR_DATA_TYPE_VOLTAGE_VOLTS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xbbb246d1_u32, 0xe242_u16, 0x4780_u16, StaticArray[0xa2_u8, 0xd3_u8, 0xcd_u8, 0xed_u8, 0x84_u8, 0xf3_u8, 0x58_u8, 0x42_u8]), 2_u32)
  SENSOR_DATA_TYPE_CURRENT_AMPS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xbbb246d1_u32, 0xe242_u16, 0x4780_u16, StaticArray[0xa2_u8, 0xd3_u8, 0xcd_u8, 0xed_u8, 0x84_u8, 0xf3_u8, 0x58_u8, 0x42_u8]), 3_u32)
  SENSOR_DATA_TYPE_CAPACITANCE_FARAD = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xbbb246d1_u32, 0xe242_u16, 0x4780_u16, StaticArray[0xa2_u8, 0xd3_u8, 0xcd_u8, 0xed_u8, 0x84_u8, 0xf3_u8, 0x58_u8, 0x42_u8]), 4_u32)
  SENSOR_DATA_TYPE_RESISTANCE_OHMS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xbbb246d1_u32, 0xe242_u16, 0x4780_u16, StaticArray[0xa2_u8, 0xd3_u8, 0xcd_u8, 0xed_u8, 0x84_u8, 0xf3_u8, 0x58_u8, 0x42_u8]), 5_u32)
  SENSOR_DATA_TYPE_INDUCTANCE_HENRY = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xbbb246d1_u32, 0xe242_u16, 0x4780_u16, StaticArray[0xa2_u8, 0xd3_u8, 0xcd_u8, 0xed_u8, 0x84_u8, 0xf3_u8, 0x58_u8, 0x42_u8]), 6_u32)
  SENSOR_DATA_TYPE_ELECTRICAL_POWER_WATTS = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xbbb246d1_u32, 0xe242_u16, 0x4780_u16, StaticArray[0xa2_u8, 0xd3_u8, 0xcd_u8, 0xed_u8, 0x84_u8, 0xf3_u8, 0x58_u8, 0x42_u8]), 7_u32)
  SENSOR_DATA_TYPE_ELECTRICAL_PERCENT_OF_RANGE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xbbb246d1_u32, 0xe242_u16, 0x4780_u16, StaticArray[0xa2_u8, 0xd3_u8, 0xcd_u8, 0xed_u8, 0x84_u8, 0xf3_u8, 0x58_u8, 0x42_u8]), 8_u32)
  SENSOR_DATA_TYPE_ELECTRICAL_FREQUENCY_HERTZ = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xbbb246d1_u32, 0xe242_u16, 0x4780_u16, StaticArray[0xa2_u8, 0xd3_u8, 0xcd_u8, 0xed_u8, 0x84_u8, 0xf3_u8, 0x58_u8, 0x42_u8]), 9_u32)
  SENSOR_DATA_TYPE_CUSTOM_GUID = LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8])
  SENSOR_DATA_TYPE_CUSTOM_USAGE = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 5_u32)
  SENSOR_DATA_TYPE_CUSTOM_BOOLEAN_ARRAY = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 6_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE1 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 7_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE2 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 8_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE3 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 9_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE4 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 10_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE5 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 11_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE6 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 12_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE7 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 13_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE8 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 14_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE9 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 15_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE10 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 16_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE11 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 17_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE12 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 18_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE13 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 19_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE14 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 20_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE15 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 21_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE16 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 22_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE17 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 23_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE18 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 24_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE19 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 25_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE20 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 26_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE21 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 27_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE22 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 28_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE23 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 29_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE24 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 30_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE25 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 31_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE26 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 32_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE27 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 33_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE28 = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 34_u32)
  SENSOR_PROPERTY_TEST_GUID = LibC::GUID.new(0xe1e962f4_u32, 0x6e65_u16, 0x45f7_u16, StaticArray[0x9c_u8, 0x36_u8, 0xd4_u8, 0x87_u8, 0xb7_u8, 0xb1_u8, 0xbd_u8, 0x34_u8])
  SENSOR_PROPERTY_CLEAR_ASSISTANCE_DATA = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe1e962f4_u32, 0x6e65_u16, 0x45f7_u16, StaticArray[0x9c_u8, 0x36_u8, 0xd4_u8, 0x87_u8, 0xb7_u8, 0xb1_u8, 0xbd_u8, 0x34_u8]), 2_u32)
  SENSOR_PROPERTY_TURN_ON_OFF_NMEA = Win32cr::Foundation::PROPERTYKEY.new(LibC::GUID.new(0xe1e962f4_u32, 0x6e65_u16, 0x45f7_u16, StaticArray[0x9c_u8, 0x36_u8, 0xd4_u8, 0x87_u8, 0xb7_u8, 0xb1_u8, 0xbd_u8, 0x34_u8]), 3_u32)
  GNSS_CLEAR_ALL_ASSISTANCE_DATA = 1_u32
  GUID_SensorCategory_All = LibC::GUID.new(0xc317c286_u32, 0xc468_u16, 0x4288_u16, StaticArray[0x99_u8, 0x75_u8, 0xd4_u8, 0xc4_u8, 0x58_u8, 0x7c_u8, 0x44_u8, 0x2c_u8])
  GUID_SensorCategory_Biometric = LibC::GUID.new(0xca19690f_u32, 0xa2c7_u16, 0x477d_u16, StaticArray[0xa9_u8, 0x9e_u8, 0x99_u8, 0xec_u8, 0x6e_u8, 0x2b_u8, 0x56_u8, 0x48_u8])
  GUID_SensorCategory_Electrical = LibC::GUID.new(0xfb73fcd8_u32, 0xfc4a_u16, 0x483c_u16, StaticArray[0xac_u8, 0x58_u8, 0x27_u8, 0xb6_u8, 0x91_u8, 0xc6_u8, 0xbe_u8, 0xff_u8])
  GUID_SensorCategory_Environmental = LibC::GUID.new(0x323439aa_u32, 0x7f66_u16, 0x492b_u16, StaticArray[0xba_u8, 0xc_u8, 0x73_u8, 0xe9_u8, 0xaa_u8, 0xa_u8, 0x65_u8, 0xd5_u8])
  GUID_SensorCategory_Light = LibC::GUID.new(0x17a665c0_u32, 0x9063_u16, 0x4216_u16, StaticArray[0xb2_u8, 0x2_u8, 0x5c_u8, 0x7a_u8, 0x25_u8, 0x5e_u8, 0x18_u8, 0xce_u8])
  GUID_SensorCategory_Location = LibC::GUID.new(0xbfa794e4_u32, 0xf964_u16, 0x4fdb_u16, StaticArray[0x90_u8, 0xf6_u8, 0x51_u8, 0x5_u8, 0x6b_u8, 0xfe_u8, 0x4b_u8, 0x44_u8])
  GUID_SensorCategory_Mechanical = LibC::GUID.new(0x8d131d68_u32, 0x8ef7_u16, 0x4656_u16, StaticArray[0x80_u8, 0xb5_u8, 0xcc_u8, 0xcb_u8, 0xd9_u8, 0x37_u8, 0x91_u8, 0xc5_u8])
  GUID_SensorCategory_Motion = LibC::GUID.new(0xcd09daf1_u32, 0x3b2e_u16, 0x4c3d_u16, StaticArray[0xb5_u8, 0x98_u8, 0xb5_u8, 0xe5_u8, 0xff_u8, 0x93_u8, 0xfd_u8, 0x46_u8])
  GUID_SensorCategory_Orientation = LibC::GUID.new(0x9e6c04b6_u32, 0x96fe_u16, 0x4954_u16, StaticArray[0xb7_u8, 0x26_u8, 0x68_u8, 0x68_u8, 0x2a_u8, 0x47_u8, 0x3f_u8, 0x69_u8])
  GUID_SensorCategory_Other = LibC::GUID.new(0x2c90e7a9_u32, 0xf4c9_u16, 0x4fa2_u16, StaticArray[0xaf_u8, 0x37_u8, 0x56_u8, 0xd4_u8, 0x71_u8, 0xfe_u8, 0x5a_u8, 0x3d_u8])
  GUID_SensorCategory_PersonalActivity = LibC::GUID.new(0xf1609081_u32, 0x1e12_u16, 0x412b_u16, StaticArray[0xa1_u8, 0x4d_u8, 0xcb_u8, 0xb0_u8, 0xe9_u8, 0x5b_u8, 0xd2_u8, 0xe5_u8])
  GUID_SensorCategory_Scanner = LibC::GUID.new(0xb000e77e_u32, 0xf5b5_u16, 0x420f_u16, StaticArray[0x81_u8, 0x5d_u8, 0x2_u8, 0x70_u8, 0xa7_u8, 0x26_u8, 0xf2_u8, 0x70_u8])
  GUID_SensorCategory_Unsupported = LibC::GUID.new(0x2beae7fa_u32, 0x19b0_u16, 0x48c5_u16, StaticArray[0xa1_u8, 0xf6_u8, 0xb5_u8, 0x48_u8, 0xd_u8, 0xc2_u8, 0x6_u8, 0xb0_u8])
  GUID_SensorType_Accelerometer3D = LibC::GUID.new(0xc2fb0f5f_u32, 0xe2d2_u16, 0x4c78_u16, StaticArray[0xbc_u8, 0xd0_u8, 0x35_u8, 0x2a_u8, 0x95_u8, 0x82_u8, 0x81_u8, 0x9d_u8])
  GUID_SensorType_ActivityDetection = LibC::GUID.new(0x9d9e0118_u32, 0x1807_u16, 0x4f2e_u16, StaticArray[0x96_u8, 0xe4_u8, 0x2c_u8, 0xe5_u8, 0x71_u8, 0x42_u8, 0xe1_u8, 0x96_u8])
  GUID_SensorType_AmbientLight = LibC::GUID.new(0x97f115c8_u32, 0x599a_u16, 0x4153_u16, StaticArray[0x88_u8, 0x94_u8, 0xd2_u8, 0xd1_u8, 0x28_u8, 0x99_u8, 0x91_u8, 0x8a_u8])
  GUID_SensorType_Barometer = LibC::GUID.new(0xe903829_u32, 0xff8a_u16, 0x4a93_u16, StaticArray[0x97_u8, 0xdf_u8, 0x3d_u8, 0xcb_u8, 0xde_u8, 0x40_u8, 0x22_u8, 0x88_u8])
  GUID_SensorType_Custom = LibC::GUID.new(0xe83af229_u32, 0x8640_u16, 0x4d18_u16, StaticArray[0xa2_u8, 0x13_u8, 0xe2_u8, 0x26_u8, 0x75_u8, 0xeb_u8, 0xb2_u8, 0xc3_u8])
  GUID_SensorType_FloorElevation = LibC::GUID.new(0xade4987f_u32, 0x7ac4_u16, 0x4dfa_u16, StaticArray[0x97_u8, 0x22_u8, 0xa_u8, 0x2_u8, 0x71_u8, 0x81_u8, 0xc7_u8, 0x47_u8])
  GUID_SensorType_GeomagneticOrientation = LibC::GUID.new(0xe77195f8_u32, 0x2d1f_u16, 0x4823_u16, StaticArray[0x97_u8, 0x1b_u8, 0x1c_u8, 0x44_u8, 0x67_u8, 0x55_u8, 0x6c_u8, 0x9d_u8])
  GUID_SensorType_GravityVector = LibC::GUID.new(0x3b52c73_u32, 0xbb76_u16, 0x463f_u16, StaticArray[0x95_u8, 0x24_u8, 0x38_u8, 0xde_u8, 0x76_u8, 0xeb_u8, 0x70_u8, 0xb_u8])
  GUID_SensorType_Gyrometer3D = LibC::GUID.new(0x9485f5a_u32, 0x759e_u16, 0x42c2_u16, StaticArray[0xbd_u8, 0x4b_u8, 0xa3_u8, 0x49_u8, 0xb7_u8, 0x5c_u8, 0x86_u8, 0x43_u8])
  GUID_SensorType_Humidity = LibC::GUID.new(0x5c72bf67_u32, 0xbd7e_u16, 0x4257_u16, StaticArray[0x99_u8, 0xb_u8, 0x98_u8, 0xa3_u8, 0xba_u8, 0x3b_u8, 0x40_u8, 0xa_u8])
  GUID_SensorType_LinearAccelerometer = LibC::GUID.new(0x38b0283_u32, 0x97b4_u16, 0x41c8_u16, StaticArray[0xbc_u8, 0x24_u8, 0x5f_u8, 0xf1_u8, 0xaa_u8, 0x48_u8, 0xfe_u8, 0xc7_u8])
  GUID_SensorType_Magnetometer3D = LibC::GUID.new(0x55e5effb_u32, 0x15c7_u16, 0x40df_u16, StaticArray[0x86_u8, 0x98_u8, 0xa8_u8, 0x4b_u8, 0x7c_u8, 0x86_u8, 0x3c_u8, 0x53_u8])
  GUID_SensorType_Orientation = LibC::GUID.new(0xcdb5d8f7_u32, 0x3cfd_u16, 0x41c8_u16, StaticArray[0x85_u8, 0x42_u8, 0xcc_u8, 0xe6_u8, 0x22_u8, 0xcf_u8, 0x5d_u8, 0x6e_u8])
  GUID_SensorType_Pedometer = LibC::GUID.new(0xb19f89af_u32, 0xe3eb_u16, 0x444b_u16, StaticArray[0x8d_u8, 0xea_u8, 0x20_u8, 0x25_u8, 0x75_u8, 0xa7_u8, 0x15_u8, 0x99_u8])
  GUID_SensorType_Proximity = LibC::GUID.new(0x5220dae9_u32, 0x3179_u16, 0x4430_u16, StaticArray[0x9f_u8, 0x90_u8, 0x6_u8, 0x26_u8, 0x6d_u8, 0x2a_u8, 0x34_u8, 0xde_u8])
  GUID_SensorType_RelativeOrientation = LibC::GUID.new(0x40993b51_u32, 0x4706_u16, 0x44dc_u16, StaticArray[0x98_u8, 0xd5_u8, 0xc9_u8, 0x20_u8, 0xc0_u8, 0x37_u8, 0xff_u8, 0xab_u8])
  GUID_SensorType_SimpleDeviceOrientation = LibC::GUID.new(0x86a19291_u32, 0x482_u16, 0x402c_u16, StaticArray[0xbf_u8, 0x4c_u8, 0xad_u8, 0xda_u8, 0xc5_u8, 0x2b_u8, 0x1c_u8, 0x39_u8])
  GUID_SensorType_Temperature = LibC::GUID.new(0x4fd0ec4_u32, 0xd5da_u16, 0x45fa_u16, StaticArray[0x95_u8, 0xa9_u8, 0x5d_u8, 0xb3_u8, 0x8e_u8, 0xe1_u8, 0x93_u8, 0x6_u8])
  GUID_SensorType_HingeAngle = LibC::GUID.new(0x82358065_u32, 0xf4c4_u16, 0x4da1_u16, StaticArray[0xb2_u8, 0x72_u8, 0x13_u8, 0xc2_u8, 0x33_u8, 0x32_u8, 0xa2_u8, 0x7_u8])
  SENSOR_PROPERTY_LIST_HEADER_SIZE = 8_u32

  CLSID_SensorManager = LibC::GUID.new(0x77a1c827_u32, 0xfcd2_u16, 0x4689_u16, StaticArray[0x89_u8, 0x15_u8, 0x9d_u8, 0x61_u8, 0x3c_u8, 0xc5_u8, 0xfa_u8, 0x3e_u8])

  CLSID_SensorCollection = LibC::GUID.new(0x79c43adb_u32, 0xa429_u16, 0x469f_u16, StaticArray[0xaa_u8, 0x39_u8, 0x2f_u8, 0x2b_u8, 0x74_u8, 0xb7_u8, 0x59_u8, 0x37_u8])

  CLSID_Sensor = LibC::GUID.new(0xe97ced00_u32, 0x523a_u16, 0x4133_u16, StaticArray[0xbf_u8, 0x6f_u8, 0xd3_u8, 0xa2_u8, 0xda_u8, 0xe7_u8, 0xf6_u8, 0xba_u8])

  CLSID_SensorDataReport = LibC::GUID.new(0x4ea9d6ef_u32, 0x694b_u16, 0x4218_u16, StaticArray[0x88_u8, 0x16_u8, 0xcc_u8, 0xda_u8, 0x8d_u8, 0xa7_u8, 0x4b_u8, 0xba_u8])

  enum SensorState
    SENSOR_STATE_MIN = 0_i32
    SENSOR_STATE_READY = 0_i32
    SENSOR_STATE_NOT_AVAILABLE = 1_i32
    SENSOR_STATE_NO_DATA = 2_i32
    SENSOR_STATE_INITIALIZING = 3_i32
    SENSOR_STATE_ACCESS_DENIED = 4_i32
    SENSOR_STATE_ERROR = 5_i32
    SENSOR_STATE_MAX = 5_i32
  end
  enum SensorConnectionType
    SENSOR_CONNECTION_TYPE_PC_INTEGRATED = 0_i32
    SENSOR_CONNECTION_TYPE_PC_ATTACHED = 1_i32
    SENSOR_CONNECTION_TYPE_PC_EXTERNAL = 2_i32
  end
  enum LOCATION_DESIRED_ACCURACY
    LOCATION_DESIRED_ACCURACY_DEFAULT = 0_i32
    LOCATION_DESIRED_ACCURACY_HIGH = 1_i32
  end
  enum LOCATION_POSITION_SOURCE
    LOCATION_POSITION_SOURCE_CELLULAR = 0_i32
    LOCATION_POSITION_SOURCE_SATELLITE = 1_i32
    LOCATION_POSITION_SOURCE_WIFI = 2_i32
    LOCATION_POSITION_SOURCE_IPADDRESS = 3_i32
    LOCATION_POSITION_SOURCE_UNKNOWN = 4_i32
  end
  enum SimpleDeviceOrientation
    SIMPLE_DEVICE_ORIENTATION_NOT_ROTATED = 0_i32
    SIMPLE_DEVICE_ORIENTATION_ROTATED_90 = 1_i32
    SIMPLE_DEVICE_ORIENTATION_ROTATED_180 = 2_i32
    SIMPLE_DEVICE_ORIENTATION_ROTATED_270 = 3_i32
    SIMPLE_DEVICE_ORIENTATION_ROTATED_FACE_UP = 4_i32
    SIMPLE_DEVICE_ORIENTATION_ROTATED_FACE_DOWN = 5_i32
  end
  enum MagnetometerAccuracy
    MAGNETOMETER_ACCURACY_UNKNOWN = 0_i32
    MAGNETOMETER_ACCURACY_UNRELIABLE = 1_i32
    MAGNETOMETER_ACCURACY_APPROXIMATE = 2_i32
    MAGNETOMETER_ACCURACY_HIGH = 3_i32
  end
  enum ACTIVITY_STATE_COUNT
    ActivityStateCount = 8_i32
  end
  enum ACTIVITY_STATE
    ActivityState_Unknown = 1_i32
    ActivityState_Stationary = 2_i32
    ActivityState_Fidgeting = 4_i32
    ActivityState_Walking = 8_i32
    ActivityState_Running = 16_i32
    ActivityState_InVehicle = 32_i32
    ActivityState_Biking = 64_i32
    ActivityState_Idle = 128_i32
    ActivityState_Max = 256_i32
    ActivityState_Force_Dword = -1_i32
  end
  enum ELEVATION_CHANGE_MODE
    ElevationChangeMode_Unknown = 0_i32
    ElevationChangeMode_Elevator = 1_i32
    ElevationChangeMode_Stepping = 2_i32
    ElevationChangeMode_Max = 3_i32
    ElevationChangeMode_Force_Dword = -1_i32
  end
  enum MAGNETOMETER_ACCURACY
    MagnetometerAccuracy_Unknown = 0_i32
    MagnetometerAccuracy_Unreliable = 1_i32
    MagnetometerAccuracy_Approximate = 2_i32
    MagnetometerAccuracy_High = 3_i32
  end
  enum PEDOMETER_STEP_TYPE_COUNT
    PedometerStepTypeCount = 3_i32
  end
  enum PEDOMETER_STEP_TYPE
    PedometerStepType_Unknown = 1_i32
    PedometerStepType_Walking = 2_i32
    PedometerStepType_Running = 4_i32
    PedometerStepType_Max = 8_i32
    PedometerStepType_Force_Dword = -1_i32
  end
  enum PROXIMITY_TYPE
    ProximityType_ObjectProximity = 0_i32
    ProximityType_HumanProximity = 1_i32
    ProximityType_Force_Dword = -1_i32
  end
  enum HUMAN_PRESENCE_DETECTION_TYPE_COUNT
    HumanPresenceDetectionTypeCount = 4_i32
  end
  enum HUMAN_PRESENCE_DETECTION_TYPE
    HumanPresenceDetectionType_Undefined = 0_i32
    HumanPresenceDetectionType_VendorDefinedNonBiometric = 1_i32
    HumanPresenceDetectionType_VendorDefinedBiometric = 2_i32
    HumanPresenceDetectionType_FacialBiometric = 4_i32
    HumanPresenceDetectionType_AudioBiometric = 8_i32
    HumanPresenceDetectionType_Force_Dword = -1_i32
  end
  enum PROXIMITY_SENSOR_CAPABILITIES
    Proximity_Sensor_Human_Presence_Capable = 1_i32
    Proximity_Sensor_Human_Engagement_Capable = 2_i32
    Proximity_Sensor_Human_Head_Azimuth_Capable = 4_i32
    Proximity_Sensor_Human_Head_Altitude_Capable = 8_i32
    Proximity_Sensor_Human_Head_Roll_Capable = 16_i32
    Proximity_Sensor_Human_Head_Pitch_Capable = 32_i32
    Proximity_Sensor_Human_Head_Yaw_Capable = 64_i32
    Proximity_Sensor_Human_Identification_Capable = 128_i32
    Proximity_Sensor_Multi_Person_Detection_Capable = 256_i32
    Proximity_Sensor_Supported_Capabilities = 511_i32
  end
  enum SIMPLE_DEVICE_ORIENTATION
    SimpleDeviceOrientation_NotRotated = 0_i32
    SimpleDeviceOrientation_Rotated90DegreesCounterclockwise = 1_i32
    SimpleDeviceOrientation_Rotated180DegreesCounterclockwise = 2_i32
    SimpleDeviceOrientation_Rotated270DegreesCounterclockwise = 3_i32
    SimpleDeviceOrientation_Faceup = 4_i32
    SimpleDeviceOrientation_Facedown = 5_i32
  end
  enum SENSOR_STATE
    SensorState_Initializing = 0_i32
    SensorState_Idle = 1_i32
    SensorState_Active = 2_i32
    SensorState_Error = 3_i32
  end
  enum SENSOR_CONNECTION_TYPES
    SensorConnectionType_Integrated = 0_i32
    SensorConnectionType_Attached = 1_i32
    SensorConnectionType_External = 2_i32
  end
  enum AXIS
    AXIS_X = 0_i32
    AXIS_Y = 1_i32
    AXIS_Z = 2_i32
    AXIS_MAX = 3_i32
  end

  @[Extern]
  struct SENSOR_VALUE_PAIR
    property key : Win32cr::Foundation::PROPERTYKEY
    property value : Win32cr::System::Com::StructuredStorage::PROPVARIANT
    def initialize(@key : Win32cr::Foundation::PROPERTYKEY, @value : Win32cr::System::Com::StructuredStorage::PROPVARIANT)
    end
  end

  @[Extern]
  struct SENSOR_COLLECTION_LIST
    property allocated_size_in_bytes : UInt32
    property count : UInt32
    property list : Win32cr::Devices::Sensors::SENSOR_VALUE_PAIR[1]
    def initialize(@allocated_size_in_bytes : UInt32, @count : UInt32, @list : Win32cr::Devices::Sensors::SENSOR_VALUE_PAIR[1])
    end
  end

  @[Extern]
  struct SENSOR_PROPERTY_LIST
    property allocated_size_in_bytes : UInt32
    property count : UInt32
    property list : Win32cr::Foundation::PROPERTYKEY[1]
    def initialize(@allocated_size_in_bytes : UInt32, @count : UInt32, @list : Win32cr::Foundation::PROPERTYKEY[1])
    end
  end

  @[Extern]
  struct VEC3D
    property x : Float32
    property y : Float32
    property z : Float32
    def initialize(@x : Float32, @y : Float32, @z : Float32)
    end
  end

  @[Extern]
  struct MATRIX3X3
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property anonymous1 : Anonymous1_e__Struct_
    property anonymous2 : Anonymous2_e__Struct_
    property m : Float32[9]

      # Nested Type Anonymous1_e__Struct_
      @[Extern]
      struct Anonymous1_e__Struct_
    property a11 : Float32
    property a12 : Float32
    property a13 : Float32
    property a21 : Float32
    property a22 : Float32
    property a23 : Float32
    property a31 : Float32
    property a32 : Float32
    property a33 : Float32
    def initialize(@a11 : Float32, @a12 : Float32, @a13 : Float32, @a21 : Float32, @a22 : Float32, @a23 : Float32, @a31 : Float32, @a32 : Float32, @a33 : Float32)
    end
      end


      # Nested Type Anonymous2_e__Struct_
      @[Extern]
      struct Anonymous2_e__Struct_
    property v1 : Win32cr::Devices::Sensors::VEC3D
    property v2 : Win32cr::Devices::Sensors::VEC3D
    property v3 : Win32cr::Devices::Sensors::VEC3D
    def initialize(@v1 : Win32cr::Devices::Sensors::VEC3D, @v2 : Win32cr::Devices::Sensors::VEC3D, @v3 : Win32cr::Devices::Sensors::VEC3D)
    end
      end

    def initialize(@anonymous1 : Anonymous1_e__Struct_, @anonymous2 : Anonymous2_e__Struct_, @m : Float32[9])
    end
    end

    def initialize(@anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct QUATERNION
    property x : Float32
    property y : Float32
    property z : Float32
    property w : Float32
    def initialize(@x : Float32, @y : Float32, @z : Float32, @w : Float32)
    end
  end

  @[Extern]

  record ISensorManagerVtable,
    query_interface : Proc(ISensorManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISensorManager*, UInt32),
    release : Proc(ISensorManager*, UInt32),
    get_sensors_by_category : Proc(ISensorManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_sensors_by_type : Proc(ISensorManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_sensor_by_id : Proc(ISensorManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    set_event_sink : Proc(ISensorManager*, Void*, Win32cr::Foundation::HRESULT),
    request_permissions : Proc(ISensorManager*, Win32cr::Foundation::HWND, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISensorManager, lpVtbl : ISensorManagerVtable* do
    GUID = LibC::GUID.new(0xbd77db67_u32, 0x45a8_u16, 0x42dc_u16, StaticArray[0x8d_u8, 0x0_u8, 0x6d_u8, 0xcf_u8, 0x15_u8, 0xf8_u8, 0x37_u8, 0x7a_u8])
    def query_interface(this : ISensorManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISensorManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISensorManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_sensors_by_category(this : ISensorManager*, sensorCategory : LibC::GUID*, ppSensorsFound : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sensors_by_category.call(this, sensorCategory, ppSensorsFound)
    end
    def get_sensors_by_type(this : ISensorManager*, sensorType : LibC::GUID*, ppSensorsFound : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sensors_by_type.call(this, sensorType, ppSensorsFound)
    end
    def get_sensor_by_id(this : ISensorManager*, sensorID : LibC::GUID*, ppSensor : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sensor_by_id.call(this, sensorID, ppSensor)
    end
    def set_event_sink(this : ISensorManager*, pEvents : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_event_sink.call(this, pEvents)
    end
    def request_permissions(this : ISensorManager*, hParent : Win32cr::Foundation::HWND, pSensors : Void*, fModal : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_permissions.call(this, hParent, pSensors, fModal)
    end

  end

  @[Extern]

  record ILocationPermissionsVtable,
    query_interface : Proc(ILocationPermissions*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ILocationPermissions*, UInt32),
    release : Proc(ILocationPermissions*, UInt32),
    get_global_location_permission : Proc(ILocationPermissions*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    check_location_capability : Proc(ILocationPermissions*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ILocationPermissions, lpVtbl : ILocationPermissionsVtable* do
    GUID = LibC::GUID.new(0xd5fb0a7f_u32, 0xe74e_u16, 0x44f5_u16, StaticArray[0x8e_u8, 0x2_u8, 0x48_u8, 0x6_u8, 0x86_u8, 0x3a_u8, 0x27_u8, 0x4f_u8])
    def query_interface(this : ILocationPermissions*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ILocationPermissions*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ILocationPermissions*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_global_location_permission(this : ILocationPermissions*, pfEnabled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_global_location_permission.call(this, pfEnabled)
    end
    def check_location_capability(this : ILocationPermissions*, dwClientThreadId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.check_location_capability.call(this, dwClientThreadId)
    end

  end

  @[Extern]

  record ISensorCollectionVtable,
    query_interface : Proc(ISensorCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISensorCollection*, UInt32),
    release : Proc(ISensorCollection*, UInt32),
    get_at : Proc(ISensorCollection*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_count : Proc(ISensorCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    add : Proc(ISensorCollection*, Void*, Win32cr::Foundation::HRESULT),
    remove : Proc(ISensorCollection*, Void*, Win32cr::Foundation::HRESULT),
    remove_by_id : Proc(ISensorCollection*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    clear : Proc(ISensorCollection*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISensorCollection, lpVtbl : ISensorCollectionVtable* do
    GUID = LibC::GUID.new(0x23571e11_u32, 0xe545_u16, 0x4dd8_u16, StaticArray[0xa3_u8, 0x37_u8, 0xb8_u8, 0x9b_u8, 0xf4_u8, 0x4b_u8, 0x10_u8, 0xdf_u8])
    def query_interface(this : ISensorCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISensorCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISensorCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_at(this : ISensorCollection*, ulIndex : UInt32, ppSensor : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_at.call(this, ulIndex, ppSensor)
    end
    def get_count(this : ISensorCollection*, pCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, pCount)
    end
    def add(this : ISensorCollection*, pSensor : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, pSensor)
    end
    def remove(this : ISensorCollection*, pSensor : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, pSensor)
    end
    def remove_by_id(this : ISensorCollection*, sensorID : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_by_id.call(this, sensorID)
    end
    def clear(this : ISensorCollection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear.call(this)
    end

  end

  @[Extern]

  record ISensorVtable,
    query_interface : Proc(ISensor*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISensor*, UInt32),
    release : Proc(ISensor*, UInt32),
    get_id : Proc(ISensor*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_category : Proc(ISensor*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_type : Proc(ISensor*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_friendly_name : Proc(ISensor*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_property : Proc(ISensor*, Win32cr::Foundation::PROPERTYKEY*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    get_properties : Proc(ISensor*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_supported_data_fields : Proc(ISensor*, Void**, Win32cr::Foundation::HRESULT),
    set_properties : Proc(ISensor*, Void*, Void**, Win32cr::Foundation::HRESULT),
    supports_data_field : Proc(ISensor*, Win32cr::Foundation::PROPERTYKEY*, Win32cr::Foundation::VARIANT_BOOL*, Win32cr::Foundation::HRESULT),
    get_state : Proc(ISensor*, Win32cr::Devices::Sensors::SensorState*, Win32cr::Foundation::HRESULT),
    get_data : Proc(ISensor*, Void**, Win32cr::Foundation::HRESULT),
    supports_event : Proc(ISensor*, LibC::GUID*, Win32cr::Foundation::VARIANT_BOOL*, Win32cr::Foundation::HRESULT),
    get_event_interest : Proc(ISensor*, LibC::GUID**, UInt32*, Win32cr::Foundation::HRESULT),
    set_event_interest : Proc(ISensor*, LibC::GUID*, UInt32, Win32cr::Foundation::HRESULT),
    set_event_sink : Proc(ISensor*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISensor, lpVtbl : ISensorVtable* do
    GUID = LibC::GUID.new(0x5fa08f80_u32, 0x2657_u16, 0x458e_u16, StaticArray[0xaf_u8, 0x75_u8, 0x46_u8, 0xf7_u8, 0x3f_u8, 0xa6_u8, 0xac_u8, 0x5c_u8])
    def query_interface(this : ISensor*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISensor*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISensor*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_id(this : ISensor*, pID : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_id.call(this, pID)
    end
    def get_category(this : ISensor*, pSensorCategory : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_category.call(this, pSensorCategory)
    end
    def get_type(this : ISensor*, pSensorType : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, pSensorType)
    end
    def get_friendly_name(this : ISensor*, pFriendlyName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_friendly_name.call(this, pFriendlyName)
    end
    def get_property(this : ISensor*, key : Win32cr::Foundation::PROPERTYKEY*, pProperty : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, key, pProperty)
    end
    def get_properties(this : ISensor*, pKeys : Void*, ppProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_properties.call(this, pKeys, ppProperties)
    end
    def get_supported_data_fields(this : ISensor*, ppDataFields : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_supported_data_fields.call(this, ppDataFields)
    end
    def set_properties(this : ISensor*, pProperties : Void*, ppResults : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_properties.call(this, pProperties, ppResults)
    end
    def supports_data_field(this : ISensor*, key : Win32cr::Foundation::PROPERTYKEY*, pIsSupported : Win32cr::Foundation::VARIANT_BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.supports_data_field.call(this, key, pIsSupported)
    end
    def get_state(this : ISensor*, pState : Win32cr::Devices::Sensors::SensorState*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_state.call(this, pState)
    end
    def get_data(this : ISensor*, ppDataReport : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_data.call(this, ppDataReport)
    end
    def supports_event(this : ISensor*, eventGuid : LibC::GUID*, pIsSupported : Win32cr::Foundation::VARIANT_BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.supports_event.call(this, eventGuid, pIsSupported)
    end
    def get_event_interest(this : ISensor*, ppValues : LibC::GUID**, pCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_interest.call(this, ppValues, pCount)
    end
    def set_event_interest(this : ISensor*, pValues : LibC::GUID*, count : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_event_interest.call(this, pValues, count)
    end
    def set_event_sink(this : ISensor*, pEvents : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_event_sink.call(this, pEvents)
    end

  end

  @[Extern]

  record ISensorDataReportVtable,
    query_interface : Proc(ISensorDataReport*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISensorDataReport*, UInt32),
    release : Proc(ISensorDataReport*, UInt32),
    get_timestamp : Proc(ISensorDataReport*, Win32cr::Foundation::SYSTEMTIME*, Win32cr::Foundation::HRESULT),
    get_sensor_value : Proc(ISensorDataReport*, Win32cr::Foundation::PROPERTYKEY*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    get_sensor_values : Proc(ISensorDataReport*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISensorDataReport, lpVtbl : ISensorDataReportVtable* do
    GUID = LibC::GUID.new(0xab9df9b_u32, 0xc4b5_u16, 0x4796_u16, StaticArray[0x88_u8, 0x98_u8, 0x4_u8, 0x70_u8, 0x70_u8, 0x6a_u8, 0x2e_u8, 0x1d_u8])
    def query_interface(this : ISensorDataReport*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISensorDataReport*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISensorDataReport*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_timestamp(this : ISensorDataReport*, pTimeStamp : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_timestamp.call(this, pTimeStamp)
    end
    def get_sensor_value(this : ISensorDataReport*, pKey : Win32cr::Foundation::PROPERTYKEY*, pValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sensor_value.call(this, pKey, pValue)
    end
    def get_sensor_values(this : ISensorDataReport*, pKeys : Void*, ppValues : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sensor_values.call(this, pKeys, ppValues)
    end

  end

  @[Extern]

  record ISensorManagerEventsVtable,
    query_interface : Proc(ISensorManagerEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISensorManagerEvents*, UInt32),
    release : Proc(ISensorManagerEvents*, UInt32),
    on_sensor_enter : Proc(ISensorManagerEvents*, Void*, Win32cr::Devices::Sensors::SensorState, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISensorManagerEvents, lpVtbl : ISensorManagerEventsVtable* do
    GUID = LibC::GUID.new(0x9b3b0b86_u32, 0x266a_u16, 0x4aad_u16, StaticArray[0xb2_u8, 0x1f_u8, 0xfd_u8, 0xe5_u8, 0x50_u8, 0x10_u8, 0x1_u8, 0xb7_u8])
    def query_interface(this : ISensorManagerEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISensorManagerEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISensorManagerEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_sensor_enter(this : ISensorManagerEvents*, pSensor : Void*, state : Win32cr::Devices::Sensors::SensorState) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_sensor_enter.call(this, pSensor, state)
    end

  end

  @[Extern]

  record ISensorEventsVtable,
    query_interface : Proc(ISensorEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISensorEvents*, UInt32),
    release : Proc(ISensorEvents*, UInt32),
    on_state_changed : Proc(ISensorEvents*, Void*, Win32cr::Devices::Sensors::SensorState, Win32cr::Foundation::HRESULT),
    on_data_updated : Proc(ISensorEvents*, Void*, Void*, Win32cr::Foundation::HRESULT),
    on_event : Proc(ISensorEvents*, Void*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    on_leave : Proc(ISensorEvents*, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISensorEvents, lpVtbl : ISensorEventsVtable* do
    GUID = LibC::GUID.new(0x5d8dcc91_u32, 0x4641_u16, 0x47e7_u16, StaticArray[0xb7_u8, 0xc3_u8, 0xb7_u8, 0x4f_u8, 0x48_u8, 0xa6_u8, 0xc3_u8, 0x91_u8])
    def query_interface(this : ISensorEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISensorEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISensorEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_state_changed(this : ISensorEvents*, pSensor : Void*, state : Win32cr::Devices::Sensors::SensorState) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_state_changed.call(this, pSensor, state)
    end
    def on_data_updated(this : ISensorEvents*, pSensor : Void*, pNewData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_data_updated.call(this, pSensor, pNewData)
    end
    def on_event(this : ISensorEvents*, pSensor : Void*, eventID : LibC::GUID*, pEventData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_event.call(this, pSensor, eventID, pEventData)
    end
    def on_leave(this : ISensorEvents*, id : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_leave.call(this, id)
    end

  end

  def getPerformanceTime(time_ms : UInt32*) : Win32cr::Foundation::NTSTATUS
    {% if !flag?(:docs) %}
    C.GetPerformanceTime(time_ms)
    {% end %}
  end

  def initPropVariantFromFloat(fltVal : Float32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.InitPropVariantFromFloat(fltVal, ppropvar)
    {% end %}
  end

  def propKeyFindKeyGetPropVariant(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::Foundation::PROPERTYKEY*, type_check : Win32cr::Foundation::BOOLEAN, pValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::NTSTATUS
    {% if !flag?(:docs) %}
    C.PropKeyFindKeyGetPropVariant(pList, pKey, type_check, pValue)
    {% end %}
  end

  def propKeyFindKeySetPropVariant(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::Foundation::PROPERTYKEY*, type_check : Win32cr::Foundation::BOOLEAN, pValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::NTSTATUS
    {% if !flag?(:docs) %}
    C.PropKeyFindKeySetPropVariant(pList, pKey, type_check, pValue)
    {% end %}
  end

  def propKeyFindKeyGetFileTime(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::Foundation::PROPERTYKEY*, pRetValue : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::NTSTATUS
    {% if !flag?(:docs) %}
    C.PropKeyFindKeyGetFileTime(pList, pKey, pRetValue)
    {% end %}
  end

  def propKeyFindKeyGetGuid(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::Foundation::PROPERTYKEY*, pRetValue : LibC::GUID*) : Win32cr::Foundation::NTSTATUS
    {% if !flag?(:docs) %}
    C.PropKeyFindKeyGetGuid(pList, pKey, pRetValue)
    {% end %}
  end

  def propKeyFindKeyGetBool(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::Foundation::PROPERTYKEY*, pRetValue : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::NTSTATUS
    {% if !flag?(:docs) %}
    C.PropKeyFindKeyGetBool(pList, pKey, pRetValue)
    {% end %}
  end

  def propKeyFindKeyGetUlong(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::Foundation::PROPERTYKEY*, pRetValue : UInt32*) : Win32cr::Foundation::NTSTATUS
    {% if !flag?(:docs) %}
    C.PropKeyFindKeyGetUlong(pList, pKey, pRetValue)
    {% end %}
  end

  def propKeyFindKeyGetUshort(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::Foundation::PROPERTYKEY*, pRetValue : UInt16*) : Win32cr::Foundation::NTSTATUS
    {% if !flag?(:docs) %}
    C.PropKeyFindKeyGetUshort(pList, pKey, pRetValue)
    {% end %}
  end

  def propKeyFindKeyGetFloat(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::Foundation::PROPERTYKEY*, pRetValue : Float32*) : Win32cr::Foundation::NTSTATUS
    {% if !flag?(:docs) %}
    C.PropKeyFindKeyGetFloat(pList, pKey, pRetValue)
    {% end %}
  end

  def propKeyFindKeyGetDouble(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::Foundation::PROPERTYKEY*, pRetValue : Float64*) : Win32cr::Foundation::NTSTATUS
    {% if !flag?(:docs) %}
    C.PropKeyFindKeyGetDouble(pList, pKey, pRetValue)
    {% end %}
  end

  def propKeyFindKeyGetInt32(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::Foundation::PROPERTYKEY*, pRetValue : Int32*) : Win32cr::Foundation::NTSTATUS
    {% if !flag?(:docs) %}
    C.PropKeyFindKeyGetInt32(pList, pKey, pRetValue)
    {% end %}
  end

  def propKeyFindKeyGetInt64(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::Foundation::PROPERTYKEY*, pRetValue : Int64*) : Win32cr::Foundation::NTSTATUS
    {% if !flag?(:docs) %}
    C.PropKeyFindKeyGetInt64(pList, pKey, pRetValue)
    {% end %}
  end

  def propKeyFindKeyGetNthUlong(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::Foundation::PROPERTYKEY*, occurrence : UInt32, pRetValue : UInt32*) : Win32cr::Foundation::NTSTATUS
    {% if !flag?(:docs) %}
    C.PropKeyFindKeyGetNthUlong(pList, pKey, occurrence, pRetValue)
    {% end %}
  end

  def propKeyFindKeyGetNthUshort(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::Foundation::PROPERTYKEY*, occurrence : UInt32, pRetValue : UInt16*) : Win32cr::Foundation::NTSTATUS
    {% if !flag?(:docs) %}
    C.PropKeyFindKeyGetNthUshort(pList, pKey, occurrence, pRetValue)
    {% end %}
  end

  def propKeyFindKeyGetNthInt64(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::Foundation::PROPERTYKEY*, occurrence : UInt32, pRetValue : Int64*) : Win32cr::Foundation::NTSTATUS
    {% if !flag?(:docs) %}
    C.PropKeyFindKeyGetNthInt64(pList, pKey, occurrence, pRetValue)
    {% end %}
  end

  def isKeyPresentInPropertyList(pList : Win32cr::Devices::Sensors::SENSOR_PROPERTY_LIST*, pKey : Win32cr::Foundation::PROPERTYKEY*) : Win32cr::Foundation::BOOLEAN
    {% if !flag?(:docs) %}
    C.IsKeyPresentInPropertyList(pList, pKey)
    {% end %}
  end

  def isKeyPresentInCollectionList(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::Foundation::PROPERTYKEY*) : Win32cr::Foundation::BOOLEAN
    {% if !flag?(:docs) %}
    C.IsKeyPresentInCollectionList(pList, pKey)
    {% end %}
  end

  def isCollectionListSame(list_a : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, list_b : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*) : Win32cr::Foundation::BOOLEAN
    {% if !flag?(:docs) %}
    C.IsCollectionListSame(list_a, list_b)
    {% end %}
  end

  def propVariantGetInformation(prop_variant_value : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, prop_variant_offset : UInt32*, prop_variant_size : UInt32*, prop_variant_pointer : Void**, remapped_type : Win32cr::Devices::Properties::DEVPROPTYPE*) : Win32cr::Foundation::NTSTATUS
    {% if !flag?(:docs) %}
    C.PropVariantGetInformation(prop_variant_value, prop_variant_offset, prop_variant_size, prop_variant_pointer, remapped_type)
    {% end %}
  end

  def propertiesListCopy(target : Win32cr::Devices::Sensors::SENSOR_PROPERTY_LIST*, source : Win32cr::Devices::Sensors::SENSOR_PROPERTY_LIST*) : Win32cr::Foundation::NTSTATUS
    {% if !flag?(:docs) %}
    C.PropertiesListCopy(target, source)
    {% end %}
  end

  def propertiesListGetFillableCount(buffer_size_bytes : UInt32) : UInt32
    {% if !flag?(:docs) %}
    C.PropertiesListGetFillableCount(buffer_size_bytes)
    {% end %}
  end

  def collectionsListGetMarshalledSize(collection : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*) : UInt32
    {% if !flag?(:docs) %}
    C.CollectionsListGetMarshalledSize(collection)
    {% end %}
  end

  def collectionsListCopyAndMarshall(target : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, source : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*) : Win32cr::Foundation::NTSTATUS
    {% if !flag?(:docs) %}
    C.CollectionsListCopyAndMarshall(target, source)
    {% end %}
  end

  def collectionsListMarshall(target : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*) : Win32cr::Foundation::NTSTATUS
    {% if !flag?(:docs) %}
    C.CollectionsListMarshall(target)
    {% end %}
  end

  def collectionsListGetMarshalledSizeWithoutSerialization(collection : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*) : UInt32
    {% if !flag?(:docs) %}
    C.CollectionsListGetMarshalledSizeWithoutSerialization(collection)
    {% end %}
  end

  def collectionsListUpdateMarshalledPointer(collection : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*) : Win32cr::Foundation::NTSTATUS
    {% if !flag?(:docs) %}
    C.CollectionsListUpdateMarshalledPointer(collection)
    {% end %}
  end

  def serializationBufferAllocate(size_in_bytes : UInt32, pBuffer : UInt8**) : Win32cr::Foundation::NTSTATUS
    {% if !flag?(:docs) %}
    C.SerializationBufferAllocate(size_in_bytes, pBuffer)
    {% end %}
  end

  def serializationBufferFree(buffer : UInt8*) : Void
    {% if !flag?(:docs) %}
    C.SerializationBufferFree(buffer)
    {% end %}
  end

  def collectionsListGetSerializedSize(collection : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*) : UInt32
    {% if !flag?(:docs) %}
    C.CollectionsListGetSerializedSize(collection)
    {% end %}
  end

  def collectionsListSerializeToBuffer(source_collection : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, target_buffer_size_in_bytes : UInt32, target_buffer : UInt8*) : Win32cr::Foundation::NTSTATUS
    {% if !flag?(:docs) %}
    C.CollectionsListSerializeToBuffer(source_collection, target_buffer_size_in_bytes, target_buffer)
    {% end %}
  end

  def collectionsListAllocateBufferAndSerialize(source_collection : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pTargetBufferSizeInBytes : UInt32*, pTargetBuffer : UInt8**) : Win32cr::Foundation::NTSTATUS
    {% if !flag?(:docs) %}
    C.CollectionsListAllocateBufferAndSerialize(source_collection, pTargetBufferSizeInBytes, pTargetBuffer)
    {% end %}
  end

  def collectionsListDeserializeFromBuffer(source_buffer_size_in_bytes : UInt32, source_buffer : UInt8*, target_collection : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*) : Win32cr::Foundation::NTSTATUS
    {% if !flag?(:docs) %}
    C.CollectionsListDeserializeFromBuffer(source_buffer_size_in_bytes, source_buffer, target_collection)
    {% end %}
  end

  def sensorCollectionGetAt(index : UInt32, pSensorsList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::Foundation::PROPERTYKEY*, pValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::NTSTATUS
    {% if !flag?(:docs) %}
    C.SensorCollectionGetAt(index, pSensorsList, pKey, pValue)
    {% end %}
  end

  def collectionsListGetFillableCount(buffer_size_bytes : UInt32) : UInt32
    {% if !flag?(:docs) %}
    C.CollectionsListGetFillableCount(buffer_size_bytes)
    {% end %}
  end

  def evaluateActivityThresholds(newSample : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, oldSample : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, thresholds : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*) : Win32cr::Foundation::BOOLEAN
    {% if !flag?(:docs) %}
    C.EvaluateActivityThresholds(newSample, oldSample, thresholds)
    {% end %}
  end

  def collectionsListSortSubscribedActivitiesByConfidence(thresholds : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pCollection : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*) : Win32cr::Foundation::NTSTATUS
    {% if !flag?(:docs) %}
    C.CollectionsListSortSubscribedActivitiesByConfidence(thresholds, pCollection)
    {% end %}
  end

  def initPropVariantFromCLSIDArray(members : LibC::GUID*, size : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.InitPropVariantFromCLSIDArray(members, size, ppropvar)
    {% end %}
  end

  def isSensorSubscribed(subscriptionList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, currentType : LibC::GUID) : Win32cr::Foundation::BOOLEAN
    {% if !flag?(:docs) %}
    C.IsSensorSubscribed(subscriptionList, currentType)
    {% end %}
  end

  def isGUIDPresentInList(guidArray : LibC::GUID*, arrayLength : UInt32, guidElem : LibC::GUID*) : Win32cr::Foundation::BOOLEAN
    {% if !flag?(:docs) %}
    C.IsGUIDPresentInList(guidArray, arrayLength, guidElem)
    {% end %}
  end

  @[Link("sensorsutilsv2")]
  {% if !flag?(:docs) %}
  lib C
    # :nodoc:
    fun GetPerformanceTime(time_ms : UInt32*) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun InitPropVariantFromFloat(fltVal : Float32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PropKeyFindKeyGetPropVariant(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::Foundation::PROPERTYKEY*, type_check : Win32cr::Foundation::BOOLEAN, pValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun PropKeyFindKeySetPropVariant(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::Foundation::PROPERTYKEY*, type_check : Win32cr::Foundation::BOOLEAN, pValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun PropKeyFindKeyGetFileTime(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::Foundation::PROPERTYKEY*, pRetValue : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun PropKeyFindKeyGetGuid(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::Foundation::PROPERTYKEY*, pRetValue : LibC::GUID*) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun PropKeyFindKeyGetBool(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::Foundation::PROPERTYKEY*, pRetValue : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun PropKeyFindKeyGetUlong(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::Foundation::PROPERTYKEY*, pRetValue : UInt32*) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun PropKeyFindKeyGetUshort(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::Foundation::PROPERTYKEY*, pRetValue : UInt16*) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun PropKeyFindKeyGetFloat(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::Foundation::PROPERTYKEY*, pRetValue : Float32*) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun PropKeyFindKeyGetDouble(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::Foundation::PROPERTYKEY*, pRetValue : Float64*) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun PropKeyFindKeyGetInt32(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::Foundation::PROPERTYKEY*, pRetValue : Int32*) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun PropKeyFindKeyGetInt64(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::Foundation::PROPERTYKEY*, pRetValue : Int64*) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun PropKeyFindKeyGetNthUlong(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::Foundation::PROPERTYKEY*, occurrence : UInt32, pRetValue : UInt32*) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun PropKeyFindKeyGetNthUshort(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::Foundation::PROPERTYKEY*, occurrence : UInt32, pRetValue : UInt16*) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun PropKeyFindKeyGetNthInt64(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::Foundation::PROPERTYKEY*, occurrence : UInt32, pRetValue : Int64*) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun IsKeyPresentInPropertyList(pList : Win32cr::Devices::Sensors::SENSOR_PROPERTY_LIST*, pKey : Win32cr::Foundation::PROPERTYKEY*) : Win32cr::Foundation::BOOLEAN

    # :nodoc:
    fun IsKeyPresentInCollectionList(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::Foundation::PROPERTYKEY*) : Win32cr::Foundation::BOOLEAN

    # :nodoc:
    fun IsCollectionListSame(list_a : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, list_b : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*) : Win32cr::Foundation::BOOLEAN

    # :nodoc:
    fun PropVariantGetInformation(prop_variant_value : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, prop_variant_offset : UInt32*, prop_variant_size : UInt32*, prop_variant_pointer : Void**, remapped_type : Win32cr::Devices::Properties::DEVPROPTYPE*) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun PropertiesListCopy(target : Win32cr::Devices::Sensors::SENSOR_PROPERTY_LIST*, source : Win32cr::Devices::Sensors::SENSOR_PROPERTY_LIST*) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun PropertiesListGetFillableCount(buffer_size_bytes : UInt32) : UInt32

    # :nodoc:
    fun CollectionsListGetMarshalledSize(collection : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*) : UInt32

    # :nodoc:
    fun CollectionsListCopyAndMarshall(target : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, source : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun CollectionsListMarshall(target : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun CollectionsListGetMarshalledSizeWithoutSerialization(collection : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*) : UInt32

    # :nodoc:
    fun CollectionsListUpdateMarshalledPointer(collection : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun SerializationBufferAllocate(size_in_bytes : UInt32, pBuffer : UInt8**) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun SerializationBufferFree(buffer : UInt8*) : Void

    # :nodoc:
    fun CollectionsListGetSerializedSize(collection : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*) : UInt32

    # :nodoc:
    fun CollectionsListSerializeToBuffer(source_collection : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, target_buffer_size_in_bytes : UInt32, target_buffer : UInt8*) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun CollectionsListAllocateBufferAndSerialize(source_collection : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pTargetBufferSizeInBytes : UInt32*, pTargetBuffer : UInt8**) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun CollectionsListDeserializeFromBuffer(source_buffer_size_in_bytes : UInt32, source_buffer : UInt8*, target_collection : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun SensorCollectionGetAt(index : UInt32, pSensorsList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::Foundation::PROPERTYKEY*, pValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun CollectionsListGetFillableCount(buffer_size_bytes : UInt32) : UInt32

    # :nodoc:
    fun EvaluateActivityThresholds(newSample : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, oldSample : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, thresholds : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*) : Win32cr::Foundation::BOOLEAN

    # :nodoc:
    fun CollectionsListSortSubscribedActivitiesByConfidence(thresholds : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pCollection : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun InitPropVariantFromCLSIDArray(members : LibC::GUID*, size : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun IsSensorSubscribed(subscriptionList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, currentType : LibC::GUID) : Win32cr::Foundation::BOOLEAN

    # :nodoc:
    fun IsGUIDPresentInList(guidArray : LibC::GUID*, arrayLength : UInt32, guidElem : LibC::GUID*) : Win32cr::Foundation::BOOLEAN

  end
  {% end %}
end