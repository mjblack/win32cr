require "./../system/com.cr"
require "./../foundation.cr"
require "./../ui/shell/properties_system.cr"
require "./../system/com/structured_storage.cr"
require "./portable_devices.cr"

module Win32cr::Devices::Sensors
  GUID_DEVINTERFACE_SENSOR = "ba1bb692-9b7a-4833-9a1e-525ed134e7e2"
  SENSOR_EVENT_STATE_CHANGED = "bfd96016-6bd7-4560-ad34-f2f6607e8f81"
  SENSOR_EVENT_DATA_UPDATED = "2ed0f2a4-0087-41d3-87db-6773370b3c88"
  SENSOR_EVENT_PROPERTY_CHANGED = "2358f099-84c9-4d3d-90df-c2421e2b2045"
  SENSOR_EVENT_ACCELEROMETER_SHAKE = "825f5a94-0f48-4396-9ca0-6ecb5c99d915"
  SENSOR_EVENT_PARAMETER_COMMON_GUID = "64346e30-8728-4b34-bdf6-4f52442c5c28"
  SENSOR_EVENT_PARAMETER_EVENT_ID = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64346e30_u32, 0x8728_u16, 0x4b34_u16, StaticArray[0xbd_u8, 0xf6_u8, 0x4f_u8, 0x52_u8, 0x44_u8, 0x2c_u8, 0x5c_u8, 0x28_u8]), 2_u32)
  SENSOR_EVENT_PARAMETER_STATE = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x64346e30_u32, 0x8728_u16, 0x4b34_u16, StaticArray[0xbd_u8, 0xf6_u8, 0x4f_u8, 0x52_u8, 0x44_u8, 0x2c_u8, 0x5c_u8, 0x28_u8]), 3_u32)
  SENSOR_ERROR_PARAMETER_COMMON_GUID = "77112bcd-fce1-4f43-b8b8-a88256adb4b3"
  SENSOR_PROPERTY_COMMON_GUID = "7f8383ec-d3ec-495c-a8cf-b8bbe85c2920"
  SENSOR_PROPERTY_TYPE = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 2_u32)
  SENSOR_PROPERTY_STATE = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 3_u32)
  SENSOR_PROPERTY_PERSISTENT_UNIQUE_ID = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 5_u32)
  SENSOR_PROPERTY_MANUFACTURER = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 6_u32)
  SENSOR_PROPERTY_MODEL = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 7_u32)
  SENSOR_PROPERTY_SERIAL_NUMBER = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 8_u32)
  SENSOR_PROPERTY_FRIENDLY_NAME = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 9_u32)
  SENSOR_PROPERTY_DESCRIPTION = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 10_u32)
  SENSOR_PROPERTY_CONNECTION_TYPE = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 11_u32)
  SENSOR_PROPERTY_MIN_REPORT_INTERVAL = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 12_u32)
  SENSOR_PROPERTY_CURRENT_REPORT_INTERVAL = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 13_u32)
  SENSOR_PROPERTY_CHANGE_SENSITIVITY = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 14_u32)
  SENSOR_PROPERTY_DEVICE_PATH = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 15_u32)
  SENSOR_PROPERTY_LIGHT_RESPONSE_CURVE = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 16_u32)
  SENSOR_PROPERTY_ACCURACY = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 17_u32)
  SENSOR_PROPERTY_RESOLUTION = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 18_u32)
  SENSOR_PROPERTY_LOCATION_DESIRED_ACCURACY = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 19_u32)
  SENSOR_PROPERTY_RANGE_MINIMUM = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 20_u32)
  SENSOR_PROPERTY_RANGE_MAXIMUM = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 21_u32)
  SENSOR_PROPERTY_HID_USAGE = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 22_u32)
  SENSOR_PROPERTY_RADIO_STATE = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 23_u32)
  SENSOR_PROPERTY_RADIO_STATE_PREVIOUS = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x7f8383ec_u32, 0xd3ec_u16, 0x495c_u16, StaticArray[0xa8_u8, 0xcf_u8, 0xb8_u8, 0xbb_u8, 0xe8_u8, 0x5c_u8, 0x29_u8, 0x20_u8]), 24_u32)
  SENSOR_CATEGORY_ALL = "c317c286-c468-4288-9975-d4c4587c442c"
  SENSOR_CATEGORY_LOCATION = "bfa794e4-f964-4fdb-90f6-51056bfe4b44"
  SENSOR_CATEGORY_ENVIRONMENTAL = "323439aa-7f66-492b-ba0c-73e9aa0a65d5"
  SENSOR_CATEGORY_MOTION = "cd09daf1-3b2e-4c3d-b598-b5e5ff93fd46"
  SENSOR_CATEGORY_ORIENTATION = "9e6c04b6-96fe-4954-b726-68682a473f69"
  SENSOR_CATEGORY_MECHANICAL = "8d131d68-8ef7-4656-80b5-cccbd93791c5"
  SENSOR_CATEGORY_ELECTRICAL = "fb73fcd8-fc4a-483c-ac58-27b691c6beff"
  SENSOR_CATEGORY_BIOMETRIC = "ca19690f-a2c7-477d-a99e-99ec6e2b5648"
  SENSOR_CATEGORY_LIGHT = "17a665c0-9063-4216-b202-5c7a255e18ce"
  SENSOR_CATEGORY_SCANNER = "b000e77e-f5b5-420f-815d-0270a726f270"
  SENSOR_CATEGORY_OTHER = "2c90e7a9-f4c9-4fa2-af37-56d471fe5a3d"
  SENSOR_CATEGORY_UNSUPPORTED = "2beae7fa-19b0-48c5-a1f6-b5480dc206b0"
  SENSOR_TYPE_LOCATION_GPS = "ed4ca589-327a-4ff9-a560-91da4b48275e"
  SENSOR_TYPE_LOCATION_STATIC = "095f8184-0fa9-4445-8e6e-b70f320b6b4c"
  SENSOR_TYPE_LOCATION_LOOKUP = "3b2eae4a-72ce-436d-96d2-3c5b8570e987"
  SENSOR_TYPE_LOCATION_TRIANGULATION = "691c341a-5406-4fe1-942f-2246cbeb39e0"
  SENSOR_TYPE_LOCATION_OTHER = "9b2d0566-0368-4f71-b88d-533f132031de"
  SENSOR_TYPE_LOCATION_BROADCAST = "d26988cf-5162-4039-bb17-4c58b698e44a"
  SENSOR_TYPE_LOCATION_DEAD_RECKONING = "1a37d538-f28b-42da-9fce-a9d0a2a6d829"
  SENSOR_TYPE_ENVIRONMENTAL_TEMPERATURE = "04fd0ec4-d5da-45fa-95a9-5db38ee19306"
  SENSOR_TYPE_ENVIRONMENTAL_ATMOSPHERIC_PRESSURE = "0e903829-ff8a-4a93-97df-3dcbde402288"
  SENSOR_TYPE_ENVIRONMENTAL_HUMIDITY = "5c72bf67-bd7e-4257-990b-98a3ba3b400a"
  SENSOR_TYPE_ENVIRONMENTAL_WIND_SPEED = "dd50607b-a45f-42cd-8efd-ec61761c4226"
  SENSOR_TYPE_ENVIRONMENTAL_WIND_DIRECTION = "9ef57a35-9306-434d-af09-37fa5a9c00bd"
  SENSOR_TYPE_ACCELEROMETER_1D = "c04d2387-7340-4cc2-991e-3b18cb8ef2f4"
  SENSOR_TYPE_ACCELEROMETER_2D = "b2c517a8-f6b5-4ba6-a423-5df560b4cc07"
  SENSOR_TYPE_ACCELEROMETER_3D = "c2fb0f5f-e2d2-4c78-bcd0-352a9582819d"
  SENSOR_TYPE_MOTION_DETECTOR = "5c7c1a12-30a5-43b9-a4b2-cf09ec5b7be8"
  SENSOR_TYPE_GYROMETER_1D = "fa088734-f552-4584-8324-edfaf649652c"
  SENSOR_TYPE_GYROMETER_2D = "31ef4f83-919b-48bf-8de0-5d7a9d240556"
  SENSOR_TYPE_GYROMETER_3D = "09485f5a-759e-42c2-bd4b-a349b75c8643"
  SENSOR_TYPE_SPEEDOMETER = "6bd73c1f-0bb4-4310-81b2-dfc18a52bf94"
  SENSOR_TYPE_COMPASS_1D = "a415f6c5-cb50-49d0-8e62-a8270bd7a26c"
  SENSOR_TYPE_COMPASS_2D = "15655cc0-997a-4d30-84db-57caba3648bb"
  SENSOR_TYPE_COMPASS_3D = "76b5ce0d-17dd-414d-93a1-e127f40bdf6e"
  SENSOR_TYPE_INCLINOMETER_1D = "b96f98c5-7a75-4ba7-94e9-ac868c966dd8"
  SENSOR_TYPE_INCLINOMETER_2D = "ab140f6d-83eb-4264-b70b-b16a5b256a01"
  SENSOR_TYPE_INCLINOMETER_3D = "b84919fb-ea85-4976-8444-6f6f5c6d31db"
  SENSOR_TYPE_DISTANCE_1D = "5f14ab2f-1407-4306-a93f-b1dbabe4f9c0"
  SENSOR_TYPE_DISTANCE_2D = "5cf9a46c-a9a2-4e55-b6a1-a04aafa95a92"
  SENSOR_TYPE_DISTANCE_3D = "a20cae31-0e25-4772-9fe5-96608a1354b2"
  SENSOR_TYPE_AGGREGATED_QUADRANT_ORIENTATION = "9f81f1af-c4ab-4307-9904-c828bfb90829"
  SENSOR_TYPE_AGGREGATED_DEVICE_ORIENTATION = "cdb5d8f7-3cfd-41c8-8542-cce622cf5d6e"
  SENSOR_TYPE_AGGREGATED_SIMPLE_DEVICE_ORIENTATION = "86a19291-0482-402c-bf4c-addac52b1c39"
  SENSOR_TYPE_VOLTAGE = "c5484637-4fb7-4953-98b8-a56d8aa1fb1e"
  SENSOR_TYPE_CURRENT = "5adc9fce-15a0-4bbe-a1ad-2d38a9ae831c"
  SENSOR_TYPE_CAPACITANCE = "ca2ffb1c-2317-49c0-a0b4-b63ce63461a0"
  SENSOR_TYPE_RESISTANCE = "9993d2c8-c157-4a52-a7b5-195c76037231"
  SENSOR_TYPE_INDUCTANCE = "dc1d933f-c435-4c7d-a2fe-607192a524d3"
  SENSOR_TYPE_ELECTRICAL_POWER = "212f10f5-14ab-4376-9a43-a7794098c2fe"
  SENSOR_TYPE_POTENTIOMETER = "2b3681a9-cadc-45aa-a6ff-54957c8bb440"
  SENSOR_TYPE_FREQUENCY = "8cd2cbb6-73e6-4640-a709-72ae8fb60d7f"
  SENSOR_TYPE_BOOLEAN_SWITCH = "9c7e371f-1041-460b-8d5c-71e4752e350c"
  SENSOR_TYPE_MULTIVALUE_SWITCH = "b3ee4d76-37a4-4402-b25e-99c60a775fa1"
  SENSOR_TYPE_FORCE = "c2ab2b02-1a1c-4778-a81b-954a1788cc75"
  SENSOR_TYPE_SCALE = "c06dd92c-7feb-438e-9bf6-82207fff5bb8"
  SENSOR_TYPE_PRESSURE = "26d31f34-6352-41cf-b793-ea0713d53d77"
  SENSOR_TYPE_STRAIN = "c6d1ec0e-6803-4361-ad3d-85bcc58c6d29"
  SENSOR_TYPE_BOOLEAN_SWITCH_ARRAY = "545c8ba5-b143-4545-868f-ca7fd986b4f6"
  SENSOR_TYPE_HUMAN_PRESENCE = "c138c12b-ad52-451c-9375-87f518ff10c6"
  SENSOR_TYPE_HUMAN_PROXIMITY = "5220dae9-3179-4430-9f90-06266d2a34de"
  SENSOR_TYPE_TOUCH = "17db3018-06c4-4f7d-81af-9274b7599c27"
  SENSOR_TYPE_AMBIENT_LIGHT = "97f115c8-599a-4153-8894-d2d12899918a"
  SENSOR_TYPE_RFID_SCANNER = "44328ef5-02dd-4e8d-ad5d-9249832b2eca"
  SENSOR_TYPE_BARCODE_SCANNER = "990b3d8f-85bb-45ff-914d-998c04f372df"
  SENSOR_TYPE_CUSTOM = "e83af229-8640-4d18-a213-e22675ebb2c3"
  SENSOR_TYPE_UNKNOWN = "10ba83e3-ef4f-41ed-9885-a87d6435a8e1"
  SENSOR_DATA_TYPE_COMMON_GUID = "db5e0cf2-cf1f-4c18-b46c-d86011d62150"
  SENSOR_DATA_TYPE_TIMESTAMP = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xdb5e0cf2_u32, 0xcf1f_u16, 0x4c18_u16, StaticArray[0xb4_u8, 0x6c_u8, 0xd8_u8, 0x60_u8, 0x11_u8, 0xd6_u8, 0x21_u8, 0x50_u8]), 2_u32)
  SENSOR_DATA_TYPE_LOCATION_GUID = "055c74d8-ca6f-47d6-95c6-1ed3637a0ff4"
  SENSOR_DATA_TYPE_LATITUDE_DEGREES = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 2_u32)
  SENSOR_DATA_TYPE_LONGITUDE_DEGREES = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 3_u32)
  SENSOR_DATA_TYPE_ALTITUDE_SEALEVEL_METERS = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 4_u32)
  SENSOR_DATA_TYPE_ALTITUDE_ELLIPSOID_METERS = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 5_u32)
  SENSOR_DATA_TYPE_SPEED_KNOTS = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 6_u32)
  SENSOR_DATA_TYPE_TRUE_HEADING_DEGREES = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 7_u32)
  SENSOR_DATA_TYPE_MAGNETIC_HEADING_DEGREES = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 8_u32)
  SENSOR_DATA_TYPE_MAGNETIC_VARIATION = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 9_u32)
  SENSOR_DATA_TYPE_FIX_QUALITY = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 10_u32)
  SENSOR_DATA_TYPE_FIX_TYPE = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 11_u32)
  SENSOR_DATA_TYPE_POSITION_DILUTION_OF_PRECISION = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 12_u32)
  SENSOR_DATA_TYPE_HORIZONAL_DILUTION_OF_PRECISION = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 13_u32)
  SENSOR_DATA_TYPE_VERTICAL_DILUTION_OF_PRECISION = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 14_u32)
  SENSOR_DATA_TYPE_SATELLITES_USED_COUNT = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 15_u32)
  SENSOR_DATA_TYPE_SATELLITES_USED_PRNS = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 16_u32)
  SENSOR_DATA_TYPE_SATELLITES_IN_VIEW = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 17_u32)
  SENSOR_DATA_TYPE_SATELLITES_IN_VIEW_PRNS = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 18_u32)
  SENSOR_DATA_TYPE_SATELLITES_IN_VIEW_ELEVATION = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 19_u32)
  SENSOR_DATA_TYPE_SATELLITES_IN_VIEW_AZIMUTH = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 20_u32)
  SENSOR_DATA_TYPE_SATELLITES_IN_VIEW_STN_RATIO = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 21_u32)
  SENSOR_DATA_TYPE_ERROR_RADIUS_METERS = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 22_u32)
  SENSOR_DATA_TYPE_ADDRESS1 = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 23_u32)
  SENSOR_DATA_TYPE_ADDRESS2 = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 24_u32)
  SENSOR_DATA_TYPE_CITY = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 25_u32)
  SENSOR_DATA_TYPE_STATE_PROVINCE = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 26_u32)
  SENSOR_DATA_TYPE_POSTALCODE = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 27_u32)
  SENSOR_DATA_TYPE_COUNTRY_REGION = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 28_u32)
  SENSOR_DATA_TYPE_ALTITUDE_ELLIPSOID_ERROR_METERS = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 29_u32)
  SENSOR_DATA_TYPE_ALTITUDE_SEALEVEL_ERROR_METERS = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 30_u32)
  SENSOR_DATA_TYPE_GPS_SELECTION_MODE = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 31_u32)
  SENSOR_DATA_TYPE_GPS_OPERATION_MODE = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 32_u32)
  SENSOR_DATA_TYPE_GPS_STATUS = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 33_u32)
  SENSOR_DATA_TYPE_GEOIDAL_SEPARATION = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 34_u32)
  SENSOR_DATA_TYPE_DGPS_DATA_AGE = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 35_u32)
  SENSOR_DATA_TYPE_ALTITUDE_ANTENNA_SEALEVEL_METERS = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 36_u32)
  SENSOR_DATA_TYPE_DIFFERENTIAL_REFERENCE_STATION_ID = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 37_u32)
  SENSOR_DATA_TYPE_NMEA_SENTENCE = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 38_u32)
  SENSOR_DATA_TYPE_SATELLITES_IN_VIEW_ID = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 39_u32)
  SENSOR_DATA_TYPE_LOCATION_SOURCE = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 40_u32)
  SENSOR_DATA_TYPE_SATELLITES_USED_PRNS_AND_CONSTELLATIONS = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x55c74d8_u32, 0xca6f_u16, 0x47d6_u16, StaticArray[0x95_u8, 0xc6_u8, 0x1e_u8, 0xd3_u8, 0x63_u8, 0x7a_u8, 0xf_u8, 0xf4_u8]), 41_u32)
  SENSOR_DATA_TYPE_ENVIRONMENTAL_GUID = "8b0aa2f1-2d57-42ee-8cc0-4d27622b46c4"
  SENSOR_DATA_TYPE_TEMPERATURE_CELSIUS = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8b0aa2f1_u32, 0x2d57_u16, 0x42ee_u16, StaticArray[0x8c_u8, 0xc0_u8, 0x4d_u8, 0x27_u8, 0x62_u8, 0x2b_u8, 0x46_u8, 0xc4_u8]), 2_u32)
  SENSOR_DATA_TYPE_RELATIVE_HUMIDITY_PERCENT = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8b0aa2f1_u32, 0x2d57_u16, 0x42ee_u16, StaticArray[0x8c_u8, 0xc0_u8, 0x4d_u8, 0x27_u8, 0x62_u8, 0x2b_u8, 0x46_u8, 0xc4_u8]), 3_u32)
  SENSOR_DATA_TYPE_ATMOSPHERIC_PRESSURE_BAR = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8b0aa2f1_u32, 0x2d57_u16, 0x42ee_u16, StaticArray[0x8c_u8, 0xc0_u8, 0x4d_u8, 0x27_u8, 0x62_u8, 0x2b_u8, 0x46_u8, 0xc4_u8]), 4_u32)
  SENSOR_DATA_TYPE_WIND_DIRECTION_DEGREES_ANTICLOCKWISE = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8b0aa2f1_u32, 0x2d57_u16, 0x42ee_u16, StaticArray[0x8c_u8, 0xc0_u8, 0x4d_u8, 0x27_u8, 0x62_u8, 0x2b_u8, 0x46_u8, 0xc4_u8]), 5_u32)
  SENSOR_DATA_TYPE_WIND_SPEED_METERS_PER_SECOND = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8b0aa2f1_u32, 0x2d57_u16, 0x42ee_u16, StaticArray[0x8c_u8, 0xc0_u8, 0x4d_u8, 0x27_u8, 0x62_u8, 0x2b_u8, 0x46_u8, 0xc4_u8]), 6_u32)
  SENSOR_DATA_TYPE_MOTION_GUID = "3f8a69a2-07c5-4e48-a965-cd797aab56d5"
  SENSOR_DATA_TYPE_ACCELERATION_X_G = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x3f8a69a2_u32, 0x7c5_u16, 0x4e48_u16, StaticArray[0xa9_u8, 0x65_u8, 0xcd_u8, 0x79_u8, 0x7a_u8, 0xab_u8, 0x56_u8, 0xd5_u8]), 2_u32)
  SENSOR_DATA_TYPE_ACCELERATION_Y_G = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x3f8a69a2_u32, 0x7c5_u16, 0x4e48_u16, StaticArray[0xa9_u8, 0x65_u8, 0xcd_u8, 0x79_u8, 0x7a_u8, 0xab_u8, 0x56_u8, 0xd5_u8]), 3_u32)
  SENSOR_DATA_TYPE_ACCELERATION_Z_G = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x3f8a69a2_u32, 0x7c5_u16, 0x4e48_u16, StaticArray[0xa9_u8, 0x65_u8, 0xcd_u8, 0x79_u8, 0x7a_u8, 0xab_u8, 0x56_u8, 0xd5_u8]), 4_u32)
  SENSOR_DATA_TYPE_ANGULAR_ACCELERATION_X_DEGREES_PER_SECOND_SQUARED = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x3f8a69a2_u32, 0x7c5_u16, 0x4e48_u16, StaticArray[0xa9_u8, 0x65_u8, 0xcd_u8, 0x79_u8, 0x7a_u8, 0xab_u8, 0x56_u8, 0xd5_u8]), 5_u32)
  SENSOR_DATA_TYPE_ANGULAR_ACCELERATION_Y_DEGREES_PER_SECOND_SQUARED = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x3f8a69a2_u32, 0x7c5_u16, 0x4e48_u16, StaticArray[0xa9_u8, 0x65_u8, 0xcd_u8, 0x79_u8, 0x7a_u8, 0xab_u8, 0x56_u8, 0xd5_u8]), 6_u32)
  SENSOR_DATA_TYPE_ANGULAR_ACCELERATION_Z_DEGREES_PER_SECOND_SQUARED = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x3f8a69a2_u32, 0x7c5_u16, 0x4e48_u16, StaticArray[0xa9_u8, 0x65_u8, 0xcd_u8, 0x79_u8, 0x7a_u8, 0xab_u8, 0x56_u8, 0xd5_u8]), 7_u32)
  SENSOR_DATA_TYPE_SPEED_METERS_PER_SECOND = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x3f8a69a2_u32, 0x7c5_u16, 0x4e48_u16, StaticArray[0xa9_u8, 0x65_u8, 0xcd_u8, 0x79_u8, 0x7a_u8, 0xab_u8, 0x56_u8, 0xd5_u8]), 8_u32)
  SENSOR_DATA_TYPE_MOTION_STATE = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x3f8a69a2_u32, 0x7c5_u16, 0x4e48_u16, StaticArray[0xa9_u8, 0x65_u8, 0xcd_u8, 0x79_u8, 0x7a_u8, 0xab_u8, 0x56_u8, 0xd5_u8]), 9_u32)
  SENSOR_DATA_TYPE_ANGULAR_VELOCITY_X_DEGREES_PER_SECOND = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x3f8a69a2_u32, 0x7c5_u16, 0x4e48_u16, StaticArray[0xa9_u8, 0x65_u8, 0xcd_u8, 0x79_u8, 0x7a_u8, 0xab_u8, 0x56_u8, 0xd5_u8]), 10_u32)
  SENSOR_DATA_TYPE_ANGULAR_VELOCITY_Y_DEGREES_PER_SECOND = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x3f8a69a2_u32, 0x7c5_u16, 0x4e48_u16, StaticArray[0xa9_u8, 0x65_u8, 0xcd_u8, 0x79_u8, 0x7a_u8, 0xab_u8, 0x56_u8, 0xd5_u8]), 11_u32)
  SENSOR_DATA_TYPE_ANGULAR_VELOCITY_Z_DEGREES_PER_SECOND = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x3f8a69a2_u32, 0x7c5_u16, 0x4e48_u16, StaticArray[0xa9_u8, 0x65_u8, 0xcd_u8, 0x79_u8, 0x7a_u8, 0xab_u8, 0x56_u8, 0xd5_u8]), 12_u32)
  SENSOR_DATA_TYPE_ORIENTATION_GUID = "1637d8a2-4248-4275-865d-558de84aedfd"
  SENSOR_DATA_TYPE_TILT_X_DEGREES = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1637d8a2_u32, 0x4248_u16, 0x4275_u16, StaticArray[0x86_u8, 0x5d_u8, 0x55_u8, 0x8d_u8, 0xe8_u8, 0x4a_u8, 0xed_u8, 0xfd_u8]), 2_u32)
  SENSOR_DATA_TYPE_TILT_Y_DEGREES = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1637d8a2_u32, 0x4248_u16, 0x4275_u16, StaticArray[0x86_u8, 0x5d_u8, 0x55_u8, 0x8d_u8, 0xe8_u8, 0x4a_u8, 0xed_u8, 0xfd_u8]), 3_u32)
  SENSOR_DATA_TYPE_TILT_Z_DEGREES = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1637d8a2_u32, 0x4248_u16, 0x4275_u16, StaticArray[0x86_u8, 0x5d_u8, 0x55_u8, 0x8d_u8, 0xe8_u8, 0x4a_u8, 0xed_u8, 0xfd_u8]), 4_u32)
  SENSOR_DATA_TYPE_MAGNETIC_HEADING_X_DEGREES = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1637d8a2_u32, 0x4248_u16, 0x4275_u16, StaticArray[0x86_u8, 0x5d_u8, 0x55_u8, 0x8d_u8, 0xe8_u8, 0x4a_u8, 0xed_u8, 0xfd_u8]), 5_u32)
  SENSOR_DATA_TYPE_MAGNETIC_HEADING_Y_DEGREES = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1637d8a2_u32, 0x4248_u16, 0x4275_u16, StaticArray[0x86_u8, 0x5d_u8, 0x55_u8, 0x8d_u8, 0xe8_u8, 0x4a_u8, 0xed_u8, 0xfd_u8]), 6_u32)
  SENSOR_DATA_TYPE_MAGNETIC_HEADING_Z_DEGREES = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1637d8a2_u32, 0x4248_u16, 0x4275_u16, StaticArray[0x86_u8, 0x5d_u8, 0x55_u8, 0x8d_u8, 0xe8_u8, 0x4a_u8, 0xed_u8, 0xfd_u8]), 7_u32)
  SENSOR_DATA_TYPE_DISTANCE_X_METERS = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1637d8a2_u32, 0x4248_u16, 0x4275_u16, StaticArray[0x86_u8, 0x5d_u8, 0x55_u8, 0x8d_u8, 0xe8_u8, 0x4a_u8, 0xed_u8, 0xfd_u8]), 8_u32)
  SENSOR_DATA_TYPE_DISTANCE_Y_METERS = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1637d8a2_u32, 0x4248_u16, 0x4275_u16, StaticArray[0x86_u8, 0x5d_u8, 0x55_u8, 0x8d_u8, 0xe8_u8, 0x4a_u8, 0xed_u8, 0xfd_u8]), 9_u32)
  SENSOR_DATA_TYPE_DISTANCE_Z_METERS = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1637d8a2_u32, 0x4248_u16, 0x4275_u16, StaticArray[0x86_u8, 0x5d_u8, 0x55_u8, 0x8d_u8, 0xe8_u8, 0x4a_u8, 0xed_u8, 0xfd_u8]), 10_u32)
  SENSOR_DATA_TYPE_MAGNETIC_HEADING_COMPENSATED_MAGNETIC_NORTH_DEGREES = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1637d8a2_u32, 0x4248_u16, 0x4275_u16, StaticArray[0x86_u8, 0x5d_u8, 0x55_u8, 0x8d_u8, 0xe8_u8, 0x4a_u8, 0xed_u8, 0xfd_u8]), 11_u32)
  SENSOR_DATA_TYPE_MAGNETIC_HEADING_COMPENSATED_TRUE_NORTH_DEGREES = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1637d8a2_u32, 0x4248_u16, 0x4275_u16, StaticArray[0x86_u8, 0x5d_u8, 0x55_u8, 0x8d_u8, 0xe8_u8, 0x4a_u8, 0xed_u8, 0xfd_u8]), 12_u32)
  SENSOR_DATA_TYPE_MAGNETIC_HEADING_MAGNETIC_NORTH_DEGREES = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1637d8a2_u32, 0x4248_u16, 0x4275_u16, StaticArray[0x86_u8, 0x5d_u8, 0x55_u8, 0x8d_u8, 0xe8_u8, 0x4a_u8, 0xed_u8, 0xfd_u8]), 13_u32)
  SENSOR_DATA_TYPE_MAGNETIC_HEADING_TRUE_NORTH_DEGREES = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1637d8a2_u32, 0x4248_u16, 0x4275_u16, StaticArray[0x86_u8, 0x5d_u8, 0x55_u8, 0x8d_u8, 0xe8_u8, 0x4a_u8, 0xed_u8, 0xfd_u8]), 14_u32)
  SENSOR_DATA_TYPE_QUADRANT_ANGLE_DEGREES = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1637d8a2_u32, 0x4248_u16, 0x4275_u16, StaticArray[0x86_u8, 0x5d_u8, 0x55_u8, 0x8d_u8, 0xe8_u8, 0x4a_u8, 0xed_u8, 0xfd_u8]), 15_u32)
  SENSOR_DATA_TYPE_ROTATION_MATRIX = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1637d8a2_u32, 0x4248_u16, 0x4275_u16, StaticArray[0x86_u8, 0x5d_u8, 0x55_u8, 0x8d_u8, 0xe8_u8, 0x4a_u8, 0xed_u8, 0xfd_u8]), 16_u32)
  SENSOR_DATA_TYPE_QUATERNION = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1637d8a2_u32, 0x4248_u16, 0x4275_u16, StaticArray[0x86_u8, 0x5d_u8, 0x55_u8, 0x8d_u8, 0xe8_u8, 0x4a_u8, 0xed_u8, 0xfd_u8]), 17_u32)
  SENSOR_DATA_TYPE_SIMPLE_DEVICE_ORIENTATION = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1637d8a2_u32, 0x4248_u16, 0x4275_u16, StaticArray[0x86_u8, 0x5d_u8, 0x55_u8, 0x8d_u8, 0xe8_u8, 0x4a_u8, 0xed_u8, 0xfd_u8]), 18_u32)
  SENSOR_DATA_TYPE_MAGNETIC_FIELD_STRENGTH_X_MILLIGAUSS = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1637d8a2_u32, 0x4248_u16, 0x4275_u16, StaticArray[0x86_u8, 0x5d_u8, 0x55_u8, 0x8d_u8, 0xe8_u8, 0x4a_u8, 0xed_u8, 0xfd_u8]), 19_u32)
  SENSOR_DATA_TYPE_MAGNETIC_FIELD_STRENGTH_Y_MILLIGAUSS = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1637d8a2_u32, 0x4248_u16, 0x4275_u16, StaticArray[0x86_u8, 0x5d_u8, 0x55_u8, 0x8d_u8, 0xe8_u8, 0x4a_u8, 0xed_u8, 0xfd_u8]), 20_u32)
  SENSOR_DATA_TYPE_MAGNETIC_FIELD_STRENGTH_Z_MILLIGAUSS = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1637d8a2_u32, 0x4248_u16, 0x4275_u16, StaticArray[0x86_u8, 0x5d_u8, 0x55_u8, 0x8d_u8, 0xe8_u8, 0x4a_u8, 0xed_u8, 0xfd_u8]), 21_u32)
  SENSOR_DATA_TYPE_MAGNETOMETER_ACCURACY = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x1637d8a2_u32, 0x4248_u16, 0x4275_u16, StaticArray[0x86_u8, 0x5d_u8, 0x55_u8, 0x8d_u8, 0xe8_u8, 0x4a_u8, 0xed_u8, 0xfd_u8]), 22_u32)
  SENSOR_DATA_TYPE_GUID_MECHANICAL_GUID = "38564a7c-f2f2-49bb-9b2b-ba60f66a58df"
  SENSOR_DATA_TYPE_BOOLEAN_SWITCH_STATE = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x38564a7c_u32, 0xf2f2_u16, 0x49bb_u16, StaticArray[0x9b_u8, 0x2b_u8, 0xba_u8, 0x60_u8, 0xf6_u8, 0x6a_u8, 0x58_u8, 0xdf_u8]), 2_u32)
  SENSOR_DATA_TYPE_MULTIVALUE_SWITCH_STATE = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x38564a7c_u32, 0xf2f2_u16, 0x49bb_u16, StaticArray[0x9b_u8, 0x2b_u8, 0xba_u8, 0x60_u8, 0xf6_u8, 0x6a_u8, 0x58_u8, 0xdf_u8]), 3_u32)
  SENSOR_DATA_TYPE_FORCE_NEWTONS = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x38564a7c_u32, 0xf2f2_u16, 0x49bb_u16, StaticArray[0x9b_u8, 0x2b_u8, 0xba_u8, 0x60_u8, 0xf6_u8, 0x6a_u8, 0x58_u8, 0xdf_u8]), 4_u32)
  SENSOR_DATA_TYPE_ABSOLUTE_PRESSURE_PASCAL = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x38564a7c_u32, 0xf2f2_u16, 0x49bb_u16, StaticArray[0x9b_u8, 0x2b_u8, 0xba_u8, 0x60_u8, 0xf6_u8, 0x6a_u8, 0x58_u8, 0xdf_u8]), 5_u32)
  SENSOR_DATA_TYPE_GAUGE_PRESSURE_PASCAL = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x38564a7c_u32, 0xf2f2_u16, 0x49bb_u16, StaticArray[0x9b_u8, 0x2b_u8, 0xba_u8, 0x60_u8, 0xf6_u8, 0x6a_u8, 0x58_u8, 0xdf_u8]), 6_u32)
  SENSOR_DATA_TYPE_STRAIN = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x38564a7c_u32, 0xf2f2_u16, 0x49bb_u16, StaticArray[0x9b_u8, 0x2b_u8, 0xba_u8, 0x60_u8, 0xf6_u8, 0x6a_u8, 0x58_u8, 0xdf_u8]), 7_u32)
  SENSOR_DATA_TYPE_WEIGHT_KILOGRAMS = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x38564a7c_u32, 0xf2f2_u16, 0x49bb_u16, StaticArray[0x9b_u8, 0x2b_u8, 0xba_u8, 0x60_u8, 0xf6_u8, 0x6a_u8, 0x58_u8, 0xdf_u8]), 8_u32)
  SENSOR_DATA_TYPE_BOOLEAN_SWITCH_ARRAY_STATES = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x38564a7c_u32, 0xf2f2_u16, 0x49bb_u16, StaticArray[0x9b_u8, 0x2b_u8, 0xba_u8, 0x60_u8, 0xf6_u8, 0x6a_u8, 0x58_u8, 0xdf_u8]), 10_u32)
  SENSOR_DATA_TYPE_BIOMETRIC_GUID = "2299288a-6d9e-4b0b-b7ec-3528f89e40af"
  SENSOR_DATA_TYPE_HUMAN_PRESENCE = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x2299288a_u32, 0x6d9e_u16, 0x4b0b_u16, StaticArray[0xb7_u8, 0xec_u8, 0x35_u8, 0x28_u8, 0xf8_u8, 0x9e_u8, 0x40_u8, 0xaf_u8]), 2_u32)
  SENSOR_DATA_TYPE_HUMAN_PROXIMITY_METERS = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x2299288a_u32, 0x6d9e_u16, 0x4b0b_u16, StaticArray[0xb7_u8, 0xec_u8, 0x35_u8, 0x28_u8, 0xf8_u8, 0x9e_u8, 0x40_u8, 0xaf_u8]), 3_u32)
  SENSOR_DATA_TYPE_TOUCH_STATE = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x2299288a_u32, 0x6d9e_u16, 0x4b0b_u16, StaticArray[0xb7_u8, 0xec_u8, 0x35_u8, 0x28_u8, 0xf8_u8, 0x9e_u8, 0x40_u8, 0xaf_u8]), 4_u32)
  SENSOR_DATA_TYPE_LIGHT_GUID = "e4c77ce2-dcb7-46e9-8439-4fec548833a6"
  SENSOR_DATA_TYPE_LIGHT_LEVEL_LUX = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xe4c77ce2_u32, 0xdcb7_u16, 0x46e9_u16, StaticArray[0x84_u8, 0x39_u8, 0x4f_u8, 0xec_u8, 0x54_u8, 0x88_u8, 0x33_u8, 0xa6_u8]), 2_u32)
  SENSOR_DATA_TYPE_LIGHT_TEMPERATURE_KELVIN = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xe4c77ce2_u32, 0xdcb7_u16, 0x46e9_u16, StaticArray[0x84_u8, 0x39_u8, 0x4f_u8, 0xec_u8, 0x54_u8, 0x88_u8, 0x33_u8, 0xa6_u8]), 3_u32)
  SENSOR_DATA_TYPE_LIGHT_CHROMACITY = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xe4c77ce2_u32, 0xdcb7_u16, 0x46e9_u16, StaticArray[0x84_u8, 0x39_u8, 0x4f_u8, 0xec_u8, 0x54_u8, 0x88_u8, 0x33_u8, 0xa6_u8]), 4_u32)
  SENSOR_DATA_TYPE_SCANNER_GUID = "d7a59a3c-3421-44ab-8d3a-9de8ab6c4cae"
  SENSOR_DATA_TYPE_RFID_TAG_40_BIT = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd7a59a3c_u32, 0x3421_u16, 0x44ab_u16, StaticArray[0x8d_u8, 0x3a_u8, 0x9d_u8, 0xe8_u8, 0xab_u8, 0x6c_u8, 0x4c_u8, 0xae_u8]), 2_u32)
  SENSOR_DATA_TYPE_ELECTRICAL_GUID = "bbb246d1-e242-4780-a2d3-cded84f35842"
  SENSOR_DATA_TYPE_VOLTAGE_VOLTS = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xbbb246d1_u32, 0xe242_u16, 0x4780_u16, StaticArray[0xa2_u8, 0xd3_u8, 0xcd_u8, 0xed_u8, 0x84_u8, 0xf3_u8, 0x58_u8, 0x42_u8]), 2_u32)
  SENSOR_DATA_TYPE_CURRENT_AMPS = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xbbb246d1_u32, 0xe242_u16, 0x4780_u16, StaticArray[0xa2_u8, 0xd3_u8, 0xcd_u8, 0xed_u8, 0x84_u8, 0xf3_u8, 0x58_u8, 0x42_u8]), 3_u32)
  SENSOR_DATA_TYPE_CAPACITANCE_FARAD = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xbbb246d1_u32, 0xe242_u16, 0x4780_u16, StaticArray[0xa2_u8, 0xd3_u8, 0xcd_u8, 0xed_u8, 0x84_u8, 0xf3_u8, 0x58_u8, 0x42_u8]), 4_u32)
  SENSOR_DATA_TYPE_RESISTANCE_OHMS = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xbbb246d1_u32, 0xe242_u16, 0x4780_u16, StaticArray[0xa2_u8, 0xd3_u8, 0xcd_u8, 0xed_u8, 0x84_u8, 0xf3_u8, 0x58_u8, 0x42_u8]), 5_u32)
  SENSOR_DATA_TYPE_INDUCTANCE_HENRY = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xbbb246d1_u32, 0xe242_u16, 0x4780_u16, StaticArray[0xa2_u8, 0xd3_u8, 0xcd_u8, 0xed_u8, 0x84_u8, 0xf3_u8, 0x58_u8, 0x42_u8]), 6_u32)
  SENSOR_DATA_TYPE_ELECTRICAL_POWER_WATTS = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xbbb246d1_u32, 0xe242_u16, 0x4780_u16, StaticArray[0xa2_u8, 0xd3_u8, 0xcd_u8, 0xed_u8, 0x84_u8, 0xf3_u8, 0x58_u8, 0x42_u8]), 7_u32)
  SENSOR_DATA_TYPE_ELECTRICAL_PERCENT_OF_RANGE = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xbbb246d1_u32, 0xe242_u16, 0x4780_u16, StaticArray[0xa2_u8, 0xd3_u8, 0xcd_u8, 0xed_u8, 0x84_u8, 0xf3_u8, 0x58_u8, 0x42_u8]), 8_u32)
  SENSOR_DATA_TYPE_ELECTRICAL_FREQUENCY_HERTZ = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xbbb246d1_u32, 0xe242_u16, 0x4780_u16, StaticArray[0xa2_u8, 0xd3_u8, 0xcd_u8, 0xed_u8, 0x84_u8, 0xf3_u8, 0x58_u8, 0x42_u8]), 9_u32)
  SENSOR_DATA_TYPE_CUSTOM_GUID = "b14c764f-07cf-41e8-9d82-ebe3d0776a6f"
  SENSOR_DATA_TYPE_CUSTOM_USAGE = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 5_u32)
  SENSOR_DATA_TYPE_CUSTOM_BOOLEAN_ARRAY = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 6_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE1 = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 7_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE2 = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 8_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE3 = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 9_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE4 = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 10_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE5 = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 11_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE6 = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 12_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE7 = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 13_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE8 = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 14_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE9 = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 15_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE10 = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 16_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE11 = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 17_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE12 = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 18_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE13 = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 19_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE14 = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 20_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE15 = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 21_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE16 = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 22_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE17 = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 23_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE18 = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 24_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE19 = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 25_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE20 = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 26_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE21 = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 27_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE22 = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 28_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE23 = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 29_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE24 = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 30_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE25 = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 31_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE26 = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 32_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE27 = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 33_u32)
  SENSOR_DATA_TYPE_CUSTOM_VALUE28 = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb14c764f_u32, 0x7cf_u16, 0x41e8_u16, StaticArray[0x9d_u8, 0x82_u8, 0xeb_u8, 0xe3_u8, 0xd0_u8, 0x77_u8, 0x6a_u8, 0x6f_u8]), 34_u32)
  SENSOR_PROPERTY_TEST_GUID = "e1e962f4-6e65-45f7-9c36-d487b7b1bd34"
  SENSOR_PROPERTY_CLEAR_ASSISTANCE_DATA = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xe1e962f4_u32, 0x6e65_u16, 0x45f7_u16, StaticArray[0x9c_u8, 0x36_u8, 0xd4_u8, 0x87_u8, 0xb7_u8, 0xb1_u8, 0xbd_u8, 0x34_u8]), 2_u32)
  SENSOR_PROPERTY_TURN_ON_OFF_NMEA = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xe1e962f4_u32, 0x6e65_u16, 0x45f7_u16, StaticArray[0x9c_u8, 0x36_u8, 0xd4_u8, 0x87_u8, 0xb7_u8, 0xb1_u8, 0xbd_u8, 0x34_u8]), 3_u32)
  GNSS_CLEAR_ALL_ASSISTANCE_DATA = 1_u32
  GUID_SensorCategory_All = "c317c286-c468-4288-9975-d4c4587c442c"
  GUID_SensorCategory_Biometric = "ca19690f-a2c7-477d-a99e-99ec6e2b5648"
  GUID_SensorCategory_Electrical = "fb73fcd8-fc4a-483c-ac58-27b691c6beff"
  GUID_SensorCategory_Environmental = "323439aa-7f66-492b-ba0c-73e9aa0a65d5"
  GUID_SensorCategory_Light = "17a665c0-9063-4216-b202-5c7a255e18ce"
  GUID_SensorCategory_Location = "bfa794e4-f964-4fdb-90f6-51056bfe4b44"
  GUID_SensorCategory_Mechanical = "8d131d68-8ef7-4656-80b5-cccbd93791c5"
  GUID_SensorCategory_Motion = "cd09daf1-3b2e-4c3d-b598-b5e5ff93fd46"
  GUID_SensorCategory_Orientation = "9e6c04b6-96fe-4954-b726-68682a473f69"
  GUID_SensorCategory_Other = "2c90e7a9-f4c9-4fa2-af37-56d471fe5a3d"
  GUID_SensorCategory_PersonalActivity = "f1609081-1e12-412b-a14d-cbb0e95bd2e5"
  GUID_SensorCategory_Scanner = "b000e77e-f5b5-420f-815d-0270a726f270"
  GUID_SensorCategory_Unsupported = "2beae7fa-19b0-48c5-a1f6-b5480dc206b0"
  GUID_SensorType_Accelerometer3D = "c2fb0f5f-e2d2-4c78-bcd0-352a9582819d"
  GUID_SensorType_ActivityDetection = "9d9e0118-1807-4f2e-96e4-2ce57142e196"
  GUID_SensorType_AmbientLight = "97f115c8-599a-4153-8894-d2d12899918a"
  GUID_SensorType_Barometer = "0e903829-ff8a-4a93-97df-3dcbde402288"
  GUID_SensorType_Custom = "e83af229-8640-4d18-a213-e22675ebb2c3"
  GUID_SensorType_FloorElevation = "ade4987f-7ac4-4dfa-9722-0a027181c747"
  GUID_SensorType_GeomagneticOrientation = "e77195f8-2d1f-4823-971b-1c4467556c9d"
  GUID_SensorType_GravityVector = "03b52c73-bb76-463f-9524-38de76eb700b"
  GUID_SensorType_Gyrometer3D = "09485f5a-759e-42c2-bd4b-a349b75c8643"
  GUID_SensorType_Humidity = "5c72bf67-bd7e-4257-990b-98a3ba3b400a"
  GUID_SensorType_LinearAccelerometer = "038b0283-97b4-41c8-bc24-5ff1aa48fec7"
  GUID_SensorType_Magnetometer3D = "55e5effb-15c7-40df-8698-a84b7c863c53"
  GUID_SensorType_Orientation = "cdb5d8f7-3cfd-41c8-8542-cce622cf5d6e"
  GUID_SensorType_Pedometer = "b19f89af-e3eb-444b-8dea-202575a71599"
  GUID_SensorType_Proximity = "5220dae9-3179-4430-9f90-06266d2a34de"
  GUID_SensorType_RelativeOrientation = "40993b51-4706-44dc-98d5-c920c037ffab"
  GUID_SensorType_SimpleDeviceOrientation = "86a19291-0482-402c-bf4c-addac52b1c39"
  GUID_SensorType_Temperature = "04fd0ec4-d5da-45fa-95a9-5db38ee19306"
  GUID_SensorType_HingeAngle = "82358065-f4c4-4da1-b272-13c23332a207"
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
    HumanPresenceDetectionType_VendorDefinedNonBiometric = 1_i32
    HumanPresenceDetectionType_VendorDefinedBiometric = 2_i32
    HumanPresenceDetectionType_FacialBiometric = 4_i32
    HumanPresenceDetectionType_AudioBiometric = 8_i32
    HumanPresenceDetectionType_Force_Dword = -1_i32
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
  record SENSOR_VALUE_PAIR,
    key : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY,
    value : Win32cr::System::Com::StructuredStorage::PROPVARIANT

  @[Extern]
  record SENSOR_COLLECTION_LIST,
    allocated_size_in_bytes : UInt32,
    count : UInt32,
    list : Win32cr::Devices::Sensors::SENSOR_VALUE_PAIR*

  @[Extern]
  record SENSOR_PROPERTY_LIST,
    allocated_size_in_bytes : UInt32,
    count : UInt32,
    list : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*

  @[Extern]
  record VEC3D,
    x : Float32,
    y : Float32,
    z : Float32

  @[Extern]
  record MATRIX3X3,
    anonymous : Anonymous_e__Union do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      anonymous1 : Anonymous1_e__Struct,
      anonymous2 : Anonymous2_e__Struct,
      m : Float32[9] do

      # Nested Type Anonymous1_e__Struct
      @[Extern]
      record Anonymous1_e__Struct,
        a11 : Float32,
        a12 : Float32,
        a13 : Float32,
        a21 : Float32,
        a22 : Float32,
        a23 : Float32,
        a31 : Float32,
        a32 : Float32,
        a33 : Float32


      # Nested Type Anonymous2_e__Struct
      @[Extern]
      record Anonymous2_e__Struct,
        v1 : Win32cr::Devices::Sensors::VEC3D,
        v2 : Win32cr::Devices::Sensors::VEC3D,
        v3 : Win32cr::Devices::Sensors::VEC3D

    end

  end

  @[Extern]
  record QUATERNION,
    x : Float32,
    y : Float32,
    z : Float32,
    w : Float32

  @[Extern]
  record ISensorManagerVtbl,
    query_interface : Proc(ISensorManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISensorManager*, UInt32),
    release : Proc(ISensorManager*, UInt32),
    get_sensors_by_category : Proc(ISensorManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_sensors_by_type : Proc(ISensorManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_sensor_by_id : Proc(ISensorManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    set_event_sink : Proc(ISensorManager*, Void*, Win32cr::Foundation::HRESULT),
    request_permissions : Proc(ISensorManager*, Win32cr::Foundation::HWND, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("bd77db67-45a8-42dc-8d00-6dcf15f8377a")]
  record ISensorManager, lpVtbl : ISensorManagerVtbl* do
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
  record ILocationPermissionsVtbl,
    query_interface : Proc(ILocationPermissions*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ILocationPermissions*, UInt32),
    release : Proc(ILocationPermissions*, UInt32),
    get_global_location_permission : Proc(ILocationPermissions*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    check_location_capability : Proc(ILocationPermissions*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d5fb0a7f-e74e-44f5-8e02-4806863a274f")]
  record ILocationPermissions, lpVtbl : ILocationPermissionsVtbl* do
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
  record ISensorCollectionVtbl,
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
  #@[Com("23571e11-e545-4dd8-a337-b89bf44b10df")]
  record ISensorCollection, lpVtbl : ISensorCollectionVtbl* do
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
  record ISensorVtbl,
    query_interface : Proc(ISensor*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISensor*, UInt32),
    release : Proc(ISensor*, UInt32),
    get_id : Proc(ISensor*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_category : Proc(ISensor*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_type : Proc(ISensor*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_friendly_name : Proc(ISensor*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_property : Proc(ISensor*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    get_properties : Proc(ISensor*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_supported_data_fields : Proc(ISensor*, Void**, Win32cr::Foundation::HRESULT),
    set_properties : Proc(ISensor*, Void*, Void**, Win32cr::Foundation::HRESULT),
    supports_data_field : Proc(ISensor*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Int16*, Win32cr::Foundation::HRESULT),
    get_state : Proc(ISensor*, Win32cr::Devices::Sensors::SensorState*, Win32cr::Foundation::HRESULT),
    get_data : Proc(ISensor*, Void**, Win32cr::Foundation::HRESULT),
    supports_event : Proc(ISensor*, LibC::GUID*, Int16*, Win32cr::Foundation::HRESULT),
    get_event_interest : Proc(ISensor*, LibC::GUID**, UInt32*, Win32cr::Foundation::HRESULT),
    set_event_interest : Proc(ISensor*, LibC::GUID*, UInt32, Win32cr::Foundation::HRESULT),
    set_event_sink : Proc(ISensor*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5fa08f80-2657-458e-af75-46f73fa6ac5c")]
  record ISensor, lpVtbl : ISensorVtbl* do
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
    def get_property(this : ISensor*, key : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, pProperty : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
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
    def supports_data_field(this : ISensor*, key : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, pIsSupported : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.supports_data_field.call(this, key, pIsSupported)
    end
    def get_state(this : ISensor*, pState : Win32cr::Devices::Sensors::SensorState*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_state.call(this, pState)
    end
    def get_data(this : ISensor*, ppDataReport : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_data.call(this, ppDataReport)
    end
    def supports_event(this : ISensor*, eventGuid : LibC::GUID*, pIsSupported : Int16*) : Win32cr::Foundation::HRESULT
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
  record ISensorDataReportVtbl,
    query_interface : Proc(ISensorDataReport*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISensorDataReport*, UInt32),
    release : Proc(ISensorDataReport*, UInt32),
    get_timestamp : Proc(ISensorDataReport*, Win32cr::Foundation::SYSTEMTIME*, Win32cr::Foundation::HRESULT),
    get_sensor_value : Proc(ISensorDataReport*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    get_sensor_values : Proc(ISensorDataReport*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0ab9df9b-c4b5-4796-8898-0470706a2e1d")]
  record ISensorDataReport, lpVtbl : ISensorDataReportVtbl* do
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
    def get_sensor_value(this : ISensorDataReport*, pKey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, pValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sensor_value.call(this, pKey, pValue)
    end
    def get_sensor_values(this : ISensorDataReport*, pKeys : Void*, ppValues : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sensor_values.call(this, pKeys, ppValues)
    end

  end

  @[Extern]
  record ISensorManagerEventsVtbl,
    query_interface : Proc(ISensorManagerEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISensorManagerEvents*, UInt32),
    release : Proc(ISensorManagerEvents*, UInt32),
    on_sensor_enter : Proc(ISensorManagerEvents*, Void*, Win32cr::Devices::Sensors::SensorState, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("9b3b0b86-266a-4aad-b21f-fde5501001b7")]
  record ISensorManagerEvents, lpVtbl : ISensorManagerEventsVtbl* do
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
  record ISensorEventsVtbl,
    query_interface : Proc(ISensorEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISensorEvents*, UInt32),
    release : Proc(ISensorEvents*, UInt32),
    on_state_changed : Proc(ISensorEvents*, Void*, Win32cr::Devices::Sensors::SensorState, Win32cr::Foundation::HRESULT),
    on_data_updated : Proc(ISensorEvents*, Void*, Void*, Win32cr::Foundation::HRESULT),
    on_event : Proc(ISensorEvents*, Void*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    on_leave : Proc(ISensorEvents*, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5d8dcc91-4641-47e7-b7c3-b74f48a6c391")]
  record ISensorEvents, lpVtbl : ISensorEventsVtbl* do
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

  @[Link("sensorsutilsv2")]
  lib C
    fun GetPerformanceTime(time_ms : UInt32*) : Win32cr::Foundation::NTSTATUS

    fun InitPropVariantFromFloat(fltVal : Float32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    fun PropKeyFindKeyGetPropVariant(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, type_check : Win32cr::Foundation::BOOLEAN, pValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::NTSTATUS

    fun PropKeyFindKeySetPropVariant(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, type_check : Win32cr::Foundation::BOOLEAN, pValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::NTSTATUS

    fun PropKeyFindKeyGetFileTime(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, pRetValue : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::NTSTATUS

    fun PropKeyFindKeyGetGuid(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, pRetValue : LibC::GUID*) : Win32cr::Foundation::NTSTATUS

    fun PropKeyFindKeyGetBool(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, pRetValue : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::NTSTATUS

    fun PropKeyFindKeyGetUlong(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, pRetValue : UInt32*) : Win32cr::Foundation::NTSTATUS

    fun PropKeyFindKeyGetUshort(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, pRetValue : UInt16*) : Win32cr::Foundation::NTSTATUS

    fun PropKeyFindKeyGetFloat(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, pRetValue : Float32*) : Win32cr::Foundation::NTSTATUS

    fun PropKeyFindKeyGetDouble(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, pRetValue : Float64*) : Win32cr::Foundation::NTSTATUS

    fun PropKeyFindKeyGetInt32(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, pRetValue : Int32*) : Win32cr::Foundation::NTSTATUS

    fun PropKeyFindKeyGetInt64(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, pRetValue : Int64*) : Win32cr::Foundation::NTSTATUS

    fun PropKeyFindKeyGetNthUlong(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, occurrence : UInt32, pRetValue : UInt32*) : Win32cr::Foundation::NTSTATUS

    fun PropKeyFindKeyGetNthUshort(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, occurrence : UInt32, pRetValue : UInt16*) : Win32cr::Foundation::NTSTATUS

    fun PropKeyFindKeyGetNthInt64(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, occurrence : UInt32, pRetValue : Int64*) : Win32cr::Foundation::NTSTATUS

    fun IsKeyPresentInPropertyList(pList : Win32cr::Devices::Sensors::SENSOR_PROPERTY_LIST*, pKey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*) : Win32cr::Foundation::BOOLEAN

    fun IsKeyPresentInCollectionList(pList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*) : Win32cr::Foundation::BOOLEAN

    fun IsCollectionListSame(list_a : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, list_b : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*) : Win32cr::Foundation::BOOLEAN

    fun PropVariantGetInformation(prop_variant_value : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, prop_variant_offset : UInt32*, prop_variant_size : UInt32*, prop_variant_pointer : Void**, remapped_type : UInt32*) : Win32cr::Foundation::NTSTATUS

    fun PropertiesListCopy(target : Win32cr::Devices::Sensors::SENSOR_PROPERTY_LIST*, source : Win32cr::Devices::Sensors::SENSOR_PROPERTY_LIST*) : Win32cr::Foundation::NTSTATUS

    fun PropertiesListGetFillableCount(buffer_size_bytes : UInt32) : UInt32

    fun CollectionsListGetMarshalledSize(collection : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*) : UInt32

    fun CollectionsListCopyAndMarshall(target : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, source : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*) : Win32cr::Foundation::NTSTATUS

    fun CollectionsListMarshall(target : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*) : Win32cr::Foundation::NTSTATUS

    fun CollectionsListGetMarshalledSizeWithoutSerialization(collection : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*) : UInt32

    fun CollectionsListUpdateMarshalledPointer(collection : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*) : Win32cr::Foundation::NTSTATUS

    fun SerializationBufferAllocate(size_in_bytes : UInt32, pBuffer : UInt8**) : Win32cr::Foundation::NTSTATUS

    fun SerializationBufferFree(buffer : UInt8*) : Void

    fun CollectionsListGetSerializedSize(collection : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*) : UInt32

    fun CollectionsListSerializeToBuffer(source_collection : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, target_buffer_size_in_bytes : UInt32, target_buffer : UInt8*) : Win32cr::Foundation::NTSTATUS

    fun CollectionsListAllocateBufferAndSerialize(source_collection : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pTargetBufferSizeInBytes : UInt32*, pTargetBuffer : UInt8**) : Win32cr::Foundation::NTSTATUS

    fun CollectionsListDeserializeFromBuffer(source_buffer_size_in_bytes : UInt32, source_buffer : UInt8*, target_collection : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*) : Win32cr::Foundation::NTSTATUS

    fun SensorCollectionGetAt(index : UInt32, pSensorsList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pKey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, pValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::NTSTATUS

    fun CollectionsListGetFillableCount(buffer_size_bytes : UInt32) : UInt32

    fun EvaluateActivityThresholds(newSample : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, oldSample : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, thresholds : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*) : Win32cr::Foundation::BOOLEAN

    fun CollectionsListSortSubscribedActivitiesByConfidence(thresholds : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, pCollection : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*) : Win32cr::Foundation::NTSTATUS

    fun InitPropVariantFromCLSIDArray(members : LibC::GUID*, size : UInt32, ppropvar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT

    fun IsSensorSubscribed(subscriptionList : Win32cr::Devices::Sensors::SENSOR_COLLECTION_LIST*, currentType : LibC::GUID) : Win32cr::Foundation::BOOLEAN

    fun IsGUIDPresentInList(guidArray : LibC::GUID*, arrayLength : UInt32, guidElem : LibC::GUID*) : Win32cr::Foundation::BOOLEAN

  end
end