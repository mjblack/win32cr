require "../foundation.cr"
require "../system/com.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:xolehlp.dll")]
{% else %}
@[Link("xolehlp")]
{% end %}
lib LibWin32
  DTCINSTALL_E_CLIENT_ALREADY_INSTALLED = 384_i32
  DTCINSTALL_E_SERVER_ALREADY_INSTALLED = 385_i32
  XA_SWITCH_F_DTC = 1_u32
  XA_FMTID_DTC = 4478019_u32
  XA_FMTID_DTC_VER1 = 21255235_u32
  XIDDATASIZE = 128_u32
  MAXGTRIDSIZE = 64_u32
  MAXBQUALSIZE = 64_u32
  RMNAMESZ = 32_u32
  MAXINFOSIZE = 256_u32
  TMNOFLAGS = 0_i32
  TMREGISTER = 1_i32
  TMNOMIGRATE = 2_i32
  TMUSEASYNC = 4_i32
  TMASYNC = -2147483648_i32
  TMONEPHASE = 1073741824_i32
  TMFAIL = 536870912_i32
  TMNOWAIT = 268435456_i32
  TMRESUME = 134217728_i32
  TMSUCCESS = 67108864_i32
  TMSUSPEND = 33554432_i32
  TMSTARTRSCAN = 16777216_i32
  TMENDRSCAN = 8388608_i32
  TMMULTIPLE = 4194304_i32
  TMJOIN = 2097152_i32
  TMMIGRATE = 1048576_i32
  TM_JOIN = 2_u32
  TM_RESUME = 1_u32
  TM_OK = 0_u32
  TMER_TMERR = -1_i32
  TMER_INVAL = -2_i32
  TMER_PROTO = -3_i32
  XA_RBBASE = 100_u32
  XA_RBROLLBACK = 100_u32
  XA_RBCOMMFAIL = 101_u32
  XA_RBDEADLOCK = 102_u32
  XA_RBINTEGRITY = 103_u32
  XA_RBOTHER = 104_u32
  XA_RBPROTO = 105_u32
  XA_RBTIMEOUT = 106_u32
  XA_RBTRANSIENT = 107_u32
  XA_RBEND = 107_u32
  XA_NOMIGRATE = 9_u32
  XA_HEURHAZ = 8_u32
  XA_HEURCOM = 7_u32
  XA_HEURRB = 6_u32
  XA_HEURMIX = 5_u32
  XA_RETRY = 4_u32
  XA_RDONLY = 3_u32
  XA_OK = 0_u32
  XAER_ASYNC = -2_i32
  XAER_RMERR = -3_i32
  XAER_NOTA = -4_i32
  XAER_INVAL = -5_i32
  XAER_PROTO = -6_i32
  XAER_RMFAIL = -7_i32
  XAER_DUPID = -8_i32
  XAER_OUTSIDE = -9_i32
  DTC_INSTALL_OVERWRITE_CLIENT = 1_u32
  DTC_INSTALL_OVERWRITE_SERVER = 2_u32
  OLE_TM_CONFIG_VERSION_1 = 1_u32
  OLE_TM_CONFIG_VERSION_2 = 2_u32
  OLE_TM_FLAG_NONE = 0_u32
  OLE_TM_FLAG_NODEMANDSTART = 1_u32
  OLE_TM_FLAG_NOAGILERECOVERY = 2_u32
  OLE_TM_FLAG_QUERY_SERVICE_LOCKSTATUS = 2147483648_u32
  OLE_TM_FLAG_INTERNAL_TO_TM = 1073741824_u32
  CLSID_MSDtcTransactionManager = "5b18ab61-091d-11d1-97df-00c04fb9618a"
  CLSID_MSDtcTransaction = "39f8d76b-0928-11d1-97df-00c04fb9618a"

  alias DTC_GET_TRANSACTION_MANAGER = Proc(PSTR, PSTR, Guid*, UInt32, UInt16, Void*, Void**, HRESULT)
  alias DTC_GET_TRANSACTION_MANAGER_EX_A = Proc(PSTR, PSTR, Guid*, UInt32, Void*, Void**, HRESULT)
  alias DTC_GET_TRANSACTION_MANAGER_EX_W = Proc(LibC::LPWSTR, LibC::LPWSTR, Guid*, UInt32, Void*, Void**, HRESULT)
  alias DTC_INSTALL_CLIENT = Proc(Int8*, UInt32, UInt32, HRESULT)
  alias XA_OPEN_EPT = Proc(PSTR, Int32, Int32, Int32)
  alias XA_CLOSE_EPT = Proc(PSTR, Int32, Int32, Int32)
  alias XA_START_EPT = Proc(Xid_t*, Int32, Int32, Int32)
  alias XA_END_EPT = Proc(Xid_t*, Int32, Int32, Int32)
  alias XA_ROLLBACK_EPT = Proc(Xid_t*, Int32, Int32, Int32)
  alias XA_PREPARE_EPT = Proc(Xid_t*, Int32, Int32, Int32)
  alias XA_COMMIT_EPT = Proc(Xid_t*, Int32, Int32, Int32)
  alias XA_RECOVER_EPT = Proc(Xid_t*, Int32, Int32, Int32, Int32)
  alias XA_FORGET_EPT = Proc(Xid_t*, Int32, Int32, Int32)
  alias XA_COMPLETE_EPT = Proc(Int32*, Int32*, Int32, Int32, Int32)


  enum DTC_STATUS_ : Int32
    DTC_STATUS_UNKNOWN = 0
    DTC_STATUS_STARTING = 1
    DTC_STATUS_STARTED = 2
    DTC_STATUS_PAUSING = 3
    DTC_STATUS_PAUSED = 4
    DTC_STATUS_CONTINUING = 5
    DTC_STATUS_STOPPING = 6
    DTC_STATUS_STOPPED = 7
    DTC_STATUS_E_CANTCONTROL = 8
    DTC_STATUS_FAILED = 9
  end

  enum TX_MISC_CONSTANTS : Int32
    MAX_TRAN_DESC = 40
  end

  enum ISOLATIONLEVEL : Int32
    ISOLATIONLEVEL_UNSPECIFIED = -1
    ISOLATIONLEVEL_CHAOS = 16
    ISOLATIONLEVEL_READUNCOMMITTED = 256
    ISOLATIONLEVEL_BROWSE = 256
    ISOLATIONLEVEL_CURSORSTABILITY = 4096
    ISOLATIONLEVEL_READCOMMITTED = 4096
    ISOLATIONLEVEL_REPEATABLEREAD = 65536
    ISOLATIONLEVEL_SERIALIZABLE = 1048576
    ISOLATIONLEVEL_ISOLATED = 1048576
  end

  enum ISOFLAG : Int32
    ISOFLAG_RETAIN_COMMIT_DC = 1
    ISOFLAG_RETAIN_COMMIT = 2
    ISOFLAG_RETAIN_COMMIT_NO = 3
    ISOFLAG_RETAIN_ABORT_DC = 4
    ISOFLAG_RETAIN_ABORT = 8
    ISOFLAG_RETAIN_ABORT_NO = 12
    ISOFLAG_RETAIN_DONTCARE = 5
    ISOFLAG_RETAIN_BOTH = 10
    ISOFLAG_RETAIN_NONE = 15
    ISOFLAG_OPTIMISTIC = 16
    ISOFLAG_READONLY = 32
  end

  enum XACTTC : Int32
    XACTTC_NONE = 0
    XACTTC_SYNC_PHASEONE = 1
    XACTTC_SYNC_PHASETWO = 2
    XACTTC_SYNC = 2
    XACTTC_ASYNC_PHASEONE = 4
    XACTTC_ASYNC = 4
  end

  enum XACTRM : Int32
    XACTRM_OPTIMISTICLASTWINS = 1
    XACTRM_NOREADONLYPREPARES = 2
  end

  enum XACTCONST : Int32
    XACTCONST_TIMEOUTINFINITE = 0
  end

  enum XACTHEURISTIC : Int32
    XACTHEURISTIC_ABORT = 1
    XACTHEURISTIC_COMMIT = 2
    XACTHEURISTIC_DAMAGE = 3
    XACTHEURISTIC_DANGER = 4
  end

  enum XACTSTAT : Int32
    XACTSTAT_NONE = 0
    XACTSTAT_OPENNORMAL = 1
    XACTSTAT_OPENREFUSED = 2
    XACTSTAT_PREPARING = 4
    XACTSTAT_PREPARED = 8
    XACTSTAT_PREPARERETAINING = 16
    XACTSTAT_PREPARERETAINED = 32
    XACTSTAT_COMMITTING = 64
    XACTSTAT_COMMITRETAINING = 128
    XACTSTAT_ABORTING = 256
    XACTSTAT_ABORTED = 512
    XACTSTAT_COMMITTED = 1024
    XACTSTAT_HEURISTIC_ABORT = 2048
    XACTSTAT_HEURISTIC_COMMIT = 4096
    XACTSTAT_HEURISTIC_DAMAGE = 8192
    XACTSTAT_HEURISTIC_DANGER = 16384
    XACTSTAT_FORCED_ABORT = 32768
    XACTSTAT_FORCED_COMMIT = 65536
    XACTSTAT_INDOUBT = 131072
    XACTSTAT_CLOSED = 262144
    XACTSTAT_OPEN = 3
    XACTSTAT_NOTPREPARED = 524227
    XACTSTAT_ALL = 524287
  end

  enum AUTHENTICATION_LEVEL : Int32
    NO_AUTHENTICATION_REQUIRED = 0
    INCOMING_AUTHENTICATION_REQUIRED = 1
    MUTUAL_AUTHENTICATION_REQUIRED = 2
  end

  enum APPLICATIONTYPE : Int32
    LOCAL_APPLICATIONTYPE = 0
    CLUSTERRESOURCE_APPLICATIONTYPE = 1
  end

  enum XACT_DTC_CONSTANTS : Int32
    XACT_E_CONNECTION_REQUEST_DENIED = -2147168000
    XACT_E_TOOMANY_ENLISTMENTS = -2147167999
    XACT_E_DUPLICATE_GUID = -2147167998
    XACT_E_NOTSINGLEPHASE = -2147167997
    XACT_E_RECOVERYALREADYDONE = -2147167996
    XACT_E_PROTOCOL = -2147167995
    XACT_E_RM_FAILURE = -2147167994
    XACT_E_RECOVERY_FAILED = -2147167993
    XACT_E_LU_NOT_FOUND = -2147167992
    XACT_E_DUPLICATE_LU = -2147167991
    XACT_E_LU_NOT_CONNECTED = -2147167990
    XACT_E_DUPLICATE_TRANSID = -2147167989
    XACT_E_LU_BUSY = -2147167988
    XACT_E_LU_NO_RECOVERY_PROCESS = -2147167987
    XACT_E_LU_DOWN = -2147167986
    XACT_E_LU_RECOVERING = -2147167985
    XACT_E_LU_RECOVERY_MISMATCH = -2147167984
    XACT_E_RM_UNAVAILABLE = -2147167983
    XACT_E_LRMRECOVERYALREADYDONE = -2147167982
    XACT_E_NOLASTRESOURCEINTERFACE = -2147167981
    XACT_S_NONOTIFY = 315648
    XACT_OK_NONOTIFY = 315649
    Dwuser_ms_sqlserver = 65535
  end

  enum DtcLu_LocalRecovery_Work : Int32
    DTCINITIATEDRECOVERYWORK_CHECKLUSTATUS = 1
    DTCINITIATEDRECOVERYWORK_TRANS = 2
    DTCINITIATEDRECOVERYWORK_TMDOWN = 3
  end

  enum DtcLu_Xln : Int32
    DTCLUXLN_COLD = 1
    DTCLUXLN_WARM = 2
  end

  enum DtcLu_Xln_Confirmation : Int32
    DTCLUXLNCONFIRMATION_CONFIRM = 1
    DTCLUXLNCONFIRMATION_LOGNAMEMISMATCH = 2
    DTCLUXLNCONFIRMATION_COLDWARMMISMATCH = 3
    DTCLUXLNCONFIRMATION_OBSOLETE = 4
  end

  enum DtcLu_Xln_Response : Int32
    DTCLUXLNRESPONSE_OK_SENDOURXLNBACK = 1
    DTCLUXLNRESPONSE_OK_SENDCONFIRMATION = 2
    DTCLUXLNRESPONSE_LOGNAMEMISMATCH = 3
    DTCLUXLNRESPONSE_COLDWARMMISMATCH = 4
  end

  enum DtcLu_Xln_Error : Int32
    DTCLUXLNERROR_PROTOCOL = 1
    DTCLUXLNERROR_LOGNAMEMISMATCH = 2
    DTCLUXLNERROR_COLDWARMMISMATCH = 3
  end

  enum DtcLu_CompareState : Int32
    DTCLUCOMPARESTATE_COMMITTED = 1
    DTCLUCOMPARESTATE_HEURISTICCOMMITTED = 2
    DTCLUCOMPARESTATE_HEURISTICMIXED = 3
    DTCLUCOMPARESTATE_HEURISTICRESET = 4
    DTCLUCOMPARESTATE_INDOUBT = 5
    DTCLUCOMPARESTATE_RESET = 6
  end

  enum DtcLu_CompareStates_Confirmation : Int32
    DTCLUCOMPARESTATESCONFIRMATION_CONFIRM = 1
    DTCLUCOMPARESTATESCONFIRMATION_PROTOCOL = 2
  end

  enum DtcLu_CompareStates_Error : Int32
    DTCLUCOMPARESTATESERROR_PROTOCOL = 1
  end

  enum DtcLu_CompareStates_Response : Int32
    DTCLUCOMPARESTATESRESPONSE_OK = 1
    DTCLUCOMPARESTATESRESPONSE_PROTOCOL = 2
  end

  struct BOID
    rgb : UInt8[16]*
  end
  struct XACTTRANSINFO
    uow : BOID
    iso_level : Int32
    iso_flags : UInt32
    grf_tc_supported : UInt32
    grf_rm_supported : UInt32
    grf_tc_supported_retaining : UInt32
    grf_rm_supported_retaining : UInt32
  end
  struct XACTSTATS
    c_open : UInt32
    c_committing : UInt32
    c_committed : UInt32
    c_aborting : UInt32
    c_aborted : UInt32
    c_in_doubt : UInt32
    c_heuristic_decision : UInt32
    time_transactions_up : FILETIME
  end
  struct XACTOPT
    ul_timeout : UInt32
    sz_description : UInt8[40]*
  end
  struct Xid_t
    format_id : Int32
    gtrid_length : Int32
    bqual_length : Int32
    data : CHAR[128]*
  end
  struct Xa_switch_t
    name : CHAR[32]*
    flags : Int32
    version : Int32
    xa_open_entry : LibC::IntPtrT
    xa_close_entry : LibC::IntPtrT
    xa_start_entry : LibC::IntPtrT
    xa_end_entry : LibC::IntPtrT
    xa_rollback_entry : LibC::IntPtrT
    xa_prepare_entry : LibC::IntPtrT
    xa_commit_entry : LibC::IntPtrT
    xa_recover_entry : LibC::IntPtrT
    xa_forget_entry : LibC::IntPtrT
    xa_complete_entry : LibC::IntPtrT
  end
  struct OLE_TM_CONFIG_PARAMS_V1
    dw_version : UInt32
    dwc_concurrency_hint : UInt32
  end
  struct OLE_TM_CONFIG_PARAMS_V2
    dw_version : UInt32
    dwc_concurrency_hint : UInt32
    application_type : APPLICATIONTYPE
    cluster_resource_id : Guid
  end
  struct ProxyConfigParams
    wc_threads_max : UInt16
  end


  struct ITransactionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    commit : UInt64
    abort : UInt64
    get_transaction_info : UInt64
  end

  ITransaction_GUID = "0fb15084-af41-11ce-bd2b-204c4f4f5020"
  IID_ITransaction = LibC::GUID.new(0xfb15084_u32, 0xaf41_u16, 0x11ce_u16, StaticArray[0xbd_u8, 0x2b_u8, 0x20_u8, 0x4c_u8, 0x4f_u8, 0x4f_u8, 0x50_u8, 0x20_u8])
  struct ITransaction
    lpVtbl : ITransactionVTbl*
  end

  struct ITransactionClonerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    commit : UInt64
    abort : UInt64
    get_transaction_info : UInt64
    clone_with_commit_disabled : UInt64
  end

  ITransactionCloner_GUID = "02656950-2152-11d0-944c-00a0c905416e"
  IID_ITransactionCloner = LibC::GUID.new(0x2656950_u32, 0x2152_u16, 0x11d0_u16, StaticArray[0x94_u8, 0x4c_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
  struct ITransactionCloner
    lpVtbl : ITransactionClonerVTbl*
  end

  struct ITransaction2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    commit : UInt64
    abort : UInt64
    get_transaction_info : UInt64
    clone_with_commit_disabled : UInt64
    get_transaction_info2 : UInt64
  end

  ITransaction2_GUID = "34021548-0065-11d3-bac1-00c04f797be2"
  IID_ITransaction2 = LibC::GUID.new(0x34021548_u32, 0x65_u16, 0x11d3_u16, StaticArray[0xba_u8, 0xc1_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0x7b_u8, 0xe2_u8])
  struct ITransaction2
    lpVtbl : ITransaction2VTbl*
  end

  struct ITransactionDispenserVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_options_object : UInt64
    begin_transaction : UInt64
  end

  ITransactionDispenser_GUID = "3a6ad9e1-23b9-11cf-ad60-00aa00a74ccd"
  IID_ITransactionDispenser = LibC::GUID.new(0x3a6ad9e1_u32, 0x23b9_u16, 0x11cf_u16, StaticArray[0xad_u8, 0x60_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa7_u8, 0x4c_u8, 0xcd_u8])
  struct ITransactionDispenser
    lpVtbl : ITransactionDispenserVTbl*
  end

  struct ITransactionOptionsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_options : UInt64
    get_options : UInt64
  end

  ITransactionOptions_GUID = "3a6ad9e0-23b9-11cf-ad60-00aa00a74ccd"
  IID_ITransactionOptions = LibC::GUID.new(0x3a6ad9e0_u32, 0x23b9_u16, 0x11cf_u16, StaticArray[0xad_u8, 0x60_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa7_u8, 0x4c_u8, 0xcd_u8])
  struct ITransactionOptions
    lpVtbl : ITransactionOptionsVTbl*
  end

  struct ITransactionOutcomeEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    committed : UInt64
    aborted : UInt64
    heuristic_decision : UInt64
    indoubt : UInt64
  end

  ITransactionOutcomeEvents_GUID = "3a6ad9e2-23b9-11cf-ad60-00aa00a74ccd"
  IID_ITransactionOutcomeEvents = LibC::GUID.new(0x3a6ad9e2_u32, 0x23b9_u16, 0x11cf_u16, StaticArray[0xad_u8, 0x60_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa7_u8, 0x4c_u8, 0xcd_u8])
  struct ITransactionOutcomeEvents
    lpVtbl : ITransactionOutcomeEventsVTbl*
  end

  struct ITmNodeNameVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_node_name_size : UInt64
    get_node_name : UInt64
  end

  ITmNodeName_GUID = "30274f88-6ee4-474e-9b95-7807bc9ef8cf"
  IID_ITmNodeName = LibC::GUID.new(0x30274f88_u32, 0x6ee4_u16, 0x474e_u16, StaticArray[0x9b_u8, 0x95_u8, 0x78_u8, 0x7_u8, 0xbc_u8, 0x9e_u8, 0xf8_u8, 0xcf_u8])
  struct ITmNodeName
    lpVtbl : ITmNodeNameVTbl*
  end

  struct IKernelTransactionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_handle : UInt64
  end

  IKernelTransaction_GUID = "79427a2b-f895-40e0-be79-b57dc82ed231"
  IID_IKernelTransaction = LibC::GUID.new(0x79427a2b_u32, 0xf895_u16, 0x40e0_u16, StaticArray[0xbe_u8, 0x79_u8, 0xb5_u8, 0x7d_u8, 0xc8_u8, 0x2e_u8, 0xd2_u8, 0x31_u8])
  struct IKernelTransaction
    lpVtbl : IKernelTransactionVTbl*
  end

  struct ITransactionResourceAsyncVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    prepare_request : UInt64
    commit_request : UInt64
    abort_request : UInt64
    tm_down : UInt64
  end

  ITransactionResourceAsync_GUID = "69e971f0-23ce-11cf-ad60-00aa00a74ccd"
  IID_ITransactionResourceAsync = LibC::GUID.new(0x69e971f0_u32, 0x23ce_u16, 0x11cf_u16, StaticArray[0xad_u8, 0x60_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa7_u8, 0x4c_u8, 0xcd_u8])
  struct ITransactionResourceAsync
    lpVtbl : ITransactionResourceAsyncVTbl*
  end

  struct ITransactionLastResourceAsyncVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    delegate_commit : UInt64
    forget_request : UInt64
  end

  ITransactionLastResourceAsync_GUID = "c82bd532-5b30-11d3-8a91-00c04f79eb6d"
  IID_ITransactionLastResourceAsync = LibC::GUID.new(0xc82bd532_u32, 0x5b30_u16, 0x11d3_u16, StaticArray[0x8a_u8, 0x91_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xeb_u8, 0x6d_u8])
  struct ITransactionLastResourceAsync
    lpVtbl : ITransactionLastResourceAsyncVTbl*
  end

  struct ITransactionResourceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    prepare_request : UInt64
    commit_request : UInt64
    abort_request : UInt64
    tm_down : UInt64
  end

  ITransactionResource_GUID = "ee5ff7b3-4572-11d0-9452-00a0c905416e"
  IID_ITransactionResource = LibC::GUID.new(0xee5ff7b3_u32, 0x4572_u16, 0x11d0_u16, StaticArray[0x94_u8, 0x52_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
  struct ITransactionResource
    lpVtbl : ITransactionResourceVTbl*
  end

  struct ITransactionEnlistmentAsyncVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    prepare_request_done : UInt64
    commit_request_done : UInt64
    abort_request_done : UInt64
  end

  ITransactionEnlistmentAsync_GUID = "0fb15081-af41-11ce-bd2b-204c4f4f5020"
  IID_ITransactionEnlistmentAsync = LibC::GUID.new(0xfb15081_u32, 0xaf41_u16, 0x11ce_u16, StaticArray[0xbd_u8, 0x2b_u8, 0x20_u8, 0x4c_u8, 0x4f_u8, 0x4f_u8, 0x50_u8, 0x20_u8])
  struct ITransactionEnlistmentAsync
    lpVtbl : ITransactionEnlistmentAsyncVTbl*
  end

  struct ITransactionLastEnlistmentAsyncVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    transaction_outcome : UInt64
  end

  ITransactionLastEnlistmentAsync_GUID = "c82bd533-5b30-11d3-8a91-00c04f79eb6d"
  IID_ITransactionLastEnlistmentAsync = LibC::GUID.new(0xc82bd533_u32, 0x5b30_u16, 0x11d3_u16, StaticArray[0x8a_u8, 0x91_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xeb_u8, 0x6d_u8])
  struct ITransactionLastEnlistmentAsync
    lpVtbl : ITransactionLastEnlistmentAsyncVTbl*
  end

  struct ITransactionExportFactoryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_remote_class_id : UInt64
    create : UInt64
  end

  ITransactionExportFactory_GUID = "e1cf9b53-8745-11ce-a9ba-00aa006c3706"
  IID_ITransactionExportFactory = LibC::GUID.new(0xe1cf9b53_u32, 0x8745_u16, 0x11ce_u16, StaticArray[0xa9_u8, 0xba_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x6c_u8, 0x37_u8, 0x6_u8])
  struct ITransactionExportFactory
    lpVtbl : ITransactionExportFactoryVTbl*
  end

  struct ITransactionImportWhereaboutsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_whereabouts_size : UInt64
    get_whereabouts : UInt64
  end

  ITransactionImportWhereabouts_GUID = "0141fda4-8fc0-11ce-bd18-204c4f4f5020"
  IID_ITransactionImportWhereabouts = LibC::GUID.new(0x141fda4_u32, 0x8fc0_u16, 0x11ce_u16, StaticArray[0xbd_u8, 0x18_u8, 0x20_u8, 0x4c_u8, 0x4f_u8, 0x4f_u8, 0x50_u8, 0x20_u8])
  struct ITransactionImportWhereabouts
    lpVtbl : ITransactionImportWhereaboutsVTbl*
  end

  struct ITransactionExportVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    export : UInt64
    get_transaction_cookie : UInt64
  end

  ITransactionExport_GUID = "0141fda5-8fc0-11ce-bd18-204c4f4f5020"
  IID_ITransactionExport = LibC::GUID.new(0x141fda5_u32, 0x8fc0_u16, 0x11ce_u16, StaticArray[0xbd_u8, 0x18_u8, 0x20_u8, 0x4c_u8, 0x4f_u8, 0x4f_u8, 0x50_u8, 0x20_u8])
  struct ITransactionExport
    lpVtbl : ITransactionExportVTbl*
  end

  struct ITransactionImportVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    import : UInt64
  end

  ITransactionImport_GUID = "e1cf9b5a-8745-11ce-a9ba-00aa006c3706"
  IID_ITransactionImport = LibC::GUID.new(0xe1cf9b5a_u32, 0x8745_u16, 0x11ce_u16, StaticArray[0xa9_u8, 0xba_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x6c_u8, 0x37_u8, 0x6_u8])
  struct ITransactionImport
    lpVtbl : ITransactionImportVTbl*
  end

  struct ITipTransactionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    push : UInt64
    get_transaction_url : UInt64
  end

  ITipTransaction_GUID = "17cf72d0-bac5-11d1-b1bf-00c04fc2f3ef"
  IID_ITipTransaction = LibC::GUID.new(0x17cf72d0_u32, 0xbac5_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xbf_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0xf3_u8, 0xef_u8])
  struct ITipTransaction
    lpVtbl : ITipTransactionVTbl*
  end

  struct ITipHelperVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    pull : UInt64
    pull_async : UInt64
    get_local_tm_url : UInt64
  end

  ITipHelper_GUID = "17cf72d1-bac5-11d1-b1bf-00c04fc2f3ef"
  IID_ITipHelper = LibC::GUID.new(0x17cf72d1_u32, 0xbac5_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xbf_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0xf3_u8, 0xef_u8])
  struct ITipHelper
    lpVtbl : ITipHelperVTbl*
  end

  struct ITipPullSinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    pull_complete : UInt64
  end

  ITipPullSink_GUID = "17cf72d2-bac5-11d1-b1bf-00c04fc2f3ef"
  IID_ITipPullSink = LibC::GUID.new(0x17cf72d2_u32, 0xbac5_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xbf_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0xf3_u8, 0xef_u8])
  struct ITipPullSink
    lpVtbl : ITipPullSinkVTbl*
  end

  struct IDtcNetworkAccessConfigVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_any_network_access : UInt64
    set_any_network_access : UInt64
    get_network_administration_access : UInt64
    set_network_administration_access : UInt64
    get_network_transaction_access : UInt64
    set_network_transaction_access : UInt64
    get_network_client_access : UInt64
    set_network_client_access : UInt64
    get_network_tip_access : UInt64
    set_network_tip_access : UInt64
    get_xa_access : UInt64
    set_xa_access : UInt64
    restart_dtc_service : UInt64
  end

  IDtcNetworkAccessConfig_GUID = "9797c15d-a428-4291-87b6-0995031a678d"
  IID_IDtcNetworkAccessConfig = LibC::GUID.new(0x9797c15d_u32, 0xa428_u16, 0x4291_u16, StaticArray[0x87_u8, 0xb6_u8, 0x9_u8, 0x95_u8, 0x3_u8, 0x1a_u8, 0x67_u8, 0x8d_u8])
  struct IDtcNetworkAccessConfig
    lpVtbl : IDtcNetworkAccessConfigVTbl*
  end

  struct IDtcNetworkAccessConfig2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_any_network_access : UInt64
    set_any_network_access : UInt64
    get_network_administration_access : UInt64
    set_network_administration_access : UInt64
    get_network_transaction_access : UInt64
    set_network_transaction_access : UInt64
    get_network_client_access : UInt64
    set_network_client_access : UInt64
    get_network_tip_access : UInt64
    set_network_tip_access : UInt64
    get_xa_access : UInt64
    set_xa_access : UInt64
    restart_dtc_service : UInt64
    get_network_inbound_access : UInt64
    get_network_outbound_access : UInt64
    set_network_inbound_access : UInt64
    set_network_outbound_access : UInt64
    get_authentication_level : UInt64
    set_authentication_level : UInt64
  end

  IDtcNetworkAccessConfig2_GUID = "a7aa013b-eb7d-4f42-b41c-b2dec09ae034"
  IID_IDtcNetworkAccessConfig2 = LibC::GUID.new(0xa7aa013b_u32, 0xeb7d_u16, 0x4f42_u16, StaticArray[0xb4_u8, 0x1c_u8, 0xb2_u8, 0xde_u8, 0xc0_u8, 0x9a_u8, 0xe0_u8, 0x34_u8])
  struct IDtcNetworkAccessConfig2
    lpVtbl : IDtcNetworkAccessConfig2VTbl*
  end

  struct IDtcNetworkAccessConfig3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_any_network_access : UInt64
    set_any_network_access : UInt64
    get_network_administration_access : UInt64
    set_network_administration_access : UInt64
    get_network_transaction_access : UInt64
    set_network_transaction_access : UInt64
    get_network_client_access : UInt64
    set_network_client_access : UInt64
    get_network_tip_access : UInt64
    set_network_tip_access : UInt64
    get_xa_access : UInt64
    set_xa_access : UInt64
    restart_dtc_service : UInt64
    get_network_inbound_access : UInt64
    get_network_outbound_access : UInt64
    set_network_inbound_access : UInt64
    set_network_outbound_access : UInt64
    get_authentication_level : UInt64
    set_authentication_level : UInt64
    get_lu_access : UInt64
    set_lu_access : UInt64
  end

  IDtcNetworkAccessConfig3_GUID = "76e4b4f3-2ca5-466b-89d5-fd218ee75b49"
  IID_IDtcNetworkAccessConfig3 = LibC::GUID.new(0x76e4b4f3_u32, 0x2ca5_u16, 0x466b_u16, StaticArray[0x89_u8, 0xd5_u8, 0xfd_u8, 0x21_u8, 0x8e_u8, 0xe7_u8, 0x5b_u8, 0x49_u8])
  struct IDtcNetworkAccessConfig3
    lpVtbl : IDtcNetworkAccessConfig3VTbl*
  end

  struct IDtcToXaMapperVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    request_new_resource_manager : UInt64
    translate_trid_to_xid : UInt64
    enlist_resource_manager : UInt64
    release_resource_manager : UInt64
  end

  IDtcToXaMapper_GUID = "64ffabe0-7ce9-11d0-8ce6-00c04fdc877e"
  IID_IDtcToXaMapper = LibC::GUID.new(0x64ffabe0_u32, 0x7ce9_u16, 0x11d0_u16, StaticArray[0x8c_u8, 0xe6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xdc_u8, 0x87_u8, 0x7e_u8])
  struct IDtcToXaMapper
    lpVtbl : IDtcToXaMapperVTbl*
  end

  struct IDtcToXaHelperFactoryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create : UInt64
  end

  IDtcToXaHelperFactory_GUID = "a9861610-304a-11d1-9813-00a0c905416e"
  IID_IDtcToXaHelperFactory = LibC::GUID.new(0xa9861610_u32, 0x304a_u16, 0x11d1_u16, StaticArray[0x98_u8, 0x13_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
  struct IDtcToXaHelperFactory
    lpVtbl : IDtcToXaHelperFactoryVTbl*
  end

  struct IDtcToXaHelperVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    close : UInt64
    translate_trid_to_xid : UInt64
  end

  IDtcToXaHelper_GUID = "a9861611-304a-11d1-9813-00a0c905416e"
  IID_IDtcToXaHelper = LibC::GUID.new(0xa9861611_u32, 0x304a_u16, 0x11d1_u16, StaticArray[0x98_u8, 0x13_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
  struct IDtcToXaHelper
    lpVtbl : IDtcToXaHelperVTbl*
  end

  struct IDtcToXaHelperSinglePipeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    xarm_create : UInt64
    convert_trid_to_xid : UInt64
    enlist_with_rm : UInt64
    release_rm_cookie : UInt64
  end

  IDtcToXaHelperSinglePipe_GUID = "47ed4971-53b3-11d1-bbb9-00c04fd658f6"
  IID_IDtcToXaHelperSinglePipe = LibC::GUID.new(0x47ed4971_u32, 0x53b3_u16, 0x11d1_u16, StaticArray[0xbb_u8, 0xb9_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd6_u8, 0x58_u8, 0xf6_u8])
  struct IDtcToXaHelperSinglePipe
    lpVtbl : IDtcToXaHelperSinglePipeVTbl*
  end

  struct IXATransLookupVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    lookup : UInt64
  end

  IXATransLookup_GUID = "f3b1f131-eeda-11ce-aed4-00aa0051e2c4"
  IID_IXATransLookup = LibC::GUID.new(0xf3b1f131_u32, 0xeeda_u16, 0x11ce_u16, StaticArray[0xae_u8, 0xd4_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x51_u8, 0xe2_u8, 0xc4_u8])
  struct IXATransLookup
    lpVtbl : IXATransLookupVTbl*
  end

  struct IXATransLookup2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    lookup : UInt64
  end

  IXATransLookup2_GUID = "bf193c85-0d1a-4290-b88f-d2cb8873d1e7"
  IID_IXATransLookup2 = LibC::GUID.new(0xbf193c85_u32, 0xd1a_u16, 0x4290_u16, StaticArray[0xb8_u8, 0x8f_u8, 0xd2_u8, 0xcb_u8, 0x88_u8, 0x73_u8, 0xd1_u8, 0xe7_u8])
  struct IXATransLookup2
    lpVtbl : IXATransLookup2VTbl*
  end

  struct IResourceManagerSinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    tm_down : UInt64
  end

  IResourceManagerSink_GUID = "0d563181-defb-11ce-aed1-00aa0051e2c4"
  IID_IResourceManagerSink = LibC::GUID.new(0xd563181_u32, 0xdefb_u16, 0x11ce_u16, StaticArray[0xae_u8, 0xd1_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x51_u8, 0xe2_u8, 0xc4_u8])
  struct IResourceManagerSink
    lpVtbl : IResourceManagerSinkVTbl*
  end

  struct IResourceManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    enlist : UInt64
    reenlist : UInt64
    reenlistment_complete : UInt64
    get_distributed_transaction_manager : UInt64
  end

  IResourceManager_GUID = "13741d21-87eb-11ce-8081-0080c758527e"
  IID_IResourceManager = LibC::GUID.new(0x13741d21_u32, 0x87eb_u16, 0x11ce_u16, StaticArray[0x80_u8, 0x81_u8, 0x0_u8, 0x80_u8, 0xc7_u8, 0x58_u8, 0x52_u8, 0x7e_u8])
  struct IResourceManager
    lpVtbl : IResourceManagerVTbl*
  end

  struct ILastResourceManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    transaction_committed : UInt64
    recovery_done : UInt64
  end

  ILastResourceManager_GUID = "4d964ad4-5b33-11d3-8a91-00c04f79eb6d"
  IID_ILastResourceManager = LibC::GUID.new(0x4d964ad4_u32, 0x5b33_u16, 0x11d3_u16, StaticArray[0x8a_u8, 0x91_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xeb_u8, 0x6d_u8])
  struct ILastResourceManager
    lpVtbl : ILastResourceManagerVTbl*
  end

  struct IResourceManager2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    enlist : UInt64
    reenlist : UInt64
    reenlistment_complete : UInt64
    get_distributed_transaction_manager : UInt64
    enlist2 : UInt64
    reenlist2 : UInt64
  end

  IResourceManager2_GUID = "d136c69a-f749-11d1-8f47-00c04f8ee57d"
  IID_IResourceManager2 = LibC::GUID.new(0xd136c69a_u32, 0xf749_u16, 0x11d1_u16, StaticArray[0x8f_u8, 0x47_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe5_u8, 0x7d_u8])
  struct IResourceManager2
    lpVtbl : IResourceManager2VTbl*
  end

  struct IResourceManagerRejoinableVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    enlist : UInt64
    reenlist : UInt64
    reenlistment_complete : UInt64
    get_distributed_transaction_manager : UInt64
    enlist2 : UInt64
    reenlist2 : UInt64
    rejoin : UInt64
  end

  IResourceManagerRejoinable_GUID = "6f6de620-b5df-4f3e-9cfa-c8aebd05172b"
  IID_IResourceManagerRejoinable = LibC::GUID.new(0x6f6de620_u32, 0xb5df_u16, 0x4f3e_u16, StaticArray[0x9c_u8, 0xfa_u8, 0xc8_u8, 0xae_u8, 0xbd_u8, 0x5_u8, 0x17_u8, 0x2b_u8])
  struct IResourceManagerRejoinable
    lpVtbl : IResourceManagerRejoinableVTbl*
  end

  struct IXAConfigVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initialize : UInt64
    terminate : UInt64
  end

  IXAConfig_GUID = "c8a6e3a1-9a8c-11cf-a308-00a0c905416e"
  IID_IXAConfig = LibC::GUID.new(0xc8a6e3a1_u32, 0x9a8c_u16, 0x11cf_u16, StaticArray[0xa3_u8, 0x8_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
  struct IXAConfig
    lpVtbl : IXAConfigVTbl*
  end

  struct IRMHelperVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    rm_count : UInt64
    rm_info : UInt64
  end

  IRMHelper_GUID = "e793f6d1-f53d-11cf-a60d-00a0c905416e"
  IID_IRMHelper = LibC::GUID.new(0xe793f6d1_u32, 0xf53d_u16, 0x11cf_u16, StaticArray[0xa6_u8, 0xd_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
  struct IRMHelper
    lpVtbl : IRMHelperVTbl*
  end

  struct IXAObtainRMInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    obtain_rm_info : UInt64
  end

  IXAObtainRMInfo_GUID = "e793f6d2-f53d-11cf-a60d-00a0c905416e"
  IID_IXAObtainRMInfo = LibC::GUID.new(0xe793f6d2_u32, 0xf53d_u16, 0x11cf_u16, StaticArray[0xa6_u8, 0xd_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
  struct IXAObtainRMInfo
    lpVtbl : IXAObtainRMInfoVTbl*
  end

  struct IResourceManagerFactoryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create : UInt64
  end

  IResourceManagerFactory_GUID = "13741d20-87eb-11ce-8081-0080c758527e"
  IID_IResourceManagerFactory = LibC::GUID.new(0x13741d20_u32, 0x87eb_u16, 0x11ce_u16, StaticArray[0x80_u8, 0x81_u8, 0x0_u8, 0x80_u8, 0xc7_u8, 0x58_u8, 0x52_u8, 0x7e_u8])
  struct IResourceManagerFactory
    lpVtbl : IResourceManagerFactoryVTbl*
  end

  struct IResourceManagerFactory2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create : UInt64
    create_ex : UInt64
  end

  IResourceManagerFactory2_GUID = "6b369c21-fbd2-11d1-8f47-00c04f8ee57d"
  IID_IResourceManagerFactory2 = LibC::GUID.new(0x6b369c21_u32, 0xfbd2_u16, 0x11d1_u16, StaticArray[0x8f_u8, 0x47_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe5_u8, 0x7d_u8])
  struct IResourceManagerFactory2
    lpVtbl : IResourceManagerFactory2VTbl*
  end

  struct IPrepareInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_prepare_info_size : UInt64
    get_prepare_info : UInt64
  end

  IPrepareInfo_GUID = "80c7bfd0-87ee-11ce-8081-0080c758527e"
  IID_IPrepareInfo = LibC::GUID.new(0x80c7bfd0_u32, 0x87ee_u16, 0x11ce_u16, StaticArray[0x80_u8, 0x81_u8, 0x0_u8, 0x80_u8, 0xc7_u8, 0x58_u8, 0x52_u8, 0x7e_u8])
  struct IPrepareInfo
    lpVtbl : IPrepareInfoVTbl*
  end

  struct IPrepareInfo2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_prepare_info_size : UInt64
    get_prepare_info : UInt64
  end

  IPrepareInfo2_GUID = "5fab2547-9779-11d1-b886-00c04fb9618a"
  IID_IPrepareInfo2 = LibC::GUID.new(0x5fab2547_u32, 0x9779_u16, 0x11d1_u16, StaticArray[0xb8_u8, 0x86_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x61_u8, 0x8a_u8])
  struct IPrepareInfo2
    lpVtbl : IPrepareInfo2VTbl*
  end

  struct IGetDispenserVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_dispenser : UInt64
  end

  IGetDispenser_GUID = "c23cc370-87ef-11ce-8081-0080c758527e"
  IID_IGetDispenser = LibC::GUID.new(0xc23cc370_u32, 0x87ef_u16, 0x11ce_u16, StaticArray[0x80_u8, 0x81_u8, 0x0_u8, 0x80_u8, 0xc7_u8, 0x58_u8, 0x52_u8, 0x7e_u8])
  struct IGetDispenser
    lpVtbl : IGetDispenserVTbl*
  end

  struct ITransactionVoterBallotAsync2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    vote_request_done : UInt64
  end

  ITransactionVoterBallotAsync2_GUID = "5433376c-414d-11d3-b206-00c04fc2f3ef"
  IID_ITransactionVoterBallotAsync2 = LibC::GUID.new(0x5433376c_u32, 0x414d_u16, 0x11d3_u16, StaticArray[0xb2_u8, 0x6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0xf3_u8, 0xef_u8])
  struct ITransactionVoterBallotAsync2
    lpVtbl : ITransactionVoterBallotAsync2VTbl*
  end

  struct ITransactionVoterNotifyAsync2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    committed : UInt64
    aborted : UInt64
    heuristic_decision : UInt64
    indoubt : UInt64
    vote_request : UInt64
  end

  ITransactionVoterNotifyAsync2_GUID = "5433376b-414d-11d3-b206-00c04fc2f3ef"
  IID_ITransactionVoterNotifyAsync2 = LibC::GUID.new(0x5433376b_u32, 0x414d_u16, 0x11d3_u16, StaticArray[0xb2_u8, 0x6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0xf3_u8, 0xef_u8])
  struct ITransactionVoterNotifyAsync2
    lpVtbl : ITransactionVoterNotifyAsync2VTbl*
  end

  struct ITransactionVoterFactory2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create : UInt64
  end

  ITransactionVoterFactory2_GUID = "5433376a-414d-11d3-b206-00c04fc2f3ef"
  IID_ITransactionVoterFactory2 = LibC::GUID.new(0x5433376a_u32, 0x414d_u16, 0x11d3_u16, StaticArray[0xb2_u8, 0x6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0xf3_u8, 0xef_u8])
  struct ITransactionVoterFactory2
    lpVtbl : ITransactionVoterFactory2VTbl*
  end

  struct ITransactionPhase0EnlistmentAsyncVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    enable : UInt64
    wait_for_enlistment : UInt64
    phase0_done : UInt64
    unenlist : UInt64
    get_transaction : UInt64
  end

  ITransactionPhase0EnlistmentAsync_GUID = "82dc88e1-a954-11d1-8f88-00600895e7d5"
  IID_ITransactionPhase0EnlistmentAsync = LibC::GUID.new(0x82dc88e1_u32, 0xa954_u16, 0x11d1_u16, StaticArray[0x8f_u8, 0x88_u8, 0x0_u8, 0x60_u8, 0x8_u8, 0x95_u8, 0xe7_u8, 0xd5_u8])
  struct ITransactionPhase0EnlistmentAsync
    lpVtbl : ITransactionPhase0EnlistmentAsyncVTbl*
  end

  struct ITransactionPhase0NotifyAsyncVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    phase0_request : UInt64
    enlist_completed : UInt64
  end

  ITransactionPhase0NotifyAsync_GUID = "ef081809-0c76-11d2-87a6-00c04f990f34"
  IID_ITransactionPhase0NotifyAsync = LibC::GUID.new(0xef081809_u32, 0xc76_u16, 0x11d2_u16, StaticArray[0x87_u8, 0xa6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x99_u8, 0xf_u8, 0x34_u8])
  struct ITransactionPhase0NotifyAsync
    lpVtbl : ITransactionPhase0NotifyAsyncVTbl*
  end

  struct ITransactionPhase0FactoryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create : UInt64
  end

  ITransactionPhase0Factory_GUID = "82dc88e0-a954-11d1-8f88-00600895e7d5"
  IID_ITransactionPhase0Factory = LibC::GUID.new(0x82dc88e0_u32, 0xa954_u16, 0x11d1_u16, StaticArray[0x8f_u8, 0x88_u8, 0x0_u8, 0x60_u8, 0x8_u8, 0x95_u8, 0xe7_u8, 0xd5_u8])
  struct ITransactionPhase0Factory
    lpVtbl : ITransactionPhase0FactoryVTbl*
  end

  struct ITransactionTransmitterVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set : UInt64
    get_propagation_token_size : UInt64
    marshal_propagation_token : UInt64
    unmarshal_return_token : UInt64
    reset : UInt64
  end

  ITransactionTransmitter_GUID = "59313e01-b36c-11cf-a539-00aa006887c3"
  IID_ITransactionTransmitter = LibC::GUID.new(0x59313e01_u32, 0xb36c_u16, 0x11cf_u16, StaticArray[0xa5_u8, 0x39_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x68_u8, 0x87_u8, 0xc3_u8])
  struct ITransactionTransmitter
    lpVtbl : ITransactionTransmitterVTbl*
  end

  struct ITransactionTransmitterFactoryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create : UInt64
  end

  ITransactionTransmitterFactory_GUID = "59313e00-b36c-11cf-a539-00aa006887c3"
  IID_ITransactionTransmitterFactory = LibC::GUID.new(0x59313e00_u32, 0xb36c_u16, 0x11cf_u16, StaticArray[0xa5_u8, 0x39_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x68_u8, 0x87_u8, 0xc3_u8])
  struct ITransactionTransmitterFactory
    lpVtbl : ITransactionTransmitterFactoryVTbl*
  end

  struct ITransactionReceiverVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    unmarshal_propagation_token : UInt64
    get_return_token_size : UInt64
    marshal_return_token : UInt64
    reset : UInt64
  end

  ITransactionReceiver_GUID = "59313e03-b36c-11cf-a539-00aa006887c3"
  IID_ITransactionReceiver = LibC::GUID.new(0x59313e03_u32, 0xb36c_u16, 0x11cf_u16, StaticArray[0xa5_u8, 0x39_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x68_u8, 0x87_u8, 0xc3_u8])
  struct ITransactionReceiver
    lpVtbl : ITransactionReceiverVTbl*
  end

  struct ITransactionReceiverFactoryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create : UInt64
  end

  ITransactionReceiverFactory_GUID = "59313e02-b36c-11cf-a539-00aa006887c3"
  IID_ITransactionReceiverFactory = LibC::GUID.new(0x59313e02_u32, 0xb36c_u16, 0x11cf_u16, StaticArray[0xa5_u8, 0x39_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x68_u8, 0x87_u8, 0xc3_u8])
  struct ITransactionReceiverFactory
    lpVtbl : ITransactionReceiverFactoryVTbl*
  end

  struct IDtcLuConfigureVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add : UInt64
    delete : UInt64
  end

  IDtcLuConfigure_GUID = "4131e760-1aea-11d0-944b-00a0c905416e"
  IID_IDtcLuConfigure = LibC::GUID.new(0x4131e760_u32, 0x1aea_u16, 0x11d0_u16, StaticArray[0x94_u8, 0x4b_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
  struct IDtcLuConfigure
    lpVtbl : IDtcLuConfigureVTbl*
  end

  struct IDtcLuRecoveryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
  end

  IDtcLuRecovery_GUID = "ac2b8ad2-d6f0-11d0-b386-00a0c9083365"
  IID_IDtcLuRecovery = LibC::GUID.new(0xac2b8ad2_u32, 0xd6f0_u16, 0x11d0_u16, StaticArray[0xb3_u8, 0x86_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x8_u8, 0x33_u8, 0x65_u8])
  struct IDtcLuRecovery
    lpVtbl : IDtcLuRecoveryVTbl*
  end

  struct IDtcLuRecoveryFactoryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create : UInt64
  end

  IDtcLuRecoveryFactory_GUID = "4131e762-1aea-11d0-944b-00a0c905416e"
  IID_IDtcLuRecoveryFactory = LibC::GUID.new(0x4131e762_u32, 0x1aea_u16, 0x11d0_u16, StaticArray[0x94_u8, 0x4b_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
  struct IDtcLuRecoveryFactory
    lpVtbl : IDtcLuRecoveryFactoryVTbl*
  end

  struct IDtcLuRecoveryInitiatedByDtcTransWorkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_log_name_sizes : UInt64
    get_our_xln : UInt64
    handle_confirmation_from_our_xln : UInt64
    handle_their_xln_response : UInt64
    handle_error_from_our_xln : UInt64
    check_for_compare_states : UInt64
    get_our_trans_id_size : UInt64
    get_our_compare_states : UInt64
    handle_their_compare_states_response : UInt64
    handle_error_from_our_compare_states : UInt64
    conversation_lost : UInt64
    get_recovery_seq_num : UInt64
    obsolete_recovery_seq_num : UInt64
  end

  IDtcLuRecoveryInitiatedByDtcTransWork_GUID = "4131e765-1aea-11d0-944b-00a0c905416e"
  IID_IDtcLuRecoveryInitiatedByDtcTransWork = LibC::GUID.new(0x4131e765_u32, 0x1aea_u16, 0x11d0_u16, StaticArray[0x94_u8, 0x4b_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
  struct IDtcLuRecoveryInitiatedByDtcTransWork
    lpVtbl : IDtcLuRecoveryInitiatedByDtcTransWorkVTbl*
  end

  struct IDtcLuRecoveryInitiatedByDtcStatusWorkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    handle_check_lu_status : UInt64
  end

  IDtcLuRecoveryInitiatedByDtcStatusWork_GUID = "4131e766-1aea-11d0-944b-00a0c905416e"
  IID_IDtcLuRecoveryInitiatedByDtcStatusWork = LibC::GUID.new(0x4131e766_u32, 0x1aea_u16, 0x11d0_u16, StaticArray[0x94_u8, 0x4b_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
  struct IDtcLuRecoveryInitiatedByDtcStatusWork
    lpVtbl : IDtcLuRecoveryInitiatedByDtcStatusWorkVTbl*
  end

  struct IDtcLuRecoveryInitiatedByDtcVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_work : UInt64
  end

  IDtcLuRecoveryInitiatedByDtc_GUID = "4131e764-1aea-11d0-944b-00a0c905416e"
  IID_IDtcLuRecoveryInitiatedByDtc = LibC::GUID.new(0x4131e764_u32, 0x1aea_u16, 0x11d0_u16, StaticArray[0x94_u8, 0x4b_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
  struct IDtcLuRecoveryInitiatedByDtc
    lpVtbl : IDtcLuRecoveryInitiatedByDtcVTbl*
  end

  struct IDtcLuRecoveryInitiatedByLuWorkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    handle_their_xln : UInt64
    get_our_log_name_size : UInt64
    get_our_xln : UInt64
    handle_confirmation_of_our_xln : UInt64
    handle_their_compare_states : UInt64
    handle_confirmation_of_our_compare_states : UInt64
    handle_error_from_our_compare_states : UInt64
    conversation_lost : UInt64
  end

  IDtcLuRecoveryInitiatedByLuWork_GUID = "ac2b8ad1-d6f0-11d0-b386-00a0c9083365"
  IID_IDtcLuRecoveryInitiatedByLuWork = LibC::GUID.new(0xac2b8ad1_u32, 0xd6f0_u16, 0x11d0_u16, StaticArray[0xb3_u8, 0x86_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x8_u8, 0x33_u8, 0x65_u8])
  struct IDtcLuRecoveryInitiatedByLuWork
    lpVtbl : IDtcLuRecoveryInitiatedByLuWorkVTbl*
  end

  struct IDtcLuRecoveryInitiatedByLuVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_object_to_handle_work_from_lu : UInt64
  end

  IDtcLuRecoveryInitiatedByLu_GUID = "4131e768-1aea-11d0-944b-00a0c905416e"
  IID_IDtcLuRecoveryInitiatedByLu = LibC::GUID.new(0x4131e768_u32, 0x1aea_u16, 0x11d0_u16, StaticArray[0x94_u8, 0x4b_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
  struct IDtcLuRecoveryInitiatedByLu
    lpVtbl : IDtcLuRecoveryInitiatedByLuVTbl*
  end

  struct IDtcLuRmEnlistmentVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    unplug : UInt64
    backed_out : UInt64
    back_out : UInt64
    committed : UInt64
    forget : UInt64
    request_commit : UInt64
  end

  IDtcLuRmEnlistment_GUID = "4131e769-1aea-11d0-944b-00a0c905416e"
  IID_IDtcLuRmEnlistment = LibC::GUID.new(0x4131e769_u32, 0x1aea_u16, 0x11d0_u16, StaticArray[0x94_u8, 0x4b_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
  struct IDtcLuRmEnlistment
    lpVtbl : IDtcLuRmEnlistmentVTbl*
  end

  struct IDtcLuRmEnlistmentSinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    ack_unplug : UInt64
    tm_down : UInt64
    session_lost : UInt64
    backed_out : UInt64
    back_out : UInt64
    committed : UInt64
    forget : UInt64
    prepare : UInt64
    request_commit : UInt64
  end

  IDtcLuRmEnlistmentSink_GUID = "4131e770-1aea-11d0-944b-00a0c905416e"
  IID_IDtcLuRmEnlistmentSink = LibC::GUID.new(0x4131e770_u32, 0x1aea_u16, 0x11d0_u16, StaticArray[0x94_u8, 0x4b_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
  struct IDtcLuRmEnlistmentSink
    lpVtbl : IDtcLuRmEnlistmentSinkVTbl*
  end

  struct IDtcLuRmEnlistmentFactoryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create : UInt64
  end

  IDtcLuRmEnlistmentFactory_GUID = "4131e771-1aea-11d0-944b-00a0c905416e"
  IID_IDtcLuRmEnlistmentFactory = LibC::GUID.new(0x4131e771_u32, 0x1aea_u16, 0x11d0_u16, StaticArray[0x94_u8, 0x4b_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
  struct IDtcLuRmEnlistmentFactory
    lpVtbl : IDtcLuRmEnlistmentFactoryVTbl*
  end

  struct IDtcLuSubordinateDtcVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    unplug : UInt64
    backed_out : UInt64
    back_out : UInt64
    committed : UInt64
    forget : UInt64
    prepare : UInt64
    request_commit : UInt64
  end

  IDtcLuSubordinateDtc_GUID = "4131e773-1aea-11d0-944b-00a0c905416e"
  IID_IDtcLuSubordinateDtc = LibC::GUID.new(0x4131e773_u32, 0x1aea_u16, 0x11d0_u16, StaticArray[0x94_u8, 0x4b_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
  struct IDtcLuSubordinateDtc
    lpVtbl : IDtcLuSubordinateDtcVTbl*
  end

  struct IDtcLuSubordinateDtcSinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    ack_unplug : UInt64
    tm_down : UInt64
    session_lost : UInt64
    backed_out : UInt64
    back_out : UInt64
    committed : UInt64
    forget : UInt64
    request_commit : UInt64
  end

  IDtcLuSubordinateDtcSink_GUID = "4131e774-1aea-11d0-944b-00a0c905416e"
  IID_IDtcLuSubordinateDtcSink = LibC::GUID.new(0x4131e774_u32, 0x1aea_u16, 0x11d0_u16, StaticArray[0x94_u8, 0x4b_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
  struct IDtcLuSubordinateDtcSink
    lpVtbl : IDtcLuSubordinateDtcSinkVTbl*
  end

  struct IDtcLuSubordinateDtcFactoryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create : UInt64
  end

  IDtcLuSubordinateDtcFactory_GUID = "4131e775-1aea-11d0-944b-00a0c905416e"
  IID_IDtcLuSubordinateDtcFactory = LibC::GUID.new(0x4131e775_u32, 0x1aea_u16, 0x11d0_u16, StaticArray[0x94_u8, 0x4b_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
  struct IDtcLuSubordinateDtcFactory
    lpVtbl : IDtcLuSubordinateDtcFactoryVTbl*
  end


  # Params # i_pszhost : PSTR [In],i_psztmname : PSTR [In],i_riid : Guid* [In],i_dwreserved1 : UInt32 [In],i_wcbreserved2 : UInt16 [In],i_pvreserved2 : Void* [In],o_ppvobject : Void** [In]
  fun DtcGetTransactionManager(i_pszhost : PSTR, i_psztmname : PSTR, i_riid : Guid*, i_dwreserved1 : UInt32, i_wcbreserved2 : UInt16, i_pvreserved2 : Void*, o_ppvobject : Void**) : HRESULT

  # Params # i_pszhost : PSTR [In],i_psztmname : PSTR [In],i_riid : Guid* [In],i_dwreserved1 : UInt32 [In],i_wcbreserved2 : UInt16 [In],i_pvreserved2 : Void* [In],o_ppvobject : Void** [In]
  fun DtcGetTransactionManagerC(i_pszhost : PSTR, i_psztmname : PSTR, i_riid : Guid*, i_dwreserved1 : UInt32, i_wcbreserved2 : UInt16, i_pvreserved2 : Void*, o_ppvobject : Void**) : HRESULT

  # Params # i_pszhost : PSTR [In],i_psztmname : PSTR [In],i_riid : Guid* [In],i_grfoptions : UInt32 [In],i_pvconfigparams : Void* [In],o_ppvobject : Void** [In]
  fun DtcGetTransactionManagerExA(i_pszhost : PSTR, i_psztmname : PSTR, i_riid : Guid*, i_grfoptions : UInt32, i_pvconfigparams : Void*, o_ppvobject : Void**) : HRESULT

  # Params # i_pwszhost : LibC::LPWSTR [In],i_pwsztmname : LibC::LPWSTR [In],i_riid : Guid* [In],i_grfoptions : UInt32 [In],i_pvconfigparams : Void* [In],o_ppvobject : Void** [In]
  fun DtcGetTransactionManagerExW(i_pwszhost : LibC::LPWSTR, i_pwsztmname : LibC::LPWSTR, i_riid : Guid*, i_grfoptions : UInt32, i_pvconfigparams : Void*, o_ppvobject : Void**) : HRESULT
end
struct LibWin32::ITransaction
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def commit(fretaining : LibC::BOOL, grftc : UInt32, grfrm : UInt32) : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(LibC::BOOL, UInt32, UInt32, HRESULT)).call(fretaining, grftc, grfrm)
  end
  def abort(pboidreason : BOID*, fretaining : LibC::BOOL, fasync : LibC::BOOL) : HRESULT
    @lpVtbl.value.abort.unsafe_as(Proc(BOID*, LibC::BOOL, LibC::BOOL, HRESULT)).call(pboidreason, fretaining, fasync)
  end
  def get_transaction_info(pinfo : XACTTRANSINFO*) : HRESULT
    @lpVtbl.value.get_transaction_info.unsafe_as(Proc(XACTTRANSINFO*, HRESULT)).call(pinfo)
  end
end
struct LibWin32::ITransactionCloner
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def commit(fretaining : LibC::BOOL, grftc : UInt32, grfrm : UInt32) : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(LibC::BOOL, UInt32, UInt32, HRESULT)).call(fretaining, grftc, grfrm)
  end
  def abort(pboidreason : BOID*, fretaining : LibC::BOOL, fasync : LibC::BOOL) : HRESULT
    @lpVtbl.value.abort.unsafe_as(Proc(BOID*, LibC::BOOL, LibC::BOOL, HRESULT)).call(pboidreason, fretaining, fasync)
  end
  def get_transaction_info(pinfo : XACTTRANSINFO*) : HRESULT
    @lpVtbl.value.get_transaction_info.unsafe_as(Proc(XACTTRANSINFO*, HRESULT)).call(pinfo)
  end
  def clone_with_commit_disabled(ppitransaction : ITransaction*) : HRESULT
    @lpVtbl.value.clone_with_commit_disabled.unsafe_as(Proc(ITransaction*, HRESULT)).call(ppitransaction)
  end
end
struct LibWin32::ITransaction2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def commit(fretaining : LibC::BOOL, grftc : UInt32, grfrm : UInt32) : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(LibC::BOOL, UInt32, UInt32, HRESULT)).call(fretaining, grftc, grfrm)
  end
  def abort(pboidreason : BOID*, fretaining : LibC::BOOL, fasync : LibC::BOOL) : HRESULT
    @lpVtbl.value.abort.unsafe_as(Proc(BOID*, LibC::BOOL, LibC::BOOL, HRESULT)).call(pboidreason, fretaining, fasync)
  end
  def get_transaction_info(pinfo : XACTTRANSINFO*) : HRESULT
    @lpVtbl.value.get_transaction_info.unsafe_as(Proc(XACTTRANSINFO*, HRESULT)).call(pinfo)
  end
  def clone_with_commit_disabled(ppitransaction : ITransaction*) : HRESULT
    @lpVtbl.value.clone_with_commit_disabled.unsafe_as(Proc(ITransaction*, HRESULT)).call(ppitransaction)
  end
  def get_transaction_info2(pinfo : XACTTRANSINFO*) : HRESULT
    @lpVtbl.value.get_transaction_info2.unsafe_as(Proc(XACTTRANSINFO*, HRESULT)).call(pinfo)
  end
end
struct LibWin32::ITransactionDispenser
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_options_object(ppoptions : ITransactionOptions*) : HRESULT
    @lpVtbl.value.get_options_object.unsafe_as(Proc(ITransactionOptions*, HRESULT)).call(ppoptions)
  end
  def begin_transaction(punkouter : IUnknown, isolevel : Int32, isoflags : UInt32, poptions : ITransactionOptions, pptransaction : ITransaction*) : HRESULT
    @lpVtbl.value.begin_transaction.unsafe_as(Proc(IUnknown, Int32, UInt32, ITransactionOptions, ITransaction*, HRESULT)).call(punkouter, isolevel, isoflags, poptions, pptransaction)
  end
end
struct LibWin32::ITransactionOptions
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_options(poptions : XACTOPT*) : HRESULT
    @lpVtbl.value.set_options.unsafe_as(Proc(XACTOPT*, HRESULT)).call(poptions)
  end
  def get_options(poptions : XACTOPT*) : HRESULT
    @lpVtbl.value.get_options.unsafe_as(Proc(XACTOPT*, HRESULT)).call(poptions)
  end
end
struct LibWin32::ITransactionOutcomeEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def committed(fretaining : LibC::BOOL, pnewuow : BOID*, hr : HRESULT) : HRESULT
    @lpVtbl.value.committed.unsafe_as(Proc(LibC::BOOL, BOID*, HRESULT, HRESULT)).call(fretaining, pnewuow, hr)
  end
  def aborted(pboidreason : BOID*, fretaining : LibC::BOOL, pnewuow : BOID*, hr : HRESULT) : HRESULT
    @lpVtbl.value.aborted.unsafe_as(Proc(BOID*, LibC::BOOL, BOID*, HRESULT, HRESULT)).call(pboidreason, fretaining, pnewuow, hr)
  end
  def heuristic_decision(dwdecision : UInt32, pboidreason : BOID*, hr : HRESULT) : HRESULT
    @lpVtbl.value.heuristic_decision.unsafe_as(Proc(UInt32, BOID*, HRESULT, HRESULT)).call(dwdecision, pboidreason, hr)
  end
  def indoubt : HRESULT
    @lpVtbl.value.indoubt.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ITmNodeName
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_node_name_size(pcbnodenamesize : UInt32*) : HRESULT
    @lpVtbl.value.get_node_name_size.unsafe_as(Proc(UInt32*, HRESULT)).call(pcbnodenamesize)
  end
  def get_node_name(cbnodenamebuffersize : UInt32, pnodenamebuffer : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.get_node_name.unsafe_as(Proc(UInt32, LibC::LPWSTR, HRESULT)).call(cbnodenamebuffersize, pnodenamebuffer)
  end
end
struct LibWin32::IKernelTransaction
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_handle(phandle : LibC::HANDLE*) : HRESULT
    @lpVtbl.value.get_handle.unsafe_as(Proc(LibC::HANDLE*, HRESULT)).call(phandle)
  end
end
struct LibWin32::ITransactionResourceAsync
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def prepare_request(fretaining : LibC::BOOL, grfrm : UInt32, fwantmoniker : LibC::BOOL, fsinglephase : LibC::BOOL) : HRESULT
    @lpVtbl.value.prepare_request.unsafe_as(Proc(LibC::BOOL, UInt32, LibC::BOOL, LibC::BOOL, HRESULT)).call(fretaining, grfrm, fwantmoniker, fsinglephase)
  end
  def commit_request(grfrm : UInt32, pnewuow : BOID*) : HRESULT
    @lpVtbl.value.commit_request.unsafe_as(Proc(UInt32, BOID*, HRESULT)).call(grfrm, pnewuow)
  end
  def abort_request(pboidreason : BOID*, fretaining : LibC::BOOL, pnewuow : BOID*) : HRESULT
    @lpVtbl.value.abort_request.unsafe_as(Proc(BOID*, LibC::BOOL, BOID*, HRESULT)).call(pboidreason, fretaining, pnewuow)
  end
  def tm_down : HRESULT
    @lpVtbl.value.tm_down.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ITransactionLastResourceAsync
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def delegate_commit(grfrm : UInt32) : HRESULT
    @lpVtbl.value.delegate_commit.unsafe_as(Proc(UInt32, HRESULT)).call(grfrm)
  end
  def forget_request(pnewuow : BOID*) : HRESULT
    @lpVtbl.value.forget_request.unsafe_as(Proc(BOID*, HRESULT)).call(pnewuow)
  end
end
struct LibWin32::ITransactionResource
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def prepare_request(fretaining : LibC::BOOL, grfrm : UInt32, fwantmoniker : LibC::BOOL, fsinglephase : LibC::BOOL) : HRESULT
    @lpVtbl.value.prepare_request.unsafe_as(Proc(LibC::BOOL, UInt32, LibC::BOOL, LibC::BOOL, HRESULT)).call(fretaining, grfrm, fwantmoniker, fsinglephase)
  end
  def commit_request(grfrm : UInt32, pnewuow : BOID*) : HRESULT
    @lpVtbl.value.commit_request.unsafe_as(Proc(UInt32, BOID*, HRESULT)).call(grfrm, pnewuow)
  end
  def abort_request(pboidreason : BOID*, fretaining : LibC::BOOL, pnewuow : BOID*) : HRESULT
    @lpVtbl.value.abort_request.unsafe_as(Proc(BOID*, LibC::BOOL, BOID*, HRESULT)).call(pboidreason, fretaining, pnewuow)
  end
  def tm_down : HRESULT
    @lpVtbl.value.tm_down.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ITransactionEnlistmentAsync
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def prepare_request_done(hr : HRESULT, pmk : IMoniker, pboidreason : BOID*) : HRESULT
    @lpVtbl.value.prepare_request_done.unsafe_as(Proc(HRESULT, IMoniker, BOID*, HRESULT)).call(hr, pmk, pboidreason)
  end
  def commit_request_done(hr : HRESULT) : HRESULT
    @lpVtbl.value.commit_request_done.unsafe_as(Proc(HRESULT, HRESULT)).call(hr)
  end
  def abort_request_done(hr : HRESULT) : HRESULT
    @lpVtbl.value.abort_request_done.unsafe_as(Proc(HRESULT, HRESULT)).call(hr)
  end
end
struct LibWin32::ITransactionLastEnlistmentAsync
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def transaction_outcome(xactstat : XACTSTAT, pboidreason : BOID*) : HRESULT
    @lpVtbl.value.transaction_outcome.unsafe_as(Proc(XACTSTAT, BOID*, HRESULT)).call(xactstat, pboidreason)
  end
end
struct LibWin32::ITransactionExportFactory
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_remote_class_id(pclsid : Guid*) : HRESULT
    @lpVtbl.value.get_remote_class_id.unsafe_as(Proc(Guid*, HRESULT)).call(pclsid)
  end
  def create(cbwhereabouts : UInt32, rgbwhereabouts : UInt8*, ppexport : ITransactionExport*) : HRESULT
    @lpVtbl.value.create.unsafe_as(Proc(UInt32, UInt8*, ITransactionExport*, HRESULT)).call(cbwhereabouts, rgbwhereabouts, ppexport)
  end
end
struct LibWin32::ITransactionImportWhereabouts
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_whereabouts_size(pcbwhereabouts : UInt32*) : HRESULT
    @lpVtbl.value.get_whereabouts_size.unsafe_as(Proc(UInt32*, HRESULT)).call(pcbwhereabouts)
  end
  def get_whereabouts(cbwhereabouts : UInt32, rgbwhereabouts : UInt8*, pcbused : UInt32*) : HRESULT
    @lpVtbl.value.get_whereabouts.unsafe_as(Proc(UInt32, UInt8*, UInt32*, HRESULT)).call(cbwhereabouts, rgbwhereabouts, pcbused)
  end
end
struct LibWin32::ITransactionExport
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def export(punktransaction : IUnknown, pcbtransactioncookie : UInt32*) : HRESULT
    @lpVtbl.value.export.unsafe_as(Proc(IUnknown, UInt32*, HRESULT)).call(punktransaction, pcbtransactioncookie)
  end
  def get_transaction_cookie(punktransaction : IUnknown, cbtransactioncookie : UInt32, rgbtransactioncookie : UInt8*, pcbused : UInt32*) : HRESULT
    @lpVtbl.value.get_transaction_cookie.unsafe_as(Proc(IUnknown, UInt32, UInt8*, UInt32*, HRESULT)).call(punktransaction, cbtransactioncookie, rgbtransactioncookie, pcbused)
  end
end
struct LibWin32::ITransactionImport
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def import(cbtransactioncookie : UInt32, rgbtransactioncookie : UInt8*, piid : Guid*, ppvtransaction : Void**) : HRESULT
    @lpVtbl.value.import.unsafe_as(Proc(UInt32, UInt8*, Guid*, Void**, HRESULT)).call(cbtransactioncookie, rgbtransactioncookie, piid, ppvtransaction)
  end
end
struct LibWin32::ITipTransaction
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def push(i_pszremotetmurl : UInt8*, o_ppszremotetxurl : PSTR*) : HRESULT
    @lpVtbl.value.push.unsafe_as(Proc(UInt8*, PSTR*, HRESULT)).call(i_pszremotetmurl, o_ppszremotetxurl)
  end
  def get_transaction_url(o_ppszlocaltxurl : PSTR*) : HRESULT
    @lpVtbl.value.get_transaction_url.unsafe_as(Proc(PSTR*, HRESULT)).call(o_ppszlocaltxurl)
  end
end
struct LibWin32::ITipHelper
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def pull(i_psztxurl : UInt8*, o_ppitransaction : ITransaction*) : HRESULT
    @lpVtbl.value.pull.unsafe_as(Proc(UInt8*, ITransaction*, HRESULT)).call(i_psztxurl, o_ppitransaction)
  end
  def pull_async(i_psztxurl : UInt8*, i_ptippullsink : ITipPullSink, o_ppitransaction : ITransaction*) : HRESULT
    @lpVtbl.value.pull_async.unsafe_as(Proc(UInt8*, ITipPullSink, ITransaction*, HRESULT)).call(i_psztxurl, i_ptippullsink, o_ppitransaction)
  end
  def get_local_tm_url(o_ppszlocaltmurl : UInt8**) : HRESULT
    @lpVtbl.value.get_local_tm_url.unsafe_as(Proc(UInt8**, HRESULT)).call(o_ppszlocaltmurl)
  end
end
struct LibWin32::ITipPullSink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def pull_complete(i_hrpull : HRESULT) : HRESULT
    @lpVtbl.value.pull_complete.unsafe_as(Proc(HRESULT, HRESULT)).call(i_hrpull)
  end
end
struct LibWin32::IDtcNetworkAccessConfig
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_any_network_access(pbanynetworkaccess : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_any_network_access.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbanynetworkaccess)
  end
  def set_any_network_access(banynetworkaccess : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_any_network_access.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(banynetworkaccess)
  end
  def get_network_administration_access(pbnetworkadministrationaccess : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_network_administration_access.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbnetworkadministrationaccess)
  end
  def set_network_administration_access(bnetworkadministrationaccess : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_network_administration_access.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(bnetworkadministrationaccess)
  end
  def get_network_transaction_access(pbnetworktransactionaccess : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_network_transaction_access.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbnetworktransactionaccess)
  end
  def set_network_transaction_access(bnetworktransactionaccess : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_network_transaction_access.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(bnetworktransactionaccess)
  end
  def get_network_client_access(pbnetworkclientaccess : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_network_client_access.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbnetworkclientaccess)
  end
  def set_network_client_access(bnetworkclientaccess : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_network_client_access.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(bnetworkclientaccess)
  end
  def get_network_tip_access(pbnetworktipaccess : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_network_tip_access.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbnetworktipaccess)
  end
  def set_network_tip_access(bnetworktipaccess : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_network_tip_access.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(bnetworktipaccess)
  end
  def get_xa_access(pbxaaccess : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_xa_access.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbxaaccess)
  end
  def set_xa_access(bxaaccess : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_xa_access.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(bxaaccess)
  end
  def restart_dtc_service : HRESULT
    @lpVtbl.value.restart_dtc_service.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IDtcNetworkAccessConfig2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_any_network_access(pbanynetworkaccess : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_any_network_access.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbanynetworkaccess)
  end
  def set_any_network_access(banynetworkaccess : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_any_network_access.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(banynetworkaccess)
  end
  def get_network_administration_access(pbnetworkadministrationaccess : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_network_administration_access.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbnetworkadministrationaccess)
  end
  def set_network_administration_access(bnetworkadministrationaccess : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_network_administration_access.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(bnetworkadministrationaccess)
  end
  def get_network_transaction_access(pbnetworktransactionaccess : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_network_transaction_access.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbnetworktransactionaccess)
  end
  def set_network_transaction_access(bnetworktransactionaccess : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_network_transaction_access.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(bnetworktransactionaccess)
  end
  def get_network_client_access(pbnetworkclientaccess : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_network_client_access.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbnetworkclientaccess)
  end
  def set_network_client_access(bnetworkclientaccess : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_network_client_access.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(bnetworkclientaccess)
  end
  def get_network_tip_access(pbnetworktipaccess : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_network_tip_access.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbnetworktipaccess)
  end
  def set_network_tip_access(bnetworktipaccess : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_network_tip_access.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(bnetworktipaccess)
  end
  def get_xa_access(pbxaaccess : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_xa_access.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbxaaccess)
  end
  def set_xa_access(bxaaccess : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_xa_access.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(bxaaccess)
  end
  def restart_dtc_service : HRESULT
    @lpVtbl.value.restart_dtc_service.unsafe_as(Proc(HRESULT)).call
  end
  def get_network_inbound_access(pbinbound : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_network_inbound_access.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbinbound)
  end
  def get_network_outbound_access(pboutbound : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_network_outbound_access.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pboutbound)
  end
  def set_network_inbound_access(binbound : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_network_inbound_access.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(binbound)
  end
  def set_network_outbound_access(boutbound : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_network_outbound_access.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(boutbound)
  end
  def get_authentication_level(pauthlevel : AUTHENTICATION_LEVEL*) : HRESULT
    @lpVtbl.value.get_authentication_level.unsafe_as(Proc(AUTHENTICATION_LEVEL*, HRESULT)).call(pauthlevel)
  end
  def set_authentication_level(authlevel : AUTHENTICATION_LEVEL) : HRESULT
    @lpVtbl.value.set_authentication_level.unsafe_as(Proc(AUTHENTICATION_LEVEL, HRESULT)).call(authlevel)
  end
end
struct LibWin32::IDtcNetworkAccessConfig3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_any_network_access(pbanynetworkaccess : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_any_network_access.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbanynetworkaccess)
  end
  def set_any_network_access(banynetworkaccess : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_any_network_access.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(banynetworkaccess)
  end
  def get_network_administration_access(pbnetworkadministrationaccess : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_network_administration_access.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbnetworkadministrationaccess)
  end
  def set_network_administration_access(bnetworkadministrationaccess : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_network_administration_access.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(bnetworkadministrationaccess)
  end
  def get_network_transaction_access(pbnetworktransactionaccess : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_network_transaction_access.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbnetworktransactionaccess)
  end
  def set_network_transaction_access(bnetworktransactionaccess : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_network_transaction_access.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(bnetworktransactionaccess)
  end
  def get_network_client_access(pbnetworkclientaccess : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_network_client_access.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbnetworkclientaccess)
  end
  def set_network_client_access(bnetworkclientaccess : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_network_client_access.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(bnetworkclientaccess)
  end
  def get_network_tip_access(pbnetworktipaccess : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_network_tip_access.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbnetworktipaccess)
  end
  def set_network_tip_access(bnetworktipaccess : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_network_tip_access.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(bnetworktipaccess)
  end
  def get_xa_access(pbxaaccess : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_xa_access.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbxaaccess)
  end
  def set_xa_access(bxaaccess : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_xa_access.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(bxaaccess)
  end
  def restart_dtc_service : HRESULT
    @lpVtbl.value.restart_dtc_service.unsafe_as(Proc(HRESULT)).call
  end
  def get_network_inbound_access(pbinbound : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_network_inbound_access.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbinbound)
  end
  def get_network_outbound_access(pboutbound : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_network_outbound_access.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pboutbound)
  end
  def set_network_inbound_access(binbound : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_network_inbound_access.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(binbound)
  end
  def set_network_outbound_access(boutbound : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_network_outbound_access.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(boutbound)
  end
  def get_authentication_level(pauthlevel : AUTHENTICATION_LEVEL*) : HRESULT
    @lpVtbl.value.get_authentication_level.unsafe_as(Proc(AUTHENTICATION_LEVEL*, HRESULT)).call(pauthlevel)
  end
  def set_authentication_level(authlevel : AUTHENTICATION_LEVEL) : HRESULT
    @lpVtbl.value.set_authentication_level.unsafe_as(Proc(AUTHENTICATION_LEVEL, HRESULT)).call(authlevel)
  end
  def get_lu_access(pbluaccess : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_lu_access.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbluaccess)
  end
  def set_lu_access(bluaccess : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_lu_access.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(bluaccess)
  end
end
struct LibWin32::IDtcToXaMapper
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def request_new_resource_manager(pszdsn : PSTR, pszclientdllname : PSTR, pdwrmcookie : UInt32*) : HRESULT
    @lpVtbl.value.request_new_resource_manager.unsafe_as(Proc(PSTR, PSTR, UInt32*, HRESULT)).call(pszdsn, pszclientdllname, pdwrmcookie)
  end
  def translate_trid_to_xid(pdwitransaction : UInt32*, dwrmcookie : UInt32, pxid : Xid_t*) : HRESULT
    @lpVtbl.value.translate_trid_to_xid.unsafe_as(Proc(UInt32*, UInt32, Xid_t*, HRESULT)).call(pdwitransaction, dwrmcookie, pxid)
  end
  def enlist_resource_manager(dwrmcookie : UInt32, pdwitransaction : UInt32*) : HRESULT
    @lpVtbl.value.enlist_resource_manager.unsafe_as(Proc(UInt32, UInt32*, HRESULT)).call(dwrmcookie, pdwitransaction)
  end
  def release_resource_manager(dwrmcookie : UInt32) : HRESULT
    @lpVtbl.value.release_resource_manager.unsafe_as(Proc(UInt32, HRESULT)).call(dwrmcookie)
  end
end
struct LibWin32::IDtcToXaHelperFactory
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create(pszdsn : PSTR, pszclientdllname : PSTR, pguidrm : Guid*, ppxahelper : IDtcToXaHelper*) : HRESULT
    @lpVtbl.value.create.unsafe_as(Proc(PSTR, PSTR, Guid*, IDtcToXaHelper*, HRESULT)).call(pszdsn, pszclientdllname, pguidrm, ppxahelper)
  end
end
struct LibWin32::IDtcToXaHelper
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def close(i_fdorecovery : LibC::BOOL) : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(i_fdorecovery)
  end
  def translate_trid_to_xid(pitransaction : ITransaction, pguidbqual : Guid*, pxid : Xid_t*) : HRESULT
    @lpVtbl.value.translate_trid_to_xid.unsafe_as(Proc(ITransaction, Guid*, Xid_t*, HRESULT)).call(pitransaction, pguidbqual, pxid)
  end
end
struct LibWin32::IDtcToXaHelperSinglePipe
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def xarm_create(pszdsn : PSTR, pszclientdll : PSTR, pdwrmcookie : UInt32*) : HRESULT
    @lpVtbl.value.xarm_create.unsafe_as(Proc(PSTR, PSTR, UInt32*, HRESULT)).call(pszdsn, pszclientdll, pdwrmcookie)
  end
  def convert_trid_to_xid(pdwitrans : UInt32*, dwrmcookie : UInt32, pxid : Xid_t*) : HRESULT
    @lpVtbl.value.convert_trid_to_xid.unsafe_as(Proc(UInt32*, UInt32, Xid_t*, HRESULT)).call(pdwitrans, dwrmcookie, pxid)
  end
  def enlist_with_rm(dwrmcookie : UInt32, i_pitransaction : ITransaction, i_pitransres : ITransactionResourceAsync, o_ppitransenslitment : ITransactionEnlistmentAsync*) : HRESULT
    @lpVtbl.value.enlist_with_rm.unsafe_as(Proc(UInt32, ITransaction, ITransactionResourceAsync, ITransactionEnlistmentAsync*, HRESULT)).call(dwrmcookie, i_pitransaction, i_pitransres, o_ppitransenslitment)
  end
  def release_rm_cookie(i_dwrmcookie : UInt32, i_fnormal : LibC::BOOL) : Void
    @lpVtbl.value.release_rm_cookie.unsafe_as(Proc(UInt32, LibC::BOOL, Void)).call(i_dwrmcookie, i_fnormal)
  end
end
struct LibWin32::IXATransLookup
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def lookup(pptransaction : ITransaction*) : HRESULT
    @lpVtbl.value.lookup.unsafe_as(Proc(ITransaction*, HRESULT)).call(pptransaction)
  end
end
struct LibWin32::IXATransLookup2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def lookup(pxid : Xid_t*, pptransaction : ITransaction*) : HRESULT
    @lpVtbl.value.lookup.unsafe_as(Proc(Xid_t*, ITransaction*, HRESULT)).call(pxid, pptransaction)
  end
end
struct LibWin32::IResourceManagerSink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def tm_down : HRESULT
    @lpVtbl.value.tm_down.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IResourceManager
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def enlist(ptransaction : ITransaction, pres : ITransactionResourceAsync, puow : BOID*, pisolevel : Int32*, ppenlist : ITransactionEnlistmentAsync*) : HRESULT
    @lpVtbl.value.enlist.unsafe_as(Proc(ITransaction, ITransactionResourceAsync, BOID*, Int32*, ITransactionEnlistmentAsync*, HRESULT)).call(ptransaction, pres, puow, pisolevel, ppenlist)
  end
  def reenlist(pprepinfo : UInt8*, cbprepinfo : UInt32, ltimeout : UInt32, pxactstat : XACTSTAT*) : HRESULT
    @lpVtbl.value.reenlist.unsafe_as(Proc(UInt8*, UInt32, UInt32, XACTSTAT*, HRESULT)).call(pprepinfo, cbprepinfo, ltimeout, pxactstat)
  end
  def reenlistment_complete : HRESULT
    @lpVtbl.value.reenlistment_complete.unsafe_as(Proc(HRESULT)).call
  end
  def get_distributed_transaction_manager(iid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.get_distributed_transaction_manager.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(iid, ppvobject)
  end
end
struct LibWin32::ILastResourceManager
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def transaction_committed(pprepinfo : UInt8*, cbprepinfo : UInt32) : HRESULT
    @lpVtbl.value.transaction_committed.unsafe_as(Proc(UInt8*, UInt32, HRESULT)).call(pprepinfo, cbprepinfo)
  end
  def recovery_done : HRESULT
    @lpVtbl.value.recovery_done.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IResourceManager2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def enlist(ptransaction : ITransaction, pres : ITransactionResourceAsync, puow : BOID*, pisolevel : Int32*, ppenlist : ITransactionEnlistmentAsync*) : HRESULT
    @lpVtbl.value.enlist.unsafe_as(Proc(ITransaction, ITransactionResourceAsync, BOID*, Int32*, ITransactionEnlistmentAsync*, HRESULT)).call(ptransaction, pres, puow, pisolevel, ppenlist)
  end
  def reenlist(pprepinfo : UInt8*, cbprepinfo : UInt32, ltimeout : UInt32, pxactstat : XACTSTAT*) : HRESULT
    @lpVtbl.value.reenlist.unsafe_as(Proc(UInt8*, UInt32, UInt32, XACTSTAT*, HRESULT)).call(pprepinfo, cbprepinfo, ltimeout, pxactstat)
  end
  def reenlistment_complete : HRESULT
    @lpVtbl.value.reenlistment_complete.unsafe_as(Proc(HRESULT)).call
  end
  def get_distributed_transaction_manager(iid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.get_distributed_transaction_manager.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(iid, ppvobject)
  end
  def enlist2(ptransaction : ITransaction, presasync : ITransactionResourceAsync, puow : BOID*, pisolevel : Int32*, pxid : Xid_t*, ppenlist : ITransactionEnlistmentAsync*) : HRESULT
    @lpVtbl.value.enlist2.unsafe_as(Proc(ITransaction, ITransactionResourceAsync, BOID*, Int32*, Xid_t*, ITransactionEnlistmentAsync*, HRESULT)).call(ptransaction, presasync, puow, pisolevel, pxid, ppenlist)
  end
  def reenlist2(pxid : Xid_t*, dwtimeout : UInt32, pxactstat : XACTSTAT*) : HRESULT
    @lpVtbl.value.reenlist2.unsafe_as(Proc(Xid_t*, UInt32, XACTSTAT*, HRESULT)).call(pxid, dwtimeout, pxactstat)
  end
end
struct LibWin32::IResourceManagerRejoinable
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def enlist(ptransaction : ITransaction, pres : ITransactionResourceAsync, puow : BOID*, pisolevel : Int32*, ppenlist : ITransactionEnlistmentAsync*) : HRESULT
    @lpVtbl.value.enlist.unsafe_as(Proc(ITransaction, ITransactionResourceAsync, BOID*, Int32*, ITransactionEnlistmentAsync*, HRESULT)).call(ptransaction, pres, puow, pisolevel, ppenlist)
  end
  def reenlist(pprepinfo : UInt8*, cbprepinfo : UInt32, ltimeout : UInt32, pxactstat : XACTSTAT*) : HRESULT
    @lpVtbl.value.reenlist.unsafe_as(Proc(UInt8*, UInt32, UInt32, XACTSTAT*, HRESULT)).call(pprepinfo, cbprepinfo, ltimeout, pxactstat)
  end
  def reenlistment_complete : HRESULT
    @lpVtbl.value.reenlistment_complete.unsafe_as(Proc(HRESULT)).call
  end
  def get_distributed_transaction_manager(iid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.get_distributed_transaction_manager.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(iid, ppvobject)
  end
  def enlist2(ptransaction : ITransaction, presasync : ITransactionResourceAsync, puow : BOID*, pisolevel : Int32*, pxid : Xid_t*, ppenlist : ITransactionEnlistmentAsync*) : HRESULT
    @lpVtbl.value.enlist2.unsafe_as(Proc(ITransaction, ITransactionResourceAsync, BOID*, Int32*, Xid_t*, ITransactionEnlistmentAsync*, HRESULT)).call(ptransaction, presasync, puow, pisolevel, pxid, ppenlist)
  end
  def reenlist2(pxid : Xid_t*, dwtimeout : UInt32, pxactstat : XACTSTAT*) : HRESULT
    @lpVtbl.value.reenlist2.unsafe_as(Proc(Xid_t*, UInt32, XACTSTAT*, HRESULT)).call(pxid, dwtimeout, pxactstat)
  end
  def rejoin(pprepinfo : UInt8*, cbprepinfo : UInt32, ltimeout : UInt32, pxactstat : XACTSTAT*) : HRESULT
    @lpVtbl.value.rejoin.unsafe_as(Proc(UInt8*, UInt32, UInt32, XACTSTAT*, HRESULT)).call(pprepinfo, cbprepinfo, ltimeout, pxactstat)
  end
end
struct LibWin32::IXAConfig
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initialize(clsidhelperdll : Guid) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(Guid, HRESULT)).call(clsidhelperdll)
  end
  def terminate : HRESULT
    @lpVtbl.value.terminate.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IRMHelper
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def rm_count(dwctotalnumberofrms : UInt32) : HRESULT
    @lpVtbl.value.rm_count.unsafe_as(Proc(UInt32, HRESULT)).call(dwctotalnumberofrms)
  end
  def rm_info(pxa_switch : Xa_switch_t*, fcdeclcallingconv : LibC::BOOL, pszopenstring : PSTR, pszclosestring : PSTR, guidrmrecovery : Guid) : HRESULT
    @lpVtbl.value.rm_info.unsafe_as(Proc(Xa_switch_t*, LibC::BOOL, PSTR, PSTR, Guid, HRESULT)).call(pxa_switch, fcdeclcallingconv, pszopenstring, pszclosestring, guidrmrecovery)
  end
end
struct LibWin32::IXAObtainRMInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def obtain_rm_info(pirmhelper : IRMHelper) : HRESULT
    @lpVtbl.value.obtain_rm_info.unsafe_as(Proc(IRMHelper, HRESULT)).call(pirmhelper)
  end
end
struct LibWin32::IResourceManagerFactory
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create(pguidrm : Guid*, pszrmname : PSTR, piresmgrsink : IResourceManagerSink, ppresmgr : IResourceManager*) : HRESULT
    @lpVtbl.value.create.unsafe_as(Proc(Guid*, PSTR, IResourceManagerSink, IResourceManager*, HRESULT)).call(pguidrm, pszrmname, piresmgrsink, ppresmgr)
  end
end
struct LibWin32::IResourceManagerFactory2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create(pguidrm : Guid*, pszrmname : PSTR, piresmgrsink : IResourceManagerSink, ppresmgr : IResourceManager*) : HRESULT
    @lpVtbl.value.create.unsafe_as(Proc(Guid*, PSTR, IResourceManagerSink, IResourceManager*, HRESULT)).call(pguidrm, pszrmname, piresmgrsink, ppresmgr)
  end
  def create_ex(pguidrm : Guid*, pszrmname : PSTR, piresmgrsink : IResourceManagerSink, riidrequested : Guid*, ppvresmgr : Void**) : HRESULT
    @lpVtbl.value.create_ex.unsafe_as(Proc(Guid*, PSTR, IResourceManagerSink, Guid*, Void**, HRESULT)).call(pguidrm, pszrmname, piresmgrsink, riidrequested, ppvresmgr)
  end
end
struct LibWin32::IPrepareInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_prepare_info_size(pcbprepinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_prepare_info_size.unsafe_as(Proc(UInt32*, HRESULT)).call(pcbprepinfo)
  end
  def get_prepare_info(pprepinfo : UInt8*) : HRESULT
    @lpVtbl.value.get_prepare_info.unsafe_as(Proc(UInt8*, HRESULT)).call(pprepinfo)
  end
end
struct LibWin32::IPrepareInfo2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_prepare_info_size(pcbprepinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_prepare_info_size.unsafe_as(Proc(UInt32*, HRESULT)).call(pcbprepinfo)
  end
  def get_prepare_info(cbprepareinfo : UInt32, pprepinfo : UInt8*) : HRESULT
    @lpVtbl.value.get_prepare_info.unsafe_as(Proc(UInt32, UInt8*, HRESULT)).call(cbprepareinfo, pprepinfo)
  end
end
struct LibWin32::IGetDispenser
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_dispenser(iid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.get_dispenser.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(iid, ppvobject)
  end
end
struct LibWin32::ITransactionVoterBallotAsync2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def vote_request_done(hr : HRESULT, pboidreason : BOID*) : HRESULT
    @lpVtbl.value.vote_request_done.unsafe_as(Proc(HRESULT, BOID*, HRESULT)).call(hr, pboidreason)
  end
end
struct LibWin32::ITransactionVoterNotifyAsync2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def committed(fretaining : LibC::BOOL, pnewuow : BOID*, hr : HRESULT) : HRESULT
    @lpVtbl.value.committed.unsafe_as(Proc(LibC::BOOL, BOID*, HRESULT, HRESULT)).call(fretaining, pnewuow, hr)
  end
  def aborted(pboidreason : BOID*, fretaining : LibC::BOOL, pnewuow : BOID*, hr : HRESULT) : HRESULT
    @lpVtbl.value.aborted.unsafe_as(Proc(BOID*, LibC::BOOL, BOID*, HRESULT, HRESULT)).call(pboidreason, fretaining, pnewuow, hr)
  end
  def heuristic_decision(dwdecision : UInt32, pboidreason : BOID*, hr : HRESULT) : HRESULT
    @lpVtbl.value.heuristic_decision.unsafe_as(Proc(UInt32, BOID*, HRESULT, HRESULT)).call(dwdecision, pboidreason, hr)
  end
  def indoubt : HRESULT
    @lpVtbl.value.indoubt.unsafe_as(Proc(HRESULT)).call
  end
  def vote_request : HRESULT
    @lpVtbl.value.vote_request.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ITransactionVoterFactory2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create(ptransaction : ITransaction, pvoternotify : ITransactionVoterNotifyAsync2, ppvoterballot : ITransactionVoterBallotAsync2*) : HRESULT
    @lpVtbl.value.create.unsafe_as(Proc(ITransaction, ITransactionVoterNotifyAsync2, ITransactionVoterBallotAsync2*, HRESULT)).call(ptransaction, pvoternotify, ppvoterballot)
  end
end
struct LibWin32::ITransactionPhase0EnlistmentAsync
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def enable : HRESULT
    @lpVtbl.value.enable.unsafe_as(Proc(HRESULT)).call
  end
  def wait_for_enlistment : HRESULT
    @lpVtbl.value.wait_for_enlistment.unsafe_as(Proc(HRESULT)).call
  end
  def phase0_done : HRESULT
    @lpVtbl.value.phase0_done.unsafe_as(Proc(HRESULT)).call
  end
  def unenlist : HRESULT
    @lpVtbl.value.unenlist.unsafe_as(Proc(HRESULT)).call
  end
  def get_transaction(ppitransaction : ITransaction*) : HRESULT
    @lpVtbl.value.get_transaction.unsafe_as(Proc(ITransaction*, HRESULT)).call(ppitransaction)
  end
end
struct LibWin32::ITransactionPhase0NotifyAsync
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def phase0_request(fabortinghint : LibC::BOOL) : HRESULT
    @lpVtbl.value.phase0_request.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fabortinghint)
  end
  def enlist_completed(status : HRESULT) : HRESULT
    @lpVtbl.value.enlist_completed.unsafe_as(Proc(HRESULT, HRESULT)).call(status)
  end
end
struct LibWin32::ITransactionPhase0Factory
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create(pphase0notify : ITransactionPhase0NotifyAsync, ppphase0enlistment : ITransactionPhase0EnlistmentAsync*) : HRESULT
    @lpVtbl.value.create.unsafe_as(Proc(ITransactionPhase0NotifyAsync, ITransactionPhase0EnlistmentAsync*, HRESULT)).call(pphase0notify, ppphase0enlistment)
  end
end
struct LibWin32::ITransactionTransmitter
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set(ptransaction : ITransaction) : HRESULT
    @lpVtbl.value.set.unsafe_as(Proc(ITransaction, HRESULT)).call(ptransaction)
  end
  def get_propagation_token_size(pcbtoken : UInt32*) : HRESULT
    @lpVtbl.value.get_propagation_token_size.unsafe_as(Proc(UInt32*, HRESULT)).call(pcbtoken)
  end
  def marshal_propagation_token(cbtoken : UInt32, rgbtoken : UInt8*, pcbused : UInt32*) : HRESULT
    @lpVtbl.value.marshal_propagation_token.unsafe_as(Proc(UInt32, UInt8*, UInt32*, HRESULT)).call(cbtoken, rgbtoken, pcbused)
  end
  def unmarshal_return_token(cbreturntoken : UInt32, rgbreturntoken : UInt8*) : HRESULT
    @lpVtbl.value.unmarshal_return_token.unsafe_as(Proc(UInt32, UInt8*, HRESULT)).call(cbreturntoken, rgbreturntoken)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ITransactionTransmitterFactory
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create(pptransmitter : ITransactionTransmitter*) : HRESULT
    @lpVtbl.value.create.unsafe_as(Proc(ITransactionTransmitter*, HRESULT)).call(pptransmitter)
  end
end
struct LibWin32::ITransactionReceiver
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def unmarshal_propagation_token(cbtoken : UInt32, rgbtoken : UInt8*, pptransaction : ITransaction*) : HRESULT
    @lpVtbl.value.unmarshal_propagation_token.unsafe_as(Proc(UInt32, UInt8*, ITransaction*, HRESULT)).call(cbtoken, rgbtoken, pptransaction)
  end
  def get_return_token_size(pcbreturntoken : UInt32*) : HRESULT
    @lpVtbl.value.get_return_token_size.unsafe_as(Proc(UInt32*, HRESULT)).call(pcbreturntoken)
  end
  def marshal_return_token(cbreturntoken : UInt32, rgbreturntoken : UInt8*, pcbused : UInt32*) : HRESULT
    @lpVtbl.value.marshal_return_token.unsafe_as(Proc(UInt32, UInt8*, UInt32*, HRESULT)).call(cbreturntoken, rgbreturntoken, pcbused)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ITransactionReceiverFactory
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create(ppreceiver : ITransactionReceiver*) : HRESULT
    @lpVtbl.value.create.unsafe_as(Proc(ITransactionReceiver*, HRESULT)).call(ppreceiver)
  end
end
struct LibWin32::IDtcLuConfigure
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add(puclupair : UInt8*, cblupair : UInt32) : HRESULT
    @lpVtbl.value.add.unsafe_as(Proc(UInt8*, UInt32, HRESULT)).call(puclupair, cblupair)
  end
  def delete(puclupair : UInt8*, cblupair : UInt32) : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(UInt8*, UInt32, HRESULT)).call(puclupair, cblupair)
  end
end
struct LibWin32::IDtcLuRecovery
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
end
struct LibWin32::IDtcLuRecoveryFactory
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create(puclupair : UInt8*, cblupair : UInt32, pprecovery : IDtcLuRecovery*) : HRESULT
    @lpVtbl.value.create.unsafe_as(Proc(UInt8*, UInt32, IDtcLuRecovery*, HRESULT)).call(puclupair, cblupair, pprecovery)
  end
end
struct LibWin32::IDtcLuRecoveryInitiatedByDtcTransWork
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_log_name_sizes(pcbourlogname : UInt32*, pcbremotelogname : UInt32*) : HRESULT
    @lpVtbl.value.get_log_name_sizes.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pcbourlogname, pcbremotelogname)
  end
  def get_our_xln(pxln : DtcLu_Xln*, pourlogname : UInt8*, premotelogname : UInt8*, pdwprotocol : UInt32*) : HRESULT
    @lpVtbl.value.get_our_xln.unsafe_as(Proc(DtcLu_Xln*, UInt8*, UInt8*, UInt32*, HRESULT)).call(pxln, pourlogname, premotelogname, pdwprotocol)
  end
  def handle_confirmation_from_our_xln(confirmation : DtcLu_Xln_Confirmation) : HRESULT
    @lpVtbl.value.handle_confirmation_from_our_xln.unsafe_as(Proc(DtcLu_Xln_Confirmation, HRESULT)).call(confirmation)
  end
  def handle_their_xln_response(xln : DtcLu_Xln, premotelogname : UInt8*, cbremotelogname : UInt32, dwprotocol : UInt32, pconfirmation : DtcLu_Xln_Confirmation*) : HRESULT
    @lpVtbl.value.handle_their_xln_response.unsafe_as(Proc(DtcLu_Xln, UInt8*, UInt32, UInt32, DtcLu_Xln_Confirmation*, HRESULT)).call(xln, premotelogname, cbremotelogname, dwprotocol, pconfirmation)
  end
  def handle_error_from_our_xln(error : DtcLu_Xln_Error) : HRESULT
    @lpVtbl.value.handle_error_from_our_xln.unsafe_as(Proc(DtcLu_Xln_Error, HRESULT)).call(error)
  end
  def check_for_compare_states(fcomparestates : LibC::BOOL*) : HRESULT
    @lpVtbl.value.check_for_compare_states.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(fcomparestates)
  end
  def get_our_trans_id_size(pcbourtransid : UInt32*) : HRESULT
    @lpVtbl.value.get_our_trans_id_size.unsafe_as(Proc(UInt32*, HRESULT)).call(pcbourtransid)
  end
  def get_our_compare_states(pourtransid : UInt8*, pcomparestate : DtcLu_CompareState*) : HRESULT
    @lpVtbl.value.get_our_compare_states.unsafe_as(Proc(UInt8*, DtcLu_CompareState*, HRESULT)).call(pourtransid, pcomparestate)
  end
  def handle_their_compare_states_response(comparestate : DtcLu_CompareState, pconfirmation : DtcLu_CompareStates_Confirmation*) : HRESULT
    @lpVtbl.value.handle_their_compare_states_response.unsafe_as(Proc(DtcLu_CompareState, DtcLu_CompareStates_Confirmation*, HRESULT)).call(comparestate, pconfirmation)
  end
  def handle_error_from_our_compare_states(error : DtcLu_CompareStates_Error) : HRESULT
    @lpVtbl.value.handle_error_from_our_compare_states.unsafe_as(Proc(DtcLu_CompareStates_Error, HRESULT)).call(error)
  end
  def conversation_lost : HRESULT
    @lpVtbl.value.conversation_lost.unsafe_as(Proc(HRESULT)).call
  end
  def get_recovery_seq_num(plrecoveryseqnum : Int32*) : HRESULT
    @lpVtbl.value.get_recovery_seq_num.unsafe_as(Proc(Int32*, HRESULT)).call(plrecoveryseqnum)
  end
  def obsolete_recovery_seq_num(lnewrecoveryseqnum : Int32) : HRESULT
    @lpVtbl.value.obsolete_recovery_seq_num.unsafe_as(Proc(Int32, HRESULT)).call(lnewrecoveryseqnum)
  end
end
struct LibWin32::IDtcLuRecoveryInitiatedByDtcStatusWork
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def handle_check_lu_status(lrecoveryseqnum : Int32) : HRESULT
    @lpVtbl.value.handle_check_lu_status.unsafe_as(Proc(Int32, HRESULT)).call(lrecoveryseqnum)
  end
end
struct LibWin32::IDtcLuRecoveryInitiatedByDtc
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_work(pwork : DtcLu_LocalRecovery_Work*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_work.unsafe_as(Proc(DtcLu_LocalRecovery_Work*, Void**, HRESULT)).call(pwork, ppv)
  end
end
struct LibWin32::IDtcLuRecoveryInitiatedByLuWork
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def handle_their_xln(lrecoveryseqnum : Int32, xln : DtcLu_Xln, premotelogname : UInt8*, cbremotelogname : UInt32, pourlogname : UInt8*, cbourlogname : UInt32, dwprotocol : UInt32, presponse : DtcLu_Xln_Response*) : HRESULT
    @lpVtbl.value.handle_their_xln.unsafe_as(Proc(Int32, DtcLu_Xln, UInt8*, UInt32, UInt8*, UInt32, UInt32, DtcLu_Xln_Response*, HRESULT)).call(lrecoveryseqnum, xln, premotelogname, cbremotelogname, pourlogname, cbourlogname, dwprotocol, presponse)
  end
  def get_our_log_name_size(pcbourlogname : UInt32*) : HRESULT
    @lpVtbl.value.get_our_log_name_size.unsafe_as(Proc(UInt32*, HRESULT)).call(pcbourlogname)
  end
  def get_our_xln(pxln : DtcLu_Xln*, pourlogname : UInt8*, pdwprotocol : UInt32*) : HRESULT
    @lpVtbl.value.get_our_xln.unsafe_as(Proc(DtcLu_Xln*, UInt8*, UInt32*, HRESULT)).call(pxln, pourlogname, pdwprotocol)
  end
  def handle_confirmation_of_our_xln(confirmation : DtcLu_Xln_Confirmation) : HRESULT
    @lpVtbl.value.handle_confirmation_of_our_xln.unsafe_as(Proc(DtcLu_Xln_Confirmation, HRESULT)).call(confirmation)
  end
  def handle_their_compare_states(premotetransid : UInt8*, cbremotetransid : UInt32, comparestate : DtcLu_CompareState, presponse : DtcLu_CompareStates_Response*, pcomparestate : DtcLu_CompareState*) : HRESULT
    @lpVtbl.value.handle_their_compare_states.unsafe_as(Proc(UInt8*, UInt32, DtcLu_CompareState, DtcLu_CompareStates_Response*, DtcLu_CompareState*, HRESULT)).call(premotetransid, cbremotetransid, comparestate, presponse, pcomparestate)
  end
  def handle_confirmation_of_our_compare_states(confirmation : DtcLu_CompareStates_Confirmation) : HRESULT
    @lpVtbl.value.handle_confirmation_of_our_compare_states.unsafe_as(Proc(DtcLu_CompareStates_Confirmation, HRESULT)).call(confirmation)
  end
  def handle_error_from_our_compare_states(error : DtcLu_CompareStates_Error) : HRESULT
    @lpVtbl.value.handle_error_from_our_compare_states.unsafe_as(Proc(DtcLu_CompareStates_Error, HRESULT)).call(error)
  end
  def conversation_lost : HRESULT
    @lpVtbl.value.conversation_lost.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IDtcLuRecoveryInitiatedByLu
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_object_to_handle_work_from_lu(ppwork : IDtcLuRecoveryInitiatedByLuWork*) : HRESULT
    @lpVtbl.value.get_object_to_handle_work_from_lu.unsafe_as(Proc(IDtcLuRecoveryInitiatedByLuWork*, HRESULT)).call(ppwork)
  end
end
struct LibWin32::IDtcLuRmEnlistment
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def unplug(fconversationlost : LibC::BOOL) : HRESULT
    @lpVtbl.value.unplug.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fconversationlost)
  end
  def backed_out : HRESULT
    @lpVtbl.value.backed_out.unsafe_as(Proc(HRESULT)).call
  end
  def back_out : HRESULT
    @lpVtbl.value.back_out.unsafe_as(Proc(HRESULT)).call
  end
  def committed : HRESULT
    @lpVtbl.value.committed.unsafe_as(Proc(HRESULT)).call
  end
  def forget : HRESULT
    @lpVtbl.value.forget.unsafe_as(Proc(HRESULT)).call
  end
  def request_commit : HRESULT
    @lpVtbl.value.request_commit.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IDtcLuRmEnlistmentSink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def ack_unplug : HRESULT
    @lpVtbl.value.ack_unplug.unsafe_as(Proc(HRESULT)).call
  end
  def tm_down : HRESULT
    @lpVtbl.value.tm_down.unsafe_as(Proc(HRESULT)).call
  end
  def session_lost : HRESULT
    @lpVtbl.value.session_lost.unsafe_as(Proc(HRESULT)).call
  end
  def backed_out : HRESULT
    @lpVtbl.value.backed_out.unsafe_as(Proc(HRESULT)).call
  end
  def back_out : HRESULT
    @lpVtbl.value.back_out.unsafe_as(Proc(HRESULT)).call
  end
  def committed : HRESULT
    @lpVtbl.value.committed.unsafe_as(Proc(HRESULT)).call
  end
  def forget : HRESULT
    @lpVtbl.value.forget.unsafe_as(Proc(HRESULT)).call
  end
  def prepare : HRESULT
    @lpVtbl.value.prepare.unsafe_as(Proc(HRESULT)).call
  end
  def request_commit : HRESULT
    @lpVtbl.value.request_commit.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IDtcLuRmEnlistmentFactory
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create(puclupair : UInt8*, cblupair : UInt32, pitransaction : ITransaction, ptransid : UInt8*, cbtransid : UInt32, prmenlistmentsink : IDtcLuRmEnlistmentSink, pprmenlistment : IDtcLuRmEnlistment*) : HRESULT
    @lpVtbl.value.create.unsafe_as(Proc(UInt8*, UInt32, ITransaction, UInt8*, UInt32, IDtcLuRmEnlistmentSink, IDtcLuRmEnlistment*, HRESULT)).call(puclupair, cblupair, pitransaction, ptransid, cbtransid, prmenlistmentsink, pprmenlistment)
  end
end
struct LibWin32::IDtcLuSubordinateDtc
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def unplug(fconversationlost : LibC::BOOL) : HRESULT
    @lpVtbl.value.unplug.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fconversationlost)
  end
  def backed_out : HRESULT
    @lpVtbl.value.backed_out.unsafe_as(Proc(HRESULT)).call
  end
  def back_out : HRESULT
    @lpVtbl.value.back_out.unsafe_as(Proc(HRESULT)).call
  end
  def committed : HRESULT
    @lpVtbl.value.committed.unsafe_as(Proc(HRESULT)).call
  end
  def forget : HRESULT
    @lpVtbl.value.forget.unsafe_as(Proc(HRESULT)).call
  end
  def prepare : HRESULT
    @lpVtbl.value.prepare.unsafe_as(Proc(HRESULT)).call
  end
  def request_commit : HRESULT
    @lpVtbl.value.request_commit.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IDtcLuSubordinateDtcSink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def ack_unplug : HRESULT
    @lpVtbl.value.ack_unplug.unsafe_as(Proc(HRESULT)).call
  end
  def tm_down : HRESULT
    @lpVtbl.value.tm_down.unsafe_as(Proc(HRESULT)).call
  end
  def session_lost : HRESULT
    @lpVtbl.value.session_lost.unsafe_as(Proc(HRESULT)).call
  end
  def backed_out : HRESULT
    @lpVtbl.value.backed_out.unsafe_as(Proc(HRESULT)).call
  end
  def back_out : HRESULT
    @lpVtbl.value.back_out.unsafe_as(Proc(HRESULT)).call
  end
  def committed : HRESULT
    @lpVtbl.value.committed.unsafe_as(Proc(HRESULT)).call
  end
  def forget : HRESULT
    @lpVtbl.value.forget.unsafe_as(Proc(HRESULT)).call
  end
  def request_commit : HRESULT
    @lpVtbl.value.request_commit.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IDtcLuSubordinateDtcFactory
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create(puclupair : UInt8*, cblupair : UInt32, punktransactionouter : IUnknown, isolevel : Int32, isoflags : UInt32, poptions : ITransactionOptions, pptransaction : ITransaction*, ptransid : UInt8*, cbtransid : UInt32, psubordinatedtcsink : IDtcLuSubordinateDtcSink, ppsubordinatedtc : IDtcLuSubordinateDtc*) : HRESULT
    @lpVtbl.value.create.unsafe_as(Proc(UInt8*, UInt32, IUnknown, Int32, UInt32, ITransactionOptions, ITransaction*, UInt8*, UInt32, IDtcLuSubordinateDtcSink, IDtcLuSubordinateDtc*, HRESULT)).call(puclupair, cblupair, punktransactionouter, isolevel, isoflags, poptions, pptransaction, ptransid, cbtransid, psubordinatedtcsink, ppsubordinatedtc)
  end
end
