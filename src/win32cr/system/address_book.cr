require "./../foundation.cr"
require "./com.cr"
require "./com/structured_storage.cr"

module Win32cr::System::AddressBook
  alias LPALLOCATEBUFFER = Proc(UInt32, Void**, Int32)*

  alias LPALLOCATEMORE = Proc(UInt32, Void*, Void**, Int32)*

  alias LPFREEBUFFER = Proc(Void*, UInt32)*

  alias LPNOTIFCALLBACK = Proc(Void*, UInt32, Win32cr::System::AddressBook::NOTIFICATION*, Int32)*

  alias LPFNABSDI = Proc(LibC::UIntPtrT, Void*, Win32cr::Foundation::BOOL)*

  alias LPFNDISMISS = Proc(LibC::UIntPtrT, Void*, Void)*

  alias LPFNBUTTON = Proc(LibC::UIntPtrT, Void*, UInt32, Win32cr::System::AddressBook::ENTRYID*, UInt32, Int32)*

  alias CALLERRELEASE = Proc(UInt32, Void*, Void*, Void)*

  alias PFNIDLE = Proc(Void*, Win32cr::Foundation::BOOL)*

  alias LPOPENSTREAMONFILE = Proc(Win32cr::System::AddressBook::LPALLOCATEBUFFER, Win32cr::System::AddressBook::LPFREEBUFFER, UInt32, Int8*, Int8*, Void**, Win32cr::Foundation::HRESULT)*

  alias LPDISPATCHNOTIFICATIONS = Proc(UInt32, Win32cr::Foundation::HRESULT)*

  alias LPCREATECONVERSATIONINDEX = Proc(UInt32, UInt8*, UInt32*, UInt8**, Int32)*

  alias IWABOBJECT_QueryInterface_METHOD = Proc(LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)*

  alias IWABOBJECT_AddRef_METHOD = Proc(UInt32)*

  alias IWABOBJECT_Release_METHOD = Proc(UInt32)*

  alias IWABOBJECT_GetLastError_METHOD = Proc(Win32cr::Foundation::HRESULT, UInt32, Win32cr::System::AddressBook::MAPIERROR**, Win32cr::Foundation::HRESULT)*

  alias IWABOBJECT_AllocateBuffer_METHOD = Proc(UInt32, Void**, Win32cr::Foundation::HRESULT)*

  alias IWABOBJECT_AllocateMore_METHOD = Proc(UInt32, Void*, Void**, Win32cr::Foundation::HRESULT)*

  alias IWABOBJECT_FreeBuffer_METHOD = Proc(Void*, Win32cr::Foundation::HRESULT)*

  alias IWABOBJECT_Backup_METHOD = Proc(Win32cr::Foundation::PSTR, Win32cr::Foundation::HRESULT)*

  alias IWABOBJECT_Import_METHOD = Proc(Win32cr::Foundation::PSTR, Win32cr::Foundation::HRESULT)*

  alias IWABOBJECT_Find_METHOD = Proc(Void*, Win32cr::Foundation::HWND, Win32cr::Foundation::HRESULT)*

  alias IWABOBJECT_VCardDisplay_METHOD = Proc(Void*, Win32cr::Foundation::HWND, Win32cr::Foundation::PSTR, Win32cr::Foundation::HRESULT)*

  alias IWABOBJECT_LDAPUrl_METHOD = Proc(Void*, Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::PSTR, Void**, Win32cr::Foundation::HRESULT)*

  alias IWABOBJECT_VCardCreate_METHOD = Proc(Void*, UInt32, Win32cr::Foundation::PSTR, Void*, Win32cr::Foundation::HRESULT)*

  alias IWABOBJECT_VCardRetrieve_METHOD = Proc(Void*, UInt32, Win32cr::Foundation::PSTR, Void**, Win32cr::Foundation::HRESULT)*

  alias IWABOBJECT_GetMe_METHOD = Proc(Void*, UInt32, UInt32*, Win32cr::System::AddressBook::SBinary*, Win32cr::Foundation::HWND, Win32cr::Foundation::HRESULT)*

  alias IWABOBJECT_SetMe_METHOD = Proc(Void*, UInt32, Win32cr::System::AddressBook::SBinary, Win32cr::Foundation::HWND, Win32cr::Foundation::HRESULT)*

  alias LPWABOPEN = Proc(Void**, Void**, Win32cr::System::AddressBook::WAB_PARAM*, UInt32, Win32cr::Foundation::HRESULT)*

  alias LPWABOPENEX = Proc(Void**, Void**, Win32cr::System::AddressBook::WAB_PARAM*, UInt32, Win32cr::System::AddressBook::LPALLOCATEBUFFER, Win32cr::System::AddressBook::LPALLOCATEMORE, Win32cr::System::AddressBook::LPFREEBUFFER, Win32cr::Foundation::HRESULT)*

  alias LPWABALLOCATEBUFFER = Proc(Void*, UInt32, Void**, Int32)*

  alias LPWABALLOCATEMORE = Proc(Void*, UInt32, Void*, Void**, Int32)*

  alias LPWABFREEBUFFER = Proc(Void*, Void*, UInt32)*

  PROP_ID_SECURE_MIN = 26608_u32
  PROP_ID_SECURE_MAX = 26623_u32
  MAPI_DIM = 1_u32
  Fmapiunicode = 0_u32
  Hrsuccess = 0_u32
  MAPI_P1 = 268435456_u32
  MAPI_SUBMITTED = 2147483648_u32
  MAPI_SHORTTERM = 128_u32
  MAPI_NOTRECIP = 64_u32
  MAPI_THISSESSION = 32_u32
  MAPI_NOW = 16_u32
  MAPI_NOTRESERVED = 8_u32
  MAPI_COMPOUND = 128_u32
  Cchprofilenamemax = 64_u32
  Cchprofilepassmax = 64_u32
  MV_FLAG = 4096_u32
  PROP_ID_NULL = 0_u32
  PROP_ID_INVALID = 65535_u32
  MV_INSTANCE = 8192_u32
  TABLE_CHANGED = 1_u32
  TABLE_ERROR = 2_u32
  TABLE_ROW_ADDED = 3_u32
  TABLE_ROW_DELETED = 4_u32
  TABLE_ROW_MODIFIED = 5_u32
  TABLE_SORT_DONE = 6_u32
  TABLE_RESTRICT_DONE = 7_u32
  TABLE_SETCOL_DONE = 8_u32
  TABLE_RELOAD = 9_u32
  Szmapinotificationmsg = "MAPI Notify window message"
  MAPI_ERROR_VERSION = 0_i32
  MAPI_USE_DEFAULT = 64_u32
  MNID_ID = 0_u32
  MNID_STRING = 1_u32
  WAB_LOCAL_CONTAINERS = 1048576_u32
  WAB_PROFILE_CONTENTS = 2097152_u32
  WAB_IGNORE_PROFILES = 8388608_u32
  MAPI_ONE_OFF_NO_RICH_INFO = 1_u32
  UI_SERVICE = 2_u32
  SERVICE_UI_ALWAYS = 2_u32
  SERVICE_UI_ALLOWED = 16_u32
  UI_CURRENT_PROVIDER_FIRST = 4_u32
  WABOBJECT_LDAPURL_RETURN_MAILUSER = 1_u32
  WABOBJECT_ME_NEW = 1_u32
  WABOBJECT_ME_NOCREATE = 2_u32
  WAB_VCARD_FILE = 0_u32
  WAB_VCARD_STREAM = 1_u32
  WAB_USE_OE_SENDMAIL = 1_u32
  WAB_ENABLE_PROFILES = 4194304_u32
  WAB_DISPLAY_LDAPURL = 1_u32
  WAB_CONTEXT_ADRLIST = 2_u32
  WAB_DISPLAY_ISNTDS = 4_u32
  WAB_DLL_NAME = "WAB32.DLL"
  WAB_DLL_PATH_KEY = "Software\\Microsoft\\WAB\\DLLPath"
  E_IMAPI_REQUEST_CANCELLED = -1062600702_i32
  E_IMAPI_RECORDER_REQUIRED = -1062600701_i32
  S_IMAPI_SPEEDADJUSTED = 11141124_i32
  S_IMAPI_ROTATIONADJUSTED = 11141125_i32
  S_IMAPI_BOTHADJUSTED = 11141126_i32
  E_IMAPI_BURN_VERIFICATION_FAILED = -1062600697_i32
  S_IMAPI_COMMAND_HAS_SENSE_DATA = 11141632_i32
  E_IMAPI_RECORDER_NO_SUCH_MODE_PAGE = -1062600191_i32
  E_IMAPI_RECORDER_MEDIA_NO_MEDIA = -1062600190_i32
  E_IMAPI_RECORDER_MEDIA_INCOMPATIBLE = -1062600189_i32
  E_IMAPI_RECORDER_MEDIA_UPSIDE_DOWN = -1062600188_i32
  E_IMAPI_RECORDER_MEDIA_BECOMING_READY = -1062600187_i32
  E_IMAPI_RECORDER_MEDIA_FORMAT_IN_PROGRESS = -1062600186_i32
  E_IMAPI_RECORDER_MEDIA_BUSY = -1062600185_i32
  E_IMAPI_RECORDER_INVALID_MODE_PARAMETERS = -1062600184_i32
  E_IMAPI_RECORDER_MEDIA_WRITE_PROTECTED = -1062600183_i32
  E_IMAPI_RECORDER_NO_SUCH_FEATURE = -1062600182_i32
  E_IMAPI_RECORDER_FEATURE_IS_NOT_CURRENT = -1062600181_i32
  E_IMAPI_RECORDER_GET_CONFIGURATION_NOT_SUPPORTED = -1062600180_i32
  E_IMAPI_RECORDER_COMMAND_TIMEOUT = -1062600179_i32
  E_IMAPI_RECORDER_DVD_STRUCTURE_NOT_PRESENT = -1062600178_i32
  E_IMAPI_RECORDER_MEDIA_SPEED_MISMATCH = -1062600177_i32
  E_IMAPI_RECORDER_LOCKED = -1062600176_i32
  E_IMAPI_RECORDER_CLIENT_NAME_IS_NOT_VALID = -1062600175_i32
  E_IMAPI_RECORDER_MEDIA_NOT_FORMATTED = -1062600174_i32
  E_IMAPI_RECORDER_INVALID_RESPONSE_FROM_DEVICE = -1062599937_i32
  E_IMAPI_LOSS_OF_STREAMING = -1062599936_i32
  E_IMAPI_UNEXPECTED_RESPONSE_FROM_DEVICE = -1062599935_i32
  S_IMAPI_WRITE_NOT_IN_PROGRESS = 11141890_i32
  E_IMAPI_DF2DATA_WRITE_IN_PROGRESS = -1062599680_i32
  E_IMAPI_DF2DATA_WRITE_NOT_IN_PROGRESS = -1062599679_i32
  E_IMAPI_DF2DATA_INVALID_MEDIA_STATE = -1062599678_i32
  E_IMAPI_DF2DATA_STREAM_NOT_SUPPORTED = -1062599677_i32
  E_IMAPI_DF2DATA_STREAM_TOO_LARGE_FOR_CURRENT_MEDIA = -1062599676_i32
  E_IMAPI_DF2DATA_MEDIA_NOT_BLANK = -1062599675_i32
  E_IMAPI_DF2DATA_MEDIA_IS_NOT_SUPPORTED = -1062599674_i32
  E_IMAPI_DF2DATA_RECORDER_NOT_SUPPORTED = -1062599673_i32
  E_IMAPI_DF2DATA_CLIENT_NAME_IS_NOT_VALID = -1062599672_i32
  E_IMAPI_DF2TAO_WRITE_IN_PROGRESS = -1062599424_i32
  E_IMAPI_DF2TAO_WRITE_NOT_IN_PROGRESS = -1062599423_i32
  E_IMAPI_DF2TAO_MEDIA_IS_NOT_PREPARED = -1062599422_i32
  E_IMAPI_DF2TAO_MEDIA_IS_PREPARED = -1062599421_i32
  E_IMAPI_DF2TAO_PROPERTY_FOR_BLANK_MEDIA_ONLY = -1062599420_i32
  E_IMAPI_DF2TAO_TABLE_OF_CONTENTS_EMPTY_DISC = -1062599419_i32
  E_IMAPI_DF2TAO_MEDIA_IS_NOT_BLANK = -1062599418_i32
  E_IMAPI_DF2TAO_MEDIA_IS_NOT_SUPPORTED = -1062599417_i32
  E_IMAPI_DF2TAO_TRACK_LIMIT_REACHED = -1062599416_i32
  E_IMAPI_DF2TAO_NOT_ENOUGH_SPACE = -1062599415_i32
  E_IMAPI_DF2TAO_NO_RECORDER_SPECIFIED = -1062599414_i32
  E_IMAPI_DF2TAO_INVALID_ISRC = -1062599413_i32
  E_IMAPI_DF2TAO_INVALID_MCN = -1062599412_i32
  E_IMAPI_DF2TAO_STREAM_NOT_SUPPORTED = -1062599411_i32
  E_IMAPI_DF2TAO_RECORDER_NOT_SUPPORTED = -1062599410_i32
  E_IMAPI_DF2TAO_CLIENT_NAME_IS_NOT_VALID = -1062599409_i32
  E_IMAPI_DF2RAW_WRITE_IN_PROGRESS = -1062599168_i32
  E_IMAPI_DF2RAW_WRITE_NOT_IN_PROGRESS = -1062599167_i32
  E_IMAPI_DF2RAW_MEDIA_IS_NOT_PREPARED = -1062599166_i32
  E_IMAPI_DF2RAW_MEDIA_IS_PREPARED = -1062599165_i32
  E_IMAPI_DF2RAW_CLIENT_NAME_IS_NOT_VALID = -1062599164_i32
  E_IMAPI_DF2RAW_MEDIA_IS_NOT_BLANK = -1062599162_i32
  E_IMAPI_DF2RAW_MEDIA_IS_NOT_SUPPORTED = -1062599161_i32
  E_IMAPI_DF2RAW_NOT_ENOUGH_SPACE = -1062599159_i32
  E_IMAPI_DF2RAW_NO_RECORDER_SPECIFIED = -1062599158_i32
  E_IMAPI_DF2RAW_STREAM_NOT_SUPPORTED = -1062599155_i32
  E_IMAPI_DF2RAW_DATA_BLOCK_TYPE_NOT_SUPPORTED = -1062599154_i32
  E_IMAPI_DF2RAW_STREAM_LEADIN_TOO_SHORT = -1062599153_i32
  E_IMAPI_DF2RAW_RECORDER_NOT_SUPPORTED = -1062599152_i32
  E_IMAPI_ERASE_RECORDER_IN_USE = -2136340224_i32
  E_IMAPI_ERASE_ONLY_ONE_RECORDER_SUPPORTED = -2136340223_i32
  E_IMAPI_ERASE_DISC_INFORMATION_TOO_SMALL = -2136340222_i32
  E_IMAPI_ERASE_MODE_PAGE_2A_TOO_SMALL = -2136340221_i32
  E_IMAPI_ERASE_MEDIA_IS_NOT_ERASABLE = -2136340220_i32
  E_IMAPI_ERASE_DRIVE_FAILED_ERASE_COMMAND = -2136340219_i32
  E_IMAPI_ERASE_TOOK_LONGER_THAN_ONE_HOUR = -2136340218_i32
  E_IMAPI_ERASE_UNEXPECTED_DRIVE_RESPONSE_DURING_ERASE = -2136340217_i32
  E_IMAPI_ERASE_DRIVE_FAILED_SPINUP_COMMAND = -2136340216_i32
  E_IMAPI_ERASE_MEDIA_IS_NOT_SUPPORTED = -1062598391_i32
  E_IMAPI_ERASE_RECORDER_NOT_SUPPORTED = -1062598390_i32
  E_IMAPI_ERASE_CLIENT_NAME_IS_NOT_VALID = -1062598389_i32
  E_IMAPI_RAW_IMAGE_IS_READ_ONLY = -2136339968_i32
  E_IMAPI_RAW_IMAGE_TOO_MANY_TRACKS = -2136339967_i32
  E_IMAPI_RAW_IMAGE_SECTOR_TYPE_NOT_SUPPORTED = -2136339966_i32
  E_IMAPI_RAW_IMAGE_NO_TRACKS = -2136339965_i32
  E_IMAPI_RAW_IMAGE_TRACKS_ALREADY_ADDED = -2136339964_i32
  E_IMAPI_RAW_IMAGE_INSUFFICIENT_SPACE = -2136339963_i32
  E_IMAPI_RAW_IMAGE_TOO_MANY_TRACK_INDEXES = -2136339962_i32
  E_IMAPI_RAW_IMAGE_TRACK_INDEX_NOT_FOUND = -2136339961_i32
  S_IMAPI_RAW_IMAGE_TRACK_INDEX_ALREADY_EXISTS = 11143688_i32
  E_IMAPI_RAW_IMAGE_TRACK_INDEX_OFFSET_ZERO_CANNOT_BE_CLEARED = -2136339959_i32
  E_IMAPI_RAW_IMAGE_TRACK_INDEX_TOO_CLOSE_TO_OTHER_INDEX = -2136339958_i32
  FACILITY_IMAPI2 = 170_u32
  IMAPI_E_FSI_INTERNAL_ERROR = -1062555392_i32
  IMAPI_E_INVALID_PARAM = -1062555391_i32
  IMAPI_E_READONLY = -1062555390_i32
  IMAPI_E_NO_OUTPUT = -1062555389_i32
  IMAPI_E_INVALID_VOLUME_NAME = -1062555388_i32
  IMAPI_E_INVALID_DATE = -1062555387_i32
  IMAPI_E_FILE_SYSTEM_NOT_EMPTY = -1062555386_i32
  IMAPI_E_NOT_FILE = -1062555384_i32
  IMAPI_E_NOT_DIR = -1062555383_i32
  IMAPI_E_DIR_NOT_EMPTY = -1062555382_i32
  IMAPI_E_NOT_IN_FILE_SYSTEM = -1062555381_i32
  IMAPI_E_INVALID_PATH = -1062555376_i32
  IMAPI_E_RESTRICTED_NAME_VIOLATION = -1062555375_i32
  IMAPI_E_DUP_NAME = -1062555374_i32
  IMAPI_E_NO_UNIQUE_NAME = -1062555373_i32
  IMAPI_E_ITEM_NOT_FOUND = -1062555368_i32
  IMAPI_E_FILE_NOT_FOUND = -1062555367_i32
  IMAPI_E_DIR_NOT_FOUND = -1062555366_i32
  IMAPI_E_IMAGE_SIZE_LIMIT = -1062555360_i32
  IMAPI_E_IMAGE_TOO_BIG = -1062555359_i32
  IMAPI_E_DATA_STREAM_INCONSISTENCY = -1062555352_i32
  IMAPI_E_DATA_STREAM_READ_FAILURE = -1062555351_i32
  IMAPI_E_DATA_STREAM_CREATE_FAILURE = -1062555350_i32
  IMAPI_E_DIRECTORY_READ_FAILURE = -1062555349_i32
  IMAPI_E_TOO_MANY_DIRS = -1062555344_i32
  IMAPI_E_ISO9660_LEVELS = -1062555343_i32
  IMAPI_E_DATA_TOO_BIG = -1062555342_i32
  IMAPI_E_INCOMPATIBLE_PREVIOUS_SESSION = -1062555341_i32
  IMAPI_E_STASHFILE_OPEN_FAILURE = -1062555336_i32
  IMAPI_E_STASHFILE_SEEK_FAILURE = -1062555335_i32
  IMAPI_E_STASHFILE_WRITE_FAILURE = -1062555334_i32
  IMAPI_E_STASHFILE_READ_FAILURE = -1062555333_i32
  IMAPI_E_INVALID_WORKING_DIRECTORY = -1062555328_i32
  IMAPI_E_WORKING_DIRECTORY_SPACE = -1062555327_i32
  IMAPI_E_STASHFILE_MOVE = -1062555326_i32
  IMAPI_E_BOOT_IMAGE_DATA = -1062555320_i32
  IMAPI_E_BOOT_OBJECT_CONFLICT = -1062555319_i32
  IMAPI_E_BOOT_EMULATION_IMAGE_SIZE_MISMATCH = -1062555318_i32
  IMAPI_E_EMPTY_DISC = -1062555312_i32
  IMAPI_E_NO_SUPPORTED_FILE_SYSTEM = -1062555311_i32
  IMAPI_E_FILE_SYSTEM_NOT_FOUND = -1062555310_i32
  IMAPI_E_FILE_SYSTEM_READ_CONSISTENCY_ERROR = -1062555309_i32
  IMAPI_E_FILE_SYSTEM_FEATURE_NOT_SUPPORTED = -1062555308_i32
  IMAPI_E_IMPORT_TYPE_COLLISION_FILE_EXISTS_AS_DIRECTORY = -1062555307_i32
  IMAPI_E_IMPORT_SEEK_FAILURE = -1062555306_i32
  IMAPI_E_IMPORT_READ_FAILURE = -1062555305_i32
  IMAPI_E_DISC_MISMATCH = -1062555304_i32
  IMAPI_E_IMPORT_MEDIA_NOT_ALLOWED = -1062555303_i32
  IMAPI_E_UDF_NOT_WRITE_COMPATIBLE = -1062555302_i32
  IMAPI_E_INCOMPATIBLE_MULTISESSION_TYPE = -1062555301_i32
  IMAPI_E_NO_COMPATIBLE_MULTISESSION_TYPE = -1062555300_i32
  IMAPI_E_MULTISESSION_NOT_SET = -1062555299_i32
  IMAPI_E_IMPORT_TYPE_COLLISION_DIRECTORY_EXISTS_AS_FILE = -1062555298_i32
  IMAPI_S_IMAGE_FEATURE_NOT_SUPPORTED = 11186527_i32
  IMAPI_E_PROPERTY_NOT_ACCESSIBLE = -1062555296_i32
  IMAPI_E_UDF_REVISION_CHANGE_NOT_ALLOWED = -1062555295_i32
  IMAPI_E_BAD_MULTISESSION_PARAMETER = -1062555294_i32
  IMAPI_E_FILE_SYSTEM_CHANGE_NOT_ALLOWED = -1062555293_i32
  IMAPI_E_IMAGEMANAGER_IMAGE_NOT_ALIGNED = -1062555136_i32
  IMAPI_E_IMAGEMANAGER_NO_VALID_VD_FOUND = -1062555135_i32
  IMAPI_E_IMAGEMANAGER_NO_IMAGE = -1062555134_i32
  IMAPI_E_IMAGEMANAGER_IMAGE_TOO_BIG = -1062555133_i32
  MAPI_E_CALL_FAILED = -2147467259_i32
  MAPI_E_NOT_ENOUGH_MEMORY = -2147024882_i32
  MAPI_E_INVALID_PARAMETER = -2147024809_i32
  MAPI_E_INTERFACE_NOT_SUPPORTED = -2147467262_i32
  MAPI_E_NO_ACCESS = -2147024891_i32
  TAD_ALL_ROWS = 1_u32
  PRILOWEST = -32768_i32
  PRIHIGHEST = 32767_u32
  PRIUSER = 0_u32
  OPENSTREAMONFILE = "OpenStreamOnFile"
  Szhrdispatchnotifications = "HrDispatchNotifications"
  Szsccreateconversationindex = "ScCreateConversationIndex"

  enum Gender
    Genderunspecified = 0_i32
    Genderfemale = 1_i32
    Gendermale = 2_i32
  end

  @[Extern]
  record ENTRYID,
    abFlags : UInt8[4],
    ab : UInt8*

  @[Extern]
  record MAPIUID,
    ab : UInt8[16]

  @[Extern]
  record SPropTagArray,
    cValues : UInt32,
    aulPropTag : UInt32*

  @[Extern]
  record SBinary,
    cb : UInt32,
    lpb : UInt8*

  @[Extern]
  record SShortArray,
    cValues : UInt32,
    lpi : Int16*

  @[Extern]
  record SGuidArray,
    cValues : UInt32,
    lpguid : LibC::GUID*

  @[Extern]
  record SRealArray,
    cValues : UInt32,
    lpflt : Float32*

  @[Extern]
  record SLongArray,
    cValues : UInt32,
    lpl : Int32*

  @[Extern]
  record SLargeIntegerArray,
    cValues : UInt32,
    lpli : Win32cr::Foundation::LARGE_INTEGER*

  @[Extern]
  record SDateTimeArray,
    cValues : UInt32,
    lpft : Win32cr::Foundation::FILETIME*

  @[Extern]
  record SAppTimeArray,
    cValues : UInt32,
    lpat : Float64*

  @[Extern]
  record SCurrencyArray,
    cValues : UInt32,
    lpcur : Win32cr::System::Com::CY*

  @[Extern]
  record SBinaryArray,
    cValues : UInt32,
    lpbin : Win32cr::System::AddressBook::SBinary*

  @[Extern]
  record SDoubleArray,
    cValues : UInt32,
    lpdbl : Float64*

  @[Extern]
  record SWStringArray,
    cValues : UInt32,
    lppszW : Win32cr::Foundation::PWSTR*

  @[Extern]
  record SLPSTRArray,
    cValues : UInt32,
    lppszA : Win32cr::Foundation::PSTR*

  @[Extern(union: true)]
  record PV,
    i : Int16,
    l : Int32,
    ul : UInt32,
    flt : Float32,
    dbl : Float64,
    b : UInt16,
    cur : Win32cr::System::Com::CY,
    at : Float64,
    ft : Win32cr::Foundation::FILETIME,
    lpszA : Win32cr::Foundation::PSTR,
    bin : Win32cr::System::AddressBook::SBinary,
    lpszW : Win32cr::Foundation::PWSTR,
    lpguid : LibC::GUID*,
    li : Win32cr::Foundation::LARGE_INTEGER,
    m_vi : Win32cr::System::AddressBook::SShortArray,
    m_vl : Win32cr::System::AddressBook::SLongArray,
    m_vflt : Win32cr::System::AddressBook::SRealArray,
    m_vdbl : Win32cr::System::AddressBook::SDoubleArray,
    m_vcur : Win32cr::System::AddressBook::SCurrencyArray,
    m_vat : Win32cr::System::AddressBook::SAppTimeArray,
    m_vft : Win32cr::System::AddressBook::SDateTimeArray,
    m_vbin : Win32cr::System::AddressBook::SBinaryArray,
    m_vsz_a : Win32cr::System::AddressBook::SLPSTRArray,
    m_vsz_w : Win32cr::System::AddressBook::SWStringArray,
    m_vguid : Win32cr::System::AddressBook::SGuidArray,
    m_vli : Win32cr::System::AddressBook::SLargeIntegerArray,
    err : Int32,
    x : Int32

  @[Extern]
  record SPropValue,
    ulPropTag : UInt32,
    dwAlignPad : UInt32,
    value : Win32cr::System::AddressBook::PV

  @[Extern]
  record SPropProblem,
    ulIndex : UInt32,
    ulPropTag : UInt32,
    scode : Int32

  @[Extern]
  record SPropProblemArray,
    cProblem : UInt32,
    aProblem : Win32cr::System::AddressBook::SPropProblem*

  @[Extern]
  record FLATENTRY,
    cb : UInt32,
    abEntry : UInt8*

  @[Extern]
  record FLATENTRYLIST,
    cEntries : UInt32,
    cbEntries : UInt32,
    abEntries : UInt8*

  @[Extern]
  record MTSID,
    cb : UInt32,
    ab : UInt8*

  @[Extern]
  record FLATMTSIDLIST,
    cMTSIDs : UInt32,
    cbMTSIDs : UInt32,
    abMTSIDs : UInt8*

  @[Extern]
  record ADRENTRY,
    ulReserved1 : UInt32,
    cValues : UInt32,
    rgPropVals : Win32cr::System::AddressBook::SPropValue*

  @[Extern]
  record ADRLIST,
    cEntries : UInt32,
    aEntries : Win32cr::System::AddressBook::ADRENTRY*

  @[Extern]
  record SRow,
    ulAdrEntryPad : UInt32,
    cValues : UInt32,
    lpProps : Win32cr::System::AddressBook::SPropValue*

  @[Extern]
  record SRowSet,
    cRows : UInt32,
    aRow : Win32cr::System::AddressBook::SRow*

  @[Extern]
  record MAPIERROR,
    ulVersion : UInt32,
    lpszError : Int8*,
    lpszComponent : Int8*,
    ulLowLevelError : UInt32,
    ulContext : UInt32

  @[Extern]
  record ERROR_NOTIFICATION,
    cbEntryID : UInt32,
    lpEntryID : Win32cr::System::AddressBook::ENTRYID*,
    scode : Int32,
    ulFlags : UInt32,
    lpMAPIError : Win32cr::System::AddressBook::MAPIERROR*

  @[Extern]
  record NEWMAIL_NOTIFICATION,
    cbEntryID : UInt32,
    lpEntryID : Win32cr::System::AddressBook::ENTRYID*,
    cbParentID : UInt32,
    lpParentID : Win32cr::System::AddressBook::ENTRYID*,
    ulFlags : UInt32,
    lpszMessageClass : Int8*,
    ulMessageFlags : UInt32

  @[Extern]
  record OBJECT_NOTIFICATION,
    cbEntryID : UInt32,
    lpEntryID : Win32cr::System::AddressBook::ENTRYID*,
    ulObjType : UInt32,
    cbParentID : UInt32,
    lpParentID : Win32cr::System::AddressBook::ENTRYID*,
    cbOldID : UInt32,
    lpOldID : Win32cr::System::AddressBook::ENTRYID*,
    cbOldParentID : UInt32,
    lpOldParentID : Win32cr::System::AddressBook::ENTRYID*,
    lpPropTagArray : Win32cr::System::AddressBook::SPropTagArray*

  @[Extern]
  record TABLE_NOTIFICATION,
    ulTableEvent : UInt32,
    hResult : Win32cr::Foundation::HRESULT,
    propIndex : Win32cr::System::AddressBook::SPropValue,
    propPrior : Win32cr::System::AddressBook::SPropValue,
    row : Win32cr::System::AddressBook::SRow,
    ulPad : UInt32

  @[Extern]
  record EXTENDED_NOTIFICATION,
    ulEvent : UInt32,
    cb : UInt32,
    pbEventParameters : UInt8*

  @[Extern]
  record STATUS_OBJECT_NOTIFICATION,
    cbEntryID : UInt32,
    lpEntryID : Win32cr::System::AddressBook::ENTRYID*,
    cValues : UInt32,
    lpPropVals : Win32cr::System::AddressBook::SPropValue*

  @[Extern]
  record NOTIFICATION,
    ulEventType : UInt32,
    ulAlignPad : UInt32,
    info : Info_e__union do

    # Nested Type Info_e__union
    @[Extern(union: true)]
    record Info_e__union,
      err : Win32cr::System::AddressBook::ERROR_NOTIFICATION,
      newmail : Win32cr::System::AddressBook::NEWMAIL_NOTIFICATION,
      obj : Win32cr::System::AddressBook::OBJECT_NOTIFICATION,
      tab : Win32cr::System::AddressBook::TABLE_NOTIFICATION,
      ext : Win32cr::System::AddressBook::EXTENDED_NOTIFICATION,
      statobj : Win32cr::System::AddressBook::STATUS_OBJECT_NOTIFICATION

  end

  @[Extern]
  record MAPINAMEID,
    lpguid : LibC::GUID*,
    ulKind : UInt32,
    kind : Kind_e__Union do

    # Nested Type Kind_e__Union
    @[Extern(union: true)]
    record Kind_e__Union,
      lID : Int32,
      lpwstrName : Win32cr::Foundation::PWSTR

  end

  @[Extern]
  record SSortOrder,
    ulPropTag : UInt32,
    ulOrder : UInt32

  @[Extern]
  record SSortOrderSet,
    cSorts : UInt32,
    cCategories : UInt32,
    cExpanded : UInt32,
    aSort : Win32cr::System::AddressBook::SSortOrder*

  @[Extern]
  record SAndRestriction,
    cRes : UInt32,
    lpRes : Win32cr::System::AddressBook::SRestriction*

  @[Extern]
  record SOrRestriction,
    cRes : UInt32,
    lpRes : Win32cr::System::AddressBook::SRestriction*

  @[Extern]
  record SNotRestriction,
    ulReserved : UInt32,
    lpRes : Win32cr::System::AddressBook::SRestriction*

  @[Extern]
  record SContentRestriction,
    ulFuzzyLevel : UInt32,
    ulPropTag : UInt32,
    lpProp : Win32cr::System::AddressBook::SPropValue*

  @[Extern]
  record SBitMaskRestriction,
    relBMR : UInt32,
    ulPropTag : UInt32,
    ulMask : UInt32

  @[Extern]
  record SPropertyRestriction,
    relop : UInt32,
    ulPropTag : UInt32,
    lpProp : Win32cr::System::AddressBook::SPropValue*

  @[Extern]
  record SComparePropsRestriction,
    relop : UInt32,
    ulPropTag1 : UInt32,
    ulPropTag2 : UInt32

  @[Extern]
  record SSizeRestriction,
    relop : UInt32,
    ulPropTag : UInt32,
    cb : UInt32

  @[Extern]
  record SExistRestriction,
    ulReserved1 : UInt32,
    ulPropTag : UInt32,
    ulReserved2 : UInt32

  @[Extern]
  record SSubRestriction,
    ulSubObject : UInt32,
    lpRes : Win32cr::System::AddressBook::SRestriction*

  @[Extern]
  record SCommentRestriction,
    cValues : UInt32,
    lpRes : Win32cr::System::AddressBook::SRestriction*,
    lpProp : Win32cr::System::AddressBook::SPropValue*

  @[Extern]
  record SRestriction,
    rt : UInt32,
    res : Res_e__union do

    # Nested Type Res_e__union
    @[Extern(union: true)]
    record Res_e__union,
      resCompareProps : Win32cr::System::AddressBook::SComparePropsRestriction,
      resAnd : Win32cr::System::AddressBook::SAndRestriction,
      resOr : Win32cr::System::AddressBook::SOrRestriction,
      resNot : Win32cr::System::AddressBook::SNotRestriction,
      resContent : Win32cr::System::AddressBook::SContentRestriction,
      resProperty : Win32cr::System::AddressBook::SPropertyRestriction,
      resBitMask : Win32cr::System::AddressBook::SBitMaskRestriction,
      resSize : Win32cr::System::AddressBook::SSizeRestriction,
      resExist : Win32cr::System::AddressBook::SExistRestriction,
      resSub : Win32cr::System::AddressBook::SSubRestriction,
      resComment : Win32cr::System::AddressBook::SCommentRestriction

  end

  @[Extern]
  record Flaglist,
    cFlags : UInt32,
    ulFlag : UInt32*

  @[Extern]
  record ADRPARM,
    cbABContEntryID : UInt32,
    lpABContEntryID : Win32cr::System::AddressBook::ENTRYID*,
    ulFlags : UInt32,
    lpReserved : Void*,
    ulHelpContext : UInt32,
    lpszHelpFileName : Int8*,
    lpfnABSDI : Win32cr::System::AddressBook::LPFNABSDI,
    lpfnDismiss : Win32cr::System::AddressBook::LPFNDISMISS,
    lpvDismissContext : Void*,
    lpszCaption : Int8*,
    lpszNewEntryTitle : Int8*,
    lpszDestWellsTitle : Int8*,
    cDestFields : UInt32,
    nDestFieldFocus : UInt32,
    lppszDestTitles : Int8**,
    lpulDestComps : UInt32*,
    lpContRestriction : Win32cr::System::AddressBook::SRestriction*,
    lpHierRestriction : Win32cr::System::AddressBook::SRestriction*

  @[Extern]
  record DTBLLABEL,
    ulbLpszLabelName : UInt32,
    ulFlags : UInt32

  @[Extern]
  record DTBLEDIT,
    ulbLpszCharsAllowed : UInt32,
    ulFlags : UInt32,
    ulNumCharsAllowed : UInt32,
    ulPropTag : UInt32

  @[Extern]
  record DTBLLBX,
    ulFlags : UInt32,
    ulPRSetProperty : UInt32,
    ulPRTableName : UInt32

  @[Extern]
  record DTBLCOMBOBOX,
    ulbLpszCharsAllowed : UInt32,
    ulFlags : UInt32,
    ulNumCharsAllowed : UInt32,
    ulPRPropertyName : UInt32,
    ulPRTableName : UInt32

  @[Extern]
  record DTBLDDLBX,
    ulFlags : UInt32,
    ulPRDisplayProperty : UInt32,
    ulPRSetProperty : UInt32,
    ulPRTableName : UInt32

  @[Extern]
  record DTBLCHECKBOX,
    ulbLpszLabel : UInt32,
    ulFlags : UInt32,
    ulPRPropertyName : UInt32

  @[Extern]
  record DTBLGROUPBOX,
    ulbLpszLabel : UInt32,
    ulFlags : UInt32

  @[Extern]
  record DTBLBUTTON,
    ulbLpszLabel : UInt32,
    ulFlags : UInt32,
    ulPRControl : UInt32

  @[Extern]
  record DTBLPAGE,
    ulbLpszLabel : UInt32,
    ulFlags : UInt32,
    ulbLpszComponent : UInt32,
    ulContext : UInt32

  @[Extern]
  record DTBLRADIOBUTTON,
    ulbLpszLabel : UInt32,
    ulFlags : UInt32,
    ulcButtons : UInt32,
    ulPropTag : UInt32,
    lReturnValue : Int32

  @[Extern]
  record DTBLMVLISTBOX,
    ulFlags : UInt32,
    ulMVPropTag : UInt32

  @[Extern]
  record DTBLMVDDLBX,
    ulFlags : UInt32,
    ulMVPropTag : UInt32

  @[Extern]
  record DTCTL,
    ulCtlType : UInt32,
    ulCtlFlags : UInt32,
    lpbNotif : UInt8*,
    cbNotif : UInt32,
    lpszFilter : Int8*,
    ulItemID : UInt32,
    ctl : Ctl_e__union do

    # Nested Type Ctl_e__union
    @[Extern(union: true)]
    record Ctl_e__union,
      lpv : Void*,
      lplabel : Win32cr::System::AddressBook::DTBLLABEL*,
      lpedit : Win32cr::System::AddressBook::DTBLEDIT*,
      lplbx : Win32cr::System::AddressBook::DTBLLBX*,
      lpcombobox : Win32cr::System::AddressBook::DTBLCOMBOBOX*,
      lpddlbx : Win32cr::System::AddressBook::DTBLDDLBX*,
      lpcheckbox : Win32cr::System::AddressBook::DTBLCHECKBOX*,
      lpgroupbox : Win32cr::System::AddressBook::DTBLGROUPBOX*,
      lpbutton : Win32cr::System::AddressBook::DTBLBUTTON*,
      lpradiobutton : Win32cr::System::AddressBook::DTBLRADIOBUTTON*,
      lpmvlbx : Win32cr::System::AddressBook::DTBLMVLISTBOX*,
      lpmvddlbx : Win32cr::System::AddressBook::DTBLMVDDLBX*,
      lppage : Win32cr::System::AddressBook::DTBLPAGE*

  end

  @[Extern]
  record DTPAGE,
    cctl : UInt32,
    lpszResourceName : Int8*,
    anonymous : Anonymous_e__Union,
    lpctl : Win32cr::System::AddressBook::DTCTL* do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      lpszComponent : Int8*,
      ulItemID : UInt32

  end

  @[Extern]
  record WABACTIONITEM
  @[Extern]
  record WAB_PARAM,
    cbSize : UInt32,
    hwnd : Win32cr::Foundation::HWND,
    szFileName : Win32cr::Foundation::PSTR,
    ulFlags : UInt32,
    guidPSExt : LibC::GUID

  @[Extern]
  record WABIMPORTPARAM,
    cbSize : UInt32,
    lpAdrBook : Void*,
    hWnd : Win32cr::Foundation::HWND,
    ulFlags : UInt32,
    lpszFileName : Win32cr::Foundation::PSTR

  @[Extern]
  record WABEXTDISPLAY,
    cbSize : UInt32,
    lpWABObject : Void*,
    lpAdrBook : Void*,
    lpPropObj : Void*,
    fReadOnly : Win32cr::Foundation::BOOL,
    fDataChanged : Win32cr::Foundation::BOOL,
    ulFlags : UInt32,
    lpv : Void*,
    lpsz : Int8*

  @[Extern]
  record NOTIFKEY,
    cb : UInt32,
    ab : UInt8*

  @[Extern]
  record IMAPIAdviseSinkVtbl,
    query_interface : Proc(IMAPIAdviseSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMAPIAdviseSink*, UInt32),
    release : Proc(IMAPIAdviseSink*, UInt32),
    on_notify : Proc(IMAPIAdviseSink*, UInt32, Win32cr::System::AddressBook::NOTIFICATION*, UInt32)


  @[Extern]
  record IMAPIAdviseSink, lpVtbl : IMAPIAdviseSinkVtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def query_interface(this : IMAPIAdviseSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMAPIAdviseSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMAPIAdviseSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_notify(this : IMAPIAdviseSink*, cNotif : UInt32, lpNotifications : Win32cr::System::AddressBook::NOTIFICATION*) : UInt32
      @lpVtbl.try &.value.on_notify.call(this, cNotif, lpNotifications)
    end

  end

  @[Extern]
  record IMAPIProgressVtbl,
    query_interface : Proc(IMAPIProgress*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMAPIProgress*, UInt32),
    release : Proc(IMAPIProgress*, UInt32),
    progress : Proc(IMAPIProgress*, UInt32, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    get_flags : Proc(IMAPIProgress*, UInt32*, Win32cr::Foundation::HRESULT),
    get_max : Proc(IMAPIProgress*, UInt32*, Win32cr::Foundation::HRESULT),
    get_min : Proc(IMAPIProgress*, UInt32*, Win32cr::Foundation::HRESULT),
    set_limits : Proc(IMAPIProgress*, UInt32*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMAPIProgress, lpVtbl : IMAPIProgressVtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def query_interface(this : IMAPIProgress*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMAPIProgress*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMAPIProgress*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def progress(this : IMAPIProgress*, ulValue : UInt32, ulCount : UInt32, ulTotal : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.progress.call(this, ulValue, ulCount, ulTotal)
    end
    def get_flags(this : IMAPIProgress*, lpulFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_flags.call(this, lpulFlags)
    end
    def get_max(this : IMAPIProgress*, lpulMax : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max.call(this, lpulMax)
    end
    def get_min(this : IMAPIProgress*, lpulMin : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_min.call(this, lpulMin)
    end
    def set_limits(this : IMAPIProgress*, lpulMin : UInt32*, lpulMax : UInt32*, lpulFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_limits.call(this, lpulMin, lpulMax, lpulFlags)
    end

  end

  @[Extern]
  record IMAPIPropVtbl,
    query_interface : Proc(IMAPIProp*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMAPIProp*, UInt32),
    release : Proc(IMAPIProp*, UInt32),
    get_last_error : Proc(IMAPIProp*, Win32cr::Foundation::HRESULT, UInt32, Win32cr::System::AddressBook::MAPIERROR**, Win32cr::Foundation::HRESULT),
    save_changes : Proc(IMAPIProp*, UInt32, Win32cr::Foundation::HRESULT),
    get_props : Proc(IMAPIProp*, Win32cr::System::AddressBook::SPropTagArray*, UInt32, UInt32*, Win32cr::System::AddressBook::SPropValue**, Win32cr::Foundation::HRESULT),
    get_prop_list : Proc(IMAPIProp*, UInt32, Win32cr::System::AddressBook::SPropTagArray**, Win32cr::Foundation::HRESULT),
    open_property : Proc(IMAPIProp*, UInt32, LibC::GUID*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    set_props : Proc(IMAPIProp*, UInt32, Win32cr::System::AddressBook::SPropValue*, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    delete_props : Proc(IMAPIProp*, Win32cr::System::AddressBook::SPropTagArray*, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    copy_to : Proc(IMAPIProp*, UInt32, LibC::GUID*, Win32cr::System::AddressBook::SPropTagArray*, LibC::UIntPtrT, Void*, LibC::GUID*, Void*, UInt32, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    copy_props : Proc(IMAPIProp*, Win32cr::System::AddressBook::SPropTagArray*, LibC::UIntPtrT, Void*, LibC::GUID*, Void*, UInt32, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    get_names_from_i_ds : Proc(IMAPIProp*, Win32cr::System::AddressBook::SPropTagArray**, LibC::GUID*, UInt32, UInt32*, Win32cr::System::AddressBook::MAPINAMEID***, Win32cr::Foundation::HRESULT),
    get_i_ds_from_names : Proc(IMAPIProp*, UInt32, Win32cr::System::AddressBook::MAPINAMEID**, UInt32, Win32cr::System::AddressBook::SPropTagArray**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMAPIProp, lpVtbl : IMAPIPropVtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def query_interface(this : IMAPIProp*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMAPIProp*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMAPIProp*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_last_error(this : IMAPIProp*, hResult : Win32cr::Foundation::HRESULT, ulFlags : UInt32, lppMAPIError : Win32cr::System::AddressBook::MAPIERROR**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_last_error.call(this, hResult, ulFlags, lppMAPIError)
    end
    def save_changes(this : IMAPIProp*, ulFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_changes.call(this, ulFlags)
    end
    def get_props(this : IMAPIProp*, lpPropTagArray : Win32cr::System::AddressBook::SPropTagArray*, ulFlags : UInt32, lpcValues : UInt32*, lppPropArray : Win32cr::System::AddressBook::SPropValue**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_props.call(this, lpPropTagArray, ulFlags, lpcValues, lppPropArray)
    end
    def get_prop_list(this : IMAPIProp*, ulFlags : UInt32, lppPropTagArray : Win32cr::System::AddressBook::SPropTagArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prop_list.call(this, ulFlags, lppPropTagArray)
    end
    def open_property(this : IMAPIProp*, ulPropTag : UInt32, lpiid : LibC::GUID*, ulInterfaceOptions : UInt32, ulFlags : UInt32, lppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_property.call(this, ulPropTag, lpiid, ulInterfaceOptions, ulFlags, lppUnk)
    end
    def set_props(this : IMAPIProp*, cValues : UInt32, lpPropArray : Win32cr::System::AddressBook::SPropValue*, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_props.call(this, cValues, lpPropArray, lppProblems)
    end
    def delete_props(this : IMAPIProp*, lpPropTagArray : Win32cr::System::AddressBook::SPropTagArray*, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_props.call(this, lpPropTagArray, lppProblems)
    end
    def copy_to(this : IMAPIProp*, ciidExclude : UInt32, rgiidExclude : LibC::GUID*, lpExcludeProps : Win32cr::System::AddressBook::SPropTagArray*, ulUIParam : LibC::UIntPtrT, lpProgress : Void*, lpInterface : LibC::GUID*, lpDestObj : Void*, ulFlags : UInt32, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_to.call(this, ciidExclude, rgiidExclude, lpExcludeProps, ulUIParam, lpProgress, lpInterface, lpDestObj, ulFlags, lppProblems)
    end
    def copy_props(this : IMAPIProp*, lpIncludeProps : Win32cr::System::AddressBook::SPropTagArray*, ulUIParam : LibC::UIntPtrT, lpProgress : Void*, lpInterface : LibC::GUID*, lpDestObj : Void*, ulFlags : UInt32, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_props.call(this, lpIncludeProps, ulUIParam, lpProgress, lpInterface, lpDestObj, ulFlags, lppProblems)
    end
    def get_names_from_i_ds(this : IMAPIProp*, lppPropTags : Win32cr::System::AddressBook::SPropTagArray**, lpPropSetGuid : LibC::GUID*, ulFlags : UInt32, lpcPropNames : UInt32*, lpppPropNames : Win32cr::System::AddressBook::MAPINAMEID***) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_names_from_i_ds.call(this, lppPropTags, lpPropSetGuid, ulFlags, lpcPropNames, lpppPropNames)
    end
    def get_i_ds_from_names(this : IMAPIProp*, cPropNames : UInt32, lppPropNames : Win32cr::System::AddressBook::MAPINAMEID**, ulFlags : UInt32, lppPropTags : Win32cr::System::AddressBook::SPropTagArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_from_names.call(this, cPropNames, lppPropNames, ulFlags, lppPropTags)
    end

  end

  @[Extern]
  record IMAPITableVtbl,
    query_interface : Proc(IMAPITable*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMAPITable*, UInt32),
    release : Proc(IMAPITable*, UInt32),
    get_last_error : Proc(IMAPITable*, Win32cr::Foundation::HRESULT, UInt32, Win32cr::System::AddressBook::MAPIERROR**, Win32cr::Foundation::HRESULT),
    advise : Proc(IMAPITable*, UInt32, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    unadvise : Proc(IMAPITable*, UInt32, Win32cr::Foundation::HRESULT),
    get_status : Proc(IMAPITable*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    set_columns : Proc(IMAPITable*, Win32cr::System::AddressBook::SPropTagArray*, UInt32, Win32cr::Foundation::HRESULT),
    query_columns : Proc(IMAPITable*, UInt32, Win32cr::System::AddressBook::SPropTagArray**, Win32cr::Foundation::HRESULT),
    get_row_count : Proc(IMAPITable*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    seek_row : Proc(IMAPITable*, UInt32, Int32, Int32*, Win32cr::Foundation::HRESULT),
    seek_row_approx : Proc(IMAPITable*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    query_position : Proc(IMAPITable*, UInt32*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    find_row : Proc(IMAPITable*, Win32cr::System::AddressBook::SRestriction*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    restrict : Proc(IMAPITable*, Win32cr::System::AddressBook::SRestriction*, UInt32, Win32cr::Foundation::HRESULT),
    create_bookmark : Proc(IMAPITable*, UInt32*, Win32cr::Foundation::HRESULT),
    free_bookmark : Proc(IMAPITable*, UInt32, Win32cr::Foundation::HRESULT),
    sort_table : Proc(IMAPITable*, Win32cr::System::AddressBook::SSortOrderSet*, UInt32, Win32cr::Foundation::HRESULT),
    query_sort_order : Proc(IMAPITable*, Win32cr::System::AddressBook::SSortOrderSet**, Win32cr::Foundation::HRESULT),
    query_rows : Proc(IMAPITable*, Int32, UInt32, Win32cr::System::AddressBook::SRowSet**, Win32cr::Foundation::HRESULT),
    abort : Proc(IMAPITable*, Win32cr::Foundation::HRESULT),
    expand_row : Proc(IMAPITable*, UInt32, UInt8*, UInt32, UInt32, Win32cr::System::AddressBook::SRowSet**, UInt32*, Win32cr::Foundation::HRESULT),
    collapse_row : Proc(IMAPITable*, UInt32, UInt8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    wait_for_completion : Proc(IMAPITable*, UInt32, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_collapse_state : Proc(IMAPITable*, UInt32, UInt32, UInt8*, UInt32*, UInt8**, Win32cr::Foundation::HRESULT),
    set_collapse_state : Proc(IMAPITable*, UInt32, UInt32, UInt8*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMAPITable, lpVtbl : IMAPITableVtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def query_interface(this : IMAPITable*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMAPITable*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMAPITable*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_last_error(this : IMAPITable*, hResult : Win32cr::Foundation::HRESULT, ulFlags : UInt32, lppMAPIError : Win32cr::System::AddressBook::MAPIERROR**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_last_error.call(this, hResult, ulFlags, lppMAPIError)
    end
    def advise(this : IMAPITable*, ulEventMask : UInt32, lpAdviseSink : Void*, lpulConnection : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.advise.call(this, ulEventMask, lpAdviseSink, lpulConnection)
    end
    def unadvise(this : IMAPITable*, ulConnection : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unadvise.call(this, ulConnection)
    end
    def get_status(this : IMAPITable*, lpulTableStatus : UInt32*, lpulTableType : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, lpulTableStatus, lpulTableType)
    end
    def set_columns(this : IMAPITable*, lpPropTagArray : Win32cr::System::AddressBook::SPropTagArray*, ulFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_columns.call(this, lpPropTagArray, ulFlags)
    end
    def query_columns(this : IMAPITable*, ulFlags : UInt32, lpPropTagArray : Win32cr::System::AddressBook::SPropTagArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_columns.call(this, ulFlags, lpPropTagArray)
    end
    def get_row_count(this : IMAPITable*, ulFlags : UInt32, lpulCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_row_count.call(this, ulFlags, lpulCount)
    end
    def seek_row(this : IMAPITable*, bkOrigin : UInt32, lRowCount : Int32, lplRowsSought : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.seek_row.call(this, bkOrigin, lRowCount, lplRowsSought)
    end
    def seek_row_approx(this : IMAPITable*, ulNumerator : UInt32, ulDenominator : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.seek_row_approx.call(this, ulNumerator, ulDenominator)
    end
    def query_position(this : IMAPITable*, lpulRow : UInt32*, lpulNumerator : UInt32*, lpulDenominator : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_position.call(this, lpulRow, lpulNumerator, lpulDenominator)
    end
    def find_row(this : IMAPITable*, lpRestriction : Win32cr::System::AddressBook::SRestriction*, bkOrigin : UInt32, ulFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_row.call(this, lpRestriction, bkOrigin, ulFlags)
    end
    def restrict(this : IMAPITable*, lpRestriction : Win32cr::System::AddressBook::SRestriction*, ulFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.restrict.call(this, lpRestriction, ulFlags)
    end
    def create_bookmark(this : IMAPITable*, lpbkPosition : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_bookmark.call(this, lpbkPosition)
    end
    def free_bookmark(this : IMAPITable*, bkPosition : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.free_bookmark.call(this, bkPosition)
    end
    def sort_table(this : IMAPITable*, lpSortCriteria : Win32cr::System::AddressBook::SSortOrderSet*, ulFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sort_table.call(this, lpSortCriteria, ulFlags)
    end
    def query_sort_order(this : IMAPITable*, lppSortCriteria : Win32cr::System::AddressBook::SSortOrderSet**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_sort_order.call(this, lppSortCriteria)
    end
    def query_rows(this : IMAPITable*, lRowCount : Int32, ulFlags : UInt32, lppRows : Win32cr::System::AddressBook::SRowSet**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_rows.call(this, lRowCount, ulFlags, lppRows)
    end
    def abort(this : IMAPITable*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.abort.call(this)
    end
    def expand_row(this : IMAPITable*, cbInstanceKey : UInt32, pbInstanceKey : UInt8*, ulRowCount : UInt32, ulFlags : UInt32, lppRows : Win32cr::System::AddressBook::SRowSet**, lpulMoreRows : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.expand_row.call(this, cbInstanceKey, pbInstanceKey, ulRowCount, ulFlags, lppRows, lpulMoreRows)
    end
    def collapse_row(this : IMAPITable*, cbInstanceKey : UInt32, pbInstanceKey : UInt8*, ulFlags : UInt32, lpulRowCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.collapse_row.call(this, cbInstanceKey, pbInstanceKey, ulFlags, lpulRowCount)
    end
    def wait_for_completion(this : IMAPITable*, ulFlags : UInt32, ulTimeout : UInt32, lpulTableStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wait_for_completion.call(this, ulFlags, ulTimeout, lpulTableStatus)
    end
    def get_collapse_state(this : IMAPITable*, ulFlags : UInt32, cbInstanceKey : UInt32, lpbInstanceKey : UInt8*, lpcbCollapseState : UInt32*, lppbCollapseState : UInt8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_collapse_state.call(this, ulFlags, cbInstanceKey, lpbInstanceKey, lpcbCollapseState, lppbCollapseState)
    end
    def set_collapse_state(this : IMAPITable*, ulFlags : UInt32, cbCollapseState : UInt32, pbCollapseState : UInt8*, lpbkLocation : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_collapse_state.call(this, ulFlags, cbCollapseState, pbCollapseState, lpbkLocation)
    end

  end

  @[Extern]
  record IProfSectVtbl,
    query_interface : Proc(IProfSect*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IProfSect*, UInt32),
    release : Proc(IProfSect*, UInt32),
    get_last_error : Proc(IProfSect*, Win32cr::Foundation::HRESULT, UInt32, Win32cr::System::AddressBook::MAPIERROR**, Win32cr::Foundation::HRESULT),
    save_changes : Proc(IProfSect*, UInt32, Win32cr::Foundation::HRESULT),
    get_props : Proc(IProfSect*, Win32cr::System::AddressBook::SPropTagArray*, UInt32, UInt32*, Win32cr::System::AddressBook::SPropValue**, Win32cr::Foundation::HRESULT),
    get_prop_list : Proc(IProfSect*, UInt32, Win32cr::System::AddressBook::SPropTagArray**, Win32cr::Foundation::HRESULT),
    open_property : Proc(IProfSect*, UInt32, LibC::GUID*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    set_props : Proc(IProfSect*, UInt32, Win32cr::System::AddressBook::SPropValue*, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    delete_props : Proc(IProfSect*, Win32cr::System::AddressBook::SPropTagArray*, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    copy_to : Proc(IProfSect*, UInt32, LibC::GUID*, Win32cr::System::AddressBook::SPropTagArray*, LibC::UIntPtrT, Void*, LibC::GUID*, Void*, UInt32, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    copy_props : Proc(IProfSect*, Win32cr::System::AddressBook::SPropTagArray*, LibC::UIntPtrT, Void*, LibC::GUID*, Void*, UInt32, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    get_names_from_i_ds : Proc(IProfSect*, Win32cr::System::AddressBook::SPropTagArray**, LibC::GUID*, UInt32, UInt32*, Win32cr::System::AddressBook::MAPINAMEID***, Win32cr::Foundation::HRESULT),
    get_i_ds_from_names : Proc(IProfSect*, UInt32, Win32cr::System::AddressBook::MAPINAMEID**, UInt32, Win32cr::System::AddressBook::SPropTagArray**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IProfSect, lpVtbl : IProfSectVtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def query_interface(this : IProfSect*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IProfSect*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IProfSect*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_last_error(this : IProfSect*, hResult : Win32cr::Foundation::HRESULT, ulFlags : UInt32, lppMAPIError : Win32cr::System::AddressBook::MAPIERROR**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_last_error.call(this, hResult, ulFlags, lppMAPIError)
    end
    def save_changes(this : IProfSect*, ulFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_changes.call(this, ulFlags)
    end
    def get_props(this : IProfSect*, lpPropTagArray : Win32cr::System::AddressBook::SPropTagArray*, ulFlags : UInt32, lpcValues : UInt32*, lppPropArray : Win32cr::System::AddressBook::SPropValue**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_props.call(this, lpPropTagArray, ulFlags, lpcValues, lppPropArray)
    end
    def get_prop_list(this : IProfSect*, ulFlags : UInt32, lppPropTagArray : Win32cr::System::AddressBook::SPropTagArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prop_list.call(this, ulFlags, lppPropTagArray)
    end
    def open_property(this : IProfSect*, ulPropTag : UInt32, lpiid : LibC::GUID*, ulInterfaceOptions : UInt32, ulFlags : UInt32, lppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_property.call(this, ulPropTag, lpiid, ulInterfaceOptions, ulFlags, lppUnk)
    end
    def set_props(this : IProfSect*, cValues : UInt32, lpPropArray : Win32cr::System::AddressBook::SPropValue*, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_props.call(this, cValues, lpPropArray, lppProblems)
    end
    def delete_props(this : IProfSect*, lpPropTagArray : Win32cr::System::AddressBook::SPropTagArray*, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_props.call(this, lpPropTagArray, lppProblems)
    end
    def copy_to(this : IProfSect*, ciidExclude : UInt32, rgiidExclude : LibC::GUID*, lpExcludeProps : Win32cr::System::AddressBook::SPropTagArray*, ulUIParam : LibC::UIntPtrT, lpProgress : Void*, lpInterface : LibC::GUID*, lpDestObj : Void*, ulFlags : UInt32, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_to.call(this, ciidExclude, rgiidExclude, lpExcludeProps, ulUIParam, lpProgress, lpInterface, lpDestObj, ulFlags, lppProblems)
    end
    def copy_props(this : IProfSect*, lpIncludeProps : Win32cr::System::AddressBook::SPropTagArray*, ulUIParam : LibC::UIntPtrT, lpProgress : Void*, lpInterface : LibC::GUID*, lpDestObj : Void*, ulFlags : UInt32, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_props.call(this, lpIncludeProps, ulUIParam, lpProgress, lpInterface, lpDestObj, ulFlags, lppProblems)
    end
    def get_names_from_i_ds(this : IProfSect*, lppPropTags : Win32cr::System::AddressBook::SPropTagArray**, lpPropSetGuid : LibC::GUID*, ulFlags : UInt32, lpcPropNames : UInt32*, lpppPropNames : Win32cr::System::AddressBook::MAPINAMEID***) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_names_from_i_ds.call(this, lppPropTags, lpPropSetGuid, ulFlags, lpcPropNames, lpppPropNames)
    end
    def get_i_ds_from_names(this : IProfSect*, cPropNames : UInt32, lppPropNames : Win32cr::System::AddressBook::MAPINAMEID**, ulFlags : UInt32, lppPropTags : Win32cr::System::AddressBook::SPropTagArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_from_names.call(this, cPropNames, lppPropNames, ulFlags, lppPropTags)
    end

  end

  @[Extern]
  record IMAPIStatusVtbl,
    query_interface : Proc(IMAPIStatus*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMAPIStatus*, UInt32),
    release : Proc(IMAPIStatus*, UInt32),
    get_last_error : Proc(IMAPIStatus*, Win32cr::Foundation::HRESULT, UInt32, Win32cr::System::AddressBook::MAPIERROR**, Win32cr::Foundation::HRESULT),
    save_changes : Proc(IMAPIStatus*, UInt32, Win32cr::Foundation::HRESULT),
    get_props : Proc(IMAPIStatus*, Win32cr::System::AddressBook::SPropTagArray*, UInt32, UInt32*, Win32cr::System::AddressBook::SPropValue**, Win32cr::Foundation::HRESULT),
    get_prop_list : Proc(IMAPIStatus*, UInt32, Win32cr::System::AddressBook::SPropTagArray**, Win32cr::Foundation::HRESULT),
    open_property : Proc(IMAPIStatus*, UInt32, LibC::GUID*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    set_props : Proc(IMAPIStatus*, UInt32, Win32cr::System::AddressBook::SPropValue*, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    delete_props : Proc(IMAPIStatus*, Win32cr::System::AddressBook::SPropTagArray*, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    copy_to : Proc(IMAPIStatus*, UInt32, LibC::GUID*, Win32cr::System::AddressBook::SPropTagArray*, LibC::UIntPtrT, Void*, LibC::GUID*, Void*, UInt32, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    copy_props : Proc(IMAPIStatus*, Win32cr::System::AddressBook::SPropTagArray*, LibC::UIntPtrT, Void*, LibC::GUID*, Void*, UInt32, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    get_names_from_i_ds : Proc(IMAPIStatus*, Win32cr::System::AddressBook::SPropTagArray**, LibC::GUID*, UInt32, UInt32*, Win32cr::System::AddressBook::MAPINAMEID***, Win32cr::Foundation::HRESULT),
    get_i_ds_from_names : Proc(IMAPIStatus*, UInt32, Win32cr::System::AddressBook::MAPINAMEID**, UInt32, Win32cr::System::AddressBook::SPropTagArray**, Win32cr::Foundation::HRESULT),
    validate_state : Proc(IMAPIStatus*, LibC::UIntPtrT, UInt32, Win32cr::Foundation::HRESULT),
    settings_dialog : Proc(IMAPIStatus*, LibC::UIntPtrT, UInt32, Win32cr::Foundation::HRESULT),
    change_password : Proc(IMAPIStatus*, Int8*, Int8*, UInt32, Win32cr::Foundation::HRESULT),
    flush_queues : Proc(IMAPIStatus*, LibC::UIntPtrT, UInt32, Win32cr::System::AddressBook::ENTRYID*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMAPIStatus, lpVtbl : IMAPIStatusVtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def query_interface(this : IMAPIStatus*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMAPIStatus*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMAPIStatus*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_last_error(this : IMAPIStatus*, hResult : Win32cr::Foundation::HRESULT, ulFlags : UInt32, lppMAPIError : Win32cr::System::AddressBook::MAPIERROR**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_last_error.call(this, hResult, ulFlags, lppMAPIError)
    end
    def save_changes(this : IMAPIStatus*, ulFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_changes.call(this, ulFlags)
    end
    def get_props(this : IMAPIStatus*, lpPropTagArray : Win32cr::System::AddressBook::SPropTagArray*, ulFlags : UInt32, lpcValues : UInt32*, lppPropArray : Win32cr::System::AddressBook::SPropValue**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_props.call(this, lpPropTagArray, ulFlags, lpcValues, lppPropArray)
    end
    def get_prop_list(this : IMAPIStatus*, ulFlags : UInt32, lppPropTagArray : Win32cr::System::AddressBook::SPropTagArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prop_list.call(this, ulFlags, lppPropTagArray)
    end
    def open_property(this : IMAPIStatus*, ulPropTag : UInt32, lpiid : LibC::GUID*, ulInterfaceOptions : UInt32, ulFlags : UInt32, lppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_property.call(this, ulPropTag, lpiid, ulInterfaceOptions, ulFlags, lppUnk)
    end
    def set_props(this : IMAPIStatus*, cValues : UInt32, lpPropArray : Win32cr::System::AddressBook::SPropValue*, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_props.call(this, cValues, lpPropArray, lppProblems)
    end
    def delete_props(this : IMAPIStatus*, lpPropTagArray : Win32cr::System::AddressBook::SPropTagArray*, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_props.call(this, lpPropTagArray, lppProblems)
    end
    def copy_to(this : IMAPIStatus*, ciidExclude : UInt32, rgiidExclude : LibC::GUID*, lpExcludeProps : Win32cr::System::AddressBook::SPropTagArray*, ulUIParam : LibC::UIntPtrT, lpProgress : Void*, lpInterface : LibC::GUID*, lpDestObj : Void*, ulFlags : UInt32, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_to.call(this, ciidExclude, rgiidExclude, lpExcludeProps, ulUIParam, lpProgress, lpInterface, lpDestObj, ulFlags, lppProblems)
    end
    def copy_props(this : IMAPIStatus*, lpIncludeProps : Win32cr::System::AddressBook::SPropTagArray*, ulUIParam : LibC::UIntPtrT, lpProgress : Void*, lpInterface : LibC::GUID*, lpDestObj : Void*, ulFlags : UInt32, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_props.call(this, lpIncludeProps, ulUIParam, lpProgress, lpInterface, lpDestObj, ulFlags, lppProblems)
    end
    def get_names_from_i_ds(this : IMAPIStatus*, lppPropTags : Win32cr::System::AddressBook::SPropTagArray**, lpPropSetGuid : LibC::GUID*, ulFlags : UInt32, lpcPropNames : UInt32*, lpppPropNames : Win32cr::System::AddressBook::MAPINAMEID***) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_names_from_i_ds.call(this, lppPropTags, lpPropSetGuid, ulFlags, lpcPropNames, lpppPropNames)
    end
    def get_i_ds_from_names(this : IMAPIStatus*, cPropNames : UInt32, lppPropNames : Win32cr::System::AddressBook::MAPINAMEID**, ulFlags : UInt32, lppPropTags : Win32cr::System::AddressBook::SPropTagArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_from_names.call(this, cPropNames, lppPropNames, ulFlags, lppPropTags)
    end
    def validate_state(this : IMAPIStatus*, ulUIParam : LibC::UIntPtrT, ulFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.validate_state.call(this, ulUIParam, ulFlags)
    end
    def settings_dialog(this : IMAPIStatus*, ulUIParam : LibC::UIntPtrT, ulFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.settings_dialog.call(this, ulUIParam, ulFlags)
    end
    def change_password(this : IMAPIStatus*, lpOldPass : Int8*, lpNewPass : Int8*, ulFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.change_password.call(this, lpOldPass, lpNewPass, ulFlags)
    end
    def flush_queues(this : IMAPIStatus*, ulUIParam : LibC::UIntPtrT, cbTargetTransport : UInt32, lpTargetTransport : Win32cr::System::AddressBook::ENTRYID*, ulFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.flush_queues.call(this, ulUIParam, cbTargetTransport, lpTargetTransport, ulFlags)
    end

  end

  @[Extern]
  record IMAPIContainerVtbl,
    query_interface : Proc(IMAPIContainer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMAPIContainer*, UInt32),
    release : Proc(IMAPIContainer*, UInt32),
    get_last_error : Proc(IMAPIContainer*, Win32cr::Foundation::HRESULT, UInt32, Win32cr::System::AddressBook::MAPIERROR**, Win32cr::Foundation::HRESULT),
    save_changes : Proc(IMAPIContainer*, UInt32, Win32cr::Foundation::HRESULT),
    get_props : Proc(IMAPIContainer*, Win32cr::System::AddressBook::SPropTagArray*, UInt32, UInt32*, Win32cr::System::AddressBook::SPropValue**, Win32cr::Foundation::HRESULT),
    get_prop_list : Proc(IMAPIContainer*, UInt32, Win32cr::System::AddressBook::SPropTagArray**, Win32cr::Foundation::HRESULT),
    open_property : Proc(IMAPIContainer*, UInt32, LibC::GUID*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    set_props : Proc(IMAPIContainer*, UInt32, Win32cr::System::AddressBook::SPropValue*, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    delete_props : Proc(IMAPIContainer*, Win32cr::System::AddressBook::SPropTagArray*, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    copy_to : Proc(IMAPIContainer*, UInt32, LibC::GUID*, Win32cr::System::AddressBook::SPropTagArray*, LibC::UIntPtrT, Void*, LibC::GUID*, Void*, UInt32, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    copy_props : Proc(IMAPIContainer*, Win32cr::System::AddressBook::SPropTagArray*, LibC::UIntPtrT, Void*, LibC::GUID*, Void*, UInt32, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    get_names_from_i_ds : Proc(IMAPIContainer*, Win32cr::System::AddressBook::SPropTagArray**, LibC::GUID*, UInt32, UInt32*, Win32cr::System::AddressBook::MAPINAMEID***, Win32cr::Foundation::HRESULT),
    get_i_ds_from_names : Proc(IMAPIContainer*, UInt32, Win32cr::System::AddressBook::MAPINAMEID**, UInt32, Win32cr::System::AddressBook::SPropTagArray**, Win32cr::Foundation::HRESULT),
    get_contents_table : Proc(IMAPIContainer*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_hierarchy_table : Proc(IMAPIContainer*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    open_entry : Proc(IMAPIContainer*, UInt32, Win32cr::System::AddressBook::ENTRYID*, LibC::GUID*, UInt32, UInt32*, Void**, Win32cr::Foundation::HRESULT),
    set_search_criteria : Proc(IMAPIContainer*, Win32cr::System::AddressBook::SRestriction*, Win32cr::System::AddressBook::SBinaryArray*, UInt32, Win32cr::Foundation::HRESULT),
    get_search_criteria : Proc(IMAPIContainer*, UInt32, Win32cr::System::AddressBook::SRestriction**, Win32cr::System::AddressBook::SBinaryArray**, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMAPIContainer, lpVtbl : IMAPIContainerVtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def query_interface(this : IMAPIContainer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMAPIContainer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMAPIContainer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_last_error(this : IMAPIContainer*, hResult : Win32cr::Foundation::HRESULT, ulFlags : UInt32, lppMAPIError : Win32cr::System::AddressBook::MAPIERROR**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_last_error.call(this, hResult, ulFlags, lppMAPIError)
    end
    def save_changes(this : IMAPIContainer*, ulFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_changes.call(this, ulFlags)
    end
    def get_props(this : IMAPIContainer*, lpPropTagArray : Win32cr::System::AddressBook::SPropTagArray*, ulFlags : UInt32, lpcValues : UInt32*, lppPropArray : Win32cr::System::AddressBook::SPropValue**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_props.call(this, lpPropTagArray, ulFlags, lpcValues, lppPropArray)
    end
    def get_prop_list(this : IMAPIContainer*, ulFlags : UInt32, lppPropTagArray : Win32cr::System::AddressBook::SPropTagArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prop_list.call(this, ulFlags, lppPropTagArray)
    end
    def open_property(this : IMAPIContainer*, ulPropTag : UInt32, lpiid : LibC::GUID*, ulInterfaceOptions : UInt32, ulFlags : UInt32, lppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_property.call(this, ulPropTag, lpiid, ulInterfaceOptions, ulFlags, lppUnk)
    end
    def set_props(this : IMAPIContainer*, cValues : UInt32, lpPropArray : Win32cr::System::AddressBook::SPropValue*, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_props.call(this, cValues, lpPropArray, lppProblems)
    end
    def delete_props(this : IMAPIContainer*, lpPropTagArray : Win32cr::System::AddressBook::SPropTagArray*, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_props.call(this, lpPropTagArray, lppProblems)
    end
    def copy_to(this : IMAPIContainer*, ciidExclude : UInt32, rgiidExclude : LibC::GUID*, lpExcludeProps : Win32cr::System::AddressBook::SPropTagArray*, ulUIParam : LibC::UIntPtrT, lpProgress : Void*, lpInterface : LibC::GUID*, lpDestObj : Void*, ulFlags : UInt32, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_to.call(this, ciidExclude, rgiidExclude, lpExcludeProps, ulUIParam, lpProgress, lpInterface, lpDestObj, ulFlags, lppProblems)
    end
    def copy_props(this : IMAPIContainer*, lpIncludeProps : Win32cr::System::AddressBook::SPropTagArray*, ulUIParam : LibC::UIntPtrT, lpProgress : Void*, lpInterface : LibC::GUID*, lpDestObj : Void*, ulFlags : UInt32, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_props.call(this, lpIncludeProps, ulUIParam, lpProgress, lpInterface, lpDestObj, ulFlags, lppProblems)
    end
    def get_names_from_i_ds(this : IMAPIContainer*, lppPropTags : Win32cr::System::AddressBook::SPropTagArray**, lpPropSetGuid : LibC::GUID*, ulFlags : UInt32, lpcPropNames : UInt32*, lpppPropNames : Win32cr::System::AddressBook::MAPINAMEID***) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_names_from_i_ds.call(this, lppPropTags, lpPropSetGuid, ulFlags, lpcPropNames, lpppPropNames)
    end
    def get_i_ds_from_names(this : IMAPIContainer*, cPropNames : UInt32, lppPropNames : Win32cr::System::AddressBook::MAPINAMEID**, ulFlags : UInt32, lppPropTags : Win32cr::System::AddressBook::SPropTagArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_from_names.call(this, cPropNames, lppPropNames, ulFlags, lppPropTags)
    end
    def get_contents_table(this : IMAPIContainer*, ulFlags : UInt32, lppTable : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_contents_table.call(this, ulFlags, lppTable)
    end
    def get_hierarchy_table(this : IMAPIContainer*, ulFlags : UInt32, lppTable : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_hierarchy_table.call(this, ulFlags, lppTable)
    end
    def open_entry(this : IMAPIContainer*, cbEntryID : UInt32, lpEntryID : Win32cr::System::AddressBook::ENTRYID*, lpInterface : LibC::GUID*, ulFlags : UInt32, lpulObjType : UInt32*, lppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_entry.call(this, cbEntryID, lpEntryID, lpInterface, ulFlags, lpulObjType, lppUnk)
    end
    def set_search_criteria(this : IMAPIContainer*, lpRestriction : Win32cr::System::AddressBook::SRestriction*, lpContainerList : Win32cr::System::AddressBook::SBinaryArray*, ulSearchFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_search_criteria.call(this, lpRestriction, lpContainerList, ulSearchFlags)
    end
    def get_search_criteria(this : IMAPIContainer*, ulFlags : UInt32, lppRestriction : Win32cr::System::AddressBook::SRestriction**, lppContainerList : Win32cr::System::AddressBook::SBinaryArray**, lpulSearchState : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_search_criteria.call(this, ulFlags, lppRestriction, lppContainerList, lpulSearchState)
    end

  end

  @[Extern]
  record IABContainerVtbl,
    query_interface : Proc(IABContainer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IABContainer*, UInt32),
    release : Proc(IABContainer*, UInt32),
    get_last_error : Proc(IABContainer*, Win32cr::Foundation::HRESULT, UInt32, Win32cr::System::AddressBook::MAPIERROR**, Win32cr::Foundation::HRESULT),
    save_changes : Proc(IABContainer*, UInt32, Win32cr::Foundation::HRESULT),
    get_props : Proc(IABContainer*, Win32cr::System::AddressBook::SPropTagArray*, UInt32, UInt32*, Win32cr::System::AddressBook::SPropValue**, Win32cr::Foundation::HRESULT),
    get_prop_list : Proc(IABContainer*, UInt32, Win32cr::System::AddressBook::SPropTagArray**, Win32cr::Foundation::HRESULT),
    open_property : Proc(IABContainer*, UInt32, LibC::GUID*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    set_props : Proc(IABContainer*, UInt32, Win32cr::System::AddressBook::SPropValue*, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    delete_props : Proc(IABContainer*, Win32cr::System::AddressBook::SPropTagArray*, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    copy_to : Proc(IABContainer*, UInt32, LibC::GUID*, Win32cr::System::AddressBook::SPropTagArray*, LibC::UIntPtrT, Void*, LibC::GUID*, Void*, UInt32, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    copy_props : Proc(IABContainer*, Win32cr::System::AddressBook::SPropTagArray*, LibC::UIntPtrT, Void*, LibC::GUID*, Void*, UInt32, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    get_names_from_i_ds : Proc(IABContainer*, Win32cr::System::AddressBook::SPropTagArray**, LibC::GUID*, UInt32, UInt32*, Win32cr::System::AddressBook::MAPINAMEID***, Win32cr::Foundation::HRESULT),
    get_i_ds_from_names : Proc(IABContainer*, UInt32, Win32cr::System::AddressBook::MAPINAMEID**, UInt32, Win32cr::System::AddressBook::SPropTagArray**, Win32cr::Foundation::HRESULT),
    get_contents_table : Proc(IABContainer*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_hierarchy_table : Proc(IABContainer*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    open_entry : Proc(IABContainer*, UInt32, Win32cr::System::AddressBook::ENTRYID*, LibC::GUID*, UInt32, UInt32*, Void**, Win32cr::Foundation::HRESULT),
    set_search_criteria : Proc(IABContainer*, Win32cr::System::AddressBook::SRestriction*, Win32cr::System::AddressBook::SBinaryArray*, UInt32, Win32cr::Foundation::HRESULT),
    get_search_criteria : Proc(IABContainer*, UInt32, Win32cr::System::AddressBook::SRestriction**, Win32cr::System::AddressBook::SBinaryArray**, UInt32*, Win32cr::Foundation::HRESULT),
    create_entry : Proc(IABContainer*, UInt32, Win32cr::System::AddressBook::ENTRYID*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    copy_entries : Proc(IABContainer*, Win32cr::System::AddressBook::SBinaryArray*, LibC::UIntPtrT, Void*, UInt32, Win32cr::Foundation::HRESULT),
    delete_entries : Proc(IABContainer*, Win32cr::System::AddressBook::SBinaryArray*, UInt32, Win32cr::Foundation::HRESULT),
    resolve_names : Proc(IABContainer*, Win32cr::System::AddressBook::SPropTagArray*, UInt32, Win32cr::System::AddressBook::ADRLIST*, Win32cr::System::AddressBook::Flaglist*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IABContainer, lpVtbl : IABContainerVtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def query_interface(this : IABContainer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IABContainer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IABContainer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_last_error(this : IABContainer*, hResult : Win32cr::Foundation::HRESULT, ulFlags : UInt32, lppMAPIError : Win32cr::System::AddressBook::MAPIERROR**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_last_error.call(this, hResult, ulFlags, lppMAPIError)
    end
    def save_changes(this : IABContainer*, ulFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_changes.call(this, ulFlags)
    end
    def get_props(this : IABContainer*, lpPropTagArray : Win32cr::System::AddressBook::SPropTagArray*, ulFlags : UInt32, lpcValues : UInt32*, lppPropArray : Win32cr::System::AddressBook::SPropValue**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_props.call(this, lpPropTagArray, ulFlags, lpcValues, lppPropArray)
    end
    def get_prop_list(this : IABContainer*, ulFlags : UInt32, lppPropTagArray : Win32cr::System::AddressBook::SPropTagArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prop_list.call(this, ulFlags, lppPropTagArray)
    end
    def open_property(this : IABContainer*, ulPropTag : UInt32, lpiid : LibC::GUID*, ulInterfaceOptions : UInt32, ulFlags : UInt32, lppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_property.call(this, ulPropTag, lpiid, ulInterfaceOptions, ulFlags, lppUnk)
    end
    def set_props(this : IABContainer*, cValues : UInt32, lpPropArray : Win32cr::System::AddressBook::SPropValue*, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_props.call(this, cValues, lpPropArray, lppProblems)
    end
    def delete_props(this : IABContainer*, lpPropTagArray : Win32cr::System::AddressBook::SPropTagArray*, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_props.call(this, lpPropTagArray, lppProblems)
    end
    def copy_to(this : IABContainer*, ciidExclude : UInt32, rgiidExclude : LibC::GUID*, lpExcludeProps : Win32cr::System::AddressBook::SPropTagArray*, ulUIParam : LibC::UIntPtrT, lpProgress : Void*, lpInterface : LibC::GUID*, lpDestObj : Void*, ulFlags : UInt32, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_to.call(this, ciidExclude, rgiidExclude, lpExcludeProps, ulUIParam, lpProgress, lpInterface, lpDestObj, ulFlags, lppProblems)
    end
    def copy_props(this : IABContainer*, lpIncludeProps : Win32cr::System::AddressBook::SPropTagArray*, ulUIParam : LibC::UIntPtrT, lpProgress : Void*, lpInterface : LibC::GUID*, lpDestObj : Void*, ulFlags : UInt32, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_props.call(this, lpIncludeProps, ulUIParam, lpProgress, lpInterface, lpDestObj, ulFlags, lppProblems)
    end
    def get_names_from_i_ds(this : IABContainer*, lppPropTags : Win32cr::System::AddressBook::SPropTagArray**, lpPropSetGuid : LibC::GUID*, ulFlags : UInt32, lpcPropNames : UInt32*, lpppPropNames : Win32cr::System::AddressBook::MAPINAMEID***) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_names_from_i_ds.call(this, lppPropTags, lpPropSetGuid, ulFlags, lpcPropNames, lpppPropNames)
    end
    def get_i_ds_from_names(this : IABContainer*, cPropNames : UInt32, lppPropNames : Win32cr::System::AddressBook::MAPINAMEID**, ulFlags : UInt32, lppPropTags : Win32cr::System::AddressBook::SPropTagArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_from_names.call(this, cPropNames, lppPropNames, ulFlags, lppPropTags)
    end
    def get_contents_table(this : IABContainer*, ulFlags : UInt32, lppTable : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_contents_table.call(this, ulFlags, lppTable)
    end
    def get_hierarchy_table(this : IABContainer*, ulFlags : UInt32, lppTable : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_hierarchy_table.call(this, ulFlags, lppTable)
    end
    def open_entry(this : IABContainer*, cbEntryID : UInt32, lpEntryID : Win32cr::System::AddressBook::ENTRYID*, lpInterface : LibC::GUID*, ulFlags : UInt32, lpulObjType : UInt32*, lppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_entry.call(this, cbEntryID, lpEntryID, lpInterface, ulFlags, lpulObjType, lppUnk)
    end
    def set_search_criteria(this : IABContainer*, lpRestriction : Win32cr::System::AddressBook::SRestriction*, lpContainerList : Win32cr::System::AddressBook::SBinaryArray*, ulSearchFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_search_criteria.call(this, lpRestriction, lpContainerList, ulSearchFlags)
    end
    def get_search_criteria(this : IABContainer*, ulFlags : UInt32, lppRestriction : Win32cr::System::AddressBook::SRestriction**, lppContainerList : Win32cr::System::AddressBook::SBinaryArray**, lpulSearchState : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_search_criteria.call(this, ulFlags, lppRestriction, lppContainerList, lpulSearchState)
    end
    def create_entry(this : IABContainer*, cbEntryID : UInt32, lpEntryID : Win32cr::System::AddressBook::ENTRYID*, ulCreateFlags : UInt32, lppMAPIPropEntry : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_entry.call(this, cbEntryID, lpEntryID, ulCreateFlags, lppMAPIPropEntry)
    end
    def copy_entries(this : IABContainer*, lpEntries : Win32cr::System::AddressBook::SBinaryArray*, ulUIParam : LibC::UIntPtrT, lpProgress : Void*, ulFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_entries.call(this, lpEntries, ulUIParam, lpProgress, ulFlags)
    end
    def delete_entries(this : IABContainer*, lpEntries : Win32cr::System::AddressBook::SBinaryArray*, ulFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_entries.call(this, lpEntries, ulFlags)
    end
    def resolve_names(this : IABContainer*, lpPropTagArray : Win32cr::System::AddressBook::SPropTagArray*, ulFlags : UInt32, lpAdrList : Win32cr::System::AddressBook::ADRLIST*, lpFlagList : Win32cr::System::AddressBook::Flaglist*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resolve_names.call(this, lpPropTagArray, ulFlags, lpAdrList, lpFlagList)
    end

  end

  @[Extern]
  record IMailUserVtbl,
    query_interface : Proc(IMailUser*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMailUser*, UInt32),
    release : Proc(IMailUser*, UInt32),
    get_last_error : Proc(IMailUser*, Win32cr::Foundation::HRESULT, UInt32, Win32cr::System::AddressBook::MAPIERROR**, Win32cr::Foundation::HRESULT),
    save_changes : Proc(IMailUser*, UInt32, Win32cr::Foundation::HRESULT),
    get_props : Proc(IMailUser*, Win32cr::System::AddressBook::SPropTagArray*, UInt32, UInt32*, Win32cr::System::AddressBook::SPropValue**, Win32cr::Foundation::HRESULT),
    get_prop_list : Proc(IMailUser*, UInt32, Win32cr::System::AddressBook::SPropTagArray**, Win32cr::Foundation::HRESULT),
    open_property : Proc(IMailUser*, UInt32, LibC::GUID*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    set_props : Proc(IMailUser*, UInt32, Win32cr::System::AddressBook::SPropValue*, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    delete_props : Proc(IMailUser*, Win32cr::System::AddressBook::SPropTagArray*, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    copy_to : Proc(IMailUser*, UInt32, LibC::GUID*, Win32cr::System::AddressBook::SPropTagArray*, LibC::UIntPtrT, Void*, LibC::GUID*, Void*, UInt32, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    copy_props : Proc(IMailUser*, Win32cr::System::AddressBook::SPropTagArray*, LibC::UIntPtrT, Void*, LibC::GUID*, Void*, UInt32, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    get_names_from_i_ds : Proc(IMailUser*, Win32cr::System::AddressBook::SPropTagArray**, LibC::GUID*, UInt32, UInt32*, Win32cr::System::AddressBook::MAPINAMEID***, Win32cr::Foundation::HRESULT),
    get_i_ds_from_names : Proc(IMailUser*, UInt32, Win32cr::System::AddressBook::MAPINAMEID**, UInt32, Win32cr::System::AddressBook::SPropTagArray**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMailUser, lpVtbl : IMailUserVtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def query_interface(this : IMailUser*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMailUser*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMailUser*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_last_error(this : IMailUser*, hResult : Win32cr::Foundation::HRESULT, ulFlags : UInt32, lppMAPIError : Win32cr::System::AddressBook::MAPIERROR**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_last_error.call(this, hResult, ulFlags, lppMAPIError)
    end
    def save_changes(this : IMailUser*, ulFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_changes.call(this, ulFlags)
    end
    def get_props(this : IMailUser*, lpPropTagArray : Win32cr::System::AddressBook::SPropTagArray*, ulFlags : UInt32, lpcValues : UInt32*, lppPropArray : Win32cr::System::AddressBook::SPropValue**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_props.call(this, lpPropTagArray, ulFlags, lpcValues, lppPropArray)
    end
    def get_prop_list(this : IMailUser*, ulFlags : UInt32, lppPropTagArray : Win32cr::System::AddressBook::SPropTagArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prop_list.call(this, ulFlags, lppPropTagArray)
    end
    def open_property(this : IMailUser*, ulPropTag : UInt32, lpiid : LibC::GUID*, ulInterfaceOptions : UInt32, ulFlags : UInt32, lppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_property.call(this, ulPropTag, lpiid, ulInterfaceOptions, ulFlags, lppUnk)
    end
    def set_props(this : IMailUser*, cValues : UInt32, lpPropArray : Win32cr::System::AddressBook::SPropValue*, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_props.call(this, cValues, lpPropArray, lppProblems)
    end
    def delete_props(this : IMailUser*, lpPropTagArray : Win32cr::System::AddressBook::SPropTagArray*, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_props.call(this, lpPropTagArray, lppProblems)
    end
    def copy_to(this : IMailUser*, ciidExclude : UInt32, rgiidExclude : LibC::GUID*, lpExcludeProps : Win32cr::System::AddressBook::SPropTagArray*, ulUIParam : LibC::UIntPtrT, lpProgress : Void*, lpInterface : LibC::GUID*, lpDestObj : Void*, ulFlags : UInt32, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_to.call(this, ciidExclude, rgiidExclude, lpExcludeProps, ulUIParam, lpProgress, lpInterface, lpDestObj, ulFlags, lppProblems)
    end
    def copy_props(this : IMailUser*, lpIncludeProps : Win32cr::System::AddressBook::SPropTagArray*, ulUIParam : LibC::UIntPtrT, lpProgress : Void*, lpInterface : LibC::GUID*, lpDestObj : Void*, ulFlags : UInt32, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_props.call(this, lpIncludeProps, ulUIParam, lpProgress, lpInterface, lpDestObj, ulFlags, lppProblems)
    end
    def get_names_from_i_ds(this : IMailUser*, lppPropTags : Win32cr::System::AddressBook::SPropTagArray**, lpPropSetGuid : LibC::GUID*, ulFlags : UInt32, lpcPropNames : UInt32*, lpppPropNames : Win32cr::System::AddressBook::MAPINAMEID***) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_names_from_i_ds.call(this, lppPropTags, lpPropSetGuid, ulFlags, lpcPropNames, lpppPropNames)
    end
    def get_i_ds_from_names(this : IMailUser*, cPropNames : UInt32, lppPropNames : Win32cr::System::AddressBook::MAPINAMEID**, ulFlags : UInt32, lppPropTags : Win32cr::System::AddressBook::SPropTagArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_from_names.call(this, cPropNames, lppPropNames, ulFlags, lppPropTags)
    end

  end

  @[Extern]
  record IDistListVtbl,
    query_interface : Proc(IDistList*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDistList*, UInt32),
    release : Proc(IDistList*, UInt32),
    get_last_error : Proc(IDistList*, Win32cr::Foundation::HRESULT, UInt32, Win32cr::System::AddressBook::MAPIERROR**, Win32cr::Foundation::HRESULT),
    save_changes : Proc(IDistList*, UInt32, Win32cr::Foundation::HRESULT),
    get_props : Proc(IDistList*, Win32cr::System::AddressBook::SPropTagArray*, UInt32, UInt32*, Win32cr::System::AddressBook::SPropValue**, Win32cr::Foundation::HRESULT),
    get_prop_list : Proc(IDistList*, UInt32, Win32cr::System::AddressBook::SPropTagArray**, Win32cr::Foundation::HRESULT),
    open_property : Proc(IDistList*, UInt32, LibC::GUID*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    set_props : Proc(IDistList*, UInt32, Win32cr::System::AddressBook::SPropValue*, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    delete_props : Proc(IDistList*, Win32cr::System::AddressBook::SPropTagArray*, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    copy_to : Proc(IDistList*, UInt32, LibC::GUID*, Win32cr::System::AddressBook::SPropTagArray*, LibC::UIntPtrT, Void*, LibC::GUID*, Void*, UInt32, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    copy_props : Proc(IDistList*, Win32cr::System::AddressBook::SPropTagArray*, LibC::UIntPtrT, Void*, LibC::GUID*, Void*, UInt32, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    get_names_from_i_ds : Proc(IDistList*, Win32cr::System::AddressBook::SPropTagArray**, LibC::GUID*, UInt32, UInt32*, Win32cr::System::AddressBook::MAPINAMEID***, Win32cr::Foundation::HRESULT),
    get_i_ds_from_names : Proc(IDistList*, UInt32, Win32cr::System::AddressBook::MAPINAMEID**, UInt32, Win32cr::System::AddressBook::SPropTagArray**, Win32cr::Foundation::HRESULT),
    get_contents_table : Proc(IDistList*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_hierarchy_table : Proc(IDistList*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    open_entry : Proc(IDistList*, UInt32, Win32cr::System::AddressBook::ENTRYID*, LibC::GUID*, UInt32, UInt32*, Void**, Win32cr::Foundation::HRESULT),
    set_search_criteria : Proc(IDistList*, Win32cr::System::AddressBook::SRestriction*, Win32cr::System::AddressBook::SBinaryArray*, UInt32, Win32cr::Foundation::HRESULT),
    get_search_criteria : Proc(IDistList*, UInt32, Win32cr::System::AddressBook::SRestriction**, Win32cr::System::AddressBook::SBinaryArray**, UInt32*, Win32cr::Foundation::HRESULT),
    create_entry : Proc(IDistList*, UInt32, Win32cr::System::AddressBook::ENTRYID*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    copy_entries : Proc(IDistList*, Win32cr::System::AddressBook::SBinaryArray*, LibC::UIntPtrT, Void*, UInt32, Win32cr::Foundation::HRESULT),
    delete_entries : Proc(IDistList*, Win32cr::System::AddressBook::SBinaryArray*, UInt32, Win32cr::Foundation::HRESULT),
    resolve_names : Proc(IDistList*, Win32cr::System::AddressBook::SPropTagArray*, UInt32, Win32cr::System::AddressBook::ADRLIST*, Win32cr::System::AddressBook::Flaglist*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDistList, lpVtbl : IDistListVtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def query_interface(this : IDistList*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDistList*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDistList*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_last_error(this : IDistList*, hResult : Win32cr::Foundation::HRESULT, ulFlags : UInt32, lppMAPIError : Win32cr::System::AddressBook::MAPIERROR**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_last_error.call(this, hResult, ulFlags, lppMAPIError)
    end
    def save_changes(this : IDistList*, ulFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_changes.call(this, ulFlags)
    end
    def get_props(this : IDistList*, lpPropTagArray : Win32cr::System::AddressBook::SPropTagArray*, ulFlags : UInt32, lpcValues : UInt32*, lppPropArray : Win32cr::System::AddressBook::SPropValue**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_props.call(this, lpPropTagArray, ulFlags, lpcValues, lppPropArray)
    end
    def get_prop_list(this : IDistList*, ulFlags : UInt32, lppPropTagArray : Win32cr::System::AddressBook::SPropTagArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prop_list.call(this, ulFlags, lppPropTagArray)
    end
    def open_property(this : IDistList*, ulPropTag : UInt32, lpiid : LibC::GUID*, ulInterfaceOptions : UInt32, ulFlags : UInt32, lppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_property.call(this, ulPropTag, lpiid, ulInterfaceOptions, ulFlags, lppUnk)
    end
    def set_props(this : IDistList*, cValues : UInt32, lpPropArray : Win32cr::System::AddressBook::SPropValue*, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_props.call(this, cValues, lpPropArray, lppProblems)
    end
    def delete_props(this : IDistList*, lpPropTagArray : Win32cr::System::AddressBook::SPropTagArray*, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_props.call(this, lpPropTagArray, lppProblems)
    end
    def copy_to(this : IDistList*, ciidExclude : UInt32, rgiidExclude : LibC::GUID*, lpExcludeProps : Win32cr::System::AddressBook::SPropTagArray*, ulUIParam : LibC::UIntPtrT, lpProgress : Void*, lpInterface : LibC::GUID*, lpDestObj : Void*, ulFlags : UInt32, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_to.call(this, ciidExclude, rgiidExclude, lpExcludeProps, ulUIParam, lpProgress, lpInterface, lpDestObj, ulFlags, lppProblems)
    end
    def copy_props(this : IDistList*, lpIncludeProps : Win32cr::System::AddressBook::SPropTagArray*, ulUIParam : LibC::UIntPtrT, lpProgress : Void*, lpInterface : LibC::GUID*, lpDestObj : Void*, ulFlags : UInt32, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_props.call(this, lpIncludeProps, ulUIParam, lpProgress, lpInterface, lpDestObj, ulFlags, lppProblems)
    end
    def get_names_from_i_ds(this : IDistList*, lppPropTags : Win32cr::System::AddressBook::SPropTagArray**, lpPropSetGuid : LibC::GUID*, ulFlags : UInt32, lpcPropNames : UInt32*, lpppPropNames : Win32cr::System::AddressBook::MAPINAMEID***) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_names_from_i_ds.call(this, lppPropTags, lpPropSetGuid, ulFlags, lpcPropNames, lpppPropNames)
    end
    def get_i_ds_from_names(this : IDistList*, cPropNames : UInt32, lppPropNames : Win32cr::System::AddressBook::MAPINAMEID**, ulFlags : UInt32, lppPropTags : Win32cr::System::AddressBook::SPropTagArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_from_names.call(this, cPropNames, lppPropNames, ulFlags, lppPropTags)
    end
    def get_contents_table(this : IDistList*, ulFlags : UInt32, lppTable : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_contents_table.call(this, ulFlags, lppTable)
    end
    def get_hierarchy_table(this : IDistList*, ulFlags : UInt32, lppTable : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_hierarchy_table.call(this, ulFlags, lppTable)
    end
    def open_entry(this : IDistList*, cbEntryID : UInt32, lpEntryID : Win32cr::System::AddressBook::ENTRYID*, lpInterface : LibC::GUID*, ulFlags : UInt32, lpulObjType : UInt32*, lppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_entry.call(this, cbEntryID, lpEntryID, lpInterface, ulFlags, lpulObjType, lppUnk)
    end
    def set_search_criteria(this : IDistList*, lpRestriction : Win32cr::System::AddressBook::SRestriction*, lpContainerList : Win32cr::System::AddressBook::SBinaryArray*, ulSearchFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_search_criteria.call(this, lpRestriction, lpContainerList, ulSearchFlags)
    end
    def get_search_criteria(this : IDistList*, ulFlags : UInt32, lppRestriction : Win32cr::System::AddressBook::SRestriction**, lppContainerList : Win32cr::System::AddressBook::SBinaryArray**, lpulSearchState : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_search_criteria.call(this, ulFlags, lppRestriction, lppContainerList, lpulSearchState)
    end
    def create_entry(this : IDistList*, cbEntryID : UInt32, lpEntryID : Win32cr::System::AddressBook::ENTRYID*, ulCreateFlags : UInt32, lppMAPIPropEntry : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_entry.call(this, cbEntryID, lpEntryID, ulCreateFlags, lppMAPIPropEntry)
    end
    def copy_entries(this : IDistList*, lpEntries : Win32cr::System::AddressBook::SBinaryArray*, ulUIParam : LibC::UIntPtrT, lpProgress : Void*, ulFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_entries.call(this, lpEntries, ulUIParam, lpProgress, ulFlags)
    end
    def delete_entries(this : IDistList*, lpEntries : Win32cr::System::AddressBook::SBinaryArray*, ulFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_entries.call(this, lpEntries, ulFlags)
    end
    def resolve_names(this : IDistList*, lpPropTagArray : Win32cr::System::AddressBook::SPropTagArray*, ulFlags : UInt32, lpAdrList : Win32cr::System::AddressBook::ADRLIST*, lpFlagList : Win32cr::System::AddressBook::Flaglist*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resolve_names.call(this, lpPropTagArray, ulFlags, lpAdrList, lpFlagList)
    end

  end

  @[Extern]
  record IMAPIFolderVtbl,
    query_interface : Proc(IMAPIFolder*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMAPIFolder*, UInt32),
    release : Proc(IMAPIFolder*, UInt32),
    get_last_error : Proc(IMAPIFolder*, Win32cr::Foundation::HRESULT, UInt32, Win32cr::System::AddressBook::MAPIERROR**, Win32cr::Foundation::HRESULT),
    save_changes : Proc(IMAPIFolder*, UInt32, Win32cr::Foundation::HRESULT),
    get_props : Proc(IMAPIFolder*, Win32cr::System::AddressBook::SPropTagArray*, UInt32, UInt32*, Win32cr::System::AddressBook::SPropValue**, Win32cr::Foundation::HRESULT),
    get_prop_list : Proc(IMAPIFolder*, UInt32, Win32cr::System::AddressBook::SPropTagArray**, Win32cr::Foundation::HRESULT),
    open_property : Proc(IMAPIFolder*, UInt32, LibC::GUID*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    set_props : Proc(IMAPIFolder*, UInt32, Win32cr::System::AddressBook::SPropValue*, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    delete_props : Proc(IMAPIFolder*, Win32cr::System::AddressBook::SPropTagArray*, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    copy_to : Proc(IMAPIFolder*, UInt32, LibC::GUID*, Win32cr::System::AddressBook::SPropTagArray*, LibC::UIntPtrT, Void*, LibC::GUID*, Void*, UInt32, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    copy_props : Proc(IMAPIFolder*, Win32cr::System::AddressBook::SPropTagArray*, LibC::UIntPtrT, Void*, LibC::GUID*, Void*, UInt32, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    get_names_from_i_ds : Proc(IMAPIFolder*, Win32cr::System::AddressBook::SPropTagArray**, LibC::GUID*, UInt32, UInt32*, Win32cr::System::AddressBook::MAPINAMEID***, Win32cr::Foundation::HRESULT),
    get_i_ds_from_names : Proc(IMAPIFolder*, UInt32, Win32cr::System::AddressBook::MAPINAMEID**, UInt32, Win32cr::System::AddressBook::SPropTagArray**, Win32cr::Foundation::HRESULT),
    get_contents_table : Proc(IMAPIFolder*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_hierarchy_table : Proc(IMAPIFolder*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    open_entry : Proc(IMAPIFolder*, UInt32, Win32cr::System::AddressBook::ENTRYID*, LibC::GUID*, UInt32, UInt32*, Void**, Win32cr::Foundation::HRESULT),
    set_search_criteria : Proc(IMAPIFolder*, Win32cr::System::AddressBook::SRestriction*, Win32cr::System::AddressBook::SBinaryArray*, UInt32, Win32cr::Foundation::HRESULT),
    get_search_criteria : Proc(IMAPIFolder*, UInt32, Win32cr::System::AddressBook::SRestriction**, Win32cr::System::AddressBook::SBinaryArray**, UInt32*, Win32cr::Foundation::HRESULT),
    create_message : Proc(IMAPIFolder*, LibC::GUID*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    copy_messages : Proc(IMAPIFolder*, Win32cr::System::AddressBook::SBinaryArray*, LibC::GUID*, Void*, LibC::UIntPtrT, Void*, UInt32, Win32cr::Foundation::HRESULT),
    delete_messages : Proc(IMAPIFolder*, Win32cr::System::AddressBook::SBinaryArray*, LibC::UIntPtrT, Void*, UInt32, Win32cr::Foundation::HRESULT),
    create_folder : Proc(IMAPIFolder*, UInt32, Int8*, Int8*, LibC::GUID*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    copy_folder : Proc(IMAPIFolder*, UInt32, Win32cr::System::AddressBook::ENTRYID*, LibC::GUID*, Void*, Int8*, LibC::UIntPtrT, Void*, UInt32, Win32cr::Foundation::HRESULT),
    delete_folder : Proc(IMAPIFolder*, UInt32, Win32cr::System::AddressBook::ENTRYID*, LibC::UIntPtrT, Void*, UInt32, Win32cr::Foundation::HRESULT),
    set_read_flags : Proc(IMAPIFolder*, Win32cr::System::AddressBook::SBinaryArray*, LibC::UIntPtrT, Void*, UInt32, Win32cr::Foundation::HRESULT),
    get_message_status : Proc(IMAPIFolder*, UInt32, Win32cr::System::AddressBook::ENTRYID*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    set_message_status : Proc(IMAPIFolder*, UInt32, Win32cr::System::AddressBook::ENTRYID*, UInt32, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    save_contents_sort : Proc(IMAPIFolder*, Win32cr::System::AddressBook::SSortOrderSet*, UInt32, Win32cr::Foundation::HRESULT),
    empty_folder : Proc(IMAPIFolder*, LibC::UIntPtrT, Void*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMAPIFolder, lpVtbl : IMAPIFolderVtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def query_interface(this : IMAPIFolder*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMAPIFolder*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMAPIFolder*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_last_error(this : IMAPIFolder*, hResult : Win32cr::Foundation::HRESULT, ulFlags : UInt32, lppMAPIError : Win32cr::System::AddressBook::MAPIERROR**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_last_error.call(this, hResult, ulFlags, lppMAPIError)
    end
    def save_changes(this : IMAPIFolder*, ulFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_changes.call(this, ulFlags)
    end
    def get_props(this : IMAPIFolder*, lpPropTagArray : Win32cr::System::AddressBook::SPropTagArray*, ulFlags : UInt32, lpcValues : UInt32*, lppPropArray : Win32cr::System::AddressBook::SPropValue**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_props.call(this, lpPropTagArray, ulFlags, lpcValues, lppPropArray)
    end
    def get_prop_list(this : IMAPIFolder*, ulFlags : UInt32, lppPropTagArray : Win32cr::System::AddressBook::SPropTagArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prop_list.call(this, ulFlags, lppPropTagArray)
    end
    def open_property(this : IMAPIFolder*, ulPropTag : UInt32, lpiid : LibC::GUID*, ulInterfaceOptions : UInt32, ulFlags : UInt32, lppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_property.call(this, ulPropTag, lpiid, ulInterfaceOptions, ulFlags, lppUnk)
    end
    def set_props(this : IMAPIFolder*, cValues : UInt32, lpPropArray : Win32cr::System::AddressBook::SPropValue*, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_props.call(this, cValues, lpPropArray, lppProblems)
    end
    def delete_props(this : IMAPIFolder*, lpPropTagArray : Win32cr::System::AddressBook::SPropTagArray*, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_props.call(this, lpPropTagArray, lppProblems)
    end
    def copy_to(this : IMAPIFolder*, ciidExclude : UInt32, rgiidExclude : LibC::GUID*, lpExcludeProps : Win32cr::System::AddressBook::SPropTagArray*, ulUIParam : LibC::UIntPtrT, lpProgress : Void*, lpInterface : LibC::GUID*, lpDestObj : Void*, ulFlags : UInt32, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_to.call(this, ciidExclude, rgiidExclude, lpExcludeProps, ulUIParam, lpProgress, lpInterface, lpDestObj, ulFlags, lppProblems)
    end
    def copy_props(this : IMAPIFolder*, lpIncludeProps : Win32cr::System::AddressBook::SPropTagArray*, ulUIParam : LibC::UIntPtrT, lpProgress : Void*, lpInterface : LibC::GUID*, lpDestObj : Void*, ulFlags : UInt32, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_props.call(this, lpIncludeProps, ulUIParam, lpProgress, lpInterface, lpDestObj, ulFlags, lppProblems)
    end
    def get_names_from_i_ds(this : IMAPIFolder*, lppPropTags : Win32cr::System::AddressBook::SPropTagArray**, lpPropSetGuid : LibC::GUID*, ulFlags : UInt32, lpcPropNames : UInt32*, lpppPropNames : Win32cr::System::AddressBook::MAPINAMEID***) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_names_from_i_ds.call(this, lppPropTags, lpPropSetGuid, ulFlags, lpcPropNames, lpppPropNames)
    end
    def get_i_ds_from_names(this : IMAPIFolder*, cPropNames : UInt32, lppPropNames : Win32cr::System::AddressBook::MAPINAMEID**, ulFlags : UInt32, lppPropTags : Win32cr::System::AddressBook::SPropTagArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_from_names.call(this, cPropNames, lppPropNames, ulFlags, lppPropTags)
    end
    def get_contents_table(this : IMAPIFolder*, ulFlags : UInt32, lppTable : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_contents_table.call(this, ulFlags, lppTable)
    end
    def get_hierarchy_table(this : IMAPIFolder*, ulFlags : UInt32, lppTable : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_hierarchy_table.call(this, ulFlags, lppTable)
    end
    def open_entry(this : IMAPIFolder*, cbEntryID : UInt32, lpEntryID : Win32cr::System::AddressBook::ENTRYID*, lpInterface : LibC::GUID*, ulFlags : UInt32, lpulObjType : UInt32*, lppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_entry.call(this, cbEntryID, lpEntryID, lpInterface, ulFlags, lpulObjType, lppUnk)
    end
    def set_search_criteria(this : IMAPIFolder*, lpRestriction : Win32cr::System::AddressBook::SRestriction*, lpContainerList : Win32cr::System::AddressBook::SBinaryArray*, ulSearchFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_search_criteria.call(this, lpRestriction, lpContainerList, ulSearchFlags)
    end
    def get_search_criteria(this : IMAPIFolder*, ulFlags : UInt32, lppRestriction : Win32cr::System::AddressBook::SRestriction**, lppContainerList : Win32cr::System::AddressBook::SBinaryArray**, lpulSearchState : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_search_criteria.call(this, ulFlags, lppRestriction, lppContainerList, lpulSearchState)
    end
    def create_message(this : IMAPIFolder*, lpInterface : LibC::GUID*, ulFlags : UInt32, lppMessage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_message.call(this, lpInterface, ulFlags, lppMessage)
    end
    def copy_messages(this : IMAPIFolder*, lpMsgList : Win32cr::System::AddressBook::SBinaryArray*, lpInterface : LibC::GUID*, lpDestFolder : Void*, ulUIParam : LibC::UIntPtrT, lpProgress : Void*, ulFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_messages.call(this, lpMsgList, lpInterface, lpDestFolder, ulUIParam, lpProgress, ulFlags)
    end
    def delete_messages(this : IMAPIFolder*, lpMsgList : Win32cr::System::AddressBook::SBinaryArray*, ulUIParam : LibC::UIntPtrT, lpProgress : Void*, ulFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_messages.call(this, lpMsgList, ulUIParam, lpProgress, ulFlags)
    end
    def create_folder(this : IMAPIFolder*, ulFolderType : UInt32, lpszFolderName : Int8*, lpszFolderComment : Int8*, lpInterface : LibC::GUID*, ulFlags : UInt32, lppFolder : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_folder.call(this, ulFolderType, lpszFolderName, lpszFolderComment, lpInterface, ulFlags, lppFolder)
    end
    def copy_folder(this : IMAPIFolder*, cbEntryID : UInt32, lpEntryID : Win32cr::System::AddressBook::ENTRYID*, lpInterface : LibC::GUID*, lpDestFolder : Void*, lpszNewFolderName : Int8*, ulUIParam : LibC::UIntPtrT, lpProgress : Void*, ulFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_folder.call(this, cbEntryID, lpEntryID, lpInterface, lpDestFolder, lpszNewFolderName, ulUIParam, lpProgress, ulFlags)
    end
    def delete_folder(this : IMAPIFolder*, cbEntryID : UInt32, lpEntryID : Win32cr::System::AddressBook::ENTRYID*, ulUIParam : LibC::UIntPtrT, lpProgress : Void*, ulFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_folder.call(this, cbEntryID, lpEntryID, ulUIParam, lpProgress, ulFlags)
    end
    def set_read_flags(this : IMAPIFolder*, lpMsgList : Win32cr::System::AddressBook::SBinaryArray*, ulUIParam : LibC::UIntPtrT, lpProgress : Void*, ulFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_read_flags.call(this, lpMsgList, ulUIParam, lpProgress, ulFlags)
    end
    def get_message_status(this : IMAPIFolder*, cbEntryID : UInt32, lpEntryID : Win32cr::System::AddressBook::ENTRYID*, ulFlags : UInt32, lpulMessageStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_message_status.call(this, cbEntryID, lpEntryID, ulFlags, lpulMessageStatus)
    end
    def set_message_status(this : IMAPIFolder*, cbEntryID : UInt32, lpEntryID : Win32cr::System::AddressBook::ENTRYID*, ulNewStatus : UInt32, ulNewStatusMask : UInt32, lpulOldStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_message_status.call(this, cbEntryID, lpEntryID, ulNewStatus, ulNewStatusMask, lpulOldStatus)
    end
    def save_contents_sort(this : IMAPIFolder*, lpSortCriteria : Win32cr::System::AddressBook::SSortOrderSet*, ulFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_contents_sort.call(this, lpSortCriteria, ulFlags)
    end
    def empty_folder(this : IMAPIFolder*, ulUIParam : LibC::UIntPtrT, lpProgress : Void*, ulFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.empty_folder.call(this, ulUIParam, lpProgress, ulFlags)
    end

  end

  @[Extern]
  record IMsgStoreVtbl,
    query_interface : Proc(IMsgStore*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMsgStore*, UInt32),
    release : Proc(IMsgStore*, UInt32),
    get_last_error : Proc(IMsgStore*, Win32cr::Foundation::HRESULT, UInt32, Win32cr::System::AddressBook::MAPIERROR**, Win32cr::Foundation::HRESULT),
    save_changes : Proc(IMsgStore*, UInt32, Win32cr::Foundation::HRESULT),
    get_props : Proc(IMsgStore*, Win32cr::System::AddressBook::SPropTagArray*, UInt32, UInt32*, Win32cr::System::AddressBook::SPropValue**, Win32cr::Foundation::HRESULT),
    get_prop_list : Proc(IMsgStore*, UInt32, Win32cr::System::AddressBook::SPropTagArray**, Win32cr::Foundation::HRESULT),
    open_property : Proc(IMsgStore*, UInt32, LibC::GUID*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    set_props : Proc(IMsgStore*, UInt32, Win32cr::System::AddressBook::SPropValue*, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    delete_props : Proc(IMsgStore*, Win32cr::System::AddressBook::SPropTagArray*, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    copy_to : Proc(IMsgStore*, UInt32, LibC::GUID*, Win32cr::System::AddressBook::SPropTagArray*, LibC::UIntPtrT, Void*, LibC::GUID*, Void*, UInt32, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    copy_props : Proc(IMsgStore*, Win32cr::System::AddressBook::SPropTagArray*, LibC::UIntPtrT, Void*, LibC::GUID*, Void*, UInt32, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    get_names_from_i_ds : Proc(IMsgStore*, Win32cr::System::AddressBook::SPropTagArray**, LibC::GUID*, UInt32, UInt32*, Win32cr::System::AddressBook::MAPINAMEID***, Win32cr::Foundation::HRESULT),
    get_i_ds_from_names : Proc(IMsgStore*, UInt32, Win32cr::System::AddressBook::MAPINAMEID**, UInt32, Win32cr::System::AddressBook::SPropTagArray**, Win32cr::Foundation::HRESULT),
    advise : Proc(IMsgStore*, UInt32, Win32cr::System::AddressBook::ENTRYID*, UInt32, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    unadvise : Proc(IMsgStore*, UInt32, Win32cr::Foundation::HRESULT),
    compare_entry_i_ds : Proc(IMsgStore*, UInt32, Win32cr::System::AddressBook::ENTRYID*, UInt32, Win32cr::System::AddressBook::ENTRYID*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    open_entry : Proc(IMsgStore*, UInt32, Win32cr::System::AddressBook::ENTRYID*, LibC::GUID*, UInt32, UInt32*, Void**, Win32cr::Foundation::HRESULT),
    set_receive_folder : Proc(IMsgStore*, Int8*, UInt32, UInt32, Win32cr::System::AddressBook::ENTRYID*, Win32cr::Foundation::HRESULT),
    get_receive_folder : Proc(IMsgStore*, Int8*, UInt32, UInt32*, Win32cr::System::AddressBook::ENTRYID**, Int8**, Win32cr::Foundation::HRESULT),
    get_receive_folder_table : Proc(IMsgStore*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    store_logoff : Proc(IMsgStore*, UInt32*, Win32cr::Foundation::HRESULT),
    abort_submit : Proc(IMsgStore*, UInt32, Win32cr::System::AddressBook::ENTRYID*, UInt32, Win32cr::Foundation::HRESULT),
    get_outgoing_queue : Proc(IMsgStore*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    set_lock_state : Proc(IMsgStore*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    finished_msg : Proc(IMsgStore*, UInt32, UInt32, Win32cr::System::AddressBook::ENTRYID*, Win32cr::Foundation::HRESULT),
    notify_new_mail : Proc(IMsgStore*, Win32cr::System::AddressBook::NOTIFICATION*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMsgStore, lpVtbl : IMsgStoreVtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def query_interface(this : IMsgStore*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMsgStore*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMsgStore*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_last_error(this : IMsgStore*, hResult : Win32cr::Foundation::HRESULT, ulFlags : UInt32, lppMAPIError : Win32cr::System::AddressBook::MAPIERROR**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_last_error.call(this, hResult, ulFlags, lppMAPIError)
    end
    def save_changes(this : IMsgStore*, ulFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_changes.call(this, ulFlags)
    end
    def get_props(this : IMsgStore*, lpPropTagArray : Win32cr::System::AddressBook::SPropTagArray*, ulFlags : UInt32, lpcValues : UInt32*, lppPropArray : Win32cr::System::AddressBook::SPropValue**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_props.call(this, lpPropTagArray, ulFlags, lpcValues, lppPropArray)
    end
    def get_prop_list(this : IMsgStore*, ulFlags : UInt32, lppPropTagArray : Win32cr::System::AddressBook::SPropTagArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prop_list.call(this, ulFlags, lppPropTagArray)
    end
    def open_property(this : IMsgStore*, ulPropTag : UInt32, lpiid : LibC::GUID*, ulInterfaceOptions : UInt32, ulFlags : UInt32, lppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_property.call(this, ulPropTag, lpiid, ulInterfaceOptions, ulFlags, lppUnk)
    end
    def set_props(this : IMsgStore*, cValues : UInt32, lpPropArray : Win32cr::System::AddressBook::SPropValue*, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_props.call(this, cValues, lpPropArray, lppProblems)
    end
    def delete_props(this : IMsgStore*, lpPropTagArray : Win32cr::System::AddressBook::SPropTagArray*, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_props.call(this, lpPropTagArray, lppProblems)
    end
    def copy_to(this : IMsgStore*, ciidExclude : UInt32, rgiidExclude : LibC::GUID*, lpExcludeProps : Win32cr::System::AddressBook::SPropTagArray*, ulUIParam : LibC::UIntPtrT, lpProgress : Void*, lpInterface : LibC::GUID*, lpDestObj : Void*, ulFlags : UInt32, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_to.call(this, ciidExclude, rgiidExclude, lpExcludeProps, ulUIParam, lpProgress, lpInterface, lpDestObj, ulFlags, lppProblems)
    end
    def copy_props(this : IMsgStore*, lpIncludeProps : Win32cr::System::AddressBook::SPropTagArray*, ulUIParam : LibC::UIntPtrT, lpProgress : Void*, lpInterface : LibC::GUID*, lpDestObj : Void*, ulFlags : UInt32, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_props.call(this, lpIncludeProps, ulUIParam, lpProgress, lpInterface, lpDestObj, ulFlags, lppProblems)
    end
    def get_names_from_i_ds(this : IMsgStore*, lppPropTags : Win32cr::System::AddressBook::SPropTagArray**, lpPropSetGuid : LibC::GUID*, ulFlags : UInt32, lpcPropNames : UInt32*, lpppPropNames : Win32cr::System::AddressBook::MAPINAMEID***) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_names_from_i_ds.call(this, lppPropTags, lpPropSetGuid, ulFlags, lpcPropNames, lpppPropNames)
    end
    def get_i_ds_from_names(this : IMsgStore*, cPropNames : UInt32, lppPropNames : Win32cr::System::AddressBook::MAPINAMEID**, ulFlags : UInt32, lppPropTags : Win32cr::System::AddressBook::SPropTagArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_from_names.call(this, cPropNames, lppPropNames, ulFlags, lppPropTags)
    end
    def advise(this : IMsgStore*, cbEntryID : UInt32, lpEntryID : Win32cr::System::AddressBook::ENTRYID*, ulEventMask : UInt32, lpAdviseSink : Void*, lpulConnection : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.advise.call(this, cbEntryID, lpEntryID, ulEventMask, lpAdviseSink, lpulConnection)
    end
    def unadvise(this : IMsgStore*, ulConnection : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unadvise.call(this, ulConnection)
    end
    def compare_entry_i_ds(this : IMsgStore*, cbEntryID1 : UInt32, lpEntryID1 : Win32cr::System::AddressBook::ENTRYID*, cbEntryID2 : UInt32, lpEntryID2 : Win32cr::System::AddressBook::ENTRYID*, ulFlags : UInt32, lpulResult : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compare_entry_i_ds.call(this, cbEntryID1, lpEntryID1, cbEntryID2, lpEntryID2, ulFlags, lpulResult)
    end
    def open_entry(this : IMsgStore*, cbEntryID : UInt32, lpEntryID : Win32cr::System::AddressBook::ENTRYID*, lpInterface : LibC::GUID*, ulFlags : UInt32, lpulObjType : UInt32*, ppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_entry.call(this, cbEntryID, lpEntryID, lpInterface, ulFlags, lpulObjType, ppUnk)
    end
    def set_receive_folder(this : IMsgStore*, lpszMessageClass : Int8*, ulFlags : UInt32, cbEntryID : UInt32, lpEntryID : Win32cr::System::AddressBook::ENTRYID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_receive_folder.call(this, lpszMessageClass, ulFlags, cbEntryID, lpEntryID)
    end
    def get_receive_folder(this : IMsgStore*, lpszMessageClass : Int8*, ulFlags : UInt32, lpcbEntryID : UInt32*, lppEntryID : Win32cr::System::AddressBook::ENTRYID**, lppszExplicitClass : Int8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_receive_folder.call(this, lpszMessageClass, ulFlags, lpcbEntryID, lppEntryID, lppszExplicitClass)
    end
    def get_receive_folder_table(this : IMsgStore*, ulFlags : UInt32, lppTable : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_receive_folder_table.call(this, ulFlags, lppTable)
    end
    def store_logoff(this : IMsgStore*, lpulFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.store_logoff.call(this, lpulFlags)
    end
    def abort_submit(this : IMsgStore*, cbEntryID : UInt32, lpEntryID : Win32cr::System::AddressBook::ENTRYID*, ulFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.abort_submit.call(this, cbEntryID, lpEntryID, ulFlags)
    end
    def get_outgoing_queue(this : IMsgStore*, ulFlags : UInt32, lppTable : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_outgoing_queue.call(this, ulFlags, lppTable)
    end
    def set_lock_state(this : IMsgStore*, lpMessage : Void*, ulLockState : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_lock_state.call(this, lpMessage, ulLockState)
    end
    def finished_msg(this : IMsgStore*, ulFlags : UInt32, cbEntryID : UInt32, lpEntryID : Win32cr::System::AddressBook::ENTRYID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finished_msg.call(this, ulFlags, cbEntryID, lpEntryID)
    end
    def notify_new_mail(this : IMsgStore*, lpNotification : Win32cr::System::AddressBook::NOTIFICATION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify_new_mail.call(this, lpNotification)
    end

  end

  @[Extern]
  record IMessageVtbl,
    query_interface : Proc(IMessage*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMessage*, UInt32),
    release : Proc(IMessage*, UInt32),
    get_last_error : Proc(IMessage*, Win32cr::Foundation::HRESULT, UInt32, Win32cr::System::AddressBook::MAPIERROR**, Win32cr::Foundation::HRESULT),
    save_changes : Proc(IMessage*, UInt32, Win32cr::Foundation::HRESULT),
    get_props : Proc(IMessage*, Win32cr::System::AddressBook::SPropTagArray*, UInt32, UInt32*, Win32cr::System::AddressBook::SPropValue**, Win32cr::Foundation::HRESULT),
    get_prop_list : Proc(IMessage*, UInt32, Win32cr::System::AddressBook::SPropTagArray**, Win32cr::Foundation::HRESULT),
    open_property : Proc(IMessage*, UInt32, LibC::GUID*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    set_props : Proc(IMessage*, UInt32, Win32cr::System::AddressBook::SPropValue*, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    delete_props : Proc(IMessage*, Win32cr::System::AddressBook::SPropTagArray*, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    copy_to : Proc(IMessage*, UInt32, LibC::GUID*, Win32cr::System::AddressBook::SPropTagArray*, LibC::UIntPtrT, Void*, LibC::GUID*, Void*, UInt32, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    copy_props : Proc(IMessage*, Win32cr::System::AddressBook::SPropTagArray*, LibC::UIntPtrT, Void*, LibC::GUID*, Void*, UInt32, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    get_names_from_i_ds : Proc(IMessage*, Win32cr::System::AddressBook::SPropTagArray**, LibC::GUID*, UInt32, UInt32*, Win32cr::System::AddressBook::MAPINAMEID***, Win32cr::Foundation::HRESULT),
    get_i_ds_from_names : Proc(IMessage*, UInt32, Win32cr::System::AddressBook::MAPINAMEID**, UInt32, Win32cr::System::AddressBook::SPropTagArray**, Win32cr::Foundation::HRESULT),
    get_attachment_table : Proc(IMessage*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    open_attach : Proc(IMessage*, UInt32, LibC::GUID*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    create_attach : Proc(IMessage*, LibC::GUID*, UInt32, UInt32*, Void**, Win32cr::Foundation::HRESULT),
    delete_attach : Proc(IMessage*, UInt32, LibC::UIntPtrT, Void*, UInt32, Win32cr::Foundation::HRESULT),
    get_recipient_table : Proc(IMessage*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    modify_recipients : Proc(IMessage*, UInt32, Win32cr::System::AddressBook::ADRLIST*, Win32cr::Foundation::HRESULT),
    submit_message : Proc(IMessage*, UInt32, Win32cr::Foundation::HRESULT),
    set_read_flag : Proc(IMessage*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMessage, lpVtbl : IMessageVtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def query_interface(this : IMessage*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMessage*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMessage*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_last_error(this : IMessage*, hResult : Win32cr::Foundation::HRESULT, ulFlags : UInt32, lppMAPIError : Win32cr::System::AddressBook::MAPIERROR**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_last_error.call(this, hResult, ulFlags, lppMAPIError)
    end
    def save_changes(this : IMessage*, ulFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_changes.call(this, ulFlags)
    end
    def get_props(this : IMessage*, lpPropTagArray : Win32cr::System::AddressBook::SPropTagArray*, ulFlags : UInt32, lpcValues : UInt32*, lppPropArray : Win32cr::System::AddressBook::SPropValue**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_props.call(this, lpPropTagArray, ulFlags, lpcValues, lppPropArray)
    end
    def get_prop_list(this : IMessage*, ulFlags : UInt32, lppPropTagArray : Win32cr::System::AddressBook::SPropTagArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prop_list.call(this, ulFlags, lppPropTagArray)
    end
    def open_property(this : IMessage*, ulPropTag : UInt32, lpiid : LibC::GUID*, ulInterfaceOptions : UInt32, ulFlags : UInt32, lppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_property.call(this, ulPropTag, lpiid, ulInterfaceOptions, ulFlags, lppUnk)
    end
    def set_props(this : IMessage*, cValues : UInt32, lpPropArray : Win32cr::System::AddressBook::SPropValue*, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_props.call(this, cValues, lpPropArray, lppProblems)
    end
    def delete_props(this : IMessage*, lpPropTagArray : Win32cr::System::AddressBook::SPropTagArray*, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_props.call(this, lpPropTagArray, lppProblems)
    end
    def copy_to(this : IMessage*, ciidExclude : UInt32, rgiidExclude : LibC::GUID*, lpExcludeProps : Win32cr::System::AddressBook::SPropTagArray*, ulUIParam : LibC::UIntPtrT, lpProgress : Void*, lpInterface : LibC::GUID*, lpDestObj : Void*, ulFlags : UInt32, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_to.call(this, ciidExclude, rgiidExclude, lpExcludeProps, ulUIParam, lpProgress, lpInterface, lpDestObj, ulFlags, lppProblems)
    end
    def copy_props(this : IMessage*, lpIncludeProps : Win32cr::System::AddressBook::SPropTagArray*, ulUIParam : LibC::UIntPtrT, lpProgress : Void*, lpInterface : LibC::GUID*, lpDestObj : Void*, ulFlags : UInt32, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_props.call(this, lpIncludeProps, ulUIParam, lpProgress, lpInterface, lpDestObj, ulFlags, lppProblems)
    end
    def get_names_from_i_ds(this : IMessage*, lppPropTags : Win32cr::System::AddressBook::SPropTagArray**, lpPropSetGuid : LibC::GUID*, ulFlags : UInt32, lpcPropNames : UInt32*, lpppPropNames : Win32cr::System::AddressBook::MAPINAMEID***) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_names_from_i_ds.call(this, lppPropTags, lpPropSetGuid, ulFlags, lpcPropNames, lpppPropNames)
    end
    def get_i_ds_from_names(this : IMessage*, cPropNames : UInt32, lppPropNames : Win32cr::System::AddressBook::MAPINAMEID**, ulFlags : UInt32, lppPropTags : Win32cr::System::AddressBook::SPropTagArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_from_names.call(this, cPropNames, lppPropNames, ulFlags, lppPropTags)
    end
    def get_attachment_table(this : IMessage*, ulFlags : UInt32, lppTable : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attachment_table.call(this, ulFlags, lppTable)
    end
    def open_attach(this : IMessage*, ulAttachmentNum : UInt32, lpInterface : LibC::GUID*, ulFlags : UInt32, lppAttach : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_attach.call(this, ulAttachmentNum, lpInterface, ulFlags, lppAttach)
    end
    def create_attach(this : IMessage*, lpInterface : LibC::GUID*, ulFlags : UInt32, lpulAttachmentNum : UInt32*, lppAttach : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_attach.call(this, lpInterface, ulFlags, lpulAttachmentNum, lppAttach)
    end
    def delete_attach(this : IMessage*, ulAttachmentNum : UInt32, ulUIParam : LibC::UIntPtrT, lpProgress : Void*, ulFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_attach.call(this, ulAttachmentNum, ulUIParam, lpProgress, ulFlags)
    end
    def get_recipient_table(this : IMessage*, ulFlags : UInt32, lppTable : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_recipient_table.call(this, ulFlags, lppTable)
    end
    def modify_recipients(this : IMessage*, ulFlags : UInt32, lpMods : Win32cr::System::AddressBook::ADRLIST*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.modify_recipients.call(this, ulFlags, lpMods)
    end
    def submit_message(this : IMessage*, ulFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.submit_message.call(this, ulFlags)
    end
    def set_read_flag(this : IMessage*, ulFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_read_flag.call(this, ulFlags)
    end

  end

  @[Extern]
  record IAttachVtbl,
    query_interface : Proc(IAttach*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAttach*, UInt32),
    release : Proc(IAttach*, UInt32),
    get_last_error : Proc(IAttach*, Win32cr::Foundation::HRESULT, UInt32, Win32cr::System::AddressBook::MAPIERROR**, Win32cr::Foundation::HRESULT),
    save_changes : Proc(IAttach*, UInt32, Win32cr::Foundation::HRESULT),
    get_props : Proc(IAttach*, Win32cr::System::AddressBook::SPropTagArray*, UInt32, UInt32*, Win32cr::System::AddressBook::SPropValue**, Win32cr::Foundation::HRESULT),
    get_prop_list : Proc(IAttach*, UInt32, Win32cr::System::AddressBook::SPropTagArray**, Win32cr::Foundation::HRESULT),
    open_property : Proc(IAttach*, UInt32, LibC::GUID*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    set_props : Proc(IAttach*, UInt32, Win32cr::System::AddressBook::SPropValue*, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    delete_props : Proc(IAttach*, Win32cr::System::AddressBook::SPropTagArray*, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    copy_to : Proc(IAttach*, UInt32, LibC::GUID*, Win32cr::System::AddressBook::SPropTagArray*, LibC::UIntPtrT, Void*, LibC::GUID*, Void*, UInt32, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    copy_props : Proc(IAttach*, Win32cr::System::AddressBook::SPropTagArray*, LibC::UIntPtrT, Void*, LibC::GUID*, Void*, UInt32, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    get_names_from_i_ds : Proc(IAttach*, Win32cr::System::AddressBook::SPropTagArray**, LibC::GUID*, UInt32, UInt32*, Win32cr::System::AddressBook::MAPINAMEID***, Win32cr::Foundation::HRESULT),
    get_i_ds_from_names : Proc(IAttach*, UInt32, Win32cr::System::AddressBook::MAPINAMEID**, UInt32, Win32cr::System::AddressBook::SPropTagArray**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAttach, lpVtbl : IAttachVtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def query_interface(this : IAttach*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAttach*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAttach*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_last_error(this : IAttach*, hResult : Win32cr::Foundation::HRESULT, ulFlags : UInt32, lppMAPIError : Win32cr::System::AddressBook::MAPIERROR**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_last_error.call(this, hResult, ulFlags, lppMAPIError)
    end
    def save_changes(this : IAttach*, ulFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_changes.call(this, ulFlags)
    end
    def get_props(this : IAttach*, lpPropTagArray : Win32cr::System::AddressBook::SPropTagArray*, ulFlags : UInt32, lpcValues : UInt32*, lppPropArray : Win32cr::System::AddressBook::SPropValue**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_props.call(this, lpPropTagArray, ulFlags, lpcValues, lppPropArray)
    end
    def get_prop_list(this : IAttach*, ulFlags : UInt32, lppPropTagArray : Win32cr::System::AddressBook::SPropTagArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prop_list.call(this, ulFlags, lppPropTagArray)
    end
    def open_property(this : IAttach*, ulPropTag : UInt32, lpiid : LibC::GUID*, ulInterfaceOptions : UInt32, ulFlags : UInt32, lppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_property.call(this, ulPropTag, lpiid, ulInterfaceOptions, ulFlags, lppUnk)
    end
    def set_props(this : IAttach*, cValues : UInt32, lpPropArray : Win32cr::System::AddressBook::SPropValue*, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_props.call(this, cValues, lpPropArray, lppProblems)
    end
    def delete_props(this : IAttach*, lpPropTagArray : Win32cr::System::AddressBook::SPropTagArray*, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_props.call(this, lpPropTagArray, lppProblems)
    end
    def copy_to(this : IAttach*, ciidExclude : UInt32, rgiidExclude : LibC::GUID*, lpExcludeProps : Win32cr::System::AddressBook::SPropTagArray*, ulUIParam : LibC::UIntPtrT, lpProgress : Void*, lpInterface : LibC::GUID*, lpDestObj : Void*, ulFlags : UInt32, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_to.call(this, ciidExclude, rgiidExclude, lpExcludeProps, ulUIParam, lpProgress, lpInterface, lpDestObj, ulFlags, lppProblems)
    end
    def copy_props(this : IAttach*, lpIncludeProps : Win32cr::System::AddressBook::SPropTagArray*, ulUIParam : LibC::UIntPtrT, lpProgress : Void*, lpInterface : LibC::GUID*, lpDestObj : Void*, ulFlags : UInt32, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_props.call(this, lpIncludeProps, ulUIParam, lpProgress, lpInterface, lpDestObj, ulFlags, lppProblems)
    end
    def get_names_from_i_ds(this : IAttach*, lppPropTags : Win32cr::System::AddressBook::SPropTagArray**, lpPropSetGuid : LibC::GUID*, ulFlags : UInt32, lpcPropNames : UInt32*, lpppPropNames : Win32cr::System::AddressBook::MAPINAMEID***) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_names_from_i_ds.call(this, lppPropTags, lpPropSetGuid, ulFlags, lpcPropNames, lpppPropNames)
    end
    def get_i_ds_from_names(this : IAttach*, cPropNames : UInt32, lppPropNames : Win32cr::System::AddressBook::MAPINAMEID**, ulFlags : UInt32, lppPropTags : Win32cr::System::AddressBook::SPropTagArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_from_names.call(this, cPropNames, lppPropNames, ulFlags, lppPropTags)
    end

  end

  @[Extern]
  record IMAPIControlVtbl,
    query_interface : Proc(IMAPIControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMAPIControl*, UInt32),
    release : Proc(IMAPIControl*, UInt32),
    get_last_error : Proc(IMAPIControl*, Win32cr::Foundation::HRESULT, UInt32, Win32cr::System::AddressBook::MAPIERROR**, Win32cr::Foundation::HRESULT),
    activate : Proc(IMAPIControl*, UInt32, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    get_state : Proc(IMAPIControl*, UInt32, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMAPIControl, lpVtbl : IMAPIControlVtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def query_interface(this : IMAPIControl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMAPIControl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMAPIControl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_last_error(this : IMAPIControl*, hResult : Win32cr::Foundation::HRESULT, ulFlags : UInt32, lppMAPIError : Win32cr::System::AddressBook::MAPIERROR**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_last_error.call(this, hResult, ulFlags, lppMAPIError)
    end
    def activate(this : IMAPIControl*, ulFlags : UInt32, ulUIParam : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.activate.call(this, ulFlags, ulUIParam)
    end
    def get_state(this : IMAPIControl*, ulFlags : UInt32, lpulState : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_state.call(this, ulFlags, lpulState)
    end

  end

  @[Extern]
  record IProviderAdminVtbl,
    query_interface : Proc(IProviderAdmin*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IProviderAdmin*, UInt32),
    release : Proc(IProviderAdmin*, UInt32),
    get_last_error : Proc(IProviderAdmin*, Win32cr::Foundation::HRESULT, UInt32, Win32cr::System::AddressBook::MAPIERROR**, Win32cr::Foundation::HRESULT),
    get_provider_table : Proc(IProviderAdmin*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    create_provider : Proc(IProviderAdmin*, Int8*, UInt32, Win32cr::System::AddressBook::SPropValue*, LibC::UIntPtrT, UInt32, Win32cr::System::AddressBook::MAPIUID*, Win32cr::Foundation::HRESULT),
    delete_provider : Proc(IProviderAdmin*, Win32cr::System::AddressBook::MAPIUID*, Win32cr::Foundation::HRESULT),
    open_profile_section : Proc(IProviderAdmin*, Win32cr::System::AddressBook::MAPIUID*, LibC::GUID*, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IProviderAdmin, lpVtbl : IProviderAdminVtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def query_interface(this : IProviderAdmin*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IProviderAdmin*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IProviderAdmin*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_last_error(this : IProviderAdmin*, hResult : Win32cr::Foundation::HRESULT, ulFlags : UInt32, lppMAPIError : Win32cr::System::AddressBook::MAPIERROR**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_last_error.call(this, hResult, ulFlags, lppMAPIError)
    end
    def get_provider_table(this : IProviderAdmin*, ulFlags : UInt32, lppTable : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_provider_table.call(this, ulFlags, lppTable)
    end
    def create_provider(this : IProviderAdmin*, lpszProvider : Int8*, cValues : UInt32, lpProps : Win32cr::System::AddressBook::SPropValue*, ulUIParam : LibC::UIntPtrT, ulFlags : UInt32, lpUID : Win32cr::System::AddressBook::MAPIUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_provider.call(this, lpszProvider, cValues, lpProps, ulUIParam, ulFlags, lpUID)
    end
    def delete_provider(this : IProviderAdmin*, lpUID : Win32cr::System::AddressBook::MAPIUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_provider.call(this, lpUID)
    end
    def open_profile_section(this : IProviderAdmin*, lpUID : Win32cr::System::AddressBook::MAPIUID*, lpInterface : LibC::GUID*, ulFlags : UInt32, lppProfSect : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_profile_section.call(this, lpUID, lpInterface, ulFlags, lppProfSect)
    end

  end

  @[Extern]
  record ITableDataVtbl,
    query_interface : Proc(ITableData*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITableData*, UInt32),
    release : Proc(ITableData*, UInt32),
    hr_get_view : Proc(ITableData*, Win32cr::System::AddressBook::SSortOrderSet*, Win32cr::System::AddressBook::CALLERRELEASE*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    hr_modify_row : Proc(ITableData*, Win32cr::System::AddressBook::SRow*, Win32cr::Foundation::HRESULT),
    hr_delete_row : Proc(ITableData*, Win32cr::System::AddressBook::SPropValue*, Win32cr::Foundation::HRESULT),
    hr_query_row : Proc(ITableData*, Win32cr::System::AddressBook::SPropValue*, Win32cr::System::AddressBook::SRow**, UInt32*, Win32cr::Foundation::HRESULT),
    hr_enum_row : Proc(ITableData*, UInt32, Win32cr::System::AddressBook::SRow**, Win32cr::Foundation::HRESULT),
    hr_notify : Proc(ITableData*, UInt32, UInt32, Win32cr::System::AddressBook::SPropValue*, Win32cr::Foundation::HRESULT),
    hr_insert_row : Proc(ITableData*, UInt32, Win32cr::System::AddressBook::SRow*, Win32cr::Foundation::HRESULT),
    hr_modify_rows : Proc(ITableData*, UInt32, Win32cr::System::AddressBook::SRowSet*, Win32cr::Foundation::HRESULT),
    hr_delete_rows : Proc(ITableData*, UInt32, Win32cr::System::AddressBook::SRowSet*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITableData, lpVtbl : ITableDataVtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def query_interface(this : ITableData*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITableData*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITableData*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def hr_get_view(this : ITableData*, lpSSortOrderSet : Win32cr::System::AddressBook::SSortOrderSet*, lpfCallerRelease : Win32cr::System::AddressBook::CALLERRELEASE*, ulCallerData : UInt32, lppMAPITable : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.hr_get_view.call(this, lpSSortOrderSet, lpfCallerRelease, ulCallerData, lppMAPITable)
    end
    def hr_modify_row(this : ITableData*, param0 : Win32cr::System::AddressBook::SRow*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.hr_modify_row.call(this, param0)
    end
    def hr_delete_row(this : ITableData*, lpSPropValue : Win32cr::System::AddressBook::SPropValue*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.hr_delete_row.call(this, lpSPropValue)
    end
    def hr_query_row(this : ITableData*, lpsPropValue : Win32cr::System::AddressBook::SPropValue*, lppSRow : Win32cr::System::AddressBook::SRow**, lpuliRow : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.hr_query_row.call(this, lpsPropValue, lppSRow, lpuliRow)
    end
    def hr_enum_row(this : ITableData*, ulRowNumber : UInt32, lppSRow : Win32cr::System::AddressBook::SRow**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.hr_enum_row.call(this, ulRowNumber, lppSRow)
    end
    def hr_notify(this : ITableData*, ulFlags : UInt32, cValues : UInt32, lpSPropValue : Win32cr::System::AddressBook::SPropValue*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.hr_notify.call(this, ulFlags, cValues, lpSPropValue)
    end
    def hr_insert_row(this : ITableData*, uliRow : UInt32, lpSRow : Win32cr::System::AddressBook::SRow*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.hr_insert_row.call(this, uliRow, lpSRow)
    end
    def hr_modify_rows(this : ITableData*, ulFlags : UInt32, lpSRowSet : Win32cr::System::AddressBook::SRowSet*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.hr_modify_rows.call(this, ulFlags, lpSRowSet)
    end
    def hr_delete_rows(this : ITableData*, ulFlags : UInt32, lprowsetToDelete : Win32cr::System::AddressBook::SRowSet*, cRowsDeleted : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.hr_delete_rows.call(this, ulFlags, lprowsetToDelete, cRowsDeleted)
    end

  end

  @[Extern]
  record IPropDataVtbl,
    query_interface : Proc(IPropData*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPropData*, UInt32),
    release : Proc(IPropData*, UInt32),
    get_last_error : Proc(IPropData*, Win32cr::Foundation::HRESULT, UInt32, Win32cr::System::AddressBook::MAPIERROR**, Win32cr::Foundation::HRESULT),
    save_changes : Proc(IPropData*, UInt32, Win32cr::Foundation::HRESULT),
    get_props : Proc(IPropData*, Win32cr::System::AddressBook::SPropTagArray*, UInt32, UInt32*, Win32cr::System::AddressBook::SPropValue**, Win32cr::Foundation::HRESULT),
    get_prop_list : Proc(IPropData*, UInt32, Win32cr::System::AddressBook::SPropTagArray**, Win32cr::Foundation::HRESULT),
    open_property : Proc(IPropData*, UInt32, LibC::GUID*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    set_props : Proc(IPropData*, UInt32, Win32cr::System::AddressBook::SPropValue*, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    delete_props : Proc(IPropData*, Win32cr::System::AddressBook::SPropTagArray*, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    copy_to : Proc(IPropData*, UInt32, LibC::GUID*, Win32cr::System::AddressBook::SPropTagArray*, LibC::UIntPtrT, Void*, LibC::GUID*, Void*, UInt32, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    copy_props : Proc(IPropData*, Win32cr::System::AddressBook::SPropTagArray*, LibC::UIntPtrT, Void*, LibC::GUID*, Void*, UInt32, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    get_names_from_i_ds : Proc(IPropData*, Win32cr::System::AddressBook::SPropTagArray**, LibC::GUID*, UInt32, UInt32*, Win32cr::System::AddressBook::MAPINAMEID***, Win32cr::Foundation::HRESULT),
    get_i_ds_from_names : Proc(IPropData*, UInt32, Win32cr::System::AddressBook::MAPINAMEID**, UInt32, Win32cr::System::AddressBook::SPropTagArray**, Win32cr::Foundation::HRESULT),
    hr_set_obj_access : Proc(IPropData*, UInt32, Win32cr::Foundation::HRESULT),
    hr_set_prop_access : Proc(IPropData*, Win32cr::System::AddressBook::SPropTagArray*, UInt32*, Win32cr::Foundation::HRESULT),
    hr_get_prop_access : Proc(IPropData*, Win32cr::System::AddressBook::SPropTagArray**, UInt32**, Win32cr::Foundation::HRESULT),
    hr_add_obj_props : Proc(IPropData*, Win32cr::System::AddressBook::SPropTagArray*, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPropData, lpVtbl : IPropDataVtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def query_interface(this : IPropData*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPropData*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPropData*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_last_error(this : IPropData*, hResult : Win32cr::Foundation::HRESULT, ulFlags : UInt32, lppMAPIError : Win32cr::System::AddressBook::MAPIERROR**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_last_error.call(this, hResult, ulFlags, lppMAPIError)
    end
    def save_changes(this : IPropData*, ulFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_changes.call(this, ulFlags)
    end
    def get_props(this : IPropData*, lpPropTagArray : Win32cr::System::AddressBook::SPropTagArray*, ulFlags : UInt32, lpcValues : UInt32*, lppPropArray : Win32cr::System::AddressBook::SPropValue**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_props.call(this, lpPropTagArray, ulFlags, lpcValues, lppPropArray)
    end
    def get_prop_list(this : IPropData*, ulFlags : UInt32, lppPropTagArray : Win32cr::System::AddressBook::SPropTagArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prop_list.call(this, ulFlags, lppPropTagArray)
    end
    def open_property(this : IPropData*, ulPropTag : UInt32, lpiid : LibC::GUID*, ulInterfaceOptions : UInt32, ulFlags : UInt32, lppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_property.call(this, ulPropTag, lpiid, ulInterfaceOptions, ulFlags, lppUnk)
    end
    def set_props(this : IPropData*, cValues : UInt32, lpPropArray : Win32cr::System::AddressBook::SPropValue*, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_props.call(this, cValues, lpPropArray, lppProblems)
    end
    def delete_props(this : IPropData*, lpPropTagArray : Win32cr::System::AddressBook::SPropTagArray*, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_props.call(this, lpPropTagArray, lppProblems)
    end
    def copy_to(this : IPropData*, ciidExclude : UInt32, rgiidExclude : LibC::GUID*, lpExcludeProps : Win32cr::System::AddressBook::SPropTagArray*, ulUIParam : LibC::UIntPtrT, lpProgress : Void*, lpInterface : LibC::GUID*, lpDestObj : Void*, ulFlags : UInt32, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_to.call(this, ciidExclude, rgiidExclude, lpExcludeProps, ulUIParam, lpProgress, lpInterface, lpDestObj, ulFlags, lppProblems)
    end
    def copy_props(this : IPropData*, lpIncludeProps : Win32cr::System::AddressBook::SPropTagArray*, ulUIParam : LibC::UIntPtrT, lpProgress : Void*, lpInterface : LibC::GUID*, lpDestObj : Void*, ulFlags : UInt32, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_props.call(this, lpIncludeProps, ulUIParam, lpProgress, lpInterface, lpDestObj, ulFlags, lppProblems)
    end
    def get_names_from_i_ds(this : IPropData*, lppPropTags : Win32cr::System::AddressBook::SPropTagArray**, lpPropSetGuid : LibC::GUID*, ulFlags : UInt32, lpcPropNames : UInt32*, lpppPropNames : Win32cr::System::AddressBook::MAPINAMEID***) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_names_from_i_ds.call(this, lppPropTags, lpPropSetGuid, ulFlags, lpcPropNames, lpppPropNames)
    end
    def get_i_ds_from_names(this : IPropData*, cPropNames : UInt32, lppPropNames : Win32cr::System::AddressBook::MAPINAMEID**, ulFlags : UInt32, lppPropTags : Win32cr::System::AddressBook::SPropTagArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_from_names.call(this, cPropNames, lppPropNames, ulFlags, lppPropTags)
    end
    def hr_set_obj_access(this : IPropData*, ulAccess : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.hr_set_obj_access.call(this, ulAccess)
    end
    def hr_set_prop_access(this : IPropData*, lpPropTagArray : Win32cr::System::AddressBook::SPropTagArray*, rgulAccess : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.hr_set_prop_access.call(this, lpPropTagArray, rgulAccess)
    end
    def hr_get_prop_access(this : IPropData*, lppPropTagArray : Win32cr::System::AddressBook::SPropTagArray**, lprgulAccess : UInt32**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.hr_get_prop_access.call(this, lppPropTagArray, lprgulAccess)
    end
    def hr_add_obj_props(this : IPropData*, lppPropTagArray : Win32cr::System::AddressBook::SPropTagArray*, lprgulAccess : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.hr_add_obj_props.call(this, lppPropTagArray, lprgulAccess)
    end

  end

  @[Extern]
  record IAddrBookVtbl,
    query_interface : Proc(IAddrBook*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAddrBook*, UInt32),
    release : Proc(IAddrBook*, UInt32),
    get_last_error : Proc(IAddrBook*, Win32cr::Foundation::HRESULT, UInt32, Win32cr::System::AddressBook::MAPIERROR**, Win32cr::Foundation::HRESULT),
    save_changes : Proc(IAddrBook*, UInt32, Win32cr::Foundation::HRESULT),
    get_props : Proc(IAddrBook*, Win32cr::System::AddressBook::SPropTagArray*, UInt32, UInt32*, Win32cr::System::AddressBook::SPropValue**, Win32cr::Foundation::HRESULT),
    get_prop_list : Proc(IAddrBook*, UInt32, Win32cr::System::AddressBook::SPropTagArray**, Win32cr::Foundation::HRESULT),
    open_property : Proc(IAddrBook*, UInt32, LibC::GUID*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    set_props : Proc(IAddrBook*, UInt32, Win32cr::System::AddressBook::SPropValue*, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    delete_props : Proc(IAddrBook*, Win32cr::System::AddressBook::SPropTagArray*, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    copy_to : Proc(IAddrBook*, UInt32, LibC::GUID*, Win32cr::System::AddressBook::SPropTagArray*, LibC::UIntPtrT, Void*, LibC::GUID*, Void*, UInt32, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    copy_props : Proc(IAddrBook*, Win32cr::System::AddressBook::SPropTagArray*, LibC::UIntPtrT, Void*, LibC::GUID*, Void*, UInt32, Win32cr::System::AddressBook::SPropProblemArray**, Win32cr::Foundation::HRESULT),
    get_names_from_i_ds : Proc(IAddrBook*, Win32cr::System::AddressBook::SPropTagArray**, LibC::GUID*, UInt32, UInt32*, Win32cr::System::AddressBook::MAPINAMEID***, Win32cr::Foundation::HRESULT),
    get_i_ds_from_names : Proc(IAddrBook*, UInt32, Win32cr::System::AddressBook::MAPINAMEID**, UInt32, Win32cr::System::AddressBook::SPropTagArray**, Win32cr::Foundation::HRESULT),
    open_entry : Proc(IAddrBook*, UInt32, Win32cr::System::AddressBook::ENTRYID*, LibC::GUID*, UInt32, UInt32*, Void**, Win32cr::Foundation::HRESULT),
    compare_entry_i_ds : Proc(IAddrBook*, UInt32, Win32cr::System::AddressBook::ENTRYID*, UInt32, Win32cr::System::AddressBook::ENTRYID*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    advise : Proc(IAddrBook*, UInt32, Win32cr::System::AddressBook::ENTRYID*, UInt32, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    unadvise : Proc(IAddrBook*, UInt32, Win32cr::Foundation::HRESULT),
    create_one_off : Proc(IAddrBook*, Int8*, Int8*, Int8*, UInt32, UInt32*, Win32cr::System::AddressBook::ENTRYID**, Win32cr::Foundation::HRESULT),
    new_entry : Proc(IAddrBook*, UInt32, UInt32, UInt32, Win32cr::System::AddressBook::ENTRYID*, UInt32, Win32cr::System::AddressBook::ENTRYID*, UInt32*, Win32cr::System::AddressBook::ENTRYID**, Win32cr::Foundation::HRESULT),
    resolve_name : Proc(IAddrBook*, LibC::UIntPtrT, UInt32, Int8*, Win32cr::System::AddressBook::ADRLIST*, Win32cr::Foundation::HRESULT),
    address : Proc(IAddrBook*, UInt32*, Win32cr::System::AddressBook::ADRPARM*, Win32cr::System::AddressBook::ADRLIST**, Win32cr::Foundation::HRESULT),
    details : Proc(IAddrBook*, LibC::UIntPtrT*, Win32cr::System::AddressBook::LPFNDISMISS, Void*, UInt32, Win32cr::System::AddressBook::ENTRYID*, Win32cr::System::AddressBook::LPFNBUTTON, Void*, Int8*, UInt32, Win32cr::Foundation::HRESULT),
    recip_options : Proc(IAddrBook*, UInt32, UInt32, Win32cr::System::AddressBook::ADRENTRY*, Win32cr::Foundation::HRESULT),
    query_default_recip_opt : Proc(IAddrBook*, Int8*, UInt32, UInt32*, Win32cr::System::AddressBook::SPropValue**, Win32cr::Foundation::HRESULT),
    get_pab : Proc(IAddrBook*, UInt32*, Win32cr::System::AddressBook::ENTRYID**, Win32cr::Foundation::HRESULT),
    set_pab : Proc(IAddrBook*, UInt32, Win32cr::System::AddressBook::ENTRYID*, Win32cr::Foundation::HRESULT),
    get_default_dir : Proc(IAddrBook*, UInt32*, Win32cr::System::AddressBook::ENTRYID**, Win32cr::Foundation::HRESULT),
    set_default_dir : Proc(IAddrBook*, UInt32, Win32cr::System::AddressBook::ENTRYID*, Win32cr::Foundation::HRESULT),
    get_search_path : Proc(IAddrBook*, UInt32, Win32cr::System::AddressBook::SRowSet**, Win32cr::Foundation::HRESULT),
    set_search_path : Proc(IAddrBook*, UInt32, Win32cr::System::AddressBook::SRowSet*, Win32cr::Foundation::HRESULT),
    prepare_recips : Proc(IAddrBook*, UInt32, Win32cr::System::AddressBook::SPropTagArray*, Win32cr::System::AddressBook::ADRLIST*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAddrBook, lpVtbl : IAddrBookVtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def query_interface(this : IAddrBook*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAddrBook*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAddrBook*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_last_error(this : IAddrBook*, hResult : Win32cr::Foundation::HRESULT, ulFlags : UInt32, lppMAPIError : Win32cr::System::AddressBook::MAPIERROR**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_last_error.call(this, hResult, ulFlags, lppMAPIError)
    end
    def save_changes(this : IAddrBook*, ulFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_changes.call(this, ulFlags)
    end
    def get_props(this : IAddrBook*, lpPropTagArray : Win32cr::System::AddressBook::SPropTagArray*, ulFlags : UInt32, lpcValues : UInt32*, lppPropArray : Win32cr::System::AddressBook::SPropValue**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_props.call(this, lpPropTagArray, ulFlags, lpcValues, lppPropArray)
    end
    def get_prop_list(this : IAddrBook*, ulFlags : UInt32, lppPropTagArray : Win32cr::System::AddressBook::SPropTagArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prop_list.call(this, ulFlags, lppPropTagArray)
    end
    def open_property(this : IAddrBook*, ulPropTag : UInt32, lpiid : LibC::GUID*, ulInterfaceOptions : UInt32, ulFlags : UInt32, lppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_property.call(this, ulPropTag, lpiid, ulInterfaceOptions, ulFlags, lppUnk)
    end
    def set_props(this : IAddrBook*, cValues : UInt32, lpPropArray : Win32cr::System::AddressBook::SPropValue*, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_props.call(this, cValues, lpPropArray, lppProblems)
    end
    def delete_props(this : IAddrBook*, lpPropTagArray : Win32cr::System::AddressBook::SPropTagArray*, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_props.call(this, lpPropTagArray, lppProblems)
    end
    def copy_to(this : IAddrBook*, ciidExclude : UInt32, rgiidExclude : LibC::GUID*, lpExcludeProps : Win32cr::System::AddressBook::SPropTagArray*, ulUIParam : LibC::UIntPtrT, lpProgress : Void*, lpInterface : LibC::GUID*, lpDestObj : Void*, ulFlags : UInt32, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_to.call(this, ciidExclude, rgiidExclude, lpExcludeProps, ulUIParam, lpProgress, lpInterface, lpDestObj, ulFlags, lppProblems)
    end
    def copy_props(this : IAddrBook*, lpIncludeProps : Win32cr::System::AddressBook::SPropTagArray*, ulUIParam : LibC::UIntPtrT, lpProgress : Void*, lpInterface : LibC::GUID*, lpDestObj : Void*, ulFlags : UInt32, lppProblems : Win32cr::System::AddressBook::SPropProblemArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_props.call(this, lpIncludeProps, ulUIParam, lpProgress, lpInterface, lpDestObj, ulFlags, lppProblems)
    end
    def get_names_from_i_ds(this : IAddrBook*, lppPropTags : Win32cr::System::AddressBook::SPropTagArray**, lpPropSetGuid : LibC::GUID*, ulFlags : UInt32, lpcPropNames : UInt32*, lpppPropNames : Win32cr::System::AddressBook::MAPINAMEID***) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_names_from_i_ds.call(this, lppPropTags, lpPropSetGuid, ulFlags, lpcPropNames, lpppPropNames)
    end
    def get_i_ds_from_names(this : IAddrBook*, cPropNames : UInt32, lppPropNames : Win32cr::System::AddressBook::MAPINAMEID**, ulFlags : UInt32, lppPropTags : Win32cr::System::AddressBook::SPropTagArray**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_from_names.call(this, cPropNames, lppPropNames, ulFlags, lppPropTags)
    end
    def open_entry(this : IAddrBook*, cbEntryID : UInt32, lpEntryID : Win32cr::System::AddressBook::ENTRYID*, lpInterface : LibC::GUID*, ulFlags : UInt32, lpulObjType : UInt32*, lppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_entry.call(this, cbEntryID, lpEntryID, lpInterface, ulFlags, lpulObjType, lppUnk)
    end
    def compare_entry_i_ds(this : IAddrBook*, cbEntryID1 : UInt32, lpEntryID1 : Win32cr::System::AddressBook::ENTRYID*, cbEntryID2 : UInt32, lpEntryID2 : Win32cr::System::AddressBook::ENTRYID*, ulFlags : UInt32, lpulResult : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compare_entry_i_ds.call(this, cbEntryID1, lpEntryID1, cbEntryID2, lpEntryID2, ulFlags, lpulResult)
    end
    def advise(this : IAddrBook*, cbEntryID : UInt32, lpEntryID : Win32cr::System::AddressBook::ENTRYID*, ulEventMask : UInt32, lpAdviseSink : Void*, lpulConnection : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.advise.call(this, cbEntryID, lpEntryID, ulEventMask, lpAdviseSink, lpulConnection)
    end
    def unadvise(this : IAddrBook*, ulConnection : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unadvise.call(this, ulConnection)
    end
    def create_one_off(this : IAddrBook*, lpszName : Int8*, lpszAdrType : Int8*, lpszAddress : Int8*, ulFlags : UInt32, lpcbEntryID : UInt32*, lppEntryID : Win32cr::System::AddressBook::ENTRYID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_one_off.call(this, lpszName, lpszAdrType, lpszAddress, ulFlags, lpcbEntryID, lppEntryID)
    end
    def new_entry(this : IAddrBook*, ulUIParam : UInt32, ulFlags : UInt32, cbEIDContainer : UInt32, lpEIDContainer : Win32cr::System::AddressBook::ENTRYID*, cbEIDNewEntryTpl : UInt32, lpEIDNewEntryTpl : Win32cr::System::AddressBook::ENTRYID*, lpcbEIDNewEntry : UInt32*, lppEIDNewEntry : Win32cr::System::AddressBook::ENTRYID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.new_entry.call(this, ulUIParam, ulFlags, cbEIDContainer, lpEIDContainer, cbEIDNewEntryTpl, lpEIDNewEntryTpl, lpcbEIDNewEntry, lppEIDNewEntry)
    end
    def resolve_name(this : IAddrBook*, ulUIParam : LibC::UIntPtrT, ulFlags : UInt32, lpszNewEntryTitle : Int8*, lpAdrList : Win32cr::System::AddressBook::ADRLIST*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resolve_name.call(this, ulUIParam, ulFlags, lpszNewEntryTitle, lpAdrList)
    end
    def address(this : IAddrBook*, lpulUIParam : UInt32*, lpAdrParms : Win32cr::System::AddressBook::ADRPARM*, lppAdrList : Win32cr::System::AddressBook::ADRLIST**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.address.call(this, lpulUIParam, lpAdrParms, lppAdrList)
    end
    def details(this : IAddrBook*, lpulUIParam : LibC::UIntPtrT*, lpfnDismiss : Win32cr::System::AddressBook::LPFNDISMISS, lpvDismissContext : Void*, cbEntryID : UInt32, lpEntryID : Win32cr::System::AddressBook::ENTRYID*, lpfButtonCallback : Win32cr::System::AddressBook::LPFNBUTTON, lpvButtonContext : Void*, lpszButtonText : Int8*, ulFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.details.call(this, lpulUIParam, lpfnDismiss, lpvDismissContext, cbEntryID, lpEntryID, lpfButtonCallback, lpvButtonContext, lpszButtonText, ulFlags)
    end
    def recip_options(this : IAddrBook*, ulUIParam : UInt32, ulFlags : UInt32, lpRecip : Win32cr::System::AddressBook::ADRENTRY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.recip_options.call(this, ulUIParam, ulFlags, lpRecip)
    end
    def query_default_recip_opt(this : IAddrBook*, lpszAdrType : Int8*, ulFlags : UInt32, lpcValues : UInt32*, lppOptions : Win32cr::System::AddressBook::SPropValue**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_default_recip_opt.call(this, lpszAdrType, ulFlags, lpcValues, lppOptions)
    end
    def get_pab(this : IAddrBook*, lpcbEntryID : UInt32*, lppEntryID : Win32cr::System::AddressBook::ENTRYID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pab.call(this, lpcbEntryID, lppEntryID)
    end
    def set_pab(this : IAddrBook*, cbEntryID : UInt32, lpEntryID : Win32cr::System::AddressBook::ENTRYID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_pab.call(this, cbEntryID, lpEntryID)
    end
    def get_default_dir(this : IAddrBook*, lpcbEntryID : UInt32*, lppEntryID : Win32cr::System::AddressBook::ENTRYID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_default_dir.call(this, lpcbEntryID, lppEntryID)
    end
    def set_default_dir(this : IAddrBook*, cbEntryID : UInt32, lpEntryID : Win32cr::System::AddressBook::ENTRYID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_default_dir.call(this, cbEntryID, lpEntryID)
    end
    def get_search_path(this : IAddrBook*, ulFlags : UInt32, lppSearchPath : Win32cr::System::AddressBook::SRowSet**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_search_path.call(this, ulFlags, lppSearchPath)
    end
    def set_search_path(this : IAddrBook*, ulFlags : UInt32, lpSearchPath : Win32cr::System::AddressBook::SRowSet*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_search_path.call(this, ulFlags, lpSearchPath)
    end
    def prepare_recips(this : IAddrBook*, ulFlags : UInt32, lpPropTagArray : Win32cr::System::AddressBook::SPropTagArray*, lpRecipList : Win32cr::System::AddressBook::ADRLIST*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.prepare_recips.call(this, ulFlags, lpPropTagArray, lpRecipList)
    end

  end

  @[Extern]
  record IWABObjectVtbl,
    query_interface : Proc(IWABObject*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWABObject*, UInt32),
    release : Proc(IWABObject*, UInt32),
    get_last_error : Proc(IWABObject*, Win32cr::Foundation::HRESULT, UInt32, Win32cr::System::AddressBook::MAPIERROR**, Win32cr::Foundation::HRESULT),
    allocate_buffer : Proc(IWABObject*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    allocate_more : Proc(IWABObject*, UInt32, Void*, Void**, Win32cr::Foundation::HRESULT),
    free_buffer : Proc(IWABObject*, Void*, Win32cr::Foundation::HRESULT),
    backup : Proc(IWABObject*, Win32cr::Foundation::PSTR, Win32cr::Foundation::HRESULT),
    import : Proc(IWABObject*, Win32cr::Foundation::PSTR, Win32cr::Foundation::HRESULT),
    find : Proc(IWABObject*, Void*, Win32cr::Foundation::HWND, Win32cr::Foundation::HRESULT),
    v_card_display : Proc(IWABObject*, Void*, Win32cr::Foundation::HWND, Win32cr::Foundation::PSTR, Win32cr::Foundation::HRESULT),
    ldap_url : Proc(IWABObject*, Void*, Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::PSTR, Void**, Win32cr::Foundation::HRESULT),
    v_card_create : Proc(IWABObject*, Void*, UInt32, Win32cr::Foundation::PSTR, Void*, Win32cr::Foundation::HRESULT),
    v_card_retrieve : Proc(IWABObject*, Void*, UInt32, Win32cr::Foundation::PSTR, Void**, Win32cr::Foundation::HRESULT),
    get_me : Proc(IWABObject*, Void*, UInt32, UInt32*, Win32cr::System::AddressBook::SBinary*, Win32cr::Foundation::HWND, Win32cr::Foundation::HRESULT),
    set_me : Proc(IWABObject*, Void*, UInt32, Win32cr::System::AddressBook::SBinary, Win32cr::Foundation::HWND, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWABObject, lpVtbl : IWABObjectVtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def query_interface(this : IWABObject*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWABObject*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWABObject*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_last_error(this : IWABObject*, hResult : Win32cr::Foundation::HRESULT, ulFlags : UInt32, lppMAPIError : Win32cr::System::AddressBook::MAPIERROR**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_last_error.call(this, hResult, ulFlags, lppMAPIError)
    end
    def allocate_buffer(this : IWABObject*, cbSize : UInt32, lppBuffer : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.allocate_buffer.call(this, cbSize, lppBuffer)
    end
    def allocate_more(this : IWABObject*, cbSize : UInt32, lpObject : Void*, lppBuffer : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.allocate_more.call(this, cbSize, lpObject, lppBuffer)
    end
    def free_buffer(this : IWABObject*, lpBuffer : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.free_buffer.call(this, lpBuffer)
    end
    def backup(this : IWABObject*, lpFileName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.backup.call(this, lpFileName)
    end
    def import(this : IWABObject*, lpWIP : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.import.call(this, lpWIP)
    end
    def find(this : IWABObject*, lpIAB : Void*, hWnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find.call(this, lpIAB, hWnd)
    end
    def v_card_display(this : IWABObject*, lpIAB : Void*, hWnd : Win32cr::Foundation::HWND, lpszFileName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.v_card_display.call(this, lpIAB, hWnd, lpszFileName)
    end
    def ldap_url(this : IWABObject*, lpIAB : Void*, hWnd : Win32cr::Foundation::HWND, ulFlags : UInt32, lpszURL : Win32cr::Foundation::PSTR, lppMailUser : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.ldap_url.call(this, lpIAB, hWnd, ulFlags, lpszURL, lppMailUser)
    end
    def v_card_create(this : IWABObject*, lpIAB : Void*, ulFlags : UInt32, lpszVCard : Win32cr::Foundation::PSTR, lpMailUser : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.v_card_create.call(this, lpIAB, ulFlags, lpszVCard, lpMailUser)
    end
    def v_card_retrieve(this : IWABObject*, lpIAB : Void*, ulFlags : UInt32, lpszVCard : Win32cr::Foundation::PSTR, lppMailUser : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.v_card_retrieve.call(this, lpIAB, ulFlags, lpszVCard, lppMailUser)
    end
    def get_me(this : IWABObject*, lpIAB : Void*, ulFlags : UInt32, lpdwAction : UInt32*, lpsbEID : Win32cr::System::AddressBook::SBinary*, hwnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_me.call(this, lpIAB, ulFlags, lpdwAction, lpsbEID, hwnd)
    end
    def set_me(this : IWABObject*, lpIAB : Void*, ulFlags : UInt32, sbEID : Win32cr::System::AddressBook::SBinary, hwnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_me.call(this, lpIAB, ulFlags, sbEID, hwnd)
    end

  end

  @[Extern]
  record IWABOBJECT_Vtbl,
    query_interface : Proc(IWABOBJECT_*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWABOBJECT_*, UInt32),
    release : Proc(IWABOBJECT_*, UInt32),
    get_last_error : Proc(IWABOBJECT_*, Win32cr::Foundation::HRESULT, UInt32, Win32cr::System::AddressBook::MAPIERROR**, Win32cr::Foundation::HRESULT),
    allocate_buffer : Proc(IWABOBJECT_*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    allocate_more : Proc(IWABOBJECT_*, UInt32, Void*, Void**, Win32cr::Foundation::HRESULT),
    free_buffer : Proc(IWABOBJECT_*, Void*, Win32cr::Foundation::HRESULT),
    backup : Proc(IWABOBJECT_*, Win32cr::Foundation::PSTR, Win32cr::Foundation::HRESULT),
    import : Proc(IWABOBJECT_*, Win32cr::Foundation::PSTR, Win32cr::Foundation::HRESULT),
    find : Proc(IWABOBJECT_*, Void*, Win32cr::Foundation::HWND, Win32cr::Foundation::HRESULT),
    v_card_display : Proc(IWABOBJECT_*, Void*, Win32cr::Foundation::HWND, Win32cr::Foundation::PSTR, Win32cr::Foundation::HRESULT),
    ldap_url : Proc(IWABOBJECT_*, Void*, Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::PSTR, Void**, Win32cr::Foundation::HRESULT),
    v_card_create : Proc(IWABOBJECT_*, Void*, UInt32, Win32cr::Foundation::PSTR, Void*, Win32cr::Foundation::HRESULT),
    v_card_retrieve : Proc(IWABOBJECT_*, Void*, UInt32, Win32cr::Foundation::PSTR, Void**, Win32cr::Foundation::HRESULT),
    get_me : Proc(IWABOBJECT_*, Void*, UInt32, UInt32*, Win32cr::System::AddressBook::SBinary*, Win32cr::Foundation::HWND, Win32cr::Foundation::HRESULT),
    set_me : Proc(IWABOBJECT_*, Void*, UInt32, Win32cr::System::AddressBook::SBinary, Win32cr::Foundation::HWND, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWABOBJECT_, lpVtbl : IWABOBJECT_Vtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def query_interface(this : IWABOBJECT_*, riid : LibC::GUID*, ppvObj : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObj)
    end
    def add_ref(this : IWABOBJECT_*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWABOBJECT_*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_last_error(this : IWABOBJECT_*, hResult : Win32cr::Foundation::HRESULT, ulFlags : UInt32, lppMAPIError : Win32cr::System::AddressBook::MAPIERROR**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_last_error.call(this, hResult, ulFlags, lppMAPIError)
    end
    def allocate_buffer(this : IWABOBJECT_*, cbSize : UInt32, lppBuffer : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.allocate_buffer.call(this, cbSize, lppBuffer)
    end
    def allocate_more(this : IWABOBJECT_*, cbSize : UInt32, lpObject : Void*, lppBuffer : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.allocate_more.call(this, cbSize, lpObject, lppBuffer)
    end
    def free_buffer(this : IWABOBJECT_*, lpBuffer : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.free_buffer.call(this, lpBuffer)
    end
    def backup(this : IWABOBJECT_*, lpFileName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.backup.call(this, lpFileName)
    end
    def import(this : IWABOBJECT_*, lpWIP : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.import.call(this, lpWIP)
    end
    def find(this : IWABOBJECT_*, lpIAB : Void*, hWnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find.call(this, lpIAB, hWnd)
    end
    def v_card_display(this : IWABOBJECT_*, lpIAB : Void*, hWnd : Win32cr::Foundation::HWND, lpszFileName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.v_card_display.call(this, lpIAB, hWnd, lpszFileName)
    end
    def ldap_url(this : IWABOBJECT_*, lpIAB : Void*, hWnd : Win32cr::Foundation::HWND, ulFlags : UInt32, lpszURL : Win32cr::Foundation::PSTR, lppMailUser : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.ldap_url.call(this, lpIAB, hWnd, ulFlags, lpszURL, lppMailUser)
    end
    def v_card_create(this : IWABOBJECT_*, lpIAB : Void*, ulFlags : UInt32, lpszVCard : Win32cr::Foundation::PSTR, lpMailUser : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.v_card_create.call(this, lpIAB, ulFlags, lpszVCard, lpMailUser)
    end
    def v_card_retrieve(this : IWABOBJECT_*, lpIAB : Void*, ulFlags : UInt32, lpszVCard : Win32cr::Foundation::PSTR, lppMailUser : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.v_card_retrieve.call(this, lpIAB, ulFlags, lpszVCard, lppMailUser)
    end
    def get_me(this : IWABOBJECT_*, lpIAB : Void*, ulFlags : UInt32, lpdwAction : UInt32*, lpsbEID : Win32cr::System::AddressBook::SBinary*, hwnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_me.call(this, lpIAB, ulFlags, lpdwAction, lpsbEID, hwnd)
    end
    def set_me(this : IWABOBJECT_*, lpIAB : Void*, ulFlags : UInt32, sbEID : Win32cr::System::AddressBook::SBinary, hwnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_me.call(this, lpIAB, ulFlags, sbEID, hwnd)
    end

  end

  @[Extern]
  record IWABExtInitVtbl,
    query_interface : Proc(IWABExtInit*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWABExtInit*, UInt32),
    release : Proc(IWABExtInit*, UInt32),
    initialize__ : Proc(IWABExtInit*, Win32cr::System::AddressBook::WABEXTDISPLAY*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("ea22ebf0-87a4-11d1-9acf-00a0c91f9c8b")]
  record IWABExtInit, lpVtbl : IWABExtInitVtbl* do
    GUID = LibC::GUID.new(0xea22ebf0_u32, 0x87a4_u16, 0x11d1_u16, StaticArray[0x9a_u8, 0xcf_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x1f_u8, 0x9c_u8, 0x8b_u8])
    def query_interface(this : IWABExtInit*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWABExtInit*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWABExtInit*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IWABExtInit*, lpWABExtDisplay : Win32cr::System::AddressBook::WABEXTDISPLAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, lpWABExtDisplay)
    end

  end

  @[Link("rtm")]
  @[Link("mapi32")]
  lib C
    fun CreateTable(lpInterface : LibC::GUID*, lpAllocateBuffer : Win32cr::System::AddressBook::LPALLOCATEBUFFER, lpAllocateMore : Win32cr::System::AddressBook::LPALLOCATEMORE, lpFreeBuffer : Win32cr::System::AddressBook::LPFREEBUFFER, lpvReserved : Void*, ulTableType : UInt32, ulPropTagIndexColumn : UInt32, lpSPropTagArrayColumns : Win32cr::System::AddressBook::SPropTagArray*, lppTableData : Void**) : Int32

    fun CreateIProp(lpInterface : LibC::GUID*, lpAllocateBuffer : Win32cr::System::AddressBook::LPALLOCATEBUFFER, lpAllocateMore : Win32cr::System::AddressBook::LPALLOCATEMORE, lpFreeBuffer : Win32cr::System::AddressBook::LPFREEBUFFER, lpvReserved : Void*, lppPropData : Void**) : Int32

    fun MAPIInitIdle(lpvReserved : Void*) : Int32

    fun MAPIDeinitIdle : Void

    fun FtgRegisterIdleRoutine(lpfnIdle : Win32cr::System::AddressBook::PFNIDLE, lpvIdleParam : Void*, priIdle : Int16, csecIdle : UInt32, iroIdle : UInt16) : Void*

    fun DeregisterIdleRoutine(ftg : Void*) : Void

    fun EnableIdleRoutine(ftg : Void*, fEnable : Win32cr::Foundation::BOOL) : Void

    fun ChangeIdleRoutine(ftg : Void*, lpfnIdle : Win32cr::System::AddressBook::PFNIDLE, lpvIdleParam : Void*, priIdle : Int16, csecIdle : UInt32, iroIdle : UInt16, ircIdle : UInt16) : Void

    fun MAPIGetDefaultMalloc : Void*

    fun OpenStreamOnFile(lpAllocateBuffer : Win32cr::System::AddressBook::LPALLOCATEBUFFER, lpFreeBuffer : Win32cr::System::AddressBook::LPFREEBUFFER, ulFlags : UInt32, lpszFileName : Int8*, lpszPrefix : Int8*, lppStream : Void**) : Win32cr::Foundation::HRESULT

    fun PropCopyMore(lpSPropValueDest : Win32cr::System::AddressBook::SPropValue*, lpSPropValueSrc : Win32cr::System::AddressBook::SPropValue*, lpfAllocMore : Win32cr::System::AddressBook::LPALLOCATEMORE, lpvObject : Void*) : Int32

    fun UlPropSize(lpSPropValue : Win32cr::System::AddressBook::SPropValue*) : UInt32

    fun FEqualNames(lpName1 : Win32cr::System::AddressBook::MAPINAMEID*, lpName2 : Win32cr::System::AddressBook::MAPINAMEID*) : Win32cr::Foundation::BOOL

    fun FPropContainsProp(lpSPropValueDst : Win32cr::System::AddressBook::SPropValue*, lpSPropValueSrc : Win32cr::System::AddressBook::SPropValue*, ulFuzzyLevel : UInt32) : Win32cr::Foundation::BOOL

    fun FPropCompareProp(lpSPropValue1 : Win32cr::System::AddressBook::SPropValue*, ulRelOp : UInt32, lpSPropValue2 : Win32cr::System::AddressBook::SPropValue*) : Win32cr::Foundation::BOOL

    fun LPropCompareProp(lpSPropValueA : Win32cr::System::AddressBook::SPropValue*, lpSPropValueB : Win32cr::System::AddressBook::SPropValue*) : Int32

    fun HrAddColumns(lptbl : Void*, lpproptagColumnsNew : Win32cr::System::AddressBook::SPropTagArray*, lpAllocateBuffer : Win32cr::System::AddressBook::LPALLOCATEBUFFER, lpFreeBuffer : Win32cr::System::AddressBook::LPFREEBUFFER) : Win32cr::Foundation::HRESULT

    fun HrAddColumnsEx(lptbl : Void*, lpproptagColumnsNew : Win32cr::System::AddressBook::SPropTagArray*, lpAllocateBuffer : Win32cr::System::AddressBook::LPALLOCATEBUFFER, lpFreeBuffer : Win32cr::System::AddressBook::LPFREEBUFFER, lpfnFilterColumns : LibC::IntPtrT) : Win32cr::Foundation::HRESULT

    fun HrAllocAdviseSink(lpfnCallback : Win32cr::System::AddressBook::LPNOTIFCALLBACK, lpvContext : Void*, lppAdviseSink : Void**) : Win32cr::Foundation::HRESULT

    fun HrThisThreadAdviseSink(lpAdviseSink : Void*, lppAdviseSink : Void**) : Win32cr::Foundation::HRESULT

    fun HrDispatchNotifications(ulFlags : UInt32) : Win32cr::Foundation::HRESULT

    fun BuildDisplayTable(lpAllocateBuffer : Win32cr::System::AddressBook::LPALLOCATEBUFFER, lpAllocateMore : Win32cr::System::AddressBook::LPALLOCATEMORE, lpFreeBuffer : Win32cr::System::AddressBook::LPFREEBUFFER, lpMalloc : Void*, hInstance : Win32cr::Foundation::HINSTANCE, cPages : UInt32, lpPage : Win32cr::System::AddressBook::DTPAGE*, ulFlags : UInt32, lppTable : Void**, lppTblData : Void**) : Win32cr::Foundation::HRESULT

    fun ScCountNotifications(cNotifications : Int32, lpNotifications : Win32cr::System::AddressBook::NOTIFICATION*, lpcb : UInt32*) : Int32

    fun ScCopyNotifications(cNotification : Int32, lpNotifications : Win32cr::System::AddressBook::NOTIFICATION*, lpvDst : Void*, lpcb : UInt32*) : Int32

    fun ScRelocNotifications(cNotification : Int32, lpNotifications : Win32cr::System::AddressBook::NOTIFICATION*, lpvBaseOld : Void*, lpvBaseNew : Void*, lpcb : UInt32*) : Int32

    fun ScCountProps(cValues : Int32, lpPropArray : Win32cr::System::AddressBook::SPropValue*, lpcb : UInt32*) : Int32

    fun LpValFindProp(ulPropTag : UInt32, cValues : UInt32, lpPropArray : Win32cr::System::AddressBook::SPropValue*) : Win32cr::System::AddressBook::SPropValue*

    fun ScCopyProps(cValues : Int32, lpPropArray : Win32cr::System::AddressBook::SPropValue*, lpvDst : Void*, lpcb : UInt32*) : Int32

    fun ScRelocProps(cValues : Int32, lpPropArray : Win32cr::System::AddressBook::SPropValue*, lpvBaseOld : Void*, lpvBaseNew : Void*, lpcb : UInt32*) : Int32

    fun ScDupPropset(cValues : Int32, lpPropArray : Win32cr::System::AddressBook::SPropValue*, lpAllocateBuffer : Win32cr::System::AddressBook::LPALLOCATEBUFFER, lppPropArray : Win32cr::System::AddressBook::SPropValue**) : Int32

    fun UlAddRef(lpunk : Void*) : UInt32

    fun UlRelease(lpunk : Void*) : UInt32

    fun HrGetOneProp(lpMapiProp : Void*, ulPropTag : UInt32, lppProp : Win32cr::System::AddressBook::SPropValue**) : Win32cr::Foundation::HRESULT

    fun HrSetOneProp(lpMapiProp : Void*, lpProp : Win32cr::System::AddressBook::SPropValue*) : Win32cr::Foundation::HRESULT

    fun FPropExists(lpMapiProp : Void*, ulPropTag : UInt32) : Win32cr::Foundation::BOOL

    fun PpropFindProp(lpPropArray : Win32cr::System::AddressBook::SPropValue*, cValues : UInt32, ulPropTag : UInt32) : Win32cr::System::AddressBook::SPropValue*

    fun FreePadrlist(lpAdrlist : Win32cr::System::AddressBook::ADRLIST*) : Void

    fun FreeProws(lpRows : Win32cr::System::AddressBook::SRowSet*) : Void

    fun HrQueryAllRows(lpTable : Void*, lpPropTags : Win32cr::System::AddressBook::SPropTagArray*, lpRestriction : Win32cr::System::AddressBook::SRestriction*, lpSortOrderSet : Win32cr::System::AddressBook::SSortOrderSet*, crowsMax : Int32, lppRows : Win32cr::System::AddressBook::SRowSet**) : Win32cr::Foundation::HRESULT

    fun SzFindCh(lpsz : Int8*, ch : UInt16) : Int8*

    fun SzFindLastCh(lpsz : Int8*, ch : UInt16) : Int8*

    fun SzFindSz(lpsz : Int8*, lpszKey : Int8*) : Int8*

    fun UFromSz(lpsz : Int8*) : UInt32

    fun ScUNCFromLocalPath(lpszLocal : Win32cr::Foundation::PSTR, lpszUNC : UInt8*, cchUNC : UInt32) : Int32

    fun ScLocalPathFromUNC(lpszUNC : Win32cr::Foundation::PSTR, lpszLocal : UInt8*, cchLocal : UInt32) : Int32

    fun FtAddFt(ftAddend1 : Win32cr::Foundation::FILETIME, ftAddend2 : Win32cr::Foundation::FILETIME) : Win32cr::Foundation::FILETIME

    fun FtMulDwDw(ftMultiplicand : UInt32, ftMultiplier : UInt32) : Win32cr::Foundation::FILETIME

    fun FtMulDw(ftMultiplier : UInt32, ftMultiplicand : Win32cr::Foundation::FILETIME) : Win32cr::Foundation::FILETIME

    fun FtSubFt(ftMinuend : Win32cr::Foundation::FILETIME, ftSubtrahend : Win32cr::Foundation::FILETIME) : Win32cr::Foundation::FILETIME

    fun FtNegFt(ft : Win32cr::Foundation::FILETIME) : Win32cr::Foundation::FILETIME

    fun ScCreateConversationIndex(cbParent : UInt32, lpbParent : UInt8*, lpcbConvIndex : UInt32*, lppbConvIndex : UInt8**) : Int32

    fun WrapStoreEntryID(ulFlags : UInt32, lpszDLLName : Int8*, cbOrigEntry : UInt32, lpOrigEntry : Win32cr::System::AddressBook::ENTRYID*, lpcbWrappedEntry : UInt32*, lppWrappedEntry : Win32cr::System::AddressBook::ENTRYID**) : Win32cr::Foundation::HRESULT

    fun RTFSync(lpMessage : Void*, ulFlags : UInt32, lpfMessageUpdated : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    fun WrapCompressedRTFStream(lpCompressedRTFStream : Void*, ulFlags : UInt32, lpUncompressedRTFStream : Void**) : Win32cr::Foundation::HRESULT

    fun HrIStorageFromStream(lpUnkIn : Void*, lpInterface : LibC::GUID*, ulFlags : UInt32, lppStorageOut : Void**) : Win32cr::Foundation::HRESULT

    fun ScInitMapiUtil(ulFlags : UInt32) : Int32

    fun DeinitMapiUtil : Void

  end
end