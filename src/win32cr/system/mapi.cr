require "./../foundation.cr"

module Win32cr::System::Mapi
  alias LPMAPILOGON = Proc(LibC::UIntPtrT, Win32cr::Foundation::PSTR, Win32cr::Foundation::PSTR, UInt32, UInt32, LibC::UIntPtrT*, UInt32)

  alias LPMAPILOGOFF = Proc(LibC::UIntPtrT, LibC::UIntPtrT, UInt32, UInt32, UInt32)

  alias LPMAPISENDMAIL = Proc(LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::System::Mapi::MapiMessage*, UInt32, UInt32, UInt32)

  alias LPMAPISENDMAILW = Proc(LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::System::Mapi::MapiMessageW*, UInt32, UInt32, UInt32)

  alias LPMAPISENDDOCUMENTS = Proc(LibC::UIntPtrT, Win32cr::Foundation::PSTR, Win32cr::Foundation::PSTR, Win32cr::Foundation::PSTR, UInt32, UInt32)

  alias LPMAPIFINDNEXT = Proc(LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::PSTR, Win32cr::Foundation::PSTR, UInt32, UInt32, Win32cr::Foundation::PSTR, UInt32)

  alias LPMAPIREADMAIL = Proc(LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::PSTR, UInt32, UInt32, Win32cr::System::Mapi::MapiMessage**, UInt32)

  alias LPMAPISAVEMAIL = Proc(LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::System::Mapi::MapiMessage*, UInt32, UInt32, Win32cr::Foundation::PSTR, UInt32)

  alias LPMAPIDELETEMAIL = Proc(LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::PSTR, UInt32, UInt32, UInt32)

  alias LPMAPIFREEBUFFER = Proc(Void*, UInt32)

  alias LPMAPIADDRESS = Proc(LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::PSTR, UInt32, Win32cr::Foundation::PSTR, UInt32, Win32cr::System::Mapi::MapiRecipDesc*, UInt32, UInt32, UInt32*, Win32cr::System::Mapi::MapiRecipDesc**, UInt32)

  alias LPMAPIDETAILS = Proc(LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::System::Mapi::MapiRecipDesc*, UInt32, UInt32, UInt32)

  alias LPMAPIRESOLVENAME = Proc(LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::PSTR, UInt32, UInt32, Win32cr::System::Mapi::MapiRecipDesc**, UInt32)

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


  @[Extern]
  struct MapiFileDesc
    property ulReserved : UInt32
    property flFlags : UInt32
    property nPosition : UInt32
    property lpszPathName : Win32cr::Foundation::PSTR
    property lpszFileName : Win32cr::Foundation::PSTR
    property lpFileType : Void*
    def initialize(@ulReserved : UInt32, @flFlags : UInt32, @nPosition : UInt32, @lpszPathName : Win32cr::Foundation::PSTR, @lpszFileName : Win32cr::Foundation::PSTR, @lpFileType : Void*)
    end
  end

  @[Extern]
  struct MapiFileDescW
    property ulReserved : UInt32
    property flFlags : UInt32
    property nPosition : UInt32
    property lpszPathName : Win32cr::Foundation::PWSTR
    property lpszFileName : Win32cr::Foundation::PWSTR
    property lpFileType : Void*
    def initialize(@ulReserved : UInt32, @flFlags : UInt32, @nPosition : UInt32, @lpszPathName : Win32cr::Foundation::PWSTR, @lpszFileName : Win32cr::Foundation::PWSTR, @lpFileType : Void*)
    end
  end

  @[Extern]
  struct MapiFileTagExt
    property ulReserved : UInt32
    property cbTag : UInt32
    property lpTag : UInt8*
    property cbEncoding : UInt32
    property lpEncoding : UInt8*
    def initialize(@ulReserved : UInt32, @cbTag : UInt32, @lpTag : UInt8*, @cbEncoding : UInt32, @lpEncoding : UInt8*)
    end
  end

  @[Extern]
  struct MapiRecipDesc
    property ulReserved : UInt32
    property ulRecipClass : UInt32
    property lpszName : Win32cr::Foundation::PSTR
    property lpszAddress : Win32cr::Foundation::PSTR
    property ulEIDSize : UInt32
    property lpEntryID : Void*
    def initialize(@ulReserved : UInt32, @ulRecipClass : UInt32, @lpszName : Win32cr::Foundation::PSTR, @lpszAddress : Win32cr::Foundation::PSTR, @ulEIDSize : UInt32, @lpEntryID : Void*)
    end
  end

  @[Extern]
  struct MapiRecipDescW
    property ulReserved : UInt32
    property ulRecipClass : UInt32
    property lpszName : Win32cr::Foundation::PWSTR
    property lpszAddress : Win32cr::Foundation::PWSTR
    property ulEIDSize : UInt32
    property lpEntryID : Void*
    def initialize(@ulReserved : UInt32, @ulRecipClass : UInt32, @lpszName : Win32cr::Foundation::PWSTR, @lpszAddress : Win32cr::Foundation::PWSTR, @ulEIDSize : UInt32, @lpEntryID : Void*)
    end
  end

  @[Extern]
  struct MapiMessage
    property ulReserved : UInt32
    property lpszSubject : Win32cr::Foundation::PSTR
    property lpszNoteText : Win32cr::Foundation::PSTR
    property lpszMessageType : Win32cr::Foundation::PSTR
    property lpszDateReceived : Win32cr::Foundation::PSTR
    property lpszConversationID : Win32cr::Foundation::PSTR
    property flFlags : UInt32
    property lpOriginator : Win32cr::System::Mapi::MapiRecipDesc*
    property nRecipCount : UInt32
    property lpRecips : Win32cr::System::Mapi::MapiRecipDesc*
    property nFileCount : UInt32
    property lpFiles : Win32cr::System::Mapi::MapiFileDesc*
    def initialize(@ulReserved : UInt32, @lpszSubject : Win32cr::Foundation::PSTR, @lpszNoteText : Win32cr::Foundation::PSTR, @lpszMessageType : Win32cr::Foundation::PSTR, @lpszDateReceived : Win32cr::Foundation::PSTR, @lpszConversationID : Win32cr::Foundation::PSTR, @flFlags : UInt32, @lpOriginator : Win32cr::System::Mapi::MapiRecipDesc*, @nRecipCount : UInt32, @lpRecips : Win32cr::System::Mapi::MapiRecipDesc*, @nFileCount : UInt32, @lpFiles : Win32cr::System::Mapi::MapiFileDesc*)
    end
  end

  @[Extern]
  struct MapiMessageW
    property ulReserved : UInt32
    property lpszSubject : Win32cr::Foundation::PWSTR
    property lpszNoteText : Win32cr::Foundation::PWSTR
    property lpszMessageType : Win32cr::Foundation::PWSTR
    property lpszDateReceived : Win32cr::Foundation::PWSTR
    property lpszConversationID : Win32cr::Foundation::PWSTR
    property flFlags : UInt32
    property lpOriginator : Win32cr::System::Mapi::MapiRecipDescW*
    property nRecipCount : UInt32
    property lpRecips : Win32cr::System::Mapi::MapiRecipDescW*
    property nFileCount : UInt32
    property lpFiles : Win32cr::System::Mapi::MapiFileDescW*
    def initialize(@ulReserved : UInt32, @lpszSubject : Win32cr::Foundation::PWSTR, @lpszNoteText : Win32cr::Foundation::PWSTR, @lpszMessageType : Win32cr::Foundation::PWSTR, @lpszDateReceived : Win32cr::Foundation::PWSTR, @lpszConversationID : Win32cr::Foundation::PWSTR, @flFlags : UInt32, @lpOriginator : Win32cr::System::Mapi::MapiRecipDescW*, @nRecipCount : UInt32, @lpRecips : Win32cr::System::Mapi::MapiRecipDescW*, @nFileCount : UInt32, @lpFiles : Win32cr::System::Mapi::MapiFileDescW*)
    end
  end

  @[Link("mapi32")]
  lib C
    fun MAPIFreeBuffer(pv : Void*) : UInt32

  end
end