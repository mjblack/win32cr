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
    query_interface : Proc(ITransaction*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITransaction*, UInt32)
    release : Proc(ITransaction*, UInt32)
    commit : Proc(ITransaction*, LibC::BOOL, UInt32, UInt32, HRESULT)
    abort : Proc(ITransaction*, BOID*, LibC::BOOL, LibC::BOOL, HRESULT)
    get_transaction_info : Proc(ITransaction*, XACTTRANSINFO*, HRESULT)
  end

  struct ITransaction
    lpVtbl : ITransactionVTbl*
  end

  struct ITransactionClonerVTbl
    query_interface : Proc(ITransactionCloner*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITransactionCloner*, UInt32)
    release : Proc(ITransactionCloner*, UInt32)
    commit : Proc(ITransactionCloner*, LibC::BOOL, UInt32, UInt32, HRESULT)
    abort : Proc(ITransactionCloner*, BOID*, LibC::BOOL, LibC::BOOL, HRESULT)
    get_transaction_info : Proc(ITransactionCloner*, XACTTRANSINFO*, HRESULT)
    clone_with_commit_disabled : Proc(ITransactionCloner*, ITransaction*, HRESULT)
  end

  struct ITransactionCloner
    lpVtbl : ITransactionClonerVTbl*
  end

  struct ITransaction2VTbl
    query_interface : Proc(ITransaction2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITransaction2*, UInt32)
    release : Proc(ITransaction2*, UInt32)
    commit : Proc(ITransaction2*, LibC::BOOL, UInt32, UInt32, HRESULT)
    abort : Proc(ITransaction2*, BOID*, LibC::BOOL, LibC::BOOL, HRESULT)
    get_transaction_info : Proc(ITransaction2*, XACTTRANSINFO*, HRESULT)
    clone_with_commit_disabled : Proc(ITransaction2*, ITransaction*, HRESULT)
    get_transaction_info2 : Proc(ITransaction2*, XACTTRANSINFO*, HRESULT)
  end

  struct ITransaction2
    lpVtbl : ITransaction2VTbl*
  end

  struct ITransactionDispenserVTbl
    query_interface : Proc(ITransactionDispenser*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITransactionDispenser*, UInt32)
    release : Proc(ITransactionDispenser*, UInt32)
    get_options_object : Proc(ITransactionDispenser*, ITransactionOptions*, HRESULT)
    begin_transaction : Proc(ITransactionDispenser*, IUnknown, Int32, UInt32, ITransactionOptions, ITransaction*, HRESULT)
  end

  struct ITransactionDispenser
    lpVtbl : ITransactionDispenserVTbl*
  end

  struct ITransactionOptionsVTbl
    query_interface : Proc(ITransactionOptions*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITransactionOptions*, UInt32)
    release : Proc(ITransactionOptions*, UInt32)
    set_options : Proc(ITransactionOptions*, XACTOPT*, HRESULT)
    get_options : Proc(ITransactionOptions*, XACTOPT*, HRESULT)
  end

  struct ITransactionOptions
    lpVtbl : ITransactionOptionsVTbl*
  end

  struct ITransactionOutcomeEventsVTbl
    query_interface : Proc(ITransactionOutcomeEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITransactionOutcomeEvents*, UInt32)
    release : Proc(ITransactionOutcomeEvents*, UInt32)
    committed : Proc(ITransactionOutcomeEvents*, LibC::BOOL, BOID*, HRESULT, HRESULT)
    aborted : Proc(ITransactionOutcomeEvents*, BOID*, LibC::BOOL, BOID*, HRESULT, HRESULT)
    heuristic_decision : Proc(ITransactionOutcomeEvents*, UInt32, BOID*, HRESULT, HRESULT)
    indoubt : Proc(ITransactionOutcomeEvents*, HRESULT)
  end

  struct ITransactionOutcomeEvents
    lpVtbl : ITransactionOutcomeEventsVTbl*
  end

  struct ITmNodeNameVTbl
    query_interface : Proc(ITmNodeName*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITmNodeName*, UInt32)
    release : Proc(ITmNodeName*, UInt32)
    get_node_name_size : Proc(ITmNodeName*, UInt32*, HRESULT)
    get_node_name : Proc(ITmNodeName*, UInt32, LibC::LPWSTR, HRESULT)
  end

  struct ITmNodeName
    lpVtbl : ITmNodeNameVTbl*
  end

  struct IKernelTransactionVTbl
    query_interface : Proc(IKernelTransaction*, Guid*, Void**, HRESULT)
    add_ref : Proc(IKernelTransaction*, UInt32)
    release : Proc(IKernelTransaction*, UInt32)
    get_handle : Proc(IKernelTransaction*, LibC::HANDLE*, HRESULT)
  end

  struct IKernelTransaction
    lpVtbl : IKernelTransactionVTbl*
  end

  struct ITransactionResourceAsyncVTbl
    query_interface : Proc(ITransactionResourceAsync*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITransactionResourceAsync*, UInt32)
    release : Proc(ITransactionResourceAsync*, UInt32)
    prepare_request : Proc(ITransactionResourceAsync*, LibC::BOOL, UInt32, LibC::BOOL, LibC::BOOL, HRESULT)
    commit_request : Proc(ITransactionResourceAsync*, UInt32, BOID*, HRESULT)
    abort_request : Proc(ITransactionResourceAsync*, BOID*, LibC::BOOL, BOID*, HRESULT)
    tm_down : Proc(ITransactionResourceAsync*, HRESULT)
  end

  struct ITransactionResourceAsync
    lpVtbl : ITransactionResourceAsyncVTbl*
  end

  struct ITransactionLastResourceAsyncVTbl
    query_interface : Proc(ITransactionLastResourceAsync*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITransactionLastResourceAsync*, UInt32)
    release : Proc(ITransactionLastResourceAsync*, UInt32)
    delegate_commit : Proc(ITransactionLastResourceAsync*, UInt32, HRESULT)
    forget_request : Proc(ITransactionLastResourceAsync*, BOID*, HRESULT)
  end

  struct ITransactionLastResourceAsync
    lpVtbl : ITransactionLastResourceAsyncVTbl*
  end

  struct ITransactionResourceVTbl
    query_interface : Proc(ITransactionResource*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITransactionResource*, UInt32)
    release : Proc(ITransactionResource*, UInt32)
    prepare_request : Proc(ITransactionResource*, LibC::BOOL, UInt32, LibC::BOOL, LibC::BOOL, HRESULT)
    commit_request : Proc(ITransactionResource*, UInt32, BOID*, HRESULT)
    abort_request : Proc(ITransactionResource*, BOID*, LibC::BOOL, BOID*, HRESULT)
    tm_down : Proc(ITransactionResource*, HRESULT)
  end

  struct ITransactionResource
    lpVtbl : ITransactionResourceVTbl*
  end

  struct ITransactionEnlistmentAsyncVTbl
    query_interface : Proc(ITransactionEnlistmentAsync*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITransactionEnlistmentAsync*, UInt32)
    release : Proc(ITransactionEnlistmentAsync*, UInt32)
    prepare_request_done : Proc(ITransactionEnlistmentAsync*, HRESULT, IMoniker, BOID*, HRESULT)
    commit_request_done : Proc(ITransactionEnlistmentAsync*, HRESULT, HRESULT)
    abort_request_done : Proc(ITransactionEnlistmentAsync*, HRESULT, HRESULT)
  end

  struct ITransactionEnlistmentAsync
    lpVtbl : ITransactionEnlistmentAsyncVTbl*
  end

  struct ITransactionLastEnlistmentAsyncVTbl
    query_interface : Proc(ITransactionLastEnlistmentAsync*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITransactionLastEnlistmentAsync*, UInt32)
    release : Proc(ITransactionLastEnlistmentAsync*, UInt32)
    transaction_outcome : Proc(ITransactionLastEnlistmentAsync*, XACTSTAT, BOID*, HRESULT)
  end

  struct ITransactionLastEnlistmentAsync
    lpVtbl : ITransactionLastEnlistmentAsyncVTbl*
  end

  struct ITransactionExportFactoryVTbl
    query_interface : Proc(ITransactionExportFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITransactionExportFactory*, UInt32)
    release : Proc(ITransactionExportFactory*, UInt32)
    get_remote_class_id : Proc(ITransactionExportFactory*, Guid*, HRESULT)
    create : Proc(ITransactionExportFactory*, UInt32, UInt8*, ITransactionExport*, HRESULT)
  end

  struct ITransactionExportFactory
    lpVtbl : ITransactionExportFactoryVTbl*
  end

  struct ITransactionImportWhereaboutsVTbl
    query_interface : Proc(ITransactionImportWhereabouts*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITransactionImportWhereabouts*, UInt32)
    release : Proc(ITransactionImportWhereabouts*, UInt32)
    get_whereabouts_size : Proc(ITransactionImportWhereabouts*, UInt32*, HRESULT)
    get_whereabouts : Proc(ITransactionImportWhereabouts*, UInt32, UInt8*, UInt32*, HRESULT)
  end

  struct ITransactionImportWhereabouts
    lpVtbl : ITransactionImportWhereaboutsVTbl*
  end

  struct ITransactionExportVTbl
    query_interface : Proc(ITransactionExport*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITransactionExport*, UInt32)
    release : Proc(ITransactionExport*, UInt32)
    export : Proc(ITransactionExport*, IUnknown, UInt32*, HRESULT)
    get_transaction_cookie : Proc(ITransactionExport*, IUnknown, UInt32, UInt8*, UInt32*, HRESULT)
  end

  struct ITransactionExport
    lpVtbl : ITransactionExportVTbl*
  end

  struct ITransactionImportVTbl
    query_interface : Proc(ITransactionImport*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITransactionImport*, UInt32)
    release : Proc(ITransactionImport*, UInt32)
    import : Proc(ITransactionImport*, UInt32, UInt8*, Guid*, Void**, HRESULT)
  end

  struct ITransactionImport
    lpVtbl : ITransactionImportVTbl*
  end

  struct ITipTransactionVTbl
    query_interface : Proc(ITipTransaction*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITipTransaction*, UInt32)
    release : Proc(ITipTransaction*, UInt32)
    push : Proc(ITipTransaction*, UInt8*, PSTR*, HRESULT)
    get_transaction_url : Proc(ITipTransaction*, PSTR*, HRESULT)
  end

  struct ITipTransaction
    lpVtbl : ITipTransactionVTbl*
  end

  struct ITipHelperVTbl
    query_interface : Proc(ITipHelper*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITipHelper*, UInt32)
    release : Proc(ITipHelper*, UInt32)
    pull : Proc(ITipHelper*, UInt8*, ITransaction*, HRESULT)
    pull_async : Proc(ITipHelper*, UInt8*, ITipPullSink, ITransaction*, HRESULT)
    get_local_tm_url : Proc(ITipHelper*, UInt8**, HRESULT)
  end

  struct ITipHelper
    lpVtbl : ITipHelperVTbl*
  end

  struct ITipPullSinkVTbl
    query_interface : Proc(ITipPullSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITipPullSink*, UInt32)
    release : Proc(ITipPullSink*, UInt32)
    pull_complete : Proc(ITipPullSink*, HRESULT, HRESULT)
  end

  struct ITipPullSink
    lpVtbl : ITipPullSinkVTbl*
  end

  struct IDtcNetworkAccessConfigVTbl
    query_interface : Proc(IDtcNetworkAccessConfig*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDtcNetworkAccessConfig*, UInt32)
    release : Proc(IDtcNetworkAccessConfig*, UInt32)
    get_any_network_access : Proc(IDtcNetworkAccessConfig*, LibC::BOOL*, HRESULT)
    set_any_network_access : Proc(IDtcNetworkAccessConfig*, LibC::BOOL, HRESULT)
    get_network_administration_access : Proc(IDtcNetworkAccessConfig*, LibC::BOOL*, HRESULT)
    set_network_administration_access : Proc(IDtcNetworkAccessConfig*, LibC::BOOL, HRESULT)
    get_network_transaction_access : Proc(IDtcNetworkAccessConfig*, LibC::BOOL*, HRESULT)
    set_network_transaction_access : Proc(IDtcNetworkAccessConfig*, LibC::BOOL, HRESULT)
    get_network_client_access : Proc(IDtcNetworkAccessConfig*, LibC::BOOL*, HRESULT)
    set_network_client_access : Proc(IDtcNetworkAccessConfig*, LibC::BOOL, HRESULT)
    get_network_tip_access : Proc(IDtcNetworkAccessConfig*, LibC::BOOL*, HRESULT)
    set_network_tip_access : Proc(IDtcNetworkAccessConfig*, LibC::BOOL, HRESULT)
    get_xa_access : Proc(IDtcNetworkAccessConfig*, LibC::BOOL*, HRESULT)
    set_xa_access : Proc(IDtcNetworkAccessConfig*, LibC::BOOL, HRESULT)
    restart_dtc_service : Proc(IDtcNetworkAccessConfig*, HRESULT)
  end

  struct IDtcNetworkAccessConfig
    lpVtbl : IDtcNetworkAccessConfigVTbl*
  end

  struct IDtcNetworkAccessConfig2VTbl
    query_interface : Proc(IDtcNetworkAccessConfig2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDtcNetworkAccessConfig2*, UInt32)
    release : Proc(IDtcNetworkAccessConfig2*, UInt32)
    get_any_network_access : Proc(IDtcNetworkAccessConfig2*, LibC::BOOL*, HRESULT)
    set_any_network_access : Proc(IDtcNetworkAccessConfig2*, LibC::BOOL, HRESULT)
    get_network_administration_access : Proc(IDtcNetworkAccessConfig2*, LibC::BOOL*, HRESULT)
    set_network_administration_access : Proc(IDtcNetworkAccessConfig2*, LibC::BOOL, HRESULT)
    get_network_transaction_access : Proc(IDtcNetworkAccessConfig2*, LibC::BOOL*, HRESULT)
    set_network_transaction_access : Proc(IDtcNetworkAccessConfig2*, LibC::BOOL, HRESULT)
    get_network_client_access : Proc(IDtcNetworkAccessConfig2*, LibC::BOOL*, HRESULT)
    set_network_client_access : Proc(IDtcNetworkAccessConfig2*, LibC::BOOL, HRESULT)
    get_network_tip_access : Proc(IDtcNetworkAccessConfig2*, LibC::BOOL*, HRESULT)
    set_network_tip_access : Proc(IDtcNetworkAccessConfig2*, LibC::BOOL, HRESULT)
    get_xa_access : Proc(IDtcNetworkAccessConfig2*, LibC::BOOL*, HRESULT)
    set_xa_access : Proc(IDtcNetworkAccessConfig2*, LibC::BOOL, HRESULT)
    restart_dtc_service : Proc(IDtcNetworkAccessConfig2*, HRESULT)
    get_network_inbound_access : Proc(IDtcNetworkAccessConfig2*, LibC::BOOL*, HRESULT)
    get_network_outbound_access : Proc(IDtcNetworkAccessConfig2*, LibC::BOOL*, HRESULT)
    set_network_inbound_access : Proc(IDtcNetworkAccessConfig2*, LibC::BOOL, HRESULT)
    set_network_outbound_access : Proc(IDtcNetworkAccessConfig2*, LibC::BOOL, HRESULT)
    get_authentication_level : Proc(IDtcNetworkAccessConfig2*, AUTHENTICATION_LEVEL*, HRESULT)
    set_authentication_level : Proc(IDtcNetworkAccessConfig2*, AUTHENTICATION_LEVEL, HRESULT)
  end

  struct IDtcNetworkAccessConfig2
    lpVtbl : IDtcNetworkAccessConfig2VTbl*
  end

  struct IDtcNetworkAccessConfig3VTbl
    query_interface : Proc(IDtcNetworkAccessConfig3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDtcNetworkAccessConfig3*, UInt32)
    release : Proc(IDtcNetworkAccessConfig3*, UInt32)
    get_any_network_access : Proc(IDtcNetworkAccessConfig3*, LibC::BOOL*, HRESULT)
    set_any_network_access : Proc(IDtcNetworkAccessConfig3*, LibC::BOOL, HRESULT)
    get_network_administration_access : Proc(IDtcNetworkAccessConfig3*, LibC::BOOL*, HRESULT)
    set_network_administration_access : Proc(IDtcNetworkAccessConfig3*, LibC::BOOL, HRESULT)
    get_network_transaction_access : Proc(IDtcNetworkAccessConfig3*, LibC::BOOL*, HRESULT)
    set_network_transaction_access : Proc(IDtcNetworkAccessConfig3*, LibC::BOOL, HRESULT)
    get_network_client_access : Proc(IDtcNetworkAccessConfig3*, LibC::BOOL*, HRESULT)
    set_network_client_access : Proc(IDtcNetworkAccessConfig3*, LibC::BOOL, HRESULT)
    get_network_tip_access : Proc(IDtcNetworkAccessConfig3*, LibC::BOOL*, HRESULT)
    set_network_tip_access : Proc(IDtcNetworkAccessConfig3*, LibC::BOOL, HRESULT)
    get_xa_access : Proc(IDtcNetworkAccessConfig3*, LibC::BOOL*, HRESULT)
    set_xa_access : Proc(IDtcNetworkAccessConfig3*, LibC::BOOL, HRESULT)
    restart_dtc_service : Proc(IDtcNetworkAccessConfig3*, HRESULT)
    get_network_inbound_access : Proc(IDtcNetworkAccessConfig3*, LibC::BOOL*, HRESULT)
    get_network_outbound_access : Proc(IDtcNetworkAccessConfig3*, LibC::BOOL*, HRESULT)
    set_network_inbound_access : Proc(IDtcNetworkAccessConfig3*, LibC::BOOL, HRESULT)
    set_network_outbound_access : Proc(IDtcNetworkAccessConfig3*, LibC::BOOL, HRESULT)
    get_authentication_level : Proc(IDtcNetworkAccessConfig3*, AUTHENTICATION_LEVEL*, HRESULT)
    set_authentication_level : Proc(IDtcNetworkAccessConfig3*, AUTHENTICATION_LEVEL, HRESULT)
    get_lu_access : Proc(IDtcNetworkAccessConfig3*, LibC::BOOL*, HRESULT)
    set_lu_access : Proc(IDtcNetworkAccessConfig3*, LibC::BOOL, HRESULT)
  end

  struct IDtcNetworkAccessConfig3
    lpVtbl : IDtcNetworkAccessConfig3VTbl*
  end

  struct IDtcToXaMapperVTbl
    query_interface : Proc(IDtcToXaMapper*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDtcToXaMapper*, UInt32)
    release : Proc(IDtcToXaMapper*, UInt32)
    request_new_resource_manager : Proc(IDtcToXaMapper*, PSTR, PSTR, UInt32*, HRESULT)
    translate_trid_to_xid : Proc(IDtcToXaMapper*, UInt32*, UInt32, Xid_t*, HRESULT)
    enlist_resource_manager : Proc(IDtcToXaMapper*, UInt32, UInt32*, HRESULT)
    release_resource_manager : Proc(IDtcToXaMapper*, UInt32, HRESULT)
  end

  struct IDtcToXaMapper
    lpVtbl : IDtcToXaMapperVTbl*
  end

  struct IDtcToXaHelperFactoryVTbl
    query_interface : Proc(IDtcToXaHelperFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDtcToXaHelperFactory*, UInt32)
    release : Proc(IDtcToXaHelperFactory*, UInt32)
    create : Proc(IDtcToXaHelperFactory*, PSTR, PSTR, Guid*, IDtcToXaHelper*, HRESULT)
  end

  struct IDtcToXaHelperFactory
    lpVtbl : IDtcToXaHelperFactoryVTbl*
  end

  struct IDtcToXaHelperVTbl
    query_interface : Proc(IDtcToXaHelper*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDtcToXaHelper*, UInt32)
    release : Proc(IDtcToXaHelper*, UInt32)
    close : Proc(IDtcToXaHelper*, LibC::BOOL, HRESULT)
    translate_trid_to_xid : Proc(IDtcToXaHelper*, ITransaction, Guid*, Xid_t*, HRESULT)
  end

  struct IDtcToXaHelper
    lpVtbl : IDtcToXaHelperVTbl*
  end

  struct IDtcToXaHelperSinglePipeVTbl
    query_interface : Proc(IDtcToXaHelperSinglePipe*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDtcToXaHelperSinglePipe*, UInt32)
    release : Proc(IDtcToXaHelperSinglePipe*, UInt32)
    xarm_create : Proc(IDtcToXaHelperSinglePipe*, PSTR, PSTR, UInt32*, HRESULT)
    convert_trid_to_xid : Proc(IDtcToXaHelperSinglePipe*, UInt32*, UInt32, Xid_t*, HRESULT)
    enlist_with_rm : Proc(IDtcToXaHelperSinglePipe*, UInt32, ITransaction, ITransactionResourceAsync, ITransactionEnlistmentAsync*, HRESULT)
    release_rm_cookie : Proc(IDtcToXaHelperSinglePipe*, UInt32, LibC::BOOL, Void)
  end

  struct IDtcToXaHelperSinglePipe
    lpVtbl : IDtcToXaHelperSinglePipeVTbl*
  end

  struct IXATransLookupVTbl
    query_interface : Proc(IXATransLookup*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXATransLookup*, UInt32)
    release : Proc(IXATransLookup*, UInt32)
    lookup : Proc(IXATransLookup*, ITransaction*, HRESULT)
  end

  struct IXATransLookup
    lpVtbl : IXATransLookupVTbl*
  end

  struct IXATransLookup2VTbl
    query_interface : Proc(IXATransLookup2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXATransLookup2*, UInt32)
    release : Proc(IXATransLookup2*, UInt32)
    lookup : Proc(IXATransLookup2*, Xid_t*, ITransaction*, HRESULT)
  end

  struct IXATransLookup2
    lpVtbl : IXATransLookup2VTbl*
  end

  struct IResourceManagerSinkVTbl
    query_interface : Proc(IResourceManagerSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(IResourceManagerSink*, UInt32)
    release : Proc(IResourceManagerSink*, UInt32)
    tm_down : Proc(IResourceManagerSink*, HRESULT)
  end

  struct IResourceManagerSink
    lpVtbl : IResourceManagerSinkVTbl*
  end

  struct IResourceManagerVTbl
    query_interface : Proc(IResourceManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IResourceManager*, UInt32)
    release : Proc(IResourceManager*, UInt32)
    enlist : Proc(IResourceManager*, ITransaction, ITransactionResourceAsync, BOID*, Int32*, ITransactionEnlistmentAsync*, HRESULT)
    reenlist : Proc(IResourceManager*, UInt8*, UInt32, UInt32, XACTSTAT*, HRESULT)
    reenlistment_complete : Proc(IResourceManager*, HRESULT)
    get_distributed_transaction_manager : Proc(IResourceManager*, Guid*, Void**, HRESULT)
  end

  struct IResourceManager
    lpVtbl : IResourceManagerVTbl*
  end

  struct ILastResourceManagerVTbl
    query_interface : Proc(ILastResourceManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(ILastResourceManager*, UInt32)
    release : Proc(ILastResourceManager*, UInt32)
    transaction_committed : Proc(ILastResourceManager*, UInt8*, UInt32, HRESULT)
    recovery_done : Proc(ILastResourceManager*, HRESULT)
  end

  struct ILastResourceManager
    lpVtbl : ILastResourceManagerVTbl*
  end

  struct IResourceManager2VTbl
    query_interface : Proc(IResourceManager2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IResourceManager2*, UInt32)
    release : Proc(IResourceManager2*, UInt32)
    enlist : Proc(IResourceManager2*, ITransaction, ITransactionResourceAsync, BOID*, Int32*, ITransactionEnlistmentAsync*, HRESULT)
    reenlist : Proc(IResourceManager2*, UInt8*, UInt32, UInt32, XACTSTAT*, HRESULT)
    reenlistment_complete : Proc(IResourceManager2*, HRESULT)
    get_distributed_transaction_manager : Proc(IResourceManager2*, Guid*, Void**, HRESULT)
    enlist2 : Proc(IResourceManager2*, ITransaction, ITransactionResourceAsync, BOID*, Int32*, Xid_t*, ITransactionEnlistmentAsync*, HRESULT)
    reenlist2 : Proc(IResourceManager2*, Xid_t*, UInt32, XACTSTAT*, HRESULT)
  end

  struct IResourceManager2
    lpVtbl : IResourceManager2VTbl*
  end

  struct IResourceManagerRejoinableVTbl
    query_interface : Proc(IResourceManagerRejoinable*, Guid*, Void**, HRESULT)
    add_ref : Proc(IResourceManagerRejoinable*, UInt32)
    release : Proc(IResourceManagerRejoinable*, UInt32)
    enlist : Proc(IResourceManagerRejoinable*, ITransaction, ITransactionResourceAsync, BOID*, Int32*, ITransactionEnlistmentAsync*, HRESULT)
    reenlist : Proc(IResourceManagerRejoinable*, UInt8*, UInt32, UInt32, XACTSTAT*, HRESULT)
    reenlistment_complete : Proc(IResourceManagerRejoinable*, HRESULT)
    get_distributed_transaction_manager : Proc(IResourceManagerRejoinable*, Guid*, Void**, HRESULT)
    enlist2 : Proc(IResourceManagerRejoinable*, ITransaction, ITransactionResourceAsync, BOID*, Int32*, Xid_t*, ITransactionEnlistmentAsync*, HRESULT)
    reenlist2 : Proc(IResourceManagerRejoinable*, Xid_t*, UInt32, XACTSTAT*, HRESULT)
    rejoin : Proc(IResourceManagerRejoinable*, UInt8*, UInt32, UInt32, XACTSTAT*, HRESULT)
  end

  struct IResourceManagerRejoinable
    lpVtbl : IResourceManagerRejoinableVTbl*
  end

  struct IXAConfigVTbl
    query_interface : Proc(IXAConfig*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXAConfig*, UInt32)
    release : Proc(IXAConfig*, UInt32)
    initialize : Proc(IXAConfig*, Guid, HRESULT)
    terminate : Proc(IXAConfig*, HRESULT)
  end

  struct IXAConfig
    lpVtbl : IXAConfigVTbl*
  end

  struct IRMHelperVTbl
    query_interface : Proc(IRMHelper*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRMHelper*, UInt32)
    release : Proc(IRMHelper*, UInt32)
    rm_count : Proc(IRMHelper*, UInt32, HRESULT)
    rm_info : Proc(IRMHelper*, Xa_switch_t*, LibC::BOOL, PSTR, PSTR, Guid, HRESULT)
  end

  struct IRMHelper
    lpVtbl : IRMHelperVTbl*
  end

  struct IXAObtainRMInfoVTbl
    query_interface : Proc(IXAObtainRMInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXAObtainRMInfo*, UInt32)
    release : Proc(IXAObtainRMInfo*, UInt32)
    obtain_rm_info : Proc(IXAObtainRMInfo*, IRMHelper, HRESULT)
  end

  struct IXAObtainRMInfo
    lpVtbl : IXAObtainRMInfoVTbl*
  end

  struct IResourceManagerFactoryVTbl
    query_interface : Proc(IResourceManagerFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IResourceManagerFactory*, UInt32)
    release : Proc(IResourceManagerFactory*, UInt32)
    create : Proc(IResourceManagerFactory*, Guid*, PSTR, IResourceManagerSink, IResourceManager*, HRESULT)
  end

  struct IResourceManagerFactory
    lpVtbl : IResourceManagerFactoryVTbl*
  end

  struct IResourceManagerFactory2VTbl
    query_interface : Proc(IResourceManagerFactory2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IResourceManagerFactory2*, UInt32)
    release : Proc(IResourceManagerFactory2*, UInt32)
    create : Proc(IResourceManagerFactory2*, Guid*, PSTR, IResourceManagerSink, IResourceManager*, HRESULT)
    create_ex : Proc(IResourceManagerFactory2*, Guid*, PSTR, IResourceManagerSink, Guid*, Void**, HRESULT)
  end

  struct IResourceManagerFactory2
    lpVtbl : IResourceManagerFactory2VTbl*
  end

  struct IPrepareInfoVTbl
    query_interface : Proc(IPrepareInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPrepareInfo*, UInt32)
    release : Proc(IPrepareInfo*, UInt32)
    get_prepare_info_size : Proc(IPrepareInfo*, UInt32*, HRESULT)
    get_prepare_info : Proc(IPrepareInfo*, UInt8*, HRESULT)
  end

  struct IPrepareInfo
    lpVtbl : IPrepareInfoVTbl*
  end

  struct IPrepareInfo2VTbl
    query_interface : Proc(IPrepareInfo2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPrepareInfo2*, UInt32)
    release : Proc(IPrepareInfo2*, UInt32)
    get_prepare_info_size : Proc(IPrepareInfo2*, UInt32*, HRESULT)
    get_prepare_info : Proc(IPrepareInfo2*, UInt32, UInt8*, HRESULT)
  end

  struct IPrepareInfo2
    lpVtbl : IPrepareInfo2VTbl*
  end

  struct IGetDispenserVTbl
    query_interface : Proc(IGetDispenser*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGetDispenser*, UInt32)
    release : Proc(IGetDispenser*, UInt32)
    get_dispenser : Proc(IGetDispenser*, Guid*, Void**, HRESULT)
  end

  struct IGetDispenser
    lpVtbl : IGetDispenserVTbl*
  end

  struct ITransactionVoterBallotAsync2VTbl
    query_interface : Proc(ITransactionVoterBallotAsync2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITransactionVoterBallotAsync2*, UInt32)
    release : Proc(ITransactionVoterBallotAsync2*, UInt32)
    vote_request_done : Proc(ITransactionVoterBallotAsync2*, HRESULT, BOID*, HRESULT)
  end

  struct ITransactionVoterBallotAsync2
    lpVtbl : ITransactionVoterBallotAsync2VTbl*
  end

  struct ITransactionVoterNotifyAsync2VTbl
    query_interface : Proc(ITransactionVoterNotifyAsync2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITransactionVoterNotifyAsync2*, UInt32)
    release : Proc(ITransactionVoterNotifyAsync2*, UInt32)
    committed : Proc(ITransactionVoterNotifyAsync2*, LibC::BOOL, BOID*, HRESULT, HRESULT)
    aborted : Proc(ITransactionVoterNotifyAsync2*, BOID*, LibC::BOOL, BOID*, HRESULT, HRESULT)
    heuristic_decision : Proc(ITransactionVoterNotifyAsync2*, UInt32, BOID*, HRESULT, HRESULT)
    indoubt : Proc(ITransactionVoterNotifyAsync2*, HRESULT)
    vote_request : Proc(ITransactionVoterNotifyAsync2*, HRESULT)
  end

  struct ITransactionVoterNotifyAsync2
    lpVtbl : ITransactionVoterNotifyAsync2VTbl*
  end

  struct ITransactionVoterFactory2VTbl
    query_interface : Proc(ITransactionVoterFactory2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITransactionVoterFactory2*, UInt32)
    release : Proc(ITransactionVoterFactory2*, UInt32)
    create : Proc(ITransactionVoterFactory2*, ITransaction, ITransactionVoterNotifyAsync2, ITransactionVoterBallotAsync2*, HRESULT)
  end

  struct ITransactionVoterFactory2
    lpVtbl : ITransactionVoterFactory2VTbl*
  end

  struct ITransactionPhase0EnlistmentAsyncVTbl
    query_interface : Proc(ITransactionPhase0EnlistmentAsync*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITransactionPhase0EnlistmentAsync*, UInt32)
    release : Proc(ITransactionPhase0EnlistmentAsync*, UInt32)
    enable : Proc(ITransactionPhase0EnlistmentAsync*, HRESULT)
    wait_for_enlistment : Proc(ITransactionPhase0EnlistmentAsync*, HRESULT)
    phase0_done : Proc(ITransactionPhase0EnlistmentAsync*, HRESULT)
    unenlist : Proc(ITransactionPhase0EnlistmentAsync*, HRESULT)
    get_transaction : Proc(ITransactionPhase0EnlistmentAsync*, ITransaction*, HRESULT)
  end

  struct ITransactionPhase0EnlistmentAsync
    lpVtbl : ITransactionPhase0EnlistmentAsyncVTbl*
  end

  struct ITransactionPhase0NotifyAsyncVTbl
    query_interface : Proc(ITransactionPhase0NotifyAsync*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITransactionPhase0NotifyAsync*, UInt32)
    release : Proc(ITransactionPhase0NotifyAsync*, UInt32)
    phase0_request : Proc(ITransactionPhase0NotifyAsync*, LibC::BOOL, HRESULT)
    enlist_completed : Proc(ITransactionPhase0NotifyAsync*, HRESULT, HRESULT)
  end

  struct ITransactionPhase0NotifyAsync
    lpVtbl : ITransactionPhase0NotifyAsyncVTbl*
  end

  struct ITransactionPhase0FactoryVTbl
    query_interface : Proc(ITransactionPhase0Factory*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITransactionPhase0Factory*, UInt32)
    release : Proc(ITransactionPhase0Factory*, UInt32)
    create : Proc(ITransactionPhase0Factory*, ITransactionPhase0NotifyAsync, ITransactionPhase0EnlistmentAsync*, HRESULT)
  end

  struct ITransactionPhase0Factory
    lpVtbl : ITransactionPhase0FactoryVTbl*
  end

  struct ITransactionTransmitterVTbl
    query_interface : Proc(ITransactionTransmitter*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITransactionTransmitter*, UInt32)
    release : Proc(ITransactionTransmitter*, UInt32)
    set : Proc(ITransactionTransmitter*, ITransaction, HRESULT)
    get_propagation_token_size : Proc(ITransactionTransmitter*, UInt32*, HRESULT)
    marshal_propagation_token : Proc(ITransactionTransmitter*, UInt32, UInt8*, UInt32*, HRESULT)
    unmarshal_return_token : Proc(ITransactionTransmitter*, UInt32, UInt8*, HRESULT)
    reset : Proc(ITransactionTransmitter*, HRESULT)
  end

  struct ITransactionTransmitter
    lpVtbl : ITransactionTransmitterVTbl*
  end

  struct ITransactionTransmitterFactoryVTbl
    query_interface : Proc(ITransactionTransmitterFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITransactionTransmitterFactory*, UInt32)
    release : Proc(ITransactionTransmitterFactory*, UInt32)
    create : Proc(ITransactionTransmitterFactory*, ITransactionTransmitter*, HRESULT)
  end

  struct ITransactionTransmitterFactory
    lpVtbl : ITransactionTransmitterFactoryVTbl*
  end

  struct ITransactionReceiverVTbl
    query_interface : Proc(ITransactionReceiver*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITransactionReceiver*, UInt32)
    release : Proc(ITransactionReceiver*, UInt32)
    unmarshal_propagation_token : Proc(ITransactionReceiver*, UInt32, UInt8*, ITransaction*, HRESULT)
    get_return_token_size : Proc(ITransactionReceiver*, UInt32*, HRESULT)
    marshal_return_token : Proc(ITransactionReceiver*, UInt32, UInt8*, UInt32*, HRESULT)
    reset : Proc(ITransactionReceiver*, HRESULT)
  end

  struct ITransactionReceiver
    lpVtbl : ITransactionReceiverVTbl*
  end

  struct ITransactionReceiverFactoryVTbl
    query_interface : Proc(ITransactionReceiverFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITransactionReceiverFactory*, UInt32)
    release : Proc(ITransactionReceiverFactory*, UInt32)
    create : Proc(ITransactionReceiverFactory*, ITransactionReceiver*, HRESULT)
  end

  struct ITransactionReceiverFactory
    lpVtbl : ITransactionReceiverFactoryVTbl*
  end

  struct IDtcLuConfigureVTbl
    query_interface : Proc(IDtcLuConfigure*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDtcLuConfigure*, UInt32)
    release : Proc(IDtcLuConfigure*, UInt32)
    add : Proc(IDtcLuConfigure*, UInt8*, UInt32, HRESULT)
    delete : Proc(IDtcLuConfigure*, UInt8*, UInt32, HRESULT)
  end

  struct IDtcLuConfigure
    lpVtbl : IDtcLuConfigureVTbl*
  end

  struct IDtcLuRecoveryVTbl
    query_interface : Proc(IDtcLuRecovery*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDtcLuRecovery*, UInt32)
    release : Proc(IDtcLuRecovery*, UInt32)
  end

  struct IDtcLuRecovery
    lpVtbl : IDtcLuRecoveryVTbl*
  end

  struct IDtcLuRecoveryFactoryVTbl
    query_interface : Proc(IDtcLuRecoveryFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDtcLuRecoveryFactory*, UInt32)
    release : Proc(IDtcLuRecoveryFactory*, UInt32)
    create : Proc(IDtcLuRecoveryFactory*, UInt8*, UInt32, IDtcLuRecovery*, HRESULT)
  end

  struct IDtcLuRecoveryFactory
    lpVtbl : IDtcLuRecoveryFactoryVTbl*
  end

  struct IDtcLuRecoveryInitiatedByDtcTransWorkVTbl
    query_interface : Proc(IDtcLuRecoveryInitiatedByDtcTransWork*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDtcLuRecoveryInitiatedByDtcTransWork*, UInt32)
    release : Proc(IDtcLuRecoveryInitiatedByDtcTransWork*, UInt32)
    get_log_name_sizes : Proc(IDtcLuRecoveryInitiatedByDtcTransWork*, UInt32*, UInt32*, HRESULT)
    get_our_xln : Proc(IDtcLuRecoveryInitiatedByDtcTransWork*, DtcLu_Xln*, UInt8*, UInt8*, UInt32*, HRESULT)
    handle_confirmation_from_our_xln : Proc(IDtcLuRecoveryInitiatedByDtcTransWork*, DtcLu_Xln_Confirmation, HRESULT)
    handle_their_xln_response : Proc(IDtcLuRecoveryInitiatedByDtcTransWork*, DtcLu_Xln, UInt8*, UInt32, UInt32, DtcLu_Xln_Confirmation*, HRESULT)
    handle_error_from_our_xln : Proc(IDtcLuRecoveryInitiatedByDtcTransWork*, DtcLu_Xln_Error, HRESULT)
    check_for_compare_states : Proc(IDtcLuRecoveryInitiatedByDtcTransWork*, LibC::BOOL*, HRESULT)
    get_our_trans_id_size : Proc(IDtcLuRecoveryInitiatedByDtcTransWork*, UInt32*, HRESULT)
    get_our_compare_states : Proc(IDtcLuRecoveryInitiatedByDtcTransWork*, UInt8*, DtcLu_CompareState*, HRESULT)
    handle_their_compare_states_response : Proc(IDtcLuRecoveryInitiatedByDtcTransWork*, DtcLu_CompareState, DtcLu_CompareStates_Confirmation*, HRESULT)
    handle_error_from_our_compare_states : Proc(IDtcLuRecoveryInitiatedByDtcTransWork*, DtcLu_CompareStates_Error, HRESULT)
    conversation_lost : Proc(IDtcLuRecoveryInitiatedByDtcTransWork*, HRESULT)
    get_recovery_seq_num : Proc(IDtcLuRecoveryInitiatedByDtcTransWork*, Int32*, HRESULT)
    obsolete_recovery_seq_num : Proc(IDtcLuRecoveryInitiatedByDtcTransWork*, Int32, HRESULT)
  end

  struct IDtcLuRecoveryInitiatedByDtcTransWork
    lpVtbl : IDtcLuRecoveryInitiatedByDtcTransWorkVTbl*
  end

  struct IDtcLuRecoveryInitiatedByDtcStatusWorkVTbl
    query_interface : Proc(IDtcLuRecoveryInitiatedByDtcStatusWork*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDtcLuRecoveryInitiatedByDtcStatusWork*, UInt32)
    release : Proc(IDtcLuRecoveryInitiatedByDtcStatusWork*, UInt32)
    handle_check_lu_status : Proc(IDtcLuRecoveryInitiatedByDtcStatusWork*, Int32, HRESULT)
  end

  struct IDtcLuRecoveryInitiatedByDtcStatusWork
    lpVtbl : IDtcLuRecoveryInitiatedByDtcStatusWorkVTbl*
  end

  struct IDtcLuRecoveryInitiatedByDtcVTbl
    query_interface : Proc(IDtcLuRecoveryInitiatedByDtc*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDtcLuRecoveryInitiatedByDtc*, UInt32)
    release : Proc(IDtcLuRecoveryInitiatedByDtc*, UInt32)
    get_work : Proc(IDtcLuRecoveryInitiatedByDtc*, DtcLu_LocalRecovery_Work*, Void**, HRESULT)
  end

  struct IDtcLuRecoveryInitiatedByDtc
    lpVtbl : IDtcLuRecoveryInitiatedByDtcVTbl*
  end

  struct IDtcLuRecoveryInitiatedByLuWorkVTbl
    query_interface : Proc(IDtcLuRecoveryInitiatedByLuWork*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDtcLuRecoveryInitiatedByLuWork*, UInt32)
    release : Proc(IDtcLuRecoveryInitiatedByLuWork*, UInt32)
    handle_their_xln : Proc(IDtcLuRecoveryInitiatedByLuWork*, Int32, DtcLu_Xln, UInt8*, UInt32, UInt8*, UInt32, UInt32, DtcLu_Xln_Response*, HRESULT)
    get_our_log_name_size : Proc(IDtcLuRecoveryInitiatedByLuWork*, UInt32*, HRESULT)
    get_our_xln : Proc(IDtcLuRecoveryInitiatedByLuWork*, DtcLu_Xln*, UInt8*, UInt32*, HRESULT)
    handle_confirmation_of_our_xln : Proc(IDtcLuRecoveryInitiatedByLuWork*, DtcLu_Xln_Confirmation, HRESULT)
    handle_their_compare_states : Proc(IDtcLuRecoveryInitiatedByLuWork*, UInt8*, UInt32, DtcLu_CompareState, DtcLu_CompareStates_Response*, DtcLu_CompareState*, HRESULT)
    handle_confirmation_of_our_compare_states : Proc(IDtcLuRecoveryInitiatedByLuWork*, DtcLu_CompareStates_Confirmation, HRESULT)
    handle_error_from_our_compare_states : Proc(IDtcLuRecoveryInitiatedByLuWork*, DtcLu_CompareStates_Error, HRESULT)
    conversation_lost : Proc(IDtcLuRecoveryInitiatedByLuWork*, HRESULT)
  end

  struct IDtcLuRecoveryInitiatedByLuWork
    lpVtbl : IDtcLuRecoveryInitiatedByLuWorkVTbl*
  end

  struct IDtcLuRecoveryInitiatedByLuVTbl
    query_interface : Proc(IDtcLuRecoveryInitiatedByLu*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDtcLuRecoveryInitiatedByLu*, UInt32)
    release : Proc(IDtcLuRecoveryInitiatedByLu*, UInt32)
    get_object_to_handle_work_from_lu : Proc(IDtcLuRecoveryInitiatedByLu*, IDtcLuRecoveryInitiatedByLuWork*, HRESULT)
  end

  struct IDtcLuRecoveryInitiatedByLu
    lpVtbl : IDtcLuRecoveryInitiatedByLuVTbl*
  end

  struct IDtcLuRmEnlistmentVTbl
    query_interface : Proc(IDtcLuRmEnlistment*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDtcLuRmEnlistment*, UInt32)
    release : Proc(IDtcLuRmEnlistment*, UInt32)
    unplug : Proc(IDtcLuRmEnlistment*, LibC::BOOL, HRESULT)
    backed_out : Proc(IDtcLuRmEnlistment*, HRESULT)
    back_out : Proc(IDtcLuRmEnlistment*, HRESULT)
    committed : Proc(IDtcLuRmEnlistment*, HRESULT)
    forget : Proc(IDtcLuRmEnlistment*, HRESULT)
    request_commit : Proc(IDtcLuRmEnlistment*, HRESULT)
  end

  struct IDtcLuRmEnlistment
    lpVtbl : IDtcLuRmEnlistmentVTbl*
  end

  struct IDtcLuRmEnlistmentSinkVTbl
    query_interface : Proc(IDtcLuRmEnlistmentSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDtcLuRmEnlistmentSink*, UInt32)
    release : Proc(IDtcLuRmEnlistmentSink*, UInt32)
    ack_unplug : Proc(IDtcLuRmEnlistmentSink*, HRESULT)
    tm_down : Proc(IDtcLuRmEnlistmentSink*, HRESULT)
    session_lost : Proc(IDtcLuRmEnlistmentSink*, HRESULT)
    backed_out : Proc(IDtcLuRmEnlistmentSink*, HRESULT)
    back_out : Proc(IDtcLuRmEnlistmentSink*, HRESULT)
    committed : Proc(IDtcLuRmEnlistmentSink*, HRESULT)
    forget : Proc(IDtcLuRmEnlistmentSink*, HRESULT)
    prepare : Proc(IDtcLuRmEnlistmentSink*, HRESULT)
    request_commit : Proc(IDtcLuRmEnlistmentSink*, HRESULT)
  end

  struct IDtcLuRmEnlistmentSink
    lpVtbl : IDtcLuRmEnlistmentSinkVTbl*
  end

  struct IDtcLuRmEnlistmentFactoryVTbl
    query_interface : Proc(IDtcLuRmEnlistmentFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDtcLuRmEnlistmentFactory*, UInt32)
    release : Proc(IDtcLuRmEnlistmentFactory*, UInt32)
    create : Proc(IDtcLuRmEnlistmentFactory*, UInt8*, UInt32, ITransaction, UInt8*, UInt32, IDtcLuRmEnlistmentSink, IDtcLuRmEnlistment*, HRESULT)
  end

  struct IDtcLuRmEnlistmentFactory
    lpVtbl : IDtcLuRmEnlistmentFactoryVTbl*
  end

  struct IDtcLuSubordinateDtcVTbl
    query_interface : Proc(IDtcLuSubordinateDtc*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDtcLuSubordinateDtc*, UInt32)
    release : Proc(IDtcLuSubordinateDtc*, UInt32)
    unplug : Proc(IDtcLuSubordinateDtc*, LibC::BOOL, HRESULT)
    backed_out : Proc(IDtcLuSubordinateDtc*, HRESULT)
    back_out : Proc(IDtcLuSubordinateDtc*, HRESULT)
    committed : Proc(IDtcLuSubordinateDtc*, HRESULT)
    forget : Proc(IDtcLuSubordinateDtc*, HRESULT)
    prepare : Proc(IDtcLuSubordinateDtc*, HRESULT)
    request_commit : Proc(IDtcLuSubordinateDtc*, HRESULT)
  end

  struct IDtcLuSubordinateDtc
    lpVtbl : IDtcLuSubordinateDtcVTbl*
  end

  struct IDtcLuSubordinateDtcSinkVTbl
    query_interface : Proc(IDtcLuSubordinateDtcSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDtcLuSubordinateDtcSink*, UInt32)
    release : Proc(IDtcLuSubordinateDtcSink*, UInt32)
    ack_unplug : Proc(IDtcLuSubordinateDtcSink*, HRESULT)
    tm_down : Proc(IDtcLuSubordinateDtcSink*, HRESULT)
    session_lost : Proc(IDtcLuSubordinateDtcSink*, HRESULT)
    backed_out : Proc(IDtcLuSubordinateDtcSink*, HRESULT)
    back_out : Proc(IDtcLuSubordinateDtcSink*, HRESULT)
    committed : Proc(IDtcLuSubordinateDtcSink*, HRESULT)
    forget : Proc(IDtcLuSubordinateDtcSink*, HRESULT)
    request_commit : Proc(IDtcLuSubordinateDtcSink*, HRESULT)
  end

  struct IDtcLuSubordinateDtcSink
    lpVtbl : IDtcLuSubordinateDtcSinkVTbl*
  end

  struct IDtcLuSubordinateDtcFactoryVTbl
    query_interface : Proc(IDtcLuSubordinateDtcFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDtcLuSubordinateDtcFactory*, UInt32)
    release : Proc(IDtcLuSubordinateDtcFactory*, UInt32)
    create : Proc(IDtcLuSubordinateDtcFactory*, UInt8*, UInt32, IUnknown, Int32, UInt32, ITransactionOptions, ITransaction*, UInt8*, UInt32, IDtcLuSubordinateDtcSink, IDtcLuSubordinateDtc*, HRESULT)
  end

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
