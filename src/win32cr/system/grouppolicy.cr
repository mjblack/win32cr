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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_domain : UInt64
    get_backup_dir : UInt64
    get_sites_container : UInt64
    get_rsop : UInt64
    create_permission : UInt64
    create_search_criteria : UInt64
    create_trustee : UInt64
    get_client_side_extensions : UInt64
    get_constants : UInt64
    get_migration_table : UInt64
    create_migration_table : UInt64
    initialize_reporting : UInt64
  end

  IGPM_GUID = "f5fae809-3bd6-4da9-a65e-17665b41d763"
  IID_IGPM = LibC::GUID.new(0xf5fae809_u32, 0x3bd6_u16, 0x4da9_u16, StaticArray[0xa6_u8, 0x5e_u8, 0x17_u8, 0x66_u8, 0x5b_u8, 0x41_u8, 0xd7_u8, 0x63_u8])
  struct IGPM
    lpVtbl : IGPMVTbl*
  end

  struct IGPMDomainVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_domain_controller : UInt64
    get_domain : UInt64
    create_gpo : UInt64
    get_gpo : UInt64
    search_gp_os : UInt64
    restore_gpo : UInt64
    get_som : UInt64
    search_so_ms : UInt64
    get_wmi_filter : UInt64
    search_wmi_filters : UInt64
  end

  IGPMDomain_GUID = "6b21cc14-5a00-4f44-a738-feec8a94c7e3"
  IID_IGPMDomain = LibC::GUID.new(0x6b21cc14_u32, 0x5a00_u16, 0x4f44_u16, StaticArray[0xa7_u8, 0x38_u8, 0xfe_u8, 0xec_u8, 0x8a_u8, 0x94_u8, 0xc7_u8, 0xe3_u8])
  struct IGPMDomain
    lpVtbl : IGPMDomainVTbl*
  end

  struct IGPMBackupDirVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_backup_directory : UInt64
    get_backup : UInt64
    search_backups : UInt64
  end

  IGPMBackupDir_GUID = "b1568bed-0a93-4acc-810f-afe7081019b9"
  IID_IGPMBackupDir = LibC::GUID.new(0xb1568bed_u32, 0xa93_u16, 0x4acc_u16, StaticArray[0x81_u8, 0xf_u8, 0xaf_u8, 0xe7_u8, 0x8_u8, 0x10_u8, 0x19_u8, 0xb9_u8])
  struct IGPMBackupDir
    lpVtbl : IGPMBackupDirVTbl*
  end

  struct IGPMSitesContainerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_domain_controller : UInt64
    get_domain : UInt64
    get_forest : UInt64
    get_site : UInt64
    search_sites : UInt64
  end

  IGPMSitesContainer_GUID = "4725a899-2782-4d27-a6bb-d499246ffd72"
  IID_IGPMSitesContainer = LibC::GUID.new(0x4725a899_u32, 0x2782_u16, 0x4d27_u16, StaticArray[0xa6_u8, 0xbb_u8, 0xd4_u8, 0x99_u8, 0x24_u8, 0x6f_u8, 0xfd_u8, 0x72_u8])
  struct IGPMSitesContainer
    lpVtbl : IGPMSitesContainerVTbl*
  end

  struct IGPMSearchCriteriaVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    add : UInt64
  end

  IGPMSearchCriteria_GUID = "d6f11c42-829b-48d4-83f5-3615b67dfc22"
  IID_IGPMSearchCriteria = LibC::GUID.new(0xd6f11c42_u32, 0x829b_u16, 0x48d4_u16, StaticArray[0x83_u8, 0xf5_u8, 0x36_u8, 0x15_u8, 0xb6_u8, 0x7d_u8, 0xfc_u8, 0x22_u8])
  struct IGPMSearchCriteria
    lpVtbl : IGPMSearchCriteriaVTbl*
  end

  struct IGPMTrusteeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_trustee_sid : UInt64
    get_trustee_name : UInt64
    get_trustee_domain : UInt64
    get_trustee_ds_path : UInt64
    get_trustee_type : UInt64
  end

  IGPMTrustee_GUID = "3b466da8-c1a4-4b2a-999a-befcdd56cefb"
  IID_IGPMTrustee = LibC::GUID.new(0x3b466da8_u32, 0xc1a4_u16, 0x4b2a_u16, StaticArray[0x99_u8, 0x9a_u8, 0xbe_u8, 0xfc_u8, 0xdd_u8, 0x56_u8, 0xce_u8, 0xfb_u8])
  struct IGPMTrustee
    lpVtbl : IGPMTrusteeVTbl*
  end

  struct IGPMPermissionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_inherited : UInt64
    get_inheritable : UInt64
    get_denied : UInt64
    get_permission : UInt64
    get_trustee : UInt64
  end

  IGPMPermission_GUID = "35ebca40-e1a1-4a02-8905-d79416fb464a"
  IID_IGPMPermission = LibC::GUID.new(0x35ebca40_u32, 0xe1a1_u16, 0x4a02_u16, StaticArray[0x89_u8, 0x5_u8, 0xd7_u8, 0x94_u8, 0x16_u8, 0xfb_u8, 0x46_u8, 0x4a_u8])
  struct IGPMPermission
    lpVtbl : IGPMPermissionVTbl*
  end

  struct IGPMSecurityInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    get_item : UInt64
    get__new_enum : UInt64
    add : UInt64
    remove : UInt64
    remove_trustee : UInt64
  end

  IGPMSecurityInfo_GUID = "b6c31ed4-1c93-4d3e-ae84-eb6d61161b60"
  IID_IGPMSecurityInfo = LibC::GUID.new(0xb6c31ed4_u32, 0x1c93_u16, 0x4d3e_u16, StaticArray[0xae_u8, 0x84_u8, 0xeb_u8, 0x6d_u8, 0x61_u8, 0x16_u8, 0x1b_u8, 0x60_u8])
  struct IGPMSecurityInfo
    lpVtbl : IGPMSecurityInfoVTbl*
  end

  struct IGPMBackupVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    get_gpoid : UInt64
    get_gpo_domain : UInt64
    get_gpo_display_name : UInt64
    get_timestamp : UInt64
    get_comment : UInt64
    get_backup_dir : UInt64
    delete : UInt64
    generate_report : UInt64
    generate_report_to_file : UInt64
  end

  IGPMBackup_GUID = "d8a16a35-3b0d-416b-8d02-4df6f95a7119"
  IID_IGPMBackup = LibC::GUID.new(0xd8a16a35_u32, 0x3b0d_u16, 0x416b_u16, StaticArray[0x8d_u8, 0x2_u8, 0x4d_u8, 0xf6_u8, 0xf9_u8, 0x5a_u8, 0x71_u8, 0x19_u8])
  struct IGPMBackup
    lpVtbl : IGPMBackupVTbl*
  end

  struct IGPMBackupCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    get_item : UInt64
    get__new_enum : UInt64
  end

  IGPMBackupCollection_GUID = "c786fc0f-26d8-4bab-a745-39ca7e800cac"
  IID_IGPMBackupCollection = LibC::GUID.new(0xc786fc0f_u32, 0x26d8_u16, 0x4bab_u16, StaticArray[0xa7_u8, 0x45_u8, 0x39_u8, 0xca_u8, 0x7e_u8, 0x80_u8, 0xc_u8, 0xac_u8])
  struct IGPMBackupCollection
    lpVtbl : IGPMBackupCollectionVTbl*
  end

  struct IGPMSOMVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_gpo_inheritance_blocked : UInt64
    put_gpo_inheritance_blocked : UInt64
    get_name : UInt64
    get_path : UInt64
    create_gpo_link : UInt64
    get_type : UInt64
    get_gpo_links : UInt64
    get_inherited_gpo_links : UInt64
    get_security_info : UInt64
    set_security_info : UInt64
  end

  IGPMSOM_GUID = "c0a7f09e-05a1-4f0c-8158-9e5c33684f6b"
  IID_IGPMSOM = LibC::GUID.new(0xc0a7f09e_u32, 0x5a1_u16, 0x4f0c_u16, StaticArray[0x81_u8, 0x58_u8, 0x9e_u8, 0x5c_u8, 0x33_u8, 0x68_u8, 0x4f_u8, 0x6b_u8])
  struct IGPMSOM
    lpVtbl : IGPMSOMVTbl*
  end

  struct IGPMSOMCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    get_item : UInt64
    get__new_enum : UInt64
  end

  IGPMSOMCollection_GUID = "adc1688e-00e4-4495-abba-bed200df0cab"
  IID_IGPMSOMCollection = LibC::GUID.new(0xadc1688e_u32, 0xe4_u16, 0x4495_u16, StaticArray[0xab_u8, 0xba_u8, 0xbe_u8, 0xd2_u8, 0x0_u8, 0xdf_u8, 0xc_u8, 0xab_u8])
  struct IGPMSOMCollection
    lpVtbl : IGPMSOMCollectionVTbl*
  end

  struct IGPMWMIFilterVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_path : UInt64
    put_name : UInt64
    get_name : UInt64
    put_description : UInt64
    get_description : UInt64
    get_query_list : UInt64
    get_security_info : UInt64
    set_security_info : UInt64
  end

  IGPMWMIFilter_GUID = "ef2ff9b4-3c27-459a-b979-038305cec75d"
  IID_IGPMWMIFilter = LibC::GUID.new(0xef2ff9b4_u32, 0x3c27_u16, 0x459a_u16, StaticArray[0xb9_u8, 0x79_u8, 0x3_u8, 0x83_u8, 0x5_u8, 0xce_u8, 0xc7_u8, 0x5d_u8])
  struct IGPMWMIFilter
    lpVtbl : IGPMWMIFilterVTbl*
  end

  struct IGPMWMIFilterCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    get_item : UInt64
    get__new_enum : UInt64
  end

  IGPMWMIFilterCollection_GUID = "5782d582-1a36-4661-8a94-c3c32551945b"
  IID_IGPMWMIFilterCollection = LibC::GUID.new(0x5782d582_u32, 0x1a36_u16, 0x4661_u16, StaticArray[0x8a_u8, 0x94_u8, 0xc3_u8, 0xc3_u8, 0x25_u8, 0x51_u8, 0x94_u8, 0x5b_u8])
  struct IGPMWMIFilterCollection
    lpVtbl : IGPMWMIFilterCollectionVTbl*
  end

  struct IGPMRSOPVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_mode : UInt64
    get_namespace : UInt64
    put_logging_computer : UInt64
    get_logging_computer : UInt64
    put_logging_user : UInt64
    get_logging_user : UInt64
    put_logging_flags : UInt64
    get_logging_flags : UInt64
    put_planning_flags : UInt64
    get_planning_flags : UInt64
    put_planning_domain_controller : UInt64
    get_planning_domain_controller : UInt64
    put_planning_site_name : UInt64
    get_planning_site_name : UInt64
    put_planning_user : UInt64
    get_planning_user : UInt64
    put_planning_user_som : UInt64
    get_planning_user_som : UInt64
    put_planning_user_wmi_filters : UInt64
    get_planning_user_wmi_filters : UInt64
    put_planning_user_security_groups : UInt64
    get_planning_user_security_groups : UInt64
    put_planning_computer : UInt64
    get_planning_computer : UInt64
    put_planning_computer_som : UInt64
    get_planning_computer_som : UInt64
    put_planning_computer_wmi_filters : UInt64
    get_planning_computer_wmi_filters : UInt64
    put_planning_computer_security_groups : UInt64
    get_planning_computer_security_groups : UInt64
    logging_enumerate_users : UInt64
    create_query_results : UInt64
    release_query_results : UInt64
    generate_report : UInt64
    generate_report_to_file : UInt64
  end

  IGPMRSOP_GUID = "49ed785a-3237-4ff2-b1f0-fdf5a8d5a1ee"
  IID_IGPMRSOP = LibC::GUID.new(0x49ed785a_u32, 0x3237_u16, 0x4ff2_u16, StaticArray[0xb1_u8, 0xf0_u8, 0xfd_u8, 0xf5_u8, 0xa8_u8, 0xd5_u8, 0xa1_u8, 0xee_u8])
  struct IGPMRSOP
    lpVtbl : IGPMRSOPVTbl*
  end

  struct IGPMGPOVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_display_name : UInt64
    put_display_name : UInt64
    get_path : UInt64
    get_id : UInt64
    get_domain_name : UInt64
    get_creation_time : UInt64
    get_modification_time : UInt64
    get_user_ds_version_number : UInt64
    get_computer_ds_version_number : UInt64
    get_user_sysvol_version_number : UInt64
    get_computer_sysvol_version_number : UInt64
    get_wmi_filter : UInt64
    set_wmi_filter : UInt64
    set_user_enabled : UInt64
    set_computer_enabled : UInt64
    is_user_enabled : UInt64
    is_computer_enabled : UInt64
    get_security_info : UInt64
    set_security_info : UInt64
    delete : UInt64
    backup : UInt64
    import : UInt64
    generate_report : UInt64
    generate_report_to_file : UInt64
    copy_to : UInt64
    set_security_descriptor : UInt64
    get_security_descriptor : UInt64
    is_acl_consistent : UInt64
    make_acl_consistent : UInt64
  end

  IGPMGPO_GUID = "58cc4352-1ca3-48e5-9864-1da4d6e0d60f"
  IID_IGPMGPO = LibC::GUID.new(0x58cc4352_u32, 0x1ca3_u16, 0x48e5_u16, StaticArray[0x98_u8, 0x64_u8, 0x1d_u8, 0xa4_u8, 0xd6_u8, 0xe0_u8, 0xd6_u8, 0xf_u8])
  struct IGPMGPO
    lpVtbl : IGPMGPOVTbl*
  end

  struct IGPMGPOCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    get_item : UInt64
    get__new_enum : UInt64
  end

  IGPMGPOCollection_GUID = "f0f0d5cf-70ca-4c39-9e29-b642f8726c01"
  IID_IGPMGPOCollection = LibC::GUID.new(0xf0f0d5cf_u32, 0x70ca_u16, 0x4c39_u16, StaticArray[0x9e_u8, 0x29_u8, 0xb6_u8, 0x42_u8, 0xf8_u8, 0x72_u8, 0x6c_u8, 0x1_u8])
  struct IGPMGPOCollection
    lpVtbl : IGPMGPOCollectionVTbl*
  end

  struct IGPMGPOLinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_gpoid : UInt64
    get_gpo_domain : UInt64
    get_enabled : UInt64
    put_enabled : UInt64
    get_enforced : UInt64
    put_enforced : UInt64
    get_som_link_order : UInt64
    get_som : UInt64
    delete : UInt64
  end

  IGPMGPOLink_GUID = "434b99bd-5de7-478a-809c-c251721df70c"
  IID_IGPMGPOLink = LibC::GUID.new(0x434b99bd_u32, 0x5de7_u16, 0x478a_u16, StaticArray[0x80_u8, 0x9c_u8, 0xc2_u8, 0x51_u8, 0x72_u8, 0x1d_u8, 0xf7_u8, 0xc_u8])
  struct IGPMGPOLink
    lpVtbl : IGPMGPOLinkVTbl*
  end

  struct IGPMGPOLinksCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    get_item : UInt64
    get__new_enum : UInt64
  end

  IGPMGPOLinksCollection_GUID = "189d7b68-16bd-4d0d-a2ec-2e6aa2288c7f"
  IID_IGPMGPOLinksCollection = LibC::GUID.new(0x189d7b68_u32, 0x16bd_u16, 0x4d0d_u16, StaticArray[0xa2_u8, 0xec_u8, 0x2e_u8, 0x6a_u8, 0xa2_u8, 0x28_u8, 0x8c_u8, 0x7f_u8])
  struct IGPMGPOLinksCollection
    lpVtbl : IGPMGPOLinksCollectionVTbl*
  end

  struct IGPMCSECollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    get_item : UInt64
    get__new_enum : UInt64
  end

  IGPMCSECollection_GUID = "2e52a97d-0a4a-4a6f-85db-201622455da0"
  IID_IGPMCSECollection = LibC::GUID.new(0x2e52a97d_u32, 0xa4a_u16, 0x4a6f_u16, StaticArray[0x85_u8, 0xdb_u8, 0x20_u8, 0x16_u8, 0x22_u8, 0x45_u8, 0x5d_u8, 0xa0_u8])
  struct IGPMCSECollection
    lpVtbl : IGPMCSECollectionVTbl*
  end

  struct IGPMClientSideExtensionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    get_display_name : UInt64
    is_user_enabled : UInt64
    is_computer_enabled : UInt64
  end

  IGPMClientSideExtension_GUID = "69da7488-b8db-415e-9266-901be4d49928"
  IID_IGPMClientSideExtension = LibC::GUID.new(0x69da7488_u32, 0xb8db_u16, 0x415e_u16, StaticArray[0x92_u8, 0x66_u8, 0x90_u8, 0x1b_u8, 0xe4_u8, 0xd4_u8, 0x99_u8, 0x28_u8])
  struct IGPMClientSideExtension
    lpVtbl : IGPMClientSideExtensionVTbl*
  end

  struct IGPMAsyncCancelVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    cancel : UInt64
  end

  IGPMAsyncCancel_GUID = "ddc67754-be67-4541-8166-f48166868c9c"
  IID_IGPMAsyncCancel = LibC::GUID.new(0xddc67754_u32, 0xbe67_u16, 0x4541_u16, StaticArray[0x81_u8, 0x66_u8, 0xf4_u8, 0x81_u8, 0x66_u8, 0x86_u8, 0x8c_u8, 0x9c_u8])
  struct IGPMAsyncCancel
    lpVtbl : IGPMAsyncCancelVTbl*
  end

  struct IGPMAsyncProgressVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    status : UInt64
  end

  IGPMAsyncProgress_GUID = "6aac29f8-5948-4324-bf70-423818942dbc"
  IID_IGPMAsyncProgress = LibC::GUID.new(0x6aac29f8_u32, 0x5948_u16, 0x4324_u16, StaticArray[0xbf_u8, 0x70_u8, 0x42_u8, 0x38_u8, 0x18_u8, 0x94_u8, 0x2d_u8, 0xbc_u8])
  struct IGPMAsyncProgress
    lpVtbl : IGPMAsyncProgressVTbl*
  end

  struct IGPMStatusMsgCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    get_item : UInt64
    get__new_enum : UInt64
  end

  IGPMStatusMsgCollection_GUID = "9b6e1af0-1a92-40f3-a59d-f36ac1f728b7"
  IID_IGPMStatusMsgCollection = LibC::GUID.new(0x9b6e1af0_u32, 0x1a92_u16, 0x40f3_u16, StaticArray[0xa5_u8, 0x9d_u8, 0xf3_u8, 0x6a_u8, 0xc1_u8, 0xf7_u8, 0x28_u8, 0xb7_u8])
  struct IGPMStatusMsgCollection
    lpVtbl : IGPMStatusMsgCollectionVTbl*
  end

  struct IGPMStatusMessageVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_object_path : UInt64
    error_code : UInt64
    get_extension_name : UInt64
    get_settings_name : UInt64
    operation_code : UInt64
    get_message : UInt64
  end

  IGPMStatusMessage_GUID = "8496c22f-f3de-4a1f-8f58-603caaa93d7b"
  IID_IGPMStatusMessage = LibC::GUID.new(0x8496c22f_u32, 0xf3de_u16, 0x4a1f_u16, StaticArray[0x8f_u8, 0x58_u8, 0x60_u8, 0x3c_u8, 0xaa_u8, 0xa9_u8, 0x3d_u8, 0x7b_u8])
  struct IGPMStatusMessage
    lpVtbl : IGPMStatusMessageVTbl*
  end

  struct IGPMConstantsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_perm_gpo_apply : UInt64
    get_perm_gpo_read : UInt64
    get_perm_gpo_edit : UInt64
    get_perm_gpo_edit_security_and_delete : UInt64
    get_perm_gpo_custom : UInt64
    get_perm_wmi_filter_edit : UInt64
    get_perm_wmi_filter_full_control : UInt64
    get_perm_wmi_filter_custom : UInt64
    get_perm_som_link : UInt64
    get_perm_som_logging : UInt64
    get_perm_som_planning : UInt64
    get_perm_somgpo_create : UInt64
    get_perm_somwmi_create : UInt64
    get_perm_somwmi_full_control : UInt64
    get_search_property_gpo_permissions : UInt64
    get_search_property_gpo_effective_permissions : UInt64
    get_search_property_gpo_display_name : UInt64
    get_search_property_gpowmi_filter : UInt64
    get_search_property_gpoid : UInt64
    get_search_property_gpo_computer_extensions : UInt64
    get_search_property_gpo_user_extensions : UInt64
    get_search_property_som_links : UInt64
    get_search_property_gpo_domain : UInt64
    get_search_property_backup_most_recent : UInt64
    get_search_op_equals : UInt64
    get_search_op_contains : UInt64
    get_search_op_not_contains : UInt64
    get_search_op_not_equals : UInt64
    get_use_pdc : UInt64
    get_use_any_dc : UInt64
    get_do_not_use_w2_kdc : UInt64
    get_som_site : UInt64
    get_som_domain : UInt64
    get_somou : UInt64
    get_security_flags : UInt64
    get_do_not_validate_dc : UInt64
    get_report_html : UInt64
    get_report_xml : UInt64
    get_rsop_mode_unknown : UInt64
    get_rsop_mode_planning : UInt64
    get_rsop_mode_logging : UInt64
    get_entry_type_user : UInt64
    get_entry_type_computer : UInt64
    get_entry_type_local_group : UInt64
    get_entry_type_global_group : UInt64
    get_entry_type_universal_group : UInt64
    get_entry_type_unc_path : UInt64
    get_entry_type_unknown : UInt64
    get_destination_option_same_as_source : UInt64
    get_destination_option_none : UInt64
    get_destination_option_by_relative_name : UInt64
    get_destination_option_set : UInt64
    get_migration_table_only : UInt64
    get_process_security : UInt64
    get_rsop_logging_no_computer : UInt64
    get_rsop_logging_no_user : UInt64
    get_rsop_planning_assume_slow_link : UInt64
    get_rsop_planning_loopback_option : UInt64
    get_rsop_planning_assume_user_wql_filter_true : UInt64
    get_rsop_planning_assume_comp_wql_filter_true : UInt64
  end

  IGPMConstants_GUID = "50ef73e6-d35c-4c8d-be63-7ea5d2aac5c4"
  IID_IGPMConstants = LibC::GUID.new(0x50ef73e6_u32, 0xd35c_u16, 0x4c8d_u16, StaticArray[0xbe_u8, 0x63_u8, 0x7e_u8, 0xa5_u8, 0xd2_u8, 0xaa_u8, 0xc5_u8, 0xc4_u8])
  struct IGPMConstants
    lpVtbl : IGPMConstantsVTbl*
  end

  struct IGPMResultVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_status : UInt64
    get_result : UInt64
    overall_status : UInt64
  end

  IGPMResult_GUID = "86dff7e9-f76f-42ab-9570-cebc6be8a52d"
  IID_IGPMResult = LibC::GUID.new(0x86dff7e9_u32, 0xf76f_u16, 0x42ab_u16, StaticArray[0x95_u8, 0x70_u8, 0xce_u8, 0xbc_u8, 0x6b_u8, 0xe8_u8, 0xa5_u8, 0x2d_u8])
  struct IGPMResult
    lpVtbl : IGPMResultVTbl*
  end

  struct IGPMMapEntryCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    get_item : UInt64
    get__new_enum : UInt64
  end

  IGPMMapEntryCollection_GUID = "bb0bf49b-e53f-443f-b807-8be22bfb6d42"
  IID_IGPMMapEntryCollection = LibC::GUID.new(0xbb0bf49b_u32, 0xe53f_u16, 0x443f_u16, StaticArray[0xb8_u8, 0x7_u8, 0x8b_u8, 0xe2_u8, 0x2b_u8, 0xfb_u8, 0x6d_u8, 0x42_u8])
  struct IGPMMapEntryCollection
    lpVtbl : IGPMMapEntryCollectionVTbl*
  end

  struct IGPMMapEntryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_source : UInt64
    get_destination : UInt64
    get_destination_option : UInt64
    get_entry_type : UInt64
  end

  IGPMMapEntry_GUID = "8e79ad06-2381-4444-be4c-ff693e6e6f2b"
  IID_IGPMMapEntry = LibC::GUID.new(0x8e79ad06_u32, 0x2381_u16, 0x4444_u16, StaticArray[0xbe_u8, 0x4c_u8, 0xff_u8, 0x69_u8, 0x3e_u8, 0x6e_u8, 0x6f_u8, 0x2b_u8])
  struct IGPMMapEntry
    lpVtbl : IGPMMapEntryVTbl*
  end

  struct IGPMMigrationTableVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    save : UInt64
    add : UInt64
    add_entry : UInt64
    get_entry : UInt64
    delete_entry : UInt64
    update_destination : UInt64
    validate : UInt64
    get_entries : UInt64
  end

  IGPMMigrationTable_GUID = "48f823b1-efaf-470b-b6ed-40d14ee1a4ec"
  IID_IGPMMigrationTable = LibC::GUID.new(0x48f823b1_u32, 0xefaf_u16, 0x470b_u16, StaticArray[0xb6_u8, 0xed_u8, 0x40_u8, 0xd1_u8, 0x4e_u8, 0xe1_u8, 0xa4_u8, 0xec_u8])
  struct IGPMMigrationTable
    lpVtbl : IGPMMigrationTableVTbl*
  end

  struct IGPMBackupDirExVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_backup_dir : UInt64
    get_backup_type : UInt64
    get_backup : UInt64
    search_backups : UInt64
  end

  IGPMBackupDirEx_GUID = "f8dc55ed-3ba0-4864-aad4-d365189ee1d5"
  IID_IGPMBackupDirEx = LibC::GUID.new(0xf8dc55ed_u32, 0x3ba0_u16, 0x4864_u16, StaticArray[0xaa_u8, 0xd4_u8, 0xd3_u8, 0x65_u8, 0x18_u8, 0x9e_u8, 0xe1_u8, 0xd5_u8])
  struct IGPMBackupDirEx
    lpVtbl : IGPMBackupDirExVTbl*
  end

  struct IGPMStarterGPOBackupCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    get_item : UInt64
    get__new_enum : UInt64
  end

  IGPMStarterGPOBackupCollection_GUID = "c998031d-add0-4bb5-8dea-298505d8423b"
  IID_IGPMStarterGPOBackupCollection = LibC::GUID.new(0xc998031d_u32, 0xadd0_u16, 0x4bb5_u16, StaticArray[0x8d_u8, 0xea_u8, 0x29_u8, 0x85_u8, 0x5_u8, 0xd8_u8, 0x42_u8, 0x3b_u8])
  struct IGPMStarterGPOBackupCollection
    lpVtbl : IGPMStarterGPOBackupCollectionVTbl*
  end

  struct IGPMStarterGPOBackupVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_backup_dir : UInt64
    get_comment : UInt64
    get_display_name : UInt64
    get_domain : UInt64
    get_starter_gpoid : UInt64
    get_id : UInt64
    get_timestamp : UInt64
    get_type : UInt64
    delete : UInt64
    generate_report : UInt64
    generate_report_to_file : UInt64
  end

  IGPMStarterGPOBackup_GUID = "51d98eda-a87e-43dd-b80a-0b66ef1938d6"
  IID_IGPMStarterGPOBackup = LibC::GUID.new(0x51d98eda_u32, 0xa87e_u16, 0x43dd_u16, StaticArray[0xb8_u8, 0xa_u8, 0xb_u8, 0x66_u8, 0xef_u8, 0x19_u8, 0x38_u8, 0xd6_u8])
  struct IGPMStarterGPOBackup
    lpVtbl : IGPMStarterGPOBackupVTbl*
  end

  struct IGPM2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_domain : UInt64
    get_backup_dir : UInt64
    get_sites_container : UInt64
    get_rsop : UInt64
    create_permission : UInt64
    create_search_criteria : UInt64
    create_trustee : UInt64
    get_client_side_extensions : UInt64
    get_constants : UInt64
    get_migration_table : UInt64
    create_migration_table : UInt64
    initialize_reporting : UInt64
    get_backup_dir_ex : UInt64
    initialize_reporting_ex : UInt64
  end

  IGPM2_GUID = "00238f8a-3d86-41ac-8f5e-06a6638a634a"
  IID_IGPM2 = LibC::GUID.new(0x238f8a_u32, 0x3d86_u16, 0x41ac_u16, StaticArray[0x8f_u8, 0x5e_u8, 0x6_u8, 0xa6_u8, 0x63_u8, 0x8a_u8, 0x63_u8, 0x4a_u8])
  struct IGPM2
    lpVtbl : IGPM2VTbl*
  end

  struct IGPMStarterGPOVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_display_name : UInt64
    put_display_name : UInt64
    get_description : UInt64
    put_description : UInt64
    get_author : UInt64
    get_product : UInt64
    get_creation_time : UInt64
    get_id : UInt64
    get_modified_time : UInt64
    get_type : UInt64
    get_computer_version : UInt64
    get_user_version : UInt64
    get_starter_gpo_version : UInt64
    delete : UInt64
    save : UInt64
    backup : UInt64
    copy_to : UInt64
    generate_report : UInt64
    generate_report_to_file : UInt64
    get_security_info : UInt64
    set_security_info : UInt64
  end

  IGPMStarterGPO_GUID = "dfc3f61b-8880-4490-9337-d29c7ba8c2f0"
  IID_IGPMStarterGPO = LibC::GUID.new(0xdfc3f61b_u32, 0x8880_u16, 0x4490_u16, StaticArray[0x93_u8, 0x37_u8, 0xd2_u8, 0x9c_u8, 0x7b_u8, 0xa8_u8, 0xc2_u8, 0xf0_u8])
  struct IGPMStarterGPO
    lpVtbl : IGPMStarterGPOVTbl*
  end

  struct IGPMStarterGPOCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    get_item : UInt64
    get__new_enum : UInt64
  end

  IGPMStarterGPOCollection_GUID = "2e522729-2219-44ad-933a-64dfd650c423"
  IID_IGPMStarterGPOCollection = LibC::GUID.new(0x2e522729_u32, 0x2219_u16, 0x44ad_u16, StaticArray[0x93_u8, 0x3a_u8, 0x64_u8, 0xdf_u8, 0xd6_u8, 0x50_u8, 0xc4_u8, 0x23_u8])
  struct IGPMStarterGPOCollection
    lpVtbl : IGPMStarterGPOCollectionVTbl*
  end

  struct IGPMDomain2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_domain_controller : UInt64
    get_domain : UInt64
    create_gpo : UInt64
    get_gpo : UInt64
    search_gp_os : UInt64
    restore_gpo : UInt64
    get_som : UInt64
    search_so_ms : UInt64
    get_wmi_filter : UInt64
    search_wmi_filters : UInt64
    create_starter_gpo : UInt64
    create_gpo_from_starter_gpo : UInt64
    get_starter_gpo : UInt64
    search_starter_gp_os : UInt64
    load_starter_gpo : UInt64
    restore_starter_gpo : UInt64
  end

  IGPMDomain2_GUID = "7ca6bb8b-f1eb-490a-938d-3c4e51c768e6"
  IID_IGPMDomain2 = LibC::GUID.new(0x7ca6bb8b_u32, 0xf1eb_u16, 0x490a_u16, StaticArray[0x93_u8, 0x8d_u8, 0x3c_u8, 0x4e_u8, 0x51_u8, 0xc7_u8, 0x68_u8, 0xe6_u8])
  struct IGPMDomain2
    lpVtbl : IGPMDomain2VTbl*
  end

  struct IGPMConstants2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_perm_gpo_apply : UInt64
    get_perm_gpo_read : UInt64
    get_perm_gpo_edit : UInt64
    get_perm_gpo_edit_security_and_delete : UInt64
    get_perm_gpo_custom : UInt64
    get_perm_wmi_filter_edit : UInt64
    get_perm_wmi_filter_full_control : UInt64
    get_perm_wmi_filter_custom : UInt64
    get_perm_som_link : UInt64
    get_perm_som_logging : UInt64
    get_perm_som_planning : UInt64
    get_perm_somgpo_create : UInt64
    get_perm_somwmi_create : UInt64
    get_perm_somwmi_full_control : UInt64
    get_search_property_gpo_permissions : UInt64
    get_search_property_gpo_effective_permissions : UInt64
    get_search_property_gpo_display_name : UInt64
    get_search_property_gpowmi_filter : UInt64
    get_search_property_gpoid : UInt64
    get_search_property_gpo_computer_extensions : UInt64
    get_search_property_gpo_user_extensions : UInt64
    get_search_property_som_links : UInt64
    get_search_property_gpo_domain : UInt64
    get_search_property_backup_most_recent : UInt64
    get_search_op_equals : UInt64
    get_search_op_contains : UInt64
    get_search_op_not_contains : UInt64
    get_search_op_not_equals : UInt64
    get_use_pdc : UInt64
    get_use_any_dc : UInt64
    get_do_not_use_w2_kdc : UInt64
    get_som_site : UInt64
    get_som_domain : UInt64
    get_somou : UInt64
    get_security_flags : UInt64
    get_do_not_validate_dc : UInt64
    get_report_html : UInt64
    get_report_xml : UInt64
    get_rsop_mode_unknown : UInt64
    get_rsop_mode_planning : UInt64
    get_rsop_mode_logging : UInt64
    get_entry_type_user : UInt64
    get_entry_type_computer : UInt64
    get_entry_type_local_group : UInt64
    get_entry_type_global_group : UInt64
    get_entry_type_universal_group : UInt64
    get_entry_type_unc_path : UInt64
    get_entry_type_unknown : UInt64
    get_destination_option_same_as_source : UInt64
    get_destination_option_none : UInt64
    get_destination_option_by_relative_name : UInt64
    get_destination_option_set : UInt64
    get_migration_table_only : UInt64
    get_process_security : UInt64
    get_rsop_logging_no_computer : UInt64
    get_rsop_logging_no_user : UInt64
    get_rsop_planning_assume_slow_link : UInt64
    get_rsop_planning_loopback_option : UInt64
    get_rsop_planning_assume_user_wql_filter_true : UInt64
    get_rsop_planning_assume_comp_wql_filter_true : UInt64
    get_backup_type_gpo : UInt64
    get_backup_type_starter_gpo : UInt64
    get_starter_gpo_type_system : UInt64
    get_starter_gpo_type_custom : UInt64
    get_search_property_starter_gpo_permissions : UInt64
    get_search_property_starter_gpo_effective_permissions : UInt64
    get_search_property_starter_gpo_display_name : UInt64
    get_search_property_starter_gpoid : UInt64
    get_search_property_starter_gpo_domain : UInt64
    get_perm_starter_gpo_read : UInt64
    get_perm_starter_gpo_edit : UInt64
    get_perm_starter_gpo_full_control : UInt64
    get_perm_starter_gpo_custom : UInt64
    get_report_legacy : UInt64
    get_report_comments : UInt64
  end

  IGPMConstants2_GUID = "05ae21b0-ac09-4032-a26f-9e7da786dc19"
  IID_IGPMConstants2 = LibC::GUID.new(0x5ae21b0_u32, 0xac09_u16, 0x4032_u16, StaticArray[0xa2_u8, 0x6f_u8, 0x9e_u8, 0x7d_u8, 0xa7_u8, 0x86_u8, 0xdc_u8, 0x19_u8])
  struct IGPMConstants2
    lpVtbl : IGPMConstants2VTbl*
  end

  struct IGPMGPO2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_display_name : UInt64
    put_display_name : UInt64
    get_path : UInt64
    get_id : UInt64
    get_domain_name : UInt64
    get_creation_time : UInt64
    get_modification_time : UInt64
    get_user_ds_version_number : UInt64
    get_computer_ds_version_number : UInt64
    get_user_sysvol_version_number : UInt64
    get_computer_sysvol_version_number : UInt64
    get_wmi_filter : UInt64
    set_wmi_filter : UInt64
    set_user_enabled : UInt64
    set_computer_enabled : UInt64
    is_user_enabled : UInt64
    is_computer_enabled : UInt64
    get_security_info : UInt64
    set_security_info : UInt64
    delete : UInt64
    backup : UInt64
    import : UInt64
    generate_report : UInt64
    generate_report_to_file : UInt64
    copy_to : UInt64
    set_security_descriptor : UInt64
    get_security_descriptor : UInt64
    is_acl_consistent : UInt64
    make_acl_consistent : UInt64
    get_description : UInt64
    put_description : UInt64
  end

  IGPMGPO2_GUID = "8a66a210-b78b-4d99-88e2-c306a817c925"
  IID_IGPMGPO2 = LibC::GUID.new(0x8a66a210_u32, 0xb78b_u16, 0x4d99_u16, StaticArray[0x88_u8, 0xe2_u8, 0xc3_u8, 0x6_u8, 0xa8_u8, 0x17_u8, 0xc9_u8, 0x25_u8])
  struct IGPMGPO2
    lpVtbl : IGPMGPO2VTbl*
  end

  struct IGPMDomain3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_domain_controller : UInt64
    get_domain : UInt64
    create_gpo : UInt64
    get_gpo : UInt64
    search_gp_os : UInt64
    restore_gpo : UInt64
    get_som : UInt64
    search_so_ms : UInt64
    get_wmi_filter : UInt64
    search_wmi_filters : UInt64
    create_starter_gpo : UInt64
    create_gpo_from_starter_gpo : UInt64
    get_starter_gpo : UInt64
    search_starter_gp_os : UInt64
    load_starter_gpo : UInt64
    restore_starter_gpo : UInt64
    generate_report : UInt64
    get_infrastructure_dc : UInt64
    put_infrastructure_dc : UInt64
    put_infrastructure_flags : UInt64
  end

  IGPMDomain3_GUID = "0077fdfe-88c7-4acf-a11d-d10a7c310a03"
  IID_IGPMDomain3 = LibC::GUID.new(0x77fdfe_u32, 0x88c7_u16, 0x4acf_u16, StaticArray[0xa1_u8, 0x1d_u8, 0xd1_u8, 0xa_u8, 0x7c_u8, 0x31_u8, 0xa_u8, 0x3_u8])
  struct IGPMDomain3
    lpVtbl : IGPMDomain3VTbl*
  end

  struct IGPMGPO3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_display_name : UInt64
    put_display_name : UInt64
    get_path : UInt64
    get_id : UInt64
    get_domain_name : UInt64
    get_creation_time : UInt64
    get_modification_time : UInt64
    get_user_ds_version_number : UInt64
    get_computer_ds_version_number : UInt64
    get_user_sysvol_version_number : UInt64
    get_computer_sysvol_version_number : UInt64
    get_wmi_filter : UInt64
    set_wmi_filter : UInt64
    set_user_enabled : UInt64
    set_computer_enabled : UInt64
    is_user_enabled : UInt64
    is_computer_enabled : UInt64
    get_security_info : UInt64
    set_security_info : UInt64
    delete : UInt64
    backup : UInt64
    import : UInt64
    generate_report : UInt64
    generate_report_to_file : UInt64
    copy_to : UInt64
    set_security_descriptor : UInt64
    get_security_descriptor : UInt64
    is_acl_consistent : UInt64
    make_acl_consistent : UInt64
    get_description : UInt64
    put_description : UInt64
    get_infrastructure_dc : UInt64
    put_infrastructure_dc : UInt64
    put_infrastructure_flags : UInt64
  end

  IGPMGPO3_GUID = "7cf123a1-f94a-4112-bfae-6aa1db9cb248"
  IID_IGPMGPO3 = LibC::GUID.new(0x7cf123a1_u32, 0xf94a_u16, 0x4112_u16, StaticArray[0xbf_u8, 0xae_u8, 0x6a_u8, 0xa1_u8, 0xdb_u8, 0x9c_u8, 0xb2_u8, 0x48_u8])
  struct IGPMGPO3
    lpVtbl : IGPMGPO3VTbl*
  end

  struct IGPEInformationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_name : UInt64
    get_display_name : UInt64
    get_registry_key : UInt64
    get_ds_path : UInt64
    get_file_sys_path : UInt64
    get_options : UInt64
    get_type : UInt64
    get_hint : UInt64
    policy_changed : UInt64
  end

  IGPEInformation_GUID = "8fc0b735-a0e1-11d1-a7d3-0000f87571e3"
  IID_IGPEInformation = LibC::GUID.new(0x8fc0b735_u32, 0xa0e1_u16, 0x11d1_u16, StaticArray[0xa7_u8, 0xd3_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x71_u8, 0xe3_u8])
  struct IGPEInformation
    lpVtbl : IGPEInformationVTbl*
  end

  struct IGroupPolicyObjectVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    new : UInt64
    open_dsgpo : UInt64
    open_local_machine_gpo : UInt64
    open_remote_machine_gpo : UInt64
    save : UInt64
    delete : UInt64
    get_name : UInt64
    get_display_name : UInt64
    set_display_name : UInt64
    get_path : UInt64
    get_ds_path : UInt64
    get_file_sys_path : UInt64
    get_registry_key : UInt64
    get_options : UInt64
    set_options : UInt64
    get_type : UInt64
    get_machine_name : UInt64
    get_property_sheet_pages : UInt64
  end

  IGroupPolicyObject_GUID = "ea502723-a23d-11d1-a7d3-0000f87571e3"
  IID_IGroupPolicyObject = LibC::GUID.new(0xea502723_u32, 0xa23d_u16, 0x11d1_u16, StaticArray[0xa7_u8, 0xd3_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x71_u8, 0xe3_u8])
  struct IGroupPolicyObject
    lpVtbl : IGroupPolicyObjectVTbl*
  end

  struct IRSOPInformationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_namespace : UInt64
    get_flags : UInt64
    get_event_log_entry_text : UInt64
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
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_domain(bstrdomain : UInt8*, bstrdomaincontroller : UInt8*, ldcflags : Int32, pigpmdomain : IGPMDomain*) : HRESULT
    @lpVtbl.value.get_domain.unsafe_as(Proc(UInt8*, UInt8*, Int32, IGPMDomain*, HRESULT)).call(bstrdomain, bstrdomaincontroller, ldcflags, pigpmdomain)
  end
  def get_backup_dir(bstrbackupdir : UInt8*, pigpmbackupdir : IGPMBackupDir*) : HRESULT
    @lpVtbl.value.get_backup_dir.unsafe_as(Proc(UInt8*, IGPMBackupDir*, HRESULT)).call(bstrbackupdir, pigpmbackupdir)
  end
  def get_sites_container(bstrforest : UInt8*, bstrdomain : UInt8*, bstrdomaincontroller : UInt8*, ldcflags : Int32, ppigpmsitescontainer : IGPMSitesContainer*) : HRESULT
    @lpVtbl.value.get_sites_container.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, Int32, IGPMSitesContainer*, HRESULT)).call(bstrforest, bstrdomain, bstrdomaincontroller, ldcflags, ppigpmsitescontainer)
  end
  def get_rsop(gpmrsopmode : GPMRSOPMode, bstrnamespace : UInt8*, lflags : Int32, ppigpmrsop : IGPMRSOP*) : HRESULT
    @lpVtbl.value.get_rsop.unsafe_as(Proc(GPMRSOPMode, UInt8*, Int32, IGPMRSOP*, HRESULT)).call(gpmrsopmode, bstrnamespace, lflags, ppigpmrsop)
  end
  def create_permission(bstrtrustee : UInt8*, perm : GPMPermissionType, binheritable : Int16, ppperm : IGPMPermission*) : HRESULT
    @lpVtbl.value.create_permission.unsafe_as(Proc(UInt8*, GPMPermissionType, Int16, IGPMPermission*, HRESULT)).call(bstrtrustee, perm, binheritable, ppperm)
  end
  def create_search_criteria(ppigpmsearchcriteria : IGPMSearchCriteria*) : HRESULT
    @lpVtbl.value.create_search_criteria.unsafe_as(Proc(IGPMSearchCriteria*, HRESULT)).call(ppigpmsearchcriteria)
  end
  def create_trustee(bstrtrustee : UInt8*, ppigpmtrustee : IGPMTrustee*) : HRESULT
    @lpVtbl.value.create_trustee.unsafe_as(Proc(UInt8*, IGPMTrustee*, HRESULT)).call(bstrtrustee, ppigpmtrustee)
  end
  def get_client_side_extensions(ppigpmcsecollection : IGPMCSECollection*) : HRESULT
    @lpVtbl.value.get_client_side_extensions.unsafe_as(Proc(IGPMCSECollection*, HRESULT)).call(ppigpmcsecollection)
  end
  def get_constants(ppigpmconstants : IGPMConstants*) : HRESULT
    @lpVtbl.value.get_constants.unsafe_as(Proc(IGPMConstants*, HRESULT)).call(ppigpmconstants)
  end
  def get_migration_table(bstrmigrationtablepath : UInt8*, ppmigrationtable : IGPMMigrationTable*) : HRESULT
    @lpVtbl.value.get_migration_table.unsafe_as(Proc(UInt8*, IGPMMigrationTable*, HRESULT)).call(bstrmigrationtablepath, ppmigrationtable)
  end
  def create_migration_table(ppmigrationtable : IGPMMigrationTable*) : HRESULT
    @lpVtbl.value.create_migration_table.unsafe_as(Proc(IGPMMigrationTable*, HRESULT)).call(ppmigrationtable)
  end
  def initialize_reporting(bstradmpath : UInt8*) : HRESULT
    @lpVtbl.value.initialize_reporting.unsafe_as(Proc(UInt8*, HRESULT)).call(bstradmpath)
  end
end
struct LibWin32::IGPMDomain
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_domain_controller(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_domain_controller.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def get_domain(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_domain.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def create_gpo(ppnewgpo : IGPMGPO*) : HRESULT
    @lpVtbl.value.create_gpo.unsafe_as(Proc(IGPMGPO*, HRESULT)).call(ppnewgpo)
  end
  def get_gpo(bstrguid : UInt8*, ppgpo : IGPMGPO*) : HRESULT
    @lpVtbl.value.get_gpo.unsafe_as(Proc(UInt8*, IGPMGPO*, HRESULT)).call(bstrguid, ppgpo)
  end
  def search_gp_os(pigpmsearchcriteria : IGPMSearchCriteria, ppigpmgpocollection : IGPMGPOCollection*) : HRESULT
    @lpVtbl.value.search_gp_os.unsafe_as(Proc(IGPMSearchCriteria, IGPMGPOCollection*, HRESULT)).call(pigpmsearchcriteria, ppigpmgpocollection)
  end
  def restore_gpo(pigpmbackup : IGPMBackup, ldcflags : Int32, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.restore_gpo.unsafe_as(Proc(IGPMBackup, Int32, VARIANT*, VARIANT*, IGPMResult*, HRESULT)).call(pigpmbackup, ldcflags, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def get_som(bstrpath : UInt8*, ppsom : IGPMSOM*) : HRESULT
    @lpVtbl.value.get_som.unsafe_as(Proc(UInt8*, IGPMSOM*, HRESULT)).call(bstrpath, ppsom)
  end
  def search_so_ms(pigpmsearchcriteria : IGPMSearchCriteria, ppigpmsomcollection : IGPMSOMCollection*) : HRESULT
    @lpVtbl.value.search_so_ms.unsafe_as(Proc(IGPMSearchCriteria, IGPMSOMCollection*, HRESULT)).call(pigpmsearchcriteria, ppigpmsomcollection)
  end
  def get_wmi_filter(bstrpath : UInt8*, ppwmifilter : IGPMWMIFilter*) : HRESULT
    @lpVtbl.value.get_wmi_filter.unsafe_as(Proc(UInt8*, IGPMWMIFilter*, HRESULT)).call(bstrpath, ppwmifilter)
  end
  def search_wmi_filters(pigpmsearchcriteria : IGPMSearchCriteria, ppigpmwmifiltercollection : IGPMWMIFilterCollection*) : HRESULT
    @lpVtbl.value.search_wmi_filters.unsafe_as(Proc(IGPMSearchCriteria, IGPMWMIFilterCollection*, HRESULT)).call(pigpmsearchcriteria, ppigpmwmifiltercollection)
  end
end
struct LibWin32::IGPMBackupDir
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_backup_directory(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_backup_directory.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def get_backup(bstrid : UInt8*, ppbackup : IGPMBackup*) : HRESULT
    @lpVtbl.value.get_backup.unsafe_as(Proc(UInt8*, IGPMBackup*, HRESULT)).call(bstrid, ppbackup)
  end
  def search_backups(pigpmsearchcriteria : IGPMSearchCriteria, ppigpmbackupcollection : IGPMBackupCollection*) : HRESULT
    @lpVtbl.value.search_backups.unsafe_as(Proc(IGPMSearchCriteria, IGPMBackupCollection*, HRESULT)).call(pigpmsearchcriteria, ppigpmbackupcollection)
  end
end
struct LibWin32::IGPMSitesContainer
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_domain_controller(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_domain_controller.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def get_domain(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_domain.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def get_forest(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_forest.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def get_site(bstrsitename : UInt8*, ppsom : IGPMSOM*) : HRESULT
    @lpVtbl.value.get_site.unsafe_as(Proc(UInt8*, IGPMSOM*, HRESULT)).call(bstrsitename, ppsom)
  end
  def search_sites(pigpmsearchcriteria : IGPMSearchCriteria, ppigpmsomcollection : IGPMSOMCollection*) : HRESULT
    @lpVtbl.value.search_sites.unsafe_as(Proc(IGPMSearchCriteria, IGPMSOMCollection*, HRESULT)).call(pigpmsearchcriteria, ppigpmsomcollection)
  end
end
struct LibWin32::IGPMSearchCriteria
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def add(searchproperty : GPMSearchProperty, searchoperation : GPMSearchOperation, varvalue : VARIANT) : HRESULT
    @lpVtbl.value.add.unsafe_as(Proc(GPMSearchProperty, GPMSearchOperation, VARIANT, HRESULT)).call(searchproperty, searchoperation, varvalue)
  end
end
struct LibWin32::IGPMTrustee
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_trustee_sid(bstrval : UInt8**) : HRESULT
    @lpVtbl.value.get_trustee_sid.unsafe_as(Proc(UInt8**, HRESULT)).call(bstrval)
  end
  def get_trustee_name(bstrval : UInt8**) : HRESULT
    @lpVtbl.value.get_trustee_name.unsafe_as(Proc(UInt8**, HRESULT)).call(bstrval)
  end
  def get_trustee_domain(bstrval : UInt8**) : HRESULT
    @lpVtbl.value.get_trustee_domain.unsafe_as(Proc(UInt8**, HRESULT)).call(bstrval)
  end
  def get_trustee_ds_path(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_trustee_ds_path.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def get_trustee_type(lval : Int32*) : HRESULT
    @lpVtbl.value.get_trustee_type.unsafe_as(Proc(Int32*, HRESULT)).call(lval)
  end
end
struct LibWin32::IGPMPermission
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_inherited(pval : Int16*) : HRESULT
    @lpVtbl.value.get_inherited.unsafe_as(Proc(Int16*, HRESULT)).call(pval)
  end
  def get_inheritable(pval : Int16*) : HRESULT
    @lpVtbl.value.get_inheritable.unsafe_as(Proc(Int16*, HRESULT)).call(pval)
  end
  def get_denied(pval : Int16*) : HRESULT
    @lpVtbl.value.get_denied.unsafe_as(Proc(Int16*, HRESULT)).call(pval)
  end
  def get_permission(pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_permission.unsafe_as(Proc(GPMPermissionType*, HRESULT)).call(pval)
  end
  def get_trustee(ppigpmtrustee : IGPMTrustee*) : HRESULT
    @lpVtbl.value.get_trustee.unsafe_as(Proc(IGPMTrustee*, HRESULT)).call(ppigpmtrustee)
  end
end
struct LibWin32::IGPMSecurityInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(pval : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_item(lindex : Int32, pval : VARIANT*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(Int32, VARIANT*, HRESULT)).call(lindex, pval)
  end
  def get__new_enum(ppenum : IEnumVARIANT*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IEnumVARIANT*, HRESULT)).call(ppenum)
  end
  def add(pperm : IGPMPermission) : HRESULT
    @lpVtbl.value.add.unsafe_as(Proc(IGPMPermission, HRESULT)).call(pperm)
  end
  def remove(pperm : IGPMPermission) : HRESULT
    @lpVtbl.value.remove.unsafe_as(Proc(IGPMPermission, HRESULT)).call(pperm)
  end
  def remove_trustee(bstrtrustee : UInt8*) : HRESULT
    @lpVtbl.value.remove_trustee.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrtrustee)
  end
end
struct LibWin32::IGPMBackup
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def get_gpoid(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_gpoid.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def get_gpo_domain(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_gpo_domain.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def get_gpo_display_name(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_gpo_display_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def get_timestamp(pval : Float64*) : HRESULT
    @lpVtbl.value.get_timestamp.unsafe_as(Proc(Float64*, HRESULT)).call(pval)
  end
  def get_comment(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_comment.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def get_backup_dir(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_backup_dir.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def generate_report(gpmreporttype : GPMReportType, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.generate_report.unsafe_as(Proc(GPMReportType, VARIANT*, VARIANT*, IGPMResult*, HRESULT)).call(gpmreporttype, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def generate_report_to_file(gpmreporttype : GPMReportType, bstrtargetfilepath : UInt8*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.generate_report_to_file.unsafe_as(Proc(GPMReportType, UInt8*, IGPMResult*, HRESULT)).call(gpmreporttype, bstrtargetfilepath, ppigpmresult)
  end
end
struct LibWin32::IGPMBackupCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(pval : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_item(lindex : Int32, pval : VARIANT*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(Int32, VARIANT*, HRESULT)).call(lindex, pval)
  end
  def get__new_enum(ppigpmbackup : IEnumVARIANT*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IEnumVARIANT*, HRESULT)).call(ppigpmbackup)
  end
end
struct LibWin32::IGPMSOM
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_gpo_inheritance_blocked(pval : Int16*) : HRESULT
    @lpVtbl.value.get_gpo_inheritance_blocked.unsafe_as(Proc(Int16*, HRESULT)).call(pval)
  end
  def put_gpo_inheritance_blocked(newval : Int16) : HRESULT
    @lpVtbl.value.put_gpo_inheritance_blocked.unsafe_as(Proc(Int16, HRESULT)).call(newval)
  end
  def get_name(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def get_path(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_path.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def create_gpo_link(llinkpos : Int32, pgpo : IGPMGPO, ppnewgpolink : IGPMGPOLink*) : HRESULT
    @lpVtbl.value.create_gpo_link.unsafe_as(Proc(Int32, IGPMGPO, IGPMGPOLink*, HRESULT)).call(llinkpos, pgpo, ppnewgpolink)
  end
  def get_type(pval : GPMSOMType*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(GPMSOMType*, HRESULT)).call(pval)
  end
  def get_gpo_links(ppgpolinks : IGPMGPOLinksCollection*) : HRESULT
    @lpVtbl.value.get_gpo_links.unsafe_as(Proc(IGPMGPOLinksCollection*, HRESULT)).call(ppgpolinks)
  end
  def get_inherited_gpo_links(ppgpolinks : IGPMGPOLinksCollection*) : HRESULT
    @lpVtbl.value.get_inherited_gpo_links.unsafe_as(Proc(IGPMGPOLinksCollection*, HRESULT)).call(ppgpolinks)
  end
  def get_security_info(ppsecurityinfo : IGPMSecurityInfo*) : HRESULT
    @lpVtbl.value.get_security_info.unsafe_as(Proc(IGPMSecurityInfo*, HRESULT)).call(ppsecurityinfo)
  end
  def set_security_info(psecurityinfo : IGPMSecurityInfo) : HRESULT
    @lpVtbl.value.set_security_info.unsafe_as(Proc(IGPMSecurityInfo, HRESULT)).call(psecurityinfo)
  end
end
struct LibWin32::IGPMSOMCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(pval : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_item(lindex : Int32, pval : VARIANT*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(Int32, VARIANT*, HRESULT)).call(lindex, pval)
  end
  def get__new_enum(ppigpmsom : IEnumVARIANT*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IEnumVARIANT*, HRESULT)).call(ppigpmsom)
  end
end
struct LibWin32::IGPMWMIFilter
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_path(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_path.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def put_name(newval : UInt8*) : HRESULT
    @lpVtbl.value.put_name.unsafe_as(Proc(UInt8*, HRESULT)).call(newval)
  end
  def get_name(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def put_description(newval : UInt8*) : HRESULT
    @lpVtbl.value.put_description.unsafe_as(Proc(UInt8*, HRESULT)).call(newval)
  end
  def get_description(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def get_query_list(pqrylist : VARIANT*) : HRESULT
    @lpVtbl.value.get_query_list.unsafe_as(Proc(VARIANT*, HRESULT)).call(pqrylist)
  end
  def get_security_info(ppsecurityinfo : IGPMSecurityInfo*) : HRESULT
    @lpVtbl.value.get_security_info.unsafe_as(Proc(IGPMSecurityInfo*, HRESULT)).call(ppsecurityinfo)
  end
  def set_security_info(psecurityinfo : IGPMSecurityInfo) : HRESULT
    @lpVtbl.value.set_security_info.unsafe_as(Proc(IGPMSecurityInfo, HRESULT)).call(psecurityinfo)
  end
end
struct LibWin32::IGPMWMIFilterCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(pval : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_item(lindex : Int32, pval : VARIANT*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(Int32, VARIANT*, HRESULT)).call(lindex, pval)
  end
  def get__new_enum(pval : IEnumVARIANT*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IEnumVARIANT*, HRESULT)).call(pval)
  end
end
struct LibWin32::IGPMRSOP
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_mode(pval : GPMRSOPMode*) : HRESULT
    @lpVtbl.value.get_mode.unsafe_as(Proc(GPMRSOPMode*, HRESULT)).call(pval)
  end
  def get_namespace(bstrval : UInt8**) : HRESULT
    @lpVtbl.value.get_namespace.unsafe_as(Proc(UInt8**, HRESULT)).call(bstrval)
  end
  def put_logging_computer(bstrval : UInt8*) : HRESULT
    @lpVtbl.value.put_logging_computer.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrval)
  end
  def get_logging_computer(bstrval : UInt8**) : HRESULT
    @lpVtbl.value.get_logging_computer.unsafe_as(Proc(UInt8**, HRESULT)).call(bstrval)
  end
  def put_logging_user(bstrval : UInt8*) : HRESULT
    @lpVtbl.value.put_logging_user.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrval)
  end
  def get_logging_user(bstrval : UInt8**) : HRESULT
    @lpVtbl.value.get_logging_user.unsafe_as(Proc(UInt8**, HRESULT)).call(bstrval)
  end
  def put_logging_flags(lval : Int32) : HRESULT
    @lpVtbl.value.put_logging_flags.unsafe_as(Proc(Int32, HRESULT)).call(lval)
  end
  def get_logging_flags(lval : Int32*) : HRESULT
    @lpVtbl.value.get_logging_flags.unsafe_as(Proc(Int32*, HRESULT)).call(lval)
  end
  def put_planning_flags(lval : Int32) : HRESULT
    @lpVtbl.value.put_planning_flags.unsafe_as(Proc(Int32, HRESULT)).call(lval)
  end
  def get_planning_flags(lval : Int32*) : HRESULT
    @lpVtbl.value.get_planning_flags.unsafe_as(Proc(Int32*, HRESULT)).call(lval)
  end
  def put_planning_domain_controller(bstrval : UInt8*) : HRESULT
    @lpVtbl.value.put_planning_domain_controller.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrval)
  end
  def get_planning_domain_controller(bstrval : UInt8**) : HRESULT
    @lpVtbl.value.get_planning_domain_controller.unsafe_as(Proc(UInt8**, HRESULT)).call(bstrval)
  end
  def put_planning_site_name(bstrval : UInt8*) : HRESULT
    @lpVtbl.value.put_planning_site_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrval)
  end
  def get_planning_site_name(bstrval : UInt8**) : HRESULT
    @lpVtbl.value.get_planning_site_name.unsafe_as(Proc(UInt8**, HRESULT)).call(bstrval)
  end
  def put_planning_user(bstrval : UInt8*) : HRESULT
    @lpVtbl.value.put_planning_user.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrval)
  end
  def get_planning_user(bstrval : UInt8**) : HRESULT
    @lpVtbl.value.get_planning_user.unsafe_as(Proc(UInt8**, HRESULT)).call(bstrval)
  end
  def put_planning_user_som(bstrval : UInt8*) : HRESULT
    @lpVtbl.value.put_planning_user_som.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrval)
  end
  def get_planning_user_som(bstrval : UInt8**) : HRESULT
    @lpVtbl.value.get_planning_user_som.unsafe_as(Proc(UInt8**, HRESULT)).call(bstrval)
  end
  def put_planning_user_wmi_filters(varval : VARIANT) : HRESULT
    @lpVtbl.value.put_planning_user_wmi_filters.unsafe_as(Proc(VARIANT, HRESULT)).call(varval)
  end
  def get_planning_user_wmi_filters(varval : VARIANT*) : HRESULT
    @lpVtbl.value.get_planning_user_wmi_filters.unsafe_as(Proc(VARIANT*, HRESULT)).call(varval)
  end
  def put_planning_user_security_groups(varval : VARIANT) : HRESULT
    @lpVtbl.value.put_planning_user_security_groups.unsafe_as(Proc(VARIANT, HRESULT)).call(varval)
  end
  def get_planning_user_security_groups(varval : VARIANT*) : HRESULT
    @lpVtbl.value.get_planning_user_security_groups.unsafe_as(Proc(VARIANT*, HRESULT)).call(varval)
  end
  def put_planning_computer(bstrval : UInt8*) : HRESULT
    @lpVtbl.value.put_planning_computer.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrval)
  end
  def get_planning_computer(bstrval : UInt8**) : HRESULT
    @lpVtbl.value.get_planning_computer.unsafe_as(Proc(UInt8**, HRESULT)).call(bstrval)
  end
  def put_planning_computer_som(bstrval : UInt8*) : HRESULT
    @lpVtbl.value.put_planning_computer_som.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrval)
  end
  def get_planning_computer_som(bstrval : UInt8**) : HRESULT
    @lpVtbl.value.get_planning_computer_som.unsafe_as(Proc(UInt8**, HRESULT)).call(bstrval)
  end
  def put_planning_computer_wmi_filters(varval : VARIANT) : HRESULT
    @lpVtbl.value.put_planning_computer_wmi_filters.unsafe_as(Proc(VARIANT, HRESULT)).call(varval)
  end
  def get_planning_computer_wmi_filters(varval : VARIANT*) : HRESULT
    @lpVtbl.value.get_planning_computer_wmi_filters.unsafe_as(Proc(VARIANT*, HRESULT)).call(varval)
  end
  def put_planning_computer_security_groups(varval : VARIANT) : HRESULT
    @lpVtbl.value.put_planning_computer_security_groups.unsafe_as(Proc(VARIANT, HRESULT)).call(varval)
  end
  def get_planning_computer_security_groups(varval : VARIANT*) : HRESULT
    @lpVtbl.value.get_planning_computer_security_groups.unsafe_as(Proc(VARIANT*, HRESULT)).call(varval)
  end
  def logging_enumerate_users(varval : VARIANT*) : HRESULT
    @lpVtbl.value.logging_enumerate_users.unsafe_as(Proc(VARIANT*, HRESULT)).call(varval)
  end
  def create_query_results : HRESULT
    @lpVtbl.value.create_query_results.unsafe_as(Proc(HRESULT)).call
  end
  def release_query_results : HRESULT
    @lpVtbl.value.release_query_results.unsafe_as(Proc(HRESULT)).call
  end
  def generate_report(gpmreporttype : GPMReportType, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.generate_report.unsafe_as(Proc(GPMReportType, VARIANT*, VARIANT*, IGPMResult*, HRESULT)).call(gpmreporttype, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def generate_report_to_file(gpmreporttype : GPMReportType, bstrtargetfilepath : UInt8*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.generate_report_to_file.unsafe_as(Proc(GPMReportType, UInt8*, IGPMResult*, HRESULT)).call(gpmreporttype, bstrtargetfilepath, ppigpmresult)
  end
end
struct LibWin32::IGPMGPO
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_display_name(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def put_display_name(newval : UInt8*) : HRESULT
    @lpVtbl.value.put_display_name.unsafe_as(Proc(UInt8*, HRESULT)).call(newval)
  end
  def get_path(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_path.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def get_id(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def get_domain_name(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_domain_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def get_creation_time(pdate : Float64*) : HRESULT
    @lpVtbl.value.get_creation_time.unsafe_as(Proc(Float64*, HRESULT)).call(pdate)
  end
  def get_modification_time(pdate : Float64*) : HRESULT
    @lpVtbl.value.get_modification_time.unsafe_as(Proc(Float64*, HRESULT)).call(pdate)
  end
  def get_user_ds_version_number(pval : Int32*) : HRESULT
    @lpVtbl.value.get_user_ds_version_number.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_computer_ds_version_number(pval : Int32*) : HRESULT
    @lpVtbl.value.get_computer_ds_version_number.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_user_sysvol_version_number(pval : Int32*) : HRESULT
    @lpVtbl.value.get_user_sysvol_version_number.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_computer_sysvol_version_number(pval : Int32*) : HRESULT
    @lpVtbl.value.get_computer_sysvol_version_number.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_wmi_filter(ppigpmwmifilter : IGPMWMIFilter*) : HRESULT
    @lpVtbl.value.get_wmi_filter.unsafe_as(Proc(IGPMWMIFilter*, HRESULT)).call(ppigpmwmifilter)
  end
  def set_wmi_filter(pigpmwmifilter : IGPMWMIFilter) : HRESULT
    @lpVtbl.value.set_wmi_filter.unsafe_as(Proc(IGPMWMIFilter, HRESULT)).call(pigpmwmifilter)
  end
  def set_user_enabled(vbenabled : Int16) : HRESULT
    @lpVtbl.value.set_user_enabled.unsafe_as(Proc(Int16, HRESULT)).call(vbenabled)
  end
  def set_computer_enabled(vbenabled : Int16) : HRESULT
    @lpVtbl.value.set_computer_enabled.unsafe_as(Proc(Int16, HRESULT)).call(vbenabled)
  end
  def is_user_enabled(pvbenabled : Int16*) : HRESULT
    @lpVtbl.value.is_user_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(pvbenabled)
  end
  def is_computer_enabled(pvbenabled : Int16*) : HRESULT
    @lpVtbl.value.is_computer_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(pvbenabled)
  end
  def get_security_info(ppsecurityinfo : IGPMSecurityInfo*) : HRESULT
    @lpVtbl.value.get_security_info.unsafe_as(Proc(IGPMSecurityInfo*, HRESULT)).call(ppsecurityinfo)
  end
  def set_security_info(psecurityinfo : IGPMSecurityInfo) : HRESULT
    @lpVtbl.value.set_security_info.unsafe_as(Proc(IGPMSecurityInfo, HRESULT)).call(psecurityinfo)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def backup(bstrbackupdir : UInt8*, bstrcomment : UInt8*, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.backup.unsafe_as(Proc(UInt8*, UInt8*, VARIANT*, VARIANT*, IGPMResult*, HRESULT)).call(bstrbackupdir, bstrcomment, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def import(lflags : Int32, pigpmbackup : IGPMBackup, pvarmigrationtable : VARIANT*, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.import.unsafe_as(Proc(Int32, IGPMBackup, VARIANT*, VARIANT*, VARIANT*, IGPMResult*, HRESULT)).call(lflags, pigpmbackup, pvarmigrationtable, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def generate_report(gpmreporttype : GPMReportType, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.generate_report.unsafe_as(Proc(GPMReportType, VARIANT*, VARIANT*, IGPMResult*, HRESULT)).call(gpmreporttype, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def generate_report_to_file(gpmreporttype : GPMReportType, bstrtargetfilepath : UInt8*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.generate_report_to_file.unsafe_as(Proc(GPMReportType, UInt8*, IGPMResult*, HRESULT)).call(gpmreporttype, bstrtargetfilepath, ppigpmresult)
  end
  def copy_to(lflags : Int32, pigpmdomain : IGPMDomain, pvarnewdisplayname : VARIANT*, pvarmigrationtable : VARIANT*, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.copy_to.unsafe_as(Proc(Int32, IGPMDomain, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IGPMResult*, HRESULT)).call(lflags, pigpmdomain, pvarnewdisplayname, pvarmigrationtable, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def set_security_descriptor(lflags : Int32, psd : IDispatch) : HRESULT
    @lpVtbl.value.set_security_descriptor.unsafe_as(Proc(Int32, IDispatch, HRESULT)).call(lflags, psd)
  end
  def get_security_descriptor(lflags : Int32, ppsd : IDispatch*) : HRESULT
    @lpVtbl.value.get_security_descriptor.unsafe_as(Proc(Int32, IDispatch*, HRESULT)).call(lflags, ppsd)
  end
  def is_acl_consistent(pvbconsistent : Int16*) : HRESULT
    @lpVtbl.value.is_acl_consistent.unsafe_as(Proc(Int16*, HRESULT)).call(pvbconsistent)
  end
  def make_acl_consistent : HRESULT
    @lpVtbl.value.make_acl_consistent.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IGPMGPOCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(pval : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_item(lindex : Int32, pval : VARIANT*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(Int32, VARIANT*, HRESULT)).call(lindex, pval)
  end
  def get__new_enum(ppigpmgpos : IEnumVARIANT*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IEnumVARIANT*, HRESULT)).call(ppigpmgpos)
  end
end
struct LibWin32::IGPMGPOLink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_gpoid(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_gpoid.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def get_gpo_domain(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_gpo_domain.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def get_enabled(pval : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(pval)
  end
  def put_enabled(newval : Int16) : HRESULT
    @lpVtbl.value.put_enabled.unsafe_as(Proc(Int16, HRESULT)).call(newval)
  end
  def get_enforced(pval : Int16*) : HRESULT
    @lpVtbl.value.get_enforced.unsafe_as(Proc(Int16*, HRESULT)).call(pval)
  end
  def put_enforced(newval : Int16) : HRESULT
    @lpVtbl.value.put_enforced.unsafe_as(Proc(Int16, HRESULT)).call(newval)
  end
  def get_som_link_order(lval : Int32*) : HRESULT
    @lpVtbl.value.get_som_link_order.unsafe_as(Proc(Int32*, HRESULT)).call(lval)
  end
  def get_som(ppigpmsom : IGPMSOM*) : HRESULT
    @lpVtbl.value.get_som.unsafe_as(Proc(IGPMSOM*, HRESULT)).call(ppigpmsom)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IGPMGPOLinksCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(pval : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_item(lindex : Int32, pval : VARIANT*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(Int32, VARIANT*, HRESULT)).call(lindex, pval)
  end
  def get__new_enum(ppigpmlinks : IEnumVARIANT*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IEnumVARIANT*, HRESULT)).call(ppigpmlinks)
  end
end
struct LibWin32::IGPMCSECollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(pval : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_item(lindex : Int32, pval : VARIANT*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(Int32, VARIANT*, HRESULT)).call(lindex, pval)
  end
  def get__new_enum(ppigpmcses : IEnumVARIANT*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IEnumVARIANT*, HRESULT)).call(ppigpmcses)
  end
end
struct LibWin32::IGPMClientSideExtension
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def get_display_name(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def is_user_enabled(pvbenabled : Int16*) : HRESULT
    @lpVtbl.value.is_user_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(pvbenabled)
  end
  def is_computer_enabled(pvbenabled : Int16*) : HRESULT
    @lpVtbl.value.is_computer_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(pvbenabled)
  end
end
struct LibWin32::IGPMAsyncCancel
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def cancel : HRESULT
    @lpVtbl.value.cancel.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IGPMAsyncProgress
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def status(lprogressnumerator : Int32, lprogressdenominator : Int32, hrstatus : HRESULT, presult : VARIANT*, ppigpmstatusmsgcollection : IGPMStatusMsgCollection) : HRESULT
    @lpVtbl.value.status.unsafe_as(Proc(Int32, Int32, HRESULT, VARIANT*, IGPMStatusMsgCollection, HRESULT)).call(lprogressnumerator, lprogressdenominator, hrstatus, presult, ppigpmstatusmsgcollection)
  end
end
struct LibWin32::IGPMStatusMsgCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(pval : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_item(lindex : Int32, pval : VARIANT*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(Int32, VARIANT*, HRESULT)).call(lindex, pval)
  end
  def get__new_enum(pval : IEnumVARIANT*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IEnumVARIANT*, HRESULT)).call(pval)
  end
end
struct LibWin32::IGPMStatusMessage
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_object_path(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_object_path.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def error_code : HRESULT
    @lpVtbl.value.error_code.unsafe_as(Proc(HRESULT)).call
  end
  def get_extension_name(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_extension_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def get_settings_name(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_settings_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def operation_code : HRESULT
    @lpVtbl.value.operation_code.unsafe_as(Proc(HRESULT)).call
  end
  def get_message(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_message.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
end
struct LibWin32::IGPMConstants
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_perm_gpo_apply(pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_gpo_apply.unsafe_as(Proc(GPMPermissionType*, HRESULT)).call(pval)
  end
  def get_perm_gpo_read(pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_gpo_read.unsafe_as(Proc(GPMPermissionType*, HRESULT)).call(pval)
  end
  def get_perm_gpo_edit(pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_gpo_edit.unsafe_as(Proc(GPMPermissionType*, HRESULT)).call(pval)
  end
  def get_perm_gpo_edit_security_and_delete(pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_gpo_edit_security_and_delete.unsafe_as(Proc(GPMPermissionType*, HRESULT)).call(pval)
  end
  def get_perm_gpo_custom(pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_gpo_custom.unsafe_as(Proc(GPMPermissionType*, HRESULT)).call(pval)
  end
  def get_perm_wmi_filter_edit(pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_wmi_filter_edit.unsafe_as(Proc(GPMPermissionType*, HRESULT)).call(pval)
  end
  def get_perm_wmi_filter_full_control(pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_wmi_filter_full_control.unsafe_as(Proc(GPMPermissionType*, HRESULT)).call(pval)
  end
  def get_perm_wmi_filter_custom(pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_wmi_filter_custom.unsafe_as(Proc(GPMPermissionType*, HRESULT)).call(pval)
  end
  def get_perm_som_link(pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_som_link.unsafe_as(Proc(GPMPermissionType*, HRESULT)).call(pval)
  end
  def get_perm_som_logging(pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_som_logging.unsafe_as(Proc(GPMPermissionType*, HRESULT)).call(pval)
  end
  def get_perm_som_planning(pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_som_planning.unsafe_as(Proc(GPMPermissionType*, HRESULT)).call(pval)
  end
  def get_perm_somgpo_create(pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_somgpo_create.unsafe_as(Proc(GPMPermissionType*, HRESULT)).call(pval)
  end
  def get_perm_somwmi_create(pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_somwmi_create.unsafe_as(Proc(GPMPermissionType*, HRESULT)).call(pval)
  end
  def get_perm_somwmi_full_control(pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_somwmi_full_control.unsafe_as(Proc(GPMPermissionType*, HRESULT)).call(pval)
  end
  def get_search_property_gpo_permissions(pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_gpo_permissions.unsafe_as(Proc(GPMSearchProperty*, HRESULT)).call(pval)
  end
  def get_search_property_gpo_effective_permissions(pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_gpo_effective_permissions.unsafe_as(Proc(GPMSearchProperty*, HRESULT)).call(pval)
  end
  def get_search_property_gpo_display_name(pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_gpo_display_name.unsafe_as(Proc(GPMSearchProperty*, HRESULT)).call(pval)
  end
  def get_search_property_gpowmi_filter(pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_gpowmi_filter.unsafe_as(Proc(GPMSearchProperty*, HRESULT)).call(pval)
  end
  def get_search_property_gpoid(pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_gpoid.unsafe_as(Proc(GPMSearchProperty*, HRESULT)).call(pval)
  end
  def get_search_property_gpo_computer_extensions(pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_gpo_computer_extensions.unsafe_as(Proc(GPMSearchProperty*, HRESULT)).call(pval)
  end
  def get_search_property_gpo_user_extensions(pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_gpo_user_extensions.unsafe_as(Proc(GPMSearchProperty*, HRESULT)).call(pval)
  end
  def get_search_property_som_links(pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_som_links.unsafe_as(Proc(GPMSearchProperty*, HRESULT)).call(pval)
  end
  def get_search_property_gpo_domain(pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_gpo_domain.unsafe_as(Proc(GPMSearchProperty*, HRESULT)).call(pval)
  end
  def get_search_property_backup_most_recent(pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_backup_most_recent.unsafe_as(Proc(GPMSearchProperty*, HRESULT)).call(pval)
  end
  def get_search_op_equals(pval : GPMSearchOperation*) : HRESULT
    @lpVtbl.value.get_search_op_equals.unsafe_as(Proc(GPMSearchOperation*, HRESULT)).call(pval)
  end
  def get_search_op_contains(pval : GPMSearchOperation*) : HRESULT
    @lpVtbl.value.get_search_op_contains.unsafe_as(Proc(GPMSearchOperation*, HRESULT)).call(pval)
  end
  def get_search_op_not_contains(pval : GPMSearchOperation*) : HRESULT
    @lpVtbl.value.get_search_op_not_contains.unsafe_as(Proc(GPMSearchOperation*, HRESULT)).call(pval)
  end
  def get_search_op_not_equals(pval : GPMSearchOperation*) : HRESULT
    @lpVtbl.value.get_search_op_not_equals.unsafe_as(Proc(GPMSearchOperation*, HRESULT)).call(pval)
  end
  def get_use_pdc(pval : Int32*) : HRESULT
    @lpVtbl.value.get_use_pdc.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_use_any_dc(pval : Int32*) : HRESULT
    @lpVtbl.value.get_use_any_dc.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_do_not_use_w2_kdc(pval : Int32*) : HRESULT
    @lpVtbl.value.get_do_not_use_w2_kdc.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_som_site(pval : GPMSOMType*) : HRESULT
    @lpVtbl.value.get_som_site.unsafe_as(Proc(GPMSOMType*, HRESULT)).call(pval)
  end
  def get_som_domain(pval : GPMSOMType*) : HRESULT
    @lpVtbl.value.get_som_domain.unsafe_as(Proc(GPMSOMType*, HRESULT)).call(pval)
  end
  def get_somou(pval : GPMSOMType*) : HRESULT
    @lpVtbl.value.get_somou.unsafe_as(Proc(GPMSOMType*, HRESULT)).call(pval)
  end
  def get_security_flags(vbowner : Int16, vbgroup : Int16, vbdacl : Int16, vbsacl : Int16, pval : Int32*) : HRESULT
    @lpVtbl.value.get_security_flags.unsafe_as(Proc(Int16, Int16, Int16, Int16, Int32*, HRESULT)).call(vbowner, vbgroup, vbdacl, vbsacl, pval)
  end
  def get_do_not_validate_dc(pval : Int32*) : HRESULT
    @lpVtbl.value.get_do_not_validate_dc.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_report_html(pval : GPMReportType*) : HRESULT
    @lpVtbl.value.get_report_html.unsafe_as(Proc(GPMReportType*, HRESULT)).call(pval)
  end
  def get_report_xml(pval : GPMReportType*) : HRESULT
    @lpVtbl.value.get_report_xml.unsafe_as(Proc(GPMReportType*, HRESULT)).call(pval)
  end
  def get_rsop_mode_unknown(pval : GPMRSOPMode*) : HRESULT
    @lpVtbl.value.get_rsop_mode_unknown.unsafe_as(Proc(GPMRSOPMode*, HRESULT)).call(pval)
  end
  def get_rsop_mode_planning(pval : GPMRSOPMode*) : HRESULT
    @lpVtbl.value.get_rsop_mode_planning.unsafe_as(Proc(GPMRSOPMode*, HRESULT)).call(pval)
  end
  def get_rsop_mode_logging(pval : GPMRSOPMode*) : HRESULT
    @lpVtbl.value.get_rsop_mode_logging.unsafe_as(Proc(GPMRSOPMode*, HRESULT)).call(pval)
  end
  def get_entry_type_user(pval : GPMEntryType*) : HRESULT
    @lpVtbl.value.get_entry_type_user.unsafe_as(Proc(GPMEntryType*, HRESULT)).call(pval)
  end
  def get_entry_type_computer(pval : GPMEntryType*) : HRESULT
    @lpVtbl.value.get_entry_type_computer.unsafe_as(Proc(GPMEntryType*, HRESULT)).call(pval)
  end
  def get_entry_type_local_group(pval : GPMEntryType*) : HRESULT
    @lpVtbl.value.get_entry_type_local_group.unsafe_as(Proc(GPMEntryType*, HRESULT)).call(pval)
  end
  def get_entry_type_global_group(pval : GPMEntryType*) : HRESULT
    @lpVtbl.value.get_entry_type_global_group.unsafe_as(Proc(GPMEntryType*, HRESULT)).call(pval)
  end
  def get_entry_type_universal_group(pval : GPMEntryType*) : HRESULT
    @lpVtbl.value.get_entry_type_universal_group.unsafe_as(Proc(GPMEntryType*, HRESULT)).call(pval)
  end
  def get_entry_type_unc_path(pval : GPMEntryType*) : HRESULT
    @lpVtbl.value.get_entry_type_unc_path.unsafe_as(Proc(GPMEntryType*, HRESULT)).call(pval)
  end
  def get_entry_type_unknown(pval : GPMEntryType*) : HRESULT
    @lpVtbl.value.get_entry_type_unknown.unsafe_as(Proc(GPMEntryType*, HRESULT)).call(pval)
  end
  def get_destination_option_same_as_source(pval : GPMDestinationOption*) : HRESULT
    @lpVtbl.value.get_destination_option_same_as_source.unsafe_as(Proc(GPMDestinationOption*, HRESULT)).call(pval)
  end
  def get_destination_option_none(pval : GPMDestinationOption*) : HRESULT
    @lpVtbl.value.get_destination_option_none.unsafe_as(Proc(GPMDestinationOption*, HRESULT)).call(pval)
  end
  def get_destination_option_by_relative_name(pval : GPMDestinationOption*) : HRESULT
    @lpVtbl.value.get_destination_option_by_relative_name.unsafe_as(Proc(GPMDestinationOption*, HRESULT)).call(pval)
  end
  def get_destination_option_set(pval : GPMDestinationOption*) : HRESULT
    @lpVtbl.value.get_destination_option_set.unsafe_as(Proc(GPMDestinationOption*, HRESULT)).call(pval)
  end
  def get_migration_table_only(pval : Int32*) : HRESULT
    @lpVtbl.value.get_migration_table_only.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_process_security(pval : Int32*) : HRESULT
    @lpVtbl.value.get_process_security.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_rsop_logging_no_computer(pval : Int32*) : HRESULT
    @lpVtbl.value.get_rsop_logging_no_computer.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_rsop_logging_no_user(pval : Int32*) : HRESULT
    @lpVtbl.value.get_rsop_logging_no_user.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_rsop_planning_assume_slow_link(pval : Int32*) : HRESULT
    @lpVtbl.value.get_rsop_planning_assume_slow_link.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_rsop_planning_loopback_option(vbmerge : Int16, pval : Int32*) : HRESULT
    @lpVtbl.value.get_rsop_planning_loopback_option.unsafe_as(Proc(Int16, Int32*, HRESULT)).call(vbmerge, pval)
  end
  def get_rsop_planning_assume_user_wql_filter_true(pval : Int32*) : HRESULT
    @lpVtbl.value.get_rsop_planning_assume_user_wql_filter_true.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_rsop_planning_assume_comp_wql_filter_true(pval : Int32*) : HRESULT
    @lpVtbl.value.get_rsop_planning_assume_comp_wql_filter_true.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
end
struct LibWin32::IGPMResult
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_status(ppigpmstatusmsgcollection : IGPMStatusMsgCollection*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(IGPMStatusMsgCollection*, HRESULT)).call(ppigpmstatusmsgcollection)
  end
  def get_result(pvarresult : VARIANT*) : HRESULT
    @lpVtbl.value.get_result.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarresult)
  end
  def overall_status : HRESULT
    @lpVtbl.value.overall_status.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IGPMMapEntryCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(pval : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_item(lindex : Int32, pval : VARIANT*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(Int32, VARIANT*, HRESULT)).call(lindex, pval)
  end
  def get__new_enum(pval : IEnumVARIANT*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IEnumVARIANT*, HRESULT)).call(pval)
  end
end
struct LibWin32::IGPMMapEntry
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_source(pbstrsource : UInt8**) : HRESULT
    @lpVtbl.value.get_source.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrsource)
  end
  def get_destination(pbstrdestination : UInt8**) : HRESULT
    @lpVtbl.value.get_destination.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdestination)
  end
  def get_destination_option(pgpmdestoption : GPMDestinationOption*) : HRESULT
    @lpVtbl.value.get_destination_option.unsafe_as(Proc(GPMDestinationOption*, HRESULT)).call(pgpmdestoption)
  end
  def get_entry_type(pgpmentrytype : GPMEntryType*) : HRESULT
    @lpVtbl.value.get_entry_type.unsafe_as(Proc(GPMEntryType*, HRESULT)).call(pgpmentrytype)
  end
end
struct LibWin32::IGPMMigrationTable
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def save(bstrmigrationtablepath : UInt8*) : HRESULT
    @lpVtbl.value.save.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrmigrationtablepath)
  end
  def add(lflags : Int32, var : VARIANT) : HRESULT
    @lpVtbl.value.add.unsafe_as(Proc(Int32, VARIANT, HRESULT)).call(lflags, var)
  end
  def add_entry(bstrsource : UInt8*, gpmentrytype : GPMEntryType, pvardestination : VARIANT*, ppentry : IGPMMapEntry*) : HRESULT
    @lpVtbl.value.add_entry.unsafe_as(Proc(UInt8*, GPMEntryType, VARIANT*, IGPMMapEntry*, HRESULT)).call(bstrsource, gpmentrytype, pvardestination, ppentry)
  end
  def get_entry(bstrsource : UInt8*, ppentry : IGPMMapEntry*) : HRESULT
    @lpVtbl.value.get_entry.unsafe_as(Proc(UInt8*, IGPMMapEntry*, HRESULT)).call(bstrsource, ppentry)
  end
  def delete_entry(bstrsource : UInt8*) : HRESULT
    @lpVtbl.value.delete_entry.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrsource)
  end
  def update_destination(bstrsource : UInt8*, pvardestination : VARIANT*, ppentry : IGPMMapEntry*) : HRESULT
    @lpVtbl.value.update_destination.unsafe_as(Proc(UInt8*, VARIANT*, IGPMMapEntry*, HRESULT)).call(bstrsource, pvardestination, ppentry)
  end
  def validate(ppresult : IGPMResult*) : HRESULT
    @lpVtbl.value.validate.unsafe_as(Proc(IGPMResult*, HRESULT)).call(ppresult)
  end
  def get_entries(ppentries : IGPMMapEntryCollection*) : HRESULT
    @lpVtbl.value.get_entries.unsafe_as(Proc(IGPMMapEntryCollection*, HRESULT)).call(ppentries)
  end
end
struct LibWin32::IGPMBackupDirEx
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_backup_dir(pbstrbackupdir : UInt8**) : HRESULT
    @lpVtbl.value.get_backup_dir.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrbackupdir)
  end
  def get_backup_type(pgpmbackuptype : GPMBackupType*) : HRESULT
    @lpVtbl.value.get_backup_type.unsafe_as(Proc(GPMBackupType*, HRESULT)).call(pgpmbackuptype)
  end
  def get_backup(bstrid : UInt8*, pvarbackup : VARIANT*) : HRESULT
    @lpVtbl.value.get_backup.unsafe_as(Proc(UInt8*, VARIANT*, HRESULT)).call(bstrid, pvarbackup)
  end
  def search_backups(pigpmsearchcriteria : IGPMSearchCriteria, pvarbackupcollection : VARIANT*) : HRESULT
    @lpVtbl.value.search_backups.unsafe_as(Proc(IGPMSearchCriteria, VARIANT*, HRESULT)).call(pigpmsearchcriteria, pvarbackupcollection)
  end
end
struct LibWin32::IGPMStarterGPOBackupCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(pval : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_item(lindex : Int32, pval : VARIANT*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(Int32, VARIANT*, HRESULT)).call(lindex, pval)
  end
  def get__new_enum(ppigpmtmplbackup : IEnumVARIANT*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IEnumVARIANT*, HRESULT)).call(ppigpmtmplbackup)
  end
end
struct LibWin32::IGPMStarterGPOBackup
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_backup_dir(pbstrbackupdir : UInt8**) : HRESULT
    @lpVtbl.value.get_backup_dir.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrbackupdir)
  end
  def get_comment(pbstrcomment : UInt8**) : HRESULT
    @lpVtbl.value.get_comment.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrcomment)
  end
  def get_display_name(pbstrdisplayname : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdisplayname)
  end
  def get_domain(pbstrtemplatedomain : UInt8**) : HRESULT
    @lpVtbl.value.get_domain.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrtemplatedomain)
  end
  def get_starter_gpoid(pbstrtemplateid : UInt8**) : HRESULT
    @lpVtbl.value.get_starter_gpoid.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrtemplateid)
  end
  def get_id(pbstrid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrid)
  end
  def get_timestamp(ptimestamp : Float64*) : HRESULT
    @lpVtbl.value.get_timestamp.unsafe_as(Proc(Float64*, HRESULT)).call(ptimestamp)
  end
  def get_type(ptype : GPMStarterGPOType*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(GPMStarterGPOType*, HRESULT)).call(ptype)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def generate_report(gpmreporttype : GPMReportType, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.generate_report.unsafe_as(Proc(GPMReportType, VARIANT*, VARIANT*, IGPMResult*, HRESULT)).call(gpmreporttype, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def generate_report_to_file(gpmreporttype : GPMReportType, bstrtargetfilepath : UInt8*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.generate_report_to_file.unsafe_as(Proc(GPMReportType, UInt8*, IGPMResult*, HRESULT)).call(gpmreporttype, bstrtargetfilepath, ppigpmresult)
  end
end
struct LibWin32::IGPM2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_domain(bstrdomain : UInt8*, bstrdomaincontroller : UInt8*, ldcflags : Int32, pigpmdomain : IGPMDomain*) : HRESULT
    @lpVtbl.value.get_domain.unsafe_as(Proc(UInt8*, UInt8*, Int32, IGPMDomain*, HRESULT)).call(bstrdomain, bstrdomaincontroller, ldcflags, pigpmdomain)
  end
  def get_backup_dir(bstrbackupdir : UInt8*, pigpmbackupdir : IGPMBackupDir*) : HRESULT
    @lpVtbl.value.get_backup_dir.unsafe_as(Proc(UInt8*, IGPMBackupDir*, HRESULT)).call(bstrbackupdir, pigpmbackupdir)
  end
  def get_sites_container(bstrforest : UInt8*, bstrdomain : UInt8*, bstrdomaincontroller : UInt8*, ldcflags : Int32, ppigpmsitescontainer : IGPMSitesContainer*) : HRESULT
    @lpVtbl.value.get_sites_container.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, Int32, IGPMSitesContainer*, HRESULT)).call(bstrforest, bstrdomain, bstrdomaincontroller, ldcflags, ppigpmsitescontainer)
  end
  def get_rsop(gpmrsopmode : GPMRSOPMode, bstrnamespace : UInt8*, lflags : Int32, ppigpmrsop : IGPMRSOP*) : HRESULT
    @lpVtbl.value.get_rsop.unsafe_as(Proc(GPMRSOPMode, UInt8*, Int32, IGPMRSOP*, HRESULT)).call(gpmrsopmode, bstrnamespace, lflags, ppigpmrsop)
  end
  def create_permission(bstrtrustee : UInt8*, perm : GPMPermissionType, binheritable : Int16, ppperm : IGPMPermission*) : HRESULT
    @lpVtbl.value.create_permission.unsafe_as(Proc(UInt8*, GPMPermissionType, Int16, IGPMPermission*, HRESULT)).call(bstrtrustee, perm, binheritable, ppperm)
  end
  def create_search_criteria(ppigpmsearchcriteria : IGPMSearchCriteria*) : HRESULT
    @lpVtbl.value.create_search_criteria.unsafe_as(Proc(IGPMSearchCriteria*, HRESULT)).call(ppigpmsearchcriteria)
  end
  def create_trustee(bstrtrustee : UInt8*, ppigpmtrustee : IGPMTrustee*) : HRESULT
    @lpVtbl.value.create_trustee.unsafe_as(Proc(UInt8*, IGPMTrustee*, HRESULT)).call(bstrtrustee, ppigpmtrustee)
  end
  def get_client_side_extensions(ppigpmcsecollection : IGPMCSECollection*) : HRESULT
    @lpVtbl.value.get_client_side_extensions.unsafe_as(Proc(IGPMCSECollection*, HRESULT)).call(ppigpmcsecollection)
  end
  def get_constants(ppigpmconstants : IGPMConstants*) : HRESULT
    @lpVtbl.value.get_constants.unsafe_as(Proc(IGPMConstants*, HRESULT)).call(ppigpmconstants)
  end
  def get_migration_table(bstrmigrationtablepath : UInt8*, ppmigrationtable : IGPMMigrationTable*) : HRESULT
    @lpVtbl.value.get_migration_table.unsafe_as(Proc(UInt8*, IGPMMigrationTable*, HRESULT)).call(bstrmigrationtablepath, ppmigrationtable)
  end
  def create_migration_table(ppmigrationtable : IGPMMigrationTable*) : HRESULT
    @lpVtbl.value.create_migration_table.unsafe_as(Proc(IGPMMigrationTable*, HRESULT)).call(ppmigrationtable)
  end
  def initialize_reporting(bstradmpath : UInt8*) : HRESULT
    @lpVtbl.value.initialize_reporting.unsafe_as(Proc(UInt8*, HRESULT)).call(bstradmpath)
  end
  def get_backup_dir_ex(bstrbackupdir : UInt8*, backupdirtype : GPMBackupType, ppigpmbackupdirex : IGPMBackupDirEx*) : HRESULT
    @lpVtbl.value.get_backup_dir_ex.unsafe_as(Proc(UInt8*, GPMBackupType, IGPMBackupDirEx*, HRESULT)).call(bstrbackupdir, backupdirtype, ppigpmbackupdirex)
  end
  def initialize_reporting_ex(bstradmpath : UInt8*, reportingoptions : Int32) : HRESULT
    @lpVtbl.value.initialize_reporting_ex.unsafe_as(Proc(UInt8*, Int32, HRESULT)).call(bstradmpath, reportingoptions)
  end
end
struct LibWin32::IGPMStarterGPO
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_display_name(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def put_display_name(newval : UInt8*) : HRESULT
    @lpVtbl.value.put_display_name.unsafe_as(Proc(UInt8*, HRESULT)).call(newval)
  end
  def get_description(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def put_description(newval : UInt8*) : HRESULT
    @lpVtbl.value.put_description.unsafe_as(Proc(UInt8*, HRESULT)).call(newval)
  end
  def get_author(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_author.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def get_product(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_product.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def get_creation_time(pval : Float64*) : HRESULT
    @lpVtbl.value.get_creation_time.unsafe_as(Proc(Float64*, HRESULT)).call(pval)
  end
  def get_id(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def get_modified_time(pval : Float64*) : HRESULT
    @lpVtbl.value.get_modified_time.unsafe_as(Proc(Float64*, HRESULT)).call(pval)
  end
  def get_type(pval : GPMStarterGPOType*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(GPMStarterGPOType*, HRESULT)).call(pval)
  end
  def get_computer_version(pval : UInt16*) : HRESULT
    @lpVtbl.value.get_computer_version.unsafe_as(Proc(UInt16*, HRESULT)).call(pval)
  end
  def get_user_version(pval : UInt16*) : HRESULT
    @lpVtbl.value.get_user_version.unsafe_as(Proc(UInt16*, HRESULT)).call(pval)
  end
  def get_starter_gpo_version(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_starter_gpo_version.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def save(bstrsavefile : UInt8*, boverwrite : Int16, bsaveassystem : Int16, bstrlanguage : VARIANT*, bstrauthor : VARIANT*, bstrproduct : VARIANT*, bstruniqueid : VARIANT*, bstrversion : VARIANT*, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.save.unsafe_as(Proc(UInt8*, Int16, Int16, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IGPMResult*, HRESULT)).call(bstrsavefile, boverwrite, bsaveassystem, bstrlanguage, bstrauthor, bstrproduct, bstruniqueid, bstrversion, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def backup(bstrbackupdir : UInt8*, bstrcomment : UInt8*, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.backup.unsafe_as(Proc(UInt8*, UInt8*, VARIANT*, VARIANT*, IGPMResult*, HRESULT)).call(bstrbackupdir, bstrcomment, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def copy_to(pvarnewdisplayname : VARIANT*, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.copy_to.unsafe_as(Proc(VARIANT*, VARIANT*, VARIANT*, IGPMResult*, HRESULT)).call(pvarnewdisplayname, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def generate_report(gpmreporttype : GPMReportType, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.generate_report.unsafe_as(Proc(GPMReportType, VARIANT*, VARIANT*, IGPMResult*, HRESULT)).call(gpmreporttype, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def generate_report_to_file(gpmreporttype : GPMReportType, bstrtargetfilepath : UInt8*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.generate_report_to_file.unsafe_as(Proc(GPMReportType, UInt8*, IGPMResult*, HRESULT)).call(gpmreporttype, bstrtargetfilepath, ppigpmresult)
  end
  def get_security_info(ppsecurityinfo : IGPMSecurityInfo*) : HRESULT
    @lpVtbl.value.get_security_info.unsafe_as(Proc(IGPMSecurityInfo*, HRESULT)).call(ppsecurityinfo)
  end
  def set_security_info(psecurityinfo : IGPMSecurityInfo) : HRESULT
    @lpVtbl.value.set_security_info.unsafe_as(Proc(IGPMSecurityInfo, HRESULT)).call(psecurityinfo)
  end
end
struct LibWin32::IGPMStarterGPOCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(pval : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_item(lindex : Int32, pval : VARIANT*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(Int32, VARIANT*, HRESULT)).call(lindex, pval)
  end
  def get__new_enum(ppigpmtemplates : IEnumVARIANT*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IEnumVARIANT*, HRESULT)).call(ppigpmtemplates)
  end
end
struct LibWin32::IGPMDomain2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_domain_controller(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_domain_controller.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def get_domain(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_domain.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def create_gpo(ppnewgpo : IGPMGPO*) : HRESULT
    @lpVtbl.value.create_gpo.unsafe_as(Proc(IGPMGPO*, HRESULT)).call(ppnewgpo)
  end
  def get_gpo(bstrguid : UInt8*, ppgpo : IGPMGPO*) : HRESULT
    @lpVtbl.value.get_gpo.unsafe_as(Proc(UInt8*, IGPMGPO*, HRESULT)).call(bstrguid, ppgpo)
  end
  def search_gp_os(pigpmsearchcriteria : IGPMSearchCriteria, ppigpmgpocollection : IGPMGPOCollection*) : HRESULT
    @lpVtbl.value.search_gp_os.unsafe_as(Proc(IGPMSearchCriteria, IGPMGPOCollection*, HRESULT)).call(pigpmsearchcriteria, ppigpmgpocollection)
  end
  def restore_gpo(pigpmbackup : IGPMBackup, ldcflags : Int32, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.restore_gpo.unsafe_as(Proc(IGPMBackup, Int32, VARIANT*, VARIANT*, IGPMResult*, HRESULT)).call(pigpmbackup, ldcflags, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def get_som(bstrpath : UInt8*, ppsom : IGPMSOM*) : HRESULT
    @lpVtbl.value.get_som.unsafe_as(Proc(UInt8*, IGPMSOM*, HRESULT)).call(bstrpath, ppsom)
  end
  def search_so_ms(pigpmsearchcriteria : IGPMSearchCriteria, ppigpmsomcollection : IGPMSOMCollection*) : HRESULT
    @lpVtbl.value.search_so_ms.unsafe_as(Proc(IGPMSearchCriteria, IGPMSOMCollection*, HRESULT)).call(pigpmsearchcriteria, ppigpmsomcollection)
  end
  def get_wmi_filter(bstrpath : UInt8*, ppwmifilter : IGPMWMIFilter*) : HRESULT
    @lpVtbl.value.get_wmi_filter.unsafe_as(Proc(UInt8*, IGPMWMIFilter*, HRESULT)).call(bstrpath, ppwmifilter)
  end
  def search_wmi_filters(pigpmsearchcriteria : IGPMSearchCriteria, ppigpmwmifiltercollection : IGPMWMIFilterCollection*) : HRESULT
    @lpVtbl.value.search_wmi_filters.unsafe_as(Proc(IGPMSearchCriteria, IGPMWMIFilterCollection*, HRESULT)).call(pigpmsearchcriteria, ppigpmwmifiltercollection)
  end
  def create_starter_gpo(ppnewtemplate : IGPMStarterGPO*) : HRESULT
    @lpVtbl.value.create_starter_gpo.unsafe_as(Proc(IGPMStarterGPO*, HRESULT)).call(ppnewtemplate)
  end
  def create_gpo_from_starter_gpo(pgpotemplate : IGPMStarterGPO, ppnewgpo : IGPMGPO*) : HRESULT
    @lpVtbl.value.create_gpo_from_starter_gpo.unsafe_as(Proc(IGPMStarterGPO, IGPMGPO*, HRESULT)).call(pgpotemplate, ppnewgpo)
  end
  def get_starter_gpo(bstrguid : UInt8*, pptemplate : IGPMStarterGPO*) : HRESULT
    @lpVtbl.value.get_starter_gpo.unsafe_as(Proc(UInt8*, IGPMStarterGPO*, HRESULT)).call(bstrguid, pptemplate)
  end
  def search_starter_gp_os(pigpmsearchcriteria : IGPMSearchCriteria, ppigpmtemplatecollection : IGPMStarterGPOCollection*) : HRESULT
    @lpVtbl.value.search_starter_gp_os.unsafe_as(Proc(IGPMSearchCriteria, IGPMStarterGPOCollection*, HRESULT)).call(pigpmsearchcriteria, ppigpmtemplatecollection)
  end
  def load_starter_gpo(bstrloadfile : UInt8*, boverwrite : Int16, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.load_starter_gpo.unsafe_as(Proc(UInt8*, Int16, VARIANT*, VARIANT*, IGPMResult*, HRESULT)).call(bstrloadfile, boverwrite, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def restore_starter_gpo(pigpmtmplbackup : IGPMStarterGPOBackup, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.restore_starter_gpo.unsafe_as(Proc(IGPMStarterGPOBackup, VARIANT*, VARIANT*, IGPMResult*, HRESULT)).call(pigpmtmplbackup, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
end
struct LibWin32::IGPMConstants2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_perm_gpo_apply(pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_gpo_apply.unsafe_as(Proc(GPMPermissionType*, HRESULT)).call(pval)
  end
  def get_perm_gpo_read(pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_gpo_read.unsafe_as(Proc(GPMPermissionType*, HRESULT)).call(pval)
  end
  def get_perm_gpo_edit(pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_gpo_edit.unsafe_as(Proc(GPMPermissionType*, HRESULT)).call(pval)
  end
  def get_perm_gpo_edit_security_and_delete(pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_gpo_edit_security_and_delete.unsafe_as(Proc(GPMPermissionType*, HRESULT)).call(pval)
  end
  def get_perm_gpo_custom(pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_gpo_custom.unsafe_as(Proc(GPMPermissionType*, HRESULT)).call(pval)
  end
  def get_perm_wmi_filter_edit(pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_wmi_filter_edit.unsafe_as(Proc(GPMPermissionType*, HRESULT)).call(pval)
  end
  def get_perm_wmi_filter_full_control(pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_wmi_filter_full_control.unsafe_as(Proc(GPMPermissionType*, HRESULT)).call(pval)
  end
  def get_perm_wmi_filter_custom(pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_wmi_filter_custom.unsafe_as(Proc(GPMPermissionType*, HRESULT)).call(pval)
  end
  def get_perm_som_link(pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_som_link.unsafe_as(Proc(GPMPermissionType*, HRESULT)).call(pval)
  end
  def get_perm_som_logging(pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_som_logging.unsafe_as(Proc(GPMPermissionType*, HRESULT)).call(pval)
  end
  def get_perm_som_planning(pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_som_planning.unsafe_as(Proc(GPMPermissionType*, HRESULT)).call(pval)
  end
  def get_perm_somgpo_create(pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_somgpo_create.unsafe_as(Proc(GPMPermissionType*, HRESULT)).call(pval)
  end
  def get_perm_somwmi_create(pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_somwmi_create.unsafe_as(Proc(GPMPermissionType*, HRESULT)).call(pval)
  end
  def get_perm_somwmi_full_control(pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_somwmi_full_control.unsafe_as(Proc(GPMPermissionType*, HRESULT)).call(pval)
  end
  def get_search_property_gpo_permissions(pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_gpo_permissions.unsafe_as(Proc(GPMSearchProperty*, HRESULT)).call(pval)
  end
  def get_search_property_gpo_effective_permissions(pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_gpo_effective_permissions.unsafe_as(Proc(GPMSearchProperty*, HRESULT)).call(pval)
  end
  def get_search_property_gpo_display_name(pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_gpo_display_name.unsafe_as(Proc(GPMSearchProperty*, HRESULT)).call(pval)
  end
  def get_search_property_gpowmi_filter(pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_gpowmi_filter.unsafe_as(Proc(GPMSearchProperty*, HRESULT)).call(pval)
  end
  def get_search_property_gpoid(pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_gpoid.unsafe_as(Proc(GPMSearchProperty*, HRESULT)).call(pval)
  end
  def get_search_property_gpo_computer_extensions(pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_gpo_computer_extensions.unsafe_as(Proc(GPMSearchProperty*, HRESULT)).call(pval)
  end
  def get_search_property_gpo_user_extensions(pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_gpo_user_extensions.unsafe_as(Proc(GPMSearchProperty*, HRESULT)).call(pval)
  end
  def get_search_property_som_links(pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_som_links.unsafe_as(Proc(GPMSearchProperty*, HRESULT)).call(pval)
  end
  def get_search_property_gpo_domain(pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_gpo_domain.unsafe_as(Proc(GPMSearchProperty*, HRESULT)).call(pval)
  end
  def get_search_property_backup_most_recent(pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_backup_most_recent.unsafe_as(Proc(GPMSearchProperty*, HRESULT)).call(pval)
  end
  def get_search_op_equals(pval : GPMSearchOperation*) : HRESULT
    @lpVtbl.value.get_search_op_equals.unsafe_as(Proc(GPMSearchOperation*, HRESULT)).call(pval)
  end
  def get_search_op_contains(pval : GPMSearchOperation*) : HRESULT
    @lpVtbl.value.get_search_op_contains.unsafe_as(Proc(GPMSearchOperation*, HRESULT)).call(pval)
  end
  def get_search_op_not_contains(pval : GPMSearchOperation*) : HRESULT
    @lpVtbl.value.get_search_op_not_contains.unsafe_as(Proc(GPMSearchOperation*, HRESULT)).call(pval)
  end
  def get_search_op_not_equals(pval : GPMSearchOperation*) : HRESULT
    @lpVtbl.value.get_search_op_not_equals.unsafe_as(Proc(GPMSearchOperation*, HRESULT)).call(pval)
  end
  def get_use_pdc(pval : Int32*) : HRESULT
    @lpVtbl.value.get_use_pdc.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_use_any_dc(pval : Int32*) : HRESULT
    @lpVtbl.value.get_use_any_dc.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_do_not_use_w2_kdc(pval : Int32*) : HRESULT
    @lpVtbl.value.get_do_not_use_w2_kdc.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_som_site(pval : GPMSOMType*) : HRESULT
    @lpVtbl.value.get_som_site.unsafe_as(Proc(GPMSOMType*, HRESULT)).call(pval)
  end
  def get_som_domain(pval : GPMSOMType*) : HRESULT
    @lpVtbl.value.get_som_domain.unsafe_as(Proc(GPMSOMType*, HRESULT)).call(pval)
  end
  def get_somou(pval : GPMSOMType*) : HRESULT
    @lpVtbl.value.get_somou.unsafe_as(Proc(GPMSOMType*, HRESULT)).call(pval)
  end
  def get_security_flags(vbowner : Int16, vbgroup : Int16, vbdacl : Int16, vbsacl : Int16, pval : Int32*) : HRESULT
    @lpVtbl.value.get_security_flags.unsafe_as(Proc(Int16, Int16, Int16, Int16, Int32*, HRESULT)).call(vbowner, vbgroup, vbdacl, vbsacl, pval)
  end
  def get_do_not_validate_dc(pval : Int32*) : HRESULT
    @lpVtbl.value.get_do_not_validate_dc.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_report_html(pval : GPMReportType*) : HRESULT
    @lpVtbl.value.get_report_html.unsafe_as(Proc(GPMReportType*, HRESULT)).call(pval)
  end
  def get_report_xml(pval : GPMReportType*) : HRESULT
    @lpVtbl.value.get_report_xml.unsafe_as(Proc(GPMReportType*, HRESULT)).call(pval)
  end
  def get_rsop_mode_unknown(pval : GPMRSOPMode*) : HRESULT
    @lpVtbl.value.get_rsop_mode_unknown.unsafe_as(Proc(GPMRSOPMode*, HRESULT)).call(pval)
  end
  def get_rsop_mode_planning(pval : GPMRSOPMode*) : HRESULT
    @lpVtbl.value.get_rsop_mode_planning.unsafe_as(Proc(GPMRSOPMode*, HRESULT)).call(pval)
  end
  def get_rsop_mode_logging(pval : GPMRSOPMode*) : HRESULT
    @lpVtbl.value.get_rsop_mode_logging.unsafe_as(Proc(GPMRSOPMode*, HRESULT)).call(pval)
  end
  def get_entry_type_user(pval : GPMEntryType*) : HRESULT
    @lpVtbl.value.get_entry_type_user.unsafe_as(Proc(GPMEntryType*, HRESULT)).call(pval)
  end
  def get_entry_type_computer(pval : GPMEntryType*) : HRESULT
    @lpVtbl.value.get_entry_type_computer.unsafe_as(Proc(GPMEntryType*, HRESULT)).call(pval)
  end
  def get_entry_type_local_group(pval : GPMEntryType*) : HRESULT
    @lpVtbl.value.get_entry_type_local_group.unsafe_as(Proc(GPMEntryType*, HRESULT)).call(pval)
  end
  def get_entry_type_global_group(pval : GPMEntryType*) : HRESULT
    @lpVtbl.value.get_entry_type_global_group.unsafe_as(Proc(GPMEntryType*, HRESULT)).call(pval)
  end
  def get_entry_type_universal_group(pval : GPMEntryType*) : HRESULT
    @lpVtbl.value.get_entry_type_universal_group.unsafe_as(Proc(GPMEntryType*, HRESULT)).call(pval)
  end
  def get_entry_type_unc_path(pval : GPMEntryType*) : HRESULT
    @lpVtbl.value.get_entry_type_unc_path.unsafe_as(Proc(GPMEntryType*, HRESULT)).call(pval)
  end
  def get_entry_type_unknown(pval : GPMEntryType*) : HRESULT
    @lpVtbl.value.get_entry_type_unknown.unsafe_as(Proc(GPMEntryType*, HRESULT)).call(pval)
  end
  def get_destination_option_same_as_source(pval : GPMDestinationOption*) : HRESULT
    @lpVtbl.value.get_destination_option_same_as_source.unsafe_as(Proc(GPMDestinationOption*, HRESULT)).call(pval)
  end
  def get_destination_option_none(pval : GPMDestinationOption*) : HRESULT
    @lpVtbl.value.get_destination_option_none.unsafe_as(Proc(GPMDestinationOption*, HRESULT)).call(pval)
  end
  def get_destination_option_by_relative_name(pval : GPMDestinationOption*) : HRESULT
    @lpVtbl.value.get_destination_option_by_relative_name.unsafe_as(Proc(GPMDestinationOption*, HRESULT)).call(pval)
  end
  def get_destination_option_set(pval : GPMDestinationOption*) : HRESULT
    @lpVtbl.value.get_destination_option_set.unsafe_as(Proc(GPMDestinationOption*, HRESULT)).call(pval)
  end
  def get_migration_table_only(pval : Int32*) : HRESULT
    @lpVtbl.value.get_migration_table_only.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_process_security(pval : Int32*) : HRESULT
    @lpVtbl.value.get_process_security.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_rsop_logging_no_computer(pval : Int32*) : HRESULT
    @lpVtbl.value.get_rsop_logging_no_computer.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_rsop_logging_no_user(pval : Int32*) : HRESULT
    @lpVtbl.value.get_rsop_logging_no_user.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_rsop_planning_assume_slow_link(pval : Int32*) : HRESULT
    @lpVtbl.value.get_rsop_planning_assume_slow_link.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_rsop_planning_loopback_option(vbmerge : Int16, pval : Int32*) : HRESULT
    @lpVtbl.value.get_rsop_planning_loopback_option.unsafe_as(Proc(Int16, Int32*, HRESULT)).call(vbmerge, pval)
  end
  def get_rsop_planning_assume_user_wql_filter_true(pval : Int32*) : HRESULT
    @lpVtbl.value.get_rsop_planning_assume_user_wql_filter_true.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_rsop_planning_assume_comp_wql_filter_true(pval : Int32*) : HRESULT
    @lpVtbl.value.get_rsop_planning_assume_comp_wql_filter_true.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_backup_type_gpo(pval : GPMBackupType*) : HRESULT
    @lpVtbl.value.get_backup_type_gpo.unsafe_as(Proc(GPMBackupType*, HRESULT)).call(pval)
  end
  def get_backup_type_starter_gpo(pval : GPMBackupType*) : HRESULT
    @lpVtbl.value.get_backup_type_starter_gpo.unsafe_as(Proc(GPMBackupType*, HRESULT)).call(pval)
  end
  def get_starter_gpo_type_system(pval : GPMStarterGPOType*) : HRESULT
    @lpVtbl.value.get_starter_gpo_type_system.unsafe_as(Proc(GPMStarterGPOType*, HRESULT)).call(pval)
  end
  def get_starter_gpo_type_custom(pval : GPMStarterGPOType*) : HRESULT
    @lpVtbl.value.get_starter_gpo_type_custom.unsafe_as(Proc(GPMStarterGPOType*, HRESULT)).call(pval)
  end
  def get_search_property_starter_gpo_permissions(pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_starter_gpo_permissions.unsafe_as(Proc(GPMSearchProperty*, HRESULT)).call(pval)
  end
  def get_search_property_starter_gpo_effective_permissions(pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_starter_gpo_effective_permissions.unsafe_as(Proc(GPMSearchProperty*, HRESULT)).call(pval)
  end
  def get_search_property_starter_gpo_display_name(pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_starter_gpo_display_name.unsafe_as(Proc(GPMSearchProperty*, HRESULT)).call(pval)
  end
  def get_search_property_starter_gpoid(pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_starter_gpoid.unsafe_as(Proc(GPMSearchProperty*, HRESULT)).call(pval)
  end
  def get_search_property_starter_gpo_domain(pval : GPMSearchProperty*) : HRESULT
    @lpVtbl.value.get_search_property_starter_gpo_domain.unsafe_as(Proc(GPMSearchProperty*, HRESULT)).call(pval)
  end
  def get_perm_starter_gpo_read(pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_starter_gpo_read.unsafe_as(Proc(GPMPermissionType*, HRESULT)).call(pval)
  end
  def get_perm_starter_gpo_edit(pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_starter_gpo_edit.unsafe_as(Proc(GPMPermissionType*, HRESULT)).call(pval)
  end
  def get_perm_starter_gpo_full_control(pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_starter_gpo_full_control.unsafe_as(Proc(GPMPermissionType*, HRESULT)).call(pval)
  end
  def get_perm_starter_gpo_custom(pval : GPMPermissionType*) : HRESULT
    @lpVtbl.value.get_perm_starter_gpo_custom.unsafe_as(Proc(GPMPermissionType*, HRESULT)).call(pval)
  end
  def get_report_legacy(pval : GPMReportingOptions*) : HRESULT
    @lpVtbl.value.get_report_legacy.unsafe_as(Proc(GPMReportingOptions*, HRESULT)).call(pval)
  end
  def get_report_comments(pval : GPMReportingOptions*) : HRESULT
    @lpVtbl.value.get_report_comments.unsafe_as(Proc(GPMReportingOptions*, HRESULT)).call(pval)
  end
end
struct LibWin32::IGPMGPO2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_display_name(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def put_display_name(newval : UInt8*) : HRESULT
    @lpVtbl.value.put_display_name.unsafe_as(Proc(UInt8*, HRESULT)).call(newval)
  end
  def get_path(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_path.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def get_id(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def get_domain_name(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_domain_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def get_creation_time(pdate : Float64*) : HRESULT
    @lpVtbl.value.get_creation_time.unsafe_as(Proc(Float64*, HRESULT)).call(pdate)
  end
  def get_modification_time(pdate : Float64*) : HRESULT
    @lpVtbl.value.get_modification_time.unsafe_as(Proc(Float64*, HRESULT)).call(pdate)
  end
  def get_user_ds_version_number(pval : Int32*) : HRESULT
    @lpVtbl.value.get_user_ds_version_number.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_computer_ds_version_number(pval : Int32*) : HRESULT
    @lpVtbl.value.get_computer_ds_version_number.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_user_sysvol_version_number(pval : Int32*) : HRESULT
    @lpVtbl.value.get_user_sysvol_version_number.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_computer_sysvol_version_number(pval : Int32*) : HRESULT
    @lpVtbl.value.get_computer_sysvol_version_number.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_wmi_filter(ppigpmwmifilter : IGPMWMIFilter*) : HRESULT
    @lpVtbl.value.get_wmi_filter.unsafe_as(Proc(IGPMWMIFilter*, HRESULT)).call(ppigpmwmifilter)
  end
  def set_wmi_filter(pigpmwmifilter : IGPMWMIFilter) : HRESULT
    @lpVtbl.value.set_wmi_filter.unsafe_as(Proc(IGPMWMIFilter, HRESULT)).call(pigpmwmifilter)
  end
  def set_user_enabled(vbenabled : Int16) : HRESULT
    @lpVtbl.value.set_user_enabled.unsafe_as(Proc(Int16, HRESULT)).call(vbenabled)
  end
  def set_computer_enabled(vbenabled : Int16) : HRESULT
    @lpVtbl.value.set_computer_enabled.unsafe_as(Proc(Int16, HRESULT)).call(vbenabled)
  end
  def is_user_enabled(pvbenabled : Int16*) : HRESULT
    @lpVtbl.value.is_user_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(pvbenabled)
  end
  def is_computer_enabled(pvbenabled : Int16*) : HRESULT
    @lpVtbl.value.is_computer_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(pvbenabled)
  end
  def get_security_info(ppsecurityinfo : IGPMSecurityInfo*) : HRESULT
    @lpVtbl.value.get_security_info.unsafe_as(Proc(IGPMSecurityInfo*, HRESULT)).call(ppsecurityinfo)
  end
  def set_security_info(psecurityinfo : IGPMSecurityInfo) : HRESULT
    @lpVtbl.value.set_security_info.unsafe_as(Proc(IGPMSecurityInfo, HRESULT)).call(psecurityinfo)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def backup(bstrbackupdir : UInt8*, bstrcomment : UInt8*, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.backup.unsafe_as(Proc(UInt8*, UInt8*, VARIANT*, VARIANT*, IGPMResult*, HRESULT)).call(bstrbackupdir, bstrcomment, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def import(lflags : Int32, pigpmbackup : IGPMBackup, pvarmigrationtable : VARIANT*, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.import.unsafe_as(Proc(Int32, IGPMBackup, VARIANT*, VARIANT*, VARIANT*, IGPMResult*, HRESULT)).call(lflags, pigpmbackup, pvarmigrationtable, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def generate_report(gpmreporttype : GPMReportType, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.generate_report.unsafe_as(Proc(GPMReportType, VARIANT*, VARIANT*, IGPMResult*, HRESULT)).call(gpmreporttype, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def generate_report_to_file(gpmreporttype : GPMReportType, bstrtargetfilepath : UInt8*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.generate_report_to_file.unsafe_as(Proc(GPMReportType, UInt8*, IGPMResult*, HRESULT)).call(gpmreporttype, bstrtargetfilepath, ppigpmresult)
  end
  def copy_to(lflags : Int32, pigpmdomain : IGPMDomain, pvarnewdisplayname : VARIANT*, pvarmigrationtable : VARIANT*, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.copy_to.unsafe_as(Proc(Int32, IGPMDomain, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IGPMResult*, HRESULT)).call(lflags, pigpmdomain, pvarnewdisplayname, pvarmigrationtable, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def set_security_descriptor(lflags : Int32, psd : IDispatch) : HRESULT
    @lpVtbl.value.set_security_descriptor.unsafe_as(Proc(Int32, IDispatch, HRESULT)).call(lflags, psd)
  end
  def get_security_descriptor(lflags : Int32, ppsd : IDispatch*) : HRESULT
    @lpVtbl.value.get_security_descriptor.unsafe_as(Proc(Int32, IDispatch*, HRESULT)).call(lflags, ppsd)
  end
  def is_acl_consistent(pvbconsistent : Int16*) : HRESULT
    @lpVtbl.value.is_acl_consistent.unsafe_as(Proc(Int16*, HRESULT)).call(pvbconsistent)
  end
  def make_acl_consistent : HRESULT
    @lpVtbl.value.make_acl_consistent.unsafe_as(Proc(HRESULT)).call
  end
  def get_description(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def put_description(newval : UInt8*) : HRESULT
    @lpVtbl.value.put_description.unsafe_as(Proc(UInt8*, HRESULT)).call(newval)
  end
end
struct LibWin32::IGPMDomain3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_domain_controller(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_domain_controller.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def get_domain(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_domain.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def create_gpo(ppnewgpo : IGPMGPO*) : HRESULT
    @lpVtbl.value.create_gpo.unsafe_as(Proc(IGPMGPO*, HRESULT)).call(ppnewgpo)
  end
  def get_gpo(bstrguid : UInt8*, ppgpo : IGPMGPO*) : HRESULT
    @lpVtbl.value.get_gpo.unsafe_as(Proc(UInt8*, IGPMGPO*, HRESULT)).call(bstrguid, ppgpo)
  end
  def search_gp_os(pigpmsearchcriteria : IGPMSearchCriteria, ppigpmgpocollection : IGPMGPOCollection*) : HRESULT
    @lpVtbl.value.search_gp_os.unsafe_as(Proc(IGPMSearchCriteria, IGPMGPOCollection*, HRESULT)).call(pigpmsearchcriteria, ppigpmgpocollection)
  end
  def restore_gpo(pigpmbackup : IGPMBackup, ldcflags : Int32, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.restore_gpo.unsafe_as(Proc(IGPMBackup, Int32, VARIANT*, VARIANT*, IGPMResult*, HRESULT)).call(pigpmbackup, ldcflags, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def get_som(bstrpath : UInt8*, ppsom : IGPMSOM*) : HRESULT
    @lpVtbl.value.get_som.unsafe_as(Proc(UInt8*, IGPMSOM*, HRESULT)).call(bstrpath, ppsom)
  end
  def search_so_ms(pigpmsearchcriteria : IGPMSearchCriteria, ppigpmsomcollection : IGPMSOMCollection*) : HRESULT
    @lpVtbl.value.search_so_ms.unsafe_as(Proc(IGPMSearchCriteria, IGPMSOMCollection*, HRESULT)).call(pigpmsearchcriteria, ppigpmsomcollection)
  end
  def get_wmi_filter(bstrpath : UInt8*, ppwmifilter : IGPMWMIFilter*) : HRESULT
    @lpVtbl.value.get_wmi_filter.unsafe_as(Proc(UInt8*, IGPMWMIFilter*, HRESULT)).call(bstrpath, ppwmifilter)
  end
  def search_wmi_filters(pigpmsearchcriteria : IGPMSearchCriteria, ppigpmwmifiltercollection : IGPMWMIFilterCollection*) : HRESULT
    @lpVtbl.value.search_wmi_filters.unsafe_as(Proc(IGPMSearchCriteria, IGPMWMIFilterCollection*, HRESULT)).call(pigpmsearchcriteria, ppigpmwmifiltercollection)
  end
  def create_starter_gpo(ppnewtemplate : IGPMStarterGPO*) : HRESULT
    @lpVtbl.value.create_starter_gpo.unsafe_as(Proc(IGPMStarterGPO*, HRESULT)).call(ppnewtemplate)
  end
  def create_gpo_from_starter_gpo(pgpotemplate : IGPMStarterGPO, ppnewgpo : IGPMGPO*) : HRESULT
    @lpVtbl.value.create_gpo_from_starter_gpo.unsafe_as(Proc(IGPMStarterGPO, IGPMGPO*, HRESULT)).call(pgpotemplate, ppnewgpo)
  end
  def get_starter_gpo(bstrguid : UInt8*, pptemplate : IGPMStarterGPO*) : HRESULT
    @lpVtbl.value.get_starter_gpo.unsafe_as(Proc(UInt8*, IGPMStarterGPO*, HRESULT)).call(bstrguid, pptemplate)
  end
  def search_starter_gp_os(pigpmsearchcriteria : IGPMSearchCriteria, ppigpmtemplatecollection : IGPMStarterGPOCollection*) : HRESULT
    @lpVtbl.value.search_starter_gp_os.unsafe_as(Proc(IGPMSearchCriteria, IGPMStarterGPOCollection*, HRESULT)).call(pigpmsearchcriteria, ppigpmtemplatecollection)
  end
  def load_starter_gpo(bstrloadfile : UInt8*, boverwrite : Int16, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.load_starter_gpo.unsafe_as(Proc(UInt8*, Int16, VARIANT*, VARIANT*, IGPMResult*, HRESULT)).call(bstrloadfile, boverwrite, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def restore_starter_gpo(pigpmtmplbackup : IGPMStarterGPOBackup, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.restore_starter_gpo.unsafe_as(Proc(IGPMStarterGPOBackup, VARIANT*, VARIANT*, IGPMResult*, HRESULT)).call(pigpmtmplbackup, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def generate_report(gpmreporttype : GPMReportType, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.generate_report.unsafe_as(Proc(GPMReportType, VARIANT*, VARIANT*, IGPMResult*, HRESULT)).call(gpmreporttype, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def get_infrastructure_dc(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_infrastructure_dc.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def put_infrastructure_dc(newval : UInt8*) : HRESULT
    @lpVtbl.value.put_infrastructure_dc.unsafe_as(Proc(UInt8*, HRESULT)).call(newval)
  end
  def put_infrastructure_flags(dwflags : UInt32) : HRESULT
    @lpVtbl.value.put_infrastructure_flags.unsafe_as(Proc(UInt32, HRESULT)).call(dwflags)
  end
end
struct LibWin32::IGPMGPO3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_display_name(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def put_display_name(newval : UInt8*) : HRESULT
    @lpVtbl.value.put_display_name.unsafe_as(Proc(UInt8*, HRESULT)).call(newval)
  end
  def get_path(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_path.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def get_id(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def get_domain_name(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_domain_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def get_creation_time(pdate : Float64*) : HRESULT
    @lpVtbl.value.get_creation_time.unsafe_as(Proc(Float64*, HRESULT)).call(pdate)
  end
  def get_modification_time(pdate : Float64*) : HRESULT
    @lpVtbl.value.get_modification_time.unsafe_as(Proc(Float64*, HRESULT)).call(pdate)
  end
  def get_user_ds_version_number(pval : Int32*) : HRESULT
    @lpVtbl.value.get_user_ds_version_number.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_computer_ds_version_number(pval : Int32*) : HRESULT
    @lpVtbl.value.get_computer_ds_version_number.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_user_sysvol_version_number(pval : Int32*) : HRESULT
    @lpVtbl.value.get_user_sysvol_version_number.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_computer_sysvol_version_number(pval : Int32*) : HRESULT
    @lpVtbl.value.get_computer_sysvol_version_number.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_wmi_filter(ppigpmwmifilter : IGPMWMIFilter*) : HRESULT
    @lpVtbl.value.get_wmi_filter.unsafe_as(Proc(IGPMWMIFilter*, HRESULT)).call(ppigpmwmifilter)
  end
  def set_wmi_filter(pigpmwmifilter : IGPMWMIFilter) : HRESULT
    @lpVtbl.value.set_wmi_filter.unsafe_as(Proc(IGPMWMIFilter, HRESULT)).call(pigpmwmifilter)
  end
  def set_user_enabled(vbenabled : Int16) : HRESULT
    @lpVtbl.value.set_user_enabled.unsafe_as(Proc(Int16, HRESULT)).call(vbenabled)
  end
  def set_computer_enabled(vbenabled : Int16) : HRESULT
    @lpVtbl.value.set_computer_enabled.unsafe_as(Proc(Int16, HRESULT)).call(vbenabled)
  end
  def is_user_enabled(pvbenabled : Int16*) : HRESULT
    @lpVtbl.value.is_user_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(pvbenabled)
  end
  def is_computer_enabled(pvbenabled : Int16*) : HRESULT
    @lpVtbl.value.is_computer_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(pvbenabled)
  end
  def get_security_info(ppsecurityinfo : IGPMSecurityInfo*) : HRESULT
    @lpVtbl.value.get_security_info.unsafe_as(Proc(IGPMSecurityInfo*, HRESULT)).call(ppsecurityinfo)
  end
  def set_security_info(psecurityinfo : IGPMSecurityInfo) : HRESULT
    @lpVtbl.value.set_security_info.unsafe_as(Proc(IGPMSecurityInfo, HRESULT)).call(psecurityinfo)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def backup(bstrbackupdir : UInt8*, bstrcomment : UInt8*, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.backup.unsafe_as(Proc(UInt8*, UInt8*, VARIANT*, VARIANT*, IGPMResult*, HRESULT)).call(bstrbackupdir, bstrcomment, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def import(lflags : Int32, pigpmbackup : IGPMBackup, pvarmigrationtable : VARIANT*, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.import.unsafe_as(Proc(Int32, IGPMBackup, VARIANT*, VARIANT*, VARIANT*, IGPMResult*, HRESULT)).call(lflags, pigpmbackup, pvarmigrationtable, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def generate_report(gpmreporttype : GPMReportType, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.generate_report.unsafe_as(Proc(GPMReportType, VARIANT*, VARIANT*, IGPMResult*, HRESULT)).call(gpmreporttype, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def generate_report_to_file(gpmreporttype : GPMReportType, bstrtargetfilepath : UInt8*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.generate_report_to_file.unsafe_as(Proc(GPMReportType, UInt8*, IGPMResult*, HRESULT)).call(gpmreporttype, bstrtargetfilepath, ppigpmresult)
  end
  def copy_to(lflags : Int32, pigpmdomain : IGPMDomain, pvarnewdisplayname : VARIANT*, pvarmigrationtable : VARIANT*, pvargpmprogress : VARIANT*, pvargpmcancel : VARIANT*, ppigpmresult : IGPMResult*) : HRESULT
    @lpVtbl.value.copy_to.unsafe_as(Proc(Int32, IGPMDomain, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IGPMResult*, HRESULT)).call(lflags, pigpmdomain, pvarnewdisplayname, pvarmigrationtable, pvargpmprogress, pvargpmcancel, ppigpmresult)
  end
  def set_security_descriptor(lflags : Int32, psd : IDispatch) : HRESULT
    @lpVtbl.value.set_security_descriptor.unsafe_as(Proc(Int32, IDispatch, HRESULT)).call(lflags, psd)
  end
  def get_security_descriptor(lflags : Int32, ppsd : IDispatch*) : HRESULT
    @lpVtbl.value.get_security_descriptor.unsafe_as(Proc(Int32, IDispatch*, HRESULT)).call(lflags, ppsd)
  end
  def is_acl_consistent(pvbconsistent : Int16*) : HRESULT
    @lpVtbl.value.is_acl_consistent.unsafe_as(Proc(Int16*, HRESULT)).call(pvbconsistent)
  end
  def make_acl_consistent : HRESULT
    @lpVtbl.value.make_acl_consistent.unsafe_as(Proc(HRESULT)).call
  end
  def get_description(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def put_description(newval : UInt8*) : HRESULT
    @lpVtbl.value.put_description.unsafe_as(Proc(UInt8*, HRESULT)).call(newval)
  end
  def get_infrastructure_dc(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_infrastructure_dc.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def put_infrastructure_dc(newval : UInt8*) : HRESULT
    @lpVtbl.value.put_infrastructure_dc.unsafe_as(Proc(UInt8*, HRESULT)).call(newval)
  end
  def put_infrastructure_flags(dwflags : UInt32) : HRESULT
    @lpVtbl.value.put_infrastructure_flags.unsafe_as(Proc(UInt32, HRESULT)).call(dwflags)
  end
end
struct LibWin32::IGPEInformation
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_name(pszname : Char*, cchmaxlength : Int32) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(Char*, Int32, HRESULT)).call(pszname, cchmaxlength)
  end
  def get_display_name(pszname : Char*, cchmaxlength : Int32) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(Char*, Int32, HRESULT)).call(pszname, cchmaxlength)
  end
  def get_registry_key(dwsection : UInt32, hkey : HKEY*) : HRESULT
    @lpVtbl.value.get_registry_key.unsafe_as(Proc(UInt32, HKEY*, HRESULT)).call(dwsection, hkey)
  end
  def get_ds_path(dwsection : UInt32, pszpath : Char*, cchmaxpath : Int32) : HRESULT
    @lpVtbl.value.get_ds_path.unsafe_as(Proc(UInt32, Char*, Int32, HRESULT)).call(dwsection, pszpath, cchmaxpath)
  end
  def get_file_sys_path(dwsection : UInt32, pszpath : Char*, cchmaxpath : Int32) : HRESULT
    @lpVtbl.value.get_file_sys_path.unsafe_as(Proc(UInt32, Char*, Int32, HRESULT)).call(dwsection, pszpath, cchmaxpath)
  end
  def get_options(dwoptions : UInt32*) : HRESULT
    @lpVtbl.value.get_options.unsafe_as(Proc(UInt32*, HRESULT)).call(dwoptions)
  end
  def get_type(gpotype : GROUP_POLICY_OBJECT_TYPE*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(GROUP_POLICY_OBJECT_TYPE*, HRESULT)).call(gpotype)
  end
  def get_hint(gphint : GROUP_POLICY_HINT_TYPE*) : HRESULT
    @lpVtbl.value.get_hint.unsafe_as(Proc(GROUP_POLICY_HINT_TYPE*, HRESULT)).call(gphint)
  end
  def policy_changed(bmachine : LibC::BOOL, badd : LibC::BOOL, pguidextension : Guid*, pguidsnapin : Guid*) : HRESULT
    @lpVtbl.value.policy_changed.unsafe_as(Proc(LibC::BOOL, LibC::BOOL, Guid*, Guid*, HRESULT)).call(bmachine, badd, pguidextension, pguidsnapin)
  end
end
struct LibWin32::IGroupPolicyObject
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def new(pszdomainname : LibC::LPWSTR, pszdisplayname : LibC::LPWSTR, dwflags : UInt32) : HRESULT
    @lpVtbl.value.new.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, UInt32, HRESULT)).call(pszdomainname, pszdisplayname, dwflags)
  end
  def open_dsgpo(pszpath : LibC::LPWSTR, dwflags : UInt32) : HRESULT
    @lpVtbl.value.open_dsgpo.unsafe_as(Proc(LibC::LPWSTR, UInt32, HRESULT)).call(pszpath, dwflags)
  end
  def open_local_machine_gpo(dwflags : UInt32) : HRESULT
    @lpVtbl.value.open_local_machine_gpo.unsafe_as(Proc(UInt32, HRESULT)).call(dwflags)
  end
  def open_remote_machine_gpo(pszcomputername : LibC::LPWSTR, dwflags : UInt32) : HRESULT
    @lpVtbl.value.open_remote_machine_gpo.unsafe_as(Proc(LibC::LPWSTR, UInt32, HRESULT)).call(pszcomputername, dwflags)
  end
  def save(bmachine : LibC::BOOL, badd : LibC::BOOL, pguidextension : Guid*, pguid : Guid*) : HRESULT
    @lpVtbl.value.save.unsafe_as(Proc(LibC::BOOL, LibC::BOOL, Guid*, Guid*, HRESULT)).call(bmachine, badd, pguidextension, pguid)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def get_name(pszname : Char*, cchmaxlength : Int32) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(Char*, Int32, HRESULT)).call(pszname, cchmaxlength)
  end
  def get_display_name(pszname : Char*, cchmaxlength : Int32) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(Char*, Int32, HRESULT)).call(pszname, cchmaxlength)
  end
  def set_display_name(pszname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_display_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pszname)
  end
  def get_path(pszpath : Char*, cchmaxlength : Int32) : HRESULT
    @lpVtbl.value.get_path.unsafe_as(Proc(Char*, Int32, HRESULT)).call(pszpath, cchmaxlength)
  end
  def get_ds_path(dwsection : UInt32, pszpath : Char*, cchmaxpath : Int32) : HRESULT
    @lpVtbl.value.get_ds_path.unsafe_as(Proc(UInt32, Char*, Int32, HRESULT)).call(dwsection, pszpath, cchmaxpath)
  end
  def get_file_sys_path(dwsection : UInt32, pszpath : Char*, cchmaxpath : Int32) : HRESULT
    @lpVtbl.value.get_file_sys_path.unsafe_as(Proc(UInt32, Char*, Int32, HRESULT)).call(dwsection, pszpath, cchmaxpath)
  end
  def get_registry_key(dwsection : UInt32, hkey : HKEY*) : HRESULT
    @lpVtbl.value.get_registry_key.unsafe_as(Proc(UInt32, HKEY*, HRESULT)).call(dwsection, hkey)
  end
  def get_options(dwoptions : UInt32*) : HRESULT
    @lpVtbl.value.get_options.unsafe_as(Proc(UInt32*, HRESULT)).call(dwoptions)
  end
  def set_options(dwoptions : UInt32, dwmask : UInt32) : HRESULT
    @lpVtbl.value.set_options.unsafe_as(Proc(UInt32, UInt32, HRESULT)).call(dwoptions, dwmask)
  end
  def get_type(gpotype : GROUP_POLICY_OBJECT_TYPE*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(GROUP_POLICY_OBJECT_TYPE*, HRESULT)).call(gpotype)
  end
  def get_machine_name(pszname : Char*, cchmaxlength : Int32) : HRESULT
    @lpVtbl.value.get_machine_name.unsafe_as(Proc(Char*, Int32, HRESULT)).call(pszname, cchmaxlength)
  end
  def get_property_sheet_pages(hpages : HPROPSHEETPAGE**, upagecount : UInt32*) : HRESULT
    @lpVtbl.value.get_property_sheet_pages.unsafe_as(Proc(HPROPSHEETPAGE**, UInt32*, HRESULT)).call(hpages, upagecount)
  end
end
struct LibWin32::IRSOPInformation
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_namespace(dwsection : UInt32, pszname : Char*, cchmaxlength : Int32) : HRESULT
    @lpVtbl.value.get_namespace.unsafe_as(Proc(UInt32, Char*, Int32, HRESULT)).call(dwsection, pszname, cchmaxlength)
  end
  def get_flags(pdwflags : UInt32*) : HRESULT
    @lpVtbl.value.get_flags.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwflags)
  end
  def get_event_log_entry_text(pszeventsource : LibC::LPWSTR, pszeventlogname : LibC::LPWSTR, pszeventtime : LibC::LPWSTR, dweventid : UInt32, ppsztext : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_event_log_entry_text.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, UInt32, LibC::LPWSTR*, HRESULT)).call(pszeventsource, pszeventlogname, pszeventtime, dweventid, ppsztext)
  end
end
