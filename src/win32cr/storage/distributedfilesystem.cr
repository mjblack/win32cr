require "../foundation.cr"
require "../security.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:netapi32.dll")]
lib LibWin32
  FSCTL_DFS_BASE = 6_u32
  DFS_VOLUME_STATES = 15_u32
  DFS_VOLUME_STATE_OK = 1_u32
  DFS_VOLUME_STATE_INCONSISTENT = 2_u32
  DFS_VOLUME_STATE_OFFLINE = 3_u32
  DFS_VOLUME_STATE_ONLINE = 4_u32
  DFS_VOLUME_STATE_RESYNCHRONIZE = 16_u32
  DFS_VOLUME_STATE_STANDBY = 32_u32
  DFS_VOLUME_STATE_FORCE_SYNC = 64_u32
  DFS_VOLUME_FLAVORS = 768_u32
  DFS_VOLUME_FLAVOR_UNUSED1 = 0_u32
  DFS_VOLUME_FLAVOR_STANDALONE = 256_u32
  DFS_VOLUME_FLAVOR_AD_BLOB = 512_u32
  DFS_STORAGE_FLAVOR_UNUSED2 = 768_u32
  DFS_STORAGE_STATES = 15_u32
  DFS_STORAGE_STATE_OFFLINE = 1_u32
  DFS_STORAGE_STATE_ONLINE = 2_u32
  DFS_STORAGE_STATE_ACTIVE = 4_u32
  DFS_PROPERTY_FLAG_INSITE_REFERRALS = 1_u32
  DFS_PROPERTY_FLAG_ROOT_SCALABILITY = 2_u32
  DFS_PROPERTY_FLAG_SITE_COSTING = 4_u32
  DFS_PROPERTY_FLAG_TARGET_FAILBACK = 8_u32
  DFS_PROPERTY_FLAG_CLUSTER_ENABLED = 16_u32
  DFS_PROPERTY_FLAG_ABDE = 32_u32
  DFS_ADD_VOLUME = 1_u32
  DFS_RESTORE_VOLUME = 2_u32
  NET_DFS_SETDC_FLAGS = 0_u32
  NET_DFS_SETDC_TIMEOUT = 1_u32
  NET_DFS_SETDC_INITPKT = 2_u32
  DFS_SITE_PRIMARY = 1_u32
  DFS_MOVE_FLAG_REPLACE_IF_EXISTS = 1_u32
  DFS_FORCE_REMOVE = 2147483648_u32
  FSCTL_DFS_GET_PKT_ENTRY_STATE = 401340_u32


  enum DFS_TARGET_PRIORITY_CLASS : Int32
    DfsInvalidPriorityClass = -1
    DfsSiteCostNormalPriorityClass = 0
    DfsGlobalHighPriorityClass = 1
    DfsSiteCostHighPriorityClass = 2
    DfsSiteCostLowPriorityClass = 3
    DfsGlobalLowPriorityClass = 4
  end

  enum DFS_NAMESPACE_VERSION_ORIGIN : Int32
    DFS_NAMESPACE_VERSION_ORIGIN_COMBINED = 0
    DFS_NAMESPACE_VERSION_ORIGIN_SERVER = 1
    DFS_NAMESPACE_VERSION_ORIGIN_DOMAIN = 2
  end

  struct DFS_TARGET_PRIORITY
    target_priority_class : DFS_TARGET_PRIORITY_CLASS
    target_priority_rank : UInt16
    reserved : UInt16
  end
  struct DFS_INFO_1
    entry_path : LibC::LPWSTR
  end
  struct DFS_INFO_1_32
    entry_path : UInt32
  end
  struct DFS_INFO_2
    entry_path : LibC::LPWSTR
    comment : LibC::LPWSTR
    state : UInt32
    number_of_storages : UInt32
  end
  struct DFS_INFO_2_32
    entry_path : UInt32
    comment : UInt32
    state : UInt32
    number_of_storages : UInt32
  end
  struct DFS_STORAGE_INFO
    state : UInt32
    server_name : LibC::LPWSTR
    share_name : LibC::LPWSTR
  end
  struct DFS_STORAGE_INFO_0_32
    state : UInt32
    server_name : UInt32
    share_name : UInt32
  end
  struct DFS_STORAGE_INFO_1
    state : UInt32
    server_name : LibC::LPWSTR
    share_name : LibC::LPWSTR
    target_priority : DFS_TARGET_PRIORITY
  end
  struct DFS_INFO_3
    entry_path : LibC::LPWSTR
    comment : LibC::LPWSTR
    state : UInt32
    number_of_storages : UInt32
    storage : DFS_STORAGE_INFO*
  end
  struct DFS_INFO_3_32
    entry_path : UInt32
    comment : UInt32
    state : UInt32
    number_of_storages : UInt32
    storage : UInt32
  end
  struct DFS_INFO_4
    entry_path : LibC::LPWSTR
    comment : LibC::LPWSTR
    state : UInt32
    timeout : UInt32
    guid : Guid
    number_of_storages : UInt32
    storage : DFS_STORAGE_INFO*
  end
  struct DFS_INFO_4_32
    entry_path : UInt32
    comment : UInt32
    state : UInt32
    timeout : UInt32
    guid : Guid
    number_of_storages : UInt32
    storage : UInt32
  end
  struct DFS_INFO_5
    entry_path : LibC::LPWSTR
    comment : LibC::LPWSTR
    state : UInt32
    timeout : UInt32
    guid : Guid
    property_flags : UInt32
    metadata_size : UInt32
    number_of_storages : UInt32
  end
  struct DFS_INFO_6
    entry_path : LibC::LPWSTR
    comment : LibC::LPWSTR
    state : UInt32
    timeout : UInt32
    guid : Guid
    property_flags : UInt32
    metadata_size : UInt32
    number_of_storages : UInt32
    storage : DFS_STORAGE_INFO_1*
  end
  struct DFS_INFO_7
    generation_guid : Guid
  end
  struct DFS_INFO_8
    entry_path : LibC::LPWSTR
    comment : LibC::LPWSTR
    state : UInt32
    timeout : UInt32
    guid : Guid
    property_flags : UInt32
    metadata_size : UInt32
    sd_length_reserved : UInt32
    p_security_descriptor : SECURITY_DESCRIPTOR*
    number_of_storages : UInt32
  end
  struct DFS_INFO_9
    entry_path : LibC::LPWSTR
    comment : LibC::LPWSTR
    state : UInt32
    timeout : UInt32
    guid : Guid
    property_flags : UInt32
    metadata_size : UInt32
    sd_length_reserved : UInt32
    p_security_descriptor : SECURITY_DESCRIPTOR*
    number_of_storages : UInt32
    storage : DFS_STORAGE_INFO_1*
  end
  struct DFS_INFO_50
    namespace_major_version : UInt32
    namespace_minor_version : UInt32
    namespace_capabilities : UInt64
  end
  struct DFS_INFO_100
    comment : LibC::LPWSTR
  end
  struct DFS_INFO_101
    state : UInt32
  end
  struct DFS_INFO_102
    timeout : UInt32
  end
  struct DFS_INFO_103
    property_flag_mask : UInt32
    property_flags : UInt32
  end
  struct DFS_INFO_104
    target_priority : DFS_TARGET_PRIORITY
  end
  struct DFS_INFO_105
    comment : LibC::LPWSTR
    state : UInt32
    timeout : UInt32
    property_flag_mask : UInt32
    property_flags : UInt32
  end
  struct DFS_INFO_106
    state : UInt32
    target_priority : DFS_TARGET_PRIORITY
  end
  struct DFS_INFO_107
    comment : LibC::LPWSTR
    state : UInt32
    timeout : UInt32
    property_flag_mask : UInt32
    property_flags : UInt32
    sd_length_reserved : UInt32
    p_security_descriptor : SECURITY_DESCRIPTOR*
  end
  struct DFS_INFO_150
    sd_length_reserved : UInt32
    p_security_descriptor : SECURITY_DESCRIPTOR*
  end
  struct DFS_INFO_200
    ft_dfs_name : LibC::LPWSTR
  end
  struct DFS_INFO_300
    flags : UInt32
    dfs_name : LibC::LPWSTR
  end
  struct DFS_SITENAME_INFO
    site_flags : UInt32
    site_name : LibC::LPWSTR
  end
  struct DFS_SITELIST_INFO
    c_sites : UInt32
    site : DFS_SITENAME_INFO[0]*
  end
  struct DFS_SUPPORTED_NAMESPACE_VERSION_INFO
    domain_dfs_major_version : UInt32
    domain_dfs_minor_version : UInt32
    domain_dfs_capabilities : UInt64
    standalone_dfs_major_version : UInt32
    standalone_dfs_minor_version : UInt32
    standalone_dfs_capabilities : UInt64
  end
  struct DFS_GET_PKT_ENTRY_STATE_ARG
    dfs_entry_path_len : UInt16
    server_name_len : UInt16
    share_name_len : UInt16
    level : UInt32
    buffer : Char[0]*
  end


  # Params # dfsentrypath : LibC::LPWSTR [In],servername : LibC::LPWSTR [In],sharename : LibC::LPWSTR [In],comment : LibC::LPWSTR [In],flags : UInt32 [In]
  fun NetDfsAdd(dfsentrypath : LibC::LPWSTR, servername : LibC::LPWSTR, sharename : LibC::LPWSTR, comment : LibC::LPWSTR, flags : UInt32) : UInt32

  # Params # servername : LibC::LPWSTR [In],rootshare : LibC::LPWSTR [In],comment : LibC::LPWSTR [In],flags : UInt32 [In]
  fun NetDfsAddStdRoot(servername : LibC::LPWSTR, rootshare : LibC::LPWSTR, comment : LibC::LPWSTR, flags : UInt32) : UInt32

  # Params # servername : LibC::LPWSTR [In],rootshare : LibC::LPWSTR [In],flags : UInt32 [In]
  fun NetDfsRemoveStdRoot(servername : LibC::LPWSTR, rootshare : LibC::LPWSTR, flags : UInt32) : UInt32

  # Params # servername : LibC::LPWSTR [In],rootshare : LibC::LPWSTR [In],ftdfsname : LibC::LPWSTR [In],comment : LibC::LPWSTR [In],flags : UInt32 [In]
  fun NetDfsAddFtRoot(servername : LibC::LPWSTR, rootshare : LibC::LPWSTR, ftdfsname : LibC::LPWSTR, comment : LibC::LPWSTR, flags : UInt32) : UInt32

  # Params # servername : LibC::LPWSTR [In],rootshare : LibC::LPWSTR [In],ftdfsname : LibC::LPWSTR [In],flags : UInt32 [In]
  fun NetDfsRemoveFtRoot(servername : LibC::LPWSTR, rootshare : LibC::LPWSTR, ftdfsname : LibC::LPWSTR, flags : UInt32) : UInt32

  # Params # domainname : LibC::LPWSTR [In],servername : LibC::LPWSTR [In],rootshare : LibC::LPWSTR [In],ftdfsname : LibC::LPWSTR [In],flags : UInt32 [In]
  fun NetDfsRemoveFtRootForced(domainname : LibC::LPWSTR, servername : LibC::LPWSTR, rootshare : LibC::LPWSTR, ftdfsname : LibC::LPWSTR, flags : UInt32) : UInt32

  # Params # dfsentrypath : LibC::LPWSTR [In],servername : LibC::LPWSTR [In],sharename : LibC::LPWSTR [In]
  fun NetDfsRemove(dfsentrypath : LibC::LPWSTR, servername : LibC::LPWSTR, sharename : LibC::LPWSTR) : UInt32

  # Params # dfsname : LibC::LPWSTR [In],level : UInt32 [In],prefmaxlen : UInt32 [In],buffer : UInt8** [In],entriesread : UInt32* [In],resumehandle : UInt32* [In]
  fun NetDfsEnum(dfsname : LibC::LPWSTR, level : UInt32, prefmaxlen : UInt32, buffer : UInt8**, entriesread : UInt32*, resumehandle : UInt32*) : UInt32

  # Params # dfsentrypath : LibC::LPWSTR [In],servername : LibC::LPWSTR [In],sharename : LibC::LPWSTR [In],level : UInt32 [In],buffer : UInt8** [In]
  fun NetDfsGetInfo(dfsentrypath : LibC::LPWSTR, servername : LibC::LPWSTR, sharename : LibC::LPWSTR, level : UInt32, buffer : UInt8**) : UInt32

  # Params # dfsentrypath : LibC::LPWSTR [In],servername : LibC::LPWSTR [In],sharename : LibC::LPWSTR [In],level : UInt32 [In],buffer : UInt8* [In]
  fun NetDfsSetInfo(dfsentrypath : LibC::LPWSTR, servername : LibC::LPWSTR, sharename : LibC::LPWSTR, level : UInt32, buffer : UInt8*) : UInt32

  # Params # dfsentrypath : LibC::LPWSTR [In],servername : LibC::LPWSTR [In],sharename : LibC::LPWSTR [In],level : UInt32 [In],buffer : UInt8** [In]
  fun NetDfsGetClientInfo(dfsentrypath : LibC::LPWSTR, servername : LibC::LPWSTR, sharename : LibC::LPWSTR, level : UInt32, buffer : UInt8**) : UInt32

  # Params # dfsentrypath : LibC::LPWSTR [In],servername : LibC::LPWSTR [In],sharename : LibC::LPWSTR [In],level : UInt32 [In],buffer : UInt8* [In]
  fun NetDfsSetClientInfo(dfsentrypath : LibC::LPWSTR, servername : LibC::LPWSTR, sharename : LibC::LPWSTR, level : UInt32, buffer : UInt8*) : UInt32

  # Params # olddfsentrypath : LibC::LPWSTR [In],newdfsentrypath : LibC::LPWSTR [In],flags : UInt32 [In]
  fun NetDfsMove(olddfsentrypath : LibC::LPWSTR, newdfsentrypath : LibC::LPWSTR, flags : UInt32) : UInt32

  # Params # pdfspath : LibC::LPWSTR [In],ptargetpath : LibC::LPWSTR [In],majorversion : UInt32 [In],pcomment : LibC::LPWSTR [In],flags : UInt32 [In]
  fun NetDfsAddRootTarget(pdfspath : LibC::LPWSTR, ptargetpath : LibC::LPWSTR, majorversion : UInt32, pcomment : LibC::LPWSTR, flags : UInt32) : UInt32

  # Params # pdfspath : LibC::LPWSTR [In],ptargetpath : LibC::LPWSTR [In],flags : UInt32 [In]
  fun NetDfsRemoveRootTarget(pdfspath : LibC::LPWSTR, ptargetpath : LibC::LPWSTR, flags : UInt32) : UInt32

  # Params # dfsentrypath : LibC::LPWSTR [In],securityinformation : UInt32 [In],ppsecuritydescriptor : SECURITY_DESCRIPTOR** [In],lpcbsecuritydescriptor : UInt32* [In]
  fun NetDfsGetSecurity(dfsentrypath : LibC::LPWSTR, securityinformation : UInt32, ppsecuritydescriptor : SECURITY_DESCRIPTOR**, lpcbsecuritydescriptor : UInt32*) : UInt32

  # Params # dfsentrypath : LibC::LPWSTR [In],securityinformation : UInt32 [In],psecuritydescriptor : SECURITY_DESCRIPTOR* [In]
  fun NetDfsSetSecurity(dfsentrypath : LibC::LPWSTR, securityinformation : UInt32, psecuritydescriptor : SECURITY_DESCRIPTOR*) : UInt32

  # Params # machinename : LibC::LPWSTR [In],securityinformation : UInt32 [In],ppsecuritydescriptor : SECURITY_DESCRIPTOR** [In],lpcbsecuritydescriptor : UInt32* [In]
  fun NetDfsGetStdContainerSecurity(machinename : LibC::LPWSTR, securityinformation : UInt32, ppsecuritydescriptor : SECURITY_DESCRIPTOR**, lpcbsecuritydescriptor : UInt32*) : UInt32

  # Params # machinename : LibC::LPWSTR [In],securityinformation : UInt32 [In],psecuritydescriptor : SECURITY_DESCRIPTOR* [In]
  fun NetDfsSetStdContainerSecurity(machinename : LibC::LPWSTR, securityinformation : UInt32, psecuritydescriptor : SECURITY_DESCRIPTOR*) : UInt32

  # Params # domainname : LibC::LPWSTR [In],securityinformation : UInt32 [In],ppsecuritydescriptor : SECURITY_DESCRIPTOR** [In],lpcbsecuritydescriptor : UInt32* [In]
  fun NetDfsGetFtContainerSecurity(domainname : LibC::LPWSTR, securityinformation : UInt32, ppsecuritydescriptor : SECURITY_DESCRIPTOR**, lpcbsecuritydescriptor : UInt32*) : UInt32

  # Params # domainname : LibC::LPWSTR [In],securityinformation : UInt32 [In],psecuritydescriptor : SECURITY_DESCRIPTOR* [In]
  fun NetDfsSetFtContainerSecurity(domainname : LibC::LPWSTR, securityinformation : UInt32, psecuritydescriptor : SECURITY_DESCRIPTOR*) : UInt32

  # Params # origin : DFS_NAMESPACE_VERSION_ORIGIN [In],pname : LibC::LPWSTR [In],ppversioninfo : DFS_SUPPORTED_NAMESPACE_VERSION_INFO** [In]
  fun NetDfsGetSupportedNamespaceVersion(origin : DFS_NAMESPACE_VERSION_ORIGIN, pname : LibC::LPWSTR, ppversioninfo : DFS_SUPPORTED_NAMESPACE_VERSION_INFO**) : UInt32
end
