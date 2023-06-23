require "../system/com.cr"
require "../foundation.cr"
require "../system/ole.cr"
require "../system/registry.cr"
require "../system/wmi.cr"
require "../ui/controls.cr"
require "../security.cr"
require "../ui/shell.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:userenv.dll")]
@[Link(ldflags: "/DELAYLOAD:advapi32.dll")]
@[Link(ldflags: "/DELAYLOAD:gpedit.dll")]
{% else %}
@[Link("userenv")]
@[Link("advapi32")]
@[Link("gpedit")]
{% end %}
lib LibWin32
  alias CriticalPolicySectionHandle = LibC::IntPtrT

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

  alias PFNSTATUSMESSAGECALLBACK = Proc(LibC::BOOL, LibC::LPWSTR, UInt32)
  alias PFNPROCESSGROUPPOLICY = Proc(UInt32, LibC::HANDLE, HKEY, GROUP_POLICY_OBJECTA*, GROUP_POLICY_OBJECTA*, LibC::UINT_PTR, LibC::BOOL*, PFNSTATUSMESSAGECALLBACK, UInt32)
  alias PFNPROCESSGROUPPOLICYEX = Proc(UInt32, LibC::HANDLE, HKEY, GROUP_POLICY_OBJECTA*, GROUP_POLICY_OBJECTA*, LibC::UINT_PTR, LibC::BOOL*, PFNSTATUSMESSAGECALLBACK, IWbemServices, HRESULT*, UInt32)
  alias PFNGENERATEGROUPPOLICY = Proc(UInt32, LibC::BOOL*, LibC::LPWSTR, RSOP_TARGET*, RSOP_TARGET*, UInt32)


  enum GPMRSOPMode : Int32
    Rsopunknown = 0
    Rsopplanning = 1
    Rsoplogging = 2
  end

  enum GPMPermissionType : Int32
    Permgpoapply = 65536
    Permgporead = 65792
    Permgpoedit = 65793
    Permgpoeditsecurityanddelete = 65794
    Permgpocustom = 65795
    Permwmifilteredit = 131072
    Permwmifilterfullcontrol = 131073
    Permwmifiltercustom = 131074
    Permsomlink = 1835008
    Permsomlogging = 1573120
    Permsomplanning = 1573376
    Permsomwmicreate = 1049344
    Permsomwmifullcontrol = 1049345
    Permsomgpocreate = 1049600
    Permstartergporead = 197888
    Permstartergpoedit = 197889
    Permstartergpofullcontrol = 197890
    Permstartergpocustom = 197891
    Permsomstartergpocreate = 1049856
  end

  enum GPMSearchProperty : Int32
    Gpopermissions = 0
    Gpoeffectivepermissions = 1
    Gpodisplayname = 2
    Gpowmifilter = 3
    Gpoid = 4
    Gpocomputerextensions = 5
    Gpouserextensions = 6
    Somlinks = 7
    Gpodomain = 8
    Backupmostrecent = 9
    Startergpopermissions = 10
    Startergpoeffectivepermissions = 11
    Startergpodisplayname = 12
    Startergpoid = 13
    Startergpodomain = 14
  end

  enum GPMSearchOperation : Int32
    Opequals = 0
    Opcontains = 1
    Opnotcontains = 2
    Opnotequals = 3
  end

  enum GPMReportType : Int32
    Repxml = 0
    Rephtml = 1
    Repinfraxml = 2
    Repinfrarefreshxml = 3
    Repclienthealthxml = 4
    Repclienthealthrefreshxml = 5
  end

  enum GPMEntryType : Int32
    Typeuser = 0
    Typecomputer = 1
    Typelocalgroup = 2
    Typeglobalgroup = 3
    Typeuniversalgroup = 4
    Typeuncpath = 5
    Typeunknown = 6
  end

  enum GPMDestinationOption : Int32
    Opdestinationsameassource = 0
    Opdestinationnone = 1
    Opdestinationbyrelativename = 2
    Opdestinationset = 3
  end

  enum GPMReportingOptions : Int32
    Opreportlegacy = 0
    Opreportcomments = 1
  end

  enum GPMSOMType : Int32
    Somsite = 0
    Somdomain = 1
    Somou = 2
  end

  enum GPMBackupType : Int32
    Typegpo = 0
    Typestartergpo = 1
  end

  enum GPMStarterGPOType : Int32
    Typesystem = 0
    Typecustom = 1
  end

  enum GPO_LINK : Int32
    GPLinkUnknown = 0
    GPLinkMachine = 1
    GPLinkSite = 2
    GPLinkDomain = 3
    GPLinkOrganizationalUnit = 4
  end

  enum SETTINGSTATUS : Int32
    RSOPUnspecified = 0
    RSOPApplied = 1
    RSOPIgnored = 2
    RSOPFailed = 3
    RSOPSubsettingFailed = 4
  end

  enum INSTALLSPECTYPE : Int32
    APPNAME = 1
    FILEEXT = 2
    PROGID = 3
    COMCLASS = 4
  end

  enum APPSTATE : Int32
    ABSENT = 0
    ASSIGNED = 1
    PUBLISHED = 2
  end

  enum GROUP_POLICY_OBJECT_TYPE : Int32
    GPOTypeLocal = 0
    GPOTypeRemote = 1
    GPOTypeDS = 2
    GPOTypeLocalUser = 3
    GPOTypeLocalGroup = 4
  end

  enum GROUP_POLICY_HINT_TYPE : Int32
    GPHintUnknown = 0
    GPHintMachine = 1
    GPHintSite = 2
    GPHintDomain = 3
    GPHintOrganizationalUnit = 4
  end

  union INSTALLSPEC
    app_name : INSTALLSPEC_AppName_e__Struct
    file_ext : LibC::LPWSTR
    prog_id : LibC::LPWSTR
    com_class : INSTALLSPEC_COMClass_e__Struct
  end

  struct GROUP_POLICY_OBJECTA
    dw_options : UInt32
    dw_version : UInt32
    lp_ds_path : PSTR
    lp_file_sys_path : PSTR
    lp_display_name : PSTR
    sz_gpo_name : CHAR[50]*
    gpo_link : GPO_LINK
    l_param : LPARAM
    p_next : GROUP_POLICY_OBJECTA*
    p_prev : GROUP_POLICY_OBJECTA*
    lp_extensions : PSTR
    l_param2 : LPARAM
    lp_link : PSTR
  end
  struct GROUP_POLICY_OBJECTW
    dw_options : UInt32
    dw_version : UInt32
    lp_ds_path : LibC::LPWSTR
    lp_file_sys_path : LibC::LPWSTR
    lp_display_name : LibC::LPWSTR
    sz_gpo_name : Char[50]*
    gpo_link : GPO_LINK
    l_param : LPARAM
    p_next : GROUP_POLICY_OBJECTW*
    p_prev : GROUP_POLICY_OBJECTW*
    lp_extensions : LibC::LPWSTR
    l_param2 : LPARAM
    lp_link : LibC::LPWSTR
  end
  struct RSOP_TARGET
    pwsz_account_name : LibC::LPWSTR
    pwsz_new_som : LibC::LPWSTR
    psa_security_groups : SAFEARRAY*
    p_rsop_token : Void*
    p_gpo_list : GROUP_POLICY_OBJECTA*
    p_wbem_services : IWbemServices
  end
  struct POLICYSETTINGSTATUSINFO
    sz_key : LibC::LPWSTR
    sz_event_source : LibC::LPWSTR
    sz_event_log_name : LibC::LPWSTR
    dw_event_id : UInt32
    dw_error_code : UInt32
    status : SETTINGSTATUS
    time_logged : SYSTEMTIME
  end
  struct INSTALLSPEC_AppName_e__Struct
    name : LibC::LPWSTR
    gpo_id : Guid
  end
  struct INSTALLSPEC_COMClass_e__Struct
    clsid : Guid
    cls_ctx : UInt32
  end
  struct INSTALLDATA
    type : INSTALLSPECTYPE
    spec : INSTALLSPEC
  end
  struct LOCALMANAGEDAPPLICATION
    psz_deployment_name : LibC::LPWSTR
    psz_policy_name : LibC::LPWSTR
    psz_product_id : LibC::LPWSTR
    dw_state : UInt32
  end
  struct MANAGEDAPPLICATION
    psz_package_name : LibC::LPWSTR
    psz_publisher : LibC::LPWSTR
    dw_version_hi : UInt32
    dw_version_lo : UInt32
    dw_revision : UInt32
    gpo_id : Guid
    psz_policy_name : LibC::LPWSTR
    product_id : Guid
    language : UInt16
    psz_owner : LibC::LPWSTR
    psz_company : LibC::LPWSTR
    psz_comments : LibC::LPWSTR
    psz_contact : LibC::LPWSTR
    psz_support_url : LibC::LPWSTR
    dw_path_type : UInt32
    b_installed : LibC::BOOL
  end
  struct GPOBROWSEINFO
    dw_size : UInt32
    dw_flags : UInt32
    hwnd_owner : HANDLE
    lp_title : LibC::LPWSTR
    lp_initial_ou : LibC::LPWSTR
    lp_ds_path : LibC::LPWSTR
    dw_ds_path_size : UInt32
    lp_name : LibC::LPWSTR
    dw_name_size : UInt32
    gpo_type : GROUP_POLICY_OBJECT_TYPE
    gpo_hint : GROUP_POLICY_HINT_TYPE
  end


  struct IGPMVTbl
    query_interface : Proc(IGPM*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGPM*, UInt32)
    release : Proc(IGPM*, UInt32)
    get_type_info_count : Proc(IGPM*, UInt32*, HRESULT)
    get_type_info : Proc(IGPM*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IGPM*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IGPM*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_domain : Proc(IGPM*, UInt8*, UInt8*, Int32, IGPMDomain*, HRESULT)
    get_backup_dir : Proc(IGPM*, UInt8*, IGPMBackupDir*, HRESULT)
    get_sites_container : Proc(IGPM*, UInt8*, UInt8*, UInt8*, Int32, IGPMSitesContainer*, HRESULT)
    get_rsop : Proc(IGPM*, GPMRSOPMode, UInt8*, Int32, IGPMRSOP*, HRESULT)
    create_permission : Proc(IGPM*, UInt8*, GPMPermissionType, Int16, IGPMPermission*, HRESULT)
    create_search_criteria : Proc(IGPM*, IGPMSearchCriteria*, HRESULT)
    create_trustee : Proc(IGPM*, UInt8*, IGPMTrustee*, HRESULT)
    get_client_side_extensions : Proc(IGPM*, IGPMCSECollection*, HRESULT)
    get_constants : Proc(IGPM*, IGPMConstants*, HRESULT)
    get_migration_table : Proc(IGPM*, UInt8*, IGPMMigrationTable*, HRESULT)
    create_migration_table : Proc(IGPM*, IGPMMigrationTable*, HRESULT)
    initialize_reporting : Proc(IGPM*, UInt8*, HRESULT)
  end

  IGPM_GUID = "f5fae809-3bd6-4da9-a65e-17665b41d763"
  IID_IGPM = LibC::GUID.new(0xf5fae809_u32, 0x3bd6_u16, 0x4da9_u16, StaticArray[0xa6_u8, 0x5e_u8, 0x17_u8, 0x66_u8, 0x5b_u8, 0x41_u8, 0xd7_u8, 0x63_u8])
  struct IGPM
    lpVtbl : IGPMVTbl*
  end

  struct IGPMDomainVTbl
    query_interface : Proc(IGPMDomain*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGPMDomain*, UInt32)
    release : Proc(IGPMDomain*, UInt32)
    get_type_info_count : Proc(IGPMDomain*, UInt32*, HRESULT)
    get_type_info : Proc(IGPMDomain*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IGPMDomain*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IGPMDomain*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_domain_controller : Proc(IGPMDomain*, UInt8**, HRESULT)
    get_domain : Proc(IGPMDomain*, UInt8**, HRESULT)
    create_gpo : Proc(IGPMDomain*, IGPMGPO*, HRESULT)
    get_gpo : Proc(IGPMDomain*, UInt8*, IGPMGPO*, HRESULT)
    search_gp_os : Proc(IGPMDomain*, IGPMSearchCriteria, IGPMGPOCollection*, HRESULT)
    restore_gpo : Proc(IGPMDomain*, IGPMBackup, Int32, VARIANT*, VARIANT*, IGPMResult*, HRESULT)
    get_som : Proc(IGPMDomain*, UInt8*, IGPMSOM*, HRESULT)
    search_so_ms : Proc(IGPMDomain*, IGPMSearchCriteria, IGPMSOMCollection*, HRESULT)
    get_wmi_filter : Proc(IGPMDomain*, UInt8*, IGPMWMIFilter*, HRESULT)
    search_wmi_filters : Proc(IGPMDomain*, IGPMSearchCriteria, IGPMWMIFilterCollection*, HRESULT)
  end

  IGPMDomain_GUID = "6b21cc14-5a00-4f44-a738-feec8a94c7e3"
  IID_IGPMDomain = LibC::GUID.new(0x6b21cc14_u32, 0x5a00_u16, 0x4f44_u16, StaticArray[0xa7_u8, 0x38_u8, 0xfe_u8, 0xec_u8, 0x8a_u8, 0x94_u8, 0xc7_u8, 0xe3_u8])
  struct IGPMDomain
    lpVtbl : IGPMDomainVTbl*
  end

  struct IGPMBackupDirVTbl
    query_interface : Proc(IGPMBackupDir*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGPMBackupDir*, UInt32)
    release : Proc(IGPMBackupDir*, UInt32)
    get_type_info_count : Proc(IGPMBackupDir*, UInt32*, HRESULT)
    get_type_info : Proc(IGPMBackupDir*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IGPMBackupDir*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IGPMBackupDir*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_backup_directory : Proc(IGPMBackupDir*, UInt8**, HRESULT)
    get_backup : Proc(IGPMBackupDir*, UInt8*, IGPMBackup*, HRESULT)
    search_backups : Proc(IGPMBackupDir*, IGPMSearchCriteria, IGPMBackupCollection*, HRESULT)
  end

  IGPMBackupDir_GUID = "b1568bed-0a93-4acc-810f-afe7081019b9"
  IID_IGPMBackupDir = LibC::GUID.new(0xb1568bed_u32, 0xa93_u16, 0x4acc_u16, StaticArray[0x81_u8, 0xf_u8, 0xaf_u8, 0xe7_u8, 0x8_u8, 0x10_u8, 0x19_u8, 0xb9_u8])
  struct IGPMBackupDir
    lpVtbl : IGPMBackupDirVTbl*
  end

  struct IGPMSitesContainerVTbl
    query_interface : Proc(IGPMSitesContainer*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGPMSitesContainer*, UInt32)
    release : Proc(IGPMSitesContainer*, UInt32)
    get_type_info_count : Proc(IGPMSitesContainer*, UInt32*, HRESULT)
    get_type_info : Proc(IGPMSitesContainer*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IGPMSitesContainer*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IGPMSitesContainer*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_domain_controller : Proc(IGPMSitesContainer*, UInt8**, HRESULT)
    get_domain : Proc(IGPMSitesContainer*, UInt8**, HRESULT)
    get_forest : Proc(IGPMSitesContainer*, UInt8**, HRESULT)
    get_site : Proc(IGPMSitesContainer*, UInt8*, IGPMSOM*, HRESULT)
    search_sites : Proc(IGPMSitesContainer*, IGPMSearchCriteria, IGPMSOMCollection*, HRESULT)
  end

  IGPMSitesContainer_GUID = "4725a899-2782-4d27-a6bb-d499246ffd72"
  IID_IGPMSitesContainer = LibC::GUID.new(0x4725a899_u32, 0x2782_u16, 0x4d27_u16, StaticArray[0xa6_u8, 0xbb_u8, 0xd4_u8, 0x99_u8, 0x24_u8, 0x6f_u8, 0xfd_u8, 0x72_u8])
  struct IGPMSitesContainer
    lpVtbl : IGPMSitesContainerVTbl*
  end

  struct IGPMSearchCriteriaVTbl
    query_interface : Proc(IGPMSearchCriteria*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGPMSearchCriteria*, UInt32)
    release : Proc(IGPMSearchCriteria*, UInt32)
    get_type_info_count : Proc(IGPMSearchCriteria*, UInt32*, HRESULT)
    get_type_info : Proc(IGPMSearchCriteria*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IGPMSearchCriteria*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IGPMSearchCriteria*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    add : Proc(IGPMSearchCriteria*, GPMSearchProperty, GPMSearchOperation, VARIANT, HRESULT)
  end

  IGPMSearchCriteria_GUID = "d6f11c42-829b-48d4-83f5-3615b67dfc22"
  IID_IGPMSearchCriteria = LibC::GUID.new(0xd6f11c42_u32, 0x829b_u16, 0x48d4_u16, StaticArray[0x83_u8, 0xf5_u8, 0x36_u8, 0x15_u8, 0xb6_u8, 0x7d_u8, 0xfc_u8, 0x22_u8])
  struct IGPMSearchCriteria
    lpVtbl : IGPMSearchCriteriaVTbl*
  end

  struct IGPMTrusteeVTbl
    query_interface : Proc(IGPMTrustee*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGPMTrustee*, UInt32)
    release : Proc(IGPMTrustee*, UInt32)
    get_type_info_count : Proc(IGPMTrustee*, UInt32*, HRESULT)
    get_type_info : Proc(IGPMTrustee*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IGPMTrustee*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IGPMTrustee*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_trustee_sid : Proc(IGPMTrustee*, UInt8**, HRESULT)
    get_trustee_name : Proc(IGPMTrustee*, UInt8**, HRESULT)
    get_trustee_domain : Proc(IGPMTrustee*, UInt8**, HRESULT)
    get_trustee_ds_path : Proc(IGPMTrustee*, UInt8**, HRESULT)
    get_trustee_type : Proc(IGPMTrustee*, Int32*, HRESULT)
  end

  IGPMTrustee_GUID = "3b466da8-c1a4-4b2a-999a-befcdd56cefb"
  IID_IGPMTrustee = LibC::GUID.new(0x3b466da8_u32, 0xc1a4_u16, 0x4b2a_u16, StaticArray[0x99_u8, 0x9a_u8, 0xbe_u8, 0xfc_u8, 0xdd_u8, 0x56_u8, 0xce_u8, 0xfb_u8])
  struct IGPMTrustee
    lpVtbl : IGPMTrusteeVTbl*
  end

  struct IGPMPermissionVTbl
    query_interface : Proc(IGPMPermission*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGPMPermission*, UInt32)
    release : Proc(IGPMPermission*, UInt32)
    get_type_info_count : Proc(IGPMPermission*, UInt32*, HRESULT)
    get_type_info : Proc(IGPMPermission*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IGPMPermission*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IGPMPermission*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_inherited : Proc(IGPMPermission*, Int16*, HRESULT)
    get_inheritable : Proc(IGPMPermission*, Int16*, HRESULT)
    get_denied : Proc(IGPMPermission*, Int16*, HRESULT)
    get_permission : Proc(IGPMPermission*, GPMPermissionType*, HRESULT)
    get_trustee : Proc(IGPMPermission*, IGPMTrustee*, HRESULT)
  end

  IGPMPermission_GUID = "35ebca40-e1a1-4a02-8905-d79416fb464a"
  IID_IGPMPermission = LibC::GUID.new(0x35ebca40_u32, 0xe1a1_u16, 0x4a02_u16, StaticArray[0x89_u8, 0x5_u8, 0xd7_u8, 0x94_u8, 0x16_u8, 0xfb_u8, 0x46_u8, 0x4a_u8])
  struct IGPMPermission
    lpVtbl : IGPMPermissionVTbl*
  end

  struct IGPMSecurityInfoVTbl
    query_interface : Proc(IGPMSecurityInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGPMSecurityInfo*, UInt32)
    release : Proc(IGPMSecurityInfo*, UInt32)
    get_type_info_count : Proc(IGPMSecurityInfo*, UInt32*, HRESULT)
    get_type_info : Proc(IGPMSecurityInfo*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IGPMSecurityInfo*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IGPMSecurityInfo*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(IGPMSecurityInfo*, Int32*, HRESULT)
    get_item : Proc(IGPMSecurityInfo*, Int32, VARIANT*, HRESULT)
    get__new_enum : Proc(IGPMSecurityInfo*, IEnumVARIANT*, HRESULT)
    add : Proc(IGPMSecurityInfo*, IGPMPermission, HRESULT)
    remove : Proc(IGPMSecurityInfo*, IGPMPermission, HRESULT)
    remove_trustee : Proc(IGPMSecurityInfo*, UInt8*, HRESULT)
  end

  IGPMSecurityInfo_GUID = "b6c31ed4-1c93-4d3e-ae84-eb6d61161b60"
  IID_IGPMSecurityInfo = LibC::GUID.new(0xb6c31ed4_u32, 0x1c93_u16, 0x4d3e_u16, StaticArray[0xae_u8, 0x84_u8, 0xeb_u8, 0x6d_u8, 0x61_u8, 0x16_u8, 0x1b_u8, 0x60_u8])
  struct IGPMSecurityInfo
    lpVtbl : IGPMSecurityInfoVTbl*
  end

  struct IGPMBackupVTbl
    query_interface : Proc(IGPMBackup*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGPMBackup*, UInt32)
    release : Proc(IGPMBackup*, UInt32)
    get_type_info_count : Proc(IGPMBackup*, UInt32*, HRESULT)
    get_type_info : Proc(IGPMBackup*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IGPMBackup*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IGPMBackup*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(IGPMBackup*, UInt8**, HRESULT)
    get_gpoid : Proc(IGPMBackup*, UInt8**, HRESULT)
    get_gpo_domain : Proc(IGPMBackup*, UInt8**, HRESULT)
    get_gpo_display_name : Proc(IGPMBackup*, UInt8**, HRESULT)
    get_timestamp : Proc(IGPMBackup*, Float64*, HRESULT)
    get_comment : Proc(IGPMBackup*, UInt8**, HRESULT)
    get_backup_dir : Proc(IGPMBackup*, UInt8**, HRESULT)
    delete : Proc(IGPMBackup*, HRESULT)
    generate_report : Proc(IGPMBackup*, GPMReportType, VARIANT*, VARIANT*, IGPMResult*, HRESULT)
    generate_report_to_file : Proc(IGPMBackup*, GPMReportType, UInt8*, IGPMResult*, HRESULT)
  end

  IGPMBackup_GUID = "d8a16a35-3b0d-416b-8d02-4df6f95a7119"
  IID_IGPMBackup = LibC::GUID.new(0xd8a16a35_u32, 0x3b0d_u16, 0x416b_u16, StaticArray[0x8d_u8, 0x2_u8, 0x4d_u8, 0xf6_u8, 0xf9_u8, 0x5a_u8, 0x71_u8, 0x19_u8])
  struct IGPMBackup
    lpVtbl : IGPMBackupVTbl*
  end

  struct IGPMBackupCollectionVTbl
    query_interface : Proc(IGPMBackupCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGPMBackupCollection*, UInt32)
    release : Proc(IGPMBackupCollection*, UInt32)
    get_type_info_count : Proc(IGPMBackupCollection*, UInt32*, HRESULT)
    get_type_info : Proc(IGPMBackupCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IGPMBackupCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IGPMBackupCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(IGPMBackupCollection*, Int32*, HRESULT)
    get_item : Proc(IGPMBackupCollection*, Int32, VARIANT*, HRESULT)
    get__new_enum : Proc(IGPMBackupCollection*, IEnumVARIANT*, HRESULT)
  end

  IGPMBackupCollection_GUID = "c786fc0f-26d8-4bab-a745-39ca7e800cac"
  IID_IGPMBackupCollection = LibC::GUID.new(0xc786fc0f_u32, 0x26d8_u16, 0x4bab_u16, StaticArray[0xa7_u8, 0x45_u8, 0x39_u8, 0xca_u8, 0x7e_u8, 0x80_u8, 0xc_u8, 0xac_u8])
  struct IGPMBackupCollection
    lpVtbl : IGPMBackupCollectionVTbl*
  end

  struct IGPMSOMVTbl
    query_interface : Proc(IGPMSOM*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGPMSOM*, UInt32)
    release : Proc(IGPMSOM*, UInt32)
    get_type_info_count : Proc(IGPMSOM*, UInt32*, HRESULT)
    get_type_info : Proc(IGPMSOM*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IGPMSOM*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IGPMSOM*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_gpo_inheritance_blocked : Proc(IGPMSOM*, Int16*, HRESULT)
    put_gpo_inheritance_blocked : Proc(IGPMSOM*, Int16, HRESULT)
    get_name : Proc(IGPMSOM*, UInt8**, HRESULT)
    get_path : Proc(IGPMSOM*, UInt8**, HRESULT)
    create_gpo_link : Proc(IGPMSOM*, Int32, IGPMGPO, IGPMGPOLink*, HRESULT)
    get_type : Proc(IGPMSOM*, GPMSOMType*, HRESULT)
    get_gpo_links : Proc(IGPMSOM*, IGPMGPOLinksCollection*, HRESULT)
    get_inherited_gpo_links : Proc(IGPMSOM*, IGPMGPOLinksCollection*, HRESULT)
    get_security_info : Proc(IGPMSOM*, IGPMSecurityInfo*, HRESULT)
    set_security_info : Proc(IGPMSOM*, IGPMSecurityInfo, HRESULT)
  end

  IGPMSOM_GUID = "c0a7f09e-05a1-4f0c-8158-9e5c33684f6b"
  IID_IGPMSOM = LibC::GUID.new(0xc0a7f09e_u32, 0x5a1_u16, 0x4f0c_u16, StaticArray[0x81_u8, 0x58_u8, 0x9e_u8, 0x5c_u8, 0x33_u8, 0x68_u8, 0x4f_u8, 0x6b_u8])
  struct IGPMSOM
    lpVtbl : IGPMSOMVTbl*
  end

  struct IGPMSOMCollectionVTbl
    query_interface : Proc(IGPMSOMCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGPMSOMCollection*, UInt32)
    release : Proc(IGPMSOMCollection*, UInt32)
    get_type_info_count : Proc(IGPMSOMCollection*, UInt32*, HRESULT)
    get_type_info : Proc(IGPMSOMCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IGPMSOMCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IGPMSOMCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(IGPMSOMCollection*, Int32*, HRESULT)
    get_item : Proc(IGPMSOMCollection*, Int32, VARIANT*, HRESULT)
    get__new_enum : Proc(IGPMSOMCollection*, IEnumVARIANT*, HRESULT)
  end

  IGPMSOMCollection_GUID = "adc1688e-00e4-4495-abba-bed200df0cab"
  IID_IGPMSOMCollection = LibC::GUID.new(0xadc1688e_u32, 0xe4_u16, 0x4495_u16, StaticArray[0xab_u8, 0xba_u8, 0xbe_u8, 0xd2_u8, 0x0_u8, 0xdf_u8, 0xc_u8, 0xab_u8])
  struct IGPMSOMCollection
    lpVtbl : IGPMSOMCollectionVTbl*
  end

  struct IGPMWMIFilterVTbl
    query_interface : Proc(IGPMWMIFilter*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGPMWMIFilter*, UInt32)
    release : Proc(IGPMWMIFilter*, UInt32)
    get_type_info_count : Proc(IGPMWMIFilter*, UInt32*, HRESULT)
    get_type_info : Proc(IGPMWMIFilter*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IGPMWMIFilter*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IGPMWMIFilter*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_path : Proc(IGPMWMIFilter*, UInt8**, HRESULT)
    put_name : Proc(IGPMWMIFilter*, UInt8*, HRESULT)
    get_name : Proc(IGPMWMIFilter*, UInt8**, HRESULT)
    put_description : Proc(IGPMWMIFilter*, UInt8*, HRESULT)
    get_description : Proc(IGPMWMIFilter*, UInt8**, HRESULT)
    get_query_list : Proc(IGPMWMIFilter*, VARIANT*, HRESULT)
    get_security_info : Proc(IGPMWMIFilter*, IGPMSecurityInfo*, HRESULT)
    set_security_info : Proc(IGPMWMIFilter*, IGPMSecurityInfo, HRESULT)
  end

  IGPMWMIFilter_GUID = "ef2ff9b4-3c27-459a-b979-038305cec75d"
  IID_IGPMWMIFilter = LibC::GUID.new(0xef2ff9b4_u32, 0x3c27_u16, 0x459a_u16, StaticArray[0xb9_u8, 0x79_u8, 0x3_u8, 0x83_u8, 0x5_u8, 0xce_u8, 0xc7_u8, 0x5d_u8])
  struct IGPMWMIFilter
    lpVtbl : IGPMWMIFilterVTbl*
  end

  struct IGPMWMIFilterCollectionVTbl
    query_interface : Proc(IGPMWMIFilterCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGPMWMIFilterCollection*, UInt32)
    release : Proc(IGPMWMIFilterCollection*, UInt32)
    get_type_info_count : Proc(IGPMWMIFilterCollection*, UInt32*, HRESULT)
    get_type_info : Proc(IGPMWMIFilterCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IGPMWMIFilterCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IGPMWMIFilterCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(IGPMWMIFilterCollection*, Int32*, HRESULT)
    get_item : Proc(IGPMWMIFilterCollection*, Int32, VARIANT*, HRESULT)
    get__new_enum : Proc(IGPMWMIFilterCollection*, IEnumVARIANT*, HRESULT)
  end

  IGPMWMIFilterCollection_GUID = "5782d582-1a36-4661-8a94-c3c32551945b"
  IID_IGPMWMIFilterCollection = LibC::GUID.new(0x5782d582_u32, 0x1a36_u16, 0x4661_u16, StaticArray[0x8a_u8, 0x94_u8, 0xc3_u8, 0xc3_u8, 0x25_u8, 0x51_u8, 0x94_u8, 0x5b_u8])
  struct IGPMWMIFilterCollection
    lpVtbl : IGPMWMIFilterCollectionVTbl*
  end

  struct IGPMRSOPVTbl
    query_interface : Proc(IGPMRSOP*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGPMRSOP*, UInt32)
    release : Proc(IGPMRSOP*, UInt32)
    get_type_info_count : Proc(IGPMRSOP*, UInt32*, HRESULT)
    get_type_info : Proc(IGPMRSOP*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IGPMRSOP*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IGPMRSOP*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_mode : Proc(IGPMRSOP*, GPMRSOPMode*, HRESULT)
    get_namespace : Proc(IGPMRSOP*, UInt8**, HRESULT)
    put_logging_computer : Proc(IGPMRSOP*, UInt8*, HRESULT)
    get_logging_computer : Proc(IGPMRSOP*, UInt8**, HRESULT)
    put_logging_user : Proc(IGPMRSOP*, UInt8*, HRESULT)
    get_logging_user : Proc(IGPMRSOP*, UInt8**, HRESULT)
    put_logging_flags : Proc(IGPMRSOP*, Int32, HRESULT)
    get_logging_flags : Proc(IGPMRSOP*, Int32*, HRESULT)
    put_planning_flags : Proc(IGPMRSOP*, Int32, HRESULT)
    get_planning_flags : Proc(IGPMRSOP*, Int32*, HRESULT)
    put_planning_domain_controller : Proc(IGPMRSOP*, UInt8*, HRESULT)
    get_planning_domain_controller : Proc(IGPMRSOP*, UInt8**, HRESULT)
    put_planning_site_name : Proc(IGPMRSOP*, UInt8*, HRESULT)
    get_planning_site_name : Proc(IGPMRSOP*, UInt8**, HRESULT)
    put_planning_user : Proc(IGPMRSOP*, UInt8*, HRESULT)
    get_planning_user : Proc(IGPMRSOP*, UInt8**, HRESULT)
    put_planning_user_som : Proc(IGPMRSOP*, UInt8*, HRESULT)
    get_planning_user_som : Proc(IGPMRSOP*, UInt8**, HRESULT)
    put_planning_user_wmi_filters : Proc(IGPMRSOP*, VARIANT, HRESULT)
    get_planning_user_wmi_filters : Proc(IGPMRSOP*, VARIANT*, HRESULT)
    put_planning_user_security_groups : Proc(IGPMRSOP*, VARIANT, HRESULT)
    get_planning_user_security_groups : Proc(IGPMRSOP*, VARIANT*, HRESULT)
    put_planning_computer : Proc(IGPMRSOP*, UInt8*, HRESULT)
    get_planning_computer : Proc(IGPMRSOP*, UInt8**, HRESULT)
    put_planning_computer_som : Proc(IGPMRSOP*, UInt8*, HRESULT)
    get_planning_computer_som : Proc(IGPMRSOP*, UInt8**, HRESULT)
    put_planning_computer_wmi_filters : Proc(IGPMRSOP*, VARIANT, HRESULT)
    get_planning_computer_wmi_filters : Proc(IGPMRSOP*, VARIANT*, HRESULT)
    put_planning_computer_security_groups : Proc(IGPMRSOP*, VARIANT, HRESULT)
    get_planning_computer_security_groups : Proc(IGPMRSOP*, VARIANT*, HRESULT)
    logging_enumerate_users : Proc(IGPMRSOP*, VARIANT*, HRESULT)
    create_query_results : Proc(IGPMRSOP*, HRESULT)
    release_query_results : Proc(IGPMRSOP*, HRESULT)
    generate_report : Proc(IGPMRSOP*, GPMReportType, VARIANT*, VARIANT*, IGPMResult*, HRESULT)
    generate_report_to_file : Proc(IGPMRSOP*, GPMReportType, UInt8*, IGPMResult*, HRESULT)
  end

  IGPMRSOP_GUID = "49ed785a-3237-4ff2-b1f0-fdf5a8d5a1ee"
  IID_IGPMRSOP = LibC::GUID.new(0x49ed785a_u32, 0x3237_u16, 0x4ff2_u16, StaticArray[0xb1_u8, 0xf0_u8, 0xfd_u8, 0xf5_u8, 0xa8_u8, 0xd5_u8, 0xa1_u8, 0xee_u8])
  struct IGPMRSOP
    lpVtbl : IGPMRSOPVTbl*
  end

  struct IGPMGPOVTbl
    query_interface : Proc(IGPMGPO*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGPMGPO*, UInt32)
    release : Proc(IGPMGPO*, UInt32)
    get_type_info_count : Proc(IGPMGPO*, UInt32*, HRESULT)
    get_type_info : Proc(IGPMGPO*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IGPMGPO*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IGPMGPO*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_display_name : Proc(IGPMGPO*, UInt8**, HRESULT)
    put_display_name : Proc(IGPMGPO*, UInt8*, HRESULT)
    get_path : Proc(IGPMGPO*, UInt8**, HRESULT)
    get_id : Proc(IGPMGPO*, UInt8**, HRESULT)
    get_domain_name : Proc(IGPMGPO*, UInt8**, HRESULT)
    get_creation_time : Proc(IGPMGPO*, Float64*, HRESULT)
    get_modification_time : Proc(IGPMGPO*, Float64*, HRESULT)
    get_user_ds_version_number : Proc(IGPMGPO*, Int32*, HRESULT)
    get_computer_ds_version_number : Proc(IGPMGPO*, Int32*, HRESULT)
    get_user_sysvol_version_number : Proc(IGPMGPO*, Int32*, HRESULT)
    get_computer_sysvol_version_number : Proc(IGPMGPO*, Int32*, HRESULT)
    get_wmi_filter : Proc(IGPMGPO*, IGPMWMIFilter*, HRESULT)
    set_wmi_filter : Proc(IGPMGPO*, IGPMWMIFilter, HRESULT)
    set_user_enabled : Proc(IGPMGPO*, Int16, HRESULT)
    set_computer_enabled : Proc(IGPMGPO*, Int16, HRESULT)
    is_user_enabled : Proc(IGPMGPO*, Int16*, HRESULT)
    is_computer_enabled : Proc(IGPMGPO*, Int16*, HRESULT)
    get_security_info : Proc(IGPMGPO*, IGPMSecurityInfo*, HRESULT)
    set_security_info : Proc(IGPMGPO*, IGPMSecurityInfo, HRESULT)
    delete : Proc(IGPMGPO*, HRESULT)
    backup : Proc(IGPMGPO*, UInt8*, UInt8*, VARIANT*, VARIANT*, IGPMResult*, HRESULT)
    import : Proc(IGPMGPO*, Int32, IGPMBackup, VARIANT*, VARIANT*, VARIANT*, IGPMResult*, HRESULT)
    generate_report : Proc(IGPMGPO*, GPMReportType, VARIANT*, VARIANT*, IGPMResult*, HRESULT)
    generate_report_to_file : Proc(IGPMGPO*, GPMReportType, UInt8*, IGPMResult*, HRESULT)
    copy_to : Proc(IGPMGPO*, Int32, IGPMDomain, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IGPMResult*, HRESULT)
    set_security_descriptor : Proc(IGPMGPO*, Int32, IDispatch, HRESULT)
    get_security_descriptor : Proc(IGPMGPO*, Int32, IDispatch*, HRESULT)
    is_acl_consistent : Proc(IGPMGPO*, Int16*, HRESULT)
    make_acl_consistent : Proc(IGPMGPO*, HRESULT)
  end

  IGPMGPO_GUID = "58cc4352-1ca3-48e5-9864-1da4d6e0d60f"
  IID_IGPMGPO = LibC::GUID.new(0x58cc4352_u32, 0x1ca3_u16, 0x48e5_u16, StaticArray[0x98_u8, 0x64_u8, 0x1d_u8, 0xa4_u8, 0xd6_u8, 0xe0_u8, 0xd6_u8, 0xf_u8])
  struct IGPMGPO
    lpVtbl : IGPMGPOVTbl*
  end

  struct IGPMGPOCollectionVTbl
    query_interface : Proc(IGPMGPOCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGPMGPOCollection*, UInt32)
    release : Proc(IGPMGPOCollection*, UInt32)
    get_type_info_count : Proc(IGPMGPOCollection*, UInt32*, HRESULT)
    get_type_info : Proc(IGPMGPOCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IGPMGPOCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IGPMGPOCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(IGPMGPOCollection*, Int32*, HRESULT)
    get_item : Proc(IGPMGPOCollection*, Int32, VARIANT*, HRESULT)
    get__new_enum : Proc(IGPMGPOCollection*, IEnumVARIANT*, HRESULT)
  end

  IGPMGPOCollection_GUID = "f0f0d5cf-70ca-4c39-9e29-b642f8726c01"
  IID_IGPMGPOCollection = LibC::GUID.new(0xf0f0d5cf_u32, 0x70ca_u16, 0x4c39_u16, StaticArray[0x9e_u8, 0x29_u8, 0xb6_u8, 0x42_u8, 0xf8_u8, 0x72_u8, 0x6c_u8, 0x1_u8])
  struct IGPMGPOCollection
    lpVtbl : IGPMGPOCollectionVTbl*
  end

  struct IGPMGPOLinkVTbl
    query_interface : Proc(IGPMGPOLink*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGPMGPOLink*, UInt32)
    release : Proc(IGPMGPOLink*, UInt32)
    get_type_info_count : Proc(IGPMGPOLink*, UInt32*, HRESULT)
    get_type_info : Proc(IGPMGPOLink*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IGPMGPOLink*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IGPMGPOLink*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_gpoid : Proc(IGPMGPOLink*, UInt8**, HRESULT)
    get_gpo_domain : Proc(IGPMGPOLink*, UInt8**, HRESULT)
    get_enabled : Proc(IGPMGPOLink*, Int16*, HRESULT)
    put_enabled : Proc(IGPMGPOLink*, Int16, HRESULT)
    get_enforced : Proc(IGPMGPOLink*, Int16*, HRESULT)
    put_enforced : Proc(IGPMGPOLink*, Int16, HRESULT)
    get_som_link_order : Proc(IGPMGPOLink*, Int32*, HRESULT)
    get_som : Proc(IGPMGPOLink*, IGPMSOM*, HRESULT)
    delete : Proc(IGPMGPOLink*, HRESULT)
  end

  IGPMGPOLink_GUID = "434b99bd-5de7-478a-809c-c251721df70c"
  IID_IGPMGPOLink = LibC::GUID.new(0x434b99bd_u32, 0x5de7_u16, 0x478a_u16, StaticArray[0x80_u8, 0x9c_u8, 0xc2_u8, 0x51_u8, 0x72_u8, 0x1d_u8, 0xf7_u8, 0xc_u8])
  struct IGPMGPOLink
    lpVtbl : IGPMGPOLinkVTbl*
  end

  struct IGPMGPOLinksCollectionVTbl
    query_interface : Proc(IGPMGPOLinksCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGPMGPOLinksCollection*, UInt32)
    release : Proc(IGPMGPOLinksCollection*, UInt32)
    get_type_info_count : Proc(IGPMGPOLinksCollection*, UInt32*, HRESULT)
    get_type_info : Proc(IGPMGPOLinksCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IGPMGPOLinksCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IGPMGPOLinksCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(IGPMGPOLinksCollection*, Int32*, HRESULT)
    get_item : Proc(IGPMGPOLinksCollection*, Int32, VARIANT*, HRESULT)
    get__new_enum : Proc(IGPMGPOLinksCollection*, IEnumVARIANT*, HRESULT)
  end

  IGPMGPOLinksCollection_GUID = "189d7b68-16bd-4d0d-a2ec-2e6aa2288c7f"
  IID_IGPMGPOLinksCollection = LibC::GUID.new(0x189d7b68_u32, 0x16bd_u16, 0x4d0d_u16, StaticArray[0xa2_u8, 0xec_u8, 0x2e_u8, 0x6a_u8, 0xa2_u8, 0x28_u8, 0x8c_u8, 0x7f_u8])
  struct IGPMGPOLinksCollection
    lpVtbl : IGPMGPOLinksCollectionVTbl*
  end

  struct IGPMCSECollectionVTbl
    query_interface : Proc(IGPMCSECollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGPMCSECollection*, UInt32)
    release : Proc(IGPMCSECollection*, UInt32)
    get_type_info_count : Proc(IGPMCSECollection*, UInt32*, HRESULT)
    get_type_info : Proc(IGPMCSECollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IGPMCSECollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IGPMCSECollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(IGPMCSECollection*, Int32*, HRESULT)
    get_item : Proc(IGPMCSECollection*, Int32, VARIANT*, HRESULT)
    get__new_enum : Proc(IGPMCSECollection*, IEnumVARIANT*, HRESULT)
  end

  IGPMCSECollection_GUID = "2e52a97d-0a4a-4a6f-85db-201622455da0"
  IID_IGPMCSECollection = LibC::GUID.new(0x2e52a97d_u32, 0xa4a_u16, 0x4a6f_u16, StaticArray[0x85_u8, 0xdb_u8, 0x20_u8, 0x16_u8, 0x22_u8, 0x45_u8, 0x5d_u8, 0xa0_u8])
  struct IGPMCSECollection
    lpVtbl : IGPMCSECollectionVTbl*
  end

  struct IGPMClientSideExtensionVTbl
    query_interface : Proc(IGPMClientSideExtension*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGPMClientSideExtension*, UInt32)
    release : Proc(IGPMClientSideExtension*, UInt32)
    get_type_info_count : Proc(IGPMClientSideExtension*, UInt32*, HRESULT)
    get_type_info : Proc(IGPMClientSideExtension*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IGPMClientSideExtension*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IGPMClientSideExtension*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(IGPMClientSideExtension*, UInt8**, HRESULT)
    get_display_name : Proc(IGPMClientSideExtension*, UInt8**, HRESULT)
    is_user_enabled : Proc(IGPMClientSideExtension*, Int16*, HRESULT)
    is_computer_enabled : Proc(IGPMClientSideExtension*, Int16*, HRESULT)
  end

  IGPMClientSideExtension_GUID = "69da7488-b8db-415e-9266-901be4d49928"
  IID_IGPMClientSideExtension = LibC::GUID.new(0x69da7488_u32, 0xb8db_u16, 0x415e_u16, StaticArray[0x92_u8, 0x66_u8, 0x90_u8, 0x1b_u8, 0xe4_u8, 0xd4_u8, 0x99_u8, 0x28_u8])
  struct IGPMClientSideExtension
    lpVtbl : IGPMClientSideExtensionVTbl*
  end

  struct IGPMAsyncCancelVTbl
    query_interface : Proc(IGPMAsyncCancel*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGPMAsyncCancel*, UInt32)
    release : Proc(IGPMAsyncCancel*, UInt32)
    get_type_info_count : Proc(IGPMAsyncCancel*, UInt32*, HRESULT)
    get_type_info : Proc(IGPMAsyncCancel*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IGPMAsyncCancel*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IGPMAsyncCancel*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    cancel : Proc(IGPMAsyncCancel*, HRESULT)
  end

  IGPMAsyncCancel_GUID = "ddc67754-be67-4541-8166-f48166868c9c"
  IID_IGPMAsyncCancel = LibC::GUID.new(0xddc67754_u32, 0xbe67_u16, 0x4541_u16, StaticArray[0x81_u8, 0x66_u8, 0xf4_u8, 0x81_u8, 0x66_u8, 0x86_u8, 0x8c_u8, 0x9c_u8])
  struct IGPMAsyncCancel
    lpVtbl : IGPMAsyncCancelVTbl*
  end

  struct IGPMAsyncProgressVTbl
    query_interface : Proc(IGPMAsyncProgress*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGPMAsyncProgress*, UInt32)
    release : Proc(IGPMAsyncProgress*, UInt32)
    get_type_info_count : Proc(IGPMAsyncProgress*, UInt32*, HRESULT)
    get_type_info : Proc(IGPMAsyncProgress*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IGPMAsyncProgress*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IGPMAsyncProgress*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    status : Proc(IGPMAsyncProgress*, Int32, Int32, HRESULT, VARIANT*, IGPMStatusMsgCollection, HRESULT)
  end

  IGPMAsyncProgress_GUID = "6aac29f8-5948-4324-bf70-423818942dbc"
  IID_IGPMAsyncProgress = LibC::GUID.new(0x6aac29f8_u32, 0x5948_u16, 0x4324_u16, StaticArray[0xbf_u8, 0x70_u8, 0x42_u8, 0x38_u8, 0x18_u8, 0x94_u8, 0x2d_u8, 0xbc_u8])
  struct IGPMAsyncProgress
    lpVtbl : IGPMAsyncProgressVTbl*
  end

  struct IGPMStatusMsgCollectionVTbl
    query_interface : Proc(IGPMStatusMsgCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGPMStatusMsgCollection*, UInt32)
    release : Proc(IGPMStatusMsgCollection*, UInt32)
    get_type_info_count : Proc(IGPMStatusMsgCollection*, UInt32*, HRESULT)
    get_type_info : Proc(IGPMStatusMsgCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IGPMStatusMsgCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IGPMStatusMsgCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(IGPMStatusMsgCollection*, Int32*, HRESULT)
    get_item : Proc(IGPMStatusMsgCollection*, Int32, VARIANT*, HRESULT)
    get__new_enum : Proc(IGPMStatusMsgCollection*, IEnumVARIANT*, HRESULT)
  end

  IGPMStatusMsgCollection_GUID = "9b6e1af0-1a92-40f3-a59d-f36ac1f728b7"
  IID_IGPMStatusMsgCollection = LibC::GUID.new(0x9b6e1af0_u32, 0x1a92_u16, 0x40f3_u16, StaticArray[0xa5_u8, 0x9d_u8, 0xf3_u8, 0x6a_u8, 0xc1_u8, 0xf7_u8, 0x28_u8, 0xb7_u8])
  struct IGPMStatusMsgCollection
    lpVtbl : IGPMStatusMsgCollectionVTbl*
  end

  struct IGPMStatusMessageVTbl
    query_interface : Proc(IGPMStatusMessage*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGPMStatusMessage*, UInt32)
    release : Proc(IGPMStatusMessage*, UInt32)
    get_type_info_count : Proc(IGPMStatusMessage*, UInt32*, HRESULT)
    get_type_info : Proc(IGPMStatusMessage*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IGPMStatusMessage*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IGPMStatusMessage*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_object_path : Proc(IGPMStatusMessage*, UInt8**, HRESULT)
    error_code : Proc(IGPMStatusMessage*, HRESULT)
    get_extension_name : Proc(IGPMStatusMessage*, UInt8**, HRESULT)
    get_settings_name : Proc(IGPMStatusMessage*, UInt8**, HRESULT)
    operation_code : Proc(IGPMStatusMessage*, HRESULT)
    get_message : Proc(IGPMStatusMessage*, UInt8**, HRESULT)
  end

  IGPMStatusMessage_GUID = "8496c22f-f3de-4a1f-8f58-603caaa93d7b"
  IID_IGPMStatusMessage = LibC::GUID.new(0x8496c22f_u32, 0xf3de_u16, 0x4a1f_u16, StaticArray[0x8f_u8, 0x58_u8, 0x60_u8, 0x3c_u8, 0xaa_u8, 0xa9_u8, 0x3d_u8, 0x7b_u8])
  struct IGPMStatusMessage
    lpVtbl : IGPMStatusMessageVTbl*
  end

  struct IGPMConstantsVTbl
    query_interface : Proc(IGPMConstants*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGPMConstants*, UInt32)
    release : Proc(IGPMConstants*, UInt32)
    get_type_info_count : Proc(IGPMConstants*, UInt32*, HRESULT)
    get_type_info : Proc(IGPMConstants*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IGPMConstants*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IGPMConstants*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_perm_gpo_apply : Proc(IGPMConstants*, GPMPermissionType*, HRESULT)
    get_perm_gpo_read : Proc(IGPMConstants*, GPMPermissionType*, HRESULT)
    get_perm_gpo_edit : Proc(IGPMConstants*, GPMPermissionType*, HRESULT)
    get_perm_gpo_edit_security_and_delete : Proc(IGPMConstants*, GPMPermissionType*, HRESULT)
    get_perm_gpo_custom : Proc(IGPMConstants*, GPMPermissionType*, HRESULT)
    get_perm_wmi_filter_edit : Proc(IGPMConstants*, GPMPermissionType*, HRESULT)
    get_perm_wmi_filter_full_control : Proc(IGPMConstants*, GPMPermissionType*, HRESULT)
    get_perm_wmi_filter_custom : Proc(IGPMConstants*, GPMPermissionType*, HRESULT)
    get_perm_som_link : Proc(IGPMConstants*, GPMPermissionType*, HRESULT)
    get_perm_som_logging : Proc(IGPMConstants*, GPMPermissionType*, HRESULT)
    get_perm_som_planning : Proc(IGPMConstants*, GPMPermissionType*, HRESULT)
    get_perm_somgpo_create : Proc(IGPMConstants*, GPMPermissionType*, HRESULT)
    get_perm_somwmi_create : Proc(IGPMConstants*, GPMPermissionType*, HRESULT)
    get_perm_somwmi_full_control : Proc(IGPMConstants*, GPMPermissionType*, HRESULT)
    get_search_property_gpo_permissions : Proc(IGPMConstants*, GPMSearchProperty*, HRESULT)
    get_search_property_gpo_effective_permissions : Proc(IGPMConstants*, GPMSearchProperty*, HRESULT)
    get_search_property_gpo_display_name : Proc(IGPMConstants*, GPMSearchProperty*, HRESULT)
    get_search_property_gpowmi_filter : Proc(IGPMConstants*, GPMSearchProperty*, HRESULT)
    get_search_property_gpoid : Proc(IGPMConstants*, GPMSearchProperty*, HRESULT)
    get_search_property_gpo_computer_extensions : Proc(IGPMConstants*, GPMSearchProperty*, HRESULT)
    get_search_property_gpo_user_extensions : Proc(IGPMConstants*, GPMSearchProperty*, HRESULT)
    get_search_property_som_links : Proc(IGPMConstants*, GPMSearchProperty*, HRESULT)
    get_search_property_gpo_domain : Proc(IGPMConstants*, GPMSearchProperty*, HRESULT)
    get_search_property_backup_most_recent : Proc(IGPMConstants*, GPMSearchProperty*, HRESULT)
    get_search_op_equals : Proc(IGPMConstants*, GPMSearchOperation*, HRESULT)
    get_search_op_contains : Proc(IGPMConstants*, GPMSearchOperation*, HRESULT)
    get_search_op_not_contains : Proc(IGPMConstants*, GPMSearchOperation*, HRESULT)
    get_search_op_not_equals : Proc(IGPMConstants*, GPMSearchOperation*, HRESULT)
    get_use_pdc : Proc(IGPMConstants*, Int32*, HRESULT)
    get_use_any_dc : Proc(IGPMConstants*, Int32*, HRESULT)
    get_do_not_use_w2_kdc : Proc(IGPMConstants*, Int32*, HRESULT)
    get_som_site : Proc(IGPMConstants*, GPMSOMType*, HRESULT)
    get_som_domain : Proc(IGPMConstants*, GPMSOMType*, HRESULT)
    get_somou : Proc(IGPMConstants*, GPMSOMType*, HRESULT)
    get_security_flags : Proc(IGPMConstants*, Int16, Int16, Int16, Int16, Int32*, HRESULT)
    get_do_not_validate_dc : Proc(IGPMConstants*, Int32*, HRESULT)
    get_report_html : Proc(IGPMConstants*, GPMReportType*, HRESULT)
    get_report_xml : Proc(IGPMConstants*, GPMReportType*, HRESULT)
    get_rsop_mode_unknown : Proc(IGPMConstants*, GPMRSOPMode*, HRESULT)
    get_rsop_mode_planning : Proc(IGPMConstants*, GPMRSOPMode*, HRESULT)
    get_rsop_mode_logging : Proc(IGPMConstants*, GPMRSOPMode*, HRESULT)
    get_entry_type_user : Proc(IGPMConstants*, GPMEntryType*, HRESULT)
    get_entry_type_computer : Proc(IGPMConstants*, GPMEntryType*, HRESULT)
    get_entry_type_local_group : Proc(IGPMConstants*, GPMEntryType*, HRESULT)
    get_entry_type_global_group : Proc(IGPMConstants*, GPMEntryType*, HRESULT)
    get_entry_type_universal_group : Proc(IGPMConstants*, GPMEntryType*, HRESULT)
    get_entry_type_unc_path : Proc(IGPMConstants*, GPMEntryType*, HRESULT)
    get_entry_type_unknown : Proc(IGPMConstants*, GPMEntryType*, HRESULT)
    get_destination_option_same_as_source : Proc(IGPMConstants*, GPMDestinationOption*, HRESULT)
    get_destination_option_none : Proc(IGPMConstants*, GPMDestinationOption*, HRESULT)
    get_destination_option_by_relative_name : Proc(IGPMConstants*, GPMDestinationOption*, HRESULT)
    get_destination_option_set : Proc(IGPMConstants*, GPMDestinationOption*, HRESULT)
    get_migration_table_only : Proc(IGPMConstants*, Int32*, HRESULT)
    get_process_security : Proc(IGPMConstants*, Int32*, HRESULT)
    get_rsop_logging_no_computer : Proc(IGPMConstants*, Int32*, HRESULT)
    get_rsop_logging_no_user : Proc(IGPMConstants*, Int32*, HRESULT)
    get_rsop_planning_assume_slow_link : Proc(IGPMConstants*, Int32*, HRESULT)
    get_rsop_planning_loopback_option : Proc(IGPMConstants*, Int16, Int32*, HRESULT)
    get_rsop_planning_assume_user_wql_filter_true : Proc(IGPMConstants*, Int32*, HRESULT)
    get_rsop_planning_assume_comp_wql_filter_true : Proc(IGPMConstants*, Int32*, HRESULT)
  end

  IGPMConstants_GUID = "50ef73e6-d35c-4c8d-be63-7ea5d2aac5c4"
  IID_IGPMConstants = LibC::GUID.new(0x50ef73e6_u32, 0xd35c_u16, 0x4c8d_u16, StaticArray[0xbe_u8, 0x63_u8, 0x7e_u8, 0xa5_u8, 0xd2_u8, 0xaa_u8, 0xc5_u8, 0xc4_u8])
  struct IGPMConstants
    lpVtbl : IGPMConstantsVTbl*
  end

  struct IGPMResultVTbl
    query_interface : Proc(IGPMResult*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGPMResult*, UInt32)
    release : Proc(IGPMResult*, UInt32)
    get_type_info_count : Proc(IGPMResult*, UInt32*, HRESULT)
    get_type_info : Proc(IGPMResult*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IGPMResult*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IGPMResult*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_status : Proc(IGPMResult*, IGPMStatusMsgCollection*, HRESULT)
    get_result : Proc(IGPMResult*, VARIANT*, HRESULT)
    overall_status : Proc(IGPMResult*, HRESULT)
  end

  IGPMResult_GUID = "86dff7e9-f76f-42ab-9570-cebc6be8a52d"
  IID_IGPMResult = LibC::GUID.new(0x86dff7e9_u32, 0xf76f_u16, 0x42ab_u16, StaticArray[0x95_u8, 0x70_u8, 0xce_u8, 0xbc_u8, 0x6b_u8, 0xe8_u8, 0xa5_u8, 0x2d_u8])
  struct IGPMResult
    lpVtbl : IGPMResultVTbl*
  end

  struct IGPMMapEntryCollectionVTbl
    query_interface : Proc(IGPMMapEntryCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGPMMapEntryCollection*, UInt32)
    release : Proc(IGPMMapEntryCollection*, UInt32)
    get_type_info_count : Proc(IGPMMapEntryCollection*, UInt32*, HRESULT)
    get_type_info : Proc(IGPMMapEntryCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IGPMMapEntryCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IGPMMapEntryCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(IGPMMapEntryCollection*, Int32*, HRESULT)
    get_item : Proc(IGPMMapEntryCollection*, Int32, VARIANT*, HRESULT)
    get__new_enum : Proc(IGPMMapEntryCollection*, IEnumVARIANT*, HRESULT)
  end

  IGPMMapEntryCollection_GUID = "bb0bf49b-e53f-443f-b807-8be22bfb6d42"
  IID_IGPMMapEntryCollection = LibC::GUID.new(0xbb0bf49b_u32, 0xe53f_u16, 0x443f_u16, StaticArray[0xb8_u8, 0x7_u8, 0x8b_u8, 0xe2_u8, 0x2b_u8, 0xfb_u8, 0x6d_u8, 0x42_u8])
  struct IGPMMapEntryCollection
    lpVtbl : IGPMMapEntryCollectionVTbl*
  end

  struct IGPMMapEntryVTbl
    query_interface : Proc(IGPMMapEntry*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGPMMapEntry*, UInt32)
    release : Proc(IGPMMapEntry*, UInt32)
    get_type_info_count : Proc(IGPMMapEntry*, UInt32*, HRESULT)
    get_type_info : Proc(IGPMMapEntry*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IGPMMapEntry*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IGPMMapEntry*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_source : Proc(IGPMMapEntry*, UInt8**, HRESULT)
    get_destination : Proc(IGPMMapEntry*, UInt8**, HRESULT)
    get_destination_option : Proc(IGPMMapEntry*, GPMDestinationOption*, HRESULT)
    get_entry_type : Proc(IGPMMapEntry*, GPMEntryType*, HRESULT)
  end

  IGPMMapEntry_GUID = "8e79ad06-2381-4444-be4c-ff693e6e6f2b"
  IID_IGPMMapEntry = LibC::GUID.new(0x8e79ad06_u32, 0x2381_u16, 0x4444_u16, StaticArray[0xbe_u8, 0x4c_u8, 0xff_u8, 0x69_u8, 0x3e_u8, 0x6e_u8, 0x6f_u8, 0x2b_u8])
  struct IGPMMapEntry
    lpVtbl : IGPMMapEntryVTbl*
  end

  struct IGPMMigrationTableVTbl
    query_interface : Proc(IGPMMigrationTable*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGPMMigrationTable*, UInt32)
    release : Proc(IGPMMigrationTable*, UInt32)
    get_type_info_count : Proc(IGPMMigrationTable*, UInt32*, HRESULT)
    get_type_info : Proc(IGPMMigrationTable*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IGPMMigrationTable*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IGPMMigrationTable*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    save : Proc(IGPMMigrationTable*, UInt8*, HRESULT)
    add : Proc(IGPMMigrationTable*, Int32, VARIANT, HRESULT)
    add_entry : Proc(IGPMMigrationTable*, UInt8*, GPMEntryType, VARIANT*, IGPMMapEntry*, HRESULT)
    get_entry : Proc(IGPMMigrationTable*, UInt8*, IGPMMapEntry*, HRESULT)
    delete_entry : Proc(IGPMMigrationTable*, UInt8*, HRESULT)
    update_destination : Proc(IGPMMigrationTable*, UInt8*, VARIANT*, IGPMMapEntry*, HRESULT)
    validate : Proc(IGPMMigrationTable*, IGPMResult*, HRESULT)
    get_entries : Proc(IGPMMigrationTable*, IGPMMapEntryCollection*, HRESULT)
  end

  IGPMMigrationTable_GUID = "48f823b1-efaf-470b-b6ed-40d14ee1a4ec"
  IID_IGPMMigrationTable = LibC::GUID.new(0x48f823b1_u32, 0xefaf_u16, 0x470b_u16, StaticArray[0xb6_u8, 0xed_u8, 0x40_u8, 0xd1_u8, 0x4e_u8, 0xe1_u8, 0xa4_u8, 0xec_u8])
  struct IGPMMigrationTable
    lpVtbl : IGPMMigrationTableVTbl*
  end

  struct IGPMBackupDirExVTbl
    query_interface : Proc(IGPMBackupDirEx*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGPMBackupDirEx*, UInt32)
    release : Proc(IGPMBackupDirEx*, UInt32)
    get_type_info_count : Proc(IGPMBackupDirEx*, UInt32*, HRESULT)
    get_type_info : Proc(IGPMBackupDirEx*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IGPMBackupDirEx*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IGPMBackupDirEx*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_backup_dir : Proc(IGPMBackupDirEx*, UInt8**, HRESULT)
    get_backup_type : Proc(IGPMBackupDirEx*, GPMBackupType*, HRESULT)
    get_backup : Proc(IGPMBackupDirEx*, UInt8*, VARIANT*, HRESULT)
    search_backups : Proc(IGPMBackupDirEx*, IGPMSearchCriteria, VARIANT*, HRESULT)
  end

  IGPMBackupDirEx_GUID = "f8dc55ed-3ba0-4864-aad4-d365189ee1d5"
  IID_IGPMBackupDirEx = LibC::GUID.new(0xf8dc55ed_u32, 0x3ba0_u16, 0x4864_u16, StaticArray[0xaa_u8, 0xd4_u8, 0xd3_u8, 0x65_u8, 0x18_u8, 0x9e_u8, 0xe1_u8, 0xd5_u8])
  struct IGPMBackupDirEx
    lpVtbl : IGPMBackupDirExVTbl*
  end

  struct IGPMStarterGPOBackupCollectionVTbl
    query_interface : Proc(IGPMStarterGPOBackupCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGPMStarterGPOBackupCollection*, UInt32)
    release : Proc(IGPMStarterGPOBackupCollection*, UInt32)
    get_type_info_count : Proc(IGPMStarterGPOBackupCollection*, UInt32*, HRESULT)
    get_type_info : Proc(IGPMStarterGPOBackupCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IGPMStarterGPOBackupCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IGPMStarterGPOBackupCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(IGPMStarterGPOBackupCollection*, Int32*, HRESULT)
    get_item : Proc(IGPMStarterGPOBackupCollection*, Int32, VARIANT*, HRESULT)
    get__new_enum : Proc(IGPMStarterGPOBackupCollection*, IEnumVARIANT*, HRESULT)
  end

  IGPMStarterGPOBackupCollection_GUID = "c998031d-add0-4bb5-8dea-298505d8423b"
  IID_IGPMStarterGPOBackupCollection = LibC::GUID.new(0xc998031d_u32, 0xadd0_u16, 0x4bb5_u16, StaticArray[0x8d_u8, 0xea_u8, 0x29_u8, 0x85_u8, 0x5_u8, 0xd8_u8, 0x42_u8, 0x3b_u8])
  struct IGPMStarterGPOBackupCollection
    lpVtbl : IGPMStarterGPOBackupCollectionVTbl*
  end

  struct IGPMStarterGPOBackupVTbl
    query_interface : Proc(IGPMStarterGPOBackup*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGPMStarterGPOBackup*, UInt32)
    release : Proc(IGPMStarterGPOBackup*, UInt32)
    get_type_info_count : Proc(IGPMStarterGPOBackup*, UInt32*, HRESULT)
    get_type_info : Proc(IGPMStarterGPOBackup*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IGPMStarterGPOBackup*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IGPMStarterGPOBackup*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_backup_dir : Proc(IGPMStarterGPOBackup*, UInt8**, HRESULT)
    get_comment : Proc(IGPMStarterGPOBackup*, UInt8**, HRESULT)
    get_display_name : Proc(IGPMStarterGPOBackup*, UInt8**, HRESULT)
    get_domain : Proc(IGPMStarterGPOBackup*, UInt8**, HRESULT)
    get_starter_gpoid : Proc(IGPMStarterGPOBackup*, UInt8**, HRESULT)
    get_id : Proc(IGPMStarterGPOBackup*, UInt8**, HRESULT)
    get_timestamp : Proc(IGPMStarterGPOBackup*, Float64*, HRESULT)
    get_type : Proc(IGPMStarterGPOBackup*, GPMStarterGPOType*, HRESULT)
    delete : Proc(IGPMStarterGPOBackup*, HRESULT)
    generate_report : Proc(IGPMStarterGPOBackup*, GPMReportType, VARIANT*, VARIANT*, IGPMResult*, HRESULT)
    generate_report_to_file : Proc(IGPMStarterGPOBackup*, GPMReportType, UInt8*, IGPMResult*, HRESULT)
  end

  IGPMStarterGPOBackup_GUID = "51d98eda-a87e-43dd-b80a-0b66ef1938d6"
  IID_IGPMStarterGPOBackup = LibC::GUID.new(0x51d98eda_u32, 0xa87e_u16, 0x43dd_u16, StaticArray[0xb8_u8, 0xa_u8, 0xb_u8, 0x66_u8, 0xef_u8, 0x19_u8, 0x38_u8, 0xd6_u8])
  struct IGPMStarterGPOBackup
    lpVtbl : IGPMStarterGPOBackupVTbl*
  end

  struct IGPM2VTbl
    query_interface : Proc(IGPM2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGPM2*, UInt32)
    release : Proc(IGPM2*, UInt32)
    get_type_info_count : Proc(IGPM2*, UInt32*, HRESULT)
    get_type_info : Proc(IGPM2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IGPM2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IGPM2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_domain : Proc(IGPM2*, UInt8*, UInt8*, Int32, IGPMDomain*, HRESULT)
    get_backup_dir : Proc(IGPM2*, UInt8*, IGPMBackupDir*, HRESULT)
    get_sites_container : Proc(IGPM2*, UInt8*, UInt8*, UInt8*, Int32, IGPMSitesContainer*, HRESULT)
    get_rsop : Proc(IGPM2*, GPMRSOPMode, UInt8*, Int32, IGPMRSOP*, HRESULT)
    create_permission : Proc(IGPM2*, UInt8*, GPMPermissionType, Int16, IGPMPermission*, HRESULT)
    create_search_criteria : Proc(IGPM2*, IGPMSearchCriteria*, HRESULT)
    create_trustee : Proc(IGPM2*, UInt8*, IGPMTrustee*, HRESULT)
    get_client_side_extensions : Proc(IGPM2*, IGPMCSECollection*, HRESULT)
    get_constants : Proc(IGPM2*, IGPMConstants*, HRESULT)
    get_migration_table : Proc(IGPM2*, UInt8*, IGPMMigrationTable*, HRESULT)
    create_migration_table : Proc(IGPM2*, IGPMMigrationTable*, HRESULT)
    initialize_reporting : Proc(IGPM2*, UInt8*, HRESULT)
    get_backup_dir_ex : Proc(IGPM2*, UInt8*, GPMBackupType, IGPMBackupDirEx*, HRESULT)
    initialize_reporting_ex : Proc(IGPM2*, UInt8*, Int32, HRESULT)
  end

  IGPM2_GUID = "00238f8a-3d86-41ac-8f5e-06a6638a634a"
  IID_IGPM2 = LibC::GUID.new(0x238f8a_u32, 0x3d86_u16, 0x41ac_u16, StaticArray[0x8f_u8, 0x5e_u8, 0x6_u8, 0xa6_u8, 0x63_u8, 0x8a_u8, 0x63_u8, 0x4a_u8])
  struct IGPM2
    lpVtbl : IGPM2VTbl*
  end

  struct IGPMStarterGPOVTbl
    query_interface : Proc(IGPMStarterGPO*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGPMStarterGPO*, UInt32)
    release : Proc(IGPMStarterGPO*, UInt32)
    get_type_info_count : Proc(IGPMStarterGPO*, UInt32*, HRESULT)
    get_type_info : Proc(IGPMStarterGPO*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IGPMStarterGPO*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IGPMStarterGPO*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_display_name : Proc(IGPMStarterGPO*, UInt8**, HRESULT)
    put_display_name : Proc(IGPMStarterGPO*, UInt8*, HRESULT)
    get_description : Proc(IGPMStarterGPO*, UInt8**, HRESULT)
    put_description : Proc(IGPMStarterGPO*, UInt8*, HRESULT)
    get_author : Proc(IGPMStarterGPO*, UInt8**, HRESULT)
    get_product : Proc(IGPMStarterGPO*, UInt8**, HRESULT)
    get_creation_time : Proc(IGPMStarterGPO*, Float64*, HRESULT)
    get_id : Proc(IGPMStarterGPO*, UInt8**, HRESULT)
    get_modified_time : Proc(IGPMStarterGPO*, Float64*, HRESULT)
    get_type : Proc(IGPMStarterGPO*, GPMStarterGPOType*, HRESULT)
    get_computer_version : Proc(IGPMStarterGPO*, UInt16*, HRESULT)
    get_user_version : Proc(IGPMStarterGPO*, UInt16*, HRESULT)
    get_starter_gpo_version : Proc(IGPMStarterGPO*, UInt8**, HRESULT)
    delete : Proc(IGPMStarterGPO*, HRESULT)
    save : Proc(IGPMStarterGPO*, UInt8*, Int16, Int16, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IGPMResult*, HRESULT)
    backup : Proc(IGPMStarterGPO*, UInt8*, UInt8*, VARIANT*, VARIANT*, IGPMResult*, HRESULT)
    copy_to : Proc(IGPMStarterGPO*, VARIANT*, VARIANT*, VARIANT*, IGPMResult*, HRESULT)
    generate_report : Proc(IGPMStarterGPO*, GPMReportType, VARIANT*, VARIANT*, IGPMResult*, HRESULT)
    generate_report_to_file : Proc(IGPMStarterGPO*, GPMReportType, UInt8*, IGPMResult*, HRESULT)
    get_security_info : Proc(IGPMStarterGPO*, IGPMSecurityInfo*, HRESULT)
    set_security_info : Proc(IGPMStarterGPO*, IGPMSecurityInfo, HRESULT)
  end

  IGPMStarterGPO_GUID = "dfc3f61b-8880-4490-9337-d29c7ba8c2f0"
  IID_IGPMStarterGPO = LibC::GUID.new(0xdfc3f61b_u32, 0x8880_u16, 0x4490_u16, StaticArray[0x93_u8, 0x37_u8, 0xd2_u8, 0x9c_u8, 0x7b_u8, 0xa8_u8, 0xc2_u8, 0xf0_u8])
  struct IGPMStarterGPO
    lpVtbl : IGPMStarterGPOVTbl*
  end

  struct IGPMStarterGPOCollectionVTbl
    query_interface : Proc(IGPMStarterGPOCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGPMStarterGPOCollection*, UInt32)
    release : Proc(IGPMStarterGPOCollection*, UInt32)
    get_type_info_count : Proc(IGPMStarterGPOCollection*, UInt32*, HRESULT)
    get_type_info : Proc(IGPMStarterGPOCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IGPMStarterGPOCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IGPMStarterGPOCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(IGPMStarterGPOCollection*, Int32*, HRESULT)
    get_item : Proc(IGPMStarterGPOCollection*, Int32, VARIANT*, HRESULT)
    get__new_enum : Proc(IGPMStarterGPOCollection*, IEnumVARIANT*, HRESULT)
  end

  IGPMStarterGPOCollection_GUID = "2e522729-2219-44ad-933a-64dfd650c423"
  IID_IGPMStarterGPOCollection = LibC::GUID.new(0x2e522729_u32, 0x2219_u16, 0x44ad_u16, StaticArray[0x93_u8, 0x3a_u8, 0x64_u8, 0xdf_u8, 0xd6_u8, 0x50_u8, 0xc4_u8, 0x23_u8])
  struct IGPMStarterGPOCollection
    lpVtbl : IGPMStarterGPOCollectionVTbl*
  end

  struct IGPMDomain2VTbl
    query_interface : Proc(IGPMDomain2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGPMDomain2*, UInt32)
    release : Proc(IGPMDomain2*, UInt32)
    get_type_info_count : Proc(IGPMDomain2*, UInt32*, HRESULT)
    get_type_info : Proc(IGPMDomain2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IGPMDomain2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IGPMDomain2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_domain_controller : Proc(IGPMDomain2*, UInt8**, HRESULT)
    get_domain : Proc(IGPMDomain2*, UInt8**, HRESULT)
    create_gpo : Proc(IGPMDomain2*, IGPMGPO*, HRESULT)
    get_gpo : Proc(IGPMDomain2*, UInt8*, IGPMGPO*, HRESULT)
    search_gp_os : Proc(IGPMDomain2*, IGPMSearchCriteria, IGPMGPOCollection*, HRESULT)
    restore_gpo : Proc(IGPMDomain2*, IGPMBackup, Int32, VARIANT*, VARIANT*, IGPMResult*, HRESULT)
    get_som : Proc(IGPMDomain2*, UInt8*, IGPMSOM*, HRESULT)
    search_so_ms : Proc(IGPMDomain2*, IGPMSearchCriteria, IGPMSOMCollection*, HRESULT)
    get_wmi_filter : Proc(IGPMDomain2*, UInt8*, IGPMWMIFilter*, HRESULT)
    search_wmi_filters : Proc(IGPMDomain2*, IGPMSearchCriteria, IGPMWMIFilterCollection*, HRESULT)
    create_starter_gpo : Proc(IGPMDomain2*, IGPMStarterGPO*, HRESULT)
    create_gpo_from_starter_gpo : Proc(IGPMDomain2*, IGPMStarterGPO, IGPMGPO*, HRESULT)
    get_starter_gpo : Proc(IGPMDomain2*, UInt8*, IGPMStarterGPO*, HRESULT)
    search_starter_gp_os : Proc(IGPMDomain2*, IGPMSearchCriteria, IGPMStarterGPOCollection*, HRESULT)
    load_starter_gpo : Proc(IGPMDomain2*, UInt8*, Int16, VARIANT*, VARIANT*, IGPMResult*, HRESULT)
    restore_starter_gpo : Proc(IGPMDomain2*, IGPMStarterGPOBackup, VARIANT*, VARIANT*, IGPMResult*, HRESULT)
  end

  IGPMDomain2_GUID = "7ca6bb8b-f1eb-490a-938d-3c4e51c768e6"
  IID_IGPMDomain2 = LibC::GUID.new(0x7ca6bb8b_u32, 0xf1eb_u16, 0x490a_u16, StaticArray[0x93_u8, 0x8d_u8, 0x3c_u8, 0x4e_u8, 0x51_u8, 0xc7_u8, 0x68_u8, 0xe6_u8])
  struct IGPMDomain2
    lpVtbl : IGPMDomain2VTbl*
  end

  struct IGPMConstants2VTbl
    query_interface : Proc(IGPMConstants2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGPMConstants2*, UInt32)
    release : Proc(IGPMConstants2*, UInt32)
    get_type_info_count : Proc(IGPMConstants2*, UInt32*, HRESULT)
    get_type_info : Proc(IGPMConstants2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IGPMConstants2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IGPMConstants2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_perm_gpo_apply : Proc(IGPMConstants2*, GPMPermissionType*, HRESULT)
    get_perm_gpo_read : Proc(IGPMConstants2*, GPMPermissionType*, HRESULT)
    get_perm_gpo_edit : Proc(IGPMConstants2*, GPMPermissionType*, HRESULT)
    get_perm_gpo_edit_security_and_delete : Proc(IGPMConstants2*, GPMPermissionType*, HRESULT)
    get_perm_gpo_custom : Proc(IGPMConstants2*, GPMPermissionType*, HRESULT)
    get_perm_wmi_filter_edit : Proc(IGPMConstants2*, GPMPermissionType*, HRESULT)
    get_perm_wmi_filter_full_control : Proc(IGPMConstants2*, GPMPermissionType*, HRESULT)
    get_perm_wmi_filter_custom : Proc(IGPMConstants2*, GPMPermissionType*, HRESULT)
    get_perm_som_link : Proc(IGPMConstants2*, GPMPermissionType*, HRESULT)
    get_perm_som_logging : Proc(IGPMConstants2*, GPMPermissionType*, HRESULT)
    get_perm_som_planning : Proc(IGPMConstants2*, GPMPermissionType*, HRESULT)
    get_perm_somgpo_create : Proc(IGPMConstants2*, GPMPermissionType*, HRESULT)
    get_perm_somwmi_create : Proc(IGPMConstants2*, GPMPermissionType*, HRESULT)
    get_perm_somwmi_full_control : Proc(IGPMConstants2*, GPMPermissionType*, HRESULT)
    get_search_property_gpo_permissions : Proc(IGPMConstants2*, GPMSearchProperty*, HRESULT)
    get_search_property_gpo_effective_permissions : Proc(IGPMConstants2*, GPMSearchProperty*, HRESULT)
    get_search_property_gpo_display_name : Proc(IGPMConstants2*, GPMSearchProperty*, HRESULT)
    get_search_property_gpowmi_filter : Proc(IGPMConstants2*, GPMSearchProperty*, HRESULT)
    get_search_property_gpoid : Proc(IGPMConstants2*, GPMSearchProperty*, HRESULT)
    get_search_property_gpo_computer_extensions : Proc(IGPMConstants2*, GPMSearchProperty*, HRESULT)
    get_search_property_gpo_user_extensions : Proc(IGPMConstants2*, GPMSearchProperty*, HRESULT)
    get_search_property_som_links : Proc(IGPMConstants2*, GPMSearchProperty*, HRESULT)
    get_search_property_gpo_domain : Proc(IGPMConstants2*, GPMSearchProperty*, HRESULT)
    get_search_property_backup_most_recent : Proc(IGPMConstants2*, GPMSearchProperty*, HRESULT)
    get_search_op_equals : Proc(IGPMConstants2*, GPMSearchOperation*, HRESULT)
    get_search_op_contains : Proc(IGPMConstants2*, GPMSearchOperation*, HRESULT)
    get_search_op_not_contains : Proc(IGPMConstants2*, GPMSearchOperation*, HRESULT)
    get_search_op_not_equals : Proc(IGPMConstants2*, GPMSearchOperation*, HRESULT)
    get_use_pdc : Proc(IGPMConstants2*, Int32*, HRESULT)
    get_use_any_dc : Proc(IGPMConstants2*, Int32*, HRESULT)
    get_do_not_use_w2_kdc : Proc(IGPMConstants2*, Int32*, HRESULT)
    get_som_site : Proc(IGPMConstants2*, GPMSOMType*, HRESULT)
    get_som_domain : Proc(IGPMConstants2*, GPMSOMType*, HRESULT)
    get_somou : Proc(IGPMConstants2*, GPMSOMType*, HRESULT)
    get_security_flags : Proc(IGPMConstants2*, Int16, Int16, Int16, Int16, Int32*, HRESULT)
    get_do_not_validate_dc : Proc(IGPMConstants2*, Int32*, HRESULT)
    get_report_html : Proc(IGPMConstants2*, GPMReportType*, HRESULT)
    get_report_xml : Proc(IGPMConstants2*, GPMReportType*, HRESULT)
    get_rsop_mode_unknown : Proc(IGPMConstants2*, GPMRSOPMode*, HRESULT)
    get_rsop_mode_planning : Proc(IGPMConstants2*, GPMRSOPMode*, HRESULT)
    get_rsop_mode_logging : Proc(IGPMConstants2*, GPMRSOPMode*, HRESULT)
    get_entry_type_user : Proc(IGPMConstants2*, GPMEntryType*, HRESULT)
    get_entry_type_computer : Proc(IGPMConstants2*, GPMEntryType*, HRESULT)
    get_entry_type_local_group : Proc(IGPMConstants2*, GPMEntryType*, HRESULT)
    get_entry_type_global_group : Proc(IGPMConstants2*, GPMEntryType*, HRESULT)
    get_entry_type_universal_group : Proc(IGPMConstants2*, GPMEntryType*, HRESULT)
    get_entry_type_unc_path : Proc(IGPMConstants2*, GPMEntryType*, HRESULT)
    get_entry_type_unknown : Proc(IGPMConstants2*, GPMEntryType*, HRESULT)
    get_destination_option_same_as_source : Proc(IGPMConstants2*, GPMDestinationOption*, HRESULT)
    get_destination_option_none : Proc(IGPMConstants2*, GPMDestinationOption*, HRESULT)
    get_destination_option_by_relative_name : Proc(IGPMConstants2*, GPMDestinationOption*, HRESULT)
    get_destination_option_set : Proc(IGPMConstants2*, GPMDestinationOption*, HRESULT)
    get_migration_table_only : Proc(IGPMConstants2*, Int32*, HRESULT)
    get_process_security : Proc(IGPMConstants2*, Int32*, HRESULT)
    get_rsop_logging_no_computer : Proc(IGPMConstants2*, Int32*, HRESULT)
    get_rsop_logging_no_user : Proc(IGPMConstants2*, Int32*, HRESULT)
    get_rsop_planning_assume_slow_link : Proc(IGPMConstants2*, Int32*, HRESULT)
    get_rsop_planning_loopback_option : Proc(IGPMConstants2*, Int16, Int32*, HRESULT)
    get_rsop_planning_assume_user_wql_filter_true : Proc(IGPMConstants2*, Int32*, HRESULT)
    get_rsop_planning_assume_comp_wql_filter_true : Proc(IGPMConstants2*, Int32*, HRESULT)
    get_backup_type_gpo : Proc(IGPMConstants2*, GPMBackupType*, HRESULT)
    get_backup_type_starter_gpo : Proc(IGPMConstants2*, GPMBackupType*, HRESULT)
    get_starter_gpo_type_system : Proc(IGPMConstants2*, GPMStarterGPOType*, HRESULT)
    get_starter_gpo_type_custom : Proc(IGPMConstants2*, GPMStarterGPOType*, HRESULT)
    get_search_property_starter_gpo_permissions : Proc(IGPMConstants2*, GPMSearchProperty*, HRESULT)
    get_search_property_starter_gpo_effective_permissions : Proc(IGPMConstants2*, GPMSearchProperty*, HRESULT)
    get_search_property_starter_gpo_display_name : Proc(IGPMConstants2*, GPMSearchProperty*, HRESULT)
    get_search_property_starter_gpoid : Proc(IGPMConstants2*, GPMSearchProperty*, HRESULT)
    get_search_property_starter_gpo_domain : Proc(IGPMConstants2*, GPMSearchProperty*, HRESULT)
    get_perm_starter_gpo_read : Proc(IGPMConstants2*, GPMPermissionType*, HRESULT)
    get_perm_starter_gpo_edit : Proc(IGPMConstants2*, GPMPermissionType*, HRESULT)
    get_perm_starter_gpo_full_control : Proc(IGPMConstants2*, GPMPermissionType*, HRESULT)
    get_perm_starter_gpo_custom : Proc(IGPMConstants2*, GPMPermissionType*, HRESULT)
    get_report_legacy : Proc(IGPMConstants2*, GPMReportingOptions*, HRESULT)
    get_report_comments : Proc(IGPMConstants2*, GPMReportingOptions*, HRESULT)
  end

  IGPMConstants2_GUID = "05ae21b0-ac09-4032-a26f-9e7da786dc19"
  IID_IGPMConstants2 = LibC::GUID.new(0x5ae21b0_u32, 0xac09_u16, 0x4032_u16, StaticArray[0xa2_u8, 0x6f_u8, 0x9e_u8, 0x7d_u8, 0xa7_u8, 0x86_u8, 0xdc_u8, 0x19_u8])
  struct IGPMConstants2
    lpVtbl : IGPMConstants2VTbl*
  end

  struct IGPMGPO2VTbl
    query_interface : Proc(IGPMGPO2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGPMGPO2*, UInt32)
    release : Proc(IGPMGPO2*, UInt32)
    get_type_info_count : Proc(IGPMGPO2*, UInt32*, HRESULT)
    get_type_info : Proc(IGPMGPO2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IGPMGPO2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IGPMGPO2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_display_name : Proc(IGPMGPO2*, UInt8**, HRESULT)
    put_display_name : Proc(IGPMGPO2*, UInt8*, HRESULT)
    get_path : Proc(IGPMGPO2*, UInt8**, HRESULT)
    get_id : Proc(IGPMGPO2*, UInt8**, HRESULT)
    get_domain_name : Proc(IGPMGPO2*, UInt8**, HRESULT)
    get_creation_time : Proc(IGPMGPO2*, Float64*, HRESULT)
    get_modification_time : Proc(IGPMGPO2*, Float64*, HRESULT)
    get_user_ds_version_number : Proc(IGPMGPO2*, Int32*, HRESULT)
    get_computer_ds_version_number : Proc(IGPMGPO2*, Int32*, HRESULT)
    get_user_sysvol_version_number : Proc(IGPMGPO2*, Int32*, HRESULT)
    get_computer_sysvol_version_number : Proc(IGPMGPO2*, Int32*, HRESULT)
    get_wmi_filter : Proc(IGPMGPO2*, IGPMWMIFilter*, HRESULT)
    set_wmi_filter : Proc(IGPMGPO2*, IGPMWMIFilter, HRESULT)
    set_user_enabled : Proc(IGPMGPO2*, Int16, HRESULT)
    set_computer_enabled : Proc(IGPMGPO2*, Int16, HRESULT)
    is_user_enabled : Proc(IGPMGPO2*, Int16*, HRESULT)
    is_computer_enabled : Proc(IGPMGPO2*, Int16*, HRESULT)
    get_security_info : Proc(IGPMGPO2*, IGPMSecurityInfo*, HRESULT)
    set_security_info : Proc(IGPMGPO2*, IGPMSecurityInfo, HRESULT)
    delete : Proc(IGPMGPO2*, HRESULT)
    backup : Proc(IGPMGPO2*, UInt8*, UInt8*, VARIANT*, VARIANT*, IGPMResult*, HRESULT)
    import : Proc(IGPMGPO2*, Int32, IGPMBackup, VARIANT*, VARIANT*, VARIANT*, IGPMResult*, HRESULT)
    generate_report : Proc(IGPMGPO2*, GPMReportType, VARIANT*, VARIANT*, IGPMResult*, HRESULT)
    generate_report_to_file : Proc(IGPMGPO2*, GPMReportType, UInt8*, IGPMResult*, HRESULT)
    copy_to : Proc(IGPMGPO2*, Int32, IGPMDomain, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IGPMResult*, HRESULT)
    set_security_descriptor : Proc(IGPMGPO2*, Int32, IDispatch, HRESULT)
    get_security_descriptor : Proc(IGPMGPO2*, Int32, IDispatch*, HRESULT)
    is_acl_consistent : Proc(IGPMGPO2*, Int16*, HRESULT)
    make_acl_consistent : Proc(IGPMGPO2*, HRESULT)
    get_description : Proc(IGPMGPO2*, UInt8**, HRESULT)
    put_description : Proc(IGPMGPO2*, UInt8*, HRESULT)
  end

  IGPMGPO2_GUID = "8a66a210-b78b-4d99-88e2-c306a817c925"
  IID_IGPMGPO2 = LibC::GUID.new(0x8a66a210_u32, 0xb78b_u16, 0x4d99_u16, StaticArray[0x88_u8, 0xe2_u8, 0xc3_u8, 0x6_u8, 0xa8_u8, 0x17_u8, 0xc9_u8, 0x25_u8])
  struct IGPMGPO2
    lpVtbl : IGPMGPO2VTbl*
  end

  struct IGPMDomain3VTbl
    query_interface : Proc(IGPMDomain3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGPMDomain3*, UInt32)
    release : Proc(IGPMDomain3*, UInt32)
    get_type_info_count : Proc(IGPMDomain3*, UInt32*, HRESULT)
    get_type_info : Proc(IGPMDomain3*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IGPMDomain3*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IGPMDomain3*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_domain_controller : Proc(IGPMDomain3*, UInt8**, HRESULT)
    get_domain : Proc(IGPMDomain3*, UInt8**, HRESULT)
    create_gpo : Proc(IGPMDomain3*, IGPMGPO*, HRESULT)
    get_gpo : Proc(IGPMDomain3*, UInt8*, IGPMGPO*, HRESULT)
    search_gp_os : Proc(IGPMDomain3*, IGPMSearchCriteria, IGPMGPOCollection*, HRESULT)
    restore_gpo : Proc(IGPMDomain3*, IGPMBackup, Int32, VARIANT*, VARIANT*, IGPMResult*, HRESULT)
    get_som : Proc(IGPMDomain3*, UInt8*, IGPMSOM*, HRESULT)
    search_so_ms : Proc(IGPMDomain3*, IGPMSearchCriteria, IGPMSOMCollection*, HRESULT)
    get_wmi_filter : Proc(IGPMDomain3*, UInt8*, IGPMWMIFilter*, HRESULT)
    search_wmi_filters : Proc(IGPMDomain3*, IGPMSearchCriteria, IGPMWMIFilterCollection*, HRESULT)
    create_starter_gpo : Proc(IGPMDomain3*, IGPMStarterGPO*, HRESULT)
    create_gpo_from_starter_gpo : Proc(IGPMDomain3*, IGPMStarterGPO, IGPMGPO*, HRESULT)
    get_starter_gpo : Proc(IGPMDomain3*, UInt8*, IGPMStarterGPO*, HRESULT)
    search_starter_gp_os : Proc(IGPMDomain3*, IGPMSearchCriteria, IGPMStarterGPOCollection*, HRESULT)
    load_starter_gpo : Proc(IGPMDomain3*, UInt8*, Int16, VARIANT*, VARIANT*, IGPMResult*, HRESULT)
    restore_starter_gpo : Proc(IGPMDomain3*, IGPMStarterGPOBackup, VARIANT*, VARIANT*, IGPMResult*, HRESULT)
    generate_report : Proc(IGPMDomain3*, GPMReportType, VARIANT*, VARIANT*, IGPMResult*, HRESULT)
    get_infrastructure_dc : Proc(IGPMDomain3*, UInt8**, HRESULT)
    put_infrastructure_dc : Proc(IGPMDomain3*, UInt8*, HRESULT)
    put_infrastructure_flags : Proc(IGPMDomain3*, UInt32, HRESULT)
  end

  IGPMDomain3_GUID = "0077fdfe-88c7-4acf-a11d-d10a7c310a03"
  IID_IGPMDomain3 = LibC::GUID.new(0x77fdfe_u32, 0x88c7_u16, 0x4acf_u16, StaticArray[0xa1_u8, 0x1d_u8, 0xd1_u8, 0xa_u8, 0x7c_u8, 0x31_u8, 0xa_u8, 0x3_u8])
  struct IGPMDomain3
    lpVtbl : IGPMDomain3VTbl*
  end

  struct IGPMGPO3VTbl
    query_interface : Proc(IGPMGPO3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGPMGPO3*, UInt32)
    release : Proc(IGPMGPO3*, UInt32)
    get_type_info_count : Proc(IGPMGPO3*, UInt32*, HRESULT)
    get_type_info : Proc(IGPMGPO3*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IGPMGPO3*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IGPMGPO3*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_display_name : Proc(IGPMGPO3*, UInt8**, HRESULT)
    put_display_name : Proc(IGPMGPO3*, UInt8*, HRESULT)
    get_path : Proc(IGPMGPO3*, UInt8**, HRESULT)
    get_id : Proc(IGPMGPO3*, UInt8**, HRESULT)
    get_domain_name : Proc(IGPMGPO3*, UInt8**, HRESULT)
    get_creation_time : Proc(IGPMGPO3*, Float64*, HRESULT)
    get_modification_time : Proc(IGPMGPO3*, Float64*, HRESULT)
    get_user_ds_version_number : Proc(IGPMGPO3*, Int32*, HRESULT)
    get_computer_ds_version_number : Proc(IGPMGPO3*, Int32*, HRESULT)
    get_user_sysvol_version_number : Proc(IGPMGPO3*, Int32*, HRESULT)
    get_computer_sysvol_version_number : Proc(IGPMGPO3*, Int32*, HRESULT)
    get_wmi_filter : Proc(IGPMGPO3*, IGPMWMIFilter*, HRESULT)
    set_wmi_filter : Proc(IGPMGPO3*, IGPMWMIFilter, HRESULT)
    set_user_enabled : Proc(IGPMGPO3*, Int16, HRESULT)
    set_computer_enabled : Proc(IGPMGPO3*, Int16, HRESULT)
    is_user_enabled : Proc(IGPMGPO3*, Int16*, HRESULT)
    is_computer_enabled : Proc(IGPMGPO3*, Int16*, HRESULT)
    get_security_info : Proc(IGPMGPO3*, IGPMSecurityInfo*, HRESULT)
    set_security_info : Proc(IGPMGPO3*, IGPMSecurityInfo, HRESULT)
    delete : Proc(IGPMGPO3*, HRESULT)
    backup : Proc(IGPMGPO3*, UInt8*, UInt8*, VARIANT*, VARIANT*, IGPMResult*, HRESULT)
    import : Proc(IGPMGPO3*, Int32, IGPMBackup, VARIANT*, VARIANT*, VARIANT*, IGPMResult*, HRESULT)
    generate_report : Proc(IGPMGPO3*, GPMReportType, VARIANT*, VARIANT*, IGPMResult*, HRESULT)
    generate_report_to_file : Proc(IGPMGPO3*, GPMReportType, UInt8*, IGPMResult*, HRESULT)
    copy_to : Proc(IGPMGPO3*, Int32, IGPMDomain, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IGPMResult*, HRESULT)
    set_security_descriptor : Proc(IGPMGPO3*, Int32, IDispatch, HRESULT)
    get_security_descriptor : Proc(IGPMGPO3*, Int32, IDispatch*, HRESULT)
    is_acl_consistent : Proc(IGPMGPO3*, Int16*, HRESULT)
    make_acl_consistent : Proc(IGPMGPO3*, HRESULT)
    get_description : Proc(IGPMGPO3*, UInt8**, HRESULT)
    put_description : Proc(IGPMGPO3*, UInt8*, HRESULT)
    get_infrastructure_dc : Proc(IGPMGPO3*, UInt8**, HRESULT)
    put_infrastructure_dc : Proc(IGPMGPO3*, UInt8*, HRESULT)
    put_infrastructure_flags : Proc(IGPMGPO3*, UInt32, HRESULT)
  end

  IGPMGPO3_GUID = "7cf123a1-f94a-4112-bfae-6aa1db9cb248"
  IID_IGPMGPO3 = LibC::GUID.new(0x7cf123a1_u32, 0xf94a_u16, 0x4112_u16, StaticArray[0xbf_u8, 0xae_u8, 0x6a_u8, 0xa1_u8, 0xdb_u8, 0x9c_u8, 0xb2_u8, 0x48_u8])
  struct IGPMGPO3
    lpVtbl : IGPMGPO3VTbl*
  end

  struct IGPEInformationVTbl
    query_interface : Proc(IGPEInformation*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGPEInformation*, UInt32)
    release : Proc(IGPEInformation*, UInt32)
    get_name : Proc(IGPEInformation*, Char*, Int32, HRESULT)
    get_display_name : Proc(IGPEInformation*, Char*, Int32, HRESULT)
    get_registry_key : Proc(IGPEInformation*, UInt32, HKEY*, HRESULT)
    get_ds_path : Proc(IGPEInformation*, UInt32, Char*, Int32, HRESULT)
    get_file_sys_path : Proc(IGPEInformation*, UInt32, Char*, Int32, HRESULT)
    get_options : Proc(IGPEInformation*, UInt32*, HRESULT)
    get_type : Proc(IGPEInformation*, GROUP_POLICY_OBJECT_TYPE*, HRESULT)
    get_hint : Proc(IGPEInformation*, GROUP_POLICY_HINT_TYPE*, HRESULT)
    policy_changed : Proc(IGPEInformation*, LibC::BOOL, LibC::BOOL, Guid*, Guid*, HRESULT)
  end

  IGPEInformation_GUID = "8fc0b735-a0e1-11d1-a7d3-0000f87571e3"
  IID_IGPEInformation = LibC::GUID.new(0x8fc0b735_u32, 0xa0e1_u16, 0x11d1_u16, StaticArray[0xa7_u8, 0xd3_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x71_u8, 0xe3_u8])
  struct IGPEInformation
    lpVtbl : IGPEInformationVTbl*
  end

  struct IGroupPolicyObjectVTbl
    query_interface : Proc(IGroupPolicyObject*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGroupPolicyObject*, UInt32)
    release : Proc(IGroupPolicyObject*, UInt32)
    new : Proc(IGroupPolicyObject*, LibC::LPWSTR, LibC::LPWSTR, UInt32, HRESULT)
    open_dsgpo : Proc(IGroupPolicyObject*, LibC::LPWSTR, UInt32, HRESULT)
    open_local_machine_gpo : Proc(IGroupPolicyObject*, UInt32, HRESULT)
    open_remote_machine_gpo : Proc(IGroupPolicyObject*, LibC::LPWSTR, UInt32, HRESULT)
    save : Proc(IGroupPolicyObject*, LibC::BOOL, LibC::BOOL, Guid*, Guid*, HRESULT)
    delete : Proc(IGroupPolicyObject*, HRESULT)
    get_name : Proc(IGroupPolicyObject*, Char*, Int32, HRESULT)
    get_display_name : Proc(IGroupPolicyObject*, Char*, Int32, HRESULT)
    set_display_name : Proc(IGroupPolicyObject*, LibC::LPWSTR, HRESULT)
    get_path : Proc(IGroupPolicyObject*, Char*, Int32, HRESULT)
    get_ds_path : Proc(IGroupPolicyObject*, UInt32, Char*, Int32, HRESULT)
    get_file_sys_path : Proc(IGroupPolicyObject*, UInt32, Char*, Int32, HRESULT)
    get_registry_key : Proc(IGroupPolicyObject*, UInt32, HKEY*, HRESULT)
    get_options : Proc(IGroupPolicyObject*, UInt32*, HRESULT)
    set_options : Proc(IGroupPolicyObject*, UInt32, UInt32, HRESULT)
    get_type : Proc(IGroupPolicyObject*, GROUP_POLICY_OBJECT_TYPE*, HRESULT)
    get_machine_name : Proc(IGroupPolicyObject*, Char*, Int32, HRESULT)
    get_property_sheet_pages : Proc(IGroupPolicyObject*, HPROPSHEETPAGE**, UInt32*, HRESULT)
  end

  IGroupPolicyObject_GUID = "ea502723-a23d-11d1-a7d3-0000f87571e3"
  IID_IGroupPolicyObject = LibC::GUID.new(0xea502723_u32, 0xa23d_u16, 0x11d1_u16, StaticArray[0xa7_u8, 0xd3_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x71_u8, 0xe3_u8])
  struct IGroupPolicyObject
    lpVtbl : IGroupPolicyObjectVTbl*
  end

  struct IRSOPInformationVTbl
    query_interface : Proc(IRSOPInformation*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRSOPInformation*, UInt32)
    release : Proc(IRSOPInformation*, UInt32)
    get_namespace : Proc(IRSOPInformation*, UInt32, Char*, Int32, HRESULT)
    get_flags : Proc(IRSOPInformation*, UInt32*, HRESULT)
    get_event_log_entry_text : Proc(IRSOPInformation*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, UInt32, LibC::LPWSTR*, HRESULT)
  end

  IRSOPInformation_GUID = "9a5a81b5-d9c7-49ef-9d11-ddf50968c48d"
  IID_IRSOPInformation = LibC::GUID.new(0x9a5a81b5_u32, 0xd9c7_u16, 0x49ef_u16, StaticArray[0x9d_u8, 0x11_u8, 0xdd_u8, 0xf5_u8, 0x9_u8, 0x68_u8, 0xc4_u8, 0x8d_u8])
  struct IRSOPInformation
    lpVtbl : IRSOPInformationVTbl*
  end


  # Params # bmachine : LibC::BOOL [In]
  fun RefreshPolicy(bmachine : LibC::BOOL) : LibC::BOOL

  # Params # bmachine : LibC::BOOL [In],dwoptions : UInt32 [In]
  fun RefreshPolicyEx(bmachine : LibC::BOOL, dwoptions : UInt32) : LibC::BOOL

  # Params # bmachine : LibC::BOOL [In]
  fun EnterCriticalPolicySection(bmachine : LibC::BOOL) : LibC::HANDLE

  # Params # hsection : LibC::HANDLE [In]
  fun LeaveCriticalPolicySection(hsection : LibC::HANDLE) : LibC::BOOL

  # Params # hevent : LibC::HANDLE [In],bmachine : LibC::BOOL [In]
  fun RegisterGPNotification(hevent : LibC::HANDLE, bmachine : LibC::BOOL) : LibC::BOOL

  # Params # hevent : LibC::HANDLE [In]
  fun UnregisterGPNotification(hevent : LibC::HANDLE) : LibC::BOOL

  # Params # htoken : LibC::HANDLE [In],lpname : PSTR [In],lphostname : PSTR [In],lpcomputername : PSTR [In],dwflags : UInt32 [In],pgpolist : GROUP_POLICY_OBJECTA** [In]
  fun GetGPOListA(htoken : LibC::HANDLE, lpname : PSTR, lphostname : PSTR, lpcomputername : PSTR, dwflags : UInt32, pgpolist : GROUP_POLICY_OBJECTA**) : LibC::BOOL

  # Params # htoken : LibC::HANDLE [In],lpname : LibC::LPWSTR [In],lphostname : LibC::LPWSTR [In],lpcomputername : LibC::LPWSTR [In],dwflags : UInt32 [In],pgpolist : GROUP_POLICY_OBJECTW** [In]
  fun GetGPOListW(htoken : LibC::HANDLE, lpname : LibC::LPWSTR, lphostname : LibC::LPWSTR, lpcomputername : LibC::LPWSTR, dwflags : UInt32, pgpolist : GROUP_POLICY_OBJECTW**) : LibC::BOOL

  # Params # pgpolist : GROUP_POLICY_OBJECTA* [In]
  fun FreeGPOListA(pgpolist : GROUP_POLICY_OBJECTA*) : LibC::BOOL

  # Params # pgpolist : GROUP_POLICY_OBJECTW* [In]
  fun FreeGPOListW(pgpolist : GROUP_POLICY_OBJECTW*) : LibC::BOOL

  # Params # dwflags : UInt32 [In],pmachinename : PSTR [In],psiduser : PSID [In],pguidextension : Guid* [In],ppgpolist : GROUP_POLICY_OBJECTA** [In]
  fun GetAppliedGPOListA(dwflags : UInt32, pmachinename : PSTR, psiduser : PSID, pguidextension : Guid*, ppgpolist : GROUP_POLICY_OBJECTA**) : UInt32

  # Params # dwflags : UInt32 [In],pmachinename : LibC::LPWSTR [In],psiduser : PSID [In],pguidextension : Guid* [In],ppgpolist : GROUP_POLICY_OBJECTW** [In]
  fun GetAppliedGPOListW(dwflags : UInt32, pmachinename : LibC::LPWSTR, psiduser : PSID, pguidextension : Guid*, ppgpolist : GROUP_POLICY_OBJECTW**) : UInt32

  # Params # extensionid : Guid* [In],pasynchandle : LibC::UINT_PTR [In],dwstatus : UInt32 [In]
  fun ProcessGroupPolicyCompleted(extensionid : Guid*, pasynchandle : LibC::UINT_PTR, dwstatus : UInt32) : UInt32

  # Params # extensionid : Guid* [In],pasynchandle : LibC::UINT_PTR [In],dwstatus : UInt32 [In],rsopstatus : HRESULT [In]
  fun ProcessGroupPolicyCompletedEx(extensionid : Guid*, pasynchandle : LibC::UINT_PTR, dwstatus : UInt32, rsopstatus : HRESULT) : UInt32

  # Params # psecuritydescriptor : SECURITY_DESCRIPTOR* [In],pprincipalselfsid : PSID [In],prsoptoken : Void* [In],dwdesiredaccessmask : UInt32 [In],pobjecttypelist : OBJECT_TYPE_LIST* [In],objecttypelistlength : UInt32 [In],pgenericmapping : GENERIC_MAPPING* [In],pprivilegeset : PRIVILEGE_SET* [In],pdwprivilegesetlength : UInt32* [In],pdwgrantedaccessmask : UInt32* [In],pbaccessstatus : Int32* [In]
  fun RsopAccessCheckByType(psecuritydescriptor : SECURITY_DESCRIPTOR*, pprincipalselfsid : PSID, prsoptoken : Void*, dwdesiredaccessmask : UInt32, pobjecttypelist : OBJECT_TYPE_LIST*, objecttypelistlength : UInt32, pgenericmapping : GENERIC_MAPPING*, pprivilegeset : PRIVILEGE_SET*, pdwprivilegesetlength : UInt32*, pdwgrantedaccessmask : UInt32*, pbaccessstatus : Int32*) : HRESULT

  # Params # pszfilename : LibC::LPWSTR [In],prsoptoken : Void* [In],dwdesiredaccessmask : UInt32 [In],pdwgrantedaccessmask : UInt32* [In],pbaccessstatus : Int32* [In]
  fun RsopFileAccessCheck(pszfilename : LibC::LPWSTR, prsoptoken : Void*, dwdesiredaccessmask : UInt32, pdwgrantedaccessmask : UInt32*, pbaccessstatus : Int32*) : HRESULT

  # Params # dwflags : UInt32 [In],pservices : IWbemServices [In],psettinginstance : IWbemClassObject [In],ninfo : UInt32 [In],pstatus : POLICYSETTINGSTATUSINFO* [In]
  fun RsopSetPolicySettingStatus(dwflags : UInt32, pservices : IWbemServices, psettinginstance : IWbemClassObject, ninfo : UInt32, pstatus : POLICYSETTINGSTATUSINFO*) : HRESULT

  # Params # dwflags : UInt32 [In],pservices : IWbemServices [In],psettinginstance : IWbemClassObject [In]
  fun RsopResetPolicySettingStatus(dwflags : UInt32, pservices : IWbemServices, psettinginstance : IWbemClassObject) : HRESULT

  # Params # bmachine : LibC::BOOL [In],lpwszmgmtproduct : LibC::LPWSTR [In],dwmgmtproductoptions : UInt32 [In]
  fun GenerateGPNotification(bmachine : LibC::BOOL, lpwszmgmtproduct : LibC::LPWSTR, dwmgmtproductoptions : UInt32) : UInt32

  # Params # pinstallinfo : INSTALLDATA* [In]
  fun InstallApplication(pinstallinfo : INSTALLDATA*) : UInt32

  # Params # productcode : LibC::LPWSTR [In],dwstatus : UInt32 [In]
  fun UninstallApplication(productcode : LibC::LPWSTR, dwstatus : UInt32) : UInt32

  # Params # descriptor : LibC::LPWSTR [In],commandline : Char* [In],commandlinelength : UInt32* [In]
  fun CommandLineFromMsiDescriptor(descriptor : LibC::LPWSTR, commandline : Char*, commandlinelength : UInt32*) : UInt32

  # Params # pcategory : Guid* [In],dwqueryflags : UInt32 [In],dwinfolevel : UInt32 [In],pdwapps : UInt32* [In],prgmanagedapps : MANAGEDAPPLICATION** [In]
  fun GetManagedApplications(pcategory : Guid*, dwqueryflags : UInt32, dwinfolevel : UInt32, pdwapps : UInt32*, prgmanagedapps : MANAGEDAPPLICATION**) : UInt32

  # Params # buserapps : LibC::BOOL [In],pdwapps : UInt32* [In],prglocalapps : LOCALMANAGEDAPPLICATION** [In]
  fun GetLocalManagedApplications(buserapps : LibC::BOOL, pdwapps : UInt32*, prglocalapps : LOCALMANAGEDAPPLICATION**) : UInt32

  # Params # productcode : LibC::LPWSTR [In],displayname : LibC::LPWSTR* [In],supporturl : LibC::LPWSTR* [In]
  fun GetLocalManagedApplicationData(productcode : LibC::LPWSTR, displayname : LibC::LPWSTR*, supporturl : LibC::LPWSTR*) : Void

  # Params # dwreserved : UInt32 [In],pappcategory : APPCATEGORYINFOLIST* [In]
  fun GetManagedApplicationCategories(dwreserved : UInt32, pappcategory : APPCATEGORYINFOLIST*) : UInt32

  # Params # lpgpo : LibC::LPWSTR [In],lpcontainer : LibC::LPWSTR [In],fhighpriority : LibC::BOOL [In]
  fun CreateGPOLink(lpgpo : LibC::LPWSTR, lpcontainer : LibC::LPWSTR, fhighpriority : LibC::BOOL) : HRESULT

  # Params # lpgpo : LibC::LPWSTR [In],lpcontainer : LibC::LPWSTR [In]
  fun DeleteGPOLink(lpgpo : LibC::LPWSTR, lpcontainer : LibC::LPWSTR) : HRESULT

  # Params # lpcontainer : LibC::LPWSTR [In]
  fun DeleteAllGPOLinks(lpcontainer : LibC::LPWSTR) : HRESULT

  # Params # lpbrowseinfo : GPOBROWSEINFO* [In]
  fun BrowseForGPO(lpbrowseinfo : GPOBROWSEINFO*) : HRESULT

  # Params # lpnamespace : LibC::LPWSTR [In],lpfilename : LibC::LPWSTR [In]
  fun ImportRSoPData(lpnamespace : LibC::LPWSTR, lpfilename : LibC::LPWSTR) : HRESULT

  # Params # lpnamespace : LibC::LPWSTR [In],lpfilename : LibC::LPWSTR [In]
  fun ExportRSoPData(lpnamespace : LibC::LPWSTR, lpfilename : LibC::LPWSTR) : HRESULT
end
struct LibWin32::IGPM
  def query_interface(this : IGPM*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGPM*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGPM*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IGPM*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IGPM*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IGPM*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IGPM*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_domain(this : IGPM*, bstrdomain : UInt8*, bstrdomaincontroller : UInt8*, ldcflags : Int32, pigpmdomain : IGPMDomain*) : HRESULT
    @lpVtbl.value.get_domain.call(this, bstrdomain, bstrdomaincontroller, ldcflags, pigpmdomain)
  end
  def get_backup_dir(this : IGPM*, bstrbackupdir : UInt8*, pigpmbackupdir : IGPMBackupDir*) : HRESULT
    @lpVtbl.value.get_backup_dir.call(this, bstrbackupdir, pigpmbackupdir)
  end
  def get_sites_container(this : IGPM*, bstrforest : UInt8*, bstrdomain : UInt8*, bstrdomaincontroller : UInt8*, ldcflags : Int32, ppigpmsitescontainer : IGPMSitesContainer*) : HRESULT
    @lpVtbl.value.get_sites_container.call(this, bstrforest, bstrdomain, bstrdomaincontroller, ldcflags, ppigpmsitescontainer)
  end
  def get_rsop(this : IGPM*, gpmrsopmode : GPMRSOPMode, bstrnamespace : UInt8*, lflags : Int32, ppigpmrsop : IGPMRSOP*) : HRESULT
    @lpVtbl.value.get_rsop.call(this, gpmrsopmode, bstrnamespace, lflags, ppigpmrsop)
  end
  def create_permission(this : IGPM*, bstrtrustee : UInt8*, perm : GPMPermissionType, binheritable : Int16, ppperm : IGPMPermission*) : HRESULT
    @lpVtbl.value.create_permission.call(this, bstrtrustee, perm, binheritable, ppperm)
  end
  def create_search_criteria(this : IGPM*, ppigpmsearchcriteria : IGPMSearchCriteria*) : HRESULT
    @lpVtbl.value.create_search_criteria.call(this, ppigpmsearchcriteria)
  end
  def create_trustee(this : IGPM*, bstrtrustee : UInt8*, ppigpmtrustee : IGPMTrustee*) : HRESULT
    @lpVtbl.value.create_trustee.call(this, bstrtrustee, ppigpmtrustee)
  end
  def get_client_side_extensions(this : IGPM*, ppigpmcsecollection : IGPMCSECollection*) : HRESULT
    @lpVtbl.value.get_client_side_extensions.call(this, ppigpmcsecollection)
  end
  def get_constants(this : IGPM*, ppigpmconstants : IGPMConstants*) : HRESULT
    @lpVtbl.value.get_constants.call(this, ppigpmconstants)
  end
  def get_migration_table(this : IGPM*, bstrmigrationtablepath : UInt8*, ppmigrationtable : IGPMMigrationTable*) : HRESULT
    @lpVtbl.value.get_migration_table.call(this, bstrmigrationtablepath, ppmigrationtable)
  end
  def create_migration_table(this : IGPM*, ppmigrationtable : IGPMMigrationTable*) : HRESULT
    @lpVtbl.value.create_migration_table.call(this, ppmigrationtable)
  end
  def initialize_reporting(this : IGPM*, bstradmpath : UInt8*) : HRESULT
    @lpVtbl.value.initialize_reporting.call(this, bstradmpath)
  end
end
struct LibWin32::IGPMDomain
  def query_interface(this : IGPMDomain*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGPMDomain*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGPMDomain*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IGPMDomain*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IGPMDomain*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IGPMDomain*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IGPMDomain*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_domain_controller(this : IGPMDomain*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_domain_controller.call(this, pval)
  end
  def get_domain(this : IGPMDomain*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_domain.call(this, pval)
  end
  def create_gpo(this : IGPMDomain*, ppnewgpo : IGPMGPO*) : HRESULT
    @lpVtbl.value.create_gpo.call(this, ppnewgpo)
  end
  def get_gpo(this : IGPMDomain*, bstrguid : UInt8*, ppgpo : IGPMGPO*) : HRESULT
    @lpVtbl.value.get_gpo.call(this, bstrguid, ppgpo)
  end
  def search_gp_os(this : IGPMDomain*, pigpmsearchcriteria : IGPMSearchCriteria, ppigpmgpocollection : IGPMGPOCollection*) : HRESULT
    @lpVtbl.value.search_gp_os.call(this, pigpmsearchcriteria, ppigpmgpocollection)
  end
  def restore_gpo(this : IGPMDomain*, pigpmbackup : IGPMBackup, ldcflags : Int32, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.restore_gpo.call(this, pigpmbackup, ldcflags, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def get_som(this : IGPMDomain*, bstrpath : UInt8*, ppsom : IGPMSOM*) : HRESULT
    @lpVtbl.value.get_som.call(this, bstrpath, ppsom)
  end
  def search_so_ms(this : IGPMDomain*, pigpmsearchcriteria : IGPMSearchCriteria, ppigpmsomcollection : IGPMSOMCollection*) : HRESULT
    @lpVtbl.value.search_so_ms.call(this, pigpmsearchcriteria, ppigpmsomcollection)
  end
  def get_wmi_filter(this : IGPMDomain*, bstrpath : UInt8*, ppwmifilter : IGPMWMIFilter*) : HRESULT
    @lpVtbl.value.get_wmi_filter.call(this, bstrpath, ppwmifilter)
  end
  def search_wmi_filters(this : IGPMDomain*, pigpmsearchcriteria : IGPMSearchCriteria, ppigpmwmifiltercollection : IGPMWMIFilterCollection*) : HRESULT
    @lpVtbl.value.search_wmi_filters.call(this, pigpmsearchcriteria, ppigpmwmifiltercollection)
  end
end
struct LibWin32::IGPMBackupDir
  def query_interface(this : IGPMBackupDir*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGPMBackupDir*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGPMBackupDir*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IGPMBackupDir*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IGPMBackupDir*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IGPMBackupDir*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IGPMBackupDir*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_backup_directory(this : IGPMBackupDir*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_backup_directory.call(this, pval)
  end
  def get_backup(this : IGPMBackupDir*, bstrid : UInt8*, ppbackup : IGPMBackup*) : HRESULT
    @lpVtbl.value.get_backup.call(this, bstrid, ppbackup)
  end
  def search_backups(this : IGPMBackupDir*, pigpmsearchcriteria : IGPMSearchCriteria, ppigpmbackupcollection : IGPMBackupCollection*) : HRESULT
    @lpVtbl.value.search_backups.call(this, pigpmsearchcriteria, ppigpmbackupcollection)
  end
end
struct LibWin32::IGPMSitesContainer
  def query_interface(this : IGPMSitesContainer*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGPMSitesContainer*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGPMSitesContainer*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IGPMSitesContainer*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IGPMSitesContainer*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IGPMSitesContainer*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IGPMSitesContainer*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_domain_controller(this : IGPMSitesContainer*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_domain_controller.call(this, pval)
  end
  def get_domain(this : IGPMSitesContainer*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_domain.call(this, pval)
  end
  def get_forest(this : IGPMSitesContainer*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_forest.call(this, pval)
  end
  def get_site(this : IGPMSitesContainer*, bstrsitename : UInt8*, ppsom : IGPMSOM*) : HRESULT
    @lpVtbl.value.get_site.call(this, bstrsitename, ppsom)
  end
  def search_sites(this : IGPMSitesContainer*, pigpmsearchcriteria : IGPMSearchCriteria, ppigpmsomcollection : IGPMSOMCollection*) : HRESULT
    @lpVtbl.value.search_sites.call(this, pigpmsearchcriteria, ppigpmsomcollection)
  end
end
struct LibWin32::IGPMSearchCriteria
  def query_interface(this : IGPMSearchCriteria*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGPMSearchCriteria*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGPMSearchCriteria*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IGPMSearchCriteria*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IGPMSearchCriteria*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IGPMSearchCriteria*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IGPMSearchCriteria*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def add(this : IGPMSearchCriteria*, searchproperty : GPMSearchProperty, searchoperation : GPMSearchOperation, varvalue : VARIANT) : HRESULT
    @lpVtbl.value.add.call(this, searchproperty, searchoperation, varvalue)
  end
end
struct LibWin32::IGPMTrustee
  def query_interface(this : IGPMTrustee*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGPMTrustee*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGPMTrustee*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IGPMTrustee*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IGPMTrustee*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IGPMTrustee*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IGPMTrustee*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_trustee_sid(this : IGPMTrustee*, bstrval : UInt8**) : HRESULT
    @lpVtbl.value.get_trustee_sid.call(this, bstrval)
  end
  def get_trustee_name(this : IGPMTrustee*, bstrval : UInt8**) : HRESULT
    @lpVtbl.value.get_trustee_name.call(this, bstrval)
  end
  def get_trustee_domain(this : IGPMTrustee*, bstrval : UInt8**) : HRESULT
    @lpVtbl.value.get_trustee_domain.call(this, bstrval)
  end
  def get_trustee_ds_path(this : IGPMTrustee*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_trustee_ds_path.call(this, pval)
  end
  def get_trustee_type(this : IGPMTrustee*, lval : Int32*) : HRESULT
    @lpVtbl.value.get_trustee_type.call(this, lval)
  end
end
struct LibWin32::IGPMPermission
  def query_interface(this : IGPMPermission*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGPMPermission*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGPMPermission*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IGPMPermission*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IGPMPermission*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IGPMPermission*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IGPMPermission*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_inherited(this : IGPMPermission*, pval : Int16*) : HRESULT
    @lpVtbl.value.get_inherited.call(this, pval)
  end
  def get_inheritable(this : IGPMPermission*, pval : Int16*) : HRESULT
    @lpVtbl.value.get_inheritable.call(this, pval)
  end
  def get_denied(this : IGPMPermission*, pval : Int16*) : HRESULT
    @lpVtbl.value.get_denied.call(this, pval)
  end
  def get_permission(this : IGPMPermission*, pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_permission.call(this, pval)
  end
  def get_trustee(this : IGPMPermission*, ppigpmtrustee : IGPMTrustee*) : HRESULT
    @lpVtbl.value.get_trustee.call(this, ppigpmtrustee)
  end
end
struct LibWin32::IGPMSecurityInfo
  def query_interface(this : IGPMSecurityInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGPMSecurityInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGPMSecurityInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IGPMSecurityInfo*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IGPMSecurityInfo*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IGPMSecurityInfo*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IGPMSecurityInfo*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(this : IGPMSecurityInfo*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, pval)
  end
  def get_item(this : IGPMSecurityInfo*, lindex : Int32, pval : VARIANT*) : HRESULT
    @lpVtbl.value.get_item.call(this, lindex, pval)
  end
  def get__new_enum(this : IGPMSecurityInfo*, ppenum : IEnumVARIANT*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, ppenum)
  end
  def add(this : IGPMSecurityInfo*, pperm : IGPMPermission) : HRESULT
    @lpVtbl.value.add.call(this, pperm)
  end
  def remove(this : IGPMSecurityInfo*, pperm : IGPMPermission) : HRESULT
    @lpVtbl.value.remove.call(this, pperm)
  end
  def remove_trustee(this : IGPMSecurityInfo*, bstrtrustee : UInt8*) : HRESULT
    @lpVtbl.value.remove_trustee.call(this, bstrtrustee)
  end
end
struct LibWin32::IGPMBackup
  def query_interface(this : IGPMBackup*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGPMBackup*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGPMBackup*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IGPMBackup*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IGPMBackup*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IGPMBackup*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IGPMBackup*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(this : IGPMBackup*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_id.call(this, pval)
  end
  def get_gpoid(this : IGPMBackup*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_gpoid.call(this, pval)
  end
  def get_gpo_domain(this : IGPMBackup*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_gpo_domain.call(this, pval)
  end
  def get_gpo_display_name(this : IGPMBackup*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_gpo_display_name.call(this, pval)
  end
  def get_timestamp(this : IGPMBackup*, pval : Float64*) : HRESULT
    @lpVtbl.value.get_timestamp.call(this, pval)
  end
  def get_comment(this : IGPMBackup*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_comment.call(this, pval)
  end
  def get_backup_dir(this : IGPMBackup*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_backup_dir.call(this, pval)
  end
  def delete(this : IGPMBackup*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def generate_report(this : IGPMBackup*, gpmreporttype : GPMReportType, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.generate_report.call(this, gpmreporttype, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def generate_report_to_file(this : IGPMBackup*, gpmreporttype : GPMReportType, bstrtargetfilepath : UInt8*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.generate_report_to_file.call(this, gpmreporttype, bstrtargetfilepath, ppigpmresult)
  end
end
struct LibWin32::IGPMBackupCollection
  def query_interface(this : IGPMBackupCollection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGPMBackupCollection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGPMBackupCollection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IGPMBackupCollection*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IGPMBackupCollection*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IGPMBackupCollection*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IGPMBackupCollection*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(this : IGPMBackupCollection*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, pval)
  end
  def get_item(this : IGPMBackupCollection*, lindex : Int32, pval : VARIANT*) : HRESULT
    @lpVtbl.value.get_item.call(this, lindex, pval)
  end
  def get__new_enum(this : IGPMBackupCollection*, ppigpmbackup : IEnumVARIANT*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, ppigpmbackup)
  end
end
struct LibWin32::IGPMSOM
  def query_interface(this : IGPMSOM*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGPMSOM*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGPMSOM*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IGPMSOM*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IGPMSOM*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IGPMSOM*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IGPMSOM*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_gpo_inheritance_blocked(this : IGPMSOM*, pval : Int16*) : HRESULT
    @lpVtbl.value.get_gpo_inheritance_blocked.call(this, pval)
  end
  def put_gpo_inheritance_blocked(this : IGPMSOM*, newval : Int16) : HRESULT
    @lpVtbl.value.put_gpo_inheritance_blocked.call(this, newval)
  end
  def get_name(this : IGPMSOM*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, pval)
  end
  def get_path(this : IGPMSOM*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_path.call(this, pval)
  end
  def create_gpo_link(this : IGPMSOM*, llinkpos : Int32, pgpo : IGPMGPO, ppnewgpolink : IGPMGPOLink*) : HRESULT
    @lpVtbl.value.create_gpo_link.call(this, llinkpos, pgpo, ppnewgpolink)
  end
  def get_type(this : IGPMSOM*, pval : GPMSOMType*) : HRESULT
    @lpVtbl.value.get_type.call(this, pval)
  end
  def get_gpo_links(this : IGPMSOM*, ppgpolinks : IGPMGPOLinksCollection*) : HRESULT
    @lpVtbl.value.get_gpo_links.call(this, ppgpolinks)
  end
  def get_inherited_gpo_links(this : IGPMSOM*, ppgpolinks : IGPMGPOLinksCollection*) : HRESULT
    @lpVtbl.value.get_inherited_gpo_links.call(this, ppgpolinks)
  end
  def get_security_info(this : IGPMSOM*, ppsecurityinfo : IGPMSecurityInfo*) : HRESULT
    @lpVtbl.value.get_security_info.call(this, ppsecurityinfo)
  end
  def set_security_info(this : IGPMSOM*, psecurityinfo : IGPMSecurityInfo) : HRESULT
    @lpVtbl.value.set_security_info.call(this, psecurityinfo)
  end
end
struct LibWin32::IGPMSOMCollection
  def query_interface(this : IGPMSOMCollection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGPMSOMCollection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGPMSOMCollection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IGPMSOMCollection*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IGPMSOMCollection*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IGPMSOMCollection*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IGPMSOMCollection*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(this : IGPMSOMCollection*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, pval)
  end
  def get_item(this : IGPMSOMCollection*, lindex : Int32, pval : VARIANT*) : HRESULT
    @lpVtbl.value.get_item.call(this, lindex, pval)
  end
  def get__new_enum(this : IGPMSOMCollection*, ppigpmsom : IEnumVARIANT*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, ppigpmsom)
  end
end
struct LibWin32::IGPMWMIFilter
  def query_interface(this : IGPMWMIFilter*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGPMWMIFilter*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGPMWMIFilter*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IGPMWMIFilter*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IGPMWMIFilter*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IGPMWMIFilter*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IGPMWMIFilter*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_path(this : IGPMWMIFilter*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_path.call(this, pval)
  end
  def put_name(this : IGPMWMIFilter*, newval : UInt8*) : HRESULT
    @lpVtbl.value.put_name.call(this, newval)
  end
  def get_name(this : IGPMWMIFilter*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, pval)
  end
  def put_description(this : IGPMWMIFilter*, newval : UInt8*) : HRESULT
    @lpVtbl.value.put_description.call(this, newval)
  end
  def get_description(this : IGPMWMIFilter*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, pval)
  end
  def get_query_list(this : IGPMWMIFilter*, pqrylist : VARIANT*) : HRESULT
    @lpVtbl.value.get_query_list.call(this, pqrylist)
  end
  def get_security_info(this : IGPMWMIFilter*, ppsecurityinfo : IGPMSecurityInfo*) : HRESULT
    @lpVtbl.value.get_security_info.call(this, ppsecurityinfo)
  end
  def set_security_info(this : IGPMWMIFilter*, psecurityinfo : IGPMSecurityInfo) : HRESULT
    @lpVtbl.value.set_security_info.call(this, psecurityinfo)
  end
end
struct LibWin32::IGPMWMIFilterCollection
  def query_interface(this : IGPMWMIFilterCollection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGPMWMIFilterCollection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGPMWMIFilterCollection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IGPMWMIFilterCollection*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IGPMWMIFilterCollection*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IGPMWMIFilterCollection*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IGPMWMIFilterCollection*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(this : IGPMWMIFilterCollection*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, pval)
  end
  def get_item(this : IGPMWMIFilterCollection*, lindex : Int32, pval : VARIANT*) : HRESULT
    @lpVtbl.value.get_item.call(this, lindex, pval)
  end
  def get__new_enum(this : IGPMWMIFilterCollection*, pval : IEnumVARIANT*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, pval)
  end
end
struct LibWin32::IGPMRSOP
  def query_interface(this : IGPMRSOP*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGPMRSOP*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGPMRSOP*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IGPMRSOP*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IGPMRSOP*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IGPMRSOP*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IGPMRSOP*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_mode(this : IGPMRSOP*, pval : GPMRSOPMode*) : HRESULT
    @lpVtbl.value.get_mode.call(this, pval)
  end
  def get_namespace(this : IGPMRSOP*, bstrval : UInt8**) : HRESULT
    @lpVtbl.value.get_namespace.call(this, bstrval)
  end
  def put_logging_computer(this : IGPMRSOP*, bstrval : UInt8*) : HRESULT
    @lpVtbl.value.put_logging_computer.call(this, bstrval)
  end
  def get_logging_computer(this : IGPMRSOP*, bstrval : UInt8**) : HRESULT
    @lpVtbl.value.get_logging_computer.call(this, bstrval)
  end
  def put_logging_user(this : IGPMRSOP*, bstrval : UInt8*) : HRESULT
    @lpVtbl.value.put_logging_user.call(this, bstrval)
  end
  def get_logging_user(this : IGPMRSOP*, bstrval : UInt8**) : HRESULT
    @lpVtbl.value.get_logging_user.call(this, bstrval)
  end
  def put_logging_flags(this : IGPMRSOP*, lval : Int32) : HRESULT
    @lpVtbl.value.put_logging_flags.call(this, lval)
  end
  def get_logging_flags(this : IGPMRSOP*, lval : Int32*) : HRESULT
    @lpVtbl.value.get_logging_flags.call(this, lval)
  end
  def put_planning_flags(this : IGPMRSOP*, lval : Int32) : HRESULT
    @lpVtbl.value.put_planning_flags.call(this, lval)
  end
  def get_planning_flags(this : IGPMRSOP*, lval : Int32*) : HRESULT
    @lpVtbl.value.get_planning_flags.call(this, lval)
  end
  def put_planning_domain_controller(this : IGPMRSOP*, bstrval : UInt8*) : HRESULT
    @lpVtbl.value.put_planning_domain_controller.call(this, bstrval)
  end
  def get_planning_domain_controller(this : IGPMRSOP*, bstrval : UInt8**) : HRESULT
    @lpVtbl.value.get_planning_domain_controller.call(this, bstrval)
  end
  def put_planning_site_name(this : IGPMRSOP*, bstrval : UInt8*) : HRESULT
    @lpVtbl.value.put_planning_site_name.call(this, bstrval)
  end
  def get_planning_site_name(this : IGPMRSOP*, bstrval : UInt8**) : HRESULT
    @lpVtbl.value.get_planning_site_name.call(this, bstrval)
  end
  def put_planning_user(this : IGPMRSOP*, bstrval : UInt8*) : HRESULT
    @lpVtbl.value.put_planning_user.call(this, bstrval)
  end
  def get_planning_user(this : IGPMRSOP*, bstrval : UInt8**) : HRESULT
    @lpVtbl.value.get_planning_user.call(this, bstrval)
  end
  def put_planning_user_som(this : IGPMRSOP*, bstrval : UInt8*) : HRESULT
    @lpVtbl.value.put_planning_user_som.call(this, bstrval)
  end
  def get_planning_user_som(this : IGPMRSOP*, bstrval : UInt8**) : HRESULT
    @lpVtbl.value.get_planning_user_som.call(this, bstrval)
  end
  def put_planning_user_wmi_filters(this : IGPMRSOP*, varval : VARIANT) : HRESULT
    @lpVtbl.value.put_planning_user_wmi_filters.call(this, varval)
  end
  def get_planning_user_wmi_filters(this : IGPMRSOP*, varval : VARIANT*) : HRESULT
    @lpVtbl.value.get_planning_user_wmi_filters.call(this, varval)
  end
  def put_planning_user_security_groups(this : IGPMRSOP*, varval : VARIANT) : HRESULT
    @lpVtbl.value.put_planning_user_security_groups.call(this, varval)
  end
  def get_planning_user_security_groups(this : IGPMRSOP*, varval : VARIANT*) : HRESULT
    @lpVtbl.value.get_planning_user_security_groups.call(this, varval)
  end
  def put_planning_computer(this : IGPMRSOP*, bstrval : UInt8*) : HRESULT
    @lpVtbl.value.put_planning_computer.call(this, bstrval)
  end
  def get_planning_computer(this : IGPMRSOP*, bstrval : UInt8**) : HRESULT
    @lpVtbl.value.get_planning_computer.call(this, bstrval)
  end
  def put_planning_computer_som(this : IGPMRSOP*, bstrval : UInt8*) : HRESULT
    @lpVtbl.value.put_planning_computer_som.call(this, bstrval)
  end
  def get_planning_computer_som(this : IGPMRSOP*, bstrval : UInt8**) : HRESULT
    @lpVtbl.value.get_planning_computer_som.call(this, bstrval)
  end
  def put_planning_computer_wmi_filters(this : IGPMRSOP*, varval : VARIANT) : HRESULT
    @lpVtbl.value.put_planning_computer_wmi_filters.call(this, varval)
  end
  def get_planning_computer_wmi_filters(this : IGPMRSOP*, varval : VARIANT*) : HRESULT
    @lpVtbl.value.get_planning_computer_wmi_filters.call(this, varval)
  end
  def put_planning_computer_security_groups(this : IGPMRSOP*, varval : VARIANT) : HRESULT
    @lpVtbl.value.put_planning_computer_security_groups.call(this, varval)
  end
  def get_planning_computer_security_groups(this : IGPMRSOP*, varval : VARIANT*) : HRESULT
    @lpVtbl.value.get_planning_computer_security_groups.call(this, varval)
  end
  def logging_enumerate_users(this : IGPMRSOP*, varval : VARIANT*) : HRESULT
    @lpVtbl.value.logging_enumerate_users.call(this, varval)
  end
  def create_query_results(this : IGPMRSOP*) : HRESULT
    @lpVtbl.value.create_query_results.call(this)
  end
  def release_query_results(this : IGPMRSOP*) : HRESULT
    @lpVtbl.value.release_query_results.call(this)
  end
  def generate_report(this : IGPMRSOP*, gpmreporttype : GPMReportType, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.generate_report.call(this, gpmreporttype, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def generate_report_to_file(this : IGPMRSOP*, gpmreporttype : GPMReportType, bstrtargetfilepath : UInt8*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.generate_report_to_file.call(this, gpmreporttype, bstrtargetfilepath, ppigpmresult)
  end
end
struct LibWin32::IGPMGPO
  def query_interface(this : IGPMGPO*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGPMGPO*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGPMGPO*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IGPMGPO*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IGPMGPO*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IGPMGPO*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IGPMGPO*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_display_name(this : IGPMGPO*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name.call(this, pval)
  end
  def put_display_name(this : IGPMGPO*, newval : UInt8*) : HRESULT
    @lpVtbl.value.put_display_name.call(this, newval)
  end
  def get_path(this : IGPMGPO*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_path.call(this, pval)
  end
  def get_id(this : IGPMGPO*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_id.call(this, pval)
  end
  def get_domain_name(this : IGPMGPO*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_domain_name.call(this, pval)
  end
  def get_creation_time(this : IGPMGPO*, pdate : Float64*) : HRESULT
    @lpVtbl.value.get_creation_time.call(this, pdate)
  end
  def get_modification_time(this : IGPMGPO*, pdate : Float64*) : HRESULT
    @lpVtbl.value.get_modification_time.call(this, pdate)
  end
  def get_user_ds_version_number(this : IGPMGPO*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_user_ds_version_number.call(this, pval)
  end
  def get_computer_ds_version_number(this : IGPMGPO*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_computer_ds_version_number.call(this, pval)
  end
  def get_user_sysvol_version_number(this : IGPMGPO*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_user_sysvol_version_number.call(this, pval)
  end
  def get_computer_sysvol_version_number(this : IGPMGPO*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_computer_sysvol_version_number.call(this, pval)
  end
  def get_wmi_filter(this : IGPMGPO*, ppigpmwmifilter : IGPMWMIFilter*) : HRESULT
    @lpVtbl.value.get_wmi_filter.call(this, ppigpmwmifilter)
  end
  def set_wmi_filter(this : IGPMGPO*, pigpmwmifilter : IGPMWMIFilter) : HRESULT
    @lpVtbl.value.set_wmi_filter.call(this, pigpmwmifilter)
  end
  def set_user_enabled(this : IGPMGPO*, vbenabled : Int16) : HRESULT
    @lpVtbl.value.set_user_enabled.call(this, vbenabled)
  end
  def set_computer_enabled(this : IGPMGPO*, vbenabled : Int16) : HRESULT
    @lpVtbl.value.set_computer_enabled.call(this, vbenabled)
  end
  def is_user_enabled(this : IGPMGPO*, pvbenabled : Int16*) : HRESULT
    @lpVtbl.value.is_user_enabled.call(this, pvbenabled)
  end
  def is_computer_enabled(this : IGPMGPO*, pvbenabled : Int16*) : HRESULT
    @lpVtbl.value.is_computer_enabled.call(this, pvbenabled)
  end
  def get_security_info(this : IGPMGPO*, ppsecurityinfo : IGPMSecurityInfo*) : HRESULT
    @lpVtbl.value.get_security_info.call(this, ppsecurityinfo)
  end
  def set_security_info(this : IGPMGPO*, psecurityinfo : IGPMSecurityInfo) : HRESULT
    @lpVtbl.value.set_security_info.call(this, psecurityinfo)
  end
  def delete(this : IGPMGPO*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def backup(this : IGPMGPO*, bstrbackupdir : UInt8*, bstrcomment : UInt8*, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.backup.call(this, bstrbackupdir, bstrcomment, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def import(this : IGPMGPO*, lflags : Int32, pigpmbackup : IGPMBackup, pvarmigrationtable : VARIANT*, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.import.call(this, lflags, pigpmbackup, pvarmigrationtable, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def generate_report(this : IGPMGPO*, gpmreporttype : GPMReportType, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.generate_report.call(this, gpmreporttype, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def generate_report_to_file(this : IGPMGPO*, gpmreporttype : GPMReportType, bstrtargetfilepath : UInt8*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.generate_report_to_file.call(this, gpmreporttype, bstrtargetfilepath, ppigpmresult)
  end
  def copy_to(this : IGPMGPO*, lflags : Int32, pigpmdomain : IGPMDomain, pvarnewdisplayname : VARIANT*, pvarmigrationtable : VARIANT*, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.copy_to.call(this, lflags, pigpmdomain, pvarnewdisplayname, pvarmigrationtable, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def set_security_descriptor(this : IGPMGPO*, lflags : Int32, psd : IDispatch) : HRESULT
    @lpVtbl.value.set_security_descriptor.call(this, lflags, psd)
  end
  def get_security_descriptor(this : IGPMGPO*, lflags : Int32, ppsd : IDispatch*) : HRESULT
    @lpVtbl.value.get_security_descriptor.call(this, lflags, ppsd)
  end
  def is_acl_consistent(this : IGPMGPO*, pvbconsistent : Int16*) : HRESULT
    @lpVtbl.value.is_acl_consistent.call(this, pvbconsistent)
  end
  def make_acl_consistent(this : IGPMGPO*) : HRESULT
    @lpVtbl.value.make_acl_consistent.call(this)
  end
end
struct LibWin32::IGPMGPOCollection
  def query_interface(this : IGPMGPOCollection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGPMGPOCollection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGPMGPOCollection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IGPMGPOCollection*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IGPMGPOCollection*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IGPMGPOCollection*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IGPMGPOCollection*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(this : IGPMGPOCollection*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, pval)
  end
  def get_item(this : IGPMGPOCollection*, lindex : Int32, pval : VARIANT*) : HRESULT
    @lpVtbl.value.get_item.call(this, lindex, pval)
  end
  def get__new_enum(this : IGPMGPOCollection*, ppigpmgpos : IEnumVARIANT*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, ppigpmgpos)
  end
end
struct LibWin32::IGPMGPOLink
  def query_interface(this : IGPMGPOLink*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGPMGPOLink*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGPMGPOLink*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IGPMGPOLink*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IGPMGPOLink*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IGPMGPOLink*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IGPMGPOLink*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_gpoid(this : IGPMGPOLink*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_gpoid.call(this, pval)
  end
  def get_gpo_domain(this : IGPMGPOLink*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_gpo_domain.call(this, pval)
  end
  def get_enabled(this : IGPMGPOLink*, pval : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.call(this, pval)
  end
  def put_enabled(this : IGPMGPOLink*, newval : Int16) : HRESULT
    @lpVtbl.value.put_enabled.call(this, newval)
  end
  def get_enforced(this : IGPMGPOLink*, pval : Int16*) : HRESULT
    @lpVtbl.value.get_enforced.call(this, pval)
  end
  def put_enforced(this : IGPMGPOLink*, newval : Int16) : HRESULT
    @lpVtbl.value.put_enforced.call(this, newval)
  end
  def get_som_link_order(this : IGPMGPOLink*, lval : Int32*) : HRESULT
    @lpVtbl.value.get_som_link_order.call(this, lval)
  end
  def get_som(this : IGPMGPOLink*, ppigpmsom : IGPMSOM*) : HRESULT
    @lpVtbl.value.get_som.call(this, ppigpmsom)
  end
  def delete(this : IGPMGPOLink*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
end
struct LibWin32::IGPMGPOLinksCollection
  def query_interface(this : IGPMGPOLinksCollection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGPMGPOLinksCollection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGPMGPOLinksCollection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IGPMGPOLinksCollection*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IGPMGPOLinksCollection*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IGPMGPOLinksCollection*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IGPMGPOLinksCollection*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(this : IGPMGPOLinksCollection*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, pval)
  end
  def get_item(this : IGPMGPOLinksCollection*, lindex : Int32, pval : VARIANT*) : HRESULT
    @lpVtbl.value.get_item.call(this, lindex, pval)
  end
  def get__new_enum(this : IGPMGPOLinksCollection*, ppigpmlinks : IEnumVARIANT*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, ppigpmlinks)
  end
end
struct LibWin32::IGPMCSECollection
  def query_interface(this : IGPMCSECollection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGPMCSECollection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGPMCSECollection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IGPMCSECollection*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IGPMCSECollection*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IGPMCSECollection*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IGPMCSECollection*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(this : IGPMCSECollection*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, pval)
  end
  def get_item(this : IGPMCSECollection*, lindex : Int32, pval : VARIANT*) : HRESULT
    @lpVtbl.value.get_item.call(this, lindex, pval)
  end
  def get__new_enum(this : IGPMCSECollection*, ppigpmcses : IEnumVARIANT*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, ppigpmcses)
  end
end
struct LibWin32::IGPMClientSideExtension
  def query_interface(this : IGPMClientSideExtension*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGPMClientSideExtension*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGPMClientSideExtension*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IGPMClientSideExtension*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IGPMClientSideExtension*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IGPMClientSideExtension*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IGPMClientSideExtension*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(this : IGPMClientSideExtension*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_id.call(this, pval)
  end
  def get_display_name(this : IGPMClientSideExtension*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name.call(this, pval)
  end
  def is_user_enabled(this : IGPMClientSideExtension*, pvbenabled : Int16*) : HRESULT
    @lpVtbl.value.is_user_enabled.call(this, pvbenabled)
  end
  def is_computer_enabled(this : IGPMClientSideExtension*, pvbenabled : Int16*) : HRESULT
    @lpVtbl.value.is_computer_enabled.call(this, pvbenabled)
  end
end
struct LibWin32::IGPMAsyncCancel
  def query_interface(this : IGPMAsyncCancel*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGPMAsyncCancel*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGPMAsyncCancel*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IGPMAsyncCancel*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IGPMAsyncCancel*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IGPMAsyncCancel*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IGPMAsyncCancel*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def cancel(this : IGPMAsyncCancel*) : HRESULT
    @lpVtbl.value.cancel.call(this)
  end
end
struct LibWin32::IGPMAsyncProgress
  def query_interface(this : IGPMAsyncProgress*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGPMAsyncProgress*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGPMAsyncProgress*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IGPMAsyncProgress*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IGPMAsyncProgress*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IGPMAsyncProgress*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IGPMAsyncProgress*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def status(this : IGPMAsyncProgress*, lprogressnumerator : Int32, lprogressdenominator : Int32, hrstatus : HRESULT, presult : VARIANT*, ppigpmstatusmsgcollection : IGPMStatusMsgCollection) : HRESULT
    @lpVtbl.value.status.call(this, lprogressnumerator, lprogressdenominator, hrstatus, presult, ppigpmstatusmsgcollection)
  end
end
struct LibWin32::IGPMStatusMsgCollection
  def query_interface(this : IGPMStatusMsgCollection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGPMStatusMsgCollection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGPMStatusMsgCollection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IGPMStatusMsgCollection*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IGPMStatusMsgCollection*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IGPMStatusMsgCollection*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IGPMStatusMsgCollection*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(this : IGPMStatusMsgCollection*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, pval)
  end
  def get_item(this : IGPMStatusMsgCollection*, lindex : Int32, pval : VARIANT*) : HRESULT
    @lpVtbl.value.get_item.call(this, lindex, pval)
  end
  def get__new_enum(this : IGPMStatusMsgCollection*, pval : IEnumVARIANT*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, pval)
  end
end
struct LibWin32::IGPMStatusMessage
  def query_interface(this : IGPMStatusMessage*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGPMStatusMessage*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGPMStatusMessage*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IGPMStatusMessage*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IGPMStatusMessage*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IGPMStatusMessage*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IGPMStatusMessage*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_object_path(this : IGPMStatusMessage*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_object_path.call(this, pval)
  end
  def error_code(this : IGPMStatusMessage*) : HRESULT
    @lpVtbl.value.error_code.call(this)
  end
  def get_extension_name(this : IGPMStatusMessage*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_extension_name.call(this, pval)
  end
  def get_settings_name(this : IGPMStatusMessage*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_settings_name.call(this, pval)
  end
  def operation_code(this : IGPMStatusMessage*) : HRESULT
    @lpVtbl.value.operation_code.call(this)
  end
  def get_message(this : IGPMStatusMessage*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_message.call(this, pval)
  end
end
struct LibWin32::IGPMConstants
  def query_interface(this : IGPMConstants*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGPMConstants*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGPMConstants*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IGPMConstants*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IGPMConstants*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IGPMConstants*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IGPMConstants*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_perm_gpo_apply(this : IGPMConstants*, pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_gpo_apply.call(this, pval)
  end
  def get_perm_gpo_read(this : IGPMConstants*, pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_gpo_read.call(this, pval)
  end
  def get_perm_gpo_edit(this : IGPMConstants*, pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_gpo_edit.call(this, pval)
  end
  def get_perm_gpo_edit_security_and_delete(this : IGPMConstants*, pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_gpo_edit_security_and_delete.call(this, pval)
  end
  def get_perm_gpo_custom(this : IGPMConstants*, pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_gpo_custom.call(this, pval)
  end
  def get_perm_wmi_filter_edit(this : IGPMConstants*, pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_wmi_filter_edit.call(this, pval)
  end
  def get_perm_wmi_filter_full_control(this : IGPMConstants*, pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_wmi_filter_full_control.call(this, pval)
  end
  def get_perm_wmi_filter_custom(this : IGPMConstants*, pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_wmi_filter_custom.call(this, pval)
  end
  def get_perm_som_link(this : IGPMConstants*, pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_som_link.call(this, pval)
  end
  def get_perm_som_logging(this : IGPMConstants*, pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_som_logging.call(this, pval)
  end
  def get_perm_som_planning(this : IGPMConstants*, pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_som_planning.call(this, pval)
  end
  def get_perm_somgpo_create(this : IGPMConstants*, pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_somgpo_create.call(this, pval)
  end
  def get_perm_somwmi_create(this : IGPMConstants*, pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_somwmi_create.call(this, pval)
  end
  def get_perm_somwmi_full_control(this : IGPMConstants*, pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_somwmi_full_control.call(this, pval)
  end
  def get_search_property_gpo_permissions(this : IGPMConstants*, pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_gpo_permissions.call(this, pval)
  end
  def get_search_property_gpo_effective_permissions(this : IGPMConstants*, pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_gpo_effective_permissions.call(this, pval)
  end
  def get_search_property_gpo_display_name(this : IGPMConstants*, pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_gpo_display_name.call(this, pval)
  end
  def get_search_property_gpowmi_filter(this : IGPMConstants*, pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_gpowmi_filter.call(this, pval)
  end
  def get_search_property_gpoid(this : IGPMConstants*, pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_gpoid.call(this, pval)
  end
  def get_search_property_gpo_computer_extensions(this : IGPMConstants*, pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_gpo_computer_extensions.call(this, pval)
  end
  def get_search_property_gpo_user_extensions(this : IGPMConstants*, pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_gpo_user_extensions.call(this, pval)
  end
  def get_search_property_som_links(this : IGPMConstants*, pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_som_links.call(this, pval)
  end
  def get_search_property_gpo_domain(this : IGPMConstants*, pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_gpo_domain.call(this, pval)
  end
  def get_search_property_backup_most_recent(this : IGPMConstants*, pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_backup_most_recent.call(this, pval)
  end
  def get_search_op_equals(this : IGPMConstants*, pval : GPMSearchOperation*) : HRESULT
    @lpVtbl.value.get_search_op_equals.call(this, pval)
  end
  def get_search_op_contains(this : IGPMConstants*, pval : GPMSearchOperation*) : HRESULT
    @lpVtbl.value.get_search_op_contains.call(this, pval)
  end
  def get_search_op_not_contains(this : IGPMConstants*, pval : GPMSearchOperation*) : HRESULT
    @lpVtbl.value.get_search_op_not_contains.call(this, pval)
  end
  def get_search_op_not_equals(this : IGPMConstants*, pval : GPMSearchOperation*) : HRESULT
    @lpVtbl.value.get_search_op_not_equals.call(this, pval)
  end
  def get_use_pdc(this : IGPMConstants*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_use_pdc.call(this, pval)
  end
  def get_use_any_dc(this : IGPMConstants*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_use_any_dc.call(this, pval)
  end
  def get_do_not_use_w2_kdc(this : IGPMConstants*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_do_not_use_w2_kdc.call(this, pval)
  end
  def get_som_site(this : IGPMConstants*, pval : GPMSOMType*) : HRESULT
    @lpVtbl.value.get_som_site.call(this, pval)
  end
  def get_som_domain(this : IGPMConstants*, pval : GPMSOMType*) : HRESULT
    @lpVtbl.value.get_som_domain.call(this, pval)
  end
  def get_somou(this : IGPMConstants*, pval : GPMSOMType*) : HRESULT
    @lpVtbl.value.get_somou.call(this, pval)
  end
  def get_security_flags(this : IGPMConstants*, vbowner : Int16, vbgroup : Int16, vbdacl : Int16, vbsacl : Int16, pval : Int32*) : HRESULT
    @lpVtbl.value.get_security_flags.call(this, vbowner, vbgroup, vbdacl, vbsacl, pval)
  end
  def get_do_not_validate_dc(this : IGPMConstants*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_do_not_validate_dc.call(this, pval)
  end
  def get_report_html(this : IGPMConstants*, pval : GPMReportType*) : HRESULT
    @lpVtbl.value.get_report_html.call(this, pval)
  end
  def get_report_xml(this : IGPMConstants*, pval : GPMReportType*) : HRESULT
    @lpVtbl.value.get_report_xml.call(this, pval)
  end
  def get_rsop_mode_unknown(this : IGPMConstants*, pval : GPMRSOPMode*) : HRESULT
    @lpVtbl.value.get_rsop_mode_unknown.call(this, pval)
  end
  def get_rsop_mode_planning(this : IGPMConstants*, pval : GPMRSOPMode*) : HRESULT
    @lpVtbl.value.get_rsop_mode_planning.call(this, pval)
  end
  def get_rsop_mode_logging(this : IGPMConstants*, pval : GPMRSOPMode*) : HRESULT
    @lpVtbl.value.get_rsop_mode_logging.call(this, pval)
  end
  def get_entry_type_user(this : IGPMConstants*, pval : GPMEntryType*) : HRESULT
    @lpVtbl.value.get_entry_type_user.call(this, pval)
  end
  def get_entry_type_computer(this : IGPMConstants*, pval : GPMEntryType*) : HRESULT
    @lpVtbl.value.get_entry_type_computer.call(this, pval)
  end
  def get_entry_type_local_group(this : IGPMConstants*, pval : GPMEntryType*) : HRESULT
    @lpVtbl.value.get_entry_type_local_group.call(this, pval)
  end
  def get_entry_type_global_group(this : IGPMConstants*, pval : GPMEntryType*) : HRESULT
    @lpVtbl.value.get_entry_type_global_group.call(this, pval)
  end
  def get_entry_type_universal_group(this : IGPMConstants*, pval : GPMEntryType*) : HRESULT
    @lpVtbl.value.get_entry_type_universal_group.call(this, pval)
  end
  def get_entry_type_unc_path(this : IGPMConstants*, pval : GPMEntryType*) : HRESULT
    @lpVtbl.value.get_entry_type_unc_path.call(this, pval)
  end
  def get_entry_type_unknown(this : IGPMConstants*, pval : GPMEntryType*) : HRESULT
    @lpVtbl.value.get_entry_type_unknown.call(this, pval)
  end
  def get_destination_option_same_as_source(this : IGPMConstants*, pval : GPMDestinationOption*) : HRESULT
    @lpVtbl.value.get_destination_option_same_as_source.call(this, pval)
  end
  def get_destination_option_none(this : IGPMConstants*, pval : GPMDestinationOption*) : HRESULT
    @lpVtbl.value.get_destination_option_none.call(this, pval)
  end
  def get_destination_option_by_relative_name(this : IGPMConstants*, pval : GPMDestinationOption*) : HRESULT
    @lpVtbl.value.get_destination_option_by_relative_name.call(this, pval)
  end
  def get_destination_option_set(this : IGPMConstants*, pval : GPMDestinationOption*) : HRESULT
    @lpVtbl.value.get_destination_option_set.call(this, pval)
  end
  def get_migration_table_only(this : IGPMConstants*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_migration_table_only.call(this, pval)
  end
  def get_process_security(this : IGPMConstants*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_process_security.call(this, pval)
  end
  def get_rsop_logging_no_computer(this : IGPMConstants*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_rsop_logging_no_computer.call(this, pval)
  end
  def get_rsop_logging_no_user(this : IGPMConstants*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_rsop_logging_no_user.call(this, pval)
  end
  def get_rsop_planning_assume_slow_link(this : IGPMConstants*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_rsop_planning_assume_slow_link.call(this, pval)
  end
  def get_rsop_planning_loopback_option(this : IGPMConstants*, vbmerge : Int16, pval : Int32*) : HRESULT
    @lpVtbl.value.get_rsop_planning_loopback_option.call(this, vbmerge, pval)
  end
  def get_rsop_planning_assume_user_wql_filter_true(this : IGPMConstants*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_rsop_planning_assume_user_wql_filter_true.call(this, pval)
  end
  def get_rsop_planning_assume_comp_wql_filter_true(this : IGPMConstants*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_rsop_planning_assume_comp_wql_filter_true.call(this, pval)
  end
end
struct LibWin32::IGPMResult
  def query_interface(this : IGPMResult*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGPMResult*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGPMResult*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IGPMResult*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IGPMResult*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IGPMResult*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IGPMResult*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_status(this : IGPMResult*, ppigpmstatusmsgcollection : IGPMStatusMsgCollection*) : HRESULT
    @lpVtbl.value.get_status.call(this, ppigpmstatusmsgcollection)
  end
  def get_result(this : IGPMResult*, pvarresult : VARIANT*) : HRESULT
    @lpVtbl.value.get_result.call(this, pvarresult)
  end
  def overall_status(this : IGPMResult*) : HRESULT
    @lpVtbl.value.overall_status.call(this)
  end
end
struct LibWin32::IGPMMapEntryCollection
  def query_interface(this : IGPMMapEntryCollection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGPMMapEntryCollection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGPMMapEntryCollection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IGPMMapEntryCollection*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IGPMMapEntryCollection*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IGPMMapEntryCollection*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IGPMMapEntryCollection*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(this : IGPMMapEntryCollection*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, pval)
  end
  def get_item(this : IGPMMapEntryCollection*, lindex : Int32, pval : VARIANT*) : HRESULT
    @lpVtbl.value.get_item.call(this, lindex, pval)
  end
  def get__new_enum(this : IGPMMapEntryCollection*, pval : IEnumVARIANT*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, pval)
  end
end
struct LibWin32::IGPMMapEntry
  def query_interface(this : IGPMMapEntry*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGPMMapEntry*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGPMMapEntry*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IGPMMapEntry*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IGPMMapEntry*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IGPMMapEntry*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IGPMMapEntry*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_source(this : IGPMMapEntry*, pbstrsource : UInt8**) : HRESULT
    @lpVtbl.value.get_source.call(this, pbstrsource)
  end
  def get_destination(this : IGPMMapEntry*, pbstrdestination : UInt8**) : HRESULT
    @lpVtbl.value.get_destination.call(this, pbstrdestination)
  end
  def get_destination_option(this : IGPMMapEntry*, pgpmdestoption : GPMDestinationOption*) : HRESULT
    @lpVtbl.value.get_destination_option.call(this, pgpmdestoption)
  end
  def get_entry_type(this : IGPMMapEntry*, pgpmentrytype : GPMEntryType*) : HRESULT
    @lpVtbl.value.get_entry_type.call(this, pgpmentrytype)
  end
end
struct LibWin32::IGPMMigrationTable
  def query_interface(this : IGPMMigrationTable*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGPMMigrationTable*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGPMMigrationTable*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IGPMMigrationTable*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IGPMMigrationTable*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IGPMMigrationTable*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IGPMMigrationTable*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def save(this : IGPMMigrationTable*, bstrmigrationtablepath : UInt8*) : HRESULT
    @lpVtbl.value.save.call(this, bstrmigrationtablepath)
  end
  def add(this : IGPMMigrationTable*, lflags : Int32, var : VARIANT) : HRESULT
    @lpVtbl.value.add.call(this, lflags, var)
  end
  def add_entry(this : IGPMMigrationTable*, bstrsource : UInt8*, gpmentrytype : GPMEntryType, pvardestination : VARIANT*, ppentry : IGPMMapEntry*) : HRESULT
    @lpVtbl.value.add_entry.call(this, bstrsource, gpmentrytype, pvardestination, ppentry)
  end
  def get_entry(this : IGPMMigrationTable*, bstrsource : UInt8*, ppentry : IGPMMapEntry*) : HRESULT
    @lpVtbl.value.get_entry.call(this, bstrsource, ppentry)
  end
  def delete_entry(this : IGPMMigrationTable*, bstrsource : UInt8*) : HRESULT
    @lpVtbl.value.delete_entry.call(this, bstrsource)
  end
  def update_destination(this : IGPMMigrationTable*, bstrsource : UInt8*, pvardestination : VARIANT*, ppentry : IGPMMapEntry*) : HRESULT
    @lpVtbl.value.update_destination.call(this, bstrsource, pvardestination, ppentry)
  end
  def validate(this : IGPMMigrationTable*, ppresult : IGPMResult*) : HRESULT
    @lpVtbl.value.validate.call(this, ppresult)
  end
  def get_entries(this : IGPMMigrationTable*, ppentries : IGPMMapEntryCollection*) : HRESULT
    @lpVtbl.value.get_entries.call(this, ppentries)
  end
end
struct LibWin32::IGPMBackupDirEx
  def query_interface(this : IGPMBackupDirEx*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGPMBackupDirEx*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGPMBackupDirEx*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IGPMBackupDirEx*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IGPMBackupDirEx*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IGPMBackupDirEx*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IGPMBackupDirEx*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_backup_dir(this : IGPMBackupDirEx*, pbstrbackupdir : UInt8**) : HRESULT
    @lpVtbl.value.get_backup_dir.call(this, pbstrbackupdir)
  end
  def get_backup_type(this : IGPMBackupDirEx*, pgpmbackuptype : GPMBackupType*) : HRESULT
    @lpVtbl.value.get_backup_type.call(this, pgpmbackuptype)
  end
  def get_backup(this : IGPMBackupDirEx*, bstrid : UInt8*, pvarbackup : VARIANT*) : HRESULT
    @lpVtbl.value.get_backup.call(this, bstrid, pvarbackup)
  end
  def search_backups(this : IGPMBackupDirEx*, pigpmsearchcriteria : IGPMSearchCriteria, pvarbackupcollection : VARIANT*) : HRESULT
    @lpVtbl.value.search_backups.call(this, pigpmsearchcriteria, pvarbackupcollection)
  end
end
struct LibWin32::IGPMStarterGPOBackupCollection
  def query_interface(this : IGPMStarterGPOBackupCollection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGPMStarterGPOBackupCollection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGPMStarterGPOBackupCollection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IGPMStarterGPOBackupCollection*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IGPMStarterGPOBackupCollection*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IGPMStarterGPOBackupCollection*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IGPMStarterGPOBackupCollection*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(this : IGPMStarterGPOBackupCollection*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, pval)
  end
  def get_item(this : IGPMStarterGPOBackupCollection*, lindex : Int32, pval : VARIANT*) : HRESULT
    @lpVtbl.value.get_item.call(this, lindex, pval)
  end
  def get__new_enum(this : IGPMStarterGPOBackupCollection*, ppigpmtmplbackup : IEnumVARIANT*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, ppigpmtmplbackup)
  end
end
struct LibWin32::IGPMStarterGPOBackup
  def query_interface(this : IGPMStarterGPOBackup*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGPMStarterGPOBackup*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGPMStarterGPOBackup*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IGPMStarterGPOBackup*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IGPMStarterGPOBackup*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IGPMStarterGPOBackup*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IGPMStarterGPOBackup*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_backup_dir(this : IGPMStarterGPOBackup*, pbstrbackupdir : UInt8**) : HRESULT
    @lpVtbl.value.get_backup_dir.call(this, pbstrbackupdir)
  end
  def get_comment(this : IGPMStarterGPOBackup*, pbstrcomment : UInt8**) : HRESULT
    @lpVtbl.value.get_comment.call(this, pbstrcomment)
  end
  def get_display_name(this : IGPMStarterGPOBackup*, pbstrdisplayname : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name.call(this, pbstrdisplayname)
  end
  def get_domain(this : IGPMStarterGPOBackup*, pbstrtemplatedomain : UInt8**) : HRESULT
    @lpVtbl.value.get_domain.call(this, pbstrtemplatedomain)
  end
  def get_starter_gpoid(this : IGPMStarterGPOBackup*, pbstrtemplateid : UInt8**) : HRESULT
    @lpVtbl.value.get_starter_gpoid.call(this, pbstrtemplateid)
  end
  def get_id(this : IGPMStarterGPOBackup*, pbstrid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.call(this, pbstrid)
  end
  def get_timestamp(this : IGPMStarterGPOBackup*, ptimestamp : Float64*) : HRESULT
    @lpVtbl.value.get_timestamp.call(this, ptimestamp)
  end
  def get_type(this : IGPMStarterGPOBackup*, ptype : GPMStarterGPOType*) : HRESULT
    @lpVtbl.value.get_type.call(this, ptype)
  end
  def delete(this : IGPMStarterGPOBackup*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def generate_report(this : IGPMStarterGPOBackup*, gpmreporttype : GPMReportType, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.generate_report.call(this, gpmreporttype, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def generate_report_to_file(this : IGPMStarterGPOBackup*, gpmreporttype : GPMReportType, bstrtargetfilepath : UInt8*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.generate_report_to_file.call(this, gpmreporttype, bstrtargetfilepath, ppigpmresult)
  end
end
struct LibWin32::IGPM2
  def query_interface(this : IGPM2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGPM2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGPM2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IGPM2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IGPM2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IGPM2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IGPM2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_domain(this : IGPM2*, bstrdomain : UInt8*, bstrdomaincontroller : UInt8*, ldcflags : Int32, pigpmdomain : IGPMDomain*) : HRESULT
    @lpVtbl.value.get_domain.call(this, bstrdomain, bstrdomaincontroller, ldcflags, pigpmdomain)
  end
  def get_backup_dir(this : IGPM2*, bstrbackupdir : UInt8*, pigpmbackupdir : IGPMBackupDir*) : HRESULT
    @lpVtbl.value.get_backup_dir.call(this, bstrbackupdir, pigpmbackupdir)
  end
  def get_sites_container(this : IGPM2*, bstrforest : UInt8*, bstrdomain : UInt8*, bstrdomaincontroller : UInt8*, ldcflags : Int32, ppigpmsitescontainer : IGPMSitesContainer*) : HRESULT
    @lpVtbl.value.get_sites_container.call(this, bstrforest, bstrdomain, bstrdomaincontroller, ldcflags, ppigpmsitescontainer)
  end
  def get_rsop(this : IGPM2*, gpmrsopmode : GPMRSOPMode, bstrnamespace : UInt8*, lflags : Int32, ppigpmrsop : IGPMRSOP*) : HRESULT
    @lpVtbl.value.get_rsop.call(this, gpmrsopmode, bstrnamespace, lflags, ppigpmrsop)
  end
  def create_permission(this : IGPM2*, bstrtrustee : UInt8*, perm : GPMPermissionType, binheritable : Int16, ppperm : IGPMPermission*) : HRESULT
    @lpVtbl.value.create_permission.call(this, bstrtrustee, perm, binheritable, ppperm)
  end
  def create_search_criteria(this : IGPM2*, ppigpmsearchcriteria : IGPMSearchCriteria*) : HRESULT
    @lpVtbl.value.create_search_criteria.call(this, ppigpmsearchcriteria)
  end
  def create_trustee(this : IGPM2*, bstrtrustee : UInt8*, ppigpmtrustee : IGPMTrustee*) : HRESULT
    @lpVtbl.value.create_trustee.call(this, bstrtrustee, ppigpmtrustee)
  end
  def get_client_side_extensions(this : IGPM2*, ppigpmcsecollection : IGPMCSECollection*) : HRESULT
    @lpVtbl.value.get_client_side_extensions.call(this, ppigpmcsecollection)
  end
  def get_constants(this : IGPM2*, ppigpmconstants : IGPMConstants*) : HRESULT
    @lpVtbl.value.get_constants.call(this, ppigpmconstants)
  end
  def get_migration_table(this : IGPM2*, bstrmigrationtablepath : UInt8*, ppmigrationtable : IGPMMigrationTable*) : HRESULT
    @lpVtbl.value.get_migration_table.call(this, bstrmigrationtablepath, ppmigrationtable)
  end
  def create_migration_table(this : IGPM2*, ppmigrationtable : IGPMMigrationTable*) : HRESULT
    @lpVtbl.value.create_migration_table.call(this, ppmigrationtable)
  end
  def initialize_reporting(this : IGPM2*, bstradmpath : UInt8*) : HRESULT
    @lpVtbl.value.initialize_reporting.call(this, bstradmpath)
  end
  def get_backup_dir_ex(this : IGPM2*, bstrbackupdir : UInt8*, backupdirtype : GPMBackupType, ppigpmbackupdirex : IGPMBackupDirEx*) : HRESULT
    @lpVtbl.value.get_backup_dir_ex.call(this, bstrbackupdir, backupdirtype, ppigpmbackupdirex)
  end
  def initialize_reporting_ex(this : IGPM2*, bstradmpath : UInt8*, reportingoptions : Int32) : HRESULT
    @lpVtbl.value.initialize_reporting_ex.call(this, bstradmpath, reportingoptions)
  end
end
struct LibWin32::IGPMStarterGPO
  def query_interface(this : IGPMStarterGPO*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGPMStarterGPO*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGPMStarterGPO*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IGPMStarterGPO*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IGPMStarterGPO*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IGPMStarterGPO*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IGPMStarterGPO*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_display_name(this : IGPMStarterGPO*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name.call(this, pval)
  end
  def put_display_name(this : IGPMStarterGPO*, newval : UInt8*) : HRESULT
    @lpVtbl.value.put_display_name.call(this, newval)
  end
  def get_description(this : IGPMStarterGPO*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, pval)
  end
  def put_description(this : IGPMStarterGPO*, newval : UInt8*) : HRESULT
    @lpVtbl.value.put_description.call(this, newval)
  end
  def get_author(this : IGPMStarterGPO*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_author.call(this, pval)
  end
  def get_product(this : IGPMStarterGPO*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_product.call(this, pval)
  end
  def get_creation_time(this : IGPMStarterGPO*, pval : Float64*) : HRESULT
    @lpVtbl.value.get_creation_time.call(this, pval)
  end
  def get_id(this : IGPMStarterGPO*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_id.call(this, pval)
  end
  def get_modified_time(this : IGPMStarterGPO*, pval : Float64*) : HRESULT
    @lpVtbl.value.get_modified_time.call(this, pval)
  end
  def get_type(this : IGPMStarterGPO*, pval : GPMStarterGPOType*) : HRESULT
    @lpVtbl.value.get_type.call(this, pval)
  end
  def get_computer_version(this : IGPMStarterGPO*, pval : UInt16*) : HRESULT
    @lpVtbl.value.get_computer_version.call(this, pval)
  end
  def get_user_version(this : IGPMStarterGPO*, pval : UInt16*) : HRESULT
    @lpVtbl.value.get_user_version.call(this, pval)
  end
  def get_starter_gpo_version(this : IGPMStarterGPO*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_starter_gpo_version.call(this, pval)
  end
  def delete(this : IGPMStarterGPO*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def save(this : IGPMStarterGPO*, bstrsavefile : UInt8*, boverwrite : Int16, bsaveassystem : Int16, bstrlanguage : VARIANT*, bstrauthor : VARIANT*, bstrproduct : VARIANT*, bstruniqueid : VARIANT*, bstrversion : VARIANT*, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.save.call(this, bstrsavefile, boverwrite, bsaveassystem, bstrlanguage, bstrauthor, bstrproduct, bstruniqueid, bstrversion, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def backup(this : IGPMStarterGPO*, bstrbackupdir : UInt8*, bstrcomment : UInt8*, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.backup.call(this, bstrbackupdir, bstrcomment, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def copy_to(this : IGPMStarterGPO*, pvarnewdisplayname : VARIANT*, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.copy_to.call(this, pvarnewdisplayname, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def generate_report(this : IGPMStarterGPO*, gpmreporttype : GPMReportType, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.generate_report.call(this, gpmreporttype, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def generate_report_to_file(this : IGPMStarterGPO*, gpmreporttype : GPMReportType, bstrtargetfilepath : UInt8*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.generate_report_to_file.call(this, gpmreporttype, bstrtargetfilepath, ppigpmresult)
  end
  def get_security_info(this : IGPMStarterGPO*, ppsecurityinfo : IGPMSecurityInfo*) : HRESULT
    @lpVtbl.value.get_security_info.call(this, ppsecurityinfo)
  end
  def set_security_info(this : IGPMStarterGPO*, psecurityinfo : IGPMSecurityInfo) : HRESULT
    @lpVtbl.value.set_security_info.call(this, psecurityinfo)
  end
end
struct LibWin32::IGPMStarterGPOCollection
  def query_interface(this : IGPMStarterGPOCollection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGPMStarterGPOCollection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGPMStarterGPOCollection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IGPMStarterGPOCollection*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IGPMStarterGPOCollection*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IGPMStarterGPOCollection*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IGPMStarterGPOCollection*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(this : IGPMStarterGPOCollection*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, pval)
  end
  def get_item(this : IGPMStarterGPOCollection*, lindex : Int32, pval : VARIANT*) : HRESULT
    @lpVtbl.value.get_item.call(this, lindex, pval)
  end
  def get__new_enum(this : IGPMStarterGPOCollection*, ppigpmtemplates : IEnumVARIANT*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, ppigpmtemplates)
  end
end
struct LibWin32::IGPMDomain2
  def query_interface(this : IGPMDomain2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGPMDomain2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGPMDomain2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IGPMDomain2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IGPMDomain2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IGPMDomain2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IGPMDomain2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_domain_controller(this : IGPMDomain2*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_domain_controller.call(this, pval)
  end
  def get_domain(this : IGPMDomain2*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_domain.call(this, pval)
  end
  def create_gpo(this : IGPMDomain2*, ppnewgpo : IGPMGPO*) : HRESULT
    @lpVtbl.value.create_gpo.call(this, ppnewgpo)
  end
  def get_gpo(this : IGPMDomain2*, bstrguid : UInt8*, ppgpo : IGPMGPO*) : HRESULT
    @lpVtbl.value.get_gpo.call(this, bstrguid, ppgpo)
  end
  def search_gp_os(this : IGPMDomain2*, pigpmsearchcriteria : IGPMSearchCriteria, ppigpmgpocollection : IGPMGPOCollection*) : HRESULT
    @lpVtbl.value.search_gp_os.call(this, pigpmsearchcriteria, ppigpmgpocollection)
  end
  def restore_gpo(this : IGPMDomain2*, pigpmbackup : IGPMBackup, ldcflags : Int32, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.restore_gpo.call(this, pigpmbackup, ldcflags, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def get_som(this : IGPMDomain2*, bstrpath : UInt8*, ppsom : IGPMSOM*) : HRESULT
    @lpVtbl.value.get_som.call(this, bstrpath, ppsom)
  end
  def search_so_ms(this : IGPMDomain2*, pigpmsearchcriteria : IGPMSearchCriteria, ppigpmsomcollection : IGPMSOMCollection*) : HRESULT
    @lpVtbl.value.search_so_ms.call(this, pigpmsearchcriteria, ppigpmsomcollection)
  end
  def get_wmi_filter(this : IGPMDomain2*, bstrpath : UInt8*, ppwmifilter : IGPMWMIFilter*) : HRESULT
    @lpVtbl.value.get_wmi_filter.call(this, bstrpath, ppwmifilter)
  end
  def search_wmi_filters(this : IGPMDomain2*, pigpmsearchcriteria : IGPMSearchCriteria, ppigpmwmifiltercollection : IGPMWMIFilterCollection*) : HRESULT
    @lpVtbl.value.search_wmi_filters.call(this, pigpmsearchcriteria, ppigpmwmifiltercollection)
  end
  def create_starter_gpo(this : IGPMDomain2*, ppnewtemplate : IGPMStarterGPO*) : HRESULT
    @lpVtbl.value.create_starter_gpo.call(this, ppnewtemplate)
  end
  def create_gpo_from_starter_gpo(this : IGPMDomain2*, pgpotemplate : IGPMStarterGPO, ppnewgpo : IGPMGPO*) : HRESULT
    @lpVtbl.value.create_gpo_from_starter_gpo.call(this, pgpotemplate, ppnewgpo)
  end
  def get_starter_gpo(this : IGPMDomain2*, bstrguid : UInt8*, pptemplate : IGPMStarterGPO*) : HRESULT
    @lpVtbl.value.get_starter_gpo.call(this, bstrguid, pptemplate)
  end
  def search_starter_gp_os(this : IGPMDomain2*, pigpmsearchcriteria : IGPMSearchCriteria, ppigpmtemplatecollection : IGPMStarterGPOCollection*) : HRESULT
    @lpVtbl.value.search_starter_gp_os.call(this, pigpmsearchcriteria, ppigpmtemplatecollection)
  end
  def load_starter_gpo(this : IGPMDomain2*, bstrloadfile : UInt8*, boverwrite : Int16, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.load_starter_gpo.call(this, bstrloadfile, boverwrite, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def restore_starter_gpo(this : IGPMDomain2*, pigpmtmplbackup : IGPMStarterGPOBackup, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.restore_starter_gpo.call(this, pigpmtmplbackup, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
end
struct LibWin32::IGPMConstants2
  def query_interface(this : IGPMConstants2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGPMConstants2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGPMConstants2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IGPMConstants2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IGPMConstants2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IGPMConstants2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IGPMConstants2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_perm_gpo_apply(this : IGPMConstants2*, pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_gpo_apply.call(this, pval)
  end
  def get_perm_gpo_read(this : IGPMConstants2*, pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_gpo_read.call(this, pval)
  end
  def get_perm_gpo_edit(this : IGPMConstants2*, pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_gpo_edit.call(this, pval)
  end
  def get_perm_gpo_edit_security_and_delete(this : IGPMConstants2*, pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_gpo_edit_security_and_delete.call(this, pval)
  end
  def get_perm_gpo_custom(this : IGPMConstants2*, pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_gpo_custom.call(this, pval)
  end
  def get_perm_wmi_filter_edit(this : IGPMConstants2*, pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_wmi_filter_edit.call(this, pval)
  end
  def get_perm_wmi_filter_full_control(this : IGPMConstants2*, pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_wmi_filter_full_control.call(this, pval)
  end
  def get_perm_wmi_filter_custom(this : IGPMConstants2*, pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_wmi_filter_custom.call(this, pval)
  end
  def get_perm_som_link(this : IGPMConstants2*, pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_som_link.call(this, pval)
  end
  def get_perm_som_logging(this : IGPMConstants2*, pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_som_logging.call(this, pval)
  end
  def get_perm_som_planning(this : IGPMConstants2*, pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_som_planning.call(this, pval)
  end
  def get_perm_somgpo_create(this : IGPMConstants2*, pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_somgpo_create.call(this, pval)
  end
  def get_perm_somwmi_create(this : IGPMConstants2*, pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_somwmi_create.call(this, pval)
  end
  def get_perm_somwmi_full_control(this : IGPMConstants2*, pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_somwmi_full_control.call(this, pval)
  end
  def get_search_property_gpo_permissions(this : IGPMConstants2*, pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_gpo_permissions.call(this, pval)
  end
  def get_search_property_gpo_effective_permissions(this : IGPMConstants2*, pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_gpo_effective_permissions.call(this, pval)
  end
  def get_search_property_gpo_display_name(this : IGPMConstants2*, pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_gpo_display_name.call(this, pval)
  end
  def get_search_property_gpowmi_filter(this : IGPMConstants2*, pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_gpowmi_filter.call(this, pval)
  end
  def get_search_property_gpoid(this : IGPMConstants2*, pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_gpoid.call(this, pval)
  end
  def get_search_property_gpo_computer_extensions(this : IGPMConstants2*, pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_gpo_computer_extensions.call(this, pval)
  end
  def get_search_property_gpo_user_extensions(this : IGPMConstants2*, pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_gpo_user_extensions.call(this, pval)
  end
  def get_search_property_som_links(this : IGPMConstants2*, pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_som_links.call(this, pval)
  end
  def get_search_property_gpo_domain(this : IGPMConstants2*, pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_gpo_domain.call(this, pval)
  end
  def get_search_property_backup_most_recent(this : IGPMConstants2*, pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_backup_most_recent.call(this, pval)
  end
  def get_search_op_equals(this : IGPMConstants2*, pval : GPMSearchOperation*) : HRESULT
    @lpVtbl.value.get_search_op_equals.call(this, pval)
  end
  def get_search_op_contains(this : IGPMConstants2*, pval : GPMSearchOperation*) : HRESULT
    @lpVtbl.value.get_search_op_contains.call(this, pval)
  end
  def get_search_op_not_contains(this : IGPMConstants2*, pval : GPMSearchOperation*) : HRESULT
    @lpVtbl.value.get_search_op_not_contains.call(this, pval)
  end
  def get_search_op_not_equals(this : IGPMConstants2*, pval : GPMSearchOperation*) : HRESULT
    @lpVtbl.value.get_search_op_not_equals.call(this, pval)
  end
  def get_use_pdc(this : IGPMConstants2*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_use_pdc.call(this, pval)
  end
  def get_use_any_dc(this : IGPMConstants2*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_use_any_dc.call(this, pval)
  end
  def get_do_not_use_w2_kdc(this : IGPMConstants2*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_do_not_use_w2_kdc.call(this, pval)
  end
  def get_som_site(this : IGPMConstants2*, pval : GPMSOMType*) : HRESULT
    @lpVtbl.value.get_som_site.call(this, pval)
  end
  def get_som_domain(this : IGPMConstants2*, pval : GPMSOMType*) : HRESULT
    @lpVtbl.value.get_som_domain.call(this, pval)
  end
  def get_somou(this : IGPMConstants2*, pval : GPMSOMType*) : HRESULT
    @lpVtbl.value.get_somou.call(this, pval)
  end
  def get_security_flags(this : IGPMConstants2*, vbowner : Int16, vbgroup : Int16, vbdacl : Int16, vbsacl : Int16, pval : Int32*) : HRESULT
    @lpVtbl.value.get_security_flags.call(this, vbowner, vbgroup, vbdacl, vbsacl, pval)
  end
  def get_do_not_validate_dc(this : IGPMConstants2*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_do_not_validate_dc.call(this, pval)
  end
  def get_report_html(this : IGPMConstants2*, pval : GPMReportType*) : HRESULT
    @lpVtbl.value.get_report_html.call(this, pval)
  end
  def get_report_xml(this : IGPMConstants2*, pval : GPMReportType*) : HRESULT
    @lpVtbl.value.get_report_xml.call(this, pval)
  end
  def get_rsop_mode_unknown(this : IGPMConstants2*, pval : GPMRSOPMode*) : HRESULT
    @lpVtbl.value.get_rsop_mode_unknown.call(this, pval)
  end
  def get_rsop_mode_planning(this : IGPMConstants2*, pval : GPMRSOPMode*) : HRESULT
    @lpVtbl.value.get_rsop_mode_planning.call(this, pval)
  end
  def get_rsop_mode_logging(this : IGPMConstants2*, pval : GPMRSOPMode*) : HRESULT
    @lpVtbl.value.get_rsop_mode_logging.call(this, pval)
  end
  def get_entry_type_user(this : IGPMConstants2*, pval : GPMEntryType*) : HRESULT
    @lpVtbl.value.get_entry_type_user.call(this, pval)
  end
  def get_entry_type_computer(this : IGPMConstants2*, pval : GPMEntryType*) : HRESULT
    @lpVtbl.value.get_entry_type_computer.call(this, pval)
  end
  def get_entry_type_local_group(this : IGPMConstants2*, pval : GPMEntryType*) : HRESULT
    @lpVtbl.value.get_entry_type_local_group.call(this, pval)
  end
  def get_entry_type_global_group(this : IGPMConstants2*, pval : GPMEntryType*) : HRESULT
    @lpVtbl.value.get_entry_type_global_group.call(this, pval)
  end
  def get_entry_type_universal_group(this : IGPMConstants2*, pval : GPMEntryType*) : HRESULT
    @lpVtbl.value.get_entry_type_universal_group.call(this, pval)
  end
  def get_entry_type_unc_path(this : IGPMConstants2*, pval : GPMEntryType*) : HRESULT
    @lpVtbl.value.get_entry_type_unc_path.call(this, pval)
  end
  def get_entry_type_unknown(this : IGPMConstants2*, pval : GPMEntryType*) : HRESULT
    @lpVtbl.value.get_entry_type_unknown.call(this, pval)
  end
  def get_destination_option_same_as_source(this : IGPMConstants2*, pval : GPMDestinationOption*) : HRESULT
    @lpVtbl.value.get_destination_option_same_as_source.call(this, pval)
  end
  def get_destination_option_none(this : IGPMConstants2*, pval : GPMDestinationOption*) : HRESULT
    @lpVtbl.value.get_destination_option_none.call(this, pval)
  end
  def get_destination_option_by_relative_name(this : IGPMConstants2*, pval : GPMDestinationOption*) : HRESULT
    @lpVtbl.value.get_destination_option_by_relative_name.call(this, pval)
  end
  def get_destination_option_set(this : IGPMConstants2*, pval : GPMDestinationOption*) : HRESULT
    @lpVtbl.value.get_destination_option_set.call(this, pval)
  end
  def get_migration_table_only(this : IGPMConstants2*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_migration_table_only.call(this, pval)
  end
  def get_process_security(this : IGPMConstants2*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_process_security.call(this, pval)
  end
  def get_rsop_logging_no_computer(this : IGPMConstants2*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_rsop_logging_no_computer.call(this, pval)
  end
  def get_rsop_logging_no_user(this : IGPMConstants2*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_rsop_logging_no_user.call(this, pval)
  end
  def get_rsop_planning_assume_slow_link(this : IGPMConstants2*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_rsop_planning_assume_slow_link.call(this, pval)
  end
  def get_rsop_planning_loopback_option(this : IGPMConstants2*, vbmerge : Int16, pval : Int32*) : HRESULT
    @lpVtbl.value.get_rsop_planning_loopback_option.call(this, vbmerge, pval)
  end
  def get_rsop_planning_assume_user_wql_filter_true(this : IGPMConstants2*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_rsop_planning_assume_user_wql_filter_true.call(this, pval)
  end
  def get_rsop_planning_assume_comp_wql_filter_true(this : IGPMConstants2*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_rsop_planning_assume_comp_wql_filter_true.call(this, pval)
  end
  def get_backup_type_gpo(this : IGPMConstants2*, pval : GPMBackupType*) : HRESULT
    @lpVtbl.value.get_backup_type_gpo.call(this, pval)
  end
  def get_backup_type_starter_gpo(this : IGPMConstants2*, pval : GPMBackupType*) : HRESULT
    @lpVtbl.value.get_backup_type_starter_gpo.call(this, pval)
  end
  def get_starter_gpo_type_system(this : IGPMConstants2*, pval : GPMStarterGPOType*) : HRESULT
    @lpVtbl.value.get_starter_gpo_type_system.call(this, pval)
  end
  def get_starter_gpo_type_custom(this : IGPMConstants2*, pval : GPMStarterGPOType*) : HRESULT
    @lpVtbl.value.get_starter_gpo_type_custom.call(this, pval)
  end
  def get_search_property_starter_gpo_permissions(this : IGPMConstants2*, pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_starter_gpo_permissions.call(this, pval)
  end
  def get_search_property_starter_gpo_effective_permissions(this : IGPMConstants2*, pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_starter_gpo_effective_permissions.call(this, pval)
  end
  def get_search_property_starter_gpo_display_name(this : IGPMConstants2*, pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_starter_gpo_display_name.call(this, pval)
  end
  def get_search_property_starter_gpoid(this : IGPMConstants2*, pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_starter_gpoid.call(this, pval)
  end
  def get_search_property_starter_gpo_domain(this : IGPMConstants2*, pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_starter_gpo_domain.call(this, pval)
  end
  def get_perm_starter_gpo_read(this : IGPMConstants2*, pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_starter_gpo_read.call(this, pval)
  end
  def get_perm_starter_gpo_edit(this : IGPMConstants2*, pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_starter_gpo_edit.call(this, pval)
  end
  def get_perm_starter_gpo_full_control(this : IGPMConstants2*, pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_starter_gpo_full_control.call(this, pval)
  end
  def get_perm_starter_gpo_custom(this : IGPMConstants2*, pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_starter_gpo_custom.call(this, pval)
  end
  def get_report_legacy(this : IGPMConstants2*, pval : GPMReportingOptions*) : HRESULT
    @lpVtbl.value.get_report_legacy.call(this, pval)
  end
  def get_report_comments(this : IGPMConstants2*, pval : GPMReportingOptions*) : HRESULT
    @lpVtbl.value.get_report_comments.call(this, pval)
  end
end
struct LibWin32::IGPMGPO2
  def query_interface(this : IGPMGPO2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGPMGPO2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGPMGPO2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IGPMGPO2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IGPMGPO2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IGPMGPO2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IGPMGPO2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_display_name(this : IGPMGPO2*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name.call(this, pval)
  end
  def put_display_name(this : IGPMGPO2*, newval : UInt8*) : HRESULT
    @lpVtbl.value.put_display_name.call(this, newval)
  end
  def get_path(this : IGPMGPO2*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_path.call(this, pval)
  end
  def get_id(this : IGPMGPO2*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_id.call(this, pval)
  end
  def get_domain_name(this : IGPMGPO2*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_domain_name.call(this, pval)
  end
  def get_creation_time(this : IGPMGPO2*, pdate : Float64*) : HRESULT
    @lpVtbl.value.get_creation_time.call(this, pdate)
  end
  def get_modification_time(this : IGPMGPO2*, pdate : Float64*) : HRESULT
    @lpVtbl.value.get_modification_time.call(this, pdate)
  end
  def get_user_ds_version_number(this : IGPMGPO2*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_user_ds_version_number.call(this, pval)
  end
  def get_computer_ds_version_number(this : IGPMGPO2*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_computer_ds_version_number.call(this, pval)
  end
  def get_user_sysvol_version_number(this : IGPMGPO2*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_user_sysvol_version_number.call(this, pval)
  end
  def get_computer_sysvol_version_number(this : IGPMGPO2*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_computer_sysvol_version_number.call(this, pval)
  end
  def get_wmi_filter(this : IGPMGPO2*, ppigpmwmifilter : IGPMWMIFilter*) : HRESULT
    @lpVtbl.value.get_wmi_filter.call(this, ppigpmwmifilter)
  end
  def set_wmi_filter(this : IGPMGPO2*, pigpmwmifilter : IGPMWMIFilter) : HRESULT
    @lpVtbl.value.set_wmi_filter.call(this, pigpmwmifilter)
  end
  def set_user_enabled(this : IGPMGPO2*, vbenabled : Int16) : HRESULT
    @lpVtbl.value.set_user_enabled.call(this, vbenabled)
  end
  def set_computer_enabled(this : IGPMGPO2*, vbenabled : Int16) : HRESULT
    @lpVtbl.value.set_computer_enabled.call(this, vbenabled)
  end
  def is_user_enabled(this : IGPMGPO2*, pvbenabled : Int16*) : HRESULT
    @lpVtbl.value.is_user_enabled.call(this, pvbenabled)
  end
  def is_computer_enabled(this : IGPMGPO2*, pvbenabled : Int16*) : HRESULT
    @lpVtbl.value.is_computer_enabled.call(this, pvbenabled)
  end
  def get_security_info(this : IGPMGPO2*, ppsecurityinfo : IGPMSecurityInfo*) : HRESULT
    @lpVtbl.value.get_security_info.call(this, ppsecurityinfo)
  end
  def set_security_info(this : IGPMGPO2*, psecurityinfo : IGPMSecurityInfo) : HRESULT
    @lpVtbl.value.set_security_info.call(this, psecurityinfo)
  end
  def delete(this : IGPMGPO2*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def backup(this : IGPMGPO2*, bstrbackupdir : UInt8*, bstrcomment : UInt8*, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.backup.call(this, bstrbackupdir, bstrcomment, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def import(this : IGPMGPO2*, lflags : Int32, pigpmbackup : IGPMBackup, pvarmigrationtable : VARIANT*, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.import.call(this, lflags, pigpmbackup, pvarmigrationtable, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def generate_report(this : IGPMGPO2*, gpmreporttype : GPMReportType, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.generate_report.call(this, gpmreporttype, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def generate_report_to_file(this : IGPMGPO2*, gpmreporttype : GPMReportType, bstrtargetfilepath : UInt8*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.generate_report_to_file.call(this, gpmreporttype, bstrtargetfilepath, ppigpmresult)
  end
  def copy_to(this : IGPMGPO2*, lflags : Int32, pigpmdomain : IGPMDomain, pvarnewdisplayname : VARIANT*, pvarmigrationtable : VARIANT*, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.copy_to.call(this, lflags, pigpmdomain, pvarnewdisplayname, pvarmigrationtable, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def set_security_descriptor(this : IGPMGPO2*, lflags : Int32, psd : IDispatch) : HRESULT
    @lpVtbl.value.set_security_descriptor.call(this, lflags, psd)
  end
  def get_security_descriptor(this : IGPMGPO2*, lflags : Int32, ppsd : IDispatch*) : HRESULT
    @lpVtbl.value.get_security_descriptor.call(this, lflags, ppsd)
  end
  def is_acl_consistent(this : IGPMGPO2*, pvbconsistent : Int16*) : HRESULT
    @lpVtbl.value.is_acl_consistent.call(this, pvbconsistent)
  end
  def make_acl_consistent(this : IGPMGPO2*) : HRESULT
    @lpVtbl.value.make_acl_consistent.call(this)
  end
  def get_description(this : IGPMGPO2*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, pval)
  end
  def put_description(this : IGPMGPO2*, newval : UInt8*) : HRESULT
    @lpVtbl.value.put_description.call(this, newval)
  end
end
struct LibWin32::IGPMDomain3
  def query_interface(this : IGPMDomain3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGPMDomain3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGPMDomain3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IGPMDomain3*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IGPMDomain3*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IGPMDomain3*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IGPMDomain3*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_domain_controller(this : IGPMDomain3*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_domain_controller.call(this, pval)
  end
  def get_domain(this : IGPMDomain3*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_domain.call(this, pval)
  end
  def create_gpo(this : IGPMDomain3*, ppnewgpo : IGPMGPO*) : HRESULT
    @lpVtbl.value.create_gpo.call(this, ppnewgpo)
  end
  def get_gpo(this : IGPMDomain3*, bstrguid : UInt8*, ppgpo : IGPMGPO*) : HRESULT
    @lpVtbl.value.get_gpo.call(this, bstrguid, ppgpo)
  end
  def search_gp_os(this : IGPMDomain3*, pigpmsearchcriteria : IGPMSearchCriteria, ppigpmgpocollection : IGPMGPOCollection*) : HRESULT
    @lpVtbl.value.search_gp_os.call(this, pigpmsearchcriteria, ppigpmgpocollection)
  end
  def restore_gpo(this : IGPMDomain3*, pigpmbackup : IGPMBackup, ldcflags : Int32, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.restore_gpo.call(this, pigpmbackup, ldcflags, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def get_som(this : IGPMDomain3*, bstrpath : UInt8*, ppsom : IGPMSOM*) : HRESULT
    @lpVtbl.value.get_som.call(this, bstrpath, ppsom)
  end
  def search_so_ms(this : IGPMDomain3*, pigpmsearchcriteria : IGPMSearchCriteria, ppigpmsomcollection : IGPMSOMCollection*) : HRESULT
    @lpVtbl.value.search_so_ms.call(this, pigpmsearchcriteria, ppigpmsomcollection)
  end
  def get_wmi_filter(this : IGPMDomain3*, bstrpath : UInt8*, ppwmifilter : IGPMWMIFilter*) : HRESULT
    @lpVtbl.value.get_wmi_filter.call(this, bstrpath, ppwmifilter)
  end
  def search_wmi_filters(this : IGPMDomain3*, pigpmsearchcriteria : IGPMSearchCriteria, ppigpmwmifiltercollection : IGPMWMIFilterCollection*) : HRESULT
    @lpVtbl.value.search_wmi_filters.call(this, pigpmsearchcriteria, ppigpmwmifiltercollection)
  end
  def create_starter_gpo(this : IGPMDomain3*, ppnewtemplate : IGPMStarterGPO*) : HRESULT
    @lpVtbl.value.create_starter_gpo.call(this, ppnewtemplate)
  end
  def create_gpo_from_starter_gpo(this : IGPMDomain3*, pgpotemplate : IGPMStarterGPO, ppnewgpo : IGPMGPO*) : HRESULT
    @lpVtbl.value.create_gpo_from_starter_gpo.call(this, pgpotemplate, ppnewgpo)
  end
  def get_starter_gpo(this : IGPMDomain3*, bstrguid : UInt8*, pptemplate : IGPMStarterGPO*) : HRESULT
    @lpVtbl.value.get_starter_gpo.call(this, bstrguid, pptemplate)
  end
  def search_starter_gp_os(this : IGPMDomain3*, pigpmsearchcriteria : IGPMSearchCriteria, ppigpmtemplatecollection : IGPMStarterGPOCollection*) : HRESULT
    @lpVtbl.value.search_starter_gp_os.call(this, pigpmsearchcriteria, ppigpmtemplatecollection)
  end
  def load_starter_gpo(this : IGPMDomain3*, bstrloadfile : UInt8*, boverwrite : Int16, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.load_starter_gpo.call(this, bstrloadfile, boverwrite, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def restore_starter_gpo(this : IGPMDomain3*, pigpmtmplbackup : IGPMStarterGPOBackup, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.restore_starter_gpo.call(this, pigpmtmplbackup, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def generate_report(this : IGPMDomain3*, gpmreporttype : GPMReportType, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.generate_report.call(this, gpmreporttype, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def get_infrastructure_dc(this : IGPMDomain3*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_infrastructure_dc.call(this, pval)
  end
  def put_infrastructure_dc(this : IGPMDomain3*, newval : UInt8*) : HRESULT
    @lpVtbl.value.put_infrastructure_dc.call(this, newval)
  end
  def put_infrastructure_flags(this : IGPMDomain3*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.put_infrastructure_flags.call(this, dwflags)
  end
end
struct LibWin32::IGPMGPO3
  def query_interface(this : IGPMGPO3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGPMGPO3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGPMGPO3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IGPMGPO3*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IGPMGPO3*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IGPMGPO3*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IGPMGPO3*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_display_name(this : IGPMGPO3*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name.call(this, pval)
  end
  def put_display_name(this : IGPMGPO3*, newval : UInt8*) : HRESULT
    @lpVtbl.value.put_display_name.call(this, newval)
  end
  def get_path(this : IGPMGPO3*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_path.call(this, pval)
  end
  def get_id(this : IGPMGPO3*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_id.call(this, pval)
  end
  def get_domain_name(this : IGPMGPO3*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_domain_name.call(this, pval)
  end
  def get_creation_time(this : IGPMGPO3*, pdate : Float64*) : HRESULT
    @lpVtbl.value.get_creation_time.call(this, pdate)
  end
  def get_modification_time(this : IGPMGPO3*, pdate : Float64*) : HRESULT
    @lpVtbl.value.get_modification_time.call(this, pdate)
  end
  def get_user_ds_version_number(this : IGPMGPO3*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_user_ds_version_number.call(this, pval)
  end
  def get_computer_ds_version_number(this : IGPMGPO3*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_computer_ds_version_number.call(this, pval)
  end
  def get_user_sysvol_version_number(this : IGPMGPO3*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_user_sysvol_version_number.call(this, pval)
  end
  def get_computer_sysvol_version_number(this : IGPMGPO3*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_computer_sysvol_version_number.call(this, pval)
  end
  def get_wmi_filter(this : IGPMGPO3*, ppigpmwmifilter : IGPMWMIFilter*) : HRESULT
    @lpVtbl.value.get_wmi_filter.call(this, ppigpmwmifilter)
  end
  def set_wmi_filter(this : IGPMGPO3*, pigpmwmifilter : IGPMWMIFilter) : HRESULT
    @lpVtbl.value.set_wmi_filter.call(this, pigpmwmifilter)
  end
  def set_user_enabled(this : IGPMGPO3*, vbenabled : Int16) : HRESULT
    @lpVtbl.value.set_user_enabled.call(this, vbenabled)
  end
  def set_computer_enabled(this : IGPMGPO3*, vbenabled : Int16) : HRESULT
    @lpVtbl.value.set_computer_enabled.call(this, vbenabled)
  end
  def is_user_enabled(this : IGPMGPO3*, pvbenabled : Int16*) : HRESULT
    @lpVtbl.value.is_user_enabled.call(this, pvbenabled)
  end
  def is_computer_enabled(this : IGPMGPO3*, pvbenabled : Int16*) : HRESULT
    @lpVtbl.value.is_computer_enabled.call(this, pvbenabled)
  end
  def get_security_info(this : IGPMGPO3*, ppsecurityinfo : IGPMSecurityInfo*) : HRESULT
    @lpVtbl.value.get_security_info.call(this, ppsecurityinfo)
  end
  def set_security_info(this : IGPMGPO3*, psecurityinfo : IGPMSecurityInfo) : HRESULT
    @lpVtbl.value.set_security_info.call(this, psecurityinfo)
  end
  def delete(this : IGPMGPO3*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def backup(this : IGPMGPO3*, bstrbackupdir : UInt8*, bstrcomment : UInt8*, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.backup.call(this, bstrbackupdir, bstrcomment, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def import(this : IGPMGPO3*, lflags : Int32, pigpmbackup : IGPMBackup, pvarmigrationtable : VARIANT*, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.import.call(this, lflags, pigpmbackup, pvarmigrationtable, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def generate_report(this : IGPMGPO3*, gpmreporttype : GPMReportType, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.generate_report.call(this, gpmreporttype, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def generate_report_to_file(this : IGPMGPO3*, gpmreporttype : GPMReportType, bstrtargetfilepath : UInt8*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.generate_report_to_file.call(this, gpmreporttype, bstrtargetfilepath, ppigpmresult)
  end
  def copy_to(this : IGPMGPO3*, lflags : Int32, pigpmdomain : IGPMDomain, pvarnewdisplayname : VARIANT*, pvarmigrationtable : VARIANT*, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.copy_to.call(this, lflags, pigpmdomain, pvarnewdisplayname, pvarmigrationtable, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def set_security_descriptor(this : IGPMGPO3*, lflags : Int32, psd : IDispatch) : HRESULT
    @lpVtbl.value.set_security_descriptor.call(this, lflags, psd)
  end
  def get_security_descriptor(this : IGPMGPO3*, lflags : Int32, ppsd : IDispatch*) : HRESULT
    @lpVtbl.value.get_security_descriptor.call(this, lflags, ppsd)
  end
  def is_acl_consistent(this : IGPMGPO3*, pvbconsistent : Int16*) : HRESULT
    @lpVtbl.value.is_acl_consistent.call(this, pvbconsistent)
  end
  def make_acl_consistent(this : IGPMGPO3*) : HRESULT
    @lpVtbl.value.make_acl_consistent.call(this)
  end
  def get_description(this : IGPMGPO3*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, pval)
  end
  def put_description(this : IGPMGPO3*, newval : UInt8*) : HRESULT
    @lpVtbl.value.put_description.call(this, newval)
  end
  def get_infrastructure_dc(this : IGPMGPO3*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_infrastructure_dc.call(this, pval)
  end
  def put_infrastructure_dc(this : IGPMGPO3*, newval : UInt8*) : HRESULT
    @lpVtbl.value.put_infrastructure_dc.call(this, newval)
  end
  def put_infrastructure_flags(this : IGPMGPO3*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.put_infrastructure_flags.call(this, dwflags)
  end
end
struct LibWin32::IGPEInformation
  def query_interface(this : IGPEInformation*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGPEInformation*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGPEInformation*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_name(this : IGPEInformation*, pszname : Char*, cchmaxlength : Int32) : HRESULT
    @lpVtbl.value.get_name.call(this, pszname, cchmaxlength)
  end
  def get_display_name(this : IGPEInformation*, pszname : Char*, cchmaxlength : Int32) : HRESULT
    @lpVtbl.value.get_display_name.call(this, pszname, cchmaxlength)
  end
  def get_registry_key(this : IGPEInformation*, dwsection : UInt32, hkey : HKEY*) : HRESULT
    @lpVtbl.value.get_registry_key.call(this, dwsection, hkey)
  end
  def get_ds_path(this : IGPEInformation*, dwsection : UInt32, pszpath : Char*, cchmaxpath : Int32) : HRESULT
    @lpVtbl.value.get_ds_path.call(this, dwsection, pszpath, cchmaxpath)
  end
  def get_file_sys_path(this : IGPEInformation*, dwsection : UInt32, pszpath : Char*, cchmaxpath : Int32) : HRESULT
    @lpVtbl.value.get_file_sys_path.call(this, dwsection, pszpath, cchmaxpath)
  end
  def get_options(this : IGPEInformation*, dwoptions : UInt32*) : HRESULT
    @lpVtbl.value.get_options.call(this, dwoptions)
  end
  def get_type(this : IGPEInformation*, gpotype : GROUP_POLICY_OBJECT_TYPE*) : HRESULT
    @lpVtbl.value.get_type.call(this, gpotype)
  end
  def get_hint(this : IGPEInformation*, gphint : GROUP_POLICY_HINT_TYPE*) : HRESULT
    @lpVtbl.value.get_hint.call(this, gphint)
  end
  def policy_changed(this : IGPEInformation*, bmachine : LibC::BOOL, badd : LibC::BOOL, pguidextension : Guid*, pguidsnapin : Guid*) : HRESULT
    @lpVtbl.value.policy_changed.call(this, bmachine, badd, pguidextension, pguidsnapin)
  end
end
struct LibWin32::IGroupPolicyObject
  def query_interface(this : IGroupPolicyObject*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGroupPolicyObject*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGroupPolicyObject*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def new(this : IGroupPolicyObject*, pszdomainname : LibC::LPWSTR, pszdisplayname : LibC::LPWSTR, dwflags : UInt32) : HRESULT
    @lpVtbl.value.new.call(this, pszdomainname, pszdisplayname, dwflags)
  end
  def open_dsgpo(this : IGroupPolicyObject*, pszpath : LibC::LPWSTR, dwflags : UInt32) : HRESULT
    @lpVtbl.value.open_dsgpo.call(this, pszpath, dwflags)
  end
  def open_local_machine_gpo(this : IGroupPolicyObject*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.open_local_machine_gpo.call(this, dwflags)
  end
  def open_remote_machine_gpo(this : IGroupPolicyObject*, pszcomputername : LibC::LPWSTR, dwflags : UInt32) : HRESULT
    @lpVtbl.value.open_remote_machine_gpo.call(this, pszcomputername, dwflags)
  end
  def save(this : IGroupPolicyObject*, bmachine : LibC::BOOL, badd : LibC::BOOL, pguidextension : Guid*, pguid : Guid*) : HRESULT
    @lpVtbl.value.save.call(this, bmachine, badd, pguidextension, pguid)
  end
  def delete(this : IGroupPolicyObject*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def get_name(this : IGroupPolicyObject*, pszname : Char*, cchmaxlength : Int32) : HRESULT
    @lpVtbl.value.get_name.call(this, pszname, cchmaxlength)
  end
  def get_display_name(this : IGroupPolicyObject*, pszname : Char*, cchmaxlength : Int32) : HRESULT
    @lpVtbl.value.get_display_name.call(this, pszname, cchmaxlength)
  end
  def set_display_name(this : IGroupPolicyObject*, pszname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_display_name.call(this, pszname)
  end
  def get_path(this : IGroupPolicyObject*, pszpath : Char*, cchmaxlength : Int32) : HRESULT
    @lpVtbl.value.get_path.call(this, pszpath, cchmaxlength)
  end
  def get_ds_path(this : IGroupPolicyObject*, dwsection : UInt32, pszpath : Char*, cchmaxpath : Int32) : HRESULT
    @lpVtbl.value.get_ds_path.call(this, dwsection, pszpath, cchmaxpath)
  end
  def get_file_sys_path(this : IGroupPolicyObject*, dwsection : UInt32, pszpath : Char*, cchmaxpath : Int32) : HRESULT
    @lpVtbl.value.get_file_sys_path.call(this, dwsection, pszpath, cchmaxpath)
  end
  def get_registry_key(this : IGroupPolicyObject*, dwsection : UInt32, hkey : HKEY*) : HRESULT
    @lpVtbl.value.get_registry_key.call(this, dwsection, hkey)
  end
  def get_options(this : IGroupPolicyObject*, dwoptions : UInt32*) : HRESULT
    @lpVtbl.value.get_options.call(this, dwoptions)
  end
  def set_options(this : IGroupPolicyObject*, dwoptions : UInt32, dwmask : UInt32) : HRESULT
    @lpVtbl.value.set_options.call(this, dwoptions, dwmask)
  end
  def get_type(this : IGroupPolicyObject*, gpotype : GROUP_POLICY_OBJECT_TYPE*) : HRESULT
    @lpVtbl.value.get_type.call(this, gpotype)
  end
  def get_machine_name(this : IGroupPolicyObject*, pszname : Char*, cchmaxlength : Int32) : HRESULT
    @lpVtbl.value.get_machine_name.call(this, pszname, cchmaxlength)
  end
  def get_property_sheet_pages(this : IGroupPolicyObject*, hpages : HPROPSHEETPAGE**, upagecount : UInt32*) : HRESULT
    @lpVtbl.value.get_property_sheet_pages.call(this, hpages, upagecount)
  end
end
struct LibWin32::IRSOPInformation
  def query_interface(this : IRSOPInformation*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRSOPInformation*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRSOPInformation*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_namespace(this : IRSOPInformation*, dwsection : UInt32, pszname : Char*, cchmaxlength : Int32) : HRESULT
    @lpVtbl.value.get_namespace.call(this, dwsection, pszname, cchmaxlength)
  end
  def get_flags(this : IRSOPInformation*, pdwflags : UInt32*) : HRESULT
    @lpVtbl.value.get_flags.call(this, pdwflags)
  end
  def get_event_log_entry_text(this : IRSOPInformation*, pszeventsource : LibC::LPWSTR, pszeventlogname : LibC::LPWSTR, pszeventtime : LibC::LPWSTR, dweventid : UInt32, ppsztext : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_event_log_entry_text.call(this, pszeventsource, pszeventlogname, pszeventtime, dweventid, ppsztext)
  end
end
