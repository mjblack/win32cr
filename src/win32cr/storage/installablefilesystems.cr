require "../foundation.cr"
require "../security.cr"
require "../system/io.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:fltlib.dll")]
lib LibWin32
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


  enum FLT_FILESYSTEM_TYPE : Int32
    FLT_FSTYPE_UNKNOWN = 0
    FLT_FSTYPE_RAW = 1
    FLT_FSTYPE_NTFS = 2
    FLT_FSTYPE_FAT = 3
    FLT_FSTYPE_CDFS = 4
    FLT_FSTYPE_UDFS = 5
    FLT_FSTYPE_LANMAN = 6
    FLT_FSTYPE_WEBDAV = 7
    FLT_FSTYPE_RDPDR = 8
    FLT_FSTYPE_NFS = 9
    FLT_FSTYPE_MS_NETWARE = 10
    FLT_FSTYPE_NETWARE = 11
    FLT_FSTYPE_BSUDF = 12
    FLT_FSTYPE_MUP = 13
    FLT_FSTYPE_RSFX = 14
    FLT_FSTYPE_ROXIO_UDF1 = 15
    FLT_FSTYPE_ROXIO_UDF2 = 16
    FLT_FSTYPE_ROXIO_UDF3 = 17
    FLT_FSTYPE_TACIT = 18
    FLT_FSTYPE_FS_REC = 19
    FLT_FSTYPE_INCD = 20
    FLT_FSTYPE_INCD_FAT = 21
    FLT_FSTYPE_EXFAT = 22
    FLT_FSTYPE_PSFS = 23
    FLT_FSTYPE_GPFS = 24
    FLT_FSTYPE_NPFS = 25
    FLT_FSTYPE_MSFS = 26
    FLT_FSTYPE_CSVFS = 27
    FLT_FSTYPE_REFS = 28
    FLT_FSTYPE_OPENAFS = 29
    FLT_FSTYPE_CIMFS = 30
  end

  enum FILTER_INFORMATION_CLASS : Int32
    FilterFullInformation = 0
    FilterAggregateBasicInformation = 1
    FilterAggregateStandardInformation = 2
  end

  enum FILTER_VOLUME_INFORMATION_CLASS : Int32
    FilterVolumeBasicInformation = 0
    FilterVolumeStandardInformation = 1
  end

  enum INSTANCE_INFORMATION_CLASS : Int32
    InstanceBasicInformation = 0
    InstancePartialInformation = 1
    InstanceFullInformation = 2
    InstanceAggregateStandardInformation = 3
  end

union FILTER_AGGREGATE_BASIC_INFORMATION_Type_e__Union
  mini_filter : FILTER_AGGREGATE_BASIC_INFORMATION_Type_e__Union_MiniFilter_e__Struct
  legacy_filter : FILTER_AGGREGATE_BASIC_INFORMATION_Type_e__Union_LegacyFilter_e__Struct
end
union FILTER_AGGREGATE_STANDARD_INFORMATION_Type_e__Union
  mini_filter : FILTER_AGGREGATE_STANDARD_INFORMATION_Type_e__Union_MiniFilter_e__Struct
  legacy_filter : FILTER_AGGREGATE_STANDARD_INFORMATION_Type_e__Union_LegacyFilter_e__Struct
end
union INSTANCE_AGGREGATE_STANDARD_INFORMATION_Type_e__Union
  mini_filter : INSTANCE_AGGREGATE_STANDARD_INFORMATION_Type_e__Union_MiniFilter_e__Struct
  legacy_filter : INSTANCE_AGGREGATE_STANDARD_INFORMATION_Type_e__Union_LegacyFilter_e__Struct
end

  struct FILTER_FULL_INFORMATION
    next_entry_offset : UInt32
    frame_id : UInt32
    number_of_instances : UInt32
    filter_name_length : UInt16
    filter_name_buffer : Char[0]*
  end
  struct FILTER_AGGREGATE_BASIC_INFORMATION
    next_entry_offset : UInt32
    flags : UInt32
    type : FILTER_AGGREGATE_BASIC_INFORMATION_Type_e__Union
  end
  struct FILTER_AGGREGATE_BASIC_INFORMATION_Type_e__Union_MiniFilter_e__Struct
    frame_id : UInt32
    number_of_instances : UInt32
    filter_name_length : UInt16
    filter_name_buffer_offset : UInt16
    filter_altitude_length : UInt16
    filter_altitude_buffer_offset : UInt16
  end
  struct FILTER_AGGREGATE_BASIC_INFORMATION_Type_e__Union_LegacyFilter_e__Struct
    filter_name_length : UInt16
    filter_name_buffer_offset : UInt16
  end
  struct FILTER_AGGREGATE_STANDARD_INFORMATION
    next_entry_offset : UInt32
    flags : UInt32
    type : FILTER_AGGREGATE_STANDARD_INFORMATION_Type_e__Union
  end
  struct FILTER_AGGREGATE_STANDARD_INFORMATION_Type_e__Union_MiniFilter_e__Struct
    flags : UInt32
    frame_id : UInt32
    number_of_instances : UInt32
    filter_name_length : UInt16
    filter_name_buffer_offset : UInt16
    filter_altitude_length : UInt16
    filter_altitude_buffer_offset : UInt16
  end
  struct FILTER_AGGREGATE_STANDARD_INFORMATION_Type_e__Union_LegacyFilter_e__Struct
    flags : UInt32
    filter_name_length : UInt16
    filter_name_buffer_offset : UInt16
    filter_altitude_length : UInt16
    filter_altitude_buffer_offset : UInt16
  end
  struct FILTER_VOLUME_BASIC_INFORMATION
    filter_volume_name_length : UInt16
    filter_volume_name : Char[0]*
  end
  struct FILTER_VOLUME_STANDARD_INFORMATION
    next_entry_offset : UInt32
    flags : UInt32
    frame_id : UInt32
    file_system_type : FLT_FILESYSTEM_TYPE
    filter_volume_name_length : UInt16
    filter_volume_name : Char[0]*
  end
  struct INSTANCE_BASIC_INFORMATION
    next_entry_offset : UInt32
    instance_name_length : UInt16
    instance_name_buffer_offset : UInt16
  end
  struct INSTANCE_PARTIAL_INFORMATION
    next_entry_offset : UInt32
    instance_name_length : UInt16
    instance_name_buffer_offset : UInt16
    altitude_length : UInt16
    altitude_buffer_offset : UInt16
  end
  struct INSTANCE_FULL_INFORMATION
    next_entry_offset : UInt32
    instance_name_length : UInt16
    instance_name_buffer_offset : UInt16
    altitude_length : UInt16
    altitude_buffer_offset : UInt16
    volume_name_length : UInt16
    volume_name_buffer_offset : UInt16
    filter_name_length : UInt16
    filter_name_buffer_offset : UInt16
  end
  struct INSTANCE_AGGREGATE_STANDARD_INFORMATION
    next_entry_offset : UInt32
    flags : UInt32
    type : INSTANCE_AGGREGATE_STANDARD_INFORMATION_Type_e__Union
  end
  struct INSTANCE_AGGREGATE_STANDARD_INFORMATION_Type_e__Union_MiniFilter_e__Struct
    flags : UInt32
    frame_id : UInt32
    volume_file_system_type : FLT_FILESYSTEM_TYPE
    instance_name_length : UInt16
    instance_name_buffer_offset : UInt16
    altitude_length : UInt16
    altitude_buffer_offset : UInt16
    volume_name_length : UInt16
    volume_name_buffer_offset : UInt16
    filter_name_length : UInt16
    filter_name_buffer_offset : UInt16
    supported_features : UInt32
  end
  struct INSTANCE_AGGREGATE_STANDARD_INFORMATION_Type_e__Union_LegacyFilter_e__Struct
    flags : UInt32
    altitude_length : UInt16
    altitude_buffer_offset : UInt16
    volume_name_length : UInt16
    volume_name_buffer_offset : UInt16
    filter_name_length : UInt16
    filter_name_buffer_offset : UInt16
    supported_features : UInt32
  end
  struct FILTER_MESSAGE_HEADER
    reply_length : UInt32
    message_id : UInt64
  end
  struct FILTER_REPLY_HEADER
    status : NTSTATUS
    message_id : UInt64
  end


  # Params # lpfiltername : LibC::LPWSTR [In]
  fun FilterLoad(lpfiltername : LibC::LPWSTR) : HRESULT

  # Params # lpfiltername : LibC::LPWSTR [In]
  fun FilterUnload(lpfiltername : LibC::LPWSTR) : HRESULT

  # Params # lpfiltername : LibC::LPWSTR [In],hfilter : HFILTER* [In]
  fun FilterCreate(lpfiltername : LibC::LPWSTR, hfilter : HFILTER*) : HRESULT

  # Params # hfilter : HFILTER [In]
  fun FilterClose(hfilter : HFILTER) : HRESULT

  # Params # lpfiltername : LibC::LPWSTR [In],lpvolumename : LibC::LPWSTR [In],lpinstancename : LibC::LPWSTR [In],hinstance : HFILTER_INSTANCE* [In]
  fun FilterInstanceCreate(lpfiltername : LibC::LPWSTR, lpvolumename : LibC::LPWSTR, lpinstancename : LibC::LPWSTR, hinstance : HFILTER_INSTANCE*) : HRESULT

  # Params # hinstance : HFILTER_INSTANCE [In]
  fun FilterInstanceClose(hinstance : HFILTER_INSTANCE) : HRESULT

  # Params # lpfiltername : LibC::LPWSTR [In],lpvolumename : LibC::LPWSTR [In],lpinstancename : LibC::LPWSTR [In],dwcreatedinstancenamelength : UInt32 [In],lpcreatedinstancename : LibC::LPWSTR [In]
  fun FilterAttach(lpfiltername : LibC::LPWSTR, lpvolumename : LibC::LPWSTR, lpinstancename : LibC::LPWSTR, dwcreatedinstancenamelength : UInt32, lpcreatedinstancename : LibC::LPWSTR) : HRESULT

  # Params # lpfiltername : LibC::LPWSTR [In],lpvolumename : LibC::LPWSTR [In],lpaltitude : LibC::LPWSTR [In],lpinstancename : LibC::LPWSTR [In],dwcreatedinstancenamelength : UInt32 [In],lpcreatedinstancename : LibC::LPWSTR [In]
  fun FilterAttachAtAltitude(lpfiltername : LibC::LPWSTR, lpvolumename : LibC::LPWSTR, lpaltitude : LibC::LPWSTR, lpinstancename : LibC::LPWSTR, dwcreatedinstancenamelength : UInt32, lpcreatedinstancename : LibC::LPWSTR) : HRESULT

  # Params # lpfiltername : LibC::LPWSTR [In],lpvolumename : LibC::LPWSTR [In],lpinstancename : LibC::LPWSTR [In]
  fun FilterDetach(lpfiltername : LibC::LPWSTR, lpvolumename : LibC::LPWSTR, lpinstancename : LibC::LPWSTR) : HRESULT

  # Params # dwinformationclass : FILTER_INFORMATION_CLASS [In],lpbuffer : Void* [In],dwbuffersize : UInt32 [In],lpbytesreturned : UInt32* [In],lpfilterfind : FilterFindHandle* [In]
  fun FilterFindFirst(dwinformationclass : FILTER_INFORMATION_CLASS, lpbuffer : Void*, dwbuffersize : UInt32, lpbytesreturned : UInt32*, lpfilterfind : FilterFindHandle*) : HRESULT

  # Params # hfilterfind : LibC::HANDLE [In],dwinformationclass : FILTER_INFORMATION_CLASS [In],lpbuffer : Void* [In],dwbuffersize : UInt32 [In],lpbytesreturned : UInt32* [In]
  fun FilterFindNext(hfilterfind : LibC::HANDLE, dwinformationclass : FILTER_INFORMATION_CLASS, lpbuffer : Void*, dwbuffersize : UInt32, lpbytesreturned : UInt32*) : HRESULT

  # Params # hfilterfind : LibC::HANDLE [In]
  fun FilterFindClose(hfilterfind : LibC::HANDLE) : HRESULT

  # Params # dwinformationclass : FILTER_VOLUME_INFORMATION_CLASS [In],lpbuffer : Void* [In],dwbuffersize : UInt32 [In],lpbytesreturned : UInt32* [In],lpvolumefind : FilterVolumeFindHandle* [In]
  fun FilterVolumeFindFirst(dwinformationclass : FILTER_VOLUME_INFORMATION_CLASS, lpbuffer : Void*, dwbuffersize : UInt32, lpbytesreturned : UInt32*, lpvolumefind : FilterVolumeFindHandle*) : HRESULT

  # Params # hvolumefind : LibC::HANDLE [In],dwinformationclass : FILTER_VOLUME_INFORMATION_CLASS [In],lpbuffer : Void* [In],dwbuffersize : UInt32 [In],lpbytesreturned : UInt32* [In]
  fun FilterVolumeFindNext(hvolumefind : LibC::HANDLE, dwinformationclass : FILTER_VOLUME_INFORMATION_CLASS, lpbuffer : Void*, dwbuffersize : UInt32, lpbytesreturned : UInt32*) : HRESULT

  # Params # hvolumefind : LibC::HANDLE [In]
  fun FilterVolumeFindClose(hvolumefind : LibC::HANDLE) : HRESULT

  # Params # lpfiltername : LibC::LPWSTR [In],dwinformationclass : INSTANCE_INFORMATION_CLASS [In],lpbuffer : Void* [In],dwbuffersize : UInt32 [In],lpbytesreturned : UInt32* [In],lpfilterinstancefind : FilterInstanceFindHandle* [In]
  fun FilterInstanceFindFirst(lpfiltername : LibC::LPWSTR, dwinformationclass : INSTANCE_INFORMATION_CLASS, lpbuffer : Void*, dwbuffersize : UInt32, lpbytesreturned : UInt32*, lpfilterinstancefind : FilterInstanceFindHandle*) : HRESULT

  # Params # hfilterinstancefind : LibC::HANDLE [In],dwinformationclass : INSTANCE_INFORMATION_CLASS [In],lpbuffer : Void* [In],dwbuffersize : UInt32 [In],lpbytesreturned : UInt32* [In]
  fun FilterInstanceFindNext(hfilterinstancefind : LibC::HANDLE, dwinformationclass : INSTANCE_INFORMATION_CLASS, lpbuffer : Void*, dwbuffersize : UInt32, lpbytesreturned : UInt32*) : HRESULT

  # Params # hfilterinstancefind : LibC::HANDLE [In]
  fun FilterInstanceFindClose(hfilterinstancefind : LibC::HANDLE) : HRESULT

  # Params # lpvolumename : LibC::LPWSTR [In],dwinformationclass : INSTANCE_INFORMATION_CLASS [In],lpbuffer : Void* [In],dwbuffersize : UInt32 [In],lpbytesreturned : UInt32* [In],lpvolumeinstancefind : FilterVolumeInstanceFindHandle* [In]
  fun FilterVolumeInstanceFindFirst(lpvolumename : LibC::LPWSTR, dwinformationclass : INSTANCE_INFORMATION_CLASS, lpbuffer : Void*, dwbuffersize : UInt32, lpbytesreturned : UInt32*, lpvolumeinstancefind : FilterVolumeInstanceFindHandle*) : HRESULT

  # Params # hvolumeinstancefind : LibC::HANDLE [In],dwinformationclass : INSTANCE_INFORMATION_CLASS [In],lpbuffer : Void* [In],dwbuffersize : UInt32 [In],lpbytesreturned : UInt32* [In]
  fun FilterVolumeInstanceFindNext(hvolumeinstancefind : LibC::HANDLE, dwinformationclass : INSTANCE_INFORMATION_CLASS, lpbuffer : Void*, dwbuffersize : UInt32, lpbytesreturned : UInt32*) : HRESULT

  # Params # hvolumeinstancefind : LibC::HANDLE [In]
  fun FilterVolumeInstanceFindClose(hvolumeinstancefind : LibC::HANDLE) : HRESULT

  # Params # hfilter : HFILTER [In],dwinformationclass : FILTER_INFORMATION_CLASS [In],lpbuffer : Void* [In],dwbuffersize : UInt32 [In],lpbytesreturned : UInt32* [In]
  fun FilterGetInformation(hfilter : HFILTER, dwinformationclass : FILTER_INFORMATION_CLASS, lpbuffer : Void*, dwbuffersize : UInt32, lpbytesreturned : UInt32*) : HRESULT

  # Params # hinstance : HFILTER_INSTANCE [In],dwinformationclass : INSTANCE_INFORMATION_CLASS [In],lpbuffer : Void* [In],dwbuffersize : UInt32 [In],lpbytesreturned : UInt32* [In]
  fun FilterInstanceGetInformation(hinstance : HFILTER_INSTANCE, dwinformationclass : INSTANCE_INFORMATION_CLASS, lpbuffer : Void*, dwbuffersize : UInt32, lpbytesreturned : UInt32*) : HRESULT

  # Params # lpportname : LibC::LPWSTR [In],dwoptions : UInt32 [In],lpcontext : Void* [In],wsizeofcontext : UInt16 [In],lpsecurityattributes : SECURITY_ATTRIBUTES* [In],hport : LibC::HANDLE* [In]
  fun FilterConnectCommunicationPort(lpportname : LibC::LPWSTR, dwoptions : UInt32, lpcontext : Void*, wsizeofcontext : UInt16, lpsecurityattributes : SECURITY_ATTRIBUTES*, hport : LibC::HANDLE*) : HRESULT

  # Params # hport : LibC::HANDLE [In],lpinbuffer : Void* [In],dwinbuffersize : UInt32 [In],lpoutbuffer : Void* [In],dwoutbuffersize : UInt32 [In],lpbytesreturned : UInt32* [In]
  fun FilterSendMessage(hport : LibC::HANDLE, lpinbuffer : Void*, dwinbuffersize : UInt32, lpoutbuffer : Void*, dwoutbuffersize : UInt32, lpbytesreturned : UInt32*) : HRESULT

  # Params # hport : LibC::HANDLE [In],lpmessagebuffer : FILTER_MESSAGE_HEADER* [In],dwmessagebuffersize : UInt32 [In],lpoverlapped : OVERLAPPED* [In]
  fun FilterGetMessage(hport : LibC::HANDLE, lpmessagebuffer : FILTER_MESSAGE_HEADER*, dwmessagebuffersize : UInt32, lpoverlapped : OVERLAPPED*) : HRESULT

  # Params # hport : LibC::HANDLE [In],lpreplybuffer : FILTER_REPLY_HEADER* [In],dwreplybuffersize : UInt32 [In]
  fun FilterReplyMessage(hport : LibC::HANDLE, lpreplybuffer : FILTER_REPLY_HEADER*, dwreplybuffersize : UInt32) : HRESULT

  # Params # lpvolumename : LibC::LPWSTR [In],lpdosname : Char* [In],dwdosnamebuffersize : UInt32 [In]
  fun FilterGetDosName(lpvolumename : LibC::LPWSTR, lpdosname : Char*, dwdosnamebuffersize : UInt32) : HRESULT
end
