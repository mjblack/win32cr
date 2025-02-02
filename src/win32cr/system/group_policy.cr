require "./com.cr"
require "./../foundation.cr"
require "./ole.cr"
require "./registry.cr"
require "./wmi.cr"
require "./../ui/controls.cr"
require "./../security.cr"
require "./../ui/shell.cr"

module Win32cr::System::GroupPolicy
  extend self
  alias CriticalPolicySectionHandle = LibC::IntPtrT
  alias PFNSTATUSMESSAGECALLBACK = Proc(Win32cr::Foundation::BOOL, Win32cr::Foundation::PWSTR, UInt32)

  alias PFNPROCESSGROUPPOLICY = Proc(UInt32, Win32cr::Foundation::HANDLE, Win32cr::System::Registry::HKEY, Win32cr::System::GroupPolicy::GROUP_POLICY_OBJECTA*, Win32cr::System::GroupPolicy::GROUP_POLICY_OBJECTA*, LibC::UIntPtrT, Win32cr::Foundation::BOOL*, Win32cr::System::GroupPolicy::PFNSTATUSMESSAGECALLBACK, UInt32)

  alias PFNPROCESSGROUPPOLICYEX = Proc(UInt32, Win32cr::Foundation::HANDLE, Win32cr::System::Registry::HKEY, Win32cr::System::GroupPolicy::GROUP_POLICY_OBJECTA*, Win32cr::System::GroupPolicy::GROUP_POLICY_OBJECTA*, LibC::UIntPtrT, Win32cr::Foundation::BOOL*, Win32cr::System::GroupPolicy::PFNSTATUSMESSAGECALLBACK, Void*, Win32cr::Foundation::HRESULT*, UInt32)

  alias PFNGENERATEGROUPPOLICY = Proc(UInt32, Win32cr::Foundation::BOOL*, Win32cr::Foundation::PWSTR, Win32cr::System::GroupPolicy::RSOP_TARGET*, Win32cr::System::GroupPolicy::RSOP_TARGET*, UInt32)

  GPM_USE_PDC = 0_u32
  GPM_USE_ANYDC = 1_u32
  GPM_DONOTUSE_W2KDC = 2_u32
  GPM_DONOT_VALIDATEDC = 1_u32
  GPM_MIGRATIONTABLE_ONLY = 1_u32
  GPM_PROCESS_SECURITY = 2_u32
  RSOP_NO_COMPUTER = 65536_u32
  RSOP_NO_USER = 131072_u32
  RSOP_PLANNING_ASSUME_SLOW_LINK = 1_u32
  RSOP_PLANNING_ASSUME_LOOPBACK_MERGE = 2_u32
  RSOP_PLANNING_ASSUME_LOOPBACK_REPLACE = 4_u32
  RSOP_PLANNING_ASSUME_USER_WQLFILTER_TRUE = 8_u32
  RSOP_PLANNING_ASSUME_COMP_WQLFILTER_TRUE = 16_u32
  PI_NOUI = 1_u32
  PI_APPLYPOLICY = 2_u32
  PT_TEMPORARY = 1_u32
  PT_ROAMING = 2_u32
  PT_MANDATORY = 4_u32
  PT_ROAMING_PREEXISTING = 8_u32
  RP_FORCE = 1_u32
  RP_SYNC = 2_u32
  GPC_BLOCK_POLICY = 1_u32
  GPO_FLAG_DISABLE = 1_u32
  GPO_FLAG_FORCE = 2_u32
  GPO_LIST_FLAG_MACHINE = 1_u32
  GPO_LIST_FLAG_SITEONLY = 2_u32
  GPO_LIST_FLAG_NO_WMIFILTERS = 4_u32
  GPO_LIST_FLAG_NO_SECURITYFILTERS = 8_u32
  GP_DLLNAME = "DllName"
  GP_ENABLEASYNCHRONOUSPROCESSING = "EnableAsynchronousProcessing"
  GP_MAXNOGPOLISTCHANGESINTERVAL = "MaxNoGPOListChangesInterval"
  GP_NOBACKGROUNDPOLICY = "NoBackgroundPolicy"
  GP_NOGPOLISTCHANGES = "NoGPOListChanges"
  GP_NOMACHINEPOLICY = "NoMachinePolicy"
  GP_NOSLOWLINK = "NoSlowLink"
  GP_NOTIFYLINKTRANSITION = "NotifyLinkTransition"
  GP_NOUSERPOLICY = "NoUserPolicy"
  GP_PERUSERLOCALSETTINGS = "PerUserLocalSettings"
  GP_PROCESSGROUPPOLICY = "ProcessGroupPolicy"
  GP_REQUIRESSUCCESSFULREGISTRY = "RequiresSuccessfulRegistry"
  GPO_INFO_FLAG_MACHINE = 1_u32
  GPO_INFO_FLAG_BACKGROUND = 16_u32
  GPO_INFO_FLAG_SLOWLINK = 32_u32
  GPO_INFO_FLAG_VERBOSE = 64_u32
  GPO_INFO_FLAG_NOCHANGES = 128_u32
  GPO_INFO_FLAG_LINKTRANSITION = 256_u32
  GPO_INFO_FLAG_LOGRSOP_TRANSITION = 512_u32
  GPO_INFO_FLAG_FORCED_REFRESH = 1024_u32
  GPO_INFO_FLAG_SAFEMODE_BOOT = 2048_u32
  GPO_INFO_FLAG_ASYNC_FOREGROUND = 4096_u32
  FLAG_NO_GPO_FILTER = 2147483648_u32
  FLAG_NO_CSE_INVOKE = 1073741824_u32
  FLAG_ASSUME_SLOW_LINK = 536870912_u32
  FLAG_LOOPBACK_MERGE = 268435456_u32
  FLAG_LOOPBACK_REPLACE = 134217728_u32
  FLAG_ASSUME_USER_WQLFILTER_TRUE = 67108864_u32
  FLAG_ASSUME_COMP_WQLFILTER_TRUE = 33554432_u32
  FLAG_PLANNING_MODE = 16777216_u32
  FLAG_NO_USER = 1_u32
  FLAG_NO_COMPUTER = 2_u32
  FLAG_FORCE_CREATENAMESPACE = 4_u32
  RSOP_USER_ACCESS_DENIED = 1_u32
  RSOP_COMPUTER_ACCESS_DENIED = 2_u32
  RSOP_TEMPNAMESPACE_EXISTS = 4_u32
  LOCALSTATE_ASSIGNED = 1_u32
  LOCALSTATE_PUBLISHED = 2_u32
  LOCALSTATE_UNINSTALL_UNMANAGED = 4_u32
  LOCALSTATE_POLICYREMOVE_ORPHAN = 8_u32
  LOCALSTATE_POLICYREMOVE_UNINSTALL = 16_u32
  LOCALSTATE_ORPHANED = 32_u32
  LOCALSTATE_UNINSTALLED = 64_u32
  MANAGED_APPS_USERAPPLICATIONS = 1_u32
  MANAGED_APPS_FROMCATEGORY = 2_u32
  MANAGED_APPS_INFOLEVEL_DEFAULT = 65536_u32
  MANAGED_APPTYPE_WINDOWSINSTALLER = 1_u32
  MANAGED_APPTYPE_SETUPEXE = 2_u32
  MANAGED_APPTYPE_UNSUPPORTED = 3_u32
  CLSID_GPESnapIn = "8fc0b734-a0e1-11d1-a7d3-0000f87571e3"
  NODEID_Machine = "8fc0b737-a0e1-11d1-a7d3-0000f87571e3"
  NODEID_MachineSWSettings = "8fc0b73a-a0e1-11d1-a7d3-0000f87571e3"
  NODEID_User = "8fc0b738-a0e1-11d1-a7d3-0000f87571e3"
  NODEID_UserSWSettings = "8fc0b73c-a0e1-11d1-a7d3-0000f87571e3"
  CLSID_GroupPolicyObject = "ea502722-a23d-11d1-a7d3-0000f87571e3"
  CLSID_RSOPSnapIn = "6dc3804b-7212-458d-adb0-9a07e2ae1fa2"
  NODEID_RSOPMachine = "bd4c1a2e-0b7a-4a62-a6b0-c0577539c97e"
  NODEID_RSOPMachineSWSettings = "6a76273e-eb8e-45db-94c5-25663a5f2c1a"
  NODEID_RSOPUser = "ab87364f-0cec-4cd8-9bf8-898f34628fb8"
  NODEID_RSOPUserSWSettings = "e52c5ce3-fd27-4402-84de-d9a5f2858910"
  GPO_SECTION_ROOT = 0_u32
  GPO_SECTION_USER = 1_u32
  GPO_SECTION_MACHINE = 2_u32
  GPO_OPEN_LOAD_REGISTRY = 1_u32
  GPO_OPEN_READ_ONLY = 2_u32
  GPO_OPTION_DISABLE_USER = 1_u32
  GPO_OPTION_DISABLE_MACHINE = 2_u32
  RSOP_INFO_FLAG_DIAGNOSTIC_MODE = 1_u32
  GPO_BROWSE_DISABLENEW = 1_u32
  GPO_BROWSE_NOCOMPUTERS = 2_u32
  GPO_BROWSE_NODSGPOS = 4_u32
  GPO_BROWSE_OPENBUTTON = 8_u32
  GPO_BROWSE_INITTOALL = 16_u32
  GPO_BROWSE_NOUSERGPOS = 32_u32
  GPO_BROWSE_SENDAPPLYONEDIT = 64_u32

  CLSID_GPM = LibC::GUID.new(0xf5694708_u32, 0x88fe_u16, 0x4b35_u16, StaticArray[0xba_u8, 0xbf_u8, 0xe5_u8, 0x61_u8, 0x62_u8, 0xd5_u8, 0xfb_u8, 0xc8_u8])

  CLSID_GPMDomain = LibC::GUID.new(0x710901be_u32, 0x1050_u16, 0x4cb1_u16, StaticArray[0x83_u8, 0x8a_u8, 0xc5_u8, 0xcf_u8, 0xf2_u8, 0x59_u8, 0xe1_u8, 0x83_u8])

  CLSID_GPMSitesContainer = LibC::GUID.new(0x229f5c42_u32, 0x852c_u16, 0x4b30_u16, StaticArray[0x94_u8, 0x5f_u8, 0xc5_u8, 0x22_u8, 0xbe_u8, 0x9b_u8, 0xd3_u8, 0x86_u8])

  CLSID_GPMBackupDir = LibC::GUID.new(0xfce4a59d_u32, 0xf21_u16, 0x4afa_u16, StaticArray[0xb8_u8, 0x59_u8, 0xe6_u8, 0xd0_u8, 0xc6_u8, 0x2c_u8, 0xd1_u8, 0xc_u8])

  CLSID_GPMSOM = LibC::GUID.new(0x32d93fac_u32, 0x450e_u16, 0x44cf_u16, StaticArray[0x82_u8, 0x9c_u8, 0x8b_u8, 0x22_u8, 0xff_u8, 0x6b_u8, 0xda_u8, 0xe1_u8])

  CLSID_GPMSearchCriteria = LibC::GUID.new(0x17aaca26_u32, 0x5ce0_u16, 0x44fa_u16, StaticArray[0x8c_u8, 0xc0_u8, 0x52_u8, 0x59_u8, 0xe6_u8, 0x48_u8, 0x35_u8, 0x66_u8])

  CLSID_GPMPermission = LibC::GUID.new(0x5871a40a_u32, 0xe9c0_u16, 0x46ec_u16, StaticArray[0x91_u8, 0x3e_u8, 0x94_u8, 0x4e_u8, 0xf9_u8, 0x22_u8, 0x5a_u8, 0x94_u8])

  CLSID_GPMSecurityInfo = LibC::GUID.new(0x547a5e8f_u32, 0x9162_u16, 0x4516_u16, StaticArray[0xa4_u8, 0xdf_u8, 0x9d_u8, 0xdb_u8, 0x96_u8, 0x86_u8, 0xd8_u8, 0x46_u8])

  CLSID_GPMBackup = LibC::GUID.new(0xed1a54b8_u32, 0x5efa_u16, 0x482a_u16, StaticArray[0x93_u8, 0xc0_u8, 0x8a_u8, 0xd8_u8, 0x6f_u8, 0xd_u8, 0x68_u8, 0xc3_u8])

  CLSID_GPMBackupCollection = LibC::GUID.new(0xeb8f035b_u32, 0x70db_u16, 0x4a9f_u16, StaticArray[0x96_u8, 0x76_u8, 0x37_u8, 0xc2_u8, 0x59_u8, 0x94_u8, 0xe9_u8, 0xdc_u8])

  CLSID_GPMSOMCollection = LibC::GUID.new(0x24c1f147_u32, 0x3720_u16, 0x4f5b_u16, StaticArray[0xa9_u8, 0xc3_u8, 0x6_u8, 0xb4_u8, 0xe4_u8, 0xf9_u8, 0x31_u8, 0xd2_u8])

  CLSID_GPMWMIFilter = LibC::GUID.new(0x626745d8_u32, 0xdea_u16, 0x4062_u16, StaticArray[0xbf_u8, 0x60_u8, 0xcf_u8, 0xc5_u8, 0xb1_u8, 0xca_u8, 0x12_u8, 0x86_u8])

  CLSID_GPMWMIFilterCollection = LibC::GUID.new(0x74dc6d28_u32, 0xe820_u16, 0x47d6_u16, StaticArray[0xa0_u8, 0xb8_u8, 0xf0_u8, 0x8d_u8, 0x93_u8, 0xd7_u8, 0xfa_u8, 0x33_u8])

  CLSID_GPMRSOP = LibC::GUID.new(0x489b0caf_u32, 0x9ec2_u16, 0x4eb7_u16, StaticArray[0x91_u8, 0xf5_u8, 0xb6_u8, 0xf7_u8, 0x1d_u8, 0x43_u8, 0xda_u8, 0x8c_u8])

  CLSID_GPMGPO = LibC::GUID.new(0xd2ce2994_u32, 0x59b5_u16, 0x4064_u16, StaticArray[0xb5_u8, 0x81_u8, 0x4d_u8, 0x68_u8, 0x48_u8, 0x6a_u8, 0x16_u8, 0xc4_u8])

  CLSID_GPMGPOCollection = LibC::GUID.new(0x7a057325_u32, 0x832d_u16, 0x4de3_u16, StaticArray[0xa4_u8, 0x1f_u8, 0xc7_u8, 0x80_u8, 0x43_u8, 0x6a_u8, 0x4e_u8, 0x9_u8])

  CLSID_GPMGPOLink = LibC::GUID.new(0xc1df9880_u32, 0x5303_u16, 0x42c6_u16, StaticArray[0x8a_u8, 0x3c_u8, 0x4_u8, 0x88_u8, 0xe1_u8, 0xbf_u8, 0x73_u8, 0x64_u8])

  CLSID_GPMGPOLinksCollection = LibC::GUID.new(0xf6ed581a_u32, 0x49a5_u16, 0x47e2_u16, StaticArray[0xb7_u8, 0x71_u8, 0xfd_u8, 0x8d_u8, 0xc0_u8, 0x2b_u8, 0x62_u8, 0x59_u8])

  CLSID_GPMAsyncCancel = LibC::GUID.new(0x372796a9_u32, 0x76ec_u16, 0x479d_u16, StaticArray[0xad_u8, 0x6c_u8, 0x55_u8, 0x63_u8, 0x18_u8, 0xed_u8, 0x5f_u8, 0x9d_u8])

  CLSID_GPMStatusMsgCollection = LibC::GUID.new(0x2824e4be_u32, 0x4bcc_u16, 0x4cac_u16, StaticArray[0x9e_u8, 0x60_u8, 0xe_u8, 0x3e_u8, 0xd7_u8, 0xf1_u8, 0x24_u8, 0x96_u8])

  CLSID_GPMStatusMessage = LibC::GUID.new(0x4b77cc94_u32, 0xd255_u16, 0x409b_u16, StaticArray[0xbc_u8, 0x62_u8, 0x37_u8, 0x8_u8, 0x81_u8, 0x71_u8, 0x5a_u8, 0x19_u8])

  CLSID_GPMTrustee = LibC::GUID.new(0xc54a700d_u32, 0x19b6_u16, 0x4211_u16, StaticArray[0xbc_u8, 0xb0_u8, 0xe8_u8, 0xe2_u8, 0x47_u8, 0x5e_u8, 0x47_u8, 0x1e_u8])

  CLSID_GPMClientSideExtension = LibC::GUID.new(0xc1a2e70e_u32, 0x659c_u16, 0x4b1a_u16, StaticArray[0x94_u8, 0xb_u8, 0xf8_u8, 0x8b_u8, 0xa_u8, 0xf9_u8, 0xc8_u8, 0xa4_u8])

  CLSID_GPMCSECollection = LibC::GUID.new(0xcf92b828_u32, 0x2d44_u16, 0x4b61_u16, StaticArray[0xb1_u8, 0xa_u8, 0xb3_u8, 0x27_u8, 0xaf_u8, 0xd4_u8, 0x2d_u8, 0xa8_u8])

  CLSID_GPMConstants = LibC::GUID.new(0x3855e880_u32, 0xcd9e_u16, 0x4d0c_u16, StaticArray[0x9e_u8, 0xaf_u8, 0x15_u8, 0x79_u8, 0x28_u8, 0x3a_u8, 0x18_u8, 0x88_u8])

  CLSID_GPMResult = LibC::GUID.new(0x92101ac0_u32, 0x9287_u16, 0x4206_u16, StaticArray[0xa3_u8, 0xb2_u8, 0x4b_u8, 0xdb_u8, 0x73_u8, 0xd2_u8, 0x25_u8, 0xf6_u8])

  CLSID_GPMMapEntryCollection = LibC::GUID.new(0xcf75d5b_u32, 0xa3a1_u16, 0x4c55_u16, StaticArray[0xb4_u8, 0xfe_u8, 0x9e_u8, 0x14_u8, 0x9c_u8, 0x41_u8, 0xf6_u8, 0x6d_u8])

  CLSID_GPMMapEntry = LibC::GUID.new(0x8c975253_u32, 0x5431_u16, 0x4471_u16, StaticArray[0xb3_u8, 0x5d_u8, 0x6_u8, 0x26_u8, 0xc9_u8, 0x28_u8, 0x25_u8, 0x8a_u8])

  CLSID_GPMMigrationTable = LibC::GUID.new(0x55af4043_u32, 0x2a06_u16, 0x4f72_u16, StaticArray[0xab_u8, 0xef_u8, 0x63_u8, 0x1b_u8, 0x44_u8, 0x7_u8, 0x9c_u8, 0x76_u8])

  CLSID_GPMBackupDirEx = LibC::GUID.new(0xe8c0988a_u32, 0xcf03_u16, 0x4c5b_u16, StaticArray[0x8b_u8, 0xe2_u8, 0x2a_u8, 0xa9_u8, 0xad_u8, 0x32_u8, 0xaa_u8, 0xda_u8])

  CLSID_GPMStarterGPOBackupCollection = LibC::GUID.new(0xe75ea59d_u32, 0x1aeb_u16, 0x4cb5_u16, StaticArray[0xa7_u8, 0x8a_u8, 0x28_u8, 0x1d_u8, 0xaa_u8, 0x58_u8, 0x24_u8, 0x6_u8])

  CLSID_GPMStarterGPOBackup = LibC::GUID.new(0x389e400a_u32, 0xd8ef_u16, 0x455b_u16, StaticArray[0xa8_u8, 0x61_u8, 0x5f_u8, 0x9c_u8, 0xa3_u8, 0x4a_u8, 0x6a_u8, 0x2_u8])

  CLSID_GPMTemplate = LibC::GUID.new(0xecf1d454_u32, 0x71da_u16, 0x4e2f_u16, StaticArray[0xa8_u8, 0xc0_u8, 0x81_u8, 0x85_u8, 0x46_u8, 0x59_u8, 0x11_u8, 0xd9_u8])

  CLSID_GPMStarterGPOCollection = LibC::GUID.new(0x82f8aa8b_u32, 0x49ba_u16, 0x43b2_u16, StaticArray[0x95_u8, 0x6e_u8, 0x33_u8, 0x97_u8, 0xf9_u8, 0xb9_u8, 0x4c_u8, 0x3a_u8])

  enum GPMRSOPMode
    Rsopunknown = 0_i32
    Rsopplanning = 1_i32
    Rsoplogging = 2_i32
  end
  enum GPMPermissionType
    Permgpoapply = 65536_i32
    Permgporead = 65792_i32
    Permgpoedit = 65793_i32
    Permgpoeditsecurityanddelete = 65794_i32
    Permgpocustom = 65795_i32
    Permwmifilteredit = 131072_i32
    Permwmifilterfullcontrol = 131073_i32
    Permwmifiltercustom = 131074_i32
    Permsomlink = 1835008_i32
    Permsomlogging = 1573120_i32
    Permsomplanning = 1573376_i32
    Permsomwmicreate = 1049344_i32
    Permsomwmifullcontrol = 1049345_i32
    Permsomgpocreate = 1049600_i32
    Permstartergporead = 197888_i32
    Permstartergpoedit = 197889_i32
    Permstartergpofullcontrol = 197890_i32
    Permstartergpocustom = 197891_i32
    Permsomstartergpocreate = 1049856_i32
  end
  enum GPMSearchProperty
    Gpopermissions = 0_i32
    Gpoeffectivepermissions = 1_i32
    Gpodisplayname = 2_i32
    Gpowmifilter = 3_i32
    Gpoid = 4_i32
    Gpocomputerextensions = 5_i32
    Gpouserextensions = 6_i32
    Somlinks = 7_i32
    Gpodomain = 8_i32
    Backupmostrecent = 9_i32
    Startergpopermissions = 10_i32
    Startergpoeffectivepermissions = 11_i32
    Startergpodisplayname = 12_i32
    Startergpoid = 13_i32
    Startergpodomain = 14_i32
  end
  enum GPMSearchOperation
    Opequals = 0_i32
    Opcontains = 1_i32
    Opnotcontains = 2_i32
    Opnotequals = 3_i32
  end
  enum GPMReportType
    Repxml = 0_i32
    Rephtml = 1_i32
    Repinfraxml = 2_i32
    Repinfrarefreshxml = 3_i32
    Repclienthealthxml = 4_i32
    Repclienthealthrefreshxml = 5_i32
  end
  enum GPMEntryType
    Typeuser = 0_i32
    Typecomputer = 1_i32
    Typelocalgroup = 2_i32
    Typeglobalgroup = 3_i32
    Typeuniversalgroup = 4_i32
    Typeuncpath = 5_i32
    Typeunknown = 6_i32
  end
  enum GPMDestinationOption
    Opdestinationsameassource = 0_i32
    Opdestinationnone = 1_i32
    Opdestinationbyrelativename = 2_i32
    Opdestinationset = 3_i32
  end
  enum GPMReportingOptions
    Opreportlegacy = 0_i32
    Opreportcomments = 1_i32
  end
  enum GPMSOMType
    Somsite = 0_i32
    Somdomain = 1_i32
    Somou = 2_i32
  end
  enum GPMBackupType
    Typegpo = 0_i32
    Typestartergpo = 1_i32
  end
  enum GPMStarterGPOType
    Typesystem = 0_i32
    Typecustom = 1_i32
  end
  enum GPO_LINK
    GPLinkUnknown = 0_i32
    GPLinkMachine = 1_i32
    GPLinkSite = 2_i32
    GPLinkDomain = 3_i32
    GPLinkOrganizationalUnit = 4_i32
  end
  enum SETTINGSTATUS
    RSOPUnspecified = 0_i32
    RSOPApplied = 1_i32
    RSOPIgnored = 2_i32
    RSOPFailed = 3_i32
    RSOPSubsettingFailed = 4_i32
  end
  enum INSTALLSPECTYPE
    APPNAME = 1_i32
    FILEEXT = 2_i32
    PROGID = 3_i32
    COMCLASS = 4_i32
  end
  enum APPSTATE
    ABSENT = 0_i32
    ASSIGNED = 1_i32
    PUBLISHED = 2_i32
  end
  enum GROUP_POLICY_OBJECT_TYPE
    GPOTypeLocal = 0_i32
    GPOTypeRemote = 1_i32
    GPOTypeDS = 2_i32
    GPOTypeLocalUser = 3_i32
    GPOTypeLocalGroup = 4_i32
  end
  enum GROUP_POLICY_HINT_TYPE
    GPHintUnknown = 0_i32
    GPHintMachine = 1_i32
    GPHintSite = 2_i32
    GPHintDomain = 3_i32
    GPHintOrganizationalUnit = 4_i32
  end

  @[Extern]
  struct GROUP_POLICY_OBJECTA
    property dwOptions : UInt32
    property dwVersion : UInt32
    property lpDSPath : Win32cr::Foundation::PSTR
    property lpFileSysPath : Win32cr::Foundation::PSTR
    property lpDisplayName : Win32cr::Foundation::PSTR
    property szGPOName : Win32cr::Foundation::CHAR[50]
    property gpo_link : Win32cr::System::GroupPolicy::GPO_LINK
    property lParam : Win32cr::Foundation::LPARAM
    property pNext : Win32cr::System::GroupPolicy::GROUP_POLICY_OBJECTA*
    property pPrev : Win32cr::System::GroupPolicy::GROUP_POLICY_OBJECTA*
    property lpExtensions : Win32cr::Foundation::PSTR
    property lParam2 : Win32cr::Foundation::LPARAM
    property lpLink : Win32cr::Foundation::PSTR
    def initialize(@dwOptions : UInt32, @dwVersion : UInt32, @lpDSPath : Win32cr::Foundation::PSTR, @lpFileSysPath : Win32cr::Foundation::PSTR, @lpDisplayName : Win32cr::Foundation::PSTR, @szGPOName : Win32cr::Foundation::CHAR[50], @gpo_link : Win32cr::System::GroupPolicy::GPO_LINK, @lParam : Win32cr::Foundation::LPARAM, @pNext : Win32cr::System::GroupPolicy::GROUP_POLICY_OBJECTA*, @pPrev : Win32cr::System::GroupPolicy::GROUP_POLICY_OBJECTA*, @lpExtensions : Win32cr::Foundation::PSTR, @lParam2 : Win32cr::Foundation::LPARAM, @lpLink : Win32cr::Foundation::PSTR)
    end
  end

  @[Extern]
  struct GROUP_POLICY_OBJECTW
    property dwOptions : UInt32
    property dwVersion : UInt32
    property lpDSPath : Win32cr::Foundation::PWSTR
    property lpFileSysPath : Win32cr::Foundation::PWSTR
    property lpDisplayName : Win32cr::Foundation::PWSTR
    property szGPOName : UInt16[50]
    property gpo_link : Win32cr::System::GroupPolicy::GPO_LINK
    property lParam : Win32cr::Foundation::LPARAM
    property pNext : Win32cr::System::GroupPolicy::GROUP_POLICY_OBJECTW*
    property pPrev : Win32cr::System::GroupPolicy::GROUP_POLICY_OBJECTW*
    property lpExtensions : Win32cr::Foundation::PWSTR
    property lParam2 : Win32cr::Foundation::LPARAM
    property lpLink : Win32cr::Foundation::PWSTR
    def initialize(@dwOptions : UInt32, @dwVersion : UInt32, @lpDSPath : Win32cr::Foundation::PWSTR, @lpFileSysPath : Win32cr::Foundation::PWSTR, @lpDisplayName : Win32cr::Foundation::PWSTR, @szGPOName : UInt16[50], @gpo_link : Win32cr::System::GroupPolicy::GPO_LINK, @lParam : Win32cr::Foundation::LPARAM, @pNext : Win32cr::System::GroupPolicy::GROUP_POLICY_OBJECTW*, @pPrev : Win32cr::System::GroupPolicy::GROUP_POLICY_OBJECTW*, @lpExtensions : Win32cr::Foundation::PWSTR, @lParam2 : Win32cr::Foundation::LPARAM, @lpLink : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct RSOP_TARGET
    property pwszAccountName : Win32cr::Foundation::PWSTR
    property pwszNewSOM : Win32cr::Foundation::PWSTR
    property psaSecurityGroups : Win32cr::System::Com::SAFEARRAY*
    property pRsopToken : Void*
    property pGPOList : Win32cr::System::GroupPolicy::GROUP_POLICY_OBJECTA*
    property pWbemServices : Void*
    def initialize(@pwszAccountName : Win32cr::Foundation::PWSTR, @pwszNewSOM : Win32cr::Foundation::PWSTR, @psaSecurityGroups : Win32cr::System::Com::SAFEARRAY*, @pRsopToken : Void*, @pGPOList : Win32cr::System::GroupPolicy::GROUP_POLICY_OBJECTA*, @pWbemServices : Void*)
    end
  end

  @[Extern]
  struct POLICYSETTINGSTATUSINFO
    property szKey : Win32cr::Foundation::PWSTR
    property szEventSource : Win32cr::Foundation::PWSTR
    property szEventLogName : Win32cr::Foundation::PWSTR
    property dwEventID : UInt32
    property dwErrorCode : UInt32
    property status : Win32cr::System::GroupPolicy::SETTINGSTATUS
    property timeLogged : Win32cr::Foundation::SYSTEMTIME
    def initialize(@szKey : Win32cr::Foundation::PWSTR, @szEventSource : Win32cr::Foundation::PWSTR, @szEventLogName : Win32cr::Foundation::PWSTR, @dwEventID : UInt32, @dwErrorCode : UInt32, @status : Win32cr::System::GroupPolicy::SETTINGSTATUS, @timeLogged : Win32cr::Foundation::SYSTEMTIME)
    end
  end

  @[Extern(union: true)]
  struct INSTALLSPEC
    property app_name : AppName_e__Struct_
    property file_ext : Win32cr::Foundation::PWSTR
    property prog_id : Win32cr::Foundation::PWSTR
    property com_class : COMClass_e__Struct_

    # Nested Type AppName_e__Struct_
    @[Extern]
    struct AppName_e__Struct_
    property name : Win32cr::Foundation::PWSTR
    property gpo_id : LibC::GUID
    def initialize(@name : Win32cr::Foundation::PWSTR, @gpo_id : LibC::GUID)
    end
    end


    # Nested Type COMClass_e__Struct_
    @[Extern]
    struct COMClass_e__Struct_
    property clsid : LibC::GUID
    property cls_ctx : UInt32
    def initialize(@clsid : LibC::GUID, @cls_ctx : UInt32)
    end
    end

    def initialize(@app_name : AppName_e__Struct_, @file_ext : Win32cr::Foundation::PWSTR, @prog_id : Win32cr::Foundation::PWSTR, @com_class : COMClass_e__Struct_)
    end
  end

  @[Extern]
  struct INSTALLDATA
    property type__ : Win32cr::System::GroupPolicy::INSTALLSPECTYPE
    property spec : Win32cr::System::GroupPolicy::INSTALLSPEC
    def initialize(@type__ : Win32cr::System::GroupPolicy::INSTALLSPECTYPE, @spec : Win32cr::System::GroupPolicy::INSTALLSPEC)
    end
  end

  @[Extern]
  struct LOCALMANAGEDAPPLICATION
    property pszDeploymentName : Win32cr::Foundation::PWSTR
    property pszPolicyName : Win32cr::Foundation::PWSTR
    property pszProductId : Win32cr::Foundation::PWSTR
    property dwState : UInt32
    def initialize(@pszDeploymentName : Win32cr::Foundation::PWSTR, @pszPolicyName : Win32cr::Foundation::PWSTR, @pszProductId : Win32cr::Foundation::PWSTR, @dwState : UInt32)
    end
  end

  @[Extern]
  struct MANAGEDAPPLICATION
    property pszPackageName : Win32cr::Foundation::PWSTR
    property pszPublisher : Win32cr::Foundation::PWSTR
    property dwVersionHi : UInt32
    property dwVersionLo : UInt32
    property dwRevision : UInt32
    property gpo_id : LibC::GUID
    property pszPolicyName : Win32cr::Foundation::PWSTR
    property product_id : LibC::GUID
    property language : UInt16
    property pszOwner : Win32cr::Foundation::PWSTR
    property pszCompany : Win32cr::Foundation::PWSTR
    property pszComments : Win32cr::Foundation::PWSTR
    property pszContact : Win32cr::Foundation::PWSTR
    property pszSupportUrl : Win32cr::Foundation::PWSTR
    property dwPathType : UInt32
    property bInstalled : Win32cr::Foundation::BOOL
    def initialize(@pszPackageName : Win32cr::Foundation::PWSTR, @pszPublisher : Win32cr::Foundation::PWSTR, @dwVersionHi : UInt32, @dwVersionLo : UInt32, @dwRevision : UInt32, @gpo_id : LibC::GUID, @pszPolicyName : Win32cr::Foundation::PWSTR, @product_id : LibC::GUID, @language : UInt16, @pszOwner : Win32cr::Foundation::PWSTR, @pszCompany : Win32cr::Foundation::PWSTR, @pszComments : Win32cr::Foundation::PWSTR, @pszContact : Win32cr::Foundation::PWSTR, @pszSupportUrl : Win32cr::Foundation::PWSTR, @dwPathType : UInt32, @bInstalled : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct GPOBROWSEINFO
    property dwSize : UInt32
    property dwFlags : UInt32
    property hwndOwner : Win32cr::Foundation::HWND
    property lpTitle : Win32cr::Foundation::PWSTR
    property lpInitialOU : Win32cr::Foundation::PWSTR
    property lpDSPath : Win32cr::Foundation::PWSTR
    property dwDSPathSize : UInt32
    property lpName : Win32cr::Foundation::PWSTR
    property dwNameSize : UInt32
    property gpoType : Win32cr::System::GroupPolicy::GROUP_POLICY_OBJECT_TYPE
    property gpoHint : Win32cr::System::GroupPolicy::GROUP_POLICY_HINT_TYPE
    def initialize(@dwSize : UInt32, @dwFlags : UInt32, @hwndOwner : Win32cr::Foundation::HWND, @lpTitle : Win32cr::Foundation::PWSTR, @lpInitialOU : Win32cr::Foundation::PWSTR, @lpDSPath : Win32cr::Foundation::PWSTR, @dwDSPathSize : UInt32, @lpName : Win32cr::Foundation::PWSTR, @dwNameSize : UInt32, @gpoType : Win32cr::System::GroupPolicy::GROUP_POLICY_OBJECT_TYPE, @gpoHint : Win32cr::System::GroupPolicy::GROUP_POLICY_HINT_TYPE)
    end
  end

  @[Extern]
  record IGPMVtbl,
    query_interface : Proc(IGPM*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGPM*, UInt32),
    release : Proc(IGPM*, UInt32),
    get_type_info_count : Proc(IGPM*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IGPM*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IGPM*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IGPM*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_domain : Proc(IGPM*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_backup_dir : Proc(IGPM*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_sites_container : Proc(IGPM*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_rsop : Proc(IGPM*, Win32cr::System::GroupPolicy::GPMRSOPMode, Win32cr::Foundation::BSTR, Int32, Void**, Win32cr::Foundation::HRESULT),
    create_permission : Proc(IGPM*, Win32cr::Foundation::BSTR, Win32cr::System::GroupPolicy::GPMPermissionType, Int16, Void**, Win32cr::Foundation::HRESULT),
    create_search_criteria : Proc(IGPM*, Void**, Win32cr::Foundation::HRESULT),
    create_trustee : Proc(IGPM*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_client_side_extensions : Proc(IGPM*, Void**, Win32cr::Foundation::HRESULT),
    get_constants : Proc(IGPM*, Void**, Win32cr::Foundation::HRESULT),
    get_migration_table : Proc(IGPM*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    create_migration_table : Proc(IGPM*, Void**, Win32cr::Foundation::HRESULT),
    initialize_reporting : Proc(IGPM*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGPM, lpVtbl : IGPMVtbl* do
    GUID = LibC::GUID.new(0xf5fae809_u32, 0x3bd6_u16, 0x4da9_u16, StaticArray[0xa6_u8, 0x5e_u8, 0x17_u8, 0x66_u8, 0x5b_u8, 0x41_u8, 0xd7_u8, 0x63_u8])
    def query_interface(this : IGPM*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGPM*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGPM*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IGPM*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IGPM*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IGPM*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IGPM*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_domain(this : IGPM*, bstrDomain : Win32cr::Foundation::BSTR, bstrDomainController : Win32cr::Foundation::BSTR, lDCFlags : Int32, pIGPMDomain : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_domain.call(this, bstrDomain, bstrDomainController, lDCFlags, pIGPMDomain)
    end
    def get_backup_dir(this : IGPM*, bstrBackupDir : Win32cr::Foundation::BSTR, pIGPMBackupDir : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_backup_dir.call(this, bstrBackupDir, pIGPMBackupDir)
    end
    def get_sites_container(this : IGPM*, bstrForest : Win32cr::Foundation::BSTR, bstrDomain : Win32cr::Foundation::BSTR, bstrDomainController : Win32cr::Foundation::BSTR, lDCFlags : Int32, ppIGPMSitesContainer : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sites_container.call(this, bstrForest, bstrDomain, bstrDomainController, lDCFlags, ppIGPMSitesContainer)
    end
    def get_rsop(this : IGPM*, gpmRSoPMode : Win32cr::System::GroupPolicy::GPMRSOPMode, bstrNamespace : Win32cr::Foundation::BSTR, lFlags : Int32, ppIGPMRSOP : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rsop.call(this, gpmRSoPMode, bstrNamespace, lFlags, ppIGPMRSOP)
    end
    def create_permission(this : IGPM*, bstrTrustee : Win32cr::Foundation::BSTR, perm : Win32cr::System::GroupPolicy::GPMPermissionType, bInheritable : Int16, ppPerm : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_permission.call(this, bstrTrustee, perm, bInheritable, ppPerm)
    end
    def create_search_criteria(this : IGPM*, ppIGPMSearchCriteria : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_search_criteria.call(this, ppIGPMSearchCriteria)
    end
    def create_trustee(this : IGPM*, bstrTrustee : Win32cr::Foundation::BSTR, ppIGPMTrustee : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_trustee.call(this, bstrTrustee, ppIGPMTrustee)
    end
    def get_client_side_extensions(this : IGPM*, ppIGPMCSECollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_client_side_extensions.call(this, ppIGPMCSECollection)
    end
    def get_constants(this : IGPM*, ppIGPMConstants : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_constants.call(this, ppIGPMConstants)
    end
    def get_migration_table(this : IGPM*, bstrMigrationTablePath : Win32cr::Foundation::BSTR, ppMigrationTable : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_migration_table.call(this, bstrMigrationTablePath, ppMigrationTable)
    end
    def create_migration_table(this : IGPM*, ppMigrationTable : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_migration_table.call(this, ppMigrationTable)
    end
    def initialize_reporting(this : IGPM*, bstrAdmPath : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_reporting.call(this, bstrAdmPath)
    end

  end

  @[Extern]
  record IGPMDomainVtbl,
    query_interface : Proc(IGPMDomain*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGPMDomain*, UInt32),
    release : Proc(IGPMDomain*, UInt32),
    get_type_info_count : Proc(IGPMDomain*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IGPMDomain*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IGPMDomain*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IGPMDomain*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_DomainController : Proc(IGPMDomain*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Domain : Proc(IGPMDomain*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    create_gpo : Proc(IGPMDomain*, Void**, Win32cr::Foundation::HRESULT),
    get_gpo : Proc(IGPMDomain*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    search_gp_os : Proc(IGPMDomain*, Void*, Void**, Win32cr::Foundation::HRESULT),
    restore_gpo : Proc(IGPMDomain*, Void*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    get_som : Proc(IGPMDomain*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    search_so_ms : Proc(IGPMDomain*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_wmi_filter : Proc(IGPMDomain*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    search_wmi_filters : Proc(IGPMDomain*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGPMDomain, lpVtbl : IGPMDomainVtbl* do
    GUID = LibC::GUID.new(0x6b21cc14_u32, 0x5a00_u16, 0x4f44_u16, StaticArray[0xa7_u8, 0x38_u8, 0xfe_u8, 0xec_u8, 0x8a_u8, 0x94_u8, 0xc7_u8, 0xe3_u8])
    def query_interface(this : IGPMDomain*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGPMDomain*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGPMDomain*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IGPMDomain*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IGPMDomain*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IGPMDomain*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IGPMDomain*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_DomainController(this : IGPMDomain*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DomainController.call(this, pVal)
    end
    def get_Domain(this : IGPMDomain*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Domain.call(this, pVal)
    end
    def create_gpo(this : IGPMDomain*, ppNewGPO : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_gpo.call(this, ppNewGPO)
    end
    def get_gpo(this : IGPMDomain*, bstrGuid : Win32cr::Foundation::BSTR, ppGPO : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_gpo.call(this, bstrGuid, ppGPO)
    end
    def search_gp_os(this : IGPMDomain*, pIGPMSearchCriteria : Void*, ppIGPMGPOCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.search_gp_os.call(this, pIGPMSearchCriteria, ppIGPMGPOCollection)
    end
    def restore_gpo(this : IGPMDomain*, pIGPMBackup : Void*, lDCFlags : Int32, pvarGPMProgress : Win32cr::System::Com::VARIANT*, pvarGPMCancel : Win32cr::System::Com::VARIANT*, ppIGPMResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.restore_gpo.call(this, pIGPMBackup, lDCFlags, pvarGPMProgress, pvarGPMCancel, ppIGPMResult)
    end
    def get_som(this : IGPMDomain*, bstrPath : Win32cr::Foundation::BSTR, ppSOM : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_som.call(this, bstrPath, ppSOM)
    end
    def search_so_ms(this : IGPMDomain*, pIGPMSearchCriteria : Void*, ppIGPMSOMCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.search_so_ms.call(this, pIGPMSearchCriteria, ppIGPMSOMCollection)
    end
    def get_wmi_filter(this : IGPMDomain*, bstrPath : Win32cr::Foundation::BSTR, ppWMIFilter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_wmi_filter.call(this, bstrPath, ppWMIFilter)
    end
    def search_wmi_filters(this : IGPMDomain*, pIGPMSearchCriteria : Void*, ppIGPMWMIFilterCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.search_wmi_filters.call(this, pIGPMSearchCriteria, ppIGPMWMIFilterCollection)
    end

  end

  @[Extern]
  record IGPMBackupDirVtbl,
    query_interface : Proc(IGPMBackupDir*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGPMBackupDir*, UInt32),
    release : Proc(IGPMBackupDir*, UInt32),
    get_type_info_count : Proc(IGPMBackupDir*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IGPMBackupDir*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IGPMBackupDir*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IGPMBackupDir*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_BackupDirectory : Proc(IGPMBackupDir*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_backup : Proc(IGPMBackupDir*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    search_backups : Proc(IGPMBackupDir*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGPMBackupDir, lpVtbl : IGPMBackupDirVtbl* do
    GUID = LibC::GUID.new(0xb1568bed_u32, 0xa93_u16, 0x4acc_u16, StaticArray[0x81_u8, 0xf_u8, 0xaf_u8, 0xe7_u8, 0x8_u8, 0x10_u8, 0x19_u8, 0xb9_u8])
    def query_interface(this : IGPMBackupDir*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGPMBackupDir*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGPMBackupDir*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IGPMBackupDir*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IGPMBackupDir*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IGPMBackupDir*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IGPMBackupDir*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_BackupDirectory(this : IGPMBackupDir*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BackupDirectory.call(this, pVal)
    end
    def get_backup(this : IGPMBackupDir*, bstrID : Win32cr::Foundation::BSTR, ppBackup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_backup.call(this, bstrID, ppBackup)
    end
    def search_backups(this : IGPMBackupDir*, pIGPMSearchCriteria : Void*, ppIGPMBackupCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.search_backups.call(this, pIGPMSearchCriteria, ppIGPMBackupCollection)
    end

  end

  @[Extern]
  record IGPMSitesContainerVtbl,
    query_interface : Proc(IGPMSitesContainer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGPMSitesContainer*, UInt32),
    release : Proc(IGPMSitesContainer*, UInt32),
    get_type_info_count : Proc(IGPMSitesContainer*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IGPMSitesContainer*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IGPMSitesContainer*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IGPMSitesContainer*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_DomainController : Proc(IGPMSitesContainer*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Domain : Proc(IGPMSitesContainer*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Forest : Proc(IGPMSitesContainer*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_site : Proc(IGPMSitesContainer*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    search_sites : Proc(IGPMSitesContainer*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGPMSitesContainer, lpVtbl : IGPMSitesContainerVtbl* do
    GUID = LibC::GUID.new(0x4725a899_u32, 0x2782_u16, 0x4d27_u16, StaticArray[0xa6_u8, 0xbb_u8, 0xd4_u8, 0x99_u8, 0x24_u8, 0x6f_u8, 0xfd_u8, 0x72_u8])
    def query_interface(this : IGPMSitesContainer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGPMSitesContainer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGPMSitesContainer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IGPMSitesContainer*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IGPMSitesContainer*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IGPMSitesContainer*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IGPMSitesContainer*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_DomainController(this : IGPMSitesContainer*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DomainController.call(this, pVal)
    end
    def get_Domain(this : IGPMSitesContainer*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Domain.call(this, pVal)
    end
    def get_Forest(this : IGPMSitesContainer*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Forest.call(this, pVal)
    end
    def get_site(this : IGPMSitesContainer*, bstrSiteName : Win32cr::Foundation::BSTR, ppSOM : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_site.call(this, bstrSiteName, ppSOM)
    end
    def search_sites(this : IGPMSitesContainer*, pIGPMSearchCriteria : Void*, ppIGPMSOMCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.search_sites.call(this, pIGPMSearchCriteria, ppIGPMSOMCollection)
    end

  end

  @[Extern]
  record IGPMSearchCriteriaVtbl,
    query_interface : Proc(IGPMSearchCriteria*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGPMSearchCriteria*, UInt32),
    release : Proc(IGPMSearchCriteria*, UInt32),
    get_type_info_count : Proc(IGPMSearchCriteria*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IGPMSearchCriteria*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IGPMSearchCriteria*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IGPMSearchCriteria*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    add : Proc(IGPMSearchCriteria*, Win32cr::System::GroupPolicy::GPMSearchProperty, Win32cr::System::GroupPolicy::GPMSearchOperation, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGPMSearchCriteria, lpVtbl : IGPMSearchCriteriaVtbl* do
    GUID = LibC::GUID.new(0xd6f11c42_u32, 0x829b_u16, 0x48d4_u16, StaticArray[0x83_u8, 0xf5_u8, 0x36_u8, 0x15_u8, 0xb6_u8, 0x7d_u8, 0xfc_u8, 0x22_u8])
    def query_interface(this : IGPMSearchCriteria*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGPMSearchCriteria*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGPMSearchCriteria*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IGPMSearchCriteria*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IGPMSearchCriteria*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IGPMSearchCriteria*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IGPMSearchCriteria*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def add(this : IGPMSearchCriteria*, searchProperty : Win32cr::System::GroupPolicy::GPMSearchProperty, searchOperation : Win32cr::System::GroupPolicy::GPMSearchOperation, varValue : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, searchProperty, searchOperation, varValue)
    end

  end

  @[Extern]
  record IGPMTrusteeVtbl,
    query_interface : Proc(IGPMTrustee*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGPMTrustee*, UInt32),
    release : Proc(IGPMTrustee*, UInt32),
    get_type_info_count : Proc(IGPMTrustee*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IGPMTrustee*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IGPMTrustee*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IGPMTrustee*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_TrusteeSid : Proc(IGPMTrustee*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_TrusteeName : Proc(IGPMTrustee*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_TrusteeDomain : Proc(IGPMTrustee*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_TrusteeDSPath : Proc(IGPMTrustee*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_TrusteeType : Proc(IGPMTrustee*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGPMTrustee, lpVtbl : IGPMTrusteeVtbl* do
    GUID = LibC::GUID.new(0x3b466da8_u32, 0xc1a4_u16, 0x4b2a_u16, StaticArray[0x99_u8, 0x9a_u8, 0xbe_u8, 0xfc_u8, 0xdd_u8, 0x56_u8, 0xce_u8, 0xfb_u8])
    def query_interface(this : IGPMTrustee*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGPMTrustee*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGPMTrustee*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IGPMTrustee*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IGPMTrustee*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IGPMTrustee*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IGPMTrustee*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_TrusteeSid(this : IGPMTrustee*, bstrVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TrusteeSid.call(this, bstrVal)
    end
    def get_TrusteeName(this : IGPMTrustee*, bstrVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TrusteeName.call(this, bstrVal)
    end
    def get_TrusteeDomain(this : IGPMTrustee*, bstrVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TrusteeDomain.call(this, bstrVal)
    end
    def get_TrusteeDSPath(this : IGPMTrustee*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TrusteeDSPath.call(this, pVal)
    end
    def get_TrusteeType(this : IGPMTrustee*, lVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TrusteeType.call(this, lVal)
    end

  end

  @[Extern]
  record IGPMPermissionVtbl,
    query_interface : Proc(IGPMPermission*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGPMPermission*, UInt32),
    release : Proc(IGPMPermission*, UInt32),
    get_type_info_count : Proc(IGPMPermission*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IGPMPermission*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IGPMPermission*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IGPMPermission*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Inherited : Proc(IGPMPermission*, Int16*, Win32cr::Foundation::HRESULT),
    get_Inheritable : Proc(IGPMPermission*, Int16*, Win32cr::Foundation::HRESULT),
    get_Denied : Proc(IGPMPermission*, Int16*, Win32cr::Foundation::HRESULT),
    get_Permission : Proc(IGPMPermission*, Win32cr::System::GroupPolicy::GPMPermissionType*, Win32cr::Foundation::HRESULT),
    get_Trustee : Proc(IGPMPermission*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGPMPermission, lpVtbl : IGPMPermissionVtbl* do
    GUID = LibC::GUID.new(0x35ebca40_u32, 0xe1a1_u16, 0x4a02_u16, StaticArray[0x89_u8, 0x5_u8, 0xd7_u8, 0x94_u8, 0x16_u8, 0xfb_u8, 0x46_u8, 0x4a_u8])
    def query_interface(this : IGPMPermission*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGPMPermission*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGPMPermission*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IGPMPermission*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IGPMPermission*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IGPMPermission*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IGPMPermission*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Inherited(this : IGPMPermission*, pVal : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Inherited.call(this, pVal)
    end
    def get_Inheritable(this : IGPMPermission*, pVal : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Inheritable.call(this, pVal)
    end
    def get_Denied(this : IGPMPermission*, pVal : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Denied.call(this, pVal)
    end
    def get_Permission(this : IGPMPermission*, pVal : Win32cr::System::GroupPolicy::GPMPermissionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Permission.call(this, pVal)
    end
    def get_Trustee(this : IGPMPermission*, ppIGPMTrustee : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Trustee.call(this, ppIGPMTrustee)
    end

  end

  @[Extern]
  record IGPMSecurityInfoVtbl,
    query_interface : Proc(IGPMSecurityInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGPMSecurityInfo*, UInt32),
    release : Proc(IGPMSecurityInfo*, UInt32),
    get_type_info_count : Proc(IGPMSecurityInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IGPMSecurityInfo*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IGPMSecurityInfo*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IGPMSecurityInfo*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IGPMSecurityInfo*, Int32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IGPMSecurityInfo*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IGPMSecurityInfo*, Void**, Win32cr::Foundation::HRESULT),
    add : Proc(IGPMSecurityInfo*, Void*, Win32cr::Foundation::HRESULT),
    remove : Proc(IGPMSecurityInfo*, Void*, Win32cr::Foundation::HRESULT),
    remove_trustee : Proc(IGPMSecurityInfo*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGPMSecurityInfo, lpVtbl : IGPMSecurityInfoVtbl* do
    GUID = LibC::GUID.new(0xb6c31ed4_u32, 0x1c93_u16, 0x4d3e_u16, StaticArray[0xae_u8, 0x84_u8, 0xeb_u8, 0x6d_u8, 0x61_u8, 0x16_u8, 0x1b_u8, 0x60_u8])
    def query_interface(this : IGPMSecurityInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGPMSecurityInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGPMSecurityInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IGPMSecurityInfo*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IGPMSecurityInfo*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IGPMSecurityInfo*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IGPMSecurityInfo*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : IGPMSecurityInfo*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, pVal)
    end
    def get_Item(this : IGPMSecurityInfo*, lIndex : Int32, pVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, lIndex, pVal)
    end
    def get__NewEnum(this : IGPMSecurityInfo*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppEnum)
    end
    def add(this : IGPMSecurityInfo*, pPerm : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, pPerm)
    end
    def remove(this : IGPMSecurityInfo*, pPerm : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, pPerm)
    end
    def remove_trustee(this : IGPMSecurityInfo*, bstrTrustee : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_trustee.call(this, bstrTrustee)
    end

  end

  @[Extern]
  record IGPMBackupVtbl,
    query_interface : Proc(IGPMBackup*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGPMBackup*, UInt32),
    release : Proc(IGPMBackup*, UInt32),
    get_type_info_count : Proc(IGPMBackup*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IGPMBackup*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IGPMBackup*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IGPMBackup*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_ID : Proc(IGPMBackup*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_GPOID : Proc(IGPMBackup*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_GPODomain : Proc(IGPMBackup*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_GPODisplayName : Proc(IGPMBackup*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Timestamp : Proc(IGPMBackup*, Float64*, Win32cr::Foundation::HRESULT),
    get_Comment : Proc(IGPMBackup*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_BackupDir : Proc(IGPMBackup*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    delete : Proc(IGPMBackup*, Win32cr::Foundation::HRESULT),
    generate_report : Proc(IGPMBackup*, Win32cr::System::GroupPolicy::GPMReportType, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    generate_report_to_file : Proc(IGPMBackup*, Win32cr::System::GroupPolicy::GPMReportType, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGPMBackup, lpVtbl : IGPMBackupVtbl* do
    GUID = LibC::GUID.new(0xd8a16a35_u32, 0x3b0d_u16, 0x416b_u16, StaticArray[0x8d_u8, 0x2_u8, 0x4d_u8, 0xf6_u8, 0xf9_u8, 0x5a_u8, 0x71_u8, 0x19_u8])
    def query_interface(this : IGPMBackup*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGPMBackup*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGPMBackup*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IGPMBackup*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IGPMBackup*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IGPMBackup*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IGPMBackup*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_ID(this : IGPMBackup*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ID.call(this, pVal)
    end
    def get_GPOID(this : IGPMBackup*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_GPOID.call(this, pVal)
    end
    def get_GPODomain(this : IGPMBackup*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_GPODomain.call(this, pVal)
    end
    def get_GPODisplayName(this : IGPMBackup*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_GPODisplayName.call(this, pVal)
    end
    def get_Timestamp(this : IGPMBackup*, pVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Timestamp.call(this, pVal)
    end
    def get_Comment(this : IGPMBackup*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Comment.call(this, pVal)
    end
    def get_BackupDir(this : IGPMBackup*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BackupDir.call(this, pVal)
    end
    def delete(this : IGPMBackup*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def generate_report(this : IGPMBackup*, gpmReportType : Win32cr::System::GroupPolicy::GPMReportType, pvarGPMProgress : Win32cr::System::Com::VARIANT*, pvarGPMCancel : Win32cr::System::Com::VARIANT*, ppIGPMResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.generate_report.call(this, gpmReportType, pvarGPMProgress, pvarGPMCancel, ppIGPMResult)
    end
    def generate_report_to_file(this : IGPMBackup*, gpmReportType : Win32cr::System::GroupPolicy::GPMReportType, bstrTargetFilePath : Win32cr::Foundation::BSTR, ppIGPMResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.generate_report_to_file.call(this, gpmReportType, bstrTargetFilePath, ppIGPMResult)
    end

  end

  @[Extern]
  record IGPMBackupCollectionVtbl,
    query_interface : Proc(IGPMBackupCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGPMBackupCollection*, UInt32),
    release : Proc(IGPMBackupCollection*, UInt32),
    get_type_info_count : Proc(IGPMBackupCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IGPMBackupCollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IGPMBackupCollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IGPMBackupCollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IGPMBackupCollection*, Int32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IGPMBackupCollection*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IGPMBackupCollection*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGPMBackupCollection, lpVtbl : IGPMBackupCollectionVtbl* do
    GUID = LibC::GUID.new(0xc786fc0f_u32, 0x26d8_u16, 0x4bab_u16, StaticArray[0xa7_u8, 0x45_u8, 0x39_u8, 0xca_u8, 0x7e_u8, 0x80_u8, 0xc_u8, 0xac_u8])
    def query_interface(this : IGPMBackupCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGPMBackupCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGPMBackupCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IGPMBackupCollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IGPMBackupCollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IGPMBackupCollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IGPMBackupCollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : IGPMBackupCollection*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, pVal)
    end
    def get_Item(this : IGPMBackupCollection*, lIndex : Int32, pVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, lIndex, pVal)
    end
    def get__NewEnum(this : IGPMBackupCollection*, ppIGPMBackup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppIGPMBackup)
    end

  end

  @[Extern]
  record IGPMSOMVtbl,
    query_interface : Proc(IGPMSOM*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGPMSOM*, UInt32),
    release : Proc(IGPMSOM*, UInt32),
    get_type_info_count : Proc(IGPMSOM*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IGPMSOM*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IGPMSOM*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IGPMSOM*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_GPOInheritanceBlocked : Proc(IGPMSOM*, Int16*, Win32cr::Foundation::HRESULT),
    put_GPOInheritanceBlocked : Proc(IGPMSOM*, Int16, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IGPMSOM*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Path : Proc(IGPMSOM*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    create_gpo_link : Proc(IGPMSOM*, Int32, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_Type : Proc(IGPMSOM*, Win32cr::System::GroupPolicy::GPMSOMType*, Win32cr::Foundation::HRESULT),
    get_gpo_links : Proc(IGPMSOM*, Void**, Win32cr::Foundation::HRESULT),
    get_inherited_gpo_links : Proc(IGPMSOM*, Void**, Win32cr::Foundation::HRESULT),
    get_security_info : Proc(IGPMSOM*, Void**, Win32cr::Foundation::HRESULT),
    set_security_info : Proc(IGPMSOM*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGPMSOM, lpVtbl : IGPMSOMVtbl* do
    GUID = LibC::GUID.new(0xc0a7f09e_u32, 0x5a1_u16, 0x4f0c_u16, StaticArray[0x81_u8, 0x58_u8, 0x9e_u8, 0x5c_u8, 0x33_u8, 0x68_u8, 0x4f_u8, 0x6b_u8])
    def query_interface(this : IGPMSOM*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGPMSOM*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGPMSOM*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IGPMSOM*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IGPMSOM*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IGPMSOM*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IGPMSOM*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_GPOInheritanceBlocked(this : IGPMSOM*, pVal : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_GPOInheritanceBlocked.call(this, pVal)
    end
    def put_GPOInheritanceBlocked(this : IGPMSOM*, newVal : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_GPOInheritanceBlocked.call(this, newVal)
    end
    def get_Name(this : IGPMSOM*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pVal)
    end
    def get_Path(this : IGPMSOM*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Path.call(this, pVal)
    end
    def create_gpo_link(this : IGPMSOM*, lLinkPos : Int32, pGPO : Void*, ppNewGPOLink : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_gpo_link.call(this, lLinkPos, pGPO, ppNewGPOLink)
    end
    def get_Type(this : IGPMSOM*, pVal : Win32cr::System::GroupPolicy::GPMSOMType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, pVal)
    end
    def get_gpo_links(this : IGPMSOM*, ppGPOLinks : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_gpo_links.call(this, ppGPOLinks)
    end
    def get_inherited_gpo_links(this : IGPMSOM*, ppGPOLinks : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_inherited_gpo_links.call(this, ppGPOLinks)
    end
    def get_security_info(this : IGPMSOM*, ppSecurityInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_security_info.call(this, ppSecurityInfo)
    end
    def set_security_info(this : IGPMSOM*, pSecurityInfo : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_security_info.call(this, pSecurityInfo)
    end

  end

  @[Extern]
  record IGPMSOMCollectionVtbl,
    query_interface : Proc(IGPMSOMCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGPMSOMCollection*, UInt32),
    release : Proc(IGPMSOMCollection*, UInt32),
    get_type_info_count : Proc(IGPMSOMCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IGPMSOMCollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IGPMSOMCollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IGPMSOMCollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IGPMSOMCollection*, Int32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IGPMSOMCollection*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IGPMSOMCollection*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGPMSOMCollection, lpVtbl : IGPMSOMCollectionVtbl* do
    GUID = LibC::GUID.new(0xadc1688e_u32, 0xe4_u16, 0x4495_u16, StaticArray[0xab_u8, 0xba_u8, 0xbe_u8, 0xd2_u8, 0x0_u8, 0xdf_u8, 0xc_u8, 0xab_u8])
    def query_interface(this : IGPMSOMCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGPMSOMCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGPMSOMCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IGPMSOMCollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IGPMSOMCollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IGPMSOMCollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IGPMSOMCollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : IGPMSOMCollection*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, pVal)
    end
    def get_Item(this : IGPMSOMCollection*, lIndex : Int32, pVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, lIndex, pVal)
    end
    def get__NewEnum(this : IGPMSOMCollection*, ppIGPMSOM : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppIGPMSOM)
    end

  end

  @[Extern]
  record IGPMWMIFilterVtbl,
    query_interface : Proc(IGPMWMIFilter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGPMWMIFilter*, UInt32),
    release : Proc(IGPMWMIFilter*, UInt32),
    get_type_info_count : Proc(IGPMWMIFilter*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IGPMWMIFilter*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IGPMWMIFilter*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IGPMWMIFilter*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Path : Proc(IGPMWMIFilter*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IGPMWMIFilter*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IGPMWMIFilter*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IGPMWMIFilter*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IGPMWMIFilter*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_query_list : Proc(IGPMWMIFilter*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_security_info : Proc(IGPMWMIFilter*, Void**, Win32cr::Foundation::HRESULT),
    set_security_info : Proc(IGPMWMIFilter*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGPMWMIFilter, lpVtbl : IGPMWMIFilterVtbl* do
    GUID = LibC::GUID.new(0xef2ff9b4_u32, 0x3c27_u16, 0x459a_u16, StaticArray[0xb9_u8, 0x79_u8, 0x3_u8, 0x83_u8, 0x5_u8, 0xce_u8, 0xc7_u8, 0x5d_u8])
    def query_interface(this : IGPMWMIFilter*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGPMWMIFilter*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGPMWMIFilter*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IGPMWMIFilter*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IGPMWMIFilter*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IGPMWMIFilter*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IGPMWMIFilter*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Path(this : IGPMWMIFilter*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Path.call(this, pVal)
    end
    def put_Name(this : IGPMWMIFilter*, newVal : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, newVal)
    end
    def get_Name(this : IGPMWMIFilter*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pVal)
    end
    def put_Description(this : IGPMWMIFilter*, newVal : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, newVal)
    end
    def get_Description(this : IGPMWMIFilter*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, pVal)
    end
    def get_query_list(this : IGPMWMIFilter*, pQryList : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_query_list.call(this, pQryList)
    end
    def get_security_info(this : IGPMWMIFilter*, ppSecurityInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_security_info.call(this, ppSecurityInfo)
    end
    def set_security_info(this : IGPMWMIFilter*, pSecurityInfo : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_security_info.call(this, pSecurityInfo)
    end

  end

  @[Extern]
  record IGPMWMIFilterCollectionVtbl,
    query_interface : Proc(IGPMWMIFilterCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGPMWMIFilterCollection*, UInt32),
    release : Proc(IGPMWMIFilterCollection*, UInt32),
    get_type_info_count : Proc(IGPMWMIFilterCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IGPMWMIFilterCollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IGPMWMIFilterCollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IGPMWMIFilterCollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IGPMWMIFilterCollection*, Int32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IGPMWMIFilterCollection*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IGPMWMIFilterCollection*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGPMWMIFilterCollection, lpVtbl : IGPMWMIFilterCollectionVtbl* do
    GUID = LibC::GUID.new(0x5782d582_u32, 0x1a36_u16, 0x4661_u16, StaticArray[0x8a_u8, 0x94_u8, 0xc3_u8, 0xc3_u8, 0x25_u8, 0x51_u8, 0x94_u8, 0x5b_u8])
    def query_interface(this : IGPMWMIFilterCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGPMWMIFilterCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGPMWMIFilterCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IGPMWMIFilterCollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IGPMWMIFilterCollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IGPMWMIFilterCollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IGPMWMIFilterCollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : IGPMWMIFilterCollection*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, pVal)
    end
    def get_Item(this : IGPMWMIFilterCollection*, lIndex : Int32, pVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, lIndex, pVal)
    end
    def get__NewEnum(this : IGPMWMIFilterCollection*, pVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, pVal)
    end

  end

  @[Extern]
  record IGPMRSOPVtbl,
    query_interface : Proc(IGPMRSOP*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGPMRSOP*, UInt32),
    release : Proc(IGPMRSOP*, UInt32),
    get_type_info_count : Proc(IGPMRSOP*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IGPMRSOP*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IGPMRSOP*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IGPMRSOP*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Mode : Proc(IGPMRSOP*, Win32cr::System::GroupPolicy::GPMRSOPMode*, Win32cr::Foundation::HRESULT),
    get_Namespace : Proc(IGPMRSOP*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_LoggingComputer : Proc(IGPMRSOP*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_LoggingComputer : Proc(IGPMRSOP*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_LoggingUser : Proc(IGPMRSOP*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_LoggingUser : Proc(IGPMRSOP*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_LoggingFlags : Proc(IGPMRSOP*, Int32, Win32cr::Foundation::HRESULT),
    get_LoggingFlags : Proc(IGPMRSOP*, Int32*, Win32cr::Foundation::HRESULT),
    put_PlanningFlags : Proc(IGPMRSOP*, Int32, Win32cr::Foundation::HRESULT),
    get_PlanningFlags : Proc(IGPMRSOP*, Int32*, Win32cr::Foundation::HRESULT),
    put_PlanningDomainController : Proc(IGPMRSOP*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_PlanningDomainController : Proc(IGPMRSOP*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_PlanningSiteName : Proc(IGPMRSOP*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_PlanningSiteName : Proc(IGPMRSOP*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_PlanningUser : Proc(IGPMRSOP*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_PlanningUser : Proc(IGPMRSOP*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_PlanningUserSOM : Proc(IGPMRSOP*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_PlanningUserSOM : Proc(IGPMRSOP*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_PlanningUserWMIFilters : Proc(IGPMRSOP*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_PlanningUserWMIFilters : Proc(IGPMRSOP*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_PlanningUserSecurityGroups : Proc(IGPMRSOP*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_PlanningUserSecurityGroups : Proc(IGPMRSOP*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_PlanningComputer : Proc(IGPMRSOP*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_PlanningComputer : Proc(IGPMRSOP*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_PlanningComputerSOM : Proc(IGPMRSOP*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_PlanningComputerSOM : Proc(IGPMRSOP*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_PlanningComputerWMIFilters : Proc(IGPMRSOP*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_PlanningComputerWMIFilters : Proc(IGPMRSOP*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_PlanningComputerSecurityGroups : Proc(IGPMRSOP*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_PlanningComputerSecurityGroups : Proc(IGPMRSOP*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    logging_enumerate_users : Proc(IGPMRSOP*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    create_query_results : Proc(IGPMRSOP*, Win32cr::Foundation::HRESULT),
    release_query_results : Proc(IGPMRSOP*, Win32cr::Foundation::HRESULT),
    generate_report : Proc(IGPMRSOP*, Win32cr::System::GroupPolicy::GPMReportType, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    generate_report_to_file : Proc(IGPMRSOP*, Win32cr::System::GroupPolicy::GPMReportType, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGPMRSOP, lpVtbl : IGPMRSOPVtbl* do
    GUID = LibC::GUID.new(0x49ed785a_u32, 0x3237_u16, 0x4ff2_u16, StaticArray[0xb1_u8, 0xf0_u8, 0xfd_u8, 0xf5_u8, 0xa8_u8, 0xd5_u8, 0xa1_u8, 0xee_u8])
    def query_interface(this : IGPMRSOP*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGPMRSOP*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGPMRSOP*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IGPMRSOP*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IGPMRSOP*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IGPMRSOP*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IGPMRSOP*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Mode(this : IGPMRSOP*, pVal : Win32cr::System::GroupPolicy::GPMRSOPMode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Mode.call(this, pVal)
    end
    def get_Namespace(this : IGPMRSOP*, bstrVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Namespace.call(this, bstrVal)
    end
    def put_LoggingComputer(this : IGPMRSOP*, bstrVal : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LoggingComputer.call(this, bstrVal)
    end
    def get_LoggingComputer(this : IGPMRSOP*, bstrVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LoggingComputer.call(this, bstrVal)
    end
    def put_LoggingUser(this : IGPMRSOP*, bstrVal : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LoggingUser.call(this, bstrVal)
    end
    def get_LoggingUser(this : IGPMRSOP*, bstrVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LoggingUser.call(this, bstrVal)
    end
    def put_LoggingFlags(this : IGPMRSOP*, lVal : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LoggingFlags.call(this, lVal)
    end
    def get_LoggingFlags(this : IGPMRSOP*, lVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LoggingFlags.call(this, lVal)
    end
    def put_PlanningFlags(this : IGPMRSOP*, lVal : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PlanningFlags.call(this, lVal)
    end
    def get_PlanningFlags(this : IGPMRSOP*, lVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PlanningFlags.call(this, lVal)
    end
    def put_PlanningDomainController(this : IGPMRSOP*, bstrVal : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PlanningDomainController.call(this, bstrVal)
    end
    def get_PlanningDomainController(this : IGPMRSOP*, bstrVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PlanningDomainController.call(this, bstrVal)
    end
    def put_PlanningSiteName(this : IGPMRSOP*, bstrVal : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PlanningSiteName.call(this, bstrVal)
    end
    def get_PlanningSiteName(this : IGPMRSOP*, bstrVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PlanningSiteName.call(this, bstrVal)
    end
    def put_PlanningUser(this : IGPMRSOP*, bstrVal : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PlanningUser.call(this, bstrVal)
    end
    def get_PlanningUser(this : IGPMRSOP*, bstrVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PlanningUser.call(this, bstrVal)
    end
    def put_PlanningUserSOM(this : IGPMRSOP*, bstrVal : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PlanningUserSOM.call(this, bstrVal)
    end
    def get_PlanningUserSOM(this : IGPMRSOP*, bstrVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PlanningUserSOM.call(this, bstrVal)
    end
    def put_PlanningUserWMIFilters(this : IGPMRSOP*, varVal : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PlanningUserWMIFilters.call(this, varVal)
    end
    def get_PlanningUserWMIFilters(this : IGPMRSOP*, varVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PlanningUserWMIFilters.call(this, varVal)
    end
    def put_PlanningUserSecurityGroups(this : IGPMRSOP*, varVal : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PlanningUserSecurityGroups.call(this, varVal)
    end
    def get_PlanningUserSecurityGroups(this : IGPMRSOP*, varVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PlanningUserSecurityGroups.call(this, varVal)
    end
    def put_PlanningComputer(this : IGPMRSOP*, bstrVal : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PlanningComputer.call(this, bstrVal)
    end
    def get_PlanningComputer(this : IGPMRSOP*, bstrVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PlanningComputer.call(this, bstrVal)
    end
    def put_PlanningComputerSOM(this : IGPMRSOP*, bstrVal : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PlanningComputerSOM.call(this, bstrVal)
    end
    def get_PlanningComputerSOM(this : IGPMRSOP*, bstrVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PlanningComputerSOM.call(this, bstrVal)
    end
    def put_PlanningComputerWMIFilters(this : IGPMRSOP*, varVal : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PlanningComputerWMIFilters.call(this, varVal)
    end
    def get_PlanningComputerWMIFilters(this : IGPMRSOP*, varVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PlanningComputerWMIFilters.call(this, varVal)
    end
    def put_PlanningComputerSecurityGroups(this : IGPMRSOP*, varVal : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PlanningComputerSecurityGroups.call(this, varVal)
    end
    def get_PlanningComputerSecurityGroups(this : IGPMRSOP*, varVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PlanningComputerSecurityGroups.call(this, varVal)
    end
    def logging_enumerate_users(this : IGPMRSOP*, varVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.logging_enumerate_users.call(this, varVal)
    end
    def create_query_results(this : IGPMRSOP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_query_results.call(this)
    end
    def release_query_results(this : IGPMRSOP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.release_query_results.call(this)
    end
    def generate_report(this : IGPMRSOP*, gpmReportType : Win32cr::System::GroupPolicy::GPMReportType, pvarGPMProgress : Win32cr::System::Com::VARIANT*, pvarGPMCancel : Win32cr::System::Com::VARIANT*, ppIGPMResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.generate_report.call(this, gpmReportType, pvarGPMProgress, pvarGPMCancel, ppIGPMResult)
    end
    def generate_report_to_file(this : IGPMRSOP*, gpmReportType : Win32cr::System::GroupPolicy::GPMReportType, bstrTargetFilePath : Win32cr::Foundation::BSTR, ppIGPMResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.generate_report_to_file.call(this, gpmReportType, bstrTargetFilePath, ppIGPMResult)
    end

  end

  @[Extern]
  record IGPMGPOVtbl,
    query_interface : Proc(IGPMGPO*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGPMGPO*, UInt32),
    release : Proc(IGPMGPO*, UInt32),
    get_type_info_count : Proc(IGPMGPO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IGPMGPO*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IGPMGPO*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IGPMGPO*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_DisplayName : Proc(IGPMGPO*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_DisplayName : Proc(IGPMGPO*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Path : Proc(IGPMGPO*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ID : Proc(IGPMGPO*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DomainName : Proc(IGPMGPO*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CreationTime : Proc(IGPMGPO*, Float64*, Win32cr::Foundation::HRESULT),
    get_ModificationTime : Proc(IGPMGPO*, Float64*, Win32cr::Foundation::HRESULT),
    get_UserDSVersionNumber : Proc(IGPMGPO*, Int32*, Win32cr::Foundation::HRESULT),
    get_ComputerDSVersionNumber : Proc(IGPMGPO*, Int32*, Win32cr::Foundation::HRESULT),
    get_UserSysvolVersionNumber : Proc(IGPMGPO*, Int32*, Win32cr::Foundation::HRESULT),
    get_ComputerSysvolVersionNumber : Proc(IGPMGPO*, Int32*, Win32cr::Foundation::HRESULT),
    get_wmi_filter : Proc(IGPMGPO*, Void**, Win32cr::Foundation::HRESULT),
    set_wmi_filter : Proc(IGPMGPO*, Void*, Win32cr::Foundation::HRESULT),
    set_user_enabled : Proc(IGPMGPO*, Int16, Win32cr::Foundation::HRESULT),
    set_computer_enabled : Proc(IGPMGPO*, Int16, Win32cr::Foundation::HRESULT),
    is_user_enabled : Proc(IGPMGPO*, Int16*, Win32cr::Foundation::HRESULT),
    is_computer_enabled : Proc(IGPMGPO*, Int16*, Win32cr::Foundation::HRESULT),
    get_security_info : Proc(IGPMGPO*, Void**, Win32cr::Foundation::HRESULT),
    set_security_info : Proc(IGPMGPO*, Void*, Win32cr::Foundation::HRESULT),
    delete : Proc(IGPMGPO*, Win32cr::Foundation::HRESULT),
    backup : Proc(IGPMGPO*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    import : Proc(IGPMGPO*, Int32, Void*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    generate_report : Proc(IGPMGPO*, Win32cr::System::GroupPolicy::GPMReportType, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    generate_report_to_file : Proc(IGPMGPO*, Win32cr::System::GroupPolicy::GPMReportType, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    copy_to : Proc(IGPMGPO*, Int32, Void*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    set_security_descriptor : Proc(IGPMGPO*, Int32, Void*, Win32cr::Foundation::HRESULT),
    get_security_descriptor : Proc(IGPMGPO*, Int32, Void**, Win32cr::Foundation::HRESULT),
    is_acl_consistent : Proc(IGPMGPO*, Int16*, Win32cr::Foundation::HRESULT),
    make_acl_consistent : Proc(IGPMGPO*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGPMGPO, lpVtbl : IGPMGPOVtbl* do
    GUID = LibC::GUID.new(0x58cc4352_u32, 0x1ca3_u16, 0x48e5_u16, StaticArray[0x98_u8, 0x64_u8, 0x1d_u8, 0xa4_u8, 0xd6_u8, 0xe0_u8, 0xd6_u8, 0xf_u8])
    def query_interface(this : IGPMGPO*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGPMGPO*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGPMGPO*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IGPMGPO*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IGPMGPO*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IGPMGPO*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IGPMGPO*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_DisplayName(this : IGPMGPO*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DisplayName.call(this, pVal)
    end
    def put_DisplayName(this : IGPMGPO*, newVal : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DisplayName.call(this, newVal)
    end
    def get_Path(this : IGPMGPO*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Path.call(this, pVal)
    end
    def get_ID(this : IGPMGPO*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ID.call(this, pVal)
    end
    def get_DomainName(this : IGPMGPO*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DomainName.call(this, pVal)
    end
    def get_CreationTime(this : IGPMGPO*, pDate : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CreationTime.call(this, pDate)
    end
    def get_ModificationTime(this : IGPMGPO*, pDate : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ModificationTime.call(this, pDate)
    end
    def get_UserDSVersionNumber(this : IGPMGPO*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserDSVersionNumber.call(this, pVal)
    end
    def get_ComputerDSVersionNumber(this : IGPMGPO*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ComputerDSVersionNumber.call(this, pVal)
    end
    def get_UserSysvolVersionNumber(this : IGPMGPO*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserSysvolVersionNumber.call(this, pVal)
    end
    def get_ComputerSysvolVersionNumber(this : IGPMGPO*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ComputerSysvolVersionNumber.call(this, pVal)
    end
    def get_wmi_filter(this : IGPMGPO*, ppIGPMWMIFilter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_wmi_filter.call(this, ppIGPMWMIFilter)
    end
    def set_wmi_filter(this : IGPMGPO*, pIGPMWMIFilter : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_wmi_filter.call(this, pIGPMWMIFilter)
    end
    def set_user_enabled(this : IGPMGPO*, vbEnabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_user_enabled.call(this, vbEnabled)
    end
    def set_computer_enabled(this : IGPMGPO*, vbEnabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_computer_enabled.call(this, vbEnabled)
    end
    def is_user_enabled(this : IGPMGPO*, pvbEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_user_enabled.call(this, pvbEnabled)
    end
    def is_computer_enabled(this : IGPMGPO*, pvbEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_computer_enabled.call(this, pvbEnabled)
    end
    def get_security_info(this : IGPMGPO*, ppSecurityInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_security_info.call(this, ppSecurityInfo)
    end
    def set_security_info(this : IGPMGPO*, pSecurityInfo : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_security_info.call(this, pSecurityInfo)
    end
    def delete(this : IGPMGPO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def backup(this : IGPMGPO*, bstrBackupDir : Win32cr::Foundation::BSTR, bstrComment : Win32cr::Foundation::BSTR, pvarGPMProgress : Win32cr::System::Com::VARIANT*, pvarGPMCancel : Win32cr::System::Com::VARIANT*, ppIGPMResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.backup.call(this, bstrBackupDir, bstrComment, pvarGPMProgress, pvarGPMCancel, ppIGPMResult)
    end
    def import(this : IGPMGPO*, lFlags : Int32, pIGPMBackup : Void*, pvarMigrationTable : Win32cr::System::Com::VARIANT*, pvarGPMProgress : Win32cr::System::Com::VARIANT*, pvarGPMCancel : Win32cr::System::Com::VARIANT*, ppIGPMResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.import.call(this, lFlags, pIGPMBackup, pvarMigrationTable, pvarGPMProgress, pvarGPMCancel, ppIGPMResult)
    end
    def generate_report(this : IGPMGPO*, gpmReportType : Win32cr::System::GroupPolicy::GPMReportType, pvarGPMProgress : Win32cr::System::Com::VARIANT*, pvarGPMCancel : Win32cr::System::Com::VARIANT*, ppIGPMResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.generate_report.call(this, gpmReportType, pvarGPMProgress, pvarGPMCancel, ppIGPMResult)
    end
    def generate_report_to_file(this : IGPMGPO*, gpmReportType : Win32cr::System::GroupPolicy::GPMReportType, bstrTargetFilePath : Win32cr::Foundation::BSTR, ppIGPMResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.generate_report_to_file.call(this, gpmReportType, bstrTargetFilePath, ppIGPMResult)
    end
    def copy_to(this : IGPMGPO*, lFlags : Int32, pIGPMDomain : Void*, pvarNewDisplayName : Win32cr::System::Com::VARIANT*, pvarMigrationTable : Win32cr::System::Com::VARIANT*, pvarGPMProgress : Win32cr::System::Com::VARIANT*, pvarGPMCancel : Win32cr::System::Com::VARIANT*, ppIGPMResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_to.call(this, lFlags, pIGPMDomain, pvarNewDisplayName, pvarMigrationTable, pvarGPMProgress, pvarGPMCancel, ppIGPMResult)
    end
    def set_security_descriptor(this : IGPMGPO*, lFlags : Int32, pSD : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_security_descriptor.call(this, lFlags, pSD)
    end
    def get_security_descriptor(this : IGPMGPO*, lFlags : Int32, ppSD : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_security_descriptor.call(this, lFlags, ppSD)
    end
    def is_acl_consistent(this : IGPMGPO*, pvbConsistent : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_acl_consistent.call(this, pvbConsistent)
    end
    def make_acl_consistent(this : IGPMGPO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.make_acl_consistent.call(this)
    end

  end

  @[Extern]
  record IGPMGPOCollectionVtbl,
    query_interface : Proc(IGPMGPOCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGPMGPOCollection*, UInt32),
    release : Proc(IGPMGPOCollection*, UInt32),
    get_type_info_count : Proc(IGPMGPOCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IGPMGPOCollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IGPMGPOCollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IGPMGPOCollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IGPMGPOCollection*, Int32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IGPMGPOCollection*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IGPMGPOCollection*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGPMGPOCollection, lpVtbl : IGPMGPOCollectionVtbl* do
    GUID = LibC::GUID.new(0xf0f0d5cf_u32, 0x70ca_u16, 0x4c39_u16, StaticArray[0x9e_u8, 0x29_u8, 0xb6_u8, 0x42_u8, 0xf8_u8, 0x72_u8, 0x6c_u8, 0x1_u8])
    def query_interface(this : IGPMGPOCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGPMGPOCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGPMGPOCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IGPMGPOCollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IGPMGPOCollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IGPMGPOCollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IGPMGPOCollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : IGPMGPOCollection*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, pVal)
    end
    def get_Item(this : IGPMGPOCollection*, lIndex : Int32, pVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, lIndex, pVal)
    end
    def get__NewEnum(this : IGPMGPOCollection*, ppIGPMGPOs : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppIGPMGPOs)
    end

  end

  @[Extern]
  record IGPMGPOLinkVtbl,
    query_interface : Proc(IGPMGPOLink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGPMGPOLink*, UInt32),
    release : Proc(IGPMGPOLink*, UInt32),
    get_type_info_count : Proc(IGPMGPOLink*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IGPMGPOLink*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IGPMGPOLink*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IGPMGPOLink*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_GPOID : Proc(IGPMGPOLink*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_GPODomain : Proc(IGPMGPOLink*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Enabled : Proc(IGPMGPOLink*, Int16*, Win32cr::Foundation::HRESULT),
    put_Enabled : Proc(IGPMGPOLink*, Int16, Win32cr::Foundation::HRESULT),
    get_Enforced : Proc(IGPMGPOLink*, Int16*, Win32cr::Foundation::HRESULT),
    put_Enforced : Proc(IGPMGPOLink*, Int16, Win32cr::Foundation::HRESULT),
    get_SOMLinkOrder : Proc(IGPMGPOLink*, Int32*, Win32cr::Foundation::HRESULT),
    get_SOM : Proc(IGPMGPOLink*, Void**, Win32cr::Foundation::HRESULT),
    delete : Proc(IGPMGPOLink*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGPMGPOLink, lpVtbl : IGPMGPOLinkVtbl* do
    GUID = LibC::GUID.new(0x434b99bd_u32, 0x5de7_u16, 0x478a_u16, StaticArray[0x80_u8, 0x9c_u8, 0xc2_u8, 0x51_u8, 0x72_u8, 0x1d_u8, 0xf7_u8, 0xc_u8])
    def query_interface(this : IGPMGPOLink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGPMGPOLink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGPMGPOLink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IGPMGPOLink*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IGPMGPOLink*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IGPMGPOLink*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IGPMGPOLink*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_GPOID(this : IGPMGPOLink*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_GPOID.call(this, pVal)
    end
    def get_GPODomain(this : IGPMGPOLink*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_GPODomain.call(this, pVal)
    end
    def get_Enabled(this : IGPMGPOLink*, pVal : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, pVal)
    end
    def put_Enabled(this : IGPMGPOLink*, newVal : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Enabled.call(this, newVal)
    end
    def get_Enforced(this : IGPMGPOLink*, pVal : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enforced.call(this, pVal)
    end
    def put_Enforced(this : IGPMGPOLink*, newVal : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Enforced.call(this, newVal)
    end
    def get_SOMLinkOrder(this : IGPMGPOLink*, lVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SOMLinkOrder.call(this, lVal)
    end
    def get_SOM(this : IGPMGPOLink*, ppIGPMSOM : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SOM.call(this, ppIGPMSOM)
    end
    def delete(this : IGPMGPOLink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end

  end

  @[Extern]
  record IGPMGPOLinksCollectionVtbl,
    query_interface : Proc(IGPMGPOLinksCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGPMGPOLinksCollection*, UInt32),
    release : Proc(IGPMGPOLinksCollection*, UInt32),
    get_type_info_count : Proc(IGPMGPOLinksCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IGPMGPOLinksCollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IGPMGPOLinksCollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IGPMGPOLinksCollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IGPMGPOLinksCollection*, Int32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IGPMGPOLinksCollection*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IGPMGPOLinksCollection*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGPMGPOLinksCollection, lpVtbl : IGPMGPOLinksCollectionVtbl* do
    GUID = LibC::GUID.new(0x189d7b68_u32, 0x16bd_u16, 0x4d0d_u16, StaticArray[0xa2_u8, 0xec_u8, 0x2e_u8, 0x6a_u8, 0xa2_u8, 0x28_u8, 0x8c_u8, 0x7f_u8])
    def query_interface(this : IGPMGPOLinksCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGPMGPOLinksCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGPMGPOLinksCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IGPMGPOLinksCollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IGPMGPOLinksCollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IGPMGPOLinksCollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IGPMGPOLinksCollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : IGPMGPOLinksCollection*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, pVal)
    end
    def get_Item(this : IGPMGPOLinksCollection*, lIndex : Int32, pVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, lIndex, pVal)
    end
    def get__NewEnum(this : IGPMGPOLinksCollection*, ppIGPMLinks : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppIGPMLinks)
    end

  end

  @[Extern]
  record IGPMCSECollectionVtbl,
    query_interface : Proc(IGPMCSECollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGPMCSECollection*, UInt32),
    release : Proc(IGPMCSECollection*, UInt32),
    get_type_info_count : Proc(IGPMCSECollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IGPMCSECollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IGPMCSECollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IGPMCSECollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IGPMCSECollection*, Int32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IGPMCSECollection*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IGPMCSECollection*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGPMCSECollection, lpVtbl : IGPMCSECollectionVtbl* do
    GUID = LibC::GUID.new(0x2e52a97d_u32, 0xa4a_u16, 0x4a6f_u16, StaticArray[0x85_u8, 0xdb_u8, 0x20_u8, 0x16_u8, 0x22_u8, 0x45_u8, 0x5d_u8, 0xa0_u8])
    def query_interface(this : IGPMCSECollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGPMCSECollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGPMCSECollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IGPMCSECollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IGPMCSECollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IGPMCSECollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IGPMCSECollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : IGPMCSECollection*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, pVal)
    end
    def get_Item(this : IGPMCSECollection*, lIndex : Int32, pVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, lIndex, pVal)
    end
    def get__NewEnum(this : IGPMCSECollection*, ppIGPMCSEs : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppIGPMCSEs)
    end

  end

  @[Extern]
  record IGPMClientSideExtensionVtbl,
    query_interface : Proc(IGPMClientSideExtension*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGPMClientSideExtension*, UInt32),
    release : Proc(IGPMClientSideExtension*, UInt32),
    get_type_info_count : Proc(IGPMClientSideExtension*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IGPMClientSideExtension*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IGPMClientSideExtension*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IGPMClientSideExtension*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_ID : Proc(IGPMClientSideExtension*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DisplayName : Proc(IGPMClientSideExtension*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    is_user_enabled : Proc(IGPMClientSideExtension*, Int16*, Win32cr::Foundation::HRESULT),
    is_computer_enabled : Proc(IGPMClientSideExtension*, Int16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGPMClientSideExtension, lpVtbl : IGPMClientSideExtensionVtbl* do
    GUID = LibC::GUID.new(0x69da7488_u32, 0xb8db_u16, 0x415e_u16, StaticArray[0x92_u8, 0x66_u8, 0x90_u8, 0x1b_u8, 0xe4_u8, 0xd4_u8, 0x99_u8, 0x28_u8])
    def query_interface(this : IGPMClientSideExtension*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGPMClientSideExtension*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGPMClientSideExtension*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IGPMClientSideExtension*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IGPMClientSideExtension*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IGPMClientSideExtension*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IGPMClientSideExtension*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_ID(this : IGPMClientSideExtension*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ID.call(this, pVal)
    end
    def get_DisplayName(this : IGPMClientSideExtension*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DisplayName.call(this, pVal)
    end
    def is_user_enabled(this : IGPMClientSideExtension*, pvbEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_user_enabled.call(this, pvbEnabled)
    end
    def is_computer_enabled(this : IGPMClientSideExtension*, pvbEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_computer_enabled.call(this, pvbEnabled)
    end

  end

  @[Extern]
  record IGPMAsyncCancelVtbl,
    query_interface : Proc(IGPMAsyncCancel*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGPMAsyncCancel*, UInt32),
    release : Proc(IGPMAsyncCancel*, UInt32),
    get_type_info_count : Proc(IGPMAsyncCancel*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IGPMAsyncCancel*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IGPMAsyncCancel*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IGPMAsyncCancel*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    cancel : Proc(IGPMAsyncCancel*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGPMAsyncCancel, lpVtbl : IGPMAsyncCancelVtbl* do
    GUID = LibC::GUID.new(0xddc67754_u32, 0xbe67_u16, 0x4541_u16, StaticArray[0x81_u8, 0x66_u8, 0xf4_u8, 0x81_u8, 0x66_u8, 0x86_u8, 0x8c_u8, 0x9c_u8])
    def query_interface(this : IGPMAsyncCancel*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGPMAsyncCancel*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGPMAsyncCancel*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IGPMAsyncCancel*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IGPMAsyncCancel*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IGPMAsyncCancel*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IGPMAsyncCancel*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def cancel(this : IGPMAsyncCancel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel.call(this)
    end

  end

  @[Extern]
  record IGPMAsyncProgressVtbl,
    query_interface : Proc(IGPMAsyncProgress*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGPMAsyncProgress*, UInt32),
    release : Proc(IGPMAsyncProgress*, UInt32),
    get_type_info_count : Proc(IGPMAsyncProgress*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IGPMAsyncProgress*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IGPMAsyncProgress*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IGPMAsyncProgress*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    status : Proc(IGPMAsyncProgress*, Int32, Int32, Win32cr::Foundation::HRESULT, Win32cr::System::Com::VARIANT*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGPMAsyncProgress, lpVtbl : IGPMAsyncProgressVtbl* do
    GUID = LibC::GUID.new(0x6aac29f8_u32, 0x5948_u16, 0x4324_u16, StaticArray[0xbf_u8, 0x70_u8, 0x42_u8, 0x38_u8, 0x18_u8, 0x94_u8, 0x2d_u8, 0xbc_u8])
    def query_interface(this : IGPMAsyncProgress*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGPMAsyncProgress*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGPMAsyncProgress*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IGPMAsyncProgress*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IGPMAsyncProgress*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IGPMAsyncProgress*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IGPMAsyncProgress*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def status(this : IGPMAsyncProgress*, lProgressNumerator : Int32, lProgressDenominator : Int32, hrStatus : Win32cr::Foundation::HRESULT, pResult : Win32cr::System::Com::VARIANT*, ppIGPMStatusMsgCollection : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.status.call(this, lProgressNumerator, lProgressDenominator, hrStatus, pResult, ppIGPMStatusMsgCollection)
    end

  end

  @[Extern]
  record IGPMStatusMsgCollectionVtbl,
    query_interface : Proc(IGPMStatusMsgCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGPMStatusMsgCollection*, UInt32),
    release : Proc(IGPMStatusMsgCollection*, UInt32),
    get_type_info_count : Proc(IGPMStatusMsgCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IGPMStatusMsgCollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IGPMStatusMsgCollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IGPMStatusMsgCollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IGPMStatusMsgCollection*, Int32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IGPMStatusMsgCollection*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IGPMStatusMsgCollection*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGPMStatusMsgCollection, lpVtbl : IGPMStatusMsgCollectionVtbl* do
    GUID = LibC::GUID.new(0x9b6e1af0_u32, 0x1a92_u16, 0x40f3_u16, StaticArray[0xa5_u8, 0x9d_u8, 0xf3_u8, 0x6a_u8, 0xc1_u8, 0xf7_u8, 0x28_u8, 0xb7_u8])
    def query_interface(this : IGPMStatusMsgCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGPMStatusMsgCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGPMStatusMsgCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IGPMStatusMsgCollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IGPMStatusMsgCollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IGPMStatusMsgCollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IGPMStatusMsgCollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : IGPMStatusMsgCollection*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, pVal)
    end
    def get_Item(this : IGPMStatusMsgCollection*, lIndex : Int32, pVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, lIndex, pVal)
    end
    def get__NewEnum(this : IGPMStatusMsgCollection*, pVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, pVal)
    end

  end

  @[Extern]
  record IGPMStatusMessageVtbl,
    query_interface : Proc(IGPMStatusMessage*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGPMStatusMessage*, UInt32),
    release : Proc(IGPMStatusMessage*, UInt32),
    get_type_info_count : Proc(IGPMStatusMessage*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IGPMStatusMessage*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IGPMStatusMessage*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IGPMStatusMessage*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_ObjectPath : Proc(IGPMStatusMessage*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    error_code : Proc(IGPMStatusMessage*, Win32cr::Foundation::HRESULT),
    get_ExtensionName : Proc(IGPMStatusMessage*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_SettingsName : Proc(IGPMStatusMessage*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    operation_code : Proc(IGPMStatusMessage*, Win32cr::Foundation::HRESULT),
    get_Message : Proc(IGPMStatusMessage*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGPMStatusMessage, lpVtbl : IGPMStatusMessageVtbl* do
    GUID = LibC::GUID.new(0x8496c22f_u32, 0xf3de_u16, 0x4a1f_u16, StaticArray[0x8f_u8, 0x58_u8, 0x60_u8, 0x3c_u8, 0xaa_u8, 0xa9_u8, 0x3d_u8, 0x7b_u8])
    def query_interface(this : IGPMStatusMessage*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGPMStatusMessage*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGPMStatusMessage*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IGPMStatusMessage*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IGPMStatusMessage*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IGPMStatusMessage*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IGPMStatusMessage*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_ObjectPath(this : IGPMStatusMessage*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ObjectPath.call(this, pVal)
    end
    def error_code(this : IGPMStatusMessage*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.error_code.call(this)
    end
    def get_ExtensionName(this : IGPMStatusMessage*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExtensionName.call(this, pVal)
    end
    def get_SettingsName(this : IGPMStatusMessage*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SettingsName.call(this, pVal)
    end
    def operation_code(this : IGPMStatusMessage*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.operation_code.call(this)
    end
    def get_Message(this : IGPMStatusMessage*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Message.call(this, pVal)
    end

  end

  @[Extern]
  record IGPMConstantsVtbl,
    query_interface : Proc(IGPMConstants*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGPMConstants*, UInt32),
    release : Proc(IGPMConstants*, UInt32),
    get_type_info_count : Proc(IGPMConstants*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IGPMConstants*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IGPMConstants*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IGPMConstants*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_PermGPOApply : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMPermissionType*, Win32cr::Foundation::HRESULT),
    get_PermGPORead : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMPermissionType*, Win32cr::Foundation::HRESULT),
    get_PermGPOEdit : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMPermissionType*, Win32cr::Foundation::HRESULT),
    get_PermGPOEditSecurityAndDelete : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMPermissionType*, Win32cr::Foundation::HRESULT),
    get_PermGPOCustom : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMPermissionType*, Win32cr::Foundation::HRESULT),
    get_PermWMIFilterEdit : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMPermissionType*, Win32cr::Foundation::HRESULT),
    get_PermWMIFilterFullControl : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMPermissionType*, Win32cr::Foundation::HRESULT),
    get_PermWMIFilterCustom : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMPermissionType*, Win32cr::Foundation::HRESULT),
    get_PermSOMLink : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMPermissionType*, Win32cr::Foundation::HRESULT),
    get_PermSOMLogging : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMPermissionType*, Win32cr::Foundation::HRESULT),
    get_PermSOMPlanning : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMPermissionType*, Win32cr::Foundation::HRESULT),
    get_PermSOMGPOCreate : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMPermissionType*, Win32cr::Foundation::HRESULT),
    get_PermSOMWMICreate : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMPermissionType*, Win32cr::Foundation::HRESULT),
    get_PermSOMWMIFullControl : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMPermissionType*, Win32cr::Foundation::HRESULT),
    get_SearchPropertyGPOPermissions : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMSearchProperty*, Win32cr::Foundation::HRESULT),
    get_SearchPropertyGPOEffectivePermissions : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMSearchProperty*, Win32cr::Foundation::HRESULT),
    get_SearchPropertyGPODisplayName : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMSearchProperty*, Win32cr::Foundation::HRESULT),
    get_SearchPropertyGPOWMIFilter : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMSearchProperty*, Win32cr::Foundation::HRESULT),
    get_SearchPropertyGPOID : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMSearchProperty*, Win32cr::Foundation::HRESULT),
    get_SearchPropertyGPOComputerExtensions : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMSearchProperty*, Win32cr::Foundation::HRESULT),
    get_SearchPropertyGPOUserExtensions : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMSearchProperty*, Win32cr::Foundation::HRESULT),
    get_SearchPropertySOMLinks : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMSearchProperty*, Win32cr::Foundation::HRESULT),
    get_SearchPropertyGPODomain : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMSearchProperty*, Win32cr::Foundation::HRESULT),
    get_SearchPropertyBackupMostRecent : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMSearchProperty*, Win32cr::Foundation::HRESULT),
    get_SearchOpEquals : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMSearchOperation*, Win32cr::Foundation::HRESULT),
    get_SearchOpContains : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMSearchOperation*, Win32cr::Foundation::HRESULT),
    get_SearchOpNotContains : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMSearchOperation*, Win32cr::Foundation::HRESULT),
    get_SearchOpNotEquals : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMSearchOperation*, Win32cr::Foundation::HRESULT),
    get_UsePDC : Proc(IGPMConstants*, Int32*, Win32cr::Foundation::HRESULT),
    get_UseAnyDC : Proc(IGPMConstants*, Int32*, Win32cr::Foundation::HRESULT),
    get_DoNotUseW2KDC : Proc(IGPMConstants*, Int32*, Win32cr::Foundation::HRESULT),
    get_SOMSite : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMSOMType*, Win32cr::Foundation::HRESULT),
    get_SOMDomain : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMSOMType*, Win32cr::Foundation::HRESULT),
    get_SOMOU : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMSOMType*, Win32cr::Foundation::HRESULT),
    get_SecurityFlags : Proc(IGPMConstants*, Int16, Int16, Int16, Int16, Int32*, Win32cr::Foundation::HRESULT),
    get_DoNotValidateDC : Proc(IGPMConstants*, Int32*, Win32cr::Foundation::HRESULT),
    get_ReportHTML : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMReportType*, Win32cr::Foundation::HRESULT),
    get_ReportXML : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMReportType*, Win32cr::Foundation::HRESULT),
    get_RSOPModeUnknown : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMRSOPMode*, Win32cr::Foundation::HRESULT),
    get_RSOPModePlanning : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMRSOPMode*, Win32cr::Foundation::HRESULT),
    get_RSOPModeLogging : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMRSOPMode*, Win32cr::Foundation::HRESULT),
    get_EntryTypeUser : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMEntryType*, Win32cr::Foundation::HRESULT),
    get_EntryTypeComputer : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMEntryType*, Win32cr::Foundation::HRESULT),
    get_EntryTypeLocalGroup : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMEntryType*, Win32cr::Foundation::HRESULT),
    get_EntryTypeGlobalGroup : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMEntryType*, Win32cr::Foundation::HRESULT),
    get_EntryTypeUniversalGroup : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMEntryType*, Win32cr::Foundation::HRESULT),
    get_EntryTypeUNCPath : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMEntryType*, Win32cr::Foundation::HRESULT),
    get_EntryTypeUnknown : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMEntryType*, Win32cr::Foundation::HRESULT),
    get_DestinationOptionSameAsSource : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMDestinationOption*, Win32cr::Foundation::HRESULT),
    get_DestinationOptionNone : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMDestinationOption*, Win32cr::Foundation::HRESULT),
    get_DestinationOptionByRelativeName : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMDestinationOption*, Win32cr::Foundation::HRESULT),
    get_DestinationOptionSet : Proc(IGPMConstants*, Win32cr::System::GroupPolicy::GPMDestinationOption*, Win32cr::Foundation::HRESULT),
    get_MigrationTableOnly : Proc(IGPMConstants*, Int32*, Win32cr::Foundation::HRESULT),
    get_ProcessSecurity : Proc(IGPMConstants*, Int32*, Win32cr::Foundation::HRESULT),
    get_RsopLoggingNoComputer : Proc(IGPMConstants*, Int32*, Win32cr::Foundation::HRESULT),
    get_RsopLoggingNoUser : Proc(IGPMConstants*, Int32*, Win32cr::Foundation::HRESULT),
    get_RsopPlanningAssumeSlowLink : Proc(IGPMConstants*, Int32*, Win32cr::Foundation::HRESULT),
    get_RsopPlanningLoopbackOption : Proc(IGPMConstants*, Int16, Int32*, Win32cr::Foundation::HRESULT),
    get_RsopPlanningAssumeUserWQLFilterTrue : Proc(IGPMConstants*, Int32*, Win32cr::Foundation::HRESULT),
    get_RsopPlanningAssumeCompWQLFilterTrue : Proc(IGPMConstants*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGPMConstants, lpVtbl : IGPMConstantsVtbl* do
    GUID = LibC::GUID.new(0x50ef73e6_u32, 0xd35c_u16, 0x4c8d_u16, StaticArray[0xbe_u8, 0x63_u8, 0x7e_u8, 0xa5_u8, 0xd2_u8, 0xaa_u8, 0xc5_u8, 0xc4_u8])
    def query_interface(this : IGPMConstants*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGPMConstants*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGPMConstants*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IGPMConstants*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IGPMConstants*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IGPMConstants*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IGPMConstants*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_PermGPOApply(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMPermissionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PermGPOApply.call(this, pVal)
    end
    def get_PermGPORead(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMPermissionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PermGPORead.call(this, pVal)
    end
    def get_PermGPOEdit(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMPermissionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PermGPOEdit.call(this, pVal)
    end
    def get_PermGPOEditSecurityAndDelete(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMPermissionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PermGPOEditSecurityAndDelete.call(this, pVal)
    end
    def get_PermGPOCustom(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMPermissionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PermGPOCustom.call(this, pVal)
    end
    def get_PermWMIFilterEdit(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMPermissionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PermWMIFilterEdit.call(this, pVal)
    end
    def get_PermWMIFilterFullControl(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMPermissionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PermWMIFilterFullControl.call(this, pVal)
    end
    def get_PermWMIFilterCustom(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMPermissionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PermWMIFilterCustom.call(this, pVal)
    end
    def get_PermSOMLink(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMPermissionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PermSOMLink.call(this, pVal)
    end
    def get_PermSOMLogging(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMPermissionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PermSOMLogging.call(this, pVal)
    end
    def get_PermSOMPlanning(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMPermissionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PermSOMPlanning.call(this, pVal)
    end
    def get_PermSOMGPOCreate(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMPermissionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PermSOMGPOCreate.call(this, pVal)
    end
    def get_PermSOMWMICreate(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMPermissionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PermSOMWMICreate.call(this, pVal)
    end
    def get_PermSOMWMIFullControl(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMPermissionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PermSOMWMIFullControl.call(this, pVal)
    end
    def get_SearchPropertyGPOPermissions(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMSearchProperty*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SearchPropertyGPOPermissions.call(this, pVal)
    end
    def get_SearchPropertyGPOEffectivePermissions(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMSearchProperty*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SearchPropertyGPOEffectivePermissions.call(this, pVal)
    end
    def get_SearchPropertyGPODisplayName(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMSearchProperty*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SearchPropertyGPODisplayName.call(this, pVal)
    end
    def get_SearchPropertyGPOWMIFilter(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMSearchProperty*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SearchPropertyGPOWMIFilter.call(this, pVal)
    end
    def get_SearchPropertyGPOID(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMSearchProperty*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SearchPropertyGPOID.call(this, pVal)
    end
    def get_SearchPropertyGPOComputerExtensions(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMSearchProperty*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SearchPropertyGPOComputerExtensions.call(this, pVal)
    end
    def get_SearchPropertyGPOUserExtensions(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMSearchProperty*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SearchPropertyGPOUserExtensions.call(this, pVal)
    end
    def get_SearchPropertySOMLinks(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMSearchProperty*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SearchPropertySOMLinks.call(this, pVal)
    end
    def get_SearchPropertyGPODomain(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMSearchProperty*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SearchPropertyGPODomain.call(this, pVal)
    end
    def get_SearchPropertyBackupMostRecent(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMSearchProperty*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SearchPropertyBackupMostRecent.call(this, pVal)
    end
    def get_SearchOpEquals(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMSearchOperation*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SearchOpEquals.call(this, pVal)
    end
    def get_SearchOpContains(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMSearchOperation*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SearchOpContains.call(this, pVal)
    end
    def get_SearchOpNotContains(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMSearchOperation*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SearchOpNotContains.call(this, pVal)
    end
    def get_SearchOpNotEquals(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMSearchOperation*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SearchOpNotEquals.call(this, pVal)
    end
    def get_UsePDC(this : IGPMConstants*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UsePDC.call(this, pVal)
    end
    def get_UseAnyDC(this : IGPMConstants*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UseAnyDC.call(this, pVal)
    end
    def get_DoNotUseW2KDC(this : IGPMConstants*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DoNotUseW2KDC.call(this, pVal)
    end
    def get_SOMSite(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMSOMType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SOMSite.call(this, pVal)
    end
    def get_SOMDomain(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMSOMType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SOMDomain.call(this, pVal)
    end
    def get_SOMOU(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMSOMType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SOMOU.call(this, pVal)
    end
    def get_SecurityFlags(this : IGPMConstants*, vbOwner : Int16, vbGroup : Int16, vbDACL : Int16, vbSACL : Int16, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SecurityFlags.call(this, vbOwner, vbGroup, vbDACL, vbSACL, pVal)
    end
    def get_DoNotValidateDC(this : IGPMConstants*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DoNotValidateDC.call(this, pVal)
    end
    def get_ReportHTML(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMReportType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReportHTML.call(this, pVal)
    end
    def get_ReportXML(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMReportType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReportXML.call(this, pVal)
    end
    def get_RSOPModeUnknown(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMRSOPMode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RSOPModeUnknown.call(this, pVal)
    end
    def get_RSOPModePlanning(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMRSOPMode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RSOPModePlanning.call(this, pVal)
    end
    def get_RSOPModeLogging(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMRSOPMode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RSOPModeLogging.call(this, pVal)
    end
    def get_EntryTypeUser(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMEntryType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EntryTypeUser.call(this, pVal)
    end
    def get_EntryTypeComputer(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMEntryType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EntryTypeComputer.call(this, pVal)
    end
    def get_EntryTypeLocalGroup(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMEntryType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EntryTypeLocalGroup.call(this, pVal)
    end
    def get_EntryTypeGlobalGroup(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMEntryType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EntryTypeGlobalGroup.call(this, pVal)
    end
    def get_EntryTypeUniversalGroup(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMEntryType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EntryTypeUniversalGroup.call(this, pVal)
    end
    def get_EntryTypeUNCPath(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMEntryType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EntryTypeUNCPath.call(this, pVal)
    end
    def get_EntryTypeUnknown(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMEntryType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EntryTypeUnknown.call(this, pVal)
    end
    def get_DestinationOptionSameAsSource(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMDestinationOption*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DestinationOptionSameAsSource.call(this, pVal)
    end
    def get_DestinationOptionNone(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMDestinationOption*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DestinationOptionNone.call(this, pVal)
    end
    def get_DestinationOptionByRelativeName(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMDestinationOption*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DestinationOptionByRelativeName.call(this, pVal)
    end
    def get_DestinationOptionSet(this : IGPMConstants*, pVal : Win32cr::System::GroupPolicy::GPMDestinationOption*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DestinationOptionSet.call(this, pVal)
    end
    def get_MigrationTableOnly(this : IGPMConstants*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MigrationTableOnly.call(this, pVal)
    end
    def get_ProcessSecurity(this : IGPMConstants*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ProcessSecurity.call(this, pVal)
    end
    def get_RsopLoggingNoComputer(this : IGPMConstants*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RsopLoggingNoComputer.call(this, pVal)
    end
    def get_RsopLoggingNoUser(this : IGPMConstants*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RsopLoggingNoUser.call(this, pVal)
    end
    def get_RsopPlanningAssumeSlowLink(this : IGPMConstants*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RsopPlanningAssumeSlowLink.call(this, pVal)
    end
    def get_RsopPlanningLoopbackOption(this : IGPMConstants*, vbMerge : Int16, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RsopPlanningLoopbackOption.call(this, vbMerge, pVal)
    end
    def get_RsopPlanningAssumeUserWQLFilterTrue(this : IGPMConstants*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RsopPlanningAssumeUserWQLFilterTrue.call(this, pVal)
    end
    def get_RsopPlanningAssumeCompWQLFilterTrue(this : IGPMConstants*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RsopPlanningAssumeCompWQLFilterTrue.call(this, pVal)
    end

  end

  @[Extern]
  record IGPMResultVtbl,
    query_interface : Proc(IGPMResult*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGPMResult*, UInt32),
    release : Proc(IGPMResult*, UInt32),
    get_type_info_count : Proc(IGPMResult*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IGPMResult*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IGPMResult*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IGPMResult*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Status : Proc(IGPMResult*, Void**, Win32cr::Foundation::HRESULT),
    get_Result : Proc(IGPMResult*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    overall_status : Proc(IGPMResult*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGPMResult, lpVtbl : IGPMResultVtbl* do
    GUID = LibC::GUID.new(0x86dff7e9_u32, 0xf76f_u16, 0x42ab_u16, StaticArray[0x95_u8, 0x70_u8, 0xce_u8, 0xbc_u8, 0x6b_u8, 0xe8_u8, 0xa5_u8, 0x2d_u8])
    def query_interface(this : IGPMResult*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGPMResult*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGPMResult*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IGPMResult*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IGPMResult*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IGPMResult*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IGPMResult*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Status(this : IGPMResult*, ppIGPMStatusMsgCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Status.call(this, ppIGPMStatusMsgCollection)
    end
    def get_Result(this : IGPMResult*, pvarResult : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Result.call(this, pvarResult)
    end
    def overall_status(this : IGPMResult*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.overall_status.call(this)
    end

  end

  @[Extern]
  record IGPMMapEntryCollectionVtbl,
    query_interface : Proc(IGPMMapEntryCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGPMMapEntryCollection*, UInt32),
    release : Proc(IGPMMapEntryCollection*, UInt32),
    get_type_info_count : Proc(IGPMMapEntryCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IGPMMapEntryCollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IGPMMapEntryCollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IGPMMapEntryCollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IGPMMapEntryCollection*, Int32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IGPMMapEntryCollection*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IGPMMapEntryCollection*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGPMMapEntryCollection, lpVtbl : IGPMMapEntryCollectionVtbl* do
    GUID = LibC::GUID.new(0xbb0bf49b_u32, 0xe53f_u16, 0x443f_u16, StaticArray[0xb8_u8, 0x7_u8, 0x8b_u8, 0xe2_u8, 0x2b_u8, 0xfb_u8, 0x6d_u8, 0x42_u8])
    def query_interface(this : IGPMMapEntryCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGPMMapEntryCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGPMMapEntryCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IGPMMapEntryCollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IGPMMapEntryCollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IGPMMapEntryCollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IGPMMapEntryCollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : IGPMMapEntryCollection*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, pVal)
    end
    def get_Item(this : IGPMMapEntryCollection*, lIndex : Int32, pVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, lIndex, pVal)
    end
    def get__NewEnum(this : IGPMMapEntryCollection*, pVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, pVal)
    end

  end

  @[Extern]
  record IGPMMapEntryVtbl,
    query_interface : Proc(IGPMMapEntry*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGPMMapEntry*, UInt32),
    release : Proc(IGPMMapEntry*, UInt32),
    get_type_info_count : Proc(IGPMMapEntry*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IGPMMapEntry*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IGPMMapEntry*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IGPMMapEntry*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Source : Proc(IGPMMapEntry*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Destination : Proc(IGPMMapEntry*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DestinationOption : Proc(IGPMMapEntry*, Win32cr::System::GroupPolicy::GPMDestinationOption*, Win32cr::Foundation::HRESULT),
    get_EntryType : Proc(IGPMMapEntry*, Win32cr::System::GroupPolicy::GPMEntryType*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGPMMapEntry, lpVtbl : IGPMMapEntryVtbl* do
    GUID = LibC::GUID.new(0x8e79ad06_u32, 0x2381_u16, 0x4444_u16, StaticArray[0xbe_u8, 0x4c_u8, 0xff_u8, 0x69_u8, 0x3e_u8, 0x6e_u8, 0x6f_u8, 0x2b_u8])
    def query_interface(this : IGPMMapEntry*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGPMMapEntry*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGPMMapEntry*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IGPMMapEntry*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IGPMMapEntry*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IGPMMapEntry*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IGPMMapEntry*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Source(this : IGPMMapEntry*, pbstrSource : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Source.call(this, pbstrSource)
    end
    def get_Destination(this : IGPMMapEntry*, pbstrDestination : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Destination.call(this, pbstrDestination)
    end
    def get_DestinationOption(this : IGPMMapEntry*, pgpmDestOption : Win32cr::System::GroupPolicy::GPMDestinationOption*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DestinationOption.call(this, pgpmDestOption)
    end
    def get_EntryType(this : IGPMMapEntry*, pgpmEntryType : Win32cr::System::GroupPolicy::GPMEntryType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EntryType.call(this, pgpmEntryType)
    end

  end

  @[Extern]
  record IGPMMigrationTableVtbl,
    query_interface : Proc(IGPMMigrationTable*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGPMMigrationTable*, UInt32),
    release : Proc(IGPMMigrationTable*, UInt32),
    get_type_info_count : Proc(IGPMMigrationTable*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IGPMMigrationTable*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IGPMMigrationTable*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IGPMMigrationTable*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    save : Proc(IGPMMigrationTable*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    add : Proc(IGPMMigrationTable*, Int32, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_entry : Proc(IGPMMigrationTable*, Win32cr::Foundation::BSTR, Win32cr::System::GroupPolicy::GPMEntryType, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    get_entry : Proc(IGPMMigrationTable*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    delete_entry : Proc(IGPMMigrationTable*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    update_destination : Proc(IGPMMigrationTable*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    validate : Proc(IGPMMigrationTable*, Void**, Win32cr::Foundation::HRESULT),
    get_entries : Proc(IGPMMigrationTable*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGPMMigrationTable, lpVtbl : IGPMMigrationTableVtbl* do
    GUID = LibC::GUID.new(0x48f823b1_u32, 0xefaf_u16, 0x470b_u16, StaticArray[0xb6_u8, 0xed_u8, 0x40_u8, 0xd1_u8, 0x4e_u8, 0xe1_u8, 0xa4_u8, 0xec_u8])
    def query_interface(this : IGPMMigrationTable*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGPMMigrationTable*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGPMMigrationTable*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IGPMMigrationTable*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IGPMMigrationTable*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IGPMMigrationTable*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IGPMMigrationTable*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def save(this : IGPMMigrationTable*, bstrMigrationTablePath : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this, bstrMigrationTablePath)
    end
    def add(this : IGPMMigrationTable*, lFlags : Int32, var : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, lFlags, var)
    end
    def add_entry(this : IGPMMigrationTable*, bstrSource : Win32cr::Foundation::BSTR, gpmEntryType : Win32cr::System::GroupPolicy::GPMEntryType, pvarDestination : Win32cr::System::Com::VARIANT*, ppEntry : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_entry.call(this, bstrSource, gpmEntryType, pvarDestination, ppEntry)
    end
    def get_entry(this : IGPMMigrationTable*, bstrSource : Win32cr::Foundation::BSTR, ppEntry : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_entry.call(this, bstrSource, ppEntry)
    end
    def delete_entry(this : IGPMMigrationTable*, bstrSource : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_entry.call(this, bstrSource)
    end
    def update_destination(this : IGPMMigrationTable*, bstrSource : Win32cr::Foundation::BSTR, pvarDestination : Win32cr::System::Com::VARIANT*, ppEntry : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update_destination.call(this, bstrSource, pvarDestination, ppEntry)
    end
    def validate(this : IGPMMigrationTable*, ppResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.validate.call(this, ppResult)
    end
    def get_entries(this : IGPMMigrationTable*, ppEntries : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_entries.call(this, ppEntries)
    end

  end

  @[Extern]
  record IGPMBackupDirExVtbl,
    query_interface : Proc(IGPMBackupDirEx*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGPMBackupDirEx*, UInt32),
    release : Proc(IGPMBackupDirEx*, UInt32),
    get_type_info_count : Proc(IGPMBackupDirEx*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IGPMBackupDirEx*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IGPMBackupDirEx*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IGPMBackupDirEx*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_BackupDir : Proc(IGPMBackupDirEx*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_BackupType : Proc(IGPMBackupDirEx*, Win32cr::System::GroupPolicy::GPMBackupType*, Win32cr::Foundation::HRESULT),
    get_backup : Proc(IGPMBackupDirEx*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    search_backups : Proc(IGPMBackupDirEx*, Void*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGPMBackupDirEx, lpVtbl : IGPMBackupDirExVtbl* do
    GUID = LibC::GUID.new(0xf8dc55ed_u32, 0x3ba0_u16, 0x4864_u16, StaticArray[0xaa_u8, 0xd4_u8, 0xd3_u8, 0x65_u8, 0x18_u8, 0x9e_u8, 0xe1_u8, 0xd5_u8])
    def query_interface(this : IGPMBackupDirEx*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGPMBackupDirEx*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGPMBackupDirEx*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IGPMBackupDirEx*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IGPMBackupDirEx*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IGPMBackupDirEx*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IGPMBackupDirEx*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_BackupDir(this : IGPMBackupDirEx*, pbstrBackupDir : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BackupDir.call(this, pbstrBackupDir)
    end
    def get_BackupType(this : IGPMBackupDirEx*, pgpmBackupType : Win32cr::System::GroupPolicy::GPMBackupType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BackupType.call(this, pgpmBackupType)
    end
    def get_backup(this : IGPMBackupDirEx*, bstrID : Win32cr::Foundation::BSTR, pvarBackup : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_backup.call(this, bstrID, pvarBackup)
    end
    def search_backups(this : IGPMBackupDirEx*, pIGPMSearchCriteria : Void*, pvarBackupCollection : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.search_backups.call(this, pIGPMSearchCriteria, pvarBackupCollection)
    end

  end

  @[Extern]
  record IGPMStarterGPOBackupCollectionVtbl,
    query_interface : Proc(IGPMStarterGPOBackupCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGPMStarterGPOBackupCollection*, UInt32),
    release : Proc(IGPMStarterGPOBackupCollection*, UInt32),
    get_type_info_count : Proc(IGPMStarterGPOBackupCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IGPMStarterGPOBackupCollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IGPMStarterGPOBackupCollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IGPMStarterGPOBackupCollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IGPMStarterGPOBackupCollection*, Int32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IGPMStarterGPOBackupCollection*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IGPMStarterGPOBackupCollection*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGPMStarterGPOBackupCollection, lpVtbl : IGPMStarterGPOBackupCollectionVtbl* do
    GUID = LibC::GUID.new(0xc998031d_u32, 0xadd0_u16, 0x4bb5_u16, StaticArray[0x8d_u8, 0xea_u8, 0x29_u8, 0x85_u8, 0x5_u8, 0xd8_u8, 0x42_u8, 0x3b_u8])
    def query_interface(this : IGPMStarterGPOBackupCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGPMStarterGPOBackupCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGPMStarterGPOBackupCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IGPMStarterGPOBackupCollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IGPMStarterGPOBackupCollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IGPMStarterGPOBackupCollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IGPMStarterGPOBackupCollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : IGPMStarterGPOBackupCollection*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, pVal)
    end
    def get_Item(this : IGPMStarterGPOBackupCollection*, lIndex : Int32, pVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, lIndex, pVal)
    end
    def get__NewEnum(this : IGPMStarterGPOBackupCollection*, ppIGPMTmplBackup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppIGPMTmplBackup)
    end

  end

  @[Extern]
  record IGPMStarterGPOBackupVtbl,
    query_interface : Proc(IGPMStarterGPOBackup*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGPMStarterGPOBackup*, UInt32),
    release : Proc(IGPMStarterGPOBackup*, UInt32),
    get_type_info_count : Proc(IGPMStarterGPOBackup*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IGPMStarterGPOBackup*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IGPMStarterGPOBackup*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IGPMStarterGPOBackup*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_BackupDir : Proc(IGPMStarterGPOBackup*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Comment : Proc(IGPMStarterGPOBackup*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DisplayName : Proc(IGPMStarterGPOBackup*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Domain : Proc(IGPMStarterGPOBackup*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_StarterGPOID : Proc(IGPMStarterGPOBackup*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ID : Proc(IGPMStarterGPOBackup*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Timestamp : Proc(IGPMStarterGPOBackup*, Float64*, Win32cr::Foundation::HRESULT),
    get_Type : Proc(IGPMStarterGPOBackup*, Win32cr::System::GroupPolicy::GPMStarterGPOType*, Win32cr::Foundation::HRESULT),
    delete : Proc(IGPMStarterGPOBackup*, Win32cr::Foundation::HRESULT),
    generate_report : Proc(IGPMStarterGPOBackup*, Win32cr::System::GroupPolicy::GPMReportType, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    generate_report_to_file : Proc(IGPMStarterGPOBackup*, Win32cr::System::GroupPolicy::GPMReportType, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGPMStarterGPOBackup, lpVtbl : IGPMStarterGPOBackupVtbl* do
    GUID = LibC::GUID.new(0x51d98eda_u32, 0xa87e_u16, 0x43dd_u16, StaticArray[0xb8_u8, 0xa_u8, 0xb_u8, 0x66_u8, 0xef_u8, 0x19_u8, 0x38_u8, 0xd6_u8])
    def query_interface(this : IGPMStarterGPOBackup*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGPMStarterGPOBackup*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGPMStarterGPOBackup*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IGPMStarterGPOBackup*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IGPMStarterGPOBackup*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IGPMStarterGPOBackup*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IGPMStarterGPOBackup*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_BackupDir(this : IGPMStarterGPOBackup*, pbstrBackupDir : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BackupDir.call(this, pbstrBackupDir)
    end
    def get_Comment(this : IGPMStarterGPOBackup*, pbstrComment : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Comment.call(this, pbstrComment)
    end
    def get_DisplayName(this : IGPMStarterGPOBackup*, pbstrDisplayName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DisplayName.call(this, pbstrDisplayName)
    end
    def get_Domain(this : IGPMStarterGPOBackup*, pbstrTemplateDomain : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Domain.call(this, pbstrTemplateDomain)
    end
    def get_StarterGPOID(this : IGPMStarterGPOBackup*, pbstrTemplateID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StarterGPOID.call(this, pbstrTemplateID)
    end
    def get_ID(this : IGPMStarterGPOBackup*, pbstrID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ID.call(this, pbstrID)
    end
    def get_Timestamp(this : IGPMStarterGPOBackup*, pTimestamp : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Timestamp.call(this, pTimestamp)
    end
    def get_Type(this : IGPMStarterGPOBackup*, pType : Win32cr::System::GroupPolicy::GPMStarterGPOType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, pType)
    end
    def delete(this : IGPMStarterGPOBackup*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def generate_report(this : IGPMStarterGPOBackup*, gpmReportType : Win32cr::System::GroupPolicy::GPMReportType, pvarGPMProgress : Win32cr::System::Com::VARIANT*, pvarGPMCancel : Win32cr::System::Com::VARIANT*, ppIGPMResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.generate_report.call(this, gpmReportType, pvarGPMProgress, pvarGPMCancel, ppIGPMResult)
    end
    def generate_report_to_file(this : IGPMStarterGPOBackup*, gpmReportType : Win32cr::System::GroupPolicy::GPMReportType, bstrTargetFilePath : Win32cr::Foundation::BSTR, ppIGPMResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.generate_report_to_file.call(this, gpmReportType, bstrTargetFilePath, ppIGPMResult)
    end

  end

  @[Extern]
  record IGPM2Vtbl,
    query_interface : Proc(IGPM2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGPM2*, UInt32),
    release : Proc(IGPM2*, UInt32),
    get_type_info_count : Proc(IGPM2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IGPM2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IGPM2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IGPM2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_domain : Proc(IGPM2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_backup_dir : Proc(IGPM2*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_sites_container : Proc(IGPM2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_rsop : Proc(IGPM2*, Win32cr::System::GroupPolicy::GPMRSOPMode, Win32cr::Foundation::BSTR, Int32, Void**, Win32cr::Foundation::HRESULT),
    create_permission : Proc(IGPM2*, Win32cr::Foundation::BSTR, Win32cr::System::GroupPolicy::GPMPermissionType, Int16, Void**, Win32cr::Foundation::HRESULT),
    create_search_criteria : Proc(IGPM2*, Void**, Win32cr::Foundation::HRESULT),
    create_trustee : Proc(IGPM2*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_client_side_extensions : Proc(IGPM2*, Void**, Win32cr::Foundation::HRESULT),
    get_constants : Proc(IGPM2*, Void**, Win32cr::Foundation::HRESULT),
    get_migration_table : Proc(IGPM2*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    create_migration_table : Proc(IGPM2*, Void**, Win32cr::Foundation::HRESULT),
    initialize_reporting : Proc(IGPM2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_backup_dir_ex : Proc(IGPM2*, Win32cr::Foundation::BSTR, Win32cr::System::GroupPolicy::GPMBackupType, Void**, Win32cr::Foundation::HRESULT),
    initialize_reporting_ex : Proc(IGPM2*, Win32cr::Foundation::BSTR, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGPM2, lpVtbl : IGPM2Vtbl* do
    GUID = LibC::GUID.new(0x238f8a_u32, 0x3d86_u16, 0x41ac_u16, StaticArray[0x8f_u8, 0x5e_u8, 0x6_u8, 0xa6_u8, 0x63_u8, 0x8a_u8, 0x63_u8, 0x4a_u8])
    def query_interface(this : IGPM2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGPM2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGPM2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IGPM2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IGPM2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IGPM2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IGPM2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_domain(this : IGPM2*, bstrDomain : Win32cr::Foundation::BSTR, bstrDomainController : Win32cr::Foundation::BSTR, lDCFlags : Int32, pIGPMDomain : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_domain.call(this, bstrDomain, bstrDomainController, lDCFlags, pIGPMDomain)
    end
    def get_backup_dir(this : IGPM2*, bstrBackupDir : Win32cr::Foundation::BSTR, pIGPMBackupDir : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_backup_dir.call(this, bstrBackupDir, pIGPMBackupDir)
    end
    def get_sites_container(this : IGPM2*, bstrForest : Win32cr::Foundation::BSTR, bstrDomain : Win32cr::Foundation::BSTR, bstrDomainController : Win32cr::Foundation::BSTR, lDCFlags : Int32, ppIGPMSitesContainer : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sites_container.call(this, bstrForest, bstrDomain, bstrDomainController, lDCFlags, ppIGPMSitesContainer)
    end
    def get_rsop(this : IGPM2*, gpmRSoPMode : Win32cr::System::GroupPolicy::GPMRSOPMode, bstrNamespace : Win32cr::Foundation::BSTR, lFlags : Int32, ppIGPMRSOP : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rsop.call(this, gpmRSoPMode, bstrNamespace, lFlags, ppIGPMRSOP)
    end
    def create_permission(this : IGPM2*, bstrTrustee : Win32cr::Foundation::BSTR, perm : Win32cr::System::GroupPolicy::GPMPermissionType, bInheritable : Int16, ppPerm : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_permission.call(this, bstrTrustee, perm, bInheritable, ppPerm)
    end
    def create_search_criteria(this : IGPM2*, ppIGPMSearchCriteria : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_search_criteria.call(this, ppIGPMSearchCriteria)
    end
    def create_trustee(this : IGPM2*, bstrTrustee : Win32cr::Foundation::BSTR, ppIGPMTrustee : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_trustee.call(this, bstrTrustee, ppIGPMTrustee)
    end
    def get_client_side_extensions(this : IGPM2*, ppIGPMCSECollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_client_side_extensions.call(this, ppIGPMCSECollection)
    end
    def get_constants(this : IGPM2*, ppIGPMConstants : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_constants.call(this, ppIGPMConstants)
    end
    def get_migration_table(this : IGPM2*, bstrMigrationTablePath : Win32cr::Foundation::BSTR, ppMigrationTable : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_migration_table.call(this, bstrMigrationTablePath, ppMigrationTable)
    end
    def create_migration_table(this : IGPM2*, ppMigrationTable : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_migration_table.call(this, ppMigrationTable)
    end
    def initialize_reporting(this : IGPM2*, bstrAdmPath : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_reporting.call(this, bstrAdmPath)
    end
    def get_backup_dir_ex(this : IGPM2*, bstrBackupDir : Win32cr::Foundation::BSTR, backupDirType : Win32cr::System::GroupPolicy::GPMBackupType, ppIGPMBackupDirEx : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_backup_dir_ex.call(this, bstrBackupDir, backupDirType, ppIGPMBackupDirEx)
    end
    def initialize_reporting_ex(this : IGPM2*, bstrAdmPath : Win32cr::Foundation::BSTR, reportingOptions : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_reporting_ex.call(this, bstrAdmPath, reportingOptions)
    end

  end

  @[Extern]
  record IGPMStarterGPOVtbl,
    query_interface : Proc(IGPMStarterGPO*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGPMStarterGPO*, UInt32),
    release : Proc(IGPMStarterGPO*, UInt32),
    get_type_info_count : Proc(IGPMStarterGPO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IGPMStarterGPO*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IGPMStarterGPO*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IGPMStarterGPO*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_DisplayName : Proc(IGPMStarterGPO*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_DisplayName : Proc(IGPMStarterGPO*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IGPMStarterGPO*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IGPMStarterGPO*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Author : Proc(IGPMStarterGPO*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Product : Proc(IGPMStarterGPO*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CreationTime : Proc(IGPMStarterGPO*, Float64*, Win32cr::Foundation::HRESULT),
    get_ID : Proc(IGPMStarterGPO*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ModifiedTime : Proc(IGPMStarterGPO*, Float64*, Win32cr::Foundation::HRESULT),
    get_Type : Proc(IGPMStarterGPO*, Win32cr::System::GroupPolicy::GPMStarterGPOType*, Win32cr::Foundation::HRESULT),
    get_ComputerVersion : Proc(IGPMStarterGPO*, UInt16*, Win32cr::Foundation::HRESULT),
    get_UserVersion : Proc(IGPMStarterGPO*, UInt16*, Win32cr::Foundation::HRESULT),
    get_StarterGPOVersion : Proc(IGPMStarterGPO*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    delete : Proc(IGPMStarterGPO*, Win32cr::Foundation::HRESULT),
    save : Proc(IGPMStarterGPO*, Win32cr::Foundation::BSTR, Int16, Int16, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    backup : Proc(IGPMStarterGPO*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    copy_to : Proc(IGPMStarterGPO*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    generate_report : Proc(IGPMStarterGPO*, Win32cr::System::GroupPolicy::GPMReportType, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    generate_report_to_file : Proc(IGPMStarterGPO*, Win32cr::System::GroupPolicy::GPMReportType, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_security_info : Proc(IGPMStarterGPO*, Void**, Win32cr::Foundation::HRESULT),
    set_security_info : Proc(IGPMStarterGPO*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGPMStarterGPO, lpVtbl : IGPMStarterGPOVtbl* do
    GUID = LibC::GUID.new(0xdfc3f61b_u32, 0x8880_u16, 0x4490_u16, StaticArray[0x93_u8, 0x37_u8, 0xd2_u8, 0x9c_u8, 0x7b_u8, 0xa8_u8, 0xc2_u8, 0xf0_u8])
    def query_interface(this : IGPMStarterGPO*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGPMStarterGPO*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGPMStarterGPO*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IGPMStarterGPO*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IGPMStarterGPO*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IGPMStarterGPO*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IGPMStarterGPO*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_DisplayName(this : IGPMStarterGPO*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DisplayName.call(this, pVal)
    end
    def put_DisplayName(this : IGPMStarterGPO*, newVal : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DisplayName.call(this, newVal)
    end
    def get_Description(this : IGPMStarterGPO*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, pVal)
    end
    def put_Description(this : IGPMStarterGPO*, newVal : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, newVal)
    end
    def get_Author(this : IGPMStarterGPO*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Author.call(this, pVal)
    end
    def get_Product(this : IGPMStarterGPO*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Product.call(this, pVal)
    end
    def get_CreationTime(this : IGPMStarterGPO*, pVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CreationTime.call(this, pVal)
    end
    def get_ID(this : IGPMStarterGPO*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ID.call(this, pVal)
    end
    def get_ModifiedTime(this : IGPMStarterGPO*, pVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ModifiedTime.call(this, pVal)
    end
    def get_Type(this : IGPMStarterGPO*, pVal : Win32cr::System::GroupPolicy::GPMStarterGPOType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, pVal)
    end
    def get_ComputerVersion(this : IGPMStarterGPO*, pVal : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ComputerVersion.call(this, pVal)
    end
    def get_UserVersion(this : IGPMStarterGPO*, pVal : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserVersion.call(this, pVal)
    end
    def get_StarterGPOVersion(this : IGPMStarterGPO*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StarterGPOVersion.call(this, pVal)
    end
    def delete(this : IGPMStarterGPO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def save(this : IGPMStarterGPO*, bstrSaveFile : Win32cr::Foundation::BSTR, bOverwrite : Int16, bSaveAsSystem : Int16, bstrLanguage : Win32cr::System::Com::VARIANT*, bstrAuthor : Win32cr::System::Com::VARIANT*, bstrProduct : Win32cr::System::Com::VARIANT*, bstrUniqueID : Win32cr::System::Com::VARIANT*, bstrVersion : Win32cr::System::Com::VARIANT*, pvarGPMProgress : Win32cr::System::Com::VARIANT*, pvarGPMCancel : Win32cr::System::Com::VARIANT*, ppIGPMResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this, bstrSaveFile, bOverwrite, bSaveAsSystem, bstrLanguage, bstrAuthor, bstrProduct, bstrUniqueID, bstrVersion, pvarGPMProgress, pvarGPMCancel, ppIGPMResult)
    end
    def backup(this : IGPMStarterGPO*, bstrBackupDir : Win32cr::Foundation::BSTR, bstrComment : Win32cr::Foundation::BSTR, pvarGPMProgress : Win32cr::System::Com::VARIANT*, pvarGPMCancel : Win32cr::System::Com::VARIANT*, ppIGPMResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.backup.call(this, bstrBackupDir, bstrComment, pvarGPMProgress, pvarGPMCancel, ppIGPMResult)
    end
    def copy_to(this : IGPMStarterGPO*, pvarNewDisplayName : Win32cr::System::Com::VARIANT*, pvarGPMProgress : Win32cr::System::Com::VARIANT*, pvarGPMCancel : Win32cr::System::Com::VARIANT*, ppIGPMResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_to.call(this, pvarNewDisplayName, pvarGPMProgress, pvarGPMCancel, ppIGPMResult)
    end
    def generate_report(this : IGPMStarterGPO*, gpmReportType : Win32cr::System::GroupPolicy::GPMReportType, pvarGPMProgress : Win32cr::System::Com::VARIANT*, pvarGPMCancel : Win32cr::System::Com::VARIANT*, ppIGPMResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.generate_report.call(this, gpmReportType, pvarGPMProgress, pvarGPMCancel, ppIGPMResult)
    end
    def generate_report_to_file(this : IGPMStarterGPO*, gpmReportType : Win32cr::System::GroupPolicy::GPMReportType, bstrTargetFilePath : Win32cr::Foundation::BSTR, ppIGPMResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.generate_report_to_file.call(this, gpmReportType, bstrTargetFilePath, ppIGPMResult)
    end
    def get_security_info(this : IGPMStarterGPO*, ppSecurityInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_security_info.call(this, ppSecurityInfo)
    end
    def set_security_info(this : IGPMStarterGPO*, pSecurityInfo : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_security_info.call(this, pSecurityInfo)
    end

  end

  @[Extern]
  record IGPMStarterGPOCollectionVtbl,
    query_interface : Proc(IGPMStarterGPOCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGPMStarterGPOCollection*, UInt32),
    release : Proc(IGPMStarterGPOCollection*, UInt32),
    get_type_info_count : Proc(IGPMStarterGPOCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IGPMStarterGPOCollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IGPMStarterGPOCollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IGPMStarterGPOCollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IGPMStarterGPOCollection*, Int32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IGPMStarterGPOCollection*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IGPMStarterGPOCollection*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGPMStarterGPOCollection, lpVtbl : IGPMStarterGPOCollectionVtbl* do
    GUID = LibC::GUID.new(0x2e522729_u32, 0x2219_u16, 0x44ad_u16, StaticArray[0x93_u8, 0x3a_u8, 0x64_u8, 0xdf_u8, 0xd6_u8, 0x50_u8, 0xc4_u8, 0x23_u8])
    def query_interface(this : IGPMStarterGPOCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGPMStarterGPOCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGPMStarterGPOCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IGPMStarterGPOCollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IGPMStarterGPOCollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IGPMStarterGPOCollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IGPMStarterGPOCollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : IGPMStarterGPOCollection*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, pVal)
    end
    def get_Item(this : IGPMStarterGPOCollection*, lIndex : Int32, pVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, lIndex, pVal)
    end
    def get__NewEnum(this : IGPMStarterGPOCollection*, ppIGPMTemplates : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppIGPMTemplates)
    end

  end

  @[Extern]
  record IGPMDomain2Vtbl,
    query_interface : Proc(IGPMDomain2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGPMDomain2*, UInt32),
    release : Proc(IGPMDomain2*, UInt32),
    get_type_info_count : Proc(IGPMDomain2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IGPMDomain2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IGPMDomain2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IGPMDomain2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_DomainController : Proc(IGPMDomain2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Domain : Proc(IGPMDomain2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    create_gpo : Proc(IGPMDomain2*, Void**, Win32cr::Foundation::HRESULT),
    get_gpo : Proc(IGPMDomain2*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    search_gp_os : Proc(IGPMDomain2*, Void*, Void**, Win32cr::Foundation::HRESULT),
    restore_gpo : Proc(IGPMDomain2*, Void*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    get_som : Proc(IGPMDomain2*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    search_so_ms : Proc(IGPMDomain2*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_wmi_filter : Proc(IGPMDomain2*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    search_wmi_filters : Proc(IGPMDomain2*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_starter_gpo : Proc(IGPMDomain2*, Void**, Win32cr::Foundation::HRESULT),
    create_gpo_from_starter_gpo : Proc(IGPMDomain2*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_starter_gpo : Proc(IGPMDomain2*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    search_starter_gp_os : Proc(IGPMDomain2*, Void*, Void**, Win32cr::Foundation::HRESULT),
    load_starter_gpo : Proc(IGPMDomain2*, Win32cr::Foundation::BSTR, Int16, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    restore_starter_gpo : Proc(IGPMDomain2*, Void*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGPMDomain2, lpVtbl : IGPMDomain2Vtbl* do
    GUID = LibC::GUID.new(0x7ca6bb8b_u32, 0xf1eb_u16, 0x490a_u16, StaticArray[0x93_u8, 0x8d_u8, 0x3c_u8, 0x4e_u8, 0x51_u8, 0xc7_u8, 0x68_u8, 0xe6_u8])
    def query_interface(this : IGPMDomain2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGPMDomain2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGPMDomain2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IGPMDomain2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IGPMDomain2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IGPMDomain2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IGPMDomain2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_DomainController(this : IGPMDomain2*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DomainController.call(this, pVal)
    end
    def get_Domain(this : IGPMDomain2*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Domain.call(this, pVal)
    end
    def create_gpo(this : IGPMDomain2*, ppNewGPO : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_gpo.call(this, ppNewGPO)
    end
    def get_gpo(this : IGPMDomain2*, bstrGuid : Win32cr::Foundation::BSTR, ppGPO : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_gpo.call(this, bstrGuid, ppGPO)
    end
    def search_gp_os(this : IGPMDomain2*, pIGPMSearchCriteria : Void*, ppIGPMGPOCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.search_gp_os.call(this, pIGPMSearchCriteria, ppIGPMGPOCollection)
    end
    def restore_gpo(this : IGPMDomain2*, pIGPMBackup : Void*, lDCFlags : Int32, pvarGPMProgress : Win32cr::System::Com::VARIANT*, pvarGPMCancel : Win32cr::System::Com::VARIANT*, ppIGPMResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.restore_gpo.call(this, pIGPMBackup, lDCFlags, pvarGPMProgress, pvarGPMCancel, ppIGPMResult)
    end
    def get_som(this : IGPMDomain2*, bstrPath : Win32cr::Foundation::BSTR, ppSOM : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_som.call(this, bstrPath, ppSOM)
    end
    def search_so_ms(this : IGPMDomain2*, pIGPMSearchCriteria : Void*, ppIGPMSOMCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.search_so_ms.call(this, pIGPMSearchCriteria, ppIGPMSOMCollection)
    end
    def get_wmi_filter(this : IGPMDomain2*, bstrPath : Win32cr::Foundation::BSTR, ppWMIFilter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_wmi_filter.call(this, bstrPath, ppWMIFilter)
    end
    def search_wmi_filters(this : IGPMDomain2*, pIGPMSearchCriteria : Void*, ppIGPMWMIFilterCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.search_wmi_filters.call(this, pIGPMSearchCriteria, ppIGPMWMIFilterCollection)
    end
    def create_starter_gpo(this : IGPMDomain2*, ppnewTemplate : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_starter_gpo.call(this, ppnewTemplate)
    end
    def create_gpo_from_starter_gpo(this : IGPMDomain2*, pGPOTemplate : Void*, ppnewGPO : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_gpo_from_starter_gpo.call(this, pGPOTemplate, ppnewGPO)
    end
    def get_starter_gpo(this : IGPMDomain2*, bstrGuid : Win32cr::Foundation::BSTR, ppTemplate : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_starter_gpo.call(this, bstrGuid, ppTemplate)
    end
    def search_starter_gp_os(this : IGPMDomain2*, pIGPMSearchCriteria : Void*, ppIGPMTemplateCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.search_starter_gp_os.call(this, pIGPMSearchCriteria, ppIGPMTemplateCollection)
    end
    def load_starter_gpo(this : IGPMDomain2*, bstrLoadFile : Win32cr::Foundation::BSTR, bOverwrite : Int16, pvarGPMProgress : Win32cr::System::Com::VARIANT*, pvarGPMCancel : Win32cr::System::Com::VARIANT*, ppIGPMResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_starter_gpo.call(this, bstrLoadFile, bOverwrite, pvarGPMProgress, pvarGPMCancel, ppIGPMResult)
    end
    def restore_starter_gpo(this : IGPMDomain2*, pIGPMTmplBackup : Void*, pvarGPMProgress : Win32cr::System::Com::VARIANT*, pvarGPMCancel : Win32cr::System::Com::VARIANT*, ppIGPMResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.restore_starter_gpo.call(this, pIGPMTmplBackup, pvarGPMProgress, pvarGPMCancel, ppIGPMResult)
    end

  end

  @[Extern]
  record IGPMConstants2Vtbl,
    query_interface : Proc(IGPMConstants2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGPMConstants2*, UInt32),
    release : Proc(IGPMConstants2*, UInt32),
    get_type_info_count : Proc(IGPMConstants2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IGPMConstants2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IGPMConstants2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IGPMConstants2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_PermGPOApply : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMPermissionType*, Win32cr::Foundation::HRESULT),
    get_PermGPORead : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMPermissionType*, Win32cr::Foundation::HRESULT),
    get_PermGPOEdit : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMPermissionType*, Win32cr::Foundation::HRESULT),
    get_PermGPOEditSecurityAndDelete : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMPermissionType*, Win32cr::Foundation::HRESULT),
    get_PermGPOCustom : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMPermissionType*, Win32cr::Foundation::HRESULT),
    get_PermWMIFilterEdit : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMPermissionType*, Win32cr::Foundation::HRESULT),
    get_PermWMIFilterFullControl : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMPermissionType*, Win32cr::Foundation::HRESULT),
    get_PermWMIFilterCustom : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMPermissionType*, Win32cr::Foundation::HRESULT),
    get_PermSOMLink : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMPermissionType*, Win32cr::Foundation::HRESULT),
    get_PermSOMLogging : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMPermissionType*, Win32cr::Foundation::HRESULT),
    get_PermSOMPlanning : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMPermissionType*, Win32cr::Foundation::HRESULT),
    get_PermSOMGPOCreate : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMPermissionType*, Win32cr::Foundation::HRESULT),
    get_PermSOMWMICreate : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMPermissionType*, Win32cr::Foundation::HRESULT),
    get_PermSOMWMIFullControl : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMPermissionType*, Win32cr::Foundation::HRESULT),
    get_SearchPropertyGPOPermissions : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMSearchProperty*, Win32cr::Foundation::HRESULT),
    get_SearchPropertyGPOEffectivePermissions : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMSearchProperty*, Win32cr::Foundation::HRESULT),
    get_SearchPropertyGPODisplayName : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMSearchProperty*, Win32cr::Foundation::HRESULT),
    get_SearchPropertyGPOWMIFilter : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMSearchProperty*, Win32cr::Foundation::HRESULT),
    get_SearchPropertyGPOID : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMSearchProperty*, Win32cr::Foundation::HRESULT),
    get_SearchPropertyGPOComputerExtensions : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMSearchProperty*, Win32cr::Foundation::HRESULT),
    get_SearchPropertyGPOUserExtensions : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMSearchProperty*, Win32cr::Foundation::HRESULT),
    get_SearchPropertySOMLinks : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMSearchProperty*, Win32cr::Foundation::HRESULT),
    get_SearchPropertyGPODomain : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMSearchProperty*, Win32cr::Foundation::HRESULT),
    get_SearchPropertyBackupMostRecent : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMSearchProperty*, Win32cr::Foundation::HRESULT),
    get_SearchOpEquals : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMSearchOperation*, Win32cr::Foundation::HRESULT),
    get_SearchOpContains : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMSearchOperation*, Win32cr::Foundation::HRESULT),
    get_SearchOpNotContains : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMSearchOperation*, Win32cr::Foundation::HRESULT),
    get_SearchOpNotEquals : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMSearchOperation*, Win32cr::Foundation::HRESULT),
    get_UsePDC : Proc(IGPMConstants2*, Int32*, Win32cr::Foundation::HRESULT),
    get_UseAnyDC : Proc(IGPMConstants2*, Int32*, Win32cr::Foundation::HRESULT),
    get_DoNotUseW2KDC : Proc(IGPMConstants2*, Int32*, Win32cr::Foundation::HRESULT),
    get_SOMSite : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMSOMType*, Win32cr::Foundation::HRESULT),
    get_SOMDomain : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMSOMType*, Win32cr::Foundation::HRESULT),
    get_SOMOU : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMSOMType*, Win32cr::Foundation::HRESULT),
    get_SecurityFlags : Proc(IGPMConstants2*, Int16, Int16, Int16, Int16, Int32*, Win32cr::Foundation::HRESULT),
    get_DoNotValidateDC : Proc(IGPMConstants2*, Int32*, Win32cr::Foundation::HRESULT),
    get_ReportHTML : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMReportType*, Win32cr::Foundation::HRESULT),
    get_ReportXML : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMReportType*, Win32cr::Foundation::HRESULT),
    get_RSOPModeUnknown : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMRSOPMode*, Win32cr::Foundation::HRESULT),
    get_RSOPModePlanning : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMRSOPMode*, Win32cr::Foundation::HRESULT),
    get_RSOPModeLogging : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMRSOPMode*, Win32cr::Foundation::HRESULT),
    get_EntryTypeUser : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMEntryType*, Win32cr::Foundation::HRESULT),
    get_EntryTypeComputer : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMEntryType*, Win32cr::Foundation::HRESULT),
    get_EntryTypeLocalGroup : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMEntryType*, Win32cr::Foundation::HRESULT),
    get_EntryTypeGlobalGroup : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMEntryType*, Win32cr::Foundation::HRESULT),
    get_EntryTypeUniversalGroup : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMEntryType*, Win32cr::Foundation::HRESULT),
    get_EntryTypeUNCPath : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMEntryType*, Win32cr::Foundation::HRESULT),
    get_EntryTypeUnknown : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMEntryType*, Win32cr::Foundation::HRESULT),
    get_DestinationOptionSameAsSource : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMDestinationOption*, Win32cr::Foundation::HRESULT),
    get_DestinationOptionNone : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMDestinationOption*, Win32cr::Foundation::HRESULT),
    get_DestinationOptionByRelativeName : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMDestinationOption*, Win32cr::Foundation::HRESULT),
    get_DestinationOptionSet : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMDestinationOption*, Win32cr::Foundation::HRESULT),
    get_MigrationTableOnly : Proc(IGPMConstants2*, Int32*, Win32cr::Foundation::HRESULT),
    get_ProcessSecurity : Proc(IGPMConstants2*, Int32*, Win32cr::Foundation::HRESULT),
    get_RsopLoggingNoComputer : Proc(IGPMConstants2*, Int32*, Win32cr::Foundation::HRESULT),
    get_RsopLoggingNoUser : Proc(IGPMConstants2*, Int32*, Win32cr::Foundation::HRESULT),
    get_RsopPlanningAssumeSlowLink : Proc(IGPMConstants2*, Int32*, Win32cr::Foundation::HRESULT),
    get_RsopPlanningLoopbackOption : Proc(IGPMConstants2*, Int16, Int32*, Win32cr::Foundation::HRESULT),
    get_RsopPlanningAssumeUserWQLFilterTrue : Proc(IGPMConstants2*, Int32*, Win32cr::Foundation::HRESULT),
    get_RsopPlanningAssumeCompWQLFilterTrue : Proc(IGPMConstants2*, Int32*, Win32cr::Foundation::HRESULT),
    get_BackupTypeGPO : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMBackupType*, Win32cr::Foundation::HRESULT),
    get_BackupTypeStarterGPO : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMBackupType*, Win32cr::Foundation::HRESULT),
    get_StarterGPOTypeSystem : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMStarterGPOType*, Win32cr::Foundation::HRESULT),
    get_StarterGPOTypeCustom : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMStarterGPOType*, Win32cr::Foundation::HRESULT),
    get_SearchPropertyStarterGPOPermissions : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMSearchProperty*, Win32cr::Foundation::HRESULT),
    get_SearchPropertyStarterGPOEffectivePermissions : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMSearchProperty*, Win32cr::Foundation::HRESULT),
    get_SearchPropertyStarterGPODisplayName : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMSearchProperty*, Win32cr::Foundation::HRESULT),
    get_SearchPropertyStarterGPOID : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMSearchProperty*, Win32cr::Foundation::HRESULT),
    get_SearchPropertyStarterGPODomain : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMSearchProperty*, Win32cr::Foundation::HRESULT),
    get_PermStarterGPORead : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMPermissionType*, Win32cr::Foundation::HRESULT),
    get_PermStarterGPOEdit : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMPermissionType*, Win32cr::Foundation::HRESULT),
    get_PermStarterGPOFullControl : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMPermissionType*, Win32cr::Foundation::HRESULT),
    get_PermStarterGPOCustom : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMPermissionType*, Win32cr::Foundation::HRESULT),
    get_ReportLegacy : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMReportingOptions*, Win32cr::Foundation::HRESULT),
    get_ReportComments : Proc(IGPMConstants2*, Win32cr::System::GroupPolicy::GPMReportingOptions*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGPMConstants2, lpVtbl : IGPMConstants2Vtbl* do
    GUID = LibC::GUID.new(0x5ae21b0_u32, 0xac09_u16, 0x4032_u16, StaticArray[0xa2_u8, 0x6f_u8, 0x9e_u8, 0x7d_u8, 0xa7_u8, 0x86_u8, 0xdc_u8, 0x19_u8])
    def query_interface(this : IGPMConstants2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGPMConstants2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGPMConstants2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IGPMConstants2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IGPMConstants2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IGPMConstants2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IGPMConstants2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_PermGPOApply(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMPermissionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PermGPOApply.call(this, pVal)
    end
    def get_PermGPORead(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMPermissionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PermGPORead.call(this, pVal)
    end
    def get_PermGPOEdit(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMPermissionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PermGPOEdit.call(this, pVal)
    end
    def get_PermGPOEditSecurityAndDelete(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMPermissionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PermGPOEditSecurityAndDelete.call(this, pVal)
    end
    def get_PermGPOCustom(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMPermissionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PermGPOCustom.call(this, pVal)
    end
    def get_PermWMIFilterEdit(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMPermissionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PermWMIFilterEdit.call(this, pVal)
    end
    def get_PermWMIFilterFullControl(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMPermissionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PermWMIFilterFullControl.call(this, pVal)
    end
    def get_PermWMIFilterCustom(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMPermissionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PermWMIFilterCustom.call(this, pVal)
    end
    def get_PermSOMLink(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMPermissionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PermSOMLink.call(this, pVal)
    end
    def get_PermSOMLogging(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMPermissionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PermSOMLogging.call(this, pVal)
    end
    def get_PermSOMPlanning(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMPermissionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PermSOMPlanning.call(this, pVal)
    end
    def get_PermSOMGPOCreate(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMPermissionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PermSOMGPOCreate.call(this, pVal)
    end
    def get_PermSOMWMICreate(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMPermissionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PermSOMWMICreate.call(this, pVal)
    end
    def get_PermSOMWMIFullControl(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMPermissionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PermSOMWMIFullControl.call(this, pVal)
    end
    def get_SearchPropertyGPOPermissions(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMSearchProperty*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SearchPropertyGPOPermissions.call(this, pVal)
    end
    def get_SearchPropertyGPOEffectivePermissions(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMSearchProperty*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SearchPropertyGPOEffectivePermissions.call(this, pVal)
    end
    def get_SearchPropertyGPODisplayName(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMSearchProperty*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SearchPropertyGPODisplayName.call(this, pVal)
    end
    def get_SearchPropertyGPOWMIFilter(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMSearchProperty*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SearchPropertyGPOWMIFilter.call(this, pVal)
    end
    def get_SearchPropertyGPOID(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMSearchProperty*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SearchPropertyGPOID.call(this, pVal)
    end
    def get_SearchPropertyGPOComputerExtensions(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMSearchProperty*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SearchPropertyGPOComputerExtensions.call(this, pVal)
    end
    def get_SearchPropertyGPOUserExtensions(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMSearchProperty*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SearchPropertyGPOUserExtensions.call(this, pVal)
    end
    def get_SearchPropertySOMLinks(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMSearchProperty*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SearchPropertySOMLinks.call(this, pVal)
    end
    def get_SearchPropertyGPODomain(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMSearchProperty*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SearchPropertyGPODomain.call(this, pVal)
    end
    def get_SearchPropertyBackupMostRecent(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMSearchProperty*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SearchPropertyBackupMostRecent.call(this, pVal)
    end
    def get_SearchOpEquals(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMSearchOperation*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SearchOpEquals.call(this, pVal)
    end
    def get_SearchOpContains(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMSearchOperation*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SearchOpContains.call(this, pVal)
    end
    def get_SearchOpNotContains(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMSearchOperation*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SearchOpNotContains.call(this, pVal)
    end
    def get_SearchOpNotEquals(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMSearchOperation*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SearchOpNotEquals.call(this, pVal)
    end
    def get_UsePDC(this : IGPMConstants2*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UsePDC.call(this, pVal)
    end
    def get_UseAnyDC(this : IGPMConstants2*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UseAnyDC.call(this, pVal)
    end
    def get_DoNotUseW2KDC(this : IGPMConstants2*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DoNotUseW2KDC.call(this, pVal)
    end
    def get_SOMSite(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMSOMType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SOMSite.call(this, pVal)
    end
    def get_SOMDomain(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMSOMType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SOMDomain.call(this, pVal)
    end
    def get_SOMOU(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMSOMType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SOMOU.call(this, pVal)
    end
    def get_SecurityFlags(this : IGPMConstants2*, vbOwner : Int16, vbGroup : Int16, vbDACL : Int16, vbSACL : Int16, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SecurityFlags.call(this, vbOwner, vbGroup, vbDACL, vbSACL, pVal)
    end
    def get_DoNotValidateDC(this : IGPMConstants2*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DoNotValidateDC.call(this, pVal)
    end
    def get_ReportHTML(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMReportType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReportHTML.call(this, pVal)
    end
    def get_ReportXML(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMReportType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReportXML.call(this, pVal)
    end
    def get_RSOPModeUnknown(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMRSOPMode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RSOPModeUnknown.call(this, pVal)
    end
    def get_RSOPModePlanning(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMRSOPMode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RSOPModePlanning.call(this, pVal)
    end
    def get_RSOPModeLogging(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMRSOPMode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RSOPModeLogging.call(this, pVal)
    end
    def get_EntryTypeUser(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMEntryType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EntryTypeUser.call(this, pVal)
    end
    def get_EntryTypeComputer(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMEntryType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EntryTypeComputer.call(this, pVal)
    end
    def get_EntryTypeLocalGroup(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMEntryType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EntryTypeLocalGroup.call(this, pVal)
    end
    def get_EntryTypeGlobalGroup(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMEntryType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EntryTypeGlobalGroup.call(this, pVal)
    end
    def get_EntryTypeUniversalGroup(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMEntryType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EntryTypeUniversalGroup.call(this, pVal)
    end
    def get_EntryTypeUNCPath(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMEntryType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EntryTypeUNCPath.call(this, pVal)
    end
    def get_EntryTypeUnknown(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMEntryType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EntryTypeUnknown.call(this, pVal)
    end
    def get_DestinationOptionSameAsSource(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMDestinationOption*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DestinationOptionSameAsSource.call(this, pVal)
    end
    def get_DestinationOptionNone(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMDestinationOption*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DestinationOptionNone.call(this, pVal)
    end
    def get_DestinationOptionByRelativeName(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMDestinationOption*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DestinationOptionByRelativeName.call(this, pVal)
    end
    def get_DestinationOptionSet(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMDestinationOption*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DestinationOptionSet.call(this, pVal)
    end
    def get_MigrationTableOnly(this : IGPMConstants2*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MigrationTableOnly.call(this, pVal)
    end
    def get_ProcessSecurity(this : IGPMConstants2*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ProcessSecurity.call(this, pVal)
    end
    def get_RsopLoggingNoComputer(this : IGPMConstants2*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RsopLoggingNoComputer.call(this, pVal)
    end
    def get_RsopLoggingNoUser(this : IGPMConstants2*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RsopLoggingNoUser.call(this, pVal)
    end
    def get_RsopPlanningAssumeSlowLink(this : IGPMConstants2*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RsopPlanningAssumeSlowLink.call(this, pVal)
    end
    def get_RsopPlanningLoopbackOption(this : IGPMConstants2*, vbMerge : Int16, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RsopPlanningLoopbackOption.call(this, vbMerge, pVal)
    end
    def get_RsopPlanningAssumeUserWQLFilterTrue(this : IGPMConstants2*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RsopPlanningAssumeUserWQLFilterTrue.call(this, pVal)
    end
    def get_RsopPlanningAssumeCompWQLFilterTrue(this : IGPMConstants2*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RsopPlanningAssumeCompWQLFilterTrue.call(this, pVal)
    end
    def get_BackupTypeGPO(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMBackupType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BackupTypeGPO.call(this, pVal)
    end
    def get_BackupTypeStarterGPO(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMBackupType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BackupTypeStarterGPO.call(this, pVal)
    end
    def get_StarterGPOTypeSystem(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMStarterGPOType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StarterGPOTypeSystem.call(this, pVal)
    end
    def get_StarterGPOTypeCustom(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMStarterGPOType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StarterGPOTypeCustom.call(this, pVal)
    end
    def get_SearchPropertyStarterGPOPermissions(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMSearchProperty*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SearchPropertyStarterGPOPermissions.call(this, pVal)
    end
    def get_SearchPropertyStarterGPOEffectivePermissions(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMSearchProperty*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SearchPropertyStarterGPOEffectivePermissions.call(this, pVal)
    end
    def get_SearchPropertyStarterGPODisplayName(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMSearchProperty*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SearchPropertyStarterGPODisplayName.call(this, pVal)
    end
    def get_SearchPropertyStarterGPOID(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMSearchProperty*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SearchPropertyStarterGPOID.call(this, pVal)
    end
    def get_SearchPropertyStarterGPODomain(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMSearchProperty*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SearchPropertyStarterGPODomain.call(this, pVal)
    end
    def get_PermStarterGPORead(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMPermissionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PermStarterGPORead.call(this, pVal)
    end
    def get_PermStarterGPOEdit(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMPermissionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PermStarterGPOEdit.call(this, pVal)
    end
    def get_PermStarterGPOFullControl(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMPermissionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PermStarterGPOFullControl.call(this, pVal)
    end
    def get_PermStarterGPOCustom(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMPermissionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PermStarterGPOCustom.call(this, pVal)
    end
    def get_ReportLegacy(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMReportingOptions*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReportLegacy.call(this, pVal)
    end
    def get_ReportComments(this : IGPMConstants2*, pVal : Win32cr::System::GroupPolicy::GPMReportingOptions*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReportComments.call(this, pVal)
    end

  end

  @[Extern]
  record IGPMGPO2Vtbl,
    query_interface : Proc(IGPMGPO2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGPMGPO2*, UInt32),
    release : Proc(IGPMGPO2*, UInt32),
    get_type_info_count : Proc(IGPMGPO2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IGPMGPO2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IGPMGPO2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IGPMGPO2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_DisplayName : Proc(IGPMGPO2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_DisplayName : Proc(IGPMGPO2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Path : Proc(IGPMGPO2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ID : Proc(IGPMGPO2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DomainName : Proc(IGPMGPO2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CreationTime : Proc(IGPMGPO2*, Float64*, Win32cr::Foundation::HRESULT),
    get_ModificationTime : Proc(IGPMGPO2*, Float64*, Win32cr::Foundation::HRESULT),
    get_UserDSVersionNumber : Proc(IGPMGPO2*, Int32*, Win32cr::Foundation::HRESULT),
    get_ComputerDSVersionNumber : Proc(IGPMGPO2*, Int32*, Win32cr::Foundation::HRESULT),
    get_UserSysvolVersionNumber : Proc(IGPMGPO2*, Int32*, Win32cr::Foundation::HRESULT),
    get_ComputerSysvolVersionNumber : Proc(IGPMGPO2*, Int32*, Win32cr::Foundation::HRESULT),
    get_wmi_filter : Proc(IGPMGPO2*, Void**, Win32cr::Foundation::HRESULT),
    set_wmi_filter : Proc(IGPMGPO2*, Void*, Win32cr::Foundation::HRESULT),
    set_user_enabled : Proc(IGPMGPO2*, Int16, Win32cr::Foundation::HRESULT),
    set_computer_enabled : Proc(IGPMGPO2*, Int16, Win32cr::Foundation::HRESULT),
    is_user_enabled : Proc(IGPMGPO2*, Int16*, Win32cr::Foundation::HRESULT),
    is_computer_enabled : Proc(IGPMGPO2*, Int16*, Win32cr::Foundation::HRESULT),
    get_security_info : Proc(IGPMGPO2*, Void**, Win32cr::Foundation::HRESULT),
    set_security_info : Proc(IGPMGPO2*, Void*, Win32cr::Foundation::HRESULT),
    delete : Proc(IGPMGPO2*, Win32cr::Foundation::HRESULT),
    backup : Proc(IGPMGPO2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    import : Proc(IGPMGPO2*, Int32, Void*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    generate_report : Proc(IGPMGPO2*, Win32cr::System::GroupPolicy::GPMReportType, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    generate_report_to_file : Proc(IGPMGPO2*, Win32cr::System::GroupPolicy::GPMReportType, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    copy_to : Proc(IGPMGPO2*, Int32, Void*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    set_security_descriptor : Proc(IGPMGPO2*, Int32, Void*, Win32cr::Foundation::HRESULT),
    get_security_descriptor : Proc(IGPMGPO2*, Int32, Void**, Win32cr::Foundation::HRESULT),
    is_acl_consistent : Proc(IGPMGPO2*, Int16*, Win32cr::Foundation::HRESULT),
    make_acl_consistent : Proc(IGPMGPO2*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IGPMGPO2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IGPMGPO2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGPMGPO2, lpVtbl : IGPMGPO2Vtbl* do
    GUID = LibC::GUID.new(0x8a66a210_u32, 0xb78b_u16, 0x4d99_u16, StaticArray[0x88_u8, 0xe2_u8, 0xc3_u8, 0x6_u8, 0xa8_u8, 0x17_u8, 0xc9_u8, 0x25_u8])
    def query_interface(this : IGPMGPO2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGPMGPO2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGPMGPO2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IGPMGPO2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IGPMGPO2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IGPMGPO2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IGPMGPO2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_DisplayName(this : IGPMGPO2*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DisplayName.call(this, pVal)
    end
    def put_DisplayName(this : IGPMGPO2*, newVal : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DisplayName.call(this, newVal)
    end
    def get_Path(this : IGPMGPO2*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Path.call(this, pVal)
    end
    def get_ID(this : IGPMGPO2*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ID.call(this, pVal)
    end
    def get_DomainName(this : IGPMGPO2*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DomainName.call(this, pVal)
    end
    def get_CreationTime(this : IGPMGPO2*, pDate : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CreationTime.call(this, pDate)
    end
    def get_ModificationTime(this : IGPMGPO2*, pDate : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ModificationTime.call(this, pDate)
    end
    def get_UserDSVersionNumber(this : IGPMGPO2*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserDSVersionNumber.call(this, pVal)
    end
    def get_ComputerDSVersionNumber(this : IGPMGPO2*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ComputerDSVersionNumber.call(this, pVal)
    end
    def get_UserSysvolVersionNumber(this : IGPMGPO2*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserSysvolVersionNumber.call(this, pVal)
    end
    def get_ComputerSysvolVersionNumber(this : IGPMGPO2*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ComputerSysvolVersionNumber.call(this, pVal)
    end
    def get_wmi_filter(this : IGPMGPO2*, ppIGPMWMIFilter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_wmi_filter.call(this, ppIGPMWMIFilter)
    end
    def set_wmi_filter(this : IGPMGPO2*, pIGPMWMIFilter : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_wmi_filter.call(this, pIGPMWMIFilter)
    end
    def set_user_enabled(this : IGPMGPO2*, vbEnabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_user_enabled.call(this, vbEnabled)
    end
    def set_computer_enabled(this : IGPMGPO2*, vbEnabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_computer_enabled.call(this, vbEnabled)
    end
    def is_user_enabled(this : IGPMGPO2*, pvbEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_user_enabled.call(this, pvbEnabled)
    end
    def is_computer_enabled(this : IGPMGPO2*, pvbEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_computer_enabled.call(this, pvbEnabled)
    end
    def get_security_info(this : IGPMGPO2*, ppSecurityInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_security_info.call(this, ppSecurityInfo)
    end
    def set_security_info(this : IGPMGPO2*, pSecurityInfo : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_security_info.call(this, pSecurityInfo)
    end
    def delete(this : IGPMGPO2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def backup(this : IGPMGPO2*, bstrBackupDir : Win32cr::Foundation::BSTR, bstrComment : Win32cr::Foundation::BSTR, pvarGPMProgress : Win32cr::System::Com::VARIANT*, pvarGPMCancel : Win32cr::System::Com::VARIANT*, ppIGPMResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.backup.call(this, bstrBackupDir, bstrComment, pvarGPMProgress, pvarGPMCancel, ppIGPMResult)
    end
    def import(this : IGPMGPO2*, lFlags : Int32, pIGPMBackup : Void*, pvarMigrationTable : Win32cr::System::Com::VARIANT*, pvarGPMProgress : Win32cr::System::Com::VARIANT*, pvarGPMCancel : Win32cr::System::Com::VARIANT*, ppIGPMResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.import.call(this, lFlags, pIGPMBackup, pvarMigrationTable, pvarGPMProgress, pvarGPMCancel, ppIGPMResult)
    end
    def generate_report(this : IGPMGPO2*, gpmReportType : Win32cr::System::GroupPolicy::GPMReportType, pvarGPMProgress : Win32cr::System::Com::VARIANT*, pvarGPMCancel : Win32cr::System::Com::VARIANT*, ppIGPMResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.generate_report.call(this, gpmReportType, pvarGPMProgress, pvarGPMCancel, ppIGPMResult)
    end
    def generate_report_to_file(this : IGPMGPO2*, gpmReportType : Win32cr::System::GroupPolicy::GPMReportType, bstrTargetFilePath : Win32cr::Foundation::BSTR, ppIGPMResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.generate_report_to_file.call(this, gpmReportType, bstrTargetFilePath, ppIGPMResult)
    end
    def copy_to(this : IGPMGPO2*, lFlags : Int32, pIGPMDomain : Void*, pvarNewDisplayName : Win32cr::System::Com::VARIANT*, pvarMigrationTable : Win32cr::System::Com::VARIANT*, pvarGPMProgress : Win32cr::System::Com::VARIANT*, pvarGPMCancel : Win32cr::System::Com::VARIANT*, ppIGPMResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_to.call(this, lFlags, pIGPMDomain, pvarNewDisplayName, pvarMigrationTable, pvarGPMProgress, pvarGPMCancel, ppIGPMResult)
    end
    def set_security_descriptor(this : IGPMGPO2*, lFlags : Int32, pSD : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_security_descriptor.call(this, lFlags, pSD)
    end
    def get_security_descriptor(this : IGPMGPO2*, lFlags : Int32, ppSD : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_security_descriptor.call(this, lFlags, ppSD)
    end
    def is_acl_consistent(this : IGPMGPO2*, pvbConsistent : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_acl_consistent.call(this, pvbConsistent)
    end
    def make_acl_consistent(this : IGPMGPO2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.make_acl_consistent.call(this)
    end
    def get_Description(this : IGPMGPO2*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, pVal)
    end
    def put_Description(this : IGPMGPO2*, newVal : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, newVal)
    end

  end

  @[Extern]
  record IGPMDomain3Vtbl,
    query_interface : Proc(IGPMDomain3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGPMDomain3*, UInt32),
    release : Proc(IGPMDomain3*, UInt32),
    get_type_info_count : Proc(IGPMDomain3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IGPMDomain3*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IGPMDomain3*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IGPMDomain3*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_DomainController : Proc(IGPMDomain3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Domain : Proc(IGPMDomain3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    create_gpo : Proc(IGPMDomain3*, Void**, Win32cr::Foundation::HRESULT),
    get_gpo : Proc(IGPMDomain3*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    search_gp_os : Proc(IGPMDomain3*, Void*, Void**, Win32cr::Foundation::HRESULT),
    restore_gpo : Proc(IGPMDomain3*, Void*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    get_som : Proc(IGPMDomain3*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    search_so_ms : Proc(IGPMDomain3*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_wmi_filter : Proc(IGPMDomain3*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    search_wmi_filters : Proc(IGPMDomain3*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_starter_gpo : Proc(IGPMDomain3*, Void**, Win32cr::Foundation::HRESULT),
    create_gpo_from_starter_gpo : Proc(IGPMDomain3*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_starter_gpo : Proc(IGPMDomain3*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    search_starter_gp_os : Proc(IGPMDomain3*, Void*, Void**, Win32cr::Foundation::HRESULT),
    load_starter_gpo : Proc(IGPMDomain3*, Win32cr::Foundation::BSTR, Int16, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    restore_starter_gpo : Proc(IGPMDomain3*, Void*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    generate_report : Proc(IGPMDomain3*, Win32cr::System::GroupPolicy::GPMReportType, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    get_InfrastructureDC : Proc(IGPMDomain3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_InfrastructureDC : Proc(IGPMDomain3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    put_InfrastructureFlags : Proc(IGPMDomain3*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGPMDomain3, lpVtbl : IGPMDomain3Vtbl* do
    GUID = LibC::GUID.new(0x77fdfe_u32, 0x88c7_u16, 0x4acf_u16, StaticArray[0xa1_u8, 0x1d_u8, 0xd1_u8, 0xa_u8, 0x7c_u8, 0x31_u8, 0xa_u8, 0x3_u8])
    def query_interface(this : IGPMDomain3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGPMDomain3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGPMDomain3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IGPMDomain3*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IGPMDomain3*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IGPMDomain3*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IGPMDomain3*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_DomainController(this : IGPMDomain3*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DomainController.call(this, pVal)
    end
    def get_Domain(this : IGPMDomain3*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Domain.call(this, pVal)
    end
    def create_gpo(this : IGPMDomain3*, ppNewGPO : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_gpo.call(this, ppNewGPO)
    end
    def get_gpo(this : IGPMDomain3*, bstrGuid : Win32cr::Foundation::BSTR, ppGPO : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_gpo.call(this, bstrGuid, ppGPO)
    end
    def search_gp_os(this : IGPMDomain3*, pIGPMSearchCriteria : Void*, ppIGPMGPOCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.search_gp_os.call(this, pIGPMSearchCriteria, ppIGPMGPOCollection)
    end
    def restore_gpo(this : IGPMDomain3*, pIGPMBackup : Void*, lDCFlags : Int32, pvarGPMProgress : Win32cr::System::Com::VARIANT*, pvarGPMCancel : Win32cr::System::Com::VARIANT*, ppIGPMResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.restore_gpo.call(this, pIGPMBackup, lDCFlags, pvarGPMProgress, pvarGPMCancel, ppIGPMResult)
    end
    def get_som(this : IGPMDomain3*, bstrPath : Win32cr::Foundation::BSTR, ppSOM : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_som.call(this, bstrPath, ppSOM)
    end
    def search_so_ms(this : IGPMDomain3*, pIGPMSearchCriteria : Void*, ppIGPMSOMCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.search_so_ms.call(this, pIGPMSearchCriteria, ppIGPMSOMCollection)
    end
    def get_wmi_filter(this : IGPMDomain3*, bstrPath : Win32cr::Foundation::BSTR, ppWMIFilter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_wmi_filter.call(this, bstrPath, ppWMIFilter)
    end
    def search_wmi_filters(this : IGPMDomain3*, pIGPMSearchCriteria : Void*, ppIGPMWMIFilterCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.search_wmi_filters.call(this, pIGPMSearchCriteria, ppIGPMWMIFilterCollection)
    end
    def create_starter_gpo(this : IGPMDomain3*, ppnewTemplate : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_starter_gpo.call(this, ppnewTemplate)
    end
    def create_gpo_from_starter_gpo(this : IGPMDomain3*, pGPOTemplate : Void*, ppnewGPO : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_gpo_from_starter_gpo.call(this, pGPOTemplate, ppnewGPO)
    end
    def get_starter_gpo(this : IGPMDomain3*, bstrGuid : Win32cr::Foundation::BSTR, ppTemplate : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_starter_gpo.call(this, bstrGuid, ppTemplate)
    end
    def search_starter_gp_os(this : IGPMDomain3*, pIGPMSearchCriteria : Void*, ppIGPMTemplateCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.search_starter_gp_os.call(this, pIGPMSearchCriteria, ppIGPMTemplateCollection)
    end
    def load_starter_gpo(this : IGPMDomain3*, bstrLoadFile : Win32cr::Foundation::BSTR, bOverwrite : Int16, pvarGPMProgress : Win32cr::System::Com::VARIANT*, pvarGPMCancel : Win32cr::System::Com::VARIANT*, ppIGPMResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_starter_gpo.call(this, bstrLoadFile, bOverwrite, pvarGPMProgress, pvarGPMCancel, ppIGPMResult)
    end
    def restore_starter_gpo(this : IGPMDomain3*, pIGPMTmplBackup : Void*, pvarGPMProgress : Win32cr::System::Com::VARIANT*, pvarGPMCancel : Win32cr::System::Com::VARIANT*, ppIGPMResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.restore_starter_gpo.call(this, pIGPMTmplBackup, pvarGPMProgress, pvarGPMCancel, ppIGPMResult)
    end
    def generate_report(this : IGPMDomain3*, gpmReportType : Win32cr::System::GroupPolicy::GPMReportType, pvarGPMProgress : Win32cr::System::Com::VARIANT*, pvarGPMCancel : Win32cr::System::Com::VARIANT*, ppIGPMResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.generate_report.call(this, gpmReportType, pvarGPMProgress, pvarGPMCancel, ppIGPMResult)
    end
    def get_InfrastructureDC(this : IGPMDomain3*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InfrastructureDC.call(this, pVal)
    end
    def put_InfrastructureDC(this : IGPMDomain3*, newVal : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_InfrastructureDC.call(this, newVal)
    end
    def put_InfrastructureFlags(this : IGPMDomain3*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_InfrastructureFlags.call(this, dwFlags)
    end

  end

  @[Extern]
  record IGPMGPO3Vtbl,
    query_interface : Proc(IGPMGPO3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGPMGPO3*, UInt32),
    release : Proc(IGPMGPO3*, UInt32),
    get_type_info_count : Proc(IGPMGPO3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IGPMGPO3*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IGPMGPO3*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IGPMGPO3*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_DisplayName : Proc(IGPMGPO3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_DisplayName : Proc(IGPMGPO3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Path : Proc(IGPMGPO3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ID : Proc(IGPMGPO3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DomainName : Proc(IGPMGPO3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CreationTime : Proc(IGPMGPO3*, Float64*, Win32cr::Foundation::HRESULT),
    get_ModificationTime : Proc(IGPMGPO3*, Float64*, Win32cr::Foundation::HRESULT),
    get_UserDSVersionNumber : Proc(IGPMGPO3*, Int32*, Win32cr::Foundation::HRESULT),
    get_ComputerDSVersionNumber : Proc(IGPMGPO3*, Int32*, Win32cr::Foundation::HRESULT),
    get_UserSysvolVersionNumber : Proc(IGPMGPO3*, Int32*, Win32cr::Foundation::HRESULT),
    get_ComputerSysvolVersionNumber : Proc(IGPMGPO3*, Int32*, Win32cr::Foundation::HRESULT),
    get_wmi_filter : Proc(IGPMGPO3*, Void**, Win32cr::Foundation::HRESULT),
    set_wmi_filter : Proc(IGPMGPO3*, Void*, Win32cr::Foundation::HRESULT),
    set_user_enabled : Proc(IGPMGPO3*, Int16, Win32cr::Foundation::HRESULT),
    set_computer_enabled : Proc(IGPMGPO3*, Int16, Win32cr::Foundation::HRESULT),
    is_user_enabled : Proc(IGPMGPO3*, Int16*, Win32cr::Foundation::HRESULT),
    is_computer_enabled : Proc(IGPMGPO3*, Int16*, Win32cr::Foundation::HRESULT),
    get_security_info : Proc(IGPMGPO3*, Void**, Win32cr::Foundation::HRESULT),
    set_security_info : Proc(IGPMGPO3*, Void*, Win32cr::Foundation::HRESULT),
    delete : Proc(IGPMGPO3*, Win32cr::Foundation::HRESULT),
    backup : Proc(IGPMGPO3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    import : Proc(IGPMGPO3*, Int32, Void*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    generate_report : Proc(IGPMGPO3*, Win32cr::System::GroupPolicy::GPMReportType, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    generate_report_to_file : Proc(IGPMGPO3*, Win32cr::System::GroupPolicy::GPMReportType, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    copy_to : Proc(IGPMGPO3*, Int32, Void*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    set_security_descriptor : Proc(IGPMGPO3*, Int32, Void*, Win32cr::Foundation::HRESULT),
    get_security_descriptor : Proc(IGPMGPO3*, Int32, Void**, Win32cr::Foundation::HRESULT),
    is_acl_consistent : Proc(IGPMGPO3*, Int16*, Win32cr::Foundation::HRESULT),
    make_acl_consistent : Proc(IGPMGPO3*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IGPMGPO3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IGPMGPO3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_InfrastructureDC : Proc(IGPMGPO3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_InfrastructureDC : Proc(IGPMGPO3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    put_InfrastructureFlags : Proc(IGPMGPO3*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGPMGPO3, lpVtbl : IGPMGPO3Vtbl* do
    GUID = LibC::GUID.new(0x7cf123a1_u32, 0xf94a_u16, 0x4112_u16, StaticArray[0xbf_u8, 0xae_u8, 0x6a_u8, 0xa1_u8, 0xdb_u8, 0x9c_u8, 0xb2_u8, 0x48_u8])
    def query_interface(this : IGPMGPO3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGPMGPO3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGPMGPO3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IGPMGPO3*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IGPMGPO3*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IGPMGPO3*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IGPMGPO3*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_DisplayName(this : IGPMGPO3*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DisplayName.call(this, pVal)
    end
    def put_DisplayName(this : IGPMGPO3*, newVal : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DisplayName.call(this, newVal)
    end
    def get_Path(this : IGPMGPO3*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Path.call(this, pVal)
    end
    def get_ID(this : IGPMGPO3*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ID.call(this, pVal)
    end
    def get_DomainName(this : IGPMGPO3*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DomainName.call(this, pVal)
    end
    def get_CreationTime(this : IGPMGPO3*, pDate : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CreationTime.call(this, pDate)
    end
    def get_ModificationTime(this : IGPMGPO3*, pDate : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ModificationTime.call(this, pDate)
    end
    def get_UserDSVersionNumber(this : IGPMGPO3*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserDSVersionNumber.call(this, pVal)
    end
    def get_ComputerDSVersionNumber(this : IGPMGPO3*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ComputerDSVersionNumber.call(this, pVal)
    end
    def get_UserSysvolVersionNumber(this : IGPMGPO3*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserSysvolVersionNumber.call(this, pVal)
    end
    def get_ComputerSysvolVersionNumber(this : IGPMGPO3*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ComputerSysvolVersionNumber.call(this, pVal)
    end
    def get_wmi_filter(this : IGPMGPO3*, ppIGPMWMIFilter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_wmi_filter.call(this, ppIGPMWMIFilter)
    end
    def set_wmi_filter(this : IGPMGPO3*, pIGPMWMIFilter : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_wmi_filter.call(this, pIGPMWMIFilter)
    end
    def set_user_enabled(this : IGPMGPO3*, vbEnabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_user_enabled.call(this, vbEnabled)
    end
    def set_computer_enabled(this : IGPMGPO3*, vbEnabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_computer_enabled.call(this, vbEnabled)
    end
    def is_user_enabled(this : IGPMGPO3*, pvbEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_user_enabled.call(this, pvbEnabled)
    end
    def is_computer_enabled(this : IGPMGPO3*, pvbEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_computer_enabled.call(this, pvbEnabled)
    end
    def get_security_info(this : IGPMGPO3*, ppSecurityInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_security_info.call(this, ppSecurityInfo)
    end
    def set_security_info(this : IGPMGPO3*, pSecurityInfo : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_security_info.call(this, pSecurityInfo)
    end
    def delete(this : IGPMGPO3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def backup(this : IGPMGPO3*, bstrBackupDir : Win32cr::Foundation::BSTR, bstrComment : Win32cr::Foundation::BSTR, pvarGPMProgress : Win32cr::System::Com::VARIANT*, pvarGPMCancel : Win32cr::System::Com::VARIANT*, ppIGPMResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.backup.call(this, bstrBackupDir, bstrComment, pvarGPMProgress, pvarGPMCancel, ppIGPMResult)
    end
    def import(this : IGPMGPO3*, lFlags : Int32, pIGPMBackup : Void*, pvarMigrationTable : Win32cr::System::Com::VARIANT*, pvarGPMProgress : Win32cr::System::Com::VARIANT*, pvarGPMCancel : Win32cr::System::Com::VARIANT*, ppIGPMResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.import.call(this, lFlags, pIGPMBackup, pvarMigrationTable, pvarGPMProgress, pvarGPMCancel, ppIGPMResult)
    end
    def generate_report(this : IGPMGPO3*, gpmReportType : Win32cr::System::GroupPolicy::GPMReportType, pvarGPMProgress : Win32cr::System::Com::VARIANT*, pvarGPMCancel : Win32cr::System::Com::VARIANT*, ppIGPMResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.generate_report.call(this, gpmReportType, pvarGPMProgress, pvarGPMCancel, ppIGPMResult)
    end
    def generate_report_to_file(this : IGPMGPO3*, gpmReportType : Win32cr::System::GroupPolicy::GPMReportType, bstrTargetFilePath : Win32cr::Foundation::BSTR, ppIGPMResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.generate_report_to_file.call(this, gpmReportType, bstrTargetFilePath, ppIGPMResult)
    end
    def copy_to(this : IGPMGPO3*, lFlags : Int32, pIGPMDomain : Void*, pvarNewDisplayName : Win32cr::System::Com::VARIANT*, pvarMigrationTable : Win32cr::System::Com::VARIANT*, pvarGPMProgress : Win32cr::System::Com::VARIANT*, pvarGPMCancel : Win32cr::System::Com::VARIANT*, ppIGPMResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_to.call(this, lFlags, pIGPMDomain, pvarNewDisplayName, pvarMigrationTable, pvarGPMProgress, pvarGPMCancel, ppIGPMResult)
    end
    def set_security_descriptor(this : IGPMGPO3*, lFlags : Int32, pSD : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_security_descriptor.call(this, lFlags, pSD)
    end
    def get_security_descriptor(this : IGPMGPO3*, lFlags : Int32, ppSD : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_security_descriptor.call(this, lFlags, ppSD)
    end
    def is_acl_consistent(this : IGPMGPO3*, pvbConsistent : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_acl_consistent.call(this, pvbConsistent)
    end
    def make_acl_consistent(this : IGPMGPO3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.make_acl_consistent.call(this)
    end
    def get_Description(this : IGPMGPO3*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, pVal)
    end
    def put_Description(this : IGPMGPO3*, newVal : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, newVal)
    end
    def get_InfrastructureDC(this : IGPMGPO3*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InfrastructureDC.call(this, pVal)
    end
    def put_InfrastructureDC(this : IGPMGPO3*, newVal : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_InfrastructureDC.call(this, newVal)
    end
    def put_InfrastructureFlags(this : IGPMGPO3*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_InfrastructureFlags.call(this, dwFlags)
    end

  end

  @[Extern]
  record IGPEInformationVtbl,
    query_interface : Proc(IGPEInformation*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGPEInformation*, UInt32),
    release : Proc(IGPEInformation*, UInt32),
    get_name : Proc(IGPEInformation*, UInt16*, Int32, Win32cr::Foundation::HRESULT),
    get_display_name : Proc(IGPEInformation*, UInt16*, Int32, Win32cr::Foundation::HRESULT),
    get_registry_key : Proc(IGPEInformation*, UInt32, Win32cr::System::Registry::HKEY*, Win32cr::Foundation::HRESULT),
    get_ds_path : Proc(IGPEInformation*, UInt32, UInt16*, Int32, Win32cr::Foundation::HRESULT),
    get_file_sys_path : Proc(IGPEInformation*, UInt32, UInt16*, Int32, Win32cr::Foundation::HRESULT),
    get_options : Proc(IGPEInformation*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type : Proc(IGPEInformation*, Win32cr::System::GroupPolicy::GROUP_POLICY_OBJECT_TYPE*, Win32cr::Foundation::HRESULT),
    get_hint : Proc(IGPEInformation*, Win32cr::System::GroupPolicy::GROUP_POLICY_HINT_TYPE*, Win32cr::Foundation::HRESULT),
    policy_changed : Proc(IGPEInformation*, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, LibC::GUID*, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGPEInformation, lpVtbl : IGPEInformationVtbl* do
    GUID = LibC::GUID.new(0x8fc0b735_u32, 0xa0e1_u16, 0x11d1_u16, StaticArray[0xa7_u8, 0xd3_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x71_u8, 0xe3_u8])
    def query_interface(this : IGPEInformation*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGPEInformation*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGPEInformation*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_name(this : IGPEInformation*, pszName : UInt16*, cchMaxLength : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, pszName, cchMaxLength)
    end
    def get_display_name(this : IGPEInformation*, pszName : UInt16*, cchMaxLength : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_name.call(this, pszName, cchMaxLength)
    end
    def get_registry_key(this : IGPEInformation*, dwSection : UInt32, hKey : Win32cr::System::Registry::HKEY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_registry_key.call(this, dwSection, hKey)
    end
    def get_ds_path(this : IGPEInformation*, dwSection : UInt32, pszPath : UInt16*, cchMaxPath : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ds_path.call(this, dwSection, pszPath, cchMaxPath)
    end
    def get_file_sys_path(this : IGPEInformation*, dwSection : UInt32, pszPath : UInt16*, cchMaxPath : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_sys_path.call(this, dwSection, pszPath, cchMaxPath)
    end
    def get_options(this : IGPEInformation*, dwOptions : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_options.call(this, dwOptions)
    end
    def get_type(this : IGPEInformation*, gpoType : Win32cr::System::GroupPolicy::GROUP_POLICY_OBJECT_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, gpoType)
    end
    def get_hint(this : IGPEInformation*, gpHint : Win32cr::System::GroupPolicy::GROUP_POLICY_HINT_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_hint.call(this, gpHint)
    end
    def policy_changed(this : IGPEInformation*, bMachine : Win32cr::Foundation::BOOL, bAdd : Win32cr::Foundation::BOOL, pGuidExtension : LibC::GUID*, pGuidSnapin : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.policy_changed.call(this, bMachine, bAdd, pGuidExtension, pGuidSnapin)
    end

  end

  @[Extern]
  record IGroupPolicyObjectVtbl,
    query_interface : Proc(IGroupPolicyObject*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGroupPolicyObject*, UInt32),
    release : Proc(IGroupPolicyObject*, UInt32),
    new : Proc(IGroupPolicyObject*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    open_dsgpo : Proc(IGroupPolicyObject*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    open_local_machine_gpo : Proc(IGroupPolicyObject*, UInt32, Win32cr::Foundation::HRESULT),
    open_remote_machine_gpo : Proc(IGroupPolicyObject*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    save : Proc(IGroupPolicyObject*, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, LibC::GUID*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    delete : Proc(IGroupPolicyObject*, Win32cr::Foundation::HRESULT),
    get_name : Proc(IGroupPolicyObject*, UInt16*, Int32, Win32cr::Foundation::HRESULT),
    get_display_name : Proc(IGroupPolicyObject*, UInt16*, Int32, Win32cr::Foundation::HRESULT),
    set_display_name : Proc(IGroupPolicyObject*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_path : Proc(IGroupPolicyObject*, UInt16*, Int32, Win32cr::Foundation::HRESULT),
    get_ds_path : Proc(IGroupPolicyObject*, UInt32, UInt16*, Int32, Win32cr::Foundation::HRESULT),
    get_file_sys_path : Proc(IGroupPolicyObject*, UInt32, UInt16*, Int32, Win32cr::Foundation::HRESULT),
    get_registry_key : Proc(IGroupPolicyObject*, UInt32, Win32cr::System::Registry::HKEY*, Win32cr::Foundation::HRESULT),
    get_options : Proc(IGroupPolicyObject*, UInt32*, Win32cr::Foundation::HRESULT),
    set_options : Proc(IGroupPolicyObject*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    get_type : Proc(IGroupPolicyObject*, Win32cr::System::GroupPolicy::GROUP_POLICY_OBJECT_TYPE*, Win32cr::Foundation::HRESULT),
    get_machine_name : Proc(IGroupPolicyObject*, UInt16*, Int32, Win32cr::Foundation::HRESULT),
    get_property_sheet_pages : Proc(IGroupPolicyObject*, Win32cr::UI::Controls::HPROPSHEETPAGE**, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGroupPolicyObject, lpVtbl : IGroupPolicyObjectVtbl* do
    GUID = LibC::GUID.new(0xea502723_u32, 0xa23d_u16, 0x11d1_u16, StaticArray[0xa7_u8, 0xd3_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x71_u8, 0xe3_u8])
    def query_interface(this : IGroupPolicyObject*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGroupPolicyObject*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGroupPolicyObject*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def new(this : IGroupPolicyObject*, pszDomainName : Win32cr::Foundation::PWSTR, pszDisplayName : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.new.call(this, pszDomainName, pszDisplayName, dwFlags)
    end
    def open_dsgpo(this : IGroupPolicyObject*, pszPath : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_dsgpo.call(this, pszPath, dwFlags)
    end
    def open_local_machine_gpo(this : IGroupPolicyObject*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_local_machine_gpo.call(this, dwFlags)
    end
    def open_remote_machine_gpo(this : IGroupPolicyObject*, pszComputerName : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_remote_machine_gpo.call(this, pszComputerName, dwFlags)
    end
    def save(this : IGroupPolicyObject*, bMachine : Win32cr::Foundation::BOOL, bAdd : Win32cr::Foundation::BOOL, pGuidExtension : LibC::GUID*, pGuid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this, bMachine, bAdd, pGuidExtension, pGuid)
    end
    def delete(this : IGroupPolicyObject*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def get_name(this : IGroupPolicyObject*, pszName : UInt16*, cchMaxLength : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, pszName, cchMaxLength)
    end
    def get_display_name(this : IGroupPolicyObject*, pszName : UInt16*, cchMaxLength : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_name.call(this, pszName, cchMaxLength)
    end
    def set_display_name(this : IGroupPolicyObject*, pszName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_display_name.call(this, pszName)
    end
    def get_path(this : IGroupPolicyObject*, pszPath : UInt16*, cchMaxLength : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_path.call(this, pszPath, cchMaxLength)
    end
    def get_ds_path(this : IGroupPolicyObject*, dwSection : UInt32, pszPath : UInt16*, cchMaxPath : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ds_path.call(this, dwSection, pszPath, cchMaxPath)
    end
    def get_file_sys_path(this : IGroupPolicyObject*, dwSection : UInt32, pszPath : UInt16*, cchMaxPath : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_sys_path.call(this, dwSection, pszPath, cchMaxPath)
    end
    def get_registry_key(this : IGroupPolicyObject*, dwSection : UInt32, hKey : Win32cr::System::Registry::HKEY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_registry_key.call(this, dwSection, hKey)
    end
    def get_options(this : IGroupPolicyObject*, dwOptions : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_options.call(this, dwOptions)
    end
    def set_options(this : IGroupPolicyObject*, dwOptions : UInt32, dwMask : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_options.call(this, dwOptions, dwMask)
    end
    def get_type(this : IGroupPolicyObject*, gpoType : Win32cr::System::GroupPolicy::GROUP_POLICY_OBJECT_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, gpoType)
    end
    def get_machine_name(this : IGroupPolicyObject*, pszName : UInt16*, cchMaxLength : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_machine_name.call(this, pszName, cchMaxLength)
    end
    def get_property_sheet_pages(this : IGroupPolicyObject*, hPages : Win32cr::UI::Controls::HPROPSHEETPAGE**, uPageCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_sheet_pages.call(this, hPages, uPageCount)
    end

  end

  @[Extern]
  record IRSOPInformationVtbl,
    query_interface : Proc(IRSOPInformation*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRSOPInformation*, UInt32),
    release : Proc(IRSOPInformation*, UInt32),
    get_namespace : Proc(IRSOPInformation*, UInt32, UInt16*, Int32, Win32cr::Foundation::HRESULT),
    get_flags : Proc(IRSOPInformation*, UInt32*, Win32cr::Foundation::HRESULT),
    get_event_log_entry_text : Proc(IRSOPInformation*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRSOPInformation, lpVtbl : IRSOPInformationVtbl* do
    GUID = LibC::GUID.new(0x9a5a81b5_u32, 0xd9c7_u16, 0x49ef_u16, StaticArray[0x9d_u8, 0x11_u8, 0xdd_u8, 0xf5_u8, 0x9_u8, 0x68_u8, 0xc4_u8, 0x8d_u8])
    def query_interface(this : IRSOPInformation*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRSOPInformation*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRSOPInformation*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_namespace(this : IRSOPInformation*, dwSection : UInt32, pszName : UInt16*, cchMaxLength : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_namespace.call(this, dwSection, pszName, cchMaxLength)
    end
    def get_flags(this : IRSOPInformation*, pdwFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_flags.call(this, pdwFlags)
    end
    def get_event_log_entry_text(this : IRSOPInformation*, pszEventSource : Win32cr::Foundation::PWSTR, pszEventLogName : Win32cr::Foundation::PWSTR, pszEventTime : Win32cr::Foundation::PWSTR, dwEventID : UInt32, ppszText : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_log_entry_text.call(this, pszEventSource, pszEventLogName, pszEventTime, dwEventID, ppszText)
    end

  end

  def refreshPolicy(bMachine : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    C.RefreshPolicy(bMachine)
  end

  def refreshPolicyEx(bMachine : Win32cr::Foundation::BOOL, dwOptions : UInt32) : Win32cr::Foundation::BOOL
    C.RefreshPolicyEx(bMachine, dwOptions)
  end

  def enterCriticalPolicySection(bMachine : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HANDLE
    C.EnterCriticalPolicySection(bMachine)
  end

  def leaveCriticalPolicySection(hSection : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    C.LeaveCriticalPolicySection(hSection)
  end

  def registerGPNotification(hEvent : Win32cr::Foundation::HANDLE, bMachine : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    C.RegisterGPNotification(hEvent, bMachine)
  end

  def unregisterGPNotification(hEvent : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    C.UnregisterGPNotification(hEvent)
  end

  def getGPOListA(hToken : Win32cr::Foundation::HANDLE, lpName : Win32cr::Foundation::PSTR, lpHostName : Win32cr::Foundation::PSTR, lpComputerName : Win32cr::Foundation::PSTR, dwFlags : UInt32, pGPOList : Win32cr::System::GroupPolicy::GROUP_POLICY_OBJECTA**) : Win32cr::Foundation::BOOL
    C.GetGPOListA(hToken, lpName, lpHostName, lpComputerName, dwFlags, pGPOList)
  end

  def getGPOListW(hToken : Win32cr::Foundation::HANDLE, lpName : Win32cr::Foundation::PWSTR, lpHostName : Win32cr::Foundation::PWSTR, lpComputerName : Win32cr::Foundation::PWSTR, dwFlags : UInt32, pGPOList : Win32cr::System::GroupPolicy::GROUP_POLICY_OBJECTW**) : Win32cr::Foundation::BOOL
    C.GetGPOListW(hToken, lpName, lpHostName, lpComputerName, dwFlags, pGPOList)
  end

  def freeGPOListA(pGPOList : Win32cr::System::GroupPolicy::GROUP_POLICY_OBJECTA*) : Win32cr::Foundation::BOOL
    C.FreeGPOListA(pGPOList)
  end

  def freeGPOListW(pGPOList : Win32cr::System::GroupPolicy::GROUP_POLICY_OBJECTW*) : Win32cr::Foundation::BOOL
    C.FreeGPOListW(pGPOList)
  end

  def getAppliedGPOListA(dwFlags : UInt32, pMachineName : Win32cr::Foundation::PSTR, pSidUser : Win32cr::Foundation::PSID, pGuidExtension : LibC::GUID*, ppGPOList : Win32cr::System::GroupPolicy::GROUP_POLICY_OBJECTA**) : UInt32
    C.GetAppliedGPOListA(dwFlags, pMachineName, pSidUser, pGuidExtension, ppGPOList)
  end

  def getAppliedGPOListW(dwFlags : UInt32, pMachineName : Win32cr::Foundation::PWSTR, pSidUser : Win32cr::Foundation::PSID, pGuidExtension : LibC::GUID*, ppGPOList : Win32cr::System::GroupPolicy::GROUP_POLICY_OBJECTW**) : UInt32
    C.GetAppliedGPOListW(dwFlags, pMachineName, pSidUser, pGuidExtension, ppGPOList)
  end

  def processGroupPolicyCompleted(extensionId : LibC::GUID*, pAsyncHandle : LibC::UIntPtrT, dwStatus : UInt32) : UInt32
    C.ProcessGroupPolicyCompleted(extensionId, pAsyncHandle, dwStatus)
  end

  def processGroupPolicyCompletedEx(extensionId : LibC::GUID*, pAsyncHandle : LibC::UIntPtrT, dwStatus : UInt32, rsop_status : Win32cr::Foundation::HRESULT) : UInt32
    C.ProcessGroupPolicyCompletedEx(extensionId, pAsyncHandle, dwStatus, rsop_status)
  end

  def rsopAccessCheckByType(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, pPrincipalSelfSid : Win32cr::Foundation::PSID, pRsopToken : Void*, dwDesiredAccessMask : UInt32, pObjectTypeList : Win32cr::Security::OBJECT_TYPE_LIST*, object_type_list_length : UInt32, pGenericMapping : Win32cr::Security::GENERIC_MAPPING*, pPrivilegeSet : Win32cr::Security::PRIVILEGE_SET*, pdwPrivilegeSetLength : UInt32*, pdwGrantedAccessMask : UInt32*, pbAccessStatus : Int32*) : Win32cr::Foundation::HRESULT
    C.RsopAccessCheckByType(pSecurityDescriptor, pPrincipalSelfSid, pRsopToken, dwDesiredAccessMask, pObjectTypeList, object_type_list_length, pGenericMapping, pPrivilegeSet, pdwPrivilegeSetLength, pdwGrantedAccessMask, pbAccessStatus)
  end

  def rsopFileAccessCheck(pszFileName : Win32cr::Foundation::PWSTR, pRsopToken : Void*, dwDesiredAccessMask : UInt32, pdwGrantedAccessMask : UInt32*, pbAccessStatus : Int32*) : Win32cr::Foundation::HRESULT
    C.RsopFileAccessCheck(pszFileName, pRsopToken, dwDesiredAccessMask, pdwGrantedAccessMask, pbAccessStatus)
  end

  def rsopSetPolicySettingStatus(dwFlags : UInt32, pServices : Void*, pSettingInstance : Void*, nInfo : UInt32, pStatus : Win32cr::System::GroupPolicy::POLICYSETTINGSTATUSINFO*) : Win32cr::Foundation::HRESULT
    C.RsopSetPolicySettingStatus(dwFlags, pServices, pSettingInstance, nInfo, pStatus)
  end

  def rsopResetPolicySettingStatus(dwFlags : UInt32, pServices : Void*, pSettingInstance : Void*) : Win32cr::Foundation::HRESULT
    C.RsopResetPolicySettingStatus(dwFlags, pServices, pSettingInstance)
  end

  def generateGPNotification(bMachine : Win32cr::Foundation::BOOL, lpwszMgmtProduct : Win32cr::Foundation::PWSTR, dwMgmtProductOptions : UInt32) : UInt32
    C.GenerateGPNotification(bMachine, lpwszMgmtProduct, dwMgmtProductOptions)
  end

  def installApplication(pInstallInfo : Win32cr::System::GroupPolicy::INSTALLDATA*) : UInt32
    C.InstallApplication(pInstallInfo)
  end

  def uninstallApplication(product_code : Win32cr::Foundation::PWSTR, dwStatus : UInt32) : UInt32
    C.UninstallApplication(product_code, dwStatus)
  end

  def commandLineFromMsiDescriptor(descriptor : Win32cr::Foundation::PWSTR, command_line : UInt16*, command_line_length : UInt32*) : UInt32
    C.CommandLineFromMsiDescriptor(descriptor, command_line, command_line_length)
  end

  def getManagedApplications(pCategory : LibC::GUID*, dwQueryFlags : UInt32, dwInfoLevel : UInt32, pdwApps : UInt32*, prgManagedApps : Win32cr::System::GroupPolicy::MANAGEDAPPLICATION**) : UInt32
    C.GetManagedApplications(pCategory, dwQueryFlags, dwInfoLevel, pdwApps, prgManagedApps)
  end

  def getLocalManagedApplications(bUserApps : Win32cr::Foundation::BOOL, pdwApps : UInt32*, prgLocalApps : Win32cr::System::GroupPolicy::LOCALMANAGEDAPPLICATION**) : UInt32
    C.GetLocalManagedApplications(bUserApps, pdwApps, prgLocalApps)
  end

  def getLocalManagedApplicationData(product_code : Win32cr::Foundation::PWSTR, display_name : Win32cr::Foundation::PWSTR*, support_url : Win32cr::Foundation::PWSTR*) : Void
    C.GetLocalManagedApplicationData(product_code, display_name, support_url)
  end

  def getManagedApplicationCategories(dwReserved : UInt32, pAppCategory : Win32cr::UI::Shell::APPCATEGORYINFOLIST*) : UInt32
    C.GetManagedApplicationCategories(dwReserved, pAppCategory)
  end

  def createGPOLink(lpGPO : Win32cr::Foundation::PWSTR, lpContainer : Win32cr::Foundation::PWSTR, fHighPriority : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
    C.CreateGPOLink(lpGPO, lpContainer, fHighPriority)
  end

  def deleteGPOLink(lpGPO : Win32cr::Foundation::PWSTR, lpContainer : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.DeleteGPOLink(lpGPO, lpContainer)
  end

  def deleteAllGPOLinks(lpContainer : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.DeleteAllGPOLinks(lpContainer)
  end

  def browseForGPO(lpBrowseInfo : Win32cr::System::GroupPolicy::GPOBROWSEINFO*) : Win32cr::Foundation::HRESULT
    C.BrowseForGPO(lpBrowseInfo)
  end

  def importRSoPData(lpNameSpace : Win32cr::Foundation::PWSTR, lpFileName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.ImportRSoPData(lpNameSpace, lpFileName)
  end

  def exportRSoPData(lpNameSpace : Win32cr::Foundation::PWSTR, lpFileName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.ExportRSoPData(lpNameSpace, lpFileName)
  end

  @[Link("userenv")]
  @[Link("advapi32")]
  @[Link("gpedit")]
  lib C
    # :nodoc:
    fun RefreshPolicy(bMachine : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun RefreshPolicyEx(bMachine : Win32cr::Foundation::BOOL, dwOptions : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun EnterCriticalPolicySection(bMachine : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun LeaveCriticalPolicySection(hSection : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun RegisterGPNotification(hEvent : Win32cr::Foundation::HANDLE, bMachine : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun UnregisterGPNotification(hEvent : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetGPOListA(hToken : Win32cr::Foundation::HANDLE, lpName : Win32cr::Foundation::PSTR, lpHostName : Win32cr::Foundation::PSTR, lpComputerName : Win32cr::Foundation::PSTR, dwFlags : UInt32, pGPOList : Win32cr::System::GroupPolicy::GROUP_POLICY_OBJECTA**) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetGPOListW(hToken : Win32cr::Foundation::HANDLE, lpName : Win32cr::Foundation::PWSTR, lpHostName : Win32cr::Foundation::PWSTR, lpComputerName : Win32cr::Foundation::PWSTR, dwFlags : UInt32, pGPOList : Win32cr::System::GroupPolicy::GROUP_POLICY_OBJECTW**) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun FreeGPOListA(pGPOList : Win32cr::System::GroupPolicy::GROUP_POLICY_OBJECTA*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun FreeGPOListW(pGPOList : Win32cr::System::GroupPolicy::GROUP_POLICY_OBJECTW*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetAppliedGPOListA(dwFlags : UInt32, pMachineName : Win32cr::Foundation::PSTR, pSidUser : Win32cr::Foundation::PSID, pGuidExtension : LibC::GUID*, ppGPOList : Win32cr::System::GroupPolicy::GROUP_POLICY_OBJECTA**) : UInt32

    # :nodoc:
    fun GetAppliedGPOListW(dwFlags : UInt32, pMachineName : Win32cr::Foundation::PWSTR, pSidUser : Win32cr::Foundation::PSID, pGuidExtension : LibC::GUID*, ppGPOList : Win32cr::System::GroupPolicy::GROUP_POLICY_OBJECTW**) : UInt32

    # :nodoc:
    fun ProcessGroupPolicyCompleted(extensionId : LibC::GUID*, pAsyncHandle : LibC::UIntPtrT, dwStatus : UInt32) : UInt32

    # :nodoc:
    fun ProcessGroupPolicyCompletedEx(extensionId : LibC::GUID*, pAsyncHandle : LibC::UIntPtrT, dwStatus : UInt32, rsop_status : Win32cr::Foundation::HRESULT) : UInt32

    # :nodoc:
    fun RsopAccessCheckByType(pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, pPrincipalSelfSid : Win32cr::Foundation::PSID, pRsopToken : Void*, dwDesiredAccessMask : UInt32, pObjectTypeList : Win32cr::Security::OBJECT_TYPE_LIST*, object_type_list_length : UInt32, pGenericMapping : Win32cr::Security::GENERIC_MAPPING*, pPrivilegeSet : Win32cr::Security::PRIVILEGE_SET*, pdwPrivilegeSetLength : UInt32*, pdwGrantedAccessMask : UInt32*, pbAccessStatus : Int32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RsopFileAccessCheck(pszFileName : Win32cr::Foundation::PWSTR, pRsopToken : Void*, dwDesiredAccessMask : UInt32, pdwGrantedAccessMask : UInt32*, pbAccessStatus : Int32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RsopSetPolicySettingStatus(dwFlags : UInt32, pServices : Void*, pSettingInstance : Void*, nInfo : UInt32, pStatus : Win32cr::System::GroupPolicy::POLICYSETTINGSTATUSINFO*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RsopResetPolicySettingStatus(dwFlags : UInt32, pServices : Void*, pSettingInstance : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GenerateGPNotification(bMachine : Win32cr::Foundation::BOOL, lpwszMgmtProduct : Win32cr::Foundation::PWSTR, dwMgmtProductOptions : UInt32) : UInt32

    # :nodoc:
    fun InstallApplication(pInstallInfo : Win32cr::System::GroupPolicy::INSTALLDATA*) : UInt32

    # :nodoc:
    fun UninstallApplication(product_code : Win32cr::Foundation::PWSTR, dwStatus : UInt32) : UInt32

    # :nodoc:
    fun CommandLineFromMsiDescriptor(descriptor : Win32cr::Foundation::PWSTR, command_line : UInt16*, command_line_length : UInt32*) : UInt32

    # :nodoc:
    fun GetManagedApplications(pCategory : LibC::GUID*, dwQueryFlags : UInt32, dwInfoLevel : UInt32, pdwApps : UInt32*, prgManagedApps : Win32cr::System::GroupPolicy::MANAGEDAPPLICATION**) : UInt32

    # :nodoc:
    fun GetLocalManagedApplications(bUserApps : Win32cr::Foundation::BOOL, pdwApps : UInt32*, prgLocalApps : Win32cr::System::GroupPolicy::LOCALMANAGEDAPPLICATION**) : UInt32

    # :nodoc:
    fun GetLocalManagedApplicationData(product_code : Win32cr::Foundation::PWSTR, display_name : Win32cr::Foundation::PWSTR*, support_url : Win32cr::Foundation::PWSTR*) : Void

    # :nodoc:
    fun GetManagedApplicationCategories(dwReserved : UInt32, pAppCategory : Win32cr::UI::Shell::APPCATEGORYINFOLIST*) : UInt32

    # :nodoc:
    fun CreateGPOLink(lpGPO : Win32cr::Foundation::PWSTR, lpContainer : Win32cr::Foundation::PWSTR, fHighPriority : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DeleteGPOLink(lpGPO : Win32cr::Foundation::PWSTR, lpContainer : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DeleteAllGPOLinks(lpContainer : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun BrowseForGPO(lpBrowseInfo : Win32cr::System::GroupPolicy::GPOBROWSEINFO*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ImportRSoPData(lpNameSpace : Win32cr::Foundation::PWSTR, lpFileName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ExportRSoPData(lpNameSpace : Win32cr::Foundation::PWSTR, lpFileName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

  end
end