require "./../foundation.cr"
require "./../security.cr"

module Win32cr::Storage::DistributedFileSystem
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

  enum DFS_TARGET_PRIORITY_CLASS
    DfsInvalidPriorityClass = -1_i32
    DfsSiteCostNormalPriorityClass = 0_i32
    DfsGlobalHighPriorityClass = 1_i32
    DfsSiteCostHighPriorityClass = 2_i32
    DfsSiteCostLowPriorityClass = 3_i32
    DfsGlobalLowPriorityClass = 4_i32
  end
  enum DFS_NAMESPACE_VERSION_ORIGIN
    DFS_NAMESPACE_VERSION_ORIGIN_COMBINED = 0_i32
    DFS_NAMESPACE_VERSION_ORIGIN_SERVER = 1_i32
    DFS_NAMESPACE_VERSION_ORIGIN_DOMAIN = 2_i32
  end

  @[Extern]
  record DFS_TARGET_PRIORITY,
    target_priority_class : Win32cr::Storage::DistributedFileSystem::DFS_TARGET_PRIORITY_CLASS,
    target_priority_rank : UInt16,
    reserved : UInt16

  @[Extern]
  record DFS_INFO_1,
    entry_path : Win32cr::Foundation::PWSTR

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  record DFS_INFO_1_32,
    entry_path : UInt32
  {% end %}

  @[Extern]
  record DFS_INFO_2,
    entry_path : Win32cr::Foundation::PWSTR,
    comment : Win32cr::Foundation::PWSTR,
    state : UInt32,
    number_of_storages : UInt32

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  record DFS_INFO_2_32,
    entry_path : UInt32,
    comment : UInt32,
    state : UInt32,
    number_of_storages : UInt32
  {% end %}

  @[Extern]
  record DFS_STORAGE_INFO,
    state : UInt32,
    server_name : Win32cr::Foundation::PWSTR,
    share_name : Win32cr::Foundation::PWSTR

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  record DFS_STORAGE_INFO_0_32,
    state : UInt32,
    server_name : UInt32,
    share_name : UInt32
  {% end %}

  @[Extern]
  record DFS_STORAGE_INFO_1,
    state : UInt32,
    server_name : Win32cr::Foundation::PWSTR,
    share_name : Win32cr::Foundation::PWSTR,
    target_priority : Win32cr::Storage::DistributedFileSystem::DFS_TARGET_PRIORITY

  @[Extern]
  record DFS_INFO_3,
    entry_path : Win32cr::Foundation::PWSTR,
    comment : Win32cr::Foundation::PWSTR,
    state : UInt32,
    number_of_storages : UInt32,
    storage : Win32cr::Storage::DistributedFileSystem::DFS_STORAGE_INFO*

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  record DFS_INFO_3_32,
    entry_path : UInt32,
    comment : UInt32,
    state : UInt32,
    number_of_storages : UInt32,
    storage : UInt32
  {% end %}

  @[Extern]
  record DFS_INFO_4,
    entry_path : Win32cr::Foundation::PWSTR,
    comment : Win32cr::Foundation::PWSTR,
    state : UInt32,
    timeout : UInt32,
    guid : LibC::GUID,
    number_of_storages : UInt32,
    storage : Win32cr::Storage::DistributedFileSystem::DFS_STORAGE_INFO*

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  record DFS_INFO_4_32,
    entry_path : UInt32,
    comment : UInt32,
    state : UInt32,
    timeout : UInt32,
    guid : LibC::GUID,
    number_of_storages : UInt32,
    storage : UInt32
  {% end %}

  @[Extern]
  record DFS_INFO_5,
    entry_path : Win32cr::Foundation::PWSTR,
    comment : Win32cr::Foundation::PWSTR,
    state : UInt32,
    timeout : UInt32,
    guid : LibC::GUID,
    property_flags : UInt32,
    metadata_size : UInt32,
    number_of_storages : UInt32

  @[Extern]
  record DFS_INFO_6,
    entry_path : Win32cr::Foundation::PWSTR,
    comment : Win32cr::Foundation::PWSTR,
    state : UInt32,
    timeout : UInt32,
    guid : LibC::GUID,
    property_flags : UInt32,
    metadata_size : UInt32,
    number_of_storages : UInt32,
    storage : Win32cr::Storage::DistributedFileSystem::DFS_STORAGE_INFO_1*

  @[Extern]
  record DFS_INFO_7,
    generation_guid : LibC::GUID

  @[Extern]
  record DFS_INFO_8,
    entry_path : Win32cr::Foundation::PWSTR,
    comment : Win32cr::Foundation::PWSTR,
    state : UInt32,
    timeout : UInt32,
    guid : LibC::GUID,
    property_flags : UInt32,
    metadata_size : UInt32,
    sd_length_reserved : UInt32,
    pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR,
    number_of_storages : UInt32

  @[Extern]
  record DFS_INFO_9,
    entry_path : Win32cr::Foundation::PWSTR,
    comment : Win32cr::Foundation::PWSTR,
    state : UInt32,
    timeout : UInt32,
    guid : LibC::GUID,
    property_flags : UInt32,
    metadata_size : UInt32,
    sd_length_reserved : UInt32,
    pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR,
    number_of_storages : UInt32,
    storage : Win32cr::Storage::DistributedFileSystem::DFS_STORAGE_INFO_1*

  @[Extern]
  record DFS_INFO_50,
    namespace_major_version : UInt32,
    namespace_minor_version : UInt32,
    namespace_capabilities : UInt64

  @[Extern]
  record DFS_INFO_100,
    comment : Win32cr::Foundation::PWSTR

  @[Extern]
  record DFS_INFO_101,
    state : UInt32

  @[Extern]
  record DFS_INFO_102,
    timeout : UInt32

  @[Extern]
  record DFS_INFO_103,
    property_flag_mask : UInt32,
    property_flags : UInt32

  @[Extern]
  record DFS_INFO_104,
    target_priority : Win32cr::Storage::DistributedFileSystem::DFS_TARGET_PRIORITY

  @[Extern]
  record DFS_INFO_105,
    comment : Win32cr::Foundation::PWSTR,
    state : UInt32,
    timeout : UInt32,
    property_flag_mask : UInt32,
    property_flags : UInt32

  @[Extern]
  record DFS_INFO_106,
    state : UInt32,
    target_priority : Win32cr::Storage::DistributedFileSystem::DFS_TARGET_PRIORITY

  @[Extern]
  record DFS_INFO_107,
    comment : Win32cr::Foundation::PWSTR,
    state : UInt32,
    timeout : UInt32,
    property_flag_mask : UInt32,
    property_flags : UInt32,
    sd_length_reserved : UInt32,
    pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR

  @[Extern]
  record DFS_INFO_150,
    sd_length_reserved : UInt32,
    pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR

  @[Extern]
  record DFS_INFO_200,
    ft_dfs_name : Win32cr::Foundation::PWSTR

  @[Extern]
  record DFS_INFO_300,
    flags : UInt32,
    dfs_name : Win32cr::Foundation::PWSTR

  @[Extern]
  record DFS_SITENAME_INFO,
    site_flags : UInt32,
    site_name : Win32cr::Foundation::PWSTR

  @[Extern]
  record DFS_SITELIST_INFO,
    cSites : UInt32,
    site : Win32cr::Storage::DistributedFileSystem::DFS_SITENAME_INFO*

  @[Extern]
  record DFS_SUPPORTED_NAMESPACE_VERSION_INFO,
    domain_dfs_major_version : UInt32,
    domain_dfs_minor_version : UInt32,
    domain_dfs_capabilities : UInt64,
    standalone_dfs_major_version : UInt32,
    standalone_dfs_minor_version : UInt32,
    standalone_dfs_capabilities : UInt64

  @[Extern]
  record DFS_GET_PKT_ENTRY_STATE_ARG,
    dfs_entry_path_len : UInt16,
    server_name_len : UInt16,
    share_name_len : UInt16,
    level : UInt32,
    buffer : UInt16*

  @[Link("netapi32")]
  lib C
    fun NetDfsAdd(dfs_entry_path : Win32cr::Foundation::PWSTR, server_name : Win32cr::Foundation::PWSTR, share_name : Win32cr::Foundation::PWSTR, comment : Win32cr::Foundation::PWSTR, flags : UInt32) : UInt32

    fun NetDfsAddStdRoot(server_name : Win32cr::Foundation::PWSTR, root_share : Win32cr::Foundation::PWSTR, comment : Win32cr::Foundation::PWSTR, flags : UInt32) : UInt32

    fun NetDfsRemoveStdRoot(server_name : Win32cr::Foundation::PWSTR, root_share : Win32cr::Foundation::PWSTR, flags : UInt32) : UInt32

    fun NetDfsAddFtRoot(server_name : Win32cr::Foundation::PWSTR, root_share : Win32cr::Foundation::PWSTR, ft_dfs_name : Win32cr::Foundation::PWSTR, comment : Win32cr::Foundation::PWSTR, flags : UInt32) : UInt32

    fun NetDfsRemoveFtRoot(server_name : Win32cr::Foundation::PWSTR, root_share : Win32cr::Foundation::PWSTR, ft_dfs_name : Win32cr::Foundation::PWSTR, flags : UInt32) : UInt32

    fun NetDfsRemoveFtRootForced(domain_name : Win32cr::Foundation::PWSTR, server_name : Win32cr::Foundation::PWSTR, root_share : Win32cr::Foundation::PWSTR, ft_dfs_name : Win32cr::Foundation::PWSTR, flags : UInt32) : UInt32

    fun NetDfsRemove(dfs_entry_path : Win32cr::Foundation::PWSTR, server_name : Win32cr::Foundation::PWSTR, share_name : Win32cr::Foundation::PWSTR) : UInt32

    fun NetDfsEnum(dfs_name : Win32cr::Foundation::PWSTR, level : UInt32, pref_max_len : UInt32, buffer : UInt8**, entries_read : UInt32*, resume_handle : UInt32*) : UInt32

    fun NetDfsGetInfo(dfs_entry_path : Win32cr::Foundation::PWSTR, server_name : Win32cr::Foundation::PWSTR, share_name : Win32cr::Foundation::PWSTR, level : UInt32, buffer : UInt8**) : UInt32

    fun NetDfsSetInfo(dfs_entry_path : Win32cr::Foundation::PWSTR, server_name : Win32cr::Foundation::PWSTR, share_name : Win32cr::Foundation::PWSTR, level : UInt32, buffer : UInt8*) : UInt32

    fun NetDfsGetClientInfo(dfs_entry_path : Win32cr::Foundation::PWSTR, server_name : Win32cr::Foundation::PWSTR, share_name : Win32cr::Foundation::PWSTR, level : UInt32, buffer : UInt8**) : UInt32

    fun NetDfsSetClientInfo(dfs_entry_path : Win32cr::Foundation::PWSTR, server_name : Win32cr::Foundation::PWSTR, share_name : Win32cr::Foundation::PWSTR, level : UInt32, buffer : UInt8*) : UInt32

    fun NetDfsMove(old_dfs_entry_path : Win32cr::Foundation::PWSTR, new_dfs_entry_path : Win32cr::Foundation::PWSTR, flags : UInt32) : UInt32

    fun NetDfsAddRootTarget(pDfsPath : Win32cr::Foundation::PWSTR, pTargetPath : Win32cr::Foundation::PWSTR, major_version : UInt32, pComment : Win32cr::Foundation::PWSTR, flags : UInt32) : UInt32

    fun NetDfsRemoveRootTarget(pDfsPath : Win32cr::Foundation::PWSTR, pTargetPath : Win32cr::Foundation::PWSTR, flags : UInt32) : UInt32

    fun NetDfsGetSecurity(dfs_entry_path : Win32cr::Foundation::PWSTR, security_information : UInt32, ppSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR*, lpcbSecurityDescriptor : UInt32*) : UInt32

    fun NetDfsSetSecurity(dfs_entry_path : Win32cr::Foundation::PWSTR, security_information : UInt32, pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR) : UInt32

    fun NetDfsGetStdContainerSecurity(machine_name : Win32cr::Foundation::PWSTR, security_information : UInt32, ppSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR*, lpcbSecurityDescriptor : UInt32*) : UInt32

    fun NetDfsSetStdContainerSecurity(machine_name : Win32cr::Foundation::PWSTR, security_information : UInt32, pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR) : UInt32

    fun NetDfsGetFtContainerSecurity(domain_name : Win32cr::Foundation::PWSTR, security_information : UInt32, ppSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR*, lpcbSecurityDescriptor : UInt32*) : UInt32

    fun NetDfsSetFtContainerSecurity(domain_name : Win32cr::Foundation::PWSTR, security_information : UInt32, pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR) : UInt32

    fun NetDfsGetSupportedNamespaceVersion(origin : Win32cr::Storage::DistributedFileSystem::DFS_NAMESPACE_VERSION_ORIGIN, pName : Win32cr::Foundation::PWSTR, ppVersionInfo : Win32cr::Storage::DistributedFileSystem::DFS_SUPPORTED_NAMESPACE_VERSION_INFO**) : UInt32

  end
end