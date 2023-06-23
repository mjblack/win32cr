require "../foundation.cr"
require "../system/com/structuredstorage.cr"
require "../system/com.cr"
require "../system/ole.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32
  IOCTL_MTP_CUSTOM_COMMAND = 827348045_u32
  MTP_NEXTPHASE_READ_DATA = 1_u32
  MTP_NEXTPHASE_WRITE_DATA = 2_u32
  MTP_NEXTPHASE_NO_DATA = 3_u32
  RSA_KEY_LEN = 64_u32
  SAC_SESSION_KEYLEN = 8_u32
  SAC_PROTOCOL_WMDM = 1_u32
  SAC_PROTOCOL_V1 = 2_u32
  SAC_CERT_X509 = 1_u32
  SAC_CERT_V1 = 2_u32
  WMDM_DEVICE_PROTOCOL_MTP = "979e54e5-0afc-4604-8d93-dc798a4bcf45"
  WMDM_DEVICE_PROTOCOL_RAPI = "2a11ed91-8c8f-41e4-82d1-8386e003561c"
  WMDM_DEVICE_PROTOCOL_MSC = "a4d2c26c-a881-44bb-bd5d-1f703c71f7a9"
  WMDM_SERVICE_PROVIDER_VENDOR_MICROSOFT = "7de8686d-78ee-43ea-a496-c625ac91cc5d"
  WMDMID_LENGTH = 128_u32
  WMDM_MAC_LENGTH = 8_u32
  WMDM_S_NOT_ALL_PROPERTIES_APPLIED = 282625_i32
  WMDM_S_NOT_ALL_PROPERTIES_RETRIEVED = 282626_i32
  WMDM_E_BUSY = -2147201024_i32
  WMDM_E_INTERFACEDEAD = -2147201023_i32
  WMDM_E_INVALIDTYPE = -2147201022_i32
  WMDM_E_PROCESSFAILED = -2147201021_i32
  WMDM_E_NOTSUPPORTED = -2147201020_i32
  WMDM_E_NOTCERTIFIED = -2147201019_i32
  WMDM_E_NORIGHTS = -2147201018_i32
  WMDM_E_CALL_OUT_OF_SEQUENCE = -2147201017_i32
  WMDM_E_BUFFERTOOSMALL = -2147201016_i32
  WMDM_E_MOREDATA = -2147201015_i32
  WMDM_E_MAC_CHECK_FAILED = -2147201014_i32
  WMDM_E_USER_CANCELLED = -2147201013_i32
  WMDM_E_SDMI_TRIGGER = -2147201012_i32
  WMDM_E_SDMI_NOMORECOPIES = -2147201011_i32
  WMDM_E_REVOKED = -2147201010_i32
  WMDM_E_LICENSE_NOTEXIST = -2147201009_i32
  WMDM_E_INCORRECT_APPSEC = -2147201008_i32
  WMDM_E_INCORRECT_RIGHTS = -2147201007_i32
  WMDM_E_LICENSE_EXPIRED = -2147201006_i32
  WMDM_E_CANTOPEN_PMSN_SERVICE_PIPE = -2147201005_i32
  WMDM_E_TOO_MANY_SESSIONS = -2147201005_i32
  WMDM_WMDM_REVOKED = 1_u32
  WMDM_APP_REVOKED = 2_u32
  WMDM_SP_REVOKED = 4_u32
  WMDM_SCP_REVOKED = 8_u32
  WMDM_GET_FORMAT_SUPPORT_AUDIO = 1_u32
  WMDM_GET_FORMAT_SUPPORT_VIDEO = 2_u32
  WMDM_GET_FORMAT_SUPPORT_FILE = 4_u32
  WMDM_RIGHTS_PLAYBACKCOUNT = 1_u32
  WMDM_RIGHTS_EXPIRATIONDATE = 2_u32
  WMDM_RIGHTS_GROUPID = 4_u32
  WMDM_RIGHTS_FREESERIALIDS = 8_u32
  WMDM_RIGHTS_NAMEDSERIALIDS = 16_u32
  WMDM_DEVICE_TYPE_PLAYBACK = 1_u32
  WMDM_DEVICE_TYPE_RECORD = 2_u32
  WMDM_DEVICE_TYPE_DECODE = 4_u32
  WMDM_DEVICE_TYPE_ENCODE = 8_u32
  WMDM_DEVICE_TYPE_STORAGE = 16_u32
  WMDM_DEVICE_TYPE_VIRTUAL = 32_u32
  WMDM_DEVICE_TYPE_SDMI = 64_u32
  WMDM_DEVICE_TYPE_NONSDMI = 128_u32
  WMDM_DEVICE_TYPE_NONREENTRANT = 256_u32
  WMDM_DEVICE_TYPE_FILELISTRESYNC = 512_u32
  WMDM_DEVICE_TYPE_VIEW_PREF_METADATAVIEW = 1024_u32
  WMDM_POWER_CAP_BATTERY = 1_u32
  WMDM_POWER_CAP_EXTERNAL = 2_u32
  WMDM_POWER_IS_BATTERY = 4_u32
  WMDM_POWER_IS_EXTERNAL = 8_u32
  WMDM_POWER_PERCENT_AVAILABLE = 16_u32
  WMDM_STATUS_READY = 1_u32
  WMDM_STATUS_BUSY = 2_u32
  WMDM_STATUS_DEVICE_NOTPRESENT = 4_u32
  WMDM_STATUS_DEVICECONTROL_PLAYING = 8_u32
  WMDM_STATUS_DEVICECONTROL_RECORDING = 16_u32
  WMDM_STATUS_DEVICECONTROL_PAUSED = 32_u32
  WMDM_STATUS_DEVICECONTROL_REMOTE = 64_u32
  WMDM_STATUS_DEVICECONTROL_STREAM = 128_u32
  WMDM_STATUS_STORAGE_NOTPRESENT = 256_u32
  WMDM_STATUS_STORAGE_INITIALIZING = 512_u32
  WMDM_STATUS_STORAGE_BROKEN = 1024_u32
  WMDM_STATUS_STORAGE_NOTSUPPORTED = 2048_u32
  WMDM_STATUS_STORAGE_UNFORMATTED = 4096_u32
  WMDM_STATUS_STORAGECONTROL_INSERTING = 8192_u32
  WMDM_STATUS_STORAGECONTROL_DELETING = 16384_u32
  WMDM_STATUS_STORAGECONTROL_APPENDING = 32768_u32
  WMDM_STATUS_STORAGECONTROL_MOVING = 65536_u32
  WMDM_STATUS_STORAGECONTROL_READING = 131072_u32
  WMDM_DEVICECAP_CANPLAY = 1_u32
  WMDM_DEVICECAP_CANSTREAMPLAY = 2_u32
  WMDM_DEVICECAP_CANRECORD = 4_u32
  WMDM_DEVICECAP_CANSTREAMRECORD = 8_u32
  WMDM_DEVICECAP_CANPAUSE = 16_u32
  WMDM_DEVICECAP_CANRESUME = 32_u32
  WMDM_DEVICECAP_CANSTOP = 64_u32
  WMDM_DEVICECAP_CANSEEK = 128_u32
  WMDM_DEVICECAP_HASSECURECLOCK = 256_u32
  WMDM_SEEK_REMOTECONTROL = 1_u32
  WMDM_SEEK_STREAMINGAUDIO = 2_u32
  WMDM_STORAGE_ATTR_FILESYSTEM = 1_u32
  WMDM_STORAGE_ATTR_REMOVABLE = 2_u32
  WMDM_STORAGE_ATTR_NONREMOVABLE = 4_u32
  WMDM_FILE_ATTR_FOLDER = 8_u32
  WMDM_FILE_ATTR_LINK = 16_u32
  WMDM_FILE_ATTR_FILE = 32_u32
  WMDM_FILE_ATTR_VIDEO = 64_u32
  WMDM_STORAGE_ATTR_CANEDITMETADATA = 128_u32
  WMDM_STORAGE_ATTR_FOLDERS = 256_u32
  WMDM_FILE_ATTR_AUDIO = 4096_u32
  WMDM_FILE_ATTR_DATA = 8192_u32
  WMDM_FILE_ATTR_CANPLAY = 16384_u32
  WMDM_FILE_ATTR_CANDELETE = 32768_u32
  WMDM_FILE_ATTR_CANMOVE = 65536_u32
  WMDM_FILE_ATTR_CANRENAME = 131072_u32
  WMDM_FILE_ATTR_CANREAD = 262144_u32
  WMDM_FILE_ATTR_MUSIC = 524288_u32
  WMDM_FILE_CREATE_OVERWRITE = 1048576_u32
  WMDM_FILE_ATTR_AUDIOBOOK = 2097152_u32
  WMDM_FILE_ATTR_HIDDEN = 4194304_u32
  WMDM_FILE_ATTR_SYSTEM = 8388608_u32
  WMDM_FILE_ATTR_READONLY = 16777216_u32
  WMDM_STORAGE_ATTR_HAS_FOLDERS = 33554432_u32
  WMDM_STORAGE_ATTR_HAS_FILES = 67108864_u32
  WMDM_STORAGE_IS_DEFAULT = 134217728_u32
  WMDM_STORAGE_CONTAINS_DEFAULT = 268435456_u32
  WMDM_STORAGE_ATTR_VIRTUAL = 536870912_u32
  WMDM_STORAGECAP_FOLDERSINROOT = 1_u32
  WMDM_STORAGECAP_FILESINROOT = 2_u32
  WMDM_STORAGECAP_FOLDERSINFOLDERS = 4_u32
  WMDM_STORAGECAP_FILESINFOLDERS = 8_u32
  WMDM_STORAGECAP_FOLDERLIMITEXISTS = 16_u32
  WMDM_STORAGECAP_FILELIMITEXISTS = 32_u32
  WMDM_STORAGECAP_NOT_INITIALIZABLE = 64_u32
  WMDM_MODE_BLOCK = 1_u32
  WMDM_MODE_THREAD = 2_u32
  WMDM_CONTENT_FILE = 4_u32
  WMDM_CONTENT_FOLDER = 8_u32
  WMDM_CONTENT_OPERATIONINTERFACE = 16_u32
  WMDM_MODE_QUERY = 32_u32
  WMDM_MODE_PROGRESS = 64_u32
  WMDM_MODE_TRANSFER_PROTECTED = 128_u32
  WMDM_MODE_TRANSFER_UNPROTECTED = 256_u32
  WMDM_STORAGECONTROL_INSERTBEFORE = 512_u32
  WMDM_STORAGECONTROL_INSERTAFTER = 1024_u32
  WMDM_STORAGECONTROL_INSERTINTO = 2048_u32
  WMDM_MODE_RECURSIVE = 4096_u32
  WMDM_RIGHTS_PLAY_ON_PC = 1_u32
  WMDM_RIGHTS_COPY_TO_NON_SDMI_DEVICE = 2_u32
  WMDM_RIGHTS_COPY_TO_CD = 8_u32
  WMDM_RIGHTS_COPY_TO_SDMI_DEVICE = 16_u32
  WMDM_SEEK_BEGIN = 1_u32
  WMDM_SEEK_CURRENT = 2_u32
  WMDM_SEEK_END = 8_u32
  DO_NOT_VIRTUALIZE_STORAGES_AS_DEVICES = 1_u32
  ALLOW_OUTOFBAND_NOTIFICATION = 2_u32
  MDSP_READ = 1_u32
  MDSP_WRITE = 2_u32
  MDSP_SEEK_BOF = 1_u32
  MDSP_SEEK_CUR = 2_u32
  MDSP_SEEK_EOF = 4_u32
  WMDM_SCP_EXAMINE_EXTENSION = 1_i32
  WMDM_SCP_EXAMINE_DATA = 2_i32
  WMDM_SCP_DECIDE_DATA = 8_i32
  WMDM_SCP_PROTECTED_OUTPUT = 16_i32
  WMDM_SCP_UNPROTECTED_OUTPUT = 32_i32
  WMDM_SCP_RIGHTS_DATA = 64_i32
  WMDM_SCP_TRANSFER_OBJECTDATA = 32_i32
  WMDM_SCP_NO_MORE_CHANGES = 64_i32
  WMDM_SCP_DRMINFO_NOT_DRMPROTECTED = 0_i32
  WMDM_SCP_DRMINFO_V1HEADER = 1_i32
  WMDM_SCP_DRMINFO_V2HEADER = 2_i32
  SCP_EVENTID_ACQSECURECLOCK = "86248cc9-4a59-43e2-9146-48a7f3f4140c"
  SCP_EVENTID_NEEDTOINDIV = "87a507c7-b469-4386-b976-d5d1ce538a6f"
  SCP_EVENTID_DRMINFO = "213dd287-41d2-432b-9e3f-3b4f7b3581dd"
  SCP_PARAMID_DRMVERSION = "41d0155d-7cc7-4217-ada9-005074624da4"
  SAC_MAC_LEN = 8_u32
  WMDM_LOG_SEV_INFO = 1_u32
  WMDM_LOG_SEV_WARN = 2_u32
  WMDM_LOG_SEV_ERROR = 4_u32
  WMDM_LOG_NOTIMESTAMP = 16_u32
  G_wszwmdmfilename = "WMDM/FileName"
  G_wszwmdmformatcode = "WMDM/FormatCode"
  G_wszwmdmlastmodifieddate = "WMDM/LastModifiedDate"
  G_wszwmdmfilecreationdate = "WMDM/FileCreationDate"
  G_wszwmdmfilesize = "WMDM/FileSize"
  G_wszwmdmfileattributes = "WMDM/FileAttributes"
  G_wszaudiowavecodec = "WMDM/AudioWAVECodec"
  G_wszvideofourcccodec = "WMDM/VideoFourCCCodec"
  G_wszwmdmtitle = "WMDM/Title"
  G_wszwmdmauthor = "WMDM/Author"
  G_wszwmdmdescription = "WMDM/Description"
  G_wszwmdmisprotected = "WMDM/IsProtected"
  G_wszwmdmalbumtitle = "WMDM/AlbumTitle"
  G_wszwmdmalbumartist = "WMDM/AlbumArtist"
  G_wszwmdmtrack = "WMDM/Track"
  G_wszwmdmgenre = "WMDM/Genre"
  G_wszwmdmtrackmood = "WMDM/TrackMood"
  G_wszwmdmalbumcoverformat = "WMDM/AlbumCoverFormat"
  G_wszwmdmalbumcoversize = "WMDM/AlbumCoverSize"
  G_wszwmdmalbumcoverheight = "WMDM/AlbumCoverHeight"
  G_wszwmdmalbumcoverwidth = "WMDM/AlbumCoverWidth"
  G_wszwmdmalbumcoverduration = "WMDM/AlbumCoverDuration"
  G_wszwmdmalbumcoverdata = "WMDM/AlbumCoverData"
  G_wszwmdmyear = "WMDM/Year"
  G_wszwmdmcomposer = "WMDM/Composer"
  G_wszwmdmcodec = "WMDM/Codec"
  G_wszwmdmdrmid = "WMDM/DRMId"
  G_wszwmdmbitrate = "WMDM/Bitrate"
  G_wszwmdmbitratetype = "WMDM/BitRateType"
  G_wszwmdmsamplerate = "WMDM/SampleRate"
  G_wszwmdmnumchannels = "WMDM/NumChannels"
  G_wszwmdmblockalignment = "WMDM/BlockAlignment"
  G_wszwmdmaudiobitdepth = "WMDM/AudioBitDepth"
  G_wszwmdmtotalbitrate = "WMDM/TotalBitrate"
  G_wszwmdmvideobitrate = "WMDM/VideoBitrate"
  G_wszwmdmframerate = "WMDM/FrameRate"
  G_wszwmdmscantype = "WMDM/ScanType"
  G_wszwmdmkeyframedistance = "WMDM/KeyFrameDistance"
  G_wszwmdmbuffersize = "WMDM/BufferSize"
  G_wszwmdmqualitysetting = "WMDM/QualitySetting"
  G_wszwmdmencodingprofile = "WMDM/EncodingProfile"
  G_wszwmdmduration = "WMDM/Duration"
  G_wszwmdmalbumart = "WMDM/AlbumArt"
  G_wszwmdmbuynow = "WMDM/BuyNow"
  G_wszwmdmnonconsumable = "WMDM/NonConsumable"
  G_wszwmdmediaclassprimaryid = "WMDM/MediaClassPrimaryID"
  G_wszwmdmmediaclasssecondaryid = "WMDM/MediaClassSecondaryID"
  G_wszwmdmusereffectiverating = "WMDM/UserEffectiveRating"
  G_wszwmdmuserrating = "WMDM/UserRating"
  G_wszwmdmuserratingondevice = "WMDM/UserRatingOnDevice"
  G_wszwmdmplaycount = "WMDM/PlayCount"
  G_wszwmdmdeviceplaycount = "WMDM/DevicePlayCount"
  G_wszwmdmauthordate = "WMDM/AuthorDate"
  G_wszwmdmuserlastplaytime = "WMDM/UserLastPlayTime"
  G_wszwmdmsubtitle = "WMDM/SubTitle"
  G_wszwmdmsubtitledescription = "WMDM/SubTitleDescription"
  G_wszwmdmmediacredits = "WMDM/MediaCredits"
  G_wszwmdmmediastationname = "WMDM/MediaStationName"
  G_wszwmdmmediaoriginalchannel = "WMDM/MediaOriginalChannel"
  G_wszwmdmmediaoriginalbroadcastdatetime = "WMDM/MediaOriginalBroadcastDateTime"
  G_wszwmdmprovidercopyright = "WMDM/ProviderCopyright"
  G_wszwmdmsyncid = "WMDM/SyncID"
  G_wszwmdmpersistentuniqueid = "WMDM/PersistentUniqueID"
  G_wszwmdmwidth = "WMDM/Width"
  G_wszwmdmheight = "WMDM/Height"
  G_wszwmdmsynctime = "WMDM/SyncTime"
  G_wszwmdmparentalrating = "WMDM/ParentalRating"
  G_wszwmdmmetagenre = "WMDM/MetaGenre"
  G_wszwmdmisrepeat = "WMDM/IsRepeat"
  G_wszwmdmsupporteddeviceproperties = "WMDM/SupportedDeviceProperties"
  G_wszwmdmdevicefriendlyname = "WMDM/DeviceFriendlyName"
  G_wszwmdmformatssupported = "WMDM/FormatsSupported"
  G_wszwmdmformatssupportedareordered = "WMDM/FormatsSupportedAreOrdered"
  G_wszwmdmsyncrelationshipid = "WMDM/SyncRelationshipID"
  G_wszwmdmdevicemodelname = "WMDM/DeviceModelName"
  G_wszwmdmdevicefirmwareversion = "WMDM/DeviceFirmwareVersion"
  G_wszwmdmdevicevendorextension = "WMDM/DeviceVendorExtension"
  G_wszwmdmdeviceprotocol = "WMDM/DeviceProtocol"
  G_wszwmdmdeviceserviceprovidervendor = "WMDM/DeviceServiceProviderVendor"
  G_wszwmdmdevicerevocationinfo = "WMDM/DeviceRevocationInfo"
  G_wszwmdmcollectionid = "WMDM/CollectionID"
  G_wszwmdmowner = "WMDM/Owner"
  G_wszwmdmeditor = "WMDM/Editor"
  G_wszwmdmwebmaster = "WMDM/Webmaster"
  G_wszwmdmsourceurl = "WMDM/SourceURL"
  G_wszwmdmdestinationurl = "WMDM/DestinationURL"
  G_wszwmdmcategory = "WMDM/Category"
  G_wszwmdmtimebookmark = "WMDM/TimeBookmark"
  G_wszwmdmobjectbookmark = "WMDM/ObjectBookmark"
  G_wszwmdmbytebookmark = "WMDM/ByteBookmark"
  G_wszwmdmdataoffset = "WMDM/DataOffset"
  G_wszwmdmdatalength = "WMDM/DataLength"
  G_wszwmdmdataunits = "WMDM/DataUnits"
  G_wszwmdmtimetolive = "WMDM/TimeToLive"
  G_wszwmdmmediaguid = "WMDM/MediaGuid"
  G_wszwpdpassthroughpropertyvalues = "WPD/PassthroughPropertyValues"
  EVENT_WMDM_CONTENT_TRANSFER = "339c9bf4-bcfe-4ed8-94df-eaf8c26ab61b"
  MTP_COMMAND_MAX_PARAMS = 5_u32
  MTP_RESPONSE_MAX_PARAMS = 5_u32
  MTP_RESPONSE_OK = 8193_u16
  CLSID_MediaDevMgrClassFactory = LibC::GUID.new(0x50040c1d_u32, 0xbdbf_u16, 0x4924_u16, StaticArray[0xb8_u8, 0x73_u8, 0xf1_u8, 0x4d_u8, 0x6c_u8, 0x5b_u8, 0xfd_u8, 0x66_u8])
  CLSID_MediaDevMgr = LibC::GUID.new(0x25baad81_u32, 0x3560_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x71_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  CLSID_WMDMDevice = LibC::GUID.new(0x807b3cdf_u32, 0x357a_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x71_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  CLSID_WMDMStorage = LibC::GUID.new(0x807b3ce0_u32, 0x357a_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x71_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  CLSID_WMDMStorageGlobal = LibC::GUID.new(0x807b3ce1_u32, 0x357a_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x71_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  CLSID_WMDMDeviceEnum = LibC::GUID.new(0x430e35af_u32, 0x3971_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x74_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  CLSID_WMDMStorageEnum = LibC::GUID.new(0xeb401a3b_u32, 0x3af7_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x74_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  CLSID_WMDMLogger = LibC::GUID.new(0x110a3202_u32, 0x5a79_u16, 0x11d3_u16, StaticArray[0x8d_u8, 0x78_u8, 0x44_u8, 0x45_u8, 0x53_u8, 0x54_u8, 0x0_u8, 0x0_u8])


  enum WMDM_TAG_DATATYPE : Int32
    WMDM_TYPE_DWORD = 0
    WMDM_TYPE_STRING = 1
    WMDM_TYPE_BINARY = 2
    WMDM_TYPE_BOOL = 3
    WMDM_TYPE_QWORD = 4
    WMDM_TYPE_WORD = 5
    WMDM_TYPE_GUID = 6
    WMDM_TYPE_DATE = 7
  end

  enum WMDM_SESSION_TYPE : Int32
    WMDM_SESSION_NONE = 0
    WMDM_SESSION_TRANSFER_TO_DEVICE = 1
    WMDM_SESSION_TRANSFER_FROM_DEVICE = 16
    WMDM_SESSION_DELETE = 256
    WMDM_SESSION_CUSTOM = 4096
  end

  enum WMDM_STORAGE_ENUM_MODE : Int32
    ENUM_MODE_RAW = 0
    ENUM_MODE_USE_DEVICE_PREF = 1
    ENUM_MODE_METADATA_VIEWS = 2
  end

  enum WMDM_FORMATCODE : Int32
    WMDM_FORMATCODE_NOTUSED = 0
    WMDM_FORMATCODE_ALLIMAGES = -1
    WMDM_FORMATCODE_UNDEFINED = 12288
    WMDM_FORMATCODE_ASSOCIATION = 12289
    WMDM_FORMATCODE_SCRIPT = 12290
    WMDM_FORMATCODE_EXECUTABLE = 12291
    WMDM_FORMATCODE_TEXT = 12292
    WMDM_FORMATCODE_HTML = 12293
    WMDM_FORMATCODE_DPOF = 12294
    WMDM_FORMATCODE_AIFF = 12295
    WMDM_FORMATCODE_WAVE = 12296
    WMDM_FORMATCODE_MP3 = 12297
    WMDM_FORMATCODE_AVI = 12298
    WMDM_FORMATCODE_MPEG = 12299
    WMDM_FORMATCODE_ASF = 12300
    WMDM_FORMATCODE_RESERVED_FIRST = 12301
    WMDM_FORMATCODE_RESERVED_LAST = 14335
    WMDM_FORMATCODE_IMAGE_UNDEFINED = 14336
    WMDM_FORMATCODE_IMAGE_EXIF = 14337
    WMDM_FORMATCODE_IMAGE_TIFFEP = 14338
    WMDM_FORMATCODE_IMAGE_FLASHPIX = 14339
    WMDM_FORMATCODE_IMAGE_BMP = 14340
    WMDM_FORMATCODE_IMAGE_CIFF = 14341
    WMDM_FORMATCODE_IMAGE_GIF = 14343
    WMDM_FORMATCODE_IMAGE_JFIF = 14344
    WMDM_FORMATCODE_IMAGE_PCD = 14345
    WMDM_FORMATCODE_IMAGE_PICT = 14346
    WMDM_FORMATCODE_IMAGE_PNG = 14347
    WMDM_FORMATCODE_IMAGE_TIFF = 14349
    WMDM_FORMATCODE_IMAGE_TIFFIT = 14350
    WMDM_FORMATCODE_IMAGE_JP2 = 14351
    WMDM_FORMATCODE_IMAGE_JPX = 14352
    WMDM_FORMATCODE_IMAGE_RESERVED_FIRST = 14353
    WMDM_FORMATCODE_IMAGE_RESERVED_LAST = 16383
    WMDM_FORMATCODE_UNDEFINEDFIRMWARE = 47106
    WMDM_FORMATCODE_WBMP = 47107
    WMDM_FORMATCODE_JPEGXR = 47108
    WMDM_FORMATCODE_WINDOWSIMAGEFORMAT = 47233
    WMDM_FORMATCODE_UNDEFINEDAUDIO = 47360
    WMDM_FORMATCODE_WMA = 47361
    WMDM_FORMATCODE_OGG = 47362
    WMDM_FORMATCODE_AAC = 47363
    WMDM_FORMATCODE_AUDIBLE = 47364
    WMDM_FORMATCODE_FLAC = 47366
    WMDM_FORMATCODE_QCELP = 47367
    WMDM_FORMATCODE_AMR = 47368
    WMDM_FORMATCODE_UNDEFINEDVIDEO = 47488
    WMDM_FORMATCODE_WMV = 47489
    WMDM_FORMATCODE_MP4 = 47490
    WMDM_FORMATCODE_MP2 = 47491
    WMDM_FORMATCODE_3GP = 47492
    WMDM_FORMATCODE_3G2 = 47493
    WMDM_FORMATCODE_AVCHD = 47494
    WMDM_FORMATCODE_ATSCTS = 47495
    WMDM_FORMATCODE_DVBTS = 47496
    WMDM_FORMATCODE_MKV = 47497
    WMDM_FORMATCODE_MKA = 47498
    WMDM_FORMATCODE_MK3D = 47499
    WMDM_FORMATCODE_UNDEFINEDCOLLECTION = 47616
    WMDM_FORMATCODE_ABSTRACTMULTIMEDIAALBUM = 47617
    WMDM_FORMATCODE_ABSTRACTIMAGEALBUM = 47618
    WMDM_FORMATCODE_ABSTRACTAUDIOALBUM = 47619
    WMDM_FORMATCODE_ABSTRACTVIDEOALBUM = 47620
    WMDM_FORMATCODE_ABSTRACTAUDIOVIDEOPLAYLIST = 47621
    WMDM_FORMATCODE_ABSTRACTCONTACTGROUP = 47622
    WMDM_FORMATCODE_ABSTRACTMESSAGEFOLDER = 47623
    WMDM_FORMATCODE_ABSTRACTCHAPTEREDPRODUCTION = 47624
    WMDM_FORMATCODE_MEDIA_CAST = 47627
    WMDM_FORMATCODE_WPLPLAYLIST = 47632
    WMDM_FORMATCODE_M3UPLAYLIST = 47633
    WMDM_FORMATCODE_MPLPLAYLIST = 47634
    WMDM_FORMATCODE_ASXPLAYLIST = 47635
    WMDM_FORMATCODE_PLSPLAYLIST = 47636
    WMDM_FORMATCODE_UNDEFINEDDOCUMENT = 47744
    WMDM_FORMATCODE_ABSTRACTDOCUMENT = 47745
    WMDM_FORMATCODE_XMLDOCUMENT = 47746
    WMDM_FORMATCODE_MICROSOFTWORDDOCUMENT = 47747
    WMDM_FORMATCODE_MHTCOMPILEDHTMLDOCUMENT = 47748
    WMDM_FORMATCODE_MICROSOFTEXCELSPREADSHEET = 47749
    WMDM_FORMATCODE_MICROSOFTPOWERPOINTDOCUMENT = 47750
    WMDM_FORMATCODE_UNDEFINEDMESSAGE = 47872
    WMDM_FORMATCODE_ABSTRACTMESSAGE = 47873
    WMDM_FORMATCODE_UNDEFINEDCONTACT = 48000
    WMDM_FORMATCODE_ABSTRACTCONTACT = 48001
    WMDM_FORMATCODE_VCARD2 = 48002
    WMDM_FORMATCODE_VCARD3 = 48003
    WMDM_FORMATCODE_UNDEFINEDCALENDARITEM = 48640
    WMDM_FORMATCODE_ABSTRACTCALENDARITEM = 48641
    WMDM_FORMATCODE_VCALENDAR1 = 48642
    WMDM_FORMATCODE_VCALENDAR2 = 48643
    WMDM_FORMATCODE_UNDEFINEDWINDOWSEXECUTABLE = 48768
    WMDM_FORMATCODE_M4A = 1297101889
    WMDM_FORMATCODE_3GPA = 860311617
    WMDM_FORMATCODE_3G2A = 860303937
    WMDM_FORMATCODE_SECTION = 48770
  end

  enum WMDM_ENUM_PROP_VALID_VALUES_FORM : Int32
    WMDM_ENUM_PROP_VALID_VALUES_ANY = 0
    WMDM_ENUM_PROP_VALID_VALUES_RANGE = 1
    WMDM_ENUM_PROP_VALID_VALUES_ENUM = 2
  end

  enum WMDM_FIND_SCOPE : Int32
    WMDM_FIND_SCOPE_GLOBAL = 0
    WMDM_FIND_SCOPE_IMMEDIATE_CHILDREN = 1
  end

  enum WMDMMessage : Int32
    WMDM_MSG_DEVICE_ARRIVAL = 0
    WMDM_MSG_DEVICE_REMOVAL = 1
    WMDM_MSG_MEDIA_ARRIVAL = 2
    WMDM_MSG_MEDIA_REMOVAL = 3
  end

  union WMDM_PROP_DESC_ValidValues_e__Union
    valid_values_range : WMDM_PROP_VALUES_RANGE
    enumerated_valid_values : WMDM_PROP_VALUES_ENUM
  end
  union WMDMDetermineMaxPropStringLen
    sz001 : Char[27]*
    sz002 : Char[31]*
    sz003 : Char[14]*
    sz004 : Char[16]*
    sz005 : Char[22]*
    sz006 : Char[14]*
    sz007 : Char[20]*
    sz008 : Char[20]*
    sz009 : Char[22]*
    sz010 : Char[11]*
    sz011 : Char[12]*
    sz012 : Char[17]*
    sz013 : Char[17]*
    sz014 : Char[16]*
    sz015 : Char[17]*
    sz016 : Char[11]*
    sz017 : Char[11]*
    sz018 : Char[15]*
    sz019 : Char[22]*
    sz020 : Char[20]*
    sz021 : Char[22]*
    sz022 : Char[21]*
    sz023 : Char[24]*
    sz024 : Char[20]*
    sz025 : Char[10]*
    sz026 : Char[14]*
    sz027 : Char[11]*
    sz028 : Char[11]*
    sz029 : Char[13]*
    sz030 : Char[17]*
    sz031 : Char[16]*
    sz032 : Char[17]*
    sz033 : Char[20]*
    sz034 : Char[19]*
    sz035 : Char[18]*
    sz036 : Char[18]*
    sz037 : Char[15]*
    sz041 : Char[14]*
    sz043 : Char[22]*
    sz044 : Char[16]*
    sz045 : Char[20]*
    sz046 : Char[14]*
    sz047 : Char[14]*
    sz048 : Char[12]*
    sz049 : Char[25]*
    sz050 : Char[26]*
    sz051 : Char[25]*
    sz052 : Char[16]*
    sz053 : Char[24]*
    sz054 : Char[15]*
    sz055 : Char[21]*
    sz056 : Char[16]*
    sz057 : Char[22]*
    sz058 : Char[14]*
    sz059 : Char[25]*
    sz060 : Char[18]*
    sz061 : Char[22]*
    sz062 : Char[26]*
    sz063 : Char[36]*
    sz064 : Char[23]*
    sz065 : Char[12]*
    sz066 : Char[24]*
    sz067 : Char[11]*
    sz068 : Char[12]*
    sz069 : Char[14]*
    sz070 : Char[20]*
    sz071 : Char[15]*
    sz072 : Char[14]*
    sz073 : Char[31]*
    sz074 : Char[24]*
    sz075 : Char[22]*
    sz076 : Char[24]*
    sz077 : Char[21]*
    sz078 : Char[27]*
    sz079 : Char[27]*
    sz080 : Char[20]*
    sz081 : Char[33]*
    sz082 : Char[21]*
    sz083 : Char[32]*
    sz084 : Char[26]*
    sz085 : Char[18]*
    sz086 : Char[30]*
  end

  struct MACINFO
    f_used : LibC::BOOL
    ab_mac_state : UInt8[36]*
  end
  struct WAVEFORMATEX
    w_format_tag : UInt16
    n_channels : UInt16
    n_samples_per_sec : UInt32
    n_avg_bytes_per_sec : UInt32
    n_block_align : UInt16
    w_bits_per_sample : UInt16
    cb_size : UInt16
  end
  struct BITMAPINFOHEADER
    bi_size : UInt32
    bi_width : Int32
    bi_height : Int32
    bi_planes : UInt16
    bi_bit_count : UInt16
    bi_compression : UInt32
    bi_size_image : UInt32
    bi_x_pels_per_meter : Int32
    bi_y_pels_per_meter : Int32
    bi_clr_used : UInt32
    bi_clr_important : UInt32
  end
  struct VIDEOINFOHEADER
    rc_source : RECT
    rc_target : RECT
    dw_bit_rate : UInt32
    dw_bit_error_rate : UInt32
    avg_time_per_frame : Int64
    bmi_header : BITMAPINFOHEADER
  end
  struct WMFILECAPABILITIES
    pwsz_mime_type : LibC::LPWSTR
    dw_reserved : UInt32
  end
  struct OPAQUECOMMAND
    guid_command : Guid
    dw_data_len : UInt32
    p_data : UInt8*
    ab_mac : UInt8[20]*
  end
  struct WMDMID
    cb_size : UInt32
    dw_vendor_id : UInt32
    p_id : UInt8[128]*
    serial_number_length : UInt32
  end
  struct WMDMDATETIME
    w_year : UInt16
    w_month : UInt16
    w_day : UInt16
    w_hour : UInt16
    w_minute : UInt16
    w_second : UInt16
  end
  struct WMDMRIGHTS
    cb_size : UInt32
    dw_content_type : UInt32
    fu_flags : UInt32
    fu_rights : UInt32
    dw_app_sec : UInt32
    dw_playback_count : UInt32
    expiration_date : WMDMDATETIME
  end
  struct WMDMMetadataView
    pwsz_view_name : LibC::LPWSTR
    n_depth : UInt32
    ppwsz_tags : UInt16**
  end
  struct WMDM_PROP_VALUES_RANGE
    range_min : PROPVARIANT
    range_max : PROPVARIANT
    range_step : PROPVARIANT
  end
  struct WMDM_PROP_VALUES_ENUM
    c_enum_values : UInt32
    p_values : PROPVARIANT*
  end
  struct WMDM_PROP_DESC
    pwsz_prop_name : LibC::LPWSTR
    valid_values_form : WMDM_ENUM_PROP_VALID_VALUES_FORM
    valid_values : WMDM_PROP_DESC_ValidValues_e__Union
  end
  struct WMDM_PROP_CONFIG
    n_preference : UInt32
    n_prop_desc : UInt32
    p_prop_desc : WMDM_PROP_DESC*
  end
  struct WMDM_FORMAT_CAPABILITY
    n_prop_config : UInt32
    p_configs : WMDM_PROP_CONFIG*
  end
  struct MTP_COMMAND_DATA_IN
    op_code : UInt16
    num_params : UInt32
    params : UInt32[5]*
    next_phase : UInt32
    command_write_data_size : UInt32
    command_write_data : UInt8[0]*
  end
  struct MTP_COMMAND_DATA_OUT
    response_code : UInt16
    num_params : UInt32
    params : UInt32[5]*
    command_read_data_size : UInt32
    command_read_data : UInt8[0]*
  end


  struct IWMDMMetaDataVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_item : UInt64
    query_by_name : UInt64
    query_by_index : UInt64
    get_item_count : UInt64
  end

  IWMDMMetaData_GUID = "ec3b0663-0951-460a-9a80-0dceed3c043c"
  IID_IWMDMMetaData = LibC::GUID.new(0xec3b0663_u32, 0x951_u16, 0x460a_u16, StaticArray[0x9a_u8, 0x80_u8, 0xd_u8, 0xce_u8, 0xed_u8, 0x3c_u8, 0x4_u8, 0x3c_u8])
  struct IWMDMMetaData
    lpVtbl : IWMDMMetaDataVTbl*
  end

  struct IWMDeviceManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_revision : UInt64
    get_device_count : UInt64
    enum_devices : UInt64
  end

  IWMDeviceManager_GUID = "1dcb3a00-33ed-11d3-8470-00c04f79dbc0"
  IID_IWMDeviceManager = LibC::GUID.new(0x1dcb3a00_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct IWMDeviceManager
    lpVtbl : IWMDeviceManagerVTbl*
  end

  struct IWMDeviceManager2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_revision : UInt64
    get_device_count : UInt64
    enum_devices : UInt64
    get_device_from_canonical_name : UInt64
    enum_devices2 : UInt64
    reinitialize : UInt64
  end

  IWMDeviceManager2_GUID = "923e5249-8731-4c5b-9b1c-b8b60b6e46af"
  IID_IWMDeviceManager2 = LibC::GUID.new(0x923e5249_u32, 0x8731_u16, 0x4c5b_u16, StaticArray[0x9b_u8, 0x1c_u8, 0xb8_u8, 0xb6_u8, 0xb_u8, 0x6e_u8, 0x46_u8, 0xaf_u8])
  struct IWMDeviceManager2
    lpVtbl : IWMDeviceManager2VTbl*
  end

  struct IWMDeviceManager3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_revision : UInt64
    get_device_count : UInt64
    enum_devices : UInt64
    get_device_from_canonical_name : UInt64
    enum_devices2 : UInt64
    reinitialize : UInt64
    set_device_enum_preference : UInt64
  end

  IWMDeviceManager3_GUID = "af185c41-100d-46ed-be2e-9ce8c44594ef"
  IID_IWMDeviceManager3 = LibC::GUID.new(0xaf185c41_u32, 0x100d_u16, 0x46ed_u16, StaticArray[0xbe_u8, 0x2e_u8, 0x9c_u8, 0xe8_u8, 0xc4_u8, 0x45_u8, 0x94_u8, 0xef_u8])
  struct IWMDeviceManager3
    lpVtbl : IWMDeviceManager3VTbl*
  end

  struct IWMDMStorageGlobalsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_capabilities : UInt64
    get_serial_number : UInt64
    get_total_size : UInt64
    get_total_free : UInt64
    get_total_bad : UInt64
    get_status : UInt64
    initialize : UInt64
  end

  IWMDMStorageGlobals_GUID = "1dcb3a07-33ed-11d3-8470-00c04f79dbc0"
  IID_IWMDMStorageGlobals = LibC::GUID.new(0x1dcb3a07_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct IWMDMStorageGlobals
    lpVtbl : IWMDMStorageGlobalsVTbl*
  end

  struct IWMDMStorageVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_attributes : UInt64
    get_storage_globals : UInt64
    get_attributes : UInt64
    get_name : UInt64
    get_date : UInt64
    get_size : UInt64
    get_rights : UInt64
    enum_storage : UInt64
    send_opaque_command : UInt64
  end

  IWMDMStorage_GUID = "1dcb3a06-33ed-11d3-8470-00c04f79dbc0"
  IID_IWMDMStorage = LibC::GUID.new(0x1dcb3a06_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct IWMDMStorage
    lpVtbl : IWMDMStorageVTbl*
  end

  struct IWMDMStorage2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_attributes : UInt64
    get_storage_globals : UInt64
    get_attributes : UInt64
    get_name : UInt64
    get_date : UInt64
    get_size : UInt64
    get_rights : UInt64
    enum_storage : UInt64
    send_opaque_command : UInt64
    get_storage : UInt64
    set_attributes2 : UInt64
    get_attributes2 : UInt64
  end

  IWMDMStorage2_GUID = "1ed5a144-5cd5-4683-9eff-72cbdb2d9533"
  IID_IWMDMStorage2 = LibC::GUID.new(0x1ed5a144_u32, 0x5cd5_u16, 0x4683_u16, StaticArray[0x9e_u8, 0xff_u8, 0x72_u8, 0xcb_u8, 0xdb_u8, 0x2d_u8, 0x95_u8, 0x33_u8])
  struct IWMDMStorage2
    lpVtbl : IWMDMStorage2VTbl*
  end

  struct IWMDMStorage3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_attributes : UInt64
    get_storage_globals : UInt64
    get_attributes : UInt64
    get_name : UInt64
    get_date : UInt64
    get_size : UInt64
    get_rights : UInt64
    enum_storage : UInt64
    send_opaque_command : UInt64
    get_storage : UInt64
    set_attributes2 : UInt64
    get_attributes2 : UInt64
    get_metadata : UInt64
    set_metadata : UInt64
    create_empty_metadata_object : UInt64
    set_enum_preference : UInt64
  end

  IWMDMStorage3_GUID = "97717eea-926a-464e-96a4-247b0216026e"
  IID_IWMDMStorage3 = LibC::GUID.new(0x97717eea_u32, 0x926a_u16, 0x464e_u16, StaticArray[0x96_u8, 0xa4_u8, 0x24_u8, 0x7b_u8, 0x2_u8, 0x16_u8, 0x2_u8, 0x6e_u8])
  struct IWMDMStorage3
    lpVtbl : IWMDMStorage3VTbl*
  end

  struct IWMDMStorage4VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_attributes : UInt64
    get_storage_globals : UInt64
    get_attributes : UInt64
    get_name : UInt64
    get_date : UInt64
    get_size : UInt64
    get_rights : UInt64
    enum_storage : UInt64
    send_opaque_command : UInt64
    get_storage : UInt64
    set_attributes2 : UInt64
    get_attributes2 : UInt64
    get_metadata : UInt64
    set_metadata : UInt64
    create_empty_metadata_object : UInt64
    set_enum_preference : UInt64
    set_references : UInt64
    get_references : UInt64
    get_rights_with_progress : UInt64
    get_specified_metadata : UInt64
    find_storage : UInt64
    get_parent : UInt64
  end

  IWMDMStorage4_GUID = "c225bac5-a03a-40b8-9a23-91cf478c64a6"
  IID_IWMDMStorage4 = LibC::GUID.new(0xc225bac5_u32, 0xa03a_u16, 0x40b8_u16, StaticArray[0x9a_u8, 0x23_u8, 0x91_u8, 0xcf_u8, 0x47_u8, 0x8c_u8, 0x64_u8, 0xa6_u8])
  struct IWMDMStorage4
    lpVtbl : IWMDMStorage4VTbl*
  end

  struct IWMDMOperationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    begin_read : UInt64
    begin_write : UInt64
    get_object_name : UInt64
    set_object_name : UInt64
    get_object_attributes : UInt64
    set_object_attributes : UInt64
    get_object_total_size : UInt64
    set_object_total_size : UInt64
    transfer_object_data : UInt64
    end_ : UInt64
  end

  IWMDMOperation_GUID = "1dcb3a0b-33ed-11d3-8470-00c04f79dbc0"
  IID_IWMDMOperation = LibC::GUID.new(0x1dcb3a0b_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct IWMDMOperation
    lpVtbl : IWMDMOperationVTbl*
  end

  struct IWMDMOperation2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    begin_read : UInt64
    begin_write : UInt64
    get_object_name : UInt64
    set_object_name : UInt64
    get_object_attributes : UInt64
    set_object_attributes : UInt64
    get_object_total_size : UInt64
    set_object_total_size : UInt64
    transfer_object_data : UInt64
    end_ : UInt64
    set_object_attributes2 : UInt64
    get_object_attributes2 : UInt64
  end

  IWMDMOperation2_GUID = "33445b48-7df7-425c-ad8f-0fc6d82f9f75"
  IID_IWMDMOperation2 = LibC::GUID.new(0x33445b48_u32, 0x7df7_u16, 0x425c_u16, StaticArray[0xad_u8, 0x8f_u8, 0xf_u8, 0xc6_u8, 0xd8_u8, 0x2f_u8, 0x9f_u8, 0x75_u8])
  struct IWMDMOperation2
    lpVtbl : IWMDMOperation2VTbl*
  end

  struct IWMDMOperation3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    begin_read : UInt64
    begin_write : UInt64
    get_object_name : UInt64
    set_object_name : UInt64
    get_object_attributes : UInt64
    set_object_attributes : UInt64
    get_object_total_size : UInt64
    set_object_total_size : UInt64
    transfer_object_data : UInt64
    end_ : UInt64
    transfer_object_data_on_clear_channel : UInt64
  end

  IWMDMOperation3_GUID = "d1f9b46a-9ca8-46d8-9d0f-1ec9bae54919"
  IID_IWMDMOperation3 = LibC::GUID.new(0xd1f9b46a_u32, 0x9ca8_u16, 0x46d8_u16, StaticArray[0x9d_u8, 0xf_u8, 0x1e_u8, 0xc9_u8, 0xba_u8, 0xe5_u8, 0x49_u8, 0x19_u8])
  struct IWMDMOperation3
    lpVtbl : IWMDMOperation3VTbl*
  end

  struct IWMDMProgressVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    begin_ : UInt64
    progress : UInt64
    end_ : UInt64
  end

  IWMDMProgress_GUID = "1dcb3a0c-33ed-11d3-8470-00c04f79dbc0"
  IID_IWMDMProgress = LibC::GUID.new(0x1dcb3a0c_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct IWMDMProgress
    lpVtbl : IWMDMProgressVTbl*
  end

  struct IWMDMProgress2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    begin_ : UInt64
    progress : UInt64
    end_ : UInt64
    end2 : UInt64
  end

  IWMDMProgress2_GUID = "3a43f550-b383-4e92-b04a-e6bbc660fefc"
  IID_IWMDMProgress2 = LibC::GUID.new(0x3a43f550_u32, 0xb383_u16, 0x4e92_u16, StaticArray[0xb0_u8, 0x4a_u8, 0xe6_u8, 0xbb_u8, 0xc6_u8, 0x60_u8, 0xfe_u8, 0xfc_u8])
  struct IWMDMProgress2
    lpVtbl : IWMDMProgress2VTbl*
  end

  struct IWMDMProgress3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    begin_ : UInt64
    progress : UInt64
    end_ : UInt64
    end2 : UInt64
    begin3 : UInt64
    progress3 : UInt64
    end3 : UInt64
  end

  IWMDMProgress3_GUID = "21de01cb-3bb4-4929-b21a-17af3f80f658"
  IID_IWMDMProgress3 = LibC::GUID.new(0x21de01cb_u32, 0x3bb4_u16, 0x4929_u16, StaticArray[0xb2_u8, 0x1a_u8, 0x17_u8, 0xaf_u8, 0x3f_u8, 0x80_u8, 0xf6_u8, 0x58_u8])
  struct IWMDMProgress3
    lpVtbl : IWMDMProgress3VTbl*
  end

  struct IWMDMDeviceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_name : UInt64
    get_manufacturer : UInt64
    get_version : UInt64
    get_type : UInt64
    get_serial_number : UInt64
    get_power_source : UInt64
    get_status : UInt64
    get_device_icon : UInt64
    enum_storage : UInt64
    get_format_support : UInt64
    send_opaque_command : UInt64
  end

  IWMDMDevice_GUID = "1dcb3a02-33ed-11d3-8470-00c04f79dbc0"
  IID_IWMDMDevice = LibC::GUID.new(0x1dcb3a02_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct IWMDMDevice
    lpVtbl : IWMDMDeviceVTbl*
  end

  struct IWMDMDevice2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_name : UInt64
    get_manufacturer : UInt64
    get_version : UInt64
    get_type : UInt64
    get_serial_number : UInt64
    get_power_source : UInt64
    get_status : UInt64
    get_device_icon : UInt64
    enum_storage : UInt64
    get_format_support : UInt64
    send_opaque_command : UInt64
    get_storage : UInt64
    get_format_support2 : UInt64
    get_specify_property_pages : UInt64
    get_canonical_name : UInt64
  end

  IWMDMDevice2_GUID = "e34f3d37-9d67-4fc1-9252-62d28b2f8b55"
  IID_IWMDMDevice2 = LibC::GUID.new(0xe34f3d37_u32, 0x9d67_u16, 0x4fc1_u16, StaticArray[0x92_u8, 0x52_u8, 0x62_u8, 0xd2_u8, 0x8b_u8, 0x2f_u8, 0x8b_u8, 0x55_u8])
  struct IWMDMDevice2
    lpVtbl : IWMDMDevice2VTbl*
  end

  struct IWMDMDevice3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_name : UInt64
    get_manufacturer : UInt64
    get_version : UInt64
    get_type : UInt64
    get_serial_number : UInt64
    get_power_source : UInt64
    get_status : UInt64
    get_device_icon : UInt64
    enum_storage : UInt64
    get_format_support : UInt64
    send_opaque_command : UInt64
    get_storage : UInt64
    get_format_support2 : UInt64
    get_specify_property_pages : UInt64
    get_canonical_name : UInt64
    get_property : UInt64
    set_property : UInt64
    get_format_capability : UInt64
    device_io_control : UInt64
    find_storage : UInt64
  end

  IWMDMDevice3_GUID = "6c03e4fe-05db-4dda-9e3c-06233a6d5d65"
  IID_IWMDMDevice3 = LibC::GUID.new(0x6c03e4fe_u32, 0x5db_u16, 0x4dda_u16, StaticArray[0x9e_u8, 0x3c_u8, 0x6_u8, 0x23_u8, 0x3a_u8, 0x6d_u8, 0x5d_u8, 0x65_u8])
  struct IWMDMDevice3
    lpVtbl : IWMDMDevice3VTbl*
  end

  struct IWMDMDeviceSessionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    begin_session : UInt64
    end_session : UInt64
  end

  IWMDMDeviceSession_GUID = "82af0a65-9d96-412c-83e5-3c43e4b06cc7"
  IID_IWMDMDeviceSession = LibC::GUID.new(0x82af0a65_u32, 0x9d96_u16, 0x412c_u16, StaticArray[0x83_u8, 0xe5_u8, 0x3c_u8, 0x43_u8, 0xe4_u8, 0xb0_u8, 0x6c_u8, 0xc7_u8])
  struct IWMDMDeviceSession
    lpVtbl : IWMDMDeviceSessionVTbl*
  end

  struct IWMDMEnumDeviceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
  end

  IWMDMEnumDevice_GUID = "1dcb3a01-33ed-11d3-8470-00c04f79dbc0"
  IID_IWMDMEnumDevice = LibC::GUID.new(0x1dcb3a01_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct IWMDMEnumDevice
    lpVtbl : IWMDMEnumDeviceVTbl*
  end

  struct IWMDMDeviceControlVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_status : UInt64
    get_capabilities : UInt64
    play : UInt64
    record : UInt64
    pause : UInt64
    resume : UInt64
    stop : UInt64
    seek : UInt64
  end

  IWMDMDeviceControl_GUID = "1dcb3a04-33ed-11d3-8470-00c04f79dbc0"
  IID_IWMDMDeviceControl = LibC::GUID.new(0x1dcb3a04_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct IWMDMDeviceControl
    lpVtbl : IWMDMDeviceControlVTbl*
  end

  struct IWMDMEnumStorageVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
  end

  IWMDMEnumStorage_GUID = "1dcb3a05-33ed-11d3-8470-00c04f79dbc0"
  IID_IWMDMEnumStorage = LibC::GUID.new(0x1dcb3a05_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct IWMDMEnumStorage
    lpVtbl : IWMDMEnumStorageVTbl*
  end

  struct IWMDMStorageControlVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    insert : UInt64
    delete : UInt64
    rename : UInt64
    read : UInt64
    move : UInt64
  end

  IWMDMStorageControl_GUID = "1dcb3a08-33ed-11d3-8470-00c04f79dbc0"
  IID_IWMDMStorageControl = LibC::GUID.new(0x1dcb3a08_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct IWMDMStorageControl
    lpVtbl : IWMDMStorageControlVTbl*
  end

  struct IWMDMStorageControl2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    insert : UInt64
    delete : UInt64
    rename : UInt64
    read : UInt64
    move : UInt64
    insert2 : UInt64
  end

  IWMDMStorageControl2_GUID = "972c2e88-bd6c-4125-8e09-84f837e637b6"
  IID_IWMDMStorageControl2 = LibC::GUID.new(0x972c2e88_u32, 0xbd6c_u16, 0x4125_u16, StaticArray[0x8e_u8, 0x9_u8, 0x84_u8, 0xf8_u8, 0x37_u8, 0xe6_u8, 0x37_u8, 0xb6_u8])
  struct IWMDMStorageControl2
    lpVtbl : IWMDMStorageControl2VTbl*
  end

  struct IWMDMStorageControl3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    insert : UInt64
    delete : UInt64
    rename : UInt64
    read : UInt64
    move : UInt64
    insert2 : UInt64
    insert3 : UInt64
  end

  IWMDMStorageControl3_GUID = "b3266365-d4f3-4696-8d53-bd27ec60993a"
  IID_IWMDMStorageControl3 = LibC::GUID.new(0xb3266365_u32, 0xd4f3_u16, 0x4696_u16, StaticArray[0x8d_u8, 0x53_u8, 0xbd_u8, 0x27_u8, 0xec_u8, 0x60_u8, 0x99_u8, 0x3a_u8])
  struct IWMDMStorageControl3
    lpVtbl : IWMDMStorageControl3VTbl*
  end

  struct IWMDMObjectInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_play_length : UInt64
    set_play_length : UInt64
    get_play_offset : UInt64
    set_play_offset : UInt64
    get_total_length : UInt64
    get_last_play_position : UInt64
    get_longest_play_position : UInt64
  end

  IWMDMObjectInfo_GUID = "1dcb3a09-33ed-11d3-8470-00c04f79dbc0"
  IID_IWMDMObjectInfo = LibC::GUID.new(0x1dcb3a09_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct IWMDMObjectInfo
    lpVtbl : IWMDMObjectInfoVTbl*
  end

  struct IWMDMRevokedVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_revocation_url : UInt64
  end

  IWMDMRevoked_GUID = "ebeccedb-88ee-4e55-b6a4-8d9f07d696aa"
  IID_IWMDMRevoked = LibC::GUID.new(0xebeccedb_u32, 0x88ee_u16, 0x4e55_u16, StaticArray[0xb6_u8, 0xa4_u8, 0x8d_u8, 0x9f_u8, 0x7_u8, 0xd6_u8, 0x96_u8, 0xaa_u8])
  struct IWMDMRevoked
    lpVtbl : IWMDMRevokedVTbl*
  end

  struct IWMDMNotificationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    wmdm_message : UInt64
  end

  IWMDMNotification_GUID = "3f5e95c0-0f43-4ed4-93d2-c89a45d59b81"
  IID_IWMDMNotification = LibC::GUID.new(0x3f5e95c0_u32, 0xf43_u16, 0x4ed4_u16, StaticArray[0x93_u8, 0xd2_u8, 0xc8_u8, 0x9a_u8, 0x45_u8, 0xd5_u8, 0x9b_u8, 0x81_u8])
  struct IWMDMNotification
    lpVtbl : IWMDMNotificationVTbl*
  end

  struct IMDServiceProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_device_count : UInt64
    enum_devices : UInt64
  end

  IMDServiceProvider_GUID = "1dcb3a10-33ed-11d3-8470-00c04f79dbc0"
  IID_IMDServiceProvider = LibC::GUID.new(0x1dcb3a10_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct IMDServiceProvider
    lpVtbl : IMDServiceProviderVTbl*
  end

  struct IMDServiceProvider2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_device_count : UInt64
    enum_devices : UInt64
    create_device : UInt64
  end

  IMDServiceProvider2_GUID = "b2fa24b7-cda3-4694-9862-413ae1a34819"
  IID_IMDServiceProvider2 = LibC::GUID.new(0xb2fa24b7_u32, 0xcda3_u16, 0x4694_u16, StaticArray[0x98_u8, 0x62_u8, 0x41_u8, 0x3a_u8, 0xe1_u8, 0xa3_u8, 0x48_u8, 0x19_u8])
  struct IMDServiceProvider2
    lpVtbl : IMDServiceProvider2VTbl*
  end

  struct IMDServiceProvider3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_device_count : UInt64
    enum_devices : UInt64
    create_device : UInt64
    set_device_enum_preference : UInt64
  end

  IMDServiceProvider3_GUID = "4ed13ef3-a971-4d19-9f51-0e1826b2da57"
  IID_IMDServiceProvider3 = LibC::GUID.new(0x4ed13ef3_u32, 0xa971_u16, 0x4d19_u16, StaticArray[0x9f_u8, 0x51_u8, 0xe_u8, 0x18_u8, 0x26_u8, 0xb2_u8, 0xda_u8, 0x57_u8])
  struct IMDServiceProvider3
    lpVtbl : IMDServiceProvider3VTbl*
  end

  struct IMDSPEnumDeviceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
  end

  IMDSPEnumDevice_GUID = "1dcb3a11-33ed-11d3-8470-00c04f79dbc0"
  IID_IMDSPEnumDevice = LibC::GUID.new(0x1dcb3a11_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct IMDSPEnumDevice
    lpVtbl : IMDSPEnumDeviceVTbl*
  end

  struct IMDSPDeviceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_name : UInt64
    get_manufacturer : UInt64
    get_version : UInt64
    get_type : UInt64
    get_serial_number : UInt64
    get_power_source : UInt64
    get_status : UInt64
    get_device_icon : UInt64
    enum_storage : UInt64
    get_format_support : UInt64
    send_opaque_command : UInt64
  end

  IMDSPDevice_GUID = "1dcb3a12-33ed-11d3-8470-00c04f79dbc0"
  IID_IMDSPDevice = LibC::GUID.new(0x1dcb3a12_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct IMDSPDevice
    lpVtbl : IMDSPDeviceVTbl*
  end

  struct IMDSPDevice2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_name : UInt64
    get_manufacturer : UInt64
    get_version : UInt64
    get_type : UInt64
    get_serial_number : UInt64
    get_power_source : UInt64
    get_status : UInt64
    get_device_icon : UInt64
    enum_storage : UInt64
    get_format_support : UInt64
    send_opaque_command : UInt64
    get_storage : UInt64
    get_format_support2 : UInt64
    get_specify_property_pages : UInt64
    get_canonical_name : UInt64
  end

  IMDSPDevice2_GUID = "420d16ad-c97d-4e00-82aa-00e9f4335ddd"
  IID_IMDSPDevice2 = LibC::GUID.new(0x420d16ad_u32, 0xc97d_u16, 0x4e00_u16, StaticArray[0x82_u8, 0xaa_u8, 0x0_u8, 0xe9_u8, 0xf4_u8, 0x33_u8, 0x5d_u8, 0xdd_u8])
  struct IMDSPDevice2
    lpVtbl : IMDSPDevice2VTbl*
  end

  struct IMDSPDevice3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_name : UInt64
    get_manufacturer : UInt64
    get_version : UInt64
    get_type : UInt64
    get_serial_number : UInt64
    get_power_source : UInt64
    get_status : UInt64
    get_device_icon : UInt64
    enum_storage : UInt64
    get_format_support : UInt64
    send_opaque_command : UInt64
    get_storage : UInt64
    get_format_support2 : UInt64
    get_specify_property_pages : UInt64
    get_canonical_name : UInt64
    get_property : UInt64
    set_property : UInt64
    get_format_capability : UInt64
    device_io_control : UInt64
    find_storage : UInt64
  end

  IMDSPDevice3_GUID = "1a839845-fc55-487c-976f-ee38ac0e8c4e"
  IID_IMDSPDevice3 = LibC::GUID.new(0x1a839845_u32, 0xfc55_u16, 0x487c_u16, StaticArray[0x97_u8, 0x6f_u8, 0xee_u8, 0x38_u8, 0xac_u8, 0xe_u8, 0x8c_u8, 0x4e_u8])
  struct IMDSPDevice3
    lpVtbl : IMDSPDevice3VTbl*
  end

  struct IMDSPDeviceControlVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_dc_status : UInt64
    get_capabilities : UInt64
    play : UInt64
    record : UInt64
    pause : UInt64
    resume : UInt64
    stop : UInt64
    seek : UInt64
  end

  IMDSPDeviceControl_GUID = "1dcb3a14-33ed-11d3-8470-00c04f79dbc0"
  IID_IMDSPDeviceControl = LibC::GUID.new(0x1dcb3a14_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct IMDSPDeviceControl
    lpVtbl : IMDSPDeviceControlVTbl*
  end

  struct IMDSPEnumStorageVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
  end

  IMDSPEnumStorage_GUID = "1dcb3a15-33ed-11d3-8470-00c04f79dbc0"
  IID_IMDSPEnumStorage = LibC::GUID.new(0x1dcb3a15_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct IMDSPEnumStorage
    lpVtbl : IMDSPEnumStorageVTbl*
  end

  struct IMDSPStorageVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_attributes : UInt64
    get_storage_globals : UInt64
    get_attributes : UInt64
    get_name : UInt64
    get_date : UInt64
    get_size : UInt64
    get_rights : UInt64
    create_storage : UInt64
    enum_storage : UInt64
    send_opaque_command : UInt64
  end

  IMDSPStorage_GUID = "1dcb3a16-33ed-11d3-8470-00c04f79dbc0"
  IID_IMDSPStorage = LibC::GUID.new(0x1dcb3a16_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct IMDSPStorage
    lpVtbl : IMDSPStorageVTbl*
  end

  struct IMDSPStorage2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_attributes : UInt64
    get_storage_globals : UInt64
    get_attributes : UInt64
    get_name : UInt64
    get_date : UInt64
    get_size : UInt64
    get_rights : UInt64
    create_storage : UInt64
    enum_storage : UInt64
    send_opaque_command : UInt64
    get_storage : UInt64
    create_storage2 : UInt64
    set_attributes2 : UInt64
    get_attributes2 : UInt64
  end

  IMDSPStorage2_GUID = "0a5e07a5-6454-4451-9c36-1c6ae7e2b1d6"
  IID_IMDSPStorage2 = LibC::GUID.new(0xa5e07a5_u32, 0x6454_u16, 0x4451_u16, StaticArray[0x9c_u8, 0x36_u8, 0x1c_u8, 0x6a_u8, 0xe7_u8, 0xe2_u8, 0xb1_u8, 0xd6_u8])
  struct IMDSPStorage2
    lpVtbl : IMDSPStorage2VTbl*
  end

  struct IMDSPStorage3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_attributes : UInt64
    get_storage_globals : UInt64
    get_attributes : UInt64
    get_name : UInt64
    get_date : UInt64
    get_size : UInt64
    get_rights : UInt64
    create_storage : UInt64
    enum_storage : UInt64
    send_opaque_command : UInt64
    get_storage : UInt64
    create_storage2 : UInt64
    set_attributes2 : UInt64
    get_attributes2 : UInt64
    get_metadata : UInt64
    set_metadata : UInt64
  end

  IMDSPStorage3_GUID = "6c669867-97ed-4a67-9706-1c5529d2a414"
  IID_IMDSPStorage3 = LibC::GUID.new(0x6c669867_u32, 0x97ed_u16, 0x4a67_u16, StaticArray[0x97_u8, 0x6_u8, 0x1c_u8, 0x55_u8, 0x29_u8, 0xd2_u8, 0xa4_u8, 0x14_u8])
  struct IMDSPStorage3
    lpVtbl : IMDSPStorage3VTbl*
  end

  struct IMDSPStorage4VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_attributes : UInt64
    get_storage_globals : UInt64
    get_attributes : UInt64
    get_name : UInt64
    get_date : UInt64
    get_size : UInt64
    get_rights : UInt64
    create_storage : UInt64
    enum_storage : UInt64
    send_opaque_command : UInt64
    get_storage : UInt64
    create_storage2 : UInt64
    set_attributes2 : UInt64
    get_attributes2 : UInt64
    get_metadata : UInt64
    set_metadata : UInt64
    set_references : UInt64
    get_references : UInt64
    create_storage_with_metadata : UInt64
    get_specified_metadata : UInt64
    find_storage : UInt64
    get_parent : UInt64
  end

  IMDSPStorage4_GUID = "3133b2c4-515c-481b-b1ce-39327ecb4f74"
  IID_IMDSPStorage4 = LibC::GUID.new(0x3133b2c4_u32, 0x515c_u16, 0x481b_u16, StaticArray[0xb1_u8, 0xce_u8, 0x39_u8, 0x32_u8, 0x7e_u8, 0xcb_u8, 0x4f_u8, 0x74_u8])
  struct IMDSPStorage4
    lpVtbl : IMDSPStorage4VTbl*
  end

  struct IMDSPStorageGlobalsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_capabilities : UInt64
    get_serial_number : UInt64
    get_total_size : UInt64
    get_total_free : UInt64
    get_total_bad : UInt64
    get_status : UInt64
    initialize : UInt64
    get_device : UInt64
    get_root_storage : UInt64
  end

  IMDSPStorageGlobals_GUID = "1dcb3a17-33ed-11d3-8470-00c04f79dbc0"
  IID_IMDSPStorageGlobals = LibC::GUID.new(0x1dcb3a17_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct IMDSPStorageGlobals
    lpVtbl : IMDSPStorageGlobalsVTbl*
  end

  struct IMDSPObjectInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_play_length : UInt64
    set_play_length : UInt64
    get_play_offset : UInt64
    set_play_offset : UInt64
    get_total_length : UInt64
    get_last_play_position : UInt64
    get_longest_play_position : UInt64
  end

  IMDSPObjectInfo_GUID = "1dcb3a19-33ed-11d3-8470-00c04f79dbc0"
  IID_IMDSPObjectInfo = LibC::GUID.new(0x1dcb3a19_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct IMDSPObjectInfo
    lpVtbl : IMDSPObjectInfoVTbl*
  end

  struct IMDSPObjectVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    open : UInt64
    read : UInt64
    write : UInt64
    delete : UInt64
    seek : UInt64
    rename : UInt64
    move : UInt64
    close : UInt64
  end

  IMDSPObject_GUID = "1dcb3a18-33ed-11d3-8470-00c04f79dbc0"
  IID_IMDSPObject = LibC::GUID.new(0x1dcb3a18_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct IMDSPObject
    lpVtbl : IMDSPObjectVTbl*
  end

  struct IMDSPObject2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    open : UInt64
    read : UInt64
    write : UInt64
    delete : UInt64
    seek : UInt64
    rename : UInt64
    move : UInt64
    close : UInt64
    read_on_clear_channel : UInt64
    write_on_clear_channel : UInt64
  end

  IMDSPObject2_GUID = "3f34cd3e-5907-4341-9af9-97f4187c3aa5"
  IID_IMDSPObject2 = LibC::GUID.new(0x3f34cd3e_u32, 0x5907_u16, 0x4341_u16, StaticArray[0x9a_u8, 0xf9_u8, 0x97_u8, 0xf4_u8, 0x18_u8, 0x7c_u8, 0x3a_u8, 0xa5_u8])
  struct IMDSPObject2
    lpVtbl : IMDSPObject2VTbl*
  end

  struct IMDSPDirectTransferVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    transfer_to_device : UInt64
  end

  IMDSPDirectTransfer_GUID = "c2fe57a8-9304-478c-9ee4-47e397b912d7"
  IID_IMDSPDirectTransfer = LibC::GUID.new(0xc2fe57a8_u32, 0x9304_u16, 0x478c_u16, StaticArray[0x9e_u8, 0xe4_u8, 0x47_u8, 0xe3_u8, 0x97_u8, 0xb9_u8, 0x12_u8, 0xd7_u8])
  struct IMDSPDirectTransfer
    lpVtbl : IMDSPDirectTransferVTbl*
  end

  struct IMDSPRevokedVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_revocation_url : UInt64
  end

  IMDSPRevoked_GUID = "a4e8f2d4-3f31-464d-b53d-4fc335998184"
  IID_IMDSPRevoked = LibC::GUID.new(0xa4e8f2d4_u32, 0x3f31_u16, 0x464d_u16, StaticArray[0xb5_u8, 0x3d_u8, 0x4f_u8, 0xc3_u8, 0x35_u8, 0x99_u8, 0x81_u8, 0x84_u8])
  struct IMDSPRevoked
    lpVtbl : IMDSPRevokedVTbl*
  end

  struct ISCPSecureAuthenticateVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_secure_query : UInt64
  end

  ISCPSecureAuthenticate_GUID = "1dcb3a0f-33ed-11d3-8470-00c04f79dbc0"
  IID_ISCPSecureAuthenticate = LibC::GUID.new(0x1dcb3a0f_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct ISCPSecureAuthenticate
    lpVtbl : ISCPSecureAuthenticateVTbl*
  end

  struct ISCPSecureAuthenticate2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_secure_query : UInt64
    get_scp_session : UInt64
  end

  ISCPSecureAuthenticate2_GUID = "b580cfae-1672-47e2-acaa-44bbecbcae5b"
  IID_ISCPSecureAuthenticate2 = LibC::GUID.new(0xb580cfae_u32, 0x1672_u16, 0x47e2_u16, StaticArray[0xac_u8, 0xaa_u8, 0x44_u8, 0xbb_u8, 0xec_u8, 0xbc_u8, 0xae_u8, 0x5b_u8])
  struct ISCPSecureAuthenticate2
    lpVtbl : ISCPSecureAuthenticate2VTbl*
  end

  struct ISCPSecureQueryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_data_demands : UInt64
    examine_data : UInt64
    make_decision : UInt64
    get_rights : UInt64
  end

  ISCPSecureQuery_GUID = "1dcb3a0d-33ed-11d3-8470-00c04f79dbc0"
  IID_ISCPSecureQuery = LibC::GUID.new(0x1dcb3a0d_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct ISCPSecureQuery
    lpVtbl : ISCPSecureQueryVTbl*
  end

  struct ISCPSecureQuery2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_data_demands : UInt64
    examine_data : UInt64
    make_decision : UInt64
    get_rights : UInt64
    make_decision2 : UInt64
  end

  ISCPSecureQuery2_GUID = "ebe17e25-4fd7-4632-af46-6d93d4fcc72e"
  IID_ISCPSecureQuery2 = LibC::GUID.new(0xebe17e25_u32, 0x4fd7_u16, 0x4632_u16, StaticArray[0xaf_u8, 0x46_u8, 0x6d_u8, 0x93_u8, 0xd4_u8, 0xfc_u8, 0xc7_u8, 0x2e_u8])
  struct ISCPSecureQuery2
    lpVtbl : ISCPSecureQuery2VTbl*
  end

  struct ISCPSecureExchangeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    transfer_container_data : UInt64
    object_data : UInt64
    transfer_complete : UInt64
  end

  ISCPSecureExchange_GUID = "1dcb3a0e-33ed-11d3-8470-00c04f79dbc0"
  IID_ISCPSecureExchange = LibC::GUID.new(0x1dcb3a0e_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct ISCPSecureExchange
    lpVtbl : ISCPSecureExchangeVTbl*
  end

  struct ISCPSecureExchange2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    transfer_container_data : UInt64
    object_data : UInt64
    transfer_complete : UInt64
    transfer_container_data2 : UInt64
  end

  ISCPSecureExchange2_GUID = "6c62fc7b-2690-483f-9d44-0a20cb35577c"
  IID_ISCPSecureExchange2 = LibC::GUID.new(0x6c62fc7b_u32, 0x2690_u16, 0x483f_u16, StaticArray[0x9d_u8, 0x44_u8, 0xa_u8, 0x20_u8, 0xcb_u8, 0x35_u8, 0x57_u8, 0x7c_u8])
  struct ISCPSecureExchange2
    lpVtbl : ISCPSecureExchange2VTbl*
  end

  struct ISCPSecureExchange3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    transfer_container_data : UInt64
    object_data : UInt64
    transfer_complete : UInt64
    transfer_container_data2 : UInt64
    transfer_container_data_on_clear_channel : UInt64
    get_object_data_on_clear_channel : UInt64
    transfer_complete_for_device : UInt64
  end

  ISCPSecureExchange3_GUID = "ab4e77e4-8908-4b17-bd2a-b1dbe6dd69e1"
  IID_ISCPSecureExchange3 = LibC::GUID.new(0xab4e77e4_u32, 0x8908_u16, 0x4b17_u16, StaticArray[0xbd_u8, 0x2a_u8, 0xb1_u8, 0xdb_u8, 0xe6_u8, 0xdd_u8, 0x69_u8, 0xe1_u8])
  struct ISCPSecureExchange3
    lpVtbl : ISCPSecureExchange3VTbl*
  end

  struct ISCPSessionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    begin_session : UInt64
    end_session : UInt64
    get_secure_query : UInt64
  end

  ISCPSession_GUID = "88a3e6ed-eee4-4619-bbb3-fd4fb62715d1"
  IID_ISCPSession = LibC::GUID.new(0x88a3e6ed_u32, 0xeee4_u16, 0x4619_u16, StaticArray[0xbb_u8, 0xb3_u8, 0xfd_u8, 0x4f_u8, 0xb6_u8, 0x27_u8, 0x15_u8, 0xd1_u8])
  struct ISCPSession
    lpVtbl : ISCPSessionVTbl*
  end

  struct ISCPSecureQuery3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_data_demands : UInt64
    examine_data : UInt64
    make_decision : UInt64
    get_rights : UInt64
    make_decision2 : UInt64
    get_rights_on_clear_channel : UInt64
    make_decision_on_clear_channel : UInt64
  end

  ISCPSecureQuery3_GUID = "b7edd1a2-4dab-484b-b3c5-ad39b8b4c0b1"
  IID_ISCPSecureQuery3 = LibC::GUID.new(0xb7edd1a2_u32, 0x4dab_u16, 0x484b_u16, StaticArray[0xb3_u8, 0xc5_u8, 0xad_u8, 0x39_u8, 0xb8_u8, 0xb4_u8, 0xc0_u8, 0xb1_u8])
  struct ISCPSecureQuery3
    lpVtbl : ISCPSecureQuery3VTbl*
  end

  struct IComponentAuthenticateVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    sac_auth : UInt64
    sac_get_protocols : UInt64
  end

  IComponentAuthenticate_GUID = "a9889c00-6d2b-11d3-8496-00c04f79dbc0"
  IID_IComponentAuthenticate = LibC::GUID.new(0xa9889c00_u32, 0x6d2b_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x96_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct IComponentAuthenticate
    lpVtbl : IComponentAuthenticateVTbl*
  end

  struct IWMDMLoggerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    is_enabled : UInt64
    enable : UInt64
    get_log_file_name : UInt64
    set_log_file_name : UInt64
    log_string : UInt64
    log_dword : UInt64
    reset : UInt64
    get_size_params : UInt64
    set_size_params : UInt64
  end

  IWMDMLogger_GUID = "110a3200-5a79-11d3-8d78-444553540000"
  IID_IWMDMLogger = LibC::GUID.new(0x110a3200_u32, 0x5a79_u16, 0x11d3_u16, StaticArray[0x8d_u8, 0x78_u8, 0x44_u8, 0x45_u8, 0x53_u8, 0x54_u8, 0x0_u8, 0x0_u8])
  struct IWMDMLogger
    lpVtbl : IWMDMLoggerVTbl*
  end

end
struct LibWin32::IWMDMMetaData
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_item(type : WMDM_TAG_DATATYPE, pwsztagname : LibC::LPWSTR, pvalue : UInt8*, ilength : UInt32) : HRESULT
    @lpVtbl.value.add_item.unsafe_as(Proc(WMDM_TAG_DATATYPE, LibC::LPWSTR, UInt8*, UInt32, HRESULT)).call(type, pwsztagname, pvalue, ilength)
  end
  def query_by_name(pwsztagname : LibC::LPWSTR, ptype : WMDM_TAG_DATATYPE*, pvalue : UInt8**, pcblength : UInt32*) : HRESULT
    @lpVtbl.value.query_by_name.unsafe_as(Proc(LibC::LPWSTR, WMDM_TAG_DATATYPE*, UInt8**, UInt32*, HRESULT)).call(pwsztagname, ptype, pvalue, pcblength)
  end
  def query_by_index(iindex : UInt32, ppwszname : UInt16**, ptype : WMDM_TAG_DATATYPE*, ppvalue : UInt8**, pcblength : UInt32*) : HRESULT
    @lpVtbl.value.query_by_index.unsafe_as(Proc(UInt32, UInt16**, WMDM_TAG_DATATYPE*, UInt8**, UInt32*, HRESULT)).call(iindex, ppwszname, ptype, ppvalue, pcblength)
  end
  def get_item_count(icount : UInt32*) : HRESULT
    @lpVtbl.value.get_item_count.unsafe_as(Proc(UInt32*, HRESULT)).call(icount)
  end
end
struct LibWin32::IWMDeviceManager
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_revision(pdwrevision : UInt32*) : HRESULT
    @lpVtbl.value.get_revision.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwrevision)
  end
  def get_device_count(pdwcount : UInt32*) : HRESULT
    @lpVtbl.value.get_device_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwcount)
  end
  def enum_devices(ppenumdevice : IWMDMEnumDevice*) : HRESULT
    @lpVtbl.value.enum_devices.unsafe_as(Proc(IWMDMEnumDevice*, HRESULT)).call(ppenumdevice)
  end
end
struct LibWin32::IWMDeviceManager2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_revision(pdwrevision : UInt32*) : HRESULT
    @lpVtbl.value.get_revision.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwrevision)
  end
  def get_device_count(pdwcount : UInt32*) : HRESULT
    @lpVtbl.value.get_device_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwcount)
  end
  def enum_devices(ppenumdevice : IWMDMEnumDevice*) : HRESULT
    @lpVtbl.value.enum_devices.unsafe_as(Proc(IWMDMEnumDevice*, HRESULT)).call(ppenumdevice)
  end
  def get_device_from_canonical_name(pwszcanonicalname : LibC::LPWSTR, ppdevice : IWMDMDevice*) : HRESULT
    @lpVtbl.value.get_device_from_canonical_name.unsafe_as(Proc(LibC::LPWSTR, IWMDMDevice*, HRESULT)).call(pwszcanonicalname, ppdevice)
  end
  def enum_devices2(ppenumdevice : IWMDMEnumDevice*) : HRESULT
    @lpVtbl.value.enum_devices2.unsafe_as(Proc(IWMDMEnumDevice*, HRESULT)).call(ppenumdevice)
  end
  def reinitialize : HRESULT
    @lpVtbl.value.reinitialize.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IWMDeviceManager3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_revision(pdwrevision : UInt32*) : HRESULT
    @lpVtbl.value.get_revision.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwrevision)
  end
  def get_device_count(pdwcount : UInt32*) : HRESULT
    @lpVtbl.value.get_device_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwcount)
  end
  def enum_devices(ppenumdevice : IWMDMEnumDevice*) : HRESULT
    @lpVtbl.value.enum_devices.unsafe_as(Proc(IWMDMEnumDevice*, HRESULT)).call(ppenumdevice)
  end
  def get_device_from_canonical_name(pwszcanonicalname : LibC::LPWSTR, ppdevice : IWMDMDevice*) : HRESULT
    @lpVtbl.value.get_device_from_canonical_name.unsafe_as(Proc(LibC::LPWSTR, IWMDMDevice*, HRESULT)).call(pwszcanonicalname, ppdevice)
  end
  def enum_devices2(ppenumdevice : IWMDMEnumDevice*) : HRESULT
    @lpVtbl.value.enum_devices2.unsafe_as(Proc(IWMDMEnumDevice*, HRESULT)).call(ppenumdevice)
  end
  def reinitialize : HRESULT
    @lpVtbl.value.reinitialize.unsafe_as(Proc(HRESULT)).call
  end
  def set_device_enum_preference(dwenumpref : UInt32) : HRESULT
    @lpVtbl.value.set_device_enum_preference.unsafe_as(Proc(UInt32, HRESULT)).call(dwenumpref)
  end
end
struct LibWin32::IWMDMStorageGlobals
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_capabilities(pdwcapabilities : UInt32*) : HRESULT
    @lpVtbl.value.get_capabilities.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwcapabilities)
  end
  def get_serial_number(pserialnum : WMDMID*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_serial_number.unsafe_as(Proc(WMDMID*, UInt8*, HRESULT)).call(pserialnum, abmac)
  end
  def get_total_size(pdwtotalsizelow : UInt32*, pdwtotalsizehigh : UInt32*) : HRESULT
    @lpVtbl.value.get_total_size.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pdwtotalsizelow, pdwtotalsizehigh)
  end
  def get_total_free(pdwfreelow : UInt32*, pdwfreehigh : UInt32*) : HRESULT
    @lpVtbl.value.get_total_free.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pdwfreelow, pdwfreehigh)
  end
  def get_total_bad(pdwbadlow : UInt32*, pdwbadhigh : UInt32*) : HRESULT
    @lpVtbl.value.get_total_bad.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pdwbadlow, pdwbadhigh)
  end
  def get_status(pdwstatus : UInt32*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwstatus)
  end
  def initialize(fumode : UInt32, pprogress : IWMDMProgress) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(UInt32, IWMDMProgress, HRESULT)).call(fumode, pprogress)
  end
end
struct LibWin32::IWMDMStorage
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_attributes(dwattributes : UInt32, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.set_attributes.unsafe_as(Proc(UInt32, WAVEFORMATEX*, HRESULT)).call(dwattributes, pformat)
  end
  def get_storage_globals(ppstorageglobals : IWMDMStorageGlobals*) : HRESULT
    @lpVtbl.value.get_storage_globals.unsafe_as(Proc(IWMDMStorageGlobals*, HRESULT)).call(ppstorageglobals)
  end
  def get_attributes(pdwattributes : UInt32*, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.get_attributes.unsafe_as(Proc(UInt32*, WAVEFORMATEX*, HRESULT)).call(pdwattributes, pformat)
  end
  def get_name(pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(Char*, UInt32, HRESULT)).call(pwszname, nmaxchars)
  end
  def get_date(pdatetimeutc : WMDMDATETIME*) : HRESULT
    @lpVtbl.value.get_date.unsafe_as(Proc(WMDMDATETIME*, HRESULT)).call(pdatetimeutc)
  end
  def get_size(pdwsizelow : UInt32*, pdwsizehigh : UInt32*) : HRESULT
    @lpVtbl.value.get_size.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pdwsizelow, pdwsizehigh)
  end
  def get_rights(pprights : WMDMRIGHTS**, pnrightscount : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_rights.unsafe_as(Proc(WMDMRIGHTS**, UInt32*, UInt8*, HRESULT)).call(pprights, pnrightscount, abmac)
  end
  def enum_storage(penumstorage : IWMDMEnumStorage*) : HRESULT
    @lpVtbl.value.enum_storage.unsafe_as(Proc(IWMDMEnumStorage*, HRESULT)).call(penumstorage)
  end
  def send_opaque_command(pcommand : OPAQUECOMMAND*) : HRESULT
    @lpVtbl.value.send_opaque_command.unsafe_as(Proc(OPAQUECOMMAND*, HRESULT)).call(pcommand)
  end
end
struct LibWin32::IWMDMStorage2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_attributes(dwattributes : UInt32, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.set_attributes.unsafe_as(Proc(UInt32, WAVEFORMATEX*, HRESULT)).call(dwattributes, pformat)
  end
  def get_storage_globals(ppstorageglobals : IWMDMStorageGlobals*) : HRESULT
    @lpVtbl.value.get_storage_globals.unsafe_as(Proc(IWMDMStorageGlobals*, HRESULT)).call(ppstorageglobals)
  end
  def get_attributes(pdwattributes : UInt32*, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.get_attributes.unsafe_as(Proc(UInt32*, WAVEFORMATEX*, HRESULT)).call(pdwattributes, pformat)
  end
  def get_name(pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(Char*, UInt32, HRESULT)).call(pwszname, nmaxchars)
  end
  def get_date(pdatetimeutc : WMDMDATETIME*) : HRESULT
    @lpVtbl.value.get_date.unsafe_as(Proc(WMDMDATETIME*, HRESULT)).call(pdatetimeutc)
  end
  def get_size(pdwsizelow : UInt32*, pdwsizehigh : UInt32*) : HRESULT
    @lpVtbl.value.get_size.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pdwsizelow, pdwsizehigh)
  end
  def get_rights(pprights : WMDMRIGHTS**, pnrightscount : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_rights.unsafe_as(Proc(WMDMRIGHTS**, UInt32*, UInt8*, HRESULT)).call(pprights, pnrightscount, abmac)
  end
  def enum_storage(penumstorage : IWMDMEnumStorage*) : HRESULT
    @lpVtbl.value.enum_storage.unsafe_as(Proc(IWMDMEnumStorage*, HRESULT)).call(penumstorage)
  end
  def send_opaque_command(pcommand : OPAQUECOMMAND*) : HRESULT
    @lpVtbl.value.send_opaque_command.unsafe_as(Proc(OPAQUECOMMAND*, HRESULT)).call(pcommand)
  end
  def get_storage(pszstoragename : LibC::LPWSTR, ppstorage : IWMDMStorage*) : HRESULT
    @lpVtbl.value.get_storage.unsafe_as(Proc(LibC::LPWSTR, IWMDMStorage*, HRESULT)).call(pszstoragename, ppstorage)
  end
  def set_attributes2(dwattributes : UInt32, dwattributesex : UInt32, pformat : WAVEFORMATEX*, pvideoformat : VIDEOINFOHEADER*) : HRESULT
    @lpVtbl.value.set_attributes2.unsafe_as(Proc(UInt32, UInt32, WAVEFORMATEX*, VIDEOINFOHEADER*, HRESULT)).call(dwattributes, dwattributesex, pformat, pvideoformat)
  end
  def get_attributes2(pdwattributes : UInt32*, pdwattributesex : UInt32*, paudioformat : WAVEFORMATEX*, pvideoformat : VIDEOINFOHEADER*) : HRESULT
    @lpVtbl.value.get_attributes2.unsafe_as(Proc(UInt32*, UInt32*, WAVEFORMATEX*, VIDEOINFOHEADER*, HRESULT)).call(pdwattributes, pdwattributesex, paudioformat, pvideoformat)
  end
end
struct LibWin32::IWMDMStorage3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_attributes(dwattributes : UInt32, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.set_attributes.unsafe_as(Proc(UInt32, WAVEFORMATEX*, HRESULT)).call(dwattributes, pformat)
  end
  def get_storage_globals(ppstorageglobals : IWMDMStorageGlobals*) : HRESULT
    @lpVtbl.value.get_storage_globals.unsafe_as(Proc(IWMDMStorageGlobals*, HRESULT)).call(ppstorageglobals)
  end
  def get_attributes(pdwattributes : UInt32*, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.get_attributes.unsafe_as(Proc(UInt32*, WAVEFORMATEX*, HRESULT)).call(pdwattributes, pformat)
  end
  def get_name(pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(Char*, UInt32, HRESULT)).call(pwszname, nmaxchars)
  end
  def get_date(pdatetimeutc : WMDMDATETIME*) : HRESULT
    @lpVtbl.value.get_date.unsafe_as(Proc(WMDMDATETIME*, HRESULT)).call(pdatetimeutc)
  end
  def get_size(pdwsizelow : UInt32*, pdwsizehigh : UInt32*) : HRESULT
    @lpVtbl.value.get_size.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pdwsizelow, pdwsizehigh)
  end
  def get_rights(pprights : WMDMRIGHTS**, pnrightscount : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_rights.unsafe_as(Proc(WMDMRIGHTS**, UInt32*, UInt8*, HRESULT)).call(pprights, pnrightscount, abmac)
  end
  def enum_storage(penumstorage : IWMDMEnumStorage*) : HRESULT
    @lpVtbl.value.enum_storage.unsafe_as(Proc(IWMDMEnumStorage*, HRESULT)).call(penumstorage)
  end
  def send_opaque_command(pcommand : OPAQUECOMMAND*) : HRESULT
    @lpVtbl.value.send_opaque_command.unsafe_as(Proc(OPAQUECOMMAND*, HRESULT)).call(pcommand)
  end
  def get_storage(pszstoragename : LibC::LPWSTR, ppstorage : IWMDMStorage*) : HRESULT
    @lpVtbl.value.get_storage.unsafe_as(Proc(LibC::LPWSTR, IWMDMStorage*, HRESULT)).call(pszstoragename, ppstorage)
  end
  def set_attributes2(dwattributes : UInt32, dwattributesex : UInt32, pformat : WAVEFORMATEX*, pvideoformat : VIDEOINFOHEADER*) : HRESULT
    @lpVtbl.value.set_attributes2.unsafe_as(Proc(UInt32, UInt32, WAVEFORMATEX*, VIDEOINFOHEADER*, HRESULT)).call(dwattributes, dwattributesex, pformat, pvideoformat)
  end
  def get_attributes2(pdwattributes : UInt32*, pdwattributesex : UInt32*, paudioformat : WAVEFORMATEX*, pvideoformat : VIDEOINFOHEADER*) : HRESULT
    @lpVtbl.value.get_attributes2.unsafe_as(Proc(UInt32*, UInt32*, WAVEFORMATEX*, VIDEOINFOHEADER*, HRESULT)).call(pdwattributes, pdwattributesex, paudioformat, pvideoformat)
  end
  def get_metadata(ppmetadata : IWMDMMetaData*) : HRESULT
    @lpVtbl.value.get_metadata.unsafe_as(Proc(IWMDMMetaData*, HRESULT)).call(ppmetadata)
  end
  def set_metadata(pmetadata : IWMDMMetaData) : HRESULT
    @lpVtbl.value.set_metadata.unsafe_as(Proc(IWMDMMetaData, HRESULT)).call(pmetadata)
  end
  def create_empty_metadata_object(ppmetadata : IWMDMMetaData*) : HRESULT
    @lpVtbl.value.create_empty_metadata_object.unsafe_as(Proc(IWMDMMetaData*, HRESULT)).call(ppmetadata)
  end
  def set_enum_preference(pmode : WMDM_STORAGE_ENUM_MODE*, nviews : UInt32, pviews : WMDMMetadataView*) : HRESULT
    @lpVtbl.value.set_enum_preference.unsafe_as(Proc(WMDM_STORAGE_ENUM_MODE*, UInt32, WMDMMetadataView*, HRESULT)).call(pmode, nviews, pviews)
  end
end
struct LibWin32::IWMDMStorage4
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_attributes(dwattributes : UInt32, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.set_attributes.unsafe_as(Proc(UInt32, WAVEFORMATEX*, HRESULT)).call(dwattributes, pformat)
  end
  def get_storage_globals(ppstorageglobals : IWMDMStorageGlobals*) : HRESULT
    @lpVtbl.value.get_storage_globals.unsafe_as(Proc(IWMDMStorageGlobals*, HRESULT)).call(ppstorageglobals)
  end
  def get_attributes(pdwattributes : UInt32*, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.get_attributes.unsafe_as(Proc(UInt32*, WAVEFORMATEX*, HRESULT)).call(pdwattributes, pformat)
  end
  def get_name(pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(Char*, UInt32, HRESULT)).call(pwszname, nmaxchars)
  end
  def get_date(pdatetimeutc : WMDMDATETIME*) : HRESULT
    @lpVtbl.value.get_date.unsafe_as(Proc(WMDMDATETIME*, HRESULT)).call(pdatetimeutc)
  end
  def get_size(pdwsizelow : UInt32*, pdwsizehigh : UInt32*) : HRESULT
    @lpVtbl.value.get_size.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pdwsizelow, pdwsizehigh)
  end
  def get_rights(pprights : WMDMRIGHTS**, pnrightscount : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_rights.unsafe_as(Proc(WMDMRIGHTS**, UInt32*, UInt8*, HRESULT)).call(pprights, pnrightscount, abmac)
  end
  def enum_storage(penumstorage : IWMDMEnumStorage*) : HRESULT
    @lpVtbl.value.enum_storage.unsafe_as(Proc(IWMDMEnumStorage*, HRESULT)).call(penumstorage)
  end
  def send_opaque_command(pcommand : OPAQUECOMMAND*) : HRESULT
    @lpVtbl.value.send_opaque_command.unsafe_as(Proc(OPAQUECOMMAND*, HRESULT)).call(pcommand)
  end
  def get_storage(pszstoragename : LibC::LPWSTR, ppstorage : IWMDMStorage*) : HRESULT
    @lpVtbl.value.get_storage.unsafe_as(Proc(LibC::LPWSTR, IWMDMStorage*, HRESULT)).call(pszstoragename, ppstorage)
  end
  def set_attributes2(dwattributes : UInt32, dwattributesex : UInt32, pformat : WAVEFORMATEX*, pvideoformat : VIDEOINFOHEADER*) : HRESULT
    @lpVtbl.value.set_attributes2.unsafe_as(Proc(UInt32, UInt32, WAVEFORMATEX*, VIDEOINFOHEADER*, HRESULT)).call(dwattributes, dwattributesex, pformat, pvideoformat)
  end
  def get_attributes2(pdwattributes : UInt32*, pdwattributesex : UInt32*, paudioformat : WAVEFORMATEX*, pvideoformat : VIDEOINFOHEADER*) : HRESULT
    @lpVtbl.value.get_attributes2.unsafe_as(Proc(UInt32*, UInt32*, WAVEFORMATEX*, VIDEOINFOHEADER*, HRESULT)).call(pdwattributes, pdwattributesex, paudioformat, pvideoformat)
  end
  def get_metadata(ppmetadata : IWMDMMetaData*) : HRESULT
    @lpVtbl.value.get_metadata.unsafe_as(Proc(IWMDMMetaData*, HRESULT)).call(ppmetadata)
  end
  def set_metadata(pmetadata : IWMDMMetaData) : HRESULT
    @lpVtbl.value.set_metadata.unsafe_as(Proc(IWMDMMetaData, HRESULT)).call(pmetadata)
  end
  def create_empty_metadata_object(ppmetadata : IWMDMMetaData*) : HRESULT
    @lpVtbl.value.create_empty_metadata_object.unsafe_as(Proc(IWMDMMetaData*, HRESULT)).call(ppmetadata)
  end
  def set_enum_preference(pmode : WMDM_STORAGE_ENUM_MODE*, nviews : UInt32, pviews : WMDMMetadataView*) : HRESULT
    @lpVtbl.value.set_enum_preference.unsafe_as(Proc(WMDM_STORAGE_ENUM_MODE*, UInt32, WMDMMetadataView*, HRESULT)).call(pmode, nviews, pviews)
  end
  def set_references(dwrefs : UInt32, ppiwmdmstorage : IWMDMStorage*) : HRESULT
    @lpVtbl.value.set_references.unsafe_as(Proc(UInt32, IWMDMStorage*, HRESULT)).call(dwrefs, ppiwmdmstorage)
  end
  def get_references(pdwrefs : UInt32*, pppiwmdmstorage : IWMDMStorage**) : HRESULT
    @lpVtbl.value.get_references.unsafe_as(Proc(UInt32*, IWMDMStorage**, HRESULT)).call(pdwrefs, pppiwmdmstorage)
  end
  def get_rights_with_progress(piprogresscallback : IWMDMProgress3, pprights : WMDMRIGHTS**, pnrightscount : UInt32*) : HRESULT
    @lpVtbl.value.get_rights_with_progress.unsafe_as(Proc(IWMDMProgress3, WMDMRIGHTS**, UInt32*, HRESULT)).call(piprogresscallback, pprights, pnrightscount)
  end
  def get_specified_metadata(cproperties : UInt32, ppwszpropnames : LibC::LPWSTR*, ppmetadata : IWMDMMetaData*) : HRESULT
    @lpVtbl.value.get_specified_metadata.unsafe_as(Proc(UInt32, LibC::LPWSTR*, IWMDMMetaData*, HRESULT)).call(cproperties, ppwszpropnames, ppmetadata)
  end
  def find_storage(findscope : WMDM_FIND_SCOPE, pwszuniqueid : LibC::LPWSTR, ppstorage : IWMDMStorage*) : HRESULT
    @lpVtbl.value.find_storage.unsafe_as(Proc(WMDM_FIND_SCOPE, LibC::LPWSTR, IWMDMStorage*, HRESULT)).call(findscope, pwszuniqueid, ppstorage)
  end
  def get_parent(ppstorage : IWMDMStorage*) : HRESULT
    @lpVtbl.value.get_parent.unsafe_as(Proc(IWMDMStorage*, HRESULT)).call(ppstorage)
  end
end
struct LibWin32::IWMDMOperation
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def begin_read : HRESULT
    @lpVtbl.value.begin_read.unsafe_as(Proc(HRESULT)).call
  end
  def begin_write : HRESULT
    @lpVtbl.value.begin_write.unsafe_as(Proc(HRESULT)).call
  end
  def get_object_name(pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_object_name.unsafe_as(Proc(Char*, UInt32, HRESULT)).call(pwszname, nmaxchars)
  end
  def set_object_name(pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.set_object_name.unsafe_as(Proc(Char*, UInt32, HRESULT)).call(pwszname, nmaxchars)
  end
  def get_object_attributes(pdwattributes : UInt32*, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.get_object_attributes.unsafe_as(Proc(UInt32*, WAVEFORMATEX*, HRESULT)).call(pdwattributes, pformat)
  end
  def set_object_attributes(dwattributes : UInt32, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.set_object_attributes.unsafe_as(Proc(UInt32, WAVEFORMATEX*, HRESULT)).call(dwattributes, pformat)
  end
  def get_object_total_size(pdwsize : UInt32*, pdwsizehigh : UInt32*) : HRESULT
    @lpVtbl.value.get_object_total_size.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pdwsize, pdwsizehigh)
  end
  def set_object_total_size(dwsize : UInt32, dwsizehigh : UInt32) : HRESULT
    @lpVtbl.value.set_object_total_size.unsafe_as(Proc(UInt32, UInt32, HRESULT)).call(dwsize, dwsizehigh)
  end
  def transfer_object_data(pdata : UInt8*, pdwsize : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.transfer_object_data.unsafe_as(Proc(UInt8*, UInt32*, UInt8*, HRESULT)).call(pdata, pdwsize, abmac)
  end
  def end_(phcompletioncode : HRESULT*, pnewobject : IUnknown) : HRESULT
    @lpVtbl.value.end_.unsafe_as(Proc(HRESULT*, IUnknown, HRESULT)).call(phcompletioncode, pnewobject)
  end
end
struct LibWin32::IWMDMOperation2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def begin_read : HRESULT
    @lpVtbl.value.begin_read.unsafe_as(Proc(HRESULT)).call
  end
  def begin_write : HRESULT
    @lpVtbl.value.begin_write.unsafe_as(Proc(HRESULT)).call
  end
  def get_object_name(pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_object_name.unsafe_as(Proc(Char*, UInt32, HRESULT)).call(pwszname, nmaxchars)
  end
  def set_object_name(pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.set_object_name.unsafe_as(Proc(Char*, UInt32, HRESULT)).call(pwszname, nmaxchars)
  end
  def get_object_attributes(pdwattributes : UInt32*, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.get_object_attributes.unsafe_as(Proc(UInt32*, WAVEFORMATEX*, HRESULT)).call(pdwattributes, pformat)
  end
  def set_object_attributes(dwattributes : UInt32, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.set_object_attributes.unsafe_as(Proc(UInt32, WAVEFORMATEX*, HRESULT)).call(dwattributes, pformat)
  end
  def get_object_total_size(pdwsize : UInt32*, pdwsizehigh : UInt32*) : HRESULT
    @lpVtbl.value.get_object_total_size.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pdwsize, pdwsizehigh)
  end
  def set_object_total_size(dwsize : UInt32, dwsizehigh : UInt32) : HRESULT
    @lpVtbl.value.set_object_total_size.unsafe_as(Proc(UInt32, UInt32, HRESULT)).call(dwsize, dwsizehigh)
  end
  def transfer_object_data(pdata : UInt8*, pdwsize : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.transfer_object_data.unsafe_as(Proc(UInt8*, UInt32*, UInt8*, HRESULT)).call(pdata, pdwsize, abmac)
  end
  def end_(phcompletioncode : HRESULT*, pnewobject : IUnknown) : HRESULT
    @lpVtbl.value.end_.unsafe_as(Proc(HRESULT*, IUnknown, HRESULT)).call(phcompletioncode, pnewobject)
  end
  def set_object_attributes2(dwattributes : UInt32, dwattributesex : UInt32, pformat : WAVEFORMATEX*, pvideoformat : VIDEOINFOHEADER*) : HRESULT
    @lpVtbl.value.set_object_attributes2.unsafe_as(Proc(UInt32, UInt32, WAVEFORMATEX*, VIDEOINFOHEADER*, HRESULT)).call(dwattributes, dwattributesex, pformat, pvideoformat)
  end
  def get_object_attributes2(pdwattributes : UInt32*, pdwattributesex : UInt32*, paudioformat : WAVEFORMATEX*, pvideoformat : VIDEOINFOHEADER*) : HRESULT
    @lpVtbl.value.get_object_attributes2.unsafe_as(Proc(UInt32*, UInt32*, WAVEFORMATEX*, VIDEOINFOHEADER*, HRESULT)).call(pdwattributes, pdwattributesex, paudioformat, pvideoformat)
  end
end
struct LibWin32::IWMDMOperation3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def begin_read : HRESULT
    @lpVtbl.value.begin_read.unsafe_as(Proc(HRESULT)).call
  end
  def begin_write : HRESULT
    @lpVtbl.value.begin_write.unsafe_as(Proc(HRESULT)).call
  end
  def get_object_name(pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_object_name.unsafe_as(Proc(Char*, UInt32, HRESULT)).call(pwszname, nmaxchars)
  end
  def set_object_name(pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.set_object_name.unsafe_as(Proc(Char*, UInt32, HRESULT)).call(pwszname, nmaxchars)
  end
  def get_object_attributes(pdwattributes : UInt32*, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.get_object_attributes.unsafe_as(Proc(UInt32*, WAVEFORMATEX*, HRESULT)).call(pdwattributes, pformat)
  end
  def set_object_attributes(dwattributes : UInt32, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.set_object_attributes.unsafe_as(Proc(UInt32, WAVEFORMATEX*, HRESULT)).call(dwattributes, pformat)
  end
  def get_object_total_size(pdwsize : UInt32*, pdwsizehigh : UInt32*) : HRESULT
    @lpVtbl.value.get_object_total_size.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pdwsize, pdwsizehigh)
  end
  def set_object_total_size(dwsize : UInt32, dwsizehigh : UInt32) : HRESULT
    @lpVtbl.value.set_object_total_size.unsafe_as(Proc(UInt32, UInt32, HRESULT)).call(dwsize, dwsizehigh)
  end
  def transfer_object_data(pdata : UInt8*, pdwsize : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.transfer_object_data.unsafe_as(Proc(UInt8*, UInt32*, UInt8*, HRESULT)).call(pdata, pdwsize, abmac)
  end
  def end_(phcompletioncode : HRESULT*, pnewobject : IUnknown) : HRESULT
    @lpVtbl.value.end_.unsafe_as(Proc(HRESULT*, IUnknown, HRESULT)).call(phcompletioncode, pnewobject)
  end
  def transfer_object_data_on_clear_channel(pdata : UInt8*, pdwsize : UInt32*) : HRESULT
    @lpVtbl.value.transfer_object_data_on_clear_channel.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pdata, pdwsize)
  end
end
struct LibWin32::IWMDMProgress
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def begin_(dwestimatedticks : UInt32) : HRESULT
    @lpVtbl.value.begin_.unsafe_as(Proc(UInt32, HRESULT)).call(dwestimatedticks)
  end
  def progress(dwtranspiredticks : UInt32) : HRESULT
    @lpVtbl.value.progress.unsafe_as(Proc(UInt32, HRESULT)).call(dwtranspiredticks)
  end
  def end_ : HRESULT
    @lpVtbl.value.end_.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IWMDMProgress2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def begin_(dwestimatedticks : UInt32) : HRESULT
    @lpVtbl.value.begin_.unsafe_as(Proc(UInt32, HRESULT)).call(dwestimatedticks)
  end
  def progress(dwtranspiredticks : UInt32) : HRESULT
    @lpVtbl.value.progress.unsafe_as(Proc(UInt32, HRESULT)).call(dwtranspiredticks)
  end
  def end_ : HRESULT
    @lpVtbl.value.end_.unsafe_as(Proc(HRESULT)).call
  end
  def end2(hrcompletioncode : HRESULT) : HRESULT
    @lpVtbl.value.end2.unsafe_as(Proc(HRESULT, HRESULT)).call(hrcompletioncode)
  end
end
struct LibWin32::IWMDMProgress3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def begin_(dwestimatedticks : UInt32) : HRESULT
    @lpVtbl.value.begin_.unsafe_as(Proc(UInt32, HRESULT)).call(dwestimatedticks)
  end
  def progress(dwtranspiredticks : UInt32) : HRESULT
    @lpVtbl.value.progress.unsafe_as(Proc(UInt32, HRESULT)).call(dwtranspiredticks)
  end
  def end_ : HRESULT
    @lpVtbl.value.end_.unsafe_as(Proc(HRESULT)).call
  end
  def end2(hrcompletioncode : HRESULT) : HRESULT
    @lpVtbl.value.end2.unsafe_as(Proc(HRESULT, HRESULT)).call(hrcompletioncode)
  end
  def begin3(eventid : Guid, dwestimatedticks : UInt32, pcontext : OPAQUECOMMAND*) : HRESULT
    @lpVtbl.value.begin3.unsafe_as(Proc(Guid, UInt32, OPAQUECOMMAND*, HRESULT)).call(eventid, dwestimatedticks, pcontext)
  end
  def progress3(eventid : Guid, dwtranspiredticks : UInt32, pcontext : OPAQUECOMMAND*) : HRESULT
    @lpVtbl.value.progress3.unsafe_as(Proc(Guid, UInt32, OPAQUECOMMAND*, HRESULT)).call(eventid, dwtranspiredticks, pcontext)
  end
  def end3(eventid : Guid, hrcompletioncode : HRESULT, pcontext : OPAQUECOMMAND*) : HRESULT
    @lpVtbl.value.end3.unsafe_as(Proc(Guid, HRESULT, OPAQUECOMMAND*, HRESULT)).call(eventid, hrcompletioncode, pcontext)
  end
end
struct LibWin32::IWMDMDevice
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_name(pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(Char*, UInt32, HRESULT)).call(pwszname, nmaxchars)
  end
  def get_manufacturer(pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_manufacturer.unsafe_as(Proc(Char*, UInt32, HRESULT)).call(pwszname, nmaxchars)
  end
  def get_version(pdwversion : UInt32*) : HRESULT
    @lpVtbl.value.get_version.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwversion)
  end
  def get_type(pdwtype : UInt32*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwtype)
  end
  def get_serial_number(pserialnumber : WMDMID*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_serial_number.unsafe_as(Proc(WMDMID*, UInt8*, HRESULT)).call(pserialnumber, abmac)
  end
  def get_power_source(pdwpowersource : UInt32*, pdwpercentremaining : UInt32*) : HRESULT
    @lpVtbl.value.get_power_source.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pdwpowersource, pdwpercentremaining)
  end
  def get_status(pdwstatus : UInt32*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwstatus)
  end
  def get_device_icon(hicon : UInt32*) : HRESULT
    @lpVtbl.value.get_device_icon.unsafe_as(Proc(UInt32*, HRESULT)).call(hicon)
  end
  def enum_storage(ppenumstorage : IWMDMEnumStorage*) : HRESULT
    @lpVtbl.value.enum_storage.unsafe_as(Proc(IWMDMEnumStorage*, HRESULT)).call(ppenumstorage)
  end
  def get_format_support(ppformatex : WAVEFORMATEX**, pnformatcount : UInt32*, pppwszmimetype : LibC::LPWSTR**, pnmimetypecount : UInt32*) : HRESULT
    @lpVtbl.value.get_format_support.unsafe_as(Proc(WAVEFORMATEX**, UInt32*, LibC::LPWSTR**, UInt32*, HRESULT)).call(ppformatex, pnformatcount, pppwszmimetype, pnmimetypecount)
  end
  def send_opaque_command(pcommand : OPAQUECOMMAND*) : HRESULT
    @lpVtbl.value.send_opaque_command.unsafe_as(Proc(OPAQUECOMMAND*, HRESULT)).call(pcommand)
  end
end
struct LibWin32::IWMDMDevice2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_name(pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(Char*, UInt32, HRESULT)).call(pwszname, nmaxchars)
  end
  def get_manufacturer(pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_manufacturer.unsafe_as(Proc(Char*, UInt32, HRESULT)).call(pwszname, nmaxchars)
  end
  def get_version(pdwversion : UInt32*) : HRESULT
    @lpVtbl.value.get_version.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwversion)
  end
  def get_type(pdwtype : UInt32*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwtype)
  end
  def get_serial_number(pserialnumber : WMDMID*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_serial_number.unsafe_as(Proc(WMDMID*, UInt8*, HRESULT)).call(pserialnumber, abmac)
  end
  def get_power_source(pdwpowersource : UInt32*, pdwpercentremaining : UInt32*) : HRESULT
    @lpVtbl.value.get_power_source.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pdwpowersource, pdwpercentremaining)
  end
  def get_status(pdwstatus : UInt32*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwstatus)
  end
  def get_device_icon(hicon : UInt32*) : HRESULT
    @lpVtbl.value.get_device_icon.unsafe_as(Proc(UInt32*, HRESULT)).call(hicon)
  end
  def enum_storage(ppenumstorage : IWMDMEnumStorage*) : HRESULT
    @lpVtbl.value.enum_storage.unsafe_as(Proc(IWMDMEnumStorage*, HRESULT)).call(ppenumstorage)
  end
  def get_format_support(ppformatex : WAVEFORMATEX**, pnformatcount : UInt32*, pppwszmimetype : LibC::LPWSTR**, pnmimetypecount : UInt32*) : HRESULT
    @lpVtbl.value.get_format_support.unsafe_as(Proc(WAVEFORMATEX**, UInt32*, LibC::LPWSTR**, UInt32*, HRESULT)).call(ppformatex, pnformatcount, pppwszmimetype, pnmimetypecount)
  end
  def send_opaque_command(pcommand : OPAQUECOMMAND*) : HRESULT
    @lpVtbl.value.send_opaque_command.unsafe_as(Proc(OPAQUECOMMAND*, HRESULT)).call(pcommand)
  end
  def get_storage(pszstoragename : LibC::LPWSTR, ppstorage : IWMDMStorage*) : HRESULT
    @lpVtbl.value.get_storage.unsafe_as(Proc(LibC::LPWSTR, IWMDMStorage*, HRESULT)).call(pszstoragename, ppstorage)
  end
  def get_format_support2(dwflags : UInt32, ppaudioformatex : WAVEFORMATEX**, pnaudioformatcount : UInt32*, ppvideoformatex : VIDEOINFOHEADER**, pnvideoformatcount : UInt32*, ppfiletype : WMFILECAPABILITIES**, pnfiletypecount : UInt32*) : HRESULT
    @lpVtbl.value.get_format_support2.unsafe_as(Proc(UInt32, WAVEFORMATEX**, UInt32*, VIDEOINFOHEADER**, UInt32*, WMFILECAPABILITIES**, UInt32*, HRESULT)).call(dwflags, ppaudioformatex, pnaudioformatcount, ppvideoformatex, pnvideoformatcount, ppfiletype, pnfiletypecount)
  end
  def get_specify_property_pages(ppspecifyproppages : ISpecifyPropertyPages*, pppunknowns : IUnknown**, pcunks : UInt32*) : HRESULT
    @lpVtbl.value.get_specify_property_pages.unsafe_as(Proc(ISpecifyPropertyPages*, IUnknown**, UInt32*, HRESULT)).call(ppspecifyproppages, pppunknowns, pcunks)
  end
  def get_canonical_name(pwszpnpname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_canonical_name.unsafe_as(Proc(Char*, UInt32, HRESULT)).call(pwszpnpname, nmaxchars)
  end
end
struct LibWin32::IWMDMDevice3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_name(pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(Char*, UInt32, HRESULT)).call(pwszname, nmaxchars)
  end
  def get_manufacturer(pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_manufacturer.unsafe_as(Proc(Char*, UInt32, HRESULT)).call(pwszname, nmaxchars)
  end
  def get_version(pdwversion : UInt32*) : HRESULT
    @lpVtbl.value.get_version.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwversion)
  end
  def get_type(pdwtype : UInt32*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwtype)
  end
  def get_serial_number(pserialnumber : WMDMID*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_serial_number.unsafe_as(Proc(WMDMID*, UInt8*, HRESULT)).call(pserialnumber, abmac)
  end
  def get_power_source(pdwpowersource : UInt32*, pdwpercentremaining : UInt32*) : HRESULT
    @lpVtbl.value.get_power_source.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pdwpowersource, pdwpercentremaining)
  end
  def get_status(pdwstatus : UInt32*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwstatus)
  end
  def get_device_icon(hicon : UInt32*) : HRESULT
    @lpVtbl.value.get_device_icon.unsafe_as(Proc(UInt32*, HRESULT)).call(hicon)
  end
  def enum_storage(ppenumstorage : IWMDMEnumStorage*) : HRESULT
    @lpVtbl.value.enum_storage.unsafe_as(Proc(IWMDMEnumStorage*, HRESULT)).call(ppenumstorage)
  end
  def get_format_support(ppformatex : WAVEFORMATEX**, pnformatcount : UInt32*, pppwszmimetype : LibC::LPWSTR**, pnmimetypecount : UInt32*) : HRESULT
    @lpVtbl.value.get_format_support.unsafe_as(Proc(WAVEFORMATEX**, UInt32*, LibC::LPWSTR**, UInt32*, HRESULT)).call(ppformatex, pnformatcount, pppwszmimetype, pnmimetypecount)
  end
  def send_opaque_command(pcommand : OPAQUECOMMAND*) : HRESULT
    @lpVtbl.value.send_opaque_command.unsafe_as(Proc(OPAQUECOMMAND*, HRESULT)).call(pcommand)
  end
  def get_storage(pszstoragename : LibC::LPWSTR, ppstorage : IWMDMStorage*) : HRESULT
    @lpVtbl.value.get_storage.unsafe_as(Proc(LibC::LPWSTR, IWMDMStorage*, HRESULT)).call(pszstoragename, ppstorage)
  end
  def get_format_support2(dwflags : UInt32, ppaudioformatex : WAVEFORMATEX**, pnaudioformatcount : UInt32*, ppvideoformatex : VIDEOINFOHEADER**, pnvideoformatcount : UInt32*, ppfiletype : WMFILECAPABILITIES**, pnfiletypecount : UInt32*) : HRESULT
    @lpVtbl.value.get_format_support2.unsafe_as(Proc(UInt32, WAVEFORMATEX**, UInt32*, VIDEOINFOHEADER**, UInt32*, WMFILECAPABILITIES**, UInt32*, HRESULT)).call(dwflags, ppaudioformatex, pnaudioformatcount, ppvideoformatex, pnvideoformatcount, ppfiletype, pnfiletypecount)
  end
  def get_specify_property_pages(ppspecifyproppages : ISpecifyPropertyPages*, pppunknowns : IUnknown**, pcunks : UInt32*) : HRESULT
    @lpVtbl.value.get_specify_property_pages.unsafe_as(Proc(ISpecifyPropertyPages*, IUnknown**, UInt32*, HRESULT)).call(ppspecifyproppages, pppunknowns, pcunks)
  end
  def get_canonical_name(pwszpnpname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_canonical_name.unsafe_as(Proc(Char*, UInt32, HRESULT)).call(pwszpnpname, nmaxchars)
  end
  def get_property(pwszpropname : LibC::LPWSTR, pvalue : PROPVARIANT*) : HRESULT
    @lpVtbl.value.get_property.unsafe_as(Proc(LibC::LPWSTR, PROPVARIANT*, HRESULT)).call(pwszpropname, pvalue)
  end
  def set_property(pwszpropname : LibC::LPWSTR, pvalue : PROPVARIANT*) : HRESULT
    @lpVtbl.value.set_property.unsafe_as(Proc(LibC::LPWSTR, PROPVARIANT*, HRESULT)).call(pwszpropname, pvalue)
  end
  def get_format_capability(format : WMDM_FORMATCODE, pformatsupport : WMDM_FORMAT_CAPABILITY*) : HRESULT
    @lpVtbl.value.get_format_capability.unsafe_as(Proc(WMDM_FORMATCODE, WMDM_FORMAT_CAPABILITY*, HRESULT)).call(format, pformatsupport)
  end
  def device_io_control(dwiocontrolcode : UInt32, lpinbuffer : UInt8*, ninbuffersize : UInt32, lpoutbuffer : UInt8*, pnoutbuffersize : UInt32*) : HRESULT
    @lpVtbl.value.device_io_control.unsafe_as(Proc(UInt32, UInt8*, UInt32, UInt8*, UInt32*, HRESULT)).call(dwiocontrolcode, lpinbuffer, ninbuffersize, lpoutbuffer, pnoutbuffersize)
  end
  def find_storage(findscope : WMDM_FIND_SCOPE, pwszuniqueid : LibC::LPWSTR, ppstorage : IWMDMStorage*) : HRESULT
    @lpVtbl.value.find_storage.unsafe_as(Proc(WMDM_FIND_SCOPE, LibC::LPWSTR, IWMDMStorage*, HRESULT)).call(findscope, pwszuniqueid, ppstorage)
  end
end
struct LibWin32::IWMDMDeviceSession
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def begin_session(type : WMDM_SESSION_TYPE, pctx : UInt8*, dwsizectx : UInt32) : HRESULT
    @lpVtbl.value.begin_session.unsafe_as(Proc(WMDM_SESSION_TYPE, UInt8*, UInt32, HRESULT)).call(type, pctx, dwsizectx)
  end
  def end_session(type : WMDM_SESSION_TYPE, pctx : UInt8*, dwsizectx : UInt32) : HRESULT
    @lpVtbl.value.end_session.unsafe_as(Proc(WMDM_SESSION_TYPE, UInt8*, UInt32, HRESULT)).call(type, pctx, dwsizectx)
  end
end
struct LibWin32::IWMDMEnumDevice
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(celt : UInt32, ppdevice : IWMDMDevice*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, IWMDMDevice*, UInt32*, HRESULT)).call(celt, ppdevice, pceltfetched)
  end
  def skip(celt : UInt32, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, UInt32*, HRESULT)).call(celt, pceltfetched)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenumdevice : IWMDMEnumDevice*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IWMDMEnumDevice*, HRESULT)).call(ppenumdevice)
  end
end
struct LibWin32::IWMDMDeviceControl
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_status(pdwstatus : UInt32*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwstatus)
  end
  def get_capabilities(pdwcapabilitiesmask : UInt32*) : HRESULT
    @lpVtbl.value.get_capabilities.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwcapabilitiesmask)
  end
  def play : HRESULT
    @lpVtbl.value.play.unsafe_as(Proc(HRESULT)).call
  end
  def record(pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.record.unsafe_as(Proc(WAVEFORMATEX*, HRESULT)).call(pformat)
  end
  def pause : HRESULT
    @lpVtbl.value.pause.unsafe_as(Proc(HRESULT)).call
  end
  def resume : HRESULT
    @lpVtbl.value.resume.unsafe_as(Proc(HRESULT)).call
  end
  def stop : HRESULT
    @lpVtbl.value.stop.unsafe_as(Proc(HRESULT)).call
  end
  def seek(fumode : UInt32, noffset : Int32) : HRESULT
    @lpVtbl.value.seek.unsafe_as(Proc(UInt32, Int32, HRESULT)).call(fumode, noffset)
  end
end
struct LibWin32::IWMDMEnumStorage
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(celt : UInt32, ppstorage : IWMDMStorage*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, IWMDMStorage*, UInt32*, HRESULT)).call(celt, ppstorage, pceltfetched)
  end
  def skip(celt : UInt32, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, UInt32*, HRESULT)).call(celt, pceltfetched)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenumstorage : IWMDMEnumStorage*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IWMDMEnumStorage*, HRESULT)).call(ppenumstorage)
  end
end
struct LibWin32::IWMDMStorageControl
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def insert(fumode : UInt32, pwszfile : LibC::LPWSTR, poperation : IWMDMOperation, pprogress : IWMDMProgress, ppnewobject : IWMDMStorage*) : HRESULT
    @lpVtbl.value.insert.unsafe_as(Proc(UInt32, LibC::LPWSTR, IWMDMOperation, IWMDMProgress, IWMDMStorage*, HRESULT)).call(fumode, pwszfile, poperation, pprogress, ppnewobject)
  end
  def delete(fumode : UInt32, pprogress : IWMDMProgress) : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(UInt32, IWMDMProgress, HRESULT)).call(fumode, pprogress)
  end
  def rename(fumode : UInt32, pwsznewname : LibC::LPWSTR, pprogress : IWMDMProgress) : HRESULT
    @lpVtbl.value.rename.unsafe_as(Proc(UInt32, LibC::LPWSTR, IWMDMProgress, HRESULT)).call(fumode, pwsznewname, pprogress)
  end
  def read(fumode : UInt32, pwszfile : LibC::LPWSTR, pprogress : IWMDMProgress, poperation : IWMDMOperation) : HRESULT
    @lpVtbl.value.read.unsafe_as(Proc(UInt32, LibC::LPWSTR, IWMDMProgress, IWMDMOperation, HRESULT)).call(fumode, pwszfile, pprogress, poperation)
  end
  def move(fumode : UInt32, ptargetobject : IWMDMStorage, pprogress : IWMDMProgress) : HRESULT
    @lpVtbl.value.move.unsafe_as(Proc(UInt32, IWMDMStorage, IWMDMProgress, HRESULT)).call(fumode, ptargetobject, pprogress)
  end
end
struct LibWin32::IWMDMStorageControl2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def insert(fumode : UInt32, pwszfile : LibC::LPWSTR, poperation : IWMDMOperation, pprogress : IWMDMProgress, ppnewobject : IWMDMStorage*) : HRESULT
    @lpVtbl.value.insert.unsafe_as(Proc(UInt32, LibC::LPWSTR, IWMDMOperation, IWMDMProgress, IWMDMStorage*, HRESULT)).call(fumode, pwszfile, poperation, pprogress, ppnewobject)
  end
  def delete(fumode : UInt32, pprogress : IWMDMProgress) : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(UInt32, IWMDMProgress, HRESULT)).call(fumode, pprogress)
  end
  def rename(fumode : UInt32, pwsznewname : LibC::LPWSTR, pprogress : IWMDMProgress) : HRESULT
    @lpVtbl.value.rename.unsafe_as(Proc(UInt32, LibC::LPWSTR, IWMDMProgress, HRESULT)).call(fumode, pwsznewname, pprogress)
  end
  def read(fumode : UInt32, pwszfile : LibC::LPWSTR, pprogress : IWMDMProgress, poperation : IWMDMOperation) : HRESULT
    @lpVtbl.value.read.unsafe_as(Proc(UInt32, LibC::LPWSTR, IWMDMProgress, IWMDMOperation, HRESULT)).call(fumode, pwszfile, pprogress, poperation)
  end
  def move(fumode : UInt32, ptargetobject : IWMDMStorage, pprogress : IWMDMProgress) : HRESULT
    @lpVtbl.value.move.unsafe_as(Proc(UInt32, IWMDMStorage, IWMDMProgress, HRESULT)).call(fumode, ptargetobject, pprogress)
  end
  def insert2(fumode : UInt32, pwszfilesource : LibC::LPWSTR, pwszfiledest : LibC::LPWSTR, poperation : IWMDMOperation, pprogress : IWMDMProgress, punknown : IUnknown, ppnewobject : IWMDMStorage*) : HRESULT
    @lpVtbl.value.insert2.unsafe_as(Proc(UInt32, LibC::LPWSTR, LibC::LPWSTR, IWMDMOperation, IWMDMProgress, IUnknown, IWMDMStorage*, HRESULT)).call(fumode, pwszfilesource, pwszfiledest, poperation, pprogress, punknown, ppnewobject)
  end
end
struct LibWin32::IWMDMStorageControl3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def insert(fumode : UInt32, pwszfile : LibC::LPWSTR, poperation : IWMDMOperation, pprogress : IWMDMProgress, ppnewobject : IWMDMStorage*) : HRESULT
    @lpVtbl.value.insert.unsafe_as(Proc(UInt32, LibC::LPWSTR, IWMDMOperation, IWMDMProgress, IWMDMStorage*, HRESULT)).call(fumode, pwszfile, poperation, pprogress, ppnewobject)
  end
  def delete(fumode : UInt32, pprogress : IWMDMProgress) : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(UInt32, IWMDMProgress, HRESULT)).call(fumode, pprogress)
  end
  def rename(fumode : UInt32, pwsznewname : LibC::LPWSTR, pprogress : IWMDMProgress) : HRESULT
    @lpVtbl.value.rename.unsafe_as(Proc(UInt32, LibC::LPWSTR, IWMDMProgress, HRESULT)).call(fumode, pwsznewname, pprogress)
  end
  def read(fumode : UInt32, pwszfile : LibC::LPWSTR, pprogress : IWMDMProgress, poperation : IWMDMOperation) : HRESULT
    @lpVtbl.value.read.unsafe_as(Proc(UInt32, LibC::LPWSTR, IWMDMProgress, IWMDMOperation, HRESULT)).call(fumode, pwszfile, pprogress, poperation)
  end
  def move(fumode : UInt32, ptargetobject : IWMDMStorage, pprogress : IWMDMProgress) : HRESULT
    @lpVtbl.value.move.unsafe_as(Proc(UInt32, IWMDMStorage, IWMDMProgress, HRESULT)).call(fumode, ptargetobject, pprogress)
  end
  def insert2(fumode : UInt32, pwszfilesource : LibC::LPWSTR, pwszfiledest : LibC::LPWSTR, poperation : IWMDMOperation, pprogress : IWMDMProgress, punknown : IUnknown, ppnewobject : IWMDMStorage*) : HRESULT
    @lpVtbl.value.insert2.unsafe_as(Proc(UInt32, LibC::LPWSTR, LibC::LPWSTR, IWMDMOperation, IWMDMProgress, IUnknown, IWMDMStorage*, HRESULT)).call(fumode, pwszfilesource, pwszfiledest, poperation, pprogress, punknown, ppnewobject)
  end
  def insert3(fumode : UInt32, futype : UInt32, pwszfilesource : LibC::LPWSTR, pwszfiledest : LibC::LPWSTR, poperation : IWMDMOperation, pprogress : IWMDMProgress, pmetadata : IWMDMMetaData, punknown : IUnknown, ppnewobject : IWMDMStorage*) : HRESULT
    @lpVtbl.value.insert3.unsafe_as(Proc(UInt32, UInt32, LibC::LPWSTR, LibC::LPWSTR, IWMDMOperation, IWMDMProgress, IWMDMMetaData, IUnknown, IWMDMStorage*, HRESULT)).call(fumode, futype, pwszfilesource, pwszfiledest, poperation, pprogress, pmetadata, punknown, ppnewobject)
  end
end
struct LibWin32::IWMDMObjectInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_play_length(pdwlength : UInt32*) : HRESULT
    @lpVtbl.value.get_play_length.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwlength)
  end
  def set_play_length(dwlength : UInt32) : HRESULT
    @lpVtbl.value.set_play_length.unsafe_as(Proc(UInt32, HRESULT)).call(dwlength)
  end
  def get_play_offset(pdwoffset : UInt32*) : HRESULT
    @lpVtbl.value.get_play_offset.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwoffset)
  end
  def set_play_offset(dwoffset : UInt32) : HRESULT
    @lpVtbl.value.set_play_offset.unsafe_as(Proc(UInt32, HRESULT)).call(dwoffset)
  end
  def get_total_length(pdwlength : UInt32*) : HRESULT
    @lpVtbl.value.get_total_length.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwlength)
  end
  def get_last_play_position(pdwlastpos : UInt32*) : HRESULT
    @lpVtbl.value.get_last_play_position.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwlastpos)
  end
  def get_longest_play_position(pdwlongestpos : UInt32*) : HRESULT
    @lpVtbl.value.get_longest_play_position.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwlongestpos)
  end
end
struct LibWin32::IWMDMRevoked
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_revocation_url(ppwszrevocationurl : LibC::LPWSTR*, pdwbufferlen : UInt32*, pdwrevokedbitflag : UInt32*) : HRESULT
    @lpVtbl.value.get_revocation_url.unsafe_as(Proc(LibC::LPWSTR*, UInt32*, UInt32*, HRESULT)).call(ppwszrevocationurl, pdwbufferlen, pdwrevokedbitflag)
  end
end
struct LibWin32::IWMDMNotification
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def wmdm_message(dwmessagetype : UInt32, pwszcanonicalname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.wmdm_message.unsafe_as(Proc(UInt32, LibC::LPWSTR, HRESULT)).call(dwmessagetype, pwszcanonicalname)
  end
end
struct LibWin32::IMDServiceProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_device_count(pdwcount : UInt32*) : HRESULT
    @lpVtbl.value.get_device_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwcount)
  end
  def enum_devices(ppenumdevice : IMDSPEnumDevice*) : HRESULT
    @lpVtbl.value.enum_devices.unsafe_as(Proc(IMDSPEnumDevice*, HRESULT)).call(ppenumdevice)
  end
end
struct LibWin32::IMDServiceProvider2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_device_count(pdwcount : UInt32*) : HRESULT
    @lpVtbl.value.get_device_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwcount)
  end
  def enum_devices(ppenumdevice : IMDSPEnumDevice*) : HRESULT
    @lpVtbl.value.enum_devices.unsafe_as(Proc(IMDSPEnumDevice*, HRESULT)).call(ppenumdevice)
  end
  def create_device(pwszdevicepath : LibC::LPWSTR, pdwcount : UInt32*, pppdevicearray : IMDSPDevice**) : HRESULT
    @lpVtbl.value.create_device.unsafe_as(Proc(LibC::LPWSTR, UInt32*, IMDSPDevice**, HRESULT)).call(pwszdevicepath, pdwcount, pppdevicearray)
  end
end
struct LibWin32::IMDServiceProvider3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_device_count(pdwcount : UInt32*) : HRESULT
    @lpVtbl.value.get_device_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwcount)
  end
  def enum_devices(ppenumdevice : IMDSPEnumDevice*) : HRESULT
    @lpVtbl.value.enum_devices.unsafe_as(Proc(IMDSPEnumDevice*, HRESULT)).call(ppenumdevice)
  end
  def create_device(pwszdevicepath : LibC::LPWSTR, pdwcount : UInt32*, pppdevicearray : IMDSPDevice**) : HRESULT
    @lpVtbl.value.create_device.unsafe_as(Proc(LibC::LPWSTR, UInt32*, IMDSPDevice**, HRESULT)).call(pwszdevicepath, pdwcount, pppdevicearray)
  end
  def set_device_enum_preference(dwenumpref : UInt32) : HRESULT
    @lpVtbl.value.set_device_enum_preference.unsafe_as(Proc(UInt32, HRESULT)).call(dwenumpref)
  end
end
struct LibWin32::IMDSPEnumDevice
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(celt : UInt32, ppdevice : IMDSPDevice*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, IMDSPDevice*, UInt32*, HRESULT)).call(celt, ppdevice, pceltfetched)
  end
  def skip(celt : UInt32, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, UInt32*, HRESULT)).call(celt, pceltfetched)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenumdevice : IMDSPEnumDevice*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IMDSPEnumDevice*, HRESULT)).call(ppenumdevice)
  end
end
struct LibWin32::IMDSPDevice
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_name(pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(Char*, UInt32, HRESULT)).call(pwszname, nmaxchars)
  end
  def get_manufacturer(pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_manufacturer.unsafe_as(Proc(Char*, UInt32, HRESULT)).call(pwszname, nmaxchars)
  end
  def get_version(pdwversion : UInt32*) : HRESULT
    @lpVtbl.value.get_version.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwversion)
  end
  def get_type(pdwtype : UInt32*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwtype)
  end
  def get_serial_number(pserialnumber : WMDMID*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_serial_number.unsafe_as(Proc(WMDMID*, UInt8*, HRESULT)).call(pserialnumber, abmac)
  end
  def get_power_source(pdwpowersource : UInt32*, pdwpercentremaining : UInt32*) : HRESULT
    @lpVtbl.value.get_power_source.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pdwpowersource, pdwpercentremaining)
  end
  def get_status(pdwstatus : UInt32*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwstatus)
  end
  def get_device_icon(hicon : UInt32*) : HRESULT
    @lpVtbl.value.get_device_icon.unsafe_as(Proc(UInt32*, HRESULT)).call(hicon)
  end
  def enum_storage(ppenumstorage : IMDSPEnumStorage*) : HRESULT
    @lpVtbl.value.enum_storage.unsafe_as(Proc(IMDSPEnumStorage*, HRESULT)).call(ppenumstorage)
  end
  def get_format_support(pformatex : WAVEFORMATEX**, pnformatcount : UInt32*, pppwszmimetype : LibC::LPWSTR**, pnmimetypecount : UInt32*) : HRESULT
    @lpVtbl.value.get_format_support.unsafe_as(Proc(WAVEFORMATEX**, UInt32*, LibC::LPWSTR**, UInt32*, HRESULT)).call(pformatex, pnformatcount, pppwszmimetype, pnmimetypecount)
  end
  def send_opaque_command(pcommand : OPAQUECOMMAND*) : HRESULT
    @lpVtbl.value.send_opaque_command.unsafe_as(Proc(OPAQUECOMMAND*, HRESULT)).call(pcommand)
  end
end
struct LibWin32::IMDSPDevice2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_name(pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(Char*, UInt32, HRESULT)).call(pwszname, nmaxchars)
  end
  def get_manufacturer(pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_manufacturer.unsafe_as(Proc(Char*, UInt32, HRESULT)).call(pwszname, nmaxchars)
  end
  def get_version(pdwversion : UInt32*) : HRESULT
    @lpVtbl.value.get_version.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwversion)
  end
  def get_type(pdwtype : UInt32*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwtype)
  end
  def get_serial_number(pserialnumber : WMDMID*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_serial_number.unsafe_as(Proc(WMDMID*, UInt8*, HRESULT)).call(pserialnumber, abmac)
  end
  def get_power_source(pdwpowersource : UInt32*, pdwpercentremaining : UInt32*) : HRESULT
    @lpVtbl.value.get_power_source.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pdwpowersource, pdwpercentremaining)
  end
  def get_status(pdwstatus : UInt32*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwstatus)
  end
  def get_device_icon(hicon : UInt32*) : HRESULT
    @lpVtbl.value.get_device_icon.unsafe_as(Proc(UInt32*, HRESULT)).call(hicon)
  end
  def enum_storage(ppenumstorage : IMDSPEnumStorage*) : HRESULT
    @lpVtbl.value.enum_storage.unsafe_as(Proc(IMDSPEnumStorage*, HRESULT)).call(ppenumstorage)
  end
  def get_format_support(pformatex : WAVEFORMATEX**, pnformatcount : UInt32*, pppwszmimetype : LibC::LPWSTR**, pnmimetypecount : UInt32*) : HRESULT
    @lpVtbl.value.get_format_support.unsafe_as(Proc(WAVEFORMATEX**, UInt32*, LibC::LPWSTR**, UInt32*, HRESULT)).call(pformatex, pnformatcount, pppwszmimetype, pnmimetypecount)
  end
  def send_opaque_command(pcommand : OPAQUECOMMAND*) : HRESULT
    @lpVtbl.value.send_opaque_command.unsafe_as(Proc(OPAQUECOMMAND*, HRESULT)).call(pcommand)
  end
  def get_storage(pszstoragename : LibC::LPWSTR, ppstorage : IMDSPStorage*) : HRESULT
    @lpVtbl.value.get_storage.unsafe_as(Proc(LibC::LPWSTR, IMDSPStorage*, HRESULT)).call(pszstoragename, ppstorage)
  end
  def get_format_support2(dwflags : UInt32, ppaudioformatex : WAVEFORMATEX**, pnaudioformatcount : UInt32*, ppvideoformatex : VIDEOINFOHEADER**, pnvideoformatcount : UInt32*, ppfiletype : WMFILECAPABILITIES**, pnfiletypecount : UInt32*) : HRESULT
    @lpVtbl.value.get_format_support2.unsafe_as(Proc(UInt32, WAVEFORMATEX**, UInt32*, VIDEOINFOHEADER**, UInt32*, WMFILECAPABILITIES**, UInt32*, HRESULT)).call(dwflags, ppaudioformatex, pnaudioformatcount, ppvideoformatex, pnvideoformatcount, ppfiletype, pnfiletypecount)
  end
  def get_specify_property_pages(ppspecifyproppages : ISpecifyPropertyPages*, pppunknowns : IUnknown**, pcunks : UInt32*) : HRESULT
    @lpVtbl.value.get_specify_property_pages.unsafe_as(Proc(ISpecifyPropertyPages*, IUnknown**, UInt32*, HRESULT)).call(ppspecifyproppages, pppunknowns, pcunks)
  end
  def get_canonical_name(pwszpnpname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_canonical_name.unsafe_as(Proc(Char*, UInt32, HRESULT)).call(pwszpnpname, nmaxchars)
  end
end
struct LibWin32::IMDSPDevice3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_name(pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(Char*, UInt32, HRESULT)).call(pwszname, nmaxchars)
  end
  def get_manufacturer(pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_manufacturer.unsafe_as(Proc(Char*, UInt32, HRESULT)).call(pwszname, nmaxchars)
  end
  def get_version(pdwversion : UInt32*) : HRESULT
    @lpVtbl.value.get_version.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwversion)
  end
  def get_type(pdwtype : UInt32*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwtype)
  end
  def get_serial_number(pserialnumber : WMDMID*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_serial_number.unsafe_as(Proc(WMDMID*, UInt8*, HRESULT)).call(pserialnumber, abmac)
  end
  def get_power_source(pdwpowersource : UInt32*, pdwpercentremaining : UInt32*) : HRESULT
    @lpVtbl.value.get_power_source.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pdwpowersource, pdwpercentremaining)
  end
  def get_status(pdwstatus : UInt32*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwstatus)
  end
  def get_device_icon(hicon : UInt32*) : HRESULT
    @lpVtbl.value.get_device_icon.unsafe_as(Proc(UInt32*, HRESULT)).call(hicon)
  end
  def enum_storage(ppenumstorage : IMDSPEnumStorage*) : HRESULT
    @lpVtbl.value.enum_storage.unsafe_as(Proc(IMDSPEnumStorage*, HRESULT)).call(ppenumstorage)
  end
  def get_format_support(pformatex : WAVEFORMATEX**, pnformatcount : UInt32*, pppwszmimetype : LibC::LPWSTR**, pnmimetypecount : UInt32*) : HRESULT
    @lpVtbl.value.get_format_support.unsafe_as(Proc(WAVEFORMATEX**, UInt32*, LibC::LPWSTR**, UInt32*, HRESULT)).call(pformatex, pnformatcount, pppwszmimetype, pnmimetypecount)
  end
  def send_opaque_command(pcommand : OPAQUECOMMAND*) : HRESULT
    @lpVtbl.value.send_opaque_command.unsafe_as(Proc(OPAQUECOMMAND*, HRESULT)).call(pcommand)
  end
  def get_storage(pszstoragename : LibC::LPWSTR, ppstorage : IMDSPStorage*) : HRESULT
    @lpVtbl.value.get_storage.unsafe_as(Proc(LibC::LPWSTR, IMDSPStorage*, HRESULT)).call(pszstoragename, ppstorage)
  end
  def get_format_support2(dwflags : UInt32, ppaudioformatex : WAVEFORMATEX**, pnaudioformatcount : UInt32*, ppvideoformatex : VIDEOINFOHEADER**, pnvideoformatcount : UInt32*, ppfiletype : WMFILECAPABILITIES**, pnfiletypecount : UInt32*) : HRESULT
    @lpVtbl.value.get_format_support2.unsafe_as(Proc(UInt32, WAVEFORMATEX**, UInt32*, VIDEOINFOHEADER**, UInt32*, WMFILECAPABILITIES**, UInt32*, HRESULT)).call(dwflags, ppaudioformatex, pnaudioformatcount, ppvideoformatex, pnvideoformatcount, ppfiletype, pnfiletypecount)
  end
  def get_specify_property_pages(ppspecifyproppages : ISpecifyPropertyPages*, pppunknowns : IUnknown**, pcunks : UInt32*) : HRESULT
    @lpVtbl.value.get_specify_property_pages.unsafe_as(Proc(ISpecifyPropertyPages*, IUnknown**, UInt32*, HRESULT)).call(ppspecifyproppages, pppunknowns, pcunks)
  end
  def get_canonical_name(pwszpnpname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_canonical_name.unsafe_as(Proc(Char*, UInt32, HRESULT)).call(pwszpnpname, nmaxchars)
  end
  def get_property(pwszpropname : LibC::LPWSTR, pvalue : PROPVARIANT*) : HRESULT
    @lpVtbl.value.get_property.unsafe_as(Proc(LibC::LPWSTR, PROPVARIANT*, HRESULT)).call(pwszpropname, pvalue)
  end
  def set_property(pwszpropname : LibC::LPWSTR, pvalue : PROPVARIANT*) : HRESULT
    @lpVtbl.value.set_property.unsafe_as(Proc(LibC::LPWSTR, PROPVARIANT*, HRESULT)).call(pwszpropname, pvalue)
  end
  def get_format_capability(format : WMDM_FORMATCODE, pformatsupport : WMDM_FORMAT_CAPABILITY*) : HRESULT
    @lpVtbl.value.get_format_capability.unsafe_as(Proc(WMDM_FORMATCODE, WMDM_FORMAT_CAPABILITY*, HRESULT)).call(format, pformatsupport)
  end
  def device_io_control(dwiocontrolcode : UInt32, lpinbuffer : UInt8*, ninbuffersize : UInt32, lpoutbuffer : UInt8*, pnoutbuffersize : UInt32*) : HRESULT
    @lpVtbl.value.device_io_control.unsafe_as(Proc(UInt32, UInt8*, UInt32, UInt8*, UInt32*, HRESULT)).call(dwiocontrolcode, lpinbuffer, ninbuffersize, lpoutbuffer, pnoutbuffersize)
  end
  def find_storage(findscope : WMDM_FIND_SCOPE, pwszuniqueid : LibC::LPWSTR, ppstorage : IMDSPStorage*) : HRESULT
    @lpVtbl.value.find_storage.unsafe_as(Proc(WMDM_FIND_SCOPE, LibC::LPWSTR, IMDSPStorage*, HRESULT)).call(findscope, pwszuniqueid, ppstorage)
  end
end
struct LibWin32::IMDSPDeviceControl
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_dc_status(pdwstatus : UInt32*) : HRESULT
    @lpVtbl.value.get_dc_status.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwstatus)
  end
  def get_capabilities(pdwcapabilitiesmask : UInt32*) : HRESULT
    @lpVtbl.value.get_capabilities.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwcapabilitiesmask)
  end
  def play : HRESULT
    @lpVtbl.value.play.unsafe_as(Proc(HRESULT)).call
  end
  def record(pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.record.unsafe_as(Proc(WAVEFORMATEX*, HRESULT)).call(pformat)
  end
  def pause : HRESULT
    @lpVtbl.value.pause.unsafe_as(Proc(HRESULT)).call
  end
  def resume : HRESULT
    @lpVtbl.value.resume.unsafe_as(Proc(HRESULT)).call
  end
  def stop : HRESULT
    @lpVtbl.value.stop.unsafe_as(Proc(HRESULT)).call
  end
  def seek(fumode : UInt32, noffset : Int32) : HRESULT
    @lpVtbl.value.seek.unsafe_as(Proc(UInt32, Int32, HRESULT)).call(fumode, noffset)
  end
end
struct LibWin32::IMDSPEnumStorage
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(celt : UInt32, ppstorage : IMDSPStorage*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, IMDSPStorage*, UInt32*, HRESULT)).call(celt, ppstorage, pceltfetched)
  end
  def skip(celt : UInt32, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, UInt32*, HRESULT)).call(celt, pceltfetched)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenumstorage : IMDSPEnumStorage*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IMDSPEnumStorage*, HRESULT)).call(ppenumstorage)
  end
end
struct LibWin32::IMDSPStorage
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_attributes(dwattributes : UInt32, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.set_attributes.unsafe_as(Proc(UInt32, WAVEFORMATEX*, HRESULT)).call(dwattributes, pformat)
  end
  def get_storage_globals(ppstorageglobals : IMDSPStorageGlobals*) : HRESULT
    @lpVtbl.value.get_storage_globals.unsafe_as(Proc(IMDSPStorageGlobals*, HRESULT)).call(ppstorageglobals)
  end
  def get_attributes(pdwattributes : UInt32*, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.get_attributes.unsafe_as(Proc(UInt32*, WAVEFORMATEX*, HRESULT)).call(pdwattributes, pformat)
  end
  def get_name(pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(Char*, UInt32, HRESULT)).call(pwszname, nmaxchars)
  end
  def get_date(pdatetimeutc : WMDMDATETIME*) : HRESULT
    @lpVtbl.value.get_date.unsafe_as(Proc(WMDMDATETIME*, HRESULT)).call(pdatetimeutc)
  end
  def get_size(pdwsizelow : UInt32*, pdwsizehigh : UInt32*) : HRESULT
    @lpVtbl.value.get_size.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pdwsizelow, pdwsizehigh)
  end
  def get_rights(pprights : WMDMRIGHTS**, pnrightscount : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_rights.unsafe_as(Proc(WMDMRIGHTS**, UInt32*, UInt8*, HRESULT)).call(pprights, pnrightscount, abmac)
  end
  def create_storage(dwattributes : UInt32, pformat : WAVEFORMATEX*, pwszname : LibC::LPWSTR, ppnewstorage : IMDSPStorage*) : HRESULT
    @lpVtbl.value.create_storage.unsafe_as(Proc(UInt32, WAVEFORMATEX*, LibC::LPWSTR, IMDSPStorage*, HRESULT)).call(dwattributes, pformat, pwszname, ppnewstorage)
  end
  def enum_storage(ppenumstorage : IMDSPEnumStorage*) : HRESULT
    @lpVtbl.value.enum_storage.unsafe_as(Proc(IMDSPEnumStorage*, HRESULT)).call(ppenumstorage)
  end
  def send_opaque_command(pcommand : OPAQUECOMMAND*) : HRESULT
    @lpVtbl.value.send_opaque_command.unsafe_as(Proc(OPAQUECOMMAND*, HRESULT)).call(pcommand)
  end
end
struct LibWin32::IMDSPStorage2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_attributes(dwattributes : UInt32, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.set_attributes.unsafe_as(Proc(UInt32, WAVEFORMATEX*, HRESULT)).call(dwattributes, pformat)
  end
  def get_storage_globals(ppstorageglobals : IMDSPStorageGlobals*) : HRESULT
    @lpVtbl.value.get_storage_globals.unsafe_as(Proc(IMDSPStorageGlobals*, HRESULT)).call(ppstorageglobals)
  end
  def get_attributes(pdwattributes : UInt32*, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.get_attributes.unsafe_as(Proc(UInt32*, WAVEFORMATEX*, HRESULT)).call(pdwattributes, pformat)
  end
  def get_name(pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(Char*, UInt32, HRESULT)).call(pwszname, nmaxchars)
  end
  def get_date(pdatetimeutc : WMDMDATETIME*) : HRESULT
    @lpVtbl.value.get_date.unsafe_as(Proc(WMDMDATETIME*, HRESULT)).call(pdatetimeutc)
  end
  def get_size(pdwsizelow : UInt32*, pdwsizehigh : UInt32*) : HRESULT
    @lpVtbl.value.get_size.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pdwsizelow, pdwsizehigh)
  end
  def get_rights(pprights : WMDMRIGHTS**, pnrightscount : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_rights.unsafe_as(Proc(WMDMRIGHTS**, UInt32*, UInt8*, HRESULT)).call(pprights, pnrightscount, abmac)
  end
  def create_storage(dwattributes : UInt32, pformat : WAVEFORMATEX*, pwszname : LibC::LPWSTR, ppnewstorage : IMDSPStorage*) : HRESULT
    @lpVtbl.value.create_storage.unsafe_as(Proc(UInt32, WAVEFORMATEX*, LibC::LPWSTR, IMDSPStorage*, HRESULT)).call(dwattributes, pformat, pwszname, ppnewstorage)
  end
  def enum_storage(ppenumstorage : IMDSPEnumStorage*) : HRESULT
    @lpVtbl.value.enum_storage.unsafe_as(Proc(IMDSPEnumStorage*, HRESULT)).call(ppenumstorage)
  end
  def send_opaque_command(pcommand : OPAQUECOMMAND*) : HRESULT
    @lpVtbl.value.send_opaque_command.unsafe_as(Proc(OPAQUECOMMAND*, HRESULT)).call(pcommand)
  end
  def get_storage(pszstoragename : LibC::LPWSTR, ppstorage : IMDSPStorage*) : HRESULT
    @lpVtbl.value.get_storage.unsafe_as(Proc(LibC::LPWSTR, IMDSPStorage*, HRESULT)).call(pszstoragename, ppstorage)
  end
  def create_storage2(dwattributes : UInt32, dwattributesex : UInt32, paudioformat : WAVEFORMATEX*, pvideoformat : VIDEOINFOHEADER*, pwszname : LibC::LPWSTR, qwfilesize : UInt64, ppnewstorage : IMDSPStorage*) : HRESULT
    @lpVtbl.value.create_storage2.unsafe_as(Proc(UInt32, UInt32, WAVEFORMATEX*, VIDEOINFOHEADER*, LibC::LPWSTR, UInt64, IMDSPStorage*, HRESULT)).call(dwattributes, dwattributesex, paudioformat, pvideoformat, pwszname, qwfilesize, ppnewstorage)
  end
  def set_attributes2(dwattributes : UInt32, dwattributesex : UInt32, paudioformat : WAVEFORMATEX*, pvideoformat : VIDEOINFOHEADER*) : HRESULT
    @lpVtbl.value.set_attributes2.unsafe_as(Proc(UInt32, UInt32, WAVEFORMATEX*, VIDEOINFOHEADER*, HRESULT)).call(dwattributes, dwattributesex, paudioformat, pvideoformat)
  end
  def get_attributes2(pdwattributes : UInt32*, pdwattributesex : UInt32*, paudioformat : WAVEFORMATEX*, pvideoformat : VIDEOINFOHEADER*) : HRESULT
    @lpVtbl.value.get_attributes2.unsafe_as(Proc(UInt32*, UInt32*, WAVEFORMATEX*, VIDEOINFOHEADER*, HRESULT)).call(pdwattributes, pdwattributesex, paudioformat, pvideoformat)
  end
end
struct LibWin32::IMDSPStorage3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_attributes(dwattributes : UInt32, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.set_attributes.unsafe_as(Proc(UInt32, WAVEFORMATEX*, HRESULT)).call(dwattributes, pformat)
  end
  def get_storage_globals(ppstorageglobals : IMDSPStorageGlobals*) : HRESULT
    @lpVtbl.value.get_storage_globals.unsafe_as(Proc(IMDSPStorageGlobals*, HRESULT)).call(ppstorageglobals)
  end
  def get_attributes(pdwattributes : UInt32*, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.get_attributes.unsafe_as(Proc(UInt32*, WAVEFORMATEX*, HRESULT)).call(pdwattributes, pformat)
  end
  def get_name(pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(Char*, UInt32, HRESULT)).call(pwszname, nmaxchars)
  end
  def get_date(pdatetimeutc : WMDMDATETIME*) : HRESULT
    @lpVtbl.value.get_date.unsafe_as(Proc(WMDMDATETIME*, HRESULT)).call(pdatetimeutc)
  end
  def get_size(pdwsizelow : UInt32*, pdwsizehigh : UInt32*) : HRESULT
    @lpVtbl.value.get_size.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pdwsizelow, pdwsizehigh)
  end
  def get_rights(pprights : WMDMRIGHTS**, pnrightscount : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_rights.unsafe_as(Proc(WMDMRIGHTS**, UInt32*, UInt8*, HRESULT)).call(pprights, pnrightscount, abmac)
  end
  def create_storage(dwattributes : UInt32, pformat : WAVEFORMATEX*, pwszname : LibC::LPWSTR, ppnewstorage : IMDSPStorage*) : HRESULT
    @lpVtbl.value.create_storage.unsafe_as(Proc(UInt32, WAVEFORMATEX*, LibC::LPWSTR, IMDSPStorage*, HRESULT)).call(dwattributes, pformat, pwszname, ppnewstorage)
  end
  def enum_storage(ppenumstorage : IMDSPEnumStorage*) : HRESULT
    @lpVtbl.value.enum_storage.unsafe_as(Proc(IMDSPEnumStorage*, HRESULT)).call(ppenumstorage)
  end
  def send_opaque_command(pcommand : OPAQUECOMMAND*) : HRESULT
    @lpVtbl.value.send_opaque_command.unsafe_as(Proc(OPAQUECOMMAND*, HRESULT)).call(pcommand)
  end
  def get_storage(pszstoragename : LibC::LPWSTR, ppstorage : IMDSPStorage*) : HRESULT
    @lpVtbl.value.get_storage.unsafe_as(Proc(LibC::LPWSTR, IMDSPStorage*, HRESULT)).call(pszstoragename, ppstorage)
  end
  def create_storage2(dwattributes : UInt32, dwattributesex : UInt32, paudioformat : WAVEFORMATEX*, pvideoformat : VIDEOINFOHEADER*, pwszname : LibC::LPWSTR, qwfilesize : UInt64, ppnewstorage : IMDSPStorage*) : HRESULT
    @lpVtbl.value.create_storage2.unsafe_as(Proc(UInt32, UInt32, WAVEFORMATEX*, VIDEOINFOHEADER*, LibC::LPWSTR, UInt64, IMDSPStorage*, HRESULT)).call(dwattributes, dwattributesex, paudioformat, pvideoformat, pwszname, qwfilesize, ppnewstorage)
  end
  def set_attributes2(dwattributes : UInt32, dwattributesex : UInt32, paudioformat : WAVEFORMATEX*, pvideoformat : VIDEOINFOHEADER*) : HRESULT
    @lpVtbl.value.set_attributes2.unsafe_as(Proc(UInt32, UInt32, WAVEFORMATEX*, VIDEOINFOHEADER*, HRESULT)).call(dwattributes, dwattributesex, paudioformat, pvideoformat)
  end
  def get_attributes2(pdwattributes : UInt32*, pdwattributesex : UInt32*, paudioformat : WAVEFORMATEX*, pvideoformat : VIDEOINFOHEADER*) : HRESULT
    @lpVtbl.value.get_attributes2.unsafe_as(Proc(UInt32*, UInt32*, WAVEFORMATEX*, VIDEOINFOHEADER*, HRESULT)).call(pdwattributes, pdwattributesex, paudioformat, pvideoformat)
  end
  def get_metadata(pmetadata : IWMDMMetaData) : HRESULT
    @lpVtbl.value.get_metadata.unsafe_as(Proc(IWMDMMetaData, HRESULT)).call(pmetadata)
  end
  def set_metadata(pmetadata : IWMDMMetaData) : HRESULT
    @lpVtbl.value.set_metadata.unsafe_as(Proc(IWMDMMetaData, HRESULT)).call(pmetadata)
  end
end
struct LibWin32::IMDSPStorage4
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_attributes(dwattributes : UInt32, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.set_attributes.unsafe_as(Proc(UInt32, WAVEFORMATEX*, HRESULT)).call(dwattributes, pformat)
  end
  def get_storage_globals(ppstorageglobals : IMDSPStorageGlobals*) : HRESULT
    @lpVtbl.value.get_storage_globals.unsafe_as(Proc(IMDSPStorageGlobals*, HRESULT)).call(ppstorageglobals)
  end
  def get_attributes(pdwattributes : UInt32*, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.get_attributes.unsafe_as(Proc(UInt32*, WAVEFORMATEX*, HRESULT)).call(pdwattributes, pformat)
  end
  def get_name(pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(Char*, UInt32, HRESULT)).call(pwszname, nmaxchars)
  end
  def get_date(pdatetimeutc : WMDMDATETIME*) : HRESULT
    @lpVtbl.value.get_date.unsafe_as(Proc(WMDMDATETIME*, HRESULT)).call(pdatetimeutc)
  end
  def get_size(pdwsizelow : UInt32*, pdwsizehigh : UInt32*) : HRESULT
    @lpVtbl.value.get_size.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pdwsizelow, pdwsizehigh)
  end
  def get_rights(pprights : WMDMRIGHTS**, pnrightscount : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_rights.unsafe_as(Proc(WMDMRIGHTS**, UInt32*, UInt8*, HRESULT)).call(pprights, pnrightscount, abmac)
  end
  def create_storage(dwattributes : UInt32, pformat : WAVEFORMATEX*, pwszname : LibC::LPWSTR, ppnewstorage : IMDSPStorage*) : HRESULT
    @lpVtbl.value.create_storage.unsafe_as(Proc(UInt32, WAVEFORMATEX*, LibC::LPWSTR, IMDSPStorage*, HRESULT)).call(dwattributes, pformat, pwszname, ppnewstorage)
  end
  def enum_storage(ppenumstorage : IMDSPEnumStorage*) : HRESULT
    @lpVtbl.value.enum_storage.unsafe_as(Proc(IMDSPEnumStorage*, HRESULT)).call(ppenumstorage)
  end
  def send_opaque_command(pcommand : OPAQUECOMMAND*) : HRESULT
    @lpVtbl.value.send_opaque_command.unsafe_as(Proc(OPAQUECOMMAND*, HRESULT)).call(pcommand)
  end
  def get_storage(pszstoragename : LibC::LPWSTR, ppstorage : IMDSPStorage*) : HRESULT
    @lpVtbl.value.get_storage.unsafe_as(Proc(LibC::LPWSTR, IMDSPStorage*, HRESULT)).call(pszstoragename, ppstorage)
  end
  def create_storage2(dwattributes : UInt32, dwattributesex : UInt32, paudioformat : WAVEFORMATEX*, pvideoformat : VIDEOINFOHEADER*, pwszname : LibC::LPWSTR, qwfilesize : UInt64, ppnewstorage : IMDSPStorage*) : HRESULT
    @lpVtbl.value.create_storage2.unsafe_as(Proc(UInt32, UInt32, WAVEFORMATEX*, VIDEOINFOHEADER*, LibC::LPWSTR, UInt64, IMDSPStorage*, HRESULT)).call(dwattributes, dwattributesex, paudioformat, pvideoformat, pwszname, qwfilesize, ppnewstorage)
  end
  def set_attributes2(dwattributes : UInt32, dwattributesex : UInt32, paudioformat : WAVEFORMATEX*, pvideoformat : VIDEOINFOHEADER*) : HRESULT
    @lpVtbl.value.set_attributes2.unsafe_as(Proc(UInt32, UInt32, WAVEFORMATEX*, VIDEOINFOHEADER*, HRESULT)).call(dwattributes, dwattributesex, paudioformat, pvideoformat)
  end
  def get_attributes2(pdwattributes : UInt32*, pdwattributesex : UInt32*, paudioformat : WAVEFORMATEX*, pvideoformat : VIDEOINFOHEADER*) : HRESULT
    @lpVtbl.value.get_attributes2.unsafe_as(Proc(UInt32*, UInt32*, WAVEFORMATEX*, VIDEOINFOHEADER*, HRESULT)).call(pdwattributes, pdwattributesex, paudioformat, pvideoformat)
  end
  def get_metadata(pmetadata : IWMDMMetaData) : HRESULT
    @lpVtbl.value.get_metadata.unsafe_as(Proc(IWMDMMetaData, HRESULT)).call(pmetadata)
  end
  def set_metadata(pmetadata : IWMDMMetaData) : HRESULT
    @lpVtbl.value.set_metadata.unsafe_as(Proc(IWMDMMetaData, HRESULT)).call(pmetadata)
  end
  def set_references(dwrefs : UInt32, ppispstorage : IMDSPStorage*) : HRESULT
    @lpVtbl.value.set_references.unsafe_as(Proc(UInt32, IMDSPStorage*, HRESULT)).call(dwrefs, ppispstorage)
  end
  def get_references(pdwrefs : UInt32*, pppispstorage : IMDSPStorage**) : HRESULT
    @lpVtbl.value.get_references.unsafe_as(Proc(UInt32*, IMDSPStorage**, HRESULT)).call(pdwrefs, pppispstorage)
  end
  def create_storage_with_metadata(dwattributes : UInt32, pwszname : LibC::LPWSTR, pmetadata : IWMDMMetaData, qwfilesize : UInt64, ppnewstorage : IMDSPStorage*) : HRESULT
    @lpVtbl.value.create_storage_with_metadata.unsafe_as(Proc(UInt32, LibC::LPWSTR, IWMDMMetaData, UInt64, IMDSPStorage*, HRESULT)).call(dwattributes, pwszname, pmetadata, qwfilesize, ppnewstorage)
  end
  def get_specified_metadata(cproperties : UInt32, ppwszpropnames : LibC::LPWSTR*, pmetadata : IWMDMMetaData) : HRESULT
    @lpVtbl.value.get_specified_metadata.unsafe_as(Proc(UInt32, LibC::LPWSTR*, IWMDMMetaData, HRESULT)).call(cproperties, ppwszpropnames, pmetadata)
  end
  def find_storage(findscope : WMDM_FIND_SCOPE, pwszuniqueid : LibC::LPWSTR, ppstorage : IMDSPStorage*) : HRESULT
    @lpVtbl.value.find_storage.unsafe_as(Proc(WMDM_FIND_SCOPE, LibC::LPWSTR, IMDSPStorage*, HRESULT)).call(findscope, pwszuniqueid, ppstorage)
  end
  def get_parent(ppstorage : IMDSPStorage*) : HRESULT
    @lpVtbl.value.get_parent.unsafe_as(Proc(IMDSPStorage*, HRESULT)).call(ppstorage)
  end
end
struct LibWin32::IMDSPStorageGlobals
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_capabilities(pdwcapabilities : UInt32*) : HRESULT
    @lpVtbl.value.get_capabilities.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwcapabilities)
  end
  def get_serial_number(pserialnum : WMDMID*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_serial_number.unsafe_as(Proc(WMDMID*, UInt8*, HRESULT)).call(pserialnum, abmac)
  end
  def get_total_size(pdwtotalsizelow : UInt32*, pdwtotalsizehigh : UInt32*) : HRESULT
    @lpVtbl.value.get_total_size.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pdwtotalsizelow, pdwtotalsizehigh)
  end
  def get_total_free(pdwfreelow : UInt32*, pdwfreehigh : UInt32*) : HRESULT
    @lpVtbl.value.get_total_free.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pdwfreelow, pdwfreehigh)
  end
  def get_total_bad(pdwbadlow : UInt32*, pdwbadhigh : UInt32*) : HRESULT
    @lpVtbl.value.get_total_bad.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pdwbadlow, pdwbadhigh)
  end
  def get_status(pdwstatus : UInt32*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwstatus)
  end
  def initialize(fumode : UInt32, pprogress : IWMDMProgress) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(UInt32, IWMDMProgress, HRESULT)).call(fumode, pprogress)
  end
  def get_device(ppdevice : IMDSPDevice*) : HRESULT
    @lpVtbl.value.get_device.unsafe_as(Proc(IMDSPDevice*, HRESULT)).call(ppdevice)
  end
  def get_root_storage(pproot : IMDSPStorage*) : HRESULT
    @lpVtbl.value.get_root_storage.unsafe_as(Proc(IMDSPStorage*, HRESULT)).call(pproot)
  end
end
struct LibWin32::IMDSPObjectInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_play_length(pdwlength : UInt32*) : HRESULT
    @lpVtbl.value.get_play_length.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwlength)
  end
  def set_play_length(dwlength : UInt32) : HRESULT
    @lpVtbl.value.set_play_length.unsafe_as(Proc(UInt32, HRESULT)).call(dwlength)
  end
  def get_play_offset(pdwoffset : UInt32*) : HRESULT
    @lpVtbl.value.get_play_offset.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwoffset)
  end
  def set_play_offset(dwoffset : UInt32) : HRESULT
    @lpVtbl.value.set_play_offset.unsafe_as(Proc(UInt32, HRESULT)).call(dwoffset)
  end
  def get_total_length(pdwlength : UInt32*) : HRESULT
    @lpVtbl.value.get_total_length.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwlength)
  end
  def get_last_play_position(pdwlastpos : UInt32*) : HRESULT
    @lpVtbl.value.get_last_play_position.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwlastpos)
  end
  def get_longest_play_position(pdwlongestpos : UInt32*) : HRESULT
    @lpVtbl.value.get_longest_play_position.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwlongestpos)
  end
end
struct LibWin32::IMDSPObject
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def open(fumode : UInt32) : HRESULT
    @lpVtbl.value.open.unsafe_as(Proc(UInt32, HRESULT)).call(fumode)
  end
  def read(pdata : UInt8*, pdwsize : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.read.unsafe_as(Proc(UInt8*, UInt32*, UInt8*, HRESULT)).call(pdata, pdwsize, abmac)
  end
  def write(pdata : UInt8*, pdwsize : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.write.unsafe_as(Proc(UInt8*, UInt32*, UInt8*, HRESULT)).call(pdata, pdwsize, abmac)
  end
  def delete(fumode : UInt32, pprogress : IWMDMProgress) : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(UInt32, IWMDMProgress, HRESULT)).call(fumode, pprogress)
  end
  def seek(fuflags : UInt32, dwoffset : UInt32) : HRESULT
    @lpVtbl.value.seek.unsafe_as(Proc(UInt32, UInt32, HRESULT)).call(fuflags, dwoffset)
  end
  def rename(pwsznewname : LibC::LPWSTR, pprogress : IWMDMProgress) : HRESULT
    @lpVtbl.value.rename.unsafe_as(Proc(LibC::LPWSTR, IWMDMProgress, HRESULT)).call(pwsznewname, pprogress)
  end
  def move(fumode : UInt32, pprogress : IWMDMProgress, ptarget : IMDSPStorage) : HRESULT
    @lpVtbl.value.move.unsafe_as(Proc(UInt32, IWMDMProgress, IMDSPStorage, HRESULT)).call(fumode, pprogress, ptarget)
  end
  def close : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IMDSPObject2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def open(fumode : UInt32) : HRESULT
    @lpVtbl.value.open.unsafe_as(Proc(UInt32, HRESULT)).call(fumode)
  end
  def read(pdata : UInt8*, pdwsize : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.read.unsafe_as(Proc(UInt8*, UInt32*, UInt8*, HRESULT)).call(pdata, pdwsize, abmac)
  end
  def write(pdata : UInt8*, pdwsize : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.write.unsafe_as(Proc(UInt8*, UInt32*, UInt8*, HRESULT)).call(pdata, pdwsize, abmac)
  end
  def delete(fumode : UInt32, pprogress : IWMDMProgress) : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(UInt32, IWMDMProgress, HRESULT)).call(fumode, pprogress)
  end
  def seek(fuflags : UInt32, dwoffset : UInt32) : HRESULT
    @lpVtbl.value.seek.unsafe_as(Proc(UInt32, UInt32, HRESULT)).call(fuflags, dwoffset)
  end
  def rename(pwsznewname : LibC::LPWSTR, pprogress : IWMDMProgress) : HRESULT
    @lpVtbl.value.rename.unsafe_as(Proc(LibC::LPWSTR, IWMDMProgress, HRESULT)).call(pwsznewname, pprogress)
  end
  def move(fumode : UInt32, pprogress : IWMDMProgress, ptarget : IMDSPStorage) : HRESULT
    @lpVtbl.value.move.unsafe_as(Proc(UInt32, IWMDMProgress, IMDSPStorage, HRESULT)).call(fumode, pprogress, ptarget)
  end
  def close : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(HRESULT)).call
  end
  def read_on_clear_channel(pdata : UInt8*, pdwsize : UInt32*) : HRESULT
    @lpVtbl.value.read_on_clear_channel.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pdata, pdwsize)
  end
  def write_on_clear_channel(pdata : UInt8*, pdwsize : UInt32*) : HRESULT
    @lpVtbl.value.write_on_clear_channel.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pdata, pdwsize)
  end
end
struct LibWin32::IMDSPDirectTransfer
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def transfer_to_device(pwszsourcefilepath : LibC::LPWSTR, psourceoperation : IWMDMOperation, fuflags : UInt32, pwszdestinationname : LibC::LPWSTR, psourcemetadata : IWMDMMetaData, ptransferprogress : IWMDMProgress, ppnewobject : IMDSPStorage*) : HRESULT
    @lpVtbl.value.transfer_to_device.unsafe_as(Proc(LibC::LPWSTR, IWMDMOperation, UInt32, LibC::LPWSTR, IWMDMMetaData, IWMDMProgress, IMDSPStorage*, HRESULT)).call(pwszsourcefilepath, psourceoperation, fuflags, pwszdestinationname, psourcemetadata, ptransferprogress, ppnewobject)
  end
end
struct LibWin32::IMDSPRevoked
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_revocation_url(ppwszrevocationurl : LibC::LPWSTR*, pdwbufferlen : UInt32*) : HRESULT
    @lpVtbl.value.get_revocation_url.unsafe_as(Proc(LibC::LPWSTR*, UInt32*, HRESULT)).call(ppwszrevocationurl, pdwbufferlen)
  end
end
struct LibWin32::ISCPSecureAuthenticate
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_secure_query(ppsecurequery : ISCPSecureQuery*) : HRESULT
    @lpVtbl.value.get_secure_query.unsafe_as(Proc(ISCPSecureQuery*, HRESULT)).call(ppsecurequery)
  end
end
struct LibWin32::ISCPSecureAuthenticate2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_secure_query(ppsecurequery : ISCPSecureQuery*) : HRESULT
    @lpVtbl.value.get_secure_query.unsafe_as(Proc(ISCPSecureQuery*, HRESULT)).call(ppsecurequery)
  end
  def get_scp_session(ppscpsession : ISCPSession*) : HRESULT
    @lpVtbl.value.get_scp_session.unsafe_as(Proc(ISCPSession*, HRESULT)).call(ppscpsession)
  end
end
struct LibWin32::ISCPSecureQuery
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_data_demands(pfuflags : UInt32*, pdwminrightsdata : UInt32*, pdwminexaminedata : UInt32*, pdwmindecidedata : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_data_demands.unsafe_as(Proc(UInt32*, UInt32*, UInt32*, UInt32*, UInt8*, HRESULT)).call(pfuflags, pdwminrightsdata, pdwminexaminedata, pdwmindecidedata, abmac)
  end
  def examine_data(fuflags : UInt32, pwszextension : LibC::LPWSTR, pdata : UInt8*, dwsize : UInt32, abmac : UInt8*) : HRESULT
    @lpVtbl.value.examine_data.unsafe_as(Proc(UInt32, LibC::LPWSTR, UInt8*, UInt32, UInt8*, HRESULT)).call(fuflags, pwszextension, pdata, dwsize, abmac)
  end
  def make_decision(fuflags : UInt32, pdata : UInt8*, dwsize : UInt32, dwappsec : UInt32, pbspsessionkey : UInt8*, dwsessionkeylen : UInt32, pstorageglobals : IMDSPStorageGlobals, ppexchange : ISCPSecureExchange*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.make_decision.unsafe_as(Proc(UInt32, UInt8*, UInt32, UInt32, UInt8*, UInt32, IMDSPStorageGlobals, ISCPSecureExchange*, UInt8*, HRESULT)).call(fuflags, pdata, dwsize, dwappsec, pbspsessionkey, dwsessionkeylen, pstorageglobals, ppexchange, abmac)
  end
  def get_rights(pdata : UInt8*, dwsize : UInt32, pbspsessionkey : UInt8*, dwsessionkeylen : UInt32, pstgglobals : IMDSPStorageGlobals, pprights : WMDMRIGHTS**, pnrightscount : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_rights.unsafe_as(Proc(UInt8*, UInt32, UInt8*, UInt32, IMDSPStorageGlobals, WMDMRIGHTS**, UInt32*, UInt8*, HRESULT)).call(pdata, dwsize, pbspsessionkey, dwsessionkeylen, pstgglobals, pprights, pnrightscount, abmac)
  end
end
struct LibWin32::ISCPSecureQuery2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_data_demands(pfuflags : UInt32*, pdwminrightsdata : UInt32*, pdwminexaminedata : UInt32*, pdwmindecidedata : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_data_demands.unsafe_as(Proc(UInt32*, UInt32*, UInt32*, UInt32*, UInt8*, HRESULT)).call(pfuflags, pdwminrightsdata, pdwminexaminedata, pdwmindecidedata, abmac)
  end
  def examine_data(fuflags : UInt32, pwszextension : LibC::LPWSTR, pdata : UInt8*, dwsize : UInt32, abmac : UInt8*) : HRESULT
    @lpVtbl.value.examine_data.unsafe_as(Proc(UInt32, LibC::LPWSTR, UInt8*, UInt32, UInt8*, HRESULT)).call(fuflags, pwszextension, pdata, dwsize, abmac)
  end
  def make_decision(fuflags : UInt32, pdata : UInt8*, dwsize : UInt32, dwappsec : UInt32, pbspsessionkey : UInt8*, dwsessionkeylen : UInt32, pstorageglobals : IMDSPStorageGlobals, ppexchange : ISCPSecureExchange*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.make_decision.unsafe_as(Proc(UInt32, UInt8*, UInt32, UInt32, UInt8*, UInt32, IMDSPStorageGlobals, ISCPSecureExchange*, UInt8*, HRESULT)).call(fuflags, pdata, dwsize, dwappsec, pbspsessionkey, dwsessionkeylen, pstorageglobals, ppexchange, abmac)
  end
  def get_rights(pdata : UInt8*, dwsize : UInt32, pbspsessionkey : UInt8*, dwsessionkeylen : UInt32, pstgglobals : IMDSPStorageGlobals, pprights : WMDMRIGHTS**, pnrightscount : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_rights.unsafe_as(Proc(UInt8*, UInt32, UInt8*, UInt32, IMDSPStorageGlobals, WMDMRIGHTS**, UInt32*, UInt8*, HRESULT)).call(pdata, dwsize, pbspsessionkey, dwsessionkeylen, pstgglobals, pprights, pnrightscount, abmac)
  end
  def make_decision2(fuflags : UInt32, pdata : UInt8*, dwsize : UInt32, dwappsec : UInt32, pbspsessionkey : UInt8*, dwsessionkeylen : UInt32, pstorageglobals : IMDSPStorageGlobals, pappcertapp : UInt8*, dwappcertapplen : UInt32, pappcertsp : UInt8*, dwappcertsplen : UInt32, pszrevocationurl : LibC::LPWSTR*, pdwrevocationurllen : UInt32*, pdwrevocationbitflag : UInt32*, pqwfilesize : UInt64*, punknown : IUnknown, ppexchange : ISCPSecureExchange*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.make_decision2.unsafe_as(Proc(UInt32, UInt8*, UInt32, UInt32, UInt8*, UInt32, IMDSPStorageGlobals, UInt8*, UInt32, UInt8*, UInt32, LibC::LPWSTR*, UInt32*, UInt32*, UInt64*, IUnknown, ISCPSecureExchange*, UInt8*, HRESULT)).call(fuflags, pdata, dwsize, dwappsec, pbspsessionkey, dwsessionkeylen, pstorageglobals, pappcertapp, dwappcertapplen, pappcertsp, dwappcertsplen, pszrevocationurl, pdwrevocationurllen, pdwrevocationbitflag, pqwfilesize, punknown, ppexchange, abmac)
  end
end
struct LibWin32::ISCPSecureExchange
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def transfer_container_data(pdata : UInt8*, dwsize : UInt32, pfureadyflags : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.transfer_container_data.unsafe_as(Proc(UInt8*, UInt32, UInt32*, UInt8*, HRESULT)).call(pdata, dwsize, pfureadyflags, abmac)
  end
  def object_data(pdata : UInt8*, pdwsize : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.object_data.unsafe_as(Proc(UInt8*, UInt32*, UInt8*, HRESULT)).call(pdata, pdwsize, abmac)
  end
  def transfer_complete : HRESULT
    @lpVtbl.value.transfer_complete.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ISCPSecureExchange2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def transfer_container_data(pdata : UInt8*, dwsize : UInt32, pfureadyflags : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.transfer_container_data.unsafe_as(Proc(UInt8*, UInt32, UInt32*, UInt8*, HRESULT)).call(pdata, dwsize, pfureadyflags, abmac)
  end
  def object_data(pdata : UInt8*, pdwsize : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.object_data.unsafe_as(Proc(UInt8*, UInt32*, UInt8*, HRESULT)).call(pdata, pdwsize, abmac)
  end
  def transfer_complete : HRESULT
    @lpVtbl.value.transfer_complete.unsafe_as(Proc(HRESULT)).call
  end
  def transfer_container_data2(pdata : UInt8*, dwsize : UInt32, pprogresscallback : IWMDMProgress3, pfureadyflags : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.transfer_container_data2.unsafe_as(Proc(UInt8*, UInt32, IWMDMProgress3, UInt32*, UInt8*, HRESULT)).call(pdata, dwsize, pprogresscallback, pfureadyflags, abmac)
  end
end
struct LibWin32::ISCPSecureExchange3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def transfer_container_data(pdata : UInt8*, dwsize : UInt32, pfureadyflags : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.transfer_container_data.unsafe_as(Proc(UInt8*, UInt32, UInt32*, UInt8*, HRESULT)).call(pdata, dwsize, pfureadyflags, abmac)
  end
  def object_data(pdata : UInt8*, pdwsize : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.object_data.unsafe_as(Proc(UInt8*, UInt32*, UInt8*, HRESULT)).call(pdata, pdwsize, abmac)
  end
  def transfer_complete : HRESULT
    @lpVtbl.value.transfer_complete.unsafe_as(Proc(HRESULT)).call
  end
  def transfer_container_data2(pdata : UInt8*, dwsize : UInt32, pprogresscallback : IWMDMProgress3, pfureadyflags : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.transfer_container_data2.unsafe_as(Proc(UInt8*, UInt32, IWMDMProgress3, UInt32*, UInt8*, HRESULT)).call(pdata, dwsize, pprogresscallback, pfureadyflags, abmac)
  end
  def transfer_container_data_on_clear_channel(pdevice : IMDSPDevice, pdata : UInt8*, dwsize : UInt32, pprogresscallback : IWMDMProgress3, pfureadyflags : UInt32*) : HRESULT
    @lpVtbl.value.transfer_container_data_on_clear_channel.unsafe_as(Proc(IMDSPDevice, UInt8*, UInt32, IWMDMProgress3, UInt32*, HRESULT)).call(pdevice, pdata, dwsize, pprogresscallback, pfureadyflags)
  end
  def get_object_data_on_clear_channel(pdevice : IMDSPDevice, pdata : UInt8*, pdwsize : UInt32*) : HRESULT
    @lpVtbl.value.get_object_data_on_clear_channel.unsafe_as(Proc(IMDSPDevice, UInt8*, UInt32*, HRESULT)).call(pdevice, pdata, pdwsize)
  end
  def transfer_complete_for_device(pdevice : IMDSPDevice) : HRESULT
    @lpVtbl.value.transfer_complete_for_device.unsafe_as(Proc(IMDSPDevice, HRESULT)).call(pdevice)
  end
end
struct LibWin32::ISCPSession
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def begin_session(pidevice : IMDSPDevice, pctx : UInt8*, dwsizectx : UInt32) : HRESULT
    @lpVtbl.value.begin_session.unsafe_as(Proc(IMDSPDevice, UInt8*, UInt32, HRESULT)).call(pidevice, pctx, dwsizectx)
  end
  def end_session(pctx : UInt8*, dwsizectx : UInt32) : HRESULT
    @lpVtbl.value.end_session.unsafe_as(Proc(UInt8*, UInt32, HRESULT)).call(pctx, dwsizectx)
  end
  def get_secure_query(ppsecurequery : ISCPSecureQuery*) : HRESULT
    @lpVtbl.value.get_secure_query.unsafe_as(Proc(ISCPSecureQuery*, HRESULT)).call(ppsecurequery)
  end
end
struct LibWin32::ISCPSecureQuery3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_data_demands(pfuflags : UInt32*, pdwminrightsdata : UInt32*, pdwminexaminedata : UInt32*, pdwmindecidedata : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_data_demands.unsafe_as(Proc(UInt32*, UInt32*, UInt32*, UInt32*, UInt8*, HRESULT)).call(pfuflags, pdwminrightsdata, pdwminexaminedata, pdwmindecidedata, abmac)
  end
  def examine_data(fuflags : UInt32, pwszextension : LibC::LPWSTR, pdata : UInt8*, dwsize : UInt32, abmac : UInt8*) : HRESULT
    @lpVtbl.value.examine_data.unsafe_as(Proc(UInt32, LibC::LPWSTR, UInt8*, UInt32, UInt8*, HRESULT)).call(fuflags, pwszextension, pdata, dwsize, abmac)
  end
  def make_decision(fuflags : UInt32, pdata : UInt8*, dwsize : UInt32, dwappsec : UInt32, pbspsessionkey : UInt8*, dwsessionkeylen : UInt32, pstorageglobals : IMDSPStorageGlobals, ppexchange : ISCPSecureExchange*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.make_decision.unsafe_as(Proc(UInt32, UInt8*, UInt32, UInt32, UInt8*, UInt32, IMDSPStorageGlobals, ISCPSecureExchange*, UInt8*, HRESULT)).call(fuflags, pdata, dwsize, dwappsec, pbspsessionkey, dwsessionkeylen, pstorageglobals, ppexchange, abmac)
  end
  def get_rights(pdata : UInt8*, dwsize : UInt32, pbspsessionkey : UInt8*, dwsessionkeylen : UInt32, pstgglobals : IMDSPStorageGlobals, pprights : WMDMRIGHTS**, pnrightscount : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_rights.unsafe_as(Proc(UInt8*, UInt32, UInt8*, UInt32, IMDSPStorageGlobals, WMDMRIGHTS**, UInt32*, UInt8*, HRESULT)).call(pdata, dwsize, pbspsessionkey, dwsessionkeylen, pstgglobals, pprights, pnrightscount, abmac)
  end
  def make_decision2(fuflags : UInt32, pdata : UInt8*, dwsize : UInt32, dwappsec : UInt32, pbspsessionkey : UInt8*, dwsessionkeylen : UInt32, pstorageglobals : IMDSPStorageGlobals, pappcertapp : UInt8*, dwappcertapplen : UInt32, pappcertsp : UInt8*, dwappcertsplen : UInt32, pszrevocationurl : LibC::LPWSTR*, pdwrevocationurllen : UInt32*, pdwrevocationbitflag : UInt32*, pqwfilesize : UInt64*, punknown : IUnknown, ppexchange : ISCPSecureExchange*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.make_decision2.unsafe_as(Proc(UInt32, UInt8*, UInt32, UInt32, UInt8*, UInt32, IMDSPStorageGlobals, UInt8*, UInt32, UInt8*, UInt32, LibC::LPWSTR*, UInt32*, UInt32*, UInt64*, IUnknown, ISCPSecureExchange*, UInt8*, HRESULT)).call(fuflags, pdata, dwsize, dwappsec, pbspsessionkey, dwsessionkeylen, pstorageglobals, pappcertapp, dwappcertapplen, pappcertsp, dwappcertsplen, pszrevocationurl, pdwrevocationurllen, pdwrevocationbitflag, pqwfilesize, punknown, ppexchange, abmac)
  end
  def get_rights_on_clear_channel(pdata : UInt8*, dwsize : UInt32, pbspsessionkey : UInt8*, dwsessionkeylen : UInt32, pstgglobals : IMDSPStorageGlobals, pprogresscallback : IWMDMProgress3, pprights : WMDMRIGHTS**, pnrightscount : UInt32*) : HRESULT
    @lpVtbl.value.get_rights_on_clear_channel.unsafe_as(Proc(UInt8*, UInt32, UInt8*, UInt32, IMDSPStorageGlobals, IWMDMProgress3, WMDMRIGHTS**, UInt32*, HRESULT)).call(pdata, dwsize, pbspsessionkey, dwsessionkeylen, pstgglobals, pprogresscallback, pprights, pnrightscount)
  end
  def make_decision_on_clear_channel(fuflags : UInt32, pdata : UInt8*, dwsize : UInt32, dwappsec : UInt32, pbspsessionkey : UInt8*, dwsessionkeylen : UInt32, pstorageglobals : IMDSPStorageGlobals, pprogresscallback : IWMDMProgress3, pappcertapp : UInt8*, dwappcertapplen : UInt32, pappcertsp : UInt8*, dwappcertsplen : UInt32, pszrevocationurl : LibC::LPWSTR*, pdwrevocationurllen : UInt32*, pdwrevocationbitflag : UInt32*, pqwfilesize : UInt64*, punknown : IUnknown, ppexchange : ISCPSecureExchange*) : HRESULT
    @lpVtbl.value.make_decision_on_clear_channel.unsafe_as(Proc(UInt32, UInt8*, UInt32, UInt32, UInt8*, UInt32, IMDSPStorageGlobals, IWMDMProgress3, UInt8*, UInt32, UInt8*, UInt32, LibC::LPWSTR*, UInt32*, UInt32*, UInt64*, IUnknown, ISCPSecureExchange*, HRESULT)).call(fuflags, pdata, dwsize, dwappsec, pbspsessionkey, dwsessionkeylen, pstorageglobals, pprogresscallback, pappcertapp, dwappcertapplen, pappcertsp, dwappcertsplen, pszrevocationurl, pdwrevocationurllen, pdwrevocationbitflag, pqwfilesize, punknown, ppexchange)
  end
end
struct LibWin32::IComponentAuthenticate
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def sac_auth(dwprotocolid : UInt32, dwpass : UInt32, pbdatain : UInt8*, dwdatainlen : UInt32, ppbdataout : UInt8**, pdwdataoutlen : UInt32*) : HRESULT
    @lpVtbl.value.sac_auth.unsafe_as(Proc(UInt32, UInt32, UInt8*, UInt32, UInt8**, UInt32*, HRESULT)).call(dwprotocolid, dwpass, pbdatain, dwdatainlen, ppbdataout, pdwdataoutlen)
  end
  def sac_get_protocols(ppdwprotocols : UInt32**, pdwprotocolcount : UInt32*) : HRESULT
    @lpVtbl.value.sac_get_protocols.unsafe_as(Proc(UInt32**, UInt32*, HRESULT)).call(ppdwprotocols, pdwprotocolcount)
  end
end
struct LibWin32::IWMDMLogger
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def is_enabled(pfenabled : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_enabled.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfenabled)
  end
  def enable(fenable : LibC::BOOL) : HRESULT
    @lpVtbl.value.enable.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fenable)
  end
  def get_log_file_name(pszfilename : PSTR, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_log_file_name.unsafe_as(Proc(PSTR, UInt32, HRESULT)).call(pszfilename, nmaxchars)
  end
  def set_log_file_name(pszfilename : PSTR) : HRESULT
    @lpVtbl.value.set_log_file_name.unsafe_as(Proc(PSTR, HRESULT)).call(pszfilename)
  end
  def log_string(dwflags : UInt32, pszsrcname : PSTR, pszlog : PSTR) : HRESULT
    @lpVtbl.value.log_string.unsafe_as(Proc(UInt32, PSTR, PSTR, HRESULT)).call(dwflags, pszsrcname, pszlog)
  end
  def log_dword(dwflags : UInt32, pszsrcname : PSTR, pszlogformat : PSTR, dwlog : UInt32) : HRESULT
    @lpVtbl.value.log_dword.unsafe_as(Proc(UInt32, PSTR, PSTR, UInt32, HRESULT)).call(dwflags, pszsrcname, pszlogformat, dwlog)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def get_size_params(pdwmaxsize : UInt32*, pdwshrinktosize : UInt32*) : HRESULT
    @lpVtbl.value.get_size_params.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pdwmaxsize, pdwshrinktosize)
  end
  def set_size_params(dwmaxsize : UInt32, dwshrinktosize : UInt32) : HRESULT
    @lpVtbl.value.set_size_params.unsafe_as(Proc(UInt32, UInt32, HRESULT)).call(dwmaxsize, dwshrinktosize)
  end
end
