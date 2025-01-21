require "./../foundation.cr"
require "./diagnostics/debug.cr"

module Win32cr::System::Kernel
  alias EXCEPTION_ROUTINE = Proc(Win32cr::System::Diagnostics::Debug::EXCEPTION_RECORD*, Void*, Win32cr::System::Diagnostics::Debug::CONTEXT*, Void*, Win32cr::System::Kernel::EXCEPTION_DISPOSITION)*

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

  enum EXCEPTION_DISPOSITION
    ExceptionContinueExecution = 0_i32
    ExceptionContinueSearch = 1_i32
    ExceptionNestedException = 2_i32
    ExceptionCollidedUnwind = 3_i32
  end
  enum EVENT_TYPE
    NotificationEvent = 0_i32
    SynchronizationEvent = 1_i32
  end
  enum TIMER_TYPE
    NotificationTimer = 0_i32
    SynchronizationTimer = 1_i32
  end
  enum WAIT_TYPE
    WaitAll = 0_i32
    WaitAny = 1_i32
    WaitNotification = 2_i32
    WaitDequeue = 3_i32
    WaitDpc = 4_i32
  end
  enum NT_PRODUCT_TYPE
    NtProductWinNt = 1_i32
    NtProductLanManNt = 2_i32
    NtProductServer = 3_i32
  end
  enum SUITE_TYPE
    SmallBusiness = 0_i32
    Enterprise = 1_i32
    BackOffice = 2_i32
    CommunicationServer = 3_i32
    TerminalServer = 4_i32
    SmallBusinessRestricted = 5_i32
    EmbeddedNT = 6_i32
    DataCenter = 7_i32
    SingleUserTS = 8_i32
    Personal = 9_i32
    Blade = 10_i32
    EmbeddedRestricted = 11_i32
    SecurityAppliance = 12_i32
    StorageServer = 13_i32
    ComputeServer = 14_i32
    WHServer = 15_i32
    PhoneNT = 16_i32
    MultiUserTS = 17_i32
    MaxSuiteType = 18_i32
  end
  enum COMPARTMENT_ID
    UNSPECIFIED_COMPARTMENT_ID = 0_i32
    DEFAULT_COMPARTMENT_ID = 1_i32
  end

  @[Extern]
  record SLIST_ENTRY,
    next__ : Win32cr::System::Kernel::SLIST_ENTRY*

  {% if flag?(:arm) %}
  @[Extern(union: true)]
  record SLIST_HEADER,
    anonymous : Anonymous_e__Struct_,
    header_arm64 : HeaderArm64_e__Struct_ do

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    record Anonymous_e__Struct_,
      alignment : UInt64,
      region : UInt64


    # Nested Type HeaderArm64_e__Struct_
    @[Extern]
    record HeaderArm64_e__Struct_,
      _bitfield1 : UInt64,
      _bitfield2 : UInt64

  end
  {% end %}

  @[Extern]
  record QUAD,
    anonymous : Anonymous_e__Union_ do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      use_this_field_to_copy : Int64,
      do_not_use_this_field : Float64

  end

  @[Extern]
  record PROCESSOR_NUMBER,
    group : UInt16,
    number : UInt8,
    reserved : UInt8

  @[Extern]
  record STRING,
    length : UInt16,
    maximum_length : UInt16,
    buffer : Win32cr::Foundation::PSTR

  @[Extern]
  record CSTRING,
    length : UInt16,
    maximum_length : UInt16,
    buffer : Win32cr::Foundation::PSTR

  @[Extern]
  record LIST_ENTRY,
    flink : Win32cr::System::Kernel::LIST_ENTRY*,
    blink : Win32cr::System::Kernel::LIST_ENTRY*

  @[Extern]
  record SINGLE_LIST_ENTRY,
    next__ : Win32cr::System::Kernel::SINGLE_LIST_ENTRY*

  @[Extern]
  record RTL_BALANCED_NODE,
    anonymous1 : Anonymous1_e__Union_,
    anonymous2 : Anonymous2_e__Union_ do

    # Nested Type Anonymous2_e__Union_
    @[Extern(union: true)]
    record Anonymous2_e__Union_,
      _bitfield : UInt8,
      parent_value : LibC::UIntPtrT


    # Nested Type Anonymous1_e__Union_
    @[Extern(union: true)]
    record Anonymous1_e__Union_,
      children : Win32cr::System::Kernel::RTL_BALANCED_NODE*[2],
      anonymous : Anonymous_e__Struct_ do

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      record Anonymous_e__Struct_,
        left : Win32cr::System::Kernel::RTL_BALANCED_NODE*,
        right : Win32cr::System::Kernel::RTL_BALANCED_NODE*

    end

  end

  @[Extern]
  record LIST_ENTRY32,
    flink : UInt32,
    blink : UInt32

  @[Extern]
  record LIST_ENTRY64,
    flink : UInt64,
    blink : UInt64

  @[Extern]
  record SINGLE_LIST_ENTRY32,
    next__ : UInt32

  @[Extern]
  record WNF_STATE_NAME,
    data : UInt32[2]

  @[Extern]
  record STRING32,
    length : UInt16,
    maximum_length : UInt16,
    buffer : UInt32

  @[Extern]
  record STRING64,
    length : UInt16,
    maximum_length : UInt16,
    buffer : UInt64

  @[Extern]
  record OBJECT_ATTRIBUTES64,
    length : UInt32,
    root_directory : UInt64,
    object_name : UInt64,
    attributes : UInt32,
    security_descriptor : UInt64,
    security_quality_of_service : UInt64

  @[Extern]
  record OBJECT_ATTRIBUTES32,
    length : UInt32,
    root_directory : UInt32,
    object_name : UInt32,
    attributes : UInt32,
    security_descriptor : UInt32,
    security_quality_of_service : UInt32

  @[Extern]
  record OBJECTID,
    lineage : LibC::GUID,
    uniquifier : UInt32

  @[Extern]
  record EXCEPTION_REGISTRATION_RECORD,
    next__ : Win32cr::System::Kernel::EXCEPTION_REGISTRATION_RECORD*,
    handler : Win32cr::System::Kernel::EXCEPTION_ROUTINE

  @[Extern]
  record NT_TIB,
    exception_list : Win32cr::System::Kernel::EXCEPTION_REGISTRATION_RECORD*,
    stack_base : Void*,
    stack_limit : Void*,
    sub_system_tib : Void*,
    anonymous : Anonymous_e__Union_,
    arbitrary_user_pointer : Void*,
    self__ : Win32cr::System::Kernel::NT_TIB* do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      fiber_data : Void*,
      version : UInt32

  end

  {% if flag?(:x86_64) %}
  @[Extern(union: true)]
  record SLIST_HEADER,
    anonymous : Anonymous_e__Struct_,
    header_x64 : HeaderX64_e__Struct_ do

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    record Anonymous_e__Struct_,
      alignment : UInt64,
      region : UInt64


    # Nested Type HeaderX64_e__Struct_
    @[Extern]
    record HeaderX64_e__Struct_,
      _bitfield1 : UInt64,
      _bitfield2 : UInt64

  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  record FLOATING_SAVE_AREA,
    control_word : UInt32,
    status_word : UInt32,
    tag_word : UInt32,
    error_offset : UInt32,
    error_selector : UInt32,
    data_offset : UInt32,
    data_selector : UInt32,
    register_area : UInt8[80],
    cr0_npx_state : UInt32
  {% end %}

  {% if flag?(:i386) %}
  @[Extern]
  record FLOATING_SAVE_AREA,
    control_word : UInt32,
    status_word : UInt32,
    tag_word : UInt32,
    error_offset : UInt32,
    error_selector : UInt32,
    data_offset : UInt32,
    data_selector : UInt32,
    register_area : UInt8[80],
    spare0 : UInt32
  {% end %}

  {% if flag?(:i386) %}
  @[Extern(union: true)]
  record SLIST_HEADER,
    alignment : UInt64,
    anonymous : Anonymous_e__Struct_ do

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    record Anonymous_e__Struct_,
      next__ : Win32cr::System::Kernel::SINGLE_LIST_ENTRY,
      depth : UInt16,
      cpu_id : UInt16

  end
  {% end %}

  @[Link("ntdll")]
  lib C
    fun RtlInitializeSListHead(list_head : Win32cr::System::Kernel::SLIST_HEADER*) : Void

    fun RtlFirstEntrySList(list_head : Win32cr::System::Kernel::SLIST_HEADER*) : Win32cr::System::Kernel::SLIST_ENTRY*

    fun RtlInterlockedPopEntrySList(list_head : Win32cr::System::Kernel::SLIST_HEADER*) : Win32cr::System::Kernel::SLIST_ENTRY*

    fun RtlInterlockedPushEntrySList(list_head : Win32cr::System::Kernel::SLIST_HEADER*, list_entry : Win32cr::System::Kernel::SLIST_ENTRY*) : Win32cr::System::Kernel::SLIST_ENTRY*

    fun RtlInterlockedPushListSListEx(list_head : Win32cr::System::Kernel::SLIST_HEADER*, list : Win32cr::System::Kernel::SLIST_ENTRY*, list_end : Win32cr::System::Kernel::SLIST_ENTRY*, count : UInt32) : Win32cr::System::Kernel::SLIST_ENTRY*

    fun RtlInterlockedFlushSList(list_head : Win32cr::System::Kernel::SLIST_HEADER*) : Win32cr::System::Kernel::SLIST_ENTRY*

    fun RtlQueryDepthSList(list_head : Win32cr::System::Kernel::SLIST_HEADER*) : UInt16

  end
end