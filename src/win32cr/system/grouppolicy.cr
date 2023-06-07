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
  GPM = LibC::GUID.new(0xf5694708_u32, 0x88fe_u16, 0x4b35_u16, StaticArray[0xba_u8, 0xbf_u8, 0xe5_u8, 0x61_u8, 0x62_u8, 0xd5_u8, 0xfb_u8, 0xc8_u8])
  GPMDomain = LibC::GUID.new(0x710901be_u32, 0x1050_u16, 0x4cb1_u16, StaticArray[0x83_u8, 0x8a_u8, 0xc5_u8, 0xcf_u8, 0xf2_u8, 0x59_u8, 0xe1_u8, 0x83_u8])
  GPMSitesContainer = LibC::GUID.new(0x229f5c42_u32, 0x852c_u16, 0x4b30_u16, StaticArray[0x94_u8, 0x5f_u8, 0xc5_u8, 0x22_u8, 0xbe_u8, 0x9b_u8, 0xd3_u8, 0x86_u8])
  GPMBackupDir = LibC::GUID.new(0xfce4a59d_u32, 0xf21_u16, 0x4afa_u16, StaticArray[0xb8_u8, 0x59_u8, 0xe6_u8, 0xd0_u8, 0xc6_u8, 0x2c_u8, 0xd1_u8, 0xc_u8])
  GPMSOM = LibC::GUID.new(0x32d93fac_u32, 0x450e_u16, 0x44cf_u16, StaticArray[0x82_u8, 0x9c_u8, 0x8b_u8, 0x22_u8, 0xff_u8, 0x6b_u8, 0xda_u8, 0xe1_u8])
  GPMSearchCriteria = LibC::GUID.new(0x17aaca26_u32, 0x5ce0_u16, 0x44fa_u16, StaticArray[0x8c_u8, 0xc0_u8, 0x52_u8, 0x59_u8, 0xe6_u8, 0x48_u8, 0x35_u8, 0x66_u8])
  GPMPermission = LibC::GUID.new(0x5871a40a_u32, 0xe9c0_u16, 0x46ec_u16, StaticArray[0x91_u8, 0x3e_u8, 0x94_u8, 0x4e_u8, 0xf9_u8, 0x22_u8, 0x5a_u8, 0x94_u8])
  GPMSecurityInfo = LibC::GUID.new(0x547a5e8f_u32, 0x9162_u16, 0x4516_u16, StaticArray[0xa4_u8, 0xdf_u8, 0x9d_u8, 0xdb_u8, 0x96_u8, 0x86_u8, 0xd8_u8, 0x46_u8])
  GPMBackup = LibC::GUID.new(0xed1a54b8_u32, 0x5efa_u16, 0x482a_u16, StaticArray[0x93_u8, 0xc0_u8, 0x8a_u8, 0xd8_u8, 0x6f_u8, 0xd_u8, 0x68_u8, 0xc3_u8])
  GPMBackupCollection = LibC::GUID.new(0xeb8f035b_u32, 0x70db_u16, 0x4a9f_u16, StaticArray[0x96_u8, 0x76_u8, 0x37_u8, 0xc2_u8, 0x59_u8, 0x94_u8, 0xe9_u8, 0xdc_u8])
  GPMSOMCollection = LibC::GUID.new(0x24c1f147_u32, 0x3720_u16, 0x4f5b_u16, StaticArray[0xa9_u8, 0xc3_u8, 0x6_u8, 0xb4_u8, 0xe4_u8, 0xf9_u8, 0x31_u8, 0xd2_u8])
  GPMWMIFilter = LibC::GUID.new(0x626745d8_u32, 0xdea_u16, 0x4062_u16, StaticArray[0xbf_u8, 0x60_u8, 0xcf_u8, 0xc5_u8, 0xb1_u8, 0xca_u8, 0x12_u8, 0x86_u8])
  GPMWMIFilterCollection = LibC::GUID.new(0x74dc6d28_u32, 0xe820_u16, 0x47d6_u16, StaticArray[0xa0_u8, 0xb8_u8, 0xf0_u8, 0x8d_u8, 0x93_u8, 0xd7_u8, 0xfa_u8, 0x33_u8])
  GPMRSOP = LibC::GUID.new(0x489b0caf_u32, 0x9ec2_u16, 0x4eb7_u16, StaticArray[0x91_u8, 0xf5_u8, 0xb6_u8, 0xf7_u8, 0x1d_u8, 0x43_u8, 0xda_u8, 0x8c_u8])
  GPMGPO = LibC::GUID.new(0xd2ce2994_u32, 0x59b5_u16, 0x4064_u16, StaticArray[0xb5_u8, 0x81_u8, 0x4d_u8, 0x68_u8, 0x48_u8, 0x6a_u8, 0x16_u8, 0xc4_u8])
  GPMGPOCollection = LibC::GUID.new(0x7a057325_u32, 0x832d_u16, 0x4de3_u16, StaticArray[0xa4_u8, 0x1f_u8, 0xc7_u8, 0x80_u8, 0x43_u8, 0x6a_u8, 0x4e_u8, 0x9_u8])
  GPMGPOLink = LibC::GUID.new(0xc1df9880_u32, 0x5303_u16, 0x42c6_u16, StaticArray[0x8a_u8, 0x3c_u8, 0x4_u8, 0x88_u8, 0xe1_u8, 0xbf_u8, 0x73_u8, 0x64_u8])
  GPMGPOLinksCollection = LibC::GUID.new(0xf6ed581a_u32, 0x49a5_u16, 0x47e2_u16, StaticArray[0xb7_u8, 0x71_u8, 0xfd_u8, 0x8d_u8, 0xc0_u8, 0x2b_u8, 0x62_u8, 0x59_u8])
  GPMAsyncCancel = LibC::GUID.new(0x372796a9_u32, 0x76ec_u16, 0x479d_u16, StaticArray[0xad_u8, 0x6c_u8, 0x55_u8, 0x63_u8, 0x18_u8, 0xed_u8, 0x5f_u8, 0x9d_u8])
  GPMStatusMsgCollection = LibC::GUID.new(0x2824e4be_u32, 0x4bcc_u16, 0x4cac_u16, StaticArray[0x9e_u8, 0x60_u8, 0xe_u8, 0x3e_u8, 0xd7_u8, 0xf1_u8, 0x24_u8, 0x96_u8])
  GPMStatusMessage = LibC::GUID.new(0x4b77cc94_u32, 0xd255_u16, 0x409b_u16, StaticArray[0xbc_u8, 0x62_u8, 0x37_u8, 0x8_u8, 0x81_u8, 0x71_u8, 0x5a_u8, 0x19_u8])
  GPMTrustee = LibC::GUID.new(0xc54a700d_u32, 0x19b6_u16, 0x4211_u16, StaticArray[0xbc_u8, 0xb0_u8, 0xe8_u8, 0xe2_u8, 0x47_u8, 0x5e_u8, 0x47_u8, 0x1e_u8])
  GPMClientSideExtension = LibC::GUID.new(0xc1a2e70e_u32, 0x659c_u16, 0x4b1a_u16, StaticArray[0x94_u8, 0xb_u8, 0xf8_u8, 0x8b_u8, 0xa_u8, 0xf9_u8, 0xc8_u8, 0xa4_u8])
  GPMCSECollection = LibC::GUID.new(0xcf92b828_u32, 0x2d44_u16, 0x4b61_u16, StaticArray[0xb1_u8, 0xa_u8, 0xb3_u8, 0x27_u8, 0xaf_u8, 0xd4_u8, 0x2d_u8, 0xa8_u8])
  GPMConstants = LibC::GUID.new(0x3855e880_u32, 0xcd9e_u16, 0x4d0c_u16, StaticArray[0x9e_u8, 0xaf_u8, 0x15_u8, 0x79_u8, 0x28_u8, 0x3a_u8, 0x18_u8, 0x88_u8])
  GPMResult = LibC::GUID.new(0x92101ac0_u32, 0x9287_u16, 0x4206_u16, StaticArray[0xa3_u8, 0xb2_u8, 0x4b_u8, 0xdb_u8, 0x73_u8, 0xd2_u8, 0x25_u8, 0xf6_u8])
  GPMMapEntryCollection = LibC::GUID.new(0xcf75d5b_u32, 0xa3a1_u16, 0x4c55_u16, StaticArray[0xb4_u8, 0xfe_u8, 0x9e_u8, 0x14_u8, 0x9c_u8, 0x41_u8, 0xf6_u8, 0x6d_u8])
  GPMMapEntry = LibC::GUID.new(0x8c975253_u32, 0x5431_u16, 0x4471_u16, StaticArray[0xb3_u8, 0x5d_u8, 0x6_u8, 0x26_u8, 0xc9_u8, 0x28_u8, 0x25_u8, 0x8a_u8])
  GPMMigrationTable = LibC::GUID.new(0x55af4043_u32, 0x2a06_u16, 0x4f72_u16, StaticArray[0xab_u8, 0xef_u8, 0x63_u8, 0x1b_u8, 0x44_u8, 0x7_u8, 0x9c_u8, 0x76_u8])
  GPMBackupDirEx = LibC::GUID.new(0xe8c0988a_u32, 0xcf03_u16, 0x4c5b_u16, StaticArray[0x8b_u8, 0xe2_u8, 0x2a_u8, 0xa9_u8, 0xad_u8, 0x32_u8, 0xaa_u8, 0xda_u8])
  GPMStarterGPOBackupCollection = LibC::GUID.new(0xe75ea59d_u32, 0x1aeb_u16, 0x4cb5_u16, StaticArray[0xa7_u8, 0x8a_u8, 0x28_u8, 0x1d_u8, 0xaa_u8, 0x58_u8, 0x24_u8, 0x6_u8])
  GPMStarterGPOBackup = LibC::GUID.new(0x389e400a_u32, 0xd8ef_u16, 0x455b_u16, StaticArray[0xa8_u8, 0x61_u8, 0x5f_u8, 0x9c_u8, 0xa3_u8, 0x4a_u8, 0x6a_u8, 0x2_u8])
  GPMTemplate = LibC::GUID.new(0xecf1d454_u32, 0x71da_u16, 0x4e2f_u16, StaticArray[0xa8_u8, 0xc0_u8, 0x81_u8, 0x85_u8, 0x46_u8, 0x59_u8, 0x11_u8, 0xd9_u8])
  GPMStarterGPOCollection = LibC::GUID.new(0x82f8aa8b_u32, 0x49ba_u16, 0x43b2_u16, StaticArray[0x95_u8, 0x6e_u8, 0x33_u8, 0x97_u8, 0xf9_u8, 0xb9_u8, 0x4c_u8, 0x3a_u8])

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
  fun GetLocalManagedApplicationData(productcode : LibC::LPWSTR, displayname : LibC::LPWSTR*, supporturl : LibC::LPWSTR*)

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
