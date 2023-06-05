require "../foundation.cr"
require "../system/com.cr"
require "../ui/windowsandmessaging.cr"
require "../graphics/gdi.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:msctfmonitor.dll")]
lib LibWin32
  alias HKL = LibC::IntPtrT

  GUID_PROP_TEXTOWNER = "f1e2d520-0969-11d3-8df0-00105a2799b5"
  GUID_PROP_ATTRIBUTE = "34b45670-7526-11d2-a147-00105a2799b5"
  GUID_PROP_LANGID = "3280ce20-8032-11d2-b603-00105a2799b5"
  GUID_PROP_READING = "5463f7c0-8e31-11d2-bf46-00105a2799b5"
  GUID_PROP_COMPOSING = "e12ac060-af15-11d2-afc5-00105a2799b5"
  GUID_PROP_TKB_ALTERNATES = "70b2a803-968d-462e-b93b-2164c91517f7"
  GUID_SYSTEM_FUNCTIONPROVIDER = "9a698bb0-0f21-11d3-8df1-00105a2799b5"
  GUID_APP_FUNCTIONPROVIDER = "4caef01e-12af-4b0e-9db1-a6ec5b881208"
  GUID_TFCAT_CATEGORY_OF_TIP = "534c48c1-0607-4098-a521-4fc899c73e90"
  GUID_TFCAT_TIP_KEYBOARD = "34745c63-b2f0-4784-8b67-5e12c8701a31"
  GUID_TFCAT_TIP_SPEECH = "b5a73cd1-8355-426b-a161-259808f26b14"
  GUID_TFCAT_TIP_HANDWRITING = "246ecb87-c2f2-4abe-905b-c8b38add2c43"
  GUID_TFCAT_PROP_AUDIODATA = "9b7be3a9-e8ab-4d47-a8fe-254fa423436d"
  GUID_TFCAT_PROP_INKDATA = "7c6a82ae-b0d7-4f14-a745-14f28b009d61"
  GUID_COMPARTMENT_SAPI_AUDIO = "51af2086-cc6b-457d-b5aa-8b19dc290ab4"
  GUID_COMPARTMENT_KEYBOARD_DISABLED = "71a5b253-1951-466b-9fbc-9c8808fa84f2"
  GUID_COMPARTMENT_KEYBOARD_OPENCLOSE = "58273aad-01bb-4164-95c6-755ba0b5162d"
  GUID_COMPARTMENT_HANDWRITING_OPENCLOSE = "f9ae2c6b-1866-4361-af72-7aa30948890e"
  GUID_COMPARTMENT_SPEECH_DISABLED = "56c5c607-0703-4e59-8e52-cbc84e8bbe35"
  GUID_COMPARTMENT_SPEECH_OPENCLOSE = "544d6a63-e2e8-4752-bbd1-000960bca083"
  GUID_COMPARTMENT_SPEECH_GLOBALSTATE = "2a54fe8e-0d08-460c-a75d-87035ff436c5"
  GUID_COMPARTMENT_CONVERSIONMODEBIAS = "5497f516-ee91-436e-b946-aa2c05f1ac5b"
  GUID_PROP_MODEBIAS = "372e0716-974f-40ac-a088-08cdc92ebfbc"
  GUID_COMPARTMENT_KEYBOARD_INPUTMODE = "b6592511-bcee-4122-a7c4-09f4b3fa4396"
  GUID_MODEBIAS_NONE = "00000000-0000-0000-0000-000000000000"
  GUID_MODEBIAS_URLHISTORY = "8b0e54d9-63f2-4c68-84d4-79aee7a59f09"
  GUID_MODEBIAS_FILENAME = "d7f707fe-44c6-4fca-8e76-86ab50c7931b"
  GUID_MODEBIAS_READING = "e31643a3-6466-4cbf-8d8b-0bd4d8545461"
  GUID_MODEBIAS_DATETIME = "f2bdb372-7f61-4039-92ef-1c35599f0222"
  GUID_MODEBIAS_NAME = "fddc10f0-d239-49bf-b8fc-5410caaa427e"
  GUID_MODEBIAS_CONVERSATION = "0f4ec104-1790-443b-95f1-e10f939d6546"
  GUID_MODEBIAS_NUMERIC = "4021766c-e872-48fd-9cee-4ec5c75e16c3"
  GUID_MODEBIAS_HIRAGANA = "d73d316e-9b91-46f1-a280-31597f52c694"
  GUID_MODEBIAS_KATAKANA = "2e0eeddd-3a1a-499e-8543-3c7ee7949811"
  GUID_MODEBIAS_HANGUL = "76ef0541-23b3-4d77-a074-691801ccea17"
  GUID_MODEBIAS_CHINESE = "7add26de-4328-489b-83ae-6493750cad5c"
  GUID_MODEBIAS_HALFWIDTHKATAKANA = "005f6b63-78d4-41cc-8859-485ca821a795"
  GUID_MODEBIAS_FULLWIDTHALPHANUMERIC = "81489fb8-b36a-473d-8146-e4a2258b24ae"
  GUID_MODEBIAS_FULLWIDTHHANGUL = "c01ae6c9-45b5-4fd0-9cb1-9f4cebc39fea"
  GUID_TFCAT_PROPSTYLE_STATIC = "565fb8d8-6bd4-4ca1-b223-0f2ccb8f4f96"
  GUID_TFCAT_DISPLAYATTRIBUTEPROVIDER = "046b8c80-1647-40f7-9b21-b93b81aabc1b"
  GUID_TFCAT_DISPLAYATTRIBUTEPROPERTY = "b95f181b-ea4c-4af1-8056-7c321abbb091"
  GUID_COMPARTMENT_SPEECH_UI_STATUS = "d92016f0-9367-4fe7-9abf-bc59dacbe0e3"
  GUID_COMPARTMENT_EMPTYCONTEXT = "d7487dbf-804e-41c5-894d-ad96fd4eea13"
  GUID_COMPARTMENT_TIPUISTATUS = "148ca3ec-0366-401c-8d75-ed978d85fbc9"
  GUID_COMPARTMENT_SPEECH_CFGMENU = "fb6c5c2d-4e83-4bb6-91a2-e019bff6762d"
  GUID_LBI_SAPILAYR_CFGMENUBUTTON = "d02f24a1-942d-422e-8d99-b4f2addee999"
  GUID_TFCAT_TIPCAP_SECUREMODE = "49d2f9ce-1f5e-11d7-a6d3-00065b84435c"
  GUID_TFCAT_TIPCAP_UIELEMENTENABLED = "49d2f9cf-1f5e-11d7-a6d3-00065b84435c"
  GUID_TFCAT_TIPCAP_INPUTMODECOMPARTMENT = "ccf05dd7-4a87-11d7-a6e2-00065b84435c"
  GUID_TFCAT_TIPCAP_COMLESS = "364215d9-75bc-11d7-a6ef-00065b84435c"
  GUID_TFCAT_TIPCAP_WOW16 = "364215da-75bc-11d7-a6ef-00065b84435c"
  GUID_TFCAT_TIPCAP_IMMERSIVESUPPORT = "13a016df-560b-46cd-947a-4c3af1e0e35d"
  GUID_TFCAT_TIPCAP_IMMERSIVEONLY = "3a4259ac-640d-4ad4-89f7-1eb67e7c4ee8"
  GUID_TFCAT_TIPCAP_LOCALSERVER = "74769ee9-4a66-4f9d-90d6-bf8b7c3eb461"
  GUID_TFCAT_TIPCAP_TSF3 = "07dcb4af-98de-4548-bef7-25bd45979a1f"
  GUID_TFCAT_TIPCAP_DUALMODE = "3af314a2-d79f-4b1b-9992-15086d339b05"
  GUID_TFCAT_TIPCAP_SYSTRAYSUPPORT = "25504fb4-7bab-4bc1-9c69-cf81890f0ef5"
  GUID_COMPARTMENT_KEYBOARD_INPUTMODE_CONVERSION = "ccf05dd8-4a87-11d7-a6e2-00065b84435c"
  GUID_COMPARTMENT_KEYBOARD_INPUTMODE_SENTENCE = "ccf05dd9-4a87-11d7-a6e2-00065b84435c"
  GUID_COMPARTMENT_TRANSITORYEXTENSION = "8be347f5-c7a0-11d7-b408-00065b84435c"
  GUID_COMPARTMENT_TRANSITORYEXTENSION_DOCUMENTMANAGER = "8be347f7-c7a0-11d7-b408-00065b84435c"
  GUID_COMPARTMENT_TRANSITORYEXTENSION_PARENT = "8be347f8-c7a0-11d7-b408-00065b84435c"
  GUID_COMPARTMENT_ENABLED_PROFILES_UPDATED = "92c1fd48-a9ae-4a7c-be08-4329e4723817"
  GUID_TFCAT_TRANSITORYEXTENSIONUI = "6302de22-a5cf-4b02-bfe8-4d72b2bed3c6"
  GUID_LBI_INPUTMODE = "2c77a81e-41cc-4178-a3a7-5f8a987568e6"
  CLSID_TF_ThreadMgr = "529a9e6b-6587-4f23-ab9e-9c7d683e3c50"
  CLSID_TF_LangBarMgr = "ebb08c45-6c4a-4fdc-ae53-4eb8c4c7db8e"
  CLSID_TF_DisplayAttributeMgr = "3ce74de4-53d3-4d74-8b83-431b3828ba53"
  CLSID_TF_CategoryMgr = "a4b544a1-438d-4b41-9325-869523e2d6c7"
  CLSID_TF_InputProcessorProfiles = "33c53a50-f456-4884-b049-85fd643ecfed"
  CLSID_TF_LangBarItemMgr = "b9931692-a2b3-4fab-bf33-9ec6f9fb96ac"
  CLSID_TF_ClassicLangBar = "3318360c-1afc-4d09-a86b-9f9cb6dceb9c"
  CLSID_TF_TransitoryExtensionUIEntry = "ae6be008-07fb-400d-8beb-337a64f7051f"
  CLSID_TsfServices = "39aedc00-6b60-46db-8d31-3642be0e4373"
  GUID_TS_SERVICE_DATAOBJECT = "6086fbb5-e225-46ce-a770-c1bbd3e05d7b"
  GUID_TS_SERVICE_ACCESSIBLE = "f9786200-a5bf-4a0f-8c24-fb16f5d1aabb"
  GUID_TS_SERVICE_ACTIVEX = "ea937a50-c9a6-4b7d-894a-49d99b784834"
  TS_E_INVALIDPOS = -2147220992_i32
  TS_E_NOLOCK = -2147220991_i32
  TS_E_NOOBJECT = -2147220990_i32
  TS_E_NOSERVICE = -2147220989_i32
  TS_E_NOINTERFACE = -2147220988_i32
  TS_E_NOSELECTION = -2147220987_i32
  TS_E_NOLAYOUT = -2147220986_i32
  TS_E_INVALIDPOINT = -2147220985_i32
  TS_E_SYNCHRONOUS = -2147220984_i32
  TS_E_READONLY = -2147220983_i32
  TS_E_FORMAT = -2147220982_i32
  TS_S_ASYNC = 262912_i32
  TS_AS_TEXT_CHANGE = 1_u32
  TS_AS_SEL_CHANGE = 2_u32
  TS_AS_LAYOUT_CHANGE = 4_u32
  TS_AS_ATTR_CHANGE = 8_u32
  TS_AS_STATUS_CHANGE = 16_u32
  TS_LF_SYNC = 1_u32
  TS_SD_READONLY = 1_u32
  TS_SD_LOADING = 2_u32
  TS_SD_RESERVED = 4_u32
  TS_SD_TKBAUTOCORRECTENABLE = 8_u32
  TS_SD_TKBPREDICTIONENABLE = 16_u32
  TS_SD_UIINTEGRATIONENABLE = 32_u32
  TS_SD_INPUTPANEMANUALDISPLAYENABLE = 64_u32
  TS_SD_EMBEDDEDHANDWRITINGVIEW_ENABLED = 128_u32
  TS_SD_EMBEDDEDHANDWRITINGVIEW_VISIBLE = 256_u32
  TS_SS_DISJOINTSEL = 1_u32
  TS_SS_REGIONS = 2_u32
  TS_SS_TRANSITORY = 4_u32
  TS_SS_NOHIDDENTEXT = 8_u32
  TS_SS_TKBAUTOCORRECTENABLE = 16_u32
  TS_SS_TKBPREDICTIONENABLE = 32_u32
  TS_SS_UWPCONTROL = 64_u32
  TS_IE_CORRECTION = 1_u32
  TS_IE_COMPOSITION = 2_u32
  TS_IAS_NOQUERY = 1_u32
  TS_IAS_QUERYONLY = 2_u32
  GXFPF_ROUND_NEAREST = 1_u32
  GXFPF_NEAREST = 2_u32
  TS_CHAR_EMBEDDED = 65532_u32
  TS_CHAR_REGION = 0_u32
  TS_CHAR_REPLACEMENT = 65533_u32
  TS_ATTR_FIND_BACKWARDS = 1_u32
  TS_ATTR_FIND_WANT_OFFSET = 2_u32
  TS_ATTR_FIND_UPDATESTART = 4_u32
  TS_ATTR_FIND_WANT_VALUE = 8_u32
  TS_ATTR_FIND_WANT_END = 16_u32
  TS_ATTR_FIND_HIDDEN = 32_u32
  TS_VCOOKIE_NUL = 4294967295_u32
  TS_SHIFT_COUNT_HIDDEN = 1_u32
  TS_SHIFT_HALT_HIDDEN = 2_u32
  TS_SHIFT_HALT_VISIBLE = 4_u32
  TS_SHIFT_COUNT_ONLY = 8_u32
  TS_GTA_HIDDEN = 1_u32
  TS_GEA_HIDDEN = 1_u32
  TF_E_LOCKED = -2147220224_i32
  TF_E_STACKFULL = -2147220223_i32
  TF_E_NOTOWNEDRANGE = -2147220222_i32
  TF_E_NOPROVIDER = -2147220221_i32
  TF_E_DISCONNECTED = -2147220220_i32
  TF_E_INVALIDVIEW = -2147220219_i32
  TF_E_ALREADY_EXISTS = -2147220218_i32
  TF_E_RANGE_NOT_COVERED = -2147220217_i32
  TF_E_COMPOSITION_REJECTED = -2147220216_i32
  TF_E_EMPTYCONTEXT = -2147220215_i32
  TF_E_INVALIDPOS = -2147220992_i32
  TF_E_NOLOCK = -2147220991_i32
  TF_E_NOOBJECT = -2147220990_i32
  TF_E_NOSERVICE = -2147220989_i32
  TF_E_NOINTERFACE = -2147220988_i32
  TF_E_NOSELECTION = -2147220987_i32
  TF_E_NOLAYOUT = -2147220986_i32
  TF_E_INVALIDPOINT = -2147220985_i32
  TF_E_SYNCHRONOUS = -2147220984_i32
  TF_E_READONLY = -2147220983_i32
  TF_E_FORMAT = -2147220982_i32
  TF_S_ASYNC = 262912_i32
  TF_RCM_COMLESS = 1_u32
  TF_RCM_VKEY = 2_u32
  TF_RCM_HINT_READING_LENGTH = 4_u32
  TF_RCM_HINT_COLLISION = 8_u32
  TKB_ALTERNATES_STANDARD = 1_u32
  TKB_ALTERNATES_FOR_AUTOCORRECTION = 2_u32
  TKB_ALTERNATES_FOR_PREDICTION = 3_u32
  TKB_ALTERNATES_AUTOCORRECTION_APPLIED = 4_u32
  TF_TMAE_NOACTIVATETIP = 1_u32
  TF_TMAE_SECUREMODE = 2_u32
  TF_TMAE_UIELEMENTENABLEDONLY = 4_u32
  TF_TMAE_COMLESS = 8_u32
  TF_TMAE_WOW16 = 16_u32
  TF_TMAE_NOACTIVATEKEYBOARDLAYOUT = 32_u32
  TF_TMAE_CONSOLE = 64_u32
  TF_TMF_NOACTIVATETIP = 1_u32
  TF_TMF_SECUREMODE = 2_u32
  TF_TMF_UIELEMENTENABLEDONLY = 4_u32
  TF_TMF_COMLESS = 8_u32
  TF_TMF_WOW16 = 16_u32
  TF_TMF_CONSOLE = 64_u32
  TF_TMF_IMMERSIVEMODE = 1073741824_u32
  TF_TMF_ACTIVATED = 2147483648_u32
  TF_MOD_ALT = 1_u32
  TF_MOD_CONTROL = 2_u32
  TF_MOD_SHIFT = 4_u32
  TF_MOD_RALT = 8_u32
  TF_MOD_RCONTROL = 16_u32
  TF_MOD_RSHIFT = 32_u32
  TF_MOD_LALT = 64_u32
  TF_MOD_LCONTROL = 128_u32
  TF_MOD_LSHIFT = 256_u32
  TF_MOD_ON_KEYUP = 512_u32
  TF_MOD_IGNORE_ALL_MODIFIER = 1024_u32
  TF_US_HIDETIPUI = 1_u32
  TF_DISABLE_SPEECH = 1_u32
  TF_DISABLE_DICTATION = 2_u32
  TF_DISABLE_COMMANDING = 4_u32
  TF_CLUIE_DOCUMENTMGR = 1_u32
  TF_CLUIE_COUNT = 2_u32
  TF_CLUIE_SELECTION = 4_u32
  TF_CLUIE_STRING = 8_u32
  TF_CLUIE_PAGEINDEX = 16_u32
  TF_CLUIE_CURRENTPAGE = 32_u32
  TF_RIUIE_CONTEXT = 1_u32
  TF_RIUIE_STRING = 2_u32
  TF_RIUIE_MAXREADINGSTRINGLENGTH = 4_u32
  TF_RIUIE_ERRORINDEX = 8_u32
  TF_RIUIE_VERTICALORDER = 16_u32
  TF_CONVERSIONMODE_ALPHANUMERIC = 0_u32
  TF_CONVERSIONMODE_NATIVE = 1_u32
  TF_CONVERSIONMODE_KATAKANA = 2_u32
  TF_CONVERSIONMODE_FULLSHAPE = 8_u32
  TF_CONVERSIONMODE_ROMAN = 16_u32
  TF_CONVERSIONMODE_CHARCODE = 32_u32
  TF_CONVERSIONMODE_SOFTKEYBOARD = 128_u32
  TF_CONVERSIONMODE_NOCONVERSION = 256_u32
  TF_CONVERSIONMODE_EUDC = 512_u32
  TF_CONVERSIONMODE_SYMBOL = 1024_u32
  TF_CONVERSIONMODE_FIXED = 2048_u32
  TF_SENTENCEMODE_NONE = 0_u32
  TF_SENTENCEMODE_PLAURALCLAUSE = 1_u32
  TF_SENTENCEMODE_SINGLECONVERT = 2_u32
  TF_SENTENCEMODE_AUTOMATIC = 4_u32
  TF_SENTENCEMODE_PHRASEPREDICT = 8_u32
  TF_SENTENCEMODE_CONVERSATION = 16_u32
  TF_TRANSITORYEXTENSION_NONE = 0_u32
  TF_TRANSITORYEXTENSION_FLOATING = 1_u32
  TF_TRANSITORYEXTENSION_ATSELECTION = 2_u32
  TF_PROFILETYPE_INPUTPROCESSOR = 1_u32
  TF_PROFILETYPE_KEYBOARDLAYOUT = 2_u32
  TF_RIP_FLAG_FREEUNUSEDLIBRARIES = 1_u32
  TF_IPP_FLAG_ACTIVE = 1_u32
  TF_IPP_FLAG_ENABLED = 2_u32
  TF_IPP_FLAG_SUBSTITUTEDBYINPUTPROCESSOR = 4_u32
  TF_IPP_CAPS_DISABLEONTRANSITORY = 1_u32
  TF_IPP_CAPS_SECUREMODESUPPORT = 2_u32
  TF_IPP_CAPS_UIELEMENTENABLED = 4_u32
  TF_IPP_CAPS_COMLESSSUPPORT = 8_u32
  TF_IPP_CAPS_WOW16SUPPORT = 16_u32
  TF_IPP_CAPS_IMMERSIVESUPPORT = 65536_u32
  TF_IPP_CAPS_SYSTRAYSUPPORT = 131072_u32
  TF_IPPMF_FORPROCESS = 268435456_u32
  TF_IPPMF_FORSESSION = 536870912_u32
  TF_IPPMF_FORSYSTEMALL = 1073741824_u32
  TF_IPPMF_ENABLEPROFILE = 1_u32
  TF_IPPMF_DISABLEPROFILE = 2_u32
  TF_IPPMF_DONTCARECURRENTINPUTLANGUAGE = 4_u32
  TF_RP_HIDDENINSETTINGUI = 2_u32
  TF_RP_LOCALPROCESS = 4_u32
  TF_RP_LOCALTHREAD = 8_u32
  TF_RP_SUBITEMINSETTINGUI = 16_u32
  TF_URP_ALLPROFILES = 2_u32
  TF_URP_LOCALPROCESS = 4_u32
  TF_URP_LOCALTHREAD = 8_u32
  TF_IPSINK_FLAG_ACTIVE = 1_u32
  TF_INVALID_EDIT_COOKIE = 0_u32
  TF_POPF_ALL = 1_u32
  TF_SD_READONLY = 1_u32
  TF_SD_LOADING = 2_u32
  TF_SS_DISJOINTSEL = 1_u32
  TF_SS_REGIONS = 2_u32
  TF_SS_TRANSITORY = 4_u32
  TF_SS_TKBAUTOCORRECTENABLE = 16_u32
  TF_SS_TKBPREDICTIONENABLE = 32_u32
  TF_CHAR_EMBEDDED = 65532_u32
  TF_HF_OBJECT = 1_u32
  TF_TF_MOVESTART = 1_u32
  TF_TF_IGNOREEND = 2_u32
  TF_ST_CORRECTION = 1_u32
  TF_IE_CORRECTION = 1_u32
  TF_TU_CORRECTION = 1_u32
  TF_INVALID_COOKIE = 4294967295_u32
  TF_PROFILE_NEWPHONETIC = "b2f9c502-1742-11d4-9790-0080c882687e"
  TF_PROFILE_PHONETIC = "761309de-317a-11d4-9b5d-0080c882687e"
  TF_PROFILE_NEWCHANGJIE = "f3ba907a-6c7e-11d4-97fa-0080c882687e"
  TF_PROFILE_CHANGJIE = "4bdf9f03-c7d3-11d4-b2ab-0080c882687e"
  TF_PROFILE_NEWQUICK = "0b883ba0-c1c7-11d4-87f9-0080c882687e"
  TF_PROFILE_QUICK = "6024b45f-5c54-11d4-b921-0080c882687e"
  TF_PROFILE_CANTONESE = "0aec109c-7e96-11d4-b2ef-0080c882687e"
  TF_PROFILE_PINYIN = "f3ba9077-6c7e-11d4-97fa-0080c882687e"
  TF_PROFILE_SIMPLEFAST = "fa550b04-5ad7-411f-a5ac-ca038ec515d7"
  TF_PROFILE_WUBI = "82590c13-f4dd-44f4-ba1d-8667246fdf8e"
  TF_PROFILE_DAYI = "037b2c25-480c-4d7f-b027-d6ca6b69788a"
  TF_PROFILE_ARRAY = "d38eff65-aa46-4fd5-91a7-67845fb02f5b"
  TF_PROFILE_YI = "409c8376-007b-4357-ae8e-26316ee3fb0d"
  TF_PROFILE_TIGRINYA = "3cab88b7-cc3e-46a6-9765-b772ad7761ff"
  TF_E_NOCONVERSION = -2147219968_i32
  TF_DICTATION_ON = 1_u32
  TF_DICTATION_ENABLED = 2_u32
  TF_COMMANDING_ENABLED = 4_u32
  TF_COMMANDING_ON = 8_u32
  TF_SPEECHUI_SHOWN = 16_u32
  TF_SHOW_BALLOON = 1_u32
  TF_DISABLE_BALLOON = 2_u32
  TF_MENUREADY = 1_u32
  TF_PROPUI_STATUS_SAVETOFILE = 1_u32
  GUID_INTEGRATIONSTYLE_SEARCHBOX = "e6d1bd11-82f7-4903-ae21-1a6397cde2eb"
  TKBL_UNDEFINED = 0_u32
  TKBL_CLASSIC_TRADITIONAL_CHINESE_PHONETIC = 1028_u32
  TKBL_CLASSIC_TRADITIONAL_CHINESE_CHANGJIE = 61506_u32
  TKBL_CLASSIC_TRADITIONAL_CHINESE_DAYI = 61507_u32
  TKBL_OPT_JAPANESE_ABC = 1041_u32
  TKBL_OPT_KOREAN_HANGUL_2_BULSIK = 1042_u32
  TKBL_OPT_SIMPLIFIED_CHINESE_PINYIN = 2052_u32
  TKBL_OPT_TRADITIONAL_CHINESE_PHONETIC = 1028_u32
  TF_LBI_ICON = 1_u32
  TF_LBI_TEXT = 2_u32
  TF_LBI_TOOLTIP = 4_u32
  TF_LBI_BITMAP = 8_u32
  TF_LBI_BALLOON = 16_u32
  TF_LBI_CUSTOMUI = 32_u32
  TF_LBI_STATUS = 65536_u32
  TF_LBI_STYLE_HIDDENSTATUSCONTROL = 1_u32
  TF_LBI_STYLE_SHOWNINTRAY = 2_u32
  TF_LBI_STYLE_HIDEONNOOTHERITEMS = 4_u32
  TF_LBI_STYLE_SHOWNINTRAYONLY = 8_u32
  TF_LBI_STYLE_HIDDENBYDEFAULT = 16_u32
  TF_LBI_STYLE_TEXTCOLORICON = 32_u32
  TF_LBI_STYLE_BTN_BUTTON = 65536_u32
  TF_LBI_STYLE_BTN_MENU = 131072_u32
  TF_LBI_STYLE_BTN_TOGGLE = 262144_u32
  TF_LBI_STATUS_HIDDEN = 1_u32
  TF_LBI_STATUS_DISABLED = 2_u32
  TF_LBI_STATUS_BTN_TOGGLED = 65536_u32
  TF_LBI_BMPF_VERTICAL = 1_u32
  TF_SFT_SHOWNORMAL = 1_u32
  TF_SFT_DOCK = 2_u32
  TF_SFT_MINIMIZED = 4_u32
  TF_SFT_HIDDEN = 8_u32
  TF_SFT_NOTRANSPARENCY = 16_u32
  TF_SFT_LOWTRANSPARENCY = 32_u32
  TF_SFT_HIGHTRANSPARENCY = 64_u32
  TF_SFT_LABELS = 128_u32
  TF_SFT_NOLABELS = 256_u32
  TF_SFT_EXTRAICONSONMINIMIZED = 512_u32
  TF_SFT_NOEXTRAICONSONMINIMIZED = 1024_u32
  TF_SFT_DESKBAND = 2048_u32
  TF_LBI_DESC_MAXLEN = 32_u32
  TF_LBMENUF_CHECKED = 1_u32
  TF_LBMENUF_SUBMENU = 2_u32
  TF_LBMENUF_SEPARATOR = 4_u32
  TF_LBMENUF_RADIOCHECKED = 8_u32
  TF_LBMENUF_GRAYED = 16_u32
  GUID_PROP_INPUTSCOPE = "1713dd5a-68e7-4a5b-9af6-592a595c778d"
  DCM_FLAGS_TASKENG = 1_u32
  DCM_FLAGS_CTFMON = 2_u32
  DCM_FLAGS_LOCALTHREADTSF = 4_u32
  ILMCM_CHECKLAYOUTANDTIPENABLED = 1_u32
  ILMCM_LANGUAGEBAROFF = 2_u32
  LIBID_MSAATEXTLib = "150e2d7a-dac1-4582-947d-2a8fd78b82cd"
  TS_STRF_START = 0_u32
  TS_STRF_MID = 1_u32
  TS_STRF_END = 2_u32
  TSATTRID_OTHERS = "b3c32af9-57d0-46a9-bca8-dac238a13057"
  TSATTRID_Font = "573ea825-749b-4f8a-9cfd-21c3605ca828"
  TSATTRID_Font_FaceName = "b536aeb6-053b-4eb8-b65a-50da1e81e72e"
  TSATTRID_Font_SizePts = "c8493302-a5e9-456d-af04-8005e4130f03"
  TSATTRID_Font_Style = "68b2a77f-6b0e-4f28-8177-571c2f3a42b1"
  TSATTRID_Font_Style_Bold = "48813a43-8a20-4940-8e58-97823f7b268a"
  TSATTRID_Font_Style_Italic = "8740682a-a765-48e1-acfc-d22222b2f810"
  TSATTRID_Font_Style_SmallCaps = "facb6bc6-9100-4cc6-b969-11eea45a86b4"
  TSATTRID_Font_Style_Capitalize = "7d85a3ba-b4fd-43b3-befc-6b985c843141"
  TSATTRID_Font_Style_Uppercase = "33a300e8-e340-4937-b697-8f234045cd9a"
  TSATTRID_Font_Style_Lowercase = "76d8ccb5-ca7b-4498-8ee9-d5c4f6f74c60"
  TSATTRID_Font_Style_Animation = "dcf73d22-e029-47b7-bb36-f263a3d004cc"
  TSATTRID_Font_Style_Animation_LasVegasLights = "f40423d5-0f87-4f8f-bada-e6d60c25e152"
  TSATTRID_Font_Style_Animation_BlinkingBackground = "86e5b104-0104-4b10-b585-00f2527522b5"
  TSATTRID_Font_Style_Animation_SparkleText = "533aad20-962c-4e9f-8c09-b42ea4749711"
  TSATTRID_Font_Style_Animation_MarchingBlackAnts = "7644e067-f186-4902-bfc6-ec815aa20e9d"
  TSATTRID_Font_Style_Animation_MarchingRedAnts = "78368dad-50fb-4c6f-840b-d486bb6cf781"
  TSATTRID_Font_Style_Animation_Shimmer = "2ce31b58-5293-4c36-8809-bf8bb51a27b3"
  TSATTRID_Font_Style_Animation_WipeDown = "5872e874-367b-4803-b160-c90ff62569d0"
  TSATTRID_Font_Style_Animation_WipeRight = "b855cbe3-3d2c-4600-b1e9-e1c9ce02f842"
  TSATTRID_Font_Style_Emboss = "bd8ed742-349e-4e37-82fb-437979cb53a7"
  TSATTRID_Font_Style_Engrave = "9c3371de-8332-4897-be5d-89233223179a"
  TSATTRID_Font_Style_Hidden = "b1e28770-881c-475f-863f-887a647b1090"
  TSATTRID_Font_Style_Kerning = "cc26e1b4-2f9a-47c8-8bff-bf1eb7cce0dd"
  TSATTRID_Font_Style_Outlined = "10e6db31-db0d-4ac6-a7f5-9c9cff6f2ab4"
  TSATTRID_Font_Style_Position = "15cd26ab-f2fb-4062-b5a6-9a49e1a5cc0b"
  TSATTRID_Font_Style_Protected = "1c557cb2-14cf-4554-a574-ecb2f7e7efd4"
  TSATTRID_Font_Style_Shadow = "5f686d2f-c6cd-4c56-8a1a-994a4b9766be"
  TSATTRID_Font_Style_Spacing = "98c1200d-8f06-409a-8e49-6a554bf7c153"
  TSATTRID_Font_Style_Weight = "12f3189c-8bb0-461b-b1fa-eaf907047fe0"
  TSATTRID_Font_Style_Height = "7e937477-12e6-458b-926a-1fa44ee8f391"
  TSATTRID_Font_Style_Underline = "c3c9c9f3-7902-444b-9a7b-48e70f4b50f7"
  TSATTRID_Font_Style_Underline_Single = "1b6720e5-0f73-4951-a6b3-6f19e43c9461"
  TSATTRID_Font_Style_Underline_Double = "74d24aa6-1db3-4c69-a176-31120e7586d5"
  TSATTRID_Font_Style_Strikethrough = "0c562193-2d08-4668-9601-ced41309d7af"
  TSATTRID_Font_Style_Strikethrough_Single = "75d736b6-3c8f-4b97-ab78-1877cb990d31"
  TSATTRID_Font_Style_Strikethrough_Double = "62489b31-a3e7-4f94-ac43-ebaf8fcc7a9f"
  TSATTRID_Font_Style_Overline = "e3989f4a-992b-4301-8ce1-a5b7c6d1f3c8"
  TSATTRID_Font_Style_Overline_Single = "8440d94c-51ce-47b2-8d4c-15751e5f721b"
  TSATTRID_Font_Style_Overline_Double = "dc46063a-e115-46e3-bcd8-ca6772aa95b4"
  TSATTRID_Font_Style_Blink = "bfb2c036-7acf-4532-b720-b416dd7765a8"
  TSATTRID_Font_Style_Subscript = "5774fb84-389b-43bc-a74b-1568347cf0f4"
  TSATTRID_Font_Style_Superscript = "2ea4993c-563c-49aa-9372-0bef09a9255b"
  TSATTRID_Font_Style_Color = "857a7a37-b8af-4e9a-81b4-acf700c8411b"
  TSATTRID_Font_Style_BackgroundColor = "b50eaa4e-3091-4468-81db-d79ea190c7c7"
  TSATTRID_Text = "7edb8e68-81f9-449d-a15a-87a8388faac0"
  TSATTRID_Text_VerticalWriting = "6bba8195-046f-4ea9-b311-97fd66c4274b"
  TSATTRID_Text_RightToLeft = "ca666e71-1b08-453d-bfdd-28e08c8aaf7a"
  TSATTRID_Text_Orientation = "6bab707f-8785-4c39-8b52-96f878303ffb"
  TSATTRID_Text_Language = "d8c04ef1-5753-4c25-8887-85443fe5f819"
  TSATTRID_Text_ReadOnly = "85836617-de32-4afd-a50f-a2db110e6e4d"
  TSATTRID_Text_EmbeddedObject = "7edb8e68-81f9-449d-a15a-87a8388faac0"
  TSATTRID_Text_Alignment = "139941e6-1767-456d-938e-35ba568b5cd4"
  TSATTRID_Text_Alignment_Left = "16ae95d3-6361-43a2-8495-d00f397f1693"
  TSATTRID_Text_Alignment_Right = "b36f0f98-1b9e-4360-8616-03fb08a78456"
  TSATTRID_Text_Alignment_Center = "a4a95c16-53bf-4d55-8b87-4bdd8d4275fc"
  TSATTRID_Text_Alignment_Justify = "ed350740-a0f7-42d3-8ea8-f81b6488faf0"
  TSATTRID_Text_Link = "47cd9051-3722-4cd8-b7c8-4e17ca1759f5"
  TSATTRID_Text_Hyphenation = "dadf4525-618e-49eb-b1a8-3b68bd7648e3"
  TSATTRID_Text_Para = "5edc5822-99dc-4dd6-aec3-b62baa5b2e7c"
  TSATTRID_Text_Para_FirstLineIndent = "07c97a13-7472-4dd8-90a9-91e3d7e4f29c"
  TSATTRID_Text_Para_LeftIndent = "fb2848e9-7471-41c9-b6b3-8a1450e01897"
  TSATTRID_Text_Para_RightIndent = "2c7f26f9-a5e2-48da-b98a-520cb16513bf"
  TSATTRID_Text_Para_SpaceAfter = "7b0a3f55-22dc-425f-a411-93da1d8f9baa"
  TSATTRID_Text_Para_SpaceBefore = "8df98589-194a-4601-b251-9865a3e906dd"
  TSATTRID_Text_Para_LineSpacing = "699b380d-7f8c-46d6-a73b-dfe3d1538df3"
  TSATTRID_Text_Para_LineSpacing_Single = "ed350740-a0f7-42d3-8ea8-f81b6488faf0"
  TSATTRID_Text_Para_LineSpacing_OnePtFive = "0428a021-0397-4b57-9a17-0795994cd3c5"
  TSATTRID_Text_Para_LineSpacing_Double = "82fb1805-a6c4-4231-ac12-6260af2aba28"
  TSATTRID_Text_Para_LineSpacing_AtLeast = "adfedf31-2d44-4434-a5ff-7f4c4990a905"
  TSATTRID_Text_Para_LineSpacing_Exactly = "3d45ad40-23de-48d7-a6b3-765420c620cc"
  TSATTRID_Text_Para_LineSpacing_Multiple = "910f1e3c-d6d0-4f65-8a3c-42b4b31868c5"
  TSATTRID_List = "436d673b-26f1-4aee-9e65-8f83a4ed4884"
  TSATTRID_List_LevelIndel = "7f7cc899-311f-487b-ad5d-e2a459e12d42"
  TSATTRID_List_Type = "ae3e665e-4bce-49e3-a0fe-2db47d3a17ae"
  TSATTRID_List_Type_Bullet = "bccd77c5-4c4d-4ce2-b102-559f3b2bfcea"
  TSATTRID_List_Type_Arabic = "1338c5d6-98a3-4fa3-9bd1-7a60eef8e9e0"
  TSATTRID_List_Type_LowerLetter = "96372285-f3cf-491e-a925-3832347fd237"
  TSATTRID_List_Type_UpperLetter = "7987b7cd-ce52-428b-9b95-a357f6f10c45"
  TSATTRID_List_Type_LowerRoman = "90466262-3980-4b8e-9368-918bd1218a41"
  TSATTRID_List_Type_UpperRoman = "0f6ab552-4a80-467f-b2f1-127e2aa3ba9e"
  TSATTRID_App = "a80f77df-4237-40e5-849c-b5fa51c13ac7"
  TSATTRID_App_IncorrectSpelling = "f42de43c-ef12-430d-944c-9a08970a25d2"
  TSATTRID_App_IncorrectGrammar = "bd54e398-ad03-4b74-b6b3-5edb19996388"
  MSAAControl = LibC::GUID.new(0x8cd963f_u32, 0x7a3e_u16, 0x4f5c_u16, StaticArray[0x9b_u8, 0xd8_u8, 0xd6_u8, 0x92_u8, 0xbb_u8, 0x4_u8, 0x3c_u8, 0x5b_u8])
  AccStore = LibC::GUID.new(0x5440837f_u32, 0x4bff_u16, 0x4ae5_u16, StaticArray[0xa1_u8, 0xb1_u8, 0x77_u8, 0x22_u8, 0xec_u8, 0xc6_u8, 0x33_u8, 0x2a_u8])
  AccDictionary = LibC::GUID.new(0x6572ee16_u32, 0x5fe5_u16, 0x4331_u16, StaticArray[0xbb_u8, 0x6d_u8, 0x76_u8, 0xa4_u8, 0x9c_u8, 0x56_u8, 0xe4_u8, 0x23_u8])
  AccServerDocMgr = LibC::GUID.new(0x6089a37e_u32, 0xeb8a_u16, 0x482d_u16, StaticArray[0xbd_u8, 0x6f_u8, 0xf9_u8, 0xf4_u8, 0x69_u8, 0x4_u8, 0xd1_u8, 0x6d_u8])
  AccClientDocMgr = LibC::GUID.new(0xfc48cc30_u32, 0x4f3e_u16, 0x4fa1_u16, StaticArray[0x80_u8, 0x3b_u8, 0xad_u8, 0xe_u8, 0x19_u8, 0x6a_u8, 0x83_u8, 0xb1_u8])
  DocWrap = LibC::GUID.new(0xbf426f7e_u32, 0x7a5e_u16, 0x44d6_u16, StaticArray[0x83_u8, 0xc_u8, 0xa3_u8, 0x90_u8, 0xea_u8, 0x94_u8, 0x62_u8, 0xa3_u8])


  enum LANG_BAR_ITEM_ICON_MODE_FLAGS : UInt32
    TF_DTLBI_NONE = 0
    TF_DTLBI_USEPROFILEICON = 1
  end

  enum TEXT_STORE_TEXT_CHANGE_FLAGS : UInt32
    TS_ST_NONE = 0
    TS_ST_CORRECTION = 1
  end

  enum TEXT_STORE_CHANGE_FLAGS : UInt32
    TS_TC_NONE = 0
    TS_TC_CORRECTION = 1
  end

  enum INSERT_TEXT_AT_SELECTION_FLAGS : UInt32
    TF_IAS_NOQUERY = 1
    TF_IAS_QUERYONLY = 2
    TF_IAS_NO_DEFAULT_COMPOSITION = 2147483648
  end

  enum ANCHOR_CHANGE_HISTORY_FLAGS : UInt32
    TS_CH_PRECEDING_DEL = 1
    TS_CH_FOLLOWING_DEL = 2
  end

  enum TEXT_STORE_LOCK_FLAGS : UInt32
    TS_LF_READ = 2
    TS_LF_READWRITE = 6
  end

  enum GET_TEXT_AND_PROPERTY_UPDATES_FLAGS : UInt32
    TF_GTP_NONE = 0
    TF_GTP_INCL_TEXT = 1
  end

  enum TF_CONTEXT_EDIT_CONTEXT_FLAGS : UInt32
    TF_ES_ASYNCDONTCARE = 0
    TF_ES_SYNC = 1
    TF_ES_READ = 2
    TF_ES_READWRITE = 6
    TF_ES_ASYNC = 8
  end

  enum TsActiveSelEnd : Int32
    TS_AE_NONE = 0
    TS_AE_START = 1
    TS_AE_END = 2
  end

  enum TsLayoutCode : Int32
    TS_LC_CREATE = 0
    TS_LC_CHANGE = 1
    TS_LC_DESTROY = 2
  end

  enum TsRunType : Int32
    TS_RT_PLAIN = 0
    TS_RT_HIDDEN = 1
    TS_RT_OPAQUE = 2
  end

  enum TsGravity : Int32
    TS_GR_BACKWARD = 0
    TS_GR_FORWARD = 1
  end

  enum TsShiftDir : Int32
    TS_SD_BACKWARD = 0
    TS_SD_FORWARD = 1
  end

  enum TfLBIClick : Int32
    TF_LBI_CLK_RIGHT = 1
    TF_LBI_CLK_LEFT = 2
  end

  enum TfLBBalloonStyle : Int32
    TF_LB_BALLOON_RECO = 0
    TF_LB_BALLOON_SHOW = 1
    TF_LB_BALLOON_MISS = 2
  end

  enum TfAnchor : Int32
    TF_ANCHOR_START = 0
    TF_ANCHOR_END = 1
  end

  enum TfActiveSelEnd : Int32
    TF_AE_NONE = 0
    TF_AE_START = 1
    TF_AE_END = 2
  end

  enum TfLayoutCode : Int32
    TF_LC_CREATE = 0
    TF_LC_CHANGE = 1
    TF_LC_DESTROY = 2
  end

  enum TfGravity : Int32
    TF_GRAVITY_BACKWARD = 0
    TF_GRAVITY_FORWARD = 1
  end

  enum TfShiftDir : Int32
    TF_SD_BACKWARD = 0
    TF_SD_FORWARD = 1
  end

  enum TF_DA_LINESTYLE : Int32
    TF_LS_NONE = 0
    TF_LS_SOLID = 1
    TF_LS_DOT = 2
    TF_LS_DASH = 3
    TF_LS_SQUIGGLE = 4
  end

  enum TF_DA_COLORTYPE : Int32
    TF_CT_NONE = 0
    TF_CT_SYSCOLOR = 1
    TF_CT_COLORREF = 2
  end

  enum TF_DA_ATTR_INFO : Int32
    TF_ATTR_INPUT = 0
    TF_ATTR_TARGET_CONVERTED = 1
    TF_ATTR_CONVERTED = 2
    TF_ATTR_TARGET_NOTCONVERTED = 3
    TF_ATTR_INPUT_ERROR = 4
    TF_ATTR_FIXEDCONVERTED = 5
    TF_ATTR_OTHER = -1
  end

  enum TfCandidateResult : Int32
    CAND_FINALIZED = 0
    CAND_SELECTED = 1
    CAND_CANCELED = 2
  end

  enum TfSapiObject : Int32
    GETIF_RESMGR = 0
    GETIF_RECOCONTEXT = 1
    GETIF_RECOGNIZER = 2
    GETIF_VOICE = 3
    GETIF_DICTGRAM = 4
    GETIF_RECOGNIZERNOINIT = 5
  end

  enum TfIntegratableCandidateListSelectionStyle : Int32
    STYLE_ACTIVE_SELECTION = 0
    STYLE_IMPLIED_SELECTION = 1
  end

  enum TKBLayoutType : Int32
    TKBLT_UNDEFINED = 0
    TKBLT_CLASSIC = 1
    TKBLT_OPTIMIZED = 2
  end

  enum InputScope : Int32
    IS_DEFAULT = 0
    IS_URL = 1
    IS_FILE_FULLFILEPATH = 2
    IS_FILE_FILENAME = 3
    IS_EMAIL_USERNAME = 4
    IS_EMAIL_SMTPEMAILADDRESS = 5
    IS_LOGINNAME = 6
    IS_PERSONALNAME_FULLNAME = 7
    IS_PERSONALNAME_PREFIX = 8
    IS_PERSONALNAME_GIVENNAME = 9
    IS_PERSONALNAME_MIDDLENAME = 10
    IS_PERSONALNAME_SURNAME = 11
    IS_PERSONALNAME_SUFFIX = 12
    IS_ADDRESS_FULLPOSTALADDRESS = 13
    IS_ADDRESS_POSTALCODE = 14
    IS_ADDRESS_STREET = 15
    IS_ADDRESS_STATEORPROVINCE = 16
    IS_ADDRESS_CITY = 17
    IS_ADDRESS_COUNTRYNAME = 18
    IS_ADDRESS_COUNTRYSHORTNAME = 19
    IS_CURRENCY_AMOUNTANDSYMBOL = 20
    IS_CURRENCY_AMOUNT = 21
    IS_DATE_FULLDATE = 22
    IS_DATE_MONTH = 23
    IS_DATE_DAY = 24
    IS_DATE_YEAR = 25
    IS_DATE_MONTHNAME = 26
    IS_DATE_DAYNAME = 27
    IS_DIGITS = 28
    IS_NUMBER = 29
    IS_ONECHAR = 30
    IS_PASSWORD = 31
    IS_TELEPHONE_FULLTELEPHONENUMBER = 32
    IS_TELEPHONE_COUNTRYCODE = 33
    IS_TELEPHONE_AREACODE = 34
    IS_TELEPHONE_LOCALNUMBER = 35
    IS_TIME_FULLTIME = 36
    IS_TIME_HOUR = 37
    IS_TIME_MINORSEC = 38
    IS_NUMBER_FULLWIDTH = 39
    IS_ALPHANUMERIC_HALFWIDTH = 40
    IS_ALPHANUMERIC_FULLWIDTH = 41
    IS_CURRENCY_CHINESE = 42
    IS_BOPOMOFO = 43
    IS_HIRAGANA = 44
    IS_KATAKANA_HALFWIDTH = 45
    IS_KATAKANA_FULLWIDTH = 46
    IS_HANJA = 47
    IS_HANGUL_HALFWIDTH = 48
    IS_HANGUL_FULLWIDTH = 49
    IS_SEARCH = 50
    IS_FORMULA = 51
    IS_SEARCH_INCREMENTAL = 52
    IS_CHINESE_HALFWIDTH = 53
    IS_CHINESE_FULLWIDTH = 54
    IS_NATIVE_SCRIPT = 55
    IS_YOMI = 56
    IS_TEXT = 57
    IS_CHAT = 58
    IS_NAME_OR_PHONENUMBER = 59
    IS_EMAILNAME_OR_ADDRESS = 60
    IS_PRIVATE = 61
    IS_MAPS = 62
    IS_NUMERIC_PASSWORD = 63
    IS_NUMERIC_PIN = 64
    IS_ALPHANUMERIC_PIN = 65
    IS_ALPHANUMERIC_PIN_SET = 66
    IS_FORMULA_NUMBER = 67
    IS_CHAT_WITHOUT_EMOJI = 68
    IS_PHRASELIST = -1
    IS_REGULAREXPRESSION = -2
    IS_SRGS = -3
    IS_XML = -4
    IS_ENUMSTRING = -5
  end

  union TF_DA_COLOR_Anonymous_e__Union
    n_index : Int32
    cr : UInt32
  end
  union TF_LMLATTELEMENT_Anonymous_e__Union
    i_cost : Int32
  end

  struct TS_STATUS
    dw_dynamic_flags : UInt32
    dw_static_flags : UInt32
  end
  struct TS_TEXTCHANGE
    acp_start : Int32
    acp_old_end : Int32
    acp_new_end : Int32
  end
  struct TS_SELECTIONSTYLE
    ase : TsActiveSelEnd
    f_interim_char : LibC::BOOL
  end
  struct TS_SELECTION_ACP
    acp_start : Int32
    acp_end : Int32
    style : TS_SELECTIONSTYLE
  end
  struct TS_SELECTION_ANCHOR
    pa_start : IAnchor
    pa_end : IAnchor
    style : TS_SELECTIONSTYLE
  end
  struct TS_ATTRVAL
    id_attr : Guid
    dw_overlap_id : UInt32
    var_value : VARIANT
  end
  struct TS_RUNINFO
    u_count : UInt32
    type : TsRunType
  end
  struct TF_LANGBARITEMINFO
    clsid_service : Guid
    guid_item : Guid
    dw_style : UInt32
    ul_sort : UInt32
    sz_description : Char[32]*
  end
  struct TF_LBBALLOONINFO
    style : TfLBBalloonStyle
    bstr_text : UInt8*
  end
  struct TF_PERSISTENT_PROPERTY_HEADER_ACP
    guid_type : Guid
    ich_start : Int32
    cch : Int32
    cb : UInt32
    dw_private : UInt32
    clsid_tip : Guid
  end
  struct TF_LANGUAGEPROFILE
    clsid : Guid
    langid : UInt16
    catid : Guid
    f_active : LibC::BOOL
    guid_profile : Guid
  end
  struct TF_SELECTIONSTYLE
    ase : TfActiveSelEnd
    f_interim_char : LibC::BOOL
  end
  struct TF_SELECTION
    range : ITfRange
    style : TF_SELECTIONSTYLE
  end
  struct TF_PROPERTYVAL
    guid_id : Guid
    var_value : VARIANT
  end
  struct TF_HALTCOND
    p_halt_range : ITfRange
    a_halt_pos : TfAnchor
    dw_flags : UInt32
  end
  struct TF_INPUTPROCESSORPROFILE
    dw_profile_type : UInt32
    langid : UInt16
    clsid : Guid
    guid_profile : Guid
    catid : Guid
    hkl_substitute : HKL
    dw_caps : UInt32
    hkl : HKL
    dw_flags : UInt32
  end
  struct TF_PRESERVEDKEY
    u_v_key : UInt32
    u_modifiers : UInt32
  end
  struct TF_DA_COLOR
    type : TF_DA_COLORTYPE
    anonymous : TF_DA_COLOR_Anonymous_e__Union
  end
  struct TF_DISPLAYATTRIBUTE
    cr_text : TF_DA_COLOR
    cr_bk : TF_DA_COLOR
    ls_style : TF_DA_LINESTYLE
    f_bold_line : LibC::BOOL
    cr_line : TF_DA_COLOR
    b_attr : TF_DA_ATTR_INFO
  end
  struct TF_LMLATTELEMENT
    dw_frame_start : UInt32
    dw_frame_len : UInt32
    dw_flags : UInt32
    anonymous : TF_LMLATTELEMENT_Anonymous_e__Union
    bstr_text : UInt8*
  end


  struct ITextStoreACPVTbl
    query_interface : Proc(ITextStoreACP*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITextStoreACP*, UInt32)
    release : Proc(ITextStoreACP*, UInt32)
    advise_sink : Proc(ITextStoreACP*, Guid*, IUnknown, UInt32, HRESULT)
    unadvise_sink : Proc(ITextStoreACP*, IUnknown, HRESULT)
    request_lock : Proc(ITextStoreACP*, UInt32, HRESULT*, HRESULT)
    get_status : Proc(ITextStoreACP*, TS_STATUS*, HRESULT)
    query_insert : Proc(ITextStoreACP*, Int32, Int32, UInt32, Int32*, Int32*, HRESULT)
    get_selection : Proc(ITextStoreACP*, UInt32, UInt32, TS_SELECTION_ACP*, UInt32*, HRESULT)
    set_selection : Proc(ITextStoreACP*, UInt32, TS_SELECTION_ACP*, HRESULT)
    get_text : Proc(ITextStoreACP*, Int32, Int32, Char*, UInt32, UInt32*, TS_RUNINFO*, UInt32, UInt32*, Int32*, HRESULT)
    set_text : Proc(ITextStoreACP*, UInt32, Int32, Int32, Char*, UInt32, TS_TEXTCHANGE*, HRESULT)
    get_formatted_text : Proc(ITextStoreACP*, Int32, Int32, IDataObject*, HRESULT)
    get_embedded : Proc(ITextStoreACP*, Int32, Guid*, Guid*, IUnknown*, HRESULT)
    query_insert_embedded : Proc(ITextStoreACP*, Guid*, FORMATETC*, LibC::BOOL*, HRESULT)
    insert_embedded : Proc(ITextStoreACP*, UInt32, Int32, Int32, IDataObject, TS_TEXTCHANGE*, HRESULT)
    insert_text_at_selection : Proc(ITextStoreACP*, UInt32, Char*, UInt32, Int32*, Int32*, TS_TEXTCHANGE*, HRESULT)
    insert_embedded_at_selection : Proc(ITextStoreACP*, UInt32, IDataObject, Int32*, Int32*, TS_TEXTCHANGE*, HRESULT)
    request_supported_attrs : Proc(ITextStoreACP*, UInt32, UInt32, Guid*, HRESULT)
    request_attrs_at_position : Proc(ITextStoreACP*, Int32, UInt32, Guid*, UInt32, HRESULT)
    request_attrs_transitioning_at_position : Proc(ITextStoreACP*, Int32, UInt32, Guid*, UInt32, HRESULT)
    find_next_attr_transition : Proc(ITextStoreACP*, Int32, Int32, UInt32, Guid*, UInt32, Int32*, LibC::BOOL*, Int32*, HRESULT)
    retrieve_requested_attrs : Proc(ITextStoreACP*, UInt32, TS_ATTRVAL*, UInt32*, HRESULT)
    get_end_acp : Proc(ITextStoreACP*, Int32*, HRESULT)
    get_active_view : Proc(ITextStoreACP*, UInt32*, HRESULT)
    get_acp_from_point : Proc(ITextStoreACP*, UInt32, POINT*, UInt32, Int32*, HRESULT)
    get_text_ext : Proc(ITextStoreACP*, UInt32, Int32, Int32, RECT*, LibC::BOOL*, HRESULT)
    get_screen_ext : Proc(ITextStoreACP*, UInt32, RECT*, HRESULT)
    get_wnd : Proc(ITextStoreACP*, UInt32, HANDLE*, HRESULT)
  end

  struct ITextStoreACP
    lpVtbl : ITextStoreACPVTbl*
  end

  struct ITextStoreACP2VTbl
    query_interface : Proc(ITextStoreACP2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITextStoreACP2*, UInt32)
    release : Proc(ITextStoreACP2*, UInt32)
    advise_sink : Proc(ITextStoreACP2*, Guid*, IUnknown, UInt32, HRESULT)
    unadvise_sink : Proc(ITextStoreACP2*, IUnknown, HRESULT)
    request_lock : Proc(ITextStoreACP2*, UInt32, HRESULT*, HRESULT)
    get_status : Proc(ITextStoreACP2*, TS_STATUS*, HRESULT)
    query_insert : Proc(ITextStoreACP2*, Int32, Int32, UInt32, Int32*, Int32*, HRESULT)
    get_selection : Proc(ITextStoreACP2*, UInt32, UInt32, TS_SELECTION_ACP*, UInt32*, HRESULT)
    set_selection : Proc(ITextStoreACP2*, UInt32, TS_SELECTION_ACP*, HRESULT)
    get_text : Proc(ITextStoreACP2*, Int32, Int32, Char*, UInt32, UInt32*, TS_RUNINFO*, UInt32, UInt32*, Int32*, HRESULT)
    set_text : Proc(ITextStoreACP2*, UInt32, Int32, Int32, Char*, UInt32, TS_TEXTCHANGE*, HRESULT)
    get_formatted_text : Proc(ITextStoreACP2*, Int32, Int32, IDataObject*, HRESULT)
    get_embedded : Proc(ITextStoreACP2*, Int32, Guid*, Guid*, IUnknown*, HRESULT)
    query_insert_embedded : Proc(ITextStoreACP2*, Guid*, FORMATETC*, LibC::BOOL*, HRESULT)
    insert_embedded : Proc(ITextStoreACP2*, UInt32, Int32, Int32, IDataObject, TS_TEXTCHANGE*, HRESULT)
    insert_text_at_selection : Proc(ITextStoreACP2*, UInt32, Char*, UInt32, Int32*, Int32*, TS_TEXTCHANGE*, HRESULT)
    insert_embedded_at_selection : Proc(ITextStoreACP2*, UInt32, IDataObject, Int32*, Int32*, TS_TEXTCHANGE*, HRESULT)
    request_supported_attrs : Proc(ITextStoreACP2*, UInt32, UInt32, Guid*, HRESULT)
    request_attrs_at_position : Proc(ITextStoreACP2*, Int32, UInt32, Guid*, UInt32, HRESULT)
    request_attrs_transitioning_at_position : Proc(ITextStoreACP2*, Int32, UInt32, Guid*, UInt32, HRESULT)
    find_next_attr_transition : Proc(ITextStoreACP2*, Int32, Int32, UInt32, Guid*, UInt32, Int32*, LibC::BOOL*, Int32*, HRESULT)
    retrieve_requested_attrs : Proc(ITextStoreACP2*, UInt32, TS_ATTRVAL*, UInt32*, HRESULT)
    get_end_acp : Proc(ITextStoreACP2*, Int32*, HRESULT)
    get_active_view : Proc(ITextStoreACP2*, UInt32*, HRESULT)
    get_acp_from_point : Proc(ITextStoreACP2*, UInt32, POINT*, UInt32, Int32*, HRESULT)
    get_text_ext : Proc(ITextStoreACP2*, UInt32, Int32, Int32, RECT*, LibC::BOOL*, HRESULT)
    get_screen_ext : Proc(ITextStoreACP2*, UInt32, RECT*, HRESULT)
  end

  struct ITextStoreACP2
    lpVtbl : ITextStoreACP2VTbl*
  end

  struct ITextStoreACPSinkVTbl
    query_interface : Proc(ITextStoreACPSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITextStoreACPSink*, UInt32)
    release : Proc(ITextStoreACPSink*, UInt32)
    on_text_change : Proc(ITextStoreACPSink*, TEXT_STORE_TEXT_CHANGE_FLAGS, TS_TEXTCHANGE*, HRESULT)
    on_selection_change : Proc(ITextStoreACPSink*, HRESULT)
    on_layout_change : Proc(ITextStoreACPSink*, TsLayoutCode, UInt32, HRESULT)
    on_status_change : Proc(ITextStoreACPSink*, UInt32, HRESULT)
    on_attrs_change : Proc(ITextStoreACPSink*, Int32, Int32, UInt32, Guid*, HRESULT)
    on_lock_granted : Proc(ITextStoreACPSink*, TEXT_STORE_LOCK_FLAGS, HRESULT)
    on_start_edit_transaction : Proc(ITextStoreACPSink*, HRESULT)
    on_end_edit_transaction : Proc(ITextStoreACPSink*, HRESULT)
  end

  struct ITextStoreACPSink
    lpVtbl : ITextStoreACPSinkVTbl*
  end

  struct IAnchorVTbl
    query_interface : Proc(IAnchor*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAnchor*, UInt32)
    release : Proc(IAnchor*, UInt32)
    set_gravity : Proc(IAnchor*, TsGravity, HRESULT)
    get_gravity : Proc(IAnchor*, TsGravity*, HRESULT)
    is_equal : Proc(IAnchor*, IAnchor, LibC::BOOL*, HRESULT)
    compare : Proc(IAnchor*, IAnchor, Int32*, HRESULT)
    shift : Proc(IAnchor*, UInt32, Int32, Int32*, IAnchor, HRESULT)
    shift_to : Proc(IAnchor*, IAnchor, HRESULT)
    shift_region : Proc(IAnchor*, UInt32, TsShiftDir, LibC::BOOL*, HRESULT)
    set_change_history_mask : Proc(IAnchor*, UInt32, HRESULT)
    get_change_history : Proc(IAnchor*, ANCHOR_CHANGE_HISTORY_FLAGS*, HRESULT)
    clear_change_history : Proc(IAnchor*, HRESULT)
    clone : Proc(IAnchor*, IAnchor*, HRESULT)
  end

  struct IAnchor
    lpVtbl : IAnchorVTbl*
  end

  struct ITextStoreAnchorVTbl
    query_interface : Proc(ITextStoreAnchor*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITextStoreAnchor*, UInt32)
    release : Proc(ITextStoreAnchor*, UInt32)
    advise_sink : Proc(ITextStoreAnchor*, Guid*, IUnknown, UInt32, HRESULT)
    unadvise_sink : Proc(ITextStoreAnchor*, IUnknown, HRESULT)
    request_lock : Proc(ITextStoreAnchor*, UInt32, HRESULT*, HRESULT)
    get_status : Proc(ITextStoreAnchor*, TS_STATUS*, HRESULT)
    query_insert : Proc(ITextStoreAnchor*, IAnchor, IAnchor, UInt32, IAnchor*, IAnchor*, HRESULT)
    get_selection : Proc(ITextStoreAnchor*, UInt32, UInt32, TS_SELECTION_ANCHOR*, UInt32*, HRESULT)
    set_selection : Proc(ITextStoreAnchor*, UInt32, TS_SELECTION_ANCHOR*, HRESULT)
    get_text : Proc(ITextStoreAnchor*, UInt32, IAnchor, IAnchor, Char*, UInt32, UInt32*, LibC::BOOL, HRESULT)
    set_text : Proc(ITextStoreAnchor*, UInt32, IAnchor, IAnchor, Char*, UInt32, HRESULT)
    get_formatted_text : Proc(ITextStoreAnchor*, IAnchor, IAnchor, IDataObject*, HRESULT)
    get_embedded : Proc(ITextStoreAnchor*, UInt32, IAnchor, Guid*, Guid*, IUnknown*, HRESULT)
    insert_embedded : Proc(ITextStoreAnchor*, UInt32, IAnchor, IAnchor, IDataObject, HRESULT)
    request_supported_attrs : Proc(ITextStoreAnchor*, UInt32, UInt32, Guid*, HRESULT)
    request_attrs_at_position : Proc(ITextStoreAnchor*, IAnchor, UInt32, Guid*, UInt32, HRESULT)
    request_attrs_transitioning_at_position : Proc(ITextStoreAnchor*, IAnchor, UInt32, Guid*, UInt32, HRESULT)
    find_next_attr_transition : Proc(ITextStoreAnchor*, IAnchor, IAnchor, UInt32, Guid*, UInt32, LibC::BOOL*, Int32*, HRESULT)
    retrieve_requested_attrs : Proc(ITextStoreAnchor*, UInt32, TS_ATTRVAL*, UInt32*, HRESULT)
    get_start : Proc(ITextStoreAnchor*, IAnchor*, HRESULT)
    get_end : Proc(ITextStoreAnchor*, IAnchor*, HRESULT)
    get_active_view : Proc(ITextStoreAnchor*, UInt32*, HRESULT)
    get_anchor_from_point : Proc(ITextStoreAnchor*, UInt32, POINT*, UInt32, IAnchor*, HRESULT)
    get_text_ext : Proc(ITextStoreAnchor*, UInt32, IAnchor, IAnchor, RECT*, LibC::BOOL*, HRESULT)
    get_screen_ext : Proc(ITextStoreAnchor*, UInt32, RECT*, HRESULT)
    get_wnd : Proc(ITextStoreAnchor*, UInt32, HANDLE*, HRESULT)
    query_insert_embedded : Proc(ITextStoreAnchor*, Guid*, FORMATETC*, LibC::BOOL*, HRESULT)
    insert_text_at_selection : Proc(ITextStoreAnchor*, UInt32, Char*, UInt32, IAnchor*, IAnchor*, HRESULT)
    insert_embedded_at_selection : Proc(ITextStoreAnchor*, UInt32, IDataObject, IAnchor*, IAnchor*, HRESULT)
  end

  struct ITextStoreAnchor
    lpVtbl : ITextStoreAnchorVTbl*
  end

  struct ITextStoreAnchorSinkVTbl
    query_interface : Proc(ITextStoreAnchorSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITextStoreAnchorSink*, UInt32)
    release : Proc(ITextStoreAnchorSink*, UInt32)
    on_text_change : Proc(ITextStoreAnchorSink*, TEXT_STORE_CHANGE_FLAGS, IAnchor, IAnchor, HRESULT)
    on_selection_change : Proc(ITextStoreAnchorSink*, HRESULT)
    on_layout_change : Proc(ITextStoreAnchorSink*, TsLayoutCode, UInt32, HRESULT)
    on_status_change : Proc(ITextStoreAnchorSink*, UInt32, HRESULT)
    on_attrs_change : Proc(ITextStoreAnchorSink*, IAnchor, IAnchor, UInt32, Guid*, HRESULT)
    on_lock_granted : Proc(ITextStoreAnchorSink*, TEXT_STORE_LOCK_FLAGS, HRESULT)
    on_start_edit_transaction : Proc(ITextStoreAnchorSink*, HRESULT)
    on_end_edit_transaction : Proc(ITextStoreAnchorSink*, HRESULT)
  end

  struct ITextStoreAnchorSink
    lpVtbl : ITextStoreAnchorSinkVTbl*
  end

  struct ITfLangBarMgrVTbl
    query_interface : Proc(ITfLangBarMgr*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfLangBarMgr*, UInt32)
    release : Proc(ITfLangBarMgr*, UInt32)
    advise_event_sink : Proc(ITfLangBarMgr*, ITfLangBarEventSink, LibC::HANDLE, UInt32, UInt32*, HRESULT)
    unadvise_event_sink : Proc(ITfLangBarMgr*, UInt32, HRESULT)
    get_thread_marshal_interface : Proc(ITfLangBarMgr*, UInt32, UInt32, Guid*, IUnknown*, HRESULT)
    get_thread_lang_bar_item_mgr : Proc(ITfLangBarMgr*, UInt32, ITfLangBarItemMgr*, UInt32*, HRESULT)
    get_input_processor_profiles : Proc(ITfLangBarMgr*, UInt32, ITfInputProcessorProfiles*, UInt32*, HRESULT)
    restore_last_focus : Proc(ITfLangBarMgr*, UInt32*, LibC::BOOL, HRESULT)
    set_modal_input : Proc(ITfLangBarMgr*, ITfLangBarEventSink, UInt32, UInt32, HRESULT)
    show_floating : Proc(ITfLangBarMgr*, UInt32, HRESULT)
    get_show_floating_status : Proc(ITfLangBarMgr*, UInt32*, HRESULT)
  end

  struct ITfLangBarMgr
    lpVtbl : ITfLangBarMgrVTbl*
  end

  struct ITfLangBarEventSinkVTbl
    query_interface : Proc(ITfLangBarEventSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfLangBarEventSink*, UInt32)
    release : Proc(ITfLangBarEventSink*, UInt32)
    on_set_focus : Proc(ITfLangBarEventSink*, UInt32, HRESULT)
    on_thread_terminate : Proc(ITfLangBarEventSink*, UInt32, HRESULT)
    on_thread_item_change : Proc(ITfLangBarEventSink*, UInt32, HRESULT)
    on_modal_input : Proc(ITfLangBarEventSink*, UInt32, UInt32, LibC::UINT_PTR, LPARAM, HRESULT)
    show_floating : Proc(ITfLangBarEventSink*, UInt32, HRESULT)
    get_item_floating_rect : Proc(ITfLangBarEventSink*, UInt32, Guid*, RECT*, HRESULT)
  end

  struct ITfLangBarEventSink
    lpVtbl : ITfLangBarEventSinkVTbl*
  end

  struct ITfLangBarItemSinkVTbl
    query_interface : Proc(ITfLangBarItemSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfLangBarItemSink*, UInt32)
    release : Proc(ITfLangBarItemSink*, UInt32)
    on_update : Proc(ITfLangBarItemSink*, UInt32, HRESULT)
  end

  struct ITfLangBarItemSink
    lpVtbl : ITfLangBarItemSinkVTbl*
  end

  struct IEnumTfLangBarItemsVTbl
    query_interface : Proc(IEnumTfLangBarItems*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumTfLangBarItems*, UInt32)
    release : Proc(IEnumTfLangBarItems*, UInt32)
    clone : Proc(IEnumTfLangBarItems*, IEnumTfLangBarItems*, HRESULT)
    next : Proc(IEnumTfLangBarItems*, UInt32, ITfLangBarItem*, UInt32*, HRESULT)
    reset : Proc(IEnumTfLangBarItems*, HRESULT)
    skip : Proc(IEnumTfLangBarItems*, UInt32, HRESULT)
  end

  struct IEnumTfLangBarItems
    lpVtbl : IEnumTfLangBarItemsVTbl*
  end

  struct ITfLangBarItemMgrVTbl
    query_interface : Proc(ITfLangBarItemMgr*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfLangBarItemMgr*, UInt32)
    release : Proc(ITfLangBarItemMgr*, UInt32)
    enum_items : Proc(ITfLangBarItemMgr*, IEnumTfLangBarItems*, HRESULT)
    get_item : Proc(ITfLangBarItemMgr*, Guid*, ITfLangBarItem*, HRESULT)
    add_item : Proc(ITfLangBarItemMgr*, ITfLangBarItem, HRESULT)
    remove_item : Proc(ITfLangBarItemMgr*, ITfLangBarItem, HRESULT)
    advise_item_sink : Proc(ITfLangBarItemMgr*, ITfLangBarItemSink, UInt32*, Guid*, HRESULT)
    unadvise_item_sink : Proc(ITfLangBarItemMgr*, UInt32, HRESULT)
    get_item_floating_rect : Proc(ITfLangBarItemMgr*, UInt32, Guid*, RECT*, HRESULT)
    get_items_status : Proc(ITfLangBarItemMgr*, UInt32, Guid*, UInt32*, HRESULT)
    get_item_num : Proc(ITfLangBarItemMgr*, UInt32*, HRESULT)
    get_items : Proc(ITfLangBarItemMgr*, UInt32, ITfLangBarItem*, TF_LANGBARITEMINFO*, UInt32*, UInt32*, HRESULT)
    advise_items_sink : Proc(ITfLangBarItemMgr*, UInt32, ITfLangBarItemSink*, Guid*, UInt32*, HRESULT)
    unadvise_items_sink : Proc(ITfLangBarItemMgr*, UInt32, UInt32*, HRESULT)
  end

  struct ITfLangBarItemMgr
    lpVtbl : ITfLangBarItemMgrVTbl*
  end

  struct ITfLangBarItemVTbl
    query_interface : Proc(ITfLangBarItem*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfLangBarItem*, UInt32)
    release : Proc(ITfLangBarItem*, UInt32)
    get_info : Proc(ITfLangBarItem*, TF_LANGBARITEMINFO*, HRESULT)
    get_status : Proc(ITfLangBarItem*, UInt32*, HRESULT)
    show : Proc(ITfLangBarItem*, LibC::BOOL, HRESULT)
    get_tooltip_string : Proc(ITfLangBarItem*, UInt8**, HRESULT)
  end

  struct ITfLangBarItem
    lpVtbl : ITfLangBarItemVTbl*
  end

  struct ITfSystemLangBarItemSinkVTbl
    query_interface : Proc(ITfSystemLangBarItemSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfSystemLangBarItemSink*, UInt32)
    release : Proc(ITfSystemLangBarItemSink*, UInt32)
    init_menu : Proc(ITfSystemLangBarItemSink*, ITfMenu, HRESULT)
    on_menu_select : Proc(ITfSystemLangBarItemSink*, UInt32, HRESULT)
  end

  struct ITfSystemLangBarItemSink
    lpVtbl : ITfSystemLangBarItemSinkVTbl*
  end

  struct ITfSystemLangBarItemVTbl
    query_interface : Proc(ITfSystemLangBarItem*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfSystemLangBarItem*, UInt32)
    release : Proc(ITfSystemLangBarItem*, UInt32)
    set_icon : Proc(ITfSystemLangBarItem*, LibC::HANDLE, HRESULT)
    set_tooltip_string : Proc(ITfSystemLangBarItem*, Char*, UInt32, HRESULT)
  end

  struct ITfSystemLangBarItem
    lpVtbl : ITfSystemLangBarItemVTbl*
  end

  struct ITfSystemLangBarItemTextVTbl
    query_interface : Proc(ITfSystemLangBarItemText*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfSystemLangBarItemText*, UInt32)
    release : Proc(ITfSystemLangBarItemText*, UInt32)
    set_item_text : Proc(ITfSystemLangBarItemText*, Char*, UInt32, HRESULT)
    get_item_text : Proc(ITfSystemLangBarItemText*, UInt8**, HRESULT)
  end

  struct ITfSystemLangBarItemText
    lpVtbl : ITfSystemLangBarItemTextVTbl*
  end

  struct ITfSystemDeviceTypeLangBarItemVTbl
    query_interface : Proc(ITfSystemDeviceTypeLangBarItem*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfSystemDeviceTypeLangBarItem*, UInt32)
    release : Proc(ITfSystemDeviceTypeLangBarItem*, UInt32)
    set_icon_mode : Proc(ITfSystemDeviceTypeLangBarItem*, LANG_BAR_ITEM_ICON_MODE_FLAGS, HRESULT)
    get_icon_mode : Proc(ITfSystemDeviceTypeLangBarItem*, UInt32*, HRESULT)
  end

  struct ITfSystemDeviceTypeLangBarItem
    lpVtbl : ITfSystemDeviceTypeLangBarItemVTbl*
  end

  struct ITfLangBarItemButtonVTbl
    query_interface : Proc(ITfLangBarItemButton*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfLangBarItemButton*, UInt32)
    release : Proc(ITfLangBarItemButton*, UInt32)
    get_info : Proc(ITfLangBarItemButton*, TF_LANGBARITEMINFO*, HRESULT)
    get_status : Proc(ITfLangBarItemButton*, UInt32*, HRESULT)
    show : Proc(ITfLangBarItemButton*, LibC::BOOL, HRESULT)
    get_tooltip_string : Proc(ITfLangBarItemButton*, UInt8**, HRESULT)
    on_click : Proc(ITfLangBarItemButton*, TfLBIClick, POINT, RECT*, HRESULT)
    init_menu : Proc(ITfLangBarItemButton*, ITfMenu, HRESULT)
    on_menu_select : Proc(ITfLangBarItemButton*, UInt32, HRESULT)
    get_icon : Proc(ITfLangBarItemButton*, HANDLE*, HRESULT)
    get_text : Proc(ITfLangBarItemButton*, UInt8**, HRESULT)
  end

  struct ITfLangBarItemButton
    lpVtbl : ITfLangBarItemButtonVTbl*
  end

  struct ITfLangBarItemBitmapButtonVTbl
    query_interface : Proc(ITfLangBarItemBitmapButton*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfLangBarItemBitmapButton*, UInt32)
    release : Proc(ITfLangBarItemBitmapButton*, UInt32)
    get_info : Proc(ITfLangBarItemBitmapButton*, TF_LANGBARITEMINFO*, HRESULT)
    get_status : Proc(ITfLangBarItemBitmapButton*, UInt32*, HRESULT)
    show : Proc(ITfLangBarItemBitmapButton*, LibC::BOOL, HRESULT)
    get_tooltip_string : Proc(ITfLangBarItemBitmapButton*, UInt8**, HRESULT)
    on_click : Proc(ITfLangBarItemBitmapButton*, TfLBIClick, POINT, RECT*, HRESULT)
    init_menu : Proc(ITfLangBarItemBitmapButton*, ITfMenu, HRESULT)
    on_menu_select : Proc(ITfLangBarItemBitmapButton*, UInt32, HRESULT)
    get_preferred_size : Proc(ITfLangBarItemBitmapButton*, SIZE*, SIZE*, HRESULT)
    draw_bitmap : Proc(ITfLangBarItemBitmapButton*, Int32, Int32, UInt32, HBITMAP*, HBITMAP*, HRESULT)
    get_text : Proc(ITfLangBarItemBitmapButton*, UInt8**, HRESULT)
  end

  struct ITfLangBarItemBitmapButton
    lpVtbl : ITfLangBarItemBitmapButtonVTbl*
  end

  struct ITfLangBarItemBitmapVTbl
    query_interface : Proc(ITfLangBarItemBitmap*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfLangBarItemBitmap*, UInt32)
    release : Proc(ITfLangBarItemBitmap*, UInt32)
    get_info : Proc(ITfLangBarItemBitmap*, TF_LANGBARITEMINFO*, HRESULT)
    get_status : Proc(ITfLangBarItemBitmap*, UInt32*, HRESULT)
    show : Proc(ITfLangBarItemBitmap*, LibC::BOOL, HRESULT)
    get_tooltip_string : Proc(ITfLangBarItemBitmap*, UInt8**, HRESULT)
    on_click : Proc(ITfLangBarItemBitmap*, TfLBIClick, POINT, RECT*, HRESULT)
    get_preferred_size : Proc(ITfLangBarItemBitmap*, SIZE*, SIZE*, HRESULT)
    draw_bitmap : Proc(ITfLangBarItemBitmap*, Int32, Int32, UInt32, HBITMAP*, HBITMAP*, HRESULT)
  end

  struct ITfLangBarItemBitmap
    lpVtbl : ITfLangBarItemBitmapVTbl*
  end

  struct ITfLangBarItemBalloonVTbl
    query_interface : Proc(ITfLangBarItemBalloon*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfLangBarItemBalloon*, UInt32)
    release : Proc(ITfLangBarItemBalloon*, UInt32)
    get_info : Proc(ITfLangBarItemBalloon*, TF_LANGBARITEMINFO*, HRESULT)
    get_status : Proc(ITfLangBarItemBalloon*, UInt32*, HRESULT)
    show : Proc(ITfLangBarItemBalloon*, LibC::BOOL, HRESULT)
    get_tooltip_string : Proc(ITfLangBarItemBalloon*, UInt8**, HRESULT)
    on_click : Proc(ITfLangBarItemBalloon*, TfLBIClick, POINT, RECT*, HRESULT)
    get_preferred_size : Proc(ITfLangBarItemBalloon*, SIZE*, SIZE*, HRESULT)
    get_balloon_info : Proc(ITfLangBarItemBalloon*, TF_LBBALLOONINFO*, HRESULT)
  end

  struct ITfLangBarItemBalloon
    lpVtbl : ITfLangBarItemBalloonVTbl*
  end

  struct ITfMenuVTbl
    query_interface : Proc(ITfMenu*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfMenu*, UInt32)
    release : Proc(ITfMenu*, UInt32)
    add_menu_item : Proc(ITfMenu*, UInt32, UInt32, HBITMAP, HBITMAP, Char*, UInt32, ITfMenu*, HRESULT)
  end

  struct ITfMenu
    lpVtbl : ITfMenuVTbl*
  end

  struct ITfThreadMgrVTbl
    query_interface : Proc(ITfThreadMgr*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfThreadMgr*, UInt32)
    release : Proc(ITfThreadMgr*, UInt32)
    activate : Proc(ITfThreadMgr*, UInt32*, HRESULT)
    deactivate : Proc(ITfThreadMgr*, HRESULT)
    create_document_mgr : Proc(ITfThreadMgr*, ITfDocumentMgr*, HRESULT)
    enum_document_mgrs : Proc(ITfThreadMgr*, IEnumTfDocumentMgrs*, HRESULT)
    get_focus : Proc(ITfThreadMgr*, ITfDocumentMgr*, HRESULT)
    set_focus : Proc(ITfThreadMgr*, ITfDocumentMgr, HRESULT)
    associate_focus : Proc(ITfThreadMgr*, LibC::HANDLE, ITfDocumentMgr, ITfDocumentMgr*, HRESULT)
    is_thread_focus : Proc(ITfThreadMgr*, LibC::BOOL*, HRESULT)
    get_function_provider : Proc(ITfThreadMgr*, Guid*, ITfFunctionProvider*, HRESULT)
    enum_function_providers : Proc(ITfThreadMgr*, IEnumTfFunctionProviders*, HRESULT)
    get_global_compartment : Proc(ITfThreadMgr*, ITfCompartmentMgr*, HRESULT)
  end

  struct ITfThreadMgr
    lpVtbl : ITfThreadMgrVTbl*
  end

  struct ITfThreadMgrExVTbl
    query_interface : Proc(ITfThreadMgrEx*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfThreadMgrEx*, UInt32)
    release : Proc(ITfThreadMgrEx*, UInt32)
    activate : Proc(ITfThreadMgrEx*, UInt32*, HRESULT)
    deactivate : Proc(ITfThreadMgrEx*, HRESULT)
    create_document_mgr : Proc(ITfThreadMgrEx*, ITfDocumentMgr*, HRESULT)
    enum_document_mgrs : Proc(ITfThreadMgrEx*, IEnumTfDocumentMgrs*, HRESULT)
    get_focus : Proc(ITfThreadMgrEx*, ITfDocumentMgr*, HRESULT)
    set_focus : Proc(ITfThreadMgrEx*, ITfDocumentMgr, HRESULT)
    associate_focus : Proc(ITfThreadMgrEx*, LibC::HANDLE, ITfDocumentMgr, ITfDocumentMgr*, HRESULT)
    is_thread_focus : Proc(ITfThreadMgrEx*, LibC::BOOL*, HRESULT)
    get_function_provider : Proc(ITfThreadMgrEx*, Guid*, ITfFunctionProvider*, HRESULT)
    enum_function_providers : Proc(ITfThreadMgrEx*, IEnumTfFunctionProviders*, HRESULT)
    get_global_compartment : Proc(ITfThreadMgrEx*, ITfCompartmentMgr*, HRESULT)
    activate_ex : Proc(ITfThreadMgrEx*, UInt32*, UInt32, HRESULT)
    get_active_flags : Proc(ITfThreadMgrEx*, UInt32*, HRESULT)
  end

  struct ITfThreadMgrEx
    lpVtbl : ITfThreadMgrExVTbl*
  end

  struct ITfThreadMgr2VTbl
    query_interface : Proc(ITfThreadMgr2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfThreadMgr2*, UInt32)
    release : Proc(ITfThreadMgr2*, UInt32)
    activate : Proc(ITfThreadMgr2*, UInt32*, HRESULT)
    deactivate : Proc(ITfThreadMgr2*, HRESULT)
    create_document_mgr : Proc(ITfThreadMgr2*, ITfDocumentMgr*, HRESULT)
    enum_document_mgrs : Proc(ITfThreadMgr2*, IEnumTfDocumentMgrs*, HRESULT)
    get_focus : Proc(ITfThreadMgr2*, ITfDocumentMgr*, HRESULT)
    set_focus : Proc(ITfThreadMgr2*, ITfDocumentMgr, HRESULT)
    is_thread_focus : Proc(ITfThreadMgr2*, LibC::BOOL*, HRESULT)
    get_function_provider : Proc(ITfThreadMgr2*, Guid*, ITfFunctionProvider*, HRESULT)
    enum_function_providers : Proc(ITfThreadMgr2*, IEnumTfFunctionProviders*, HRESULT)
    get_global_compartment : Proc(ITfThreadMgr2*, ITfCompartmentMgr*, HRESULT)
    activate_ex : Proc(ITfThreadMgr2*, UInt32*, UInt32, HRESULT)
    get_active_flags : Proc(ITfThreadMgr2*, UInt32*, HRESULT)
    suspend_keystroke_handling : Proc(ITfThreadMgr2*, HRESULT)
    resume_keystroke_handling : Proc(ITfThreadMgr2*, HRESULT)
  end

  struct ITfThreadMgr2
    lpVtbl : ITfThreadMgr2VTbl*
  end

  struct ITfThreadMgrEventSinkVTbl
    query_interface : Proc(ITfThreadMgrEventSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfThreadMgrEventSink*, UInt32)
    release : Proc(ITfThreadMgrEventSink*, UInt32)
    on_init_document_mgr : Proc(ITfThreadMgrEventSink*, ITfDocumentMgr, HRESULT)
    on_uninit_document_mgr : Proc(ITfThreadMgrEventSink*, ITfDocumentMgr, HRESULT)
    on_set_focus : Proc(ITfThreadMgrEventSink*, ITfDocumentMgr, ITfDocumentMgr, HRESULT)
    on_push_context : Proc(ITfThreadMgrEventSink*, ITfContext, HRESULT)
    on_pop_context : Proc(ITfThreadMgrEventSink*, ITfContext, HRESULT)
  end

  struct ITfThreadMgrEventSink
    lpVtbl : ITfThreadMgrEventSinkVTbl*
  end

  struct ITfConfigureSystemKeystrokeFeedVTbl
    query_interface : Proc(ITfConfigureSystemKeystrokeFeed*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfConfigureSystemKeystrokeFeed*, UInt32)
    release : Proc(ITfConfigureSystemKeystrokeFeed*, UInt32)
    disable_system_keystroke_feed : Proc(ITfConfigureSystemKeystrokeFeed*, HRESULT)
    enable_system_keystroke_feed : Proc(ITfConfigureSystemKeystrokeFeed*, HRESULT)
  end

  struct ITfConfigureSystemKeystrokeFeed
    lpVtbl : ITfConfigureSystemKeystrokeFeedVTbl*
  end

  struct IEnumTfDocumentMgrsVTbl
    query_interface : Proc(IEnumTfDocumentMgrs*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumTfDocumentMgrs*, UInt32)
    release : Proc(IEnumTfDocumentMgrs*, UInt32)
    clone : Proc(IEnumTfDocumentMgrs*, IEnumTfDocumentMgrs*, HRESULT)
    next : Proc(IEnumTfDocumentMgrs*, UInt32, ITfDocumentMgr*, UInt32*, HRESULT)
    reset : Proc(IEnumTfDocumentMgrs*, HRESULT)
    skip : Proc(IEnumTfDocumentMgrs*, UInt32, HRESULT)
  end

  struct IEnumTfDocumentMgrs
    lpVtbl : IEnumTfDocumentMgrsVTbl*
  end

  struct ITfDocumentMgrVTbl
    query_interface : Proc(ITfDocumentMgr*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfDocumentMgr*, UInt32)
    release : Proc(ITfDocumentMgr*, UInt32)
    create_context : Proc(ITfDocumentMgr*, UInt32, UInt32, IUnknown, ITfContext*, UInt32*, HRESULT)
    push : Proc(ITfDocumentMgr*, ITfContext, HRESULT)
    pop : Proc(ITfDocumentMgr*, UInt32, HRESULT)
    get_top : Proc(ITfDocumentMgr*, ITfContext*, HRESULT)
    get_base : Proc(ITfDocumentMgr*, ITfContext*, HRESULT)
    enum_contexts : Proc(ITfDocumentMgr*, IEnumTfContexts*, HRESULT)
  end

  struct ITfDocumentMgr
    lpVtbl : ITfDocumentMgrVTbl*
  end

  struct IEnumTfContextsVTbl
    query_interface : Proc(IEnumTfContexts*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumTfContexts*, UInt32)
    release : Proc(IEnumTfContexts*, UInt32)
    clone : Proc(IEnumTfContexts*, IEnumTfContexts*, HRESULT)
    next : Proc(IEnumTfContexts*, UInt32, ITfContext*, UInt32*, HRESULT)
    reset : Proc(IEnumTfContexts*, HRESULT)
    skip : Proc(IEnumTfContexts*, UInt32, HRESULT)
  end

  struct IEnumTfContexts
    lpVtbl : IEnumTfContextsVTbl*
  end

  struct ITfCompositionViewVTbl
    query_interface : Proc(ITfCompositionView*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfCompositionView*, UInt32)
    release : Proc(ITfCompositionView*, UInt32)
    get_owner_clsid : Proc(ITfCompositionView*, Guid*, HRESULT)
    get_range : Proc(ITfCompositionView*, ITfRange*, HRESULT)
  end

  struct ITfCompositionView
    lpVtbl : ITfCompositionViewVTbl*
  end

  struct IEnumITfCompositionViewVTbl
    query_interface : Proc(IEnumITfCompositionView*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumITfCompositionView*, UInt32)
    release : Proc(IEnumITfCompositionView*, UInt32)
    clone : Proc(IEnumITfCompositionView*, IEnumITfCompositionView*, HRESULT)
    next : Proc(IEnumITfCompositionView*, UInt32, ITfCompositionView*, UInt32*, HRESULT)
    reset : Proc(IEnumITfCompositionView*, HRESULT)
    skip : Proc(IEnumITfCompositionView*, UInt32, HRESULT)
  end

  struct IEnumITfCompositionView
    lpVtbl : IEnumITfCompositionViewVTbl*
  end

  struct ITfCompositionVTbl
    query_interface : Proc(ITfComposition*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfComposition*, UInt32)
    release : Proc(ITfComposition*, UInt32)
    get_range : Proc(ITfComposition*, ITfRange*, HRESULT)
    shift_start : Proc(ITfComposition*, UInt32, ITfRange, HRESULT)
    shift_end : Proc(ITfComposition*, UInt32, ITfRange, HRESULT)
    end_composition : Proc(ITfComposition*, UInt32, HRESULT)
  end

  struct ITfComposition
    lpVtbl : ITfCompositionVTbl*
  end

  struct ITfCompositionSinkVTbl
    query_interface : Proc(ITfCompositionSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfCompositionSink*, UInt32)
    release : Proc(ITfCompositionSink*, UInt32)
    on_composition_terminated : Proc(ITfCompositionSink*, UInt32, ITfComposition, HRESULT)
  end

  struct ITfCompositionSink
    lpVtbl : ITfCompositionSinkVTbl*
  end

  struct ITfContextCompositionVTbl
    query_interface : Proc(ITfContextComposition*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfContextComposition*, UInt32)
    release : Proc(ITfContextComposition*, UInt32)
    start_composition : Proc(ITfContextComposition*, UInt32, ITfRange, ITfCompositionSink, ITfComposition*, HRESULT)
    enum_compositions : Proc(ITfContextComposition*, IEnumITfCompositionView*, HRESULT)
    find_composition : Proc(ITfContextComposition*, UInt32, ITfRange, IEnumITfCompositionView*, HRESULT)
    take_ownership : Proc(ITfContextComposition*, UInt32, ITfCompositionView, ITfCompositionSink, ITfComposition*, HRESULT)
  end

  struct ITfContextComposition
    lpVtbl : ITfContextCompositionVTbl*
  end

  struct ITfContextOwnerCompositionServicesVTbl
    query_interface : Proc(ITfContextOwnerCompositionServices*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfContextOwnerCompositionServices*, UInt32)
    release : Proc(ITfContextOwnerCompositionServices*, UInt32)
    start_composition : Proc(ITfContextOwnerCompositionServices*, UInt32, ITfRange, ITfCompositionSink, ITfComposition*, HRESULT)
    enum_compositions : Proc(ITfContextOwnerCompositionServices*, IEnumITfCompositionView*, HRESULT)
    find_composition : Proc(ITfContextOwnerCompositionServices*, UInt32, ITfRange, IEnumITfCompositionView*, HRESULT)
    take_ownership : Proc(ITfContextOwnerCompositionServices*, UInt32, ITfCompositionView, ITfCompositionSink, ITfComposition*, HRESULT)
    terminate_composition : Proc(ITfContextOwnerCompositionServices*, ITfCompositionView, HRESULT)
  end

  struct ITfContextOwnerCompositionServices
    lpVtbl : ITfContextOwnerCompositionServicesVTbl*
  end

  struct ITfContextOwnerCompositionSinkVTbl
    query_interface : Proc(ITfContextOwnerCompositionSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfContextOwnerCompositionSink*, UInt32)
    release : Proc(ITfContextOwnerCompositionSink*, UInt32)
    on_start_composition : Proc(ITfContextOwnerCompositionSink*, ITfCompositionView, LibC::BOOL*, HRESULT)
    on_update_composition : Proc(ITfContextOwnerCompositionSink*, ITfCompositionView, ITfRange, HRESULT)
    on_end_composition : Proc(ITfContextOwnerCompositionSink*, ITfCompositionView, HRESULT)
  end

  struct ITfContextOwnerCompositionSink
    lpVtbl : ITfContextOwnerCompositionSinkVTbl*
  end

  struct ITfContextViewVTbl
    query_interface : Proc(ITfContextView*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfContextView*, UInt32)
    release : Proc(ITfContextView*, UInt32)
    get_range_from_point : Proc(ITfContextView*, UInt32, POINT*, UInt32, ITfRange*, HRESULT)
    get_text_ext : Proc(ITfContextView*, UInt32, ITfRange, RECT*, LibC::BOOL*, HRESULT)
    get_screen_ext : Proc(ITfContextView*, RECT*, HRESULT)
    get_wnd : Proc(ITfContextView*, HANDLE*, HRESULT)
  end

  struct ITfContextView
    lpVtbl : ITfContextViewVTbl*
  end

  struct IEnumTfContextViewsVTbl
    query_interface : Proc(IEnumTfContextViews*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumTfContextViews*, UInt32)
    release : Proc(IEnumTfContextViews*, UInt32)
    clone : Proc(IEnumTfContextViews*, IEnumTfContextViews*, HRESULT)
    next : Proc(IEnumTfContextViews*, UInt32, ITfContextView*, UInt32*, HRESULT)
    reset : Proc(IEnumTfContextViews*, HRESULT)
    skip : Proc(IEnumTfContextViews*, UInt32, HRESULT)
  end

  struct IEnumTfContextViews
    lpVtbl : IEnumTfContextViewsVTbl*
  end

  struct ITfContextVTbl
    query_interface : Proc(ITfContext*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfContext*, UInt32)
    release : Proc(ITfContext*, UInt32)
    request_edit_session : Proc(ITfContext*, UInt32, ITfEditSession, TF_CONTEXT_EDIT_CONTEXT_FLAGS, HRESULT*, HRESULT)
    in_write_session : Proc(ITfContext*, UInt32, LibC::BOOL*, HRESULT)
    get_selection : Proc(ITfContext*, UInt32, UInt32, UInt32, TF_SELECTION*, UInt32*, HRESULT)
    set_selection : Proc(ITfContext*, UInt32, UInt32, TF_SELECTION*, HRESULT)
    get_start : Proc(ITfContext*, UInt32, ITfRange*, HRESULT)
    get_end : Proc(ITfContext*, UInt32, ITfRange*, HRESULT)
    get_active_view : Proc(ITfContext*, ITfContextView*, HRESULT)
    enum_views : Proc(ITfContext*, IEnumTfContextViews*, HRESULT)
    get_status : Proc(ITfContext*, TS_STATUS*, HRESULT)
    get_property : Proc(ITfContext*, Guid*, ITfProperty*, HRESULT)
    get_app_property : Proc(ITfContext*, Guid*, ITfReadOnlyProperty*, HRESULT)
    track_properties : Proc(ITfContext*, Guid**, UInt32, Guid**, UInt32, ITfReadOnlyProperty*, HRESULT)
    enum_properties : Proc(ITfContext*, IEnumTfProperties*, HRESULT)
    get_document_mgr : Proc(ITfContext*, ITfDocumentMgr*, HRESULT)
    create_range_backup : Proc(ITfContext*, UInt32, ITfRange, ITfRangeBackup*, HRESULT)
  end

  struct ITfContext
    lpVtbl : ITfContextVTbl*
  end

  struct ITfQueryEmbeddedVTbl
    query_interface : Proc(ITfQueryEmbedded*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfQueryEmbedded*, UInt32)
    release : Proc(ITfQueryEmbedded*, UInt32)
    query_insert_embedded : Proc(ITfQueryEmbedded*, Guid*, FORMATETC*, LibC::BOOL*, HRESULT)
  end

  struct ITfQueryEmbedded
    lpVtbl : ITfQueryEmbeddedVTbl*
  end

  struct ITfInsertAtSelectionVTbl
    query_interface : Proc(ITfInsertAtSelection*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfInsertAtSelection*, UInt32)
    release : Proc(ITfInsertAtSelection*, UInt32)
    insert_text_at_selection : Proc(ITfInsertAtSelection*, UInt32, INSERT_TEXT_AT_SELECTION_FLAGS, Char*, Int32, ITfRange*, HRESULT)
    insert_embedded_at_selection : Proc(ITfInsertAtSelection*, UInt32, UInt32, IDataObject, ITfRange*, HRESULT)
  end

  struct ITfInsertAtSelection
    lpVtbl : ITfInsertAtSelectionVTbl*
  end

  struct ITfCleanupContextSinkVTbl
    query_interface : Proc(ITfCleanupContextSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfCleanupContextSink*, UInt32)
    release : Proc(ITfCleanupContextSink*, UInt32)
    on_cleanup_context : Proc(ITfCleanupContextSink*, UInt32, ITfContext, HRESULT)
  end

  struct ITfCleanupContextSink
    lpVtbl : ITfCleanupContextSinkVTbl*
  end

  struct ITfCleanupContextDurationSinkVTbl
    query_interface : Proc(ITfCleanupContextDurationSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfCleanupContextDurationSink*, UInt32)
    release : Proc(ITfCleanupContextDurationSink*, UInt32)
    on_start_cleanup_context : Proc(ITfCleanupContextDurationSink*, HRESULT)
    on_end_cleanup_context : Proc(ITfCleanupContextDurationSink*, HRESULT)
  end

  struct ITfCleanupContextDurationSink
    lpVtbl : ITfCleanupContextDurationSinkVTbl*
  end

  struct ITfReadOnlyPropertyVTbl
    query_interface : Proc(ITfReadOnlyProperty*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfReadOnlyProperty*, UInt32)
    release : Proc(ITfReadOnlyProperty*, UInt32)
    get_type : Proc(ITfReadOnlyProperty*, Guid*, HRESULT)
    enum_ranges : Proc(ITfReadOnlyProperty*, UInt32, IEnumTfRanges*, ITfRange, HRESULT)
    get_value : Proc(ITfReadOnlyProperty*, UInt32, ITfRange, VARIANT*, HRESULT)
    get_context : Proc(ITfReadOnlyProperty*, ITfContext*, HRESULT)
  end

  struct ITfReadOnlyProperty
    lpVtbl : ITfReadOnlyPropertyVTbl*
  end

  struct IEnumTfPropertyValueVTbl
    query_interface : Proc(IEnumTfPropertyValue*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumTfPropertyValue*, UInt32)
    release : Proc(IEnumTfPropertyValue*, UInt32)
    clone : Proc(IEnumTfPropertyValue*, IEnumTfPropertyValue*, HRESULT)
    next : Proc(IEnumTfPropertyValue*, UInt32, TF_PROPERTYVAL*, UInt32*, HRESULT)
    reset : Proc(IEnumTfPropertyValue*, HRESULT)
    skip : Proc(IEnumTfPropertyValue*, UInt32, HRESULT)
  end

  struct IEnumTfPropertyValue
    lpVtbl : IEnumTfPropertyValueVTbl*
  end

  struct ITfMouseTrackerVTbl
    query_interface : Proc(ITfMouseTracker*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfMouseTracker*, UInt32)
    release : Proc(ITfMouseTracker*, UInt32)
    advise_mouse_sink : Proc(ITfMouseTracker*, ITfRange, ITfMouseSink, UInt32*, HRESULT)
    unadvise_mouse_sink : Proc(ITfMouseTracker*, UInt32, HRESULT)
  end

  struct ITfMouseTracker
    lpVtbl : ITfMouseTrackerVTbl*
  end

  struct ITfMouseTrackerACPVTbl
    query_interface : Proc(ITfMouseTrackerACP*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfMouseTrackerACP*, UInt32)
    release : Proc(ITfMouseTrackerACP*, UInt32)
    advise_mouse_sink : Proc(ITfMouseTrackerACP*, ITfRangeACP, ITfMouseSink, UInt32*, HRESULT)
    unadvise_mouse_sink : Proc(ITfMouseTrackerACP*, UInt32, HRESULT)
  end

  struct ITfMouseTrackerACP
    lpVtbl : ITfMouseTrackerACPVTbl*
  end

  struct ITfMouseSinkVTbl
    query_interface : Proc(ITfMouseSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfMouseSink*, UInt32)
    release : Proc(ITfMouseSink*, UInt32)
    on_mouse_event : Proc(ITfMouseSink*, UInt32, UInt32, UInt32, LibC::BOOL*, HRESULT)
  end

  struct ITfMouseSink
    lpVtbl : ITfMouseSinkVTbl*
  end

  struct ITfEditRecordVTbl
    query_interface : Proc(ITfEditRecord*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfEditRecord*, UInt32)
    release : Proc(ITfEditRecord*, UInt32)
    get_selection_status : Proc(ITfEditRecord*, LibC::BOOL*, HRESULT)
    get_text_and_property_updates : Proc(ITfEditRecord*, GET_TEXT_AND_PROPERTY_UPDATES_FLAGS, Guid**, UInt32, IEnumTfRanges*, HRESULT)
  end

  struct ITfEditRecord
    lpVtbl : ITfEditRecordVTbl*
  end

  struct ITfTextEditSinkVTbl
    query_interface : Proc(ITfTextEditSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfTextEditSink*, UInt32)
    release : Proc(ITfTextEditSink*, UInt32)
    on_end_edit : Proc(ITfTextEditSink*, ITfContext, UInt32, ITfEditRecord, HRESULT)
  end

  struct ITfTextEditSink
    lpVtbl : ITfTextEditSinkVTbl*
  end

  struct ITfTextLayoutSinkVTbl
    query_interface : Proc(ITfTextLayoutSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfTextLayoutSink*, UInt32)
    release : Proc(ITfTextLayoutSink*, UInt32)
    on_layout_change : Proc(ITfTextLayoutSink*, ITfContext, TfLayoutCode, ITfContextView, HRESULT)
  end

  struct ITfTextLayoutSink
    lpVtbl : ITfTextLayoutSinkVTbl*
  end

  struct ITfStatusSinkVTbl
    query_interface : Proc(ITfStatusSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfStatusSink*, UInt32)
    release : Proc(ITfStatusSink*, UInt32)
    on_status_change : Proc(ITfStatusSink*, ITfContext, UInt32, HRESULT)
  end

  struct ITfStatusSink
    lpVtbl : ITfStatusSinkVTbl*
  end

  struct ITfEditTransactionSinkVTbl
    query_interface : Proc(ITfEditTransactionSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfEditTransactionSink*, UInt32)
    release : Proc(ITfEditTransactionSink*, UInt32)
    on_start_edit_transaction : Proc(ITfEditTransactionSink*, ITfContext, HRESULT)
    on_end_edit_transaction : Proc(ITfEditTransactionSink*, ITfContext, HRESULT)
  end

  struct ITfEditTransactionSink
    lpVtbl : ITfEditTransactionSinkVTbl*
  end

  struct ITfContextOwnerVTbl
    query_interface : Proc(ITfContextOwner*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfContextOwner*, UInt32)
    release : Proc(ITfContextOwner*, UInt32)
    get_acp_from_point : Proc(ITfContextOwner*, POINT*, UInt32, Int32*, HRESULT)
    get_text_ext : Proc(ITfContextOwner*, Int32, Int32, RECT*, LibC::BOOL*, HRESULT)
    get_screen_ext : Proc(ITfContextOwner*, RECT*, HRESULT)
    get_status : Proc(ITfContextOwner*, TS_STATUS*, HRESULT)
    get_wnd : Proc(ITfContextOwner*, HANDLE*, HRESULT)
    get_attribute : Proc(ITfContextOwner*, Guid*, VARIANT*, HRESULT)
  end

  struct ITfContextOwner
    lpVtbl : ITfContextOwnerVTbl*
  end

  struct ITfContextOwnerServicesVTbl
    query_interface : Proc(ITfContextOwnerServices*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfContextOwnerServices*, UInt32)
    release : Proc(ITfContextOwnerServices*, UInt32)
    on_layout_change : Proc(ITfContextOwnerServices*, HRESULT)
    on_status_change : Proc(ITfContextOwnerServices*, UInt32, HRESULT)
    on_attribute_change : Proc(ITfContextOwnerServices*, Guid*, HRESULT)
    serialize : Proc(ITfContextOwnerServices*, ITfProperty, ITfRange, TF_PERSISTENT_PROPERTY_HEADER_ACP*, IStream, HRESULT)
    unserialize : Proc(ITfContextOwnerServices*, ITfProperty, TF_PERSISTENT_PROPERTY_HEADER_ACP*, IStream, ITfPersistentPropertyLoaderACP, HRESULT)
    force_load_property : Proc(ITfContextOwnerServices*, ITfProperty, HRESULT)
    create_range : Proc(ITfContextOwnerServices*, Int32, Int32, ITfRangeACP*, HRESULT)
  end

  struct ITfContextOwnerServices
    lpVtbl : ITfContextOwnerServicesVTbl*
  end

  struct ITfContextKeyEventSinkVTbl
    query_interface : Proc(ITfContextKeyEventSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfContextKeyEventSink*, UInt32)
    release : Proc(ITfContextKeyEventSink*, UInt32)
    on_key_down : Proc(ITfContextKeyEventSink*, LibC::UINT_PTR, LPARAM, LibC::BOOL*, HRESULT)
    on_key_up : Proc(ITfContextKeyEventSink*, LibC::UINT_PTR, LPARAM, LibC::BOOL*, HRESULT)
    on_test_key_down : Proc(ITfContextKeyEventSink*, LibC::UINT_PTR, LPARAM, LibC::BOOL*, HRESULT)
    on_test_key_up : Proc(ITfContextKeyEventSink*, LibC::UINT_PTR, LPARAM, LibC::BOOL*, HRESULT)
  end

  struct ITfContextKeyEventSink
    lpVtbl : ITfContextKeyEventSinkVTbl*
  end

  struct ITfEditSessionVTbl
    query_interface : Proc(ITfEditSession*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfEditSession*, UInt32)
    release : Proc(ITfEditSession*, UInt32)
    do_edit_session : Proc(ITfEditSession*, UInt32, HRESULT)
  end

  struct ITfEditSession
    lpVtbl : ITfEditSessionVTbl*
  end

  struct ITfRangeVTbl
    query_interface : Proc(ITfRange*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfRange*, UInt32)
    release : Proc(ITfRange*, UInt32)
    get_text : Proc(ITfRange*, UInt32, UInt32, Char*, UInt32, UInt32*, HRESULT)
    set_text : Proc(ITfRange*, UInt32, UInt32, Char*, Int32, HRESULT)
    get_formatted_text : Proc(ITfRange*, UInt32, IDataObject*, HRESULT)
    get_embedded : Proc(ITfRange*, UInt32, Guid*, Guid*, IUnknown*, HRESULT)
    insert_embedded : Proc(ITfRange*, UInt32, UInt32, IDataObject, HRESULT)
    shift_start : Proc(ITfRange*, UInt32, Int32, Int32*, TF_HALTCOND*, HRESULT)
    shift_end : Proc(ITfRange*, UInt32, Int32, Int32*, TF_HALTCOND*, HRESULT)
    shift_start_to_range : Proc(ITfRange*, UInt32, ITfRange, TfAnchor, HRESULT)
    shift_end_to_range : Proc(ITfRange*, UInt32, ITfRange, TfAnchor, HRESULT)
    shift_start_region : Proc(ITfRange*, UInt32, TfShiftDir, LibC::BOOL*, HRESULT)
    shift_end_region : Proc(ITfRange*, UInt32, TfShiftDir, LibC::BOOL*, HRESULT)
    is_empty : Proc(ITfRange*, UInt32, LibC::BOOL*, HRESULT)
    collapse : Proc(ITfRange*, UInt32, TfAnchor, HRESULT)
    is_equal_start : Proc(ITfRange*, UInt32, ITfRange, TfAnchor, LibC::BOOL*, HRESULT)
    is_equal_end : Proc(ITfRange*, UInt32, ITfRange, TfAnchor, LibC::BOOL*, HRESULT)
    compare_start : Proc(ITfRange*, UInt32, ITfRange, TfAnchor, Int32*, HRESULT)
    compare_end : Proc(ITfRange*, UInt32, ITfRange, TfAnchor, Int32*, HRESULT)
    adjust_for_insert : Proc(ITfRange*, UInt32, UInt32, LibC::BOOL*, HRESULT)
    get_gravity : Proc(ITfRange*, TfGravity*, TfGravity*, HRESULT)
    set_gravity : Proc(ITfRange*, UInt32, TfGravity, TfGravity, HRESULT)
    clone : Proc(ITfRange*, ITfRange*, HRESULT)
    get_context : Proc(ITfRange*, ITfContext*, HRESULT)
  end

  struct ITfRange
    lpVtbl : ITfRangeVTbl*
  end

  struct ITfRangeACPVTbl
    query_interface : Proc(ITfRangeACP*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfRangeACP*, UInt32)
    release : Proc(ITfRangeACP*, UInt32)
    get_text : Proc(ITfRangeACP*, UInt32, UInt32, Char*, UInt32, UInt32*, HRESULT)
    set_text : Proc(ITfRangeACP*, UInt32, UInt32, Char*, Int32, HRESULT)
    get_formatted_text : Proc(ITfRangeACP*, UInt32, IDataObject*, HRESULT)
    get_embedded : Proc(ITfRangeACP*, UInt32, Guid*, Guid*, IUnknown*, HRESULT)
    insert_embedded : Proc(ITfRangeACP*, UInt32, UInt32, IDataObject, HRESULT)
    shift_start : Proc(ITfRangeACP*, UInt32, Int32, Int32*, TF_HALTCOND*, HRESULT)
    shift_end : Proc(ITfRangeACP*, UInt32, Int32, Int32*, TF_HALTCOND*, HRESULT)
    shift_start_to_range : Proc(ITfRangeACP*, UInt32, ITfRange, TfAnchor, HRESULT)
    shift_end_to_range : Proc(ITfRangeACP*, UInt32, ITfRange, TfAnchor, HRESULT)
    shift_start_region : Proc(ITfRangeACP*, UInt32, TfShiftDir, LibC::BOOL*, HRESULT)
    shift_end_region : Proc(ITfRangeACP*, UInt32, TfShiftDir, LibC::BOOL*, HRESULT)
    is_empty : Proc(ITfRangeACP*, UInt32, LibC::BOOL*, HRESULT)
    collapse : Proc(ITfRangeACP*, UInt32, TfAnchor, HRESULT)
    is_equal_start : Proc(ITfRangeACP*, UInt32, ITfRange, TfAnchor, LibC::BOOL*, HRESULT)
    is_equal_end : Proc(ITfRangeACP*, UInt32, ITfRange, TfAnchor, LibC::BOOL*, HRESULT)
    compare_start : Proc(ITfRangeACP*, UInt32, ITfRange, TfAnchor, Int32*, HRESULT)
    compare_end : Proc(ITfRangeACP*, UInt32, ITfRange, TfAnchor, Int32*, HRESULT)
    adjust_for_insert : Proc(ITfRangeACP*, UInt32, UInt32, LibC::BOOL*, HRESULT)
    get_gravity : Proc(ITfRangeACP*, TfGravity*, TfGravity*, HRESULT)
    set_gravity : Proc(ITfRangeACP*, UInt32, TfGravity, TfGravity, HRESULT)
    clone : Proc(ITfRangeACP*, ITfRange*, HRESULT)
    get_context : Proc(ITfRangeACP*, ITfContext*, HRESULT)
    get_extent : Proc(ITfRangeACP*, Int32*, Int32*, HRESULT)
    set_extent : Proc(ITfRangeACP*, Int32, Int32, HRESULT)
  end

  struct ITfRangeACP
    lpVtbl : ITfRangeACPVTbl*
  end

  struct ITextStoreACPServicesVTbl
    query_interface : Proc(ITextStoreACPServices*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITextStoreACPServices*, UInt32)
    release : Proc(ITextStoreACPServices*, UInt32)
    serialize : Proc(ITextStoreACPServices*, ITfProperty, ITfRange, TF_PERSISTENT_PROPERTY_HEADER_ACP*, IStream, HRESULT)
    unserialize : Proc(ITextStoreACPServices*, ITfProperty, TF_PERSISTENT_PROPERTY_HEADER_ACP*, IStream, ITfPersistentPropertyLoaderACP, HRESULT)
    force_load_property : Proc(ITextStoreACPServices*, ITfProperty, HRESULT)
    create_range : Proc(ITextStoreACPServices*, Int32, Int32, ITfRangeACP*, HRESULT)
  end

  struct ITextStoreACPServices
    lpVtbl : ITextStoreACPServicesVTbl*
  end

  struct ITfRangeBackupVTbl
    query_interface : Proc(ITfRangeBackup*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfRangeBackup*, UInt32)
    release : Proc(ITfRangeBackup*, UInt32)
    restore : Proc(ITfRangeBackup*, UInt32, ITfRange, HRESULT)
  end

  struct ITfRangeBackup
    lpVtbl : ITfRangeBackupVTbl*
  end

  struct ITfPropertyStoreVTbl
    query_interface : Proc(ITfPropertyStore*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfPropertyStore*, UInt32)
    release : Proc(ITfPropertyStore*, UInt32)
    get_type : Proc(ITfPropertyStore*, Guid*, HRESULT)
    get_data_type : Proc(ITfPropertyStore*, UInt32*, HRESULT)
    get_data : Proc(ITfPropertyStore*, VARIANT*, HRESULT)
    on_text_updated : Proc(ITfPropertyStore*, UInt32, ITfRange, LibC::BOOL*, HRESULT)
    shrink : Proc(ITfPropertyStore*, ITfRange, LibC::BOOL*, HRESULT)
    divide : Proc(ITfPropertyStore*, ITfRange, ITfRange, ITfPropertyStore*, HRESULT)
    clone : Proc(ITfPropertyStore*, ITfPropertyStore*, HRESULT)
    get_property_range_creator : Proc(ITfPropertyStore*, Guid*, HRESULT)
    serialize : Proc(ITfPropertyStore*, IStream, UInt32*, HRESULT)
  end

  struct ITfPropertyStore
    lpVtbl : ITfPropertyStoreVTbl*
  end

  struct IEnumTfRangesVTbl
    query_interface : Proc(IEnumTfRanges*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumTfRanges*, UInt32)
    release : Proc(IEnumTfRanges*, UInt32)
    clone : Proc(IEnumTfRanges*, IEnumTfRanges*, HRESULT)
    next : Proc(IEnumTfRanges*, UInt32, ITfRange*, UInt32*, HRESULT)
    reset : Proc(IEnumTfRanges*, HRESULT)
    skip : Proc(IEnumTfRanges*, UInt32, HRESULT)
  end

  struct IEnumTfRanges
    lpVtbl : IEnumTfRangesVTbl*
  end

  struct ITfCreatePropertyStoreVTbl
    query_interface : Proc(ITfCreatePropertyStore*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfCreatePropertyStore*, UInt32)
    release : Proc(ITfCreatePropertyStore*, UInt32)
    is_store_serializable : Proc(ITfCreatePropertyStore*, Guid*, ITfRange, ITfPropertyStore, LibC::BOOL*, HRESULT)
    create_property_store : Proc(ITfCreatePropertyStore*, Guid*, ITfRange, UInt32, IStream, ITfPropertyStore*, HRESULT)
  end

  struct ITfCreatePropertyStore
    lpVtbl : ITfCreatePropertyStoreVTbl*
  end

  struct ITfPersistentPropertyLoaderACPVTbl
    query_interface : Proc(ITfPersistentPropertyLoaderACP*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfPersistentPropertyLoaderACP*, UInt32)
    release : Proc(ITfPersistentPropertyLoaderACP*, UInt32)
    load_property : Proc(ITfPersistentPropertyLoaderACP*, TF_PERSISTENT_PROPERTY_HEADER_ACP*, IStream*, HRESULT)
  end

  struct ITfPersistentPropertyLoaderACP
    lpVtbl : ITfPersistentPropertyLoaderACPVTbl*
  end

  struct ITfPropertyVTbl
    query_interface : Proc(ITfProperty*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfProperty*, UInt32)
    release : Proc(ITfProperty*, UInt32)
    get_type : Proc(ITfProperty*, Guid*, HRESULT)
    enum_ranges : Proc(ITfProperty*, UInt32, IEnumTfRanges*, ITfRange, HRESULT)
    get_value : Proc(ITfProperty*, UInt32, ITfRange, VARIANT*, HRESULT)
    get_context : Proc(ITfProperty*, ITfContext*, HRESULT)
    find_range : Proc(ITfProperty*, UInt32, ITfRange, ITfRange*, TfAnchor, HRESULT)
    set_value_store : Proc(ITfProperty*, UInt32, ITfRange, ITfPropertyStore, HRESULT)
    set_value : Proc(ITfProperty*, UInt32, ITfRange, VARIANT*, HRESULT)
    clear : Proc(ITfProperty*, UInt32, ITfRange, HRESULT)
  end

  struct ITfProperty
    lpVtbl : ITfPropertyVTbl*
  end

  struct IEnumTfPropertiesVTbl
    query_interface : Proc(IEnumTfProperties*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumTfProperties*, UInt32)
    release : Proc(IEnumTfProperties*, UInt32)
    clone : Proc(IEnumTfProperties*, IEnumTfProperties*, HRESULT)
    next : Proc(IEnumTfProperties*, UInt32, ITfProperty*, UInt32*, HRESULT)
    reset : Proc(IEnumTfProperties*, HRESULT)
    skip : Proc(IEnumTfProperties*, UInt32, HRESULT)
  end

  struct IEnumTfProperties
    lpVtbl : IEnumTfPropertiesVTbl*
  end

  struct ITfCompartmentVTbl
    query_interface : Proc(ITfCompartment*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfCompartment*, UInt32)
    release : Proc(ITfCompartment*, UInt32)
    set_value : Proc(ITfCompartment*, UInt32, VARIANT*, HRESULT)
    get_value : Proc(ITfCompartment*, VARIANT*, HRESULT)
  end

  struct ITfCompartment
    lpVtbl : ITfCompartmentVTbl*
  end

  struct ITfCompartmentEventSinkVTbl
    query_interface : Proc(ITfCompartmentEventSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfCompartmentEventSink*, UInt32)
    release : Proc(ITfCompartmentEventSink*, UInt32)
    on_change : Proc(ITfCompartmentEventSink*, Guid*, HRESULT)
  end

  struct ITfCompartmentEventSink
    lpVtbl : ITfCompartmentEventSinkVTbl*
  end

  struct ITfCompartmentMgrVTbl
    query_interface : Proc(ITfCompartmentMgr*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfCompartmentMgr*, UInt32)
    release : Proc(ITfCompartmentMgr*, UInt32)
    get_compartment : Proc(ITfCompartmentMgr*, Guid*, ITfCompartment*, HRESULT)
    clear_compartment : Proc(ITfCompartmentMgr*, UInt32, Guid*, HRESULT)
    enum_compartments : Proc(ITfCompartmentMgr*, IEnumGUID*, HRESULT)
  end

  struct ITfCompartmentMgr
    lpVtbl : ITfCompartmentMgrVTbl*
  end

  struct ITfFunctionVTbl
    query_interface : Proc(ITfFunction*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfFunction*, UInt32)
    release : Proc(ITfFunction*, UInt32)
    get_display_name : Proc(ITfFunction*, UInt8**, HRESULT)
  end

  struct ITfFunction
    lpVtbl : ITfFunctionVTbl*
  end

  struct ITfFunctionProviderVTbl
    query_interface : Proc(ITfFunctionProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfFunctionProvider*, UInt32)
    release : Proc(ITfFunctionProvider*, UInt32)
    get_type : Proc(ITfFunctionProvider*, Guid*, HRESULT)
    get_description : Proc(ITfFunctionProvider*, UInt8**, HRESULT)
    get_function : Proc(ITfFunctionProvider*, Guid*, Guid*, IUnknown*, HRESULT)
  end

  struct ITfFunctionProvider
    lpVtbl : ITfFunctionProviderVTbl*
  end

  struct IEnumTfFunctionProvidersVTbl
    query_interface : Proc(IEnumTfFunctionProviders*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumTfFunctionProviders*, UInt32)
    release : Proc(IEnumTfFunctionProviders*, UInt32)
    clone : Proc(IEnumTfFunctionProviders*, IEnumTfFunctionProviders*, HRESULT)
    next : Proc(IEnumTfFunctionProviders*, UInt32, ITfFunctionProvider*, UInt32*, HRESULT)
    reset : Proc(IEnumTfFunctionProviders*, HRESULT)
    skip : Proc(IEnumTfFunctionProviders*, UInt32, HRESULT)
  end

  struct IEnumTfFunctionProviders
    lpVtbl : IEnumTfFunctionProvidersVTbl*
  end

  struct ITfInputProcessorProfilesVTbl
    query_interface : Proc(ITfInputProcessorProfiles*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfInputProcessorProfiles*, UInt32)
    release : Proc(ITfInputProcessorProfiles*, UInt32)
    register : Proc(ITfInputProcessorProfiles*, Guid*, HRESULT)
    unregister : Proc(ITfInputProcessorProfiles*, Guid*, HRESULT)
    add_language_profile : Proc(ITfInputProcessorProfiles*, Guid*, UInt16, Guid*, Char*, UInt32, Char*, UInt32, UInt32, HRESULT)
    remove_language_profile : Proc(ITfInputProcessorProfiles*, Guid*, UInt16, Guid*, HRESULT)
    enum_input_processor_info : Proc(ITfInputProcessorProfiles*, IEnumGUID*, HRESULT)
    get_default_language_profile : Proc(ITfInputProcessorProfiles*, UInt16, Guid*, Guid*, Guid*, HRESULT)
    set_default_language_profile : Proc(ITfInputProcessorProfiles*, UInt16, Guid*, Guid*, HRESULT)
    activate_language_profile : Proc(ITfInputProcessorProfiles*, Guid*, UInt16, Guid*, HRESULT)
    get_active_language_profile : Proc(ITfInputProcessorProfiles*, Guid*, UInt16*, Guid*, HRESULT)
    get_language_profile_description : Proc(ITfInputProcessorProfiles*, Guid*, UInt16, Guid*, UInt8**, HRESULT)
    get_current_language : Proc(ITfInputProcessorProfiles*, UInt16*, HRESULT)
    change_current_language : Proc(ITfInputProcessorProfiles*, UInt16, HRESULT)
    get_language_list : Proc(ITfInputProcessorProfiles*, UInt16**, UInt32*, HRESULT)
    enum_language_profiles : Proc(ITfInputProcessorProfiles*, UInt16, IEnumTfLanguageProfiles*, HRESULT)
    enable_language_profile : Proc(ITfInputProcessorProfiles*, Guid*, UInt16, Guid*, LibC::BOOL, HRESULT)
    is_enabled_language_profile : Proc(ITfInputProcessorProfiles*, Guid*, UInt16, Guid*, LibC::BOOL*, HRESULT)
    enable_language_profile_by_default : Proc(ITfInputProcessorProfiles*, Guid*, UInt16, Guid*, LibC::BOOL, HRESULT)
    substitute_keyboard_layout : Proc(ITfInputProcessorProfiles*, Guid*, UInt16, Guid*, HKL, HRESULT)
  end

  struct ITfInputProcessorProfiles
    lpVtbl : ITfInputProcessorProfilesVTbl*
  end

  struct ITfInputProcessorProfilesExVTbl
    query_interface : Proc(ITfInputProcessorProfilesEx*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfInputProcessorProfilesEx*, UInt32)
    release : Proc(ITfInputProcessorProfilesEx*, UInt32)
    register : Proc(ITfInputProcessorProfilesEx*, Guid*, HRESULT)
    unregister : Proc(ITfInputProcessorProfilesEx*, Guid*, HRESULT)
    add_language_profile : Proc(ITfInputProcessorProfilesEx*, Guid*, UInt16, Guid*, Char*, UInt32, Char*, UInt32, UInt32, HRESULT)
    remove_language_profile : Proc(ITfInputProcessorProfilesEx*, Guid*, UInt16, Guid*, HRESULT)
    enum_input_processor_info : Proc(ITfInputProcessorProfilesEx*, IEnumGUID*, HRESULT)
    get_default_language_profile : Proc(ITfInputProcessorProfilesEx*, UInt16, Guid*, Guid*, Guid*, HRESULT)
    set_default_language_profile : Proc(ITfInputProcessorProfilesEx*, UInt16, Guid*, Guid*, HRESULT)
    activate_language_profile : Proc(ITfInputProcessorProfilesEx*, Guid*, UInt16, Guid*, HRESULT)
    get_active_language_profile : Proc(ITfInputProcessorProfilesEx*, Guid*, UInt16*, Guid*, HRESULT)
    get_language_profile_description : Proc(ITfInputProcessorProfilesEx*, Guid*, UInt16, Guid*, UInt8**, HRESULT)
    get_current_language : Proc(ITfInputProcessorProfilesEx*, UInt16*, HRESULT)
    change_current_language : Proc(ITfInputProcessorProfilesEx*, UInt16, HRESULT)
    get_language_list : Proc(ITfInputProcessorProfilesEx*, UInt16**, UInt32*, HRESULT)
    enum_language_profiles : Proc(ITfInputProcessorProfilesEx*, UInt16, IEnumTfLanguageProfiles*, HRESULT)
    enable_language_profile : Proc(ITfInputProcessorProfilesEx*, Guid*, UInt16, Guid*, LibC::BOOL, HRESULT)
    is_enabled_language_profile : Proc(ITfInputProcessorProfilesEx*, Guid*, UInt16, Guid*, LibC::BOOL*, HRESULT)
    enable_language_profile_by_default : Proc(ITfInputProcessorProfilesEx*, Guid*, UInt16, Guid*, LibC::BOOL, HRESULT)
    substitute_keyboard_layout : Proc(ITfInputProcessorProfilesEx*, Guid*, UInt16, Guid*, HKL, HRESULT)
    set_language_profile_display_name : Proc(ITfInputProcessorProfilesEx*, Guid*, UInt16, Guid*, Char*, UInt32, UInt32, HRESULT)
  end

  struct ITfInputProcessorProfilesEx
    lpVtbl : ITfInputProcessorProfilesExVTbl*
  end

  struct ITfInputProcessorProfileSubstituteLayoutVTbl
    query_interface : Proc(ITfInputProcessorProfileSubstituteLayout*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfInputProcessorProfileSubstituteLayout*, UInt32)
    release : Proc(ITfInputProcessorProfileSubstituteLayout*, UInt32)
    get_substitute_keyboard_layout : Proc(ITfInputProcessorProfileSubstituteLayout*, Guid*, UInt16, Guid*, HKL*, HRESULT)
  end

  struct ITfInputProcessorProfileSubstituteLayout
    lpVtbl : ITfInputProcessorProfileSubstituteLayoutVTbl*
  end

  struct ITfActiveLanguageProfileNotifySinkVTbl
    query_interface : Proc(ITfActiveLanguageProfileNotifySink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfActiveLanguageProfileNotifySink*, UInt32)
    release : Proc(ITfActiveLanguageProfileNotifySink*, UInt32)
    on_activated : Proc(ITfActiveLanguageProfileNotifySink*, Guid*, Guid*, LibC::BOOL, HRESULT)
  end

  struct ITfActiveLanguageProfileNotifySink
    lpVtbl : ITfActiveLanguageProfileNotifySinkVTbl*
  end

  struct IEnumTfLanguageProfilesVTbl
    query_interface : Proc(IEnumTfLanguageProfiles*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumTfLanguageProfiles*, UInt32)
    release : Proc(IEnumTfLanguageProfiles*, UInt32)
    clone : Proc(IEnumTfLanguageProfiles*, IEnumTfLanguageProfiles*, HRESULT)
    next : Proc(IEnumTfLanguageProfiles*, UInt32, TF_LANGUAGEPROFILE*, UInt32*, HRESULT)
    reset : Proc(IEnumTfLanguageProfiles*, HRESULT)
    skip : Proc(IEnumTfLanguageProfiles*, UInt32, HRESULT)
  end

  struct IEnumTfLanguageProfiles
    lpVtbl : IEnumTfLanguageProfilesVTbl*
  end

  struct ITfLanguageProfileNotifySinkVTbl
    query_interface : Proc(ITfLanguageProfileNotifySink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfLanguageProfileNotifySink*, UInt32)
    release : Proc(ITfLanguageProfileNotifySink*, UInt32)
    on_language_change : Proc(ITfLanguageProfileNotifySink*, UInt16, LibC::BOOL*, HRESULT)
    on_language_changed : Proc(ITfLanguageProfileNotifySink*, HRESULT)
  end

  struct ITfLanguageProfileNotifySink
    lpVtbl : ITfLanguageProfileNotifySinkVTbl*
  end

  struct ITfInputProcessorProfileMgrVTbl
    query_interface : Proc(ITfInputProcessorProfileMgr*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfInputProcessorProfileMgr*, UInt32)
    release : Proc(ITfInputProcessorProfileMgr*, UInt32)
    activate_profile : Proc(ITfInputProcessorProfileMgr*, UInt32, UInt16, Guid*, Guid*, HKL, UInt32, HRESULT)
    deactivate_profile : Proc(ITfInputProcessorProfileMgr*, UInt32, UInt16, Guid*, Guid*, HKL, UInt32, HRESULT)
    get_profile : Proc(ITfInputProcessorProfileMgr*, UInt32, UInt16, Guid*, Guid*, HKL, TF_INPUTPROCESSORPROFILE*, HRESULT)
    enum_profiles : Proc(ITfInputProcessorProfileMgr*, UInt16, IEnumTfInputProcessorProfiles*, HRESULT)
    release_input_processor : Proc(ITfInputProcessorProfileMgr*, Guid*, UInt32, HRESULT)
    register_profile : Proc(ITfInputProcessorProfileMgr*, Guid*, UInt16, Guid*, Char*, UInt32, Char*, UInt32, UInt32, HKL, UInt32, LibC::BOOL, UInt32, HRESULT)
    unregister_profile : Proc(ITfInputProcessorProfileMgr*, Guid*, UInt16, Guid*, UInt32, HRESULT)
    get_active_profile : Proc(ITfInputProcessorProfileMgr*, Guid*, TF_INPUTPROCESSORPROFILE*, HRESULT)
  end

  struct ITfInputProcessorProfileMgr
    lpVtbl : ITfInputProcessorProfileMgrVTbl*
  end

  struct IEnumTfInputProcessorProfilesVTbl
    query_interface : Proc(IEnumTfInputProcessorProfiles*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumTfInputProcessorProfiles*, UInt32)
    release : Proc(IEnumTfInputProcessorProfiles*, UInt32)
    clone : Proc(IEnumTfInputProcessorProfiles*, IEnumTfInputProcessorProfiles*, HRESULT)
    next : Proc(IEnumTfInputProcessorProfiles*, UInt32, TF_INPUTPROCESSORPROFILE*, UInt32*, HRESULT)
    reset : Proc(IEnumTfInputProcessorProfiles*, HRESULT)
    skip : Proc(IEnumTfInputProcessorProfiles*, UInt32, HRESULT)
  end

  struct IEnumTfInputProcessorProfiles
    lpVtbl : IEnumTfInputProcessorProfilesVTbl*
  end

  struct ITfInputProcessorProfileActivationSinkVTbl
    query_interface : Proc(ITfInputProcessorProfileActivationSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfInputProcessorProfileActivationSink*, UInt32)
    release : Proc(ITfInputProcessorProfileActivationSink*, UInt32)
    on_activated : Proc(ITfInputProcessorProfileActivationSink*, UInt32, UInt16, Guid*, Guid*, Guid*, HKL, UInt32, HRESULT)
  end

  struct ITfInputProcessorProfileActivationSink
    lpVtbl : ITfInputProcessorProfileActivationSinkVTbl*
  end

  struct ITfKeystrokeMgrVTbl
    query_interface : Proc(ITfKeystrokeMgr*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfKeystrokeMgr*, UInt32)
    release : Proc(ITfKeystrokeMgr*, UInt32)
    advise_key_event_sink : Proc(ITfKeystrokeMgr*, UInt32, ITfKeyEventSink, LibC::BOOL, HRESULT)
    unadvise_key_event_sink : Proc(ITfKeystrokeMgr*, UInt32, HRESULT)
    get_foreground : Proc(ITfKeystrokeMgr*, Guid*, HRESULT)
    test_key_down : Proc(ITfKeystrokeMgr*, LibC::UINT_PTR, LPARAM, LibC::BOOL*, HRESULT)
    test_key_up : Proc(ITfKeystrokeMgr*, LibC::UINT_PTR, LPARAM, LibC::BOOL*, HRESULT)
    key_down : Proc(ITfKeystrokeMgr*, LibC::UINT_PTR, LPARAM, LibC::BOOL*, HRESULT)
    key_up : Proc(ITfKeystrokeMgr*, LibC::UINT_PTR, LPARAM, LibC::BOOL*, HRESULT)
    get_preserved_key : Proc(ITfKeystrokeMgr*, ITfContext, TF_PRESERVEDKEY*, Guid*, HRESULT)
    is_preserved_key : Proc(ITfKeystrokeMgr*, Guid*, TF_PRESERVEDKEY*, LibC::BOOL*, HRESULT)
    preserve_key : Proc(ITfKeystrokeMgr*, UInt32, Guid*, TF_PRESERVEDKEY*, Char*, UInt32, HRESULT)
    unpreserve_key : Proc(ITfKeystrokeMgr*, Guid*, TF_PRESERVEDKEY*, HRESULT)
    set_preserved_key_description : Proc(ITfKeystrokeMgr*, Guid*, Char*, UInt32, HRESULT)
    get_preserved_key_description : Proc(ITfKeystrokeMgr*, Guid*, UInt8**, HRESULT)
    simulate_preserved_key : Proc(ITfKeystrokeMgr*, ITfContext, Guid*, LibC::BOOL*, HRESULT)
  end

  struct ITfKeystrokeMgr
    lpVtbl : ITfKeystrokeMgrVTbl*
  end

  struct ITfKeyEventSinkVTbl
    query_interface : Proc(ITfKeyEventSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfKeyEventSink*, UInt32)
    release : Proc(ITfKeyEventSink*, UInt32)
    on_set_focus : Proc(ITfKeyEventSink*, LibC::BOOL, HRESULT)
    on_test_key_down : Proc(ITfKeyEventSink*, ITfContext, LibC::UINT_PTR, LPARAM, LibC::BOOL*, HRESULT)
    on_test_key_up : Proc(ITfKeyEventSink*, ITfContext, LibC::UINT_PTR, LPARAM, LibC::BOOL*, HRESULT)
    on_key_down : Proc(ITfKeyEventSink*, ITfContext, LibC::UINT_PTR, LPARAM, LibC::BOOL*, HRESULT)
    on_key_up : Proc(ITfKeyEventSink*, ITfContext, LibC::UINT_PTR, LPARAM, LibC::BOOL*, HRESULT)
    on_preserved_key : Proc(ITfKeyEventSink*, ITfContext, Guid*, LibC::BOOL*, HRESULT)
  end

  struct ITfKeyEventSink
    lpVtbl : ITfKeyEventSinkVTbl*
  end

  struct ITfKeyTraceEventSinkVTbl
    query_interface : Proc(ITfKeyTraceEventSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfKeyTraceEventSink*, UInt32)
    release : Proc(ITfKeyTraceEventSink*, UInt32)
    on_key_trace_down : Proc(ITfKeyTraceEventSink*, LibC::UINT_PTR, LPARAM, HRESULT)
    on_key_trace_up : Proc(ITfKeyTraceEventSink*, LibC::UINT_PTR, LPARAM, HRESULT)
  end

  struct ITfKeyTraceEventSink
    lpVtbl : ITfKeyTraceEventSinkVTbl*
  end

  struct ITfPreservedKeyNotifySinkVTbl
    query_interface : Proc(ITfPreservedKeyNotifySink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfPreservedKeyNotifySink*, UInt32)
    release : Proc(ITfPreservedKeyNotifySink*, UInt32)
    on_updated : Proc(ITfPreservedKeyNotifySink*, TF_PRESERVEDKEY*, HRESULT)
  end

  struct ITfPreservedKeyNotifySink
    lpVtbl : ITfPreservedKeyNotifySinkVTbl*
  end

  struct ITfMessagePumpVTbl
    query_interface : Proc(ITfMessagePump*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfMessagePump*, UInt32)
    release : Proc(ITfMessagePump*, UInt32)
    peek_message_a : Proc(ITfMessagePump*, MSG*, LibC::HANDLE, UInt32, UInt32, UInt32, LibC::BOOL*, HRESULT)
    get_message_a : Proc(ITfMessagePump*, MSG*, LibC::HANDLE, UInt32, UInt32, LibC::BOOL*, HRESULT)
    peek_message_w : Proc(ITfMessagePump*, MSG*, LibC::HANDLE, UInt32, UInt32, UInt32, LibC::BOOL*, HRESULT)
    get_message_w : Proc(ITfMessagePump*, MSG*, LibC::HANDLE, UInt32, UInt32, LibC::BOOL*, HRESULT)
  end

  struct ITfMessagePump
    lpVtbl : ITfMessagePumpVTbl*
  end

  struct ITfThreadFocusSinkVTbl
    query_interface : Proc(ITfThreadFocusSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfThreadFocusSink*, UInt32)
    release : Proc(ITfThreadFocusSink*, UInt32)
    on_set_thread_focus : Proc(ITfThreadFocusSink*, HRESULT)
    on_kill_thread_focus : Proc(ITfThreadFocusSink*, HRESULT)
  end

  struct ITfThreadFocusSink
    lpVtbl : ITfThreadFocusSinkVTbl*
  end

  struct ITfTextInputProcessorVTbl
    query_interface : Proc(ITfTextInputProcessor*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfTextInputProcessor*, UInt32)
    release : Proc(ITfTextInputProcessor*, UInt32)
    activate : Proc(ITfTextInputProcessor*, ITfThreadMgr, UInt32, HRESULT)
    deactivate : Proc(ITfTextInputProcessor*, HRESULT)
  end

  struct ITfTextInputProcessor
    lpVtbl : ITfTextInputProcessorVTbl*
  end

  struct ITfTextInputProcessorExVTbl
    query_interface : Proc(ITfTextInputProcessorEx*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfTextInputProcessorEx*, UInt32)
    release : Proc(ITfTextInputProcessorEx*, UInt32)
    activate : Proc(ITfTextInputProcessorEx*, ITfThreadMgr, UInt32, HRESULT)
    deactivate : Proc(ITfTextInputProcessorEx*, HRESULT)
    activate_ex : Proc(ITfTextInputProcessorEx*, ITfThreadMgr, UInt32, UInt32, HRESULT)
  end

  struct ITfTextInputProcessorEx
    lpVtbl : ITfTextInputProcessorExVTbl*
  end

  struct ITfClientIdVTbl
    query_interface : Proc(ITfClientId*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfClientId*, UInt32)
    release : Proc(ITfClientId*, UInt32)
    get_client_id : Proc(ITfClientId*, Guid*, UInt32*, HRESULT)
  end

  struct ITfClientId
    lpVtbl : ITfClientIdVTbl*
  end

  struct ITfDisplayAttributeInfoVTbl
    query_interface : Proc(ITfDisplayAttributeInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfDisplayAttributeInfo*, UInt32)
    release : Proc(ITfDisplayAttributeInfo*, UInt32)
    get_guid : Proc(ITfDisplayAttributeInfo*, Guid*, HRESULT)
    get_description : Proc(ITfDisplayAttributeInfo*, UInt8**, HRESULT)
    get_attribute_info : Proc(ITfDisplayAttributeInfo*, TF_DISPLAYATTRIBUTE*, HRESULT)
    set_attribute_info : Proc(ITfDisplayAttributeInfo*, TF_DISPLAYATTRIBUTE*, HRESULT)
    reset : Proc(ITfDisplayAttributeInfo*, HRESULT)
  end

  struct ITfDisplayAttributeInfo
    lpVtbl : ITfDisplayAttributeInfoVTbl*
  end

  struct IEnumTfDisplayAttributeInfoVTbl
    query_interface : Proc(IEnumTfDisplayAttributeInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumTfDisplayAttributeInfo*, UInt32)
    release : Proc(IEnumTfDisplayAttributeInfo*, UInt32)
    clone : Proc(IEnumTfDisplayAttributeInfo*, IEnumTfDisplayAttributeInfo*, HRESULT)
    next : Proc(IEnumTfDisplayAttributeInfo*, UInt32, ITfDisplayAttributeInfo*, UInt32*, HRESULT)
    reset : Proc(IEnumTfDisplayAttributeInfo*, HRESULT)
    skip : Proc(IEnumTfDisplayAttributeInfo*, UInt32, HRESULT)
  end

  struct IEnumTfDisplayAttributeInfo
    lpVtbl : IEnumTfDisplayAttributeInfoVTbl*
  end

  struct ITfDisplayAttributeProviderVTbl
    query_interface : Proc(ITfDisplayAttributeProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfDisplayAttributeProvider*, UInt32)
    release : Proc(ITfDisplayAttributeProvider*, UInt32)
    enum_display_attribute_info : Proc(ITfDisplayAttributeProvider*, IEnumTfDisplayAttributeInfo*, HRESULT)
    get_display_attribute_info : Proc(ITfDisplayAttributeProvider*, Guid*, ITfDisplayAttributeInfo*, HRESULT)
  end

  struct ITfDisplayAttributeProvider
    lpVtbl : ITfDisplayAttributeProviderVTbl*
  end

  struct ITfDisplayAttributeMgrVTbl
    query_interface : Proc(ITfDisplayAttributeMgr*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfDisplayAttributeMgr*, UInt32)
    release : Proc(ITfDisplayAttributeMgr*, UInt32)
    on_update_info : Proc(ITfDisplayAttributeMgr*, HRESULT)
    enum_display_attribute_info : Proc(ITfDisplayAttributeMgr*, IEnumTfDisplayAttributeInfo*, HRESULT)
    get_display_attribute_info : Proc(ITfDisplayAttributeMgr*, Guid*, ITfDisplayAttributeInfo*, Guid*, HRESULT)
  end

  struct ITfDisplayAttributeMgr
    lpVtbl : ITfDisplayAttributeMgrVTbl*
  end

  struct ITfDisplayAttributeNotifySinkVTbl
    query_interface : Proc(ITfDisplayAttributeNotifySink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfDisplayAttributeNotifySink*, UInt32)
    release : Proc(ITfDisplayAttributeNotifySink*, UInt32)
    on_update_info : Proc(ITfDisplayAttributeNotifySink*, HRESULT)
  end

  struct ITfDisplayAttributeNotifySink
    lpVtbl : ITfDisplayAttributeNotifySinkVTbl*
  end

  struct ITfCategoryMgrVTbl
    query_interface : Proc(ITfCategoryMgr*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfCategoryMgr*, UInt32)
    release : Proc(ITfCategoryMgr*, UInt32)
    register_category : Proc(ITfCategoryMgr*, Guid*, Guid*, Guid*, HRESULT)
    unregister_category : Proc(ITfCategoryMgr*, Guid*, Guid*, Guid*, HRESULT)
    enum_categories_in_item : Proc(ITfCategoryMgr*, Guid*, IEnumGUID*, HRESULT)
    enum_items_in_category : Proc(ITfCategoryMgr*, Guid*, IEnumGUID*, HRESULT)
    find_closest_category : Proc(ITfCategoryMgr*, Guid*, Guid*, Guid**, UInt32, HRESULT)
    register_guid_description : Proc(ITfCategoryMgr*, Guid*, Guid*, Char*, UInt32, HRESULT)
    unregister_guid_description : Proc(ITfCategoryMgr*, Guid*, Guid*, HRESULT)
    get_guid_description : Proc(ITfCategoryMgr*, Guid*, UInt8**, HRESULT)
    register_guiddword : Proc(ITfCategoryMgr*, Guid*, Guid*, UInt32, HRESULT)
    unregister_guiddword : Proc(ITfCategoryMgr*, Guid*, Guid*, HRESULT)
    get_guiddword : Proc(ITfCategoryMgr*, Guid*, UInt32*, HRESULT)
    register_guid : Proc(ITfCategoryMgr*, Guid*, UInt32*, HRESULT)
    get_guid : Proc(ITfCategoryMgr*, UInt32, Guid*, HRESULT)
    is_equal_tf_guid_atom : Proc(ITfCategoryMgr*, UInt32, Guid*, LibC::BOOL*, HRESULT)
  end

  struct ITfCategoryMgr
    lpVtbl : ITfCategoryMgrVTbl*
  end

  struct ITfSourceVTbl
    query_interface : Proc(ITfSource*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfSource*, UInt32)
    release : Proc(ITfSource*, UInt32)
    advise_sink : Proc(ITfSource*, Guid*, IUnknown, UInt32*, HRESULT)
    unadvise_sink : Proc(ITfSource*, UInt32, HRESULT)
  end

  struct ITfSource
    lpVtbl : ITfSourceVTbl*
  end

  struct ITfSourceSingleVTbl
    query_interface : Proc(ITfSourceSingle*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfSourceSingle*, UInt32)
    release : Proc(ITfSourceSingle*, UInt32)
    advise_single_sink : Proc(ITfSourceSingle*, UInt32, Guid*, IUnknown, HRESULT)
    unadvise_single_sink : Proc(ITfSourceSingle*, UInt32, Guid*, HRESULT)
  end

  struct ITfSourceSingle
    lpVtbl : ITfSourceSingleVTbl*
  end

  struct ITfUIElementMgrVTbl
    query_interface : Proc(ITfUIElementMgr*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfUIElementMgr*, UInt32)
    release : Proc(ITfUIElementMgr*, UInt32)
    begin_ui_element : Proc(ITfUIElementMgr*, ITfUIElement, LibC::BOOL*, UInt32*, HRESULT)
    update_ui_element : Proc(ITfUIElementMgr*, UInt32, HRESULT)
    end_ui_element : Proc(ITfUIElementMgr*, UInt32, HRESULT)
    get_ui_element : Proc(ITfUIElementMgr*, UInt32, ITfUIElement*, HRESULT)
    enum_ui_elements : Proc(ITfUIElementMgr*, IEnumTfUIElements*, HRESULT)
  end

  struct ITfUIElementMgr
    lpVtbl : ITfUIElementMgrVTbl*
  end

  struct IEnumTfUIElementsVTbl
    query_interface : Proc(IEnumTfUIElements*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumTfUIElements*, UInt32)
    release : Proc(IEnumTfUIElements*, UInt32)
    clone : Proc(IEnumTfUIElements*, IEnumTfUIElements*, HRESULT)
    next : Proc(IEnumTfUIElements*, UInt32, ITfUIElement*, UInt32*, HRESULT)
    reset : Proc(IEnumTfUIElements*, HRESULT)
    skip : Proc(IEnumTfUIElements*, UInt32, HRESULT)
  end

  struct IEnumTfUIElements
    lpVtbl : IEnumTfUIElementsVTbl*
  end

  struct ITfUIElementSinkVTbl
    query_interface : Proc(ITfUIElementSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfUIElementSink*, UInt32)
    release : Proc(ITfUIElementSink*, UInt32)
    begin_ui_element : Proc(ITfUIElementSink*, UInt32, LibC::BOOL*, HRESULT)
    update_ui_element : Proc(ITfUIElementSink*, UInt32, HRESULT)
    end_ui_element : Proc(ITfUIElementSink*, UInt32, HRESULT)
  end

  struct ITfUIElementSink
    lpVtbl : ITfUIElementSinkVTbl*
  end

  struct ITfUIElementVTbl
    query_interface : Proc(ITfUIElement*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfUIElement*, UInt32)
    release : Proc(ITfUIElement*, UInt32)
    get_description : Proc(ITfUIElement*, UInt8**, HRESULT)
    get_guid : Proc(ITfUIElement*, Guid*, HRESULT)
    show : Proc(ITfUIElement*, LibC::BOOL, HRESULT)
    is_shown : Proc(ITfUIElement*, LibC::BOOL*, HRESULT)
  end

  struct ITfUIElement
    lpVtbl : ITfUIElementVTbl*
  end

  struct ITfCandidateListUIElementVTbl
    query_interface : Proc(ITfCandidateListUIElement*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfCandidateListUIElement*, UInt32)
    release : Proc(ITfCandidateListUIElement*, UInt32)
    get_description : Proc(ITfCandidateListUIElement*, UInt8**, HRESULT)
    get_guid : Proc(ITfCandidateListUIElement*, Guid*, HRESULT)
    show : Proc(ITfCandidateListUIElement*, LibC::BOOL, HRESULT)
    is_shown : Proc(ITfCandidateListUIElement*, LibC::BOOL*, HRESULT)
    get_updated_flags : Proc(ITfCandidateListUIElement*, UInt32*, HRESULT)
    get_document_mgr : Proc(ITfCandidateListUIElement*, ITfDocumentMgr*, HRESULT)
    get_count : Proc(ITfCandidateListUIElement*, UInt32*, HRESULT)
    get_selection : Proc(ITfCandidateListUIElement*, UInt32*, HRESULT)
    get_string : Proc(ITfCandidateListUIElement*, UInt32, UInt8**, HRESULT)
    get_page_index : Proc(ITfCandidateListUIElement*, UInt32*, UInt32, UInt32*, HRESULT)
    set_page_index : Proc(ITfCandidateListUIElement*, UInt32*, UInt32, HRESULT)
    get_current_page : Proc(ITfCandidateListUIElement*, UInt32*, HRESULT)
  end

  struct ITfCandidateListUIElement
    lpVtbl : ITfCandidateListUIElementVTbl*
  end

  struct ITfCandidateListUIElementBehaviorVTbl
    query_interface : Proc(ITfCandidateListUIElementBehavior*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfCandidateListUIElementBehavior*, UInt32)
    release : Proc(ITfCandidateListUIElementBehavior*, UInt32)
    get_description : Proc(ITfCandidateListUIElementBehavior*, UInt8**, HRESULT)
    get_guid : Proc(ITfCandidateListUIElementBehavior*, Guid*, HRESULT)
    show : Proc(ITfCandidateListUIElementBehavior*, LibC::BOOL, HRESULT)
    is_shown : Proc(ITfCandidateListUIElementBehavior*, LibC::BOOL*, HRESULT)
    get_updated_flags : Proc(ITfCandidateListUIElementBehavior*, UInt32*, HRESULT)
    get_document_mgr : Proc(ITfCandidateListUIElementBehavior*, ITfDocumentMgr*, HRESULT)
    get_count : Proc(ITfCandidateListUIElementBehavior*, UInt32*, HRESULT)
    get_selection : Proc(ITfCandidateListUIElementBehavior*, UInt32*, HRESULT)
    get_string : Proc(ITfCandidateListUIElementBehavior*, UInt32, UInt8**, HRESULT)
    get_page_index : Proc(ITfCandidateListUIElementBehavior*, UInt32*, UInt32, UInt32*, HRESULT)
    set_page_index : Proc(ITfCandidateListUIElementBehavior*, UInt32*, UInt32, HRESULT)
    get_current_page : Proc(ITfCandidateListUIElementBehavior*, UInt32*, HRESULT)
    set_selection : Proc(ITfCandidateListUIElementBehavior*, UInt32, HRESULT)
    finalize : Proc(ITfCandidateListUIElementBehavior*, HRESULT)
    abort : Proc(ITfCandidateListUIElementBehavior*, HRESULT)
  end

  struct ITfCandidateListUIElementBehavior
    lpVtbl : ITfCandidateListUIElementBehaviorVTbl*
  end

  struct ITfReadingInformationUIElementVTbl
    query_interface : Proc(ITfReadingInformationUIElement*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfReadingInformationUIElement*, UInt32)
    release : Proc(ITfReadingInformationUIElement*, UInt32)
    get_description : Proc(ITfReadingInformationUIElement*, UInt8**, HRESULT)
    get_guid : Proc(ITfReadingInformationUIElement*, Guid*, HRESULT)
    show : Proc(ITfReadingInformationUIElement*, LibC::BOOL, HRESULT)
    is_shown : Proc(ITfReadingInformationUIElement*, LibC::BOOL*, HRESULT)
    get_updated_flags : Proc(ITfReadingInformationUIElement*, UInt32*, HRESULT)
    get_context : Proc(ITfReadingInformationUIElement*, ITfContext*, HRESULT)
    get_string : Proc(ITfReadingInformationUIElement*, UInt8**, HRESULT)
    get_max_reading_string_length : Proc(ITfReadingInformationUIElement*, UInt32*, HRESULT)
    get_error_index : Proc(ITfReadingInformationUIElement*, UInt32*, HRESULT)
    is_vertical_order_preferred : Proc(ITfReadingInformationUIElement*, LibC::BOOL*, HRESULT)
  end

  struct ITfReadingInformationUIElement
    lpVtbl : ITfReadingInformationUIElementVTbl*
  end

  struct ITfTransitoryExtensionUIElementVTbl
    query_interface : Proc(ITfTransitoryExtensionUIElement*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfTransitoryExtensionUIElement*, UInt32)
    release : Proc(ITfTransitoryExtensionUIElement*, UInt32)
    get_description : Proc(ITfTransitoryExtensionUIElement*, UInt8**, HRESULT)
    get_guid : Proc(ITfTransitoryExtensionUIElement*, Guid*, HRESULT)
    show : Proc(ITfTransitoryExtensionUIElement*, LibC::BOOL, HRESULT)
    is_shown : Proc(ITfTransitoryExtensionUIElement*, LibC::BOOL*, HRESULT)
    get_document_mgr : Proc(ITfTransitoryExtensionUIElement*, ITfDocumentMgr*, HRESULT)
  end

  struct ITfTransitoryExtensionUIElement
    lpVtbl : ITfTransitoryExtensionUIElementVTbl*
  end

  struct ITfTransitoryExtensionSinkVTbl
    query_interface : Proc(ITfTransitoryExtensionSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfTransitoryExtensionSink*, UInt32)
    release : Proc(ITfTransitoryExtensionSink*, UInt32)
    on_transitory_extension_updated : Proc(ITfTransitoryExtensionSink*, ITfContext, UInt32, ITfRange, ITfRange, LibC::BOOL*, HRESULT)
  end

  struct ITfTransitoryExtensionSink
    lpVtbl : ITfTransitoryExtensionSinkVTbl*
  end

  struct ITfToolTipUIElementVTbl
    query_interface : Proc(ITfToolTipUIElement*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfToolTipUIElement*, UInt32)
    release : Proc(ITfToolTipUIElement*, UInt32)
    get_description : Proc(ITfToolTipUIElement*, UInt8**, HRESULT)
    get_guid : Proc(ITfToolTipUIElement*, Guid*, HRESULT)
    show : Proc(ITfToolTipUIElement*, LibC::BOOL, HRESULT)
    is_shown : Proc(ITfToolTipUIElement*, LibC::BOOL*, HRESULT)
    get_string : Proc(ITfToolTipUIElement*, UInt8**, HRESULT)
  end

  struct ITfToolTipUIElement
    lpVtbl : ITfToolTipUIElementVTbl*
  end

  struct ITfReverseConversionListVTbl
    query_interface : Proc(ITfReverseConversionList*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfReverseConversionList*, UInt32)
    release : Proc(ITfReverseConversionList*, UInt32)
    get_length : Proc(ITfReverseConversionList*, UInt32*, HRESULT)
    get_string : Proc(ITfReverseConversionList*, UInt32, UInt8**, HRESULT)
  end

  struct ITfReverseConversionList
    lpVtbl : ITfReverseConversionListVTbl*
  end

  struct ITfReverseConversionVTbl
    query_interface : Proc(ITfReverseConversion*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfReverseConversion*, UInt32)
    release : Proc(ITfReverseConversion*, UInt32)
    do_reverse_conversion : Proc(ITfReverseConversion*, LibC::LPWSTR, ITfReverseConversionList*, HRESULT)
  end

  struct ITfReverseConversion
    lpVtbl : ITfReverseConversionVTbl*
  end

  struct ITfReverseConversionMgrVTbl
    query_interface : Proc(ITfReverseConversionMgr*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfReverseConversionMgr*, UInt32)
    release : Proc(ITfReverseConversionMgr*, UInt32)
    get_reverse_conversion : Proc(ITfReverseConversionMgr*, UInt16, Guid*, UInt32, ITfReverseConversion*, HRESULT)
  end

  struct ITfReverseConversionMgr
    lpVtbl : ITfReverseConversionMgrVTbl*
  end

  struct ITfCandidateStringVTbl
    query_interface : Proc(ITfCandidateString*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfCandidateString*, UInt32)
    release : Proc(ITfCandidateString*, UInt32)
    get_string : Proc(ITfCandidateString*, UInt8**, HRESULT)
    get_index : Proc(ITfCandidateString*, UInt32*, HRESULT)
  end

  struct ITfCandidateString
    lpVtbl : ITfCandidateStringVTbl*
  end

  struct IEnumTfCandidatesVTbl
    query_interface : Proc(IEnumTfCandidates*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumTfCandidates*, UInt32)
    release : Proc(IEnumTfCandidates*, UInt32)
    clone : Proc(IEnumTfCandidates*, IEnumTfCandidates*, HRESULT)
    next : Proc(IEnumTfCandidates*, UInt32, ITfCandidateString*, UInt32*, HRESULT)
    reset : Proc(IEnumTfCandidates*, HRESULT)
    skip : Proc(IEnumTfCandidates*, UInt32, HRESULT)
  end

  struct IEnumTfCandidates
    lpVtbl : IEnumTfCandidatesVTbl*
  end

  struct ITfCandidateListVTbl
    query_interface : Proc(ITfCandidateList*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfCandidateList*, UInt32)
    release : Proc(ITfCandidateList*, UInt32)
    enum_candidates : Proc(ITfCandidateList*, IEnumTfCandidates*, HRESULT)
    get_candidate : Proc(ITfCandidateList*, UInt32, ITfCandidateString*, HRESULT)
    get_candidate_num : Proc(ITfCandidateList*, UInt32*, HRESULT)
    set_result : Proc(ITfCandidateList*, UInt32, TfCandidateResult, HRESULT)
  end

  struct ITfCandidateList
    lpVtbl : ITfCandidateListVTbl*
  end

  struct ITfFnReconversionVTbl
    query_interface : Proc(ITfFnReconversion*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfFnReconversion*, UInt32)
    release : Proc(ITfFnReconversion*, UInt32)
    get_display_name : Proc(ITfFnReconversion*, UInt8**, HRESULT)
    query_range : Proc(ITfFnReconversion*, ITfRange, ITfRange*, LibC::BOOL*, HRESULT)
    get_reconversion : Proc(ITfFnReconversion*, ITfRange, ITfCandidateList*, HRESULT)
    reconvert : Proc(ITfFnReconversion*, ITfRange, HRESULT)
  end

  struct ITfFnReconversion
    lpVtbl : ITfFnReconversionVTbl*
  end

  struct ITfFnPlayBackVTbl
    query_interface : Proc(ITfFnPlayBack*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfFnPlayBack*, UInt32)
    release : Proc(ITfFnPlayBack*, UInt32)
    get_display_name : Proc(ITfFnPlayBack*, UInt8**, HRESULT)
    query_range : Proc(ITfFnPlayBack*, ITfRange, ITfRange*, LibC::BOOL*, HRESULT)
    play : Proc(ITfFnPlayBack*, ITfRange, HRESULT)
  end

  struct ITfFnPlayBack
    lpVtbl : ITfFnPlayBackVTbl*
  end

  struct ITfFnLangProfileUtilVTbl
    query_interface : Proc(ITfFnLangProfileUtil*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfFnLangProfileUtil*, UInt32)
    release : Proc(ITfFnLangProfileUtil*, UInt32)
    get_display_name : Proc(ITfFnLangProfileUtil*, UInt8**, HRESULT)
    register_active_profiles : Proc(ITfFnLangProfileUtil*, HRESULT)
    is_profile_available_for_lang : Proc(ITfFnLangProfileUtil*, UInt16, LibC::BOOL*, HRESULT)
  end

  struct ITfFnLangProfileUtil
    lpVtbl : ITfFnLangProfileUtilVTbl*
  end

  struct ITfFnConfigureVTbl
    query_interface : Proc(ITfFnConfigure*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfFnConfigure*, UInt32)
    release : Proc(ITfFnConfigure*, UInt32)
    get_display_name : Proc(ITfFnConfigure*, UInt8**, HRESULT)
    show : Proc(ITfFnConfigure*, LibC::HANDLE, UInt16, Guid*, HRESULT)
  end

  struct ITfFnConfigure
    lpVtbl : ITfFnConfigureVTbl*
  end

  struct ITfFnConfigureRegisterWordVTbl
    query_interface : Proc(ITfFnConfigureRegisterWord*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfFnConfigureRegisterWord*, UInt32)
    release : Proc(ITfFnConfigureRegisterWord*, UInt32)
    get_display_name : Proc(ITfFnConfigureRegisterWord*, UInt8**, HRESULT)
    show : Proc(ITfFnConfigureRegisterWord*, LibC::HANDLE, UInt16, Guid*, UInt8*, HRESULT)
  end

  struct ITfFnConfigureRegisterWord
    lpVtbl : ITfFnConfigureRegisterWordVTbl*
  end

  struct ITfFnConfigureRegisterEudcVTbl
    query_interface : Proc(ITfFnConfigureRegisterEudc*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfFnConfigureRegisterEudc*, UInt32)
    release : Proc(ITfFnConfigureRegisterEudc*, UInt32)
    get_display_name : Proc(ITfFnConfigureRegisterEudc*, UInt8**, HRESULT)
    show : Proc(ITfFnConfigureRegisterEudc*, LibC::HANDLE, UInt16, Guid*, UInt8*, HRESULT)
  end

  struct ITfFnConfigureRegisterEudc
    lpVtbl : ITfFnConfigureRegisterEudcVTbl*
  end

  struct ITfFnShowHelpVTbl
    query_interface : Proc(ITfFnShowHelp*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfFnShowHelp*, UInt32)
    release : Proc(ITfFnShowHelp*, UInt32)
    get_display_name : Proc(ITfFnShowHelp*, UInt8**, HRESULT)
    show : Proc(ITfFnShowHelp*, LibC::HANDLE, HRESULT)
  end

  struct ITfFnShowHelp
    lpVtbl : ITfFnShowHelpVTbl*
  end

  struct ITfFnBalloonVTbl
    query_interface : Proc(ITfFnBalloon*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfFnBalloon*, UInt32)
    release : Proc(ITfFnBalloon*, UInt32)
    update_balloon : Proc(ITfFnBalloon*, TfLBBalloonStyle, Char*, UInt32, HRESULT)
  end

  struct ITfFnBalloon
    lpVtbl : ITfFnBalloonVTbl*
  end

  struct ITfFnGetSAPIObjectVTbl
    query_interface : Proc(ITfFnGetSAPIObject*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfFnGetSAPIObject*, UInt32)
    release : Proc(ITfFnGetSAPIObject*, UInt32)
    get_display_name : Proc(ITfFnGetSAPIObject*, UInt8**, HRESULT)
    get : Proc(ITfFnGetSAPIObject*, TfSapiObject, IUnknown*, HRESULT)
  end

  struct ITfFnGetSAPIObject
    lpVtbl : ITfFnGetSAPIObjectVTbl*
  end

  struct ITfFnPropertyUIStatusVTbl
    query_interface : Proc(ITfFnPropertyUIStatus*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfFnPropertyUIStatus*, UInt32)
    release : Proc(ITfFnPropertyUIStatus*, UInt32)
    get_display_name : Proc(ITfFnPropertyUIStatus*, UInt8**, HRESULT)
    get_status : Proc(ITfFnPropertyUIStatus*, Guid*, UInt32*, HRESULT)
    set_status : Proc(ITfFnPropertyUIStatus*, Guid*, UInt32, HRESULT)
  end

  struct ITfFnPropertyUIStatus
    lpVtbl : ITfFnPropertyUIStatusVTbl*
  end

  struct IEnumSpeechCommandsVTbl
    query_interface : Proc(IEnumSpeechCommands*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumSpeechCommands*, UInt32)
    release : Proc(IEnumSpeechCommands*, UInt32)
    clone : Proc(IEnumSpeechCommands*, IEnumSpeechCommands*, HRESULT)
    next : Proc(IEnumSpeechCommands*, UInt32, UInt16**, UInt32*, HRESULT)
    reset : Proc(IEnumSpeechCommands*, HRESULT)
    skip : Proc(IEnumSpeechCommands*, UInt32, HRESULT)
  end

  struct IEnumSpeechCommands
    lpVtbl : IEnumSpeechCommandsVTbl*
  end

  struct ISpeechCommandProviderVTbl
    query_interface : Proc(ISpeechCommandProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpeechCommandProvider*, UInt32)
    release : Proc(ISpeechCommandProvider*, UInt32)
    enum_speech_commands : Proc(ISpeechCommandProvider*, UInt16, IEnumSpeechCommands*, HRESULT)
    process_command : Proc(ISpeechCommandProvider*, Char*, UInt32, UInt16, HRESULT)
  end

  struct ISpeechCommandProvider
    lpVtbl : ISpeechCommandProviderVTbl*
  end

  struct ITfFnCustomSpeechCommandVTbl
    query_interface : Proc(ITfFnCustomSpeechCommand*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfFnCustomSpeechCommand*, UInt32)
    release : Proc(ITfFnCustomSpeechCommand*, UInt32)
    get_display_name : Proc(ITfFnCustomSpeechCommand*, UInt8**, HRESULT)
    set_speech_command_provider : Proc(ITfFnCustomSpeechCommand*, IUnknown, HRESULT)
  end

  struct ITfFnCustomSpeechCommand
    lpVtbl : ITfFnCustomSpeechCommandVTbl*
  end

  struct ITfFnLMProcessorVTbl
    query_interface : Proc(ITfFnLMProcessor*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfFnLMProcessor*, UInt32)
    release : Proc(ITfFnLMProcessor*, UInt32)
    get_display_name : Proc(ITfFnLMProcessor*, UInt8**, HRESULT)
    query_range : Proc(ITfFnLMProcessor*, ITfRange, ITfRange*, LibC::BOOL*, HRESULT)
    query_lang_id : Proc(ITfFnLMProcessor*, UInt16, LibC::BOOL*, HRESULT)
    get_reconversion : Proc(ITfFnLMProcessor*, ITfRange, ITfCandidateList*, HRESULT)
    reconvert : Proc(ITfFnLMProcessor*, ITfRange, HRESULT)
    query_key : Proc(ITfFnLMProcessor*, LibC::BOOL, LibC::UINT_PTR, LPARAM, LibC::BOOL*, HRESULT)
    invoke_key : Proc(ITfFnLMProcessor*, LibC::BOOL, LibC::UINT_PTR, LPARAM, HRESULT)
    invoke_func : Proc(ITfFnLMProcessor*, ITfContext, Guid*, HRESULT)
  end

  struct ITfFnLMProcessor
    lpVtbl : ITfFnLMProcessorVTbl*
  end

  struct ITfFnLMInternalVTbl
    query_interface : Proc(ITfFnLMInternal*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfFnLMInternal*, UInt32)
    release : Proc(ITfFnLMInternal*, UInt32)
    get_display_name : Proc(ITfFnLMInternal*, UInt8**, HRESULT)
    query_range : Proc(ITfFnLMInternal*, ITfRange, ITfRange*, LibC::BOOL*, HRESULT)
    query_lang_id : Proc(ITfFnLMInternal*, UInt16, LibC::BOOL*, HRESULT)
    get_reconversion : Proc(ITfFnLMInternal*, ITfRange, ITfCandidateList*, HRESULT)
    reconvert : Proc(ITfFnLMInternal*, ITfRange, HRESULT)
    query_key : Proc(ITfFnLMInternal*, LibC::BOOL, LibC::UINT_PTR, LPARAM, LibC::BOOL*, HRESULT)
    invoke_key : Proc(ITfFnLMInternal*, LibC::BOOL, LibC::UINT_PTR, LPARAM, HRESULT)
    invoke_func : Proc(ITfFnLMInternal*, ITfContext, Guid*, HRESULT)
    process_lattice : Proc(ITfFnLMInternal*, ITfRange, HRESULT)
  end

  struct ITfFnLMInternal
    lpVtbl : ITfFnLMInternalVTbl*
  end

  struct IEnumTfLatticeElementsVTbl
    query_interface : Proc(IEnumTfLatticeElements*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumTfLatticeElements*, UInt32)
    release : Proc(IEnumTfLatticeElements*, UInt32)
    clone : Proc(IEnumTfLatticeElements*, IEnumTfLatticeElements*, HRESULT)
    next : Proc(IEnumTfLatticeElements*, UInt32, TF_LMLATTELEMENT*, UInt32*, HRESULT)
    reset : Proc(IEnumTfLatticeElements*, HRESULT)
    skip : Proc(IEnumTfLatticeElements*, UInt32, HRESULT)
  end

  struct IEnumTfLatticeElements
    lpVtbl : IEnumTfLatticeElementsVTbl*
  end

  struct ITfLMLatticeVTbl
    query_interface : Proc(ITfLMLattice*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfLMLattice*, UInt32)
    release : Proc(ITfLMLattice*, UInt32)
    query_type : Proc(ITfLMLattice*, Guid*, LibC::BOOL*, HRESULT)
    enum_lattice_elements : Proc(ITfLMLattice*, UInt32, Guid*, IEnumTfLatticeElements*, HRESULT)
  end

  struct ITfLMLattice
    lpVtbl : ITfLMLatticeVTbl*
  end

  struct ITfFnAdviseTextVTbl
    query_interface : Proc(ITfFnAdviseText*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfFnAdviseText*, UInt32)
    release : Proc(ITfFnAdviseText*, UInt32)
    get_display_name : Proc(ITfFnAdviseText*, UInt8**, HRESULT)
    on_text_update : Proc(ITfFnAdviseText*, ITfRange, Char*, Int32, HRESULT)
    on_lattice_update : Proc(ITfFnAdviseText*, ITfRange, ITfLMLattice, HRESULT)
  end

  struct ITfFnAdviseText
    lpVtbl : ITfFnAdviseTextVTbl*
  end

  struct ITfFnSearchCandidateProviderVTbl
    query_interface : Proc(ITfFnSearchCandidateProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfFnSearchCandidateProvider*, UInt32)
    release : Proc(ITfFnSearchCandidateProvider*, UInt32)
    get_display_name : Proc(ITfFnSearchCandidateProvider*, UInt8**, HRESULT)
    get_search_candidates : Proc(ITfFnSearchCandidateProvider*, UInt8*, UInt8*, ITfCandidateList*, HRESULT)
    set_result : Proc(ITfFnSearchCandidateProvider*, UInt8*, UInt8*, UInt8*, HRESULT)
  end

  struct ITfFnSearchCandidateProvider
    lpVtbl : ITfFnSearchCandidateProviderVTbl*
  end

  struct ITfIntegratableCandidateListUIElementVTbl
    query_interface : Proc(ITfIntegratableCandidateListUIElement*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfIntegratableCandidateListUIElement*, UInt32)
    release : Proc(ITfIntegratableCandidateListUIElement*, UInt32)
    set_integration_style : Proc(ITfIntegratableCandidateListUIElement*, Guid, HRESULT)
    get_selection_style : Proc(ITfIntegratableCandidateListUIElement*, TfIntegratableCandidateListSelectionStyle*, HRESULT)
    on_key_down : Proc(ITfIntegratableCandidateListUIElement*, LibC::UINT_PTR, LPARAM, LibC::BOOL*, HRESULT)
    show_candidate_numbers : Proc(ITfIntegratableCandidateListUIElement*, LibC::BOOL*, HRESULT)
    finalize_exact_composition_string : Proc(ITfIntegratableCandidateListUIElement*, HRESULT)
  end

  struct ITfIntegratableCandidateListUIElement
    lpVtbl : ITfIntegratableCandidateListUIElementVTbl*
  end

  struct ITfFnGetPreferredTouchKeyboardLayoutVTbl
    query_interface : Proc(ITfFnGetPreferredTouchKeyboardLayout*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfFnGetPreferredTouchKeyboardLayout*, UInt32)
    release : Proc(ITfFnGetPreferredTouchKeyboardLayout*, UInt32)
    get_display_name : Proc(ITfFnGetPreferredTouchKeyboardLayout*, UInt8**, HRESULT)
    get_layout : Proc(ITfFnGetPreferredTouchKeyboardLayout*, TKBLayoutType*, UInt16*, HRESULT)
  end

  struct ITfFnGetPreferredTouchKeyboardLayout
    lpVtbl : ITfFnGetPreferredTouchKeyboardLayoutVTbl*
  end

  struct ITfFnGetLinguisticAlternatesVTbl
    query_interface : Proc(ITfFnGetLinguisticAlternates*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfFnGetLinguisticAlternates*, UInt32)
    release : Proc(ITfFnGetLinguisticAlternates*, UInt32)
    get_display_name : Proc(ITfFnGetLinguisticAlternates*, UInt8**, HRESULT)
    get_alternates : Proc(ITfFnGetLinguisticAlternates*, ITfRange, ITfCandidateList*, HRESULT)
  end

  struct ITfFnGetLinguisticAlternates
    lpVtbl : ITfFnGetLinguisticAlternatesVTbl*
  end

  struct IUIManagerEventSinkVTbl
    query_interface : Proc(IUIManagerEventSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIManagerEventSink*, UInt32)
    release : Proc(IUIManagerEventSink*, UInt32)
    on_window_opening : Proc(IUIManagerEventSink*, RECT*, HRESULT)
    on_window_opened : Proc(IUIManagerEventSink*, RECT*, HRESULT)
    on_window_updating : Proc(IUIManagerEventSink*, RECT*, HRESULT)
    on_window_updated : Proc(IUIManagerEventSink*, RECT*, HRESULT)
    on_window_closing : Proc(IUIManagerEventSink*, HRESULT)
    on_window_closed : Proc(IUIManagerEventSink*, HRESULT)
  end

  struct IUIManagerEventSink
    lpVtbl : IUIManagerEventSinkVTbl*
  end

  struct ITfInputScopeVTbl
    query_interface : Proc(ITfInputScope*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfInputScope*, UInt32)
    release : Proc(ITfInputScope*, UInt32)
    get_input_scopes : Proc(ITfInputScope*, InputScope**, UInt32*, HRESULT)
    get_phrase : Proc(ITfInputScope*, UInt8***, UInt32*, HRESULT)
    get_regular_expression : Proc(ITfInputScope*, UInt8**, HRESULT)
    get_srgs : Proc(ITfInputScope*, UInt8**, HRESULT)
    get_xml : Proc(ITfInputScope*, UInt8**, HRESULT)
  end

  struct ITfInputScope
    lpVtbl : ITfInputScopeVTbl*
  end

  struct ITfInputScope2VTbl
    query_interface : Proc(ITfInputScope2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfInputScope2*, UInt32)
    release : Proc(ITfInputScope2*, UInt32)
    get_input_scopes : Proc(ITfInputScope2*, InputScope**, UInt32*, HRESULT)
    get_phrase : Proc(ITfInputScope2*, UInt8***, UInt32*, HRESULT)
    get_regular_expression : Proc(ITfInputScope2*, UInt8**, HRESULT)
    get_srgs : Proc(ITfInputScope2*, UInt8**, HRESULT)
    get_xml : Proc(ITfInputScope2*, UInt8**, HRESULT)
    enum_word_list : Proc(ITfInputScope2*, IEnumString*, HRESULT)
  end

  struct ITfInputScope2
    lpVtbl : ITfInputScope2VTbl*
  end

  struct ITfMSAAControlVTbl
    query_interface : Proc(ITfMSAAControl*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfMSAAControl*, UInt32)
    release : Proc(ITfMSAAControl*, UInt32)
    system_enable_msaa : Proc(ITfMSAAControl*, HRESULT)
    system_disable_msaa : Proc(ITfMSAAControl*, HRESULT)
  end

  struct ITfMSAAControl
    lpVtbl : ITfMSAAControlVTbl*
  end

  struct IInternalDocWrapVTbl
    query_interface : Proc(IInternalDocWrap*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInternalDocWrap*, UInt32)
    release : Proc(IInternalDocWrap*, UInt32)
    notify_revoke : Proc(IInternalDocWrap*, HRESULT)
  end

  struct IInternalDocWrap
    lpVtbl : IInternalDocWrapVTbl*
  end

  struct ITextStoreACPExVTbl
    query_interface : Proc(ITextStoreACPEx*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITextStoreACPEx*, UInt32)
    release : Proc(ITextStoreACPEx*, UInt32)
    scroll_to_rect : Proc(ITextStoreACPEx*, Int32, Int32, RECT, UInt32, HRESULT)
  end

  struct ITextStoreACPEx
    lpVtbl : ITextStoreACPExVTbl*
  end

  struct ITextStoreAnchorExVTbl
    query_interface : Proc(ITextStoreAnchorEx*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITextStoreAnchorEx*, UInt32)
    release : Proc(ITextStoreAnchorEx*, UInt32)
    scroll_to_rect : Proc(ITextStoreAnchorEx*, IAnchor, IAnchor, RECT, UInt32, HRESULT)
  end

  struct ITextStoreAnchorEx
    lpVtbl : ITextStoreAnchorExVTbl*
  end

  struct ITextStoreACPSinkExVTbl
    query_interface : Proc(ITextStoreACPSinkEx*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITextStoreACPSinkEx*, UInt32)
    release : Proc(ITextStoreACPSinkEx*, UInt32)
    on_text_change : Proc(ITextStoreACPSinkEx*, TEXT_STORE_TEXT_CHANGE_FLAGS, TS_TEXTCHANGE*, HRESULT)
    on_selection_change : Proc(ITextStoreACPSinkEx*, HRESULT)
    on_layout_change : Proc(ITextStoreACPSinkEx*, TsLayoutCode, UInt32, HRESULT)
    on_status_change : Proc(ITextStoreACPSinkEx*, UInt32, HRESULT)
    on_attrs_change : Proc(ITextStoreACPSinkEx*, Int32, Int32, UInt32, Guid*, HRESULT)
    on_lock_granted : Proc(ITextStoreACPSinkEx*, TEXT_STORE_LOCK_FLAGS, HRESULT)
    on_start_edit_transaction : Proc(ITextStoreACPSinkEx*, HRESULT)
    on_end_edit_transaction : Proc(ITextStoreACPSinkEx*, HRESULT)
    on_disconnect : Proc(ITextStoreACPSinkEx*, HRESULT)
  end

  struct ITextStoreACPSinkEx
    lpVtbl : ITextStoreACPSinkExVTbl*
  end

  struct ITextStoreSinkAnchorExVTbl
    query_interface : Proc(ITextStoreSinkAnchorEx*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITextStoreSinkAnchorEx*, UInt32)
    release : Proc(ITextStoreSinkAnchorEx*, UInt32)
    on_text_change : Proc(ITextStoreSinkAnchorEx*, TEXT_STORE_CHANGE_FLAGS, IAnchor, IAnchor, HRESULT)
    on_selection_change : Proc(ITextStoreSinkAnchorEx*, HRESULT)
    on_layout_change : Proc(ITextStoreSinkAnchorEx*, TsLayoutCode, UInt32, HRESULT)
    on_status_change : Proc(ITextStoreSinkAnchorEx*, UInt32, HRESULT)
    on_attrs_change : Proc(ITextStoreSinkAnchorEx*, IAnchor, IAnchor, UInt32, Guid*, HRESULT)
    on_lock_granted : Proc(ITextStoreSinkAnchorEx*, TEXT_STORE_LOCK_FLAGS, HRESULT)
    on_start_edit_transaction : Proc(ITextStoreSinkAnchorEx*, HRESULT)
    on_end_edit_transaction : Proc(ITextStoreSinkAnchorEx*, HRESULT)
    on_disconnect : Proc(ITextStoreSinkAnchorEx*, HRESULT)
  end

  struct ITextStoreSinkAnchorEx
    lpVtbl : ITextStoreSinkAnchorExVTbl*
  end

  struct IAccDictionaryVTbl
    query_interface : Proc(IAccDictionary*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAccDictionary*, UInt32)
    release : Proc(IAccDictionary*, UInt32)
    get_localized_string : Proc(IAccDictionary*, Guid*, UInt32, UInt8**, UInt32*, HRESULT)
    get_parent_term : Proc(IAccDictionary*, Guid*, Guid*, HRESULT)
    get_mnemonic_string : Proc(IAccDictionary*, Guid*, UInt8**, HRESULT)
    lookup_mnemonic_term : Proc(IAccDictionary*, UInt8*, Guid*, HRESULT)
    convert_value_to_string : Proc(IAccDictionary*, Guid*, UInt32, VARIANT, UInt8**, UInt32*, HRESULT)
  end

  struct IAccDictionary
    lpVtbl : IAccDictionaryVTbl*
  end

  struct IVersionInfoVTbl
    query_interface : Proc(IVersionInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVersionInfo*, UInt32)
    release : Proc(IVersionInfo*, UInt32)
    get_subcomponent_count : Proc(IVersionInfo*, UInt32, UInt32*, HRESULT)
    get_implementation_id : Proc(IVersionInfo*, UInt32, Guid*, HRESULT)
    get_build_version : Proc(IVersionInfo*, UInt32, UInt32*, UInt32*, HRESULT)
    get_component_description : Proc(IVersionInfo*, UInt32, UInt8**, HRESULT)
    get_instance_description : Proc(IVersionInfo*, UInt32, UInt8**, HRESULT)
  end

  struct IVersionInfo
    lpVtbl : IVersionInfoVTbl*
  end

  struct ICoCreateLocallyVTbl
    query_interface : Proc(ICoCreateLocally*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICoCreateLocally*, UInt32)
    release : Proc(ICoCreateLocally*, UInt32)
    co_create_locally : Proc(ICoCreateLocally*, Guid*, UInt32, Guid*, IUnknown*, Guid*, IUnknown, VARIANT, HRESULT)
  end

  struct ICoCreateLocally
    lpVtbl : ICoCreateLocallyVTbl*
  end

  struct ICoCreatedLocallyVTbl
    query_interface : Proc(ICoCreatedLocally*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICoCreatedLocally*, UInt32)
    release : Proc(ICoCreatedLocally*, UInt32)
    local_init : Proc(ICoCreatedLocally*, IUnknown, Guid*, IUnknown, VARIANT, HRESULT)
  end

  struct ICoCreatedLocally
    lpVtbl : ICoCreatedLocallyVTbl*
  end

  struct IAccStoreVTbl
    query_interface : Proc(IAccStore*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAccStore*, UInt32)
    release : Proc(IAccStore*, UInt32)
    register : Proc(IAccStore*, Guid*, IUnknown, HRESULT)
    unregister : Proc(IAccStore*, IUnknown, HRESULT)
    get_documents : Proc(IAccStore*, IEnumUnknown*, HRESULT)
    lookup_by_hwnd : Proc(IAccStore*, LibC::HANDLE, Guid*, IUnknown*, HRESULT)
    lookup_by_point : Proc(IAccStore*, POINT, Guid*, IUnknown*, HRESULT)
    on_document_focus : Proc(IAccStore*, IUnknown, HRESULT)
    get_focused : Proc(IAccStore*, Guid*, IUnknown*, HRESULT)
  end

  struct IAccStore
    lpVtbl : IAccStoreVTbl*
  end

  struct IAccServerDocMgrVTbl
    query_interface : Proc(IAccServerDocMgr*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAccServerDocMgr*, UInt32)
    release : Proc(IAccServerDocMgr*, UInt32)
    new_document : Proc(IAccServerDocMgr*, Guid*, IUnknown, HRESULT)
    revoke_document : Proc(IAccServerDocMgr*, IUnknown, HRESULT)
    on_document_focus : Proc(IAccServerDocMgr*, IUnknown, HRESULT)
  end

  struct IAccServerDocMgr
    lpVtbl : IAccServerDocMgrVTbl*
  end

  struct IAccClientDocMgrVTbl
    query_interface : Proc(IAccClientDocMgr*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAccClientDocMgr*, UInt32)
    release : Proc(IAccClientDocMgr*, UInt32)
    get_documents : Proc(IAccClientDocMgr*, IEnumUnknown*, HRESULT)
    lookup_by_hwnd : Proc(IAccClientDocMgr*, LibC::HANDLE, Guid*, IUnknown*, HRESULT)
    lookup_by_point : Proc(IAccClientDocMgr*, POINT, Guid*, IUnknown*, HRESULT)
    get_focused : Proc(IAccClientDocMgr*, Guid*, IUnknown*, HRESULT)
  end

  struct IAccClientDocMgr
    lpVtbl : IAccClientDocMgrVTbl*
  end

  struct IDocWrapVTbl
    query_interface : Proc(IDocWrap*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDocWrap*, UInt32)
    release : Proc(IDocWrap*, UInt32)
    set_doc : Proc(IDocWrap*, Guid*, IUnknown, HRESULT)
    get_wrapped_doc : Proc(IDocWrap*, Guid*, IUnknown*, HRESULT)
  end

  struct IDocWrap
    lpVtbl : IDocWrapVTbl*
  end

  struct IClonableWrapperVTbl
    query_interface : Proc(IClonableWrapper*, Guid*, Void**, HRESULT)
    add_ref : Proc(IClonableWrapper*, UInt32)
    release : Proc(IClonableWrapper*, UInt32)
    clone_new_wrapper : Proc(IClonableWrapper*, Guid*, Void**, HRESULT)
  end

  struct IClonableWrapper
    lpVtbl : IClonableWrapperVTbl*
  end

  struct ITfSpeechUIServerVTbl
    query_interface : Proc(ITfSpeechUIServer*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITfSpeechUIServer*, UInt32)
    release : Proc(ITfSpeechUIServer*, UInt32)
    initialize : Proc(ITfSpeechUIServer*, HRESULT)
    show_ui : Proc(ITfSpeechUIServer*, LibC::BOOL, HRESULT)
    update_balloon : Proc(ITfSpeechUIServer*, TfLBBalloonStyle, Char*, UInt32, HRESULT)
  end

  struct ITfSpeechUIServer
    lpVtbl : ITfSpeechUIServerVTbl*
  end


  # Params # dwflags : UInt32 [In],heventforservicestop : LibC::HANDLE [In]
  fun DoMsCtfMonitor(dwflags : UInt32, heventforservicestop : LibC::HANDLE) : LibC::BOOL

  # Params # dwflags : UInt32 [In]
  fun InitLocalMsCtfMonitor(dwflags : UInt32) : HRESULT

  # Params # 
  fun UninitLocalMsCtfMonitor : HRESULT
end
