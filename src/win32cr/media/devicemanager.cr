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
    query_interface : Proc(IWMDMMetaData*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMDMMetaData*, UInt32)
    release : Proc(IWMDMMetaData*, UInt32)
    add_item : Proc(IWMDMMetaData*, WMDM_TAG_DATATYPE, LibC::LPWSTR, UInt8*, UInt32, HRESULT)
    query_by_name : Proc(IWMDMMetaData*, LibC::LPWSTR, WMDM_TAG_DATATYPE*, UInt8**, UInt32*, HRESULT)
    query_by_index : Proc(IWMDMMetaData*, UInt32, UInt16**, WMDM_TAG_DATATYPE*, UInt8**, UInt32*, HRESULT)
    get_item_count : Proc(IWMDMMetaData*, UInt32*, HRESULT)
  end

  IWMDMMetaData_GUID = "ec3b0663-0951-460a-9a80-0dceed3c043c"
  IID_IWMDMMetaData = LibC::GUID.new(0xec3b0663_u32, 0x951_u16, 0x460a_u16, StaticArray[0x9a_u8, 0x80_u8, 0xd_u8, 0xce_u8, 0xed_u8, 0x3c_u8, 0x4_u8, 0x3c_u8])
  struct IWMDMMetaData
    lpVtbl : IWMDMMetaDataVTbl*
  end

  struct IWMDeviceManagerVTbl
    query_interface : Proc(IWMDeviceManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMDeviceManager*, UInt32)
    release : Proc(IWMDeviceManager*, UInt32)
    get_revision : Proc(IWMDeviceManager*, UInt32*, HRESULT)
    get_device_count : Proc(IWMDeviceManager*, UInt32*, HRESULT)
    enum_devices : Proc(IWMDeviceManager*, IWMDMEnumDevice*, HRESULT)
  end

  IWMDeviceManager_GUID = "1dcb3a00-33ed-11d3-8470-00c04f79dbc0"
  IID_IWMDeviceManager = LibC::GUID.new(0x1dcb3a00_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct IWMDeviceManager
    lpVtbl : IWMDeviceManagerVTbl*
  end

  struct IWMDeviceManager2VTbl
    query_interface : Proc(IWMDeviceManager2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMDeviceManager2*, UInt32)
    release : Proc(IWMDeviceManager2*, UInt32)
    get_revision : Proc(IWMDeviceManager2*, UInt32*, HRESULT)
    get_device_count : Proc(IWMDeviceManager2*, UInt32*, HRESULT)
    enum_devices : Proc(IWMDeviceManager2*, IWMDMEnumDevice*, HRESULT)
    get_device_from_canonical_name : Proc(IWMDeviceManager2*, LibC::LPWSTR, IWMDMDevice*, HRESULT)
    enum_devices2 : Proc(IWMDeviceManager2*, IWMDMEnumDevice*, HRESULT)
    reinitialize : Proc(IWMDeviceManager2*, HRESULT)
  end

  IWMDeviceManager2_GUID = "923e5249-8731-4c5b-9b1c-b8b60b6e46af"
  IID_IWMDeviceManager2 = LibC::GUID.new(0x923e5249_u32, 0x8731_u16, 0x4c5b_u16, StaticArray[0x9b_u8, 0x1c_u8, 0xb8_u8, 0xb6_u8, 0xb_u8, 0x6e_u8, 0x46_u8, 0xaf_u8])
  struct IWMDeviceManager2
    lpVtbl : IWMDeviceManager2VTbl*
  end

  struct IWMDeviceManager3VTbl
    query_interface : Proc(IWMDeviceManager3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMDeviceManager3*, UInt32)
    release : Proc(IWMDeviceManager3*, UInt32)
    get_revision : Proc(IWMDeviceManager3*, UInt32*, HRESULT)
    get_device_count : Proc(IWMDeviceManager3*, UInt32*, HRESULT)
    enum_devices : Proc(IWMDeviceManager3*, IWMDMEnumDevice*, HRESULT)
    get_device_from_canonical_name : Proc(IWMDeviceManager3*, LibC::LPWSTR, IWMDMDevice*, HRESULT)
    enum_devices2 : Proc(IWMDeviceManager3*, IWMDMEnumDevice*, HRESULT)
    reinitialize : Proc(IWMDeviceManager3*, HRESULT)
    set_device_enum_preference : Proc(IWMDeviceManager3*, UInt32, HRESULT)
  end

  IWMDeviceManager3_GUID = "af185c41-100d-46ed-be2e-9ce8c44594ef"
  IID_IWMDeviceManager3 = LibC::GUID.new(0xaf185c41_u32, 0x100d_u16, 0x46ed_u16, StaticArray[0xbe_u8, 0x2e_u8, 0x9c_u8, 0xe8_u8, 0xc4_u8, 0x45_u8, 0x94_u8, 0xef_u8])
  struct IWMDeviceManager3
    lpVtbl : IWMDeviceManager3VTbl*
  end

  struct IWMDMStorageGlobalsVTbl
    query_interface : Proc(IWMDMStorageGlobals*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMDMStorageGlobals*, UInt32)
    release : Proc(IWMDMStorageGlobals*, UInt32)
    get_capabilities : Proc(IWMDMStorageGlobals*, UInt32*, HRESULT)
    get_serial_number : Proc(IWMDMStorageGlobals*, WMDMID*, UInt8*, HRESULT)
    get_total_size : Proc(IWMDMStorageGlobals*, UInt32*, UInt32*, HRESULT)
    get_total_free : Proc(IWMDMStorageGlobals*, UInt32*, UInt32*, HRESULT)
    get_total_bad : Proc(IWMDMStorageGlobals*, UInt32*, UInt32*, HRESULT)
    get_status : Proc(IWMDMStorageGlobals*, UInt32*, HRESULT)
    initialize : Proc(IWMDMStorageGlobals*, UInt32, IWMDMProgress, HRESULT)
  end

  IWMDMStorageGlobals_GUID = "1dcb3a07-33ed-11d3-8470-00c04f79dbc0"
  IID_IWMDMStorageGlobals = LibC::GUID.new(0x1dcb3a07_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct IWMDMStorageGlobals
    lpVtbl : IWMDMStorageGlobalsVTbl*
  end

  struct IWMDMStorageVTbl
    query_interface : Proc(IWMDMStorage*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMDMStorage*, UInt32)
    release : Proc(IWMDMStorage*, UInt32)
    set_attributes : Proc(IWMDMStorage*, UInt32, WAVEFORMATEX*, HRESULT)
    get_storage_globals : Proc(IWMDMStorage*, IWMDMStorageGlobals*, HRESULT)
    get_attributes : Proc(IWMDMStorage*, UInt32*, WAVEFORMATEX*, HRESULT)
    get_name : Proc(IWMDMStorage*, Char*, UInt32, HRESULT)
    get_date : Proc(IWMDMStorage*, WMDMDATETIME*, HRESULT)
    get_size : Proc(IWMDMStorage*, UInt32*, UInt32*, HRESULT)
    get_rights : Proc(IWMDMStorage*, WMDMRIGHTS**, UInt32*, UInt8*, HRESULT)
    enum_storage : Proc(IWMDMStorage*, IWMDMEnumStorage*, HRESULT)
    send_opaque_command : Proc(IWMDMStorage*, OPAQUECOMMAND*, HRESULT)
  end

  IWMDMStorage_GUID = "1dcb3a06-33ed-11d3-8470-00c04f79dbc0"
  IID_IWMDMStorage = LibC::GUID.new(0x1dcb3a06_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct IWMDMStorage
    lpVtbl : IWMDMStorageVTbl*
  end

  struct IWMDMStorage2VTbl
    query_interface : Proc(IWMDMStorage2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMDMStorage2*, UInt32)
    release : Proc(IWMDMStorage2*, UInt32)
    set_attributes : Proc(IWMDMStorage2*, UInt32, WAVEFORMATEX*, HRESULT)
    get_storage_globals : Proc(IWMDMStorage2*, IWMDMStorageGlobals*, HRESULT)
    get_attributes : Proc(IWMDMStorage2*, UInt32*, WAVEFORMATEX*, HRESULT)
    get_name : Proc(IWMDMStorage2*, Char*, UInt32, HRESULT)
    get_date : Proc(IWMDMStorage2*, WMDMDATETIME*, HRESULT)
    get_size : Proc(IWMDMStorage2*, UInt32*, UInt32*, HRESULT)
    get_rights : Proc(IWMDMStorage2*, WMDMRIGHTS**, UInt32*, UInt8*, HRESULT)
    enum_storage : Proc(IWMDMStorage2*, IWMDMEnumStorage*, HRESULT)
    send_opaque_command : Proc(IWMDMStorage2*, OPAQUECOMMAND*, HRESULT)
    get_storage : Proc(IWMDMStorage2*, LibC::LPWSTR, IWMDMStorage*, HRESULT)
    set_attributes2 : Proc(IWMDMStorage2*, UInt32, UInt32, WAVEFORMATEX*, VIDEOINFOHEADER*, HRESULT)
    get_attributes2 : Proc(IWMDMStorage2*, UInt32*, UInt32*, WAVEFORMATEX*, VIDEOINFOHEADER*, HRESULT)
  end

  IWMDMStorage2_GUID = "1ed5a144-5cd5-4683-9eff-72cbdb2d9533"
  IID_IWMDMStorage2 = LibC::GUID.new(0x1ed5a144_u32, 0x5cd5_u16, 0x4683_u16, StaticArray[0x9e_u8, 0xff_u8, 0x72_u8, 0xcb_u8, 0xdb_u8, 0x2d_u8, 0x95_u8, 0x33_u8])
  struct IWMDMStorage2
    lpVtbl : IWMDMStorage2VTbl*
  end

  struct IWMDMStorage3VTbl
    query_interface : Proc(IWMDMStorage3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMDMStorage3*, UInt32)
    release : Proc(IWMDMStorage3*, UInt32)
    set_attributes : Proc(IWMDMStorage3*, UInt32, WAVEFORMATEX*, HRESULT)
    get_storage_globals : Proc(IWMDMStorage3*, IWMDMStorageGlobals*, HRESULT)
    get_attributes : Proc(IWMDMStorage3*, UInt32*, WAVEFORMATEX*, HRESULT)
    get_name : Proc(IWMDMStorage3*, Char*, UInt32, HRESULT)
    get_date : Proc(IWMDMStorage3*, WMDMDATETIME*, HRESULT)
    get_size : Proc(IWMDMStorage3*, UInt32*, UInt32*, HRESULT)
    get_rights : Proc(IWMDMStorage3*, WMDMRIGHTS**, UInt32*, UInt8*, HRESULT)
    enum_storage : Proc(IWMDMStorage3*, IWMDMEnumStorage*, HRESULT)
    send_opaque_command : Proc(IWMDMStorage3*, OPAQUECOMMAND*, HRESULT)
    get_storage : Proc(IWMDMStorage3*, LibC::LPWSTR, IWMDMStorage*, HRESULT)
    set_attributes2 : Proc(IWMDMStorage3*, UInt32, UInt32, WAVEFORMATEX*, VIDEOINFOHEADER*, HRESULT)
    get_attributes2 : Proc(IWMDMStorage3*, UInt32*, UInt32*, WAVEFORMATEX*, VIDEOINFOHEADER*, HRESULT)
    get_metadata : Proc(IWMDMStorage3*, IWMDMMetaData*, HRESULT)
    set_metadata : Proc(IWMDMStorage3*, IWMDMMetaData, HRESULT)
    create_empty_metadata_object : Proc(IWMDMStorage3*, IWMDMMetaData*, HRESULT)
    set_enum_preference : Proc(IWMDMStorage3*, WMDM_STORAGE_ENUM_MODE*, UInt32, WMDMMetadataView*, HRESULT)
  end

  IWMDMStorage3_GUID = "97717eea-926a-464e-96a4-247b0216026e"
  IID_IWMDMStorage3 = LibC::GUID.new(0x97717eea_u32, 0x926a_u16, 0x464e_u16, StaticArray[0x96_u8, 0xa4_u8, 0x24_u8, 0x7b_u8, 0x2_u8, 0x16_u8, 0x2_u8, 0x6e_u8])
  struct IWMDMStorage3
    lpVtbl : IWMDMStorage3VTbl*
  end

  struct IWMDMStorage4VTbl
    query_interface : Proc(IWMDMStorage4*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMDMStorage4*, UInt32)
    release : Proc(IWMDMStorage4*, UInt32)
    set_attributes : Proc(IWMDMStorage4*, UInt32, WAVEFORMATEX*, HRESULT)
    get_storage_globals : Proc(IWMDMStorage4*, IWMDMStorageGlobals*, HRESULT)
    get_attributes : Proc(IWMDMStorage4*, UInt32*, WAVEFORMATEX*, HRESULT)
    get_name : Proc(IWMDMStorage4*, Char*, UInt32, HRESULT)
    get_date : Proc(IWMDMStorage4*, WMDMDATETIME*, HRESULT)
    get_size : Proc(IWMDMStorage4*, UInt32*, UInt32*, HRESULT)
    get_rights : Proc(IWMDMStorage4*, WMDMRIGHTS**, UInt32*, UInt8*, HRESULT)
    enum_storage : Proc(IWMDMStorage4*, IWMDMEnumStorage*, HRESULT)
    send_opaque_command : Proc(IWMDMStorage4*, OPAQUECOMMAND*, HRESULT)
    get_storage : Proc(IWMDMStorage4*, LibC::LPWSTR, IWMDMStorage*, HRESULT)
    set_attributes2 : Proc(IWMDMStorage4*, UInt32, UInt32, WAVEFORMATEX*, VIDEOINFOHEADER*, HRESULT)
    get_attributes2 : Proc(IWMDMStorage4*, UInt32*, UInt32*, WAVEFORMATEX*, VIDEOINFOHEADER*, HRESULT)
    get_metadata : Proc(IWMDMStorage4*, IWMDMMetaData*, HRESULT)
    set_metadata : Proc(IWMDMStorage4*, IWMDMMetaData, HRESULT)
    create_empty_metadata_object : Proc(IWMDMStorage4*, IWMDMMetaData*, HRESULT)
    set_enum_preference : Proc(IWMDMStorage4*, WMDM_STORAGE_ENUM_MODE*, UInt32, WMDMMetadataView*, HRESULT)
    set_references : Proc(IWMDMStorage4*, UInt32, IWMDMStorage*, HRESULT)
    get_references : Proc(IWMDMStorage4*, UInt32*, IWMDMStorage**, HRESULT)
    get_rights_with_progress : Proc(IWMDMStorage4*, IWMDMProgress3, WMDMRIGHTS**, UInt32*, HRESULT)
    get_specified_metadata : Proc(IWMDMStorage4*, UInt32, LibC::LPWSTR*, IWMDMMetaData*, HRESULT)
    find_storage : Proc(IWMDMStorage4*, WMDM_FIND_SCOPE, LibC::LPWSTR, IWMDMStorage*, HRESULT)
    get_parent : Proc(IWMDMStorage4*, IWMDMStorage*, HRESULT)
  end

  IWMDMStorage4_GUID = "c225bac5-a03a-40b8-9a23-91cf478c64a6"
  IID_IWMDMStorage4 = LibC::GUID.new(0xc225bac5_u32, 0xa03a_u16, 0x40b8_u16, StaticArray[0x9a_u8, 0x23_u8, 0x91_u8, 0xcf_u8, 0x47_u8, 0x8c_u8, 0x64_u8, 0xa6_u8])
  struct IWMDMStorage4
    lpVtbl : IWMDMStorage4VTbl*
  end

  struct IWMDMOperationVTbl
    query_interface : Proc(IWMDMOperation*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMDMOperation*, UInt32)
    release : Proc(IWMDMOperation*, UInt32)
    begin_read : Proc(IWMDMOperation*, HRESULT)
    begin_write : Proc(IWMDMOperation*, HRESULT)
    get_object_name : Proc(IWMDMOperation*, Char*, UInt32, HRESULT)
    set_object_name : Proc(IWMDMOperation*, Char*, UInt32, HRESULT)
    get_object_attributes : Proc(IWMDMOperation*, UInt32*, WAVEFORMATEX*, HRESULT)
    set_object_attributes : Proc(IWMDMOperation*, UInt32, WAVEFORMATEX*, HRESULT)
    get_object_total_size : Proc(IWMDMOperation*, UInt32*, UInt32*, HRESULT)
    set_object_total_size : Proc(IWMDMOperation*, UInt32, UInt32, HRESULT)
    transfer_object_data : Proc(IWMDMOperation*, UInt8*, UInt32*, UInt8*, HRESULT)
    end_ : Proc(IWMDMOperation*, HRESULT*, IUnknown, HRESULT)
  end

  IWMDMOperation_GUID = "1dcb3a0b-33ed-11d3-8470-00c04f79dbc0"
  IID_IWMDMOperation = LibC::GUID.new(0x1dcb3a0b_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct IWMDMOperation
    lpVtbl : IWMDMOperationVTbl*
  end

  struct IWMDMOperation2VTbl
    query_interface : Proc(IWMDMOperation2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMDMOperation2*, UInt32)
    release : Proc(IWMDMOperation2*, UInt32)
    begin_read : Proc(IWMDMOperation2*, HRESULT)
    begin_write : Proc(IWMDMOperation2*, HRESULT)
    get_object_name : Proc(IWMDMOperation2*, Char*, UInt32, HRESULT)
    set_object_name : Proc(IWMDMOperation2*, Char*, UInt32, HRESULT)
    get_object_attributes : Proc(IWMDMOperation2*, UInt32*, WAVEFORMATEX*, HRESULT)
    set_object_attributes : Proc(IWMDMOperation2*, UInt32, WAVEFORMATEX*, HRESULT)
    get_object_total_size : Proc(IWMDMOperation2*, UInt32*, UInt32*, HRESULT)
    set_object_total_size : Proc(IWMDMOperation2*, UInt32, UInt32, HRESULT)
    transfer_object_data : Proc(IWMDMOperation2*, UInt8*, UInt32*, UInt8*, HRESULT)
    end_ : Proc(IWMDMOperation2*, HRESULT*, IUnknown, HRESULT)
    set_object_attributes2 : Proc(IWMDMOperation2*, UInt32, UInt32, WAVEFORMATEX*, VIDEOINFOHEADER*, HRESULT)
    get_object_attributes2 : Proc(IWMDMOperation2*, UInt32*, UInt32*, WAVEFORMATEX*, VIDEOINFOHEADER*, HRESULT)
  end

  IWMDMOperation2_GUID = "33445b48-7df7-425c-ad8f-0fc6d82f9f75"
  IID_IWMDMOperation2 = LibC::GUID.new(0x33445b48_u32, 0x7df7_u16, 0x425c_u16, StaticArray[0xad_u8, 0x8f_u8, 0xf_u8, 0xc6_u8, 0xd8_u8, 0x2f_u8, 0x9f_u8, 0x75_u8])
  struct IWMDMOperation2
    lpVtbl : IWMDMOperation2VTbl*
  end

  struct IWMDMOperation3VTbl
    query_interface : Proc(IWMDMOperation3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMDMOperation3*, UInt32)
    release : Proc(IWMDMOperation3*, UInt32)
    begin_read : Proc(IWMDMOperation3*, HRESULT)
    begin_write : Proc(IWMDMOperation3*, HRESULT)
    get_object_name : Proc(IWMDMOperation3*, Char*, UInt32, HRESULT)
    set_object_name : Proc(IWMDMOperation3*, Char*, UInt32, HRESULT)
    get_object_attributes : Proc(IWMDMOperation3*, UInt32*, WAVEFORMATEX*, HRESULT)
    set_object_attributes : Proc(IWMDMOperation3*, UInt32, WAVEFORMATEX*, HRESULT)
    get_object_total_size : Proc(IWMDMOperation3*, UInt32*, UInt32*, HRESULT)
    set_object_total_size : Proc(IWMDMOperation3*, UInt32, UInt32, HRESULT)
    transfer_object_data : Proc(IWMDMOperation3*, UInt8*, UInt32*, UInt8*, HRESULT)
    end_ : Proc(IWMDMOperation3*, HRESULT*, IUnknown, HRESULT)
    transfer_object_data_on_clear_channel : Proc(IWMDMOperation3*, UInt8*, UInt32*, HRESULT)
  end

  IWMDMOperation3_GUID = "d1f9b46a-9ca8-46d8-9d0f-1ec9bae54919"
  IID_IWMDMOperation3 = LibC::GUID.new(0xd1f9b46a_u32, 0x9ca8_u16, 0x46d8_u16, StaticArray[0x9d_u8, 0xf_u8, 0x1e_u8, 0xc9_u8, 0xba_u8, 0xe5_u8, 0x49_u8, 0x19_u8])
  struct IWMDMOperation3
    lpVtbl : IWMDMOperation3VTbl*
  end

  struct IWMDMProgressVTbl
    query_interface : Proc(IWMDMProgress*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMDMProgress*, UInt32)
    release : Proc(IWMDMProgress*, UInt32)
    begin_ : Proc(IWMDMProgress*, UInt32, HRESULT)
    progress : Proc(IWMDMProgress*, UInt32, HRESULT)
    end_ : Proc(IWMDMProgress*, HRESULT)
  end

  IWMDMProgress_GUID = "1dcb3a0c-33ed-11d3-8470-00c04f79dbc0"
  IID_IWMDMProgress = LibC::GUID.new(0x1dcb3a0c_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct IWMDMProgress
    lpVtbl : IWMDMProgressVTbl*
  end

  struct IWMDMProgress2VTbl
    query_interface : Proc(IWMDMProgress2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMDMProgress2*, UInt32)
    release : Proc(IWMDMProgress2*, UInt32)
    begin_ : Proc(IWMDMProgress2*, UInt32, HRESULT)
    progress : Proc(IWMDMProgress2*, UInt32, HRESULT)
    end_ : Proc(IWMDMProgress2*, HRESULT)
    end2 : Proc(IWMDMProgress2*, HRESULT, HRESULT)
  end

  IWMDMProgress2_GUID = "3a43f550-b383-4e92-b04a-e6bbc660fefc"
  IID_IWMDMProgress2 = LibC::GUID.new(0x3a43f550_u32, 0xb383_u16, 0x4e92_u16, StaticArray[0xb0_u8, 0x4a_u8, 0xe6_u8, 0xbb_u8, 0xc6_u8, 0x60_u8, 0xfe_u8, 0xfc_u8])
  struct IWMDMProgress2
    lpVtbl : IWMDMProgress2VTbl*
  end

  struct IWMDMProgress3VTbl
    query_interface : Proc(IWMDMProgress3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMDMProgress3*, UInt32)
    release : Proc(IWMDMProgress3*, UInt32)
    begin_ : Proc(IWMDMProgress3*, UInt32, HRESULT)
    progress : Proc(IWMDMProgress3*, UInt32, HRESULT)
    end_ : Proc(IWMDMProgress3*, HRESULT)
    end2 : Proc(IWMDMProgress3*, HRESULT, HRESULT)
    begin3 : Proc(IWMDMProgress3*, Guid, UInt32, OPAQUECOMMAND*, HRESULT)
    progress3 : Proc(IWMDMProgress3*, Guid, UInt32, OPAQUECOMMAND*, HRESULT)
    end3 : Proc(IWMDMProgress3*, Guid, HRESULT, OPAQUECOMMAND*, HRESULT)
  end

  IWMDMProgress3_GUID = "21de01cb-3bb4-4929-b21a-17af3f80f658"
  IID_IWMDMProgress3 = LibC::GUID.new(0x21de01cb_u32, 0x3bb4_u16, 0x4929_u16, StaticArray[0xb2_u8, 0x1a_u8, 0x17_u8, 0xaf_u8, 0x3f_u8, 0x80_u8, 0xf6_u8, 0x58_u8])
  struct IWMDMProgress3
    lpVtbl : IWMDMProgress3VTbl*
  end

  struct IWMDMDeviceVTbl
    query_interface : Proc(IWMDMDevice*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMDMDevice*, UInt32)
    release : Proc(IWMDMDevice*, UInt32)
    get_name : Proc(IWMDMDevice*, Char*, UInt32, HRESULT)
    get_manufacturer : Proc(IWMDMDevice*, Char*, UInt32, HRESULT)
    get_version : Proc(IWMDMDevice*, UInt32*, HRESULT)
    get_type : Proc(IWMDMDevice*, UInt32*, HRESULT)
    get_serial_number : Proc(IWMDMDevice*, WMDMID*, UInt8*, HRESULT)
    get_power_source : Proc(IWMDMDevice*, UInt32*, UInt32*, HRESULT)
    get_status : Proc(IWMDMDevice*, UInt32*, HRESULT)
    get_device_icon : Proc(IWMDMDevice*, UInt32*, HRESULT)
    enum_storage : Proc(IWMDMDevice*, IWMDMEnumStorage*, HRESULT)
    get_format_support : Proc(IWMDMDevice*, WAVEFORMATEX**, UInt32*, LibC::LPWSTR**, UInt32*, HRESULT)
    send_opaque_command : Proc(IWMDMDevice*, OPAQUECOMMAND*, HRESULT)
  end

  IWMDMDevice_GUID = "1dcb3a02-33ed-11d3-8470-00c04f79dbc0"
  IID_IWMDMDevice = LibC::GUID.new(0x1dcb3a02_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct IWMDMDevice
    lpVtbl : IWMDMDeviceVTbl*
  end

  struct IWMDMDevice2VTbl
    query_interface : Proc(IWMDMDevice2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMDMDevice2*, UInt32)
    release : Proc(IWMDMDevice2*, UInt32)
    get_name : Proc(IWMDMDevice2*, Char*, UInt32, HRESULT)
    get_manufacturer : Proc(IWMDMDevice2*, Char*, UInt32, HRESULT)
    get_version : Proc(IWMDMDevice2*, UInt32*, HRESULT)
    get_type : Proc(IWMDMDevice2*, UInt32*, HRESULT)
    get_serial_number : Proc(IWMDMDevice2*, WMDMID*, UInt8*, HRESULT)
    get_power_source : Proc(IWMDMDevice2*, UInt32*, UInt32*, HRESULT)
    get_status : Proc(IWMDMDevice2*, UInt32*, HRESULT)
    get_device_icon : Proc(IWMDMDevice2*, UInt32*, HRESULT)
    enum_storage : Proc(IWMDMDevice2*, IWMDMEnumStorage*, HRESULT)
    get_format_support : Proc(IWMDMDevice2*, WAVEFORMATEX**, UInt32*, LibC::LPWSTR**, UInt32*, HRESULT)
    send_opaque_command : Proc(IWMDMDevice2*, OPAQUECOMMAND*, HRESULT)
    get_storage : Proc(IWMDMDevice2*, LibC::LPWSTR, IWMDMStorage*, HRESULT)
    get_format_support2 : Proc(IWMDMDevice2*, UInt32, WAVEFORMATEX**, UInt32*, VIDEOINFOHEADER**, UInt32*, WMFILECAPABILITIES**, UInt32*, HRESULT)
    get_specify_property_pages : Proc(IWMDMDevice2*, ISpecifyPropertyPages*, IUnknown**, UInt32*, HRESULT)
    get_canonical_name : Proc(IWMDMDevice2*, Char*, UInt32, HRESULT)
  end

  IWMDMDevice2_GUID = "e34f3d37-9d67-4fc1-9252-62d28b2f8b55"
  IID_IWMDMDevice2 = LibC::GUID.new(0xe34f3d37_u32, 0x9d67_u16, 0x4fc1_u16, StaticArray[0x92_u8, 0x52_u8, 0x62_u8, 0xd2_u8, 0x8b_u8, 0x2f_u8, 0x8b_u8, 0x55_u8])
  struct IWMDMDevice2
    lpVtbl : IWMDMDevice2VTbl*
  end

  struct IWMDMDevice3VTbl
    query_interface : Proc(IWMDMDevice3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMDMDevice3*, UInt32)
    release : Proc(IWMDMDevice3*, UInt32)
    get_name : Proc(IWMDMDevice3*, Char*, UInt32, HRESULT)
    get_manufacturer : Proc(IWMDMDevice3*, Char*, UInt32, HRESULT)
    get_version : Proc(IWMDMDevice3*, UInt32*, HRESULT)
    get_type : Proc(IWMDMDevice3*, UInt32*, HRESULT)
    get_serial_number : Proc(IWMDMDevice3*, WMDMID*, UInt8*, HRESULT)
    get_power_source : Proc(IWMDMDevice3*, UInt32*, UInt32*, HRESULT)
    get_status : Proc(IWMDMDevice3*, UInt32*, HRESULT)
    get_device_icon : Proc(IWMDMDevice3*, UInt32*, HRESULT)
    enum_storage : Proc(IWMDMDevice3*, IWMDMEnumStorage*, HRESULT)
    get_format_support : Proc(IWMDMDevice3*, WAVEFORMATEX**, UInt32*, LibC::LPWSTR**, UInt32*, HRESULT)
    send_opaque_command : Proc(IWMDMDevice3*, OPAQUECOMMAND*, HRESULT)
    get_storage : Proc(IWMDMDevice3*, LibC::LPWSTR, IWMDMStorage*, HRESULT)
    get_format_support2 : Proc(IWMDMDevice3*, UInt32, WAVEFORMATEX**, UInt32*, VIDEOINFOHEADER**, UInt32*, WMFILECAPABILITIES**, UInt32*, HRESULT)
    get_specify_property_pages : Proc(IWMDMDevice3*, ISpecifyPropertyPages*, IUnknown**, UInt32*, HRESULT)
    get_canonical_name : Proc(IWMDMDevice3*, Char*, UInt32, HRESULT)
    get_property : Proc(IWMDMDevice3*, LibC::LPWSTR, PROPVARIANT*, HRESULT)
    set_property : Proc(IWMDMDevice3*, LibC::LPWSTR, PROPVARIANT*, HRESULT)
    get_format_capability : Proc(IWMDMDevice3*, WMDM_FORMATCODE, WMDM_FORMAT_CAPABILITY*, HRESULT)
    device_io_control : Proc(IWMDMDevice3*, UInt32, UInt8*, UInt32, UInt8*, UInt32*, HRESULT)
    find_storage : Proc(IWMDMDevice3*, WMDM_FIND_SCOPE, LibC::LPWSTR, IWMDMStorage*, HRESULT)
  end

  IWMDMDevice3_GUID = "6c03e4fe-05db-4dda-9e3c-06233a6d5d65"
  IID_IWMDMDevice3 = LibC::GUID.new(0x6c03e4fe_u32, 0x5db_u16, 0x4dda_u16, StaticArray[0x9e_u8, 0x3c_u8, 0x6_u8, 0x23_u8, 0x3a_u8, 0x6d_u8, 0x5d_u8, 0x65_u8])
  struct IWMDMDevice3
    lpVtbl : IWMDMDevice3VTbl*
  end

  struct IWMDMDeviceSessionVTbl
    query_interface : Proc(IWMDMDeviceSession*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMDMDeviceSession*, UInt32)
    release : Proc(IWMDMDeviceSession*, UInt32)
    begin_session : Proc(IWMDMDeviceSession*, WMDM_SESSION_TYPE, UInt8*, UInt32, HRESULT)
    end_session : Proc(IWMDMDeviceSession*, WMDM_SESSION_TYPE, UInt8*, UInt32, HRESULT)
  end

  IWMDMDeviceSession_GUID = "82af0a65-9d96-412c-83e5-3c43e4b06cc7"
  IID_IWMDMDeviceSession = LibC::GUID.new(0x82af0a65_u32, 0x9d96_u16, 0x412c_u16, StaticArray[0x83_u8, 0xe5_u8, 0x3c_u8, 0x43_u8, 0xe4_u8, 0xb0_u8, 0x6c_u8, 0xc7_u8])
  struct IWMDMDeviceSession
    lpVtbl : IWMDMDeviceSessionVTbl*
  end

  struct IWMDMEnumDeviceVTbl
    query_interface : Proc(IWMDMEnumDevice*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMDMEnumDevice*, UInt32)
    release : Proc(IWMDMEnumDevice*, UInt32)
    next : Proc(IWMDMEnumDevice*, UInt32, IWMDMDevice*, UInt32*, HRESULT)
    skip : Proc(IWMDMEnumDevice*, UInt32, UInt32*, HRESULT)
    reset : Proc(IWMDMEnumDevice*, HRESULT)
    clone : Proc(IWMDMEnumDevice*, IWMDMEnumDevice*, HRESULT)
  end

  IWMDMEnumDevice_GUID = "1dcb3a01-33ed-11d3-8470-00c04f79dbc0"
  IID_IWMDMEnumDevice = LibC::GUID.new(0x1dcb3a01_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct IWMDMEnumDevice
    lpVtbl : IWMDMEnumDeviceVTbl*
  end

  struct IWMDMDeviceControlVTbl
    query_interface : Proc(IWMDMDeviceControl*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMDMDeviceControl*, UInt32)
    release : Proc(IWMDMDeviceControl*, UInt32)
    get_status : Proc(IWMDMDeviceControl*, UInt32*, HRESULT)
    get_capabilities : Proc(IWMDMDeviceControl*, UInt32*, HRESULT)
    play : Proc(IWMDMDeviceControl*, HRESULT)
    record : Proc(IWMDMDeviceControl*, WAVEFORMATEX*, HRESULT)
    pause : Proc(IWMDMDeviceControl*, HRESULT)
    resume : Proc(IWMDMDeviceControl*, HRESULT)
    stop : Proc(IWMDMDeviceControl*, HRESULT)
    seek : Proc(IWMDMDeviceControl*, UInt32, Int32, HRESULT)
  end

  IWMDMDeviceControl_GUID = "1dcb3a04-33ed-11d3-8470-00c04f79dbc0"
  IID_IWMDMDeviceControl = LibC::GUID.new(0x1dcb3a04_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct IWMDMDeviceControl
    lpVtbl : IWMDMDeviceControlVTbl*
  end

  struct IWMDMEnumStorageVTbl
    query_interface : Proc(IWMDMEnumStorage*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMDMEnumStorage*, UInt32)
    release : Proc(IWMDMEnumStorage*, UInt32)
    next : Proc(IWMDMEnumStorage*, UInt32, IWMDMStorage*, UInt32*, HRESULT)
    skip : Proc(IWMDMEnumStorage*, UInt32, UInt32*, HRESULT)
    reset : Proc(IWMDMEnumStorage*, HRESULT)
    clone : Proc(IWMDMEnumStorage*, IWMDMEnumStorage*, HRESULT)
  end

  IWMDMEnumStorage_GUID = "1dcb3a05-33ed-11d3-8470-00c04f79dbc0"
  IID_IWMDMEnumStorage = LibC::GUID.new(0x1dcb3a05_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct IWMDMEnumStorage
    lpVtbl : IWMDMEnumStorageVTbl*
  end

  struct IWMDMStorageControlVTbl
    query_interface : Proc(IWMDMStorageControl*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMDMStorageControl*, UInt32)
    release : Proc(IWMDMStorageControl*, UInt32)
    insert : Proc(IWMDMStorageControl*, UInt32, LibC::LPWSTR, IWMDMOperation, IWMDMProgress, IWMDMStorage*, HRESULT)
    delete : Proc(IWMDMStorageControl*, UInt32, IWMDMProgress, HRESULT)
    rename : Proc(IWMDMStorageControl*, UInt32, LibC::LPWSTR, IWMDMProgress, HRESULT)
    read : Proc(IWMDMStorageControl*, UInt32, LibC::LPWSTR, IWMDMProgress, IWMDMOperation, HRESULT)
    move : Proc(IWMDMStorageControl*, UInt32, IWMDMStorage, IWMDMProgress, HRESULT)
  end

  IWMDMStorageControl_GUID = "1dcb3a08-33ed-11d3-8470-00c04f79dbc0"
  IID_IWMDMStorageControl = LibC::GUID.new(0x1dcb3a08_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct IWMDMStorageControl
    lpVtbl : IWMDMStorageControlVTbl*
  end

  struct IWMDMStorageControl2VTbl
    query_interface : Proc(IWMDMStorageControl2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMDMStorageControl2*, UInt32)
    release : Proc(IWMDMStorageControl2*, UInt32)
    insert : Proc(IWMDMStorageControl2*, UInt32, LibC::LPWSTR, IWMDMOperation, IWMDMProgress, IWMDMStorage*, HRESULT)
    delete : Proc(IWMDMStorageControl2*, UInt32, IWMDMProgress, HRESULT)
    rename : Proc(IWMDMStorageControl2*, UInt32, LibC::LPWSTR, IWMDMProgress, HRESULT)
    read : Proc(IWMDMStorageControl2*, UInt32, LibC::LPWSTR, IWMDMProgress, IWMDMOperation, HRESULT)
    move : Proc(IWMDMStorageControl2*, UInt32, IWMDMStorage, IWMDMProgress, HRESULT)
    insert2 : Proc(IWMDMStorageControl2*, UInt32, LibC::LPWSTR, LibC::LPWSTR, IWMDMOperation, IWMDMProgress, IUnknown, IWMDMStorage*, HRESULT)
  end

  IWMDMStorageControl2_GUID = "972c2e88-bd6c-4125-8e09-84f837e637b6"
  IID_IWMDMStorageControl2 = LibC::GUID.new(0x972c2e88_u32, 0xbd6c_u16, 0x4125_u16, StaticArray[0x8e_u8, 0x9_u8, 0x84_u8, 0xf8_u8, 0x37_u8, 0xe6_u8, 0x37_u8, 0xb6_u8])
  struct IWMDMStorageControl2
    lpVtbl : IWMDMStorageControl2VTbl*
  end

  struct IWMDMStorageControl3VTbl
    query_interface : Proc(IWMDMStorageControl3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMDMStorageControl3*, UInt32)
    release : Proc(IWMDMStorageControl3*, UInt32)
    insert : Proc(IWMDMStorageControl3*, UInt32, LibC::LPWSTR, IWMDMOperation, IWMDMProgress, IWMDMStorage*, HRESULT)
    delete : Proc(IWMDMStorageControl3*, UInt32, IWMDMProgress, HRESULT)
    rename : Proc(IWMDMStorageControl3*, UInt32, LibC::LPWSTR, IWMDMProgress, HRESULT)
    read : Proc(IWMDMStorageControl3*, UInt32, LibC::LPWSTR, IWMDMProgress, IWMDMOperation, HRESULT)
    move : Proc(IWMDMStorageControl3*, UInt32, IWMDMStorage, IWMDMProgress, HRESULT)
    insert2 : Proc(IWMDMStorageControl3*, UInt32, LibC::LPWSTR, LibC::LPWSTR, IWMDMOperation, IWMDMProgress, IUnknown, IWMDMStorage*, HRESULT)
    insert3 : Proc(IWMDMStorageControl3*, UInt32, UInt32, LibC::LPWSTR, LibC::LPWSTR, IWMDMOperation, IWMDMProgress, IWMDMMetaData, IUnknown, IWMDMStorage*, HRESULT)
  end

  IWMDMStorageControl3_GUID = "b3266365-d4f3-4696-8d53-bd27ec60993a"
  IID_IWMDMStorageControl3 = LibC::GUID.new(0xb3266365_u32, 0xd4f3_u16, 0x4696_u16, StaticArray[0x8d_u8, 0x53_u8, 0xbd_u8, 0x27_u8, 0xec_u8, 0x60_u8, 0x99_u8, 0x3a_u8])
  struct IWMDMStorageControl3
    lpVtbl : IWMDMStorageControl3VTbl*
  end

  struct IWMDMObjectInfoVTbl
    query_interface : Proc(IWMDMObjectInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMDMObjectInfo*, UInt32)
    release : Proc(IWMDMObjectInfo*, UInt32)
    get_play_length : Proc(IWMDMObjectInfo*, UInt32*, HRESULT)
    set_play_length : Proc(IWMDMObjectInfo*, UInt32, HRESULT)
    get_play_offset : Proc(IWMDMObjectInfo*, UInt32*, HRESULT)
    set_play_offset : Proc(IWMDMObjectInfo*, UInt32, HRESULT)
    get_total_length : Proc(IWMDMObjectInfo*, UInt32*, HRESULT)
    get_last_play_position : Proc(IWMDMObjectInfo*, UInt32*, HRESULT)
    get_longest_play_position : Proc(IWMDMObjectInfo*, UInt32*, HRESULT)
  end

  IWMDMObjectInfo_GUID = "1dcb3a09-33ed-11d3-8470-00c04f79dbc0"
  IID_IWMDMObjectInfo = LibC::GUID.new(0x1dcb3a09_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct IWMDMObjectInfo
    lpVtbl : IWMDMObjectInfoVTbl*
  end

  struct IWMDMRevokedVTbl
    query_interface : Proc(IWMDMRevoked*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMDMRevoked*, UInt32)
    release : Proc(IWMDMRevoked*, UInt32)
    get_revocation_url : Proc(IWMDMRevoked*, LibC::LPWSTR*, UInt32*, UInt32*, HRESULT)
  end

  IWMDMRevoked_GUID = "ebeccedb-88ee-4e55-b6a4-8d9f07d696aa"
  IID_IWMDMRevoked = LibC::GUID.new(0xebeccedb_u32, 0x88ee_u16, 0x4e55_u16, StaticArray[0xb6_u8, 0xa4_u8, 0x8d_u8, 0x9f_u8, 0x7_u8, 0xd6_u8, 0x96_u8, 0xaa_u8])
  struct IWMDMRevoked
    lpVtbl : IWMDMRevokedVTbl*
  end

  struct IWMDMNotificationVTbl
    query_interface : Proc(IWMDMNotification*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMDMNotification*, UInt32)
    release : Proc(IWMDMNotification*, UInt32)
    wmdm_message : Proc(IWMDMNotification*, UInt32, LibC::LPWSTR, HRESULT)
  end

  IWMDMNotification_GUID = "3f5e95c0-0f43-4ed4-93d2-c89a45d59b81"
  IID_IWMDMNotification = LibC::GUID.new(0x3f5e95c0_u32, 0xf43_u16, 0x4ed4_u16, StaticArray[0x93_u8, 0xd2_u8, 0xc8_u8, 0x9a_u8, 0x45_u8, 0xd5_u8, 0x9b_u8, 0x81_u8])
  struct IWMDMNotification
    lpVtbl : IWMDMNotificationVTbl*
  end

  struct IMDServiceProviderVTbl
    query_interface : Proc(IMDServiceProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMDServiceProvider*, UInt32)
    release : Proc(IMDServiceProvider*, UInt32)
    get_device_count : Proc(IMDServiceProvider*, UInt32*, HRESULT)
    enum_devices : Proc(IMDServiceProvider*, IMDSPEnumDevice*, HRESULT)
  end

  IMDServiceProvider_GUID = "1dcb3a10-33ed-11d3-8470-00c04f79dbc0"
  IID_IMDServiceProvider = LibC::GUID.new(0x1dcb3a10_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct IMDServiceProvider
    lpVtbl : IMDServiceProviderVTbl*
  end

  struct IMDServiceProvider2VTbl
    query_interface : Proc(IMDServiceProvider2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMDServiceProvider2*, UInt32)
    release : Proc(IMDServiceProvider2*, UInt32)
    get_device_count : Proc(IMDServiceProvider2*, UInt32*, HRESULT)
    enum_devices : Proc(IMDServiceProvider2*, IMDSPEnumDevice*, HRESULT)
    create_device : Proc(IMDServiceProvider2*, LibC::LPWSTR, UInt32*, IMDSPDevice**, HRESULT)
  end

  IMDServiceProvider2_GUID = "b2fa24b7-cda3-4694-9862-413ae1a34819"
  IID_IMDServiceProvider2 = LibC::GUID.new(0xb2fa24b7_u32, 0xcda3_u16, 0x4694_u16, StaticArray[0x98_u8, 0x62_u8, 0x41_u8, 0x3a_u8, 0xe1_u8, 0xa3_u8, 0x48_u8, 0x19_u8])
  struct IMDServiceProvider2
    lpVtbl : IMDServiceProvider2VTbl*
  end

  struct IMDServiceProvider3VTbl
    query_interface : Proc(IMDServiceProvider3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMDServiceProvider3*, UInt32)
    release : Proc(IMDServiceProvider3*, UInt32)
    get_device_count : Proc(IMDServiceProvider3*, UInt32*, HRESULT)
    enum_devices : Proc(IMDServiceProvider3*, IMDSPEnumDevice*, HRESULT)
    create_device : Proc(IMDServiceProvider3*, LibC::LPWSTR, UInt32*, IMDSPDevice**, HRESULT)
    set_device_enum_preference : Proc(IMDServiceProvider3*, UInt32, HRESULT)
  end

  IMDServiceProvider3_GUID = "4ed13ef3-a971-4d19-9f51-0e1826b2da57"
  IID_IMDServiceProvider3 = LibC::GUID.new(0x4ed13ef3_u32, 0xa971_u16, 0x4d19_u16, StaticArray[0x9f_u8, 0x51_u8, 0xe_u8, 0x18_u8, 0x26_u8, 0xb2_u8, 0xda_u8, 0x57_u8])
  struct IMDServiceProvider3
    lpVtbl : IMDServiceProvider3VTbl*
  end

  struct IMDSPEnumDeviceVTbl
    query_interface : Proc(IMDSPEnumDevice*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMDSPEnumDevice*, UInt32)
    release : Proc(IMDSPEnumDevice*, UInt32)
    next : Proc(IMDSPEnumDevice*, UInt32, IMDSPDevice*, UInt32*, HRESULT)
    skip : Proc(IMDSPEnumDevice*, UInt32, UInt32*, HRESULT)
    reset : Proc(IMDSPEnumDevice*, HRESULT)
    clone : Proc(IMDSPEnumDevice*, IMDSPEnumDevice*, HRESULT)
  end

  IMDSPEnumDevice_GUID = "1dcb3a11-33ed-11d3-8470-00c04f79dbc0"
  IID_IMDSPEnumDevice = LibC::GUID.new(0x1dcb3a11_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct IMDSPEnumDevice
    lpVtbl : IMDSPEnumDeviceVTbl*
  end

  struct IMDSPDeviceVTbl
    query_interface : Proc(IMDSPDevice*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMDSPDevice*, UInt32)
    release : Proc(IMDSPDevice*, UInt32)
    get_name : Proc(IMDSPDevice*, Char*, UInt32, HRESULT)
    get_manufacturer : Proc(IMDSPDevice*, Char*, UInt32, HRESULT)
    get_version : Proc(IMDSPDevice*, UInt32*, HRESULT)
    get_type : Proc(IMDSPDevice*, UInt32*, HRESULT)
    get_serial_number : Proc(IMDSPDevice*, WMDMID*, UInt8*, HRESULT)
    get_power_source : Proc(IMDSPDevice*, UInt32*, UInt32*, HRESULT)
    get_status : Proc(IMDSPDevice*, UInt32*, HRESULT)
    get_device_icon : Proc(IMDSPDevice*, UInt32*, HRESULT)
    enum_storage : Proc(IMDSPDevice*, IMDSPEnumStorage*, HRESULT)
    get_format_support : Proc(IMDSPDevice*, WAVEFORMATEX**, UInt32*, LibC::LPWSTR**, UInt32*, HRESULT)
    send_opaque_command : Proc(IMDSPDevice*, OPAQUECOMMAND*, HRESULT)
  end

  IMDSPDevice_GUID = "1dcb3a12-33ed-11d3-8470-00c04f79dbc0"
  IID_IMDSPDevice = LibC::GUID.new(0x1dcb3a12_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct IMDSPDevice
    lpVtbl : IMDSPDeviceVTbl*
  end

  struct IMDSPDevice2VTbl
    query_interface : Proc(IMDSPDevice2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMDSPDevice2*, UInt32)
    release : Proc(IMDSPDevice2*, UInt32)
    get_name : Proc(IMDSPDevice2*, Char*, UInt32, HRESULT)
    get_manufacturer : Proc(IMDSPDevice2*, Char*, UInt32, HRESULT)
    get_version : Proc(IMDSPDevice2*, UInt32*, HRESULT)
    get_type : Proc(IMDSPDevice2*, UInt32*, HRESULT)
    get_serial_number : Proc(IMDSPDevice2*, WMDMID*, UInt8*, HRESULT)
    get_power_source : Proc(IMDSPDevice2*, UInt32*, UInt32*, HRESULT)
    get_status : Proc(IMDSPDevice2*, UInt32*, HRESULT)
    get_device_icon : Proc(IMDSPDevice2*, UInt32*, HRESULT)
    enum_storage : Proc(IMDSPDevice2*, IMDSPEnumStorage*, HRESULT)
    get_format_support : Proc(IMDSPDevice2*, WAVEFORMATEX**, UInt32*, LibC::LPWSTR**, UInt32*, HRESULT)
    send_opaque_command : Proc(IMDSPDevice2*, OPAQUECOMMAND*, HRESULT)
    get_storage : Proc(IMDSPDevice2*, LibC::LPWSTR, IMDSPStorage*, HRESULT)
    get_format_support2 : Proc(IMDSPDevice2*, UInt32, WAVEFORMATEX**, UInt32*, VIDEOINFOHEADER**, UInt32*, WMFILECAPABILITIES**, UInt32*, HRESULT)
    get_specify_property_pages : Proc(IMDSPDevice2*, ISpecifyPropertyPages*, IUnknown**, UInt32*, HRESULT)
    get_canonical_name : Proc(IMDSPDevice2*, Char*, UInt32, HRESULT)
  end

  IMDSPDevice2_GUID = "420d16ad-c97d-4e00-82aa-00e9f4335ddd"
  IID_IMDSPDevice2 = LibC::GUID.new(0x420d16ad_u32, 0xc97d_u16, 0x4e00_u16, StaticArray[0x82_u8, 0xaa_u8, 0x0_u8, 0xe9_u8, 0xf4_u8, 0x33_u8, 0x5d_u8, 0xdd_u8])
  struct IMDSPDevice2
    lpVtbl : IMDSPDevice2VTbl*
  end

  struct IMDSPDevice3VTbl
    query_interface : Proc(IMDSPDevice3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMDSPDevice3*, UInt32)
    release : Proc(IMDSPDevice3*, UInt32)
    get_name : Proc(IMDSPDevice3*, Char*, UInt32, HRESULT)
    get_manufacturer : Proc(IMDSPDevice3*, Char*, UInt32, HRESULT)
    get_version : Proc(IMDSPDevice3*, UInt32*, HRESULT)
    get_type : Proc(IMDSPDevice3*, UInt32*, HRESULT)
    get_serial_number : Proc(IMDSPDevice3*, WMDMID*, UInt8*, HRESULT)
    get_power_source : Proc(IMDSPDevice3*, UInt32*, UInt32*, HRESULT)
    get_status : Proc(IMDSPDevice3*, UInt32*, HRESULT)
    get_device_icon : Proc(IMDSPDevice3*, UInt32*, HRESULT)
    enum_storage : Proc(IMDSPDevice3*, IMDSPEnumStorage*, HRESULT)
    get_format_support : Proc(IMDSPDevice3*, WAVEFORMATEX**, UInt32*, LibC::LPWSTR**, UInt32*, HRESULT)
    send_opaque_command : Proc(IMDSPDevice3*, OPAQUECOMMAND*, HRESULT)
    get_storage : Proc(IMDSPDevice3*, LibC::LPWSTR, IMDSPStorage*, HRESULT)
    get_format_support2 : Proc(IMDSPDevice3*, UInt32, WAVEFORMATEX**, UInt32*, VIDEOINFOHEADER**, UInt32*, WMFILECAPABILITIES**, UInt32*, HRESULT)
    get_specify_property_pages : Proc(IMDSPDevice3*, ISpecifyPropertyPages*, IUnknown**, UInt32*, HRESULT)
    get_canonical_name : Proc(IMDSPDevice3*, Char*, UInt32, HRESULT)
    get_property : Proc(IMDSPDevice3*, LibC::LPWSTR, PROPVARIANT*, HRESULT)
    set_property : Proc(IMDSPDevice3*, LibC::LPWSTR, PROPVARIANT*, HRESULT)
    get_format_capability : Proc(IMDSPDevice3*, WMDM_FORMATCODE, WMDM_FORMAT_CAPABILITY*, HRESULT)
    device_io_control : Proc(IMDSPDevice3*, UInt32, UInt8*, UInt32, UInt8*, UInt32*, HRESULT)
    find_storage : Proc(IMDSPDevice3*, WMDM_FIND_SCOPE, LibC::LPWSTR, IMDSPStorage*, HRESULT)
  end

  IMDSPDevice3_GUID = "1a839845-fc55-487c-976f-ee38ac0e8c4e"
  IID_IMDSPDevice3 = LibC::GUID.new(0x1a839845_u32, 0xfc55_u16, 0x487c_u16, StaticArray[0x97_u8, 0x6f_u8, 0xee_u8, 0x38_u8, 0xac_u8, 0xe_u8, 0x8c_u8, 0x4e_u8])
  struct IMDSPDevice3
    lpVtbl : IMDSPDevice3VTbl*
  end

  struct IMDSPDeviceControlVTbl
    query_interface : Proc(IMDSPDeviceControl*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMDSPDeviceControl*, UInt32)
    release : Proc(IMDSPDeviceControl*, UInt32)
    get_dc_status : Proc(IMDSPDeviceControl*, UInt32*, HRESULT)
    get_capabilities : Proc(IMDSPDeviceControl*, UInt32*, HRESULT)
    play : Proc(IMDSPDeviceControl*, HRESULT)
    record : Proc(IMDSPDeviceControl*, WAVEFORMATEX*, HRESULT)
    pause : Proc(IMDSPDeviceControl*, HRESULT)
    resume : Proc(IMDSPDeviceControl*, HRESULT)
    stop : Proc(IMDSPDeviceControl*, HRESULT)
    seek : Proc(IMDSPDeviceControl*, UInt32, Int32, HRESULT)
  end

  IMDSPDeviceControl_GUID = "1dcb3a14-33ed-11d3-8470-00c04f79dbc0"
  IID_IMDSPDeviceControl = LibC::GUID.new(0x1dcb3a14_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct IMDSPDeviceControl
    lpVtbl : IMDSPDeviceControlVTbl*
  end

  struct IMDSPEnumStorageVTbl
    query_interface : Proc(IMDSPEnumStorage*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMDSPEnumStorage*, UInt32)
    release : Proc(IMDSPEnumStorage*, UInt32)
    next : Proc(IMDSPEnumStorage*, UInt32, IMDSPStorage*, UInt32*, HRESULT)
    skip : Proc(IMDSPEnumStorage*, UInt32, UInt32*, HRESULT)
    reset : Proc(IMDSPEnumStorage*, HRESULT)
    clone : Proc(IMDSPEnumStorage*, IMDSPEnumStorage*, HRESULT)
  end

  IMDSPEnumStorage_GUID = "1dcb3a15-33ed-11d3-8470-00c04f79dbc0"
  IID_IMDSPEnumStorage = LibC::GUID.new(0x1dcb3a15_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct IMDSPEnumStorage
    lpVtbl : IMDSPEnumStorageVTbl*
  end

  struct IMDSPStorageVTbl
    query_interface : Proc(IMDSPStorage*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMDSPStorage*, UInt32)
    release : Proc(IMDSPStorage*, UInt32)
    set_attributes : Proc(IMDSPStorage*, UInt32, WAVEFORMATEX*, HRESULT)
    get_storage_globals : Proc(IMDSPStorage*, IMDSPStorageGlobals*, HRESULT)
    get_attributes : Proc(IMDSPStorage*, UInt32*, WAVEFORMATEX*, HRESULT)
    get_name : Proc(IMDSPStorage*, Char*, UInt32, HRESULT)
    get_date : Proc(IMDSPStorage*, WMDMDATETIME*, HRESULT)
    get_size : Proc(IMDSPStorage*, UInt32*, UInt32*, HRESULT)
    get_rights : Proc(IMDSPStorage*, WMDMRIGHTS**, UInt32*, UInt8*, HRESULT)
    create_storage : Proc(IMDSPStorage*, UInt32, WAVEFORMATEX*, LibC::LPWSTR, IMDSPStorage*, HRESULT)
    enum_storage : Proc(IMDSPStorage*, IMDSPEnumStorage*, HRESULT)
    send_opaque_command : Proc(IMDSPStorage*, OPAQUECOMMAND*, HRESULT)
  end

  IMDSPStorage_GUID = "1dcb3a16-33ed-11d3-8470-00c04f79dbc0"
  IID_IMDSPStorage = LibC::GUID.new(0x1dcb3a16_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct IMDSPStorage
    lpVtbl : IMDSPStorageVTbl*
  end

  struct IMDSPStorage2VTbl
    query_interface : Proc(IMDSPStorage2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMDSPStorage2*, UInt32)
    release : Proc(IMDSPStorage2*, UInt32)
    set_attributes : Proc(IMDSPStorage2*, UInt32, WAVEFORMATEX*, HRESULT)
    get_storage_globals : Proc(IMDSPStorage2*, IMDSPStorageGlobals*, HRESULT)
    get_attributes : Proc(IMDSPStorage2*, UInt32*, WAVEFORMATEX*, HRESULT)
    get_name : Proc(IMDSPStorage2*, Char*, UInt32, HRESULT)
    get_date : Proc(IMDSPStorage2*, WMDMDATETIME*, HRESULT)
    get_size : Proc(IMDSPStorage2*, UInt32*, UInt32*, HRESULT)
    get_rights : Proc(IMDSPStorage2*, WMDMRIGHTS**, UInt32*, UInt8*, HRESULT)
    create_storage : Proc(IMDSPStorage2*, UInt32, WAVEFORMATEX*, LibC::LPWSTR, IMDSPStorage*, HRESULT)
    enum_storage : Proc(IMDSPStorage2*, IMDSPEnumStorage*, HRESULT)
    send_opaque_command : Proc(IMDSPStorage2*, OPAQUECOMMAND*, HRESULT)
    get_storage : Proc(IMDSPStorage2*, LibC::LPWSTR, IMDSPStorage*, HRESULT)
    create_storage2 : Proc(IMDSPStorage2*, UInt32, UInt32, WAVEFORMATEX*, VIDEOINFOHEADER*, LibC::LPWSTR, UInt64, IMDSPStorage*, HRESULT)
    set_attributes2 : Proc(IMDSPStorage2*, UInt32, UInt32, WAVEFORMATEX*, VIDEOINFOHEADER*, HRESULT)
    get_attributes2 : Proc(IMDSPStorage2*, UInt32*, UInt32*, WAVEFORMATEX*, VIDEOINFOHEADER*, HRESULT)
  end

  IMDSPStorage2_GUID = "0a5e07a5-6454-4451-9c36-1c6ae7e2b1d6"
  IID_IMDSPStorage2 = LibC::GUID.new(0xa5e07a5_u32, 0x6454_u16, 0x4451_u16, StaticArray[0x9c_u8, 0x36_u8, 0x1c_u8, 0x6a_u8, 0xe7_u8, 0xe2_u8, 0xb1_u8, 0xd6_u8])
  struct IMDSPStorage2
    lpVtbl : IMDSPStorage2VTbl*
  end

  struct IMDSPStorage3VTbl
    query_interface : Proc(IMDSPStorage3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMDSPStorage3*, UInt32)
    release : Proc(IMDSPStorage3*, UInt32)
    set_attributes : Proc(IMDSPStorage3*, UInt32, WAVEFORMATEX*, HRESULT)
    get_storage_globals : Proc(IMDSPStorage3*, IMDSPStorageGlobals*, HRESULT)
    get_attributes : Proc(IMDSPStorage3*, UInt32*, WAVEFORMATEX*, HRESULT)
    get_name : Proc(IMDSPStorage3*, Char*, UInt32, HRESULT)
    get_date : Proc(IMDSPStorage3*, WMDMDATETIME*, HRESULT)
    get_size : Proc(IMDSPStorage3*, UInt32*, UInt32*, HRESULT)
    get_rights : Proc(IMDSPStorage3*, WMDMRIGHTS**, UInt32*, UInt8*, HRESULT)
    create_storage : Proc(IMDSPStorage3*, UInt32, WAVEFORMATEX*, LibC::LPWSTR, IMDSPStorage*, HRESULT)
    enum_storage : Proc(IMDSPStorage3*, IMDSPEnumStorage*, HRESULT)
    send_opaque_command : Proc(IMDSPStorage3*, OPAQUECOMMAND*, HRESULT)
    get_storage : Proc(IMDSPStorage3*, LibC::LPWSTR, IMDSPStorage*, HRESULT)
    create_storage2 : Proc(IMDSPStorage3*, UInt32, UInt32, WAVEFORMATEX*, VIDEOINFOHEADER*, LibC::LPWSTR, UInt64, IMDSPStorage*, HRESULT)
    set_attributes2 : Proc(IMDSPStorage3*, UInt32, UInt32, WAVEFORMATEX*, VIDEOINFOHEADER*, HRESULT)
    get_attributes2 : Proc(IMDSPStorage3*, UInt32*, UInt32*, WAVEFORMATEX*, VIDEOINFOHEADER*, HRESULT)
    get_metadata : Proc(IMDSPStorage3*, IWMDMMetaData, HRESULT)
    set_metadata : Proc(IMDSPStorage3*, IWMDMMetaData, HRESULT)
  end

  IMDSPStorage3_GUID = "6c669867-97ed-4a67-9706-1c5529d2a414"
  IID_IMDSPStorage3 = LibC::GUID.new(0x6c669867_u32, 0x97ed_u16, 0x4a67_u16, StaticArray[0x97_u8, 0x6_u8, 0x1c_u8, 0x55_u8, 0x29_u8, 0xd2_u8, 0xa4_u8, 0x14_u8])
  struct IMDSPStorage3
    lpVtbl : IMDSPStorage3VTbl*
  end

  struct IMDSPStorage4VTbl
    query_interface : Proc(IMDSPStorage4*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMDSPStorage4*, UInt32)
    release : Proc(IMDSPStorage4*, UInt32)
    set_attributes : Proc(IMDSPStorage4*, UInt32, WAVEFORMATEX*, HRESULT)
    get_storage_globals : Proc(IMDSPStorage4*, IMDSPStorageGlobals*, HRESULT)
    get_attributes : Proc(IMDSPStorage4*, UInt32*, WAVEFORMATEX*, HRESULT)
    get_name : Proc(IMDSPStorage4*, Char*, UInt32, HRESULT)
    get_date : Proc(IMDSPStorage4*, WMDMDATETIME*, HRESULT)
    get_size : Proc(IMDSPStorage4*, UInt32*, UInt32*, HRESULT)
    get_rights : Proc(IMDSPStorage4*, WMDMRIGHTS**, UInt32*, UInt8*, HRESULT)
    create_storage : Proc(IMDSPStorage4*, UInt32, WAVEFORMATEX*, LibC::LPWSTR, IMDSPStorage*, HRESULT)
    enum_storage : Proc(IMDSPStorage4*, IMDSPEnumStorage*, HRESULT)
    send_opaque_command : Proc(IMDSPStorage4*, OPAQUECOMMAND*, HRESULT)
    get_storage : Proc(IMDSPStorage4*, LibC::LPWSTR, IMDSPStorage*, HRESULT)
    create_storage2 : Proc(IMDSPStorage4*, UInt32, UInt32, WAVEFORMATEX*, VIDEOINFOHEADER*, LibC::LPWSTR, UInt64, IMDSPStorage*, HRESULT)
    set_attributes2 : Proc(IMDSPStorage4*, UInt32, UInt32, WAVEFORMATEX*, VIDEOINFOHEADER*, HRESULT)
    get_attributes2 : Proc(IMDSPStorage4*, UInt32*, UInt32*, WAVEFORMATEX*, VIDEOINFOHEADER*, HRESULT)
    get_metadata : Proc(IMDSPStorage4*, IWMDMMetaData, HRESULT)
    set_metadata : Proc(IMDSPStorage4*, IWMDMMetaData, HRESULT)
    set_references : Proc(IMDSPStorage4*, UInt32, IMDSPStorage*, HRESULT)
    get_references : Proc(IMDSPStorage4*, UInt32*, IMDSPStorage**, HRESULT)
    create_storage_with_metadata : Proc(IMDSPStorage4*, UInt32, LibC::LPWSTR, IWMDMMetaData, UInt64, IMDSPStorage*, HRESULT)
    get_specified_metadata : Proc(IMDSPStorage4*, UInt32, LibC::LPWSTR*, IWMDMMetaData, HRESULT)
    find_storage : Proc(IMDSPStorage4*, WMDM_FIND_SCOPE, LibC::LPWSTR, IMDSPStorage*, HRESULT)
    get_parent : Proc(IMDSPStorage4*, IMDSPStorage*, HRESULT)
  end

  IMDSPStorage4_GUID = "3133b2c4-515c-481b-b1ce-39327ecb4f74"
  IID_IMDSPStorage4 = LibC::GUID.new(0x3133b2c4_u32, 0x515c_u16, 0x481b_u16, StaticArray[0xb1_u8, 0xce_u8, 0x39_u8, 0x32_u8, 0x7e_u8, 0xcb_u8, 0x4f_u8, 0x74_u8])
  struct IMDSPStorage4
    lpVtbl : IMDSPStorage4VTbl*
  end

  struct IMDSPStorageGlobalsVTbl
    query_interface : Proc(IMDSPStorageGlobals*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMDSPStorageGlobals*, UInt32)
    release : Proc(IMDSPStorageGlobals*, UInt32)
    get_capabilities : Proc(IMDSPStorageGlobals*, UInt32*, HRESULT)
    get_serial_number : Proc(IMDSPStorageGlobals*, WMDMID*, UInt8*, HRESULT)
    get_total_size : Proc(IMDSPStorageGlobals*, UInt32*, UInt32*, HRESULT)
    get_total_free : Proc(IMDSPStorageGlobals*, UInt32*, UInt32*, HRESULT)
    get_total_bad : Proc(IMDSPStorageGlobals*, UInt32*, UInt32*, HRESULT)
    get_status : Proc(IMDSPStorageGlobals*, UInt32*, HRESULT)
    initialize : Proc(IMDSPStorageGlobals*, UInt32, IWMDMProgress, HRESULT)
    get_device : Proc(IMDSPStorageGlobals*, IMDSPDevice*, HRESULT)
    get_root_storage : Proc(IMDSPStorageGlobals*, IMDSPStorage*, HRESULT)
  end

  IMDSPStorageGlobals_GUID = "1dcb3a17-33ed-11d3-8470-00c04f79dbc0"
  IID_IMDSPStorageGlobals = LibC::GUID.new(0x1dcb3a17_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct IMDSPStorageGlobals
    lpVtbl : IMDSPStorageGlobalsVTbl*
  end

  struct IMDSPObjectInfoVTbl
    query_interface : Proc(IMDSPObjectInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMDSPObjectInfo*, UInt32)
    release : Proc(IMDSPObjectInfo*, UInt32)
    get_play_length : Proc(IMDSPObjectInfo*, UInt32*, HRESULT)
    set_play_length : Proc(IMDSPObjectInfo*, UInt32, HRESULT)
    get_play_offset : Proc(IMDSPObjectInfo*, UInt32*, HRESULT)
    set_play_offset : Proc(IMDSPObjectInfo*, UInt32, HRESULT)
    get_total_length : Proc(IMDSPObjectInfo*, UInt32*, HRESULT)
    get_last_play_position : Proc(IMDSPObjectInfo*, UInt32*, HRESULT)
    get_longest_play_position : Proc(IMDSPObjectInfo*, UInt32*, HRESULT)
  end

  IMDSPObjectInfo_GUID = "1dcb3a19-33ed-11d3-8470-00c04f79dbc0"
  IID_IMDSPObjectInfo = LibC::GUID.new(0x1dcb3a19_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct IMDSPObjectInfo
    lpVtbl : IMDSPObjectInfoVTbl*
  end

  struct IMDSPObjectVTbl
    query_interface : Proc(IMDSPObject*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMDSPObject*, UInt32)
    release : Proc(IMDSPObject*, UInt32)
    open : Proc(IMDSPObject*, UInt32, HRESULT)
    read : Proc(IMDSPObject*, UInt8*, UInt32*, UInt8*, HRESULT)
    write : Proc(IMDSPObject*, UInt8*, UInt32*, UInt8*, HRESULT)
    delete : Proc(IMDSPObject*, UInt32, IWMDMProgress, HRESULT)
    seek : Proc(IMDSPObject*, UInt32, UInt32, HRESULT)
    rename : Proc(IMDSPObject*, LibC::LPWSTR, IWMDMProgress, HRESULT)
    move : Proc(IMDSPObject*, UInt32, IWMDMProgress, IMDSPStorage, HRESULT)
    close : Proc(IMDSPObject*, HRESULT)
  end

  IMDSPObject_GUID = "1dcb3a18-33ed-11d3-8470-00c04f79dbc0"
  IID_IMDSPObject = LibC::GUID.new(0x1dcb3a18_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct IMDSPObject
    lpVtbl : IMDSPObjectVTbl*
  end

  struct IMDSPObject2VTbl
    query_interface : Proc(IMDSPObject2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMDSPObject2*, UInt32)
    release : Proc(IMDSPObject2*, UInt32)
    open : Proc(IMDSPObject2*, UInt32, HRESULT)
    read : Proc(IMDSPObject2*, UInt8*, UInt32*, UInt8*, HRESULT)
    write : Proc(IMDSPObject2*, UInt8*, UInt32*, UInt8*, HRESULT)
    delete : Proc(IMDSPObject2*, UInt32, IWMDMProgress, HRESULT)
    seek : Proc(IMDSPObject2*, UInt32, UInt32, HRESULT)
    rename : Proc(IMDSPObject2*, LibC::LPWSTR, IWMDMProgress, HRESULT)
    move : Proc(IMDSPObject2*, UInt32, IWMDMProgress, IMDSPStorage, HRESULT)
    close : Proc(IMDSPObject2*, HRESULT)
    read_on_clear_channel : Proc(IMDSPObject2*, UInt8*, UInt32*, HRESULT)
    write_on_clear_channel : Proc(IMDSPObject2*, UInt8*, UInt32*, HRESULT)
  end

  IMDSPObject2_GUID = "3f34cd3e-5907-4341-9af9-97f4187c3aa5"
  IID_IMDSPObject2 = LibC::GUID.new(0x3f34cd3e_u32, 0x5907_u16, 0x4341_u16, StaticArray[0x9a_u8, 0xf9_u8, 0x97_u8, 0xf4_u8, 0x18_u8, 0x7c_u8, 0x3a_u8, 0xa5_u8])
  struct IMDSPObject2
    lpVtbl : IMDSPObject2VTbl*
  end

  struct IMDSPDirectTransferVTbl
    query_interface : Proc(IMDSPDirectTransfer*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMDSPDirectTransfer*, UInt32)
    release : Proc(IMDSPDirectTransfer*, UInt32)
    transfer_to_device : Proc(IMDSPDirectTransfer*, LibC::LPWSTR, IWMDMOperation, UInt32, LibC::LPWSTR, IWMDMMetaData, IWMDMProgress, IMDSPStorage*, HRESULT)
  end

  IMDSPDirectTransfer_GUID = "c2fe57a8-9304-478c-9ee4-47e397b912d7"
  IID_IMDSPDirectTransfer = LibC::GUID.new(0xc2fe57a8_u32, 0x9304_u16, 0x478c_u16, StaticArray[0x9e_u8, 0xe4_u8, 0x47_u8, 0xe3_u8, 0x97_u8, 0xb9_u8, 0x12_u8, 0xd7_u8])
  struct IMDSPDirectTransfer
    lpVtbl : IMDSPDirectTransferVTbl*
  end

  struct IMDSPRevokedVTbl
    query_interface : Proc(IMDSPRevoked*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMDSPRevoked*, UInt32)
    release : Proc(IMDSPRevoked*, UInt32)
    get_revocation_url : Proc(IMDSPRevoked*, LibC::LPWSTR*, UInt32*, HRESULT)
  end

  IMDSPRevoked_GUID = "a4e8f2d4-3f31-464d-b53d-4fc335998184"
  IID_IMDSPRevoked = LibC::GUID.new(0xa4e8f2d4_u32, 0x3f31_u16, 0x464d_u16, StaticArray[0xb5_u8, 0x3d_u8, 0x4f_u8, 0xc3_u8, 0x35_u8, 0x99_u8, 0x81_u8, 0x84_u8])
  struct IMDSPRevoked
    lpVtbl : IMDSPRevokedVTbl*
  end

  struct ISCPSecureAuthenticateVTbl
    query_interface : Proc(ISCPSecureAuthenticate*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISCPSecureAuthenticate*, UInt32)
    release : Proc(ISCPSecureAuthenticate*, UInt32)
    get_secure_query : Proc(ISCPSecureAuthenticate*, ISCPSecureQuery*, HRESULT)
  end

  ISCPSecureAuthenticate_GUID = "1dcb3a0f-33ed-11d3-8470-00c04f79dbc0"
  IID_ISCPSecureAuthenticate = LibC::GUID.new(0x1dcb3a0f_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct ISCPSecureAuthenticate
    lpVtbl : ISCPSecureAuthenticateVTbl*
  end

  struct ISCPSecureAuthenticate2VTbl
    query_interface : Proc(ISCPSecureAuthenticate2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISCPSecureAuthenticate2*, UInt32)
    release : Proc(ISCPSecureAuthenticate2*, UInt32)
    get_secure_query : Proc(ISCPSecureAuthenticate2*, ISCPSecureQuery*, HRESULT)
    get_scp_session : Proc(ISCPSecureAuthenticate2*, ISCPSession*, HRESULT)
  end

  ISCPSecureAuthenticate2_GUID = "b580cfae-1672-47e2-acaa-44bbecbcae5b"
  IID_ISCPSecureAuthenticate2 = LibC::GUID.new(0xb580cfae_u32, 0x1672_u16, 0x47e2_u16, StaticArray[0xac_u8, 0xaa_u8, 0x44_u8, 0xbb_u8, 0xec_u8, 0xbc_u8, 0xae_u8, 0x5b_u8])
  struct ISCPSecureAuthenticate2
    lpVtbl : ISCPSecureAuthenticate2VTbl*
  end

  struct ISCPSecureQueryVTbl
    query_interface : Proc(ISCPSecureQuery*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISCPSecureQuery*, UInt32)
    release : Proc(ISCPSecureQuery*, UInt32)
    get_data_demands : Proc(ISCPSecureQuery*, UInt32*, UInt32*, UInt32*, UInt32*, UInt8*, HRESULT)
    examine_data : Proc(ISCPSecureQuery*, UInt32, LibC::LPWSTR, UInt8*, UInt32, UInt8*, HRESULT)
    make_decision : Proc(ISCPSecureQuery*, UInt32, UInt8*, UInt32, UInt32, UInt8*, UInt32, IMDSPStorageGlobals, ISCPSecureExchange*, UInt8*, HRESULT)
    get_rights : Proc(ISCPSecureQuery*, UInt8*, UInt32, UInt8*, UInt32, IMDSPStorageGlobals, WMDMRIGHTS**, UInt32*, UInt8*, HRESULT)
  end

  ISCPSecureQuery_GUID = "1dcb3a0d-33ed-11d3-8470-00c04f79dbc0"
  IID_ISCPSecureQuery = LibC::GUID.new(0x1dcb3a0d_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct ISCPSecureQuery
    lpVtbl : ISCPSecureQueryVTbl*
  end

  struct ISCPSecureQuery2VTbl
    query_interface : Proc(ISCPSecureQuery2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISCPSecureQuery2*, UInt32)
    release : Proc(ISCPSecureQuery2*, UInt32)
    get_data_demands : Proc(ISCPSecureQuery2*, UInt32*, UInt32*, UInt32*, UInt32*, UInt8*, HRESULT)
    examine_data : Proc(ISCPSecureQuery2*, UInt32, LibC::LPWSTR, UInt8*, UInt32, UInt8*, HRESULT)
    make_decision : Proc(ISCPSecureQuery2*, UInt32, UInt8*, UInt32, UInt32, UInt8*, UInt32, IMDSPStorageGlobals, ISCPSecureExchange*, UInt8*, HRESULT)
    get_rights : Proc(ISCPSecureQuery2*, UInt8*, UInt32, UInt8*, UInt32, IMDSPStorageGlobals, WMDMRIGHTS**, UInt32*, UInt8*, HRESULT)
    make_decision2 : Proc(ISCPSecureQuery2*, UInt32, UInt8*, UInt32, UInt32, UInt8*, UInt32, IMDSPStorageGlobals, UInt8*, UInt32, UInt8*, UInt32, LibC::LPWSTR*, UInt32*, UInt32*, UInt64*, IUnknown, ISCPSecureExchange*, UInt8*, HRESULT)
  end

  ISCPSecureQuery2_GUID = "ebe17e25-4fd7-4632-af46-6d93d4fcc72e"
  IID_ISCPSecureQuery2 = LibC::GUID.new(0xebe17e25_u32, 0x4fd7_u16, 0x4632_u16, StaticArray[0xaf_u8, 0x46_u8, 0x6d_u8, 0x93_u8, 0xd4_u8, 0xfc_u8, 0xc7_u8, 0x2e_u8])
  struct ISCPSecureQuery2
    lpVtbl : ISCPSecureQuery2VTbl*
  end

  struct ISCPSecureExchangeVTbl
    query_interface : Proc(ISCPSecureExchange*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISCPSecureExchange*, UInt32)
    release : Proc(ISCPSecureExchange*, UInt32)
    transfer_container_data : Proc(ISCPSecureExchange*, UInt8*, UInt32, UInt32*, UInt8*, HRESULT)
    object_data : Proc(ISCPSecureExchange*, UInt8*, UInt32*, UInt8*, HRESULT)
    transfer_complete : Proc(ISCPSecureExchange*, HRESULT)
  end

  ISCPSecureExchange_GUID = "1dcb3a0e-33ed-11d3-8470-00c04f79dbc0"
  IID_ISCPSecureExchange = LibC::GUID.new(0x1dcb3a0e_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct ISCPSecureExchange
    lpVtbl : ISCPSecureExchangeVTbl*
  end

  struct ISCPSecureExchange2VTbl
    query_interface : Proc(ISCPSecureExchange2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISCPSecureExchange2*, UInt32)
    release : Proc(ISCPSecureExchange2*, UInt32)
    transfer_container_data : Proc(ISCPSecureExchange2*, UInt8*, UInt32, UInt32*, UInt8*, HRESULT)
    object_data : Proc(ISCPSecureExchange2*, UInt8*, UInt32*, UInt8*, HRESULT)
    transfer_complete : Proc(ISCPSecureExchange2*, HRESULT)
    transfer_container_data2 : Proc(ISCPSecureExchange2*, UInt8*, UInt32, IWMDMProgress3, UInt32*, UInt8*, HRESULT)
  end

  ISCPSecureExchange2_GUID = "6c62fc7b-2690-483f-9d44-0a20cb35577c"
  IID_ISCPSecureExchange2 = LibC::GUID.new(0x6c62fc7b_u32, 0x2690_u16, 0x483f_u16, StaticArray[0x9d_u8, 0x44_u8, 0xa_u8, 0x20_u8, 0xcb_u8, 0x35_u8, 0x57_u8, 0x7c_u8])
  struct ISCPSecureExchange2
    lpVtbl : ISCPSecureExchange2VTbl*
  end

  struct ISCPSecureExchange3VTbl
    query_interface : Proc(ISCPSecureExchange3*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISCPSecureExchange3*, UInt32)
    release : Proc(ISCPSecureExchange3*, UInt32)
    transfer_container_data : Proc(ISCPSecureExchange3*, UInt8*, UInt32, UInt32*, UInt8*, HRESULT)
    object_data : Proc(ISCPSecureExchange3*, UInt8*, UInt32*, UInt8*, HRESULT)
    transfer_complete : Proc(ISCPSecureExchange3*, HRESULT)
    transfer_container_data2 : Proc(ISCPSecureExchange3*, UInt8*, UInt32, IWMDMProgress3, UInt32*, UInt8*, HRESULT)
    transfer_container_data_on_clear_channel : Proc(ISCPSecureExchange3*, IMDSPDevice, UInt8*, UInt32, IWMDMProgress3, UInt32*, HRESULT)
    get_object_data_on_clear_channel : Proc(ISCPSecureExchange3*, IMDSPDevice, UInt8*, UInt32*, HRESULT)
    transfer_complete_for_device : Proc(ISCPSecureExchange3*, IMDSPDevice, HRESULT)
  end

  ISCPSecureExchange3_GUID = "ab4e77e4-8908-4b17-bd2a-b1dbe6dd69e1"
  IID_ISCPSecureExchange3 = LibC::GUID.new(0xab4e77e4_u32, 0x8908_u16, 0x4b17_u16, StaticArray[0xbd_u8, 0x2a_u8, 0xb1_u8, 0xdb_u8, 0xe6_u8, 0xdd_u8, 0x69_u8, 0xe1_u8])
  struct ISCPSecureExchange3
    lpVtbl : ISCPSecureExchange3VTbl*
  end

  struct ISCPSessionVTbl
    query_interface : Proc(ISCPSession*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISCPSession*, UInt32)
    release : Proc(ISCPSession*, UInt32)
    begin_session : Proc(ISCPSession*, IMDSPDevice, UInt8*, UInt32, HRESULT)
    end_session : Proc(ISCPSession*, UInt8*, UInt32, HRESULT)
    get_secure_query : Proc(ISCPSession*, ISCPSecureQuery*, HRESULT)
  end

  ISCPSession_GUID = "88a3e6ed-eee4-4619-bbb3-fd4fb62715d1"
  IID_ISCPSession = LibC::GUID.new(0x88a3e6ed_u32, 0xeee4_u16, 0x4619_u16, StaticArray[0xbb_u8, 0xb3_u8, 0xfd_u8, 0x4f_u8, 0xb6_u8, 0x27_u8, 0x15_u8, 0xd1_u8])
  struct ISCPSession
    lpVtbl : ISCPSessionVTbl*
  end

  struct ISCPSecureQuery3VTbl
    query_interface : Proc(ISCPSecureQuery3*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISCPSecureQuery3*, UInt32)
    release : Proc(ISCPSecureQuery3*, UInt32)
    get_data_demands : Proc(ISCPSecureQuery3*, UInt32*, UInt32*, UInt32*, UInt32*, UInt8*, HRESULT)
    examine_data : Proc(ISCPSecureQuery3*, UInt32, LibC::LPWSTR, UInt8*, UInt32, UInt8*, HRESULT)
    make_decision : Proc(ISCPSecureQuery3*, UInt32, UInt8*, UInt32, UInt32, UInt8*, UInt32, IMDSPStorageGlobals, ISCPSecureExchange*, UInt8*, HRESULT)
    get_rights : Proc(ISCPSecureQuery3*, UInt8*, UInt32, UInt8*, UInt32, IMDSPStorageGlobals, WMDMRIGHTS**, UInt32*, UInt8*, HRESULT)
    make_decision2 : Proc(ISCPSecureQuery3*, UInt32, UInt8*, UInt32, UInt32, UInt8*, UInt32, IMDSPStorageGlobals, UInt8*, UInt32, UInt8*, UInt32, LibC::LPWSTR*, UInt32*, UInt32*, UInt64*, IUnknown, ISCPSecureExchange*, UInt8*, HRESULT)
    get_rights_on_clear_channel : Proc(ISCPSecureQuery3*, UInt8*, UInt32, UInt8*, UInt32, IMDSPStorageGlobals, IWMDMProgress3, WMDMRIGHTS**, UInt32*, HRESULT)
    make_decision_on_clear_channel : Proc(ISCPSecureQuery3*, UInt32, UInt8*, UInt32, UInt32, UInt8*, UInt32, IMDSPStorageGlobals, IWMDMProgress3, UInt8*, UInt32, UInt8*, UInt32, LibC::LPWSTR*, UInt32*, UInt32*, UInt64*, IUnknown, ISCPSecureExchange*, HRESULT)
  end

  ISCPSecureQuery3_GUID = "b7edd1a2-4dab-484b-b3c5-ad39b8b4c0b1"
  IID_ISCPSecureQuery3 = LibC::GUID.new(0xb7edd1a2_u32, 0x4dab_u16, 0x484b_u16, StaticArray[0xb3_u8, 0xc5_u8, 0xad_u8, 0x39_u8, 0xb8_u8, 0xb4_u8, 0xc0_u8, 0xb1_u8])
  struct ISCPSecureQuery3
    lpVtbl : ISCPSecureQuery3VTbl*
  end

  struct IComponentAuthenticateVTbl
    query_interface : Proc(IComponentAuthenticate*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComponentAuthenticate*, UInt32)
    release : Proc(IComponentAuthenticate*, UInt32)
    sac_auth : Proc(IComponentAuthenticate*, UInt32, UInt32, UInt8*, UInt32, UInt8**, UInt32*, HRESULT)
    sac_get_protocols : Proc(IComponentAuthenticate*, UInt32**, UInt32*, HRESULT)
  end

  IComponentAuthenticate_GUID = "a9889c00-6d2b-11d3-8496-00c04f79dbc0"
  IID_IComponentAuthenticate = LibC::GUID.new(0xa9889c00_u32, 0x6d2b_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x96_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
  struct IComponentAuthenticate
    lpVtbl : IComponentAuthenticateVTbl*
  end

  struct IWMDMLoggerVTbl
    query_interface : Proc(IWMDMLogger*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMDMLogger*, UInt32)
    release : Proc(IWMDMLogger*, UInt32)
    is_enabled : Proc(IWMDMLogger*, LibC::BOOL*, HRESULT)
    enable : Proc(IWMDMLogger*, LibC::BOOL, HRESULT)
    get_log_file_name : Proc(IWMDMLogger*, PSTR, UInt32, HRESULT)
    set_log_file_name : Proc(IWMDMLogger*, PSTR, HRESULT)
    log_string : Proc(IWMDMLogger*, UInt32, PSTR, PSTR, HRESULT)
    log_dword : Proc(IWMDMLogger*, UInt32, PSTR, PSTR, UInt32, HRESULT)
    reset : Proc(IWMDMLogger*, HRESULT)
    get_size_params : Proc(IWMDMLogger*, UInt32*, UInt32*, HRESULT)
    set_size_params : Proc(IWMDMLogger*, UInt32, UInt32, HRESULT)
  end

  IWMDMLogger_GUID = "110a3200-5a79-11d3-8d78-444553540000"
  IID_IWMDMLogger = LibC::GUID.new(0x110a3200_u32, 0x5a79_u16, 0x11d3_u16, StaticArray[0x8d_u8, 0x78_u8, 0x44_u8, 0x45_u8, 0x53_u8, 0x54_u8, 0x0_u8, 0x0_u8])
  struct IWMDMLogger
    lpVtbl : IWMDMLoggerVTbl*
  end

end
struct LibWin32::IWMDMMetaData
  def query_interface(this : IWMDMMetaData*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMDMMetaData*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMDMMetaData*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def add_item(this : IWMDMMetaData*, type : WMDM_TAG_DATATYPE, pwsztagname : LibC::LPWSTR, pvalue : UInt8*, ilength : UInt32) : HRESULT
    @lpVtbl.value.add_item.call(this, type, pwsztagname, pvalue, ilength)
  end
  def query_by_name(this : IWMDMMetaData*, pwsztagname : LibC::LPWSTR, ptype : WMDM_TAG_DATATYPE*, pvalue : UInt8**, pcblength : UInt32*) : HRESULT
    @lpVtbl.value.query_by_name.call(this, pwsztagname, ptype, pvalue, pcblength)
  end
  def query_by_index(this : IWMDMMetaData*, iindex : UInt32, ppwszname : UInt16**, ptype : WMDM_TAG_DATATYPE*, ppvalue : UInt8**, pcblength : UInt32*) : HRESULT
    @lpVtbl.value.query_by_index.call(this, iindex, ppwszname, ptype, ppvalue, pcblength)
  end
  def get_item_count(this : IWMDMMetaData*, icount : UInt32*) : HRESULT
    @lpVtbl.value.get_item_count.call(this, icount)
  end
end
struct LibWin32::IWMDeviceManager
  def query_interface(this : IWMDeviceManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMDeviceManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMDeviceManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_revision(this : IWMDeviceManager*, pdwrevision : UInt32*) : HRESULT
    @lpVtbl.value.get_revision.call(this, pdwrevision)
  end
  def get_device_count(this : IWMDeviceManager*, pdwcount : UInt32*) : HRESULT
    @lpVtbl.value.get_device_count.call(this, pdwcount)
  end
  def enum_devices(this : IWMDeviceManager*, ppenumdevice : IWMDMEnumDevice*) : HRESULT
    @lpVtbl.value.enum_devices.call(this, ppenumdevice)
  end
end
struct LibWin32::IWMDeviceManager2
  def query_interface(this : IWMDeviceManager2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMDeviceManager2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMDeviceManager2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_revision(this : IWMDeviceManager2*, pdwrevision : UInt32*) : HRESULT
    @lpVtbl.value.get_revision.call(this, pdwrevision)
  end
  def get_device_count(this : IWMDeviceManager2*, pdwcount : UInt32*) : HRESULT
    @lpVtbl.value.get_device_count.call(this, pdwcount)
  end
  def enum_devices(this : IWMDeviceManager2*, ppenumdevice : IWMDMEnumDevice*) : HRESULT
    @lpVtbl.value.enum_devices.call(this, ppenumdevice)
  end
  def get_device_from_canonical_name(this : IWMDeviceManager2*, pwszcanonicalname : LibC::LPWSTR, ppdevice : IWMDMDevice*) : HRESULT
    @lpVtbl.value.get_device_from_canonical_name.call(this, pwszcanonicalname, ppdevice)
  end
  def enum_devices2(this : IWMDeviceManager2*, ppenumdevice : IWMDMEnumDevice*) : HRESULT
    @lpVtbl.value.enum_devices2.call(this, ppenumdevice)
  end
  def reinitialize(this : IWMDeviceManager2*) : HRESULT
    @lpVtbl.value.reinitialize.call(this)
  end
end
struct LibWin32::IWMDeviceManager3
  def query_interface(this : IWMDeviceManager3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMDeviceManager3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMDeviceManager3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_revision(this : IWMDeviceManager3*, pdwrevision : UInt32*) : HRESULT
    @lpVtbl.value.get_revision.call(this, pdwrevision)
  end
  def get_device_count(this : IWMDeviceManager3*, pdwcount : UInt32*) : HRESULT
    @lpVtbl.value.get_device_count.call(this, pdwcount)
  end
  def enum_devices(this : IWMDeviceManager3*, ppenumdevice : IWMDMEnumDevice*) : HRESULT
    @lpVtbl.value.enum_devices.call(this, ppenumdevice)
  end
  def get_device_from_canonical_name(this : IWMDeviceManager3*, pwszcanonicalname : LibC::LPWSTR, ppdevice : IWMDMDevice*) : HRESULT
    @lpVtbl.value.get_device_from_canonical_name.call(this, pwszcanonicalname, ppdevice)
  end
  def enum_devices2(this : IWMDeviceManager3*, ppenumdevice : IWMDMEnumDevice*) : HRESULT
    @lpVtbl.value.enum_devices2.call(this, ppenumdevice)
  end
  def reinitialize(this : IWMDeviceManager3*) : HRESULT
    @lpVtbl.value.reinitialize.call(this)
  end
  def set_device_enum_preference(this : IWMDeviceManager3*, dwenumpref : UInt32) : HRESULT
    @lpVtbl.value.set_device_enum_preference.call(this, dwenumpref)
  end
end
struct LibWin32::IWMDMStorageGlobals
  def query_interface(this : IWMDMStorageGlobals*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMDMStorageGlobals*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMDMStorageGlobals*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_capabilities(this : IWMDMStorageGlobals*, pdwcapabilities : UInt32*) : HRESULT
    @lpVtbl.value.get_capabilities.call(this, pdwcapabilities)
  end
  def get_serial_number(this : IWMDMStorageGlobals*, pserialnum : WMDMID*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_serial_number.call(this, pserialnum, abmac)
  end
  def get_total_size(this : IWMDMStorageGlobals*, pdwtotalsizelow : UInt32*, pdwtotalsizehigh : UInt32*) : HRESULT
    @lpVtbl.value.get_total_size.call(this, pdwtotalsizelow, pdwtotalsizehigh)
  end
  def get_total_free(this : IWMDMStorageGlobals*, pdwfreelow : UInt32*, pdwfreehigh : UInt32*) : HRESULT
    @lpVtbl.value.get_total_free.call(this, pdwfreelow, pdwfreehigh)
  end
  def get_total_bad(this : IWMDMStorageGlobals*, pdwbadlow : UInt32*, pdwbadhigh : UInt32*) : HRESULT
    @lpVtbl.value.get_total_bad.call(this, pdwbadlow, pdwbadhigh)
  end
  def get_status(this : IWMDMStorageGlobals*, pdwstatus : UInt32*) : HRESULT
    @lpVtbl.value.get_status.call(this, pdwstatus)
  end
  def initialize(this : IWMDMStorageGlobals*, fumode : UInt32, pprogress : IWMDMProgress) : HRESULT
    @lpVtbl.value.initialize.call(this, fumode, pprogress)
  end
end
struct LibWin32::IWMDMStorage
  def query_interface(this : IWMDMStorage*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMDMStorage*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMDMStorage*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_attributes(this : IWMDMStorage*, dwattributes : UInt32, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.set_attributes.call(this, dwattributes, pformat)
  end
  def get_storage_globals(this : IWMDMStorage*, ppstorageglobals : IWMDMStorageGlobals*) : HRESULT
    @lpVtbl.value.get_storage_globals.call(this, ppstorageglobals)
  end
  def get_attributes(this : IWMDMStorage*, pdwattributes : UInt32*, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.get_attributes.call(this, pdwattributes, pformat)
  end
  def get_name(this : IWMDMStorage*, pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_name.call(this, pwszname, nmaxchars)
  end
  def get_date(this : IWMDMStorage*, pdatetimeutc : WMDMDATETIME*) : HRESULT
    @lpVtbl.value.get_date.call(this, pdatetimeutc)
  end
  def get_size(this : IWMDMStorage*, pdwsizelow : UInt32*, pdwsizehigh : UInt32*) : HRESULT
    @lpVtbl.value.get_size.call(this, pdwsizelow, pdwsizehigh)
  end
  def get_rights(this : IWMDMStorage*, pprights : WMDMRIGHTS**, pnrightscount : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_rights.call(this, pprights, pnrightscount, abmac)
  end
  def enum_storage(this : IWMDMStorage*, penumstorage : IWMDMEnumStorage*) : HRESULT
    @lpVtbl.value.enum_storage.call(this, penumstorage)
  end
  def send_opaque_command(this : IWMDMStorage*, pcommand : OPAQUECOMMAND*) : HRESULT
    @lpVtbl.value.send_opaque_command.call(this, pcommand)
  end
end
struct LibWin32::IWMDMStorage2
  def query_interface(this : IWMDMStorage2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMDMStorage2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMDMStorage2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_attributes(this : IWMDMStorage2*, dwattributes : UInt32, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.set_attributes.call(this, dwattributes, pformat)
  end
  def get_storage_globals(this : IWMDMStorage2*, ppstorageglobals : IWMDMStorageGlobals*) : HRESULT
    @lpVtbl.value.get_storage_globals.call(this, ppstorageglobals)
  end
  def get_attributes(this : IWMDMStorage2*, pdwattributes : UInt32*, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.get_attributes.call(this, pdwattributes, pformat)
  end
  def get_name(this : IWMDMStorage2*, pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_name.call(this, pwszname, nmaxchars)
  end
  def get_date(this : IWMDMStorage2*, pdatetimeutc : WMDMDATETIME*) : HRESULT
    @lpVtbl.value.get_date.call(this, pdatetimeutc)
  end
  def get_size(this : IWMDMStorage2*, pdwsizelow : UInt32*, pdwsizehigh : UInt32*) : HRESULT
    @lpVtbl.value.get_size.call(this, pdwsizelow, pdwsizehigh)
  end
  def get_rights(this : IWMDMStorage2*, pprights : WMDMRIGHTS**, pnrightscount : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_rights.call(this, pprights, pnrightscount, abmac)
  end
  def enum_storage(this : IWMDMStorage2*, penumstorage : IWMDMEnumStorage*) : HRESULT
    @lpVtbl.value.enum_storage.call(this, penumstorage)
  end
  def send_opaque_command(this : IWMDMStorage2*, pcommand : OPAQUECOMMAND*) : HRESULT
    @lpVtbl.value.send_opaque_command.call(this, pcommand)
  end
  def get_storage(this : IWMDMStorage2*, pszstoragename : LibC::LPWSTR, ppstorage : IWMDMStorage*) : HRESULT
    @lpVtbl.value.get_storage.call(this, pszstoragename, ppstorage)
  end
  def set_attributes2(this : IWMDMStorage2*, dwattributes : UInt32, dwattributesex : UInt32, pformat : WAVEFORMATEX*, pvideoformat : VIDEOINFOHEADER*) : HRESULT
    @lpVtbl.value.set_attributes2.call(this, dwattributes, dwattributesex, pformat, pvideoformat)
  end
  def get_attributes2(this : IWMDMStorage2*, pdwattributes : UInt32*, pdwattributesex : UInt32*, paudioformat : WAVEFORMATEX*, pvideoformat : VIDEOINFOHEADER*) : HRESULT
    @lpVtbl.value.get_attributes2.call(this, pdwattributes, pdwattributesex, paudioformat, pvideoformat)
  end
end
struct LibWin32::IWMDMStorage3
  def query_interface(this : IWMDMStorage3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMDMStorage3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMDMStorage3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_attributes(this : IWMDMStorage3*, dwattributes : UInt32, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.set_attributes.call(this, dwattributes, pformat)
  end
  def get_storage_globals(this : IWMDMStorage3*, ppstorageglobals : IWMDMStorageGlobals*) : HRESULT
    @lpVtbl.value.get_storage_globals.call(this, ppstorageglobals)
  end
  def get_attributes(this : IWMDMStorage3*, pdwattributes : UInt32*, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.get_attributes.call(this, pdwattributes, pformat)
  end
  def get_name(this : IWMDMStorage3*, pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_name.call(this, pwszname, nmaxchars)
  end
  def get_date(this : IWMDMStorage3*, pdatetimeutc : WMDMDATETIME*) : HRESULT
    @lpVtbl.value.get_date.call(this, pdatetimeutc)
  end
  def get_size(this : IWMDMStorage3*, pdwsizelow : UInt32*, pdwsizehigh : UInt32*) : HRESULT
    @lpVtbl.value.get_size.call(this, pdwsizelow, pdwsizehigh)
  end
  def get_rights(this : IWMDMStorage3*, pprights : WMDMRIGHTS**, pnrightscount : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_rights.call(this, pprights, pnrightscount, abmac)
  end
  def enum_storage(this : IWMDMStorage3*, penumstorage : IWMDMEnumStorage*) : HRESULT
    @lpVtbl.value.enum_storage.call(this, penumstorage)
  end
  def send_opaque_command(this : IWMDMStorage3*, pcommand : OPAQUECOMMAND*) : HRESULT
    @lpVtbl.value.send_opaque_command.call(this, pcommand)
  end
  def get_storage(this : IWMDMStorage3*, pszstoragename : LibC::LPWSTR, ppstorage : IWMDMStorage*) : HRESULT
    @lpVtbl.value.get_storage.call(this, pszstoragename, ppstorage)
  end
  def set_attributes2(this : IWMDMStorage3*, dwattributes : UInt32, dwattributesex : UInt32, pformat : WAVEFORMATEX*, pvideoformat : VIDEOINFOHEADER*) : HRESULT
    @lpVtbl.value.set_attributes2.call(this, dwattributes, dwattributesex, pformat, pvideoformat)
  end
  def get_attributes2(this : IWMDMStorage3*, pdwattributes : UInt32*, pdwattributesex : UInt32*, paudioformat : WAVEFORMATEX*, pvideoformat : VIDEOINFOHEADER*) : HRESULT
    @lpVtbl.value.get_attributes2.call(this, pdwattributes, pdwattributesex, paudioformat, pvideoformat)
  end
  def get_metadata(this : IWMDMStorage3*, ppmetadata : IWMDMMetaData*) : HRESULT
    @lpVtbl.value.get_metadata.call(this, ppmetadata)
  end
  def set_metadata(this : IWMDMStorage3*, pmetadata : IWMDMMetaData) : HRESULT
    @lpVtbl.value.set_metadata.call(this, pmetadata)
  end
  def create_empty_metadata_object(this : IWMDMStorage3*, ppmetadata : IWMDMMetaData*) : HRESULT
    @lpVtbl.value.create_empty_metadata_object.call(this, ppmetadata)
  end
  def set_enum_preference(this : IWMDMStorage3*, pmode : WMDM_STORAGE_ENUM_MODE*, nviews : UInt32, pviews : WMDMMetadataView*) : HRESULT
    @lpVtbl.value.set_enum_preference.call(this, pmode, nviews, pviews)
  end
end
struct LibWin32::IWMDMStorage4
  def query_interface(this : IWMDMStorage4*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMDMStorage4*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMDMStorage4*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_attributes(this : IWMDMStorage4*, dwattributes : UInt32, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.set_attributes.call(this, dwattributes, pformat)
  end
  def get_storage_globals(this : IWMDMStorage4*, ppstorageglobals : IWMDMStorageGlobals*) : HRESULT
    @lpVtbl.value.get_storage_globals.call(this, ppstorageglobals)
  end
  def get_attributes(this : IWMDMStorage4*, pdwattributes : UInt32*, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.get_attributes.call(this, pdwattributes, pformat)
  end
  def get_name(this : IWMDMStorage4*, pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_name.call(this, pwszname, nmaxchars)
  end
  def get_date(this : IWMDMStorage4*, pdatetimeutc : WMDMDATETIME*) : HRESULT
    @lpVtbl.value.get_date.call(this, pdatetimeutc)
  end
  def get_size(this : IWMDMStorage4*, pdwsizelow : UInt32*, pdwsizehigh : UInt32*) : HRESULT
    @lpVtbl.value.get_size.call(this, pdwsizelow, pdwsizehigh)
  end
  def get_rights(this : IWMDMStorage4*, pprights : WMDMRIGHTS**, pnrightscount : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_rights.call(this, pprights, pnrightscount, abmac)
  end
  def enum_storage(this : IWMDMStorage4*, penumstorage : IWMDMEnumStorage*) : HRESULT
    @lpVtbl.value.enum_storage.call(this, penumstorage)
  end
  def send_opaque_command(this : IWMDMStorage4*, pcommand : OPAQUECOMMAND*) : HRESULT
    @lpVtbl.value.send_opaque_command.call(this, pcommand)
  end
  def get_storage(this : IWMDMStorage4*, pszstoragename : LibC::LPWSTR, ppstorage : IWMDMStorage*) : HRESULT
    @lpVtbl.value.get_storage.call(this, pszstoragename, ppstorage)
  end
  def set_attributes2(this : IWMDMStorage4*, dwattributes : UInt32, dwattributesex : UInt32, pformat : WAVEFORMATEX*, pvideoformat : VIDEOINFOHEADER*) : HRESULT
    @lpVtbl.value.set_attributes2.call(this, dwattributes, dwattributesex, pformat, pvideoformat)
  end
  def get_attributes2(this : IWMDMStorage4*, pdwattributes : UInt32*, pdwattributesex : UInt32*, paudioformat : WAVEFORMATEX*, pvideoformat : VIDEOINFOHEADER*) : HRESULT
    @lpVtbl.value.get_attributes2.call(this, pdwattributes, pdwattributesex, paudioformat, pvideoformat)
  end
  def get_metadata(this : IWMDMStorage4*, ppmetadata : IWMDMMetaData*) : HRESULT
    @lpVtbl.value.get_metadata.call(this, ppmetadata)
  end
  def set_metadata(this : IWMDMStorage4*, pmetadata : IWMDMMetaData) : HRESULT
    @lpVtbl.value.set_metadata.call(this, pmetadata)
  end
  def create_empty_metadata_object(this : IWMDMStorage4*, ppmetadata : IWMDMMetaData*) : HRESULT
    @lpVtbl.value.create_empty_metadata_object.call(this, ppmetadata)
  end
  def set_enum_preference(this : IWMDMStorage4*, pmode : WMDM_STORAGE_ENUM_MODE*, nviews : UInt32, pviews : WMDMMetadataView*) : HRESULT
    @lpVtbl.value.set_enum_preference.call(this, pmode, nviews, pviews)
  end
  def set_references(this : IWMDMStorage4*, dwrefs : UInt32, ppiwmdmstorage : IWMDMStorage*) : HRESULT
    @lpVtbl.value.set_references.call(this, dwrefs, ppiwmdmstorage)
  end
  def get_references(this : IWMDMStorage4*, pdwrefs : UInt32*, pppiwmdmstorage : IWMDMStorage**) : HRESULT
    @lpVtbl.value.get_references.call(this, pdwrefs, pppiwmdmstorage)
  end
  def get_rights_with_progress(this : IWMDMStorage4*, piprogresscallback : IWMDMProgress3, pprights : WMDMRIGHTS**, pnrightscount : UInt32*) : HRESULT
    @lpVtbl.value.get_rights_with_progress.call(this, piprogresscallback, pprights, pnrightscount)
  end
  def get_specified_metadata(this : IWMDMStorage4*, cproperties : UInt32, ppwszpropnames : LibC::LPWSTR*, ppmetadata : IWMDMMetaData*) : HRESULT
    @lpVtbl.value.get_specified_metadata.call(this, cproperties, ppwszpropnames, ppmetadata)
  end
  def find_storage(this : IWMDMStorage4*, findscope : WMDM_FIND_SCOPE, pwszuniqueid : LibC::LPWSTR, ppstorage : IWMDMStorage*) : HRESULT
    @lpVtbl.value.find_storage.call(this, findscope, pwszuniqueid, ppstorage)
  end
  def get_parent(this : IWMDMStorage4*, ppstorage : IWMDMStorage*) : HRESULT
    @lpVtbl.value.get_parent.call(this, ppstorage)
  end
end
struct LibWin32::IWMDMOperation
  def query_interface(this : IWMDMOperation*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMDMOperation*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMDMOperation*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def begin_read(this : IWMDMOperation*) : HRESULT
    @lpVtbl.value.begin_read.call(this)
  end
  def begin_write(this : IWMDMOperation*) : HRESULT
    @lpVtbl.value.begin_write.call(this)
  end
  def get_object_name(this : IWMDMOperation*, pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_object_name.call(this, pwszname, nmaxchars)
  end
  def set_object_name(this : IWMDMOperation*, pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.set_object_name.call(this, pwszname, nmaxchars)
  end
  def get_object_attributes(this : IWMDMOperation*, pdwattributes : UInt32*, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.get_object_attributes.call(this, pdwattributes, pformat)
  end
  def set_object_attributes(this : IWMDMOperation*, dwattributes : UInt32, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.set_object_attributes.call(this, dwattributes, pformat)
  end
  def get_object_total_size(this : IWMDMOperation*, pdwsize : UInt32*, pdwsizehigh : UInt32*) : HRESULT
    @lpVtbl.value.get_object_total_size.call(this, pdwsize, pdwsizehigh)
  end
  def set_object_total_size(this : IWMDMOperation*, dwsize : UInt32, dwsizehigh : UInt32) : HRESULT
    @lpVtbl.value.set_object_total_size.call(this, dwsize, dwsizehigh)
  end
  def transfer_object_data(this : IWMDMOperation*, pdata : UInt8*, pdwsize : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.transfer_object_data.call(this, pdata, pdwsize, abmac)
  end
  def end_(this : IWMDMOperation*, phcompletioncode : HRESULT*, pnewobject : IUnknown) : HRESULT
    @lpVtbl.value.end_.call(this, phcompletioncode, pnewobject)
  end
end
struct LibWin32::IWMDMOperation2
  def query_interface(this : IWMDMOperation2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMDMOperation2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMDMOperation2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def begin_read(this : IWMDMOperation2*) : HRESULT
    @lpVtbl.value.begin_read.call(this)
  end
  def begin_write(this : IWMDMOperation2*) : HRESULT
    @lpVtbl.value.begin_write.call(this)
  end
  def get_object_name(this : IWMDMOperation2*, pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_object_name.call(this, pwszname, nmaxchars)
  end
  def set_object_name(this : IWMDMOperation2*, pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.set_object_name.call(this, pwszname, nmaxchars)
  end
  def get_object_attributes(this : IWMDMOperation2*, pdwattributes : UInt32*, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.get_object_attributes.call(this, pdwattributes, pformat)
  end
  def set_object_attributes(this : IWMDMOperation2*, dwattributes : UInt32, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.set_object_attributes.call(this, dwattributes, pformat)
  end
  def get_object_total_size(this : IWMDMOperation2*, pdwsize : UInt32*, pdwsizehigh : UInt32*) : HRESULT
    @lpVtbl.value.get_object_total_size.call(this, pdwsize, pdwsizehigh)
  end
  def set_object_total_size(this : IWMDMOperation2*, dwsize : UInt32, dwsizehigh : UInt32) : HRESULT
    @lpVtbl.value.set_object_total_size.call(this, dwsize, dwsizehigh)
  end
  def transfer_object_data(this : IWMDMOperation2*, pdata : UInt8*, pdwsize : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.transfer_object_data.call(this, pdata, pdwsize, abmac)
  end
  def end_(this : IWMDMOperation2*, phcompletioncode : HRESULT*, pnewobject : IUnknown) : HRESULT
    @lpVtbl.value.end_.call(this, phcompletioncode, pnewobject)
  end
  def set_object_attributes2(this : IWMDMOperation2*, dwattributes : UInt32, dwattributesex : UInt32, pformat : WAVEFORMATEX*, pvideoformat : VIDEOINFOHEADER*) : HRESULT
    @lpVtbl.value.set_object_attributes2.call(this, dwattributes, dwattributesex, pformat, pvideoformat)
  end
  def get_object_attributes2(this : IWMDMOperation2*, pdwattributes : UInt32*, pdwattributesex : UInt32*, paudioformat : WAVEFORMATEX*, pvideoformat : VIDEOINFOHEADER*) : HRESULT
    @lpVtbl.value.get_object_attributes2.call(this, pdwattributes, pdwattributesex, paudioformat, pvideoformat)
  end
end
struct LibWin32::IWMDMOperation3
  def query_interface(this : IWMDMOperation3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMDMOperation3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMDMOperation3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def begin_read(this : IWMDMOperation3*) : HRESULT
    @lpVtbl.value.begin_read.call(this)
  end
  def begin_write(this : IWMDMOperation3*) : HRESULT
    @lpVtbl.value.begin_write.call(this)
  end
  def get_object_name(this : IWMDMOperation3*, pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_object_name.call(this, pwszname, nmaxchars)
  end
  def set_object_name(this : IWMDMOperation3*, pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.set_object_name.call(this, pwszname, nmaxchars)
  end
  def get_object_attributes(this : IWMDMOperation3*, pdwattributes : UInt32*, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.get_object_attributes.call(this, pdwattributes, pformat)
  end
  def set_object_attributes(this : IWMDMOperation3*, dwattributes : UInt32, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.set_object_attributes.call(this, dwattributes, pformat)
  end
  def get_object_total_size(this : IWMDMOperation3*, pdwsize : UInt32*, pdwsizehigh : UInt32*) : HRESULT
    @lpVtbl.value.get_object_total_size.call(this, pdwsize, pdwsizehigh)
  end
  def set_object_total_size(this : IWMDMOperation3*, dwsize : UInt32, dwsizehigh : UInt32) : HRESULT
    @lpVtbl.value.set_object_total_size.call(this, dwsize, dwsizehigh)
  end
  def transfer_object_data(this : IWMDMOperation3*, pdata : UInt8*, pdwsize : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.transfer_object_data.call(this, pdata, pdwsize, abmac)
  end
  def end_(this : IWMDMOperation3*, phcompletioncode : HRESULT*, pnewobject : IUnknown) : HRESULT
    @lpVtbl.value.end_.call(this, phcompletioncode, pnewobject)
  end
  def transfer_object_data_on_clear_channel(this : IWMDMOperation3*, pdata : UInt8*, pdwsize : UInt32*) : HRESULT
    @lpVtbl.value.transfer_object_data_on_clear_channel.call(this, pdata, pdwsize)
  end
end
struct LibWin32::IWMDMProgress
  def query_interface(this : IWMDMProgress*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMDMProgress*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMDMProgress*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def begin_(this : IWMDMProgress*, dwestimatedticks : UInt32) : HRESULT
    @lpVtbl.value.begin_.call(this, dwestimatedticks)
  end
  def progress(this : IWMDMProgress*, dwtranspiredticks : UInt32) : HRESULT
    @lpVtbl.value.progress.call(this, dwtranspiredticks)
  end
  def end_(this : IWMDMProgress*) : HRESULT
    @lpVtbl.value.end_.call(this)
  end
end
struct LibWin32::IWMDMProgress2
  def query_interface(this : IWMDMProgress2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMDMProgress2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMDMProgress2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def begin_(this : IWMDMProgress2*, dwestimatedticks : UInt32) : HRESULT
    @lpVtbl.value.begin_.call(this, dwestimatedticks)
  end
  def progress(this : IWMDMProgress2*, dwtranspiredticks : UInt32) : HRESULT
    @lpVtbl.value.progress.call(this, dwtranspiredticks)
  end
  def end_(this : IWMDMProgress2*) : HRESULT
    @lpVtbl.value.end_.call(this)
  end
  def end2(this : IWMDMProgress2*, hrcompletioncode : HRESULT) : HRESULT
    @lpVtbl.value.end2.call(this, hrcompletioncode)
  end
end
struct LibWin32::IWMDMProgress3
  def query_interface(this : IWMDMProgress3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMDMProgress3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMDMProgress3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def begin_(this : IWMDMProgress3*, dwestimatedticks : UInt32) : HRESULT
    @lpVtbl.value.begin_.call(this, dwestimatedticks)
  end
  def progress(this : IWMDMProgress3*, dwtranspiredticks : UInt32) : HRESULT
    @lpVtbl.value.progress.call(this, dwtranspiredticks)
  end
  def end_(this : IWMDMProgress3*) : HRESULT
    @lpVtbl.value.end_.call(this)
  end
  def end2(this : IWMDMProgress3*, hrcompletioncode : HRESULT) : HRESULT
    @lpVtbl.value.end2.call(this, hrcompletioncode)
  end
  def begin3(this : IWMDMProgress3*, eventid : Guid, dwestimatedticks : UInt32, pcontext : OPAQUECOMMAND*) : HRESULT
    @lpVtbl.value.begin3.call(this, eventid, dwestimatedticks, pcontext)
  end
  def progress3(this : IWMDMProgress3*, eventid : Guid, dwtranspiredticks : UInt32, pcontext : OPAQUECOMMAND*) : HRESULT
    @lpVtbl.value.progress3.call(this, eventid, dwtranspiredticks, pcontext)
  end
  def end3(this : IWMDMProgress3*, eventid : Guid, hrcompletioncode : HRESULT, pcontext : OPAQUECOMMAND*) : HRESULT
    @lpVtbl.value.end3.call(this, eventid, hrcompletioncode, pcontext)
  end
end
struct LibWin32::IWMDMDevice
  def query_interface(this : IWMDMDevice*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMDMDevice*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMDMDevice*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_name(this : IWMDMDevice*, pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_name.call(this, pwszname, nmaxchars)
  end
  def get_manufacturer(this : IWMDMDevice*, pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_manufacturer.call(this, pwszname, nmaxchars)
  end
  def get_version(this : IWMDMDevice*, pdwversion : UInt32*) : HRESULT
    @lpVtbl.value.get_version.call(this, pdwversion)
  end
  def get_type(this : IWMDMDevice*, pdwtype : UInt32*) : HRESULT
    @lpVtbl.value.get_type.call(this, pdwtype)
  end
  def get_serial_number(this : IWMDMDevice*, pserialnumber : WMDMID*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_serial_number.call(this, pserialnumber, abmac)
  end
  def get_power_source(this : IWMDMDevice*, pdwpowersource : UInt32*, pdwpercentremaining : UInt32*) : HRESULT
    @lpVtbl.value.get_power_source.call(this, pdwpowersource, pdwpercentremaining)
  end
  def get_status(this : IWMDMDevice*, pdwstatus : UInt32*) : HRESULT
    @lpVtbl.value.get_status.call(this, pdwstatus)
  end
  def get_device_icon(this : IWMDMDevice*, hicon : UInt32*) : HRESULT
    @lpVtbl.value.get_device_icon.call(this, hicon)
  end
  def enum_storage(this : IWMDMDevice*, ppenumstorage : IWMDMEnumStorage*) : HRESULT
    @lpVtbl.value.enum_storage.call(this, ppenumstorage)
  end
  def get_format_support(this : IWMDMDevice*, ppformatex : WAVEFORMATEX**, pnformatcount : UInt32*, pppwszmimetype : LibC::LPWSTR**, pnmimetypecount : UInt32*) : HRESULT
    @lpVtbl.value.get_format_support.call(this, ppformatex, pnformatcount, pppwszmimetype, pnmimetypecount)
  end
  def send_opaque_command(this : IWMDMDevice*, pcommand : OPAQUECOMMAND*) : HRESULT
    @lpVtbl.value.send_opaque_command.call(this, pcommand)
  end
end
struct LibWin32::IWMDMDevice2
  def query_interface(this : IWMDMDevice2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMDMDevice2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMDMDevice2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_name(this : IWMDMDevice2*, pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_name.call(this, pwszname, nmaxchars)
  end
  def get_manufacturer(this : IWMDMDevice2*, pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_manufacturer.call(this, pwszname, nmaxchars)
  end
  def get_version(this : IWMDMDevice2*, pdwversion : UInt32*) : HRESULT
    @lpVtbl.value.get_version.call(this, pdwversion)
  end
  def get_type(this : IWMDMDevice2*, pdwtype : UInt32*) : HRESULT
    @lpVtbl.value.get_type.call(this, pdwtype)
  end
  def get_serial_number(this : IWMDMDevice2*, pserialnumber : WMDMID*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_serial_number.call(this, pserialnumber, abmac)
  end
  def get_power_source(this : IWMDMDevice2*, pdwpowersource : UInt32*, pdwpercentremaining : UInt32*) : HRESULT
    @lpVtbl.value.get_power_source.call(this, pdwpowersource, pdwpercentremaining)
  end
  def get_status(this : IWMDMDevice2*, pdwstatus : UInt32*) : HRESULT
    @lpVtbl.value.get_status.call(this, pdwstatus)
  end
  def get_device_icon(this : IWMDMDevice2*, hicon : UInt32*) : HRESULT
    @lpVtbl.value.get_device_icon.call(this, hicon)
  end
  def enum_storage(this : IWMDMDevice2*, ppenumstorage : IWMDMEnumStorage*) : HRESULT
    @lpVtbl.value.enum_storage.call(this, ppenumstorage)
  end
  def get_format_support(this : IWMDMDevice2*, ppformatex : WAVEFORMATEX**, pnformatcount : UInt32*, pppwszmimetype : LibC::LPWSTR**, pnmimetypecount : UInt32*) : HRESULT
    @lpVtbl.value.get_format_support.call(this, ppformatex, pnformatcount, pppwszmimetype, pnmimetypecount)
  end
  def send_opaque_command(this : IWMDMDevice2*, pcommand : OPAQUECOMMAND*) : HRESULT
    @lpVtbl.value.send_opaque_command.call(this, pcommand)
  end
  def get_storage(this : IWMDMDevice2*, pszstoragename : LibC::LPWSTR, ppstorage : IWMDMStorage*) : HRESULT
    @lpVtbl.value.get_storage.call(this, pszstoragename, ppstorage)
  end
  def get_format_support2(this : IWMDMDevice2*, dwflags : UInt32, ppaudioformatex : WAVEFORMATEX**, pnaudioformatcount : UInt32*, ppvideoformatex : VIDEOINFOHEADER**, pnvideoformatcount : UInt32*, ppfiletype : WMFILECAPABILITIES**, pnfiletypecount : UInt32*) : HRESULT
    @lpVtbl.value.get_format_support2.call(this, dwflags, ppaudioformatex, pnaudioformatcount, ppvideoformatex, pnvideoformatcount, ppfiletype, pnfiletypecount)
  end
  def get_specify_property_pages(this : IWMDMDevice2*, ppspecifyproppages : ISpecifyPropertyPages*, pppunknowns : IUnknown**, pcunks : UInt32*) : HRESULT
    @lpVtbl.value.get_specify_property_pages.call(this, ppspecifyproppages, pppunknowns, pcunks)
  end
  def get_canonical_name(this : IWMDMDevice2*, pwszpnpname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_canonical_name.call(this, pwszpnpname, nmaxchars)
  end
end
struct LibWin32::IWMDMDevice3
  def query_interface(this : IWMDMDevice3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMDMDevice3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMDMDevice3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_name(this : IWMDMDevice3*, pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_name.call(this, pwszname, nmaxchars)
  end
  def get_manufacturer(this : IWMDMDevice3*, pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_manufacturer.call(this, pwszname, nmaxchars)
  end
  def get_version(this : IWMDMDevice3*, pdwversion : UInt32*) : HRESULT
    @lpVtbl.value.get_version.call(this, pdwversion)
  end
  def get_type(this : IWMDMDevice3*, pdwtype : UInt32*) : HRESULT
    @lpVtbl.value.get_type.call(this, pdwtype)
  end
  def get_serial_number(this : IWMDMDevice3*, pserialnumber : WMDMID*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_serial_number.call(this, pserialnumber, abmac)
  end
  def get_power_source(this : IWMDMDevice3*, pdwpowersource : UInt32*, pdwpercentremaining : UInt32*) : HRESULT
    @lpVtbl.value.get_power_source.call(this, pdwpowersource, pdwpercentremaining)
  end
  def get_status(this : IWMDMDevice3*, pdwstatus : UInt32*) : HRESULT
    @lpVtbl.value.get_status.call(this, pdwstatus)
  end
  def get_device_icon(this : IWMDMDevice3*, hicon : UInt32*) : HRESULT
    @lpVtbl.value.get_device_icon.call(this, hicon)
  end
  def enum_storage(this : IWMDMDevice3*, ppenumstorage : IWMDMEnumStorage*) : HRESULT
    @lpVtbl.value.enum_storage.call(this, ppenumstorage)
  end
  def get_format_support(this : IWMDMDevice3*, ppformatex : WAVEFORMATEX**, pnformatcount : UInt32*, pppwszmimetype : LibC::LPWSTR**, pnmimetypecount : UInt32*) : HRESULT
    @lpVtbl.value.get_format_support.call(this, ppformatex, pnformatcount, pppwszmimetype, pnmimetypecount)
  end
  def send_opaque_command(this : IWMDMDevice3*, pcommand : OPAQUECOMMAND*) : HRESULT
    @lpVtbl.value.send_opaque_command.call(this, pcommand)
  end
  def get_storage(this : IWMDMDevice3*, pszstoragename : LibC::LPWSTR, ppstorage : IWMDMStorage*) : HRESULT
    @lpVtbl.value.get_storage.call(this, pszstoragename, ppstorage)
  end
  def get_format_support2(this : IWMDMDevice3*, dwflags : UInt32, ppaudioformatex : WAVEFORMATEX**, pnaudioformatcount : UInt32*, ppvideoformatex : VIDEOINFOHEADER**, pnvideoformatcount : UInt32*, ppfiletype : WMFILECAPABILITIES**, pnfiletypecount : UInt32*) : HRESULT
    @lpVtbl.value.get_format_support2.call(this, dwflags, ppaudioformatex, pnaudioformatcount, ppvideoformatex, pnvideoformatcount, ppfiletype, pnfiletypecount)
  end
  def get_specify_property_pages(this : IWMDMDevice3*, ppspecifyproppages : ISpecifyPropertyPages*, pppunknowns : IUnknown**, pcunks : UInt32*) : HRESULT
    @lpVtbl.value.get_specify_property_pages.call(this, ppspecifyproppages, pppunknowns, pcunks)
  end
  def get_canonical_name(this : IWMDMDevice3*, pwszpnpname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_canonical_name.call(this, pwszpnpname, nmaxchars)
  end
  def get_property(this : IWMDMDevice3*, pwszpropname : LibC::LPWSTR, pvalue : PROPVARIANT*) : HRESULT
    @lpVtbl.value.get_property.call(this, pwszpropname, pvalue)
  end
  def set_property(this : IWMDMDevice3*, pwszpropname : LibC::LPWSTR, pvalue : PROPVARIANT*) : HRESULT
    @lpVtbl.value.set_property.call(this, pwszpropname, pvalue)
  end
  def get_format_capability(this : IWMDMDevice3*, format : WMDM_FORMATCODE, pformatsupport : WMDM_FORMAT_CAPABILITY*) : HRESULT
    @lpVtbl.value.get_format_capability.call(this, format, pformatsupport)
  end
  def device_io_control(this : IWMDMDevice3*, dwiocontrolcode : UInt32, lpinbuffer : UInt8*, ninbuffersize : UInt32, lpoutbuffer : UInt8*, pnoutbuffersize : UInt32*) : HRESULT
    @lpVtbl.value.device_io_control.call(this, dwiocontrolcode, lpinbuffer, ninbuffersize, lpoutbuffer, pnoutbuffersize)
  end
  def find_storage(this : IWMDMDevice3*, findscope : WMDM_FIND_SCOPE, pwszuniqueid : LibC::LPWSTR, ppstorage : IWMDMStorage*) : HRESULT
    @lpVtbl.value.find_storage.call(this, findscope, pwszuniqueid, ppstorage)
  end
end
struct LibWin32::IWMDMDeviceSession
  def query_interface(this : IWMDMDeviceSession*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMDMDeviceSession*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMDMDeviceSession*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def begin_session(this : IWMDMDeviceSession*, type : WMDM_SESSION_TYPE, pctx : UInt8*, dwsizectx : UInt32) : HRESULT
    @lpVtbl.value.begin_session.call(this, type, pctx, dwsizectx)
  end
  def end_session(this : IWMDMDeviceSession*, type : WMDM_SESSION_TYPE, pctx : UInt8*, dwsizectx : UInt32) : HRESULT
    @lpVtbl.value.end_session.call(this, type, pctx, dwsizectx)
  end
end
struct LibWin32::IWMDMEnumDevice
  def query_interface(this : IWMDMEnumDevice*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMDMEnumDevice*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMDMEnumDevice*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def next(this : IWMDMEnumDevice*, celt : UInt32, ppdevice : IWMDMDevice*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.call(this, celt, ppdevice, pceltfetched)
  end
  def skip(this : IWMDMEnumDevice*, celt : UInt32, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.skip.call(this, celt, pceltfetched)
  end
  def reset(this : IWMDMEnumDevice*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def clone(this : IWMDMEnumDevice*, ppenumdevice : IWMDMEnumDevice*) : HRESULT
    @lpVtbl.value.clone.call(this, ppenumdevice)
  end
end
struct LibWin32::IWMDMDeviceControl
  def query_interface(this : IWMDMDeviceControl*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMDMDeviceControl*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMDMDeviceControl*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_status(this : IWMDMDeviceControl*, pdwstatus : UInt32*) : HRESULT
    @lpVtbl.value.get_status.call(this, pdwstatus)
  end
  def get_capabilities(this : IWMDMDeviceControl*, pdwcapabilitiesmask : UInt32*) : HRESULT
    @lpVtbl.value.get_capabilities.call(this, pdwcapabilitiesmask)
  end
  def play(this : IWMDMDeviceControl*) : HRESULT
    @lpVtbl.value.play.call(this)
  end
  def record(this : IWMDMDeviceControl*, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.record.call(this, pformat)
  end
  def pause(this : IWMDMDeviceControl*) : HRESULT
    @lpVtbl.value.pause.call(this)
  end
  def resume(this : IWMDMDeviceControl*) : HRESULT
    @lpVtbl.value.resume.call(this)
  end
  def stop(this : IWMDMDeviceControl*) : HRESULT
    @lpVtbl.value.stop.call(this)
  end
  def seek(this : IWMDMDeviceControl*, fumode : UInt32, noffset : Int32) : HRESULT
    @lpVtbl.value.seek.call(this, fumode, noffset)
  end
end
struct LibWin32::IWMDMEnumStorage
  def query_interface(this : IWMDMEnumStorage*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMDMEnumStorage*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMDMEnumStorage*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def next(this : IWMDMEnumStorage*, celt : UInt32, ppstorage : IWMDMStorage*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.call(this, celt, ppstorage, pceltfetched)
  end
  def skip(this : IWMDMEnumStorage*, celt : UInt32, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.skip.call(this, celt, pceltfetched)
  end
  def reset(this : IWMDMEnumStorage*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def clone(this : IWMDMEnumStorage*, ppenumstorage : IWMDMEnumStorage*) : HRESULT
    @lpVtbl.value.clone.call(this, ppenumstorage)
  end
end
struct LibWin32::IWMDMStorageControl
  def query_interface(this : IWMDMStorageControl*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMDMStorageControl*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMDMStorageControl*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def insert(this : IWMDMStorageControl*, fumode : UInt32, pwszfile : LibC::LPWSTR, poperation : IWMDMOperation, pprogress : IWMDMProgress, ppnewobject : IWMDMStorage*) : HRESULT
    @lpVtbl.value.insert.call(this, fumode, pwszfile, poperation, pprogress, ppnewobject)
  end
  def delete(this : IWMDMStorageControl*, fumode : UInt32, pprogress : IWMDMProgress) : HRESULT
    @lpVtbl.value.delete.call(this, fumode, pprogress)
  end
  def rename(this : IWMDMStorageControl*, fumode : UInt32, pwsznewname : LibC::LPWSTR, pprogress : IWMDMProgress) : HRESULT
    @lpVtbl.value.rename.call(this, fumode, pwsznewname, pprogress)
  end
  def read(this : IWMDMStorageControl*, fumode : UInt32, pwszfile : LibC::LPWSTR, pprogress : IWMDMProgress, poperation : IWMDMOperation) : HRESULT
    @lpVtbl.value.read.call(this, fumode, pwszfile, pprogress, poperation)
  end
  def move(this : IWMDMStorageControl*, fumode : UInt32, ptargetobject : IWMDMStorage, pprogress : IWMDMProgress) : HRESULT
    @lpVtbl.value.move.call(this, fumode, ptargetobject, pprogress)
  end
end
struct LibWin32::IWMDMStorageControl2
  def query_interface(this : IWMDMStorageControl2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMDMStorageControl2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMDMStorageControl2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def insert(this : IWMDMStorageControl2*, fumode : UInt32, pwszfile : LibC::LPWSTR, poperation : IWMDMOperation, pprogress : IWMDMProgress, ppnewobject : IWMDMStorage*) : HRESULT
    @lpVtbl.value.insert.call(this, fumode, pwszfile, poperation, pprogress, ppnewobject)
  end
  def delete(this : IWMDMStorageControl2*, fumode : UInt32, pprogress : IWMDMProgress) : HRESULT
    @lpVtbl.value.delete.call(this, fumode, pprogress)
  end
  def rename(this : IWMDMStorageControl2*, fumode : UInt32, pwsznewname : LibC::LPWSTR, pprogress : IWMDMProgress) : HRESULT
    @lpVtbl.value.rename.call(this, fumode, pwsznewname, pprogress)
  end
  def read(this : IWMDMStorageControl2*, fumode : UInt32, pwszfile : LibC::LPWSTR, pprogress : IWMDMProgress, poperation : IWMDMOperation) : HRESULT
    @lpVtbl.value.read.call(this, fumode, pwszfile, pprogress, poperation)
  end
  def move(this : IWMDMStorageControl2*, fumode : UInt32, ptargetobject : IWMDMStorage, pprogress : IWMDMProgress) : HRESULT
    @lpVtbl.value.move.call(this, fumode, ptargetobject, pprogress)
  end
  def insert2(this : IWMDMStorageControl2*, fumode : UInt32, pwszfilesource : LibC::LPWSTR, pwszfiledest : LibC::LPWSTR, poperation : IWMDMOperation, pprogress : IWMDMProgress, punknown : IUnknown, ppnewobject : IWMDMStorage*) : HRESULT
    @lpVtbl.value.insert2.call(this, fumode, pwszfilesource, pwszfiledest, poperation, pprogress, punknown, ppnewobject)
  end
end
struct LibWin32::IWMDMStorageControl3
  def query_interface(this : IWMDMStorageControl3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMDMStorageControl3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMDMStorageControl3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def insert(this : IWMDMStorageControl3*, fumode : UInt32, pwszfile : LibC::LPWSTR, poperation : IWMDMOperation, pprogress : IWMDMProgress, ppnewobject : IWMDMStorage*) : HRESULT
    @lpVtbl.value.insert.call(this, fumode, pwszfile, poperation, pprogress, ppnewobject)
  end
  def delete(this : IWMDMStorageControl3*, fumode : UInt32, pprogress : IWMDMProgress) : HRESULT
    @lpVtbl.value.delete.call(this, fumode, pprogress)
  end
  def rename(this : IWMDMStorageControl3*, fumode : UInt32, pwsznewname : LibC::LPWSTR, pprogress : IWMDMProgress) : HRESULT
    @lpVtbl.value.rename.call(this, fumode, pwsznewname, pprogress)
  end
  def read(this : IWMDMStorageControl3*, fumode : UInt32, pwszfile : LibC::LPWSTR, pprogress : IWMDMProgress, poperation : IWMDMOperation) : HRESULT
    @lpVtbl.value.read.call(this, fumode, pwszfile, pprogress, poperation)
  end
  def move(this : IWMDMStorageControl3*, fumode : UInt32, ptargetobject : IWMDMStorage, pprogress : IWMDMProgress) : HRESULT
    @lpVtbl.value.move.call(this, fumode, ptargetobject, pprogress)
  end
  def insert2(this : IWMDMStorageControl3*, fumode : UInt32, pwszfilesource : LibC::LPWSTR, pwszfiledest : LibC::LPWSTR, poperation : IWMDMOperation, pprogress : IWMDMProgress, punknown : IUnknown, ppnewobject : IWMDMStorage*) : HRESULT
    @lpVtbl.value.insert2.call(this, fumode, pwszfilesource, pwszfiledest, poperation, pprogress, punknown, ppnewobject)
  end
  def insert3(this : IWMDMStorageControl3*, fumode : UInt32, futype : UInt32, pwszfilesource : LibC::LPWSTR, pwszfiledest : LibC::LPWSTR, poperation : IWMDMOperation, pprogress : IWMDMProgress, pmetadata : IWMDMMetaData, punknown : IUnknown, ppnewobject : IWMDMStorage*) : HRESULT
    @lpVtbl.value.insert3.call(this, fumode, futype, pwszfilesource, pwszfiledest, poperation, pprogress, pmetadata, punknown, ppnewobject)
  end
end
struct LibWin32::IWMDMObjectInfo
  def query_interface(this : IWMDMObjectInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMDMObjectInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMDMObjectInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_play_length(this : IWMDMObjectInfo*, pdwlength : UInt32*) : HRESULT
    @lpVtbl.value.get_play_length.call(this, pdwlength)
  end
  def set_play_length(this : IWMDMObjectInfo*, dwlength : UInt32) : HRESULT
    @lpVtbl.value.set_play_length.call(this, dwlength)
  end
  def get_play_offset(this : IWMDMObjectInfo*, pdwoffset : UInt32*) : HRESULT
    @lpVtbl.value.get_play_offset.call(this, pdwoffset)
  end
  def set_play_offset(this : IWMDMObjectInfo*, dwoffset : UInt32) : HRESULT
    @lpVtbl.value.set_play_offset.call(this, dwoffset)
  end
  def get_total_length(this : IWMDMObjectInfo*, pdwlength : UInt32*) : HRESULT
    @lpVtbl.value.get_total_length.call(this, pdwlength)
  end
  def get_last_play_position(this : IWMDMObjectInfo*, pdwlastpos : UInt32*) : HRESULT
    @lpVtbl.value.get_last_play_position.call(this, pdwlastpos)
  end
  def get_longest_play_position(this : IWMDMObjectInfo*, pdwlongestpos : UInt32*) : HRESULT
    @lpVtbl.value.get_longest_play_position.call(this, pdwlongestpos)
  end
end
struct LibWin32::IWMDMRevoked
  def query_interface(this : IWMDMRevoked*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMDMRevoked*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMDMRevoked*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_revocation_url(this : IWMDMRevoked*, ppwszrevocationurl : LibC::LPWSTR*, pdwbufferlen : UInt32*, pdwrevokedbitflag : UInt32*) : HRESULT
    @lpVtbl.value.get_revocation_url.call(this, ppwszrevocationurl, pdwbufferlen, pdwrevokedbitflag)
  end
end
struct LibWin32::IWMDMNotification
  def query_interface(this : IWMDMNotification*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMDMNotification*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMDMNotification*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def wmdm_message(this : IWMDMNotification*, dwmessagetype : UInt32, pwszcanonicalname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.wmdm_message.call(this, dwmessagetype, pwszcanonicalname)
  end
end
struct LibWin32::IMDServiceProvider
  def query_interface(this : IMDServiceProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMDServiceProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMDServiceProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_device_count(this : IMDServiceProvider*, pdwcount : UInt32*) : HRESULT
    @lpVtbl.value.get_device_count.call(this, pdwcount)
  end
  def enum_devices(this : IMDServiceProvider*, ppenumdevice : IMDSPEnumDevice*) : HRESULT
    @lpVtbl.value.enum_devices.call(this, ppenumdevice)
  end
end
struct LibWin32::IMDServiceProvider2
  def query_interface(this : IMDServiceProvider2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMDServiceProvider2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMDServiceProvider2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_device_count(this : IMDServiceProvider2*, pdwcount : UInt32*) : HRESULT
    @lpVtbl.value.get_device_count.call(this, pdwcount)
  end
  def enum_devices(this : IMDServiceProvider2*, ppenumdevice : IMDSPEnumDevice*) : HRESULT
    @lpVtbl.value.enum_devices.call(this, ppenumdevice)
  end
  def create_device(this : IMDServiceProvider2*, pwszdevicepath : LibC::LPWSTR, pdwcount : UInt32*, pppdevicearray : IMDSPDevice**) : HRESULT
    @lpVtbl.value.create_device.call(this, pwszdevicepath, pdwcount, pppdevicearray)
  end
end
struct LibWin32::IMDServiceProvider3
  def query_interface(this : IMDServiceProvider3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMDServiceProvider3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMDServiceProvider3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_device_count(this : IMDServiceProvider3*, pdwcount : UInt32*) : HRESULT
    @lpVtbl.value.get_device_count.call(this, pdwcount)
  end
  def enum_devices(this : IMDServiceProvider3*, ppenumdevice : IMDSPEnumDevice*) : HRESULT
    @lpVtbl.value.enum_devices.call(this, ppenumdevice)
  end
  def create_device(this : IMDServiceProvider3*, pwszdevicepath : LibC::LPWSTR, pdwcount : UInt32*, pppdevicearray : IMDSPDevice**) : HRESULT
    @lpVtbl.value.create_device.call(this, pwszdevicepath, pdwcount, pppdevicearray)
  end
  def set_device_enum_preference(this : IMDServiceProvider3*, dwenumpref : UInt32) : HRESULT
    @lpVtbl.value.set_device_enum_preference.call(this, dwenumpref)
  end
end
struct LibWin32::IMDSPEnumDevice
  def query_interface(this : IMDSPEnumDevice*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMDSPEnumDevice*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMDSPEnumDevice*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def next(this : IMDSPEnumDevice*, celt : UInt32, ppdevice : IMDSPDevice*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.call(this, celt, ppdevice, pceltfetched)
  end
  def skip(this : IMDSPEnumDevice*, celt : UInt32, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.skip.call(this, celt, pceltfetched)
  end
  def reset(this : IMDSPEnumDevice*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def clone(this : IMDSPEnumDevice*, ppenumdevice : IMDSPEnumDevice*) : HRESULT
    @lpVtbl.value.clone.call(this, ppenumdevice)
  end
end
struct LibWin32::IMDSPDevice
  def query_interface(this : IMDSPDevice*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMDSPDevice*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMDSPDevice*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_name(this : IMDSPDevice*, pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_name.call(this, pwszname, nmaxchars)
  end
  def get_manufacturer(this : IMDSPDevice*, pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_manufacturer.call(this, pwszname, nmaxchars)
  end
  def get_version(this : IMDSPDevice*, pdwversion : UInt32*) : HRESULT
    @lpVtbl.value.get_version.call(this, pdwversion)
  end
  def get_type(this : IMDSPDevice*, pdwtype : UInt32*) : HRESULT
    @lpVtbl.value.get_type.call(this, pdwtype)
  end
  def get_serial_number(this : IMDSPDevice*, pserialnumber : WMDMID*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_serial_number.call(this, pserialnumber, abmac)
  end
  def get_power_source(this : IMDSPDevice*, pdwpowersource : UInt32*, pdwpercentremaining : UInt32*) : HRESULT
    @lpVtbl.value.get_power_source.call(this, pdwpowersource, pdwpercentremaining)
  end
  def get_status(this : IMDSPDevice*, pdwstatus : UInt32*) : HRESULT
    @lpVtbl.value.get_status.call(this, pdwstatus)
  end
  def get_device_icon(this : IMDSPDevice*, hicon : UInt32*) : HRESULT
    @lpVtbl.value.get_device_icon.call(this, hicon)
  end
  def enum_storage(this : IMDSPDevice*, ppenumstorage : IMDSPEnumStorage*) : HRESULT
    @lpVtbl.value.enum_storage.call(this, ppenumstorage)
  end
  def get_format_support(this : IMDSPDevice*, pformatex : WAVEFORMATEX**, pnformatcount : UInt32*, pppwszmimetype : LibC::LPWSTR**, pnmimetypecount : UInt32*) : HRESULT
    @lpVtbl.value.get_format_support.call(this, pformatex, pnformatcount, pppwszmimetype, pnmimetypecount)
  end
  def send_opaque_command(this : IMDSPDevice*, pcommand : OPAQUECOMMAND*) : HRESULT
    @lpVtbl.value.send_opaque_command.call(this, pcommand)
  end
end
struct LibWin32::IMDSPDevice2
  def query_interface(this : IMDSPDevice2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMDSPDevice2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMDSPDevice2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_name(this : IMDSPDevice2*, pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_name.call(this, pwszname, nmaxchars)
  end
  def get_manufacturer(this : IMDSPDevice2*, pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_manufacturer.call(this, pwszname, nmaxchars)
  end
  def get_version(this : IMDSPDevice2*, pdwversion : UInt32*) : HRESULT
    @lpVtbl.value.get_version.call(this, pdwversion)
  end
  def get_type(this : IMDSPDevice2*, pdwtype : UInt32*) : HRESULT
    @lpVtbl.value.get_type.call(this, pdwtype)
  end
  def get_serial_number(this : IMDSPDevice2*, pserialnumber : WMDMID*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_serial_number.call(this, pserialnumber, abmac)
  end
  def get_power_source(this : IMDSPDevice2*, pdwpowersource : UInt32*, pdwpercentremaining : UInt32*) : HRESULT
    @lpVtbl.value.get_power_source.call(this, pdwpowersource, pdwpercentremaining)
  end
  def get_status(this : IMDSPDevice2*, pdwstatus : UInt32*) : HRESULT
    @lpVtbl.value.get_status.call(this, pdwstatus)
  end
  def get_device_icon(this : IMDSPDevice2*, hicon : UInt32*) : HRESULT
    @lpVtbl.value.get_device_icon.call(this, hicon)
  end
  def enum_storage(this : IMDSPDevice2*, ppenumstorage : IMDSPEnumStorage*) : HRESULT
    @lpVtbl.value.enum_storage.call(this, ppenumstorage)
  end
  def get_format_support(this : IMDSPDevice2*, pformatex : WAVEFORMATEX**, pnformatcount : UInt32*, pppwszmimetype : LibC::LPWSTR**, pnmimetypecount : UInt32*) : HRESULT
    @lpVtbl.value.get_format_support.call(this, pformatex, pnformatcount, pppwszmimetype, pnmimetypecount)
  end
  def send_opaque_command(this : IMDSPDevice2*, pcommand : OPAQUECOMMAND*) : HRESULT
    @lpVtbl.value.send_opaque_command.call(this, pcommand)
  end
  def get_storage(this : IMDSPDevice2*, pszstoragename : LibC::LPWSTR, ppstorage : IMDSPStorage*) : HRESULT
    @lpVtbl.value.get_storage.call(this, pszstoragename, ppstorage)
  end
  def get_format_support2(this : IMDSPDevice2*, dwflags : UInt32, ppaudioformatex : WAVEFORMATEX**, pnaudioformatcount : UInt32*, ppvideoformatex : VIDEOINFOHEADER**, pnvideoformatcount : UInt32*, ppfiletype : WMFILECAPABILITIES**, pnfiletypecount : UInt32*) : HRESULT
    @lpVtbl.value.get_format_support2.call(this, dwflags, ppaudioformatex, pnaudioformatcount, ppvideoformatex, pnvideoformatcount, ppfiletype, pnfiletypecount)
  end
  def get_specify_property_pages(this : IMDSPDevice2*, ppspecifyproppages : ISpecifyPropertyPages*, pppunknowns : IUnknown**, pcunks : UInt32*) : HRESULT
    @lpVtbl.value.get_specify_property_pages.call(this, ppspecifyproppages, pppunknowns, pcunks)
  end
  def get_canonical_name(this : IMDSPDevice2*, pwszpnpname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_canonical_name.call(this, pwszpnpname, nmaxchars)
  end
end
struct LibWin32::IMDSPDevice3
  def query_interface(this : IMDSPDevice3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMDSPDevice3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMDSPDevice3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_name(this : IMDSPDevice3*, pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_name.call(this, pwszname, nmaxchars)
  end
  def get_manufacturer(this : IMDSPDevice3*, pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_manufacturer.call(this, pwszname, nmaxchars)
  end
  def get_version(this : IMDSPDevice3*, pdwversion : UInt32*) : HRESULT
    @lpVtbl.value.get_version.call(this, pdwversion)
  end
  def get_type(this : IMDSPDevice3*, pdwtype : UInt32*) : HRESULT
    @lpVtbl.value.get_type.call(this, pdwtype)
  end
  def get_serial_number(this : IMDSPDevice3*, pserialnumber : WMDMID*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_serial_number.call(this, pserialnumber, abmac)
  end
  def get_power_source(this : IMDSPDevice3*, pdwpowersource : UInt32*, pdwpercentremaining : UInt32*) : HRESULT
    @lpVtbl.value.get_power_source.call(this, pdwpowersource, pdwpercentremaining)
  end
  def get_status(this : IMDSPDevice3*, pdwstatus : UInt32*) : HRESULT
    @lpVtbl.value.get_status.call(this, pdwstatus)
  end
  def get_device_icon(this : IMDSPDevice3*, hicon : UInt32*) : HRESULT
    @lpVtbl.value.get_device_icon.call(this, hicon)
  end
  def enum_storage(this : IMDSPDevice3*, ppenumstorage : IMDSPEnumStorage*) : HRESULT
    @lpVtbl.value.enum_storage.call(this, ppenumstorage)
  end
  def get_format_support(this : IMDSPDevice3*, pformatex : WAVEFORMATEX**, pnformatcount : UInt32*, pppwszmimetype : LibC::LPWSTR**, pnmimetypecount : UInt32*) : HRESULT
    @lpVtbl.value.get_format_support.call(this, pformatex, pnformatcount, pppwszmimetype, pnmimetypecount)
  end
  def send_opaque_command(this : IMDSPDevice3*, pcommand : OPAQUECOMMAND*) : HRESULT
    @lpVtbl.value.send_opaque_command.call(this, pcommand)
  end
  def get_storage(this : IMDSPDevice3*, pszstoragename : LibC::LPWSTR, ppstorage : IMDSPStorage*) : HRESULT
    @lpVtbl.value.get_storage.call(this, pszstoragename, ppstorage)
  end
  def get_format_support2(this : IMDSPDevice3*, dwflags : UInt32, ppaudioformatex : WAVEFORMATEX**, pnaudioformatcount : UInt32*, ppvideoformatex : VIDEOINFOHEADER**, pnvideoformatcount : UInt32*, ppfiletype : WMFILECAPABILITIES**, pnfiletypecount : UInt32*) : HRESULT
    @lpVtbl.value.get_format_support2.call(this, dwflags, ppaudioformatex, pnaudioformatcount, ppvideoformatex, pnvideoformatcount, ppfiletype, pnfiletypecount)
  end
  def get_specify_property_pages(this : IMDSPDevice3*, ppspecifyproppages : ISpecifyPropertyPages*, pppunknowns : IUnknown**, pcunks : UInt32*) : HRESULT
    @lpVtbl.value.get_specify_property_pages.call(this, ppspecifyproppages, pppunknowns, pcunks)
  end
  def get_canonical_name(this : IMDSPDevice3*, pwszpnpname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_canonical_name.call(this, pwszpnpname, nmaxchars)
  end
  def get_property(this : IMDSPDevice3*, pwszpropname : LibC::LPWSTR, pvalue : PROPVARIANT*) : HRESULT
    @lpVtbl.value.get_property.call(this, pwszpropname, pvalue)
  end
  def set_property(this : IMDSPDevice3*, pwszpropname : LibC::LPWSTR, pvalue : PROPVARIANT*) : HRESULT
    @lpVtbl.value.set_property.call(this, pwszpropname, pvalue)
  end
  def get_format_capability(this : IMDSPDevice3*, format : WMDM_FORMATCODE, pformatsupport : WMDM_FORMAT_CAPABILITY*) : HRESULT
    @lpVtbl.value.get_format_capability.call(this, format, pformatsupport)
  end
  def device_io_control(this : IMDSPDevice3*, dwiocontrolcode : UInt32, lpinbuffer : UInt8*, ninbuffersize : UInt32, lpoutbuffer : UInt8*, pnoutbuffersize : UInt32*) : HRESULT
    @lpVtbl.value.device_io_control.call(this, dwiocontrolcode, lpinbuffer, ninbuffersize, lpoutbuffer, pnoutbuffersize)
  end
  def find_storage(this : IMDSPDevice3*, findscope : WMDM_FIND_SCOPE, pwszuniqueid : LibC::LPWSTR, ppstorage : IMDSPStorage*) : HRESULT
    @lpVtbl.value.find_storage.call(this, findscope, pwszuniqueid, ppstorage)
  end
end
struct LibWin32::IMDSPDeviceControl
  def query_interface(this : IMDSPDeviceControl*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMDSPDeviceControl*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMDSPDeviceControl*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_dc_status(this : IMDSPDeviceControl*, pdwstatus : UInt32*) : HRESULT
    @lpVtbl.value.get_dc_status.call(this, pdwstatus)
  end
  def get_capabilities(this : IMDSPDeviceControl*, pdwcapabilitiesmask : UInt32*) : HRESULT
    @lpVtbl.value.get_capabilities.call(this, pdwcapabilitiesmask)
  end
  def play(this : IMDSPDeviceControl*) : HRESULT
    @lpVtbl.value.play.call(this)
  end
  def record(this : IMDSPDeviceControl*, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.record.call(this, pformat)
  end
  def pause(this : IMDSPDeviceControl*) : HRESULT
    @lpVtbl.value.pause.call(this)
  end
  def resume(this : IMDSPDeviceControl*) : HRESULT
    @lpVtbl.value.resume.call(this)
  end
  def stop(this : IMDSPDeviceControl*) : HRESULT
    @lpVtbl.value.stop.call(this)
  end
  def seek(this : IMDSPDeviceControl*, fumode : UInt32, noffset : Int32) : HRESULT
    @lpVtbl.value.seek.call(this, fumode, noffset)
  end
end
struct LibWin32::IMDSPEnumStorage
  def query_interface(this : IMDSPEnumStorage*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMDSPEnumStorage*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMDSPEnumStorage*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def next(this : IMDSPEnumStorage*, celt : UInt32, ppstorage : IMDSPStorage*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.call(this, celt, ppstorage, pceltfetched)
  end
  def skip(this : IMDSPEnumStorage*, celt : UInt32, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.skip.call(this, celt, pceltfetched)
  end
  def reset(this : IMDSPEnumStorage*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def clone(this : IMDSPEnumStorage*, ppenumstorage : IMDSPEnumStorage*) : HRESULT
    @lpVtbl.value.clone.call(this, ppenumstorage)
  end
end
struct LibWin32::IMDSPStorage
  def query_interface(this : IMDSPStorage*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMDSPStorage*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMDSPStorage*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_attributes(this : IMDSPStorage*, dwattributes : UInt32, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.set_attributes.call(this, dwattributes, pformat)
  end
  def get_storage_globals(this : IMDSPStorage*, ppstorageglobals : IMDSPStorageGlobals*) : HRESULT
    @lpVtbl.value.get_storage_globals.call(this, ppstorageglobals)
  end
  def get_attributes(this : IMDSPStorage*, pdwattributes : UInt32*, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.get_attributes.call(this, pdwattributes, pformat)
  end
  def get_name(this : IMDSPStorage*, pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_name.call(this, pwszname, nmaxchars)
  end
  def get_date(this : IMDSPStorage*, pdatetimeutc : WMDMDATETIME*) : HRESULT
    @lpVtbl.value.get_date.call(this, pdatetimeutc)
  end
  def get_size(this : IMDSPStorage*, pdwsizelow : UInt32*, pdwsizehigh : UInt32*) : HRESULT
    @lpVtbl.value.get_size.call(this, pdwsizelow, pdwsizehigh)
  end
  def get_rights(this : IMDSPStorage*, pprights : WMDMRIGHTS**, pnrightscount : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_rights.call(this, pprights, pnrightscount, abmac)
  end
  def create_storage(this : IMDSPStorage*, dwattributes : UInt32, pformat : WAVEFORMATEX*, pwszname : LibC::LPWSTR, ppnewstorage : IMDSPStorage*) : HRESULT
    @lpVtbl.value.create_storage.call(this, dwattributes, pformat, pwszname, ppnewstorage)
  end
  def enum_storage(this : IMDSPStorage*, ppenumstorage : IMDSPEnumStorage*) : HRESULT
    @lpVtbl.value.enum_storage.call(this, ppenumstorage)
  end
  def send_opaque_command(this : IMDSPStorage*, pcommand : OPAQUECOMMAND*) : HRESULT
    @lpVtbl.value.send_opaque_command.call(this, pcommand)
  end
end
struct LibWin32::IMDSPStorage2
  def query_interface(this : IMDSPStorage2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMDSPStorage2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMDSPStorage2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_attributes(this : IMDSPStorage2*, dwattributes : UInt32, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.set_attributes.call(this, dwattributes, pformat)
  end
  def get_storage_globals(this : IMDSPStorage2*, ppstorageglobals : IMDSPStorageGlobals*) : HRESULT
    @lpVtbl.value.get_storage_globals.call(this, ppstorageglobals)
  end
  def get_attributes(this : IMDSPStorage2*, pdwattributes : UInt32*, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.get_attributes.call(this, pdwattributes, pformat)
  end
  def get_name(this : IMDSPStorage2*, pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_name.call(this, pwszname, nmaxchars)
  end
  def get_date(this : IMDSPStorage2*, pdatetimeutc : WMDMDATETIME*) : HRESULT
    @lpVtbl.value.get_date.call(this, pdatetimeutc)
  end
  def get_size(this : IMDSPStorage2*, pdwsizelow : UInt32*, pdwsizehigh : UInt32*) : HRESULT
    @lpVtbl.value.get_size.call(this, pdwsizelow, pdwsizehigh)
  end
  def get_rights(this : IMDSPStorage2*, pprights : WMDMRIGHTS**, pnrightscount : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_rights.call(this, pprights, pnrightscount, abmac)
  end
  def create_storage(this : IMDSPStorage2*, dwattributes : UInt32, pformat : WAVEFORMATEX*, pwszname : LibC::LPWSTR, ppnewstorage : IMDSPStorage*) : HRESULT
    @lpVtbl.value.create_storage.call(this, dwattributes, pformat, pwszname, ppnewstorage)
  end
  def enum_storage(this : IMDSPStorage2*, ppenumstorage : IMDSPEnumStorage*) : HRESULT
    @lpVtbl.value.enum_storage.call(this, ppenumstorage)
  end
  def send_opaque_command(this : IMDSPStorage2*, pcommand : OPAQUECOMMAND*) : HRESULT
    @lpVtbl.value.send_opaque_command.call(this, pcommand)
  end
  def get_storage(this : IMDSPStorage2*, pszstoragename : LibC::LPWSTR, ppstorage : IMDSPStorage*) : HRESULT
    @lpVtbl.value.get_storage.call(this, pszstoragename, ppstorage)
  end
  def create_storage2(this : IMDSPStorage2*, dwattributes : UInt32, dwattributesex : UInt32, paudioformat : WAVEFORMATEX*, pvideoformat : VIDEOINFOHEADER*, pwszname : LibC::LPWSTR, qwfilesize : UInt64, ppnewstorage : IMDSPStorage*) : HRESULT
    @lpVtbl.value.create_storage2.call(this, dwattributes, dwattributesex, paudioformat, pvideoformat, pwszname, qwfilesize, ppnewstorage)
  end
  def set_attributes2(this : IMDSPStorage2*, dwattributes : UInt32, dwattributesex : UInt32, paudioformat : WAVEFORMATEX*, pvideoformat : VIDEOINFOHEADER*) : HRESULT
    @lpVtbl.value.set_attributes2.call(this, dwattributes, dwattributesex, paudioformat, pvideoformat)
  end
  def get_attributes2(this : IMDSPStorage2*, pdwattributes : UInt32*, pdwattributesex : UInt32*, paudioformat : WAVEFORMATEX*, pvideoformat : VIDEOINFOHEADER*) : HRESULT
    @lpVtbl.value.get_attributes2.call(this, pdwattributes, pdwattributesex, paudioformat, pvideoformat)
  end
end
struct LibWin32::IMDSPStorage3
  def query_interface(this : IMDSPStorage3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMDSPStorage3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMDSPStorage3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_attributes(this : IMDSPStorage3*, dwattributes : UInt32, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.set_attributes.call(this, dwattributes, pformat)
  end
  def get_storage_globals(this : IMDSPStorage3*, ppstorageglobals : IMDSPStorageGlobals*) : HRESULT
    @lpVtbl.value.get_storage_globals.call(this, ppstorageglobals)
  end
  def get_attributes(this : IMDSPStorage3*, pdwattributes : UInt32*, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.get_attributes.call(this, pdwattributes, pformat)
  end
  def get_name(this : IMDSPStorage3*, pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_name.call(this, pwszname, nmaxchars)
  end
  def get_date(this : IMDSPStorage3*, pdatetimeutc : WMDMDATETIME*) : HRESULT
    @lpVtbl.value.get_date.call(this, pdatetimeutc)
  end
  def get_size(this : IMDSPStorage3*, pdwsizelow : UInt32*, pdwsizehigh : UInt32*) : HRESULT
    @lpVtbl.value.get_size.call(this, pdwsizelow, pdwsizehigh)
  end
  def get_rights(this : IMDSPStorage3*, pprights : WMDMRIGHTS**, pnrightscount : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_rights.call(this, pprights, pnrightscount, abmac)
  end
  def create_storage(this : IMDSPStorage3*, dwattributes : UInt32, pformat : WAVEFORMATEX*, pwszname : LibC::LPWSTR, ppnewstorage : IMDSPStorage*) : HRESULT
    @lpVtbl.value.create_storage.call(this, dwattributes, pformat, pwszname, ppnewstorage)
  end
  def enum_storage(this : IMDSPStorage3*, ppenumstorage : IMDSPEnumStorage*) : HRESULT
    @lpVtbl.value.enum_storage.call(this, ppenumstorage)
  end
  def send_opaque_command(this : IMDSPStorage3*, pcommand : OPAQUECOMMAND*) : HRESULT
    @lpVtbl.value.send_opaque_command.call(this, pcommand)
  end
  def get_storage(this : IMDSPStorage3*, pszstoragename : LibC::LPWSTR, ppstorage : IMDSPStorage*) : HRESULT
    @lpVtbl.value.get_storage.call(this, pszstoragename, ppstorage)
  end
  def create_storage2(this : IMDSPStorage3*, dwattributes : UInt32, dwattributesex : UInt32, paudioformat : WAVEFORMATEX*, pvideoformat : VIDEOINFOHEADER*, pwszname : LibC::LPWSTR, qwfilesize : UInt64, ppnewstorage : IMDSPStorage*) : HRESULT
    @lpVtbl.value.create_storage2.call(this, dwattributes, dwattributesex, paudioformat, pvideoformat, pwszname, qwfilesize, ppnewstorage)
  end
  def set_attributes2(this : IMDSPStorage3*, dwattributes : UInt32, dwattributesex : UInt32, paudioformat : WAVEFORMATEX*, pvideoformat : VIDEOINFOHEADER*) : HRESULT
    @lpVtbl.value.set_attributes2.call(this, dwattributes, dwattributesex, paudioformat, pvideoformat)
  end
  def get_attributes2(this : IMDSPStorage3*, pdwattributes : UInt32*, pdwattributesex : UInt32*, paudioformat : WAVEFORMATEX*, pvideoformat : VIDEOINFOHEADER*) : HRESULT
    @lpVtbl.value.get_attributes2.call(this, pdwattributes, pdwattributesex, paudioformat, pvideoformat)
  end
  def get_metadata(this : IMDSPStorage3*, pmetadata : IWMDMMetaData) : HRESULT
    @lpVtbl.value.get_metadata.call(this, pmetadata)
  end
  def set_metadata(this : IMDSPStorage3*, pmetadata : IWMDMMetaData) : HRESULT
    @lpVtbl.value.set_metadata.call(this, pmetadata)
  end
end
struct LibWin32::IMDSPStorage4
  def query_interface(this : IMDSPStorage4*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMDSPStorage4*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMDSPStorage4*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_attributes(this : IMDSPStorage4*, dwattributes : UInt32, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.set_attributes.call(this, dwattributes, pformat)
  end
  def get_storage_globals(this : IMDSPStorage4*, ppstorageglobals : IMDSPStorageGlobals*) : HRESULT
    @lpVtbl.value.get_storage_globals.call(this, ppstorageglobals)
  end
  def get_attributes(this : IMDSPStorage4*, pdwattributes : UInt32*, pformat : WAVEFORMATEX*) : HRESULT
    @lpVtbl.value.get_attributes.call(this, pdwattributes, pformat)
  end
  def get_name(this : IMDSPStorage4*, pwszname : Char*, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_name.call(this, pwszname, nmaxchars)
  end
  def get_date(this : IMDSPStorage4*, pdatetimeutc : WMDMDATETIME*) : HRESULT
    @lpVtbl.value.get_date.call(this, pdatetimeutc)
  end
  def get_size(this : IMDSPStorage4*, pdwsizelow : UInt32*, pdwsizehigh : UInt32*) : HRESULT
    @lpVtbl.value.get_size.call(this, pdwsizelow, pdwsizehigh)
  end
  def get_rights(this : IMDSPStorage4*, pprights : WMDMRIGHTS**, pnrightscount : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_rights.call(this, pprights, pnrightscount, abmac)
  end
  def create_storage(this : IMDSPStorage4*, dwattributes : UInt32, pformat : WAVEFORMATEX*, pwszname : LibC::LPWSTR, ppnewstorage : IMDSPStorage*) : HRESULT
    @lpVtbl.value.create_storage.call(this, dwattributes, pformat, pwszname, ppnewstorage)
  end
  def enum_storage(this : IMDSPStorage4*, ppenumstorage : IMDSPEnumStorage*) : HRESULT
    @lpVtbl.value.enum_storage.call(this, ppenumstorage)
  end
  def send_opaque_command(this : IMDSPStorage4*, pcommand : OPAQUECOMMAND*) : HRESULT
    @lpVtbl.value.send_opaque_command.call(this, pcommand)
  end
  def get_storage(this : IMDSPStorage4*, pszstoragename : LibC::LPWSTR, ppstorage : IMDSPStorage*) : HRESULT
    @lpVtbl.value.get_storage.call(this, pszstoragename, ppstorage)
  end
  def create_storage2(this : IMDSPStorage4*, dwattributes : UInt32, dwattributesex : UInt32, paudioformat : WAVEFORMATEX*, pvideoformat : VIDEOINFOHEADER*, pwszname : LibC::LPWSTR, qwfilesize : UInt64, ppnewstorage : IMDSPStorage*) : HRESULT
    @lpVtbl.value.create_storage2.call(this, dwattributes, dwattributesex, paudioformat, pvideoformat, pwszname, qwfilesize, ppnewstorage)
  end
  def set_attributes2(this : IMDSPStorage4*, dwattributes : UInt32, dwattributesex : UInt32, paudioformat : WAVEFORMATEX*, pvideoformat : VIDEOINFOHEADER*) : HRESULT
    @lpVtbl.value.set_attributes2.call(this, dwattributes, dwattributesex, paudioformat, pvideoformat)
  end
  def get_attributes2(this : IMDSPStorage4*, pdwattributes : UInt32*, pdwattributesex : UInt32*, paudioformat : WAVEFORMATEX*, pvideoformat : VIDEOINFOHEADER*) : HRESULT
    @lpVtbl.value.get_attributes2.call(this, pdwattributes, pdwattributesex, paudioformat, pvideoformat)
  end
  def get_metadata(this : IMDSPStorage4*, pmetadata : IWMDMMetaData) : HRESULT
    @lpVtbl.value.get_metadata.call(this, pmetadata)
  end
  def set_metadata(this : IMDSPStorage4*, pmetadata : IWMDMMetaData) : HRESULT
    @lpVtbl.value.set_metadata.call(this, pmetadata)
  end
  def set_references(this : IMDSPStorage4*, dwrefs : UInt32, ppispstorage : IMDSPStorage*) : HRESULT
    @lpVtbl.value.set_references.call(this, dwrefs, ppispstorage)
  end
  def get_references(this : IMDSPStorage4*, pdwrefs : UInt32*, pppispstorage : IMDSPStorage**) : HRESULT
    @lpVtbl.value.get_references.call(this, pdwrefs, pppispstorage)
  end
  def create_storage_with_metadata(this : IMDSPStorage4*, dwattributes : UInt32, pwszname : LibC::LPWSTR, pmetadata : IWMDMMetaData, qwfilesize : UInt64, ppnewstorage : IMDSPStorage*) : HRESULT
    @lpVtbl.value.create_storage_with_metadata.call(this, dwattributes, pwszname, pmetadata, qwfilesize, ppnewstorage)
  end
  def get_specified_metadata(this : IMDSPStorage4*, cproperties : UInt32, ppwszpropnames : LibC::LPWSTR*, pmetadata : IWMDMMetaData) : HRESULT
    @lpVtbl.value.get_specified_metadata.call(this, cproperties, ppwszpropnames, pmetadata)
  end
  def find_storage(this : IMDSPStorage4*, findscope : WMDM_FIND_SCOPE, pwszuniqueid : LibC::LPWSTR, ppstorage : IMDSPStorage*) : HRESULT
    @lpVtbl.value.find_storage.call(this, findscope, pwszuniqueid, ppstorage)
  end
  def get_parent(this : IMDSPStorage4*, ppstorage : IMDSPStorage*) : HRESULT
    @lpVtbl.value.get_parent.call(this, ppstorage)
  end
end
struct LibWin32::IMDSPStorageGlobals
  def query_interface(this : IMDSPStorageGlobals*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMDSPStorageGlobals*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMDSPStorageGlobals*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_capabilities(this : IMDSPStorageGlobals*, pdwcapabilities : UInt32*) : HRESULT
    @lpVtbl.value.get_capabilities.call(this, pdwcapabilities)
  end
  def get_serial_number(this : IMDSPStorageGlobals*, pserialnum : WMDMID*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_serial_number.call(this, pserialnum, abmac)
  end
  def get_total_size(this : IMDSPStorageGlobals*, pdwtotalsizelow : UInt32*, pdwtotalsizehigh : UInt32*) : HRESULT
    @lpVtbl.value.get_total_size.call(this, pdwtotalsizelow, pdwtotalsizehigh)
  end
  def get_total_free(this : IMDSPStorageGlobals*, pdwfreelow : UInt32*, pdwfreehigh : UInt32*) : HRESULT
    @lpVtbl.value.get_total_free.call(this, pdwfreelow, pdwfreehigh)
  end
  def get_total_bad(this : IMDSPStorageGlobals*, pdwbadlow : UInt32*, pdwbadhigh : UInt32*) : HRESULT
    @lpVtbl.value.get_total_bad.call(this, pdwbadlow, pdwbadhigh)
  end
  def get_status(this : IMDSPStorageGlobals*, pdwstatus : UInt32*) : HRESULT
    @lpVtbl.value.get_status.call(this, pdwstatus)
  end
  def initialize(this : IMDSPStorageGlobals*, fumode : UInt32, pprogress : IWMDMProgress) : HRESULT
    @lpVtbl.value.initialize.call(this, fumode, pprogress)
  end
  def get_device(this : IMDSPStorageGlobals*, ppdevice : IMDSPDevice*) : HRESULT
    @lpVtbl.value.get_device.call(this, ppdevice)
  end
  def get_root_storage(this : IMDSPStorageGlobals*, pproot : IMDSPStorage*) : HRESULT
    @lpVtbl.value.get_root_storage.call(this, pproot)
  end
end
struct LibWin32::IMDSPObjectInfo
  def query_interface(this : IMDSPObjectInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMDSPObjectInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMDSPObjectInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_play_length(this : IMDSPObjectInfo*, pdwlength : UInt32*) : HRESULT
    @lpVtbl.value.get_play_length.call(this, pdwlength)
  end
  def set_play_length(this : IMDSPObjectInfo*, dwlength : UInt32) : HRESULT
    @lpVtbl.value.set_play_length.call(this, dwlength)
  end
  def get_play_offset(this : IMDSPObjectInfo*, pdwoffset : UInt32*) : HRESULT
    @lpVtbl.value.get_play_offset.call(this, pdwoffset)
  end
  def set_play_offset(this : IMDSPObjectInfo*, dwoffset : UInt32) : HRESULT
    @lpVtbl.value.set_play_offset.call(this, dwoffset)
  end
  def get_total_length(this : IMDSPObjectInfo*, pdwlength : UInt32*) : HRESULT
    @lpVtbl.value.get_total_length.call(this, pdwlength)
  end
  def get_last_play_position(this : IMDSPObjectInfo*, pdwlastpos : UInt32*) : HRESULT
    @lpVtbl.value.get_last_play_position.call(this, pdwlastpos)
  end
  def get_longest_play_position(this : IMDSPObjectInfo*, pdwlongestpos : UInt32*) : HRESULT
    @lpVtbl.value.get_longest_play_position.call(this, pdwlongestpos)
  end
end
struct LibWin32::IMDSPObject
  def query_interface(this : IMDSPObject*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMDSPObject*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMDSPObject*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def open(this : IMDSPObject*, fumode : UInt32) : HRESULT
    @lpVtbl.value.open.call(this, fumode)
  end
  def read(this : IMDSPObject*, pdata : UInt8*, pdwsize : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.read.call(this, pdata, pdwsize, abmac)
  end
  def write(this : IMDSPObject*, pdata : UInt8*, pdwsize : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.write.call(this, pdata, pdwsize, abmac)
  end
  def delete(this : IMDSPObject*, fumode : UInt32, pprogress : IWMDMProgress) : HRESULT
    @lpVtbl.value.delete.call(this, fumode, pprogress)
  end
  def seek(this : IMDSPObject*, fuflags : UInt32, dwoffset : UInt32) : HRESULT
    @lpVtbl.value.seek.call(this, fuflags, dwoffset)
  end
  def rename(this : IMDSPObject*, pwsznewname : LibC::LPWSTR, pprogress : IWMDMProgress) : HRESULT
    @lpVtbl.value.rename.call(this, pwsznewname, pprogress)
  end
  def move(this : IMDSPObject*, fumode : UInt32, pprogress : IWMDMProgress, ptarget : IMDSPStorage) : HRESULT
    @lpVtbl.value.move.call(this, fumode, pprogress, ptarget)
  end
  def close(this : IMDSPObject*) : HRESULT
    @lpVtbl.value.close.call(this)
  end
end
struct LibWin32::IMDSPObject2
  def query_interface(this : IMDSPObject2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMDSPObject2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMDSPObject2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def open(this : IMDSPObject2*, fumode : UInt32) : HRESULT
    @lpVtbl.value.open.call(this, fumode)
  end
  def read(this : IMDSPObject2*, pdata : UInt8*, pdwsize : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.read.call(this, pdata, pdwsize, abmac)
  end
  def write(this : IMDSPObject2*, pdata : UInt8*, pdwsize : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.write.call(this, pdata, pdwsize, abmac)
  end
  def delete(this : IMDSPObject2*, fumode : UInt32, pprogress : IWMDMProgress) : HRESULT
    @lpVtbl.value.delete.call(this, fumode, pprogress)
  end
  def seek(this : IMDSPObject2*, fuflags : UInt32, dwoffset : UInt32) : HRESULT
    @lpVtbl.value.seek.call(this, fuflags, dwoffset)
  end
  def rename(this : IMDSPObject2*, pwsznewname : LibC::LPWSTR, pprogress : IWMDMProgress) : HRESULT
    @lpVtbl.value.rename.call(this, pwsznewname, pprogress)
  end
  def move(this : IMDSPObject2*, fumode : UInt32, pprogress : IWMDMProgress, ptarget : IMDSPStorage) : HRESULT
    @lpVtbl.value.move.call(this, fumode, pprogress, ptarget)
  end
  def close(this : IMDSPObject2*) : HRESULT
    @lpVtbl.value.close.call(this)
  end
  def read_on_clear_channel(this : IMDSPObject2*, pdata : UInt8*, pdwsize : UInt32*) : HRESULT
    @lpVtbl.value.read_on_clear_channel.call(this, pdata, pdwsize)
  end
  def write_on_clear_channel(this : IMDSPObject2*, pdata : UInt8*, pdwsize : UInt32*) : HRESULT
    @lpVtbl.value.write_on_clear_channel.call(this, pdata, pdwsize)
  end
end
struct LibWin32::IMDSPDirectTransfer
  def query_interface(this : IMDSPDirectTransfer*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMDSPDirectTransfer*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMDSPDirectTransfer*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def transfer_to_device(this : IMDSPDirectTransfer*, pwszsourcefilepath : LibC::LPWSTR, psourceoperation : IWMDMOperation, fuflags : UInt32, pwszdestinationname : LibC::LPWSTR, psourcemetadata : IWMDMMetaData, ptransferprogress : IWMDMProgress, ppnewobject : IMDSPStorage*) : HRESULT
    @lpVtbl.value.transfer_to_device.call(this, pwszsourcefilepath, psourceoperation, fuflags, pwszdestinationname, psourcemetadata, ptransferprogress, ppnewobject)
  end
end
struct LibWin32::IMDSPRevoked
  def query_interface(this : IMDSPRevoked*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMDSPRevoked*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMDSPRevoked*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_revocation_url(this : IMDSPRevoked*, ppwszrevocationurl : LibC::LPWSTR*, pdwbufferlen : UInt32*) : HRESULT
    @lpVtbl.value.get_revocation_url.call(this, ppwszrevocationurl, pdwbufferlen)
  end
end
struct LibWin32::ISCPSecureAuthenticate
  def query_interface(this : ISCPSecureAuthenticate*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISCPSecureAuthenticate*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISCPSecureAuthenticate*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_secure_query(this : ISCPSecureAuthenticate*, ppsecurequery : ISCPSecureQuery*) : HRESULT
    @lpVtbl.value.get_secure_query.call(this, ppsecurequery)
  end
end
struct LibWin32::ISCPSecureAuthenticate2
  def query_interface(this : ISCPSecureAuthenticate2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISCPSecureAuthenticate2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISCPSecureAuthenticate2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_secure_query(this : ISCPSecureAuthenticate2*, ppsecurequery : ISCPSecureQuery*) : HRESULT
    @lpVtbl.value.get_secure_query.call(this, ppsecurequery)
  end
  def get_scp_session(this : ISCPSecureAuthenticate2*, ppscpsession : ISCPSession*) : HRESULT
    @lpVtbl.value.get_scp_session.call(this, ppscpsession)
  end
end
struct LibWin32::ISCPSecureQuery
  def query_interface(this : ISCPSecureQuery*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISCPSecureQuery*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISCPSecureQuery*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_data_demands(this : ISCPSecureQuery*, pfuflags : UInt32*, pdwminrightsdata : UInt32*, pdwminexaminedata : UInt32*, pdwmindecidedata : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_data_demands.call(this, pfuflags, pdwminrightsdata, pdwminexaminedata, pdwmindecidedata, abmac)
  end
  def examine_data(this : ISCPSecureQuery*, fuflags : UInt32, pwszextension : LibC::LPWSTR, pdata : UInt8*, dwsize : UInt32, abmac : UInt8*) : HRESULT
    @lpVtbl.value.examine_data.call(this, fuflags, pwszextension, pdata, dwsize, abmac)
  end
  def make_decision(this : ISCPSecureQuery*, fuflags : UInt32, pdata : UInt8*, dwsize : UInt32, dwappsec : UInt32, pbspsessionkey : UInt8*, dwsessionkeylen : UInt32, pstorageglobals : IMDSPStorageGlobals, ppexchange : ISCPSecureExchange*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.make_decision.call(this, fuflags, pdata, dwsize, dwappsec, pbspsessionkey, dwsessionkeylen, pstorageglobals, ppexchange, abmac)
  end
  def get_rights(this : ISCPSecureQuery*, pdata : UInt8*, dwsize : UInt32, pbspsessionkey : UInt8*, dwsessionkeylen : UInt32, pstgglobals : IMDSPStorageGlobals, pprights : WMDMRIGHTS**, pnrightscount : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_rights.call(this, pdata, dwsize, pbspsessionkey, dwsessionkeylen, pstgglobals, pprights, pnrightscount, abmac)
  end
end
struct LibWin32::ISCPSecureQuery2
  def query_interface(this : ISCPSecureQuery2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISCPSecureQuery2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISCPSecureQuery2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_data_demands(this : ISCPSecureQuery2*, pfuflags : UInt32*, pdwminrightsdata : UInt32*, pdwminexaminedata : UInt32*, pdwmindecidedata : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_data_demands.call(this, pfuflags, pdwminrightsdata, pdwminexaminedata, pdwmindecidedata, abmac)
  end
  def examine_data(this : ISCPSecureQuery2*, fuflags : UInt32, pwszextension : LibC::LPWSTR, pdata : UInt8*, dwsize : UInt32, abmac : UInt8*) : HRESULT
    @lpVtbl.value.examine_data.call(this, fuflags, pwszextension, pdata, dwsize, abmac)
  end
  def make_decision(this : ISCPSecureQuery2*, fuflags : UInt32, pdata : UInt8*, dwsize : UInt32, dwappsec : UInt32, pbspsessionkey : UInt8*, dwsessionkeylen : UInt32, pstorageglobals : IMDSPStorageGlobals, ppexchange : ISCPSecureExchange*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.make_decision.call(this, fuflags, pdata, dwsize, dwappsec, pbspsessionkey, dwsessionkeylen, pstorageglobals, ppexchange, abmac)
  end
  def get_rights(this : ISCPSecureQuery2*, pdata : UInt8*, dwsize : UInt32, pbspsessionkey : UInt8*, dwsessionkeylen : UInt32, pstgglobals : IMDSPStorageGlobals, pprights : WMDMRIGHTS**, pnrightscount : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_rights.call(this, pdata, dwsize, pbspsessionkey, dwsessionkeylen, pstgglobals, pprights, pnrightscount, abmac)
  end
  def make_decision2(this : ISCPSecureQuery2*, fuflags : UInt32, pdata : UInt8*, dwsize : UInt32, dwappsec : UInt32, pbspsessionkey : UInt8*, dwsessionkeylen : UInt32, pstorageglobals : IMDSPStorageGlobals, pappcertapp : UInt8*, dwappcertapplen : UInt32, pappcertsp : UInt8*, dwappcertsplen : UInt32, pszrevocationurl : LibC::LPWSTR*, pdwrevocationurllen : UInt32*, pdwrevocationbitflag : UInt32*, pqwfilesize : UInt64*, punknown : IUnknown, ppexchange : ISCPSecureExchange*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.make_decision2.call(this, fuflags, pdata, dwsize, dwappsec, pbspsessionkey, dwsessionkeylen, pstorageglobals, pappcertapp, dwappcertapplen, pappcertsp, dwappcertsplen, pszrevocationurl, pdwrevocationurllen, pdwrevocationbitflag, pqwfilesize, punknown, ppexchange, abmac)
  end
end
struct LibWin32::ISCPSecureExchange
  def query_interface(this : ISCPSecureExchange*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISCPSecureExchange*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISCPSecureExchange*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def transfer_container_data(this : ISCPSecureExchange*, pdata : UInt8*, dwsize : UInt32, pfureadyflags : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.transfer_container_data.call(this, pdata, dwsize, pfureadyflags, abmac)
  end
  def object_data(this : ISCPSecureExchange*, pdata : UInt8*, pdwsize : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.object_data.call(this, pdata, pdwsize, abmac)
  end
  def transfer_complete(this : ISCPSecureExchange*) : HRESULT
    @lpVtbl.value.transfer_complete.call(this)
  end
end
struct LibWin32::ISCPSecureExchange2
  def query_interface(this : ISCPSecureExchange2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISCPSecureExchange2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISCPSecureExchange2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def transfer_container_data(this : ISCPSecureExchange2*, pdata : UInt8*, dwsize : UInt32, pfureadyflags : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.transfer_container_data.call(this, pdata, dwsize, pfureadyflags, abmac)
  end
  def object_data(this : ISCPSecureExchange2*, pdata : UInt8*, pdwsize : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.object_data.call(this, pdata, pdwsize, abmac)
  end
  def transfer_complete(this : ISCPSecureExchange2*) : HRESULT
    @lpVtbl.value.transfer_complete.call(this)
  end
  def transfer_container_data2(this : ISCPSecureExchange2*, pdata : UInt8*, dwsize : UInt32, pprogresscallback : IWMDMProgress3, pfureadyflags : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.transfer_container_data2.call(this, pdata, dwsize, pprogresscallback, pfureadyflags, abmac)
  end
end
struct LibWin32::ISCPSecureExchange3
  def query_interface(this : ISCPSecureExchange3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISCPSecureExchange3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISCPSecureExchange3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def transfer_container_data(this : ISCPSecureExchange3*, pdata : UInt8*, dwsize : UInt32, pfureadyflags : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.transfer_container_data.call(this, pdata, dwsize, pfureadyflags, abmac)
  end
  def object_data(this : ISCPSecureExchange3*, pdata : UInt8*, pdwsize : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.object_data.call(this, pdata, pdwsize, abmac)
  end
  def transfer_complete(this : ISCPSecureExchange3*) : HRESULT
    @lpVtbl.value.transfer_complete.call(this)
  end
  def transfer_container_data2(this : ISCPSecureExchange3*, pdata : UInt8*, dwsize : UInt32, pprogresscallback : IWMDMProgress3, pfureadyflags : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.transfer_container_data2.call(this, pdata, dwsize, pprogresscallback, pfureadyflags, abmac)
  end
  def transfer_container_data_on_clear_channel(this : ISCPSecureExchange3*, pdevice : IMDSPDevice, pdata : UInt8*, dwsize : UInt32, pprogresscallback : IWMDMProgress3, pfureadyflags : UInt32*) : HRESULT
    @lpVtbl.value.transfer_container_data_on_clear_channel.call(this, pdevice, pdata, dwsize, pprogresscallback, pfureadyflags)
  end
  def get_object_data_on_clear_channel(this : ISCPSecureExchange3*, pdevice : IMDSPDevice, pdata : UInt8*, pdwsize : UInt32*) : HRESULT
    @lpVtbl.value.get_object_data_on_clear_channel.call(this, pdevice, pdata, pdwsize)
  end
  def transfer_complete_for_device(this : ISCPSecureExchange3*, pdevice : IMDSPDevice) : HRESULT
    @lpVtbl.value.transfer_complete_for_device.call(this, pdevice)
  end
end
struct LibWin32::ISCPSession
  def query_interface(this : ISCPSession*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISCPSession*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISCPSession*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def begin_session(this : ISCPSession*, pidevice : IMDSPDevice, pctx : UInt8*, dwsizectx : UInt32) : HRESULT
    @lpVtbl.value.begin_session.call(this, pidevice, pctx, dwsizectx)
  end
  def end_session(this : ISCPSession*, pctx : UInt8*, dwsizectx : UInt32) : HRESULT
    @lpVtbl.value.end_session.call(this, pctx, dwsizectx)
  end
  def get_secure_query(this : ISCPSession*, ppsecurequery : ISCPSecureQuery*) : HRESULT
    @lpVtbl.value.get_secure_query.call(this, ppsecurequery)
  end
end
struct LibWin32::ISCPSecureQuery3
  def query_interface(this : ISCPSecureQuery3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISCPSecureQuery3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISCPSecureQuery3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_data_demands(this : ISCPSecureQuery3*, pfuflags : UInt32*, pdwminrightsdata : UInt32*, pdwminexaminedata : UInt32*, pdwmindecidedata : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_data_demands.call(this, pfuflags, pdwminrightsdata, pdwminexaminedata, pdwmindecidedata, abmac)
  end
  def examine_data(this : ISCPSecureQuery3*, fuflags : UInt32, pwszextension : LibC::LPWSTR, pdata : UInt8*, dwsize : UInt32, abmac : UInt8*) : HRESULT
    @lpVtbl.value.examine_data.call(this, fuflags, pwszextension, pdata, dwsize, abmac)
  end
  def make_decision(this : ISCPSecureQuery3*, fuflags : UInt32, pdata : UInt8*, dwsize : UInt32, dwappsec : UInt32, pbspsessionkey : UInt8*, dwsessionkeylen : UInt32, pstorageglobals : IMDSPStorageGlobals, ppexchange : ISCPSecureExchange*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.make_decision.call(this, fuflags, pdata, dwsize, dwappsec, pbspsessionkey, dwsessionkeylen, pstorageglobals, ppexchange, abmac)
  end
  def get_rights(this : ISCPSecureQuery3*, pdata : UInt8*, dwsize : UInt32, pbspsessionkey : UInt8*, dwsessionkeylen : UInt32, pstgglobals : IMDSPStorageGlobals, pprights : WMDMRIGHTS**, pnrightscount : UInt32*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.get_rights.call(this, pdata, dwsize, pbspsessionkey, dwsessionkeylen, pstgglobals, pprights, pnrightscount, abmac)
  end
  def make_decision2(this : ISCPSecureQuery3*, fuflags : UInt32, pdata : UInt8*, dwsize : UInt32, dwappsec : UInt32, pbspsessionkey : UInt8*, dwsessionkeylen : UInt32, pstorageglobals : IMDSPStorageGlobals, pappcertapp : UInt8*, dwappcertapplen : UInt32, pappcertsp : UInt8*, dwappcertsplen : UInt32, pszrevocationurl : LibC::LPWSTR*, pdwrevocationurllen : UInt32*, pdwrevocationbitflag : UInt32*, pqwfilesize : UInt64*, punknown : IUnknown, ppexchange : ISCPSecureExchange*, abmac : UInt8*) : HRESULT
    @lpVtbl.value.make_decision2.call(this, fuflags, pdata, dwsize, dwappsec, pbspsessionkey, dwsessionkeylen, pstorageglobals, pappcertapp, dwappcertapplen, pappcertsp, dwappcertsplen, pszrevocationurl, pdwrevocationurllen, pdwrevocationbitflag, pqwfilesize, punknown, ppexchange, abmac)
  end
  def get_rights_on_clear_channel(this : ISCPSecureQuery3*, pdata : UInt8*, dwsize : UInt32, pbspsessionkey : UInt8*, dwsessionkeylen : UInt32, pstgglobals : IMDSPStorageGlobals, pprogresscallback : IWMDMProgress3, pprights : WMDMRIGHTS**, pnrightscount : UInt32*) : HRESULT
    @lpVtbl.value.get_rights_on_clear_channel.call(this, pdata, dwsize, pbspsessionkey, dwsessionkeylen, pstgglobals, pprogresscallback, pprights, pnrightscount)
  end
  def make_decision_on_clear_channel(this : ISCPSecureQuery3*, fuflags : UInt32, pdata : UInt8*, dwsize : UInt32, dwappsec : UInt32, pbspsessionkey : UInt8*, dwsessionkeylen : UInt32, pstorageglobals : IMDSPStorageGlobals, pprogresscallback : IWMDMProgress3, pappcertapp : UInt8*, dwappcertapplen : UInt32, pappcertsp : UInt8*, dwappcertsplen : UInt32, pszrevocationurl : LibC::LPWSTR*, pdwrevocationurllen : UInt32*, pdwrevocationbitflag : UInt32*, pqwfilesize : UInt64*, punknown : IUnknown, ppexchange : ISCPSecureExchange*) : HRESULT
    @lpVtbl.value.make_decision_on_clear_channel.call(this, fuflags, pdata, dwsize, dwappsec, pbspsessionkey, dwsessionkeylen, pstorageglobals, pprogresscallback, pappcertapp, dwappcertapplen, pappcertsp, dwappcertsplen, pszrevocationurl, pdwrevocationurllen, pdwrevocationbitflag, pqwfilesize, punknown, ppexchange)
  end
end
struct LibWin32::IComponentAuthenticate
  def query_interface(this : IComponentAuthenticate*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IComponentAuthenticate*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IComponentAuthenticate*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def sac_auth(this : IComponentAuthenticate*, dwprotocolid : UInt32, dwpass : UInt32, pbdatain : UInt8*, dwdatainlen : UInt32, ppbdataout : UInt8**, pdwdataoutlen : UInt32*) : HRESULT
    @lpVtbl.value.sac_auth.call(this, dwprotocolid, dwpass, pbdatain, dwdatainlen, ppbdataout, pdwdataoutlen)
  end
  def sac_get_protocols(this : IComponentAuthenticate*, ppdwprotocols : UInt32**, pdwprotocolcount : UInt32*) : HRESULT
    @lpVtbl.value.sac_get_protocols.call(this, ppdwprotocols, pdwprotocolcount)
  end
end
struct LibWin32::IWMDMLogger
  def query_interface(this : IWMDMLogger*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMDMLogger*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMDMLogger*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def is_enabled(this : IWMDMLogger*, pfenabled : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_enabled.call(this, pfenabled)
  end
  def enable(this : IWMDMLogger*, fenable : LibC::BOOL) : HRESULT
    @lpVtbl.value.enable.call(this, fenable)
  end
  def get_log_file_name(this : IWMDMLogger*, pszfilename : PSTR, nmaxchars : UInt32) : HRESULT
    @lpVtbl.value.get_log_file_name.call(this, pszfilename, nmaxchars)
  end
  def set_log_file_name(this : IWMDMLogger*, pszfilename : PSTR) : HRESULT
    @lpVtbl.value.set_log_file_name.call(this, pszfilename)
  end
  def log_string(this : IWMDMLogger*, dwflags : UInt32, pszsrcname : PSTR, pszlog : PSTR) : HRESULT
    @lpVtbl.value.log_string.call(this, dwflags, pszsrcname, pszlog)
  end
  def log_dword(this : IWMDMLogger*, dwflags : UInt32, pszsrcname : PSTR, pszlogformat : PSTR, dwlog : UInt32) : HRESULT
    @lpVtbl.value.log_dword.call(this, dwflags, pszsrcname, pszlogformat, dwlog)
  end
  def reset(this : IWMDMLogger*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def get_size_params(this : IWMDMLogger*, pdwmaxsize : UInt32*, pdwshrinktosize : UInt32*) : HRESULT
    @lpVtbl.value.get_size_params.call(this, pdwmaxsize, pdwshrinktosize)
  end
  def set_size_params(this : IWMDMLogger*, dwmaxsize : UInt32, dwshrinktosize : UInt32) : HRESULT
    @lpVtbl.value.set_size_params.call(this, dwmaxsize, dwshrinktosize)
  end
end
