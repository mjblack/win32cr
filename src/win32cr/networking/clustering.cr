require "./../foundation.cr"
require "./../system/registry.cr"
require "./../system/system_services.cr"
require "./../security.cr"
require "./../system/com.cr"
require "./../graphics/gdi.cr"
require "./../ui/windows_and_messaging.cr"

module Win32cr::Networking::Clustering
  alias PCLUSAPI_GET_NODE_CLUSTER_STATE = Proc(Win32cr::Foundation::PWSTR, UInt32*, UInt32)*

  alias PCLUSAPI_OPEN_CLUSTER = Proc(Win32cr::Foundation::PWSTR, Win32cr::Networking::Clustering::HCLUSTER*)*

  alias PCLUSAPI_OPEN_CLUSTER_EX = Proc(Win32cr::Foundation::PWSTR, UInt32, UInt32*, Win32cr::Networking::Clustering::HCLUSTER*)*

  alias PCLUSAPI_CLOSE_CLUSTER = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Foundation::BOOL)*

  alias PCLUSAPI_SetClusterName = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Foundation::PWSTR, UInt32)*

  alias PCLUSAPI_GET_CLUSTER_INFORMATION = Proc(Win32cr::Networking::Clustering::HCLUSTER*, UInt16*, UInt32*, Win32cr::Networking::Clustering::CLUSTERVERSIONINFO*, UInt32)*

  alias PCLUSAPI_GET_CLUSTER_QUORUM_RESOURCE = Proc(Win32cr::Networking::Clustering::HCLUSTER*, UInt16*, UInt32*, UInt16*, UInt32*, UInt32*, UInt32)*

  alias PCLUSAPI_SET_CLUSTER_QUORUM_RESOURCE = Proc(Win32cr::Networking::Clustering::HRESOURCE*, Win32cr::Foundation::PWSTR, UInt32, UInt32)*

  alias PCLUSAPI_BACKUP_CLUSTER_DATABASE = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Foundation::PWSTR, UInt32)*

  alias PCLUSAPI_RESTORE_CLUSTER_DATABASE = Proc(Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::PWSTR, UInt32)*

  alias PCLUSAPI_SET_CLUSTER_NETWORK_PRIORITY_ORDER = Proc(Win32cr::Networking::Clustering::HCLUSTER*, UInt32, Win32cr::Networking::Clustering::HNETWORK**, UInt32)*

  alias PCLUSAPI_SET_CLUSTER_SERVICE_ACCOUNT_PASSWORD = Proc(Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Networking::Clustering::CLUSTER_SET_PASSWORD_STATUS*, UInt32*, UInt32)*

  alias PCLUSAPI_CLUSTER_CONTROL = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Networking::Clustering::HNODE*, UInt32, Void*, UInt32, Void*, UInt32, UInt32*, UInt32)*

  alias PCLUSTER_UPGRADE_PROGRESS_CALLBACK = Proc(Void*, Win32cr::Networking::Clustering::CLUSTER_UPGRADE_PHASE, Win32cr::Foundation::BOOL)*

  alias PCLUSAPI_CLUSTER_UPGRADE = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Foundation::BOOL, Win32cr::Networking::Clustering::PCLUSTER_UPGRADE_PROGRESS_CALLBACK, Void*, UInt32)*

  alias PCLUSAPI_CREATE_CLUSTER_NOTIFY_PORT_V2 = Proc(Win32cr::Networking::Clustering::HCHANGE*, Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Networking::Clustering::NOTIFY_FILTER_AND_TYPE*, UInt32, LibC::UIntPtrT, Win32cr::Networking::Clustering::HCHANGE*)*

  alias PCLUSAPI_REGISTER_CLUSTER_NOTIFY_V2 = Proc(Win32cr::Networking::Clustering::HCHANGE*, Win32cr::Networking::Clustering::NOTIFY_FILTER_AND_TYPE, Win32cr::Foundation::HANDLE, LibC::UIntPtrT, UInt32)*

  alias PCLUSAPI_GET_NOTIFY_EVENT_HANDLE_V2 = Proc(Win32cr::Networking::Clustering::HCHANGE*, Win32cr::Foundation::HANDLE*, UInt32)*

  alias PCLUSAPI_GET_CLUSTER_NOTIFY_V2 = Proc(Win32cr::Networking::Clustering::HCHANGE*, LibC::UIntPtrT*, Win32cr::Networking::Clustering::NOTIFY_FILTER_AND_TYPE*, UInt8*, UInt32*, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::PWSTR, UInt32*, UInt32, UInt32)*

  alias PCLUSAPI_CREATE_CLUSTER_NOTIFY_PORT = Proc(Win32cr::Networking::Clustering::HCHANGE*, Win32cr::Networking::Clustering::HCLUSTER*, UInt32, LibC::UIntPtrT, Win32cr::Networking::Clustering::HCHANGE*)*

  alias PCLUSAPI_REGISTER_CLUSTER_NOTIFY = Proc(Win32cr::Networking::Clustering::HCHANGE*, UInt32, Win32cr::Foundation::HANDLE, LibC::UIntPtrT, UInt32)*

  alias PCLUSAPI_GET_CLUSTER_NOTIFY = Proc(Win32cr::Networking::Clustering::HCHANGE*, LibC::UIntPtrT*, UInt32*, UInt16*, UInt32*, UInt32, UInt32)*

  alias PCLUSAPI_CLOSE_CLUSTER_NOTIFY_PORT = Proc(Win32cr::Networking::Clustering::HCHANGE*, Win32cr::Foundation::BOOL)*

  alias PCLUSAPI_CLUSTER_OPEN_ENUM = Proc(Win32cr::Networking::Clustering::HCLUSTER*, UInt32, Win32cr::Networking::Clustering::HCLUSENUM*)*

  alias PCLUSAPI_CLUSTER_GET_ENUM_COUNT = Proc(Win32cr::Networking::Clustering::HCLUSENUM*, UInt32)*

  alias PCLUSAPI_CLUSTER_ENUM = Proc(Win32cr::Networking::Clustering::HCLUSENUM*, UInt32, UInt32*, UInt16*, UInt32*, UInt32)*

  alias PCLUSAPI_CLUSTER_CLOSE_ENUM = Proc(Win32cr::Networking::Clustering::HCLUSENUM*, UInt32)*

  alias PCLUSAPI_CLUSTER_OPEN_ENUM_EX = Proc(Win32cr::Networking::Clustering::HCLUSTER*, UInt32, Void*, Win32cr::Networking::Clustering::HCLUSENUMEX*)*

  alias PCLUSAPI_CLUSTER_GET_ENUM_COUNT_EX = Proc(Win32cr::Networking::Clustering::HCLUSENUMEX*, UInt32)*

  alias PCLUSAPI_CLUSTER_ENUM_EX = Proc(Win32cr::Networking::Clustering::HCLUSENUMEX*, UInt32, Win32cr::Networking::Clustering::CLUSTER_ENUM_ITEM*, UInt32*, UInt32)*

  alias PCLUSAPI_CLUSTER_CLOSE_ENUM_EX = Proc(Win32cr::Networking::Clustering::HCLUSENUMEX*, UInt32)*

  alias PCLUSAPI_CREATE_CLUSTER_GROUP_GROUPSET = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Foundation::PWSTR, Win32cr::Networking::Clustering::HGROUPSET*)*

  alias PCLUSAPI_OPEN_CLUSTER_GROUP_GROUPSET = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Foundation::PWSTR, Win32cr::Networking::Clustering::HGROUPSET*)*

  alias PCLUSAPI_CLOSE_CLUSTER_GROUP_GROUPSET = Proc(Win32cr::Networking::Clustering::HGROUPSET*, Win32cr::Foundation::BOOL)*

  alias PCLUSAPI_DELETE_CLUSTER_GROUP_GROUPSET = Proc(Win32cr::Networking::Clustering::HGROUPSET*, UInt32)*

  alias PCLUSAPI_CLUSTER_ADD_GROUP_TO_GROUP_GROUPSET = Proc(Win32cr::Networking::Clustering::HGROUPSET*, Win32cr::Networking::Clustering::HGROUP*, UInt32)*

  alias PCLUSAPI_CLUSTER_REMOVE_GROUP_FROM_GROUP_GROUPSET = Proc(Win32cr::Networking::Clustering::HGROUPSET*, Win32cr::Networking::Clustering::HGROUP*, UInt32)*

  alias PCLUSAPI_CLUSTER_GROUP_GROUPSET_CONTROL = Proc(Win32cr::Networking::Clustering::HGROUPSET*, Win32cr::Networking::Clustering::HNODE*, UInt32, Void*, UInt32, Void*, UInt32, UInt32*, UInt32)*

  alias PCLUSAPI_ADD_CLUSTER_GROUP_DEPENDENCY = Proc(Win32cr::Networking::Clustering::HGROUP*, Win32cr::Networking::Clustering::HGROUP*, UInt32)*

  alias PCLUSAPI_SET_GROUP_DEPENDENCY_EXPRESSION = Proc(Win32cr::Networking::Clustering::HGROUP*, Win32cr::Foundation::PWSTR, UInt32)*

  alias PCLUSAPI_REMOVE_CLUSTER_GROUP_DEPENDENCY = Proc(Win32cr::Networking::Clustering::HGROUP*, Win32cr::Networking::Clustering::HGROUP*, UInt32)*

  alias PCLUSAPI_ADD_CLUSTER_GROUP_GROUPSET_DEPENDENCY = Proc(Win32cr::Networking::Clustering::HGROUPSET*, Win32cr::Networking::Clustering::HGROUPSET*, UInt32)*

  alias PCLUSAPI_SET_CLUSTER_GROUP_GROUPSET_DEPENDENCY_EXPRESSION = Proc(Win32cr::Networking::Clustering::HGROUPSET*, Win32cr::Foundation::PWSTR, UInt32)*

  alias PCLUSAPI_REMOVE_CLUSTER_GROUP_GROUPSET_DEPENDENCY = Proc(Win32cr::Networking::Clustering::HGROUPSET*, Win32cr::Networking::Clustering::HGROUPSET*, UInt32)*

  alias PCLUSAPI_ADD_CLUSTER_GROUP_TO_GROUP_GROUPSET_DEPENDENCY = Proc(Win32cr::Networking::Clustering::HGROUP*, Win32cr::Networking::Clustering::HGROUPSET*, UInt32)*

  alias PCLUSAPI_REMOVE_CLUSTER_GROUP_TO_GROUP_GROUPSET_DEPENDENCY = Proc(Win32cr::Networking::Clustering::HGROUP*, Win32cr::Networking::Clustering::HGROUPSET*, UInt32)*

  alias PCLUSAPI_GET_CLUSTER_FROM_GROUP_GROUPSET = Proc(Win32cr::Networking::Clustering::HGROUPSET*, Win32cr::Networking::Clustering::HCLUSTER*)*

  alias PCLUSAPI_ADD_CROSS_CLUSTER_GROUPSET_DEPENDENCY = Proc(Win32cr::Networking::Clustering::HGROUPSET*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32)*

  alias PCLUSAPI_REMOVE_CROSS_CLUSTER_GROUPSET_DEPENDENCY = Proc(Win32cr::Networking::Clustering::HGROUPSET*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32)*

  alias PCLUSAPI_CREATE_CLUSTER_AVAILABILITY_SET = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Foundation::PWSTR, Win32cr::Networking::Clustering::CLUSTER_AVAILABILITY_SET_CONFIG*, Win32cr::Networking::Clustering::HGROUPSET*)*

  alias PCLUSAPI_CLUSTER_CREATE_AFFINITY_RULE = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Foundation::PWSTR, Win32cr::Networking::Clustering::CLUS_AFFINITY_RULE_TYPE, UInt32)*

  alias PCLUSAPI_CLUSTER_REMOVE_AFFINITY_RULE = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Foundation::PWSTR, UInt32)*

  alias PCLUSAPI_CLUSTER_ADD_GROUP_TO_AFFINITY_RULE = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Foundation::PWSTR, Win32cr::Networking::Clustering::HGROUP*, UInt32)*

  alias PCLUSAPI_CLUSTER_REMOVE_GROUP_FROM_AFFINITY_RULE = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Foundation::PWSTR, Win32cr::Networking::Clustering::HGROUP*, UInt32)*

  alias PCLUSAPI_CLUSTER_AFFINITY_RULE_CONTROL = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Foundation::PWSTR, Win32cr::Networking::Clustering::HNODE*, UInt32, Void*, UInt32, Void*, UInt32, UInt32*, UInt32)*

  alias PCLUSAPI_OPEN_CLUSTER_NODE = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Foundation::PWSTR, Win32cr::Networking::Clustering::HNODE*)*

  alias PCLUSAPI_OPEN_CLUSTER_NODE_EX = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, Win32cr::Networking::Clustering::HNODE*)*

  alias PCLUSAPI_OPEN_NODE_BY_ID = Proc(Win32cr::Networking::Clustering::HCLUSTER*, UInt32, Win32cr::Networking::Clustering::HNODE*)*

  alias PCLUSAPI_CLOSE_CLUSTER_NODE = Proc(Win32cr::Networking::Clustering::HNODE*, Win32cr::Foundation::BOOL)*

  alias PCLUSAPI_GET_CLUSTER_NODE_STATE = Proc(Win32cr::Networking::Clustering::HNODE*, Win32cr::Networking::Clustering::CLUSTER_NODE_STATE)*

  alias PCLUSAPI_GET_CLUSTER_NODE_ID = Proc(Win32cr::Networking::Clustering::HNODE*, UInt16*, UInt32*, UInt32)*

  alias PCLUSAPI_GET_CLUSTER_FROM_NODE = Proc(Win32cr::Networking::Clustering::HNODE*, Win32cr::Networking::Clustering::HCLUSTER*)*

  alias PCLUSAPI_PAUSE_CLUSTER_NODE = Proc(Win32cr::Networking::Clustering::HNODE*, UInt32)*

  alias PCLUSAPI_RESUME_CLUSTER_NODE = Proc(Win32cr::Networking::Clustering::HNODE*, UInt32)*

  alias PCLUSAPI_EVICT_CLUSTER_NODE = Proc(Win32cr::Networking::Clustering::HNODE*, UInt32)*

  alias PCLUSAPI_CLUSTER_NODE_OPEN_ENUM = Proc(Win32cr::Networking::Clustering::HNODE*, UInt32, Win32cr::Networking::Clustering::HNODEENUM*)*

  alias PCLUSAPI_CLUSTER_NODE_OPEN_ENUM_EX = Proc(Win32cr::Networking::Clustering::HNODE*, UInt32, Void*, Win32cr::Networking::Clustering::HNODEENUMEX*)*

  alias PCLUSAPI_CLUSTER_NODE_GET_ENUM_COUNT_EX = Proc(Win32cr::Networking::Clustering::HNODEENUMEX*, UInt32)*

  alias PCLUSAPI_CLUSTER_NODE_ENUM_EX = Proc(Win32cr::Networking::Clustering::HNODEENUMEX*, UInt32, Win32cr::Networking::Clustering::CLUSTER_ENUM_ITEM*, UInt32*, UInt32)*

  alias PCLUSAPI_CLUSTER_NODE_CLOSE_ENUM_EX = Proc(Win32cr::Networking::Clustering::HNODEENUMEX*, UInt32)*

  alias PCLUSAPI_CLUSTER_NODE_GET_ENUM_COUNT = Proc(Win32cr::Networking::Clustering::HNODEENUM*, UInt32)*

  alias PCLUSAPI_CLUSTER_NODE_CLOSE_ENUM = Proc(Win32cr::Networking::Clustering::HNODEENUM*, UInt32)*

  alias PCLUSAPI_CLUSTER_NODE_ENUM = Proc(Win32cr::Networking::Clustering::HNODEENUM*, UInt32, UInt32*, UInt16*, UInt32*, UInt32)*

  alias PCLUSAPI_EVICT_CLUSTER_NODE_EX = Proc(Win32cr::Networking::Clustering::HNODE*, UInt32, Win32cr::Foundation::HRESULT*, UInt32)*

  alias PCLUSAPI_GET_CLUSTER_RESOURCE_TYPE_KEY = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::System::Registry::HKEY)*

  alias PCLUSAPI_CREATE_CLUSTER_GROUP = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Foundation::PWSTR, Win32cr::Networking::Clustering::HGROUP*)*

  alias PCLUSAPI_OPEN_CLUSTER_GROUP = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Foundation::PWSTR, Win32cr::Networking::Clustering::HGROUP*)*

  alias PCLUSAPI_OPEN_CLUSTER_GROUP_EX = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, Win32cr::Networking::Clustering::HGROUP*)*

  alias PCLUSAPI_PAUSE_CLUSTER_NODE_EX = Proc(Win32cr::Networking::Clustering::HNODE*, Win32cr::Foundation::BOOL, UInt32, Win32cr::Networking::Clustering::HNODE*, UInt32)*

  alias PCLUSAPI_RESUME_CLUSTER_NODE_EX = Proc(Win32cr::Networking::Clustering::HNODE*, Win32cr::Networking::Clustering::CLUSTER_NODE_RESUME_FAILBACK_TYPE, UInt32, UInt32)*

  alias PCLUSAPI_CREATE_CLUSTER_GROUPEX = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Foundation::PWSTR, Win32cr::Networking::Clustering::CLUSTER_CREATE_GROUP_INFO*, Win32cr::Networking::Clustering::HGROUP*)*

  alias PCLUSAPI_CLUSTER_GROUP_OPEN_ENUM_EX = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR, UInt32, UInt32, Win32cr::Networking::Clustering::HGROUPENUMEX*)*

  alias PCLUSAPI_CLUSTER_GROUP_GET_ENUM_COUNT_EX = Proc(Win32cr::Networking::Clustering::HGROUPENUMEX*, UInt32)*

  alias PCLUSAPI_CLUSTER_GROUP_ENUM_EX = Proc(Win32cr::Networking::Clustering::HGROUPENUMEX*, UInt32, Win32cr::Networking::Clustering::CLUSTER_GROUP_ENUM_ITEM*, UInt32*, UInt32)*

  alias PCLUSAPI_CLUSTER_GROUP_CLOSE_ENUM_EX = Proc(Win32cr::Networking::Clustering::HGROUPENUMEX*, UInt32)*

  alias PCLUSAPI_CLUSTER_RESOURCE_OPEN_ENUM_EX = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR, UInt32, UInt32, Win32cr::Networking::Clustering::HRESENUMEX*)*

  alias PCLUSAPI_CLUSTER_RESOURCE_GET_ENUM_COUNT_EX = Proc(Win32cr::Networking::Clustering::HRESENUMEX*, UInt32)*

  alias PCLUSAPI_CLUSTER_RESOURCE_ENUM_EX = Proc(Win32cr::Networking::Clustering::HRESENUMEX*, UInt32, Win32cr::Networking::Clustering::CLUSTER_RESOURCE_ENUM_ITEM*, UInt32*, UInt32)*

  alias PCLUSAPI_CLUSTER_RESOURCE_CLOSE_ENUM_EX = Proc(Win32cr::Networking::Clustering::HRESENUMEX*, UInt32)*

  alias PCLUSAPI_RESTART_CLUSTER_RESOURCE = Proc(Win32cr::Networking::Clustering::HRESOURCE*, UInt32, UInt32)*

  alias PCLUSAPI_CLOSE_CLUSTER_GROUP = Proc(Win32cr::Networking::Clustering::HGROUP*, Win32cr::Foundation::BOOL)*

  alias PCLUSAPI_GET_CLUSTER_FROM_GROUP = Proc(Win32cr::Networking::Clustering::HGROUP*, Win32cr::Networking::Clustering::HCLUSTER*)*

  alias PCLUSAPI_GET_CLUSTER_GROUP_STATE = Proc(Win32cr::Networking::Clustering::HGROUP*, UInt16*, UInt32*, Win32cr::Networking::Clustering::CLUSTER_GROUP_STATE)*

  alias PCLUSAPI_SET_CLUSTER_GROUP_NAME = Proc(Win32cr::Networking::Clustering::HGROUP*, Win32cr::Foundation::PWSTR, UInt32)*

  alias PCLUSAPI_SET_CLUSTER_GROUP_NODE_LIST = Proc(Win32cr::Networking::Clustering::HGROUP*, UInt32, Win32cr::Networking::Clustering::HNODE**, UInt32)*

  alias PCLUSAPI_ONLINE_CLUSTER_GROUP = Proc(Win32cr::Networking::Clustering::HGROUP*, Win32cr::Networking::Clustering::HNODE*, UInt32)*

  alias PCLUSAPI_MOVE_CLUSTER_GROUP = Proc(Win32cr::Networking::Clustering::HGROUP*, Win32cr::Networking::Clustering::HNODE*, UInt32)*

  alias PCLUSAPI_OFFLINE_CLUSTER_GROUP = Proc(Win32cr::Networking::Clustering::HGROUP*, UInt32)*

  alias PCLUSAPI_DELETE_CLUSTER_GROUP = Proc(Win32cr::Networking::Clustering::HGROUP*, UInt32)*

  alias PCLUSAPI_DESTROY_CLUSTER_GROUP = Proc(Win32cr::Networking::Clustering::HGROUP*, UInt32)*

  alias PCLUSAPI_CLUSTER_GROUP_OPEN_ENUM = Proc(Win32cr::Networking::Clustering::HGROUP*, UInt32, Win32cr::Networking::Clustering::HGROUPENUM*)*

  alias PCLUSAPI_CLUSTER_GROUP_GET_ENUM_COUNT = Proc(Win32cr::Networking::Clustering::HGROUPENUM*, UInt32)*

  alias PCLUSAPI_CLUSTER_GROUP_ENUM = Proc(Win32cr::Networking::Clustering::HGROUPENUM*, UInt32, UInt32*, UInt16*, UInt32*, UInt32)*

  alias PCLUSAPI_CLUSTER_GROUP_CLOSE_ENUM = Proc(Win32cr::Networking::Clustering::HGROUPENUM*, UInt32)*

  alias PCLUSAPI_CREATE_CLUSTER_RESOURCE = Proc(Win32cr::Networking::Clustering::HGROUP*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Networking::Clustering::HRESOURCE*)*

  alias PCLUSAPI_OPEN_CLUSTER_RESOURCE = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Foundation::PWSTR, Win32cr::Networking::Clustering::HRESOURCE*)*

  alias PCLUSAPI_OPEN_CLUSTER_RESOURCE_EX = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, Win32cr::Networking::Clustering::HRESOURCE*)*

  alias PCLUSAPI_CLOSE_CLUSTER_RESOURCE = Proc(Win32cr::Networking::Clustering::HRESOURCE*, Win32cr::Foundation::BOOL)*

  alias PCLUSAPI_GET_CLUSTER_FROM_RESOURCE = Proc(Win32cr::Networking::Clustering::HRESOURCE*, Win32cr::Networking::Clustering::HCLUSTER*)*

  alias PCLUSAPI_DELETE_CLUSTER_RESOURCE = Proc(Win32cr::Networking::Clustering::HRESOURCE*, UInt32)*

  alias PCLUSAPI_GET_CLUSTER_RESOURCE_STATE = Proc(Win32cr::Networking::Clustering::HRESOURCE*, UInt16*, UInt32*, UInt16*, UInt32*, Win32cr::Networking::Clustering::CLUSTER_RESOURCE_STATE)*

  alias PCLUSAPI_SET_CLUSTER_RESOURCE_NAME = Proc(Win32cr::Networking::Clustering::HRESOURCE*, Win32cr::Foundation::PWSTR, UInt32)*

  alias PCLUSAPI_FAIL_CLUSTER_RESOURCE = Proc(Win32cr::Networking::Clustering::HRESOURCE*, UInt32)*

  alias PCLUSAPI_ONLINE_CLUSTER_RESOURCE = Proc(Win32cr::Networking::Clustering::HRESOURCE*, UInt32)*

  alias PCLUSAPI_OFFLINE_CLUSTER_RESOURCE = Proc(Win32cr::Networking::Clustering::HRESOURCE*, UInt32)*

  alias PCLUSAPI_CHANGE_CLUSTER_RESOURCE_GROUP = Proc(Win32cr::Networking::Clustering::HRESOURCE*, Win32cr::Networking::Clustering::HGROUP*, UInt32)*

  alias PCLUSAPI_CHANGE_CLUSTER_RESOURCE_GROUP_EX = Proc(Win32cr::Networking::Clustering::HRESOURCE*, Win32cr::Networking::Clustering::HGROUP*, UInt64, UInt32)*

  alias PCLUSAPI_ADD_CLUSTER_RESOURCE_NODE = Proc(Win32cr::Networking::Clustering::HRESOURCE*, Win32cr::Networking::Clustering::HNODE*, UInt32)*

  alias PCLUSAPI_REMOVE_CLUSTER_RESOURCE_NODE = Proc(Win32cr::Networking::Clustering::HRESOURCE*, Win32cr::Networking::Clustering::HNODE*, UInt32)*

  alias PCLUSAPI_ADD_CLUSTER_RESOURCE_DEPENDENCY = Proc(Win32cr::Networking::Clustering::HRESOURCE*, Win32cr::Networking::Clustering::HRESOURCE*, UInt32)*

  alias PCLUSAPI_REMOVE_CLUSTER_RESOURCE_DEPENDENCY = Proc(Win32cr::Networking::Clustering::HRESOURCE*, Win32cr::Networking::Clustering::HRESOURCE*, UInt32)*

  alias PCLUSAPI_SET_CLUSTER_RESOURCE_DEPENDENCY_EXPRESSION = Proc(Win32cr::Networking::Clustering::HRESOURCE*, Win32cr::Foundation::PWSTR, UInt32)*

  alias PCLUSAPI_GET_CLUSTER_RESOURCE_DEPENDENCY_EXPRESSION = Proc(Win32cr::Networking::Clustering::HRESOURCE*, UInt16*, UInt32*, UInt32)*

  alias PCLUSAPI_ADD_RESOURCE_TO_CLUSTER_SHARED_VOLUMES = Proc(Win32cr::Networking::Clustering::HRESOURCE*, UInt32)*

  alias PCLUSAPI_REMOVE_RESOURCE_FROM_CLUSTER_SHARED_VOLUMES = Proc(Win32cr::Networking::Clustering::HRESOURCE*, UInt32)*

  alias PCLUSAPI_IS_FILE_ON_CLUSTER_SHARED_VOLUME = Proc(Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL*, UInt32)*

  alias PCLUSAPI_SHARED_VOLUME_SET_SNAPSHOT_STATE = Proc(LibC::GUID, Win32cr::Foundation::PWSTR, Win32cr::Networking::Clustering::CLUSTER_SHARED_VOLUME_SNAPSHOT_STATE, UInt32)*

  alias PCLUSAPI_CAN_RESOURCE_BE_DEPENDENT = Proc(Win32cr::Networking::Clustering::HRESOURCE*, Win32cr::Networking::Clustering::HRESOURCE*, Win32cr::Foundation::BOOL)*

  alias PCLUSAPI_CLUSTER_RESOURCE_CONTROL = Proc(Win32cr::Networking::Clustering::HRESOURCE*, Win32cr::Networking::Clustering::HNODE*, UInt32, Void*, UInt32, Void*, UInt32, UInt32*, UInt32)*

  alias PCLUSAPI_CLUSTER_RESOURCE_TYPE_CONTROL = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Foundation::PWSTR, Win32cr::Networking::Clustering::HNODE*, UInt32, Void*, UInt32, Void*, UInt32, UInt32*, UInt32)*

  alias PCLUSAPI_CLUSTER_GROUP_CONTROL = Proc(Win32cr::Networking::Clustering::HGROUP*, Win32cr::Networking::Clustering::HNODE*, UInt32, Void*, UInt32, Void*, UInt32, UInt32*, UInt32)*

  alias PCLUSAPI_CLUSTER_NODE_CONTROL = Proc(Win32cr::Networking::Clustering::HNODE*, Win32cr::Networking::Clustering::HNODE*, UInt32, Void*, UInt32, Void*, UInt32, UInt32*, UInt32)*

  alias PCLUSAPI_GET_CLUSTER_RESOURCE_NETWORK_NAME = Proc(Win32cr::Networking::Clustering::HRESOURCE*, UInt16*, UInt32*, Win32cr::Foundation::BOOL)*

  alias PCLUSAPI_CLUSTER_RESOURCE_OPEN_ENUM = Proc(Win32cr::Networking::Clustering::HRESOURCE*, UInt32, Win32cr::Networking::Clustering::HRESENUM*)*

  alias PCLUSAPI_CLUSTER_RESOURCE_GET_ENUM_COUNT = Proc(Win32cr::Networking::Clustering::HRESENUM*, UInt32)*

  alias PCLUSAPI_CLUSTER_RESOURCE_ENUM = Proc(Win32cr::Networking::Clustering::HRESENUM*, UInt32, UInt32*, UInt16*, UInt32*, UInt32)*

  alias PCLUSAPI_CLUSTER_RESOURCE_CLOSE_ENUM = Proc(Win32cr::Networking::Clustering::HRESENUM*, UInt32)*

  alias PCLUSAPI_CREATE_CLUSTER_RESOURCE_TYPE = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, UInt32, UInt32)*

  alias PCLUSAPI_DELETE_CLUSTER_RESOURCE_TYPE = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Foundation::PWSTR, UInt32)*

  alias PCLUSAPI_CLUSTER_RESOURCE_TYPE_OPEN_ENUM = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Networking::Clustering::HRESTYPEENUM*)*

  alias PCLUSAPI_CLUSTER_RESOURCE_TYPE_GET_ENUM_COUNT = Proc(Win32cr::Networking::Clustering::HRESTYPEENUM*, UInt32)*

  alias PCLUSAPI_CLUSTER_RESOURCE_TYPE_ENUM = Proc(Win32cr::Networking::Clustering::HRESTYPEENUM*, UInt32, UInt32*, UInt16*, UInt32*, UInt32)*

  alias PCLUSAPI_CLUSTER_RESOURCE_TYPE_CLOSE_ENUM = Proc(Win32cr::Networking::Clustering::HRESTYPEENUM*, UInt32)*

  alias PCLUSAPI_OPEN_CLUSTER_NETWORK = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Foundation::PWSTR, Win32cr::Networking::Clustering::HNETWORK*)*

  alias PCLUSAPI_OPEN_CLUSTER_NETWORK_EX = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, Win32cr::Networking::Clustering::HNETWORK*)*

  alias PCLUSAPI_CLOSE_CLUSTER_NETWORK = Proc(Win32cr::Networking::Clustering::HNETWORK*, Win32cr::Foundation::BOOL)*

  alias PCLUSAPI_GET_CLUSTER_FROM_NETWORK = Proc(Win32cr::Networking::Clustering::HNETWORK*, Win32cr::Networking::Clustering::HCLUSTER*)*

  alias PCLUSAPI_CLUSTER_NETWORK_OPEN_ENUM = Proc(Win32cr::Networking::Clustering::HNETWORK*, UInt32, Win32cr::Networking::Clustering::HNETWORKENUM*)*

  alias PCLUSAPI_CLUSTER_NETWORK_GET_ENUM_COUNT = Proc(Win32cr::Networking::Clustering::HNETWORKENUM*, UInt32)*

  alias PCLUSAPI_CLUSTER_NETWORK_ENUM = Proc(Win32cr::Networking::Clustering::HNETWORKENUM*, UInt32, UInt32*, UInt16*, UInt32*, UInt32)*

  alias PCLUSAPI_CLUSTER_NETWORK_CLOSE_ENUM = Proc(Win32cr::Networking::Clustering::HNETWORKENUM*, UInt32)*

  alias PCLUSAPI_GET_CLUSTER_NETWORK_STATE = Proc(Win32cr::Networking::Clustering::HNETWORK*, Win32cr::Networking::Clustering::CLUSTER_NETWORK_STATE)*

  alias PCLUSAPI_SET_CLUSTER_NETWORK_NAME = Proc(Win32cr::Networking::Clustering::HNETWORK*, Win32cr::Foundation::PWSTR, UInt32)*

  alias PCLUSAPI_GET_CLUSTER_NETWORK_ID = Proc(Win32cr::Networking::Clustering::HNETWORK*, UInt16*, UInt32*, UInt32)*

  alias PCLUSAPI_CLUSTER_NETWORK_CONTROL = Proc(Win32cr::Networking::Clustering::HNETWORK*, Win32cr::Networking::Clustering::HNODE*, UInt32, Void*, UInt32, Void*, UInt32, UInt32*, UInt32)*

  alias PCLUSAPI_OPEN_CLUSTER_NET_INTERFACE = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Foundation::PWSTR, Win32cr::Networking::Clustering::HNETINTERFACE*)*

  alias PCLUSAPI_OPEN_CLUSTER_NETINTERFACE_EX = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, Win32cr::Networking::Clustering::HNETINTERFACE*)*

  alias PCLUSAPI_GET_CLUSTER_NET_INTERFACE = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt16*, UInt32*, UInt32)*

  alias PCLUSAPI_CLOSE_CLUSTER_NET_INTERFACE = Proc(Win32cr::Networking::Clustering::HNETINTERFACE*, Win32cr::Foundation::BOOL)*

  alias PCLUSAPI_GET_CLUSTER_FROM_NET_INTERFACE = Proc(Win32cr::Networking::Clustering::HNETINTERFACE*, Win32cr::Networking::Clustering::HCLUSTER*)*

  alias PCLUSAPI_GET_CLUSTER_NET_INTERFACE_STATE = Proc(Win32cr::Networking::Clustering::HNETINTERFACE*, Win32cr::Networking::Clustering::CLUSTER_NETINTERFACE_STATE)*

  alias PCLUSAPI_CLUSTER_NET_INTERFACE_CONTROL = Proc(Win32cr::Networking::Clustering::HNETINTERFACE*, Win32cr::Networking::Clustering::HNODE*, UInt32, Void*, UInt32, Void*, UInt32, UInt32*, UInt32)*

  alias PCLUSAPI_GET_CLUSTER_KEY = Proc(Win32cr::Networking::Clustering::HCLUSTER*, UInt32, Win32cr::System::Registry::HKEY)*

  alias PCLUSAPI_GET_CLUSTER_GROUP_KEY = Proc(Win32cr::Networking::Clustering::HGROUP*, UInt32, Win32cr::System::Registry::HKEY)*

  alias PCLUSAPI_GET_CLUSTER_RESOURCE_KEY = Proc(Win32cr::Networking::Clustering::HRESOURCE*, UInt32, Win32cr::System::Registry::HKEY)*

  alias PCLUSAPI_GET_CLUSTER_NODE_KEY = Proc(Win32cr::Networking::Clustering::HNODE*, UInt32, Win32cr::System::Registry::HKEY)*

  alias PCLUSAPI_GET_CLUSTER_NETWORK_KEY = Proc(Win32cr::Networking::Clustering::HNETWORK*, UInt32, Win32cr::System::Registry::HKEY)*

  alias PCLUSAPI_GET_CLUSTER_NET_INTERFACE_KEY = Proc(Win32cr::Networking::Clustering::HNETINTERFACE*, UInt32, Win32cr::System::Registry::HKEY)*

  alias PCLUSAPI_CLUSTER_REG_CREATE_KEY = Proc(Win32cr::System::Registry::HKEY, Win32cr::Foundation::PWSTR, UInt32, UInt32, Win32cr::Security::SECURITY_ATTRIBUTES*, Win32cr::System::Registry::HKEY*, UInt32*, Int32)*

  alias PCLUSAPI_CLUSTER_REG_OPEN_KEY = Proc(Win32cr::System::Registry::HKEY, Win32cr::Foundation::PWSTR, UInt32, Win32cr::System::Registry::HKEY*, Int32)*

  alias PCLUSAPI_CLUSTER_REG_DELETE_KEY = Proc(Win32cr::System::Registry::HKEY, Win32cr::Foundation::PWSTR, Int32)*

  alias PCLUSAPI_CLUSTER_REG_CLOSE_KEY = Proc(Win32cr::System::Registry::HKEY, Int32)*

  alias PCLUSAPI_CLUSTER_REG_ENUM_KEY = Proc(Win32cr::System::Registry::HKEY, UInt32, UInt16*, UInt32*, Win32cr::Foundation::FILETIME*, Int32)*

  alias PCLUSAPI_CLUSTER_REG_SET_VALUE = Proc(Win32cr::System::Registry::HKEY, Win32cr::Foundation::PWSTR, UInt32, UInt8*, UInt32, UInt32)*

  alias PCLUSAPI_CLUSTER_REG_DELETE_VALUE = Proc(Win32cr::System::Registry::HKEY, Win32cr::Foundation::PWSTR, UInt32)*

  alias PCLUSAPI_CLUSTER_REG_QUERY_VALUE = Proc(Win32cr::System::Registry::HKEY, Win32cr::Foundation::PWSTR, UInt32*, UInt8*, UInt32*, Int32)*

  alias PCLUSAPI_CLUSTER_REG_ENUM_VALUE = Proc(Win32cr::System::Registry::HKEY, UInt32, UInt16*, UInt32*, UInt32*, UInt8*, UInt32*, UInt32)*

  alias PCLUSAPI_CLUSTER_REG_QUERY_INFO_KEY = Proc(Win32cr::System::Registry::HKEY, UInt32*, UInt32*, UInt32*, UInt32*, UInt32*, UInt32*, Win32cr::Foundation::FILETIME*, Int32)*

  alias PCLUSAPI_CLUSTER_REG_GET_KEY_SECURITY = Proc(Win32cr::System::Registry::HKEY, UInt32, Win32cr::Security::PSECURITY_DESCRIPTOR, UInt32*, Int32)*

  alias PCLUSAPI_CLUSTER_REG_SET_KEY_SECURITY = Proc(Win32cr::System::Registry::HKEY, UInt32, Win32cr::Security::PSECURITY_DESCRIPTOR, Int32)*

  alias PCLUSAPI_CLUSTER_REG_SYNC_DATABASE = Proc(Win32cr::Networking::Clustering::HCLUSTER*, UInt32, Int32)*

  alias PCLUSAPI_CLUSTER_REG_CREATE_BATCH = Proc(Win32cr::System::Registry::HKEY, Win32cr::Networking::Clustering::HREGBATCH**, Int32)*

  alias PCLUSTER_REG_BATCH_ADD_COMMAND = Proc(Win32cr::Networking::Clustering::HREGBATCH*, Win32cr::Networking::Clustering::CLUSTER_REG_COMMAND, Win32cr::Foundation::PWSTR, UInt32, Void*, UInt32, Int32)*

  alias PCLUSTER_REG_CLOSE_BATCH = Proc(Win32cr::Networking::Clustering::HREGBATCH*, Win32cr::Foundation::BOOL, Int32*, Int32)*

  alias PCLUSTER_REG_BATCH_READ_COMMAND = Proc(Win32cr::Networking::Clustering::HREGBATCHNOTIFICATION*, Win32cr::Networking::Clustering::CLUSTER_BATCH_COMMAND*, Int32)*

  alias PCLUSTER_REG_BATCH_CLOSE_NOTIFICATION = Proc(Win32cr::Networking::Clustering::HREGBATCHNOTIFICATION*, Int32)*

  alias PCLUSTER_REG_CREATE_BATCH_NOTIFY_PORT = Proc(Win32cr::System::Registry::HKEY, Win32cr::Networking::Clustering::HREGBATCHPORT**, Int32)*

  alias PCLUSTER_REG_CLOSE_BATCH_NOTIFY_PORT = Proc(Win32cr::Networking::Clustering::HREGBATCHPORT*, Int32)*

  alias PCLUSTER_REG_GET_BATCH_NOTIFICATION = Proc(Win32cr::Networking::Clustering::HREGBATCHPORT*, Win32cr::Networking::Clustering::HREGBATCHNOTIFICATION**, Int32)*

  alias PCLUSTER_REG_CREATE_READ_BATCH = Proc(Win32cr::System::Registry::HKEY, Win32cr::Networking::Clustering::HREGREADBATCH**, Int32)*

  alias PCLUSTER_REG_READ_BATCH_ADD_COMMAND = Proc(Win32cr::Networking::Clustering::HREGREADBATCH*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Int32)*

  alias PCLUSTER_REG_CLOSE_READ_BATCH = Proc(Win32cr::Networking::Clustering::HREGREADBATCH*, Win32cr::Networking::Clustering::HREGREADBATCHREPLY**, Int32)*

  alias PCLUSTER_REG_CLOSE_READ_BATCH_EX = Proc(Win32cr::Networking::Clustering::HREGREADBATCH*, UInt32, Win32cr::Networking::Clustering::HREGREADBATCHREPLY**, Int32)*

  alias PCLUSTER_REG_READ_BATCH_REPLY_NEXT_COMMAND = Proc(Win32cr::Networking::Clustering::HREGREADBATCHREPLY*, Win32cr::Networking::Clustering::CLUSTER_READ_BATCH_COMMAND*, Int32)*

  alias PCLUSTER_REG_CLOSE_READ_BATCH_REPLY = Proc(Win32cr::Networking::Clustering::HREGREADBATCHREPLY*, Int32)*

  alias PCLUSTER_SET_ACCOUNT_ACCESS = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Foundation::PWSTR, UInt32, UInt32, UInt32)*

  alias PCLUSTER_SETUP_PROGRESS_CALLBACK = Proc(Void*, Win32cr::Networking::Clustering::CLUSTER_SETUP_PHASE, Win32cr::Networking::Clustering::CLUSTER_SETUP_PHASE_TYPE, Win32cr::Networking::Clustering::CLUSTER_SETUP_PHASE_SEVERITY, UInt32, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::BOOL)*

  alias PCLUSAPI_CREATE_CLUSTER = Proc(Win32cr::Networking::Clustering::CREATE_CLUSTER_CONFIG*, Win32cr::Networking::Clustering::PCLUSTER_SETUP_PROGRESS_CALLBACK, Void*, Win32cr::Networking::Clustering::HCLUSTER*)*

  alias PCLUSAPI_CREATE_CLUSTER_CNOLESS = Proc(Win32cr::Networking::Clustering::CREATE_CLUSTER_CONFIG*, Win32cr::Networking::Clustering::PCLUSTER_SETUP_PROGRESS_CALLBACK, Void*, Win32cr::Networking::Clustering::HCLUSTER*)*

  alias PCLUSAPI_CREATE_CLUSTER_NAME_ACCOUNT = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Networking::Clustering::CREATE_CLUSTER_NAME_ACCOUNT*, Win32cr::Networking::Clustering::PCLUSTER_SETUP_PROGRESS_CALLBACK, Void*, UInt32)*

  alias PCLUSAPI_REMOVE_CLUSTER_NAME_ACCOUNT = Proc(Win32cr::Networking::Clustering::HCLUSTER*, UInt32)*

  alias PCLUSAPI_ADD_CLUSTER_NODE = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Foundation::PWSTR, Win32cr::Networking::Clustering::PCLUSTER_SETUP_PROGRESS_CALLBACK, Void*, Win32cr::Networking::Clustering::HNODE*)*

  alias PCLUSAPI_ADD_CLUSTER_NODE_EX = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Networking::Clustering::PCLUSTER_SETUP_PROGRESS_CALLBACK, Void*, Win32cr::Networking::Clustering::HNODE*)*

  alias PCLUSAPI_DESTROY_CLUSTER = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Networking::Clustering::PCLUSTER_SETUP_PROGRESS_CALLBACK, Void*, Win32cr::Foundation::BOOL, UInt32)*

  alias PSET_RESOURCE_STATUS_ROUTINE_EX = Proc(LibC::IntPtrT, Win32cr::Networking::Clustering::RESOURCE_STATUS_EX*, UInt32)*

  alias PSET_RESOURCE_STATUS_ROUTINE = Proc(LibC::IntPtrT, Win32cr::Networking::Clustering::RESOURCE_STATUS*, UInt32)*

  alias PQUORUM_RESOURCE_LOST = Proc(LibC::IntPtrT, Void)*

  alias PLOG_EVENT_ROUTINE = Proc(LibC::IntPtrT, Win32cr::Networking::Clustering::LOG_LEVEL, Win32cr::Foundation::PWSTR, Void)*

  alias POPEN_ROUTINE = Proc(Win32cr::Foundation::PWSTR, Win32cr::System::Registry::HKEY, LibC::IntPtrT, Void*)*

  alias PCLOSE_ROUTINE = Proc(Void*, Void)*

  alias PONLINE_ROUTINE = Proc(Void*, Win32cr::Foundation::HANDLE*, UInt32)*

  alias POFFLINE_ROUTINE = Proc(Void*, UInt32)*

  alias PTERMINATE_ROUTINE = Proc(Void*, Void)*

  alias PIS_ALIVE_ROUTINE = Proc(Void*, Win32cr::Foundation::BOOL)*

  alias PLOOKS_ALIVE_ROUTINE = Proc(Void*, Win32cr::Foundation::BOOL)*

  alias PARBITRATE_ROUTINE = Proc(Void*, Win32cr::Networking::Clustering::PQUORUM_RESOURCE_LOST, UInt32)*

  alias PRELEASE_ROUTINE = Proc(Void*, UInt32)*

  alias PRESOURCE_CONTROL_ROUTINE = Proc(Void*, UInt32, Void*, UInt32, Void*, UInt32, UInt32*, UInt32)*

  alias PRESOURCE_TYPE_CONTROL_ROUTINE = Proc(Win32cr::Foundation::PWSTR, UInt32, Void*, UInt32, Void*, UInt32, UInt32*, UInt32)*

  alias POPEN_V2_ROUTINE = Proc(Win32cr::Foundation::PWSTR, Win32cr::System::Registry::HKEY, LibC::IntPtrT, UInt32, Void*)*

  alias PONLINE_V2_ROUTINE = Proc(Void*, Win32cr::Foundation::HANDLE*, UInt32, UInt8*, UInt32, UInt32, UInt32)*

  alias POFFLINE_V2_ROUTINE = Proc(Void*, Win32cr::Foundation::PWSTR, UInt32, UInt8*, UInt32, UInt32, UInt32)*

  alias PCANCEL_ROUTINE = Proc(Void*, UInt32, UInt32)*

  alias PBEGIN_RESCALL_ROUTINE = Proc(Void*, UInt32, Void*, UInt32, Void*, UInt32, UInt32*, Int64, Win32cr::Foundation::BOOL*, UInt32)*

  alias PBEGIN_RESTYPECALL_ROUTINE = Proc(Win32cr::Foundation::PWSTR, UInt32, Void*, UInt32, Void*, UInt32, UInt32*, Int64, Win32cr::Foundation::BOOL*, UInt32)*

  alias PBEGIN_RESCALL_AS_USER_ROUTINE = Proc(Void*, Win32cr::Foundation::HANDLE, UInt32, Void*, UInt32, Void*, UInt32, UInt32*, Int64, Win32cr::Foundation::BOOL*, UInt32)*

  alias PBEGIN_RESTYPECALL_AS_USER_ROUTINE = Proc(Win32cr::Foundation::PWSTR, Win32cr::Foundation::HANDLE, UInt32, Void*, UInt32, Void*, UInt32, UInt32*, Int64, Win32cr::Foundation::BOOL*, UInt32)*

  alias PSTARTUP_ROUTINE = Proc(Win32cr::Foundation::PWSTR, UInt32, UInt32, Win32cr::Networking::Clustering::PSET_RESOURCE_STATUS_ROUTINE, Win32cr::Networking::Clustering::PLOG_EVENT_ROUTINE, Win32cr::Networking::Clustering::CLRES_FUNCTION_TABLE**, UInt32)*

  alias PSET_RESOURCE_LOCKED_MODE_ROUTINE = Proc(LibC::IntPtrT, Win32cr::Foundation::BOOL, UInt32, UInt32)*

  alias PSIGNAL_FAILURE_ROUTINE = Proc(LibC::IntPtrT, Win32cr::Networking::Clustering::FAILURE_TYPE, UInt32, UInt32)*

  alias PSET_RESOURCE_INMEMORY_NODELOCAL_PROPERTIES_ROUTINE = Proc(LibC::IntPtrT, UInt8*, UInt32, UInt32)*

  alias PEND_CONTROL_CALL = Proc(Int64, UInt32, UInt32)*

  alias PEND_TYPE_CONTROL_CALL = Proc(Int64, UInt32, UInt32)*

  alias PEXTEND_RES_CONTROL_CALL = Proc(Int64, UInt32, UInt32)*

  alias PEXTEND_RES_TYPE_CONTROL_CALL = Proc(Int64, UInt32, UInt32)*

  alias PRAISE_RES_TYPE_NOTIFICATION = Proc(Win32cr::Foundation::PWSTR, UInt8*, UInt32, UInt32)*

  alias PCHANGE_RESOURCE_PROCESS_FOR_DUMPS = Proc(LibC::IntPtrT, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::BOOL, UInt32)*

  alias PCHANGE_RES_TYPE_PROCESS_FOR_DUMPS = Proc(Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::BOOL, UInt32)*

  alias PSET_INTERNAL_STATE = Proc(LibC::IntPtrT, Win32cr::Networking::Clustering::CLUSTER_RESOURCE_APPLICATION_STATE, Win32cr::Foundation::BOOL, UInt32)*

  alias PSET_RESOURCE_LOCKED_MODE_EX_ROUTINE = Proc(LibC::IntPtrT, Win32cr::Foundation::BOOL, UInt32, UInt32, UInt32)*

  alias PREQUEST_DUMP_ROUTINE = Proc(LibC::IntPtrT, Win32cr::Foundation::BOOL, UInt32, UInt32)*

  alias PSTARTUP_EX_ROUTINE = Proc(Win32cr::Foundation::PWSTR, UInt32, UInt32, Win32cr::Networking::Clustering::CLRES_CALLBACK_FUNCTION_TABLE*, Win32cr::Networking::Clustering::CLRES_FUNCTION_TABLE**, UInt32)*

  alias PRESUTIL_START_RESOURCE_SERVICE = Proc(Win32cr::Foundation::PWSTR, LibC::IntPtrT*, UInt32)*

  alias PRESUTIL_VERIFY_RESOURCE_SERVICE = Proc(Win32cr::Foundation::PWSTR, UInt32)*

  alias PRESUTIL_STOP_RESOURCE_SERVICE = Proc(Win32cr::Foundation::PWSTR, UInt32)*

  alias PRESUTIL_VERIFY_SERVICE = Proc(Win32cr::Security::SC_HANDLE, UInt32)*

  alias PRESUTIL_STOP_SERVICE = Proc(Win32cr::Security::SC_HANDLE, UInt32)*

  alias PRESUTIL_CREATE_DIRECTORY_TREE = Proc(Win32cr::Foundation::PWSTR, UInt32)*

  alias PRESUTIL_IS_PATH_VALID = Proc(Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL)*

  alias PRESUTIL_ENUM_PROPERTIES = Proc(Win32cr::Networking::Clustering::RESUTIL_PROPERTY_ITEM*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, UInt32*, UInt32)*

  alias PRESUTIL_ENUM_PRIVATE_PROPERTIES = Proc(Win32cr::System::Registry::HKEY, Win32cr::Foundation::PWSTR, UInt32, UInt32*, UInt32*, UInt32)*

  alias PRESUTIL_GET_PROPERTIES = Proc(Win32cr::System::Registry::HKEY, Win32cr::Networking::Clustering::RESUTIL_PROPERTY_ITEM*, Void*, UInt32, UInt32*, UInt32*, UInt32)*

  alias PRESUTIL_GET_ALL_PROPERTIES = Proc(Win32cr::System::Registry::HKEY, Win32cr::Networking::Clustering::RESUTIL_PROPERTY_ITEM*, Void*, UInt32, UInt32*, UInt32*, UInt32)*

  alias PRESUTIL_GET_PRIVATE_PROPERTIES = Proc(Win32cr::System::Registry::HKEY, Void*, UInt32, UInt32*, UInt32*, UInt32)*

  alias PRESUTIL_GET_PROPERTY_SIZE = Proc(Win32cr::System::Registry::HKEY, Win32cr::Networking::Clustering::RESUTIL_PROPERTY_ITEM*, UInt32*, UInt32*, UInt32)*

  alias PRESUTIL_GET_PROPERTY = Proc(Win32cr::System::Registry::HKEY, Win32cr::Networking::Clustering::RESUTIL_PROPERTY_ITEM*, Void**, UInt32*, UInt32)*

  alias PRESUTIL_VERIFY_PROPERTY_TABLE = Proc(Win32cr::Networking::Clustering::RESUTIL_PROPERTY_ITEM*, Void*, Win32cr::Foundation::BOOL, Void*, UInt32, UInt8*, UInt32)*

  alias PRESUTIL_SET_PROPERTY_TABLE = Proc(Win32cr::System::Registry::HKEY, Win32cr::Networking::Clustering::RESUTIL_PROPERTY_ITEM*, Void*, Win32cr::Foundation::BOOL, Void*, UInt32, UInt8*, UInt32)*

  alias PRESUTIL_SET_PROPERTY_TABLE_EX = Proc(Win32cr::System::Registry::HKEY, Win32cr::Networking::Clustering::RESUTIL_PROPERTY_ITEM*, Void*, Win32cr::Foundation::BOOL, Void*, UInt32, Win32cr::Foundation::BOOL, UInt8*, UInt32)*

  alias PRESUTIL_SET_PROPERTY_PARAMETER_BLOCK = Proc(Win32cr::System::Registry::HKEY, Win32cr::Networking::Clustering::RESUTIL_PROPERTY_ITEM*, Void*, UInt8*, Void*, UInt32, UInt8*, UInt32)*

  alias PRESUTIL_SET_PROPERTY_PARAMETER_BLOCK_EX = Proc(Win32cr::System::Registry::HKEY, Win32cr::Networking::Clustering::RESUTIL_PROPERTY_ITEM*, Void*, UInt8*, Void*, UInt32, Win32cr::Foundation::BOOL, UInt8*, UInt32)*

  alias PRESUTIL_SET_UNKNOWN_PROPERTIES = Proc(Win32cr::System::Registry::HKEY, Win32cr::Networking::Clustering::RESUTIL_PROPERTY_ITEM*, Void*, UInt32, UInt32)*

  alias PRESUTIL_GET_PROPERTIES_TO_PARAMETER_BLOCK = Proc(Win32cr::System::Registry::HKEY, Win32cr::Networking::Clustering::RESUTIL_PROPERTY_ITEM*, UInt8*, Win32cr::Foundation::BOOL, Win32cr::Foundation::PWSTR*, UInt32)*

  alias PRESUTIL_PROPERTY_LIST_FROM_PARAMETER_BLOCK = Proc(Win32cr::Networking::Clustering::RESUTIL_PROPERTY_ITEM*, Void*, UInt32*, UInt8*, UInt32*, UInt32*, UInt32)*

  alias PRESUTIL_DUP_PARAMETER_BLOCK = Proc(UInt8*, UInt8*, Win32cr::Networking::Clustering::RESUTIL_PROPERTY_ITEM*, UInt32)*

  alias PRESUTIL_FREE_PARAMETER_BLOCK = Proc(UInt8*, UInt8*, Win32cr::Networking::Clustering::RESUTIL_PROPERTY_ITEM*, Void)*

  alias PRESUTIL_ADD_UNKNOWN_PROPERTIES = Proc(Win32cr::System::Registry::HKEY, Win32cr::Networking::Clustering::RESUTIL_PROPERTY_ITEM*, Void*, UInt32, UInt32*, UInt32*, UInt32)*

  alias PRESUTIL_SET_PRIVATE_PROPERTY_LIST = Proc(Win32cr::System::Registry::HKEY, Void*, UInt32, UInt32)*

  alias PRESUTIL_VERIFY_PRIVATE_PROPERTY_LIST = Proc(Void*, UInt32, UInt32)*

  alias PRESUTIL_DUP_STRING = Proc(Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR)*

  alias PRESUTIL_GET_BINARY_VALUE = Proc(Win32cr::System::Registry::HKEY, Win32cr::Foundation::PWSTR, UInt8**, UInt32*, UInt32)*

  alias PRESUTIL_GET_SZ_VALUE = Proc(Win32cr::System::Registry::HKEY, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR)*

  alias PRESUTIL_GET_EXPAND_SZ_VALUE = Proc(Win32cr::System::Registry::HKEY, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::PWSTR)*

  alias PRESUTIL_GET_DWORD_VALUE = Proc(Win32cr::System::Registry::HKEY, Win32cr::Foundation::PWSTR, UInt32*, UInt32, UInt32)*

  alias PRESUTIL_GET_QWORD_VALUE = Proc(Win32cr::System::Registry::HKEY, Win32cr::Foundation::PWSTR, UInt64*, UInt64, UInt32)*

  alias PRESUTIL_SET_BINARY_VALUE = Proc(Win32cr::System::Registry::HKEY, Win32cr::Foundation::PWSTR, UInt8*, UInt32, UInt8**, UInt32*, UInt32)*

  alias PRESUTIL_SET_SZ_VALUE = Proc(Win32cr::System::Registry::HKEY, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR*, UInt32)*

  alias PRESUTIL_SET_EXPAND_SZ_VALUE = Proc(Win32cr::System::Registry::HKEY, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR*, UInt32)*

  alias PRESUTIL_SET_MULTI_SZ_VALUE = Proc(Win32cr::System::Registry::HKEY, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR*, UInt32*, UInt32)*

  alias PRESUTIL_SET_DWORD_VALUE = Proc(Win32cr::System::Registry::HKEY, Win32cr::Foundation::PWSTR, UInt32, UInt32*, UInt32)*

  alias PRESUTIL_SET_QWORD_VALUE = Proc(Win32cr::System::Registry::HKEY, Win32cr::Foundation::PWSTR, UInt64, UInt64*, UInt32)*

  alias PRESUTIL_GET_BINARY_PROPERTY = Proc(UInt8**, UInt32*, Win32cr::Networking::Clustering::CLUSPROP_BINARY*, UInt8*, UInt32, UInt8**, UInt32*, UInt32)*

  alias PRESUTIL_GET_SZ_PROPERTY = Proc(Win32cr::Foundation::PWSTR*, Win32cr::Networking::Clustering::CLUSPROP_SZ*, Win32cr::Foundation::PWSTR, UInt8**, UInt32*, UInt32)*

  alias PRESUTIL_GET_MULTI_SZ_PROPERTY = Proc(Win32cr::Foundation::PWSTR*, UInt32*, Win32cr::Networking::Clustering::CLUSPROP_SZ*, Win32cr::Foundation::PWSTR, UInt32, UInt8**, UInt32*, UInt32)*

  alias PRESUTIL_GET_DWORD_PROPERTY = Proc(UInt32*, Win32cr::Networking::Clustering::CLUSPROP_DWORD*, UInt32, UInt32, UInt32, UInt8**, UInt32*, UInt32)*

  alias PRESUTIL_GET_LONG_PROPERTY = Proc(Int32*, Win32cr::Networking::Clustering::CLUSPROP_LONG*, Int32, Int32, Int32, UInt8**, UInt32*, UInt32)*

  alias PRESUTIL_GET_FILETIME_PROPERTY = Proc(Win32cr::Foundation::FILETIME*, Win32cr::Networking::Clustering::CLUSPROP_FILETIME*, Win32cr::Foundation::FILETIME, Win32cr::Foundation::FILETIME, Win32cr::Foundation::FILETIME, UInt8**, UInt32*, UInt32)*

  alias PRESUTIL_GET_ENVIRONMENT_WITH_NET_NAME = Proc(Win32cr::Networking::Clustering::HRESOURCE*, Void*)*

  alias PRESUTIL_FREE_ENVIRONMENT = Proc(Void*, UInt32)*

  alias PRESUTIL_EXPAND_ENVIRONMENT_STRINGS = Proc(Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR)*

  alias PRESUTIL_SET_RESOURCE_SERVICE_ENVIRONMENT = Proc(Win32cr::Foundation::PWSTR, Win32cr::Networking::Clustering::HRESOURCE*, Win32cr::Networking::Clustering::PLOG_EVENT_ROUTINE, LibC::IntPtrT, UInt32)*

  alias PRESUTIL_REMOVE_RESOURCE_SERVICE_ENVIRONMENT = Proc(Win32cr::Foundation::PWSTR, Win32cr::Networking::Clustering::PLOG_EVENT_ROUTINE, LibC::IntPtrT, UInt32)*

  alias PRESUTIL_SET_RESOURCE_SERVICE_START_PARAMETERS = Proc(Win32cr::Foundation::PWSTR, Win32cr::Security::SC_HANDLE, LibC::IntPtrT*, Win32cr::Networking::Clustering::PLOG_EVENT_ROUTINE, LibC::IntPtrT, UInt32)*

  alias PRESUTIL_FIND_SZ_PROPERTY = Proc(Void*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR*, UInt32)*

  alias PRESUTIL_FIND_EXPAND_SZ_PROPERTY = Proc(Void*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR*, UInt32)*

  alias PRESUTIL_FIND_EXPANDED_SZ_PROPERTY = Proc(Void*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR*, UInt32)*

  alias PRESUTIL_FIND_DWORD_PROPERTY = Proc(Void*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, UInt32)*

  alias PRESUTIL_FIND_BINARY_PROPERTY = Proc(Void*, UInt32, Win32cr::Foundation::PWSTR, UInt8**, UInt32*, UInt32)*

  alias PRESUTIL_FIND_MULTI_SZ_PROPERTY = Proc(Void*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR*, UInt32*, UInt32)*

  alias PRESUTIL_FIND_LONG_PROPERTY = Proc(Void*, UInt32, Win32cr::Foundation::PWSTR, Int32*, UInt32)*

  alias PRESUTIL_FIND_ULARGEINTEGER_PROPERTY = Proc(Void*, UInt32, Win32cr::Foundation::PWSTR, UInt64*, UInt32)*

  alias PRESUTIL_FIND_FILETIME_PROPERTY = Proc(Void*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::FILETIME*, UInt32)*

  alias PWORKER_START_ROUTINE = Proc(Win32cr::Networking::Clustering::CLUS_WORKER*, Void*, UInt32)*

  alias PCLUSAPI_CLUS_WORKER_CREATE = Proc(Win32cr::Networking::Clustering::CLUS_WORKER*, Win32cr::Networking::Clustering::PWORKER_START_ROUTINE, Void*, UInt32)*

  alias PCLUSAPIClusWorkerCheckTerminate = Proc(Win32cr::Networking::Clustering::CLUS_WORKER*, Win32cr::Foundation::BOOL)*

  alias PCLUSAPI_CLUS_WORKER_TERMINATE = Proc(Win32cr::Networking::Clustering::CLUS_WORKER*, Void)*

  alias LPRESOURCE_CALLBACK = Proc(Win32cr::Networking::Clustering::HRESOURCE*, Win32cr::Networking::Clustering::HRESOURCE*, Void*, UInt32)*

  alias LPRESOURCE_CALLBACK_EX = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Networking::Clustering::HRESOURCE*, Win32cr::Networking::Clustering::HRESOURCE*, Void*, UInt32)*

  alias LPGROUP_CALLBACK_EX = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Networking::Clustering::HGROUP*, Win32cr::Networking::Clustering::HGROUP*, Void*, UInt32)*

  alias LPNODE_CALLBACK = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Networking::Clustering::HNODE*, Win32cr::Networking::Clustering::CLUSTER_NODE_STATE, Void*, UInt32)*

  alias PRESUTIL_RESOURCES_EQUAL = Proc(Win32cr::Networking::Clustering::HRESOURCE*, Win32cr::Networking::Clustering::HRESOURCE*, Win32cr::Foundation::BOOL)*

  alias PRESUTIL_RESOURCE_TYPES_EQUAL = Proc(Win32cr::Foundation::PWSTR, Win32cr::Networking::Clustering::HRESOURCE*, Win32cr::Foundation::BOOL)*

  alias PRESUTIL_IS_RESOURCE_CLASS_EQUAL = Proc(Win32cr::Networking::Clustering::CLUS_RESOURCE_CLASS_INFO*, Win32cr::Networking::Clustering::HRESOURCE*, Win32cr::Foundation::BOOL)*

  alias PRESUTIL_ENUM_RESOURCES = Proc(Win32cr::Networking::Clustering::HRESOURCE*, Win32cr::Foundation::PWSTR, Win32cr::Networking::Clustering::LPRESOURCE_CALLBACK, Void*, UInt32)*

  alias PRESUTIL_ENUM_RESOURCES_EX = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Networking::Clustering::HRESOURCE*, Win32cr::Foundation::PWSTR, Win32cr::Networking::Clustering::LPRESOURCE_CALLBACK_EX, Void*, UInt32)*

  alias PRESUTIL_GET_RESOURCE_DEPENDENCY = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::PWSTR, Win32cr::Networking::Clustering::HRESOURCE*)*

  alias PRESUTIL_GET_RESOURCE_DEPENDENCY_BY_NAME = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Foundation::HANDLE, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, Win32cr::Networking::Clustering::HRESOURCE*)*

  alias PRESUTIL_GET_RESOURCE_DEPENDENCY_BY_CLASS = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Foundation::HANDLE, Win32cr::Networking::Clustering::CLUS_RESOURCE_CLASS_INFO*, Win32cr::Foundation::BOOL, Win32cr::Networking::Clustering::HRESOURCE*)*

  alias PRESUTIL_GET_RESOURCE_NAME_DEPENDENCY = Proc(Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Networking::Clustering::HRESOURCE*)*

  alias PRESUTIL_GET_RESOURCE_DEPENDENTIP_ADDRESS_PROPS = Proc(Win32cr::Networking::Clustering::HRESOURCE*, UInt16*, UInt32*, UInt16*, UInt32*, UInt16*, UInt32*, UInt32)*

  alias PRESUTIL_FIND_DEPENDENT_DISK_RESOURCE_DRIVE_LETTER = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Networking::Clustering::HRESOURCE*, UInt16*, UInt32*, UInt32)*

  alias PRESUTIL_TERMINATE_SERVICE_PROCESS_FROM_RES_DLL = Proc(UInt32, Win32cr::Foundation::BOOL, UInt32*, Win32cr::Networking::Clustering::PLOG_EVENT_ROUTINE, LibC::IntPtrT, UInt32)*

  alias PRESUTIL_GET_PROPERTY_FORMATS = Proc(Win32cr::Networking::Clustering::RESUTIL_PROPERTY_ITEM*, Void*, UInt32, UInt32*, UInt32*, UInt32)*

  alias PRESUTIL_GET_CORE_CLUSTER_RESOURCES = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Networking::Clustering::HRESOURCE**, Win32cr::Networking::Clustering::HRESOURCE**, Win32cr::Networking::Clustering::HRESOURCE**, UInt32)*

  alias PRESUTIL_GET_RESOURCE_NAME = Proc(Win32cr::Networking::Clustering::HRESOURCE*, UInt16*, UInt32*, UInt32)*

  alias PCLUSTER_IS_PATH_ON_SHARED_VOLUME = Proc(Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL)*

  alias PCLUSTER_GET_VOLUME_PATH_NAME = Proc(Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::BOOL)*

  alias PCLUSTER_GET_VOLUME_NAME_FOR_VOLUME_MOUNT_POINT = Proc(Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::BOOL)*

  alias PCLUSTER_PREPARE_SHARED_VOLUME_FOR_BACKUP = Proc(Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::PWSTR, UInt32*, UInt32)*

  alias PCLUSTER_CLEAR_BACKUP_STATE_FOR_SHARED_VOLUME = Proc(Win32cr::Foundation::PWSTR, UInt32)*

  alias PRESUTIL_SET_RESOURCE_SERVICE_START_PARAMETERS_EX = Proc(Win32cr::Foundation::PWSTR, Win32cr::Security::SC_HANDLE, LibC::IntPtrT*, UInt32, Win32cr::Networking::Clustering::PLOG_EVENT_ROUTINE, LibC::IntPtrT, UInt32)*

  alias PRESUTIL_ENUM_RESOURCES_EX2 = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Networking::Clustering::HRESOURCE*, Win32cr::Foundation::PWSTR, Win32cr::Networking::Clustering::LPRESOURCE_CALLBACK_EX, Void*, UInt32, UInt32)*

  alias PRESUTIL_GET_RESOURCE_DEPENDENCY_EX = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Networking::Clustering::HRESOURCE*)*

  alias PRESUTIL_GET_RESOURCE_DEPENDENCY_BY_NAME_EX = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Foundation::HANDLE, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, UInt32, Win32cr::Networking::Clustering::HRESOURCE*)*

  alias PRESUTIL_GET_RESOURCE_DEPENDENCY_BY_CLASS_EX = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Foundation::HANDLE, Win32cr::Networking::Clustering::CLUS_RESOURCE_CLASS_INFO*, Win32cr::Foundation::BOOL, UInt32, Win32cr::Networking::Clustering::HRESOURCE*)*

  alias PRESUTIL_GET_RESOURCE_NAME_DEPENDENCY_EX = Proc(Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Networking::Clustering::HRESOURCE*)*

  alias PRESUTIL_GET_CORE_CLUSTER_RESOURCES_EX = Proc(Win32cr::Networking::Clustering::HCLUSTER*, Win32cr::Networking::Clustering::HRESOURCE**, Win32cr::Networking::Clustering::HRESOURCE**, Win32cr::Networking::Clustering::HRESOURCE**, UInt32, UInt32)*

  alias POPEN_CLUSTER_CRYPT_PROVIDER = Proc(Win32cr::Foundation::PWSTR, Int8*, UInt32, UInt32, Win32cr::Networking::Clustering::HCLUSCRYPTPROVIDER*)*

  alias POPEN_CLUSTER_CRYPT_PROVIDEREX = Proc(Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Int8*, UInt32, UInt32, Win32cr::Networking::Clustering::HCLUSCRYPTPROVIDER*)*

  alias PCLOSE_CLUSTER_CRYPT_PROVIDER = Proc(Win32cr::Networking::Clustering::HCLUSCRYPTPROVIDER*, UInt32)*

  alias PCLUSTER_ENCRYPT = Proc(Win32cr::Networking::Clustering::HCLUSCRYPTPROVIDER*, UInt8*, UInt32, UInt8**, UInt32*, UInt32)*

  alias PCLUSTER_DECRYPT = Proc(Win32cr::Networking::Clustering::HCLUSCRYPTPROVIDER*, UInt8*, UInt32, UInt8**, UInt32*, UInt32)*

  alias PFREE_CLUSTER_CRYPT = Proc(Void*, UInt32)*

  alias PRES_UTIL_VERIFY_SHUTDOWN_SAFE = Proc(UInt32, UInt32, UInt32*, UInt32)*

  alias PREGISTER_APPINSTANCE = Proc(Win32cr::Foundation::HANDLE, LibC::GUID*, Win32cr::Foundation::BOOL, UInt32)*

  alias PREGISTER_APPINSTANCE_VERSION = Proc(LibC::GUID*, UInt64, UInt64, UInt32)*

  alias PQUERY_APPINSTANCE_VERSION = Proc(LibC::GUID*, UInt64*, UInt64*, Win32cr::Foundation::NTSTATUS*, UInt32)*

  alias PRESET_ALL_APPINSTANCE_VERSIONS = Proc(UInt32)*

  alias SET_APP_INSTANCE_CSV_FLAGS = Proc(Win32cr::Foundation::HANDLE, UInt32, UInt32, UInt32)*

  CLUSTER_VERSION_FLAG_MIXED_MODE = 1_u32
  CLUSTER_VERSION_UNKNOWN = 4294967295_u32
  NT4_MAJOR_VERSION = 1_u32
  NT4SP4_MAJOR_VERSION = 2_u32
  NT5_MAJOR_VERSION = 3_u32
  NT51_MAJOR_VERSION = 4_u32
  NT6_MAJOR_VERSION = 5_u32
  NT7_MAJOR_VERSION = 6_u32
  NT8_MAJOR_VERSION = 7_u32
  NT9_MAJOR_VERSION = 8_u32
  NT10_MAJOR_VERSION = 9_u32
  NT11_MAJOR_VERSION = 10_u32
  NT12_MAJOR_VERSION = 11_u32
  NT13_MAJOR_VERSION = 12_u32
  WS2016_TP4_UPGRADE_VERSION = 6_u32
  WS2016_TP5_UPGRADE_VERSION = 7_u32
  WS2016_RTM_UPGRADE_VERSION = 8_u32
  RS3_UPGRADE_VERSION = 1_u32
  RS4_UPGRADE_VERSION = 2_u32
  RS5_UPGRADE_VERSION = 3_u32
  NINETEEN_H1_UPGRADE_VERSION = 1_u32
  NINETEEN_H2_UPGRADE_VERSION = 2_u32
  MN_UPGRADE_VERSION = 3_u32
  FE_UPGRADE_VERSION = 4_u32
  CA_UPGRADE_VERSION = 1_u32
  HCI_UPGRADE_BIT = 32768_u32
  CLUSREG_NAME_MIXED_MODE = "MixedMode"
  CLUSAPI_VERSION_SERVER2008 = 1536_u32
  CLUSAPI_VERSION_SERVER2008R2 = 1792_u32
  CLUSAPI_VERSION_WINDOWS8 = 1793_u32
  CLUSAPI_VERSION_WINDOWSBLUE = 1794_u32
  CLUSAPI_VERSION_WINTHRESHOLD = 1795_u32
  CLUSAPI_VERSION_RS3 = 2560_u32
  CLUSAPI_VERSION = 2560_u32
  CREATE_CLUSTER_VERSION = 1536_u32
  CREATE_CLUSTER_MAJOR_VERSION_MASK = 4294967040_u32
  MAX_CLUSTERNAME_LENGTH = 63_u32
  CLUSTER_INSTALLED = 1_u32
  CLUSTER_CONFIGURED = 2_u32
  CLUSTER_RUNNING = 16_u32
  CLUS_HYBRID_QUORUM = 1024_u32
  CLUS_NODE_MAJORITY_QUORUM = 0_u32
  CLUSCTL_RESOURCE_STATE_CHANGE_REASON_VERSION_1 = 1_u32
  CLUSREG_DATABASE_SYNC_WRITE_TO_ALL_NODES = 1_u32
  CLUSREG_DATABASE_ISOLATE_READ = 2_u32
  CLUSTER_ENUM_ITEM_VERSION_1 = 1_u32
  CLUSTER_ENUM_ITEM_VERSION = 1_u32
  CLUSTER_CREATE_GROUP_INFO_VERSION_1 = 1_u32
  CLUSTER_CREATE_GROUP_INFO_VERSION = 1_u32
  GROUPSET_READY_SETTING_DELAY = 1_u32
  GROUPSET_READY_SETTING_ONLINE = 2_u32
  GROUPSET_READY_SETTING_OS_HEARTBEAT = 3_u32
  GROUPSET_READY_SETTING_APPLICATION_READY = 4_u32
  CLUS_GRP_MOVE_ALLOWED = 0_u32
  CLUS_GRP_MOVE_LOCKED = 1_u32
  CLUSAPI_READ_ACCESS = 1_i32
  CLUSAPI_CHANGE_ACCESS = 2_i32
  CLUSAPI_NO_ACCESS = 4_i32
  CLUSTER_SET_ACCESS_TYPE_ALLOWED = 0_u32
  CLUSTER_SET_ACCESS_TYPE_DENIED = 1_u32
  CLUSTER_DELETE_ACCESS_CONTROL_ENTRY = 2_u32
  CLUSGROUPSET_STATUS_GROUPS_PENDING = 1_u64
  CLUSGROUPSET_STATUS_GROUPS_ONLINE = 2_u64
  CLUSGROUPSET_STATUS_OS_HEARTBEAT = 4_u64
  CLUSGROUPSET_STATUS_APPLICATION_READY = 8_u64
  CLUSTER_AVAILABILITY_SET_CONFIG_V1 = 1_u32
  CLUSTER_GROUP_ENUM_ITEM_VERSION_1 = 1_u32
  CLUSTER_GROUP_ENUM_ITEM_VERSION = 1_u32
  CLUSTER_RESOURCE_ENUM_ITEM_VERSION_1 = 1_u32
  CLUSTER_RESOURCE_ENUM_ITEM_VERSION = 1_u32
  CLUSAPI_NODE_PAUSE_REMAIN_ON_PAUSED_NODE_ON_MOVE_ERROR = 1_u32
  CLUSAPI_NODE_AVOID_PLACEMENT = 2_u32
  CLUSAPI_NODE_PAUSE_RETRY_DRAIN_ON_FAILURE = 4_u32
  CLUSGRP_STATUS_LOCKED_MODE = 1_u64
  CLUSGRP_STATUS_PREEMPTED = 2_u64
  CLUSGRP_STATUS_WAITING_IN_QUEUE_FOR_MOVE = 4_u64
  CLUSGRP_STATUS_PHYSICAL_RESOURCES_LACKING = 8_u64
  CLUSGRP_STATUS_WAITING_TO_START = 16_u64
  CLUSGRP_STATUS_EMBEDDED_FAILURE = 32_u64
  CLUSGRP_STATUS_OFFLINE_DUE_TO_ANTIAFFINITY_CONFLICT = 64_u64
  CLUSGRP_STATUS_NETWORK_FAILURE = 128_u64
  CLUSGRP_STATUS_UNMONITORED = 256_u64
  CLUSGRP_STATUS_OS_HEARTBEAT = 512_u64
  CLUSGRP_STATUS_APPLICATION_READY = 1024_u64
  CLUSGRP_STATUS_OFFLINE_NOT_LOCAL_DISK_OWNER = 2048_u64
  CLUSGRP_STATUS_WAITING_FOR_DEPENDENCIES = 4096_u64
  CLUSRES_STATUS_LOCKED_MODE = 1_u64
  CLUSRES_STATUS_EMBEDDED_FAILURE = 2_u64
  CLUSRES_STATUS_FAILED_DUE_TO_INSUFFICIENT_CPU = 4_u64
  CLUSRES_STATUS_FAILED_DUE_TO_INSUFFICIENT_MEMORY = 8_u64
  CLUSRES_STATUS_FAILED_DUE_TO_INSUFFICIENT_GENERIC_RESOURCES = 16_u64
  CLUSRES_STATUS_NETWORK_FAILURE = 32_u64
  CLUSRES_STATUS_UNMONITORED = 64_u64
  CLUSRES_STATUS_OS_HEARTBEAT = 128_u64
  CLUSRES_STATUS_APPLICATION_READY = 256_u64
  CLUSRES_STATUS_OFFLINE_NOT_LOCAL_DISK_OWNER = 512_u64
  CLUSAPI_GROUP_ONLINE_IGNORE_RESOURCE_STATUS = 1_u32
  CLUSAPI_GROUP_ONLINE_SYNCHRONOUS = 2_u32
  CLUSAPI_GROUP_ONLINE_BEST_POSSIBLE_NODE = 4_u32
  CLUSAPI_GROUP_ONLINE_IGNORE_AFFINITY_RULE = 8_u32
  CLUSAPI_GROUP_OFFLINE_IGNORE_RESOURCE_STATUS = 1_u32
  CLUSAPI_RESOURCE_ONLINE_IGNORE_RESOURCE_STATUS = 1_u32
  CLUSAPI_RESOURCE_ONLINE_DO_NOT_UPDATE_PERSISTENT_STATE = 2_u32
  CLUSAPI_RESOURCE_ONLINE_NECESSARY_FOR_QUORUM = 4_u32
  CLUSAPI_RESOURCE_ONLINE_BEST_POSSIBLE_NODE = 8_u32
  CLUSAPI_RESOURCE_ONLINE_IGNORE_AFFINITY_RULE = 32_u32
  CLUSAPI_RESOURCE_OFFLINE_IGNORE_RESOURCE_STATUS = 1_u32
  CLUSAPI_RESOURCE_OFFLINE_FORCE_WITH_TERMINATION = 2_u32
  CLUSAPI_RESOURCE_OFFLINE_DO_NOT_UPDATE_PERSISTENT_STATE = 4_u32
  CLUSAPI_RESOURCE_OFFLINE_REASON_NONE = 0_u32
  CLUSAPI_RESOURCE_OFFLINE_REASON_UNKNOWN = 1_u32
  CLUSAPI_RESOURCE_OFFLINE_REASON_MOVING = 2_u32
  CLUSAPI_RESOURCE_OFFLINE_REASON_USER_REQUESTED = 4_u32
  CLUSAPI_RESOURCE_OFFLINE_REASON_BEING_DELETED = 8_u32
  CLUSAPI_RESOURCE_OFFLINE_REASON_BEING_RESTARTED = 16_u32
  CLUSAPI_RESOURCE_OFFLINE_REASON_PREEMPTED = 32_u32
  CLUSAPI_RESOURCE_OFFLINE_REASON_SHUTTING_DOWN = 64_u32
  CLUSAPI_GROUP_MOVE_IGNORE_RESOURCE_STATUS = 1_u32
  CLUSAPI_GROUP_MOVE_RETURN_TO_SOURCE_NODE_ON_ERROR = 2_u32
  CLUSAPI_GROUP_MOVE_QUEUE_ENABLED = 4_u32
  CLUSAPI_GROUP_MOVE_HIGH_PRIORITY_START = 8_u32
  CLUSAPI_GROUP_MOVE_FAILBACK = 16_u32
  CLUSAPI_GROUP_MOVE_IGNORE_AFFINITY_RULE = 32_u32
  CLUSAPI_CHANGE_RESOURCE_GROUP_FORCE_MOVE_TO_CSV = 1_u64
  CLUSAPI_VALID_CHANGE_RESOURCE_GROUP_FLAGS = 1_u64
  GROUP_FAILURE_INFO_VERSION_1 = 1_u32
  RESOURCE_FAILURE_INFO_VERSION_1 = 1_u32
  CLUS_ACCESS_ANY = 0_u32
  CLUS_ACCESS_READ = 1_u32
  CLUS_ACCESS_WRITE = 2_u32
  CLUS_NO_MODIFY = 0_u32
  CLUS_MODIFY = 1_u32
  CLUS_NOT_GLOBAL = 0_u32
  CLUS_GLOBAL = 1_u32
  CLUSCTL_ACCESS_SHIFT = 0_u32
  CLUSCTL_FUNCTION_SHIFT = 2_u32
  CLCTL_INTERNAL_SHIFT = 20_u32
  CLCTL_USER_SHIFT = 21_u32
  CLCTL_MODIFY_SHIFT = 22_u32
  CLCTL_GLOBAL_SHIFT = 23_u32
  CLUSCTL_OBJECT_SHIFT = 24_u32
  CLUSCTL_CONTROL_CODE_MASK = 4194303_u32
  CLUSCTL_OBJECT_MASK = 255_u32
  CLUSCTL_ACCESS_MODE_MASK = 3_u32
  CLCTL_CLUSTER_BASE = 0_u32
  BitLockerEnabled = 1_i32
  BitLockerDecrypted = 4_i32
  BitlockerEncrypted = 8_i32
  BitLockerDecrypting = 16_i32
  BitlockerEncrypting = 32_i32
  BitLockerPaused = 64_i32
  BitLockerStopped = 128_i32
  RedirectedIOReasonUserRequest = 1_u64
  RedirectedIOReasonUnsafeFileSystemFilter = 2_u64
  RedirectedIOReasonUnsafeVolumeFilter = 4_u64
  RedirectedIOReasonFileSystemTiering = 8_u64
  RedirectedIOReasonBitLockerInitializing = 16_u64
  RedirectedIOReasonReFs = 32_u64
  RedirectedIOReasonMax = 9223372036854775808_u64
  VolumeRedirectedIOReasonNoDiskConnectivity = 1_u64
  VolumeRedirectedIOReasonStorageSpaceNotAttached = 2_u64
  VolumeRedirectedIOReasonVolumeReplicationEnabled = 4_u64
  VolumeRedirectedIOReasonMax = 9223372036854775808_u64
  MAX_OBJECTID = 64_u32
  MAX_CO_PASSWORD_LENGTH = 16_u32
  GUID_PRESENT = 1_u32
  CREATEDC_PRESENT = 2_u32
  MAX_CO_PASSWORD_LENGTHEX = 127_u32
  MAX_CO_PASSWORD_STORAGEEX = 128_u32
  MAX_CREATINGDC_LENGTH = 256_u32
  DNS_LENGTH = 64_u32
  MAINTENANCE_MODE_V2_SIG = 2881155087_u32
  NNLEN = 80_u32
  CLUS_RESTYPE_NAME_GENAPP = "Generic Application"
  CLUS_RESTYPE_NAME_GENSVC = "Generic Service"
  CLUS_RESTYPE_NAME_GENSCRIPT = "Generic Script"
  CLUS_RESTYPE_NAME_IPADDR = "IP Address"
  CLUS_RESTYPE_NAME_NETNAME = "Network Name"
  CLUS_RESTYPE_NAME_DNN = "Distributed Network Name"
  CLUS_RESTYPE_NAME_FILESHR = "File Share"
  CLUS_RESTYPE_NAME_PRTSPLR = "Print Spooler"
  CLUS_RESTYPE_NAME_IPV6_NATIVE = "IPv6 Address"
  CLUS_RESTYPE_NAME_IPV6_TUNNEL = "IPv6 Tunnel Address"
  CLUS_RESTYPE_NAME_VSSTASK = "Volume Shadow Copy Service Task"
  CLUS_RESTYPE_NAME_WINS = "WINS Service"
  CLUS_RESTYPE_NAME_DHCP = "DHCP Service"
  CLUS_RESTYPE_NAME_MSMQ = "Microsoft Message Queue Server"
  CLUS_RESTYPE_NAME_NEW_MSMQ = "MSMQ"
  CLUS_RESTYPE_NAME_MSMQ_TRIGGER = "MSMQTriggers"
  CLUS_RESTYPE_NAME_MSDTC = "Distributed Transaction Coordinator"
  CLUS_RESTYPE_NAME_NFS = "NFS Share"
  CLUS_RESTYPE_NAME_NETWORK_FILE_SYSTEM = "Network File System"
  CLUS_RESTYPE_NAME_ISNS = "Microsoft iSNS"
  CLUS_RESTYPE_NAME_HARDDISK = "Physical Disk"
  CLUS_RESTYPE_NAME_PHYS_DISK = "Physical Disk"
  CLUS_RESTYPE_NAME_FSWITNESS = "File Share Witness"
  CLUS_RESTYPE_NAME_FILESERVER = "File Server"
  CLUS_RESTYPE_NAME_SODAFILESERVER = "Scale Out File Server"
  CLUS_RESTYPE_NAME_DFS = "Distributed File System"
  CLUS_RESTYPE_NAME_DFSR = "DFS Replicated Folder"
  CLUS_RESTYPE_NAME_VM = "Virtual Machine"
  CLUS_RESTYPE_NAME_VM_CONFIG = "Virtual Machine Configuration"
  CLUS_RESTYPE_NAME_ISCSITARGET = "iSCSI Target Server"
  CLUS_RESTYPE_NAME_STORAGE_POOL = "Storage Pool"
  CLUS_RESTYPE_NAME_TASKSCHEDULER = "Task Scheduler"
  CLUS_RESTYPE_NAME_VMREPLICA_BROKER = "Virtual Machine Replication Broker"
  CLUS_RESTYPE_NAME_VMREPLICA_COORDINATOR = "Virtual Machine Replication Coordinator"
  CLUS_RESTYPE_NAME_NFS_V2 = "Network File System"
  CLUS_RESTYPE_NAME_NFS_MSNS = "NFS Multi Server Namespace"
  CLUS_RESTYPE_NAME_CAU = "ClusterAwareUpdatingResource"
  CLUS_RESTYPE_NAME_NV_PROVIDER_ADDRESS = "Provider Address"
  CLUS_RESTYPE_NAME_NAT = "Nat"
  CLUS_RESTYPE_NAME_STORAGE_POLICIES = "Storage Policies"
  CLUS_RESTYPE_NAME_STORQOS = "Storage QoS Policy Manager"
  CLUS_RESTYPE_NAME_HEALTH_SERVICE = "Health Service"
  CLUS_RESTYPE_NAME_VM_WMI = "Virtual Machine Cluster WMI"
  CLUS_RESTYPE_NAME_SDDC_MANAGEMENT = "SDDC Management"
  CLUS_RESTYPE_NAME_HCSVM = "HCS Virtual Machine"
  CLUS_RESTYPE_NAME_VIRTUAL_IPV4 = "Disjoint IPv4 Address"
  CLUS_RESTYPE_NAME_VIRTUAL_IPV6 = "Disjoint IPv6 Address"
  CLUS_RESTYPE_NAME_CLOUD_WITNESS = "Cloud Witness"
  CLUS_RESTYPE_NAME_STORAGE_REPLICA = "Storage Replica"
  CLUS_RESTYPE_NAME_CROSS_CLUSTER = "Cross Cluster Dependency Orchestrator"
  CLUS_RESTYPE_NAME_SCALEOUT_MASTER = "Scaleout Master"
  CLUS_RESTYPE_NAME_SCALEOUT_WORKER = "Scaleout Worker"
  CLUS_RESTYPE_NAME_CONTAINER = "Container"
  CLUS_RES_NAME_SCALEOUT_MASTER = "Scaleout Master"
  CLUS_RES_NAME_SCALEOUT_WORKER = "Scaleout Worker"
  CLUSREG_NAME_CLUS_DESC = "Description"
  CLUSREG_NAME_CLUS_SD = "Security Descriptor"
  CLUSREG_NAME_CLUS_DEFAULT_NETWORK_ROLE = "DefaultNetworkRole"
  CLUSREG_NAME_QUORUM_ARBITRATION_TIMEOUT = "QuorumArbitrationTimeMax"
  CLUSTER_HANG_TIMEOUT_KEYNAME = "ClusSvcHangTimeout"
  CLUSTER_HANG_RECOVERY_ACTION_KEYNAME = "HangRecoveryAction"
  CLUSTER_CSA_VSS_STATE = "BackupInProgress"
  CLUSTER_REQUEST_REPLY_TIMEOUT = "RequestReplyTimeout"
  CLUSTER_WITNESS_FAILED_RESTART_INTERVAL = "WitnessRestartInterval"
  CLUSTER_WITNESS_DATABASE_WRITE_TIMEOUT = "WitnessDatabaseWriteTimeout"
  CLUSTER_ADD_EVICT_DELAY = "AddEvictDelay"
  CLUSREG_NAME_FIXQUORUM = "FixQuorum"
  CLUSREG_NAME_PREVENTQUORUM = "PreventQuorum"
  CLUSREG_NAME_IGNORE_PERSISTENT_STATE = "IgnorePersistentStateOnStartup"
  CLUSTER_SHARED_VOLUMES_ROOT = "SharedVolumesRoot"
  ENABLE_CLUSTER_SHARED_VOLUMES = "EnableSharedVolumes"
  CLUSTER_SHARED_VOLUME_VSS_WRITER_OPERATION_TIMEOUT = "SharedVolumeVssWriterOperationTimeout"
  USE_CLIENT_ACCESS_NETWORKS_FOR_CSV = "UseClientAccessNetworksForSharedVolumes"
  CLUSTER_CSV_COMPATIBLE_FILTERS = "SharedVolumeCompatibleFilters"
  CLUSTER_CSV_INCOMPATIBLE_FILTERS = "SharedVolumeIncompatibleFilters"
  CLUSTER_GROUP_WAIT_DELAY = "ClusterGroupWaitDelay"
  MINIMUM_PREEMPTOR_PRIORITY = "MinimumPreemptorPriority"
  MINIMUM_NEVER_PREEMPT_PRIORITY = "MinimumNeverPreemptPriority"
  CLUSTER_ENFORCED_ANTIAFFINITY = "ClusterEnforcedAntiaffinity"
  CLUSREG_NAME_SHUTDOWN_TIMEOUT_MINUTES = "ShutdownTimeoutInMinutes"
  CLUSREG_NAME_CSV_MDS_SD = "SharedVolumeSecurityDescriptor"
  CLUSREG_NAME_FAILOVER_MOVE_MIGRATION_TYPE = "FailoverMoveMigrationType"
  CLUSREG_NAME_CSV_BLOCK_CACHE = "BlockCacheSize"
  CLUSREG_NAME_ROUTE_HISTORY_LENGTH = "RouteHistoryLength"
  CLUSREG_NAME_LAST_RECENT_EVENTS_RESET_TIME = "RecentEventsResetTime"
  CLUSREG_NAME_DRAIN_ON_SHUTDOWN = "DrainOnShutdown"
  CLUSREG_NAME_NETFT_IPSEC_ENABLED = "NetftIPSecEnabled"
  CLUSREG_NAME_WITNESS_DYNAMIC_WEIGHT = "WitnessDynamicWeight"
  CLUSREG_NAME_MESSAGE_BUFFER_LENGTH = "MessageBufferLength"
  CLUSREG_NAME_DATABASE_READ_WRITE_MODE = "DatabaseReadWriteMode"
  CLUSREG_NAME_FUNCTIONAL_LEVEL = "ClusterFunctionalLevel"
  CLUSREG_NAME_UPGRADE_VERSION = "ClusterUpgradeVersion"
  CLUSREG_NAME_RESILIENCY_LEVEL = "ResiliencyLevel"
  CLUSREG_NAME_RESILIENCY_DEFAULT_SECONDS = "ResiliencyDefaultPeriod"
  CLUSREG_NAME_QUARANTINE_THRESHOLD = "QuarantineThreshold"
  CLUSREG_NAME_QUARANTINE_DURATION = "QuarantineDuration"
  CLUSTER_S2D_ENABLED = "S2DEnabled"
  CLUSTER_S2D_BUS_TYPES = "S2DBusTypes"
  CLUSTER_S2D_CACHE_PAGE_SIZE_KBYTES = "S2DCachePageSizeKBytes"
  CLUSTER_S2D_OPTIMIZATIONS = "S2DOptimizations"
  CLUSTER_S2D_IO_LATENCY_THRESHOLD = "S2DIOLatencyThreshold"
  CLUSTER_S2D_CACHE_DESIRED_STATE = "S2DCacheDesiredState"
  CLUSTER_S2D_CACHE_METADATA_RESERVE = "S2DCacheMetadataReserveBytes"
  CLUSTER_S2D_CACHE_FLASH_RESERVE_PERCENT = "S2DCacheFlashReservePercent"
  CLUSTER_S2D_CACHE_BEHAVIOR_FLAGS = "S2DCacheBehavior"
  CLUSTER_NAME_PREFERRED_SITE = "PreferredSite"
  CLUSTER_NAME_AUTO_BALANCER_MODE = "AutoBalancerMode"
  CLUSTER_NAME_AUTO_BALANCER_LEVEL = "AutoBalancerLevel"
  CLUSREG_NAME_GROUP_DEPENDENCY_TIMEOUT = "GroupDependencyTimeout"
  CLUSREG_NAME_PLACEMENT_OPTIONS = "PlacementOptions"
  CLUSREG_NAME_ENABLED_EVENT_LOGS = "EnabledEventLogs"
  CLUSREG_NAME_SAME_SUBNET_DELAY = "SameSubnetDelay"
  CLUSREG_NAME_CROSS_SUBNET_DELAY = "CrossSubnetDelay"
  CLUSREG_NAME_CROSS_SITE_DELAY = "CrossSiteDelay"
  CLUSREG_NAME_SAME_SUBNET_THRESHOLD = "SameSubnetThreshold"
  CLUSREG_NAME_CROSS_SUBNET_THRESHOLD = "CrossSubnetThreshold"
  CLUSREG_NAME_CROSS_SITE_THRESHOLD = "CrossSiteThreshold"
  CLUSREG_NAME_PLUMB_ALL_CROSS_SUBNET_ROUTES = "PlumbAllCrossSubnetRoutes"
  CLUSREG_NAME_NODE_NAME = "NodeName"
  CLUSREG_NAME_NODE_HIGHEST_VERSION = "NodeHighestVersion"
  CLUSREG_NAME_NODE_LOWEST_VERSION = "NodeLowestVersion"
  CLUSREG_NAME_NODE_DESC = "Description"
  CLUSREG_NAME_NODE_MAJOR_VERSION = "MajorVersion"
  CLUSREG_NAME_NODE_MINOR_VERSION = "MinorVersion"
  CLUSREG_NAME_NODE_BUILD_NUMBER = "BuildNumber"
  CLUSREG_NAME_NODE_CSDVERSION = "CSDVersion"
  CLUSREG_NAME_NODE_WEIGHT = "NodeWeight"
  CLUSREG_NAME_NODE_DYNAMIC_WEIGHT = "DynamicWeight"
  CLUSREG_NAME_NODE_IS_PRIMARY = "IsPrimary"
  CLUSREG_NAME_NODE_DRAIN_STATUS = "NodeDrainStatus"
  CLUSREG_NAME_NODE_DRAIN_TARGET = "NodeDrainTarget"
  CLUSREG_NAME_NODE_NEEDS_PQ = "NeedsPreventQuorum"
  CLUSREG_NAME_NODE_FDID = "FaultDomainId"
  CLUSREG_NAME_NODE_STATUS_INFO = "StatusInformation"
  CLUSREG_NAME_NODE_FAULT_DOMAIN = "FaultDomain"
  CLUSREG_NAME_NODE_MODEL = "Model"
  CLUSREG_NAME_NODE_SERIALNUMBER = "SerialNumber"
  CLUSREG_NAME_NODE_MANUFACTURER = "Manufacturer"
  CLUSREG_NAME_GRP_NAME = "Name"
  CLUSREG_NAME_GRP_TYPE = "GroupType"
  CLUSREG_NAME_GRP_DESC = "Description"
  CLUSREG_NAME_GRP_PERSISTENT_STATE = "PersistentState"
  CLUSREG_NAME_GRP_FAILBACK_TYPE = "AutoFailbackType"
  CLUSREG_NAME_GRP_FAILBACK_WIN_START = "FailbackWindowStart"
  CLUSREG_NAME_GRP_FAILBACK_WIN_END = "FailbackWindowEnd"
  CLUSREG_NAME_GRP_FAILOVER_THRESHOLD = "FailoverThreshold"
  CLUSREG_NAME_GRP_FAILOVER_PERIOD = "FailoverPeriod"
  CLUSREG_NAME_GRP_PRIORITY = "Priority"
  CLUSREG_NAME_GRP_DEFAULT_OWNER = "DefaultOwner"
  CLUSREG_NAME_GRP_STATUS_INFORMATION = "StatusInformation"
  CLUSREG_NAME_GRP_ANTI_AFFINITY_CLASS_NAME = "AntiAffinityClassNames"
  CLUSREG_NAME_GRP_START_DELAY = "GroupStartDelay"
  CLUSREG_NAME_GRP_CCF_EPOCH = "CCFEpoch"
  CLUSREG_NAME_GRP_CCF_EPOCH_HIGH = "CCFEpochHigh"
  CLUSREG_NAME_GRP_RESILIENCY_PERIOD = "ResiliencyPeriod"
  CLUSREG_NAME_GRP_PREFERRED_SITE = "PreferredSite"
  CLUSREG_NAME_GRP_COLD_START_SETTING = "ColdStartSetting"
  CLUSREG_NAME_GRP_FAULT_DOMAIN = "FaultDomain"
  CLUSREG_NAME_GRP_UPDATE_DOMAIN = "UpdateDomain"
  CLUSREG_NAME_GRP_PLACEMENT_OPTIONS = "PlacementOptions"
  CLUSREG_NAME_GRP_LOCK_MOVE = "LockedFromMoving"
  CLUSREG_NAME_RES_NAME = "Name"
  CLUSREG_NAME_RES_TYPE = "Type"
  CLUSREG_NAME_RES_DESC = "Description"
  CLUSREG_NAME_RES_SEPARATE_MONITOR = "SeparateMonitor"
  CLUSREG_NAME_RES_PERSISTENT_STATE = "PersistentState"
  CLUSREG_NAME_RES_LOOKS_ALIVE = "LooksAlivePollInterval"
  CLUSREG_NAME_RES_IS_ALIVE = "IsAlivePollInterval"
  CLUSREG_NAME_RES_RESTART_ACTION = "RestartAction"
  CLUSREG_NAME_RES_RESTART_THRESHOLD = "RestartThreshold"
  CLUSREG_NAME_RES_RESTART_PERIOD = "RestartPeriod"
  CLUSREG_NAME_RES_RESTART_DELAY = "RestartDelay"
  CLUSREG_NAME_RES_RETRY_PERIOD_ON_FAILURE = "RetryPeriodOnFailure"
  CLUSREG_NAME_RES_EMBEDDED_FAILURE_ACTION = "EmbeddedFailureAction"
  CLUSREG_NAME_RES_PENDING_TIMEOUT = "PendingTimeout"
  CLUSREG_NAME_RES_DEADLOCK_TIMEOUT = "DeadlockTimeout"
  CLUSREG_NAME_RES_MONITOR_PID = "MonitorProcessId"
  CLUSREG_NAME_RES_STATUS_INFORMATION = "StatusInformation"
  CLUSREG_NAME_RES_LAST_OPERATION_STATUS_CODE = "LastOperationStatusCode"
  CLUSREG_NAME_RES_DATA1 = "ResourceSpecificData1"
  CLUSREG_NAME_RES_DATA2 = "ResourceSpecificData2"
  CLUSREG_NAME_RES_STATUS = "ResourceSpecificStatus"
  CLUSREG_NAME_RESTYPE_NAME = "Name"
  CLUSREG_NAME_RESTYPE_DESC = "Description"
  CLUSREG_NAME_RESTYPE_DLL_NAME = "DllName"
  CLUSREG_NAME_RESTYPE_ADMIN_EXTENSIONS = "AdminExtensions"
  CLUSREG_NAME_RESTYPE_LOOKS_ALIVE = "LooksAlivePollInterval"
  CLUSREG_NAME_RESTYPE_IS_ALIVE = "IsAlivePollInterval"
  CLUSREG_NAME_RESTYPE_PENDING_TIMEOUT = "PendingTimeout"
  CLUSREG_NAME_RESTYPE_DEADLOCK_TIMEOUT = "DeadlockTimeout"
  CLUSREG_NAME_RESTYPE_DUMP_POLICY = "DumpPolicy"
  CLUSREG_NAME_RESTYPE_DUMP_LOG_QUERY = "DumpLogQuery"
  CLUSREG_NAME_RESTYPE_DUMP_SERVICES = "DumpServices"
  CLUSREG_NAME_RESTYPE_ENABLED_EVENT_LOGS = "EnabledEventLogs"
  CLUSREG_NAME_RESTYPE_MAX_MONITORS = "MaximumMonitors"
  CLUSREG_NAME_RESTYPE_WPR_START_AFTER = "WprStartAfter"
  CLUSREG_NAME_RESTYPE_WPR_PROFILES = "WprProfiles"
  CLUSREG_NAME_NET_NAME = "Name"
  CLUSREG_NAME_NET_IPV6_ADDRESSES = "IPv6Addresses"
  CLUSREG_NAME_NET_IPV6_PREFIXLENGTHS = "IPv6PrefixLengths"
  CLUSREG_NAME_NET_IPV4_ADDRESSES = "IPv4Addresses"
  CLUSREG_NAME_NET_IPV4_PREFIXLENGTHS = "IPv4PrefixLengths"
  CLUSREG_NAME_NET_ADDRESS = "Address"
  CLUSREG_NAME_NET_ADDRESS_MASK = "AddressMask"
  CLUSREG_NAME_NET_DESC = "Description"
  CLUSREG_NAME_NET_ROLE = "Role"
  CLUSREG_NAME_NET_SPEED = "LinkSpeed"
  CLUSREG_NAME_NET_RDMA_CAPABLE = "RdmaCapable"
  CLUSREG_NAME_NET_RSS_CAPABLE = "RssCapable"
  CLUSREG_NAME_NET_METRIC = "Metric"
  CLUSREG_NAME_NET_AUTOMETRIC = "AutoMetric"
  CLUSREG_NAME_NETIFACE_NAME = "Name"
  CLUSREG_NAME_NETIFACE_NODE = "Node"
  CLUSREG_NAME_NETIFACE_NETWORK = "Network"
  CLUSREG_NAME_NETIFACE_ADAPTER_NAME = "Adapter"
  CLUSREG_NAME_NETIFACE_ADAPTER_ID = "AdapterId"
  CLUSREG_NAME_NETIFACE_DHCP_ENABLED = "DhcpEnabled"
  CLUSREG_NAME_NETIFACE_IPV6_ADDRESSES = "IPv6Addresses"
  CLUSREG_NAME_NETIFACE_IPV4_ADDRESSES = "IPv4Addresses"
  CLUSREG_NAME_NETIFACE_ADDRESS = "Address"
  CLUSREG_NAME_NETIFACE_DESC = "Description"
  CLUSREG_NAME_GROUPSET_NAME = "Name"
  CLUSREG_NAME_GROUPSET_STARTUP_SETTING = "StartupSetting"
  CLUSREG_NAME_GROUPSET_STARTUP_COUNT = "StartupCount"
  CLUSREG_NAME_GROUPSET_STARTUP_DELAY = "StartupDelay"
  CLUSREG_NAME_GROUPSET_IS_GLOBAL = "IsGlobal"
  CLUSREG_NAME_GROUPSET_STATUS_INFORMATION = "StatusInformation"
  CLUSREG_NAME_GROUPSET_IS_AVAILABILITY_SET = "IsAvailabilitySet"
  CLUSREG_NAME_GROUPSET_UPDATE_DOMAINS = "UpdateDomains"
  CLUSREG_NAME_GROUPSET_FAULT_DOMAINS = "FaultDomains"
  CLUSREG_NAME_GROUPSET_RESERVE_NODE = "ReserveSpareNode"
  CLUSREG_NAME_GROUPSET_AVAILABILITY_SET_INDEX_TO_NODE_MAPPING = "NodeDomainInfo"
  CLUSREG_NAME_AFFINITYRULE_NAME = "Name"
  CLUSREG_NAME_AFFINITYRULE_TYPE = "RuleType"
  CLUSREG_NAME_AFFINITYRULE_GROUPS = "Groups"
  CLUSREG_NAME_AFFINITYRULE_ENABLED = "Enabled"
  CLUSREG_NAME_START_MEMORY = "StartMemory"
  CLUSREG_NAME_VIRTUAL_NUMA_COUNT = "VirtualNumaCount"
  CLUSREG_NAME_DDA_DEVICE_ALLOCATIONS = "DdaDeviceAllocations"
  CLUSREG_NAME_GPUP_DEVICE_ALLOCATIONS = "GpupDeviceAllocations"
  CLUSREG_NAME_PHYSDISK_DISKIDTYPE = "DiskIdType"
  CLUSREG_NAME_PHYSDISK_DISKSIGNATURE = "DiskSignature"
  CLUSREG_NAME_PHYSDISK_DISKIDGUID = "DiskIdGuid"
  CLUSREG_NAME_PHYSDISK_DISKRUNCHKDSK = "DiskRunChkDsk"
  CLUSREG_NAME_PHYSDISK_DISKUNIQUEIDS = "DiskUniqueIds"
  CLUSREG_NAME_PHYSDISK_DISKVOLUMEINFO = "DiskVolumeInfo"
  CLUSREG_NAME_PHYSDISK_DISKARBTYPE = "DiskArbType"
  CLUSREG_NAME_PHYSDISK_DISKARBINTERVAL = "DiskArbInterval"
  CLUSREG_NAME_PHYSDISK_DISKPATH = "DiskPath"
  CLUSREG_NAME_PHYSDISK_DISKRELOAD = "DiskReload"
  CLUSREG_NAME_PHYSDISK_MAINTMODE = "MaintenanceMode"
  CLUSREG_NAME_PHYSDISK_DISKIODELAY = "MaxIoLatency"
  CLUSREG_NAME_PHYSDISK_MIGRATEFIXUP = "MigrateDriveLetters"
  CLUSREG_NAME_PHYSDISK_CSVWRITETHROUGH = "CsvEnforceWriteThrough"
  CLUSREG_NAME_PHYSDISK_CSVBLOCKCACHE = "EnableBlockCache"
  CLUSREG_NAME_PHYSDISK_FASTONLINEARBITRATE = "FastOnlineArbitrate"
  CLUSREG_NAME_PHYSDISK_SPACEIDGUID = "VirtualDiskId"
  CLUSREG_NAME_STORAGESPACE_POOLIDGUID = "PoolId"
  CLUSREG_NAME_PHYSDISK_CSVSNAPSHOTDIFFAREASIZE = "SnapshotDiffSize"
  CLUSREG_NAME_PHYSDISK_CSVSNAPSHOTAGELIMIT = "SnapshotAgeLimit"
  CLUSREG_NAME_PHYSDISK_DISKGUID = "DiskGuid"
  CLUSREG_NAME_PHYSDISK_VOLSNAPACTIVATETIMEOUT = "VolsnapActivateTimeout"
  CLUSREG_NAME_PHYSDISK_DISKRECOVERYACTION = "DiskRecoveryAction"
  CLUSREG_NAME_STORAGESPACE_NAME = "VirtualDiskName"
  CLUSREG_NAME_STORAGESPACE_DESCRIPTION = "VirtualDiskDescription"
  CLUSREG_NAME_STORAGESPACE_HEALTH = "VirtualDiskHealth"
  CLUSREG_NAME_STORAGESPACE_STATE = "VirtualDiskState"
  CLUSREG_NAME_STORAGESPACE_PROVISIONING = "VirtualDiskProvisioning"
  CLUSREG_NAME_STORAGESPACE_RESILIENCYTYPE = "VirtualDiskResiliencyType"
  CLUSREG_NAME_STORAGESPACE_RESILIENCYCOLUMNS = "VirtualDiskResiliencyColumns"
  CLUSREG_NAME_STORAGESPACE_RESILIENCYINTERLEAVE = "VirtualDiskResiliencyInterleave"
  CLUSREG_NAME_GENAPP_COMMAND_LINE = "CommandLine"
  CLUSREG_NAME_GENAPP_CURRENT_DIRECTORY = "CurrentDirectory"
  CLUSREG_NAME_GENAPP_USE_NETWORK_NAME = "UseNetworkName"
  CLUSREG_NAME_GENSCRIPT_SCRIPT_FILEPATH = "ScriptFilepath"
  CLUSREG_NAME_GENSVC_SERVICE_NAME = "ServiceName"
  CLUSREG_NAME_GENSVC_STARTUP_PARAMS = "StartupParameters"
  CLUSREG_NAME_GENSVC_USE_NETWORK_NAME = "UseNetworkName"
  CLUSREG_NAME_IPADDR_NETWORK = "Network"
  CLUSREG_NAME_IPADDR_ADDRESS = "Address"
  CLUSREG_NAME_IPADDR_SUBNET_MASK = "SubnetMask"
  CLUSREG_NAME_IPADDR_ENABLE_NETBIOS = "EnableNetBIOS"
  CLUSREG_NAME_IPADDR_OVERRIDE_ADDRMATCH = "OverrideAddressMatch"
  CLUSREG_NAME_IPADDR_ENABLE_DHCP = "EnableDhcp"
  CLUSREG_NAME_IPADDR_LEASE_OBTAINED_TIME = "LeaseObtainedTime"
  CLUSREG_NAME_IPADDR_LEASE_TERMINATES_TIME = "LeaseExpiresTime"
  CLUSREG_NAME_IPADDR_T1 = "T1"
  CLUSREG_NAME_IPADDR_T2 = "T2"
  CLUSREG_NAME_IPADDR_DHCP_SERVER = "DhcpServer"
  CLUSREG_NAME_IPADDR_DHCP_ADDRESS = "DhcpAddress"
  CLUSREG_NAME_IPADDR_DHCP_SUBNET_MASK = "DhcpSubnetMask"
  CLUSREG_NAME_IPADDR_SHARED_NETNAME = "SharedNetname"
  CLUSREG_NAME_IPADDR_PROBE_PORT = "ProbePort"
  CLUSREG_NAME_IPADDR_PROBE_FAILURE_THRESHOLD = "ProbeFailureThreshold"
  CLUSREG_NAME_IPV6_NATIVE_NETWORK = "Network"
  CLUSREG_NAME_IPV6_NATIVE_ADDRESS = "Address"
  CLUSREG_NAME_IPV6_NATIVE_PREFIX_LENGTH = "PrefixLength"
  CLUSREG_NAME_IPV6_TUNNEL_ADDRESS = "Address"
  CLUSREG_NAME_IPV6_TUNNEL_TUNNELTYPE = "TunnelType"
  CLUSREG_NAME_NETNAME_NAME = "Name"
  CLUSREG_NAME_NETNAME_CREATING_DC = "CreatingDC"
  CLUSREG_NAME_NETNAME_OBJECT_ID = "ObjectGUID"
  CLUSREG_NAME_NETNAME_DNS_NAME = "DnsName"
  CLUSREG_NAME_NETNAME_REMAP_PIPE_NAMES = "RemapPipeNames"
  CLUSREG_NAME_NETNAME_RESOURCE_DATA = "ResourceData"
  CLUSREG_NAME_NETNAME_STATUS_NETBIOS = "StatusNetBIOS"
  CLUSREG_NAME_NETNAME_STATUS_DNS = "StatusDNS"
  CLUSREG_NAME_NETNAME_STATUS_KERBEROS = "StatusKerberos"
  CLUSREG_NAME_NETNAME_VCO_CONTAINER = "VcoContainer"
  CLUSREG_NAME_NETNAME_LAST_DNS_UPDATE = "LastDNSUpdateTime"
  CLUSREG_NAME_NETNAME_CONTAINERGUID = "CryptoContainerGUID"
  CLUSREG_NAME_NETNAME_HOST_TTL = "HostRecordTTL"
  CLUSREG_NAME_NETNAME_PUBLISH_PTR = "PublishPTRRecords"
  CLUSREG_NAME_NETNAME_REMOVEVCO_ONDELETE = "DeleteVcoOnResCleanup"
  CLUSREG_NAME_NETNAME_REGISTER_ALL_IP = "RegisterAllProvidersIP"
  CLUSREG_KEYNAME_OBJECTGUIDS = "ObjectGUIDs"
  CLUSREG_NAME_NETNAME_EXCLUDE_NETWORKS = "ExcludeNetworks"
  CLUSREG_NAME_NETNAME_ALIASES = "Aliases"
  CLUSREG_NAME_NETNAME_IN_USE_NETWORKS = "InUseNetworks"
  CLUSREG_NAME_NETNAME_DNS_SUFFIX = "DnsSuffix"
  CLUSREG_NAME_NETNAME_AD_AWARE = "ADAware"
  CLUSREG_NAME_NETNAME_DNN_DISABLE_CLONES = "DisableClones"
  CLUSREG_NAME_PRTSPOOL_DEFAULT_SPOOL_DIR = "DefaultSpoolDirectory"
  CLUSREG_NAME_PRTSPOOL_TIMEOUT = "JobCompletionTimeout"
  CLUSREG_NAME_FILESHR_SERVER_NAME = "ServerName"
  CLUSREG_NAME_FILESHR_SHARE_NAME = "ShareName"
  CLUSREG_NAME_FILESHR_PATH = "Path"
  CLUSREG_NAME_FILESHR_REMARK = "Remark"
  CLUSREG_NAME_FILESHR_MAX_USERS = "MaxUsers"
  CLUSREG_NAME_FILESHR_SD = "Security Descriptor"
  CLUSREG_NAME_FILESHR_SHARE_SUBDIRS = "ShareSubDirs"
  CLUSREG_NAME_FILESHR_HIDE_SUBDIR_SHARES = "HideSubDirShares"
  CLUSREG_NAME_FILESHR_IS_DFS_ROOT = "IsDfsRoot"
  CLUSREG_NAME_FILESHR_SHARE_FLAGS = "ShareFlags"
  CLUSREG_NAME_FILESHR_CA_TIMEOUT = "CATimeout"
  CLUSREG_NAME_DHCP_DATABASE_PATH = "DatabasePath"
  CLUSREG_NAME_DHCP_BACKUP_PATH = "BackupPath"
  CLUSREG_NAME_LOG_FILE_PATH = "LogFilePath"
  CLUSREG_NAME_WINS_DATABASE_PATH = "DatabasePath"
  CLUSREG_NAME_WINS_BACKUP_PATH = "BackupPath"
  CLUSREG_NAME_VSSTASK_CURRENTDIRECTORY = "CurrentDirectory"
  CLUSREG_NAME_VSSTASK_APPNAME = "ApplicationName"
  CLUSREG_NAME_VSSTASK_APPPARAMS = "ApplicationParams"
  CLUSREG_NAME_VSSTASK_TRIGGERARRAY = "TriggerArray"
  CLUSREG_NAME_FSWITNESS_SHARE_PATH = "SharePath"
  CLUSREG_NAME_FSWITNESS_ARB_DELAY = "ArbitrationDelay"
  CLUSREG_NAME_FSWITNESS_IMPERSONATE_CNO = "ImpersonateCNO"
  CLUSREG_NAME_STORAGESPACE_POOLNAME = "Name"
  CLUSREG_NAME_STORAGESPACE_POOLDESC = "Description"
  CLUSREG_NAME_STORAGESPACE_POOLDRIVEIDS = "DriveIds"
  CLUSREG_NAME_STORAGESPACE_POOLHEALTH = "Health"
  CLUSREG_NAME_STORAGESPACE_POOLSTATE = "State"
  CLUSREG_NAME_STORAGESPACE_POOLTOTALCAPACITY = "TotalCapacity"
  CLUSREG_NAME_STORAGESPACE_POOLCONSUMEDCAPACITY = "ConsumedCapacity"
  CLUSREG_NAME_STORAGESPACE_POOLARBITRATE = "Arbitrate"
  CLUSREG_NAME_STORAGESPACE_POOLREEVALTIMEOUT = "ReEvaluatePlacementTimeout"
  CLUSREG_NAME_STORAGESPACE_POOLQUORUMSHARE = "PoolQuorumShare"
  CLUSREG_NAME_STORAGESPACE_POOLQUORUMUSERACCOUNT = "PoolQuorumUserAccount"
  CLUSREG_NAME_SOFS_SMBASYMMETRYMODE = "SmbAsymmetryMode"
  CLUSREG_NAME_VIP_PREFIX_LENGTH = "PrefixLength"
  CLUSREG_NAME_VIP_ADAPTER_NAME = "AdapterName"
  CLUSREG_NAME_VIP_ADDRESS = "Address"
  CLUSREG_NAME_VIP_VSID = "VSID"
  CLUSREG_NAME_VIP_RDID = "RDID"
  CLUSREG_NAME_CLOUDWITNESS_PRIMARY_TOKEN = "PrimaryToken"
  CLUSREG_NAME_CLOUDWITNESS_PRIMARY_KEY = "PrimaryKey"
  CLUSREG_NAME_CLOUDWITNESS_ACCOUNT_NAME = "AccountName"
  CLUSREG_NAME_CLOUDWITNESS_ENDPOINT_INFO = "EndpointInfo"
  CLUSREG_NAME_CLOUDWITNESS_CONTAINER_NAME = "ContainerName"
  CLOUD_WITNESS_CONTAINER_NAME = "msft-cloud-witness"
  CLUS_NAME_RES_TYPE_SOURCE_RESID = "SourceResourceId"
  CLUS_NAME_RES_TYPE_TARGET_RESID = "TargetResourceId"
  CLUS_NAME_RES_TYPE_SOURCE_VOLUMES = "SourceVolumes"
  CLUS_NAME_RES_TYPE_TARGET_VOLUMES = "TargetVolumes"
  CLUS_NAME_RES_TYPE_DATA_RESID = "DataResourceId"
  CLUS_NAME_RES_TYPE_LOG_RESID = "LogResourceId"
  CLUS_NAME_RES_TYPE_LOG_VOLUME = "LogVolume"
  CLUS_NAME_RES_TYPE_REPLICATION_GROUPID = "ReplicationGroupId"
  CLUS_NAME_RES_TYPE_CLUSTER_GROUPID = "ClusterGroupId"
  CLUS_NAME_RES_TYPE_REPLICATION_GROUP_TYPE = "ReplicationClusterGroupType"
  CLUS_NAME_RES_TYPE_MINIMUM_LOG_SIZE = "MinimumLogSizeInBytes"
  CLUS_NAME_RES_TYPE_UNIT_LOG_SIZE_CHANGE = "UnitOfLogSizeChangeInBytes"
  CLUS_NAME_RES_TYPE_LOG_MULTIPLE = "LogSizeMultiple"
  SR_REPLICATED_PARTITION_DISALLOW_MULTINODE_IO = 1_u32
  CLUSCTL_RESOURCE_TYPE_STORAGE_GET_AVAILABLE_DISKS_EX2_FLAG_ADD_VOLUME_INFO = 1_u32
  CLUSCTL_RESOURCE_TYPE_STORAGE_GET_AVAILABLE_DISKS_EX2_FLAG_FILTER_BY_POOL = 2_u32
  CLUSCTL_RESOURCE_TYPE_STORAGE_GET_AVAILABLE_DISKS_EX2_FLAG_INCLUDE_NON_SHARED_DISKS = 4_u32
  STARTUP_ROUTINE = "Startup"
  CLRES_VERSION_V1_00 = 256_u32
  STARTUP_EX_ROUTINE = "StartupEx"
  CLRES_VERSION_V2_00 = 512_u32
  CLRES_VERSION_V3_00 = 768_u32
  CLRES_VERSION_V4_00 = 1024_u32
  CLUSCTL_GET_OPERATION_CONTEXT_PARAMS_VERSION_1 = 1_u32
  CLUSRES_NAME_GET_OPERATION_CONTEXT_FLAGS = "Flags"
  CLUSRESDLL_STATUS_OFFLINE_BUSY = 1_u32
  CLUSRESDLL_STATUS_OFFLINE_SOURCE_THROTTLED = 2_u32
  CLUSRESDLL_STATUS_OFFLINE_DESTINATION_THROTTLED = 4_u32
  CLUSRESDLL_STATUS_OFFLINE_DESTINATION_REJECTED = 8_u32
  CLUSRESDLL_STATUS_INSUFFICIENT_MEMORY = 16_u32
  CLUSRESDLL_STATUS_INSUFFICIENT_PROCESSOR = 32_u32
  CLUSRESDLL_STATUS_INSUFFICIENT_OTHER_RESOURCES = 64_u32
  CLUSRESDLL_STATUS_INVALID_PARAMETERS = 128_u32
  CLUSRESDLL_STATUS_NETWORK_NOT_AVAILABLE = 256_u32
  CLUSRESDLL_STATUS_DO_NOT_COLLECT_WER_REPORT = 1073741824_u32
  CLUSRESDLL_STATUS_DUMP_NOW = 2147483648_u32
  CLUS_RESDLL_OPEN_RECOVER_MONITOR_STATE = 1_u32
  CLUS_RESDLL_ONLINE_RECOVER_MONITOR_STATE = 1_u32
  CLUS_RESDLL_ONLINE_IGNORE_RESOURCE_STATUS = 2_u32
  CLUS_RESDLL_ONLINE_RETURN_TO_SOURCE_NODE_ON_ERROR = 4_u32
  CLUS_RESDLL_ONLINE_RESTORE_ONLINE_STATE = 8_u32
  CLUS_RESDLL_ONLINE_IGNORE_NETWORK_CONNECTIVITY = 16_u32
  CLUS_RESDLL_OFFLINE_IGNORE_RESOURCE_STATUS = 1_u32
  CLUS_RESDLL_OFFLINE_RETURN_TO_SOURCE_NODE_ON_ERROR = 2_u32
  CLUS_RESDLL_OFFLINE_QUEUE_ENABLED = 4_u32
  CLUS_RESDLL_OFFLINE_RETURNING_TO_SOURCE_NODE_BECAUSE_OF_ERROR = 8_u32
  CLUS_RESDLL_OFFLINE_DUE_TO_EMBEDDED_FAILURE = 16_u32
  CLUS_RESDLL_OFFLINE_IGNORE_NETWORK_CONNECTIVITY = 32_u32
  CLUS_RESDLL_OFFLINE_DO_NOT_UPDATE_PERSISTENT_STATE = 64_u32
  CLUS_RESDLL_OPEN_DONT_DELETE_TEMP_DISK = 2_u32
  RESTYPE_MONITOR_SHUTTING_DOWN_NODE_STOP = 1_u32
  RESTYPE_MONITOR_SHUTTING_DOWN_CLUSSVC_CRASH = 2_u32
  RESUTIL_PROPITEM_READ_ONLY = 1_u32
  RESUTIL_PROPITEM_REQUIRED = 2_u32
  RESUTIL_PROPITEM_SIGNED = 4_u32
  RESUTIL_PROPITEM_IN_MEMORY = 8_u32
  LOCKED_MODE_FLAGS_DONT_REMOVE_FROM_MOVE_QUEUE = 1_u32
  CLUSTER_HEALTH_FAULT_PROPERTY_NAME = "ClusterHealth"
  CLUSTER_HEALTH_FAULT_ARGS = 7_u32
  CLUSTER_HEALTH_FAULT_ID = 0_u32
  CLUSTER_HEALTH_FAULT_ERRORTYPE = 1_u32
  CLUSTER_HEALTH_FAULT_ERRORCODE = 2_u32
  CLUSTER_HEALTH_FAULT_DESCRIPTION = 3_u32
  CLUSTER_HEALTH_FAULT_PROVIDER = 4_u32
  CLUSTER_HEALTH_FAULT_FLAGS = 5_u32
  CLUSTER_HEALTH_FAULT_RESERVED = 6_u32
  CLUSTER_HEALTH_FAULT_ID_LABEL = "Id"
  CLUSTER_HEALTH_FAULT_ERRORTYPE_LABEL = "ErrorType"
  CLUSTER_HEALTH_FAULT_ERRORCODE_LABEL = "ErrorCode"
  CLUSTER_HEALTH_FAULT_DESCRIPTION_LABEL = "Description"
  CLUSTER_HEALTH_FAULT_PROVIDER_LABEL = "Provider"
  CLUSTER_HEALTH_FAULT_FLAGS_LABEL = "Flags"
  CLUSTER_HEALTH_FAULT_RESERVED_LABEL = "Reserved"
  CLUS_CREATE_CRYPT_CONTAINER_NOT_FOUND = 1_u32
  SET_APPINSTANCE_CSV_FLAGS_VALID_ONLY_IF_CSV_COORDINATOR = 1_u32

  CLSID_ClusApplication = LibC::GUID.new(0xf2e606e5_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])

  CLSID_Cluster = LibC::GUID.new(0xf2e606e3_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])

  CLSID_ClusVersion = LibC::GUID.new(0xf2e60715_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])

  CLSID_ClusResType = LibC::GUID.new(0xf2e6070f_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])

  CLSID_ClusProperty = LibC::GUID.new(0xf2e606fd_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])

  CLSID_ClusProperties = LibC::GUID.new(0xf2e606ff_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])

  CLSID_DomainNames = LibC::GUID.new(0xf2e606e1_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])

  CLSID_ClusNetwork = LibC::GUID.new(0xf2e606f1_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])

  CLSID_ClusNetInterface = LibC::GUID.new(0xf2e606ed_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])

  CLSID_ClusNetInterfaces = LibC::GUID.new(0xf2e606ef_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])

  CLSID_ClusResDependencies = LibC::GUID.new(0xf2e60703_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])

  CLSID_ClusResGroupResources = LibC::GUID.new(0xf2e606e9_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])

  CLSID_ClusResTypeResources = LibC::GUID.new(0xf2e60713_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])

  CLSID_ClusResGroupPreferredOwnerNodes = LibC::GUID.new(0xf2e606e7_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])

  CLSID_ClusResPossibleOwnerNodes = LibC::GUID.new(0xf2e6070d_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])

  CLSID_ClusNetworks = LibC::GUID.new(0xf2e606f3_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])

  CLSID_ClusNetworkNetInterfaces = LibC::GUID.new(0xf2e606f5_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])

  CLSID_ClusNodeNetInterfaces = LibC::GUID.new(0xf2e606fb_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])

  CLSID_ClusRefObject = LibC::GUID.new(0xf2e60701_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])

  CLSID_ClusterNames = LibC::GUID.new(0xf2e606eb_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])

  CLSID_ClusNode = LibC::GUID.new(0xf2e606f7_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])

  CLSID_ClusNodes = LibC::GUID.new(0xf2e606f9_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])

  CLSID_ClusResGroup = LibC::GUID.new(0xf2e60705_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])

  CLSID_ClusResGroups = LibC::GUID.new(0xf2e60707_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])

  CLSID_ClusResource = LibC::GUID.new(0xf2e60709_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])

  CLSID_ClusResources = LibC::GUID.new(0xf2e6070b_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])

  CLSID_ClusResTypes = LibC::GUID.new(0xf2e60711_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])

  CLSID_ClusResTypePossibleOwnerNodes = LibC::GUID.new(0xf2e60717_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])

  CLSID_ClusPropertyValue = LibC::GUID.new(0xf2e60719_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])

  CLSID_ClusPropertyValues = LibC::GUID.new(0xf2e6071b_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])

  CLSID_ClusPropertyValueData = LibC::GUID.new(0xf2e6071d_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])

  CLSID_ClusPartition = LibC::GUID.new(0xf2e6071f_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])

  CLSID_ClusPartitionEx = LibC::GUID.new(0x53d51d26_u32, 0xb51b_u16, 0x4a79_u16, StaticArray[0xb2_u8, 0xc3_u8, 0x50_u8, 0x48_u8, 0xd9_u8, 0x3a_u8, 0x98_u8, 0xfc_u8])

  CLSID_ClusPartitions = LibC::GUID.new(0xf2e60721_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])

  CLSID_ClusDisk = LibC::GUID.new(0xf2e60723_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])

  CLSID_ClusDisks = LibC::GUID.new(0xf2e60725_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])

  CLSID_ClusScsiAddress = LibC::GUID.new(0xf2e60727_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])

  CLSID_ClusRegistryKeys = LibC::GUID.new(0xf2e60729_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])

  CLSID_ClusCryptoKeys = LibC::GUID.new(0xf2e6072b_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])

  CLSID_ClusResDependents = LibC::GUID.new(0xf2e6072d_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])

  enum CLUSTER_QUORUM_TYPE
    OperationalQuorum = 0_i32
    ModifyQuorum = 1_i32
  end
  enum NODE_CLUSTER_STATE
    ClusterStateNotInstalled = 0_i32
    ClusterStateNotConfigured = 1_i32
    ClusterStateNotRunning = 3_i32
    ClusterStateRunning = 19_i32
  end
  enum CLUSTER_RESOURCE_STATE_CHANGE_REASON
    Eresourcestatechangereasonunknown = 0_i32
    Eresourcestatechangereasonmove = 1_i32
    Eresourcestatechangereasonfailover = 2_i32
    Eresourcestatechangereasonfailedmove = 3_i32
    Eresourcestatechangereasonshutdown = 4_i32
    Eresourcestatechangereasonrundown = 5_i32
  end
  enum CLUSTER_REG_COMMAND
    CLUSREG_COMMAND_NONE = 0_i32
    CLUSREG_SET_VALUE = 1_i32
    CLUSREG_CREATE_KEY = 2_i32
    CLUSREG_DELETE_KEY = 3_i32
    CLUSREG_DELETE_VALUE = 4_i32
    CLUSREG_SET_KEY_SECURITY = 5_i32
    CLUSREG_VALUE_DELETED = 6_i32
    CLUSREG_READ_KEY = 7_i32
    CLUSREG_READ_VALUE = 8_i32
    CLUSREG_READ_ERROR = 9_i32
    CLUSREG_CONTROL_COMMAND = 10_i32
    CLUSREG_CONDITION_EXISTS = 11_i32
    CLUSREG_CONDITION_NOT_EXISTS = 12_i32
    CLUSREG_CONDITION_IS_EQUAL = 13_i32
    CLUSREG_CONDITION_IS_NOT_EQUAL = 14_i32
    CLUSREG_CONDITION_IS_GREATER_THAN = 15_i32
    CLUSREG_CONDITION_IS_LESS_THAN = 16_i32
    CLUSREG_CONDITION_KEY_EXISTS = 17_i32
    CLUSREG_CONDITION_KEY_NOT_EXISTS = 18_i32
    CLUSREG_LAST_COMMAND = 19_i32
  end
  enum CLUSGROUP_TYPE
    ClusGroupTypeCoreCluster = 1_i32
    ClusGroupTypeAvailableStorage = 2_i32
    ClusGroupTypeTemporary = 3_i32
    ClusGroupTypeSharedVolume = 4_i32
    ClusGroupTypeStoragePool = 5_i32
    ClusGroupTypeFileServer = 100_i32
    ClusGroupTypePrintServer = 101_i32
    ClusGroupTypeDhcpServer = 102_i32
    ClusGroupTypeDtc = 103_i32
    ClusGroupTypeMsmq = 104_i32
    ClusGroupTypeWins = 105_i32
    ClusGroupTypeStandAloneDfs = 106_i32
    ClusGroupTypeGenericApplication = 107_i32
    ClusGroupTypeGenericService = 108_i32
    ClusGroupTypeGenericScript = 109_i32
    ClusGroupTypeIScsiNameService = 110_i32
    ClusGroupTypeVirtualMachine = 111_i32
    ClusGroupTypeTsSessionBroker = 112_i32
    ClusGroupTypeIScsiTarget = 113_i32
    ClusGroupTypeScaleoutFileServer = 114_i32
    ClusGroupTypeVMReplicaBroker = 115_i32
    ClusGroupTypeTaskScheduler = 116_i32
    ClusGroupTypeClusterUpdateAgent = 117_i32
    ClusGroupTypeScaleoutCluster = 118_i32
    ClusGroupTypeStorageReplica = 119_i32
    ClusGroupTypeVMReplicaCoordinator = 120_i32
    ClusGroupTypeCrossClusterOrchestrator = 121_i32
    ClusGroupTypeInfrastructureFileServer = 122_i32
    ClusGroupTypeCoreSddc = 123_i32
    ClusGroupTypeUnknown = 9999_i32
  end
  enum CLUSTER_MGMT_POINT_TYPE
    CLUSTER_MGMT_POINT_TYPE_NONE = 0_i32
    CLUSTER_MGMT_POINT_TYPE_CNO = 1_i32
    CLUSTER_MGMT_POINT_TYPE_DNS_ONLY = 2_i32
    CLUSTER_MGMT_POINT_TYPE_CNO_ONLY = 3_i32
  end
  enum CLUSTER_MGMT_POINT_RESTYPE
    CLUSTER_MGMT_POINT_RESTYPE_AUTO = 0_i32
    CLUSTER_MGMT_POINT_RESTYPE_SNN = 1_i32
    CLUSTER_MGMT_POINT_RESTYPE_DNN = 2_i32
  end
  enum CLUSTER_CLOUD_TYPE
    CLUSTER_CLOUD_TYPE_NONE = 0_i32
    CLUSTER_CLOUD_TYPE_AZURE = 1_i32
    CLUSTER_CLOUD_TYPE_MIXED = 128_i32
    CLUSTER_CLOUD_TYPE_UNKNOWN = -1_i32
  end
  enum CLUS_GROUP_START_SETTING
    CLUS_GROUP_START_ALWAYS = 0_i32
    CLUS_GROUP_DO_NOT_START = 1_i32
    CLUS_GROUP_START_ALLOWED = 2_i32
  end
  enum CLUS_AFFINITY_RULE_TYPE
    CLUS_AFFINITY_RULE_NONE = 0_i32
    CLUS_AFFINITY_RULE_SAME_FAULT_DOMAIN = 1_i32
    CLUS_AFFINITY_RULE_SAME_NODE = 2_i32
    CLUS_AFFINITY_RULE_DIFFERENT_FAULT_DOMAIN = 3_i32
    CLUS_AFFINITY_RULE_DIFFERENT_NODE = 4_i32
    CLUS_AFFINITY_RULE_MIN = 0_i32
    CLUS_AFFINITY_RULE_MAX = 4_i32
  end
  enum CLUSTER_QUORUM_VALUE
    CLUSTER_QUORUM_MAINTAINED = 0_i32
    CLUSTER_QUORUM_LOST = 1_i32
  end
  enum CLUSTER_UPGRADE_PHASE
    ClusterUpgradePhaseInitialize = 1_i32
    ClusterUpgradePhaseValidatingUpgrade = 2_i32
    ClusterUpgradePhaseUpgradingComponents = 3_i32
    ClusterUpgradePhaseInstallingNewComponents = 4_i32
    ClusterUpgradePhaseUpgradeComplete = 5_i32
  end
  enum CLUSTER_CHANGE
    CLUSTER_CHANGE_NODE_STATE = 1_i32
    CLUSTER_CHANGE_NODE_DELETED = 2_i32
    CLUSTER_CHANGE_NODE_ADDED = 4_i32
    CLUSTER_CHANGE_NODE_PROPERTY = 8_i32
    CLUSTER_CHANGE_REGISTRY_NAME = 16_i32
    CLUSTER_CHANGE_REGISTRY_ATTRIBUTES = 32_i32
    CLUSTER_CHANGE_REGISTRY_VALUE = 64_i32
    CLUSTER_CHANGE_REGISTRY_SUBTREE = 128_i32
    CLUSTER_CHANGE_RESOURCE_STATE = 256_i32
    CLUSTER_CHANGE_RESOURCE_DELETED = 512_i32
    CLUSTER_CHANGE_RESOURCE_ADDED = 1024_i32
    CLUSTER_CHANGE_RESOURCE_PROPERTY = 2048_i32
    CLUSTER_CHANGE_GROUP_STATE = 4096_i32
    CLUSTER_CHANGE_GROUP_DELETED = 8192_i32
    CLUSTER_CHANGE_GROUP_ADDED = 16384_i32
    CLUSTER_CHANGE_GROUP_PROPERTY = 32768_i32
    CLUSTER_CHANGE_RESOURCE_TYPE_DELETED = 65536_i32
    CLUSTER_CHANGE_RESOURCE_TYPE_ADDED = 131072_i32
    CLUSTER_CHANGE_RESOURCE_TYPE_PROPERTY = 262144_i32
    CLUSTER_CHANGE_CLUSTER_RECONNECT = 524288_i32
    CLUSTER_CHANGE_NETWORK_STATE = 1048576_i32
    CLUSTER_CHANGE_NETWORK_DELETED = 2097152_i32
    CLUSTER_CHANGE_NETWORK_ADDED = 4194304_i32
    CLUSTER_CHANGE_NETWORK_PROPERTY = 8388608_i32
    CLUSTER_CHANGE_NETINTERFACE_STATE = 16777216_i32
    CLUSTER_CHANGE_NETINTERFACE_DELETED = 33554432_i32
    CLUSTER_CHANGE_NETINTERFACE_ADDED = 67108864_i32
    CLUSTER_CHANGE_NETINTERFACE_PROPERTY = 134217728_i32
    CLUSTER_CHANGE_QUORUM_STATE = 268435456_i32
    CLUSTER_CHANGE_CLUSTER_STATE = 536870912_i32
    CLUSTER_CHANGE_CLUSTER_PROPERTY = 1073741824_i32
    CLUSTER_CHANGE_HANDLE_CLOSE = -2147483648_i32
    CLUSTER_CHANGE_ALL = -1_i32
  end
  enum CLUSTER_NOTIFICATIONS_VERSION
    CLUSTER_NOTIFICATIONS_V1 = 1_i32
    CLUSTER_NOTIFICATIONS_V2 = 2_i32
  end
  enum CLUSTER_CHANGE_CLUSTER_V2
    CLUSTER_CHANGE_CLUSTER_RECONNECT_V2 = 1_i32
    CLUSTER_CHANGE_CLUSTER_STATE_V2 = 2_i32
    CLUSTER_CHANGE_CLUSTER_GROUP_ADDED_V2 = 4_i32
    CLUSTER_CHANGE_CLUSTER_HANDLE_CLOSE_V2 = 8_i32
    CLUSTER_CHANGE_CLUSTER_NETWORK_ADDED_V2 = 16_i32
    CLUSTER_CHANGE_CLUSTER_NODE_ADDED_V2 = 32_i32
    CLUSTER_CHANGE_CLUSTER_RESOURCE_TYPE_ADDED_V2 = 64_i32
    CLUSTER_CHANGE_CLUSTER_COMMON_PROPERTY_V2 = 128_i32
    CLUSTER_CHANGE_CLUSTER_PRIVATE_PROPERTY_V2 = 256_i32
    CLUSTER_CHANGE_CLUSTER_LOST_NOTIFICATIONS_V2 = 512_i32
    CLUSTER_CHANGE_CLUSTER_RENAME_V2 = 1024_i32
    CLUSTER_CHANGE_CLUSTER_MEMBERSHIP_V2 = 2048_i32
    CLUSTER_CHANGE_CLUSTER_UPGRADED_V2 = 4096_i32
    CLUSTER_CHANGE_CLUSTER_ALL_V2 = 8191_i32
  end
  enum CLUSTER_CHANGE_GROUP_V2
    CLUSTER_CHANGE_GROUP_DELETED_V2 = 1_i32
    CLUSTER_CHANGE_GROUP_COMMON_PROPERTY_V2 = 2_i32
    CLUSTER_CHANGE_GROUP_PRIVATE_PROPERTY_V2 = 4_i32
    CLUSTER_CHANGE_GROUP_STATE_V2 = 8_i32
    CLUSTER_CHANGE_GROUP_OWNER_NODE_V2 = 16_i32
    CLUSTER_CHANGE_GROUP_PREFERRED_OWNERS_V2 = 32_i32
    CLUSTER_CHANGE_GROUP_RESOURCE_ADDED_V2 = 64_i32
    CLUSTER_CHANGE_GROUP_RESOURCE_GAINED_V2 = 128_i32
    CLUSTER_CHANGE_GROUP_RESOURCE_LOST_V2 = 256_i32
    CLUSTER_CHANGE_GROUP_HANDLE_CLOSE_V2 = 512_i32
    CLUSTER_CHANGE_GROUP_ALL_V2 = 1023_i32
  end
  enum CLUSTER_CHANGE_GROUPSET_V2
    CLUSTER_CHANGE_GROUPSET_DELETED_v2 = 1_i32
    CLUSTER_CHANGE_GROUPSET_COMMON_PROPERTY_V2 = 2_i32
    CLUSTER_CHANGE_GROUPSET_PRIVATE_PROPERTY_V2 = 4_i32
    CLUSTER_CHANGE_GROUPSET_STATE_V2 = 8_i32
    CLUSTER_CHANGE_GROUPSET_GROUP_ADDED = 16_i32
    CLUSTER_CHANGE_GROUPSET_GROUP_REMOVED = 32_i32
    CLUSTER_CHANGE_GROUPSET_DEPENDENCIES_V2 = 64_i32
    CLUSTER_CHANGE_GROUPSET_DEPENDENTS_V2 = 128_i32
    CLUSTER_CHANGE_GROUPSET_HANDLE_CLOSE_v2 = 256_i32
    CLUSTER_CHANGE_GROUPSET_ALL_V2 = 511_i32
  end
  enum CLUSTER_CHANGE_RESOURCE_V2
    CLUSTER_CHANGE_RESOURCE_COMMON_PROPERTY_V2 = 1_i32
    CLUSTER_CHANGE_RESOURCE_PRIVATE_PROPERTY_V2 = 2_i32
    CLUSTER_CHANGE_RESOURCE_STATE_V2 = 4_i32
    CLUSTER_CHANGE_RESOURCE_OWNER_GROUP_V2 = 8_i32
    CLUSTER_CHANGE_RESOURCE_DEPENDENCIES_V2 = 16_i32
    CLUSTER_CHANGE_RESOURCE_DEPENDENTS_V2 = 32_i32
    CLUSTER_CHANGE_RESOURCE_POSSIBLE_OWNERS_V2 = 64_i32
    CLUSTER_CHANGE_RESOURCE_DELETED_V2 = 128_i32
    CLUSTER_CHANGE_RESOURCE_DLL_UPGRADED_V2 = 256_i32
    CLUSTER_CHANGE_RESOURCE_HANDLE_CLOSE_V2 = 512_i32
    CLUSTER_CHANGE_RESOURCE_TERMINAL_STATE_V2 = 1024_i32
    CLUSTER_CHANGE_RESOURCE_ALL_V2 = 2047_i32
  end
  enum CLUSTER_CHANGE_RESOURCE_TYPE_V2
    CLUSTER_CHANGE_RESOURCE_TYPE_DELETED_V2 = 1_i32
    CLUSTER_CHANGE_RESOURCE_TYPE_COMMON_PROPERTY_V2 = 2_i32
    CLUSTER_CHANGE_RESOURCE_TYPE_PRIVATE_PROPERTY_V2 = 4_i32
    CLUSTER_CHANGE_RESOURCE_TYPE_POSSIBLE_OWNERS_V2 = 8_i32
    CLUSTER_CHANGE_RESOURCE_TYPE_DLL_UPGRADED_V2 = 16_i32
    CLUSTER_RESOURCE_TYPE_SPECIFIC_V2 = 32_i32
    CLUSTER_CHANGE_RESOURCE_TYPE_ALL_V2 = 63_i32
  end
  enum CLUSTER_CHANGE_NETINTERFACE_V2
    CLUSTER_CHANGE_NETINTERFACE_DELETED_V2 = 1_i32
    CLUSTER_CHANGE_NETINTERFACE_COMMON_PROPERTY_V2 = 2_i32
    CLUSTER_CHANGE_NETINTERFACE_PRIVATE_PROPERTY_V2 = 4_i32
    CLUSTER_CHANGE_NETINTERFACE_STATE_V2 = 8_i32
    CLUSTER_CHANGE_NETINTERFACE_HANDLE_CLOSE_V2 = 16_i32
    CLUSTER_CHANGE_NETINTERFACE_ALL_V2 = 31_i32
  end
  enum CLUSTER_CHANGE_NETWORK_V2
    CLUSTER_CHANGE_NETWORK_DELETED_V2 = 1_i32
    CLUSTER_CHANGE_NETWORK_COMMON_PROPERTY_V2 = 2_i32
    CLUSTER_CHANGE_NETWORK_PRIVATE_PROPERTY_V2 = 4_i32
    CLUSTER_CHANGE_NETWORK_STATE_V2 = 8_i32
    CLUSTER_CHANGE_NETWORK_HANDLE_CLOSE_V2 = 16_i32
    CLUSTER_CHANGE_NETWORK_ALL_V2 = 31_i32
  end
  enum CLUSTER_CHANGE_NODE_V2
    CLUSTER_CHANGE_NODE_NETINTERFACE_ADDED_V2 = 1_i32
    CLUSTER_CHANGE_NODE_DELETED_V2 = 2_i32
    CLUSTER_CHANGE_NODE_COMMON_PROPERTY_V2 = 4_i32
    CLUSTER_CHANGE_NODE_PRIVATE_PROPERTY_V2 = 8_i32
    CLUSTER_CHANGE_NODE_STATE_V2 = 16_i32
    CLUSTER_CHANGE_NODE_GROUP_GAINED_V2 = 32_i32
    CLUSTER_CHANGE_NODE_GROUP_LOST_V2 = 64_i32
    CLUSTER_CHANGE_NODE_HANDLE_CLOSE_V2 = 128_i32
    CLUSTER_CHANGE_NODE_ALL_V2 = 255_i32
  end
  enum CLUSTER_CHANGE_REGISTRY_V2
    CLUSTER_CHANGE_REGISTRY_ATTRIBUTES_V2 = 1_i32
    CLUSTER_CHANGE_REGISTRY_NAME_V2 = 2_i32
    CLUSTER_CHANGE_REGISTRY_SUBTREE_V2 = 4_i32
    CLUSTER_CHANGE_REGISTRY_VALUE_V2 = 8_i32
    CLUSTER_CHANGE_REGISTRY_HANDLE_CLOSE_V2 = 16_i32
    CLUSTER_CHANGE_REGISTRY_ALL_V2 = 31_i32
  end
  enum CLUSTER_CHANGE_QUORUM_V2
    CLUSTER_CHANGE_QUORUM_STATE_V2 = 1_i32
    CLUSTER_CHANGE_QUORUM_ALL_V2 = 1_i32
  end
  enum CLUSTER_CHANGE_SHARED_VOLUME_V2
    CLUSTER_CHANGE_SHARED_VOLUME_STATE_V2 = 1_i32
    CLUSTER_CHANGE_SHARED_VOLUME_ADDED_V2 = 2_i32
    CLUSTER_CHANGE_SHARED_VOLUME_REMOVED_V2 = 4_i32
    CLUSTER_CHANGE_SHARED_VOLUME_ALL_V2 = 7_i32
  end
  enum CLUSTER_CHANGE_SPACEPORT_V2
    CLUSTER_CHANGE_SPACEPORT_CUSTOM_PNP_V2 = 1_i32
  end
  enum CLUSTER_CHANGE_NODE_UPGRADE_PHASE_V2
    CLUSTER_CHANGE_UPGRADE_NODE_PREPARE = 1_i32
    CLUSTER_CHANGE_UPGRADE_NODE_COMMIT = 2_i32
    CLUSTER_CHANGE_UPGRADE_NODE_POSTCOMMIT = 4_i32
    CLUSTER_CHANGE_UPGRADE_ALL = 7_i32
  end
  enum CLUSTER_OBJECT_TYPE
    CLUSTER_OBJECT_TYPE_NONE = 0_i32
    CLUSTER_OBJECT_TYPE_CLUSTER = 1_i32
    CLUSTER_OBJECT_TYPE_GROUP = 2_i32
    CLUSTER_OBJECT_TYPE_RESOURCE = 3_i32
    CLUSTER_OBJECT_TYPE_RESOURCE_TYPE = 4_i32
    CLUSTER_OBJECT_TYPE_NETWORK_INTERFACE = 5_i32
    CLUSTER_OBJECT_TYPE_NETWORK = 6_i32
    CLUSTER_OBJECT_TYPE_NODE = 7_i32
    CLUSTER_OBJECT_TYPE_REGISTRY = 8_i32
    CLUSTER_OBJECT_TYPE_QUORUM = 9_i32
    CLUSTER_OBJECT_TYPE_SHARED_VOLUME = 10_i32
    CLUSTER_OBJECT_TYPE_GROUPSET = 13_i32
    CLUSTER_OBJECT_TYPE_AFFINITYRULE = 16_i32
  end
  enum CLUSTERSET_OBJECT_TYPE
    CLUSTERSET_OBJECT_TYPE_NONE = 0_i32
    CLUSTERSET_OBJECT_TYPE_MEMBER = 1_i32
    CLUSTERSET_OBJECT_TYPE_WORKLOAD = 2_i32
    CLUSTERSET_OBJECT_TYPE_DATABASE = 3_i32
  end
  enum CLUSTER_ENUM
    CLUSTER_ENUM_NODE = 1_i32
    CLUSTER_ENUM_RESTYPE = 2_i32
    CLUSTER_ENUM_RESOURCE = 4_i32
    CLUSTER_ENUM_GROUP = 8_i32
    CLUSTER_ENUM_NETWORK = 16_i32
    CLUSTER_ENUM_NETINTERFACE = 32_i32
    CLUSTER_ENUM_SHARED_VOLUME_GROUP = 536870912_i32
    CLUSTER_ENUM_SHARED_VOLUME_RESOURCE = 1073741824_i32
    CLUSTER_ENUM_INTERNAL_NETWORK = -2147483648_i32
    CLUSTER_ENUM_ALL = 63_i32
  end
  enum CLUSTER_NODE_ENUM
    CLUSTER_NODE_ENUM_NETINTERFACES = 1_i32
    CLUSTER_NODE_ENUM_GROUPS = 2_i32
    CLUSTER_NODE_ENUM_PREFERRED_GROUPS = 4_i32
    CLUSTER_NODE_ENUM_ALL = 3_i32
  end
  enum CLUSTER_NODE_STATE
    ClusterNodeStateUnknown = -1_i32
    ClusterNodeUp = 0_i32
    ClusterNodeDown = 1_i32
    ClusterNodePaused = 2_i32
    ClusterNodeJoining = 3_i32
  end
  enum CLUSTER_STORAGENODE_STATE
    ClusterStorageNodeStateUnknown = 0_i32
    ClusterStorageNodeUp = 1_i32
    ClusterStorageNodeDown = 2_i32
    ClusterStorageNodePaused = 3_i32
    ClusterStorageNodeStarting = 4_i32
    ClusterStorageNodeStopping = 5_i32
  end
  enum CLUSTER_NODE_DRAIN_STATUS
    NodeDrainStatusNotInitiated = 0_i32
    NodeDrainStatusInProgress = 1_i32
    NodeDrainStatusCompleted = 2_i32
    NodeDrainStatusFailed = 3_i32
    ClusterNodeDrainStatusCount = 4_i32
  end
  enum CLUSTER_NODE_STATUS
    NodeStatusNormal = 0_i32
    NodeStatusIsolated = 1_i32
    NodeStatusQuarantined = 2_i32
    NodeStatusDrainInProgress = 4_i32
    NodeStatusDrainCompleted = 8_i32
    NodeStatusDrainFailed = 16_i32
    NodeStatusAvoidPlacement = 32_i32
    NodeStatusMax = 51_i32
  end
  enum CLUSTER_GROUP_ENUM
    CLUSTER_GROUP_ENUM_CONTAINS = 1_i32
    CLUSTER_GROUP_ENUM_NODES = 2_i32
    CLUSTER_GROUP_ENUM_ALL = 3_i32
  end
  enum CLUSTER_GROUP_STATE
    ClusterGroupStateUnknown = -1_i32
    ClusterGroupOnline = 0_i32
    ClusterGroupOffline = 1_i32
    ClusterGroupFailed = 2_i32
    ClusterGroupPartialOnline = 3_i32
    ClusterGroupPending = 4_i32
  end
  enum CLUSTER_GROUP_PRIORITY
    PriorityDisabled = 0_i32
    PriorityLow = 1000_i32
    PriorityMedium = 2000_i32
    PriorityHigh = 3000_i32
  end
  enum CLUSTER_GROUP_AUTOFAILBACK_TYPE
    ClusterGroupPreventFailback = 0_i32
    ClusterGroupAllowFailback = 1_i32
    ClusterGroupFailbackTypeCount = 2_i32
  end
  enum CLUSTER_NODE_RESUME_FAILBACK_TYPE
    DoNotFailbackGroups = 0_i32
    FailbackGroupsImmediately = 1_i32
    FailbackGroupsPerPolicy = 2_i32
    ClusterNodeResumeFailbackTypeCount = 3_i32
  end
  enum CLUSTER_RESOURCE_STATE
    ClusterResourceStateUnknown = -1_i32
    ClusterResourceInherited = 0_i32
    ClusterResourceInitializing = 1_i32
    ClusterResourceOnline = 2_i32
    ClusterResourceOffline = 3_i32
    ClusterResourceFailed = 4_i32
    ClusterResourcePending = 128_i32
    ClusterResourceOnlinePending = 129_i32
    ClusterResourceOfflinePending = 130_i32
  end
  enum CLUSTER_RESOURCE_RESTART_ACTION
    ClusterResourceDontRestart = 0_i32
    ClusterResourceRestartNoNotify = 1_i32
    ClusterResourceRestartNotify = 2_i32
    ClusterResourceRestartActionCount = 3_i32
  end
  enum CLUSTER_RESOURCE_EMBEDDED_FAILURE_ACTION
    ClusterResourceEmbeddedFailureActionNone = 0_i32
    ClusterResourceEmbeddedFailureActionLogOnly = 1_i32
    ClusterResourceEmbeddedFailureActionRecover = 2_i32
  end
  enum CLUSTER_RESOURCE_CREATE_FLAGS
    CLUSTER_RESOURCE_DEFAULT_MONITOR = 0_i32
    CLUSTER_RESOURCE_SEPARATE_MONITOR = 1_i32
    CLUSTER_RESOURCE_VALID_FLAGS = 1_i32
  end
  enum CLUSTER_SHARED_VOLUME_SNAPSHOT_STATE
    ClusterSharedVolumeSnapshotStateUnknown = 0_i32
    ClusterSharedVolumePrepareForHWSnapshot = 1_i32
    ClusterSharedVolumeHWSnapshotCompleted = 2_i32
    ClusterSharedVolumePrepareForFreeze = 3_i32
  end
  enum CLUSTER_PROPERTY_TYPE
    CLUSPROP_TYPE_UNKNOWN = -1_i32
    CLUSPROP_TYPE_ENDMARK = 0_i32
    CLUSPROP_TYPE_LIST_VALUE = 1_i32
    CLUSPROP_TYPE_RESCLASS = 2_i32
    CLUSPROP_TYPE_RESERVED1 = 3_i32
    CLUSPROP_TYPE_NAME = 4_i32
    CLUSPROP_TYPE_SIGNATURE = 5_i32
    CLUSPROP_TYPE_SCSI_ADDRESS = 6_i32
    CLUSPROP_TYPE_DISK_NUMBER = 7_i32
    CLUSPROP_TYPE_PARTITION_INFO = 8_i32
    CLUSPROP_TYPE_FTSET_INFO = 9_i32
    CLUSPROP_TYPE_DISK_SERIALNUMBER = 10_i32
    CLUSPROP_TYPE_DISK_GUID = 11_i32
    CLUSPROP_TYPE_DISK_SIZE = 12_i32
    CLUSPROP_TYPE_PARTITION_INFO_EX = 13_i32
    CLUSPROP_TYPE_PARTITION_INFO_EX2 = 14_i32
    CLUSPROP_TYPE_STORAGE_DEVICE_ID_DESCRIPTOR = 15_i32
    CLUSPROP_TYPE_USER = 32768_i32
  end
  enum CLUSTER_PROPERTY_FORMAT
    CLUSPROP_FORMAT_UNKNOWN = 0_i32
    CLUSPROP_FORMAT_BINARY = 1_i32
    CLUSPROP_FORMAT_DWORD = 2_i32
    CLUSPROP_FORMAT_SZ = 3_i32
    CLUSPROP_FORMAT_EXPAND_SZ = 4_i32
    CLUSPROP_FORMAT_MULTI_SZ = 5_i32
    CLUSPROP_FORMAT_ULARGE_INTEGER = 6_i32
    CLUSPROP_FORMAT_LONG = 7_i32
    CLUSPROP_FORMAT_EXPANDED_SZ = 8_i32
    CLUSPROP_FORMAT_SECURITY_DESCRIPTOR = 9_i32
    CLUSPROP_FORMAT_LARGE_INTEGER = 10_i32
    CLUSPROP_FORMAT_WORD = 11_i32
    CLUSPROP_FORMAT_FILETIME = 12_i32
    CLUSPROP_FORMAT_VALUE_LIST = 13_i32
    CLUSPROP_FORMAT_PROPERTY_LIST = 14_i32
    CLUSPROP_FORMAT_USER = 32768_i32
  end
  enum CLUSTER_PROPERTY_SYNTAX : UInt32
    CLUSPROP_SYNTAX_ENDMARK = 0_u32
    CLUSPROP_SYNTAX_NAME = 262147_u32
    CLUSPROP_SYNTAX_RESCLASS = 131074_u32
    CLUSPROP_SYNTAX_LIST_VALUE_SZ = 65539_u32
    CLUSPROP_SYNTAX_LIST_VALUE_EXPAND_SZ = 65540_u32
    CLUSPROP_SYNTAX_LIST_VALUE_DWORD = 65538_u32
    CLUSPROP_SYNTAX_LIST_VALUE_BINARY = 65537_u32
    CLUSPROP_SYNTAX_LIST_VALUE_MULTI_SZ = 65541_u32
    CLUSPROP_SYNTAX_LIST_VALUE_LONG = 65543_u32
    CLUSPROP_SYNTAX_LIST_VALUE_EXPANDED_SZ = 65544_u32
    CLUSPROP_SYNTAX_LIST_VALUE_SECURITY_DESCRIPTOR = 65545_u32
    CLUSPROP_SYNTAX_LIST_VALUE_LARGE_INTEGER = 65546_u32
    CLUSPROP_SYNTAX_LIST_VALUE_ULARGE_INTEGER = 65542_u32
    CLUSPROP_SYNTAX_LIST_VALUE_WORD = 65547_u32
    CLUSPROP_SYNTAX_LIST_VALUE_PROPERTY_LIST = 65550_u32
    CLUSPROP_SYNTAX_LIST_VALUE_FILETIME = 65548_u32
    CLUSPROP_SYNTAX_DISK_SIGNATURE = 327682_u32
    CLUSPROP_SYNTAX_SCSI_ADDRESS = 393218_u32
    CLUSPROP_SYNTAX_DISK_NUMBER = 458754_u32
    CLUSPROP_SYNTAX_PARTITION_INFO = 524289_u32
    CLUSPROP_SYNTAX_FTSET_INFO = 589825_u32
    CLUSPROP_SYNTAX_DISK_SERIALNUMBER = 655363_u32
    CLUSPROP_SYNTAX_DISK_GUID = 720899_u32
    CLUSPROP_SYNTAX_DISK_SIZE = 786438_u32
    CLUSPROP_SYNTAX_PARTITION_INFO_EX = 851969_u32
    CLUSPROP_SYNTAX_PARTITION_INFO_EX2 = 917505_u32
    CLUSPROP_SYNTAX_STORAGE_DEVICE_ID_DESCRIPTOR = 983041_u32
  end
  enum CLUSTER_CONTROL_OBJECT
    CLUS_OBJECT_INVALID = 0_i32
    CLUS_OBJECT_RESOURCE = 1_i32
    CLUS_OBJECT_RESOURCE_TYPE = 2_i32
    CLUS_OBJECT_GROUP = 3_i32
    CLUS_OBJECT_NODE = 4_i32
    CLUS_OBJECT_NETWORK = 5_i32
    CLUS_OBJECT_NETINTERFACE = 6_i32
    CLUS_OBJECT_CLUSTER = 7_i32
    CLUS_OBJECT_GROUPSET = 8_i32
    CLUS_OBJECT_AFFINITYRULE = 9_i32
    CLUS_OBJECT_USER = 128_i32
  end
  enum CLCTL_CODES
    CLCTL_UNKNOWN = 0_i32
    CLCTL_GET_CHARACTERISTICS = 5_i32
    CLCTL_GET_FLAGS = 9_i32
    CLCTL_GET_CLASS_INFO = 13_i32
    CLCTL_GET_REQUIRED_DEPENDENCIES = 17_i32
    CLCTL_GET_ARB_TIMEOUT = 21_i32
    CLCTL_GET_FAILURE_INFO = 25_i32
    CLCTL_GET_NAME = 41_i32
    CLCTL_GET_RESOURCE_TYPE = 45_i32
    CLCTL_GET_NODE = 49_i32
    CLCTL_GET_NETWORK = 53_i32
    CLCTL_GET_ID = 57_i32
    CLCTL_GET_FQDN = 61_i32
    CLCTL_GET_CLUSTER_SERVICE_ACCOUNT_NAME = 65_i32
    CLCTL_CHECK_VOTER_EVICT = 69_i32
    CLCTL_CHECK_VOTER_DOWN = 73_i32
    CLCTL_SHUTDOWN = 77_i32
    CLCTL_ENUM_COMMON_PROPERTIES = 81_i32
    CLCTL_GET_RO_COMMON_PROPERTIES = 85_i32
    CLCTL_GET_COMMON_PROPERTIES = 89_i32
    CLCTL_SET_COMMON_PROPERTIES = 4194398_i32
    CLCTL_VALIDATE_COMMON_PROPERTIES = 97_i32
    CLCTL_GET_COMMON_PROPERTY_FMTS = 101_i32
    CLCTL_GET_COMMON_RESOURCE_PROPERTY_FMTS = 105_i32
    CLCTL_ENUM_PRIVATE_PROPERTIES = 121_i32
    CLCTL_GET_RO_PRIVATE_PROPERTIES = 125_i32
    CLCTL_GET_PRIVATE_PROPERTIES = 129_i32
    CLCTL_SET_PRIVATE_PROPERTIES = 4194438_i32
    CLCTL_VALIDATE_PRIVATE_PROPERTIES = 137_i32
    CLCTL_GET_PRIVATE_PROPERTY_FMTS = 141_i32
    CLCTL_GET_PRIVATE_RESOURCE_PROPERTY_FMTS = 145_i32
    CLCTL_ADD_REGISTRY_CHECKPOINT = 4194466_i32
    CLCTL_DELETE_REGISTRY_CHECKPOINT = 4194470_i32
    CLCTL_GET_REGISTRY_CHECKPOINTS = 169_i32
    CLCTL_ADD_CRYPTO_CHECKPOINT = 4194478_i32
    CLCTL_DELETE_CRYPTO_CHECKPOINT = 4194482_i32
    CLCTL_GET_CRYPTO_CHECKPOINTS = 181_i32
    CLCTL_RESOURCE_UPGRADE_DLL = 4194490_i32
    CLCTL_ADD_REGISTRY_CHECKPOINT_64BIT = 4194494_i32
    CLCTL_ADD_REGISTRY_CHECKPOINT_32BIT = 4194498_i32
    CLCTL_GET_LOADBAL_PROCESS_LIST = 201_i32
    CLCTL_SET_ACCOUNT_ACCESS = 4194546_i32
    CLCTL_GET_NETWORK_NAME = 361_i32
    CLCTL_NETNAME_GET_VIRTUAL_SERVER_TOKEN = 365_i32
    CLCTL_NETNAME_REGISTER_DNS_RECORDS = 370_i32
    CLCTL_GET_DNS_NAME = 373_i32
    CLCTL_NETNAME_SET_PWD_INFO = 378_i32
    CLCTL_NETNAME_DELETE_CO = 382_i32
    CLCTL_NETNAME_VALIDATE_VCO = 385_i32
    CLCTL_NETNAME_RESET_VCO = 389_i32
    CLCTL_NETNAME_REPAIR_VCO = 397_i32
    CLCTL_STORAGE_GET_DISK_INFO = 401_i32
    CLCTL_STORAGE_GET_AVAILABLE_DISKS = 405_i32
    CLCTL_STORAGE_IS_PATH_VALID = 409_i32
    CLCTL_STORAGE_SYNC_CLUSDISK_DB = 4194718_i32
    CLCTL_STORAGE_GET_DISK_NUMBER_INFO = 417_i32
    CLCTL_QUERY_DELETE = 441_i32
    CLCTL_IPADDRESS_RENEW_LEASE = 4194750_i32
    CLCTL_IPADDRESS_RELEASE_LEASE = 4194754_i32
    CLCTL_QUERY_MAINTENANCE_MODE = 481_i32
    CLCTL_SET_MAINTENANCE_MODE = 4194790_i32
    CLCTL_STORAGE_SET_DRIVELETTER = 4194794_i32
    CLCTL_STORAGE_GET_DRIVELETTERS = 493_i32
    CLCTL_STORAGE_GET_DISK_INFO_EX = 497_i32
    CLCTL_STORAGE_GET_AVAILABLE_DISKS_EX = 501_i32
    CLCTL_STORAGE_GET_DISK_INFO_EX2 = 505_i32
    CLCTL_STORAGE_GET_CLUSPORT_DISK_COUNT = 509_i32
    CLCTL_STORAGE_REMAP_DRIVELETTER = 513_i32
    CLCTL_STORAGE_GET_DISKID = 517_i32
    CLCTL_STORAGE_IS_CLUSTERABLE = 521_i32
    CLCTL_STORAGE_REMOVE_VM_OWNERSHIP = 4194830_i32
    CLCTL_STORAGE_GET_MOUNTPOINTS = 529_i32
    CLCTL_STORAGE_GET_DIRTY = 537_i32
    CLCTL_STORAGE_GET_SHARED_VOLUME_INFO = 549_i32
    CLCTL_STORAGE_IS_CSV_FILE = 553_i32
    CLCTL_STORAGE_GET_RESOURCEID = 557_i32
    CLCTL_VALIDATE_PATH = 561_i32
    CLCTL_VALIDATE_NETNAME = 565_i32
    CLCTL_VALIDATE_DIRECTORY = 569_i32
    CLCTL_BATCH_BLOCK_KEY = 574_i32
    CLCTL_BATCH_UNBLOCK_KEY = 577_i32
    CLCTL_FILESERVER_SHARE_ADD = 4194886_i32
    CLCTL_FILESERVER_SHARE_DEL = 4194890_i32
    CLCTL_FILESERVER_SHARE_MODIFY = 4194894_i32
    CLCTL_FILESERVER_SHARE_REPORT = 593_i32
    CLCTL_NETNAME_GET_OU_FOR_VCO = 4194926_i32
    CLCTL_ENABLE_SHARED_VOLUME_DIRECTIO = 4194954_i32
    CLCTL_DISABLE_SHARED_VOLUME_DIRECTIO = 4194958_i32
    CLCTL_GET_SHARED_VOLUME_ID = 657_i32
    CLCTL_SET_CSV_MAINTENANCE_MODE = 4194966_i32
    CLCTL_SET_SHARED_VOLUME_BACKUP_MODE = 4194970_i32
    CLCTL_STORAGE_GET_SHARED_VOLUME_PARTITION_NAMES = 669_i32
    CLCTL_STORAGE_GET_SHARED_VOLUME_STATES = 4194978_i32
    CLCTL_STORAGE_IS_SHARED_VOLUME = 677_i32
    CLCTL_GET_CLUSDB_TIMESTAMP = 681_i32
    CLCTL_RW_MODIFY_NOOP = 4194990_i32
    CLCTL_IS_QUORUM_BLOCKED = 689_i32
    CLCTL_POOL_GET_DRIVE_INFO = 693_i32
    CLCTL_GET_GUM_LOCK_OWNER = 697_i32
    CLCTL_GET_STUCK_NODES = 701_i32
    CLCTL_INJECT_GEM_FAULT = 705_i32
    CLCTL_INTRODUCE_GEM_REPAIR_DELAY = 709_i32
    CLCTL_SEND_DUMMY_GEM_MESSAGES = 713_i32
    CLCTL_BLOCK_GEM_SEND_RECV = 717_i32
    CLCTL_GET_GEMID_VECTOR = 721_i32
    CLCTL_ADD_CRYPTO_CHECKPOINT_EX = 4195030_i32
    CLCTL_GROUP_GET_LAST_MOVE_TIME = 729_i32
    CLCTL_SET_STORAGE_CONFIGURATION = 4195042_i32
    CLCTL_GET_STORAGE_CONFIGURATION = 741_i32
    CLCTL_GET_STORAGE_CONFIG_ATTRIBUTES = 745_i32
    CLCTL_REMOVE_NODE = 4195054_i32
    CLCTL_IS_FEATURE_INSTALLED = 753_i32
    CLCTL_IS_S2D_FEATURE_SUPPORTED = 757_i32
    CLCTL_STORAGE_GET_PHYSICAL_DISK_INFO = 761_i32
    CLCTL_STORAGE_GET_CLUSBFLT_PATHS = 765_i32
    CLCTL_STORAGE_GET_CLUSBFLT_PATHINFO = 769_i32
    CLCTL_CLEAR_NODE_CONNECTION_INFO = 4195078_i32
    CLCTL_SET_DNS_DOMAIN = 4195082_i32
    CTCTL_GET_ROUTESTATUS_BASIC = 781_i32
    CTCTL_GET_ROUTESTATUS_EXTENDED = 785_i32
    CTCTL_GET_FAULT_DOMAIN_STATE = 789_i32
    CLCTL_NETNAME_SET_PWD_INFOEX = 794_i32
    CLCTL_STORAGE_GET_AVAILABLE_DISKS_EX2_INT = 8161_i32
    CLCTL_CLOUD_WITNESS_RESOURCE_TYPE_VALIDATE_CREDENTIALS = 8417_i32
    CLCTL_CLOUD_WITNESS_RESOURCE_UPDATE_TOKEN = 4202726_i32
    CLCTL_RESOURCE_PREPARE_UPGRADE = 4202730_i32
    CLCTL_RESOURCE_UPGRADE_COMPLETED = 4202734_i32
    CLCTL_CLOUD_WITNESS_RESOURCE_TYPE_VALIDATE_CREDENTIALS_WITH_KEY = 8433_i32
    CLCTL_CLOUD_WITNESS_RESOURCE_UPDATE_KEY = 4202742_i32
    CLCTL_REPLICATION_ADD_REPLICATION_GROUP = 8514_i32
    CLCTL_REPLICATION_GET_LOG_INFO = 8517_i32
    CLCTL_REPLICATION_GET_ELIGIBLE_LOGDISKS = 8521_i32
    CLCTL_REPLICATION_GET_ELIGIBLE_TARGET_DATADISKS = 8525_i32
    CLCTL_REPLICATION_GET_ELIGIBLE_SOURCE_DATADISKS = 8529_i32
    CLCTL_REPLICATION_GET_REPLICATED_DISKS = 8533_i32
    CLCTL_REPLICATION_GET_REPLICA_VOLUMES = 8537_i32
    CLCTL_REPLICATION_GET_LOG_VOLUME = 8541_i32
    CLCTL_REPLICATION_GET_RESOURCE_GROUP = 8545_i32
    CLCTL_REPLICATION_GET_REPLICATED_PARTITION_INFO = 8549_i32
    CLCTL_GET_STATE_CHANGE_TIME = 11613_i32
    CLCTL_SET_CLUSTER_S2D_ENABLED = 4205922_i32
    CLCTL_SET_CLUSTER_S2D_CACHE_METADATA_RESERVE_BYTES = 4205934_i32
    CLCTL_GROUPSET_GET_GROUPS = 11633_i32
    CLCTL_GROUPSET_GET_PROVIDER_GROUPS = 11637_i32
    CLCTL_GROUPSET_GET_PROVIDER_GROUPSETS = 11641_i32
    CLCTL_GROUP_GET_PROVIDER_GROUPS = 11645_i32
    CLCTL_GROUP_GET_PROVIDER_GROUPSETS = 11649_i32
    CLCTL_GROUP_SET_CCF_FROM_MASTER = 4205958_i32
    CLCTL_GET_INFRASTRUCTURE_SOFS_BUFFER = 11657_i32
    CLCTL_SET_INFRASTRUCTURE_SOFS_BUFFER = 4205966_i32
    CLCTL_NOTIFY_INFRASTRUCTURE_SOFS_CHANGED = 4205970_i32
    CLCTL_SCALEOUT_COMMAND = 4205974_i32
    CLCTL_SCALEOUT_CONTROL = 4205978_i32
    CLCTL_SCALEOUT_GET_CLUSTERS = 4205981_i32
    CLCTL_RELOAD_AUTOLOGGER_CONFIG = 11730_i32
    CLCTL_STORAGE_RENAME_SHARED_VOLUME = 11734_i32
    CLCTL_STORAGE_RENAME_SHARED_VOLUME_GUID = 11738_i32
    CLCTL_ENUM_AFFINITY_RULE_NAMES = 11741_i32
    CLCTL_GET_NODES_IN_FD = 11745_i32
    CLCTL_FORCE_DB_FLUSH = 4206054_i32
    CLCTL_DELETE = 5242886_i32
    CLCTL_INSTALL_NODE = 5242890_i32
    CLCTL_EVICT_NODE = 5242894_i32
    CLCTL_ADD_DEPENDENCY = 5242898_i32
    CLCTL_REMOVE_DEPENDENCY = 5242902_i32
    CLCTL_ADD_OWNER = 5242906_i32
    CLCTL_REMOVE_OWNER = 5242910_i32
    CLCTL_SET_NAME = 5242918_i32
    CLCTL_CLUSTER_NAME_CHANGED = 5242922_i32
    CLCTL_CLUSTER_VERSION_CHANGED = 5242926_i32
    CLCTL_FIXUP_ON_UPGRADE = 5242930_i32
    CLCTL_STARTING_PHASE1 = 5242934_i32
    CLCTL_STARTING_PHASE2 = 5242938_i32
    CLCTL_HOLD_IO = 5242942_i32
    CLCTL_RESUME_IO = 5242946_i32
    CLCTL_FORCE_QUORUM = 5242950_i32
    CLCTL_INITIALIZE = 5242954_i32
    CLCTL_STATE_CHANGE_REASON = 5242958_i32
    CLCTL_PROVIDER_STATE_CHANGE = 5242962_i32
    CLCTL_LEAVING_GROUP = 5242966_i32
    CLCTL_JOINING_GROUP = 5242970_i32
    CLCTL_FSWITNESS_GET_EPOCH_INFO = 1048669_i32
    CLCTL_FSWITNESS_SET_EPOCH_INFO = 5242978_i32
    CLCTL_FSWITNESS_RELEASE_LOCK = 5242982_i32
    CLCTL_NETNAME_CREDS_NOTIFYCAM = 5242986_i32
    CLCTL_NOTIFY_QUORUM_STATUS = 5243006_i32
    CLCTL_NOTIFY_MONITOR_SHUTTING_DOWN = 1048705_i32
    CLCTL_UNDELETE = 5243014_i32
    CLCTL_GET_OPERATION_CONTEXT = 1057001_i32
    CLCTL_NOTIFY_OWNER_CHANGE = 5251362_i32
    CLCTL_VALIDATE_CHANGE_GROUP = 1057061_i32
    CLCTL_CHECK_DRAIN_VETO = 1057069_i32
    CLCTL_NOTIFY_DRAIN_COMPLETE = 1057073_i32
  end
  enum CLUSCTL_RESOURCE_CODES
    CLUSCTL_RESOURCE_UNKNOWN = 16777216_i32
    CLUSCTL_RESOURCE_GET_CHARACTERISTICS = 16777221_i32
    CLUSCTL_RESOURCE_GET_FLAGS = 16777225_i32
    CLUSCTL_RESOURCE_GET_CLASS_INFO = 16777229_i32
    CLUSCTL_RESOURCE_GET_REQUIRED_DEPENDENCIES = 16777233_i32
    CLUSCTL_RESOURCE_GET_NAME = 16777257_i32
    CLUSCTL_RESOURCE_GET_ID = 16777273_i32
    CLUSCTL_RESOURCE_GET_RESOURCE_TYPE = 16777261_i32
    CLUSCTL_RESOURCE_ENUM_COMMON_PROPERTIES = 16777297_i32
    CLUSCTL_RESOURCE_GET_RO_COMMON_PROPERTIES = 16777301_i32
    CLUSCTL_RESOURCE_GET_COMMON_PROPERTIES = 16777305_i32
    CLUSCTL_RESOURCE_SET_COMMON_PROPERTIES = 20971614_i32
    CLUSCTL_RESOURCE_VALIDATE_COMMON_PROPERTIES = 16777313_i32
    CLUSCTL_RESOURCE_GET_COMMON_PROPERTY_FMTS = 16777317_i32
    CLUSCTL_RESOURCE_ENUM_PRIVATE_PROPERTIES = 16777337_i32
    CLUSCTL_RESOURCE_GET_RO_PRIVATE_PROPERTIES = 16777341_i32
    CLUSCTL_RESOURCE_GET_PRIVATE_PROPERTIES = 16777345_i32
    CLUSCTL_RESOURCE_SET_PRIVATE_PROPERTIES = 20971654_i32
    CLUSCTL_RESOURCE_VALIDATE_PRIVATE_PROPERTIES = 16777353_i32
    CLUSCTL_RESOURCE_GET_PRIVATE_PROPERTY_FMTS = 16777357_i32
    CLUSCTL_RESOURCE_ADD_REGISTRY_CHECKPOINT = 20971682_i32
    CLUSCTL_RESOURCE_DELETE_REGISTRY_CHECKPOINT = 20971686_i32
    CLUSCTL_RESOURCE_GET_REGISTRY_CHECKPOINTS = 16777385_i32
    CLUSCTL_RESOURCE_ADD_CRYPTO_CHECKPOINT = 20971694_i32
    CLUSCTL_RESOURCE_DELETE_CRYPTO_CHECKPOINT = 20971698_i32
    CLUSCTL_RESOURCE_ADD_CRYPTO_CHECKPOINT_EX = 20972246_i32
    CLUSCTL_RESOURCE_GET_CRYPTO_CHECKPOINTS = 16777397_i32
    CLUSCTL_RESOURCE_GET_LOADBAL_PROCESS_LIST = 16777417_i32
    CLUSCTL_RESOURCE_GET_NETWORK_NAME = 16777577_i32
    CLUSCTL_RESOURCE_NETNAME_GET_VIRTUAL_SERVER_TOKEN = 16777581_i32
    CLUSCTL_RESOURCE_NETNAME_SET_PWD_INFO = 16777594_i32
    CLUSCTL_RESOURCE_NETNAME_SET_PWD_INFOEX = 16778010_i32
    CLUSCTL_RESOURCE_NETNAME_DELETE_CO = 16777598_i32
    CLUSCTL_RESOURCE_NETNAME_VALIDATE_VCO = 16777601_i32
    CLUSCTL_RESOURCE_NETNAME_RESET_VCO = 16777605_i32
    CLUSCTL_RESOURCE_NETNAME_REPAIR_VCO = 16777613_i32
    CLUSCTL_RESOURCE_NETNAME_REGISTER_DNS_RECORDS = 16777586_i32
    CLUSCTL_RESOURCE_GET_DNS_NAME = 16777589_i32
    CLUSCTL_RESOURCE_STORAGE_GET_DISK_INFO = 16777617_i32
    CLUSCTL_RESOURCE_STORAGE_GET_DISK_NUMBER_INFO = 16777633_i32
    CLUSCTL_RESOURCE_STORAGE_IS_PATH_VALID = 16777625_i32
    CLUSCTL_RESOURCE_QUERY_DELETE = 16777657_i32
    CLUSCTL_RESOURCE_UPGRADE_DLL = 20971706_i32
    CLUSCTL_RESOURCE_IPADDRESS_RENEW_LEASE = 20971966_i32
    CLUSCTL_RESOURCE_IPADDRESS_RELEASE_LEASE = 20971970_i32
    CLUSCTL_RESOURCE_ADD_REGISTRY_CHECKPOINT_64BIT = 20971710_i32
    CLUSCTL_RESOURCE_ADD_REGISTRY_CHECKPOINT_32BIT = 20971714_i32
    CLUSCTL_RESOURCE_QUERY_MAINTENANCE_MODE = 16777697_i32
    CLUSCTL_RESOURCE_SET_MAINTENANCE_MODE = 20972006_i32
    CLUSCTL_RESOURCE_STORAGE_SET_DRIVELETTER = 20972010_i32
    CLUSCTL_RESOURCE_STORAGE_GET_DISK_INFO_EX = 16777713_i32
    CLUSCTL_RESOURCE_STORAGE_GET_DISK_INFO_EX2 = 16777721_i32
    CLUSCTL_RESOURCE_STORAGE_GET_MOUNTPOINTS = 16777745_i32
    CLUSCTL_RESOURCE_STORAGE_GET_DIRTY = 16777753_i32
    CLUSCTL_RESOURCE_STORAGE_GET_SHARED_VOLUME_INFO = 16777765_i32
    CLUSCTL_RESOURCE_SET_CSV_MAINTENANCE_MODE = 20972182_i32
    CLUSCTL_RESOURCE_ENABLE_SHARED_VOLUME_DIRECTIO = 20972170_i32
    CLUSCTL_RESOURCE_DISABLE_SHARED_VOLUME_DIRECTIO = 20972174_i32
    CLUSCTL_RESOURCE_SET_SHARED_VOLUME_BACKUP_MODE = 20972186_i32
    CLUSCTL_RESOURCE_STORAGE_GET_SHARED_VOLUME_PARTITION_NAMES = 16777885_i32
    CLUSCTL_RESOURCE_GET_FAILURE_INFO = 16777241_i32
    CLUSCTL_RESOURCE_STORAGE_GET_DISKID = 16777733_i32
    CLUSCTL_RESOURCE_STORAGE_GET_SHARED_VOLUME_STATES = 20972194_i32
    CLUSCTL_RESOURCE_STORAGE_IS_SHARED_VOLUME = 16777893_i32
    CLUSCTL_RESOURCE_IS_QUORUM_BLOCKED = 16777905_i32
    CLUSCTL_RESOURCE_POOL_GET_DRIVE_INFO = 16777909_i32
    CLUSCTL_RESOURCE_RLUA_GET_VIRTUAL_SERVER_TOKEN = 16777581_i32
    CLUSCTL_RESOURCE_RLUA_SET_PWD_INFO = 16777594_i32
    CLUSCTL_RESOURCE_RLUA_SET_PWD_INFOEX = 16778010_i32
    CLUSCTL_RESOURCE_DELETE = 22020102_i32
    CLUSCTL_RESOURCE_UNDELETE = 22020230_i32
    CLUSCTL_RESOURCE_INSTALL_NODE = 22020106_i32
    CLUSCTL_RESOURCE_EVICT_NODE = 22020110_i32
    CLUSCTL_RESOURCE_ADD_DEPENDENCY = 22020114_i32
    CLUSCTL_RESOURCE_REMOVE_DEPENDENCY = 22020118_i32
    CLUSCTL_RESOURCE_ADD_OWNER = 22020122_i32
    CLUSCTL_RESOURCE_REMOVE_OWNER = 22020126_i32
    CLUSCTL_RESOURCE_SET_NAME = 22020134_i32
    CLUSCTL_RESOURCE_CLUSTER_NAME_CHANGED = 22020138_i32
    CLUSCTL_RESOURCE_CLUSTER_VERSION_CHANGED = 22020142_i32
    CLUSCTL_RESOURCE_FORCE_QUORUM = 22020166_i32
    CLUSCTL_RESOURCE_INITIALIZE = 22020170_i32
    CLUSCTL_RESOURCE_STATE_CHANGE_REASON = 22020174_i32
    CLUSCTL_RESOURCE_PROVIDER_STATE_CHANGE = 22020178_i32
    CLUSCTL_RESOURCE_LEAVING_GROUP = 22020182_i32
    CLUSCTL_RESOURCE_JOINING_GROUP = 22020186_i32
    CLUSCTL_RESOURCE_FSWITNESS_GET_EPOCH_INFO = 17825885_i32
    CLUSCTL_RESOURCE_FSWITNESS_SET_EPOCH_INFO = 22020194_i32
    CLUSCTL_RESOURCE_FSWITNESS_RELEASE_LOCK = 22020198_i32
    CLUSCTL_RESOURCE_NETNAME_CREDS_NOTIFYCAM = 22020202_i32
    CLUSCTL_RESOURCE_GET_OPERATION_CONTEXT = 17834217_i32
    CLUSCTL_RESOURCE_RW_MODIFY_NOOP = 20972206_i32
    CLUSCTL_RESOURCE_NOTIFY_QUORUM_STATUS = 22020222_i32
    CLUSCTL_RESOURCE_NOTIFY_OWNER_CHANGE = 22028578_i32
    CLUSCTL_RESOURCE_VALIDATE_CHANGE_GROUP = 17834277_i32
    CLUSCTL_RESOURCE_STORAGE_RENAME_SHARED_VOLUME = 16788950_i32
    CLUSCTL_RESOURCE_STORAGE_RENAME_SHARED_VOLUME_GUID = 16788954_i32
    CLUSCTL_CLOUD_WITNESS_RESOURCE_UPDATE_TOKEN = 20979942_i32
    CLUSCTL_CLOUD_WITNESS_RESOURCE_UPDATE_KEY = 20979958_i32
    CLUSCTL_RESOURCE_PREPARE_UPGRADE = 20979946_i32
    CLUSCTL_RESOURCE_UPGRADE_COMPLETED = 20979950_i32
    CLUSCTL_RESOURCE_GET_STATE_CHANGE_TIME = 16788829_i32
    CLUSCTL_RESOURCE_GET_INFRASTRUCTURE_SOFS_BUFFER = 16788873_i32
    CLUSCTL_RESOURCE_SET_INFRASTRUCTURE_SOFS_BUFFER = 20983182_i32
    CLUSCTL_RESOURCE_SCALEOUT_COMMAND = 20983190_i32
    CLUSCTL_RESOURCE_SCALEOUT_CONTROL = 20983194_i32
    CLUSCTL_RESOURCE_SCALEOUT_GET_CLUSTERS = 20983197_i32
    CLUSCTL_RESOURCE_CHECK_DRAIN_VETO = 17834285_i32
    CLUSCTL_RESOURCE_NOTIFY_DRAIN_COMPLETE = 17834289_i32
    CLUSCTL_RESOURCE_GET_NODES_IN_FD = 16788961_i32
  end
  enum CLUSCTL_RESOURCE_TYPE_CODES
    CLUSCTL_RESOURCE_TYPE_UNKNOWN = 33554432_i32
    CLUSCTL_RESOURCE_TYPE_GET_CHARACTERISTICS = 33554437_i32
    CLUSCTL_RESOURCE_TYPE_GET_FLAGS = 33554441_i32
    CLUSCTL_RESOURCE_TYPE_GET_CLASS_INFO = 33554445_i32
    CLUSCTL_RESOURCE_TYPE_GET_REQUIRED_DEPENDENCIES = 33554449_i32
    CLUSCTL_RESOURCE_TYPE_GET_ARB_TIMEOUT = 33554453_i32
    CLUSCTL_RESOURCE_TYPE_ENUM_COMMON_PROPERTIES = 33554513_i32
    CLUSCTL_RESOURCE_TYPE_GET_RO_COMMON_PROPERTIES = 33554517_i32
    CLUSCTL_RESOURCE_TYPE_GET_COMMON_PROPERTIES = 33554521_i32
    CLUSCTL_RESOURCE_TYPE_VALIDATE_COMMON_PROPERTIES = 33554529_i32
    CLUSCTL_RESOURCE_TYPE_SET_COMMON_PROPERTIES = 37748830_i32
    CLUSCTL_RESOURCE_TYPE_GET_COMMON_PROPERTY_FMTS = 33554533_i32
    CLUSCTL_RESOURCE_TYPE_GET_COMMON_RESOURCE_PROPERTY_FMTS = 33554537_i32
    CLUSCTL_RESOURCE_TYPE_ENUM_PRIVATE_PROPERTIES = 33554553_i32
    CLUSCTL_RESOURCE_TYPE_GET_RO_PRIVATE_PROPERTIES = 33554557_i32
    CLUSCTL_RESOURCE_TYPE_GET_PRIVATE_PROPERTIES = 33554561_i32
    CLUSCTL_RESOURCE_TYPE_SET_PRIVATE_PROPERTIES = 37748870_i32
    CLUSCTL_RESOURCE_TYPE_VALIDATE_PRIVATE_PROPERTIES = 33554569_i32
    CLUSCTL_RESOURCE_TYPE_GET_PRIVATE_PROPERTY_FMTS = 33554573_i32
    CLUSCTL_RESOURCE_TYPE_GET_PRIVATE_RESOURCE_PROPERTY_FMTS = 33554577_i32
    CLUSCTL_RESOURCE_TYPE_GET_REGISTRY_CHECKPOINTS = 33554601_i32
    CLUSCTL_RESOURCE_TYPE_GET_CRYPTO_CHECKPOINTS = 33554613_i32
    CLUSCTL_RESOURCE_TYPE_STORAGE_GET_AVAILABLE_DISKS = 33554837_i32
    CLUSCTL_RESOURCE_TYPE_STORAGE_SYNC_CLUSDISK_DB = 37749150_i32
    CLUSCTL_RESOURCE_TYPE_NETNAME_VALIDATE_NETNAME = 33554997_i32
    CLUSCTL_RESOURCE_TYPE_NETNAME_GET_OU_FOR_VCO = 37749358_i32
    CLUSCTL_RESOURCE_TYPE_GEN_APP_VALIDATE_PATH = 33554993_i32
    CLUSCTL_RESOURCE_TYPE_GEN_APP_VALIDATE_DIRECTORY = 33555001_i32
    CLUSCTL_RESOURCE_TYPE_GEN_SCRIPT_VALIDATE_PATH = 33554993_i32
    CLUSCTL_RESOURCE_TYPE_QUERY_DELETE = 33554873_i32
    CLUSCTL_RESOURCE_TYPE_STORAGE_GET_DRIVELETTERS = 33554925_i32
    CLUSCTL_RESOURCE_TYPE_STORAGE_GET_AVAILABLE_DISKS_EX = 33554933_i32
    CLUSCTL_RESOURCE_TYPE_STORAGE_REMAP_DRIVELETTER = 33554945_i32
    CLUSCTL_RESOURCE_TYPE_STORAGE_GET_DISKID = 33554949_i32
    CLUSCTL_RESOURCE_TYPE_STORAGE_GET_RESOURCEID = 33554989_i32
    CLUSCTL_RESOURCE_TYPE_STORAGE_IS_CLUSTERABLE = 33554953_i32
    CLUSCTL_RESOURCE_TYPE_STORAGE_REMOVE_VM_OWNERSHIP = 37749262_i32
    CLUSCTL_RESOURCE_TYPE_STORAGE_IS_CSV_FILE = 16777769_i32
    CLUSCTL_RESOURCE_TYPE_WITNESS_VALIDATE_PATH = 33554993_i32
    CLUSCTL_RESOURCE_TYPE_INSTALL_NODE = 38797322_i32
    CLUSCTL_RESOURCE_TYPE_EVICT_NODE = 38797326_i32
    CLUSCTL_RESOURCE_TYPE_CLUSTER_VERSION_CHANGED = 38797358_i32
    CLUSCTL_RESOURCE_TYPE_FIXUP_ON_UPGRADE = 38797362_i32
    CLUSCTL_RESOURCE_TYPE_STARTING_PHASE1 = 38797366_i32
    CLUSCTL_RESOURCE_TYPE_STARTING_PHASE2 = 38797370_i32
    CLUSCTL_RESOURCE_TYPE_HOLD_IO = 38797374_i32
    CLUSCTL_RESOURCE_TYPE_RESUME_IO = 38797378_i32
    CLUSCTL_RESOURCE_TYPE_STORAGE_GET_AVAILABLE_DISKS_EX2_INT = 33562593_i32
    CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_ELIGIBLE_LOGDISKS = 33562953_i32
    CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_ELIGIBLE_TARGET_DATADISKS = 33562957_i32
    CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_ELIGIBLE_SOURCE_DATADISKS = 33562961_i32
    CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_REPLICATED_DISKS = 33562965_i32
    CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_REPLICA_VOLUMES = 33562969_i32
    CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_LOG_VOLUME = 33562973_i32
    CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_RESOURCE_GROUP = 33562977_i32
    CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_REPLICATED_PARTITION_INFO = 33562981_i32
    CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_LOG_INFO = 33562949_i32
    CLUSCTL_RESOURCE_TYPE_REPLICATION_ADD_REPLICATION_GROUP = 33562946_i32
    CLUSCTL_CLOUD_WITNESS_RESOURCE_TYPE_VALIDATE_CREDENTIALS = 33562849_i32
    CLUSCTL_CLOUD_WITNESS_RESOURCE_TYPE_VALIDATE_CREDENTIALS_WITH_KEY = 33562865_i32
    CLUSCTL_RESOURCE_TYPE_PREPARE_UPGRADE = 37757162_i32
    CLUSCTL_RESOURCE_TYPE_UPGRADE_COMPLETED = 37757166_i32
    CLUSCTL_RESOURCE_TYPE_NOTIFY_MONITOR_SHUTTING_DOWN = 34603137_i32
    CLUSCTL_RESOURCE_TYPE_CHECK_DRAIN_VETO = 34611501_i32
    CLUSCTL_RESOURCE_TYPE_NOTIFY_DRAIN_COMPLETE = 34611505_i32
  end
  enum CLUSCTL_GROUP_CODES
    CLUSCTL_GROUP_UNKNOWN = 50331648_i32
    CLUSCTL_GROUP_GET_CHARACTERISTICS = 50331653_i32
    CLUSCTL_GROUP_GET_FLAGS = 50331657_i32
    CLUSCTL_GROUP_GET_NAME = 50331689_i32
    CLUSCTL_GROUP_GET_ID = 50331705_i32
    CLUSCTL_GROUP_ENUM_COMMON_PROPERTIES = 50331729_i32
    CLUSCTL_GROUP_GET_RO_COMMON_PROPERTIES = 50331733_i32
    CLUSCTL_GROUP_GET_COMMON_PROPERTIES = 50331737_i32
    CLUSCTL_GROUP_SET_COMMON_PROPERTIES = 54526046_i32
    CLUSCTL_GROUP_VALIDATE_COMMON_PROPERTIES = 50331745_i32
    CLUSCTL_GROUP_ENUM_PRIVATE_PROPERTIES = 50331769_i32
    CLUSCTL_GROUP_GET_RO_PRIVATE_PROPERTIES = 50331773_i32
    CLUSCTL_GROUP_GET_PRIVATE_PROPERTIES = 50331777_i32
    CLUSCTL_GROUP_SET_PRIVATE_PROPERTIES = 54526086_i32
    CLUSCTL_GROUP_VALIDATE_PRIVATE_PROPERTIES = 50331785_i32
    CLUSCTL_GROUP_QUERY_DELETE = 50332089_i32
    CLUSCTL_GROUP_GET_COMMON_PROPERTY_FMTS = 50331749_i32
    CLUSCTL_GROUP_GET_PRIVATE_PROPERTY_FMTS = 50331789_i32
    CLUSCTL_GROUP_GET_FAILURE_INFO = 50331673_i32
    CLUSCTL_GROUP_GET_LAST_MOVE_TIME = 50332377_i32
    CLUSCTL_GROUP_SET_CCF_FROM_MASTER = 54537606_i32
  end
  enum CLUSCTL_NODE_CODES
    CLUSCTL_NODE_UNKNOWN = 67108864_i32
    CLUSCTL_NODE_GET_CHARACTERISTICS = 67108869_i32
    CLUSCTL_NODE_GET_FLAGS = 67108873_i32
    CLUSCTL_NODE_GET_NAME = 67108905_i32
    CLUSCTL_NODE_GET_ID = 67108921_i32
    CLUSCTL_NODE_ENUM_COMMON_PROPERTIES = 67108945_i32
    CLUSCTL_NODE_GET_RO_COMMON_PROPERTIES = 67108949_i32
    CLUSCTL_NODE_GET_COMMON_PROPERTIES = 67108953_i32
    CLUSCTL_NODE_SET_COMMON_PROPERTIES = 71303262_i32
    CLUSCTL_NODE_VALIDATE_COMMON_PROPERTIES = 67108961_i32
    CLUSCTL_NODE_ENUM_PRIVATE_PROPERTIES = 67108985_i32
    CLUSCTL_NODE_GET_RO_PRIVATE_PROPERTIES = 67108989_i32
    CLUSCTL_NODE_GET_PRIVATE_PROPERTIES = 67108993_i32
    CLUSCTL_NODE_SET_PRIVATE_PROPERTIES = 71303302_i32
    CLUSCTL_NODE_VALIDATE_PRIVATE_PROPERTIES = 67109001_i32
    CLUSCTL_NODE_GET_COMMON_PROPERTY_FMTS = 67108965_i32
    CLUSCTL_NODE_GET_PRIVATE_PROPERTY_FMTS = 67109005_i32
    CLUSCTL_NODE_GET_CLUSTER_SERVICE_ACCOUNT_NAME = 67108929_i32
    CLUSCTL_NODE_GET_STUCK_NODES = 67109565_i32
    CLUSCTL_NODE_INJECT_GEM_FAULT = 67109569_i32
    CLUSCTL_NODE_INTRODUCE_GEM_REPAIR_DELAY = 67109573_i32
    CLUSCTL_NODE_SEND_DUMMY_GEM_MESSAGES = 67109577_i32
    CLUSCTL_NODE_BLOCK_GEM_SEND_RECV = 67109581_i32
    CLUSCTL_NODE_GET_GEMID_VECTOR = 67109585_i32
  end
  enum CLUSCTL_NETWORK_CODES
    CLUSCTL_NETWORK_UNKNOWN = 83886080_i32
    CLUSCTL_NETWORK_GET_CHARACTERISTICS = 83886085_i32
    CLUSCTL_NETWORK_GET_FLAGS = 83886089_i32
    CLUSCTL_NETWORK_GET_NAME = 83886121_i32
    CLUSCTL_NETWORK_GET_ID = 83886137_i32
    CLUSCTL_NETWORK_ENUM_COMMON_PROPERTIES = 83886161_i32
    CLUSCTL_NETWORK_GET_RO_COMMON_PROPERTIES = 83886165_i32
    CLUSCTL_NETWORK_GET_COMMON_PROPERTIES = 83886169_i32
    CLUSCTL_NETWORK_SET_COMMON_PROPERTIES = 88080478_i32
    CLUSCTL_NETWORK_VALIDATE_COMMON_PROPERTIES = 83886177_i32
    CLUSCTL_NETWORK_ENUM_PRIVATE_PROPERTIES = 83886201_i32
    CLUSCTL_NETWORK_GET_RO_PRIVATE_PROPERTIES = 83886205_i32
    CLUSCTL_NETWORK_GET_PRIVATE_PROPERTIES = 83886209_i32
    CLUSCTL_NETWORK_SET_PRIVATE_PROPERTIES = 88080518_i32
    CLUSCTL_NETWORK_VALIDATE_PRIVATE_PROPERTIES = 83886217_i32
    CLUSCTL_NETWORK_GET_COMMON_PROPERTY_FMTS = 83886181_i32
    CLUSCTL_NETWORK_GET_PRIVATE_PROPERTY_FMTS = 83886221_i32
  end
  enum CLUSCTL_NETINTERFACE_CODES
    CLUSCTL_NETINTERFACE_UNKNOWN = 100663296_i32
    CLUSCTL_NETINTERFACE_GET_CHARACTERISTICS = 100663301_i32
    CLUSCTL_NETINTERFACE_GET_FLAGS = 100663305_i32
    CLUSCTL_NETINTERFACE_GET_NAME = 100663337_i32
    CLUSCTL_NETINTERFACE_GET_ID = 100663353_i32
    CLUSCTL_NETINTERFACE_GET_NODE = 100663345_i32
    CLUSCTL_NETINTERFACE_GET_NETWORK = 100663349_i32
    CLUSCTL_NETINTERFACE_ENUM_COMMON_PROPERTIES = 100663377_i32
    CLUSCTL_NETINTERFACE_GET_RO_COMMON_PROPERTIES = 100663381_i32
    CLUSCTL_NETINTERFACE_GET_COMMON_PROPERTIES = 100663385_i32
    CLUSCTL_NETINTERFACE_SET_COMMON_PROPERTIES = 104857694_i32
    CLUSCTL_NETINTERFACE_VALIDATE_COMMON_PROPERTIES = 100663393_i32
    CLUSCTL_NETINTERFACE_ENUM_PRIVATE_PROPERTIES = 100663417_i32
    CLUSCTL_NETINTERFACE_GET_RO_PRIVATE_PROPERTIES = 100663421_i32
    CLUSCTL_NETINTERFACE_GET_PRIVATE_PROPERTIES = 100663425_i32
    CLUSCTL_NETINTERFACE_SET_PRIVATE_PROPERTIES = 104857734_i32
    CLUSCTL_NETINTERFACE_VALIDATE_PRIVATE_PROPERTIES = 100663433_i32
    CLUSCTL_NETINTERFACE_GET_COMMON_PROPERTY_FMTS = 100663397_i32
    CLUSCTL_NETINTERFACE_GET_PRIVATE_PROPERTY_FMTS = 100663437_i32
  end
  enum CLUSCTL_CLUSTER_CODES
    CLUSCTL_CLUSTER_UNKNOWN = 117440512_i32
    CLUSCTL_CLUSTER_GET_FQDN = 117440573_i32
    CLUSCTL_CLUSTER_SET_STORAGE_CONFIGURATION = 121635554_i32
    CLUSCTL_CLUSTER_GET_STORAGE_CONFIGURATION = 117441253_i32
    CLUSCTL_CLUSTER_GET_STORAGE_CONFIG_ATTRIBUTES = 117441257_i32
    CLUSCTL_CLUSTER_ENUM_COMMON_PROPERTIES = 117440593_i32
    CLUSCTL_CLUSTER_GET_RO_COMMON_PROPERTIES = 117440597_i32
    CLUSCTL_CLUSTER_GET_COMMON_PROPERTIES = 117440601_i32
    CLUSCTL_CLUSTER_SET_COMMON_PROPERTIES = 121634910_i32
    CLUSCTL_CLUSTER_VALIDATE_COMMON_PROPERTIES = 117440609_i32
    CLUSCTL_CLUSTER_ENUM_PRIVATE_PROPERTIES = 117440633_i32
    CLUSCTL_CLUSTER_GET_RO_PRIVATE_PROPERTIES = 117440637_i32
    CLUSCTL_CLUSTER_GET_PRIVATE_PROPERTIES = 117440641_i32
    CLUSCTL_CLUSTER_SET_PRIVATE_PROPERTIES = 121634950_i32
    CLUSCTL_CLUSTER_VALIDATE_PRIVATE_PROPERTIES = 117440649_i32
    CLUSCTL_CLUSTER_GET_COMMON_PROPERTY_FMTS = 117440613_i32
    CLUSCTL_CLUSTER_GET_PRIVATE_PROPERTY_FMTS = 117440653_i32
    CLUSCTL_CLUSTER_CHECK_VOTER_EVICT = 117440581_i32
    CLUSCTL_CLUSTER_CHECK_VOTER_DOWN = 117440585_i32
    CLUSCTL_CLUSTER_SHUTDOWN = 117440589_i32
    CLUSCTL_CLUSTER_BATCH_BLOCK_KEY = 117441086_i32
    CLUSCTL_CLUSTER_BATCH_UNBLOCK_KEY = 117441089_i32
    CLUSCTL_CLUSTER_GET_SHARED_VOLUME_ID = 117441169_i32
    CLUSCTL_CLUSTER_GET_CLUSDB_TIMESTAMP = 117441193_i32
    CLUSCTL_CLUSTER_GET_GUM_LOCK_OWNER = 117441209_i32
    CLUSCTL_CLUSTER_REMOVE_NODE = 121635566_i32
    CLUSCTL_CLUSTER_SET_ACCOUNT_ACCESS = 121635058_i32
    CLUSCTL_CLUSTER_CLEAR_NODE_CONNECTION_INFO = 121635590_i32
    CLUSCTL_CLUSTER_SET_DNS_DOMAIN = 121635594_i32
    CLUSCTL_CLUSTER_SET_CLUSTER_S2D_ENABLED = 121646434_i32
    CLUSCTL_CLUSTER_SET_CLUSTER_S2D_CACHE_METADATA_RESERVE_BYTES = 121646446_i32
    CLUSCTL_CLUSTER_STORAGE_RENAME_SHARED_VOLUME = 117452246_i32
    CLUSCTL_CLUSTER_STORAGE_RENAME_SHARED_VOLUME_GUID = 117452250_i32
    CLUSCTL_CLUSTER_RELOAD_AUTOLOGGER_CONFIG = 117452242_i32
    CLUSCTL_CLUSTER_ENUM_AFFINITY_RULE_NAMES = 117452253_i32
    CLUSCTL_CLUSTER_GET_NODES_IN_FD = 117452257_i32
    CLUSCTL_CLUSTER_FORCE_FLUSH_DB = 121646566_i32
    CLUSCTL_CLUSTER_GET_CLMUSR_TOKEN = 117440877_i32
  end
  enum CLUSCTL_GROUPSET_CODES
    CLUSCTL_GROUPSET_GET_COMMON_PROPERTIES = 134217817_i32
    CLUSCTL_GROUPSET_GET_RO_COMMON_PROPERTIES = 134217813_i32
    CLUSCTL_GROUPSET_SET_COMMON_PROPERTIES = 138412126_i32
    CLUSCTL_GROUPSET_GET_GROUPS = 134229361_i32
    CLUSCTL_GROUPSET_GET_PROVIDER_GROUPS = 134229365_i32
    CLUSCTL_GROUPSET_GET_PROVIDER_GROUPSETS = 134229369_i32
    CLUSCTL_GROUP_GET_PROVIDER_GROUPS = 134229373_i32
    CLUSCTL_GROUP_GET_PROVIDER_GROUPSETS = 134229377_i32
    CLUSCTL_GROUPSET_GET_ID = 134217785_i32
  end
  enum CLUSCTL_AFFINITYRULE_CODES
    CLUSCTL_AFFINITYRULE_GET_COMMON_PROPERTIES = 150995033_i32
    CLUSCTL_AFFINITYRULE_GET_RO_COMMON_PROPERTIES = 150995029_i32
    CLUSCTL_AFFINITYRULE_SET_COMMON_PROPERTIES = 155189342_i32
    CLUSCTL_AFFINITYRULE_GET_ID = 150995001_i32
    CLUSCTL_AFFINITYRULE_GET_GROUPNAMES = 151006577_i32
  end
  enum CLUSTER_RESOURCE_CLASS
    CLUS_RESCLASS_UNKNOWN = 0_i32
    CLUS_RESCLASS_STORAGE = 1_i32
    CLUS_RESCLASS_NETWORK = 2_i32
    CLUS_RESCLASS_USER = 32768_i32
  end
  enum CLUS_RESSUBCLASS
    CLUS_RESSUBCLASS_SHARED = -2147483648_i32
  end
  enum CLUS_RESSUBCLASS_STORAGE
    CLUS_RESSUBCLASS_STORAGE_SHARED_BUS = -2147483648_i32
    CLUS_RESSUBCLASS_STORAGE_DISK = 1073741824_i32
    CLUS_RESSUBCLASS_STORAGE_REPLICATION = 268435456_i32
  end
  enum CLUS_RESSUBCLASS_NETWORK
    CLUS_RESSUBCLASS_NETWORK_INTERNET_PROTOCOL = -2147483648_i32
  end
  enum CLUS_CHARACTERISTICS
    CLUS_CHAR_UNKNOWN = 0_i32
    CLUS_CHAR_QUORUM = 1_i32
    CLUS_CHAR_DELETE_REQUIRES_ALL_NODES = 2_i32
    CLUS_CHAR_LOCAL_QUORUM = 4_i32
    CLUS_CHAR_LOCAL_QUORUM_DEBUG = 8_i32
    CLUS_CHAR_REQUIRES_STATE_CHANGE_REASON = 16_i32
    CLUS_CHAR_BROADCAST_DELETE = 32_i32
    CLUS_CHAR_SINGLE_CLUSTER_INSTANCE = 64_i32
    CLUS_CHAR_SINGLE_GROUP_INSTANCE = 128_i32
    CLUS_CHAR_COEXIST_IN_SHARED_VOLUME_GROUP = 256_i32
    CLUS_CHAR_PLACEMENT_DATA = 512_i32
    CLUS_CHAR_MONITOR_DETACH = 1024_i32
    CLUS_CHAR_MONITOR_REATTACH = 2048_i32
    CLUS_CHAR_OPERATION_CONTEXT = 4096_i32
    CLUS_CHAR_CLONES = 8192_i32
    CLUS_CHAR_NOT_PREEMPTABLE = 16384_i32
    CLUS_CHAR_NOTIFY_NEW_OWNER = 32768_i32
    CLUS_CHAR_SUPPORTS_UNMONITORED_STATE = 65536_i32
    CLUS_CHAR_INFRASTRUCTURE = 131072_i32
    CLUS_CHAR_VETO_DRAIN = 262144_i32
    CLUS_CHAR_DRAIN_LOCAL_OFFLINE = 524288_i32
  end
  enum CLUS_FLAGS
    CLUS_FLAG_CORE = 1_i32
  end
  enum CLUSPROP_PIFLAGS
    CLUSPROP_PIFLAG_STICKY = 1_i32
    CLUSPROP_PIFLAG_REMOVABLE = 2_i32
    CLUSPROP_PIFLAG_USABLE = 4_i32
    CLUSPROP_PIFLAG_DEFAULT_QUORUM = 8_i32
    CLUSPROP_PIFLAG_USABLE_FOR_CSV = 16_i32
    CLUSPROP_PIFLAG_ENCRYPTION_ENABLED = 32_i32
    CLUSPROP_PIFLAG_RAW = 64_i32
    CLUSPROP_PIFLAG_UNKNOWN = -2147483648_i32
  end
  enum CLUSTER_CSV_VOLUME_FAULT_STATE
    VolumeStateNoFaults = 0_i32
    VolumeStateNoDirectIO = 1_i32
    VolumeStateNoAccess = 2_i32
    VolumeStateInMaintenance = 4_i32
    VolumeStateDismounted = 8_i32
  end
  enum CLUSTER_SHARED_VOLUME_BACKUP_STATE
    VolumeBackupNone = 0_i32
    VolumeBackupInProgress = 1_i32
  end
  enum CLUSTER_SHARED_VOLUME_STATE
    SharedVolumeStateUnavailable = 0_i32
    SharedVolumeStatePaused = 1_i32
    SharedVolumeStateActive = 2_i32
    SharedVolumeStateActiveRedirected = 3_i32
    SharedVolumeStateActiveVolumeRedirected = 4_i32
  end
  enum CLUSTER_SHARED_VOLUME_RENAME_INPUT_TYPE
    ClusterSharedVolumeRenameInputTypeNone = 0_i32
    ClusterSharedVolumeRenameInputTypeVolumeOffset = 1_i32
    ClusterSharedVolumeRenameInputTypeVolumeId = 2_i32
    ClusterSharedVolumeRenameInputTypeVolumeName = 3_i32
    ClusterSharedVolumeRenameInputTypeVolumeGuid = 4_i32
  end
  enum MAINTENANCE_MODE_TYPE_ENUM
    MaintenanceModeTypeDisableIsAliveCheck = 1_i32
    MaintenanceModeTypeOfflineResource = 2_i32
    MaintenanceModeTypeUnclusterResource = 3_i32
  end
  enum CLUSPROP_IPADDR_ENABLENETBIOS
    CLUSPROP_IPADDR_ENABLENETBIOS_DISABLED = 0_i32
    CLUSPROP_IPADDR_ENABLENETBIOS_ENABLED = 1_i32
    CLUSPROP_IPADDR_ENABLENETBIOS_TRACK_NIC = 2_i32
  end
  enum FILESHARE_CHANGE_ENUM
    FILESHARE_CHANGE_NONE = 0_i32
    FILESHARE_CHANGE_ADD = 1_i32
    FILESHARE_CHANGE_DEL = 2_i32
    FILESHARE_CHANGE_MODIFY = 3_i32
  end
  enum CLUSTER_RESOURCE_ENUM
    CLUSTER_RESOURCE_ENUM_DEPENDS = 1_i32
    CLUSTER_RESOURCE_ENUM_PROVIDES = 2_i32
    CLUSTER_RESOURCE_ENUM_NODES = 4_i32
    CLUSTER_RESOURCE_ENUM_ALL = 7_i32
  end
  enum CLUSTER_RESOURCE_TYPE_ENUM
    CLUSTER_RESOURCE_TYPE_ENUM_NODES = 1_i32
    CLUSTER_RESOURCE_TYPE_ENUM_RESOURCES = 2_i32
    CLUSTER_RESOURCE_TYPE_ENUM_ALL = 3_i32
  end
  enum CLUSTER_NETWORK_ENUM
    CLUSTER_NETWORK_ENUM_NETINTERFACES = 1_i32
    CLUSTER_NETWORK_ENUM_ALL = 1_i32
  end
  enum CLUSTER_NETWORK_STATE
    ClusterNetworkStateUnknown = -1_i32
    ClusterNetworkUnavailable = 0_i32
    ClusterNetworkDown = 1_i32
    ClusterNetworkPartitioned = 2_i32
    ClusterNetworkUp = 3_i32
  end
  enum CLUSTER_NETWORK_ROLE
    ClusterNetworkRoleNone = 0_i32
    ClusterNetworkRoleInternalUse = 1_i32
    ClusterNetworkRoleClientAccess = 2_i32
    ClusterNetworkRoleInternalAndClient = 3_i32
  end
  enum CLUSTER_NETINTERFACE_STATE
    ClusterNetInterfaceStateUnknown = -1_i32
    ClusterNetInterfaceUnavailable = 0_i32
    ClusterNetInterfaceFailed = 1_i32
    ClusterNetInterfaceUnreachable = 2_i32
    ClusterNetInterfaceUp = 3_i32
  end
  enum CLUSTER_SETUP_PHASE
    ClusterSetupPhaseInitialize = 1_i32
    ClusterSetupPhaseValidateNodeState = 100_i32
    ClusterSetupPhaseValidateNetft = 102_i32
    ClusterSetupPhaseValidateClusDisk = 103_i32
    ClusterSetupPhaseConfigureClusSvc = 104_i32
    ClusterSetupPhaseStartingClusSvc = 105_i32
    ClusterSetupPhaseQueryClusterNameAccount = 106_i32
    ClusterSetupPhaseValidateClusterNameAccount = 107_i32
    ClusterSetupPhaseCreateClusterAccount = 108_i32
    ClusterSetupPhaseConfigureClusterAccount = 109_i32
    ClusterSetupPhaseFormingCluster = 200_i32
    ClusterSetupPhaseAddClusterProperties = 201_i32
    ClusterSetupPhaseCreateResourceTypes = 202_i32
    ClusterSetupPhaseCreateGroups = 203_i32
    ClusterSetupPhaseCreateIPAddressResources = 204_i32
    ClusterSetupPhaseCreateNetworkName = 205_i32
    ClusterSetupPhaseClusterGroupOnline = 206_i32
    ClusterSetupPhaseGettingCurrentMembership = 300_i32
    ClusterSetupPhaseAddNodeToCluster = 301_i32
    ClusterSetupPhaseNodeUp = 302_i32
    ClusterSetupPhaseMoveGroup = 400_i32
    ClusterSetupPhaseDeleteGroup = 401_i32
    ClusterSetupPhaseCleanupCOs = 402_i32
    ClusterSetupPhaseOfflineGroup = 403_i32
    ClusterSetupPhaseEvictNode = 404_i32
    ClusterSetupPhaseCleanupNode = 405_i32
    ClusterSetupPhaseCoreGroupCleanup = 406_i32
    ClusterSetupPhaseFailureCleanup = 999_i32
  end
  enum CLUSTER_SETUP_PHASE_TYPE
    ClusterSetupPhaseStart = 1_i32
    ClusterSetupPhaseContinue = 2_i32
    ClusterSetupPhaseEnd = 3_i32
    ClusterSetupPhaseReport = 4_i32
  end
  enum CLUSTER_SETUP_PHASE_SEVERITY
    ClusterSetupPhaseInformational = 1_i32
    ClusterSetupPhaseWarning = 2_i32
    ClusterSetupPhaseFatal = 3_i32
  end
  enum PLACEMENT_OPTIONS
    PLACEMENT_OPTIONS_MIN_VALUE = 0_i32
    PLACEMENT_OPTIONS_DEFAULT_PLACEMENT_OPTIONS = 0_i32
    PLACEMENT_OPTIONS_DISABLE_CSV_VM_DEPENDENCY = 1_i32
    PLACEMENT_OPTIONS_CONSIDER_OFFLINE_VMS = 2_i32
    PLACEMENT_OPTIONS_DONT_USE_MEMORY = 4_i32
    PLACEMENT_OPTIONS_DONT_USE_CPU = 8_i32
    PLACEMENT_OPTIONS_DONT_USE_LOCAL_TEMP_DISK = 16_i32
    PLACEMENT_OPTIONS_DONT_RESUME_VMS_WITH_EXISTING_TEMP_DISK = 32_i32
    PLACEMENT_OPTIONS_SAVE_VMS_WITH_LOCAL_DISK_ON_DRAIN_OVERWRITE = 64_i32
    PLACEMENT_OPTIONS_DONT_RESUME_AVAILABILTY_SET_VMS_WITH_EXISTING_TEMP_DISK = 128_i32
    PLACEMENT_OPTIONS_SAVE_AVAILABILTY_SET_VMS_WITH_LOCAL_DISK_ON_DRAIN_OVERWRITE = 256_i32
    PLACEMENT_OPTIONS_AVAILABILITY_SET_DOMAIN_AFFINITY = 512_i32
    PLACEMENT_OPTIONS_ALL = 1023_i32
  end
  enum GRP_PLACEMENT_OPTIONS
    GRP_PLACEMENT_OPTIONS_MIN_VALUE = 0_i32
    GRP_PLACEMENT_OPTIONS_DEFAULT = 0_i32
    GRP_PLACEMENT_OPTIONS_DISABLE_AUTOBALANCING = 1_i32
    GRP_PLACEMENT_OPTIONS_ALL = 1_i32
  end
  enum SR_REPLICATED_DISK_TYPE
    SrReplicatedDiskTypeNone = 0_i32
    SrReplicatedDiskTypeSource = 1_i32
    SrReplicatedDiskTypeLogSource = 2_i32
    SrReplicatedDiskTypeDestination = 3_i32
    SrReplicatedDiskTypeLogDestination = 4_i32
    SrReplicatedDiskTypeNotInParthership = 5_i32
    SrReplicatedDiskTypeLogNotInParthership = 6_i32
    SrReplicatedDiskTypeOther = 7_i32
  end
  enum SR_DISK_REPLICATION_ELIGIBLE
    SrDiskReplicationEligibleNone = 0_i32
    SrDiskReplicationEligibleYes = 1_i32
    SrDiskReplicationEligibleOffline = 2_i32
    SrDiskReplicationEligibleNotGpt = 3_i32
    SrDiskReplicationEligiblePartitionLayoutMismatch = 4_i32
    SrDiskReplicationEligibleInsufficientFreeSpace = 5_i32
    SrDiskReplicationEligibleNotInSameSite = 6_i32
    SrDiskReplicationEligibleInSameSite = 7_i32
    SrDiskReplicationEligibleFileSystemNotSupported = 8_i32
    SrDiskReplicationEligibleAlreadyInReplication = 9_i32
    SrDiskReplicationEligibleSameAsSpecifiedDisk = 10_i32
    SrDiskReplicationEligibleOther = 9999_i32
  end
  enum VM_RESDLL_CONTEXT
    VmResdllContextTurnOff = 0_i32
    VmResdllContextSave = 1_i32
    VmResdllContextShutdown = 2_i32
    VmResdllContextShutdownForce = 3_i32
    VmResdllContextLiveMigration = 4_i32
  end
  enum RESDLL_CONTEXT_OPERATION_TYPE
    ResdllContextOperationTypeFailback = 0_i32
    ResdllContextOperationTypeDrain = 1_i32
    ResdllContextOperationTypeDrainFailure = 2_i32
    ResdllContextOperationTypeEmbeddedFailure = 3_i32
    ResdllContextOperationTypePreemption = 4_i32
    ResdllContextOperationTypeNetworkDisconnect = 5_i32
    ResdllContextOperationTypeNetworkDisconnectMoveRetry = 6_i32
  end
  enum LOG_LEVEL
    LOG_INFORMATION = 0_i32
    LOG_WARNING = 1_i32
    LOG_ERROR = 2_i32
    LOG_SEVERE = 3_i32
  end
  enum RESOURCE_EXIT_STATE
    ResourceExitStateContinue = 0_i32
    ResourceExitStateTerminate = 1_i32
    ResourceExitStateMax = 2_i32
  end
  enum FAILURE_TYPE
    FAILURE_TYPE_GENERAL = 0_i32
    FAILURE_TYPE_EMBEDDED = 1_i32
    FAILURE_TYPE_NETWORK_LOSS = 2_i32
  end
  enum CLUSTER_RESOURCE_APPLICATION_STATE
    ClusterResourceApplicationStateUnknown = 1_i32
    ClusterResourceApplicationOSHeartBeat = 2_i32
    ClusterResourceApplicationReady = 3_i32
  end
  enum RESOURCE_MONITOR_STATE
    RmonInitializing = 0_i32
    RmonIdle = 1_i32
    RmonStartingResource = 2_i32
    RmonInitializingResource = 3_i32
    RmonOnlineResource = 4_i32
    RmonOfflineResource = 5_i32
    RmonShutdownResource = 6_i32
    RmonDeletingResource = 7_i32
    RmonIsAlivePoll = 8_i32
    RmonLooksAlivePoll = 9_i32
    RmonArbitrateResource = 10_i32
    RmonReleaseResource = 11_i32
    RmonResourceControl = 12_i32
    RmonResourceTypeControl = 13_i32
    RmonTerminateResource = 14_i32
    RmonDeadlocked = 15_i32
  end
  enum CLUSTER_ROLE
    ClusterRoleDHCP = 0_i32
    ClusterRoleDTC = 1_i32
    ClusterRoleFileServer = 2_i32
    ClusterRoleGenericApplication = 3_i32
    ClusterRoleGenericScript = 4_i32
    ClusterRoleGenericService = 5_i32
    ClusterRoleISCSINameServer = 6_i32
    ClusterRoleMSMQ = 7_i32
    ClusterRoleNFS = 8_i32
    ClusterRolePrintServer = 9_i32
    ClusterRoleStandAloneNamespaceServer = 10_i32
    ClusterRoleVolumeShadowCopyServiceTask = 11_i32
    ClusterRoleWINS = 12_i32
    ClusterRoleTaskScheduler = 13_i32
    ClusterRoleNetworkFileSystem = 14_i32
    ClusterRoleDFSReplicatedFolder = 15_i32
    ClusterRoleDistributedFileSystem = 16_i32
    ClusterRoleDistributedNetworkName = 17_i32
    ClusterRoleFileShare = 18_i32
    ClusterRoleFileShareWitness = 19_i32
    ClusterRoleHardDisk = 20_i32
    ClusterRoleIPAddress = 21_i32
    ClusterRoleIPV6Address = 22_i32
    ClusterRoleIPV6TunnelAddress = 23_i32
    ClusterRoleISCSITargetServer = 24_i32
    ClusterRoleNetworkName = 25_i32
    ClusterRolePhysicalDisk = 26_i32
    ClusterRoleSODAFileServer = 27_i32
    ClusterRoleStoragePool = 28_i32
    ClusterRoleVirtualMachine = 29_i32
    ClusterRoleVirtualMachineConfiguration = 30_i32
    ClusterRoleVirtualMachineReplicaBroker = 31_i32
  end
  enum CLUSTER_ROLE_STATE
    ClusterRoleUnknown = -1_i32
    ClusterRoleClustered = 0_i32
    ClusterRoleUnclustered = 1_i32
  end
  enum CLUADMEX_OBJECT_TYPE
    CLUADMEX_OT_NONE = 0_i32
    CLUADMEX_OT_CLUSTER = 1_i32
    CLUADMEX_OT_NODE = 2_i32
    CLUADMEX_OT_GROUP = 3_i32
    CLUADMEX_OT_RESOURCE = 4_i32
    CLUADMEX_OT_RESOURCETYPE = 5_i32
    CLUADMEX_OT_NETWORK = 6_i32
    CLUADMEX_OT_NETINTERFACE = 7_i32
  end

  @[Extern]
  record HCLUSTER
  @[Extern]
  record HNODE
  @[Extern]
  record HRESOURCE
  @[Extern]
  record HGROUP
  @[Extern]
  record HNETWORK
  @[Extern]
  record HNETINTERFACE
  @[Extern]
  record HCHANGE
  @[Extern]
  record HCLUSENUM
  @[Extern]
  record HGROUPENUM
  @[Extern]
  record HRESENUM
  @[Extern]
  record HNETWORKENUM
  @[Extern]
  record HNODEENUM
  @[Extern]
  record HNETINTERFACEENUM
  @[Extern]
  record HRESTYPEENUM
  @[Extern]
  record HREGBATCH
  @[Extern]
  record HREGBATCHPORT
  @[Extern]
  record HREGBATCHNOTIFICATION
  @[Extern]
  record HREGREADBATCH
  @[Extern]
  record HREGREADBATCHREPLY
  @[Extern]
  record HNODEENUMEX
  @[Extern]
  record HCLUSENUMEX
  @[Extern]
  record HGROUPENUMEX
  @[Extern]
  record HRESENUMEX
  @[Extern]
  record HGROUPSET
  @[Extern]
  record HGROUPSETENUM
  @[Extern]
  record CLUSTERVERSIONINFO_NT4,
    dwVersionInfoSize : UInt32,
    major_version : UInt16,
    minor_version : UInt16,
    build_number : UInt16,
    szVendorId : UInt16[64],
    szCSDVersion : UInt16[64]

  @[Extern]
  record CLUSTERVERSIONINFO,
    dwVersionInfoSize : UInt32,
    major_version : UInt16,
    minor_version : UInt16,
    build_number : UInt16,
    szVendorId : UInt16[64],
    szCSDVersion : UInt16[64],
    dwClusterHighestVersion : UInt32,
    dwClusterLowestVersion : UInt32,
    dwFlags : UInt32,
    dwReserved : UInt32

  @[Extern]
  record CLUS_STARTING_PARAMS,
    dwSize : UInt32,
    bForm : Win32cr::Foundation::BOOL,
    bFirst : Win32cr::Foundation::BOOL

  @[Extern]
  record CLUSCTL_RESOURCE_STATE_CHANGE_REASON_STRUCT,
    dwSize : UInt32,
    dwVersion : UInt32,
    eReason : Win32cr::Networking::Clustering::CLUSTER_RESOURCE_STATE_CHANGE_REASON

  @[Extern]
  record CLUSTER_BATCH_COMMAND,
    command : Win32cr::Networking::Clustering::CLUSTER_REG_COMMAND,
    dwOptions : UInt32,
    wzName : Win32cr::Foundation::PWSTR,
    lpData : UInt8*,
    cbData : UInt32

  @[Extern]
  record CLUSTER_READ_BATCH_COMMAND,
    command : Win32cr::Networking::Clustering::CLUSTER_REG_COMMAND,
    dwOptions : UInt32,
    wzSubkeyName : Win32cr::Foundation::PWSTR,
    wzValueName : Win32cr::Foundation::PWSTR,
    lpData : UInt8*,
    cbData : UInt32

  @[Extern]
  record CLUSTER_ENUM_ITEM,
    dwVersion : UInt32,
    dwType : UInt32,
    cbId : UInt32,
    lpszId : Win32cr::Foundation::PWSTR,
    cbName : UInt32,
    lpszName : Win32cr::Foundation::PWSTR

  @[Extern]
  record CLUSTER_CREATE_GROUP_INFO,
    dwVersion : UInt32,
    groupType : Win32cr::Networking::Clustering::CLUSGROUP_TYPE

  @[Extern]
  record CLUSTER_VALIDATE_PATH,
    szPath : UInt16*

  @[Extern]
  record CLUSTER_VALIDATE_DIRECTORY,
    szPath : UInt16*

  @[Extern]
  record CLUSTER_VALIDATE_NETNAME,
    szNetworkName : UInt16*

  @[Extern]
  record CLUSTER_VALIDATE_CSV_FILENAME,
    szFileName : UInt16*

  @[Extern]
  record CLUSTER_SET_PASSWORD_STATUS,
    node_id : UInt32,
    set_attempted : Win32cr::Foundation::BOOLEAN,
    return_status : UInt32

  @[Extern]
  record CLUSTER_IP_ENTRY,
    lpszIpAddress : Win32cr::Foundation::PWSTR,
    dwPrefixLength : UInt32

  @[Extern]
  record CREATE_CLUSTER_CONFIG,
    dwVersion : UInt32,
    lpszClusterName : Win32cr::Foundation::PWSTR,
    cNodes : UInt32,
    ppszNodeNames : Win32cr::Foundation::PWSTR*,
    cIpEntries : UInt32,
    pIpEntries : Win32cr::Networking::Clustering::CLUSTER_IP_ENTRY*,
    fEmptyCluster : Win32cr::Foundation::BOOLEAN,
    managementPointType : Win32cr::Networking::Clustering::CLUSTER_MGMT_POINT_TYPE,
    managementPointResType : Win32cr::Networking::Clustering::CLUSTER_MGMT_POINT_RESTYPE

  @[Extern]
  record CREATE_CLUSTER_NAME_ACCOUNT,
    dwVersion : UInt32,
    lpszClusterName : Win32cr::Foundation::PWSTR,
    dwFlags : UInt32,
    pszUserName : Win32cr::Foundation::PWSTR,
    pszPassword : Win32cr::Foundation::PWSTR,
    pszDomain : Win32cr::Foundation::PWSTR,
    managementPointType : Win32cr::Networking::Clustering::CLUSTER_MGMT_POINT_TYPE,
    managementPointResType : Win32cr::Networking::Clustering::CLUSTER_MGMT_POINT_RESTYPE,
    bUpgradeVCOs : Win32cr::Foundation::BOOLEAN

  @[Extern]
  record NOTIFY_FILTER_AND_TYPE,
    dwObjectType : UInt32,
    filter_flags : Int64

  @[Extern]
  record CLUSTER_MEMBERSHIP_INFO,
    has_quorum : Win32cr::Foundation::BOOL,
    upnodes_size : UInt32,
    upnodes : UInt8*

  @[Extern]
  record CLUSTER_AVAILABILITY_SET_CONFIG,
    dwVersion : UInt32,
    dwUpdateDomains : UInt32,
    dwFaultDomains : UInt32,
    bReserveSpareNode : Win32cr::Foundation::BOOL

  @[Extern]
  record CLUSTER_GROUP_ENUM_ITEM,
    dwVersion : UInt32,
    cbId : UInt32,
    lpszId : Win32cr::Foundation::PWSTR,
    cbName : UInt32,
    lpszName : Win32cr::Foundation::PWSTR,
    state : Win32cr::Networking::Clustering::CLUSTER_GROUP_STATE,
    cbOwnerNode : UInt32,
    lpszOwnerNode : Win32cr::Foundation::PWSTR,
    dwFlags : UInt32,
    cbProperties : UInt32,
    pProperties : Void*,
    cbRoProperties : UInt32,
    pRoProperties : Void*

  @[Extern]
  record CLUSTER_RESOURCE_ENUM_ITEM,
    dwVersion : UInt32,
    cbId : UInt32,
    lpszId : Win32cr::Foundation::PWSTR,
    cbName : UInt32,
    lpszName : Win32cr::Foundation::PWSTR,
    cbOwnerGroupName : UInt32,
    lpszOwnerGroupName : Win32cr::Foundation::PWSTR,
    cbOwnerGroupId : UInt32,
    lpszOwnerGroupId : Win32cr::Foundation::PWSTR,
    cbProperties : UInt32,
    pProperties : Void*,
    cbRoProperties : UInt32,
    pRoProperties : Void*

  @[Extern]
  record GROUP_FAILURE_INFO,
    dwFailoverAttemptsRemaining : UInt32,
    dwFailoverPeriodRemaining : UInt32

  @[Extern]
  record GROUP_FAILURE_INFO_BUFFER,
    dwVersion : UInt32,
    info : Win32cr::Networking::Clustering::GROUP_FAILURE_INFO

  @[Extern]
  record RESOURCE_FAILURE_INFO,
    dwRestartAttemptsRemaining : UInt32,
    dwRestartPeriodRemaining : UInt32

  @[Extern]
  record RESOURCE_FAILURE_INFO_BUFFER,
    dwVersion : UInt32,
    info : Win32cr::Networking::Clustering::RESOURCE_FAILURE_INFO

  @[Extern]
  record RESOURCE_TERMINAL_FAILURE_INFO_BUFFER,
    isTerminalFailure : Win32cr::Foundation::BOOL,
    restartPeriodRemaining : UInt32

  @[Extern(union: true)]
  record CLUSPROP_SYNTAX,
    dw : UInt32,
    anonymous : Anonymous_e__Struct do

    # Nested Type Anonymous_e__Struct
    @[Extern]
    record Anonymous_e__Struct,
      wFormat : UInt16,
      wType : UInt16

  end

  @[Extern]
  record CLUSPROP_VALUE,
    syntax : Win32cr::Networking::Clustering::CLUSPROP_SYNTAX,
    cbLength : UInt32

  @[Extern]
  record CLUSPROP_BINARY,
    __anonymous_base_clusapi_l5129_c41 : Win32cr::Networking::Clustering::CLUSPROP_VALUE,
    rgb : UInt8*

  @[Extern]
  record CLUSPROP_WORD,
    __anonymous_base_clusapi_l5139_c39 : Win32cr::Networking::Clustering::CLUSPROP_VALUE,
    w : UInt16

  @[Extern]
  record CLUSPROP_DWORD,
    __anonymous_base_clusapi_l5149_c40 : Win32cr::Networking::Clustering::CLUSPROP_VALUE,
    dw : UInt32

  @[Extern]
  record CLUSPROP_LONG,
    __anonymous_base_clusapi_l5159_c39 : Win32cr::Networking::Clustering::CLUSPROP_VALUE,
    l : Int32

  @[Extern]
  record CLUSPROP_SZ,
    __anonymous_base_clusapi_l5169_c37 : Win32cr::Networking::Clustering::CLUSPROP_VALUE,
    sz : UInt16*

  @[Extern]
  record CLUSPROP_ULARGE_INTEGER,
    __anonymous_base_clusapi_l5186_c14 : Win32cr::Networking::Clustering::CLUSPROP_VALUE,
    li : Win32cr::Foundation::ULARGE_INTEGER

  @[Extern]
  record CLUSPROP_LARGE_INTEGER,
    __anonymous_base_clusapi_l5199_c14 : Win32cr::Networking::Clustering::CLUSPROP_VALUE,
    li : Win32cr::Foundation::LARGE_INTEGER

  @[Extern]
  record CLUSPROP_SECURITY_DESCRIPTOR,
    __anonymous_base_clusapi_l5211_c54 : Win32cr::Networking::Clustering::CLUSPROP_VALUE,
    anonymous : Anonymous_e__Union do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      sd : Win32cr::System::SystemServices::SECURITY_DESCRIPTOR_RELATIVE,
      rgbSecurityDescriptor : UInt8*

  end

  @[Extern]
  record CLUSPROP_FILETIME,
    __anonymous_base_clusapi_l5225_c14 : Win32cr::Networking::Clustering::CLUSPROP_VALUE,
    ft : Win32cr::Foundation::FILETIME

  @[Extern]
  record CLUS_RESOURCE_CLASS_INFO,
    anonymous : Anonymous_e__Union do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      anonymous : Anonymous_e__Struct,
      li : Win32cr::Foundation::ULARGE_INTEGER do

      # Nested Type Anonymous_e__Struct
      @[Extern]
      record Anonymous_e__Struct,
        anonymous : Anonymous_e__Union,
        sub_class : UInt32 do

        # Nested Type Anonymous_e__Union
        @[Extern(union: true)]
        record Anonymous_e__Union,
          dw : UInt32,
          rc : Win32cr::Networking::Clustering::CLUSTER_RESOURCE_CLASS

      end

    end

  end

  @[Extern]
  record CLUSPROP_RESOURCE_CLASS,
    __anonymous_base_clusapi_l5250_c14 : Win32cr::Networking::Clustering::CLUSPROP_VALUE,
    rc : Win32cr::Networking::Clustering::CLUSTER_RESOURCE_CLASS

  @[Extern]
  record CLUSPROP_RESOURCE_CLASS_INFO,
    __anonymous_base_clusapi_l5261_c14 : Win32cr::Networking::Clustering::CLUSPROP_VALUE,
    __anonymous_base_clusapi_l5262_c14 : Win32cr::Networking::Clustering::CLUS_RESOURCE_CLASS_INFO

  @[Extern(union: true)]
  record CLUSPROP_REQUIRED_DEPENDENCY,
    value : Win32cr::Networking::Clustering::CLUSPROP_VALUE,
    res_class : Win32cr::Networking::Clustering::CLUSPROP_RESOURCE_CLASS,
    res_type_name : Win32cr::Networking::Clustering::CLUSPROP_SZ

  @[Extern]
  record CLUS_FORCE_QUORUM_INFO,
    dwSize : UInt32,
    dwNodeBitMask : UInt32,
    dwMaxNumberofNodes : UInt32,
    multiszNodeList : UInt16*

  @[Extern]
  record CLUS_PARTITION_INFO,
    dwFlags : UInt32,
    szDeviceName : UInt16[260],
    szVolumeLabel : UInt16[260],
    dwSerialNumber : UInt32,
    rgdwMaximumComponentLength : UInt32,
    dwFileSystemFlags : UInt32,
    szFileSystem : UInt16[32]

  @[Extern]
  record CLUS_PARTITION_INFO_EX,
    dwFlags : UInt32,
    szDeviceName : UInt16[260],
    szVolumeLabel : UInt16[260],
    dwSerialNumber : UInt32,
    rgdwMaximumComponentLength : UInt32,
    dwFileSystemFlags : UInt32,
    szFileSystem : UInt16[32],
    total_size_in_bytes : Win32cr::Foundation::ULARGE_INTEGER,
    free_size_in_bytes : Win32cr::Foundation::ULARGE_INTEGER,
    device_number : UInt32,
    partition_number : UInt32,
    volume_guid : LibC::GUID

  @[Extern]
  record CLUS_PARTITION_INFO_EX2,
    gpt_partition_id : LibC::GUID,
    szPartitionName : UInt16[260],
    encryption_flags : UInt32

  @[Extern]
  record CLUS_CSV_VOLUME_INFO,
    volume_offset : Win32cr::Foundation::ULARGE_INTEGER,
    partition_number : UInt32,
    fault_state : Win32cr::Networking::Clustering::CLUSTER_CSV_VOLUME_FAULT_STATE,
    backup_state : Win32cr::Networking::Clustering::CLUSTER_SHARED_VOLUME_BACKUP_STATE,
    szVolumeFriendlyName : UInt16[260],
    szVolumeName : UInt16[50]

  @[Extern]
  record CLUS_CSV_VOLUME_NAME,
    volume_offset : Win32cr::Foundation::LARGE_INTEGER,
    szVolumeName : UInt16[260],
    szRootPath : UInt16[263]

  @[Extern]
  record CLUSTER_SHARED_VOLUME_STATE_INFO,
    szVolumeName : UInt16[260],
    szNodeName : UInt16[260],
    volume_state : Win32cr::Networking::Clustering::CLUSTER_SHARED_VOLUME_STATE

  @[Extern]
  record CLUSTER_SHARED_VOLUME_STATE_INFO_EX,
    szVolumeName : UInt16[260],
    szNodeName : UInt16[260],
    volume_state : Win32cr::Networking::Clustering::CLUSTER_SHARED_VOLUME_STATE,
    szVolumeFriendlyName : UInt16[260],
    redirected_io_reason : UInt64,
    volume_redirected_io_reason : UInt64

  @[Extern]
  record CLUSTER_SHARED_VOLUME_RENAME_INPUT_VOLUME,
    input_type : Win32cr::Networking::Clustering::CLUSTER_SHARED_VOLUME_RENAME_INPUT_TYPE,
    anonymous : Anonymous_e__Union do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      volume_offset : UInt64,
      volume_id : UInt16[260],
      volume_name : UInt16[260],
      volume_guid : UInt16[50]

  end

  @[Extern]
  record CLUSTER_SHARED_VOLUME_RENAME_INPUT_NAME,
    new_volume_name : UInt16[260]

  @[Extern]
  record CLUSTER_SHARED_VOLUME_RENAME_INPUT_GUID_NAME,
    new_volume_name : UInt16[260],
    new_volume_guid : UInt16[50]

  @[Extern]
  record CLUSTER_SHARED_VOLUME_RENAME_INPUT,
    __anonymous_base_clusapi_l5464_c14 : Win32cr::Networking::Clustering::CLUSTER_SHARED_VOLUME_RENAME_INPUT_VOLUME,
    __anonymous_base_clusapi_l5465_c14 : Win32cr::Networking::Clustering::CLUSTER_SHARED_VOLUME_RENAME_INPUT_NAME

  @[Extern]
  record CLUSTER_SHARED_VOLUME_RENAME_GUID_INPUT,
    __anonymous_base_clusapi_l5475_c14 : Win32cr::Networking::Clustering::CLUSTER_SHARED_VOLUME_RENAME_INPUT_VOLUME,
    __anonymous_base_clusapi_l5476_c14 : Win32cr::Networking::Clustering::CLUSTER_SHARED_VOLUME_RENAME_INPUT_GUID_NAME

  @[Extern]
  record CLUS_CHKDSK_INFO,
    partition_number : UInt32,
    chkdsk_state : UInt32,
    file_id_count : UInt32,
    file_id_list : UInt64*

  @[Extern]
  record CLUS_DISK_NUMBER_INFO,
    disk_number : UInt32,
    bytes_per_sector : UInt32

  @[Extern]
  record CLUS_SHARED_VOLUME_BACKUP_MODE,
    backup_state : Win32cr::Networking::Clustering::CLUSTER_SHARED_VOLUME_BACKUP_STATE,
    delay_timer_in_secs : UInt32,
    volume_name : UInt16[260]

  @[Extern]
  record CLUSPROP_PARTITION_INFO,
    __anonymous_base_clusapi_l5507_c14 : Win32cr::Networking::Clustering::CLUSPROP_VALUE,
    __anonymous_base_clusapi_l5508_c14 : Win32cr::Networking::Clustering::CLUS_PARTITION_INFO

  @[Extern]
  record CLUSPROP_PARTITION_INFO_EX,
    __anonymous_base_clusapi_l5519_c14 : Win32cr::Networking::Clustering::CLUSPROP_VALUE,
    __anonymous_base_clusapi_l5520_c14 : Win32cr::Networking::Clustering::CLUS_PARTITION_INFO_EX

  @[Extern]
  record CLUSPROP_PARTITION_INFO_EX2,
    __anonymous_base_clusapi_l5533_c14 : Win32cr::Networking::Clustering::CLUSPROP_PARTITION_INFO_EX,
    __anonymous_base_clusapi_l5534_c14 : Win32cr::Networking::Clustering::CLUS_PARTITION_INFO_EX2

  @[Extern]
  record CLUS_FTSET_INFO,
    dwRootSignature : UInt32,
    dwFtType : UInt32

  @[Extern]
  record CLUSPROP_FTSET_INFO,
    __anonymous_base_clusapi_l5555_c14 : Win32cr::Networking::Clustering::CLUSPROP_VALUE,
    __anonymous_base_clusapi_l5556_c14 : Win32cr::Networking::Clustering::CLUS_FTSET_INFO

  @[Extern]
  record CLUS_SCSI_ADDRESS,
    anonymous : Anonymous_e__Union do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      anonymous : Anonymous_e__Struct,
      dw : UInt32 do

      # Nested Type Anonymous_e__Struct
      @[Extern]
      record Anonymous_e__Struct,
        port_number : UInt8,
        path_id : UInt8,
        target_id : UInt8,
        lun : UInt8

    end

  end

  @[Extern]
  record CLUSPROP_SCSI_ADDRESS,
    __anonymous_base_clusapi_l5583_c14 : Win32cr::Networking::Clustering::CLUSPROP_VALUE,
    __anonymous_base_clusapi_l5584_c14 : Win32cr::Networking::Clustering::CLUS_SCSI_ADDRESS

  @[Extern]
  record CLUS_NETNAME_VS_TOKEN_INFO,
    process_id : UInt32,
    desired_access : UInt32,
    inherit_handle : Win32cr::Foundation::BOOL

  @[Extern]
  record CLUS_NETNAME_PWD_INFO,
    flags : UInt32,
    password : UInt16[16],
    creating_dc : UInt16[258],
    object_guid : UInt16[64]

  @[Extern]
  record CLUS_NETNAME_PWD_INFOEX,
    flags : UInt32,
    password : UInt16[128],
    creating_dc : UInt16[258],
    object_guid : UInt16[64]

  @[Extern]
  record CLUS_DNN_LEADER_STATUS,
    is_online : Win32cr::Foundation::BOOL,
    is_file_server_present : Win32cr::Foundation::BOOL

  @[Extern]
  record CLUS_DNN_SODAFS_CLONE_STATUS,
    node_id : UInt32,
    status : Win32cr::Networking::Clustering::CLUSTER_RESOURCE_STATE

  @[Extern]
  record CLUS_NETNAME_IP_INFO_ENTRY,
    node_id : UInt32,
    address_size : UInt32,
    address : UInt8*

  @[Extern]
  record CLUS_NETNAME_IP_INFO_FOR_MULTICHANNEL,
    szName : UInt16[64],
    num_entries : UInt32,
    ip_info : Win32cr::Networking::Clustering::CLUS_NETNAME_IP_INFO_ENTRY*

  @[Extern]
  record CLUS_MAINTENANCE_MODE_INFO,
    in_maintenance : Win32cr::Foundation::BOOL

  @[Extern]
  record CLUS_CSV_MAINTENANCE_MODE_INFO,
    in_maintenance : Win32cr::Foundation::BOOL,
    volume_name : UInt16[260]

  @[Extern]
  record CLUS_MAINTENANCE_MODE_INFOEX,
    in_maintenance : Win32cr::Foundation::BOOL,
    maintainence_mode_type : Win32cr::Networking::Clustering::MAINTENANCE_MODE_TYPE_ENUM,
    internal_state : Win32cr::Networking::Clustering::CLUSTER_RESOURCE_STATE,
    signature : UInt32

  @[Extern]
  record CLUS_SET_MAINTENANCE_MODE_INPUT,
    in_maintenance : Win32cr::Foundation::BOOL,
    extra_parameter_size : UInt32,
    extra_parameter : UInt8*

  @[Extern]
  record CLUS_STORAGE_SET_DRIVELETTER,
    partition_number : UInt32,
    drive_letter_mask : UInt32

  @[Extern]
  record CLUS_STORAGE_GET_AVAILABLE_DRIVELETTERS,
    avail_driveletters_mask : UInt32

  @[Extern]
  record CLUS_STORAGE_REMAP_DRIVELETTER,
    current_drive_letter_mask : UInt32,
    target_drive_letter_mask : UInt32

  @[Extern]
  record CLUS_PROVIDER_STATE_CHANGE_INFO,
    dwSize : UInt32,
    resourceState : Win32cr::Networking::Clustering::CLUSTER_RESOURCE_STATE,
    szProviderId : UInt16*

  @[Extern]
  record CLUS_CREATE_INFRASTRUCTURE_FILESERVER_INPUT,
    file_server_name : UInt16[16]

  @[Extern]
  record CLUS_CREATE_INFRASTRUCTURE_FILESERVER_OUTPUT,
    file_server_name : UInt16[260]

  @[Extern]
  record CLUSPROP_LIST,
    nPropertyCount : UInt32,
    property_name : Win32cr::Networking::Clustering::CLUSPROP_SZ

  @[Extern]
  record FILESHARE_CHANGE,
    change : Win32cr::Networking::Clustering::FILESHARE_CHANGE_ENUM,
    share_name : UInt16[84]

  @[Extern]
  record FILESHARE_CHANGE_LIST,
    num_entries : UInt32,
    change_entry : Win32cr::Networking::Clustering::FILESHARE_CHANGE*

  @[Extern]
  record CLUSCTL_GROUP_GET_LAST_MOVE_TIME_OUTPUT,
    get_tick_count64 : UInt64,
    get_system_time : Win32cr::Foundation::SYSTEMTIME,
    node_id : UInt32

  @[Extern(union: true)]
  record CLUSPROP_BUFFER_HELPER,
    pb : UInt8*,
    pw : UInt16*,
    pdw : UInt32*,
    pl : Int32*,
    psz : Win32cr::Foundation::PWSTR,
    pList : Win32cr::Networking::Clustering::CLUSPROP_LIST*,
    pSyntax : Win32cr::Networking::Clustering::CLUSPROP_SYNTAX*,
    pName : Win32cr::Networking::Clustering::CLUSPROP_SZ*,
    pValue : Win32cr::Networking::Clustering::CLUSPROP_VALUE*,
    pBinaryValue : Win32cr::Networking::Clustering::CLUSPROP_BINARY*,
    pWordValue : Win32cr::Networking::Clustering::CLUSPROP_WORD*,
    pDwordValue : Win32cr::Networking::Clustering::CLUSPROP_DWORD*,
    pLongValue : Win32cr::Networking::Clustering::CLUSPROP_LONG*,
    pULargeIntegerValue : Win32cr::Networking::Clustering::CLUSPROP_ULARGE_INTEGER*,
    pLargeIntegerValue : Win32cr::Networking::Clustering::CLUSPROP_LARGE_INTEGER*,
    pStringValue : Win32cr::Networking::Clustering::CLUSPROP_SZ*,
    pMultiSzValue : Win32cr::Networking::Clustering::CLUSPROP_SZ*,
    pSecurityDescriptor : Win32cr::Networking::Clustering::CLUSPROP_SECURITY_DESCRIPTOR*,
    pResourceClassValue : Win32cr::Networking::Clustering::CLUSPROP_RESOURCE_CLASS*,
    pResourceClassInfoValue : Win32cr::Networking::Clustering::CLUSPROP_RESOURCE_CLASS_INFO*,
    pDiskSignatureValue : Win32cr::Networking::Clustering::CLUSPROP_DWORD*,
    pScsiAddressValue : Win32cr::Networking::Clustering::CLUSPROP_SCSI_ADDRESS*,
    pDiskNumberValue : Win32cr::Networking::Clustering::CLUSPROP_DWORD*,
    pPartitionInfoValue : Win32cr::Networking::Clustering::CLUSPROP_PARTITION_INFO*,
    pRequiredDependencyValue : Win32cr::Networking::Clustering::CLUSPROP_REQUIRED_DEPENDENCY*,
    pPartitionInfoValueEx : Win32cr::Networking::Clustering::CLUSPROP_PARTITION_INFO_EX*,
    pPartitionInfoValueEx2 : Win32cr::Networking::Clustering::CLUSPROP_PARTITION_INFO_EX2*,
    pFileTimeValue : Win32cr::Networking::Clustering::CLUSPROP_FILETIME*

  @[Extern]
  record SR_RESOURCE_TYPE_REPLICATED_PARTITION_INFO,
    partition_offset : UInt64,
    capabilities : UInt32

  @[Extern]
  record SR_RESOURCE_TYPE_REPLICATED_PARTITION_ARRAY,
    count : UInt32,
    partition_array : Win32cr::Networking::Clustering::SR_RESOURCE_TYPE_REPLICATED_PARTITION_INFO*

  @[Extern]
  record SR_RESOURCE_TYPE_QUERY_ELIGIBLE_LOGDISKS,
    data_disk_guid : LibC::GUID,
    include_offline_disks : Win32cr::Foundation::BOOLEAN

  @[Extern]
  record SR_RESOURCE_TYPE_QUERY_ELIGIBLE_TARGET_DATADISKS,
    source_data_disk_guid : LibC::GUID,
    target_replication_group_guid : LibC::GUID,
    skip_connectivity_check : Win32cr::Foundation::BOOLEAN,
    include_offline_disks : Win32cr::Foundation::BOOLEAN

  @[Extern]
  record SR_RESOURCE_TYPE_QUERY_ELIGIBLE_SOURCE_DATADISKS,
    data_disk_guid : LibC::GUID,
    include_available_stoarge_disks : Win32cr::Foundation::BOOLEAN

  @[Extern]
  record SR_RESOURCE_TYPE_DISK_INFO,
    reason : Win32cr::Networking::Clustering::SR_DISK_REPLICATION_ELIGIBLE,
    disk_guid : LibC::GUID

  @[Extern]
  record SR_RESOURCE_TYPE_ELIGIBLE_DISKS_RESULT,
    count : UInt16,
    disk_info : Win32cr::Networking::Clustering::SR_RESOURCE_TYPE_DISK_INFO*

  @[Extern]
  record SR_RESOURCE_TYPE_REPLICATED_DISK,
    type__ : Win32cr::Networking::Clustering::SR_REPLICATED_DISK_TYPE,
    cluster_disk_resource_guid : LibC::GUID,
    replication_group_id : LibC::GUID,
    replication_group_name : UInt16[260]

  @[Extern]
  record SR_RESOURCE_TYPE_REPLICATED_DISKS_RESULT,
    count : UInt16,
    replicated_disks : Win32cr::Networking::Clustering::SR_RESOURCE_TYPE_REPLICATED_DISK*

  @[Extern]
  record SR_RESOURCE_TYPE_ADD_REPLICATION_GROUP,
    replication_group_name : UInt16[260],
    description : UInt16[260],
    log_path : UInt16[260],
    max_log_size_in_bytes : UInt64,
    log_type : UInt16,
    replication_mode : UInt32,
    minimum_partners_in_sync : UInt32,
    enable_write_consistency : Win32cr::Foundation::BOOLEAN,
    enable_encryption : Win32cr::Foundation::BOOLEAN,
    certificate_thumbprint : UInt16[260],
    volume_name_count : UInt32,
    volume_names : UInt16[260]

  @[Extern]
  record SR_RESOURCE_TYPE_ADD_REPLICATION_GROUP_RESULT,
    result : UInt32,
    error_string : UInt16[260]

  @[Extern]
  record CLUSCTL_RESOURCE_TYPE_STORAGE_GET_AVAILABLE_DISKS_EX2_INPUT,
    dwFlags : UInt32,
    guidPoolFilter : LibC::GUID

  @[Extern]
  record RESOURCE_STATUS,
    resource_state : Win32cr::Networking::Clustering::CLUSTER_RESOURCE_STATE,
    check_point : UInt32,
    wait_hint : UInt32,
    event_handle : Win32cr::Foundation::HANDLE

  @[Extern]
  record NodeUtilizationInfoElement,
    id : UInt64,
    available_memory : UInt64,
    available_memory_after_reclamation : UInt64

  @[Extern]
  record ResourceUtilizationInfoElement,
    physical_numa_id : UInt64,
    current_memory : UInt64

  @[Extern]
  record GET_OPERATION_CONTEXT_PARAMS,
    size : UInt32,
    version : UInt32,
    type__ : Win32cr::Networking::Clustering::RESDLL_CONTEXT_OPERATION_TYPE,
    priority : UInt32

  @[Extern]
  record RESOURCE_STATUS_EX,
    resource_state : Win32cr::Networking::Clustering::CLUSTER_RESOURCE_STATE,
    check_point : UInt32,
    event_handle : Win32cr::Foundation::HANDLE,
    application_specific_error_code : UInt32,
    flags : UInt32,
    wait_hint : UInt32

  @[Extern]
  record CLRES_V1_FUNCTIONS,
    open : Win32cr::Networking::Clustering::POPEN_ROUTINE,
    close : Win32cr::Networking::Clustering::PCLOSE_ROUTINE,
    online : Win32cr::Networking::Clustering::PONLINE_ROUTINE,
    offline : Win32cr::Networking::Clustering::POFFLINE_ROUTINE,
    terminate : Win32cr::Networking::Clustering::PTERMINATE_ROUTINE,
    looks_alive : Win32cr::Networking::Clustering::PLOOKS_ALIVE_ROUTINE,
    is_alive : Win32cr::Networking::Clustering::PIS_ALIVE_ROUTINE,
    arbitrate : Win32cr::Networking::Clustering::PARBITRATE_ROUTINE,
    release : Win32cr::Networking::Clustering::PRELEASE_ROUTINE,
    resource_control : Win32cr::Networking::Clustering::PRESOURCE_CONTROL_ROUTINE,
    resource_type_control : Win32cr::Networking::Clustering::PRESOURCE_TYPE_CONTROL_ROUTINE

  @[Extern]
  record CLRES_V2_FUNCTIONS,
    open : Win32cr::Networking::Clustering::POPEN_V2_ROUTINE,
    close : Win32cr::Networking::Clustering::PCLOSE_ROUTINE,
    online : Win32cr::Networking::Clustering::PONLINE_V2_ROUTINE,
    offline : Win32cr::Networking::Clustering::POFFLINE_V2_ROUTINE,
    terminate : Win32cr::Networking::Clustering::PTERMINATE_ROUTINE,
    looks_alive : Win32cr::Networking::Clustering::PLOOKS_ALIVE_ROUTINE,
    is_alive : Win32cr::Networking::Clustering::PIS_ALIVE_ROUTINE,
    arbitrate : Win32cr::Networking::Clustering::PARBITRATE_ROUTINE,
    release : Win32cr::Networking::Clustering::PRELEASE_ROUTINE,
    resource_control : Win32cr::Networking::Clustering::PRESOURCE_CONTROL_ROUTINE,
    resource_type_control : Win32cr::Networking::Clustering::PRESOURCE_TYPE_CONTROL_ROUTINE,
    cancel : Win32cr::Networking::Clustering::PCANCEL_ROUTINE

  @[Extern]
  record CLRES_V3_FUNCTIONS,
    open : Win32cr::Networking::Clustering::POPEN_V2_ROUTINE,
    close : Win32cr::Networking::Clustering::PCLOSE_ROUTINE,
    online : Win32cr::Networking::Clustering::PONLINE_V2_ROUTINE,
    offline : Win32cr::Networking::Clustering::POFFLINE_V2_ROUTINE,
    terminate : Win32cr::Networking::Clustering::PTERMINATE_ROUTINE,
    looks_alive : Win32cr::Networking::Clustering::PLOOKS_ALIVE_ROUTINE,
    is_alive : Win32cr::Networking::Clustering::PIS_ALIVE_ROUTINE,
    arbitrate : Win32cr::Networking::Clustering::PARBITRATE_ROUTINE,
    release : Win32cr::Networking::Clustering::PRELEASE_ROUTINE,
    begin_resource_control : Win32cr::Networking::Clustering::PBEGIN_RESCALL_ROUTINE,
    begin_resource_type_control : Win32cr::Networking::Clustering::PBEGIN_RESTYPECALL_ROUTINE,
    cancel : Win32cr::Networking::Clustering::PCANCEL_ROUTINE

  @[Extern]
  record CLRES_V4_FUNCTIONS,
    open : Win32cr::Networking::Clustering::POPEN_V2_ROUTINE,
    close : Win32cr::Networking::Clustering::PCLOSE_ROUTINE,
    online : Win32cr::Networking::Clustering::PONLINE_V2_ROUTINE,
    offline : Win32cr::Networking::Clustering::POFFLINE_V2_ROUTINE,
    terminate : Win32cr::Networking::Clustering::PTERMINATE_ROUTINE,
    looks_alive : Win32cr::Networking::Clustering::PLOOKS_ALIVE_ROUTINE,
    is_alive : Win32cr::Networking::Clustering::PIS_ALIVE_ROUTINE,
    arbitrate : Win32cr::Networking::Clustering::PARBITRATE_ROUTINE,
    release : Win32cr::Networking::Clustering::PRELEASE_ROUTINE,
    begin_resource_control : Win32cr::Networking::Clustering::PBEGIN_RESCALL_ROUTINE,
    begin_resource_type_control : Win32cr::Networking::Clustering::PBEGIN_RESTYPECALL_ROUTINE,
    cancel : Win32cr::Networking::Clustering::PCANCEL_ROUTINE,
    begin_resource_control_as_user : Win32cr::Networking::Clustering::PBEGIN_RESCALL_AS_USER_ROUTINE,
    begin_resource_type_control_as_user : Win32cr::Networking::Clustering::PBEGIN_RESTYPECALL_AS_USER_ROUTINE

  @[Extern]
  record CLRES_FUNCTION_TABLE,
    table_size : UInt32,
    version : UInt32,
    anonymous : Anonymous_e__Union do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      v1_functions : Win32cr::Networking::Clustering::CLRES_V1_FUNCTIONS,
      v2_functions : Win32cr::Networking::Clustering::CLRES_V2_FUNCTIONS,
      v3_functions : Win32cr::Networking::Clustering::CLRES_V3_FUNCTIONS,
      v4_functions : Win32cr::Networking::Clustering::CLRES_V4_FUNCTIONS

  end

  @[Extern]
  record RESUTIL_LARGEINT_DATA,
    default : Win32cr::Foundation::LARGE_INTEGER,
    minimum : Win32cr::Foundation::LARGE_INTEGER,
    maximum : Win32cr::Foundation::LARGE_INTEGER

  @[Extern]
  record RESUTIL_ULARGEINT_DATA,
    default : Win32cr::Foundation::ULARGE_INTEGER,
    minimum : Win32cr::Foundation::ULARGE_INTEGER,
    maximum : Win32cr::Foundation::ULARGE_INTEGER

  @[Extern]
  record RESUTIL_FILETIME_DATA,
    default : Win32cr::Foundation::FILETIME,
    minimum : Win32cr::Foundation::FILETIME,
    maximum : Win32cr::Foundation::FILETIME

  @[Extern]
  record RESUTIL_PROPERTY_ITEM,
    name : Win32cr::Foundation::PWSTR,
    key_name : Win32cr::Foundation::PWSTR,
    format : UInt32,
    anonymous : Anonymous_e__Union,
    minimum : UInt32,
    maximum : UInt32,
    flags : UInt32,
    offset : UInt32 do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      default_ptr : LibC::UIntPtrT,
      default : UInt32,
      lpDefault : Void*,
      large_int_data : Win32cr::Networking::Clustering::RESUTIL_LARGEINT_DATA*,
      u_large_int_data : Win32cr::Networking::Clustering::RESUTIL_ULARGEINT_DATA*,
      file_time_data : Win32cr::Networking::Clustering::RESUTIL_FILETIME_DATA*

  end

  @[Extern]
  record CLRES_CALLBACK_FUNCTION_TABLE,
    log_event : Win32cr::Networking::Clustering::PLOG_EVENT_ROUTINE,
    set_resource_status_ex : Win32cr::Networking::Clustering::PSET_RESOURCE_STATUS_ROUTINE_EX,
    set_resource_locked_mode : Win32cr::Networking::Clustering::PSET_RESOURCE_LOCKED_MODE_ROUTINE,
    signal_failure : Win32cr::Networking::Clustering::PSIGNAL_FAILURE_ROUTINE,
    set_resource_in_memory_node_local_properties : Win32cr::Networking::Clustering::PSET_RESOURCE_INMEMORY_NODELOCAL_PROPERTIES_ROUTINE,
    end_control_call : Win32cr::Networking::Clustering::PEND_CONTROL_CALL,
    end_type_control_call : Win32cr::Networking::Clustering::PEND_TYPE_CONTROL_CALL,
    extend_control_call : Win32cr::Networking::Clustering::PEXTEND_RES_CONTROL_CALL,
    extend_type_control_call : Win32cr::Networking::Clustering::PEXTEND_RES_TYPE_CONTROL_CALL,
    raise_res_type_notification : Win32cr::Networking::Clustering::PRAISE_RES_TYPE_NOTIFICATION,
    change_resource_process_for_dumps : Win32cr::Networking::Clustering::PCHANGE_RESOURCE_PROCESS_FOR_DUMPS,
    change_res_type_process_for_dumps : Win32cr::Networking::Clustering::PCHANGE_RES_TYPE_PROCESS_FOR_DUMPS,
    set_internal_state : Win32cr::Networking::Clustering::PSET_INTERNAL_STATE,
    set_resource_locked_mode_ex : Win32cr::Networking::Clustering::PSET_RESOURCE_LOCKED_MODE_EX_ROUTINE,
    request_dump : Win32cr::Networking::Clustering::PREQUEST_DUMP_ROUTINE

  @[Extern]
  record MONITOR_STATE,
    last_update : Win32cr::Foundation::LARGE_INTEGER,
    state : Win32cr::Networking::Clustering::RESOURCE_MONITOR_STATE,
    active_resource : Win32cr::Foundation::HANDLE,
    resmon_stop : Win32cr::Foundation::BOOL

  @[Extern]
  record POST_UPGRADE_VERSION_INFO,
    newMajorVersion : UInt32,
    newUpgradeVersion : UInt32,
    oldMajorVersion : UInt32,
    oldUpgradeVersion : UInt32,
    reserved : UInt32

  @[Extern]
  record CLUSTER_HEALTH_FAULT,
    id : Win32cr::Foundation::PWSTR,
    error_type : UInt32,
    error_code : UInt32,
    description : Win32cr::Foundation::PWSTR,
    provider : Win32cr::Foundation::PWSTR,
    flags : UInt32,
    reserved : UInt32

  @[Extern]
  record CLUSTER_HEALTH_FAULT_ARRAY,
    numFaults : UInt32,
    faults : Win32cr::Networking::Clustering::CLUSTER_HEALTH_FAULT*

  @[Extern]
  record CLUS_WORKER,
    hThread : Win32cr::Foundation::HANDLE,
    terminate : Win32cr::Foundation::BOOL

  @[Extern]
  record HCLUSCRYPTPROVIDER
  @[Extern]
  record PaxosTagCStruct,
    __padding__paxos_tag_vtable : UInt64,
    __padding__next_epoch_vtable : UInt64,
    __padding__next_epoch_date_time_vtable : UInt64,
    next_epoch_date_time_ticks : UInt64,
    next_epoch_value : Int32,
    __padding__boundry_next_epoch : UInt32,
    __padding__epoch_vtable : UInt64,
    __padding__epoch_date_time_vtable : UInt64,
    epoch_date_time_ticks : UInt64,
    epoch_value : Int32,
    __padding__boundry_epoch : UInt32,
    sequence : Int32,
    __padding__boundry_sequence : UInt32

  @[Extern]
  record WitnessTagUpdateHelper,
    version : Int32,
    paxosToSet : Win32cr::Networking::Clustering::PaxosTagCStruct,
    paxosToValidate : Win32cr::Networking::Clustering::PaxosTagCStruct

  @[Extern]
  record WitnessTagHelper,
    version : Int32,
    paxosToValidate : Win32cr::Networking::Clustering::PaxosTagCStruct

  @[Extern]
  record IGetClusterUIInfoVtbl,
    query_interface : Proc(IGetClusterUIInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGetClusterUIInfo*, UInt32),
    release : Proc(IGetClusterUIInfo*, UInt32),
    get_cluster_name : Proc(IGetClusterUIInfo*, Win32cr::Foundation::BSTR, Int32*, Win32cr::Foundation::HRESULT),
    get_locale : Proc(IGetClusterUIInfo*, UInt32),
    get_font : Proc(IGetClusterUIInfo*, Win32cr::Graphics::Gdi::HFONT),
    get_icon : Proc(IGetClusterUIInfo*, Win32cr::UI::WindowsAndMessaging::HICON)


  @[Extern]
  #@[Com("97dede50-fc6b-11cf-b5f5-00a0c90ab505")]
  record IGetClusterUIInfo, lpVtbl : IGetClusterUIInfoVtbl* do
    GUID = LibC::GUID.new(0x97dede50_u32, 0xfc6b_u16, 0x11cf_u16, StaticArray[0xb5_u8, 0xf5_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xa_u8, 0xb5_u8, 0x5_u8])
    def query_interface(this : IGetClusterUIInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGetClusterUIInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGetClusterUIInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_cluster_name(this : IGetClusterUIInfo*, lpszName : Win32cr::Foundation::BSTR, pcchName : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cluster_name.call(this, lpszName, pcchName)
    end
    def get_locale(this : IGetClusterUIInfo*) : UInt32
      @lpVtbl.try &.value.get_locale.call(this)
    end
    def get_font(this : IGetClusterUIInfo*) : Win32cr::Graphics::Gdi::HFONT
      @lpVtbl.try &.value.get_font.call(this)
    end
    def get_icon(this : IGetClusterUIInfo*) : Win32cr::UI::WindowsAndMessaging::HICON
      @lpVtbl.try &.value.get_icon.call(this)
    end

  end

  @[Extern]
  record IGetClusterDataInfoVtbl,
    query_interface : Proc(IGetClusterDataInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGetClusterDataInfo*, UInt32),
    release : Proc(IGetClusterDataInfo*, UInt32),
    get_cluster_name : Proc(IGetClusterDataInfo*, Win32cr::Foundation::BSTR, Int32*, Win32cr::Foundation::HRESULT),
    get_cluster_handle : Proc(IGetClusterDataInfo*, Win32cr::Networking::Clustering::HCLUSTER*),
    get_object_count : Proc(IGetClusterDataInfo*, Int32)


  @[Extern]
  #@[Com("97dede51-fc6b-11cf-b5f5-00a0c90ab505")]
  record IGetClusterDataInfo, lpVtbl : IGetClusterDataInfoVtbl* do
    GUID = LibC::GUID.new(0x97dede51_u32, 0xfc6b_u16, 0x11cf_u16, StaticArray[0xb5_u8, 0xf5_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xa_u8, 0xb5_u8, 0x5_u8])
    def query_interface(this : IGetClusterDataInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGetClusterDataInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGetClusterDataInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_cluster_name(this : IGetClusterDataInfo*, lpszName : Win32cr::Foundation::BSTR, pcchName : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cluster_name.call(this, lpszName, pcchName)
    end
    def get_cluster_handle(this : IGetClusterDataInfo*) : Win32cr::Networking::Clustering::HCLUSTER*
      @lpVtbl.try &.value.get_cluster_handle.call(this)
    end
    def get_object_count(this : IGetClusterDataInfo*) : Int32
      @lpVtbl.try &.value.get_object_count.call(this)
    end

  end

  @[Extern]
  record IGetClusterObjectInfoVtbl,
    query_interface : Proc(IGetClusterObjectInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGetClusterObjectInfo*, UInt32),
    release : Proc(IGetClusterObjectInfo*, UInt32),
    get_object_name : Proc(IGetClusterObjectInfo*, Int32, Win32cr::Foundation::BSTR, Int32*, Win32cr::Foundation::HRESULT),
    get_object_type : Proc(IGetClusterObjectInfo*, Int32, Win32cr::Networking::Clustering::CLUADMEX_OBJECT_TYPE)


  @[Extern]
  #@[Com("97dede52-fc6b-11cf-b5f5-00a0c90ab505")]
  record IGetClusterObjectInfo, lpVtbl : IGetClusterObjectInfoVtbl* do
    GUID = LibC::GUID.new(0x97dede52_u32, 0xfc6b_u16, 0x11cf_u16, StaticArray[0xb5_u8, 0xf5_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xa_u8, 0xb5_u8, 0x5_u8])
    def query_interface(this : IGetClusterObjectInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGetClusterObjectInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGetClusterObjectInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_object_name(this : IGetClusterObjectInfo*, lObjIndex : Int32, lpszName : Win32cr::Foundation::BSTR, pcchName : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_name.call(this, lObjIndex, lpszName, pcchName)
    end
    def get_object_type(this : IGetClusterObjectInfo*, lObjIndex : Int32) : Win32cr::Networking::Clustering::CLUADMEX_OBJECT_TYPE
      @lpVtbl.try &.value.get_object_type.call(this, lObjIndex)
    end

  end

  @[Extern]
  record IGetClusterNodeInfoVtbl,
    query_interface : Proc(IGetClusterNodeInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGetClusterNodeInfo*, UInt32),
    release : Proc(IGetClusterNodeInfo*, UInt32),
    get_node_handle : Proc(IGetClusterNodeInfo*, Int32, Win32cr::Networking::Clustering::HNODE*)


  @[Extern]
  #@[Com("97dede53-fc6b-11cf-b5f5-00a0c90ab505")]
  record IGetClusterNodeInfo, lpVtbl : IGetClusterNodeInfoVtbl* do
    GUID = LibC::GUID.new(0x97dede53_u32, 0xfc6b_u16, 0x11cf_u16, StaticArray[0xb5_u8, 0xf5_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xa_u8, 0xb5_u8, 0x5_u8])
    def query_interface(this : IGetClusterNodeInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGetClusterNodeInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGetClusterNodeInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_node_handle(this : IGetClusterNodeInfo*, lObjIndex : Int32) : Win32cr::Networking::Clustering::HNODE*
      @lpVtbl.try &.value.get_node_handle.call(this, lObjIndex)
    end

  end

  @[Extern]
  record IGetClusterGroupInfoVtbl,
    query_interface : Proc(IGetClusterGroupInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGetClusterGroupInfo*, UInt32),
    release : Proc(IGetClusterGroupInfo*, UInt32),
    get_group_handle : Proc(IGetClusterGroupInfo*, Int32, Win32cr::Networking::Clustering::HGROUP*)


  @[Extern]
  #@[Com("97dede54-fc6b-11cf-b5f5-00a0c90ab505")]
  record IGetClusterGroupInfo, lpVtbl : IGetClusterGroupInfoVtbl* do
    GUID = LibC::GUID.new(0x97dede54_u32, 0xfc6b_u16, 0x11cf_u16, StaticArray[0xb5_u8, 0xf5_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xa_u8, 0xb5_u8, 0x5_u8])
    def query_interface(this : IGetClusterGroupInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGetClusterGroupInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGetClusterGroupInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_group_handle(this : IGetClusterGroupInfo*, lObjIndex : Int32) : Win32cr::Networking::Clustering::HGROUP*
      @lpVtbl.try &.value.get_group_handle.call(this, lObjIndex)
    end

  end

  @[Extern]
  record IGetClusterResourceInfoVtbl,
    query_interface : Proc(IGetClusterResourceInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGetClusterResourceInfo*, UInt32),
    release : Proc(IGetClusterResourceInfo*, UInt32),
    get_resource_handle : Proc(IGetClusterResourceInfo*, Int32, Win32cr::Networking::Clustering::HRESOURCE*),
    get_resource_type_name : Proc(IGetClusterResourceInfo*, Int32, Win32cr::Foundation::BSTR, Int32*, Win32cr::Foundation::HRESULT),
    get_resource_network_name : Proc(IGetClusterResourceInfo*, Int32, Win32cr::Foundation::BSTR, UInt32*, Win32cr::Foundation::BOOL)


  @[Extern]
  #@[Com("97dede55-fc6b-11cf-b5f5-00a0c90ab505")]
  record IGetClusterResourceInfo, lpVtbl : IGetClusterResourceInfoVtbl* do
    GUID = LibC::GUID.new(0x97dede55_u32, 0xfc6b_u16, 0x11cf_u16, StaticArray[0xb5_u8, 0xf5_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xa_u8, 0xb5_u8, 0x5_u8])
    def query_interface(this : IGetClusterResourceInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGetClusterResourceInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGetClusterResourceInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_resource_handle(this : IGetClusterResourceInfo*, lObjIndex : Int32) : Win32cr::Networking::Clustering::HRESOURCE*
      @lpVtbl.try &.value.get_resource_handle.call(this, lObjIndex)
    end
    def get_resource_type_name(this : IGetClusterResourceInfo*, lObjIndex : Int32, lpszResTypeName : Win32cr::Foundation::BSTR, pcchResTypeName : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_resource_type_name.call(this, lObjIndex, lpszResTypeName, pcchResTypeName)
    end
    def get_resource_network_name(this : IGetClusterResourceInfo*, lObjIndex : Int32, lpszNetName : Win32cr::Foundation::BSTR, pcchNetName : UInt32*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.get_resource_network_name.call(this, lObjIndex, lpszNetName, pcchNetName)
    end

  end

  @[Extern]
  record IGetClusterNetworkInfoVtbl,
    query_interface : Proc(IGetClusterNetworkInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGetClusterNetworkInfo*, UInt32),
    release : Proc(IGetClusterNetworkInfo*, UInt32),
    get_network_handle : Proc(IGetClusterNetworkInfo*, Int32, Win32cr::Networking::Clustering::HNETWORK*)


  @[Extern]
  #@[Com("97dede56-fc6b-11cf-b5f5-00a0c90ab505")]
  record IGetClusterNetworkInfo, lpVtbl : IGetClusterNetworkInfoVtbl* do
    GUID = LibC::GUID.new(0x97dede56_u32, 0xfc6b_u16, 0x11cf_u16, StaticArray[0xb5_u8, 0xf5_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xa_u8, 0xb5_u8, 0x5_u8])
    def query_interface(this : IGetClusterNetworkInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGetClusterNetworkInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGetClusterNetworkInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_network_handle(this : IGetClusterNetworkInfo*, lObjIndex : Int32) : Win32cr::Networking::Clustering::HNETWORK*
      @lpVtbl.try &.value.get_network_handle.call(this, lObjIndex)
    end

  end

  @[Extern]
  record IGetClusterNetInterfaceInfoVtbl,
    query_interface : Proc(IGetClusterNetInterfaceInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGetClusterNetInterfaceInfo*, UInt32),
    release : Proc(IGetClusterNetInterfaceInfo*, UInt32),
    get_net_interface_handle : Proc(IGetClusterNetInterfaceInfo*, Int32, Win32cr::Networking::Clustering::HNETINTERFACE*)


  @[Extern]
  #@[Com("97dede57-fc6b-11cf-b5f5-00a0c90ab505")]
  record IGetClusterNetInterfaceInfo, lpVtbl : IGetClusterNetInterfaceInfoVtbl* do
    GUID = LibC::GUID.new(0x97dede57_u32, 0xfc6b_u16, 0x11cf_u16, StaticArray[0xb5_u8, 0xf5_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xa_u8, 0xb5_u8, 0x5_u8])
    def query_interface(this : IGetClusterNetInterfaceInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGetClusterNetInterfaceInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGetClusterNetInterfaceInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_net_interface_handle(this : IGetClusterNetInterfaceInfo*, lObjIndex : Int32) : Win32cr::Networking::Clustering::HNETINTERFACE*
      @lpVtbl.try &.value.get_net_interface_handle.call(this, lObjIndex)
    end

  end

  @[Extern]
  record IWCPropertySheetCallbackVtbl,
    query_interface : Proc(IWCPropertySheetCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWCPropertySheetCallback*, UInt32),
    release : Proc(IWCPropertySheetCallback*, UInt32),
    add_property_sheet_page : Proc(IWCPropertySheetCallback*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("97dede60-fc6b-11cf-b5f5-00a0c90ab505")]
  record IWCPropertySheetCallback, lpVtbl : IWCPropertySheetCallbackVtbl* do
    GUID = LibC::GUID.new(0x97dede60_u32, 0xfc6b_u16, 0x11cf_u16, StaticArray[0xb5_u8, 0xf5_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xa_u8, 0xb5_u8, 0x5_u8])
    def query_interface(this : IWCPropertySheetCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWCPropertySheetCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWCPropertySheetCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_property_sheet_page(this : IWCPropertySheetCallback*, hpage : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_property_sheet_page.call(this, hpage)
    end

  end

  @[Extern]
  record IWEExtendPropertySheetVtbl,
    query_interface : Proc(IWEExtendPropertySheet*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWEExtendPropertySheet*, UInt32),
    release : Proc(IWEExtendPropertySheet*, UInt32),
    create_property_sheet_pages : Proc(IWEExtendPropertySheet*, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("97dede61-fc6b-11cf-b5f5-00a0c90ab505")]
  record IWEExtendPropertySheet, lpVtbl : IWEExtendPropertySheetVtbl* do
    GUID = LibC::GUID.new(0x97dede61_u32, 0xfc6b_u16, 0x11cf_u16, StaticArray[0xb5_u8, 0xf5_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xa_u8, 0xb5_u8, 0x5_u8])
    def query_interface(this : IWEExtendPropertySheet*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWEExtendPropertySheet*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWEExtendPropertySheet*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_property_sheet_pages(this : IWEExtendPropertySheet*, piData : Void*, piCallback : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_property_sheet_pages.call(this, piData, piCallback)
    end

  end

  @[Extern]
  record IWCWizardCallbackVtbl,
    query_interface : Proc(IWCWizardCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWCWizardCallback*, UInt32),
    release : Proc(IWCWizardCallback*, UInt32),
    add_wizard_page : Proc(IWCWizardCallback*, Int32*, Win32cr::Foundation::HRESULT),
    enable_next : Proc(IWCWizardCallback*, Int32*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("97dede62-fc6b-11cf-b5f5-00a0c90ab505")]
  record IWCWizardCallback, lpVtbl : IWCWizardCallbackVtbl* do
    GUID = LibC::GUID.new(0x97dede62_u32, 0xfc6b_u16, 0x11cf_u16, StaticArray[0xb5_u8, 0xf5_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xa_u8, 0xb5_u8, 0x5_u8])
    def query_interface(this : IWCWizardCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWCWizardCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWCWizardCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_wizard_page(this : IWCWizardCallback*, hpage : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_wizard_page.call(this, hpage)
    end
    def enable_next(this : IWCWizardCallback*, hpage : Int32*, bEnable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_next.call(this, hpage, bEnable)
    end

  end

  @[Extern]
  record IWEExtendWizardVtbl,
    query_interface : Proc(IWEExtendWizard*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWEExtendWizard*, UInt32),
    release : Proc(IWEExtendWizard*, UInt32),
    create_wizard_pages : Proc(IWEExtendWizard*, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("97dede63-fc6b-11cf-b5f5-00a0c90ab505")]
  record IWEExtendWizard, lpVtbl : IWEExtendWizardVtbl* do
    GUID = LibC::GUID.new(0x97dede63_u32, 0xfc6b_u16, 0x11cf_u16, StaticArray[0xb5_u8, 0xf5_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xa_u8, 0xb5_u8, 0x5_u8])
    def query_interface(this : IWEExtendWizard*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWEExtendWizard*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWEExtendWizard*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_wizard_pages(this : IWEExtendWizard*, piData : Void*, piCallback : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_wizard_pages.call(this, piData, piCallback)
    end

  end

  @[Extern]
  record IWCContextMenuCallbackVtbl,
    query_interface : Proc(IWCContextMenuCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWCContextMenuCallback*, UInt32),
    release : Proc(IWCContextMenuCallback*, UInt32),
    add_extension_menu_item : Proc(IWCContextMenuCallback*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, UInt32, UInt32, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("97dede64-fc6b-11cf-b5f5-00a0c90ab505")]
  record IWCContextMenuCallback, lpVtbl : IWCContextMenuCallbackVtbl* do
    GUID = LibC::GUID.new(0x97dede64_u32, 0xfc6b_u16, 0x11cf_u16, StaticArray[0xb5_u8, 0xf5_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xa_u8, 0xb5_u8, 0x5_u8])
    def query_interface(this : IWCContextMenuCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWCContextMenuCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWCContextMenuCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_extension_menu_item(this : IWCContextMenuCallback*, lpszName : Win32cr::Foundation::BSTR, lpszStatusBarText : Win32cr::Foundation::BSTR, nCommandID : UInt32, nSubmenuCommandID : UInt32, uFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_extension_menu_item.call(this, lpszName, lpszStatusBarText, nCommandID, nSubmenuCommandID, uFlags)
    end

  end

  @[Extern]
  record IWEExtendContextMenuVtbl,
    query_interface : Proc(IWEExtendContextMenu*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWEExtendContextMenu*, UInt32),
    release : Proc(IWEExtendContextMenu*, UInt32),
    add_context_menu_items : Proc(IWEExtendContextMenu*, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("97dede65-fc6b-11cf-b5f5-00a0c90ab505")]
  record IWEExtendContextMenu, lpVtbl : IWEExtendContextMenuVtbl* do
    GUID = LibC::GUID.new(0x97dede65_u32, 0xfc6b_u16, 0x11cf_u16, StaticArray[0xb5_u8, 0xf5_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xa_u8, 0xb5_u8, 0x5_u8])
    def query_interface(this : IWEExtendContextMenu*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWEExtendContextMenu*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWEExtendContextMenu*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_context_menu_items(this : IWEExtendContextMenu*, piData : Void*, piCallback : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_context_menu_items.call(this, piData, piCallback)
    end

  end

  @[Extern]
  record IWEInvokeCommandVtbl,
    query_interface : Proc(IWEInvokeCommand*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWEInvokeCommand*, UInt32),
    release : Proc(IWEInvokeCommand*, UInt32),
    invoke_command : Proc(IWEInvokeCommand*, UInt32, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("97dede66-fc6b-11cf-b5f5-00a0c90ab505")]
  record IWEInvokeCommand, lpVtbl : IWEInvokeCommandVtbl* do
    GUID = LibC::GUID.new(0x97dede66_u32, 0xfc6b_u16, 0x11cf_u16, StaticArray[0xb5_u8, 0xf5_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xa_u8, 0xb5_u8, 0x5_u8])
    def query_interface(this : IWEInvokeCommand*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWEInvokeCommand*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWEInvokeCommand*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def invoke_command(this : IWEInvokeCommand*, nCommandID : UInt32, piData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_command.call(this, nCommandID, piData)
    end

  end

  @[Extern]
  record IWCWizard97CallbackVtbl,
    query_interface : Proc(IWCWizard97Callback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWCWizard97Callback*, UInt32),
    release : Proc(IWCWizard97Callback*, UInt32),
    add_wizard97_page : Proc(IWCWizard97Callback*, Int32*, Win32cr::Foundation::HRESULT),
    enable_next : Proc(IWCWizard97Callback*, Int32*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("97dede67-fc6b-11cf-b5f5-00a0c90ab505")]
  record IWCWizard97Callback, lpVtbl : IWCWizard97CallbackVtbl* do
    GUID = LibC::GUID.new(0x97dede67_u32, 0xfc6b_u16, 0x11cf_u16, StaticArray[0xb5_u8, 0xf5_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xa_u8, 0xb5_u8, 0x5_u8])
    def query_interface(this : IWCWizard97Callback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWCWizard97Callback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWCWizard97Callback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_wizard97_page(this : IWCWizard97Callback*, hpage : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_wizard97_page.call(this, hpage)
    end
    def enable_next(this : IWCWizard97Callback*, hpage : Int32*, bEnable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_next.call(this, hpage, bEnable)
    end

  end

  @[Extern]
  record IWEExtendWizard97Vtbl,
    query_interface : Proc(IWEExtendWizard97*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWEExtendWizard97*, UInt32),
    release : Proc(IWEExtendWizard97*, UInt32),
    create_wizard97_pages : Proc(IWEExtendWizard97*, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("97dede68-fc6b-11cf-b5f5-00a0c90ab505")]
  record IWEExtendWizard97, lpVtbl : IWEExtendWizard97Vtbl* do
    GUID = LibC::GUID.new(0x97dede68_u32, 0xfc6b_u16, 0x11cf_u16, StaticArray[0xb5_u8, 0xf5_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xa_u8, 0xb5_u8, 0x5_u8])
    def query_interface(this : IWEExtendWizard97*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWEExtendWizard97*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWEExtendWizard97*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_wizard97_pages(this : IWEExtendWizard97*, piData : Void*, piCallback : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_wizard97_pages.call(this, piData, piCallback)
    end

  end

  @[Extern]
  record ISClusApplicationVtbl,
    query_interface : Proc(ISClusApplication*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISClusApplication*, UInt32),
    release : Proc(ISClusApplication*, UInt32),
    get_type_info_count : Proc(ISClusApplication*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISClusApplication*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISClusApplication*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISClusApplication*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_DomainNames : Proc(ISClusApplication*, Void**, Win32cr::Foundation::HRESULT),
    get_ClusterNames : Proc(ISClusApplication*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    open_cluster : Proc(ISClusApplication*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f2e606e6-2631-11d1-89f1-00a0c90d061e")]
  record ISClusApplication, lpVtbl : ISClusApplicationVtbl* do
    GUID = LibC::GUID.new(0xf2e606e6_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])
    def query_interface(this : ISClusApplication*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISClusApplication*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISClusApplication*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISClusApplication*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISClusApplication*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISClusApplication*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISClusApplication*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_DomainNames(this : ISClusApplication*, ppDomains : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DomainNames.call(this, ppDomains)
    end
    def get_ClusterNames(this : ISClusApplication*, bstrDomainName : Win32cr::Foundation::BSTR, ppClusters : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClusterNames.call(this, bstrDomainName, ppClusters)
    end
    def open_cluster(this : ISClusApplication*, bstrClusterName : Win32cr::Foundation::BSTR, pCluster : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_cluster.call(this, bstrClusterName, pCluster)
    end

  end

  @[Extern]
  record ISDomainNamesVtbl,
    query_interface : Proc(ISDomainNames*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISDomainNames*, UInt32),
    release : Proc(ISDomainNames*, UInt32),
    get_type_info_count : Proc(ISDomainNames*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISDomainNames*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISDomainNames*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISDomainNames*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ISDomainNames*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ISDomainNames*, Void**, Win32cr::Foundation::HRESULT),
    refresh : Proc(ISDomainNames*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(ISDomainNames*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f2e606e2-2631-11d1-89f1-00a0c90d061e")]
  record ISDomainNames, lpVtbl : ISDomainNamesVtbl* do
    GUID = LibC::GUID.new(0xf2e606e2_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])
    def query_interface(this : ISDomainNames*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISDomainNames*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISDomainNames*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISDomainNames*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISDomainNames*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISDomainNames*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISDomainNames*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ISDomainNames*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end
    def get__NewEnum(this : ISDomainNames*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end
    def refresh(this : ISDomainNames*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def get_Item(this : ISDomainNames*, varIndex : Win32cr::System::Com::VARIANT, pbstrDomainName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, varIndex, pbstrDomainName)
    end

  end

  @[Extern]
  record ISClusterNamesVtbl,
    query_interface : Proc(ISClusterNames*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISClusterNames*, UInt32),
    release : Proc(ISClusterNames*, UInt32),
    get_type_info_count : Proc(ISClusterNames*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISClusterNames*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISClusterNames*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISClusterNames*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ISClusterNames*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ISClusterNames*, Void**, Win32cr::Foundation::HRESULT),
    refresh : Proc(ISClusterNames*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(ISClusterNames*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DomainName : Proc(ISClusterNames*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f2e606ec-2631-11d1-89f1-00a0c90d061e")]
  record ISClusterNames, lpVtbl : ISClusterNamesVtbl* do
    GUID = LibC::GUID.new(0xf2e606ec_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])
    def query_interface(this : ISClusterNames*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISClusterNames*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISClusterNames*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISClusterNames*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISClusterNames*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISClusterNames*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISClusterNames*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ISClusterNames*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end
    def get__NewEnum(this : ISClusterNames*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end
    def refresh(this : ISClusterNames*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def get_Item(this : ISClusterNames*, varIndex : Win32cr::System::Com::VARIANT, pbstrClusterName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, varIndex, pbstrClusterName)
    end
    def get_DomainName(this : ISClusterNames*, pbstrDomainName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DomainName.call(this, pbstrDomainName)
    end

  end

  @[Extern]
  record ISClusRefObjectVtbl,
    query_interface : Proc(ISClusRefObject*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISClusRefObject*, UInt32),
    release : Proc(ISClusRefObject*, UInt32),
    get_type_info_count : Proc(ISClusRefObject*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISClusRefObject*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISClusRefObject*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISClusRefObject*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Handle : Proc(ISClusRefObject*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f2e60702-2631-11d1-89f1-00a0c90d061e")]
  record ISClusRefObject, lpVtbl : ISClusRefObjectVtbl* do
    GUID = LibC::GUID.new(0xf2e60702_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])
    def query_interface(this : ISClusRefObject*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISClusRefObject*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISClusRefObject*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISClusRefObject*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISClusRefObject*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISClusRefObject*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISClusRefObject*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Handle(this : ISClusRefObject*, phandle : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Handle.call(this, phandle)
    end

  end

  @[Extern]
  record ISClusVersionVtbl,
    query_interface : Proc(ISClusVersion*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISClusVersion*, UInt32),
    release : Proc(ISClusVersion*, UInt32),
    get_type_info_count : Proc(ISClusVersion*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISClusVersion*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISClusVersion*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISClusVersion*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(ISClusVersion*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_MajorVersion : Proc(ISClusVersion*, Int32*, Win32cr::Foundation::HRESULT),
    get_MinorVersion : Proc(ISClusVersion*, Int32*, Win32cr::Foundation::HRESULT),
    get_BuildNumber : Proc(ISClusVersion*, Int16*, Win32cr::Foundation::HRESULT),
    get_VendorId : Proc(ISClusVersion*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CSDVersion : Proc(ISClusVersion*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ClusterHighestVersion : Proc(ISClusVersion*, Int32*, Win32cr::Foundation::HRESULT),
    get_ClusterLowestVersion : Proc(ISClusVersion*, Int32*, Win32cr::Foundation::HRESULT),
    get_Flags : Proc(ISClusVersion*, Int32*, Win32cr::Foundation::HRESULT),
    get_MixedVersion : Proc(ISClusVersion*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f2e60716-2631-11d1-89f1-00a0c90d061e")]
  record ISClusVersion, lpVtbl : ISClusVersionVtbl* do
    GUID = LibC::GUID.new(0xf2e60716_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])
    def query_interface(this : ISClusVersion*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISClusVersion*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISClusVersion*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISClusVersion*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISClusVersion*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISClusVersion*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISClusVersion*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : ISClusVersion*, pbstrClusterName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbstrClusterName)
    end
    def get_MajorVersion(this : ISClusVersion*, pnMajorVersion : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MajorVersion.call(this, pnMajorVersion)
    end
    def get_MinorVersion(this : ISClusVersion*, pnMinorVersion : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MinorVersion.call(this, pnMinorVersion)
    end
    def get_BuildNumber(this : ISClusVersion*, pnBuildNumber : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BuildNumber.call(this, pnBuildNumber)
    end
    def get_VendorId(this : ISClusVersion*, pbstrVendorId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_VendorId.call(this, pbstrVendorId)
    end
    def get_CSDVersion(this : ISClusVersion*, pbstrCSDVersion : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CSDVersion.call(this, pbstrCSDVersion)
    end
    def get_ClusterHighestVersion(this : ISClusVersion*, pnClusterHighestVersion : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClusterHighestVersion.call(this, pnClusterHighestVersion)
    end
    def get_ClusterLowestVersion(this : ISClusVersion*, pnClusterLowestVersion : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClusterLowestVersion.call(this, pnClusterLowestVersion)
    end
    def get_Flags(this : ISClusVersion*, pnFlags : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Flags.call(this, pnFlags)
    end
    def get_MixedVersion(this : ISClusVersion*, pvarMixedVersion : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MixedVersion.call(this, pvarMixedVersion)
    end

  end

  @[Extern]
  record ISClusterVtbl,
    query_interface : Proc(ISCluster*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISCluster*, UInt32),
    release : Proc(ISCluster*, UInt32),
    get_type_info_count : Proc(ISCluster*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISCluster*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISCluster*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISCluster*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_CommonProperties : Proc(ISCluster*, Void**, Win32cr::Foundation::HRESULT),
    get_PrivateProperties : Proc(ISCluster*, Void**, Win32cr::Foundation::HRESULT),
    get_CommonROProperties : Proc(ISCluster*, Void**, Win32cr::Foundation::HRESULT),
    get_PrivateROProperties : Proc(ISCluster*, Void**, Win32cr::Foundation::HRESULT),
    get_Handle : Proc(ISCluster*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    open : Proc(ISCluster*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Name : Proc(ISCluster*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(ISCluster*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Version : Proc(ISCluster*, Void**, Win32cr::Foundation::HRESULT),
    put_QuorumResource : Proc(ISCluster*, Void*, Win32cr::Foundation::HRESULT),
    get_QuorumResource : Proc(ISCluster*, Void**, Win32cr::Foundation::HRESULT),
    get_QuorumLogSize : Proc(ISCluster*, Int32*, Win32cr::Foundation::HRESULT),
    put_QuorumLogSize : Proc(ISCluster*, Int32, Win32cr::Foundation::HRESULT),
    get_QuorumPath : Proc(ISCluster*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_QuorumPath : Proc(ISCluster*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Nodes : Proc(ISCluster*, Void**, Win32cr::Foundation::HRESULT),
    get_ResourceGroups : Proc(ISCluster*, Void**, Win32cr::Foundation::HRESULT),
    get_Resources : Proc(ISCluster*, Void**, Win32cr::Foundation::HRESULT),
    get_ResourceTypes : Proc(ISCluster*, Void**, Win32cr::Foundation::HRESULT),
    get_Networks : Proc(ISCluster*, Void**, Win32cr::Foundation::HRESULT),
    get_NetInterfaces : Proc(ISCluster*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f2e606e4-2631-11d1-89f1-00a0c90d061e")]
  record ISCluster, lpVtbl : ISClusterVtbl* do
    GUID = LibC::GUID.new(0xf2e606e4_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])
    def query_interface(this : ISCluster*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISCluster*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISCluster*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISCluster*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISCluster*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISCluster*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISCluster*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_CommonProperties(this : ISCluster*, ppProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CommonProperties.call(this, ppProperties)
    end
    def get_PrivateProperties(this : ISCluster*, ppProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PrivateProperties.call(this, ppProperties)
    end
    def get_CommonROProperties(this : ISCluster*, ppProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CommonROProperties.call(this, ppProperties)
    end
    def get_PrivateROProperties(this : ISCluster*, ppProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PrivateROProperties.call(this, ppProperties)
    end
    def get_Handle(this : ISCluster*, phandle : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Handle.call(this, phandle)
    end
    def open(this : ISCluster*, bstrClusterName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open.call(this, bstrClusterName)
    end
    def get_Name(this : ISCluster*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbstrName)
    end
    def put_Name(this : ISCluster*, bstrClusterName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, bstrClusterName)
    end
    def get_Version(this : ISCluster*, ppClusVersion : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Version.call(this, ppClusVersion)
    end
    def put_QuorumResource(this : ISCluster*, pClusterResource : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_QuorumResource.call(this, pClusterResource)
    end
    def get_QuorumResource(this : ISCluster*, pClusterResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_QuorumResource.call(this, pClusterResource)
    end
    def get_QuorumLogSize(this : ISCluster*, pnLogSize : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_QuorumLogSize.call(this, pnLogSize)
    end
    def put_QuorumLogSize(this : ISCluster*, nLogSize : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_QuorumLogSize.call(this, nLogSize)
    end
    def get_QuorumPath(this : ISCluster*, ppPath : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_QuorumPath.call(this, ppPath)
    end
    def put_QuorumPath(this : ISCluster*, pPath : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_QuorumPath.call(this, pPath)
    end
    def get_Nodes(this : ISCluster*, ppNodes : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Nodes.call(this, ppNodes)
    end
    def get_ResourceGroups(this : ISCluster*, ppClusterResourceGroups : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ResourceGroups.call(this, ppClusterResourceGroups)
    end
    def get_Resources(this : ISCluster*, ppClusterResources : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Resources.call(this, ppClusterResources)
    end
    def get_ResourceTypes(this : ISCluster*, ppResourceTypes : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ResourceTypes.call(this, ppResourceTypes)
    end
    def get_Networks(this : ISCluster*, ppNetworks : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Networks.call(this, ppNetworks)
    end
    def get_NetInterfaces(this : ISCluster*, ppNetInterfaces : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NetInterfaces.call(this, ppNetInterfaces)
    end

  end

  @[Extern]
  record ISClusNodeVtbl,
    query_interface : Proc(ISClusNode*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISClusNode*, UInt32),
    release : Proc(ISClusNode*, UInt32),
    get_type_info_count : Proc(ISClusNode*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISClusNode*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISClusNode*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISClusNode*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_CommonProperties : Proc(ISClusNode*, Void**, Win32cr::Foundation::HRESULT),
    get_PrivateProperties : Proc(ISClusNode*, Void**, Win32cr::Foundation::HRESULT),
    get_CommonROProperties : Proc(ISClusNode*, Void**, Win32cr::Foundation::HRESULT),
    get_PrivateROProperties : Proc(ISClusNode*, Void**, Win32cr::Foundation::HRESULT),
    get_Name : Proc(ISClusNode*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Handle : Proc(ISClusNode*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_NodeID : Proc(ISClusNode*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_State : Proc(ISClusNode*, Win32cr::Networking::Clustering::CLUSTER_NODE_STATE*, Win32cr::Foundation::HRESULT),
    pause : Proc(ISClusNode*, Win32cr::Foundation::HRESULT),
    resume : Proc(ISClusNode*, Win32cr::Foundation::HRESULT),
    evict : Proc(ISClusNode*, Win32cr::Foundation::HRESULT),
    get_ResourceGroups : Proc(ISClusNode*, Void**, Win32cr::Foundation::HRESULT),
    get_Cluster : Proc(ISClusNode*, Void**, Win32cr::Foundation::HRESULT),
    get_NetInterfaces : Proc(ISClusNode*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f2e606f8-2631-11d1-89f1-00a0c90d061e")]
  record ISClusNode, lpVtbl : ISClusNodeVtbl* do
    GUID = LibC::GUID.new(0xf2e606f8_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])
    def query_interface(this : ISClusNode*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISClusNode*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISClusNode*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISClusNode*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISClusNode*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISClusNode*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISClusNode*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_CommonProperties(this : ISClusNode*, ppProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CommonProperties.call(this, ppProperties)
    end
    def get_PrivateProperties(this : ISClusNode*, ppProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PrivateProperties.call(this, ppProperties)
    end
    def get_CommonROProperties(this : ISClusNode*, ppProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CommonROProperties.call(this, ppProperties)
    end
    def get_PrivateROProperties(this : ISClusNode*, ppProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PrivateROProperties.call(this, ppProperties)
    end
    def get_Name(this : ISClusNode*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbstrName)
    end
    def get_Handle(this : ISClusNode*, phandle : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Handle.call(this, phandle)
    end
    def get_NodeID(this : ISClusNode*, pbstrNodeID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NodeID.call(this, pbstrNodeID)
    end
    def get_State(this : ISClusNode*, dwState : Win32cr::Networking::Clustering::CLUSTER_NODE_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_State.call(this, dwState)
    end
    def pause(this : ISClusNode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pause.call(this)
    end
    def resume(this : ISClusNode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume.call(this)
    end
    def evict(this : ISClusNode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.evict.call(this)
    end
    def get_ResourceGroups(this : ISClusNode*, ppResourceGroups : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ResourceGroups.call(this, ppResourceGroups)
    end
    def get_Cluster(this : ISClusNode*, ppCluster : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Cluster.call(this, ppCluster)
    end
    def get_NetInterfaces(this : ISClusNode*, ppClusNetInterfaces : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NetInterfaces.call(this, ppClusNetInterfaces)
    end

  end

  @[Extern]
  record ISClusNodesVtbl,
    query_interface : Proc(ISClusNodes*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISClusNodes*, UInt32),
    release : Proc(ISClusNodes*, UInt32),
    get_type_info_count : Proc(ISClusNodes*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISClusNodes*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISClusNodes*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISClusNodes*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ISClusNodes*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ISClusNodes*, Void**, Win32cr::Foundation::HRESULT),
    refresh : Proc(ISClusNodes*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(ISClusNodes*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f2e606fa-2631-11d1-89f1-00a0c90d061e")]
  record ISClusNodes, lpVtbl : ISClusNodesVtbl* do
    GUID = LibC::GUID.new(0xf2e606fa_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])
    def query_interface(this : ISClusNodes*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISClusNodes*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISClusNodes*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISClusNodes*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISClusNodes*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISClusNodes*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISClusNodes*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ISClusNodes*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end
    def get__NewEnum(this : ISClusNodes*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end
    def refresh(this : ISClusNodes*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def get_Item(this : ISClusNodes*, varIndex : Win32cr::System::Com::VARIANT, ppNode : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, varIndex, ppNode)
    end

  end

  @[Extern]
  record ISClusNetworkVtbl,
    query_interface : Proc(ISClusNetwork*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISClusNetwork*, UInt32),
    release : Proc(ISClusNetwork*, UInt32),
    get_type_info_count : Proc(ISClusNetwork*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISClusNetwork*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISClusNetwork*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISClusNetwork*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_CommonProperties : Proc(ISClusNetwork*, Void**, Win32cr::Foundation::HRESULT),
    get_PrivateProperties : Proc(ISClusNetwork*, Void**, Win32cr::Foundation::HRESULT),
    get_CommonROProperties : Proc(ISClusNetwork*, Void**, Win32cr::Foundation::HRESULT),
    get_PrivateROProperties : Proc(ISClusNetwork*, Void**, Win32cr::Foundation::HRESULT),
    get_Handle : Proc(ISClusNetwork*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(ISClusNetwork*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(ISClusNetwork*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_NetworkID : Proc(ISClusNetwork*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_State : Proc(ISClusNetwork*, Win32cr::Networking::Clustering::CLUSTER_NETWORK_STATE*, Win32cr::Foundation::HRESULT),
    get_NetInterfaces : Proc(ISClusNetwork*, Void**, Win32cr::Foundation::HRESULT),
    get_Cluster : Proc(ISClusNetwork*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f2e606f2-2631-11d1-89f1-00a0c90d061e")]
  record ISClusNetwork, lpVtbl : ISClusNetworkVtbl* do
    GUID = LibC::GUID.new(0xf2e606f2_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])
    def query_interface(this : ISClusNetwork*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISClusNetwork*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISClusNetwork*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISClusNetwork*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISClusNetwork*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISClusNetwork*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISClusNetwork*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_CommonProperties(this : ISClusNetwork*, ppProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CommonProperties.call(this, ppProperties)
    end
    def get_PrivateProperties(this : ISClusNetwork*, ppProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PrivateProperties.call(this, ppProperties)
    end
    def get_CommonROProperties(this : ISClusNetwork*, ppProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CommonROProperties.call(this, ppProperties)
    end
    def get_PrivateROProperties(this : ISClusNetwork*, ppProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PrivateROProperties.call(this, ppProperties)
    end
    def get_Handle(this : ISClusNetwork*, phandle : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Handle.call(this, phandle)
    end
    def get_Name(this : ISClusNetwork*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbstrName)
    end
    def put_Name(this : ISClusNetwork*, bstrNetworkName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, bstrNetworkName)
    end
    def get_NetworkID(this : ISClusNetwork*, pbstrNetworkID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NetworkID.call(this, pbstrNetworkID)
    end
    def get_State(this : ISClusNetwork*, dwState : Win32cr::Networking::Clustering::CLUSTER_NETWORK_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_State.call(this, dwState)
    end
    def get_NetInterfaces(this : ISClusNetwork*, ppClusNetInterfaces : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NetInterfaces.call(this, ppClusNetInterfaces)
    end
    def get_Cluster(this : ISClusNetwork*, ppCluster : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Cluster.call(this, ppCluster)
    end

  end

  @[Extern]
  record ISClusNetworksVtbl,
    query_interface : Proc(ISClusNetworks*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISClusNetworks*, UInt32),
    release : Proc(ISClusNetworks*, UInt32),
    get_type_info_count : Proc(ISClusNetworks*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISClusNetworks*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISClusNetworks*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISClusNetworks*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ISClusNetworks*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ISClusNetworks*, Void**, Win32cr::Foundation::HRESULT),
    refresh : Proc(ISClusNetworks*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(ISClusNetworks*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f2e606f4-2631-11d1-89f1-00a0c90d061e")]
  record ISClusNetworks, lpVtbl : ISClusNetworksVtbl* do
    GUID = LibC::GUID.new(0xf2e606f4_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])
    def query_interface(this : ISClusNetworks*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISClusNetworks*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISClusNetworks*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISClusNetworks*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISClusNetworks*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISClusNetworks*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISClusNetworks*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ISClusNetworks*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end
    def get__NewEnum(this : ISClusNetworks*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end
    def refresh(this : ISClusNetworks*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def get_Item(this : ISClusNetworks*, varIndex : Win32cr::System::Com::VARIANT, ppClusNetwork : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, varIndex, ppClusNetwork)
    end

  end

  @[Extern]
  record ISClusNetInterfaceVtbl,
    query_interface : Proc(ISClusNetInterface*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISClusNetInterface*, UInt32),
    release : Proc(ISClusNetInterface*, UInt32),
    get_type_info_count : Proc(ISClusNetInterface*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISClusNetInterface*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISClusNetInterface*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISClusNetInterface*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_CommonProperties : Proc(ISClusNetInterface*, Void**, Win32cr::Foundation::HRESULT),
    get_PrivateProperties : Proc(ISClusNetInterface*, Void**, Win32cr::Foundation::HRESULT),
    get_CommonROProperties : Proc(ISClusNetInterface*, Void**, Win32cr::Foundation::HRESULT),
    get_PrivateROProperties : Proc(ISClusNetInterface*, Void**, Win32cr::Foundation::HRESULT),
    get_Name : Proc(ISClusNetInterface*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Handle : Proc(ISClusNetInterface*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_State : Proc(ISClusNetInterface*, Win32cr::Networking::Clustering::CLUSTER_NETINTERFACE_STATE*, Win32cr::Foundation::HRESULT),
    get_Cluster : Proc(ISClusNetInterface*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f2e606ee-2631-11d1-89f1-00a0c90d061e")]
  record ISClusNetInterface, lpVtbl : ISClusNetInterfaceVtbl* do
    GUID = LibC::GUID.new(0xf2e606ee_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])
    def query_interface(this : ISClusNetInterface*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISClusNetInterface*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISClusNetInterface*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISClusNetInterface*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISClusNetInterface*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISClusNetInterface*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISClusNetInterface*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_CommonProperties(this : ISClusNetInterface*, ppProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CommonProperties.call(this, ppProperties)
    end
    def get_PrivateProperties(this : ISClusNetInterface*, ppProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PrivateProperties.call(this, ppProperties)
    end
    def get_CommonROProperties(this : ISClusNetInterface*, ppProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CommonROProperties.call(this, ppProperties)
    end
    def get_PrivateROProperties(this : ISClusNetInterface*, ppProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PrivateROProperties.call(this, ppProperties)
    end
    def get_Name(this : ISClusNetInterface*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbstrName)
    end
    def get_Handle(this : ISClusNetInterface*, phandle : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Handle.call(this, phandle)
    end
    def get_State(this : ISClusNetInterface*, dwState : Win32cr::Networking::Clustering::CLUSTER_NETINTERFACE_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_State.call(this, dwState)
    end
    def get_Cluster(this : ISClusNetInterface*, ppCluster : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Cluster.call(this, ppCluster)
    end

  end

  @[Extern]
  record ISClusNetInterfacesVtbl,
    query_interface : Proc(ISClusNetInterfaces*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISClusNetInterfaces*, UInt32),
    release : Proc(ISClusNetInterfaces*, UInt32),
    get_type_info_count : Proc(ISClusNetInterfaces*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISClusNetInterfaces*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISClusNetInterfaces*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISClusNetInterfaces*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ISClusNetInterfaces*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ISClusNetInterfaces*, Void**, Win32cr::Foundation::HRESULT),
    refresh : Proc(ISClusNetInterfaces*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(ISClusNetInterfaces*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f2e606f0-2631-11d1-89f1-00a0c90d061e")]
  record ISClusNetInterfaces, lpVtbl : ISClusNetInterfacesVtbl* do
    GUID = LibC::GUID.new(0xf2e606f0_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])
    def query_interface(this : ISClusNetInterfaces*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISClusNetInterfaces*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISClusNetInterfaces*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISClusNetInterfaces*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISClusNetInterfaces*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISClusNetInterfaces*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISClusNetInterfaces*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ISClusNetInterfaces*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end
    def get__NewEnum(this : ISClusNetInterfaces*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end
    def refresh(this : ISClusNetInterfaces*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def get_Item(this : ISClusNetInterfaces*, varIndex : Win32cr::System::Com::VARIANT, ppClusNetInterface : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, varIndex, ppClusNetInterface)
    end

  end

  @[Extern]
  record ISClusNodeNetInterfacesVtbl,
    query_interface : Proc(ISClusNodeNetInterfaces*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISClusNodeNetInterfaces*, UInt32),
    release : Proc(ISClusNodeNetInterfaces*, UInt32),
    get_type_info_count : Proc(ISClusNodeNetInterfaces*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISClusNodeNetInterfaces*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISClusNodeNetInterfaces*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISClusNodeNetInterfaces*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ISClusNodeNetInterfaces*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ISClusNodeNetInterfaces*, Void**, Win32cr::Foundation::HRESULT),
    refresh : Proc(ISClusNodeNetInterfaces*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(ISClusNodeNetInterfaces*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f2e606fc-2631-11d1-89f1-00a0c90d061e")]
  record ISClusNodeNetInterfaces, lpVtbl : ISClusNodeNetInterfacesVtbl* do
    GUID = LibC::GUID.new(0xf2e606fc_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])
    def query_interface(this : ISClusNodeNetInterfaces*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISClusNodeNetInterfaces*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISClusNodeNetInterfaces*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISClusNodeNetInterfaces*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISClusNodeNetInterfaces*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISClusNodeNetInterfaces*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISClusNodeNetInterfaces*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ISClusNodeNetInterfaces*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end
    def get__NewEnum(this : ISClusNodeNetInterfaces*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end
    def refresh(this : ISClusNodeNetInterfaces*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def get_Item(this : ISClusNodeNetInterfaces*, varIndex : Win32cr::System::Com::VARIANT, ppClusNetInterface : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, varIndex, ppClusNetInterface)
    end

  end

  @[Extern]
  record ISClusNetworkNetInterfacesVtbl,
    query_interface : Proc(ISClusNetworkNetInterfaces*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISClusNetworkNetInterfaces*, UInt32),
    release : Proc(ISClusNetworkNetInterfaces*, UInt32),
    get_type_info_count : Proc(ISClusNetworkNetInterfaces*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISClusNetworkNetInterfaces*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISClusNetworkNetInterfaces*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISClusNetworkNetInterfaces*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ISClusNetworkNetInterfaces*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ISClusNetworkNetInterfaces*, Void**, Win32cr::Foundation::HRESULT),
    refresh : Proc(ISClusNetworkNetInterfaces*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(ISClusNetworkNetInterfaces*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f2e606f6-2631-11d1-89f1-00a0c90d061e")]
  record ISClusNetworkNetInterfaces, lpVtbl : ISClusNetworkNetInterfacesVtbl* do
    GUID = LibC::GUID.new(0xf2e606f6_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])
    def query_interface(this : ISClusNetworkNetInterfaces*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISClusNetworkNetInterfaces*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISClusNetworkNetInterfaces*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISClusNetworkNetInterfaces*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISClusNetworkNetInterfaces*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISClusNetworkNetInterfaces*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISClusNetworkNetInterfaces*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ISClusNetworkNetInterfaces*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end
    def get__NewEnum(this : ISClusNetworkNetInterfaces*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end
    def refresh(this : ISClusNetworkNetInterfaces*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def get_Item(this : ISClusNetworkNetInterfaces*, varIndex : Win32cr::System::Com::VARIANT, ppClusNetInterface : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, varIndex, ppClusNetInterface)
    end

  end

  @[Extern]
  record ISClusResGroupVtbl,
    query_interface : Proc(ISClusResGroup*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISClusResGroup*, UInt32),
    release : Proc(ISClusResGroup*, UInt32),
    get_type_info_count : Proc(ISClusResGroup*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISClusResGroup*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISClusResGroup*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISClusResGroup*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_CommonProperties : Proc(ISClusResGroup*, Void**, Win32cr::Foundation::HRESULT),
    get_PrivateProperties : Proc(ISClusResGroup*, Void**, Win32cr::Foundation::HRESULT),
    get_CommonROProperties : Proc(ISClusResGroup*, Void**, Win32cr::Foundation::HRESULT),
    get_PrivateROProperties : Proc(ISClusResGroup*, Void**, Win32cr::Foundation::HRESULT),
    get_Handle : Proc(ISClusResGroup*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(ISClusResGroup*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(ISClusResGroup*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_State : Proc(ISClusResGroup*, Win32cr::Networking::Clustering::CLUSTER_GROUP_STATE*, Win32cr::Foundation::HRESULT),
    get_OwnerNode : Proc(ISClusResGroup*, Void**, Win32cr::Foundation::HRESULT),
    get_Resources : Proc(ISClusResGroup*, Void**, Win32cr::Foundation::HRESULT),
    get_PreferredOwnerNodes : Proc(ISClusResGroup*, Void**, Win32cr::Foundation::HRESULT),
    delete : Proc(ISClusResGroup*, Win32cr::Foundation::HRESULT),
    online : Proc(ISClusResGroup*, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    move : Proc(ISClusResGroup*, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    offline : Proc(ISClusResGroup*, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Cluster : Proc(ISClusResGroup*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f2e60706-2631-11d1-89f1-00a0c90d061e")]
  record ISClusResGroup, lpVtbl : ISClusResGroupVtbl* do
    GUID = LibC::GUID.new(0xf2e60706_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])
    def query_interface(this : ISClusResGroup*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISClusResGroup*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISClusResGroup*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISClusResGroup*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISClusResGroup*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISClusResGroup*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISClusResGroup*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_CommonProperties(this : ISClusResGroup*, ppProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CommonProperties.call(this, ppProperties)
    end
    def get_PrivateProperties(this : ISClusResGroup*, ppProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PrivateProperties.call(this, ppProperties)
    end
    def get_CommonROProperties(this : ISClusResGroup*, ppProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CommonROProperties.call(this, ppProperties)
    end
    def get_PrivateROProperties(this : ISClusResGroup*, ppProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PrivateROProperties.call(this, ppProperties)
    end
    def get_Handle(this : ISClusResGroup*, phandle : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Handle.call(this, phandle)
    end
    def get_Name(this : ISClusResGroup*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbstrName)
    end
    def put_Name(this : ISClusResGroup*, bstrGroupName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, bstrGroupName)
    end
    def get_State(this : ISClusResGroup*, dwState : Win32cr::Networking::Clustering::CLUSTER_GROUP_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_State.call(this, dwState)
    end
    def get_OwnerNode(this : ISClusResGroup*, ppOwnerNode : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OwnerNode.call(this, ppOwnerNode)
    end
    def get_Resources(this : ISClusResGroup*, ppClusterGroupResources : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Resources.call(this, ppClusterGroupResources)
    end
    def get_PreferredOwnerNodes(this : ISClusResGroup*, ppOwnerNodes : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PreferredOwnerNodes.call(this, ppOwnerNodes)
    end
    def delete(this : ISClusResGroup*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def online(this : ISClusResGroup*, varTimeout : Win32cr::System::Com::VARIANT, varNode : Win32cr::System::Com::VARIANT, pvarPending : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.online.call(this, varTimeout, varNode, pvarPending)
    end
    def move(this : ISClusResGroup*, varTimeout : Win32cr::System::Com::VARIANT, varNode : Win32cr::System::Com::VARIANT, pvarPending : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move.call(this, varTimeout, varNode, pvarPending)
    end
    def offline(this : ISClusResGroup*, varTimeout : Win32cr::System::Com::VARIANT, pvarPending : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.offline.call(this, varTimeout, pvarPending)
    end
    def get_Cluster(this : ISClusResGroup*, ppCluster : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Cluster.call(this, ppCluster)
    end

  end

  @[Extern]
  record ISClusResGroupsVtbl,
    query_interface : Proc(ISClusResGroups*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISClusResGroups*, UInt32),
    release : Proc(ISClusResGroups*, UInt32),
    get_type_info_count : Proc(ISClusResGroups*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISClusResGroups*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISClusResGroups*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISClusResGroups*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ISClusResGroups*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ISClusResGroups*, Void**, Win32cr::Foundation::HRESULT),
    refresh : Proc(ISClusResGroups*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(ISClusResGroups*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    create_item : Proc(ISClusResGroups*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    delete_item : Proc(ISClusResGroups*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f2e60708-2631-11d1-89f1-00a0c90d061e")]
  record ISClusResGroups, lpVtbl : ISClusResGroupsVtbl* do
    GUID = LibC::GUID.new(0xf2e60708_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])
    def query_interface(this : ISClusResGroups*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISClusResGroups*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISClusResGroups*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISClusResGroups*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISClusResGroups*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISClusResGroups*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISClusResGroups*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ISClusResGroups*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end
    def get__NewEnum(this : ISClusResGroups*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end
    def refresh(this : ISClusResGroups*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def get_Item(this : ISClusResGroups*, varIndex : Win32cr::System::Com::VARIANT, ppClusResGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, varIndex, ppClusResGroup)
    end
    def create_item(this : ISClusResGroups*, bstrResourceGroupName : Win32cr::Foundation::BSTR, ppResourceGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_item.call(this, bstrResourceGroupName, ppResourceGroup)
    end
    def delete_item(this : ISClusResGroups*, varIndex : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_item.call(this, varIndex)
    end

  end

  @[Extern]
  record ISClusResourceVtbl,
    query_interface : Proc(ISClusResource*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISClusResource*, UInt32),
    release : Proc(ISClusResource*, UInt32),
    get_type_info_count : Proc(ISClusResource*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISClusResource*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISClusResource*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISClusResource*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_CommonProperties : Proc(ISClusResource*, Void**, Win32cr::Foundation::HRESULT),
    get_PrivateProperties : Proc(ISClusResource*, Void**, Win32cr::Foundation::HRESULT),
    get_CommonROProperties : Proc(ISClusResource*, Void**, Win32cr::Foundation::HRESULT),
    get_PrivateROProperties : Proc(ISClusResource*, Void**, Win32cr::Foundation::HRESULT),
    get_Handle : Proc(ISClusResource*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(ISClusResource*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(ISClusResource*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_State : Proc(ISClusResource*, Win32cr::Networking::Clustering::CLUSTER_RESOURCE_STATE*, Win32cr::Foundation::HRESULT),
    get_CoreFlag : Proc(ISClusResource*, Win32cr::Networking::Clustering::CLUS_FLAGS*, Win32cr::Foundation::HRESULT),
    become_quorum_resource : Proc(ISClusResource*, Win32cr::Foundation::BSTR, Int32, Win32cr::Foundation::HRESULT),
    delete : Proc(ISClusResource*, Win32cr::Foundation::HRESULT),
    fail : Proc(ISClusResource*, Win32cr::Foundation::HRESULT),
    online : Proc(ISClusResource*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    offline : Proc(ISClusResource*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    change_resource_group : Proc(ISClusResource*, Void*, Win32cr::Foundation::HRESULT),
    add_resource_node : Proc(ISClusResource*, Void*, Win32cr::Foundation::HRESULT),
    remove_resource_node : Proc(ISClusResource*, Void*, Win32cr::Foundation::HRESULT),
    can_resource_be_dependent : Proc(ISClusResource*, Void*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_PossibleOwnerNodes : Proc(ISClusResource*, Void**, Win32cr::Foundation::HRESULT),
    get_Dependencies : Proc(ISClusResource*, Void**, Win32cr::Foundation::HRESULT),
    get_Dependents : Proc(ISClusResource*, Void**, Win32cr::Foundation::HRESULT),
    get_Group : Proc(ISClusResource*, Void**, Win32cr::Foundation::HRESULT),
    get_OwnerNode : Proc(ISClusResource*, Void**, Win32cr::Foundation::HRESULT),
    get_Cluster : Proc(ISClusResource*, Void**, Win32cr::Foundation::HRESULT),
    get_ClassInfo : Proc(ISClusResource*, Win32cr::Networking::Clustering::CLUSTER_RESOURCE_CLASS*, Win32cr::Foundation::HRESULT),
    get_Disk : Proc(ISClusResource*, Void**, Win32cr::Foundation::HRESULT),
    get_RegistryKeys : Proc(ISClusResource*, Void**, Win32cr::Foundation::HRESULT),
    get_CryptoKeys : Proc(ISClusResource*, Void**, Win32cr::Foundation::HRESULT),
    get_TypeName : Proc(ISClusResource*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Type : Proc(ISClusResource*, Void**, Win32cr::Foundation::HRESULT),
    get_MaintenanceMode : Proc(ISClusResource*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    put_MaintenanceMode : Proc(ISClusResource*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f2e6070a-2631-11d1-89f1-00a0c90d061e")]
  record ISClusResource, lpVtbl : ISClusResourceVtbl* do
    GUID = LibC::GUID.new(0xf2e6070a_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])
    def query_interface(this : ISClusResource*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISClusResource*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISClusResource*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISClusResource*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISClusResource*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISClusResource*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISClusResource*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_CommonProperties(this : ISClusResource*, ppProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CommonProperties.call(this, ppProperties)
    end
    def get_PrivateProperties(this : ISClusResource*, ppProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PrivateProperties.call(this, ppProperties)
    end
    def get_CommonROProperties(this : ISClusResource*, ppProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CommonROProperties.call(this, ppProperties)
    end
    def get_PrivateROProperties(this : ISClusResource*, ppProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PrivateROProperties.call(this, ppProperties)
    end
    def get_Handle(this : ISClusResource*, phandle : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Handle.call(this, phandle)
    end
    def get_Name(this : ISClusResource*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbstrName)
    end
    def put_Name(this : ISClusResource*, bstrResourceName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, bstrResourceName)
    end
    def get_State(this : ISClusResource*, dwState : Win32cr::Networking::Clustering::CLUSTER_RESOURCE_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_State.call(this, dwState)
    end
    def get_CoreFlag(this : ISClusResource*, dwCoreFlag : Win32cr::Networking::Clustering::CLUS_FLAGS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CoreFlag.call(this, dwCoreFlag)
    end
    def become_quorum_resource(this : ISClusResource*, bstrDevicePath : Win32cr::Foundation::BSTR, lMaxLogSize : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.become_quorum_resource.call(this, bstrDevicePath, lMaxLogSize)
    end
    def delete(this : ISClusResource*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def fail(this : ISClusResource*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.fail.call(this)
    end
    def online(this : ISClusResource*, nTimeout : Int32, pvarPending : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.online.call(this, nTimeout, pvarPending)
    end
    def offline(this : ISClusResource*, nTimeout : Int32, pvarPending : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.offline.call(this, nTimeout, pvarPending)
    end
    def change_resource_group(this : ISClusResource*, pResourceGroup : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.change_resource_group.call(this, pResourceGroup)
    end
    def add_resource_node(this : ISClusResource*, pNode : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_resource_node.call(this, pNode)
    end
    def remove_resource_node(this : ISClusResource*, pNode : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_resource_node.call(this, pNode)
    end
    def can_resource_be_dependent(this : ISClusResource*, pResource : Void*, pvarDependent : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.can_resource_be_dependent.call(this, pResource, pvarDependent)
    end
    def get_PossibleOwnerNodes(this : ISClusResource*, ppOwnerNodes : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PossibleOwnerNodes.call(this, ppOwnerNodes)
    end
    def get_Dependencies(this : ISClusResource*, ppResDependencies : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Dependencies.call(this, ppResDependencies)
    end
    def get_Dependents(this : ISClusResource*, ppResDependents : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Dependents.call(this, ppResDependents)
    end
    def get_Group(this : ISClusResource*, ppResGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Group.call(this, ppResGroup)
    end
    def get_OwnerNode(this : ISClusResource*, ppOwnerNode : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OwnerNode.call(this, ppOwnerNode)
    end
    def get_Cluster(this : ISClusResource*, ppCluster : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Cluster.call(this, ppCluster)
    end
    def get_ClassInfo(this : ISClusResource*, prcClassInfo : Win32cr::Networking::Clustering::CLUSTER_RESOURCE_CLASS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClassInfo.call(this, prcClassInfo)
    end
    def get_Disk(this : ISClusResource*, ppDisk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Disk.call(this, ppDisk)
    end
    def get_RegistryKeys(this : ISClusResource*, ppRegistryKeys : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RegistryKeys.call(this, ppRegistryKeys)
    end
    def get_CryptoKeys(this : ISClusResource*, ppCryptoKeys : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CryptoKeys.call(this, ppCryptoKeys)
    end
    def get_TypeName(this : ISClusResource*, pbstrTypeName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TypeName.call(this, pbstrTypeName)
    end
    def get_Type(this : ISClusResource*, ppResourceType : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, ppResourceType)
    end
    def get_MaintenanceMode(this : ISClusResource*, pbMaintenanceMode : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaintenanceMode.call(this, pbMaintenanceMode)
    end
    def put_MaintenanceMode(this : ISClusResource*, bMaintenanceMode : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MaintenanceMode.call(this, bMaintenanceMode)
    end

  end

  @[Extern]
  record ISClusResDependenciesVtbl,
    query_interface : Proc(ISClusResDependencies*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISClusResDependencies*, UInt32),
    release : Proc(ISClusResDependencies*, UInt32),
    get_type_info_count : Proc(ISClusResDependencies*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISClusResDependencies*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISClusResDependencies*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISClusResDependencies*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ISClusResDependencies*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ISClusResDependencies*, Void**, Win32cr::Foundation::HRESULT),
    refresh : Proc(ISClusResDependencies*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(ISClusResDependencies*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    create_item : Proc(ISClusResDependencies*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Networking::Clustering::CLUSTER_RESOURCE_CREATE_FLAGS, Void**, Win32cr::Foundation::HRESULT),
    delete_item : Proc(ISClusResDependencies*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_item : Proc(ISClusResDependencies*, Void*, Win32cr::Foundation::HRESULT),
    remove_item : Proc(ISClusResDependencies*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f2e60704-2631-11d1-89f1-00a0c90d061e")]
  record ISClusResDependencies, lpVtbl : ISClusResDependenciesVtbl* do
    GUID = LibC::GUID.new(0xf2e60704_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])
    def query_interface(this : ISClusResDependencies*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISClusResDependencies*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISClusResDependencies*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISClusResDependencies*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISClusResDependencies*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISClusResDependencies*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISClusResDependencies*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ISClusResDependencies*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end
    def get__NewEnum(this : ISClusResDependencies*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end
    def refresh(this : ISClusResDependencies*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def get_Item(this : ISClusResDependencies*, varIndex : Win32cr::System::Com::VARIANT, ppClusResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, varIndex, ppClusResource)
    end
    def create_item(this : ISClusResDependencies*, bstrResourceName : Win32cr::Foundation::BSTR, bstrResourceType : Win32cr::Foundation::BSTR, dwFlags : Win32cr::Networking::Clustering::CLUSTER_RESOURCE_CREATE_FLAGS, ppClusterResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_item.call(this, bstrResourceName, bstrResourceType, dwFlags, ppClusterResource)
    end
    def delete_item(this : ISClusResDependencies*, varIndex : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_item.call(this, varIndex)
    end
    def add_item(this : ISClusResDependencies*, pResource : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_item.call(this, pResource)
    end
    def remove_item(this : ISClusResDependencies*, varIndex : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_item.call(this, varIndex)
    end

  end

  @[Extern]
  record ISClusResGroupResourcesVtbl,
    query_interface : Proc(ISClusResGroupResources*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISClusResGroupResources*, UInt32),
    release : Proc(ISClusResGroupResources*, UInt32),
    get_type_info_count : Proc(ISClusResGroupResources*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISClusResGroupResources*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISClusResGroupResources*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISClusResGroupResources*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ISClusResGroupResources*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ISClusResGroupResources*, Void**, Win32cr::Foundation::HRESULT),
    refresh : Proc(ISClusResGroupResources*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(ISClusResGroupResources*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    create_item : Proc(ISClusResGroupResources*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Networking::Clustering::CLUSTER_RESOURCE_CREATE_FLAGS, Void**, Win32cr::Foundation::HRESULT),
    delete_item : Proc(ISClusResGroupResources*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f2e606ea-2631-11d1-89f1-00a0c90d061e")]
  record ISClusResGroupResources, lpVtbl : ISClusResGroupResourcesVtbl* do
    GUID = LibC::GUID.new(0xf2e606ea_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])
    def query_interface(this : ISClusResGroupResources*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISClusResGroupResources*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISClusResGroupResources*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISClusResGroupResources*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISClusResGroupResources*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISClusResGroupResources*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISClusResGroupResources*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ISClusResGroupResources*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end
    def get__NewEnum(this : ISClusResGroupResources*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end
    def refresh(this : ISClusResGroupResources*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def get_Item(this : ISClusResGroupResources*, varIndex : Win32cr::System::Com::VARIANT, ppClusResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, varIndex, ppClusResource)
    end
    def create_item(this : ISClusResGroupResources*, bstrResourceName : Win32cr::Foundation::BSTR, bstrResourceType : Win32cr::Foundation::BSTR, dwFlags : Win32cr::Networking::Clustering::CLUSTER_RESOURCE_CREATE_FLAGS, ppClusterResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_item.call(this, bstrResourceName, bstrResourceType, dwFlags, ppClusterResource)
    end
    def delete_item(this : ISClusResGroupResources*, varIndex : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_item.call(this, varIndex)
    end

  end

  @[Extern]
  record ISClusResTypeResourcesVtbl,
    query_interface : Proc(ISClusResTypeResources*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISClusResTypeResources*, UInt32),
    release : Proc(ISClusResTypeResources*, UInt32),
    get_type_info_count : Proc(ISClusResTypeResources*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISClusResTypeResources*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISClusResTypeResources*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISClusResTypeResources*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ISClusResTypeResources*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ISClusResTypeResources*, Void**, Win32cr::Foundation::HRESULT),
    refresh : Proc(ISClusResTypeResources*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(ISClusResTypeResources*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    create_item : Proc(ISClusResTypeResources*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Networking::Clustering::CLUSTER_RESOURCE_CREATE_FLAGS, Void**, Win32cr::Foundation::HRESULT),
    delete_item : Proc(ISClusResTypeResources*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f2e60714-2631-11d1-89f1-00a0c90d061e")]
  record ISClusResTypeResources, lpVtbl : ISClusResTypeResourcesVtbl* do
    GUID = LibC::GUID.new(0xf2e60714_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])
    def query_interface(this : ISClusResTypeResources*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISClusResTypeResources*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISClusResTypeResources*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISClusResTypeResources*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISClusResTypeResources*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISClusResTypeResources*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISClusResTypeResources*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ISClusResTypeResources*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end
    def get__NewEnum(this : ISClusResTypeResources*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end
    def refresh(this : ISClusResTypeResources*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def get_Item(this : ISClusResTypeResources*, varIndex : Win32cr::System::Com::VARIANT, ppClusResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, varIndex, ppClusResource)
    end
    def create_item(this : ISClusResTypeResources*, bstrResourceName : Win32cr::Foundation::BSTR, bstrGroupName : Win32cr::Foundation::BSTR, dwFlags : Win32cr::Networking::Clustering::CLUSTER_RESOURCE_CREATE_FLAGS, ppClusterResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_item.call(this, bstrResourceName, bstrGroupName, dwFlags, ppClusterResource)
    end
    def delete_item(this : ISClusResTypeResources*, varIndex : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_item.call(this, varIndex)
    end

  end

  @[Extern]
  record ISClusResourcesVtbl,
    query_interface : Proc(ISClusResources*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISClusResources*, UInt32),
    release : Proc(ISClusResources*, UInt32),
    get_type_info_count : Proc(ISClusResources*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISClusResources*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISClusResources*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISClusResources*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ISClusResources*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ISClusResources*, Void**, Win32cr::Foundation::HRESULT),
    refresh : Proc(ISClusResources*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(ISClusResources*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    create_item : Proc(ISClusResources*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Networking::Clustering::CLUSTER_RESOURCE_CREATE_FLAGS, Void**, Win32cr::Foundation::HRESULT),
    delete_item : Proc(ISClusResources*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f2e6070c-2631-11d1-89f1-00a0c90d061e")]
  record ISClusResources, lpVtbl : ISClusResourcesVtbl* do
    GUID = LibC::GUID.new(0xf2e6070c_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])
    def query_interface(this : ISClusResources*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISClusResources*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISClusResources*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISClusResources*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISClusResources*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISClusResources*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISClusResources*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ISClusResources*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end
    def get__NewEnum(this : ISClusResources*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end
    def refresh(this : ISClusResources*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def get_Item(this : ISClusResources*, varIndex : Win32cr::System::Com::VARIANT, ppClusResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, varIndex, ppClusResource)
    end
    def create_item(this : ISClusResources*, bstrResourceName : Win32cr::Foundation::BSTR, bstrResourceType : Win32cr::Foundation::BSTR, bstrGroupName : Win32cr::Foundation::BSTR, dwFlags : Win32cr::Networking::Clustering::CLUSTER_RESOURCE_CREATE_FLAGS, ppClusterResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_item.call(this, bstrResourceName, bstrResourceType, bstrGroupName, dwFlags, ppClusterResource)
    end
    def delete_item(this : ISClusResources*, varIndex : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_item.call(this, varIndex)
    end

  end

  @[Extern]
  record ISClusResGroupPreferredOwnerNodesVtbl,
    query_interface : Proc(ISClusResGroupPreferredOwnerNodes*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISClusResGroupPreferredOwnerNodes*, UInt32),
    release : Proc(ISClusResGroupPreferredOwnerNodes*, UInt32),
    get_type_info_count : Proc(ISClusResGroupPreferredOwnerNodes*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISClusResGroupPreferredOwnerNodes*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISClusResGroupPreferredOwnerNodes*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISClusResGroupPreferredOwnerNodes*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ISClusResGroupPreferredOwnerNodes*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ISClusResGroupPreferredOwnerNodes*, Void**, Win32cr::Foundation::HRESULT),
    refresh : Proc(ISClusResGroupPreferredOwnerNodes*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(ISClusResGroupPreferredOwnerNodes*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    insert_item : Proc(ISClusResGroupPreferredOwnerNodes*, Void*, Int32, Win32cr::Foundation::HRESULT),
    remove_item : Proc(ISClusResGroupPreferredOwnerNodes*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Modified : Proc(ISClusResGroupPreferredOwnerNodes*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    save_changes : Proc(ISClusResGroupPreferredOwnerNodes*, Win32cr::Foundation::HRESULT),
    add_item : Proc(ISClusResGroupPreferredOwnerNodes*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f2e606e8-2631-11d1-89f1-00a0c90d061e")]
  record ISClusResGroupPreferredOwnerNodes, lpVtbl : ISClusResGroupPreferredOwnerNodesVtbl* do
    GUID = LibC::GUID.new(0xf2e606e8_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])
    def query_interface(this : ISClusResGroupPreferredOwnerNodes*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISClusResGroupPreferredOwnerNodes*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISClusResGroupPreferredOwnerNodes*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISClusResGroupPreferredOwnerNodes*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISClusResGroupPreferredOwnerNodes*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISClusResGroupPreferredOwnerNodes*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISClusResGroupPreferredOwnerNodes*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ISClusResGroupPreferredOwnerNodes*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end
    def get__NewEnum(this : ISClusResGroupPreferredOwnerNodes*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end
    def refresh(this : ISClusResGroupPreferredOwnerNodes*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def get_Item(this : ISClusResGroupPreferredOwnerNodes*, varIndex : Win32cr::System::Com::VARIANT, ppNode : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, varIndex, ppNode)
    end
    def insert_item(this : ISClusResGroupPreferredOwnerNodes*, pNode : Void*, nPosition : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_item.call(this, pNode, nPosition)
    end
    def remove_item(this : ISClusResGroupPreferredOwnerNodes*, varIndex : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_item.call(this, varIndex)
    end
    def get_Modified(this : ISClusResGroupPreferredOwnerNodes*, pvarModified : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Modified.call(this, pvarModified)
    end
    def save_changes(this : ISClusResGroupPreferredOwnerNodes*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_changes.call(this)
    end
    def add_item(this : ISClusResGroupPreferredOwnerNodes*, pNode : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_item.call(this, pNode)
    end

  end

  @[Extern]
  record ISClusResPossibleOwnerNodesVtbl,
    query_interface : Proc(ISClusResPossibleOwnerNodes*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISClusResPossibleOwnerNodes*, UInt32),
    release : Proc(ISClusResPossibleOwnerNodes*, UInt32),
    get_type_info_count : Proc(ISClusResPossibleOwnerNodes*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISClusResPossibleOwnerNodes*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISClusResPossibleOwnerNodes*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISClusResPossibleOwnerNodes*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ISClusResPossibleOwnerNodes*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ISClusResPossibleOwnerNodes*, Void**, Win32cr::Foundation::HRESULT),
    refresh : Proc(ISClusResPossibleOwnerNodes*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(ISClusResPossibleOwnerNodes*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    add_item : Proc(ISClusResPossibleOwnerNodes*, Void*, Win32cr::Foundation::HRESULT),
    remove_item : Proc(ISClusResPossibleOwnerNodes*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Modified : Proc(ISClusResPossibleOwnerNodes*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f2e6070e-2631-11d1-89f1-00a0c90d061e")]
  record ISClusResPossibleOwnerNodes, lpVtbl : ISClusResPossibleOwnerNodesVtbl* do
    GUID = LibC::GUID.new(0xf2e6070e_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])
    def query_interface(this : ISClusResPossibleOwnerNodes*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISClusResPossibleOwnerNodes*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISClusResPossibleOwnerNodes*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISClusResPossibleOwnerNodes*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISClusResPossibleOwnerNodes*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISClusResPossibleOwnerNodes*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISClusResPossibleOwnerNodes*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ISClusResPossibleOwnerNodes*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end
    def get__NewEnum(this : ISClusResPossibleOwnerNodes*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end
    def refresh(this : ISClusResPossibleOwnerNodes*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def get_Item(this : ISClusResPossibleOwnerNodes*, varIndex : Win32cr::System::Com::VARIANT, ppNode : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, varIndex, ppNode)
    end
    def add_item(this : ISClusResPossibleOwnerNodes*, pNode : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_item.call(this, pNode)
    end
    def remove_item(this : ISClusResPossibleOwnerNodes*, varIndex : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_item.call(this, varIndex)
    end
    def get_Modified(this : ISClusResPossibleOwnerNodes*, pvarModified : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Modified.call(this, pvarModified)
    end

  end

  @[Extern]
  record ISClusResTypePossibleOwnerNodesVtbl,
    query_interface : Proc(ISClusResTypePossibleOwnerNodes*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISClusResTypePossibleOwnerNodes*, UInt32),
    release : Proc(ISClusResTypePossibleOwnerNodes*, UInt32),
    get_type_info_count : Proc(ISClusResTypePossibleOwnerNodes*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISClusResTypePossibleOwnerNodes*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISClusResTypePossibleOwnerNodes*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISClusResTypePossibleOwnerNodes*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ISClusResTypePossibleOwnerNodes*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ISClusResTypePossibleOwnerNodes*, Void**, Win32cr::Foundation::HRESULT),
    refresh : Proc(ISClusResTypePossibleOwnerNodes*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(ISClusResTypePossibleOwnerNodes*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f2e60718-2631-11d1-89f1-00a0c90d061e")]
  record ISClusResTypePossibleOwnerNodes, lpVtbl : ISClusResTypePossibleOwnerNodesVtbl* do
    GUID = LibC::GUID.new(0xf2e60718_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])
    def query_interface(this : ISClusResTypePossibleOwnerNodes*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISClusResTypePossibleOwnerNodes*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISClusResTypePossibleOwnerNodes*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISClusResTypePossibleOwnerNodes*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISClusResTypePossibleOwnerNodes*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISClusResTypePossibleOwnerNodes*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISClusResTypePossibleOwnerNodes*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ISClusResTypePossibleOwnerNodes*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end
    def get__NewEnum(this : ISClusResTypePossibleOwnerNodes*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end
    def refresh(this : ISClusResTypePossibleOwnerNodes*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def get_Item(this : ISClusResTypePossibleOwnerNodes*, varIndex : Win32cr::System::Com::VARIANT, ppNode : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, varIndex, ppNode)
    end

  end

  @[Extern]
  record ISClusResTypeVtbl,
    query_interface : Proc(ISClusResType*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISClusResType*, UInt32),
    release : Proc(ISClusResType*, UInt32),
    get_type_info_count : Proc(ISClusResType*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISClusResType*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISClusResType*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISClusResType*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_CommonProperties : Proc(ISClusResType*, Void**, Win32cr::Foundation::HRESULT),
    get_PrivateProperties : Proc(ISClusResType*, Void**, Win32cr::Foundation::HRESULT),
    get_CommonROProperties : Proc(ISClusResType*, Void**, Win32cr::Foundation::HRESULT),
    get_PrivateROProperties : Proc(ISClusResType*, Void**, Win32cr::Foundation::HRESULT),
    get_Name : Proc(ISClusResType*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    delete : Proc(ISClusResType*, Win32cr::Foundation::HRESULT),
    get_Cluster : Proc(ISClusResType*, Void**, Win32cr::Foundation::HRESULT),
    get_Resources : Proc(ISClusResType*, Void**, Win32cr::Foundation::HRESULT),
    get_PossibleOwnerNodes : Proc(ISClusResType*, Void**, Win32cr::Foundation::HRESULT),
    get_AvailableDisks : Proc(ISClusResType*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f2e60710-2631-11d1-89f1-00a0c90d061e")]
  record ISClusResType, lpVtbl : ISClusResTypeVtbl* do
    GUID = LibC::GUID.new(0xf2e60710_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])
    def query_interface(this : ISClusResType*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISClusResType*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISClusResType*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISClusResType*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISClusResType*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISClusResType*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISClusResType*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_CommonProperties(this : ISClusResType*, ppProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CommonProperties.call(this, ppProperties)
    end
    def get_PrivateProperties(this : ISClusResType*, ppProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PrivateProperties.call(this, ppProperties)
    end
    def get_CommonROProperties(this : ISClusResType*, ppProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CommonROProperties.call(this, ppProperties)
    end
    def get_PrivateROProperties(this : ISClusResType*, ppProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PrivateROProperties.call(this, ppProperties)
    end
    def get_Name(this : ISClusResType*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbstrName)
    end
    def delete(this : ISClusResType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def get_Cluster(this : ISClusResType*, ppCluster : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Cluster.call(this, ppCluster)
    end
    def get_Resources(this : ISClusResType*, ppClusterResTypeResources : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Resources.call(this, ppClusterResTypeResources)
    end
    def get_PossibleOwnerNodes(this : ISClusResType*, ppOwnerNodes : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PossibleOwnerNodes.call(this, ppOwnerNodes)
    end
    def get_AvailableDisks(this : ISClusResType*, ppAvailableDisks : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AvailableDisks.call(this, ppAvailableDisks)
    end

  end

  @[Extern]
  record ISClusResTypesVtbl,
    query_interface : Proc(ISClusResTypes*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISClusResTypes*, UInt32),
    release : Proc(ISClusResTypes*, UInt32),
    get_type_info_count : Proc(ISClusResTypes*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISClusResTypes*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISClusResTypes*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISClusResTypes*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ISClusResTypes*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ISClusResTypes*, Void**, Win32cr::Foundation::HRESULT),
    refresh : Proc(ISClusResTypes*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(ISClusResTypes*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    create_item : Proc(ISClusResTypes*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int32, Int32, Void**, Win32cr::Foundation::HRESULT),
    delete_item : Proc(ISClusResTypes*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f2e60712-2631-11d1-89f1-00a0c90d061e")]
  record ISClusResTypes, lpVtbl : ISClusResTypesVtbl* do
    GUID = LibC::GUID.new(0xf2e60712_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])
    def query_interface(this : ISClusResTypes*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISClusResTypes*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISClusResTypes*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISClusResTypes*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISClusResTypes*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISClusResTypes*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISClusResTypes*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ISClusResTypes*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end
    def get__NewEnum(this : ISClusResTypes*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end
    def refresh(this : ISClusResTypes*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def get_Item(this : ISClusResTypes*, varIndex : Win32cr::System::Com::VARIANT, ppClusResType : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, varIndex, ppClusResType)
    end
    def create_item(this : ISClusResTypes*, bstrResourceTypeName : Win32cr::Foundation::BSTR, bstrDisplayName : Win32cr::Foundation::BSTR, bstrResourceTypeDll : Win32cr::Foundation::BSTR, dwLooksAlivePollInterval : Int32, dwIsAlivePollInterval : Int32, ppResourceType : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_item.call(this, bstrResourceTypeName, bstrDisplayName, bstrResourceTypeDll, dwLooksAlivePollInterval, dwIsAlivePollInterval, ppResourceType)
    end
    def delete_item(this : ISClusResTypes*, varIndex : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_item.call(this, varIndex)
    end

  end

  @[Extern]
  record ISClusPropertyVtbl,
    query_interface : Proc(ISClusProperty*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISClusProperty*, UInt32),
    release : Proc(ISClusProperty*, UInt32),
    get_type_info_count : Proc(ISClusProperty*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISClusProperty*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISClusProperty*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISClusProperty*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(ISClusProperty*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Length : Proc(ISClusProperty*, Int32*, Win32cr::Foundation::HRESULT),
    get_ValueCount : Proc(ISClusProperty*, Int32*, Win32cr::Foundation::HRESULT),
    get_Values : Proc(ISClusProperty*, Void**, Win32cr::Foundation::HRESULT),
    get_Value : Proc(ISClusProperty*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_Value : Proc(ISClusProperty*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Type : Proc(ISClusProperty*, Win32cr::Networking::Clustering::CLUSTER_PROPERTY_TYPE*, Win32cr::Foundation::HRESULT),
    put_Type : Proc(ISClusProperty*, Win32cr::Networking::Clustering::CLUSTER_PROPERTY_TYPE, Win32cr::Foundation::HRESULT),
    get_Format : Proc(ISClusProperty*, Win32cr::Networking::Clustering::CLUSTER_PROPERTY_FORMAT*, Win32cr::Foundation::HRESULT),
    put_Format : Proc(ISClusProperty*, Win32cr::Networking::Clustering::CLUSTER_PROPERTY_FORMAT, Win32cr::Foundation::HRESULT),
    get_ReadOnly : Proc(ISClusProperty*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Private : Proc(ISClusProperty*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Common : Proc(ISClusProperty*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Modified : Proc(ISClusProperty*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    use_default_value : Proc(ISClusProperty*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f2e606fe-2631-11d1-89f1-00a0c90d061e")]
  record ISClusProperty, lpVtbl : ISClusPropertyVtbl* do
    GUID = LibC::GUID.new(0xf2e606fe_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])
    def query_interface(this : ISClusProperty*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISClusProperty*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISClusProperty*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISClusProperty*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISClusProperty*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISClusProperty*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISClusProperty*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : ISClusProperty*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbstrName)
    end
    def get_Length(this : ISClusProperty*, pLength : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Length.call(this, pLength)
    end
    def get_ValueCount(this : ISClusProperty*, pCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ValueCount.call(this, pCount)
    end
    def get_Values(this : ISClusProperty*, ppClusterPropertyValues : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Values.call(this, ppClusterPropertyValues)
    end
    def get_Value(this : ISClusProperty*, pvarValue : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Value.call(this, pvarValue)
    end
    def put_Value(this : ISClusProperty*, varValue : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Value.call(this, varValue)
    end
    def get_Type(this : ISClusProperty*, pType : Win32cr::Networking::Clustering::CLUSTER_PROPERTY_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, pType)
    end
    def put_Type(this : ISClusProperty*, type__ : Win32cr::Networking::Clustering::CLUSTER_PROPERTY_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Type.call(this, type__)
    end
    def get_Format(this : ISClusProperty*, pFormat : Win32cr::Networking::Clustering::CLUSTER_PROPERTY_FORMAT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Format.call(this, pFormat)
    end
    def put_Format(this : ISClusProperty*, format : Win32cr::Networking::Clustering::CLUSTER_PROPERTY_FORMAT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Format.call(this, format)
    end
    def get_ReadOnly(this : ISClusProperty*, pvarReadOnly : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReadOnly.call(this, pvarReadOnly)
    end
    def get_Private(this : ISClusProperty*, pvarPrivate : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Private.call(this, pvarPrivate)
    end
    def get_Common(this : ISClusProperty*, pvarCommon : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Common.call(this, pvarCommon)
    end
    def get_Modified(this : ISClusProperty*, pvarModified : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Modified.call(this, pvarModified)
    end
    def use_default_value(this : ISClusProperty*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.use_default_value.call(this)
    end

  end

  @[Extern]
  record ISClusPropertyValueVtbl,
    query_interface : Proc(ISClusPropertyValue*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISClusPropertyValue*, UInt32),
    release : Proc(ISClusPropertyValue*, UInt32),
    get_type_info_count : Proc(ISClusPropertyValue*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISClusPropertyValue*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISClusPropertyValue*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISClusPropertyValue*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Value : Proc(ISClusPropertyValue*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_Value : Proc(ISClusPropertyValue*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Type : Proc(ISClusPropertyValue*, Win32cr::Networking::Clustering::CLUSTER_PROPERTY_TYPE*, Win32cr::Foundation::HRESULT),
    put_Type : Proc(ISClusPropertyValue*, Win32cr::Networking::Clustering::CLUSTER_PROPERTY_TYPE, Win32cr::Foundation::HRESULT),
    get_Format : Proc(ISClusPropertyValue*, Win32cr::Networking::Clustering::CLUSTER_PROPERTY_FORMAT*, Win32cr::Foundation::HRESULT),
    put_Format : Proc(ISClusPropertyValue*, Win32cr::Networking::Clustering::CLUSTER_PROPERTY_FORMAT, Win32cr::Foundation::HRESULT),
    get_Length : Proc(ISClusPropertyValue*, Int32*, Win32cr::Foundation::HRESULT),
    get_DataCount : Proc(ISClusPropertyValue*, Int32*, Win32cr::Foundation::HRESULT),
    get_Data : Proc(ISClusPropertyValue*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f2e6071a-2631-11d1-89f1-00a0c90d061e")]
  record ISClusPropertyValue, lpVtbl : ISClusPropertyValueVtbl* do
    GUID = LibC::GUID.new(0xf2e6071a_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])
    def query_interface(this : ISClusPropertyValue*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISClusPropertyValue*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISClusPropertyValue*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISClusPropertyValue*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISClusPropertyValue*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISClusPropertyValue*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISClusPropertyValue*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Value(this : ISClusPropertyValue*, pvarValue : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Value.call(this, pvarValue)
    end
    def put_Value(this : ISClusPropertyValue*, varValue : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Value.call(this, varValue)
    end
    def get_Type(this : ISClusPropertyValue*, pType : Win32cr::Networking::Clustering::CLUSTER_PROPERTY_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, pType)
    end
    def put_Type(this : ISClusPropertyValue*, type__ : Win32cr::Networking::Clustering::CLUSTER_PROPERTY_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Type.call(this, type__)
    end
    def get_Format(this : ISClusPropertyValue*, pFormat : Win32cr::Networking::Clustering::CLUSTER_PROPERTY_FORMAT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Format.call(this, pFormat)
    end
    def put_Format(this : ISClusPropertyValue*, format : Win32cr::Networking::Clustering::CLUSTER_PROPERTY_FORMAT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Format.call(this, format)
    end
    def get_Length(this : ISClusPropertyValue*, pLength : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Length.call(this, pLength)
    end
    def get_DataCount(this : ISClusPropertyValue*, pCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DataCount.call(this, pCount)
    end
    def get_Data(this : ISClusPropertyValue*, ppClusterPropertyValueData : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Data.call(this, ppClusterPropertyValueData)
    end

  end

  @[Extern]
  record ISClusPropertyValuesVtbl,
    query_interface : Proc(ISClusPropertyValues*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISClusPropertyValues*, UInt32),
    release : Proc(ISClusPropertyValues*, UInt32),
    get_type_info_count : Proc(ISClusPropertyValues*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISClusPropertyValues*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISClusPropertyValues*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISClusPropertyValues*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ISClusPropertyValues*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ISClusPropertyValues*, Void**, Win32cr::Foundation::HRESULT),
    get_Item : Proc(ISClusPropertyValues*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    create_item : Proc(ISClusPropertyValues*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    remove_item : Proc(ISClusPropertyValues*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f2e6071c-2631-11d1-89f1-00a0c90d061e")]
  record ISClusPropertyValues, lpVtbl : ISClusPropertyValuesVtbl* do
    GUID = LibC::GUID.new(0xf2e6071c_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])
    def query_interface(this : ISClusPropertyValues*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISClusPropertyValues*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISClusPropertyValues*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISClusPropertyValues*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISClusPropertyValues*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISClusPropertyValues*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISClusPropertyValues*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ISClusPropertyValues*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end
    def get__NewEnum(this : ISClusPropertyValues*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end
    def get_Item(this : ISClusPropertyValues*, varIndex : Win32cr::System::Com::VARIANT, ppPropertyValue : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, varIndex, ppPropertyValue)
    end
    def create_item(this : ISClusPropertyValues*, bstrName : Win32cr::Foundation::BSTR, varValue : Win32cr::System::Com::VARIANT, ppPropertyValue : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_item.call(this, bstrName, varValue, ppPropertyValue)
    end
    def remove_item(this : ISClusPropertyValues*, varIndex : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_item.call(this, varIndex)
    end

  end

  @[Extern]
  record ISClusPropertiesVtbl,
    query_interface : Proc(ISClusProperties*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISClusProperties*, UInt32),
    release : Proc(ISClusProperties*, UInt32),
    get_type_info_count : Proc(ISClusProperties*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISClusProperties*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISClusProperties*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISClusProperties*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ISClusProperties*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ISClusProperties*, Void**, Win32cr::Foundation::HRESULT),
    refresh : Proc(ISClusProperties*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(ISClusProperties*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    create_item : Proc(ISClusProperties*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    use_default_value : Proc(ISClusProperties*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    save_changes : Proc(ISClusProperties*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_ReadOnly : Proc(ISClusProperties*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Private : Proc(ISClusProperties*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Common : Proc(ISClusProperties*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Modified : Proc(ISClusProperties*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f2e60700-2631-11d1-89f1-00a0c90d061e")]
  record ISClusProperties, lpVtbl : ISClusPropertiesVtbl* do
    GUID = LibC::GUID.new(0xf2e60700_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])
    def query_interface(this : ISClusProperties*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISClusProperties*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISClusProperties*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISClusProperties*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISClusProperties*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISClusProperties*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISClusProperties*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ISClusProperties*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end
    def get__NewEnum(this : ISClusProperties*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end
    def refresh(this : ISClusProperties*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def get_Item(this : ISClusProperties*, varIndex : Win32cr::System::Com::VARIANT, ppClusProperty : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, varIndex, ppClusProperty)
    end
    def create_item(this : ISClusProperties*, bstrName : Win32cr::Foundation::BSTR, varValue : Win32cr::System::Com::VARIANT, pProperty : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_item.call(this, bstrName, varValue, pProperty)
    end
    def use_default_value(this : ISClusProperties*, varIndex : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.use_default_value.call(this, varIndex)
    end
    def save_changes(this : ISClusProperties*, pvarStatusCode : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_changes.call(this, pvarStatusCode)
    end
    def get_ReadOnly(this : ISClusProperties*, pvarReadOnly : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReadOnly.call(this, pvarReadOnly)
    end
    def get_Private(this : ISClusProperties*, pvarPrivate : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Private.call(this, pvarPrivate)
    end
    def get_Common(this : ISClusProperties*, pvarCommon : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Common.call(this, pvarCommon)
    end
    def get_Modified(this : ISClusProperties*, pvarModified : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Modified.call(this, pvarModified)
    end

  end

  @[Extern]
  record ISClusPropertyValueDataVtbl,
    query_interface : Proc(ISClusPropertyValueData*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISClusPropertyValueData*, UInt32),
    release : Proc(ISClusPropertyValueData*, UInt32),
    get_type_info_count : Proc(ISClusPropertyValueData*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISClusPropertyValueData*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISClusPropertyValueData*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISClusPropertyValueData*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ISClusPropertyValueData*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ISClusPropertyValueData*, Void**, Win32cr::Foundation::HRESULT),
    get_Item : Proc(ISClusPropertyValueData*, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    create_item : Proc(ISClusPropertyValueData*, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    remove_item : Proc(ISClusPropertyValueData*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f2e6071e-2631-11d1-89f1-00a0c90d061e")]
  record ISClusPropertyValueData, lpVtbl : ISClusPropertyValueDataVtbl* do
    GUID = LibC::GUID.new(0xf2e6071e_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])
    def query_interface(this : ISClusPropertyValueData*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISClusPropertyValueData*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISClusPropertyValueData*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISClusPropertyValueData*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISClusPropertyValueData*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISClusPropertyValueData*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISClusPropertyValueData*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ISClusPropertyValueData*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end
    def get__NewEnum(this : ISClusPropertyValueData*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end
    def get_Item(this : ISClusPropertyValueData*, varIndex : Win32cr::System::Com::VARIANT, pvarValue : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, varIndex, pvarValue)
    end
    def create_item(this : ISClusPropertyValueData*, varValue : Win32cr::System::Com::VARIANT, pvarData : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_item.call(this, varValue, pvarData)
    end
    def remove_item(this : ISClusPropertyValueData*, varIndex : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_item.call(this, varIndex)
    end

  end

  @[Extern]
  record ISClusPartitionVtbl,
    query_interface : Proc(ISClusPartition*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISClusPartition*, UInt32),
    release : Proc(ISClusPartition*, UInt32),
    get_type_info_count : Proc(ISClusPartition*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISClusPartition*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISClusPartition*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISClusPartition*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Flags : Proc(ISClusPartition*, Int32*, Win32cr::Foundation::HRESULT),
    get_DeviceName : Proc(ISClusPartition*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_VolumeLabel : Proc(ISClusPartition*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_SerialNumber : Proc(ISClusPartition*, Int32*, Win32cr::Foundation::HRESULT),
    get_MaximumComponentLength : Proc(ISClusPartition*, Int32*, Win32cr::Foundation::HRESULT),
    get_FileSystemFlags : Proc(ISClusPartition*, Int32*, Win32cr::Foundation::HRESULT),
    get_FileSystem : Proc(ISClusPartition*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f2e60720-2631-11d1-89f1-00a0c90d061e")]
  record ISClusPartition, lpVtbl : ISClusPartitionVtbl* do
    GUID = LibC::GUID.new(0xf2e60720_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])
    def query_interface(this : ISClusPartition*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISClusPartition*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISClusPartition*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISClusPartition*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISClusPartition*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISClusPartition*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISClusPartition*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Flags(this : ISClusPartition*, plFlags : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Flags.call(this, plFlags)
    end
    def get_DeviceName(this : ISClusPartition*, pbstrDeviceName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeviceName.call(this, pbstrDeviceName)
    end
    def get_VolumeLabel(this : ISClusPartition*, pbstrVolumeLabel : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_VolumeLabel.call(this, pbstrVolumeLabel)
    end
    def get_SerialNumber(this : ISClusPartition*, plSerialNumber : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SerialNumber.call(this, plSerialNumber)
    end
    def get_MaximumComponentLength(this : ISClusPartition*, plMaximumComponentLength : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaximumComponentLength.call(this, plMaximumComponentLength)
    end
    def get_FileSystemFlags(this : ISClusPartition*, plFileSystemFlags : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FileSystemFlags.call(this, plFileSystemFlags)
    end
    def get_FileSystem(this : ISClusPartition*, pbstrFileSystem : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FileSystem.call(this, pbstrFileSystem)
    end

  end

  @[Extern]
  record ISClusPartitionExVtbl,
    query_interface : Proc(ISClusPartitionEx*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISClusPartitionEx*, UInt32),
    release : Proc(ISClusPartitionEx*, UInt32),
    get_type_info_count : Proc(ISClusPartitionEx*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISClusPartitionEx*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISClusPartitionEx*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISClusPartitionEx*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Flags : Proc(ISClusPartitionEx*, Int32*, Win32cr::Foundation::HRESULT),
    get_DeviceName : Proc(ISClusPartitionEx*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_VolumeLabel : Proc(ISClusPartitionEx*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_SerialNumber : Proc(ISClusPartitionEx*, Int32*, Win32cr::Foundation::HRESULT),
    get_MaximumComponentLength : Proc(ISClusPartitionEx*, Int32*, Win32cr::Foundation::HRESULT),
    get_FileSystemFlags : Proc(ISClusPartitionEx*, Int32*, Win32cr::Foundation::HRESULT),
    get_FileSystem : Proc(ISClusPartitionEx*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_TotalSize : Proc(ISClusPartitionEx*, Int32*, Win32cr::Foundation::HRESULT),
    get_FreeSpace : Proc(ISClusPartitionEx*, Int32*, Win32cr::Foundation::HRESULT),
    get_DeviceNumber : Proc(ISClusPartitionEx*, Int32*, Win32cr::Foundation::HRESULT),
    get_PartitionNumber : Proc(ISClusPartitionEx*, Int32*, Win32cr::Foundation::HRESULT),
    get_VolumeGuid : Proc(ISClusPartitionEx*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("8802d4fe-b32e-4ad1-9dbd-64f18e1166ce")]
  record ISClusPartitionEx, lpVtbl : ISClusPartitionExVtbl* do
    GUID = LibC::GUID.new(0x8802d4fe_u32, 0xb32e_u16, 0x4ad1_u16, StaticArray[0x9d_u8, 0xbd_u8, 0x64_u8, 0xf1_u8, 0x8e_u8, 0x11_u8, 0x66_u8, 0xce_u8])
    def query_interface(this : ISClusPartitionEx*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISClusPartitionEx*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISClusPartitionEx*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISClusPartitionEx*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISClusPartitionEx*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISClusPartitionEx*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISClusPartitionEx*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Flags(this : ISClusPartitionEx*, plFlags : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Flags.call(this, plFlags)
    end
    def get_DeviceName(this : ISClusPartitionEx*, pbstrDeviceName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeviceName.call(this, pbstrDeviceName)
    end
    def get_VolumeLabel(this : ISClusPartitionEx*, pbstrVolumeLabel : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_VolumeLabel.call(this, pbstrVolumeLabel)
    end
    def get_SerialNumber(this : ISClusPartitionEx*, plSerialNumber : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SerialNumber.call(this, plSerialNumber)
    end
    def get_MaximumComponentLength(this : ISClusPartitionEx*, plMaximumComponentLength : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaximumComponentLength.call(this, plMaximumComponentLength)
    end
    def get_FileSystemFlags(this : ISClusPartitionEx*, plFileSystemFlags : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FileSystemFlags.call(this, plFileSystemFlags)
    end
    def get_FileSystem(this : ISClusPartitionEx*, pbstrFileSystem : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FileSystem.call(this, pbstrFileSystem)
    end
    def get_TotalSize(this : ISClusPartitionEx*, plTotalSize : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TotalSize.call(this, plTotalSize)
    end
    def get_FreeSpace(this : ISClusPartitionEx*, plFreeSpace : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FreeSpace.call(this, plFreeSpace)
    end
    def get_DeviceNumber(this : ISClusPartitionEx*, plDeviceNumber : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeviceNumber.call(this, plDeviceNumber)
    end
    def get_PartitionNumber(this : ISClusPartitionEx*, plPartitionNumber : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PartitionNumber.call(this, plPartitionNumber)
    end
    def get_VolumeGuid(this : ISClusPartitionEx*, pbstrVolumeGuid : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_VolumeGuid.call(this, pbstrVolumeGuid)
    end

  end

  @[Extern]
  record ISClusPartitionsVtbl,
    query_interface : Proc(ISClusPartitions*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISClusPartitions*, UInt32),
    release : Proc(ISClusPartitions*, UInt32),
    get_type_info_count : Proc(ISClusPartitions*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISClusPartitions*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISClusPartitions*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISClusPartitions*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ISClusPartitions*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ISClusPartitions*, Void**, Win32cr::Foundation::HRESULT),
    get_Item : Proc(ISClusPartitions*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f2e60722-2631-11d1-89f1-00a0c90d061e")]
  record ISClusPartitions, lpVtbl : ISClusPartitionsVtbl* do
    GUID = LibC::GUID.new(0xf2e60722_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])
    def query_interface(this : ISClusPartitions*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISClusPartitions*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISClusPartitions*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISClusPartitions*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISClusPartitions*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISClusPartitions*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISClusPartitions*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ISClusPartitions*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end
    def get__NewEnum(this : ISClusPartitions*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end
    def get_Item(this : ISClusPartitions*, varIndex : Win32cr::System::Com::VARIANT, ppPartition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, varIndex, ppPartition)
    end

  end

  @[Extern]
  record ISClusDiskVtbl,
    query_interface : Proc(ISClusDisk*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISClusDisk*, UInt32),
    release : Proc(ISClusDisk*, UInt32),
    get_type_info_count : Proc(ISClusDisk*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISClusDisk*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISClusDisk*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISClusDisk*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Signature : Proc(ISClusDisk*, Int32*, Win32cr::Foundation::HRESULT),
    get_ScsiAddress : Proc(ISClusDisk*, Void**, Win32cr::Foundation::HRESULT),
    get_DiskNumber : Proc(ISClusDisk*, Int32*, Win32cr::Foundation::HRESULT),
    get_Partitions : Proc(ISClusDisk*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f2e60724-2631-11d1-89f1-00a0c90d061e")]
  record ISClusDisk, lpVtbl : ISClusDiskVtbl* do
    GUID = LibC::GUID.new(0xf2e60724_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])
    def query_interface(this : ISClusDisk*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISClusDisk*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISClusDisk*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISClusDisk*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISClusDisk*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISClusDisk*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISClusDisk*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Signature(this : ISClusDisk*, plSignature : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Signature.call(this, plSignature)
    end
    def get_ScsiAddress(this : ISClusDisk*, ppScsiAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ScsiAddress.call(this, ppScsiAddress)
    end
    def get_DiskNumber(this : ISClusDisk*, plDiskNumber : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DiskNumber.call(this, plDiskNumber)
    end
    def get_Partitions(this : ISClusDisk*, ppPartitions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Partitions.call(this, ppPartitions)
    end

  end

  @[Extern]
  record ISClusDisksVtbl,
    query_interface : Proc(ISClusDisks*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISClusDisks*, UInt32),
    release : Proc(ISClusDisks*, UInt32),
    get_type_info_count : Proc(ISClusDisks*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISClusDisks*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISClusDisks*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISClusDisks*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ISClusDisks*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ISClusDisks*, Void**, Win32cr::Foundation::HRESULT),
    get_Item : Proc(ISClusDisks*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f2e60726-2631-11d1-89f1-00a0c90d061e")]
  record ISClusDisks, lpVtbl : ISClusDisksVtbl* do
    GUID = LibC::GUID.new(0xf2e60726_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])
    def query_interface(this : ISClusDisks*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISClusDisks*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISClusDisks*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISClusDisks*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISClusDisks*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISClusDisks*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISClusDisks*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ISClusDisks*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end
    def get__NewEnum(this : ISClusDisks*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end
    def get_Item(this : ISClusDisks*, varIndex : Win32cr::System::Com::VARIANT, ppDisk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, varIndex, ppDisk)
    end

  end

  @[Extern]
  record ISClusScsiAddressVtbl,
    query_interface : Proc(ISClusScsiAddress*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISClusScsiAddress*, UInt32),
    release : Proc(ISClusScsiAddress*, UInt32),
    get_type_info_count : Proc(ISClusScsiAddress*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISClusScsiAddress*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISClusScsiAddress*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISClusScsiAddress*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_PortNumber : Proc(ISClusScsiAddress*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_PathId : Proc(ISClusScsiAddress*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_TargetId : Proc(ISClusScsiAddress*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Lun : Proc(ISClusScsiAddress*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f2e60728-2631-11d1-89f1-00a0c90d061e")]
  record ISClusScsiAddress, lpVtbl : ISClusScsiAddressVtbl* do
    GUID = LibC::GUID.new(0xf2e60728_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])
    def query_interface(this : ISClusScsiAddress*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISClusScsiAddress*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISClusScsiAddress*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISClusScsiAddress*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISClusScsiAddress*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISClusScsiAddress*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISClusScsiAddress*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_PortNumber(this : ISClusScsiAddress*, pvarPortNumber : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PortNumber.call(this, pvarPortNumber)
    end
    def get_PathId(this : ISClusScsiAddress*, pvarPathId : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PathId.call(this, pvarPathId)
    end
    def get_TargetId(this : ISClusScsiAddress*, pvarTargetId : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TargetId.call(this, pvarTargetId)
    end
    def get_Lun(this : ISClusScsiAddress*, pvarLun : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Lun.call(this, pvarLun)
    end

  end

  @[Extern]
  record ISClusRegistryKeysVtbl,
    query_interface : Proc(ISClusRegistryKeys*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISClusRegistryKeys*, UInt32),
    release : Proc(ISClusRegistryKeys*, UInt32),
    get_type_info_count : Proc(ISClusRegistryKeys*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISClusRegistryKeys*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISClusRegistryKeys*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISClusRegistryKeys*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ISClusRegistryKeys*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ISClusRegistryKeys*, Void**, Win32cr::Foundation::HRESULT),
    refresh : Proc(ISClusRegistryKeys*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(ISClusRegistryKeys*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    add_item : Proc(ISClusRegistryKeys*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    remove_item : Proc(ISClusRegistryKeys*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f2e6072a-2631-11d1-89f1-00a0c90d061e")]
  record ISClusRegistryKeys, lpVtbl : ISClusRegistryKeysVtbl* do
    GUID = LibC::GUID.new(0xf2e6072a_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])
    def query_interface(this : ISClusRegistryKeys*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISClusRegistryKeys*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISClusRegistryKeys*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISClusRegistryKeys*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISClusRegistryKeys*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISClusRegistryKeys*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISClusRegistryKeys*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ISClusRegistryKeys*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end
    def get__NewEnum(this : ISClusRegistryKeys*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end
    def refresh(this : ISClusRegistryKeys*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def get_Item(this : ISClusRegistryKeys*, varIndex : Win32cr::System::Com::VARIANT, pbstrRegistryKey : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, varIndex, pbstrRegistryKey)
    end
    def add_item(this : ISClusRegistryKeys*, bstrRegistryKey : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_item.call(this, bstrRegistryKey)
    end
    def remove_item(this : ISClusRegistryKeys*, varIndex : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_item.call(this, varIndex)
    end

  end

  @[Extern]
  record ISClusCryptoKeysVtbl,
    query_interface : Proc(ISClusCryptoKeys*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISClusCryptoKeys*, UInt32),
    release : Proc(ISClusCryptoKeys*, UInt32),
    get_type_info_count : Proc(ISClusCryptoKeys*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISClusCryptoKeys*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISClusCryptoKeys*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISClusCryptoKeys*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ISClusCryptoKeys*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ISClusCryptoKeys*, Void**, Win32cr::Foundation::HRESULT),
    refresh : Proc(ISClusCryptoKeys*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(ISClusCryptoKeys*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    add_item : Proc(ISClusCryptoKeys*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    remove_item : Proc(ISClusCryptoKeys*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f2e6072c-2631-11d1-89f1-00a0c90d061e")]
  record ISClusCryptoKeys, lpVtbl : ISClusCryptoKeysVtbl* do
    GUID = LibC::GUID.new(0xf2e6072c_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])
    def query_interface(this : ISClusCryptoKeys*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISClusCryptoKeys*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISClusCryptoKeys*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISClusCryptoKeys*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISClusCryptoKeys*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISClusCryptoKeys*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISClusCryptoKeys*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ISClusCryptoKeys*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end
    def get__NewEnum(this : ISClusCryptoKeys*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end
    def refresh(this : ISClusCryptoKeys*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def get_Item(this : ISClusCryptoKeys*, varIndex : Win32cr::System::Com::VARIANT, pbstrCyrptoKey : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, varIndex, pbstrCyrptoKey)
    end
    def add_item(this : ISClusCryptoKeys*, bstrCryptoKey : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_item.call(this, bstrCryptoKey)
    end
    def remove_item(this : ISClusCryptoKeys*, varIndex : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_item.call(this, varIndex)
    end

  end

  @[Extern]
  record ISClusResDependentsVtbl,
    query_interface : Proc(ISClusResDependents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISClusResDependents*, UInt32),
    release : Proc(ISClusResDependents*, UInt32),
    get_type_info_count : Proc(ISClusResDependents*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISClusResDependents*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISClusResDependents*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISClusResDependents*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ISClusResDependents*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ISClusResDependents*, Void**, Win32cr::Foundation::HRESULT),
    refresh : Proc(ISClusResDependents*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(ISClusResDependents*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    create_item : Proc(ISClusResDependents*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Networking::Clustering::CLUSTER_RESOURCE_CREATE_FLAGS, Void**, Win32cr::Foundation::HRESULT),
    delete_item : Proc(ISClusResDependents*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_item : Proc(ISClusResDependents*, Void*, Win32cr::Foundation::HRESULT),
    remove_item : Proc(ISClusResDependents*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f2e6072e-2631-11d1-89f1-00a0c90d061e")]
  record ISClusResDependents, lpVtbl : ISClusResDependentsVtbl* do
    GUID = LibC::GUID.new(0xf2e6072e_u32, 0x2631_u16, 0x11d1_u16, StaticArray[0x89_u8, 0xf1_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xd_u8, 0x6_u8, 0x1e_u8])
    def query_interface(this : ISClusResDependents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISClusResDependents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISClusResDependents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISClusResDependents*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISClusResDependents*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISClusResDependents*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISClusResDependents*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ISClusResDependents*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end
    def get__NewEnum(this : ISClusResDependents*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end
    def refresh(this : ISClusResDependents*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def get_Item(this : ISClusResDependents*, varIndex : Win32cr::System::Com::VARIANT, ppClusResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, varIndex, ppClusResource)
    end
    def create_item(this : ISClusResDependents*, bstrResourceName : Win32cr::Foundation::BSTR, bstrResourceType : Win32cr::Foundation::BSTR, dwFlags : Win32cr::Networking::Clustering::CLUSTER_RESOURCE_CREATE_FLAGS, ppClusterResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_item.call(this, bstrResourceName, bstrResourceType, dwFlags, ppClusterResource)
    end
    def delete_item(this : ISClusResDependents*, varIndex : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_item.call(this, varIndex)
    end
    def add_item(this : ISClusResDependents*, pResource : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_item.call(this, pResource)
    end
    def remove_item(this : ISClusResDependents*, varIndex : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_item.call(this, varIndex)
    end

  end

  @[Link("clusapi")]
  @[Link("resutils")]
  @[Link("ntlanman")]
  lib C
    fun GetNodeClusterState(lpszNodeName : Win32cr::Foundation::PWSTR, pdwClusterState : UInt32*) : UInt32

    fun OpenCluster(lpszClusterName : Win32cr::Foundation::PWSTR) : Win32cr::Networking::Clustering::HCLUSTER*

    fun OpenClusterEx(lpszClusterName : Win32cr::Foundation::PWSTR, desired_access : UInt32, granted_access : UInt32*) : Win32cr::Networking::Clustering::HCLUSTER*

    fun CloseCluster(hCluster : Win32cr::Networking::Clustering::HCLUSTER*) : Win32cr::Foundation::BOOL

    fun SetClusterName(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, lpszNewClusterName : Win32cr::Foundation::PWSTR) : UInt32

    fun GetClusterInformation(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, lpszClusterName : UInt16*, lpcchClusterName : UInt32*, lpClusterInfo : Win32cr::Networking::Clustering::CLUSTERVERSIONINFO*) : UInt32

    fun GetClusterQuorumResource(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, lpszResourceName : UInt16*, lpcchResourceName : UInt32*, lpszDeviceName : UInt16*, lpcchDeviceName : UInt32*, lpdwMaxQuorumLogSize : UInt32*) : UInt32

    fun SetClusterQuorumResource(hResource : Win32cr::Networking::Clustering::HRESOURCE*, lpszDeviceName : Win32cr::Foundation::PWSTR, dwMaxQuoLogSize : UInt32) : UInt32

    fun BackupClusterDatabase(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, lpszPathName : Win32cr::Foundation::PWSTR) : UInt32

    fun RestoreClusterDatabase(lpszPathName : Win32cr::Foundation::PWSTR, bForce : Win32cr::Foundation::BOOL, lpszQuorumDriveLetter : Win32cr::Foundation::PWSTR) : UInt32

    fun SetClusterNetworkPriorityOrder(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, network_count : UInt32, network_list : Win32cr::Networking::Clustering::HNETWORK**) : UInt32

    fun SetClusterServiceAccountPassword(lpszClusterName : Win32cr::Foundation::PWSTR, lpszNewPassword : Win32cr::Foundation::PWSTR, dwFlags : UInt32, lpReturnStatusBuffer : Win32cr::Networking::Clustering::CLUSTER_SET_PASSWORD_STATUS*, lpcbReturnStatusBufferSize : UInt32*) : UInt32

    fun ClusterControl(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, hHostNode : Win32cr::Networking::Clustering::HNODE*, dwControlCode : UInt32, lpInBuffer : Void*, nInBufferSize : UInt32, lpOutBuffer : Void*, nOutBufferSize : UInt32, lpBytesReturned : UInt32*) : UInt32

    fun ClusterUpgradeFunctionalLevel(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, perform : Win32cr::Foundation::BOOL, pfnProgressCallback : Win32cr::Networking::Clustering::PCLUSTER_UPGRADE_PROGRESS_CALLBACK, pvCallbackArg : Void*) : UInt32

    fun CreateClusterNotifyPortV2(hChange : Win32cr::Networking::Clustering::HCHANGE*, hCluster : Win32cr::Networking::Clustering::HCLUSTER*, filters : Win32cr::Networking::Clustering::NOTIFY_FILTER_AND_TYPE*, dwFilterCount : UInt32, dwNotifyKey : LibC::UIntPtrT) : Win32cr::Networking::Clustering::HCHANGE*

    fun RegisterClusterNotifyV2(hChange : Win32cr::Networking::Clustering::HCHANGE*, filter : Win32cr::Networking::Clustering::NOTIFY_FILTER_AND_TYPE, hObject : Win32cr::Foundation::HANDLE, dwNotifyKey : LibC::UIntPtrT) : UInt32

    fun GetNotifyEventHandle(hChange : Win32cr::Networking::Clustering::HCHANGE*, lphTargetEvent : Win32cr::Foundation::HANDLE*) : UInt32

    fun GetClusterNotifyV2(hChange : Win32cr::Networking::Clustering::HCHANGE*, lpdwNotifyKey : LibC::UIntPtrT*, pFilterAndType : Win32cr::Networking::Clustering::NOTIFY_FILTER_AND_TYPE*, buffer : UInt8*, lpbBufferSize : UInt32*, lpszObjectId : UInt16*, lpcchObjectId : UInt32*, lpszParentId : UInt16*, lpcchParentId : UInt32*, lpszName : UInt16*, lpcchName : UInt32*, lpszType : UInt16*, lpcchType : UInt32*, dwMilliseconds : UInt32) : UInt32

    fun CreateClusterNotifyPort(hChange : Win32cr::Networking::Clustering::HCHANGE*, hCluster : Win32cr::Networking::Clustering::HCLUSTER*, dwFilter : UInt32, dwNotifyKey : LibC::UIntPtrT) : Win32cr::Networking::Clustering::HCHANGE*

    fun RegisterClusterNotify(hChange : Win32cr::Networking::Clustering::HCHANGE*, dwFilterType : UInt32, hObject : Win32cr::Foundation::HANDLE, dwNotifyKey : LibC::UIntPtrT) : UInt32

    fun GetClusterNotify(hChange : Win32cr::Networking::Clustering::HCHANGE*, lpdwNotifyKey : LibC::UIntPtrT*, lpdwFilterType : UInt32*, lpszName : UInt16*, lpcchName : UInt32*, dwMilliseconds : UInt32) : UInt32

    fun CloseClusterNotifyPort(hChange : Win32cr::Networking::Clustering::HCHANGE*) : Win32cr::Foundation::BOOL

    fun ClusterOpenEnum(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, dwType : UInt32) : Win32cr::Networking::Clustering::HCLUSENUM*

    fun ClusterGetEnumCount(hEnum : Win32cr::Networking::Clustering::HCLUSENUM*) : UInt32

    fun ClusterEnum(hEnum : Win32cr::Networking::Clustering::HCLUSENUM*, dwIndex : UInt32, lpdwType : UInt32*, lpszName : UInt16*, lpcchName : UInt32*) : UInt32

    fun ClusterCloseEnum(hEnum : Win32cr::Networking::Clustering::HCLUSENUM*) : UInt32

    fun ClusterOpenEnumEx(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, dwType : UInt32, pOptions : Void*) : Win32cr::Networking::Clustering::HCLUSENUMEX*

    fun ClusterGetEnumCountEx(hClusterEnum : Win32cr::Networking::Clustering::HCLUSENUMEX*) : UInt32

    fun ClusterEnumEx(hClusterEnum : Win32cr::Networking::Clustering::HCLUSENUMEX*, dwIndex : UInt32, pItem : Win32cr::Networking::Clustering::CLUSTER_ENUM_ITEM*, cbItem : UInt32*) : UInt32

    fun ClusterCloseEnumEx(hClusterEnum : Win32cr::Networking::Clustering::HCLUSENUMEX*) : UInt32

    fun CreateClusterGroupSet(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, groupSetName : Win32cr::Foundation::PWSTR) : Win32cr::Networking::Clustering::HGROUPSET*

    fun OpenClusterGroupSet(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, lpszGroupSetName : Win32cr::Foundation::PWSTR) : Win32cr::Networking::Clustering::HGROUPSET*

    fun CloseClusterGroupSet(hGroupSet : Win32cr::Networking::Clustering::HGROUPSET*) : Win32cr::Foundation::BOOL

    fun DeleteClusterGroupSet(hGroupSet : Win32cr::Networking::Clustering::HGROUPSET*) : UInt32

    fun ClusterAddGroupToGroupSet(hGroupSet : Win32cr::Networking::Clustering::HGROUPSET*, hGroup : Win32cr::Networking::Clustering::HGROUP*) : UInt32

    fun ClusterAddGroupToGroupSetWithDomains(hGroupSet : Win32cr::Networking::Clustering::HGROUPSET*, hGroup : Win32cr::Networking::Clustering::HGROUP*, faultDomain : UInt32, updateDomain : UInt32) : UInt32

    fun ClusterRemoveGroupFromGroupSet(hGroup : Win32cr::Networking::Clustering::HGROUP*) : UInt32

    fun ClusterGroupSetControl(hGroupSet : Win32cr::Networking::Clustering::HGROUPSET*, hHostNode : Win32cr::Networking::Clustering::HNODE*, dwControlCode : UInt32, lpInBuffer : Void*, cbInBufferSize : UInt32, lpOutBuffer : Void*, cbOutBufferSize : UInt32, lpBytesReturned : UInt32*) : UInt32

    fun AddClusterGroupDependency(hDependentGroup : Win32cr::Networking::Clustering::HGROUP*, hProviderGroup : Win32cr::Networking::Clustering::HGROUP*) : UInt32

    fun SetGroupDependencyExpression(hGroup : Win32cr::Networking::Clustering::HGROUP*, lpszDependencyExpression : Win32cr::Foundation::PWSTR) : UInt32

    fun RemoveClusterGroupDependency(hGroup : Win32cr::Networking::Clustering::HGROUP*, hDependsOn : Win32cr::Networking::Clustering::HGROUP*) : UInt32

    fun AddClusterGroupSetDependency(hDependentGroupSet : Win32cr::Networking::Clustering::HGROUPSET*, hProviderGroupSet : Win32cr::Networking::Clustering::HGROUPSET*) : UInt32

    fun SetClusterGroupSetDependencyExpression(hGroupSet : Win32cr::Networking::Clustering::HGROUPSET*, lpszDependencyExprssion : Win32cr::Foundation::PWSTR) : UInt32

    fun RemoveClusterGroupSetDependency(hGroupSet : Win32cr::Networking::Clustering::HGROUPSET*, hDependsOn : Win32cr::Networking::Clustering::HGROUPSET*) : UInt32

    fun AddClusterGroupToGroupSetDependency(hDependentGroup : Win32cr::Networking::Clustering::HGROUP*, hProviderGroupSet : Win32cr::Networking::Clustering::HGROUPSET*) : UInt32

    fun RemoveClusterGroupToGroupSetDependency(hGroup : Win32cr::Networking::Clustering::HGROUP*, hDependsOn : Win32cr::Networking::Clustering::HGROUPSET*) : UInt32

    fun ClusterGroupSetOpenEnum(hCluster : Win32cr::Networking::Clustering::HCLUSTER*) : Win32cr::Networking::Clustering::HGROUPSETENUM*

    fun ClusterGroupSetGetEnumCount(hGroupSetEnum : Win32cr::Networking::Clustering::HGROUPSETENUM*) : UInt32

    fun ClusterGroupSetEnum(hGroupSetEnum : Win32cr::Networking::Clustering::HGROUPSETENUM*, dwIndex : UInt32, lpszName : UInt16*, lpcchName : UInt32*) : UInt32

    fun ClusterGroupSetCloseEnum(hGroupSetEnum : Win32cr::Networking::Clustering::HGROUPSETENUM*) : UInt32

    fun AddCrossClusterGroupSetDependency(hDependentGroupSet : Win32cr::Networking::Clustering::HGROUPSET*, lpRemoteClusterName : Win32cr::Foundation::PWSTR, lpRemoteGroupSetName : Win32cr::Foundation::PWSTR) : UInt32

    fun RemoveCrossClusterGroupSetDependency(hDependentGroupSet : Win32cr::Networking::Clustering::HGROUPSET*, lpRemoteClusterName : Win32cr::Foundation::PWSTR, lpRemoteGroupSetName : Win32cr::Foundation::PWSTR) : UInt32

    fun CreateClusterAvailabilitySet(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, lpAvailabilitySetName : Win32cr::Foundation::PWSTR, pAvailabilitySetConfig : Win32cr::Networking::Clustering::CLUSTER_AVAILABILITY_SET_CONFIG*) : Win32cr::Networking::Clustering::HGROUPSET*

    fun ClusterNodeReplacement(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, lpszNodeNameCurrent : Win32cr::Foundation::PWSTR, lpszNodeNameNew : Win32cr::Foundation::PWSTR) : UInt32

    fun ClusterCreateAffinityRule(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, ruleName : Win32cr::Foundation::PWSTR, ruleType : Win32cr::Networking::Clustering::CLUS_AFFINITY_RULE_TYPE) : UInt32

    fun ClusterRemoveAffinityRule(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, ruleName : Win32cr::Foundation::PWSTR) : UInt32

    fun ClusterAddGroupToAffinityRule(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, ruleName : Win32cr::Foundation::PWSTR, hGroup : Win32cr::Networking::Clustering::HGROUP*) : UInt32

    fun ClusterRemoveGroupFromAffinityRule(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, ruleName : Win32cr::Foundation::PWSTR, hGroup : Win32cr::Networking::Clustering::HGROUP*) : UInt32

    fun ClusterAffinityRuleControl(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, affinityRuleName : Win32cr::Foundation::PWSTR, hHostNode : Win32cr::Networking::Clustering::HNODE*, dwControlCode : UInt32, lpInBuffer : Void*, cbInBufferSize : UInt32, lpOutBuffer : Void*, cbOutBufferSize : UInt32, lpBytesReturned : UInt32*) : UInt32

    fun OpenClusterNode(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, lpszNodeName : Win32cr::Foundation::PWSTR) : Win32cr::Networking::Clustering::HNODE*

    fun OpenClusterNodeEx(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, lpszNodeName : Win32cr::Foundation::PWSTR, dwDesiredAccess : UInt32, lpdwGrantedAccess : UInt32*) : Win32cr::Networking::Clustering::HNODE*

    fun OpenClusterNodeById(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, nodeId : UInt32) : Win32cr::Networking::Clustering::HNODE*

    fun CloseClusterNode(hNode : Win32cr::Networking::Clustering::HNODE*) : Win32cr::Foundation::BOOL

    fun GetClusterNodeState(hNode : Win32cr::Networking::Clustering::HNODE*) : Win32cr::Networking::Clustering::CLUSTER_NODE_STATE

    fun GetClusterNodeId(hNode : Win32cr::Networking::Clustering::HNODE*, lpszNodeId : UInt16*, lpcchName : UInt32*) : UInt32

    fun GetClusterFromNode(hNode : Win32cr::Networking::Clustering::HNODE*) : Win32cr::Networking::Clustering::HCLUSTER*

    fun PauseClusterNode(hNode : Win32cr::Networking::Clustering::HNODE*) : UInt32

    fun ResumeClusterNode(hNode : Win32cr::Networking::Clustering::HNODE*) : UInt32

    fun EvictClusterNode(hNode : Win32cr::Networking::Clustering::HNODE*) : UInt32

    fun ClusterNetInterfaceOpenEnum(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, lpszNodeName : Win32cr::Foundation::PWSTR, lpszNetworkName : Win32cr::Foundation::PWSTR) : Win32cr::Networking::Clustering::HNETINTERFACEENUM*

    fun ClusterNetInterfaceEnum(hNetInterfaceEnum : Win32cr::Networking::Clustering::HNETINTERFACEENUM*, dwIndex : UInt32, lpszName : UInt16*, lpcchName : UInt32*) : UInt32

    fun ClusterNetInterfaceCloseEnum(hNetInterfaceEnum : Win32cr::Networking::Clustering::HNETINTERFACEENUM*) : UInt32

    fun ClusterNodeOpenEnum(hNode : Win32cr::Networking::Clustering::HNODE*, dwType : UInt32) : Win32cr::Networking::Clustering::HNODEENUM*

    fun ClusterNodeOpenEnumEx(hNode : Win32cr::Networking::Clustering::HNODE*, dwType : UInt32, pOptions : Void*) : Win32cr::Networking::Clustering::HNODEENUMEX*

    fun ClusterNodeGetEnumCountEx(hNodeEnum : Win32cr::Networking::Clustering::HNODEENUMEX*) : UInt32

    fun ClusterNodeEnumEx(hNodeEnum : Win32cr::Networking::Clustering::HNODEENUMEX*, dwIndex : UInt32, pItem : Win32cr::Networking::Clustering::CLUSTER_ENUM_ITEM*, cbItem : UInt32*) : UInt32

    fun ClusterNodeCloseEnumEx(hNodeEnum : Win32cr::Networking::Clustering::HNODEENUMEX*) : UInt32

    fun ClusterNodeGetEnumCount(hNodeEnum : Win32cr::Networking::Clustering::HNODEENUM*) : UInt32

    fun ClusterNodeCloseEnum(hNodeEnum : Win32cr::Networking::Clustering::HNODEENUM*) : UInt32

    fun ClusterNodeEnum(hNodeEnum : Win32cr::Networking::Clustering::HNODEENUM*, dwIndex : UInt32, lpdwType : UInt32*, lpszName : UInt16*, lpcchName : UInt32*) : UInt32

    fun EvictClusterNodeEx(hNode : Win32cr::Networking::Clustering::HNODE*, dwTimeOut : UInt32, phrCleanupStatus : Win32cr::Foundation::HRESULT*) : UInt32

    fun GetClusterResourceTypeKey(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, lpszTypeName : Win32cr::Foundation::PWSTR, samDesired : UInt32) : Win32cr::System::Registry::HKEY

    fun CreateClusterGroup(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, lpszGroupName : Win32cr::Foundation::PWSTR) : Win32cr::Networking::Clustering::HGROUP*

    fun OpenClusterGroup(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, lpszGroupName : Win32cr::Foundation::PWSTR) : Win32cr::Networking::Clustering::HGROUP*

    fun OpenClusterGroupEx(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, lpszGroupName : Win32cr::Foundation::PWSTR, dwDesiredAccess : UInt32, lpdwGrantedAccess : UInt32*) : Win32cr::Networking::Clustering::HGROUP*

    fun PauseClusterNodeEx(hNode : Win32cr::Networking::Clustering::HNODE*, bDrainNode : Win32cr::Foundation::BOOL, dwPauseFlags : UInt32, hNodeDrainTarget : Win32cr::Networking::Clustering::HNODE*) : UInt32

    fun ResumeClusterNodeEx(hNode : Win32cr::Networking::Clustering::HNODE*, eResumeFailbackType : Win32cr::Networking::Clustering::CLUSTER_NODE_RESUME_FAILBACK_TYPE, dwResumeFlagsReserved : UInt32) : UInt32

    fun CreateClusterGroupEx(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, lpszGroupName : Win32cr::Foundation::PWSTR, pGroupInfo : Win32cr::Networking::Clustering::CLUSTER_CREATE_GROUP_INFO*) : Win32cr::Networking::Clustering::HGROUP*

    fun ClusterGroupOpenEnumEx(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, lpszProperties : Win32cr::Foundation::PWSTR, cbProperties : UInt32, lpszRoProperties : Win32cr::Foundation::PWSTR, cbRoProperties : UInt32, dwFlags : UInt32) : Win32cr::Networking::Clustering::HGROUPENUMEX*

    fun ClusterGroupGetEnumCountEx(hGroupEnumEx : Win32cr::Networking::Clustering::HGROUPENUMEX*) : UInt32

    fun ClusterGroupEnumEx(hGroupEnumEx : Win32cr::Networking::Clustering::HGROUPENUMEX*, dwIndex : UInt32, pItem : Win32cr::Networking::Clustering::CLUSTER_GROUP_ENUM_ITEM*, cbItem : UInt32*) : UInt32

    fun ClusterGroupCloseEnumEx(hGroupEnumEx : Win32cr::Networking::Clustering::HGROUPENUMEX*) : UInt32

    fun ClusterResourceOpenEnumEx(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, lpszProperties : Win32cr::Foundation::PWSTR, cbProperties : UInt32, lpszRoProperties : Win32cr::Foundation::PWSTR, cbRoProperties : UInt32, dwFlags : UInt32) : Win32cr::Networking::Clustering::HRESENUMEX*

    fun ClusterResourceGetEnumCountEx(hResourceEnumEx : Win32cr::Networking::Clustering::HRESENUMEX*) : UInt32

    fun ClusterResourceEnumEx(hResourceEnumEx : Win32cr::Networking::Clustering::HRESENUMEX*, dwIndex : UInt32, pItem : Win32cr::Networking::Clustering::CLUSTER_RESOURCE_ENUM_ITEM*, cbItem : UInt32*) : UInt32

    fun ClusterResourceCloseEnumEx(hResourceEnumEx : Win32cr::Networking::Clustering::HRESENUMEX*) : UInt32

    fun OnlineClusterGroupEx(hGroup : Win32cr::Networking::Clustering::HGROUP*, hDestinationNode : Win32cr::Networking::Clustering::HNODE*, dwOnlineFlags : UInt32, lpInBuffer : UInt8*, cbInBufferSize : UInt32) : UInt32

    fun OfflineClusterGroupEx(hGroup : Win32cr::Networking::Clustering::HGROUP*, dwOfflineFlags : UInt32, lpInBuffer : UInt8*, cbInBufferSize : UInt32) : UInt32

    fun OnlineClusterResourceEx(hResource : Win32cr::Networking::Clustering::HRESOURCE*, dwOnlineFlags : UInt32, lpInBuffer : UInt8*, cbInBufferSize : UInt32) : UInt32

    fun OfflineClusterResourceEx(hResource : Win32cr::Networking::Clustering::HRESOURCE*, dwOfflineFlags : UInt32, lpInBuffer : UInt8*, cbInBufferSize : UInt32) : UInt32

    fun MoveClusterGroupEx(hGroup : Win32cr::Networking::Clustering::HGROUP*, hDestinationNode : Win32cr::Networking::Clustering::HNODE*, dwMoveFlags : UInt32, lpInBuffer : UInt8*, cbInBufferSize : UInt32) : UInt32

    fun CancelClusterGroupOperation(hGroup : Win32cr::Networking::Clustering::HGROUP*, dwCancelFlags_RESERVED : UInt32) : UInt32

    fun RestartClusterResource(hResource : Win32cr::Networking::Clustering::HRESOURCE*, dwFlags : UInt32) : UInt32

    fun CloseClusterGroup(hGroup : Win32cr::Networking::Clustering::HGROUP*) : Win32cr::Foundation::BOOL

    fun GetClusterFromGroup(hGroup : Win32cr::Networking::Clustering::HGROUP*) : Win32cr::Networking::Clustering::HCLUSTER*

    fun GetClusterGroupState(hGroup : Win32cr::Networking::Clustering::HGROUP*, lpszNodeName : UInt16*, lpcchNodeName : UInt32*) : Win32cr::Networking::Clustering::CLUSTER_GROUP_STATE

    fun SetClusterGroupName(hGroup : Win32cr::Networking::Clustering::HGROUP*, lpszGroupName : Win32cr::Foundation::PWSTR) : UInt32

    fun SetClusterGroupNodeList(hGroup : Win32cr::Networking::Clustering::HGROUP*, node_count : UInt32, node_list : Win32cr::Networking::Clustering::HNODE**) : UInt32

    fun OnlineClusterGroup(hGroup : Win32cr::Networking::Clustering::HGROUP*, hDestinationNode : Win32cr::Networking::Clustering::HNODE*) : UInt32

    fun MoveClusterGroup(hGroup : Win32cr::Networking::Clustering::HGROUP*, hDestinationNode : Win32cr::Networking::Clustering::HNODE*) : UInt32

    fun OfflineClusterGroup(hGroup : Win32cr::Networking::Clustering::HGROUP*) : UInt32

    fun DeleteClusterGroup(hGroup : Win32cr::Networking::Clustering::HGROUP*) : UInt32

    fun DestroyClusterGroup(hGroup : Win32cr::Networking::Clustering::HGROUP*) : UInt32

    fun ClusterGroupOpenEnum(hGroup : Win32cr::Networking::Clustering::HGROUP*, dwType : UInt32) : Win32cr::Networking::Clustering::HGROUPENUM*

    fun ClusterGroupGetEnumCount(hGroupEnum : Win32cr::Networking::Clustering::HGROUPENUM*) : UInt32

    fun ClusterGroupEnum(hGroupEnum : Win32cr::Networking::Clustering::HGROUPENUM*, dwIndex : UInt32, lpdwType : UInt32*, lpszResourceName : UInt16*, lpcchName : UInt32*) : UInt32

    fun ClusterGroupCloseEnum(hGroupEnum : Win32cr::Networking::Clustering::HGROUPENUM*) : UInt32

    fun CreateClusterResource(hGroup : Win32cr::Networking::Clustering::HGROUP*, lpszResourceName : Win32cr::Foundation::PWSTR, lpszResourceType : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : Win32cr::Networking::Clustering::HRESOURCE*

    fun OpenClusterResource(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, lpszResourceName : Win32cr::Foundation::PWSTR) : Win32cr::Networking::Clustering::HRESOURCE*

    fun OpenClusterResourceEx(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, lpszResourceName : Win32cr::Foundation::PWSTR, dwDesiredAccess : UInt32, lpdwGrantedAccess : UInt32*) : Win32cr::Networking::Clustering::HRESOURCE*

    fun CloseClusterResource(hResource : Win32cr::Networking::Clustering::HRESOURCE*) : Win32cr::Foundation::BOOL

    fun GetClusterFromResource(hResource : Win32cr::Networking::Clustering::HRESOURCE*) : Win32cr::Networking::Clustering::HCLUSTER*

    fun DeleteClusterResource(hResource : Win32cr::Networking::Clustering::HRESOURCE*) : UInt32

    fun GetClusterResourceState(hResource : Win32cr::Networking::Clustering::HRESOURCE*, lpszNodeName : UInt16*, lpcchNodeName : UInt32*, lpszGroupName : UInt16*, lpcchGroupName : UInt32*) : Win32cr::Networking::Clustering::CLUSTER_RESOURCE_STATE

    fun SetClusterResourceName(hResource : Win32cr::Networking::Clustering::HRESOURCE*, lpszResourceName : Win32cr::Foundation::PWSTR) : UInt32

    fun FailClusterResource(hResource : Win32cr::Networking::Clustering::HRESOURCE*) : UInt32

    fun OnlineClusterResource(hResource : Win32cr::Networking::Clustering::HRESOURCE*) : UInt32

    fun OfflineClusterResource(hResource : Win32cr::Networking::Clustering::HRESOURCE*) : UInt32

    fun ChangeClusterResourceGroup(hResource : Win32cr::Networking::Clustering::HRESOURCE*, hGroup : Win32cr::Networking::Clustering::HGROUP*) : UInt32

    fun ChangeClusterResourceGroupEx(hResource : Win32cr::Networking::Clustering::HRESOURCE*, hGroup : Win32cr::Networking::Clustering::HGROUP*, flags : UInt64) : UInt32

    fun AddClusterResourceNode(hResource : Win32cr::Networking::Clustering::HRESOURCE*, hNode : Win32cr::Networking::Clustering::HNODE*) : UInt32

    fun RemoveClusterResourceNode(hResource : Win32cr::Networking::Clustering::HRESOURCE*, hNode : Win32cr::Networking::Clustering::HNODE*) : UInt32

    fun AddClusterResourceDependency(hResource : Win32cr::Networking::Clustering::HRESOURCE*, hDependsOn : Win32cr::Networking::Clustering::HRESOURCE*) : UInt32

    fun RemoveClusterResourceDependency(hResource : Win32cr::Networking::Clustering::HRESOURCE*, hDependsOn : Win32cr::Networking::Clustering::HRESOURCE*) : UInt32

    fun SetClusterResourceDependencyExpression(hResource : Win32cr::Networking::Clustering::HRESOURCE*, lpszDependencyExpression : Win32cr::Foundation::PWSTR) : UInt32

    fun GetClusterResourceDependencyExpression(hResource : Win32cr::Networking::Clustering::HRESOURCE*, lpszDependencyExpression : UInt16*, lpcchDependencyExpression : UInt32*) : UInt32

    fun AddResourceToClusterSharedVolumes(hResource : Win32cr::Networking::Clustering::HRESOURCE*) : UInt32

    fun RemoveResourceFromClusterSharedVolumes(hResource : Win32cr::Networking::Clustering::HRESOURCE*) : UInt32

    fun IsFileOnClusterSharedVolume(lpszPathName : Win32cr::Foundation::PWSTR, pbFileIsOnSharedVolume : Win32cr::Foundation::BOOL*) : UInt32

    fun ClusterSharedVolumeSetSnapshotState(guidSnapshotSet : LibC::GUID, lpszVolumeName : Win32cr::Foundation::PWSTR, state : Win32cr::Networking::Clustering::CLUSTER_SHARED_VOLUME_SNAPSHOT_STATE) : UInt32

    fun CanResourceBeDependent(hResource : Win32cr::Networking::Clustering::HRESOURCE*, hResourceDependent : Win32cr::Networking::Clustering::HRESOURCE*) : Win32cr::Foundation::BOOL

    fun ClusterResourceControl(hResource : Win32cr::Networking::Clustering::HRESOURCE*, hHostNode : Win32cr::Networking::Clustering::HNODE*, dwControlCode : UInt32, lpInBuffer : Void*, cbInBufferSize : UInt32, lpOutBuffer : Void*, cbOutBufferSize : UInt32, lpBytesReturned : UInt32*) : UInt32

    fun ClusterResourceControlAsUser(hResource : Win32cr::Networking::Clustering::HRESOURCE*, hHostNode : Win32cr::Networking::Clustering::HNODE*, dwControlCode : UInt32, lpInBuffer : Void*, cbInBufferSize : UInt32, lpOutBuffer : Void*, cbOutBufferSize : UInt32, lpBytesReturned : UInt32*) : UInt32

    fun ClusterResourceTypeControl(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, lpszResourceTypeName : Win32cr::Foundation::PWSTR, hHostNode : Win32cr::Networking::Clustering::HNODE*, dwControlCode : UInt32, lpInBuffer : Void*, nInBufferSize : UInt32, lpOutBuffer : Void*, nOutBufferSize : UInt32, lpBytesReturned : UInt32*) : UInt32

    fun ClusterResourceTypeControlAsUser(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, lpszResourceTypeName : Win32cr::Foundation::PWSTR, hHostNode : Win32cr::Networking::Clustering::HNODE*, dwControlCode : UInt32, lpInBuffer : Void*, nInBufferSize : UInt32, lpOutBuffer : Void*, nOutBufferSize : UInt32, lpBytesReturned : UInt32*) : UInt32

    fun ClusterGroupControl(hGroup : Win32cr::Networking::Clustering::HGROUP*, hHostNode : Win32cr::Networking::Clustering::HNODE*, dwControlCode : UInt32, lpInBuffer : Void*, nInBufferSize : UInt32, lpOutBuffer : Void*, nOutBufferSize : UInt32, lpBytesReturned : UInt32*) : UInt32

    fun ClusterNodeControl(hNode : Win32cr::Networking::Clustering::HNODE*, hHostNode : Win32cr::Networking::Clustering::HNODE*, dwControlCode : UInt32, lpInBuffer : Void*, nInBufferSize : UInt32, lpOutBuffer : Void*, nOutBufferSize : UInt32, lpBytesReturned : UInt32*) : UInt32

    fun GetClusterResourceNetworkName(hResource : Win32cr::Networking::Clustering::HRESOURCE*, lpBuffer : UInt16*, nSize : UInt32*) : Win32cr::Foundation::BOOL

    fun ClusterResourceOpenEnum(hResource : Win32cr::Networking::Clustering::HRESOURCE*, dwType : UInt32) : Win32cr::Networking::Clustering::HRESENUM*

    fun ClusterResourceGetEnumCount(hResEnum : Win32cr::Networking::Clustering::HRESENUM*) : UInt32

    fun ClusterResourceEnum(hResEnum : Win32cr::Networking::Clustering::HRESENUM*, dwIndex : UInt32, lpdwType : UInt32*, lpszName : UInt16*, lpcchName : UInt32*) : UInt32

    fun ClusterResourceCloseEnum(hResEnum : Win32cr::Networking::Clustering::HRESENUM*) : UInt32

    fun CreateClusterResourceType(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, lpszResourceTypeName : Win32cr::Foundation::PWSTR, lpszDisplayName : Win32cr::Foundation::PWSTR, lpszResourceTypeDll : Win32cr::Foundation::PWSTR, dwLooksAlivePollInterval : UInt32, dwIsAlivePollInterval : UInt32) : UInt32

    fun DeleteClusterResourceType(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, lpszResourceTypeName : Win32cr::Foundation::PWSTR) : UInt32

    fun ClusterResourceTypeOpenEnum(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, lpszResourceTypeName : Win32cr::Foundation::PWSTR, dwType : UInt32) : Win32cr::Networking::Clustering::HRESTYPEENUM*

    fun ClusterResourceTypeGetEnumCount(hResTypeEnum : Win32cr::Networking::Clustering::HRESTYPEENUM*) : UInt32

    fun ClusterResourceTypeEnum(hResTypeEnum : Win32cr::Networking::Clustering::HRESTYPEENUM*, dwIndex : UInt32, lpdwType : UInt32*, lpszName : UInt16*, lpcchName : UInt32*) : UInt32

    fun ClusterResourceTypeCloseEnum(hResTypeEnum : Win32cr::Networking::Clustering::HRESTYPEENUM*) : UInt32

    fun OpenClusterNetwork(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, lpszNetworkName : Win32cr::Foundation::PWSTR) : Win32cr::Networking::Clustering::HNETWORK*

    fun OpenClusterNetworkEx(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, lpszNetworkName : Win32cr::Foundation::PWSTR, dwDesiredAccess : UInt32, lpdwGrantedAccess : UInt32*) : Win32cr::Networking::Clustering::HNETWORK*

    fun CloseClusterNetwork(hNetwork : Win32cr::Networking::Clustering::HNETWORK*) : Win32cr::Foundation::BOOL

    fun GetClusterFromNetwork(hNetwork : Win32cr::Networking::Clustering::HNETWORK*) : Win32cr::Networking::Clustering::HCLUSTER*

    fun ClusterNetworkOpenEnum(hNetwork : Win32cr::Networking::Clustering::HNETWORK*, dwType : UInt32) : Win32cr::Networking::Clustering::HNETWORKENUM*

    fun ClusterNetworkGetEnumCount(hNetworkEnum : Win32cr::Networking::Clustering::HNETWORKENUM*) : UInt32

    fun ClusterNetworkEnum(hNetworkEnum : Win32cr::Networking::Clustering::HNETWORKENUM*, dwIndex : UInt32, lpdwType : UInt32*, lpszName : UInt16*, lpcchName : UInt32*) : UInt32

    fun ClusterNetworkCloseEnum(hNetworkEnum : Win32cr::Networking::Clustering::HNETWORKENUM*) : UInt32

    fun GetClusterNetworkState(hNetwork : Win32cr::Networking::Clustering::HNETWORK*) : Win32cr::Networking::Clustering::CLUSTER_NETWORK_STATE

    fun SetClusterNetworkName(hNetwork : Win32cr::Networking::Clustering::HNETWORK*, lpszName : Win32cr::Foundation::PWSTR) : UInt32

    fun GetClusterNetworkId(hNetwork : Win32cr::Networking::Clustering::HNETWORK*, lpszNetworkId : UInt16*, lpcchName : UInt32*) : UInt32

    fun ClusterNetworkControl(hNetwork : Win32cr::Networking::Clustering::HNETWORK*, hHostNode : Win32cr::Networking::Clustering::HNODE*, dwControlCode : UInt32, lpInBuffer : Void*, nInBufferSize : UInt32, lpOutBuffer : Void*, nOutBufferSize : UInt32, lpBytesReturned : UInt32*) : UInt32

    fun OpenClusterNetInterface(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, lpszInterfaceName : Win32cr::Foundation::PWSTR) : Win32cr::Networking::Clustering::HNETINTERFACE*

    fun OpenClusterNetInterfaceEx(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, lpszInterfaceName : Win32cr::Foundation::PWSTR, dwDesiredAccess : UInt32, lpdwGrantedAccess : UInt32*) : Win32cr::Networking::Clustering::HNETINTERFACE*

    fun GetClusterNetInterface(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, lpszNodeName : Win32cr::Foundation::PWSTR, lpszNetworkName : Win32cr::Foundation::PWSTR, lpszInterfaceName : UInt16*, lpcchInterfaceName : UInt32*) : UInt32

    fun CloseClusterNetInterface(hNetInterface : Win32cr::Networking::Clustering::HNETINTERFACE*) : Win32cr::Foundation::BOOL

    fun GetClusterFromNetInterface(hNetInterface : Win32cr::Networking::Clustering::HNETINTERFACE*) : Win32cr::Networking::Clustering::HCLUSTER*

    fun GetClusterNetInterfaceState(hNetInterface : Win32cr::Networking::Clustering::HNETINTERFACE*) : Win32cr::Networking::Clustering::CLUSTER_NETINTERFACE_STATE

    fun ClusterNetInterfaceControl(hNetInterface : Win32cr::Networking::Clustering::HNETINTERFACE*, hHostNode : Win32cr::Networking::Clustering::HNODE*, dwControlCode : UInt32, lpInBuffer : Void*, nInBufferSize : UInt32, lpOutBuffer : Void*, nOutBufferSize : UInt32, lpBytesReturned : UInt32*) : UInt32

    fun GetClusterKey(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, samDesired : UInt32) : Win32cr::System::Registry::HKEY

    fun GetClusterGroupKey(hGroup : Win32cr::Networking::Clustering::HGROUP*, samDesired : UInt32) : Win32cr::System::Registry::HKEY

    fun GetClusterResourceKey(hResource : Win32cr::Networking::Clustering::HRESOURCE*, samDesired : UInt32) : Win32cr::System::Registry::HKEY

    fun GetClusterNodeKey(hNode : Win32cr::Networking::Clustering::HNODE*, samDesired : UInt32) : Win32cr::System::Registry::HKEY

    fun GetClusterNetworkKey(hNetwork : Win32cr::Networking::Clustering::HNETWORK*, samDesired : UInt32) : Win32cr::System::Registry::HKEY

    fun GetClusterNetInterfaceKey(hNetInterface : Win32cr::Networking::Clustering::HNETINTERFACE*, samDesired : UInt32) : Win32cr::System::Registry::HKEY

    fun ClusterRegCreateKey(hKey : Win32cr::System::Registry::HKEY, lpszSubKey : Win32cr::Foundation::PWSTR, dwOptions : UInt32, samDesired : UInt32, lpSecurityAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, phkResult : Win32cr::System::Registry::HKEY*, lpdwDisposition : UInt32*) : Int32

    fun ClusterRegOpenKey(hKey : Win32cr::System::Registry::HKEY, lpszSubKey : Win32cr::Foundation::PWSTR, samDesired : UInt32, phkResult : Win32cr::System::Registry::HKEY*) : Int32

    fun ClusterRegDeleteKey(hKey : Win32cr::System::Registry::HKEY, lpszSubKey : Win32cr::Foundation::PWSTR) : Int32

    fun ClusterRegCloseKey(hKey : Win32cr::System::Registry::HKEY) : Int32

    fun ClusterRegEnumKey(hKey : Win32cr::System::Registry::HKEY, dwIndex : UInt32, lpszName : UInt16*, lpcchName : UInt32*, lpftLastWriteTime : Win32cr::Foundation::FILETIME*) : Int32

    fun ClusterRegSetValue(hKey : Win32cr::System::Registry::HKEY, lpszValueName : Win32cr::Foundation::PWSTR, dwType : UInt32, lpData : UInt8*, cbData : UInt32) : UInt32

    fun ClusterRegDeleteValue(hKey : Win32cr::System::Registry::HKEY, lpszValueName : Win32cr::Foundation::PWSTR) : UInt32

    fun ClusterRegQueryValue(hKey : Win32cr::System::Registry::HKEY, lpszValueName : Win32cr::Foundation::PWSTR, lpdwValueType : UInt32*, lpData : UInt8*, lpcbData : UInt32*) : Int32

    fun ClusterRegEnumValue(hKey : Win32cr::System::Registry::HKEY, dwIndex : UInt32, lpszValueName : UInt16*, lpcchValueName : UInt32*, lpdwType : UInt32*, lpData : UInt8*, lpcbData : UInt32*) : UInt32

    fun ClusterRegQueryInfoKey(hKey : Win32cr::System::Registry::HKEY, lpcSubKeys : UInt32*, lpcchMaxSubKeyLen : UInt32*, lpcValues : UInt32*, lpcchMaxValueNameLen : UInt32*, lpcbMaxValueLen : UInt32*, lpcbSecurityDescriptor : UInt32*, lpftLastWriteTime : Win32cr::Foundation::FILETIME*) : Int32

    fun ClusterRegGetKeySecurity(hKey : Win32cr::System::Registry::HKEY, requested_information : UInt32, pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, lpcbSecurityDescriptor : UInt32*) : Int32

    fun ClusterRegSetKeySecurity(hKey : Win32cr::System::Registry::HKEY, security_information : UInt32, pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR) : Int32

    fun ClusterRegSyncDatabase(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, flags : UInt32) : Int32

    fun ClusterRegCreateBatch(hKey : Win32cr::System::Registry::HKEY, pHREGBATCH : Win32cr::Networking::Clustering::HREGBATCH**) : Int32

    fun ClusterRegBatchAddCommand(hRegBatch : Win32cr::Networking::Clustering::HREGBATCH*, dwCommand : Win32cr::Networking::Clustering::CLUSTER_REG_COMMAND, wzName : Win32cr::Foundation::PWSTR, dwOptions : UInt32, lpData : Void*, cbData : UInt32) : Int32

    fun ClusterRegCloseBatch(hRegBatch : Win32cr::Networking::Clustering::HREGBATCH*, bCommit : Win32cr::Foundation::BOOL, failedCommandNumber : Int32*) : Int32

    fun ClusterRegCloseBatchEx(hRegBatch : Win32cr::Networking::Clustering::HREGBATCH*, flags : UInt32, failedCommandNumber : Int32*) : Int32

    fun ClusterRegBatchReadCommand(hBatchNotification : Win32cr::Networking::Clustering::HREGBATCHNOTIFICATION*, pBatchCommand : Win32cr::Networking::Clustering::CLUSTER_BATCH_COMMAND*) : Int32

    fun ClusterRegBatchCloseNotification(hBatchNotification : Win32cr::Networking::Clustering::HREGBATCHNOTIFICATION*) : Int32

    fun ClusterRegCreateBatchNotifyPort(hKey : Win32cr::System::Registry::HKEY, phBatchNotifyPort : Win32cr::Networking::Clustering::HREGBATCHPORT**) : Int32

    fun ClusterRegCloseBatchNotifyPort(hBatchNotifyPort : Win32cr::Networking::Clustering::HREGBATCHPORT*) : Int32

    fun ClusterRegGetBatchNotification(hBatchNotify : Win32cr::Networking::Clustering::HREGBATCHPORT*, phBatchNotification : Win32cr::Networking::Clustering::HREGBATCHNOTIFICATION**) : Int32

    fun ClusterRegCreateReadBatch(hKey : Win32cr::System::Registry::HKEY, phRegReadBatch : Win32cr::Networking::Clustering::HREGREADBATCH**) : Int32

    fun ClusterRegReadBatchAddCommand(hRegReadBatch : Win32cr::Networking::Clustering::HREGREADBATCH*, wzSubkeyName : Win32cr::Foundation::PWSTR, wzValueName : Win32cr::Foundation::PWSTR) : Int32

    fun ClusterRegCloseReadBatch(hRegReadBatch : Win32cr::Networking::Clustering::HREGREADBATCH*, phRegReadBatchReply : Win32cr::Networking::Clustering::HREGREADBATCHREPLY**) : Int32

    fun ClusterRegCloseReadBatchEx(hRegReadBatch : Win32cr::Networking::Clustering::HREGREADBATCH*, flags : UInt32, phRegReadBatchReply : Win32cr::Networking::Clustering::HREGREADBATCHREPLY**) : Int32

    fun ClusterRegReadBatchReplyNextCommand(hRegReadBatchReply : Win32cr::Networking::Clustering::HREGREADBATCHREPLY*, pBatchCommand : Win32cr::Networking::Clustering::CLUSTER_READ_BATCH_COMMAND*) : Int32

    fun ClusterRegCloseReadBatchReply(hRegReadBatchReply : Win32cr::Networking::Clustering::HREGREADBATCHREPLY*) : Int32

    fun ClusterSetAccountAccess(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, szAccountSID : Win32cr::Foundation::PWSTR, dwAccess : UInt32, dwControlType : UInt32) : UInt32

    fun CreateCluster(pConfig : Win32cr::Networking::Clustering::CREATE_CLUSTER_CONFIG*, pfnProgressCallback : Win32cr::Networking::Clustering::PCLUSTER_SETUP_PROGRESS_CALLBACK, pvCallbackArg : Void*) : Win32cr::Networking::Clustering::HCLUSTER*

    fun CreateClusterNameAccount(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, pConfig : Win32cr::Networking::Clustering::CREATE_CLUSTER_NAME_ACCOUNT*, pfnProgressCallback : Win32cr::Networking::Clustering::PCLUSTER_SETUP_PROGRESS_CALLBACK, pvCallbackArg : Void*) : UInt32

    fun RemoveClusterNameAccount(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, bDeleteComputerObjects : Win32cr::Foundation::BOOL) : UInt32

    fun DetermineCNOResTypeFromNodelist(cNodes : UInt32, ppszNodeNames : Win32cr::Foundation::PWSTR*, pCNOResType : Win32cr::Networking::Clustering::CLUSTER_MGMT_POINT_RESTYPE*) : UInt32

    fun DetermineCNOResTypeFromCluster(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, pCNOResType : Win32cr::Networking::Clustering::CLUSTER_MGMT_POINT_RESTYPE*) : UInt32

    fun DetermineClusterCloudTypeFromNodelist(cNodes : UInt32, ppszNodeNames : Win32cr::Foundation::PWSTR*, pCloudType : Win32cr::Networking::Clustering::CLUSTER_CLOUD_TYPE*) : UInt32

    fun DetermineClusterCloudTypeFromCluster(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, pCloudType : Win32cr::Networking::Clustering::CLUSTER_CLOUD_TYPE*) : UInt32

    fun GetNodeCloudTypeDW(ppszNodeName : Win32cr::Foundation::PWSTR, node_cloud_type : UInt32*) : UInt32

    fun RegisterClusterResourceTypeNotifyV2(hChange : Win32cr::Networking::Clustering::HCHANGE*, hCluster : Win32cr::Networking::Clustering::HCLUSTER*, flags : Int64, resTypeName : Win32cr::Foundation::PWSTR, dwNotifyKey : LibC::UIntPtrT) : UInt32

    fun AddClusterNode(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, lpszNodeName : Win32cr::Foundation::PWSTR, pfnProgressCallback : Win32cr::Networking::Clustering::PCLUSTER_SETUP_PROGRESS_CALLBACK, pvCallbackArg : Void*) : Win32cr::Networking::Clustering::HNODE*

    fun AddClusterStorageNode(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, lpszNodeName : Win32cr::Foundation::PWSTR, pfnProgressCallback : Win32cr::Networking::Clustering::PCLUSTER_SETUP_PROGRESS_CALLBACK, pvCallbackArg : Void*, lpszClusterStorageNodeDescription : Win32cr::Foundation::PWSTR, lpszClusterStorageNodeLocation : Win32cr::Foundation::PWSTR) : UInt32

    fun AddClusterNodeEx(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, lpszNodeName : Win32cr::Foundation::PWSTR, dwFlags : UInt32, pfnProgressCallback : Win32cr::Networking::Clustering::PCLUSTER_SETUP_PROGRESS_CALLBACK, pvCallbackArg : Void*) : Win32cr::Networking::Clustering::HNODE*

    fun RemoveClusterStorageNode(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, lpszClusterStorageEnclosureName : Win32cr::Foundation::PWSTR, dwTimeout : UInt32, dwFlags : UInt32) : UInt32

    fun DestroyCluster(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, pfnProgressCallback : Win32cr::Networking::Clustering::PCLUSTER_SETUP_PROGRESS_CALLBACK, pvCallbackArg : Void*, fdeleteVirtualComputerObjects : Win32cr::Foundation::BOOL) : UInt32

    fun InitializeClusterHealthFault(clusterHealthFault : Win32cr::Networking::Clustering::CLUSTER_HEALTH_FAULT*) : UInt32

    fun InitializeClusterHealthFaultArray(clusterHealthFaultArray : Win32cr::Networking::Clustering::CLUSTER_HEALTH_FAULT_ARRAY*) : UInt32

    fun FreeClusterHealthFault(clusterHealthFault : Win32cr::Networking::Clustering::CLUSTER_HEALTH_FAULT*) : UInt32

    fun FreeClusterHealthFaultArray(clusterHealthFaultArray : Win32cr::Networking::Clustering::CLUSTER_HEALTH_FAULT_ARRAY*) : UInt32

    fun ClusGetClusterHealthFaults(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, objects : Win32cr::Networking::Clustering::CLUSTER_HEALTH_FAULT_ARRAY*, flags : UInt32) : UInt32

    fun ClusRemoveClusterHealthFault(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, id : Win32cr::Foundation::PWSTR, flags : UInt32) : UInt32

    fun ClusAddClusterHealthFault(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, failure : Win32cr::Networking::Clustering::CLUSTER_HEALTH_FAULT*, param2 : UInt32) : UInt32

    fun ResUtilStartResourceService(pszServiceName : Win32cr::Foundation::PWSTR, phServiceHandle : LibC::IntPtrT*) : UInt32

    fun ResUtilVerifyResourceService(pszServiceName : Win32cr::Foundation::PWSTR) : UInt32

    fun ResUtilStopResourceService(pszServiceName : Win32cr::Foundation::PWSTR) : UInt32

    fun ResUtilVerifyService(hServiceHandle : Win32cr::Security::SC_HANDLE) : UInt32

    fun ResUtilStopService(hServiceHandle : Win32cr::Security::SC_HANDLE) : UInt32

    fun ResUtilCreateDirectoryTree(pszPath : Win32cr::Foundation::PWSTR) : UInt32

    fun ResUtilIsPathValid(pszPath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    fun ResUtilEnumProperties(pPropertyTable : Win32cr::Networking::Clustering::RESUTIL_PROPERTY_ITEM*, pszOutProperties : Win32cr::Foundation::PWSTR, cbOutPropertiesSize : UInt32, pcbBytesReturned : UInt32*, pcbRequired : UInt32*) : UInt32

    fun ResUtilEnumPrivateProperties(hkeyClusterKey : Win32cr::System::Registry::HKEY, pszOutProperties : Win32cr::Foundation::PWSTR, cbOutPropertiesSize : UInt32, pcbBytesReturned : UInt32*, pcbRequired : UInt32*) : UInt32

    fun ResUtilGetProperties(hkeyClusterKey : Win32cr::System::Registry::HKEY, pPropertyTable : Win32cr::Networking::Clustering::RESUTIL_PROPERTY_ITEM*, pOutPropertyList : Void*, cbOutPropertyListSize : UInt32, pcbBytesReturned : UInt32*, pcbRequired : UInt32*) : UInt32

    fun ResUtilGetAllProperties(hkeyClusterKey : Win32cr::System::Registry::HKEY, pPropertyTable : Win32cr::Networking::Clustering::RESUTIL_PROPERTY_ITEM*, pOutPropertyList : Void*, cbOutPropertyListSize : UInt32, pcbBytesReturned : UInt32*, pcbRequired : UInt32*) : UInt32

    fun ResUtilGetPrivateProperties(hkeyClusterKey : Win32cr::System::Registry::HKEY, pOutPropertyList : Void*, cbOutPropertyListSize : UInt32, pcbBytesReturned : UInt32*, pcbRequired : UInt32*) : UInt32

    fun ResUtilGetPropertySize(hkeyClusterKey : Win32cr::System::Registry::HKEY, pPropertyTableItem : Win32cr::Networking::Clustering::RESUTIL_PROPERTY_ITEM*, pcbOutPropertyListSize : UInt32*, pnPropertyCount : UInt32*) : UInt32

    fun ResUtilGetProperty(hkeyClusterKey : Win32cr::System::Registry::HKEY, pPropertyTableItem : Win32cr::Networking::Clustering::RESUTIL_PROPERTY_ITEM*, pOutPropertyItem : Void**, pcbOutPropertyItemSize : UInt32*) : UInt32

    fun ResUtilVerifyPropertyTable(pPropertyTable : Win32cr::Networking::Clustering::RESUTIL_PROPERTY_ITEM*, reserved : Void*, bAllowUnknownProperties : Win32cr::Foundation::BOOL, pInPropertyList : Void*, cbInPropertyListSize : UInt32, pOutParams : UInt8*) : UInt32

    fun ResUtilSetPropertyTable(hkeyClusterKey : Win32cr::System::Registry::HKEY, pPropertyTable : Win32cr::Networking::Clustering::RESUTIL_PROPERTY_ITEM*, reserved : Void*, bAllowUnknownProperties : Win32cr::Foundation::BOOL, pInPropertyList : Void*, cbInPropertyListSize : UInt32, pOutParams : UInt8*) : UInt32

    fun ResUtilSetPropertyTableEx(hkeyClusterKey : Win32cr::System::Registry::HKEY, pPropertyTable : Win32cr::Networking::Clustering::RESUTIL_PROPERTY_ITEM*, reserved : Void*, bAllowUnknownProperties : Win32cr::Foundation::BOOL, pInPropertyList : Void*, cbInPropertyListSize : UInt32, bForceWrite : Win32cr::Foundation::BOOL, pOutParams : UInt8*) : UInt32

    fun ResUtilSetPropertyParameterBlock(hkeyClusterKey : Win32cr::System::Registry::HKEY, pPropertyTable : Win32cr::Networking::Clustering::RESUTIL_PROPERTY_ITEM*, reserved : Void*, pInParams : UInt8*, pInPropertyList : Void*, cbInPropertyListSize : UInt32, pOutParams : UInt8*) : UInt32

    fun ResUtilSetPropertyParameterBlockEx(hkeyClusterKey : Win32cr::System::Registry::HKEY, pPropertyTable : Win32cr::Networking::Clustering::RESUTIL_PROPERTY_ITEM*, reserved : Void*, pInParams : UInt8*, pInPropertyList : Void*, cbInPropertyListSize : UInt32, bForceWrite : Win32cr::Foundation::BOOL, pOutParams : UInt8*) : UInt32

    fun ResUtilSetUnknownProperties(hkeyClusterKey : Win32cr::System::Registry::HKEY, pPropertyTable : Win32cr::Networking::Clustering::RESUTIL_PROPERTY_ITEM*, pInPropertyList : Void*, cbInPropertyListSize : UInt32) : UInt32

    fun ResUtilGetPropertiesToParameterBlock(hkeyClusterKey : Win32cr::System::Registry::HKEY, pPropertyTable : Win32cr::Networking::Clustering::RESUTIL_PROPERTY_ITEM*, pOutParams : UInt8*, bCheckForRequiredProperties : Win32cr::Foundation::BOOL, pszNameOfPropInError : Win32cr::Foundation::PWSTR*) : UInt32

    fun ResUtilPropertyListFromParameterBlock(pPropertyTable : Win32cr::Networking::Clustering::RESUTIL_PROPERTY_ITEM*, pOutPropertyList : Void*, pcbOutPropertyListSize : UInt32*, pInParams : UInt8*, pcbBytesReturned : UInt32*, pcbRequired : UInt32*) : UInt32

    fun ResUtilDupParameterBlock(pOutParams : UInt8*, pInParams : UInt8*, pPropertyTable : Win32cr::Networking::Clustering::RESUTIL_PROPERTY_ITEM*) : UInt32

    fun ResUtilFreeParameterBlock(pOutParams : UInt8*, pInParams : UInt8*, pPropertyTable : Win32cr::Networking::Clustering::RESUTIL_PROPERTY_ITEM*) : Void

    fun ResUtilAddUnknownProperties(hkeyClusterKey : Win32cr::System::Registry::HKEY, pPropertyTable : Win32cr::Networking::Clustering::RESUTIL_PROPERTY_ITEM*, pOutPropertyList : Void*, pcbOutPropertyListSize : UInt32, pcbBytesReturned : UInt32*, pcbRequired : UInt32*) : UInt32

    fun ResUtilSetPrivatePropertyList(hkeyClusterKey : Win32cr::System::Registry::HKEY, pInPropertyList : Void*, cbInPropertyListSize : UInt32) : UInt32

    fun ResUtilVerifyPrivatePropertyList(pInPropertyList : Void*, cbInPropertyListSize : UInt32) : UInt32

    fun ResUtilDupString(pszInString : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::PWSTR

    fun ResUtilGetBinaryValue(hkeyClusterKey : Win32cr::System::Registry::HKEY, pszValueName : Win32cr::Foundation::PWSTR, ppbOutValue : UInt8**, pcbOutValueSize : UInt32*) : UInt32

    fun ResUtilGetSzValue(hkeyClusterKey : Win32cr::System::Registry::HKEY, pszValueName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::PWSTR

    fun ResUtilGetDwordValue(hkeyClusterKey : Win32cr::System::Registry::HKEY, pszValueName : Win32cr::Foundation::PWSTR, pdwOutValue : UInt32*, dwDefaultValue : UInt32) : UInt32

    fun ResUtilGetQwordValue(hkeyClusterKey : Win32cr::System::Registry::HKEY, pszValueName : Win32cr::Foundation::PWSTR, pqwOutValue : UInt64*, qwDefaultValue : UInt64) : UInt32

    fun ResUtilSetBinaryValue(hkeyClusterKey : Win32cr::System::Registry::HKEY, pszValueName : Win32cr::Foundation::PWSTR, pbNewValue : UInt8*, cbNewValueSize : UInt32, ppbOutValue : UInt8**, pcbOutValueSize : UInt32*) : UInt32

    fun ResUtilSetSzValue(hkeyClusterKey : Win32cr::System::Registry::HKEY, pszValueName : Win32cr::Foundation::PWSTR, pszNewValue : Win32cr::Foundation::PWSTR, ppszOutString : Win32cr::Foundation::PWSTR*) : UInt32

    fun ResUtilSetExpandSzValue(hkeyClusterKey : Win32cr::System::Registry::HKEY, pszValueName : Win32cr::Foundation::PWSTR, pszNewValue : Win32cr::Foundation::PWSTR, ppszOutString : Win32cr::Foundation::PWSTR*) : UInt32

    fun ResUtilSetMultiSzValue(hkeyClusterKey : Win32cr::System::Registry::HKEY, pszValueName : Win32cr::Foundation::PWSTR, pszNewValue : Win32cr::Foundation::PWSTR, cbNewValueSize : UInt32, ppszOutValue : Win32cr::Foundation::PWSTR*, pcbOutValueSize : UInt32*) : UInt32

    fun ResUtilSetDwordValue(hkeyClusterKey : Win32cr::System::Registry::HKEY, pszValueName : Win32cr::Foundation::PWSTR, dwNewValue : UInt32, pdwOutValue : UInt32*) : UInt32

    fun ResUtilSetQwordValue(hkeyClusterKey : Win32cr::System::Registry::HKEY, pszValueName : Win32cr::Foundation::PWSTR, qwNewValue : UInt64, pqwOutValue : UInt64*) : UInt32

    fun ResUtilSetValueEx(hkeyClusterKey : Win32cr::System::Registry::HKEY, valueName : Win32cr::Foundation::PWSTR, valueType : UInt32, valueData : UInt8*, valueSize : UInt32, flags : UInt32) : UInt32

    fun ResUtilGetBinaryProperty(ppbOutValue : UInt8**, pcbOutValueSize : UInt32*, pValueStruct : Win32cr::Networking::Clustering::CLUSPROP_BINARY*, pbOldValue : UInt8*, cbOldValueSize : UInt32, ppPropertyList : UInt8**, pcbPropertyListSize : UInt32*) : UInt32

    fun ResUtilGetSzProperty(ppszOutValue : Win32cr::Foundation::PWSTR*, pValueStruct : Win32cr::Networking::Clustering::CLUSPROP_SZ*, pszOldValue : Win32cr::Foundation::PWSTR, ppPropertyList : UInt8**, pcbPropertyListSize : UInt32*) : UInt32

    fun ResUtilGetMultiSzProperty(ppszOutValue : Win32cr::Foundation::PWSTR*, pcbOutValueSize : UInt32*, pValueStruct : Win32cr::Networking::Clustering::CLUSPROP_SZ*, pszOldValue : Win32cr::Foundation::PWSTR, cbOldValueSize : UInt32, ppPropertyList : UInt8**, pcbPropertyListSize : UInt32*) : UInt32

    fun ResUtilGetDwordProperty(pdwOutValue : UInt32*, pValueStruct : Win32cr::Networking::Clustering::CLUSPROP_DWORD*, dwOldValue : UInt32, dwMinimum : UInt32, dwMaximum : UInt32, ppPropertyList : UInt8**, pcbPropertyListSize : UInt32*) : UInt32

    fun ResUtilGetLongProperty(plOutValue : Int32*, pValueStruct : Win32cr::Networking::Clustering::CLUSPROP_LONG*, lOldValue : Int32, lMinimum : Int32, lMaximum : Int32, ppPropertyList : UInt8**, pcbPropertyListSize : UInt32*) : UInt32

    fun ResUtilGetFileTimeProperty(pftOutValue : Win32cr::Foundation::FILETIME*, pValueStruct : Win32cr::Networking::Clustering::CLUSPROP_FILETIME*, ftOldValue : Win32cr::Foundation::FILETIME, ftMinimum : Win32cr::Foundation::FILETIME, ftMaximum : Win32cr::Foundation::FILETIME, ppPropertyList : UInt8**, pcbPropertyListSize : UInt32*) : UInt32

    fun ResUtilGetEnvironmentWithNetName(hResource : Win32cr::Networking::Clustering::HRESOURCE*) : Void*

    fun ResUtilFreeEnvironment(lpEnvironment : Void*) : UInt32

    fun ResUtilExpandEnvironmentStrings(pszSrc : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::PWSTR

    fun ResUtilSetResourceServiceEnvironment(pszServiceName : Win32cr::Foundation::PWSTR, hResource : Win32cr::Networking::Clustering::HRESOURCE*, pfnLogEvent : Win32cr::Networking::Clustering::PLOG_EVENT_ROUTINE, hResourceHandle : LibC::IntPtrT) : UInt32

    fun ResUtilRemoveResourceServiceEnvironment(pszServiceName : Win32cr::Foundation::PWSTR, pfnLogEvent : Win32cr::Networking::Clustering::PLOG_EVENT_ROUTINE, hResourceHandle : LibC::IntPtrT) : UInt32

    fun ResUtilSetResourceServiceStartParameters(pszServiceName : Win32cr::Foundation::PWSTR, schSCMHandle : Win32cr::Security::SC_HANDLE, phService : LibC::IntPtrT*, pfnLogEvent : Win32cr::Networking::Clustering::PLOG_EVENT_ROUTINE, hResourceHandle : LibC::IntPtrT) : UInt32

    fun ResUtilFindSzProperty(pPropertyList : Void*, cbPropertyListSize : UInt32, pszPropertyName : Win32cr::Foundation::PWSTR, pszPropertyValue : Win32cr::Foundation::PWSTR*) : UInt32

    fun ResUtilFindExpandSzProperty(pPropertyList : Void*, cbPropertyListSize : UInt32, pszPropertyName : Win32cr::Foundation::PWSTR, pszPropertyValue : Win32cr::Foundation::PWSTR*) : UInt32

    fun ResUtilFindExpandedSzProperty(pPropertyList : Void*, cbPropertyListSize : UInt32, pszPropertyName : Win32cr::Foundation::PWSTR, pszPropertyValue : Win32cr::Foundation::PWSTR*) : UInt32

    fun ResUtilFindDwordProperty(pPropertyList : Void*, cbPropertyListSize : UInt32, pszPropertyName : Win32cr::Foundation::PWSTR, pdwPropertyValue : UInt32*) : UInt32

    fun ResUtilFindBinaryProperty(pPropertyList : Void*, cbPropertyListSize : UInt32, pszPropertyName : Win32cr::Foundation::PWSTR, pbPropertyValue : UInt8**, pcbPropertyValueSize : UInt32*) : UInt32

    fun ResUtilFindMultiSzProperty(pPropertyList : Void*, cbPropertyListSize : UInt32, pszPropertyName : Win32cr::Foundation::PWSTR, pszPropertyValue : Win32cr::Foundation::PWSTR*, pcbPropertyValueSize : UInt32*) : UInt32

    fun ResUtilFindLongProperty(pPropertyList : Void*, cbPropertyListSize : UInt32, pszPropertyName : Win32cr::Foundation::PWSTR, plPropertyValue : Int32*) : UInt32

    fun ResUtilFindULargeIntegerProperty(pPropertyList : Void*, cbPropertyListSize : UInt32, pszPropertyName : Win32cr::Foundation::PWSTR, plPropertyValue : UInt64*) : UInt32

    fun ResUtilFindFileTimeProperty(pPropertyList : Void*, cbPropertyListSize : UInt32, pszPropertyName : Win32cr::Foundation::PWSTR, pftPropertyValue : Win32cr::Foundation::FILETIME*) : UInt32

    fun ClusWorkerCreate(lpWorker : Win32cr::Networking::Clustering::CLUS_WORKER*, lpStartAddress : Win32cr::Networking::Clustering::PWORKER_START_ROUTINE, lpParameter : Void*) : UInt32

    fun ClusWorkerCheckTerminate(lpWorker : Win32cr::Networking::Clustering::CLUS_WORKER*) : Win32cr::Foundation::BOOL

    fun ClusWorkerTerminate(lpWorker : Win32cr::Networking::Clustering::CLUS_WORKER*) : Void

    fun ClusWorkerTerminateEx(clus_worker : Win32cr::Networking::Clustering::CLUS_WORKER*, timeout_in_milliseconds : UInt32, wait_only : Win32cr::Foundation::BOOL) : UInt32

    fun ClusWorkersTerminate(clus_workers : Win32cr::Networking::Clustering::CLUS_WORKER**, clus_workers_count : LibC::UIntPtrT, timeout_in_milliseconds : UInt32, wait_only : Win32cr::Foundation::BOOL) : UInt32

    fun ResUtilResourcesEqual(hSelf : Win32cr::Networking::Clustering::HRESOURCE*, hResource : Win32cr::Networking::Clustering::HRESOURCE*) : Win32cr::Foundation::BOOL

    fun ResUtilResourceTypesEqual(lpszResourceTypeName : Win32cr::Foundation::PWSTR, hResource : Win32cr::Networking::Clustering::HRESOURCE*) : Win32cr::Foundation::BOOL

    fun ResUtilIsResourceClassEqual(prci : Win32cr::Networking::Clustering::CLUS_RESOURCE_CLASS_INFO*, hResource : Win32cr::Networking::Clustering::HRESOURCE*) : Win32cr::Foundation::BOOL

    fun ResUtilEnumResources(hSelf : Win32cr::Networking::Clustering::HRESOURCE*, lpszResTypeName : Win32cr::Foundation::PWSTR, pResCallBack : Win32cr::Networking::Clustering::LPRESOURCE_CALLBACK, pParameter : Void*) : UInt32

    fun ResUtilEnumResourcesEx(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, hSelf : Win32cr::Networking::Clustering::HRESOURCE*, lpszResTypeName : Win32cr::Foundation::PWSTR, pResCallBack : Win32cr::Networking::Clustering::LPRESOURCE_CALLBACK_EX, pParameter : Void*) : UInt32

    fun ResUtilGetResourceDependency(hSelf : Win32cr::Foundation::HANDLE, lpszResourceType : Win32cr::Foundation::PWSTR) : Win32cr::Networking::Clustering::HRESOURCE*

    fun ResUtilGetResourceDependencyByName(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, hSelf : Win32cr::Foundation::HANDLE, lpszResourceType : Win32cr::Foundation::PWSTR, bRecurse : Win32cr::Foundation::BOOL) : Win32cr::Networking::Clustering::HRESOURCE*

    fun ResUtilGetResourceDependencyByClass(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, hSelf : Win32cr::Foundation::HANDLE, prci : Win32cr::Networking::Clustering::CLUS_RESOURCE_CLASS_INFO*, bRecurse : Win32cr::Foundation::BOOL) : Win32cr::Networking::Clustering::HRESOURCE*

    fun ResUtilGetResourceNameDependency(lpszResourceName : Win32cr::Foundation::PWSTR, lpszResourceType : Win32cr::Foundation::PWSTR) : Win32cr::Networking::Clustering::HRESOURCE*

    fun ResUtilGetResourceDependentIPAddressProps(hResource : Win32cr::Networking::Clustering::HRESOURCE*, pszAddress : UInt16*, pcchAddress : UInt32*, pszSubnetMask : UInt16*, pcchSubnetMask : UInt32*, pszNetwork : UInt16*, pcchNetwork : UInt32*) : UInt32

    fun ResUtilFindDependentDiskResourceDriveLetter(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, hResource : Win32cr::Networking::Clustering::HRESOURCE*, pszDriveLetter : UInt16*, pcchDriveLetter : UInt32*) : UInt32

    fun ResUtilTerminateServiceProcessFromResDll(dwServicePid : UInt32, bOffline : Win32cr::Foundation::BOOL, pdwResourceState : UInt32*, pfnLogEvent : Win32cr::Networking::Clustering::PLOG_EVENT_ROUTINE, hResourceHandle : LibC::IntPtrT) : UInt32

    fun ResUtilGetPropertyFormats(pPropertyTable : Win32cr::Networking::Clustering::RESUTIL_PROPERTY_ITEM*, pOutPropertyFormatList : Void*, cbPropertyFormatListSize : UInt32, pcbBytesReturned : UInt32*, pcbRequired : UInt32*) : UInt32

    fun ResUtilGetCoreClusterResources(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, phClusterNameResource : Win32cr::Networking::Clustering::HRESOURCE**, phClusterIPAddressResource : Win32cr::Networking::Clustering::HRESOURCE**, phClusterQuorumResource : Win32cr::Networking::Clustering::HRESOURCE**) : UInt32

    fun ResUtilGetResourceName(hResource : Win32cr::Networking::Clustering::HRESOURCE*, pszResourceName : UInt16*, pcchResourceNameInOut : UInt32*) : UInt32

    fun ResUtilGetClusterRoleState(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, eClusterRole : Win32cr::Networking::Clustering::CLUSTER_ROLE) : Win32cr::Networking::Clustering::CLUSTER_ROLE_STATE

    fun ClusterIsPathOnSharedVolume(lpszPathName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    fun ClusterGetVolumePathName(lpszFileName : Win32cr::Foundation::PWSTR, lpszVolumePathName : Win32cr::Foundation::PWSTR, cchBufferLength : UInt32) : Win32cr::Foundation::BOOL

    fun ClusterGetVolumeNameForVolumeMountPoint(lpszVolumeMountPoint : Win32cr::Foundation::PWSTR, lpszVolumeName : Win32cr::Foundation::PWSTR, cchBufferLength : UInt32) : Win32cr::Foundation::BOOL

    fun ClusterPrepareSharedVolumeForBackup(lpszFileName : Win32cr::Foundation::PWSTR, lpszVolumePathName : Win32cr::Foundation::PWSTR, lpcchVolumePathName : UInt32*, lpszVolumeName : Win32cr::Foundation::PWSTR, lpcchVolumeName : UInt32*) : UInt32

    fun ClusterClearBackupStateForSharedVolume(lpszVolumePathName : Win32cr::Foundation::PWSTR) : UInt32

    fun ResUtilSetResourceServiceStartParametersEx(pszServiceName : Win32cr::Foundation::PWSTR, schSCMHandle : Win32cr::Security::SC_HANDLE, phService : LibC::IntPtrT*, dwDesiredAccess : UInt32, pfnLogEvent : Win32cr::Networking::Clustering::PLOG_EVENT_ROUTINE, hResourceHandle : LibC::IntPtrT) : UInt32

    fun ResUtilEnumResourcesEx2(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, hSelf : Win32cr::Networking::Clustering::HRESOURCE*, lpszResTypeName : Win32cr::Foundation::PWSTR, pResCallBack : Win32cr::Networking::Clustering::LPRESOURCE_CALLBACK_EX, pParameter : Void*, dwDesiredAccess : UInt32) : UInt32

    fun ResUtilGetResourceDependencyEx(hSelf : Win32cr::Foundation::HANDLE, lpszResourceType : Win32cr::Foundation::PWSTR, dwDesiredAccess : UInt32) : Win32cr::Networking::Clustering::HRESOURCE*

    fun ResUtilGetResourceDependencyByNameEx(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, hSelf : Win32cr::Foundation::HANDLE, lpszResourceType : Win32cr::Foundation::PWSTR, bRecurse : Win32cr::Foundation::BOOL, dwDesiredAccess : UInt32) : Win32cr::Networking::Clustering::HRESOURCE*

    fun ResUtilGetResourceDependencyByClassEx(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, hSelf : Win32cr::Foundation::HANDLE, prci : Win32cr::Networking::Clustering::CLUS_RESOURCE_CLASS_INFO*, bRecurse : Win32cr::Foundation::BOOL, dwDesiredAccess : UInt32) : Win32cr::Networking::Clustering::HRESOURCE*

    fun ResUtilGetResourceNameDependencyEx(lpszResourceName : Win32cr::Foundation::PWSTR, lpszResourceType : Win32cr::Foundation::PWSTR, dwDesiredAccess : UInt32) : Win32cr::Networking::Clustering::HRESOURCE*

    fun ResUtilGetCoreClusterResourcesEx(hClusterIn : Win32cr::Networking::Clustering::HCLUSTER*, phClusterNameResourceOut : Win32cr::Networking::Clustering::HRESOURCE**, phClusterQuorumResourceOut : Win32cr::Networking::Clustering::HRESOURCE**, dwDesiredAccess : UInt32) : UInt32

    fun OpenClusterCryptProvider(lpszResource : Win32cr::Foundation::PWSTR, lpszProvider : Int8*, dwType : UInt32, dwFlags : UInt32) : Win32cr::Networking::Clustering::HCLUSCRYPTPROVIDER*

    fun OpenClusterCryptProviderEx(lpszResource : Win32cr::Foundation::PWSTR, lpszKeyname : Win32cr::Foundation::PWSTR, lpszProvider : Int8*, dwType : UInt32, dwFlags : UInt32) : Win32cr::Networking::Clustering::HCLUSCRYPTPROVIDER*

    fun CloseClusterCryptProvider(hClusCryptProvider : Win32cr::Networking::Clustering::HCLUSCRYPTPROVIDER*) : UInt32

    fun ClusterEncrypt(hClusCryptProvider : Win32cr::Networking::Clustering::HCLUSCRYPTPROVIDER*, pData : UInt8*, cbData : UInt32, ppData : UInt8**, pcbData : UInt32*) : UInt32

    fun ClusterDecrypt(hClusCryptProvider : Win32cr::Networking::Clustering::HCLUSCRYPTPROVIDER*, pCryptInput : UInt8*, cbCryptInput : UInt32, ppCryptOutput : UInt8**, pcbCryptOutput : UInt32*) : UInt32

    fun FreeClusterCrypt(pCryptInfo : Void*) : UInt32

    fun ResUtilVerifyShutdownSafe(flags : UInt32, reason : UInt32, pResult : UInt32*) : UInt32

    fun ResUtilPaxosComparer(left : Win32cr::Networking::Clustering::PaxosTagCStruct*, right : Win32cr::Networking::Clustering::PaxosTagCStruct*) : Win32cr::Foundation::BOOL

    fun ResUtilLeftPaxosIsLessThanRight(left : Win32cr::Networking::Clustering::PaxosTagCStruct*, right : Win32cr::Networking::Clustering::PaxosTagCStruct*) : Win32cr::Foundation::BOOL

    fun ResUtilsDeleteKeyTree(key : Win32cr::System::Registry::HKEY, keyName : Win32cr::Foundation::PWSTR, treatNoKeyAsError : Win32cr::Foundation::BOOL) : UInt32

    fun ResUtilGroupsEqual(hSelf : Win32cr::Networking::Clustering::HGROUP*, hGroup : Win32cr::Networking::Clustering::HGROUP*, pEqual : Win32cr::Foundation::BOOL*) : UInt32

    fun ResUtilEnumGroups(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, hSelf : Win32cr::Networking::Clustering::HGROUP*, pResCallBack : Win32cr::Networking::Clustering::LPGROUP_CALLBACK_EX, pParameter : Void*) : UInt32

    fun ResUtilEnumGroupsEx(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, hSelf : Win32cr::Networking::Clustering::HGROUP*, groupType : Win32cr::Networking::Clustering::CLUSGROUP_TYPE, pResCallBack : Win32cr::Networking::Clustering::LPGROUP_CALLBACK_EX, pParameter : Void*) : UInt32

    fun ResUtilDupGroup(group : Win32cr::Networking::Clustering::HGROUP*, copy : Win32cr::Networking::Clustering::HGROUP**) : UInt32

    fun ResUtilGetClusterGroupType(hGroup : Win32cr::Networking::Clustering::HGROUP*, groupType : Win32cr::Networking::Clustering::CLUSGROUP_TYPE*) : UInt32

    fun ResUtilGetCoreGroup(hCluster : Win32cr::Networking::Clustering::HCLUSTER*) : Win32cr::Networking::Clustering::HGROUP*

    fun ResUtilResourceDepEnum(hSelf : Win32cr::Networking::Clustering::HRESOURCE*, enumType : UInt32, pResCallBack : Win32cr::Networking::Clustering::LPRESOURCE_CALLBACK_EX, pParameter : Void*) : UInt32

    fun ResUtilDupResource(group : Win32cr::Networking::Clustering::HRESOURCE*, copy : Win32cr::Networking::Clustering::HRESOURCE**) : UInt32

    fun ResUtilGetClusterId(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, guid : LibC::GUID*) : UInt32

    fun ResUtilNodeEnum(hCluster : Win32cr::Networking::Clustering::HCLUSTER*, pNodeCallBack : Win32cr::Networking::Clustering::LPNODE_CALLBACK, pParameter : Void*) : UInt32

    fun RegisterAppInstance(process_handle : Win32cr::Foundation::HANDLE, app_instance_id : LibC::GUID*, children_inherit_app_instance : Win32cr::Foundation::BOOL) : UInt32

    fun RegisterAppInstanceVersion(app_instance_id : LibC::GUID*, instance_version_high : UInt64, instance_version_low : UInt64) : UInt32

    fun QueryAppInstanceVersion(app_instance_id : LibC::GUID*, instance_version_high : UInt64*, instance_version_low : UInt64*, version_status : Win32cr::Foundation::NTSTATUS*) : UInt32

    fun ResetAllAppInstanceVersions : UInt32

    fun SetAppInstanceCsvFlags(process_handle : Win32cr::Foundation::HANDLE, mask : UInt32, flags : UInt32) : UInt32

  end
end