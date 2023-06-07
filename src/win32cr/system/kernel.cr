require "../foundation.cr"
require "../system/diagnostics/debug.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
{% else %}
{% end %}
lib LibWin32
  OBJ_HANDLE_TAGBITS = 3_i32
  RTL_BALANCED_NODE_RESERVED_PARENT_MASK = 3_u32
  OBJ_INHERIT = 2_i32
  OBJ_PERMANENT = 16_i32
  OBJ_EXCLUSIVE = 32_i32
  OBJ_CASE_INSENSITIVE = 64_i32
  OBJ_OPENIF = 128_i32
  OBJ_OPENLINK = 256_i32
  OBJ_KERNEL_HANDLE = 512_i32
  OBJ_FORCE_ACCESS_CHECK = 1024_i32
  OBJ_IGNORE_IMPERSONATED_DEVICEMAP = 2048_i32
  OBJ_DONT_REPARSE = 4096_i32
  OBJ_VALID_ATTRIBUTES = 8178_i32
  NULL64 = 0_u32
  MAXUCHAR = 255_u32
  MAXUSHORT = 65535_u32
  MAXULONG = 4294967295_u32

  alias EXCEPTION_ROUTINE = Proc(EXCEPTION_RECORD*, Void*, CONTEXT*, Void*, EXCEPTION_DISPOSITION)


  enum EXCEPTION_DISPOSITION : Int32
    ExceptionContinueExecution = 0
    ExceptionContinueSearch = 1
    ExceptionNestedException = 2
    ExceptionCollidedUnwind = 3
  end

  enum EVENT_TYPE : Int32
    NotificationEvent = 0
    SynchronizationEvent = 1
  end

  enum TIMER_TYPE : Int32
    NotificationTimer = 0
    SynchronizationTimer = 1
  end

  enum WAIT_TYPE : Int32
    WaitAll = 0
    WaitAny = 1
    WaitNotification = 2
    WaitDequeue = 3
    WaitDpc = 4
  end

  enum NT_PRODUCT_TYPE : Int32
    NtProductWinNt = 1
    NtProductLanManNt = 2
    NtProductServer = 3
  end

  enum SUITE_TYPE : Int32
    SmallBusiness = 0
    Enterprise = 1
    BackOffice = 2
    CommunicationServer = 3
    TerminalServer = 4
    SmallBusinessRestricted = 5
    EmbeddedNT = 6
    DataCenter = 7
    SingleUserTS = 8
    Personal = 9
    Blade = 10
    EmbeddedRestricted = 11
    SecurityAppliance = 12
    StorageServer = 13
    ComputeServer = 14
    WHServer = 15
    PhoneNT = 16
    MultiUserTS = 17
    MaxSuiteType = 18
  end

  enum COMPARTMENT_ID : Int32
    UNSPECIFIED_COMPARTMENT_ID = 0
    DEFAULT_COMPARTMENT_ID = 1
  end

  union QUAD_Anonymous_e__Union
    use_this_field_to_copy : Int64
    do_not_use_this_field : Float64
  end
  union RTL_BALANCED_NODE_Anonymous2_e__Union
    _bitfield : UInt8
    parent_value : LibC::UINT_PTR
  end
  union RTL_BALANCED_NODE_Anonymous1_e__Union
    children : RTL_BALANCED_NODE[2]**
    anonymous : RTL_BALANCED_NODE_Anonymous1_e__Union_Anonymous_e__Struct
  end
  union NT_TIB_Anonymous_e__Union
    fiber_data : Void*
    version : UInt32
  end
  union SLIST_HEADER
    anonymous : SLIST_HEADER_Anonymous_e__Struct
    header_x64 : SLIST_HEADER_HeaderX64_e__Struct
  end

  struct SLIST_ENTRY
    next : SLIST_ENTRY*
  end
  struct QUAD
    anonymous : QUAD_Anonymous_e__Union
  end
  struct PROCESSOR_NUMBER
    group : UInt16
    number : UInt8
    reserved : UInt8
  end
  struct STRING
    length : UInt16
    maximum_length : UInt16
    buffer : PSTR
  end
  struct CSTRING
    length : UInt16
    maximum_length : UInt16
    buffer : PSTR
  end
  struct LIST_ENTRY
    flink : LIST_ENTRY*
    blink : LIST_ENTRY*
  end
  struct SINGLE_LIST_ENTRY
    next : SINGLE_LIST_ENTRY*
  end
  struct RTL_BALANCED_NODE
    anonymous1 : RTL_BALANCED_NODE_Anonymous1_e__Union
    anonymous2 : RTL_BALANCED_NODE_Anonymous2_e__Union
  end
  struct RTL_BALANCED_NODE_Anonymous1_e__Union_Anonymous_e__Struct
    left : RTL_BALANCED_NODE*
    right : RTL_BALANCED_NODE*
  end
  struct LIST_ENTRY32
    flink : UInt32
    blink : UInt32
  end
  struct LIST_ENTRY64
    flink : UInt64
    blink : UInt64
  end
  struct SINGLE_LIST_ENTRY32
    next : UInt32
  end
  struct WNF_STATE_NAME
    data : UInt32[2]*
  end
  struct STRING32
    length : UInt16
    maximum_length : UInt16
    buffer : UInt32
  end
  struct STRING64
    length : UInt16
    maximum_length : UInt16
    buffer : UInt64
  end
  struct OBJECT_ATTRIBUTES64
    length : UInt32
    root_directory : UInt64
    object_name : UInt64
    attributes : UInt32
    security_descriptor : UInt64
    security_quality_of_service : UInt64
  end
  struct OBJECT_ATTRIBUTES32
    length : UInt32
    root_directory : UInt32
    object_name : UInt32
    attributes : UInt32
    security_descriptor : UInt32
    security_quality_of_service : UInt32
  end
  struct OBJECTID
    lineage : Guid
    uniquifier : UInt32
  end
  struct EXCEPTION_REGISTRATION_RECORD
    next : EXCEPTION_REGISTRATION_RECORD*
    handler : EXCEPTION_ROUTINE
  end
  struct NT_TIB
    exception_list : EXCEPTION_REGISTRATION_RECORD*
    stack_base : Void*
    stack_limit : Void*
    sub_system_tib : Void*
    anonymous : NT_TIB_Anonymous_e__Union
    arbitrary_user_pointer : Void*
    self : NT_TIB*
  end
  struct SLIST_HEADER_Anonymous_e__Struct
    alignment : UInt64
    region : UInt64
  end
  struct SLIST_HEADER_HeaderX64_e__Struct
    _bitfield1 : UInt64
    _bitfield2 : UInt64
  end
  struct FLOATING_SAVE_AREA
    control_word : UInt32
    status_word : UInt32
    tag_word : UInt32
    error_offset : UInt32
    error_selector : UInt32
    data_offset : UInt32
    data_selector : UInt32
    register_area : UInt8[80]*
    cr0_npx_state : UInt32
  end


  # Params # listhead : SLIST_HEADER* [In]
  fun RtlInitializeSListHead(listhead : SLIST_HEADER*)

  # Params # listhead : SLIST_HEADER* [In]
  fun RtlFirstEntrySList(listhead : SLIST_HEADER*) : SLIST_ENTRY*

  # Params # listhead : SLIST_HEADER* [In]
  fun RtlInterlockedPopEntrySList(listhead : SLIST_HEADER*) : SLIST_ENTRY*

  # Params # listhead : SLIST_HEADER* [In],listentry : SLIST_ENTRY* [In]
  fun RtlInterlockedPushEntrySList(listhead : SLIST_HEADER*, listentry : SLIST_ENTRY*) : SLIST_ENTRY*

  # Params # listhead : SLIST_HEADER* [In],list : SLIST_ENTRY* [In],listend : SLIST_ENTRY* [In],count : UInt32 [In]
  fun RtlInterlockedPushListSListEx(listhead : SLIST_HEADER*, list : SLIST_ENTRY*, listend : SLIST_ENTRY*, count : UInt32) : SLIST_ENTRY*

  # Params # listhead : SLIST_HEADER* [In]
  fun RtlInterlockedFlushSList(listhead : SLIST_HEADER*) : SLIST_ENTRY*

  # Params # listhead : SLIST_HEADER* [In]
  fun RtlQueryDepthSList(listhead : SLIST_HEADER*) : UInt16
end
