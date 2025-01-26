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
  struct DFS_TARGET_PRIORITY
    property target_priority_class : Win32cr::Storage::DistributedFileSystem::DFS_TARGET_PRIORITY_CLASS
    property target_priority_rank : UInt16
    property reserved : UInt16
    def initialize(@target_priority_class : Win32cr::Storage::DistributedFileSystem::DFS_TARGET_PRIORITY_CLASS, @target_priority_rank : UInt16, @reserved : UInt16)
    end
  end

  @[Extern]
  struct DFS_INFO_1
    property entry_path : Win32cr::Foundation::PWSTR
    def initialize(@entry_path : Win32cr::Foundation::PWSTR)
    end
  end

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct DFS_INFO_1_32
    property entry_path : UInt32
    def initialize(@entry_path : UInt32)
    end
  end
  {% end %}

  @[Extern]
  struct DFS_INFO_2
    property entry_path : Win32cr::Foundation::PWSTR
    property comment : Win32cr::Foundation::PWSTR
    property state : UInt32
    property number_of_storages : UInt32
    def initialize(@entry_path : Win32cr::Foundation::PWSTR, @comment : Win32cr::Foundation::PWSTR, @state : UInt32, @number_of_storages : UInt32)
    end
  end

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct DFS_INFO_2_32
    property entry_path : UInt32
    property comment : UInt32
    property state : UInt32
    property number_of_storages : UInt32
    def initialize(@entry_path : UInt32, @comment : UInt32, @state : UInt32, @number_of_storages : UInt32)
    end
  end
  {% end %}

  @[Extern]
  struct DFS_STORAGE_INFO
    property state : UInt32
    property server_name : Win32cr::Foundation::PWSTR
    property share_name : Win32cr::Foundation::PWSTR
    def initialize(@state : UInt32, @server_name : Win32cr::Foundation::PWSTR, @share_name : Win32cr::Foundation::PWSTR)
    end
  end

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct DFS_STORAGE_INFO_0_32
    property state : UInt32
    property server_name : UInt32
    property share_name : UInt32
    def initialize(@state : UInt32, @server_name : UInt32, @share_name : UInt32)
    end
  end
  {% end %}

  @[Extern]
  struct DFS_STORAGE_INFO_1
    property state : UInt32
    property server_name : Win32cr::Foundation::PWSTR
    property share_name : Win32cr::Foundation::PWSTR
    property target_priority : Win32cr::Storage::DistributedFileSystem::DFS_TARGET_PRIORITY
    def initialize(@state : UInt32, @server_name : Win32cr::Foundation::PWSTR, @share_name : Win32cr::Foundation::PWSTR, @target_priority : Win32cr::Storage::DistributedFileSystem::DFS_TARGET_PRIORITY)
    end
  end

  @[Extern]
  struct DFS_INFO_3
    property entry_path : Win32cr::Foundation::PWSTR
    property comment : Win32cr::Foundation::PWSTR
    property state : UInt32
    property number_of_storages : UInt32
    property storage : Win32cr::Storage::DistributedFileSystem::DFS_STORAGE_INFO*
    def initialize(@entry_path : Win32cr::Foundation::PWSTR, @comment : Win32cr::Foundation::PWSTR, @state : UInt32, @number_of_storages : UInt32, @storage : Win32cr::Storage::DistributedFileSystem::DFS_STORAGE_INFO*)
    end
  end

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct DFS_INFO_3_32
    property entry_path : UInt32
    property comment : UInt32
    property state : UInt32
    property number_of_storages : UInt32
    property storage : UInt32
    def initialize(@entry_path : UInt32, @comment : UInt32, @state : UInt32, @number_of_storages : UInt32, @storage : UInt32)
    end
  end
  {% end %}

  @[Extern]
  struct DFS_INFO_4
    property entry_path : Win32cr::Foundation::PWSTR
    property comment : Win32cr::Foundation::PWSTR
    property state : UInt32
    property timeout : UInt32
    property guid : LibC::GUID
    property number_of_storages : UInt32
    property storage : Win32cr::Storage::DistributedFileSystem::DFS_STORAGE_INFO*
    def initialize(@entry_path : Win32cr::Foundation::PWSTR, @comment : Win32cr::Foundation::PWSTR, @state : UInt32, @timeout : UInt32, @guid : LibC::GUID, @number_of_storages : UInt32, @storage : Win32cr::Storage::DistributedFileSystem::DFS_STORAGE_INFO*)
    end
  end

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct DFS_INFO_4_32
    property entry_path : UInt32
    property comment : UInt32
    property state : UInt32
    property timeout : UInt32
    property guid : LibC::GUID
    property number_of_storages : UInt32
    property storage : UInt32
    def initialize(@entry_path : UInt32, @comment : UInt32, @state : UInt32, @timeout : UInt32, @guid : LibC::GUID, @number_of_storages : UInt32, @storage : UInt32)
    end
  end
  {% end %}

  @[Extern]
  struct DFS_INFO_5
    property entry_path : Win32cr::Foundation::PWSTR
    property comment : Win32cr::Foundation::PWSTR
    property state : UInt32
    property timeout : UInt32
    property guid : LibC::GUID
    property property_flags : UInt32
    property metadata_size : UInt32
    property number_of_storages : UInt32
    def initialize(@entry_path : Win32cr::Foundation::PWSTR, @comment : Win32cr::Foundation::PWSTR, @state : UInt32, @timeout : UInt32, @guid : LibC::GUID, @property_flags : UInt32, @metadata_size : UInt32, @number_of_storages : UInt32)
    end
  end

  @[Extern]
  struct DFS_INFO_6
    property entry_path : Win32cr::Foundation::PWSTR
    property comment : Win32cr::Foundation::PWSTR
    property state : UInt32
    property timeout : UInt32
    property guid : LibC::GUID
    property property_flags : UInt32
    property metadata_size : UInt32
    property number_of_storages : UInt32
    property storage : Win32cr::Storage::DistributedFileSystem::DFS_STORAGE_INFO_1*
    def initialize(@entry_path : Win32cr::Foundation::PWSTR, @comment : Win32cr::Foundation::PWSTR, @state : UInt32, @timeout : UInt32, @guid : LibC::GUID, @property_flags : UInt32, @metadata_size : UInt32, @number_of_storages : UInt32, @storage : Win32cr::Storage::DistributedFileSystem::DFS_STORAGE_INFO_1*)
    end
  end

  @[Extern]
  struct DFS_INFO_7
    property generation_guid : LibC::GUID
    def initialize(@generation_guid : LibC::GUID)
    end
  end

  @[Extern]
  struct DFS_INFO_8
    property entry_path : Win32cr::Foundation::PWSTR
    property comment : Win32cr::Foundation::PWSTR
    property state : UInt32
    property timeout : UInt32
    property guid : LibC::GUID
    property property_flags : UInt32
    property metadata_size : UInt32
    property sd_length_reserved : UInt32
    property pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR
    property number_of_storages : UInt32
    def initialize(@entry_path : Win32cr::Foundation::PWSTR, @comment : Win32cr::Foundation::PWSTR, @state : UInt32, @timeout : UInt32, @guid : LibC::GUID, @property_flags : UInt32, @metadata_size : UInt32, @sd_length_reserved : UInt32, @pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, @number_of_storages : UInt32)
    end
  end

  @[Extern]
  struct DFS_INFO_9
    property entry_path : Win32cr::Foundation::PWSTR
    property comment : Win32cr::Foundation::PWSTR
    property state : UInt32
    property timeout : UInt32
    property guid : LibC::GUID
    property property_flags : UInt32
    property metadata_size : UInt32
    property sd_length_reserved : UInt32
    property pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR
    property number_of_storages : UInt32
    property storage : Win32cr::Storage::DistributedFileSystem::DFS_STORAGE_INFO_1*
    def initialize(@entry_path : Win32cr::Foundation::PWSTR, @comment : Win32cr::Foundation::PWSTR, @state : UInt32, @timeout : UInt32, @guid : LibC::GUID, @property_flags : UInt32, @metadata_size : UInt32, @sd_length_reserved : UInt32, @pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, @number_of_storages : UInt32, @storage : Win32cr::Storage::DistributedFileSystem::DFS_STORAGE_INFO_1*)
    end
  end

  @[Extern]
  struct DFS_INFO_50
    property namespace_major_version : UInt32
    property namespace_minor_version : UInt32
    property namespace_capabilities : UInt64
    def initialize(@namespace_major_version : UInt32, @namespace_minor_version : UInt32, @namespace_capabilities : UInt64)
    end
  end

  @[Extern]
  struct DFS_INFO_100
    property comment : Win32cr::Foundation::PWSTR
    def initialize(@comment : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct DFS_INFO_101
    property state : UInt32
    def initialize(@state : UInt32)
    end
  end

  @[Extern]
  struct DFS_INFO_102
    property timeout : UInt32
    def initialize(@timeout : UInt32)
    end
  end

  @[Extern]
  struct DFS_INFO_103
    property property_flag_mask : UInt32
    property property_flags : UInt32
    def initialize(@property_flag_mask : UInt32, @property_flags : UInt32)
    end
  end

  @[Extern]
  struct DFS_INFO_104
    property target_priority : Win32cr::Storage::DistributedFileSystem::DFS_TARGET_PRIORITY
    def initialize(@target_priority : Win32cr::Storage::DistributedFileSystem::DFS_TARGET_PRIORITY)
    end
  end

  @[Extern]
  struct DFS_INFO_105
    property comment : Win32cr::Foundation::PWSTR
    property state : UInt32
    property timeout : UInt32
    property property_flag_mask : UInt32
    property property_flags : UInt32
    def initialize(@comment : Win32cr::Foundation::PWSTR, @state : UInt32, @timeout : UInt32, @property_flag_mask : UInt32, @property_flags : UInt32)
    end
  end

  @[Extern]
  struct DFS_INFO_106
    property state : UInt32
    property target_priority : Win32cr::Storage::DistributedFileSystem::DFS_TARGET_PRIORITY
    def initialize(@state : UInt32, @target_priority : Win32cr::Storage::DistributedFileSystem::DFS_TARGET_PRIORITY)
    end
  end

  @[Extern]
  struct DFS_INFO_107
    property comment : Win32cr::Foundation::PWSTR
    property state : UInt32
    property timeout : UInt32
    property property_flag_mask : UInt32
    property property_flags : UInt32
    property sd_length_reserved : UInt32
    property pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR
    def initialize(@comment : Win32cr::Foundation::PWSTR, @state : UInt32, @timeout : UInt32, @property_flag_mask : UInt32, @property_flags : UInt32, @sd_length_reserved : UInt32, @pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR)
    end
  end

  @[Extern]
  struct DFS_INFO_150
    property sd_length_reserved : UInt32
    property pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR
    def initialize(@sd_length_reserved : UInt32, @pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR)
    end
  end

  @[Extern]
  struct DFS_INFO_200
    property ft_dfs_name : Win32cr::Foundation::PWSTR
    def initialize(@ft_dfs_name : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct DFS_INFO_300
    property flags : UInt32
    property dfs_name : Win32cr::Foundation::PWSTR
    def initialize(@flags : UInt32, @dfs_name : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct DFS_SITENAME_INFO
    property site_flags : UInt32
    property site_name : Win32cr::Foundation::PWSTR
    def initialize(@site_flags : UInt32, @site_name : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct DFS_SITELIST_INFO
    property cSites : UInt32
    property site : Win32cr::Storage::DistributedFileSystem::DFS_SITENAME_INFO*
    def initialize(@cSites : UInt32, @site : Win32cr::Storage::DistributedFileSystem::DFS_SITENAME_INFO*)
    end
  end

  @[Extern]
  struct DFS_SUPPORTED_NAMESPACE_VERSION_INFO
    property domain_dfs_major_version : UInt32
    property domain_dfs_minor_version : UInt32
    property domain_dfs_capabilities : UInt64
    property standalone_dfs_major_version : UInt32
    property standalone_dfs_minor_version : UInt32
    property standalone_dfs_capabilities : UInt64
    def initialize(@domain_dfs_major_version : UInt32, @domain_dfs_minor_version : UInt32, @domain_dfs_capabilities : UInt64, @standalone_dfs_major_version : UInt32, @standalone_dfs_minor_version : UInt32, @standalone_dfs_capabilities : UInt64)
    end
  end

  @[Extern]
  struct DFS_GET_PKT_ENTRY_STATE_ARG
    property dfs_entry_path_len : UInt16
    property server_name_len : UInt16
    property share_name_len : UInt16
    property level : UInt32
    property buffer : UInt16*
    def initialize(@dfs_entry_path_len : UInt16, @server_name_len : UInt16, @share_name_len : UInt16, @level : UInt32, @buffer : UInt16*)
    end
  end

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