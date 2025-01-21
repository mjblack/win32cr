require "./../foundation.cr"
require "./../security.cr"
require "./../system/io.cr"

module Win32cr::Storage::InstallableFileSystems
  alias HFILTER = LibC::IntPtrT
  alias HFILTER_INSTANCE = LibC::IntPtrT
  alias FilterFindHandle = LibC::IntPtrT
  alias FilterVolumeFindHandle = LibC::IntPtrT
  alias FilterInstanceFindHandle = LibC::IntPtrT
  alias FilterVolumeInstanceFindHandle = LibC::IntPtrT
  FILTER_NAME_MAX_CHARS = 255_u32
  VOLUME_NAME_MAX_CHARS = 1024_u32
  INSTANCE_NAME_MAX_CHARS = 255_u32
  FLTFL_AGGREGATE_INFO_IS_MINIFILTER = 1_u32
  FLTFL_AGGREGATE_INFO_IS_LEGACYFILTER = 2_u32
  FLTFL_ASI_IS_MINIFILTER = 1_u32
  FLTFL_ASI_IS_LEGACYFILTER = 2_u32
  FLTFL_VSI_DETACHED_VOLUME = 1_u32
  FLTFL_IASI_IS_MINIFILTER = 1_u32
  FLTFL_IASI_IS_LEGACYFILTER = 2_u32
  FLTFL_IASIM_DETACHED_VOLUME = 1_u32
  FLTFL_IASIL_DETACHED_VOLUME = 1_u32
  FLT_PORT_FLAG_SYNC_HANDLE = 1_u32
  WNNC_NET_MSNET = 65536_u32
  WNNC_NET_SMB = 131072_u32
  WNNC_NET_NETWARE = 196608_u32
  WNNC_NET_VINES = 262144_u32
  WNNC_NET_10NET = 327680_u32
  WNNC_NET_LOCUS = 393216_u32
  WNNC_NET_SUN_PC_NFS = 458752_u32
  WNNC_NET_LANSTEP = 524288_u32
  WNNC_NET_9TILES = 589824_u32
  WNNC_NET_LANTASTIC = 655360_u32
  WNNC_NET_AS400 = 720896_u32
  WNNC_NET_FTP_NFS = 786432_u32
  WNNC_NET_PATHWORKS = 851968_u32
  WNNC_NET_LIFENET = 917504_u32
  WNNC_NET_POWERLAN = 983040_u32
  WNNC_NET_BWNFS = 1048576_u32
  WNNC_NET_COGENT = 1114112_u32
  WNNC_NET_FARALLON = 1179648_u32
  WNNC_NET_APPLETALK = 1245184_u32
  WNNC_NET_INTERGRAPH = 1310720_u32
  WNNC_NET_SYMFONET = 1376256_u32
  WNNC_NET_CLEARCASE = 1441792_u32
  WNNC_NET_FRONTIER = 1507328_u32
  WNNC_NET_BMC = 1572864_u32
  WNNC_NET_DCE = 1638400_u32
  WNNC_NET_AVID = 1703936_u32
  WNNC_NET_DOCUSPACE = 1769472_u32
  WNNC_NET_MANGOSOFT = 1835008_u32
  WNNC_NET_SERNET = 1900544_u32
  WNNC_NET_RIVERFRONT1 = 1966080_u32
  WNNC_NET_RIVERFRONT2 = 2031616_u32
  WNNC_NET_DECORB = 2097152_u32
  WNNC_NET_PROTSTOR = 2162688_u32
  WNNC_NET_FJ_REDIR = 2228224_u32
  WNNC_NET_DISTINCT = 2293760_u32
  WNNC_NET_TWINS = 2359296_u32
  WNNC_NET_RDR2SAMPLE = 2424832_u32
  WNNC_NET_CSC = 2490368_u32
  WNNC_NET_3IN1 = 2555904_u32
  WNNC_NET_EXTENDNET = 2686976_u32
  WNNC_NET_STAC = 2752512_u32
  WNNC_NET_FOXBAT = 2818048_u32
  WNNC_NET_YAHOO = 2883584_u32
  WNNC_NET_EXIFS = 2949120_u32
  WNNC_NET_DAV = 3014656_u32
  WNNC_NET_KNOWARE = 3080192_u32
  WNNC_NET_OBJECT_DIRE = 3145728_u32
  WNNC_NET_MASFAX = 3211264_u32
  WNNC_NET_HOB_NFS = 3276800_u32
  WNNC_NET_SHIVA = 3342336_u32
  WNNC_NET_IBMAL = 3407872_u32
  WNNC_NET_LOCK = 3473408_u32
  WNNC_NET_TERMSRV = 3538944_u32
  WNNC_NET_SRT = 3604480_u32
  WNNC_NET_QUINCY = 3670016_u32
  WNNC_NET_OPENAFS = 3735552_u32
  WNNC_NET_AVID1 = 3801088_u32
  WNNC_NET_DFS = 3866624_u32
  WNNC_NET_KWNP = 3932160_u32
  WNNC_NET_ZENWORKS = 3997696_u32
  WNNC_NET_DRIVEONWEB = 4063232_u32
  WNNC_NET_VMWARE = 4128768_u32
  WNNC_NET_RSFX = 4194304_u32
  WNNC_NET_MFILES = 4259840_u32
  WNNC_NET_MS_NFS = 4325376_u32
  WNNC_NET_GOOGLE = 4390912_u32
  WNNC_NET_NDFS = 4456448_u32
  WNNC_NET_DOCUSHARE = 4521984_u32
  WNNC_NET_AURISTOR_FS = 4587520_u32
  WNNC_NET_SECUREAGENT = 4653056_u32
  WNNC_NET_9P = 4718592_u32
  WNNC_CRED_MANAGER = 4294901760_u32
  WNNC_NET_LANMAN = 131072_u32

  enum FLT_FILESYSTEM_TYPE
    FLT_FSTYPE_UNKNOWN = 0_i32
    FLT_FSTYPE_RAW = 1_i32
    FLT_FSTYPE_NTFS = 2_i32
    FLT_FSTYPE_FAT = 3_i32
    FLT_FSTYPE_CDFS = 4_i32
    FLT_FSTYPE_UDFS = 5_i32
    FLT_FSTYPE_LANMAN = 6_i32
    FLT_FSTYPE_WEBDAV = 7_i32
    FLT_FSTYPE_RDPDR = 8_i32
    FLT_FSTYPE_NFS = 9_i32
    FLT_FSTYPE_MS_NETWARE = 10_i32
    FLT_FSTYPE_NETWARE = 11_i32
    FLT_FSTYPE_BSUDF = 12_i32
    FLT_FSTYPE_MUP = 13_i32
    FLT_FSTYPE_RSFX = 14_i32
    FLT_FSTYPE_ROXIO_UDF1 = 15_i32
    FLT_FSTYPE_ROXIO_UDF2 = 16_i32
    FLT_FSTYPE_ROXIO_UDF3 = 17_i32
    FLT_FSTYPE_TACIT = 18_i32
    FLT_FSTYPE_FS_REC = 19_i32
    FLT_FSTYPE_INCD = 20_i32
    FLT_FSTYPE_INCD_FAT = 21_i32
    FLT_FSTYPE_EXFAT = 22_i32
    FLT_FSTYPE_PSFS = 23_i32
    FLT_FSTYPE_GPFS = 24_i32
    FLT_FSTYPE_NPFS = 25_i32
    FLT_FSTYPE_MSFS = 26_i32
    FLT_FSTYPE_CSVFS = 27_i32
    FLT_FSTYPE_REFS = 28_i32
    FLT_FSTYPE_OPENAFS = 29_i32
    FLT_FSTYPE_CIMFS = 30_i32
  end
  enum FILTER_INFORMATION_CLASS
    FilterFullInformation = 0_i32
    FilterAggregateBasicInformation = 1_i32
    FilterAggregateStandardInformation = 2_i32
  end
  enum FILTER_VOLUME_INFORMATION_CLASS
    FilterVolumeBasicInformation = 0_i32
    FilterVolumeStandardInformation = 1_i32
  end
  enum INSTANCE_INFORMATION_CLASS
    InstanceBasicInformation = 0_i32
    InstancePartialInformation = 1_i32
    InstanceFullInformation = 2_i32
    InstanceAggregateStandardInformation = 3_i32
  end

  @[Extern]
  record FILTER_FULL_INFORMATION,
    next_entry_offset : UInt32,
    frame_id : UInt32,
    number_of_instances : UInt32,
    filter_name_length : UInt16,
    filter_name_buffer : UInt16*

  @[Extern]
  record FILTER_AGGREGATE_BASIC_INFORMATION,
    next_entry_offset : UInt32,
    flags : UInt32,
    type__ : Type_e__Union_ do

    # Nested Type Type_e__Union_
    @[Extern(union: true)]
    record Type_e__Union_,
      mini_filter : MiniFilter_e__Struct_,
      legacy_filter : LegacyFilter_e__Struct_ do

      # Nested Type MiniFilter_e__Struct_
      @[Extern]
      record MiniFilter_e__Struct_,
        frame_id : UInt32,
        number_of_instances : UInt32,
        filter_name_length : UInt16,
        filter_name_buffer_offset : UInt16,
        filter_altitude_length : UInt16,
        filter_altitude_buffer_offset : UInt16


      # Nested Type LegacyFilter_e__Struct_
      @[Extern]
      record LegacyFilter_e__Struct_,
        filter_name_length : UInt16,
        filter_name_buffer_offset : UInt16

    end

  end

  @[Extern]
  record FILTER_AGGREGATE_STANDARD_INFORMATION,
    next_entry_offset : UInt32,
    flags : UInt32,
    type__ : Type_e__Union_ do

    # Nested Type Type_e__Union_
    @[Extern(union: true)]
    record Type_e__Union_,
      mini_filter : MiniFilter_e__Struct_,
      legacy_filter : LegacyFilter_e__Struct_ do

      # Nested Type MiniFilter_e__Struct_
      @[Extern]
      record MiniFilter_e__Struct_,
        flags : UInt32,
        frame_id : UInt32,
        number_of_instances : UInt32,
        filter_name_length : UInt16,
        filter_name_buffer_offset : UInt16,
        filter_altitude_length : UInt16,
        filter_altitude_buffer_offset : UInt16


      # Nested Type LegacyFilter_e__Struct_
      @[Extern]
      record LegacyFilter_e__Struct_,
        flags : UInt32,
        filter_name_length : UInt16,
        filter_name_buffer_offset : UInt16,
        filter_altitude_length : UInt16,
        filter_altitude_buffer_offset : UInt16

    end

  end

  @[Extern]
  record FILTER_VOLUME_BASIC_INFORMATION,
    filter_volume_name_length : UInt16,
    filter_volume_name : UInt16*

  @[Extern]
  record FILTER_VOLUME_STANDARD_INFORMATION,
    next_entry_offset : UInt32,
    flags : UInt32,
    frame_id : UInt32,
    file_system_type : Win32cr::Storage::InstallableFileSystems::FLT_FILESYSTEM_TYPE,
    filter_volume_name_length : UInt16,
    filter_volume_name : UInt16*

  @[Extern]
  record INSTANCE_BASIC_INFORMATION,
    next_entry_offset : UInt32,
    instance_name_length : UInt16,
    instance_name_buffer_offset : UInt16

  @[Extern]
  record INSTANCE_PARTIAL_INFORMATION,
    next_entry_offset : UInt32,
    instance_name_length : UInt16,
    instance_name_buffer_offset : UInt16,
    altitude_length : UInt16,
    altitude_buffer_offset : UInt16

  @[Extern]
  record INSTANCE_FULL_INFORMATION,
    next_entry_offset : UInt32,
    instance_name_length : UInt16,
    instance_name_buffer_offset : UInt16,
    altitude_length : UInt16,
    altitude_buffer_offset : UInt16,
    volume_name_length : UInt16,
    volume_name_buffer_offset : UInt16,
    filter_name_length : UInt16,
    filter_name_buffer_offset : UInt16

  @[Extern]
  record INSTANCE_AGGREGATE_STANDARD_INFORMATION,
    next_entry_offset : UInt32,
    flags : UInt32,
    type__ : Type_e__Union_ do

    # Nested Type Type_e__Union_
    @[Extern(union: true)]
    record Type_e__Union_,
      mini_filter : MiniFilter_e__Struct_,
      legacy_filter : LegacyFilter_e__Struct_ do

      # Nested Type MiniFilter_e__Struct_
      @[Extern]
      record MiniFilter_e__Struct_,
        flags : UInt32,
        frame_id : UInt32,
        volume_file_system_type : Win32cr::Storage::InstallableFileSystems::FLT_FILESYSTEM_TYPE,
        instance_name_length : UInt16,
        instance_name_buffer_offset : UInt16,
        altitude_length : UInt16,
        altitude_buffer_offset : UInt16,
        volume_name_length : UInt16,
        volume_name_buffer_offset : UInt16,
        filter_name_length : UInt16,
        filter_name_buffer_offset : UInt16,
        supported_features : UInt32


      # Nested Type LegacyFilter_e__Struct_
      @[Extern]
      record LegacyFilter_e__Struct_,
        flags : UInt32,
        altitude_length : UInt16,
        altitude_buffer_offset : UInt16,
        volume_name_length : UInt16,
        volume_name_buffer_offset : UInt16,
        filter_name_length : UInt16,
        filter_name_buffer_offset : UInt16,
        supported_features : UInt32

    end

  end

  @[Extern]
  record FILTER_MESSAGE_HEADER,
    reply_length : UInt32,
    message_id : UInt64

  @[Extern]
  record FILTER_REPLY_HEADER,
    status : Win32cr::Foundation::NTSTATUS,
    message_id : UInt64

  @[Link("fltlib")]
  lib C
    fun FilterLoad(lpFilterName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun FilterUnload(lpFilterName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun FilterCreate(lpFilterName : Win32cr::Foundation::PWSTR, hFilter : Win32cr::Storage::InstallableFileSystems::HFILTER*) : Win32cr::Foundation::HRESULT

    fun FilterClose(hFilter : Win32cr::Storage::InstallableFileSystems::HFILTER) : Win32cr::Foundation::HRESULT

    fun FilterInstanceCreate(lpFilterName : Win32cr::Foundation::PWSTR, lpVolumeName : Win32cr::Foundation::PWSTR, lpInstanceName : Win32cr::Foundation::PWSTR, hInstance : Win32cr::Storage::InstallableFileSystems::HFILTER_INSTANCE*) : Win32cr::Foundation::HRESULT

    fun FilterInstanceClose(hInstance : Win32cr::Storage::InstallableFileSystems::HFILTER_INSTANCE) : Win32cr::Foundation::HRESULT

    fun FilterAttach(lpFilterName : Win32cr::Foundation::PWSTR, lpVolumeName : Win32cr::Foundation::PWSTR, lpInstanceName : Win32cr::Foundation::PWSTR, dwCreatedInstanceNameLength : UInt32, lpCreatedInstanceName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun FilterAttachAtAltitude(lpFilterName : Win32cr::Foundation::PWSTR, lpVolumeName : Win32cr::Foundation::PWSTR, lpAltitude : Win32cr::Foundation::PWSTR, lpInstanceName : Win32cr::Foundation::PWSTR, dwCreatedInstanceNameLength : UInt32, lpCreatedInstanceName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun FilterDetach(lpFilterName : Win32cr::Foundation::PWSTR, lpVolumeName : Win32cr::Foundation::PWSTR, lpInstanceName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun FilterFindFirst(dwInformationClass : Win32cr::Storage::InstallableFileSystems::FILTER_INFORMATION_CLASS, lpBuffer : Void*, dwBufferSize : UInt32, lpBytesReturned : UInt32*, lpFilterFind : Win32cr::Storage::InstallableFileSystems::FilterFindHandle*) : Win32cr::Foundation::HRESULT

    fun FilterFindNext(hFilterFind : Win32cr::Foundation::HANDLE, dwInformationClass : Win32cr::Storage::InstallableFileSystems::FILTER_INFORMATION_CLASS, lpBuffer : Void*, dwBufferSize : UInt32, lpBytesReturned : UInt32*) : Win32cr::Foundation::HRESULT

    fun FilterFindClose(hFilterFind : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT

    fun FilterVolumeFindFirst(dwInformationClass : Win32cr::Storage::InstallableFileSystems::FILTER_VOLUME_INFORMATION_CLASS, lpBuffer : Void*, dwBufferSize : UInt32, lpBytesReturned : UInt32*, lpVolumeFind : Win32cr::Storage::InstallableFileSystems::FilterVolumeFindHandle*) : Win32cr::Foundation::HRESULT

    fun FilterVolumeFindNext(hVolumeFind : Win32cr::Foundation::HANDLE, dwInformationClass : Win32cr::Storage::InstallableFileSystems::FILTER_VOLUME_INFORMATION_CLASS, lpBuffer : Void*, dwBufferSize : UInt32, lpBytesReturned : UInt32*) : Win32cr::Foundation::HRESULT

    fun FilterVolumeFindClose(hVolumeFind : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT

    fun FilterInstanceFindFirst(lpFilterName : Win32cr::Foundation::PWSTR, dwInformationClass : Win32cr::Storage::InstallableFileSystems::INSTANCE_INFORMATION_CLASS, lpBuffer : Void*, dwBufferSize : UInt32, lpBytesReturned : UInt32*, lpFilterInstanceFind : Win32cr::Storage::InstallableFileSystems::FilterInstanceFindHandle*) : Win32cr::Foundation::HRESULT

    fun FilterInstanceFindNext(hFilterInstanceFind : Win32cr::Foundation::HANDLE, dwInformationClass : Win32cr::Storage::InstallableFileSystems::INSTANCE_INFORMATION_CLASS, lpBuffer : Void*, dwBufferSize : UInt32, lpBytesReturned : UInt32*) : Win32cr::Foundation::HRESULT

    fun FilterInstanceFindClose(hFilterInstanceFind : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT

    fun FilterVolumeInstanceFindFirst(lpVolumeName : Win32cr::Foundation::PWSTR, dwInformationClass : Win32cr::Storage::InstallableFileSystems::INSTANCE_INFORMATION_CLASS, lpBuffer : Void*, dwBufferSize : UInt32, lpBytesReturned : UInt32*, lpVolumeInstanceFind : Win32cr::Storage::InstallableFileSystems::FilterVolumeInstanceFindHandle*) : Win32cr::Foundation::HRESULT

    fun FilterVolumeInstanceFindNext(hVolumeInstanceFind : Win32cr::Foundation::HANDLE, dwInformationClass : Win32cr::Storage::InstallableFileSystems::INSTANCE_INFORMATION_CLASS, lpBuffer : Void*, dwBufferSize : UInt32, lpBytesReturned : UInt32*) : Win32cr::Foundation::HRESULT

    fun FilterVolumeInstanceFindClose(hVolumeInstanceFind : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT

    fun FilterGetInformation(hFilter : Win32cr::Storage::InstallableFileSystems::HFILTER, dwInformationClass : Win32cr::Storage::InstallableFileSystems::FILTER_INFORMATION_CLASS, lpBuffer : Void*, dwBufferSize : UInt32, lpBytesReturned : UInt32*) : Win32cr::Foundation::HRESULT

    fun FilterInstanceGetInformation(hInstance : Win32cr::Storage::InstallableFileSystems::HFILTER_INSTANCE, dwInformationClass : Win32cr::Storage::InstallableFileSystems::INSTANCE_INFORMATION_CLASS, lpBuffer : Void*, dwBufferSize : UInt32, lpBytesReturned : UInt32*) : Win32cr::Foundation::HRESULT

    fun FilterConnectCommunicationPort(lpPortName : Win32cr::Foundation::PWSTR, dwOptions : UInt32, lpContext : Void*, wSizeOfContext : UInt16, lpSecurityAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, hPort : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT

    fun FilterSendMessage(hPort : Win32cr::Foundation::HANDLE, lpInBuffer : Void*, dwInBufferSize : UInt32, lpOutBuffer : Void*, dwOutBufferSize : UInt32, lpBytesReturned : UInt32*) : Win32cr::Foundation::HRESULT

    fun FilterGetMessage(hPort : Win32cr::Foundation::HANDLE, lpMessageBuffer : Win32cr::Storage::InstallableFileSystems::FILTER_MESSAGE_HEADER*, dwMessageBufferSize : UInt32, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::HRESULT

    fun FilterReplyMessage(hPort : Win32cr::Foundation::HANDLE, lpReplyBuffer : Win32cr::Storage::InstallableFileSystems::FILTER_REPLY_HEADER*, dwReplyBufferSize : UInt32) : Win32cr::Foundation::HRESULT

    fun FilterGetDosName(lpVolumeName : Win32cr::Foundation::PWSTR, lpDosName : UInt16*, dwDosNameBufferSize : UInt32) : Win32cr::Foundation::HRESULT

  end
end