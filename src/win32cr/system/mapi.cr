require "../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:mapi32.dll")]
{% else %}
@[Link("mapi32")]
{% end %}
lib LibWin32
  MAPI_OLE = 1_u32
  MAPI_OLE_STATIC = 2_u32
  MAPI_ORIG = 0_u32
  MAPI_TO = 1_u32
  MAPI_CC = 2_u32
  MAPI_BCC = 3_u32
  MAPI_UNREAD = 1_u32
  MAPI_RECEIPT_REQUESTED = 2_u32
  MAPI_SENT = 4_u32
  MAPI_LOGON_UI = 1_u32
  MAPI_PASSWORD_UI = 131072_u32
  MAPI_NEW_SESSION = 2_u32
  MAPI_FORCE_DOWNLOAD = 4096_u32
  MAPI_EXTENDED = 32_u32
  MAPI_DIALOG = 8_u32
  MAPI_FORCE_UNICODE = 262144_u32
  MAPI_UNREAD_ONLY = 32_u32
  MAPI_GUARANTEE_FIFO = 256_u32
  MAPI_LONG_MSGID = 16384_u32
  MAPI_PEEK = 128_u32
  MAPI_SUPPRESS_ATTACH = 2048_u32
  MAPI_ENVELOPE_ONLY = 64_u32
  MAPI_BODY_AS_FILE = 512_u32
  MAPI_AB_NOMODIFY = 1024_u32
  SUCCESS_SUCCESS = 0_u32
  MAPI_USER_ABORT = 1_u32
  MAPI_E_USER_ABORT = 1_u32
  MAPI_E_FAILURE = 2_u32
  MAPI_E_LOGON_FAILURE = 3_u32
  MAPI_E_LOGIN_FAILURE = 3_u32
  MAPI_E_DISK_FULL = 4_u32
  MAPI_E_INSUFFICIENT_MEMORY = 5_u32
  MAPI_E_ACCESS_DENIED = 6_u32
  MAPI_E_TOO_MANY_SESSIONS = 8_u32
  MAPI_E_TOO_MANY_FILES = 9_u32
  MAPI_E_TOO_MANY_RECIPIENTS = 10_u32
  MAPI_E_ATTACHMENT_NOT_FOUND = 11_u32
  MAPI_E_ATTACHMENT_OPEN_FAILURE = 12_u32
  MAPI_E_ATTACHMENT_WRITE_FAILURE = 13_u32
  MAPI_E_UNKNOWN_RECIPIENT = 14_u32
  MAPI_E_BAD_RECIPTYPE = 15_u32
  MAPI_E_NO_MESSAGES = 16_u32
  MAPI_E_INVALID_MESSAGE = 17_u32
  MAPI_E_TEXT_TOO_LARGE = 18_u32
  MAPI_E_INVALID_SESSION = 19_u32
  MAPI_E_TYPE_NOT_SUPPORTED = 20_u32
  MAPI_E_AMBIGUOUS_RECIPIENT = 21_u32
  MAPI_E_AMBIG_RECIP = 21_u32
  MAPI_E_MESSAGE_IN_USE = 22_u32
  MAPI_E_NETWORK_FAILURE = 23_u32
  MAPI_E_INVALID_EDITFIELDS = 24_u32
  MAPI_E_INVALID_RECIPS = 25_u32
  MAPI_E_NOT_SUPPORTED = 26_u32
  MAPI_E_UNICODE_NOT_SUPPORTED = 27_u32
  MAPI_E_ATTACHMENT_TOO_LARGE = 28_u32

  alias LPMAPILOGON = Proc(LibC::UINT_PTR, PSTR, PSTR, UInt32, UInt32, LibC::UINT_PTR*, UInt32)
  alias LPMAPILOGOFF = Proc(LibC::UINT_PTR, LibC::UINT_PTR, UInt32, UInt32, UInt32)
  alias LPMAPISENDMAIL = Proc(LibC::UINT_PTR, LibC::UINT_PTR, MapiMessage*, UInt32, UInt32, UInt32)
  alias LPMAPISENDMAILW = Proc(LibC::UINT_PTR, LibC::UINT_PTR, MapiMessageW*, UInt32, UInt32, UInt32)
  alias LPMAPISENDDOCUMENTS = Proc(LibC::UINT_PTR, PSTR, PSTR, PSTR, UInt32, UInt32)
  alias LPMAPIFINDNEXT = Proc(LibC::UINT_PTR, LibC::UINT_PTR, PSTR, PSTR, UInt32, UInt32, PSTR, UInt32)
  alias LPMAPIREADMAIL = Proc(LibC::UINT_PTR, LibC::UINT_PTR, PSTR, UInt32, UInt32, MapiMessage**, UInt32)
  alias LPMAPISAVEMAIL = Proc(LibC::UINT_PTR, LibC::UINT_PTR, MapiMessage*, UInt32, UInt32, PSTR, UInt32)
  alias LPMAPIDELETEMAIL = Proc(LibC::UINT_PTR, LibC::UINT_PTR, PSTR, UInt32, UInt32, UInt32)
  alias LPMAPIFREEBUFFER = Proc(Void*, UInt32)
  alias LPMAPIADDRESS = Proc(LibC::UINT_PTR, LibC::UINT_PTR, PSTR, UInt32, PSTR, UInt32, MapiRecipDesc*, UInt32, UInt32, UInt32*, MapiRecipDesc**, UInt32)
  alias LPMAPIDETAILS = Proc(LibC::UINT_PTR, LibC::UINT_PTR, MapiRecipDesc*, UInt32, UInt32, UInt32)
  alias LPMAPIRESOLVENAME = Proc(LibC::UINT_PTR, LibC::UINT_PTR, PSTR, UInt32, UInt32, MapiRecipDesc**, UInt32)

  struct MapiFileDesc
    ul_reserved : UInt32
    fl_flags : UInt32
    n_position : UInt32
    lpsz_path_name : PSTR
    lpsz_file_name : PSTR
    lp_file_type : Void*
  end
  struct MapiFileDescW
    ul_reserved : UInt32
    fl_flags : UInt32
    n_position : UInt32
    lpsz_path_name : LibC::LPWSTR
    lpsz_file_name : LibC::LPWSTR
    lp_file_type : Void*
  end
  struct MapiFileTagExt
    ul_reserved : UInt32
    cb_tag : UInt32
    lp_tag : UInt8*
    cb_encoding : UInt32
    lp_encoding : UInt8*
  end
  struct MapiRecipDesc
    ul_reserved : UInt32
    ul_recip_class : UInt32
    lpsz_name : PSTR
    lpsz_address : PSTR
    ul_eid_size : UInt32
    lp_entry_id : Void*
  end
  struct MapiRecipDescW
    ul_reserved : UInt32
    ul_recip_class : UInt32
    lpsz_name : LibC::LPWSTR
    lpsz_address : LibC::LPWSTR
    ul_eid_size : UInt32
    lp_entry_id : Void*
  end
  struct MapiMessage
    ul_reserved : UInt32
    lpsz_subject : PSTR
    lpsz_note_text : PSTR
    lpsz_message_type : PSTR
    lpsz_date_received : PSTR
    lpsz_conversation_id : PSTR
    fl_flags : UInt32
    lp_originator : MapiRecipDesc*
    n_recip_count : UInt32
    lp_recips : MapiRecipDesc*
    n_file_count : UInt32
    lp_files : MapiFileDesc*
  end
  struct MapiMessageW
    ul_reserved : UInt32
    lpsz_subject : LibC::LPWSTR
    lpsz_note_text : LibC::LPWSTR
    lpsz_message_type : LibC::LPWSTR
    lpsz_date_received : LibC::LPWSTR
    lpsz_conversation_id : LibC::LPWSTR
    fl_flags : UInt32
    lp_originator : MapiRecipDescW*
    n_recip_count : UInt32
    lp_recips : MapiRecipDescW*
    n_file_count : UInt32
    lp_files : MapiFileDescW*
  end


  # Params # pv : Void* [In]
  fun MAPIFreeBuffer(pv : Void*) : UInt32
end
