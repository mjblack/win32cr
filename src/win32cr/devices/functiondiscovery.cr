require "../system/com.cr"
require "../foundation.cr"
require "../ui/shell/propertiessystem.cr"
require "../system/com/structuredstorage.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32
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
  PKEY_FunctionInstance = PROPERTYKEY.new(LibC::GUID.new(0x8c0c253_u32, 0xa154_u16, 0x4746_u16, StaticArray[0x90_u8, 0x5_u8, 0x82_u8, 0xde_u8, 0x53_u8, 0x17_u8, 0x14_u8, 0x8b_u8]), 1_u32)
  FMTID_FD = "904b03a2-471d-423c-a584-f3483238a146"
  FD_Visibility_Default = 0_u32
  FD_Visibility_Hidden = 1_u32
  FMTID_Device = "78c34fc8-104a-4aca-9ea4-524d52996e57"
  FMTID_DeviceInterface = "53808008-07bb-4661-bc3c-b5953e708560"
  PKEY_DeviceDisplay_Address = PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 51_u32)
  PKEY_DeviceDisplay_DiscoveryMethod = PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 52_u32)
  PKEY_DeviceDisplay_IsEncrypted = PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 53_u32)
  PKEY_DeviceDisplay_IsAuthenticated = PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 54_u32)
  PKEY_DeviceDisplay_IsConnected = PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 55_u32)
  PKEY_DeviceDisplay_IsPaired = PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 56_u32)
  PKEY_DeviceDisplay_Icon = PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 57_u32)
  PKEY_DeviceDisplay_Version = PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 65_u32)
  PKEY_DeviceDisplay_Last_Seen = PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 66_u32)
  PKEY_DeviceDisplay_Last_Connected = PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 67_u32)
  PKEY_DeviceDisplay_IsShowInDisconnectedState = PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 68_u32)
  PKEY_DeviceDisplay_IsLocalMachine = PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 70_u32)
  PKEY_DeviceDisplay_MetadataPath = PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 71_u32)
  PKEY_DeviceDisplay_IsMetadataSearchInProgress = PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 72_u32)
  PKEY_DeviceDisplay_MetadataChecksum = PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 73_u32)
  PKEY_DeviceDisplay_IsNotInterestingForDisplay = PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 74_u32)
  PKEY_DeviceDisplay_LaunchDeviceStageOnDeviceConnect = PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 76_u32)
  PKEY_DeviceDisplay_LaunchDeviceStageFromExplorer = PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 77_u32)
  PKEY_DeviceDisplay_BaselineExperienceId = PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 78_u32)
  PKEY_DeviceDisplay_IsDeviceUniquelyIdentifiable = PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 79_u32)
  PKEY_DeviceDisplay_AssociationArray = PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 80_u32)
  PKEY_DeviceDisplay_DeviceDescription1 = PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 81_u32)
  PKEY_DeviceDisplay_DeviceDescription2 = PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 82_u32)
  PKEY_DeviceDisplay_IsNotWorkingProperly = PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 83_u32)
  PKEY_DeviceDisplay_IsSharedDevice = PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 84_u32)
  PKEY_DeviceDisplay_IsNetworkDevice = PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 85_u32)
  PKEY_DeviceDisplay_IsDefaultDevice = PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 86_u32)
  PKEY_DeviceDisplay_MetadataCabinet = PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 87_u32)
  PKEY_DeviceDisplay_RequiresPairingElevation = PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 88_u32)
  PKEY_DeviceDisplay_ExperienceId = PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 89_u32)
  PKEY_DeviceDisplay_Category = PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 90_u32)
  PKEY_DeviceDisplay_Category_Desc_Singular = PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 91_u32)
  PKEY_DeviceDisplay_Category_Desc_Plural = PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 92_u32)
  PKEY_DeviceDisplay_Category_Icon = PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 93_u32)
  PKEY_DeviceDisplay_CategoryGroup_Desc = PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 94_u32)
  PKEY_DeviceDisplay_CategoryGroup_Icon = PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 95_u32)
  PKEY_DeviceDisplay_PrimaryCategory = PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 97_u32)
  PKEY_DeviceDisplay_UnpairUninstall = PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 98_u32)
  PKEY_DeviceDisplay_RequiresUninstallElevation = PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 99_u32)
  PKEY_DeviceDisplay_DeviceFunctionSubRank = PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 100_u32)
  PKEY_DeviceDisplay_AlwaysShowDeviceAsConnected = PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 101_u32)
  PKEY_DeviceDisplay_FriendlyName = PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 12288_u32)
  PKEY_DeviceDisplay_Manufacturer = PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 8192_u32)
  PKEY_DeviceDisplay_ModelName = PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 8194_u32)
  PKEY_DeviceDisplay_ModelNumber = PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 8195_u32)
  PKEY_DeviceDisplay_InstallInProgress = PROPERTYKEY.new(LibC::GUID.new(0x83da6326_u32, 0x97a6_u16, 0x4088_u16, StaticArray[0x94_u8, 0x53_u8, 0xa1_u8, 0x92_u8, 0x3f_u8, 0x57_u8, 0x3b_u8, 0x29_u8]), 9_u32)
  FMTID_Pairing = "8807cae6-7db6-4f10-8ee4-435eaa1392bc"
  PKEY_Pairing_ListItemText = PROPERTYKEY.new(LibC::GUID.new(0x8807cae6_u32, 0x7db6_u16, 0x4f10_u16, StaticArray[0x8e_u8, 0xe4_u8, 0x43_u8, 0x5e_u8, 0xaa_u8, 0x13_u8, 0x92_u8, 0xbc_u8]), 1_u32)
  PKEY_Pairing_ListItemDescription = PROPERTYKEY.new(LibC::GUID.new(0x8807cae6_u32, 0x7db6_u16, 0x4f10_u16, StaticArray[0x8e_u8, 0xe4_u8, 0x43_u8, 0x5e_u8, 0xaa_u8, 0x13_u8, 0x92_u8, 0xbc_u8]), 2_u32)
  PKEY_Pairing_ListItemIcon = PROPERTYKEY.new(LibC::GUID.new(0x8807cae6_u32, 0x7db6_u16, 0x4f10_u16, StaticArray[0x8e_u8, 0xe4_u8, 0x43_u8, 0x5e_u8, 0xaa_u8, 0x13_u8, 0x92_u8, 0xbc_u8]), 3_u32)
  PKEY_Pairing_ListItemDefault = PROPERTYKEY.new(LibC::GUID.new(0x8807cae6_u32, 0x7db6_u16, 0x4f10_u16, StaticArray[0x8e_u8, 0xe4_u8, 0x43_u8, 0x5e_u8, 0xaa_u8, 0x13_u8, 0x92_u8, 0xbc_u8]), 4_u32)
  PKEY_Pairing_IsWifiOnlyDevice = PROPERTYKEY.new(LibC::GUID.new(0x8807cae6_u32, 0x7db6_u16, 0x4f10_u16, StaticArray[0x8e_u8, 0xe4_u8, 0x43_u8, 0x5e_u8, 0xaa_u8, 0x13_u8, 0x92_u8, 0xbc_u8]), 16_u32)
  PKEY_Device_BIOSVersion = PROPERTYKEY.new(LibC::GUID.new(0xeaee7f1d_u32, 0x6a33_u16, 0x44d1_u16, StaticArray[0x94_u8, 0x41_u8, 0x5f_u8, 0x46_u8, 0xde_u8, 0xf2_u8, 0x31_u8, 0x98_u8]), 9_u32)
  FMTID_WSD = "92506491-ff95-4724-a05a-5b81885a7c92"
  FMTID_PNPX = "656a3bb3-ecc0-43fd-8477-4ae0404a96cd"
  PKEY_PNPX_GlobalIdentity = PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 4096_u32)
  PKEY_PNPX_Types = PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 4097_u32)
  PKEY_PNPX_Scopes = PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 4098_u32)
  PKEY_PNPX_XAddrs = PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 4099_u32)
  PKEY_PNPX_MetadataVersion = PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 4100_u32)
  PKEY_PNPX_ID = PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 4101_u32)
  PKEY_PNPX_RemoteAddress = PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 4102_u32)
  PKEY_PNPX_RootProxy = PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 4103_u32)
  PKEY_PNPX_ManufacturerUrl = PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 8193_u32)
  PKEY_PNPX_ModelUrl = PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 8196_u32)
  PKEY_PNPX_Upc = PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 8197_u32)
  PKEY_PNPX_PresentationUrl = PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 8198_u32)
  PKEY_PNPX_FirmwareVersion = PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 12289_u32)
  PKEY_PNPX_SerialNumber = PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 12290_u32)
  PKEY_PNPX_DeviceCategory = PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 12292_u32)
  PKEY_PNPX_SecureChannel = PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 28673_u32)
  PKEY_PNPX_CompactSignature = PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 28674_u32)
  PKEY_PNPX_DeviceCertHash = PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 28675_u32)
  PKEY_PNPX_DeviceCategory_Desc = PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 12293_u32)
  PKEY_PNPX_Category_Desc_NonPlural = PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 12304_u32)
  PKEY_PNPX_PhysicalAddress = PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 12294_u32)
  PKEY_PNPX_NetworkInterfaceLuid = PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 12295_u32)
  PKEY_PNPX_NetworkInterfaceGuid = PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 12296_u32)
  PKEY_PNPX_IpAddress = PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 12297_u32)
  PKEY_PNPX_ServiceAddress = PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 16384_u32)
  PKEY_PNPX_ServiceId = PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 16385_u32)
  PKEY_PNPX_ServiceTypes = PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 16386_u32)
  PKEY_PNPX_ServiceControlUrl = PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 16388_u32)
  PKEY_PNPX_ServiceDescUrl = PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 16389_u32)
  PKEY_PNPX_ServiceEventSubUrl = PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 16390_u32)
  PKEY_PNPX_DomainName = PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 20480_u32)
  PKEY_PNPX_ShareName = PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 20482_u32)
  PKEY_SSDP_AltLocationInfo = PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 24576_u32)
  PKEY_SSDP_DevLifeTime = PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 24577_u32)
  PKEY_SSDP_NetworkInterface = PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 24578_u32)
  FMTID_PNPXDynamicProperty = "4fc5077e-b686-44be-93e3-86cafe368ccd"
  PKEY_PNPX_Installable = PROPERTYKEY.new(LibC::GUID.new(0x4fc5077e_u32, 0xb686_u16, 0x44be_u16, StaticArray[0x93_u8, 0xe3_u8, 0x86_u8, 0xca_u8, 0xfe_u8, 0x36_u8, 0x8c_u8, 0xcd_u8]), 1_u32)
  PKEY_PNPX_Associated = PROPERTYKEY.new(LibC::GUID.new(0x4fc5077e_u32, 0xb686_u16, 0x44be_u16, StaticArray[0x93_u8, 0xe3_u8, 0x86_u8, 0xca_u8, 0xfe_u8, 0x36_u8, 0x8c_u8, 0xcd_u8]), 2_u32)
  PKEY_PNPX_CompatibleTypes = PROPERTYKEY.new(LibC::GUID.new(0x4fc5077e_u32, 0xb686_u16, 0x44be_u16, StaticArray[0x93_u8, 0xe3_u8, 0x86_u8, 0xca_u8, 0xfe_u8, 0x36_u8, 0x8c_u8, 0xcd_u8]), 3_u32)
  PKEY_PNPX_InstallState = PROPERTYKEY.new(LibC::GUID.new(0x4fc5077e_u32, 0xb686_u16, 0x44be_u16, StaticArray[0x93_u8, 0xe3_u8, 0x86_u8, 0xca_u8, 0xfe_u8, 0x36_u8, 0x8c_u8, 0xcd_u8]), 4_u32)
  PNPX_INSTALLSTATE_NOTINSTALLED = 0_u32
  PNPX_INSTALLSTATE_INSTALLED = 1_u32
  PNPX_INSTALLSTATE_INSTALLING = 2_u32
  PNPX_INSTALLSTATE_FAILED = 3_u32
  PKEY_PNPX_Removable = PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 28672_u32)
  PKEY_PNPX_IPBusEnumerated = PROPERTYKEY.new(LibC::GUID.new(0x656a3bb3_u32, 0xecc0_u16, 0x43fd_u16, StaticArray[0x84_u8, 0x77_u8, 0x4a_u8, 0xe0_u8, 0x40_u8, 0x4a_u8, 0x96_u8, 0xcd_u8]), 28688_u32)
  PKEY_WNET_Scope = PROPERTYKEY.new(LibC::GUID.new(0xdebda43a_u32, 0x37b3_u16, 0x4383_u16, StaticArray[0x91_u8, 0xe7_u8, 0x44_u8, 0x98_u8, 0xda_u8, 0x29_u8, 0x95_u8, 0xab_u8]), 1_u32)
  PKEY_WNET_Type = PROPERTYKEY.new(LibC::GUID.new(0xdebda43a_u32, 0x37b3_u16, 0x4383_u16, StaticArray[0x91_u8, 0xe7_u8, 0x44_u8, 0x98_u8, 0xda_u8, 0x29_u8, 0x95_u8, 0xab_u8]), 2_u32)
  PKEY_WNET_DisplayType = PROPERTYKEY.new(LibC::GUID.new(0xdebda43a_u32, 0x37b3_u16, 0x4383_u16, StaticArray[0x91_u8, 0xe7_u8, 0x44_u8, 0x98_u8, 0xda_u8, 0x29_u8, 0x95_u8, 0xab_u8]), 3_u32)
  PKEY_WNET_Usage = PROPERTYKEY.new(LibC::GUID.new(0xdebda43a_u32, 0x37b3_u16, 0x4383_u16, StaticArray[0x91_u8, 0xe7_u8, 0x44_u8, 0x98_u8, 0xda_u8, 0x29_u8, 0x95_u8, 0xab_u8]), 4_u32)
  PKEY_WNET_LocalName = PROPERTYKEY.new(LibC::GUID.new(0xdebda43a_u32, 0x37b3_u16, 0x4383_u16, StaticArray[0x91_u8, 0xe7_u8, 0x44_u8, 0x98_u8, 0xda_u8, 0x29_u8, 0x95_u8, 0xab_u8]), 5_u32)
  PKEY_WNET_RemoteName = PROPERTYKEY.new(LibC::GUID.new(0xdebda43a_u32, 0x37b3_u16, 0x4383_u16, StaticArray[0x91_u8, 0xe7_u8, 0x44_u8, 0x98_u8, 0xda_u8, 0x29_u8, 0x95_u8, 0xab_u8]), 6_u32)
  PKEY_WNET_Comment = PROPERTYKEY.new(LibC::GUID.new(0xdebda43a_u32, 0x37b3_u16, 0x4383_u16, StaticArray[0x91_u8, 0xe7_u8, 0x44_u8, 0x98_u8, 0xda_u8, 0x29_u8, 0x95_u8, 0xab_u8]), 7_u32)
  PKEY_WNET_Provider = PROPERTYKEY.new(LibC::GUID.new(0xdebda43a_u32, 0x37b3_u16, 0x4383_u16, StaticArray[0x91_u8, 0xe7_u8, 0x44_u8, 0x98_u8, 0xda_u8, 0x29_u8, 0x95_u8, 0xab_u8]), 8_u32)
  PKEY_WCN_Version = PROPERTYKEY.new(LibC::GUID.new(0x88190b80_u32, 0x4684_u16, 0x11da_u16, StaticArray[0xa2_u8, 0x6a_u8, 0x0_u8, 0x2_u8, 0xb3_u8, 0x98_u8, 0x8e_u8, 0x81_u8]), 1_u32)
  PKEY_WCN_RequestType = PROPERTYKEY.new(LibC::GUID.new(0x88190b81_u32, 0x4684_u16, 0x11da_u16, StaticArray[0xa2_u8, 0x6a_u8, 0x0_u8, 0x2_u8, 0xb3_u8, 0x98_u8, 0x8e_u8, 0x81_u8]), 2_u32)
  PKEY_WCN_AuthType = PROPERTYKEY.new(LibC::GUID.new(0x88190b82_u32, 0x4684_u16, 0x11da_u16, StaticArray[0xa2_u8, 0x6a_u8, 0x0_u8, 0x2_u8, 0xb3_u8, 0x98_u8, 0x8e_u8, 0x81_u8]), 3_u32)
  PKEY_WCN_EncryptType = PROPERTYKEY.new(LibC::GUID.new(0x88190b83_u32, 0x4684_u16, 0x11da_u16, StaticArray[0xa2_u8, 0x6a_u8, 0x0_u8, 0x2_u8, 0xb3_u8, 0x98_u8, 0x8e_u8, 0x81_u8]), 4_u32)
  PKEY_WCN_ConnType = PROPERTYKEY.new(LibC::GUID.new(0x88190b84_u32, 0x4684_u16, 0x11da_u16, StaticArray[0xa2_u8, 0x6a_u8, 0x0_u8, 0x2_u8, 0xb3_u8, 0x98_u8, 0x8e_u8, 0x81_u8]), 5_u32)
  PKEY_WCN_ConfigMethods = PROPERTYKEY.new(LibC::GUID.new(0x88190b85_u32, 0x4684_u16, 0x11da_u16, StaticArray[0xa2_u8, 0x6a_u8, 0x0_u8, 0x2_u8, 0xb3_u8, 0x98_u8, 0x8e_u8, 0x81_u8]), 6_u32)
  PKEY_WCN_RfBand = PROPERTYKEY.new(LibC::GUID.new(0x88190b87_u32, 0x4684_u16, 0x11da_u16, StaticArray[0xa2_u8, 0x6a_u8, 0x0_u8, 0x2_u8, 0xb3_u8, 0x98_u8, 0x8e_u8, 0x81_u8]), 8_u32)
  PKEY_WCN_AssocState = PROPERTYKEY.new(LibC::GUID.new(0x88190b88_u32, 0x4684_u16, 0x11da_u16, StaticArray[0xa2_u8, 0x6a_u8, 0x0_u8, 0x2_u8, 0xb3_u8, 0x98_u8, 0x8e_u8, 0x81_u8]), 9_u32)
  PKEY_WCN_ConfigError = PROPERTYKEY.new(LibC::GUID.new(0x88190b89_u32, 0x4684_u16, 0x11da_u16, StaticArray[0xa2_u8, 0x6a_u8, 0x0_u8, 0x2_u8, 0xb3_u8, 0x98_u8, 0x8e_u8, 0x81_u8]), 10_u32)
  PKEY_WCN_ConfigState = PROPERTYKEY.new(LibC::GUID.new(0x88190b89_u32, 0x4684_u16, 0x11da_u16, StaticArray[0xa2_u8, 0x6a_u8, 0x0_u8, 0x2_u8, 0xb3_u8, 0x98_u8, 0x8e_u8, 0x81_u8]), 11_u32)
  PKEY_WCN_DevicePasswordId = PROPERTYKEY.new(LibC::GUID.new(0x88190b89_u32, 0x4684_u16, 0x11da_u16, StaticArray[0xa2_u8, 0x6a_u8, 0x0_u8, 0x2_u8, 0xb3_u8, 0x98_u8, 0x8e_u8, 0x81_u8]), 12_u32)
  PKEY_WCN_OSVersion = PROPERTYKEY.new(LibC::GUID.new(0x88190b89_u32, 0x4684_u16, 0x11da_u16, StaticArray[0xa2_u8, 0x6a_u8, 0x0_u8, 0x2_u8, 0xb3_u8, 0x98_u8, 0x8e_u8, 0x81_u8]), 13_u32)
  PKEY_WCN_VendorExtension = PROPERTYKEY.new(LibC::GUID.new(0x88190b8a_u32, 0x4684_u16, 0x11da_u16, StaticArray[0xa2_u8, 0x6a_u8, 0x0_u8, 0x2_u8, 0xb3_u8, 0x98_u8, 0x8e_u8, 0x81_u8]), 14_u32)
  PKEY_WCN_RegistrarType = PROPERTYKEY.new(LibC::GUID.new(0x88190b8b_u32, 0x4684_u16, 0x11da_u16, StaticArray[0xa2_u8, 0x6a_u8, 0x0_u8, 0x2_u8, 0xb3_u8, 0x98_u8, 0x8e_u8, 0x81_u8]), 15_u32)
  PKEY_Hardware_Devinst = PROPERTYKEY.new(LibC::GUID.new(0x5eaf3ef2_u32, 0xe0ca_u16, 0x4598_u16, StaticArray[0xbf_u8, 0x6_u8, 0x71_u8, 0xed_u8, 0x1d_u8, 0x9d_u8, 0xd9_u8, 0x53_u8]), 4097_u32)
  PKEY_Hardware_DisplayAttribute = PROPERTYKEY.new(LibC::GUID.new(0x5eaf3ef2_u32, 0xe0ca_u16, 0x4598_u16, StaticArray[0xbf_u8, 0x6_u8, 0x71_u8, 0xed_u8, 0x1d_u8, 0x9d_u8, 0xd9_u8, 0x53_u8]), 5_u32)
  PKEY_Hardware_DriverDate = PROPERTYKEY.new(LibC::GUID.new(0x5eaf3ef2_u32, 0xe0ca_u16, 0x4598_u16, StaticArray[0xbf_u8, 0x6_u8, 0x71_u8, 0xed_u8, 0x1d_u8, 0x9d_u8, 0xd9_u8, 0x53_u8]), 11_u32)
  PKEY_Hardware_DriverProvider = PROPERTYKEY.new(LibC::GUID.new(0x5eaf3ef2_u32, 0xe0ca_u16, 0x4598_u16, StaticArray[0xbf_u8, 0x6_u8, 0x71_u8, 0xed_u8, 0x1d_u8, 0x9d_u8, 0xd9_u8, 0x53_u8]), 10_u32)
  PKEY_Hardware_DriverVersion = PROPERTYKEY.new(LibC::GUID.new(0x5eaf3ef2_u32, 0xe0ca_u16, 0x4598_u16, StaticArray[0xbf_u8, 0x6_u8, 0x71_u8, 0xed_u8, 0x1d_u8, 0x9d_u8, 0xd9_u8, 0x53_u8]), 9_u32)
  PKEY_Hardware_Function = PROPERTYKEY.new(LibC::GUID.new(0x5eaf3ef2_u32, 0xe0ca_u16, 0x4598_u16, StaticArray[0xbf_u8, 0x6_u8, 0x71_u8, 0xed_u8, 0x1d_u8, 0x9d_u8, 0xd9_u8, 0x53_u8]), 4099_u32)
  PKEY_Hardware_Icon = PROPERTYKEY.new(LibC::GUID.new(0x5eaf3ef2_u32, 0xe0ca_u16, 0x4598_u16, StaticArray[0xbf_u8, 0x6_u8, 0x71_u8, 0xed_u8, 0x1d_u8, 0x9d_u8, 0xd9_u8, 0x53_u8]), 3_u32)
  PKEY_Hardware_Image = PROPERTYKEY.new(LibC::GUID.new(0x5eaf3ef2_u32, 0xe0ca_u16, 0x4598_u16, StaticArray[0xbf_u8, 0x6_u8, 0x71_u8, 0xed_u8, 0x1d_u8, 0x9d_u8, 0xd9_u8, 0x53_u8]), 4098_u32)
  PKEY_Hardware_Manufacturer = PROPERTYKEY.new(LibC::GUID.new(0x5eaf3ef2_u32, 0xe0ca_u16, 0x4598_u16, StaticArray[0xbf_u8, 0x6_u8, 0x71_u8, 0xed_u8, 0x1d_u8, 0x9d_u8, 0xd9_u8, 0x53_u8]), 6_u32)
  PKEY_Hardware_Model = PROPERTYKEY.new(LibC::GUID.new(0x5eaf3ef2_u32, 0xe0ca_u16, 0x4598_u16, StaticArray[0xbf_u8, 0x6_u8, 0x71_u8, 0xed_u8, 0x1d_u8, 0x9d_u8, 0xd9_u8, 0x53_u8]), 7_u32)
  PKEY_Hardware_Name = PROPERTYKEY.new(LibC::GUID.new(0x5eaf3ef2_u32, 0xe0ca_u16, 0x4598_u16, StaticArray[0xbf_u8, 0x6_u8, 0x71_u8, 0xed_u8, 0x1d_u8, 0x9d_u8, 0xd9_u8, 0x53_u8]), 2_u32)
  PKEY_Hardware_SerialNumber = PROPERTYKEY.new(LibC::GUID.new(0x5eaf3ef2_u32, 0xe0ca_u16, 0x4598_u16, StaticArray[0xbf_u8, 0x6_u8, 0x71_u8, 0xed_u8, 0x1d_u8, 0x9d_u8, 0xd9_u8, 0x53_u8]), 8_u32)
  PKEY_Hardware_ShellAttributes = PROPERTYKEY.new(LibC::GUID.new(0x5eaf3ef2_u32, 0xe0ca_u16, 0x4598_u16, StaticArray[0xbf_u8, 0x6_u8, 0x71_u8, 0xed_u8, 0x1d_u8, 0x9d_u8, 0xd9_u8, 0x53_u8]), 4100_u32)
  PKEY_Hardware_Status = PROPERTYKEY.new(LibC::GUID.new(0x5eaf3ef2_u32, 0xe0ca_u16, 0x4598_u16, StaticArray[0xbf_u8, 0x6_u8, 0x71_u8, 0xed_u8, 0x1d_u8, 0x9d_u8, 0xd9_u8, 0x53_u8]), 4096_u32)
  PKEY_NAME = PROPERTYKEY.new(LibC::GUID.new(0xb725f130_u32, 0x47ef_u16, 0x101a_u16, StaticArray[0xa5_u8, 0xf1_u8, 0x2_u8, 0x60_u8, 0x8c_u8, 0x9e_u8, 0xeb_u8, 0xac_u8]), 10_u32)
  PKEY_Device_DeviceDesc = PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 2_u32)
  PKEY_Device_HardwareIds = PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 3_u32)
  PKEY_Device_CompatibleIds = PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 4_u32)
  PKEY_Device_Service = PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 6_u32)
  PKEY_Device_Class = PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 9_u32)
  PKEY_Device_ClassGuid = PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 10_u32)
  PKEY_Device_Driver = PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 11_u32)
  PKEY_Device_ConfigFlags = PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 12_u32)
  PKEY_Device_Manufacturer = PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 13_u32)
  PKEY_Device_FriendlyName = PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 14_u32)
  PKEY_Device_LocationInfo = PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 15_u32)
  PKEY_Device_PDOName = PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 16_u32)
  PKEY_Device_Capabilities = PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 17_u32)
  PKEY_Device_UINumber = PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 18_u32)
  PKEY_Device_UpperFilters = PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 19_u32)
  PKEY_Device_LowerFilters = PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 20_u32)
  PKEY_Device_BusTypeGuid = PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 21_u32)
  PKEY_Device_LegacyBusType = PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 22_u32)
  PKEY_Device_BusNumber = PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 23_u32)
  PKEY_Device_EnumeratorName = PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 24_u32)
  PKEY_Device_Security = PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 25_u32)
  PKEY_Device_SecuritySDS = PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 26_u32)
  PKEY_Device_DevType = PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 27_u32)
  PKEY_Device_Exclusive = PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 28_u32)
  PKEY_Device_Characteristics = PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 29_u32)
  PKEY_Device_Address = PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 30_u32)
  PKEY_Device_UINumberDescFormat = PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 31_u32)
  PKEY_Device_PowerData = PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 32_u32)
  PKEY_Device_RemovalPolicy = PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 33_u32)
  PKEY_Device_RemovalPolicyDefault = PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 34_u32)
  PKEY_Device_RemovalPolicyOverride = PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 35_u32)
  PKEY_Device_InstallState = PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 36_u32)
  PKEY_Device_LocationPaths = PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 37_u32)
  PKEY_Device_BaseContainerId = PROPERTYKEY.new(LibC::GUID.new(0xa45c254e_u32, 0xdf1c_u16, 0x4efd_u16, StaticArray[0x80_u8, 0x20_u8, 0x67_u8, 0xd1_u8, 0x46_u8, 0xa8_u8, 0x50_u8, 0xe0_u8]), 38_u32)
  PKEY_Device_DevNodeStatus = PROPERTYKEY.new(LibC::GUID.new(0x4340a6c5_u32, 0x93fa_u16, 0x4706_u16, StaticArray[0x97_u8, 0x2c_u8, 0x7b_u8, 0x64_u8, 0x80_u8, 0x8_u8, 0xa5_u8, 0xa7_u8]), 2_u32)
  PKEY_Device_ProblemCode = PROPERTYKEY.new(LibC::GUID.new(0x4340a6c5_u32, 0x93fa_u16, 0x4706_u16, StaticArray[0x97_u8, 0x2c_u8, 0x7b_u8, 0x64_u8, 0x80_u8, 0x8_u8, 0xa5_u8, 0xa7_u8]), 3_u32)
  PKEY_Device_EjectionRelations = PROPERTYKEY.new(LibC::GUID.new(0x4340a6c5_u32, 0x93fa_u16, 0x4706_u16, StaticArray[0x97_u8, 0x2c_u8, 0x7b_u8, 0x64_u8, 0x80_u8, 0x8_u8, 0xa5_u8, 0xa7_u8]), 4_u32)
  PKEY_Device_RemovalRelations = PROPERTYKEY.new(LibC::GUID.new(0x4340a6c5_u32, 0x93fa_u16, 0x4706_u16, StaticArray[0x97_u8, 0x2c_u8, 0x7b_u8, 0x64_u8, 0x80_u8, 0x8_u8, 0xa5_u8, 0xa7_u8]), 5_u32)
  PKEY_Device_PowerRelations = PROPERTYKEY.new(LibC::GUID.new(0x4340a6c5_u32, 0x93fa_u16, 0x4706_u16, StaticArray[0x97_u8, 0x2c_u8, 0x7b_u8, 0x64_u8, 0x80_u8, 0x8_u8, 0xa5_u8, 0xa7_u8]), 6_u32)
  PKEY_Device_BusRelations = PROPERTYKEY.new(LibC::GUID.new(0x4340a6c5_u32, 0x93fa_u16, 0x4706_u16, StaticArray[0x97_u8, 0x2c_u8, 0x7b_u8, 0x64_u8, 0x80_u8, 0x8_u8, 0xa5_u8, 0xa7_u8]), 7_u32)
  PKEY_Device_Parent = PROPERTYKEY.new(LibC::GUID.new(0x4340a6c5_u32, 0x93fa_u16, 0x4706_u16, StaticArray[0x97_u8, 0x2c_u8, 0x7b_u8, 0x64_u8, 0x80_u8, 0x8_u8, 0xa5_u8, 0xa7_u8]), 8_u32)
  PKEY_Device_Children = PROPERTYKEY.new(LibC::GUID.new(0x4340a6c5_u32, 0x93fa_u16, 0x4706_u16, StaticArray[0x97_u8, 0x2c_u8, 0x7b_u8, 0x64_u8, 0x80_u8, 0x8_u8, 0xa5_u8, 0xa7_u8]), 9_u32)
  PKEY_Device_Siblings = PROPERTYKEY.new(LibC::GUID.new(0x4340a6c5_u32, 0x93fa_u16, 0x4706_u16, StaticArray[0x97_u8, 0x2c_u8, 0x7b_u8, 0x64_u8, 0x80_u8, 0x8_u8, 0xa5_u8, 0xa7_u8]), 10_u32)
  PKEY_Device_TransportRelations = PROPERTYKEY.new(LibC::GUID.new(0x4340a6c5_u32, 0x93fa_u16, 0x4706_u16, StaticArray[0x97_u8, 0x2c_u8, 0x7b_u8, 0x64_u8, 0x80_u8, 0x8_u8, 0xa5_u8, 0xa7_u8]), 11_u32)
  PKEY_Device_Reported = PROPERTYKEY.new(LibC::GUID.new(0x80497100_u32, 0x8c73_u16, 0x48b9_u16, StaticArray[0xaa_u8, 0xd9_u8, 0xce_u8, 0x38_u8, 0x7e_u8, 0x19_u8, 0xc5_u8, 0x6e_u8]), 2_u32)
  PKEY_Device_Legacy = PROPERTYKEY.new(LibC::GUID.new(0x80497100_u32, 0x8c73_u16, 0x48b9_u16, StaticArray[0xaa_u8, 0xd9_u8, 0xce_u8, 0x38_u8, 0x7e_u8, 0x19_u8, 0xc5_u8, 0x6e_u8]), 3_u32)
  PKEY_Device_InstanceId = PROPERTYKEY.new(LibC::GUID.new(0x78c34fc8_u32, 0x104a_u16, 0x4aca_u16, StaticArray[0x9e_u8, 0xa4_u8, 0x52_u8, 0x4d_u8, 0x52_u8, 0x99_u8, 0x6e_u8, 0x57_u8]), 256_u32)
  PKEY_Device_ContainerId = PROPERTYKEY.new(LibC::GUID.new(0x8c7ed206_u32, 0x3f8a_u16, 0x4827_u16, StaticArray[0xb3_u8, 0xab_u8, 0xae_u8, 0x9e_u8, 0x1f_u8, 0xae_u8, 0xfc_u8, 0x6c_u8]), 2_u32)
  PKEY_Device_ModelId = PROPERTYKEY.new(LibC::GUID.new(0x80d81ea6_u32, 0x7473_u16, 0x4b0c_u16, StaticArray[0x82_u8, 0x16_u8, 0xef_u8, 0xc1_u8, 0x1a_u8, 0x2c_u8, 0x4c_u8, 0x8b_u8]), 2_u32)
  PKEY_Device_FriendlyNameAttributes = PROPERTYKEY.new(LibC::GUID.new(0x80d81ea6_u32, 0x7473_u16, 0x4b0c_u16, StaticArray[0x82_u8, 0x16_u8, 0xef_u8, 0xc1_u8, 0x1a_u8, 0x2c_u8, 0x4c_u8, 0x8b_u8]), 3_u32)
  PKEY_Device_ManufacturerAttributes = PROPERTYKEY.new(LibC::GUID.new(0x80d81ea6_u32, 0x7473_u16, 0x4b0c_u16, StaticArray[0x82_u8, 0x16_u8, 0xef_u8, 0xc1_u8, 0x1a_u8, 0x2c_u8, 0x4c_u8, 0x8b_u8]), 4_u32)
  PKEY_Device_PresenceNotForDevice = PROPERTYKEY.new(LibC::GUID.new(0x80d81ea6_u32, 0x7473_u16, 0x4b0c_u16, StaticArray[0x82_u8, 0x16_u8, 0xef_u8, 0xc1_u8, 0x1a_u8, 0x2c_u8, 0x4c_u8, 0x8b_u8]), 5_u32)
  PKEY_Device_SignalStrength = PROPERTYKEY.new(LibC::GUID.new(0x80d81ea6_u32, 0x7473_u16, 0x4b0c_u16, StaticArray[0x82_u8, 0x16_u8, 0xef_u8, 0xc1_u8, 0x1a_u8, 0x2c_u8, 0x4c_u8, 0x8b_u8]), 6_u32)
  PKEY_Device_IsAssociateableByUserAction = PROPERTYKEY.new(LibC::GUID.new(0x80d81ea6_u32, 0x7473_u16, 0x4b0c_u16, StaticArray[0x82_u8, 0x16_u8, 0xef_u8, 0xc1_u8, 0x1a_u8, 0x2c_u8, 0x4c_u8, 0x8b_u8]), 7_u32)
  PKEY_Numa_Proximity_Domain = PROPERTYKEY.new(LibC::GUID.new(0x540b947e_u32, 0x8b40_u16, 0x45bc_u16, StaticArray[0xa8_u8, 0xa2_u8, 0x6a_u8, 0xb_u8, 0x89_u8, 0x4c_u8, 0xbd_u8, 0xa2_u8]), 1_u32)
  PKEY_Device_DHP_Rebalance_Policy = PROPERTYKEY.new(LibC::GUID.new(0x540b947e_u32, 0x8b40_u16, 0x45bc_u16, StaticArray[0xa8_u8, 0xa2_u8, 0x6a_u8, 0xb_u8, 0x89_u8, 0x4c_u8, 0xbd_u8, 0xa2_u8]), 2_u32)
  PKEY_Device_Numa_Node = PROPERTYKEY.new(LibC::GUID.new(0x540b947e_u32, 0x8b40_u16, 0x45bc_u16, StaticArray[0xa8_u8, 0xa2_u8, 0x6a_u8, 0xb_u8, 0x89_u8, 0x4c_u8, 0xbd_u8, 0xa2_u8]), 3_u32)
  PKEY_Device_BusReportedDeviceDesc = PROPERTYKEY.new(LibC::GUID.new(0x540b947e_u32, 0x8b40_u16, 0x45bc_u16, StaticArray[0xa8_u8, 0xa2_u8, 0x6a_u8, 0xb_u8, 0x89_u8, 0x4c_u8, 0xbd_u8, 0xa2_u8]), 4_u32)
  PKEY_Device_InstallInProgress = PROPERTYKEY.new(LibC::GUID.new(0x83da6326_u32, 0x97a6_u16, 0x4088_u16, StaticArray[0x94_u8, 0x53_u8, 0xa1_u8, 0x92_u8, 0x3f_u8, 0x57_u8, 0x3b_u8, 0x29_u8]), 9_u32)
  PKEY_Device_DriverDate = PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 2_u32)
  PKEY_Device_DriverVersion = PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 3_u32)
  PKEY_Device_DriverDesc = PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 4_u32)
  PKEY_Device_DriverInfPath = PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 5_u32)
  PKEY_Device_DriverInfSection = PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 6_u32)
  PKEY_Device_DriverInfSectionExt = PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 7_u32)
  PKEY_Device_MatchingDeviceId = PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 8_u32)
  PKEY_Device_DriverProvider = PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 9_u32)
  PKEY_Device_DriverPropPageProvider = PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 10_u32)
  PKEY_Device_DriverCoInstallers = PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 11_u32)
  PKEY_Device_ResourcePickerTags = PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 12_u32)
  PKEY_Device_ResourcePickerExceptions = PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 13_u32)
  PKEY_Device_DriverRank = PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 14_u32)
  PKEY_Device_DriverLogoLevel = PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 15_u32)
  PKEY_Device_NoConnectSound = PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 17_u32)
  PKEY_Device_GenericDriverInstalled = PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 18_u32)
  PKEY_Device_AdditionalSoftwareRequested = PROPERTYKEY.new(LibC::GUID.new(0xa8b865dd_u32, 0x2e3d_u16, 0x4094_u16, StaticArray[0xad_u8, 0x97_u8, 0xe5_u8, 0x93_u8, 0xa7_u8, 0xc_u8, 0x75_u8, 0xd6_u8]), 19_u32)
  PKEY_Device_SafeRemovalRequired = PROPERTYKEY.new(LibC::GUID.new(0xafd97640_u32, 0x86a3_u16, 0x4210_u16, StaticArray[0xb6_u8, 0x7c_u8, 0x28_u8, 0x9c_u8, 0x41_u8, 0xaa_u8, 0xbe_u8, 0x55_u8]), 2_u32)
  PKEY_Device_SafeRemovalRequiredOverride = PROPERTYKEY.new(LibC::GUID.new(0xafd97640_u32, 0x86a3_u16, 0x4210_u16, StaticArray[0xb6_u8, 0x7c_u8, 0x28_u8, 0x9c_u8, 0x41_u8, 0xaa_u8, 0xbe_u8, 0x55_u8]), 3_u32)
  PKEY_DrvPkg_Model = PROPERTYKEY.new(LibC::GUID.new(0xcf73bb51_u32, 0x3abf_u16, 0x44a2_u16, StaticArray[0x85_u8, 0xe0_u8, 0x9a_u8, 0x3d_u8, 0xc7_u8, 0xa1_u8, 0x21_u8, 0x32_u8]), 2_u32)
  PKEY_DrvPkg_VendorWebSite = PROPERTYKEY.new(LibC::GUID.new(0xcf73bb51_u32, 0x3abf_u16, 0x44a2_u16, StaticArray[0x85_u8, 0xe0_u8, 0x9a_u8, 0x3d_u8, 0xc7_u8, 0xa1_u8, 0x21_u8, 0x32_u8]), 3_u32)
  PKEY_DrvPkg_DetailedDescription = PROPERTYKEY.new(LibC::GUID.new(0xcf73bb51_u32, 0x3abf_u16, 0x44a2_u16, StaticArray[0x85_u8, 0xe0_u8, 0x9a_u8, 0x3d_u8, 0xc7_u8, 0xa1_u8, 0x21_u8, 0x32_u8]), 4_u32)
  PKEY_DrvPkg_DocumentationLink = PROPERTYKEY.new(LibC::GUID.new(0xcf73bb51_u32, 0x3abf_u16, 0x44a2_u16, StaticArray[0x85_u8, 0xe0_u8, 0x9a_u8, 0x3d_u8, 0xc7_u8, 0xa1_u8, 0x21_u8, 0x32_u8]), 5_u32)
  PKEY_DrvPkg_Icon = PROPERTYKEY.new(LibC::GUID.new(0xcf73bb51_u32, 0x3abf_u16, 0x44a2_u16, StaticArray[0x85_u8, 0xe0_u8, 0x9a_u8, 0x3d_u8, 0xc7_u8, 0xa1_u8, 0x21_u8, 0x32_u8]), 6_u32)
  PKEY_DrvPkg_BrandingIcon = PROPERTYKEY.new(LibC::GUID.new(0xcf73bb51_u32, 0x3abf_u16, 0x44a2_u16, StaticArray[0x85_u8, 0xe0_u8, 0x9a_u8, 0x3d_u8, 0xc7_u8, 0xa1_u8, 0x21_u8, 0x32_u8]), 7_u32)
  PKEY_DeviceClass_UpperFilters = PROPERTYKEY.new(LibC::GUID.new(0x4321918b_u32, 0xf69e_u16, 0x470d_u16, StaticArray[0xa5_u8, 0xde_u8, 0x4d_u8, 0x88_u8, 0xc7_u8, 0x5a_u8, 0xd2_u8, 0x4b_u8]), 19_u32)
  PKEY_DeviceClass_LowerFilters = PROPERTYKEY.new(LibC::GUID.new(0x4321918b_u32, 0xf69e_u16, 0x470d_u16, StaticArray[0xa5_u8, 0xde_u8, 0x4d_u8, 0x88_u8, 0xc7_u8, 0x5a_u8, 0xd2_u8, 0x4b_u8]), 20_u32)
  PKEY_DeviceClass_Security = PROPERTYKEY.new(LibC::GUID.new(0x4321918b_u32, 0xf69e_u16, 0x470d_u16, StaticArray[0xa5_u8, 0xde_u8, 0x4d_u8, 0x88_u8, 0xc7_u8, 0x5a_u8, 0xd2_u8, 0x4b_u8]), 25_u32)
  PKEY_DeviceClass_SecuritySDS = PROPERTYKEY.new(LibC::GUID.new(0x4321918b_u32, 0xf69e_u16, 0x470d_u16, StaticArray[0xa5_u8, 0xde_u8, 0x4d_u8, 0x88_u8, 0xc7_u8, 0x5a_u8, 0xd2_u8, 0x4b_u8]), 26_u32)
  PKEY_DeviceClass_DevType = PROPERTYKEY.new(LibC::GUID.new(0x4321918b_u32, 0xf69e_u16, 0x470d_u16, StaticArray[0xa5_u8, 0xde_u8, 0x4d_u8, 0x88_u8, 0xc7_u8, 0x5a_u8, 0xd2_u8, 0x4b_u8]), 27_u32)
  PKEY_DeviceClass_Exclusive = PROPERTYKEY.new(LibC::GUID.new(0x4321918b_u32, 0xf69e_u16, 0x470d_u16, StaticArray[0xa5_u8, 0xde_u8, 0x4d_u8, 0x88_u8, 0xc7_u8, 0x5a_u8, 0xd2_u8, 0x4b_u8]), 28_u32)
  PKEY_DeviceClass_Characteristics = PROPERTYKEY.new(LibC::GUID.new(0x4321918b_u32, 0xf69e_u16, 0x470d_u16, StaticArray[0xa5_u8, 0xde_u8, 0x4d_u8, 0x88_u8, 0xc7_u8, 0x5a_u8, 0xd2_u8, 0x4b_u8]), 29_u32)
  PKEY_DeviceClass_Name = PROPERTYKEY.new(LibC::GUID.new(0x259abffc_u32, 0x50a7_u16, 0x47ce_u16, StaticArray[0xaf_u8, 0x8_u8, 0x68_u8, 0xc9_u8, 0xa7_u8, 0xd7_u8, 0x33_u8, 0x66_u8]), 2_u32)
  PKEY_DeviceClass_ClassName = PROPERTYKEY.new(LibC::GUID.new(0x259abffc_u32, 0x50a7_u16, 0x47ce_u16, StaticArray[0xaf_u8, 0x8_u8, 0x68_u8, 0xc9_u8, 0xa7_u8, 0xd7_u8, 0x33_u8, 0x66_u8]), 3_u32)
  PKEY_DeviceClass_Icon = PROPERTYKEY.new(LibC::GUID.new(0x259abffc_u32, 0x50a7_u16, 0x47ce_u16, StaticArray[0xaf_u8, 0x8_u8, 0x68_u8, 0xc9_u8, 0xa7_u8, 0xd7_u8, 0x33_u8, 0x66_u8]), 4_u32)
  PKEY_DeviceClass_ClassInstaller = PROPERTYKEY.new(LibC::GUID.new(0x259abffc_u32, 0x50a7_u16, 0x47ce_u16, StaticArray[0xaf_u8, 0x8_u8, 0x68_u8, 0xc9_u8, 0xa7_u8, 0xd7_u8, 0x33_u8, 0x66_u8]), 5_u32)
  PKEY_DeviceClass_PropPageProvider = PROPERTYKEY.new(LibC::GUID.new(0x259abffc_u32, 0x50a7_u16, 0x47ce_u16, StaticArray[0xaf_u8, 0x8_u8, 0x68_u8, 0xc9_u8, 0xa7_u8, 0xd7_u8, 0x33_u8, 0x66_u8]), 6_u32)
  PKEY_DeviceClass_NoInstallClass = PROPERTYKEY.new(LibC::GUID.new(0x259abffc_u32, 0x50a7_u16, 0x47ce_u16, StaticArray[0xaf_u8, 0x8_u8, 0x68_u8, 0xc9_u8, 0xa7_u8, 0xd7_u8, 0x33_u8, 0x66_u8]), 7_u32)
  PKEY_DeviceClass_NoDisplayClass = PROPERTYKEY.new(LibC::GUID.new(0x259abffc_u32, 0x50a7_u16, 0x47ce_u16, StaticArray[0xaf_u8, 0x8_u8, 0x68_u8, 0xc9_u8, 0xa7_u8, 0xd7_u8, 0x33_u8, 0x66_u8]), 8_u32)
  PKEY_DeviceClass_SilentInstall = PROPERTYKEY.new(LibC::GUID.new(0x259abffc_u32, 0x50a7_u16, 0x47ce_u16, StaticArray[0xaf_u8, 0x8_u8, 0x68_u8, 0xc9_u8, 0xa7_u8, 0xd7_u8, 0x33_u8, 0x66_u8]), 9_u32)
  PKEY_DeviceClass_NoUseClass = PROPERTYKEY.new(LibC::GUID.new(0x259abffc_u32, 0x50a7_u16, 0x47ce_u16, StaticArray[0xaf_u8, 0x8_u8, 0x68_u8, 0xc9_u8, 0xa7_u8, 0xd7_u8, 0x33_u8, 0x66_u8]), 10_u32)
  PKEY_DeviceClass_DefaultService = PROPERTYKEY.new(LibC::GUID.new(0x259abffc_u32, 0x50a7_u16, 0x47ce_u16, StaticArray[0xaf_u8, 0x8_u8, 0x68_u8, 0xc9_u8, 0xa7_u8, 0xd7_u8, 0x33_u8, 0x66_u8]), 11_u32)
  PKEY_DeviceClass_IconPath = PROPERTYKEY.new(LibC::GUID.new(0x259abffc_u32, 0x50a7_u16, 0x47ce_u16, StaticArray[0xaf_u8, 0x8_u8, 0x68_u8, 0xc9_u8, 0xa7_u8, 0xd7_u8, 0x33_u8, 0x66_u8]), 12_u32)
  PKEY_DeviceClass_ClassCoInstallers = PROPERTYKEY.new(LibC::GUID.new(0x713d1703_u32, 0xa2e2_u16, 0x49f5_u16, StaticArray[0x92_u8, 0x14_u8, 0x56_u8, 0x47_u8, 0x2e_u8, 0xf3_u8, 0xda_u8, 0x5c_u8]), 2_u32)
  PKEY_DeviceInterface_FriendlyName = PROPERTYKEY.new(LibC::GUID.new(0x26e516e_u32, 0xb814_u16, 0x414b_u16, StaticArray[0x83_u8, 0xcd_u8, 0x85_u8, 0x6d_u8, 0x6f_u8, 0xef_u8, 0x48_u8, 0x22_u8]), 2_u32)
  PKEY_DeviceInterface_Enabled = PROPERTYKEY.new(LibC::GUID.new(0x26e516e_u32, 0xb814_u16, 0x414b_u16, StaticArray[0x83_u8, 0xcd_u8, 0x85_u8, 0x6d_u8, 0x6f_u8, 0xef_u8, 0x48_u8, 0x22_u8]), 3_u32)
  PKEY_DeviceInterface_ClassGuid = PROPERTYKEY.new(LibC::GUID.new(0x26e516e_u32, 0xb814_u16, 0x414b_u16, StaticArray[0x83_u8, 0xcd_u8, 0x85_u8, 0x6d_u8, 0x6f_u8, 0xef_u8, 0x48_u8, 0x22_u8]), 4_u32)
  PKEY_DeviceInterfaceClass_DefaultInterface = PROPERTYKEY.new(LibC::GUID.new(0x14c83a99_u32, 0xb3f_u16, 0x44b7_u16, StaticArray[0xbe_u8, 0x4c_u8, 0xa1_u8, 0x78_u8, 0xd3_u8, 0x99_u8, 0x5_u8, 0x64_u8]), 2_u32)
  FD_LONGHORN = 1_u32
  MAX_FDCONSTRAINTNAME_LENGTH = 100_u32
  MAX_FDCONSTRAINTVALUE_LENGTH = 1000_u32
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


  enum PropertyConstraint : Int32
    QC_EQUALS = 0
    QC_NOTEQUAL = 1
    QC_LESSTHAN = 2
    QC_LESSTHANOREQUAL = 3
    QC_GREATERTHAN = 4
    QC_GREATERTHANOREQUAL = 5
    QC_STARTSWITH = 6
    QC_EXISTS = 7
    QC_DOESNOTEXIST = 8
    QC_CONTAINS = 9
  end

  enum SystemVisibilityFlags : Int32
    SVF_SYSTEM = 0
    SVF_USER = 1
  end

  enum QueryUpdateAction : Int32
    QUA_ADD = 0
    QUA_REMOVE = 1
    QUA_CHANGE = 2
  end

  enum QueryCategoryType : Int32
    QCT_PROVIDER = 0
    QCT_LAYERED = 1
  end


  struct IFunctionDiscoveryNotificationVTbl
    query_interface : Proc(IFunctionDiscoveryNotification*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFunctionDiscoveryNotification*, UInt32)
    release : Proc(IFunctionDiscoveryNotification*, UInt32)
    on_update : Proc(IFunctionDiscoveryNotification*, QueryUpdateAction, UInt64, IFunctionInstance, HRESULT)
    on_error : Proc(IFunctionDiscoveryNotification*, HRESULT, UInt64, LibC::LPWSTR, HRESULT)
    on_event : Proc(IFunctionDiscoveryNotification*, UInt32, UInt64, LibC::LPWSTR, HRESULT)
  end

  IFunctionDiscoveryNotification_GUID = "5f6c1ba8-5330-422e-a368-572b244d3f87"
  IID_IFunctionDiscoveryNotification = LibC::GUID.new(0x5f6c1ba8_u32, 0x5330_u16, 0x422e_u16, StaticArray[0xa3_u8, 0x68_u8, 0x57_u8, 0x2b_u8, 0x24_u8, 0x4d_u8, 0x3f_u8, 0x87_u8])
  struct IFunctionDiscoveryNotification
    lpVtbl : IFunctionDiscoveryNotificationVTbl*
  end

  struct IFunctionDiscoveryVTbl
    query_interface : Proc(IFunctionDiscovery*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFunctionDiscovery*, UInt32)
    release : Proc(IFunctionDiscovery*, UInt32)
    get_instance_collection : Proc(IFunctionDiscovery*, LibC::LPWSTR, LibC::LPWSTR, LibC::BOOL, IFunctionInstanceCollection*, HRESULT)
    get_instance : Proc(IFunctionDiscovery*, LibC::LPWSTR, IFunctionInstance*, HRESULT)
    create_instance_collection_query : Proc(IFunctionDiscovery*, LibC::LPWSTR, LibC::LPWSTR, LibC::BOOL, IFunctionDiscoveryNotification, UInt64*, IFunctionInstanceCollectionQuery*, HRESULT)
    create_instance_query : Proc(IFunctionDiscovery*, LibC::LPWSTR, IFunctionDiscoveryNotification, UInt64*, IFunctionInstanceQuery*, HRESULT)
    add_instance : Proc(IFunctionDiscovery*, SystemVisibilityFlags, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, IFunctionInstance*, HRESULT)
    remove_instance : Proc(IFunctionDiscovery*, SystemVisibilityFlags, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
  end

  IFunctionDiscovery_GUID = "4df99b70-e148-4432-b004-4c9eeb535a5e"
  IID_IFunctionDiscovery = LibC::GUID.new(0x4df99b70_u32, 0xe148_u16, 0x4432_u16, StaticArray[0xb0_u8, 0x4_u8, 0x4c_u8, 0x9e_u8, 0xeb_u8, 0x53_u8, 0x5a_u8, 0x5e_u8])
  struct IFunctionDiscovery
    lpVtbl : IFunctionDiscoveryVTbl*
  end

  struct IFunctionInstanceVTbl
    query_interface : Proc(IFunctionInstance*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFunctionInstance*, UInt32)
    release : Proc(IFunctionInstance*, UInt32)
    query_service : Proc(IFunctionInstance*, Guid*, Guid*, Void**, HRESULT)
    get_id : Proc(IFunctionInstance*, UInt16**, HRESULT)
    get_provider_instance_id : Proc(IFunctionInstance*, UInt16**, HRESULT)
    open_property_store : Proc(IFunctionInstance*, UInt32, IPropertyStore*, HRESULT)
    get_category : Proc(IFunctionInstance*, UInt16**, UInt16**, HRESULT)
  end

  IFunctionInstance_GUID = "33591c10-0bed-4f02-b0ab-1530d5533ee9"
  IID_IFunctionInstance = LibC::GUID.new(0x33591c10_u32, 0xbed_u16, 0x4f02_u16, StaticArray[0xb0_u8, 0xab_u8, 0x15_u8, 0x30_u8, 0xd5_u8, 0x53_u8, 0x3e_u8, 0xe9_u8])
  struct IFunctionInstance
    lpVtbl : IFunctionInstanceVTbl*
  end

  struct IFunctionInstanceCollectionVTbl
    query_interface : Proc(IFunctionInstanceCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFunctionInstanceCollection*, UInt32)
    release : Proc(IFunctionInstanceCollection*, UInt32)
    get_count : Proc(IFunctionInstanceCollection*, UInt32*, HRESULT)
    get : Proc(IFunctionInstanceCollection*, LibC::LPWSTR, UInt32*, IFunctionInstance*, HRESULT)
    item : Proc(IFunctionInstanceCollection*, UInt32, IFunctionInstance*, HRESULT)
    add : Proc(IFunctionInstanceCollection*, IFunctionInstance, HRESULT)
    remove : Proc(IFunctionInstanceCollection*, UInt32, IFunctionInstance*, HRESULT)
    delete : Proc(IFunctionInstanceCollection*, UInt32, HRESULT)
    delete_all : Proc(IFunctionInstanceCollection*, HRESULT)
  end

  IFunctionInstanceCollection_GUID = "f0a3d895-855c-42a2-948d-2f97d450ecb1"
  IID_IFunctionInstanceCollection = LibC::GUID.new(0xf0a3d895_u32, 0x855c_u16, 0x42a2_u16, StaticArray[0x94_u8, 0x8d_u8, 0x2f_u8, 0x97_u8, 0xd4_u8, 0x50_u8, 0xec_u8, 0xb1_u8])
  struct IFunctionInstanceCollection
    lpVtbl : IFunctionInstanceCollectionVTbl*
  end

  struct IPropertyStoreCollectionVTbl
    query_interface : Proc(IPropertyStoreCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPropertyStoreCollection*, UInt32)
    release : Proc(IPropertyStoreCollection*, UInt32)
    get_count : Proc(IPropertyStoreCollection*, UInt32*, HRESULT)
    get : Proc(IPropertyStoreCollection*, LibC::LPWSTR, UInt32*, IPropertyStore*, HRESULT)
    item : Proc(IPropertyStoreCollection*, UInt32, IPropertyStore*, HRESULT)
    add : Proc(IPropertyStoreCollection*, IPropertyStore, HRESULT)
    remove : Proc(IPropertyStoreCollection*, UInt32, IPropertyStore*, HRESULT)
    delete : Proc(IPropertyStoreCollection*, UInt32, HRESULT)
    delete_all : Proc(IPropertyStoreCollection*, HRESULT)
  end

  IPropertyStoreCollection_GUID = "d14d9c30-12d2-42d8-bce4-c60c2bb226fa"
  IID_IPropertyStoreCollection = LibC::GUID.new(0xd14d9c30_u32, 0x12d2_u16, 0x42d8_u16, StaticArray[0xbc_u8, 0xe4_u8, 0xc6_u8, 0xc_u8, 0x2b_u8, 0xb2_u8, 0x26_u8, 0xfa_u8])
  struct IPropertyStoreCollection
    lpVtbl : IPropertyStoreCollectionVTbl*
  end

  struct IFunctionInstanceQueryVTbl
    query_interface : Proc(IFunctionInstanceQuery*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFunctionInstanceQuery*, UInt32)
    release : Proc(IFunctionInstanceQuery*, UInt32)
    execute : Proc(IFunctionInstanceQuery*, IFunctionInstance*, HRESULT)
  end

  IFunctionInstanceQuery_GUID = "6242bc6b-90ec-4b37-bb46-e229fd84ed95"
  IID_IFunctionInstanceQuery = LibC::GUID.new(0x6242bc6b_u32, 0x90ec_u16, 0x4b37_u16, StaticArray[0xbb_u8, 0x46_u8, 0xe2_u8, 0x29_u8, 0xfd_u8, 0x84_u8, 0xed_u8, 0x95_u8])
  struct IFunctionInstanceQuery
    lpVtbl : IFunctionInstanceQueryVTbl*
  end

  struct IFunctionInstanceCollectionQueryVTbl
    query_interface : Proc(IFunctionInstanceCollectionQuery*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFunctionInstanceCollectionQuery*, UInt32)
    release : Proc(IFunctionInstanceCollectionQuery*, UInt32)
    add_query_constraint : Proc(IFunctionInstanceCollectionQuery*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    add_property_constraint : Proc(IFunctionInstanceCollectionQuery*, PROPERTYKEY*, PROPVARIANT*, PropertyConstraint, HRESULT)
    execute : Proc(IFunctionInstanceCollectionQuery*, IFunctionInstanceCollection*, HRESULT)
  end

  IFunctionInstanceCollectionQuery_GUID = "57cc6fd2-c09a-4289-bb72-25f04142058e"
  IID_IFunctionInstanceCollectionQuery = LibC::GUID.new(0x57cc6fd2_u32, 0xc09a_u16, 0x4289_u16, StaticArray[0xbb_u8, 0x72_u8, 0x25_u8, 0xf0_u8, 0x41_u8, 0x42_u8, 0x5_u8, 0x8e_u8])
  struct IFunctionInstanceCollectionQuery
    lpVtbl : IFunctionInstanceCollectionQueryVTbl*
  end

  struct IFunctionDiscoveryProviderVTbl
    query_interface : Proc(IFunctionDiscoveryProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFunctionDiscoveryProvider*, UInt32)
    release : Proc(IFunctionDiscoveryProvider*, UInt32)
    initialize : Proc(IFunctionDiscoveryProvider*, IFunctionDiscoveryProviderFactory, IFunctionDiscoveryNotification, UInt32, UInt32*, HRESULT)
    query : Proc(IFunctionDiscoveryProvider*, IFunctionDiscoveryProviderQuery, IFunctionInstanceCollection*, HRESULT)
    end_query : Proc(IFunctionDiscoveryProvider*, HRESULT)
    instance_property_store_validate_access : Proc(IFunctionDiscoveryProvider*, IFunctionInstance, LibC::IntPtrT, UInt32, HRESULT)
    instance_property_store_open : Proc(IFunctionDiscoveryProvider*, IFunctionInstance, LibC::IntPtrT, UInt32, IPropertyStore*, HRESULT)
    instance_property_store_flush : Proc(IFunctionDiscoveryProvider*, IFunctionInstance, LibC::IntPtrT, HRESULT)
    instance_query_service : Proc(IFunctionDiscoveryProvider*, IFunctionInstance, LibC::IntPtrT, Guid*, Guid*, IUnknown*, HRESULT)
    instance_released : Proc(IFunctionDiscoveryProvider*, IFunctionInstance, LibC::IntPtrT, HRESULT)
  end

  IFunctionDiscoveryProvider_GUID = "dcde394f-1478-4813-a402-f6fb10657222"
  IID_IFunctionDiscoveryProvider = LibC::GUID.new(0xdcde394f_u32, 0x1478_u16, 0x4813_u16, StaticArray[0xa4_u8, 0x2_u8, 0xf6_u8, 0xfb_u8, 0x10_u8, 0x65_u8, 0x72_u8, 0x22_u8])
  struct IFunctionDiscoveryProvider
    lpVtbl : IFunctionDiscoveryProviderVTbl*
  end

  struct IProviderPropertiesVTbl
    query_interface : Proc(IProviderProperties*, Guid*, Void**, HRESULT)
    add_ref : Proc(IProviderProperties*, UInt32)
    release : Proc(IProviderProperties*, UInt32)
    get_count : Proc(IProviderProperties*, IFunctionInstance, LibC::IntPtrT, UInt32*, HRESULT)
    get_at : Proc(IProviderProperties*, IFunctionInstance, LibC::IntPtrT, UInt32, PROPERTYKEY*, HRESULT)
    get_value : Proc(IProviderProperties*, IFunctionInstance, LibC::IntPtrT, PROPERTYKEY*, PROPVARIANT*, HRESULT)
    set_value : Proc(IProviderProperties*, IFunctionInstance, LibC::IntPtrT, PROPERTYKEY*, PROPVARIANT*, HRESULT)
  end

  IProviderProperties_GUID = "cf986ea6-3b5f-4c5f-b88a-2f8b20ceef17"
  IID_IProviderProperties = LibC::GUID.new(0xcf986ea6_u32, 0x3b5f_u16, 0x4c5f_u16, StaticArray[0xb8_u8, 0x8a_u8, 0x2f_u8, 0x8b_u8, 0x20_u8, 0xce_u8, 0xef_u8, 0x17_u8])
  struct IProviderProperties
    lpVtbl : IProviderPropertiesVTbl*
  end

  struct IProviderPublishingVTbl
    query_interface : Proc(IProviderPublishing*, Guid*, Void**, HRESULT)
    add_ref : Proc(IProviderPublishing*, UInt32)
    release : Proc(IProviderPublishing*, UInt32)
    create_instance : Proc(IProviderPublishing*, SystemVisibilityFlags, LibC::LPWSTR, LibC::LPWSTR, IFunctionInstance*, HRESULT)
    remove_instance : Proc(IProviderPublishing*, SystemVisibilityFlags, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
  end

  IProviderPublishing_GUID = "cd1b9a04-206c-4a05-a0c8-1635a21a2b7c"
  IID_IProviderPublishing = LibC::GUID.new(0xcd1b9a04_u32, 0x206c_u16, 0x4a05_u16, StaticArray[0xa0_u8, 0xc8_u8, 0x16_u8, 0x35_u8, 0xa2_u8, 0x1a_u8, 0x2b_u8, 0x7c_u8])
  struct IProviderPublishing
    lpVtbl : IProviderPublishingVTbl*
  end

  struct IFunctionDiscoveryProviderFactoryVTbl
    query_interface : Proc(IFunctionDiscoveryProviderFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFunctionDiscoveryProviderFactory*, UInt32)
    release : Proc(IFunctionDiscoveryProviderFactory*, UInt32)
    create_property_store : Proc(IFunctionDiscoveryProviderFactory*, IPropertyStore*, HRESULT)
    create_instance : Proc(IFunctionDiscoveryProviderFactory*, LibC::LPWSTR, LibC::LPWSTR, LibC::IntPtrT, IPropertyStore, IFunctionDiscoveryProvider, IFunctionInstance*, HRESULT)
    create_function_instance_collection : Proc(IFunctionDiscoveryProviderFactory*, IFunctionInstanceCollection*, HRESULT)
  end

  IFunctionDiscoveryProviderFactory_GUID = "86443ff0-1ad5-4e68-a45a-40c2c329de3b"
  IID_IFunctionDiscoveryProviderFactory = LibC::GUID.new(0x86443ff0_u32, 0x1ad5_u16, 0x4e68_u16, StaticArray[0xa4_u8, 0x5a_u8, 0x40_u8, 0xc2_u8, 0xc3_u8, 0x29_u8, 0xde_u8, 0x3b_u8])
  struct IFunctionDiscoveryProviderFactory
    lpVtbl : IFunctionDiscoveryProviderFactoryVTbl*
  end

  struct IFunctionDiscoveryProviderQueryVTbl
    query_interface : Proc(IFunctionDiscoveryProviderQuery*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFunctionDiscoveryProviderQuery*, UInt32)
    release : Proc(IFunctionDiscoveryProviderQuery*, UInt32)
    is_instance_query : Proc(IFunctionDiscoveryProviderQuery*, LibC::BOOL*, UInt16**, HRESULT)
    is_subcategory_query : Proc(IFunctionDiscoveryProviderQuery*, LibC::BOOL*, UInt16**, HRESULT)
    get_query_constraints : Proc(IFunctionDiscoveryProviderQuery*, IProviderQueryConstraintCollection*, HRESULT)
    get_property_constraints : Proc(IFunctionDiscoveryProviderQuery*, IProviderPropertyConstraintCollection*, HRESULT)
  end

  IFunctionDiscoveryProviderQuery_GUID = "6876ea98-baec-46db-bc20-75a76e267a3a"
  IID_IFunctionDiscoveryProviderQuery = LibC::GUID.new(0x6876ea98_u32, 0xbaec_u16, 0x46db_u16, StaticArray[0xbc_u8, 0x20_u8, 0x75_u8, 0xa7_u8, 0x6e_u8, 0x26_u8, 0x7a_u8, 0x3a_u8])
  struct IFunctionDiscoveryProviderQuery
    lpVtbl : IFunctionDiscoveryProviderQueryVTbl*
  end

  struct IProviderQueryConstraintCollectionVTbl
    query_interface : Proc(IProviderQueryConstraintCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IProviderQueryConstraintCollection*, UInt32)
    release : Proc(IProviderQueryConstraintCollection*, UInt32)
    get_count : Proc(IProviderQueryConstraintCollection*, UInt32*, HRESULT)
    get : Proc(IProviderQueryConstraintCollection*, LibC::LPWSTR, UInt16**, HRESULT)
    item : Proc(IProviderQueryConstraintCollection*, UInt32, UInt16**, UInt16**, HRESULT)
    next : Proc(IProviderQueryConstraintCollection*, UInt16**, UInt16**, HRESULT)
    skip : Proc(IProviderQueryConstraintCollection*, HRESULT)
    reset : Proc(IProviderQueryConstraintCollection*, HRESULT)
  end

  IProviderQueryConstraintCollection_GUID = "9c243e11-3261-4bcd-b922-84a873d460ae"
  IID_IProviderQueryConstraintCollection = LibC::GUID.new(0x9c243e11_u32, 0x3261_u16, 0x4bcd_u16, StaticArray[0xb9_u8, 0x22_u8, 0x84_u8, 0xa8_u8, 0x73_u8, 0xd4_u8, 0x60_u8, 0xae_u8])
  struct IProviderQueryConstraintCollection
    lpVtbl : IProviderQueryConstraintCollectionVTbl*
  end

  struct IProviderPropertyConstraintCollectionVTbl
    query_interface : Proc(IProviderPropertyConstraintCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IProviderPropertyConstraintCollection*, UInt32)
    release : Proc(IProviderPropertyConstraintCollection*, UInt32)
    get_count : Proc(IProviderPropertyConstraintCollection*, UInt32*, HRESULT)
    get : Proc(IProviderPropertyConstraintCollection*, PROPERTYKEY*, PROPVARIANT*, UInt32*, HRESULT)
    item : Proc(IProviderPropertyConstraintCollection*, UInt32, PROPERTYKEY*, PROPVARIANT*, UInt32*, HRESULT)
    next : Proc(IProviderPropertyConstraintCollection*, PROPERTYKEY*, PROPVARIANT*, UInt32*, HRESULT)
    skip : Proc(IProviderPropertyConstraintCollection*, HRESULT)
    reset : Proc(IProviderPropertyConstraintCollection*, HRESULT)
  end

  IProviderPropertyConstraintCollection_GUID = "f4fae42f-5778-4a13-8540-b5fd8c1398dd"
  IID_IProviderPropertyConstraintCollection = LibC::GUID.new(0xf4fae42f_u32, 0x5778_u16, 0x4a13_u16, StaticArray[0x85_u8, 0x40_u8, 0xb5_u8, 0xfd_u8, 0x8c_u8, 0x13_u8, 0x98_u8, 0xdd_u8])
  struct IProviderPropertyConstraintCollection
    lpVtbl : IProviderPropertyConstraintCollectionVTbl*
  end

  struct IFunctionDiscoveryServiceProviderVTbl
    query_interface : Proc(IFunctionDiscoveryServiceProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFunctionDiscoveryServiceProvider*, UInt32)
    release : Proc(IFunctionDiscoveryServiceProvider*, UInt32)
    initialize : Proc(IFunctionDiscoveryServiceProvider*, IFunctionInstance, Guid*, Void**, HRESULT)
  end

  IFunctionDiscoveryServiceProvider_GUID = "4c81ed02-1b04-43f2-a451-69966cbcd1c2"
  IID_IFunctionDiscoveryServiceProvider = LibC::GUID.new(0x4c81ed02_u32, 0x1b04_u16, 0x43f2_u16, StaticArray[0xa4_u8, 0x51_u8, 0x69_u8, 0x96_u8, 0x6c_u8, 0xbc_u8, 0xd1_u8, 0xc2_u8])
  struct IFunctionDiscoveryServiceProvider
    lpVtbl : IFunctionDiscoveryServiceProviderVTbl*
  end

  struct IPNPXAssociationVTbl
    query_interface : Proc(IPNPXAssociation*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPNPXAssociation*, UInt32)
    release : Proc(IPNPXAssociation*, UInt32)
    associate : Proc(IPNPXAssociation*, LibC::LPWSTR, HRESULT)
    unassociate : Proc(IPNPXAssociation*, LibC::LPWSTR, HRESULT)
    delete : Proc(IPNPXAssociation*, LibC::LPWSTR, HRESULT)
  end

  IPNPXAssociation_GUID = "0bd7e521-4da6-42d5-81ba-1981b6b94075"
  IID_IPNPXAssociation = LibC::GUID.new(0xbd7e521_u32, 0x4da6_u16, 0x42d5_u16, StaticArray[0x81_u8, 0xba_u8, 0x19_u8, 0x81_u8, 0xb6_u8, 0xb9_u8, 0x40_u8, 0x75_u8])
  struct IPNPXAssociation
    lpVtbl : IPNPXAssociationVTbl*
  end

  struct IPNPXDeviceAssociationVTbl
    query_interface : Proc(IPNPXDeviceAssociation*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPNPXDeviceAssociation*, UInt32)
    release : Proc(IPNPXDeviceAssociation*, UInt32)
    associate : Proc(IPNPXDeviceAssociation*, LibC::LPWSTR, IFunctionDiscoveryNotification, HRESULT)
    unassociate : Proc(IPNPXDeviceAssociation*, LibC::LPWSTR, IFunctionDiscoveryNotification, HRESULT)
    delete : Proc(IPNPXDeviceAssociation*, LibC::LPWSTR, IFunctionDiscoveryNotification, HRESULT)
  end

  IPNPXDeviceAssociation_GUID = "eed366d0-35b8-4fc5-8d20-7e5bd31f6ded"
  IID_IPNPXDeviceAssociation = LibC::GUID.new(0xeed366d0_u32, 0x35b8_u16, 0x4fc5_u16, StaticArray[0x8d_u8, 0x20_u8, 0x7e_u8, 0x5b_u8, 0xd3_u8, 0x1f_u8, 0x6d_u8, 0xed_u8])
  struct IPNPXDeviceAssociation
    lpVtbl : IPNPXDeviceAssociationVTbl*
  end

end