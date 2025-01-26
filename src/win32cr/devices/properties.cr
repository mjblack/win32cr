require "./../foundation.cr"

module Win32cr::Devices::Properties
  DEVPKEY_DeviceInterface_Autoplay_Silent = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x434dd28f_u32, 0x9e75_u16, 0x450a_u16, StaticArray[0x9a_u8, 0xb9_u8, 0xff_u8, 0x61_u8, 0xe6_u8, 0x18_u8, 0xba_u8, 0xd0_u8]), 2_u32)
  DEVPKEY_NAME = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb725f130_u32, 0x47ef_u16, 0x101a_u16, StaticArray[0xa5_u8, 0xf1_u8, 0x2_u8, 0x60_u8, 0x8c_u8, 0x9e_u8, 0xeb_u8, 0xac_u8]), 10_u32)
  DEVPKEY_Device_DeviceDesc = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 2_u32)
  DEVPKEY_Device_HardwareIds = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 3_u32)
  DEVPKEY_Device_CompatibleIds = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 4_u32)
  DEVPKEY_Device_Service = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 6_u32)
  DEVPKEY_Device_Class = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 9_u32)
  DEVPKEY_Device_ClassGuid = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 10_u32)
  DEVPKEY_Device_Driver = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 11_u32)
  DEVPKEY_Device_ConfigFlags = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 12_u32)
  DEVPKEY_Device_Manufacturer = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 13_u32)
  DEVPKEY_Device_FriendlyName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 14_u32)
  DEVPKEY_Device_LocationInfo = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 15_u32)
  DEVPKEY_Device_PDOName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 16_u32)
  DEVPKEY_Device_Capabilities = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 17_u32)
  DEVPKEY_Device_UINumber = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 18_u32)
  DEVPKEY_Device_UpperFilters = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 19_u32)
  DEVPKEY_Device_LowerFilters = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 20_u32)
  DEVPKEY_Device_BusTypeGuid = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 21_u32)
  DEVPKEY_Device_LegacyBusType = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 22_u32)
  DEVPKEY_Device_BusNumber = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 23_u32)
  DEVPKEY_Device_EnumeratorName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 24_u32)
  DEVPKEY_Device_Security = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 25_u32)
  DEVPKEY_Device_SecuritySDS = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 26_u32)
  DEVPKEY_Device_DevType = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 27_u32)
  DEVPKEY_Device_Exclusive = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 28_u32)
  DEVPKEY_Device_Characteristics = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 29_u32)
  DEVPKEY_Device_Address = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 30_u32)
  DEVPKEY_Device_UINumberDescFormat = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 31_u32)
  DEVPKEY_Device_PowerData = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 32_u32)
  DEVPKEY_Device_RemovalPolicy = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 33_u32)
  DEVPKEY_Device_RemovalPolicyDefault = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 34_u32)
  DEVPKEY_Device_RemovalPolicyOverride = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 35_u32)
  DEVPKEY_Device_InstallState = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 36_u32)
  DEVPKEY_Device_LocationPaths = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 37_u32)
  DEVPKEY_Device_BaseContainerId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 38_u32)
  DEVPKEY_Device_InstanceId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 256_u32)
  DEVPKEY_Device_DevNodeStatus = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4340a6c5_u32, 0x93fa_u16, 0x4706_u16, StaticArray[0x97_u8, 0x2c_u8, 0x7b_u8, 0x64_u8, 0x80_u8, 0x8_u8, 0xa5_u8, 0xa7_u8]), 2_u32)
  DEVPKEY_Device_ProblemCode = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4340a6c5_u32, 0x93fa_u16, 0x4706_u16, StaticArray[0x97_u8, 0x2c_u8, 0x7b_u8, 0x64_u8, 0x80_u8, 0x8_u8, 0xa5_u8, 0xa7_u8]), 3_u32)
  DEVPKEY_Device_EjectionRelations = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4340a6c5_u32, 0x93fa_u16, 0x4706_u16, StaticArray[0x97_u8, 0x2c_u8, 0x7b_u8, 0x64_u8, 0x80_u8, 0x8_u8, 0xa5_u8, 0xa7_u8]), 4_u32)
  DEVPKEY_Device_RemovalRelations = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4340a6c5_u32, 0x93fa_u16, 0x4706_u16, StaticArray[0x97_u8, 0x2c_u8, 0x7b_u8, 0x64_u8, 0x80_u8, 0x8_u8, 0xa5_u8, 0xa7_u8]), 5_u32)
  DEVPKEY_Device_PowerRelations = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4340a6c5_u32, 0x93fa_u16, 0x4706_u16, StaticArray[0x97_u8, 0x2c_u8, 0x7b_u8, 0x64_u8, 0x80_u8, 0x8_u8, 0xa5_u8, 0xa7_u8]), 6_u32)
  DEVPKEY_Device_BusRelations = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4340a6c5_u32, 0x93fa_u16, 0x4706_u16, StaticArray[0x97_u8, 0x2c_u8, 0x7b_u8, 0x64_u8, 0x80_u8, 0x8_u8, 0xa5_u8, 0xa7_u8]), 7_u32)
  DEVPKEY_Device_Parent = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4340a6c5_u32, 0x93fa_u16, 0x4706_u16, StaticArray[0x97_u8, 0x2c_u8, 0x7b_u8, 0x64_u8, 0x80_u8, 0x8_u8, 0xa5_u8, 0xa7_u8]), 8_u32)
  DEVPKEY_Device_Children = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4340a6c5_u32, 0x93fa_u16, 0x4706_u16, StaticArray[0x97_u8, 0x2c_u8, 0x7b_u8, 0x64_u8, 0x80_u8, 0x8_u8, 0xa5_u8, 0xa7_u8]), 9_u32)
  DEVPKEY_Device_Siblings = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4340a6c5_u32, 0x93fa_u16, 0x4706_u16, StaticArray[0x97_u8, 0x2c_u8, 0x7b_u8, 0x64_u8, 0x80_u8, 0x8_u8, 0xa5_u8, 0xa7_u8]), 10_u32)
  DEVPKEY_Device_TransportRelations = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4340a6c5_u32, 0x93fa_u16, 0x4706_u16, StaticArray[0x97_u8, 0x2c_u8, 0x7b_u8, 0x64_u8, 0x80_u8, 0x8_u8, 0xa5_u8, 0xa7_u8]), 11_u32)
  DEVPKEY_Device_ProblemStatus = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4340a6c5_u32, 0x93fa_u16, 0x4706_u16, StaticArray[0x97_u8, 0x2c_u8, 0x7b_u8, 0x64_u8, 0x80_u8, 0x8_u8, 0xa5_u8, 0xa7_u8]), 12_u32)
  DEVPKEY_Device_Reported = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x80497100_u32, 0x8c73_u16, 0x48b9_u16, StaticArray[0xaa_u8, 0xd9_u8, 0xce_u8, 0x38_u8, 0x7e_u8, 0x19_u8, 0xc5_u8, 0x6e_u8]), 2_u32)
  DEVPKEY_Device_Legacy = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x80497100_u32, 0x8c73_u16, 0x48b9_u16, StaticArray[0xaa_u8, 0xd9_u8, 0xce_u8, 0x38_u8, 0x7e_u8, 0x19_u8, 0xc5_u8, 0x6e_u8]), 3_u32)
  DEVPKEY_Device_ContainerId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8c7ed206_u32, 0x3f8a_u16, 0x4827_u16, StaticArray[0xb3_u8, 0xab_u8, 0xae_u8, 0x9e_u8, 0x1f_u8, 0xae_u8, 0xfc_u8, 0x6c_u8]), 2_u32)
  DEVPKEY_Device_InLocalMachineContainer = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8c7ed206_u32, 0x3f8a_u16, 0x4827_u16, StaticArray[0xb3_u8, 0xab_u8, 0xae_u8, 0x9e_u8, 0x1f_u8, 0xae_u8, 0xfc_u8, 0x6c_u8]), 4_u32)
  DEVPKEY_Device_Model = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 39_u32)
  DEVPKEY_Device_ModelId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x80d81ea6_u32, 0x7473_u16, 0x4b0c_u16, StaticArray[0x82_u8, 0x16_u8, 0xef_u8, 0xc1_u8, 0x1a_u8, 0x2c_u8, 0x4c_u8, 0x8b_u8]), 2_u32)
  DEVPKEY_Device_FriendlyNameAttributes = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x80d81ea6_u32, 0x7473_u16, 0x4b0c_u16, StaticArray[0x82_u8, 0x16_u8, 0xef_u8, 0xc1_u8, 0x1a_u8, 0x2c_u8, 0x4c_u8, 0x8b_u8]), 3_u32)
  DEVPKEY_Device_ManufacturerAttributes = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x80d81ea6_u32, 0x7473_u16, 0x4b0c_u16, StaticArray[0x82_u8, 0x16_u8, 0xef_u8, 0xc1_u8, 0x1a_u8, 0x2c_u8, 0x4c_u8, 0x8b_u8]), 4_u32)
  DEVPKEY_Device_PresenceNotForDevice = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x80d81ea6_u32, 0x7473_u16, 0x4b0c_u16, StaticArray[0x82_u8, 0x16_u8, 0xef_u8, 0xc1_u8, 0x1a_u8, 0x2c_u8, 0x4c_u8, 0x8b_u8]), 5_u32)
  DEVPKEY_Device_SignalStrength = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x80d81ea6_u32, 0x7473_u16, 0x4b0c_u16, StaticArray[0x82_u8, 0x16_u8, 0xef_u8, 0xc1_u8, 0x1a_u8, 0x2c_u8, 0x4c_u8, 0x8b_u8]), 6_u32)
  DEVPKEY_Device_IsAssociateableByUserAction = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x80d81ea6_u32, 0x7473_u16, 0x4b0c_u16, StaticArray[0x82_u8, 0x16_u8, 0xef_u8, 0xc1_u8, 0x1a_u8, 0x2c_u8, 0x4c_u8, 0x8b_u8]), 7_u32)
  DEVPKEY_Device_ShowInUninstallUI = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x80d81ea6_u32, 0x7473_u16, 0x4b0c_u16, StaticArray[0x82_u8, 0x16_u8, 0xef_u8, 0xc1_u8, 0x1a_u8, 0x2c_u8, 0x4c_u8, 0x8b_u8]), 8_u32)
  DEVPKEY_Device_Numa_Proximity_Domain = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x540b947e_u32, 0x8b40_u16, 0x45bc_u16, StaticArray[0xa8_u8, 0xa2_u8, 0x6a_u8, 0xb_u8, 0x89_u8, 0x4c_u8, 0xbd_u8, 0xa2_u8]), 1_u32)
  DEVPKEY_Device_DHP_Rebalance_Policy = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x540b947e_u32, 0x8b40_u16, 0x45bc_u16, StaticArray[0xa8_u8, 0xa2_u8, 0x6a_u8, 0xb_u8, 0x89_u8, 0x4c_u8, 0xbd_u8, 0xa2_u8]), 2_u32)
  DEVPKEY_Device_Numa_Node = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x540b947e_u32, 0x8b40_u16, 0x45bc_u16, StaticArray[0xa8_u8, 0xa2_u8, 0x6a_u8, 0xb_u8, 0x89_u8, 0x4c_u8, 0xbd_u8, 0xa2_u8]), 3_u32)
  DEVPKEY_Device_BusReportedDeviceDesc = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x540b947e_u32, 0x8b40_u16, 0x45bc_u16, StaticArray[0xa8_u8, 0xa2_u8, 0x6a_u8, 0xb_u8, 0x89_u8, 0x4c_u8, 0xbd_u8, 0xa2_u8]), 4_u32)
  DEVPKEY_Device_IsPresent = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x540b947e_u32, 0x8b40_u16, 0x45bc_u16, StaticArray[0xa8_u8, 0xa2_u8, 0x6a_u8, 0xb_u8, 0x89_u8, 0x4c_u8, 0xbd_u8, 0xa2_u8]), 5_u32)
  DEVPKEY_Device_HasProblem = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x540b947e_u32, 0x8b40_u16, 0x45bc_u16, StaticArray[0xa8_u8, 0xa2_u8, 0x6a_u8, 0xb_u8, 0x89_u8, 0x4c_u8, 0xbd_u8, 0xa2_u8]), 6_u32)
  DEVPKEY_Device_ConfigurationId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x540b947e_u32, 0x8b40_u16, 0x45bc_u16, StaticArray[0xa8_u8, 0xa2_u8, 0x6a_u8, 0xb_u8, 0x89_u8, 0x4c_u8, 0xbd_u8, 0xa2_u8]), 7_u32)
  DEVPKEY_Device_ReportedDeviceIdsHash = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x540b947e_u32, 0x8b40_u16, 0x45bc_u16, StaticArray[0xa8_u8, 0xa2_u8, 0x6a_u8, 0xb_u8, 0x89_u8, 0x4c_u8, 0xbd_u8, 0xa2_u8]), 8_u32)
  DEVPKEY_Device_PhysicalDeviceLocation = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x540b947e_u32, 0x8b40_u16, 0x45bc_u16, StaticArray[0xa8_u8, 0xa2_u8, 0x6a_u8, 0xb_u8, 0x89_u8, 0x4c_u8, 0xbd_u8, 0xa2_u8]), 9_u32)
  DEVPKEY_Device_BiosDeviceName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x540b947e_u32, 0x8b40_u16, 0x45bc_u16, StaticArray[0xa8_u8, 0xa2_u8, 0x6a_u8, 0xb_u8, 0x89_u8, 0x4c_u8, 0xbd_u8, 0xa2_u8]), 10_u32)
  DEVPKEY_Device_DriverProblemDesc = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x540b947e_u32, 0x8b40_u16, 0x45bc_u16, StaticArray[0xa8_u8, 0xa2_u8, 0x6a_u8, 0xb_u8, 0x89_u8, 0x4c_u8, 0xbd_u8, 0xa2_u8]), 11_u32)
  DEVPKEY_Device_DebuggerSafe = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x540b947e_u32, 0x8b40_u16, 0x45bc_u16, StaticArray[0xa8_u8, 0xa2_u8, 0x6a_u8, 0xb_u8, 0x89_u8, 0x4c_u8, 0xbd_u8, 0xa2_u8]), 12_u32)
  DEVPKEY_Device_PostInstallInProgress = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x540b947e_u32, 0x8b40_u16, 0x45bc_u16, StaticArray[0xa8_u8, 0xa2_u8, 0x6a_u8, 0xb_u8, 0x89_u8, 0x4c_u8, 0xbd_u8, 0xa2_u8]), 13_u32)
  DEVPKEY_Device_Stack = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x540b947e_u32, 0x8b40_u16, 0x45bc_u16, StaticArray[0xa8_u8, 0xa2_u8, 0x6a_u8, 0xb_u8, 0x89_u8, 0x4c_u8, 0xbd_u8, 0xa2_u8]), 14_u32)
  DEVPKEY_Device_ExtendedConfigurationIds = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x540b947e_u32, 0x8b40_u16, 0x45bc_u16, StaticArray[0xa8_u8, 0xa2_u8, 0x6a_u8, 0xb_u8, 0x89_u8, 0x4c_u8, 0xbd_u8, 0xa2_u8]), 15_u32)
  DEVPKEY_Device_IsRebootRequired = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x540b947e_u32, 0x8b40_u16, 0x45bc_u16, StaticArray[0xa8_u8, 0xa2_u8, 0x6a_u8, 0xb_u8, 0x89_u8, 0x4c_u8, 0xbd_u8, 0xa2_u8]), 16_u32)
  DEVPKEY_Device_FirmwareDate = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x540b947e_u32, 0x8b40_u16, 0x45bc_u16, StaticArray[0xa8_u8, 0xa2_u8, 0x6a_u8, 0xb_u8, 0x89_u8, 0x4c_u8, 0xbd_u8, 0xa2_u8]), 17_u32)
  DEVPKEY_Device_FirmwareVersion = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x540b947e_u32, 0x8b40_u16, 0x45bc_u16, StaticArray[0xa8_u8, 0xa2_u8, 0x6a_u8, 0xb_u8, 0x89_u8, 0x4c_u8, 0xbd_u8, 0xa2_u8]), 18_u32)
  DEVPKEY_Device_FirmwareRevision = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x540b947e_u32, 0x8b40_u16, 0x45bc_u16, StaticArray[0xa8_u8, 0xa2_u8, 0x6a_u8, 0xb_u8, 0x89_u8, 0x4c_u8, 0xbd_u8, 0xa2_u8]), 19_u32)
  DEVPKEY_Device_DependencyProviders = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x540b947e_u32, 0x8b40_u16, 0x45bc_u16, StaticArray[0xa8_u8, 0xa2_u8, 0x6a_u8, 0xb_u8, 0x89_u8, 0x4c_u8, 0xbd_u8, 0xa2_u8]), 20_u32)
  DEVPKEY_Device_DependencyDependents = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x540b947e_u32, 0x8b40_u16, 0x45bc_u16, StaticArray[0xa8_u8, 0xa2_u8, 0x6a_u8, 0xb_u8, 0x89_u8, 0x4c_u8, 0xbd_u8, 0xa2_u8]), 21_u32)
  DEVPKEY_Device_SoftRestartSupported = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x540b947e_u32, 0x8b40_u16, 0x45bc_u16, StaticArray[0xa8_u8, 0xa2_u8, 0x6a_u8, 0xb_u8, 0x89_u8, 0x4c_u8, 0xbd_u8, 0xa2_u8]), 22_u32)
  DEVPKEY_Device_ExtendedAddress = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x540b947e_u32, 0x8b40_u16, 0x45bc_u16, StaticArray[0xa8_u8, 0xa2_u8, 0x6a_u8, 0xb_u8, 0x89_u8, 0x4c_u8, 0xbd_u8, 0xa2_u8]), 23_u32)
  DEVPKEY_Device_AssignedToGuest = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x540b947e_u32, 0x8b40_u16, 0x45bc_u16, StaticArray[0xa8_u8, 0xa2_u8, 0x6a_u8, 0xb_u8, 0x89_u8, 0x4c_u8, 0xbd_u8, 0xa2_u8]), 24_u32)
  DEVPKEY_Device_CreatorProcessId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x540b947e_u32, 0x8b40_u16, 0x45bc_u16, StaticArray[0xa8_u8, 0xa2_u8, 0x6a_u8, 0xb_u8, 0x89_u8, 0x4c_u8, 0xbd_u8, 0xa2_u8]), 25_u32)
  DEVPKEY_Device_SessionId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x83da6326_u32, 0x97a6_u16, 0x4088_u16, StaticArray[0x94_u8, 0x53_u8, 0xa1_u8, 0x92_u8, 0x3f_u8, 0x57_u8, 0x3b_u8, 0x29_u8]), 6_u32)
  DEVPKEY_Device_InstallDate = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x83da6326_u32, 0x97a6_u16, 0x4088_u16, StaticArray[0x94_u8, 0x53_u8, 0xa1_u8, 0x92_u8, 0x3f_u8, 0x57_u8, 0x3b_u8, 0x29_u8]), 100_u32)
  DEVPKEY_Device_FirstInstallDate = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x83da6326_u32, 0x97a6_u16, 0x4088_u16, StaticArray[0x94_u8, 0x53_u8, 0xa1_u8, 0x92_u8, 0x3f_u8, 0x57_u8, 0x3b_u8, 0x29_u8]), 101_u32)
  DEVPKEY_Device_LastArrivalDate = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x83da6326_u32, 0x97a6_u16, 0x4088_u16, StaticArray[0x94_u8, 0x53_u8, 0xa1_u8, 0x92_u8, 0x3f_u8, 0x57_u8, 0x3b_u8, 0x29_u8]), 102_u32)
  DEVPKEY_Device_LastRemovalDate = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x83da6326_u32, 0x97a6_u16, 0x4088_u16, StaticArray[0x94_u8, 0x53_u8, 0xa1_u8, 0x92_u8, 0x3f_u8, 0x57_u8, 0x3b_u8, 0x29_u8]), 103_u32)
  DEVPKEY_Device_DriverDate = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 2_u32)
  DEVPKEY_Device_DriverVersion = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 3_u32)
  DEVPKEY_Device_DriverDesc = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 4_u32)
  DEVPKEY_Device_DriverInfPath = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 5_u32)
  DEVPKEY_Device_DriverInfSection = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 6_u32)
  DEVPKEY_Device_DriverInfSectionExt = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 7_u32)
  DEVPKEY_Device_MatchingDeviceId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 8_u32)
  DEVPKEY_Device_DriverProvider = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 9_u32)
  DEVPKEY_Device_DriverPropPageProvider = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 10_u32)
  DEVPKEY_Device_DriverCoInstallers = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 11_u32)
  DEVPKEY_Device_ResourcePickerTags = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 12_u32)
  DEVPKEY_Device_ResourcePickerExceptions = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 13_u32)
  DEVPKEY_Device_DriverRank = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 14_u32)
  DEVPKEY_Device_DriverLogoLevel = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 15_u32)
  DEVPKEY_Device_NoConnectSound = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 17_u32)
  DEVPKEY_Device_GenericDriverInstalled = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 18_u32)
  DEVPKEY_Device_AdditionalSoftwareRequested = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 19_u32)
  DEVPKEY_Device_SafeRemovalRequired = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xafd97640_u32, 0x86a3_u16, 0x4210_u16, StaticArray[0xb6_u8, 0x7c_u8, 0x28_u8, 0x9c_u8, 0x41_u8, 0xaa_u8, 0xbe_u8, 0x55_u8]), 2_u32)
  DEVPKEY_Device_SafeRemovalRequiredOverride = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xafd97640_u32, 0x86a3_u16, 0x4210_u16, StaticArray[0xb6_u8, 0x7c_u8, 0x28_u8, 0x9c_u8, 0x41_u8, 0xaa_u8, 0xbe_u8, 0x55_u8]), 3_u32)
  DEVPKEY_DrvPkg_Model = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xcf73bb51_u32, 0x3abf_u16, 0x44a2_u16, StaticArray[0x85_u8, 0xe0_u8, 0x9a_u8, 0x3d_u8, 0xc7_u8, 0xa1_u8, 0x21_u8, 0x32_u8]), 2_u32)
  DEVPKEY_DrvPkg_VendorWebSite = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xcf73bb51_u32, 0x3abf_u16, 0x44a2_u16, StaticArray[0x85_u8, 0xe0_u8, 0x9a_u8, 0x3d_u8, 0xc7_u8, 0xa1_u8, 0x21_u8, 0x32_u8]), 3_u32)
  DEVPKEY_DrvPkg_DetailedDescription = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xcf73bb51_u32, 0x3abf_u16, 0x44a2_u16, StaticArray[0x85_u8, 0xe0_u8, 0x9a_u8, 0x3d_u8, 0xc7_u8, 0xa1_u8, 0x21_u8, 0x32_u8]), 4_u32)
  DEVPKEY_DrvPkg_DocumentationLink = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xcf73bb51_u32, 0x3abf_u16, 0x44a2_u16, StaticArray[0x85_u8, 0xe0_u8, 0x9a_u8, 0x3d_u8, 0xc7_u8, 0xa1_u8, 0x21_u8, 0x32_u8]), 5_u32)
  DEVPKEY_DrvPkg_Icon = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xcf73bb51_u32, 0x3abf_u16, 0x44a2_u16, StaticArray[0x85_u8, 0xe0_u8, 0x9a_u8, 0x3d_u8, 0xc7_u8, 0xa1_u8, 0x21_u8, 0x32_u8]), 6_u32)
  DEVPKEY_DrvPkg_BrandingIcon = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xcf73bb51_u32, 0x3abf_u16, 0x44a2_u16, StaticArray[0x85_u8, 0xe0_u8, 0x9a_u8, 0x3d_u8, 0xc7_u8, 0xa1_u8, 0x21_u8, 0x32_u8]), 7_u32)
  DEVPKEY_DeviceClass_UpperFilters = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4321918b_u32, 0xf69e_u16, 0x470d_u16, StaticArray[0xa5_u8, 0xde_u8, 0x4d_u8, 0x88_u8, 0xc7_u8, 0x5a_u8, 0xd2_u8, 0x4b_u8]), 19_u32)
  DEVPKEY_DeviceClass_LowerFilters = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4321918b_u32, 0xf69e_u16, 0x470d_u16, StaticArray[0xa5_u8, 0xde_u8, 0x4d_u8, 0x88_u8, 0xc7_u8, 0x5a_u8, 0xd2_u8, 0x4b_u8]), 20_u32)
  DEVPKEY_DeviceClass_Security = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4321918b_u32, 0xf69e_u16, 0x470d_u16, StaticArray[0xa5_u8, 0xde_u8, 0x4d_u8, 0x88_u8, 0xc7_u8, 0x5a_u8, 0xd2_u8, 0x4b_u8]), 25_u32)
  DEVPKEY_DeviceClass_SecuritySDS = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4321918b_u32, 0xf69e_u16, 0x470d_u16, StaticArray[0xa5_u8, 0xde_u8, 0x4d_u8, 0x88_u8, 0xc7_u8, 0x5a_u8, 0xd2_u8, 0x4b_u8]), 26_u32)
  DEVPKEY_DeviceClass_DevType = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4321918b_u32, 0xf69e_u16, 0x470d_u16, StaticArray[0xa5_u8, 0xde_u8, 0x4d_u8, 0x88_u8, 0xc7_u8, 0x5a_u8, 0xd2_u8, 0x4b_u8]), 27_u32)
  DEVPKEY_DeviceClass_Exclusive = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4321918b_u32, 0xf69e_u16, 0x470d_u16, StaticArray[0xa5_u8, 0xde_u8, 0x4d_u8, 0x88_u8, 0xc7_u8, 0x5a_u8, 0xd2_u8, 0x4b_u8]), 28_u32)
  DEVPKEY_DeviceClass_Characteristics = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4321918b_u32, 0xf69e_u16, 0x470d_u16, StaticArray[0xa5_u8, 0xde_u8, 0x4d_u8, 0x88_u8, 0xc7_u8, 0x5a_u8, 0xd2_u8, 0x4b_u8]), 29_u32)
  DEVPKEY_DeviceClass_Name = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x259abffc_u32, 0x50a7_u16, 0x47ce_u16, StaticArray[0xaf_u8, 0x8_u8, 0x68_u8, 0xc9_u8, 0xa7_u8, 0xd7_u8, 0x33_u8, 0x66_u8]), 2_u32)
  DEVPKEY_DeviceClass_ClassName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x259abffc_u32, 0x50a7_u16, 0x47ce_u16, StaticArray[0xaf_u8, 0x8_u8, 0x68_u8, 0xc9_u8, 0xa7_u8, 0xd7_u8, 0x33_u8, 0x66_u8]), 3_u32)
  DEVPKEY_DeviceClass_Icon = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x259abffc_u32, 0x50a7_u16, 0x47ce_u16, StaticArray[0xaf_u8, 0x8_u8, 0x68_u8, 0xc9_u8, 0xa7_u8, 0xd7_u8, 0x33_u8, 0x66_u8]), 4_u32)
  DEVPKEY_DeviceClass_ClassInstaller = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x259abffc_u32, 0x50a7_u16, 0x47ce_u16, StaticArray[0xaf_u8, 0x8_u8, 0x68_u8, 0xc9_u8, 0xa7_u8, 0xd7_u8, 0x33_u8, 0x66_u8]), 5_u32)
  DEVPKEY_DeviceClass_PropPageProvider = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x259abffc_u32, 0x50a7_u16, 0x47ce_u16, StaticArray[0xaf_u8, 0x8_u8, 0x68_u8, 0xc9_u8, 0xa7_u8, 0xd7_u8, 0x33_u8, 0x66_u8]), 6_u32)
  DEVPKEY_DeviceClass_NoInstallClass = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x259abffc_u32, 0x50a7_u16, 0x47ce_u16, StaticArray[0xaf_u8, 0x8_u8, 0x68_u8, 0xc9_u8, 0xa7_u8, 0xd7_u8, 0x33_u8, 0x66_u8]), 7_u32)
  DEVPKEY_DeviceClass_NoDisplayClass = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x259abffc_u32, 0x50a7_u16, 0x47ce_u16, StaticArray[0xaf_u8, 0x8_u8, 0x68_u8, 0xc9_u8, 0xa7_u8, 0xd7_u8, 0x33_u8, 0x66_u8]), 8_u32)
  DEVPKEY_DeviceClass_SilentInstall = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x259abffc_u32, 0x50a7_u16, 0x47ce_u16, StaticArray[0xaf_u8, 0x8_u8, 0x68_u8, 0xc9_u8, 0xa7_u8, 0xd7_u8, 0x33_u8, 0x66_u8]), 9_u32)
  DEVPKEY_DeviceClass_NoUseClass = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x259abffc_u32, 0x50a7_u16, 0x47ce_u16, StaticArray[0xaf_u8, 0x8_u8, 0x68_u8, 0xc9_u8, 0xa7_u8, 0xd7_u8, 0x33_u8, 0x66_u8]), 10_u32)
  DEVPKEY_DeviceClass_DefaultService = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x259abffc_u32, 0x50a7_u16, 0x47ce_u16, StaticArray[0xaf_u8, 0x8_u8, 0x68_u8, 0xc9_u8, 0xa7_u8, 0xd7_u8, 0x33_u8, 0x66_u8]), 11_u32)
  DEVPKEY_DeviceClass_IconPath = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x259abffc_u32, 0x50a7_u16, 0x47ce_u16, StaticArray[0xaf_u8, 0x8_u8, 0x68_u8, 0xc9_u8, 0xa7_u8, 0xd7_u8, 0x33_u8, 0x66_u8]), 12_u32)
  DEVPKEY_DeviceClass_DHPRebalanceOptOut = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xd14d3ef3_u32, 0x66cf_u16, 0x4ba2_u16, StaticArray[0x9d_u8, 0x38_u8, 0xd_u8, 0xdb_u8, 0x37_u8, 0xab_u8, 0x47_u8, 0x1_u8]), 2_u32)
  DEVPKEY_DeviceClass_ClassCoInstallers = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x713d1703_u32, 0xa2e2_u16, 0x49f5_u16, StaticArray[0x92_u8, 0x14_u8, 0x56_u8, 0x47_u8, 0x2e_u8, 0xf3_u8, 0xda_u8, 0x5c_u8]), 2_u32)
  DEVPKEY_DeviceInterface_FriendlyName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x26e516e_u32, 0xb814_u16, 0x414b_u16, StaticArray[0x83_u8, 0xcd_u8, 0x85_u8, 0x6d_u8, 0x6f_u8, 0xef_u8, 0x48_u8, 0x22_u8]), 2_u32)
  DEVPKEY_DeviceInterface_Enabled = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x26e516e_u32, 0xb814_u16, 0x414b_u16, StaticArray[0x83_u8, 0xcd_u8, 0x85_u8, 0x6d_u8, 0x6f_u8, 0xef_u8, 0x48_u8, 0x22_u8]), 3_u32)
  DEVPKEY_DeviceInterface_ClassGuid = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x26e516e_u32, 0xb814_u16, 0x414b_u16, StaticArray[0x83_u8, 0xcd_u8, 0x85_u8, 0x6d_u8, 0x6f_u8, 0xef_u8, 0x48_u8, 0x22_u8]), 4_u32)
  DEVPKEY_DeviceInterface_ReferenceString = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x26e516e_u32, 0xb814_u16, 0x414b_u16, StaticArray[0x83_u8, 0xcd_u8, 0x85_u8, 0x6d_u8, 0x6f_u8, 0xef_u8, 0x48_u8, 0x22_u8]), 5_u32)
  DEVPKEY_DeviceInterface_Restricted = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x26e516e_u32, 0xb814_u16, 0x414b_u16, StaticArray[0x83_u8, 0xcd_u8, 0x85_u8, 0x6d_u8, 0x6f_u8, 0xef_u8, 0x48_u8, 0x22_u8]), 6_u32)
  DEVPKEY_DeviceInterface_UnrestrictedAppCapabilities = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x26e516e_u32, 0xb814_u16, 0x414b_u16, StaticArray[0x83_u8, 0xcd_u8, 0x85_u8, 0x6d_u8, 0x6f_u8, 0xef_u8, 0x48_u8, 0x22_u8]), 8_u32)
  DEVPKEY_DeviceInterface_SchematicName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x26e516e_u32, 0xb814_u16, 0x414b_u16, StaticArray[0x83_u8, 0xcd_u8, 0x85_u8, 0x6d_u8, 0x6f_u8, 0xef_u8, 0x48_u8, 0x22_u8]), 9_u32)
  DEVPKEY_DeviceInterfaceClass_DefaultInterface = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x14c83a99_u32, 0xb3f_u16, 0x44b7_u16, StaticArray[0xbe_u8, 0x4c_u8, 0xa1_u8, 0x78_u8, 0xd3_u8, 0x99_u8, 0x5_u8, 0x64_u8]), 2_u32)
  DEVPKEY_DeviceInterfaceClass_Name = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x14c83a99_u32, 0xb3f_u16, 0x44b7_u16, StaticArray[0xbe_u8, 0x4c_u8, 0xa1_u8, 0x78_u8, 0xd3_u8, 0x99_u8, 0x5_u8, 0x64_u8]), 3_u32)
  DEVPKEY_DeviceContainer_Address = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 51_u32)
  DEVPKEY_DeviceContainer_DiscoveryMethod = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 52_u32)
  DEVPKEY_DeviceContainer_IsEncrypted = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 53_u32)
  DEVPKEY_DeviceContainer_IsAuthenticated = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 54_u32)
  DEVPKEY_DeviceContainer_IsConnected = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 55_u32)
  DEVPKEY_DeviceContainer_IsPaired = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 56_u32)
  DEVPKEY_DeviceContainer_Icon = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 57_u32)
  DEVPKEY_DeviceContainer_Version = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 65_u32)
  DEVPKEY_DeviceContainer_Last_Seen = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 66_u32)
  DEVPKEY_DeviceContainer_Last_Connected = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 67_u32)
  DEVPKEY_DeviceContainer_IsShowInDisconnectedState = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 68_u32)
  DEVPKEY_DeviceContainer_IsLocalMachine = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 70_u32)
  DEVPKEY_DeviceContainer_MetadataPath = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 71_u32)
  DEVPKEY_DeviceContainer_IsMetadataSearchInProgress = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 72_u32)
  DEVPKEY_DeviceContainer_MetadataChecksum = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 73_u32)
  DEVPKEY_DeviceContainer_IsNotInterestingForDisplay = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 74_u32)
  DEVPKEY_DeviceContainer_LaunchDeviceStageOnDeviceConnect = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 76_u32)
  DEVPKEY_DeviceContainer_LaunchDeviceStageFromExplorer = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 77_u32)
  DEVPKEY_DeviceContainer_BaselineExperienceId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 78_u32)
  DEVPKEY_DeviceContainer_IsDeviceUniquelyIdentifiable = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 79_u32)
  DEVPKEY_DeviceContainer_AssociationArray = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 80_u32)
  DEVPKEY_DeviceContainer_DeviceDescription1 = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 81_u32)
  DEVPKEY_DeviceContainer_DeviceDescription2 = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 82_u32)
  DEVPKEY_DeviceContainer_HasProblem = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 83_u32)
  DEVPKEY_DeviceContainer_IsSharedDevice = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 84_u32)
  DEVPKEY_DeviceContainer_IsNetworkDevice = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 85_u32)
  DEVPKEY_DeviceContainer_IsDefaultDevice = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 86_u32)
  DEVPKEY_DeviceContainer_MetadataCabinet = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 87_u32)
  DEVPKEY_DeviceContainer_RequiresPairingElevation = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 88_u32)
  DEVPKEY_DeviceContainer_ExperienceId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 89_u32)
  DEVPKEY_DeviceContainer_Category = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 90_u32)
  DEVPKEY_DeviceContainer_Category_Desc_Singular = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 91_u32)
  DEVPKEY_DeviceContainer_Category_Desc_Plural = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 92_u32)
  DEVPKEY_DeviceContainer_Category_Icon = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 93_u32)
  DEVPKEY_DeviceContainer_CategoryGroup_Desc = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 94_u32)
  DEVPKEY_DeviceContainer_CategoryGroup_Icon = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 95_u32)
  DEVPKEY_DeviceContainer_PrimaryCategory = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 97_u32)
  DEVPKEY_DeviceContainer_UnpairUninstall = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 98_u32)
  DEVPKEY_DeviceContainer_RequiresUninstallElevation = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 99_u32)
  DEVPKEY_DeviceContainer_DeviceFunctionSubRank = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 100_u32)
  DEVPKEY_DeviceContainer_AlwaysShowDeviceAsConnected = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 101_u32)
  DEVPKEY_DeviceContainer_ConfigFlags = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 105_u32)
  DEVPKEY_DeviceContainer_PrivilegedPackageFamilyNames = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 106_u32)
  DEVPKEY_DeviceContainer_CustomPrivilegedPackageFamilyNames = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 107_u32)
  DEVPKEY_DeviceContainer_IsRebootRequired = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 108_u32)
  DEVPKEY_DeviceContainer_FriendlyName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 12288_u32)
  DEVPKEY_DeviceContainer_Manufacturer = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 8192_u32)
  DEVPKEY_DeviceContainer_ModelName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 8194_u32)
  DEVPKEY_DeviceContainer_ModelNumber = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 8195_u32)
  DEVPKEY_DeviceContainer_InstallInProgress = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x83da6326_u32, 0x97a6_u16, 0x4088_u16, StaticArray[0x94_u8, 0x53_u8, 0xa1_u8, 0x92_u8, 0x3f_u8, 0x57_u8, 0x3b_u8, 0x29_u8]), 9_u32)
  DEVPKEY_DevQuery_ObjectType = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x13673f42_u32, 0xa3d6_u16, 0x49f6_u16, StaticArray[0xb4_u8, 0xda_u8, 0xae_u8, 0x46_u8, 0xe0_u8, 0xc5_u8, 0x23_u8, 0x7c_u8]), 2_u32)
  DEVPROP_TYPEMOD_ARRAY = 4096_u32
  DEVPROP_TYPEMOD_LIST = 8192_u32
  DEVPROP_TYPE_EMPTY = 0_u32
  DEVPROP_TYPE_NULL = 1_u32
  DEVPROP_TYPE_SBYTE = 2_u32
  DEVPROP_TYPE_BYTE = 3_u32
  DEVPROP_TYPE_INT16 = 4_u32
  DEVPROP_TYPE_UINT16 = 5_u32
  DEVPROP_TYPE_INT32 = 6_u32
  DEVPROP_TYPE_UINT32 = 7_u32
  DEVPROP_TYPE_INT64 = 8_u32
  DEVPROP_TYPE_UINT64 = 9_u32
  DEVPROP_TYPE_FLOAT = 10_u32
  DEVPROP_TYPE_DOUBLE = 11_u32
  DEVPROP_TYPE_DECIMAL = 12_u32
  DEVPROP_TYPE_GUID = 13_u32
  DEVPROP_TYPE_CURRENCY = 14_u32
  DEVPROP_TYPE_DATE = 15_u32
  DEVPROP_TYPE_FILETIME = 16_u32
  DEVPROP_TYPE_BOOLEAN = 17_u32
  DEVPROP_TYPE_STRING = 18_u32
  DEVPROP_TYPE_SECURITY_DESCRIPTOR = 19_u32
  DEVPROP_TYPE_SECURITY_DESCRIPTOR_STRING = 20_u32
  DEVPROP_TYPE_DEVPROPKEY = 21_u32
  DEVPROP_TYPE_DEVPROPTYPE = 22_u32
  DEVPROP_TYPE_ERROR = 23_u32
  DEVPROP_TYPE_NTSTATUS = 24_u32
  DEVPROP_TYPE_STRING_INDIRECT = 25_u32
  MAX_DEVPROP_TYPE = 25_u32
  MAX_DEVPROP_TYPEMOD = 8192_u32
  DEVPROP_MASK_TYPE = 4095_u32
  DEVPROP_MASK_TYPEMOD = 61440_u32
  DEVPROPID_FIRST_USABLE = 2_u32

  enum DEVPROPSTORE
    DEVPROP_STORE_SYSTEM = 0_i32
    DEVPROP_STORE_USER = 1_i32
  end

  @[Extern]
  struct DEVPROPKEY
    property fmtid : LibC::GUID
    property pid : UInt32
    def initialize(@fmtid : LibC::GUID, @pid : UInt32)
    end
  end

  @[Extern]
  struct DEVPROPCOMPKEY
    property key : Win32cr::Devices::Properties::DEVPROPKEY
    property store : Win32cr::Devices::Properties::DEVPROPSTORE
    property locale_name : Win32cr::Foundation::PWSTR
    def initialize(@key : Win32cr::Devices::Properties::DEVPROPKEY, @store : Win32cr::Devices::Properties::DEVPROPSTORE, @locale_name : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct DEVPROPERTY
    property comp_key : Win32cr::Devices::Properties::DEVPROPCOMPKEY
    property type__ : UInt32
    property buffer_size : UInt32
    property buffer : Void*
    def initialize(@comp_key : Win32cr::Devices::Properties::DEVPROPCOMPKEY, @type__ : UInt32, @buffer_size : UInt32, @buffer : Void*)
    end
  end

end