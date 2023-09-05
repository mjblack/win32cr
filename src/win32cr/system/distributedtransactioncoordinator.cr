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

  ITransaction_GUID = "0fb15084-af41-11ce-bd2b-204c4f4f5020"
  IID_ITransaction = LibC::GUID.new(0xfb15084_u32, 0xaf41_u16, 0x11ce_u16, StaticArray[0xbd_u8, 0x2b_u8, 0x20_u8, 0x4c_u8, 0x4f_u8, 0x4f_u8, 0x50_u8, 0x20_u8])
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

  ITransactionCloner_GUID = "02656950-2152-11d0-944c-00a0c905416e"
  IID_ITransactionCloner = LibC::GUID.new(0x2656950_u32, 0x2152_u16, 0x11d0_u16, StaticArray[0x94_u8, 0x4c_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
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

  ITransaction2_GUID = "34021548-0065-11d3-bac1-00c04f797be2"
  IID_ITransaction2 = LibC::GUID.new(0x34021548_u32, 0x65_u16, 0x11d3_u16, StaticArray[0xba_u8, 0xc1_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0x7b_u8, 0xe2_u8])
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

  ITransactionDispenser_GUID = "3a6ad9e1-23b9-11cf-ad60-00aa00a74ccd"
  IID_ITransactionDispenser = LibC::GUID.new(0x3a6ad9e1_u32, 0x23b9_u16, 0x11cf_u16, StaticArray[0xad_u8, 0x60_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa7_u8, 0x4c_u8, 0xcd_u8])
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

  ITransactionOptions_GUID = "3a6ad9e0-23b9-11cf-ad60-00aa00a74ccd"
  IID_ITransactionOptions = LibC::GUID.new(0x3a6ad9e0_u32, 0x23b9_u16, 0x11cf_u16, StaticArray[0xad_u8, 0x60_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa7_u8, 0x4c_u8, 0xcd_u8])
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

  ITransactionOutcomeEvents_GUID = "3a6ad9e2-23b9-11cf-ad60-00aa00a74ccd"
  IID_ITransactionOutcomeEvents = LibC::GUID.new(0x3a6ad9e2_u32, 0x23b9_u16, 0x11cf_u16, StaticArray[0xad_u8, 0x60_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa7_u8, 0x4c_u8, 0xcd_u8])
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

  ITmNodeName_GUID = "30274f88-6ee4-474e-9b95-7807bc9ef8cf"
  IID_ITmNodeName = LibC::GUID.new(0x30274f88_u32, 0x6ee4_u16, 0x474e_u16, StaticArray[0x9b_u8, 0x95_u8, 0x78_u8, 0x7_u8, 0xbc_u8, 0x9e_u8, 0xf8_u8, 0xcf_u8])
  struct ITmNodeName
    lpVtbl : ITmNodeNameVTbl*
  end

  struct IKernelTransactionVTbl
    query_interface : Proc(IKernelTransaction*, Guid*, Void**, HRESULT)
    add_ref : Proc(IKernelTransaction*, UInt32)
    release : Proc(IKernelTransaction*, UInt32)
    get_handle : Proc(IKernelTransaction*, LibC::HANDLE*, HRESULT)
  end

  IKernelTransaction_GUID = "79427a2b-f895-40e0-be79-b57dc82ed231"
  IID_IKernelTransaction = LibC::GUID.new(0x79427a2b_u32, 0xf895_u16, 0x40e0_u16, StaticArray[0xbe_u8, 0x79_u8, 0xb5_u8, 0x7d_u8, 0xc8_u8, 0x2e_u8, 0xd2_u8, 0x31_u8])
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

  ITransactionResourceAsync_GUID = "69e971f0-23ce-11cf-ad60-00aa00a74ccd"
  IID_ITransactionResourceAsync = LibC::GUID.new(0x69e971f0_u32, 0x23ce_u16, 0x11cf_u16, StaticArray[0xad_u8, 0x60_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa7_u8, 0x4c_u8, 0xcd_u8])
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

  ITransactionLastResourceAsync_GUID = "c82bd532-5b30-11d3-8a91-00c04f79eb6d"
  IID_ITransactionLastResourceAsync = LibC::GUID.new(0xc82bd532_u32, 0x5b30_u16, 0x11d3_u16, StaticArray[0x8a_u8, 0x91_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xeb_u8, 0x6d_u8])
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

  ITransactionResource_GUID = "ee5ff7b3-4572-11d0-9452-00a0c905416e"
  IID_ITransactionResource = LibC::GUID.new(0xee5ff7b3_u32, 0x4572_u16, 0x11d0_u16, StaticArray[0x94_u8, 0x52_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
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

  ITransactionEnlistmentAsync_GUID = "0fb15081-af41-11ce-bd2b-204c4f4f5020"
  IID_ITransactionEnlistmentAsync = LibC::GUID.new(0xfb15081_u32, 0xaf41_u16, 0x11ce_u16, StaticArray[0xbd_u8, 0x2b_u8, 0x20_u8, 0x4c_u8, 0x4f_u8, 0x4f_u8, 0x50_u8, 0x20_u8])
  struct ITransactionEnlistmentAsync
    lpVtbl : ITransactionEnlistmentAsyncVTbl*
  end

  struct ITransactionLastEnlistmentAsyncVTbl
    query_interface : Proc(ITransactionLastEnlistmentAsync*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITransactionLastEnlistmentAsync*, UInt32)
    release : Proc(ITransactionLastEnlistmentAsync*, UInt32)
    transaction_outcome : Proc(ITransactionLastEnlistmentAsync*, XACTSTAT, BOID*, HRESULT)
  end

  ITransactionLastEnlistmentAsync_GUID = "c82bd533-5b30-11d3-8a91-00c04f79eb6d"
  IID_ITransactionLastEnlistmentAsync = LibC::GUID.new(0xc82bd533_u32, 0x5b30_u16, 0x11d3_u16, StaticArray[0x8a_u8, 0x91_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xeb_u8, 0x6d_u8])
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

  ITransactionExportFactory_GUID = "e1cf9b53-8745-11ce-a9ba-00aa006c3706"
  IID_ITransactionExportFactory = LibC::GUID.new(0xe1cf9b53_u32, 0x8745_u16, 0x11ce_u16, StaticArray[0xa9_u8, 0xba_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x6c_u8, 0x37_u8, 0x6_u8])
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

  ITransactionImportWhereabouts_GUID = "0141fda4-8fc0-11ce-bd18-204c4f4f5020"
  IID_ITransactionImportWhereabouts = LibC::GUID.new(0x141fda4_u32, 0x8fc0_u16, 0x11ce_u16, StaticArray[0xbd_u8, 0x18_u8, 0x20_u8, 0x4c_u8, 0x4f_u8, 0x4f_u8, 0x50_u8, 0x20_u8])
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

  ITransactionExport_GUID = "0141fda5-8fc0-11ce-bd18-204c4f4f5020"
  IID_ITransactionExport = LibC::GUID.new(0x141fda5_u32, 0x8fc0_u16, 0x11ce_u16, StaticArray[0xbd_u8, 0x18_u8, 0x20_u8, 0x4c_u8, 0x4f_u8, 0x4f_u8, 0x50_u8, 0x20_u8])
  struct ITransactionExport
    lpVtbl : ITransactionExportVTbl*
  end

  struct ITransactionImportVTbl
    query_interface : Proc(ITransactionImport*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITransactionImport*, UInt32)
    release : Proc(ITransactionImport*, UInt32)
    import : Proc(ITransactionImport*, UInt32, UInt8*, Guid*, Void**, HRESULT)
  end

  ITransactionImport_GUID = "e1cf9b5a-8745-11ce-a9ba-00aa006c3706"
  IID_ITransactionImport = LibC::GUID.new(0xe1cf9b5a_u32, 0x8745_u16, 0x11ce_u16, StaticArray[0xa9_u8, 0xba_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x6c_u8, 0x37_u8, 0x6_u8])
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

  ITipTransaction_GUID = "17cf72d0-bac5-11d1-b1bf-00c04fc2f3ef"
  IID_ITipTransaction = LibC::GUID.new(0x17cf72d0_u32, 0xbac5_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xbf_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0xf3_u8, 0xef_u8])
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

  ITipHelper_GUID = "17cf72d1-bac5-11d1-b1bf-00c04fc2f3ef"
  IID_ITipHelper = LibC::GUID.new(0x17cf72d1_u32, 0xbac5_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xbf_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0xf3_u8, 0xef_u8])
  struct ITipHelper
    lpVtbl : ITipHelperVTbl*
  end

  struct ITipPullSinkVTbl
    query_interface : Proc(ITipPullSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITipPullSink*, UInt32)
    release : Proc(ITipPullSink*, UInt32)
    pull_complete : Proc(ITipPullSink*, HRESULT, HRESULT)
  end

  ITipPullSink_GUID = "17cf72d2-bac5-11d1-b1bf-00c04fc2f3ef"
  IID_ITipPullSink = LibC::GUID.new(0x17cf72d2_u32, 0xbac5_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xbf_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0xf3_u8, 0xef_u8])
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

  IDtcNetworkAccessConfig_GUID = "9797c15d-a428-4291-87b6-0995031a678d"
  IID_IDtcNetworkAccessConfig = LibC::GUID.new(0x9797c15d_u32, 0xa428_u16, 0x4291_u16, StaticArray[0x87_u8, 0xb6_u8, 0x9_u8, 0x95_u8, 0x3_u8, 0x1a_u8, 0x67_u8, 0x8d_u8])
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

  IDtcNetworkAccessConfig2_GUID = "a7aa013b-eb7d-4f42-b41c-b2dec09ae034"
  IID_IDtcNetworkAccessConfig2 = LibC::GUID.new(0xa7aa013b_u32, 0xeb7d_u16, 0x4f42_u16, StaticArray[0xb4_u8, 0x1c_u8, 0xb2_u8, 0xde_u8, 0xc0_u8, 0x9a_u8, 0xe0_u8, 0x34_u8])
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

  IDtcNetworkAccessConfig3_GUID = "76e4b4f3-2ca5-466b-89d5-fd218ee75b49"
  IID_IDtcNetworkAccessConfig3 = LibC::GUID.new(0x76e4b4f3_u32, 0x2ca5_u16, 0x466b_u16, StaticArray[0x89_u8, 0xd5_u8, 0xfd_u8, 0x21_u8, 0x8e_u8, 0xe7_u8, 0x5b_u8, 0x49_u8])
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

  IDtcToXaMapper_GUID = "64ffabe0-7ce9-11d0-8ce6-00c04fdc877e"
  IID_IDtcToXaMapper = LibC::GUID.new(0x64ffabe0_u32, 0x7ce9_u16, 0x11d0_u16, StaticArray[0x8c_u8, 0xe6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xdc_u8, 0x87_u8, 0x7e_u8])
  struct IDtcToXaMapper
    lpVtbl : IDtcToXaMapperVTbl*
  end

  struct IDtcToXaHelperFactoryVTbl
    query_interface : Proc(IDtcToXaHelperFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDtcToXaHelperFactory*, UInt32)
    release : Proc(IDtcToXaHelperFactory*, UInt32)
    create : Proc(IDtcToXaHelperFactory*, PSTR, PSTR, Guid*, IDtcToXaHelper*, HRESULT)
  end

  IDtcToXaHelperFactory_GUID = "a9861610-304a-11d1-9813-00a0c905416e"
  IID_IDtcToXaHelperFactory = LibC::GUID.new(0xa9861610_u32, 0x304a_u16, 0x11d1_u16, StaticArray[0x98_u8, 0x13_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
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

  IDtcToXaHelper_GUID = "a9861611-304a-11d1-9813-00a0c905416e"
  IID_IDtcToXaHelper = LibC::GUID.new(0xa9861611_u32, 0x304a_u16, 0x11d1_u16, StaticArray[0x98_u8, 0x13_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
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

  IDtcToXaHelperSinglePipe_GUID = "47ed4971-53b3-11d1-bbb9-00c04fd658f6"
  IID_IDtcToXaHelperSinglePipe = LibC::GUID.new(0x47ed4971_u32, 0x53b3_u16, 0x11d1_u16, StaticArray[0xbb_u8, 0xb9_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd6_u8, 0x58_u8, 0xf6_u8])
  struct IDtcToXaHelperSinglePipe
    lpVtbl : IDtcToXaHelperSinglePipeVTbl*
  end

  struct IXATransLookupVTbl
    query_interface : Proc(IXATransLookup*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXATransLookup*, UInt32)
    release : Proc(IXATransLookup*, UInt32)
    lookup : Proc(IXATransLookup*, ITransaction*, HRESULT)
  end

  IXATransLookup_GUID = "f3b1f131-eeda-11ce-aed4-00aa0051e2c4"
  IID_IXATransLookup = LibC::GUID.new(0xf3b1f131_u32, 0xeeda_u16, 0x11ce_u16, StaticArray[0xae_u8, 0xd4_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x51_u8, 0xe2_u8, 0xc4_u8])
  struct IXATransLookup
    lpVtbl : IXATransLookupVTbl*
  end

  struct IXATransLookup2VTbl
    query_interface : Proc(IXATransLookup2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXATransLookup2*, UInt32)
    release : Proc(IXATransLookup2*, UInt32)
    lookup : Proc(IXATransLookup2*, Xid_t*, ITransaction*, HRESULT)
  end

  IXATransLookup2_GUID = "bf193c85-0d1a-4290-b88f-d2cb8873d1e7"
  IID_IXATransLookup2 = LibC::GUID.new(0xbf193c85_u32, 0xd1a_u16, 0x4290_u16, StaticArray[0xb8_u8, 0x8f_u8, 0xd2_u8, 0xcb_u8, 0x88_u8, 0x73_u8, 0xd1_u8, 0xe7_u8])
  struct IXATransLookup2
    lpVtbl : IXATransLookup2VTbl*
  end

  struct IResourceManagerSinkVTbl
    query_interface : Proc(IResourceManagerSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(IResourceManagerSink*, UInt32)
    release : Proc(IResourceManagerSink*, UInt32)
    tm_down : Proc(IResourceManagerSink*, HRESULT)
  end

  IResourceManagerSink_GUID = "0d563181-defb-11ce-aed1-00aa0051e2c4"
  IID_IResourceManagerSink = LibC::GUID.new(0xd563181_u32, 0xdefb_u16, 0x11ce_u16, StaticArray[0xae_u8, 0xd1_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x51_u8, 0xe2_u8, 0xc4_u8])
  struct IResourceManagerSink
    lpVtbl : IResourceManagerSinkVTbl*
  end

  struct IResourceManager1VTbl
    query_interface : Proc(IResourceManager1*, Guid*, Void**, HRESULT)
    add_ref : Proc(IResourceManager1*, UInt32)
    release : Proc(IResourceManager1*, UInt32)
    enlist : Proc(IResourceManager1*, ITransaction, ITransactionResourceAsync, BOID*, Int32*, ITransactionEnlistmentAsync*, HRESULT)
    reenlist : Proc(IResourceManager1*, UInt8*, UInt32, UInt32, XACTSTAT*, HRESULT)
    reenlistment_complete : Proc(IResourceManager1*, HRESULT)
    get_distributed_transaction_manager : Proc(IResourceManager1*, Guid*, Void**, HRESULT)
  end

  IResourceManager1_GUID = "13741d21-87eb-11ce-8081-0080c758527e"
  IID_IResourceManager1 = LibC::GUID.new(0x13741d21_u32, 0x87eb_u16, 0x11ce_u16, StaticArray[0x80_u8, 0x81_u8, 0x0_u8, 0x80_u8, 0xc7_u8, 0x58_u8, 0x52_u8, 0x7e_u8])
  struct IResourceManager1
    lpVtbl : IResourceManager1VTbl*
  end

  struct ILastResourceManagerVTbl
    query_interface : Proc(ILastResourceManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(ILastResourceManager*, UInt32)
    release : Proc(ILastResourceManager*, UInt32)
    transaction_committed : Proc(ILastResourceManager*, UInt8*, UInt32, HRESULT)
    recovery_done : Proc(ILastResourceManager*, HRESULT)
  end

  ILastResourceManager_GUID = "4d964ad4-5b33-11d3-8a91-00c04f79eb6d"
  IID_ILastResourceManager = LibC::GUID.new(0x4d964ad4_u32, 0x5b33_u16, 0x11d3_u16, StaticArray[0x8a_u8, 0x91_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xeb_u8, 0x6d_u8])
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

  IResourceManager2_GUID = "d136c69a-f749-11d1-8f47-00c04f8ee57d"
  IID_IResourceManager2 = LibC::GUID.new(0xd136c69a_u32, 0xf749_u16, 0x11d1_u16, StaticArray[0x8f_u8, 0x47_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe5_u8, 0x7d_u8])
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

  IResourceManagerRejoinable_GUID = "6f6de620-b5df-4f3e-9cfa-c8aebd05172b"
  IID_IResourceManagerRejoinable = LibC::GUID.new(0x6f6de620_u32, 0xb5df_u16, 0x4f3e_u16, StaticArray[0x9c_u8, 0xfa_u8, 0xc8_u8, 0xae_u8, 0xbd_u8, 0x5_u8, 0x17_u8, 0x2b_u8])
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

  IXAConfig_GUID = "c8a6e3a1-9a8c-11cf-a308-00a0c905416e"
  IID_IXAConfig = LibC::GUID.new(0xc8a6e3a1_u32, 0x9a8c_u16, 0x11cf_u16, StaticArray[0xa3_u8, 0x8_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
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

  IRMHelper_GUID = "e793f6d1-f53d-11cf-a60d-00a0c905416e"
  IID_IRMHelper = LibC::GUID.new(0xe793f6d1_u32, 0xf53d_u16, 0x11cf_u16, StaticArray[0xa6_u8, 0xd_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
  struct IRMHelper
    lpVtbl : IRMHelperVTbl*
  end

  struct IXAObtainRMInfoVTbl
    query_interface : Proc(IXAObtainRMInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXAObtainRMInfo*, UInt32)
    release : Proc(IXAObtainRMInfo*, UInt32)
    obtain_rm_info : Proc(IXAObtainRMInfo*, IRMHelper, HRESULT)
  end

  IXAObtainRMInfo_GUID = "e793f6d2-f53d-11cf-a60d-00a0c905416e"
  IID_IXAObtainRMInfo = LibC::GUID.new(0xe793f6d2_u32, 0xf53d_u16, 0x11cf_u16, StaticArray[0xa6_u8, 0xd_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
  struct IXAObtainRMInfo
    lpVtbl : IXAObtainRMInfoVTbl*
  end

  struct IResourceManagerFactoryVTbl
    query_interface : Proc(IResourceManagerFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IResourceManagerFactory*, UInt32)
    release : Proc(IResourceManagerFactory*, UInt32)
    create : Proc(IResourceManagerFactory*, Guid*, PSTR, IResourceManagerSink, IResourceManager1*, HRESULT)
  end

  IResourceManagerFactory_GUID = "13741d20-87eb-11ce-8081-0080c758527e"
  IID_IResourceManagerFactory = LibC::GUID.new(0x13741d20_u32, 0x87eb_u16, 0x11ce_u16, StaticArray[0x80_u8, 0x81_u8, 0x0_u8, 0x80_u8, 0xc7_u8, 0x58_u8, 0x52_u8, 0x7e_u8])
  struct IResourceManagerFactory
    lpVtbl : IResourceManagerFactoryVTbl*
  end

  struct IResourceManagerFactory2VTbl
    query_interface : Proc(IResourceManagerFactory2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IResourceManagerFactory2*, UInt32)
    release : Proc(IResourceManagerFactory2*, UInt32)
    create : Proc(IResourceManagerFactory2*, Guid*, PSTR, IResourceManagerSink, IResourceManager1*, HRESULT)
    create_ex : Proc(IResourceManagerFactory2*, Guid*, PSTR, IResourceManagerSink, Guid*, Void**, HRESULT)
  end

  IResourceManagerFactory2_GUID = "6b369c21-fbd2-11d1-8f47-00c04f8ee57d"
  IID_IResourceManagerFactory2 = LibC::GUID.new(0x6b369c21_u32, 0xfbd2_u16, 0x11d1_u16, StaticArray[0x8f_u8, 0x47_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe5_u8, 0x7d_u8])
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

  IPrepareInfo_GUID = "80c7bfd0-87ee-11ce-8081-0080c758527e"
  IID_IPrepareInfo = LibC::GUID.new(0x80c7bfd0_u32, 0x87ee_u16, 0x11ce_u16, StaticArray[0x80_u8, 0x81_u8, 0x0_u8, 0x80_u8, 0xc7_u8, 0x58_u8, 0x52_u8, 0x7e_u8])
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

  IPrepareInfo2_GUID = "5fab2547-9779-11d1-b886-00c04fb9618a"
  IID_IPrepareInfo2 = LibC::GUID.new(0x5fab2547_u32, 0x9779_u16, 0x11d1_u16, StaticArray[0xb8_u8, 0x86_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x61_u8, 0x8a_u8])
  struct IPrepareInfo2
    lpVtbl : IPrepareInfo2VTbl*
  end

  struct IGetDispenserVTbl
    query_interface : Proc(IGetDispenser*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGetDispenser*, UInt32)
    release : Proc(IGetDispenser*, UInt32)
    get_dispenser : Proc(IGetDispenser*, Guid*, Void**, HRESULT)
  end

  IGetDispenser_GUID = "c23cc370-87ef-11ce-8081-0080c758527e"
  IID_IGetDispenser = LibC::GUID.new(0xc23cc370_u32, 0x87ef_u16, 0x11ce_u16, StaticArray[0x80_u8, 0x81_u8, 0x0_u8, 0x80_u8, 0xc7_u8, 0x58_u8, 0x52_u8, 0x7e_u8])
  struct IGetDispenser
    lpVtbl : IGetDispenserVTbl*
  end

  struct ITransactionVoterBallotAsync2VTbl
    query_interface : Proc(ITransactionVoterBallotAsync2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITransactionVoterBallotAsync2*, UInt32)
    release : Proc(ITransactionVoterBallotAsync2*, UInt32)
    vote_request_done : Proc(ITransactionVoterBallotAsync2*, HRESULT, BOID*, HRESULT)
  end

  ITransactionVoterBallotAsync2_GUID = "5433376c-414d-11d3-b206-00c04fc2f3ef"
  IID_ITransactionVoterBallotAsync2 = LibC::GUID.new(0x5433376c_u32, 0x414d_u16, 0x11d3_u16, StaticArray[0xb2_u8, 0x6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0xf3_u8, 0xef_u8])
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

  ITransactionVoterNotifyAsync2_GUID = "5433376b-414d-11d3-b206-00c04fc2f3ef"
  IID_ITransactionVoterNotifyAsync2 = LibC::GUID.new(0x5433376b_u32, 0x414d_u16, 0x11d3_u16, StaticArray[0xb2_u8, 0x6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0xf3_u8, 0xef_u8])
  struct ITransactionVoterNotifyAsync2
    lpVtbl : ITransactionVoterNotifyAsync2VTbl*
  end

  struct ITransactionVoterFactory2VTbl
    query_interface : Proc(ITransactionVoterFactory2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITransactionVoterFactory2*, UInt32)
    release : Proc(ITransactionVoterFactory2*, UInt32)
    create : Proc(ITransactionVoterFactory2*, ITransaction, ITransactionVoterNotifyAsync2, ITransactionVoterBallotAsync2*, HRESULT)
  end

  ITransactionVoterFactory2_GUID = "5433376a-414d-11d3-b206-00c04fc2f3ef"
  IID_ITransactionVoterFactory2 = LibC::GUID.new(0x5433376a_u32, 0x414d_u16, 0x11d3_u16, StaticArray[0xb2_u8, 0x6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0xf3_u8, 0xef_u8])
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

  ITransactionPhase0EnlistmentAsync_GUID = "82dc88e1-a954-11d1-8f88-00600895e7d5"
  IID_ITransactionPhase0EnlistmentAsync = LibC::GUID.new(0x82dc88e1_u32, 0xa954_u16, 0x11d1_u16, StaticArray[0x8f_u8, 0x88_u8, 0x0_u8, 0x60_u8, 0x8_u8, 0x95_u8, 0xe7_u8, 0xd5_u8])
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

  ITransactionPhase0NotifyAsync_GUID = "ef081809-0c76-11d2-87a6-00c04f990f34"
  IID_ITransactionPhase0NotifyAsync = LibC::GUID.new(0xef081809_u32, 0xc76_u16, 0x11d2_u16, StaticArray[0x87_u8, 0xa6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x99_u8, 0xf_u8, 0x34_u8])
  struct ITransactionPhase0NotifyAsync
    lpVtbl : ITransactionPhase0NotifyAsyncVTbl*
  end

  struct ITransactionPhase0FactoryVTbl
    query_interface : Proc(ITransactionPhase0Factory*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITransactionPhase0Factory*, UInt32)
    release : Proc(ITransactionPhase0Factory*, UInt32)
    create : Proc(ITransactionPhase0Factory*, ITransactionPhase0NotifyAsync, ITransactionPhase0EnlistmentAsync*, HRESULT)
  end

  ITransactionPhase0Factory_GUID = "82dc88e0-a954-11d1-8f88-00600895e7d5"
  IID_ITransactionPhase0Factory = LibC::GUID.new(0x82dc88e0_u32, 0xa954_u16, 0x11d1_u16, StaticArray[0x8f_u8, 0x88_u8, 0x0_u8, 0x60_u8, 0x8_u8, 0x95_u8, 0xe7_u8, 0xd5_u8])
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

  ITransactionTransmitter_GUID = "59313e01-b36c-11cf-a539-00aa006887c3"
  IID_ITransactionTransmitter = LibC::GUID.new(0x59313e01_u32, 0xb36c_u16, 0x11cf_u16, StaticArray[0xa5_u8, 0x39_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x68_u8, 0x87_u8, 0xc3_u8])
  struct ITransactionTransmitter
    lpVtbl : ITransactionTransmitterVTbl*
  end

  struct ITransactionTransmitterFactoryVTbl
    query_interface : Proc(ITransactionTransmitterFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITransactionTransmitterFactory*, UInt32)
    release : Proc(ITransactionTransmitterFactory*, UInt32)
    create : Proc(ITransactionTransmitterFactory*, ITransactionTransmitter*, HRESULT)
  end

  ITransactionTransmitterFactory_GUID = "59313e00-b36c-11cf-a539-00aa006887c3"
  IID_ITransactionTransmitterFactory = LibC::GUID.new(0x59313e00_u32, 0xb36c_u16, 0x11cf_u16, StaticArray[0xa5_u8, 0x39_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x68_u8, 0x87_u8, 0xc3_u8])
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

  ITransactionReceiver_GUID = "59313e03-b36c-11cf-a539-00aa006887c3"
  IID_ITransactionReceiver = LibC::GUID.new(0x59313e03_u32, 0xb36c_u16, 0x11cf_u16, StaticArray[0xa5_u8, 0x39_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x68_u8, 0x87_u8, 0xc3_u8])
  struct ITransactionReceiver
    lpVtbl : ITransactionReceiverVTbl*
  end

  struct ITransactionReceiverFactoryVTbl
    query_interface : Proc(ITransactionReceiverFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITransactionReceiverFactory*, UInt32)
    release : Proc(ITransactionReceiverFactory*, UInt32)
    create : Proc(ITransactionReceiverFactory*, ITransactionReceiver*, HRESULT)
  end

  ITransactionReceiverFactory_GUID = "59313e02-b36c-11cf-a539-00aa006887c3"
  IID_ITransactionReceiverFactory = LibC::GUID.new(0x59313e02_u32, 0xb36c_u16, 0x11cf_u16, StaticArray[0xa5_u8, 0x39_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x68_u8, 0x87_u8, 0xc3_u8])
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

  IDtcLuConfigure_GUID = "4131e760-1aea-11d0-944b-00a0c905416e"
  IID_IDtcLuConfigure = LibC::GUID.new(0x4131e760_u32, 0x1aea_u16, 0x11d0_u16, StaticArray[0x94_u8, 0x4b_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
  struct IDtcLuConfigure
    lpVtbl : IDtcLuConfigureVTbl*
  end

  struct IDtcLuRecoveryVTbl
    query_interface : Proc(IDtcLuRecovery*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDtcLuRecovery*, UInt32)
    release : Proc(IDtcLuRecovery*, UInt32)
  end

  IDtcLuRecovery_GUID = "ac2b8ad2-d6f0-11d0-b386-00a0c9083365"
  IID_IDtcLuRecovery = LibC::GUID.new(0xac2b8ad2_u32, 0xd6f0_u16, 0x11d0_u16, StaticArray[0xb3_u8, 0x86_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x8_u8, 0x33_u8, 0x65_u8])
  struct IDtcLuRecovery
    lpVtbl : IDtcLuRecoveryVTbl*
  end

  struct IDtcLuRecoveryFactoryVTbl
    query_interface : Proc(IDtcLuRecoveryFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDtcLuRecoveryFactory*, UInt32)
    release : Proc(IDtcLuRecoveryFactory*, UInt32)
    create : Proc(IDtcLuRecoveryFactory*, UInt8*, UInt32, IDtcLuRecovery*, HRESULT)
  end

  IDtcLuRecoveryFactory_GUID = "4131e762-1aea-11d0-944b-00a0c905416e"
  IID_IDtcLuRecoveryFactory = LibC::GUID.new(0x4131e762_u32, 0x1aea_u16, 0x11d0_u16, StaticArray[0x94_u8, 0x4b_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
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

  IDtcLuRecoveryInitiatedByDtcTransWork_GUID = "4131e765-1aea-11d0-944b-00a0c905416e"
  IID_IDtcLuRecoveryInitiatedByDtcTransWork = LibC::GUID.new(0x4131e765_u32, 0x1aea_u16, 0x11d0_u16, StaticArray[0x94_u8, 0x4b_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
  struct IDtcLuRecoveryInitiatedByDtcTransWork
    lpVtbl : IDtcLuRecoveryInitiatedByDtcTransWorkVTbl*
  end

  struct IDtcLuRecoveryInitiatedByDtcStatusWorkVTbl
    query_interface : Proc(IDtcLuRecoveryInitiatedByDtcStatusWork*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDtcLuRecoveryInitiatedByDtcStatusWork*, UInt32)
    release : Proc(IDtcLuRecoveryInitiatedByDtcStatusWork*, UInt32)
    handle_check_lu_status : Proc(IDtcLuRecoveryInitiatedByDtcStatusWork*, Int32, HRESULT)
  end

  IDtcLuRecoveryInitiatedByDtcStatusWork_GUID = "4131e766-1aea-11d0-944b-00a0c905416e"
  IID_IDtcLuRecoveryInitiatedByDtcStatusWork = LibC::GUID.new(0x4131e766_u32, 0x1aea_u16, 0x11d0_u16, StaticArray[0x94_u8, 0x4b_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
  struct IDtcLuRecoveryInitiatedByDtcStatusWork
    lpVtbl : IDtcLuRecoveryInitiatedByDtcStatusWorkVTbl*
  end

  struct IDtcLuRecoveryInitiatedByDtcVTbl
    query_interface : Proc(IDtcLuRecoveryInitiatedByDtc*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDtcLuRecoveryInitiatedByDtc*, UInt32)
    release : Proc(IDtcLuRecoveryInitiatedByDtc*, UInt32)
    get_work : Proc(IDtcLuRecoveryInitiatedByDtc*, DtcLu_LocalRecovery_Work*, Void**, HRESULT)
  end

  IDtcLuRecoveryInitiatedByDtc_GUID = "4131e764-1aea-11d0-944b-00a0c905416e"
  IID_IDtcLuRecoveryInitiatedByDtc = LibC::GUID.new(0x4131e764_u32, 0x1aea_u16, 0x11d0_u16, StaticArray[0x94_u8, 0x4b_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
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

  IDtcLuRecoveryInitiatedByLuWork_GUID = "ac2b8ad1-d6f0-11d0-b386-00a0c9083365"
  IID_IDtcLuRecoveryInitiatedByLuWork = LibC::GUID.new(0xac2b8ad1_u32, 0xd6f0_u16, 0x11d0_u16, StaticArray[0xb3_u8, 0x86_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x8_u8, 0x33_u8, 0x65_u8])
  struct IDtcLuRecoveryInitiatedByLuWork
    lpVtbl : IDtcLuRecoveryInitiatedByLuWorkVTbl*
  end

  struct IDtcLuRecoveryInitiatedByLuVTbl
    query_interface : Proc(IDtcLuRecoveryInitiatedByLu*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDtcLuRecoveryInitiatedByLu*, UInt32)
    release : Proc(IDtcLuRecoveryInitiatedByLu*, UInt32)
    get_object_to_handle_work_from_lu : Proc(IDtcLuRecoveryInitiatedByLu*, IDtcLuRecoveryInitiatedByLuWork*, HRESULT)
  end

  IDtcLuRecoveryInitiatedByLu_GUID = "4131e768-1aea-11d0-944b-00a0c905416e"
  IID_IDtcLuRecoveryInitiatedByLu = LibC::GUID.new(0x4131e768_u32, 0x1aea_u16, 0x11d0_u16, StaticArray[0x94_u8, 0x4b_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
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

  IDtcLuRmEnlistment_GUID = "4131e769-1aea-11d0-944b-00a0c905416e"
  IID_IDtcLuRmEnlistment = LibC::GUID.new(0x4131e769_u32, 0x1aea_u16, 0x11d0_u16, StaticArray[0x94_u8, 0x4b_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
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

  IDtcLuRmEnlistmentSink_GUID = "4131e770-1aea-11d0-944b-00a0c905416e"
  IID_IDtcLuRmEnlistmentSink = LibC::GUID.new(0x4131e770_u32, 0x1aea_u16, 0x11d0_u16, StaticArray[0x94_u8, 0x4b_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
  struct IDtcLuRmEnlistmentSink
    lpVtbl : IDtcLuRmEnlistmentSinkVTbl*
  end

  struct IDtcLuRmEnlistmentFactoryVTbl
    query_interface : Proc(IDtcLuRmEnlistmentFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDtcLuRmEnlistmentFactory*, UInt32)
    release : Proc(IDtcLuRmEnlistmentFactory*, UInt32)
    create : Proc(IDtcLuRmEnlistmentFactory*, UInt8*, UInt32, ITransaction, UInt8*, UInt32, IDtcLuRmEnlistmentSink, IDtcLuRmEnlistment*, HRESULT)
  end

  IDtcLuRmEnlistmentFactory_GUID = "4131e771-1aea-11d0-944b-00a0c905416e"
  IID_IDtcLuRmEnlistmentFactory = LibC::GUID.new(0x4131e771_u32, 0x1aea_u16, 0x11d0_u16, StaticArray[0x94_u8, 0x4b_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
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

  IDtcLuSubordinateDtc_GUID = "4131e773-1aea-11d0-944b-00a0c905416e"
  IID_IDtcLuSubordinateDtc = LibC::GUID.new(0x4131e773_u32, 0x1aea_u16, 0x11d0_u16, StaticArray[0x94_u8, 0x4b_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
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

  IDtcLuSubordinateDtcSink_GUID = "4131e774-1aea-11d0-944b-00a0c905416e"
  IID_IDtcLuSubordinateDtcSink = LibC::GUID.new(0x4131e774_u32, 0x1aea_u16, 0x11d0_u16, StaticArray[0x94_u8, 0x4b_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
  struct IDtcLuSubordinateDtcSink
    lpVtbl : IDtcLuSubordinateDtcSinkVTbl*
  end

  struct IDtcLuSubordinateDtcFactoryVTbl
    query_interface : Proc(IDtcLuSubordinateDtcFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDtcLuSubordinateDtcFactory*, UInt32)
    release : Proc(IDtcLuSubordinateDtcFactory*, UInt32)
    create : Proc(IDtcLuSubordinateDtcFactory*, UInt8*, UInt32, IUnknown, Int32, UInt32, ITransactionOptions, ITransaction*, UInt8*, UInt32, IDtcLuSubordinateDtcSink, IDtcLuSubordinateDtc*, HRESULT)
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
  def query_interface(this : ITransaction*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITransaction*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITransaction*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def commit(this : ITransaction*, fretaining : LibC::BOOL, grftc : UInt32, grfrm : UInt32) : HRESULT
    @lpVtbl.value.commit.call(this, fretaining, grftc, grfrm)
  end
  def abort(this : ITransaction*, pboidreason : BOID*, fretaining : LibC::BOOL, fasync : LibC::BOOL) : HRESULT
    @lpVtbl.value.abort.call(this, pboidreason, fretaining, fasync)
  end
  def get_transaction_info(this : ITransaction*, pinfo : XACTTRANSINFO*) : HRESULT
    @lpVtbl.value.get_transaction_info.call(this, pinfo)
  end
end
struct LibWin32::ITransactionCloner
  def query_interface(this : ITransactionCloner*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITransactionCloner*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITransactionCloner*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def commit(this : ITransactionCloner*, fretaining : LibC::BOOL, grftc : UInt32, grfrm : UInt32) : HRESULT
    @lpVtbl.value.commit.call(this, fretaining, grftc, grfrm)
  end
  def abort(this : ITransactionCloner*, pboidreason : BOID*, fretaining : LibC::BOOL, fasync : LibC::BOOL) : HRESULT
    @lpVtbl.value.abort.call(this, pboidreason, fretaining, fasync)
  end
  def get_transaction_info(this : ITransactionCloner*, pinfo : XACTTRANSINFO*) : HRESULT
    @lpVtbl.value.get_transaction_info.call(this, pinfo)
  end
  def clone_with_commit_disabled(this : ITransactionCloner*, ppitransaction : ITransaction*) : HRESULT
    @lpVtbl.value.clone_with_commit_disabled.call(this, ppitransaction)
  end
end
struct LibWin32::ITransaction2
  def query_interface(this : ITransaction2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITransaction2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITransaction2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def commit(this : ITransaction2*, fretaining : LibC::BOOL, grftc : UInt32, grfrm : UInt32) : HRESULT
    @lpVtbl.value.commit.call(this, fretaining, grftc, grfrm)
  end
  def abort(this : ITransaction2*, pboidreason : BOID*, fretaining : LibC::BOOL, fasync : LibC::BOOL) : HRESULT
    @lpVtbl.value.abort.call(this, pboidreason, fretaining, fasync)
  end
  def get_transaction_info(this : ITransaction2*, pinfo : XACTTRANSINFO*) : HRESULT
    @lpVtbl.value.get_transaction_info.call(this, pinfo)
  end
  def clone_with_commit_disabled(this : ITransaction2*, ppitransaction : ITransaction*) : HRESULT
    @lpVtbl.value.clone_with_commit_disabled.call(this, ppitransaction)
  end
  def get_transaction_info2(this : ITransaction2*, pinfo : XACTTRANSINFO*) : HRESULT
    @lpVtbl.value.get_transaction_info2.call(this, pinfo)
  end
end
struct LibWin32::ITransactionDispenser
  def query_interface(this : ITransactionDispenser*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITransactionDispenser*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITransactionDispenser*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_options_object(this : ITransactionDispenser*, ppoptions : ITransactionOptions*) : HRESULT
    @lpVtbl.value.get_options_object.call(this, ppoptions)
  end
  def begin_transaction(this : ITransactionDispenser*, punkouter : IUnknown, isolevel : Int32, isoflags : UInt32, poptions : ITransactionOptions, pptransaction : ITransaction*) : HRESULT
    @lpVtbl.value.begin_transaction.call(this, punkouter, isolevel, isoflags, poptions, pptransaction)
  end
end
struct LibWin32::ITransactionOptions
  def query_interface(this : ITransactionOptions*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITransactionOptions*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITransactionOptions*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_options(this : ITransactionOptions*, poptions : XACTOPT*) : HRESULT
    @lpVtbl.value.set_options.call(this, poptions)
  end
  def get_options(this : ITransactionOptions*, poptions : XACTOPT*) : HRESULT
    @lpVtbl.value.get_options.call(this, poptions)
  end
end
struct LibWin32::ITransactionOutcomeEvents
  def query_interface(this : ITransactionOutcomeEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITransactionOutcomeEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITransactionOutcomeEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def committed(this : ITransactionOutcomeEvents*, fretaining : LibC::BOOL, pnewuow : BOID*, hr : HRESULT) : HRESULT
    @lpVtbl.value.committed.call(this, fretaining, pnewuow, hr)
  end
  def aborted(this : ITransactionOutcomeEvents*, pboidreason : BOID*, fretaining : LibC::BOOL, pnewuow : BOID*, hr : HRESULT) : HRESULT
    @lpVtbl.value.aborted.call(this, pboidreason, fretaining, pnewuow, hr)
  end
  def heuristic_decision(this : ITransactionOutcomeEvents*, dwdecision : UInt32, pboidreason : BOID*, hr : HRESULT) : HRESULT
    @lpVtbl.value.heuristic_decision.call(this, dwdecision, pboidreason, hr)
  end
  def indoubt(this : ITransactionOutcomeEvents*) : HRESULT
    @lpVtbl.value.indoubt.call(this)
  end
end
struct LibWin32::ITmNodeName
  def query_interface(this : ITmNodeName*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITmNodeName*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITmNodeName*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_node_name_size(this : ITmNodeName*, pcbnodenamesize : UInt32*) : HRESULT
    @lpVtbl.value.get_node_name_size.call(this, pcbnodenamesize)
  end
  def get_node_name(this : ITmNodeName*, cbnodenamebuffersize : UInt32, pnodenamebuffer : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.get_node_name.call(this, cbnodenamebuffersize, pnodenamebuffer)
  end
end
struct LibWin32::IKernelTransaction
  def query_interface(this : IKernelTransaction*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IKernelTransaction*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IKernelTransaction*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_handle(this : IKernelTransaction*, phandle : LibC::HANDLE*) : HRESULT
    @lpVtbl.value.get_handle.call(this, phandle)
  end
end
struct LibWin32::ITransactionResourceAsync
  def query_interface(this : ITransactionResourceAsync*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITransactionResourceAsync*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITransactionResourceAsync*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def prepare_request(this : ITransactionResourceAsync*, fretaining : LibC::BOOL, grfrm : UInt32, fwantmoniker : LibC::BOOL, fsinglephase : LibC::BOOL) : HRESULT
    @lpVtbl.value.prepare_request.call(this, fretaining, grfrm, fwantmoniker, fsinglephase)
  end
  def commit_request(this : ITransactionResourceAsync*, grfrm : UInt32, pnewuow : BOID*) : HRESULT
    @lpVtbl.value.commit_request.call(this, grfrm, pnewuow)
  end
  def abort_request(this : ITransactionResourceAsync*, pboidreason : BOID*, fretaining : LibC::BOOL, pnewuow : BOID*) : HRESULT
    @lpVtbl.value.abort_request.call(this, pboidreason, fretaining, pnewuow)
  end
  def tm_down(this : ITransactionResourceAsync*) : HRESULT
    @lpVtbl.value.tm_down.call(this)
  end
end
struct LibWin32::ITransactionLastResourceAsync
  def query_interface(this : ITransactionLastResourceAsync*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITransactionLastResourceAsync*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITransactionLastResourceAsync*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def delegate_commit(this : ITransactionLastResourceAsync*, grfrm : UInt32) : HRESULT
    @lpVtbl.value.delegate_commit.call(this, grfrm)
  end
  def forget_request(this : ITransactionLastResourceAsync*, pnewuow : BOID*) : HRESULT
    @lpVtbl.value.forget_request.call(this, pnewuow)
  end
end
struct LibWin32::ITransactionResource
  def query_interface(this : ITransactionResource*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITransactionResource*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITransactionResource*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def prepare_request(this : ITransactionResource*, fretaining : LibC::BOOL, grfrm : UInt32, fwantmoniker : LibC::BOOL, fsinglephase : LibC::BOOL) : HRESULT
    @lpVtbl.value.prepare_request.call(this, fretaining, grfrm, fwantmoniker, fsinglephase)
  end
  def commit_request(this : ITransactionResource*, grfrm : UInt32, pnewuow : BOID*) : HRESULT
    @lpVtbl.value.commit_request.call(this, grfrm, pnewuow)
  end
  def abort_request(this : ITransactionResource*, pboidreason : BOID*, fretaining : LibC::BOOL, pnewuow : BOID*) : HRESULT
    @lpVtbl.value.abort_request.call(this, pboidreason, fretaining, pnewuow)
  end
  def tm_down(this : ITransactionResource*) : HRESULT
    @lpVtbl.value.tm_down.call(this)
  end
end
struct LibWin32::ITransactionEnlistmentAsync
  def query_interface(this : ITransactionEnlistmentAsync*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITransactionEnlistmentAsync*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITransactionEnlistmentAsync*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def prepare_request_done(this : ITransactionEnlistmentAsync*, hr : HRESULT, pmk : IMoniker, pboidreason : BOID*) : HRESULT
    @lpVtbl.value.prepare_request_done.call(this, hr, pmk, pboidreason)
  end
  def commit_request_done(this : ITransactionEnlistmentAsync*, hr : HRESULT) : HRESULT
    @lpVtbl.value.commit_request_done.call(this, hr)
  end
  def abort_request_done(this : ITransactionEnlistmentAsync*, hr : HRESULT) : HRESULT
    @lpVtbl.value.abort_request_done.call(this, hr)
  end
end
struct LibWin32::ITransactionLastEnlistmentAsync
  def query_interface(this : ITransactionLastEnlistmentAsync*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITransactionLastEnlistmentAsync*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITransactionLastEnlistmentAsync*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def transaction_outcome(this : ITransactionLastEnlistmentAsync*, xactstat : XACTSTAT, pboidreason : BOID*) : HRESULT
    @lpVtbl.value.transaction_outcome.call(this, xactstat, pboidreason)
  end
end
struct LibWin32::ITransactionExportFactory
  def query_interface(this : ITransactionExportFactory*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITransactionExportFactory*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITransactionExportFactory*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_remote_class_id(this : ITransactionExportFactory*, pclsid : Guid*) : HRESULT
    @lpVtbl.value.get_remote_class_id.call(this, pclsid)
  end
  def create(this : ITransactionExportFactory*, cbwhereabouts : UInt32, rgbwhereabouts : UInt8*, ppexport : ITransactionExport*) : HRESULT
    @lpVtbl.value.create.call(this, cbwhereabouts, rgbwhereabouts, ppexport)
  end
end
struct LibWin32::ITransactionImportWhereabouts
  def query_interface(this : ITransactionImportWhereabouts*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITransactionImportWhereabouts*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITransactionImportWhereabouts*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_whereabouts_size(this : ITransactionImportWhereabouts*, pcbwhereabouts : UInt32*) : HRESULT
    @lpVtbl.value.get_whereabouts_size.call(this, pcbwhereabouts)
  end
  def get_whereabouts(this : ITransactionImportWhereabouts*, cbwhereabouts : UInt32, rgbwhereabouts : UInt8*, pcbused : UInt32*) : HRESULT
    @lpVtbl.value.get_whereabouts.call(this, cbwhereabouts, rgbwhereabouts, pcbused)
  end
end
struct LibWin32::ITransactionExport
  def query_interface(this : ITransactionExport*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITransactionExport*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITransactionExport*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def export(this : ITransactionExport*, punktransaction : IUnknown, pcbtransactioncookie : UInt32*) : HRESULT
    @lpVtbl.value.export.call(this, punktransaction, pcbtransactioncookie)
  end
  def get_transaction_cookie(this : ITransactionExport*, punktransaction : IUnknown, cbtransactioncookie : UInt32, rgbtransactioncookie : UInt8*, pcbused : UInt32*) : HRESULT
    @lpVtbl.value.get_transaction_cookie.call(this, punktransaction, cbtransactioncookie, rgbtransactioncookie, pcbused)
  end
end
struct LibWin32::ITransactionImport
  def query_interface(this : ITransactionImport*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITransactionImport*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITransactionImport*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def import(this : ITransactionImport*, cbtransactioncookie : UInt32, rgbtransactioncookie : UInt8*, piid : Guid*, ppvtransaction : Void**) : HRESULT
    @lpVtbl.value.import.call(this, cbtransactioncookie, rgbtransactioncookie, piid, ppvtransaction)
  end
end
struct LibWin32::ITipTransaction
  def query_interface(this : ITipTransaction*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITipTransaction*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITipTransaction*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def push(this : ITipTransaction*, i_pszremotetmurl : UInt8*, o_ppszremotetxurl : PSTR*) : HRESULT
    @lpVtbl.value.push.call(this, i_pszremotetmurl, o_ppszremotetxurl)
  end
  def get_transaction_url(this : ITipTransaction*, o_ppszlocaltxurl : PSTR*) : HRESULT
    @lpVtbl.value.get_transaction_url.call(this, o_ppszlocaltxurl)
  end
end
struct LibWin32::ITipHelper
  def query_interface(this : ITipHelper*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITipHelper*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITipHelper*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def pull(this : ITipHelper*, i_psztxurl : UInt8*, o_ppitransaction : ITransaction*) : HRESULT
    @lpVtbl.value.pull.call(this, i_psztxurl, o_ppitransaction)
  end
  def pull_async(this : ITipHelper*, i_psztxurl : UInt8*, i_ptippullsink : ITipPullSink, o_ppitransaction : ITransaction*) : HRESULT
    @lpVtbl.value.pull_async.call(this, i_psztxurl, i_ptippullsink, o_ppitransaction)
  end
  def get_local_tm_url(this : ITipHelper*, o_ppszlocaltmurl : UInt8**) : HRESULT
    @lpVtbl.value.get_local_tm_url.call(this, o_ppszlocaltmurl)
  end
end
struct LibWin32::ITipPullSink
  def query_interface(this : ITipPullSink*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITipPullSink*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITipPullSink*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def pull_complete(this : ITipPullSink*, i_hrpull : HRESULT) : HRESULT
    @lpVtbl.value.pull_complete.call(this, i_hrpull)
  end
end
struct LibWin32::IDtcNetworkAccessConfig
  def query_interface(this : IDtcNetworkAccessConfig*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDtcNetworkAccessConfig*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDtcNetworkAccessConfig*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_any_network_access(this : IDtcNetworkAccessConfig*, pbanynetworkaccess : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_any_network_access.call(this, pbanynetworkaccess)
  end
  def set_any_network_access(this : IDtcNetworkAccessConfig*, banynetworkaccess : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_any_network_access.call(this, banynetworkaccess)
  end
  def get_network_administration_access(this : IDtcNetworkAccessConfig*, pbnetworkadministrationaccess : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_network_administration_access.call(this, pbnetworkadministrationaccess)
  end
  def set_network_administration_access(this : IDtcNetworkAccessConfig*, bnetworkadministrationaccess : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_network_administration_access.call(this, bnetworkadministrationaccess)
  end
  def get_network_transaction_access(this : IDtcNetworkAccessConfig*, pbnetworktransactionaccess : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_network_transaction_access.call(this, pbnetworktransactionaccess)
  end
  def set_network_transaction_access(this : IDtcNetworkAccessConfig*, bnetworktransactionaccess : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_network_transaction_access.call(this, bnetworktransactionaccess)
  end
  def get_network_client_access(this : IDtcNetworkAccessConfig*, pbnetworkclientaccess : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_network_client_access.call(this, pbnetworkclientaccess)
  end
  def set_network_client_access(this : IDtcNetworkAccessConfig*, bnetworkclientaccess : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_network_client_access.call(this, bnetworkclientaccess)
  end
  def get_network_tip_access(this : IDtcNetworkAccessConfig*, pbnetworktipaccess : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_network_tip_access.call(this, pbnetworktipaccess)
  end
  def set_network_tip_access(this : IDtcNetworkAccessConfig*, bnetworktipaccess : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_network_tip_access.call(this, bnetworktipaccess)
  end
  def get_xa_access(this : IDtcNetworkAccessConfig*, pbxaaccess : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_xa_access.call(this, pbxaaccess)
  end
  def set_xa_access(this : IDtcNetworkAccessConfig*, bxaaccess : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_xa_access.call(this, bxaaccess)
  end
  def restart_dtc_service(this : IDtcNetworkAccessConfig*) : HRESULT
    @lpVtbl.value.restart_dtc_service.call(this)
  end
end
struct LibWin32::IDtcNetworkAccessConfig2
  def query_interface(this : IDtcNetworkAccessConfig2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDtcNetworkAccessConfig2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDtcNetworkAccessConfig2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_any_network_access(this : IDtcNetworkAccessConfig2*, pbanynetworkaccess : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_any_network_access.call(this, pbanynetworkaccess)
  end
  def set_any_network_access(this : IDtcNetworkAccessConfig2*, banynetworkaccess : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_any_network_access.call(this, banynetworkaccess)
  end
  def get_network_administration_access(this : IDtcNetworkAccessConfig2*, pbnetworkadministrationaccess : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_network_administration_access.call(this, pbnetworkadministrationaccess)
  end
  def set_network_administration_access(this : IDtcNetworkAccessConfig2*, bnetworkadministrationaccess : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_network_administration_access.call(this, bnetworkadministrationaccess)
  end
  def get_network_transaction_access(this : IDtcNetworkAccessConfig2*, pbnetworktransactionaccess : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_network_transaction_access.call(this, pbnetworktransactionaccess)
  end
  def set_network_transaction_access(this : IDtcNetworkAccessConfig2*, bnetworktransactionaccess : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_network_transaction_access.call(this, bnetworktransactionaccess)
  end
  def get_network_client_access(this : IDtcNetworkAccessConfig2*, pbnetworkclientaccess : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_network_client_access.call(this, pbnetworkclientaccess)
  end
  def set_network_client_access(this : IDtcNetworkAccessConfig2*, bnetworkclientaccess : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_network_client_access.call(this, bnetworkclientaccess)
  end
  def get_network_tip_access(this : IDtcNetworkAccessConfig2*, pbnetworktipaccess : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_network_tip_access.call(this, pbnetworktipaccess)
  end
  def set_network_tip_access(this : IDtcNetworkAccessConfig2*, bnetworktipaccess : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_network_tip_access.call(this, bnetworktipaccess)
  end
  def get_xa_access(this : IDtcNetworkAccessConfig2*, pbxaaccess : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_xa_access.call(this, pbxaaccess)
  end
  def set_xa_access(this : IDtcNetworkAccessConfig2*, bxaaccess : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_xa_access.call(this, bxaaccess)
  end
  def restart_dtc_service(this : IDtcNetworkAccessConfig2*) : HRESULT
    @lpVtbl.value.restart_dtc_service.call(this)
  end
  def get_network_inbound_access(this : IDtcNetworkAccessConfig2*, pbinbound : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_network_inbound_access.call(this, pbinbound)
  end
  def get_network_outbound_access(this : IDtcNetworkAccessConfig2*, pboutbound : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_network_outbound_access.call(this, pboutbound)
  end
  def set_network_inbound_access(this : IDtcNetworkAccessConfig2*, binbound : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_network_inbound_access.call(this, binbound)
  end
  def set_network_outbound_access(this : IDtcNetworkAccessConfig2*, boutbound : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_network_outbound_access.call(this, boutbound)
  end
  def get_authentication_level(this : IDtcNetworkAccessConfig2*, pauthlevel : AUTHENTICATION_LEVEL*) : HRESULT
    @lpVtbl.value.get_authentication_level.call(this, pauthlevel)
  end
  def set_authentication_level(this : IDtcNetworkAccessConfig2*, authlevel : AUTHENTICATION_LEVEL) : HRESULT
    @lpVtbl.value.set_authentication_level.call(this, authlevel)
  end
end
struct LibWin32::IDtcNetworkAccessConfig3
  def query_interface(this : IDtcNetworkAccessConfig3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDtcNetworkAccessConfig3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDtcNetworkAccessConfig3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_any_network_access(this : IDtcNetworkAccessConfig3*, pbanynetworkaccess : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_any_network_access.call(this, pbanynetworkaccess)
  end
  def set_any_network_access(this : IDtcNetworkAccessConfig3*, banynetworkaccess : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_any_network_access.call(this, banynetworkaccess)
  end
  def get_network_administration_access(this : IDtcNetworkAccessConfig3*, pbnetworkadministrationaccess : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_network_administration_access.call(this, pbnetworkadministrationaccess)
  end
  def set_network_administration_access(this : IDtcNetworkAccessConfig3*, bnetworkadministrationaccess : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_network_administration_access.call(this, bnetworkadministrationaccess)
  end
  def get_network_transaction_access(this : IDtcNetworkAccessConfig3*, pbnetworktransactionaccess : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_network_transaction_access.call(this, pbnetworktransactionaccess)
  end
  def set_network_transaction_access(this : IDtcNetworkAccessConfig3*, bnetworktransactionaccess : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_network_transaction_access.call(this, bnetworktransactionaccess)
  end
  def get_network_client_access(this : IDtcNetworkAccessConfig3*, pbnetworkclientaccess : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_network_client_access.call(this, pbnetworkclientaccess)
  end
  def set_network_client_access(this : IDtcNetworkAccessConfig3*, bnetworkclientaccess : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_network_client_access.call(this, bnetworkclientaccess)
  end
  def get_network_tip_access(this : IDtcNetworkAccessConfig3*, pbnetworktipaccess : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_network_tip_access.call(this, pbnetworktipaccess)
  end
  def set_network_tip_access(this : IDtcNetworkAccessConfig3*, bnetworktipaccess : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_network_tip_access.call(this, bnetworktipaccess)
  end
  def get_xa_access(this : IDtcNetworkAccessConfig3*, pbxaaccess : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_xa_access.call(this, pbxaaccess)
  end
  def set_xa_access(this : IDtcNetworkAccessConfig3*, bxaaccess : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_xa_access.call(this, bxaaccess)
  end
  def restart_dtc_service(this : IDtcNetworkAccessConfig3*) : HRESULT
    @lpVtbl.value.restart_dtc_service.call(this)
  end
  def get_network_inbound_access(this : IDtcNetworkAccessConfig3*, pbinbound : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_network_inbound_access.call(this, pbinbound)
  end
  def get_network_outbound_access(this : IDtcNetworkAccessConfig3*, pboutbound : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_network_outbound_access.call(this, pboutbound)
  end
  def set_network_inbound_access(this : IDtcNetworkAccessConfig3*, binbound : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_network_inbound_access.call(this, binbound)
  end
  def set_network_outbound_access(this : IDtcNetworkAccessConfig3*, boutbound : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_network_outbound_access.call(this, boutbound)
  end
  def get_authentication_level(this : IDtcNetworkAccessConfig3*, pauthlevel : AUTHENTICATION_LEVEL*) : HRESULT
    @lpVtbl.value.get_authentication_level.call(this, pauthlevel)
  end
  def set_authentication_level(this : IDtcNetworkAccessConfig3*, authlevel : AUTHENTICATION_LEVEL) : HRESULT
    @lpVtbl.value.set_authentication_level.call(this, authlevel)
  end
  def get_lu_access(this : IDtcNetworkAccessConfig3*, pbluaccess : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_lu_access.call(this, pbluaccess)
  end
  def set_lu_access(this : IDtcNetworkAccessConfig3*, bluaccess : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_lu_access.call(this, bluaccess)
  end
end
struct LibWin32::IDtcToXaMapper
  def query_interface(this : IDtcToXaMapper*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDtcToXaMapper*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDtcToXaMapper*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def request_new_resource_manager(this : IDtcToXaMapper*, pszdsn : PSTR, pszclientdllname : PSTR, pdwrmcookie : UInt32*) : HRESULT
    @lpVtbl.value.request_new_resource_manager.call(this, pszdsn, pszclientdllname, pdwrmcookie)
  end
  def translate_trid_to_xid(this : IDtcToXaMapper*, pdwitransaction : UInt32*, dwrmcookie : UInt32, pxid : Xid_t*) : HRESULT
    @lpVtbl.value.translate_trid_to_xid.call(this, pdwitransaction, dwrmcookie, pxid)
  end
  def enlist_resource_manager(this : IDtcToXaMapper*, dwrmcookie : UInt32, pdwitransaction : UInt32*) : HRESULT
    @lpVtbl.value.enlist_resource_manager.call(this, dwrmcookie, pdwitransaction)
  end
  def release_resource_manager(this : IDtcToXaMapper*, dwrmcookie : UInt32) : HRESULT
    @lpVtbl.value.release_resource_manager.call(this, dwrmcookie)
  end
end
struct LibWin32::IDtcToXaHelperFactory
  def query_interface(this : IDtcToXaHelperFactory*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDtcToXaHelperFactory*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDtcToXaHelperFactory*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create(this : IDtcToXaHelperFactory*, pszdsn : PSTR, pszclientdllname : PSTR, pguidrm : Guid*, ppxahelper : IDtcToXaHelper*) : HRESULT
    @lpVtbl.value.create.call(this, pszdsn, pszclientdllname, pguidrm, ppxahelper)
  end
end
struct LibWin32::IDtcToXaHelper
  def query_interface(this : IDtcToXaHelper*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDtcToXaHelper*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDtcToXaHelper*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def close(this : IDtcToXaHelper*, i_fdorecovery : LibC::BOOL) : HRESULT
    @lpVtbl.value.close.call(this, i_fdorecovery)
  end
  def translate_trid_to_xid(this : IDtcToXaHelper*, pitransaction : ITransaction, pguidbqual : Guid*, pxid : Xid_t*) : HRESULT
    @lpVtbl.value.translate_trid_to_xid.call(this, pitransaction, pguidbqual, pxid)
  end
end
struct LibWin32::IDtcToXaHelperSinglePipe
  def query_interface(this : IDtcToXaHelperSinglePipe*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDtcToXaHelperSinglePipe*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDtcToXaHelperSinglePipe*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def xarm_create(this : IDtcToXaHelperSinglePipe*, pszdsn : PSTR, pszclientdll : PSTR, pdwrmcookie : UInt32*) : HRESULT
    @lpVtbl.value.xarm_create.call(this, pszdsn, pszclientdll, pdwrmcookie)
  end
  def convert_trid_to_xid(this : IDtcToXaHelperSinglePipe*, pdwitrans : UInt32*, dwrmcookie : UInt32, pxid : Xid_t*) : HRESULT
    @lpVtbl.value.convert_trid_to_xid.call(this, pdwitrans, dwrmcookie, pxid)
  end
  def enlist_with_rm(this : IDtcToXaHelperSinglePipe*, dwrmcookie : UInt32, i_pitransaction : ITransaction, i_pitransres : ITransactionResourceAsync, o_ppitransenslitment : ITransactionEnlistmentAsync*) : HRESULT
    @lpVtbl.value.enlist_with_rm.call(this, dwrmcookie, i_pitransaction, i_pitransres, o_ppitransenslitment)
  end
  def release_rm_cookie(this : IDtcToXaHelperSinglePipe*, i_dwrmcookie : UInt32, i_fnormal : LibC::BOOL) : Void
    @lpVtbl.value.release_rm_cookie.call(this, i_dwrmcookie, i_fnormal)
  end
end
struct LibWin32::IXATransLookup
  def query_interface(this : IXATransLookup*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IXATransLookup*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IXATransLookup*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def lookup(this : IXATransLookup*, pptransaction : ITransaction*) : HRESULT
    @lpVtbl.value.lookup.call(this, pptransaction)
  end
end
struct LibWin32::IXATransLookup2
  def query_interface(this : IXATransLookup2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IXATransLookup2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IXATransLookup2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def lookup(this : IXATransLookup2*, pxid : Xid_t*, pptransaction : ITransaction*) : HRESULT
    @lpVtbl.value.lookup.call(this, pxid, pptransaction)
  end
end
struct LibWin32::IResourceManagerSink
  def query_interface(this : IResourceManagerSink*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IResourceManagerSink*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IResourceManagerSink*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def tm_down(this : IResourceManagerSink*) : HRESULT
    @lpVtbl.value.tm_down.call(this)
  end
end
struct LibWin32::IResourceManager1
  def query_interface(this : IResourceManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IResourceManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IResourceManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def enlist(this : IResourceManager*, ptransaction : ITransaction, pres : ITransactionResourceAsync, puow : BOID*, pisolevel : Int32*, ppenlist : ITransactionEnlistmentAsync*) : HRESULT
    @lpVtbl.value.enlist.call(this, ptransaction, pres, puow, pisolevel, ppenlist)
  end
  def reenlist(this : IResourceManager*, pprepinfo : UInt8*, cbprepinfo : UInt32, ltimeout : UInt32, pxactstat : XACTSTAT*) : HRESULT
    @lpVtbl.value.reenlist.call(this, pprepinfo, cbprepinfo, ltimeout, pxactstat)
  end
  def reenlistment_complete(this : IResourceManager*) : HRESULT
    @lpVtbl.value.reenlistment_complete.call(this)
  end
  def get_distributed_transaction_manager(this : IResourceManager*, iid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.get_distributed_transaction_manager.call(this, iid, ppvobject)
  end
end
struct LibWin32::ILastResourceManager
  def query_interface(this : ILastResourceManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ILastResourceManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ILastResourceManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def transaction_committed(this : ILastResourceManager*, pprepinfo : UInt8*, cbprepinfo : UInt32) : HRESULT
    @lpVtbl.value.transaction_committed.call(this, pprepinfo, cbprepinfo)
  end
  def recovery_done(this : ILastResourceManager*) : HRESULT
    @lpVtbl.value.recovery_done.call(this)
  end
end
struct LibWin32::IResourceManager2
  def query_interface(this : IResourceManager2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IResourceManager2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IResourceManager2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def enlist(this : IResourceManager2*, ptransaction : ITransaction, pres : ITransactionResourceAsync, puow : BOID*, pisolevel : Int32*, ppenlist : ITransactionEnlistmentAsync*) : HRESULT
    @lpVtbl.value.enlist.call(this, ptransaction, pres, puow, pisolevel, ppenlist)
  end
  def reenlist(this : IResourceManager2*, pprepinfo : UInt8*, cbprepinfo : UInt32, ltimeout : UInt32, pxactstat : XACTSTAT*) : HRESULT
    @lpVtbl.value.reenlist.call(this, pprepinfo, cbprepinfo, ltimeout, pxactstat)
  end
  def reenlistment_complete(this : IResourceManager2*) : HRESULT
    @lpVtbl.value.reenlistment_complete.call(this)
  end
  def get_distributed_transaction_manager(this : IResourceManager2*, iid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.get_distributed_transaction_manager.call(this, iid, ppvobject)
  end
  def enlist2(this : IResourceManager2*, ptransaction : ITransaction, presasync : ITransactionResourceAsync, puow : BOID*, pisolevel : Int32*, pxid : Xid_t*, ppenlist : ITransactionEnlistmentAsync*) : HRESULT
    @lpVtbl.value.enlist2.call(this, ptransaction, presasync, puow, pisolevel, pxid, ppenlist)
  end
  def reenlist2(this : IResourceManager2*, pxid : Xid_t*, dwtimeout : UInt32, pxactstat : XACTSTAT*) : HRESULT
    @lpVtbl.value.reenlist2.call(this, pxid, dwtimeout, pxactstat)
  end
end
struct LibWin32::IResourceManagerRejoinable
  def query_interface(this : IResourceManagerRejoinable*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IResourceManagerRejoinable*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IResourceManagerRejoinable*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def enlist(this : IResourceManagerRejoinable*, ptransaction : ITransaction, pres : ITransactionResourceAsync, puow : BOID*, pisolevel : Int32*, ppenlist : ITransactionEnlistmentAsync*) : HRESULT
    @lpVtbl.value.enlist.call(this, ptransaction, pres, puow, pisolevel, ppenlist)
  end
  def reenlist(this : IResourceManagerRejoinable*, pprepinfo : UInt8*, cbprepinfo : UInt32, ltimeout : UInt32, pxactstat : XACTSTAT*) : HRESULT
    @lpVtbl.value.reenlist.call(this, pprepinfo, cbprepinfo, ltimeout, pxactstat)
  end
  def reenlistment_complete(this : IResourceManagerRejoinable*) : HRESULT
    @lpVtbl.value.reenlistment_complete.call(this)
  end
  def get_distributed_transaction_manager(this : IResourceManagerRejoinable*, iid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.get_distributed_transaction_manager.call(this, iid, ppvobject)
  end
  def enlist2(this : IResourceManagerRejoinable*, ptransaction : ITransaction, presasync : ITransactionResourceAsync, puow : BOID*, pisolevel : Int32*, pxid : Xid_t*, ppenlist : ITransactionEnlistmentAsync*) : HRESULT
    @lpVtbl.value.enlist2.call(this, ptransaction, presasync, puow, pisolevel, pxid, ppenlist)
  end
  def reenlist2(this : IResourceManagerRejoinable*, pxid : Xid_t*, dwtimeout : UInt32, pxactstat : XACTSTAT*) : HRESULT
    @lpVtbl.value.reenlist2.call(this, pxid, dwtimeout, pxactstat)
  end
  def rejoin(this : IResourceManagerRejoinable*, pprepinfo : UInt8*, cbprepinfo : UInt32, ltimeout : UInt32, pxactstat : XACTSTAT*) : HRESULT
    @lpVtbl.value.rejoin.call(this, pprepinfo, cbprepinfo, ltimeout, pxactstat)
  end
end
struct LibWin32::IXAConfig
  def query_interface(this : IXAConfig*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IXAConfig*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IXAConfig*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def initialize(this : IXAConfig*, clsidhelperdll : Guid) : HRESULT
    @lpVtbl.value.initialize.call(this, clsidhelperdll)
  end
  def terminate(this : IXAConfig*) : HRESULT
    @lpVtbl.value.terminate.call(this)
  end
end
struct LibWin32::IRMHelper
  def query_interface(this : IRMHelper*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRMHelper*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRMHelper*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def rm_count(this : IRMHelper*, dwctotalnumberofrms : UInt32) : HRESULT
    @lpVtbl.value.rm_count.call(this, dwctotalnumberofrms)
  end
  def rm_info(this : IRMHelper*, pxa_switch : Xa_switch_t*, fcdeclcallingconv : LibC::BOOL, pszopenstring : PSTR, pszclosestring : PSTR, guidrmrecovery : Guid) : HRESULT
    @lpVtbl.value.rm_info.call(this, pxa_switch, fcdeclcallingconv, pszopenstring, pszclosestring, guidrmrecovery)
  end
end
struct LibWin32::IXAObtainRMInfo
  def query_interface(this : IXAObtainRMInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IXAObtainRMInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IXAObtainRMInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def obtain_rm_info(this : IXAObtainRMInfo*, pirmhelper : IRMHelper) : HRESULT
    @lpVtbl.value.obtain_rm_info.call(this, pirmhelper)
  end
end
struct LibWin32::IResourceManagerFactory
  def query_interface(this : IResourceManagerFactory*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IResourceManagerFactory*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IResourceManagerFactory*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create(this : IResourceManagerFactory*, pguidrm : Guid*, pszrmname : PSTR, piresmgrsink : IResourceManagerSink, ppresmgr : IResourceManager*) : HRESULT
    @lpVtbl.value.create.call(this, pguidrm, pszrmname, piresmgrsink, ppresmgr)
  end
end
struct LibWin32::IResourceManagerFactory2
  def query_interface(this : IResourceManagerFactory2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IResourceManagerFactory2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IResourceManagerFactory2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create(this : IResourceManagerFactory2*, pguidrm : Guid*, pszrmname : PSTR, piresmgrsink : IResourceManagerSink, ppresmgr : IResourceManager*) : HRESULT
    @lpVtbl.value.create.call(this, pguidrm, pszrmname, piresmgrsink, ppresmgr)
  end
  def create_ex(this : IResourceManagerFactory2*, pguidrm : Guid*, pszrmname : PSTR, piresmgrsink : IResourceManagerSink, riidrequested : Guid*, ppvresmgr : Void**) : HRESULT
    @lpVtbl.value.create_ex.call(this, pguidrm, pszrmname, piresmgrsink, riidrequested, ppvresmgr)
  end
end
struct LibWin32::IPrepareInfo
  def query_interface(this : IPrepareInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IPrepareInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IPrepareInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_prepare_info_size(this : IPrepareInfo*, pcbprepinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_prepare_info_size.call(this, pcbprepinfo)
  end
  def get_prepare_info(this : IPrepareInfo*, pprepinfo : UInt8*) : HRESULT
    @lpVtbl.value.get_prepare_info.call(this, pprepinfo)
  end
end
struct LibWin32::IPrepareInfo2
  def query_interface(this : IPrepareInfo2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IPrepareInfo2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IPrepareInfo2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_prepare_info_size(this : IPrepareInfo2*, pcbprepinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_prepare_info_size.call(this, pcbprepinfo)
  end
  def get_prepare_info(this : IPrepareInfo2*, cbprepareinfo : UInt32, pprepinfo : UInt8*) : HRESULT
    @lpVtbl.value.get_prepare_info.call(this, cbprepareinfo, pprepinfo)
  end
end
struct LibWin32::IGetDispenser
  def query_interface(this : IGetDispenser*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGetDispenser*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGetDispenser*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_dispenser(this : IGetDispenser*, iid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.get_dispenser.call(this, iid, ppvobject)
  end
end
struct LibWin32::ITransactionVoterBallotAsync2
  def query_interface(this : ITransactionVoterBallotAsync2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITransactionVoterBallotAsync2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITransactionVoterBallotAsync2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def vote_request_done(this : ITransactionVoterBallotAsync2*, hr : HRESULT, pboidreason : BOID*) : HRESULT
    @lpVtbl.value.vote_request_done.call(this, hr, pboidreason)
  end
end
struct LibWin32::ITransactionVoterNotifyAsync2
  def query_interface(this : ITransactionVoterNotifyAsync2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITransactionVoterNotifyAsync2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITransactionVoterNotifyAsync2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def committed(this : ITransactionVoterNotifyAsync2*, fretaining : LibC::BOOL, pnewuow : BOID*, hr : HRESULT) : HRESULT
    @lpVtbl.value.committed.call(this, fretaining, pnewuow, hr)
  end
  def aborted(this : ITransactionVoterNotifyAsync2*, pboidreason : BOID*, fretaining : LibC::BOOL, pnewuow : BOID*, hr : HRESULT) : HRESULT
    @lpVtbl.value.aborted.call(this, pboidreason, fretaining, pnewuow, hr)
  end
  def heuristic_decision(this : ITransactionVoterNotifyAsync2*, dwdecision : UInt32, pboidreason : BOID*, hr : HRESULT) : HRESULT
    @lpVtbl.value.heuristic_decision.call(this, dwdecision, pboidreason, hr)
  end
  def indoubt(this : ITransactionVoterNotifyAsync2*) : HRESULT
    @lpVtbl.value.indoubt.call(this)
  end
  def vote_request(this : ITransactionVoterNotifyAsync2*) : HRESULT
    @lpVtbl.value.vote_request.call(this)
  end
end
struct LibWin32::ITransactionVoterFactory2
  def query_interface(this : ITransactionVoterFactory2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITransactionVoterFactory2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITransactionVoterFactory2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create(this : ITransactionVoterFactory2*, ptransaction : ITransaction, pvoternotify : ITransactionVoterNotifyAsync2, ppvoterballot : ITransactionVoterBallotAsync2*) : HRESULT
    @lpVtbl.value.create.call(this, ptransaction, pvoternotify, ppvoterballot)
  end
end
struct LibWin32::ITransactionPhase0EnlistmentAsync
  def query_interface(this : ITransactionPhase0EnlistmentAsync*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITransactionPhase0EnlistmentAsync*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITransactionPhase0EnlistmentAsync*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def enable(this : ITransactionPhase0EnlistmentAsync*) : HRESULT
    @lpVtbl.value.enable.call(this)
  end
  def wait_for_enlistment(this : ITransactionPhase0EnlistmentAsync*) : HRESULT
    @lpVtbl.value.wait_for_enlistment.call(this)
  end
  def phase0_done(this : ITransactionPhase0EnlistmentAsync*) : HRESULT
    @lpVtbl.value.phase0_done.call(this)
  end
  def unenlist(this : ITransactionPhase0EnlistmentAsync*) : HRESULT
    @lpVtbl.value.unenlist.call(this)
  end
  def get_transaction(this : ITransactionPhase0EnlistmentAsync*, ppitransaction : ITransaction*) : HRESULT
    @lpVtbl.value.get_transaction.call(this, ppitransaction)
  end
end
struct LibWin32::ITransactionPhase0NotifyAsync
  def query_interface(this : ITransactionPhase0NotifyAsync*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITransactionPhase0NotifyAsync*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITransactionPhase0NotifyAsync*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def phase0_request(this : ITransactionPhase0NotifyAsync*, fabortinghint : LibC::BOOL) : HRESULT
    @lpVtbl.value.phase0_request.call(this, fabortinghint)
  end
  def enlist_completed(this : ITransactionPhase0NotifyAsync*, status : HRESULT) : HRESULT
    @lpVtbl.value.enlist_completed.call(this, status)
  end
end
struct LibWin32::ITransactionPhase0Factory
  def query_interface(this : ITransactionPhase0Factory*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITransactionPhase0Factory*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITransactionPhase0Factory*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create(this : ITransactionPhase0Factory*, pphase0notify : ITransactionPhase0NotifyAsync, ppphase0enlistment : ITransactionPhase0EnlistmentAsync*) : HRESULT
    @lpVtbl.value.create.call(this, pphase0notify, ppphase0enlistment)
  end
end
struct LibWin32::ITransactionTransmitter
  def query_interface(this : ITransactionTransmitter*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITransactionTransmitter*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITransactionTransmitter*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set(this : ITransactionTransmitter*, ptransaction : ITransaction) : HRESULT
    @lpVtbl.value.set.call(this, ptransaction)
  end
  def get_propagation_token_size(this : ITransactionTransmitter*, pcbtoken : UInt32*) : HRESULT
    @lpVtbl.value.get_propagation_token_size.call(this, pcbtoken)
  end
  def marshal_propagation_token(this : ITransactionTransmitter*, cbtoken : UInt32, rgbtoken : UInt8*, pcbused : UInt32*) : HRESULT
    @lpVtbl.value.marshal_propagation_token.call(this, cbtoken, rgbtoken, pcbused)
  end
  def unmarshal_return_token(this : ITransactionTransmitter*, cbreturntoken : UInt32, rgbreturntoken : UInt8*) : HRESULT
    @lpVtbl.value.unmarshal_return_token.call(this, cbreturntoken, rgbreturntoken)
  end
  def reset(this : ITransactionTransmitter*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
end
struct LibWin32::ITransactionTransmitterFactory
  def query_interface(this : ITransactionTransmitterFactory*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITransactionTransmitterFactory*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITransactionTransmitterFactory*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create(this : ITransactionTransmitterFactory*, pptransmitter : ITransactionTransmitter*) : HRESULT
    @lpVtbl.value.create.call(this, pptransmitter)
  end
end
struct LibWin32::ITransactionReceiver
  def query_interface(this : ITransactionReceiver*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITransactionReceiver*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITransactionReceiver*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def unmarshal_propagation_token(this : ITransactionReceiver*, cbtoken : UInt32, rgbtoken : UInt8*, pptransaction : ITransaction*) : HRESULT
    @lpVtbl.value.unmarshal_propagation_token.call(this, cbtoken, rgbtoken, pptransaction)
  end
  def get_return_token_size(this : ITransactionReceiver*, pcbreturntoken : UInt32*) : HRESULT
    @lpVtbl.value.get_return_token_size.call(this, pcbreturntoken)
  end
  def marshal_return_token(this : ITransactionReceiver*, cbreturntoken : UInt32, rgbreturntoken : UInt8*, pcbused : UInt32*) : HRESULT
    @lpVtbl.value.marshal_return_token.call(this, cbreturntoken, rgbreturntoken, pcbused)
  end
  def reset(this : ITransactionReceiver*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
end
struct LibWin32::ITransactionReceiverFactory
  def query_interface(this : ITransactionReceiverFactory*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITransactionReceiverFactory*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITransactionReceiverFactory*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create(this : ITransactionReceiverFactory*, ppreceiver : ITransactionReceiver*) : HRESULT
    @lpVtbl.value.create.call(this, ppreceiver)
  end
end
struct LibWin32::IDtcLuConfigure
  def query_interface(this : IDtcLuConfigure*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDtcLuConfigure*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDtcLuConfigure*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def add(this : IDtcLuConfigure*, puclupair : UInt8*, cblupair : UInt32) : HRESULT
    @lpVtbl.value.add.call(this, puclupair, cblupair)
  end
  def delete(this : IDtcLuConfigure*, puclupair : UInt8*, cblupair : UInt32) : HRESULT
    @lpVtbl.value.delete.call(this, puclupair, cblupair)
  end
end
struct LibWin32::IDtcLuRecovery
  def query_interface(this : IDtcLuRecovery*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDtcLuRecovery*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDtcLuRecovery*) : UInt32
    @lpVtbl.value.release.call(this)
  end
end
struct LibWin32::IDtcLuRecoveryFactory
  def query_interface(this : IDtcLuRecoveryFactory*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDtcLuRecoveryFactory*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDtcLuRecoveryFactory*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create(this : IDtcLuRecoveryFactory*, puclupair : UInt8*, cblupair : UInt32, pprecovery : IDtcLuRecovery*) : HRESULT
    @lpVtbl.value.create.call(this, puclupair, cblupair, pprecovery)
  end
end
struct LibWin32::IDtcLuRecoveryInitiatedByDtcTransWork
  def query_interface(this : IDtcLuRecoveryInitiatedByDtcTransWork*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDtcLuRecoveryInitiatedByDtcTransWork*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDtcLuRecoveryInitiatedByDtcTransWork*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_log_name_sizes(this : IDtcLuRecoveryInitiatedByDtcTransWork*, pcbourlogname : UInt32*, pcbremotelogname : UInt32*) : HRESULT
    @lpVtbl.value.get_log_name_sizes.call(this, pcbourlogname, pcbremotelogname)
  end
  def get_our_xln(this : IDtcLuRecoveryInitiatedByDtcTransWork*, pxln : DtcLu_Xln*, pourlogname : UInt8*, premotelogname : UInt8*, pdwprotocol : UInt32*) : HRESULT
    @lpVtbl.value.get_our_xln.call(this, pxln, pourlogname, premotelogname, pdwprotocol)
  end
  def handle_confirmation_from_our_xln(this : IDtcLuRecoveryInitiatedByDtcTransWork*, confirmation : DtcLu_Xln_Confirmation) : HRESULT
    @lpVtbl.value.handle_confirmation_from_our_xln.call(this, confirmation)
  end
  def handle_their_xln_response(this : IDtcLuRecoveryInitiatedByDtcTransWork*, xln : DtcLu_Xln, premotelogname : UInt8*, cbremotelogname : UInt32, dwprotocol : UInt32, pconfirmation : DtcLu_Xln_Confirmation*) : HRESULT
    @lpVtbl.value.handle_their_xln_response.call(this, xln, premotelogname, cbremotelogname, dwprotocol, pconfirmation)
  end
  def handle_error_from_our_xln(this : IDtcLuRecoveryInitiatedByDtcTransWork*, error : DtcLu_Xln_Error) : HRESULT
    @lpVtbl.value.handle_error_from_our_xln.call(this, error)
  end
  def check_for_compare_states(this : IDtcLuRecoveryInitiatedByDtcTransWork*, fcomparestates : LibC::BOOL*) : HRESULT
    @lpVtbl.value.check_for_compare_states.call(this, fcomparestates)
  end
  def get_our_trans_id_size(this : IDtcLuRecoveryInitiatedByDtcTransWork*, pcbourtransid : UInt32*) : HRESULT
    @lpVtbl.value.get_our_trans_id_size.call(this, pcbourtransid)
  end
  def get_our_compare_states(this : IDtcLuRecoveryInitiatedByDtcTransWork*, pourtransid : UInt8*, pcomparestate : DtcLu_CompareState*) : HRESULT
    @lpVtbl.value.get_our_compare_states.call(this, pourtransid, pcomparestate)
  end
  def handle_their_compare_states_response(this : IDtcLuRecoveryInitiatedByDtcTransWork*, comparestate : DtcLu_CompareState, pconfirmation : DtcLu_CompareStates_Confirmation*) : HRESULT
    @lpVtbl.value.handle_their_compare_states_response.call(this, comparestate, pconfirmation)
  end
  def handle_error_from_our_compare_states(this : IDtcLuRecoveryInitiatedByDtcTransWork*, error : DtcLu_CompareStates_Error) : HRESULT
    @lpVtbl.value.handle_error_from_our_compare_states.call(this, error)
  end
  def conversation_lost(this : IDtcLuRecoveryInitiatedByDtcTransWork*) : HRESULT
    @lpVtbl.value.conversation_lost.call(this)
  end
  def get_recovery_seq_num(this : IDtcLuRecoveryInitiatedByDtcTransWork*, plrecoveryseqnum : Int32*) : HRESULT
    @lpVtbl.value.get_recovery_seq_num.call(this, plrecoveryseqnum)
  end
  def obsolete_recovery_seq_num(this : IDtcLuRecoveryInitiatedByDtcTransWork*, lnewrecoveryseqnum : Int32) : HRESULT
    @lpVtbl.value.obsolete_recovery_seq_num.call(this, lnewrecoveryseqnum)
  end
end
struct LibWin32::IDtcLuRecoveryInitiatedByDtcStatusWork
  def query_interface(this : IDtcLuRecoveryInitiatedByDtcStatusWork*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDtcLuRecoveryInitiatedByDtcStatusWork*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDtcLuRecoveryInitiatedByDtcStatusWork*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def handle_check_lu_status(this : IDtcLuRecoveryInitiatedByDtcStatusWork*, lrecoveryseqnum : Int32) : HRESULT
    @lpVtbl.value.handle_check_lu_status.call(this, lrecoveryseqnum)
  end
end
struct LibWin32::IDtcLuRecoveryInitiatedByDtc
  def query_interface(this : IDtcLuRecoveryInitiatedByDtc*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDtcLuRecoveryInitiatedByDtc*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDtcLuRecoveryInitiatedByDtc*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_work(this : IDtcLuRecoveryInitiatedByDtc*, pwork : DtcLu_LocalRecovery_Work*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_work.call(this, pwork, ppv)
  end
end
struct LibWin32::IDtcLuRecoveryInitiatedByLuWork
  def query_interface(this : IDtcLuRecoveryInitiatedByLuWork*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDtcLuRecoveryInitiatedByLuWork*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDtcLuRecoveryInitiatedByLuWork*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def handle_their_xln(this : IDtcLuRecoveryInitiatedByLuWork*, lrecoveryseqnum : Int32, xln : DtcLu_Xln, premotelogname : UInt8*, cbremotelogname : UInt32, pourlogname : UInt8*, cbourlogname : UInt32, dwprotocol : UInt32, presponse : DtcLu_Xln_Response*) : HRESULT
    @lpVtbl.value.handle_their_xln.call(this, lrecoveryseqnum, xln, premotelogname, cbremotelogname, pourlogname, cbourlogname, dwprotocol, presponse)
  end
  def get_our_log_name_size(this : IDtcLuRecoveryInitiatedByLuWork*, pcbourlogname : UInt32*) : HRESULT
    @lpVtbl.value.get_our_log_name_size.call(this, pcbourlogname)
  end
  def get_our_xln(this : IDtcLuRecoveryInitiatedByLuWork*, pxln : DtcLu_Xln*, pourlogname : UInt8*, pdwprotocol : UInt32*) : HRESULT
    @lpVtbl.value.get_our_xln.call(this, pxln, pourlogname, pdwprotocol)
  end
  def handle_confirmation_of_our_xln(this : IDtcLuRecoveryInitiatedByLuWork*, confirmation : DtcLu_Xln_Confirmation) : HRESULT
    @lpVtbl.value.handle_confirmation_of_our_xln.call(this, confirmation)
  end
  def handle_their_compare_states(this : IDtcLuRecoveryInitiatedByLuWork*, premotetransid : UInt8*, cbremotetransid : UInt32, comparestate : DtcLu_CompareState, presponse : DtcLu_CompareStates_Response*, pcomparestate : DtcLu_CompareState*) : HRESULT
    @lpVtbl.value.handle_their_compare_states.call(this, premotetransid, cbremotetransid, comparestate, presponse, pcomparestate)
  end
  def handle_confirmation_of_our_compare_states(this : IDtcLuRecoveryInitiatedByLuWork*, confirmation : DtcLu_CompareStates_Confirmation) : HRESULT
    @lpVtbl.value.handle_confirmation_of_our_compare_states.call(this, confirmation)
  end
  def handle_error_from_our_compare_states(this : IDtcLuRecoveryInitiatedByLuWork*, error : DtcLu_CompareStates_Error) : HRESULT
    @lpVtbl.value.handle_error_from_our_compare_states.call(this, error)
  end
  def conversation_lost(this : IDtcLuRecoveryInitiatedByLuWork*) : HRESULT
    @lpVtbl.value.conversation_lost.call(this)
  end
end
struct LibWin32::IDtcLuRecoveryInitiatedByLu
  def query_interface(this : IDtcLuRecoveryInitiatedByLu*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDtcLuRecoveryInitiatedByLu*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDtcLuRecoveryInitiatedByLu*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_object_to_handle_work_from_lu(this : IDtcLuRecoveryInitiatedByLu*, ppwork : IDtcLuRecoveryInitiatedByLuWork*) : HRESULT
    @lpVtbl.value.get_object_to_handle_work_from_lu.call(this, ppwork)
  end
end
struct LibWin32::IDtcLuRmEnlistment
  def query_interface(this : IDtcLuRmEnlistment*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDtcLuRmEnlistment*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDtcLuRmEnlistment*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def unplug(this : IDtcLuRmEnlistment*, fconversationlost : LibC::BOOL) : HRESULT
    @lpVtbl.value.unplug.call(this, fconversationlost)
  end
  def backed_out(this : IDtcLuRmEnlistment*) : HRESULT
    @lpVtbl.value.backed_out.call(this)
  end
  def back_out(this : IDtcLuRmEnlistment*) : HRESULT
    @lpVtbl.value.back_out.call(this)
  end
  def committed(this : IDtcLuRmEnlistment*) : HRESULT
    @lpVtbl.value.committed.call(this)
  end
  def forget(this : IDtcLuRmEnlistment*) : HRESULT
    @lpVtbl.value.forget.call(this)
  end
  def request_commit(this : IDtcLuRmEnlistment*) : HRESULT
    @lpVtbl.value.request_commit.call(this)
  end
end
struct LibWin32::IDtcLuRmEnlistmentSink
  def query_interface(this : IDtcLuRmEnlistmentSink*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDtcLuRmEnlistmentSink*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDtcLuRmEnlistmentSink*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def ack_unplug(this : IDtcLuRmEnlistmentSink*) : HRESULT
    @lpVtbl.value.ack_unplug.call(this)
  end
  def tm_down(this : IDtcLuRmEnlistmentSink*) : HRESULT
    @lpVtbl.value.tm_down.call(this)
  end
  def session_lost(this : IDtcLuRmEnlistmentSink*) : HRESULT
    @lpVtbl.value.session_lost.call(this)
  end
  def backed_out(this : IDtcLuRmEnlistmentSink*) : HRESULT
    @lpVtbl.value.backed_out.call(this)
  end
  def back_out(this : IDtcLuRmEnlistmentSink*) : HRESULT
    @lpVtbl.value.back_out.call(this)
  end
  def committed(this : IDtcLuRmEnlistmentSink*) : HRESULT
    @lpVtbl.value.committed.call(this)
  end
  def forget(this : IDtcLuRmEnlistmentSink*) : HRESULT
    @lpVtbl.value.forget.call(this)
  end
  def prepare(this : IDtcLuRmEnlistmentSink*) : HRESULT
    @lpVtbl.value.prepare.call(this)
  end
  def request_commit(this : IDtcLuRmEnlistmentSink*) : HRESULT
    @lpVtbl.value.request_commit.call(this)
  end
end
struct LibWin32::IDtcLuRmEnlistmentFactory
  def query_interface(this : IDtcLuRmEnlistmentFactory*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDtcLuRmEnlistmentFactory*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDtcLuRmEnlistmentFactory*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create(this : IDtcLuRmEnlistmentFactory*, puclupair : UInt8*, cblupair : UInt32, pitransaction : ITransaction, ptransid : UInt8*, cbtransid : UInt32, prmenlistmentsink : IDtcLuRmEnlistmentSink, pprmenlistment : IDtcLuRmEnlistment*) : HRESULT
    @lpVtbl.value.create.call(this, puclupair, cblupair, pitransaction, ptransid, cbtransid, prmenlistmentsink, pprmenlistment)
  end
end
struct LibWin32::IDtcLuSubordinateDtc
  def query_interface(this : IDtcLuSubordinateDtc*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDtcLuSubordinateDtc*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDtcLuSubordinateDtc*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def unplug(this : IDtcLuSubordinateDtc*, fconversationlost : LibC::BOOL) : HRESULT
    @lpVtbl.value.unplug.call(this, fconversationlost)
  end
  def backed_out(this : IDtcLuSubordinateDtc*) : HRESULT
    @lpVtbl.value.backed_out.call(this)
  end
  def back_out(this : IDtcLuSubordinateDtc*) : HRESULT
    @lpVtbl.value.back_out.call(this)
  end
  def committed(this : IDtcLuSubordinateDtc*) : HRESULT
    @lpVtbl.value.committed.call(this)
  end
  def forget(this : IDtcLuSubordinateDtc*) : HRESULT
    @lpVtbl.value.forget.call(this)
  end
  def prepare(this : IDtcLuSubordinateDtc*) : HRESULT
    @lpVtbl.value.prepare.call(this)
  end
  def request_commit(this : IDtcLuSubordinateDtc*) : HRESULT
    @lpVtbl.value.request_commit.call(this)
  end
end
struct LibWin32::IDtcLuSubordinateDtcSink
  def query_interface(this : IDtcLuSubordinateDtcSink*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDtcLuSubordinateDtcSink*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDtcLuSubordinateDtcSink*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def ack_unplug(this : IDtcLuSubordinateDtcSink*) : HRESULT
    @lpVtbl.value.ack_unplug.call(this)
  end
  def tm_down(this : IDtcLuSubordinateDtcSink*) : HRESULT
    @lpVtbl.value.tm_down.call(this)
  end
  def session_lost(this : IDtcLuSubordinateDtcSink*) : HRESULT
    @lpVtbl.value.session_lost.call(this)
  end
  def backed_out(this : IDtcLuSubordinateDtcSink*) : HRESULT
    @lpVtbl.value.backed_out.call(this)
  end
  def back_out(this : IDtcLuSubordinateDtcSink*) : HRESULT
    @lpVtbl.value.back_out.call(this)
  end
  def committed(this : IDtcLuSubordinateDtcSink*) : HRESULT
    @lpVtbl.value.committed.call(this)
  end
  def forget(this : IDtcLuSubordinateDtcSink*) : HRESULT
    @lpVtbl.value.forget.call(this)
  end
  def request_commit(this : IDtcLuSubordinateDtcSink*) : HRESULT
    @lpVtbl.value.request_commit.call(this)
  end
end
struct LibWin32::IDtcLuSubordinateDtcFactory
  def query_interface(this : IDtcLuSubordinateDtcFactory*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDtcLuSubordinateDtcFactory*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDtcLuSubordinateDtcFactory*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create(this : IDtcLuSubordinateDtcFactory*, puclupair : UInt8*, cblupair : UInt32, punktransactionouter : IUnknown, isolevel : Int32, isoflags : UInt32, poptions : ITransactionOptions, pptransaction : ITransaction*, ptransid : UInt8*, cbtransid : UInt32, psubordinatedtcsink : IDtcLuSubordinateDtcSink, ppsubordinatedtc : IDtcLuSubordinateDtc*) : HRESULT
    @lpVtbl.value.create.call(this, puclupair, cblupair, punktransactionouter, isolevel, isoflags, poptions, pptransaction, ptransid, cbtransid, psubordinatedtcsink, ppsubordinatedtc)
  end
end
