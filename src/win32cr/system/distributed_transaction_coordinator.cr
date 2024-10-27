require "./../foundation.cr"
require "./com.cr"

module Win32cr::System::DistributedTransactionCoordinator
  alias DTC_GET_TRANSACTION_MANAGER = Proc(Win32cr::Foundation::PSTR, Win32cr::Foundation::PSTR, LibC::GUID*, UInt32, UInt16, Void*, Void**, Win32cr::Foundation::HRESULT)*

  alias DTC_GET_TRANSACTION_MANAGER_EX_A = Proc(Win32cr::Foundation::PSTR, Win32cr::Foundation::PSTR, LibC::GUID*, UInt32, Void*, Void**, Win32cr::Foundation::HRESULT)*

  alias DTC_GET_TRANSACTION_MANAGER_EX_W = Proc(Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, LibC::GUID*, UInt32, Void*, Void**, Win32cr::Foundation::HRESULT)*

  alias DTC_INSTALL_CLIENT = Proc(Int8*, UInt32, UInt32, Win32cr::Foundation::HRESULT)*

  alias XA_OPEN_EPT = Proc(Win32cr::Foundation::PSTR, Int32, Int32, Int32)*

  alias XA_CLOSE_EPT = Proc(Win32cr::Foundation::PSTR, Int32, Int32, Int32)*

  alias XA_START_EPT = Proc(Win32cr::System::DistributedTransactionCoordinator::Xid_t*, Int32, Int32, Int32)*

  alias XA_END_EPT = Proc(Win32cr::System::DistributedTransactionCoordinator::Xid_t*, Int32, Int32, Int32)*

  alias XA_ROLLBACK_EPT = Proc(Win32cr::System::DistributedTransactionCoordinator::Xid_t*, Int32, Int32, Int32)*

  alias XA_PREPARE_EPT = Proc(Win32cr::System::DistributedTransactionCoordinator::Xid_t*, Int32, Int32, Int32)*

  alias XA_COMMIT_EPT = Proc(Win32cr::System::DistributedTransactionCoordinator::Xid_t*, Int32, Int32, Int32)*

  alias XA_RECOVER_EPT = Proc(Win32cr::System::DistributedTransactionCoordinator::Xid_t*, Int32, Int32, Int32, Int32)*

  alias XA_FORGET_EPT = Proc(Win32cr::System::DistributedTransactionCoordinator::Xid_t*, Int32, Int32, Int32)*

  alias XA_COMPLETE_EPT = Proc(Int32*, Int32*, Int32, Int32, Int32)*

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

  enum DTC_STATUS_
    DTC_STATUS_UNKNOWN = 0_i32
    DTC_STATUS_STARTING = 1_i32
    DTC_STATUS_STARTED = 2_i32
    DTC_STATUS_PAUSING = 3_i32
    DTC_STATUS_PAUSED = 4_i32
    DTC_STATUS_CONTINUING = 5_i32
    DTC_STATUS_STOPPING = 6_i32
    DTC_STATUS_STOPPED = 7_i32
    DTC_STATUS_E_CANTCONTROL = 8_i32
    DTC_STATUS_FAILED = 9_i32
  end
  enum TX_MISC_CONSTANTS
    MAX_TRAN_DESC = 40_i32
  end
  enum ISOLATIONLEVEL
    ISOLATIONLEVEL_UNSPECIFIED = -1_i32
    ISOLATIONLEVEL_CHAOS = 16_i32
    ISOLATIONLEVEL_READUNCOMMITTED = 256_i32
    ISOLATIONLEVEL_BROWSE = 256_i32
    ISOLATIONLEVEL_CURSORSTABILITY = 4096_i32
    ISOLATIONLEVEL_READCOMMITTED = 4096_i32
    ISOLATIONLEVEL_REPEATABLEREAD = 65536_i32
    ISOLATIONLEVEL_SERIALIZABLE = 1048576_i32
    ISOLATIONLEVEL_ISOLATED = 1048576_i32
  end
  enum ISOFLAG
    ISOFLAG_RETAIN_COMMIT_DC = 1_i32
    ISOFLAG_RETAIN_COMMIT = 2_i32
    ISOFLAG_RETAIN_COMMIT_NO = 3_i32
    ISOFLAG_RETAIN_ABORT_DC = 4_i32
    ISOFLAG_RETAIN_ABORT = 8_i32
    ISOFLAG_RETAIN_ABORT_NO = 12_i32
    ISOFLAG_RETAIN_DONTCARE = 5_i32
    ISOFLAG_RETAIN_BOTH = 10_i32
    ISOFLAG_RETAIN_NONE = 15_i32
    ISOFLAG_OPTIMISTIC = 16_i32
    ISOFLAG_READONLY = 32_i32
  end
  enum XACTTC
    XACTTC_NONE = 0_i32
    XACTTC_SYNC_PHASEONE = 1_i32
    XACTTC_SYNC_PHASETWO = 2_i32
    XACTTC_SYNC = 2_i32
    XACTTC_ASYNC_PHASEONE = 4_i32
    XACTTC_ASYNC = 4_i32
  end
  enum XACTRM
    XACTRM_OPTIMISTICLASTWINS = 1_i32
    XACTRM_NOREADONLYPREPARES = 2_i32
  end
  enum XACTCONST
    XACTCONST_TIMEOUTINFINITE = 0_i32
  end
  enum XACTHEURISTIC
    XACTHEURISTIC_ABORT = 1_i32
    XACTHEURISTIC_COMMIT = 2_i32
    XACTHEURISTIC_DAMAGE = 3_i32
    XACTHEURISTIC_DANGER = 4_i32
  end
  enum XACTSTAT
    XACTSTAT_NONE = 0_i32
    XACTSTAT_OPENNORMAL = 1_i32
    XACTSTAT_OPENREFUSED = 2_i32
    XACTSTAT_PREPARING = 4_i32
    XACTSTAT_PREPARED = 8_i32
    XACTSTAT_PREPARERETAINING = 16_i32
    XACTSTAT_PREPARERETAINED = 32_i32
    XACTSTAT_COMMITTING = 64_i32
    XACTSTAT_COMMITRETAINING = 128_i32
    XACTSTAT_ABORTING = 256_i32
    XACTSTAT_ABORTED = 512_i32
    XACTSTAT_COMMITTED = 1024_i32
    XACTSTAT_HEURISTIC_ABORT = 2048_i32
    XACTSTAT_HEURISTIC_COMMIT = 4096_i32
    XACTSTAT_HEURISTIC_DAMAGE = 8192_i32
    XACTSTAT_HEURISTIC_DANGER = 16384_i32
    XACTSTAT_FORCED_ABORT = 32768_i32
    XACTSTAT_FORCED_COMMIT = 65536_i32
    XACTSTAT_INDOUBT = 131072_i32
    XACTSTAT_CLOSED = 262144_i32
    XACTSTAT_OPEN = 3_i32
    XACTSTAT_NOTPREPARED = 524227_i32
    XACTSTAT_ALL = 524287_i32
  end
  enum AUTHENTICATION_LEVEL
    NO_AUTHENTICATION_REQUIRED = 0_i32
    INCOMING_AUTHENTICATION_REQUIRED = 1_i32
    MUTUAL_AUTHENTICATION_REQUIRED = 2_i32
  end
  enum APPLICATIONTYPE
    LOCAL_APPLICATIONTYPE = 0_i32
    CLUSTERRESOURCE_APPLICATIONTYPE = 1_i32
  end
  enum XACT_DTC_CONSTANTS
    XACT_E_CONNECTION_REQUEST_DENIED = -2147168000_i32
    XACT_E_TOOMANY_ENLISTMENTS = -2147167999_i32
    XACT_E_DUPLICATE_GUID = -2147167998_i32
    XACT_E_NOTSINGLEPHASE = -2147167997_i32
    XACT_E_RECOVERYALREADYDONE = -2147167996_i32
    XACT_E_PROTOCOL = -2147167995_i32
    XACT_E_RM_FAILURE = -2147167994_i32
    XACT_E_RECOVERY_FAILED = -2147167993_i32
    XACT_E_LU_NOT_FOUND = -2147167992_i32
    XACT_E_DUPLICATE_LU = -2147167991_i32
    XACT_E_LU_NOT_CONNECTED = -2147167990_i32
    XACT_E_DUPLICATE_TRANSID = -2147167989_i32
    XACT_E_LU_BUSY = -2147167988_i32
    XACT_E_LU_NO_RECOVERY_PROCESS = -2147167987_i32
    XACT_E_LU_DOWN = -2147167986_i32
    XACT_E_LU_RECOVERING = -2147167985_i32
    XACT_E_LU_RECOVERY_MISMATCH = -2147167984_i32
    XACT_E_RM_UNAVAILABLE = -2147167983_i32
    XACT_E_LRMRECOVERYALREADYDONE = -2147167982_i32
    XACT_E_NOLASTRESOURCEINTERFACE = -2147167981_i32
    XACT_S_NONOTIFY = 315648_i32
    XACT_OK_NONOTIFY = 315649_i32
    Dwuser_ms_sqlserver = 65535_i32
  end
  enum DtcLu_LocalRecovery_Work
    DTCINITIATEDRECOVERYWORK_CHECKLUSTATUS = 1_i32
    DTCINITIATEDRECOVERYWORK_TRANS = 2_i32
    DTCINITIATEDRECOVERYWORK_TMDOWN = 3_i32
  end
  enum DtcLu_Xln
    DTCLUXLN_COLD = 1_i32
    DTCLUXLN_WARM = 2_i32
  end
  enum DtcLu_Xln_Confirmation
    DTCLUXLNCONFIRMATION_CONFIRM = 1_i32
    DTCLUXLNCONFIRMATION_LOGNAMEMISMATCH = 2_i32
    DTCLUXLNCONFIRMATION_COLDWARMMISMATCH = 3_i32
    DTCLUXLNCONFIRMATION_OBSOLETE = 4_i32
  end
  enum DtcLu_Xln_Response
    DTCLUXLNRESPONSE_OK_SENDOURXLNBACK = 1_i32
    DTCLUXLNRESPONSE_OK_SENDCONFIRMATION = 2_i32
    DTCLUXLNRESPONSE_LOGNAMEMISMATCH = 3_i32
    DTCLUXLNRESPONSE_COLDWARMMISMATCH = 4_i32
  end
  enum DtcLu_Xln_Error
    DTCLUXLNERROR_PROTOCOL = 1_i32
    DTCLUXLNERROR_LOGNAMEMISMATCH = 2_i32
    DTCLUXLNERROR_COLDWARMMISMATCH = 3_i32
  end
  enum DtcLu_CompareState
    DTCLUCOMPARESTATE_COMMITTED = 1_i32
    DTCLUCOMPARESTATE_HEURISTICCOMMITTED = 2_i32
    DTCLUCOMPARESTATE_HEURISTICMIXED = 3_i32
    DTCLUCOMPARESTATE_HEURISTICRESET = 4_i32
    DTCLUCOMPARESTATE_INDOUBT = 5_i32
    DTCLUCOMPARESTATE_RESET = 6_i32
  end
  enum DtcLu_CompareStates_Confirmation
    DTCLUCOMPARESTATESCONFIRMATION_CONFIRM = 1_i32
    DTCLUCOMPARESTATESCONFIRMATION_PROTOCOL = 2_i32
  end
  enum DtcLu_CompareStates_Error
    DTCLUCOMPARESTATESERROR_PROTOCOL = 1_i32
  end
  enum DtcLu_CompareStates_Response
    DTCLUCOMPARESTATESRESPONSE_OK = 1_i32
    DTCLUCOMPARESTATESRESPONSE_PROTOCOL = 2_i32
  end

  @[Extern]
  record BOID,
    rgb : UInt8[16]

  @[Extern]
  record XACTTRANSINFO,
    uow : Win32cr::System::DistributedTransactionCoordinator::BOID,
    isoLevel : Int32,
    isoFlags : UInt32,
    grfTCSupported : UInt32,
    grfRMSupported : UInt32,
    grfTCSupportedRetaining : UInt32,
    grfRMSupportedRetaining : UInt32

  @[Extern]
  record XACTSTATS,
    cOpen : UInt32,
    cCommitting : UInt32,
    cCommitted : UInt32,
    cAborting : UInt32,
    cAborted : UInt32,
    cInDoubt : UInt32,
    cHeuristicDecision : UInt32,
    timeTransactionsUp : Win32cr::Foundation::FILETIME

  @[Extern]
  record XACTOPT,
    ulTimeout : UInt32,
    szDescription : UInt8[40]

  @[Extern]
  record Xid_t,
    formatID : Int32,
    gtrid_length : Int32,
    bqual_length : Int32,
    data : Win32cr::Foundation::CHAR[128]

  @[Extern]
  record Xa_switch_t,
    name : Win32cr::Foundation::CHAR[32],
    flags : Int32,
    version : Int32,
    xa_open_entry : LibC::IntPtrT,
    xa_close_entry : LibC::IntPtrT,
    xa_start_entry : LibC::IntPtrT,
    xa_end_entry : LibC::IntPtrT,
    xa_rollback_entry : LibC::IntPtrT,
    xa_prepare_entry : LibC::IntPtrT,
    xa_commit_entry : LibC::IntPtrT,
    xa_recover_entry : LibC::IntPtrT,
    xa_forget_entry : LibC::IntPtrT,
    xa_complete_entry : LibC::IntPtrT

  @[Extern]
  record OLE_TM_CONFIG_PARAMS_V1,
    dwVersion : UInt32,
    dwcConcurrencyHint : UInt32

  @[Extern]
  record OLE_TM_CONFIG_PARAMS_V2,
    dwVersion : UInt32,
    dwcConcurrencyHint : UInt32,
    applicationType : Win32cr::System::DistributedTransactionCoordinator::APPLICATIONTYPE,
    clusterResourceId : LibC::GUID

  @[Extern]
  record ProxyConfigParams,
    wcThreadsMax : UInt16

  @[Extern]
  record ITransactionVtbl,
    query_interface : Proc(ITransaction*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITransaction*, UInt32),
    release : Proc(ITransaction*, UInt32),
    commit : Proc(ITransaction*, Win32cr::Foundation::BOOL, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    abort : Proc(ITransaction*, Win32cr::System::DistributedTransactionCoordinator::BOID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_transaction_info : Proc(ITransaction*, Win32cr::System::DistributedTransactionCoordinator::XACTTRANSINFO*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0fb15084-af41-11ce-bd2b-204c4f4f5020")]
  record ITransaction, lpVtbl : ITransactionVtbl* do
    GUID = LibC::GUID.new(0xfb15084_u32, 0xaf41_u16, 0x11ce_u16, StaticArray[0xbd_u8, 0x2b_u8, 0x20_u8, 0x4c_u8, 0x4f_u8, 0x4f_u8, 0x50_u8, 0x20_u8])
    def query_interface(this : ITransaction*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITransaction*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITransaction*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def commit(this : ITransaction*, fRetaining : Win32cr::Foundation::BOOL, grfTC : UInt32, grfRM : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this, fRetaining, grfTC, grfRM)
    end
    def abort(this : ITransaction*, pboidReason : Win32cr::System::DistributedTransactionCoordinator::BOID*, fRetaining : Win32cr::Foundation::BOOL, fAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.abort.call(this, pboidReason, fRetaining, fAsync)
    end
    def get_transaction_info(this : ITransaction*, pinfo : Win32cr::System::DistributedTransactionCoordinator::XACTTRANSINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transaction_info.call(this, pinfo)
    end

  end

  @[Extern]
  record ITransactionClonerVtbl,
    query_interface : Proc(ITransactionCloner*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITransactionCloner*, UInt32),
    release : Proc(ITransactionCloner*, UInt32),
    commit : Proc(ITransactionCloner*, Win32cr::Foundation::BOOL, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    abort : Proc(ITransactionCloner*, Win32cr::System::DistributedTransactionCoordinator::BOID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_transaction_info : Proc(ITransactionCloner*, Win32cr::System::DistributedTransactionCoordinator::XACTTRANSINFO*, Win32cr::Foundation::HRESULT),
    clone_with_commit_disabled : Proc(ITransactionCloner*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("02656950-2152-11d0-944c-00a0c905416e")]
  record ITransactionCloner, lpVtbl : ITransactionClonerVtbl* do
    GUID = LibC::GUID.new(0x2656950_u32, 0x2152_u16, 0x11d0_u16, StaticArray[0x94_u8, 0x4c_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
    def query_interface(this : ITransactionCloner*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITransactionCloner*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITransactionCloner*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def commit(this : ITransactionCloner*, fRetaining : Win32cr::Foundation::BOOL, grfTC : UInt32, grfRM : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this, fRetaining, grfTC, grfRM)
    end
    def abort(this : ITransactionCloner*, pboidReason : Win32cr::System::DistributedTransactionCoordinator::BOID*, fRetaining : Win32cr::Foundation::BOOL, fAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.abort.call(this, pboidReason, fRetaining, fAsync)
    end
    def get_transaction_info(this : ITransactionCloner*, pinfo : Win32cr::System::DistributedTransactionCoordinator::XACTTRANSINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transaction_info.call(this, pinfo)
    end
    def clone_with_commit_disabled(this : ITransactionCloner*, ppITransaction : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone_with_commit_disabled.call(this, ppITransaction)
    end

  end

  @[Extern]
  record ITransaction2Vtbl,
    query_interface : Proc(ITransaction2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITransaction2*, UInt32),
    release : Proc(ITransaction2*, UInt32),
    commit : Proc(ITransaction2*, Win32cr::Foundation::BOOL, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    abort : Proc(ITransaction2*, Win32cr::System::DistributedTransactionCoordinator::BOID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_transaction_info : Proc(ITransaction2*, Win32cr::System::DistributedTransactionCoordinator::XACTTRANSINFO*, Win32cr::Foundation::HRESULT),
    clone_with_commit_disabled : Proc(ITransaction2*, Void**, Win32cr::Foundation::HRESULT),
    get_transaction_info2 : Proc(ITransaction2*, Win32cr::System::DistributedTransactionCoordinator::XACTTRANSINFO*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("34021548-0065-11d3-bac1-00c04f797be2")]
  record ITransaction2, lpVtbl : ITransaction2Vtbl* do
    GUID = LibC::GUID.new(0x34021548_u32, 0x65_u16, 0x11d3_u16, StaticArray[0xba_u8, 0xc1_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0x7b_u8, 0xe2_u8])
    def query_interface(this : ITransaction2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITransaction2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITransaction2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def commit(this : ITransaction2*, fRetaining : Win32cr::Foundation::BOOL, grfTC : UInt32, grfRM : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this, fRetaining, grfTC, grfRM)
    end
    def abort(this : ITransaction2*, pboidReason : Win32cr::System::DistributedTransactionCoordinator::BOID*, fRetaining : Win32cr::Foundation::BOOL, fAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.abort.call(this, pboidReason, fRetaining, fAsync)
    end
    def get_transaction_info(this : ITransaction2*, pinfo : Win32cr::System::DistributedTransactionCoordinator::XACTTRANSINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transaction_info.call(this, pinfo)
    end
    def clone_with_commit_disabled(this : ITransaction2*, ppITransaction : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone_with_commit_disabled.call(this, ppITransaction)
    end
    def get_transaction_info2(this : ITransaction2*, pinfo : Win32cr::System::DistributedTransactionCoordinator::XACTTRANSINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transaction_info2.call(this, pinfo)
    end

  end

  @[Extern]
  record ITransactionDispenserVtbl,
    query_interface : Proc(ITransactionDispenser*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITransactionDispenser*, UInt32),
    release : Proc(ITransactionDispenser*, UInt32),
    get_options_object : Proc(ITransactionDispenser*, Void**, Win32cr::Foundation::HRESULT),
    begin_transaction : Proc(ITransactionDispenser*, Void*, Int32, UInt32, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("3a6ad9e1-23b9-11cf-ad60-00aa00a74ccd")]
  record ITransactionDispenser, lpVtbl : ITransactionDispenserVtbl* do
    GUID = LibC::GUID.new(0x3a6ad9e1_u32, 0x23b9_u16, 0x11cf_u16, StaticArray[0xad_u8, 0x60_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa7_u8, 0x4c_u8, 0xcd_u8])
    def query_interface(this : ITransactionDispenser*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITransactionDispenser*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITransactionDispenser*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_options_object(this : ITransactionDispenser*, ppOptions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_options_object.call(this, ppOptions)
    end
    def begin_transaction(this : ITransactionDispenser*, punkOuter : Void*, isoLevel : Int32, isoFlags : UInt32, pOptions : Void*, ppTransaction : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_transaction.call(this, punkOuter, isoLevel, isoFlags, pOptions, ppTransaction)
    end

  end

  @[Extern]
  record ITransactionOptionsVtbl,
    query_interface : Proc(ITransactionOptions*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITransactionOptions*, UInt32),
    release : Proc(ITransactionOptions*, UInt32),
    set_options : Proc(ITransactionOptions*, Win32cr::System::DistributedTransactionCoordinator::XACTOPT*, Win32cr::Foundation::HRESULT),
    get_options : Proc(ITransactionOptions*, Win32cr::System::DistributedTransactionCoordinator::XACTOPT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("3a6ad9e0-23b9-11cf-ad60-00aa00a74ccd")]
  record ITransactionOptions, lpVtbl : ITransactionOptionsVtbl* do
    GUID = LibC::GUID.new(0x3a6ad9e0_u32, 0x23b9_u16, 0x11cf_u16, StaticArray[0xad_u8, 0x60_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa7_u8, 0x4c_u8, 0xcd_u8])
    def query_interface(this : ITransactionOptions*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITransactionOptions*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITransactionOptions*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_options(this : ITransactionOptions*, pOptions : Win32cr::System::DistributedTransactionCoordinator::XACTOPT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_options.call(this, pOptions)
    end
    def get_options(this : ITransactionOptions*, pOptions : Win32cr::System::DistributedTransactionCoordinator::XACTOPT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_options.call(this, pOptions)
    end

  end

  @[Extern]
  record ITransactionOutcomeEventsVtbl,
    query_interface : Proc(ITransactionOutcomeEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITransactionOutcomeEvents*, UInt32),
    release : Proc(ITransactionOutcomeEvents*, UInt32),
    committed : Proc(ITransactionOutcomeEvents*, Win32cr::Foundation::BOOL, Win32cr::System::DistributedTransactionCoordinator::BOID*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    aborted : Proc(ITransactionOutcomeEvents*, Win32cr::System::DistributedTransactionCoordinator::BOID*, Win32cr::Foundation::BOOL, Win32cr::System::DistributedTransactionCoordinator::BOID*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    heuristic_decision : Proc(ITransactionOutcomeEvents*, UInt32, Win32cr::System::DistributedTransactionCoordinator::BOID*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    indoubt : Proc(ITransactionOutcomeEvents*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("3a6ad9e2-23b9-11cf-ad60-00aa00a74ccd")]
  record ITransactionOutcomeEvents, lpVtbl : ITransactionOutcomeEventsVtbl* do
    GUID = LibC::GUID.new(0x3a6ad9e2_u32, 0x23b9_u16, 0x11cf_u16, StaticArray[0xad_u8, 0x60_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa7_u8, 0x4c_u8, 0xcd_u8])
    def query_interface(this : ITransactionOutcomeEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITransactionOutcomeEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITransactionOutcomeEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def committed(this : ITransactionOutcomeEvents*, fRetaining : Win32cr::Foundation::BOOL, pNewUOW : Win32cr::System::DistributedTransactionCoordinator::BOID*, hr : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.committed.call(this, fRetaining, pNewUOW, hr)
    end
    def aborted(this : ITransactionOutcomeEvents*, pboidReason : Win32cr::System::DistributedTransactionCoordinator::BOID*, fRetaining : Win32cr::Foundation::BOOL, pNewUOW : Win32cr::System::DistributedTransactionCoordinator::BOID*, hr : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.aborted.call(this, pboidReason, fRetaining, pNewUOW, hr)
    end
    def heuristic_decision(this : ITransactionOutcomeEvents*, dwDecision : UInt32, pboidReason : Win32cr::System::DistributedTransactionCoordinator::BOID*, hr : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.heuristic_decision.call(this, dwDecision, pboidReason, hr)
    end
    def indoubt(this : ITransactionOutcomeEvents*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.indoubt.call(this)
    end

  end

  @[Extern]
  record ITmNodeNameVtbl,
    query_interface : Proc(ITmNodeName*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITmNodeName*, UInt32),
    release : Proc(ITmNodeName*, UInt32),
    get_node_name_size : Proc(ITmNodeName*, UInt32*, Win32cr::Foundation::HRESULT),
    get_node_name : Proc(ITmNodeName*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("30274f88-6ee4-474e-9b95-7807bc9ef8cf")]
  record ITmNodeName, lpVtbl : ITmNodeNameVtbl* do
    GUID = LibC::GUID.new(0x30274f88_u32, 0x6ee4_u16, 0x474e_u16, StaticArray[0x9b_u8, 0x95_u8, 0x78_u8, 0x7_u8, 0xbc_u8, 0x9e_u8, 0xf8_u8, 0xcf_u8])
    def query_interface(this : ITmNodeName*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITmNodeName*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITmNodeName*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_node_name_size(this : ITmNodeName*, pcbNodeNameSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_node_name_size.call(this, pcbNodeNameSize)
    end
    def get_node_name(this : ITmNodeName*, cbNodeNameBufferSize : UInt32, pNodeNameBuffer : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_node_name.call(this, cbNodeNameBufferSize, pNodeNameBuffer)
    end

  end

  @[Extern]
  record IKernelTransactionVtbl,
    query_interface : Proc(IKernelTransaction*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IKernelTransaction*, UInt32),
    release : Proc(IKernelTransaction*, UInt32),
    get_handle : Proc(IKernelTransaction*, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("79427a2b-f895-40e0-be79-b57dc82ed231")]
  record IKernelTransaction, lpVtbl : IKernelTransactionVtbl* do
    GUID = LibC::GUID.new(0x79427a2b_u32, 0xf895_u16, 0x40e0_u16, StaticArray[0xbe_u8, 0x79_u8, 0xb5_u8, 0x7d_u8, 0xc8_u8, 0x2e_u8, 0xd2_u8, 0x31_u8])
    def query_interface(this : IKernelTransaction*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IKernelTransaction*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IKernelTransaction*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_handle(this : IKernelTransaction*, pHandle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_handle.call(this, pHandle)
    end

  end

  @[Extern]
  record ITransactionResourceAsyncVtbl,
    query_interface : Proc(ITransactionResourceAsync*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITransactionResourceAsync*, UInt32),
    release : Proc(ITransactionResourceAsync*, UInt32),
    prepare_request : Proc(ITransactionResourceAsync*, Win32cr::Foundation::BOOL, UInt32, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    commit_request : Proc(ITransactionResourceAsync*, UInt32, Win32cr::System::DistributedTransactionCoordinator::BOID*, Win32cr::Foundation::HRESULT),
    abort_request : Proc(ITransactionResourceAsync*, Win32cr::System::DistributedTransactionCoordinator::BOID*, Win32cr::Foundation::BOOL, Win32cr::System::DistributedTransactionCoordinator::BOID*, Win32cr::Foundation::HRESULT),
    tm_down : Proc(ITransactionResourceAsync*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("69e971f0-23ce-11cf-ad60-00aa00a74ccd")]
  record ITransactionResourceAsync, lpVtbl : ITransactionResourceAsyncVtbl* do
    GUID = LibC::GUID.new(0x69e971f0_u32, 0x23ce_u16, 0x11cf_u16, StaticArray[0xad_u8, 0x60_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa7_u8, 0x4c_u8, 0xcd_u8])
    def query_interface(this : ITransactionResourceAsync*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITransactionResourceAsync*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITransactionResourceAsync*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def prepare_request(this : ITransactionResourceAsync*, fRetaining : Win32cr::Foundation::BOOL, grfRM : UInt32, fWantMoniker : Win32cr::Foundation::BOOL, fSinglePhase : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.prepare_request.call(this, fRetaining, grfRM, fWantMoniker, fSinglePhase)
    end
    def commit_request(this : ITransactionResourceAsync*, grfRM : UInt32, pNewUOW : Win32cr::System::DistributedTransactionCoordinator::BOID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit_request.call(this, grfRM, pNewUOW)
    end
    def abort_request(this : ITransactionResourceAsync*, pboidReason : Win32cr::System::DistributedTransactionCoordinator::BOID*, fRetaining : Win32cr::Foundation::BOOL, pNewUOW : Win32cr::System::DistributedTransactionCoordinator::BOID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.abort_request.call(this, pboidReason, fRetaining, pNewUOW)
    end
    def tm_down(this : ITransactionResourceAsync*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tm_down.call(this)
    end

  end

  @[Extern]
  record ITransactionLastResourceAsyncVtbl,
    query_interface : Proc(ITransactionLastResourceAsync*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITransactionLastResourceAsync*, UInt32),
    release : Proc(ITransactionLastResourceAsync*, UInt32),
    delegate_commit : Proc(ITransactionLastResourceAsync*, UInt32, Win32cr::Foundation::HRESULT),
    forget_request : Proc(ITransactionLastResourceAsync*, Win32cr::System::DistributedTransactionCoordinator::BOID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c82bd532-5b30-11d3-8a91-00c04f79eb6d")]
  record ITransactionLastResourceAsync, lpVtbl : ITransactionLastResourceAsyncVtbl* do
    GUID = LibC::GUID.new(0xc82bd532_u32, 0x5b30_u16, 0x11d3_u16, StaticArray[0x8a_u8, 0x91_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xeb_u8, 0x6d_u8])
    def query_interface(this : ITransactionLastResourceAsync*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITransactionLastResourceAsync*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITransactionLastResourceAsync*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def delegate_commit(this : ITransactionLastResourceAsync*, grfRM : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delegate_commit.call(this, grfRM)
    end
    def forget_request(this : ITransactionLastResourceAsync*, pNewUOW : Win32cr::System::DistributedTransactionCoordinator::BOID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.forget_request.call(this, pNewUOW)
    end

  end

  @[Extern]
  record ITransactionResourceVtbl,
    query_interface : Proc(ITransactionResource*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITransactionResource*, UInt32),
    release : Proc(ITransactionResource*, UInt32),
    prepare_request : Proc(ITransactionResource*, Win32cr::Foundation::BOOL, UInt32, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    commit_request : Proc(ITransactionResource*, UInt32, Win32cr::System::DistributedTransactionCoordinator::BOID*, Win32cr::Foundation::HRESULT),
    abort_request : Proc(ITransactionResource*, Win32cr::System::DistributedTransactionCoordinator::BOID*, Win32cr::Foundation::BOOL, Win32cr::System::DistributedTransactionCoordinator::BOID*, Win32cr::Foundation::HRESULT),
    tm_down : Proc(ITransactionResource*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("ee5ff7b3-4572-11d0-9452-00a0c905416e")]
  record ITransactionResource, lpVtbl : ITransactionResourceVtbl* do
    GUID = LibC::GUID.new(0xee5ff7b3_u32, 0x4572_u16, 0x11d0_u16, StaticArray[0x94_u8, 0x52_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
    def query_interface(this : ITransactionResource*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITransactionResource*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITransactionResource*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def prepare_request(this : ITransactionResource*, fRetaining : Win32cr::Foundation::BOOL, grfRM : UInt32, fWantMoniker : Win32cr::Foundation::BOOL, fSinglePhase : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.prepare_request.call(this, fRetaining, grfRM, fWantMoniker, fSinglePhase)
    end
    def commit_request(this : ITransactionResource*, grfRM : UInt32, pNewUOW : Win32cr::System::DistributedTransactionCoordinator::BOID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit_request.call(this, grfRM, pNewUOW)
    end
    def abort_request(this : ITransactionResource*, pboidReason : Win32cr::System::DistributedTransactionCoordinator::BOID*, fRetaining : Win32cr::Foundation::BOOL, pNewUOW : Win32cr::System::DistributedTransactionCoordinator::BOID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.abort_request.call(this, pboidReason, fRetaining, pNewUOW)
    end
    def tm_down(this : ITransactionResource*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tm_down.call(this)
    end

  end

  @[Extern]
  record ITransactionEnlistmentAsyncVtbl,
    query_interface : Proc(ITransactionEnlistmentAsync*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITransactionEnlistmentAsync*, UInt32),
    release : Proc(ITransactionEnlistmentAsync*, UInt32),
    prepare_request_done : Proc(ITransactionEnlistmentAsync*, Win32cr::Foundation::HRESULT, Void*, Win32cr::System::DistributedTransactionCoordinator::BOID*, Win32cr::Foundation::HRESULT),
    commit_request_done : Proc(ITransactionEnlistmentAsync*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    abort_request_done : Proc(ITransactionEnlistmentAsync*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0fb15081-af41-11ce-bd2b-204c4f4f5020")]
  record ITransactionEnlistmentAsync, lpVtbl : ITransactionEnlistmentAsyncVtbl* do
    GUID = LibC::GUID.new(0xfb15081_u32, 0xaf41_u16, 0x11ce_u16, StaticArray[0xbd_u8, 0x2b_u8, 0x20_u8, 0x4c_u8, 0x4f_u8, 0x4f_u8, 0x50_u8, 0x20_u8])
    def query_interface(this : ITransactionEnlistmentAsync*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITransactionEnlistmentAsync*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITransactionEnlistmentAsync*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def prepare_request_done(this : ITransactionEnlistmentAsync*, hr : Win32cr::Foundation::HRESULT, pmk : Void*, pboidReason : Win32cr::System::DistributedTransactionCoordinator::BOID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.prepare_request_done.call(this, hr, pmk, pboidReason)
    end
    def commit_request_done(this : ITransactionEnlistmentAsync*, hr : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit_request_done.call(this, hr)
    end
    def abort_request_done(this : ITransactionEnlistmentAsync*, hr : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.abort_request_done.call(this, hr)
    end

  end

  @[Extern]
  record ITransactionLastEnlistmentAsyncVtbl,
    query_interface : Proc(ITransactionLastEnlistmentAsync*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITransactionLastEnlistmentAsync*, UInt32),
    release : Proc(ITransactionLastEnlistmentAsync*, UInt32),
    transaction_outcome : Proc(ITransactionLastEnlistmentAsync*, Win32cr::System::DistributedTransactionCoordinator::XACTSTAT, Win32cr::System::DistributedTransactionCoordinator::BOID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c82bd533-5b30-11d3-8a91-00c04f79eb6d")]
  record ITransactionLastEnlistmentAsync, lpVtbl : ITransactionLastEnlistmentAsyncVtbl* do
    GUID = LibC::GUID.new(0xc82bd533_u32, 0x5b30_u16, 0x11d3_u16, StaticArray[0x8a_u8, 0x91_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xeb_u8, 0x6d_u8])
    def query_interface(this : ITransactionLastEnlistmentAsync*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITransactionLastEnlistmentAsync*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITransactionLastEnlistmentAsync*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def transaction_outcome(this : ITransactionLastEnlistmentAsync*, xact_stat : Win32cr::System::DistributedTransactionCoordinator::XACTSTAT, pboidReason : Win32cr::System::DistributedTransactionCoordinator::BOID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.transaction_outcome.call(this, xact_stat, pboidReason)
    end

  end

  @[Extern]
  record ITransactionExportFactoryVtbl,
    query_interface : Proc(ITransactionExportFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITransactionExportFactory*, UInt32),
    release : Proc(ITransactionExportFactory*, UInt32),
    get_remote_class_id : Proc(ITransactionExportFactory*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    create : Proc(ITransactionExportFactory*, UInt32, UInt8*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("e1cf9b53-8745-11ce-a9ba-00aa006c3706")]
  record ITransactionExportFactory, lpVtbl : ITransactionExportFactoryVtbl* do
    GUID = LibC::GUID.new(0xe1cf9b53_u32, 0x8745_u16, 0x11ce_u16, StaticArray[0xa9_u8, 0xba_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x6c_u8, 0x37_u8, 0x6_u8])
    def query_interface(this : ITransactionExportFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITransactionExportFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITransactionExportFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_remote_class_id(this : ITransactionExportFactory*, pclsid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_remote_class_id.call(this, pclsid)
    end
    def create(this : ITransactionExportFactory*, cbWhereabouts : UInt32, rgbWhereabouts : UInt8*, ppExport : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create.call(this, cbWhereabouts, rgbWhereabouts, ppExport)
    end

  end

  @[Extern]
  record ITransactionImportWhereaboutsVtbl,
    query_interface : Proc(ITransactionImportWhereabouts*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITransactionImportWhereabouts*, UInt32),
    release : Proc(ITransactionImportWhereabouts*, UInt32),
    get_whereabouts_size : Proc(ITransactionImportWhereabouts*, UInt32*, Win32cr::Foundation::HRESULT),
    get_whereabouts : Proc(ITransactionImportWhereabouts*, UInt32, UInt8*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0141fda4-8fc0-11ce-bd18-204c4f4f5020")]
  record ITransactionImportWhereabouts, lpVtbl : ITransactionImportWhereaboutsVtbl* do
    GUID = LibC::GUID.new(0x141fda4_u32, 0x8fc0_u16, 0x11ce_u16, StaticArray[0xbd_u8, 0x18_u8, 0x20_u8, 0x4c_u8, 0x4f_u8, 0x4f_u8, 0x50_u8, 0x20_u8])
    def query_interface(this : ITransactionImportWhereabouts*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITransactionImportWhereabouts*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITransactionImportWhereabouts*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_whereabouts_size(this : ITransactionImportWhereabouts*, pcbWhereabouts : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_whereabouts_size.call(this, pcbWhereabouts)
    end
    def get_whereabouts(this : ITransactionImportWhereabouts*, cbWhereabouts : UInt32, rgbWhereabouts : UInt8*, pcbUsed : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_whereabouts.call(this, cbWhereabouts, rgbWhereabouts, pcbUsed)
    end

  end

  @[Extern]
  record ITransactionExportVtbl,
    query_interface : Proc(ITransactionExport*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITransactionExport*, UInt32),
    release : Proc(ITransactionExport*, UInt32),
    export : Proc(ITransactionExport*, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    get_transaction_cookie : Proc(ITransactionExport*, Void*, UInt32, UInt8*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0141fda5-8fc0-11ce-bd18-204c4f4f5020")]
  record ITransactionExport, lpVtbl : ITransactionExportVtbl* do
    GUID = LibC::GUID.new(0x141fda5_u32, 0x8fc0_u16, 0x11ce_u16, StaticArray[0xbd_u8, 0x18_u8, 0x20_u8, 0x4c_u8, 0x4f_u8, 0x4f_u8, 0x50_u8, 0x20_u8])
    def query_interface(this : ITransactionExport*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITransactionExport*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITransactionExport*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def export(this : ITransactionExport*, punkTransaction : Void*, pcbTransactionCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.export.call(this, punkTransaction, pcbTransactionCookie)
    end
    def get_transaction_cookie(this : ITransactionExport*, punkTransaction : Void*, cbTransactionCookie : UInt32, rgbTransactionCookie : UInt8*, pcbUsed : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transaction_cookie.call(this, punkTransaction, cbTransactionCookie, rgbTransactionCookie, pcbUsed)
    end

  end

  @[Extern]
  record ITransactionImportVtbl,
    query_interface : Proc(ITransactionImport*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITransactionImport*, UInt32),
    release : Proc(ITransactionImport*, UInt32),
    import : Proc(ITransactionImport*, UInt32, UInt8*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("e1cf9b5a-8745-11ce-a9ba-00aa006c3706")]
  record ITransactionImport, lpVtbl : ITransactionImportVtbl* do
    GUID = LibC::GUID.new(0xe1cf9b5a_u32, 0x8745_u16, 0x11ce_u16, StaticArray[0xa9_u8, 0xba_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x6c_u8, 0x37_u8, 0x6_u8])
    def query_interface(this : ITransactionImport*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITransactionImport*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITransactionImport*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def import(this : ITransactionImport*, cbTransactionCookie : UInt32, rgbTransactionCookie : UInt8*, piid : LibC::GUID*, ppvTransaction : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.import.call(this, cbTransactionCookie, rgbTransactionCookie, piid, ppvTransaction)
    end

  end

  @[Extern]
  record ITipTransactionVtbl,
    query_interface : Proc(ITipTransaction*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITipTransaction*, UInt32),
    release : Proc(ITipTransaction*, UInt32),
    push : Proc(ITipTransaction*, UInt8*, Win32cr::Foundation::PSTR*, Win32cr::Foundation::HRESULT),
    get_transaction_url : Proc(ITipTransaction*, Win32cr::Foundation::PSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("17cf72d0-bac5-11d1-b1bf-00c04fc2f3ef")]
  record ITipTransaction, lpVtbl : ITipTransactionVtbl* do
    GUID = LibC::GUID.new(0x17cf72d0_u32, 0xbac5_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xbf_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0xf3_u8, 0xef_u8])
    def query_interface(this : ITipTransaction*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITipTransaction*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITipTransaction*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def push(this : ITipTransaction*, i_pszRemoteTmUrl : UInt8*, o_ppszRemoteTxUrl : Win32cr::Foundation::PSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.push.call(this, i_pszRemoteTmUrl, o_ppszRemoteTxUrl)
    end
    def get_transaction_url(this : ITipTransaction*, o_ppszLocalTxUrl : Win32cr::Foundation::PSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transaction_url.call(this, o_ppszLocalTxUrl)
    end

  end

  @[Extern]
  record ITipHelperVtbl,
    query_interface : Proc(ITipHelper*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITipHelper*, UInt32),
    release : Proc(ITipHelper*, UInt32),
    pull : Proc(ITipHelper*, UInt8*, Void**, Win32cr::Foundation::HRESULT),
    pull_async : Proc(ITipHelper*, UInt8*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_local_tm_url : Proc(ITipHelper*, UInt8**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("17cf72d1-bac5-11d1-b1bf-00c04fc2f3ef")]
  record ITipHelper, lpVtbl : ITipHelperVtbl* do
    GUID = LibC::GUID.new(0x17cf72d1_u32, 0xbac5_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xbf_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0xf3_u8, 0xef_u8])
    def query_interface(this : ITipHelper*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITipHelper*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITipHelper*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def pull(this : ITipHelper*, i_pszTxUrl : UInt8*, o_ppITransaction : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pull.call(this, i_pszTxUrl, o_ppITransaction)
    end
    def pull_async(this : ITipHelper*, i_pszTxUrl : UInt8*, i_pTipPullSink : Void*, o_ppITransaction : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pull_async.call(this, i_pszTxUrl, i_pTipPullSink, o_ppITransaction)
    end
    def get_local_tm_url(this : ITipHelper*, o_ppszLocalTmUrl : UInt8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_local_tm_url.call(this, o_ppszLocalTmUrl)
    end

  end

  @[Extern]
  record ITipPullSinkVtbl,
    query_interface : Proc(ITipPullSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITipPullSink*, UInt32),
    release : Proc(ITipPullSink*, UInt32),
    pull_complete : Proc(ITipPullSink*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("17cf72d2-bac5-11d1-b1bf-00c04fc2f3ef")]
  record ITipPullSink, lpVtbl : ITipPullSinkVtbl* do
    GUID = LibC::GUID.new(0x17cf72d2_u32, 0xbac5_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xbf_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0xf3_u8, 0xef_u8])
    def query_interface(this : ITipPullSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITipPullSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITipPullSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def pull_complete(this : ITipPullSink*, i_hrPull : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pull_complete.call(this, i_hrPull)
    end

  end

  @[Extern]
  record IDtcNetworkAccessConfigVtbl,
    query_interface : Proc(IDtcNetworkAccessConfig*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDtcNetworkAccessConfig*, UInt32),
    release : Proc(IDtcNetworkAccessConfig*, UInt32),
    get_any_network_access : Proc(IDtcNetworkAccessConfig*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_any_network_access : Proc(IDtcNetworkAccessConfig*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_network_administration_access : Proc(IDtcNetworkAccessConfig*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_network_administration_access : Proc(IDtcNetworkAccessConfig*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_network_transaction_access : Proc(IDtcNetworkAccessConfig*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_network_transaction_access : Proc(IDtcNetworkAccessConfig*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_network_client_access : Proc(IDtcNetworkAccessConfig*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_network_client_access : Proc(IDtcNetworkAccessConfig*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_network_tip_access : Proc(IDtcNetworkAccessConfig*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_network_tip_access : Proc(IDtcNetworkAccessConfig*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_xa_access : Proc(IDtcNetworkAccessConfig*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_xa_access : Proc(IDtcNetworkAccessConfig*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    restart_dtc_service : Proc(IDtcNetworkAccessConfig*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("9797c15d-a428-4291-87b6-0995031a678d")]
  record IDtcNetworkAccessConfig, lpVtbl : IDtcNetworkAccessConfigVtbl* do
    GUID = LibC::GUID.new(0x9797c15d_u32, 0xa428_u16, 0x4291_u16, StaticArray[0x87_u8, 0xb6_u8, 0x9_u8, 0x95_u8, 0x3_u8, 0x1a_u8, 0x67_u8, 0x8d_u8])
    def query_interface(this : IDtcNetworkAccessConfig*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDtcNetworkAccessConfig*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDtcNetworkAccessConfig*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_any_network_access(this : IDtcNetworkAccessConfig*, pbAnyNetworkAccess : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_any_network_access.call(this, pbAnyNetworkAccess)
    end
    def set_any_network_access(this : IDtcNetworkAccessConfig*, bAnyNetworkAccess : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_any_network_access.call(this, bAnyNetworkAccess)
    end
    def get_network_administration_access(this : IDtcNetworkAccessConfig*, pbNetworkAdministrationAccess : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_network_administration_access.call(this, pbNetworkAdministrationAccess)
    end
    def set_network_administration_access(this : IDtcNetworkAccessConfig*, bNetworkAdministrationAccess : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_network_administration_access.call(this, bNetworkAdministrationAccess)
    end
    def get_network_transaction_access(this : IDtcNetworkAccessConfig*, pbNetworkTransactionAccess : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_network_transaction_access.call(this, pbNetworkTransactionAccess)
    end
    def set_network_transaction_access(this : IDtcNetworkAccessConfig*, bNetworkTransactionAccess : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_network_transaction_access.call(this, bNetworkTransactionAccess)
    end
    def get_network_client_access(this : IDtcNetworkAccessConfig*, pbNetworkClientAccess : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_network_client_access.call(this, pbNetworkClientAccess)
    end
    def set_network_client_access(this : IDtcNetworkAccessConfig*, bNetworkClientAccess : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_network_client_access.call(this, bNetworkClientAccess)
    end
    def get_network_tip_access(this : IDtcNetworkAccessConfig*, pbNetworkTIPAccess : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_network_tip_access.call(this, pbNetworkTIPAccess)
    end
    def set_network_tip_access(this : IDtcNetworkAccessConfig*, bNetworkTIPAccess : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_network_tip_access.call(this, bNetworkTIPAccess)
    end
    def get_xa_access(this : IDtcNetworkAccessConfig*, pbXAAccess : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_xa_access.call(this, pbXAAccess)
    end
    def set_xa_access(this : IDtcNetworkAccessConfig*, bXAAccess : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_xa_access.call(this, bXAAccess)
    end
    def restart_dtc_service(this : IDtcNetworkAccessConfig*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.restart_dtc_service.call(this)
    end

  end

  @[Extern]
  record IDtcNetworkAccessConfig2Vtbl,
    query_interface : Proc(IDtcNetworkAccessConfig2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDtcNetworkAccessConfig2*, UInt32),
    release : Proc(IDtcNetworkAccessConfig2*, UInt32),
    get_any_network_access : Proc(IDtcNetworkAccessConfig2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_any_network_access : Proc(IDtcNetworkAccessConfig2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_network_administration_access : Proc(IDtcNetworkAccessConfig2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_network_administration_access : Proc(IDtcNetworkAccessConfig2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_network_transaction_access : Proc(IDtcNetworkAccessConfig2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_network_transaction_access : Proc(IDtcNetworkAccessConfig2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_network_client_access : Proc(IDtcNetworkAccessConfig2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_network_client_access : Proc(IDtcNetworkAccessConfig2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_network_tip_access : Proc(IDtcNetworkAccessConfig2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_network_tip_access : Proc(IDtcNetworkAccessConfig2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_xa_access : Proc(IDtcNetworkAccessConfig2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_xa_access : Proc(IDtcNetworkAccessConfig2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    restart_dtc_service : Proc(IDtcNetworkAccessConfig2*, Win32cr::Foundation::HRESULT),
    get_network_inbound_access : Proc(IDtcNetworkAccessConfig2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_network_outbound_access : Proc(IDtcNetworkAccessConfig2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_network_inbound_access : Proc(IDtcNetworkAccessConfig2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    set_network_outbound_access : Proc(IDtcNetworkAccessConfig2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_authentication_level : Proc(IDtcNetworkAccessConfig2*, Win32cr::System::DistributedTransactionCoordinator::AUTHENTICATION_LEVEL*, Win32cr::Foundation::HRESULT),
    set_authentication_level : Proc(IDtcNetworkAccessConfig2*, Win32cr::System::DistributedTransactionCoordinator::AUTHENTICATION_LEVEL, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a7aa013b-eb7d-4f42-b41c-b2dec09ae034")]
  record IDtcNetworkAccessConfig2, lpVtbl : IDtcNetworkAccessConfig2Vtbl* do
    GUID = LibC::GUID.new(0xa7aa013b_u32, 0xeb7d_u16, 0x4f42_u16, StaticArray[0xb4_u8, 0x1c_u8, 0xb2_u8, 0xde_u8, 0xc0_u8, 0x9a_u8, 0xe0_u8, 0x34_u8])
    def query_interface(this : IDtcNetworkAccessConfig2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDtcNetworkAccessConfig2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDtcNetworkAccessConfig2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_any_network_access(this : IDtcNetworkAccessConfig2*, pbAnyNetworkAccess : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_any_network_access.call(this, pbAnyNetworkAccess)
    end
    def set_any_network_access(this : IDtcNetworkAccessConfig2*, bAnyNetworkAccess : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_any_network_access.call(this, bAnyNetworkAccess)
    end
    def get_network_administration_access(this : IDtcNetworkAccessConfig2*, pbNetworkAdministrationAccess : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_network_administration_access.call(this, pbNetworkAdministrationAccess)
    end
    def set_network_administration_access(this : IDtcNetworkAccessConfig2*, bNetworkAdministrationAccess : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_network_administration_access.call(this, bNetworkAdministrationAccess)
    end
    def get_network_transaction_access(this : IDtcNetworkAccessConfig2*, pbNetworkTransactionAccess : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_network_transaction_access.call(this, pbNetworkTransactionAccess)
    end
    def set_network_transaction_access(this : IDtcNetworkAccessConfig2*, bNetworkTransactionAccess : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_network_transaction_access.call(this, bNetworkTransactionAccess)
    end
    def get_network_client_access(this : IDtcNetworkAccessConfig2*, pbNetworkClientAccess : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_network_client_access.call(this, pbNetworkClientAccess)
    end
    def set_network_client_access(this : IDtcNetworkAccessConfig2*, bNetworkClientAccess : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_network_client_access.call(this, bNetworkClientAccess)
    end
    def get_network_tip_access(this : IDtcNetworkAccessConfig2*, pbNetworkTIPAccess : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_network_tip_access.call(this, pbNetworkTIPAccess)
    end
    def set_network_tip_access(this : IDtcNetworkAccessConfig2*, bNetworkTIPAccess : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_network_tip_access.call(this, bNetworkTIPAccess)
    end
    def get_xa_access(this : IDtcNetworkAccessConfig2*, pbXAAccess : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_xa_access.call(this, pbXAAccess)
    end
    def set_xa_access(this : IDtcNetworkAccessConfig2*, bXAAccess : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_xa_access.call(this, bXAAccess)
    end
    def restart_dtc_service(this : IDtcNetworkAccessConfig2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.restart_dtc_service.call(this)
    end
    def get_network_inbound_access(this : IDtcNetworkAccessConfig2*, pbInbound : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_network_inbound_access.call(this, pbInbound)
    end
    def get_network_outbound_access(this : IDtcNetworkAccessConfig2*, pbOutbound : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_network_outbound_access.call(this, pbOutbound)
    end
    def set_network_inbound_access(this : IDtcNetworkAccessConfig2*, bInbound : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_network_inbound_access.call(this, bInbound)
    end
    def set_network_outbound_access(this : IDtcNetworkAccessConfig2*, bOutbound : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_network_outbound_access.call(this, bOutbound)
    end
    def get_authentication_level(this : IDtcNetworkAccessConfig2*, pAuthLevel : Win32cr::System::DistributedTransactionCoordinator::AUTHENTICATION_LEVEL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_authentication_level.call(this, pAuthLevel)
    end
    def set_authentication_level(this : IDtcNetworkAccessConfig2*, auth_level : Win32cr::System::DistributedTransactionCoordinator::AUTHENTICATION_LEVEL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_authentication_level.call(this, auth_level)
    end

  end

  @[Extern]
  record IDtcNetworkAccessConfig3Vtbl,
    query_interface : Proc(IDtcNetworkAccessConfig3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDtcNetworkAccessConfig3*, UInt32),
    release : Proc(IDtcNetworkAccessConfig3*, UInt32),
    get_any_network_access : Proc(IDtcNetworkAccessConfig3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_any_network_access : Proc(IDtcNetworkAccessConfig3*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_network_administration_access : Proc(IDtcNetworkAccessConfig3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_network_administration_access : Proc(IDtcNetworkAccessConfig3*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_network_transaction_access : Proc(IDtcNetworkAccessConfig3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_network_transaction_access : Proc(IDtcNetworkAccessConfig3*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_network_client_access : Proc(IDtcNetworkAccessConfig3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_network_client_access : Proc(IDtcNetworkAccessConfig3*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_network_tip_access : Proc(IDtcNetworkAccessConfig3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_network_tip_access : Proc(IDtcNetworkAccessConfig3*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_xa_access : Proc(IDtcNetworkAccessConfig3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_xa_access : Proc(IDtcNetworkAccessConfig3*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    restart_dtc_service : Proc(IDtcNetworkAccessConfig3*, Win32cr::Foundation::HRESULT),
    get_network_inbound_access : Proc(IDtcNetworkAccessConfig3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_network_outbound_access : Proc(IDtcNetworkAccessConfig3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_network_inbound_access : Proc(IDtcNetworkAccessConfig3*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    set_network_outbound_access : Proc(IDtcNetworkAccessConfig3*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_authentication_level : Proc(IDtcNetworkAccessConfig3*, Win32cr::System::DistributedTransactionCoordinator::AUTHENTICATION_LEVEL*, Win32cr::Foundation::HRESULT),
    set_authentication_level : Proc(IDtcNetworkAccessConfig3*, Win32cr::System::DistributedTransactionCoordinator::AUTHENTICATION_LEVEL, Win32cr::Foundation::HRESULT),
    get_lu_access : Proc(IDtcNetworkAccessConfig3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_lu_access : Proc(IDtcNetworkAccessConfig3*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("76e4b4f3-2ca5-466b-89d5-fd218ee75b49")]
  record IDtcNetworkAccessConfig3, lpVtbl : IDtcNetworkAccessConfig3Vtbl* do
    GUID = LibC::GUID.new(0x76e4b4f3_u32, 0x2ca5_u16, 0x466b_u16, StaticArray[0x89_u8, 0xd5_u8, 0xfd_u8, 0x21_u8, 0x8e_u8, 0xe7_u8, 0x5b_u8, 0x49_u8])
    def query_interface(this : IDtcNetworkAccessConfig3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDtcNetworkAccessConfig3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDtcNetworkAccessConfig3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_any_network_access(this : IDtcNetworkAccessConfig3*, pbAnyNetworkAccess : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_any_network_access.call(this, pbAnyNetworkAccess)
    end
    def set_any_network_access(this : IDtcNetworkAccessConfig3*, bAnyNetworkAccess : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_any_network_access.call(this, bAnyNetworkAccess)
    end
    def get_network_administration_access(this : IDtcNetworkAccessConfig3*, pbNetworkAdministrationAccess : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_network_administration_access.call(this, pbNetworkAdministrationAccess)
    end
    def set_network_administration_access(this : IDtcNetworkAccessConfig3*, bNetworkAdministrationAccess : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_network_administration_access.call(this, bNetworkAdministrationAccess)
    end
    def get_network_transaction_access(this : IDtcNetworkAccessConfig3*, pbNetworkTransactionAccess : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_network_transaction_access.call(this, pbNetworkTransactionAccess)
    end
    def set_network_transaction_access(this : IDtcNetworkAccessConfig3*, bNetworkTransactionAccess : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_network_transaction_access.call(this, bNetworkTransactionAccess)
    end
    def get_network_client_access(this : IDtcNetworkAccessConfig3*, pbNetworkClientAccess : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_network_client_access.call(this, pbNetworkClientAccess)
    end
    def set_network_client_access(this : IDtcNetworkAccessConfig3*, bNetworkClientAccess : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_network_client_access.call(this, bNetworkClientAccess)
    end
    def get_network_tip_access(this : IDtcNetworkAccessConfig3*, pbNetworkTIPAccess : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_network_tip_access.call(this, pbNetworkTIPAccess)
    end
    def set_network_tip_access(this : IDtcNetworkAccessConfig3*, bNetworkTIPAccess : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_network_tip_access.call(this, bNetworkTIPAccess)
    end
    def get_xa_access(this : IDtcNetworkAccessConfig3*, pbXAAccess : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_xa_access.call(this, pbXAAccess)
    end
    def set_xa_access(this : IDtcNetworkAccessConfig3*, bXAAccess : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_xa_access.call(this, bXAAccess)
    end
    def restart_dtc_service(this : IDtcNetworkAccessConfig3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.restart_dtc_service.call(this)
    end
    def get_network_inbound_access(this : IDtcNetworkAccessConfig3*, pbInbound : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_network_inbound_access.call(this, pbInbound)
    end
    def get_network_outbound_access(this : IDtcNetworkAccessConfig3*, pbOutbound : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_network_outbound_access.call(this, pbOutbound)
    end
    def set_network_inbound_access(this : IDtcNetworkAccessConfig3*, bInbound : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_network_inbound_access.call(this, bInbound)
    end
    def set_network_outbound_access(this : IDtcNetworkAccessConfig3*, bOutbound : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_network_outbound_access.call(this, bOutbound)
    end
    def get_authentication_level(this : IDtcNetworkAccessConfig3*, pAuthLevel : Win32cr::System::DistributedTransactionCoordinator::AUTHENTICATION_LEVEL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_authentication_level.call(this, pAuthLevel)
    end
    def set_authentication_level(this : IDtcNetworkAccessConfig3*, auth_level : Win32cr::System::DistributedTransactionCoordinator::AUTHENTICATION_LEVEL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_authentication_level.call(this, auth_level)
    end
    def get_lu_access(this : IDtcNetworkAccessConfig3*, pbLUAccess : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_lu_access.call(this, pbLUAccess)
    end
    def set_lu_access(this : IDtcNetworkAccessConfig3*, bLUAccess : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_lu_access.call(this, bLUAccess)
    end

  end

  @[Extern]
  record IDtcToXaMapperVtbl,
    query_interface : Proc(IDtcToXaMapper*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDtcToXaMapper*, UInt32),
    release : Proc(IDtcToXaMapper*, UInt32),
    request_new_resource_manager : Proc(IDtcToXaMapper*, Win32cr::Foundation::PSTR, Win32cr::Foundation::PSTR, UInt32*, Win32cr::Foundation::HRESULT),
    translate_trid_to_xid : Proc(IDtcToXaMapper*, UInt32*, UInt32, Win32cr::System::DistributedTransactionCoordinator::Xid_t*, Win32cr::Foundation::HRESULT),
    enlist_resource_manager : Proc(IDtcToXaMapper*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    release_resource_manager : Proc(IDtcToXaMapper*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("64ffabe0-7ce9-11d0-8ce6-00c04fdc877e")]
  record IDtcToXaMapper, lpVtbl : IDtcToXaMapperVtbl* do
    GUID = LibC::GUID.new(0x64ffabe0_u32, 0x7ce9_u16, 0x11d0_u16, StaticArray[0x8c_u8, 0xe6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xdc_u8, 0x87_u8, 0x7e_u8])
    def query_interface(this : IDtcToXaMapper*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDtcToXaMapper*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDtcToXaMapper*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def request_new_resource_manager(this : IDtcToXaMapper*, pszDSN : Win32cr::Foundation::PSTR, pszClientDllName : Win32cr::Foundation::PSTR, pdwRMCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_new_resource_manager.call(this, pszDSN, pszClientDllName, pdwRMCookie)
    end
    def translate_trid_to_xid(this : IDtcToXaMapper*, pdwITransaction : UInt32*, dwRMCookie : UInt32, pXid : Win32cr::System::DistributedTransactionCoordinator::Xid_t*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.translate_trid_to_xid.call(this, pdwITransaction, dwRMCookie, pXid)
    end
    def enlist_resource_manager(this : IDtcToXaMapper*, dwRMCookie : UInt32, pdwITransaction : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enlist_resource_manager.call(this, dwRMCookie, pdwITransaction)
    end
    def release_resource_manager(this : IDtcToXaMapper*, dwRMCookie : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.release_resource_manager.call(this, dwRMCookie)
    end

  end

  @[Extern]
  record IDtcToXaHelperFactoryVtbl,
    query_interface : Proc(IDtcToXaHelperFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDtcToXaHelperFactory*, UInt32),
    release : Proc(IDtcToXaHelperFactory*, UInt32),
    create : Proc(IDtcToXaHelperFactory*, Win32cr::Foundation::PSTR, Win32cr::Foundation::PSTR, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a9861610-304a-11d1-9813-00a0c905416e")]
  record IDtcToXaHelperFactory, lpVtbl : IDtcToXaHelperFactoryVtbl* do
    GUID = LibC::GUID.new(0xa9861610_u32, 0x304a_u16, 0x11d1_u16, StaticArray[0x98_u8, 0x13_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
    def query_interface(this : IDtcToXaHelperFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDtcToXaHelperFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDtcToXaHelperFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create(this : IDtcToXaHelperFactory*, pszDSN : Win32cr::Foundation::PSTR, pszClientDllName : Win32cr::Foundation::PSTR, pguidRm : LibC::GUID*, ppXaHelper : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create.call(this, pszDSN, pszClientDllName, pguidRm, ppXaHelper)
    end

  end

  @[Extern]
  record IDtcToXaHelperVtbl,
    query_interface : Proc(IDtcToXaHelper*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDtcToXaHelper*, UInt32),
    release : Proc(IDtcToXaHelper*, UInt32),
    close : Proc(IDtcToXaHelper*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    translate_trid_to_xid : Proc(IDtcToXaHelper*, Void*, LibC::GUID*, Win32cr::System::DistributedTransactionCoordinator::Xid_t*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a9861611-304a-11d1-9813-00a0c905416e")]
  record IDtcToXaHelper, lpVtbl : IDtcToXaHelperVtbl* do
    GUID = LibC::GUID.new(0xa9861611_u32, 0x304a_u16, 0x11d1_u16, StaticArray[0x98_u8, 0x13_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
    def query_interface(this : IDtcToXaHelper*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDtcToXaHelper*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDtcToXaHelper*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def close(this : IDtcToXaHelper*, i_fDoRecovery : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this, i_fDoRecovery)
    end
    def translate_trid_to_xid(this : IDtcToXaHelper*, pITransaction : Void*, pguidBqual : LibC::GUID*, pXid : Win32cr::System::DistributedTransactionCoordinator::Xid_t*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.translate_trid_to_xid.call(this, pITransaction, pguidBqual, pXid)
    end

  end

  @[Extern]
  record IDtcToXaHelperSinglePipeVtbl,
    query_interface : Proc(IDtcToXaHelperSinglePipe*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDtcToXaHelperSinglePipe*, UInt32),
    release : Proc(IDtcToXaHelperSinglePipe*, UInt32),
    xarm_create : Proc(IDtcToXaHelperSinglePipe*, Win32cr::Foundation::PSTR, Win32cr::Foundation::PSTR, UInt32*, Win32cr::Foundation::HRESULT),
    convert_trid_to_xid : Proc(IDtcToXaHelperSinglePipe*, UInt32*, UInt32, Win32cr::System::DistributedTransactionCoordinator::Xid_t*, Win32cr::Foundation::HRESULT),
    enlist_with_rm : Proc(IDtcToXaHelperSinglePipe*, UInt32, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    release_rm_cookie : Proc(IDtcToXaHelperSinglePipe*, UInt32, Win32cr::Foundation::BOOL, Void)


  @[Extern]
  #@[Com("47ed4971-53b3-11d1-bbb9-00c04fd658f6")]
  record IDtcToXaHelperSinglePipe, lpVtbl : IDtcToXaHelperSinglePipeVtbl* do
    GUID = LibC::GUID.new(0x47ed4971_u32, 0x53b3_u16, 0x11d1_u16, StaticArray[0xbb_u8, 0xb9_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd6_u8, 0x58_u8, 0xf6_u8])
    def query_interface(this : IDtcToXaHelperSinglePipe*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDtcToXaHelperSinglePipe*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDtcToXaHelperSinglePipe*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def xarm_create(this : IDtcToXaHelperSinglePipe*, pszDSN : Win32cr::Foundation::PSTR, pszClientDll : Win32cr::Foundation::PSTR, pdwRMCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.xarm_create.call(this, pszDSN, pszClientDll, pdwRMCookie)
    end
    def convert_trid_to_xid(this : IDtcToXaHelperSinglePipe*, pdwITrans : UInt32*, dwRMCookie : UInt32, pxid : Win32cr::System::DistributedTransactionCoordinator::Xid_t*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.convert_trid_to_xid.call(this, pdwITrans, dwRMCookie, pxid)
    end
    def enlist_with_rm(this : IDtcToXaHelperSinglePipe*, dwRMCookie : UInt32, i_pITransaction : Void*, i_pITransRes : Void*, o_ppITransEnslitment : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enlist_with_rm.call(this, dwRMCookie, i_pITransaction, i_pITransRes, o_ppITransEnslitment)
    end
    def release_rm_cookie(this : IDtcToXaHelperSinglePipe*, i_dwRMCookie : UInt32, i_fNormal : Win32cr::Foundation::BOOL) : Void
      @lpVtbl.try &.value.release_rm_cookie.call(this, i_dwRMCookie, i_fNormal)
    end

  end

  @[Extern]
  record IXATransLookupVtbl,
    query_interface : Proc(IXATransLookup*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXATransLookup*, UInt32),
    release : Proc(IXATransLookup*, UInt32),
    lookup : Proc(IXATransLookup*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f3b1f131-eeda-11ce-aed4-00aa0051e2c4")]
  record IXATransLookup, lpVtbl : IXATransLookupVtbl* do
    GUID = LibC::GUID.new(0xf3b1f131_u32, 0xeeda_u16, 0x11ce_u16, StaticArray[0xae_u8, 0xd4_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x51_u8, 0xe2_u8, 0xc4_u8])
    def query_interface(this : IXATransLookup*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXATransLookup*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXATransLookup*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def lookup(this : IXATransLookup*, ppTransaction : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lookup.call(this, ppTransaction)
    end

  end

  @[Extern]
  record IXATransLookup2Vtbl,
    query_interface : Proc(IXATransLookup2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXATransLookup2*, UInt32),
    release : Proc(IXATransLookup2*, UInt32),
    lookup : Proc(IXATransLookup2*, Win32cr::System::DistributedTransactionCoordinator::Xid_t*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("bf193c85-0d1a-4290-b88f-d2cb8873d1e7")]
  record IXATransLookup2, lpVtbl : IXATransLookup2Vtbl* do
    GUID = LibC::GUID.new(0xbf193c85_u32, 0xd1a_u16, 0x4290_u16, StaticArray[0xb8_u8, 0x8f_u8, 0xd2_u8, 0xcb_u8, 0x88_u8, 0x73_u8, 0xd1_u8, 0xe7_u8])
    def query_interface(this : IXATransLookup2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXATransLookup2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXATransLookup2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def lookup(this : IXATransLookup2*, pXID : Win32cr::System::DistributedTransactionCoordinator::Xid_t*, ppTransaction : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lookup.call(this, pXID, ppTransaction)
    end

  end

  @[Extern]
  record IResourceManagerSinkVtbl,
    query_interface : Proc(IResourceManagerSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IResourceManagerSink*, UInt32),
    release : Proc(IResourceManagerSink*, UInt32),
    tm_down : Proc(IResourceManagerSink*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0d563181-defb-11ce-aed1-00aa0051e2c4")]
  record IResourceManagerSink, lpVtbl : IResourceManagerSinkVtbl* do
    GUID = LibC::GUID.new(0xd563181_u32, 0xdefb_u16, 0x11ce_u16, StaticArray[0xae_u8, 0xd1_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x51_u8, 0xe2_u8, 0xc4_u8])
    def query_interface(this : IResourceManagerSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IResourceManagerSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IResourceManagerSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def tm_down(this : IResourceManagerSink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tm_down.call(this)
    end

  end

  @[Extern]
  record IResourceManagerVtbl,
    query_interface : Proc(IResourceManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IResourceManager*, UInt32),
    release : Proc(IResourceManager*, UInt32),
    enlist : Proc(IResourceManager*, Void*, Void*, Win32cr::System::DistributedTransactionCoordinator::BOID*, Int32*, Void**, Win32cr::Foundation::HRESULT),
    reenlist : Proc(IResourceManager*, UInt8*, UInt32, UInt32, Win32cr::System::DistributedTransactionCoordinator::XACTSTAT*, Win32cr::Foundation::HRESULT),
    reenlistment_complete : Proc(IResourceManager*, Win32cr::Foundation::HRESULT),
    get_distributed_transaction_manager : Proc(IResourceManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("13741d21-87eb-11ce-8081-0080c758527e")]
  record IResourceManager, lpVtbl : IResourceManagerVtbl* do
    GUID = LibC::GUID.new(0x13741d21_u32, 0x87eb_u16, 0x11ce_u16, StaticArray[0x80_u8, 0x81_u8, 0x0_u8, 0x80_u8, 0xc7_u8, 0x58_u8, 0x52_u8, 0x7e_u8])
    def query_interface(this : IResourceManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IResourceManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IResourceManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def enlist(this : IResourceManager*, pTransaction : Void*, pRes : Void*, pUOW : Win32cr::System::DistributedTransactionCoordinator::BOID*, pisoLevel : Int32*, ppEnlist : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enlist.call(this, pTransaction, pRes, pUOW, pisoLevel, ppEnlist)
    end
    def reenlist(this : IResourceManager*, pPrepInfo : UInt8*, cbPrepInfo : UInt32, lTimeout : UInt32, pXactStat : Win32cr::System::DistributedTransactionCoordinator::XACTSTAT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reenlist.call(this, pPrepInfo, cbPrepInfo, lTimeout, pXactStat)
    end
    def reenlistment_complete(this : IResourceManager*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reenlistment_complete.call(this)
    end
    def get_distributed_transaction_manager(this : IResourceManager*, iid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_distributed_transaction_manager.call(this, iid, ppvObject)
    end

  end

  @[Extern]
  record ILastResourceManagerVtbl,
    query_interface : Proc(ILastResourceManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ILastResourceManager*, UInt32),
    release : Proc(ILastResourceManager*, UInt32),
    transaction_committed : Proc(ILastResourceManager*, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    recovery_done : Proc(ILastResourceManager*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4d964ad4-5b33-11d3-8a91-00c04f79eb6d")]
  record ILastResourceManager, lpVtbl : ILastResourceManagerVtbl* do
    GUID = LibC::GUID.new(0x4d964ad4_u32, 0x5b33_u16, 0x11d3_u16, StaticArray[0x8a_u8, 0x91_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xeb_u8, 0x6d_u8])
    def query_interface(this : ILastResourceManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ILastResourceManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ILastResourceManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def transaction_committed(this : ILastResourceManager*, pPrepInfo : UInt8*, cbPrepInfo : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.transaction_committed.call(this, pPrepInfo, cbPrepInfo)
    end
    def recovery_done(this : ILastResourceManager*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.recovery_done.call(this)
    end

  end

  @[Extern]
  record IResourceManager2Vtbl,
    query_interface : Proc(IResourceManager2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IResourceManager2*, UInt32),
    release : Proc(IResourceManager2*, UInt32),
    enlist : Proc(IResourceManager2*, Void*, Void*, Win32cr::System::DistributedTransactionCoordinator::BOID*, Int32*, Void**, Win32cr::Foundation::HRESULT),
    reenlist : Proc(IResourceManager2*, UInt8*, UInt32, UInt32, Win32cr::System::DistributedTransactionCoordinator::XACTSTAT*, Win32cr::Foundation::HRESULT),
    reenlistment_complete : Proc(IResourceManager2*, Win32cr::Foundation::HRESULT),
    get_distributed_transaction_manager : Proc(IResourceManager2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    enlist2 : Proc(IResourceManager2*, Void*, Void*, Win32cr::System::DistributedTransactionCoordinator::BOID*, Int32*, Win32cr::System::DistributedTransactionCoordinator::Xid_t*, Void**, Win32cr::Foundation::HRESULT),
    reenlist2 : Proc(IResourceManager2*, Win32cr::System::DistributedTransactionCoordinator::Xid_t*, UInt32, Win32cr::System::DistributedTransactionCoordinator::XACTSTAT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d136c69a-f749-11d1-8f47-00c04f8ee57d")]
  record IResourceManager2, lpVtbl : IResourceManager2Vtbl* do
    GUID = LibC::GUID.new(0xd136c69a_u32, 0xf749_u16, 0x11d1_u16, StaticArray[0x8f_u8, 0x47_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe5_u8, 0x7d_u8])
    def query_interface(this : IResourceManager2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IResourceManager2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IResourceManager2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def enlist(this : IResourceManager2*, pTransaction : Void*, pRes : Void*, pUOW : Win32cr::System::DistributedTransactionCoordinator::BOID*, pisoLevel : Int32*, ppEnlist : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enlist.call(this, pTransaction, pRes, pUOW, pisoLevel, ppEnlist)
    end
    def reenlist(this : IResourceManager2*, pPrepInfo : UInt8*, cbPrepInfo : UInt32, lTimeout : UInt32, pXactStat : Win32cr::System::DistributedTransactionCoordinator::XACTSTAT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reenlist.call(this, pPrepInfo, cbPrepInfo, lTimeout, pXactStat)
    end
    def reenlistment_complete(this : IResourceManager2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reenlistment_complete.call(this)
    end
    def get_distributed_transaction_manager(this : IResourceManager2*, iid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_distributed_transaction_manager.call(this, iid, ppvObject)
    end
    def enlist2(this : IResourceManager2*, pTransaction : Void*, pResAsync : Void*, pUOW : Win32cr::System::DistributedTransactionCoordinator::BOID*, pisoLevel : Int32*, pXid : Win32cr::System::DistributedTransactionCoordinator::Xid_t*, ppEnlist : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enlist2.call(this, pTransaction, pResAsync, pUOW, pisoLevel, pXid, ppEnlist)
    end
    def reenlist2(this : IResourceManager2*, pXid : Win32cr::System::DistributedTransactionCoordinator::Xid_t*, dwTimeout : UInt32, pXactStat : Win32cr::System::DistributedTransactionCoordinator::XACTSTAT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reenlist2.call(this, pXid, dwTimeout, pXactStat)
    end

  end

  @[Extern]
  record IResourceManagerRejoinableVtbl,
    query_interface : Proc(IResourceManagerRejoinable*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IResourceManagerRejoinable*, UInt32),
    release : Proc(IResourceManagerRejoinable*, UInt32),
    enlist : Proc(IResourceManagerRejoinable*, Void*, Void*, Win32cr::System::DistributedTransactionCoordinator::BOID*, Int32*, Void**, Win32cr::Foundation::HRESULT),
    reenlist : Proc(IResourceManagerRejoinable*, UInt8*, UInt32, UInt32, Win32cr::System::DistributedTransactionCoordinator::XACTSTAT*, Win32cr::Foundation::HRESULT),
    reenlistment_complete : Proc(IResourceManagerRejoinable*, Win32cr::Foundation::HRESULT),
    get_distributed_transaction_manager : Proc(IResourceManagerRejoinable*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    enlist2 : Proc(IResourceManagerRejoinable*, Void*, Void*, Win32cr::System::DistributedTransactionCoordinator::BOID*, Int32*, Win32cr::System::DistributedTransactionCoordinator::Xid_t*, Void**, Win32cr::Foundation::HRESULT),
    reenlist2 : Proc(IResourceManagerRejoinable*, Win32cr::System::DistributedTransactionCoordinator::Xid_t*, UInt32, Win32cr::System::DistributedTransactionCoordinator::XACTSTAT*, Win32cr::Foundation::HRESULT),
    rejoin : Proc(IResourceManagerRejoinable*, UInt8*, UInt32, UInt32, Win32cr::System::DistributedTransactionCoordinator::XACTSTAT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6f6de620-b5df-4f3e-9cfa-c8aebd05172b")]
  record IResourceManagerRejoinable, lpVtbl : IResourceManagerRejoinableVtbl* do
    GUID = LibC::GUID.new(0x6f6de620_u32, 0xb5df_u16, 0x4f3e_u16, StaticArray[0x9c_u8, 0xfa_u8, 0xc8_u8, 0xae_u8, 0xbd_u8, 0x5_u8, 0x17_u8, 0x2b_u8])
    def query_interface(this : IResourceManagerRejoinable*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IResourceManagerRejoinable*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IResourceManagerRejoinable*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def enlist(this : IResourceManagerRejoinable*, pTransaction : Void*, pRes : Void*, pUOW : Win32cr::System::DistributedTransactionCoordinator::BOID*, pisoLevel : Int32*, ppEnlist : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enlist.call(this, pTransaction, pRes, pUOW, pisoLevel, ppEnlist)
    end
    def reenlist(this : IResourceManagerRejoinable*, pPrepInfo : UInt8*, cbPrepInfo : UInt32, lTimeout : UInt32, pXactStat : Win32cr::System::DistributedTransactionCoordinator::XACTSTAT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reenlist.call(this, pPrepInfo, cbPrepInfo, lTimeout, pXactStat)
    end
    def reenlistment_complete(this : IResourceManagerRejoinable*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reenlistment_complete.call(this)
    end
    def get_distributed_transaction_manager(this : IResourceManagerRejoinable*, iid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_distributed_transaction_manager.call(this, iid, ppvObject)
    end
    def enlist2(this : IResourceManagerRejoinable*, pTransaction : Void*, pResAsync : Void*, pUOW : Win32cr::System::DistributedTransactionCoordinator::BOID*, pisoLevel : Int32*, pXid : Win32cr::System::DistributedTransactionCoordinator::Xid_t*, ppEnlist : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enlist2.call(this, pTransaction, pResAsync, pUOW, pisoLevel, pXid, ppEnlist)
    end
    def reenlist2(this : IResourceManagerRejoinable*, pXid : Win32cr::System::DistributedTransactionCoordinator::Xid_t*, dwTimeout : UInt32, pXactStat : Win32cr::System::DistributedTransactionCoordinator::XACTSTAT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reenlist2.call(this, pXid, dwTimeout, pXactStat)
    end
    def rejoin(this : IResourceManagerRejoinable*, pPrepInfo : UInt8*, cbPrepInfo : UInt32, lTimeout : UInt32, pXactStat : Win32cr::System::DistributedTransactionCoordinator::XACTSTAT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.rejoin.call(this, pPrepInfo, cbPrepInfo, lTimeout, pXactStat)
    end

  end

  @[Extern]
  record IXAConfigVtbl,
    query_interface : Proc(IXAConfig*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXAConfig*, UInt32),
    release : Proc(IXAConfig*, UInt32),
    initialize__ : Proc(IXAConfig*, LibC::GUID, Win32cr::Foundation::HRESULT),
    terminate : Proc(IXAConfig*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c8a6e3a1-9a8c-11cf-a308-00a0c905416e")]
  record IXAConfig, lpVtbl : IXAConfigVtbl* do
    GUID = LibC::GUID.new(0xc8a6e3a1_u32, 0x9a8c_u16, 0x11cf_u16, StaticArray[0xa3_u8, 0x8_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
    def query_interface(this : IXAConfig*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXAConfig*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXAConfig*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IXAConfig*, clsidHelperDll : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, clsidHelperDll)
    end
    def terminate(this : IXAConfig*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.terminate.call(this)
    end

  end

  @[Extern]
  record IRMHelperVtbl,
    query_interface : Proc(IRMHelper*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRMHelper*, UInt32),
    release : Proc(IRMHelper*, UInt32),
    rm_count : Proc(IRMHelper*, UInt32, Win32cr::Foundation::HRESULT),
    rm_info : Proc(IRMHelper*, Win32cr::System::DistributedTransactionCoordinator::Xa_switch_t*, Win32cr::Foundation::BOOL, Win32cr::Foundation::PSTR, Win32cr::Foundation::PSTR, LibC::GUID, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("e793f6d1-f53d-11cf-a60d-00a0c905416e")]
  record IRMHelper, lpVtbl : IRMHelperVtbl* do
    GUID = LibC::GUID.new(0xe793f6d1_u32, 0xf53d_u16, 0x11cf_u16, StaticArray[0xa6_u8, 0xd_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
    def query_interface(this : IRMHelper*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRMHelper*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRMHelper*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def rm_count(this : IRMHelper*, dwcTotalNumberOfRMs : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.rm_count.call(this, dwcTotalNumberOfRMs)
    end
    def rm_info(this : IRMHelper*, pXa_Switch : Win32cr::System::DistributedTransactionCoordinator::Xa_switch_t*, fCDeclCallingConv : Win32cr::Foundation::BOOL, pszOpenString : Win32cr::Foundation::PSTR, pszCloseString : Win32cr::Foundation::PSTR, guidRMRecovery : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.rm_info.call(this, pXa_Switch, fCDeclCallingConv, pszOpenString, pszCloseString, guidRMRecovery)
    end

  end

  @[Extern]
  record IXAObtainRMInfoVtbl,
    query_interface : Proc(IXAObtainRMInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXAObtainRMInfo*, UInt32),
    release : Proc(IXAObtainRMInfo*, UInt32),
    obtain_rm_info : Proc(IXAObtainRMInfo*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("e793f6d2-f53d-11cf-a60d-00a0c905416e")]
  record IXAObtainRMInfo, lpVtbl : IXAObtainRMInfoVtbl* do
    GUID = LibC::GUID.new(0xe793f6d2_u32, 0xf53d_u16, 0x11cf_u16, StaticArray[0xa6_u8, 0xd_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
    def query_interface(this : IXAObtainRMInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXAObtainRMInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXAObtainRMInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def obtain_rm_info(this : IXAObtainRMInfo*, pIRMHelper : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.obtain_rm_info.call(this, pIRMHelper)
    end

  end

  @[Extern]
  record IResourceManagerFactoryVtbl,
    query_interface : Proc(IResourceManagerFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IResourceManagerFactory*, UInt32),
    release : Proc(IResourceManagerFactory*, UInt32),
    create : Proc(IResourceManagerFactory*, LibC::GUID*, Win32cr::Foundation::PSTR, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("13741d20-87eb-11ce-8081-0080c758527e")]
  record IResourceManagerFactory, lpVtbl : IResourceManagerFactoryVtbl* do
    GUID = LibC::GUID.new(0x13741d20_u32, 0x87eb_u16, 0x11ce_u16, StaticArray[0x80_u8, 0x81_u8, 0x0_u8, 0x80_u8, 0xc7_u8, 0x58_u8, 0x52_u8, 0x7e_u8])
    def query_interface(this : IResourceManagerFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IResourceManagerFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IResourceManagerFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create(this : IResourceManagerFactory*, pguidRM : LibC::GUID*, pszRMName : Win32cr::Foundation::PSTR, pIResMgrSink : Void*, ppResMgr : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create.call(this, pguidRM, pszRMName, pIResMgrSink, ppResMgr)
    end

  end

  @[Extern]
  record IResourceManagerFactory2Vtbl,
    query_interface : Proc(IResourceManagerFactory2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IResourceManagerFactory2*, UInt32),
    release : Proc(IResourceManagerFactory2*, UInt32),
    create : Proc(IResourceManagerFactory2*, LibC::GUID*, Win32cr::Foundation::PSTR, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_ex : Proc(IResourceManagerFactory2*, LibC::GUID*, Win32cr::Foundation::PSTR, Void*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6b369c21-fbd2-11d1-8f47-00c04f8ee57d")]
  record IResourceManagerFactory2, lpVtbl : IResourceManagerFactory2Vtbl* do
    GUID = LibC::GUID.new(0x6b369c21_u32, 0xfbd2_u16, 0x11d1_u16, StaticArray[0x8f_u8, 0x47_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe5_u8, 0x7d_u8])
    def query_interface(this : IResourceManagerFactory2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IResourceManagerFactory2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IResourceManagerFactory2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create(this : IResourceManagerFactory2*, pguidRM : LibC::GUID*, pszRMName : Win32cr::Foundation::PSTR, pIResMgrSink : Void*, ppResMgr : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create.call(this, pguidRM, pszRMName, pIResMgrSink, ppResMgr)
    end
    def create_ex(this : IResourceManagerFactory2*, pguidRM : LibC::GUID*, pszRMName : Win32cr::Foundation::PSTR, pIResMgrSink : Void*, riidRequested : LibC::GUID*, ppvResMgr : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_ex.call(this, pguidRM, pszRMName, pIResMgrSink, riidRequested, ppvResMgr)
    end

  end

  @[Extern]
  record IPrepareInfoVtbl,
    query_interface : Proc(IPrepareInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPrepareInfo*, UInt32),
    release : Proc(IPrepareInfo*, UInt32),
    get_prepare_info_size : Proc(IPrepareInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_prepare_info : Proc(IPrepareInfo*, UInt8*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("80c7bfd0-87ee-11ce-8081-0080c758527e")]
  record IPrepareInfo, lpVtbl : IPrepareInfoVtbl* do
    GUID = LibC::GUID.new(0x80c7bfd0_u32, 0x87ee_u16, 0x11ce_u16, StaticArray[0x80_u8, 0x81_u8, 0x0_u8, 0x80_u8, 0xc7_u8, 0x58_u8, 0x52_u8, 0x7e_u8])
    def query_interface(this : IPrepareInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPrepareInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPrepareInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_prepare_info_size(this : IPrepareInfo*, pcbPrepInfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prepare_info_size.call(this, pcbPrepInfo)
    end
    def get_prepare_info(this : IPrepareInfo*, pPrepInfo : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prepare_info.call(this, pPrepInfo)
    end

  end

  @[Extern]
  record IPrepareInfo2Vtbl,
    query_interface : Proc(IPrepareInfo2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPrepareInfo2*, UInt32),
    release : Proc(IPrepareInfo2*, UInt32),
    get_prepare_info_size : Proc(IPrepareInfo2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_prepare_info : Proc(IPrepareInfo2*, UInt32, UInt8*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5fab2547-9779-11d1-b886-00c04fb9618a")]
  record IPrepareInfo2, lpVtbl : IPrepareInfo2Vtbl* do
    GUID = LibC::GUID.new(0x5fab2547_u32, 0x9779_u16, 0x11d1_u16, StaticArray[0xb8_u8, 0x86_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x61_u8, 0x8a_u8])
    def query_interface(this : IPrepareInfo2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPrepareInfo2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPrepareInfo2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_prepare_info_size(this : IPrepareInfo2*, pcbPrepInfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prepare_info_size.call(this, pcbPrepInfo)
    end
    def get_prepare_info(this : IPrepareInfo2*, cbPrepareInfo : UInt32, pPrepInfo : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prepare_info.call(this, cbPrepareInfo, pPrepInfo)
    end

  end

  @[Extern]
  record IGetDispenserVtbl,
    query_interface : Proc(IGetDispenser*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGetDispenser*, UInt32),
    release : Proc(IGetDispenser*, UInt32),
    get_dispenser : Proc(IGetDispenser*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c23cc370-87ef-11ce-8081-0080c758527e")]
  record IGetDispenser, lpVtbl : IGetDispenserVtbl* do
    GUID = LibC::GUID.new(0xc23cc370_u32, 0x87ef_u16, 0x11ce_u16, StaticArray[0x80_u8, 0x81_u8, 0x0_u8, 0x80_u8, 0xc7_u8, 0x58_u8, 0x52_u8, 0x7e_u8])
    def query_interface(this : IGetDispenser*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGetDispenser*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGetDispenser*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_dispenser(this : IGetDispenser*, iid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dispenser.call(this, iid, ppvObject)
    end

  end

  @[Extern]
  record ITransactionVoterBallotAsync2Vtbl,
    query_interface : Proc(ITransactionVoterBallotAsync2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITransactionVoterBallotAsync2*, UInt32),
    release : Proc(ITransactionVoterBallotAsync2*, UInt32),
    vote_request_done : Proc(ITransactionVoterBallotAsync2*, Win32cr::Foundation::HRESULT, Win32cr::System::DistributedTransactionCoordinator::BOID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5433376c-414d-11d3-b206-00c04fc2f3ef")]
  record ITransactionVoterBallotAsync2, lpVtbl : ITransactionVoterBallotAsync2Vtbl* do
    GUID = LibC::GUID.new(0x5433376c_u32, 0x414d_u16, 0x11d3_u16, StaticArray[0xb2_u8, 0x6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0xf3_u8, 0xef_u8])
    def query_interface(this : ITransactionVoterBallotAsync2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITransactionVoterBallotAsync2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITransactionVoterBallotAsync2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def vote_request_done(this : ITransactionVoterBallotAsync2*, hr : Win32cr::Foundation::HRESULT, pboidReason : Win32cr::System::DistributedTransactionCoordinator::BOID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.vote_request_done.call(this, hr, pboidReason)
    end

  end

  @[Extern]
  record ITransactionVoterNotifyAsync2Vtbl,
    query_interface : Proc(ITransactionVoterNotifyAsync2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITransactionVoterNotifyAsync2*, UInt32),
    release : Proc(ITransactionVoterNotifyAsync2*, UInt32),
    committed : Proc(ITransactionVoterNotifyAsync2*, Win32cr::Foundation::BOOL, Win32cr::System::DistributedTransactionCoordinator::BOID*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    aborted : Proc(ITransactionVoterNotifyAsync2*, Win32cr::System::DistributedTransactionCoordinator::BOID*, Win32cr::Foundation::BOOL, Win32cr::System::DistributedTransactionCoordinator::BOID*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    heuristic_decision : Proc(ITransactionVoterNotifyAsync2*, UInt32, Win32cr::System::DistributedTransactionCoordinator::BOID*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    indoubt : Proc(ITransactionVoterNotifyAsync2*, Win32cr::Foundation::HRESULT),
    vote_request : Proc(ITransactionVoterNotifyAsync2*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5433376b-414d-11d3-b206-00c04fc2f3ef")]
  record ITransactionVoterNotifyAsync2, lpVtbl : ITransactionVoterNotifyAsync2Vtbl* do
    GUID = LibC::GUID.new(0x5433376b_u32, 0x414d_u16, 0x11d3_u16, StaticArray[0xb2_u8, 0x6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0xf3_u8, 0xef_u8])
    def query_interface(this : ITransactionVoterNotifyAsync2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITransactionVoterNotifyAsync2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITransactionVoterNotifyAsync2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def committed(this : ITransactionVoterNotifyAsync2*, fRetaining : Win32cr::Foundation::BOOL, pNewUOW : Win32cr::System::DistributedTransactionCoordinator::BOID*, hr : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.committed.call(this, fRetaining, pNewUOW, hr)
    end
    def aborted(this : ITransactionVoterNotifyAsync2*, pboidReason : Win32cr::System::DistributedTransactionCoordinator::BOID*, fRetaining : Win32cr::Foundation::BOOL, pNewUOW : Win32cr::System::DistributedTransactionCoordinator::BOID*, hr : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.aborted.call(this, pboidReason, fRetaining, pNewUOW, hr)
    end
    def heuristic_decision(this : ITransactionVoterNotifyAsync2*, dwDecision : UInt32, pboidReason : Win32cr::System::DistributedTransactionCoordinator::BOID*, hr : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.heuristic_decision.call(this, dwDecision, pboidReason, hr)
    end
    def indoubt(this : ITransactionVoterNotifyAsync2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.indoubt.call(this)
    end
    def vote_request(this : ITransactionVoterNotifyAsync2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.vote_request.call(this)
    end

  end

  @[Extern]
  record ITransactionVoterFactory2Vtbl,
    query_interface : Proc(ITransactionVoterFactory2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITransactionVoterFactory2*, UInt32),
    release : Proc(ITransactionVoterFactory2*, UInt32),
    create : Proc(ITransactionVoterFactory2*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5433376a-414d-11d3-b206-00c04fc2f3ef")]
  record ITransactionVoterFactory2, lpVtbl : ITransactionVoterFactory2Vtbl* do
    GUID = LibC::GUID.new(0x5433376a_u32, 0x414d_u16, 0x11d3_u16, StaticArray[0xb2_u8, 0x6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0xf3_u8, 0xef_u8])
    def query_interface(this : ITransactionVoterFactory2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITransactionVoterFactory2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITransactionVoterFactory2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create(this : ITransactionVoterFactory2*, pTransaction : Void*, pVoterNotify : Void*, ppVoterBallot : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create.call(this, pTransaction, pVoterNotify, ppVoterBallot)
    end

  end

  @[Extern]
  record ITransactionPhase0EnlistmentAsyncVtbl,
    query_interface : Proc(ITransactionPhase0EnlistmentAsync*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITransactionPhase0EnlistmentAsync*, UInt32),
    release : Proc(ITransactionPhase0EnlistmentAsync*, UInt32),
    enable : Proc(ITransactionPhase0EnlistmentAsync*, Win32cr::Foundation::HRESULT),
    wait_for_enlistment : Proc(ITransactionPhase0EnlistmentAsync*, Win32cr::Foundation::HRESULT),
    phase0_done : Proc(ITransactionPhase0EnlistmentAsync*, Win32cr::Foundation::HRESULT),
    unenlist : Proc(ITransactionPhase0EnlistmentAsync*, Win32cr::Foundation::HRESULT),
    get_transaction : Proc(ITransactionPhase0EnlistmentAsync*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("82dc88e1-a954-11d1-8f88-00600895e7d5")]
  record ITransactionPhase0EnlistmentAsync, lpVtbl : ITransactionPhase0EnlistmentAsyncVtbl* do
    GUID = LibC::GUID.new(0x82dc88e1_u32, 0xa954_u16, 0x11d1_u16, StaticArray[0x8f_u8, 0x88_u8, 0x0_u8, 0x60_u8, 0x8_u8, 0x95_u8, 0xe7_u8, 0xd5_u8])
    def query_interface(this : ITransactionPhase0EnlistmentAsync*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITransactionPhase0EnlistmentAsync*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITransactionPhase0EnlistmentAsync*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def enable(this : ITransactionPhase0EnlistmentAsync*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable.call(this)
    end
    def wait_for_enlistment(this : ITransactionPhase0EnlistmentAsync*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wait_for_enlistment.call(this)
    end
    def phase0_done(this : ITransactionPhase0EnlistmentAsync*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.phase0_done.call(this)
    end
    def unenlist(this : ITransactionPhase0EnlistmentAsync*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unenlist.call(this)
    end
    def get_transaction(this : ITransactionPhase0EnlistmentAsync*, ppITransaction : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transaction.call(this, ppITransaction)
    end

  end

  @[Extern]
  record ITransactionPhase0NotifyAsyncVtbl,
    query_interface : Proc(ITransactionPhase0NotifyAsync*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITransactionPhase0NotifyAsync*, UInt32),
    release : Proc(ITransactionPhase0NotifyAsync*, UInt32),
    phase0_request : Proc(ITransactionPhase0NotifyAsync*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    enlist_completed : Proc(ITransactionPhase0NotifyAsync*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("ef081809-0c76-11d2-87a6-00c04f990f34")]
  record ITransactionPhase0NotifyAsync, lpVtbl : ITransactionPhase0NotifyAsyncVtbl* do
    GUID = LibC::GUID.new(0xef081809_u32, 0xc76_u16, 0x11d2_u16, StaticArray[0x87_u8, 0xa6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x99_u8, 0xf_u8, 0x34_u8])
    def query_interface(this : ITransactionPhase0NotifyAsync*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITransactionPhase0NotifyAsync*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITransactionPhase0NotifyAsync*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def phase0_request(this : ITransactionPhase0NotifyAsync*, fAbortingHint : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.phase0_request.call(this, fAbortingHint)
    end
    def enlist_completed(this : ITransactionPhase0NotifyAsync*, status : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enlist_completed.call(this, status)
    end

  end

  @[Extern]
  record ITransactionPhase0FactoryVtbl,
    query_interface : Proc(ITransactionPhase0Factory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITransactionPhase0Factory*, UInt32),
    release : Proc(ITransactionPhase0Factory*, UInt32),
    create : Proc(ITransactionPhase0Factory*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("82dc88e0-a954-11d1-8f88-00600895e7d5")]
  record ITransactionPhase0Factory, lpVtbl : ITransactionPhase0FactoryVtbl* do
    GUID = LibC::GUID.new(0x82dc88e0_u32, 0xa954_u16, 0x11d1_u16, StaticArray[0x8f_u8, 0x88_u8, 0x0_u8, 0x60_u8, 0x8_u8, 0x95_u8, 0xe7_u8, 0xd5_u8])
    def query_interface(this : ITransactionPhase0Factory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITransactionPhase0Factory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITransactionPhase0Factory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create(this : ITransactionPhase0Factory*, pPhase0Notify : Void*, ppPhase0Enlistment : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create.call(this, pPhase0Notify, ppPhase0Enlistment)
    end

  end

  @[Extern]
  record ITransactionTransmitterVtbl,
    query_interface : Proc(ITransactionTransmitter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITransactionTransmitter*, UInt32),
    release : Proc(ITransactionTransmitter*, UInt32),
    set : Proc(ITransactionTransmitter*, Void*, Win32cr::Foundation::HRESULT),
    get_propagation_token_size : Proc(ITransactionTransmitter*, UInt32*, Win32cr::Foundation::HRESULT),
    marshal_propagation_token : Proc(ITransactionTransmitter*, UInt32, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    unmarshal_return_token : Proc(ITransactionTransmitter*, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    reset : Proc(ITransactionTransmitter*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("59313e01-b36c-11cf-a539-00aa006887c3")]
  record ITransactionTransmitter, lpVtbl : ITransactionTransmitterVtbl* do
    GUID = LibC::GUID.new(0x59313e01_u32, 0xb36c_u16, 0x11cf_u16, StaticArray[0xa5_u8, 0x39_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x68_u8, 0x87_u8, 0xc3_u8])
    def query_interface(this : ITransactionTransmitter*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITransactionTransmitter*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITransactionTransmitter*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set(this : ITransactionTransmitter*, pTransaction : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set.call(this, pTransaction)
    end
    def get_propagation_token_size(this : ITransactionTransmitter*, pcbToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_propagation_token_size.call(this, pcbToken)
    end
    def marshal_propagation_token(this : ITransactionTransmitter*, cbToken : UInt32, rgbToken : UInt8*, pcbUsed : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.marshal_propagation_token.call(this, cbToken, rgbToken, pcbUsed)
    end
    def unmarshal_return_token(this : ITransactionTransmitter*, cbReturnToken : UInt32, rgbReturnToken : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unmarshal_return_token.call(this, cbReturnToken, rgbReturnToken)
    end
    def reset(this : ITransactionTransmitter*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end

  end

  @[Extern]
  record ITransactionTransmitterFactoryVtbl,
    query_interface : Proc(ITransactionTransmitterFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITransactionTransmitterFactory*, UInt32),
    release : Proc(ITransactionTransmitterFactory*, UInt32),
    create : Proc(ITransactionTransmitterFactory*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("59313e00-b36c-11cf-a539-00aa006887c3")]
  record ITransactionTransmitterFactory, lpVtbl : ITransactionTransmitterFactoryVtbl* do
    GUID = LibC::GUID.new(0x59313e00_u32, 0xb36c_u16, 0x11cf_u16, StaticArray[0xa5_u8, 0x39_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x68_u8, 0x87_u8, 0xc3_u8])
    def query_interface(this : ITransactionTransmitterFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITransactionTransmitterFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITransactionTransmitterFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create(this : ITransactionTransmitterFactory*, ppTransmitter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create.call(this, ppTransmitter)
    end

  end

  @[Extern]
  record ITransactionReceiverVtbl,
    query_interface : Proc(ITransactionReceiver*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITransactionReceiver*, UInt32),
    release : Proc(ITransactionReceiver*, UInt32),
    unmarshal_propagation_token : Proc(ITransactionReceiver*, UInt32, UInt8*, Void**, Win32cr::Foundation::HRESULT),
    get_return_token_size : Proc(ITransactionReceiver*, UInt32*, Win32cr::Foundation::HRESULT),
    marshal_return_token : Proc(ITransactionReceiver*, UInt32, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    reset : Proc(ITransactionReceiver*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("59313e03-b36c-11cf-a539-00aa006887c3")]
  record ITransactionReceiver, lpVtbl : ITransactionReceiverVtbl* do
    GUID = LibC::GUID.new(0x59313e03_u32, 0xb36c_u16, 0x11cf_u16, StaticArray[0xa5_u8, 0x39_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x68_u8, 0x87_u8, 0xc3_u8])
    def query_interface(this : ITransactionReceiver*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITransactionReceiver*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITransactionReceiver*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def unmarshal_propagation_token(this : ITransactionReceiver*, cbToken : UInt32, rgbToken : UInt8*, ppTransaction : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unmarshal_propagation_token.call(this, cbToken, rgbToken, ppTransaction)
    end
    def get_return_token_size(this : ITransactionReceiver*, pcbReturnToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_return_token_size.call(this, pcbReturnToken)
    end
    def marshal_return_token(this : ITransactionReceiver*, cbReturnToken : UInt32, rgbReturnToken : UInt8*, pcbUsed : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.marshal_return_token.call(this, cbReturnToken, rgbReturnToken, pcbUsed)
    end
    def reset(this : ITransactionReceiver*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end

  end

  @[Extern]
  record ITransactionReceiverFactoryVtbl,
    query_interface : Proc(ITransactionReceiverFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITransactionReceiverFactory*, UInt32),
    release : Proc(ITransactionReceiverFactory*, UInt32),
    create : Proc(ITransactionReceiverFactory*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("59313e02-b36c-11cf-a539-00aa006887c3")]
  record ITransactionReceiverFactory, lpVtbl : ITransactionReceiverFactoryVtbl* do
    GUID = LibC::GUID.new(0x59313e02_u32, 0xb36c_u16, 0x11cf_u16, StaticArray[0xa5_u8, 0x39_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x68_u8, 0x87_u8, 0xc3_u8])
    def query_interface(this : ITransactionReceiverFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITransactionReceiverFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITransactionReceiverFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create(this : ITransactionReceiverFactory*, ppReceiver : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create.call(this, ppReceiver)
    end

  end

  @[Extern]
  record IDtcLuConfigureVtbl,
    query_interface : Proc(IDtcLuConfigure*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDtcLuConfigure*, UInt32),
    release : Proc(IDtcLuConfigure*, UInt32),
    add : Proc(IDtcLuConfigure*, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    delete : Proc(IDtcLuConfigure*, UInt8*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4131e760-1aea-11d0-944b-00a0c905416e")]
  record IDtcLuConfigure, lpVtbl : IDtcLuConfigureVtbl* do
    GUID = LibC::GUID.new(0x4131e760_u32, 0x1aea_u16, 0x11d0_u16, StaticArray[0x94_u8, 0x4b_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
    def query_interface(this : IDtcLuConfigure*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDtcLuConfigure*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDtcLuConfigure*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add(this : IDtcLuConfigure*, pucLuPair : UInt8*, cbLuPair : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, pucLuPair, cbLuPair)
    end
    def delete(this : IDtcLuConfigure*, pucLuPair : UInt8*, cbLuPair : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this, pucLuPair, cbLuPair)
    end

  end

  @[Extern]
  record IDtcLuRecoveryVtbl,
    query_interface : Proc(IDtcLuRecovery*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDtcLuRecovery*, UInt32),
    release : Proc(IDtcLuRecovery*, UInt32)


  @[Extern]
  #@[Com("ac2b8ad2-d6f0-11d0-b386-00a0c9083365")]
  record IDtcLuRecovery, lpVtbl : IDtcLuRecoveryVtbl* do
    GUID = LibC::GUID.new(0xac2b8ad2_u32, 0xd6f0_u16, 0x11d0_u16, StaticArray[0xb3_u8, 0x86_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x8_u8, 0x33_u8, 0x65_u8])
    def query_interface(this : IDtcLuRecovery*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDtcLuRecovery*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDtcLuRecovery*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end

  end

  @[Extern]
  record IDtcLuRecoveryFactoryVtbl,
    query_interface : Proc(IDtcLuRecoveryFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDtcLuRecoveryFactory*, UInt32),
    release : Proc(IDtcLuRecoveryFactory*, UInt32),
    create : Proc(IDtcLuRecoveryFactory*, UInt8*, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4131e762-1aea-11d0-944b-00a0c905416e")]
  record IDtcLuRecoveryFactory, lpVtbl : IDtcLuRecoveryFactoryVtbl* do
    GUID = LibC::GUID.new(0x4131e762_u32, 0x1aea_u16, 0x11d0_u16, StaticArray[0x94_u8, 0x4b_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
    def query_interface(this : IDtcLuRecoveryFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDtcLuRecoveryFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDtcLuRecoveryFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create(this : IDtcLuRecoveryFactory*, pucLuPair : UInt8*, cbLuPair : UInt32, ppRecovery : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create.call(this, pucLuPair, cbLuPair, ppRecovery)
    end

  end

  @[Extern]
  record IDtcLuRecoveryInitiatedByDtcTransWorkVtbl,
    query_interface : Proc(IDtcLuRecoveryInitiatedByDtcTransWork*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDtcLuRecoveryInitiatedByDtcTransWork*, UInt32),
    release : Proc(IDtcLuRecoveryInitiatedByDtcTransWork*, UInt32),
    get_log_name_sizes : Proc(IDtcLuRecoveryInitiatedByDtcTransWork*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_our_xln : Proc(IDtcLuRecoveryInitiatedByDtcTransWork*, Win32cr::System::DistributedTransactionCoordinator::DtcLu_Xln*, UInt8*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    handle_confirmation_from_our_xln : Proc(IDtcLuRecoveryInitiatedByDtcTransWork*, Win32cr::System::DistributedTransactionCoordinator::DtcLu_Xln_Confirmation, Win32cr::Foundation::HRESULT),
    handle_their_xln_response : Proc(IDtcLuRecoveryInitiatedByDtcTransWork*, Win32cr::System::DistributedTransactionCoordinator::DtcLu_Xln, UInt8*, UInt32, UInt32, Win32cr::System::DistributedTransactionCoordinator::DtcLu_Xln_Confirmation*, Win32cr::Foundation::HRESULT),
    handle_error_from_our_xln : Proc(IDtcLuRecoveryInitiatedByDtcTransWork*, Win32cr::System::DistributedTransactionCoordinator::DtcLu_Xln_Error, Win32cr::Foundation::HRESULT),
    check_for_compare_states : Proc(IDtcLuRecoveryInitiatedByDtcTransWork*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_our_trans_id_size : Proc(IDtcLuRecoveryInitiatedByDtcTransWork*, UInt32*, Win32cr::Foundation::HRESULT),
    get_our_compare_states : Proc(IDtcLuRecoveryInitiatedByDtcTransWork*, UInt8*, Win32cr::System::DistributedTransactionCoordinator::DtcLu_CompareState*, Win32cr::Foundation::HRESULT),
    handle_their_compare_states_response : Proc(IDtcLuRecoveryInitiatedByDtcTransWork*, Win32cr::System::DistributedTransactionCoordinator::DtcLu_CompareState, Win32cr::System::DistributedTransactionCoordinator::DtcLu_CompareStates_Confirmation*, Win32cr::Foundation::HRESULT),
    handle_error_from_our_compare_states : Proc(IDtcLuRecoveryInitiatedByDtcTransWork*, Win32cr::System::DistributedTransactionCoordinator::DtcLu_CompareStates_Error, Win32cr::Foundation::HRESULT),
    conversation_lost : Proc(IDtcLuRecoveryInitiatedByDtcTransWork*, Win32cr::Foundation::HRESULT),
    get_recovery_seq_num : Proc(IDtcLuRecoveryInitiatedByDtcTransWork*, Int32*, Win32cr::Foundation::HRESULT),
    obsolete_recovery_seq_num : Proc(IDtcLuRecoveryInitiatedByDtcTransWork*, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4131e765-1aea-11d0-944b-00a0c905416e")]
  record IDtcLuRecoveryInitiatedByDtcTransWork, lpVtbl : IDtcLuRecoveryInitiatedByDtcTransWorkVtbl* do
    GUID = LibC::GUID.new(0x4131e765_u32, 0x1aea_u16, 0x11d0_u16, StaticArray[0x94_u8, 0x4b_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
    def query_interface(this : IDtcLuRecoveryInitiatedByDtcTransWork*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDtcLuRecoveryInitiatedByDtcTransWork*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDtcLuRecoveryInitiatedByDtcTransWork*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_log_name_sizes(this : IDtcLuRecoveryInitiatedByDtcTransWork*, pcbOurLogName : UInt32*, pcbRemoteLogName : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_log_name_sizes.call(this, pcbOurLogName, pcbRemoteLogName)
    end
    def get_our_xln(this : IDtcLuRecoveryInitiatedByDtcTransWork*, pXln : Win32cr::System::DistributedTransactionCoordinator::DtcLu_Xln*, pOurLogName : UInt8*, pRemoteLogName : UInt8*, pdwProtocol : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_our_xln.call(this, pXln, pOurLogName, pRemoteLogName, pdwProtocol)
    end
    def handle_confirmation_from_our_xln(this : IDtcLuRecoveryInitiatedByDtcTransWork*, confirmation : Win32cr::System::DistributedTransactionCoordinator::DtcLu_Xln_Confirmation) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_confirmation_from_our_xln.call(this, confirmation)
    end
    def handle_their_xln_response(this : IDtcLuRecoveryInitiatedByDtcTransWork*, xln : Win32cr::System::DistributedTransactionCoordinator::DtcLu_Xln, pRemoteLogName : UInt8*, cbRemoteLogName : UInt32, dwProtocol : UInt32, pConfirmation : Win32cr::System::DistributedTransactionCoordinator::DtcLu_Xln_Confirmation*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_their_xln_response.call(this, xln, pRemoteLogName, cbRemoteLogName, dwProtocol, pConfirmation)
    end
    def handle_error_from_our_xln(this : IDtcLuRecoveryInitiatedByDtcTransWork*, error : Win32cr::System::DistributedTransactionCoordinator::DtcLu_Xln_Error) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_error_from_our_xln.call(this, error)
    end
    def check_for_compare_states(this : IDtcLuRecoveryInitiatedByDtcTransWork*, fCompareStates : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.check_for_compare_states.call(this, fCompareStates)
    end
    def get_our_trans_id_size(this : IDtcLuRecoveryInitiatedByDtcTransWork*, pcbOurTransId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_our_trans_id_size.call(this, pcbOurTransId)
    end
    def get_our_compare_states(this : IDtcLuRecoveryInitiatedByDtcTransWork*, pOurTransId : UInt8*, pCompareState : Win32cr::System::DistributedTransactionCoordinator::DtcLu_CompareState*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_our_compare_states.call(this, pOurTransId, pCompareState)
    end
    def handle_their_compare_states_response(this : IDtcLuRecoveryInitiatedByDtcTransWork*, compare_state : Win32cr::System::DistributedTransactionCoordinator::DtcLu_CompareState, pConfirmation : Win32cr::System::DistributedTransactionCoordinator::DtcLu_CompareStates_Confirmation*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_their_compare_states_response.call(this, compare_state, pConfirmation)
    end
    def handle_error_from_our_compare_states(this : IDtcLuRecoveryInitiatedByDtcTransWork*, error : Win32cr::System::DistributedTransactionCoordinator::DtcLu_CompareStates_Error) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_error_from_our_compare_states.call(this, error)
    end
    def conversation_lost(this : IDtcLuRecoveryInitiatedByDtcTransWork*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.conversation_lost.call(this)
    end
    def get_recovery_seq_num(this : IDtcLuRecoveryInitiatedByDtcTransWork*, plRecoverySeqNum : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_recovery_seq_num.call(this, plRecoverySeqNum)
    end
    def obsolete_recovery_seq_num(this : IDtcLuRecoveryInitiatedByDtcTransWork*, lNewRecoverySeqNum : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.obsolete_recovery_seq_num.call(this, lNewRecoverySeqNum)
    end

  end

  @[Extern]
  record IDtcLuRecoveryInitiatedByDtcStatusWorkVtbl,
    query_interface : Proc(IDtcLuRecoveryInitiatedByDtcStatusWork*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDtcLuRecoveryInitiatedByDtcStatusWork*, UInt32),
    release : Proc(IDtcLuRecoveryInitiatedByDtcStatusWork*, UInt32),
    handle_check_lu_status : Proc(IDtcLuRecoveryInitiatedByDtcStatusWork*, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4131e766-1aea-11d0-944b-00a0c905416e")]
  record IDtcLuRecoveryInitiatedByDtcStatusWork, lpVtbl : IDtcLuRecoveryInitiatedByDtcStatusWorkVtbl* do
    GUID = LibC::GUID.new(0x4131e766_u32, 0x1aea_u16, 0x11d0_u16, StaticArray[0x94_u8, 0x4b_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
    def query_interface(this : IDtcLuRecoveryInitiatedByDtcStatusWork*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDtcLuRecoveryInitiatedByDtcStatusWork*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDtcLuRecoveryInitiatedByDtcStatusWork*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def handle_check_lu_status(this : IDtcLuRecoveryInitiatedByDtcStatusWork*, lRecoverySeqNum : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_check_lu_status.call(this, lRecoverySeqNum)
    end

  end

  @[Extern]
  record IDtcLuRecoveryInitiatedByDtcVtbl,
    query_interface : Proc(IDtcLuRecoveryInitiatedByDtc*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDtcLuRecoveryInitiatedByDtc*, UInt32),
    release : Proc(IDtcLuRecoveryInitiatedByDtc*, UInt32),
    get_work : Proc(IDtcLuRecoveryInitiatedByDtc*, Win32cr::System::DistributedTransactionCoordinator::DtcLu_LocalRecovery_Work*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4131e764-1aea-11d0-944b-00a0c905416e")]
  record IDtcLuRecoveryInitiatedByDtc, lpVtbl : IDtcLuRecoveryInitiatedByDtcVtbl* do
    GUID = LibC::GUID.new(0x4131e764_u32, 0x1aea_u16, 0x11d0_u16, StaticArray[0x94_u8, 0x4b_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
    def query_interface(this : IDtcLuRecoveryInitiatedByDtc*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDtcLuRecoveryInitiatedByDtc*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDtcLuRecoveryInitiatedByDtc*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_work(this : IDtcLuRecoveryInitiatedByDtc*, pWork : Win32cr::System::DistributedTransactionCoordinator::DtcLu_LocalRecovery_Work*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_work.call(this, pWork, ppv)
    end

  end

  @[Extern]
  record IDtcLuRecoveryInitiatedByLuWorkVtbl,
    query_interface : Proc(IDtcLuRecoveryInitiatedByLuWork*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDtcLuRecoveryInitiatedByLuWork*, UInt32),
    release : Proc(IDtcLuRecoveryInitiatedByLuWork*, UInt32),
    handle_their_xln : Proc(IDtcLuRecoveryInitiatedByLuWork*, Int32, Win32cr::System::DistributedTransactionCoordinator::DtcLu_Xln, UInt8*, UInt32, UInt8*, UInt32, UInt32, Win32cr::System::DistributedTransactionCoordinator::DtcLu_Xln_Response*, Win32cr::Foundation::HRESULT),
    get_our_log_name_size : Proc(IDtcLuRecoveryInitiatedByLuWork*, UInt32*, Win32cr::Foundation::HRESULT),
    get_our_xln : Proc(IDtcLuRecoveryInitiatedByLuWork*, Win32cr::System::DistributedTransactionCoordinator::DtcLu_Xln*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    handle_confirmation_of_our_xln : Proc(IDtcLuRecoveryInitiatedByLuWork*, Win32cr::System::DistributedTransactionCoordinator::DtcLu_Xln_Confirmation, Win32cr::Foundation::HRESULT),
    handle_their_compare_states : Proc(IDtcLuRecoveryInitiatedByLuWork*, UInt8*, UInt32, Win32cr::System::DistributedTransactionCoordinator::DtcLu_CompareState, Win32cr::System::DistributedTransactionCoordinator::DtcLu_CompareStates_Response*, Win32cr::System::DistributedTransactionCoordinator::DtcLu_CompareState*, Win32cr::Foundation::HRESULT),
    handle_confirmation_of_our_compare_states : Proc(IDtcLuRecoveryInitiatedByLuWork*, Win32cr::System::DistributedTransactionCoordinator::DtcLu_CompareStates_Confirmation, Win32cr::Foundation::HRESULT),
    handle_error_from_our_compare_states : Proc(IDtcLuRecoveryInitiatedByLuWork*, Win32cr::System::DistributedTransactionCoordinator::DtcLu_CompareStates_Error, Win32cr::Foundation::HRESULT),
    conversation_lost : Proc(IDtcLuRecoveryInitiatedByLuWork*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("ac2b8ad1-d6f0-11d0-b386-00a0c9083365")]
  record IDtcLuRecoveryInitiatedByLuWork, lpVtbl : IDtcLuRecoveryInitiatedByLuWorkVtbl* do
    GUID = LibC::GUID.new(0xac2b8ad1_u32, 0xd6f0_u16, 0x11d0_u16, StaticArray[0xb3_u8, 0x86_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x8_u8, 0x33_u8, 0x65_u8])
    def query_interface(this : IDtcLuRecoveryInitiatedByLuWork*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDtcLuRecoveryInitiatedByLuWork*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDtcLuRecoveryInitiatedByLuWork*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def handle_their_xln(this : IDtcLuRecoveryInitiatedByLuWork*, lRecoverySeqNum : Int32, xln : Win32cr::System::DistributedTransactionCoordinator::DtcLu_Xln, pRemoteLogName : UInt8*, cbRemoteLogName : UInt32, pOurLogName : UInt8*, cbOurLogName : UInt32, dwProtocol : UInt32, pResponse : Win32cr::System::DistributedTransactionCoordinator::DtcLu_Xln_Response*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_their_xln.call(this, lRecoverySeqNum, xln, pRemoteLogName, cbRemoteLogName, pOurLogName, cbOurLogName, dwProtocol, pResponse)
    end
    def get_our_log_name_size(this : IDtcLuRecoveryInitiatedByLuWork*, pcbOurLogName : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_our_log_name_size.call(this, pcbOurLogName)
    end
    def get_our_xln(this : IDtcLuRecoveryInitiatedByLuWork*, pXln : Win32cr::System::DistributedTransactionCoordinator::DtcLu_Xln*, pOurLogName : UInt8*, pdwProtocol : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_our_xln.call(this, pXln, pOurLogName, pdwProtocol)
    end
    def handle_confirmation_of_our_xln(this : IDtcLuRecoveryInitiatedByLuWork*, confirmation : Win32cr::System::DistributedTransactionCoordinator::DtcLu_Xln_Confirmation) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_confirmation_of_our_xln.call(this, confirmation)
    end
    def handle_their_compare_states(this : IDtcLuRecoveryInitiatedByLuWork*, pRemoteTransId : UInt8*, cbRemoteTransId : UInt32, compare_state : Win32cr::System::DistributedTransactionCoordinator::DtcLu_CompareState, pResponse : Win32cr::System::DistributedTransactionCoordinator::DtcLu_CompareStates_Response*, pCompareState : Win32cr::System::DistributedTransactionCoordinator::DtcLu_CompareState*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_their_compare_states.call(this, pRemoteTransId, cbRemoteTransId, compare_state, pResponse, pCompareState)
    end
    def handle_confirmation_of_our_compare_states(this : IDtcLuRecoveryInitiatedByLuWork*, confirmation : Win32cr::System::DistributedTransactionCoordinator::DtcLu_CompareStates_Confirmation) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_confirmation_of_our_compare_states.call(this, confirmation)
    end
    def handle_error_from_our_compare_states(this : IDtcLuRecoveryInitiatedByLuWork*, error : Win32cr::System::DistributedTransactionCoordinator::DtcLu_CompareStates_Error) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_error_from_our_compare_states.call(this, error)
    end
    def conversation_lost(this : IDtcLuRecoveryInitiatedByLuWork*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.conversation_lost.call(this)
    end

  end

  @[Extern]
  record IDtcLuRecoveryInitiatedByLuVtbl,
    query_interface : Proc(IDtcLuRecoveryInitiatedByLu*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDtcLuRecoveryInitiatedByLu*, UInt32),
    release : Proc(IDtcLuRecoveryInitiatedByLu*, UInt32),
    get_object_to_handle_work_from_lu : Proc(IDtcLuRecoveryInitiatedByLu*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4131e768-1aea-11d0-944b-00a0c905416e")]
  record IDtcLuRecoveryInitiatedByLu, lpVtbl : IDtcLuRecoveryInitiatedByLuVtbl* do
    GUID = LibC::GUID.new(0x4131e768_u32, 0x1aea_u16, 0x11d0_u16, StaticArray[0x94_u8, 0x4b_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
    def query_interface(this : IDtcLuRecoveryInitiatedByLu*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDtcLuRecoveryInitiatedByLu*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDtcLuRecoveryInitiatedByLu*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_object_to_handle_work_from_lu(this : IDtcLuRecoveryInitiatedByLu*, ppWork : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_to_handle_work_from_lu.call(this, ppWork)
    end

  end

  @[Extern]
  record IDtcLuRmEnlistmentVtbl,
    query_interface : Proc(IDtcLuRmEnlistment*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDtcLuRmEnlistment*, UInt32),
    release : Proc(IDtcLuRmEnlistment*, UInt32),
    unplug : Proc(IDtcLuRmEnlistment*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    backed_out : Proc(IDtcLuRmEnlistment*, Win32cr::Foundation::HRESULT),
    back_out : Proc(IDtcLuRmEnlistment*, Win32cr::Foundation::HRESULT),
    committed : Proc(IDtcLuRmEnlistment*, Win32cr::Foundation::HRESULT),
    forget : Proc(IDtcLuRmEnlistment*, Win32cr::Foundation::HRESULT),
    request_commit : Proc(IDtcLuRmEnlistment*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4131e769-1aea-11d0-944b-00a0c905416e")]
  record IDtcLuRmEnlistment, lpVtbl : IDtcLuRmEnlistmentVtbl* do
    GUID = LibC::GUID.new(0x4131e769_u32, 0x1aea_u16, 0x11d0_u16, StaticArray[0x94_u8, 0x4b_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
    def query_interface(this : IDtcLuRmEnlistment*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDtcLuRmEnlistment*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDtcLuRmEnlistment*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def unplug(this : IDtcLuRmEnlistment*, fConversationLost : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unplug.call(this, fConversationLost)
    end
    def backed_out(this : IDtcLuRmEnlistment*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.backed_out.call(this)
    end
    def back_out(this : IDtcLuRmEnlistment*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.back_out.call(this)
    end
    def committed(this : IDtcLuRmEnlistment*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.committed.call(this)
    end
    def forget(this : IDtcLuRmEnlistment*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.forget.call(this)
    end
    def request_commit(this : IDtcLuRmEnlistment*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_commit.call(this)
    end

  end

  @[Extern]
  record IDtcLuRmEnlistmentSinkVtbl,
    query_interface : Proc(IDtcLuRmEnlistmentSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDtcLuRmEnlistmentSink*, UInt32),
    release : Proc(IDtcLuRmEnlistmentSink*, UInt32),
    ack_unplug : Proc(IDtcLuRmEnlistmentSink*, Win32cr::Foundation::HRESULT),
    tm_down : Proc(IDtcLuRmEnlistmentSink*, Win32cr::Foundation::HRESULT),
    session_lost : Proc(IDtcLuRmEnlistmentSink*, Win32cr::Foundation::HRESULT),
    backed_out : Proc(IDtcLuRmEnlistmentSink*, Win32cr::Foundation::HRESULT),
    back_out : Proc(IDtcLuRmEnlistmentSink*, Win32cr::Foundation::HRESULT),
    committed : Proc(IDtcLuRmEnlistmentSink*, Win32cr::Foundation::HRESULT),
    forget : Proc(IDtcLuRmEnlistmentSink*, Win32cr::Foundation::HRESULT),
    prepare : Proc(IDtcLuRmEnlistmentSink*, Win32cr::Foundation::HRESULT),
    request_commit : Proc(IDtcLuRmEnlistmentSink*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4131e770-1aea-11d0-944b-00a0c905416e")]
  record IDtcLuRmEnlistmentSink, lpVtbl : IDtcLuRmEnlistmentSinkVtbl* do
    GUID = LibC::GUID.new(0x4131e770_u32, 0x1aea_u16, 0x11d0_u16, StaticArray[0x94_u8, 0x4b_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
    def query_interface(this : IDtcLuRmEnlistmentSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDtcLuRmEnlistmentSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDtcLuRmEnlistmentSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def ack_unplug(this : IDtcLuRmEnlistmentSink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.ack_unplug.call(this)
    end
    def tm_down(this : IDtcLuRmEnlistmentSink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tm_down.call(this)
    end
    def session_lost(this : IDtcLuRmEnlistmentSink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.session_lost.call(this)
    end
    def backed_out(this : IDtcLuRmEnlistmentSink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.backed_out.call(this)
    end
    def back_out(this : IDtcLuRmEnlistmentSink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.back_out.call(this)
    end
    def committed(this : IDtcLuRmEnlistmentSink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.committed.call(this)
    end
    def forget(this : IDtcLuRmEnlistmentSink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.forget.call(this)
    end
    def prepare(this : IDtcLuRmEnlistmentSink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.prepare.call(this)
    end
    def request_commit(this : IDtcLuRmEnlistmentSink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_commit.call(this)
    end

  end

  @[Extern]
  record IDtcLuRmEnlistmentFactoryVtbl,
    query_interface : Proc(IDtcLuRmEnlistmentFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDtcLuRmEnlistmentFactory*, UInt32),
    release : Proc(IDtcLuRmEnlistmentFactory*, UInt32),
    create : Proc(IDtcLuRmEnlistmentFactory*, UInt8*, UInt32, Void*, UInt8*, UInt32, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4131e771-1aea-11d0-944b-00a0c905416e")]
  record IDtcLuRmEnlistmentFactory, lpVtbl : IDtcLuRmEnlistmentFactoryVtbl* do
    GUID = LibC::GUID.new(0x4131e771_u32, 0x1aea_u16, 0x11d0_u16, StaticArray[0x94_u8, 0x4b_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
    def query_interface(this : IDtcLuRmEnlistmentFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDtcLuRmEnlistmentFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDtcLuRmEnlistmentFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create(this : IDtcLuRmEnlistmentFactory*, pucLuPair : UInt8*, cbLuPair : UInt32, pITransaction : Void*, pTransId : UInt8*, cbTransId : UInt32, pRmEnlistmentSink : Void*, ppRmEnlistment : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create.call(this, pucLuPair, cbLuPair, pITransaction, pTransId, cbTransId, pRmEnlistmentSink, ppRmEnlistment)
    end

  end

  @[Extern]
  record IDtcLuSubordinateDtcVtbl,
    query_interface : Proc(IDtcLuSubordinateDtc*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDtcLuSubordinateDtc*, UInt32),
    release : Proc(IDtcLuSubordinateDtc*, UInt32),
    unplug : Proc(IDtcLuSubordinateDtc*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    backed_out : Proc(IDtcLuSubordinateDtc*, Win32cr::Foundation::HRESULT),
    back_out : Proc(IDtcLuSubordinateDtc*, Win32cr::Foundation::HRESULT),
    committed : Proc(IDtcLuSubordinateDtc*, Win32cr::Foundation::HRESULT),
    forget : Proc(IDtcLuSubordinateDtc*, Win32cr::Foundation::HRESULT),
    prepare : Proc(IDtcLuSubordinateDtc*, Win32cr::Foundation::HRESULT),
    request_commit : Proc(IDtcLuSubordinateDtc*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4131e773-1aea-11d0-944b-00a0c905416e")]
  record IDtcLuSubordinateDtc, lpVtbl : IDtcLuSubordinateDtcVtbl* do
    GUID = LibC::GUID.new(0x4131e773_u32, 0x1aea_u16, 0x11d0_u16, StaticArray[0x94_u8, 0x4b_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
    def query_interface(this : IDtcLuSubordinateDtc*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDtcLuSubordinateDtc*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDtcLuSubordinateDtc*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def unplug(this : IDtcLuSubordinateDtc*, fConversationLost : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unplug.call(this, fConversationLost)
    end
    def backed_out(this : IDtcLuSubordinateDtc*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.backed_out.call(this)
    end
    def back_out(this : IDtcLuSubordinateDtc*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.back_out.call(this)
    end
    def committed(this : IDtcLuSubordinateDtc*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.committed.call(this)
    end
    def forget(this : IDtcLuSubordinateDtc*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.forget.call(this)
    end
    def prepare(this : IDtcLuSubordinateDtc*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.prepare.call(this)
    end
    def request_commit(this : IDtcLuSubordinateDtc*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_commit.call(this)
    end

  end

  @[Extern]
  record IDtcLuSubordinateDtcSinkVtbl,
    query_interface : Proc(IDtcLuSubordinateDtcSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDtcLuSubordinateDtcSink*, UInt32),
    release : Proc(IDtcLuSubordinateDtcSink*, UInt32),
    ack_unplug : Proc(IDtcLuSubordinateDtcSink*, Win32cr::Foundation::HRESULT),
    tm_down : Proc(IDtcLuSubordinateDtcSink*, Win32cr::Foundation::HRESULT),
    session_lost : Proc(IDtcLuSubordinateDtcSink*, Win32cr::Foundation::HRESULT),
    backed_out : Proc(IDtcLuSubordinateDtcSink*, Win32cr::Foundation::HRESULT),
    back_out : Proc(IDtcLuSubordinateDtcSink*, Win32cr::Foundation::HRESULT),
    committed : Proc(IDtcLuSubordinateDtcSink*, Win32cr::Foundation::HRESULT),
    forget : Proc(IDtcLuSubordinateDtcSink*, Win32cr::Foundation::HRESULT),
    request_commit : Proc(IDtcLuSubordinateDtcSink*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4131e774-1aea-11d0-944b-00a0c905416e")]
  record IDtcLuSubordinateDtcSink, lpVtbl : IDtcLuSubordinateDtcSinkVtbl* do
    GUID = LibC::GUID.new(0x4131e774_u32, 0x1aea_u16, 0x11d0_u16, StaticArray[0x94_u8, 0x4b_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
    def query_interface(this : IDtcLuSubordinateDtcSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDtcLuSubordinateDtcSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDtcLuSubordinateDtcSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def ack_unplug(this : IDtcLuSubordinateDtcSink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.ack_unplug.call(this)
    end
    def tm_down(this : IDtcLuSubordinateDtcSink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tm_down.call(this)
    end
    def session_lost(this : IDtcLuSubordinateDtcSink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.session_lost.call(this)
    end
    def backed_out(this : IDtcLuSubordinateDtcSink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.backed_out.call(this)
    end
    def back_out(this : IDtcLuSubordinateDtcSink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.back_out.call(this)
    end
    def committed(this : IDtcLuSubordinateDtcSink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.committed.call(this)
    end
    def forget(this : IDtcLuSubordinateDtcSink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.forget.call(this)
    end
    def request_commit(this : IDtcLuSubordinateDtcSink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_commit.call(this)
    end

  end

  @[Extern]
  record IDtcLuSubordinateDtcFactoryVtbl,
    query_interface : Proc(IDtcLuSubordinateDtcFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDtcLuSubordinateDtcFactory*, UInt32),
    release : Proc(IDtcLuSubordinateDtcFactory*, UInt32),
    create : Proc(IDtcLuSubordinateDtcFactory*, UInt8*, UInt32, Void*, Int32, UInt32, Void*, Void**, UInt8*, UInt32, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4131e775-1aea-11d0-944b-00a0c905416e")]
  record IDtcLuSubordinateDtcFactory, lpVtbl : IDtcLuSubordinateDtcFactoryVtbl* do
    GUID = LibC::GUID.new(0x4131e775_u32, 0x1aea_u16, 0x11d0_u16, StaticArray[0x94_u8, 0x4b_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x5_u8, 0x41_u8, 0x6e_u8])
    def query_interface(this : IDtcLuSubordinateDtcFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDtcLuSubordinateDtcFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDtcLuSubordinateDtcFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create(this : IDtcLuSubordinateDtcFactory*, pucLuPair : UInt8*, cbLuPair : UInt32, punkTransactionOuter : Void*, isoLevel : Int32, isoFlags : UInt32, pOptions : Void*, ppTransaction : Void**, pTransId : UInt8*, cbTransId : UInt32, pSubordinateDtcSink : Void*, ppSubordinateDtc : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create.call(this, pucLuPair, cbLuPair, punkTransactionOuter, isoLevel, isoFlags, pOptions, ppTransaction, pTransId, cbTransId, pSubordinateDtcSink, ppSubordinateDtc)
    end

  end

  @[Link("xolehlp")]
  lib C
    fun DtcGetTransactionManager(i_pszHost : Win32cr::Foundation::PSTR, i_pszTmName : Win32cr::Foundation::PSTR, i_riid : LibC::GUID*, i_dwReserved1 : UInt32, i_wcbReserved2 : UInt16, i_pvReserved2 : Void*, o_ppvObject : Void**) : Win32cr::Foundation::HRESULT

    fun DtcGetTransactionManagerC(i_pszHost : Win32cr::Foundation::PSTR, i_pszTmName : Win32cr::Foundation::PSTR, i_riid : LibC::GUID*, i_dwReserved1 : UInt32, i_wcbReserved2 : UInt16, i_pvReserved2 : Void*, o_ppvObject : Void**) : Win32cr::Foundation::HRESULT

    fun DtcGetTransactionManagerExA(i_pszHost : Win32cr::Foundation::PSTR, i_pszTmName : Win32cr::Foundation::PSTR, i_riid : LibC::GUID*, i_grfOptions : UInt32, i_pvConfigParams : Void*, o_ppvObject : Void**) : Win32cr::Foundation::HRESULT

    fun DtcGetTransactionManagerExW(i_pwszHost : Win32cr::Foundation::PWSTR, i_pwszTmName : Win32cr::Foundation::PWSTR, i_riid : LibC::GUID*, i_grfOptions : UInt32, i_pvConfigParams : Void*, o_ppvObject : Void**) : Win32cr::Foundation::HRESULT

  end
end