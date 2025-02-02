require "./../foundation.cr"
require "./../system/com/structured_storage.cr"
require "./../system/com.cr"
require "./audio.cr"
require "./media_foundation.cr"
require "./../system/ole.cr"

module Win32cr::Media::DeviceManager
  extend self
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

  enum WMDM_TAG_DATATYPE
    WMDM_TYPE_DWORD = 0_i32
    WMDM_TYPE_STRING = 1_i32
    WMDM_TYPE_BINARY = 2_i32
    WMDM_TYPE_BOOL = 3_i32
    WMDM_TYPE_QWORD = 4_i32
    WMDM_TYPE_WORD = 5_i32
    WMDM_TYPE_GUID = 6_i32
    WMDM_TYPE_DATE = 7_i32
  end
  enum WMDM_SESSION_TYPE
    WMDM_SESSION_NONE = 0_i32
    WMDM_SESSION_TRANSFER_TO_DEVICE = 1_i32
    WMDM_SESSION_TRANSFER_FROM_DEVICE = 16_i32
    WMDM_SESSION_DELETE = 256_i32
    WMDM_SESSION_CUSTOM = 4096_i32
  end
  enum WMDM_STORAGE_ENUM_MODE
    ENUM_MODE_RAW = 0_i32
    ENUM_MODE_USE_DEVICE_PREF = 1_i32
    ENUM_MODE_METADATA_VIEWS = 2_i32
  end
  enum WMDM_FORMATCODE
    WMDM_FORMATCODE_NOTUSED = 0_i32
    WMDM_FORMATCODE_ALLIMAGES = -1_i32
    WMDM_FORMATCODE_UNDEFINED = 12288_i32
    WMDM_FORMATCODE_ASSOCIATION = 12289_i32
    WMDM_FORMATCODE_SCRIPT = 12290_i32
    WMDM_FORMATCODE_EXECUTABLE = 12291_i32
    WMDM_FORMATCODE_TEXT = 12292_i32
    WMDM_FORMATCODE_HTML = 12293_i32
    WMDM_FORMATCODE_DPOF = 12294_i32
    WMDM_FORMATCODE_AIFF = 12295_i32
    WMDM_FORMATCODE_WAVE = 12296_i32
    WMDM_FORMATCODE_MP3 = 12297_i32
    WMDM_FORMATCODE_AVI = 12298_i32
    WMDM_FORMATCODE_MPEG = 12299_i32
    WMDM_FORMATCODE_ASF = 12300_i32
    WMDM_FORMATCODE_RESERVED_FIRST = 12301_i32
    WMDM_FORMATCODE_RESERVED_LAST = 14335_i32
    WMDM_FORMATCODE_IMAGE_UNDEFINED = 14336_i32
    WMDM_FORMATCODE_IMAGE_EXIF = 14337_i32
    WMDM_FORMATCODE_IMAGE_TIFFEP = 14338_i32
    WMDM_FORMATCODE_IMAGE_FLASHPIX = 14339_i32
    WMDM_FORMATCODE_IMAGE_BMP = 14340_i32
    WMDM_FORMATCODE_IMAGE_CIFF = 14341_i32
    WMDM_FORMATCODE_IMAGE_GIF = 14343_i32
    WMDM_FORMATCODE_IMAGE_JFIF = 14344_i32
    WMDM_FORMATCODE_IMAGE_PCD = 14345_i32
    WMDM_FORMATCODE_IMAGE_PICT = 14346_i32
    WMDM_FORMATCODE_IMAGE_PNG = 14347_i32
    WMDM_FORMATCODE_IMAGE_TIFF = 14349_i32
    WMDM_FORMATCODE_IMAGE_TIFFIT = 14350_i32
    WMDM_FORMATCODE_IMAGE_JP2 = 14351_i32
    WMDM_FORMATCODE_IMAGE_JPX = 14352_i32
    WMDM_FORMATCODE_IMAGE_RESERVED_FIRST = 14353_i32
    WMDM_FORMATCODE_IMAGE_RESERVED_LAST = 16383_i32
    WMDM_FORMATCODE_UNDEFINEDFIRMWARE = 47106_i32
    WMDM_FORMATCODE_WBMP = 47107_i32
    WMDM_FORMATCODE_JPEGXR = 47108_i32
    WMDM_FORMATCODE_WINDOWSIMAGEFORMAT = 47233_i32
    WMDM_FORMATCODE_UNDEFINEDAUDIO = 47360_i32
    WMDM_FORMATCODE_WMA = 47361_i32
    WMDM_FORMATCODE_OGG = 47362_i32
    WMDM_FORMATCODE_AAC = 47363_i32
    WMDM_FORMATCODE_AUDIBLE = 47364_i32
    WMDM_FORMATCODE_FLAC = 47366_i32
    WMDM_FORMATCODE_QCELP = 47367_i32
    WMDM_FORMATCODE_AMR = 47368_i32
    WMDM_FORMATCODE_UNDEFINEDVIDEO = 47488_i32
    WMDM_FORMATCODE_WMV = 47489_i32
    WMDM_FORMATCODE_MP4 = 47490_i32
    WMDM_FORMATCODE_MP2 = 47491_i32
    WMDM_FORMATCODE_3GP = 47492_i32
    WMDM_FORMATCODE_3G2 = 47493_i32
    WMDM_FORMATCODE_AVCHD = 47494_i32
    WMDM_FORMATCODE_ATSCTS = 47495_i32
    WMDM_FORMATCODE_DVBTS = 47496_i32
    WMDM_FORMATCODE_MKV = 47497_i32
    WMDM_FORMATCODE_MKA = 47498_i32
    WMDM_FORMATCODE_MK3D = 47499_i32
    WMDM_FORMATCODE_UNDEFINEDCOLLECTION = 47616_i32
    WMDM_FORMATCODE_ABSTRACTMULTIMEDIAALBUM = 47617_i32
    WMDM_FORMATCODE_ABSTRACTIMAGEALBUM = 47618_i32
    WMDM_FORMATCODE_ABSTRACTAUDIOALBUM = 47619_i32
    WMDM_FORMATCODE_ABSTRACTVIDEOALBUM = 47620_i32
    WMDM_FORMATCODE_ABSTRACTAUDIOVIDEOPLAYLIST = 47621_i32
    WMDM_FORMATCODE_ABSTRACTCONTACTGROUP = 47622_i32
    WMDM_FORMATCODE_ABSTRACTMESSAGEFOLDER = 47623_i32
    WMDM_FORMATCODE_ABSTRACTCHAPTEREDPRODUCTION = 47624_i32
    WMDM_FORMATCODE_MEDIA_CAST = 47627_i32
    WMDM_FORMATCODE_WPLPLAYLIST = 47632_i32
    WMDM_FORMATCODE_M3UPLAYLIST = 47633_i32
    WMDM_FORMATCODE_MPLPLAYLIST = 47634_i32
    WMDM_FORMATCODE_ASXPLAYLIST = 47635_i32
    WMDM_FORMATCODE_PLSPLAYLIST = 47636_i32
    WMDM_FORMATCODE_UNDEFINEDDOCUMENT = 47744_i32
    WMDM_FORMATCODE_ABSTRACTDOCUMENT = 47745_i32
    WMDM_FORMATCODE_XMLDOCUMENT = 47746_i32
    WMDM_FORMATCODE_MICROSOFTWORDDOCUMENT = 47747_i32
    WMDM_FORMATCODE_MHTCOMPILEDHTMLDOCUMENT = 47748_i32
    WMDM_FORMATCODE_MICROSOFTEXCELSPREADSHEET = 47749_i32
    WMDM_FORMATCODE_MICROSOFTPOWERPOINTDOCUMENT = 47750_i32
    WMDM_FORMATCODE_UNDEFINEDMESSAGE = 47872_i32
    WMDM_FORMATCODE_ABSTRACTMESSAGE = 47873_i32
    WMDM_FORMATCODE_UNDEFINEDCONTACT = 48000_i32
    WMDM_FORMATCODE_ABSTRACTCONTACT = 48001_i32
    WMDM_FORMATCODE_VCARD2 = 48002_i32
    WMDM_FORMATCODE_VCARD3 = 48003_i32
    WMDM_FORMATCODE_UNDEFINEDCALENDARITEM = 48640_i32
    WMDM_FORMATCODE_ABSTRACTCALENDARITEM = 48641_i32
    WMDM_FORMATCODE_VCALENDAR1 = 48642_i32
    WMDM_FORMATCODE_VCALENDAR2 = 48643_i32
    WMDM_FORMATCODE_UNDEFINEDWINDOWSEXECUTABLE = 48768_i32
    WMDM_FORMATCODE_M4A = 1297101889_i32
    WMDM_FORMATCODE_3GPA = 860311617_i32
    WMDM_FORMATCODE_3G2A = 860303937_i32
    WMDM_FORMATCODE_SECTION = 48770_i32
  end
  enum WMDM_ENUM_PROP_VALID_VALUES_FORM
    WMDM_ENUM_PROP_VALID_VALUES_ANY = 0_i32
    WMDM_ENUM_PROP_VALID_VALUES_RANGE = 1_i32
    WMDM_ENUM_PROP_VALID_VALUES_ENUM = 2_i32
  end
  enum WMDM_FIND_SCOPE
    WMDM_FIND_SCOPE_GLOBAL = 0_i32
    WMDM_FIND_SCOPE_IMMEDIATE_CHILDREN = 1_i32
  end
  enum WMDMMessage
    WMDM_MSG_DEVICE_ARRIVAL = 0_i32
    WMDM_MSG_DEVICE_REMOVAL = 1_i32
    WMDM_MSG_MEDIA_ARRIVAL = 2_i32
    WMDM_MSG_MEDIA_REMOVAL = 3_i32
  end

  @[Extern]
  struct MACINFO__
    property fUsed : Win32cr::Foundation::BOOL
    property abMacState : UInt8[36]
    def initialize(@fUsed : Win32cr::Foundation::BOOL, @abMacState : UInt8[36])
    end
  end

  @[Extern]
  struct WMFILECAPABILITIES
    property pwszMimeType : Win32cr::Foundation::PWSTR
    property dwReserved : UInt32
    def initialize(@pwszMimeType : Win32cr::Foundation::PWSTR, @dwReserved : UInt32)
    end
  end

  @[Extern]
  struct OPAQUECOMMAND
    property guidCommand : LibC::GUID
    property dwDataLen : UInt32
    property pData : UInt8*
    property abMAC : UInt8[20]
    def initialize(@guidCommand : LibC::GUID, @dwDataLen : UInt32, @pData : UInt8*, @abMAC : UInt8[20])
    end
  end

  @[Extern]
  struct WMDMID
    property cbSize : UInt32
    property dwVendorID : UInt32
    property pID : UInt8[128]
    property serial_number_length : UInt32
    def initialize(@cbSize : UInt32, @dwVendorID : UInt32, @pID : UInt8[128], @serial_number_length : UInt32)
    end
  end

  @[Extern]
  struct WMDMDATETIME
    property wYear : UInt16
    property wMonth : UInt16
    property wDay : UInt16
    property wHour : UInt16
    property wMinute : UInt16
    property wSecond : UInt16
    def initialize(@wYear : UInt16, @wMonth : UInt16, @wDay : UInt16, @wHour : UInt16, @wMinute : UInt16, @wSecond : UInt16)
    end
  end

  @[Extern]
  struct WMDMRIGHTS
    property cbSize : UInt32
    property dwContentType : UInt32
    property fuFlags : UInt32
    property fuRights : UInt32
    property dwAppSec : UInt32
    property dwPlaybackCount : UInt32
    property expiration_date : Win32cr::Media::DeviceManager::WMDMDATETIME
    def initialize(@cbSize : UInt32, @dwContentType : UInt32, @fuFlags : UInt32, @fuRights : UInt32, @dwAppSec : UInt32, @dwPlaybackCount : UInt32, @expiration_date : Win32cr::Media::DeviceManager::WMDMDATETIME)
    end
  end

  @[Extern]
  struct WMDMMetadataView
    property pwszViewName : Win32cr::Foundation::PWSTR
    property nDepth : UInt32
    property ppwszTags : UInt16**
    def initialize(@pwszViewName : Win32cr::Foundation::PWSTR, @nDepth : UInt32, @ppwszTags : UInt16**)
    end
  end

  @[Extern]
  struct WMDM_PROP_VALUES_RANGE
    property rangeMin : Win32cr::System::Com::StructuredStorage::PROPVARIANT
    property rangeMax : Win32cr::System::Com::StructuredStorage::PROPVARIANT
    property rangeStep : Win32cr::System::Com::StructuredStorage::PROPVARIANT
    def initialize(@rangeMin : Win32cr::System::Com::StructuredStorage::PROPVARIANT, @rangeMax : Win32cr::System::Com::StructuredStorage::PROPVARIANT, @rangeStep : Win32cr::System::Com::StructuredStorage::PROPVARIANT)
    end
  end

  @[Extern]
  struct WMDM_PROP_VALUES_ENUM
    property cEnumValues : UInt32
    property pValues : Win32cr::System::Com::StructuredStorage::PROPVARIANT*
    def initialize(@cEnumValues : UInt32, @pValues : Win32cr::System::Com::StructuredStorage::PROPVARIANT*)
    end
  end

  @[Extern]
  struct WMDM_PROP_DESC
    property pwszPropName : Win32cr::Foundation::PWSTR
    property valid_values_form : Win32cr::Media::DeviceManager::WMDM_ENUM_PROP_VALID_VALUES_FORM
    property valid_values : ValidValues_e__Union_

    # Nested Type ValidValues_e__Union_
    @[Extern(union: true)]
    struct ValidValues_e__Union_
    property valid_values_range : Win32cr::Media::DeviceManager::WMDM_PROP_VALUES_RANGE
    property enumerated_valid_values : Win32cr::Media::DeviceManager::WMDM_PROP_VALUES_ENUM
    def initialize(@valid_values_range : Win32cr::Media::DeviceManager::WMDM_PROP_VALUES_RANGE, @enumerated_valid_values : Win32cr::Media::DeviceManager::WMDM_PROP_VALUES_ENUM)
    end
    end

    def initialize(@pwszPropName : Win32cr::Foundation::PWSTR, @valid_values_form : Win32cr::Media::DeviceManager::WMDM_ENUM_PROP_VALID_VALUES_FORM, @valid_values : ValidValues_e__Union_)
    end
  end

  @[Extern]
  struct WMDM_PROP_CONFIG
    property nPreference : UInt32
    property nPropDesc : UInt32
    property pPropDesc : Win32cr::Media::DeviceManager::WMDM_PROP_DESC*
    def initialize(@nPreference : UInt32, @nPropDesc : UInt32, @pPropDesc : Win32cr::Media::DeviceManager::WMDM_PROP_DESC*)
    end
  end

  @[Extern]
  struct WMDM_FORMAT_CAPABILITY
    property nPropConfig : UInt32
    property pConfigs : Win32cr::Media::DeviceManager::WMDM_PROP_CONFIG*
    def initialize(@nPropConfig : UInt32, @pConfigs : Win32cr::Media::DeviceManager::WMDM_PROP_CONFIG*)
    end
  end

  @[Extern(union: true)]
  struct WMDMDetermineMaxPropStringLen
    property sz001 : UInt16[27]
    property sz002 : UInt16[31]
    property sz003 : UInt16[14]
    property sz004 : UInt16[16]
    property sz005 : UInt16[22]
    property sz006 : UInt16[14]
    property sz007 : UInt16[20]
    property sz008 : UInt16[20]
    property sz009 : UInt16[22]
    property sz010 : UInt16[11]
    property sz011 : UInt16[12]
    property sz012 : UInt16[17]
    property sz013 : UInt16[17]
    property sz014 : UInt16[16]
    property sz015 : UInt16[17]
    property sz016 : UInt16[11]
    property sz017 : UInt16[11]
    property sz018 : UInt16[15]
    property sz019 : UInt16[22]
    property sz020 : UInt16[20]
    property sz021 : UInt16[22]
    property sz022 : UInt16[21]
    property sz023 : UInt16[24]
    property sz024 : UInt16[20]
    property sz025 : UInt16[10]
    property sz026 : UInt16[14]
    property sz027 : UInt16[11]
    property sz028 : UInt16[11]
    property sz029 : UInt16[13]
    property sz030 : UInt16[17]
    property sz031 : UInt16[16]
    property sz032 : UInt16[17]
    property sz033 : UInt16[20]
    property sz034 : UInt16[19]
    property sz035 : UInt16[18]
    property sz036 : UInt16[18]
    property sz037 : UInt16[15]
    property sz041 : UInt16[14]
    property sz043 : UInt16[22]
    property sz044 : UInt16[16]
    property sz045 : UInt16[20]
    property sz046 : UInt16[14]
    property sz047 : UInt16[14]
    property sz048 : UInt16[12]
    property sz049 : UInt16[25]
    property sz050 : UInt16[26]
    property sz051 : UInt16[25]
    property sz052 : UInt16[16]
    property sz053 : UInt16[24]
    property sz054 : UInt16[15]
    property sz055 : UInt16[21]
    property sz056 : UInt16[16]
    property sz057 : UInt16[22]
    property sz058 : UInt16[14]
    property sz059 : UInt16[25]
    property sz060 : UInt16[18]
    property sz061 : UInt16[22]
    property sz062 : UInt16[26]
    property sz063 : UInt16[36]
    property sz064 : UInt16[23]
    property sz065 : UInt16[12]
    property sz066 : UInt16[24]
    property sz067 : UInt16[11]
    property sz068 : UInt16[12]
    property sz069 : UInt16[14]
    property sz070 : UInt16[20]
    property sz071 : UInt16[15]
    property sz072 : UInt16[14]
    property sz073 : UInt16[31]
    property sz074 : UInt16[24]
    property sz075 : UInt16[22]
    property sz076 : UInt16[24]
    property sz077 : UInt16[21]
    property sz078 : UInt16[27]
    property sz079 : UInt16[27]
    property sz080 : UInt16[20]
    property sz081 : UInt16[33]
    property sz082 : UInt16[21]
    property sz083 : UInt16[32]
    property sz084 : UInt16[26]
    property sz085 : UInt16[18]
    property sz086 : UInt16[30]
    def initialize(@sz001 : UInt16[27], @sz002 : UInt16[31], @sz003 : UInt16[14], @sz004 : UInt16[16], @sz005 : UInt16[22], @sz006 : UInt16[14], @sz007 : UInt16[20], @sz008 : UInt16[20], @sz009 : UInt16[22], @sz010 : UInt16[11], @sz011 : UInt16[12], @sz012 : UInt16[17], @sz013 : UInt16[17], @sz014 : UInt16[16], @sz015 : UInt16[17], @sz016 : UInt16[11], @sz017 : UInt16[11], @sz018 : UInt16[15], @sz019 : UInt16[22], @sz020 : UInt16[20], @sz021 : UInt16[22], @sz022 : UInt16[21], @sz023 : UInt16[24], @sz024 : UInt16[20], @sz025 : UInt16[10], @sz026 : UInt16[14], @sz027 : UInt16[11], @sz028 : UInt16[11], @sz029 : UInt16[13], @sz030 : UInt16[17], @sz031 : UInt16[16], @sz032 : UInt16[17], @sz033 : UInt16[20], @sz034 : UInt16[19], @sz035 : UInt16[18], @sz036 : UInt16[18], @sz037 : UInt16[15], @sz041 : UInt16[14], @sz043 : UInt16[22], @sz044 : UInt16[16], @sz045 : UInt16[20], @sz046 : UInt16[14], @sz047 : UInt16[14], @sz048 : UInt16[12], @sz049 : UInt16[25], @sz050 : UInt16[26], @sz051 : UInt16[25], @sz052 : UInt16[16], @sz053 : UInt16[24], @sz054 : UInt16[15], @sz055 : UInt16[21], @sz056 : UInt16[16], @sz057 : UInt16[22], @sz058 : UInt16[14], @sz059 : UInt16[25], @sz060 : UInt16[18], @sz061 : UInt16[22], @sz062 : UInt16[26], @sz063 : UInt16[36], @sz064 : UInt16[23], @sz065 : UInt16[12], @sz066 : UInt16[24], @sz067 : UInt16[11], @sz068 : UInt16[12], @sz069 : UInt16[14], @sz070 : UInt16[20], @sz071 : UInt16[15], @sz072 : UInt16[14], @sz073 : UInt16[31], @sz074 : UInt16[24], @sz075 : UInt16[22], @sz076 : UInt16[24], @sz077 : UInt16[21], @sz078 : UInt16[27], @sz079 : UInt16[27], @sz080 : UInt16[20], @sz081 : UInt16[33], @sz082 : UInt16[21], @sz083 : UInt16[32], @sz084 : UInt16[26], @sz085 : UInt16[18], @sz086 : UInt16[30])
    end
  end

  @[Extern]
  struct MTP_COMMAND_DATA_IN
    property op_code : UInt16
    property num_params : UInt32
    property params : UInt32[5]
    property next_phase : UInt32
    property command_write_data_size : UInt32
    property command_write_data : UInt8*
    def initialize(@op_code : UInt16, @num_params : UInt32, @params : UInt32[5], @next_phase : UInt32, @command_write_data_size : UInt32, @command_write_data : UInt8*)
    end
  end

  @[Extern]
  struct MTP_COMMAND_DATA_OUT
    property response_code : UInt16
    property num_params : UInt32
    property params : UInt32[5]
    property command_read_data_size : UInt32
    property command_read_data : UInt8*
    def initialize(@response_code : UInt16, @num_params : UInt32, @params : UInt32[5], @command_read_data_size : UInt32, @command_read_data : UInt8*)
    end
  end

  @[Extern]
  record IWMDMMetaDataVtbl,
    query_interface : Proc(IWMDMMetaData*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMDMMetaData*, UInt32),
    release : Proc(IWMDMMetaData*, UInt32),
    add_item : Proc(IWMDMMetaData*, Win32cr::Media::DeviceManager::WMDM_TAG_DATATYPE, Win32cr::Foundation::PWSTR, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    query_by_name : Proc(IWMDMMetaData*, Win32cr::Foundation::PWSTR, Win32cr::Media::DeviceManager::WMDM_TAG_DATATYPE*, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    query_by_index : Proc(IWMDMMetaData*, UInt32, UInt16**, Win32cr::Media::DeviceManager::WMDM_TAG_DATATYPE*, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_item_count : Proc(IWMDMMetaData*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMDMMetaData, lpVtbl : IWMDMMetaDataVtbl* do
    GUID = LibC::GUID.new(0xec3b0663_u32, 0x951_u16, 0x460a_u16, StaticArray[0x9a_u8, 0x80_u8, 0xd_u8, 0xce_u8, 0xed_u8, 0x3c_u8, 0x4_u8, 0x3c_u8])
    def query_interface(this : IWMDMMetaData*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMDMMetaData*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMDMMetaData*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_item(this : IWMDMMetaData*, type__ : Win32cr::Media::DeviceManager::WMDM_TAG_DATATYPE, pwszTagName : Win32cr::Foundation::PWSTR, pValue : UInt8*, iLength : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_item.call(this, type__, pwszTagName, pValue, iLength)
    end
    def query_by_name(this : IWMDMMetaData*, pwszTagName : Win32cr::Foundation::PWSTR, pType : Win32cr::Media::DeviceManager::WMDM_TAG_DATATYPE*, pValue : UInt8**, pcbLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_by_name.call(this, pwszTagName, pType, pValue, pcbLength)
    end
    def query_by_index(this : IWMDMMetaData*, iIndex : UInt32, ppwszName : UInt16**, pType : Win32cr::Media::DeviceManager::WMDM_TAG_DATATYPE*, ppValue : UInt8**, pcbLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_by_index.call(this, iIndex, ppwszName, pType, ppValue, pcbLength)
    end
    def get_item_count(this : IWMDMMetaData*, iCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_item_count.call(this, iCount)
    end

  end

  @[Extern]
  record IWMDeviceManagerVtbl,
    query_interface : Proc(IWMDeviceManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMDeviceManager*, UInt32),
    release : Proc(IWMDeviceManager*, UInt32),
    get_revision : Proc(IWMDeviceManager*, UInt32*, Win32cr::Foundation::HRESULT),
    get_device_count : Proc(IWMDeviceManager*, UInt32*, Win32cr::Foundation::HRESULT),
    enum_devices : Proc(IWMDeviceManager*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMDeviceManager, lpVtbl : IWMDeviceManagerVtbl* do
    GUID = LibC::GUID.new(0x1dcb3a00_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
    def query_interface(this : IWMDeviceManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMDeviceManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMDeviceManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_revision(this : IWMDeviceManager*, pdwRevision : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_revision.call(this, pdwRevision)
    end
    def get_device_count(this : IWMDeviceManager*, pdwCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_count.call(this, pdwCount)
    end
    def enum_devices(this : IWMDeviceManager*, ppEnumDevice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_devices.call(this, ppEnumDevice)
    end

  end

  @[Extern]
  record IWMDeviceManager2Vtbl,
    query_interface : Proc(IWMDeviceManager2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMDeviceManager2*, UInt32),
    release : Proc(IWMDeviceManager2*, UInt32),
    get_revision : Proc(IWMDeviceManager2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_device_count : Proc(IWMDeviceManager2*, UInt32*, Win32cr::Foundation::HRESULT),
    enum_devices : Proc(IWMDeviceManager2*, Void**, Win32cr::Foundation::HRESULT),
    get_device_from_canonical_name : Proc(IWMDeviceManager2*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    enum_devices2 : Proc(IWMDeviceManager2*, Void**, Win32cr::Foundation::HRESULT),
    reinitialize : Proc(IWMDeviceManager2*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMDeviceManager2, lpVtbl : IWMDeviceManager2Vtbl* do
    GUID = LibC::GUID.new(0x923e5249_u32, 0x8731_u16, 0x4c5b_u16, StaticArray[0x9b_u8, 0x1c_u8, 0xb8_u8, 0xb6_u8, 0xb_u8, 0x6e_u8, 0x46_u8, 0xaf_u8])
    def query_interface(this : IWMDeviceManager2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMDeviceManager2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMDeviceManager2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_revision(this : IWMDeviceManager2*, pdwRevision : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_revision.call(this, pdwRevision)
    end
    def get_device_count(this : IWMDeviceManager2*, pdwCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_count.call(this, pdwCount)
    end
    def enum_devices(this : IWMDeviceManager2*, ppEnumDevice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_devices.call(this, ppEnumDevice)
    end
    def get_device_from_canonical_name(this : IWMDeviceManager2*, pwszCanonicalName : Win32cr::Foundation::PWSTR, ppDevice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_from_canonical_name.call(this, pwszCanonicalName, ppDevice)
    end
    def enum_devices2(this : IWMDeviceManager2*, ppEnumDevice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_devices2.call(this, ppEnumDevice)
    end
    def reinitialize(this : IWMDeviceManager2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reinitialize.call(this)
    end

  end

  @[Extern]
  record IWMDeviceManager3Vtbl,
    query_interface : Proc(IWMDeviceManager3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMDeviceManager3*, UInt32),
    release : Proc(IWMDeviceManager3*, UInt32),
    get_revision : Proc(IWMDeviceManager3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_device_count : Proc(IWMDeviceManager3*, UInt32*, Win32cr::Foundation::HRESULT),
    enum_devices : Proc(IWMDeviceManager3*, Void**, Win32cr::Foundation::HRESULT),
    get_device_from_canonical_name : Proc(IWMDeviceManager3*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    enum_devices2 : Proc(IWMDeviceManager3*, Void**, Win32cr::Foundation::HRESULT),
    reinitialize : Proc(IWMDeviceManager3*, Win32cr::Foundation::HRESULT),
    set_device_enum_preference : Proc(IWMDeviceManager3*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMDeviceManager3, lpVtbl : IWMDeviceManager3Vtbl* do
    GUID = LibC::GUID.new(0xaf185c41_u32, 0x100d_u16, 0x46ed_u16, StaticArray[0xbe_u8, 0x2e_u8, 0x9c_u8, 0xe8_u8, 0xc4_u8, 0x45_u8, 0x94_u8, 0xef_u8])
    def query_interface(this : IWMDeviceManager3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMDeviceManager3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMDeviceManager3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_revision(this : IWMDeviceManager3*, pdwRevision : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_revision.call(this, pdwRevision)
    end
    def get_device_count(this : IWMDeviceManager3*, pdwCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_count.call(this, pdwCount)
    end
    def enum_devices(this : IWMDeviceManager3*, ppEnumDevice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_devices.call(this, ppEnumDevice)
    end
    def get_device_from_canonical_name(this : IWMDeviceManager3*, pwszCanonicalName : Win32cr::Foundation::PWSTR, ppDevice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_from_canonical_name.call(this, pwszCanonicalName, ppDevice)
    end
    def enum_devices2(this : IWMDeviceManager3*, ppEnumDevice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_devices2.call(this, ppEnumDevice)
    end
    def reinitialize(this : IWMDeviceManager3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reinitialize.call(this)
    end
    def set_device_enum_preference(this : IWMDeviceManager3*, dwEnumPref : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_device_enum_preference.call(this, dwEnumPref)
    end

  end

  @[Extern]
  record IWMDMStorageGlobalsVtbl,
    query_interface : Proc(IWMDMStorageGlobals*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMDMStorageGlobals*, UInt32),
    release : Proc(IWMDMStorageGlobals*, UInt32),
    get_capabilities : Proc(IWMDMStorageGlobals*, UInt32*, Win32cr::Foundation::HRESULT),
    get_serial_number : Proc(IWMDMStorageGlobals*, Win32cr::Media::DeviceManager::WMDMID*, UInt8*, Win32cr::Foundation::HRESULT),
    get_total_size : Proc(IWMDMStorageGlobals*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_total_free : Proc(IWMDMStorageGlobals*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_total_bad : Proc(IWMDMStorageGlobals*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_status : Proc(IWMDMStorageGlobals*, UInt32*, Win32cr::Foundation::HRESULT),
    initialize__ : Proc(IWMDMStorageGlobals*, UInt32, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMDMStorageGlobals, lpVtbl : IWMDMStorageGlobalsVtbl* do
    GUID = LibC::GUID.new(0x1dcb3a07_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
    def query_interface(this : IWMDMStorageGlobals*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMDMStorageGlobals*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMDMStorageGlobals*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_capabilities(this : IWMDMStorageGlobals*, pdwCapabilities : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_capabilities.call(this, pdwCapabilities)
    end
    def get_serial_number(this : IWMDMStorageGlobals*, pSerialNum : Win32cr::Media::DeviceManager::WMDMID*, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_serial_number.call(this, pSerialNum, abMac)
    end
    def get_total_size(this : IWMDMStorageGlobals*, pdwTotalSizeLow : UInt32*, pdwTotalSizeHigh : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_total_size.call(this, pdwTotalSizeLow, pdwTotalSizeHigh)
    end
    def get_total_free(this : IWMDMStorageGlobals*, pdwFreeLow : UInt32*, pdwFreeHigh : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_total_free.call(this, pdwFreeLow, pdwFreeHigh)
    end
    def get_total_bad(this : IWMDMStorageGlobals*, pdwBadLow : UInt32*, pdwBadHigh : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_total_bad.call(this, pdwBadLow, pdwBadHigh)
    end
    def get_status(this : IWMDMStorageGlobals*, pdwStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, pdwStatus)
    end
    def initialize__(this : IWMDMStorageGlobals*, fuMode : UInt32, pProgress : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, fuMode, pProgress)
    end

  end

  @[Extern]
  record IWMDMStorageVtbl,
    query_interface : Proc(IWMDMStorage*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMDMStorage*, UInt32),
    release : Proc(IWMDMStorage*, UInt32),
    set_attributes : Proc(IWMDMStorage*, UInt32, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Foundation::HRESULT),
    get_storage_globals : Proc(IWMDMStorage*, Void**, Win32cr::Foundation::HRESULT),
    get_attributes : Proc(IWMDMStorage*, UInt32*, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Foundation::HRESULT),
    get_name : Proc(IWMDMStorage*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    get_date : Proc(IWMDMStorage*, Win32cr::Media::DeviceManager::WMDMDATETIME*, Win32cr::Foundation::HRESULT),
    get_size : Proc(IWMDMStorage*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_rights : Proc(IWMDMStorage*, Win32cr::Media::DeviceManager::WMDMRIGHTS**, UInt32*, UInt8*, Win32cr::Foundation::HRESULT),
    enum_storage : Proc(IWMDMStorage*, Void**, Win32cr::Foundation::HRESULT),
    send_opaque_command : Proc(IWMDMStorage*, Win32cr::Media::DeviceManager::OPAQUECOMMAND*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMDMStorage, lpVtbl : IWMDMStorageVtbl* do
    GUID = LibC::GUID.new(0x1dcb3a06_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
    def query_interface(this : IWMDMStorage*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMDMStorage*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMDMStorage*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_attributes(this : IWMDMStorage*, dwAttributes : UInt32, pFormat : Win32cr::Media::Audio::WAVEFORMATEX*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_attributes.call(this, dwAttributes, pFormat)
    end
    def get_storage_globals(this : IWMDMStorage*, ppStorageGlobals : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_storage_globals.call(this, ppStorageGlobals)
    end
    def get_attributes(this : IWMDMStorage*, pdwAttributes : UInt32*, pFormat : Win32cr::Media::Audio::WAVEFORMATEX*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attributes.call(this, pdwAttributes, pFormat)
    end
    def get_name(this : IWMDMStorage*, pwszName : UInt16*, nMaxChars : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, pwszName, nMaxChars)
    end
    def get_date(this : IWMDMStorage*, pDateTimeUTC : Win32cr::Media::DeviceManager::WMDMDATETIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_date.call(this, pDateTimeUTC)
    end
    def get_size(this : IWMDMStorage*, pdwSizeLow : UInt32*, pdwSizeHigh : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_size.call(this, pdwSizeLow, pdwSizeHigh)
    end
    def get_rights(this : IWMDMStorage*, ppRights : Win32cr::Media::DeviceManager::WMDMRIGHTS**, pnRightsCount : UInt32*, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rights.call(this, ppRights, pnRightsCount, abMac)
    end
    def enum_storage(this : IWMDMStorage*, pEnumStorage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_storage.call(this, pEnumStorage)
    end
    def send_opaque_command(this : IWMDMStorage*, pCommand : Win32cr::Media::DeviceManager::OPAQUECOMMAND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_opaque_command.call(this, pCommand)
    end

  end

  @[Extern]
  record IWMDMStorage2Vtbl,
    query_interface : Proc(IWMDMStorage2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMDMStorage2*, UInt32),
    release : Proc(IWMDMStorage2*, UInt32),
    set_attributes : Proc(IWMDMStorage2*, UInt32, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Foundation::HRESULT),
    get_storage_globals : Proc(IWMDMStorage2*, Void**, Win32cr::Foundation::HRESULT),
    get_attributes : Proc(IWMDMStorage2*, UInt32*, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Foundation::HRESULT),
    get_name : Proc(IWMDMStorage2*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    get_date : Proc(IWMDMStorage2*, Win32cr::Media::DeviceManager::WMDMDATETIME*, Win32cr::Foundation::HRESULT),
    get_size : Proc(IWMDMStorage2*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_rights : Proc(IWMDMStorage2*, Win32cr::Media::DeviceManager::WMDMRIGHTS**, UInt32*, UInt8*, Win32cr::Foundation::HRESULT),
    enum_storage : Proc(IWMDMStorage2*, Void**, Win32cr::Foundation::HRESULT),
    send_opaque_command : Proc(IWMDMStorage2*, Win32cr::Media::DeviceManager::OPAQUECOMMAND*, Win32cr::Foundation::HRESULT),
    get_storage : Proc(IWMDMStorage2*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    set_attributes2 : Proc(IWMDMStorage2*, UInt32, UInt32, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Media::MediaFoundation::VIDEOINFOHEADER*, Win32cr::Foundation::HRESULT),
    get_attributes2 : Proc(IWMDMStorage2*, UInt32*, UInt32*, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Media::MediaFoundation::VIDEOINFOHEADER*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMDMStorage2, lpVtbl : IWMDMStorage2Vtbl* do
    GUID = LibC::GUID.new(0x1ed5a144_u32, 0x5cd5_u16, 0x4683_u16, StaticArray[0x9e_u8, 0xff_u8, 0x72_u8, 0xcb_u8, 0xdb_u8, 0x2d_u8, 0x95_u8, 0x33_u8])
    def query_interface(this : IWMDMStorage2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMDMStorage2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMDMStorage2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_attributes(this : IWMDMStorage2*, dwAttributes : UInt32, pFormat : Win32cr::Media::Audio::WAVEFORMATEX*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_attributes.call(this, dwAttributes, pFormat)
    end
    def get_storage_globals(this : IWMDMStorage2*, ppStorageGlobals : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_storage_globals.call(this, ppStorageGlobals)
    end
    def get_attributes(this : IWMDMStorage2*, pdwAttributes : UInt32*, pFormat : Win32cr::Media::Audio::WAVEFORMATEX*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attributes.call(this, pdwAttributes, pFormat)
    end
    def get_name(this : IWMDMStorage2*, pwszName : UInt16*, nMaxChars : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, pwszName, nMaxChars)
    end
    def get_date(this : IWMDMStorage2*, pDateTimeUTC : Win32cr::Media::DeviceManager::WMDMDATETIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_date.call(this, pDateTimeUTC)
    end
    def get_size(this : IWMDMStorage2*, pdwSizeLow : UInt32*, pdwSizeHigh : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_size.call(this, pdwSizeLow, pdwSizeHigh)
    end
    def get_rights(this : IWMDMStorage2*, ppRights : Win32cr::Media::DeviceManager::WMDMRIGHTS**, pnRightsCount : UInt32*, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rights.call(this, ppRights, pnRightsCount, abMac)
    end
    def enum_storage(this : IWMDMStorage2*, pEnumStorage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_storage.call(this, pEnumStorage)
    end
    def send_opaque_command(this : IWMDMStorage2*, pCommand : Win32cr::Media::DeviceManager::OPAQUECOMMAND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_opaque_command.call(this, pCommand)
    end
    def get_storage(this : IWMDMStorage2*, pszStorageName : Win32cr::Foundation::PWSTR, ppStorage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_storage.call(this, pszStorageName, ppStorage)
    end
    def set_attributes2(this : IWMDMStorage2*, dwAttributes : UInt32, dwAttributesEx : UInt32, pFormat : Win32cr::Media::Audio::WAVEFORMATEX*, pVideoFormat : Win32cr::Media::MediaFoundation::VIDEOINFOHEADER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_attributes2.call(this, dwAttributes, dwAttributesEx, pFormat, pVideoFormat)
    end
    def get_attributes2(this : IWMDMStorage2*, pdwAttributes : UInt32*, pdwAttributesEx : UInt32*, pAudioFormat : Win32cr::Media::Audio::WAVEFORMATEX*, pVideoFormat : Win32cr::Media::MediaFoundation::VIDEOINFOHEADER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attributes2.call(this, pdwAttributes, pdwAttributesEx, pAudioFormat, pVideoFormat)
    end

  end

  @[Extern]
  record IWMDMStorage3Vtbl,
    query_interface : Proc(IWMDMStorage3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMDMStorage3*, UInt32),
    release : Proc(IWMDMStorage3*, UInt32),
    set_attributes : Proc(IWMDMStorage3*, UInt32, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Foundation::HRESULT),
    get_storage_globals : Proc(IWMDMStorage3*, Void**, Win32cr::Foundation::HRESULT),
    get_attributes : Proc(IWMDMStorage3*, UInt32*, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Foundation::HRESULT),
    get_name : Proc(IWMDMStorage3*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    get_date : Proc(IWMDMStorage3*, Win32cr::Media::DeviceManager::WMDMDATETIME*, Win32cr::Foundation::HRESULT),
    get_size : Proc(IWMDMStorage3*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_rights : Proc(IWMDMStorage3*, Win32cr::Media::DeviceManager::WMDMRIGHTS**, UInt32*, UInt8*, Win32cr::Foundation::HRESULT),
    enum_storage : Proc(IWMDMStorage3*, Void**, Win32cr::Foundation::HRESULT),
    send_opaque_command : Proc(IWMDMStorage3*, Win32cr::Media::DeviceManager::OPAQUECOMMAND*, Win32cr::Foundation::HRESULT),
    get_storage : Proc(IWMDMStorage3*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    set_attributes2 : Proc(IWMDMStorage3*, UInt32, UInt32, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Media::MediaFoundation::VIDEOINFOHEADER*, Win32cr::Foundation::HRESULT),
    get_attributes2 : Proc(IWMDMStorage3*, UInt32*, UInt32*, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Media::MediaFoundation::VIDEOINFOHEADER*, Win32cr::Foundation::HRESULT),
    get_metadata : Proc(IWMDMStorage3*, Void**, Win32cr::Foundation::HRESULT),
    set_metadata : Proc(IWMDMStorage3*, Void*, Win32cr::Foundation::HRESULT),
    create_empty_metadata_object : Proc(IWMDMStorage3*, Void**, Win32cr::Foundation::HRESULT),
    set_enum_preference : Proc(IWMDMStorage3*, Win32cr::Media::DeviceManager::WMDM_STORAGE_ENUM_MODE*, UInt32, Win32cr::Media::DeviceManager::WMDMMetadataView*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMDMStorage3, lpVtbl : IWMDMStorage3Vtbl* do
    GUID = LibC::GUID.new(0x97717eea_u32, 0x926a_u16, 0x464e_u16, StaticArray[0x96_u8, 0xa4_u8, 0x24_u8, 0x7b_u8, 0x2_u8, 0x16_u8, 0x2_u8, 0x6e_u8])
    def query_interface(this : IWMDMStorage3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMDMStorage3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMDMStorage3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_attributes(this : IWMDMStorage3*, dwAttributes : UInt32, pFormat : Win32cr::Media::Audio::WAVEFORMATEX*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_attributes.call(this, dwAttributes, pFormat)
    end
    def get_storage_globals(this : IWMDMStorage3*, ppStorageGlobals : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_storage_globals.call(this, ppStorageGlobals)
    end
    def get_attributes(this : IWMDMStorage3*, pdwAttributes : UInt32*, pFormat : Win32cr::Media::Audio::WAVEFORMATEX*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attributes.call(this, pdwAttributes, pFormat)
    end
    def get_name(this : IWMDMStorage3*, pwszName : UInt16*, nMaxChars : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, pwszName, nMaxChars)
    end
    def get_date(this : IWMDMStorage3*, pDateTimeUTC : Win32cr::Media::DeviceManager::WMDMDATETIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_date.call(this, pDateTimeUTC)
    end
    def get_size(this : IWMDMStorage3*, pdwSizeLow : UInt32*, pdwSizeHigh : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_size.call(this, pdwSizeLow, pdwSizeHigh)
    end
    def get_rights(this : IWMDMStorage3*, ppRights : Win32cr::Media::DeviceManager::WMDMRIGHTS**, pnRightsCount : UInt32*, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rights.call(this, ppRights, pnRightsCount, abMac)
    end
    def enum_storage(this : IWMDMStorage3*, pEnumStorage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_storage.call(this, pEnumStorage)
    end
    def send_opaque_command(this : IWMDMStorage3*, pCommand : Win32cr::Media::DeviceManager::OPAQUECOMMAND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_opaque_command.call(this, pCommand)
    end
    def get_storage(this : IWMDMStorage3*, pszStorageName : Win32cr::Foundation::PWSTR, ppStorage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_storage.call(this, pszStorageName, ppStorage)
    end
    def set_attributes2(this : IWMDMStorage3*, dwAttributes : UInt32, dwAttributesEx : UInt32, pFormat : Win32cr::Media::Audio::WAVEFORMATEX*, pVideoFormat : Win32cr::Media::MediaFoundation::VIDEOINFOHEADER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_attributes2.call(this, dwAttributes, dwAttributesEx, pFormat, pVideoFormat)
    end
    def get_attributes2(this : IWMDMStorage3*, pdwAttributes : UInt32*, pdwAttributesEx : UInt32*, pAudioFormat : Win32cr::Media::Audio::WAVEFORMATEX*, pVideoFormat : Win32cr::Media::MediaFoundation::VIDEOINFOHEADER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attributes2.call(this, pdwAttributes, pdwAttributesEx, pAudioFormat, pVideoFormat)
    end
    def get_metadata(this : IWMDMStorage3*, ppMetadata : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_metadata.call(this, ppMetadata)
    end
    def set_metadata(this : IWMDMStorage3*, pMetadata : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_metadata.call(this, pMetadata)
    end
    def create_empty_metadata_object(this : IWMDMStorage3*, ppMetadata : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_empty_metadata_object.call(this, ppMetadata)
    end
    def set_enum_preference(this : IWMDMStorage3*, pMode : Win32cr::Media::DeviceManager::WMDM_STORAGE_ENUM_MODE*, nViews : UInt32, pViews : Win32cr::Media::DeviceManager::WMDMMetadataView*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enum_preference.call(this, pMode, nViews, pViews)
    end

  end

  @[Extern]
  record IWMDMStorage4Vtbl,
    query_interface : Proc(IWMDMStorage4*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMDMStorage4*, UInt32),
    release : Proc(IWMDMStorage4*, UInt32),
    set_attributes : Proc(IWMDMStorage4*, UInt32, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Foundation::HRESULT),
    get_storage_globals : Proc(IWMDMStorage4*, Void**, Win32cr::Foundation::HRESULT),
    get_attributes : Proc(IWMDMStorage4*, UInt32*, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Foundation::HRESULT),
    get_name : Proc(IWMDMStorage4*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    get_date : Proc(IWMDMStorage4*, Win32cr::Media::DeviceManager::WMDMDATETIME*, Win32cr::Foundation::HRESULT),
    get_size : Proc(IWMDMStorage4*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_rights : Proc(IWMDMStorage4*, Win32cr::Media::DeviceManager::WMDMRIGHTS**, UInt32*, UInt8*, Win32cr::Foundation::HRESULT),
    enum_storage : Proc(IWMDMStorage4*, Void**, Win32cr::Foundation::HRESULT),
    send_opaque_command : Proc(IWMDMStorage4*, Win32cr::Media::DeviceManager::OPAQUECOMMAND*, Win32cr::Foundation::HRESULT),
    get_storage : Proc(IWMDMStorage4*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    set_attributes2 : Proc(IWMDMStorage4*, UInt32, UInt32, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Media::MediaFoundation::VIDEOINFOHEADER*, Win32cr::Foundation::HRESULT),
    get_attributes2 : Proc(IWMDMStorage4*, UInt32*, UInt32*, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Media::MediaFoundation::VIDEOINFOHEADER*, Win32cr::Foundation::HRESULT),
    get_metadata : Proc(IWMDMStorage4*, Void**, Win32cr::Foundation::HRESULT),
    set_metadata : Proc(IWMDMStorage4*, Void*, Win32cr::Foundation::HRESULT),
    create_empty_metadata_object : Proc(IWMDMStorage4*, Void**, Win32cr::Foundation::HRESULT),
    set_enum_preference : Proc(IWMDMStorage4*, Win32cr::Media::DeviceManager::WMDM_STORAGE_ENUM_MODE*, UInt32, Win32cr::Media::DeviceManager::WMDMMetadataView*, Win32cr::Foundation::HRESULT),
    set_references : Proc(IWMDMStorage4*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_references : Proc(IWMDMStorage4*, UInt32*, Void***, Win32cr::Foundation::HRESULT),
    get_rights_with_progress : Proc(IWMDMStorage4*, Void*, Win32cr::Media::DeviceManager::WMDMRIGHTS**, UInt32*, Win32cr::Foundation::HRESULT),
    get_specified_metadata : Proc(IWMDMStorage4*, UInt32, Win32cr::Foundation::PWSTR*, Void**, Win32cr::Foundation::HRESULT),
    find_storage : Proc(IWMDMStorage4*, Win32cr::Media::DeviceManager::WMDM_FIND_SCOPE, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IWMDMStorage4*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMDMStorage4, lpVtbl : IWMDMStorage4Vtbl* do
    GUID = LibC::GUID.new(0xc225bac5_u32, 0xa03a_u16, 0x40b8_u16, StaticArray[0x9a_u8, 0x23_u8, 0x91_u8, 0xcf_u8, 0x47_u8, 0x8c_u8, 0x64_u8, 0xa6_u8])
    def query_interface(this : IWMDMStorage4*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMDMStorage4*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMDMStorage4*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_attributes(this : IWMDMStorage4*, dwAttributes : UInt32, pFormat : Win32cr::Media::Audio::WAVEFORMATEX*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_attributes.call(this, dwAttributes, pFormat)
    end
    def get_storage_globals(this : IWMDMStorage4*, ppStorageGlobals : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_storage_globals.call(this, ppStorageGlobals)
    end
    def get_attributes(this : IWMDMStorage4*, pdwAttributes : UInt32*, pFormat : Win32cr::Media::Audio::WAVEFORMATEX*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attributes.call(this, pdwAttributes, pFormat)
    end
    def get_name(this : IWMDMStorage4*, pwszName : UInt16*, nMaxChars : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, pwszName, nMaxChars)
    end
    def get_date(this : IWMDMStorage4*, pDateTimeUTC : Win32cr::Media::DeviceManager::WMDMDATETIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_date.call(this, pDateTimeUTC)
    end
    def get_size(this : IWMDMStorage4*, pdwSizeLow : UInt32*, pdwSizeHigh : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_size.call(this, pdwSizeLow, pdwSizeHigh)
    end
    def get_rights(this : IWMDMStorage4*, ppRights : Win32cr::Media::DeviceManager::WMDMRIGHTS**, pnRightsCount : UInt32*, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rights.call(this, ppRights, pnRightsCount, abMac)
    end
    def enum_storage(this : IWMDMStorage4*, pEnumStorage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_storage.call(this, pEnumStorage)
    end
    def send_opaque_command(this : IWMDMStorage4*, pCommand : Win32cr::Media::DeviceManager::OPAQUECOMMAND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_opaque_command.call(this, pCommand)
    end
    def get_storage(this : IWMDMStorage4*, pszStorageName : Win32cr::Foundation::PWSTR, ppStorage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_storage.call(this, pszStorageName, ppStorage)
    end
    def set_attributes2(this : IWMDMStorage4*, dwAttributes : UInt32, dwAttributesEx : UInt32, pFormat : Win32cr::Media::Audio::WAVEFORMATEX*, pVideoFormat : Win32cr::Media::MediaFoundation::VIDEOINFOHEADER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_attributes2.call(this, dwAttributes, dwAttributesEx, pFormat, pVideoFormat)
    end
    def get_attributes2(this : IWMDMStorage4*, pdwAttributes : UInt32*, pdwAttributesEx : UInt32*, pAudioFormat : Win32cr::Media::Audio::WAVEFORMATEX*, pVideoFormat : Win32cr::Media::MediaFoundation::VIDEOINFOHEADER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attributes2.call(this, pdwAttributes, pdwAttributesEx, pAudioFormat, pVideoFormat)
    end
    def get_metadata(this : IWMDMStorage4*, ppMetadata : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_metadata.call(this, ppMetadata)
    end
    def set_metadata(this : IWMDMStorage4*, pMetadata : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_metadata.call(this, pMetadata)
    end
    def create_empty_metadata_object(this : IWMDMStorage4*, ppMetadata : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_empty_metadata_object.call(this, ppMetadata)
    end
    def set_enum_preference(this : IWMDMStorage4*, pMode : Win32cr::Media::DeviceManager::WMDM_STORAGE_ENUM_MODE*, nViews : UInt32, pViews : Win32cr::Media::DeviceManager::WMDMMetadataView*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enum_preference.call(this, pMode, nViews, pViews)
    end
    def set_references(this : IWMDMStorage4*, dwRefs : UInt32, ppIWMDMStorage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_references.call(this, dwRefs, ppIWMDMStorage)
    end
    def get_references(this : IWMDMStorage4*, pdwRefs : UInt32*, pppIWMDMStorage : Void***) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_references.call(this, pdwRefs, pppIWMDMStorage)
    end
    def get_rights_with_progress(this : IWMDMStorage4*, pIProgressCallback : Void*, ppRights : Win32cr::Media::DeviceManager::WMDMRIGHTS**, pnRightsCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rights_with_progress.call(this, pIProgressCallback, ppRights, pnRightsCount)
    end
    def get_specified_metadata(this : IWMDMStorage4*, cProperties : UInt32, ppwszPropNames : Win32cr::Foundation::PWSTR*, ppMetadata : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_specified_metadata.call(this, cProperties, ppwszPropNames, ppMetadata)
    end
    def find_storage(this : IWMDMStorage4*, findScope : Win32cr::Media::DeviceManager::WMDM_FIND_SCOPE, pwszUniqueID : Win32cr::Foundation::PWSTR, ppStorage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_storage.call(this, findScope, pwszUniqueID, ppStorage)
    end
    def get_parent(this : IWMDMStorage4*, ppStorage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, ppStorage)
    end

  end

  @[Extern]
  record IWMDMOperationVtbl,
    query_interface : Proc(IWMDMOperation*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMDMOperation*, UInt32),
    release : Proc(IWMDMOperation*, UInt32),
    begin_read : Proc(IWMDMOperation*, Win32cr::Foundation::HRESULT),
    begin_write : Proc(IWMDMOperation*, Win32cr::Foundation::HRESULT),
    get_object_name : Proc(IWMDMOperation*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    set_object_name : Proc(IWMDMOperation*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    get_object_attributes : Proc(IWMDMOperation*, UInt32*, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Foundation::HRESULT),
    set_object_attributes : Proc(IWMDMOperation*, UInt32, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Foundation::HRESULT),
    get_object_total_size : Proc(IWMDMOperation*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    set_object_total_size : Proc(IWMDMOperation*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    transfer_object_data : Proc(IWMDMOperation*, UInt8*, UInt32*, UInt8*, Win32cr::Foundation::HRESULT),
    end__ : Proc(IWMDMOperation*, Win32cr::Foundation::HRESULT*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMDMOperation, lpVtbl : IWMDMOperationVtbl* do
    GUID = LibC::GUID.new(0x1dcb3a0b_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
    def query_interface(this : IWMDMOperation*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMDMOperation*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMDMOperation*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def begin_read(this : IWMDMOperation*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_read.call(this)
    end
    def begin_write(this : IWMDMOperation*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_write.call(this)
    end
    def get_object_name(this : IWMDMOperation*, pwszName : UInt16*, nMaxChars : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_name.call(this, pwszName, nMaxChars)
    end
    def set_object_name(this : IWMDMOperation*, pwszName : UInt16*, nMaxChars : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_object_name.call(this, pwszName, nMaxChars)
    end
    def get_object_attributes(this : IWMDMOperation*, pdwAttributes : UInt32*, pFormat : Win32cr::Media::Audio::WAVEFORMATEX*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_attributes.call(this, pdwAttributes, pFormat)
    end
    def set_object_attributes(this : IWMDMOperation*, dwAttributes : UInt32, pFormat : Win32cr::Media::Audio::WAVEFORMATEX*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_object_attributes.call(this, dwAttributes, pFormat)
    end
    def get_object_total_size(this : IWMDMOperation*, pdwSize : UInt32*, pdwSizeHigh : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_total_size.call(this, pdwSize, pdwSizeHigh)
    end
    def set_object_total_size(this : IWMDMOperation*, dwSize : UInt32, dwSizeHigh : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_object_total_size.call(this, dwSize, dwSizeHigh)
    end
    def transfer_object_data(this : IWMDMOperation*, pData : UInt8*, pdwSize : UInt32*, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.transfer_object_data.call(this, pData, pdwSize, abMac)
    end
    def end__(this : IWMDMOperation*, phCompletionCode : Win32cr::Foundation::HRESULT*, pNewObject : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end__.call(this, phCompletionCode, pNewObject)
    end

  end

  @[Extern]
  record IWMDMOperation2Vtbl,
    query_interface : Proc(IWMDMOperation2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMDMOperation2*, UInt32),
    release : Proc(IWMDMOperation2*, UInt32),
    begin_read : Proc(IWMDMOperation2*, Win32cr::Foundation::HRESULT),
    begin_write : Proc(IWMDMOperation2*, Win32cr::Foundation::HRESULT),
    get_object_name : Proc(IWMDMOperation2*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    set_object_name : Proc(IWMDMOperation2*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    get_object_attributes : Proc(IWMDMOperation2*, UInt32*, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Foundation::HRESULT),
    set_object_attributes : Proc(IWMDMOperation2*, UInt32, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Foundation::HRESULT),
    get_object_total_size : Proc(IWMDMOperation2*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    set_object_total_size : Proc(IWMDMOperation2*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    transfer_object_data : Proc(IWMDMOperation2*, UInt8*, UInt32*, UInt8*, Win32cr::Foundation::HRESULT),
    end__ : Proc(IWMDMOperation2*, Win32cr::Foundation::HRESULT*, Void*, Win32cr::Foundation::HRESULT),
    set_object_attributes2 : Proc(IWMDMOperation2*, UInt32, UInt32, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Media::MediaFoundation::VIDEOINFOHEADER*, Win32cr::Foundation::HRESULT),
    get_object_attributes2 : Proc(IWMDMOperation2*, UInt32*, UInt32*, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Media::MediaFoundation::VIDEOINFOHEADER*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMDMOperation2, lpVtbl : IWMDMOperation2Vtbl* do
    GUID = LibC::GUID.new(0x33445b48_u32, 0x7df7_u16, 0x425c_u16, StaticArray[0xad_u8, 0x8f_u8, 0xf_u8, 0xc6_u8, 0xd8_u8, 0x2f_u8, 0x9f_u8, 0x75_u8])
    def query_interface(this : IWMDMOperation2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMDMOperation2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMDMOperation2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def begin_read(this : IWMDMOperation2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_read.call(this)
    end
    def begin_write(this : IWMDMOperation2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_write.call(this)
    end
    def get_object_name(this : IWMDMOperation2*, pwszName : UInt16*, nMaxChars : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_name.call(this, pwszName, nMaxChars)
    end
    def set_object_name(this : IWMDMOperation2*, pwszName : UInt16*, nMaxChars : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_object_name.call(this, pwszName, nMaxChars)
    end
    def get_object_attributes(this : IWMDMOperation2*, pdwAttributes : UInt32*, pFormat : Win32cr::Media::Audio::WAVEFORMATEX*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_attributes.call(this, pdwAttributes, pFormat)
    end
    def set_object_attributes(this : IWMDMOperation2*, dwAttributes : UInt32, pFormat : Win32cr::Media::Audio::WAVEFORMATEX*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_object_attributes.call(this, dwAttributes, pFormat)
    end
    def get_object_total_size(this : IWMDMOperation2*, pdwSize : UInt32*, pdwSizeHigh : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_total_size.call(this, pdwSize, pdwSizeHigh)
    end
    def set_object_total_size(this : IWMDMOperation2*, dwSize : UInt32, dwSizeHigh : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_object_total_size.call(this, dwSize, dwSizeHigh)
    end
    def transfer_object_data(this : IWMDMOperation2*, pData : UInt8*, pdwSize : UInt32*, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.transfer_object_data.call(this, pData, pdwSize, abMac)
    end
    def end__(this : IWMDMOperation2*, phCompletionCode : Win32cr::Foundation::HRESULT*, pNewObject : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end__.call(this, phCompletionCode, pNewObject)
    end
    def set_object_attributes2(this : IWMDMOperation2*, dwAttributes : UInt32, dwAttributesEx : UInt32, pFormat : Win32cr::Media::Audio::WAVEFORMATEX*, pVideoFormat : Win32cr::Media::MediaFoundation::VIDEOINFOHEADER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_object_attributes2.call(this, dwAttributes, dwAttributesEx, pFormat, pVideoFormat)
    end
    def get_object_attributes2(this : IWMDMOperation2*, pdwAttributes : UInt32*, pdwAttributesEx : UInt32*, pAudioFormat : Win32cr::Media::Audio::WAVEFORMATEX*, pVideoFormat : Win32cr::Media::MediaFoundation::VIDEOINFOHEADER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_attributes2.call(this, pdwAttributes, pdwAttributesEx, pAudioFormat, pVideoFormat)
    end

  end

  @[Extern]
  record IWMDMOperation3Vtbl,
    query_interface : Proc(IWMDMOperation3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMDMOperation3*, UInt32),
    release : Proc(IWMDMOperation3*, UInt32),
    begin_read : Proc(IWMDMOperation3*, Win32cr::Foundation::HRESULT),
    begin_write : Proc(IWMDMOperation3*, Win32cr::Foundation::HRESULT),
    get_object_name : Proc(IWMDMOperation3*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    set_object_name : Proc(IWMDMOperation3*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    get_object_attributes : Proc(IWMDMOperation3*, UInt32*, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Foundation::HRESULT),
    set_object_attributes : Proc(IWMDMOperation3*, UInt32, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Foundation::HRESULT),
    get_object_total_size : Proc(IWMDMOperation3*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    set_object_total_size : Proc(IWMDMOperation3*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    transfer_object_data : Proc(IWMDMOperation3*, UInt8*, UInt32*, UInt8*, Win32cr::Foundation::HRESULT),
    end__ : Proc(IWMDMOperation3*, Win32cr::Foundation::HRESULT*, Void*, Win32cr::Foundation::HRESULT),
    transfer_object_data_on_clear_channel : Proc(IWMDMOperation3*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMDMOperation3, lpVtbl : IWMDMOperation3Vtbl* do
    GUID = LibC::GUID.new(0xd1f9b46a_u32, 0x9ca8_u16, 0x46d8_u16, StaticArray[0x9d_u8, 0xf_u8, 0x1e_u8, 0xc9_u8, 0xba_u8, 0xe5_u8, 0x49_u8, 0x19_u8])
    def query_interface(this : IWMDMOperation3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMDMOperation3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMDMOperation3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def begin_read(this : IWMDMOperation3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_read.call(this)
    end
    def begin_write(this : IWMDMOperation3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_write.call(this)
    end
    def get_object_name(this : IWMDMOperation3*, pwszName : UInt16*, nMaxChars : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_name.call(this, pwszName, nMaxChars)
    end
    def set_object_name(this : IWMDMOperation3*, pwszName : UInt16*, nMaxChars : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_object_name.call(this, pwszName, nMaxChars)
    end
    def get_object_attributes(this : IWMDMOperation3*, pdwAttributes : UInt32*, pFormat : Win32cr::Media::Audio::WAVEFORMATEX*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_attributes.call(this, pdwAttributes, pFormat)
    end
    def set_object_attributes(this : IWMDMOperation3*, dwAttributes : UInt32, pFormat : Win32cr::Media::Audio::WAVEFORMATEX*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_object_attributes.call(this, dwAttributes, pFormat)
    end
    def get_object_total_size(this : IWMDMOperation3*, pdwSize : UInt32*, pdwSizeHigh : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_total_size.call(this, pdwSize, pdwSizeHigh)
    end
    def set_object_total_size(this : IWMDMOperation3*, dwSize : UInt32, dwSizeHigh : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_object_total_size.call(this, dwSize, dwSizeHigh)
    end
    def transfer_object_data(this : IWMDMOperation3*, pData : UInt8*, pdwSize : UInt32*, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.transfer_object_data.call(this, pData, pdwSize, abMac)
    end
    def end__(this : IWMDMOperation3*, phCompletionCode : Win32cr::Foundation::HRESULT*, pNewObject : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end__.call(this, phCompletionCode, pNewObject)
    end
    def transfer_object_data_on_clear_channel(this : IWMDMOperation3*, pData : UInt8*, pdwSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.transfer_object_data_on_clear_channel.call(this, pData, pdwSize)
    end

  end

  @[Extern]
  record IWMDMProgressVtbl,
    query_interface : Proc(IWMDMProgress*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMDMProgress*, UInt32),
    release : Proc(IWMDMProgress*, UInt32),
    begin__ : Proc(IWMDMProgress*, UInt32, Win32cr::Foundation::HRESULT),
    progress : Proc(IWMDMProgress*, UInt32, Win32cr::Foundation::HRESULT),
    end__ : Proc(IWMDMProgress*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMDMProgress, lpVtbl : IWMDMProgressVtbl* do
    GUID = LibC::GUID.new(0x1dcb3a0c_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
    def query_interface(this : IWMDMProgress*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMDMProgress*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMDMProgress*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def begin__(this : IWMDMProgress*, dwEstimatedTicks : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin__.call(this, dwEstimatedTicks)
    end
    def progress(this : IWMDMProgress*, dwTranspiredTicks : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.progress.call(this, dwTranspiredTicks)
    end
    def end__(this : IWMDMProgress*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end__.call(this)
    end

  end

  @[Extern]
  record IWMDMProgress2Vtbl,
    query_interface : Proc(IWMDMProgress2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMDMProgress2*, UInt32),
    release : Proc(IWMDMProgress2*, UInt32),
    begin__ : Proc(IWMDMProgress2*, UInt32, Win32cr::Foundation::HRESULT),
    progress : Proc(IWMDMProgress2*, UInt32, Win32cr::Foundation::HRESULT),
    end__ : Proc(IWMDMProgress2*, Win32cr::Foundation::HRESULT),
    end2 : Proc(IWMDMProgress2*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMDMProgress2, lpVtbl : IWMDMProgress2Vtbl* do
    GUID = LibC::GUID.new(0x3a43f550_u32, 0xb383_u16, 0x4e92_u16, StaticArray[0xb0_u8, 0x4a_u8, 0xe6_u8, 0xbb_u8, 0xc6_u8, 0x60_u8, 0xfe_u8, 0xfc_u8])
    def query_interface(this : IWMDMProgress2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMDMProgress2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMDMProgress2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def begin__(this : IWMDMProgress2*, dwEstimatedTicks : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin__.call(this, dwEstimatedTicks)
    end
    def progress(this : IWMDMProgress2*, dwTranspiredTicks : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.progress.call(this, dwTranspiredTicks)
    end
    def end__(this : IWMDMProgress2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end__.call(this)
    end
    def end2(this : IWMDMProgress2*, hrCompletionCode : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end2.call(this, hrCompletionCode)
    end

  end

  @[Extern]
  record IWMDMProgress3Vtbl,
    query_interface : Proc(IWMDMProgress3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMDMProgress3*, UInt32),
    release : Proc(IWMDMProgress3*, UInt32),
    begin__ : Proc(IWMDMProgress3*, UInt32, Win32cr::Foundation::HRESULT),
    progress : Proc(IWMDMProgress3*, UInt32, Win32cr::Foundation::HRESULT),
    end__ : Proc(IWMDMProgress3*, Win32cr::Foundation::HRESULT),
    end2 : Proc(IWMDMProgress3*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    begin3 : Proc(IWMDMProgress3*, LibC::GUID, UInt32, Win32cr::Media::DeviceManager::OPAQUECOMMAND*, Win32cr::Foundation::HRESULT),
    progress3 : Proc(IWMDMProgress3*, LibC::GUID, UInt32, Win32cr::Media::DeviceManager::OPAQUECOMMAND*, Win32cr::Foundation::HRESULT),
    end3 : Proc(IWMDMProgress3*, LibC::GUID, Win32cr::Foundation::HRESULT, Win32cr::Media::DeviceManager::OPAQUECOMMAND*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMDMProgress3, lpVtbl : IWMDMProgress3Vtbl* do
    GUID = LibC::GUID.new(0x21de01cb_u32, 0x3bb4_u16, 0x4929_u16, StaticArray[0xb2_u8, 0x1a_u8, 0x17_u8, 0xaf_u8, 0x3f_u8, 0x80_u8, 0xf6_u8, 0x58_u8])
    def query_interface(this : IWMDMProgress3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMDMProgress3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMDMProgress3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def begin__(this : IWMDMProgress3*, dwEstimatedTicks : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin__.call(this, dwEstimatedTicks)
    end
    def progress(this : IWMDMProgress3*, dwTranspiredTicks : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.progress.call(this, dwTranspiredTicks)
    end
    def end__(this : IWMDMProgress3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end__.call(this)
    end
    def end2(this : IWMDMProgress3*, hrCompletionCode : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end2.call(this, hrCompletionCode)
    end
    def begin3(this : IWMDMProgress3*, event_id : LibC::GUID, dwEstimatedTicks : UInt32, pContext : Win32cr::Media::DeviceManager::OPAQUECOMMAND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin3.call(this, event_id, dwEstimatedTicks, pContext)
    end
    def progress3(this : IWMDMProgress3*, event_id : LibC::GUID, dwTranspiredTicks : UInt32, pContext : Win32cr::Media::DeviceManager::OPAQUECOMMAND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.progress3.call(this, event_id, dwTranspiredTicks, pContext)
    end
    def end3(this : IWMDMProgress3*, event_id : LibC::GUID, hrCompletionCode : Win32cr::Foundation::HRESULT, pContext : Win32cr::Media::DeviceManager::OPAQUECOMMAND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end3.call(this, event_id, hrCompletionCode, pContext)
    end

  end

  @[Extern]
  record IWMDMDeviceVtbl,
    query_interface : Proc(IWMDMDevice*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMDMDevice*, UInt32),
    release : Proc(IWMDMDevice*, UInt32),
    get_name : Proc(IWMDMDevice*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    get_manufacturer : Proc(IWMDMDevice*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    get_version : Proc(IWMDMDevice*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type : Proc(IWMDMDevice*, UInt32*, Win32cr::Foundation::HRESULT),
    get_serial_number : Proc(IWMDMDevice*, Win32cr::Media::DeviceManager::WMDMID*, UInt8*, Win32cr::Foundation::HRESULT),
    get_power_source : Proc(IWMDMDevice*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_status : Proc(IWMDMDevice*, UInt32*, Win32cr::Foundation::HRESULT),
    get_device_icon : Proc(IWMDMDevice*, UInt32*, Win32cr::Foundation::HRESULT),
    enum_storage : Proc(IWMDMDevice*, Void**, Win32cr::Foundation::HRESULT),
    get_format_support : Proc(IWMDMDevice*, Win32cr::Media::Audio::WAVEFORMATEX**, UInt32*, Win32cr::Foundation::PWSTR**, UInt32*, Win32cr::Foundation::HRESULT),
    send_opaque_command : Proc(IWMDMDevice*, Win32cr::Media::DeviceManager::OPAQUECOMMAND*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMDMDevice, lpVtbl : IWMDMDeviceVtbl* do
    GUID = LibC::GUID.new(0x1dcb3a02_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
    def query_interface(this : IWMDMDevice*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMDMDevice*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMDMDevice*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_name(this : IWMDMDevice*, pwszName : UInt16*, nMaxChars : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, pwszName, nMaxChars)
    end
    def get_manufacturer(this : IWMDMDevice*, pwszName : UInt16*, nMaxChars : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_manufacturer.call(this, pwszName, nMaxChars)
    end
    def get_version(this : IWMDMDevice*, pdwVersion : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version.call(this, pdwVersion)
    end
    def get_type(this : IWMDMDevice*, pdwType : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, pdwType)
    end
    def get_serial_number(this : IWMDMDevice*, pSerialNumber : Win32cr::Media::DeviceManager::WMDMID*, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_serial_number.call(this, pSerialNumber, abMac)
    end
    def get_power_source(this : IWMDMDevice*, pdwPowerSource : UInt32*, pdwPercentRemaining : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_power_source.call(this, pdwPowerSource, pdwPercentRemaining)
    end
    def get_status(this : IWMDMDevice*, pdwStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, pdwStatus)
    end
    def get_device_icon(this : IWMDMDevice*, hIcon : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_icon.call(this, hIcon)
    end
    def enum_storage(this : IWMDMDevice*, ppEnumStorage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_storage.call(this, ppEnumStorage)
    end
    def get_format_support(this : IWMDMDevice*, ppFormatEx : Win32cr::Media::Audio::WAVEFORMATEX**, pnFormatCount : UInt32*, pppwszMimeType : Win32cr::Foundation::PWSTR**, pnMimeTypeCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_format_support.call(this, ppFormatEx, pnFormatCount, pppwszMimeType, pnMimeTypeCount)
    end
    def send_opaque_command(this : IWMDMDevice*, pCommand : Win32cr::Media::DeviceManager::OPAQUECOMMAND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_opaque_command.call(this, pCommand)
    end

  end

  @[Extern]
  record IWMDMDevice2Vtbl,
    query_interface : Proc(IWMDMDevice2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMDMDevice2*, UInt32),
    release : Proc(IWMDMDevice2*, UInt32),
    get_name : Proc(IWMDMDevice2*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    get_manufacturer : Proc(IWMDMDevice2*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    get_version : Proc(IWMDMDevice2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type : Proc(IWMDMDevice2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_serial_number : Proc(IWMDMDevice2*, Win32cr::Media::DeviceManager::WMDMID*, UInt8*, Win32cr::Foundation::HRESULT),
    get_power_source : Proc(IWMDMDevice2*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_status : Proc(IWMDMDevice2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_device_icon : Proc(IWMDMDevice2*, UInt32*, Win32cr::Foundation::HRESULT),
    enum_storage : Proc(IWMDMDevice2*, Void**, Win32cr::Foundation::HRESULT),
    get_format_support : Proc(IWMDMDevice2*, Win32cr::Media::Audio::WAVEFORMATEX**, UInt32*, Win32cr::Foundation::PWSTR**, UInt32*, Win32cr::Foundation::HRESULT),
    send_opaque_command : Proc(IWMDMDevice2*, Win32cr::Media::DeviceManager::OPAQUECOMMAND*, Win32cr::Foundation::HRESULT),
    get_storage : Proc(IWMDMDevice2*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    get_format_support2 : Proc(IWMDMDevice2*, UInt32, Win32cr::Media::Audio::WAVEFORMATEX**, UInt32*, Win32cr::Media::MediaFoundation::VIDEOINFOHEADER**, UInt32*, Win32cr::Media::DeviceManager::WMFILECAPABILITIES**, UInt32*, Win32cr::Foundation::HRESULT),
    get_specify_property_pages : Proc(IWMDMDevice2*, Void**, Void***, UInt32*, Win32cr::Foundation::HRESULT),
    get_canonical_name : Proc(IWMDMDevice2*, UInt16*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMDMDevice2, lpVtbl : IWMDMDevice2Vtbl* do
    GUID = LibC::GUID.new(0xe34f3d37_u32, 0x9d67_u16, 0x4fc1_u16, StaticArray[0x92_u8, 0x52_u8, 0x62_u8, 0xd2_u8, 0x8b_u8, 0x2f_u8, 0x8b_u8, 0x55_u8])
    def query_interface(this : IWMDMDevice2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMDMDevice2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMDMDevice2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_name(this : IWMDMDevice2*, pwszName : UInt16*, nMaxChars : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, pwszName, nMaxChars)
    end
    def get_manufacturer(this : IWMDMDevice2*, pwszName : UInt16*, nMaxChars : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_manufacturer.call(this, pwszName, nMaxChars)
    end
    def get_version(this : IWMDMDevice2*, pdwVersion : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version.call(this, pdwVersion)
    end
    def get_type(this : IWMDMDevice2*, pdwType : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, pdwType)
    end
    def get_serial_number(this : IWMDMDevice2*, pSerialNumber : Win32cr::Media::DeviceManager::WMDMID*, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_serial_number.call(this, pSerialNumber, abMac)
    end
    def get_power_source(this : IWMDMDevice2*, pdwPowerSource : UInt32*, pdwPercentRemaining : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_power_source.call(this, pdwPowerSource, pdwPercentRemaining)
    end
    def get_status(this : IWMDMDevice2*, pdwStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, pdwStatus)
    end
    def get_device_icon(this : IWMDMDevice2*, hIcon : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_icon.call(this, hIcon)
    end
    def enum_storage(this : IWMDMDevice2*, ppEnumStorage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_storage.call(this, ppEnumStorage)
    end
    def get_format_support(this : IWMDMDevice2*, ppFormatEx : Win32cr::Media::Audio::WAVEFORMATEX**, pnFormatCount : UInt32*, pppwszMimeType : Win32cr::Foundation::PWSTR**, pnMimeTypeCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_format_support.call(this, ppFormatEx, pnFormatCount, pppwszMimeType, pnMimeTypeCount)
    end
    def send_opaque_command(this : IWMDMDevice2*, pCommand : Win32cr::Media::DeviceManager::OPAQUECOMMAND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_opaque_command.call(this, pCommand)
    end
    def get_storage(this : IWMDMDevice2*, pszStorageName : Win32cr::Foundation::PWSTR, ppStorage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_storage.call(this, pszStorageName, ppStorage)
    end
    def get_format_support2(this : IWMDMDevice2*, dwFlags : UInt32, ppAudioFormatEx : Win32cr::Media::Audio::WAVEFORMATEX**, pnAudioFormatCount : UInt32*, ppVideoFormatEx : Win32cr::Media::MediaFoundation::VIDEOINFOHEADER**, pnVideoFormatCount : UInt32*, ppFileType : Win32cr::Media::DeviceManager::WMFILECAPABILITIES**, pnFileTypeCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_format_support2.call(this, dwFlags, ppAudioFormatEx, pnAudioFormatCount, ppVideoFormatEx, pnVideoFormatCount, ppFileType, pnFileTypeCount)
    end
    def get_specify_property_pages(this : IWMDMDevice2*, ppSpecifyPropPages : Void**, pppUnknowns : Void***, pcUnks : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_specify_property_pages.call(this, ppSpecifyPropPages, pppUnknowns, pcUnks)
    end
    def get_canonical_name(this : IWMDMDevice2*, pwszPnPName : UInt16*, nMaxChars : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_canonical_name.call(this, pwszPnPName, nMaxChars)
    end

  end

  @[Extern]
  record IWMDMDevice3Vtbl,
    query_interface : Proc(IWMDMDevice3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMDMDevice3*, UInt32),
    release : Proc(IWMDMDevice3*, UInt32),
    get_name : Proc(IWMDMDevice3*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    get_manufacturer : Proc(IWMDMDevice3*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    get_version : Proc(IWMDMDevice3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type : Proc(IWMDMDevice3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_serial_number : Proc(IWMDMDevice3*, Win32cr::Media::DeviceManager::WMDMID*, UInt8*, Win32cr::Foundation::HRESULT),
    get_power_source : Proc(IWMDMDevice3*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_status : Proc(IWMDMDevice3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_device_icon : Proc(IWMDMDevice3*, UInt32*, Win32cr::Foundation::HRESULT),
    enum_storage : Proc(IWMDMDevice3*, Void**, Win32cr::Foundation::HRESULT),
    get_format_support : Proc(IWMDMDevice3*, Win32cr::Media::Audio::WAVEFORMATEX**, UInt32*, Win32cr::Foundation::PWSTR**, UInt32*, Win32cr::Foundation::HRESULT),
    send_opaque_command : Proc(IWMDMDevice3*, Win32cr::Media::DeviceManager::OPAQUECOMMAND*, Win32cr::Foundation::HRESULT),
    get_storage : Proc(IWMDMDevice3*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    get_format_support2 : Proc(IWMDMDevice3*, UInt32, Win32cr::Media::Audio::WAVEFORMATEX**, UInt32*, Win32cr::Media::MediaFoundation::VIDEOINFOHEADER**, UInt32*, Win32cr::Media::DeviceManager::WMFILECAPABILITIES**, UInt32*, Win32cr::Foundation::HRESULT),
    get_specify_property_pages : Proc(IWMDMDevice3*, Void**, Void***, UInt32*, Win32cr::Foundation::HRESULT),
    get_canonical_name : Proc(IWMDMDevice3*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    get_property : Proc(IWMDMDevice3*, Win32cr::Foundation::PWSTR, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    set_property : Proc(IWMDMDevice3*, Win32cr::Foundation::PWSTR, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    get_format_capability : Proc(IWMDMDevice3*, Win32cr::Media::DeviceManager::WMDM_FORMATCODE, Win32cr::Media::DeviceManager::WMDM_FORMAT_CAPABILITY*, Win32cr::Foundation::HRESULT),
    device_io_control : Proc(IWMDMDevice3*, UInt32, UInt8*, UInt32, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    find_storage : Proc(IWMDMDevice3*, Win32cr::Media::DeviceManager::WMDM_FIND_SCOPE, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMDMDevice3, lpVtbl : IWMDMDevice3Vtbl* do
    GUID = LibC::GUID.new(0x6c03e4fe_u32, 0x5db_u16, 0x4dda_u16, StaticArray[0x9e_u8, 0x3c_u8, 0x6_u8, 0x23_u8, 0x3a_u8, 0x6d_u8, 0x5d_u8, 0x65_u8])
    def query_interface(this : IWMDMDevice3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMDMDevice3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMDMDevice3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_name(this : IWMDMDevice3*, pwszName : UInt16*, nMaxChars : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, pwszName, nMaxChars)
    end
    def get_manufacturer(this : IWMDMDevice3*, pwszName : UInt16*, nMaxChars : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_manufacturer.call(this, pwszName, nMaxChars)
    end
    def get_version(this : IWMDMDevice3*, pdwVersion : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version.call(this, pdwVersion)
    end
    def get_type(this : IWMDMDevice3*, pdwType : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, pdwType)
    end
    def get_serial_number(this : IWMDMDevice3*, pSerialNumber : Win32cr::Media::DeviceManager::WMDMID*, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_serial_number.call(this, pSerialNumber, abMac)
    end
    def get_power_source(this : IWMDMDevice3*, pdwPowerSource : UInt32*, pdwPercentRemaining : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_power_source.call(this, pdwPowerSource, pdwPercentRemaining)
    end
    def get_status(this : IWMDMDevice3*, pdwStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, pdwStatus)
    end
    def get_device_icon(this : IWMDMDevice3*, hIcon : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_icon.call(this, hIcon)
    end
    def enum_storage(this : IWMDMDevice3*, ppEnumStorage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_storage.call(this, ppEnumStorage)
    end
    def get_format_support(this : IWMDMDevice3*, ppFormatEx : Win32cr::Media::Audio::WAVEFORMATEX**, pnFormatCount : UInt32*, pppwszMimeType : Win32cr::Foundation::PWSTR**, pnMimeTypeCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_format_support.call(this, ppFormatEx, pnFormatCount, pppwszMimeType, pnMimeTypeCount)
    end
    def send_opaque_command(this : IWMDMDevice3*, pCommand : Win32cr::Media::DeviceManager::OPAQUECOMMAND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_opaque_command.call(this, pCommand)
    end
    def get_storage(this : IWMDMDevice3*, pszStorageName : Win32cr::Foundation::PWSTR, ppStorage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_storage.call(this, pszStorageName, ppStorage)
    end
    def get_format_support2(this : IWMDMDevice3*, dwFlags : UInt32, ppAudioFormatEx : Win32cr::Media::Audio::WAVEFORMATEX**, pnAudioFormatCount : UInt32*, ppVideoFormatEx : Win32cr::Media::MediaFoundation::VIDEOINFOHEADER**, pnVideoFormatCount : UInt32*, ppFileType : Win32cr::Media::DeviceManager::WMFILECAPABILITIES**, pnFileTypeCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_format_support2.call(this, dwFlags, ppAudioFormatEx, pnAudioFormatCount, ppVideoFormatEx, pnVideoFormatCount, ppFileType, pnFileTypeCount)
    end
    def get_specify_property_pages(this : IWMDMDevice3*, ppSpecifyPropPages : Void**, pppUnknowns : Void***, pcUnks : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_specify_property_pages.call(this, ppSpecifyPropPages, pppUnknowns, pcUnks)
    end
    def get_canonical_name(this : IWMDMDevice3*, pwszPnPName : UInt16*, nMaxChars : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_canonical_name.call(this, pwszPnPName, nMaxChars)
    end
    def get_property(this : IWMDMDevice3*, pwszPropName : Win32cr::Foundation::PWSTR, pValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, pwszPropName, pValue)
    end
    def set_property(this : IWMDMDevice3*, pwszPropName : Win32cr::Foundation::PWSTR, pValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, pwszPropName, pValue)
    end
    def get_format_capability(this : IWMDMDevice3*, format : Win32cr::Media::DeviceManager::WMDM_FORMATCODE, pFormatSupport : Win32cr::Media::DeviceManager::WMDM_FORMAT_CAPABILITY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_format_capability.call(this, format, pFormatSupport)
    end
    def device_io_control(this : IWMDMDevice3*, dwIoControlCode : UInt32, lpInBuffer : UInt8*, nInBufferSize : UInt32, lpOutBuffer : UInt8*, pnOutBufferSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.device_io_control.call(this, dwIoControlCode, lpInBuffer, nInBufferSize, lpOutBuffer, pnOutBufferSize)
    end
    def find_storage(this : IWMDMDevice3*, findScope : Win32cr::Media::DeviceManager::WMDM_FIND_SCOPE, pwszUniqueID : Win32cr::Foundation::PWSTR, ppStorage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_storage.call(this, findScope, pwszUniqueID, ppStorage)
    end

  end

  @[Extern]
  record IWMDMDeviceSessionVtbl,
    query_interface : Proc(IWMDMDeviceSession*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMDMDeviceSession*, UInt32),
    release : Proc(IWMDMDeviceSession*, UInt32),
    begin_session : Proc(IWMDMDeviceSession*, Win32cr::Media::DeviceManager::WMDM_SESSION_TYPE, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    end_session : Proc(IWMDMDeviceSession*, Win32cr::Media::DeviceManager::WMDM_SESSION_TYPE, UInt8*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMDMDeviceSession, lpVtbl : IWMDMDeviceSessionVtbl* do
    GUID = LibC::GUID.new(0x82af0a65_u32, 0x9d96_u16, 0x412c_u16, StaticArray[0x83_u8, 0xe5_u8, 0x3c_u8, 0x43_u8, 0xe4_u8, 0xb0_u8, 0x6c_u8, 0xc7_u8])
    def query_interface(this : IWMDMDeviceSession*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMDMDeviceSession*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMDMDeviceSession*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def begin_session(this : IWMDMDeviceSession*, type__ : Win32cr::Media::DeviceManager::WMDM_SESSION_TYPE, pCtx : UInt8*, dwSizeCtx : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_session.call(this, type__, pCtx, dwSizeCtx)
    end
    def end_session(this : IWMDMDeviceSession*, type__ : Win32cr::Media::DeviceManager::WMDM_SESSION_TYPE, pCtx : UInt8*, dwSizeCtx : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_session.call(this, type__, pCtx, dwSizeCtx)
    end

  end

  @[Extern]
  record IWMDMEnumDeviceVtbl,
    query_interface : Proc(IWMDMEnumDevice*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMDMEnumDevice*, UInt32),
    release : Proc(IWMDMEnumDevice*, UInt32),
    next__ : Proc(IWMDMEnumDevice*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IWMDMEnumDevice*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    reset : Proc(IWMDMEnumDevice*, Win32cr::Foundation::HRESULT),
    clone : Proc(IWMDMEnumDevice*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMDMEnumDevice, lpVtbl : IWMDMEnumDeviceVtbl* do
    GUID = LibC::GUID.new(0x1dcb3a01_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
    def query_interface(this : IWMDMEnumDevice*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMDMEnumDevice*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMDMEnumDevice*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IWMDMEnumDevice*, celt : UInt32, ppDevice : Void**, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, ppDevice, pceltFetched)
    end
    def skip(this : IWMDMEnumDevice*, celt : UInt32, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt, pceltFetched)
    end
    def reset(this : IWMDMEnumDevice*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IWMDMEnumDevice*, ppEnumDevice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnumDevice)
    end

  end

  @[Extern]
  record IWMDMDeviceControlVtbl,
    query_interface : Proc(IWMDMDeviceControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMDMDeviceControl*, UInt32),
    release : Proc(IWMDMDeviceControl*, UInt32),
    get_status : Proc(IWMDMDeviceControl*, UInt32*, Win32cr::Foundation::HRESULT),
    get_capabilities : Proc(IWMDMDeviceControl*, UInt32*, Win32cr::Foundation::HRESULT),
    play : Proc(IWMDMDeviceControl*, Win32cr::Foundation::HRESULT),
    record : Proc(IWMDMDeviceControl*, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Foundation::HRESULT),
    pause : Proc(IWMDMDeviceControl*, Win32cr::Foundation::HRESULT),
    resume : Proc(IWMDMDeviceControl*, Win32cr::Foundation::HRESULT),
    stop : Proc(IWMDMDeviceControl*, Win32cr::Foundation::HRESULT),
    seek : Proc(IWMDMDeviceControl*, UInt32, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMDMDeviceControl, lpVtbl : IWMDMDeviceControlVtbl* do
    GUID = LibC::GUID.new(0x1dcb3a04_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
    def query_interface(this : IWMDMDeviceControl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMDMDeviceControl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMDMDeviceControl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_status(this : IWMDMDeviceControl*, pdwStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, pdwStatus)
    end
    def get_capabilities(this : IWMDMDeviceControl*, pdwCapabilitiesMask : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_capabilities.call(this, pdwCapabilitiesMask)
    end
    def play(this : IWMDMDeviceControl*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.play.call(this)
    end
    def record(this : IWMDMDeviceControl*, pFormat : Win32cr::Media::Audio::WAVEFORMATEX*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.record.call(this, pFormat)
    end
    def pause(this : IWMDMDeviceControl*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pause.call(this)
    end
    def resume(this : IWMDMDeviceControl*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume.call(this)
    end
    def stop(this : IWMDMDeviceControl*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop.call(this)
    end
    def seek(this : IWMDMDeviceControl*, fuMode : UInt32, nOffset : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.seek.call(this, fuMode, nOffset)
    end

  end

  @[Extern]
  record IWMDMEnumStorageVtbl,
    query_interface : Proc(IWMDMEnumStorage*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMDMEnumStorage*, UInt32),
    release : Proc(IWMDMEnumStorage*, UInt32),
    next__ : Proc(IWMDMEnumStorage*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IWMDMEnumStorage*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    reset : Proc(IWMDMEnumStorage*, Win32cr::Foundation::HRESULT),
    clone : Proc(IWMDMEnumStorage*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMDMEnumStorage, lpVtbl : IWMDMEnumStorageVtbl* do
    GUID = LibC::GUID.new(0x1dcb3a05_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
    def query_interface(this : IWMDMEnumStorage*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMDMEnumStorage*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMDMEnumStorage*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IWMDMEnumStorage*, celt : UInt32, ppStorage : Void**, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, ppStorage, pceltFetched)
    end
    def skip(this : IWMDMEnumStorage*, celt : UInt32, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt, pceltFetched)
    end
    def reset(this : IWMDMEnumStorage*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IWMDMEnumStorage*, ppEnumStorage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnumStorage)
    end

  end

  @[Extern]
  record IWMDMStorageControlVtbl,
    query_interface : Proc(IWMDMStorageControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMDMStorageControl*, UInt32),
    release : Proc(IWMDMStorageControl*, UInt32),
    insert : Proc(IWMDMStorageControl*, UInt32, Win32cr::Foundation::PWSTR, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    delete : Proc(IWMDMStorageControl*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    rename : Proc(IWMDMStorageControl*, UInt32, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::HRESULT),
    read : Proc(IWMDMStorageControl*, UInt32, Win32cr::Foundation::PWSTR, Void*, Void*, Win32cr::Foundation::HRESULT),
    move : Proc(IWMDMStorageControl*, UInt32, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMDMStorageControl, lpVtbl : IWMDMStorageControlVtbl* do
    GUID = LibC::GUID.new(0x1dcb3a08_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
    def query_interface(this : IWMDMStorageControl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMDMStorageControl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMDMStorageControl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def insert(this : IWMDMStorageControl*, fuMode : UInt32, pwszFile : Win32cr::Foundation::PWSTR, pOperation : Void*, pProgress : Void*, ppNewObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert.call(this, fuMode, pwszFile, pOperation, pProgress, ppNewObject)
    end
    def delete(this : IWMDMStorageControl*, fuMode : UInt32, pProgress : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this, fuMode, pProgress)
    end
    def rename(this : IWMDMStorageControl*, fuMode : UInt32, pwszNewName : Win32cr::Foundation::PWSTR, pProgress : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.rename.call(this, fuMode, pwszNewName, pProgress)
    end
    def read(this : IWMDMStorageControl*, fuMode : UInt32, pwszFile : Win32cr::Foundation::PWSTR, pProgress : Void*, pOperation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read.call(this, fuMode, pwszFile, pProgress, pOperation)
    end
    def move(this : IWMDMStorageControl*, fuMode : UInt32, pTargetObject : Void*, pProgress : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move.call(this, fuMode, pTargetObject, pProgress)
    end

  end

  @[Extern]
  record IWMDMStorageControl2Vtbl,
    query_interface : Proc(IWMDMStorageControl2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMDMStorageControl2*, UInt32),
    release : Proc(IWMDMStorageControl2*, UInt32),
    insert : Proc(IWMDMStorageControl2*, UInt32, Win32cr::Foundation::PWSTR, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    delete : Proc(IWMDMStorageControl2*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    rename : Proc(IWMDMStorageControl2*, UInt32, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::HRESULT),
    read : Proc(IWMDMStorageControl2*, UInt32, Win32cr::Foundation::PWSTR, Void*, Void*, Win32cr::Foundation::HRESULT),
    move : Proc(IWMDMStorageControl2*, UInt32, Void*, Void*, Win32cr::Foundation::HRESULT),
    insert2 : Proc(IWMDMStorageControl2*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Void*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMDMStorageControl2, lpVtbl : IWMDMStorageControl2Vtbl* do
    GUID = LibC::GUID.new(0x972c2e88_u32, 0xbd6c_u16, 0x4125_u16, StaticArray[0x8e_u8, 0x9_u8, 0x84_u8, 0xf8_u8, 0x37_u8, 0xe6_u8, 0x37_u8, 0xb6_u8])
    def query_interface(this : IWMDMStorageControl2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMDMStorageControl2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMDMStorageControl2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def insert(this : IWMDMStorageControl2*, fuMode : UInt32, pwszFile : Win32cr::Foundation::PWSTR, pOperation : Void*, pProgress : Void*, ppNewObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert.call(this, fuMode, pwszFile, pOperation, pProgress, ppNewObject)
    end
    def delete(this : IWMDMStorageControl2*, fuMode : UInt32, pProgress : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this, fuMode, pProgress)
    end
    def rename(this : IWMDMStorageControl2*, fuMode : UInt32, pwszNewName : Win32cr::Foundation::PWSTR, pProgress : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.rename.call(this, fuMode, pwszNewName, pProgress)
    end
    def read(this : IWMDMStorageControl2*, fuMode : UInt32, pwszFile : Win32cr::Foundation::PWSTR, pProgress : Void*, pOperation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read.call(this, fuMode, pwszFile, pProgress, pOperation)
    end
    def move(this : IWMDMStorageControl2*, fuMode : UInt32, pTargetObject : Void*, pProgress : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move.call(this, fuMode, pTargetObject, pProgress)
    end
    def insert2(this : IWMDMStorageControl2*, fuMode : UInt32, pwszFileSource : Win32cr::Foundation::PWSTR, pwszFileDest : Win32cr::Foundation::PWSTR, pOperation : Void*, pProgress : Void*, pUnknown : Void*, ppNewObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert2.call(this, fuMode, pwszFileSource, pwszFileDest, pOperation, pProgress, pUnknown, ppNewObject)
    end

  end

  @[Extern]
  record IWMDMStorageControl3Vtbl,
    query_interface : Proc(IWMDMStorageControl3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMDMStorageControl3*, UInt32),
    release : Proc(IWMDMStorageControl3*, UInt32),
    insert : Proc(IWMDMStorageControl3*, UInt32, Win32cr::Foundation::PWSTR, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    delete : Proc(IWMDMStorageControl3*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    rename : Proc(IWMDMStorageControl3*, UInt32, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::HRESULT),
    read : Proc(IWMDMStorageControl3*, UInt32, Win32cr::Foundation::PWSTR, Void*, Void*, Win32cr::Foundation::HRESULT),
    move : Proc(IWMDMStorageControl3*, UInt32, Void*, Void*, Win32cr::Foundation::HRESULT),
    insert2 : Proc(IWMDMStorageControl3*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Void*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    insert3 : Proc(IWMDMStorageControl3*, UInt32, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Void*, Void*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMDMStorageControl3, lpVtbl : IWMDMStorageControl3Vtbl* do
    GUID = LibC::GUID.new(0xb3266365_u32, 0xd4f3_u16, 0x4696_u16, StaticArray[0x8d_u8, 0x53_u8, 0xbd_u8, 0x27_u8, 0xec_u8, 0x60_u8, 0x99_u8, 0x3a_u8])
    def query_interface(this : IWMDMStorageControl3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMDMStorageControl3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMDMStorageControl3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def insert(this : IWMDMStorageControl3*, fuMode : UInt32, pwszFile : Win32cr::Foundation::PWSTR, pOperation : Void*, pProgress : Void*, ppNewObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert.call(this, fuMode, pwszFile, pOperation, pProgress, ppNewObject)
    end
    def delete(this : IWMDMStorageControl3*, fuMode : UInt32, pProgress : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this, fuMode, pProgress)
    end
    def rename(this : IWMDMStorageControl3*, fuMode : UInt32, pwszNewName : Win32cr::Foundation::PWSTR, pProgress : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.rename.call(this, fuMode, pwszNewName, pProgress)
    end
    def read(this : IWMDMStorageControl3*, fuMode : UInt32, pwszFile : Win32cr::Foundation::PWSTR, pProgress : Void*, pOperation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read.call(this, fuMode, pwszFile, pProgress, pOperation)
    end
    def move(this : IWMDMStorageControl3*, fuMode : UInt32, pTargetObject : Void*, pProgress : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move.call(this, fuMode, pTargetObject, pProgress)
    end
    def insert2(this : IWMDMStorageControl3*, fuMode : UInt32, pwszFileSource : Win32cr::Foundation::PWSTR, pwszFileDest : Win32cr::Foundation::PWSTR, pOperation : Void*, pProgress : Void*, pUnknown : Void*, ppNewObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert2.call(this, fuMode, pwszFileSource, pwszFileDest, pOperation, pProgress, pUnknown, ppNewObject)
    end
    def insert3(this : IWMDMStorageControl3*, fuMode : UInt32, fuType : UInt32, pwszFileSource : Win32cr::Foundation::PWSTR, pwszFileDest : Win32cr::Foundation::PWSTR, pOperation : Void*, pProgress : Void*, pMetaData : Void*, pUnknown : Void*, ppNewObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert3.call(this, fuMode, fuType, pwszFileSource, pwszFileDest, pOperation, pProgress, pMetaData, pUnknown, ppNewObject)
    end

  end

  @[Extern]
  record IWMDMObjectInfoVtbl,
    query_interface : Proc(IWMDMObjectInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMDMObjectInfo*, UInt32),
    release : Proc(IWMDMObjectInfo*, UInt32),
    get_play_length : Proc(IWMDMObjectInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    set_play_length : Proc(IWMDMObjectInfo*, UInt32, Win32cr::Foundation::HRESULT),
    get_play_offset : Proc(IWMDMObjectInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    set_play_offset : Proc(IWMDMObjectInfo*, UInt32, Win32cr::Foundation::HRESULT),
    get_total_length : Proc(IWMDMObjectInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_last_play_position : Proc(IWMDMObjectInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_longest_play_position : Proc(IWMDMObjectInfo*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMDMObjectInfo, lpVtbl : IWMDMObjectInfoVtbl* do
    GUID = LibC::GUID.new(0x1dcb3a09_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
    def query_interface(this : IWMDMObjectInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMDMObjectInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMDMObjectInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_play_length(this : IWMDMObjectInfo*, pdwLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_play_length.call(this, pdwLength)
    end
    def set_play_length(this : IWMDMObjectInfo*, dwLength : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_play_length.call(this, dwLength)
    end
    def get_play_offset(this : IWMDMObjectInfo*, pdwOffset : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_play_offset.call(this, pdwOffset)
    end
    def set_play_offset(this : IWMDMObjectInfo*, dwOffset : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_play_offset.call(this, dwOffset)
    end
    def get_total_length(this : IWMDMObjectInfo*, pdwLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_total_length.call(this, pdwLength)
    end
    def get_last_play_position(this : IWMDMObjectInfo*, pdwLastPos : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_last_play_position.call(this, pdwLastPos)
    end
    def get_longest_play_position(this : IWMDMObjectInfo*, pdwLongestPos : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_longest_play_position.call(this, pdwLongestPos)
    end

  end

  @[Extern]
  record IWMDMRevokedVtbl,
    query_interface : Proc(IWMDMRevoked*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMDMRevoked*, UInt32),
    release : Proc(IWMDMRevoked*, UInt32),
    get_revocation_url : Proc(IWMDMRevoked*, Win32cr::Foundation::PWSTR*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMDMRevoked, lpVtbl : IWMDMRevokedVtbl* do
    GUID = LibC::GUID.new(0xebeccedb_u32, 0x88ee_u16, 0x4e55_u16, StaticArray[0xb6_u8, 0xa4_u8, 0x8d_u8, 0x9f_u8, 0x7_u8, 0xd6_u8, 0x96_u8, 0xaa_u8])
    def query_interface(this : IWMDMRevoked*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMDMRevoked*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMDMRevoked*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_revocation_url(this : IWMDMRevoked*, ppwszRevocationURL : Win32cr::Foundation::PWSTR*, pdwBufferLen : UInt32*, pdwRevokedBitFlag : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_revocation_url.call(this, ppwszRevocationURL, pdwBufferLen, pdwRevokedBitFlag)
    end

  end

  @[Extern]
  record IWMDMNotificationVtbl,
    query_interface : Proc(IWMDMNotification*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMDMNotification*, UInt32),
    release : Proc(IWMDMNotification*, UInt32),
    wmdm_message : Proc(IWMDMNotification*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMDMNotification, lpVtbl : IWMDMNotificationVtbl* do
    GUID = LibC::GUID.new(0x3f5e95c0_u32, 0xf43_u16, 0x4ed4_u16, StaticArray[0x93_u8, 0xd2_u8, 0xc8_u8, 0x9a_u8, 0x45_u8, 0xd5_u8, 0x9b_u8, 0x81_u8])
    def query_interface(this : IWMDMNotification*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMDMNotification*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMDMNotification*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def wmdm_message(this : IWMDMNotification*, dwMessageType : UInt32, pwszCanonicalName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wmdm_message.call(this, dwMessageType, pwszCanonicalName)
    end

  end

  @[Extern]
  record IMDServiceProviderVtbl,
    query_interface : Proc(IMDServiceProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMDServiceProvider*, UInt32),
    release : Proc(IMDServiceProvider*, UInt32),
    get_device_count : Proc(IMDServiceProvider*, UInt32*, Win32cr::Foundation::HRESULT),
    enum_devices : Proc(IMDServiceProvider*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMDServiceProvider, lpVtbl : IMDServiceProviderVtbl* do
    GUID = LibC::GUID.new(0x1dcb3a10_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
    def query_interface(this : IMDServiceProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMDServiceProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMDServiceProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_device_count(this : IMDServiceProvider*, pdwCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_count.call(this, pdwCount)
    end
    def enum_devices(this : IMDServiceProvider*, ppEnumDevice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_devices.call(this, ppEnumDevice)
    end

  end

  @[Extern]
  record IMDServiceProvider2Vtbl,
    query_interface : Proc(IMDServiceProvider2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMDServiceProvider2*, UInt32),
    release : Proc(IMDServiceProvider2*, UInt32),
    get_device_count : Proc(IMDServiceProvider2*, UInt32*, Win32cr::Foundation::HRESULT),
    enum_devices : Proc(IMDServiceProvider2*, Void**, Win32cr::Foundation::HRESULT),
    create_device : Proc(IMDServiceProvider2*, Win32cr::Foundation::PWSTR, UInt32*, Void***, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMDServiceProvider2, lpVtbl : IMDServiceProvider2Vtbl* do
    GUID = LibC::GUID.new(0xb2fa24b7_u32, 0xcda3_u16, 0x4694_u16, StaticArray[0x98_u8, 0x62_u8, 0x41_u8, 0x3a_u8, 0xe1_u8, 0xa3_u8, 0x48_u8, 0x19_u8])
    def query_interface(this : IMDServiceProvider2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMDServiceProvider2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMDServiceProvider2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_device_count(this : IMDServiceProvider2*, pdwCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_count.call(this, pdwCount)
    end
    def enum_devices(this : IMDServiceProvider2*, ppEnumDevice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_devices.call(this, ppEnumDevice)
    end
    def create_device(this : IMDServiceProvider2*, pwszDevicePath : Win32cr::Foundation::PWSTR, pdwCount : UInt32*, pppDeviceArray : Void***) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_device.call(this, pwszDevicePath, pdwCount, pppDeviceArray)
    end

  end

  @[Extern]
  record IMDServiceProvider3Vtbl,
    query_interface : Proc(IMDServiceProvider3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMDServiceProvider3*, UInt32),
    release : Proc(IMDServiceProvider3*, UInt32),
    get_device_count : Proc(IMDServiceProvider3*, UInt32*, Win32cr::Foundation::HRESULT),
    enum_devices : Proc(IMDServiceProvider3*, Void**, Win32cr::Foundation::HRESULT),
    create_device : Proc(IMDServiceProvider3*, Win32cr::Foundation::PWSTR, UInt32*, Void***, Win32cr::Foundation::HRESULT),
    set_device_enum_preference : Proc(IMDServiceProvider3*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMDServiceProvider3, lpVtbl : IMDServiceProvider3Vtbl* do
    GUID = LibC::GUID.new(0x4ed13ef3_u32, 0xa971_u16, 0x4d19_u16, StaticArray[0x9f_u8, 0x51_u8, 0xe_u8, 0x18_u8, 0x26_u8, 0xb2_u8, 0xda_u8, 0x57_u8])
    def query_interface(this : IMDServiceProvider3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMDServiceProvider3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMDServiceProvider3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_device_count(this : IMDServiceProvider3*, pdwCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_count.call(this, pdwCount)
    end
    def enum_devices(this : IMDServiceProvider3*, ppEnumDevice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_devices.call(this, ppEnumDevice)
    end
    def create_device(this : IMDServiceProvider3*, pwszDevicePath : Win32cr::Foundation::PWSTR, pdwCount : UInt32*, pppDeviceArray : Void***) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_device.call(this, pwszDevicePath, pdwCount, pppDeviceArray)
    end
    def set_device_enum_preference(this : IMDServiceProvider3*, dwEnumPref : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_device_enum_preference.call(this, dwEnumPref)
    end

  end

  @[Extern]
  record IMDSPEnumDeviceVtbl,
    query_interface : Proc(IMDSPEnumDevice*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMDSPEnumDevice*, UInt32),
    release : Proc(IMDSPEnumDevice*, UInt32),
    next__ : Proc(IMDSPEnumDevice*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IMDSPEnumDevice*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    reset : Proc(IMDSPEnumDevice*, Win32cr::Foundation::HRESULT),
    clone : Proc(IMDSPEnumDevice*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMDSPEnumDevice, lpVtbl : IMDSPEnumDeviceVtbl* do
    GUID = LibC::GUID.new(0x1dcb3a11_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
    def query_interface(this : IMDSPEnumDevice*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMDSPEnumDevice*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMDSPEnumDevice*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IMDSPEnumDevice*, celt : UInt32, ppDevice : Void**, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, ppDevice, pceltFetched)
    end
    def skip(this : IMDSPEnumDevice*, celt : UInt32, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt, pceltFetched)
    end
    def reset(this : IMDSPEnumDevice*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IMDSPEnumDevice*, ppEnumDevice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnumDevice)
    end

  end

  @[Extern]
  record IMDSPDeviceVtbl,
    query_interface : Proc(IMDSPDevice*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMDSPDevice*, UInt32),
    release : Proc(IMDSPDevice*, UInt32),
    get_name : Proc(IMDSPDevice*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    get_manufacturer : Proc(IMDSPDevice*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    get_version : Proc(IMDSPDevice*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type : Proc(IMDSPDevice*, UInt32*, Win32cr::Foundation::HRESULT),
    get_serial_number : Proc(IMDSPDevice*, Win32cr::Media::DeviceManager::WMDMID*, UInt8*, Win32cr::Foundation::HRESULT),
    get_power_source : Proc(IMDSPDevice*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_status : Proc(IMDSPDevice*, UInt32*, Win32cr::Foundation::HRESULT),
    get_device_icon : Proc(IMDSPDevice*, UInt32*, Win32cr::Foundation::HRESULT),
    enum_storage : Proc(IMDSPDevice*, Void**, Win32cr::Foundation::HRESULT),
    get_format_support : Proc(IMDSPDevice*, Win32cr::Media::Audio::WAVEFORMATEX**, UInt32*, Win32cr::Foundation::PWSTR**, UInt32*, Win32cr::Foundation::HRESULT),
    send_opaque_command : Proc(IMDSPDevice*, Win32cr::Media::DeviceManager::OPAQUECOMMAND*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMDSPDevice, lpVtbl : IMDSPDeviceVtbl* do
    GUID = LibC::GUID.new(0x1dcb3a12_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
    def query_interface(this : IMDSPDevice*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMDSPDevice*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMDSPDevice*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_name(this : IMDSPDevice*, pwszName : UInt16*, nMaxChars : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, pwszName, nMaxChars)
    end
    def get_manufacturer(this : IMDSPDevice*, pwszName : UInt16*, nMaxChars : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_manufacturer.call(this, pwszName, nMaxChars)
    end
    def get_version(this : IMDSPDevice*, pdwVersion : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version.call(this, pdwVersion)
    end
    def get_type(this : IMDSPDevice*, pdwType : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, pdwType)
    end
    def get_serial_number(this : IMDSPDevice*, pSerialNumber : Win32cr::Media::DeviceManager::WMDMID*, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_serial_number.call(this, pSerialNumber, abMac)
    end
    def get_power_source(this : IMDSPDevice*, pdwPowerSource : UInt32*, pdwPercentRemaining : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_power_source.call(this, pdwPowerSource, pdwPercentRemaining)
    end
    def get_status(this : IMDSPDevice*, pdwStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, pdwStatus)
    end
    def get_device_icon(this : IMDSPDevice*, hIcon : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_icon.call(this, hIcon)
    end
    def enum_storage(this : IMDSPDevice*, ppEnumStorage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_storage.call(this, ppEnumStorage)
    end
    def get_format_support(this : IMDSPDevice*, pFormatEx : Win32cr::Media::Audio::WAVEFORMATEX**, pnFormatCount : UInt32*, pppwszMimeType : Win32cr::Foundation::PWSTR**, pnMimeTypeCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_format_support.call(this, pFormatEx, pnFormatCount, pppwszMimeType, pnMimeTypeCount)
    end
    def send_opaque_command(this : IMDSPDevice*, pCommand : Win32cr::Media::DeviceManager::OPAQUECOMMAND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_opaque_command.call(this, pCommand)
    end

  end

  @[Extern]
  record IMDSPDevice2Vtbl,
    query_interface : Proc(IMDSPDevice2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMDSPDevice2*, UInt32),
    release : Proc(IMDSPDevice2*, UInt32),
    get_name : Proc(IMDSPDevice2*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    get_manufacturer : Proc(IMDSPDevice2*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    get_version : Proc(IMDSPDevice2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type : Proc(IMDSPDevice2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_serial_number : Proc(IMDSPDevice2*, Win32cr::Media::DeviceManager::WMDMID*, UInt8*, Win32cr::Foundation::HRESULT),
    get_power_source : Proc(IMDSPDevice2*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_status : Proc(IMDSPDevice2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_device_icon : Proc(IMDSPDevice2*, UInt32*, Win32cr::Foundation::HRESULT),
    enum_storage : Proc(IMDSPDevice2*, Void**, Win32cr::Foundation::HRESULT),
    get_format_support : Proc(IMDSPDevice2*, Win32cr::Media::Audio::WAVEFORMATEX**, UInt32*, Win32cr::Foundation::PWSTR**, UInt32*, Win32cr::Foundation::HRESULT),
    send_opaque_command : Proc(IMDSPDevice2*, Win32cr::Media::DeviceManager::OPAQUECOMMAND*, Win32cr::Foundation::HRESULT),
    get_storage : Proc(IMDSPDevice2*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    get_format_support2 : Proc(IMDSPDevice2*, UInt32, Win32cr::Media::Audio::WAVEFORMATEX**, UInt32*, Win32cr::Media::MediaFoundation::VIDEOINFOHEADER**, UInt32*, Win32cr::Media::DeviceManager::WMFILECAPABILITIES**, UInt32*, Win32cr::Foundation::HRESULT),
    get_specify_property_pages : Proc(IMDSPDevice2*, Void**, Void***, UInt32*, Win32cr::Foundation::HRESULT),
    get_canonical_name : Proc(IMDSPDevice2*, UInt16*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMDSPDevice2, lpVtbl : IMDSPDevice2Vtbl* do
    GUID = LibC::GUID.new(0x420d16ad_u32, 0xc97d_u16, 0x4e00_u16, StaticArray[0x82_u8, 0xaa_u8, 0x0_u8, 0xe9_u8, 0xf4_u8, 0x33_u8, 0x5d_u8, 0xdd_u8])
    def query_interface(this : IMDSPDevice2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMDSPDevice2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMDSPDevice2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_name(this : IMDSPDevice2*, pwszName : UInt16*, nMaxChars : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, pwszName, nMaxChars)
    end
    def get_manufacturer(this : IMDSPDevice2*, pwszName : UInt16*, nMaxChars : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_manufacturer.call(this, pwszName, nMaxChars)
    end
    def get_version(this : IMDSPDevice2*, pdwVersion : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version.call(this, pdwVersion)
    end
    def get_type(this : IMDSPDevice2*, pdwType : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, pdwType)
    end
    def get_serial_number(this : IMDSPDevice2*, pSerialNumber : Win32cr::Media::DeviceManager::WMDMID*, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_serial_number.call(this, pSerialNumber, abMac)
    end
    def get_power_source(this : IMDSPDevice2*, pdwPowerSource : UInt32*, pdwPercentRemaining : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_power_source.call(this, pdwPowerSource, pdwPercentRemaining)
    end
    def get_status(this : IMDSPDevice2*, pdwStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, pdwStatus)
    end
    def get_device_icon(this : IMDSPDevice2*, hIcon : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_icon.call(this, hIcon)
    end
    def enum_storage(this : IMDSPDevice2*, ppEnumStorage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_storage.call(this, ppEnumStorage)
    end
    def get_format_support(this : IMDSPDevice2*, pFormatEx : Win32cr::Media::Audio::WAVEFORMATEX**, pnFormatCount : UInt32*, pppwszMimeType : Win32cr::Foundation::PWSTR**, pnMimeTypeCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_format_support.call(this, pFormatEx, pnFormatCount, pppwszMimeType, pnMimeTypeCount)
    end
    def send_opaque_command(this : IMDSPDevice2*, pCommand : Win32cr::Media::DeviceManager::OPAQUECOMMAND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_opaque_command.call(this, pCommand)
    end
    def get_storage(this : IMDSPDevice2*, pszStorageName : Win32cr::Foundation::PWSTR, ppStorage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_storage.call(this, pszStorageName, ppStorage)
    end
    def get_format_support2(this : IMDSPDevice2*, dwFlags : UInt32, ppAudioFormatEx : Win32cr::Media::Audio::WAVEFORMATEX**, pnAudioFormatCount : UInt32*, ppVideoFormatEx : Win32cr::Media::MediaFoundation::VIDEOINFOHEADER**, pnVideoFormatCount : UInt32*, ppFileType : Win32cr::Media::DeviceManager::WMFILECAPABILITIES**, pnFileTypeCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_format_support2.call(this, dwFlags, ppAudioFormatEx, pnAudioFormatCount, ppVideoFormatEx, pnVideoFormatCount, ppFileType, pnFileTypeCount)
    end
    def get_specify_property_pages(this : IMDSPDevice2*, ppSpecifyPropPages : Void**, pppUnknowns : Void***, pcUnks : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_specify_property_pages.call(this, ppSpecifyPropPages, pppUnknowns, pcUnks)
    end
    def get_canonical_name(this : IMDSPDevice2*, pwszPnPName : UInt16*, nMaxChars : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_canonical_name.call(this, pwszPnPName, nMaxChars)
    end

  end

  @[Extern]
  record IMDSPDevice3Vtbl,
    query_interface : Proc(IMDSPDevice3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMDSPDevice3*, UInt32),
    release : Proc(IMDSPDevice3*, UInt32),
    get_name : Proc(IMDSPDevice3*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    get_manufacturer : Proc(IMDSPDevice3*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    get_version : Proc(IMDSPDevice3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type : Proc(IMDSPDevice3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_serial_number : Proc(IMDSPDevice3*, Win32cr::Media::DeviceManager::WMDMID*, UInt8*, Win32cr::Foundation::HRESULT),
    get_power_source : Proc(IMDSPDevice3*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_status : Proc(IMDSPDevice3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_device_icon : Proc(IMDSPDevice3*, UInt32*, Win32cr::Foundation::HRESULT),
    enum_storage : Proc(IMDSPDevice3*, Void**, Win32cr::Foundation::HRESULT),
    get_format_support : Proc(IMDSPDevice3*, Win32cr::Media::Audio::WAVEFORMATEX**, UInt32*, Win32cr::Foundation::PWSTR**, UInt32*, Win32cr::Foundation::HRESULT),
    send_opaque_command : Proc(IMDSPDevice3*, Win32cr::Media::DeviceManager::OPAQUECOMMAND*, Win32cr::Foundation::HRESULT),
    get_storage : Proc(IMDSPDevice3*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    get_format_support2 : Proc(IMDSPDevice3*, UInt32, Win32cr::Media::Audio::WAVEFORMATEX**, UInt32*, Win32cr::Media::MediaFoundation::VIDEOINFOHEADER**, UInt32*, Win32cr::Media::DeviceManager::WMFILECAPABILITIES**, UInt32*, Win32cr::Foundation::HRESULT),
    get_specify_property_pages : Proc(IMDSPDevice3*, Void**, Void***, UInt32*, Win32cr::Foundation::HRESULT),
    get_canonical_name : Proc(IMDSPDevice3*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    get_property : Proc(IMDSPDevice3*, Win32cr::Foundation::PWSTR, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    set_property : Proc(IMDSPDevice3*, Win32cr::Foundation::PWSTR, Win32cr::System::Com::StructuredStorage::PROPVARIANT*, Win32cr::Foundation::HRESULT),
    get_format_capability : Proc(IMDSPDevice3*, Win32cr::Media::DeviceManager::WMDM_FORMATCODE, Win32cr::Media::DeviceManager::WMDM_FORMAT_CAPABILITY*, Win32cr::Foundation::HRESULT),
    device_io_control : Proc(IMDSPDevice3*, UInt32, UInt8*, UInt32, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    find_storage : Proc(IMDSPDevice3*, Win32cr::Media::DeviceManager::WMDM_FIND_SCOPE, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMDSPDevice3, lpVtbl : IMDSPDevice3Vtbl* do
    GUID = LibC::GUID.new(0x1a839845_u32, 0xfc55_u16, 0x487c_u16, StaticArray[0x97_u8, 0x6f_u8, 0xee_u8, 0x38_u8, 0xac_u8, 0xe_u8, 0x8c_u8, 0x4e_u8])
    def query_interface(this : IMDSPDevice3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMDSPDevice3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMDSPDevice3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_name(this : IMDSPDevice3*, pwszName : UInt16*, nMaxChars : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, pwszName, nMaxChars)
    end
    def get_manufacturer(this : IMDSPDevice3*, pwszName : UInt16*, nMaxChars : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_manufacturer.call(this, pwszName, nMaxChars)
    end
    def get_version(this : IMDSPDevice3*, pdwVersion : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version.call(this, pdwVersion)
    end
    def get_type(this : IMDSPDevice3*, pdwType : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, pdwType)
    end
    def get_serial_number(this : IMDSPDevice3*, pSerialNumber : Win32cr::Media::DeviceManager::WMDMID*, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_serial_number.call(this, pSerialNumber, abMac)
    end
    def get_power_source(this : IMDSPDevice3*, pdwPowerSource : UInt32*, pdwPercentRemaining : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_power_source.call(this, pdwPowerSource, pdwPercentRemaining)
    end
    def get_status(this : IMDSPDevice3*, pdwStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, pdwStatus)
    end
    def get_device_icon(this : IMDSPDevice3*, hIcon : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_icon.call(this, hIcon)
    end
    def enum_storage(this : IMDSPDevice3*, ppEnumStorage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_storage.call(this, ppEnumStorage)
    end
    def get_format_support(this : IMDSPDevice3*, pFormatEx : Win32cr::Media::Audio::WAVEFORMATEX**, pnFormatCount : UInt32*, pppwszMimeType : Win32cr::Foundation::PWSTR**, pnMimeTypeCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_format_support.call(this, pFormatEx, pnFormatCount, pppwszMimeType, pnMimeTypeCount)
    end
    def send_opaque_command(this : IMDSPDevice3*, pCommand : Win32cr::Media::DeviceManager::OPAQUECOMMAND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_opaque_command.call(this, pCommand)
    end
    def get_storage(this : IMDSPDevice3*, pszStorageName : Win32cr::Foundation::PWSTR, ppStorage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_storage.call(this, pszStorageName, ppStorage)
    end
    def get_format_support2(this : IMDSPDevice3*, dwFlags : UInt32, ppAudioFormatEx : Win32cr::Media::Audio::WAVEFORMATEX**, pnAudioFormatCount : UInt32*, ppVideoFormatEx : Win32cr::Media::MediaFoundation::VIDEOINFOHEADER**, pnVideoFormatCount : UInt32*, ppFileType : Win32cr::Media::DeviceManager::WMFILECAPABILITIES**, pnFileTypeCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_format_support2.call(this, dwFlags, ppAudioFormatEx, pnAudioFormatCount, ppVideoFormatEx, pnVideoFormatCount, ppFileType, pnFileTypeCount)
    end
    def get_specify_property_pages(this : IMDSPDevice3*, ppSpecifyPropPages : Void**, pppUnknowns : Void***, pcUnks : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_specify_property_pages.call(this, ppSpecifyPropPages, pppUnknowns, pcUnks)
    end
    def get_canonical_name(this : IMDSPDevice3*, pwszPnPName : UInt16*, nMaxChars : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_canonical_name.call(this, pwszPnPName, nMaxChars)
    end
    def get_property(this : IMDSPDevice3*, pwszPropName : Win32cr::Foundation::PWSTR, pValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, pwszPropName, pValue)
    end
    def set_property(this : IMDSPDevice3*, pwszPropName : Win32cr::Foundation::PWSTR, pValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, pwszPropName, pValue)
    end
    def get_format_capability(this : IMDSPDevice3*, format : Win32cr::Media::DeviceManager::WMDM_FORMATCODE, pFormatSupport : Win32cr::Media::DeviceManager::WMDM_FORMAT_CAPABILITY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_format_capability.call(this, format, pFormatSupport)
    end
    def device_io_control(this : IMDSPDevice3*, dwIoControlCode : UInt32, lpInBuffer : UInt8*, nInBufferSize : UInt32, lpOutBuffer : UInt8*, pnOutBufferSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.device_io_control.call(this, dwIoControlCode, lpInBuffer, nInBufferSize, lpOutBuffer, pnOutBufferSize)
    end
    def find_storage(this : IMDSPDevice3*, findScope : Win32cr::Media::DeviceManager::WMDM_FIND_SCOPE, pwszUniqueID : Win32cr::Foundation::PWSTR, ppStorage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_storage.call(this, findScope, pwszUniqueID, ppStorage)
    end

  end

  @[Extern]
  record IMDSPDeviceControlVtbl,
    query_interface : Proc(IMDSPDeviceControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMDSPDeviceControl*, UInt32),
    release : Proc(IMDSPDeviceControl*, UInt32),
    get_dc_status : Proc(IMDSPDeviceControl*, UInt32*, Win32cr::Foundation::HRESULT),
    get_capabilities : Proc(IMDSPDeviceControl*, UInt32*, Win32cr::Foundation::HRESULT),
    play : Proc(IMDSPDeviceControl*, Win32cr::Foundation::HRESULT),
    record : Proc(IMDSPDeviceControl*, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Foundation::HRESULT),
    pause : Proc(IMDSPDeviceControl*, Win32cr::Foundation::HRESULT),
    resume : Proc(IMDSPDeviceControl*, Win32cr::Foundation::HRESULT),
    stop : Proc(IMDSPDeviceControl*, Win32cr::Foundation::HRESULT),
    seek : Proc(IMDSPDeviceControl*, UInt32, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMDSPDeviceControl, lpVtbl : IMDSPDeviceControlVtbl* do
    GUID = LibC::GUID.new(0x1dcb3a14_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
    def query_interface(this : IMDSPDeviceControl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMDSPDeviceControl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMDSPDeviceControl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_dc_status(this : IMDSPDeviceControl*, pdwStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dc_status.call(this, pdwStatus)
    end
    def get_capabilities(this : IMDSPDeviceControl*, pdwCapabilitiesMask : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_capabilities.call(this, pdwCapabilitiesMask)
    end
    def play(this : IMDSPDeviceControl*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.play.call(this)
    end
    def record(this : IMDSPDeviceControl*, pFormat : Win32cr::Media::Audio::WAVEFORMATEX*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.record.call(this, pFormat)
    end
    def pause(this : IMDSPDeviceControl*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pause.call(this)
    end
    def resume(this : IMDSPDeviceControl*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume.call(this)
    end
    def stop(this : IMDSPDeviceControl*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop.call(this)
    end
    def seek(this : IMDSPDeviceControl*, fuMode : UInt32, nOffset : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.seek.call(this, fuMode, nOffset)
    end

  end

  @[Extern]
  record IMDSPEnumStorageVtbl,
    query_interface : Proc(IMDSPEnumStorage*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMDSPEnumStorage*, UInt32),
    release : Proc(IMDSPEnumStorage*, UInt32),
    next__ : Proc(IMDSPEnumStorage*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IMDSPEnumStorage*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    reset : Proc(IMDSPEnumStorage*, Win32cr::Foundation::HRESULT),
    clone : Proc(IMDSPEnumStorage*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMDSPEnumStorage, lpVtbl : IMDSPEnumStorageVtbl* do
    GUID = LibC::GUID.new(0x1dcb3a15_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
    def query_interface(this : IMDSPEnumStorage*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMDSPEnumStorage*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMDSPEnumStorage*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IMDSPEnumStorage*, celt : UInt32, ppStorage : Void**, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, ppStorage, pceltFetched)
    end
    def skip(this : IMDSPEnumStorage*, celt : UInt32, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt, pceltFetched)
    end
    def reset(this : IMDSPEnumStorage*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IMDSPEnumStorage*, ppEnumStorage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnumStorage)
    end

  end

  @[Extern]
  record IMDSPStorageVtbl,
    query_interface : Proc(IMDSPStorage*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMDSPStorage*, UInt32),
    release : Proc(IMDSPStorage*, UInt32),
    set_attributes : Proc(IMDSPStorage*, UInt32, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Foundation::HRESULT),
    get_storage_globals : Proc(IMDSPStorage*, Void**, Win32cr::Foundation::HRESULT),
    get_attributes : Proc(IMDSPStorage*, UInt32*, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Foundation::HRESULT),
    get_name : Proc(IMDSPStorage*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    get_date : Proc(IMDSPStorage*, Win32cr::Media::DeviceManager::WMDMDATETIME*, Win32cr::Foundation::HRESULT),
    get_size : Proc(IMDSPStorage*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_rights : Proc(IMDSPStorage*, Win32cr::Media::DeviceManager::WMDMRIGHTS**, UInt32*, UInt8*, Win32cr::Foundation::HRESULT),
    create_storage : Proc(IMDSPStorage*, UInt32, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    enum_storage : Proc(IMDSPStorage*, Void**, Win32cr::Foundation::HRESULT),
    send_opaque_command : Proc(IMDSPStorage*, Win32cr::Media::DeviceManager::OPAQUECOMMAND*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMDSPStorage, lpVtbl : IMDSPStorageVtbl* do
    GUID = LibC::GUID.new(0x1dcb3a16_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
    def query_interface(this : IMDSPStorage*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMDSPStorage*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMDSPStorage*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_attributes(this : IMDSPStorage*, dwAttributes : UInt32, pFormat : Win32cr::Media::Audio::WAVEFORMATEX*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_attributes.call(this, dwAttributes, pFormat)
    end
    def get_storage_globals(this : IMDSPStorage*, ppStorageGlobals : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_storage_globals.call(this, ppStorageGlobals)
    end
    def get_attributes(this : IMDSPStorage*, pdwAttributes : UInt32*, pFormat : Win32cr::Media::Audio::WAVEFORMATEX*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attributes.call(this, pdwAttributes, pFormat)
    end
    def get_name(this : IMDSPStorage*, pwszName : UInt16*, nMaxChars : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, pwszName, nMaxChars)
    end
    def get_date(this : IMDSPStorage*, pDateTimeUTC : Win32cr::Media::DeviceManager::WMDMDATETIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_date.call(this, pDateTimeUTC)
    end
    def get_size(this : IMDSPStorage*, pdwSizeLow : UInt32*, pdwSizeHigh : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_size.call(this, pdwSizeLow, pdwSizeHigh)
    end
    def get_rights(this : IMDSPStorage*, ppRights : Win32cr::Media::DeviceManager::WMDMRIGHTS**, pnRightsCount : UInt32*, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rights.call(this, ppRights, pnRightsCount, abMac)
    end
    def create_storage(this : IMDSPStorage*, dwAttributes : UInt32, pFormat : Win32cr::Media::Audio::WAVEFORMATEX*, pwszName : Win32cr::Foundation::PWSTR, ppNewStorage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_storage.call(this, dwAttributes, pFormat, pwszName, ppNewStorage)
    end
    def enum_storage(this : IMDSPStorage*, ppEnumStorage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_storage.call(this, ppEnumStorage)
    end
    def send_opaque_command(this : IMDSPStorage*, pCommand : Win32cr::Media::DeviceManager::OPAQUECOMMAND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_opaque_command.call(this, pCommand)
    end

  end

  @[Extern]
  record IMDSPStorage2Vtbl,
    query_interface : Proc(IMDSPStorage2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMDSPStorage2*, UInt32),
    release : Proc(IMDSPStorage2*, UInt32),
    set_attributes : Proc(IMDSPStorage2*, UInt32, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Foundation::HRESULT),
    get_storage_globals : Proc(IMDSPStorage2*, Void**, Win32cr::Foundation::HRESULT),
    get_attributes : Proc(IMDSPStorage2*, UInt32*, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Foundation::HRESULT),
    get_name : Proc(IMDSPStorage2*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    get_date : Proc(IMDSPStorage2*, Win32cr::Media::DeviceManager::WMDMDATETIME*, Win32cr::Foundation::HRESULT),
    get_size : Proc(IMDSPStorage2*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_rights : Proc(IMDSPStorage2*, Win32cr::Media::DeviceManager::WMDMRIGHTS**, UInt32*, UInt8*, Win32cr::Foundation::HRESULT),
    create_storage : Proc(IMDSPStorage2*, UInt32, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    enum_storage : Proc(IMDSPStorage2*, Void**, Win32cr::Foundation::HRESULT),
    send_opaque_command : Proc(IMDSPStorage2*, Win32cr::Media::DeviceManager::OPAQUECOMMAND*, Win32cr::Foundation::HRESULT),
    get_storage : Proc(IMDSPStorage2*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    create_storage2 : Proc(IMDSPStorage2*, UInt32, UInt32, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Media::MediaFoundation::VIDEOINFOHEADER*, Win32cr::Foundation::PWSTR, UInt64, Void**, Win32cr::Foundation::HRESULT),
    set_attributes2 : Proc(IMDSPStorage2*, UInt32, UInt32, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Media::MediaFoundation::VIDEOINFOHEADER*, Win32cr::Foundation::HRESULT),
    get_attributes2 : Proc(IMDSPStorage2*, UInt32*, UInt32*, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Media::MediaFoundation::VIDEOINFOHEADER*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMDSPStorage2, lpVtbl : IMDSPStorage2Vtbl* do
    GUID = LibC::GUID.new(0xa5e07a5_u32, 0x6454_u16, 0x4451_u16, StaticArray[0x9c_u8, 0x36_u8, 0x1c_u8, 0x6a_u8, 0xe7_u8, 0xe2_u8, 0xb1_u8, 0xd6_u8])
    def query_interface(this : IMDSPStorage2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMDSPStorage2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMDSPStorage2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_attributes(this : IMDSPStorage2*, dwAttributes : UInt32, pFormat : Win32cr::Media::Audio::WAVEFORMATEX*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_attributes.call(this, dwAttributes, pFormat)
    end
    def get_storage_globals(this : IMDSPStorage2*, ppStorageGlobals : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_storage_globals.call(this, ppStorageGlobals)
    end
    def get_attributes(this : IMDSPStorage2*, pdwAttributes : UInt32*, pFormat : Win32cr::Media::Audio::WAVEFORMATEX*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attributes.call(this, pdwAttributes, pFormat)
    end
    def get_name(this : IMDSPStorage2*, pwszName : UInt16*, nMaxChars : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, pwszName, nMaxChars)
    end
    def get_date(this : IMDSPStorage2*, pDateTimeUTC : Win32cr::Media::DeviceManager::WMDMDATETIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_date.call(this, pDateTimeUTC)
    end
    def get_size(this : IMDSPStorage2*, pdwSizeLow : UInt32*, pdwSizeHigh : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_size.call(this, pdwSizeLow, pdwSizeHigh)
    end
    def get_rights(this : IMDSPStorage2*, ppRights : Win32cr::Media::DeviceManager::WMDMRIGHTS**, pnRightsCount : UInt32*, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rights.call(this, ppRights, pnRightsCount, abMac)
    end
    def create_storage(this : IMDSPStorage2*, dwAttributes : UInt32, pFormat : Win32cr::Media::Audio::WAVEFORMATEX*, pwszName : Win32cr::Foundation::PWSTR, ppNewStorage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_storage.call(this, dwAttributes, pFormat, pwszName, ppNewStorage)
    end
    def enum_storage(this : IMDSPStorage2*, ppEnumStorage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_storage.call(this, ppEnumStorage)
    end
    def send_opaque_command(this : IMDSPStorage2*, pCommand : Win32cr::Media::DeviceManager::OPAQUECOMMAND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_opaque_command.call(this, pCommand)
    end
    def get_storage(this : IMDSPStorage2*, pszStorageName : Win32cr::Foundation::PWSTR, ppStorage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_storage.call(this, pszStorageName, ppStorage)
    end
    def create_storage2(this : IMDSPStorage2*, dwAttributes : UInt32, dwAttributesEx : UInt32, pAudioFormat : Win32cr::Media::Audio::WAVEFORMATEX*, pVideoFormat : Win32cr::Media::MediaFoundation::VIDEOINFOHEADER*, pwszName : Win32cr::Foundation::PWSTR, qwFileSize : UInt64, ppNewStorage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_storage2.call(this, dwAttributes, dwAttributesEx, pAudioFormat, pVideoFormat, pwszName, qwFileSize, ppNewStorage)
    end
    def set_attributes2(this : IMDSPStorage2*, dwAttributes : UInt32, dwAttributesEx : UInt32, pAudioFormat : Win32cr::Media::Audio::WAVEFORMATEX*, pVideoFormat : Win32cr::Media::MediaFoundation::VIDEOINFOHEADER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_attributes2.call(this, dwAttributes, dwAttributesEx, pAudioFormat, pVideoFormat)
    end
    def get_attributes2(this : IMDSPStorage2*, pdwAttributes : UInt32*, pdwAttributesEx : UInt32*, pAudioFormat : Win32cr::Media::Audio::WAVEFORMATEX*, pVideoFormat : Win32cr::Media::MediaFoundation::VIDEOINFOHEADER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attributes2.call(this, pdwAttributes, pdwAttributesEx, pAudioFormat, pVideoFormat)
    end

  end

  @[Extern]
  record IMDSPStorage3Vtbl,
    query_interface : Proc(IMDSPStorage3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMDSPStorage3*, UInt32),
    release : Proc(IMDSPStorage3*, UInt32),
    set_attributes : Proc(IMDSPStorage3*, UInt32, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Foundation::HRESULT),
    get_storage_globals : Proc(IMDSPStorage3*, Void**, Win32cr::Foundation::HRESULT),
    get_attributes : Proc(IMDSPStorage3*, UInt32*, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Foundation::HRESULT),
    get_name : Proc(IMDSPStorage3*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    get_date : Proc(IMDSPStorage3*, Win32cr::Media::DeviceManager::WMDMDATETIME*, Win32cr::Foundation::HRESULT),
    get_size : Proc(IMDSPStorage3*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_rights : Proc(IMDSPStorage3*, Win32cr::Media::DeviceManager::WMDMRIGHTS**, UInt32*, UInt8*, Win32cr::Foundation::HRESULT),
    create_storage : Proc(IMDSPStorage3*, UInt32, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    enum_storage : Proc(IMDSPStorage3*, Void**, Win32cr::Foundation::HRESULT),
    send_opaque_command : Proc(IMDSPStorage3*, Win32cr::Media::DeviceManager::OPAQUECOMMAND*, Win32cr::Foundation::HRESULT),
    get_storage : Proc(IMDSPStorage3*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    create_storage2 : Proc(IMDSPStorage3*, UInt32, UInt32, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Media::MediaFoundation::VIDEOINFOHEADER*, Win32cr::Foundation::PWSTR, UInt64, Void**, Win32cr::Foundation::HRESULT),
    set_attributes2 : Proc(IMDSPStorage3*, UInt32, UInt32, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Media::MediaFoundation::VIDEOINFOHEADER*, Win32cr::Foundation::HRESULT),
    get_attributes2 : Proc(IMDSPStorage3*, UInt32*, UInt32*, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Media::MediaFoundation::VIDEOINFOHEADER*, Win32cr::Foundation::HRESULT),
    get_metadata : Proc(IMDSPStorage3*, Void*, Win32cr::Foundation::HRESULT),
    set_metadata : Proc(IMDSPStorage3*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMDSPStorage3, lpVtbl : IMDSPStorage3Vtbl* do
    GUID = LibC::GUID.new(0x6c669867_u32, 0x97ed_u16, 0x4a67_u16, StaticArray[0x97_u8, 0x6_u8, 0x1c_u8, 0x55_u8, 0x29_u8, 0xd2_u8, 0xa4_u8, 0x14_u8])
    def query_interface(this : IMDSPStorage3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMDSPStorage3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMDSPStorage3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_attributes(this : IMDSPStorage3*, dwAttributes : UInt32, pFormat : Win32cr::Media::Audio::WAVEFORMATEX*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_attributes.call(this, dwAttributes, pFormat)
    end
    def get_storage_globals(this : IMDSPStorage3*, ppStorageGlobals : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_storage_globals.call(this, ppStorageGlobals)
    end
    def get_attributes(this : IMDSPStorage3*, pdwAttributes : UInt32*, pFormat : Win32cr::Media::Audio::WAVEFORMATEX*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attributes.call(this, pdwAttributes, pFormat)
    end
    def get_name(this : IMDSPStorage3*, pwszName : UInt16*, nMaxChars : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, pwszName, nMaxChars)
    end
    def get_date(this : IMDSPStorage3*, pDateTimeUTC : Win32cr::Media::DeviceManager::WMDMDATETIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_date.call(this, pDateTimeUTC)
    end
    def get_size(this : IMDSPStorage3*, pdwSizeLow : UInt32*, pdwSizeHigh : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_size.call(this, pdwSizeLow, pdwSizeHigh)
    end
    def get_rights(this : IMDSPStorage3*, ppRights : Win32cr::Media::DeviceManager::WMDMRIGHTS**, pnRightsCount : UInt32*, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rights.call(this, ppRights, pnRightsCount, abMac)
    end
    def create_storage(this : IMDSPStorage3*, dwAttributes : UInt32, pFormat : Win32cr::Media::Audio::WAVEFORMATEX*, pwszName : Win32cr::Foundation::PWSTR, ppNewStorage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_storage.call(this, dwAttributes, pFormat, pwszName, ppNewStorage)
    end
    def enum_storage(this : IMDSPStorage3*, ppEnumStorage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_storage.call(this, ppEnumStorage)
    end
    def send_opaque_command(this : IMDSPStorage3*, pCommand : Win32cr::Media::DeviceManager::OPAQUECOMMAND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_opaque_command.call(this, pCommand)
    end
    def get_storage(this : IMDSPStorage3*, pszStorageName : Win32cr::Foundation::PWSTR, ppStorage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_storage.call(this, pszStorageName, ppStorage)
    end
    def create_storage2(this : IMDSPStorage3*, dwAttributes : UInt32, dwAttributesEx : UInt32, pAudioFormat : Win32cr::Media::Audio::WAVEFORMATEX*, pVideoFormat : Win32cr::Media::MediaFoundation::VIDEOINFOHEADER*, pwszName : Win32cr::Foundation::PWSTR, qwFileSize : UInt64, ppNewStorage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_storage2.call(this, dwAttributes, dwAttributesEx, pAudioFormat, pVideoFormat, pwszName, qwFileSize, ppNewStorage)
    end
    def set_attributes2(this : IMDSPStorage3*, dwAttributes : UInt32, dwAttributesEx : UInt32, pAudioFormat : Win32cr::Media::Audio::WAVEFORMATEX*, pVideoFormat : Win32cr::Media::MediaFoundation::VIDEOINFOHEADER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_attributes2.call(this, dwAttributes, dwAttributesEx, pAudioFormat, pVideoFormat)
    end
    def get_attributes2(this : IMDSPStorage3*, pdwAttributes : UInt32*, pdwAttributesEx : UInt32*, pAudioFormat : Win32cr::Media::Audio::WAVEFORMATEX*, pVideoFormat : Win32cr::Media::MediaFoundation::VIDEOINFOHEADER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attributes2.call(this, pdwAttributes, pdwAttributesEx, pAudioFormat, pVideoFormat)
    end
    def get_metadata(this : IMDSPStorage3*, pMetadata : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_metadata.call(this, pMetadata)
    end
    def set_metadata(this : IMDSPStorage3*, pMetadata : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_metadata.call(this, pMetadata)
    end

  end

  @[Extern]
  record IMDSPStorage4Vtbl,
    query_interface : Proc(IMDSPStorage4*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMDSPStorage4*, UInt32),
    release : Proc(IMDSPStorage4*, UInt32),
    set_attributes : Proc(IMDSPStorage4*, UInt32, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Foundation::HRESULT),
    get_storage_globals : Proc(IMDSPStorage4*, Void**, Win32cr::Foundation::HRESULT),
    get_attributes : Proc(IMDSPStorage4*, UInt32*, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Foundation::HRESULT),
    get_name : Proc(IMDSPStorage4*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    get_date : Proc(IMDSPStorage4*, Win32cr::Media::DeviceManager::WMDMDATETIME*, Win32cr::Foundation::HRESULT),
    get_size : Proc(IMDSPStorage4*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_rights : Proc(IMDSPStorage4*, Win32cr::Media::DeviceManager::WMDMRIGHTS**, UInt32*, UInt8*, Win32cr::Foundation::HRESULT),
    create_storage : Proc(IMDSPStorage4*, UInt32, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    enum_storage : Proc(IMDSPStorage4*, Void**, Win32cr::Foundation::HRESULT),
    send_opaque_command : Proc(IMDSPStorage4*, Win32cr::Media::DeviceManager::OPAQUECOMMAND*, Win32cr::Foundation::HRESULT),
    get_storage : Proc(IMDSPStorage4*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    create_storage2 : Proc(IMDSPStorage4*, UInt32, UInt32, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Media::MediaFoundation::VIDEOINFOHEADER*, Win32cr::Foundation::PWSTR, UInt64, Void**, Win32cr::Foundation::HRESULT),
    set_attributes2 : Proc(IMDSPStorage4*, UInt32, UInt32, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Media::MediaFoundation::VIDEOINFOHEADER*, Win32cr::Foundation::HRESULT),
    get_attributes2 : Proc(IMDSPStorage4*, UInt32*, UInt32*, Win32cr::Media::Audio::WAVEFORMATEX*, Win32cr::Media::MediaFoundation::VIDEOINFOHEADER*, Win32cr::Foundation::HRESULT),
    get_metadata : Proc(IMDSPStorage4*, Void*, Win32cr::Foundation::HRESULT),
    set_metadata : Proc(IMDSPStorage4*, Void*, Win32cr::Foundation::HRESULT),
    set_references : Proc(IMDSPStorage4*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_references : Proc(IMDSPStorage4*, UInt32*, Void***, Win32cr::Foundation::HRESULT),
    create_storage_with_metadata : Proc(IMDSPStorage4*, UInt32, Win32cr::Foundation::PWSTR, Void*, UInt64, Void**, Win32cr::Foundation::HRESULT),
    get_specified_metadata : Proc(IMDSPStorage4*, UInt32, Win32cr::Foundation::PWSTR*, Void*, Win32cr::Foundation::HRESULT),
    find_storage : Proc(IMDSPStorage4*, Win32cr::Media::DeviceManager::WMDM_FIND_SCOPE, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IMDSPStorage4*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMDSPStorage4, lpVtbl : IMDSPStorage4Vtbl* do
    GUID = LibC::GUID.new(0x3133b2c4_u32, 0x515c_u16, 0x481b_u16, StaticArray[0xb1_u8, 0xce_u8, 0x39_u8, 0x32_u8, 0x7e_u8, 0xcb_u8, 0x4f_u8, 0x74_u8])
    def query_interface(this : IMDSPStorage4*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMDSPStorage4*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMDSPStorage4*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_attributes(this : IMDSPStorage4*, dwAttributes : UInt32, pFormat : Win32cr::Media::Audio::WAVEFORMATEX*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_attributes.call(this, dwAttributes, pFormat)
    end
    def get_storage_globals(this : IMDSPStorage4*, ppStorageGlobals : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_storage_globals.call(this, ppStorageGlobals)
    end
    def get_attributes(this : IMDSPStorage4*, pdwAttributes : UInt32*, pFormat : Win32cr::Media::Audio::WAVEFORMATEX*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attributes.call(this, pdwAttributes, pFormat)
    end
    def get_name(this : IMDSPStorage4*, pwszName : UInt16*, nMaxChars : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, pwszName, nMaxChars)
    end
    def get_date(this : IMDSPStorage4*, pDateTimeUTC : Win32cr::Media::DeviceManager::WMDMDATETIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_date.call(this, pDateTimeUTC)
    end
    def get_size(this : IMDSPStorage4*, pdwSizeLow : UInt32*, pdwSizeHigh : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_size.call(this, pdwSizeLow, pdwSizeHigh)
    end
    def get_rights(this : IMDSPStorage4*, ppRights : Win32cr::Media::DeviceManager::WMDMRIGHTS**, pnRightsCount : UInt32*, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rights.call(this, ppRights, pnRightsCount, abMac)
    end
    def create_storage(this : IMDSPStorage4*, dwAttributes : UInt32, pFormat : Win32cr::Media::Audio::WAVEFORMATEX*, pwszName : Win32cr::Foundation::PWSTR, ppNewStorage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_storage.call(this, dwAttributes, pFormat, pwszName, ppNewStorage)
    end
    def enum_storage(this : IMDSPStorage4*, ppEnumStorage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_storage.call(this, ppEnumStorage)
    end
    def send_opaque_command(this : IMDSPStorage4*, pCommand : Win32cr::Media::DeviceManager::OPAQUECOMMAND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_opaque_command.call(this, pCommand)
    end
    def get_storage(this : IMDSPStorage4*, pszStorageName : Win32cr::Foundation::PWSTR, ppStorage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_storage.call(this, pszStorageName, ppStorage)
    end
    def create_storage2(this : IMDSPStorage4*, dwAttributes : UInt32, dwAttributesEx : UInt32, pAudioFormat : Win32cr::Media::Audio::WAVEFORMATEX*, pVideoFormat : Win32cr::Media::MediaFoundation::VIDEOINFOHEADER*, pwszName : Win32cr::Foundation::PWSTR, qwFileSize : UInt64, ppNewStorage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_storage2.call(this, dwAttributes, dwAttributesEx, pAudioFormat, pVideoFormat, pwszName, qwFileSize, ppNewStorage)
    end
    def set_attributes2(this : IMDSPStorage4*, dwAttributes : UInt32, dwAttributesEx : UInt32, pAudioFormat : Win32cr::Media::Audio::WAVEFORMATEX*, pVideoFormat : Win32cr::Media::MediaFoundation::VIDEOINFOHEADER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_attributes2.call(this, dwAttributes, dwAttributesEx, pAudioFormat, pVideoFormat)
    end
    def get_attributes2(this : IMDSPStorage4*, pdwAttributes : UInt32*, pdwAttributesEx : UInt32*, pAudioFormat : Win32cr::Media::Audio::WAVEFORMATEX*, pVideoFormat : Win32cr::Media::MediaFoundation::VIDEOINFOHEADER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attributes2.call(this, pdwAttributes, pdwAttributesEx, pAudioFormat, pVideoFormat)
    end
    def get_metadata(this : IMDSPStorage4*, pMetadata : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_metadata.call(this, pMetadata)
    end
    def set_metadata(this : IMDSPStorage4*, pMetadata : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_metadata.call(this, pMetadata)
    end
    def set_references(this : IMDSPStorage4*, dwRefs : UInt32, ppISPStorage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_references.call(this, dwRefs, ppISPStorage)
    end
    def get_references(this : IMDSPStorage4*, pdwRefs : UInt32*, pppISPStorage : Void***) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_references.call(this, pdwRefs, pppISPStorage)
    end
    def create_storage_with_metadata(this : IMDSPStorage4*, dwAttributes : UInt32, pwszName : Win32cr::Foundation::PWSTR, pMetadata : Void*, qwFileSize : UInt64, ppNewStorage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_storage_with_metadata.call(this, dwAttributes, pwszName, pMetadata, qwFileSize, ppNewStorage)
    end
    def get_specified_metadata(this : IMDSPStorage4*, cProperties : UInt32, ppwszPropNames : Win32cr::Foundation::PWSTR*, pMetadata : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_specified_metadata.call(this, cProperties, ppwszPropNames, pMetadata)
    end
    def find_storage(this : IMDSPStorage4*, findScope : Win32cr::Media::DeviceManager::WMDM_FIND_SCOPE, pwszUniqueID : Win32cr::Foundation::PWSTR, ppStorage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_storage.call(this, findScope, pwszUniqueID, ppStorage)
    end
    def get_parent(this : IMDSPStorage4*, ppStorage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, ppStorage)
    end

  end

  @[Extern]
  record IMDSPStorageGlobalsVtbl,
    query_interface : Proc(IMDSPStorageGlobals*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMDSPStorageGlobals*, UInt32),
    release : Proc(IMDSPStorageGlobals*, UInt32),
    get_capabilities : Proc(IMDSPStorageGlobals*, UInt32*, Win32cr::Foundation::HRESULT),
    get_serial_number : Proc(IMDSPStorageGlobals*, Win32cr::Media::DeviceManager::WMDMID*, UInt8*, Win32cr::Foundation::HRESULT),
    get_total_size : Proc(IMDSPStorageGlobals*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_total_free : Proc(IMDSPStorageGlobals*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_total_bad : Proc(IMDSPStorageGlobals*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_status : Proc(IMDSPStorageGlobals*, UInt32*, Win32cr::Foundation::HRESULT),
    initialize__ : Proc(IMDSPStorageGlobals*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    get_device : Proc(IMDSPStorageGlobals*, Void**, Win32cr::Foundation::HRESULT),
    get_root_storage : Proc(IMDSPStorageGlobals*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMDSPStorageGlobals, lpVtbl : IMDSPStorageGlobalsVtbl* do
    GUID = LibC::GUID.new(0x1dcb3a17_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
    def query_interface(this : IMDSPStorageGlobals*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMDSPStorageGlobals*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMDSPStorageGlobals*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_capabilities(this : IMDSPStorageGlobals*, pdwCapabilities : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_capabilities.call(this, pdwCapabilities)
    end
    def get_serial_number(this : IMDSPStorageGlobals*, pSerialNum : Win32cr::Media::DeviceManager::WMDMID*, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_serial_number.call(this, pSerialNum, abMac)
    end
    def get_total_size(this : IMDSPStorageGlobals*, pdwTotalSizeLow : UInt32*, pdwTotalSizeHigh : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_total_size.call(this, pdwTotalSizeLow, pdwTotalSizeHigh)
    end
    def get_total_free(this : IMDSPStorageGlobals*, pdwFreeLow : UInt32*, pdwFreeHigh : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_total_free.call(this, pdwFreeLow, pdwFreeHigh)
    end
    def get_total_bad(this : IMDSPStorageGlobals*, pdwBadLow : UInt32*, pdwBadHigh : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_total_bad.call(this, pdwBadLow, pdwBadHigh)
    end
    def get_status(this : IMDSPStorageGlobals*, pdwStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, pdwStatus)
    end
    def initialize__(this : IMDSPStorageGlobals*, fuMode : UInt32, pProgress : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, fuMode, pProgress)
    end
    def get_device(this : IMDSPStorageGlobals*, ppDevice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device.call(this, ppDevice)
    end
    def get_root_storage(this : IMDSPStorageGlobals*, ppRoot : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_root_storage.call(this, ppRoot)
    end

  end

  @[Extern]
  record IMDSPObjectInfoVtbl,
    query_interface : Proc(IMDSPObjectInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMDSPObjectInfo*, UInt32),
    release : Proc(IMDSPObjectInfo*, UInt32),
    get_play_length : Proc(IMDSPObjectInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    set_play_length : Proc(IMDSPObjectInfo*, UInt32, Win32cr::Foundation::HRESULT),
    get_play_offset : Proc(IMDSPObjectInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    set_play_offset : Proc(IMDSPObjectInfo*, UInt32, Win32cr::Foundation::HRESULT),
    get_total_length : Proc(IMDSPObjectInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_last_play_position : Proc(IMDSPObjectInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_longest_play_position : Proc(IMDSPObjectInfo*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMDSPObjectInfo, lpVtbl : IMDSPObjectInfoVtbl* do
    GUID = LibC::GUID.new(0x1dcb3a19_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
    def query_interface(this : IMDSPObjectInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMDSPObjectInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMDSPObjectInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_play_length(this : IMDSPObjectInfo*, pdwLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_play_length.call(this, pdwLength)
    end
    def set_play_length(this : IMDSPObjectInfo*, dwLength : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_play_length.call(this, dwLength)
    end
    def get_play_offset(this : IMDSPObjectInfo*, pdwOffset : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_play_offset.call(this, pdwOffset)
    end
    def set_play_offset(this : IMDSPObjectInfo*, dwOffset : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_play_offset.call(this, dwOffset)
    end
    def get_total_length(this : IMDSPObjectInfo*, pdwLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_total_length.call(this, pdwLength)
    end
    def get_last_play_position(this : IMDSPObjectInfo*, pdwLastPos : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_last_play_position.call(this, pdwLastPos)
    end
    def get_longest_play_position(this : IMDSPObjectInfo*, pdwLongestPos : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_longest_play_position.call(this, pdwLongestPos)
    end

  end

  @[Extern]
  record IMDSPObjectVtbl,
    query_interface : Proc(IMDSPObject*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMDSPObject*, UInt32),
    release : Proc(IMDSPObject*, UInt32),
    open : Proc(IMDSPObject*, UInt32, Win32cr::Foundation::HRESULT),
    read : Proc(IMDSPObject*, UInt8*, UInt32*, UInt8*, Win32cr::Foundation::HRESULT),
    write : Proc(IMDSPObject*, UInt8*, UInt32*, UInt8*, Win32cr::Foundation::HRESULT),
    delete : Proc(IMDSPObject*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    seek : Proc(IMDSPObject*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    rename : Proc(IMDSPObject*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::HRESULT),
    move : Proc(IMDSPObject*, UInt32, Void*, Void*, Win32cr::Foundation::HRESULT),
    close : Proc(IMDSPObject*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMDSPObject, lpVtbl : IMDSPObjectVtbl* do
    GUID = LibC::GUID.new(0x1dcb3a18_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
    def query_interface(this : IMDSPObject*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMDSPObject*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMDSPObject*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def open(this : IMDSPObject*, fuMode : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open.call(this, fuMode)
    end
    def read(this : IMDSPObject*, pData : UInt8*, pdwSize : UInt32*, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read.call(this, pData, pdwSize, abMac)
    end
    def write(this : IMDSPObject*, pData : UInt8*, pdwSize : UInt32*, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write.call(this, pData, pdwSize, abMac)
    end
    def delete(this : IMDSPObject*, fuMode : UInt32, pProgress : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this, fuMode, pProgress)
    end
    def seek(this : IMDSPObject*, fuFlags : UInt32, dwOffset : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.seek.call(this, fuFlags, dwOffset)
    end
    def rename(this : IMDSPObject*, pwszNewName : Win32cr::Foundation::PWSTR, pProgress : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.rename.call(this, pwszNewName, pProgress)
    end
    def move(this : IMDSPObject*, fuMode : UInt32, pProgress : Void*, pTarget : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move.call(this, fuMode, pProgress, pTarget)
    end
    def close(this : IMDSPObject*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end

  end

  @[Extern]
  record IMDSPObject2Vtbl,
    query_interface : Proc(IMDSPObject2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMDSPObject2*, UInt32),
    release : Proc(IMDSPObject2*, UInt32),
    open : Proc(IMDSPObject2*, UInt32, Win32cr::Foundation::HRESULT),
    read : Proc(IMDSPObject2*, UInt8*, UInt32*, UInt8*, Win32cr::Foundation::HRESULT),
    write : Proc(IMDSPObject2*, UInt8*, UInt32*, UInt8*, Win32cr::Foundation::HRESULT),
    delete : Proc(IMDSPObject2*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    seek : Proc(IMDSPObject2*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    rename : Proc(IMDSPObject2*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::HRESULT),
    move : Proc(IMDSPObject2*, UInt32, Void*, Void*, Win32cr::Foundation::HRESULT),
    close : Proc(IMDSPObject2*, Win32cr::Foundation::HRESULT),
    read_on_clear_channel : Proc(IMDSPObject2*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    write_on_clear_channel : Proc(IMDSPObject2*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMDSPObject2, lpVtbl : IMDSPObject2Vtbl* do
    GUID = LibC::GUID.new(0x3f34cd3e_u32, 0x5907_u16, 0x4341_u16, StaticArray[0x9a_u8, 0xf9_u8, 0x97_u8, 0xf4_u8, 0x18_u8, 0x7c_u8, 0x3a_u8, 0xa5_u8])
    def query_interface(this : IMDSPObject2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMDSPObject2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMDSPObject2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def open(this : IMDSPObject2*, fuMode : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open.call(this, fuMode)
    end
    def read(this : IMDSPObject2*, pData : UInt8*, pdwSize : UInt32*, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read.call(this, pData, pdwSize, abMac)
    end
    def write(this : IMDSPObject2*, pData : UInt8*, pdwSize : UInt32*, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write.call(this, pData, pdwSize, abMac)
    end
    def delete(this : IMDSPObject2*, fuMode : UInt32, pProgress : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this, fuMode, pProgress)
    end
    def seek(this : IMDSPObject2*, fuFlags : UInt32, dwOffset : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.seek.call(this, fuFlags, dwOffset)
    end
    def rename(this : IMDSPObject2*, pwszNewName : Win32cr::Foundation::PWSTR, pProgress : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.rename.call(this, pwszNewName, pProgress)
    end
    def move(this : IMDSPObject2*, fuMode : UInt32, pProgress : Void*, pTarget : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move.call(this, fuMode, pProgress, pTarget)
    end
    def close(this : IMDSPObject2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end
    def read_on_clear_channel(this : IMDSPObject2*, pData : UInt8*, pdwSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read_on_clear_channel.call(this, pData, pdwSize)
    end
    def write_on_clear_channel(this : IMDSPObject2*, pData : UInt8*, pdwSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_on_clear_channel.call(this, pData, pdwSize)
    end

  end

  @[Extern]
  record IMDSPDirectTransferVtbl,
    query_interface : Proc(IMDSPDirectTransfer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMDSPDirectTransfer*, UInt32),
    release : Proc(IMDSPDirectTransfer*, UInt32),
    transfer_to_device : Proc(IMDSPDirectTransfer*, Win32cr::Foundation::PWSTR, Void*, UInt32, Win32cr::Foundation::PWSTR, Void*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMDSPDirectTransfer, lpVtbl : IMDSPDirectTransferVtbl* do
    GUID = LibC::GUID.new(0xc2fe57a8_u32, 0x9304_u16, 0x478c_u16, StaticArray[0x9e_u8, 0xe4_u8, 0x47_u8, 0xe3_u8, 0x97_u8, 0xb9_u8, 0x12_u8, 0xd7_u8])
    def query_interface(this : IMDSPDirectTransfer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMDSPDirectTransfer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMDSPDirectTransfer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def transfer_to_device(this : IMDSPDirectTransfer*, pwszSourceFilePath : Win32cr::Foundation::PWSTR, pSourceOperation : Void*, fuFlags : UInt32, pwszDestinationName : Win32cr::Foundation::PWSTR, pSourceMetaData : Void*, pTransferProgress : Void*, ppNewObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.transfer_to_device.call(this, pwszSourceFilePath, pSourceOperation, fuFlags, pwszDestinationName, pSourceMetaData, pTransferProgress, ppNewObject)
    end

  end

  @[Extern]
  record IMDSPRevokedVtbl,
    query_interface : Proc(IMDSPRevoked*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMDSPRevoked*, UInt32),
    release : Proc(IMDSPRevoked*, UInt32),
    get_revocation_url : Proc(IMDSPRevoked*, Win32cr::Foundation::PWSTR*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMDSPRevoked, lpVtbl : IMDSPRevokedVtbl* do
    GUID = LibC::GUID.new(0xa4e8f2d4_u32, 0x3f31_u16, 0x464d_u16, StaticArray[0xb5_u8, 0x3d_u8, 0x4f_u8, 0xc3_u8, 0x35_u8, 0x99_u8, 0x81_u8, 0x84_u8])
    def query_interface(this : IMDSPRevoked*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMDSPRevoked*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMDSPRevoked*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_revocation_url(this : IMDSPRevoked*, ppwszRevocationURL : Win32cr::Foundation::PWSTR*, pdwBufferLen : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_revocation_url.call(this, ppwszRevocationURL, pdwBufferLen)
    end

  end

  @[Extern]
  record ISCPSecureAuthenticateVtbl,
    query_interface : Proc(ISCPSecureAuthenticate*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISCPSecureAuthenticate*, UInt32),
    release : Proc(ISCPSecureAuthenticate*, UInt32),
    get_secure_query : Proc(ISCPSecureAuthenticate*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISCPSecureAuthenticate, lpVtbl : ISCPSecureAuthenticateVtbl* do
    GUID = LibC::GUID.new(0x1dcb3a0f_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
    def query_interface(this : ISCPSecureAuthenticate*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISCPSecureAuthenticate*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISCPSecureAuthenticate*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_secure_query(this : ISCPSecureAuthenticate*, ppSecureQuery : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_secure_query.call(this, ppSecureQuery)
    end

  end

  @[Extern]
  record ISCPSecureAuthenticate2Vtbl,
    query_interface : Proc(ISCPSecureAuthenticate2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISCPSecureAuthenticate2*, UInt32),
    release : Proc(ISCPSecureAuthenticate2*, UInt32),
    get_secure_query : Proc(ISCPSecureAuthenticate2*, Void**, Win32cr::Foundation::HRESULT),
    get_scp_session : Proc(ISCPSecureAuthenticate2*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISCPSecureAuthenticate2, lpVtbl : ISCPSecureAuthenticate2Vtbl* do
    GUID = LibC::GUID.new(0xb580cfae_u32, 0x1672_u16, 0x47e2_u16, StaticArray[0xac_u8, 0xaa_u8, 0x44_u8, 0xbb_u8, 0xec_u8, 0xbc_u8, 0xae_u8, 0x5b_u8])
    def query_interface(this : ISCPSecureAuthenticate2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISCPSecureAuthenticate2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISCPSecureAuthenticate2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_secure_query(this : ISCPSecureAuthenticate2*, ppSecureQuery : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_secure_query.call(this, ppSecureQuery)
    end
    def get_scp_session(this : ISCPSecureAuthenticate2*, ppSCPSession : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_scp_session.call(this, ppSCPSession)
    end

  end

  @[Extern]
  record ISCPSecureQueryVtbl,
    query_interface : Proc(ISCPSecureQuery*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISCPSecureQuery*, UInt32),
    release : Proc(ISCPSecureQuery*, UInt32),
    get_data_demands : Proc(ISCPSecureQuery*, UInt32*, UInt32*, UInt32*, UInt32*, UInt8*, Win32cr::Foundation::HRESULT),
    examine_data : Proc(ISCPSecureQuery*, UInt32, Win32cr::Foundation::PWSTR, UInt8*, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    make_decision : Proc(ISCPSecureQuery*, UInt32, UInt8*, UInt32, UInt32, UInt8*, UInt32, Void*, Void**, UInt8*, Win32cr::Foundation::HRESULT),
    get_rights : Proc(ISCPSecureQuery*, UInt8*, UInt32, UInt8*, UInt32, Void*, Win32cr::Media::DeviceManager::WMDMRIGHTS**, UInt32*, UInt8*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISCPSecureQuery, lpVtbl : ISCPSecureQueryVtbl* do
    GUID = LibC::GUID.new(0x1dcb3a0d_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
    def query_interface(this : ISCPSecureQuery*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISCPSecureQuery*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISCPSecureQuery*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_data_demands(this : ISCPSecureQuery*, pfuFlags : UInt32*, pdwMinRightsData : UInt32*, pdwMinExamineData : UInt32*, pdwMinDecideData : UInt32*, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_data_demands.call(this, pfuFlags, pdwMinRightsData, pdwMinExamineData, pdwMinDecideData, abMac)
    end
    def examine_data(this : ISCPSecureQuery*, fuFlags : UInt32, pwszExtension : Win32cr::Foundation::PWSTR, pData : UInt8*, dwSize : UInt32, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.examine_data.call(this, fuFlags, pwszExtension, pData, dwSize, abMac)
    end
    def make_decision(this : ISCPSecureQuery*, fuFlags : UInt32, pData : UInt8*, dwSize : UInt32, dwAppSec : UInt32, pbSPSessionKey : UInt8*, dwSessionKeyLen : UInt32, pStorageGlobals : Void*, ppExchange : Void**, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.make_decision.call(this, fuFlags, pData, dwSize, dwAppSec, pbSPSessionKey, dwSessionKeyLen, pStorageGlobals, ppExchange, abMac)
    end
    def get_rights(this : ISCPSecureQuery*, pData : UInt8*, dwSize : UInt32, pbSPSessionKey : UInt8*, dwSessionKeyLen : UInt32, pStgGlobals : Void*, ppRights : Win32cr::Media::DeviceManager::WMDMRIGHTS**, pnRightsCount : UInt32*, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rights.call(this, pData, dwSize, pbSPSessionKey, dwSessionKeyLen, pStgGlobals, ppRights, pnRightsCount, abMac)
    end

  end

  @[Extern]
  record ISCPSecureQuery2Vtbl,
    query_interface : Proc(ISCPSecureQuery2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISCPSecureQuery2*, UInt32),
    release : Proc(ISCPSecureQuery2*, UInt32),
    get_data_demands : Proc(ISCPSecureQuery2*, UInt32*, UInt32*, UInt32*, UInt32*, UInt8*, Win32cr::Foundation::HRESULT),
    examine_data : Proc(ISCPSecureQuery2*, UInt32, Win32cr::Foundation::PWSTR, UInt8*, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    make_decision : Proc(ISCPSecureQuery2*, UInt32, UInt8*, UInt32, UInt32, UInt8*, UInt32, Void*, Void**, UInt8*, Win32cr::Foundation::HRESULT),
    get_rights : Proc(ISCPSecureQuery2*, UInt8*, UInt32, UInt8*, UInt32, Void*, Win32cr::Media::DeviceManager::WMDMRIGHTS**, UInt32*, UInt8*, Win32cr::Foundation::HRESULT),
    make_decision2 : Proc(ISCPSecureQuery2*, UInt32, UInt8*, UInt32, UInt32, UInt8*, UInt32, Void*, UInt8*, UInt32, UInt8*, UInt32, Win32cr::Foundation::PWSTR*, UInt32*, UInt32*, UInt64*, Void*, Void**, UInt8*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISCPSecureQuery2, lpVtbl : ISCPSecureQuery2Vtbl* do
    GUID = LibC::GUID.new(0xebe17e25_u32, 0x4fd7_u16, 0x4632_u16, StaticArray[0xaf_u8, 0x46_u8, 0x6d_u8, 0x93_u8, 0xd4_u8, 0xfc_u8, 0xc7_u8, 0x2e_u8])
    def query_interface(this : ISCPSecureQuery2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISCPSecureQuery2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISCPSecureQuery2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_data_demands(this : ISCPSecureQuery2*, pfuFlags : UInt32*, pdwMinRightsData : UInt32*, pdwMinExamineData : UInt32*, pdwMinDecideData : UInt32*, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_data_demands.call(this, pfuFlags, pdwMinRightsData, pdwMinExamineData, pdwMinDecideData, abMac)
    end
    def examine_data(this : ISCPSecureQuery2*, fuFlags : UInt32, pwszExtension : Win32cr::Foundation::PWSTR, pData : UInt8*, dwSize : UInt32, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.examine_data.call(this, fuFlags, pwszExtension, pData, dwSize, abMac)
    end
    def make_decision(this : ISCPSecureQuery2*, fuFlags : UInt32, pData : UInt8*, dwSize : UInt32, dwAppSec : UInt32, pbSPSessionKey : UInt8*, dwSessionKeyLen : UInt32, pStorageGlobals : Void*, ppExchange : Void**, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.make_decision.call(this, fuFlags, pData, dwSize, dwAppSec, pbSPSessionKey, dwSessionKeyLen, pStorageGlobals, ppExchange, abMac)
    end
    def get_rights(this : ISCPSecureQuery2*, pData : UInt8*, dwSize : UInt32, pbSPSessionKey : UInt8*, dwSessionKeyLen : UInt32, pStgGlobals : Void*, ppRights : Win32cr::Media::DeviceManager::WMDMRIGHTS**, pnRightsCount : UInt32*, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rights.call(this, pData, dwSize, pbSPSessionKey, dwSessionKeyLen, pStgGlobals, ppRights, pnRightsCount, abMac)
    end
    def make_decision2(this : ISCPSecureQuery2*, fuFlags : UInt32, pData : UInt8*, dwSize : UInt32, dwAppSec : UInt32, pbSPSessionKey : UInt8*, dwSessionKeyLen : UInt32, pStorageGlobals : Void*, pAppCertApp : UInt8*, dwAppCertAppLen : UInt32, pAppCertSP : UInt8*, dwAppCertSPLen : UInt32, pszRevocationURL : Win32cr::Foundation::PWSTR*, pdwRevocationURLLen : UInt32*, pdwRevocationBitFlag : UInt32*, pqwFileSize : UInt64*, pUnknown : Void*, ppExchange : Void**, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.make_decision2.call(this, fuFlags, pData, dwSize, dwAppSec, pbSPSessionKey, dwSessionKeyLen, pStorageGlobals, pAppCertApp, dwAppCertAppLen, pAppCertSP, dwAppCertSPLen, pszRevocationURL, pdwRevocationURLLen, pdwRevocationBitFlag, pqwFileSize, pUnknown, ppExchange, abMac)
    end

  end

  @[Extern]
  record ISCPSecureExchangeVtbl,
    query_interface : Proc(ISCPSecureExchange*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISCPSecureExchange*, UInt32),
    release : Proc(ISCPSecureExchange*, UInt32),
    transfer_container_data : Proc(ISCPSecureExchange*, UInt8*, UInt32, UInt32*, UInt8*, Win32cr::Foundation::HRESULT),
    object_data : Proc(ISCPSecureExchange*, UInt8*, UInt32*, UInt8*, Win32cr::Foundation::HRESULT),
    transfer_complete : Proc(ISCPSecureExchange*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISCPSecureExchange, lpVtbl : ISCPSecureExchangeVtbl* do
    GUID = LibC::GUID.new(0x1dcb3a0e_u32, 0x33ed_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x70_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
    def query_interface(this : ISCPSecureExchange*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISCPSecureExchange*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISCPSecureExchange*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def transfer_container_data(this : ISCPSecureExchange*, pData : UInt8*, dwSize : UInt32, pfuReadyFlags : UInt32*, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.transfer_container_data.call(this, pData, dwSize, pfuReadyFlags, abMac)
    end
    def object_data(this : ISCPSecureExchange*, pData : UInt8*, pdwSize : UInt32*, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.object_data.call(this, pData, pdwSize, abMac)
    end
    def transfer_complete(this : ISCPSecureExchange*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.transfer_complete.call(this)
    end

  end

  @[Extern]
  record ISCPSecureExchange2Vtbl,
    query_interface : Proc(ISCPSecureExchange2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISCPSecureExchange2*, UInt32),
    release : Proc(ISCPSecureExchange2*, UInt32),
    transfer_container_data : Proc(ISCPSecureExchange2*, UInt8*, UInt32, UInt32*, UInt8*, Win32cr::Foundation::HRESULT),
    object_data : Proc(ISCPSecureExchange2*, UInt8*, UInt32*, UInt8*, Win32cr::Foundation::HRESULT),
    transfer_complete : Proc(ISCPSecureExchange2*, Win32cr::Foundation::HRESULT),
    transfer_container_data2 : Proc(ISCPSecureExchange2*, UInt8*, UInt32, Void*, UInt32*, UInt8*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISCPSecureExchange2, lpVtbl : ISCPSecureExchange2Vtbl* do
    GUID = LibC::GUID.new(0x6c62fc7b_u32, 0x2690_u16, 0x483f_u16, StaticArray[0x9d_u8, 0x44_u8, 0xa_u8, 0x20_u8, 0xcb_u8, 0x35_u8, 0x57_u8, 0x7c_u8])
    def query_interface(this : ISCPSecureExchange2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISCPSecureExchange2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISCPSecureExchange2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def transfer_container_data(this : ISCPSecureExchange2*, pData : UInt8*, dwSize : UInt32, pfuReadyFlags : UInt32*, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.transfer_container_data.call(this, pData, dwSize, pfuReadyFlags, abMac)
    end
    def object_data(this : ISCPSecureExchange2*, pData : UInt8*, pdwSize : UInt32*, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.object_data.call(this, pData, pdwSize, abMac)
    end
    def transfer_complete(this : ISCPSecureExchange2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.transfer_complete.call(this)
    end
    def transfer_container_data2(this : ISCPSecureExchange2*, pData : UInt8*, dwSize : UInt32, pProgressCallback : Void*, pfuReadyFlags : UInt32*, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.transfer_container_data2.call(this, pData, dwSize, pProgressCallback, pfuReadyFlags, abMac)
    end

  end

  @[Extern]
  record ISCPSecureExchange3Vtbl,
    query_interface : Proc(ISCPSecureExchange3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISCPSecureExchange3*, UInt32),
    release : Proc(ISCPSecureExchange3*, UInt32),
    transfer_container_data : Proc(ISCPSecureExchange3*, UInt8*, UInt32, UInt32*, UInt8*, Win32cr::Foundation::HRESULT),
    object_data : Proc(ISCPSecureExchange3*, UInt8*, UInt32*, UInt8*, Win32cr::Foundation::HRESULT),
    transfer_complete : Proc(ISCPSecureExchange3*, Win32cr::Foundation::HRESULT),
    transfer_container_data2 : Proc(ISCPSecureExchange3*, UInt8*, UInt32, Void*, UInt32*, UInt8*, Win32cr::Foundation::HRESULT),
    transfer_container_data_on_clear_channel : Proc(ISCPSecureExchange3*, Void*, UInt8*, UInt32, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    get_object_data_on_clear_channel : Proc(ISCPSecureExchange3*, Void*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    transfer_complete_for_device : Proc(ISCPSecureExchange3*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISCPSecureExchange3, lpVtbl : ISCPSecureExchange3Vtbl* do
    GUID = LibC::GUID.new(0xab4e77e4_u32, 0x8908_u16, 0x4b17_u16, StaticArray[0xbd_u8, 0x2a_u8, 0xb1_u8, 0xdb_u8, 0xe6_u8, 0xdd_u8, 0x69_u8, 0xe1_u8])
    def query_interface(this : ISCPSecureExchange3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISCPSecureExchange3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISCPSecureExchange3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def transfer_container_data(this : ISCPSecureExchange3*, pData : UInt8*, dwSize : UInt32, pfuReadyFlags : UInt32*, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.transfer_container_data.call(this, pData, dwSize, pfuReadyFlags, abMac)
    end
    def object_data(this : ISCPSecureExchange3*, pData : UInt8*, pdwSize : UInt32*, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.object_data.call(this, pData, pdwSize, abMac)
    end
    def transfer_complete(this : ISCPSecureExchange3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.transfer_complete.call(this)
    end
    def transfer_container_data2(this : ISCPSecureExchange3*, pData : UInt8*, dwSize : UInt32, pProgressCallback : Void*, pfuReadyFlags : UInt32*, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.transfer_container_data2.call(this, pData, dwSize, pProgressCallback, pfuReadyFlags, abMac)
    end
    def transfer_container_data_on_clear_channel(this : ISCPSecureExchange3*, pDevice : Void*, pData : UInt8*, dwSize : UInt32, pProgressCallback : Void*, pfuReadyFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.transfer_container_data_on_clear_channel.call(this, pDevice, pData, dwSize, pProgressCallback, pfuReadyFlags)
    end
    def get_object_data_on_clear_channel(this : ISCPSecureExchange3*, pDevice : Void*, pData : UInt8*, pdwSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_data_on_clear_channel.call(this, pDevice, pData, pdwSize)
    end
    def transfer_complete_for_device(this : ISCPSecureExchange3*, pDevice : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.transfer_complete_for_device.call(this, pDevice)
    end

  end

  @[Extern]
  record ISCPSessionVtbl,
    query_interface : Proc(ISCPSession*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISCPSession*, UInt32),
    release : Proc(ISCPSession*, UInt32),
    begin_session : Proc(ISCPSession*, Void*, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    end_session : Proc(ISCPSession*, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    get_secure_query : Proc(ISCPSession*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISCPSession, lpVtbl : ISCPSessionVtbl* do
    GUID = LibC::GUID.new(0x88a3e6ed_u32, 0xeee4_u16, 0x4619_u16, StaticArray[0xbb_u8, 0xb3_u8, 0xfd_u8, 0x4f_u8, 0xb6_u8, 0x27_u8, 0x15_u8, 0xd1_u8])
    def query_interface(this : ISCPSession*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISCPSession*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISCPSession*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def begin_session(this : ISCPSession*, pIDevice : Void*, pCtx : UInt8*, dwSizeCtx : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_session.call(this, pIDevice, pCtx, dwSizeCtx)
    end
    def end_session(this : ISCPSession*, pCtx : UInt8*, dwSizeCtx : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_session.call(this, pCtx, dwSizeCtx)
    end
    def get_secure_query(this : ISCPSession*, ppSecureQuery : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_secure_query.call(this, ppSecureQuery)
    end

  end

  @[Extern]
  record ISCPSecureQuery3Vtbl,
    query_interface : Proc(ISCPSecureQuery3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISCPSecureQuery3*, UInt32),
    release : Proc(ISCPSecureQuery3*, UInt32),
    get_data_demands : Proc(ISCPSecureQuery3*, UInt32*, UInt32*, UInt32*, UInt32*, UInt8*, Win32cr::Foundation::HRESULT),
    examine_data : Proc(ISCPSecureQuery3*, UInt32, Win32cr::Foundation::PWSTR, UInt8*, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    make_decision : Proc(ISCPSecureQuery3*, UInt32, UInt8*, UInt32, UInt32, UInt8*, UInt32, Void*, Void**, UInt8*, Win32cr::Foundation::HRESULT),
    get_rights : Proc(ISCPSecureQuery3*, UInt8*, UInt32, UInt8*, UInt32, Void*, Win32cr::Media::DeviceManager::WMDMRIGHTS**, UInt32*, UInt8*, Win32cr::Foundation::HRESULT),
    make_decision2 : Proc(ISCPSecureQuery3*, UInt32, UInt8*, UInt32, UInt32, UInt8*, UInt32, Void*, UInt8*, UInt32, UInt8*, UInt32, Win32cr::Foundation::PWSTR*, UInt32*, UInt32*, UInt64*, Void*, Void**, UInt8*, Win32cr::Foundation::HRESULT),
    get_rights_on_clear_channel : Proc(ISCPSecureQuery3*, UInt8*, UInt32, UInt8*, UInt32, Void*, Void*, Win32cr::Media::DeviceManager::WMDMRIGHTS**, UInt32*, Win32cr::Foundation::HRESULT),
    make_decision_on_clear_channel : Proc(ISCPSecureQuery3*, UInt32, UInt8*, UInt32, UInt32, UInt8*, UInt32, Void*, Void*, UInt8*, UInt32, UInt8*, UInt32, Win32cr::Foundation::PWSTR*, UInt32*, UInt32*, UInt64*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISCPSecureQuery3, lpVtbl : ISCPSecureQuery3Vtbl* do
    GUID = LibC::GUID.new(0xb7edd1a2_u32, 0x4dab_u16, 0x484b_u16, StaticArray[0xb3_u8, 0xc5_u8, 0xad_u8, 0x39_u8, 0xb8_u8, 0xb4_u8, 0xc0_u8, 0xb1_u8])
    def query_interface(this : ISCPSecureQuery3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISCPSecureQuery3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISCPSecureQuery3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_data_demands(this : ISCPSecureQuery3*, pfuFlags : UInt32*, pdwMinRightsData : UInt32*, pdwMinExamineData : UInt32*, pdwMinDecideData : UInt32*, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_data_demands.call(this, pfuFlags, pdwMinRightsData, pdwMinExamineData, pdwMinDecideData, abMac)
    end
    def examine_data(this : ISCPSecureQuery3*, fuFlags : UInt32, pwszExtension : Win32cr::Foundation::PWSTR, pData : UInt8*, dwSize : UInt32, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.examine_data.call(this, fuFlags, pwszExtension, pData, dwSize, abMac)
    end
    def make_decision(this : ISCPSecureQuery3*, fuFlags : UInt32, pData : UInt8*, dwSize : UInt32, dwAppSec : UInt32, pbSPSessionKey : UInt8*, dwSessionKeyLen : UInt32, pStorageGlobals : Void*, ppExchange : Void**, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.make_decision.call(this, fuFlags, pData, dwSize, dwAppSec, pbSPSessionKey, dwSessionKeyLen, pStorageGlobals, ppExchange, abMac)
    end
    def get_rights(this : ISCPSecureQuery3*, pData : UInt8*, dwSize : UInt32, pbSPSessionKey : UInt8*, dwSessionKeyLen : UInt32, pStgGlobals : Void*, ppRights : Win32cr::Media::DeviceManager::WMDMRIGHTS**, pnRightsCount : UInt32*, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rights.call(this, pData, dwSize, pbSPSessionKey, dwSessionKeyLen, pStgGlobals, ppRights, pnRightsCount, abMac)
    end
    def make_decision2(this : ISCPSecureQuery3*, fuFlags : UInt32, pData : UInt8*, dwSize : UInt32, dwAppSec : UInt32, pbSPSessionKey : UInt8*, dwSessionKeyLen : UInt32, pStorageGlobals : Void*, pAppCertApp : UInt8*, dwAppCertAppLen : UInt32, pAppCertSP : UInt8*, dwAppCertSPLen : UInt32, pszRevocationURL : Win32cr::Foundation::PWSTR*, pdwRevocationURLLen : UInt32*, pdwRevocationBitFlag : UInt32*, pqwFileSize : UInt64*, pUnknown : Void*, ppExchange : Void**, abMac : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.make_decision2.call(this, fuFlags, pData, dwSize, dwAppSec, pbSPSessionKey, dwSessionKeyLen, pStorageGlobals, pAppCertApp, dwAppCertAppLen, pAppCertSP, dwAppCertSPLen, pszRevocationURL, pdwRevocationURLLen, pdwRevocationBitFlag, pqwFileSize, pUnknown, ppExchange, abMac)
    end
    def get_rights_on_clear_channel(this : ISCPSecureQuery3*, pData : UInt8*, dwSize : UInt32, pbSPSessionKey : UInt8*, dwSessionKeyLen : UInt32, pStgGlobals : Void*, pProgressCallback : Void*, ppRights : Win32cr::Media::DeviceManager::WMDMRIGHTS**, pnRightsCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rights_on_clear_channel.call(this, pData, dwSize, pbSPSessionKey, dwSessionKeyLen, pStgGlobals, pProgressCallback, ppRights, pnRightsCount)
    end
    def make_decision_on_clear_channel(this : ISCPSecureQuery3*, fuFlags : UInt32, pData : UInt8*, dwSize : UInt32, dwAppSec : UInt32, pbSPSessionKey : UInt8*, dwSessionKeyLen : UInt32, pStorageGlobals : Void*, pProgressCallback : Void*, pAppCertApp : UInt8*, dwAppCertAppLen : UInt32, pAppCertSP : UInt8*, dwAppCertSPLen : UInt32, pszRevocationURL : Win32cr::Foundation::PWSTR*, pdwRevocationURLLen : UInt32*, pdwRevocationBitFlag : UInt32*, pqwFileSize : UInt64*, pUnknown : Void*, ppExchange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.make_decision_on_clear_channel.call(this, fuFlags, pData, dwSize, dwAppSec, pbSPSessionKey, dwSessionKeyLen, pStorageGlobals, pProgressCallback, pAppCertApp, dwAppCertAppLen, pAppCertSP, dwAppCertSPLen, pszRevocationURL, pdwRevocationURLLen, pdwRevocationBitFlag, pqwFileSize, pUnknown, ppExchange)
    end

  end

  @[Extern]
  record IComponentAuthenticateVtbl,
    query_interface : Proc(IComponentAuthenticate*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IComponentAuthenticate*, UInt32),
    release : Proc(IComponentAuthenticate*, UInt32),
    sac_auth : Proc(IComponentAuthenticate*, UInt32, UInt32, UInt8*, UInt32, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    sac_get_protocols : Proc(IComponentAuthenticate*, UInt32**, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IComponentAuthenticate, lpVtbl : IComponentAuthenticateVtbl* do
    GUID = LibC::GUID.new(0xa9889c00_u32, 0x6d2b_u16, 0x11d3_u16, StaticArray[0x84_u8, 0x96_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xdb_u8, 0xc0_u8])
    def query_interface(this : IComponentAuthenticate*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IComponentAuthenticate*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IComponentAuthenticate*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def sac_auth(this : IComponentAuthenticate*, dwProtocolID : UInt32, dwPass : UInt32, pbDataIn : UInt8*, dwDataInLen : UInt32, ppbDataOut : UInt8**, pdwDataOutLen : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sac_auth.call(this, dwProtocolID, dwPass, pbDataIn, dwDataInLen, ppbDataOut, pdwDataOutLen)
    end
    def sac_get_protocols(this : IComponentAuthenticate*, ppdwProtocols : UInt32**, pdwProtocolCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sac_get_protocols.call(this, ppdwProtocols, pdwProtocolCount)
    end

  end

  @[Extern]
  record IWMDMLoggerVtbl,
    query_interface : Proc(IWMDMLogger*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMDMLogger*, UInt32),
    release : Proc(IWMDMLogger*, UInt32),
    is_enabled : Proc(IWMDMLogger*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    enable : Proc(IWMDMLogger*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_log_file_name : Proc(IWMDMLogger*, Win32cr::Foundation::PSTR, UInt32, Win32cr::Foundation::HRESULT),
    set_log_file_name : Proc(IWMDMLogger*, Win32cr::Foundation::PSTR, Win32cr::Foundation::HRESULT),
    log_string : Proc(IWMDMLogger*, UInt32, Win32cr::Foundation::PSTR, Win32cr::Foundation::PSTR, Win32cr::Foundation::HRESULT),
    log_dword : Proc(IWMDMLogger*, UInt32, Win32cr::Foundation::PSTR, Win32cr::Foundation::PSTR, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IWMDMLogger*, Win32cr::Foundation::HRESULT),
    get_size_params : Proc(IWMDMLogger*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    set_size_params : Proc(IWMDMLogger*, UInt32, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMDMLogger, lpVtbl : IWMDMLoggerVtbl* do
    GUID = LibC::GUID.new(0x110a3200_u32, 0x5a79_u16, 0x11d3_u16, StaticArray[0x8d_u8, 0x78_u8, 0x44_u8, 0x45_u8, 0x53_u8, 0x54_u8, 0x0_u8, 0x0_u8])
    def query_interface(this : IWMDMLogger*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMDMLogger*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMDMLogger*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def is_enabled(this : IWMDMLogger*, pfEnabled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_enabled.call(this, pfEnabled)
    end
    def enable(this : IWMDMLogger*, fEnable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable.call(this, fEnable)
    end
    def get_log_file_name(this : IWMDMLogger*, pszFilename : Win32cr::Foundation::PSTR, nMaxChars : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_log_file_name.call(this, pszFilename, nMaxChars)
    end
    def set_log_file_name(this : IWMDMLogger*, pszFilename : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_log_file_name.call(this, pszFilename)
    end
    def log_string(this : IWMDMLogger*, dwFlags : UInt32, pszSrcName : Win32cr::Foundation::PSTR, pszLog : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.log_string.call(this, dwFlags, pszSrcName, pszLog)
    end
    def log_dword(this : IWMDMLogger*, dwFlags : UInt32, pszSrcName : Win32cr::Foundation::PSTR, pszLogFormat : Win32cr::Foundation::PSTR, dwLog : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.log_dword.call(this, dwFlags, pszSrcName, pszLogFormat, dwLog)
    end
    def reset(this : IWMDMLogger*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def get_size_params(this : IWMDMLogger*, pdwMaxSize : UInt32*, pdwShrinkToSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_size_params.call(this, pdwMaxSize, pdwShrinkToSize)
    end
    def set_size_params(this : IWMDMLogger*, dwMaxSize : UInt32, dwShrinkToSize : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_size_params.call(this, dwMaxSize, dwShrinkToSize)
    end

  end

end