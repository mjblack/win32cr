require "../foundation.cr"
require "../system/com.cr"
require "../system/com/structuredstorage.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:rtm.dll")]
@[Link(ldflags: "/DELAYLOAD:mapi32.dll")]
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
    query_interface : Proc(IMAPIAdviseSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMAPIAdviseSink*, UInt32)
    release : Proc(IMAPIAdviseSink*, UInt32)
    on_notify : Proc(IMAPIAdviseSink*, UInt32, NOTIFICATION*, UInt32)
  end

  struct IMAPIAdviseSink
    lpVtbl : IMAPIAdviseSinkVTbl*
  end

  struct IMAPIProgressVTbl
    query_interface : Proc(IMAPIProgress*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMAPIProgress*, UInt32)
    release : Proc(IMAPIProgress*, UInt32)
    progress : Proc(IMAPIProgress*, UInt32, UInt32, UInt32, HRESULT)
    get_flags : Proc(IMAPIProgress*, UInt32*, HRESULT)
    get_max : Proc(IMAPIProgress*, UInt32*, HRESULT)
    get_min : Proc(IMAPIProgress*, UInt32*, HRESULT)
    set_limits : Proc(IMAPIProgress*, UInt32*, UInt32*, UInt32*, HRESULT)
  end

  struct IMAPIProgress
    lpVtbl : IMAPIProgressVTbl*
  end

  struct IMAPIPropVTbl
    query_interface : Proc(IMAPIProp*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMAPIProp*, UInt32)
    release : Proc(IMAPIProp*, UInt32)
    get_last_error : Proc(IMAPIProp*, HRESULT, UInt32, MAPIERROR**, HRESULT)
    save_changes : Proc(IMAPIProp*, UInt32, HRESULT)
    get_props : Proc(IMAPIProp*, SPropTagArray*, UInt32, UInt32*, SPropValue**, HRESULT)
    get_prop_list : Proc(IMAPIProp*, UInt32, SPropTagArray**, HRESULT)
    open_property : Proc(IMAPIProp*, UInt32, Guid*, UInt32, UInt32, IUnknown*, HRESULT)
    set_props : Proc(IMAPIProp*, UInt32, SPropValue*, SPropProblemArray**, HRESULT)
    delete_props : Proc(IMAPIProp*, SPropTagArray*, SPropProblemArray**, HRESULT)
    copy_to : Proc(IMAPIProp*, UInt32, Guid*, SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)
    copy_props : Proc(IMAPIProp*, SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)
    get_names_from_i_ds : Proc(IMAPIProp*, SPropTagArray**, Guid*, UInt32, UInt32*, MAPINAMEID***, HRESULT)
    get_i_ds_from_names : Proc(IMAPIProp*, UInt32, MAPINAMEID**, UInt32, SPropTagArray**, HRESULT)
  end

  struct IMAPIProp
    lpVtbl : IMAPIPropVTbl*
  end

  struct IMAPITableVTbl
    query_interface : Proc(IMAPITable*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMAPITable*, UInt32)
    release : Proc(IMAPITable*, UInt32)
    get_last_error : Proc(IMAPITable*, HRESULT, UInt32, MAPIERROR**, HRESULT)
    advise : Proc(IMAPITable*, UInt32, IMAPIAdviseSink, UInt32*, HRESULT)
    unadvise : Proc(IMAPITable*, UInt32, HRESULT)
    get_status : Proc(IMAPITable*, UInt32*, UInt32*, HRESULT)
    set_columns : Proc(IMAPITable*, SPropTagArray*, UInt32, HRESULT)
    query_columns : Proc(IMAPITable*, UInt32, SPropTagArray**, HRESULT)
    get_row_count : Proc(IMAPITable*, UInt32, UInt32*, HRESULT)
    seek_row : Proc(IMAPITable*, UInt32, Int32, Int32*, HRESULT)
    seek_row_approx : Proc(IMAPITable*, UInt32, UInt32, HRESULT)
    query_position : Proc(IMAPITable*, UInt32*, UInt32*, UInt32*, HRESULT)
    find_row : Proc(IMAPITable*, SRestriction*, UInt32, UInt32, HRESULT)
    restrict : Proc(IMAPITable*, SRestriction*, UInt32, HRESULT)
    create_bookmark : Proc(IMAPITable*, UInt32*, HRESULT)
    free_bookmark : Proc(IMAPITable*, UInt32, HRESULT)
    sort_table : Proc(IMAPITable*, SSortOrderSet*, UInt32, HRESULT)
    query_sort_order : Proc(IMAPITable*, SSortOrderSet**, HRESULT)
    query_rows : Proc(IMAPITable*, Int32, UInt32, SRowSet**, HRESULT)
    abort : Proc(IMAPITable*, HRESULT)
    expand_row : Proc(IMAPITable*, UInt32, UInt8*, UInt32, UInt32, SRowSet**, UInt32*, HRESULT)
    collapse_row : Proc(IMAPITable*, UInt32, UInt8*, UInt32, UInt32*, HRESULT)
    wait_for_completion : Proc(IMAPITable*, UInt32, UInt32, UInt32*, HRESULT)
    get_collapse_state : Proc(IMAPITable*, UInt32, UInt32, UInt8*, UInt32*, UInt8**, HRESULT)
    set_collapse_state : Proc(IMAPITable*, UInt32, UInt32, UInt8*, UInt32*, HRESULT)
  end

  struct IMAPITable
    lpVtbl : IMAPITableVTbl*
  end

  struct IProfSectVTbl
    query_interface : Proc(IProfSect*, Guid*, Void**, HRESULT)
    add_ref : Proc(IProfSect*, UInt32)
    release : Proc(IProfSect*, UInt32)
    get_last_error : Proc(IProfSect*, HRESULT, UInt32, MAPIERROR**, HRESULT)
    save_changes : Proc(IProfSect*, UInt32, HRESULT)
    get_props : Proc(IProfSect*, SPropTagArray*, UInt32, UInt32*, SPropValue**, HRESULT)
    get_prop_list : Proc(IProfSect*, UInt32, SPropTagArray**, HRESULT)
    open_property : Proc(IProfSect*, UInt32, Guid*, UInt32, UInt32, IUnknown*, HRESULT)
    set_props : Proc(IProfSect*, UInt32, SPropValue*, SPropProblemArray**, HRESULT)
    delete_props : Proc(IProfSect*, SPropTagArray*, SPropProblemArray**, HRESULT)
    copy_to : Proc(IProfSect*, UInt32, Guid*, SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)
    copy_props : Proc(IProfSect*, SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)
    get_names_from_i_ds : Proc(IProfSect*, SPropTagArray**, Guid*, UInt32, UInt32*, MAPINAMEID***, HRESULT)
    get_i_ds_from_names : Proc(IProfSect*, UInt32, MAPINAMEID**, UInt32, SPropTagArray**, HRESULT)
  end

  struct IProfSect
    lpVtbl : IProfSectVTbl*
  end

  struct IMAPIStatusVTbl
    query_interface : Proc(IMAPIStatus*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMAPIStatus*, UInt32)
    release : Proc(IMAPIStatus*, UInt32)
    get_last_error : Proc(IMAPIStatus*, HRESULT, UInt32, MAPIERROR**, HRESULT)
    save_changes : Proc(IMAPIStatus*, UInt32, HRESULT)
    get_props : Proc(IMAPIStatus*, SPropTagArray*, UInt32, UInt32*, SPropValue**, HRESULT)
    get_prop_list : Proc(IMAPIStatus*, UInt32, SPropTagArray**, HRESULT)
    open_property : Proc(IMAPIStatus*, UInt32, Guid*, UInt32, UInt32, IUnknown*, HRESULT)
    set_props : Proc(IMAPIStatus*, UInt32, SPropValue*, SPropProblemArray**, HRESULT)
    delete_props : Proc(IMAPIStatus*, SPropTagArray*, SPropProblemArray**, HRESULT)
    copy_to : Proc(IMAPIStatus*, UInt32, Guid*, SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)
    copy_props : Proc(IMAPIStatus*, SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)
    get_names_from_i_ds : Proc(IMAPIStatus*, SPropTagArray**, Guid*, UInt32, UInt32*, MAPINAMEID***, HRESULT)
    get_i_ds_from_names : Proc(IMAPIStatus*, UInt32, MAPINAMEID**, UInt32, SPropTagArray**, HRESULT)
    validate_state : Proc(IMAPIStatus*, LibC::UINT_PTR, UInt32, HRESULT)
    settings_dialog : Proc(IMAPIStatus*, LibC::UINT_PTR, UInt32, HRESULT)
    change_password : Proc(IMAPIStatus*, Int8*, Int8*, UInt32, HRESULT)
    flush_queues : Proc(IMAPIStatus*, LibC::UINT_PTR, UInt32, ENTRYID*, UInt32, HRESULT)
  end

  struct IMAPIStatus
    lpVtbl : IMAPIStatusVTbl*
  end

  struct IMAPIContainerVTbl
    query_interface : Proc(IMAPIContainer*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMAPIContainer*, UInt32)
    release : Proc(IMAPIContainer*, UInt32)
    get_last_error : Proc(IMAPIContainer*, HRESULT, UInt32, MAPIERROR**, HRESULT)
    save_changes : Proc(IMAPIContainer*, UInt32, HRESULT)
    get_props : Proc(IMAPIContainer*, SPropTagArray*, UInt32, UInt32*, SPropValue**, HRESULT)
    get_prop_list : Proc(IMAPIContainer*, UInt32, SPropTagArray**, HRESULT)
    open_property : Proc(IMAPIContainer*, UInt32, Guid*, UInt32, UInt32, IUnknown*, HRESULT)
    set_props : Proc(IMAPIContainer*, UInt32, SPropValue*, SPropProblemArray**, HRESULT)
    delete_props : Proc(IMAPIContainer*, SPropTagArray*, SPropProblemArray**, HRESULT)
    copy_to : Proc(IMAPIContainer*, UInt32, Guid*, SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)
    copy_props : Proc(IMAPIContainer*, SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)
    get_names_from_i_ds : Proc(IMAPIContainer*, SPropTagArray**, Guid*, UInt32, UInt32*, MAPINAMEID***, HRESULT)
    get_i_ds_from_names : Proc(IMAPIContainer*, UInt32, MAPINAMEID**, UInt32, SPropTagArray**, HRESULT)
    get_contents_table : Proc(IMAPIContainer*, UInt32, IMAPITable*, HRESULT)
    get_hierarchy_table : Proc(IMAPIContainer*, UInt32, IMAPITable*, HRESULT)
    open_entry : Proc(IMAPIContainer*, UInt32, ENTRYID*, Guid*, UInt32, UInt32*, IUnknown*, HRESULT)
    set_search_criteria : Proc(IMAPIContainer*, SRestriction*, SBinaryArray*, UInt32, HRESULT)
    get_search_criteria : Proc(IMAPIContainer*, UInt32, SRestriction**, SBinaryArray**, UInt32*, HRESULT)
  end

  struct IMAPIContainer
    lpVtbl : IMAPIContainerVTbl*
  end

  struct IABContainerVTbl
    query_interface : Proc(IABContainer*, Guid*, Void**, HRESULT)
    add_ref : Proc(IABContainer*, UInt32)
    release : Proc(IABContainer*, UInt32)
    get_last_error : Proc(IABContainer*, HRESULT, UInt32, MAPIERROR**, HRESULT)
    save_changes : Proc(IABContainer*, UInt32, HRESULT)
    get_props : Proc(IABContainer*, SPropTagArray*, UInt32, UInt32*, SPropValue**, HRESULT)
    get_prop_list : Proc(IABContainer*, UInt32, SPropTagArray**, HRESULT)
    open_property : Proc(IABContainer*, UInt32, Guid*, UInt32, UInt32, IUnknown*, HRESULT)
    set_props : Proc(IABContainer*, UInt32, SPropValue*, SPropProblemArray**, HRESULT)
    delete_props : Proc(IABContainer*, SPropTagArray*, SPropProblemArray**, HRESULT)
    copy_to : Proc(IABContainer*, UInt32, Guid*, SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)
    copy_props : Proc(IABContainer*, SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)
    get_names_from_i_ds : Proc(IABContainer*, SPropTagArray**, Guid*, UInt32, UInt32*, MAPINAMEID***, HRESULT)
    get_i_ds_from_names : Proc(IABContainer*, UInt32, MAPINAMEID**, UInt32, SPropTagArray**, HRESULT)
    get_contents_table : Proc(IABContainer*, UInt32, IMAPITable*, HRESULT)
    get_hierarchy_table : Proc(IABContainer*, UInt32, IMAPITable*, HRESULT)
    open_entry : Proc(IABContainer*, UInt32, ENTRYID*, Guid*, UInt32, UInt32*, IUnknown*, HRESULT)
    set_search_criteria : Proc(IABContainer*, SRestriction*, SBinaryArray*, UInt32, HRESULT)
    get_search_criteria : Proc(IABContainer*, UInt32, SRestriction**, SBinaryArray**, UInt32*, HRESULT)
    create_entry : Proc(IABContainer*, UInt32, ENTRYID*, UInt32, IMAPIProp*, HRESULT)
    copy_entries : Proc(IABContainer*, SBinaryArray*, LibC::UINT_PTR, IMAPIProgress, UInt32, HRESULT)
    delete_entries : Proc(IABContainer*, SBinaryArray*, UInt32, HRESULT)
    resolve_names : Proc(IABContainer*, SPropTagArray*, UInt32, ADRLIST*, Flaglist*, HRESULT)
  end

  struct IABContainer
    lpVtbl : IABContainerVTbl*
  end

  struct IMailUserVTbl
    query_interface : Proc(IMailUser*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMailUser*, UInt32)
    release : Proc(IMailUser*, UInt32)
    get_last_error : Proc(IMailUser*, HRESULT, UInt32, MAPIERROR**, HRESULT)
    save_changes : Proc(IMailUser*, UInt32, HRESULT)
    get_props : Proc(IMailUser*, SPropTagArray*, UInt32, UInt32*, SPropValue**, HRESULT)
    get_prop_list : Proc(IMailUser*, UInt32, SPropTagArray**, HRESULT)
    open_property : Proc(IMailUser*, UInt32, Guid*, UInt32, UInt32, IUnknown*, HRESULT)
    set_props : Proc(IMailUser*, UInt32, SPropValue*, SPropProblemArray**, HRESULT)
    delete_props : Proc(IMailUser*, SPropTagArray*, SPropProblemArray**, HRESULT)
    copy_to : Proc(IMailUser*, UInt32, Guid*, SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)
    copy_props : Proc(IMailUser*, SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)
    get_names_from_i_ds : Proc(IMailUser*, SPropTagArray**, Guid*, UInt32, UInt32*, MAPINAMEID***, HRESULT)
    get_i_ds_from_names : Proc(IMailUser*, UInt32, MAPINAMEID**, UInt32, SPropTagArray**, HRESULT)
  end

  struct IMailUser
    lpVtbl : IMailUserVTbl*
  end

  struct IDistListVTbl
    query_interface : Proc(IDistList*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDistList*, UInt32)
    release : Proc(IDistList*, UInt32)
    get_last_error : Proc(IDistList*, HRESULT, UInt32, MAPIERROR**, HRESULT)
    save_changes : Proc(IDistList*, UInt32, HRESULT)
    get_props : Proc(IDistList*, SPropTagArray*, UInt32, UInt32*, SPropValue**, HRESULT)
    get_prop_list : Proc(IDistList*, UInt32, SPropTagArray**, HRESULT)
    open_property : Proc(IDistList*, UInt32, Guid*, UInt32, UInt32, IUnknown*, HRESULT)
    set_props : Proc(IDistList*, UInt32, SPropValue*, SPropProblemArray**, HRESULT)
    delete_props : Proc(IDistList*, SPropTagArray*, SPropProblemArray**, HRESULT)
    copy_to : Proc(IDistList*, UInt32, Guid*, SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)
    copy_props : Proc(IDistList*, SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)
    get_names_from_i_ds : Proc(IDistList*, SPropTagArray**, Guid*, UInt32, UInt32*, MAPINAMEID***, HRESULT)
    get_i_ds_from_names : Proc(IDistList*, UInt32, MAPINAMEID**, UInt32, SPropTagArray**, HRESULT)
    get_contents_table : Proc(IDistList*, UInt32, IMAPITable*, HRESULT)
    get_hierarchy_table : Proc(IDistList*, UInt32, IMAPITable*, HRESULT)
    open_entry : Proc(IDistList*, UInt32, ENTRYID*, Guid*, UInt32, UInt32*, IUnknown*, HRESULT)
    set_search_criteria : Proc(IDistList*, SRestriction*, SBinaryArray*, UInt32, HRESULT)
    get_search_criteria : Proc(IDistList*, UInt32, SRestriction**, SBinaryArray**, UInt32*, HRESULT)
    create_entry : Proc(IDistList*, UInt32, ENTRYID*, UInt32, IMAPIProp*, HRESULT)
    copy_entries : Proc(IDistList*, SBinaryArray*, LibC::UINT_PTR, IMAPIProgress, UInt32, HRESULT)
    delete_entries : Proc(IDistList*, SBinaryArray*, UInt32, HRESULT)
    resolve_names : Proc(IDistList*, SPropTagArray*, UInt32, ADRLIST*, Flaglist*, HRESULT)
  end

  struct IDistList
    lpVtbl : IDistListVTbl*
  end

  struct IMAPIFolderVTbl
    query_interface : Proc(IMAPIFolder*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMAPIFolder*, UInt32)
    release : Proc(IMAPIFolder*, UInt32)
    get_last_error : Proc(IMAPIFolder*, HRESULT, UInt32, MAPIERROR**, HRESULT)
    save_changes : Proc(IMAPIFolder*, UInt32, HRESULT)
    get_props : Proc(IMAPIFolder*, SPropTagArray*, UInt32, UInt32*, SPropValue**, HRESULT)
    get_prop_list : Proc(IMAPIFolder*, UInt32, SPropTagArray**, HRESULT)
    open_property : Proc(IMAPIFolder*, UInt32, Guid*, UInt32, UInt32, IUnknown*, HRESULT)
    set_props : Proc(IMAPIFolder*, UInt32, SPropValue*, SPropProblemArray**, HRESULT)
    delete_props : Proc(IMAPIFolder*, SPropTagArray*, SPropProblemArray**, HRESULT)
    copy_to : Proc(IMAPIFolder*, UInt32, Guid*, SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)
    copy_props : Proc(IMAPIFolder*, SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)
    get_names_from_i_ds : Proc(IMAPIFolder*, SPropTagArray**, Guid*, UInt32, UInt32*, MAPINAMEID***, HRESULT)
    get_i_ds_from_names : Proc(IMAPIFolder*, UInt32, MAPINAMEID**, UInt32, SPropTagArray**, HRESULT)
    get_contents_table : Proc(IMAPIFolder*, UInt32, IMAPITable*, HRESULT)
    get_hierarchy_table : Proc(IMAPIFolder*, UInt32, IMAPITable*, HRESULT)
    open_entry : Proc(IMAPIFolder*, UInt32, ENTRYID*, Guid*, UInt32, UInt32*, IUnknown*, HRESULT)
    set_search_criteria : Proc(IMAPIFolder*, SRestriction*, SBinaryArray*, UInt32, HRESULT)
    get_search_criteria : Proc(IMAPIFolder*, UInt32, SRestriction**, SBinaryArray**, UInt32*, HRESULT)
    create_message : Proc(IMAPIFolder*, Guid*, UInt32, IMessage*, HRESULT)
    copy_messages : Proc(IMAPIFolder*, SBinaryArray*, Guid*, Void*, LibC::UINT_PTR, IMAPIProgress, UInt32, HRESULT)
    delete_messages : Proc(IMAPIFolder*, SBinaryArray*, LibC::UINT_PTR, IMAPIProgress, UInt32, HRESULT)
    create_folder : Proc(IMAPIFolder*, UInt32, Int8*, Int8*, Guid*, UInt32, IMAPIFolder*, HRESULT)
    copy_folder : Proc(IMAPIFolder*, UInt32, ENTRYID*, Guid*, Void*, Int8*, LibC::UINT_PTR, IMAPIProgress, UInt32, HRESULT)
    delete_folder : Proc(IMAPIFolder*, UInt32, ENTRYID*, LibC::UINT_PTR, IMAPIProgress, UInt32, HRESULT)
    set_read_flags : Proc(IMAPIFolder*, SBinaryArray*, LibC::UINT_PTR, IMAPIProgress, UInt32, HRESULT)
    get_message_status : Proc(IMAPIFolder*, UInt32, ENTRYID*, UInt32, UInt32*, HRESULT)
    set_message_status : Proc(IMAPIFolder*, UInt32, ENTRYID*, UInt32, UInt32, UInt32*, HRESULT)
    save_contents_sort : Proc(IMAPIFolder*, SSortOrderSet*, UInt32, HRESULT)
    empty_folder : Proc(IMAPIFolder*, LibC::UINT_PTR, IMAPIProgress, UInt32, HRESULT)
  end

  struct IMAPIFolder
    lpVtbl : IMAPIFolderVTbl*
  end

  struct IMsgStoreVTbl
    query_interface : Proc(IMsgStore*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMsgStore*, UInt32)
    release : Proc(IMsgStore*, UInt32)
    get_last_error : Proc(IMsgStore*, HRESULT, UInt32, MAPIERROR**, HRESULT)
    save_changes : Proc(IMsgStore*, UInt32, HRESULT)
    get_props : Proc(IMsgStore*, SPropTagArray*, UInt32, UInt32*, SPropValue**, HRESULT)
    get_prop_list : Proc(IMsgStore*, UInt32, SPropTagArray**, HRESULT)
    open_property : Proc(IMsgStore*, UInt32, Guid*, UInt32, UInt32, IUnknown*, HRESULT)
    set_props : Proc(IMsgStore*, UInt32, SPropValue*, SPropProblemArray**, HRESULT)
    delete_props : Proc(IMsgStore*, SPropTagArray*, SPropProblemArray**, HRESULT)
    copy_to : Proc(IMsgStore*, UInt32, Guid*, SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)
    copy_props : Proc(IMsgStore*, SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)
    get_names_from_i_ds : Proc(IMsgStore*, SPropTagArray**, Guid*, UInt32, UInt32*, MAPINAMEID***, HRESULT)
    get_i_ds_from_names : Proc(IMsgStore*, UInt32, MAPINAMEID**, UInt32, SPropTagArray**, HRESULT)
    advise : Proc(IMsgStore*, UInt32, ENTRYID*, UInt32, IMAPIAdviseSink, UInt32*, HRESULT)
    unadvise : Proc(IMsgStore*, UInt32, HRESULT)
    compare_entry_i_ds : Proc(IMsgStore*, UInt32, ENTRYID*, UInt32, ENTRYID*, UInt32, UInt32*, HRESULT)
    open_entry : Proc(IMsgStore*, UInt32, ENTRYID*, Guid*, UInt32, UInt32*, IUnknown*, HRESULT)
    set_receive_folder : Proc(IMsgStore*, Int8*, UInt32, UInt32, ENTRYID*, HRESULT)
    get_receive_folder : Proc(IMsgStore*, Int8*, UInt32, UInt32*, ENTRYID**, Int8**, HRESULT)
    get_receive_folder_table : Proc(IMsgStore*, UInt32, IMAPITable*, HRESULT)
    store_logoff : Proc(IMsgStore*, UInt32*, HRESULT)
    abort_submit : Proc(IMsgStore*, UInt32, ENTRYID*, UInt32, HRESULT)
    get_outgoing_queue : Proc(IMsgStore*, UInt32, IMAPITable*, HRESULT)
    set_lock_state : Proc(IMsgStore*, IMessage, UInt32, HRESULT)
    finished_msg : Proc(IMsgStore*, UInt32, UInt32, ENTRYID*, HRESULT)
    notify_new_mail : Proc(IMsgStore*, NOTIFICATION*, HRESULT)
  end

  struct IMsgStore
    lpVtbl : IMsgStoreVTbl*
  end

  struct IMessageVTbl
    query_interface : Proc(IMessage*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMessage*, UInt32)
    release : Proc(IMessage*, UInt32)
    get_last_error : Proc(IMessage*, HRESULT, UInt32, MAPIERROR**, HRESULT)
    save_changes : Proc(IMessage*, UInt32, HRESULT)
    get_props : Proc(IMessage*, SPropTagArray*, UInt32, UInt32*, SPropValue**, HRESULT)
    get_prop_list : Proc(IMessage*, UInt32, SPropTagArray**, HRESULT)
    open_property : Proc(IMessage*, UInt32, Guid*, UInt32, UInt32, IUnknown*, HRESULT)
    set_props : Proc(IMessage*, UInt32, SPropValue*, SPropProblemArray**, HRESULT)
    delete_props : Proc(IMessage*, SPropTagArray*, SPropProblemArray**, HRESULT)
    copy_to : Proc(IMessage*, UInt32, Guid*, SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)
    copy_props : Proc(IMessage*, SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)
    get_names_from_i_ds : Proc(IMessage*, SPropTagArray**, Guid*, UInt32, UInt32*, MAPINAMEID***, HRESULT)
    get_i_ds_from_names : Proc(IMessage*, UInt32, MAPINAMEID**, UInt32, SPropTagArray**, HRESULT)
    get_attachment_table : Proc(IMessage*, UInt32, IMAPITable*, HRESULT)
    open_attach : Proc(IMessage*, UInt32, Guid*, UInt32, IAttach*, HRESULT)
    create_attach : Proc(IMessage*, Guid*, UInt32, UInt32*, IAttach*, HRESULT)
    delete_attach : Proc(IMessage*, UInt32, LibC::UINT_PTR, IMAPIProgress, UInt32, HRESULT)
    get_recipient_table : Proc(IMessage*, UInt32, IMAPITable*, HRESULT)
    modify_recipients : Proc(IMessage*, UInt32, ADRLIST*, HRESULT)
    submit_message : Proc(IMessage*, UInt32, HRESULT)
    set_read_flag : Proc(IMessage*, UInt32, HRESULT)
  end

  struct IMessage
    lpVtbl : IMessageVTbl*
  end

  struct IAttachVTbl
    query_interface : Proc(IAttach*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAttach*, UInt32)
    release : Proc(IAttach*, UInt32)
    get_last_error : Proc(IAttach*, HRESULT, UInt32, MAPIERROR**, HRESULT)
    save_changes : Proc(IAttach*, UInt32, HRESULT)
    get_props : Proc(IAttach*, SPropTagArray*, UInt32, UInt32*, SPropValue**, HRESULT)
    get_prop_list : Proc(IAttach*, UInt32, SPropTagArray**, HRESULT)
    open_property : Proc(IAttach*, UInt32, Guid*, UInt32, UInt32, IUnknown*, HRESULT)
    set_props : Proc(IAttach*, UInt32, SPropValue*, SPropProblemArray**, HRESULT)
    delete_props : Proc(IAttach*, SPropTagArray*, SPropProblemArray**, HRESULT)
    copy_to : Proc(IAttach*, UInt32, Guid*, SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)
    copy_props : Proc(IAttach*, SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)
    get_names_from_i_ds : Proc(IAttach*, SPropTagArray**, Guid*, UInt32, UInt32*, MAPINAMEID***, HRESULT)
    get_i_ds_from_names : Proc(IAttach*, UInt32, MAPINAMEID**, UInt32, SPropTagArray**, HRESULT)
  end

  struct IAttach
    lpVtbl : IAttachVTbl*
  end

  struct IMAPIControlVTbl
    query_interface : Proc(IMAPIControl*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMAPIControl*, UInt32)
    release : Proc(IMAPIControl*, UInt32)
    get_last_error : Proc(IMAPIControl*, HRESULT, UInt32, MAPIERROR**, HRESULT)
    activate : Proc(IMAPIControl*, UInt32, LibC::UINT_PTR, HRESULT)
    get_state : Proc(IMAPIControl*, UInt32, UInt32*, HRESULT)
  end

  struct IMAPIControl
    lpVtbl : IMAPIControlVTbl*
  end

  struct IProviderAdminVTbl
    query_interface : Proc(IProviderAdmin*, Guid*, Void**, HRESULT)
    add_ref : Proc(IProviderAdmin*, UInt32)
    release : Proc(IProviderAdmin*, UInt32)
    get_last_error : Proc(IProviderAdmin*, HRESULT, UInt32, MAPIERROR**, HRESULT)
    get_provider_table : Proc(IProviderAdmin*, UInt32, IMAPITable*, HRESULT)
    create_provider : Proc(IProviderAdmin*, Int8*, UInt32, SPropValue*, LibC::UINT_PTR, UInt32, MAPIUID*, HRESULT)
    delete_provider : Proc(IProviderAdmin*, MAPIUID*, HRESULT)
    open_profile_section : Proc(IProviderAdmin*, MAPIUID*, Guid*, UInt32, IProfSect*, HRESULT)
  end

  struct IProviderAdmin
    lpVtbl : IProviderAdminVTbl*
  end

  struct ITableDataVTbl
    query_interface : Proc(ITableData*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITableData*, UInt32)
    release : Proc(ITableData*, UInt32)
    hr_get_view : Proc(ITableData*, SSortOrderSet*, CALLERRELEASE*, UInt32, IMAPITable*, HRESULT)
    hr_modify_row : Proc(ITableData*, SRow*, HRESULT)
    hr_delete_row : Proc(ITableData*, SPropValue*, HRESULT)
    hr_query_row : Proc(ITableData*, SPropValue*, SRow**, UInt32*, HRESULT)
    hr_enum_row : Proc(ITableData*, UInt32, SRow**, HRESULT)
    hr_notify : Proc(ITableData*, UInt32, UInt32, SPropValue*, HRESULT)
    hr_insert_row : Proc(ITableData*, UInt32, SRow*, HRESULT)
    hr_modify_rows : Proc(ITableData*, UInt32, SRowSet*, HRESULT)
    hr_delete_rows : Proc(ITableData*, UInt32, SRowSet*, UInt32*, HRESULT)
  end

  struct ITableData
    lpVtbl : ITableDataVTbl*
  end

  struct IPropDataVTbl
    query_interface : Proc(IPropData*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPropData*, UInt32)
    release : Proc(IPropData*, UInt32)
    get_last_error : Proc(IPropData*, HRESULT, UInt32, MAPIERROR**, HRESULT)
    save_changes : Proc(IPropData*, UInt32, HRESULT)
    get_props : Proc(IPropData*, SPropTagArray*, UInt32, UInt32*, SPropValue**, HRESULT)
    get_prop_list : Proc(IPropData*, UInt32, SPropTagArray**, HRESULT)
    open_property : Proc(IPropData*, UInt32, Guid*, UInt32, UInt32, IUnknown*, HRESULT)
    set_props : Proc(IPropData*, UInt32, SPropValue*, SPropProblemArray**, HRESULT)
    delete_props : Proc(IPropData*, SPropTagArray*, SPropProblemArray**, HRESULT)
    copy_to : Proc(IPropData*, UInt32, Guid*, SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)
    copy_props : Proc(IPropData*, SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)
    get_names_from_i_ds : Proc(IPropData*, SPropTagArray**, Guid*, UInt32, UInt32*, MAPINAMEID***, HRESULT)
    get_i_ds_from_names : Proc(IPropData*, UInt32, MAPINAMEID**, UInt32, SPropTagArray**, HRESULT)
    hr_set_obj_access : Proc(IPropData*, UInt32, HRESULT)
    hr_set_prop_access : Proc(IPropData*, SPropTagArray*, UInt32*, HRESULT)
    hr_get_prop_access : Proc(IPropData*, SPropTagArray**, UInt32**, HRESULT)
    hr_add_obj_props : Proc(IPropData*, SPropTagArray*, SPropProblemArray**, HRESULT)
  end

  struct IPropData
    lpVtbl : IPropDataVTbl*
  end

  struct IAddrBookVTbl
    query_interface : Proc(IAddrBook*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAddrBook*, UInt32)
    release : Proc(IAddrBook*, UInt32)
    get_last_error : Proc(IAddrBook*, HRESULT, UInt32, MAPIERROR**, HRESULT)
    save_changes : Proc(IAddrBook*, UInt32, HRESULT)
    get_props : Proc(IAddrBook*, SPropTagArray*, UInt32, UInt32*, SPropValue**, HRESULT)
    get_prop_list : Proc(IAddrBook*, UInt32, SPropTagArray**, HRESULT)
    open_property : Proc(IAddrBook*, UInt32, Guid*, UInt32, UInt32, IUnknown*, HRESULT)
    set_props : Proc(IAddrBook*, UInt32, SPropValue*, SPropProblemArray**, HRESULT)
    delete_props : Proc(IAddrBook*, SPropTagArray*, SPropProblemArray**, HRESULT)
    copy_to : Proc(IAddrBook*, UInt32, Guid*, SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)
    copy_props : Proc(IAddrBook*, SPropTagArray*, LibC::UINT_PTR, IMAPIProgress, Guid*, Void*, UInt32, SPropProblemArray**, HRESULT)
    get_names_from_i_ds : Proc(IAddrBook*, SPropTagArray**, Guid*, UInt32, UInt32*, MAPINAMEID***, HRESULT)
    get_i_ds_from_names : Proc(IAddrBook*, UInt32, MAPINAMEID**, UInt32, SPropTagArray**, HRESULT)
    open_entry : Proc(IAddrBook*, UInt32, ENTRYID*, Guid*, UInt32, UInt32*, IUnknown*, HRESULT)
    compare_entry_i_ds : Proc(IAddrBook*, UInt32, ENTRYID*, UInt32, ENTRYID*, UInt32, UInt32*, HRESULT)
    advise : Proc(IAddrBook*, UInt32, ENTRYID*, UInt32, IMAPIAdviseSink, UInt32*, HRESULT)
    unadvise : Proc(IAddrBook*, UInt32, HRESULT)
    create_one_off : Proc(IAddrBook*, Int8*, Int8*, Int8*, UInt32, UInt32*, ENTRYID**, HRESULT)
    new_entry : Proc(IAddrBook*, UInt32, UInt32, UInt32, ENTRYID*, UInt32, ENTRYID*, UInt32*, ENTRYID**, HRESULT)
    resolve_name : Proc(IAddrBook*, LibC::UINT_PTR, UInt32, Int8*, ADRLIST*, HRESULT)
    address : Proc(IAddrBook*, UInt32*, ADRPARM*, ADRLIST**, HRESULT)
    details : Proc(IAddrBook*, LibC::UINT_PTR*, LPFNDISMISS, Void*, UInt32, ENTRYID*, LPFNBUTTON, Void*, Int8*, UInt32, HRESULT)
    recip_options : Proc(IAddrBook*, UInt32, UInt32, ADRENTRY*, HRESULT)
    query_default_recip_opt : Proc(IAddrBook*, Int8*, UInt32, UInt32*, SPropValue**, HRESULT)
    get_pab : Proc(IAddrBook*, UInt32*, ENTRYID**, HRESULT)
    set_pab : Proc(IAddrBook*, UInt32, ENTRYID*, HRESULT)
    get_default_dir : Proc(IAddrBook*, UInt32*, ENTRYID**, HRESULT)
    set_default_dir : Proc(IAddrBook*, UInt32, ENTRYID*, HRESULT)
    get_search_path : Proc(IAddrBook*, UInt32, SRowSet**, HRESULT)
    set_search_path : Proc(IAddrBook*, UInt32, SRowSet*, HRESULT)
    prepare_recips : Proc(IAddrBook*, UInt32, SPropTagArray*, ADRLIST*, HRESULT)
  end

  struct IAddrBook
    lpVtbl : IAddrBookVTbl*
  end

  struct IWABObjectVTbl
    query_interface : Proc(IWABObject*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWABObject*, UInt32)
    release : Proc(IWABObject*, UInt32)
    get_last_error : Proc(IWABObject*, HRESULT, UInt32, MAPIERROR**, HRESULT)
    allocate_buffer : Proc(IWABObject*, UInt32, Void**, HRESULT)
    allocate_more : Proc(IWABObject*, UInt32, Void*, Void**, HRESULT)
    free_buffer : Proc(IWABObject*, Void*, HRESULT)
    backup : Proc(IWABObject*, PSTR, HRESULT)
    import : Proc(IWABObject*, PSTR, HRESULT)
    find : Proc(IWABObject*, IAddrBook, LibC::HANDLE, HRESULT)
    v_card_display : Proc(IWABObject*, IAddrBook, LibC::HANDLE, PSTR, HRESULT)
    ldap_url : Proc(IWABObject*, IAddrBook, LibC::HANDLE, UInt32, PSTR, IMailUser*, HRESULT)
    v_card_create : Proc(IWABObject*, IAddrBook, UInt32, PSTR, IMailUser, HRESULT)
    v_card_retrieve : Proc(IWABObject*, IAddrBook, UInt32, PSTR, IMailUser*, HRESULT)
    get_me : Proc(IWABObject*, IAddrBook, UInt32, UInt32*, SBinary*, LibC::HANDLE, HRESULT)
    set_me : Proc(IWABObject*, IAddrBook, UInt32, SBinary, LibC::HANDLE, HRESULT)
  end

  struct IWABObject
    lpVtbl : IWABObjectVTbl*
  end

  struct IWABOBJECT_VTbl
    query_interface : Proc(IWABOBJECT_*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWABOBJECT_*, UInt32)
    release : Proc(IWABOBJECT_*, UInt32)
    get_last_error : Proc(IWABOBJECT_*, HRESULT, UInt32, MAPIERROR**, HRESULT)
    allocate_buffer : Proc(IWABOBJECT_*, UInt32, Void**, HRESULT)
    allocate_more : Proc(IWABOBJECT_*, UInt32, Void*, Void**, HRESULT)
    free_buffer : Proc(IWABOBJECT_*, Void*, HRESULT)
    backup : Proc(IWABOBJECT_*, PSTR, HRESULT)
    import : Proc(IWABOBJECT_*, PSTR, HRESULT)
    find : Proc(IWABOBJECT_*, IAddrBook, LibC::HANDLE, HRESULT)
    v_card_display : Proc(IWABOBJECT_*, IAddrBook, LibC::HANDLE, PSTR, HRESULT)
    ldap_url : Proc(IWABOBJECT_*, IAddrBook, LibC::HANDLE, UInt32, PSTR, IMailUser*, HRESULT)
    v_card_create : Proc(IWABOBJECT_*, IAddrBook, UInt32, PSTR, IMailUser, HRESULT)
    v_card_retrieve : Proc(IWABOBJECT_*, IAddrBook, UInt32, PSTR, IMailUser*, HRESULT)
    get_me : Proc(IWABOBJECT_*, IAddrBook, UInt32, UInt32*, SBinary*, LibC::HANDLE, HRESULT)
    set_me : Proc(IWABOBJECT_*, IAddrBook, UInt32, SBinary, LibC::HANDLE, HRESULT)
  end

  struct IWABOBJECT_
    lpVtbl : IWABOBJECT_VTbl*
  end

  struct IWABExtInitVTbl
    query_interface : Proc(IWABExtInit*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWABExtInit*, UInt32)
    release : Proc(IWABExtInit*, UInt32)
    initialize : Proc(IWABExtInit*, WABEXTDISPLAY*, HRESULT)
  end

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
  fun MAPIDeinitIdle

  # Params # lpfnidle : PFNIDLE [In],lpvidleparam : Void* [In],priidle : Int16 [In],csecidle : UInt32 [In],iroidle : UInt16 [In]
  fun FtgRegisterIdleRoutine(lpfnidle : PFNIDLE, lpvidleparam : Void*, priidle : Int16, csecidle : UInt32, iroidle : UInt16) : Void*

  # Params # ftg : Void* [In]
  fun DeregisterIdleRoutine(ftg : Void*)

  # Params # ftg : Void* [In],fenable : LibC::BOOL [In]
  fun EnableIdleRoutine(ftg : Void*, fenable : LibC::BOOL)

  # Params # ftg : Void* [In],lpfnidle : PFNIDLE [In],lpvidleparam : Void* [In],priidle : Int16 [In],csecidle : UInt32 [In],iroidle : UInt16 [In],ircidle : UInt16 [In]
  fun ChangeIdleRoutine(ftg : Void*, lpfnidle : PFNIDLE, lpvidleparam : Void*, priidle : Int16, csecidle : UInt32, iroidle : UInt16, ircidle : UInt16)

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
  fun FreePadrlist(lpadrlist : ADRLIST*)

  # Params # lprows : SRowSet* [In]
  fun FreeProws(lprows : SRowSet*)

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
  fun DeinitMapiUtil
end
