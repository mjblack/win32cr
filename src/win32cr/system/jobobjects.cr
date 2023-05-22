require "../foundation.cr"
require "../system/threading.cr"
require "../security.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:user32.dll")]
lib LibWin32

  enum JOB_OBJECT_LIMIT : UInt32
    JOB_OBJECT_LIMIT_WORKINGSET = 1
    JOB_OBJECT_LIMIT_PROCESS_TIME = 2
    JOB_OBJECT_LIMIT_JOB_TIME = 4
    JOB_OBJECT_LIMIT_ACTIVE_PROCESS = 8
    JOB_OBJECT_LIMIT_AFFINITY = 16
    JOB_OBJECT_LIMIT_PRIORITY_CLASS = 32
    JOB_OBJECT_LIMIT_PRESERVE_JOB_TIME = 64
    JOB_OBJECT_LIMIT_SCHEDULING_CLASS = 128
    JOB_OBJECT_LIMIT_PROCESS_MEMORY = 256
    JOB_OBJECT_LIMIT_JOB_MEMORY = 512
    JOB_OBJECT_LIMIT_JOB_MEMORY_HIGH = 512
    JOB_OBJECT_LIMIT_DIE_ON_UNHANDLED_EXCEPTION = 1024
    JOB_OBJECT_LIMIT_BREAKAWAY_OK = 2048
    JOB_OBJECT_LIMIT_SILENT_BREAKAWAY_OK = 4096
    JOB_OBJECT_LIMIT_KILL_ON_JOB_CLOSE = 8192
    JOB_OBJECT_LIMIT_SUBSET_AFFINITY = 16384
    JOB_OBJECT_LIMIT_JOB_MEMORY_LOW = 32768
    JOB_OBJECT_LIMIT_JOB_READ_BYTES = 65536
    JOB_OBJECT_LIMIT_JOB_WRITE_BYTES = 131072
    JOB_OBJECT_LIMIT_RATE_CONTROL = 262144
    JOB_OBJECT_LIMIT_CPU_RATE_CONTROL = 262144
    JOB_OBJECT_LIMIT_IO_RATE_CONTROL = 524288
    JOB_OBJECT_LIMIT_NET_RATE_CONTROL = 1048576
    JOB_OBJECT_LIMIT_VALID_FLAGS = 524287
    JOB_OBJECT_BASIC_LIMIT_VALID_FLAGS = 255
    JOB_OBJECT_EXTENDED_LIMIT_VALID_FLAGS = 32767
    JOB_OBJECT_NOTIFICATION_LIMIT_VALID_FLAGS = 2064900
  end

  enum JOB_OBJECT_UILIMIT : UInt32
    JOB_OBJECT_UILIMIT_NONE = 0
    JOB_OBJECT_UILIMIT_HANDLES = 1
    JOB_OBJECT_UILIMIT_READCLIPBOARD = 2
    JOB_OBJECT_UILIMIT_WRITECLIPBOARD = 4
    JOB_OBJECT_UILIMIT_SYSTEMPARAMETERS = 8
    JOB_OBJECT_UILIMIT_DISPLAYSETTINGS = 16
    JOB_OBJECT_UILIMIT_GLOBALATOMS = 32
    JOB_OBJECT_UILIMIT_DESKTOP = 64
    JOB_OBJECT_UILIMIT_EXITWINDOWS = 128
  end

  enum JOB_OBJECT_SECURITY : UInt32
    JOB_OBJECT_SECURITY_NO_ADMIN = 1
    JOB_OBJECT_SECURITY_RESTRICTED_TOKEN = 2
    JOB_OBJECT_SECURITY_ONLY_TOKEN = 4
    JOB_OBJECT_SECURITY_FILTER_TOKENS = 8
    JOB_OBJECT_SECURITY_VALID_FLAGS = 15
  end

  enum JOB_OBJECT_CPU_RATE_CONTROL : UInt32
    JOB_OBJECT_CPU_RATE_CONTROL_ENABLE = 1
    JOB_OBJECT_CPU_RATE_CONTROL_WEIGHT_BASED = 2
    JOB_OBJECT_CPU_RATE_CONTROL_HARD_CAP = 4
    JOB_OBJECT_CPU_RATE_CONTROL_NOTIFY = 8
    JOB_OBJECT__CPU_RATE_CONTROL_MIN_MAX_RATE = 16
  end

  enum JOB_OBJECT_TERMINATE_AT_END_ACTION : UInt32
    JOB_OBJECT_TERMINATE_AT_END_OF_JOB = 0
    JOB_OBJECT_POST_AT_END_OF_JOB = 1
  end

  enum JOBOBJECT_RATE_CONTROL_TOLERANCE : Int32
    ToleranceLow = 1
    ToleranceMedium = 2
    ToleranceHigh = 3
  end

  enum JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL : Int32
    ToleranceIntervalShort = 1
    ToleranceIntervalMedium = 2
    ToleranceIntervalLong = 3
  end

  enum JOB_OBJECT_NET_RATE_CONTROL_FLAGS : Int32
    JOB_OBJECT_NET_RATE_CONTROL_ENABLE = 1
    JOB_OBJECT_NET_RATE_CONTROL_MAX_BANDWIDTH = 2
    JOB_OBJECT_NET_RATE_CONTROL_DSCP_TAG = 4
    JOB_OBJECT_NET_RATE_CONTROL_VALID_FLAGS = 7
  end

  enum JOB_OBJECT_IO_RATE_CONTROL_FLAGS : Int32
    JOB_OBJECT_IO_RATE_CONTROL_ENABLE = 1
    JOB_OBJECT_IO_RATE_CONTROL_STANDALONE_VOLUME = 2
    JOB_OBJECT_IO_RATE_CONTROL_FORCE_UNIT_ACCESS_ALL = 4
    JOB_OBJECT_IO_RATE_CONTROL_FORCE_UNIT_ACCESS_ON_SOFT_CAP = 8
    JOB_OBJECT_IO_RATE_CONTROL_VALID_FLAGS = 15
  end

  enum JOBOBJECT_IO_ATTRIBUTION_CONTROL_FLAGS : Int32
    JOBOBJECT_IO_ATTRIBUTION_CONTROL_ENABLE = 1
    JOBOBJECT_IO_ATTRIBUTION_CONTROL_DISABLE = 2
    JOBOBJECT_IO_ATTRIBUTION_CONTROL_VALID_FLAGS = 3
  end

  enum JOBOBJECTINFOCLASS : Int32
    JobObjectBasicAccountingInformation = 1
    JobObjectBasicLimitInformation = 2
    JobObjectBasicProcessIdList = 3
    JobObjectBasicUIRestrictions = 4
    JobObjectSecurityLimitInformation = 5
    JobObjectEndOfJobTimeInformation = 6
    JobObjectAssociateCompletionPortInformation = 7
    JobObjectBasicAndIoAccountingInformation = 8
    JobObjectExtendedLimitInformation = 9
    JobObjectJobSetInformation = 10
    JobObjectGroupInformation = 11
    JobObjectNotificationLimitInformation = 12
    JobObjectLimitViolationInformation = 13
    JobObjectGroupInformationEx = 14
    JobObjectCpuRateControlInformation = 15
    JobObjectCompletionFilter = 16
    JobObjectCompletionCounter = 17
    JobObjectReserved1Information = 18
    JobObjectReserved2Information = 19
    JobObjectReserved3Information = 20
    JobObjectReserved4Information = 21
    JobObjectReserved5Information = 22
    JobObjectReserved6Information = 23
    JobObjectReserved7Information = 24
    JobObjectReserved8Information = 25
    JobObjectReserved9Information = 26
    JobObjectReserved10Information = 27
    JobObjectReserved11Information = 28
    JobObjectReserved12Information = 29
    JobObjectReserved13Information = 30
    JobObjectReserved14Information = 31
    JobObjectNetRateControlInformation = 32
    JobObjectNotificationLimitInformation2 = 33
    JobObjectLimitViolationInformation2 = 34
    JobObjectCreateSilo = 35
    JobObjectSiloBasicInformation = 36
    JobObjectReserved15Information = 37
    JobObjectReserved16Information = 38
    JobObjectReserved17Information = 39
    JobObjectReserved18Information = 40
    JobObjectReserved19Information = 41
    JobObjectReserved20Information = 42
    JobObjectReserved21Information = 43
    JobObjectReserved22Information = 44
    JobObjectReserved23Information = 45
    JobObjectReserved24Information = 46
    JobObjectReserved25Information = 47
    MaxJobObjectInfoClass = 48
  end

union JOBOBJECT_NOTIFICATION_LIMIT_INFORMATION_2_Anonymous3_e__Union
  rate_control_tolerance_interval : JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL
  cpu_rate_control_tolerance_interval : JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL
end
union JOBOBJECT_NOTIFICATION_LIMIT_INFORMATION_2_Anonymous1_e__Union
  job_high_memory_limit : UInt64
  job_memory_limit : UInt64
end
union JOBOBJECT_NOTIFICATION_LIMIT_INFORMATION_2_Anonymous2_e__Union
  rate_control_tolerance : JOBOBJECT_RATE_CONTROL_TOLERANCE
  cpu_rate_control_tolerance : JOBOBJECT_RATE_CONTROL_TOLERANCE
end
union JOBOBJECT_LIMIT_VIOLATION_INFORMATION_2_Anonymous2_e__Union
  rate_control_tolerance : JOBOBJECT_RATE_CONTROL_TOLERANCE
  cpu_rate_control_tolerance : JOBOBJECT_RATE_CONTROL_TOLERANCE
end
union JOBOBJECT_LIMIT_VIOLATION_INFORMATION_2_Anonymous3_e__Union
  rate_control_tolerance_limit : JOBOBJECT_RATE_CONTROL_TOLERANCE
  cpu_rate_control_tolerance_limit : JOBOBJECT_RATE_CONTROL_TOLERANCE
end
union JOBOBJECT_LIMIT_VIOLATION_INFORMATION_2_Anonymous1_e__Union
  job_high_memory_limit : UInt64
  job_memory_limit : UInt64
end
union JOBOBJECT_CPU_RATE_CONTROL_INFORMATION_Anonymous_e__Union
  cpu_rate : UInt32
  weight : UInt32
  anonymous : JOBOBJECT_CPU_RATE_CONTROL_INFORMATION_Anonymous_e__Union_Anonymous_e__Struct
end

  struct JOBOBJECT_IO_RATE_CONTROL_INFORMATION
    max_iops : Int64
    max_bandwidth : Int64
    reservation_iops : Int64
    volume_name : LibC::LPWSTR
    base_io_size : UInt32
    control_flags : JOB_OBJECT_IO_RATE_CONTROL_FLAGS
  end
  struct JOB_SET_ARRAY
    job_handle : LibC::HANDLE
    member_level : UInt32
    flags : UInt32
  end
  struct JOBOBJECT_BASIC_ACCOUNTING_INFORMATION
    total_user_time : LARGE_INTEGER
    total_kernel_time : LARGE_INTEGER
    this_period_total_user_time : LARGE_INTEGER
    this_period_total_kernel_time : LARGE_INTEGER
    total_page_fault_count : UInt32
    total_processes : UInt32
    active_processes : UInt32
    total_terminated_processes : UInt32
  end
  struct JOBOBJECT_BASIC_LIMIT_INFORMATION
    per_process_user_time_limit : LARGE_INTEGER
    per_job_user_time_limit : LARGE_INTEGER
    limit_flags : JOB_OBJECT_LIMIT
    minimum_working_set_size : LibC::UINT_PTR
    maximum_working_set_size : LibC::UINT_PTR
    active_process_limit : UInt32
    affinity : LibC::UINT_PTR
    priority_class : UInt32
    scheduling_class : UInt32
  end
  struct JOBOBJECT_EXTENDED_LIMIT_INFORMATION
    basic_limit_information : JOBOBJECT_BASIC_LIMIT_INFORMATION
    io_info : IO_COUNTERS
    process_memory_limit : LibC::UINT_PTR
    job_memory_limit : LibC::UINT_PTR
    peak_process_memory_used : LibC::UINT_PTR
    peak_job_memory_used : LibC::UINT_PTR
  end
  struct JOBOBJECT_BASIC_PROCESS_ID_LIST
    number_of_assigned_processes : UInt32
    number_of_process_ids_in_list : UInt32
    process_id_list : LibC::UINT_PTR[0]*
  end
  struct JOBOBJECT_BASIC_UI_RESTRICTIONS
    ui_restrictions_class : JOB_OBJECT_UILIMIT
  end
  struct JOBOBJECT_SECURITY_LIMIT_INFORMATION
    security_limit_flags : JOB_OBJECT_SECURITY
    job_token : LibC::HANDLE
    sids_to_disable : TOKEN_GROUPS*
    privileges_to_delete : TOKEN_PRIVILEGES*
    restricted_sids : TOKEN_GROUPS*
  end
  struct JOBOBJECT_END_OF_JOB_TIME_INFORMATION
    end_of_job_time_action : JOB_OBJECT_TERMINATE_AT_END_ACTION
  end
  struct JOBOBJECT_ASSOCIATE_COMPLETION_PORT
    completion_key : Void*
    completion_port : LibC::HANDLE
  end
  struct JOBOBJECT_BASIC_AND_IO_ACCOUNTING_INFORMATION
    basic_info : JOBOBJECT_BASIC_ACCOUNTING_INFORMATION
    io_info : IO_COUNTERS
  end
  struct JOBOBJECT_JOBSET_INFORMATION
    member_level : UInt32
  end
  struct JOBOBJECT_NOTIFICATION_LIMIT_INFORMATION
    io_read_bytes_limit : UInt64
    io_write_bytes_limit : UInt64
    per_job_user_time_limit : LARGE_INTEGER
    job_memory_limit : UInt64
    rate_control_tolerance : JOBOBJECT_RATE_CONTROL_TOLERANCE
    rate_control_tolerance_interval : JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL
    limit_flags : JOB_OBJECT_LIMIT
  end
  struct JOBOBJECT_NOTIFICATION_LIMIT_INFORMATION_2
    io_read_bytes_limit : UInt64
    io_write_bytes_limit : UInt64
    per_job_user_time_limit : LARGE_INTEGER
    anonymous1 : JOBOBJECT_NOTIFICATION_LIMIT_INFORMATION_2_Anonymous1_e__Union
    anonymous2 : JOBOBJECT_NOTIFICATION_LIMIT_INFORMATION_2_Anonymous2_e__Union
    anonymous3 : JOBOBJECT_NOTIFICATION_LIMIT_INFORMATION_2_Anonymous3_e__Union
    limit_flags : JOB_OBJECT_LIMIT
    io_rate_control_tolerance : JOBOBJECT_RATE_CONTROL_TOLERANCE
    job_low_memory_limit : UInt64
    io_rate_control_tolerance_interval : JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL
    net_rate_control_tolerance : JOBOBJECT_RATE_CONTROL_TOLERANCE
    net_rate_control_tolerance_interval : JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL
  end
  struct JOBOBJECT_LIMIT_VIOLATION_INFORMATION
    limit_flags : JOB_OBJECT_LIMIT
    violation_limit_flags : JOB_OBJECT_LIMIT
    io_read_bytes : UInt64
    io_read_bytes_limit : UInt64
    io_write_bytes : UInt64
    io_write_bytes_limit : UInt64
    per_job_user_time : LARGE_INTEGER
    per_job_user_time_limit : LARGE_INTEGER
    job_memory : UInt64
    job_memory_limit : UInt64
    rate_control_tolerance : JOBOBJECT_RATE_CONTROL_TOLERANCE
    rate_control_tolerance_limit : JOBOBJECT_RATE_CONTROL_TOLERANCE
  end
  struct JOBOBJECT_LIMIT_VIOLATION_INFORMATION_2
    limit_flags : JOB_OBJECT_LIMIT
    violation_limit_flags : JOB_OBJECT_LIMIT
    io_read_bytes : UInt64
    io_read_bytes_limit : UInt64
    io_write_bytes : UInt64
    io_write_bytes_limit : UInt64
    per_job_user_time : LARGE_INTEGER
    per_job_user_time_limit : LARGE_INTEGER
    job_memory : UInt64
    anonymous1 : JOBOBJECT_LIMIT_VIOLATION_INFORMATION_2_Anonymous1_e__Union
    anonymous2 : JOBOBJECT_LIMIT_VIOLATION_INFORMATION_2_Anonymous2_e__Union
    anonymous3 : JOBOBJECT_LIMIT_VIOLATION_INFORMATION_2_Anonymous3_e__Union
    job_low_memory_limit : UInt64
    io_rate_control_tolerance : JOBOBJECT_RATE_CONTROL_TOLERANCE
    io_rate_control_tolerance_limit : JOBOBJECT_RATE_CONTROL_TOLERANCE
    net_rate_control_tolerance : JOBOBJECT_RATE_CONTROL_TOLERANCE
    net_rate_control_tolerance_limit : JOBOBJECT_RATE_CONTROL_TOLERANCE
  end
  struct JOBOBJECT_CPU_RATE_CONTROL_INFORMATION
    control_flags : JOB_OBJECT_CPU_RATE_CONTROL
    anonymous : JOBOBJECT_CPU_RATE_CONTROL_INFORMATION_Anonymous_e__Union
  end
  struct JOBOBJECT_CPU_RATE_CONTROL_INFORMATION_Anonymous_e__Union_Anonymous_e__Struct
    min_rate : UInt16
    max_rate : UInt16
  end
  struct JOBOBJECT_NET_RATE_CONTROL_INFORMATION
    max_bandwidth : UInt64
    control_flags : JOB_OBJECT_NET_RATE_CONTROL_FLAGS
    dscp_tag : UInt8
  end
  struct JOBOBJECT_IO_RATE_CONTROL_INFORMATION_NATIVE
    max_iops : Int64
    max_bandwidth : Int64
    reservation_iops : Int64
    volume_name : LibC::LPWSTR
    base_io_size : UInt32
    control_flags : JOB_OBJECT_IO_RATE_CONTROL_FLAGS
    volume_name_length : UInt16
  end
  struct JOBOBJECT_IO_RATE_CONTROL_INFORMATION_NATIVE_V2
    max_iops : Int64
    max_bandwidth : Int64
    reservation_iops : Int64
    volume_name : LibC::LPWSTR
    base_io_size : UInt32
    control_flags : JOB_OBJECT_IO_RATE_CONTROL_FLAGS
    volume_name_length : UInt16
    critical_reservation_iops : Int64
    reservation_bandwidth : Int64
    critical_reservation_bandwidth : Int64
    max_time_percent : Int64
    reservation_time_percent : Int64
    critical_reservation_time_percent : Int64
  end
  struct JOBOBJECT_IO_RATE_CONTROL_INFORMATION_NATIVE_V3
    max_iops : Int64
    max_bandwidth : Int64
    reservation_iops : Int64
    volume_name : LibC::LPWSTR
    base_io_size : UInt32
    control_flags : JOB_OBJECT_IO_RATE_CONTROL_FLAGS
    volume_name_length : UInt16
    critical_reservation_iops : Int64
    reservation_bandwidth : Int64
    critical_reservation_bandwidth : Int64
    max_time_percent : Int64
    reservation_time_percent : Int64
    critical_reservation_time_percent : Int64
    soft_max_iops : Int64
    soft_max_bandwidth : Int64
    soft_max_time_percent : Int64
    limit_excess_notify_iops : Int64
    limit_excess_notify_bandwidth : Int64
    limit_excess_notify_time_percent : Int64
  end
  struct JOBOBJECT_IO_ATTRIBUTION_STATS
    io_count : LibC::UINT_PTR
    total_non_overlapped_queue_time : UInt64
    total_non_overlapped_service_time : UInt64
    total_size : UInt64
  end
  struct JOBOBJECT_IO_ATTRIBUTION_INFORMATION
    control_flags : UInt32
    read_stats : JOBOBJECT_IO_ATTRIBUTION_STATS
    write_stats : JOBOBJECT_IO_ATTRIBUTION_STATS
  end


  # Params # processhandle : LibC::HANDLE [In],jobhandle : LibC::HANDLE [In],result : LibC::BOOL* [In]
  fun IsProcessInJob(processhandle : LibC::HANDLE, jobhandle : LibC::HANDLE, result : LibC::BOOL*) : LibC::BOOL

  # Params # lpjobattributes : SECURITY_ATTRIBUTES* [In],lpname : LibC::LPWSTR [In]
  fun CreateJobObjectW(lpjobattributes : SECURITY_ATTRIBUTES*, lpname : LibC::LPWSTR) : LibC::HANDLE

  # Params # buffer : Void* [In]
  fun FreeMemoryJobObject(buffer : Void*)

  # Params # dwdesiredaccess : UInt32 [In],binherithandle : LibC::BOOL [In],lpname : LibC::LPWSTR [In]
  fun OpenJobObjectW(dwdesiredaccess : UInt32, binherithandle : LibC::BOOL, lpname : LibC::LPWSTR) : LibC::HANDLE

  # Params # hjob : LibC::HANDLE [In],hprocess : LibC::HANDLE [In]
  fun AssignProcessToJobObject(hjob : LibC::HANDLE, hprocess : LibC::HANDLE) : LibC::BOOL

  # Params # hjob : LibC::HANDLE [In],uexitcode : UInt32 [In]
  fun TerminateJobObject(hjob : LibC::HANDLE, uexitcode : UInt32) : LibC::BOOL

  # Params # hjob : LibC::HANDLE [In],jobobjectinformationclass : JOBOBJECTINFOCLASS [In],lpjobobjectinformation : Void* [In],cbjobobjectinformationlength : UInt32 [In]
  fun SetInformationJobObject(hjob : LibC::HANDLE, jobobjectinformationclass : JOBOBJECTINFOCLASS, lpjobobjectinformation : Void*, cbjobobjectinformationlength : UInt32) : LibC::BOOL

  # Params # hjob : LibC::HANDLE [In],ioratecontrolinfo : JOBOBJECT_IO_RATE_CONTROL_INFORMATION* [In]
  fun SetIoRateControlInformationJobObject(hjob : LibC::HANDLE, ioratecontrolinfo : JOBOBJECT_IO_RATE_CONTROL_INFORMATION*) : UInt32

  # Params # hjob : LibC::HANDLE [In],jobobjectinformationclass : JOBOBJECTINFOCLASS [In],lpjobobjectinformation : Void* [In],cbjobobjectinformationlength : UInt32 [In],lpreturnlength : UInt32* [In]
  fun QueryInformationJobObject(hjob : LibC::HANDLE, jobobjectinformationclass : JOBOBJECTINFOCLASS, lpjobobjectinformation : Void*, cbjobobjectinformationlength : UInt32, lpreturnlength : UInt32*) : LibC::BOOL

  # Params # hjob : LibC::HANDLE [In],volumename : LibC::LPWSTR [In],infoblocks : JOBOBJECT_IO_RATE_CONTROL_INFORMATION** [In],infoblockcount : UInt32* [In]
  fun QueryIoRateControlInformationJobObject(hjob : LibC::HANDLE, volumename : LibC::LPWSTR, infoblocks : JOBOBJECT_IO_RATE_CONTROL_INFORMATION**, infoblockcount : UInt32*) : UInt32

  # Params # huserhandle : LibC::HANDLE [In],hjob : LibC::HANDLE [In],bgrant : LibC::BOOL [In]
  fun UserHandleGrantAccess(huserhandle : LibC::HANDLE, hjob : LibC::HANDLE, bgrant : LibC::BOOL) : LibC::BOOL

  # Params # lpjobattributes : SECURITY_ATTRIBUTES* [In],lpname : PSTR [In]
  fun CreateJobObjectA(lpjobattributes : SECURITY_ATTRIBUTES*, lpname : PSTR) : LibC::HANDLE

  # Params # dwdesiredaccess : UInt32 [In],binherithandle : LibC::BOOL [In],lpname : PSTR [In]
  fun OpenJobObjectA(dwdesiredaccess : UInt32, binherithandle : LibC::BOOL, lpname : PSTR) : LibC::HANDLE

  # Params # numjob : UInt32 [In],userjobset : JOB_SET_ARRAY* [In],flags : UInt32 [In]
  fun CreateJobSet(numjob : UInt32, userjobset : JOB_SET_ARRAY*, flags : UInt32) : LibC::BOOL
end
