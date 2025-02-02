require "./../foundation.cr"
require "./threading.cr"
require "./../security.cr"

module Win32cr::System::JobObjects
  extend self

  @[Flags]
  enum JOB_OBJECT_LIMIT : UInt32
    JOB_OBJECT_LIMIT_WORKINGSET = 1_u32
    JOB_OBJECT_LIMIT_PROCESS_TIME = 2_u32
    JOB_OBJECT_LIMIT_JOB_TIME = 4_u32
    JOB_OBJECT_LIMIT_ACTIVE_PROCESS = 8_u32
    JOB_OBJECT_LIMIT_AFFINITY = 16_u32
    JOB_OBJECT_LIMIT_PRIORITY_CLASS = 32_u32
    JOB_OBJECT_LIMIT_PRESERVE_JOB_TIME = 64_u32
    JOB_OBJECT_LIMIT_SCHEDULING_CLASS = 128_u32
    JOB_OBJECT_LIMIT_PROCESS_MEMORY = 256_u32
    JOB_OBJECT_LIMIT_JOB_MEMORY = 512_u32
    JOB_OBJECT_LIMIT_JOB_MEMORY_HIGH = 512_u32
    JOB_OBJECT_LIMIT_DIE_ON_UNHANDLED_EXCEPTION = 1024_u32
    JOB_OBJECT_LIMIT_BREAKAWAY_OK = 2048_u32
    JOB_OBJECT_LIMIT_SILENT_BREAKAWAY_OK = 4096_u32
    JOB_OBJECT_LIMIT_KILL_ON_JOB_CLOSE = 8192_u32
    JOB_OBJECT_LIMIT_SUBSET_AFFINITY = 16384_u32
    JOB_OBJECT_LIMIT_JOB_MEMORY_LOW = 32768_u32
    JOB_OBJECT_LIMIT_JOB_READ_BYTES = 65536_u32
    JOB_OBJECT_LIMIT_JOB_WRITE_BYTES = 131072_u32
    JOB_OBJECT_LIMIT_RATE_CONTROL = 262144_u32
    JOB_OBJECT_LIMIT_CPU_RATE_CONTROL = 262144_u32
    JOB_OBJECT_LIMIT_IO_RATE_CONTROL = 524288_u32
    JOB_OBJECT_LIMIT_NET_RATE_CONTROL = 1048576_u32
    JOB_OBJECT_LIMIT_VALID_FLAGS = 524287_u32
    JOB_OBJECT_BASIC_LIMIT_VALID_FLAGS = 255_u32
    JOB_OBJECT_EXTENDED_LIMIT_VALID_FLAGS = 32767_u32
    JOB_OBJECT_NOTIFICATION_LIMIT_VALID_FLAGS = 2064900_u32
  end
  @[Flags]
  enum JOB_OBJECT_UILIMIT : UInt32
    JOB_OBJECT_UILIMIT_NONE = 0_u32
    JOB_OBJECT_UILIMIT_HANDLES = 1_u32
    JOB_OBJECT_UILIMIT_READCLIPBOARD = 2_u32
    JOB_OBJECT_UILIMIT_WRITECLIPBOARD = 4_u32
    JOB_OBJECT_UILIMIT_SYSTEMPARAMETERS = 8_u32
    JOB_OBJECT_UILIMIT_DISPLAYSETTINGS = 16_u32
    JOB_OBJECT_UILIMIT_GLOBALATOMS = 32_u32
    JOB_OBJECT_UILIMIT_DESKTOP = 64_u32
    JOB_OBJECT_UILIMIT_EXITWINDOWS = 128_u32
  end
  @[Flags]
  enum JOB_OBJECT_SECURITY : UInt32
    JOB_OBJECT_SECURITY_NO_ADMIN = 1_u32
    JOB_OBJECT_SECURITY_RESTRICTED_TOKEN = 2_u32
    JOB_OBJECT_SECURITY_ONLY_TOKEN = 4_u32
    JOB_OBJECT_SECURITY_FILTER_TOKENS = 8_u32
    JOB_OBJECT_SECURITY_VALID_FLAGS = 15_u32
  end
  @[Flags]
  enum JOB_OBJECT_CPU_RATE_CONTROL : UInt32
    JOB_OBJECT_CPU_RATE_CONTROL_ENABLE = 1_u32
    JOB_OBJECT_CPU_RATE_CONTROL_WEIGHT_BASED = 2_u32
    JOB_OBJECT_CPU_RATE_CONTROL_HARD_CAP = 4_u32
    JOB_OBJECT_CPU_RATE_CONTROL_NOTIFY = 8_u32
    JOB_OBJECT_CPU_RATE_CONTROL_MIN_MAX_RATE = 16_u32
    JOB_OBJECT_CPU_RATE_CONTROL_VALID_FLAGS = 31_u32
  end
  enum JOB_OBJECT_TERMINATE_AT_END_ACTION : UInt32
    JOB_OBJECT_TERMINATE_AT_END_OF_JOB = 0_u32
    JOB_OBJECT_POST_AT_END_OF_JOB = 1_u32
  end
  enum JOBOBJECT_RATE_CONTROL_TOLERANCE
    ToleranceLow = 1_i32
    ToleranceMedium = 2_i32
    ToleranceHigh = 3_i32
  end
  enum JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL
    ToleranceIntervalShort = 1_i32
    ToleranceIntervalMedium = 2_i32
    ToleranceIntervalLong = 3_i32
  end
  @[Flags]
  enum JOB_OBJECT_NET_RATE_CONTROL_FLAGS : UInt32
    JOB_OBJECT_NET_RATE_CONTROL_ENABLE = 1_u32
    JOB_OBJECT_NET_RATE_CONTROL_MAX_BANDWIDTH = 2_u32
    JOB_OBJECT_NET_RATE_CONTROL_DSCP_TAG = 4_u32
    JOB_OBJECT_NET_RATE_CONTROL_VALID_FLAGS = 7_u32
  end
  enum JOB_OBJECT_IO_RATE_CONTROL_FLAGS
    JOB_OBJECT_IO_RATE_CONTROL_ENABLE = 1_i32
    JOB_OBJECT_IO_RATE_CONTROL_STANDALONE_VOLUME = 2_i32
    JOB_OBJECT_IO_RATE_CONTROL_FORCE_UNIT_ACCESS_ALL = 4_i32
    JOB_OBJECT_IO_RATE_CONTROL_FORCE_UNIT_ACCESS_ON_SOFT_CAP = 8_i32
    JOB_OBJECT_IO_RATE_CONTROL_VALID_FLAGS = 15_i32
  end
  enum JOBOBJECT_IO_ATTRIBUTION_CONTROL_FLAGS
    JOBOBJECT_IO_ATTRIBUTION_CONTROL_ENABLE = 1_i32
    JOBOBJECT_IO_ATTRIBUTION_CONTROL_DISABLE = 2_i32
    JOBOBJECT_IO_ATTRIBUTION_CONTROL_VALID_FLAGS = 3_i32
  end
  enum JOBOBJECTINFOCLASS
    JobObjectBasicAccountingInformation = 1_i32
    JobObjectBasicLimitInformation = 2_i32
    JobObjectBasicProcessIdList = 3_i32
    JobObjectBasicUIRestrictions = 4_i32
    JobObjectSecurityLimitInformation = 5_i32
    JobObjectEndOfJobTimeInformation = 6_i32
    JobObjectAssociateCompletionPortInformation = 7_i32
    JobObjectBasicAndIoAccountingInformation = 8_i32
    JobObjectExtendedLimitInformation = 9_i32
    JobObjectJobSetInformation = 10_i32
    JobObjectGroupInformation = 11_i32
    JobObjectNotificationLimitInformation = 12_i32
    JobObjectLimitViolationInformation = 13_i32
    JobObjectGroupInformationEx = 14_i32
    JobObjectCpuRateControlInformation = 15_i32
    JobObjectCompletionFilter = 16_i32
    JobObjectCompletionCounter = 17_i32
    JobObjectReserved1Information = 18_i32
    JobObjectReserved2Information = 19_i32
    JobObjectReserved3Information = 20_i32
    JobObjectReserved4Information = 21_i32
    JobObjectReserved5Information = 22_i32
    JobObjectReserved6Information = 23_i32
    JobObjectReserved7Information = 24_i32
    JobObjectReserved8Information = 25_i32
    JobObjectReserved9Information = 26_i32
    JobObjectReserved10Information = 27_i32
    JobObjectReserved11Information = 28_i32
    JobObjectReserved12Information = 29_i32
    JobObjectReserved13Information = 30_i32
    JobObjectReserved14Information = 31_i32
    JobObjectNetRateControlInformation = 32_i32
    JobObjectNotificationLimitInformation2 = 33_i32
    JobObjectLimitViolationInformation2 = 34_i32
    JobObjectCreateSilo = 35_i32
    JobObjectSiloBasicInformation = 36_i32
    JobObjectReserved15Information = 37_i32
    JobObjectReserved16Information = 38_i32
    JobObjectReserved17Information = 39_i32
    JobObjectReserved18Information = 40_i32
    JobObjectReserved19Information = 41_i32
    JobObjectReserved20Information = 42_i32
    JobObjectReserved21Information = 43_i32
    JobObjectReserved22Information = 44_i32
    JobObjectReserved23Information = 45_i32
    JobObjectReserved24Information = 46_i32
    JobObjectReserved25Information = 47_i32
    MaxJobObjectInfoClass = 48_i32
  end

  @[Extern]
  struct JOBOBJECT_IO_RATE_CONTROL_INFORMATION
    property max_iops : Int64
    property max_bandwidth : Int64
    property reservation_iops : Int64
    property volume_name : Win32cr::Foundation::PWSTR
    property base_io_size : UInt32
    property control_flags : Win32cr::System::JobObjects::JOB_OBJECT_IO_RATE_CONTROL_FLAGS
    def initialize(@max_iops : Int64, @max_bandwidth : Int64, @reservation_iops : Int64, @volume_name : Win32cr::Foundation::PWSTR, @base_io_size : UInt32, @control_flags : Win32cr::System::JobObjects::JOB_OBJECT_IO_RATE_CONTROL_FLAGS)
    end
  end

  @[Extern]
  struct JOB_SET_ARRAY
    property job_handle : Win32cr::Foundation::HANDLE
    property member_level : UInt32
    property flags : UInt32
    def initialize(@job_handle : Win32cr::Foundation::HANDLE, @member_level : UInt32, @flags : UInt32)
    end
  end

  @[Extern]
  struct JOBOBJECT_BASIC_ACCOUNTING_INFORMATION
    property total_user_time : Win32cr::Foundation::LARGE_INTEGER
    property total_kernel_time : Win32cr::Foundation::LARGE_INTEGER
    property this_period_total_user_time : Win32cr::Foundation::LARGE_INTEGER
    property this_period_total_kernel_time : Win32cr::Foundation::LARGE_INTEGER
    property total_page_fault_count : UInt32
    property total_processes : UInt32
    property active_processes : UInt32
    property total_terminated_processes : UInt32
    def initialize(@total_user_time : Win32cr::Foundation::LARGE_INTEGER, @total_kernel_time : Win32cr::Foundation::LARGE_INTEGER, @this_period_total_user_time : Win32cr::Foundation::LARGE_INTEGER, @this_period_total_kernel_time : Win32cr::Foundation::LARGE_INTEGER, @total_page_fault_count : UInt32, @total_processes : UInt32, @active_processes : UInt32, @total_terminated_processes : UInt32)
    end
  end

  @[Extern]
  struct JOBOBJECT_BASIC_LIMIT_INFORMATION
    property per_process_user_time_limit : Win32cr::Foundation::LARGE_INTEGER
    property per_job_user_time_limit : Win32cr::Foundation::LARGE_INTEGER
    property limit_flags : Win32cr::System::JobObjects::JOB_OBJECT_LIMIT
    property minimum_working_set_size : LibC::UIntPtrT
    property maximum_working_set_size : LibC::UIntPtrT
    property active_process_limit : UInt32
    property affinity : LibC::UIntPtrT
    property priority_class : UInt32
    property scheduling_class : UInt32
    def initialize(@per_process_user_time_limit : Win32cr::Foundation::LARGE_INTEGER, @per_job_user_time_limit : Win32cr::Foundation::LARGE_INTEGER, @limit_flags : Win32cr::System::JobObjects::JOB_OBJECT_LIMIT, @minimum_working_set_size : LibC::UIntPtrT, @maximum_working_set_size : LibC::UIntPtrT, @active_process_limit : UInt32, @affinity : LibC::UIntPtrT, @priority_class : UInt32, @scheduling_class : UInt32)
    end
  end

  @[Extern]
  struct JOBOBJECT_EXTENDED_LIMIT_INFORMATION
    property basic_limit_information : Win32cr::System::JobObjects::JOBOBJECT_BASIC_LIMIT_INFORMATION
    property io_info : Win32cr::System::Threading::IO_COUNTERS
    property process_memory_limit : LibC::UIntPtrT
    property job_memory_limit : LibC::UIntPtrT
    property peak_process_memory_used : LibC::UIntPtrT
    property peak_job_memory_used : LibC::UIntPtrT
    def initialize(@basic_limit_information : Win32cr::System::JobObjects::JOBOBJECT_BASIC_LIMIT_INFORMATION, @io_info : Win32cr::System::Threading::IO_COUNTERS, @process_memory_limit : LibC::UIntPtrT, @job_memory_limit : LibC::UIntPtrT, @peak_process_memory_used : LibC::UIntPtrT, @peak_job_memory_used : LibC::UIntPtrT)
    end
  end

  @[Extern]
  struct JOBOBJECT_BASIC_PROCESS_ID_LIST
    property number_of_assigned_processes : UInt32
    property number_of_process_ids_in_list : UInt32
    property process_id_list : LibC::UIntPtrT*
    def initialize(@number_of_assigned_processes : UInt32, @number_of_process_ids_in_list : UInt32, @process_id_list : LibC::UIntPtrT*)
    end
  end

  @[Extern]
  struct JOBOBJECT_BASIC_UI_RESTRICTIONS
    property ui_restrictions_class : Win32cr::System::JobObjects::JOB_OBJECT_UILIMIT
    def initialize(@ui_restrictions_class : Win32cr::System::JobObjects::JOB_OBJECT_UILIMIT)
    end
  end

  @[Extern]
  struct JOBOBJECT_SECURITY_LIMIT_INFORMATION
    property security_limit_flags : Win32cr::System::JobObjects::JOB_OBJECT_SECURITY
    property job_token : Win32cr::Foundation::HANDLE
    property sids_to_disable : Win32cr::Security::TOKEN_GROUPS*
    property privileges_to_delete : Win32cr::Security::TOKEN_PRIVILEGES*
    property restricted_sids : Win32cr::Security::TOKEN_GROUPS*
    def initialize(@security_limit_flags : Win32cr::System::JobObjects::JOB_OBJECT_SECURITY, @job_token : Win32cr::Foundation::HANDLE, @sids_to_disable : Win32cr::Security::TOKEN_GROUPS*, @privileges_to_delete : Win32cr::Security::TOKEN_PRIVILEGES*, @restricted_sids : Win32cr::Security::TOKEN_GROUPS*)
    end
  end

  @[Extern]
  struct JOBOBJECT_END_OF_JOB_TIME_INFORMATION
    property end_of_job_time_action : Win32cr::System::JobObjects::JOB_OBJECT_TERMINATE_AT_END_ACTION
    def initialize(@end_of_job_time_action : Win32cr::System::JobObjects::JOB_OBJECT_TERMINATE_AT_END_ACTION)
    end
  end

  @[Extern]
  struct JOBOBJECT_ASSOCIATE_COMPLETION_PORT
    property completion_key : Void*
    property completion_port : Win32cr::Foundation::HANDLE
    def initialize(@completion_key : Void*, @completion_port : Win32cr::Foundation::HANDLE)
    end
  end

  @[Extern]
  struct JOBOBJECT_BASIC_AND_IO_ACCOUNTING_INFORMATION
    property basic_info : Win32cr::System::JobObjects::JOBOBJECT_BASIC_ACCOUNTING_INFORMATION
    property io_info : Win32cr::System::Threading::IO_COUNTERS
    def initialize(@basic_info : Win32cr::System::JobObjects::JOBOBJECT_BASIC_ACCOUNTING_INFORMATION, @io_info : Win32cr::System::Threading::IO_COUNTERS)
    end
  end

  @[Extern]
  struct JOBOBJECT_JOBSET_INFORMATION
    property member_level : UInt32
    def initialize(@member_level : UInt32)
    end
  end

  @[Extern]
  struct JOBOBJECT_NOTIFICATION_LIMIT_INFORMATION
    property io_read_bytes_limit : UInt64
    property io_write_bytes_limit : UInt64
    property per_job_user_time_limit : Win32cr::Foundation::LARGE_INTEGER
    property job_memory_limit : UInt64
    property rate_control_tolerance : Win32cr::System::JobObjects::JOBOBJECT_RATE_CONTROL_TOLERANCE
    property rate_control_tolerance_interval : Win32cr::System::JobObjects::JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL
    property limit_flags : Win32cr::System::JobObjects::JOB_OBJECT_LIMIT
    def initialize(@io_read_bytes_limit : UInt64, @io_write_bytes_limit : UInt64, @per_job_user_time_limit : Win32cr::Foundation::LARGE_INTEGER, @job_memory_limit : UInt64, @rate_control_tolerance : Win32cr::System::JobObjects::JOBOBJECT_RATE_CONTROL_TOLERANCE, @rate_control_tolerance_interval : Win32cr::System::JobObjects::JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL, @limit_flags : Win32cr::System::JobObjects::JOB_OBJECT_LIMIT)
    end
  end

  @[Extern]
  struct JOBOBJECT_NOTIFICATION_LIMIT_INFORMATION_2
    property io_read_bytes_limit : UInt64
    property io_write_bytes_limit : UInt64
    property per_job_user_time_limit : Win32cr::Foundation::LARGE_INTEGER
    property anonymous1 : Anonymous1_e__Union_
    property anonymous2 : Anonymous2_e__Union_
    property anonymous3 : Anonymous3_e__Union_
    property limit_flags : Win32cr::System::JobObjects::JOB_OBJECT_LIMIT
    property io_rate_control_tolerance : Win32cr::System::JobObjects::JOBOBJECT_RATE_CONTROL_TOLERANCE
    property job_low_memory_limit : UInt64
    property io_rate_control_tolerance_interval : Win32cr::System::JobObjects::JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL
    property net_rate_control_tolerance : Win32cr::System::JobObjects::JOBOBJECT_RATE_CONTROL_TOLERANCE
    property net_rate_control_tolerance_interval : Win32cr::System::JobObjects::JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL

    # Nested Type Anonymous3_e__Union_
    @[Extern(union: true)]
    struct Anonymous3_e__Union_
    property rate_control_tolerance_interval : Win32cr::System::JobObjects::JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL
    property cpu_rate_control_tolerance_interval : Win32cr::System::JobObjects::JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL
    def initialize(@rate_control_tolerance_interval : Win32cr::System::JobObjects::JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL, @cpu_rate_control_tolerance_interval : Win32cr::System::JobObjects::JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL)
    end
    end


    # Nested Type Anonymous1_e__Union_
    @[Extern(union: true)]
    struct Anonymous1_e__Union_
    property job_high_memory_limit : UInt64
    property job_memory_limit : UInt64
    def initialize(@job_high_memory_limit : UInt64, @job_memory_limit : UInt64)
    end
    end


    # Nested Type Anonymous2_e__Union_
    @[Extern(union: true)]
    struct Anonymous2_e__Union_
    property rate_control_tolerance : Win32cr::System::JobObjects::JOBOBJECT_RATE_CONTROL_TOLERANCE
    property cpu_rate_control_tolerance : Win32cr::System::JobObjects::JOBOBJECT_RATE_CONTROL_TOLERANCE
    def initialize(@rate_control_tolerance : Win32cr::System::JobObjects::JOBOBJECT_RATE_CONTROL_TOLERANCE, @cpu_rate_control_tolerance : Win32cr::System::JobObjects::JOBOBJECT_RATE_CONTROL_TOLERANCE)
    end
    end

    def initialize(@io_read_bytes_limit : UInt64, @io_write_bytes_limit : UInt64, @per_job_user_time_limit : Win32cr::Foundation::LARGE_INTEGER, @anonymous1 : Anonymous1_e__Union_, @anonymous2 : Anonymous2_e__Union_, @anonymous3 : Anonymous3_e__Union_, @limit_flags : Win32cr::System::JobObjects::JOB_OBJECT_LIMIT, @io_rate_control_tolerance : Win32cr::System::JobObjects::JOBOBJECT_RATE_CONTROL_TOLERANCE, @job_low_memory_limit : UInt64, @io_rate_control_tolerance_interval : Win32cr::System::JobObjects::JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL, @net_rate_control_tolerance : Win32cr::System::JobObjects::JOBOBJECT_RATE_CONTROL_TOLERANCE, @net_rate_control_tolerance_interval : Win32cr::System::JobObjects::JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL)
    end
  end

  @[Extern]
  struct JOBOBJECT_LIMIT_VIOLATION_INFORMATION
    property limit_flags : Win32cr::System::JobObjects::JOB_OBJECT_LIMIT
    property violation_limit_flags : Win32cr::System::JobObjects::JOB_OBJECT_LIMIT
    property io_read_bytes : UInt64
    property io_read_bytes_limit : UInt64
    property io_write_bytes : UInt64
    property io_write_bytes_limit : UInt64
    property per_job_user_time : Win32cr::Foundation::LARGE_INTEGER
    property per_job_user_time_limit : Win32cr::Foundation::LARGE_INTEGER
    property job_memory : UInt64
    property job_memory_limit : UInt64
    property rate_control_tolerance : Win32cr::System::JobObjects::JOBOBJECT_RATE_CONTROL_TOLERANCE
    property rate_control_tolerance_limit : Win32cr::System::JobObjects::JOBOBJECT_RATE_CONTROL_TOLERANCE
    def initialize(@limit_flags : Win32cr::System::JobObjects::JOB_OBJECT_LIMIT, @violation_limit_flags : Win32cr::System::JobObjects::JOB_OBJECT_LIMIT, @io_read_bytes : UInt64, @io_read_bytes_limit : UInt64, @io_write_bytes : UInt64, @io_write_bytes_limit : UInt64, @per_job_user_time : Win32cr::Foundation::LARGE_INTEGER, @per_job_user_time_limit : Win32cr::Foundation::LARGE_INTEGER, @job_memory : UInt64, @job_memory_limit : UInt64, @rate_control_tolerance : Win32cr::System::JobObjects::JOBOBJECT_RATE_CONTROL_TOLERANCE, @rate_control_tolerance_limit : Win32cr::System::JobObjects::JOBOBJECT_RATE_CONTROL_TOLERANCE)
    end
  end

  @[Extern]
  struct JOBOBJECT_LIMIT_VIOLATION_INFORMATION_2
    property limit_flags : Win32cr::System::JobObjects::JOB_OBJECT_LIMIT
    property violation_limit_flags : Win32cr::System::JobObjects::JOB_OBJECT_LIMIT
    property io_read_bytes : UInt64
    property io_read_bytes_limit : UInt64
    property io_write_bytes : UInt64
    property io_write_bytes_limit : UInt64
    property per_job_user_time : Win32cr::Foundation::LARGE_INTEGER
    property per_job_user_time_limit : Win32cr::Foundation::LARGE_INTEGER
    property job_memory : UInt64
    property anonymous1 : Anonymous1_e__Union_
    property anonymous2 : Anonymous2_e__Union_
    property anonymous3 : Anonymous3_e__Union_
    property job_low_memory_limit : UInt64
    property io_rate_control_tolerance : Win32cr::System::JobObjects::JOBOBJECT_RATE_CONTROL_TOLERANCE
    property io_rate_control_tolerance_limit : Win32cr::System::JobObjects::JOBOBJECT_RATE_CONTROL_TOLERANCE
    property net_rate_control_tolerance : Win32cr::System::JobObjects::JOBOBJECT_RATE_CONTROL_TOLERANCE
    property net_rate_control_tolerance_limit : Win32cr::System::JobObjects::JOBOBJECT_RATE_CONTROL_TOLERANCE

    # Nested Type Anonymous2_e__Union_
    @[Extern(union: true)]
    struct Anonymous2_e__Union_
    property rate_control_tolerance : Win32cr::System::JobObjects::JOBOBJECT_RATE_CONTROL_TOLERANCE
    property cpu_rate_control_tolerance : Win32cr::System::JobObjects::JOBOBJECT_RATE_CONTROL_TOLERANCE
    def initialize(@rate_control_tolerance : Win32cr::System::JobObjects::JOBOBJECT_RATE_CONTROL_TOLERANCE, @cpu_rate_control_tolerance : Win32cr::System::JobObjects::JOBOBJECT_RATE_CONTROL_TOLERANCE)
    end
    end


    # Nested Type Anonymous3_e__Union_
    @[Extern(union: true)]
    struct Anonymous3_e__Union_
    property rate_control_tolerance_limit : Win32cr::System::JobObjects::JOBOBJECT_RATE_CONTROL_TOLERANCE
    property cpu_rate_control_tolerance_limit : Win32cr::System::JobObjects::JOBOBJECT_RATE_CONTROL_TOLERANCE
    def initialize(@rate_control_tolerance_limit : Win32cr::System::JobObjects::JOBOBJECT_RATE_CONTROL_TOLERANCE, @cpu_rate_control_tolerance_limit : Win32cr::System::JobObjects::JOBOBJECT_RATE_CONTROL_TOLERANCE)
    end
    end


    # Nested Type Anonymous1_e__Union_
    @[Extern(union: true)]
    struct Anonymous1_e__Union_
    property job_high_memory_limit : UInt64
    property job_memory_limit : UInt64
    def initialize(@job_high_memory_limit : UInt64, @job_memory_limit : UInt64)
    end
    end

    def initialize(@limit_flags : Win32cr::System::JobObjects::JOB_OBJECT_LIMIT, @violation_limit_flags : Win32cr::System::JobObjects::JOB_OBJECT_LIMIT, @io_read_bytes : UInt64, @io_read_bytes_limit : UInt64, @io_write_bytes : UInt64, @io_write_bytes_limit : UInt64, @per_job_user_time : Win32cr::Foundation::LARGE_INTEGER, @per_job_user_time_limit : Win32cr::Foundation::LARGE_INTEGER, @job_memory : UInt64, @anonymous1 : Anonymous1_e__Union_, @anonymous2 : Anonymous2_e__Union_, @anonymous3 : Anonymous3_e__Union_, @job_low_memory_limit : UInt64, @io_rate_control_tolerance : Win32cr::System::JobObjects::JOBOBJECT_RATE_CONTROL_TOLERANCE, @io_rate_control_tolerance_limit : Win32cr::System::JobObjects::JOBOBJECT_RATE_CONTROL_TOLERANCE, @net_rate_control_tolerance : Win32cr::System::JobObjects::JOBOBJECT_RATE_CONTROL_TOLERANCE, @net_rate_control_tolerance_limit : Win32cr::System::JobObjects::JOBOBJECT_RATE_CONTROL_TOLERANCE)
    end
  end

  @[Extern]
  struct JOBOBJECT_CPU_RATE_CONTROL_INFORMATION
    property control_flags : Win32cr::System::JobObjects::JOB_OBJECT_CPU_RATE_CONTROL
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property cpu_rate : UInt32
    property weight : UInt32
    property anonymous : Anonymous_e__Struct_

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property min_rate : UInt16
    property max_rate : UInt16
    def initialize(@min_rate : UInt16, @max_rate : UInt16)
    end
      end

    def initialize(@cpu_rate : UInt32, @weight : UInt32, @anonymous : Anonymous_e__Struct_)
    end
    end

    def initialize(@control_flags : Win32cr::System::JobObjects::JOB_OBJECT_CPU_RATE_CONTROL, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct JOBOBJECT_NET_RATE_CONTROL_INFORMATION
    property max_bandwidth : UInt64
    property control_flags : Win32cr::System::JobObjects::JOB_OBJECT_NET_RATE_CONTROL_FLAGS
    property dscp_tag : UInt8
    def initialize(@max_bandwidth : UInt64, @control_flags : Win32cr::System::JobObjects::JOB_OBJECT_NET_RATE_CONTROL_FLAGS, @dscp_tag : UInt8)
    end
  end

  @[Extern]
  struct JOBOBJECT_IO_RATE_CONTROL_INFORMATION_NATIVE
    property max_iops : Int64
    property max_bandwidth : Int64
    property reservation_iops : Int64
    property volume_name : Win32cr::Foundation::PWSTR
    property base_io_size : UInt32
    property control_flags : Win32cr::System::JobObjects::JOB_OBJECT_IO_RATE_CONTROL_FLAGS
    property volume_name_length : UInt16
    def initialize(@max_iops : Int64, @max_bandwidth : Int64, @reservation_iops : Int64, @volume_name : Win32cr::Foundation::PWSTR, @base_io_size : UInt32, @control_flags : Win32cr::System::JobObjects::JOB_OBJECT_IO_RATE_CONTROL_FLAGS, @volume_name_length : UInt16)
    end
  end

  @[Extern]
  struct JOBOBJECT_IO_RATE_CONTROL_INFORMATION_NATIVE_V2
    property max_iops : Int64
    property max_bandwidth : Int64
    property reservation_iops : Int64
    property volume_name : Win32cr::Foundation::PWSTR
    property base_io_size : UInt32
    property control_flags : Win32cr::System::JobObjects::JOB_OBJECT_IO_RATE_CONTROL_FLAGS
    property volume_name_length : UInt16
    property critical_reservation_iops : Int64
    property reservation_bandwidth : Int64
    property critical_reservation_bandwidth : Int64
    property max_time_percent : Int64
    property reservation_time_percent : Int64
    property critical_reservation_time_percent : Int64
    def initialize(@max_iops : Int64, @max_bandwidth : Int64, @reservation_iops : Int64, @volume_name : Win32cr::Foundation::PWSTR, @base_io_size : UInt32, @control_flags : Win32cr::System::JobObjects::JOB_OBJECT_IO_RATE_CONTROL_FLAGS, @volume_name_length : UInt16, @critical_reservation_iops : Int64, @reservation_bandwidth : Int64, @critical_reservation_bandwidth : Int64, @max_time_percent : Int64, @reservation_time_percent : Int64, @critical_reservation_time_percent : Int64)
    end
  end

  @[Extern]
  struct JOBOBJECT_IO_RATE_CONTROL_INFORMATION_NATIVE_V3
    property max_iops : Int64
    property max_bandwidth : Int64
    property reservation_iops : Int64
    property volume_name : Win32cr::Foundation::PWSTR
    property base_io_size : UInt32
    property control_flags : Win32cr::System::JobObjects::JOB_OBJECT_IO_RATE_CONTROL_FLAGS
    property volume_name_length : UInt16
    property critical_reservation_iops : Int64
    property reservation_bandwidth : Int64
    property critical_reservation_bandwidth : Int64
    property max_time_percent : Int64
    property reservation_time_percent : Int64
    property critical_reservation_time_percent : Int64
    property soft_max_iops : Int64
    property soft_max_bandwidth : Int64
    property soft_max_time_percent : Int64
    property limit_excess_notify_iops : Int64
    property limit_excess_notify_bandwidth : Int64
    property limit_excess_notify_time_percent : Int64
    def initialize(@max_iops : Int64, @max_bandwidth : Int64, @reservation_iops : Int64, @volume_name : Win32cr::Foundation::PWSTR, @base_io_size : UInt32, @control_flags : Win32cr::System::JobObjects::JOB_OBJECT_IO_RATE_CONTROL_FLAGS, @volume_name_length : UInt16, @critical_reservation_iops : Int64, @reservation_bandwidth : Int64, @critical_reservation_bandwidth : Int64, @max_time_percent : Int64, @reservation_time_percent : Int64, @critical_reservation_time_percent : Int64, @soft_max_iops : Int64, @soft_max_bandwidth : Int64, @soft_max_time_percent : Int64, @limit_excess_notify_iops : Int64, @limit_excess_notify_bandwidth : Int64, @limit_excess_notify_time_percent : Int64)
    end
  end

  @[Extern]
  struct JOBOBJECT_IO_ATTRIBUTION_STATS
    property io_count : LibC::UIntPtrT
    property total_non_overlapped_queue_time : UInt64
    property total_non_overlapped_service_time : UInt64
    property total_size : UInt64
    def initialize(@io_count : LibC::UIntPtrT, @total_non_overlapped_queue_time : UInt64, @total_non_overlapped_service_time : UInt64, @total_size : UInt64)
    end
  end

  @[Extern]
  struct JOBOBJECT_IO_ATTRIBUTION_INFORMATION
    property control_flags : UInt32
    property read_stats : Win32cr::System::JobObjects::JOBOBJECT_IO_ATTRIBUTION_STATS
    property write_stats : Win32cr::System::JobObjects::JOBOBJECT_IO_ATTRIBUTION_STATS
    def initialize(@control_flags : UInt32, @read_stats : Win32cr::System::JobObjects::JOBOBJECT_IO_ATTRIBUTION_STATS, @write_stats : Win32cr::System::JobObjects::JOBOBJECT_IO_ATTRIBUTION_STATS)
    end
  end

  def isProcessInJob(process_handle : Win32cr::Foundation::HANDLE, job_handle : Win32cr::Foundation::HANDLE, result : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL
    C.IsProcessInJob(process_handle, job_handle, result)
  end

  #def createJobObjectW(lpJobAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lpName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HANDLE
    #C.CreateJobObjectW(lpJobAttributes, lpName)
  #end

  def freeMemoryJobObject(buffer : Void*) : Void
    C.FreeMemoryJobObject(buffer)
  end

  def openJobObjectW(dwDesiredAccess : UInt32, bInheritHandle : Win32cr::Foundation::BOOL, lpName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HANDLE
    C.OpenJobObjectW(dwDesiredAccess, bInheritHandle, lpName)
  end

  #def assignProcessToJobObject(hJob : Win32cr::Foundation::HANDLE, hProcess : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    #C.AssignProcessToJobObject(hJob, hProcess)
  #end

  def terminateJobObject(hJob : Win32cr::Foundation::HANDLE, uExitCode : UInt32) : Win32cr::Foundation::BOOL
    C.TerminateJobObject(hJob, uExitCode)
  end

  #def setInformationJobObject(hJob : Win32cr::Foundation::HANDLE, job_object_information_class : Win32cr::System::JobObjects::JOBOBJECTINFOCLASS, lpJobObjectInformation : Void*, cbJobObjectInformationLength : UInt32) : Win32cr::Foundation::BOOL
    #C.SetInformationJobObject(hJob, job_object_information_class, lpJobObjectInformation, cbJobObjectInformationLength)
  #end

  def setIoRateControlInformationJobObject(hJob : Win32cr::Foundation::HANDLE, io_rate_control_info : Win32cr::System::JobObjects::JOBOBJECT_IO_RATE_CONTROL_INFORMATION*) : UInt32
    C.SetIoRateControlInformationJobObject(hJob, io_rate_control_info)
  end

  def queryInformationJobObject(hJob : Win32cr::Foundation::HANDLE, job_object_information_class : Win32cr::System::JobObjects::JOBOBJECTINFOCLASS, lpJobObjectInformation : Void*, cbJobObjectInformationLength : UInt32, lpReturnLength : UInt32*) : Win32cr::Foundation::BOOL
    C.QueryInformationJobObject(hJob, job_object_information_class, lpJobObjectInformation, cbJobObjectInformationLength, lpReturnLength)
  end

  def queryIoRateControlInformationJobObject(hJob : Win32cr::Foundation::HANDLE, volume_name : Win32cr::Foundation::PWSTR, info_blocks : Win32cr::System::JobObjects::JOBOBJECT_IO_RATE_CONTROL_INFORMATION**, info_block_count : UInt32*) : UInt32
    C.QueryIoRateControlInformationJobObject(hJob, volume_name, info_blocks, info_block_count)
  end

  def userHandleGrantAccess(hUserHandle : Win32cr::Foundation::HANDLE, hJob : Win32cr::Foundation::HANDLE, bGrant : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    C.UserHandleGrantAccess(hUserHandle, hJob, bGrant)
  end

  def createJobObjectA(lpJobAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lpName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HANDLE
    C.CreateJobObjectA(lpJobAttributes, lpName)
  end

  def openJobObjectA(dwDesiredAccess : UInt32, bInheritHandle : Win32cr::Foundation::BOOL, lpName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HANDLE
    C.OpenJobObjectA(dwDesiredAccess, bInheritHandle, lpName)
  end

  def createJobSet(num_job : UInt32, user_job_set : Win32cr::System::JobObjects::JOB_SET_ARRAY*, flags : UInt32) : Win32cr::Foundation::BOOL
    C.CreateJobSet(num_job, user_job_set, flags)
  end

  @[Link("kernel32")]
  @[Link("user32")]
  lib C
    # :nodoc:
    fun IsProcessInJob(process_handle : Win32cr::Foundation::HANDLE, job_handle : Win32cr::Foundation::HANDLE, result : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun CreateJobObjectW(lpJobAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lpName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun FreeMemoryJobObject(buffer : Void*) : Void

    # :nodoc:
    fun OpenJobObjectW(dwDesiredAccess : UInt32, bInheritHandle : Win32cr::Foundation::BOOL, lpName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HANDLE

    # Commented out due to being part of LibC
    # :nodoc:
    #fun AssignProcessToJobObject(hJob : Win32cr::Foundation::HANDLE, hProcess : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun TerminateJobObject(hJob : Win32cr::Foundation::HANDLE, uExitCode : UInt32) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun SetInformationJobObject(hJob : Win32cr::Foundation::HANDLE, job_object_information_class : Win32cr::System::JobObjects::JOBOBJECTINFOCLASS, lpJobObjectInformation : Void*, cbJobObjectInformationLength : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetIoRateControlInformationJobObject(hJob : Win32cr::Foundation::HANDLE, io_rate_control_info : Win32cr::System::JobObjects::JOBOBJECT_IO_RATE_CONTROL_INFORMATION*) : UInt32

    # :nodoc:
    fun QueryInformationJobObject(hJob : Win32cr::Foundation::HANDLE, job_object_information_class : Win32cr::System::JobObjects::JOBOBJECTINFOCLASS, lpJobObjectInformation : Void*, cbJobObjectInformationLength : UInt32, lpReturnLength : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun QueryIoRateControlInformationJobObject(hJob : Win32cr::Foundation::HANDLE, volume_name : Win32cr::Foundation::PWSTR, info_blocks : Win32cr::System::JobObjects::JOBOBJECT_IO_RATE_CONTROL_INFORMATION**, info_block_count : UInt32*) : UInt32

    # :nodoc:
    fun UserHandleGrantAccess(hUserHandle : Win32cr::Foundation::HANDLE, hJob : Win32cr::Foundation::HANDLE, bGrant : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CreateJobObjectA(lpJobAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lpName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun OpenJobObjectA(dwDesiredAccess : UInt32, bInheritHandle : Win32cr::Foundation::BOOL, lpName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun CreateJobSet(num_job : UInt32, user_job_set : Win32cr::System::JobObjects::JOB_SET_ARRAY*, flags : UInt32) : Win32cr::Foundation::BOOL

  end
end