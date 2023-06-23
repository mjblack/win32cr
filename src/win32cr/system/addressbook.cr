require "../foundation.cr"
require "../system/com.cr"
require "../system/com/structuredstorage.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:rtm.dll")]
@[Link(ldflags: "/DELAYLOAD:mapi32.dll")]
{% else %}
@[Link("rtm")]
@[Link("mapi32")]
{% end %}
lib LibWin32
  PROP_ID_SECURE_MIN = 26608_u32
  PROP_ID_SECURE_MAX = 26623_u32
  MAPI_DIM = 1_u32
  MAPI_P1 = 268435456_u32
  MAPI_SUBMITTED = 2147483648_u32
  MAPI_SHORTTERM = 128_u32
  MAPI_NOTRECIP = 64_u32
  MAPI_THISSESSION = 32_u32
  MAPI_NOW = 16_u32
  MAPI_NOTRESERVED = 8_u32
  MAPI_COMPOUND = 128_u32
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

  type WABACTIONITEM = Void

  alias LPALLOCATEBUFFER = Proc(UInt32, Void**, Int32)
  alias LPALLOCATEMORE = Proc(UInt32, Void*, Void**, Int32)
  alias LPFREEBUFFER = Proc(Void*, UInt32)
  alias LPNOTIFCALLBACK = Proc(Void*, UInt32, NOTIFICATION*, Int32)
  alias LPFNABSDI = Proc(LibC::UINT_PTR, Void*, LibC::BOOL)
  alias LPFNDISMISS = Proc(LibC::UINT_PTR, Void*, Void)
  alias LPFNBUTTON = Proc(LibC::UINT_PTR, Void*, UInt32, ENTRYID*, UInt32, Int32)
  alias CALLERRELEASE = Proc(UInt32, ITableData, IMAPITable, Void)
  alias FNIDLE = Proc(Void*, LibC::BOOL)
  alias PFNIDLE = Proc(LibC::BOOL)
  alias LPOPENSTREAMONFILE = Proc(LPALLOCATEBUFFER, LPFREEBUFFER, UInt32, Int8*, Int8*, IStream*, HRESULT)
  alias LPDISPATCHNOTIFICATIONS = Proc(UInt32, HRESULT)
  alias LPCREATECONVERSATIONINDEX = Proc(UInt32, UInt8*, UInt32*, UInt8**, Int32)
  alias IWABOBJECT_QueryInterface_METHOD = Proc(Guid*, Void**, HRESULT)
  alias IWABOBJECT_AddRef_METHOD = Proc(UInt32)
  alias IWABOBJECT_Release_METHOD = Proc(UInt32)
  alias IWABOBJECT_GetLastError_METHOD = Proc(HRESULT, UInt32, MAPIERROR**, HRESULT)
  alias IWABOBJECT_AllocateBuffer_METHOD = Proc(UInt32, Void**, HRESULT)
  alias IWABOBJECT_AllocateMore_METHOD = Proc(UInt32, Void*, Void**, HRESULT)
  alias IWABOBJECT_FreeBuffer_METHOD = Proc(Void*, HRESULT)
  alias IWABOBJECT_Backup_METHOD = Proc(PSTR, HRESULT)
  alias IWABOBJECT_Import_METHOD = Proc(PSTR, HRESULT)
  alias IWABOBJECT_Find_METHOD = Proc(IAddrBook, LibC::HANDLE, HRESULT)
  alias IWABOBJECT_VCardDisplay_METHOD = Proc(IAddrBook, LibC::HANDLE, PSTR, HRESULT)
  alias IWABOBJECT_LDAPUrl_METHOD = Proc(IAddrBook, LibC::HANDLE, UInt32, PSTR, IMailUser*, HRESULT)
  alias IWABOBJECT_VCardCreate_METHOD = Proc(IAddrBook, UInt32, PSTR, IMailUser, HRESULT)
  alias IWABOBJECT_VCardRetrieve_METHOD = Proc(IAddrBook, UInt32, PSTR, IMailUser*, HRESULT)
  alias IWABOBJECT_GetMe_METHOD = Proc(IAddrBook, UInt32, UInt32*, SBinary*, LibC::HANDLE, HRESULT)
  alias IWABOBJECT_SetMe_METHOD = Proc(IAddrBook, UInt32, SBinary, LibC::HANDLE, HRESULT)
  alias LPWABOPEN = Proc(IAddrBook*, IWABObject*, WAB_PARAM*, UInt32, HRESULT)
  alias LPWABOPENEX = Proc(IAddrBook*, IWABObject*, WAB_PARAM*, UInt32, LPALLOCATEBUFFER, LPALLOCATEMORE, LPFREEBUFFER, HRESULT)
  alias LPWABALLOCATEBUFFER = Proc(IWABObject, UInt32, Void**, Int32)
  alias LPWABALLOCATEMORE = Proc(IWABObject, UInt32, Void*, Void**, Int32)
  alias LPWABFREEBUFFER = Proc(IWABObject, Void*, UInt32)


  enum Gender : Int32
    Genderunspecified = 0
    Genderfemale = 1
    Gendermale = 2
  end

  union PV
    i : Int16
    l : Int32
    ul : UInt32
    flt : Float32
    dbl : Float64
    b : UInt16
    cur : CY
    at : Float64
    ft : FILETIME
    lpsz_a : PSTR
    bin : SBinary
    lpsz_w : LibC::LPWSTR
    lpguid : Guid*
    li : LARGE_INTEGER
    m_vi : SShortArray
    m_vl : SLongArray
    m_vflt : SRealArray
    m_vdbl : SDoubleArray
    m_vcur : SCurrencyArray
    m_vat : SAppTimeArray
    m_vft : SDateTimeArray
    m_vbin : SBinaryArray
    m_vsz_a : SLPSTRArray
    m_vsz_w : SWStringArray
    m_vguid : SGuidArray
    m_vli : SLargeIntegerArray
    err : Int32
    x : Int32
  end
  union NOTIFICATION_info_e__Union
    err : ERROR_NOTIFICATION
    newmail : NEWMAIL_NOTIFICATION
    obj : OBJECT_NOTIFICATION
    tab : TABLE_NOTIFICATION
    ext : EXTENDED_NOTIFICATION
    statobj : STATUS_OBJECT_NOTIFICATION
  end
  union MAPINAMEID_Kind_e__Union
    l_id : Int32
    lpwstr_name : LibC::LPWSTR
  end
  union SRestriction_res_e__Union
    res_compare_props : SComparePropsRestriction
    res_and : SAndRestriction
    res_or : SOrRestriction
    res_not : SNotRestriction
    res_content : SContentRestriction
    res_property : SPropertyRestriction
    res_bit_mask : SBitMaskRestriction
    res_size : SSizeRestriction
    res_exist : SExistRestriction
    res_sub : SSubRestriction
    res_comment : SCommentRestriction
  end
  union DTCTL_ctl_e__Union
    lpv : Void*
    lplabel : DTBLLABEL*
    lpedit : DTBLEDIT*
    lplbx : DTBLLBX*
    lpcombobox : DTBLCOMBOBOX*
    lpddlbx : DTBLDDLBX*
    lpcheckbox : DTBLCHECKBOX*
    lpgroupbox : DTBLGROUPBOX*
    lpbutton : DTBLBUTTON*
    lpradiobutton : DTBLRADIOBUTTON*
    lpmvlbx : DTBLMVLISTBOX*
    lpmvddlbx : DTBLMVDDLBX*
    lppage : DTBLPAGE*
  end
  union DTPAGE_Anonymous_e__Union
    lpsz_component : Int8*
    ul_item_id : UInt32
  end

  struct ENTRYID
    ab_flags : UInt8[4]*
    ab : UInt8[0]*
  end
  struct MAPIUID
    ab : UInt8[16]*
  end
  struct SPropTagArray
    c_values : UInt32
    aul_prop_tag : UInt32[0]*
  end
  struct SBinary
    cb : UInt32
    lpb : UInt8*
  end
  struct SShortArray
    c_values : UInt32
    lpi : Int16*
  end
  struct SGuidArray
    c_values : UInt32
    lpguid : Guid*
  end
  struct SRealArray
    c_values : UInt32
    lpflt : Float32*
  end
  struct SLongArray
    c_values : UInt32
    lpl : Int32*
  end
  struct SLargeIntegerArray
    c_values : UInt32
    lpli : LARGE_INTEGER*
  end
  struct SDateTimeArray
    c_values : UInt32
    lpft : FILETIME*
  end
  struct SAppTimeArray
    c_values : UInt32
    lpat : Float64*
  end
  struct SCurrencyArray
    c_values : UInt32
    lpcur : CY*
  end
  struct SBinaryArray
    c_values : UInt32
    lpbin : SBinary*
  end
  struct SDoubleArray
    c_values : UInt32
    lpdbl : Float64*
  end
  struct SWStringArray
    c_values : UInt32
    lppsz_w : LibC::LPWSTR*
  end
  struct SLPSTRArray
    c_values : UInt32
    lppsz_a : PSTR*
  end
  struct SPropValue
    ul_prop_tag : UInt32
    dw_align_pad : UInt32
    value : PV
  end
  struct SPropProblem
    ul_index : UInt32
    ul_prop_tag : UInt32
    scode : Int32
  end
  struct SPropProblemArray
    c_problem : UInt32
    a_problem : SPropProblem[0]*
  end
  struct FLATENTRY
    cb : UInt32
    ab_entry : UInt8[0]*
  end
  struct FLATENTRYLIST
    c_entries : UInt32
    cb_entries : UInt32
    ab_entries : UInt8[0]*
  end
  struct MTSID
    cb : UInt32
    ab : UInt8[0]*
  end
  struct FLATMTSIDLIST
    c_mtsi_ds : UInt32
    cb_mtsi_ds : UInt32
    ab_mtsi_ds : UInt8[0]*
  end
  struct ADRENTRY
    ul_reserved1 : UInt32
    c_values : UInt32
    rg_prop_vals : SPropValue*
  end
  struct ADRLIST
    c_entries : UInt32
    a_entries : ADRENTRY[0]*
  end
  struct SRow
    ul_adr_entry_pad : UInt32
    c_values : UInt32
    lp_props : SPropValue*
  end
  struct SRowSet
    c_rows : UInt32
    a_row : SRow[0]*
  end
  struct MAPIERROR
    ul_version : UInt32
    lpsz_error : Int8*
    lpsz_component : Int8*
    ul_low_level_error : UInt32
    ul_context : UInt32
  end
  struct ERROR_NOTIFICATION
    cb_entry_id : UInt32
    lp_entry_id : ENTRYID*
    scode : Int32
    ul_flags : UInt32
    lp_mapi_error : MAPIERROR*
  end
  struct NEWMAIL_NOTIFICATION
    cb_entry_id : UInt32
    lp_entry_id : ENTRYID*
    cb_parent_id : UInt32
    lp_parent_id : ENTRYID*
    ul_flags : UInt32
    lpsz_message_class : Int8*
    ul_message_flags : UInt32
  end
  struct OBJECT_NOTIFICATION
    cb_entry_id : UInt32
    lp_entry_id : ENTRYID*
    ul_obj_type : UInt32
    cb_parent_id : UInt32
    lp_parent_id : ENTRYID*
    cb_old_id : UInt32
    lp_old_id : ENTRYID*
    cb_old_parent_id : UInt32
    lp_old_parent_id : ENTRYID*
    lp_prop_tag_array : SPropTagArray*
  end
  struct TABLE_NOTIFICATION
    ul_table_event : UInt32
    h_result : HRESULT
    prop_index : SPropValue
    prop_prior : SPropValue
    row : SRow
    ul_pad : UInt32
  end
  struct EXTENDED_NOTIFICATION
    ul_event : UInt32
    cb : UInt32
    pb_event_parameters : UInt8*
  end
  struct STATUS_OBJECT_NOTIFICATION
    cb_entry_id : UInt32
    lp_entry_id : ENTRYID*
    c_values : UInt32
    lp_prop_vals : SPropValue*
  end
  struct NOTIFICATION
    ul_event_type : UInt32
    ul_align_pad : UInt32
    info : NOTIFICATION_info_e__Union
  end
  struct MAPINAMEID
    lpguid : Guid*
    ul_kind : UInt32
    kind : MAPINAMEID_Kind_e__Union
  end
  struct SSortOrder
    ul_prop_tag : UInt32
    ul_order : UInt32
  end
  struct SSortOrderSet
    c_sorts : UInt32
    c_categories : UInt32
    c_expanded : UInt32
    a_sort : SSortOrder[0]*
  end
  struct SAndRestriction
    c_res : UInt32
    lp_res : SRestriction*
  end
  struct SOrRestriction
    c_res : UInt32
    lp_res : SRestriction*
  end
  struct SNotRestriction
    ul_reserved : UInt32
    lp_res : SRestriction*
  end
  struct SContentRestriction
    ul_fuzzy_level : UInt32
    ul_prop_tag : UInt32
    lp_prop : SPropValue*
  end
  struct SBitMaskRestriction
    rel_bmr : UInt32
    ul_prop_tag : UInt32
    ul_mask : UInt32
  end
  struct SPropertyRestriction
    relop : UInt32
    ul_prop_tag : UInt32
    lp_prop : SPropValue*
  end
  struct SComparePropsRestriction
    relop : UInt32
    ul_prop_tag1 : UInt32
    ul_prop_tag2 : UInt32
  end
  struct SSizeRestriction
    relop : UInt32
    ul_prop_tag : UInt32
    cb : UInt32
  end
  struct SExistRestriction
    ul_reserved1 : UInt32
    ul_prop_tag : UInt32
    ul_reserved2 : UInt32
  end
  struct SSubRestriction
    ul_sub_object : UInt32
    lp_res : SRestriction*
  end
  struct SCommentRestriction
    c_values : UInt32
    lp_res : SRestriction*
    lp_prop : SPropValue*
  end
  struct SRestriction
    rt : UInt32
    res : SRestriction_res_e__Union
  end
  struct Flaglist
    c_flags : UInt32
    ul_flag : UInt32[0]*
  end
  struct ADRPARM
    cb_ab_cont_entry_id : UInt32
    lp_ab_cont_entry_id : ENTRYID*
    ul_flags : UInt32
    lp_reserved : Void*
    ul_help_context : UInt32
    lpsz_help_file_name : Int8*
    lpfn_absdi : LPFNABSDI
    lpfn_dismiss : LPFNDISMISS
    lpv_dismiss_context : Void*
    lpsz_caption : Int8*
    lpsz_new_entry_title : Int8*
    lpsz_dest_wells_title : Int8*
    c_dest_fields : UInt32
    n_dest_field_focus : UInt32
    lppsz_dest_titles : Int8**
    lpul_dest_comps : UInt32*
    lp_cont_restriction : SRestriction*
    lp_hier_restriction : SRestriction*
  end
  struct DTBLLABEL
    ulb_lpsz_label_name : UInt32
    ul_flags : UInt32
  end
  struct DTBLEDIT
    ulb_lpsz_chars_allowed : UInt32
    ul_flags : UInt32
    ul_num_chars_allowed : UInt32
    ul_prop_tag : UInt32
  end
  struct DTBLLBX
    ul_flags : UInt32
    ul_pr_set_property : UInt32
    ul_pr_table_name : UInt32
  end
  struct DTBLCOMBOBOX
    ulb_lpsz_chars_allowed : UInt32
    ul_flags : UInt32
    ul_num_chars_allowed : UInt32
    ul_pr_property_name : UInt32
    ul_pr_table_name : UInt32
  end
  struct DTBLDDLBX
    ul_flags : UInt32
    ul_pr_display_property : UInt32
    ul_pr_set_property : UInt32
    ul_pr_table_name : UInt32
  end
  struct DTBLCHECKBOX
    ulb_lpsz_label : UInt32
    ul_flags : UInt32
    ul_pr_property_name : UInt32
  end
  struct DTBLGROUPBOX
    ulb_lpsz_label : UInt32
    ul_flags : UInt32
  end
  struct DTBLBUTTON
    ulb_lpsz_label : UInt32
    ul_flags : UInt32
    ul_pr_control : UInt32
  end
  struct DTBLPAGE
    ulb_lpsz_label : UInt32
    ul_flags : UInt32
    ulb_lpsz_component : UInt32
    ul_context : UInt32
  end
  struct DTBLRADIOBUTTON
    ulb_lpsz_label : UInt32
    ul_flags : UInt32
    ulc_buttons : UInt32
    ul_prop_tag : UInt32
    l_return_value : Int32
  end
  struct DTBLMVLISTBOX
    ul_flags : UInt32
    ul_mv_prop_tag : UInt32
  end
  struct DTBLMVDDLBX
    ul_flags : UInt32
    ul_mv_prop_tag : UInt32
  end
  struct DTCTL
    ul_ctl_type : UInt32
    ul_ctl_flags : UInt32
    lpb_notif : UInt8*
    cb_notif : UInt32
    lpsz_filter : Int8*
    ul_item_id : UInt32
    ctl : DTCTL_ctl_e__Union
  end
  struct DTPAGE
    cctl : UInt32
    lpsz_resource_name : Int8*
    anonymous : DTPAGE_Anonymous_e__Union
    lpctl : DTCTL*
  end
  struct WAB_PARAM
    cb_size : UInt32
    hwnd : HANDLE
    sz_file_name : PSTR
    ul_flags : UInt32
    guid_ps_ext : Guid
  end
  struct WABIMPORTPARAM
    cb_size : UInt32
    lp_adr_book : IAddrBook
    h_wnd : HANDLE
    ul_flags : UInt32
    lpsz_file_name : PSTR
  end
  struct WABEXTDISPLAY
    cb_size : UInt32
    lp_wab_object : IWABObject
    lp_adr_book : IAddrBook
    lp_prop_obj : IMAPIProp
    f_read_only : LibC::BOOL
    f_data_changed : LibC::BOOL
    ul_flags : UInt32
    lpv : Void*
    lpsz : Int8*
  end
  struct NOTIFKEY
    cb : UInt32
    ab : UInt8[0]*
  end


  struct IMAPIAdviseSinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_notify : UInt64
  end

  struct IMAPIAdviseSink
    lpVtbl : IMAPIAdviseSinkVTbl*
  end

  struct IMAPIProgressVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    progress : UInt64
    get_flags : UInt64
    get_max : UInt64
    get_min : UInt64
    set_limits : UInt64
  end

  struct IMAPIProgress
    lpVtbl : IMAPIProgressVTbl*
  end

  struct IMAPIPropVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_last_error : UInt64
    save_changes : UInt64
    get_props : UInt64
    get_prop_list : UInt64
    open_property : UInt64
    set_props : UInt64
    delete_props : UInt64
    copy_to : UInt64
    copy_props : UInt64
    get_names_from_i_ds : UInt64
    get_i_ds_from_names : UInt64
  end

  struct IMAPIProp
    lpVtbl : IMAPIPropVTbl*
  end

  struct IMAPITableVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_last_error : UInt64
    advise : UInt64
    unadvise : UInt64
    get_status : UInt64
    set_columns : UInt64
    query_columns : UInt64
    get_row_count : UInt64
    seek_row : UInt64
    seek_row_approx : UInt64
    query_position : UInt64
    find_row : UInt64
    restrict : UInt64
    create_bookmark : UInt64
    free_bookmark : UInt64
    sort_table : UInt64
    query_sort_order : UInt64
    query_rows : UInt64
    abort : UInt64
    expand_row : UInt64
    collapse_row : UInt64
    wait_for_completion : UInt64
    get_collapse_state : UInt64
    set_collapse_state : UInt64
  end

  struct IMAPITable
    lpVtbl : IMAPITableVTbl*
  end

  struct IProfSectVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_last_error : UInt64
    save_changes : UInt64
    get_props : UInt64
    get_prop_list : UInt64
    open_property : UInt64
    set_props : UInt64
    delete_props : UInt64
    copy_to : UInt64
    copy_props : UInt64
    get_names_from_i_ds : UInt64
    get_i_ds_from_names : UInt64
  end

  struct IProfSect
    lpVtbl : IProfSectVTbl*
  end

  struct IMAPIStatusVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_last_error : UInt64
    save_changes : UInt64
    get_props : UInt64
    get_prop_list : UInt64
    open_property : UInt64
    set_props : UInt64
    delete_props : UInt64
    copy_to : UInt64
    copy_props : UInt64
    get_names_from_i_ds : UInt64
    get_i_ds_from_names : UInt64
    validate_state : UInt64
    settings_dialog : UInt64
    change_password : UInt64
    flush_queues : UInt64
  end

  struct IMAPIStatus
    lpVtbl : IMAPIStatusVTbl*
  end

  struct IMAPIContainerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_last_error : UInt64
    save_changes : UInt64
    get_props : UInt64
    get_prop_list : UInt64
    open_property : UInt64
    set_props : UInt64
    delete_props : UInt64
    copy_to : UInt64
    copy_props : UInt64
    get_names_from_i_ds : UInt64
    get_i_ds_from_names : UInt64
    get_contents_table : UInt64
    get_hierarchy_table : UInt64
    open_entry : UInt64
    set_search_criteria : UInt64
    get_search_criteria : UInt64
  end

  struct IMAPIContainer
    lpVtbl : IMAPIContainerVTbl*
  end

  struct IABContainerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_last_error : UInt64
    save_changes : UInt64
    get_props : UInt64
    get_prop_list : UInt64
    open_property : UInt64
    set_props : UInt64
    delete_props : UInt64
    copy_to : UInt64
    copy_props : UInt64
    get_names_from_i_ds : UInt64
    get_i_ds_from_names : UInt64
    get_contents_table : UInt64
    get_hierarchy_table : UInt64
    open_entry : UInt64
    set_search_criteria : UInt64
    get_search_criteria : UInt64
    create_entry : UInt64
    copy_entries : UInt64
    delete_entries : UInt64
    resolve_names : UInt64
  end

  struct IABContainer
    lpVtbl : IABContainerVTbl*
  end

  struct IMailUserVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_last_error : UInt64
    save_changes : UInt64
    get_props : UInt64
    get_prop_list : UInt64
    open_property : UInt64
    set_props : UInt64
    delete_props : UInt64
    copy_to : UInt64
    copy_props : UInt64
    get_names_from_i_ds : UInt64
    get_i_ds_from_names : UInt64
  end

  struct IMailUser
    lpVtbl : IMailUserVTbl*
  end

  struct IDistListVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_last_error : UInt64
    save_changes : UInt64
    get_props : UInt64
    get_prop_list : UInt64
    open_property : UInt64
    set_props : UInt64
    delete_props : UInt64
    copy_to : UInt64
    copy_props : UInt64
    get_names_from_i_ds : UInt64
    get_i_ds_from_names : UInt64
    get_contents_table : UInt64
    get_hierarchy_table : UInt64
    open_entry : UInt64
    set_search_criteria : UInt64
    get_search_criteria : UInt64
    create_entry : UInt64
    copy_entries : UInt64
    delete_entries : UInt64
    resolve_names : UInt64
  end

  struct IDistList
    lpVtbl : IDistListVTbl*
  end

  struct IMAPIFolderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_last_error : UInt64
    save_changes : UInt64
    get_props : UInt64
    get_prop_list : UInt64
    open_property : UInt64
    set_props : UInt64
    delete_props : UInt64
    copy_to : UInt64
    copy_props : UInt64
    get_names_from_i_ds : UInt64
    get_i_ds_from_names : UInt64
    get_contents_table : UInt64
    get_hierarchy_table : UInt64
    open_entry : UInt64
    set_search_criteria : UInt64
    get_search_criteria : UInt64
    create_message : UInt64
    copy_messages : UInt64
    delete_messages : UInt64
    create_folder : UInt64
    copy_folder : UInt64
    delete_folder : UInt64
    set_read_flags : UInt64
    get_message_status : UInt64
    set_message_status : UInt64
    save_contents_sort : UInt64
    empty_folder : UInt64
  end

  struct IMAPIFolder
    lpVtbl : IMAPIFolderVTbl*
  end

  struct IMsgStoreVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_last_error : UInt64
    save_changes : UInt64
    get_props : UInt64
    get_prop_list : UInt64
    open_property : UInt64
    set_props : UInt64
    delete_props : UInt64
    copy_to : UInt64
    copy_props : UInt64
    get_names_from_i_ds : UInt64
    get_i_ds_from_names : UInt64
    advise : UInt64
    unadvise : UInt64
    compare_entry_i_ds : UInt64
    open_entry : UInt64
    set_receive_folder : UInt64
    get_receive_folder : UInt64
    get_receive_folder_table : UInt64
    store_logoff : UInt64
    abort_submit : UInt64
    get_outgoing_queue : UInt64
    set_lock_state : UInt64
    finished_msg : UInt64
    notify_new_mail : UInt64
  end

  struct IMsgStore
    lpVtbl : IMsgStoreVTbl*
  end

  struct IMessageVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_last_error : UInt64
    save_changes : UInt64
    get_props : UInt64
    get_prop_list : UInt64
    open_property : UInt64
    set_props : UInt64
    delete_props : UInt64
    copy_to : UInt64
    copy_props : UInt64
    get_names_from_i_ds : UInt64
    get_i_ds_from_names : UInt64
    get_attachment_table : UInt64
    open_attach : UInt64
    create_attach : UInt64
    delete_attach : UInt64
    get_recipient_table : UInt64
    modify_recipients : UInt64
    submit_message : UInt64
    set_read_flag : UInt64
  end

  struct IMessage
    lpVtbl : IMessageVTbl*
  end

  struct IAttachVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_last_error : UInt64
    save_changes : UInt64
    get_props : UInt64
    get_prop_list : UInt64
    open_property : UInt64
    set_props : UInt64
    delete_props : UInt64
    copy_to : UInt64
    copy_props : UInt64
    get_names_from_i_ds : UInt64
    get_i_ds_from_names : UInt64
  end

  struct IAttach
    lpVtbl : IAttachVTbl*
  end

  struct IMAPIControlVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_last_error : UInt64
    activate : UInt64
    get_state : UInt64
  end

  struct IMAPIControl
    lpVtbl : IMAPIControlVTbl*
  end

  struct IProviderAdminVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_last_error : UInt64
    get_provider_table : UInt64
    create_provider : UInt64
    delete_provider : UInt64
    open_profile_section : UInt64
  end

  struct IProviderAdmin
    lpVtbl : IProviderAdminVTbl*
  end

  struct ITableDataVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    hr_get_view : UInt64
    hr_modify_row : UInt64
    hr_delete_row : UInt64
    hr_query_row : UInt64
    hr_enum_row : UInt64
    hr_notify : UInt64
    hr_insert_row : UInt64
    hr_modify_rows : UInt64
    hr_delete_rows : UInt64
  end

  struct ITableData
    lpVtbl : ITableDataVTbl*
  end

  struct IPropDataVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_last_error : UInt64
    save_changes : UInt64
    get_props : UInt64
    get_prop_list : UInt64
    open_property : UInt64
    set_props : UInt64
    delete_props : UInt64
    copy_to : UInt64
    copy_props : UInt64
    get_names_from_i_ds : UInt64
    get_i_ds_from_names : UInt64
    hr_set_obj_access : UInt64
    hr_set_prop_access : UInt64
    hr_get_prop_access : UInt64
    hr_add_obj_props : UInt64
  end

  struct IPropData
    lpVtbl : IPropDataVTbl*
  end

  struct IAddrBookVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_last_error : UInt64
    save_changes : UInt64
    get_props : UInt64
    get_prop_list : UInt64
    open_property : UInt64
    set_props : UInt64
    delete_props : UInt64
    copy_to : UInt64
    copy_props : UInt64
    get_names_from_i_ds : UInt64
    get_i_ds_from_names : UInt64
    open_entry : UInt64
    compare_entry_i_ds : UInt64
    advise : UInt64
    unadvise : UInt64
    create_one_off : UInt64
    new_entry : UInt64
    resolve_name : UInt64
    address : UInt64
    details : UInt64
    recip_options : UInt64
    query_default_recip_opt : UInt64
    get_pab : UInt64
    set_pab : UInt64
    get_default_dir : UInt64
    set_default_dir : UInt64
    get_search_path : UInt64
    set_search_path : UInt64
    prepare_recips : UInt64
  end

  struct IAddrBook
    lpVtbl : IAddrBookVTbl*
  end

  struct IWABObjectVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_last_error : UInt64
    allocate_buffer : UInt64
    allocate_more : UInt64
    free_buffer : UInt64
    backup : UInt64
    import : UInt64
    find : UInt64
    v_card_display : UInt64
    ldap_url : UInt64
    v_card_create : UInt64
    v_card_retrieve : UInt64
    get_me : UInt64
    set_me : UInt64
  end

  struct IWABObject
    lpVtbl : IWABObjectVTbl*
  end

  struct IWABOBJECT_VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_last_error : UInt64
    allocate_buffer : UInt64
    allocate_more : UInt64
    free_buffer : UInt64
    backup : UInt64
    import : UInt64
    find : UInt64
    v_card_display : UInt64
    ldap_url : UInt64
    v_card_create : UInt64
    v_card_retrieve : UInt64
    get_me : UInt64
    set_me : UInt64
  end

  struct IWABOBJECT_
    lpVtbl : IWABOBJECT_VTbl*
  end

  struct IWABExtInitVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initialize : UInt64
  end

  IWABExtInit_GUID = "ea22ebf0-87a4-11d1-9acf-00a0c91f9c8b"
  IID_IWABExtInit = LibC::GUID.new(0xea22ebf0_u32, 0x87a4_u16, 0x11d1_u16, StaticArray[0x9a_u8, 0xcf_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x1f_u8, 0x9c_u8, 0x8b_u8])
  struct IWABExtInit
    lpVtbl : IWABExtInitVTbl*
  end


  # Params # lpinterface : Guid* [In],lpallocatebuffer : LPALLOCATEBUFFER [In],lpallocatemore : LPALLOCATEMORE [In],lpfreebuffer : LPFREEBUFFER [In],lpvreserved : Void* [In],ultabletype : UInt32 [In],ulproptagindexcolumn : UInt32 [In],lpsproptagarraycolumns : SPropTagArray* [In],lpptabledata : ITableData* [In]
  fun CreateTable(lpinterface : Guid*, lpallocatebuffer : LPALLOCATEBUFFER, lpallocatemore : LPALLOCATEMORE, lpfreebuffer : LPFREEBUFFER, lpvreserved : Void*, ultabletype : UInt32, ulproptagindexcolumn : UInt32, lpsproptagarraycolumns : SPropTagArray*, lpptabledata : ITableData*) : Int32

  # Params # lpinterface : Guid* [In],lpallocatebuffer : LPALLOCATEBUFFER [In],lpallocatemore : LPALLOCATEMORE [In],lpfreebuffer : LPFREEBUFFER [In],lpvreserved : Void* [In],lpppropdata : IPropData* [In]
  fun CreateIProp(lpinterface : Guid*, lpallocatebuffer : LPALLOCATEBUFFER, lpallocatemore : LPALLOCATEMORE, lpfreebuffer : LPFREEBUFFER, lpvreserved : Void*, lpppropdata : IPropData*) : Int32

  # Params # lpvreserved : Void* [In]
  fun MAPIInitIdle(lpvreserved : Void*) : Int32

  # Params # 
  fun MAPIDeinitIdle : Void

  # Params # lpfnidle : PFNIDLE [In],lpvidleparam : Void* [In],priidle : Int16 [In],csecidle : UInt32 [In],iroidle : UInt16 [In]
  fun FtgRegisterIdleRoutine(lpfnidle : PFNIDLE, lpvidleparam : Void*, priidle : Int16, csecidle : UInt32, iroidle : UInt16) : Void*

  # Params # ftg : Void* [In]
  fun DeregisterIdleRoutine(ftg : Void*) : Void

  # Params # ftg : Void* [In],fenable : LibC::BOOL [In]
  fun EnableIdleRoutine(ftg : Void*, fenable : LibC::BOOL) : Void

  # Params # ftg : Void* [In],lpfnidle : PFNIDLE [In],lpvidleparam : Void* [In],priidle : Int16 [In],csecidle : UInt32 [In],iroidle : UInt16 [In],ircidle : UInt16 [In]
  fun ChangeIdleRoutine(ftg : Void*, lpfnidle : PFNIDLE, lpvidleparam : Void*, priidle : Int16, csecidle : UInt32, iroidle : UInt16, ircidle : UInt16) : Void

  # Params # 
  fun MAPIGetDefaultMalloc : IMalloc

  # Params # lpallocatebuffer : LPALLOCATEBUFFER [In],lpfreebuffer : LPFREEBUFFER [In],ulflags : UInt32 [In],lpszfilename : Int8* [In],lpszprefix : Int8* [In],lppstream : IStream* [In]
  fun OpenStreamOnFile(lpallocatebuffer : LPALLOCATEBUFFER, lpfreebuffer : LPFREEBUFFER, ulflags : UInt32, lpszfilename : Int8*, lpszprefix : Int8*, lppstream : IStream*) : HRESULT

  # Params # lpspropvaluedest : SPropValue* [In],lpspropvaluesrc : SPropValue* [In],lpfallocmore : LPALLOCATEMORE [In],lpvobject : Void* [In]
  fun PropCopyMore(lpspropvaluedest : SPropValue*, lpspropvaluesrc : SPropValue*, lpfallocmore : LPALLOCATEMORE, lpvobject : Void*) : Int32

  # Params # lpspropvalue : SPropValue* [In]
  fun UlPropSize(lpspropvalue : SPropValue*) : UInt32

  # Params # lpname1 : MAPINAMEID* [In],lpname2 : MAPINAMEID* [In]
  fun FEqualNames(lpname1 : MAPINAMEID*, lpname2 : MAPINAMEID*) : LibC::BOOL

  # Params # lpspropvaluedst : SPropValue* [In],lpspropvaluesrc : SPropValue* [In],ulfuzzylevel : UInt32 [In]
  fun FPropContainsProp(lpspropvaluedst : SPropValue*, lpspropvaluesrc : SPropValue*, ulfuzzylevel : UInt32) : LibC::BOOL

  # Params # lpspropvalue1 : SPropValue* [In],ulrelop : UInt32 [In],lpspropvalue2 : SPropValue* [In]
  fun FPropCompareProp(lpspropvalue1 : SPropValue*, ulrelop : UInt32, lpspropvalue2 : SPropValue*) : LibC::BOOL

  # Params # lpspropvaluea : SPropValue* [In],lpspropvalueb : SPropValue* [In]
  fun LPropCompareProp(lpspropvaluea : SPropValue*, lpspropvalueb : SPropValue*) : Int32

  # Params # lptbl : IMAPITable [In],lpproptagcolumnsnew : SPropTagArray* [In],lpallocatebuffer : LPALLOCATEBUFFER [In],lpfreebuffer : LPFREEBUFFER [In]
  fun HrAddColumns(lptbl : IMAPITable, lpproptagcolumnsnew : SPropTagArray*, lpallocatebuffer : LPALLOCATEBUFFER, lpfreebuffer : LPFREEBUFFER) : HRESULT

  # Params # lptbl : IMAPITable [In],lpproptagcolumnsnew : SPropTagArray* [In],lpallocatebuffer : LPALLOCATEBUFFER [In],lpfreebuffer : LPFREEBUFFER [In],lpfnfiltercolumns : LibC::IntPtrT [In]
  fun HrAddColumnsEx(lptbl : IMAPITable, lpproptagcolumnsnew : SPropTagArray*, lpallocatebuffer : LPALLOCATEBUFFER, lpfreebuffer : LPFREEBUFFER, lpfnfiltercolumns : LibC::IntPtrT) : HRESULT

  # Params # lpfncallback : LPNOTIFCALLBACK [In],lpvcontext : Void* [In],lppadvisesink : IMAPIAdviseSink* [In]
  fun HrAllocAdviseSink(lpfncallback : LPNOTIFCALLBACK, lpvcontext : Void*, lppadvisesink : IMAPIAdviseSink*) : HRESULT

  # Params # lpadvisesink : IMAPIAdviseSink [In],lppadvisesink : IMAPIAdviseSink* [In]
  fun HrThisThreadAdviseSink(lpadvisesink : IMAPIAdviseSink, lppadvisesink : IMAPIAdviseSink*) : HRESULT

  # Params # ulflags : UInt32 [In]
  fun HrDispatchNotifications(ulflags : UInt32) : HRESULT

  # Params # lpallocatebuffer : LPALLOCATEBUFFER [In],lpallocatemore : LPALLOCATEMORE [In],lpfreebuffer : LPFREEBUFFER [In],lpmalloc : IMalloc [In],hinstance : HINSTANCE [In],cpages : UInt32 [In],lppage : DTPAGE* [In],ulflags : UInt32 [In],lpptable : IMAPITable* [In],lpptbldata : ITableData* [In]
  fun BuildDisplayTable(lpallocatebuffer : LPALLOCATEBUFFER, lpallocatemore : LPALLOCATEMORE, lpfreebuffer : LPFREEBUFFER, lpmalloc : IMalloc, hinstance : HINSTANCE, cpages : UInt32, lppage : DTPAGE*, ulflags : UInt32, lpptable : IMAPITable*, lpptbldata : ITableData*) : HRESULT

  # Params # cnotifications : Int32 [In],lpnotifications : NOTIFICATION* [In],lpcb : UInt32* [In]
  fun ScCountNotifications(cnotifications : Int32, lpnotifications : NOTIFICATION*, lpcb : UInt32*) : Int32

  # Params # cnotification : Int32 [In],lpnotifications : NOTIFICATION* [In],lpvdst : Void* [In],lpcb : UInt32* [In]
  fun ScCopyNotifications(cnotification : Int32, lpnotifications : NOTIFICATION*, lpvdst : Void*, lpcb : UInt32*) : Int32

  # Params # cnotification : Int32 [In],lpnotifications : NOTIFICATION* [In],lpvbaseold : Void* [In],lpvbasenew : Void* [In],lpcb : UInt32* [In]
  fun ScRelocNotifications(cnotification : Int32, lpnotifications : NOTIFICATION*, lpvbaseold : Void*, lpvbasenew : Void*, lpcb : UInt32*) : Int32

  # Params # cvalues : Int32 [In],lpproparray : SPropValue* [In],lpcb : UInt32* [In]
  fun ScCountProps(cvalues : Int32, lpproparray : SPropValue*, lpcb : UInt32*) : Int32

  # Params # ulproptag : UInt32 [In],cvalues : UInt32 [In],lpproparray : SPropValue* [In]
  fun LpValFindProp(ulproptag : UInt32, cvalues : UInt32, lpproparray : SPropValue*) : SPropValue*

  # Params # cvalues : Int32 [In],lpproparray : SPropValue* [In],lpvdst : Void* [In],lpcb : UInt32* [In]
  fun ScCopyProps(cvalues : Int32, lpproparray : SPropValue*, lpvdst : Void*, lpcb : UInt32*) : Int32

  # Params # cvalues : Int32 [In],lpproparray : SPropValue* [In],lpvbaseold : Void* [In],lpvbasenew : Void* [In],lpcb : UInt32* [In]
  fun ScRelocProps(cvalues : Int32, lpproparray : SPropValue*, lpvbaseold : Void*, lpvbasenew : Void*, lpcb : UInt32*) : Int32

  # Params # cvalues : Int32 [In],lpproparray : SPropValue* [In],lpallocatebuffer : LPALLOCATEBUFFER [In],lppproparray : SPropValue** [In]
  fun ScDupPropset(cvalues : Int32, lpproparray : SPropValue*, lpallocatebuffer : LPALLOCATEBUFFER, lppproparray : SPropValue**) : Int32

  # Params # lpunk : Void* [In]
  fun UlAddRef(lpunk : Void*) : UInt32

  # Params # lpunk : Void* [In]
  fun UlRelease(lpunk : Void*) : UInt32

  # Params # lpmapiprop : IMAPIProp [In],ulproptag : UInt32 [In],lppprop : SPropValue** [In]
  fun HrGetOneProp(lpmapiprop : IMAPIProp, ulproptag : UInt32, lppprop : SPropValue**) : HRESULT

  # Params # lpmapiprop : IMAPIProp [In],lpprop : SPropValue* [In]
  fun HrSetOneProp(lpmapiprop : IMAPIProp, lpprop : SPropValue*) : HRESULT

  # Params # lpmapiprop : IMAPIProp [In],ulproptag : UInt32 [In]
  fun FPropExists(lpmapiprop : IMAPIProp, ulproptag : UInt32) : LibC::BOOL

  # Params # lpproparray : SPropValue* [In],cvalues : UInt32 [In],ulproptag : UInt32 [In]
  fun PpropFindProp(lpproparray : SPropValue*, cvalues : UInt32, ulproptag : UInt32) : SPropValue*

  # Params # lpadrlist : ADRLIST* [In]
  fun FreePadrlist(lpadrlist : ADRLIST*) : Void

  # Params # lprows : SRowSet* [In]
  fun FreeProws(lprows : SRowSet*) : Void

  # Params # lptable : IMAPITable [In],lpproptags : SPropTagArray* [In],lprestriction : SRestriction* [In],lpsortorderset : SSortOrderSet* [In],crowsmax : Int32 [In],lpprows : SRowSet** [In]
  fun HrQueryAllRows(lptable : IMAPITable, lpproptags : SPropTagArray*, lprestriction : SRestriction*, lpsortorderset : SSortOrderSet*, crowsmax : Int32, lpprows : SRowSet**) : HRESULT

  # Params # lpsz : Int8* [In],ch : UInt16 [In]
  fun SzFindCh(lpsz : Int8*, ch : UInt16) : Int8*

  # Params # lpsz : Int8* [In],ch : UInt16 [In]
  fun SzFindLastCh(lpsz : Int8*, ch : UInt16) : Int8*

  # Params # lpsz : Int8* [In],lpszkey : Int8* [In]
  fun SzFindSz(lpsz : Int8*, lpszkey : Int8*) : Int8*

  # Params # lpsz : Int8* [In]
  fun UFromSz(lpsz : Int8*) : UInt32

  # Params # lpszlocal : PSTR [In],lpszunc : UInt8* [In],cchunc : UInt32 [In]
  fun ScUNCFromLocalPath(lpszlocal : PSTR, lpszunc : UInt8*, cchunc : UInt32) : Int32

  # Params # lpszunc : PSTR [In],lpszlocal : UInt8* [In],cchlocal : UInt32 [In]
  fun ScLocalPathFromUNC(lpszunc : PSTR, lpszlocal : UInt8*, cchlocal : UInt32) : Int32

  # Params # ftaddend1 : FILETIME [In],ftaddend2 : FILETIME [In]
  fun FtAddFt(ftaddend1 : FILETIME, ftaddend2 : FILETIME) : FILETIME

  # Params # ftmultiplicand : UInt32 [In],ftmultiplier : UInt32 [In]
  fun FtMulDwDw(ftmultiplicand : UInt32, ftmultiplier : UInt32) : FILETIME

  # Params # ftmultiplier : UInt32 [In],ftmultiplicand : FILETIME [In]
  fun FtMulDw(ftmultiplier : UInt32, ftmultiplicand : FILETIME) : FILETIME

  # Params # ftminuend : FILETIME [In],ftsubtrahend : FILETIME [In]
  fun FtSubFt(ftminuend : FILETIME, ftsubtrahend : FILETIME) : FILETIME

  # Params # ft : FILETIME [In]
  fun FtNegFt(ft : FILETIME) : FILETIME

  # Params # cbparent : UInt32 [In],lpbparent : UInt8* [In],lpcbconvindex : UInt32* [In],lppbconvindex : UInt8** [In]
  fun ScCreateConversationIndex(cbparent : UInt32, lpbparent : UInt8*, lpcbconvindex : UInt32*, lppbconvindex : UInt8**) : Int32

  # Params # ulflags : UInt32 [In],lpszdllname : Int8* [In],cborigentry : UInt32 [In],lporigentry : ENTRYID* [In],lpcbwrappedentry : UInt32* [In],lppwrappedentry : ENTRYID** [In]
  fun WrapStoreEntryID(ulflags : UInt32, lpszdllname : Int8*, cborigentry : UInt32, lporigentry : ENTRYID*, lpcbwrappedentry : UInt32*, lppwrappedentry : ENTRYID**) : HRESULT

  # Params # lpmessage : IMessage [In],ulflags : UInt32 [In],lpfmessageupdated : LibC::BOOL* [In]
  fun RTFSync(lpmessage : IMessage, ulflags : UInt32, lpfmessageupdated : LibC::BOOL*) : HRESULT

  # Params # lpcompressedrtfstream : IStream [In],ulflags : UInt32 [In],lpuncompressedrtfstream : IStream* [In]
  fun WrapCompressedRTFStream(lpcompressedrtfstream : IStream, ulflags : UInt32, lpuncompressedrtfstream : IStream*) : HRESULT

  # Params # lpunkin : IUnknown [In],lpinterface : Guid* [In],ulflags : UInt32 [In],lppstorageout : IStorage* [In]
  fun HrIStorageFromStream(lpunkin : IUnknown, lpinterface : Guid*, ulflags : UInt32, lppstorageout : IStorage*) : HRESULT

  # Params # ulflags : UInt32 [In]
  fun ScInitMapiUtil(ulflags : UInt32) : Int32

  # Params # 
  fun DeinitMapiUtil : Void
end
struct LibWin32::IMAPIAdviseSink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_notify(cnotif : UInt32, lpnotifications : NOTIFICATION*) : UInt32
    @lpVtbl.value.on_notify.unsafe_as(Proc(UInt32, NOTIFICATION*, UInt32)).call(cnotif, lpnotifications)
  end
end
struct LibWin32::IMAPIProgress
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def progress(ulvalue : UInt32, ulcount : UInt32, ultotal : UInt32) : HRESULT
    @lpVtbl.value.progress.unsafe_as(Proc(UInt32, UInt32, UInt32, HRESULT)).call(ulvalue, ulcount, ultotal)
  end
  def get_flags(lpulflags : UInt32*) : HRESULT
    @lpVtbl.value.get_flags.unsafe_as(Proc(UInt32*, HRESULT)).call(lpulflags)
  end
  def get_max(lpulmax : UInt32*) : HRESULT
    @lpVtbl.value.get_max.unsafe_as(Proc(UInt32*, HRESULT)).call(lpulmax)
  end
  def get_min(lpulmin : UInt32*) : HRESULT
    @lpVtbl.value.get_min.unsafe_as(Proc(UInt32*, HRESULT)).call(lpulmin)
  end
  def set_limits(lpulmin : UInt32*, lpulmax : UInt32*, lpulflags : UInt32*) : HRESULT
    @lpVtbl.value.set_limits.unsafe_as(Proc(UInt32*, UInt32*, UInt32*, HRESULT)).call(lpulmin, lpulmax, lpulflags)
  end
end
struct LibWin32::IMAPIProp
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_last_error(hresult : HRESULT, ulflags : UInt32, lppmapierror : MAPIERROR**) : HRESULT
    @lpVtbl.value.get_last_error.unsafe_as(Proc(HRESULT, UInt32, MAPIERROR**, HRESULT)).call(hresult, ulflags, lppmapierror)
  end
  def save_changes(ulflags : UInt32) : HRESULT
    @lpVtbl.value.save_changes.unsafe_as(Proc(UInt32, HRESULT)).call(ulflags)
  end
  def get_props(lpproptagarray : SPropTagArray*, ulflags : UInt32, lpcvalues : UInt32*, lppproparray : SPropValue**) : HRESULT
    @lpVtbl.value.get_props.unsafe_as(Proc(SPropTagArray*, UInt32, UInt32*, SPropValue**, HRESULT)).call(lpproptagarray, ulflags, lpcvalues, lppproparray)
  end
  def get_prop_list(ulflags : UInt32, lppproptagarray : SPropTagArray**) : HRESULT
    @lpVtbl.value.get_prop_list.unsafe_as(Proc(UInt32, SPropTagArray**, HRESULT)).call(ulflags, lppproptagarray)
  end
  def open_property(ulproptag : UInt32, lpiid : Guid*, ulinterfaceoptions : UInt32, ulflags : UInt32, lppunk : IUnknown*) : HRESULT
    @lpVtbl.value.open_property.unsafe_as(Proc(UInt32, Guid*, UInt32, UInt32, IUnknown*, HRESULT)).call(ulproptag, lpiid, ulinterfaceoptions, ulflags, lppunk)
  end
  def set_props(cvalues : UInt32, lpproparray : SPropValue*, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.set_props.unsafe_as(Proc(UInt32, SPropValue*, SPropProblemArray**, HRESULT)).call(cvalues, lpproparray, lppproblems)
  end
  def delete_props(lpproptagarray : SPropTagArray*, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.delete_props.unsafe_as(Proc(SPropTagArray*, SPropProblemArray**, HRESULT)).call(lpproptagarray, lppproblems)
  end
  def copy_to(ciidexclude : UInt32, rgiidexclude : Guid*, lpexcludeprops : SPropTagArray*, uluiparam : LibC::UINT_PTR, lpprogress : IMAPIProgress, lpinterface : Guid*, lpdestobj : Void*, ulflags : UInt32, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.copy_to.unsafe_as(Proc(UInt32, Guid*, SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)).call(ciidexclude, rgiidexclude, lpexcludeprops, uluiparam, lpprogress, lpinterface, lpdestobj, ulflags, lppproblems)
  end
  def copy_props(lpincludeprops : SPropTagArray*, uluiparam : LibC::UINT_PTR, lpprogress : IMAPIProgress, lpinterface : Guid*, lpdestobj : Void*, ulflags : UInt32, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.copy_props.unsafe_as(Proc(SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)).call(lpincludeprops, uluiparam, lpprogress, lpinterface, lpdestobj, ulflags, lppproblems)
  end
  def get_names_from_i_ds(lppproptags : SPropTagArray**, lppropsetguid : Guid*, ulflags : UInt32, lpcpropnames : UInt32*, lppppropnames : MAPINAMEID***) : HRESULT
    @lpVtbl.value.get_names_from_i_ds.unsafe_as(Proc(SPropTagArray**, Guid*, UInt32, UInt32*, MAPINAMEID***, HRESULT)).call(lppproptags, lppropsetguid, ulflags, lpcpropnames, lppppropnames)
  end
  def get_i_ds_from_names(cpropnames : UInt32, lpppropnames : MAPINAMEID**, ulflags : UInt32, lppproptags : SPropTagArray**) : HRESULT
    @lpVtbl.value.get_i_ds_from_names.unsafe_as(Proc(UInt32, MAPINAMEID**, UInt32, SPropTagArray**, HRESULT)).call(cpropnames, lpppropnames, ulflags, lppproptags)
  end
end
struct LibWin32::IMAPITable
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_last_error(hresult : HRESULT, ulflags : UInt32, lppmapierror : MAPIERROR**) : HRESULT
    @lpVtbl.value.get_last_error.unsafe_as(Proc(HRESULT, UInt32, MAPIERROR**, HRESULT)).call(hresult, ulflags, lppmapierror)
  end
  def advise(uleventmask : UInt32, lpadvisesink : IMAPIAdviseSink, lpulconnection : UInt32*) : HRESULT
    @lpVtbl.value.advise.unsafe_as(Proc(UInt32, IMAPIAdviseSink, UInt32*, HRESULT)).call(uleventmask, lpadvisesink, lpulconnection)
  end
  def unadvise(ulconnection : UInt32) : HRESULT
    @lpVtbl.value.unadvise.unsafe_as(Proc(UInt32, HRESULT)).call(ulconnection)
  end
  def get_status(lpultablestatus : UInt32*, lpultabletype : UInt32*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(lpultablestatus, lpultabletype)
  end
  def set_columns(lpproptagarray : SPropTagArray*, ulflags : UInt32) : HRESULT
    @lpVtbl.value.set_columns.unsafe_as(Proc(SPropTagArray*, UInt32, HRESULT)).call(lpproptagarray, ulflags)
  end
  def query_columns(ulflags : UInt32, lpproptagarray : SPropTagArray**) : HRESULT
    @lpVtbl.value.query_columns.unsafe_as(Proc(UInt32, SPropTagArray**, HRESULT)).call(ulflags, lpproptagarray)
  end
  def get_row_count(ulflags : UInt32, lpulcount : UInt32*) : HRESULT
    @lpVtbl.value.get_row_count.unsafe_as(Proc(UInt32, UInt32*, HRESULT)).call(ulflags, lpulcount)
  end
  def seek_row(bkorigin : UInt32, lrowcount : Int32, lplrowssought : Int32*) : HRESULT
    @lpVtbl.value.seek_row.unsafe_as(Proc(UInt32, Int32, Int32*, HRESULT)).call(bkorigin, lrowcount, lplrowssought)
  end
  def seek_row_approx(ulnumerator : UInt32, uldenominator : UInt32) : HRESULT
    @lpVtbl.value.seek_row_approx.unsafe_as(Proc(UInt32, UInt32, HRESULT)).call(ulnumerator, uldenominator)
  end
  def query_position(lpulrow : UInt32*, lpulnumerator : UInt32*, lpuldenominator : UInt32*) : HRESULT
    @lpVtbl.value.query_position.unsafe_as(Proc(UInt32*, UInt32*, UInt32*, HRESULT)).call(lpulrow, lpulnumerator, lpuldenominator)
  end
  def find_row(lprestriction : SRestriction*, bkorigin : UInt32, ulflags : UInt32) : HRESULT
    @lpVtbl.value.find_row.unsafe_as(Proc(SRestriction*, UInt32, UInt32, HRESULT)).call(lprestriction, bkorigin, ulflags)
  end
  def restrict(lprestriction : SRestriction*, ulflags : UInt32) : HRESULT
    @lpVtbl.value.restrict.unsafe_as(Proc(SRestriction*, UInt32, HRESULT)).call(lprestriction, ulflags)
  end
  def create_bookmark(lpbkposition : UInt32*) : HRESULT
    @lpVtbl.value.create_bookmark.unsafe_as(Proc(UInt32*, HRESULT)).call(lpbkposition)
  end
  def free_bookmark(bkposition : UInt32) : HRESULT
    @lpVtbl.value.free_bookmark.unsafe_as(Proc(UInt32, HRESULT)).call(bkposition)
  end
  def sort_table(lpsortcriteria : SSortOrderSet*, ulflags : UInt32) : HRESULT
    @lpVtbl.value.sort_table.unsafe_as(Proc(SSortOrderSet*, UInt32, HRESULT)).call(lpsortcriteria, ulflags)
  end
  def query_sort_order(lppsortcriteria : SSortOrderSet**) : HRESULT
    @lpVtbl.value.query_sort_order.unsafe_as(Proc(SSortOrderSet**, HRESULT)).call(lppsortcriteria)
  end
  def query_rows(lrowcount : Int32, ulflags : UInt32, lpprows : SRowSet**) : HRESULT
    @lpVtbl.value.query_rows.unsafe_as(Proc(Int32, UInt32, SRowSet**, HRESULT)).call(lrowcount, ulflags, lpprows)
  end
  def abort : HRESULT
    @lpVtbl.value.abort.unsafe_as(Proc(HRESULT)).call
  end
  def expand_row(cbinstancekey : UInt32, pbinstancekey : UInt8*, ulrowcount : UInt32, ulflags : UInt32, lpprows : SRowSet**, lpulmorerows : UInt32*) : HRESULT
    @lpVtbl.value.expand_row.unsafe_as(Proc(UInt32, UInt8*, UInt32, UInt32, SRowSet**, UInt32*, HRESULT)).call(cbinstancekey, pbinstancekey, ulrowcount, ulflags, lpprows, lpulmorerows)
  end
  def collapse_row(cbinstancekey : UInt32, pbinstancekey : UInt8*, ulflags : UInt32, lpulrowcount : UInt32*) : HRESULT
    @lpVtbl.value.collapse_row.unsafe_as(Proc(UInt32, UInt8*, UInt32, UInt32*, HRESULT)).call(cbinstancekey, pbinstancekey, ulflags, lpulrowcount)
  end
  def wait_for_completion(ulflags : UInt32, ultimeout : UInt32, lpultablestatus : UInt32*) : HRESULT
    @lpVtbl.value.wait_for_completion.unsafe_as(Proc(UInt32, UInt32, UInt32*, HRESULT)).call(ulflags, ultimeout, lpultablestatus)
  end
  def get_collapse_state(ulflags : UInt32, cbinstancekey : UInt32, lpbinstancekey : UInt8*, lpcbcollapsestate : UInt32*, lppbcollapsestate : UInt8**) : HRESULT
    @lpVtbl.value.get_collapse_state.unsafe_as(Proc(UInt32, UInt32, UInt8*, UInt32*, UInt8**, HRESULT)).call(ulflags, cbinstancekey, lpbinstancekey, lpcbcollapsestate, lppbcollapsestate)
  end
  def set_collapse_state(ulflags : UInt32, cbcollapsestate : UInt32, pbcollapsestate : UInt8*, lpbklocation : UInt32*) : HRESULT
    @lpVtbl.value.set_collapse_state.unsafe_as(Proc(UInt32, UInt32, UInt8*, UInt32*, HRESULT)).call(ulflags, cbcollapsestate, pbcollapsestate, lpbklocation)
  end
end
struct LibWin32::IProfSect
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_last_error(hresult : HRESULT, ulflags : UInt32, lppmapierror : MAPIERROR**) : HRESULT
    @lpVtbl.value.get_last_error.unsafe_as(Proc(HRESULT, UInt32, MAPIERROR**, HRESULT)).call(hresult, ulflags, lppmapierror)
  end
  def save_changes(ulflags : UInt32) : HRESULT
    @lpVtbl.value.save_changes.unsafe_as(Proc(UInt32, HRESULT)).call(ulflags)
  end
  def get_props(lpproptagarray : SPropTagArray*, ulflags : UInt32, lpcvalues : UInt32*, lppproparray : SPropValue**) : HRESULT
    @lpVtbl.value.get_props.unsafe_as(Proc(SPropTagArray*, UInt32, UInt32*, SPropValue**, HRESULT)).call(lpproptagarray, ulflags, lpcvalues, lppproparray)
  end
  def get_prop_list(ulflags : UInt32, lppproptagarray : SPropTagArray**) : HRESULT
    @lpVtbl.value.get_prop_list.unsafe_as(Proc(UInt32, SPropTagArray**, HRESULT)).call(ulflags, lppproptagarray)
  end
  def open_property(ulproptag : UInt32, lpiid : Guid*, ulinterfaceoptions : UInt32, ulflags : UInt32, lppunk : IUnknown*) : HRESULT
    @lpVtbl.value.open_property.unsafe_as(Proc(UInt32, Guid*, UInt32, UInt32, IUnknown*, HRESULT)).call(ulproptag, lpiid, ulinterfaceoptions, ulflags, lppunk)
  end
  def set_props(cvalues : UInt32, lpproparray : SPropValue*, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.set_props.unsafe_as(Proc(UInt32, SPropValue*, SPropProblemArray**, HRESULT)).call(cvalues, lpproparray, lppproblems)
  end
  def delete_props(lpproptagarray : SPropTagArray*, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.delete_props.unsafe_as(Proc(SPropTagArray*, SPropProblemArray**, HRESULT)).call(lpproptagarray, lppproblems)
  end
  def copy_to(ciidexclude : UInt32, rgiidexclude : Guid*, lpexcludeprops : SPropTagArray*, uluiparam : LibC::UINT_PTR, lpprogress : IMAPIProgress, lpinterface : Guid*, lpdestobj : Void*, ulflags : UInt32, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.copy_to.unsafe_as(Proc(UInt32, Guid*, SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)).call(ciidexclude, rgiidexclude, lpexcludeprops, uluiparam, lpprogress, lpinterface, lpdestobj, ulflags, lppproblems)
  end
  def copy_props(lpincludeprops : SPropTagArray*, uluiparam : LibC::UINT_PTR, lpprogress : IMAPIProgress, lpinterface : Guid*, lpdestobj : Void*, ulflags : UInt32, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.copy_props.unsafe_as(Proc(SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)).call(lpincludeprops, uluiparam, lpprogress, lpinterface, lpdestobj, ulflags, lppproblems)
  end
  def get_names_from_i_ds(lppproptags : SPropTagArray**, lppropsetguid : Guid*, ulflags : UInt32, lpcpropnames : UInt32*, lppppropnames : MAPINAMEID***) : HRESULT
    @lpVtbl.value.get_names_from_i_ds.unsafe_as(Proc(SPropTagArray**, Guid*, UInt32, UInt32*, MAPINAMEID***, HRESULT)).call(lppproptags, lppropsetguid, ulflags, lpcpropnames, lppppropnames)
  end
  def get_i_ds_from_names(cpropnames : UInt32, lpppropnames : MAPINAMEID**, ulflags : UInt32, lppproptags : SPropTagArray**) : HRESULT
    @lpVtbl.value.get_i_ds_from_names.unsafe_as(Proc(UInt32, MAPINAMEID**, UInt32, SPropTagArray**, HRESULT)).call(cpropnames, lpppropnames, ulflags, lppproptags)
  end
end
struct LibWin32::IMAPIStatus
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_last_error(hresult : HRESULT, ulflags : UInt32, lppmapierror : MAPIERROR**) : HRESULT
    @lpVtbl.value.get_last_error.unsafe_as(Proc(HRESULT, UInt32, MAPIERROR**, HRESULT)).call(hresult, ulflags, lppmapierror)
  end
  def save_changes(ulflags : UInt32) : HRESULT
    @lpVtbl.value.save_changes.unsafe_as(Proc(UInt32, HRESULT)).call(ulflags)
  end
  def get_props(lpproptagarray : SPropTagArray*, ulflags : UInt32, lpcvalues : UInt32*, lppproparray : SPropValue**) : HRESULT
    @lpVtbl.value.get_props.unsafe_as(Proc(SPropTagArray*, UInt32, UInt32*, SPropValue**, HRESULT)).call(lpproptagarray, ulflags, lpcvalues, lppproparray)
  end
  def get_prop_list(ulflags : UInt32, lppproptagarray : SPropTagArray**) : HRESULT
    @lpVtbl.value.get_prop_list.unsafe_as(Proc(UInt32, SPropTagArray**, HRESULT)).call(ulflags, lppproptagarray)
  end
  def open_property(ulproptag : UInt32, lpiid : Guid*, ulinterfaceoptions : UInt32, ulflags : UInt32, lppunk : IUnknown*) : HRESULT
    @lpVtbl.value.open_property.unsafe_as(Proc(UInt32, Guid*, UInt32, UInt32, IUnknown*, HRESULT)).call(ulproptag, lpiid, ulinterfaceoptions, ulflags, lppunk)
  end
  def set_props(cvalues : UInt32, lpproparray : SPropValue*, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.set_props.unsafe_as(Proc(UInt32, SPropValue*, SPropProblemArray**, HRESULT)).call(cvalues, lpproparray, lppproblems)
  end
  def delete_props(lpproptagarray : SPropTagArray*, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.delete_props.unsafe_as(Proc(SPropTagArray*, SPropProblemArray**, HRESULT)).call(lpproptagarray, lppproblems)
  end
  def copy_to(ciidexclude : UInt32, rgiidexclude : Guid*, lpexcludeprops : SPropTagArray*, uluiparam : LibC::UINT_PTR, lpprogress : IMAPIProgress, lpinterface : Guid*, lpdestobj : Void*, ulflags : UInt32, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.copy_to.unsafe_as(Proc(UInt32, Guid*, SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)).call(ciidexclude, rgiidexclude, lpexcludeprops, uluiparam, lpprogress, lpinterface, lpdestobj, ulflags, lppproblems)
  end
  def copy_props(lpincludeprops : SPropTagArray*, uluiparam : LibC::UINT_PTR, lpprogress : IMAPIProgress, lpinterface : Guid*, lpdestobj : Void*, ulflags : UInt32, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.copy_props.unsafe_as(Proc(SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)).call(lpincludeprops, uluiparam, lpprogress, lpinterface, lpdestobj, ulflags, lppproblems)
  end
  def get_names_from_i_ds(lppproptags : SPropTagArray**, lppropsetguid : Guid*, ulflags : UInt32, lpcpropnames : UInt32*, lppppropnames : MAPINAMEID***) : HRESULT
    @lpVtbl.value.get_names_from_i_ds.unsafe_as(Proc(SPropTagArray**, Guid*, UInt32, UInt32*, MAPINAMEID***, HRESULT)).call(lppproptags, lppropsetguid, ulflags, lpcpropnames, lppppropnames)
  end
  def get_i_ds_from_names(cpropnames : UInt32, lpppropnames : MAPINAMEID**, ulflags : UInt32, lppproptags : SPropTagArray**) : HRESULT
    @lpVtbl.value.get_i_ds_from_names.unsafe_as(Proc(UInt32, MAPINAMEID**, UInt32, SPropTagArray**, HRESULT)).call(cpropnames, lpppropnames, ulflags, lppproptags)
  end
  def validate_state(uluiparam : LibC::UINT_PTR, ulflags : UInt32) : HRESULT
    @lpVtbl.value.validate_state.unsafe_as(Proc(LibC::UINT_PTR, UInt32, HRESULT)).call(uluiparam, ulflags)
  end
  def settings_dialog(uluiparam : LibC::UINT_PTR, ulflags : UInt32) : HRESULT
    @lpVtbl.value.settings_dialog.unsafe_as(Proc(LibC::UINT_PTR, UInt32, HRESULT)).call(uluiparam, ulflags)
  end
  def change_password(lpoldpass : Int8*, lpnewpass : Int8*, ulflags : UInt32) : HRESULT
    @lpVtbl.value.change_password.unsafe_as(Proc(Int8*, Int8*, UInt32, HRESULT)).call(lpoldpass, lpnewpass, ulflags)
  end
  def flush_queues(uluiparam : LibC::UINT_PTR, cbtargettransport : UInt32, lptargettransport : ENTRYID*, ulflags : UInt32) : HRESULT
    @lpVtbl.value.flush_queues.unsafe_as(Proc(LibC::UINT_PTR, UInt32, ENTRYID*, UInt32, HRESULT)).call(uluiparam, cbtargettransport, lptargettransport, ulflags)
  end
end
struct LibWin32::IMAPIContainer
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_last_error(hresult : HRESULT, ulflags : UInt32, lppmapierror : MAPIERROR**) : HRESULT
    @lpVtbl.value.get_last_error.unsafe_as(Proc(HRESULT, UInt32, MAPIERROR**, HRESULT)).call(hresult, ulflags, lppmapierror)
  end
  def save_changes(ulflags : UInt32) : HRESULT
    @lpVtbl.value.save_changes.unsafe_as(Proc(UInt32, HRESULT)).call(ulflags)
  end
  def get_props(lpproptagarray : SPropTagArray*, ulflags : UInt32, lpcvalues : UInt32*, lppproparray : SPropValue**) : HRESULT
    @lpVtbl.value.get_props.unsafe_as(Proc(SPropTagArray*, UInt32, UInt32*, SPropValue**, HRESULT)).call(lpproptagarray, ulflags, lpcvalues, lppproparray)
  end
  def get_prop_list(ulflags : UInt32, lppproptagarray : SPropTagArray**) : HRESULT
    @lpVtbl.value.get_prop_list.unsafe_as(Proc(UInt32, SPropTagArray**, HRESULT)).call(ulflags, lppproptagarray)
  end
  def open_property(ulproptag : UInt32, lpiid : Guid*, ulinterfaceoptions : UInt32, ulflags : UInt32, lppunk : IUnknown*) : HRESULT
    @lpVtbl.value.open_property.unsafe_as(Proc(UInt32, Guid*, UInt32, UInt32, IUnknown*, HRESULT)).call(ulproptag, lpiid, ulinterfaceoptions, ulflags, lppunk)
  end
  def set_props(cvalues : UInt32, lpproparray : SPropValue*, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.set_props.unsafe_as(Proc(UInt32, SPropValue*, SPropProblemArray**, HRESULT)).call(cvalues, lpproparray, lppproblems)
  end
  def delete_props(lpproptagarray : SPropTagArray*, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.delete_props.unsafe_as(Proc(SPropTagArray*, SPropProblemArray**, HRESULT)).call(lpproptagarray, lppproblems)
  end
  def copy_to(ciidexclude : UInt32, rgiidexclude : Guid*, lpexcludeprops : SPropTagArray*, uluiparam : LibC::UINT_PTR, lpprogress : IMAPIProgress, lpinterface : Guid*, lpdestobj : Void*, ulflags : UInt32, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.copy_to.unsafe_as(Proc(UInt32, Guid*, SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)).call(ciidexclude, rgiidexclude, lpexcludeprops, uluiparam, lpprogress, lpinterface, lpdestobj, ulflags, lppproblems)
  end
  def copy_props(lpincludeprops : SPropTagArray*, uluiparam : LibC::UINT_PTR, lpprogress : IMAPIProgress, lpinterface : Guid*, lpdestobj : Void*, ulflags : UInt32, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.copy_props.unsafe_as(Proc(SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)).call(lpincludeprops, uluiparam, lpprogress, lpinterface, lpdestobj, ulflags, lppproblems)
  end
  def get_names_from_i_ds(lppproptags : SPropTagArray**, lppropsetguid : Guid*, ulflags : UInt32, lpcpropnames : UInt32*, lppppropnames : MAPINAMEID***) : HRESULT
    @lpVtbl.value.get_names_from_i_ds.unsafe_as(Proc(SPropTagArray**, Guid*, UInt32, UInt32*, MAPINAMEID***, HRESULT)).call(lppproptags, lppropsetguid, ulflags, lpcpropnames, lppppropnames)
  end
  def get_i_ds_from_names(cpropnames : UInt32, lpppropnames : MAPINAMEID**, ulflags : UInt32, lppproptags : SPropTagArray**) : HRESULT
    @lpVtbl.value.get_i_ds_from_names.unsafe_as(Proc(UInt32, MAPINAMEID**, UInt32, SPropTagArray**, HRESULT)).call(cpropnames, lpppropnames, ulflags, lppproptags)
  end
  def get_contents_table(ulflags : UInt32, lpptable : IMAPITable*) : HRESULT
    @lpVtbl.value.get_contents_table.unsafe_as(Proc(UInt32, IMAPITable*, HRESULT)).call(ulflags, lpptable)
  end
  def get_hierarchy_table(ulflags : UInt32, lpptable : IMAPITable*) : HRESULT
    @lpVtbl.value.get_hierarchy_table.unsafe_as(Proc(UInt32, IMAPITable*, HRESULT)).call(ulflags, lpptable)
  end
  def open_entry(cbentryid : UInt32, lpentryid : ENTRYID*, lpinterface : Guid*, ulflags : UInt32, lpulobjtype : UInt32*, lppunk : IUnknown*) : HRESULT
    @lpVtbl.value.open_entry.unsafe_as(Proc(UInt32, ENTRYID*, Guid*, UInt32, UInt32*, IUnknown*, HRESULT)).call(cbentryid, lpentryid, lpinterface, ulflags, lpulobjtype, lppunk)
  end
  def set_search_criteria(lprestriction : SRestriction*, lpcontainerlist : SBinaryArray*, ulsearchflags : UInt32) : HRESULT
    @lpVtbl.value.set_search_criteria.unsafe_as(Proc(SRestriction*, SBinaryArray*, UInt32, HRESULT)).call(lprestriction, lpcontainerlist, ulsearchflags)
  end
  def get_search_criteria(ulflags : UInt32, lpprestriction : SRestriction**, lppcontainerlist : SBinaryArray**, lpulsearchstate : UInt32*) : HRESULT
    @lpVtbl.value.get_search_criteria.unsafe_as(Proc(UInt32, SRestriction**, SBinaryArray**, UInt32*, HRESULT)).call(ulflags, lpprestriction, lppcontainerlist, lpulsearchstate)
  end
end
struct LibWin32::IABContainer
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_last_error(hresult : HRESULT, ulflags : UInt32, lppmapierror : MAPIERROR**) : HRESULT
    @lpVtbl.value.get_last_error.unsafe_as(Proc(HRESULT, UInt32, MAPIERROR**, HRESULT)).call(hresult, ulflags, lppmapierror)
  end
  def save_changes(ulflags : UInt32) : HRESULT
    @lpVtbl.value.save_changes.unsafe_as(Proc(UInt32, HRESULT)).call(ulflags)
  end
  def get_props(lpproptagarray : SPropTagArray*, ulflags : UInt32, lpcvalues : UInt32*, lppproparray : SPropValue**) : HRESULT
    @lpVtbl.value.get_props.unsafe_as(Proc(SPropTagArray*, UInt32, UInt32*, SPropValue**, HRESULT)).call(lpproptagarray, ulflags, lpcvalues, lppproparray)
  end
  def get_prop_list(ulflags : UInt32, lppproptagarray : SPropTagArray**) : HRESULT
    @lpVtbl.value.get_prop_list.unsafe_as(Proc(UInt32, SPropTagArray**, HRESULT)).call(ulflags, lppproptagarray)
  end
  def open_property(ulproptag : UInt32, lpiid : Guid*, ulinterfaceoptions : UInt32, ulflags : UInt32, lppunk : IUnknown*) : HRESULT
    @lpVtbl.value.open_property.unsafe_as(Proc(UInt32, Guid*, UInt32, UInt32, IUnknown*, HRESULT)).call(ulproptag, lpiid, ulinterfaceoptions, ulflags, lppunk)
  end
  def set_props(cvalues : UInt32, lpproparray : SPropValue*, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.set_props.unsafe_as(Proc(UInt32, SPropValue*, SPropProblemArray**, HRESULT)).call(cvalues, lpproparray, lppproblems)
  end
  def delete_props(lpproptagarray : SPropTagArray*, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.delete_props.unsafe_as(Proc(SPropTagArray*, SPropProblemArray**, HRESULT)).call(lpproptagarray, lppproblems)
  end
  def copy_to(ciidexclude : UInt32, rgiidexclude : Guid*, lpexcludeprops : SPropTagArray*, uluiparam : LibC::UINT_PTR, lpprogress : IMAPIProgress, lpinterface : Guid*, lpdestobj : Void*, ulflags : UInt32, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.copy_to.unsafe_as(Proc(UInt32, Guid*, SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)).call(ciidexclude, rgiidexclude, lpexcludeprops, uluiparam, lpprogress, lpinterface, lpdestobj, ulflags, lppproblems)
  end
  def copy_props(lpincludeprops : SPropTagArray*, uluiparam : LibC::UINT_PTR, lpprogress : IMAPIProgress, lpinterface : Guid*, lpdestobj : Void*, ulflags : UInt32, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.copy_props.unsafe_as(Proc(SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)).call(lpincludeprops, uluiparam, lpprogress, lpinterface, lpdestobj, ulflags, lppproblems)
  end
  def get_names_from_i_ds(lppproptags : SPropTagArray**, lppropsetguid : Guid*, ulflags : UInt32, lpcpropnames : UInt32*, lppppropnames : MAPINAMEID***) : HRESULT
    @lpVtbl.value.get_names_from_i_ds.unsafe_as(Proc(SPropTagArray**, Guid*, UInt32, UInt32*, MAPINAMEID***, HRESULT)).call(lppproptags, lppropsetguid, ulflags, lpcpropnames, lppppropnames)
  end
  def get_i_ds_from_names(cpropnames : UInt32, lpppropnames : MAPINAMEID**, ulflags : UInt32, lppproptags : SPropTagArray**) : HRESULT
    @lpVtbl.value.get_i_ds_from_names.unsafe_as(Proc(UInt32, MAPINAMEID**, UInt32, SPropTagArray**, HRESULT)).call(cpropnames, lpppropnames, ulflags, lppproptags)
  end
  def get_contents_table(ulflags : UInt32, lpptable : IMAPITable*) : HRESULT
    @lpVtbl.value.get_contents_table.unsafe_as(Proc(UInt32, IMAPITable*, HRESULT)).call(ulflags, lpptable)
  end
  def get_hierarchy_table(ulflags : UInt32, lpptable : IMAPITable*) : HRESULT
    @lpVtbl.value.get_hierarchy_table.unsafe_as(Proc(UInt32, IMAPITable*, HRESULT)).call(ulflags, lpptable)
  end
  def open_entry(cbentryid : UInt32, lpentryid : ENTRYID*, lpinterface : Guid*, ulflags : UInt32, lpulobjtype : UInt32*, lppunk : IUnknown*) : HRESULT
    @lpVtbl.value.open_entry.unsafe_as(Proc(UInt32, ENTRYID*, Guid*, UInt32, UInt32*, IUnknown*, HRESULT)).call(cbentryid, lpentryid, lpinterface, ulflags, lpulobjtype, lppunk)
  end
  def set_search_criteria(lprestriction : SRestriction*, lpcontainerlist : SBinaryArray*, ulsearchflags : UInt32) : HRESULT
    @lpVtbl.value.set_search_criteria.unsafe_as(Proc(SRestriction*, SBinaryArray*, UInt32, HRESULT)).call(lprestriction, lpcontainerlist, ulsearchflags)
  end
  def get_search_criteria(ulflags : UInt32, lpprestriction : SRestriction**, lppcontainerlist : SBinaryArray**, lpulsearchstate : UInt32*) : HRESULT
    @lpVtbl.value.get_search_criteria.unsafe_as(Proc(UInt32, SRestriction**, SBinaryArray**, UInt32*, HRESULT)).call(ulflags, lpprestriction, lppcontainerlist, lpulsearchstate)
  end
  def create_entry(cbentryid : UInt32, lpentryid : ENTRYID*, ulcreateflags : UInt32, lppmapipropentry : IMAPIProp*) : HRESULT
    @lpVtbl.value.create_entry.unsafe_as(Proc(UInt32, ENTRYID*, UInt32, IMAPIProp*, HRESULT)).call(cbentryid, lpentryid, ulcreateflags, lppmapipropentry)
  end
  def copy_entries(lpentries : SBinaryArray*, uluiparam : LibC::UINT_PTR, lpprogress : IMAPIProgress, ulflags : UInt32) : HRESULT
    @lpVtbl.value.copy_entries.unsafe_as(Proc(SBinaryArray*, LibC::UINT_PTR, IMAPIProgress, UInt32, HRESULT)).call(lpentries, uluiparam, lpprogress, ulflags)
  end
  def delete_entries(lpentries : SBinaryArray*, ulflags : UInt32) : HRESULT
    @lpVtbl.value.delete_entries.unsafe_as(Proc(SBinaryArray*, UInt32, HRESULT)).call(lpentries, ulflags)
  end
  def resolve_names(lpproptagarray : SPropTagArray*, ulflags : UInt32, lpadrlist : ADRLIST*, lpflaglist : Flaglist*) : HRESULT
    @lpVtbl.value.resolve_names.unsafe_as(Proc(SPropTagArray*, UInt32, ADRLIST*, Flaglist*, HRESULT)).call(lpproptagarray, ulflags, lpadrlist, lpflaglist)
  end
end
struct LibWin32::IMailUser
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_last_error(hresult : HRESULT, ulflags : UInt32, lppmapierror : MAPIERROR**) : HRESULT
    @lpVtbl.value.get_last_error.unsafe_as(Proc(HRESULT, UInt32, MAPIERROR**, HRESULT)).call(hresult, ulflags, lppmapierror)
  end
  def save_changes(ulflags : UInt32) : HRESULT
    @lpVtbl.value.save_changes.unsafe_as(Proc(UInt32, HRESULT)).call(ulflags)
  end
  def get_props(lpproptagarray : SPropTagArray*, ulflags : UInt32, lpcvalues : UInt32*, lppproparray : SPropValue**) : HRESULT
    @lpVtbl.value.get_props.unsafe_as(Proc(SPropTagArray*, UInt32, UInt32*, SPropValue**, HRESULT)).call(lpproptagarray, ulflags, lpcvalues, lppproparray)
  end
  def get_prop_list(ulflags : UInt32, lppproptagarray : SPropTagArray**) : HRESULT
    @lpVtbl.value.get_prop_list.unsafe_as(Proc(UInt32, SPropTagArray**, HRESULT)).call(ulflags, lppproptagarray)
  end
  def open_property(ulproptag : UInt32, lpiid : Guid*, ulinterfaceoptions : UInt32, ulflags : UInt32, lppunk : IUnknown*) : HRESULT
    @lpVtbl.value.open_property.unsafe_as(Proc(UInt32, Guid*, UInt32, UInt32, IUnknown*, HRESULT)).call(ulproptag, lpiid, ulinterfaceoptions, ulflags, lppunk)
  end
  def set_props(cvalues : UInt32, lpproparray : SPropValue*, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.set_props.unsafe_as(Proc(UInt32, SPropValue*, SPropProblemArray**, HRESULT)).call(cvalues, lpproparray, lppproblems)
  end
  def delete_props(lpproptagarray : SPropTagArray*, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.delete_props.unsafe_as(Proc(SPropTagArray*, SPropProblemArray**, HRESULT)).call(lpproptagarray, lppproblems)
  end
  def copy_to(ciidexclude : UInt32, rgiidexclude : Guid*, lpexcludeprops : SPropTagArray*, uluiparam : LibC::UINT_PTR, lpprogress : IMAPIProgress, lpinterface : Guid*, lpdestobj : Void*, ulflags : UInt32, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.copy_to.unsafe_as(Proc(UInt32, Guid*, SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)).call(ciidexclude, rgiidexclude, lpexcludeprops, uluiparam, lpprogress, lpinterface, lpdestobj, ulflags, lppproblems)
  end
  def copy_props(lpincludeprops : SPropTagArray*, uluiparam : LibC::UINT_PTR, lpprogress : IMAPIProgress, lpinterface : Guid*, lpdestobj : Void*, ulflags : UInt32, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.copy_props.unsafe_as(Proc(SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)).call(lpincludeprops, uluiparam, lpprogress, lpinterface, lpdestobj, ulflags, lppproblems)
  end
  def get_names_from_i_ds(lppproptags : SPropTagArray**, lppropsetguid : Guid*, ulflags : UInt32, lpcpropnames : UInt32*, lppppropnames : MAPINAMEID***) : HRESULT
    @lpVtbl.value.get_names_from_i_ds.unsafe_as(Proc(SPropTagArray**, Guid*, UInt32, UInt32*, MAPINAMEID***, HRESULT)).call(lppproptags, lppropsetguid, ulflags, lpcpropnames, lppppropnames)
  end
  def get_i_ds_from_names(cpropnames : UInt32, lpppropnames : MAPINAMEID**, ulflags : UInt32, lppproptags : SPropTagArray**) : HRESULT
    @lpVtbl.value.get_i_ds_from_names.unsafe_as(Proc(UInt32, MAPINAMEID**, UInt32, SPropTagArray**, HRESULT)).call(cpropnames, lpppropnames, ulflags, lppproptags)
  end
end
struct LibWin32::IDistList
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_last_error(hresult : HRESULT, ulflags : UInt32, lppmapierror : MAPIERROR**) : HRESULT
    @lpVtbl.value.get_last_error.unsafe_as(Proc(HRESULT, UInt32, MAPIERROR**, HRESULT)).call(hresult, ulflags, lppmapierror)
  end
  def save_changes(ulflags : UInt32) : HRESULT
    @lpVtbl.value.save_changes.unsafe_as(Proc(UInt32, HRESULT)).call(ulflags)
  end
  def get_props(lpproptagarray : SPropTagArray*, ulflags : UInt32, lpcvalues : UInt32*, lppproparray : SPropValue**) : HRESULT
    @lpVtbl.value.get_props.unsafe_as(Proc(SPropTagArray*, UInt32, UInt32*, SPropValue**, HRESULT)).call(lpproptagarray, ulflags, lpcvalues, lppproparray)
  end
  def get_prop_list(ulflags : UInt32, lppproptagarray : SPropTagArray**) : HRESULT
    @lpVtbl.value.get_prop_list.unsafe_as(Proc(UInt32, SPropTagArray**, HRESULT)).call(ulflags, lppproptagarray)
  end
  def open_property(ulproptag : UInt32, lpiid : Guid*, ulinterfaceoptions : UInt32, ulflags : UInt32, lppunk : IUnknown*) : HRESULT
    @lpVtbl.value.open_property.unsafe_as(Proc(UInt32, Guid*, UInt32, UInt32, IUnknown*, HRESULT)).call(ulproptag, lpiid, ulinterfaceoptions, ulflags, lppunk)
  end
  def set_props(cvalues : UInt32, lpproparray : SPropValue*, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.set_props.unsafe_as(Proc(UInt32, SPropValue*, SPropProblemArray**, HRESULT)).call(cvalues, lpproparray, lppproblems)
  end
  def delete_props(lpproptagarray : SPropTagArray*, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.delete_props.unsafe_as(Proc(SPropTagArray*, SPropProblemArray**, HRESULT)).call(lpproptagarray, lppproblems)
  end
  def copy_to(ciidexclude : UInt32, rgiidexclude : Guid*, lpexcludeprops : SPropTagArray*, uluiparam : LibC::UINT_PTR, lpprogress : IMAPIProgress, lpinterface : Guid*, lpdestobj : Void*, ulflags : UInt32, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.copy_to.unsafe_as(Proc(UInt32, Guid*, SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)).call(ciidexclude, rgiidexclude, lpexcludeprops, uluiparam, lpprogress, lpinterface, lpdestobj, ulflags, lppproblems)
  end
  def copy_props(lpincludeprops : SPropTagArray*, uluiparam : LibC::UINT_PTR, lpprogress : IMAPIProgress, lpinterface : Guid*, lpdestobj : Void*, ulflags : UInt32, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.copy_props.unsafe_as(Proc(SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)).call(lpincludeprops, uluiparam, lpprogress, lpinterface, lpdestobj, ulflags, lppproblems)
  end
  def get_names_from_i_ds(lppproptags : SPropTagArray**, lppropsetguid : Guid*, ulflags : UInt32, lpcpropnames : UInt32*, lppppropnames : MAPINAMEID***) : HRESULT
    @lpVtbl.value.get_names_from_i_ds.unsafe_as(Proc(SPropTagArray**, Guid*, UInt32, UInt32*, MAPINAMEID***, HRESULT)).call(lppproptags, lppropsetguid, ulflags, lpcpropnames, lppppropnames)
  end
  def get_i_ds_from_names(cpropnames : UInt32, lpppropnames : MAPINAMEID**, ulflags : UInt32, lppproptags : SPropTagArray**) : HRESULT
    @lpVtbl.value.get_i_ds_from_names.unsafe_as(Proc(UInt32, MAPINAMEID**, UInt32, SPropTagArray**, HRESULT)).call(cpropnames, lpppropnames, ulflags, lppproptags)
  end
  def get_contents_table(ulflags : UInt32, lpptable : IMAPITable*) : HRESULT
    @lpVtbl.value.get_contents_table.unsafe_as(Proc(UInt32, IMAPITable*, HRESULT)).call(ulflags, lpptable)
  end
  def get_hierarchy_table(ulflags : UInt32, lpptable : IMAPITable*) : HRESULT
    @lpVtbl.value.get_hierarchy_table.unsafe_as(Proc(UInt32, IMAPITable*, HRESULT)).call(ulflags, lpptable)
  end
  def open_entry(cbentryid : UInt32, lpentryid : ENTRYID*, lpinterface : Guid*, ulflags : UInt32, lpulobjtype : UInt32*, lppunk : IUnknown*) : HRESULT
    @lpVtbl.value.open_entry.unsafe_as(Proc(UInt32, ENTRYID*, Guid*, UInt32, UInt32*, IUnknown*, HRESULT)).call(cbentryid, lpentryid, lpinterface, ulflags, lpulobjtype, lppunk)
  end
  def set_search_criteria(lprestriction : SRestriction*, lpcontainerlist : SBinaryArray*, ulsearchflags : UInt32) : HRESULT
    @lpVtbl.value.set_search_criteria.unsafe_as(Proc(SRestriction*, SBinaryArray*, UInt32, HRESULT)).call(lprestriction, lpcontainerlist, ulsearchflags)
  end
  def get_search_criteria(ulflags : UInt32, lpprestriction : SRestriction**, lppcontainerlist : SBinaryArray**, lpulsearchstate : UInt32*) : HRESULT
    @lpVtbl.value.get_search_criteria.unsafe_as(Proc(UInt32, SRestriction**, SBinaryArray**, UInt32*, HRESULT)).call(ulflags, lpprestriction, lppcontainerlist, lpulsearchstate)
  end
  def create_entry(cbentryid : UInt32, lpentryid : ENTRYID*, ulcreateflags : UInt32, lppmapipropentry : IMAPIProp*) : HRESULT
    @lpVtbl.value.create_entry.unsafe_as(Proc(UInt32, ENTRYID*, UInt32, IMAPIProp*, HRESULT)).call(cbentryid, lpentryid, ulcreateflags, lppmapipropentry)
  end
  def copy_entries(lpentries : SBinaryArray*, uluiparam : LibC::UINT_PTR, lpprogress : IMAPIProgress, ulflags : UInt32) : HRESULT
    @lpVtbl.value.copy_entries.unsafe_as(Proc(SBinaryArray*, LibC::UINT_PTR, IMAPIProgress, UInt32, HRESULT)).call(lpentries, uluiparam, lpprogress, ulflags)
  end
  def delete_entries(lpentries : SBinaryArray*, ulflags : UInt32) : HRESULT
    @lpVtbl.value.delete_entries.unsafe_as(Proc(SBinaryArray*, UInt32, HRESULT)).call(lpentries, ulflags)
  end
  def resolve_names(lpproptagarray : SPropTagArray*, ulflags : UInt32, lpadrlist : ADRLIST*, lpflaglist : Flaglist*) : HRESULT
    @lpVtbl.value.resolve_names.unsafe_as(Proc(SPropTagArray*, UInt32, ADRLIST*, Flaglist*, HRESULT)).call(lpproptagarray, ulflags, lpadrlist, lpflaglist)
  end
end
struct LibWin32::IMAPIFolder
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_last_error(hresult : HRESULT, ulflags : UInt32, lppmapierror : MAPIERROR**) : HRESULT
    @lpVtbl.value.get_last_error.unsafe_as(Proc(HRESULT, UInt32, MAPIERROR**, HRESULT)).call(hresult, ulflags, lppmapierror)
  end
  def save_changes(ulflags : UInt32) : HRESULT
    @lpVtbl.value.save_changes.unsafe_as(Proc(UInt32, HRESULT)).call(ulflags)
  end
  def get_props(lpproptagarray : SPropTagArray*, ulflags : UInt32, lpcvalues : UInt32*, lppproparray : SPropValue**) : HRESULT
    @lpVtbl.value.get_props.unsafe_as(Proc(SPropTagArray*, UInt32, UInt32*, SPropValue**, HRESULT)).call(lpproptagarray, ulflags, lpcvalues, lppproparray)
  end
  def get_prop_list(ulflags : UInt32, lppproptagarray : SPropTagArray**) : HRESULT
    @lpVtbl.value.get_prop_list.unsafe_as(Proc(UInt32, SPropTagArray**, HRESULT)).call(ulflags, lppproptagarray)
  end
  def open_property(ulproptag : UInt32, lpiid : Guid*, ulinterfaceoptions : UInt32, ulflags : UInt32, lppunk : IUnknown*) : HRESULT
    @lpVtbl.value.open_property.unsafe_as(Proc(UInt32, Guid*, UInt32, UInt32, IUnknown*, HRESULT)).call(ulproptag, lpiid, ulinterfaceoptions, ulflags, lppunk)
  end
  def set_props(cvalues : UInt32, lpproparray : SPropValue*, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.set_props.unsafe_as(Proc(UInt32, SPropValue*, SPropProblemArray**, HRESULT)).call(cvalues, lpproparray, lppproblems)
  end
  def delete_props(lpproptagarray : SPropTagArray*, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.delete_props.unsafe_as(Proc(SPropTagArray*, SPropProblemArray**, HRESULT)).call(lpproptagarray, lppproblems)
  end
  def copy_to(ciidexclude : UInt32, rgiidexclude : Guid*, lpexcludeprops : SPropTagArray*, uluiparam : LibC::UINT_PTR, lpprogress : IMAPIProgress, lpinterface : Guid*, lpdestobj : Void*, ulflags : UInt32, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.copy_to.unsafe_as(Proc(UInt32, Guid*, SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)).call(ciidexclude, rgiidexclude, lpexcludeprops, uluiparam, lpprogress, lpinterface, lpdestobj, ulflags, lppproblems)
  end
  def copy_props(lpincludeprops : SPropTagArray*, uluiparam : LibC::UINT_PTR, lpprogress : IMAPIProgress, lpinterface : Guid*, lpdestobj : Void*, ulflags : UInt32, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.copy_props.unsafe_as(Proc(SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)).call(lpincludeprops, uluiparam, lpprogress, lpinterface, lpdestobj, ulflags, lppproblems)
  end
  def get_names_from_i_ds(lppproptags : SPropTagArray**, lppropsetguid : Guid*, ulflags : UInt32, lpcpropnames : UInt32*, lppppropnames : MAPINAMEID***) : HRESULT
    @lpVtbl.value.get_names_from_i_ds.unsafe_as(Proc(SPropTagArray**, Guid*, UInt32, UInt32*, MAPINAMEID***, HRESULT)).call(lppproptags, lppropsetguid, ulflags, lpcpropnames, lppppropnames)
  end
  def get_i_ds_from_names(cpropnames : UInt32, lpppropnames : MAPINAMEID**, ulflags : UInt32, lppproptags : SPropTagArray**) : HRESULT
    @lpVtbl.value.get_i_ds_from_names.unsafe_as(Proc(UInt32, MAPINAMEID**, UInt32, SPropTagArray**, HRESULT)).call(cpropnames, lpppropnames, ulflags, lppproptags)
  end
  def get_contents_table(ulflags : UInt32, lpptable : IMAPITable*) : HRESULT
    @lpVtbl.value.get_contents_table.unsafe_as(Proc(UInt32, IMAPITable*, HRESULT)).call(ulflags, lpptable)
  end
  def get_hierarchy_table(ulflags : UInt32, lpptable : IMAPITable*) : HRESULT
    @lpVtbl.value.get_hierarchy_table.unsafe_as(Proc(UInt32, IMAPITable*, HRESULT)).call(ulflags, lpptable)
  end
  def open_entry(cbentryid : UInt32, lpentryid : ENTRYID*, lpinterface : Guid*, ulflags : UInt32, lpulobjtype : UInt32*, lppunk : IUnknown*) : HRESULT
    @lpVtbl.value.open_entry.unsafe_as(Proc(UInt32, ENTRYID*, Guid*, UInt32, UInt32*, IUnknown*, HRESULT)).call(cbentryid, lpentryid, lpinterface, ulflags, lpulobjtype, lppunk)
  end
  def set_search_criteria(lprestriction : SRestriction*, lpcontainerlist : SBinaryArray*, ulsearchflags : UInt32) : HRESULT
    @lpVtbl.value.set_search_criteria.unsafe_as(Proc(SRestriction*, SBinaryArray*, UInt32, HRESULT)).call(lprestriction, lpcontainerlist, ulsearchflags)
  end
  def get_search_criteria(ulflags : UInt32, lpprestriction : SRestriction**, lppcontainerlist : SBinaryArray**, lpulsearchstate : UInt32*) : HRESULT
    @lpVtbl.value.get_search_criteria.unsafe_as(Proc(UInt32, SRestriction**, SBinaryArray**, UInt32*, HRESULT)).call(ulflags, lpprestriction, lppcontainerlist, lpulsearchstate)
  end
  def create_message(lpinterface : Guid*, ulflags : UInt32, lppmessage : IMessage*) : HRESULT
    @lpVtbl.value.create_message.unsafe_as(Proc(Guid*, UInt32, IMessage*, HRESULT)).call(lpinterface, ulflags, lppmessage)
  end
  def copy_messages(lpmsglist : SBinaryArray*, lpinterface : Guid*, lpdestfolder : Void*, uluiparam : LibC::UINT_PTR, lpprogress : IMAPIProgress, ulflags : UInt32) : HRESULT
    @lpVtbl.value.copy_messages.unsafe_as(Proc(SBinaryArray*, Guid*, Void*, LibC::UINT_PTR, IMAPIProgress, UInt32, HRESULT)).call(lpmsglist, lpinterface, lpdestfolder, uluiparam, lpprogress, ulflags)
  end
  def delete_messages(lpmsglist : SBinaryArray*, uluiparam : LibC::UINT_PTR, lpprogress : IMAPIProgress, ulflags : UInt32) : HRESULT
    @lpVtbl.value.delete_messages.unsafe_as(Proc(SBinaryArray*, LibC::UINT_PTR, IMAPIProgress, UInt32, HRESULT)).call(lpmsglist, uluiparam, lpprogress, ulflags)
  end
  def create_folder(ulfoldertype : UInt32, lpszfoldername : Int8*, lpszfoldercomment : Int8*, lpinterface : Guid*, ulflags : UInt32, lppfolder : IMAPIFolder*) : HRESULT
    @lpVtbl.value.create_folder.unsafe_as(Proc(UInt32, Int8*, Int8*, Guid*, UInt32, IMAPIFolder*, HRESULT)).call(ulfoldertype, lpszfoldername, lpszfoldercomment, lpinterface, ulflags, lppfolder)
  end
  def copy_folder(cbentryid : UInt32, lpentryid : ENTRYID*, lpinterface : Guid*, lpdestfolder : Void*, lpsznewfoldername : Int8*, uluiparam : LibC::UINT_PTR, lpprogress : IMAPIProgress, ulflags : UInt32) : HRESULT
    @lpVtbl.value.copy_folder.unsafe_as(Proc(UInt32, ENTRYID*, Guid*, Void*, Int8*, LibC::UINT_PTR, IMAPIProgress, UInt32, HRESULT)).call(cbentryid, lpentryid, lpinterface, lpdestfolder, lpsznewfoldername, uluiparam, lpprogress, ulflags)
  end
  def delete_folder(cbentryid : UInt32, lpentryid : ENTRYID*, uluiparam : LibC::UINT_PTR, lpprogress : IMAPIProgress, ulflags : UInt32) : HRESULT
    @lpVtbl.value.delete_folder.unsafe_as(Proc(UInt32, ENTRYID*, LibC::UINT_PTR, IMAPIProgress, UInt32, HRESULT)).call(cbentryid, lpentryid, uluiparam, lpprogress, ulflags)
  end
  def set_read_flags(lpmsglist : SBinaryArray*, uluiparam : LibC::UINT_PTR, lpprogress : IMAPIProgress, ulflags : UInt32) : HRESULT
    @lpVtbl.value.set_read_flags.unsafe_as(Proc(SBinaryArray*, LibC::UINT_PTR, IMAPIProgress, UInt32, HRESULT)).call(lpmsglist, uluiparam, lpprogress, ulflags)
  end
  def get_message_status(cbentryid : UInt32, lpentryid : ENTRYID*, ulflags : UInt32, lpulmessagestatus : UInt32*) : HRESULT
    @lpVtbl.value.get_message_status.unsafe_as(Proc(UInt32, ENTRYID*, UInt32, UInt32*, HRESULT)).call(cbentryid, lpentryid, ulflags, lpulmessagestatus)
  end
  def set_message_status(cbentryid : UInt32, lpentryid : ENTRYID*, ulnewstatus : UInt32, ulnewstatusmask : UInt32, lpuloldstatus : UInt32*) : HRESULT
    @lpVtbl.value.set_message_status.unsafe_as(Proc(UInt32, ENTRYID*, UInt32, UInt32, UInt32*, HRESULT)).call(cbentryid, lpentryid, ulnewstatus, ulnewstatusmask, lpuloldstatus)
  end
  def save_contents_sort(lpsortcriteria : SSortOrderSet*, ulflags : UInt32) : HRESULT
    @lpVtbl.value.save_contents_sort.unsafe_as(Proc(SSortOrderSet*, UInt32, HRESULT)).call(lpsortcriteria, ulflags)
  end
  def empty_folder(uluiparam : LibC::UINT_PTR, lpprogress : IMAPIProgress, ulflags : UInt32) : HRESULT
    @lpVtbl.value.empty_folder.unsafe_as(Proc(LibC::UINT_PTR, IMAPIProgress, UInt32, HRESULT)).call(uluiparam, lpprogress, ulflags)
  end
end
struct LibWin32::IMsgStore
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_last_error(hresult : HRESULT, ulflags : UInt32, lppmapierror : MAPIERROR**) : HRESULT
    @lpVtbl.value.get_last_error.unsafe_as(Proc(HRESULT, UInt32, MAPIERROR**, HRESULT)).call(hresult, ulflags, lppmapierror)
  end
  def save_changes(ulflags : UInt32) : HRESULT
    @lpVtbl.value.save_changes.unsafe_as(Proc(UInt32, HRESULT)).call(ulflags)
  end
  def get_props(lpproptagarray : SPropTagArray*, ulflags : UInt32, lpcvalues : UInt32*, lppproparray : SPropValue**) : HRESULT
    @lpVtbl.value.get_props.unsafe_as(Proc(SPropTagArray*, UInt32, UInt32*, SPropValue**, HRESULT)).call(lpproptagarray, ulflags, lpcvalues, lppproparray)
  end
  def get_prop_list(ulflags : UInt32, lppproptagarray : SPropTagArray**) : HRESULT
    @lpVtbl.value.get_prop_list.unsafe_as(Proc(UInt32, SPropTagArray**, HRESULT)).call(ulflags, lppproptagarray)
  end
  def open_property(ulproptag : UInt32, lpiid : Guid*, ulinterfaceoptions : UInt32, ulflags : UInt32, lppunk : IUnknown*) : HRESULT
    @lpVtbl.value.open_property.unsafe_as(Proc(UInt32, Guid*, UInt32, UInt32, IUnknown*, HRESULT)).call(ulproptag, lpiid, ulinterfaceoptions, ulflags, lppunk)
  end
  def set_props(cvalues : UInt32, lpproparray : SPropValue*, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.set_props.unsafe_as(Proc(UInt32, SPropValue*, SPropProblemArray**, HRESULT)).call(cvalues, lpproparray, lppproblems)
  end
  def delete_props(lpproptagarray : SPropTagArray*, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.delete_props.unsafe_as(Proc(SPropTagArray*, SPropProblemArray**, HRESULT)).call(lpproptagarray, lppproblems)
  end
  def copy_to(ciidexclude : UInt32, rgiidexclude : Guid*, lpexcludeprops : SPropTagArray*, uluiparam : LibC::UINT_PTR, lpprogress : IMAPIProgress, lpinterface : Guid*, lpdestobj : Void*, ulflags : UInt32, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.copy_to.unsafe_as(Proc(UInt32, Guid*, SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)).call(ciidexclude, rgiidexclude, lpexcludeprops, uluiparam, lpprogress, lpinterface, lpdestobj, ulflags, lppproblems)
  end
  def copy_props(lpincludeprops : SPropTagArray*, uluiparam : LibC::UINT_PTR, lpprogress : IMAPIProgress, lpinterface : Guid*, lpdestobj : Void*, ulflags : UInt32, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.copy_props.unsafe_as(Proc(SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)).call(lpincludeprops, uluiparam, lpprogress, lpinterface, lpdestobj, ulflags, lppproblems)
  end
  def get_names_from_i_ds(lppproptags : SPropTagArray**, lppropsetguid : Guid*, ulflags : UInt32, lpcpropnames : UInt32*, lppppropnames : MAPINAMEID***) : HRESULT
    @lpVtbl.value.get_names_from_i_ds.unsafe_as(Proc(SPropTagArray**, Guid*, UInt32, UInt32*, MAPINAMEID***, HRESULT)).call(lppproptags, lppropsetguid, ulflags, lpcpropnames, lppppropnames)
  end
  def get_i_ds_from_names(cpropnames : UInt32, lpppropnames : MAPINAMEID**, ulflags : UInt32, lppproptags : SPropTagArray**) : HRESULT
    @lpVtbl.value.get_i_ds_from_names.unsafe_as(Proc(UInt32, MAPINAMEID**, UInt32, SPropTagArray**, HRESULT)).call(cpropnames, lpppropnames, ulflags, lppproptags)
  end
  def advise(cbentryid : UInt32, lpentryid : ENTRYID*, uleventmask : UInt32, lpadvisesink : IMAPIAdviseSink, lpulconnection : UInt32*) : HRESULT
    @lpVtbl.value.advise.unsafe_as(Proc(UInt32, ENTRYID*, UInt32, IMAPIAdviseSink, UInt32*, HRESULT)).call(cbentryid, lpentryid, uleventmask, lpadvisesink, lpulconnection)
  end
  def unadvise(ulconnection : UInt32) : HRESULT
    @lpVtbl.value.unadvise.unsafe_as(Proc(UInt32, HRESULT)).call(ulconnection)
  end
  def compare_entry_i_ds(cbentryid1 : UInt32, lpentryid1 : ENTRYID*, cbentryid2 : UInt32, lpentryid2 : ENTRYID*, ulflags : UInt32, lpulresult : UInt32*) : HRESULT
    @lpVtbl.value.compare_entry_i_ds.unsafe_as(Proc(UInt32, ENTRYID*, UInt32, ENTRYID*, UInt32, UInt32*, HRESULT)).call(cbentryid1, lpentryid1, cbentryid2, lpentryid2, ulflags, lpulresult)
  end
  def open_entry(cbentryid : UInt32, lpentryid : ENTRYID*, lpinterface : Guid*, ulflags : UInt32, lpulobjtype : UInt32*, ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.open_entry.unsafe_as(Proc(UInt32, ENTRYID*, Guid*, UInt32, UInt32*, IUnknown*, HRESULT)).call(cbentryid, lpentryid, lpinterface, ulflags, lpulobjtype, ppunk)
  end
  def set_receive_folder(lpszmessageclass : Int8*, ulflags : UInt32, cbentryid : UInt32, lpentryid : ENTRYID*) : HRESULT
    @lpVtbl.value.set_receive_folder.unsafe_as(Proc(Int8*, UInt32, UInt32, ENTRYID*, HRESULT)).call(lpszmessageclass, ulflags, cbentryid, lpentryid)
  end
  def get_receive_folder(lpszmessageclass : Int8*, ulflags : UInt32, lpcbentryid : UInt32*, lppentryid : ENTRYID**, lppszexplicitclass : Int8**) : HRESULT
    @lpVtbl.value.get_receive_folder.unsafe_as(Proc(Int8*, UInt32, UInt32*, ENTRYID**, Int8**, HRESULT)).call(lpszmessageclass, ulflags, lpcbentryid, lppentryid, lppszexplicitclass)
  end
  def get_receive_folder_table(ulflags : UInt32, lpptable : IMAPITable*) : HRESULT
    @lpVtbl.value.get_receive_folder_table.unsafe_as(Proc(UInt32, IMAPITable*, HRESULT)).call(ulflags, lpptable)
  end
  def store_logoff(lpulflags : UInt32*) : HRESULT
    @lpVtbl.value.store_logoff.unsafe_as(Proc(UInt32*, HRESULT)).call(lpulflags)
  end
  def abort_submit(cbentryid : UInt32, lpentryid : ENTRYID*, ulflags : UInt32) : HRESULT
    @lpVtbl.value.abort_submit.unsafe_as(Proc(UInt32, ENTRYID*, UInt32, HRESULT)).call(cbentryid, lpentryid, ulflags)
  end
  def get_outgoing_queue(ulflags : UInt32, lpptable : IMAPITable*) : HRESULT
    @lpVtbl.value.get_outgoing_queue.unsafe_as(Proc(UInt32, IMAPITable*, HRESULT)).call(ulflags, lpptable)
  end
  def set_lock_state(lpmessage : IMessage, ullockstate : UInt32) : HRESULT
    @lpVtbl.value.set_lock_state.unsafe_as(Proc(IMessage, UInt32, HRESULT)).call(lpmessage, ullockstate)
  end
  def finished_msg(ulflags : UInt32, cbentryid : UInt32, lpentryid : ENTRYID*) : HRESULT
    @lpVtbl.value.finished_msg.unsafe_as(Proc(UInt32, UInt32, ENTRYID*, HRESULT)).call(ulflags, cbentryid, lpentryid)
  end
  def notify_new_mail(lpnotification : NOTIFICATION*) : HRESULT
    @lpVtbl.value.notify_new_mail.unsafe_as(Proc(NOTIFICATION*, HRESULT)).call(lpnotification)
  end
end
struct LibWin32::IMessage
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_last_error(hresult : HRESULT, ulflags : UInt32, lppmapierror : MAPIERROR**) : HRESULT
    @lpVtbl.value.get_last_error.unsafe_as(Proc(HRESULT, UInt32, MAPIERROR**, HRESULT)).call(hresult, ulflags, lppmapierror)
  end
  def save_changes(ulflags : UInt32) : HRESULT
    @lpVtbl.value.save_changes.unsafe_as(Proc(UInt32, HRESULT)).call(ulflags)
  end
  def get_props(lpproptagarray : SPropTagArray*, ulflags : UInt32, lpcvalues : UInt32*, lppproparray : SPropValue**) : HRESULT
    @lpVtbl.value.get_props.unsafe_as(Proc(SPropTagArray*, UInt32, UInt32*, SPropValue**, HRESULT)).call(lpproptagarray, ulflags, lpcvalues, lppproparray)
  end
  def get_prop_list(ulflags : UInt32, lppproptagarray : SPropTagArray**) : HRESULT
    @lpVtbl.value.get_prop_list.unsafe_as(Proc(UInt32, SPropTagArray**, HRESULT)).call(ulflags, lppproptagarray)
  end
  def open_property(ulproptag : UInt32, lpiid : Guid*, ulinterfaceoptions : UInt32, ulflags : UInt32, lppunk : IUnknown*) : HRESULT
    @lpVtbl.value.open_property.unsafe_as(Proc(UInt32, Guid*, UInt32, UInt32, IUnknown*, HRESULT)).call(ulproptag, lpiid, ulinterfaceoptions, ulflags, lppunk)
  end
  def set_props(cvalues : UInt32, lpproparray : SPropValue*, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.set_props.unsafe_as(Proc(UInt32, SPropValue*, SPropProblemArray**, HRESULT)).call(cvalues, lpproparray, lppproblems)
  end
  def delete_props(lpproptagarray : SPropTagArray*, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.delete_props.unsafe_as(Proc(SPropTagArray*, SPropProblemArray**, HRESULT)).call(lpproptagarray, lppproblems)
  end
  def copy_to(ciidexclude : UInt32, rgiidexclude : Guid*, lpexcludeprops : SPropTagArray*, uluiparam : LibC::UINT_PTR, lpprogress : IMAPIProgress, lpinterface : Guid*, lpdestobj : Void*, ulflags : UInt32, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.copy_to.unsafe_as(Proc(UInt32, Guid*, SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)).call(ciidexclude, rgiidexclude, lpexcludeprops, uluiparam, lpprogress, lpinterface, lpdestobj, ulflags, lppproblems)
  end
  def copy_props(lpincludeprops : SPropTagArray*, uluiparam : LibC::UINT_PTR, lpprogress : IMAPIProgress, lpinterface : Guid*, lpdestobj : Void*, ulflags : UInt32, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.copy_props.unsafe_as(Proc(SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)).call(lpincludeprops, uluiparam, lpprogress, lpinterface, lpdestobj, ulflags, lppproblems)
  end
  def get_names_from_i_ds(lppproptags : SPropTagArray**, lppropsetguid : Guid*, ulflags : UInt32, lpcpropnames : UInt32*, lppppropnames : MAPINAMEID***) : HRESULT
    @lpVtbl.value.get_names_from_i_ds.unsafe_as(Proc(SPropTagArray**, Guid*, UInt32, UInt32*, MAPINAMEID***, HRESULT)).call(lppproptags, lppropsetguid, ulflags, lpcpropnames, lppppropnames)
  end
  def get_i_ds_from_names(cpropnames : UInt32, lpppropnames : MAPINAMEID**, ulflags : UInt32, lppproptags : SPropTagArray**) : HRESULT
    @lpVtbl.value.get_i_ds_from_names.unsafe_as(Proc(UInt32, MAPINAMEID**, UInt32, SPropTagArray**, HRESULT)).call(cpropnames, lpppropnames, ulflags, lppproptags)
  end
  def get_attachment_table(ulflags : UInt32, lpptable : IMAPITable*) : HRESULT
    @lpVtbl.value.get_attachment_table.unsafe_as(Proc(UInt32, IMAPITable*, HRESULT)).call(ulflags, lpptable)
  end
  def open_attach(ulattachmentnum : UInt32, lpinterface : Guid*, ulflags : UInt32, lppattach : IAttach*) : HRESULT
    @lpVtbl.value.open_attach.unsafe_as(Proc(UInt32, Guid*, UInt32, IAttach*, HRESULT)).call(ulattachmentnum, lpinterface, ulflags, lppattach)
  end
  def create_attach(lpinterface : Guid*, ulflags : UInt32, lpulattachmentnum : UInt32*, lppattach : IAttach*) : HRESULT
    @lpVtbl.value.create_attach.unsafe_as(Proc(Guid*, UInt32, UInt32*, IAttach*, HRESULT)).call(lpinterface, ulflags, lpulattachmentnum, lppattach)
  end
  def delete_attach(ulattachmentnum : UInt32, uluiparam : LibC::UINT_PTR, lpprogress : IMAPIProgress, ulflags : UInt32) : HRESULT
    @lpVtbl.value.delete_attach.unsafe_as(Proc(UInt32, LibC::UINT_PTR, IMAPIProgress, UInt32, HRESULT)).call(ulattachmentnum, uluiparam, lpprogress, ulflags)
  end
  def get_recipient_table(ulflags : UInt32, lpptable : IMAPITable*) : HRESULT
    @lpVtbl.value.get_recipient_table.unsafe_as(Proc(UInt32, IMAPITable*, HRESULT)).call(ulflags, lpptable)
  end
  def modify_recipients(ulflags : UInt32, lpmods : ADRLIST*) : HRESULT
    @lpVtbl.value.modify_recipients.unsafe_as(Proc(UInt32, ADRLIST*, HRESULT)).call(ulflags, lpmods)
  end
  def submit_message(ulflags : UInt32) : HRESULT
    @lpVtbl.value.submit_message.unsafe_as(Proc(UInt32, HRESULT)).call(ulflags)
  end
  def set_read_flag(ulflags : UInt32) : HRESULT
    @lpVtbl.value.set_read_flag.unsafe_as(Proc(UInt32, HRESULT)).call(ulflags)
  end
end
struct LibWin32::IAttach
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_last_error(hresult : HRESULT, ulflags : UInt32, lppmapierror : MAPIERROR**) : HRESULT
    @lpVtbl.value.get_last_error.unsafe_as(Proc(HRESULT, UInt32, MAPIERROR**, HRESULT)).call(hresult, ulflags, lppmapierror)
  end
  def save_changes(ulflags : UInt32) : HRESULT
    @lpVtbl.value.save_changes.unsafe_as(Proc(UInt32, HRESULT)).call(ulflags)
  end
  def get_props(lpproptagarray : SPropTagArray*, ulflags : UInt32, lpcvalues : UInt32*, lppproparray : SPropValue**) : HRESULT
    @lpVtbl.value.get_props.unsafe_as(Proc(SPropTagArray*, UInt32, UInt32*, SPropValue**, HRESULT)).call(lpproptagarray, ulflags, lpcvalues, lppproparray)
  end
  def get_prop_list(ulflags : UInt32, lppproptagarray : SPropTagArray**) : HRESULT
    @lpVtbl.value.get_prop_list.unsafe_as(Proc(UInt32, SPropTagArray**, HRESULT)).call(ulflags, lppproptagarray)
  end
  def open_property(ulproptag : UInt32, lpiid : Guid*, ulinterfaceoptions : UInt32, ulflags : UInt32, lppunk : IUnknown*) : HRESULT
    @lpVtbl.value.open_property.unsafe_as(Proc(UInt32, Guid*, UInt32, UInt32, IUnknown*, HRESULT)).call(ulproptag, lpiid, ulinterfaceoptions, ulflags, lppunk)
  end
  def set_props(cvalues : UInt32, lpproparray : SPropValue*, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.set_props.unsafe_as(Proc(UInt32, SPropValue*, SPropProblemArray**, HRESULT)).call(cvalues, lpproparray, lppproblems)
  end
  def delete_props(lpproptagarray : SPropTagArray*, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.delete_props.unsafe_as(Proc(SPropTagArray*, SPropProblemArray**, HRESULT)).call(lpproptagarray, lppproblems)
  end
  def copy_to(ciidexclude : UInt32, rgiidexclude : Guid*, lpexcludeprops : SPropTagArray*, uluiparam : LibC::UINT_PTR, lpprogress : IMAPIProgress, lpinterface : Guid*, lpdestobj : Void*, ulflags : UInt32, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.copy_to.unsafe_as(Proc(UInt32, Guid*, SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)).call(ciidexclude, rgiidexclude, lpexcludeprops, uluiparam, lpprogress, lpinterface, lpdestobj, ulflags, lppproblems)
  end
  def copy_props(lpincludeprops : SPropTagArray*, uluiparam : LibC::UINT_PTR, lpprogress : IMAPIProgress, lpinterface : Guid*, lpdestobj : Void*, ulflags : UInt32, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.copy_props.unsafe_as(Proc(SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)).call(lpincludeprops, uluiparam, lpprogress, lpinterface, lpdestobj, ulflags, lppproblems)
  end
  def get_names_from_i_ds(lppproptags : SPropTagArray**, lppropsetguid : Guid*, ulflags : UInt32, lpcpropnames : UInt32*, lppppropnames : MAPINAMEID***) : HRESULT
    @lpVtbl.value.get_names_from_i_ds.unsafe_as(Proc(SPropTagArray**, Guid*, UInt32, UInt32*, MAPINAMEID***, HRESULT)).call(lppproptags, lppropsetguid, ulflags, lpcpropnames, lppppropnames)
  end
  def get_i_ds_from_names(cpropnames : UInt32, lpppropnames : MAPINAMEID**, ulflags : UInt32, lppproptags : SPropTagArray**) : HRESULT
    @lpVtbl.value.get_i_ds_from_names.unsafe_as(Proc(UInt32, MAPINAMEID**, UInt32, SPropTagArray**, HRESULT)).call(cpropnames, lpppropnames, ulflags, lppproptags)
  end
end
struct LibWin32::IMAPIControl
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_last_error(hresult : HRESULT, ulflags : UInt32, lppmapierror : MAPIERROR**) : HRESULT
    @lpVtbl.value.get_last_error.unsafe_as(Proc(HRESULT, UInt32, MAPIERROR**, HRESULT)).call(hresult, ulflags, lppmapierror)
  end
  def activate(ulflags : UInt32, uluiparam : LibC::UINT_PTR) : HRESULT
    @lpVtbl.value.activate.unsafe_as(Proc(UInt32, LibC::UINT_PTR, HRESULT)).call(ulflags, uluiparam)
  end
  def get_state(ulflags : UInt32, lpulstate : UInt32*) : HRESULT
    @lpVtbl.value.get_state.unsafe_as(Proc(UInt32, UInt32*, HRESULT)).call(ulflags, lpulstate)
  end
end
struct LibWin32::IProviderAdmin
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_last_error(hresult : HRESULT, ulflags : UInt32, lppmapierror : MAPIERROR**) : HRESULT
    @lpVtbl.value.get_last_error.unsafe_as(Proc(HRESULT, UInt32, MAPIERROR**, HRESULT)).call(hresult, ulflags, lppmapierror)
  end
  def get_provider_table(ulflags : UInt32, lpptable : IMAPITable*) : HRESULT
    @lpVtbl.value.get_provider_table.unsafe_as(Proc(UInt32, IMAPITable*, HRESULT)).call(ulflags, lpptable)
  end
  def create_provider(lpszprovider : Int8*, cvalues : UInt32, lpprops : SPropValue*, uluiparam : LibC::UINT_PTR, ulflags : UInt32, lpuid : MAPIUID*) : HRESULT
    @lpVtbl.value.create_provider.unsafe_as(Proc(Int8*, UInt32, SPropValue*, LibC::UINT_PTR, UInt32, MAPIUID*, HRESULT)).call(lpszprovider, cvalues, lpprops, uluiparam, ulflags, lpuid)
  end
  def delete_provider(lpuid : MAPIUID*) : HRESULT
    @lpVtbl.value.delete_provider.unsafe_as(Proc(MAPIUID*, HRESULT)).call(lpuid)
  end
  def open_profile_section(lpuid : MAPIUID*, lpinterface : Guid*, ulflags : UInt32, lppprofsect : IProfSect*) : HRESULT
    @lpVtbl.value.open_profile_section.unsafe_as(Proc(MAPIUID*, Guid*, UInt32, IProfSect*, HRESULT)).call(lpuid, lpinterface, ulflags, lppprofsect)
  end
end
struct LibWin32::ITableData
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def hr_get_view(lpssortorderset : SSortOrderSet*, lpfcallerrelease : CALLERRELEASE*, ulcallerdata : UInt32, lppmapitable : IMAPITable*) : HRESULT
    @lpVtbl.value.hr_get_view.unsafe_as(Proc(SSortOrderSet*, CALLERRELEASE*, UInt32, IMAPITable*, HRESULT)).call(lpssortorderset, lpfcallerrelease, ulcallerdata, lppmapitable)
  end
  def hr_modify_row(param0 : SRow*) : HRESULT
    @lpVtbl.value.hr_modify_row.unsafe_as(Proc(SRow*, HRESULT)).call(param0)
  end
  def hr_delete_row(lpspropvalue : SPropValue*) : HRESULT
    @lpVtbl.value.hr_delete_row.unsafe_as(Proc(SPropValue*, HRESULT)).call(lpspropvalue)
  end
  def hr_query_row(lpspropvalue : SPropValue*, lppsrow : SRow**, lpulirow : UInt32*) : HRESULT
    @lpVtbl.value.hr_query_row.unsafe_as(Proc(SPropValue*, SRow**, UInt32*, HRESULT)).call(lpspropvalue, lppsrow, lpulirow)
  end
  def hr_enum_row(ulrownumber : UInt32, lppsrow : SRow**) : HRESULT
    @lpVtbl.value.hr_enum_row.unsafe_as(Proc(UInt32, SRow**, HRESULT)).call(ulrownumber, lppsrow)
  end
  def hr_notify(ulflags : UInt32, cvalues : UInt32, lpspropvalue : SPropValue*) : HRESULT
    @lpVtbl.value.hr_notify.unsafe_as(Proc(UInt32, UInt32, SPropValue*, HRESULT)).call(ulflags, cvalues, lpspropvalue)
  end
  def hr_insert_row(ulirow : UInt32, lpsrow : SRow*) : HRESULT
    @lpVtbl.value.hr_insert_row.unsafe_as(Proc(UInt32, SRow*, HRESULT)).call(ulirow, lpsrow)
  end
  def hr_modify_rows(ulflags : UInt32, lpsrowset : SRowSet*) : HRESULT
    @lpVtbl.value.hr_modify_rows.unsafe_as(Proc(UInt32, SRowSet*, HRESULT)).call(ulflags, lpsrowset)
  end
  def hr_delete_rows(ulflags : UInt32, lprowsettodelete : SRowSet*, crowsdeleted : UInt32*) : HRESULT
    @lpVtbl.value.hr_delete_rows.unsafe_as(Proc(UInt32, SRowSet*, UInt32*, HRESULT)).call(ulflags, lprowsettodelete, crowsdeleted)
  end
end
struct LibWin32::IPropData
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_last_error(hresult : HRESULT, ulflags : UInt32, lppmapierror : MAPIERROR**) : HRESULT
    @lpVtbl.value.get_last_error.unsafe_as(Proc(HRESULT, UInt32, MAPIERROR**, HRESULT)).call(hresult, ulflags, lppmapierror)
  end
  def save_changes(ulflags : UInt32) : HRESULT
    @lpVtbl.value.save_changes.unsafe_as(Proc(UInt32, HRESULT)).call(ulflags)
  end
  def get_props(lpproptagarray : SPropTagArray*, ulflags : UInt32, lpcvalues : UInt32*, lppproparray : SPropValue**) : HRESULT
    @lpVtbl.value.get_props.unsafe_as(Proc(SPropTagArray*, UInt32, UInt32*, SPropValue**, HRESULT)).call(lpproptagarray, ulflags, lpcvalues, lppproparray)
  end
  def get_prop_list(ulflags : UInt32, lppproptagarray : SPropTagArray**) : HRESULT
    @lpVtbl.value.get_prop_list.unsafe_as(Proc(UInt32, SPropTagArray**, HRESULT)).call(ulflags, lppproptagarray)
  end
  def open_property(ulproptag : UInt32, lpiid : Guid*, ulinterfaceoptions : UInt32, ulflags : UInt32, lppunk : IUnknown*) : HRESULT
    @lpVtbl.value.open_property.unsafe_as(Proc(UInt32, Guid*, UInt32, UInt32, IUnknown*, HRESULT)).call(ulproptag, lpiid, ulinterfaceoptions, ulflags, lppunk)
  end
  def set_props(cvalues : UInt32, lpproparray : SPropValue*, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.set_props.unsafe_as(Proc(UInt32, SPropValue*, SPropProblemArray**, HRESULT)).call(cvalues, lpproparray, lppproblems)
  end
  def delete_props(lpproptagarray : SPropTagArray*, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.delete_props.unsafe_as(Proc(SPropTagArray*, SPropProblemArray**, HRESULT)).call(lpproptagarray, lppproblems)
  end
  def copy_to(ciidexclude : UInt32, rgiidexclude : Guid*, lpexcludeprops : SPropTagArray*, uluiparam : LibC::UINT_PTR, lpprogress : IMAPIProgress, lpinterface : Guid*, lpdestobj : Void*, ulflags : UInt32, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.copy_to.unsafe_as(Proc(UInt32, Guid*, SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)).call(ciidexclude, rgiidexclude, lpexcludeprops, uluiparam, lpprogress, lpinterface, lpdestobj, ulflags, lppproblems)
  end
  def copy_props(lpincludeprops : SPropTagArray*, uluiparam : LibC::UINT_PTR, lpprogress : IMAPIProgress, lpinterface : Guid*, lpdestobj : Void*, ulflags : UInt32, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.copy_props.unsafe_as(Proc(SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)).call(lpincludeprops, uluiparam, lpprogress, lpinterface, lpdestobj, ulflags, lppproblems)
  end
  def get_names_from_i_ds(lppproptags : SPropTagArray**, lppropsetguid : Guid*, ulflags : UInt32, lpcpropnames : UInt32*, lppppropnames : MAPINAMEID***) : HRESULT
    @lpVtbl.value.get_names_from_i_ds.unsafe_as(Proc(SPropTagArray**, Guid*, UInt32, UInt32*, MAPINAMEID***, HRESULT)).call(lppproptags, lppropsetguid, ulflags, lpcpropnames, lppppropnames)
  end
  def get_i_ds_from_names(cpropnames : UInt32, lpppropnames : MAPINAMEID**, ulflags : UInt32, lppproptags : SPropTagArray**) : HRESULT
    @lpVtbl.value.get_i_ds_from_names.unsafe_as(Proc(UInt32, MAPINAMEID**, UInt32, SPropTagArray**, HRESULT)).call(cpropnames, lpppropnames, ulflags, lppproptags)
  end
  def hr_set_obj_access(ulaccess : UInt32) : HRESULT
    @lpVtbl.value.hr_set_obj_access.unsafe_as(Proc(UInt32, HRESULT)).call(ulaccess)
  end
  def hr_set_prop_access(lpproptagarray : SPropTagArray*, rgulaccess : UInt32*) : HRESULT
    @lpVtbl.value.hr_set_prop_access.unsafe_as(Proc(SPropTagArray*, UInt32*, HRESULT)).call(lpproptagarray, rgulaccess)
  end
  def hr_get_prop_access(lppproptagarray : SPropTagArray**, lprgulaccess : UInt32**) : HRESULT
    @lpVtbl.value.hr_get_prop_access.unsafe_as(Proc(SPropTagArray**, UInt32**, HRESULT)).call(lppproptagarray, lprgulaccess)
  end
  def hr_add_obj_props(lppproptagarray : SPropTagArray*, lprgulaccess : SPropProblemArray**) : HRESULT
    @lpVtbl.value.hr_add_obj_props.unsafe_as(Proc(SPropTagArray*, SPropProblemArray**, HRESULT)).call(lppproptagarray, lprgulaccess)
  end
end
struct LibWin32::IAddrBook
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_last_error(hresult : HRESULT, ulflags : UInt32, lppmapierror : MAPIERROR**) : HRESULT
    @lpVtbl.value.get_last_error.unsafe_as(Proc(HRESULT, UInt32, MAPIERROR**, HRESULT)).call(hresult, ulflags, lppmapierror)
  end
  def save_changes(ulflags : UInt32) : HRESULT
    @lpVtbl.value.save_changes.unsafe_as(Proc(UInt32, HRESULT)).call(ulflags)
  end
  def get_props(lpproptagarray : SPropTagArray*, ulflags : UInt32, lpcvalues : UInt32*, lppproparray : SPropValue**) : HRESULT
    @lpVtbl.value.get_props.unsafe_as(Proc(SPropTagArray*, UInt32, UInt32*, SPropValue**, HRESULT)).call(lpproptagarray, ulflags, lpcvalues, lppproparray)
  end
  def get_prop_list(ulflags : UInt32, lppproptagarray : SPropTagArray**) : HRESULT
    @lpVtbl.value.get_prop_list.unsafe_as(Proc(UInt32, SPropTagArray**, HRESULT)).call(ulflags, lppproptagarray)
  end
  def open_property(ulproptag : UInt32, lpiid : Guid*, ulinterfaceoptions : UInt32, ulflags : UInt32, lppunk : IUnknown*) : HRESULT
    @lpVtbl.value.open_property.unsafe_as(Proc(UInt32, Guid*, UInt32, UInt32, IUnknown*, HRESULT)).call(ulproptag, lpiid, ulinterfaceoptions, ulflags, lppunk)
  end
  def set_props(cvalues : UInt32, lpproparray : SPropValue*, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.set_props.unsafe_as(Proc(UInt32, SPropValue*, SPropProblemArray**, HRESULT)).call(cvalues, lpproparray, lppproblems)
  end
  def delete_props(lpproptagarray : SPropTagArray*, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.delete_props.unsafe_as(Proc(SPropTagArray*, SPropProblemArray**, HRESULT)).call(lpproptagarray, lppproblems)
  end
  def copy_to(ciidexclude : UInt32, rgiidexclude : Guid*, lpexcludeprops : SPropTagArray*, uluiparam : LibC::UINT_PTR, lpprogress : IMAPIProgress, lpinterface : Guid*, lpdestobj : Void*, ulflags : UInt32, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.copy_to.unsafe_as(Proc(UInt32, Guid*, SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)).call(ciidexclude, rgiidexclude, lpexcludeprops, uluiparam, lpprogress, lpinterface, lpdestobj, ulflags, lppproblems)
  end
  def copy_props(lpincludeprops : SPropTagArray*, uluiparam : LibC::UINT_PTR, lpprogress : IMAPIProgress, lpinterface : Guid*, lpdestobj : Void*, ulflags : UInt32, lppproblems : SPropProblemArray**) : HRESULT
    @lpVtbl.value.copy_props.unsafe_as(Proc(SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)).call(lpincludeprops, uluiparam, lpprogress, lpinterface, lpdestobj, ulflags, lppproblems)
  end
  def get_names_from_i_ds(lppproptags : SPropTagArray**, lppropsetguid : Guid*, ulflags : UInt32, lpcpropnames : UInt32*, lppppropnames : MAPINAMEID***) : HRESULT
    @lpVtbl.value.get_names_from_i_ds.unsafe_as(Proc(SPropTagArray**, Guid*, UInt32, UInt32*, MAPINAMEID***, HRESULT)).call(lppproptags, lppropsetguid, ulflags, lpcpropnames, lppppropnames)
  end
  def get_i_ds_from_names(cpropnames : UInt32, lpppropnames : MAPINAMEID**, ulflags : UInt32, lppproptags : SPropTagArray**) : HRESULT
    @lpVtbl.value.get_i_ds_from_names.unsafe_as(Proc(UInt32, MAPINAMEID**, UInt32, SPropTagArray**, HRESULT)).call(cpropnames, lpppropnames, ulflags, lppproptags)
  end
  def open_entry(cbentryid : UInt32, lpentryid : ENTRYID*, lpinterface : Guid*, ulflags : UInt32, lpulobjtype : UInt32*, lppunk : IUnknown*) : HRESULT
    @lpVtbl.value.open_entry.unsafe_as(Proc(UInt32, ENTRYID*, Guid*, UInt32, UInt32*, IUnknown*, HRESULT)).call(cbentryid, lpentryid, lpinterface, ulflags, lpulobjtype, lppunk)
  end
  def compare_entry_i_ds(cbentryid1 : UInt32, lpentryid1 : ENTRYID*, cbentryid2 : UInt32, lpentryid2 : ENTRYID*, ulflags : UInt32, lpulresult : UInt32*) : HRESULT
    @lpVtbl.value.compare_entry_i_ds.unsafe_as(Proc(UInt32, ENTRYID*, UInt32, ENTRYID*, UInt32, UInt32*, HRESULT)).call(cbentryid1, lpentryid1, cbentryid2, lpentryid2, ulflags, lpulresult)
  end
  def advise(cbentryid : UInt32, lpentryid : ENTRYID*, uleventmask : UInt32, lpadvisesink : IMAPIAdviseSink, lpulconnection : UInt32*) : HRESULT
    @lpVtbl.value.advise.unsafe_as(Proc(UInt32, ENTRYID*, UInt32, IMAPIAdviseSink, UInt32*, HRESULT)).call(cbentryid, lpentryid, uleventmask, lpadvisesink, lpulconnection)
  end
  def unadvise(ulconnection : UInt32) : HRESULT
    @lpVtbl.value.unadvise.unsafe_as(Proc(UInt32, HRESULT)).call(ulconnection)
  end
  def create_one_off(lpszname : Int8*, lpszadrtype : Int8*, lpszaddress : Int8*, ulflags : UInt32, lpcbentryid : UInt32*, lppentryid : ENTRYID**) : HRESULT
    @lpVtbl.value.create_one_off.unsafe_as(Proc(Int8*, Int8*, Int8*, UInt32, UInt32*, ENTRYID**, HRESULT)).call(lpszname, lpszadrtype, lpszaddress, ulflags, lpcbentryid, lppentryid)
  end
  def new_entry(uluiparam : UInt32, ulflags : UInt32, cbeidcontainer : UInt32, lpeidcontainer : ENTRYID*, cbeidnewentrytpl : UInt32, lpeidnewentrytpl : ENTRYID*, lpcbeidnewentry : UInt32*, lppeidnewentry : ENTRYID**) : HRESULT
    @lpVtbl.value.new_entry.unsafe_as(Proc(UInt32, UInt32, UInt32, ENTRYID*, UInt32, ENTRYID*, UInt32*, ENTRYID**, HRESULT)).call(uluiparam, ulflags, cbeidcontainer, lpeidcontainer, cbeidnewentrytpl, lpeidnewentrytpl, lpcbeidnewentry, lppeidnewentry)
  end
  def resolve_name(uluiparam : LibC::UINT_PTR, ulflags : UInt32, lpsznewentrytitle : Int8*, lpadrlist : ADRLIST*) : HRESULT
    @lpVtbl.value.resolve_name.unsafe_as(Proc(LibC::UINT_PTR, UInt32, Int8*, ADRLIST*, HRESULT)).call(uluiparam, ulflags, lpsznewentrytitle, lpadrlist)
  end
  def address(lpuluiparam : UInt32*, lpadrparms : ADRPARM*, lppadrlist : ADRLIST**) : HRESULT
    @lpVtbl.value.address.unsafe_as(Proc(UInt32*, ADRPARM*, ADRLIST**, HRESULT)).call(lpuluiparam, lpadrparms, lppadrlist)
  end
  def details(lpuluiparam : LibC::UINT_PTR*, lpfndismiss : LPFNDISMISS, lpvdismisscontext : Void*, cbentryid : UInt32, lpentryid : ENTRYID*, lpfbuttoncallback : LPFNBUTTON, lpvbuttoncontext : Void*, lpszbuttontext : Int8*, ulflags : UInt32) : HRESULT
    @lpVtbl.value.details.unsafe_as(Proc(LibC::UINT_PTR*, LPFNDISMISS, Void*, UInt32, ENTRYID*, LPFNBUTTON, Void*, Int8*, UInt32, HRESULT)).call(lpuluiparam, lpfndismiss, lpvdismisscontext, cbentryid, lpentryid, lpfbuttoncallback, lpvbuttoncontext, lpszbuttontext, ulflags)
  end
  def recip_options(uluiparam : UInt32, ulflags : UInt32, lprecip : ADRENTRY*) : HRESULT
    @lpVtbl.value.recip_options.unsafe_as(Proc(UInt32, UInt32, ADRENTRY*, HRESULT)).call(uluiparam, ulflags, lprecip)
  end
  def query_default_recip_opt(lpszadrtype : Int8*, ulflags : UInt32, lpcvalues : UInt32*, lppoptions : SPropValue**) : HRESULT
    @lpVtbl.value.query_default_recip_opt.unsafe_as(Proc(Int8*, UInt32, UInt32*, SPropValue**, HRESULT)).call(lpszadrtype, ulflags, lpcvalues, lppoptions)
  end
  def get_pab(lpcbentryid : UInt32*, lppentryid : ENTRYID**) : HRESULT
    @lpVtbl.value.get_pab.unsafe_as(Proc(UInt32*, ENTRYID**, HRESULT)).call(lpcbentryid, lppentryid)
  end
  def set_pab(cbentryid : UInt32, lpentryid : ENTRYID*) : HRESULT
    @lpVtbl.value.set_pab.unsafe_as(Proc(UInt32, ENTRYID*, HRESULT)).call(cbentryid, lpentryid)
  end
  def get_default_dir(lpcbentryid : UInt32*, lppentryid : ENTRYID**) : HRESULT
    @lpVtbl.value.get_default_dir.unsafe_as(Proc(UInt32*, ENTRYID**, HRESULT)).call(lpcbentryid, lppentryid)
  end
  def set_default_dir(cbentryid : UInt32, lpentryid : ENTRYID*) : HRESULT
    @lpVtbl.value.set_default_dir.unsafe_as(Proc(UInt32, ENTRYID*, HRESULT)).call(cbentryid, lpentryid)
  end
  def get_search_path(ulflags : UInt32, lppsearchpath : SRowSet**) : HRESULT
    @lpVtbl.value.get_search_path.unsafe_as(Proc(UInt32, SRowSet**, HRESULT)).call(ulflags, lppsearchpath)
  end
  def set_search_path(ulflags : UInt32, lpsearchpath : SRowSet*) : HRESULT
    @lpVtbl.value.set_search_path.unsafe_as(Proc(UInt32, SRowSet*, HRESULT)).call(ulflags, lpsearchpath)
  end
  def prepare_recips(ulflags : UInt32, lpproptagarray : SPropTagArray*, lpreciplist : ADRLIST*) : HRESULT
    @lpVtbl.value.prepare_recips.unsafe_as(Proc(UInt32, SPropTagArray*, ADRLIST*, HRESULT)).call(ulflags, lpproptagarray, lpreciplist)
  end
end
struct LibWin32::IWABObject
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_last_error(hresult : HRESULT, ulflags : UInt32, lppmapierror : MAPIERROR**) : HRESULT
    @lpVtbl.value.get_last_error.unsafe_as(Proc(HRESULT, UInt32, MAPIERROR**, HRESULT)).call(hresult, ulflags, lppmapierror)
  end
  def allocate_buffer(cbsize : UInt32, lppbuffer : Void**) : HRESULT
    @lpVtbl.value.allocate_buffer.unsafe_as(Proc(UInt32, Void**, HRESULT)).call(cbsize, lppbuffer)
  end
  def allocate_more(cbsize : UInt32, lpobject : Void*, lppbuffer : Void**) : HRESULT
    @lpVtbl.value.allocate_more.unsafe_as(Proc(UInt32, Void*, Void**, HRESULT)).call(cbsize, lpobject, lppbuffer)
  end
  def free_buffer(lpbuffer : Void*) : HRESULT
    @lpVtbl.value.free_buffer.unsafe_as(Proc(Void*, HRESULT)).call(lpbuffer)
  end
  def backup(lpfilename : PSTR) : HRESULT
    @lpVtbl.value.backup.unsafe_as(Proc(PSTR, HRESULT)).call(lpfilename)
  end
  def import(lpwip : PSTR) : HRESULT
    @lpVtbl.value.import.unsafe_as(Proc(PSTR, HRESULT)).call(lpwip)
  end
  def find(lpiab : IAddrBook, hwnd : LibC::HANDLE) : HRESULT
    @lpVtbl.value.find.unsafe_as(Proc(IAddrBook, LibC::HANDLE, HRESULT)).call(lpiab, hwnd)
  end
  def v_card_display(lpiab : IAddrBook, hwnd : LibC::HANDLE, lpszfilename : PSTR) : HRESULT
    @lpVtbl.value.v_card_display.unsafe_as(Proc(IAddrBook, LibC::HANDLE, PSTR, HRESULT)).call(lpiab, hwnd, lpszfilename)
  end
  def ldap_url(lpiab : IAddrBook, hwnd : LibC::HANDLE, ulflags : UInt32, lpszurl : PSTR, lppmailuser : IMailUser*) : HRESULT
    @lpVtbl.value.ldap_url.unsafe_as(Proc(IAddrBook, LibC::HANDLE, UInt32, PSTR, IMailUser*, HRESULT)).call(lpiab, hwnd, ulflags, lpszurl, lppmailuser)
  end
  def v_card_create(lpiab : IAddrBook, ulflags : UInt32, lpszvcard : PSTR, lpmailuser : IMailUser) : HRESULT
    @lpVtbl.value.v_card_create.unsafe_as(Proc(IAddrBook, UInt32, PSTR, IMailUser, HRESULT)).call(lpiab, ulflags, lpszvcard, lpmailuser)
  end
  def v_card_retrieve(lpiab : IAddrBook, ulflags : UInt32, lpszvcard : PSTR, lppmailuser : IMailUser*) : HRESULT
    @lpVtbl.value.v_card_retrieve.unsafe_as(Proc(IAddrBook, UInt32, PSTR, IMailUser*, HRESULT)).call(lpiab, ulflags, lpszvcard, lppmailuser)
  end
  def get_me(lpiab : IAddrBook, ulflags : UInt32, lpdwaction : UInt32*, lpsbeid : SBinary*, hwnd : LibC::HANDLE) : HRESULT
    @lpVtbl.value.get_me.unsafe_as(Proc(IAddrBook, UInt32, UInt32*, SBinary*, LibC::HANDLE, HRESULT)).call(lpiab, ulflags, lpdwaction, lpsbeid, hwnd)
  end
  def set_me(lpiab : IAddrBook, ulflags : UInt32, sbeid : SBinary, hwnd : LibC::HANDLE) : HRESULT
    @lpVtbl.value.set_me.unsafe_as(Proc(IAddrBook, UInt32, SBinary, LibC::HANDLE, HRESULT)).call(lpiab, ulflags, sbeid, hwnd)
  end
end
struct LibWin32::IWABOBJECT_
  def query_interface(riid : Guid*, ppvobj : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobj)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_last_error(hresult : HRESULT, ulflags : UInt32, lppmapierror : MAPIERROR**) : HRESULT
    @lpVtbl.value.get_last_error.unsafe_as(Proc(HRESULT, UInt32, MAPIERROR**, HRESULT)).call(hresult, ulflags, lppmapierror)
  end
  def allocate_buffer(cbsize : UInt32, lppbuffer : Void**) : HRESULT
    @lpVtbl.value.allocate_buffer.unsafe_as(Proc(UInt32, Void**, HRESULT)).call(cbsize, lppbuffer)
  end
  def allocate_more(cbsize : UInt32, lpobject : Void*, lppbuffer : Void**) : HRESULT
    @lpVtbl.value.allocate_more.unsafe_as(Proc(UInt32, Void*, Void**, HRESULT)).call(cbsize, lpobject, lppbuffer)
  end
  def free_buffer(lpbuffer : Void*) : HRESULT
    @lpVtbl.value.free_buffer.unsafe_as(Proc(Void*, HRESULT)).call(lpbuffer)
  end
  def backup(lpfilename : PSTR) : HRESULT
    @lpVtbl.value.backup.unsafe_as(Proc(PSTR, HRESULT)).call(lpfilename)
  end
  def import(lpwip : PSTR) : HRESULT
    @lpVtbl.value.import.unsafe_as(Proc(PSTR, HRESULT)).call(lpwip)
  end
  def find(lpiab : IAddrBook, hwnd : LibC::HANDLE) : HRESULT
    @lpVtbl.value.find.unsafe_as(Proc(IAddrBook, LibC::HANDLE, HRESULT)).call(lpiab, hwnd)
  end
  def v_card_display(lpiab : IAddrBook, hwnd : LibC::HANDLE, lpszfilename : PSTR) : HRESULT
    @lpVtbl.value.v_card_display.unsafe_as(Proc(IAddrBook, LibC::HANDLE, PSTR, HRESULT)).call(lpiab, hwnd, lpszfilename)
  end
  def ldap_url(lpiab : IAddrBook, hwnd : LibC::HANDLE, ulflags : UInt32, lpszurl : PSTR, lppmailuser : IMailUser*) : HRESULT
    @lpVtbl.value.ldap_url.unsafe_as(Proc(IAddrBook, LibC::HANDLE, UInt32, PSTR, IMailUser*, HRESULT)).call(lpiab, hwnd, ulflags, lpszurl, lppmailuser)
  end
  def v_card_create(lpiab : IAddrBook, ulflags : UInt32, lpszvcard : PSTR, lpmailuser : IMailUser) : HRESULT
    @lpVtbl.value.v_card_create.unsafe_as(Proc(IAddrBook, UInt32, PSTR, IMailUser, HRESULT)).call(lpiab, ulflags, lpszvcard, lpmailuser)
  end
  def v_card_retrieve(lpiab : IAddrBook, ulflags : UInt32, lpszvcard : PSTR, lppmailuser : IMailUser*) : HRESULT
    @lpVtbl.value.v_card_retrieve.unsafe_as(Proc(IAddrBook, UInt32, PSTR, IMailUser*, HRESULT)).call(lpiab, ulflags, lpszvcard, lppmailuser)
  end
  def get_me(lpiab : IAddrBook, ulflags : UInt32, lpdwaction : UInt32*, lpsbeid : SBinary*, hwnd : LibC::HANDLE) : HRESULT
    @lpVtbl.value.get_me.unsafe_as(Proc(IAddrBook, UInt32, UInt32*, SBinary*, LibC::HANDLE, HRESULT)).call(lpiab, ulflags, lpdwaction, lpsbeid, hwnd)
  end
  def set_me(lpiab : IAddrBook, ulflags : UInt32, sbeid : SBinary, hwnd : LibC::HANDLE) : HRESULT
    @lpVtbl.value.set_me.unsafe_as(Proc(IAddrBook, UInt32, SBinary, LibC::HANDLE, HRESULT)).call(lpiab, ulflags, sbeid, hwnd)
  end
end
struct LibWin32::IWABExtInit
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initialize(lpwabextdisplay : WABEXTDISPLAY*) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(WABEXTDISPLAY*, HRESULT)).call(lpwabextdisplay)
  end
end
