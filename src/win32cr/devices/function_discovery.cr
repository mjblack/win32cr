require "./../system/com.cr"
require "./../foundation.cr"
require "./../system/com/structured_storage.cr"
require "./../ui/shell/properties_system.cr"

module Win32cr::Devices::FunctionDiscovery
  FD_EVENTID_PRIVATE = 100_u32
  FD_EVENTID = 1000_u32
  FD_EVENTID_SEARCHCOMPLETE = 1000_u32
  FD_EVENTID_ASYNCTHREADEXIT = 1001_u32
  FD_EVENTID_SEARCHSTART = 1002_u32
  FD_EVENTID_IPADDRESSCHANGE = 1003_u32
  FD_EVENTID_QUERYREFRESH = 1004_u32
  SID_PnpProvider = "8101368e-cabb-4426-acff-96c410812000"
  SID_UPnPActivator = "0d0d66eb-cf74-4164-b52f-08344672dd46"
  SID_EnumInterface = "40eab0b9-4d7f-4b53-a334-1581dd9041f4"
  SID_PNPXPropertyStore = "a86530b1-542f-439f-b71c-b0756b13677a"
  SID_PNPXAssociation = "cee8ccc9-4f6b-4469-a235-5a22869eef03"
  SID_PNPXServiceCollection = "439e80ee-a217-4712-9fa6-deabd9c2a727"
  SID_FDPairingHandler = "383b69fa-5486-49da-91f5-d63c24c8e9d0"
  SID_EnumDeviceFunction = "13e0e9e2-c3fa-4e3c-906e-64502fa4dc95"
  SID_UnpairProvider = "89a502fc-857b-4698-a0b7-027192002f9e"
  SID_DeviceDisplayStatusManager = "f59aa553-8309-46ca-9736-1ac3c62d6031"
  SID_FunctionDiscoveryProviderRefresh = "2b4cbdc9-31c4-40d4-a62d-772aa174ed52"
  SID_UninstallDeviceFunction = "c920566e-5671-4496-8025-bf0b89bd44cd"
  PKEY_FunctionInstance = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8c0c253_u32, 0xa154_u16, 0x4746_u16, StaticArray[0x90_u8, 0x5_u8, 0x82_u8, 0xde_u8, 0x53_u8, 0x17_u8, 0x14_u8, 0x8b_u8]), 1_u32)
  FMTID_FD = "904b03a2-471d-423c-a584-f3483238a146"
  FD_Visibility_Default = 0_u32
  FD_Visibility_Hidden = 1_u32
  FMTID_Device = "78c34fc8-104a-4aca-9ea4-524d52996e57"
  FMTID_DeviceInterface = "53808008-07bb-4661-bc3c-b5953e708560"
  PKEY_DeviceDisplay_Address = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 51_u32)
  PKEY_DeviceDisplay_DiscoveryMethod = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 52_u32)
  PKEY_DeviceDisplay_IsEncrypted = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 53_u32)
  PKEY_DeviceDisplay_IsAuthenticated = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 54_u32)
  PKEY_DeviceDisplay_IsConnected = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 55_u32)
  PKEY_DeviceDisplay_IsPaired = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 56_u32)
  PKEY_DeviceDisplay_Icon = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 57_u32)
  PKEY_DeviceDisplay_Version = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 65_u32)
  PKEY_DeviceDisplay_Last_Seen = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 66_u32)
  PKEY_DeviceDisplay_Last_Connected = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 67_u32)
  PKEY_DeviceDisplay_IsShowInDisconnectedState = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 68_u32)
  PKEY_DeviceDisplay_IsLocalMachine = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 70_u32)
  PKEY_DeviceDisplay_MetadataPath = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 71_u32)
  PKEY_DeviceDisplay_IsMetadataSearchInProgress = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 72_u32)
  PKEY_DeviceDisplay_MetadataChecksum = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 73_u32)
  PKEY_DeviceDisplay_IsNotInterestingForDisplay = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 74_u32)
  PKEY_DeviceDisplay_LaunchDeviceStageOnDeviceConnect = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 76_u32)
  PKEY_DeviceDisplay_LaunchDeviceStageFromExplorer = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 77_u32)
  PKEY_DeviceDisplay_BaselineExperienceId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 78_u32)
  PKEY_DeviceDisplay_IsDeviceUniquelyIdentifiable = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 79_u32)
  PKEY_DeviceDisplay_AssociationArray = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 80_u32)
  PKEY_DeviceDisplay_DeviceDescription1 = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 81_u32)
  PKEY_DeviceDisplay_DeviceDescription2 = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 82_u32)
  PKEY_DeviceDisplay_IsNotWorkingProperly = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 83_u32)
  PKEY_DeviceDisplay_IsSharedDevice = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 84_u32)
  PKEY_DeviceDisplay_IsNetworkDevice = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 85_u32)
  PKEY_DeviceDisplay_IsDefaultDevice = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 86_u32)
  PKEY_DeviceDisplay_MetadataCabinet = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 87_u32)
  PKEY_DeviceDisplay_RequiresPairingElevation = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 88_u32)
  PKEY_DeviceDisplay_ExperienceId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 89_u32)
  PKEY_DeviceDisplay_Category = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 90_u32)
  PKEY_DeviceDisplay_Category_Desc_Singular = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 91_u32)
  PKEY_DeviceDisplay_Category_Desc_Plural = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 92_u32)
  PKEY_DeviceDisplay_Category_Icon = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 93_u32)
  PKEY_DeviceDisplay_CategoryGroup_Desc = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 94_u32)
  PKEY_DeviceDisplay_CategoryGroup_Icon = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 95_u32)
  PKEY_DeviceDisplay_PrimaryCategory = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 97_u32)
  PKEY_DeviceDisplay_UnpairUninstall = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 98_u32)
  PKEY_DeviceDisplay_RequiresUninstallElevation = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 99_u32)
  PKEY_DeviceDisplay_DeviceFunctionSubRank = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 100_u32)
  PKEY_DeviceDisplay_AlwaysShowDeviceAsConnected = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 101_u32)
  PKEY_DeviceDisplay_FriendlyName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 12288_u32)
  PKEY_DeviceDisplay_Manufacturer = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 8192_u32)
  PKEY_DeviceDisplay_ModelName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 8194_u32)
  PKEY_DeviceDisplay_ModelNumber = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 8195_u32)
  PKEY_DeviceDisplay_InstallInProgress = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x83da6326_u32, 0x97a6_u16, 0x4088_u16, StaticArray[0x94_u8, 0x53_u8, 0xa1_u8, 0x92_u8, 0x3f_u8, 0x57_u8, 0x3b_u8, 0x29_u8]), 9_u32)
  FMTID_Pairing = "8807cae6-7db6-4f10-8ee4-435eaa1392bc"
  PKEY_Pairing_ListItemText = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8807cae6_u32, 0x7db6_u16, 0x4f10_u16, StaticArray[0x8e_u8, 0xe4_u8, 0x43_u8, 0x5e_u8, 0xaa_u8, 0x13_u8, 0x92_u8, 0xbc_u8]), 1_u32)
  PKEY_Pairing_ListItemDescription = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8807cae6_u32, 0x7db6_u16, 0x4f10_u16, StaticArray[0x8e_u8, 0xe4_u8, 0x43_u8, 0x5e_u8, 0xaa_u8, 0x13_u8, 0x92_u8, 0xbc_u8]), 2_u32)
  PKEY_Pairing_ListItemIcon = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8807cae6_u32, 0x7db6_u16, 0x4f10_u16, StaticArray[0x8e_u8, 0xe4_u8, 0x43_u8, 0x5e_u8, 0xaa_u8, 0x13_u8, 0x92_u8, 0xbc_u8]), 3_u32)
  PKEY_Pairing_ListItemDefault = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8807cae6_u32, 0x7db6_u16, 0x4f10_u16, StaticArray[0x8e_u8, 0xe4_u8, 0x43_u8, 0x5e_u8, 0xaa_u8, 0x13_u8, 0x92_u8, 0xbc_u8]), 4_u32)
  PKEY_Pairing_IsWifiOnlyDevice = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8807cae6_u32, 0x7db6_u16, 0x4f10_u16, StaticArray[0x8e_u8, 0xe4_u8, 0x43_u8, 0x5e_u8, 0xaa_u8, 0x13_u8, 0x92_u8, 0xbc_u8]), 16_u32)
  DEVICEDISPLAY_DISCOVERYMETHOD_BLUETOOTH = "Bluetooth"
  DEVICEDISPLAY_DISCOVERYMETHOD_BLUETOOTH_LE = "Bluetooth Low Energy"
  DEVICEDISPLAY_DISCOVERYMETHOD_NETBIOS = "NetBIOS"
  DEVICEDISPLAY_DISCOVERYMETHOD_AD_PRINTER = "Published Printer"
  DEVICEDISPLAY_DISCOVERYMETHOD_PNP = "PnP"
  DEVICEDISPLAY_DISCOVERYMETHOD_UPNP = "UPnP"
  DEVICEDISPLAY_DISCOVERYMETHOD_WSD = "WSD"
  DEVICEDISPLAY_DISCOVERYMETHOD_WUSB = "WUSB"
  DEVICEDISPLAY_DISCOVERYMETHOD_WFD = "WiFiDirect"
  DEVICEDISPLAY_DISCOVERYMETHOD_ASP_INFRA = "AspInfra"
  PKEY_Device_BIOSVersion = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xeaee7f1d_u32, 0x6a33_u16, 0x44d1_u16, StaticArray[0x94_u8, 0x41_u8, 0x5f_u8, 0x46_u8, 0xde_u8, 0xf2_u8, 0x31_u8, 0x98_u8]), 9_u32)
  FMTID_WSD = "92506491-ff95-4724-a05a-5b81885a7c92"
  FMTID_PNPX = "656a3bb3-ecc0-43fd-8477-4ae0404a96cd"
  PKEY_PNPX_GlobalIdentity = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 4096_u32)
  PKEY_PNPX_Types = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 4097_u32)
  PKEY_PNPX_Scopes = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 4098_u32)
  PKEY_PNPX_XAddrs = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 4099_u32)
  PKEY_PNPX_MetadataVersion = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 4100_u32)
  PKEY_PNPX_ID = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 4101_u32)
  PKEY_PNPX_RemoteAddress = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 4102_u32)
  PKEY_PNPX_RootProxy = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 4103_u32)
  PKEY_PNPX_ManufacturerUrl = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 8193_u32)
  PKEY_PNPX_ModelUrl = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 8196_u32)
  PKEY_PNPX_Upc = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 8197_u32)
  PKEY_PNPX_PresentationUrl = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 8198_u32)
  PKEY_PNPX_FirmwareVersion = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 12289_u32)
  PKEY_PNPX_SerialNumber = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 12290_u32)
  PKEY_PNPX_DeviceCategory = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 12292_u32)
  PKEY_PNPX_SecureChannel = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 28673_u32)
  PKEY_PNPX_CompactSignature = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 28674_u32)
  PKEY_PNPX_DeviceCertHash = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 28675_u32)
  PNPX_DEVICECATEGORY_COMPUTER = "Computers"
  PNPX_DEVICECATEGORY_INPUTDEVICE = "Input"
  PNPX_DEVICECATEGORY_PRINTER = "Printers"
  PNPX_DEVICECATEGORY_SCANNER = "Scanners"
  PNPX_DEVICECATEGORY_FAX = "FAX"
  PNPX_DEVICECATEGORY_MFP = "MFP"
  PNPX_DEVICECATEGORY_CAMERA = "Cameras"
  PNPX_DEVICECATEGORY_STORAGE = "Storage"
  PNPX_DEVICECATEGORY_NETWORK_INFRASTRUCTURE = "NetworkInfrastructure"
  PNPX_DEVICECATEGORY_DISPLAYS = "Displays"
  PNPX_DEVICECATEGORY_MULTIMEDIA_DEVICE = "MediaDevices"
  PNPX_DEVICECATEGORY_GAMING_DEVICE = "Gaming"
  PNPX_DEVICECATEGORY_TELEPHONE = "Phones"
  PNPX_DEVICECATEGORY_HOME_AUTOMATION_SYSTEM = "HomeAutomation"
  PNPX_DEVICECATEGORY_HOME_SECURITY_SYSTEM = "HomeSecurity"
  PNPX_DEVICECATEGORY_OTHER = "Other"
  PKEY_PNPX_DeviceCategory_Desc = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 12293_u32)
  PKEY_PNPX_Category_Desc_NonPlural = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 12304_u32)
  PKEY_PNPX_PhysicalAddress = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 12294_u32)
  PKEY_PNPX_NetworkInterfaceLuid = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 12295_u32)
  PKEY_PNPX_NetworkInterfaceGuid = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 12296_u32)
  PKEY_PNPX_IpAddress = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 12297_u32)
  PKEY_PNPX_ServiceAddress = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 16384_u32)
  PKEY_PNPX_ServiceId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 16385_u32)
  PKEY_PNPX_ServiceTypes = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 16386_u32)
  PKEY_PNPX_ServiceControlUrl = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 16388_u32)
  PKEY_PNPX_ServiceDescUrl = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 16389_u32)
  PKEY_PNPX_ServiceEventSubUrl = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 16390_u32)
  PKEY_PNPX_DomainName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 20480_u32)
  PKEY_PNPX_ShareName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 20482_u32)
  PKEY_SSDP_AltLocationInfo = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 24576_u32)
  PKEY_SSDP_DevLifeTime = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 24577_u32)
  PKEY_SSDP_NetworkInterface = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 24578_u32)
  FMTID_PNPXDynamicProperty = "4fc5077e-b686-44be-93e3-86cafe368ccd"
  PKEY_PNPX_Installable = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4fc5077e_u32, 0xb686_u16, 0x44be_u16, StaticArray[0x93_u8, 0xe3_u8, 0x86_u8, 0xca_u8, 0xfe_u8, 0x36_u8, 0x8c_u8, 0xcd_u8]), 1_u32)
  PKEY_PNPX_Associated = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4fc5077e_u32, 0xb686_u16, 0x44be_u16, StaticArray[0x93_u8, 0xe3_u8, 0x86_u8, 0xca_u8, 0xfe_u8, 0x36_u8, 0x8c_u8, 0xcd_u8]), 2_u32)
  PKEY_PNPX_CompatibleTypes = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4fc5077e_u32, 0xb686_u16, 0x44be_u16, StaticArray[0x93_u8, 0xe3_u8, 0x86_u8, 0xca_u8, 0xfe_u8, 0x36_u8, 0x8c_u8, 0xcd_u8]), 3_u32)
  PKEY_PNPX_InstallState = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4fc5077e_u32, 0xb686_u16, 0x44be_u16, StaticArray[0x93_u8, 0xe3_u8, 0x86_u8, 0xca_u8, 0xfe_u8, 0x36_u8, 0x8c_u8, 0xcd_u8]), 4_u32)
  PNPX_INSTALLSTATE_NOTINSTALLED = 0_u32
  PNPX_INSTALLSTATE_INSTALLED = 1_u32
  PNPX_INSTALLSTATE_INSTALLING = 2_u32
  PNPX_INSTALLSTATE_FAILED = 3_u32
  PKEY_PNPX_Removable = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 28672_u32)
  PKEY_PNPX_IPBusEnumerated = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 28688_u32)
  PKEY_WNET_Scope = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xdebda43a_u32, 0x37b3_u16, 0x4383_u16, StaticArray[0x91_u8, 0xe7_u8, 0x44_u8, 0x98_u8, 0xda_u8, 0x29_u8, 0x95_u8, 0xab_u8]), 1_u32)
  PKEY_WNET_Type = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xdebda43a_u32, 0x37b3_u16, 0x4383_u16, StaticArray[0x91_u8, 0xe7_u8, 0x44_u8, 0x98_u8, 0xda_u8, 0x29_u8, 0x95_u8, 0xab_u8]), 2_u32)
  PKEY_WNET_DisplayType = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xdebda43a_u32, 0x37b3_u16, 0x4383_u16, StaticArray[0x91_u8, 0xe7_u8, 0x44_u8, 0x98_u8, 0xda_u8, 0x29_u8, 0x95_u8, 0xab_u8]), 3_u32)
  PKEY_WNET_Usage = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xdebda43a_u32, 0x37b3_u16, 0x4383_u16, StaticArray[0x91_u8, 0xe7_u8, 0x44_u8, 0x98_u8, 0xda_u8, 0x29_u8, 0x95_u8, 0xab_u8]), 4_u32)
  PKEY_WNET_LocalName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xdebda43a_u32, 0x37b3_u16, 0x4383_u16, StaticArray[0x91_u8, 0xe7_u8, 0x44_u8, 0x98_u8, 0xda_u8, 0x29_u8, 0x95_u8, 0xab_u8]), 5_u32)
  PKEY_WNET_RemoteName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xdebda43a_u32, 0x37b3_u16, 0x4383_u16, StaticArray[0x91_u8, 0xe7_u8, 0x44_u8, 0x98_u8, 0xda_u8, 0x29_u8, 0x95_u8, 0xab_u8]), 6_u32)
  PKEY_WNET_Comment = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xdebda43a_u32, 0x37b3_u16, 0x4383_u16, StaticArray[0x91_u8, 0xe7_u8, 0x44_u8, 0x98_u8, 0xda_u8, 0x29_u8, 0x95_u8, 0xab_u8]), 7_u32)
  PKEY_WNET_Provider = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xdebda43a_u32, 0x37b3_u16, 0x4383_u16, StaticArray[0x91_u8, 0xe7_u8, 0x44_u8, 0x98_u8, 0xda_u8, 0x29_u8, 0x95_u8, 0xab_u8]), 8_u32)
  PKEY_WCN_Version = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x88190b80_u32, 0x4684_u16, 0x11da_u16, StaticArray[0xa2_u8, 0x6a_u8, 0x0_u8, 0x2_u8, 0xb3_u8, 0x98_u8, 0x8e_u8, 0x81_u8]), 1_u32)
  PKEY_WCN_RequestType = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x88190b81_u32, 0x4684_u16, 0x11da_u16, StaticArray[0xa2_u8, 0x6a_u8, 0x0_u8, 0x2_u8, 0xb3_u8, 0x98_u8, 0x8e_u8, 0x81_u8]), 2_u32)
  PKEY_WCN_AuthType = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x88190b82_u32, 0x4684_u16, 0x11da_u16, StaticArray[0xa2_u8, 0x6a_u8, 0x0_u8, 0x2_u8, 0xb3_u8, 0x98_u8, 0x8e_u8, 0x81_u8]), 3_u32)
  PKEY_WCN_EncryptType = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x88190b83_u32, 0x4684_u16, 0x11da_u16, StaticArray[0xa2_u8, 0x6a_u8, 0x0_u8, 0x2_u8, 0xb3_u8, 0x98_u8, 0x8e_u8, 0x81_u8]), 4_u32)
  PKEY_WCN_ConnType = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x88190b84_u32, 0x4684_u16, 0x11da_u16, StaticArray[0xa2_u8, 0x6a_u8, 0x0_u8, 0x2_u8, 0xb3_u8, 0x98_u8, 0x8e_u8, 0x81_u8]), 5_u32)
  PKEY_WCN_ConfigMethods = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x88190b85_u32, 0x4684_u16, 0x11da_u16, StaticArray[0xa2_u8, 0x6a_u8, 0x0_u8, 0x2_u8, 0xb3_u8, 0x98_u8, 0x8e_u8, 0x81_u8]), 6_u32)
  PKEY_WCN_RfBand = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x88190b87_u32, 0x4684_u16, 0x11da_u16, StaticArray[0xa2_u8, 0x6a_u8, 0x0_u8, 0x2_u8, 0xb3_u8, 0x98_u8, 0x8e_u8, 0x81_u8]), 8_u32)
  PKEY_WCN_AssocState = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x88190b88_u32, 0x4684_u16, 0x11da_u16, StaticArray[0xa2_u8, 0x6a_u8, 0x0_u8, 0x2_u8, 0xb3_u8, 0x98_u8, 0x8e_u8, 0x81_u8]), 9_u32)
  PKEY_WCN_ConfigError = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x88190b89_u32, 0x4684_u16, 0x11da_u16, StaticArray[0xa2_u8, 0x6a_u8, 0x0_u8, 0x2_u8, 0xb3_u8, 0x98_u8, 0x8e_u8, 0x81_u8]), 10_u32)
  PKEY_WCN_ConfigState = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x88190b89_u32, 0x4684_u16, 0x11da_u16, StaticArray[0xa2_u8, 0x6a_u8, 0x0_u8, 0x2_u8, 0xb3_u8, 0x98_u8, 0x8e_u8, 0x81_u8]), 11_u32)
  PKEY_WCN_DevicePasswordId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x88190b89_u32, 0x4684_u16, 0x11da_u16, StaticArray[0xa2_u8, 0x6a_u8, 0x0_u8, 0x2_u8, 0xb3_u8, 0x98_u8, 0x8e_u8, 0x81_u8]), 12_u32)
  PKEY_WCN_OSVersion = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x88190b89_u32, 0x4684_u16, 0x11da_u16, StaticArray[0xa2_u8, 0x6a_u8, 0x0_u8, 0x2_u8, 0xb3_u8, 0x98_u8, 0x8e_u8, 0x81_u8]), 13_u32)
  PKEY_WCN_VendorExtension = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x88190b8a_u32, 0x4684_u16, 0x11da_u16, StaticArray[0xa2_u8, 0x6a_u8, 0x0_u8, 0x2_u8, 0xb3_u8, 0x98_u8, 0x8e_u8, 0x81_u8]), 14_u32)
  PKEY_WCN_RegistrarType = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x88190b8b_u32, 0x4684_u16, 0x11da_u16, StaticArray[0xa2_u8, 0x6a_u8, 0x0_u8, 0x2_u8, 0xb3_u8, 0x98_u8, 0x8e_u8, 0x81_u8]), 15_u32)
  PKEY_Hardware_Devinst = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x5eaf3ef2_u32, 0xe0ca_u16, 0x4598_u16, StaticArray[0xbf_u8, 0x6_u8, 0x71_u8, 0xed_u8, 0x1d_u8, 0x9d_u8, 0xd9_u8, 0x53_u8]), 4097_u32)
  PKEY_Hardware_DisplayAttribute = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x5eaf3ef2_u32, 0xe0ca_u16, 0x4598_u16, StaticArray[0xbf_u8, 0x6_u8, 0x71_u8, 0xed_u8, 0x1d_u8, 0x9d_u8, 0xd9_u8, 0x53_u8]), 5_u32)
  PKEY_Hardware_DriverDate = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x5eaf3ef2_u32, 0xe0ca_u16, 0x4598_u16, StaticArray[0xbf_u8, 0x6_u8, 0x71_u8, 0xed_u8, 0x1d_u8, 0x9d_u8, 0xd9_u8, 0x53_u8]), 11_u32)
  PKEY_Hardware_DriverProvider = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x5eaf3ef2_u32, 0xe0ca_u16, 0x4598_u16, StaticArray[0xbf_u8, 0x6_u8, 0x71_u8, 0xed_u8, 0x1d_u8, 0x9d_u8, 0xd9_u8, 0x53_u8]), 10_u32)
  PKEY_Hardware_DriverVersion = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x5eaf3ef2_u32, 0xe0ca_u16, 0x4598_u16, StaticArray[0xbf_u8, 0x6_u8, 0x71_u8, 0xed_u8, 0x1d_u8, 0x9d_u8, 0xd9_u8, 0x53_u8]), 9_u32)
  PKEY_Hardware_Function = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x5eaf3ef2_u32, 0xe0ca_u16, 0x4598_u16, StaticArray[0xbf_u8, 0x6_u8, 0x71_u8, 0xed_u8, 0x1d_u8, 0x9d_u8, 0xd9_u8, 0x53_u8]), 4099_u32)
  PKEY_Hardware_Icon = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x5eaf3ef2_u32, 0xe0ca_u16, 0x4598_u16, StaticArray[0xbf_u8, 0x6_u8, 0x71_u8, 0xed_u8, 0x1d_u8, 0x9d_u8, 0xd9_u8, 0x53_u8]), 3_u32)
  PKEY_Hardware_Image = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x5eaf3ef2_u32, 0xe0ca_u16, 0x4598_u16, StaticArray[0xbf_u8, 0x6_u8, 0x71_u8, 0xed_u8, 0x1d_u8, 0x9d_u8, 0xd9_u8, 0x53_u8]), 4098_u32)
  PKEY_Hardware_Manufacturer = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x5eaf3ef2_u32, 0xe0ca_u16, 0x4598_u16, StaticArray[0xbf_u8, 0x6_u8, 0x71_u8, 0xed_u8, 0x1d_u8, 0x9d_u8, 0xd9_u8, 0x53_u8]), 6_u32)
  PKEY_Hardware_Model = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x5eaf3ef2_u32, 0xe0ca_u16, 0x4598_u16, StaticArray[0xbf_u8, 0x6_u8, 0x71_u8, 0xed_u8, 0x1d_u8, 0x9d_u8, 0xd9_u8, 0x53_u8]), 7_u32)
  PKEY_Hardware_Name = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x5eaf3ef2_u32, 0xe0ca_u16, 0x4598_u16, StaticArray[0xbf_u8, 0x6_u8, 0x71_u8, 0xed_u8, 0x1d_u8, 0x9d_u8, 0xd9_u8, 0x53_u8]), 2_u32)
  PKEY_Hardware_SerialNumber = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x5eaf3ef2_u32, 0xe0ca_u16, 0x4598_u16, StaticArray[0xbf_u8, 0x6_u8, 0x71_u8, 0xed_u8, 0x1d_u8, 0x9d_u8, 0xd9_u8, 0x53_u8]), 8_u32)
  PKEY_Hardware_ShellAttributes = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x5eaf3ef2_u32, 0xe0ca_u16, 0x4598_u16, StaticArray[0xbf_u8, 0x6_u8, 0x71_u8, 0xed_u8, 0x1d_u8, 0x9d_u8, 0xd9_u8, 0x53_u8]), 4100_u32)
  PKEY_Hardware_Status = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x5eaf3ef2_u32, 0xe0ca_u16, 0x4598_u16, StaticArray[0xbf_u8, 0x6_u8, 0x71_u8, 0xed_u8, 0x1d_u8, 0x9d_u8, 0xd9_u8, 0x53_u8]), 4096_u32)
  PKEY_NAME = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xb725f130_u32, 0x47ef_u16, 0x101a_u16, StaticArray[0xa5_u8, 0xf1_u8, 0x2_u8, 0x60_u8, 0x8c_u8, 0x9e_u8, 0xeb_u8, 0xac_u8]), 10_u32)
  PKEY_Device_DeviceDesc = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 2_u32)
  PKEY_Device_HardwareIds = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 3_u32)
  PKEY_Device_CompatibleIds = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 4_u32)
  PKEY_Device_Service = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 6_u32)
  PKEY_Device_Class = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 9_u32)
  PKEY_Device_ClassGuid = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 10_u32)
  PKEY_Device_Driver = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 11_u32)
  PKEY_Device_ConfigFlags = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 12_u32)
  PKEY_Device_Manufacturer = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 13_u32)
  PKEY_Device_FriendlyName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 14_u32)
  PKEY_Device_LocationInfo = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 15_u32)
  PKEY_Device_PDOName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 16_u32)
  PKEY_Device_Capabilities = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 17_u32)
  PKEY_Device_UINumber = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 18_u32)
  PKEY_Device_UpperFilters = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 19_u32)
  PKEY_Device_LowerFilters = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 20_u32)
  PKEY_Device_BusTypeGuid = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 21_u32)
  PKEY_Device_LegacyBusType = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 22_u32)
  PKEY_Device_BusNumber = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 23_u32)
  PKEY_Device_EnumeratorName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 24_u32)
  PKEY_Device_Security = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 25_u32)
  PKEY_Device_SecuritySDS = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 26_u32)
  PKEY_Device_DevType = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 27_u32)
  PKEY_Device_Exclusive = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 28_u32)
  PKEY_Device_Characteristics = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 29_u32)
  PKEY_Device_Address = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 30_u32)
  PKEY_Device_UINumberDescFormat = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 31_u32)
  PKEY_Device_PowerData = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 32_u32)
  PKEY_Device_RemovalPolicy = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 33_u32)
  PKEY_Device_RemovalPolicyDefault = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 34_u32)
  PKEY_Device_RemovalPolicyOverride = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 35_u32)
  PKEY_Device_InstallState = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 36_u32)
  PKEY_Device_LocationPaths = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 37_u32)
  PKEY_Device_BaseContainerId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 38_u32)
  PKEY_Device_DevNodeStatus = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4340a6c5_u32, 0x93fa_u16, 0x4706_u16, StaticArray[0x97_u8, 0x2c_u8, 0x7b_u8, 0x64_u8, 0x80_u8, 0x8_u8, 0xa5_u8, 0xa7_u8]), 2_u32)
  PKEY_Device_ProblemCode = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4340a6c5_u32, 0x93fa_u16, 0x4706_u16, StaticArray[0x97_u8, 0x2c_u8, 0x7b_u8, 0x64_u8, 0x80_u8, 0x8_u8, 0xa5_u8, 0xa7_u8]), 3_u32)
  PKEY_Device_EjectionRelations = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4340a6c5_u32, 0x93fa_u16, 0x4706_u16, StaticArray[0x97_u8, 0x2c_u8, 0x7b_u8, 0x64_u8, 0x80_u8, 0x8_u8, 0xa5_u8, 0xa7_u8]), 4_u32)
  PKEY_Device_RemovalRelations = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4340a6c5_u32, 0x93fa_u16, 0x4706_u16, StaticArray[0x97_u8, 0x2c_u8, 0x7b_u8, 0x64_u8, 0x80_u8, 0x8_u8, 0xa5_u8, 0xa7_u8]), 5_u32)
  PKEY_Device_PowerRelations = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4340a6c5_u32, 0x93fa_u16, 0x4706_u16, StaticArray[0x97_u8, 0x2c_u8, 0x7b_u8, 0x64_u8, 0x80_u8, 0x8_u8, 0xa5_u8, 0xa7_u8]), 6_u32)
  PKEY_Device_BusRelations = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4340a6c5_u32, 0x93fa_u16, 0x4706_u16, StaticArray[0x97_u8, 0x2c_u8, 0x7b_u8, 0x64_u8, 0x80_u8, 0x8_u8, 0xa5_u8, 0xa7_u8]), 7_u32)
  PKEY_Device_Parent = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4340a6c5_u32, 0x93fa_u16, 0x4706_u16, StaticArray[0x97_u8, 0x2c_u8, 0x7b_u8, 0x64_u8, 0x80_u8, 0x8_u8, 0xa5_u8, 0xa7_u8]), 8_u32)
  PKEY_Device_Children = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4340a6c5_u32, 0x93fa_u16, 0x4706_u16, StaticArray[0x97_u8, 0x2c_u8, 0x7b_u8, 0x64_u8, 0x80_u8, 0x8_u8, 0xa5_u8, 0xa7_u8]), 9_u32)
  PKEY_Device_Siblings = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4340a6c5_u32, 0x93fa_u16, 0x4706_u16, StaticArray[0x97_u8, 0x2c_u8, 0x7b_u8, 0x64_u8, 0x80_u8, 0x8_u8, 0xa5_u8, 0xa7_u8]), 10_u32)
  PKEY_Device_TransportRelations = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4340a6c5_u32, 0x93fa_u16, 0x4706_u16, StaticArray[0x97_u8, 0x2c_u8, 0x7b_u8, 0x64_u8, 0x80_u8, 0x8_u8, 0xa5_u8, 0xa7_u8]), 11_u32)
  PKEY_Device_Reported = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x80497100_u32, 0x8c73_u16, 0x48b9_u16, StaticArray[0xaa_u8, 0xd9_u8, 0xce_u8, 0x38_u8, 0x7e_u8, 0x19_u8, 0xc5_u8, 0x6e_u8]), 2_u32)
  PKEY_Device_Legacy = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x80497100_u32, 0x8c73_u16, 0x48b9_u16, StaticArray[0xaa_u8, 0xd9_u8, 0xce_u8, 0x38_u8, 0x7e_u8, 0x19_u8, 0xc5_u8, 0x6e_u8]), 3_u32)
  PKEY_Device_InstanceId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 256_u32)
  PKEY_Device_ContainerId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x8c7ed206_u32, 0x3f8a_u16, 0x4827_u16, StaticArray[0xb3_u8, 0xab_u8, 0xae_u8, 0x9e_u8, 0x1f_u8, 0xae_u8, 0xfc_u8, 0x6c_u8]), 2_u32)
  PKEY_Device_ModelId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x80d81ea6_u32, 0x7473_u16, 0x4b0c_u16, StaticArray[0x82_u8, 0x16_u8, 0xef_u8, 0xc1_u8, 0x1a_u8, 0x2c_u8, 0x4c_u8, 0x8b_u8]), 2_u32)
  PKEY_Device_FriendlyNameAttributes = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x80d81ea6_u32, 0x7473_u16, 0x4b0c_u16, StaticArray[0x82_u8, 0x16_u8, 0xef_u8, 0xc1_u8, 0x1a_u8, 0x2c_u8, 0x4c_u8, 0x8b_u8]), 3_u32)
  PKEY_Device_ManufacturerAttributes = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x80d81ea6_u32, 0x7473_u16, 0x4b0c_u16, StaticArray[0x82_u8, 0x16_u8, 0xef_u8, 0xc1_u8, 0x1a_u8, 0x2c_u8, 0x4c_u8, 0x8b_u8]), 4_u32)
  PKEY_Device_PresenceNotForDevice = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x80d81ea6_u32, 0x7473_u16, 0x4b0c_u16, StaticArray[0x82_u8, 0x16_u8, 0xef_u8, 0xc1_u8, 0x1a_u8, 0x2c_u8, 0x4c_u8, 0x8b_u8]), 5_u32)
  PKEY_Device_SignalStrength = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x80d81ea6_u32, 0x7473_u16, 0x4b0c_u16, StaticArray[0x82_u8, 0x16_u8, 0xef_u8, 0xc1_u8, 0x1a_u8, 0x2c_u8, 0x4c_u8, 0x8b_u8]), 6_u32)
  PKEY_Device_IsAssociateableByUserAction = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x80d81ea6_u32, 0x7473_u16, 0x4b0c_u16, StaticArray[0x82_u8, 0x16_u8, 0xef_u8, 0xc1_u8, 0x1a_u8, 0x2c_u8, 0x4c_u8, 0x8b_u8]), 7_u32)
  PKEY_Numa_Proximity_Domain = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x540b947e_u32, 0x8b40_u16, 0x45bc_u16, StaticArray[0xa8_u8, 0xa2_u8, 0x6a_u8, 0xb_u8, 0x89_u8, 0x4c_u8, 0xbd_u8, 0xa2_u8]), 1_u32)
  PKEY_Device_DHP_Rebalance_Policy = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x540b947e_u32, 0x8b40_u16, 0x45bc_u16, StaticArray[0xa8_u8, 0xa2_u8, 0x6a_u8, 0xb_u8, 0x89_u8, 0x4c_u8, 0xbd_u8, 0xa2_u8]), 2_u32)
  PKEY_Device_Numa_Node = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x540b947e_u32, 0x8b40_u16, 0x45bc_u16, StaticArray[0xa8_u8, 0xa2_u8, 0x6a_u8, 0xb_u8, 0x89_u8, 0x4c_u8, 0xbd_u8, 0xa2_u8]), 3_u32)
  PKEY_Device_BusReportedDeviceDesc = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x540b947e_u32, 0x8b40_u16, 0x45bc_u16, StaticArray[0xa8_u8, 0xa2_u8, 0x6a_u8, 0xb_u8, 0x89_u8, 0x4c_u8, 0xbd_u8, 0xa2_u8]), 4_u32)
  PKEY_Device_InstallInProgress = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x83da6326_u32, 0x97a6_u16, 0x4088_u16, StaticArray[0x94_u8, 0x53_u8, 0xa1_u8, 0x92_u8, 0x3f_u8, 0x57_u8, 0x3b_u8, 0x29_u8]), 9_u32)
  PKEY_Device_DriverDate = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 2_u32)
  PKEY_Device_DriverVersion = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 3_u32)
  PKEY_Device_DriverDesc = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 4_u32)
  PKEY_Device_DriverInfPath = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 5_u32)
  PKEY_Device_DriverInfSection = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 6_u32)
  PKEY_Device_DriverInfSectionExt = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 7_u32)
  PKEY_Device_MatchingDeviceId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 8_u32)
  PKEY_Device_DriverProvider = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 9_u32)
  PKEY_Device_DriverPropPageProvider = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 10_u32)
  PKEY_Device_DriverCoInstallers = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 11_u32)
  PKEY_Device_ResourcePickerTags = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 12_u32)
  PKEY_Device_ResourcePickerExceptions = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 13_u32)
  PKEY_Device_DriverRank = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 14_u32)
  PKEY_Device_DriverLogoLevel = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 15_u32)
  PKEY_Device_NoConnectSound = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 17_u32)
  PKEY_Device_GenericDriverInstalled = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 18_u32)
  PKEY_Device_AdditionalSoftwareRequested = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 19_u32)
  PKEY_Device_SafeRemovalRequired = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xafd97640_u32, 0x86a3_u16, 0x4210_u16, StaticArray[0xb6_u8, 0x7c_u8, 0x28_u8, 0x9c_u8, 0x41_u8, 0xaa_u8, 0xbe_u8, 0x55_u8]), 2_u32)
  PKEY_Device_SafeRemovalRequiredOverride = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xafd97640_u32, 0x86a3_u16, 0x4210_u16, StaticArray[0xb6_u8, 0x7c_u8, 0x28_u8, 0x9c_u8, 0x41_u8, 0xaa_u8, 0xbe_u8, 0x55_u8]), 3_u32)
  PKEY_DrvPkg_Model = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xcf73bb51_u32, 0x3abf_u16, 0x44a2_u16, StaticArray[0x85_u8, 0xe0_u8, 0x9a_u8, 0x3d_u8, 0xc7_u8, 0xa1_u8, 0x21_u8, 0x32_u8]), 2_u32)
  PKEY_DrvPkg_VendorWebSite = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xcf73bb51_u32, 0x3abf_u16, 0x44a2_u16, StaticArray[0x85_u8, 0xe0_u8, 0x9a_u8, 0x3d_u8, 0xc7_u8, 0xa1_u8, 0x21_u8, 0x32_u8]), 3_u32)
  PKEY_DrvPkg_DetailedDescription = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xcf73bb51_u32, 0x3abf_u16, 0x44a2_u16, StaticArray[0x85_u8, 0xe0_u8, 0x9a_u8, 0x3d_u8, 0xc7_u8, 0xa1_u8, 0x21_u8, 0x32_u8]), 4_u32)
  PKEY_DrvPkg_DocumentationLink = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xcf73bb51_u32, 0x3abf_u16, 0x44a2_u16, StaticArray[0x85_u8, 0xe0_u8, 0x9a_u8, 0x3d_u8, 0xc7_u8, 0xa1_u8, 0x21_u8, 0x32_u8]), 5_u32)
  PKEY_DrvPkg_Icon = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xcf73bb51_u32, 0x3abf_u16, 0x44a2_u16, StaticArray[0x85_u8, 0xe0_u8, 0x9a_u8, 0x3d_u8, 0xc7_u8, 0xa1_u8, 0x21_u8, 0x32_u8]), 6_u32)
  PKEY_DrvPkg_BrandingIcon = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0xcf73bb51_u32, 0x3abf_u16, 0x44a2_u16, StaticArray[0x85_u8, 0xe0_u8, 0x9a_u8, 0x3d_u8, 0xc7_u8, 0xa1_u8, 0x21_u8, 0x32_u8]), 7_u32)
  PKEY_DeviceClass_UpperFilters = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4321918b_u32, 0xf69e_u16, 0x470d_u16, StaticArray[0xa5_u8, 0xde_u8, 0x4d_u8, 0x88_u8, 0xc7_u8, 0x5a_u8, 0xd2_u8, 0x4b_u8]), 19_u32)
  PKEY_DeviceClass_LowerFilters = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4321918b_u32, 0xf69e_u16, 0x470d_u16, StaticArray[0xa5_u8, 0xde_u8, 0x4d_u8, 0x88_u8, 0xc7_u8, 0x5a_u8, 0xd2_u8, 0x4b_u8]), 20_u32)
  PKEY_DeviceClass_Security = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4321918b_u32, 0xf69e_u16, 0x470d_u16, StaticArray[0xa5_u8, 0xde_u8, 0x4d_u8, 0x88_u8, 0xc7_u8, 0x5a_u8, 0xd2_u8, 0x4b_u8]), 25_u32)
  PKEY_DeviceClass_SecuritySDS = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4321918b_u32, 0xf69e_u16, 0x470d_u16, StaticArray[0xa5_u8, 0xde_u8, 0x4d_u8, 0x88_u8, 0xc7_u8, 0x5a_u8, 0xd2_u8, 0x4b_u8]), 26_u32)
  PKEY_DeviceClass_DevType = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4321918b_u32, 0xf69e_u16, 0x470d_u16, StaticArray[0xa5_u8, 0xde_u8, 0x4d_u8, 0x88_u8, 0xc7_u8, 0x5a_u8, 0xd2_u8, 0x4b_u8]), 27_u32)
  PKEY_DeviceClass_Exclusive = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4321918b_u32, 0xf69e_u16, 0x470d_u16, StaticArray[0xa5_u8, 0xde_u8, 0x4d_u8, 0x88_u8, 0xc7_u8, 0x5a_u8, 0xd2_u8, 0x4b_u8]), 28_u32)
  PKEY_DeviceClass_Characteristics = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x4321918b_u32, 0xf69e_u16, 0x470d_u16, StaticArray[0xa5_u8, 0xde_u8, 0x4d_u8, 0x88_u8, 0xc7_u8, 0x5a_u8, 0xd2_u8, 0x4b_u8]), 29_u32)
  PKEY_DeviceClass_Name = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x259abffc_u32, 0x50a7_u16, 0x47ce_u16, StaticArray[0xaf_u8, 0x8_u8, 0x68_u8, 0xc9_u8, 0xa7_u8, 0xd7_u8, 0x33_u8, 0x66_u8]), 2_u32)
  PKEY_DeviceClass_ClassName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x259abffc_u32, 0x50a7_u16, 0x47ce_u16, StaticArray[0xaf_u8, 0x8_u8, 0x68_u8, 0xc9_u8, 0xa7_u8, 0xd7_u8, 0x33_u8, 0x66_u8]), 3_u32)
  PKEY_DeviceClass_Icon = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x259abffc_u32, 0x50a7_u16, 0x47ce_u16, StaticArray[0xaf_u8, 0x8_u8, 0x68_u8, 0xc9_u8, 0xa7_u8, 0xd7_u8, 0x33_u8, 0x66_u8]), 4_u32)
  PKEY_DeviceClass_ClassInstaller = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x259abffc_u32, 0x50a7_u16, 0x47ce_u16, StaticArray[0xaf_u8, 0x8_u8, 0x68_u8, 0xc9_u8, 0xa7_u8, 0xd7_u8, 0x33_u8, 0x66_u8]), 5_u32)
  PKEY_DeviceClass_PropPageProvider = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x259abffc_u32, 0x50a7_u16, 0x47ce_u16, StaticArray[0xaf_u8, 0x8_u8, 0x68_u8, 0xc9_u8, 0xa7_u8, 0xd7_u8, 0x33_u8, 0x66_u8]), 6_u32)
  PKEY_DeviceClass_NoInstallClass = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x259abffc_u32, 0x50a7_u16, 0x47ce_u16, StaticArray[0xaf_u8, 0x8_u8, 0x68_u8, 0xc9_u8, 0xa7_u8, 0xd7_u8, 0x33_u8, 0x66_u8]), 7_u32)
  PKEY_DeviceClass_NoDisplayClass = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x259abffc_u32, 0x50a7_u16, 0x47ce_u16, StaticArray[0xaf_u8, 0x8_u8, 0x68_u8, 0xc9_u8, 0xa7_u8, 0xd7_u8, 0x33_u8, 0x66_u8]), 8_u32)
  PKEY_DeviceClass_SilentInstall = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x259abffc_u32, 0x50a7_u16, 0x47ce_u16, StaticArray[0xaf_u8, 0x8_u8, 0x68_u8, 0xc9_u8, 0xa7_u8, 0xd7_u8, 0x33_u8, 0x66_u8]), 9_u32)
  PKEY_DeviceClass_NoUseClass = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x259abffc_u32, 0x50a7_u16, 0x47ce_u16, StaticArray[0xaf_u8, 0x8_u8, 0x68_u8, 0xc9_u8, 0xa7_u8, 0xd7_u8, 0x33_u8, 0x66_u8]), 10_u32)
  PKEY_DeviceClass_DefaultService = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x259abffc_u32, 0x50a7_u16, 0x47ce_u16, StaticArray[0xaf_u8, 0x8_u8, 0x68_u8, 0xc9_u8, 0xa7_u8, 0xd7_u8, 0x33_u8, 0x66_u8]), 11_u32)
  PKEY_DeviceClass_IconPath = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x259abffc_u32, 0x50a7_u16, 0x47ce_u16, StaticArray[0xaf_u8, 0x8_u8, 0x68_u8, 0xc9_u8, 0xa7_u8, 0xd7_u8, 0x33_u8, 0x66_u8]), 12_u32)
  PKEY_DeviceClass_ClassCoInstallers = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x713d1703_u32, 0xa2e2_u16, 0x49f5_u16, StaticArray[0x92_u8, 0x14_u8, 0x56_u8, 0x47_u8, 0x2e_u8, 0xf3_u8, 0xda_u8, 0x5c_u8]), 2_u32)
  PKEY_DeviceInterface_FriendlyName = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x26e516e_u32, 0xb814_u16, 0x414b_u16, StaticArray[0x83_u8, 0xcd_u8, 0x85_u8, 0x6d_u8, 0x6f_u8, 0xef_u8, 0x48_u8, 0x22_u8]), 2_u32)
  PKEY_DeviceInterface_Enabled = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x26e516e_u32, 0xb814_u16, 0x414b_u16, StaticArray[0x83_u8, 0xcd_u8, 0x85_u8, 0x6d_u8, 0x6f_u8, 0xef_u8, 0x48_u8, 0x22_u8]), 3_u32)
  PKEY_DeviceInterface_ClassGuid = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x26e516e_u32, 0xb814_u16, 0x414b_u16, StaticArray[0x83_u8, 0xcd_u8, 0x85_u8, 0x6d_u8, 0x6f_u8, 0xef_u8, 0x48_u8, 0x22_u8]), 4_u32)
  PKEY_DeviceInterfaceClass_DefaultInterface = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x14c83a99_u32, 0xb3f_u16, 0x44b7_u16, StaticArray[0xbe_u8, 0x4c_u8, 0xa1_u8, 0x78_u8, 0xd3_u8, 0x99_u8, 0x5_u8, 0x64_u8]), 2_u32)
  FD_LONGHORN = 1_u32
  FD_SUBKEY = "SOFTWARE\\Microsoft\\Function Discovery\\"
  FCTN_CATEGORY_PNP = "Provider\\Microsoft.Base.PnP"
  FCTN_CATEGORY_REGISTRY = "Provider\\Microsoft.Base.Registry"
  FCTN_CATEGORY_SSDP = "Provider\\Microsoft.Networking.SSDP"
  FCTN_CATEGORY_WSDISCOVERY = "Provider\\Microsoft.Networking.WSD"
  FCTN_CATEGORY_NETBIOS = "Provider\\Microsoft.Networking.Netbios"
  FCTN_CATEGORY_WCN = "Provider\\Microsoft.Networking.WCN"
  FCTN_CATEGORY_PUBLICATION = "Provider\\Microsoft.Base.Publication"
  FCTN_CATEGORY_PNPXASSOCIATION = "Provider\\Microsoft.PnPX.Association"
  FCTN_CATEGORY_BT = "Provider\\Microsoft.Devices.Bluetooth"
  FCTN_CATEGORY_WUSB = "Provider\\Microsoft.Devices.WirelessUSB"
  FCTN_CATEGORY_DEVICEDISPLAYOBJECTS = "Provider\\Microsoft.Base.DeviceDisplayObjects"
  FCTN_CATEGORY_DEVQUERYOBJECTS = "Provider\\Microsoft.Base.DevQueryObjects"
  FCTN_CATEGORY_NETWORKDEVICES = "Layered\\Microsoft.Networking.Devices"
  FCTN_CATEGORY_DEVICES = "Layered\\Microsoft.Base.Devices"
  FCTN_CATEGORY_DEVICEFUNCTIONENUMERATORS = "Layered\\Microsoft.Devices.FunctionEnumerators"
  FCTN_CATEGORY_DEVICEPAIRING = "Layered\\Microsoft.Base.DevicePairing"
  FCTN_SUBCAT_DEVICES_WSDPRINTERS = "WSDPrinters"
  FCTN_SUBCAT_NETWORKDEVICES_SSDP = "SSDP"
  FCTN_SUBCAT_NETWORKDEVICES_WSD = "WSD"
  FCTN_SUBCAT_REG_PUBLICATION = "Publication"
  FCTN_SUBCAT_REG_DIRECTED = "Directed"
  MAX_FDCONSTRAINTNAME_LENGTH = 100_u32
  MAX_FDCONSTRAINTVALUE_LENGTH = 1000_u32
  FD_QUERYCONSTRAINT_PROVIDERINSTANCEID = "ProviderInstanceID"
  FD_QUERYCONSTRAINT_SUBCATEGORY = "Subcategory"
  FD_QUERYCONSTRAINT_RECURSESUBCATEGORY = "RecurseSubcategory"
  FD_QUERYCONSTRAINT_VISIBILITY = "Visibility"
  FD_QUERYCONSTRAINT_COMCLSCONTEXT = "COMClsContext"
  FD_QUERYCONSTRAINT_ROUTINGSCOPE = "RoutingScope"
  FD_CONSTRAINTVALUE_TRUE = "TRUE"
  FD_CONSTRAINTVALUE_FALSE = "FALSE"
  FD_CONSTRAINTVALUE_RECURSESUBCATEGORY_TRUE = "TRUE"
  FD_CONSTRAINTVALUE_VISIBILITY_DEFAULT = "0"
  FD_CONSTRAINTVALUE_VISIBILITY_ALL = "1"
  FD_CONSTRAINTVALUE_COMCLSCONTEXT_INPROC_SERVER = "1"
  FD_CONSTRAINTVALUE_COMCLSCONTEXT_LOCAL_SERVER = "4"
  FD_CONSTRAINTVALUE_PAIRED = "Paired"
  FD_CONSTRAINTVALUE_UNPAIRED = "UnPaired"
  FD_CONSTRAINTVALUE_ALL = "All"
  FD_CONSTRAINTVALUE_ROUTINGSCOPE_ALL = "All"
  FD_CONSTRAINTVALUE_ROUTINGSCOPE_DIRECT = "Direct"
  FD_QUERYCONSTRAINT_PAIRING_STATE = "PairingState"
  FD_QUERYCONSTRAINT_INQUIRY_TIMEOUT = "InquiryModeTimeout"
  PROVIDERPNP_QUERYCONSTRAINT_INTERFACECLASS = "InterfaceClass"
  PROVIDERPNP_QUERYCONSTRAINT_NOTPRESENT = "NotPresent"
  PROVIDERPNP_QUERYCONSTRAINT_NOTIFICATIONSONLY = "NotifyOnly"
  PNP_CONSTRAINTVALUE_NOTPRESENT = "TRUE"
  PNP_CONSTRAINTVALUE_NOTIFICATIONSONLY = "TRUE"
  PROVIDERSSDP_QUERYCONSTRAINT_TYPE = "Type"
  PROVIDERSSDP_QUERYCONSTRAINT_CUSTOMXMLPROPERTY = "CustomXmlProperty"
  SSDP_CONSTRAINTVALUE_TYPE_ALL = "ssdp:all"
  SSDP_CONSTRAINTVALUE_TYPE_ROOT = "upnp:rootdevice"
  SSDP_CONSTRAINTVALUE_TYPE_DEVICE_PREFIX = "urn:schemas-upnp-org:device:"
  SSDP_CONSTRAINTVALUE_TYPE_SVC_PREFIX = "urn:schemas-upnp-org:service:"
  PROVIDERWSD_QUERYCONSTRAINT_DIRECTEDADDRESS = "RemoteAddress"
  PROVIDERWSD_QUERYCONSTRAINT_TYPE = "Type"
  PROVIDERWSD_QUERYCONSTRAINT_SCOPE = "Scope"
  PROVIDERWSD_QUERYCONSTRAINT_SECURITY_REQUIREMENTS = "SecurityRequirements"
  PROVIDERWSD_QUERYCONSTRAINT_SSL_CERT_FOR_CLIENT_AUTH = "SSLClientAuthCert"
  PROVIDERWSD_QUERYCONSTRAINT_SSL_CERTHASH_FOR_SERVER_AUTH = "SSLServerAuthCertHash"
  WSD_CONSTRAINTVALUE_REQUIRE_SECURECHANNEL = "1"
  WSD_CONSTRAINTVALUE_REQUIRE_SECURECHANNEL_AND_COMPACTSIGNATURE = "2"
  WSD_CONSTRAINTVALUE_NO_TRUST_VERIFICATION = "3"
  PROVIDERWNET_QUERYCONSTRAINT_TYPE = "Type"
  PROVIDERWNET_QUERYCONSTRAINT_PROPERTIES = "Properties"
  PROVIDERWNET_QUERYCONSTRAINT_RESOURCETYPE = "ResourceType"
  WNET_CONSTRAINTVALUE_TYPE_ALL = "All"
  WNET_CONSTRAINTVALUE_TYPE_SERVER = "Server"
  WNET_CONSTRAINTVALUE_TYPE_DOMAIN = "Domain"
  WNET_CONSTRAINTVALUE_PROPERTIES_ALL = "All"
  WNET_CONSTRAINTVALUE_PROPERTIES_LIMITED = "Limited"
  WNET_CONSTRAINTVALUE_RESOURCETYPE_DISK = "Disk"
  WNET_CONSTRAINTVALUE_RESOURCETYPE_PRINTER = "Printer"
  WNET_CONSTRAINTVALUE_RESOURCETYPE_DISKORPRINTER = "DiskOrPrinter"
  ONLINE_PROVIDER_DEVICES_QUERYCONSTRAINT_OWNERNAME = "OwnerName"
  PROVIDERDDO_QUERYCONSTRAINT_DEVICEFUNCTIONDISPLAYOBJECTS = "DeviceFunctionDisplayObjects"
  PROVIDERDDO_QUERYCONSTRAINT_ONLYCONNECTEDDEVICES = "OnlyConnectedDevices"
  PROVIDERDDO_QUERYCONSTRAINT_DEVICEINTERFACES = "DeviceInterfaces"
  E_FDPAIRING_NOCONNECTION = -1882193919_i32
  E_FDPAIRING_HWFAILURE = -1882193918_i32
  E_FDPAIRING_AUTHFAILURE = -1882193917_i32
  E_FDPAIRING_CONNECTTIMEOUT = -1882193916_i32
  E_FDPAIRING_TOOMANYCONNECTIONS = -1882193915_i32
  E_FDPAIRING_AUTHNOTALLOWED = -1882193914_i32
  E_FDPAIRING_IPBUSDISABLED = -1882193913_i32
  E_FDPAIRING_NOPROFILES = -1882193912_i32

  CLSID_PNPXAssociation = LibC::GUID.new(0xcee8ccc9_u32, 0x4f6b_u16, 0x4469_u16, StaticArray[0xa2_u8, 0x35_u8, 0x5a_u8, 0x22_u8, 0x86_u8, 0x9e_u8, 0xef_u8, 0x3_u8])

  CLSID_PNPXPairingHandler = LibC::GUID.new(0xb8a27942_u32, 0xade7_u16, 0x4085_u16, StaticArray[0xaa_u8, 0x6e_u8, 0x4f_u8, 0xad_u8, 0xc7_u8, 0xad_u8, 0xa1_u8, 0xef_u8])

  CLSID_FunctionDiscovery = LibC::GUID.new(0xc72be2ec_u32, 0x8e90_u16, 0x452c_u16, StaticArray[0xb2_u8, 0x9a_u8, 0xab_u8, 0x8f_u8, 0xf1_u8, 0xc0_u8, 0x71_u8, 0xfc_u8])

  CLSID_PropertyStore = LibC::GUID.new(0xe4796550_u32, 0xdf61_u16, 0x448b_u16, StaticArray[0x91_u8, 0x93_u8, 0x13_u8, 0xfc_u8, 0x13_u8, 0x41_u8, 0xb1_u8, 0x63_u8])

  CLSID_FunctionInstanceCollection = LibC::GUID.new(0xba818ce5_u32, 0xb55f_u16, 0x443f_u16, StaticArray[0xad_u8, 0x39_u8, 0x2f_u8, 0xe8_u8, 0x9b_u8, 0xe6_u8, 0x19_u8, 0x1f_u8])

  CLSID_PropertyStoreCollection = LibC::GUID.new(0xedd36029_u32, 0xd753_u16, 0x4862_u16, StaticArray[0xaa_u8, 0x5b_u8, 0x5b_u8, 0xcc_u8, 0xad_u8, 0x2a_u8, 0x4d_u8, 0x29_u8])

  enum PropertyConstraint
    QC_EQUALS = 0_i32
    QC_NOTEQUAL = 1_i32
    QC_LESSTHAN = 2_i32
    QC_LESSTHANOREQUAL = 3_i32
    QC_GREATERTHAN = 4_i32
    QC_GREATERTHANOREQUAL = 5_i32
    QC_STARTSWITH = 6_i32
    QC_EXISTS = 7_i32
    QC_DOESNOTEXIST = 8_i32
    QC_CONTAINS = 9_i32
  end
  enum SystemVisibilityFlags
    SVF_SYSTEM = 0_i32
    SVF_USER = 1_i32
  end
  enum QueryUpdateAction
    QUA_ADD = 0_i32
    QUA_REMOVE = 1_i32
    QUA_CHANGE = 2_i32
  end
  enum QueryCategoryType
    QCT_PROVIDER = 0_i32
    QCT_LAYERED = 1_i32
  end

  @[Extern]
  record IFunctionDiscoveryNotificationVtbl,
    query_interface : Proc(IFunctionDiscoveryNotification*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFunctionDiscoveryNotification*, UInt32),
    release : Proc(IFunctionDiscoveryNotification*, UInt32),
    on_update : Proc(IFunctionDiscoveryNotification*, Win32cr::Devices::FunctionDiscovery::QueryUpdateAction, UInt64, Void*, Win32cr::Foundation::HRESULT),
    on_error : Proc(IFunctionDiscoveryNotification*, Win32cr::Foundation::HRESULT, UInt64, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    on_event : Proc(IFunctionDiscoveryNotification*, UInt32, UInt64, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5f6c1ba8-5330-422e-a368-572b244d3f87")]
  record IFunctionDiscoveryNotification, lpVtbl : IFunctionDiscoveryNotificationVtbl* do
    GUID = LibC::GUID.new(0x5f6c1ba8_u32, 0x5330_u16, 0x422e_u16, StaticArray[0xa3_u8, 0x68_u8, 0x57_u8, 0x2b_u8, 0x24_u8, 0x4d_u8, 0x3f_u8, 0x87_u8])
    def query_interface(this : IFunctionDiscoveryNotification*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFunctionDiscoveryNotification*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFunctionDiscoveryNotification*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_update(this : IFunctionDiscoveryNotification*, enumQueryUpdateAction : Win32cr::Devices::FunctionDiscovery::QueryUpdateAction, fdqcQueryContext : UInt64, pIFunctionInstance : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_update.call(this, enumQueryUpdateAction, fdqcQueryContext, pIFunctionInstance)
    end
    def on_error(this : IFunctionDiscoveryNotification*, hr : Win32cr::Foundation::HRESULT, fdqcQueryContext : UInt64, pszProvider : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_error.call(this, hr, fdqcQueryContext, pszProvider)
    end
    def on_event(this : IFunctionDiscoveryNotification*, dwEventID : UInt32, fdqcQueryContext : UInt64, pszProvider : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_event.call(this, dwEventID, fdqcQueryContext, pszProvider)
    end

  end

  @[Extern]
  record IFunctionDiscoveryVtbl,
    query_interface : Proc(IFunctionDiscovery*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFunctionDiscovery*, UInt32),
    release : Proc(IFunctionDiscovery*, UInt32),
    get_instance_collection : Proc(IFunctionDiscovery*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, Void**, Win32cr::Foundation::HRESULT),
    get_instance : Proc(IFunctionDiscovery*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    create_instance_collection_query : Proc(IFunctionDiscovery*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, Void*, UInt64*, Void**, Win32cr::Foundation::HRESULT),
    create_instance_query : Proc(IFunctionDiscovery*, Win32cr::Foundation::PWSTR, Void*, UInt64*, Void**, Win32cr::Foundation::HRESULT),
    add_instance : Proc(IFunctionDiscovery*, Win32cr::Devices::FunctionDiscovery::SystemVisibilityFlags, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    remove_instance : Proc(IFunctionDiscovery*, Win32cr::Devices::FunctionDiscovery::SystemVisibilityFlags, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4df99b70-e148-4432-b004-4c9eeb535a5e")]
  record IFunctionDiscovery, lpVtbl : IFunctionDiscoveryVtbl* do
    GUID = LibC::GUID.new(0x4df99b70_u32, 0xe148_u16, 0x4432_u16, StaticArray[0xb0_u8, 0x4_u8, 0x4c_u8, 0x9e_u8, 0xeb_u8, 0x53_u8, 0x5a_u8, 0x5e_u8])
    def query_interface(this : IFunctionDiscovery*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFunctionDiscovery*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFunctionDiscovery*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_instance_collection(this : IFunctionDiscovery*, pszCategory : Win32cr::Foundation::PWSTR, pszSubCategory : Win32cr::Foundation::PWSTR, fIncludeAllSubCategories : Win32cr::Foundation::BOOL, ppIFunctionInstanceCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_instance_collection.call(this, pszCategory, pszSubCategory, fIncludeAllSubCategories, ppIFunctionInstanceCollection)
    end
    def get_instance(this : IFunctionDiscovery*, pszFunctionInstanceIdentity : Win32cr::Foundation::PWSTR, ppIFunctionInstance : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_instance.call(this, pszFunctionInstanceIdentity, ppIFunctionInstance)
    end
    def create_instance_collection_query(this : IFunctionDiscovery*, pszCategory : Win32cr::Foundation::PWSTR, pszSubCategory : Win32cr::Foundation::PWSTR, fIncludeAllSubCategories : Win32cr::Foundation::BOOL, pIFunctionDiscoveryNotification : Void*, pfdqcQueryContext : UInt64*, ppIFunctionInstanceCollectionQuery : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_instance_collection_query.call(this, pszCategory, pszSubCategory, fIncludeAllSubCategories, pIFunctionDiscoveryNotification, pfdqcQueryContext, ppIFunctionInstanceCollectionQuery)
    end
    def create_instance_query(this : IFunctionDiscovery*, pszFunctionInstanceIdentity : Win32cr::Foundation::PWSTR, pIFunctionDiscoveryNotification : Void*, pfdqcQueryContext : UInt64*, ppIFunctionInstanceQuery : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_instance_query.call(this, pszFunctionInstanceIdentity, pIFunctionDiscoveryNotification, pfdqcQueryContext, ppIFunctionInstanceQuery)
    end
    def add_instance(this : IFunctionDiscovery*, enumSystemVisibility : Win32cr::Devices::FunctionDiscovery::SystemVisibilityFlags, pszCategory : Win32cr::Foundation::PWSTR, pszSubCategory : Win32cr::Foundation::PWSTR, pszCategoryIdentity : Win32cr::Foundation::PWSTR, ppIFunctionInstance : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_instance.call(this, enumSystemVisibility, pszCategory, pszSubCategory, pszCategoryIdentity, ppIFunctionInstance)
    end
    def remove_instance(this : IFunctionDiscovery*, enumSystemVisibility : Win32cr::Devices::FunctionDiscovery::SystemVisibilityFlags, pszCategory : Win32cr::Foundation::PWSTR, pszSubCategory : Win32cr::Foundation::PWSTR, pszCategoryIdentity : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_instance.call(this, enumSystemVisibility, pszCategory, pszSubCategory, pszCategoryIdentity)
    end

  end

  @[Extern]
  record IFunctionInstanceVtbl,
    query_interface : Proc(IFunctionInstance*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFunctionInstance*, UInt32),
    release : Proc(IFunctionInstance*, UInt32),
    query_service : Proc(IFunctionInstance*, LibC::GUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_id : Proc(IFunctionInstance*, UInt16**, Win32cr::Foundation::HRESULT),
    get_provider_instance_id : Proc(IFunctionInstance*, UInt16**, Win32cr::Foundation::HRESULT),
    open_property_store : Proc(IFunctionInstance*, Win32cr::System::Com::StructuredStorage::STGM, Void**, Win32cr::Foundation::HRESULT),
    get_category : Proc(IFunctionInstance*, UInt16**, UInt16**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("33591c10-0bed-4f02-b0ab-1530d5533ee9")]
  record IFunctionInstance, lpVtbl : IFunctionInstanceVtbl* do
    GUID = LibC::GUID.new(0x33591c10_u32, 0xbed_u16, 0x4f02_u16, StaticArray[0xb0_u8, 0xab_u8, 0x15_u8, 0x30_u8, 0xd5_u8, 0x53_u8, 0x3e_u8, 0xe9_u8])
    def query_interface(this : IFunctionInstance*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFunctionInstance*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFunctionInstance*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def query_service(this : IFunctionInstance*, guidService : LibC::GUID*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_service.call(this, guidService, riid, ppvObject)
    end
    def get_id(this : IFunctionInstance*, ppszCoMemIdentity : UInt16**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_id.call(this, ppszCoMemIdentity)
    end
    def get_provider_instance_id(this : IFunctionInstance*, ppszCoMemProviderInstanceIdentity : UInt16**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_provider_instance_id.call(this, ppszCoMemProviderInstanceIdentity)
    end
    def open_property_store(this : IFunctionInstance*, dwStgAccess : Win32cr::System::Com::StructuredStorage::STGM, ppIPropertyStore : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_property_store.call(this, dwStgAccess, ppIPropertyStore)
    end
    def get_category(this : IFunctionInstance*, ppszCoMemCategory : UInt16**, ppszCoMemSubCategory : UInt16**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_category.call(this, ppszCoMemCategory, ppszCoMemSubCategory)
    end

  end

  @[Extern]
  record IFunctionInstanceCollectionVtbl,
    query_interface : Proc(IFunctionInstanceCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFunctionInstanceCollection*, UInt32),
    release : Proc(IFunctionInstanceCollection*, UInt32),
    get_count : Proc(IFunctionInstanceCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get : Proc(IFunctionInstanceCollection*, Win32cr::Foundation::PWSTR, UInt32*, Void**, Win32cr::Foundation::HRESULT),
    item : Proc(IFunctionInstanceCollection*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    add : Proc(IFunctionInstanceCollection*, Void*, Win32cr::Foundation::HRESULT),
    remove : Proc(IFunctionInstanceCollection*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    delete : Proc(IFunctionInstanceCollection*, UInt32, Win32cr::Foundation::HRESULT),
    delete_all : Proc(IFunctionInstanceCollection*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f0a3d895-855c-42a2-948d-2f97d450ecb1")]
  record IFunctionInstanceCollection, lpVtbl : IFunctionInstanceCollectionVtbl* do
    GUID = LibC::GUID.new(0xf0a3d895_u32, 0x855c_u16, 0x42a2_u16, StaticArray[0x94_u8, 0x8d_u8, 0x2f_u8, 0x97_u8, 0xd4_u8, 0x50_u8, 0xec_u8, 0xb1_u8])
    def query_interface(this : IFunctionInstanceCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFunctionInstanceCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFunctionInstanceCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_count(this : IFunctionInstanceCollection*, pdwCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, pdwCount)
    end
    def get(this : IFunctionInstanceCollection*, pszInstanceIdentity : Win32cr::Foundation::PWSTR, pdwIndex : UInt32*, ppIFunctionInstance : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get.call(this, pszInstanceIdentity, pdwIndex, ppIFunctionInstance)
    end
    def item(this : IFunctionInstanceCollection*, dwIndex : UInt32, ppIFunctionInstance : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, dwIndex, ppIFunctionInstance)
    end
    def add(this : IFunctionInstanceCollection*, pIFunctionInstance : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, pIFunctionInstance)
    end
    def remove(this : IFunctionInstanceCollection*, dwIndex : UInt32, ppIFunctionInstance : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, dwIndex, ppIFunctionInstance)
    end
    def delete(this : IFunctionInstanceCollection*, dwIndex : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this, dwIndex)
    end
    def delete_all(this : IFunctionInstanceCollection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_all.call(this)
    end

  end

  @[Extern]
  record IPropertyStoreCollectionVtbl,
    query_interface : Proc(IPropertyStoreCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPropertyStoreCollection*, UInt32),
    release : Proc(IPropertyStoreCollection*, UInt32),
    get_count : Proc(IPropertyStoreCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get : Proc(IPropertyStoreCollection*, Win32cr::Foundation::PWSTR, UInt32*, Void**, Win32cr::Foundation::HRESULT),
    item : Proc(IPropertyStoreCollection*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    add : Proc(IPropertyStoreCollection*, Void*, Win32cr::Foundation::HRESULT),
    remove : Proc(IPropertyStoreCollection*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    delete : Proc(IPropertyStoreCollection*, UInt32, Win32cr::Foundation::HRESULT),
    delete_all : Proc(IPropertyStoreCollection*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d14d9c30-12d2-42d8-bce4-c60c2bb226fa")]
  record IPropertyStoreCollection, lpVtbl : IPropertyStoreCollectionVtbl* do
    GUID = LibC::GUID.new(0xd14d9c30_u32, 0x12d2_u16, 0x42d8_u16, StaticArray[0xbc_u8, 0xe4_u8, 0xc6_u8, 0xc_u8, 0x2b_u8, 0xb2_u8, 0x26_u8, 0xfa_u8])
    def query_interface(this : IPropertyStoreCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPropertyStoreCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPropertyStoreCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_count(this : IPropertyStoreCollection*, pdwCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, pdwCount)
    end
    def get(this : IPropertyStoreCollection*, pszInstanceIdentity : Win32cr::Foundation::PWSTR, pdwIndex : UInt32*, ppIPropertyStore : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get.call(this, pszInstanceIdentity, pdwIndex, ppIPropertyStore)
    end
    def item(this : IPropertyStoreCollection*, dwIndex : UInt32, ppIPropertyStore : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, dwIndex, ppIPropertyStore)
    end
    def add(this : IPropertyStoreCollection*, pIPropertyStore : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, pIPropertyStore)
    end
    def remove(this : IPropertyStoreCollection*, dwIndex : UInt32, pIPropertyStore : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, dwIndex, pIPropertyStore)
    end
    def delete(this : IPropertyStoreCollection*, dwIndex : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this, dwIndex)
    end
    def delete_all(this : IPropertyStoreCollection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_all.call(this)
    end

  end

  @[Extern]
  record IFunctionInstanceQueryVtbl,
    query_interface : Proc(IFunctionInstanceQuery*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFunctionInstanceQuery*, UInt32),
    release : Proc(IFunctionInstanceQuery*, UInt32),
    execute : Proc(IFunctionInstanceQuery*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6242bc6b-90ec-4b37-bb46-e229fd84ed95")]
  record IFunctionInstanceQuery, lpVtbl : IFunctionInstanceQueryVtbl* do
    GUID = LibC::GUID.new(0x6242bc6b_u32, 0x90ec_u16, 0x4b37_u16, StaticArray[0xbb_u8, 0x46_u8, 0xe2_u8, 0x29_u8, 0xfd_u8, 0x84_u8, 0xed_u8, 0x95_u8])
    def query_interface(this : IFunctionInstanceQuery*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFunctionInstanceQuery*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFunctionInstanceQuery*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def execute(this : IFunctionInstanceQuery*, ppIFunctionInstance : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.execute.call(this, ppIFunctionInstance)
    end

  end

  @[Extern]
  record IFunctionInstanceCollectionQueryVtbl,
    query_interface : Proc(IFunctionInstanceCollectionQuery*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFunctionInstanceCollectionQuery*, UInt32),
    release : Proc(IFunctionInstanceCollectionQuery*, UInt32),
    add_query_constraint : Proc(IFunctionInstanceCollectionQuery*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    add_property_constraint : Proc(IFunctionInstanceCollectionQuery*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Devices::FunctionDiscovery::PropertyConstraint, Win32cr::Foundation::HRESULT),
    execute : Proc(IFunctionInstanceCollectionQuery*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("57cc6fd2-c09a-4289-bb72-25f04142058e")]
  record IFunctionInstanceCollectionQuery, lpVtbl : IFunctionInstanceCollectionQueryVtbl* do
    GUID = LibC::GUID.new(0x57cc6fd2_u32, 0xc09a_u16, 0x4289_u16, StaticArray[0xbb_u8, 0x72_u8, 0x25_u8, 0xf0_u8, 0x41_u8, 0x42_u8, 0x5_u8, 0x8e_u8])
    def query_interface(this : IFunctionInstanceCollectionQuery*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFunctionInstanceCollectionQuery*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFunctionInstanceCollectionQuery*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_query_constraint(this : IFunctionInstanceCollectionQuery*, pszConstraintName : Win32cr::Foundation::PWSTR, pszConstraintValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_query_constraint.call(this, pszConstraintName, pszConstraintValue)
    end
    def add_property_constraint(this : IFunctionInstanceCollectionQuery*, key : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, pv : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, enumPropertyConstraint : Win32cr::Devices::FunctionDiscovery::PropertyConstraint) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_property_constraint.call(this, key, pv, enumPropertyConstraint)
    end
    def execute(this : IFunctionInstanceCollectionQuery*, ppIFunctionInstanceCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.execute.call(this, ppIFunctionInstanceCollection)
    end

  end

  @[Extern]
  record IFunctionDiscoveryProviderVtbl,
    query_interface : Proc(IFunctionDiscoveryProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFunctionDiscoveryProvider*, UInt32),
    release : Proc(IFunctionDiscoveryProvider*, UInt32),
    initialize__ : Proc(IFunctionDiscoveryProvider*, Void*, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    query : Proc(IFunctionDiscoveryProvider*, Void*, Void**, Win32cr::Foundation::HRESULT),
    end_query : Proc(IFunctionDiscoveryProvider*, Win32cr::Foundation::HRESULT),
    instance_property_store_validate_access : Proc(IFunctionDiscoveryProvider*, Void*, LibC::IntPtrT, UInt32, Win32cr::Foundation::HRESULT),
    instance_property_store_open : Proc(IFunctionDiscoveryProvider*, Void*, LibC::IntPtrT, UInt32, Void**, Win32cr::Foundation::HRESULT),
    instance_property_store_flush : Proc(IFunctionDiscoveryProvider*, Void*, LibC::IntPtrT, Win32cr::Foundation::HRESULT),
    instance_query_service : Proc(IFunctionDiscoveryProvider*, Void*, LibC::IntPtrT, LibC::GUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    instance_released : Proc(IFunctionDiscoveryProvider*, Void*, LibC::IntPtrT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dcde394f-1478-4813-a402-f6fb10657222")]
  record IFunctionDiscoveryProvider, lpVtbl : IFunctionDiscoveryProviderVtbl* do
    GUID = LibC::GUID.new(0xdcde394f_u32, 0x1478_u16, 0x4813_u16, StaticArray[0xa4_u8, 0x2_u8, 0xf6_u8, 0xfb_u8, 0x10_u8, 0x65_u8, 0x72_u8, 0x22_u8])
    def query_interface(this : IFunctionDiscoveryProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFunctionDiscoveryProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFunctionDiscoveryProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IFunctionDiscoveryProvider*, pIFunctionDiscoveryProviderFactory : Void*, pIFunctionDiscoveryNotification : Void*, lcidUserDefault : UInt32, pdwStgAccessCapabilities : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pIFunctionDiscoveryProviderFactory, pIFunctionDiscoveryNotification, lcidUserDefault, pdwStgAccessCapabilities)
    end
    def query(this : IFunctionDiscoveryProvider*, pIFunctionDiscoveryProviderQuery : Void*, ppIFunctionInstanceCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query.call(this, pIFunctionDiscoveryProviderQuery, ppIFunctionInstanceCollection)
    end
    def end_query(this : IFunctionDiscoveryProvider*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_query.call(this)
    end
    def instance_property_store_validate_access(this : IFunctionDiscoveryProvider*, pIFunctionInstance : Void*, iProviderInstanceContext : LibC::IntPtrT, dwStgAccess : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.instance_property_store_validate_access.call(this, pIFunctionInstance, iProviderInstanceContext, dwStgAccess)
    end
    def instance_property_store_open(this : IFunctionDiscoveryProvider*, pIFunctionInstance : Void*, iProviderInstanceContext : LibC::IntPtrT, dwStgAccess : UInt32, ppIPropertyStore : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.instance_property_store_open.call(this, pIFunctionInstance, iProviderInstanceContext, dwStgAccess, ppIPropertyStore)
    end
    def instance_property_store_flush(this : IFunctionDiscoveryProvider*, pIFunctionInstance : Void*, iProviderInstanceContext : LibC::IntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.instance_property_store_flush.call(this, pIFunctionInstance, iProviderInstanceContext)
    end
    def instance_query_service(this : IFunctionDiscoveryProvider*, pIFunctionInstance : Void*, iProviderInstanceContext : LibC::IntPtrT, guidService : LibC::GUID*, riid : LibC::GUID*, ppIUnknown : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.instance_query_service.call(this, pIFunctionInstance, iProviderInstanceContext, guidService, riid, ppIUnknown)
    end
    def instance_released(this : IFunctionDiscoveryProvider*, pIFunctionInstance : Void*, iProviderInstanceContext : LibC::IntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.instance_released.call(this, pIFunctionInstance, iProviderInstanceContext)
    end

  end

  @[Extern]
  record IProviderPropertiesVtbl,
    query_interface : Proc(IProviderProperties*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IProviderProperties*, UInt32),
    release : Proc(IProviderProperties*, UInt32),
    get_count : Proc(IProviderProperties*, Void*, LibC::IntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    get_at : Proc(IProviderProperties*, Void*, LibC::IntPtrT, UInt32, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::Foundation::HRESULT),
    get_value : Proc(IProviderProperties*, Void*, LibC::IntPtrT, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    set_value : Proc(IProviderProperties*, Void*, LibC::IntPtrT, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("cf986ea6-3b5f-4c5f-b88a-2f8b20ceef17")]
  record IProviderProperties, lpVtbl : IProviderPropertiesVtbl* do
    GUID = LibC::GUID.new(0xcf986ea6_u32, 0x3b5f_u16, 0x4c5f_u16, StaticArray[0xb8_u8, 0x8a_u8, 0x2f_u8, 0x8b_u8, 0x20_u8, 0xce_u8, 0xef_u8, 0x17_u8])
    def query_interface(this : IProviderProperties*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IProviderProperties*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IProviderProperties*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_count(this : IProviderProperties*, pIFunctionInstance : Void*, iProviderInstanceContext : LibC::IntPtrT, pdwCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, pIFunctionInstance, iProviderInstanceContext, pdwCount)
    end
    def get_at(this : IProviderProperties*, pIFunctionInstance : Void*, iProviderInstanceContext : LibC::IntPtrT, dwIndex : UInt32, pKey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_at.call(this, pIFunctionInstance, iProviderInstanceContext, dwIndex, pKey)
    end
    def get_value(this : IProviderProperties*, pIFunctionInstance : Void*, iProviderInstanceContext : LibC::IntPtrT, key : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, ppropVar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_value.call(this, pIFunctionInstance, iProviderInstanceContext, key, ppropVar)
    end
    def set_value(this : IProviderProperties*, pIFunctionInstance : Void*, iProviderInstanceContext : LibC::IntPtrT, key : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, ppropVar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_value.call(this, pIFunctionInstance, iProviderInstanceContext, key, ppropVar)
    end

  end

  @[Extern]
  record IProviderPublishingVtbl,
    query_interface : Proc(IProviderPublishing*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IProviderPublishing*, UInt32),
    release : Proc(IProviderPublishing*, UInt32),
    create_instance : Proc(IProviderPublishing*, Win32cr::Devices::FunctionDiscovery::SystemVisibilityFlags, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    remove_instance : Proc(IProviderPublishing*, Win32cr::Devices::FunctionDiscovery::SystemVisibilityFlags, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("cd1b9a04-206c-4a05-a0c8-1635a21a2b7c")]
  record IProviderPublishing, lpVtbl : IProviderPublishingVtbl* do
    GUID = LibC::GUID.new(0xcd1b9a04_u32, 0x206c_u16, 0x4a05_u16, StaticArray[0xa0_u8, 0xc8_u8, 0x16_u8, 0x35_u8, 0xa2_u8, 0x1a_u8, 0x2b_u8, 0x7c_u8])
    def query_interface(this : IProviderPublishing*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IProviderPublishing*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IProviderPublishing*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_instance(this : IProviderPublishing*, enumVisibilityFlags : Win32cr::Devices::FunctionDiscovery::SystemVisibilityFlags, pszSubCategory : Win32cr::Foundation::PWSTR, pszProviderInstanceIdentity : Win32cr::Foundation::PWSTR, ppIFunctionInstance : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_instance.call(this, enumVisibilityFlags, pszSubCategory, pszProviderInstanceIdentity, ppIFunctionInstance)
    end
    def remove_instance(this : IProviderPublishing*, enumVisibilityFlags : Win32cr::Devices::FunctionDiscovery::SystemVisibilityFlags, pszSubCategory : Win32cr::Foundation::PWSTR, pszProviderInstanceIdentity : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_instance.call(this, enumVisibilityFlags, pszSubCategory, pszProviderInstanceIdentity)
    end

  end

  @[Extern]
  record IFunctionDiscoveryProviderFactoryVtbl,
    query_interface : Proc(IFunctionDiscoveryProviderFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFunctionDiscoveryProviderFactory*, UInt32),
    release : Proc(IFunctionDiscoveryProviderFactory*, UInt32),
    create_property_store : Proc(IFunctionDiscoveryProviderFactory*, Void**, Win32cr::Foundation::HRESULT),
    create_instance : Proc(IFunctionDiscoveryProviderFactory*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, LibC::IntPtrT, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_function_instance_collection : Proc(IFunctionDiscoveryProviderFactory*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("86443ff0-1ad5-4e68-a45a-40c2c329de3b")]
  record IFunctionDiscoveryProviderFactory, lpVtbl : IFunctionDiscoveryProviderFactoryVtbl* do
    GUID = LibC::GUID.new(0x86443ff0_u32, 0x1ad5_u16, 0x4e68_u16, StaticArray[0xa4_u8, 0x5a_u8, 0x40_u8, 0xc2_u8, 0xc3_u8, 0x29_u8, 0xde_u8, 0x3b_u8])
    def query_interface(this : IFunctionDiscoveryProviderFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFunctionDiscoveryProviderFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFunctionDiscoveryProviderFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_property_store(this : IFunctionDiscoveryProviderFactory*, ppIPropertyStore : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_property_store.call(this, ppIPropertyStore)
    end
    def create_instance(this : IFunctionDiscoveryProviderFactory*, pszSubCategory : Win32cr::Foundation::PWSTR, pszProviderInstanceIdentity : Win32cr::Foundation::PWSTR, iProviderInstanceContext : LibC::IntPtrT, pIPropertyStore : Void*, pIFunctionDiscoveryProvider : Void*, ppIFunctionInstance : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_instance.call(this, pszSubCategory, pszProviderInstanceIdentity, iProviderInstanceContext, pIPropertyStore, pIFunctionDiscoveryProvider, ppIFunctionInstance)
    end
    def create_function_instance_collection(this : IFunctionDiscoveryProviderFactory*, ppIFunctionInstanceCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_function_instance_collection.call(this, ppIFunctionInstanceCollection)
    end

  end

  @[Extern]
  record IFunctionDiscoveryProviderQueryVtbl,
    query_interface : Proc(IFunctionDiscoveryProviderQuery*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFunctionDiscoveryProviderQuery*, UInt32),
    release : Proc(IFunctionDiscoveryProviderQuery*, UInt32),
    is_instance_query : Proc(IFunctionDiscoveryProviderQuery*, Win32cr::Foundation::BOOL*, UInt16**, Win32cr::Foundation::HRESULT),
    is_subcategory_query : Proc(IFunctionDiscoveryProviderQuery*, Win32cr::Foundation::BOOL*, UInt16**, Win32cr::Foundation::HRESULT),
    get_query_constraints : Proc(IFunctionDiscoveryProviderQuery*, Void**, Win32cr::Foundation::HRESULT),
    get_property_constraints : Proc(IFunctionDiscoveryProviderQuery*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6876ea98-baec-46db-bc20-75a76e267a3a")]
  record IFunctionDiscoveryProviderQuery, lpVtbl : IFunctionDiscoveryProviderQueryVtbl* do
    GUID = LibC::GUID.new(0x6876ea98_u32, 0xbaec_u16, 0x46db_u16, StaticArray[0xbc_u8, 0x20_u8, 0x75_u8, 0xa7_u8, 0x6e_u8, 0x26_u8, 0x7a_u8, 0x3a_u8])
    def query_interface(this : IFunctionDiscoveryProviderQuery*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFunctionDiscoveryProviderQuery*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFunctionDiscoveryProviderQuery*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def is_instance_query(this : IFunctionDiscoveryProviderQuery*, pisInstanceQuery : Win32cr::Foundation::BOOL*, ppszConstraintValue : UInt16**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_instance_query.call(this, pisInstanceQuery, ppszConstraintValue)
    end
    def is_subcategory_query(this : IFunctionDiscoveryProviderQuery*, pisSubcategoryQuery : Win32cr::Foundation::BOOL*, ppszConstraintValue : UInt16**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_subcategory_query.call(this, pisSubcategoryQuery, ppszConstraintValue)
    end
    def get_query_constraints(this : IFunctionDiscoveryProviderQuery*, ppIProviderQueryConstraints : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_query_constraints.call(this, ppIProviderQueryConstraints)
    end
    def get_property_constraints(this : IFunctionDiscoveryProviderQuery*, ppIProviderPropertyConstraints : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_constraints.call(this, ppIProviderPropertyConstraints)
    end

  end

  @[Extern]
  record IProviderQueryConstraintCollectionVtbl,
    query_interface : Proc(IProviderQueryConstraintCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IProviderQueryConstraintCollection*, UInt32),
    release : Proc(IProviderQueryConstraintCollection*, UInt32),
    get_count : Proc(IProviderQueryConstraintCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get : Proc(IProviderQueryConstraintCollection*, Win32cr::Foundation::PWSTR, UInt16**, Win32cr::Foundation::HRESULT),
    item : Proc(IProviderQueryConstraintCollection*, UInt32, UInt16**, UInt16**, Win32cr::Foundation::HRESULT),
    next__ : Proc(IProviderQueryConstraintCollection*, UInt16**, UInt16**, Win32cr::Foundation::HRESULT),
    skip : Proc(IProviderQueryConstraintCollection*, Win32cr::Foundation::HRESULT),
    reset : Proc(IProviderQueryConstraintCollection*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("9c243e11-3261-4bcd-b922-84a873d460ae")]
  record IProviderQueryConstraintCollection, lpVtbl : IProviderQueryConstraintCollectionVtbl* do
    GUID = LibC::GUID.new(0x9c243e11_u32, 0x3261_u16, 0x4bcd_u16, StaticArray[0xb9_u8, 0x22_u8, 0x84_u8, 0xa8_u8, 0x73_u8, 0xd4_u8, 0x60_u8, 0xae_u8])
    def query_interface(this : IProviderQueryConstraintCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IProviderQueryConstraintCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IProviderQueryConstraintCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_count(this : IProviderQueryConstraintCollection*, pdwCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, pdwCount)
    end
    def get(this : IProviderQueryConstraintCollection*, pszConstraintName : Win32cr::Foundation::PWSTR, ppszConstraintValue : UInt16**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get.call(this, pszConstraintName, ppszConstraintValue)
    end
    def item(this : IProviderQueryConstraintCollection*, dwIndex : UInt32, ppszConstraintName : UInt16**, ppszConstraintValue : UInt16**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, dwIndex, ppszConstraintName, ppszConstraintValue)
    end
    def next__(this : IProviderQueryConstraintCollection*, ppszConstraintName : UInt16**, ppszConstraintValue : UInt16**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, ppszConstraintName, ppszConstraintValue)
    end
    def skip(this : IProviderQueryConstraintCollection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this)
    end
    def reset(this : IProviderQueryConstraintCollection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end

  end

  @[Extern]
  record IProviderPropertyConstraintCollectionVtbl,
    query_interface : Proc(IProviderPropertyConstraintCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IProviderPropertyConstraintCollection*, UInt32),
    release : Proc(IProviderPropertyConstraintCollection*, UInt32),
    get_count : Proc(IProviderPropertyConstraintCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get : Proc(IProviderPropertyConstraintCollection*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, UInt32*, Win32cr::Foundation::HRESULT),
    item : Proc(IProviderPropertyConstraintCollection*, UInt32, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, UInt32*, Win32cr::Foundation::HRESULT),
    next__ : Proc(IProviderPropertyConstraintCollection*, Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IProviderPropertyConstraintCollection*, Win32cr::Foundation::HRESULT),
    reset : Proc(IProviderPropertyConstraintCollection*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f4fae42f-5778-4a13-8540-b5fd8c1398dd")]
  record IProviderPropertyConstraintCollection, lpVtbl : IProviderPropertyConstraintCollectionVtbl* do
    GUID = LibC::GUID.new(0xf4fae42f_u32, 0x5778_u16, 0x4a13_u16, StaticArray[0x85_u8, 0x40_u8, 0xb5_u8, 0xfd_u8, 0x8c_u8, 0x13_u8, 0x98_u8, 0xdd_u8])
    def query_interface(this : IProviderPropertyConstraintCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IProviderPropertyConstraintCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IProviderPropertyConstraintCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_count(this : IProviderPropertyConstraintCollection*, pdwCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, pdwCount)
    end
    def get(this : IProviderPropertyConstraintCollection*, key : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, pPropVar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pdwPropertyConstraint : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get.call(this, key, pPropVar, pdwPropertyConstraint)
    end
    def item(this : IProviderPropertyConstraintCollection*, dwIndex : UInt32, pKey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, pPropVar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pdwPropertyConstraint : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, dwIndex, pKey, pPropVar, pdwPropertyConstraint)
    end
    def next__(this : IProviderPropertyConstraintCollection*, pKey : Win32cr::UI::Shell::PropertiesSystem::PROPERTYKEY*, pPropVar : Win32cr::System::Com::StructuredStorage::PROPVARIANT*, pdwPropertyConstraint : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, pKey, pPropVar, pdwPropertyConstraint)
    end
    def skip(this : IProviderPropertyConstraintCollection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this)
    end
    def reset(this : IProviderPropertyConstraintCollection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end

  end

  @[Extern]
  record IFunctionDiscoveryServiceProviderVtbl,
    query_interface : Proc(IFunctionDiscoveryServiceProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFunctionDiscoveryServiceProvider*, UInt32),
    release : Proc(IFunctionDiscoveryServiceProvider*, UInt32),
    initialize__ : Proc(IFunctionDiscoveryServiceProvider*, Void*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4c81ed02-1b04-43f2-a451-69966cbcd1c2")]
  record IFunctionDiscoveryServiceProvider, lpVtbl : IFunctionDiscoveryServiceProviderVtbl* do
    GUID = LibC::GUID.new(0x4c81ed02_u32, 0x1b04_u16, 0x43f2_u16, StaticArray[0xa4_u8, 0x51_u8, 0x69_u8, 0x96_u8, 0x6c_u8, 0xbc_u8, 0xd1_u8, 0xc2_u8])
    def query_interface(this : IFunctionDiscoveryServiceProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFunctionDiscoveryServiceProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFunctionDiscoveryServiceProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IFunctionDiscoveryServiceProvider*, pIFunctionInstance : Void*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pIFunctionInstance, riid, ppv)
    end

  end

  @[Extern]
  record IPNPXAssociationVtbl,
    query_interface : Proc(IPNPXAssociation*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPNPXAssociation*, UInt32),
    release : Proc(IPNPXAssociation*, UInt32),
    associate : Proc(IPNPXAssociation*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    unassociate : Proc(IPNPXAssociation*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    delete : Proc(IPNPXAssociation*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0bd7e521-4da6-42d5-81ba-1981b6b94075")]
  record IPNPXAssociation, lpVtbl : IPNPXAssociationVtbl* do
    GUID = LibC::GUID.new(0xbd7e521_u32, 0x4da6_u16, 0x42d5_u16, StaticArray[0x81_u8, 0xba_u8, 0x19_u8, 0x81_u8, 0xb6_u8, 0xb9_u8, 0x40_u8, 0x75_u8])
    def query_interface(this : IPNPXAssociation*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPNPXAssociation*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPNPXAssociation*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def associate(this : IPNPXAssociation*, pszSubcategory : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.associate.call(this, pszSubcategory)
    end
    def unassociate(this : IPNPXAssociation*, pszSubcategory : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unassociate.call(this, pszSubcategory)
    end
    def delete(this : IPNPXAssociation*, pszSubcategory : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this, pszSubcategory)
    end

  end

  @[Extern]
  record IPNPXDeviceAssociationVtbl,
    query_interface : Proc(IPNPXDeviceAssociation*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPNPXDeviceAssociation*, UInt32),
    release : Proc(IPNPXDeviceAssociation*, UInt32),
    associate : Proc(IPNPXDeviceAssociation*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::HRESULT),
    unassociate : Proc(IPNPXDeviceAssociation*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::HRESULT),
    delete : Proc(IPNPXDeviceAssociation*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("eed366d0-35b8-4fc5-8d20-7e5bd31f6ded")]
  record IPNPXDeviceAssociation, lpVtbl : IPNPXDeviceAssociationVtbl* do
    GUID = LibC::GUID.new(0xeed366d0_u32, 0x35b8_u16, 0x4fc5_u16, StaticArray[0x8d_u8, 0x20_u8, 0x7e_u8, 0x5b_u8, 0xd3_u8, 0x1f_u8, 0x6d_u8, 0xed_u8])
    def query_interface(this : IPNPXDeviceAssociation*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPNPXDeviceAssociation*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPNPXDeviceAssociation*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def associate(this : IPNPXDeviceAssociation*, pszSubCategory : Win32cr::Foundation::PWSTR, pIFunctionDiscoveryNotification : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.associate.call(this, pszSubCategory, pIFunctionDiscoveryNotification)
    end
    def unassociate(this : IPNPXDeviceAssociation*, pszSubCategory : Win32cr::Foundation::PWSTR, pIFunctionDiscoveryNotification : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unassociate.call(this, pszSubCategory, pIFunctionDiscoveryNotification)
    end
    def delete(this : IPNPXDeviceAssociation*, pszSubcategory : Win32cr::Foundation::PWSTR, pIFunctionDiscoveryNotification : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this, pszSubcategory, pIFunctionDiscoveryNotification)
    end

  end

end