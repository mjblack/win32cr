require "./../foundation.cr"
require "./diagnostics/debug.cr"

module Win32cr::System::Kernel
  extend self
  alias EXCEPTION_ROUTINE = Proc(Win32cr::System::Diagnostics::Debug::EXCEPTION_RECORD*, Void*, Win32cr::System::Diagnostics::Debug::CONTEXT*, Void*, Win32cr::System::Kernel::EXCEPTION_DISPOSITION)

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
  struct SLIST_ENTRY
    property next__ : Win32cr::System::Kernel::SLIST_ENTRY*
    def initialize(@next__ : Win32cr::System::Kernel::SLIST_ENTRY*)
    end
  end

  {% if flag?(:arm) %}
  @[Extern(union: true)]
  struct SLIST_HEADER
    property anonymous : Anonymous_e__Struct_
    property header_arm64 : HeaderArm64_e__Struct_

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property alignment : UInt64
    property region : UInt64
    def initialize(@alignment : UInt64, @region : UInt64)
    end
    end


    # Nested Type HeaderArm64_e__Struct_
    @[Extern]
    struct HeaderArm64_e__Struct_
    property _bitfield1 : UInt64
    property _bitfield2 : UInt64
    def initialize(@_bitfield1 : UInt64, @_bitfield2 : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @header_arm64 : HeaderArm64_e__Struct_)
    end
  end
  {% end %}

  @[Extern]
  struct QUAD
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property use_this_field_to_copy : Int64
    property do_not_use_this_field : Float64
    def initialize(@use_this_field_to_copy : Int64, @do_not_use_this_field : Float64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct PROCESSOR_NUMBER
    property group : UInt16
    property number : UInt8
    property reserved : UInt8
    def initialize(@group : UInt16, @number : UInt8, @reserved : UInt8)
    end
  end

  @[Extern]
  struct STRING
    property length : UInt16
    property maximum_length : UInt16
    property buffer : Win32cr::Foundation::PSTR
    def initialize(@length : UInt16, @maximum_length : UInt16, @buffer : Win32cr::Foundation::PSTR)
    end
  end

  @[Extern]
  struct CSTRING
    property length : UInt16
    property maximum_length : UInt16
    property buffer : Win32cr::Foundation::PSTR
    def initialize(@length : UInt16, @maximum_length : UInt16, @buffer : Win32cr::Foundation::PSTR)
    end
  end

  @[Extern]
  struct LIST_ENTRY
    property flink : Win32cr::System::Kernel::LIST_ENTRY*
    property blink : Win32cr::System::Kernel::LIST_ENTRY*
    def initialize(@flink : Win32cr::System::Kernel::LIST_ENTRY*, @blink : Win32cr::System::Kernel::LIST_ENTRY*)
    end
  end

  @[Extern]
  struct SINGLE_LIST_ENTRY
    property next__ : Win32cr::System::Kernel::SINGLE_LIST_ENTRY*
    def initialize(@next__ : Win32cr::System::Kernel::SINGLE_LIST_ENTRY*)
    end
  end

  @[Extern]
  struct RTL_BALANCED_NODE
    property anonymous1 : Anonymous1_e__Union_
    property anonymous2 : Anonymous2_e__Union_

    # Nested Type Anonymous2_e__Union_
    @[Extern(union: true)]
    struct Anonymous2_e__Union_
    property _bitfield : UInt8
    property parent_value : LibC::UIntPtrT
    def initialize(@_bitfield : UInt8, @parent_value : LibC::UIntPtrT)
    end
    end


    # Nested Type Anonymous1_e__Union_
    @[Extern(union: true)]
    struct Anonymous1_e__Union_
    property children : Win32cr::System::Kernel::RTL_BALANCED_NODE*[2]
    property anonymous : Anonymous_e__Struct_

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property left : Win32cr::System::Kernel::RTL_BALANCED_NODE*
    property right : Win32cr::System::Kernel::RTL_BALANCED_NODE*
    def initialize(@left : Win32cr::System::Kernel::RTL_BALANCED_NODE*, @right : Win32cr::System::Kernel::RTL_BALANCED_NODE*)
    end
      end

    def initialize(@children : Win32cr::System::Kernel::RTL_BALANCED_NODE*[2], @anonymous : Anonymous_e__Struct_)
    end
    end

    def initialize(@anonymous1 : Anonymous1_e__Union_, @anonymous2 : Anonymous2_e__Union_)
    end
  end

  @[Extern]
  struct LIST_ENTRY32
    property flink : UInt32
    property blink : UInt32
    def initialize(@flink : UInt32, @blink : UInt32)
    end
  end

  @[Extern]
  struct LIST_ENTRY64
    property flink : UInt64
    property blink : UInt64
    def initialize(@flink : UInt64, @blink : UInt64)
    end
  end

  @[Extern]
  struct SINGLE_LIST_ENTRY32
    property next__ : UInt32
    def initialize(@next__ : UInt32)
    end
  end

  @[Extern]
  struct WNF_STATE_NAME
    property data : UInt32[2]
    def initialize(@data : UInt32[2])
    end
  end

  @[Extern]
  struct STRING32
    property length : UInt16
    property maximum_length : UInt16
    property buffer : UInt32
    def initialize(@length : UInt16, @maximum_length : UInt16, @buffer : UInt32)
    end
  end

  @[Extern]
  struct STRING64
    property length : UInt16
    property maximum_length : UInt16
    property buffer : UInt64
    def initialize(@length : UInt16, @maximum_length : UInt16, @buffer : UInt64)
    end
  end

  @[Extern]
  struct OBJECT_ATTRIBUTES64
    property length : UInt32
    property root_directory : UInt64
    property object_name : UInt64
    property attributes : UInt32
    property security_descriptor : UInt64
    property security_quality_of_service : UInt64
    def initialize(@length : UInt32, @root_directory : UInt64, @object_name : UInt64, @attributes : UInt32, @security_descriptor : UInt64, @security_quality_of_service : UInt64)
    end
  end

  @[Extern]
  struct OBJECT_ATTRIBUTES32
    property length : UInt32
    property root_directory : UInt32
    property object_name : UInt32
    property attributes : UInt32
    property security_descriptor : UInt32
    property security_quality_of_service : UInt32
    def initialize(@length : UInt32, @root_directory : UInt32, @object_name : UInt32, @attributes : UInt32, @security_descriptor : UInt32, @security_quality_of_service : UInt32)
    end
  end

  @[Extern]
  struct OBJECTID
    property lineage : LibC::GUID
    property uniquifier : UInt32
    def initialize(@lineage : LibC::GUID, @uniquifier : UInt32)
    end
  end

  @[Extern]
  struct EXCEPTION_REGISTRATION_RECORD
    property next__ : Win32cr::System::Kernel::EXCEPTION_REGISTRATION_RECORD*
    property handler : Win32cr::System::Kernel::EXCEPTION_ROUTINE
    def initialize(@next__ : Win32cr::System::Kernel::EXCEPTION_REGISTRATION_RECORD*, @handler : Win32cr::System::Kernel::EXCEPTION_ROUTINE)
    end
  end

  @[Extern]
  struct NT_TIB
    property exception_list : Win32cr::System::Kernel::EXCEPTION_REGISTRATION_RECORD*
    property stack_base : Void*
    property stack_limit : Void*
    property sub_system_tib : Void*
    property anonymous : Anonymous_e__Union_
    property arbitrary_user_pointer : Void*
    property self__ : Win32cr::System::Kernel::NT_TIB*

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property fiber_data : Void*
    property version : UInt32
    def initialize(@fiber_data : Void*, @version : UInt32)
    end
    end

    def initialize(@exception_list : Win32cr::System::Kernel::EXCEPTION_REGISTRATION_RECORD*, @stack_base : Void*, @stack_limit : Void*, @sub_system_tib : Void*, @anonymous : Anonymous_e__Union_, @arbitrary_user_pointer : Void*, @self__ : Win32cr::System::Kernel::NT_TIB*)
    end
  end

  {% if flag?(:x86_64) %}
  @[Extern(union: true)]
  struct SLIST_HEADER
    property anonymous : Anonymous_e__Struct_
    property header_x64 : HeaderX64_e__Struct_

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property alignment : UInt64
    property region : UInt64
    def initialize(@alignment : UInt64, @region : UInt64)
    end
    end


    # Nested Type HeaderX64_e__Struct_
    @[Extern]
    struct HeaderX64_e__Struct_
    property _bitfield1 : UInt64
    property _bitfield2 : UInt64
    def initialize(@_bitfield1 : UInt64, @_bitfield2 : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @header_x64 : HeaderX64_e__Struct_)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct FLOATING_SAVE_AREA
    property control_word : UInt32
    property status_word : UInt32
    property tag_word : UInt32
    property error_offset : UInt32
    property error_selector : UInt32
    property data_offset : UInt32
    property data_selector : UInt32
    property register_area : UInt8[80]
    property cr0_npx_state : UInt32
    def initialize(@control_word : UInt32, @status_word : UInt32, @tag_word : UInt32, @error_offset : UInt32, @error_selector : UInt32, @data_offset : UInt32, @data_selector : UInt32, @register_area : UInt8[80], @cr0_npx_state : UInt32)
    end
  end
  {% end %}

  {% if flag?(:i386) %}
  @[Extern]
  struct FLOATING_SAVE_AREA
    property control_word : UInt32
    property status_word : UInt32
    property tag_word : UInt32
    property error_offset : UInt32
    property error_selector : UInt32
    property data_offset : UInt32
    property data_selector : UInt32
    property register_area : UInt8[80]
    property spare0 : UInt32
    def initialize(@control_word : UInt32, @status_word : UInt32, @tag_word : UInt32, @error_offset : UInt32, @error_selector : UInt32, @data_offset : UInt32, @data_selector : UInt32, @register_area : UInt8[80], @spare0 : UInt32)
    end
  end
  {% end %}

  {% if flag?(:i386) %}
  @[Extern(union: true)]
  struct SLIST_HEADER
    property alignment : UInt64
    property anonymous : Anonymous_e__Struct_

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property next__ : Win32cr::System::Kernel::SINGLE_LIST_ENTRY
    property depth : UInt16
    property cpu_id : UInt16
    def initialize(@next__ : Win32cr::System::Kernel::SINGLE_LIST_ENTRY, @depth : UInt16, @cpu_id : UInt16)
    end
    end

    def initialize(@alignment : UInt64, @anonymous : Anonymous_e__Struct_)
    end
  end
  {% end %}

  def rtlInitializeSListHead(list_head : Win32cr::System::Kernel::SLIST_HEADER*) : Void
    C.RtlInitializeSListHead(list_head)
  end

  def rtlFirstEntrySList(list_head : Win32cr::System::Kernel::SLIST_HEADER*) : Win32cr::System::Kernel::SLIST_ENTRY*
    C.RtlFirstEntrySList(list_head)
  end

  def rtlInterlockedPopEntrySList(list_head : Win32cr::System::Kernel::SLIST_HEADER*) : Win32cr::System::Kernel::SLIST_ENTRY*
    C.RtlInterlockedPopEntrySList(list_head)
  end

  def rtlInterlockedPushEntrySList(list_head : Win32cr::System::Kernel::SLIST_HEADER*, list_entry : Win32cr::System::Kernel::SLIST_ENTRY*) : Win32cr::System::Kernel::SLIST_ENTRY*
    C.RtlInterlockedPushEntrySList(list_head, list_entry)
  end

  def rtlInterlockedPushListSListEx(list_head : Win32cr::System::Kernel::SLIST_HEADER*, list : Win32cr::System::Kernel::SLIST_ENTRY*, list_end : Win32cr::System::Kernel::SLIST_ENTRY*, count : UInt32) : Win32cr::System::Kernel::SLIST_ENTRY*
    C.RtlInterlockedPushListSListEx(list_head, list, list_end, count)
  end

  def rtlInterlockedFlushSList(list_head : Win32cr::System::Kernel::SLIST_HEADER*) : Win32cr::System::Kernel::SLIST_ENTRY*
    C.RtlInterlockedFlushSList(list_head)
  end

  def rtlQueryDepthSList(list_head : Win32cr::System::Kernel::SLIST_HEADER*) : UInt16
    C.RtlQueryDepthSList(list_head)
  end

  @[Link("ntdll")]
  lib C
    # :nodoc:
    fun RtlInitializeSListHead(list_head : Win32cr::System::Kernel::SLIST_HEADER*) : Void

    # :nodoc:
    fun RtlFirstEntrySList(list_head : Win32cr::System::Kernel::SLIST_HEADER*) : Win32cr::System::Kernel::SLIST_ENTRY*

    # :nodoc:
    fun RtlInterlockedPopEntrySList(list_head : Win32cr::System::Kernel::SLIST_HEADER*) : Win32cr::System::Kernel::SLIST_ENTRY*

    # :nodoc:
    fun RtlInterlockedPushEntrySList(list_head : Win32cr::System::Kernel::SLIST_HEADER*, list_entry : Win32cr::System::Kernel::SLIST_ENTRY*) : Win32cr::System::Kernel::SLIST_ENTRY*

    # :nodoc:
    fun RtlInterlockedPushListSListEx(list_head : Win32cr::System::Kernel::SLIST_HEADER*, list : Win32cr::System::Kernel::SLIST_ENTRY*, list_end : Win32cr::System::Kernel::SLIST_ENTRY*, count : UInt32) : Win32cr::System::Kernel::SLIST_ENTRY*

    # :nodoc:
    fun RtlInterlockedFlushSList(list_head : Win32cr::System::Kernel::SLIST_HEADER*) : Win32cr::System::Kernel::SLIST_ENTRY*

    # :nodoc:
    fun RtlQueryDepthSList(list_head : Win32cr::System::Kernel::SLIST_HEADER*) : UInt16

  end
end